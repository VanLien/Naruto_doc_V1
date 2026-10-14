-file("src/lager_config.erl", 1).

-module(lager_config).

-file("include/lager.hrl", 1).

-record(lager_shaper,
	{hwm = undefined  :: undefined | pos_integer(),
	 mps = 0  :: non_neg_integer(),
	 lasttime = os:timestamp()  :: erlang:timestamp(),
	 dropped = 0  :: non_neg_integer()}).

-type lager_shaper() :: #lager_shaper{}.

-file("src/lager_config.erl", 22).

-export([new/0, new_sink/1, get/1, get/2, set/2,
	 global_get/1, global_get/2, global_set/2]).

new() ->
    _ = try ets:new(lager_config,
		    [named_table, public, set, {keypos, 1},
		     {read_concurrency, true}])
	of
	  _Result -> ok
	catch
	  error:badarg ->
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
						    lager_msg:new(io_lib:format("Table ~p already exists",
										[lager_config]),
								  warning,
								  [{pid, Self},
								   {line, 41},
								   {file,
								    "src/lager_config.erl"},
								   {module,
								    lager_config}],
								  [])});
			      _ ->
				  case lager_util:level_to_num(warning) band
					 element(1,
						 lager_config:get(loglevel,
								  {0, []}))
					 /= 0
				      of
				    true ->
					gen_event:notify(lager_event,
							 {log,
							  lager_msg:new(io_lib:format("Table ~p already exists",
										      [lager_config]),
									warning,
									[{pid,
									  Self},
									 {line,
									  41},
									 {file,
									  "src/lager_config.erl"},
									 {module,
									  lager_config}],
									[])});
				    _ -> ok
				  end
			    end
		    end)
	end,
    new_sink(lager_event),
    ets:insert_new(lager_config,
		   {{'_global', handlers}, []}),
    ok.

new_sink(Sink) ->
    ets:insert_new(lager_config,
		   {{Sink, loglevel},
		    {element(2, lager_util:config_to_mask(debug)), []}}).

global_get(Key) -> global_get(Key, undefined).

global_get(Key, Default) ->
    get({'_global', Key}, Default).

global_set(Key, Value) -> set({'_global', Key}, Value).

get({_Sink, _Key} = FullKey) -> get(FullKey, undefined);
get(Key) -> get({lager_event, Key}, undefined).

get({Sink, Key}, Default) ->
    try case ets:lookup(lager_config, {Sink, Key}) of
	  [] -> Default;
	  [{{Sink, Key}, Res}] -> Res
	end
    catch
      _:_ -> Default
    end;
get(Key, Default) -> get({lager_event, Key}, Default).

set({Sink, Key}, Value) ->
    ets:insert(lager_config, {{Sink, Key}, Value});
set(Key, Value) -> set({lager_event, Key}, Value).


