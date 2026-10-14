-file("src/lib/code_util.erl", 1).

-module(code_util).

-lager_records([]).

-export([eval/1, test/1]).

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

-file("src/lib/code_util.erl", 12).

eval(Bin) when is_binary(Bin) ->
    eval(binary_to_list(Bin));
eval(Str) when is_list(Str) ->
    {ok, Ts, _} = erl_scan:string(Str),
    Ts1 = case eval_f1(Ts) of
	    [{dot, _} | _] -> Ts;
	    TsR -> eval_f1([{dot, 1} | TsR])
	  end,
    {ok, Expr} = erl_parse:parse_exprs(Ts1),
    {value, Value, _} = erl_eval:exprs(Expr, []),
    Value.

eval_f1([] = L) -> L;
eval_f1([_] = L) -> L;
eval_f1([A, B]) -> [B, A];
eval_f1([A, B | L]) -> lists:reverse(L, [B, A]).

test({'>', V1, V2}) -> V1 > V2;
test({'<', V1, V2}) -> V1 < V2;
test({'>=', V1, V2}) -> V1 >= V2;
test({'=<', V1, V2}) -> V1 =< V2;
test({'==', V1, V2}) -> V1 == V2;
test({'/=', V1, V2}) -> V1 /= V2;
test({in, V1, V2}) -> lists:member(V1, V2);
test({'not', V1}) -> not V1;
test(Other) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcode_util44, _,
       {__Levelcode_util44, __Tracescode_util44}}
	  when __Levelcode_util44 band 8 /= 0 orelse
		 __Tracescode_util44 /= [] ->
	  lager:do_log(error,
		       [{module, code_util}, {function, test}, {line, 44},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~w", [Other]), none, 4096, 8,
		       __Levelcode_util44, __Tracescode_util44, lager_event,
		       __Pidcode_util44);
      _ -> ok
    end,
    false.


