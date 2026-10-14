-file("src/lib/list_util.erl", 1).

-module(list_util).

-lager_records([]).

-export([keysdelete/2, delete/2, member/2, member1/2,
	 keysort/2, keyresort/2, mkeysort/2, mkeysort2/2,
	 mkeyresort/2, sort/1, resort/1, index/2, index/3,
	 keyindex/3, keyindex/4, implode/2, rand/1, rand_more/2,
	 rand_more2/2, rand_more_repeat/2, keyrand/2,
	 keyrand_more/3, keyrand_more2/3, find/3, keyfind/2,
	 keyfind/3, keyfind/4, keyfind_list/3, ukeymerge/3,
	 keyfind_all/3, keyfind_less_all/3, keydelete_all/3,
	 keysfind_all/3, keysdelete_all/3, keysum/2,
	 keyfind_all_and_sum/4, mkeyfind_all_and_sum/4,
	 key2list/2, key2list/3, keyupdate/4, keyadd/3, keyadd/4,
	 split/2, diff_split/3, diff/2, is_diff/2, nth/2,
	 nthdelete/2, nthupdate/3, verify_uniq/2, find_index/2,
	 min/1, keymax/2, keymin/2, sublist/3, ustore/2,
	 group_by/2, group_by_type/2, set_list_element/3,
	 delete_list_element/2, list_add/2, list_replace/3,
	 list_replace_one/3, number_member/2, keyfind2/4,
	 keyreplace2/5, keystore2/5, keydelete2/4, mix_key_val/2,
	 filter_replicat/1, shuffle/1, page_data/3, zip/2,
	 calc_element_count/1, add_sort/4, set_idx/2]).

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

-file("src/lib/list_util.erl", 52).

min([]) -> [];
min(List) -> lists:min(List).

delete(_DelList, []) -> [];
delete([Elem | R], List) ->
    delete(R, lists:delete(Elem, List));
delete([], List) -> List.

keysdelete(TList, KList) -> keysdelete_f1(TList, KList).

keysdelete_f1(TList, []) -> TList;
keysdelete_f1(TList, [K | T]) ->
    keysdelete_f1(lists:keydelete(K, 1, TList), T).

keymin([H | T], Key) ->
    keymin(T, element(Key, H), H, Key).

keymin([H | T], Max, Tpl, Key) ->
    Elem = element(Key, H),
    if Elem < Max -> keymin(T, Elem, H, Key);
       true -> keymin(T, Max, Tpl, Key)
    end;
keymin([], _Max, Tpl, _Key) -> Tpl.

keymax([H | T], Key) ->
    keymax(T, element(Key, H), H, Key).

keymax([H | T], Max, Tpl, Key) ->
    Elem = element(Key, H),
    if Elem > Max -> keymax(T, Elem, H, Key);
       true -> keymax(T, Max, Tpl, Key)
    end;
keymax([], _Max, Tpl, _Key) -> Tpl.

verify_uniq(TPs, KeyPos) ->
    verify_uniq(TPs, KeyPos, []).

verify_uniq([], _KeyPos, RtnL) -> RtnL;
verify_uniq([Tp | T], KeyPos, RtnL) ->
    OneElement = erlang:element(KeyPos, Tp),
    case lists:keyfind(OneElement, KeyPos, RtnL) of
      false -> verify_uniq(T, KeyPos, [Tp | RtnL]);
      _Finded -> verify_uniq(T, KeyPos, RtnL)
    end.

split(N, List)
    when is_integer(N), N >= 0, is_list(List) ->
    split(N, List, []);
split(N, List) -> erlang:error(badarg, [N, List]).

split(0, L, R) -> {lists:reverse(R, []), L};
split(N, [H | T], R) -> split(N - 1, T, [H | R]);
split(_N, [], R) -> split(0, [], R).

keysort(Key, L) -> lists:keysort(Key, L).

keyresort(Key, L) ->
    lists:reverse(lists:keysort(Key, L)).

mkeysort(_Keys, []) -> [];
mkeysort(_Keys, [F]) -> [F];
mkeysort([], TupleList) when is_list(TupleList) ->
    TupleList;
mkeysort([Key], TupleList) when is_list(TupleList) ->
    lists:keysort(Key, TupleList);
mkeysort([Key | Keys], TupleList)
    when is_list(TupleList) ->
    [F | T] = lists:keysort(Key, TupleList),
    mkeysort_fun(T, Key, Keys, element(Key, F), [F], []).

mkeysort_fun([], _Key, Keys, _Val, Buff, Res) ->
    NewBuff = mkeysort(Keys, Buff), Res ++ NewBuff;
mkeysort_fun([F | T], Key, Keys, Val, Buff, Res) ->
    case element(Key, F) of
      Val -> mkeysort_fun(T, Key, Keys, Val, [F | Buff], Res);
      Val2 ->
	  NewBuff = mkeysort(Keys, Buff),
	  mkeysort_fun(T, Key, Keys, Val2, [F], Res ++ NewBuff)
    end.

mkeysort2(_Keys, []) -> [];
mkeysort2(_Keys, [F]) -> [F];
mkeysort2([], TupleList) when is_list(TupleList) ->
    TupleList;
mkeysort2([Key], TupleList) when is_list(TupleList) ->
    mkeysort2_fun3(Key, TupleList);
mkeysort2([Key | Keys], TupleList)
    when is_list(TupleList) ->
    {_, Key2} = Key,
    [F | T] = mkeysort2_fun3(Key, TupleList),
    mkeysort_fun2(T, Key, Keys, element(Key2, F), [F], []).

mkeysort_fun2([], _Key, Keys, _Val, Buff, Res) ->
    NewBuff = mkeysort2(Keys, Buff), Res ++ NewBuff;
mkeysort_fun2([F | T], Key, Keys, Val, Buff, Res) ->
    {_, Key2} = Key,
    case element(Key2, F) of
      Val ->
	  mkeysort_fun2(T, Key, Keys, Val, [F | Buff], Res);
      Val2 ->
	  NewBuff = mkeysort2(Keys, Buff),
	  mkeysort_fun2(T, Key, Keys, Val2, [F], Res ++ NewBuff)
    end.

mkeysort2_fun3({s, Key}, Tuplelist) ->
    lists:keysort(Key, Tuplelist);
mkeysort2_fun3({r, Key}, Tuplelist) ->
    lists:reverse(lists:keysort(Key, Tuplelist)).

mkeyresort(Keys, L) -> lists:reverse(mkeysort(Keys, L)).

sort(L) -> lists:sort(L).

resort(L) -> lists:reverse(lists:sort(L)).

index(Elem, List) -> index_loop(Elem, List, 1, 0).

index(Elem, List, Def) ->
    index_loop(Elem, List, 1, Def).

index_loop(_Elem, [], _I, Def) -> Def;
index_loop(Elem, [E | T], I, Def) ->
    case Elem =:= E of
      true -> I;
      false -> index_loop(Elem, T, I + 1, Def)
    end.

keyindex(Key, N, List) -> keyindex(Key, N, List, 0).

keyindex(Key, N, List, Def) ->
    keyindex_f1(Key, N, List, 1, Def).

keyindex_f1(_Key, _N, [], _I, Def) -> Def;
keyindex_f1(Key, N, [E | T], I, Def) ->
    case element(N, E) of
      Key -> I;
      _ -> keyindex_f1(Key, N, T, I + 1, Def)
    end.

implode(S, L) -> implode_fun(L, S, []).

implode_fun([], _S, _Res) -> <<>>;
implode_fun([Key], _S, Res) ->
    lists:reverse([Key | Res]);
implode_fun([Key | T], S, Res) ->
    implode_fun(T, S, [S, Key | Res]).

rand([]) -> undefined;
rand([I]) -> I;
rand(List) ->
    Idx = util:rand(1, length(List)), lists:nth(Idx, List).

rand_more(List, Num) ->
    rand_more_f1(List, erlang:max(0, Num), []).

rand_more_f1(_, 0, Result) -> Result;
rand_more_f1(List, Num, Result) ->
    Tuple = rand(List),
    rand_more_f1(lists:delete(Tuple, List), Num - 1,
		 [Tuple | Result]).

rand_more2(List, Num) ->
    case length(List) < Num of
      true -> List;
      _ -> rand_more_f1(List, erlang:max(0, Num), [])
    end.

rand_more_repeat([], _Num) -> [];
rand_more_repeat(List, Num) ->
    rand_more_repeat_f1(List, erlang:max(0, Num), []).

rand_more_repeat_f1(_, 0, Result) -> Result;
rand_more_repeat_f1(List, Num, Result) ->
    Tuple = rand(List),
    rand_more_repeat_f1(List, Num - 1, [Tuple | Result]).

keyrand([], _N) -> undefined;
keyrand(List, N) ->
    Sum = keyrand_f1(List, N, 0),
    if Sum < 1 -> undefined;
       true ->
	   Rand = util:rand(1, Sum), keyrand_f2(List, N, Rand, 0)
    end.

keyrand_f1([], _N, Sum) -> Sum;
keyrand_f1([Tuple | T], N, Sum) ->
    keyrand_f1(T, N, Sum + element(N, Tuple)).

keyrand_f2([], _N, _Rand, _Sum) -> undefined;
keyrand_f2([Tuple | T], N, Rand, Sum) ->
    Rate = element(N, Tuple),
    case Rate + Sum >= Rand of
      true -> Tuple;
      false -> keyrand_f2(T, N, Rand, Sum + Rate)
    end.

keyrand_more(List, Nth, Num) ->
    rand_more_f1(List, Nth, erlang:max(0, Num), []).

rand_more_f1(_, _, 0, Result) -> Result;
rand_more_f1(List, Nth, Num, Result) ->
    Tuple = keyrand(List, Nth),
    rand_more_f1(lists:delete(Tuple, List), Nth, Num - 1,
		 [Tuple | Result]).

keyrand_more2(List, Nth, Num) ->
    Sum = keyrand_f1(List, Nth, 0),
    rand_more2_f1(Sum, List, Nth, erlang:max(0, Num), []).

rand_more2_f1(_, _, _, 0, Result) -> Result;
rand_more2_f1(Sum, List, Nth, Num, Result) ->
    Rand = util:rand(1, Sum),
    Tuple = keyrand_f2(List, Nth, Rand, 0),
    rand_more2_f1(Sum, List, Nth, Num - 1,
		  [Tuple | Result]).

find([], _List, Def) -> Def;
find([Val | T], List, Def) ->
    case lists:member(Val, List) of
      true -> Val;
      false -> find(T, List, Def)
    end.

keyfind(Key, TupleList) ->
    keyfind(Key, TupleList, undefined).

keyfind(Key, TupleList, Def) ->
    case lists:keyfind(Key, 1, TupleList) of
      false -> Def;
      {_, Val} -> Val
    end.

keyfind(Key, Pos, TupleList, Def) ->
    case lists:keyfind(Key, Pos, TupleList) of
      false -> Def;
      Val -> Val
    end.

keyfind_list(KeyList, Pos, TupleList) ->
    keyfind_list_f1(KeyList, Pos, TupleList, []).

keyfind_list_f1([], _Pos, _TupleList, Result) ->
    lists:reverse(Result);
keyfind_list_f1([Key | T], Pos, TupleList, Result) ->
    case lists:keyfind(Key, Pos, TupleList) of
      false -> keyfind_list_f1(T, Pos, TupleList, Result);
      Val ->
	  keyfind_list_f1(T, Pos, TupleList, [Val | Result])
    end.

ukeymerge(N, TupleList1, TupleList2) ->
    ukeymerge_f1(N, lists:ukeysort(N, TupleList1),
		 lists:ukeysort(N, TupleList2)).

ukeymerge_f1(N, [H1 | T1], [H2 | _] = L2)
    when element(N, H1) < element(N, H2) ->
    [H1 | ukeymerge_f1(N, T1, L2)];
ukeymerge_f1(N, [H1 | _] = L1, [H2 | T2])
    when element(N, H1) > element(N, H2) ->
    [H2 | ukeymerge_f1(N, L1, T2)];
ukeymerge_f1(N, [_H1 | T1], [H2 | T2]) ->
    [H2 | ukeymerge_f1(N, T1, T2)];
ukeymerge_f1(_N, [], L2) -> L2;
ukeymerge_f1(_N, L1, []) -> L1.

keyfind_all(Key, N, TupleList) ->
    [T || T <- TupleList, element(N, T) == Key].

keyfind_less_all(Key, N, TupleList) ->
    [T || T <- TupleList, element(N, T) =< Key].

keysfind_all(Keys, N, TupleList) ->
    [T
     || T <- TupleList, lists:member(element(N, T), Keys)].

keysdelete_all(Keys, N, TupleList) ->
    [T
     || T <- TupleList,
	not lists:member(element(N, T), Keys)].

keydelete_all(Key, N, TupleList) ->
    [T || T <- TupleList, element(N, T) /= Key].

keyfind_all_and_sum(Key, N, SumPos, TupleList) ->
    keyfind_all_and_sum(Key, N, SumPos, TupleList, 0).

keyfind_all_and_sum(_Key, _N, _SumPos, [], Sum) -> Sum;
keyfind_all_and_sum(Key, N, SumPos, [Tuple | T], Sum) ->
    Sum2 = case element(N, Tuple) of
	     Key -> element(SumPos, Tuple) + Sum;
	     _ -> Sum
	   end,
    keyfind_all_and_sum(Key, N, SumPos, T, Sum2).

mkeyfind_all_and_sum(KeyList, N, SumPos, TupleList) ->
    mkeyfind_all_and_sum(KeyList, N, SumPos, TupleList, 0).

mkeyfind_all_and_sum(_KeyList, _N, _SumPos, [], Sum) ->
    Sum;
mkeyfind_all_and_sum(KeyList, N, SumPos, [Tuple | T],
		     Sum) ->
    Sum2 = case lists:member(element(N, Tuple), KeyList) of
	     true -> element(SumPos, Tuple) + Sum;
	     _ -> Sum
	   end,
    mkeyfind_all_and_sum(KeyList, N, SumPos, T, Sum2).

keysum(N, TupleList) -> keysum_f1(N, TupleList, 0).

keysum_f1(_N, [], Sum) -> Sum;
keysum_f1(N, [Tuple | T], Sum) ->
    keysum_f1(N, T, element(N, Tuple) + Sum).

key2list(N, TupleList) ->
    [element(N, T) || T <- TupleList].

key2list(_N, [], ResList) -> ResList;
key2list(N, [H | T], ResList) ->
    key2list(N, T, [element(N, H) | ResList]).

keyupdate(Key, N, TupleList, IVList) ->
    case lists:keyfind(Key, N, TupleList) of
      false -> TupleList;
      T ->
	  lists:keyreplace(Key, N, TupleList,
			   lists:foldl(fun ({I, V}, X) -> setelement(I, X, V)
				       end,
				       T, IVList))
    end.

-spec keyadd(Key :: any(), N :: pos_integer(),
	     list()) -> list().

keyadd(Key, N, []) -> [{Key, N}];
keyadd(Key, N, List) ->
    case lists:keyfind(Key, 1, List) of
      false -> [{Key, N} | List];
      {Key, N1} ->
	  lists:keyreplace(Key, 1, List, {Key, N + N1})
    end.

keyadd(K, N, L, IVList) when is_integer(N), N > 0 ->
    keyadd3(K, N, L, IVList).

keyadd3(Key, Pos, [Tup | Tail], IVList) ->
    K = element(Pos, Tup),
    if K == Key ->
	   New = lists:foldl(fun ({I, V}, X) ->
				     Elem = element(I, X),
				     setelement(I, X, max(Elem + V, 0))
			     end,
			     Tup, IVList),
	   [New | Tail];
       true -> [Tup | keyadd3(Key, Pos, Tail, IVList)]
    end;
keyadd3(_, _, [], _) -> [].

ustore(E, L) ->
    case lists:member(E, L) of
      true -> L;
      false -> [E | L]
    end.

diff(L1, L2) -> diff_f1(L1, L2, []).

diff_f1([], _L2, Res) -> Res;
diff_f1([H | T], L2, Res) ->
    case lists:member(H, L2) of
      true -> diff_f1(T, L2, Res);
      false -> diff_f1(T, L2, [H | Res])
    end.

member([], _) -> false;
member([H | T], List) ->
    case lists:member(H, List) of
      true -> true;
      false -> member(T, List)
    end.

member1([], _) -> false;
member1(List1, List2) -> member1_1(List1, List2).

member1_1([], _) -> true;
member1_1([H | T], List) ->
    case lists:member(H, List) of
      true -> member1_1(T, List);
      false -> false
    end.

is_diff(L1, L2) ->
    case is_diff_1(L1, L2) of
      [] -> true;
      _ -> false
    end.

is_diff_1(L1, L2) -> is_diff_2(L1, L2, []).

is_diff_2([], _L2, Res) -> Res;
is_diff_2([H | T], L2, Res) ->
    case lists:member(H, L2) of
      true -> is_diff_2(T, L2, [H | Res]);
      false -> is_diff_2(T, L2, Res)
    end.

nth([], _N) -> undefined;
nth(_, N) when N < 1 -> undefined;
nth([H | _T], 1) -> H;
nth([_ | T], N) -> nth(T, N - 1).

nthupdate(L, N, Val) ->
    tuple_to_list(setelement(N, list_to_tuple(L), Val)).

nthdelete(L, N) -> nthdelete_f1(L, N, 1, []).

nthdelete_f1([], _N, _I, Res) -> lists:reverse(Res);
nthdelete_f1([_H | T], N, N, Res) ->
    nthdelete_f1(T, N, N + 1, Res);
nthdelete_f1([H | T], N, I, Res) ->
    nthdelete_f1(T, N, I + 1, [H | Res]).

diff_split(KeyPosFind, TL1, TL2) ->
    diff_split(KeyPosFind, TL1, TL2, [], [], []).

diff_split(_KeyPosFind, [], T2Rest, UpNewL, SameL,
	   NoneEL) ->
    {T2Rest ++ UpNewL, SameL, NoneEL};
diff_split(KeyPosFind, [HeadT | T], TL2, UpNewL, SameL,
	   NoneEL) ->
    ElemVal = element(KeyPosFind, HeadT),
    case lists:keyfind(ElemVal, KeyPosFind, TL2) of
      false ->
	  diff_split(KeyPosFind, T, TL2, UpNewL, SameL,
		     [HeadT | NoneEL]);
      HeadT ->
	  diff_split(KeyPosFind, T, lists:delete(HeadT, TL2),
		     UpNewL, [HeadT | SameL], NoneEL);
      ElemtTL2 ->
	  diff_split(KeyPosFind, T, lists:delete(ElemtTL2, TL2),
		     [ElemtTL2 | UpNewL], SameL, NoneEL)
    end.

find_index(_Val, []) -> 0;
find_index(Val, [E | T]) ->
    case Val >= E of
      true -> find_index(Val, T);
      false -> E
    end.

sublist(List, S, E) ->
    case S > length(List) of
      true -> [];
      _ -> lists:sublist(List, S, E)
    end.

group_by(Pos, TupleList) ->
    group_by(Pos, TupleList, []).

group_by(_Pos, [], Res) -> Res;
group_by(Pos, [E | T], Res) ->
    V = element(Pos, E),
    case lists:member(V, Res) of
      true -> group_by(Pos, T, Res);
      false -> group_by(Pos, T, [V | Res])
    end.

group_by_type(List, Pos) ->
    do_group_by_type(List, Pos, []).

do_group_by_type([], _Pos, L) -> L;
do_group_by_type([I | T], Pos, L) ->
    V = element(Pos, I),
    NewL = case lists:keyfind(V, 1, L) of
	     false -> [{V, [I]} | L];
	     {V, L1} ->
		 lists:keyreplace(V, 1, L, [{V, [I | L1]} | L])
	   end,
    do_group_by_type(T, Pos, NewL).

set_list_element(N, List, Value) ->
    {L1, [_ToReplace | L2]} = lists:split(N - 1, List),
    L1 ++ [Value] ++ L2.

delete_list_element(N, List) ->
    {L1, [_ToDelete | L2]} = lists:split(N - 1, List),
    L1 ++ L2.

list_replace(Old, New, List) ->
    list_replace_f1(Old, New, List, []).

list_replace_f1(_Old, _New, [], R) -> lists:reverse(R);
list_replace_f1(Old, New, [Cur | List], R) ->
    case Old == Cur of
      true -> list_replace_f1(Old, New, List, [New | R]);
      false -> list_replace_f1(Old, New, List, [Cur | R])
    end.

list_replace_one(Old, New, List) ->
    list_replace_one_f1(Old, New, List, []).

list_replace_one_f1(_Old, _New, [], R) ->
    lists:reverse(R);
list_replace_one_f1(Old, New, [Cur | List], R) ->
    case Old == Cur of
      true -> lists:reverse(R) ++ [New | List];
      false -> list_replace_one_f1(Old, New, List, [Cur | R])
    end.

number_member(Val, List) -> number_member_1(List, Val).

number_member_1([], _Val) -> false;
number_member_1([Val1 | _T], Val) when Val1 == Val ->
    true;
number_member_1([_Val1 | T], Val) ->
    number_member_1(T, Val).

keyfind2(Key1, Key2, Pos2, List) ->
    {Key1, SubList} = keyfind(Key1, 1, List, {Key1, []}),
    lists:keyfind(Key2, Pos2, SubList).

keyreplace2(Key1, Key2, Pos2, List, Data) ->
    {Key1, SubList} = keyfind(Key1, 1, List, {Key1, []}),
    NewSubList = lists:keyreplace(Key2, Pos2, SubList,
				  Data),
    lists:keyreplace(Key1, 1, List, {Key1, NewSubList}).

keystore2(Key1, Key2, Pos2, List, Data) ->
    {Key1, SubList} = keyfind(Key1, 1, List, {Key1, []}),
    NewSubList = lists:keystore(Key2, Pos2, SubList, Data),
    lists:keystore(Key1, 1, List, {Key1, NewSubList}).

keydelete2(Key1, Key2, Pos2, List) ->
    case lists:keyfind(Key1, 1, List) of
      false -> List;
      {Key1, SubList} ->
	  lists:keyreplace(Key1, 1, List,
			   {Key1, lists:keydelete(Key2, Pos2, SubList)})
    end.

mix_key_val(List, []) -> List;
mix_key_val(List, [{Key, Val} | T]) ->
    Val1 = list_util:keyfind(Key, List, 0),
    NList = lists:keystore(Key, 1, List, {Key, Val + Val1}),
    mix_key_val(NList, T).

shuffle(List) -> shuffle(List, []).

shuffle([], Acc) -> Acc;
shuffle(List, Acc) ->
    {Leading, [H | T]} = lists:split(util:rand(1,
					       length(List))
				       - 1,
				     List),
    shuffle(Leading ++ T, [H | Acc]).

filter_replicat(List) -> filter_replicat(List, []).

filter_replicat([], List) -> List;
filter_replicat([H | Rest], List) ->
    case lists:member(H, List) of
      true -> filter_replicat(Rest, List);
      _ -> filter_replicat(Rest, [H | List])
    end.

list_add(List1, List2) -> list_add_1(List1, List2, []).

list_add_1([], _List2, Result) -> lists:reverse(Result);
list_add_1([V1 | T1], [], Result) ->
    list_add_1(T1, [], [V1 | Result]);
list_add_1([V1 | T1], [V2 | T2], Result) ->
    list_add_1(T1, T2, [V1 + V2 | Result]).

page_data(_L, _Start, 0) -> [];
page_data(L, Start, Num) ->
    Idx = max(0, Start - 1),
    {_, L1} = list_util:split(Idx, L),
    lists:sublist(L1, Num).

zip(List1, List2) ->
    L1 = length(List1),
    L2 = length(List2),
    if L1 > L2 ->
	   {RealL1, _} = lists:split(L2, List1),
	   lists:zip(RealL1, List2);
       L1 < L2 ->
	   {RealL2, _} = lists:split(L1, List2),
	   lists:zip(List1, RealL2);
       true -> lists:zip(List1, List2)
    end.

calc_element_count(List) ->
    calc_element_count_(List, []).

calc_element_count_([], Result) -> Result;
calc_element_count_([H | T], Result) ->
    case lists:keyfind(H, 1, Result) of
      false -> calc_element_count_(T, [{H, 1} | Result]);
      {H, C} ->
	  New = lists:keyreplace(H, 1, Result, {H, C + 1}),
	  calc_element_count_(T, New)
    end.

-spec add_sort(list(), tuple(), list(),
	       pos_integer()) -> list().

add_sort(SortList, AddE, SortKeys, PriKey) ->
    add_sort(SortList, AddE, SortKeys, PriKey,
	     get_element(PriKey, AddE), []).

add_sort([], undefined, _SortKeys, _PriKey, _PriVal,
	 L) ->
    lists:reverse(L);
add_sort([], AddE, _SortKeys, _PriKey, _PriVal, L) ->
    lists:reverse([AddE | L]);
add_sort([I | T], undefined, SortKeys, PriKey,
	 PriVal = undefined, L) ->
    add_sort(T, undefined, SortKeys, PriKey, PriVal,
	     [I | L]);
add_sort([I | T], AddE, SortKeys, PriKey, PriVal, L) ->
    case get_element(PriKey, I) =:= PriVal of
      true ->
	  add_sort(T, AddE, SortKeys, PriKey, undefined, L);
      false when AddE =:= undefined ->
	  add_sort(T, AddE, SortKeys, PriKey, PriVal, [I | L]);
      false ->
	  case compare_(SortKeys, I, AddE) of
	    true ->
		add_sort(T, AddE, SortKeys, PriKey, PriVal, [I | L]);
	    same when PriVal =/= undefined ->
		add_sort(T, AddE, SortKeys, PriKey, PriVal, [I | L]);
	    _ ->
		add_sort([I | T], undefined, SortKeys, PriKey, PriVal,
			 [AddE | L])
	  end
    end.

compare_([], _E1, _E2) -> same;
compare_([Pos | T], E1, E2) ->
    V1 = get_element(Pos, E1),
    V2 = get_element(Pos, E2),
    if V1 > V2 -> true;
       V1 < V2 -> false;
       true -> compare_(T, E1, E2)
    end.

get_element({asc, Pos}, Ele) -> -get_element(Pos, Ele);
get_element(Pos, Ele)
    when is_integer(Pos) andalso Pos > 0 ->
    element(Pos, Ele);
get_element(Pos, Ele)
    when is_integer(Pos) andalso Pos < 0 ->
    -element(-Pos, Ele);
get_element(Pos, Ele) -> maps:get(Pos, Ele).

-spec set_idx(list(), pos_integer()) -> list().

set_idx(List, Pos) -> set_idx(List, Pos, 1, []).

set_idx([], _Pos, _Idx, L) -> lists:reverse(L);
set_idx([I | T], Pos, Idx, L) ->
    set_idx(T, Pos, Idx + 1, [setelement(Pos, I, Idx) | L]).


