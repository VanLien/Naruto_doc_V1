-file("src/lib/util.erl", 1).

-module(util).

-lager_records([{file_descriptor, [module, data]},
		{file_info,
		 [size, type, access, atime, mtime, ctime, mode, links,
		  major_device, minor_device, inode, uid, gid]}]).

-export([sleep/1, is_process_alive/1, get/2, exec_fun/3,
	 set_ms_timer/3, set_ms_timer/4, set_timer/3,
	 set_timer/4, get_timer/1, unset_timer/1, unset_timers/1,
	 unset_all_timer/0, has_timer/1, floor/1, ceil/1,
	 round/1, ufloor/1, uceil/1, uround/1, rand/2,
	 rand_per_mille/1, uint/1, uint/2, uint32/1, uint16/1,
	 uint_i/1, int_bool/1, pow/2, abs/1, format/2,
	 format_ex/2, ip_to_binary/1, term_to_binary/1,
	 term_to_base_binary/1, binary_to_term/1,
	 ets_lookup_element/3, ets_lookup_element/4,
	 ets_update_element/3, if_in_list/3, if_val/3,
	 if_undefined/2, if_true/3, if_true_run/2, if_true_run/3,
	 if_true_int/3, apply_begin/1, apply/4, apply_commit/1,
	 apply_clean/1, apply_clean_all/1, pages/3,
	 to_percentage/1, term_to_string/1, string_to_term/1,
	 term_to_bitstring/1, for/3, check_range/3,
	 permillage_correct/2, is_same_pos/2, to_atom/1,
	 get_stacktrace/0, print_stacktrace/0, rand_table/1,
	 rand_list/1, rand_list/2, rand_list_n/2, rand_list_n/3,
	 load/1, save/2, template/2, template_replace/2, md5/1,
	 cn/1, cn/2, fbin/2, flist/1, flist/2, keys_sort/2,
	 to_list/1, to_binary/1, close_dets/1, multi_exec/3,
	 multi_exec/4, sync_multi_exec/3, sync_multi_exec/4,
	 shuffle/1, fun_form_mod/1]).

-export([atom_to_int/1, int_to_atom/1]).

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

-file("src/lib/util.erl", 87).

-file("/usr/local/lib/erlang/lib/kernel-5.2/include/"
      "file.hrl",
      1).

-record(file_info,
	{size  :: non_neg_integer() | undefined,
	 type  ::
	     device | directory | other | regular | symlink |
	     undefined,
	 access  :: read | write | read_write | none | undefined,
	 atime  ::
	     file:date_time() | non_neg_integer() | undefined,
	 mtime  ::
	     file:date_time() | non_neg_integer() | undefined,
	 ctime  ::
	     file:date_time() | non_neg_integer() | undefined,
	 mode  :: non_neg_integer() | undefined,
	 links  :: non_neg_integer() | undefined,
	 major_device  :: non_neg_integer() | undefined,
	 minor_device  :: non_neg_integer() | undefined,
	 inode  :: non_neg_integer() | undefined,
	 uid  :: non_neg_integer() | undefined,
	 gid  :: non_neg_integer() | undefined}).

-record(file_descriptor,
	{module  :: module(), data  :: term()}).

-file("src/lib/util.erl", 93).

is_process_alive(P) when is_pid(P) ->
    case node() =:= node(P) of
      true -> erlang:is_process_alive(P);
      false ->
	  case catch big_world_lib:call({pid, P}, erlang,
					is_process_alive, [P])
	      of
	    true -> true;
	    false -> false;
	    _ -> false
	  end
    end;
is_process_alive(_) -> false.

get(Key, DefVal) ->
    case get(Key) of
      undefined -> DefVal;
      Val -> Val
    end.

exec_fun(undefined, Fun, Args) ->
    erlang:apply(Fun, Args);
exec_fun(Mon, Fun, Args) ->
    erlang:apply(Mon, Fun, Args).

-spec sleep(T :: integer()) -> ok.

sleep(T) -> receive  after T -> ok end.

set_ms_timer(Name, MS, Info) ->
    set_ms_timer(Name, MS, self(), Info).

set_ms_timer({check_timer, Name}, MS, Pid, Info) ->
    case has_timer(Name) of
      false -> set_ms_timer(Name, MS, Pid, Info);
      _ -> false
    end;
set_ms_timer(Name, MS, Pid, Info) when is_integer(MS) ->
    case get('$dict_timer') of
      undefined ->
	  put('$dict_timer',
	      gb_trees:enter(Name, erlang:send_after(MS, Pid, Info),
			     gb_trees:empty()));
      Tree ->
	  case gb_trees:lookup(Name, Tree) of
	    none ->
		put('$dict_timer',
		    gb_trees:enter(Name, erlang:send_after(MS, Pid, Info),
				   Tree));
	    {value, Ref} ->
		erlang:cancel_timer(Ref),
		put('$dict_timer',
		    gb_trees:enter(Name, erlang:send_after(MS, Pid, Info),
				   gb_trees:delete(Name, Tree)))
	  end
    end.

set_timer(Name, TimeMix, Info) ->
    set_timer(Name, TimeMix, self(), Info).

set_timer(Name, {H, M, S}, Pid, Info) ->
    Sec = date:next_diff({H, M, S}),
    set_timer(Name, Sec, Pid, Info);
set_timer(Name, Sec, Pid, Info) when is_integer(Sec) ->
    NewSec = case Sec >= 0 of
	       true -> Sec;
	       _ ->
		   case {whereis(lager_event), whereis(lager_event),
			 lager_config:get({lager_event, loglevel}, {0, []})}
		       of
		     {undefined, undefined, _} ->
			 fun () -> {error, lager_not_running} end();
		     {undefined, _, _} ->
			 fun () -> {error, {sink_not_configured, lager_event}}
			 end();
		     {__Pidutil186, _, {__Levelutil186, __Tracesutil186}}
			 when __Levelutil186 band 8 /= 0 orelse
				__Tracesutil186 /= [] ->
			 lager:do_log(error,
				      [{module, util}, {function, set_timer},
				       {line, 186}, {pid, pid_to_list(self())},
				       {node, node()}
				       | lager:md()],
				      io_lib:format("设置用进程字典存放的定时器错误[Name:~w][Sec:~w][Info:~w], "
						    "stack:~w",
						    [Name, Sec, Info,
						     util:get_stacktrace()]),
				      none, 4096, 8, __Levelutil186,
				      __Tracesutil186, lager_event,
				      __Pidutil186);
		     _ -> ok
		   end,
		   1
	     end,
    set_ms_timer(Name, NewSec * 1000, Pid, Info).

get_timer(Name) ->
    case get('$dict_timer') of
      undefined -> false;
      Tree ->
	  case gb_trees:lookup(Name, Tree) of
	    none -> false;
	    {value, Ref} -> erlang:read_timer(Ref)
	  end
    end.

-spec has_timer(any()) -> true | false.

has_timer(Name) ->
    case get('$dict_timer') of
      undefined -> false;
      Tree ->
	  case gb_trees:lookup(Name, Tree) of
	    none -> false;
	    {value, _Ref} -> true
	  end
    end.

unset_timer(Name) ->
    case get('$dict_timer') of
      undefined -> ok;
      Tree ->
	  case gb_trees:lookup(Name, Tree) of
	    none -> ok;
	    {value, Ref} ->
		erlang:cancel_timer(Ref),
		put('$dict_timer', gb_trees:delete(Name, Tree))
	  end
    end.

unset_timers(Names) ->
    case get('$dict_timer') of
      undefined -> ok;
      Tree -> unset_timers_f1(Names, Tree), ok
    end.

unset_timers_f1([], Tree) -> put('$dict_timer', Tree);
unset_timers_f1([Name | T], Tree) ->
    case gb_trees:lookup(Name, Tree) of
      none -> unset_timers_f1(T, Tree);
      {value, Ref} ->
	  erlang:cancel_timer(Ref),
	  unset_timers_f1(T, gb_trees:delete(Name, Tree))
    end.

unset_all_timer() ->
    case erase('$dict_timer') of
      undefined -> ok;
      Tree ->
	  gb_trees:map(fun (_K, Ref) -> erlang:cancel_timer(Ref)
		       end,
		       Tree)
    end.

ceil(Float) ->
    T = erlang:trunc(Float),
    case Float > T of
      true -> T + 1;
      _ -> T
    end.

uceil(Float) when Float > 0 -> ceil(Float);
uceil(_) -> 0.

floor(Float) ->
    T = erlang:trunc(Float),
    case T > Float of
      true -> T - 1;
      _ -> T
    end.

ufloor(Float) when Float > 0 -> erlang:trunc(Float);
ufloor(_Float) -> 0.

round(Float) -> erlang:round(Float).

uround(Float) when Float > 0 -> erlang:round(Float);
uround(_) -> 0.

abs(Float) when Float >= 0 -> Float;
abs(Float) -> -Float.

rand(Min, Max) when Min >= Max -> Min;
rand(Min, Max) ->
    case get(rand_seed) of
      undefined ->
	  case crypto:strong_rand_bytes(12) of
	    <<A:32, B:32, C:32>> ->
		rand:seed(exsplus, {A, B, C}), ok;
	    _ -> ignore
	  end;
      _ -> ignore
    end,
    M = Min - 1,
    rand:uniform(Max - M) + M.

rand_per_mille(R) when R >= 1000 -> true;
rand_per_mille(R) -> rand(1, 10000) =< R * 10.

rand_table([]) -> undefined;
rand_table([{_Weight, _Data} | _] = Table) ->
    Max = lists:sum([Weight || {Weight, _} <- Table]),
    Rand = rand(1, Max),
    rand_table1(0, Rand, Table).

rand_table1(_SubSum, _Rand, []) -> undefined;
rand_table1(SubSum, Rand, [{Weight, Data} | T]) ->
    case Rand > SubSum andalso Rand =< SubSum + Weight of
      true -> Data;
      _ -> rand_table1(SubSum + Weight, Rand, T)
    end.

-spec rand_list(List :: list()) -> undefined | term().

rand_list([]) -> undefined;
rand_list([I]) -> I;
rand_list(List) ->
    Idx = rand(1, length(List)),
    get_term_from_list(List, Idx).

get_term_from_list([H | _T], 1) -> H;
get_term_from_list([_H | T], Idx) ->
    get_term_from_list(T, Idx - 1).

-spec rand_list(List :: [tuple()],
		Pos :: pos_integer()) -> undefined | tuple().

rand_list([], _Pos) -> undefined;
rand_list([I], _Pos) -> I;
rand_list(List0, Pos) ->
    List = shuffle(List0),
    Sum = lists:sum([element(Pos, I) || I <- List]),
    RandVal = rand(1, Sum),
    get_rand_tuple(List, Pos, RandVal).

get_rand_tuple([H | T], Pos, RandVal) ->
    Rand = element(Pos, H),
    case RandVal =< Rand of
      true -> H;
      false -> get_rand_tuple(T, Pos, RandVal - Rand)
    end.

rand_list_n([], _) -> undefined;
rand_list_n([I], 1) -> [I];
rand_list_n(List, Num) ->
    do_rand_list_n_3(List, Num, []).

do_rand_list_n_3([], _, GetList) -> GetList;
do_rand_list_n_3(_, Num, GetList) when Num =< 0 ->
    GetList;
do_rand_list_n_3(List, Num, GetList) ->
    Idx = rand(1, length(List)),
    {Get, NewList} = get_term_from_list(List, Idx, []),
    do_rand_list_n_3(NewList, Num - 1, [Get | GetList]).

get_term_from_list([H | T], 1, List) -> {H, List ++ T};
get_term_from_list([H | T], Idx, List) ->
    get_term_from_list(T, Idx - 1, [H | List]).

rand_list_n([], _Pos, _Num) -> [];
rand_list_n([I], _Pos, 1) -> [I];
rand_list_n(List, Pos, Num) when is_integer(Pos) ->
    Sum = lists:sum([element(Pos, I) || I <- List]),
    rand_list_n(List, Pos, Sum, Num, []);
rand_list_n(List, Pos, Num) ->
    Sum = lists:sum([maps:get(Pos, I) || I <- List]),
    rand_list_n(List, Pos, Sum, Num, []).

rand_list_n(_List, _Pos, _Sum, Num, GetList)
    when Num =< 0 ->
    GetList;
rand_list_n([], _, _, _, GetList) -> GetList;
rand_list_n(List, Pos, Sum, Num, GetList) ->
    Seed = util:rand(1, Sum),
    case do_rand_list_n(List, Pos, Seed, Sum) of
      {NewList, Get, NewSum} ->
	  rand_list_n(NewList, Pos, NewSum, Num - 1,
		      [Get | GetList]);
      {false, Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidutil426, _, {__Levelutil426, __Tracesutil426}}
		when __Levelutil426 band 8 /= 0 orelse
		       __Tracesutil426 /= [] ->
		lager:do_log(error,
			     [{module, util}, {function, rand_list_n},
			      {line, 426}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("随机数据发生错误，数据内容为:~w", [Reason]), none,
			     4096, 8, __Levelutil426, __Tracesutil426,
			     lager_event, __Pidutil426);
	    _ -> ok
	  end,
	  rand_list_n(List, Pos, Sum, Num - 1, GetList)
    end.

do_rand_list_n(List, Pos, Seed, Sum) ->
    do_rand_list_n(List, Pos, Seed, Sum, 0, []).

do_rand_list_n([], _Pos, _Seed, _Sum, _Range, _Back) ->
    {false, util:flist("~w", [_Back])};
do_rand_list_n([L | T], Pos, Seed, Sum, Range, Back)
    when is_integer(Pos) ->
    Ratio = element(Pos, L),
    case Seed =< Ratio + Range of
      true -> {T ++ Back, L, Sum - Ratio};
      false ->
	  do_rand_list_n(T, Pos, Seed, Sum, Range + Ratio,
			 [L | Back])
    end;
do_rand_list_n([L | T], Pos, Seed, Sum, Range, Back) ->
    Ratio = maps:get(Pos, L),
    case Seed =< Ratio + Range of
      true -> {T ++ Back, L, Sum - Ratio};
      false ->
	  do_rand_list_n(T, Pos, Seed, Sum, Range + Ratio,
			 [L | Back])
    end.

pow(X, Y) -> uint(math:pow(X, Y)).

uint(Int) when Int > 0 -> trunc(Int);
uint(_) -> 0.

uint_i(Int) when Int > 0 -> Int;
uint_i(_) -> 0.

uint(Val, UpperLimit) -> min(uint(Val), UpperLimit).

uint32(Int) when Int > 4294967295 -> 4294967295;
uint32(Int) -> uint(Int).

uint16(Int) when Int > 65535 -> 65535;
uint16(Int) -> uint(Int).

int_bool(1) -> 1;
int_bool(true) -> 1;
int_bool(_) -> 0.

format(Format, Args) ->
    unicode:characters_to_binary(io_lib:format(Format,
					       Args)).

format_ex(Format, Args) when is_binary(Format) ->
    format_ex(binary_to_list(Format), Args, []);
format_ex(Format, Args) when is_list(Format) ->
    format_ex(Format, Args, []).

format_ex([], _Args, Res) ->
    list_to_binary(lists:reverse(Res));
format_ex([$~, $w | T], [A | Args], Res)
    when is_integer(A) ->
    format_ex(T, Args, [integer_to_list(A) | Res]);
format_ex([$~, $w | T], [A | Args], Res)
    when is_atom(A) ->
    format_ex(T, Args, [atom_to_list(A) | Res]);
format_ex([$~, $s | T], [A | Args], Res) ->
    format_ex(T, Args, [A | Res]);
format_ex([C | T], Args, Res) ->
    format_ex(T, Args, [C | Res]).

ip_to_binary({P1, P2, P3, P4}) ->
    list_to_binary([integer_to_list(P1) ++
		      "." ++
			integer_to_list(P2) ++
			  "." ++
			    integer_to_list(P3) ++ "." ++ integer_to_list(P4)]).

term_to_binary(Term) ->
    list_to_binary(io_lib:format("~p", [Term])).

term_to_base_binary(Term) ->
    list_to_binary(io_lib:format("~w", [Term])).

binary_to_term(Bin) ->
    Bin2 = re:replace(Bin, "<\\d+\\.\\d+\\.\\d+>", "0",
		      [{return, binary}]),
    case erlang:size(Bin) =:= erlang:size(Bin2) of
      true -> ignore;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidutil545, _, {__Levelutil545, __Tracesutil545}}
		when __Levelutil545 band 8 /= 0 orelse
		       __Tracesutil545 /= [] ->
		lager:do_log(error,
			     [{module, util}, {function, binary_to_term},
			      {line, 545}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("骚年，你的这货~s,里面有存pid。干掉它吧！", [Bin]),
			     none, 4096, 8, __Levelutil545, __Tracesutil545,
			     lager_event, __Pidutil545);
	    _ -> ok
	  end
    end,
    case erl_scan:string(binary_to_list(Bin2) ++ ".") of
      {ok, Tokens, _} ->
	  case erl_parse:parse_term(Tokens) of
	    {ok, Term} -> Term;
	    _Err -> undefined
	  end;
      _Error -> undefined
    end.

ets_lookup_element(Tab, Key, Pos) ->
    ets_lookup_element(Tab, Key, Pos, null).

ets_lookup_element(Tab, Key, Pos, Def) ->
    case catch ets:lookup_element(Tab, Key, Pos) of
      {'EXIT', _} -> Def;
      Elem -> Elem
    end.

ets_update_element(Tab, Key, Mix) ->
    catch ets:update_element(Tab, Key, Mix).

if_in_list(Val, List, DefVal) ->
    case lists:member(Val, List) of
      true -> Val;
      false -> DefVal
    end.

if_val(Val, Val, DefVal) -> DefVal;
if_val(Val, _Val, _DefVal) -> Val.

if_undefined(undefined, Def) -> Def;
if_undefined(Val, _Def) -> Val.

if_true(true, V1, _V2) -> V1;
if_true(_Is, _V1, V2) -> V2.

if_true_int(1, V1, _V2) -> V1;
if_true_int(0, _V1, V2) -> V2.

if_true_run(Bool, {M, F, A}) ->
    if_true_run(Bool, {M, F, A}, ignore).

if_true_run(true, {M, F, A}, _Def) ->
    erlang:apply(M, F, A);
if_true_run(_, _MFA, Def) -> Def.

apply_begin(Key) ->
    case get(Key) of
      undefined -> put(Key, []);
      Buffer -> put(Key, do_apply_begin(Buffer))
    end.

has_child([P, C]) when is_list(P), is_list(C) -> true;
has_child(_) -> false.

do_apply_begin(P) -> [P, []].

apply(Key, M, F, A) ->
    case get(Key) of
      undefined -> apply(M, F, A);
      Buffer -> put(Key, do_apply(Buffer, {M, F, A}))
    end.

do_apply(P, MFA) ->
    case has_child(P) of
      true -> [P2, C2] = P, [P2, do_apply(C2, MFA)];
      false -> [MFA | P]
    end.

apply_clean(Key) ->
    case get(Key) of
      undefined ->
	  io:format("error: apply_clean ~w~n", [Key]);
      Buffer ->
	  MewBuffer = do_apply_clean(Buffer),
	  put(Key, MewBuffer),
	  ok
    end.

apply_clean_all(Key) -> erase(Key).

do_apply_clean(P) ->
    case has_child(P) of
      true -> [C2, _P2] = P, C2;
      false -> undefined
    end.

apply_commit(Key) ->
    case get(Key) of
      undefined ->
	  io:format("error: apply_commit ~w~n", [Key]);
      Buffer ->
	  MewBuffer = do_apply_commit(Buffer),
	  put(Key, MewBuffer),
	  ok
    end.

apply_commit_f1([]) -> ok;
apply_commit_f1([{M, F, A} | T]) ->
    case catch apply(M, F, A) of
      {'EXIT', Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidutil692, _, {__Levelutil692, __Tracesutil692}}
		when __Levelutil692 band 8 /= 0 orelse
		       __Tracesutil692 /= [] ->
		lager:do_log(error,
			     [{module, util}, {function, apply_commit_f1},
			      {line, 692}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~w", [Reason]), none, 4096, 8,
			     __Levelutil692, __Tracesutil692, lager_event,
			     __Pidutil692);
	    _ -> ok
	  end;
      _ -> apply_commit_f1(T)
    end.

do_apply_commit(P) ->
    case has_child(P) of
      true ->
	  [C2, P2] = P, apply_commit_f1(lists:reverse(P2)), C2;
      false -> apply_commit_f1(lists:reverse(P)), undefined
    end.

pages(_PageSize, _PageNum, []) -> {0, 0, []};
pages(PageSize, PageNum, Datas) ->
    MaxPageNum = util:ceil(length(Datas) / PageSize),
    PageNum1 = if PageNum > MaxPageNum orelse
		    PageNum =< 0 ->
		      MaxPageNum;
		  true -> PageNum
	       end,
    Start = (PageNum1 - 1) * PageSize + 1,
    Page = lists:sublist(Datas, Start, PageSize),
    {PageNum1, MaxPageNum, Page}.

to_percentage(Float) ->
    erlang:round(Float * 10000) div 100.

-spec keys_sort([pos_integer()],
		[tuple()]) -> [tuple()].

keys_sort([], TupleList) -> lists:reverse(TupleList);
keys_sort([{asc, H} | T], TupleList) ->
    Fun = fun (E1, E2) -> element(H, E1) > element(H, E2)
	  end,
    NewTupleList = lists:sort(Fun, TupleList),
    keys_sort(T, NewTupleList);
keys_sort([H | T], TupleList) ->
    NewTupleList = lists:keysort(H, TupleList),
    keys_sort(T, NewTupleList).

term_to_string(Term) -> io_lib:format("~w", [Term]).

term_to_bitstring(Term) ->
    list_to_bitstring(term_to_string(Term)).

-spec string_to_term(String) -> {error, Reason} |
				{ok, term()} when String :: undefined |
							    string() |
							    bitstring(),
						  Reason :: term().

string_to_term(undefined) -> {ok, undefined};
string_to_term("undefined") -> {ok, undefined};
string_to_term(String) when is_bitstring(String) ->
    string_to_term(binary_to_list(String));
string_to_term(String) ->
    S = re:replace(String, "<[0-9]+\\.[0-9]+\\.[0-9]+>",
		   "undefined", [{return, list}, global]),
    case erl_scan:string(S ++ ".") of
      {ok, Tokens, _} -> erl_parse:parse_term(Tokens);
      {error, Err, _} -> {error, Err}
    end.

for(End, End, Fun) -> Fun(End), ok;
for(Begin, End, Fun) when Begin < End ->
    Fun(Begin), for(Begin + 1, End, Fun).

check_range(Val, Min, Max) ->
    if Val > Max -> Max;
       Val < Min -> Min;
       true -> Val
    end.

permillage_correct(Val, Permillage) ->
    uint(Val * Permillage / 1000).

is_same_pos(X, TX) -> erlang:abs(X - TX) =< 3.

to_atom(Str) when is_atom(Str) -> Str;
to_atom(Str) when is_binary(Str) ->
    list_to_atom(binary_to_list(Str));
to_atom(Str) when is_list(Str) -> list_to_atom(Str).

get_stacktrace() ->
    catch throw({hello}), erlang:get_stacktrace().

print_stacktrace() ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidutil817, _, {__Levelutil817, __Tracesutil817}}
	  when __Levelutil817 band 64 /= 0 orelse
		 __Tracesutil817 /= [] ->
	  lager:do_log(info,
		       [{module, util}, {function, print_stacktrace},
			{line, 817}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~w", [get_stacktrace()]), none, 4096, 64,
		       __Levelutil817, __Tracesutil817, lager_event,
		       __Pidutil817);
      _ -> ok
    end.

-spec md5(iodata()) -> binary().

md5(Data) ->
    list_to_binary([io_lib:format("~2.16.0b", [N])
		    || N <- binary_to_list(erlang:md5(Data))]).

-spec to_list(any()) -> list().

to_list(X) when is_integer(X) -> integer_to_list(X);
to_list(X) when is_float(X) -> float_to_list(X);
to_list(X) when is_atom(X) -> atom_to_list(X);
to_list(X) when is_binary(X) -> binary_to_list(X);
to_list(X) when is_pid(X) -> pid_to_list(X);
to_list(X) when is_function(X) -> erlang:fun_to_list(X);
to_list(X) when is_port(X) -> erlang:port_to_list(X);
to_list(X) when is_tuple(X) -> to_string(X);
to_list(X) when is_list(X) -> X.

-spec to_binary(integer()) -> binary().

to_binary(Val) when is_integer(Val) ->
    list_to_binary(integer_to_list(Val));
to_binary(Val) when is_float(Val) ->
    list_to_binary(float_to_list(Val));
to_binary(Val) when is_list(Val) ->
    unicode:characters_to_binary(Val);
to_binary(Val) when is_binary(Val) -> Val;
to_binary(Val) when is_atom(Val) ->
    to_binary(atom_to_list(Val));
to_binary(_Val) -> <<>>.

-spec to_string(any()) -> string().

to_string(X) -> lists:flatten(io_lib:format("~w", [X])).

-spec load(string()) -> {ok, undefined} | {ok, term()} |
			{error, term()}.

load(File) ->
    case file:consult(File) of
      {error, Reason} -> {error, Reason};
      {ok, []} -> {ok, []};
      {ok, [Term]} -> {ok, Term}
    end.

-spec save(string(), term()) -> ok | {error, term()}.

save(File, Term) ->
    case file:open(File, [write]) of
      {error, Reason} -> {error, Reason};
      {ok, F} ->
	  io:format(F, "~p.", [Term]), file:close(F), ok
    end.

-spec template(string(),
	       [{atom(), string()}]) -> string() | {error, term()}.

template(File, Vars) ->
    case file:read_file(File) of
      {error, Reason} -> {error, Reason};
      {ok, Content} ->
	  V = [{lists:concat(["{{", K, "}}"]), to_list(V)}
	       || {K, V} <- Vars],
	  template_replace(bitstring_to_list(Content), V)
    end.

template_replace(Text, []) -> Text;
template_replace(Text, [{K, V} | L]) ->
    T = replace(Text, K, V), template_replace(T, L).

-spec replace(string(), string(), string()) -> string().

replace([], _Search, _Replace) -> "";
replace(Str, Search, Replace) ->
    replace(Str, Search, Replace, length(Search), []).

replace(Str, Search, Replace, Len, Rtn) ->
    case string:str(Str, Search) of
      0 -> Rtn ++ Str;
      P ->
	  S = string:substr(Str, 1, P - 1) ++ Replace,
	  replace(string:substr(Str, P + Len), Search, Replace,
		  Len, Rtn ++ S)
    end.

-spec cn(String) -> ok when String :: bitstring() |
				      string().

cn(String) -> cn(String, []).

-spec cn(F, A) -> ok when F :: string() | bitstring(),
			  A :: [term()].

cn(F, A) -> io:format(unicode:characters_to_list(F), A).

-spec fbin(bitstring() | string(), list()) -> binary().

fbin(String, Args) when is_bitstring(String) ->
    fbin(unicode:characters_to_list(String), Args);
fbin(String, Args) ->
    unicode:characters_to_binary(io_lib:format(String,
					       Args)).

flist(Data) -> flist(Data, []).

flist(Data, Args) ->
    lists:flatten(io_lib:format(Data, Args)).

-spec multi_exec(list(), Fun :: function(),
		 ProcNum :: pos_integer()) -> [Ret :: any()].

multi_exec(List, Fun, ProcNum) ->
    multi_exec(List, Fun, ProcNum, undefined).

multi_exec(List, Fun, ProcNum, RetFun) ->
    multi_exec(0, ProcNum, 1, List, Fun, RetFun, []).

multi_exec(0, _ProcNum, _Num, [], _Fun, _RetFun,
	   RetList) ->
    RetList;
multi_exec(N, 1, Num, [I | List], Fun, RetFun,
	   RetList) ->
    Ret = Fun(Num, I),
    multi_exec(N, 1, Num + 1, List, Fun, RetFun,
	       do_exce_ret(Ret, RetFun, RetList));
multi_exec(N, ProcNum, Num, [I | List], Fun, RetFun,
	   RetList)
    when N < ProcNum ->
    Pid = self(),
    spawn(fun () -> Pid ! {self(), Pid, catch Fun(Num, I)}
	  end),
    multi_exec(N + 1, ProcNum, Num + 1, List, Fun, RetFun,
	       RetList);
multi_exec(N, ProcNum, Num, List, Fun, RetFun,
	   RetList) ->
    Pid = self(),
    receive
      {_FromPid, Pid, Ret} ->
	  multi_exec(N - 1, ProcNum, Num, List, Fun, RetFun,
		     do_exce_ret(Ret, RetFun, RetList))
    end.

-spec sync_multi_exec(list(), Fun :: function(),
		      ProcNum :: pos_integer()) -> [Ret :: any()].

sync_multi_exec(List, Fun, ProcNum) ->
    sync_multi_exec(List, Fun, ProcNum, undefined).

sync_multi_exec(List, Fun, ProcNum, RetFun) ->
    sync_multi_exec(0, queue:new(), ProcNum, 1, List, Fun,
		    RetFun, []).

sync_multi_exec(0, _Queue, _ProcNum, _Num, [], _Fun,
		_RetFun, RetList) ->
    RetList;
sync_multi_exec(N, Queue, 1, Num, [I | List], Fun,
		RetFun, RetList) ->
    Ret = Fun(Num, I),
    sync_multi_exec(N, Queue, 1, Num + 1, List, Fun, RetFun,
		    do_exce_ret(Ret, RetFun, RetList));
sync_multi_exec(N, Queue, ProcNum, Num, [I | List], Fun,
		RetFun, RetList)
    when N < ProcNum ->
    Pid = self(),
    P = spawn(fun () ->
		      Pid ! {self(), Pid, catch Fun(Num, I)}
	      end),
    sync_multi_exec(N + 1, queue:in(P, Queue), ProcNum,
		    Num + 1, List, Fun, RetFun, RetList);
sync_multi_exec(N, Queue, ProcNum, Num, List, Fun,
		RetFun, RetList) ->
    Pid = self(),
    {{value, FromPid}, NewQueue} = queue:out(Queue),
    receive
      {FromPid, Pid, Ret} ->
	  sync_multi_exec(N - 1, NewQueue, ProcNum, Num, List,
			  Fun, RetFun, do_exce_ret(Ret, RetFun, RetList))
    end.

do_exce_ret(false, _RetFun, RetList) -> RetList;
do_exce_ret(error, _RetFun, RetList) -> RetList;
do_exce_ret(skip, _RetFun, RetList) -> RetList;
do_exce_ret(Ret, undefined, RetList) -> [Ret | RetList];
do_exce_ret(Ret, RetFun, RetList) ->
    case RetFun(Ret) of
      false -> RetList;
      {ok, NewRet} -> [NewRet | RetList];
      _ -> [Ret | RetList]
    end.

close_dets(Name) ->
    case catch dets:close(Name) of
      ok -> ok;
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidutil996, _, {__Levelutil996, __Tracesutil996}}
		when __Levelutil996 band 8 /= 0 orelse
		       __Tracesutil996 /= [] ->
		lager:do_log(error,
			     [{module, util}, {function, close_dets},
			      {line, 996}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("关闭dets[~w]失败:~w", [Name, _Err]),
			     none, 4096, 8, __Levelutil996, __Tracesutil996,
			     lager_event, __Pidutil996);
	    _ -> ok
	  end
    end.

shuffle(L) when is_list(L) ->
    List1 = [{rand:uniform(), X} || X <- L],
    List2 = lists:keysort(1, List1),
    [E || {_, E} <- List2];
shuffle(L) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidutil1005, _, {__Levelutil1005, __Tracesutil1005}}
	  when __Levelutil1005 band 8 /= 0 orelse
		 __Tracesutil1005 /= [] ->
	  lager:do_log(error,
		       [{module, util}, {function, shuffle}, {line, 1005},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("洗牌，乱序错误，参数不是列表Args:~w", [L]), none, 4096,
		       8, __Levelutil1005, __Tracesutil1005, lager_event,
		       __Pidutil1005);
      _ -> ok
    end,
    [].

atom_to_int(true) -> 1;
atom_to_int(false) -> 0.

int_to_atom(1) -> true;
int_to_atom(0) -> false.

-spec fun_form_mod(function()) -> atom().

fun_form_mod(Fun) when is_function(Fun) ->
    case erlang:fun_info(Fun, module) of
      {module, Mod} -> Mod;
      _ -> undefined
    end;
fun_form_mod(_) -> undefined.


