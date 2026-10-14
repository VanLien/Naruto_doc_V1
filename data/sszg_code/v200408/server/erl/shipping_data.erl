-file("src/mod/data/shipping_data.erl", 1).

-module(shipping_data).

-lager_records([]).

-export([get_const/1, rand_list/0, rand_list2/0,
	 rand_list3/0, get_must_no_count/1, get_pro_damping/1,
	 order_rand_list/1, get_order_condition/1,
	 get_order_limit_num/1, get_order_need_time/1,
	 get_order_expend/1, get_order_award/1,
	 get_order_quality/1, get_condition_info/1,
	 get_expend_by_time/1, get_ref_info/1]).

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

-file("src/mod/data/shipping_data.erl", 25).

get_const(guild_lev) -> 12;
get_const(refresh_cost) -> [{10002, 1}];
get_const(max_quest) -> 6;
get_const(refresh_bless) -> 0;
get_const(refresh_free_count) -> 2;
get_const(refresh_vip) -> [103];
get_const(refresh_highvip) -> [104];
get_const(first_refresh) -> [10905, 10701, 11001];
get_const(discount) -> 900;
get_const(_) -> undefined.

rand_list() ->
    [{109, 0, 1, 0}, {108, 0, 1, 0}, {107, 0, 1, 0},
     {106, 0, 1, 0}, {105, 60, 1, 6}, {104, 200, 1, 3},
     {103, 800, 1, 0}, {102, 2850, 6, 0}, {101, 3670, 6, 0},
     {100, 2420, 6, 0}].

rand_list2() ->
    [{109, 0, 1, 0}, {108, 0, 1, 0}, {107, 0, 1, 0},
     {106, 0, 1, 0}, {105, 0, 1, 6}, {104, 0, 1, 3},
     {103, 0, 1, 0}, {102, 0, 6, 0}, {101, 0, 6, 0},
     {100, 0, 6, 0}].

rand_list3() ->
    [{109, 1000, 1, 0}, {108, 1000, 1, 0},
     {107, 1000, 1, 0}, {106, 1000, 1, 0}, {105, 0, 1, 6},
     {104, 0, 1, 3}, {103, 0, 1, 0}, {102, 0, 6, 0},
     {101, 0, 6, 0}, {100, 0, 6, 0}].

get_must_no_count(100) -> 0;
get_must_no_count(101) -> 0;
get_must_no_count(102) -> 0;
get_must_no_count(103) -> 0;
get_must_no_count(104) -> 3;
get_must_no_count(105) -> 6;
get_must_no_count(106) -> 0;
get_must_no_count(107) -> 0;
get_must_no_count(108) -> 0;
get_must_no_count(109) -> 0;
get_must_no_count(_Info) ->
    logger:data_error("get_must_no_count_data_not_exist===>~w",
		      [_Info], shipping_data, 53),
    undefined.

get_pro_damping(100) -> [];
get_pro_damping(101) -> [];
get_pro_damping(102) -> [];
get_pro_damping(103) -> [];
get_pro_damping(104) ->
    [{1, 200}, {2, 180}, {3, 160}, {4, 140}, {5, 120},
     {6, 100}, {7, 80}, {8, 60}, {9, 40}, {10, 20}, {11, 0}];
get_pro_damping(105) ->
    [{1, 40}, {2, 35}, {3, 30}, {4, 20}, {5, 10}, {6, 0}];
get_pro_damping(106) -> [];
get_pro_damping(107) -> [];
get_pro_damping(108) -> [];
get_pro_damping(109) -> [];
get_pro_damping(_Info) ->
    logger:data_error("get_pro_damping_data_not_exist===>~w",
		      [_Info], shipping_data, 65),
    undefined.

order_rand_list(110) -> [{11001, 100}];
order_rand_list(109) ->
    [{10901, 100}, {10902, 100}, {10903, 100},
     {10904, 100}];
order_rand_list(108) ->
    [{10801, 100}, {10802, 100}, {10803, 100}, {10804, 100},
     {10805, 100}, {10806, 100}, {10807, 100}, {10808, 100},
     {10809, 100}];
order_rand_list(107) ->
    [{10701, 100}, {10702, 100}, {10703, 100},
     {10704, 100}];
order_rand_list(106) ->
    [{10601, 100}, {10602, 100}, {10603, 100},
     {10604, 100}];
order_rand_list(105) ->
    [{10501, 400}, {10502, 313}, {10507, 30}, {10508, 30},
     {10509, 30}, {10506, 15}, {10505, 15}, {10504, 25},
     {10510, 12}, {10503, 30}, {10511, 50}, {10512, 50}];
order_rand_list(104) ->
    [{10408, 400}, {10409, 290}, {10405, 30}, {10406, 30},
     {10407, 30}, {10404, 15}, {10403, 15}, {10402, 30},
     {10410, 20}, {10401, 30}, {10411, 60}, {10412, 50}];
order_rand_list(103) ->
    [{10310, 250}, {10308, 181}, {10307, 150}, {10304, 35},
     {10305, 35}, {10306, 35}, {10303, 18}, {10302, 18},
     {10301, 50}, {10314, 12}, {10315, 12}, {10316, 12},
     {10313, 6}, {10312, 6}, {10311, 10}, {10309, 40},
     {10317, 105}, {10318, 15}, {10319, 10}];
order_rand_list(102) ->
    [{10205, 225}, {10204, 225}, {10209, 100}, {10206, 50},
     {10207, 50}, {10208, 50}, {10203, 25}, {10202, 25},
     {10201, 50}, {10210, 200}];
order_rand_list(101) ->
    [{10101, 200}, {10103, 100}, {10104, 250}, {10102, 150},
     {10105, 300}];
order_rand_list(100) ->
    [{10003, 200}, {10004, 100}, {10002, 200}, {10001, 150},
     {10005, 350}];
order_rand_list(_) -> [].

get_order_condition(10001) -> [101, 200];
get_order_condition(10002) -> [101, 201];
get_order_condition(10003) -> [101, 202];
get_order_condition(10004) -> [101, 200];
get_order_condition(10005) -> [101, 200];
get_order_condition(10101) -> [102, 200];
get_order_condition(10102) -> [102, 201];
get_order_condition(10103) -> [102, 202];
get_order_condition(10104) -> [102, 200];
get_order_condition(10105) -> [102, 200];
get_order_condition(10201) -> [102, 200, 201];
get_order_condition(10202) -> [102, 200, 202];
get_order_condition(10203) -> [102, 201, 202];
get_order_condition(10204) -> [102, 200, 201];
get_order_condition(10205) -> [102, 200, 202];
get_order_condition(10206) -> [102, 201, 202];
get_order_condition(10207) -> [102, 200, 201];
get_order_condition(10208) -> [102, 200, 202];
get_order_condition(10209) -> [102, 201, 202];
get_order_condition(10210) -> [102, 201, 202];
get_order_condition(10301) -> [103, 200, 201];
get_order_condition(10302) -> [103, 200, 202];
get_order_condition(10303) -> [103, 201, 202];
get_order_condition(10304) -> [103, 201, 204];
get_order_condition(10305) -> [103, 200, 202];
get_order_condition(10306) -> [103, 202, 203];
get_order_condition(10307) -> [103, 200, 201];
get_order_condition(10308) -> [103, 200, 203];
get_order_condition(10309) -> [103, 201, 202];
get_order_condition(10310) -> [103, 200, 201];
get_order_condition(10311) -> [103, 200, 203];
get_order_condition(10312) -> [103, 201, 204];
get_order_condition(10313) -> [103, 201, 202];
get_order_condition(10314) -> [103, 200, 201];
get_order_condition(10315) -> [103, 201, 204];
get_order_condition(10316) -> [103, 202, 203];
get_order_condition(10317) -> [103, 202, 203];
get_order_condition(10318) -> [103, 202, 203];
get_order_condition(10319) -> [103, 202, 203];
get_order_condition(10401) -> [104, 200, 202, 204];
get_order_condition(10402) -> [104, 200, 203, 204];
get_order_condition(10403) -> [104, 201, 202, 203];
get_order_condition(10404) -> [104, 201, 202, 204];
get_order_condition(10405) -> [104, 201, 203, 204];
get_order_condition(10406) -> [104, 202, 203, 204];
get_order_condition(10407) -> [104, 200, 203, 204];
get_order_condition(10408) -> [104, 201, 202, 203];
get_order_condition(10409) -> [104, 201, 202, 204];
get_order_condition(10410) -> [104, 200, 202, 204];
get_order_condition(10411) -> [104, 200, 203, 204];
get_order_condition(10412) -> [104, 200, 203, 204];
get_order_condition(10501) -> [105, 200, 201, 202];
get_order_condition(10502) -> [105, 200, 201, 203];
get_order_condition(10503) -> [105, 200, 201, 204];
get_order_condition(10504) -> [105, 200, 202, 203];
get_order_condition(10505) -> [105, 200, 202, 204];
get_order_condition(10506) -> [105, 200, 203, 204];
get_order_condition(10507) -> [105, 201, 202, 203];
get_order_condition(10508) -> [105, 201, 202, 204];
get_order_condition(10509) -> [105, 201, 203, 204];
get_order_condition(10510) -> [105, 202, 203, 204];
get_order_condition(10511) -> [105, 202, 203, 204];
get_order_condition(10512) -> [105, 202, 203, 204];
get_order_condition(10601) -> [101, 200];
get_order_condition(10602) -> [101, 201];
get_order_condition(10603) -> [101, 202];
get_order_condition(10604) -> [101, 203];
get_order_condition(10701) -> [102, 201];
get_order_condition(10702) -> [102, 202];
get_order_condition(10703) -> [102, 203];
get_order_condition(10704) -> [102, 200];
get_order_condition(10801) -> [102, 200, 201];
get_order_condition(10802) -> [102, 200, 202];
get_order_condition(10803) -> [102, 201, 202];
get_order_condition(10804) -> [102, 200, 201];
get_order_condition(10805) -> [102, 200, 202];
get_order_condition(10806) -> [102, 201, 202];
get_order_condition(10807) -> [102, 200, 201];
get_order_condition(10808) -> [102, 200, 202];
get_order_condition(10809) -> [102, 201, 202];
get_order_condition(10901) -> [103, 200, 203];
get_order_condition(10902) -> [103, 201, 203];
get_order_condition(10903) -> [103, 201, 203];
get_order_condition(10904) -> [103, 202, 203];
get_order_condition(10905) -> [103, 202, 200];
get_order_condition(11001) -> [103, 200, 201];
get_order_condition(_Info) ->
    logger:data_error("get_order_condition_data_not_exist===>~w",
		      [_Info], shipping_data, 166),
    undefined.

get_order_limit_num(10001) -> 2;
get_order_limit_num(10002) -> 2;
get_order_limit_num(10003) -> 2;
get_order_limit_num(10004) -> 2;
get_order_limit_num(10005) -> 2;
get_order_limit_num(10101) -> 2;
get_order_limit_num(10102) -> 2;
get_order_limit_num(10103) -> 2;
get_order_limit_num(10104) -> 2;
get_order_limit_num(10105) -> 2;
get_order_limit_num(10201) -> 3;
get_order_limit_num(10202) -> 3;
get_order_limit_num(10203) -> 3;
get_order_limit_num(10204) -> 3;
get_order_limit_num(10205) -> 3;
get_order_limit_num(10206) -> 3;
get_order_limit_num(10207) -> 3;
get_order_limit_num(10208) -> 3;
get_order_limit_num(10209) -> 3;
get_order_limit_num(10210) -> 3;
get_order_limit_num(10301) -> 3;
get_order_limit_num(10302) -> 3;
get_order_limit_num(10303) -> 3;
get_order_limit_num(10304) -> 3;
get_order_limit_num(10305) -> 3;
get_order_limit_num(10306) -> 3;
get_order_limit_num(10307) -> 3;
get_order_limit_num(10308) -> 3;
get_order_limit_num(10309) -> 3;
get_order_limit_num(10310) -> 3;
get_order_limit_num(10311) -> 3;
get_order_limit_num(10312) -> 3;
get_order_limit_num(10313) -> 3;
get_order_limit_num(10314) -> 3;
get_order_limit_num(10315) -> 3;
get_order_limit_num(10316) -> 3;
get_order_limit_num(10317) -> 3;
get_order_limit_num(10318) -> 3;
get_order_limit_num(10319) -> 3;
get_order_limit_num(10401) -> 4;
get_order_limit_num(10402) -> 4;
get_order_limit_num(10403) -> 4;
get_order_limit_num(10404) -> 4;
get_order_limit_num(10405) -> 4;
get_order_limit_num(10406) -> 4;
get_order_limit_num(10407) -> 4;
get_order_limit_num(10408) -> 4;
get_order_limit_num(10409) -> 4;
get_order_limit_num(10410) -> 4;
get_order_limit_num(10411) -> 4;
get_order_limit_num(10412) -> 4;
get_order_limit_num(10501) -> 4;
get_order_limit_num(10502) -> 4;
get_order_limit_num(10503) -> 4;
get_order_limit_num(10504) -> 4;
get_order_limit_num(10505) -> 4;
get_order_limit_num(10506) -> 4;
get_order_limit_num(10507) -> 4;
get_order_limit_num(10508) -> 4;
get_order_limit_num(10509) -> 4;
get_order_limit_num(10510) -> 4;
get_order_limit_num(10511) -> 4;
get_order_limit_num(10512) -> 4;
get_order_limit_num(10601) -> 2;
get_order_limit_num(10602) -> 2;
get_order_limit_num(10603) -> 2;
get_order_limit_num(10604) -> 2;
get_order_limit_num(10701) -> 2;
get_order_limit_num(10702) -> 2;
get_order_limit_num(10703) -> 2;
get_order_limit_num(10704) -> 2;
get_order_limit_num(10801) -> 3;
get_order_limit_num(10802) -> 3;
get_order_limit_num(10803) -> 3;
get_order_limit_num(10804) -> 3;
get_order_limit_num(10805) -> 3;
get_order_limit_num(10806) -> 3;
get_order_limit_num(10807) -> 3;
get_order_limit_num(10808) -> 3;
get_order_limit_num(10809) -> 3;
get_order_limit_num(10901) -> 3;
get_order_limit_num(10902) -> 3;
get_order_limit_num(10903) -> 3;
get_order_limit_num(10904) -> 3;
get_order_limit_num(10905) -> 3;
get_order_limit_num(11001) -> 3;
get_order_limit_num(_Info) ->
    logger:data_error("get_order_limit_num_data_not_exist===>~w",
		      [_Info], shipping_data, 254),
    undefined.

get_order_need_time(10001) -> 7200;
get_order_need_time(10002) -> 7200;
get_order_need_time(10003) -> 7200;
get_order_need_time(10004) -> 7200;
get_order_need_time(10005) -> 7200;
get_order_need_time(10101) -> 14400;
get_order_need_time(10102) -> 14400;
get_order_need_time(10103) -> 14400;
get_order_need_time(10104) -> 14400;
get_order_need_time(10105) -> 14400;
get_order_need_time(10201) -> 21600;
get_order_need_time(10202) -> 21600;
get_order_need_time(10203) -> 21600;
get_order_need_time(10204) -> 21600;
get_order_need_time(10205) -> 21600;
get_order_need_time(10206) -> 21600;
get_order_need_time(10207) -> 21600;
get_order_need_time(10208) -> 21600;
get_order_need_time(10209) -> 21600;
get_order_need_time(10210) -> 21600;
get_order_need_time(10301) -> 28800;
get_order_need_time(10302) -> 28800;
get_order_need_time(10303) -> 28800;
get_order_need_time(10304) -> 28800;
get_order_need_time(10305) -> 28800;
get_order_need_time(10306) -> 28800;
get_order_need_time(10307) -> 28800;
get_order_need_time(10308) -> 28800;
get_order_need_time(10309) -> 28800;
get_order_need_time(10310) -> 28800;
get_order_need_time(10311) -> 28800;
get_order_need_time(10312) -> 28800;
get_order_need_time(10313) -> 28800;
get_order_need_time(10314) -> 28800;
get_order_need_time(10315) -> 28800;
get_order_need_time(10316) -> 28800;
get_order_need_time(10317) -> 28800;
get_order_need_time(10318) -> 28800;
get_order_need_time(10319) -> 28800;
get_order_need_time(10401) -> 43200;
get_order_need_time(10402) -> 43200;
get_order_need_time(10403) -> 43200;
get_order_need_time(10404) -> 43200;
get_order_need_time(10405) -> 43200;
get_order_need_time(10406) -> 43200;
get_order_need_time(10407) -> 43200;
get_order_need_time(10408) -> 43200;
get_order_need_time(10409) -> 43200;
get_order_need_time(10410) -> 43200;
get_order_need_time(10411) -> 43200;
get_order_need_time(10412) -> 43200;
get_order_need_time(10501) -> 57600;
get_order_need_time(10502) -> 57600;
get_order_need_time(10503) -> 57600;
get_order_need_time(10504) -> 57600;
get_order_need_time(10505) -> 57600;
get_order_need_time(10506) -> 57600;
get_order_need_time(10507) -> 57600;
get_order_need_time(10508) -> 57600;
get_order_need_time(10509) -> 57600;
get_order_need_time(10510) -> 57600;
get_order_need_time(10511) -> 57600;
get_order_need_time(10512) -> 57600;
get_order_need_time(10601) -> 7200;
get_order_need_time(10602) -> 7200;
get_order_need_time(10603) -> 7200;
get_order_need_time(10604) -> 7200;
get_order_need_time(10701) -> 14400;
get_order_need_time(10702) -> 14400;
get_order_need_time(10703) -> 14400;
get_order_need_time(10704) -> 14400;
get_order_need_time(10801) -> 21600;
get_order_need_time(10802) -> 21600;
get_order_need_time(10803) -> 21600;
get_order_need_time(10804) -> 21600;
get_order_need_time(10805) -> 21600;
get_order_need_time(10806) -> 21600;
get_order_need_time(10807) -> 21600;
get_order_need_time(10808) -> 21600;
get_order_need_time(10809) -> 21600;
get_order_need_time(10901) -> 28800;
get_order_need_time(10902) -> 28800;
get_order_need_time(10903) -> 28800;
get_order_need_time(10904) -> 28800;
get_order_need_time(10905) -> 28800;
get_order_need_time(11001) -> 28800;
get_order_need_time(_Info) ->
    logger:data_error("get_order_need_time_data_not_exist===>~w",
		      [_Info], shipping_data, 342),
    undefined.

get_order_expend(10001) -> [{7, 2000}];
get_order_expend(10002) -> [{7, 2000}];
get_order_expend(10003) -> [{7, 2000}];
get_order_expend(10004) -> [{7, 2000}];
get_order_expend(10005) -> [{7, 2000}];
get_order_expend(10101) -> [{7, 2000}];
get_order_expend(10102) -> [{7, 2000}];
get_order_expend(10103) -> [{7, 2000}];
get_order_expend(10104) -> [{7, 2000}];
get_order_expend(10105) -> [{7, 2000}];
get_order_expend(10201) -> [{7, 2000}];
get_order_expend(10202) -> [{7, 2000}];
get_order_expend(10203) -> [{7, 2000}];
get_order_expend(10204) -> [{7, 2000}];
get_order_expend(10205) -> [{7, 2000}];
get_order_expend(10206) -> [{7, 2000}];
get_order_expend(10207) -> [{7, 2000}];
get_order_expend(10208) -> [{7, 2000}];
get_order_expend(10209) -> [{7, 2000}];
get_order_expend(10210) -> [{7, 2000}];
get_order_expend(10301) -> [{7, 2000}];
get_order_expend(10302) -> [{7, 2000}];
get_order_expend(10303) -> [{7, 2000}];
get_order_expend(10304) -> [{7, 2000}];
get_order_expend(10305) -> [{7, 2000}];
get_order_expend(10306) -> [{7, 2000}];
get_order_expend(10307) -> [{7, 2000}];
get_order_expend(10308) -> [{7, 2000}];
get_order_expend(10309) -> [{7, 2000}];
get_order_expend(10310) -> [{7, 2000}];
get_order_expend(10311) -> [{7, 2000}];
get_order_expend(10312) -> [{7, 2000}];
get_order_expend(10313) -> [{7, 2000}];
get_order_expend(10314) -> [{7, 2000}];
get_order_expend(10315) -> [{7, 2000}];
get_order_expend(10316) -> [{7, 2000}];
get_order_expend(10317) -> [{7, 2000}];
get_order_expend(10318) -> [{7, 2000}];
get_order_expend(10319) -> [{7, 2000}];
get_order_expend(10401) -> [{7, 2000}];
get_order_expend(10402) -> [{7, 2000}];
get_order_expend(10403) -> [{7, 2000}];
get_order_expend(10404) -> [{7, 2000}];
get_order_expend(10405) -> [{7, 2000}];
get_order_expend(10406) -> [{7, 2000}];
get_order_expend(10407) -> [{7, 2000}];
get_order_expend(10408) -> [{7, 2000}];
get_order_expend(10409) -> [{7, 2000}];
get_order_expend(10410) -> [{7, 2000}];
get_order_expend(10411) -> [{7, 2000}];
get_order_expend(10412) -> [{7, 2000}];
get_order_expend(10501) -> [{7, 2000}];
get_order_expend(10502) -> [{7, 2000}];
get_order_expend(10503) -> [{7, 2000}];
get_order_expend(10504) -> [{7, 2000}];
get_order_expend(10505) -> [{7, 2000}];
get_order_expend(10506) -> [{7, 2000}];
get_order_expend(10507) -> [{7, 2000}];
get_order_expend(10508) -> [{7, 2000}];
get_order_expend(10509) -> [{7, 2000}];
get_order_expend(10510) -> [{7, 2000}];
get_order_expend(10511) -> [{7, 2000}];
get_order_expend(10512) -> [{7, 2000}];
get_order_expend(10601) -> [{7, 2000}];
get_order_expend(10602) -> [{7, 2000}];
get_order_expend(10603) -> [{7, 2000}];
get_order_expend(10604) -> [{7, 2000}];
get_order_expend(10701) -> [{7, 2000}];
get_order_expend(10702) -> [{7, 2000}];
get_order_expend(10703) -> [{7, 2000}];
get_order_expend(10704) -> [{7, 2000}];
get_order_expend(10801) -> [{7, 2000}];
get_order_expend(10802) -> [{7, 2000}];
get_order_expend(10803) -> [{7, 2000}];
get_order_expend(10804) -> [{7, 2000}];
get_order_expend(10805) -> [{7, 2000}];
get_order_expend(10806) -> [{7, 2000}];
get_order_expend(10807) -> [{7, 2000}];
get_order_expend(10808) -> [{7, 2000}];
get_order_expend(10809) -> [{7, 2000}];
get_order_expend(10901) -> [{7, 2000}];
get_order_expend(10902) -> [{7, 2000}];
get_order_expend(10903) -> [{7, 2000}];
get_order_expend(10904) -> [{7, 2000}];
get_order_expend(10905) -> [{7, 2000}];
get_order_expend(11001) -> [{7, 2000}];
get_order_expend(_Info) ->
    logger:data_error("get_order_expend_data_not_exist===>~w",
		      [_Info], shipping_data, 430),
    undefined.

get_order_award(10001) -> [{29903, 20}];
get_order_award(10002) -> [{10401, 2}];
get_order_award(10003) -> [{3, 15}];
get_order_award(10004) -> [{10103, 1}];
get_order_award(10005) -> [{37001, 1}];
get_order_award(10101) -> [{3, 30}];
get_order_award(10102) -> [{29903, 40}];
get_order_award(10103) -> [{10103, 2}];
get_order_award(10104) -> [{10401, 4}];
get_order_award(10105) -> [{37001, 2}];
get_order_award(10201) -> [{29904, 10}];
get_order_award(10202) -> [{29504, 10}];
get_order_award(10203) -> [{29404, 10}];
get_order_award(10204) -> [{10103, 4}];
get_order_award(10205) -> [{3, 60}];
get_order_award(10206) -> [{29104, 10}];
get_order_award(10207) -> [{29204, 10}];
get_order_award(10208) -> [{29304, 10}];
get_order_award(10209) -> [{10401, 6}];
get_order_award(10210) -> [{37001, 3}];
get_order_award(10301) -> [{29904, 30}];
get_order_award(10302) -> [{29504, 30}];
get_order_award(10303) -> [{29404, 30}];
get_order_award(10304) -> [{29104, 30}];
get_order_award(10305) -> [{29204, 30}];
get_order_award(10306) -> [{29304, 30}];
get_order_award(10307) -> [{10103, 10}];
get_order_award(10308) -> [{10403, 1}];
get_order_award(10309) -> [{10452, 1}];
get_order_award(10310) -> [{3, 120}];
get_order_award(10311) -> [{29905, 10}];
get_order_award(10312) -> [{29505, 10}];
get_order_award(10313) -> [{29405, 10}];
get_order_award(10314) -> [{29105, 10}];
get_order_award(10315) -> [{29205, 10}];
get_order_award(10316) -> [{29305, 10}];
get_order_award(10317) -> [{37001, 5}];
get_order_award(10318) -> [{37001, 8}];
get_order_award(10319) -> [{37001, 10}];
get_order_award(10401) -> [{14001, 1}];
get_order_award(10402) -> [{29905, 20}];
get_order_award(10403) -> [{29505, 20}];
get_order_award(10404) -> [{29405, 20}];
get_order_award(10405) -> [{29105, 20}];
get_order_award(10406) -> [{29205, 20}];
get_order_award(10407) -> [{29305, 20}];
get_order_award(10408) -> [{3, 300}];
get_order_award(10409) -> [{10403, 2}];
get_order_award(10410) -> [{10453, 1}];
get_order_award(10411) -> [{14002, 100}];
get_order_award(10412) -> [{37002, 1}];
get_order_award(10501) -> [{3, 600}];
get_order_award(10502) -> [{10403, 5}];
get_order_award(10503) -> [{14001, 2}];
get_order_award(10504) -> [{29905, 40}];
get_order_award(10505) -> [{29505, 40}];
get_order_award(10506) -> [{29405, 40}];
get_order_award(10507) -> [{29105, 40}];
get_order_award(10508) -> [{29205, 40}];
get_order_award(10509) -> [{29305, 40}];
get_order_award(10510) -> [{10453, 2}];
get_order_award(10511) -> [{14002, 200}];
get_order_award(10512) -> [{37002, 2}];
get_order_award(10601) -> [{29903, 20}];
get_order_award(10602) -> [{10401, 2}];
get_order_award(10603) -> [{3, 10}];
get_order_award(10604) -> [{10103, 1}];
get_order_award(10701) -> [{3, 20}];
get_order_award(10702) -> [{29903, 40}];
get_order_award(10703) -> [{10103, 2}];
get_order_award(10704) -> [{10401, 4}];
get_order_award(10801) -> [{29904, 10}];
get_order_award(10802) -> [{29504, 10}];
get_order_award(10803) -> [{29404, 10}];
get_order_award(10804) -> [{10103, 4}];
get_order_award(10805) -> [{3, 40}];
get_order_award(10806) -> [{29104, 10}];
get_order_award(10807) -> [{29204, 10}];
get_order_award(10808) -> [{29304, 10}];
get_order_award(10809) -> [{10401, 6}];
get_order_award(10901) -> [{10403, 1}];
get_order_award(10902) -> [{10403, 1}];
get_order_award(10903) -> [{10403, 1}];
get_order_award(10904) -> [{10403, 1}];
get_order_award(10905) -> [{10403, 1}];
get_order_award(11001) -> [{3, 120}];
get_order_award(_Info) ->
    logger:data_error("get_order_award_data_not_exist===>~w",
		      [_Info], shipping_data, 518),
    undefined.

get_order_quality(10001) -> 0;
get_order_quality(10002) -> 0;
get_order_quality(10003) -> 0;
get_order_quality(10004) -> 0;
get_order_quality(10005) -> 0;
get_order_quality(10101) -> 1;
get_order_quality(10102) -> 1;
get_order_quality(10103) -> 1;
get_order_quality(10104) -> 1;
get_order_quality(10105) -> 1;
get_order_quality(10201) -> 2;
get_order_quality(10202) -> 2;
get_order_quality(10203) -> 2;
get_order_quality(10204) -> 2;
get_order_quality(10205) -> 2;
get_order_quality(10206) -> 2;
get_order_quality(10207) -> 2;
get_order_quality(10208) -> 2;
get_order_quality(10209) -> 2;
get_order_quality(10210) -> 2;
get_order_quality(10301) -> 3;
get_order_quality(10302) -> 3;
get_order_quality(10303) -> 3;
get_order_quality(10304) -> 3;
get_order_quality(10305) -> 3;
get_order_quality(10306) -> 3;
get_order_quality(10307) -> 3;
get_order_quality(10308) -> 3;
get_order_quality(10309) -> 3;
get_order_quality(10310) -> 3;
get_order_quality(10311) -> 3;
get_order_quality(10312) -> 3;
get_order_quality(10313) -> 3;
get_order_quality(10314) -> 3;
get_order_quality(10315) -> 3;
get_order_quality(10316) -> 3;
get_order_quality(10317) -> 3;
get_order_quality(10318) -> 3;
get_order_quality(10319) -> 3;
get_order_quality(10401) -> 4;
get_order_quality(10402) -> 4;
get_order_quality(10403) -> 4;
get_order_quality(10404) -> 4;
get_order_quality(10405) -> 4;
get_order_quality(10406) -> 4;
get_order_quality(10407) -> 4;
get_order_quality(10408) -> 4;
get_order_quality(10409) -> 4;
get_order_quality(10410) -> 4;
get_order_quality(10411) -> 4;
get_order_quality(10412) -> 4;
get_order_quality(10501) -> 5;
get_order_quality(10502) -> 5;
get_order_quality(10503) -> 5;
get_order_quality(10504) -> 5;
get_order_quality(10505) -> 5;
get_order_quality(10506) -> 5;
get_order_quality(10507) -> 5;
get_order_quality(10508) -> 5;
get_order_quality(10509) -> 5;
get_order_quality(10510) -> 5;
get_order_quality(10511) -> 5;
get_order_quality(10512) -> 5;
get_order_quality(10601) -> 0;
get_order_quality(10602) -> 0;
get_order_quality(10603) -> 0;
get_order_quality(10604) -> 0;
get_order_quality(10701) -> 1;
get_order_quality(10702) -> 1;
get_order_quality(10703) -> 1;
get_order_quality(10704) -> 1;
get_order_quality(10801) -> 2;
get_order_quality(10802) -> 2;
get_order_quality(10803) -> 2;
get_order_quality(10804) -> 2;
get_order_quality(10805) -> 2;
get_order_quality(10806) -> 2;
get_order_quality(10807) -> 2;
get_order_quality(10808) -> 2;
get_order_quality(10809) -> 2;
get_order_quality(10901) -> 3;
get_order_quality(10902) -> 3;
get_order_quality(10903) -> 3;
get_order_quality(10904) -> 3;
get_order_quality(10905) -> 3;
get_order_quality(11001) -> 3;
get_order_quality(_Info) ->
    logger:data_error("get_order_quality_data_not_exist===>~w",
		      [_Info], shipping_data, 606),
    undefined.

get_condition_info(100) -> [{partner_star, 1, 1}];
get_condition_info(101) -> [{partner_star, 2, 1}];
get_condition_info(102) -> [{partner_star, 3, 1}];
get_condition_info(103) -> [{partner_star, 4, 1}];
get_condition_info(104) -> [{partner_star, 5, 1}];
get_condition_info(105) -> [{partner_star, 6, 1}];
get_condition_info(106) -> [{partner_star, 7, 1}];
get_condition_info(107) -> [{partner_star, 8, 1}];
get_condition_info(108) -> [{partner_star, 9, 1}];
get_condition_info(109) -> [{partner_star, 10, 1}];
get_condition_info(200) -> [{partner_camp_type, 1, 1}];
get_condition_info(201) -> [{partner_camp_type, 2, 1}];
get_condition_info(202) -> [{partner_camp_type, 3, 1}];
get_condition_info(203) -> [{partner_camp_type, 4, 1}];
get_condition_info(204) -> [{partner_camp_type, 5, 1}];
get_condition_info(_Info) ->
    logger:data_error("get_condition_info_data_not_exist===>~w",
		      [_Info], shipping_data, 623),
    undefined.

get_expend_by_time(Time) when Time >= 28801 -> 60;
get_expend_by_time(Time) when Time >= 21601 -> 50;
get_expend_by_time(Time) when Time >= 14401 -> 40;
get_expend_by_time(Time) when Time >= 7201 -> 30;
get_expend_by_time(Time) when Time >= 3601 -> 20;
get_expend_by_time(Time) when Time >= 0 -> 0;
get_expend_by_time(_Info) ->
    logger:data_error("get_expend_by_time_data_not_exist===>~w",
		      [_Info], shipping_data, 631),
    undefined.

get_ref_info(VipLev) when VipLev >= 30 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 29 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 28 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 27 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 26 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 25 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 24 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 23 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 22 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 21 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 20 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 19 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 18 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 17 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 16 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 15 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 14 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 13 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 12 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 11 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 10 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 9 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 8 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 7 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 6 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 5 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 4 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 3 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 2 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 1 ->
    {9999, [{3, 30}], 2};
get_ref_info(VipLev) when VipLev >= 0 ->
    {9999, [{3, 30}], 2};
get_ref_info(_Info) ->
    logger:data_error("get_ref_info_data_not_exist===>~w",
		      [_Info], shipping_data, 664),
    undefined.


