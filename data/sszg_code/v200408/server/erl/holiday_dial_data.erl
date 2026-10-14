-file("data/holiday_dial_data.erl", 1).

-module(holiday_dial_data).

-export([get_rank/0, get_constant/1, get_award/1,
	 get_award_ids/0, get_award_need_num/1,
	 get_award_type/1]).

-file("../server/inc/common.hrl", 1).

-file("../server/inc/lib_log.hrl", 1).

-file("../server/inc/common.hrl", 112).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("data/holiday_dial_data.erl", 15).

-file("../server/inc/dial.hrl", 1).

-record(m_dial,
	{ver = 2  :: non_neg_integer(), info = [],
	 reset_time = 0}).

-record(m_holiday_dial,
	{ver = 1  :: non_neg_integer(), camp_id = 0,
	 award_list = [], num = 0, count = 0, list = [],
	 logs = [], lev = 0, old_data = []}).

-record(dial_info,
	{type = 0, count = 0, lucky = 0, lucky_award = [],
	 list = [], award_list = [], day_award_list = [],
	 frist_type = 0, end_time = 0, rand_lists = [],
	 pos_limit_count = [], item_limit_count = []}).

-record(rand_data,
	{rand_id = 0, id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 item_id = 0  :: non_neg_integer(),
	 item_num = 0  :: non_neg_integer(), rare = 0,
	 pro = 0  :: non_neg_integer(),
	 limit_lev = 0  :: non_neg_integer(),
	 not_hit_in_m = 0  :: non_neg_integer(),
	 notice = 0  :: non_neg_integer(),
	 limit_count = 0  :: non_neg_integer(),
	 max_count = 0  :: non_neg_integer()}).

-record(holiday_dial_rand_data,
	{zid = 0, id = 110, name = <<>>, award_type = 0,
	 item_id = 0, item_num = 0, gold_rate = 0, pro = 0,
	 limit_lev_min = 0, limit_lev_max = 9999,
	 not_hit_in_m = 0, not_hit_in_m_after = 0,
	 hit_when_m_after = 0, notice = 0, notice_rank = 0,
	 limit_count = 0}).

-file("data/holiday_dial_data.erl", 16).

get_rank() ->
    [#holiday_dial_rand_data{zid = 12, id = 12,
			     name = lang:get(<<"瓦尔基里碎片"/utf8>>), award_type = 0,
			     item_id = 39039, item_num = 5, pro = 70,
			     limit_lev_min = 0, limit_lev_max = 999,
			     not_hit_in_m = 55, not_hit_in_m_after = 75,
			     hit_when_m_after = 250, notice = 1,
			     notice_rank = 1, limit_count = 7},
     #holiday_dial_rand_data{zid = 11, id = 11,
			     name = lang:get(<<"5星随机碎片"/utf8>>), award_type = 0,
			     item_id = 39052, item_num = 150, pro = 160,
			     limit_lev_min = 0, limit_lev_max = 999,
			     not_hit_in_m_after = 90, notice = 1,
			     notice_rank = 1, limit_count = 10},
     #holiday_dial_rand_data{zid = 10, id = 10,
			     name = lang:get(<<"钻石奖池10%"/utf8>>),
			     award_type = 0, item_id = 10457, item_num = 1,
			     pro = 15, limit_lev_min = 0, limit_lev_max = 999,
			     not_hit_in_m_after = 5, notice = 1,
			     notice_rank = 1, limit_count = 10},
     #holiday_dial_rand_data{zid = 9, id = 9,
			     name = lang:get(<<"炼神石"/utf8>>), award_type = 0,
			     item_id = 39053, item_num = 50, pro = 3300,
			     limit_lev_min = 0, limit_lev_max = 999},
     #holiday_dial_rand_data{zid = 8, id = 8,
			     name = lang:get(<<"5星随机碎片"/utf8>>), award_type = 0,
			     item_id = 10090, item_num = 3, pro = 800,
			     limit_lev_min = 0, limit_lev_max = 999},
     #holiday_dial_rand_data{zid = 7, id = 7,
			     name = lang:get(<<"钻石奖池20%"/utf8>>),
			     award_type = 0, item_id = 35, item_num = 499,
			     pro = 60, limit_lev_min = 0, limit_lev_max = 999,
			     not_hit_in_m = 10, not_hit_in_m_after = 11,
			     notice = 1, notice_rank = 1, limit_count = 99},
     #holiday_dial_rand_data{zid = 6, id = 6,
			     name = lang:get(<<"符文精华"/utf8>>), award_type = 0,
			     item_id = 10450, item_num = 10000, pro = 3625,
			     limit_lev_min = 0, limit_lev_max = 999},
     #holiday_dial_rand_data{zid = 5, id = 5,
			     name = lang:get(<<"符文精华"/utf8>>), award_type = 0,
			     item_id = 37004, item_num = 1, pro = 800,
			     limit_lev_min = 0, limit_lev_max = 999},
     #holiday_dial_rand_data{zid = 4, id = 4,
			     name = lang:get(<<"钻石奖池50%"/utf8>>),
			     award_type = 0, item_id = 10091, item_num = 30,
			     pro = 35, limit_lev_min = 0, limit_lev_max = 999,
			     not_hit_in_m = 30, not_hit_in_m_after = 30,
			     hit_when_m_after = 300, notice = 1,
			     notice_rank = 1, limit_count = 9999},
     #holiday_dial_rand_data{zid = 3, id = 3,
			     name = lang:get(<<"符文精华"/utf8>>), award_type = 0,
			     item_id = 35, item_num = 2, pro = 500,
			     limit_lev_min = 0, limit_lev_max = 999,
			     not_hit_in_m = 10, not_hit_in_m_after = 15},
     #holiday_dial_rand_data{zid = 2, id = 2,
			     name = lang:get(<<"高级召唤卷"/utf8>>), award_type = 0,
			     item_id = 90515, item_num = 1, pro = 100,
			     limit_lev_min = 0, limit_lev_max = 999},
     #holiday_dial_rand_data{zid = 1, id = 1,
			     name = lang:get(<<"拉斐尔碎片"/utf8>>), award_type = 0,
			     item_id = 59040, item_num = 5, pro = 55,
			     limit_lev_min = 0, limit_lev_max = 999,
			     not_hit_in_m = 70, not_hit_in_m_after = 90,
			     hit_when_m_after = 300, notice = 1,
			     notice_rank = 1, limit_count = 7}].

get_constant(cost_once) -> 2000000;
get_constant(cost_ten) -> 20000000;
get_constant(lottery_ticket) -> 37003;
get_constant(holiday_rule) -> 1;
get_constant(continue_time) -> 10;
get_constant(min_reward) -> 1000;
get_constant(bouns_add) -> 10;
get_constant(item_price) -> 2000000;
get_constant(_) -> undefined.

get_award({17, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 17}, {39052, 5000}, {39053, 5000},
     {10090, 170}, {37004, 17}, {10450, 500000}];
get_award({16, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 16}, {39052, 4400}, {39053, 4400},
     {10090, 160}, {37004, 16}, {10450, 500000}];
get_award({15, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 15}, {39052, 4000}, {39053, 4000},
     {10090, 150}, {37004, 15}, {10450, 500000}];
get_award({14, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 14}, {39052, 3600}, {39053, 3600},
     {10090, 140}, {37004, 14}, {10450, 500000}];
get_award({13, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 13}, {39052, 3200}, {39053, 3200},
     {10090, 130}, {37004, 13}, {10450, 300000}];
get_award({12, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 12}, {39052, 2800}, {39053, 2800},
     {10090, 120}, {37004, 12}, {10450, 300000}];
get_award({11, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 11}, {39052, 2400}, {39053, 2400},
     {10090, 110}, {37004, 11}, {10450, 300000}];
get_award({10, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 10}, {39052, 2000}, {39053, 2000},
     {10090, 100}, {37004, 10}, {10450, 300000}];
get_award({9, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 9}, {39052, 1600}, {39053, 1600},
     {10090, 90}, {37004, 9}, {10450, 200000}];
get_award({8, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 8}, {39052, 1200}, {39053, 1200},
     {10090, 80}, {37004, 8}, {10450, 200000}];
get_award({7, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 7}, {39052, 800}, {39053, 800},
     {10090, 70}, {37004, 7}, {10450, 200000}];
get_award({6, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 6}, {39052, 500}, {39053, 500},
     {10090, 60}, {37004, 6}, {10450, 200000}];
get_award({5, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 5}, {39052, 200}, {39053, 200},
     {10090, 50}, {37004, 5}, {10450, 100000}];
get_award({4, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 4}, {39052, 100}, {39053, 100},
     {10090, 40}, {37004, 4}, {10450, 100000}];
get_award({3, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 3}, {39052, 100}, {39053, 100},
     {10090, 30}, {37004, 3}, {10450, 100000}];
get_award({2, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 2}, {39052, 100}, {39053, 100},
     {10090, 20}, {37004, 2}, {10450, 50000}];
get_award({1, Lev}) when Lev >= 0 andalso Lev =< 999 ->
    [{59040, 5}, {39039, 1}, {39052, 100}, {39053, 100},
     {10090, 10}, {37004, 1}, {10450, 50000}];
get_award(_) -> [].

get_award_ids() ->
    [{0, 999, 17}, {0, 999, 16}, {0, 999, 15}, {0, 999, 14},
     {0, 999, 13}, {0, 999, 12}, {0, 999, 11}, {0, 999, 10},
     {0, 999, 9}, {0, 999, 8}, {0, 999, 7}, {0, 999, 6},
     {0, 999, 5}, {0, 999, 4}, {0, 999, 3}, {0, 999, 2},
     {0, 999, 1}].

get_award_need_num(17) -> 5000;
get_award_need_num(16) -> 4400;
get_award_need_num(15) -> 4000;
get_award_need_num(14) -> 3600;
get_award_need_num(13) -> 3200;
get_award_need_num(12) -> 2800;
get_award_need_num(11) -> 2400;
get_award_need_num(10) -> 2000;
get_award_need_num(9) -> 1600;
get_award_need_num(8) -> 1200;
get_award_need_num(7) -> 800;
get_award_need_num(6) -> 500;
get_award_need_num(5) -> 200;
get_award_need_num(4) -> 100;
get_award_need_num(3) -> 50;
get_award_need_num(2) -> 30;
get_award_need_num(1) -> 10;
get_award_need_num(_Info) ->
    lager:error(io_lib:format("get_award_need_num_data_not_exist===>~w",
			      [_Info])),
    undefined.

get_award_type(1) -> [4, 7, 10];
get_award_type(0) -> [1, 2, 3, 5, 6, 8, 9, 11, 12];
get_award_type(_) -> [].


