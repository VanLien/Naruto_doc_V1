-file("data/partner_rpc.erl", 1).

-file("src/mod/partner/partner_rpc.erl", 1).

-module(partner_rpc).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{item_make_args, [base_id, bind, quantity, step, flag]},
		{item,
		 [ver, id, base_id, bind, look_id, type, quality, craft,
		  step, quantity, pos, expire_type, expire_time, enchant,
		  fail_enchant, attr, main_attr, extra_attr, score,
		  all_score, extra, data, price, set_id, career,
		  gemstones, star_lev, break_count, holy_eqm_attr]},
		{item_base,
		 [id, name, type, quality, overlap, use_type, gain_type,
		  expire_type, expire_time, condition, effect, attr,
		  value, lev, career, sex, ext, attr_type, eqm_jie,
		  add_num, can_share, eqm_set, use_count]},
		{group_attr, [atk, hp_max, def, speed]},
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
		  res_p, dam_s, res_s, tenacity]},
		{map_role,
		 [pid, rid, srv_id, name, conn_pid, map, grid_pid, speed,
		  x, y, dir, gx, gy, status, event, label, lev, sex,
		  career, face, fc, avatar, looks]},
		{role_robot,
		 [id, account, platform, zone_id, channel, name, gid,
		  gname, lev, power, sex, career, face_id, face_file,
		  face_update_time, avatar_bid, avatar_frames, say_frames,
		  vip_lev, pos_info, partners, m_formation, sign, city,
		  max_dun_id, m_star, auto_pk, m_hallows, max_star_tower,
		  elite_lev, is_show_vip, arena_elite_defens, m_halidom,
		  m_guild_skill, arena_elite_manifesto,
		  arena_cluster_formation, city_id, honor, honor_badges,
		  honor_point, use_badges, fanse_list, grow_info,
		  room_bbs_set, backdrop_id, is_open_home, soft,
		  max_power, m_resonate_lev, m_sprite_tree,
		  m_arena_peak_champion, look_id, holiday_nian_face]},
		{role,
		 [ver, id, need_sync, loop_counter, type, pid, link,
		  reg_ip, reg_time, trigger, status, s_event, s_event_pid,
		  combat_pid, combat_replay_pid, combat_type_list,
		  ui_combat_type, play_speed, is_in_backstage, is_auto,
		  is_gain, is_ready, is_online, device_type, getui_cid,
		  channel, reg_channel, idfa, reg_idfa, device_id,
		  reg_device_id, os_name, reg_os_name, app_name,
		  reg_app_name, package_name, reg_package_name,
		  package_ver, reg_package_ver, os_ver, carrier_name,
		  net_type, resolution, platform, zone_id, account, name,
		  s_name, career, lev, uplev_time, sex, face_id,
		  face_list, hp, mspd, power, max_power, max_power_time,
		  arena_power, arena_max_power, arena_max_power_time,
		  banned_time, interdict_time, capacity, identity,
		  data_lock, timer, item_next_id, signature, city, assets,
		  pos, game_set, s_looks, login, misc, guild_bag,
		  surface_bag, partner_bag, m_look, m_charge, m_vip,
		  m_var, m_quest, m_drama, m_friend, m_mail, m_formation,
		  m_arena, m_feat, m_checkin, m_exchange, m_buff,
		  m_avatar, m_say, m_dungeon, m_boss, m_recruit, m_honor,
		  m_adventure, m_lev_gift, m_power_gift, m_star,
		  m_star_tower, m_market_silver, m_wish, m_login_days,
		  m_month_card, m_guild_dun, m_star_divination,
		  m_guild_skill, m_media_card_type, m_endless, m_dial,
		  m_days_ranks, m_escort, m_dun_stone, m_hallows,
		  m_day_goals, m_guild_quest, m_recruit_award,
		  m_sky_ladder, m_convert, m_shipping, m_expedition,
		  m_star_gift, holiday_assets, m_privilege, m_month_fund,
		  m_lanterm_festival, m_lanterm_adventure, m_invite_code,
		  misc_ext, m_arena_elite, arena_elite_power,
		  arena_elite_power_time, m_element_temple, m_halidom,
		  m_holiday_dial, arena_elite_max_star, m_break_egg,
		  m_welfare, m_dun_heaven, m_holiday_boss, m_war_order,
		  m_holiday_holy, m_week_card, m_holy_eqm_set,
		  m_arena_cluster, m_holiday_snatch, m_holiday_accumulate,
		  m_room, m_room_feat, m_holiday_boss_new,
		  m_holiday_return_feat, m_holiday_return_sign,
		  m_holiday_return, m_room_grow, m_lanterm_adventure1,
		  m_lanterm_adventure2, m_lanterm_adventure3, m_home,
		  m_home_pet, pet_bag, backdrop_id, backdrop_list,
		  m_holiday_predict, m_holiday_personal_gift, m_resonate,
		  m_resonate_extract, m_sprite_hatch, m_sprite_tree,
		  m_holiday_term_begins, m_holiday_petard, m_encounter,
		  m_holiday_merge_goal, m_arena_team, m_monopoly_maps,
		  m_training_camp, m_weekly, m_arena_peak_champion,
		  m_arena_elite_war_order, m_holiday_fire_gift,
		  m_holiday_personal_fire_gift, m_secret_dun,
		  m_holiday_return_new, m_holiday_charge_rebate,
		  m_holiday_charge_reset, m_holiday_optional_lottery,
		  m_holiday_lucky_dog, m_holiday_nian,
		  m_holiday_time_award, m_holiday_valentines, m_planes,
		  m_planes_war_order, m_new_war_order, m_face,
		  m_subscriber, m_holiday_dime, m_holiday_valentine_boss,
		  m_personal_push, m_holiday_new_week_card,
		  m_holiday_arena_team, m_holiday_practise_tower, p_bag,
		  p_eqm, p_home]}]).

-export([handle/3]).

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

-file("src/mod/partner/partner_rpc.erl", 10).

-file("inc/role.hrl", 1).

-record(role,
	{ver = 78, id = {0, <<>>}, need_sync = 0,
	 loop_counter = 0, type = robot, pid, link, reg_ip,
	 reg_time = 0,
	 trigger = {1, []}  :: {pos_integer(), [tuple()]},
	 status = 0, s_event = 0, s_event_pid, combat_pid = 0,
	 combat_replay_pid = 0, combat_type_list = [],
	 ui_combat_type = 0, play_speed = 1,
	 is_in_backstage = false, is_auto = 0, is_gain = 0,
	 is_ready, is_online = 0, device_type = <<>>,
	 getui_cid = <<>>, channel = <<>>, reg_channel = <<>>,
	 idfa = <<>>, reg_idfa = <<>>, device_id = <<>>,
	 reg_device_id = <<>>, os_name = <<>>,
	 reg_os_name = <<>>, app_name = <<>>,
	 reg_app_name = <<>>, package_name = <<>>,
	 reg_package_name = <<>>, package_ver = <<>>,
	 reg_package_ver = <<>>, os_ver = <<>>,
	 carrier_name = <<>>, net_type = <<>>, resolution = <<>>,
	 platform = <<>>, zone_id = 0  :: non_neg_integer(),
	 account = <<>>, name = <<>>, s_name = 0, career = 0,
	 lev = 1, uplev_time = 0, sex = 0, face_id = 0,
	 face_list = [], hp = 0, mspd = 25, power = 0,
	 max_power = 0, max_power_time = 0, arena_power = 0,
	 arena_max_power = 0, arena_max_power_time = 0,
	 banned_time = 0, interdict_time = 0, capacity = 0,
	 identity = <<>>, data_lock = 0, timer, item_next_id = 1,
	 signature = <<>>, city = 0, assets, pos, game_set,
	 s_looks = []  ::
	     [{non_neg_integer(), non_neg_integer(),
	       non_neg_integer(), bitstring()}],
	 login, misc, guild_bag, surface_bag, partner_bag,
	 m_look, m_charge, m_vip, m_var, m_quest, m_drama,
	 m_friend, m_mail = [], m_formation, m_arena, m_feat,
	 m_checkin, m_exchange, m_buff, m_avatar, m_say,
	 m_dungeon, m_boss, m_recruit, m_honor, m_adventure,
	 m_lev_gift, m_power_gift, m_star, m_star_tower,
	 m_market_silver, m_wish, m_login_days, m_month_card,
	 m_guild_dun, m_star_divination, m_guild_skill,
	 m_media_card_type = [], m_endless, m_dial, m_days_ranks,
	 m_escort, m_dun_stone, m_hallows, m_day_goals,
	 m_guild_quest, m_recruit_award, m_sky_ladder, m_convert,
	 m_shipping, m_expedition, m_star_gift,
	 holiday_assets = [], m_privilege, m_month_fund,
	 m_lanterm_festival, m_lanterm_adventure, m_invite_code,
	 misc_ext, m_arena_elite, arena_elite_power = 0,
	 arena_elite_power_time = 0, m_element_temple, m_halidom,
	 m_holiday_dial, arena_elite_max_star = 0, m_break_egg,
	 m_welfare, m_dun_heaven, m_holiday_boss, m_war_order,
	 m_holiday_holy, m_week_card, m_holy_eqm_set,
	 m_arena_cluster, m_holiday_snatch, m_holiday_accumulate,
	 m_room, m_room_feat, m_holiday_boss_new,
	 m_holiday_return_feat, m_holiday_return_sign,
	 m_holiday_return, m_room_grow, m_lanterm_adventure1,
	 m_lanterm_adventure2, m_lanterm_adventure3, m_home,
	 m_home_pet, pet_bag, backdrop_id = 0,
	 backdrop_list = [], m_holiday_predict,
	 m_holiday_personal_gift, m_resonate, m_resonate_extract,
	 m_sprite_hatch, m_sprite_tree, m_holiday_term_begins,
	 m_holiday_petard, m_encounter, m_holiday_merge_goal,
	 m_arena_team, m_monopoly_maps, m_training_camp,
	 m_weekly, m_arena_peak_champion,
	 m_arena_elite_war_order, m_holiday_fire_gift,
	 m_holiday_personal_fire_gift, m_secret_dun,
	 m_holiday_return_new, m_holiday_charge_rebate,
	 m_holiday_charge_reset, m_holiday_optional_lottery,
	 m_holiday_lucky_dog, m_holiday_nian,
	 m_holiday_time_award, m_holiday_valentines, m_planes,
	 m_planes_war_order, m_new_war_order, m_face,
	 m_subscriber, m_holiday_dime, m_holiday_valentine_boss,
	 m_personal_push, m_holiday_new_week_card,
	 m_holiday_arena_team, m_holiday_practise_tower, p_bag,
	 p_eqm, p_home}).

-record(role_robot,
	{id = {0, <<>>}, account = <<>>, platform = <<>>,
	 zone_id = 0, channel = <<>>, name = <<>>,
	 gid = {0, <<>>}, gname = <<>>, lev = 0, power = 0,
	 sex = 0, career = 0, face_id = 0, face_file = <<>>,
	 face_update_time = 0, avatar_bid = 0,
	 avatar_frames = [], say_frames = [], vip_lev = 0,
	 pos_info = [], partners = [], m_formation = [],
	 sign = <<>>, city = 0, max_dun_id = 0, m_star,
	 auto_pk = 0, m_hallows, max_star_tower = 0,
	 elite_lev = 0, is_show_vip = 0, arena_elite_defens = [],
	 m_halidom, m_guild_skill, arena_elite_manifesto = [],
	 arena_cluster_formation = [], city_id = 0, honor = 0,
	 honor_badges = [], honor_point = 0, use_badges = [],
	 fanse_list = [], grow_info = [], room_bbs_set = 1,
	 backdrop_id = 0, is_open_home = 0, soft = 0,
	 max_power = 0, m_resonate_lev = 0, m_sprite_tree,
	 m_arena_peak_champion, look_id = 0,
	 holiday_nian_face = []}).

-record(map_role,
	{pid  :: undefined | pid(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 conn_pid  :: undefined | pid(),
	 map = 0  :: non_neg_integer(), grid_pid  :: pid(),
	 speed = 1  :: pos_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 dir = 0  :: non_neg_integer(),
	 gx = 0  :: non_neg_integer(),
	 gy = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 event = 0  :: non_neg_integer(), label = 0  :: 0..2,
	 lev = 1  :: pos_integer(), sex = 0  :: 0..2,
	 career = 0  :: non_neg_integer(),
	 face = 1  :: pos_integer(),
	 fc = 0  :: non_neg_integer(),
	 avatar = 0  :: non_neg_integer(),
	 looks = []  :: list()}).

-file("src/mod/partner/partner_rpc.erl", 11).

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

-file("src/mod/partner/partner_rpc.erl", 12).

-file("inc/item.hrl", 1).

-record(item_base,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 type = 0  :: non_neg_integer(), quality = 0  :: 0..4,
	 overlap = 1  :: pos_integer(), use_type = 0  :: 0..4,
	 gain_type = 0  :: non_neg_integer(),
	 expire_type = 0  :: non_neg_integer(),
	 expire_time = 0  ::
	     non_neg_integer() |
	     {{pos_integer(), pos_integer(), pos_integer()},
	      {non_neg_integer(), non_neg_integer(),
	       non_neg_integer()}},
	 condition = []  :: [tuple()], effect = []  :: [tuple()],
	 attr = []  :: [tuple()], value = []  :: [tuple()],
	 lev = 0, career = 0, sex = 2, ext = [],
	 attr_type = 1  :: pos_integer(), eqm_jie = 0,
	 add_num = 0, can_share = 0, eqm_set = 0,
	 use_count = 0}).

-record(item,
	{ver = 3  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(),
	 base_id = 0  :: non_neg_integer(), bind = 1  :: 0 | 1,
	 look_id = 0, type = 0  :: non_neg_integer(),
	 quality = 0  :: 0..4, craft = 0  :: 0..5,
	 step = 0  :: pos_integer(), quantity = 1  :: 0..250,
	 pos = 0  :: non_neg_integer(), expire_type = 0  :: 0..4,
	 expire_time = 0  :: non_neg_integer(),
	 enchant = 0  :: integer(),
	 fail_enchant = 0  :: non_neg_integer(),
	 attr = []  :: [tuple()], main_attr = [],
	 extra_attr = [], score = 0, all_score = 0,
	 extra = []  :: [tuple()], data = []  :: [any()],
	 price = 0, set_id = 0  :: pos_integer(),
	 career = 0  :: pos_integer(), gemstones = []  :: list(),
	 star_lev = 0  :: pos_integer(),
	 break_count = 0  :: pos_integer(), holy_eqm_attr = []}).

-record(item_make_args,
	{base_id = 0, bind = 0, quantity = 0, step = 0,
	 flag = default_iflag}).

-file("src/mod/partner/partner_rpc.erl", 13).

-file("inc/var.hrl", 1).

-record(m_var,
	{ver = -1, last_reset_time = 0  :: non_neg_integer(),
	 last_reset_day = {0, 0, 0}  ::
	     {non_neg_integer(), non_neg_integer(),
	      non_neg_integer()},
	 last_reset_five = 0  :: non_neg_integer(),
	 last_reset_week = {0, 0}  ::
	     {non_neg_integer(), non_neg_integer()},
	 last_acc_time = 0  :: non_neg_integer(),
	 acc_time = 0  :: non_neg_integer(),
	 login_charge_count = 0  :: non_neg_integer(),
	 acc_charge_count = 0  :: non_neg_integer(),
	 login_charge_num = 0  :: non_neg_integer(),
	 day_login = 0  :: non_neg_integer(),
	 acc_login_count = 0  :: non_neg_integer(),
	 total_acc_time = 0  :: non_neg_integer(),
	 acc_days = 1  :: non_neg_integer(),
	 best_days = 1  :: non_neg_integer(),
	 now_days = 1  :: non_neg_integer(),
	 month_days = 1  :: non_neg_integer(),
	 day_vars = []  :: [tuple()],
	 five_vars = []  :: [tuple()],
	 week_vars = []  :: [tuple()],
	 month_vars = []  :: [tuple()],
	 timeout_vars = []  :: [tuple()],
	 acc_vars = []  :: [tuple()],
	 other_vars = []  :: [tuple()],
	 week_five_vars = []  :: [tuple()],
	 week_five_time = 0  :: non_neg_integer()}).

-record(role_var,
	{id = {0, "", 0}  :: tuple(), vars = []  :: [tuple()]}).

-file("src/mod/partner/partner_rpc.erl", 14).

handle(11000, {}, Role) ->
    partner:push_all_partner(Role), ok;
handle(11003, {PartnerId}, Role) ->
    case partner:partner_lev_up(Role, PartnerId) of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} -> {reply, {1, <<>>}, NRole}
    end;
handle(11004, {PartnerId}, Role) ->
    role:send_buff_begin(),
    case partner:partner_break(Role, PartnerId) of
      {false, Reason} ->
	  role:send_buff_clean(), {reply, {0, Reason}};
      {ok, NRole} ->
	  role:send_buff_flush(), {reply, {1, <<>>}, NRole}
    end;
handle(11005, {PartnerId, Expend1, Expend2, ItemExpend},
       Role) ->
    case partner:partner_star(Role, PartnerId, Expend1,
			      Expend2, ItemExpend)
	of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} -> {reply, {1, <<>>}, NRole}
    end;
handle(11008, {Bid, Num}, Role) ->
    role:send_buff_begin(),
    case partner:partner_compound(Role, Bid, Num) of
      {false, Msg} ->
	  role:send_buff_clean(), {reply, {0, Msg, []}};
      {ok, NRole, Partners} ->
	  role:send_buff_flush(),
	  {reply, {1, <<>>, Partners}, NRole}
    end;
handle(11009, {}, Role) ->
    case partner:add_max(Role) of
      {false, Msg} -> {reply, {0, Msg, 0, 0}};
      {ok, NRole, Num, BuyNum} ->
	  {reply,
	   {1, lang:get(<<"Mở rộng thành công"/utf8>>), Num,
	    BuyNum},
	   NRole}
    end;
handle(11010, {PartnerId, ItemId}, Role) ->
    role:send_buff_begin(),
    case partner_eqm:dress_eqm(Role, PartnerId, ItemId) of
      {false, Reason} ->
	  role:send_buff_clean(), {reply, {0, Reason}};
      {ok, NRole} ->
	  role:send_buff_flush(), {reply, {1, <<>>}, NRole}
    end;
handle(11011, {PartnerId, PosId}, Role) ->
    case partner_eqm:drop_eqm(Role, PartnerId, PosId) of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} -> {reply, {1, <<>>}, NRole}
    end;
handle(11013, {PartnerId, ItemId}, Role) ->
    case partner_lib:check_open(enchant, Role) of
      {false, Msg} -> {reply, {0, Msg}};
      _ ->
	  role:send_buff_begin(),
	  case partner_eqm:enchant_eqm(Role, PartnerId, ItemId) of
	    {false, Reason} ->
		role:send_buff_clean(), {reply, {0, Reason}};
	    {ok, NRole} ->
		role:send_buff_flush(), {reply, {1, <<>>}, NRole}
	  end
    end;
handle(11014, {PartnerId, Count}, Role) ->
    case partner_lib:check_open(enchant, Role) of
      {false, Msg} -> {reply, {0, Msg}};
      _ ->
	  role:send_buff_begin(),
	  case partner_eqm:auto_enchant_eqm(Role, PartnerId,
					    Count)
	      of
	    {false, Reason} ->
		role:send_buff_clean(), {reply, {0, Reason}};
	    {ok, NRole} ->
		role:send_buff_flush(), {reply, {1, <<>>}, NRole}
	  end
    end;
handle(11015, {PartnerId, Type}, Role) ->
    case partner:lock(Role, PartnerId, 1, Type) of
      {false, Msg} -> {reply, {0, Msg, PartnerId, Type}};
      {ok, NRole} when Type == 1 ->
	  {reply,
	   {1, lang:get(<<"Khóa thành công"/utf8>>), PartnerId,
	    Type},
	   NRole};
      {ok, NRole} when Type == 0 ->
	  {reply,
	   {1, lang:get(<<"Mở khóa thành công"/utf8>>), PartnerId,
	    Type},
	   NRole}
    end;
handle(11016, {PartnerId}, Role) ->
    Attr = partner:next_attr(Role, PartnerId),
    {reply, {Attr}};
handle(11019, {PartnerId, SkinId}, Role) ->
    case partner_skin:use_skin(Role, PartnerId, SkinId) of
      {false, Msg} -> {reply, {0, Msg, PartnerId}};
      {ok, NRole} -> {reply, {1, <<>>, PartnerId}, NRole}
    end;
handle(11020, {}, Role) ->
    partner_skin:get_info(Role), ok;
handle(11025, {}, Role) ->
    partner:push_all_partner2(Role), ok;
handle(11026, {Ids}, Role) ->
    partner:push_all_partner_attr(Role, Ids), ok;
handle(11030, {PartnerId, PosId, ArtifactId, Type},
       Role)
    when Type == 1 ->
    case partner_artifact:dress(Role, PartnerId, PosId,
				ArtifactId)
	of
      {false, Reason} -> {reply, {0, Reason, PartnerId}};
      {ok, NRole} -> {reply, {1, <<>>, PartnerId}, NRole}
    end;
handle(11030, {PartnerId, PosId, _ArtifactId, _},
       Role) ->
    case partner_artifact:drop(Role, PartnerId, PosId) of
      {false, Reason} -> {reply, {0, Reason, PartnerId}};
      {ok, NRole} -> {reply, {1, <<>>, PartnerId}, NRole}
    end;
handle(11032, {PartnerId, Id, Expends}, Role) ->
    case partner_artifact:artifact_star_up(Role, PartnerId,
					   Id, Expends)
	of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} ->
	  {reply,
	   {1, lang:get(<<"Nâng cấp sao thành công"/utf8>>)},
	   NRole}
    end;
handle(11033, {PartnerId, Id, _Locks, LuckItemId},
       Role) ->
    put(partner_artifact_lucky_item_id, LuckItemId),
    case partner_artifact:artifact_ref(PartnerId, Role, Id,
				       LuckItemId)
	of
      {false, Reason} ->
	  erase(partner_artifact_lucky_item_id),
	  {reply, {0, Reason, LuckItemId}};
      {ok, NRole} ->
	  erase(partner_artifact_lucky_item_id),
	  {reply,
	   {1, lang:get(<<"Đúc lại thành công"/utf8>>),
	    LuckItemId},
	   NRole}
    end;
handle(11034, {PartnerId, Id, Type}, Role) ->
    case partner_artifact:artifact_ref_save(Role, PartnerId,
					    Id, Type)
	of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} -> {reply, {1, <<>>}, NRole}
    end;
handle(11035, {Id}, Role) ->
    case partner_artifact:artifact_decompound(Role, Id) of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} -> {reply, {1, <<>>}, NRole}
    end;
handle(11036, {ItemId, ExpendIds}, Role) ->
    case partner_artifact:artifact_compound(Role, ItemId,
					    ExpendIds)
	of
      {false, Reason} -> {reply, {0, Reason, 0}};
      {ok, NRole, true} ->
	  {reply,
	   {1, lang:get(<<"Tổng hợp thành công"/utf8>>), 1},
	   NRole};
      {ok, NRole, false} ->
	  {reply,
	   {1, lang:get(<<"Tổng hợp không thành công"/utf8>>), 0},
	   NRole}
    end;
handle(11037, {}, Role) ->
    partner_artifact:artifact_compound_lucky(Role), ok;
handle(11038, {}, Role) ->
    case
      partner_artifact:artifact_compound_lucky_award(Role)
	of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} -> {reply, {1, <<>>}, NRole}
    end;
handle(11040, {},
       Role = #role{partner_bag =
			#partner_bag{partner_had = HasList,
				     partner_star_lev = Lev}}) ->
    {reply,
     {[{Id, Star} || {Id, _, _, Star} <- HasList],
      partner_lib:get_star(Role), Lev, []}};
handle(11041, {PartnerBid, Start, Num}, Role) ->
    case role_misc:check_cd(partner_comment) of
      false -> ok;
      _ ->
	  {reply,
	   partner_comment:get_comment(PartnerBid, Start, Num,
				       Role)}
    end;
handle(11042, {PartnerBid}, Role) ->
    case role_misc:check_cd(partner_comment) of
      false ->
	  {reply, {0, lang:get(<<"Hoạt động quá nhanh"/utf8>>)}};
      _ ->
	  case partner_comment:set_like(PartnerBid, Role) of
	    {false, Msg} -> {reply, {0, Msg}};
	    {ok, NRole} ->
		{reply,
		 {1, lang:get(<<"Thiết lập để thành công"/utf8>>)},
		 NRole}
	  end
    end;
handle(11043, {PartnerBid, Comment}, Role) ->
    case role_misc:check_cd(partner_comment_do, 3000) of
      false ->
	  {reply,
	   {0, lang:get(<<"Tốc độ hoạt động quá nhanh"/utf8>>)}};
      _ ->
	  case string_util:utf8_len(Comment) > 40 of
	    true ->
		{reply, {0, lang:get(<<"Bình luận quá dài"/utf8>>)}};
	    false ->
		case string_util:utf8_len(Comment) < 1 of
		  true ->
		      {reply,
		       {0,
			lang:get(<<"Để lại bình luận không được để trống"/utf8>>)}};
		  _ ->
		      case partner_comment:publish_comment(Role, PartnerBid,
							   keyword:filter(Comment))
			  of
			{false, Msg} -> {reply, {0, Msg}};
			{ok, NRole} ->
			    {reply,
			     {1,
			      lang:get(<<"Bình luận đã được đăng thành công"/utf8>>)},
			     NRole}
		      end
		end
	  end
    end;
handle(11044, {PartnerBid, CommentId, Type}, Role) ->
    case role_misc:check_cd(partner_comment) of
      false ->
	  {reply,
	   {0, lang:get(<<"Tốc độ hoạt động quá nhanh"/utf8>>),
	    Type}};
      _ ->
	  case partner_comment:to_like_comment(Role, PartnerBid,
					       CommentId, Type)
	      of
	    {false, Msg} -> {reply, {0, Msg, Type}};
	    {ok, NRole} ->
		{reply,
		 {1,
		  lang:get(<<"Đã hành động thành công trên bình luận"/utf8>>),
		  Type},
		 NRole}
	  end
    end;
handle(11048, {}, Role) ->
    partner_artifact:push_artifact_ref_count(Role), ok;
handle(11055, {IsPoint}, Role)
    when IsPoint == 1 orelse IsPoint == 0 ->
    NRole = var:set_var(Role, day, 97, IsPoint),
    {ok, NRole};
handle(11056, _, Role) ->
    {reply, {var:get_var(Role, day, 97, 1)}};
handle(11060, {Id, Channel}, Role) ->
    case partner_share:share(Role, Id, Channel) of
      {false, Msg} -> {reply, {0, Msg}};
      _ -> {reply, {1, lang:get(<<""/utf8>>)}}
    end;
handle(11061, {RId, SrvId, Id}, Role) ->
    role_view:find(Role, {RId, SrvId}, {partner, Id}), ok;
handle(11062, {Id, SrvId}, _Role) ->
    partner_share:look_share(SrvId, Id), ok;
handle(11063, {Id}, Role) ->
    role_view:find_attr(Role, Id), ok;
handle(11065, {Id}, Role) ->
    role:send_buff_begin(),
    case partner_decompose:partner_rollback(Role, Id) of
      {ok, Award, NRole} ->
	  role:send_buff_flush(),
	  {reply, {1, <<>>, Award, Id}, NRole};
      {false, Msg} ->
	  role:send_buff_clean(), {reply, {0, Msg, [], Id}}
    end;
handle(11066, {Id}, Role) ->
    case partner_decompose:partner_rollback_info(Role, Id)
	of
      {false, Msg} -> {reply, {0, Msg, []}};
      {ok, List} -> {reply, {1, <<>>, List}}
    end;
handle(11067, {Id}, Role) ->
    partner_born:push(Role, Id), ok;
handle(11068, {Id}, Role) ->
    case partner_born:born(Role, Id) of
      {ok, NRole} -> {reply, {1, <<>>}, NRole};
      {false, Reason} -> {reply, {0, Reason}}
    end;
handle(11070, {Id}, Role) ->
    {L1, L2, Bid} = stronger_lib:find(Role, Id),
    {reply, {Bid, L1, L2}};
handle(11071, {Id}, Role) ->
    role:send_buff_begin(),
    case partner_decompose:partner_return(Role, Id) of
      {ok, NRole} ->
	  role:send_buff_flush(), {reply, {1, <<>>}, NRole};
      {false, Msg} ->
	  role:send_buff_clean(), {reply, {0, Msg}}
    end;
handle(11072, {Ids}, Role) ->
    case partner_decompose:partner_decompose_info(Role,
						  [Ids], [], [],
						  partner_rebirth)
	of
      {false, Msg} -> {reply, {0, Msg, []}};
      {ok, List, AddItems} ->
	  Items = [{BId, 1} || #item{base_id = BId} <- AddItems],
	  {reply, {1, <<>>, List ++ Items}}
    end;
handle(11074, {Ids}, Role) ->
    role:send_buff_begin(),
    case partner_decompose:partner_skin_return(Role, Ids) of
      {ok, NRole} ->
	  role:send_buff_flush(), {reply, {1, <<>>}, NRole};
      {false, Msg} ->
	  role:send_buff_clean(), {reply, {0, Msg}}
    end;
handle(11075, {Ids}, Role) ->
    case partner_decompose:partner_decompose_info(Role, Ids,
						  [], [], partner_decompose)
	of
      {false, Msg} -> {reply, {0, Msg, []}};
      {ok, List, AddItems} ->
	  Items = [{BId, 1} || #item{base_id = BId} <- AddItems],
	  {reply, {1, <<>>, List ++ Items}}
    end;
handle(11076, {Ids}, Role) ->
    case partner_decompose:partner_decompose(Role, Ids) of
      {ok, NRole} -> {reply, {1, <<>>, Ids}, NRole};
      {false, Msg} -> {reply, {0, Msg, Ids}}
    end;
handle(11079, {BaseId, Num}, Role) ->
    {reply,
     partner_eqm:auto_compound_preview(Role, BaseId, Num)};
handle(11080, {BaseId, Num}, Role) ->
    case partner_eqm:compound(Role, BaseId, Num) of
      {false, Msg} -> {reply, {0, Msg}};
      {ok, NRole} -> {reply, {1, <<>>}, NRole}
    end;
handle(11081, {BaseId, Num}, Role) ->
    case partner_eqm:auto_compound(Role, BaseId, Num) of
      {false, Msg} -> {reply, {0, Msg}};
      {ok, NRole} -> {reply, {1, <<>>}, NRole}
    end;
handle(11082, {}, Role) ->
    partner_eqm:push_compound_logs(Role), ok;
handle(11086, {Id}, Role) ->
    case partner_holy_eqm:show_holy_eqm_attr(Role, Id) of
      {AllAttr, Power} -> {reply, {Id, Power, AllAttr}};
      _ -> skip
    end;
handle(11087, {Ids}, Role) ->
    case partner_decompose:partner_decompose_info(Role, Ids,
						  [], [])
	of
      {false, Msg} -> {reply, {0, Msg, []}};
      {ok, List, AddItems} ->
	  Items = [{BId, 1} || #item{base_id = BId} <- AddItems],
	  {reply, {1, <<>>, List ++ Items}}
    end;
handle(11088, {ItemIds}, Role) ->
    case partner_holy_eqm:holy_eqm_sell_info(Role, ItemIds)
	of
      {false, Reason} -> {reply, {0, Reason, []}};
      {ok, List} -> {reply, {1, <<>>, List}}
    end;
handle(11089, {ItemIds}, Role) ->
    case partner_holy_eqm:holy_eqm_sell(Role, ItemIds) of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} -> {reply, {1, <<>>}, NRole}
    end;
handle(11090, {PartnerId, ItemId, _Type}, Role) ->
    case partner_holy_eqm:holy_eqm_ref_save(Role, PartnerId,
					    ItemId)
	of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} -> {reply, {1, <<>>}, NRole}
    end;
handle(11092, {PartnerIds}, Role) ->
    L = partner_holy_eqm:info(Role, PartnerIds),
    {reply, {L}};
handle(11093, {PartnerId, ItemId, 1}, Role) ->
    case partner_holy_eqm:dress_holy_eqm(Role, PartnerId,
					 ItemId)
	of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} ->
	  role:redirect(NRole, 25220, {}),
	  {reply, {1, <<>>}, NRole}
    end;
handle(11093, {PartnerId, ItemId, _}, Role) ->
    case partner_holy_eqm:drop_holy_eqm(Role, PartnerId,
					ItemId)
	of
      {false, Reason} -> {reply, {0, Reason}};
      {ok, NRole} ->
	  role:redirect(NRole, 25220, {}),
	  {reply, {1, <<>>}, NRole}
    end;
handle(11094, {PartnerId, ItemId, LockPosL}, Role) ->
    role:send_buff_begin(),
    case partner_holy_eqm:holy_eqm_ref(Role, PartnerId,
				       ItemId, LockPosL)
	of
      {false, Reason} ->
	  role:send_buff_clean(), {reply, {0, Reason}};
      {ok, NRole} ->
	  role:send_buff_flush(),
	  {reply, {1, lang:get(<<"Tinh chế thành công"/utf8>>)},
	   NRole}
    end;
handle(11096, {PartnerId, Pos, SkillId}, Role) ->
    case partner_skill:learn(Role, PartnerId, Pos, SkillId)
	of
      {false, Msg} -> {reply, {PartnerId, 0, Msg, []}};
      {ok, NRole, PushList} ->
	  {reply, {PartnerId, 1, <<>>, PushList}, NRole}
    end;
handle(11097, {PartnerId, Pos}, Role) ->
    case partner_skill:lev_up(Role, PartnerId, Pos) of
      {false, Msg} -> {reply, {PartnerId, 0, Msg, []}};
      {ok, NRole, PushList} ->
	  notice:alert(lang:get(<<"Nâng cấp kỹ năng thành công"/utf8>>)),
	  {reply, {PartnerId, 1, <<>>, PushList}, NRole}
    end;
handle(11098, {PartnerId, Pos}, Role) ->
    case partner_skill:forget(Role, PartnerId, Pos) of
      {false, Msg} -> {reply, {PartnerId, 0, Msg, []}};
      {ok, NRole, PushList} ->
	  {reply, {PartnerId, 1, <<>>, PushList}, NRole}
    end;
handle(11099, {PartnerIds}, Role) ->
    L = partner_skill:info(Role, PartnerIds), {reply, {L}};
handle(_Cmd, _Data, _Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_rpc587, _,
       {__Levelpartner_rpc587, __Tracespartner_rpc587}}
	  when __Levelpartner_rpc587 band 128 /= 0 orelse
		 __Tracespartner_rpc587 /= [] ->
	  lager:do_log(debug,
		       [{module, partner_rpc}, {function, handle}, {line, 587},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("模块[~w]收到无效的RPC调用[~w]: ~w",
				     [partner_rpc, _Cmd, _Data]),
		       none, 4096, 128, __Levelpartner_rpc587,
		       __Tracespartner_rpc587, lager_event,
		       __Pidpartner_rpc587);
      _ -> ok
    end,
    {error, unknow_command}.


