-file("src/mod/data/cluster_dynamic_group_data.erl", 1).

-module(cluster_dynamic_group_data).

-lager_records([]).

-export([get_const/1, get/1]).

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

-file("src/mod/data/cluster_dynamic_group_data.erl",
      11).

get_const(reset_week_num) -> 2;
get_const(reset_time) -> {1, 0, 0, 5};
get_const(group_times) -> 2;
get_const(_) -> undefined.

get({1, WLev}) when WLev >= 100 andalso WLev =< 115 ->
    #{type => 1, min_lev => 100, max_lev => 115,
      group_lev => 1, num => 6, min_num => 3};
get({1, WLev}) when WLev >= 116 andalso WLev =< 125 ->
    #{type => 1, min_lev => 116, max_lev => 125,
      group_lev => 2, num => 6, min_num => 3};
get({1, WLev}) when WLev >= 126 andalso WLev =< 135 ->
    #{type => 1, min_lev => 126, max_lev => 135,
      group_lev => 3, num => 6, min_num => 3};
get({1, WLev}) when WLev >= 136 andalso WLev =< 145 ->
    #{type => 1, min_lev => 136, max_lev => 145,
      group_lev => 4, num => 6, min_num => 3};
get({1, WLev}) when WLev >= 146 andalso WLev =< 155 ->
    #{type => 1, min_lev => 146, max_lev => 155,
      group_lev => 5, num => 6, min_num => 3};
get({1, WLev}) when WLev >= 156 andalso WLev =< 160 ->
    #{type => 1, min_lev => 156, max_lev => 160,
      group_lev => 6, num => 7, min_num => 3};
get({1, WLev}) when WLev >= 161 andalso WLev =< 165 ->
    #{type => 1, min_lev => 161, max_lev => 165,
      group_lev => 7, num => 7, min_num => 3};
get({1, WLev}) when WLev >= 166 andalso WLev =< 170 ->
    #{type => 1, min_lev => 166, max_lev => 170,
      group_lev => 8, num => 8, min_num => 4};
get({1, WLev}) when WLev >= 171 andalso WLev =< 175 ->
    #{type => 1, min_lev => 171, max_lev => 175,
      group_lev => 9, num => 8, min_num => 4};
get({1, WLev}) when WLev >= 176 andalso WLev =< 180 ->
    #{type => 1, min_lev => 176, max_lev => 180,
      group_lev => 10, num => 9, min_num => 4};
get({1, WLev}) when WLev >= 181 andalso WLev =< 185 ->
    #{type => 1, min_lev => 181, max_lev => 185,
      group_lev => 11, num => 9, min_num => 4};
get({1, WLev}) when WLev >= 186 andalso WLev =< 190 ->
    #{type => 1, min_lev => 186, max_lev => 190,
      group_lev => 12, num => 10, min_num => 5};
get({1, WLev}) when WLev >= 191 andalso WLev =< 195 ->
    #{type => 1, min_lev => 191, max_lev => 195,
      group_lev => 13, num => 10, min_num => 5};
get({1, WLev}) when WLev >= 196 andalso WLev =< 999 ->
    #{type => 1, min_lev => 196, max_lev => 999,
      group_lev => 14, num => 10, min_num => 5};
get(_) -> undefined.


