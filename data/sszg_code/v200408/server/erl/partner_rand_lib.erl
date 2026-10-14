-file("src/mod/partner_rand/partner_rand_lib.erl", 1).

-module(partner_rand_lib).

-lager_records([{formation_attr_data,
		 [type, lev, expend, attr_1, attr_2, attr_3, attr_4,
		  attr_5, attr_6, attr_7, attr_8, attr_9, power]},
		{formation_data,
		 [type, pos, need_lev, name, need_items, restrain_s,
		  restrain_w]},
		{formation_info_p, [id, name, power, pos_info]},
		{pk_formation_info,
		 [id, name, formation, ffor_target, power, is_ready,
		  guild_name, lev, face_id, pid]},
		{formation_fight_info, [pos, fight_pos, id]},
		{formation_base_p,
		 [id, lev, exp, pos_info, formation_list, power,
		  hallows_id, all_lineups]},
		{formation_pos, [pos, id]},
		{formation_lineup,
		 [id, name, power, pos_info, max_power, type,
		  hallows_id]},
		{formation_sys, [id, type, pos_info, hallows_id]},
		{m_formation,
		 [ver, list, use_lineup, all_lineups, sys_formations]},
		{planes_load_partner,
		 [ver, pos, bid, lev, name, star, break_skills,
		  set_skills, skills, break_lev, power, use_skin,
		  end_time, all_attr, base_attr, eqms, artifacts,
		  holy_eqm, dower_skill, ext]},
		{planes_evt_data,
		 [id, type, ext, reward_list, exchange_id, group_id]},
		{planes_tile,
		 [ver, label, evt_id, ext, defend_radio, is_hide,
		  is_walk, is_business, combat_power]},
		{planes_floor,
		 [ver, floor, difficulty, map_id, line, index, tile_list,
		  is_reward, is_can_reward, is_treasure, fight_ids]},
		{m_planes,
		 [ver, floor, floor_list, update_time, partners_hp_radio,
		  buffs, buffs_ext, session_ids, load_partners,
		  load_partners_next_id, dun_power, formation, is_pass,
		  reward_list, is_spar]},
		{role_var, [id, vars]},
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
		{partner_rand,
		 [ver, id, bid, role_id, name, lev, star, break_skills,
		  set_skills, skills, break_lev, power, use_skin,
		  end_time, all_attr, base_attr, eqms, artifacts,
		  holy_eqm, dower_skill, ext]},
		{partner_rand_match,
		 [id, bid, role_id, lev, star, power]},
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

-export([login/1, get_power_type/2, match/3,
	 match_self_partner/2, check_push_partner/4,
	 calc_career_add_pro/1, planes_match/4]).

-export([gm_match/1, apply_gm_mathc/3, gm_match2/1,
	 apply_gm_mathc2/3, to_sys_robot/2]).

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

-file("src/mod/partner_rand/partner_rand_lib.erl", 24).

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

-file("src/mod/partner_rand/partner_rand_lib.erl", 25).

-file("inc/partner_rand.hrl", 1).

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

-file("inc/partner_rand.hrl", 8).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("inc/partner_rand.hrl", 9).

-file("inc/common.hrl", 1).

-file("inc/partner_rand.hrl", 10).

-record(partner_rand_match,
	{id = 0  :: pos_integer(), bid = 1  :: pos_integer(),
	 role_id = {0, <<>>}  :: pos_integer(),
	 lev = 1  :: pos_integer(), star = 1  :: pos_integer(),
	 power = 1  :: pos_integer()}).

-record(partner_rand,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 bid = 1  :: pos_integer(),
	 role_id = {0, <<>>}  :: pos_integer(), name = <<>>,
	 lev = 1  :: pos_integer(), star = 1  :: pos_integer(),
	 break_skills = []  :: list(),
	 set_skills = []  :: list(), skills = []  :: list(),
	 break_lev = 1  :: pos_integer(),
	 power = 1  :: pos_integer(),
	 use_skin = 0  :: pos_integer(),
	 end_time = 1  :: pos_integer(),
	 all_attr = #attr{}  :: #attr{},
	 base_attr = #attr{}  :: #attr{}, eqms = []  :: list(),
	 artifacts = []  :: list(), holy_eqm = []  :: list(),
	 dower_skill = []  :: list(), ext = []  :: list()}).

-file("src/mod/partner_rand/partner_rand_lib.erl", 26).

-file("inc/partner.hrl", 1).

-file("inc/attr.hrl", 1).

-file("inc/partner.hrl", 11).

-file("inc/package.hrl", 1).

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

-file("src/mod/partner_rand/partner_rand_lib.erl", 27).

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

-file("src/mod/partner_rand/partner_rand_lib.erl", 28).

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

-file("src/mod/partner_rand/partner_rand_lib.erl", 29).

-file("inc/planes.hrl", 1).

-file("inc/attr.hrl", 1).

-file("inc/planes.hrl", 7).

-record(m_planes,
	{ver = 2  :: pos_integer(), floor = 0  :: pos_integer(),
	 floor_list = []  :: list(),
	 update_time = 0  :: pos_integer(),
	 partners_hp_radio = []  :: list(),
	 buffs = []  :: list(), buffs_ext = []  :: list(),
	 session_ids = []  :: list(),
	 load_partners = []  :: list(),
	 load_partners_next_id = 1  :: pos_integer(),
	 dun_power = 0  :: pos_integer(),
	 formation = {1, [], 0}  :: tuple(),
	 is_pass = 0  :: boolean(), reward_list = []  :: list(),
	 is_spar = 0  :: pos_integer()}).

-record(planes_floor,
	{ver = 1  :: pos_integer(), floor = 1  :: pos_integer(),
	 difficulty = 1  :: pos_integer(),
	 map_id  :: pos_integer(), line = 1  :: pos_integer(),
	 index = 0  :: pos_integer(), tile_list = []  :: list(),
	 is_reward = 0  :: boolean(),
	 is_can_reward = 0  :: boolean(),
	 is_treasure = 0  :: boolean(),
	 fight_ids = []  :: list()}).

-record(planes_tile,
	{ver = 1  :: pos_integer(), label = {1, 1}  :: tuple(),
	 evt_id = 0  :: pos_integer(), ext = []  :: list(),
	 defend_radio = []  :: list(), is_hide = 0  :: boolean(),
	 is_walk = 0  :: boolean(),
	 is_business = 0  :: boolean(),
	 combat_power = 0  :: pos_integer()}).

-record(planes_evt_data,
	{id = 0  :: pos_integer(), type = 0  :: pos_integer(),
	 ext = []  :: list(), reward_list = []  :: list(),
	 exchange_id = 0  :: pos_integer(),
	 group_id = 0  :: pos_integer()}).

-record(planes_load_partner,
	{ver = 1  :: pos_integer(), pos = 1  :: pos_integer(),
	 bid = 1  :: pos_integer(), lev = 1  :: pos_integer(),
	 name = <<>>  :: binary(), star = 1  :: pos_integer(),
	 break_skills = []  :: list(),
	 set_skills = []  :: list(), skills = []  :: list(),
	 break_lev = 1  :: pos_integer(),
	 power = 1  :: pos_integer(),
	 use_skin = 0  :: pos_integer(),
	 end_time = 1  :: pos_integer(),
	 all_attr = #attr{}  :: #attr{},
	 base_attr = #attr{}  :: #attr{}, eqms = []  :: list(),
	 artifacts = []  :: list(), holy_eqm = []  :: list(),
	 dower_skill = []  :: list(), ext = []  :: list()}).

-file("src/mod/partner_rand/partner_rand_lib.erl", 30).

-file("inc/formation.hrl", 1).

-record(m_formation,
	{ver = 1, list = [], use_lineup = 1, all_lineups = [],
	 sys_formations = []}).

-record(formation_sys,
	{id = 1, type = 1, pos_info = [], hallows_id = 0}).

-record(formation_lineup,
	{id = 1, name = <<>>, power = 0, pos_info = [],
	 max_power = 0, type = 1, hallows_id = 0}).

-record(formation_pos, {pos, id = 0}).

-record(formation_base_p,
	{id, lev, exp, pos_info, formation_list, power,
	 hallows_id = 0, all_lineups}).

-record(formation_fight_info, {pos, fight_pos, id = 0}).

-record(pk_formation_info,
	{id, name, formation, ffor_target, power,
	 is_ready = false, guild_name = <<>>, lev = 0, face_id,
	 pid = none}).

-record(formation_info_p,
	{id = 0, name = <<>>, power = 0, pos_info = []}).

-record(formation_data,
	{type, pos, need_lev, name, need_items = [],
	 restrain_s = [], restrain_w = []}).

-record(formation_attr_data,
	{type, lev, expend = [], attr_1 = [], attr_2 = [],
	 attr_3 = [], attr_4 = [], attr_5 = [], attr_6 = [],
	 attr_7 = [], attr_8 = [], attr_9 = [], power}).

-file("src/mod/partner_rand/partner_rand_lib.erl", 31).

gm_match(Role = #role{id = RoleId,
		      partner_bag = #partner_bag{partner_list = PartnerList},
		      m_planes =
			  #m_planes{load_partners = LoadPartners,
				    partners_hp_radio = PartnerHpRadio}}) ->
    SortPartners = util:keys_sort([#partner.power],
				  PartnerList),
    Top5Partners = lists:sublist(SortPartners, 5),
    MatchPower = lists:sum([Power0
			    || #partner{power = Power0} <- Top5Partners])
		   / max(1, length(Top5Partners)),
    {Top5AlivePartnerBids, ALLAlivePartnerBidPower} =
	filter_planes_alive_partner(PartnerList, LoadPartners,
				    PartnerHpRadio),
    BidProRios = calc_all_add_pro(Role, MatchPower,
				  ALLAlivePartnerBidPower),
    PosTypes = calc_match_pos_type(lists:seq(1, 4),
				   Top5AlivePartnerBids, []),
    partner_rand_match_mgr:info(RoleId,
				{match, self(), RoleId, MatchPower, PosTypes,
				 BidProRios, #{group_id => 1},
				 {partner_rand_lib, apply_gm_mathc,
				  [MatchPower]}}),
    ok.

apply_gm_mathc(Role, MatchList, MatchPower) ->
    AllPosList = lists:seq(1, 4),
    MatchList2 = partner_rand_lib:match_self_partner(Role,
						     AllPosList --
						       [Pos
							|| #planes_load_partner{pos
										    =
										    Pos}
							       <- MatchList]),
    MatchInfo1 = [{Pos, Bid, Power}
		  || #planes_load_partner{pos = Pos, bid = Bid,
					  power = Power}
			 <- MatchList],
    MatchInfo2 = [{Pos, Bid, Power}
		  || #planes_load_partner{pos = Pos, bid = Bid,
					  power = Power}
			 <- MatchList2],
    Msg =
	util:fbin(lang:get(<<"匹配战力:~w 英雄池匹配结果:~w 自身英雄匹配结果:~w"/utf8>>),
		  [MatchPower, MatchInfo1, MatchInfo2]),
    sys_conn:pack_send(10399,
		       {1, unicode:characters_to_binary(Msg)}),
    {ok, Role}.

gm_match2(Role = #role{id = RoleId,
		       partner_bag = #partner_bag{partner_list = PartnerList},
		       m_planes =
			   #m_planes{load_partners = LoadPartners,
				     partners_hp_radio = PartnerHpRadio}}) ->
    SortPartners = util:keys_sort([#partner.power],
				  PartnerList),
    Top5Partners = lists:sublist(SortPartners, 5),
    MatchPower = lists:sum([Power0
			    || #partner{power = Power0} <- Top5Partners])
		   / max(1, length(Top5Partners)),
    {Top5AlivePartnerBids, ALLAlivePartnerBidPower} =
	filter_planes_alive_partner(PartnerList, LoadPartners,
				    PartnerHpRadio),
    BidProRios = calc_all_add_pro(Role, MatchPower,
				  ALLAlivePartnerBidPower),
    PosTypes = calc_match_pos_type(lists:seq(1, 4),
				   Top5AlivePartnerBids, []),
    partner_rand_match_mgr:info(RoleId,
				{match, self(), RoleId, MatchPower, PosTypes,
				 BidProRios, #{group_id => 1},
				 {partner_rand_lib, apply_gm_mathc,
				  [MatchPower]}}),
    ok.

apply_gm_mathc2(Role, MatchList, MatchPower) ->
    AllPosList = lists:seq(1, 4),
    MatchList2 = partner_rand_lib:match_self_partner(Role,
						     AllPosList --
						       [Pos
							|| #planes_load_partner{pos
										    =
										    Pos}
							       <- MatchList]),
    MatchInfo1 = [{Pos, Bid, Power}
		  || #planes_load_partner{pos = Pos, bid = Bid,
					  power = Power}
			 <- MatchList],
    MatchInfo2 = [{Pos, Bid, Power}
		  || #planes_load_partner{pos = Pos, bid = Bid,
					  power = Power}
			 <- MatchList2],
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_rand_lib71, _,
       {__Levelpartner_rand_lib71, __Tracespartner_rand_lib71}}
	  when __Levelpartner_rand_lib71 band 64 /= 0 orelse
		 __Tracespartner_rand_lib71 /= [] ->
	  lager:do_log(info,
		       [{module, partner_rand_lib},
			{function, apply_gm_mathc2}, {line, 71},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("匹配战力:~w 英雄池匹配结果:~w 自身英雄匹配结果:~w",
				     [MatchPower, MatchInfo1, MatchInfo2]),
		       none, 4096, 64, __Levelpartner_rand_lib71,
		       __Tracespartner_rand_lib71, lager_event,
		       __Pidpartner_rand_lib71);
      _ -> ok
    end,
    {ok, Role}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{id = RoleId,
		   partner_bag = #partner_bag{partner_list = PL}}) ->
    Now = date:unixtime(),
    LastTime = var:get_var(Role, other, 3098, 0),
    case var:get_var(Role, day, 126, 0) of
      0 when Now > LastTime + 86900 ->
	  ArenaRank = arena_lib:role_rank(RoleId),
	  case ArenaRank > 0 andalso ArenaRank =< 100 of
	    true ->
		#formation_sys{pos_info = PosInfo} =
		    formation:get_sys_formation(Role, 1),
		PIds = [PId || #formation_pos{id = PId} <- PosInfo],
		PL1 = [P
		       || P = #partner{id = PId} <- PL,
			  cystal_resonate:can_employ(Role, PId) =:= true],
		case check_push_partner(RoleId, PL1, PIds, []) of
		  PushL = [_ | _] ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidpartner_rand_lib89, _,
			 {__Levelpartner_rand_lib89,
			  __Tracespartner_rand_lib89}}
			    when __Levelpartner_rand_lib89 band 128 /= 0 orelse
				   __Tracespartner_rand_lib89 /= [] ->
			    lager:do_log(debug,
					 [{module, partner_rand_lib},
					  {function, login}, {line, 89},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("待上传~w个英雄",
						       [length(PushL)]),
					 none, 4096, 128,
					 __Levelpartner_rand_lib89,
					 __Tracespartner_rand_lib89,
					 lager_event, __Pidpartner_rand_lib89);
			_ -> ok
		      end,
		      case big_world_lib:center_node() ==
			     cluster_lib:center_node()
			  of
			true ->
			    cluster_lib:cast(center, c_partner_rand_mgr, info,
					     [{push_partner, PushL}]);
			_ ->
			    cluster_lib:cast(center, c_partner_rand_mgr, info,
					     [{push_partner, PushL}]),
			    big_world_lib:cast(center, c_partner_rand_mgr, info,
					       [{push_partner, PushL}])
		      end;
		  _ -> skip
		end,
		Role1 = var:set_var(Role, day, 126, 1),
		NRole = var:set_var(Role1, other, 3098, Now),
		{ok, NRole};
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end.

check_push_partner(_RoleId, [], _PIds, L) -> L;
check_push_partner(RoleId,
		   [#partner{star = Star} | Partners], PIds, L)
    when Star < 5 ->
    check_push_partner(RoleId, Partners, PIds, L);
check_push_partner(RoleId,
		   [#partner{lev = Lev, star = 5} | Partners], PIds, L)
    when Lev < 2 ->
    check_push_partner(RoleId, Partners, PIds, L);
check_push_partner(RoleId,
		   [#partner{lev = Lev, star = Star} | Partners], PIds, L)
    when Lev < 100 andalso Star > 5 ->
    check_push_partner(RoleId, Partners, PIds, L);
check_push_partner(RoleId,
		   [P = #partner{id = PId, bid = Bid, star = Star,
				 power = Power, eqm = Eqm}
		    | Partners],
		   PIds, L)
    when length(Eqm) >= 4 ->
    case partner:max_star(Bid) >= 10 andalso
	   lists:member(PId, PIds)
	of
      true ->
	  {PowerType, MaxNum} =
	      partner_rand_lib:get_power_type(Power, Star),
	  Num = partner_rand_mgr:get_num({Bid, Star, PowerType}),
	  case Num >= MaxNum of
	    true -> check_push_partner(RoleId, Partners, PIds, L);
	    _ ->
		check_push_partner(RoleId, Partners, PIds,
				   [to_partner_rand(RoleId, P) | L])
	  end;
      _ -> check_push_partner(RoleId, Partners, PIds, L)
    end;
check_push_partner(RoleId, [_ | Partners], PIds, L) ->
    check_push_partner(RoleId, Partners, PIds, L).

-spec get_power_type(pos_integer(),
		     pos_integer()) -> {pos_integer(), pos_integer()}.

get_power_type(Power, Star) ->
    AllType = planes_data:get_match_power_type(),
    case [{Type, MaxNum}
	  || {Type, Min, Max, MaxNum, StarT} <- AllType,
	     Power > Min andalso Power =< Max andalso StarT == Star]
	of
      [{TypeT, MaxNumT} | _] -> {TypeT, MaxNumT};
      _ -> {0, 0}
    end.

-spec match(#role{}, pos_integer(),
	    tuple()) -> {pos_integer(), pos_integer()}.

match(Role = #role{id = RoleId,
		   partner_bag = #partner_bag{partner_list = PartnerList},
		   m_planes =
		       #m_planes{load_partners = LoadPartners,
				 partners_hp_radio = PartnerHpRadio}},
      {M, F, A}, Args) ->
    SortPartners = util:keys_sort([#partner.power],
				  PartnerList),
    Top5Partners = lists:sublist(SortPartners, 5),
    MatchPower = lists:sum([Power0
			    || #partner{power = Power0} <- Top5Partners])
		   / max(1, length(Top5Partners)),
    {Top5AlivePartnerBids, ALLAlivePartnerBidPower} =
	filter_planes_alive_partner(PartnerList, LoadPartners,
				    PartnerHpRadio),
    BidProRios = calc_all_add_pro(Role, MatchPower,
				  ALLAlivePartnerBidPower),
    PosTypes = calc_match_pos_type(lists:seq(1, 4),
				   Top5AlivePartnerBids, []),
    partner_rand_match_mgr:info(RoleId,
				{match, self(), RoleId, MatchPower, PosTypes,
				 BidProRios, Args, {M, F, A}}),
    ok.

calc_match_pos_type([], _Top5AlivePartnerBids, L) -> L;
calc_match_pos_type([Pos | Other], Top5AlivePartnerBids,
		    L) ->
    Groups = get_planes_groups(Pos, Top5AlivePartnerBids),
    {Group, _} = util:rand_list(Groups, 2),
    calc_match_pos_type(Other, Top5AlivePartnerBids,
			[{Pos, Group} | L]).

-spec planes_match(#role{}, pos_integer(), list(),
		   pos_integer()) -> pos_integer().

planes_match(Role = #role{partner_bag =
			      #partner_bag{partner_list = PartnerList},
			  m_planes =
			      #m_planes{load_partners = LoadPartners,
					partners_hp_radio = PartnerHpRadio}},
	     Pos, BidList, GroupId) ->
    SortPartners = util:keys_sort([#partner.power],
				  PartnerList),
    Top5Partners = lists:sublist(SortPartners, 5),
    Power0 = lists:sum([Power0
			|| #partner{power = Power0} <- Top5Partners])
	       / length(Top5Partners),
    Power = max(Power0,
		planes_data:get_const(planes_min_combat)),
    {Top5AlivePartnerBids, ALLAlivePartnerBidPower} =
	filter_planes_alive_partner(PartnerList, LoadPartners,
				    PartnerHpRadio),
    Groups = get_planes_groups(Pos, Top5AlivePartnerBids),
    {Group, _} = util:rand_list(Groups, 2),
    RandList =
	planes_data:get_match_group_rand_list({GroupId, Group}),
    MatchPowers =
	planes_data:get_macth_limit_match_power_robot(Power),
    PlanesMinimumNum =
	planes_data:get_const(planes_minimum_num),
    MatchList = match_planes_robot(MatchPowers, RandList,
				   Power, 0, PlanesMinimumNum, [], BidList),
    case filter_new_match_list(MatchList,
			       ALLAlivePartnerBidPower, [])
	of
      [] ->
	  FinalList = planes_robot_data:get_all_robot_id_power(),
	  case final_match(MatchPowers, Power, FinalList) of
	    FinalId when is_integer(FinalId) ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidpartner_rand_lib186, _,
		   {__Levelpartner_rand_lib186,
		    __Tracespartner_rand_lib186}}
		      when __Levelpartner_rand_lib186 band 8 /= 0 orelse
			     __Tracespartner_rand_lib186 /= [] ->
		      lager:do_log(error,
				   [{module, partner_rand_lib},
				    {function, planes_match}, {line, 186},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("位面租借最后保底机器人[~ts]~w匹配战力~w匹配id~w",
						 [Role#role.name, Role#role.id,
						  Power, FinalId]),
				   none, 4096, 8, __Levelpartner_rand_lib186,
				   __Tracespartner_rand_lib186, lager_event,
				   __Pidpartner_rand_lib186);
		  _ -> ok
		end,
		to_sys_robot(planes_robot_data:get_loan_partner(FinalId),
			     Pos);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidpartner_rand_lib189, _,
		   {__Levelpartner_rand_lib189,
		    __Tracespartner_rand_lib189}}
		      when __Levelpartner_rand_lib189 band 8 /= 0 orelse
			     __Tracespartner_rand_lib189 /= [] ->
		      lager:do_log(error,
				   [{module, partner_rand_lib},
				    {function, planes_match}, {line, 189},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("位面租借最后保底机器人[~ts]~w匹配战力~w匹配失败",
						 [Role#role.name, Role#role.id,
						  Power]),
				   none, 4096, 8, __Levelpartner_rand_lib189,
				   __Tracespartner_rand_lib189, lager_event,
				   __Pidpartner_rand_lib189);
		  _ -> ok
		end,
		false
	  end;
      NewMatchList ->
	  {Id, _} = util:rand_list(NewMatchList, 2),
	  to_sys_robot(planes_robot_data:get_loan_partner(Id),
		       Pos)
    end.

final_match([{_, MinPowerPer, MaxPowerPer} | T], Power,
	    FinalList) ->
    MinPower = round(Power * MinPowerPer / 1000),
    MaxPower = round(Power * MaxPowerPer / 1000),
    case [Id
	  || {Id, PowerData} <- FinalList, PowerData >= MinPower,
	     PowerData =< MaxPower]
	of
      [] -> final_match(T, Power, FinalList);
      List -> RandId = util:rand_list(List), RandId
    end;
final_match(_T, _Power, _FinalList) -> false.

filter_planes_alive_partner(PartnerList, LoadPartners,
			    PartnerHpRadio) ->
    BidPowerList = get_alive_partner_bid_power(PartnerList
						 ++ LoadPartners,
					       PartnerHpRadio, []),
    SortBidPowerList = util:keys_sort([2], BidPowerList),
    Top5SortBids = [Top5Bid
		    || {Top5Bid, _} <- lists:sublist(SortBidPowerList, 5)],
    ALLAlivePartnerBidPower =
	filter_same_bid(SortBidPowerList, []),
    {Top5SortBids, ALLAlivePartnerBidPower}.

get_alive_partner_bid_power([], _PartnerHpRadio,
			    BidPowerList) ->
    BidPowerList;
get_alive_partner_bid_power([#partner{id = PartnerId,
				      bid = Bid, power = Power}
			     | Rest],
			    PartnerHpRadio, BidPowerList) ->
    case lists:keyfind(PartnerId, 1, PartnerHpRadio) of
      {_, 0} ->
	  get_alive_partner_bid_power(Rest, PartnerHpRadio,
				      BidPowerList);
      _ ->
	  get_alive_partner_bid_power(Rest, PartnerHpRadio,
				      [{Bid, Power} | BidPowerList])
    end;
get_alive_partner_bid_power([#planes_load_partner{pos =
						      PartnerId,
						  bid = Bid, power = Power}
			     | Rest],
			    PartnerHpRadio, BidPowerList) ->
    case lists:keyfind({PartnerId, <<>>}, 1, PartnerHpRadio)
	of
      {_, 0} ->
	  get_alive_partner_bid_power(Rest, PartnerHpRadio,
				      BidPowerList);
      _ ->
	  get_alive_partner_bid_power(Rest, PartnerHpRadio,
				      [{Bid, Power} | BidPowerList])
    end;
get_alive_partner_bid_power([_Partner | Rest],
			    PartnerHpRadio, BidPowerList) ->
    get_alive_partner_bid_power(Rest, PartnerHpRadio,
				BidPowerList);
get_alive_partner_bid_power(_Rest, _PartnerHpRadio,
			    BidPowerList) ->
    BidPowerList.

filter_same_bid([], FilterList) -> FilterList;
filter_same_bid([{Bid, Power} | Rest], FilterList) ->
    NewRest = [{RestBid, RestPower}
	       || {RestBid, RestPower} <- Rest, RestBid =/= Bid],
    filter_same_bid(NewRest, [{Bid, Power} | FilterList]);
filter_same_bid(Rest, FilterList) -> Rest ++ FilterList.

filter_new_match_list([], _ALLAlivePartnerBidPower,
		      NewMatchList) ->
    NewMatchList;
filter_new_match_list([{Id, Bid, Power, Radio} | Rest],
		      ALLAlivePartnerBidPower, NewMatchList) ->
    case lists:keyfind(Bid, 1, ALLAlivePartnerBidPower) of
      {Bid, AlivePower} when AlivePower >= Power ->
	  filter_new_match_list(Rest, ALLAlivePartnerBidPower,
				NewMatchList);
      _ ->
	  filter_new_match_list(Rest, ALLAlivePartnerBidPower,
				[{Id, Radio} | NewMatchList])
    end;
filter_new_match_list(_Rest, _ALLAlivePartnerBidPower,
		      NewMatchList) ->
    NewMatchList.

get_planes_groups(Pos = 4, Top5AlivePartnerBids) ->
    LocationIds =
	lists:flatten([partner_data:get_partner_location(Bid)
		       || Bid <- Top5AlivePartnerBids]),
    Groups = planes_data:get_match_pos_rand_list(Pos),
    get_pos4_new_group(Groups, LocationIds, []);
get_planes_groups(Pos, _Top5AlivePartnerBids) ->
    planes_data:get_match_pos_rand_list(Pos).

get_pos4_new_group([], _LocationIds, NewGroups) ->
    NewGroups;
get_pos4_new_group([{Group, Weight} | Rest],
		   LocationIds, NewGroups) ->
    case Group of
      1 ->
	  case length([1 || Id <- LocationIds, Id =:= Group]) < 3
	      of
	    true ->
		get_pos4_new_group(Rest, LocationIds,
				   [{Group, Weight + 100} | NewGroups]);
	    _ ->
		get_pos4_new_group(Rest, LocationIds,
				   [{Group, Weight} | NewGroups])
	  end;
      2 ->
	  case length([1 || Id <- LocationIds, Id =:= Group]) < 2
	      of
	    true ->
		get_pos4_new_group(Rest, LocationIds,
				   [{Group, Weight + 100} | NewGroups]);
	    _ ->
		get_pos4_new_group(Rest, LocationIds,
				   [{Group, Weight} | NewGroups])
	  end;
      3 ->
	  case length([1 || Id <- LocationIds, Id =:= Group]) < 1
	      of
	    true ->
		get_pos4_new_group(Rest, LocationIds,
				   [{Group, Weight + 100} | NewGroups]);
	    _ ->
		get_pos4_new_group(Rest, LocationIds,
				   [{Group, Weight} | NewGroups])
	  end;
      4 ->
	  case length([1 || Id <- LocationIds, Id =:= Group]) < 1
	      of
	    true ->
		get_pos4_new_group(Rest, LocationIds,
				   [{Group, Weight + 100} | NewGroups]);
	    _ ->
		get_pos4_new_group(Rest, LocationIds,
				   [{Group, Weight} | NewGroups])
	  end;
      _ ->
	  get_pos4_new_group(Rest, LocationIds,
			     [{Group, Weight} | NewGroups])
    end;
get_pos4_new_group(Rest, _LocationIds, NewGroups) ->
    Rest ++ NewGroups.

match_planes_robot([], _RandList, _Power, _Num,
		   _DataNum, MatchList, _BidList) ->
    MatchList;
match_planes_robot(_, _RandList, _Power, Num, DataNum,
		   MatchList, _BidList)
    when Num > DataNum ->
    MatchList;
match_planes_robot([{_, MinPowerPer, MaxPowerPer} | T],
		   RandList, Power, Num, DataNum, MatchList, BidList) ->
    MinPower = round(Power * MinPowerPer / 1000),
    MaxPower = round(Power * MaxPowerPer / 1000),
    NewMatchList = do_match_planes_robot(RandList, MinPower,
					 MaxPower, [], BidList),
    match_planes_robot(T, RandList, Power,
		       Num + length(NewMatchList), DataNum,
		       MatchList ++ NewMatchList, BidList).

do_match_planes_robot([], _MinPower, _MaxPower,
		      MatchList, _BidList) ->
    MatchList;
do_match_planes_robot([{Bid, Ratio} | T], MinPower,
		      MaxPower, MatchList, BidList) ->
    case lists:member(Bid, BidList) of
      true ->
	  do_match_planes_robot(T, MinPower, MaxPower, MatchList,
				BidList);
      _ ->
	  L = planes_robot_data:get_all_loan_partner(Bid),
	  L1 = [{Id, BidL, Power, Ratio}
		|| {Id, Power, BidL} <- L, Power >= MinPower,
		   Power =< MaxPower],
	  do_match_planes_robot(T, MinPower, MaxPower,
				MatchList ++ L1, BidList)
    end.

-spec match_self_partner(#role{},
			 list()) -> {pos_integer(), pos_integer()}.

match_self_partner(_Role, _) -> [].

calc_career_add_pro(Role = #role{partner_bag =
				     #partner_bag{partner_list = PL},
				 m_planes =
				     #m_planes{partners_hp_radio =
						   AllPartnerT}}) ->
    AllPartner = [P
		  || P = #partner{id = Id} <- PL,
		     list_util:keyfind(Id, AllPartnerT, 100) > 0 andalso
		       is_integer(Id)],
    {MaxPowerPartners, _} = list_util:split(5,
					    lists:reverse(lists:keysort(#partner.power,
									AllPartner))),
    Fun = fun (#partner{camp_type = CampType}, Acc) ->
		  OldNum = list_util:keyfind(CampType, Acc, 0),
		  lists:keystore(CampType, 1, Acc, {CampType, OldNum + 1})
	  end,
    CampTypeNums = lists:foldl(Fun, [], MaxPowerPartners),
    case [CampTypeTemp
	  || {CampTypeTemp, NumTemp} <- CampTypeNums,
	     NumTemp >= 3]
	of
      [CampTypeTemp | _] ->
	  [{CampTypeTemp,
	    planes_data:get_const(planes_faction_weight)}];
      _ ->
	  case [CampTypeTemp
		|| {CampTypeTemp, NumTemp} <- CampTypeNums,
		   NumTemp == 2]
	      of
	    L when length(L) >= 2 ->
		[{CampTypeTemp,
		  planes_data:get_const(planes_faction_weight)}
		 || CampTypeTemp <- L];
	    [_ | _] ->
		OtherL = [CampTypeTemp
			  || {CampTypeTemp, NumTemp} <- CampTypeNums,
			     NumTemp =/= 2],
		[{CampTypeTemp,
		  planes_data:get_const(planes_faction_weight)}
		 || CampTypeTemp <- OtherL];
	    _ -> []
	  end
    end.

calc_all_add_pro(#role{partner_bag =
			   #partner_bag{partner_list = PartnerList},
		       m_planes =
			   #m_planes{load_partners = LoadPartners,
				     partners_hp_radio = PartnerHpRadio}},
		 MatchPower, ALLAlivePartnerBidPower) ->
    {_Top5AlivePartnerBids, ALLAlivePartnerBidPower} =
	filter_planes_alive_partner(PartnerList, LoadPartners,
				    PartnerHpRadio),
    [BidT
     || {BidT, PowerT} <- ALLAlivePartnerBidPower,
	PowerT > MatchPower].

to_partner_rand(RoleId,
		Partner = #partner{eqm = EqmData}) ->
    Eqm = [{ItemId, ItemBid, ItemType}
	   || #item{id = ItemId, base_id = ItemBid,
		    type = ItemType}
		  <- EqmData],
    #partner_rand{bid = Partner#partner.bid,
		  role_id = RoleId, name = Partner#partner.name,
		  lev = Partner#partner.lev, star = Partner#partner.star,
		  break_lev = Partner#partner.break_lev,
		  use_skin = Partner#partner.use_skin,
		  all_attr = Partner#partner.all_attr,
		  base_attr = Partner#partner.base_attr,
		  skills = Partner#partner.skills,
		  break_skills = Partner#partner.break_skills,
		  set_skills = Partner#partner.set_skills, eqms = Eqm,
		  artifacts = Partner#partner.artifacts,
		  holy_eqm = Partner#partner.holy_eqm,
		  end_time = Partner#partner.end_time,
		  dower_skill = Partner#partner.dower_skill,
		  power = Partner#partner.power}.

to_sys_robot(Data, Pos) ->
    Bid = maps:get(bid, Data),
    Skills = maps:get(skills, Data),
    {Skills1, SetSkills} = split_skills(Skills, [], []),
    #planes_load_partner{bid = Bid, pos = Pos,
			 lev = maps:get(lev, Data), star = maps:get(star, Data),
			 power = maps:get(power, Data),
			 break_lev = maps:get(break_lev, Data),
			 skills = Skills1, set_skills = SetSkills,
			 all_attr = to_attr(maps:get(attr, Data, []), #attr{}),
			 eqms = to_items(eqm, maps:get(eqm, Data, [])),
			 holy_eqm =
			     to_items(holy_eqm, maps:get(holy_eqm, Data, [])),
			 artifacts =
			     to_items(artifacts,
				      maps:get(artifacts, Data, []))}.

split_skills([], Skills, SetSkills) ->
    {Skills, SetSkills};
split_skills([{Pos, Id} | T], Skills, SetSkills) ->
    split_skills(T, [{Pos, Id} | Skills], SetSkills);
split_skills([Id | T], Skills, SetSkills) ->
    split_skills(T, Skills, [Id | SetSkills]).

to_attr([], Attr) -> Attr;
to_attr([{atk, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{atk = Val}, to_attr(Rest, NewAttr);
to_attr([{hp_max, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{hp_max = Val, hp = Val},
    to_attr(Rest, NewAttr);
to_attr([{speed, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{speed = Val},
    to_attr(Rest, NewAttr);
to_attr([{def, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{def = Val}, to_attr(Rest, NewAttr);
to_attr([{hit_rate, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{hit_rate = Val},
    to_attr(Rest, NewAttr);
to_attr([{crit_rate, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{crit_rate = Val},
    to_attr(Rest, NewAttr);
to_attr([{crit_ratio, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{crit_ratio = Val},
    to_attr(Rest, NewAttr);
to_attr([{dam, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{dam = Val}, to_attr(Rest, NewAttr);
to_attr([{def_p, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{def_p = Val},
    to_attr(Rest, NewAttr);
to_attr([{def_s, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{def_s = Val},
    to_attr(Rest, NewAttr);
to_attr([{dodge_rate, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{dodge_rate = Val},
    to_attr(Rest, NewAttr);
to_attr([{hit_magic, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{hit_magic = Val},
    to_attr(Rest, NewAttr);
to_attr([{dodge_magic, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{dodge_magic = Val},
    to_attr(Rest, NewAttr);
to_attr([{res, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{res = Val}, to_attr(Rest, NewAttr);
to_attr([{cure, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{cure = Val}, to_attr(Rest, NewAttr);
to_attr([{be_cure, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{be_cure = Val},
    to_attr(Rest, NewAttr);
to_attr([{dam_p, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{dam_p = Val},
    to_attr(Rest, NewAttr);
to_attr([{res_p, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{res_p = Val},
    to_attr(Rest, NewAttr);
to_attr([{dam_s, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{dam_s = Val},
    to_attr(Rest, NewAttr);
to_attr([{res_s, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{res_s = Val},
    to_attr(Rest, NewAttr);
to_attr([{tenacity, Val} | Rest], Attr = #attr{}) ->
    NewAttr = Attr#attr{tenacity = Val},
    to_attr(Rest, NewAttr);
to_attr(_Rest, Attr) -> Attr.

to_items(Flag, L) -> to_items(Flag, 1, L, []).

to_items(_Flag, _N, [], Items) -> Items;
to_items(Flag, N, [I | T], Items) ->
    to_items(Flag, N + 1, T, [to_item(Flag, N, I) | Items]).

to_item(artifacts, N, {BaseId, Attr, Extra}) ->
    {ok, [Item]} = item:make(BaseId, 1, 1),
    {N, Item#item{attr = Attr, extra = Extra}};
to_item(holy_eqm, _N, {BaseId, MainAttr}) ->
    {ok, [Item]} = item:make(BaseId, 1, 1),
    Item#item{main_attr = MainAttr};
to_item(eqm, _N, BaseId) ->
    #item_base{type = ItemType} = item_data:get(BaseId),
    {ItemType, BaseId, ItemType}.


