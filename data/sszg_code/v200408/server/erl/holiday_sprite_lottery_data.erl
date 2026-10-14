-file("src/mod/data/holiday_sprite_lottery_data.erl",
      1).

-module(holiday_sprite_lottery_data).

-lager_records([]).

-export([get_const/1, get_camp_group/1, get_group/1,
	 group_items/1, rand_class/1, server_must_class/1,
	 class_type/1, get_reward/1, is_best/1,
	 must_hit_in_m_times/1]).

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

-file("src/mod/data/holiday_sprite_lottery_data.erl",
      19).

get_const(common_s) -> 10415;
get_const(common_time) -> 1;
get_const(c_interval) -> 86400;
get_const(lucky_sprite_num) -> 1;
get_const(lucky_sprite_ids) ->
    [113001, 113002, 113003, 113004, 113005, 113006, 113007,
     113008];
get_const(lucky_sprite_add_pro) -> 2000;
get_const(sprite_lottery_daily_limit) -> 120;
get_const(reward_desc) -> 1;
get_const(sprite_lottery_rare_list) -> {4};
get_const(_) -> undefined.

get_camp_group(0) -> 110;
get_camp_group(48034) -> 101;
get_camp_group(49513) -> 102;
get_camp_group(49813) -> 103;
get_camp_group(_Info) ->
    logger:data_error("get_camp_group_data_not_exist===>~w",
		      [_Info], holiday_sprite_lottery_data, 35),
    undefined.

get_group(110) ->
    #{group_id => 110,
      name => lang:get(<<"Xổ số Vĩ Thú thường"/utf8>>),
      first_class_id => 1020, gain_once => [{22, 5000}],
      gain_ten => [{22, 50000}], loss_gold_once => [{3, 220}],
      loss_gold_ten => [{3, 2000}],
      loss_item_once => [{10415, 1}],
      loss_item_ten => [{10415, 10}]};
get_group(101) ->
    #{group_id => 101,
      name => lang:get(<<"Rồng Bí Ẩn"/utf8>>),
      first_class_id => 1005, gain_once => [{22, 5000}],
      gain_ten => [{22, 50000}], loss_gold_once => [{3, 220}],
      loss_gold_ten => [{3, 2000}],
      loss_item_once => [{10415, 1}],
      loss_item_ten => [{10415, 10}]};
get_group(102) ->
    #{group_id => 102,
      name => lang:get(<<"Cá Hoàn Mỹ"/utf8>>),
      first_class_id => 1010, gain_once => [{22, 5000}],
      gain_ten => [{22, 50000}], loss_gold_once => [{3, 220}],
      loss_gold_ten => [{3, 2000}],
      loss_item_once => [{10415, 1}],
      loss_item_ten => [{10415, 10}]};
get_group(103) ->
    #{group_id => 103,
      name => lang:get(<<"Hồn Bóng Tối"/utf8>>),
      first_class_id => 1015, gain_once => [{22, 5000}],
      gain_ten => [{22, 50000}], loss_gold_once => [{3, 220}],
      loss_gold_ten => [{3, 2000}],
      loss_item_once => [{10415, 1}],
      loss_item_ten => [{10415, 10}]};
get_group(_Info) ->
    logger:data_error("get_group_data_not_exist===>~w",
		      [_Info], holiday_sprite_lottery_data, 85),
    undefined.

group_items(103) ->
    [#{id => 100049, class_id => 1011, group_id => 103,
       bid => 10040, name => lang:get(<<"奥术之尘"/utf8>>),
       num => 5, weight => 300, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100050, class_id => 1011, group_id => 103,
       bid => 10040, name => lang:get(<<"奥术之尘"/utf8>>),
       num => 8, weight => 300, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100051, class_id => 1011, group_id => 103,
       bid => 10040, name => lang:get(<<"奥术之尘"/utf8>>),
       num => 10, weight => 150, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100052, class_id => 1011, group_id => 103,
       bid => 39052, name => lang:get(<<"百万金币礼盒"/utf8>>),
       num => 1, weight => 220, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100053, class_id => 1011, group_id => 103,
       bid => 10041, name => lang:get(<<"圣露"/utf8>>), num => 1,
       weight => 30, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100054, class_id => 1012, group_id => 103,
       bid => 111001, name => lang:get(<<"滚滚岩"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100055, class_id => 1012, group_id => 103,
       bid => 111002, name => lang:get(<<"皮皮"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100056, class_id => 1012, group_id => 103,
       bid => 111003, name => lang:get(<<"火球"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100057, class_id => 1012, group_id => 103,
       bid => 111004, name => lang:get(<<"小豆苗"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100058, class_id => 1012, group_id => 103,
       bid => 111005, name => lang:get(<<"嗡嗡蜂"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100059, class_id => 1013, group_id => 103,
       bid => 112001, name => lang:get(<<"暗夜精灵"/utf8>>),
       num => 1, weight => 250, series_must_weight => 250,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100060, class_id => 1013, group_id => 103,
       bid => 112002, name => lang:get(<<"炎灵"/utf8>>),
       num => 1, weight => 250, series_must_weight => 250,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100061, class_id => 1013, group_id => 103,
       bid => 112003, name => lang:get(<<"潮汐之灵"/utf8>>),
       num => 1, weight => 250, series_must_weight => 250,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100062, class_id => 1013, group_id => 103,
       bid => 112004, name => lang:get(<<"花仙子"/utf8>>),
       num => 1, weight => 250, series_must_weight => 250,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100063, class_id => 1014, group_id => 103,
       bid => 113001, name => lang:get(<<"幻界精灵"/utf8>>),
       num => 1, weight => 1000, series_must_weight => 0,
       must_not_in_m_times => 40,
       hit_must_not_after_m_times => 35, is_notice => 1,
       hit_must_every_m_times => 50},
     #{id => 100064, class_id => 1015, group_id => 103,
       bid => 111001, name => lang:get(<<"滚滚岩"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100065, class_id => 1015, group_id => 103,
       bid => 111002, name => lang:get(<<"皮皮"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100066, class_id => 1015, group_id => 103,
       bid => 111003, name => lang:get(<<"火球"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100067, class_id => 1015, group_id => 103,
       bid => 111004, name => lang:get(<<"小豆苗"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100068, class_id => 1015, group_id => 103,
       bid => 111005, name => lang:get(<<"嗡嗡蜂"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100069, class_id => 1015, group_id => 103,
       bid => 112001, name => lang:get(<<"暗夜精灵"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100070, class_id => 1015, group_id => 103,
       bid => 112002, name => lang:get(<<"炎灵"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100071, class_id => 1015, group_id => 103,
       bid => 112003, name => lang:get(<<"潮汐之灵"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100072, class_id => 1015, group_id => 103,
       bid => 112004, name => lang:get(<<"花仙子"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0}];
group_items(102) ->
    [#{id => 100025, class_id => 1006, group_id => 102,
       bid => 10040, name => lang:get(<<"奥术之尘"/utf8>>),
       num => 5, weight => 300, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100026, class_id => 1006, group_id => 102,
       bid => 10040, name => lang:get(<<"奥术之尘"/utf8>>),
       num => 8, weight => 300, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100027, class_id => 1006, group_id => 102,
       bid => 10040, name => lang:get(<<"奥术之尘"/utf8>>),
       num => 10, weight => 150, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100028, class_id => 1006, group_id => 102,
       bid => 39052, name => lang:get(<<"百万金币礼盒"/utf8>>),
       num => 1, weight => 220, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100029, class_id => 1006, group_id => 102,
       bid => 10041, name => lang:get(<<"圣露"/utf8>>), num => 1,
       weight => 30, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100030, class_id => 1007, group_id => 102,
       bid => 111001, name => lang:get(<<"滚滚岩"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100031, class_id => 1007, group_id => 102,
       bid => 111002, name => lang:get(<<"皮皮"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100032, class_id => 1007, group_id => 102,
       bid => 111003, name => lang:get(<<"火球"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100033, class_id => 1007, group_id => 102,
       bid => 111004, name => lang:get(<<"小豆苗"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100034, class_id => 1007, group_id => 102,
       bid => 111005, name => lang:get(<<"嗡嗡蜂"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100035, class_id => 1008, group_id => 102,
       bid => 112001, name => lang:get(<<"暗夜精灵"/utf8>>),
       num => 1, weight => 250, series_must_weight => 250,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100036, class_id => 1008, group_id => 102,
       bid => 112002, name => lang:get(<<"炎灵"/utf8>>),
       num => 1, weight => 250, series_must_weight => 250,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100037, class_id => 1008, group_id => 102,
       bid => 112003, name => lang:get(<<"潮汐之灵"/utf8>>),
       num => 1, weight => 250, series_must_weight => 250,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100038, class_id => 1008, group_id => 102,
       bid => 112004, name => lang:get(<<"花仙子"/utf8>>),
       num => 1, weight => 250, series_must_weight => 250,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100039, class_id => 1009, group_id => 102,
       bid => 113002, name => lang:get(<<"神使"/utf8>>),
       num => 1, weight => 1000, series_must_weight => 0,
       must_not_in_m_times => 40,
       hit_must_not_after_m_times => 35, is_notice => 1,
       hit_must_every_m_times => 50},
     #{id => 100040, class_id => 1010, group_id => 102,
       bid => 111001, name => lang:get(<<"滚滚岩"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100041, class_id => 1010, group_id => 102,
       bid => 111002, name => lang:get(<<"皮皮"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100042, class_id => 1010, group_id => 102,
       bid => 111003, name => lang:get(<<"火球"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100043, class_id => 1010, group_id => 102,
       bid => 111004, name => lang:get(<<"小豆苗"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100044, class_id => 1010, group_id => 102,
       bid => 111005, name => lang:get(<<"嗡嗡蜂"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100045, class_id => 1010, group_id => 102,
       bid => 112001, name => lang:get(<<"暗夜精灵"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100046, class_id => 1010, group_id => 102,
       bid => 112002, name => lang:get(<<"炎灵"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100047, class_id => 1010, group_id => 102,
       bid => 112003, name => lang:get(<<"潮汐之灵"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100048, class_id => 1010, group_id => 102,
       bid => 112004, name => lang:get(<<"花仙子"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0}];
group_items(101) ->
    [#{id => 100001, class_id => 1001, group_id => 101,
       bid => 10040, name => lang:get(<<"奥术之尘"/utf8>>),
       num => 5, weight => 300, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100002, class_id => 1001, group_id => 101,
       bid => 10040, name => lang:get(<<"奥术之尘"/utf8>>),
       num => 8, weight => 300, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100003, class_id => 1001, group_id => 101,
       bid => 10040, name => lang:get(<<"奥术之尘"/utf8>>),
       num => 10, weight => 150, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100004, class_id => 1001, group_id => 101,
       bid => 39052, name => lang:get(<<"百万金币礼盒"/utf8>>),
       num => 1, weight => 220, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100005, class_id => 1001, group_id => 101,
       bid => 10041, name => lang:get(<<"圣露"/utf8>>), num => 1,
       weight => 30, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100006, class_id => 1002, group_id => 101,
       bid => 111001, name => lang:get(<<"滚滚岩"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100007, class_id => 1002, group_id => 101,
       bid => 111002, name => lang:get(<<"皮皮"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100008, class_id => 1002, group_id => 101,
       bid => 111003, name => lang:get(<<"火球"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100009, class_id => 1002, group_id => 101,
       bid => 111004, name => lang:get(<<"小豆苗"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100010, class_id => 1002, group_id => 101,
       bid => 111005, name => lang:get(<<"嗡嗡蜂"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100011, class_id => 1003, group_id => 101,
       bid => 112001, name => lang:get(<<"暗夜精灵"/utf8>>),
       num => 1, weight => 250, series_must_weight => 250,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100012, class_id => 1003, group_id => 101,
       bid => 112002, name => lang:get(<<"炎灵"/utf8>>),
       num => 1, weight => 250, series_must_weight => 250,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100013, class_id => 1003, group_id => 101,
       bid => 112003, name => lang:get(<<"潮汐之灵"/utf8>>),
       num => 1, weight => 250, series_must_weight => 250,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100014, class_id => 1003, group_id => 101,
       bid => 112004, name => lang:get(<<"花仙子"/utf8>>),
       num => 1, weight => 250, series_must_weight => 250,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100015, class_id => 1004, group_id => 101,
       bid => 113006, name => lang:get(<<"贪婪恶魂"/utf8>>),
       num => 1, weight => 1000, series_must_weight => 0,
       must_not_in_m_times => 40,
       hit_must_not_after_m_times => 35, is_notice => 1,
       hit_must_every_m_times => 50},
     #{id => 100016, class_id => 1005, group_id => 101,
       bid => 111001, name => lang:get(<<"滚滚岩"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100017, class_id => 1005, group_id => 101,
       bid => 111002, name => lang:get(<<"皮皮"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100018, class_id => 1005, group_id => 101,
       bid => 111003, name => lang:get(<<"火球"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100019, class_id => 1005, group_id => 101,
       bid => 111004, name => lang:get(<<"小豆苗"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100020, class_id => 1005, group_id => 101,
       bid => 111005, name => lang:get(<<"嗡嗡蜂"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100021, class_id => 1005, group_id => 101,
       bid => 112001, name => lang:get(<<"暗夜精灵"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100022, class_id => 1005, group_id => 101,
       bid => 112002, name => lang:get(<<"炎灵"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100023, class_id => 1005, group_id => 101,
       bid => 112003, name => lang:get(<<"潮汐之灵"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 100024, class_id => 1005, group_id => 101,
       bid => 112004, name => lang:get(<<"花仙子"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0}];
group_items(110) ->
    [#{id => 101101, class_id => 1016, group_id => 110,
       bid => 10040, name => lang:get(<<"奥术之尘"/utf8>>),
       num => 3, weight => 4650, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101106, class_id => 1017, group_id => 110,
       bid => 111001, name => lang:get(<<"滚滚岩"/utf8>>),
       num => 1, weight => 1000, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101107, class_id => 1017, group_id => 110,
       bid => 111002, name => lang:get(<<"皮皮"/utf8>>),
       num => 1, weight => 1000, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101108, class_id => 1017, group_id => 110,
       bid => 111003, name => lang:get(<<"火球"/utf8>>),
       num => 1, weight => 1000, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101109, class_id => 1017, group_id => 110,
       bid => 111004, name => lang:get(<<"小豆苗"/utf8>>),
       num => 1, weight => 1000, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101110, class_id => 1017, group_id => 110,
       bid => 111005, name => lang:get(<<"嗡嗡蜂"/utf8>>),
       num => 1, weight => 1000, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101111, class_id => 1018, group_id => 110,
       bid => 112001, name => lang:get(<<"暗夜精灵"/utf8>>),
       num => 1, weight => 250, series_must_weight => 2300,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101112, class_id => 1018, group_id => 110,
       bid => 112002, name => lang:get(<<"炎灵"/utf8>>),
       num => 1, weight => 250, series_must_weight => 2300,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101113, class_id => 1018, group_id => 110,
       bid => 112003, name => lang:get(<<"潮汐之灵"/utf8>>),
       num => 1, weight => 250, series_must_weight => 2300,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101114, class_id => 1018, group_id => 110,
       bid => 112004, name => lang:get(<<"花仙子"/utf8>>),
       num => 1, weight => 250, series_must_weight => 2300,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101115, class_id => 1019, group_id => 110,
       bid => 113001, name => lang:get(<<"幻界精灵"/utf8>>),
       num => 1, weight => 182, series_must_weight => 145,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 1,
       hit_must_every_m_times => 0},
     #{id => 101116, class_id => 1019, group_id => 110,
       bid => 113002, name => lang:get(<<"神使"/utf8>>),
       num => 1, weight => 182, series_must_weight => 145,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 1,
       hit_must_every_m_times => 0},
     #{id => 101117, class_id => 1019, group_id => 110,
       bid => 113003, name => lang:get(<<"烈焰之蹄"/utf8>>),
       num => 1, weight => 182, series_must_weight => 145,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 1,
       hit_must_every_m_times => 0},
     #{id => 101118, class_id => 1019, group_id => 110,
       bid => 113004, name => lang:get(<<"圣林行者"/utf8>>),
       num => 1, weight => 101, series_must_weight => 81,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 1,
       hit_must_every_m_times => 0},
     #{id => 101119, class_id => 1019, group_id => 110,
       bid => 113005, name => lang:get(<<"疾风之怒"/utf8>>),
       num => 1, weight => 101, series_must_weight => 81,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 1,
       hit_must_every_m_times => 0},
     #{id => 101120, class_id => 1019, group_id => 110,
       bid => 113006, name => lang:get(<<"漆黑魔魂"/utf8>>),
       num => 1, weight => 101, series_must_weight => 81,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 1,
       hit_must_every_m_times => 0},
     #{id => 101121, class_id => 1019, group_id => 110,
       bid => 113007, name => lang:get(<<"冰岩巨兽"/utf8>>),
       num => 1, weight => 101, series_must_weight => 81,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 1,
       hit_must_every_m_times => 0},
     #{id => 101131, class_id => 1019, group_id => 110,
       bid => 113008, name => lang:get(<<"海灵儿"/utf8>>),
       num => 1, weight => 50, series_must_weight => 41,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 1,
       hit_must_every_m_times => 0},
     #{id => 101122, class_id => 1020, group_id => 110,
       bid => 111001, name => lang:get(<<"滚滚岩"/utf8>>),
       num => 1, weight => 200, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101123, class_id => 1020, group_id => 110,
       bid => 111002, name => lang:get(<<"皮皮"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101124, class_id => 1020, group_id => 110,
       bid => 111003, name => lang:get(<<"火球"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101125, class_id => 1020, group_id => 110,
       bid => 111004, name => lang:get(<<"小豆苗"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101126, class_id => 1020, group_id => 110,
       bid => 111005, name => lang:get(<<"嗡嗡蜂"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101127, class_id => 1020, group_id => 110,
       bid => 112001, name => lang:get(<<"暗夜精灵"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101128, class_id => 1020, group_id => 110,
       bid => 112002, name => lang:get(<<"炎灵"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101129, class_id => 1020, group_id => 110,
       bid => 112003, name => lang:get(<<"潮汐之灵"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0},
     #{id => 101130, class_id => 1020, group_id => 110,
       bid => 112004, name => lang:get(<<"花仙子"/utf8>>),
       num => 1, weight => 100, series_must_weight => 0,
       must_not_in_m_times => 0,
       hit_must_not_after_m_times => 0, is_notice => 0,
       hit_must_every_m_times => 0}];
group_items(_) -> [].

rand_class(103) ->
    [{1011, 1, 288, 0}, {1012, 2, 500, 0},
     {1013, 2, 190, 3}, {1014, 2, 22, 40}, {1015, 2, 0, 0}];
rand_class(102) ->
    [{1006, 1, 288, 0}, {1007, 2, 500, 0},
     {1008, 2, 190, 3}, {1009, 2, 22, 40}, {1010, 2, 0, 0}];
rand_class(101) ->
    [{1001, 1, 288, 0}, {1002, 2, 500, 0},
     {1003, 2, 190, 3}, {1004, 2, 22, 40}, {1005, 2, 0, 0}];
rand_class(110) ->
    [{1016, 1, 4618, 0}, {1017, 2, 5000, 0},
     {1018, 2, 370, 0}, {1019, 2, 12, 40}, {1020, 2, 0, 0}];
rand_class(_) -> [].

server_must_class(103) ->
    [{1011, 1, 0}, {1012, 2, 0}, {1013, 2, 0},
     {1014, 2, 450}, {1015, 2, 0}];
server_must_class(102) ->
    [{1006, 1, 0}, {1007, 2, 0}, {1008, 2, 0},
     {1009, 2, 450}, {1010, 2, 0}];
server_must_class(101) ->
    [{1001, 1, 0}, {1002, 2, 0}, {1003, 2, 0},
     {1004, 2, 450}, {1005, 2, 0}];
server_must_class(110) ->
    [{1016, 1, 0}, {1017, 2, 0}, {1018, 2, 0}, {1019, 2, 0},
     {1020, 2, 0}];
server_must_class(_) -> [].

class_type(1016) -> 1;
class_type(1017) -> 2;
class_type(1018) -> 2;
class_type(1019) -> 2;
class_type(1020) -> 2;
class_type(1001) -> 1;
class_type(1002) -> 2;
class_type(1003) -> 2;
class_type(1004) -> 2;
class_type(1005) -> 2;
class_type(1006) -> 1;
class_type(1007) -> 2;
class_type(1008) -> 2;
class_type(1009) -> 2;
class_type(1010) -> 2;
class_type(1011) -> 1;
class_type(1012) -> 2;
class_type(1013) -> 2;
class_type(1014) -> 2;
class_type(1015) -> 2;
class_type(_Info) ->
    logger:data_error("class_type_data_not_exist===>~w",
		      [_Info], holiday_sprite_lottery_data, 1412),
    undefined.

get_reward(49813) ->
    [{1, 30, [{10415, 3}]}, {2, 60, [{113001, 1}]},
     {3, 120, [{113001, 1}]}, {4, 180, [{113001, 1}]},
     {5, 250, [{113001, 2}]}];
get_reward(49513) ->
    [{1, 30, [{10415, 3}]}, {2, 60, [{113002, 1}]},
     {3, 120, [{113002, 1}]}, {4, 180, [{113002, 1}]},
     {5, 250, [{113002, 2}]}];
get_reward(48034) ->
    [{1, 30, [{10415, 3}]}, {2, 60, [{113006, 1}]},
     {3, 120, [{113006, 1}]}, {4, 180, [{113006, 1}]},
     {5, 250, [{113006, 2}]}];
get_reward(0) ->
    [{1, 30, [{10602, 2}]}, {2, 70, [{10603, 1}]},
     {3, 120, [{39056, 1}]}];
get_reward(_) -> [].

is_best(1016) -> 0;
is_best(1017) -> 0;
is_best(1018) -> 0;
is_best(1019) -> 1;
is_best(1020) -> 0;
is_best(1001) -> 0;
is_best(1002) -> 0;
is_best(1003) -> 1;
is_best(1004) -> 1;
is_best(1005) -> 0;
is_best(1006) -> 0;
is_best(1007) -> 0;
is_best(1008) -> 1;
is_best(1009) -> 1;
is_best(1010) -> 0;
is_best(1011) -> 0;
is_best(1012) -> 0;
is_best(1013) -> 1;
is_best(1014) -> 1;
is_best(1015) -> 0;
is_best(_) -> 0.

must_hit_in_m_times(1016) -> 0;
must_hit_in_m_times(1017) -> 0;
must_hit_in_m_times(1018) -> 0;
must_hit_in_m_times(1019) -> 0;
must_hit_in_m_times(1020) -> 0;
must_hit_in_m_times(1001) -> 0;
must_hit_in_m_times(1002) -> 0;
must_hit_in_m_times(1003) -> 0;
must_hit_in_m_times(1004) -> 45;
must_hit_in_m_times(1005) -> 0;
must_hit_in_m_times(1006) -> 0;
must_hit_in_m_times(1007) -> 0;
must_hit_in_m_times(1008) -> 0;
must_hit_in_m_times(1009) -> 45;
must_hit_in_m_times(1010) -> 0;
must_hit_in_m_times(1011) -> 0;
must_hit_in_m_times(1012) -> 0;
must_hit_in_m_times(1013) -> 0;
must_hit_in_m_times(1014) -> 45;
must_hit_in_m_times(1015) -> 0;
must_hit_in_m_times(_) -> 0.


