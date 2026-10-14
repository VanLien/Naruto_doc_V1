-file("src/mod/misc/fun_call.erl", 1).

-module(fun_call).

-lager_records([]).

-export([exec/2, exec/3, trans_begin/0, trans_flush/0,
	 trans_clean/0, trans_clean_all/0]).

-file("inc/common.hrl", 1).

-file("inc/lib_log.hrl", 1).

-file("inc/common.hrl", 112).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("src/mod/misc/fun_call.erl", 15).

exec(Fun, Args) -> exec(undefined, Fun, Args).

exec(Mod, Fun, Args) ->
    case get(fun_call_transaction) of
      undefined -> do_exec(Mod, Fun, Args);
      [] -> do_exec(Mod, Fun, Args);
      [H] ->
	  put(fun_call_transaction, [[{Mod, Fun, Args} | H]]);
      [H | T] ->
	  put(fun_call_transaction, [[{Mod, Fun, Args} | H] | T])
    end.

trans_begin() ->
    case get(fun_call_transaction) of
      L = [_ | _] -> put(fun_call_transaction, [[] | L]);
      _ -> put(fun_call_transaction, [[]])
    end,
    ok.

trans_flush() ->
    case get(fun_call_transaction) of
      [] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidfun_call42, _,
	     {__Levelfun_call42, __Tracesfun_call42}}
		when __Levelfun_call42 band 8 /= 0 orelse
		       __Tracesfun_call42 /= [] ->
		lager:do_log(error,
			     [{module, fun_call}, {function, trans_flush},
			      {line, 42}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "方法调用时发生异常:缓冲区为空", none, 4096, 8,
			     __Levelfun_call42, __Tracesfun_call42, lager_event,
			     __Pidfun_call42);
	    _ -> ok
	  end;
      [[]] -> put(fun_call_transaction, []);
      [H] ->
	  [do_exec(Mod, Fun, Args) || {Mod, Fun, Args} <- H],
	  put(fun_call_transaction, []);
      [H, H1 | T] ->
	  put(fun_call_transaction,
	      [lists:concat([lists:reverse(H), H1]) | T]);
      [H | T] ->
	  put(fun_call_transaction,
	      [lists:concat([lists:reverse(H), T])])
    end,
    ok.

trans_clean() ->
    case get(fun_call_transaction) of
      [] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidfun_call58, _,
	     {__Levelfun_call58, __Tracesfun_call58}}
		when __Levelfun_call58 band 8 /= 0 orelse
		       __Tracesfun_call58 /= [] ->
		lager:do_log(error,
			     [{module, fun_call}, {function, trans_clean},
			      {line, 58}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "方法调用事务数据时发生异常:缓冲区为空", none, 4096, 8,
			     __Levelfun_call58, __Tracesfun_call58, lager_event,
			     __Pidfun_call58);
	    _ -> ok
	  end;
      [_H] -> put(fun_call_transaction, []);
      [_H | T] -> put(fun_call_transaction, T)
    end,
    ok.

trans_clean_all() -> erase(fun_call_transaction).

do_exec(undefined, Fun, Args) ->
    catch erlang:apply(Fun, Args);
do_exec(Mod, Fun, Args) ->
    catch erlang:apply(Mod, Fun, Args).


