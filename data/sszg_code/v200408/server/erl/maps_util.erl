-file("src/lib/maps_util.erl", 1).

-module(maps_util).

-lager_records([]).

-export([sort/2, keyfind/3, keyfind/4, keydelete/3,
	 rand/2]).

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

-file("src/lib/maps_util.erl", 14).

-spec sort([any()], [#{}]) -> [#{}].

sort([], List) -> lists:reverse(List);
sort([{asc, H} | T], List) ->
    Fun = fun (M1, M2) -> maps:get(H, M1) > maps:get(H, M2)
	  end,
    NewList = lists:sort(Fun, List),
    sort(T, NewList);
sort([H | T], List) ->
    Fun = fun (M1, M2) -> maps:get(H, M1) =< maps:get(H, M2)
	  end,
    NewList = lists:sort(Fun, List),
    sort(T, NewList).

-spec keyfind([#{}], Key :: any(),
	      Val :: any()) -> false | {ok, #{}}.

keyfind([], _Key, _Val) -> false;
keyfind([Map | T], Key, Val) ->
    case maps:get(Key, Map) of
      Val -> {ok, Map};
      _ -> keyfind(T, Key, Val)
    end.

-spec keyfind([#{}], Key :: any(), Val :: any(),
	      DefItem :: #{}) -> #{}.

keyfind(MapList, Key, Val, DefItem) ->
    case keyfind(MapList, Key, Val) of
      {ok, Map} -> Map;
      _ -> DefItem
    end.

-spec keydelete([#{}], Key :: any(),
		Val :: any()) -> [#{}].

keydelete(L, Key, Val) ->
    [M || M <- L, maps:get(Key, M) =/= Val].

-spec rand(List :: [tuple()],
	   Pos :: pos_integer()) -> undefined | tuple().

rand([], _Key) -> undefined;
rand([I], _Key) -> I;
rand(List, Key) ->
    Sum = lists:sum([maps:get(Key, Map) || Map <- List]),
    RandVal = util:rand(1, Sum),
    get_rand(List, Key, RandVal).

get_rand([H | T], Key, RandVal) ->
    Rand = maps:get(Key, H),
    case RandVal =< Rand of
      true -> H;
      false -> get_rand(T, Key, RandVal - Rand)
    end.


