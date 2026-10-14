-file("src/gre.erl", 1).

-module(gre).

-export([make/2, has/2, fetch/2, append/2, merge/2,
	 find/2, keys/1, pairs/1]).

-type event() :: {list, [{atom(), term()}]}.

-export_type([event/0]).

-spec make(term(), [list]) -> event().

make(Term, [Type]) -> {Type, Term}.

-spec has(atom(), event()) -> boolean().

has(Key, {list, List}) -> lists:keymember(Key, 1, List).

-spec append(term(), event()) -> event().

append(KeyVal, {list, List}) -> {list, [KeyVal | List]}.

-spec merge(event(), event()) -> event().

merge({list, AList}, {list, BList}) ->
    {list, lists:merge(AList, BList)}.

-spec fetch(atom(), event()) -> term().

fetch(Key, {list, List} = Event) ->
    case lists:keyfind(Key, 1, List) of
      {_, Value} -> Value;
      false -> erlang:error(badarg, [Key, Event])
    end.

-spec find(atom(), event()) -> {true, term()} | false.

find(Key, {list, List}) ->
    case lists:keyfind(Key, 1, List) of
      {_, Value} -> {true, Value};
      false -> false
    end.

-spec keys(event()) -> [atom()].

keys({list, List}) -> kv_keys_(List).

-spec kv_keys_([{atom(), term()}]) -> [atom()].

kv_keys_([{Key, _} | T]) -> [Key | kv_keys_(T)];
kv_keys_([]) -> [].

-spec pairs(event()) -> [{atom(), term()}].

pairs({list, List}) -> lists:sort(List).


