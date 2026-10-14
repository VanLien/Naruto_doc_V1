-file("src/glc_lib.erl", 1).

-module(glc_lib).

-export([reduce/1, matches/2, onoutput/1, onoutput/2]).

reduce(Query) ->
    repeat(Query,
	   fun (Q0) ->
		   Q1 = repeat(Q0, fun flatten/1),
		   Q2 = required(Q1),
		   Q3 = repeat(Q2, fun flatten/1),
		   Q4 = common(Q3),
		   Q5 = repeat(Q4, fun flatten/1),
		   Q6 = constants(Q5),
		   Q6
	   end).

matches({any, Conds}, Event) ->
    lists:any(fun (Cond) -> matches(Cond, Event) end,
	      Conds);
matches({all, Conds}, Event) ->
    lists:all(fun (Cond) -> matches(Cond, Event) end,
	      Conds);
matches({null, Const}, _Event) -> Const;
matches({Key, '<', Term}, Event) ->
    case gre:find(Key, Event) of
      {true, Term2} -> Term2 < Term;
      false -> false
    end;
matches({Key, '=<', Term}, Event) ->
    case gre:find(Key, Event) of
      {true, Term2} -> Term2 =< Term;
      false -> false
    end;
matches({Key, '=', Term}, Event) ->
    case gre:find(Key, Event) of
      {true, Term2} -> Term2 =:= Term;
      false -> false
    end;
matches({Key, '!=', Term}, Event) ->
    case gre:find(Key, Event) of
      {true, Term2} -> Term2 =/= Term;
      false -> false
    end;
matches({Key, '>', Term}, Event) ->
    case gre:find(Key, Event) of
      {true, Term2} -> Term2 > Term;
      false -> false
    end;
matches({Key, '>=', Term}, Event) ->
    case gre:find(Key, Event) of
      {true, Term2} -> Term2 >= Term;
      false -> false
    end;
matches({Key, '*'}, Event) ->
    case gre:find(Key, Event) of
      {true, _} -> true;
      false -> false
    end;
matches({Key, '!'}, Event) ->
    not matches({Key, '*'}, Event).

repeat(Query, Fun) ->
    case Fun(Query) of
      Query -> Query;
      Query2 -> repeat(Query2, Fun)
    end.

-spec onoutput(glc_ops:op()) -> output | no_return().

onoutput({_, '<', _}) -> output;
onoutput({_, '=<', _}) -> output;
onoutput({_, '=', _}) -> output;
onoutput({_, '>', _}) -> output;
onoutput({_, '>=', _}) -> output;
onoutput({_, '*'}) -> output;
onoutput({_, '!'}) -> output;
onoutput(Query) -> erlang:error(badarg, [Query]).

-spec onoutput(Action :: any(),
	       Query :: glc_ops:op()) -> no_return().

onoutput(Action, Query) ->
    erlang:error(badarg, [Action, Query]).

flatten({all, [Cond]}) -> Cond;
flatten({any, [Cond]}) -> Cond;
flatten({all, Conds}) ->
    flatten_all([flatten(Cond) || Cond <- Conds]);
flatten({any, [_ | _] = Conds}) ->
    flatten_any([flatten(Cond) || Cond <- Conds]);
flatten({with, Cond, Action}) ->
    {with, flatten(Cond), Action};
flatten([{with, _Cond, _Action} | _] = I) ->
    [{with, flatten(Cond), Action}
     || {with, Cond, Action} <- I];
flatten(Other) -> valid(Other).

flatten_all(Conds) ->
    {all, lists:usort(flatten_tag(all, Conds))}.

flatten_any(Conds) ->
    {any, lists:usort(flatten_tag(any, Conds))}.

flatten_tag(Tag, [{Tag, Conds} | T]) ->
    Conds ++ flatten_tag(Tag, T);
flatten_tag(Tag, [H | T]) -> [H | flatten_tag(Tag, T)];
flatten_tag(_Tag, []) -> [].

required({any, [H | _] = Conds}) ->
    Init = ordsets:from_list(case H of
			       {all, Init2} -> Init2;
			       H -> [H]
			     end),
    case required(Conds, Init) of
      nonefound ->
	  Conds2 = [required(Cond) || Cond <- Conds],
	  {any, Conds2};
      {found, Req} ->
	  Conds2 = [required(deleteall(Cond, Req))
		    || Cond <- Conds],
	  {all, [{all, Req}, {any, Conds2}]}
    end;
required({all, Conds}) ->
    {all, [required(Cond) || Cond <- Conds]};
required(Other) -> Other.

required([{all, Conds} | T], Acc) ->
    required(T,
	     ordsets:intersection(ordsets:from_list(Conds), Acc));
required([{any, _} | _] = Cond, Acc) ->
    erlang:error(badarg, [Cond, Acc]);
required([H | T], Acc) ->
    required(T,
	     ordsets:intersection(ordsets:from_list([H]), Acc));
required([], [_ | _] = Req) -> {found, Req};
required([], []) -> nonefound.

common({all, Conds}) ->
    case common_(Conds, []) of
      {found, Found} ->
	  {all, [Found | [delete(Cond, Found) || Cond <- Conds]]};
      nonefound -> {all, [common(Cond) || Cond <- Conds]}
    end;
common({any, Conds}) ->
    {any, [common(Cond) || Cond <- Conds]};
common(Other) -> Other.

common_([{any, Conds} | T], Seen) ->
    Set = ordsets:from_list(Conds),
    case ordsets:intersection(Set, Seen) of
      [] -> common_(T, ordsets:union(Set, Seen));
      [H | _] -> {found, H}
    end;
common_([H | T], Seen) ->
    case ordsets:is_element(H, Seen) of
      false ->
	  common_(T, ordsets:union(ordsets:from_list([H]), Seen));
      true -> {found, H}
    end;
common_([], _Seen) -> nonefound.

constants(Query) -> delete(Query, {null, true}).

delete({all, Conds}, Filter) ->
    {all,
     [delete(Cond, Filter)
      || Cond <- Conds, Cond =/= Filter]};
delete({any, Conds}, Filter) ->
    {any,
     [delete(Cond, Filter)
      || Cond <- Conds, Cond =/= Filter]};
delete(Filter, Filter) -> {null, true};
delete(Cond, _Filter) -> Cond.

deleteall(Filter, [H | T]) ->
    deleteall(delete(Filter, H), T);
deleteall(Filter, []) -> Filter.

-spec is_valid(glc_ops:op()) -> boolean().

is_valid({Field, '<', _Term}) when is_atom(Field) ->
    true;
is_valid({Field, '=<', _Term}) when is_atom(Field) ->
    true;
is_valid({Field, '=', _Term}) when is_atom(Field) ->
    true;
is_valid({Field, '!=', _Term}) when is_atom(Field) ->
    true;
is_valid({Field, '>=', _Term}) when is_atom(Field) ->
    true;
is_valid({Field, '>', _Term}) when is_atom(Field) ->
    true;
is_valid({Field, '*'}) when is_atom(Field) -> true;
is_valid({Field, '!'}) when is_atom(Field) -> true;
is_valid({null, true}) -> true;
is_valid({null, false}) -> true;
is_valid(_Other) -> false.

valid(Term) ->
    is_valid(Term) orelse erlang:error(badarg, [Term]),
    Term.


