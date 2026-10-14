-file("src/lager_file_backend.erl", 1).

-module(lager_file_backend).

-file("include/lager.hrl", 1).

-record(lager_shaper,
	{hwm = undefined  :: undefined | pos_integer(),
	 mps = 0  :: non_neg_integer(),
	 lasttime = os:timestamp()  :: erlang:timestamp(),
	 dropped = 0  :: non_neg_integer()}).

-type lager_shaper() :: #lager_shaper{}.

-file("src/lager_file_backend.erl", 38).

-behaviour(gen_event).

-export([init/1, handle_call/2, handle_event/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([config_to_id/1]).

-record(state,
	{name  :: string(), level  :: {mask, integer()},
	 fd  :: file:io_device() | undefined,
	 inode  :: integer() | undefined,
	 flap = false  :: boolean(), size = 0  :: integer(),
	 date  :: undefined | string(), count = 10  :: integer(),
	 shaper  :: lager_shaper(), formatter  :: atom(),
	 formatter_config  :: any(),
	 sync_on  :: {mask, integer()},
	 check_interval = 1000  :: non_neg_integer(),
	 sync_interval = 1000  :: non_neg_integer(),
	 sync_size = 1024 * 64  :: non_neg_integer(),
	 last_check = os:timestamp()  :: erlang:timestamp()}).

-type option() :: {file, string()} |
		  {level, lager:log_level()} | {size, non_neg_integer()} |
		  {date, string()} | {count, non_neg_integer()} |
		  {high_water_mark, non_neg_integer()} |
		  {sync_interval, non_neg_integer()} |
		  {sync_size, non_neg_integer()} |
		  {sync_on, lager:log_level()} |
		  {check_interval, non_neg_integer()} |
		  {formatter, atom()} | {formatter_config, term()}.

-spec init([option(), ...]) -> {ok, #state{}} |
			       {error, {fatal, bad_config}}.

init({FileName, LogLevel})
    when is_list(FileName), is_atom(LogLevel) ->
    init([{file, FileName}, {level, LogLevel}]);
init({FileName, LogLevel, Size, Date, Count})
    when is_list(FileName), is_atom(LogLevel) ->
    init([{file, FileName}, {level, LogLevel}, {size, Size},
	  {date, Date}, {count, Count}]);
init([{FileName, LogLevel, Size, Date, Count},
      {Formatter, FormatterConfig}])
    when is_list(FileName), is_atom(LogLevel),
	 is_atom(Formatter) ->
    init([{file, FileName}, {level, LogLevel}, {size, Size},
	  {date, Date}, {count, Count}, {formatter, Formatter},
	  {formatter_config, FormatterConfig}]);
init([LogFile, {Formatter}]) ->
    init([LogFile, {Formatter, []}]);
init([{FileName, LogLevel},
      {Formatter, FormatterConfig}])
    when is_list(FileName), is_atom(LogLevel),
	 is_atom(Formatter) ->
    init([{file, FileName}, {level, LogLevel},
	  {formatter, Formatter},
	  {formatter_config, FormatterConfig}]);
init(LogFileConfig) when is_list(LogFileConfig) ->
    case validate_logfile_proplist(LogFileConfig) of
      false -> {error, {fatal, bad_config}};
      Config ->
	  [RelName, Level, Date, Size, Count, HighWaterMark,
	   SyncInterval, SyncSize, SyncOn, CheckInterval,
	   Formatter, FormatterConfig] =
	      [proplists:get_value(Key, Config)
	       || Key
		      <- [file, level, date, size, count, high_water_mark,
			  sync_interval, sync_size, sync_on, check_interval,
			  formatter, formatter_config]],
	  Name = lager_util:expand_path(RelName),
	  schedule_rotation(Name, Date),
	  Shaper = #lager_shaper{hwm = HighWaterMark},
	  State0 = #state{name = Name, level = Level, size = Size,
			  date = Date, count = Count, shaper = Shaper,
			  formatter = Formatter,
			  formatter_config = FormatterConfig, sync_on = SyncOn,
			  sync_interval = SyncInterval, sync_size = SyncSize,
			  check_interval = CheckInterval},
	  State = case lager_util:open_logfile(Name,
					       {SyncSize, SyncInterval})
		      of
		    {ok, {FD, Inode, _}} ->
			State0#state{fd = FD, inode = Inode};
		    {error, Reason} ->
			Self = self(),
			spawn(fun () ->
				      case catch
					     gen_event:which_handlers(lager_event)
					  of
					X
					    when X == [];
						 X == {'EXIT', noproc};
						 X ==
						   [lager_backend_throttle] ->
					    timer:sleep(500),
					    gen_event:notify(lager_event,
							     {log,
							      lager_msg:new(io_lib:format("Failed to open log file ~s with error ~s",
											  [Name,
											   file:format_error(Reason)]),
									    error,
									    [{pid,
									      Self},
									     {line,
									      123},
									     {file,
									      "src/lager_file_backend.erl"},
									     {module,
									      lager_file_backend}],
									    [])});
					_ ->
					    case lager_util:level_to_num(error)
						   band
						   element(1,
							   lager_config:get(loglevel,
									    {0,
									     []}))
						   /= 0
						of
					      true ->
						  gen_event:notify(lager_event,
								   {log,
								    lager_msg:new(io_lib:format("Failed to open log file ~s with error ~s",
												[Name,
												 file:format_error(Reason)]),
										  error,
										  [{pid,
										    Self},
										   {line,
										    123},
										   {file,
										    "src/lager_file_backend.erl"},
										   {module,
										    lager_file_backend}],
										  [])});
					      _ -> ok
					    end
				      end
			      end),
			State0#state{flap = true}
		  end,
	  {ok, State}
    end.

handle_call({set_loglevel, Level},
	    #state{name = Ident} = State) ->
    case validate_loglevel(Level) of
      false -> {ok, {error, bad_loglevel}, State};
      Levels ->
	  Self = self(),
	  spawn(fun () ->
			case catch gen_event:which_handlers(lager_event) of
			  X
			      when X == [];
				   X == {'EXIT', noproc};
				   X == [lager_backend_throttle] ->
			      timer:sleep(500),
			      gen_event:notify(lager_event,
					       {log,
						lager_msg:new(io_lib:format("Changed loglevel of ~s to ~p",
									    [Ident,
									     Level]),
							      notice,
							      [{pid, Self},
							       {line, 135},
							       {file,
								"src/lager_file_backend.erl"},
							       {module,
								lager_file_backend}],
							      [])});
			  _ ->
			      case lager_util:level_to_num(notice) band
				     element(1,
					     lager_config:get(loglevel,
							      {0, []}))
				     /= 0
				  of
				true ->
				    gen_event:notify(lager_event,
						     {log,
						      lager_msg:new(io_lib:format("Changed loglevel of ~s to ~p",
										  [Ident,
										   Level]),
								    notice,
								    [{pid,
								      Self},
								     {line,
								      135},
								     {file,
								      "src/lager_file_backend.erl"},
								     {module,
								      lager_file_backend}],
								    [])});
				_ -> ok
			      end
			end
		end),
	  {ok, ok, State#state{level = Levels}}
    end;
handle_call(get_loglevel,
	    #state{level = Level} = State) ->
    {ok, Level, State};
handle_call({set_loghwm, Hwm},
	    #state{shaper = Shaper, name = Name} = State) ->
    case validate_logfile_proplist([{file, Name},
				    {high_water_mark, Hwm}])
	of
      false -> {ok, {error, bad_log_hwm}, State};
      _ ->
	  NewShaper = Shaper#lager_shaper{hwm = Hwm},
	  Self = self(),
	  spawn(fun () ->
			case catch gen_event:which_handlers(lager_event) of
			  X
			      when X == [];
				   X == {'EXIT', noproc};
				   X == [lager_backend_throttle] ->
			      timer:sleep(500),
			      gen_event:notify(lager_event,
					       {log,
						lager_msg:new(io_lib:format("Changed loghwm of ~s to ~p",
									    [Name,
									     Hwm]),
							      notice,
							      [{pid, Self},
							       {line, 146},
							       {file,
								"src/lager_file_backend.erl"},
							       {module,
								lager_file_backend}],
							      [])});
			  _ ->
			      case lager_util:level_to_num(notice) band
				     element(1,
					     lager_config:get(loglevel,
							      {0, []}))
				     /= 0
				  of
				true ->
				    gen_event:notify(lager_event,
						     {log,
						      lager_msg:new(io_lib:format("Changed loghwm of ~s to ~p",
										  [Name,
										   Hwm]),
								    notice,
								    [{pid,
								      Self},
								     {line,
								      146},
								     {file,
								      "src/lager_file_backend.erl"},
								     {module,
								      lager_file_backend}],
								    [])});
				_ -> ok
			      end
			end
		end),
	  {ok, {last_loghwm, Shaper#lager_shaper.hwm},
	   State#state{shaper = NewShaper}}
    end;
handle_call(rotate, State = #state{name = File}) ->
    {ok, NewState} = handle_info({rotate, File}, State),
    {ok, ok, NewState};
handle_call(_Request, State) -> {ok, ok, State}.

handle_event({log, Message},
	     #state{name = Name, level = L, shaper = Shaper,
		    formatter = Formatter,
		    formatter_config = FormatConfig} =
		 State) ->
    case lager_util:is_loggable(Message, L,
				{lager_file_backend, Name})
	of
      true ->
	  case lager_util:check_hwm(Shaper) of
	    {true, Drop, #lager_shaper{hwm = Hwm} = NewShaper} ->
		NewState = case Drop > 0 of
			     true ->
				 Report =
				     io_lib:format("lager_file_backend dropped ~p messages "
						   "in the last second that exceeded the "
						   "limit of ~p messages/sec",
						   [Drop, Hwm]),
				 ReportMsg = lager_msg:new(Report, warning, [],
							   []),
				 write(State, lager_msg:timestamp(ReportMsg),
				       lager_msg:severity_as_int(ReportMsg),
				       Formatter:format(ReportMsg,
							FormatConfig));
			     false -> State
			   end,
		{ok,
		 write(NewState#state{shaper = NewShaper},
		       lager_msg:timestamp(Message),
		       lager_msg:severity_as_int(Message),
		       Formatter:format(Message, FormatConfig))};
	    {false, _, NewShaper} ->
		{ok, State#state{shaper = NewShaper}}
	  end;
      false -> {ok, State}
    end;
handle_event(_Event, State) -> {ok, State}.

handle_info({rotate, File},
	    #state{name = File, count = Count, date = Date} =
		State) ->
    _ = lager_util:rotate_logfile(File, Count),
    State1 = close_file(State),
    schedule_rotation(File, Date),
    {ok, State1};
handle_info(_Info, State) -> {ok, State}.

terminate(_Reason, State) -> _ = close_file(State), ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

config_to_id({Name, _Severity}) when is_list(Name) ->
    {lager_file_backend, Name};
config_to_id({Name, _Severity, _Size, _Rotation,
	      _Count}) ->
    {lager_file_backend, Name};
config_to_id([{Name, _Severity, _Size, _Rotation,
	       _Count},
	      _Format]) ->
    {lager_file_backend, Name};
config_to_id([{Name, _Severity}, _Format])
    when is_list(Name) ->
    {lager_file_backend, Name};
config_to_id(Config) ->
    case proplists:get_value(file, Config) of
      undefined -> erlang:error(no_file);
      File -> {lager_file_backend, File}
    end.

write(#state{name = Name, fd = FD, inode = Inode,
	     flap = Flap, size = RotSize, count = Count} =
	  State,
      Timestamp, Level, Msg) ->
    LastCheck = timer:now_diff(Timestamp,
			       State#state.last_check)
		  div 1000,
    case LastCheck >= State#state.check_interval orelse
	   FD == undefined
	of
      true ->
	  case lager_util:ensure_logfile(Name, FD, Inode,
					 {State#state.sync_size,
					  State#state.sync_interval})
	      of
	    {ok, {_, _, Size}} when RotSize /= 0, Size > RotSize ->
		case lager_util:rotate_logfile(Name, Count) of
		  ok -> write(State, Timestamp, Level, Msg);
		  {error, Reason} ->
		      case Flap of
			true -> State;
			_ ->
			    Self = self(),
			    spawn(fun () ->
					  case catch
						 gen_event:which_handlers(lager_event)
					      of
					    X
						when X == [];
						     X == {'EXIT', noproc};
						     X ==
						       [lager_backend_throttle] ->
						timer:sleep(500),
						gen_event:notify(lager_event,
								 {log,
								  lager_msg:new(io_lib:format("Failed to rotate log file ~s with error ~s",
											      [Name,
											       file:format_error(Reason)]),
										error,
										[{pid,
										  Self},
										 {line,
										  239},
										 {file,
										  "src/lager_file_backend.erl"},
										 {module,
										  lager_file_backend}],
										[])});
					    _ ->
						case
						  lager_util:level_to_num(error)
						    band
						    element(1,
							    lager_config:get(loglevel,
									     {0,
									      []}))
						    /= 0
						    of
						  true ->
						      gen_event:notify(lager_event,
								       {log,
									lager_msg:new(io_lib:format("Failed to rotate log file ~s with error ~s",
												    [Name,
												     file:format_error(Reason)]),
										      error,
										      [{pid,
											Self},
										       {line,
											239},
										       {file,
											"src/lager_file_backend.erl"},
										       {module,
											lager_file_backend}],
										      [])});
						  _ -> ok
						end
					  end
				  end),
			    State#state{flap = true}
		      end
		end;
	    {ok, {NewFD, NewInode, _}} ->
		do_write(State#state{last_check = Timestamp, fd = NewFD,
				     inode = NewInode},
			 Level, Msg);
	    {error, Reason} ->
		case Flap of
		  true -> State;
		  _ ->
		      Self = self(),
		      spawn(fun () ->
				    case catch
					   gen_event:which_handlers(lager_event)
					of
				      X
					  when X == [];
					       X == {'EXIT', noproc};
					       X == [lager_backend_throttle] ->
					  timer:sleep(500),
					  gen_event:notify(lager_event,
							   {log,
							    lager_msg:new(io_lib:format("Failed to reopen log file ~s with error ~s",
											[Name,
											 file:format_error(Reason)]),
									  error,
									  [{pid,
									    Self},
									   {line,
									    251},
									   {file,
									    "src/lager_file_backend.erl"},
									   {module,
									    lager_file_backend}],
									  [])});
				      _ ->
					  case lager_util:level_to_num(error)
						 band
						 element(1,
							 lager_config:get(loglevel,
									  {0,
									   []}))
						 /= 0
					      of
					    true ->
						gen_event:notify(lager_event,
								 {log,
								  lager_msg:new(io_lib:format("Failed to reopen log file ~s with error ~s",
											      [Name,
											       file:format_error(Reason)]),
										error,
										[{pid,
										  Self},
										 {line,
										  251},
										 {file,
										  "src/lager_file_backend.erl"},
										 {module,
										  lager_file_backend}],
										[])});
					    _ -> ok
					  end
				    end
			    end),
		      State#state{flap = true}
		end
	  end;
      false -> do_write(State, Level, Msg)
    end.

do_write(#state{fd = FD, name = Name, flap = Flap} =
	     State,
	 Level, Msg) ->
    _ = file:write(FD, unicode:characters_to_binary(Msg)),
    {mask, SyncLevel} = State#state.sync_on,
    case Level band SyncLevel /= 0 of
      true ->
	  Flap2 = case file:datasync(FD) of
		    {error, Reason2} when Flap == false ->
			Self = self(),
			spawn(fun () ->
				      case catch
					     gen_event:which_handlers(lager_event)
					  of
					X
					    when X == [];
						 X == {'EXIT', noproc};
						 X ==
						   [lager_backend_throttle] ->
					    timer:sleep(500),
					    gen_event:notify(lager_event,
							     {log,
							      lager_msg:new(io_lib:format("Failed to write log message to file "
											  "~s: ~s",
											  [Name,
											   file:format_error(Reason2)]),
									    error,
									    [{pid,
									      Self},
									     {line,
									      268},
									     {file,
									      "src/lager_file_backend.erl"},
									     {module,
									      lager_file_backend}],
									    [])});
					_ ->
					    case lager_util:level_to_num(error)
						   band
						   element(1,
							   lager_config:get(loglevel,
									    {0,
									     []}))
						   /= 0
						of
					      true ->
						  gen_event:notify(lager_event,
								   {log,
								    lager_msg:new(io_lib:format("Failed to write log message to file "
												"~s: ~s",
												[Name,
												 file:format_error(Reason2)]),
										  error,
										  [{pid,
										    Self},
										   {line,
										    268},
										   {file,
										    "src/lager_file_backend.erl"},
										   {module,
										    lager_file_backend}],
										  [])});
					      _ -> ok
					    end
				      end
			      end),
			true;
		    ok -> false;
		    _ -> Flap
		  end,
	  State#state{flap = Flap2};
      _ -> State
    end.

validate_loglevel(Level) ->
    try lager_util:config_to_mask(Level) of
      Levels -> Levels
    catch
      _:_ -> false
    end.

validate_logfile_proplist(List) ->
    try validate_logfile_proplist(List, []) of
      Res ->
	  case proplists:get_value(file, Res) of
	    undefined ->
		Self = self(),
		spawn(fun () ->
			      case catch gen_event:which_handlers(lager_event)
				  of
				X
				    when X == [];
					 X == {'EXIT', noproc};
					 X == [lager_backend_throttle] ->
				    timer:sleep(500),
				    gen_event:notify(lager_event,
						     {log,
						      lager_msg:new(io_lib:format("Missing required file option",
										  []),
								    error,
								    [{pid,
								      Self},
								     {line,
								      295},
								     {file,
								      "src/lager_file_backend.erl"},
								     {module,
								      lager_file_backend}],
								    [])});
				_ ->
				    case lager_util:level_to_num(error) band
					   element(1,
						   lager_config:get(loglevel,
								    {0, []}))
					   /= 0
					of
				      true ->
					  gen_event:notify(lager_event,
							   {log,
							    lager_msg:new(io_lib:format("Missing required file option",
											[]),
									  error,
									  [{pid,
									    Self},
									   {line,
									    295},
									   {file,
									    "src/lager_file_backend.erl"},
									   {module,
									    lager_file_backend}],
									  [])});
				      _ -> ok
				    end
			      end
		      end),
		false;
	    _File ->
		{ok, DefaultRotationDate} =
		    lager_util:parse_rotation_date_spec("$D0"),
		lists:keymerge(1, lists:sort(Res),
			       lists:sort([{level, validate_loglevel(info)},
					   {date, DefaultRotationDate},
					   {size, 10485760}, {count, 5},
					   {sync_on, validate_loglevel(error)},
					   {sync_interval, 1000},
					   {sync_size, 1024 * 64},
					   {check_interval, 1000},
					   {formatter, lager_default_formatter},
					   {formatter_config, []}]))
	  end
    catch
      {bad_config, Msg, Value} ->
	  Self = self(),
	  spawn(fun () ->
			case catch gen_event:which_handlers(lager_event) of
			  X
			      when X == [];
				   X == {'EXIT', noproc};
				   X == [lager_backend_throttle] ->
			      timer:sleep(500),
			      gen_event:notify(lager_event,
					       {log,
						lager_msg:new(io_lib:format("~s ~p for file ~p",
									    [Msg,
									     Value,
									     proplists:get_value(file,
												 List)]),
							      error,
							      [{pid, Self},
							       {line, 310},
							       {file,
								"src/lager_file_backend.erl"},
							       {module,
								lager_file_backend}],
							      [])});
			  _ ->
			      case lager_util:level_to_num(error) band
				     element(1,
					     lager_config:get(loglevel,
							      {0, []}))
				     /= 0
				  of
				true ->
				    gen_event:notify(lager_event,
						     {log,
						      lager_msg:new(io_lib:format("~s ~p for file ~p",
										  [Msg,
										   Value,
										   proplists:get_value(file,
												       List)]),
								    error,
								    [{pid,
								      Self},
								     {line,
								      310},
								     {file,
								      "src/lager_file_backend.erl"},
								     {module,
								      lager_file_backend}],
								    [])});
				_ -> ok
			      end
			end
		end),
	  false
    end.

validate_logfile_proplist([], Acc) -> Acc;
validate_logfile_proplist([{file, File} | Tail], Acc) ->
    validate_logfile_proplist(Tail, [{file, File} | Acc]);
validate_logfile_proplist([{level, Level} | Tail],
			  Acc) ->
    case validate_loglevel(Level) of
      false -> throw({bad_config, "Invalid loglevel", Level});
      Res ->
	  validate_logfile_proplist(Tail, [{level, Res} | Acc])
    end;
validate_logfile_proplist([{size, Size} | Tail], Acc) ->
    case Size of
      S when is_integer(S), S >= 0 ->
	  validate_logfile_proplist(Tail, [{size, Size} | Acc]);
      _ -> throw({bad_config, "Invalid rotation size", Size})
    end;
validate_logfile_proplist([{count, Count} | Tail],
			  Acc) ->
    case Count of
      C when is_integer(C), C >= 0 ->
	  validate_logfile_proplist(Tail, [{count, Count} | Acc]);
      _ ->
	  throw({bad_config, "Invalid rotation count", Count})
    end;
validate_logfile_proplist([{high_water_mark,
			    HighWaterMark}
			   | Tail],
			  Acc) ->
    case HighWaterMark of
      Hwm when is_integer(Hwm), Hwm >= 0 ->
	  validate_logfile_proplist(Tail,
				    [{high_water_mark, Hwm} | Acc]);
      _ ->
	  throw({bad_config, "Invalid high water mark",
		 HighWaterMark})
    end;
validate_logfile_proplist([{date, Date} | Tail], Acc) ->
    case lager_util:parse_rotation_date_spec(Date) of
      {ok, Spec} ->
	  validate_logfile_proplist(Tail, [{date, Spec} | Acc]);
      {error, _} when Date == "" ->
	  validate_logfile_proplist(Tail,
				    [{date, undefined} | Acc]);
      {error, _} ->
	  throw({bad_config, "Invalid rotation date", Date})
    end;
validate_logfile_proplist([{sync_interval, SyncInt}
			   | Tail],
			  Acc) ->
    case SyncInt of
      Val when is_integer(Val), Val >= 0 ->
	  validate_logfile_proplist(Tail,
				    [{sync_interval, Val} | Acc]);
      _ ->
	  throw({bad_config, "Invalid sync interval", SyncInt})
    end;
validate_logfile_proplist([{sync_size, SyncSize}
			   | Tail],
			  Acc) ->
    case SyncSize of
      Val when is_integer(Val), Val >= 0 ->
	  validate_logfile_proplist(Tail,
				    [{sync_size, Val} | Acc]);
      _ -> throw({bad_config, "Invalid sync size", SyncSize})
    end;
validate_logfile_proplist([{check_interval, CheckInt}
			   | Tail],
			  Acc) ->
    case CheckInt of
      Val when is_integer(Val), Val >= 0 ->
	  validate_logfile_proplist(Tail,
				    [{check_interval, Val} | Acc]);
      always ->
	  validate_logfile_proplist(Tail,
				    [{check_interval, 0} | Acc]);
      _ ->
	  throw({bad_config, "Invalid check interval", CheckInt})
    end;
validate_logfile_proplist([{sync_on, Level} | Tail],
			  Acc) ->
    case validate_loglevel(Level) of
      false ->
	  throw({bad_config, "Invalid sync on level", Level});
      Res ->
	  validate_logfile_proplist(Tail, [{sync_on, Res} | Acc])
    end;
validate_logfile_proplist([{formatter, Fmt} | Tail],
			  Acc) ->
    case is_atom(Fmt) of
      true ->
	  validate_logfile_proplist(Tail,
				    [{formatter, Fmt} | Acc]);
      false ->
	  throw({bad_config, "Invalid formatter module", Fmt})
    end;
validate_logfile_proplist([{formatter_config, FmtCfg}
			   | Tail],
			  Acc) ->
    case is_list(FmtCfg) of
      true ->
	  validate_logfile_proplist(Tail,
				    [{formatter_config, FmtCfg} | Acc]);
      false ->
	  throw({bad_config, "Invalid formatter config", FmtCfg})
    end;
validate_logfile_proplist([Other | _Tail], _Acc) ->
    throw({bad_config, "Invalid option", Other}).

schedule_rotation(_, undefined) -> ok;
schedule_rotation(Name, Date) ->
    erlang:send_after(lager_util:calculate_next_rotation(Date)
			* 1000,
		      self(), {rotate, Name}),
    ok.

close_file(#state{fd = undefined} = State) -> State;
close_file(#state{fd = FD} = State) ->
    _ = file:datasync(FD),
    _ = file:close(FD),
    State#state{fd = undefined}.


