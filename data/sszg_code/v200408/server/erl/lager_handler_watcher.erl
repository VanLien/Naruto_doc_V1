-file("src/lager_handler_watcher.erl", 1).

-module(lager_handler_watcher).

-behaviour(gen_server).

-file("include/lager.hrl", 1).

-record(lager_shaper,
	{hwm = undefined  :: undefined | pos_integer(),
	 mps = 0  :: non_neg_integer(),
	 lasttime = os:timestamp()  :: erlang:timestamp(),
	 dropped = 0  :: non_neg_integer()}).

-type lager_shaper() :: #lager_shaper{}.

-file("src/lager_handler_watcher.erl", 27).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([start_link/3, start/3]).

-record(state,
	{module  :: atom(), config  :: any(),
	 sink  :: pid() | atom()}).

start_link(Sink, Module, Config) ->
    gen_server:start_link(lager_handler_watcher,
			  [Sink, Module, Config], []).

start(Sink, Module, Config) ->
    gen_server:start(lager_handler_watcher,
		     [Sink, Module, Config], []).

init([Sink, Module, Config]) ->
    install_handler(Sink, Module, Config),
    {ok,
     #state{sink = Sink, module = Module, config = Config}}.

handle_call(_Call, _From, State) -> {reply, ok, State}.

handle_cast(_Request, State) -> {noreply, State}.

handle_info({gen_event_EXIT, Module, normal},
	    #state{module = Module} = State) ->
    {stop, normal, State};
handle_info({gen_event_EXIT, Module, shutdown},
	    #state{module = Module} = State) ->
    {stop, normal, State};
handle_info({gen_event_EXIT, Module,
	     {'EXIT',
	      {kill_me, [_KillerHWM, KillerReinstallAfter]}}},
	    #state{module = Module, sink = Sink} = State) ->
    SinkPid = whereis(Sink),
    unlink(SinkPid),
    exit(SinkPid, kill),
    erlang:send_after(KillerReinstallAfter, self(),
		      {reboot, Sink}),
    {noreply, State};
handle_info({gen_event_EXIT, Module, Reason},
	    #state{module = Module, config = Config, sink = Sink} =
		State) ->
    case lager:log(error, self(),
		   "Lager event handler ~p exited with reason ~s",
		   [Module, error_logger_lager_h:format_reason(Reason)])
	of
      ok -> install_handler(Sink, Module, Config);
      {error, _} -> ok
    end,
    {noreply, State};
handle_info(reinstall_handler,
	    #state{module = Module, config = Config, sink = Sink} =
		State) ->
    install_handler(Sink, Module, Config), {noreply, State};
handle_info({reboot, Sink}, State) ->
    _ = lager_app:boot(Sink), {noreply, State};
handle_info(stop, State) -> {stop, normal, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

install_handler(Sink, lager_backend_throttle, Config) ->
    install_handler2(Sink, lager_backend_throttle,
		     [{sink, Sink} | Config]);
install_handler(Sink, Module, Config) ->
    install_handler2(Sink, Module, Config).

install_handler2(Sink, Module, Config) ->
    case gen_event:add_sup_handler(Sink, Module, Config) of
      ok ->
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
						lager_msg:new(io_lib:format("Lager installed handler ~p into ~p",
									    [Module,
									     Sink]),
							      debug,
							      [{pid, Self},
							       {line, 119},
							       {file,
								"src/lager_handler_watcher.erl"},
							       {module,
								lager_handler_watcher}],
							      [])});
			  _ ->
			      case lager_util:level_to_num(debug) band
				     element(1,
					     lager_config:get(loglevel,
							      {0, []}))
				     /= 0
				  of
				true ->
				    gen_event:notify(lager_event,
						     {log,
						      lager_msg:new(io_lib:format("Lager installed handler ~p into ~p",
										  [Module,
										   Sink]),
								    debug,
								    [{pid,
								      Self},
								     {line,
								      119},
								     {file,
								      "src/lager_handler_watcher.erl"},
								     {module,
								      lager_handler_watcher}],
								    [])});
				_ -> ok
			      end
			end
		end),
	  lager:update_loglevel_config(Sink),
	  ok;
      {error, {fatal, Reason}} ->
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
						lager_msg:new(io_lib:format("Lager fatally failed to install handler "
									    "~p into ~p, NOT retrying: ~p",
									    [Module,
									     Sink,
									     Reason]),
							      error,
							      [{pid, Self},
							       {line, 123},
							       {file,
								"src/lager_handler_watcher.erl"},
							       {module,
								lager_handler_watcher}],
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
						      lager_msg:new(io_lib:format("Lager fatally failed to install handler "
										  "~p into ~p, NOT retrying: ~p",
										  [Module,
										   Sink,
										   Reason]),
								    error,
								    [{pid,
								      Self},
								     {line,
								      123},
								     {file,
								      "src/lager_handler_watcher.erl"},
								     {module,
								      lager_handler_watcher}],
								    [])});
				_ -> ok
			      end
			end
		end),
	  self() ! stop,
	  ok;
      Error ->
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
						lager_msg:new(io_lib:format("Lager failed to install handler ~p into "
									    "~p, retrying later : ~p",
									    [Module,
									     Sink,
									     Error]),
							      error,
							      [{pid, Self},
							       {line, 130},
							       {file,
								"src/lager_handler_watcher.erl"},
							       {module,
								lager_handler_watcher}],
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
						      lager_msg:new(io_lib:format("Lager failed to install handler ~p into "
										  "~p, retrying later : ~p",
										  [Module,
										   Sink,
										   Error]),
								    error,
								    [{pid,
								      Self},
								     {line,
								      130},
								     {file,
								      "src/lager_handler_watcher.erl"},
								     {module,
								      lager_handler_watcher}],
								    [])});
				_ -> ok
			      end
			end
		end),
	  erlang:send_after(5000, self(), reinstall_handler),
	  ok
    end.


