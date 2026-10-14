-file("src/lager_app.erl", 1).

-module(lager_app).

-behaviour(application).

-file("include/lager.hrl", 1).

-record(lager_shaper,
	{hwm = undefined  :: undefined | pos_integer(),
	 mps = 0  :: non_neg_integer(),
	 lasttime = os:timestamp()  :: erlang:timestamp(),
	 dropped = 0  :: non_neg_integer()}).

-type lager_shaper() :: #lager_shaper{}.

-file("src/lager_app.erl", 25).

-export([start/0, start/2, start_handler/3,
	 configure_sink/2, stop/1, boot/1]).

-export([get_env/3]).

start() -> application:start(lager).

start_throttle(Sink, Threshold, Window) ->
    _ = supervisor:start_child(lager_handler_watcher_sup,
			       [Sink, lager_backend_throttle,
				[Threshold, Window]]),
    ok.

determine_async_behavior(_Sink, undefined, _Window) ->
    ok;
determine_async_behavior(_Sink, Threshold, _Window)
    when not is_integer(Threshold) orelse Threshold < 0 ->
    error_logger:error_msg("Invalid value for 'async_threshold': "
			   "~p~n",
			   [Threshold]),
    throw({error, bad_config});
determine_async_behavior(Sink, Threshold, undefined) ->
    start_throttle(Sink, Threshold,
		   erlang:trunc(Threshold * 2.0e-1));
determine_async_behavior(_Sink, Threshold, Window)
    when not is_integer(Window) orelse
	   Window > Threshold orelse Window < 0 ->
    error_logger:error_msg("Invalid value for 'async_threshold_window': "
			   "~p~n",
			   [Window]),
    throw({error, bad_config});
determine_async_behavior(Sink, Threshold, Window) ->
    start_throttle(Sink, Threshold, Window).

start_handlers(_Sink, undefined) -> ok;
start_handlers(_Sink, Handlers)
    when not is_list(Handlers) ->
    error_logger:error_msg("Invalid value for 'handlers' (must be "
			   "list): ~p~n",
			   [Handlers]),
    throw({error, bad_config});
start_handlers(Sink, Handlers) ->
    lager_config:global_set(handlers,
			    lager_config:global_get(handlers, []) ++
			      lists:map(fun ({Module, Config}) ->
						check_handler_config(Module,
								     Config),
						start_handler(Sink, Module,
							      Config);
					    (_) -> throw({error, bad_config})
					end,
					expand_handlers(Handlers))),
    ok.

start_handler(Sink, Module, Config) ->
    {ok, Watcher} =
	supervisor:start_child(lager_handler_watcher_sup,
			       [Sink, Module, Config]),
    {Module, Watcher, Sink}.

check_handler_config({lager_file_backend, F}, Config)
    when is_list(Config); is_tuple(Config) ->
    Fs = case get('__lager_file_backend_filenames') of
	   undefined -> ordsets:new();
	   X -> X
	 end,
    case ordsets:is_element(F, Fs) of
      true ->
	  error_logger:error_msg("Cannot have same file (~p) in multiple "
				 "file backends~n",
				 [F]),
	  throw({error, bad_config});
      false ->
	  put('__lager_file_backend_filenames',
	      ordsets:add_element(F, Fs))
    end,
    ok;
check_handler_config(_Handler, Config)
    when is_list(Config) orelse is_atom(Config) ->
    ok;
check_handler_config(Handler, _BadConfig) ->
    throw({error, {bad_config, Handler}}).

clean_up_config_checks() ->
    erase('__lager_file_backend_filenames').

interpret_hwm(undefined) -> undefined;
interpret_hwm(HWM)
    when not is_integer(HWM) orelse HWM < 0 ->
    _ = lager:log(warning, self(),
		  "Invalid error_logger high water mark: "
		  "~p, disabling",
		  [HWM]),
    undefined;
interpret_hwm(HWM) -> HWM.

maybe_install_sink_killer(_Sink, undefined,
			  _ReinstallTimer) ->
    ok;
maybe_install_sink_killer(Sink, HWM, undefined) ->
    maybe_install_sink_killer(Sink, HWM, 5000);
maybe_install_sink_killer(Sink, HWM, ReinstallTimer)
    when is_integer(HWM) andalso
	   is_integer(ReinstallTimer) andalso
	     HWM >= 0 andalso ReinstallTimer >= 0 ->
    _ = supervisor:start_child(lager_handler_watcher_sup,
			       [Sink, lager_manager_killer,
				[HWM, ReinstallTimer]]);
maybe_install_sink_killer(_Sink, HWM, ReinstallTimer) ->
    error_logger:error_msg("Invalid value for 'killer_hwm': ~p or "
			   "'killer_reinstall_after': ~p",
			   [HWM, ReinstallTimer]),
    throw({error, bad_config}).

-spec start_error_logger_handler(boolean(),
				 pos_integer(), list()) -> list().

start_error_logger_handler(false, _HWM, _Whitelist) ->
    [];
start_error_logger_handler(true, HWM, WhiteList) ->
    GlStrategy = case application:get_env(lager,
					  error_logger_groupleader_strategy)
		     of
		   undefined -> handle;
		   {ok, GlStrategy0}
		       when GlStrategy0 =:= handle;
			    GlStrategy0 =:= ignore;
			    GlStrategy0 =:= mirror ->
		       GlStrategy0;
		   {ok, BadGlStrategy} ->
		       error_logger:error_msg("Invalid value for 'error_logger_groupleader_s"
					      "trategy': ~p~n",
					      [BadGlStrategy]),
		       throw({error, bad_config})
		 end,
    _ = case
	  supervisor:start_child(lager_handler_watcher_sup,
				 [error_logger, error_logger_lager_h,
				  [HWM, GlStrategy]])
	    of
	  {ok, _} ->
	      [begin error_logger:delete_report_handler(X), X end
	       || X
		      <- gen_event:which_handlers(error_logger) --
			   [error_logger_lager_h | WhiteList]];
	  {error, _} -> []
	end,
    Handlers = case application:get_env(lager, handlers) of
		 undefined ->
		     [{lager_console_backend, info},
		      {lager_file_backend,
		       [{file, "log/error.log"}, {level, error},
			{size, 10485760}, {date, "$D0"}, {count, 5}]},
		      {lager_file_backend,
		       [{file, "log/console.log"}, {level, info},
			{size, 10485760}, {date, "$D0"}, {count, 5}]}];
		 {ok, Val} -> Val
	       end,
    Handlers.

configure_sink(Sink, SinkDef) ->
    lager_config:new_sink(Sink),
    ChildId = lager_util:make_internal_sink_name(Sink),
    _ = supervisor:start_child(lager_sup,
			       {ChildId,
				{gen_event, start_link, [{local, Sink}]},
				permanent, 5000, worker, dynamic}),
    determine_async_behavior(Sink,
			     proplists:get_value(async_threshold, SinkDef),
			     proplists:get_value(async_threshold_window,
						 SinkDef)),
    _ = maybe_install_sink_killer(Sink,
				  proplists:get_value(killer_hwm, SinkDef),
				  proplists:get_value(killer_reinstall_after,
						      SinkDef)),
    start_handlers(Sink,
		   proplists:get_value(handlers, SinkDef, [])),
    lager:update_loglevel_config(Sink).

configure_extra_sinks(Sinks) ->
    lists:foreach(fun ({Sink, Proplist}) ->
			  configure_sink(Sink, Proplist)
		  end,
		  Sinks).

-spec get_env(atom(), atom()) -> term().

get_env(Application, Key) ->
    get_env(Application, Key, undefined).

-spec get_env(atom(), atom(), term()) -> term().

get_env(Application, Key, Default) ->
    get_env_default(application:get_env(Application, Key),
		    Default).

-spec get_env_default(undefined | {ok, term()},
		      term()) -> term().

get_env_default(undefined, Default) -> Default;
get_env_default({ok, Value}, _Default) -> Value.

start(_StartType, _StartArgs) ->
    {ok, Pid} = lager_sup:start_link(),
    SavedHandlers = boot(),
    _ = boot('__all_extra'),
    _ = boot('__traces'),
    clean_up_config_checks(),
    {ok, Pid, SavedHandlers}.

boot() ->
    determine_async_behavior(lager_event,
			     get_env(lager, async_threshold),
			     get_env(lager, async_threshold_window)),
    _ = maybe_install_sink_killer(lager_event,
				  get_env(lager, killer_hwm),
				  get_env(lager, killer_reinstall_after)),
    start_handlers(lager_event,
		   get_env(lager, handlers,
			   [{lager_console_backend, info},
			    {lager_file_backend,
			     [{file, "log/error.log"}, {level, error},
			      {size, 10485760}, {date, "$D0"}, {count, 5}]},
			    {lager_file_backend,
			     [{file, "log/console.log"}, {level, info},
			      {size, 10485760}, {date, "$D0"}, {count, 5}]}])),
    lager:update_loglevel_config(lager_event),
    SavedHandlers =
	start_error_logger_handler(get_env(lager,
					   error_logger_redirect, true),
				   interpret_hwm(get_env(lager,
							 error_logger_hwm, 0)),
				   get_env(lager, error_logger_whitelist, [])),
    SavedHandlers.

boot('__traces') ->
    _ = lager_util:trace_filter(none),
    ok = add_configured_traces();
boot('__all_extra') ->
    configure_extra_sinks(get_env(lager, extra_sinks, []));
boot(lager_event) -> boot();
boot(Sink) ->
    AllSinksDef = get_env(lager, extra_sinks, []),
    boot_sink(Sink, lists:keyfind(Sink, 1, AllSinksDef)).

boot_sink(Sink, {Sink, Def}) ->
    configure_sink(Sink, Def);
boot_sink(Sink, false) -> configure_sink(Sink, []).

stop(Handlers) ->
    lists:foreach(fun (Handler) ->
			  error_logger:add_report_handler(Handler)
		  end,
		  Handlers).

expand_handlers([]) -> [];
expand_handlers([{lager_file_backend,
		  [{Key, _Value} | _] = Config}
		 | T])
    when is_atom(Key) ->
    [maybe_make_handler_id(lager_file_backend, Config)
     | expand_handlers(T)];
expand_handlers([{lager_file_backend, Configs} | T]) ->
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
					  lager_msg:new(io_lib:format("Deprecated lager_file_backend config "
								      "detected, please consider updating it",
								      []),
							notice,
							[{pid, Self},
							 {line, 276},
							 {file,
							  "src/lager_app.erl"},
							 {module, lager_app}],
							[])});
		    _ ->
			case lager_util:level_to_num(notice) band
			       element(1, lager_config:get(loglevel, {0, []}))
			       /= 0
			    of
			  true ->
			      gen_event:notify(lager_event,
					       {log,
						lager_msg:new(io_lib:format("Deprecated lager_file_backend config "
									    "detected, please consider updating it",
									    []),
							      notice,
							      [{pid, Self},
							       {line, 276},
							       {file,
								"src/lager_app.erl"},
							       {module,
								lager_app}],
							      [])});
			  _ -> ok
			end
		  end
	  end),
    [{lager_file_backend:config_to_id(Config), Config}
     || Config <- Configs]
      ++ expand_handlers(T);
expand_handlers([{Mod, Config} | T])
    when is_atom(Mod) ->
    [maybe_make_handler_id(Mod, Config)
     | expand_handlers(T)];
expand_handlers([H | T]) -> [H | expand_handlers(T)].

add_configured_traces() ->
    Traces = case application:get_env(lager, traces) of
	       undefined -> [];
	       {ok, TraceVal} -> TraceVal
	     end,
    lists:foreach(fun start_configured_trace/1, Traces),
    ok.

start_configured_trace({Handler, Filter}) ->
    {ok, _} = lager:trace(Handler, Filter);
start_configured_trace({Handler, Filter, Level})
    when is_atom(Level) ->
    {ok, _} = lager:trace(Handler, Filter, Level).

maybe_make_handler_id(Mod, Config) ->
    try Mod:config_to_id(Config) of
      Id -> {Id, Config}
    catch
      error:undef -> {Mod, Config}
    end.


