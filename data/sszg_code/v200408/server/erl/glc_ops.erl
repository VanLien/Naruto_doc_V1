-file("src/glc_ops.erl", 1).

-module(glc_ops).

-export([lt/2, lte/2, eq/2, neq/2, gt/2, gte/2, wc/1,
	 nf/1]).

-export([all/1, any/1, null/1, with/2]).

-export([union/1]).

-type op() :: {atom(), '<', term()} |
	      {atom(), '=<', term()} | {atom(), '=', term()} |
	      {atom(), '!=', term()} | {atom(), '>', term()} |
	      {atom(), '>=', term()} | {atom(), '*'} | {atom(), '!'} |
	      {any, [op(), ...]} | {all, [op(), ...]} |
	      {null, true | false}.

-export_type([op/0]).

-spec lt(atom(), term()) -> op().

lt(Key, Term) when is_atom(Key) -> {Key, '<', Term};
lt(Key, Term) -> erlang:error(badarg, [Key, Term]).

-spec lte(atom(), term()) -> op().

lte(Key, Term) when is_atom(Key) -> {Key, '=<', Term};
lte(Key, Term) -> erlang:error(badarg, [Key, Term]).

-spec eq(atom(), term()) -> op().

eq(Key, Term) when is_atom(Key) -> {Key, '=', Term};
eq(Key, Term) -> erlang:error(badarg, [Key, Term]).

-spec neq(atom(), term()) -> op().

neq(Key, Term) when is_atom(Key) -> {Key, '!=', Term};
neq(Key, Term) -> erlang:error(badarg, [Key, Term]).

-spec gt(atom(), term()) -> op().

gt(Key, Term) when is_atom(Key) -> {Key, '>', Term};
gt(Key, Term) -> erlang:error(badarg, [Key, Term]).

-spec gte(atom(), term()) -> op().

gte(Key, Term) when is_atom(Key) -> {Key, '>=', Term};
gte(Key, Term) -> erlang:error(badarg, [Key, Term]).

-spec wc(atom()) -> op().

wc(Key) when is_atom(Key) -> {Key, '*'};
wc(Key) -> erlang:error(badarg, [Key]).

-spec nf(atom()) -> op().

nf(Key) when is_atom(Key) -> {Key, '!'};
nf(Key) -> erlang:error(badarg, [Key]).

-spec all([op()]) -> op().

all([_ | _] = Conds) -> {all, Conds};
all(Other) -> erlang:error(badarg, [Other]).

-spec any([op()]) -> op().

any([_ | _] = Conds) -> {any, Conds};
any(Other) -> erlang:error(badarg, [Other]).

-spec null(boolean()) -> op().

null(Result) when is_boolean(Result) -> {null, Result};
null(Result) -> erlang:error(badarg, [Result]).

-spec with(op(), (gre:event()) -> term()) -> op().

with(Query, Fun)
    when is_function(Fun, 1); is_function(Fun, 2) ->
    {with, Query, Fun};
with(Query, Fun) -> erlang:error(badarg, [Query, Fun]).

-spec union([op()]) -> op().

union(Queries) ->
    case [Query
	  || Query <- Queries, glc_lib:onoutput(Query) =:= output]
	of
      [] -> {union, Queries};
      [_ | _] -> erlang:error(badarg, [Queries])
    end.


