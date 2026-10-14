-file("src/mod/data/video_data.erl", 1).

-module(video_data).

-lager_records([]).

-export([get_const/1]).

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

-file("src/mod/data/video_data.erl", 10).

get_const(likes_limit) -> 3;
get_const(likes_reward) -> [{1, 30000}];
get_const(self_video_limit) -> 30;
get_const(self_collection_limit) -> 30;
get_const(area_video_condition) -> 500;
get_const(public_round_condition) -> 6;
get_const(lev_interval_uplimit) -> 5;
get_const(lev_interval_lowlimit) -> 5;
get_const(hot_round_condition) -> 8;
get_const(video_base_weight) -> 100;
get_const(play_weight_condition) -> 100;
get_const(play_weight_increase) -> 80;
get_const(battlenum_weight_condition) -> 10;
get_const(battlenum_weight_increase) -> 80;
get_const(elite_lev_float_section) -> {10, 10};
get_const(elite_battlenum_conditon) -> 70;
get_const(elitelev_conditon) -> 1;
get_const(fresh_hero_id) -> 60503;
get_const(nh_video_base_weight) -> 100;
get_const(nh_play_weight_condition) -> 100;
get_const(nh_play_weight_increase) -> 80;
get_const(nh_battlenum_weight_condition) -> 100;
get_const(nh_battlenum_weight_increase) -> 0;
get_const(nh_hot_round_condition) -> 1;
get_const(hero_add_weight) -> 200;
get_const(hero_add_weight_condition) ->
    [10510, 10512, 30508];
get_const(open_time) -> 7;
get_const(_) -> undefined.


