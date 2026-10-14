-file("data/arena_elite_data.erl", 1).

-file("src/mod/data/arena_elite_data.erl", 1).

-module(arena_elite_data).

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

-export([get_constant/1, get_all_award_ids/0,
	 get_ref_lev/1, get_all_score/1, get_lev_name/1,
	 get_award/1, get_promoted_info/1, get_lev_award/1,
	 get_need_promoted/1, get_need_exp/1, get_init_exp/1,
	 get_del_exp/1, get_next_lev/1, get_macth_limit_score/1,
	 get_macth_limit_match_power/1, get_macth_limit_power/1,
	 get_combat_award1/1, get_combat_award2/1,
	 get_combat_award3/1, get_combat_award4/1,
	 get_combat_drop_id1/1, get_combat_drop_id2/1,
	 get_combat_drop_id3/1, get_combat_drop_id4/1,
	 get_hallows_look/1, get_avatar_id/1, get_honor_id/1,
	 get_rank_limit_lev/1, init_manifesto/0, get_cd_time/1,
	 get_buy_count/1, get_targer_score/1, get_rank_award/1,
	 get_rank_hallows/1, get_rank_award_limit/1]).

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

-file("src/mod/data/arena_elite_data.erl", 44).

-file("inc/common.hrl", 1).

-file("src/mod/data/arena_elite_data.erl", 45).

-file("inc/attr.hrl", 1).

-file("src/mod/data/arena_elite_data.erl", 46).

get_constant(open_world_lev_limit) -> 100;
get_constant(open_person_lev_limit) -> 100;
get_constant(king_match_condition) -> 18;
get_constant(rank_reward_limit) -> 100;
get_constant(first_routine) -> 9;
get_constant(second_routine) -> 9;
get_constant(second_king) -> 3;
get_constant(open_time) -> {0, 1, 0};
get_constant(close_time) -> {23, 30, 0};
get_constant(open_times) -> 84600;
get_constant(idle_time_limit) -> 180;
get_constant(clear_opponent_time) -> 600;
get_constant(strength_var1) -> 6.9999999999999996e-1;
get_constant(strength_var2) -> 1.0e-3;
get_constant(strength_var3) -> 58;
get_constant(strength_var4) -> 65;
get_constant(normal_win_base_exp_add) ->
    {30, 2.0e-1, 5.0e-3};
get_constant(king_win_base_exp_add) ->
    {40, 2.0e-1, 5.0e-3};
get_constant(win_battle_num_correct) -> 2.0e-4;
get_constant(normal_lose_base_exp_down) ->
    {15, 2.0e-1, 4.0e-3};
get_constant(king_lose_base_exp_down) ->
    {15, 2.0e-1, 4.0e-3};
get_constant(rank_show_limit) -> 100;
get_constant(hallows_skin_mail_condition) -> 10;
get_constant(match_count) -> 3;
get_constant(buy_count) -> 5;
get_constant(normal_win_coin_correct) -> [{27, 0}];
get_constant(king_win_coin_correct) -> [{27, 0}];
get_constant(normal_lose_coin_correct) -> [{27, 0}];
get_constant(king_lose_coin_correct) -> [{27, 0}];
get_constant(strong_record_num_limit) -> 50;
get_constant(self_record_num_limit) -> 30;
get_constant(likes_limit) -> 3;
get_constant(likes_reward) -> [{1, 20000}];
get_constant(hearsay_lev_condition) -> 10;
get_constant(mail_rank_condition) -> 10;
get_constant(wins_time_condition) -> [6, 10];
get_constant(toprank_mail_condition) -> [22];
get_constant(secondrank_mail_condition) -> [21, 20];
get_constant(default_win_rate) -> 600;
get_constant(non_count_winrate_battle) -> 5;
get_constant(initial_win_rate) -> 500;
get_constant(last_battle_num_select) -> 10;
get_constant(second_team_open_condition) -> 2;
get_constant(update_mirror_battlenum_condition) -> 800;
get_constant(honor_shows) ->
    {91101, 91102, 91102, 91103, 91103, 91103};
get_constant(default_declaration) ->
    [{1, 3}, {2, 1}, {3, 4}];
get_constant(area_activityplayer_condition) -> 6000;
get_constant(new_area_severnum_limit) -> 70;
get_constant(activity_player_condition) -> 3;
get_constant(skip_after_time) -> 5;
get_constant(no_skip_after_time) -> 60;
get_constant(_) -> undefined.

get_all_award_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
     17, 18, 19, 20, 21, 22].

get_ref_lev(1) -> 1;
get_ref_lev(2) -> 1;
get_ref_lev(3) -> 1;
get_ref_lev(4) -> 1;
get_ref_lev(5) -> 1;
get_ref_lev(6) -> 1;
get_ref_lev(7) -> 2;
get_ref_lev(8) -> 3;
get_ref_lev(9) -> 3;
get_ref_lev(10) -> 4;
get_ref_lev(11) -> 5;
get_ref_lev(12) -> 6;
get_ref_lev(13) -> 6;
get_ref_lev(14) -> 7;
get_ref_lev(15) -> 8;
get_ref_lev(16) -> 9;
get_ref_lev(17) -> 9;
get_ref_lev(18) -> 10;
get_ref_lev(19) -> 11;
get_ref_lev(20) -> 12;
get_ref_lev(21) -> 13;
get_ref_lev(22) -> 13;
get_ref_lev(_Info) ->
    logger:data_error("get_ref_lev_data_not_exist===>~w",
		      [_Info], arena_elite_data, 124),
    undefined.

get_all_score(1) -> 1000;
get_all_score(2) -> 1030;
get_all_score(3) -> 1090;
get_all_score(4) -> 1180;
get_all_score(5) -> 1270;
get_all_score(6) -> 1390;
get_all_score(7) -> 1510;
get_all_score(8) -> 1660;
get_all_score(9) -> 1810;
get_all_score(10) -> 1990;
get_all_score(11) -> 2170;
get_all_score(12) -> 2380;
get_all_score(13) -> 2590;
get_all_score(14) -> 2830;
get_all_score(15) -> 3070;
get_all_score(16) -> 3340;
get_all_score(17) -> 3610;
get_all_score(18) -> 3910;
get_all_score(19) -> 4270;
get_all_score(20) -> 4690;
get_all_score(21) -> 5170;
get_all_score(22) -> 5710;
get_all_score(_Info) ->
    logger:data_error("get_all_score_data_not_exist===>~w",
		      [_Info], arena_elite_data, 148),
    undefined.

get_lev_name(1) -> lang:get(<<"黑铁斗者 I"/utf8>>);
get_lev_name(2) -> lang:get(<<"白银先锋 I"/utf8>>);
get_lev_name(3) -> lang:get(<<"白银先锋 II"/utf8>>);
get_lev_name(4) -> lang:get(<<"黄金勇卫 I"/utf8>>);
get_lev_name(5) -> lang:get(<<"黄金勇卫 II"/utf8>>);
get_lev_name(6) -> lang:get(<<"黄金勇卫 III"/utf8>>);
get_lev_name(7) -> lang:get(<<"铂金精英 I"/utf8>>);
get_lev_name(8) -> lang:get(<<"铂金精英 II"/utf8>>);
get_lev_name(9) -> lang:get(<<"铂金精英 III"/utf8>>);
get_lev_name(10) -> lang:get(<<"钻石大师 I"/utf8>>);
get_lev_name(11) -> lang:get(<<"钻石大师 II"/utf8>>);
get_lev_name(12) -> lang:get(<<"钻石大师 III"/utf8>>);
get_lev_name(13) -> lang:get(<<"钻石大师 IV"/utf8>>);
get_lev_name(14) -> lang:get(<<"闪耀尊师 I"/utf8>>);
get_lev_name(15) -> lang:get(<<"闪耀尊师 II"/utf8>>);
get_lev_name(16) -> lang:get(<<"闪耀尊师 III"/utf8>>);
get_lev_name(17) -> lang:get(<<"闪耀尊师 IV"/utf8>>);
get_lev_name(18) -> lang:get(<<"超凡王者 I"/utf8>>);
get_lev_name(19) -> lang:get(<<"超凡王者 II"/utf8>>);
get_lev_name(20) -> lang:get(<<"超凡王者 III"/utf8>>);
get_lev_name(21) -> lang:get(<<"超凡王者 IV"/utf8>>);
get_lev_name(22) -> lang:get(<<"超凡王者 V"/utf8>>);
get_lev_name(_Info) ->
    logger:data_error("get_lev_name_data_not_exist===>~w",
		      [_Info], arena_elite_data, 172),
    undefined.

get_award(1) -> [{27, 250}, {3, 500}];
get_award(2) -> [{27, 500}, {3, 600}];
get_award(3) -> [{27, 750}, {3, 1000}];
get_award(4) -> [{27, 1000}, {3, 1250}];
get_award(5) -> [{27, 1250}, {3, 1500}];
get_award(6) -> [{27, 1500}, {3, 1750}];
get_award(7) -> [{27, 1750}, {3, 2000}];
get_award(8) -> [{27, 2000}, {3, 2250}];
get_award(9) -> [{27, 2250}, {3, 2500}];
get_award(10) -> [{27, 2500}, {3, 3000}];
get_award(11) -> [{27, 2750}, {3, 3500}];
get_award(12) -> [{27, 3000}, {3, 4000}];
get_award(13) -> [{27, 3250}, {3, 4500}];
get_award(14) -> [{27, 3500}, {3, 5000}];
get_award(15) -> [{27, 4000}, {3, 6000}];
get_award(16) -> [{27, 4500}, {3, 7000}];
get_award(17) -> [{27, 5000}, {3, 8000}];
get_award(18) -> [{27, 6000}, {3, 10000}];
get_award(19) -> [{27, 7000}, {3, 12000}];
get_award(20) -> [{27, 8000}, {3, 14000}];
get_award(21) -> [{27, 9000}, {3, 16000}];
get_award(22) -> [{27, 10000}, {3, 18000}];
get_award(_Info) ->
    logger:data_error("get_award_data_not_exist===>~w",
		      [_Info], arena_elite_data, 196),
    undefined.

get_promoted_info(1) -> {1, 1};
get_promoted_info(2) -> {1, 1};
get_promoted_info(3) -> {1, 1};
get_promoted_info(4) -> {1, 1};
get_promoted_info(5) -> {1, 1};
get_promoted_info(6) -> {1, 1};
get_promoted_info(7) -> {1, 1};
get_promoted_info(8) -> {1, 1};
get_promoted_info(9) -> {1, 1};
get_promoted_info(10) -> {3, 2};
get_promoted_info(11) -> {3, 2};
get_promoted_info(12) -> {3, 2};
get_promoted_info(13) -> {3, 2};
get_promoted_info(14) -> {3, 2};
get_promoted_info(15) -> {3, 2};
get_promoted_info(16) -> {3, 2};
get_promoted_info(17) -> {3, 2};
get_promoted_info(18) -> {3, 2};
get_promoted_info(19) -> {3, 2};
get_promoted_info(20) -> {3, 2};
get_promoted_info(21) -> {3, 2};
get_promoted_info(_Info) ->
    logger:data_error("get_promoted_info_data_not_exist===>~w",
		      [_Info], arena_elite_data, 219),
    undefined.

get_lev_award(2) ->
    [{3, 1000000}, {39052, 1000}, {39053, 1000},
     {10091, 100}, {10090, 100}, {39081, 10}];
get_lev_award(3) ->
    [{3, 1000000}, {39052, 1000}, {39053, 1000},
     {10091, 100}, {10090, 100}, {39081, 10}];
get_lev_award(4) ->
    [{3, 1000000}, {39052, 1000}, {39053, 1000},
     {10091, 100}, {10090, 100}, {39081, 10}];
get_lev_award(5) ->
    [{3, 1000000}, {39052, 1000}, {39053, 1000},
     {10091, 100}, {10090, 100}, {39081, 10}];
get_lev_award(6) ->
    [{3, 1000000}, {39052, 1000}, {39053, 1000},
     {10091, 100}, {10090, 100}, {39081, 10}];
get_lev_award(7) ->
    [{3, 1000000}, {39052, 1000}, {39053, 1000},
     {10091, 100}, {10090, 100}, {39081, 10}];
get_lev_award(8) ->
    [{3, 1000000}, {39052, 1000}, {39053, 1000},
     {10091, 100}, {10090, 100}, {39081, 10}];
get_lev_award(9) ->
    [{3, 1000000}, {39052, 1000}, {39053, 1000},
     {10091, 100}, {10090, 100}, {39081, 10}];
get_lev_award(10) ->
    [{3, 1000000}, {39052, 1000}, {39053, 1000},
     {10091, 100}, {10090, 100}, {39081, 10}];
get_lev_award(11) ->
    [{3, 1000000}, {39052, 1000}, {39053, 1000},
     {10091, 100}, {10090, 100}, {39081, 10}];
get_lev_award(12) ->
    [{3, 1000000}, {39052, 1000}, {39053, 1000},
     {10091, 100}, {10090, 100}, {39081, 10}];
get_lev_award(13) ->
    [{3, 1000000}, {39052, 1000}, {39053, 1000},
     {10091, 100}, {10090, 100}, {39081, 10}];
get_lev_award(14) ->
    [{3, 2000000}, {39052, 2000}, {39053, 2000},
     {10091, 200}, {10090, 200}, {39081, 20}];
get_lev_award(15) ->
    [{3, 3000000}, {39052, 3000}, {39053, 3000},
     {10091, 300}, {10090, 300}, {39081, 30}];
get_lev_award(16) ->
    [{3, 4000000}, {39052, 4000}, {39053, 4000},
     {10091, 400}, {10090, 400}, {39081, 40}];
get_lev_award(17) ->
    [{3, 5000000}, {39052, 5000}, {39053, 5000},
     {10091, 500}, {10090, 500}, {39081, 50}];
get_lev_award(18) ->
    [{3, 6000000}, {39052, 6000}, {39053, 6000},
     {10091, 600}, {10090, 600}, {39081, 60}];
get_lev_award(19) ->
    [{3, 7000000}, {39052, 7000}, {39053, 7000},
     {10091, 700}, {10090, 700}, {39081, 70}];
get_lev_award(20) ->
    [{3, 8000000}, {39052, 8000}, {39053, 8000},
     {10091, 800}, {10090, 800}, {39081, 80}];
get_lev_award(21) ->
    [{3, 9000000}, {39052, 9000}, {39053, 9000},
     {10091, 900}, {10090, 900}, {39081, 90}];
get_lev_award(22) ->
    [{3, 10000000}, {39052, 10000}, {39053, 10000},
     {10091, 1000}, {10090, 1000}, {39081, 100}];
get_lev_award(_Info) ->
    logger:data_error("get_lev_award_data_not_exist===>~w",
		      [_Info], arena_elite_data, 242),
    undefined.

get_need_promoted(1) -> 1;
get_need_promoted(2) -> 1;
get_need_promoted(3) -> 1;
get_need_promoted(4) -> 1;
get_need_promoted(5) -> 1;
get_need_promoted(6) -> 1;
get_need_promoted(7) -> 1;
get_need_promoted(8) -> 1;
get_need_promoted(9) -> 1;
get_need_promoted(10) -> 1;
get_need_promoted(11) -> 1;
get_need_promoted(12) -> 1;
get_need_promoted(13) -> 1;
get_need_promoted(14) -> 1;
get_need_promoted(15) -> 1;
get_need_promoted(16) -> 1;
get_need_promoted(17) -> 1;
get_need_promoted(18) -> 1;
get_need_promoted(19) -> 1;
get_need_promoted(20) -> 1;
get_need_promoted(21) -> 1;
get_need_promoted(22) -> 0;
get_need_promoted(_Info) ->
    logger:data_error("get_need_promoted_data_not_exist===>~w",
		      [_Info], arena_elite_data, 266),
    undefined.

get_need_exp(1) -> 30;
get_need_exp(2) -> 60;
get_need_exp(3) -> 90;
get_need_exp(4) -> 90;
get_need_exp(5) -> 120;
get_need_exp(6) -> 120;
get_need_exp(7) -> 150;
get_need_exp(8) -> 150;
get_need_exp(9) -> 180;
get_need_exp(10) -> 180;
get_need_exp(11) -> 210;
get_need_exp(12) -> 210;
get_need_exp(13) -> 240;
get_need_exp(14) -> 240;
get_need_exp(15) -> 270;
get_need_exp(16) -> 270;
get_need_exp(17) -> 300;
get_need_exp(18) -> 360;
get_need_exp(19) -> 420;
get_need_exp(20) -> 480;
get_need_exp(21) -> 540;
get_need_exp(22) -> 9999;
get_need_exp(_Info) ->
    logger:data_error("get_need_exp_data_not_exist===>~w",
		      [_Info], arena_elite_data, 290),
    undefined.

get_init_exp(1) -> {0, 1};
get_init_exp(2) -> {18, 1};
get_init_exp(3) -> {27, 1};
get_init_exp(4) -> {27, 1};
get_init_exp(5) -> {36, 1};
get_init_exp(6) -> {36, 1};
get_init_exp(7) -> {45, 1};
get_init_exp(8) -> {45, 1};
get_init_exp(9) -> {54, 1};
get_init_exp(10) -> {54, 1};
get_init_exp(11) -> {63, 1};
get_init_exp(12) -> {63, 1};
get_init_exp(13) -> {72, 1};
get_init_exp(14) -> {72, 1};
get_init_exp(15) -> {81, 1};
get_init_exp(16) -> {81, 1};
get_init_exp(17) -> {90, 1};
get_init_exp(18) -> {108, 1};
get_init_exp(19) -> {126, 1};
get_init_exp(20) -> {144, 1};
get_init_exp(21) -> {162, 1};
get_init_exp(22) -> {300, 0};
get_init_exp(_Info) ->
    logger:data_error("get_init_exp_data_not_exist===>~w",
		      [_Info], arena_elite_data, 314),
    undefined.

get_del_exp(1) -> 15;
get_del_exp(2) -> 15;
get_del_exp(3) -> 15;
get_del_exp(4) -> 15;
get_del_exp(5) -> 15;
get_del_exp(6) -> 15;
get_del_exp(7) -> 15;
get_del_exp(8) -> 15;
get_del_exp(9) -> 15;
get_del_exp(10) -> 15;
get_del_exp(11) -> 15;
get_del_exp(12) -> 15;
get_del_exp(13) -> 15;
get_del_exp(14) -> 15;
get_del_exp(15) -> 15;
get_del_exp(16) -> 15;
get_del_exp(17) -> 15;
get_del_exp(18) -> 15;
get_del_exp(19) -> 15;
get_del_exp(20) -> 15;
get_del_exp(21) -> 15;
get_del_exp(22) -> 15;
get_del_exp(_Info) ->
    logger:data_error("get_del_exp_data_not_exist===>~w",
		      [_Info], arena_elite_data, 338),
    undefined.

get_next_lev(1) -> 2;
get_next_lev(2) -> 3;
get_next_lev(3) -> 4;
get_next_lev(4) -> 5;
get_next_lev(5) -> 6;
get_next_lev(6) -> 7;
get_next_lev(7) -> 8;
get_next_lev(8) -> 9;
get_next_lev(9) -> 10;
get_next_lev(10) -> 11;
get_next_lev(11) -> 12;
get_next_lev(12) -> 13;
get_next_lev(13) -> 14;
get_next_lev(14) -> 15;
get_next_lev(15) -> 16;
get_next_lev(16) -> 17;
get_next_lev(17) -> 18;
get_next_lev(18) -> 19;
get_next_lev(19) -> 20;
get_next_lev(20) -> 21;
get_next_lev(21) -> 22;
get_next_lev(_Info) ->
    logger:data_error("get_next_lev_data_not_exist===>~w",
		      [_Info], arena_elite_data, 361),
    undefined.

get_macth_limit_score(1) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(2) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(3) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(4) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(5) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(6) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(7) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(8) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(9) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(10) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(11) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(12) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(13) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(14) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(15) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(16) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(17) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(18) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(19) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(20) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(21) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(22) ->
    [{1, -50, 50}, {2, -80, 80}, {3, -200, 200},
     {4, -300, 300}, {5, -500, 500}, {6, -600, 600},
     {7, -700, 700}, {8, -800, 800}, {9, -900, 900},
     {10, -1000, 1000}];
get_macth_limit_score(_Info) ->
    logger:data_error("get_macth_limit_score_data_not_exist===>~w",
		      [_Info], arena_elite_data, 385),
    undefined.

get_macth_limit_match_power(1) ->
    [{1, -100, -50}, {2, -120, -30}, {3, -150, -20},
     {4, -200, 0}, {5, -200, 200}, {6, -300, 300},
     {7, -400, 400}, {8, -500, 500}, {9, -800, 800},
     {10, -1000, 1000}];
get_macth_limit_match_power(2) ->
    [{1, -100, -50}, {2, -120, -30}, {3, -150, -20},
     {4, -200, 0}, {5, -200, 200}, {6, -300, 300},
     {7, -400, 400}, {8, -500, 500}, {9, -800, 800},
     {10, -1000, 1000}];
get_macth_limit_match_power(3) ->
    [{1, -100, -50}, {2, -120, -30}, {3, -150, -20},
     {4, -200, 0}, {5, -200, 200}, {6, -300, 300},
     {7, -400, 400}, {8, -500, 500}, {9, -800, 800},
     {10, -1000, 1000}];
get_macth_limit_match_power(4) ->
    [{1, -80, -40}, {2, -120, -30}, {3, -150, -20},
     {4, -200, 0}, {5, -200, 200}, {6, -300, 300},
     {7, -400, 400}, {8, -500, 500}, {9, -800, 800},
     {10, -1000, 1000}];
get_macth_limit_match_power(5) ->
    [{1, -60, -20}, {2, -100, -20}, {3, -150, -10},
     {4, -200, 0}, {5, -200, 200}, {6, -300, 300},
     {7, -400, 400}, {8, -500, 500}, {9, -800, 800},
     {10, -1000, 1000}];
get_macth_limit_match_power(6) ->
    [{1, -30, 0}, {2, -80, 10}, {3, -150, 20},
     {4, -200, 40}, {5, -200, 200}, {6, -300, 300},
     {7, -400, 400}, {8, -500, 500}, {9, -800, 800},
     {10, -1000, 1000}];
get_macth_limit_match_power(7) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(8) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(9) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(10) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(11) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(12) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(13) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(14) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(15) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(16) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(17) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(18) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(19) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(20) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(21) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(22) ->
    [{1, -20, 10}, {2, -40, 20}, {3, -60, 30}, {4, -80, 40},
     {5, -100, 100}, {6, -200, 200}, {7, -300, 300},
     {8, -400, 400}, {9, -500, 500}, {10, -1000, 1000}];
get_macth_limit_match_power(_Info) ->
    logger:data_error("get_macth_limit_match_power_data_not_exist===>~w",
		      [_Info], arena_elite_data, 409),
    undefined.

get_macth_limit_power(_) -> undefined.

get_combat_award1(1) -> [{27, 40}];
get_combat_award1(2) -> [{27, 40}];
get_combat_award1(3) -> [{27, 45}];
get_combat_award1(4) -> [{27, 45}];
get_combat_award1(5) -> [{27, 45}];
get_combat_award1(6) -> [{27, 45}];
get_combat_award1(7) -> [{27, 50}];
get_combat_award1(8) -> [{27, 50}];
get_combat_award1(9) -> [{27, 50}];
get_combat_award1(10) -> [{27, 55}];
get_combat_award1(11) -> [{27, 55}];
get_combat_award1(12) -> [{27, 55}];
get_combat_award1(13) -> [{27, 55}];
get_combat_award1(14) -> [{27, 60}];
get_combat_award1(15) -> [{27, 60}];
get_combat_award1(16) -> [{27, 60}];
get_combat_award1(17) -> [{27, 60}];
get_combat_award1(18) -> [{27, 100}];
get_combat_award1(19) -> [{27, 100}];
get_combat_award1(20) -> [{27, 100}];
get_combat_award1(21) -> [{27, 100}];
get_combat_award1(22) -> [{27, 100}];
get_combat_award1(_Info) ->
    logger:data_error("get_combat_award1_data_not_exist===>~w",
		      [_Info], arena_elite_data, 436),
    undefined.

get_combat_award2(1) -> [{27, 20}];
get_combat_award2(2) -> [{27, 24}];
get_combat_award2(3) -> [{27, 27}];
get_combat_award2(4) -> [{27, 27}];
get_combat_award2(5) -> [{27, 27}];
get_combat_award2(6) -> [{27, 27}];
get_combat_award2(7) -> [{27, 30}];
get_combat_award2(8) -> [{27, 30}];
get_combat_award2(9) -> [{27, 30}];
get_combat_award2(10) -> [{27, 33}];
get_combat_award2(11) -> [{27, 33}];
get_combat_award2(12) -> [{27, 33}];
get_combat_award2(13) -> [{27, 33}];
get_combat_award2(14) -> [{27, 36}];
get_combat_award2(15) -> [{27, 36}];
get_combat_award2(16) -> [{27, 36}];
get_combat_award2(17) -> [{27, 36}];
get_combat_award2(18) -> [{27, 60}];
get_combat_award2(19) -> [{27, 60}];
get_combat_award2(20) -> [{27, 60}];
get_combat_award2(21) -> [{27, 60}];
get_combat_award2(22) -> [{27, 60}];
get_combat_award2(_Info) ->
    logger:data_error("get_combat_award2_data_not_exist===>~w",
		      [_Info], arena_elite_data, 460),
    undefined.

get_combat_award3(1) -> [{27, 40}];
get_combat_award3(2) -> [{27, 40}];
get_combat_award3(3) -> [{27, 45}];
get_combat_award3(4) -> [{27, 45}];
get_combat_award3(5) -> [{27, 45}];
get_combat_award3(6) -> [{27, 45}];
get_combat_award3(7) -> [{27, 50}];
get_combat_award3(8) -> [{27, 50}];
get_combat_award3(9) -> [{27, 50}];
get_combat_award3(10) -> [{27, 55}];
get_combat_award3(11) -> [{27, 55}];
get_combat_award3(12) -> [{27, 55}];
get_combat_award3(13) -> [{27, 55}];
get_combat_award3(14) -> [{27, 60}];
get_combat_award3(15) -> [{27, 60}];
get_combat_award3(16) -> [{27, 60}];
get_combat_award3(17) -> [{27, 60}];
get_combat_award3(18) -> [{27, 70}];
get_combat_award3(19) -> [{27, 70}];
get_combat_award3(20) -> [{27, 70}];
get_combat_award3(21) -> [{27, 70}];
get_combat_award3(22) -> [{27, 70}];
get_combat_award3(_Info) ->
    logger:data_error("get_combat_award3_data_not_exist===>~w",
		      [_Info], arena_elite_data, 484),
    undefined.

get_combat_award4(1) -> [{27, 20}];
get_combat_award4(2) -> [{27, 24}];
get_combat_award4(3) -> [{27, 27}];
get_combat_award4(4) -> [{27, 27}];
get_combat_award4(5) -> [{27, 27}];
get_combat_award4(6) -> [{27, 27}];
get_combat_award4(7) -> [{27, 30}];
get_combat_award4(8) -> [{27, 30}];
get_combat_award4(9) -> [{27, 30}];
get_combat_award4(10) -> [{27, 33}];
get_combat_award4(11) -> [{27, 33}];
get_combat_award4(12) -> [{27, 33}];
get_combat_award4(13) -> [{27, 33}];
get_combat_award4(14) -> [{27, 36}];
get_combat_award4(15) -> [{27, 36}];
get_combat_award4(16) -> [{27, 36}];
get_combat_award4(17) -> [{27, 36}];
get_combat_award4(18) -> [{27, 42}];
get_combat_award4(19) -> [{27, 42}];
get_combat_award4(20) -> [{27, 42}];
get_combat_award4(21) -> [{27, 42}];
get_combat_award4(22) -> [{27, 42}];
get_combat_award4(_Info) ->
    logger:data_error("get_combat_award4_data_not_exist===>~w",
		      [_Info], arena_elite_data, 508),
    undefined.

get_combat_drop_id1(1) -> [80001];
get_combat_drop_id1(2) -> [80001];
get_combat_drop_id1(3) -> [80001];
get_combat_drop_id1(4) -> [80001];
get_combat_drop_id1(5) -> [80001];
get_combat_drop_id1(6) -> [80001];
get_combat_drop_id1(7) -> [80001];
get_combat_drop_id1(8) -> [80001];
get_combat_drop_id1(9) -> [80001];
get_combat_drop_id1(10) -> [80001];
get_combat_drop_id1(11) -> [80001];
get_combat_drop_id1(12) -> [80001];
get_combat_drop_id1(13) -> [80001];
get_combat_drop_id1(14) -> [80001];
get_combat_drop_id1(15) -> [80001];
get_combat_drop_id1(16) -> [80001];
get_combat_drop_id1(17) -> [80001];
get_combat_drop_id1(18) -> [80001];
get_combat_drop_id1(19) -> [80001];
get_combat_drop_id1(20) -> [80001];
get_combat_drop_id1(21) -> [80001];
get_combat_drop_id1(22) -> [80001];
get_combat_drop_id1(_) -> [].

get_combat_drop_id2(1) -> [80002];
get_combat_drop_id2(2) -> [80002];
get_combat_drop_id2(3) -> [80002];
get_combat_drop_id2(4) -> [80002];
get_combat_drop_id2(5) -> [80002];
get_combat_drop_id2(6) -> [80002];
get_combat_drop_id2(7) -> [80002];
get_combat_drop_id2(8) -> [80002];
get_combat_drop_id2(9) -> [80002];
get_combat_drop_id2(10) -> [80002];
get_combat_drop_id2(11) -> [80002];
get_combat_drop_id2(12) -> [80002];
get_combat_drop_id2(13) -> [80002];
get_combat_drop_id2(14) -> [80002];
get_combat_drop_id2(15) -> [80002];
get_combat_drop_id2(16) -> [80002];
get_combat_drop_id2(17) -> [80002];
get_combat_drop_id2(18) -> [80002];
get_combat_drop_id2(19) -> [80002];
get_combat_drop_id2(20) -> [80002];
get_combat_drop_id2(21) -> [80002];
get_combat_drop_id2(22) -> [80002];
get_combat_drop_id2(_) -> [].

get_combat_drop_id3(1) -> [80011];
get_combat_drop_id3(2) -> [80011];
get_combat_drop_id3(3) -> [80011];
get_combat_drop_id3(4) -> [80011];
get_combat_drop_id3(5) -> [80011];
get_combat_drop_id3(6) -> [80011];
get_combat_drop_id3(7) -> [80011];
get_combat_drop_id3(8) -> [80011];
get_combat_drop_id3(9) -> [80011];
get_combat_drop_id3(10) -> [80011];
get_combat_drop_id3(11) -> [80011];
get_combat_drop_id3(12) -> [80011];
get_combat_drop_id3(13) -> [80011];
get_combat_drop_id3(14) -> [80011];
get_combat_drop_id3(15) -> [80011];
get_combat_drop_id3(16) -> [80011];
get_combat_drop_id3(17) -> [80011];
get_combat_drop_id3(18) -> [80011];
get_combat_drop_id3(19) -> [80011];
get_combat_drop_id3(20) -> [80011];
get_combat_drop_id3(21) -> [80011];
get_combat_drop_id3(22) -> [80011];
get_combat_drop_id3(_) -> [].

get_combat_drop_id4(1) -> [80012];
get_combat_drop_id4(2) -> [80012];
get_combat_drop_id4(3) -> [80012];
get_combat_drop_id4(4) -> [80012];
get_combat_drop_id4(5) -> [80012];
get_combat_drop_id4(6) -> [80012];
get_combat_drop_id4(7) -> [80012];
get_combat_drop_id4(8) -> [80012];
get_combat_drop_id4(9) -> [80012];
get_combat_drop_id4(10) -> [80012];
get_combat_drop_id4(11) -> [80012];
get_combat_drop_id4(12) -> [80012];
get_combat_drop_id4(13) -> [80012];
get_combat_drop_id4(14) -> [80012];
get_combat_drop_id4(15) -> [80012];
get_combat_drop_id4(16) -> [80012];
get_combat_drop_id4(17) -> [80012];
get_combat_drop_id4(18) -> [80012];
get_combat_drop_id4(19) -> [80012];
get_combat_drop_id4(20) -> [80012];
get_combat_drop_id4(21) -> [80012];
get_combat_drop_id4(22) -> [80012];
get_combat_drop_id4(_) -> [].

get_hallows_look(22) -> 3;
get_hallows_look(_) -> 0.

get_avatar_id(20) -> 2500;
get_avatar_id(21) -> 2500;
get_avatar_id(22) -> 2500;
get_avatar_id(_) -> 0.

get_honor_id(1) -> 91101;
get_honor_id(2) -> 91102;
get_honor_id(3) -> 91102;
get_honor_id(4) -> 91103;
get_honor_id(5) -> 91103;
get_honor_id(6) -> 91103;
get_honor_id(_) -> 0.

get_rank_limit_lev(1) -> 18;
get_rank_limit_lev(2) -> 18;
get_rank_limit_lev(3) -> 18;
get_rank_limit_lev(4) -> 18;
get_rank_limit_lev(5) -> 18;
get_rank_limit_lev(6) -> 18;
get_rank_limit_lev(_) -> 0.

init_manifesto() ->
    [{19, "E24209"}, {18, "E24208"}, {17, "E24207"},
     {16, "E24206"}, {15, "E24205"}, {14, "E24204"},
     {13, "E24203"}, {12, "E24202"}, {11, "E24201"},
     {10, "E24200"}, {9, "E24199"}, {8, "E24198"},
     {7, "E24197"}, {6, "E24196"}, {5, "E24195"},
     {4, "E24194"}, {3, "E24193"}, {2, "E24192"},
     {1, "E24191"}].

get_cd_time(1) -> 0;
get_cd_time(2) -> 0;
get_cd_time(3) -> 0;
get_cd_time(4) -> 0;
get_cd_time(5) -> 0;
get_cd_time(6) -> 0;
get_cd_time(7) -> 0;
get_cd_time(8) -> 0;
get_cd_time(9) -> 0;
get_cd_time(10) -> 0;
get_cd_time(_) -> 120.

get_buy_count(1) -> {[{3, 50}], 0};
get_buy_count(2) -> {[{3, 50}], 2};
get_buy_count(3) -> {[{3, 50}], 3};
get_buy_count(4) -> {[{3, 100}], 4};
get_buy_count(5) -> {[{3, 150}], 5};
get_buy_count(6) -> {[{3, 150}], 5};
get_buy_count(7) -> {[{3, 150}], 5};
get_buy_count(8) -> {[{3, 150}], 5};
get_buy_count(9) -> {[{3, 150}], 5};
get_buy_count(10) -> {[{3, 150}], 5};
get_buy_count(_Info) ->
    logger:data_error("get_buy_count_data_not_exist===>~w",
		      [_Info], arena_elite_data, 654),
    undefined.

get_targer_score(Power)
    when Power >= 0 andalso Power =< 149999 ->
    1510;
get_targer_score(Power)
    when Power >= 150000 andalso Power =< 199999 ->
    1510;
get_targer_score(Power)
    when Power >= 200000 andalso Power =< 249999 ->
    1510;
get_targer_score(Power)
    when Power >= 250000 andalso Power =< 299999 ->
    1510;
get_targer_score(Power)
    when Power >= 300000 andalso Power =< 349999 ->
    1510;
get_targer_score(Power)
    when Power >= 350000 andalso Power =< 399999 ->
    1510;
get_targer_score(Power)
    when Power >= 400000 andalso Power =< 449999 ->
    1510;
get_targer_score(Power)
    when Power >= 450000 andalso Power =< 499999 ->
    1660;
get_targer_score(Power)
    when Power >= 500000 andalso Power =< 549999 ->
    1810;
get_targer_score(Power)
    when Power >= 550000 andalso Power =< 599999 ->
    1990;
get_targer_score(Power)
    when Power >= 600000 andalso Power =< 649999 ->
    2170;
get_targer_score(Power)
    when Power >= 650000 andalso Power =< 699999 ->
    2380;
get_targer_score(Power)
    when Power >= 700000 andalso Power =< 799999 ->
    2590;
get_targer_score(Power)
    when Power >= 800000 andalso Power =< 899999 ->
    2830;
get_targer_score(Power)
    when Power >= 900000 andalso Power =< 999999 ->
    3070;
get_targer_score(Power)
    when Power >= 1000000 andalso Power =< 1099999 ->
    3340;
get_targer_score(Power)
    when Power >= 1100000 andalso Power =< 1199999 ->
    3610;
get_targer_score(Power)
    when Power >= 1200000 andalso Power =< 1399999 ->
    3910;
get_targer_score(Power)
    when Power >= 1400000 andalso Power =< 1599999 ->
    4270;
get_targer_score(Power)
    when Power >= 1600000 andalso Power =< 1799999 ->
    4690;
get_targer_score(Power)
    when Power >= 1800000 andalso Power =< 1999999 ->
    5170;
get_targer_score(Power)
    when Power >= 2000000 andalso Power =< 9999999999 ->
    5710;
get_targer_score(_Info) ->
    logger:data_error("get_targer_score_data_not_exist===>~w",
		      [_Info], arena_elite_data, 678),
    undefined.

get_rank_award(Rank) when Rank >= 1 andalso Rank =< 1 ->
    [{27, 10000}, {72001, 300}];
get_rank_award(Rank) when Rank >= 2 andalso Rank =< 2 ->
    [{27, 8500}, {72001, 260}];
get_rank_award(Rank) when Rank >= 3 andalso Rank =< 3 ->
    [{27, 7000}, {72001, 220}];
get_rank_award(Rank) when Rank >= 4 andalso Rank =< 5 ->
    [{27, 6000}, {72001, 180}];
get_rank_award(Rank)
    when Rank >= 6 andalso Rank =< 10 ->
    [{27, 5500}, {72001, 160}];
get_rank_award(Rank)
    when Rank >= 11 andalso Rank =< 20 ->
    [{27, 5000}, {72001, 140}];
get_rank_award(Rank)
    when Rank >= 21 andalso Rank =< 50 ->
    [{27, 4500}, {72001, 120}];
get_rank_award(Rank)
    when Rank >= 51 andalso Rank =< 100 ->
    [{27, 4000}, {72001, 100}];
get_rank_award(_) -> undefined.

get_rank_hallows(Rank)
    when Rank >= 1 andalso Rank =< 1 ->
    3;
get_rank_hallows(Rank)
    when Rank >= 2 andalso Rank =< 2 ->
    3;
get_rank_hallows(Rank)
    when Rank >= 3 andalso Rank =< 3 ->
    3;
get_rank_hallows(Rank)
    when Rank >= 4 andalso Rank =< 5 ->
    1;
get_rank_hallows(Rank)
    when Rank >= 6 andalso Rank =< 10 ->
    1;
get_rank_hallows(Rank)
    when Rank >= 11 andalso Rank =< 20 ->
    0;
get_rank_hallows(Rank)
    when Rank >= 21 andalso Rank =< 50 ->
    0;
get_rank_hallows(Rank)
    when Rank >= 51 andalso Rank =< 100 ->
    0;
get_rank_hallows(_) -> 0.

get_rank_award_limit(Rank)
    when Rank >= 1 andalso Rank =< 1 ->
    18;
get_rank_award_limit(Rank)
    when Rank >= 2 andalso Rank =< 2 ->
    18;
get_rank_award_limit(Rank)
    when Rank >= 3 andalso Rank =< 3 ->
    18;
get_rank_award_limit(Rank)
    when Rank >= 4 andalso Rank =< 5 ->
    18;
get_rank_award_limit(Rank)
    when Rank >= 6 andalso Rank =< 10 ->
    18;
get_rank_award_limit(Rank)
    when Rank >= 11 andalso Rank =< 20 ->
    18;
get_rank_award_limit(Rank)
    when Rank >= 21 andalso Rank =< 50 ->
    18;
get_rank_award_limit(Rank)
    when Rank >= 51 andalso Rank =< 100 ->
    18;
get_rank_award_limit(_) -> 0.


