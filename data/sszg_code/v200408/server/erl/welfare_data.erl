-file("src/mod/data/welfare_data.erl", 1).

-module(welfare_data).

-lager_records([]).

-export([get_constant/1, list/0, get_award/1,
	 get_cond/1]).

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

-file("src/mod/data/welfare_data.erl", 13).

get_constant(award) -> [{26907, 50}];
get_constant(min_reg_day) -> 1;
get_constant(max_reg_day) -> 3;
get_constant(dun_max_id) -> 75;
get_constant(invade_id) -> 99940;
get_constant(defend_id) -> 99941;
get_constant(limit_open_srv_date) ->
    {{2021, 8, 2}, {9, 59, 0}};
get_constant(_) -> undefined.

list() -> [1, 2, 3].

get_award(3) -> [{26903, 50}];
get_award(_Info) ->
    logger:data_error("get_award_data_not_exist===>~w",
		      [_Info], welfare_data, 26),
    undefined.

get_cond(1) -> {login_days, 2};
get_cond(2) -> {dungeon_id, 75, 12};
get_cond(3) -> {month_card, 1};
get_cond(_Info) ->
    logger:data_error("get_cond_data_not_exist===>~w",
		      [_Info], welfare_data, 31),
    undefined.


