-file("data/sprite_data.erl", 1).

-file("src/mod/data/sprite_data.erl", 1).

-module(sprite_data).

-lager_records([{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]}]).

-export([get_const/1, get_hatch_ids/0, get_hatch_cond/1,
	 get_hatch_open_expend/1, get_need_time/1,
	 get_lev_expend/1, get_lev_max/0, get_lev_mail_award/1,
	 get_need_piont/1, get_hatch_award/1, get_baodi_count/1,
	 get_baodi_quality/1, get_reset_award/1, get_egg_bids/0,
	 get_del_piont/1, get_egg_buy_info/1,
	 get_item_buy_info/1, get_tree_attr/0, get_lev_group/0,
	 get_break_group/1, get_break_attr/1,
	 get_tree_break_expend/1, get_limit_sprite_num/1,
	 get_tree_max_lev/1, get_tree_lev_expend/1,
	 get_sprite_skill/1, get_sprite_type/1,
	 get_sprite_power/1, get_sprite_holiday_decompound/1,
	 get_sprite_compound_info/1, get_all_sprites_plan/0,
	 get_sprite_plan/1, get_sprite_type_team/1]).

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

-file("src/mod/data/sprite_data.erl", 42).

-file("inc/attr.hrl", 1).

-record(attr,
	{fc = 0, toughness = 0, atk = 0, def = 0, def_s = 0,
	 def_p = 0, hp_max = 0, hp = 0, speed = 0, hit_rate = 0,
	 dodge_rate = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, dam = 0, res = 0,
	 cure = 0, be_cure = 0, dam_p = 0, res_p = 0, dam_s = 0,
	 res_s = 0, tenacity = 0}).

-record(attr_calc,
	{attr = #attr{}  :: #attr{},
	 attr_no_ratio = #attr{}  :: #attr{},
	 ratio = #attr{}  :: #attr{},
	 attr_no_fc = #attr{}  :: #attr{},
	 ratio_no_fc = #attr{}  :: #attr{}}).

-file("src/mod/data/sprite_data.erl", 43).

get_const(sprite_unlocked_lv) -> 80;
get_const(hatch_desc) -> 1;
get_const(ancient_desc) -> 1;
get_const(ancient_story) -> 1;
get_const(egg_buy_limit) -> 1;
get_const(egg_buy_price) -> {10603, [{3, 2000000}]};
get_const(prop_buy_limit) -> 2;
get_const(prop_buy_price) -> {10701, [{3, 100}]};
get_const(awake_gain) -> 10042;
get_const(daily_free_gift) -> [{10601, 2}];
get_const(end_time) -> 1300;
get_const(reborn_exhibition) ->
    [{39067, 1}, {10040, 1}];
get_const(reborn_tips) -> 1;
get_const(sprite_max_star_show) -> 5;
get_const(hatch_rate) -> 5;
get_const(free_programmes) -> 2;
get_const(total_programmes) -> 10;
get_const(programme_add_cost) -> {3, 300};
get_const(_) -> undefined.

get_hatch_ids() -> [1, 4, 5, 6, 2, 3].

get_hatch_cond(1) -> {lev, 80};
get_hatch_cond(4) -> {sprite_tree_lv, 15};
get_hatch_cond(5) ->
    {has_any_sprite,
     [113201, 113202, 113203, 113204, 113205, 113206, 113207,
      113208, 113209, 113210, 113211, 113212, 114001]};
get_hatch_cond(6) -> {sprite_power, 1200};
get_hatch_cond(2) -> {privilege, 5};
get_hatch_cond(3) -> {privilege, 5};
get_hatch_cond(_Info) ->
    logger:data_error("get_hatch_cond_data_not_exist===>~w",
		      [_Info], sprite_data, 72),
    undefined.

get_hatch_open_expend(1) -> [];
get_hatch_open_expend(4) -> [{3, 50}];
get_hatch_open_expend(5) -> [{3, 100}];
get_hatch_open_expend(6) -> [{3, 200}];
get_hatch_open_expend(2) -> [];
get_hatch_open_expend(3) -> [];
get_hatch_open_expend(_Info) ->
    logger:data_error("get_hatch_open_expend_data_not_exist===>~w",
		      [_Info], sprite_data, 80),
    undefined.

get_need_time(0) -> 0;
get_need_time(1) -> 0;
get_need_time(2) -> 0;
get_need_time(3) -> 0;
get_need_time(4) -> 0;
get_need_time(5) -> 0;
get_need_time(6) -> 0;
get_need_time(_Info) ->
    logger:data_error("get_need_time_data_not_exist===>~w",
		      [_Info], sprite_data, 89),
    undefined.

get_lev_expend(0) -> {0, [{3, 0}]};
get_lev_expend(1) -> {0, [{3, 100}]};
get_lev_expend(2) -> {1, [{3, 200}]};
get_lev_expend(3) -> {3, [{3, 500}]};
get_lev_expend(4) -> {4, [{3, 800}]};
get_lev_expend(5) -> {5, [{3, 1200}]};
get_lev_expend(6) -> {6, [{3, 1600}]};
get_lev_expend(_Info) ->
    logger:data_error("get_lev_expend_data_not_exist===>~w",
		      [_Info], sprite_data, 98),
    undefined.

get_lev_max() -> 6.

get_lev_mail_award(0) -> [];
get_lev_mail_award(1) -> [{3, 100}];
get_lev_mail_award(2) -> [{3, 300}];
get_lev_mail_award(3) -> [{3, 800}];
get_lev_mail_award(4) -> [{3, 1600}];
get_lev_mail_award(5) -> [{3, 2800}];
get_lev_mail_award(6) -> [{3, 4400}];
get_lev_mail_award(_Info) ->
    logger:data_error("get_lev_mail_award_data_not_exist===>~w",
		      [_Info], sprite_data, 109),
    undefined.

get_need_piont(10601) -> 2880;
get_need_piont(10602) -> 5760;
get_need_piont(10603) -> 8640;
get_need_piont(_Info) ->
    logger:data_error("get_need_piont_data_not_exist===>~w",
		      [_Info], sprite_data, 114),
    undefined.

get_hatch_award(10601) -> {[81001], [], [], []};
get_hatch_award(10602) ->
    {[81002], [], [], [{10040, 3}]};
get_hatch_award(10603) ->
    {[81003], [81004], [], [{10040, 6}]};
get_hatch_award(_Info) ->
    logger:data_error("get_hatch_award_data_not_exist===>~w",
		      [_Info], sprite_data, 119),
    undefined.

get_baodi_count(10601) -> 0;
get_baodi_count(10602) -> 0;
get_baodi_count(10603) -> 14;
get_baodi_count(_) -> 0.

get_baodi_quality(10601) -> 999;
get_baodi_quality(10602) -> 999;
get_baodi_quality(10603) -> 4;
get_baodi_quality(_) -> 999.

get_reset_award(10601) -> [{10601, 1}];
get_reset_award(10602) -> [{10601, 2}];
get_reset_award(10603) -> [{10602, 2}];
get_reset_award(_) -> [].

get_egg_bids() -> [10601, 10602, 10603].

get_del_piont(10701) -> 2592;
get_del_piont(10702) -> 12960;
get_del_piont(10703) -> 25920;
get_del_piont(_Info) ->
    logger:data_error("get_del_piont_data_not_exist===>~w",
		      [_Info], sprite_data, 141),
    undefined.

get_egg_buy_info(10601) -> {1, [{1, 1200000}], 30};
get_egg_buy_info(10602) -> {1, [{3, 300}], 5};
get_egg_buy_info(10603) -> {0, [], 0};
get_egg_buy_info(_Info) ->
    logger:data_error("get_egg_buy_info_data_not_exist===>~w",
		      [_Info], sprite_data, 146),
    undefined.

get_item_buy_info(10701) -> {1, [{3, 15}], 20};
get_item_buy_info(10702) -> {1, [{3, 75}], 20};
get_item_buy_info(10703) -> {1, [{3, 150}], 20};
get_item_buy_info(_Info) ->
    logger:data_error("get_item_buy_info_data_not_exist===>~w",
		      [_Info], sprite_data, 151),
    undefined.

get_tree_attr() ->
    #attr{hp_max = 34450, atk = 5642, def = 200,
	  speed = 100, crit_rate = 2000, crit_ratio = 1200,
	  hit_magic = 0, dodge_magic = 0, hit_rate = 9999,
	  dodge_rate = 0}.

get_lev_group() -> {405504, 115200, 10000, 5000}.

get_break_group(0) -> {1000, 1000, 1000, 1000};
get_break_group(1) -> {1300, 1300, 1000, 1000};
get_break_group(2) -> {1690, 1690, 1000, 1000};
get_break_group(3) -> {2197, 2197, 1000, 1000};
get_break_group(4) -> {2856, 2856, 1000, 1000};
get_break_group(5) -> {3712, 3712, 1000, 1000};
get_break_group(6) -> {4825, 4825, 1000, 1000};
get_break_group(7) -> {6272, 6272, 1000, 1000};
get_break_group(8) -> {8000, 8000, 1000, 1000};
get_break_group(9) -> {10500, 10500, 1000, 1000};
get_break_group(10) -> {13000, 13000, 1100, 1100};
get_break_group(11) -> {16500, 16500, 1200, 1200};
get_break_group(12) -> {20500, 20500, 1300, 1300};
get_break_group(_Info) ->
    logger:data_error("get_break_group_data_not_exist===>~w",
		      [_Info], sprite_data, 170),
    undefined.

get_break_attr(0) -> [];
get_break_attr(1) ->
    [{hp_max, 700}, {atk, 100}, {def, 10}, {speed, 5}];
get_break_attr(2) ->
    [{hp_max, 1400}, {atk, 200}, {def, 20}, {speed, 10}];
get_break_attr(3) ->
    [{hp_max, 2100}, {atk, 300}, {def, 30}, {speed, 15}];
get_break_attr(4) ->
    [{hp_max, 2800}, {atk, 400}, {def, 40}, {speed, 20}];
get_break_attr(5) ->
    [{hp_max, 3500}, {atk, 500}, {def, 50}, {speed, 25}];
get_break_attr(6) ->
    [{hp_max, 4200}, {atk, 600}, {def, 60}, {speed, 30}];
get_break_attr(7) ->
    [{hp_max, 4900}, {atk, 700}, {def, 70}, {speed, 35}];
get_break_attr(8) ->
    [{hp_max, 5600}, {atk, 800}, {def, 80}, {speed, 40}];
get_break_attr(9) ->
    [{hp_max, 6300}, {atk, 900}, {def, 90}, {speed, 45}];
get_break_attr(10) ->
    [{hp_max, 7000}, {atk, 1000}, {def, 100}, {speed, 50}];
get_break_attr(11) ->
    [{hp_max, 7700}, {atk, 1100}, {def, 110}, {speed, 55}];
get_break_attr(12) ->
    [{hp_max, 8400}, {atk, 1200}, {def, 120}, {speed, 60}];
get_break_attr(_) -> [].

get_tree_break_expend(0) -> [{10041, 1}, {10040, 50}];
get_tree_break_expend(1) -> [{10041, 2}, {10040, 100}];
get_tree_break_expend(2) -> [{10041, 3}, {10040, 150}];
get_tree_break_expend(3) -> [{10041, 4}, {10040, 200}];
get_tree_break_expend(4) -> [{10041, 6}, {10040, 250}];
get_tree_break_expend(5) -> [{10041, 8}, {10040, 300}];
get_tree_break_expend(6) -> [{10041, 10}, {10040, 350}];
get_tree_break_expend(7) -> [{10041, 15}, {10040, 400}];
get_tree_break_expend(8) ->
    [{10041, 3000}, {10040, 400000}];
get_tree_break_expend(9) ->
    [{10041, 5000}, {10040, 600000}];
get_tree_break_expend(10) ->
    [{10041, 7000}, {10040, 800000}];
get_tree_break_expend(11) ->
    [{10041, 9000}, {10040, 1000000}];
get_tree_break_expend(12) ->
    [{10041, 11000}, {10040, 2000000}];
get_tree_break_expend(_Info) ->
    logger:data_error("get_tree_break_expend_data_not_exist===>~w",
		      [_Info], sprite_data, 200),
    undefined.

get_limit_sprite_num(0) -> 1;
get_limit_sprite_num(1) -> 2;
get_limit_sprite_num(2) -> 3;
get_limit_sprite_num(3) -> 4;
get_limit_sprite_num(4) -> 4;
get_limit_sprite_num(5) -> 4;
get_limit_sprite_num(6) -> 4;
get_limit_sprite_num(7) -> 4;
get_limit_sprite_num(8) -> 4;
get_limit_sprite_num(9) -> 4;
get_limit_sprite_num(10) -> 4;
get_limit_sprite_num(11) -> 4;
get_limit_sprite_num(12) -> 4;
get_limit_sprite_num(_Info) ->
    logger:data_error("get_limit_sprite_num_data_not_exist===>~w",
		      [_Info], sprite_data, 215),
    undefined.

get_tree_max_lev(0) -> 10;
get_tree_max_lev(1) -> 30;
get_tree_max_lev(2) -> 50;
get_tree_max_lev(3) -> 80;
get_tree_max_lev(4) -> 110;
get_tree_max_lev(5) -> 140;
get_tree_max_lev(6) -> 170;
get_tree_max_lev(7) -> 200;
get_tree_max_lev(8) -> 230;
get_tree_max_lev(9) -> 310;
get_tree_max_lev(10) -> 400;
get_tree_max_lev(11) -> 500;
get_tree_max_lev(12) -> 600;
get_tree_max_lev(_Info) ->
    logger:data_error("get_tree_max_lev_data_not_exist===>~w",
		      [_Info], sprite_data, 230),
    undefined.

get_tree_lev_expend(1) -> [{10040, 1}, {1, 50000}];
get_tree_lev_expend(2) -> [{10040, 2}, {1, 100000}];
get_tree_lev_expend(3) -> [{10040, 3}, {1, 150000}];
get_tree_lev_expend(4) -> [{10040, 4}, {1, 200000}];
get_tree_lev_expend(5) -> [{10040, 5}, {1, 250000}];
get_tree_lev_expend(6) -> [{10040, 6}, {1, 300000}];
get_tree_lev_expend(7) -> [{10040, 7}, {1, 350000}];
get_tree_lev_expend(8) -> [{10040, 8}, {1, 400000}];
get_tree_lev_expend(9) -> [{10040, 9}, {1, 450000}];
get_tree_lev_expend(10) -> [{10040, 10}, {1, 500000}];
get_tree_lev_expend(11) -> [{10040, 11}, {1, 550000}];
get_tree_lev_expend(12) -> [{10040, 12}, {1, 600000}];
get_tree_lev_expend(13) -> [{10040, 13}, {1, 650000}];
get_tree_lev_expend(14) -> [{10040, 14}, {1, 700000}];
get_tree_lev_expend(15) -> [{10040, 15}, {1, 750000}];
get_tree_lev_expend(16) -> [{10040, 16}, {1, 800000}];
get_tree_lev_expend(17) -> [{10040, 17}, {1, 850000}];
get_tree_lev_expend(18) -> [{10040, 18}, {1, 900000}];
get_tree_lev_expend(19) -> [{10040, 19}, {1, 950000}];
get_tree_lev_expend(20) -> [{10040, 20}, {1, 1000000}];
get_tree_lev_expend(21) -> [{10040, 21}, {1, 1050000}];
get_tree_lev_expend(22) -> [{10040, 22}, {1, 1100000}];
get_tree_lev_expend(23) -> [{10040, 23}, {1, 1150000}];
get_tree_lev_expend(24) -> [{10040, 24}, {1, 1200000}];
get_tree_lev_expend(25) -> [{10040, 25}, {1, 1250000}];
get_tree_lev_expend(26) -> [{10040, 26}, {1, 1300000}];
get_tree_lev_expend(27) -> [{10040, 27}, {1, 1350000}];
get_tree_lev_expend(28) -> [{10040, 28}, {1, 1400000}];
get_tree_lev_expend(29) -> [{10040, 30}, {1, 1500000}];
get_tree_lev_expend(30) -> [{10040, 32}, {1, 1600000}];
get_tree_lev_expend(31) -> [{10040, 34}, {1, 1700000}];
get_tree_lev_expend(32) -> [{10040, 36}, {1, 1800000}];
get_tree_lev_expend(33) -> [{10040, 38}, {1, 1900000}];
get_tree_lev_expend(34) -> [{10040, 40}, {1, 2000000}];
get_tree_lev_expend(35) -> [{10040, 42}, {1, 2100000}];
get_tree_lev_expend(36) -> [{10040, 44}, {1, 2200000}];
get_tree_lev_expend(37) -> [{10040, 46}, {1, 2300000}];
get_tree_lev_expend(38) -> [{10040, 48}, {1, 2400000}];
get_tree_lev_expend(39) -> [{10040, 50}, {1, 2500000}];
get_tree_lev_expend(40) -> [{10040, 52}, {1, 2600000}];
get_tree_lev_expend(41) -> [{10040, 54}, {1, 2700000}];
get_tree_lev_expend(42) -> [{10040, 56}, {1, 2800000}];
get_tree_lev_expend(43) -> [{10040, 58}, {1, 2900000}];
get_tree_lev_expend(44) -> [{10040, 60}, {1, 3000000}];
get_tree_lev_expend(45) -> [{10040, 62}, {1, 3100000}];
get_tree_lev_expend(46) -> [{10040, 64}, {1, 3200000}];
get_tree_lev_expend(47) -> [{10040, 66}, {1, 3300000}];
get_tree_lev_expend(48) -> [{10040, 68}, {1, 3400000}];
get_tree_lev_expend(49) -> [{10040, 70}, {1, 3500000}];
get_tree_lev_expend(50) -> [{10040, 72}, {1, 3600000}];
get_tree_lev_expend(51) -> [{10040, 74}, {1, 3700000}];
get_tree_lev_expend(52) -> [{10040, 76}, {1, 3800000}];
get_tree_lev_expend(53) -> [{10040, 78}, {1, 3900000}];
get_tree_lev_expend(54) -> [{10040, 80}, {1, 4000000}];
get_tree_lev_expend(55) -> [{10040, 82}, {1, 4100000}];
get_tree_lev_expend(56) -> [{10040, 84}, {1, 4200000}];
get_tree_lev_expend(57) -> [{10040, 86}, {1, 4300000}];
get_tree_lev_expend(58) -> [{10040, 88}, {1, 4400000}];
get_tree_lev_expend(59) -> [{10040, 90}, {1, 4500000}];
get_tree_lev_expend(60) -> [{10040, 92}, {1, 4600000}];
get_tree_lev_expend(61) -> [{10040, 94}, {1, 4700000}];
get_tree_lev_expend(62) -> [{10040, 96}, {1, 4800000}];
get_tree_lev_expend(63) -> [{10040, 98}, {1, 4900000}];
get_tree_lev_expend(64) -> [{10040, 100}, {1, 5000000}];
get_tree_lev_expend(65) -> [{10040, 102}, {1, 5100000}];
get_tree_lev_expend(66) -> [{10040, 104}, {1, 5200000}];
get_tree_lev_expend(67) -> [{10040, 106}, {1, 5300000}];
get_tree_lev_expend(68) -> [{10040, 108}, {1, 5400000}];
get_tree_lev_expend(69) -> [{10040, 110}, {1, 5500000}];
get_tree_lev_expend(70) -> [{10040, 112}, {1, 5600000}];
get_tree_lev_expend(71) -> [{10040, 114}, {1, 5700000}];
get_tree_lev_expend(72) -> [{10040, 116}, {1, 5800000}];
get_tree_lev_expend(73) -> [{10040, 118}, {1, 5900000}];
get_tree_lev_expend(74) -> [{10040, 120}, {1, 6000000}];
get_tree_lev_expend(75) -> [{10040, 122}, {1, 6100000}];
get_tree_lev_expend(76) -> [{10040, 124}, {1, 6200000}];
get_tree_lev_expend(77) -> [{10040, 126}, {1, 6300000}];
get_tree_lev_expend(78) -> [{10040, 128}, {1, 6400000}];
get_tree_lev_expend(79) -> [{10040, 130}, {1, 6500000}];
get_tree_lev_expend(80) -> [{10040, 132}, {1, 6600000}];
get_tree_lev_expend(81) -> [{10040, 134}, {1, 6700000}];
get_tree_lev_expend(82) -> [{10040, 136}, {1, 6800000}];
get_tree_lev_expend(83) -> [{10040, 138}, {1, 6900000}];
get_tree_lev_expend(84) -> [{10040, 140}, {1, 7000000}];
get_tree_lev_expend(85) -> [{10040, 142}, {1, 7100000}];
get_tree_lev_expend(86) -> [{10040, 144}, {1, 7200000}];
get_tree_lev_expend(87) -> [{10040, 146}, {1, 7300000}];
get_tree_lev_expend(88) -> [{10040, 148}, {1, 7400000}];
get_tree_lev_expend(89) -> [{10040, 150}, {1, 7500000}];
get_tree_lev_expend(90) -> [{10040, 152}, {1, 7600000}];
get_tree_lev_expend(91) -> [{10040, 154}, {1, 7700000}];
get_tree_lev_expend(92) -> [{10040, 156}, {1, 7800000}];
get_tree_lev_expend(93) -> [{10040, 158}, {1, 7900000}];
get_tree_lev_expend(94) -> [{10040, 160}, {1, 8000000}];
get_tree_lev_expend(95) -> [{10040, 162}, {1, 8100000}];
get_tree_lev_expend(96) -> [{10040, 164}, {1, 8200000}];
get_tree_lev_expend(97) -> [{10040, 166}, {1, 8300000}];
get_tree_lev_expend(98) -> [{10040, 168}, {1, 8400000}];
get_tree_lev_expend(99) -> [{10040, 170}, {1, 8500000}];
get_tree_lev_expend(100) ->
    [{10040, 172}, {1, 8600000}];
get_tree_lev_expend(101) ->
    [{10040, 174}, {1, 8700000}];
get_tree_lev_expend(102) ->
    [{10040, 176}, {1, 8800000}];
get_tree_lev_expend(103) ->
    [{10040, 178}, {1, 8900000}];
get_tree_lev_expend(104) ->
    [{10040, 180}, {1, 9000000}];
get_tree_lev_expend(105) ->
    [{10040, 182}, {1, 9100000}];
get_tree_lev_expend(106) ->
    [{10040, 184}, {1, 9200000}];
get_tree_lev_expend(107) ->
    [{10040, 186}, {1, 9300000}];
get_tree_lev_expend(108) ->
    [{10040, 188}, {1, 9400000}];
get_tree_lev_expend(109) ->
    [{10040, 190}, {1, 9500000}];
get_tree_lev_expend(110) ->
    [{10040, 192}, {1, 9600000}];
get_tree_lev_expend(111) ->
    [{10040, 194}, {1, 9700000}];
get_tree_lev_expend(112) ->
    [{10040, 196}, {1, 9800000}];
get_tree_lev_expend(113) ->
    [{10040, 198}, {1, 9900000}];
get_tree_lev_expend(114) ->
    [{10040, 200}, {1, 10000000}];
get_tree_lev_expend(115) ->
    [{10040, 202}, {1, 10100000}];
get_tree_lev_expend(116) ->
    [{10040, 204}, {1, 10200000}];
get_tree_lev_expend(117) ->
    [{10040, 206}, {1, 10300000}];
get_tree_lev_expend(118) ->
    [{10040, 208}, {1, 10400000}];
get_tree_lev_expend(119) ->
    [{10040, 210}, {1, 10500000}];
get_tree_lev_expend(120) ->
    [{10040, 212}, {1, 10600000}];
get_tree_lev_expend(121) ->
    [{10040, 214}, {1, 10700000}];
get_tree_lev_expend(122) ->
    [{10040, 216}, {1, 10800000}];
get_tree_lev_expend(123) ->
    [{10040, 218}, {1, 10900000}];
get_tree_lev_expend(124) ->
    [{10040, 220}, {1, 11000000}];
get_tree_lev_expend(125) ->
    [{10040, 222}, {1, 11100000}];
get_tree_lev_expend(126) ->
    [{10040, 224}, {1, 11200000}];
get_tree_lev_expend(127) ->
    [{10040, 226}, {1, 11300000}];
get_tree_lev_expend(128) ->
    [{10040, 228}, {1, 11400000}];
get_tree_lev_expend(129) ->
    [{10040, 230}, {1, 11500000}];
get_tree_lev_expend(130) ->
    [{10040, 232}, {1, 11600000}];
get_tree_lev_expend(131) ->
    [{10040, 234}, {1, 11700000}];
get_tree_lev_expend(132) ->
    [{10040, 236}, {1, 11800000}];
get_tree_lev_expend(133) ->
    [{10040, 238}, {1, 11900000}];
get_tree_lev_expend(134) ->
    [{10040, 240}, {1, 12000000}];
get_tree_lev_expend(135) ->
    [{10040, 242}, {1, 12100000}];
get_tree_lev_expend(136) ->
    [{10040, 244}, {1, 12200000}];
get_tree_lev_expend(137) ->
    [{10040, 246}, {1, 12300000}];
get_tree_lev_expend(138) ->
    [{10040, 248}, {1, 12400000}];
get_tree_lev_expend(139) ->
    [{10040, 250}, {1, 12500000}];
get_tree_lev_expend(140) ->
    [{10040, 252}, {1, 12600000}];
get_tree_lev_expend(141) ->
    [{10040, 254}, {1, 12700000}];
get_tree_lev_expend(142) ->
    [{10040, 256}, {1, 12800000}];
get_tree_lev_expend(143) ->
    [{10040, 258}, {1, 12900000}];
get_tree_lev_expend(144) ->
    [{10040, 260}, {1, 13000000}];
get_tree_lev_expend(145) ->
    [{10040, 262}, {1, 13100000}];
get_tree_lev_expend(146) ->
    [{10040, 264}, {1, 13200000}];
get_tree_lev_expend(147) ->
    [{10040, 266}, {1, 13300000}];
get_tree_lev_expend(148) ->
    [{10040, 268}, {1, 13400000}];
get_tree_lev_expend(149) ->
    [{10040, 270}, {1, 13500000}];
get_tree_lev_expend(150) ->
    [{10040, 272}, {1, 13600000}];
get_tree_lev_expend(151) ->
    [{10040, 274}, {1, 13700000}];
get_tree_lev_expend(152) ->
    [{10040, 276}, {1, 13800000}];
get_tree_lev_expend(153) ->
    [{10040, 278}, {1, 13900000}];
get_tree_lev_expend(154) ->
    [{10040, 280}, {1, 14000000}];
get_tree_lev_expend(155) ->
    [{10040, 282}, {1, 14100000}];
get_tree_lev_expend(156) ->
    [{10040, 284}, {1, 14200000}];
get_tree_lev_expend(157) ->
    [{10040, 286}, {1, 14300000}];
get_tree_lev_expend(158) ->
    [{10040, 288}, {1, 14400000}];
get_tree_lev_expend(159) ->
    [{10040, 290}, {1, 14500000}];
get_tree_lev_expend(160) ->
    [{10040, 292}, {1, 14600000}];
get_tree_lev_expend(161) ->
    [{10040, 294}, {1, 14700000}];
get_tree_lev_expend(162) ->
    [{10040, 296}, {1, 14800000}];
get_tree_lev_expend(163) ->
    [{10040, 298}, {1, 14900000}];
get_tree_lev_expend(164) ->
    [{10040, 300}, {1, 15000000}];
get_tree_lev_expend(165) ->
    [{10040, 302}, {1, 15100000}];
get_tree_lev_expend(166) ->
    [{10040, 304}, {1, 15200000}];
get_tree_lev_expend(167) ->
    [{10040, 306}, {1, 15300000}];
get_tree_lev_expend(168) ->
    [{10040, 308}, {1, 15400000}];
get_tree_lev_expend(169) ->
    [{10040, 310}, {1, 15500000}];
get_tree_lev_expend(170) ->
    [{10040, 312}, {1, 15600000}];
get_tree_lev_expend(171) ->
    [{10040, 314}, {1, 15700000}];
get_tree_lev_expend(172) ->
    [{10040, 316}, {1, 15800000}];
get_tree_lev_expend(173) ->
    [{10040, 318}, {1, 15900000}];
get_tree_lev_expend(174) ->
    [{10040, 320}, {1, 16000000}];
get_tree_lev_expend(175) ->
    [{10040, 322}, {1, 16100000}];
get_tree_lev_expend(176) ->
    [{10040, 324}, {1, 16200000}];
get_tree_lev_expend(177) ->
    [{10040, 326}, {1, 16300000}];
get_tree_lev_expend(178) ->
    [{10040, 328}, {1, 16400000}];
get_tree_lev_expend(179) ->
    [{10040, 330}, {1, 16500000}];
get_tree_lev_expend(180) ->
    [{10040, 332}, {1, 16600000}];
get_tree_lev_expend(181) ->
    [{10040, 334}, {1, 16700000}];
get_tree_lev_expend(182) ->
    [{10040, 336}, {1, 16800000}];
get_tree_lev_expend(183) ->
    [{10040, 338}, {1, 16900000}];
get_tree_lev_expend(184) ->
    [{10040, 340}, {1, 17000000}];
get_tree_lev_expend(185) ->
    [{10040, 342}, {1, 17100000}];
get_tree_lev_expend(186) ->
    [{10040, 344}, {1, 17200000}];
get_tree_lev_expend(187) ->
    [{10040, 346}, {1, 17300000}];
get_tree_lev_expend(188) ->
    [{10040, 348}, {1, 17400000}];
get_tree_lev_expend(189) ->
    [{10040, 350}, {1, 17500000}];
get_tree_lev_expend(190) ->
    [{10040, 352}, {1, 17600000}];
get_tree_lev_expend(191) ->
    [{10040, 354}, {1, 17700000}];
get_tree_lev_expend(192) ->
    [{10040, 356}, {1, 17800000}];
get_tree_lev_expend(193) ->
    [{10040, 358}, {1, 17900000}];
get_tree_lev_expend(194) ->
    [{10040, 360}, {1, 18000000}];
get_tree_lev_expend(195) ->
    [{10040, 362}, {1, 18100000}];
get_tree_lev_expend(196) ->
    [{10040, 364}, {1, 18200000}];
get_tree_lev_expend(197) ->
    [{10040, 366}, {1, 18300000}];
get_tree_lev_expend(198) ->
    [{10040, 368}, {1, 18400000}];
get_tree_lev_expend(199) ->
    [{10040, 370}, {1, 18500000}];
get_tree_lev_expend(200) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(201) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(202) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(203) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(204) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(205) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(206) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(207) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(208) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(209) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(210) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(211) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(212) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(213) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(214) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(215) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(216) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(217) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(218) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(219) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(220) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(221) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(222) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(223) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(224) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(225) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(226) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(227) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(228) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(229) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(230) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(231) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(232) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(233) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(234) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(235) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(236) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(237) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(238) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(239) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(240) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(241) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(242) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(243) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(244) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(245) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(246) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(247) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(248) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(249) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(250) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(251) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(252) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(253) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(254) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(255) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(256) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(257) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(258) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(259) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(260) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(261) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(262) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(263) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(264) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(265) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(266) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(267) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(268) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(269) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(270) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(271) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(272) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(273) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(274) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(275) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(276) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(277) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(278) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(279) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(280) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(281) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(282) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(283) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(284) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(285) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(286) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(287) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(288) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(289) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(290) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(291) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(292) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(293) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(294) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(295) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(296) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(297) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(298) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(299) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(300) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(301) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(302) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(303) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(304) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(305) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(306) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(307) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(308) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(309) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(310) ->
    [{10040, 30000}, {1, 100000000}];
get_tree_lev_expend(311) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(312) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(313) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(314) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(315) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(316) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(317) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(318) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(319) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(320) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(321) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(322) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(323) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(324) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(325) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(326) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(327) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(328) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(329) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(330) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(331) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(332) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(333) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(334) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(335) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(336) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(337) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(338) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(339) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(340) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(341) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(342) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(343) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(344) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(345) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(346) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(347) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(348) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(349) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(350) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(351) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(352) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(353) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(354) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(355) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(356) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(357) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(358) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(359) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(360) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(361) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(362) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(363) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(364) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(365) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(366) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(367) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(368) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(369) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(370) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(371) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(372) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(373) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(374) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(375) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(376) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(377) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(378) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(379) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(380) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(381) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(382) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(383) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(384) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(385) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(386) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(387) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(388) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(389) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(390) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(391) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(392) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(393) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(394) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(395) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(396) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(397) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(398) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(399) ->
    [{10040, 50000}, {1, 100000000}];
get_tree_lev_expend(400) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(401) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(402) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(403) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(404) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(405) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(406) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(407) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(408) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(409) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(410) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(411) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(412) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(413) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(414) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(415) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(416) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(417) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(418) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(419) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(420) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(421) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(422) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(423) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(424) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(425) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(426) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(427) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(428) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(429) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(430) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(431) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(432) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(433) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(434) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(435) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(436) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(437) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(438) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(439) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(440) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(441) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(442) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(443) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(444) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(445) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(446) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(447) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(448) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(449) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(450) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(451) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(452) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(453) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(454) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(455) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(456) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(457) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(458) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(459) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(460) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(461) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(462) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(463) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(464) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(465) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(466) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(467) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(468) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(469) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(470) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(471) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(472) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(473) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(474) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(475) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(476) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(477) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(478) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(479) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(480) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(481) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(482) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(483) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(484) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(485) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(486) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(487) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(488) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(489) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(490) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(491) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(492) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(493) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(494) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(495) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(496) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(497) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(498) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(499) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(500) ->
    [{10040, 65000}, {1, 100000000}];
get_tree_lev_expend(501) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(502) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(503) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(504) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(505) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(506) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(507) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(508) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(509) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(510) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(511) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(512) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(513) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(514) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(515) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(516) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(517) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(518) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(519) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(520) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(521) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(522) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(523) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(524) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(525) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(526) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(527) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(528) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(529) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(530) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(531) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(532) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(533) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(534) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(535) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(536) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(537) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(538) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(539) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(540) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(541) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(542) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(543) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(544) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(545) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(546) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(547) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(548) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(549) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(550) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(551) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(552) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(553) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(554) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(555) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(556) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(557) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(558) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(559) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(560) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(561) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(562) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(563) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(564) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(565) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(566) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(567) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(568) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(569) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(570) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(571) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(572) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(573) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(574) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(575) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(576) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(577) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(578) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(579) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(580) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(581) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(582) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(583) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(584) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(585) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(586) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(587) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(588) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(589) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(590) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(591) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(592) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(593) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(594) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(595) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(596) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(597) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(598) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(599) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(600) ->
    [{10040, 80000}, {1, 100000000}];
get_tree_lev_expend(_Info) ->
    logger:data_error("get_tree_lev_expend_data_not_exist===>~w",
		      [_Info], sprite_data, 832),
    undefined.

get_sprite_skill(111001) -> 21011;
get_sprite_skill(111002) -> 21021;
get_sprite_skill(111003) -> 21031;
get_sprite_skill(111004) -> 21041;
get_sprite_skill(111005) -> 21051;
get_sprite_skill(112001) -> 22011;
get_sprite_skill(112002) -> 22021;
get_sprite_skill(112003) -> 22031;
get_sprite_skill(112004) -> 22041;
get_sprite_skill(113001) -> 23011;
get_sprite_skill(113002) -> 23021;
get_sprite_skill(113003) -> 23031;
get_sprite_skill(113004) -> 23041;
get_sprite_skill(113005) -> 23051;
get_sprite_skill(113006) -> 23061;
get_sprite_skill(113007) -> 23071;
get_sprite_skill(113008) -> 23081;
get_sprite_skill(113009) -> 23091;
get_sprite_skill(113010) -> 23201;
get_sprite_skill(113011) -> 23211;
get_sprite_skill(111101) -> 21012;
get_sprite_skill(111102) -> 21022;
get_sprite_skill(111103) -> 21032;
get_sprite_skill(111104) -> 21042;
get_sprite_skill(111105) -> 21052;
get_sprite_skill(112101) -> 22012;
get_sprite_skill(112102) -> 22022;
get_sprite_skill(112103) -> 22032;
get_sprite_skill(112104) -> 22042;
get_sprite_skill(113101) -> 23012;
get_sprite_skill(113102) -> 23022;
get_sprite_skill(113103) -> 23032;
get_sprite_skill(113104) -> 23042;
get_sprite_skill(113105) -> 23052;
get_sprite_skill(113106) -> 23062;
get_sprite_skill(113107) -> 23072;
get_sprite_skill(113108) -> 23082;
get_sprite_skill(113109) -> 23092;
get_sprite_skill(113110) -> 23202;
get_sprite_skill(113111) -> 23212;
get_sprite_skill(111201) -> 21013;
get_sprite_skill(111202) -> 21023;
get_sprite_skill(111203) -> 21033;
get_sprite_skill(111204) -> 21043;
get_sprite_skill(111205) -> 21053;
get_sprite_skill(112201) -> 22013;
get_sprite_skill(112202) -> 22023;
get_sprite_skill(112203) -> 22033;
get_sprite_skill(112204) -> 22043;
get_sprite_skill(113201) -> 23013;
get_sprite_skill(113202) -> 23023;
get_sprite_skill(113203) -> 23033;
get_sprite_skill(113204) -> 23043;
get_sprite_skill(113205) -> 23053;
get_sprite_skill(113206) -> 23063;
get_sprite_skill(113207) -> 23073;
get_sprite_skill(113208) -> 23083;
get_sprite_skill(113209) -> 23093;
get_sprite_skill(113210) -> 23203;
get_sprite_skill(113211) -> 23213;
get_sprite_skill(111301) -> 21014;
get_sprite_skill(111302) -> 21024;
get_sprite_skill(111303) -> 21034;
get_sprite_skill(111304) -> 21044;
get_sprite_skill(111305) -> 21054;
get_sprite_skill(112301) -> 22014;
get_sprite_skill(112302) -> 22024;
get_sprite_skill(112303) -> 22034;
get_sprite_skill(112304) -> 22044;
get_sprite_skill(113301) -> 23014;
get_sprite_skill(113302) -> 23024;
get_sprite_skill(113303) -> 23034;
get_sprite_skill(113304) -> 23044;
get_sprite_skill(113305) -> 23054;
get_sprite_skill(113306) -> 23064;
get_sprite_skill(113307) -> 23074;
get_sprite_skill(113308) -> 23084;
get_sprite_skill(113309) -> 23094;
get_sprite_skill(113310) -> 23204;
get_sprite_skill(113311) -> 23214;
get_sprite_skill(111401) -> 21015;
get_sprite_skill(111402) -> 21025;
get_sprite_skill(111403) -> 21035;
get_sprite_skill(111404) -> 21045;
get_sprite_skill(111405) -> 21055;
get_sprite_skill(112401) -> 22015;
get_sprite_skill(112402) -> 22025;
get_sprite_skill(112403) -> 22035;
get_sprite_skill(112404) -> 22045;
get_sprite_skill(113401) -> 23015;
get_sprite_skill(113402) -> 23025;
get_sprite_skill(113403) -> 23035;
get_sprite_skill(113404) -> 23045;
get_sprite_skill(113405) -> 23055;
get_sprite_skill(113406) -> 23065;
get_sprite_skill(113407) -> 23075;
get_sprite_skill(113408) -> 23085;
get_sprite_skill(113409) -> 23095;
get_sprite_skill(113410) -> 23205;
get_sprite_skill(113411) -> 23215;
get_sprite_skill(113012) -> 23221;
get_sprite_skill(113112) -> 23222;
get_sprite_skill(113212) -> 23223;
get_sprite_skill(113312) -> 23224;
get_sprite_skill(113412) -> 23225;
get_sprite_skill(114001) -> 24001;
get_sprite_skill(114101) -> 24002;
get_sprite_skill(114201) -> 24003;
get_sprite_skill(114301) -> 24004;
get_sprite_skill(114401) -> 24005;
get_sprite_skill(_) -> [].

get_sprite_type(111001) -> 1;
get_sprite_type(111002) -> 2;
get_sprite_type(111003) -> 3;
get_sprite_type(111004) -> 4;
get_sprite_type(111005) -> 5;
get_sprite_type(112001) -> 6;
get_sprite_type(112002) -> 7;
get_sprite_type(112003) -> 8;
get_sprite_type(112004) -> 9;
get_sprite_type(113001) -> 10;
get_sprite_type(113002) -> 11;
get_sprite_type(113003) -> 12;
get_sprite_type(113004) -> 13;
get_sprite_type(113005) -> 14;
get_sprite_type(113006) -> 15;
get_sprite_type(113007) -> 16;
get_sprite_type(113008) -> 17;
get_sprite_type(113009) -> 18;
get_sprite_type(113010) -> 19;
get_sprite_type(113011) -> 20;
get_sprite_type(111101) -> 1;
get_sprite_type(111102) -> 2;
get_sprite_type(111103) -> 3;
get_sprite_type(111104) -> 4;
get_sprite_type(111105) -> 5;
get_sprite_type(112101) -> 6;
get_sprite_type(112102) -> 7;
get_sprite_type(112103) -> 8;
get_sprite_type(112104) -> 9;
get_sprite_type(113101) -> 10;
get_sprite_type(113102) -> 11;
get_sprite_type(113103) -> 12;
get_sprite_type(113104) -> 13;
get_sprite_type(113105) -> 14;
get_sprite_type(113106) -> 15;
get_sprite_type(113107) -> 16;
get_sprite_type(113108) -> 17;
get_sprite_type(113109) -> 18;
get_sprite_type(113110) -> 19;
get_sprite_type(113111) -> 20;
get_sprite_type(111201) -> 1;
get_sprite_type(111202) -> 2;
get_sprite_type(111203) -> 3;
get_sprite_type(111204) -> 4;
get_sprite_type(111205) -> 5;
get_sprite_type(112201) -> 6;
get_sprite_type(112202) -> 7;
get_sprite_type(112203) -> 8;
get_sprite_type(112204) -> 9;
get_sprite_type(113201) -> 10;
get_sprite_type(113202) -> 11;
get_sprite_type(113203) -> 12;
get_sprite_type(113204) -> 13;
get_sprite_type(113205) -> 14;
get_sprite_type(113206) -> 15;
get_sprite_type(113207) -> 16;
get_sprite_type(113208) -> 17;
get_sprite_type(113209) -> 18;
get_sprite_type(113210) -> 19;
get_sprite_type(113211) -> 20;
get_sprite_type(111301) -> 1;
get_sprite_type(111302) -> 2;
get_sprite_type(111303) -> 3;
get_sprite_type(111304) -> 4;
get_sprite_type(111305) -> 5;
get_sprite_type(112301) -> 6;
get_sprite_type(112302) -> 7;
get_sprite_type(112303) -> 8;
get_sprite_type(112304) -> 9;
get_sprite_type(113301) -> 10;
get_sprite_type(113302) -> 11;
get_sprite_type(113303) -> 12;
get_sprite_type(113304) -> 13;
get_sprite_type(113305) -> 14;
get_sprite_type(113306) -> 15;
get_sprite_type(113307) -> 16;
get_sprite_type(113308) -> 17;
get_sprite_type(113309) -> 18;
get_sprite_type(113310) -> 19;
get_sprite_type(113311) -> 20;
get_sprite_type(111401) -> 1;
get_sprite_type(111402) -> 2;
get_sprite_type(111403) -> 3;
get_sprite_type(111404) -> 4;
get_sprite_type(111405) -> 5;
get_sprite_type(112401) -> 6;
get_sprite_type(112402) -> 7;
get_sprite_type(112403) -> 8;
get_sprite_type(112404) -> 9;
get_sprite_type(113401) -> 10;
get_sprite_type(113402) -> 11;
get_sprite_type(113403) -> 12;
get_sprite_type(113404) -> 13;
get_sprite_type(113405) -> 14;
get_sprite_type(113406) -> 15;
get_sprite_type(113407) -> 16;
get_sprite_type(113408) -> 17;
get_sprite_type(113409) -> 18;
get_sprite_type(113410) -> 19;
get_sprite_type(113411) -> 20;
get_sprite_type(113012) -> 21;
get_sprite_type(113112) -> 21;
get_sprite_type(113212) -> 21;
get_sprite_type(113312) -> 21;
get_sprite_type(113412) -> 21;
get_sprite_type(114001) -> 23;
get_sprite_type(114101) -> 23;
get_sprite_type(114201) -> 23;
get_sprite_type(114301) -> 23;
get_sprite_type(114401) -> 23;
get_sprite_type(_) -> undefined.

get_sprite_power(111001) -> 50;
get_sprite_power(111002) -> 50;
get_sprite_power(111003) -> 75;
get_sprite_power(111004) -> 75;
get_sprite_power(111005) -> 50;
get_sprite_power(112001) -> 150;
get_sprite_power(112002) -> 150;
get_sprite_power(112003) -> 150;
get_sprite_power(112004) -> 150;
get_sprite_power(113001) -> 475;
get_sprite_power(113002) -> 500;
get_sprite_power(113003) -> 475;
get_sprite_power(113004) -> 500;
get_sprite_power(113005) -> 500;
get_sprite_power(113006) -> 500;
get_sprite_power(113007) -> 500;
get_sprite_power(113008) -> 500;
get_sprite_power(113009) -> 500;
get_sprite_power(113010) -> 500;
get_sprite_power(113011) -> 500;
get_sprite_power(111101) -> 100;
get_sprite_power(111102) -> 100;
get_sprite_power(111103) -> 150;
get_sprite_power(111104) -> 150;
get_sprite_power(111105) -> 100;
get_sprite_power(112101) -> 300;
get_sprite_power(112102) -> 300;
get_sprite_power(112103) -> 300;
get_sprite_power(112104) -> 300;
get_sprite_power(113101) -> 950;
get_sprite_power(113102) -> 1000;
get_sprite_power(113103) -> 950;
get_sprite_power(113104) -> 1000;
get_sprite_power(113105) -> 1000;
get_sprite_power(113106) -> 1000;
get_sprite_power(113107) -> 1000;
get_sprite_power(113108) -> 1000;
get_sprite_power(113109) -> 1000;
get_sprite_power(113110) -> 1000;
get_sprite_power(113111) -> 1000;
get_sprite_power(111201) -> 200;
get_sprite_power(111202) -> 200;
get_sprite_power(111203) -> 300;
get_sprite_power(111204) -> 300;
get_sprite_power(111205) -> 200;
get_sprite_power(112201) -> 600;
get_sprite_power(112202) -> 600;
get_sprite_power(112203) -> 600;
get_sprite_power(112204) -> 600;
get_sprite_power(113201) -> 1900;
get_sprite_power(113202) -> 2000;
get_sprite_power(113203) -> 1900;
get_sprite_power(113204) -> 2000;
get_sprite_power(113205) -> 2000;
get_sprite_power(113206) -> 2000;
get_sprite_power(113207) -> 2000;
get_sprite_power(113208) -> 2000;
get_sprite_power(113209) -> 2000;
get_sprite_power(113210) -> 2000;
get_sprite_power(113211) -> 2000;
get_sprite_power(111301) -> 350;
get_sprite_power(111302) -> 350;
get_sprite_power(111303) -> 525;
get_sprite_power(111304) -> 525;
get_sprite_power(111305) -> 350;
get_sprite_power(112301) -> 1050;
get_sprite_power(112302) -> 1050;
get_sprite_power(112303) -> 1050;
get_sprite_power(112304) -> 1050;
get_sprite_power(113301) -> 3325;
get_sprite_power(113302) -> 3500;
get_sprite_power(113303) -> 3325;
get_sprite_power(113304) -> 3500;
get_sprite_power(113305) -> 3500;
get_sprite_power(113306) -> 3500;
get_sprite_power(113307) -> 3500;
get_sprite_power(113308) -> 3500;
get_sprite_power(113309) -> 3500;
get_sprite_power(113310) -> 3500;
get_sprite_power(113311) -> 3500;
get_sprite_power(111401) -> 550;
get_sprite_power(111402) -> 550;
get_sprite_power(111403) -> 825;
get_sprite_power(111404) -> 825;
get_sprite_power(111405) -> 550;
get_sprite_power(112401) -> 1650;
get_sprite_power(112402) -> 1650;
get_sprite_power(112403) -> 1650;
get_sprite_power(112404) -> 1650;
get_sprite_power(113401) -> 5225;
get_sprite_power(113402) -> 5500;
get_sprite_power(113403) -> 5225;
get_sprite_power(113404) -> 5500;
get_sprite_power(113405) -> 5500;
get_sprite_power(113406) -> 5500;
get_sprite_power(113407) -> 5500;
get_sprite_power(113408) -> 5500;
get_sprite_power(113409) -> 5500;
get_sprite_power(113410) -> 5500;
get_sprite_power(113411) -> 5500;
get_sprite_power(113012) -> 500;
get_sprite_power(113112) -> 1000;
get_sprite_power(113212) -> 2000;
get_sprite_power(113312) -> 3500;
get_sprite_power(113412) -> 5500;
get_sprite_power(114001) -> 2500;
get_sprite_power(114101) -> 5000;
get_sprite_power(114201) -> 10000;
get_sprite_power(114301) -> 18000;
get_sprite_power(114401) -> 30000;
get_sprite_power(_) -> 0.

get_sprite_holiday_decompound({17422, 113104}) ->
    [{39067, 1}, {10040, 10}, {113004, 1}];
get_sprite_holiday_decompound({17422, 113204}) ->
    [{39067, 3}, {10040, 50}, {113004, 1}];
get_sprite_holiday_decompound({17422, 113304}) ->
    [{39067, 6}, {10040, 170}, {113004, 1}];
get_sprite_holiday_decompound({17422, 113404}) ->
    [{39067, 10}, {10040, 410}, {113004, 1}];
get_sprite_holiday_decompound({17422, 113107}) ->
    [{39067, 1}, {10040, 10}, {113007, 1}];
get_sprite_holiday_decompound({17422, 113207}) ->
    [{39067, 3}, {10040, 50}, {113007, 1}];
get_sprite_holiday_decompound({17422, 113307}) ->
    [{39067, 6}, {10040, 170}, {113007, 1}];
get_sprite_holiday_decompound({17422, 113407}) ->
    [{39067, 10}, {10040, 410}, {113007, 1}];
get_sprite_holiday_decompound(_) -> undefined.

get_sprite_compound_info(111001) ->
    {[{111001, 1}, {10040, 10}], 111101};
get_sprite_compound_info(111002) ->
    {[{111002, 1}, {10040, 10}], 111102};
get_sprite_compound_info(111003) ->
    {[{111003, 1}, {10040, 10}], 111103};
get_sprite_compound_info(111004) ->
    {[{111004, 1}, {10040, 10}], 111104};
get_sprite_compound_info(111005) ->
    {[{111005, 1}, {10040, 10}], 111105};
get_sprite_compound_info(112001) ->
    {[{112001, 1}, {10040, 10}], 112101};
get_sprite_compound_info(112002) ->
    {[{112002, 1}, {10040, 10}], 112102};
get_sprite_compound_info(112003) ->
    {[{112003, 1}, {10040, 10}], 112103};
get_sprite_compound_info(112004) ->
    {[{112004, 1}, {10040, 10}], 112104};
get_sprite_compound_info(113001) ->
    {[{113001, 1}, {10040, 10}], 113101};
get_sprite_compound_info(113002) ->
    {[{113002, 1}, {10040, 10}], 113102};
get_sprite_compound_info(113003) ->
    {[{113003, 1}, {10040, 10}], 113103};
get_sprite_compound_info(113004) ->
    {[{113004, 1}, {10040, 10}], 113104};
get_sprite_compound_info(113005) ->
    {[{113005, 1}, {10040, 10}], 113105};
get_sprite_compound_info(113006) ->
    {[{113006, 1}, {10040, 10}], 113106};
get_sprite_compound_info(113007) ->
    {[{113007, 1}, {10040, 10}], 113107};
get_sprite_compound_info(113008) ->
    {[{113008, 1}, {10040, 10}], 113108};
get_sprite_compound_info(113009) ->
    {[{113009, 1}, {10040, 10}], 113109};
get_sprite_compound_info(113010) ->
    {[{113010, 1}, {10040, 10}], 113110};
get_sprite_compound_info(113011) ->
    {[{113011, 1}, {10040, 10}], 113111};
get_sprite_compound_info(111101) ->
    {[{111001, 2}, {10040, 40}], 111201};
get_sprite_compound_info(111102) ->
    {[{111002, 2}, {10040, 40}], 111202};
get_sprite_compound_info(111103) ->
    {[{111003, 2}, {10040, 40}], 111203};
get_sprite_compound_info(111104) ->
    {[{111004, 2}, {10040, 40}], 111204};
get_sprite_compound_info(111105) ->
    {[{111005, 2}, {10040, 40}], 111205};
get_sprite_compound_info(112101) ->
    {[{112001, 2}, {10040, 40}], 112201};
get_sprite_compound_info(112102) ->
    {[{112002, 2}, {10040, 40}], 112202};
get_sprite_compound_info(112103) ->
    {[{112003, 2}, {10040, 40}], 112203};
get_sprite_compound_info(112104) ->
    {[{112004, 2}, {10040, 40}], 112204};
get_sprite_compound_info(113101) ->
    {[{113001, 2}, {10040, 40}], 113201};
get_sprite_compound_info(113102) ->
    {[{113002, 2}, {10040, 40}], 113202};
get_sprite_compound_info(113103) ->
    {[{113003, 2}, {10040, 40}], 113203};
get_sprite_compound_info(113104) ->
    {[{113004, 2}, {10040, 40}], 113204};
get_sprite_compound_info(113105) ->
    {[{113005, 2}, {10040, 40}], 113205};
get_sprite_compound_info(113106) ->
    {[{113006, 2}, {10040, 40}], 113206};
get_sprite_compound_info(113107) ->
    {[{113007, 2}, {10040, 40}], 113207};
get_sprite_compound_info(113108) ->
    {[{113008, 2}, {10040, 40}], 113208};
get_sprite_compound_info(113109) ->
    {[{113009, 2}, {10040, 40}], 113209};
get_sprite_compound_info(113110) ->
    {[{113010, 2}, {10040, 40}], 113210};
get_sprite_compound_info(113111) ->
    {[{113011, 2}, {10040, 40}], 113211};
get_sprite_compound_info(111201) ->
    {[{111001, 3}, {10040, 120}], 111301};
get_sprite_compound_info(111202) ->
    {[{111002, 3}, {10040, 120}], 111302};
get_sprite_compound_info(111203) ->
    {[{111003, 3}, {10040, 120}], 111303};
get_sprite_compound_info(111204) ->
    {[{111004, 3}, {10040, 120}], 111304};
get_sprite_compound_info(111205) ->
    {[{111005, 3}, {10040, 120}], 111305};
get_sprite_compound_info(112201) ->
    {[{112001, 3}, {10040, 120}], 112301};
get_sprite_compound_info(112202) ->
    {[{112002, 3}, {10040, 120}], 112302};
get_sprite_compound_info(112203) ->
    {[{112003, 3}, {10040, 120}], 112303};
get_sprite_compound_info(112204) ->
    {[{112004, 3}, {10040, 120}], 112304};
get_sprite_compound_info(113201) ->
    {[{113001, 3}, {10040, 120}], 113301};
get_sprite_compound_info(113202) ->
    {[{113002, 3}, {10040, 120}], 113302};
get_sprite_compound_info(113203) ->
    {[{113003, 3}, {10040, 120}], 113303};
get_sprite_compound_info(113204) ->
    {[{113004, 3}, {10040, 120}], 113304};
get_sprite_compound_info(113205) ->
    {[{113005, 3}, {10040, 120}], 113305};
get_sprite_compound_info(113206) ->
    {[{113006, 3}, {10040, 120}], 113306};
get_sprite_compound_info(113207) ->
    {[{113007, 3}, {10040, 120}], 113307};
get_sprite_compound_info(113208) ->
    {[{113008, 3}, {10040, 120}], 113308};
get_sprite_compound_info(113209) ->
    {[{113009, 3}, {10040, 120}], 113309};
get_sprite_compound_info(113210) ->
    {[{113010, 3}, {10040, 120}], 113310};
get_sprite_compound_info(113211) ->
    {[{113011, 3}, {10040, 120}], 113311};
get_sprite_compound_info(111301) ->
    {[{111001, 4}, {10040, 240}], 111401};
get_sprite_compound_info(111302) ->
    {[{111002, 4}, {10040, 240}], 111402};
get_sprite_compound_info(111303) ->
    {[{111003, 4}, {10040, 240}], 111403};
get_sprite_compound_info(111304) ->
    {[{111004, 4}, {10040, 240}], 111404};
get_sprite_compound_info(111305) ->
    {[{111005, 4}, {10040, 240}], 111405};
get_sprite_compound_info(112301) ->
    {[{112001, 4}, {10040, 240}], 112401};
get_sprite_compound_info(112302) ->
    {[{112002, 4}, {10040, 240}], 112402};
get_sprite_compound_info(112303) ->
    {[{112003, 4}, {10040, 240}], 112403};
get_sprite_compound_info(112304) ->
    {[{112004, 4}, {10040, 240}], 112404};
get_sprite_compound_info(113301) ->
    {[{113001, 4}, {10040, 240}], 113401};
get_sprite_compound_info(113302) ->
    {[{113002, 4}, {10040, 240}], 113402};
get_sprite_compound_info(113303) ->
    {[{113003, 4}, {10040, 240}], 113403};
get_sprite_compound_info(113304) ->
    {[{113004, 4}, {10040, 240}], 113404};
get_sprite_compound_info(113305) ->
    {[{113005, 4}, {10040, 240}], 113405};
get_sprite_compound_info(113306) ->
    {[{113006, 4}, {10040, 240}], 113406};
get_sprite_compound_info(113307) ->
    {[{113007, 4}, {10040, 240}], 113407};
get_sprite_compound_info(113308) ->
    {[{113008, 4}, {10040, 240}], 113408};
get_sprite_compound_info(113309) ->
    {[{113009, 4}, {10040, 240}], 113409};
get_sprite_compound_info(113310) ->
    {[{113010, 4}, {10040, 240}], 113410};
get_sprite_compound_info(113311) ->
    {[{113011, 4}, {10040, 240}], 113411};
get_sprite_compound_info(10601) ->
    {[{10601, 2}, {1, 100000}], 10602};
get_sprite_compound_info(113012) ->
    {[{113012, 1}, {10040, 10}], 113112};
get_sprite_compound_info(113112) ->
    {[{113012, 2}, {10040, 40}], 113212};
get_sprite_compound_info(113212) ->
    {[{113012, 3}, {10040, 120}], 113312};
get_sprite_compound_info(113312) ->
    {[{113012, 4}, {10040, 240}], 113412};
get_sprite_compound_info(114001) ->
    {[{114001, 5}, {10040, 200}], 114101};
get_sprite_compound_info(114101) ->
    {[{114001, 10}, {10040, 440}], 114201};
get_sprite_compound_info(114201) ->
    {[{114001, 15}, {10040, 1120}], 114301};
get_sprite_compound_info(114301) ->
    {[{114001, 20}, {10040, 2240}], 114401};
get_sprite_compound_info(_) -> undefined.

get_all_sprites_plan() ->
    [{11, lang:get(<<"方案11"/utf8>>), 0},
     {10, lang:get(<<"方案10"/utf8>>), 0},
     {9, lang:get(<<"方案9"/utf8>>), 0},
     {8, lang:get(<<"方案8"/utf8>>), 0},
     {7, lang:get(<<"方案7"/utf8>>), 0},
     {6, lang:get(<<"方案6"/utf8>>), 0},
     {5, lang:get(<<"方案5"/utf8>>), 0},
     {4, lang:get(<<"方案4"/utf8>>), 0},
     {3, lang:get(<<"方案3"/utf8>>), 1},
     {2, lang:get(<<"方案2"/utf8>>), 1},
     {1, lang:get(<<"方案1"/utf8>>), 1}].

get_sprite_plan(1) -> {lang:get(<<"方案1"/utf8>>), []};
get_sprite_plan(2) -> {lang:get(<<"方案2"/utf8>>), []};
get_sprite_plan(3) -> {lang:get(<<"方案3"/utf8>>), []};
get_sprite_plan(4) ->
    {lang:get(<<"方案4"/utf8>>), [{3, 300}]};
get_sprite_plan(5) ->
    {lang:get(<<"方案5"/utf8>>), [{3, 400}]};
get_sprite_plan(6) ->
    {lang:get(<<"方案6"/utf8>>), [{3, 500}]};
get_sprite_plan(7) ->
    {lang:get(<<"方案7"/utf8>>), [{3, 600}]};
get_sprite_plan(8) ->
    {lang:get(<<"方案8"/utf8>>), [{3, 700}]};
get_sprite_plan(9) ->
    {lang:get(<<"方案9"/utf8>>), [{3, 800}]};
get_sprite_plan(10) ->
    {lang:get(<<"方案10"/utf8>>), [{3, 800}]};
get_sprite_plan(11) ->
    {lang:get(<<"方案11"/utf8>>), [{3, 800}]};
get_sprite_plan(_Info) ->
    logger:data_error("get_sprite_plan_data_not_exist===>~w",
		      [_Info], sprite_data, 1224),
    undefined.

get_sprite_type_team(95) -> 3;
get_sprite_type_team(19) -> 3;
get_sprite_type_team(20) -> 3;
get_sprite_type_team(97) -> 2;
get_sprite_type_team(99) -> 2;
get_sprite_type_team(_) -> undefined.


