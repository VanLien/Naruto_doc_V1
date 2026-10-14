-file("src/mod/data/holiday_skin_draw_data.erl", 1).

-module(holiday_skin_draw_data).

-lager_records([]).

-export([get_const/1, get_loss/1, get_all/0]).

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

-file("src/mod/data/holiday_skin_draw_data.erl", 12).

get_const(item) -> 37009;
get_const(rule) -> 0;
get_const(change_diamo) -> {3, 50};
get_const(change_gold) -> {1, 100000};
get_const(_) -> undefined.

get_loss(1) -> {1001, 37009, 0};
get_loss(2) -> {1001, 37009, 28};
get_loss(3) -> {1001, 37009, 68};
get_loss(4) -> {1001, 37009, 88};
get_loss(5) -> {1001, 37009, 148};
get_loss(6) -> {1001, 37009, 198};
get_loss(7) -> {1001, 37009, 288};
get_loss(8) -> {1001, 37009, 368};
get_loss(9) -> {1001, 37009, 428};
get_loss(10) -> {1001, 37009, 488};
get_loss(_) -> undefined.

get_all() ->
    [{1001, 23019, 1, 20, 4, 0, 1},
     {1001, 39096, 1, 80, 0, 6, 2},
     {1001, 60211, 1, 40, 5, 0, 3},
     {1001, 28903, 50, 110, 3, 0, 4},
     {1001, 10603, 2, 120, 1, 0, 5},
     {1001, 14001, 1, 100, 0, 0, 6},
     {1001, 10415, 5, 160, 0, 0, 7},
     {1001, 17210, 10, 120, 0, 0, 8},
     {1001, 28, 50, 100, 0, 0, 9},
     {1001, 10450, 2000, 150, 0, 0, 10}].


