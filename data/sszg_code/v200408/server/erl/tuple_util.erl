-file("src/lib/tuple_util.erl", 1).

-module(tuple_util).

-lager_records([]).

-export([get_diff_tt/2, get_diff_tl/2, check_diff_tl/2,
	 check_diff/3, check_diff/4, to_kvlist/1, get_kvlist/2,
	 set/2, convert_data/2]).

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

-file("src/lib/tuple_util.erl", 14).

get_diff_tt(T1, T2) ->
    S = size(T1),
    case size(T2) == S of
      false -> [];
      true -> get_diff_tt_f1(T1, T2, 1, S, [])
    end.

get_diff_tt_f1(_T1, _T2, I, EndI, Res) when I > EndI ->
    Res;
get_diff_tt_f1(T1, T2, I, EndI, Res) ->
    V = element(I, T2),
    case element(I, T1) == V of
      true -> get_diff_tt_f1(T1, T2, I + 1, EndI, Res);
      false ->
	  get_diff_tt_f1(T1, T2, I + 1, EndI, [{I, V} | Res])
    end.

get_diff_tl(Tuple, KVList) ->
    get_diff_tl_f1(KVList, Tuple, []).

get_diff_tl_f1([], _Tuple, Res) -> Res;
get_diff_tl_f1([{K, V} | T], Tuple, Res) ->
    V2 = element(K, Tuple),
    case V2 == V of
      true -> get_diff_tl_f1(T, Tuple, Res);
      false -> get_diff_tl_f1(T, Tuple, [{K, V2} | Res])
    end.

check_diff_tl(Tuple, KVList) ->
    check_diff_tl_f1(KVList, Tuple, [], [], false).

check_diff_tl_f1([], _Tuple, Res, Res2, true) ->
    {true, Res, Res2};
check_diff_tl_f1([], _Tuple, _Res, _Res2, false) ->
    false;
check_diff_tl_f1([H = {K, V} | T], Tuple, Res, Res2,
		 Update) ->
    V2 = element(K, Tuple),
    case V2 == V of
      true ->
	  check_diff_tl_f1(T, Tuple, [H | Res], Res2, Update);
      false ->
	  check_diff_tl_f1(T, Tuple, [{K, V2} | Res],
			   [{K, V2} | Res2], true)
    end.

check_diff(Tuple1, Tuple2, KList) ->
    check_diff(Tuple1, Tuple2, KList, []).

check_diff(_Tuple1, _Tuple2, [], Res) -> Res;
check_diff(Tuple1, Tuple2, [K | T], Res) ->
    V1 = element(K, Tuple1),
    V2 = element(K, Tuple2),
    if V1 == V2 -> check_diff(Tuple1, Tuple2, T, Res);
       true -> check_diff(Tuple1, Tuple2, T, [{K, V2} | Res])
    end.

set(T, []) -> T;
set(T, [{K, V} | Rest]) ->
    set(setelement(K, T, V), Rest);
set(T, {K, V}) -> setelement(K, T, V).

to_kvlist(Tuple) ->
    to_kvlist_f1(tuple_to_list(Tuple), 1, []).

to_kvlist_f1([], _K, Res) -> lists:reverse(Res);
to_kvlist_f1([V | T], K, Res) ->
    to_kvlist_f1(T, K + 1, [{K, V} | Res]).

get_kvlist(Tuple, KList) ->
    get_kvlist_f1(Tuple, KList, []).

get_kvlist_f1(_Tuple, [], Res) -> Res;
get_kvlist_f1(Tuple, [K | T], Res) ->
    get_kvlist_f1(Tuple, T, [{K, element(K, Tuple)} | Res]).

-spec convert_data(tuple(), tuple()) -> tuple().

convert_data(D1, D2) ->
    Size1 = tuple_size(D1),
    Size2 = tuple_size(D2),
    if Size2 > Size1 ->
	   NewD1 = erlang:append_element(D1,
					 element(Size1 + 1, D2)),
	   convert_data(NewD1, D2);
       Size1 =:= Size2 -> D1;
       true -> throw("convert_data_error")
    end.


