-file("src/lager_crash_log.erl", 1).

-module(lager_crash_log).

-file("include/lager.hrl", 1).

-record(lager_shaper,
	{hwm = undefined  :: undefined | pos_integer(),
	 mps = 0  :: non_neg_integer(),
	 lasttime = os:timestamp()  :: erlang:timestamp(),
	 dropped = 0  :: non_neg_integer()}).

-type lager_shaper() :: #lager_shaper{}.

-file("src/lager_crash_log.erl", 37).

-behaviour(gen_server).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([start_link/5, start/5]).

-record(state,
	{name  :: string(), fd  :: pid() | undefined,
	 inode  :: integer() | undefined,
	 fmtmaxbytes  :: integer(), size  :: integer(),
	 date  :: undefined | string(), count  :: integer(),
	 flap = false  :: boolean()}).

start_link(Filename, MaxBytes, Size, Date, Count) ->
    gen_server:start_link({local, lager_crash_log},
			  lager_crash_log,
			  [Filename, MaxBytes, Size, Date, Count], []).

start(Filename, MaxBytes, Size, Date, Count) ->
    gen_server:start({local, lager_crash_log},
		     lager_crash_log,
		     [Filename, MaxBytes, Size, Date, Count], []).

init([RelFilename, MaxBytes, Size, Date, Count]) ->
    Filename = lager_util:expand_path(RelFilename),
    case lager_util:open_logfile(Filename, false) of
      {ok, {FD, Inode, _}} ->
	  schedule_rotation(Date),
	  {ok,
	   #state{name = Filename, fd = FD, inode = Inode,
		  fmtmaxbytes = MaxBytes, size = Size, count = Count,
		  date = Date}};
      {error, Reason} ->
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
						lager_msg:new(io_lib:format("Failed to open crash log file ~s with "
									    "error: ~s",
									    [Filename,
									     file:format_error(Reason)]),
							      error,
							      [{pid, Self},
							       {line, 81},
							       {file,
								"src/lager_crash_log.erl"},
							       {module,
								lager_crash_log}],
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
						      lager_msg:new(io_lib:format("Failed to open crash log file ~s with "
										  "error: ~s",
										  [Filename,
										   file:format_error(Reason)]),
								    error,
								    [{pid,
								      Self},
								     {line, 81},
								     {file,
								      "src/lager_crash_log.erl"},
								     {module,
								      lager_crash_log}],
								    [])});
				_ -> ok
			      end
			end
		end),
	  {ok,
	   #state{name = Filename, fmtmaxbytes = MaxBytes,
		  flap = true, size = Size, count = Count, date = Date}}
    end.

handle_call({log, _} = Log, _From, State) ->
    {Reply, NewState} = do_log(Log, State),
    {reply, Reply, NewState};
handle_call(_Call, _From, State) -> {reply, ok, State}.

handle_cast({log, _} = Log, State) ->
    {_, NewState} = do_log(Log, State), {noreply, NewState};
handle_cast(_Request, State) -> {noreply, State}.

handle_info(rotate,
	    #state{name = Name, count = Count, date = Date} =
		State) ->
    _ = lager_util:rotate_logfile(Name, Count),
    schedule_rotation(Date),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

schedule_rotation(undefined) -> ok;
schedule_rotation(Date) ->
    erlang:send_after(lager_util:calculate_next_rotation(Date)
			* 1000,
		      self(), rotate),
    ok.

-spec limited_fmt(string(), list(),
		  integer()) -> iolist().

limited_fmt(Fmt, Args, FmtMaxBytes) ->
    lager:safe_format(Fmt, Args, FmtMaxBytes).

limited_str(Term, FmtMaxBytes) ->
    {Str, _} = lager_trunc_io:print(Term, FmtMaxBytes), Str.

other_node_suffix(Pid) when node(Pid) =/= node() ->
    "** at node " ++ atom_to_list(node(Pid)) ++ " **\n";
other_node_suffix(_) -> "".

perhaps_a_sasl_report(error_report, {Pid, Type, Report},
		      FmtMaxBytes) ->
    case lager_stdlib:is_my_error_report(Type) of
      true ->
	  {sasl_type_to_report_head(Type), Pid,
	   sasl_limited_str(Type, Report, FmtMaxBytes), true};
      false -> {ignore, ignore, ignore, false}
    end;
perhaps_a_sasl_report(_, _, _) ->
    {ignore, ignore, ignore, false}.

sasl_type_to_report_head(supervisor_report) ->
    "SUPERVISOR REPORT";
sasl_type_to_report_head(crash_report) ->
    "CRASH REPORT";
sasl_type_to_report_head(progress) -> "PROGRESS REPORT".

sasl_limited_str(supervisor_report, Report,
		 FmtMaxBytes) ->
    Name = lager_stdlib:sup_get(supervisor, Report),
    Context = lager_stdlib:sup_get(errorContext, Report),
    Reason = lager_stdlib:sup_get(reason, Report),
    Offender = lager_stdlib:sup_get(offender, Report),
    FmtString = "     Supervisor: ~p~n     Context:  "
		"  ~p~n     Reason:     ~s~n     Offender: "
		"  ~s~n~n",
    {ReasonStr, _} = lager_trunc_io:print(Reason,
					  FmtMaxBytes),
    {OffenderStr, _} = lager_trunc_io:print(Offender,
					    FmtMaxBytes),
    io_lib:format(FmtString,
		  [Name, Context, ReasonStr, OffenderStr]);
sasl_limited_str(progress, Report, FmtMaxBytes) ->
    [begin
       {Str, _} = lager_trunc_io:print(Data, FmtMaxBytes),
       io_lib:format("    ~16w: ~s~n", [Tag, Str])
     end
     || {Tag, Data} <- Report];
sasl_limited_str(crash_report, Report, FmtMaxBytes) ->
    lager_stdlib:proc_lib_format(Report, FmtMaxBytes).

do_log({log, Event},
       #state{name = Name, fd = FD, inode = Inode, flap = Flap,
	      fmtmaxbytes = FmtMaxBytes, size = RotSize,
	      count = Count} =
	   State) ->
    {ReportStr, Pid, MsgStr, _ErrorP} = case Event of
					  {error, _GL, {Pid1, Fmt, Args}} ->
					      {"ERROR REPORT", Pid1,
					       limited_fmt(Fmt, Args,
							   FmtMaxBytes),
					       true};
					  {error_report, _GL,
					   {Pid1, std_error, Rep}} ->
					      {"ERROR REPORT", Pid1,
					       limited_str(Rep, FmtMaxBytes) ++
						 "\n",
					       true};
					  {error_report, _GL, Other} ->
					      perhaps_a_sasl_report(error_report,
								    Other,
								    FmtMaxBytes);
					  _ -> {ignore, ignore, ignore, false}
					end,
    if ReportStr == ignore -> {ok, State};
       true ->
	   case lager_util:ensure_logfile(Name, FD, Inode, false)
	       of
	     {ok, {_, _, Size}} when RotSize /= 0, Size > RotSize ->
		 _ = lager_util:rotate_logfile(Name, Count),
		 handle_cast({log, Event}, State);
	     {ok, {NewFD, NewInode, _Size}} ->
		 {Date, TS} =
		     lager_util:format_time(lager_stdlib:maybe_utc(erlang:localtime())),
		 Time = [Date, " ", TS, " =", ReportStr, "====\n"],
		 NodeSuffix = other_node_suffix(Pid),
		 Msg = io_lib:format("~s~s~s",
				     [Time, MsgStr, NodeSuffix]),
		 case file:write(NewFD,
				 unicode:characters_to_binary(Msg))
		     of
		   {error, Reason} when Flap == false ->
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
							     lager_msg:new(io_lib:format("Failed to write log message to file "
											 "~s: ~s",
											 [Name,
											  file:format_error(Reason)]),
									   error,
									   [{pid,
									     Self},
									    {line,
									     217},
									    {file,
									     "src/lager_crash_log.erl"},
									    {module,
									     lager_crash_log}],
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
												file:format_error(Reason)]),
										 error,
										 [{pid,
										   Self},
										  {line,
										   217},
										  {file,
										   "src/lager_crash_log.erl"},
										  {module,
										   lager_crash_log}],
										 [])});
					     _ -> ok
					   end
				     end
			     end),
		       {ok,
			State#state{fd = NewFD, inode = NewInode, flap = true}};
		   ok ->
		       {ok,
			State#state{fd = NewFD, inode = NewInode,
				    flap = false}};
		   _ -> {ok, State#state{fd = NewFD, inode = NewInode}}
		 end;
	     {error, Reason} ->
		 case Flap of
		   true -> {ok, State};
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
							     lager_msg:new(io_lib:format("Failed to reopen crash log ~s with error: ~s",
											 [Name,
											  file:format_error(Reason)]),
									   error,
									   [{pid,
									     Self},
									    {line,
									     230},
									    {file,
									     "src/lager_crash_log.erl"},
									    {module,
									     lager_crash_log}],
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
								   lager_msg:new(io_lib:format("Failed to reopen crash log ~s with error: ~s",
											       [Name,
												file:format_error(Reason)]),
										 error,
										 [{pid,
										   Self},
										  {line,
										   230},
										  {file,
										   "src/lager_crash_log.erl"},
										  {module,
										   lager_crash_log}],
										 [])});
					     _ -> ok
					   end
				     end
			     end),
		       {ok, State#state{flap = true}}
		 end
	   end
    end.


