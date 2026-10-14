-file("data/activity_data.erl", 1).

-file("src/mod/data/activity_data.erl", 1).

-module(activity_data).

-lager_records([]).

-export([get/1]).

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

-file("src/mod/data/activity_data.erl", 10).

get(25) ->
    [{37004, 1}, {3, 50000}, {39079, 2}, {10090, 5},
     {10001, 10000}];
get(50) ->
    [{37004, 1}, {3, 100000}, {39079, 2}, {10090, 5},
     {10001, 10000}];
get(75) ->
    [{37004, 1}, {3, 150000}, {39079, 2}, {10090, 5},
     {10001, 10000}, {10, 15000}];
get(90) ->
    [{37004, 2}, {3, 200000}, {39079, 2}, {10090, 5},
     {10001, 10000}, {37005, 1}];
get(_) -> [].


