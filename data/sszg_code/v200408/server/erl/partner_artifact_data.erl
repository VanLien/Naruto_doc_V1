-file("src/mod/data/partner_artifact_data.erl", 1).

-module(partner_artifact_data).

-lager_records([{group_attr, [atk, hp_max, def, speed]},
		{partner_base_p,
		 [partner_id, bid, lev, star, star_step, quality,
		  break_lev, power, skills, add_star, is_lock, use_skin,
		  end_time, resonate_lev, resonate_break_lev]},
		{partner_lev_data,
		 [add_hp, add_atk, add_def, add_speed]},
		{partner_base_data,
		 [bid, name, type, rare_type, init_star, show_star,
		  init_lev, pos_type, camp_type, break_lev, recruit_type,
		  skills, addition_skill, addition_skill2, skill_order,
		  ai, awake_items, awake_attr, awake_skill, init_power,
		  add_power, leader_skill, chips_num, chips_id,
		  hidden_skills, init_star5_num, hook_skills,
		  compose_expend, can_use_direct_item, awaken_info,
		  break_id, other_skills, item_id]},
		{partner_comment_p,
		 [comment_id, name, msg, like_num, no_like_num,
		  is_like]},
		{partner_comment,
		 [comment_id, partner_id, account, rid, sid, name,
		  post_time, msg, like_num, no_like_num]},
		{partner_bag,
		 [ver, type, num, buy_num, partner_list, partner_had,
		  comment_likes, partner_field, partner_star_lev,
		  max_star, partner_decomposes, partner_skins]},
		{partner_field, [lev, fields]},
		{partner_gemstone, [ver, type, gemstones]},
		{gemstone, [ver, pos, bid]},
		{partner_skin, [ver, id, end_time, ext]},
		{partner,
		 [ver, id, bid, type, career, is_lock, pos_type,
		  camp_type, rare_type, lev, quality, exp, name, star,
		  star_step, step_attr, break_lev, break_attr, power,
		  base_attr, group_attr, all_attr, skills, break_skills,
		  set_skills, eqm, hidden_skills, artifacts, fetter,
		  fetter_attr, fetter_power, score_lists, gemstones,
		  awaken_count, awaken_skills, add_star, dower_skill,
		  holy_eqm, use_skin, end_time, resonate_lev,
		  resonate_break_lev]},
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]}]).

-export([get_info/1, get_com_limit_lev/1,
	 get_attr_val/1, get_decompound_award/1,
	 get_skill_rand_info1/1, get_skill_rand_info2/1,
	 get_skill_rand_info3/1, get_skill_rand_info4/1,
	 get_attr_rand_info1/1, get_attr_rand_info2/1,
	 get_attr_rand_info3/1, get_skill_rands/1,
	 get_attr_rands/1, get_compound_need_num/1,
	 get_compound_need_id/1, get_compound_need_info/1,
	 get_compound_other_expend/1, get_constant/1]).

-file("inc/partner.hrl", 1).

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

-file("inc/partner.hrl", 11).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("inc/partner.hrl", 12).

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

-file("inc/partner.hrl", 13).

-record(partner,
	{ver = 7  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(), career = 0,
	 is_lock = []  :: list(),
	 pos_type = 0  :: non_neg_integer(),
	 camp_type = 0  :: non_neg_integer(),
	 rare_type = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 quality = 0  :: non_neg_integer(),
	 exp = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 star = 1  :: non_neg_integer(),
	 star_step = 0  :: non_neg_integer(), step_attr = [],
	 break_lev = 0  :: non_neg_integer(),
	 break_attr = []  :: list(),
	 power = 0  :: non_neg_integer(), base_attr  :: #attr{},
	 group_attr = [], all_attr  :: #attr{},
	 skills = []  :: [non_neg_integer()],
	 break_skills = []  ::
	     [{non_neg_integer(), non_neg_integer()}],
	 set_skills = []  :: [non_neg_integer()], eqm = [],
	 hidden_skills = [], artifacts = [], fetter = [],
	 fetter_attr = [], fetter_power = 0, score_lists = [],
	 gemstones = [], awaken_count = 0, awaken_skills = [],
	 add_star = 0, dower_skill = [], holy_eqm = [],
	 use_skin = 0, end_time = 0, resonate_lev = 0,
	 resonate_break_lev = 0}).

-record(partner_skin,
	{ver = 1, id = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 ext = []  :: list()}).

-record(gemstone,
	{ver = 1, pos = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer()}).

-record(partner_gemstone,
	{ver = 1, type = 0  :: non_neg_integer(),
	 gemstones = []  :: [#gemstone{}]}).

-record(partner_field,
	{lev = 1  :: non_neg_integer(),
	 fields = []  ::
	     [{non_neg_integer(), non_neg_integer()}]}).

-record(partner_bag,
	{ver = -1  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 buy_num = 0  :: non_neg_integer(),
	 partner_list = []  :: [#partner{}],
	 partner_had = []  ::
	     [{non_neg_integer(), non_neg_integer(),
	       non_neg_integer()}],
	 comment_likes = []  ::
	     [{non_neg_integer(), non_neg_integer()}],
	 partner_field = []  :: #partner_field{},
	 partner_star_lev = 0  :: non_neg_integer(),
	 max_star = 0  :: non_neg_integer(),
	 partner_decomposes = []  :: non_neg_integer(),
	 partner_skins = []  :: list()}).

-record(partner_comment,
	{comment_id = 0, partner_id = 0, account = <<>>,
	 rid = 0, sid = <<>>, name = <<>>, post_time = 0,
	 msg = <<>>, like_num = 0, no_like_num = 0}).

-record(partner_comment_p,
	{comment_id = 0, name = <<>>, msg = <<>>, like_num = 0,
	 no_like_num = 0, is_like = 0}).

-record(partner_base_data,
	{bid, name, type, rare_type, init_star = 0,
	 show_star = 0, init_lev = 1, pos_type = 0,
	 camp_type = 0, break_lev = 0, recruit_type = 0,
	 skills = [], addition_skill = 0, addition_skill2 = 0,
	 skill_order = [], ai = 0, awake_items = [],
	 awake_attr = [], awake_skill = none, init_power = 0,
	 add_power = 0, leader_skill = 0, chips_num = 0,
	 chips_id = 0, hidden_skills = [], init_star5_num = 0,
	 hook_skills = [], compose_expend = [],
	 can_use_direct_item = 0, awaken_info = [], break_id = 0,
	 other_skills = [], item_id = 0}).

-record(partner_lev_data,
	{add_hp = 1000, add_atk = 1000, add_def = 1000,
	 add_speed = 1000}).

-record(partner_base_p,
	{partner_id, bid, lev, star, star_step, quality,
	 break_lev, power, skills, add_star, is_lock,
	 use_skin = 0, end_time = 0, resonate_lev = 0,
	 resonate_break_lev = 0}).

-record(group_attr,
	{atk = 0, hp_max = 0, def = 0, speed = 0}).

-file("src/mod/data/partner_artifact_data.erl", 27).

-file("inc/common.hrl", 1).

-file("src/mod/data/partner_artifact_data.erl", 28).

-file("inc/attr.hrl", 1).

-file("src/mod/data/partner_artifact_data.erl", 29).

get_info(10451) ->
    {[{10450, 30}, {1, 20000}], val_not_exist,
     val_not_exist};
get_info(10452) ->
    {[{10450, 60}, {1, 100000}], val_not_exist,
     val_not_exist};
get_info(10453) ->
    {[{10450, 300}, {1, 250000}], 50, val_not_exist};
get_info(10454) ->
    {[{10450, 1500}, {1, 750000}], 50, val_not_exist};
get_info(10455) ->
    {[{10450, 3750}, {1, 1500000}], 50, val_not_exist};
get_info(10456) ->
    {[{10450, 17500}, {1, 2000000}], 40, val_not_exist};
get_info(10457) ->
    {[{10450, 30000}, {1, 2500000}], 40, val_not_exist};
get_info(10458) ->
    {[{10450, 30000}, {1, 2500000}], 50, val_not_exist};
get_info(10459) ->
    {[{10450, 30000}, {1, 3500000}], 50, val_not_exist};
get_info(951275) ->
    {[{10450, 100000}, {1, 4500000}], 50, val_not_exist};
get_info(951276) ->
    {[{10450, 200000}, {1, 5500000}], 50, val_not_exist};
get_info(951277) ->
    {[{10450, 400000}, {1, 5500000}], 50, val_not_exist};
get_info(951278) ->
    {[{10450, 600000}, {1, 5500000}], 50, val_not_exist};
get_info(951279) ->
    {[{10450, 800000}, {1, 5500000}], 50, val_not_exist};
get_info(951280) ->
    {[{10450, 1000000}, {1, 5500000}], 50, val_not_exist};
get_info(951281) ->
    {[{10450, 1000000}, {1, 5500000}], 50, val_not_exist};
get_info(951282) ->
    {[{10450, 1000000}, {1, 5500000}], 50, val_not_exist};
get_info(951283) ->
    {[{10450, 1000000}, {1, 5500000}], 50, val_not_exist};
get_info(951284) ->
    {[{10450, 1000000}, {1, 5500000}], 50, val_not_exist};
get_info(951285) ->
    {[{10450, 1000000}, {1, 5500000}], 50, val_not_exist};
get_info(951286) ->
    {[{10450, 1000000}, {1, 5500000}], 50, val_not_exist};
get_info(_) -> undefined.

get_com_limit_lev(10451) -> 0;
get_com_limit_lev(10452) -> 30;
get_com_limit_lev(10453) -> 40;
get_com_limit_lev(10454) -> 50;
get_com_limit_lev(10455) -> 60;
get_com_limit_lev(10456) -> 100;
get_com_limit_lev(10457) -> 100;
get_com_limit_lev(10458) -> 100;
get_com_limit_lev(10459) -> 100;
get_com_limit_lev(951275) -> 100;
get_com_limit_lev(951276) -> 100;
get_com_limit_lev(951277) -> 100;
get_com_limit_lev(951278) -> 100;
get_com_limit_lev(951279) -> 100;
get_com_limit_lev(951280) -> 100;
get_com_limit_lev(951281) -> 100;
get_com_limit_lev(951282) -> 100;
get_com_limit_lev(951283) -> 100;
get_com_limit_lev(951284) -> 100;
get_com_limit_lev(951285) -> 100;
get_com_limit_lev(951286) -> 100;
get_com_limit_lev(_Info) ->
    logger:data_error("get_com_limit_lev_data_not_exist===>~w",
		      [_Info], partner_artifact_data, 74),
    undefined.

get_attr_val({10451, atk}) -> 146;
get_attr_val({10452, atk}) -> 293;
get_attr_val({10453, atk}) -> 587;
get_attr_val({10454, atk}) -> 10000;
get_attr_val({10455, atk}) -> 20000;
get_attr_val({10456, atk}) -> 40000;
get_attr_val({10457, atk}) -> 60000;
get_attr_val({10458, atk}) -> 80000;
get_attr_val({10459, atk}) -> 100000;
get_attr_val({951275, atk}) -> 200000;
get_attr_val({951276, atk}) -> 400000;
get_attr_val({951277, atk}) -> 600000;
get_attr_val({951278, atk}) -> 800000;
get_attr_val({951279, atk}) -> 1000000;
get_attr_val({951280, atk}) -> 2000000;
get_attr_val({951281, atk}) -> 3000000;
get_attr_val({951282, atk}) -> 4000000;
get_attr_val({951283, atk}) -> 5000000;
get_attr_val({951284, atk}) -> 6000000;
get_attr_val({951285, atk}) -> 7000000;
get_attr_val({951286, atk}) -> 8000000;
get_attr_val({10451, hp_max}) -> 1476;
get_attr_val({10452, hp_max}) -> 2953;
get_attr_val({10453, hp_max}) -> 5907;
get_attr_val({10454, hp_max}) -> 10000;
get_attr_val({10455, hp_max}) -> 20000;
get_attr_val({10456, hp_max}) -> 40000;
get_attr_val({10457, hp_max}) -> 60000;
get_attr_val({10458, hp_max}) -> 80000;
get_attr_val({10459, hp_max}) -> 100000;
get_attr_val({951275, hp_max}) -> 200000;
get_attr_val({951276, hp_max}) -> 400000;
get_attr_val({951277, hp_max}) -> 600000;
get_attr_val({951278, hp_max}) -> 800000;
get_attr_val({951279, hp_max}) -> 1000000;
get_attr_val({951280, hp_max}) -> 2000000;
get_attr_val({951281, hp_max}) -> 3000000;
get_attr_val({951282, hp_max}) -> 4000000;
get_attr_val({951283, hp_max}) -> 5000000;
get_attr_val({951284, hp_max}) -> 6000000;
get_attr_val({951285, hp_max}) -> 7000000;
get_attr_val({951286, hp_max}) -> 8000000;
get_attr_val({10451, def}) -> 21;
get_attr_val({10452, def}) -> 43;
get_attr_val({10453, def}) -> 87;
get_attr_val({10454, def}) -> 175;
get_attr_val({10455, def}) -> 351;
get_attr_val({10456, def}) -> 351;
get_attr_val({10457, def}) -> 451;
get_attr_val({10458, def}) -> 551;
get_attr_val({10459, def}) -> 651;
get_attr_val({951275, def}) -> 5000;
get_attr_val({951276, def}) -> 10000;
get_attr_val({951277, def}) -> 40000;
get_attr_val({951278, def}) -> 60000;
get_attr_val({951279, def}) -> 80000;
get_attr_val({951280, def}) -> 100000;
get_attr_val({951281, def}) -> 200000;
get_attr_val({951282, def}) -> 300000;
get_attr_val({951283, def}) -> 400000;
get_attr_val({951284, def}) -> 500000;
get_attr_val({951285, def}) -> 600000;
get_attr_val({951286, def}) -> 700000;
get_attr_val({10451, speed}) -> 10;
get_attr_val({10452, speed}) -> 20;
get_attr_val({10453, speed}) -> 30;
get_attr_val({10454, speed}) -> 40;
get_attr_val({10455, speed}) -> 50;
get_attr_val({10456, speed}) -> 50;
get_attr_val({10457, speed}) -> 60;
get_attr_val({10458, speed}) -> 70;
get_attr_val({10459, speed}) -> 80;
get_attr_val({951275, speed}) -> 90;
get_attr_val({951276, speed}) -> 100;
get_attr_val({951277, speed}) -> 110;
get_attr_val({951278, speed}) -> 120;
get_attr_val({951279, speed}) -> 130;
get_attr_val({951280, speed}) -> 140;
get_attr_val({951281, speed}) -> 150;
get_attr_val({951282, speed}) -> 160;
get_attr_val({951283, speed}) -> 170;
get_attr_val({951284, speed}) -> 180;
get_attr_val({951285, speed}) -> 200;
get_attr_val({951286, speed}) -> 220;
get_attr_val({10451, crit_rate}) -> 10;
get_attr_val({10452, crit_rate}) -> 20;
get_attr_val({10453, crit_rate}) -> 30;
get_attr_val({10454, crit_rate}) -> 40;
get_attr_val({10455, crit_rate}) -> 50;
get_attr_val({10456, crit_rate}) -> 50;
get_attr_val({10457, crit_rate}) -> 60;
get_attr_val({10458, crit_rate}) -> 70;
get_attr_val({10459, crit_rate}) -> 80;
get_attr_val({951275, crit_rate}) -> 90;
get_attr_val({951276, crit_rate}) -> 100;
get_attr_val({951277, crit_rate}) -> 110;
get_attr_val({951278, crit_rate}) -> 120;
get_attr_val({951279, crit_rate}) -> 130;
get_attr_val({951280, crit_rate}) -> 140;
get_attr_val({951281, crit_rate}) -> 150;
get_attr_val({951282, crit_rate}) -> 160;
get_attr_val({951283, crit_rate}) -> 170;
get_attr_val({951284, crit_rate}) -> 180;
get_attr_val({951285, crit_rate}) -> 200;
get_attr_val({951286, crit_rate}) -> 220;
get_attr_val({10451, crit_ratio}) -> 20;
get_attr_val({10452, crit_ratio}) -> 40;
get_attr_val({10453, crit_ratio}) -> 60;
get_attr_val({10454, crit_ratio}) -> 80;
get_attr_val({10455, crit_ratio}) -> 100;
get_attr_val({10456, crit_ratio}) -> 100;
get_attr_val({10457, crit_ratio}) -> 110;
get_attr_val({10458, crit_ratio}) -> 120;
get_attr_val({10459, crit_ratio}) -> 130;
get_attr_val({951275, crit_ratio}) -> 140;
get_attr_val({951276, crit_ratio}) -> 150;
get_attr_val({951277, crit_ratio}) -> 160;
get_attr_val({951278, crit_ratio}) -> 170;
get_attr_val({951279, crit_ratio}) -> 180;
get_attr_val({951280, crit_ratio}) -> 190;
get_attr_val({951281, crit_ratio}) -> 200;
get_attr_val({951282, crit_ratio}) -> 210;
get_attr_val({951283, crit_ratio}) -> 220;
get_attr_val({951284, crit_ratio}) -> 230;
get_attr_val({951285, crit_ratio}) -> 250;
get_attr_val({951286, crit_ratio}) -> 270;
get_attr_val({10451, atk_per}) -> 5;
get_attr_val({10452, atk_per}) -> 10;
get_attr_val({10453, atk_per}) -> 15;
get_attr_val({10454, atk_per}) -> 20;
get_attr_val({10455, atk_per}) -> 30;
get_attr_val({10456, atk_per}) -> 30;
get_attr_val({10457, atk_per}) -> 40;
get_attr_val({10458, atk_per}) -> 50;
get_attr_val({10459, atk_per}) -> 60;
get_attr_val({951275, atk_per}) -> 70;
get_attr_val({951276, atk_per}) -> 80;
get_attr_val({951277, atk_per}) -> 110;
get_attr_val({951278, atk_per}) -> 120;
get_attr_val({951279, atk_per}) -> 130;
get_attr_val({951280, atk_per}) -> 140;
get_attr_val({951281, atk_per}) -> 150;
get_attr_val({951282, atk_per}) -> 160;
get_attr_val({951283, atk_per}) -> 170;
get_attr_val({951284, atk_per}) -> 180;
get_attr_val({951285, atk_per}) -> 200;
get_attr_val({951286, atk_per}) -> 220;
get_attr_val({10451, hp_max_per}) -> 10;
get_attr_val({10452, hp_max_per}) -> 20;
get_attr_val({10453, hp_max_per}) -> 30;
get_attr_val({10454, hp_max_per}) -> 40;
get_attr_val({10455, hp_max_per}) -> 50;
get_attr_val({10456, hp_max_per}) -> 50;
get_attr_val({10457, hp_max_per}) -> 60;
get_attr_val({10458, hp_max_per}) -> 70;
get_attr_val({10459, hp_max_per}) -> 80;
get_attr_val({951275, hp_max_per}) -> 90;
get_attr_val({951276, hp_max_per}) -> 100;
get_attr_val({951277, hp_max_per}) -> 130;
get_attr_val({951278, hp_max_per}) -> 150;
get_attr_val({951279, hp_max_per}) -> 180;
get_attr_val({951280, hp_max_per}) -> 190;
get_attr_val({951281, hp_max_per}) -> 200;
get_attr_val({951282, hp_max_per}) -> 210;
get_attr_val({951283, hp_max_per}) -> 220;
get_attr_val({951284, hp_max_per}) -> 230;
get_attr_val({951285, hp_max_per}) -> 250;
get_attr_val({951286, hp_max_per}) -> 270;
get_attr_val({10451, def_per}) -> 10;
get_attr_val({10452, def_per}) -> 20;
get_attr_val({10453, def_per}) -> 30;
get_attr_val({10454, def_per}) -> 40;
get_attr_val({10455, def_per}) -> 50;
get_attr_val({10456, def_per}) -> 50;
get_attr_val({10457, def_per}) -> 60;
get_attr_val({10458, def_per}) -> 70;
get_attr_val({10459, def_per}) -> 80;
get_attr_val({951275, def_per}) -> 90;
get_attr_val({951276, def_per}) -> 100;
get_attr_val({951277, def_per}) -> 110;
get_attr_val({951278, def_per}) -> 120;
get_attr_val({951279, def_per}) -> 130;
get_attr_val({951280, def_per}) -> 140;
get_attr_val({951281, def_per}) -> 150;
get_attr_val({951282, def_per}) -> 160;
get_attr_val({951283, def_per}) -> 170;
get_attr_val({951284, def_per}) -> 180;
get_attr_val({951285, def_per}) -> 200;
get_attr_val({951286, def_per}) -> 220;
get_attr_val({10451, res}) -> 10;
get_attr_val({10452, res}) -> 20;
get_attr_val({10453, res}) -> 30;
get_attr_val({10454, res}) -> 40;
get_attr_val({10455, res}) -> 50;
get_attr_val({10456, res}) -> 50;
get_attr_val({10457, res}) -> 60;
get_attr_val({10458, res}) -> 70;
get_attr_val({10459, res}) -> 80;
get_attr_val({951275, res}) -> 90;
get_attr_val({951276, res}) -> 100;
get_attr_val({951277, res}) -> 110;
get_attr_val({951278, res}) -> 120;
get_attr_val({951279, res}) -> 130;
get_attr_val({951280, res}) -> 140;
get_attr_val({951281, res}) -> 150;
get_attr_val({951282, res}) -> 160;
get_attr_val({951283, res}) -> 170;
get_attr_val({951284, res}) -> 180;
get_attr_val({951285, res}) -> 200;
get_attr_val({951286, res}) -> 220;
get_attr_val({10451, tenacity}) -> 10;
get_attr_val({10452, tenacity}) -> 20;
get_attr_val({10453, tenacity}) -> 30;
get_attr_val({10454, tenacity}) -> 40;
get_attr_val({10455, tenacity}) -> 50;
get_attr_val({10456, tenacity}) -> 50;
get_attr_val({10457, tenacity}) -> 60;
get_attr_val({10458, tenacity}) -> 70;
get_attr_val({10459, tenacity}) -> 80;
get_attr_val({951275, tenacity}) -> 90;
get_attr_val({951276, tenacity}) -> 100;
get_attr_val({951277, tenacity}) -> 110;
get_attr_val({951278, tenacity}) -> 120;
get_attr_val({951279, tenacity}) -> 130;
get_attr_val({951280, tenacity}) -> 140;
get_attr_val({951281, tenacity}) -> 150;
get_attr_val({951282, tenacity}) -> 160;
get_attr_val({951283, tenacity}) -> 170;
get_attr_val({951284, tenacity}) -> 180;
get_attr_val({951285, tenacity}) -> 200;
get_attr_val({951286, tenacity}) -> 220;
get_attr_val({10451, dam}) -> 10;
get_attr_val({10452, dam}) -> 20;
get_attr_val({10453, dam}) -> 30;
get_attr_val({10454, dam}) -> 40;
get_attr_val({10455, dam}) -> 50;
get_attr_val({10456, dam}) -> 50;
get_attr_val({10457, dam}) -> 60;
get_attr_val({10458, dam}) -> 70;
get_attr_val({10459, dam}) -> 80;
get_attr_val({951275, dam}) -> 90;
get_attr_val({951276, dam}) -> 100;
get_attr_val({951277, dam}) -> 110;
get_attr_val({951278, dam}) -> 120;
get_attr_val({951279, dam}) -> 130;
get_attr_val({951280, dam}) -> 140;
get_attr_val({951281, dam}) -> 150;
get_attr_val({951282, dam}) -> 160;
get_attr_val({951283, dam}) -> 170;
get_attr_val({951284, dam}) -> 180;
get_attr_val({951285, dam}) -> 200;
get_attr_val({951286, dam}) -> 220;
get_attr_val(_Info) ->
    logger:data_error("get_attr_val_data_not_exist===>~w",
		      [_Info], partner_artifact_data, 335),
    undefined.

get_decompound_award(10451) -> [{10450, 60}];
get_decompound_award(10452) -> [{10450, 300}];
get_decompound_award(10453) -> [{10450, 1500}];
get_decompound_award(10454) -> [{10450, 7500}];
get_decompound_award(10455) -> [{10450, 37500}];
get_decompound_award(10456) -> [{10450, 57500}];
get_decompound_award(10457) -> [{10450, 77500}];
get_decompound_award(10458) -> [{10450, 97500}];
get_decompound_award(10459) -> [{10450, 117500}];
get_decompound_award(951275) -> [{10450, 127500}];
get_decompound_award(951276) -> [{10450, 137500}];
get_decompound_award(951277) -> [{10450, 147500}];
get_decompound_award(951278) -> [{10450, 157500}];
get_decompound_award(951279) -> [{10450, 167500}];
get_decompound_award(951280) -> [{10450, 177500}];
get_decompound_award(951281) -> [{10450, 277500}];
get_decompound_award(951282) -> [{10450, 377500}];
get_decompound_award(951283) -> [{10450, 477500}];
get_decompound_award(951284) -> [{10450, 577500}];
get_decompound_award(951285) -> [{10450, 677500}];
get_decompound_award(951286) -> [{10450, 677500}];
get_decompound_award(_Info) ->
    logger:data_error("get_decompound_award_data_not_exist===>~w",
		      [_Info], partner_artifact_data, 358),
    undefined.

get_skill_rand_info1(951286) ->
    [{[7, 7, 7, 7], 150}, {[5, 7, 5, 7], 850},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info1(951285) ->
    [{[7, 7, 7, 7], 150}, {[5, 7, 5, 7], 850},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info1(951284) ->
    [{[7, 7, 7, 7], 150}, {[5, 7, 5, 7], 850},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info1(951283) ->
    [{[7, 7, 7, 7], 150}, {[5, 7, 5, 7], 850},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info1(951282) ->
    [{[7, 7, 7, 7], 150}, {[5, 7, 5, 7], 850},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info1(951281) ->
    [{[7, 7, 7, 7], 150}, {[5, 7, 5, 7], 850},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info1(951280) ->
    [{[7, 7, 7, 7], 150}, {[5, 7, 5, 7], 850},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info1(951279) ->
    [{[7, 7, 7, 7], 150}, {[5, 7, 5, 7], 850},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info1(951278) ->
    [{[7, 7, 7, 7], 150}, {[5, 7, 5, 7], 850},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info1(951277) ->
    [{[7, 7, 7, 7], 150}, {[5, 7, 5, 7], 850},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info1(951276) ->
    [{[7, 7, 7, 7], 150}, {[5, 7, 5, 7], 850},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info1(951275) ->
    [{[7, 7, 7, 7], 150}, {[5, 7, 5, 7], 850},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info1(10459) ->
    [{[7, 7, 7, 7], 150}, {[5, 7, 5, 7], 850},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info1(10458) ->
    [{[7, 7, 7], 150}, {[5, 7, 5], 850}, {[7, 8, 10], 0},
     {[5, 8, 10], 0}];
get_skill_rand_info1(10457) ->
    [{[7, 7, 7], 150}, {[5, 7, 5], 850}, {[7, 8, 10], 0},
     {[5, 8, 10], 0}];
get_skill_rand_info1(10456) ->
    [{[7, 7], 150}, {[5, 7], 850}, {[7, 8], 0},
     {[5, 8], 0}];
get_skill_rand_info1(10455) ->
    [{[5, 5], 150}, {[3, 5], 850}, {[5, 6], 0},
     {[3, 6], 0}];
get_skill_rand_info1(10454) ->
    [{[5], 200}, {[3, 3], 300}, {[1, 5], 400},
     {[3, 5], 100}, {[3, 6], 0}];
get_skill_rand_info1(10453) ->
    [{[1, 1], 500}, {[3], 400}, {[1, 3], 100}];
get_skill_rand_info1(10452) -> [{[1], 1000}];
get_skill_rand_info1(_) -> [].

get_skill_rand_info2(951286) ->
    [{[7, 7, 7, 7], 0}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 200}, {[5, 8, 10, 10], 800}];
get_skill_rand_info2(951285) ->
    [{[7, 7, 7, 7], 0}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 200}, {[5, 8, 10, 10], 800}];
get_skill_rand_info2(951284) ->
    [{[7, 7, 7, 7], 0}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 200}, {[5, 8, 10, 10], 800}];
get_skill_rand_info2(951283) ->
    [{[7, 7, 7, 7], 0}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 200}, {[5, 8, 10, 10], 800}];
get_skill_rand_info2(951282) ->
    [{[7, 7, 7, 7], 0}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 200}, {[5, 8, 10, 10], 800}];
get_skill_rand_info2(951281) ->
    [{[7, 7, 7, 7], 0}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 200}, {[5, 8, 10, 10], 800}];
get_skill_rand_info2(951280) ->
    [{[7, 7, 7, 7], 0}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 200}, {[5, 8, 10, 10], 800}];
get_skill_rand_info2(951279) ->
    [{[7, 7, 7, 7], 0}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 200}, {[5, 8, 10, 10], 800}];
get_skill_rand_info2(951278) ->
    [{[7, 7, 7, 7], 0}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 200}, {[5, 8, 10, 10], 800}];
get_skill_rand_info2(951277) ->
    [{[7, 7, 7, 7], 0}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 200}, {[5, 8, 10, 10], 800}];
get_skill_rand_info2(951276) ->
    [{[7, 7, 7, 7], 0}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 200}, {[5, 8, 10, 10], 800}];
get_skill_rand_info2(951275) ->
    [{[7, 7, 7, 7], 0}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 200}, {[5, 8, 10, 10], 800}];
get_skill_rand_info2(10459) ->
    [{[7, 7, 7, 7], 0}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 200}, {[5, 8, 10, 10], 800}];
get_skill_rand_info2(10458) ->
    [{[7, 7, 7], 0}, {[5, 7, 5], 0}, {[7, 8, 10], 200},
     {[5, 8, 10], 800}];
get_skill_rand_info2(10457) ->
    [{[7, 7, 7], 0}, {[5, 7, 5], 0}, {[7, 8, 10], 200},
     {[5, 8, 10], 800}];
get_skill_rand_info2(10456) ->
    [{[7, 7], 0}, {[5, 7], 0}, {[7, 8], 200},
     {[5, 8], 800}];
get_skill_rand_info2(10455) ->
    [{[5, 5], 0}, {[3, 5], 0}, {[5, 6], 200},
     {[3, 6], 800}];
get_skill_rand_info2(10454) ->
    [{[5], 0}, {[3, 3], 0}, {[1, 5], 0}, {[3, 5], 0},
     {[3, 6], 1000}];
get_skill_rand_info2(10453) ->
    [{[1, 1], 0}, {[3], 0}, {[1, 3], 1000}];
get_skill_rand_info2(10452) -> [{[1], 0}];
get_skill_rand_info2(_) -> [].

get_skill_rand_info3(951286) ->
    [{[7, 7, 7, 7], 200}, {[5, 7, 5, 7], 800},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info3(951285) ->
    [{[7, 7, 7, 7], 200}, {[5, 7, 5, 7], 800},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info3(951284) ->
    [{[7, 7, 7, 7], 200}, {[5, 7, 5, 7], 800},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info3(951283) ->
    [{[7, 7, 7, 7], 200}, {[5, 7, 5, 7], 800},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info3(951282) ->
    [{[7, 7, 7, 7], 200}, {[5, 7, 5, 7], 800},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info3(951281) ->
    [{[7, 7, 7, 7], 200}, {[5, 7, 5, 7], 800},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info3(951280) ->
    [{[7, 7, 7, 7], 200}, {[5, 7, 5, 7], 800},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info3(951279) ->
    [{[7, 7, 7, 7], 200}, {[5, 7, 5, 7], 800},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info3(951278) ->
    [{[7, 7, 7, 7], 200}, {[5, 7, 5, 7], 800},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info3(951277) ->
    [{[7, 7, 7, 7], 200}, {[5, 7, 5, 7], 800},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info3(951276) ->
    [{[7, 7, 7, 7], 200}, {[5, 7, 5, 7], 800},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info3(951275) ->
    [{[7, 7, 7, 7], 200}, {[5, 7, 5, 7], 800},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info3(10459) ->
    [{[7, 7, 7, 7], 200}, {[5, 7, 5, 7], 800},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info3(10458) ->
    [{[7, 7, 7], 200}, {[5, 7, 5], 800}, {[7, 8, 10], 0},
     {[5, 8, 10], 0}];
get_skill_rand_info3(10457) ->
    [{[7, 7, 7], 200}, {[5, 7, 5], 800}, {[7, 8, 10], 0},
     {[5, 8, 10], 0}];
get_skill_rand_info3(10456) ->
    [{[7, 7], 200}, {[5, 7], 800}, {[7, 8], 0},
     {[5, 8], 0}];
get_skill_rand_info3(10455) ->
    [{[5, 5], 200}, {[3, 5], 800}, {[5, 6], 0},
     {[3, 6], 0}];
get_skill_rand_info3(10454) ->
    [{[5], 200}, {[3, 3], 300}, {[1, 5], 350},
     {[3, 5], 150}, {[3, 6], 0}];
get_skill_rand_info3(10453) ->
    [{[1, 1], 400}, {[3], 400}, {[1, 3], 200}];
get_skill_rand_info3(10452) -> [{[1], 1000}];
get_skill_rand_info3(_) -> [].

get_skill_rand_info4(951286) ->
    [{[7, 7, 7, 7], 1000}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info4(951285) ->
    [{[7, 7, 7, 7], 1000}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info4(951284) ->
    [{[7, 7, 7, 7], 1000}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info4(951283) ->
    [{[7, 7, 7, 7], 1000}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info4(951282) ->
    [{[7, 7, 7, 7], 1000}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info4(951281) ->
    [{[7, 7, 7, 7], 1000}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info4(951280) ->
    [{[7, 7, 7, 7], 1000}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info4(951279) ->
    [{[7, 7, 7, 7], 1000}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info4(951278) ->
    [{[7, 7, 7, 7], 1000}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info4(951277) ->
    [{[7, 7, 7, 7], 1000}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info4(951276) ->
    [{[7, 7, 7, 7], 1000}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info4(951275) ->
    [{[7, 7, 7, 7], 1000}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info4(10459) ->
    [{[7, 7, 7, 7], 1000}, {[5, 7, 5, 7], 0},
     {[7, 8, 10, 10], 0}, {[5, 8, 10, 10], 0}];
get_skill_rand_info4(10458) ->
    [{[7, 7, 7], 1000}, {[5, 7, 5], 0}, {[7, 8, 10], 0},
     {[5, 8, 10], 0}];
get_skill_rand_info4(10457) ->
    [{[7, 7, 7], 1000}, {[5, 7, 5], 0}, {[7, 8, 10], 0},
     {[5, 8, 10], 0}];
get_skill_rand_info4(10456) ->
    [{[7, 7], 1000}, {[5, 7], 0}, {[7, 8], 0}, {[5, 8], 0}];
get_skill_rand_info4(10455) ->
    [{[5, 5], 1000}, {[3, 5], 0}, {[5, 6], 0}, {[3, 6], 0}];
get_skill_rand_info4(10454) ->
    [{[5], 0}, {[3, 3], 0}, {[1, 5], 0}, {[3, 5], 0},
     {[3, 6], 0}];
get_skill_rand_info4(10453) ->
    [{[1, 1], 0}, {[3], 0}, {[1, 3], 0}];
get_skill_rand_info4(10452) -> [{[1], 0}];
get_skill_rand_info4(_) -> [].

get_attr_rand_info1(951286) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info1(951285) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info1(951284) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info1(951283) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info1(951282) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info1(951281) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info1(951280) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info1(951279) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info1(951278) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info1(951277) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info1(951276) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info1(951275) -> [{[1, 2, 3], 1000}];
get_attr_rand_info1(10459) -> [{[1, 2, 3], 1000}];
get_attr_rand_info1(10458) -> [{[1, 2, 3], 1000}];
get_attr_rand_info1(10457) -> [{[1, 2, 3], 1000}];
get_attr_rand_info1(10456) -> [{[1, 2, 3], 1000}];
get_attr_rand_info1(10455) -> [{[1, 2], 1000}];
get_attr_rand_info1(10454) -> [{[1], 1000}];
get_attr_rand_info1(10453) -> [{[1], 1000}];
get_attr_rand_info1(10452) -> [{[1], 1000}];
get_attr_rand_info1(10451) -> [{[1], 1000}];
get_attr_rand_info1(_) -> [].

get_attr_rand_info2(951286) -> [{[1, 2, 3, 4], 0}];
get_attr_rand_info2(951285) -> [{[1, 2, 3, 4], 0}];
get_attr_rand_info2(951284) -> [{[1, 2, 3, 4], 0}];
get_attr_rand_info2(951283) -> [{[1, 2, 3, 4], 0}];
get_attr_rand_info2(951282) -> [{[1, 2, 3, 4], 0}];
get_attr_rand_info2(951281) -> [{[1, 2, 3, 4], 0}];
get_attr_rand_info2(951280) -> [{[1, 2, 3, 4], 0}];
get_attr_rand_info2(951279) -> [{[1, 2, 3, 4], 0}];
get_attr_rand_info2(951278) -> [{[1, 2, 3, 4], 0}];
get_attr_rand_info2(951277) -> [{[1, 2, 3, 4], 0}];
get_attr_rand_info2(951276) -> [{[1, 2, 3, 4], 0}];
get_attr_rand_info2(951275) -> [{[1, 2, 3], 0}];
get_attr_rand_info2(10459) -> [{[1, 2, 3], 0}];
get_attr_rand_info2(10458) -> [{[1, 2, 3], 0}];
get_attr_rand_info2(10457) -> [{[1, 2, 3], 0}];
get_attr_rand_info2(10456) -> [{[1, 2, 3], 0}];
get_attr_rand_info2(10455) -> [{[1, 2], 0}];
get_attr_rand_info2(10454) -> [{[1], 0}];
get_attr_rand_info2(10453) -> [{[1], 0}];
get_attr_rand_info2(10452) -> [{[1], 0}];
get_attr_rand_info2(10451) -> [{[1], 0}];
get_attr_rand_info2(_) -> [].

get_attr_rand_info3(951286) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info3(951285) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info3(951284) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info3(951283) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info3(951282) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info3(951281) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info3(951280) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info3(951279) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info3(951278) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info3(951277) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info3(951276) -> [{[1, 2, 3, 4], 1000}];
get_attr_rand_info3(951275) -> [{[1, 2, 3], 1000}];
get_attr_rand_info3(10459) -> [{[1, 2, 3], 1000}];
get_attr_rand_info3(10458) -> [{[1, 2, 3], 1000}];
get_attr_rand_info3(10457) -> [{[1, 2, 3], 1000}];
get_attr_rand_info3(10456) -> [{[1, 2, 3], 1000}];
get_attr_rand_info3(10455) -> [{[1, 2], 1000}];
get_attr_rand_info3(10454) -> [{[1], 1000}];
get_attr_rand_info3(10453) -> [{[1], 1000}];
get_attr_rand_info3(10452) -> [{[1], 1000}];
get_attr_rand_info3(10451) -> [{[1], 1000}];
get_attr_rand_info3(_) -> [].

get_skill_rands(10) ->
    [{700006, 20}, {700016, 20}, {700046, 20}, {700056, 20},
     {700176, 20}, {700206, 20}, {700236, 20}, {700246, 20},
     {700266, 20}, {700276, 20}, {700316, 20}, {700326, 20},
     {750103, 20}, {750403, 20}, {700286, 20}, {700366, 20},
     {700396, 20}, {700406, 20}, {700416, 20}, {700426, 20},
     {700456, 20}];
get_skill_rands(9) ->
    [{700005, 20}, {700015, 20}, {700045, 20}, {700055, 20},
     {700175, 20}, {700205, 20}, {700235, 20}, {700245, 20},
     {700265, 20}, {700275, 20}, {700315, 20}, {700325, 20},
     {750102, 20}, {750402, 20}, {700285, 20}, {700365, 20},
     {700395, 20}, {700405, 20}, {700415, 20}, {700425, 20},
     {700455, 20}];
get_skill_rands(8) ->
    [{750003, 80}, {750203, 80}, {700076, 80}];
get_skill_rands(7) ->
    [{700006, 20}, {700016, 20}, {700026, 30}, {700036, 30},
     {700046, 20}, {700056, 20}, {700066, 30}, {700076, 10},
     {700086, 40}, {700096, 40}, {700106, 40}, {700116, 40},
     {700126, 40}, {700136, 40}, {700146, 30}, {700156, 40},
     {700166, 40}, {700176, 20}, {700186, 30}, {700196, 30},
     {700206, 20}, {700216, 30}, {700226, 30}, {700236, 20},
     {700246, 20}, {700256, 30}, {700266, 20}, {700276, 20},
     {700296, 30}, {700306, 40}, {700316, 20}, {700326, 20},
     {750003, 10}, {750103, 20}, {750203, 10}, {750403, 20},
     {700286, 20}, {700366, 20}, {700376, 30}, {700386, 30},
     {700396, 20}, {700406, 20}, {700416, 20}, {700426, 20},
     {700436, 30}, {700446, 30}, {700456, 20}];
get_skill_rands(6) ->
    [{750002, 80}, {750202, 80}, {700075, 80}];
get_skill_rands(5) ->
    [{700005, 20}, {700015, 20}, {700025, 30}, {700035, 30},
     {700045, 20}, {700055, 20}, {700065, 30}, {700075, 10},
     {700085, 40}, {700095, 40}, {700105, 40}, {700115, 40},
     {700125, 40}, {700135, 40}, {700145, 30}, {700155, 40},
     {700165, 40}, {700175, 20}, {700185, 30}, {700195, 30},
     {700205, 20}, {700215, 30}, {700225, 30}, {700235, 20},
     {700245, 20}, {700255, 30}, {700265, 20}, {700275, 20},
     {700295, 30}, {700305, 40}, {700315, 20}, {700325, 20},
     {750002, 10}, {750102, 20}, {750202, 10}, {750402, 20},
     {700285, 20}, {700365, 20}, {700375, 30}, {700385, 30},
     {700395, 20}, {700405, 20}, {700415, 20}, {700425, 20},
     {700435, 30}, {700445, 30}, {700455, 20}];
get_skill_rands(3) ->
    [{700003, 20}, {700013, 20}, {700023, 30}, {700033, 30},
     {700043, 20}, {700053, 20}, {700063, 30}, {700073, 10},
     {700083, 40}, {700093, 40}, {700103, 40}, {700113, 40},
     {700123, 40}, {700133, 40}, {700143, 30}, {700153, 40},
     {700163, 40}, {700173, 20}, {700183, 30}, {700193, 30},
     {700203, 20}, {700213, 30}, {700223, 30}, {700233, 20},
     {700243, 20}, {700253, 30}, {700263, 20}, {700273, 20},
     {700293, 30}, {700303, 40}, {700313, 20}, {700323, 20},
     {750001, 10}, {750101, 20}, {750201, 10}, {750401, 20},
     {700283, 20}, {700363, 20}, {700373, 30}, {700383, 30},
     {700393, 20}, {700403, 20}, {700413, 20}, {700423, 20},
     {700433, 30}, {700443, 30}, {700453, 20}];
get_skill_rands(1) ->
    [{700001, 20}, {700011, 20}, {700021, 30}, {700031, 30},
     {700041, 20}, {700051, 20}, {700061, 30}, {700071, 10},
     {700081, 40}, {700091, 40}, {700101, 40}, {700111, 40},
     {700121, 40}, {700131, 40}, {700141, 30}, {700151, 40},
     {700161, 40}, {700171, 20}, {700181, 30}, {700191, 30},
     {700201, 20}, {700211, 30}, {700221, 30}, {700231, 20},
     {700241, 20}, {700251, 30}, {700261, 20}, {700271, 20},
     {700291, 30}, {700301, 40}, {700311, 20}, {700321, 20},
     {750000, 10}, {750100, 20}, {750200, 10}, {750400, 20},
     {700281, 20}, {700361, 20}, {700371, 30}, {700381, 30},
     {700391, 20}, {700401, 20}, {700411, 20}, {700421, 20},
     {700431, 30}, {700441, 30}, {700451, 20}];
get_skill_rands(_) -> [].

get_attr_rands(6) ->
    [{atk_per, 200}, {hp_max_per, 200}, {def_per, 200},
     {dam, 50}, {res, 50}, {crit_rate, 100},
     {crit_ratio, 100}, {tenacity, 100}];
get_attr_rands(5) ->
    [{atk_per, 200}, {hp_max_per, 200}, {def_per, 200},
     {dam, 50}, {res, 50}, {crit_rate, 100},
     {crit_ratio, 100}, {tenacity, 100}];
get_attr_rands(4) ->
    [{atk_per, 200}, {hp_max_per, 200}, {def_per, 200},
     {dam, 50}, {res, 50}, {crit_rate, 100},
     {crit_ratio, 100}, {tenacity, 100}];
get_attr_rands(3) ->
    [{atk_per, 200}, {hp_max_per, 200}, {def_per, 200},
     {dam, 50}, {res, 50}, {crit_rate, 100},
     {crit_ratio, 100}, {tenacity, 100}];
get_attr_rands(2) ->
    [{atk_per, 200}, {hp_max_per, 200}, {def_per, 200},
     {dam, 50}, {res, 50}, {crit_rate, 100},
     {crit_ratio, 100}, {tenacity, 100}];
get_attr_rands(1) ->
    [{atk, 300}, {hp_max, 300}, {def, 300}, {speed, 100}];
get_attr_rands(_) -> [].

get_compound_need_num(951286) -> [2, 3, 4, 5];
get_compound_need_num(951285) -> [2, 3, 4, 5];
get_compound_need_num(951284) -> [2, 3, 4, 5];
get_compound_need_num(951283) -> [2, 3, 4, 5];
get_compound_need_num(951282) -> [2, 3, 4, 5];
get_compound_need_num(951281) -> [2, 3, 4, 5];
get_compound_need_num(951280) -> [2, 3, 4, 5];
get_compound_need_num(951279) -> [2, 3, 4, 5];
get_compound_need_num(951278) -> [2, 3, 4, 5];
get_compound_need_num(951277) -> [2, 3, 4, 5];
get_compound_need_num(951276) -> [2, 3, 4, 5];
get_compound_need_num(951275) -> [2, 3, 4, 5];
get_compound_need_num(10459) -> [2, 3, 4, 5];
get_compound_need_num(10458) -> [2, 3, 4, 5];
get_compound_need_num(10457) -> [2, 3, 4, 5];
get_compound_need_num(10456) -> [2, 3, 4, 5];
get_compound_need_num(10455) -> [2, 3, 4, 5];
get_compound_need_num(10454) -> [2, 3, 4, 5];
get_compound_need_num(10453) -> [2, 3, 4, 5];
get_compound_need_num(10452) -> [2, 3, 4, 5];
get_compound_need_num(_) -> [].

get_compound_need_id(951286) -> [[951285]];
get_compound_need_id(951285) -> [[951284]];
get_compound_need_id(951284) -> [[951283]];
get_compound_need_id(951283) -> [[951282]];
get_compound_need_id(951282) -> [[951281]];
get_compound_need_id(951281) -> [[951280]];
get_compound_need_id(951280) -> [[951279]];
get_compound_need_id(951279) -> [[951278]];
get_compound_need_id(951278) -> [[951277]];
get_compound_need_id(951277) -> [[951276]];
get_compound_need_id(951276) -> [[951275]];
get_compound_need_id(951275) -> [[10459]];
get_compound_need_id(10459) -> [[10458]];
get_compound_need_id(10458) -> [[10457]];
get_compound_need_id(10457) -> [[10456]];
get_compound_need_id(10456) -> [[10455]];
get_compound_need_id(10455) -> [[10454]];
get_compound_need_id(10454) -> [[10453]];
get_compound_need_id(10453) -> [[10452]];
get_compound_need_id(10452) -> [[10451]];
get_compound_need_id(_) -> [].

get_compound_need_info({10452, 2}) ->
    {200, [{10450, 60}], 4};
get_compound_need_info({10452, 3}) ->
    {400, [{10450, 90}], 6};
get_compound_need_info({10452, 4}) ->
    {600, [{10450, 120}], 8};
get_compound_need_info({10452, 5}) ->
    {800, [{10450, 150}], 10};
get_compound_need_info({10453, 2}) ->
    {200, [{10450, 300}], 20};
get_compound_need_info({10453, 3}) ->
    {400, [{10450, 450}], 30};
get_compound_need_info({10453, 4}) ->
    {600, [{10450, 600}], 40};
get_compound_need_info({10453, 5}) ->
    {800, [{10450, 750}], 50};
get_compound_need_info({10454, 2}) ->
    {200, [{10450, 1500}], 100};
get_compound_need_info({10454, 3}) ->
    {400, [{10450, 2250}], 150};
get_compound_need_info({10454, 4}) ->
    {600, [{10450, 3000}], 200};
get_compound_need_info({10454, 5}) ->
    {800, [{10450, 3750}], 250};
get_compound_need_info({10455, 2}) ->
    {200, [{10450, 7500}], 500};
get_compound_need_info({10455, 3}) ->
    {400, [{10450, 11250}], 750};
get_compound_need_info({10455, 4}) ->
    {600, [{10450, 15000}], 1000};
get_compound_need_info({10455, 5}) ->
    {800, [{10450, 18750}], 1250};
get_compound_need_info({10456, 2}) ->
    {200, [{10450, 7500}], 500};
get_compound_need_info({10456, 3}) ->
    {400, [{10450, 11250}], 750};
get_compound_need_info({10456, 4}) ->
    {600, [{10450, 25000}], 1000};
get_compound_need_info({10456, 5}) ->
    {800, [{10450, 28750}], 1250};
get_compound_need_info({10457, 2}) ->
    {200, [{10450, 7500}], 500};
get_compound_need_info({10457, 3}) ->
    {400, [{10450, 11250}], 750};
get_compound_need_info({10457, 4}) ->
    {600, [{10450, 15000}], 1000};
get_compound_need_info({10457, 5}) ->
    {800, [{10450, 30000}], 1250};
get_compound_need_info({10458, 2}) ->
    {200, [{10450, 8000}], 500};
get_compound_need_info({10458, 3}) ->
    {400, [{10450, 15000}], 750};
get_compound_need_info({10458, 4}) ->
    {600, [{10450, 20000}], 1000};
get_compound_need_info({10458, 5}) ->
    {800, [{10450, 40000}], 1250};
get_compound_need_info({10459, 2}) ->
    {200, [{10450, 9000}], 500};
get_compound_need_info({10459, 3}) ->
    {400, [{10450, 18000}], 750};
get_compound_need_info({10459, 4}) ->
    {600, [{10450, 25000}], 1000};
get_compound_need_info({10459, 5}) ->
    {800, [{10450, 50000}], 1250};
get_compound_need_info({951275, 2}) ->
    {200, [{10450, 9000}], 500};
get_compound_need_info({951275, 3}) ->
    {400, [{10450, 18000}], 750};
get_compound_need_info({951275, 4}) ->
    {600, [{10450, 25000}], 1000};
get_compound_need_info({951275, 5}) ->
    {800, [{10450, 50000}], 1250};
get_compound_need_info({951276, 2}) ->
    {200, [{10450, 9000}], 500};
get_compound_need_info({951276, 3}) ->
    {400, [{10450, 18000}], 750};
get_compound_need_info({951276, 4}) ->
    {600, [{10450, 25000}], 1000};
get_compound_need_info({951276, 5}) ->
    {800, [{10450, 50000}], 1250};
get_compound_need_info({951277, 2}) ->
    {200, [{10450, 9000}], 500};
get_compound_need_info({951277, 3}) ->
    {400, [{10450, 18000}], 750};
get_compound_need_info({951277, 4}) ->
    {600, [{10450, 25000}], 1000};
get_compound_need_info({951277, 5}) ->
    {800, [{10450, 50000}], 1250};
get_compound_need_info({951278, 2}) ->
    {200, [{10450, 9000}], 500};
get_compound_need_info({951278, 3}) ->
    {400, [{10450, 18000}], 750};
get_compound_need_info({951278, 4}) ->
    {600, [{10450, 25000}], 1000};
get_compound_need_info({951278, 5}) ->
    {800, [{10450, 50000}], 1250};
get_compound_need_info({951279, 2}) ->
    {200, [{10450, 9000}], 500};
get_compound_need_info({951279, 3}) ->
    {400, [{10450, 18000}], 750};
get_compound_need_info({951279, 4}) ->
    {600, [{10450, 25000}], 1000};
get_compound_need_info({951279, 5}) ->
    {800, [{10450, 50000}], 1250};
get_compound_need_info({951280, 2}) ->
    {200, [{10450, 9000}], 500};
get_compound_need_info({951280, 3}) ->
    {400, [{10450, 18000}], 750};
get_compound_need_info({951280, 4}) ->
    {600, [{10450, 25000}], 1000};
get_compound_need_info({951280, 5}) ->
    {800, [{10450, 50000}], 1250};
get_compound_need_info({951281, 2}) ->
    {200, [{10450, 9000}], 500};
get_compound_need_info({951281, 3}) ->
    {400, [{10450, 18000}], 750};
get_compound_need_info({951281, 4}) ->
    {600, [{10450, 25000}], 1000};
get_compound_need_info({951281, 5}) ->
    {800, [{10450, 50000}], 1250};
get_compound_need_info({951282, 2}) ->
    {200, [{10450, 9000}], 500};
get_compound_need_info({951282, 3}) ->
    {400, [{10450, 18000}], 750};
get_compound_need_info({951282, 4}) ->
    {600, [{10450, 25000}], 1000};
get_compound_need_info({951282, 5}) ->
    {800, [{10450, 50000}], 1250};
get_compound_need_info({951283, 2}) ->
    {200, [{10450, 9000}], 500};
get_compound_need_info({951283, 3}) ->
    {400, [{10450, 18000}], 750};
get_compound_need_info({951283, 4}) ->
    {600, [{10450, 25000}], 1000};
get_compound_need_info({951283, 5}) ->
    {800, [{10450, 50000}], 1250};
get_compound_need_info({951284, 2}) ->
    {200, [{10450, 9000}], 500};
get_compound_need_info({951284, 3}) ->
    {400, [{10450, 18000}], 750};
get_compound_need_info({951284, 4}) ->
    {600, [{10450, 25000}], 1000};
get_compound_need_info({951284, 5}) ->
    {800, [{10450, 50000}], 1250};
get_compound_need_info({951285, 2}) ->
    {200, [{10450, 9000}], 500};
get_compound_need_info({951285, 3}) ->
    {400, [{10450, 18000}], 750};
get_compound_need_info({951285, 4}) ->
    {600, [{10450, 25000}], 1000};
get_compound_need_info({951285, 5}) ->
    {800, [{10450, 50000}], 1250};
get_compound_need_info({951286, 2}) ->
    {200, [{10450, 9000}], 500};
get_compound_need_info({951286, 3}) ->
    {400, [{10450, 18000}], 750};
get_compound_need_info({951286, 4}) ->
    {600, [{10450, 25000}], 1000};
get_compound_need_info({951286, 5}) ->
    {800, [{10450, 50000}], 1250};
get_compound_need_info(_Info) ->
    logger:data_error("get_compound_need_info_data_not_exist===>~w",
		      [_Info], partner_artifact_data, 668),
    undefined.

get_compound_other_expend({10452, 2}) -> [{1, 20000}];
get_compound_other_expend({10452, 3}) -> [{1, 40000}];
get_compound_other_expend({10452, 4}) -> [{1, 60000}];
get_compound_other_expend({10452, 5}) -> [{1, 80000}];
get_compound_other_expend({10453, 2}) -> [{1, 100000}];
get_compound_other_expend({10453, 3}) -> [{1, 200000}];
get_compound_other_expend({10453, 4}) -> [{1, 300000}];
get_compound_other_expend({10453, 5}) -> [{1, 400000}];
get_compound_other_expend({10454, 2}) -> [{1, 300000}];
get_compound_other_expend({10454, 3}) -> [{1, 600000}];
get_compound_other_expend({10454, 4}) -> [{1, 900000}];
get_compound_other_expend({10454, 5}) -> [{1, 1200000}];
get_compound_other_expend({10455, 2}) -> [{1, 500000}];
get_compound_other_expend({10455, 3}) -> [{1, 1000000}];
get_compound_other_expend({10455, 4}) -> [{1, 1500000}];
get_compound_other_expend({10455, 5}) -> [{1, 2000000}];
get_compound_other_expend({10456, 2}) -> [{1, 800000}];
get_compound_other_expend({10456, 3}) -> [{1, 1800000}];
get_compound_other_expend({10456, 4}) -> [{1, 2500000}];
get_compound_other_expend({10456, 5}) -> [{1, 3000000}];
get_compound_other_expend({10457, 2}) -> [{1, 1600000}];
get_compound_other_expend({10457, 3}) -> [{1, 3600000}];
get_compound_other_expend({10457, 4}) -> [{1, 5600000}];
get_compound_other_expend({10457, 5}) ->
    [{1, 100000000}];
get_compound_other_expend({10458, 2}) -> [{1, 1600000}];
get_compound_other_expend({10458, 3}) -> [{1, 3600000}];
get_compound_other_expend({10458, 4}) -> [{1, 5600000}];
get_compound_other_expend({10458, 5}) ->
    [{1, 100000000}];
get_compound_other_expend({10459, 2}) -> [{1, 1600000}];
get_compound_other_expend({10459, 3}) -> [{1, 3600000}];
get_compound_other_expend({10459, 4}) -> [{1, 5600000}];
get_compound_other_expend({10459, 5}) ->
    [{1, 100000000}];
get_compound_other_expend({951275, 2}) ->
    [{1, 1600000}];
get_compound_other_expend({951275, 3}) ->
    [{1, 3600000}];
get_compound_other_expend({951275, 4}) ->
    [{1, 5600000}];
get_compound_other_expend({951275, 5}) ->
    [{1, 100000000}];
get_compound_other_expend({951276, 2}) ->
    [{1, 1600000}];
get_compound_other_expend({951276, 3}) ->
    [{1, 3600000}];
get_compound_other_expend({951276, 4}) ->
    [{1, 5600000}];
get_compound_other_expend({951276, 5}) ->
    [{1, 100000000}];
get_compound_other_expend({951277, 2}) ->
    [{1, 1600000}];
get_compound_other_expend({951277, 3}) ->
    [{1, 3600000}];
get_compound_other_expend({951277, 4}) ->
    [{1, 5600000}];
get_compound_other_expend({951277, 5}) ->
    [{1, 100000000}];
get_compound_other_expend({951278, 2}) ->
    [{1, 1600000}];
get_compound_other_expend({951278, 3}) ->
    [{1, 3600000}];
get_compound_other_expend({951278, 4}) ->
    [{1, 5600000}];
get_compound_other_expend({951278, 5}) ->
    [{1, 100000000}];
get_compound_other_expend({951279, 2}) ->
    [{1, 1600000}];
get_compound_other_expend({951279, 3}) ->
    [{1, 3600000}];
get_compound_other_expend({951279, 4}) ->
    [{1, 5600000}];
get_compound_other_expend({951279, 5}) ->
    [{1, 100000000}];
get_compound_other_expend({951280, 2}) ->
    [{1, 1600000}];
get_compound_other_expend({951280, 3}) ->
    [{1, 3600000}];
get_compound_other_expend({951280, 4}) ->
    [{1, 5600000}];
get_compound_other_expend({951280, 5}) ->
    [{1, 100000000}];
get_compound_other_expend({951281, 2}) ->
    [{1, 1600000}];
get_compound_other_expend({951281, 3}) ->
    [{1, 3600000}];
get_compound_other_expend({951281, 4}) ->
    [{1, 5600000}];
get_compound_other_expend({951281, 5}) ->
    [{1, 100000000}];
get_compound_other_expend({951282, 2}) ->
    [{1, 1600000}];
get_compound_other_expend({951282, 3}) ->
    [{1, 3600000}];
get_compound_other_expend({951282, 4}) ->
    [{1, 5600000}];
get_compound_other_expend({951282, 5}) ->
    [{1, 100000000}];
get_compound_other_expend({951283, 2}) ->
    [{1, 1600000}];
get_compound_other_expend({951283, 3}) ->
    [{1, 3600000}];
get_compound_other_expend({951283, 4}) ->
    [{1, 5600000}];
get_compound_other_expend({951283, 5}) ->
    [{1, 100000000}];
get_compound_other_expend({951284, 2}) ->
    [{1, 1600000}];
get_compound_other_expend({951284, 3}) ->
    [{1, 3600000}];
get_compound_other_expend({951284, 4}) ->
    [{1, 5600000}];
get_compound_other_expend({951284, 5}) ->
    [{1, 100000000}];
get_compound_other_expend({951285, 2}) ->
    [{1, 1600000}];
get_compound_other_expend({951285, 3}) ->
    [{1, 3600000}];
get_compound_other_expend({951285, 4}) ->
    [{1, 5600000}];
get_compound_other_expend({951285, 5}) ->
    [{1, 100000000}];
get_compound_other_expend({951286, 2}) ->
    [{1, 1600000}];
get_compound_other_expend({951286, 3}) ->
    [{1, 3600000}];
get_compound_other_expend({951286, 4}) ->
    [{1, 5600000}];
get_compound_other_expend({951286, 5}) ->
    [{1, 100000000}];
get_compound_other_expend(_Info) ->
    logger:data_error("get_compound_other_expend_data_not_exist===>~w",
		      [_Info], partner_artifact_data, 750),
    undefined.

get_constant(recast_purple) -> 10430;
get_constant(recast_yellow) -> 10431;
get_constant(skill_score_1) -> 600;
get_constant(skill_score_2) -> 1200;
get_constant(skill_score_3) -> 1800;
get_constant(skill_score_4) -> 1800;
get_constant(skill_score_5) -> 1800;
get_constant(artifact_rule) -> 1;
get_constant(change_condition) -> 1000;
get_constant(change_gift) -> [{10454, 1}];
get_constant(recast_rule) -> 1;
get_constant(recastskill_rule) -> 1;
get_constant(main_shenqi) -> 10451;
get_constant(recast_tag) -> {700075, 750202, 750002};
get_constant(recast_power_tag) ->
    {700005, 700015, 700045, 700055, 700175, 700205, 700235,
     700245, 700265, 700275, 700315, 700325, 750102, 750402,
     700285, 700365, 700395, 700405, 700415, 700425, 700455};
get_constant(lucky_item_id2) -> 10490;
get_constant(lucky_artifact_ids2) ->
    {{10455, 1}, {10456, 2}, {10457, 3}, {10458, 10},
     {10459, 20}, {951275, 50}, {951276, 50}, {951277, 50},
     {951278, 50}, {951279, 50}, {951280, 50}, {951281, 50},
     {951282, 50}, {951283, 50}, {951284, 50}, {951285, 50},
     {951286, 50}};
get_constant(lucky_item_id) -> 10470;
get_constant(lucky_artifact_ids) ->
    {{10455, 1}, {10456, 2}, {10457, 3}, {10458, 10},
     {10459, 20}, {951275, 50}, {951276, 50}, {951277, 50},
     {951278, 50}, {951279, 50}, {951280, 50}, {951281, 50},
     {951282, 50}, {951283, 50}, {951284, 50}, {951285, 50},
     {951286, 50}};
get_constant(lucky_artifact_skillids) ->
    {700005, 700015, 700045, 700055, 700075, 700175, 700205,
     700235, 700245, 700265, 700275, 700315, 700325, 750002,
     750102, 750202, 750402, 700285, 700365, 700395, 700405,
     700415, 700425, 700455};
get_constant(lucky_artifact_skillids2) ->
    {700076, 750203, 750003, 700006, 700016, 700046, 700056,
     700176, 700206, 700236, 700246, 700266, 700276, 700316,
     700326, 750103, 750403, 700286, 700366, 700396, 700406,
     700416, 700426, 700456};
get_constant(lucky_artifact_add_pro) -> 1500;
get_constant(lucky_artifact_add_pro2) -> 1500;
get_constant(lucky_artifact_desc) -> 1;
get_constant(lucky_artifact_desc2) -> 1;
get_constant(backpack_tips_count) -> 200;
get_constant(_) -> undefined.


