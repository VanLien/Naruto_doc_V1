-file("src/error_logger_lager_h.erl", 1).

-module(error_logger_lager_h).

-file("include/lager.hrl", 1).

-record(lager_shaper,
	{hwm = undefined  :: undefined | pos_integer(),
	 mps = 0  :: non_neg_integer(),
	 lasttime = os:timestamp()  :: erlang:timestamp(),
	 dropped = 0  :: non_neg_integer()}).

-type lager_shaper() :: #lager_shaper{}.

-file("src/error_logger_lager_h.erl", 27).

-behaviour(gen_event).

-export([set_high_water/1]).

-export([init/1, handle_call/2, handle_event/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([format_reason/1, format_mfa/1, format_args/3]).

-record(state,
	{sink  :: atom(), shaper  :: lager_shaper(),
	 groupleader_strategy  :: handle | ignore | mirror,
	 raw  :: boolean()}).

set_high_water(N) ->
    gen_event:call(error_logger, error_logger_lager_h,
		   {set_high_water, N}, infinity).

-spec init(any()) -> {ok, #state{}}.

init([HighWaterMark, GlStrategy]) ->
    Shaper = #lager_shaper{hwm = HighWaterMark},
    Raw = lager_app:get_env(lager, error_logger_format_raw,
			    false),
    Sink = configured_sink(),
    {ok,
     #state{sink = Sink, shaper = Shaper,
	    groupleader_strategy = GlStrategy, raw = Raw}}.

handle_call({set_high_water, N},
	    #state{shaper = Shaper} = State) ->
    NewShaper = Shaper#lager_shaper{hwm = N},
    {ok, ok, State#state{shaper = NewShaper}};
handle_call(_Request, State) ->
    {ok, unknown_call, State}.

handle_event(Event,
	     #state{sink = Sink, shaper = Shaper} = State) ->
    case lager_util:check_hwm(Shaper) of
      {true, 0, NewShaper} ->
	  eval_gl(Event, State#state{shaper = NewShaper});
      {true, Drop, #lager_shaper{hwm = Hwm} = NewShaper}
	  when Drop > 0 ->
	  case lager_util:level_to_num(warning) band
		 element(1, lager_config:get({Sink, loglevel}, {0, []}))
		 /= 0
	      of
	    true ->
		_ = lager:log(Sink, warning, self(),
			      "lager_error_logger_h dropped ~p messages "
			      "in the last second that exceeded the "
			      "limit of ~p messages/sec",
			      [Drop, Hwm]),
		ok;
	    _ -> ok
	  end,
	  eval_gl(Event, State#state{shaper = NewShaper});
      {false, _, NewShaper} ->
	  {ok, State#state{shaper = NewShaper}}
    end.

handle_info(_Info, State) -> {ok, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, {state, Shaper, GLStrategy},
	    _Extra) ->
    Raw = lager_app:get_env(lager, error_logger_format_raw,
			    false),
    {ok,
     #state{sink = configured_sink(), shaper = Shaper,
	    groupleader_strategy = GLStrategy, raw = Raw}};
code_change(_OldVsn, {state, Sink, Shaper, GLS},
	    _Extra) ->
    Raw = lager_app:get_env(lager, error_logger_format_raw,
			    false),
    {ok,
     #state{sink = Sink, shaper = Shaper,
	    groupleader_strategy = GLS, raw = Raw}};
code_change(_OldVsn, State, _Extra) -> {ok, State}.

configured_sink() ->
    case proplists:get_value(error_logger_lager_event,
			     lager_app:get_env(lager, extra_sinks, []))
	of
      undefined -> lager_event;
      _ -> error_logger_lager_event
    end.

eval_gl(Event,
	#state{groupleader_strategy = GlStrategy0} = State)
    when is_pid(element(2, Event)) ->
    case element(2, Event) of
      GL when node(GL) =/= node(), GlStrategy0 =:= ignore ->
	  gen_event:notify({error_logger, node(GL)}, Event),
	  {ok, State};
      GL when node(GL) =/= node(), GlStrategy0 =:= mirror ->
	  gen_event:notify({error_logger, node(GL)}, Event),
	  log_event(Event, State);
      _ -> log_event(Event, State)
    end;
eval_gl(Event, State) -> log_event(Event, State).

log_event(Event, #state{sink = Sink} = State) ->
    case Event of
      {error, _GL, {Pid, Fmt, Args}} ->
	  FormatRaw = State#state.raw,
	  case {FormatRaw, Fmt} of
	    {false, "** Generic server " ++ _} ->
		[Name, _Msg, _State, Reason] = Args,
		gen_server:cast(lager_crash_log, {log, Event}),
		{Md, Formatted} = format_reason_md(Reason),
		case lager_util:level_to_num(error) band
		       element(1, lager_config:get({Sink, loglevel}, {0, []}))
		       /= 0
		    of
		  true ->
		      _ = lager:log(Sink, error,
				    [{pid, Pid}, {name, Name} | Md],
				    "gen_server ~w terminated with reason: ~s",
				    [Name, Formatted]),
		      ok;
		  _ -> ok
		end;
	    {false, "** State machine " ++ _} ->
		{Type, Name, StateName, Reason} = case Args of
						    [TName, _Msg, TStateName,
						     _StateData, TReason] ->
							{gen_fsm, TName,
							 TStateName, TReason};
						    [TName, _Msg,
						     {TStateName, _StateData},
						     _ExitType, TReason,
						     _FsmType, Stacktrace] ->
							{gen_statem, TName,
							 TStateName,
							 {TReason, Stacktrace}}
						  end,
		{Md, Formatted} = format_reason_md(Reason),
		gen_server:cast(lager_crash_log, {log, Event}),
		case lager_util:level_to_num(error) band
		       element(1, lager_config:get({Sink, loglevel}, {0, []}))
		       /= 0
		    of
		  true ->
		      _ = lager:log(Sink, error,
				    [{pid, Pid}, {name, Name} | Md],
				    "~s ~w in state ~w terminated with reason: ~s",
				    [Type, Name, StateName, Formatted]),
		      ok;
		  _ -> ok
		end;
	    {false, "** gen_event handler" ++ _} ->
		[ID, Name, _Msg, _State, Reason] = Args,
		{Md, Formatted} = format_reason_md(Reason),
		gen_server:cast(lager_crash_log, {log, Event}),
		case lager_util:level_to_num(error) band
		       element(1, lager_config:get({Sink, loglevel}, {0, []}))
		       /= 0
		    of
		  true ->
		      _ = lager:log(Sink, error,
				    [{pid, Pid}, {name, Name} | Md],
				    "gen_event ~w installed in ~w terminated "
				    "with reason: ~s",
				    [ID, Name, Formatted]),
		      ok;
		  _ -> ok
		end;
	    {false, "** Cowboy handler" ++ _} ->
		gen_server:cast(lager_crash_log, {log, Event}),
		case Args of
		  [Module, Function, Arity, _Request, _State] ->
		      case lager_util:level_to_num(error) band
			     element(1,
				     lager_config:get({Sink, loglevel},
						      {0, []}))
			     /= 0
			  of
			true ->
			    _ = lager:log(Sink, error, Pid,
					  "Cowboy handler ~p terminated with reason: "
					  "call to undefined function ~p:~p/~p",
					  [Module, Module, Function, Arity]),
			    ok;
			_ -> ok
		      end;
		  [Module, Function, Arity, _Class, Reason | Tail] ->
		      StackTrace = lists:last(Tail),
		      {Md, Formatted} = format_reason_md({Reason,
							  StackTrace}),
		      case lager_util:level_to_num(error) band
			     element(1,
				     lager_config:get({Sink, loglevel},
						      {0, []}))
			     /= 0
			  of
			true ->
			    _ = lager:log(Sink, error, [{pid, Pid} | Md],
					  "Cowboy handler ~p terminated in ~p:~p/~p "
					  "with reason: ~s",
					  [Module, Module, Function, Arity,
					   Formatted]),
			    ok;
			_ -> ok
		      end
		end;
	    {false, "Ranch listener " ++ _} ->
		gen_server:cast(lager_crash_log, {log, Event}),
		case Args of
		  [Ref, _Protocol, Worker,
		   {[{reason, Reason}, {mfa, {Module, Function, Arity}},
		     {stacktrace, StackTrace}
		     | _],
		    _}] ->
		      {Md, Formatted} = format_reason_md({Reason,
							  StackTrace}),
		      case lager_util:level_to_num(error) band
			     element(1,
				     lager_config:get({Sink, loglevel},
						      {0, []}))
			     /= 0
			  of
			true ->
			    _ = lager:log(Sink, error, [{pid, Worker} | Md],
					  "Ranch listener ~p terminated in ~p:~p/~p "
					  "with reason: ~s",
					  [Ref, Module, Function, Arity,
					   Formatted]),
			    ok;
			_ -> ok
		      end;
		  [Ref, _Protocol, Worker, Reason] ->
		      {Md, Formatted} = format_reason_md(Reason),
		      case lager_util:level_to_num(error) band
			     element(1,
				     lager_config:get({Sink, loglevel},
						      {0, []}))
			     /= 0
			  of
			true ->
			    _ = lager:log(Sink, error, [{pid, Worker} | Md],
					  "Ranch listener ~p terminated with reason: ~s",
					  [Ref, Formatted]),
			    ok;
			_ -> ok
		      end;
		  [Ref, Protocol, Ret] ->
		      {Md, Formatted} = format_reason_md(Ret),
		      case lager_util:level_to_num(error) band
			     element(1,
				     lager_config:get({Sink, loglevel},
						      {0, []}))
			     /= 0
			  of
			true ->
			    _ = lager:log(Sink, error, [{pid, Protocol} | Md],
					  "Ranch listener ~p terminated with result:~s",
					  [Ref, Formatted]),
			    ok;
			_ -> ok
		      end
		end;
	    {false, "webmachine error" ++ _} ->
		gen_server:cast(lager_crash_log, {log, Event}),
		[Path, Error] = Args,
		StackTrace = case Error of
			       {error, {error, Reason, Stack}} ->
				   {Reason, Stack};
			       _ -> Error
			     end,
		{Md, Formatted} = format_reason_md(StackTrace),
		case lager_util:level_to_num(error) band
		       element(1, lager_config:get({Sink, loglevel}, {0, []}))
		       /= 0
		    of
		  true ->
		      _ = lager:log(Sink, error, [{pid, Pid} | Md],
				    "Webmachine error at path ~p : ~s",
				    [Path, Formatted]),
		      ok;
		  _ -> ok
		end;
	    _ ->
		gen_server:cast(lager_crash_log, {log, Event}),
		case lager_util:level_to_num(error) band
		       element(1, lager_config:get({Sink, loglevel}, {0, []}))
		       /= 0
		    of
		  true -> _ = lager:log(Sink, error, Pid, Fmt, Args), ok;
		  _ -> ok
		end
	  end;
      {error_report, _GL, {Pid, std_error, D}} ->
	  gen_server:cast(lager_crash_log, {log, Event}),
	  case lager_util:level_to_num(error) band
		 element(1, lager_config:get({Sink, loglevel}, {0, []}))
		 /= 0
	      of
	    true ->
		_ = lager:log(Sink, error, Pid, print_silly_list(D),
			      []),
		ok;
	    _ -> ok
	  end;
      {error_report, _GL, {Pid, supervisor_report, D}} ->
	  gen_server:cast(lager_crash_log, {log, Event}),
	  case lists:sort(D) of
	    [{errorContext, Ctx}, {offender, Off}, {reason, Reason},
	     {supervisor, Name}] ->
		Offender = format_offender(Off),
		{Md, Formatted} = format_reason_md(Reason),
		case lager_util:level_to_num(error) band
		       element(1, lager_config:get({Sink, loglevel}, {0, []}))
		       /= 0
		    of
		  true ->
		      _ = lager:log(Sink, error, [{pid, Pid} | Md],
				    "Supervisor ~w had child ~s exit with "
				    "reason ~s in context ~w",
				    [supervisor_name(Name), Offender, Formatted,
				     Ctx]),
		      ok;
		  _ -> ok
		end;
	    _ ->
		case lager_util:level_to_num(error) band
		       element(1, lager_config:get({Sink, loglevel}, {0, []}))
		       /= 0
		    of
		  true ->
		      _ = lager:log(Sink, error, Pid,
				    "SUPERVISOR REPORT " ++ print_silly_list(D),
				    []),
		      ok;
		  _ -> ok
		end
	  end;
      {error_report, _GL,
       {Pid, crash_report, [Self, Neighbours]}} ->
	  gen_server:cast(lager_crash_log, {log, Event}),
	  {Md, Formatted} = format_crash_report(Self, Neighbours),
	  case lager_util:level_to_num(error) band
		 element(1, lager_config:get({Sink, loglevel}, {0, []}))
		 /= 0
	      of
	    true ->
		_ = lager:log(Sink, error, [{pid, Pid} | Md],
			      "CRASH REPORT " ++ Formatted, []),
		ok;
	    _ -> ok
	  end;
      {warning_msg, _GL, {Pid, Fmt, Args}} ->
	  case lager_util:level_to_num(warning) band
		 element(1, lager_config:get({Sink, loglevel}, {0, []}))
		 /= 0
	      of
	    true ->
		_ = lager:log(Sink, warning, Pid, Fmt, Args), ok;
	    _ -> ok
	  end;
      {warning_report, _GL, {Pid, std_warning, Report}} ->
	  case lager_util:level_to_num(warning) band
		 element(1, lager_config:get({Sink, loglevel}, {0, []}))
		 /= 0
	      of
	    true ->
		_ = lager:log(Sink, warning, Pid,
			      print_silly_list(Report), []),
		ok;
	    _ -> ok
	  end;
      {info_msg, _GL, {Pid, Fmt, Args}} ->
	  case lager_util:level_to_num(info) band
		 element(1, lager_config:get({Sink, loglevel}, {0, []}))
		 /= 0
	      of
	    true -> _ = lager:log(Sink, info, Pid, Fmt, Args), ok;
	    _ -> ok
	  end;
      {info_report, _GL, {Pid, std_info, D}}
	  when is_list(D) ->
	  Details = lists:sort(D),
	  case Details of
	    [{application, App}, {exited, Reason}, {type, _Type}] ->
		case application:get_env(lager,
					 suppress_application_start_stop)
		    of
		  {ok, true} when Reason == stopped -> ok;
		  _ ->
		      {Md, Formatted} = format_reason_md(Reason),
		      case lager_util:level_to_num(info) band
			     element(1,
				     lager_config:get({Sink, loglevel},
						      {0, []}))
			     /= 0
			  of
			true ->
			    _ = lager:log(Sink, info, [{pid, Pid} | Md],
					  "Application ~w exited with reason: ~s",
					  [App, Formatted]),
			    ok;
			_ -> ok
		      end
		end;
	    _ ->
		case lager_util:level_to_num(info) band
		       element(1, lager_config:get({Sink, loglevel}, {0, []}))
		       /= 0
		    of
		  true ->
		      _ = lager:log(Sink, info, Pid, print_silly_list(D), []),
		      ok;
		  _ -> ok
		end
	  end;
      {info_report, _GL, {Pid, std_info, D}} ->
	  case lager_util:level_to_num(info) band
		 element(1, lager_config:get({Sink, loglevel}, {0, []}))
		 /= 0
	      of
	    true -> _ = lager:log(Sink, info, Pid, "~w", [D]), ok;
	    _ -> ok
	  end;
      {info_report, _GL, {P, progress, D}} ->
	  Details = lists:sort(D),
	  case Details of
	    [{application, App}, {started_at, Node}] ->
		case application:get_env(lager,
					 suppress_application_start_stop)
		    of
		  {ok, true} -> ok;
		  _ ->
		      case lager_util:level_to_num(info) band
			     element(1,
				     lager_config:get({Sink, loglevel},
						      {0, []}))
			     /= 0
			  of
			true ->
			    _ = lager:log(Sink, info, P,
					  "Application ~w started on node ~w",
					  [App, Node]),
			    ok;
			_ -> ok
		      end
		end;
	    [{started, Started}, {supervisor, Name}] ->
		case lager_app:get_env(lager,
				       suppress_supervisor_start_stop, false)
		    of
		  true -> ok;
		  _ ->
		      MFA = format_mfa(get_value(mfargs, Started)),
		      Pid = get_value(pid, Started),
		      case lager_util:level_to_num(debug) band
			     element(1,
				     lager_config:get({Sink, loglevel},
						      {0, []}))
			     /= 0
			  of
			true ->
			    _ = lager:log(Sink, debug, P,
					  "Supervisor ~w started ~s at pid ~w",
					  [supervisor_name(Name), MFA, Pid]),
			    ok;
			_ -> ok
		      end
		end;
	    _ ->
		case lager_util:level_to_num(info) band
		       element(1, lager_config:get({Sink, loglevel}, {0, []}))
		       /= 0
		    of
		  true ->
		      _ = lager:log(Sink, info, P,
				    "PROGRESS REPORT " ++ print_silly_list(D),
				    []),
		      ok;
		  _ -> ok
		end
	  end;
      _ ->
	  case lager_util:level_to_num(warning) band
		 element(1, lager_config:get({Sink, loglevel}, {0, []}))
		 /= 0
	      of
	    true ->
		_ = lager:log(Sink, warning, self(),
			      "Unexpected error_logger event ~w", [Event]),
		ok;
	    _ -> ok
	  end
    end,
    {ok, State}.

format_crash_report(Report, Neighbours) ->
    Name = case get_value(registered_name, Report, []) of
	     [] -> get_value(pid, Report);
	     Atom -> Atom
	   end,
    Md0 = case get_value(dictionary, Report, []) of
	    [] -> [];
	    Dict -> get_value('_lager_metadata', Dict, [])
	  end,
    {Class, Reason, Trace} = get_value(error_info, Report),
    {Md, ReasonStr} = format_reason_md({Reason, Trace}),
    Type = case Class of
	     exit -> "exited";
	     _ -> "crashed"
	   end,
    {Md0 ++ Md,
     io_lib:format("Process ~w with ~w neighbours ~s with "
		   "reason: ~s",
		   [Name, length(Neighbours), Type, ReasonStr])}.

format_offender(Off) ->
    case get_value(mfargs, Off) of
      undefined ->
	  io_lib:format("at module ~w at ~w",
			[get_value(mod, Off), get_value(pid, Off)]);
      MFArgs ->
	  {_, MFA} = format_mfa_md(MFArgs),
	  Name = case get_value(id, Off) of
		   undefined -> get_value(name, Off);
		   Id -> Id
		 end,
	  io_lib:format("~p started with ~s at ~w",
			[Name, MFA, get_value(pid, Off)])
    end.

format_reason(Reason) ->
    element(2, format_reason_md(Reason)).

-spec format_reason_md(Stacktrace ::
			   any()) -> {Metadata :: [{atom(), any()}],
				      String :: list()}.

format_reason_md({'function not exported',
		  [{M, F, A}, MFA | _]}) ->
    {Md, Formatted} = format_mfa_md(MFA),
    {_, Formatted2} = format_mfa_md({M, F, length(A)}),
    {[{reason, 'function not exported'} | Md],
     ["call to undefined function ", Formatted2, " from ",
      Formatted]};
format_reason_md({'function not exported',
		  [{M, F, A, _Props}, MFA | _]}) ->
    {Md, Formatted} = format_mfa_md(MFA),
    {_, Formatted2} = format_mfa_md({M, F, length(A)}),
    {[{reason, 'function not exported'} | Md],
     ["call to undefined function ", Formatted2, " from ",
      Formatted]};
format_reason_md({undef, [MFA | _]}) ->
    {Md, Formatted} = format_mfa_md(MFA),
    {[{reason, undef} | Md],
     ["call to undefined function ", Formatted]};
format_reason_md({bad_return,
		  {_MFA, {'EXIT', Reason}}}) ->
    format_reason_md(Reason);
format_reason_md({bad_return, {MFA, Val}}) ->
    {Md, Formatted} = format_mfa_md(MFA),
    {[{reason, bad_return} | Md],
     ["bad return value ", print_val(Val), " from ",
      Formatted]};
format_reason_md({bad_return_value, Val}) ->
    {[{reason, bad_return}],
     ["bad return value: ", print_val(Val)]};
format_reason_md({{bad_return_value, Val}, MFA}) ->
    {Md, Formatted} = format_mfa_md(MFA),
    {[{reason, bad_return_value} | Md],
     ["bad return value: ", print_val(Val), " in ",
      Formatted]};
format_reason_md({{badrecord, Record}, [MFA | _]}) ->
    {Md, Formatted} = format_mfa_md(MFA),
    {[{reason, badrecord} | Md],
     ["bad record ", print_val(Record), " in ", Formatted]};
format_reason_md({{case_clause, Val}, [MFA | _]}) ->
    {Md, Formatted} = format_mfa_md(MFA),
    {[{reason, case_clause} | Md],
     ["no case clause matching ", print_val(Val), " in ",
      Formatted]};
format_reason_md({function_clause, [MFA | _]}) ->
    {Md, Formatted} = format_mfa_md(MFA),
    {[{reason, function_clause} | Md],
     ["no function clause matching ", Formatted]};
format_reason_md({if_clause, [MFA | _]}) ->
    {Md, Formatted} = format_mfa_md(MFA),
    {[{reason, if_clause} | Md],
     ["no true branch found while evaluating "
      "if expression in ",
      Formatted]};
format_reason_md({{try_clause, Val}, [MFA | _]}) ->
    {Md, Formatted} = format_mfa_md(MFA),
    {[{reason, try_clause} | Md],
     ["no try clause matching ", print_val(Val), " in ",
      Formatted]};
format_reason_md({badarith, [MFA | _]}) ->
    {Md, Formatted} = format_mfa_md(MFA),
    {[{reason, badarith} | Md],
     ["bad arithmetic expression in ", Formatted]};
format_reason_md({{badmatch, Val}, [MFA | _]}) ->
    {Md, Formatted} = format_mfa_md(MFA),
    {[{reason, badmatch} | Md],
     ["no match of right hand value ", print_val(Val),
      " in ", Formatted]};
format_reason_md({emfile, _Trace}) ->
    {[{reason, emfile}],
     "maximum number of file descriptors exhausted, "
     "check ulimit -n"};
format_reason_md({system_limit,
		  [{M, F, _} | _] = Trace}) ->
    Limit = case {M, F} of
	      {erlang, open_port} ->
		  "maximum number of ports exceeded";
	      {erlang, spawn} ->
		  "maximum number of processes exceeded";
	      {erlang, spawn_opt} ->
		  "maximum number of processes exceeded";
	      {erlang, list_to_atom} ->
		  "tried to create an atom larger than "
		  "255, or maximum atom count exceeded";
	      {ets, new} -> "maximum number of ETS tables exceeded";
	      _ -> {Str, _} = lager_trunc_io:print(Trace, 500), Str
	    end,
    {[{reason, system_limit}], ["system limit: ", Limit]};
format_reason_md({badarg, [MFA, MFA2 | _]}) ->
    case MFA of
      {_M, _F, A, _Props} when is_list(A) ->
	  {Md, Formatted} = format_mfa_md(MFA2),
	  {_, Formatted2} = format_mfa_md(MFA),
	  {[{reason, badarg} | Md],
	   ["bad argument in call to ", Formatted2, " in ",
	    Formatted]};
      {_M, _F, A} when is_list(A) ->
	  {Md, Formatted} = format_mfa_md(MFA2),
	  {_, Formatted2} = format_mfa_md(MFA),
	  {[{reason, badarg} | Md],
	   ["bad argument in call to ", Formatted2, " in ",
	    Formatted]};
      _ ->
	  {Md, Formatted} = format_mfa_md(MFA),
	  {[{reason, badarg} | Md],
	   ["bad argument in ", Formatted]}
    end;
format_reason_md({{badarg, Stack}, _}) ->
    format_reason_md({badarg, Stack});
format_reason_md({{badarity, {Fun, Args}},
		  [MFA | _]}) ->
    {arity, Arity} = lists:keyfind(arity, 1,
				   erlang:fun_info(Fun)),
    {Md, Formatted} = format_mfa_md(MFA),
    {[{reason, badarity} | Md],
     [io_lib:format("fun called with wrong arity of ~w instead "
		    "of ~w in ",
		    [length(Args), Arity]),
      Formatted]};
format_reason_md({noproc, MFA}) ->
    {Md, Formatted} = format_mfa_md(MFA),
    {[{reason, badarity} | Md],
     ["no such process or port in call to ", Formatted]};
format_reason_md({{badfun, Term}, [MFA | _]}) ->
    {Md, Formatted} = format_mfa_md(MFA),
    {[{reason, badfun} | Md],
     ["bad function ", print_val(Term), " in ", Formatted]};
format_reason_md({Reason, [{M, F, A} | _]})
    when is_atom(M), is_atom(F), is_integer(A) ->
    {Md, Formatted} = format_reason_md(Reason),
    {_, Formatted2} = format_mfa_md({M, F, A}),
    {Md, [Formatted, " in ", Formatted2]};
format_reason_md({Reason, [{M, F, A, Props} | _]})
    when is_atom(M), is_atom(F), is_integer(A),
	 is_list(Props) ->
    {Md, Formatted} = format_reason_md(Reason),
    {_, Formatted2} = format_mfa_md({M, F, A, Props}),
    {Md, [Formatted, " in ", Formatted2]};
format_reason_md(Reason) ->
    {Str, _} = lager_trunc_io:print(Reason, 500), {[], Str}.

format_mfa(MFA) -> element(2, format_mfa_md(MFA)).

-spec format_mfa_md(any()) -> {[{atom(), any()}],
			       list()}.

format_mfa_md({M, F, A}) when is_list(A) ->
    {FmtStr, Args} = format_args(A, [], []),
    {[{module, M}, {function, F}],
     io_lib:format("~w:~w(" ++ FmtStr ++ ")",
		   [M, F | Args])};
format_mfa_md({M, F, A}) when is_integer(A) ->
    {[{module, M}, {function, F}],
     io_lib:format("~w:~w/~w", [M, F, A])};
format_mfa_md({M, F, A, Props}) when is_list(Props) ->
    case get_value(line, Props) of
      undefined -> format_mfa_md({M, F, A});
      Line ->
	  {Md, Formatted} = format_mfa_md({M, F, A}),
	  {[{line, Line} | Md],
	   [Formatted, io_lib:format(" line ~w", [Line])]}
    end;
format_mfa_md([{M, F, A}, _]) ->
    format_mfa_md({M, F, A});
format_mfa_md([{M, F, A, Props}, _])
    when is_list(Props) ->
    format_mfa_md({M, F, A, Props});
format_mfa_md(Other) ->
    {[], io_lib:format("~w", [Other])}.

format_args([], FmtAcc, ArgsAcc) ->
    {string:join(lists:reverse(FmtAcc), ", "),
     lists:reverse(ArgsAcc)};
format_args([H | T], FmtAcc, ArgsAcc) ->
    {Str, _} = lager_trunc_io:print(H, 100),
    format_args(T, ["~s" | FmtAcc], [Str | ArgsAcc]).

print_silly_list(L) when is_list(L) ->
    case lager_stdlib:string_p(L) of
      true -> lager_trunc_io:format("~s", [L], 4096);
      _ -> print_silly_list(L, [], [])
    end;
print_silly_list(L) ->
    {Str, _} = lager_trunc_io:print(L, 4096), Str.

print_silly_list([], Fmt, Acc) ->
    lager_trunc_io:format(string:join(lists:reverse(Fmt),
				      ", "),
			  lists:reverse(Acc), 4096);
print_silly_list([{K, V} | T], Fmt, Acc) ->
    print_silly_list(T, ["~p: ~p" | Fmt], [V, K | Acc]);
print_silly_list([H | T], Fmt, Acc) ->
    print_silly_list(T, ["~p" | Fmt], [H | Acc]).

print_val(Val) ->
    {Str, _} = lager_trunc_io:print(Val, 500), Str.

get_value(Key, Value) ->
    get_value(Key, Value, undefined).

get_value(Key, List, Default) ->
    case lists:keyfind(Key, 1, List) of
      false -> Default;
      {Key, Value} -> Value
    end.

supervisor_name({local, Name}) -> Name;
supervisor_name(Name) -> Name.


