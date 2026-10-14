-file("src/mod/data/holiday_charge_reset_data.erl", 1).

-module(holiday_charge_reset_data).

-lager_records([]).

-export([get_const/1, period_list/0]).

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

-file("src/mod/data/holiday_charge_reset_data.erl", 11).

get_const(gold_mall_id_list) -> [3, 4, 6, 7, 8, 20, 21];
get_const(privilege_id_list) -> [101];
get_const(_Info) ->
    logger:data_error("get_const_data_not_exist===>~w",
		      [_Info], holiday_charge_reset_data, 14),
    undefined.

period_list() ->
    [{1, {2021, 8, 25, 0, 0, 0}, {2021, 8, 31, 23, 59, 59},
      [{open_day_time, 8, {2021, 8, 25, 0, 0, 0}},
       {lev, 10}]}].


