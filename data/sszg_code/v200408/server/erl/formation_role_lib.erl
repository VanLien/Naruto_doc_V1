-file("src/mod/formation_role/formation_role_lib.erl",
      1).

-module(formation_role_lib).

-lager_records([{planes_load_partner,
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
		{sprite_plan, [ver, id, name, plan_sprites]},
		{team_sprite, [ver, team, plan_id, team_sprites]},
		{formation_sprite, [ver, type, team_list]},
		{m_sprite_tree,
		 [ver, lev, break_lev, all_attr, sprites, power,
		  max_power, formation_list, plan_list]},
		{sprite_hatch,
		 [ver, id, is_open, lev, do_id, need_point, do_point,
		  state, end_time, all_end_time]},
		{m_sprite_hatch,
		 [ver, list, day_privilege_mail, day_buy_list, handbook,
		  baodi_info]},
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
		{m_look, [use_id, list]},
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
		{formation_partner,
		 [ver, id, pos, bid, lev, star, break_lev, power,
		  use_skin, break_skills, set_skills, skills, dower_skill,
		  all_attr, base_attr, eqm, artifacts, holy_eqm, ext]},
		{formation_role_match,
		 [id, lev, power, max_power, zone_id]},
		{formation_role,
		 [ver, id, name, lev, sex, power, max_power, face_id,
		  face_file, avatar_bid, look_id, reg_time, zone_id, time,
		  formation_type, formation_lev, hallows_id, hallows_lev,
		  hallows_skill_lev, hallows_look_id,
		  hallows_all_look_ids, hallows_lucky, hallows_seal,
		  hallows_refine, sprite_lev, sprite_break_lev, sprites,
		  partners, ext]},
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
		{formation_attr_data,
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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

-export([login/1, test_copy_role/2, test_match/2,
	 apply_test_match/3, match/4, to_partner/1, gm_info/1,
	 gm_info_test/1]).

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

-file("src/mod/formation_role/formation_role_lib.erl",
      18).

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

-file("src/mod/formation_role/formation_role_lib.erl",
      19).

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

-file("src/mod/formation_role/formation_role_lib.erl",
      20).

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

-file("src/mod/formation_role/formation_role_lib.erl",
      21).

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

-file("src/mod/formation_role/formation_role_lib.erl",
      22).

-file("inc/formation_role.hrl", 1).

-record(formation_role,
	{ver = 1, id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 power = 0, max_power = 0, face_id = 0, face_file = <<>>,
	 avatar_bid = 0, look_id = 0, reg_time = 0, zone_id = 0,
	 time = 0, formation_type = 0, formation_lev = 0,
	 hallows_id = 0, hallows_lev = 0, hallows_skill_lev = 0,
	 hallows_look_id = 0, hallows_all_look_ids = [],
	 hallows_lucky = 0, hallows_seal = 0, hallows_refine = 0,
	 sprite_lev = 0, sprite_break_lev = 0, sprites = [],
	 partners = [], ext = []}).

-record(formation_role_match,
	{id = {0, <<>>}, lev = 0, power = 0, max_power = 0,
	 zone_id = 0}).

-record(formation_partner,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 pos = 0  :: pos_integer(), bid = 1  :: pos_integer(),
	 lev = 1  :: pos_integer(), star = 1  :: pos_integer(),
	 break_lev = 1  :: pos_integer(),
	 power = 1  :: pos_integer(),
	 use_skin = 0  :: pos_integer(),
	 break_skills = []  :: list(),
	 set_skills = []  :: list(), skills = []  :: list(),
	 dower_skill = []  :: list(), all_attr, base_attr,
	 eqm = []  :: list(), artifacts = []  :: list(),
	 holy_eqm = []  :: list(), ext = []  :: list()}).

-file("src/mod/formation_role/formation_role_lib.erl",
      23).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/formation_role/formation_role_lib.erl",
      24).

-file("inc/looks.hrl", 1).

-record(m_look, {use_id = 0, list = []}).

-file("src/mod/formation_role/formation_role_lib.erl",
      25).

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

-file("src/mod/formation_role/formation_role_lib.erl",
      26).

-file("inc/sprite.hrl", 1).

-record(m_sprite_hatch,
	{ver = 5, list = [], day_privilege_mail = 0,
	 day_buy_list = [], handbook = [], baodi_info = []}).

-record(sprite_hatch,
	{ver = 2, id = 0, is_open = 0, lev = 0, do_id = 0,
	 need_point = 0, do_point = 0, state = 0, end_time = 0,
	 all_end_time = 0}).

-record(m_sprite_tree,
	{ver = 3, lev = 1, break_lev = 0, all_attr,
	 sprites = [], power = 0, max_power = 0,
	 formation_list = []  :: list(),
	 plan_list = []  :: list()}).

-record(formation_sprite,
	{ver = 1  :: pos_integer(), type = 0  :: pos_integer(),
	 team_list = []  :: list()}).

-record(team_sprite,
	{ver = 1  :: pos_integer(), team = 1  :: pos_integer(),
	 plan_id = 0  :: pos_integer(),
	 team_sprites = []  :: list()}).

-record(sprite_plan,
	{ver = 1  :: pos_integer(), id = 1  :: pos_integer(),
	 name = <<>>  :: string(),
	 plan_sprites = []  :: list()}).

-file("src/mod/formation_role/formation_role_lib.erl",
      27).

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

-file("src/mod/formation_role/formation_role_lib.erl",
      28).

gm_info(Role = #role{partner_bag =
			 #partner_bag{partner_list = PartnerList}}) ->
    FormationSys = #formation_sys{pos_info = PosInfo} =
		       formation:get_sys_formation(Role, 1),
    Partners = [P
		|| P = #partner{id = Id} <- PartnerList,
		   lists:keymember(Id, #formation_pos.id, PosInfo)],
    FormationRole = to_formation_role(Role, FormationSys,
				      Partners),
    case big_world_lib:center_node() ==
	   cluster_lib:center_node()
	of
      true ->
	  cluster_lib:cast(center, c_formation_role_mgr, info,
			   [{sync, FormationRole}]);
      _ ->
	  cluster_lib:cast(center, c_formation_role_mgr, info,
			   [{sync, FormationRole}]),
	  big_world_lib:cast(center, c_formation_role_mgr, info,
			     [{sync, FormationRole}])
    end,
    {ok, Role}.

gm_info_test(Role = #role{partner_bag =
			      #partner_bag{partner_list = PartnerList}}) ->
    FormationSys = #formation_sys{pos_info = PosInfo} =
		       formation:get_sys_formation(Role, 1),
    Partners = [P
		|| P = #partner{id = Id} <- PartnerList,
		   lists:keymember(Id, #formation_pos.id, PosInfo)],
    Num_13_Star =
	planes_data:get_const(formation_role_13_start_num),
    case judge_13_star(Partners, 0, Num_13_Star) of
      true ->
	  case length(Partners) >= 5 of
	    true ->
		Powers = [Power0
			  || #partner{power = Power0} <- Partners],
		AvgPower = lists:sum(Powers) / max(1, length(Powers)),
		MaxPower = lists:max(Powers),
		case MaxPower < AvgPower * 1.3999999999999999 of
		  true ->
		      FormationRole = to_formation_role(Role, FormationSys,
							Partners),
		      case big_world_lib:center_node() ==
			     cluster_lib:center_node()
			  of
			true ->
			    cluster_lib:cast(center, c_formation_role_mgr, info,
					     [{sync, FormationRole}]);
			_ ->
			    cluster_lib:cast(center, c_formation_role_mgr, info,
					     [{sync, FormationRole}]),
			    big_world_lib:cast(center, c_formation_role_mgr,
					       info, [{sync, FormationRole}])
		      end,
		      notice:alert(Role, lang:get(<<"上报成功"/utf8>>)),
		      {ok, Role};
		  _ -> {ok, Role}
		end;
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end.

test_copy_role(_Role, {N, N}) -> ok;
test_copy_role(Role = #role{id = {_, SrvId},
			    partner_bag =
				PartnerBag = #partner_bag{partner_list =
							      PartnerList}},
	       {Min, Max}) ->
    Power = util:rand(50000, 2000000),
    AvgPower = round(Power / 5),
    #formation_sys{pos_info = PosInfo} =
	formation:get_sys_formation(Role, 1),
    Partners = [P#partner{power = AvgPower}
		|| P = #partner{id = Id} <- PartnerList,
		   lists:keymember(Id, #formation_pos.id, PosInfo)],
    login(Role#role{id = {Min, SrvId}, max_power = Power,
		    zone_id = Min div 200, m_var = #m_var{},
		    partner_bag =
			PartnerBag#partner_bag{partner_list = Partners}}),
    test_copy_role(Role, {Min + 1, Max}).

test_match(_Role, 0) -> ok;
test_match(_Role, {0, _}) -> ok;
test_match(Role, {N, []}) -> test_match(Role, N);
test_match(Role, {N, Powers = [{_, _} | _]}) ->
    test_match(Role, {N, [Powers]});
test_match(Role, {N, Powers}) ->
    match(Role, Powers, [],
	  {formation_role_lib, apply_test_match, [Powers]}),
    test_match(Role, {N - 1, Powers});
test_match(Role = #role{}, N) ->
    Power = util:rand(200000, 2000000),
    Powers = [[{Power * 8.0e-1, Power * 1.2}]
	      || _ <- lists:seq(1, util:rand(1, 3))],
    match(Role, Powers, [],
	  {formation_role_lib, apply_test_match, [Powers]}),
    test_match(Role, N - 1).

apply_test_match(_Role, [], _A) -> ok;
apply_test_match(Role, [Ret = false | T],
		 [Powers | T2]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidformation_role_lib109, _,
       {__Levelformation_role_lib109,
	__Tracesformation_role_lib109}}
	  when __Levelformation_role_lib109 band 128 /= 0 orelse
		 __Tracesformation_role_lib109 /= [] ->
	  lager:do_log(debug,
		       [{module, formation_role_lib},
			{function, apply_test_match}, {line, 109},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("ret=~w", [Ret]), none, 4096, 128,
		       __Levelformation_role_lib109,
		       __Tracesformation_role_lib109, lager_event,
		       __Pidformation_role_lib109);
      _ -> ok
    end,
    Msg =
	util:fbin(lang:get(<<"匹配战力:~w 英雄池匹配结果:~w "/utf8>>),
		  [Powers, Ret]),
    sys_conn:pack_send(10399,
		       {1, unicode:characters_to_binary(Msg)}),
    apply_test_match(Role, T, T2);
apply_test_match(Role,
		 [Ret = #formation_role{power = Power, id = {Rid, SrvId},
					name = Name, partners = PL}
		  | T],
		 [Powers | T2]) ->
    [to_partner(P) || P <- PL],
    PInfo = [{Bid, {star, Star}, {lev, Lev},
	      {power, Power0}}
	     || #formation_partner{bid = Bid, star = Star, lev = Lev,
				   power = Power0}
		    <- PL],
    Msg =
	util:fbin(lang:get(<<"匹配战力:~w 英雄池匹配结果:~w:~s:~ts power=>~w "
			     "partners=~w"/utf8>>),
		  [Powers, Rid, SrvId, Name, Power, PInfo]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidformation_role_lib117, _,
       {__Levelformation_role_lib117,
	__Tracesformation_role_lib117}}
	  when __Levelformation_role_lib117 band 128 /= 0 orelse
		 __Tracesformation_role_lib117 /= [] ->
	  lager:do_log(debug,
		       [{module, formation_role_lib},
			{function, apply_test_match}, {line, 117},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       Msg, none, 4096, 128, __Levelformation_role_lib117,
		       __Tracesformation_role_lib117, lager_event,
		       __Pidformation_role_lib117);
      _ -> ok
    end,
    sys_conn:pack_send(10399,
		       {1, unicode:characters_to_binary(Msg)}),
    apply_test_match(Role, T, T2).

-spec login(#role{}) -> ok | {ok, #role{}}.

login(Role = #role{partner_bag =
		       #partner_bag{partner_list = PartnerList},
		   lev = Lev})
    when Lev >= 30 ->
    Now = date:unixtime(),
    LastTime = var:get_var(Role, other, 3099, 0),
    case Now > LastTime + 86800 of
      true ->
	  FormationSys = #formation_sys{pos_info = PosInfo} =
			     formation:get_sys_formation(Role, 1),
	  Partners = [P
		      || P = #partner{id = Id} <- PartnerList,
			 lists:keymember(Id, #formation_pos.id, PosInfo)],
	  Num_13_Star =
	      planes_data:get_const(formation_role_13_start_num),
	  case judge_13_star(Partners, 0, Num_13_Star) of
	    true ->
		case length(Partners) >= 5 of
		  true ->
		      Powers = [Power0
				|| #partner{power = Power0} <- Partners],
		      AvgPower = lists:sum(Powers) / max(1, length(Powers)),
		      MaxPower = lists:max(Powers),
		      case MaxPower < AvgPower * 1.3999999999999999 of
			true ->
			    NRole = var:set_var(Role, other, 3099, Now),
			    FormationRole = to_formation_role(Role,
							      FormationSys,
							      Partners),
			    case big_world_lib:center_node() ==
				   cluster_lib:center_node()
				of
			      true ->
				  cluster_lib:cast(center, c_formation_role_mgr,
						   info,
						   [{sync, FormationRole}]);
			      _ ->
				  cluster_lib:cast(center, c_formation_role_mgr,
						   info,
						   [{sync, FormationRole}]),
				  big_world_lib:cast(center,
						     c_formation_role_mgr, info,
						     [{sync, FormationRole}])
			    end,
			    {ok, NRole};
			_ -> {ok, Role}
		      end;
		  _ -> {ok, Role}
		end;
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end;
login(Role) -> {ok, Role}.

-spec match(#role{}, list(), list(),
	    {atom(), atom(), list}) -> ok.

match(_Role = #role{id = RoleId, zone_id = ZoneId,
		    lev = Lev},
      Powers0, ExcludeRoleIds, {M, F, A}) ->
    Powers = [[{MinPower, MaxPower}
	       || {MinPower, MaxPower} <- Powers1]
	      || Powers1 <- Powers0],
    case [1 || I <- Powers, I =:= []] of
      [_ | _] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidformation_role_lib173, _,
	     {__Levelformation_role_lib173,
	      __Tracesformation_role_lib173}}
		when __Levelformation_role_lib173 band 8 /= 0 orelse
		       __Tracesformation_role_lib173 /= [] ->
		lager:do_log(error,
			     [{module, formation_role_lib}, {function, match},
			      {line, 173}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("powers_err:~w", [Powers0]), none,
			     4096, 8, __Levelformation_role_lib173,
			     __Tracesformation_role_lib173, lager_event,
			     __Pidformation_role_lib173);
	    _ -> ok
	  end;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidformation_role_lib175, _,
	     {__Levelformation_role_lib175,
	      __Tracesformation_role_lib175}}
		when __Levelformation_role_lib175 band 128 /= 0 orelse
		       __Tracesformation_role_lib175 /= [] ->
		lager:do_log(debug,
			     [{module, formation_role_lib}, {function, match},
			      {line, 175}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("match power=~w   func=~w",
					   [Powers0, {M, F, A}]),
			     none, 4096, 128, __Levelformation_role_lib175,
			     __Tracesformation_role_lib175, lager_event,
			     __Pidformation_role_lib175);
	    _ -> ok
	  end,
	  WorldLev = max(1, world_lev:get_world_lev()),
	  {MinVal, MaxVal} =
	      planes_data:get_guard_match(WorldLev),
	  Match = #{role_id => RoleId, back_pid => {role, self()},
		    min_zone => max(1, ZoneId - MinVal),
		    max_zone => ZoneId + MaxVal, powers => Powers,
		    match_num => length(Powers),
		    exclude_roleids => ExcludeRoleIds, func => {M, F, A},
		    lev => Lev,
		    min_lev =>
			max(1,
			    Lev - planes_data:get_const(planes_lev_battle_min)),
		    max_lev =>
			Lev + planes_data:get_const(planes_lev_battle_max)},
	  formation_role_match_mgr:info(RoleId, {match, Match})
    end;
match({MgrPid, RoleId, Lev, MinLev, MaxLev}, Powers0,
      ExcludeRoleIds, {M, F, A}) ->
    Powers = [[{MinPower, MaxPower}
	       || {MinPower, MaxPower} <- Powers1]
	      || Powers1 <- Powers0],
    case [1 || I <- Powers, I =:= []] of
      [_ | _] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidformation_role_lib197, _,
	     {__Levelformation_role_lib197,
	      __Tracesformation_role_lib197}}
		when __Levelformation_role_lib197 band 8 /= 0 orelse
		       __Tracesformation_role_lib197 /= [] ->
		lager:do_log(error,
			     [{module, formation_role_lib}, {function, match},
			      {line, 197}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("powers_err:~w", [Powers0]), none,
			     4096, 8, __Levelformation_role_lib197,
			     __Tracesformation_role_lib197, lager_event,
			     __Pidformation_role_lib197);
	    _ -> ok
	  end;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidformation_role_lib199, _,
	     {__Levelformation_role_lib199,
	      __Tracesformation_role_lib199}}
		when __Levelformation_role_lib199 band 128 /= 0 orelse
		       __Tracesformation_role_lib199 /= [] ->
		lager:do_log(debug,
			     [{module, formation_role_lib}, {function, match},
			      {line, 199}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("match power=~w lev=~w func=~w",
					   [Powers0, Lev, {M, F, A}]),
			     none, 4096, 128, __Levelformation_role_lib199,
			     __Tracesformation_role_lib199, lager_event,
			     __Pidformation_role_lib199);
	    _ -> ok
	  end,
	  WorldLev = max(1, world_lev:get_world_lev()),
	  {MinVal, MaxVal} =
	      planes_data:get_guard_match(WorldLev),
	  ZoneId = sys_env:get(zone_id),
	  Match = #{role_id => RoleId, back_pid => {mgr, MgrPid},
		    min_zone => max(1, ZoneId - MinVal),
		    max_zone => ZoneId + MaxVal, powers => Powers,
		    match_num => length(Powers),
		    exclude_roleids => ExcludeRoleIds, func => {M, F, A},
		    lev => Lev, min_lev => MinLev, max_lev => MaxLev},
	  formation_role_match_mgr:info(RoleId, {match, Match})
    end.

to_formation_role(Role = #role{id = RoleId, name = Name,
			       lev = Lev, sex = Sex, max_power = MaxPower,
			       face_id = FaceId,
			       m_avatar = #m_avatar{used = AvatarBaseId},
			       m_look = #m_look{use_id = LookId},
			       m_sprite_tree =
				   #m_sprite_tree{lev = SpriteLev,
						  break_lev = SpriteBreakLev,
						  sprites = Sprites,
						  all_attr = SpritesAttr}},
		  #formation_sys{type = FormationType, pos_info = PosInfo,
				 hallows_id = HallowsId},
		  Partners) ->
    {HallowsId, HallowsLev, HallowsSkillLev, HallowsLookId,
     HallowsLookIds, HallowsLucky, HallowsSeal} =
	hallows_lib:get_hallows_info2(Role, HallowsId),
    HallowsRefine = hallows_lib:get_hallows_refine(Role,
						   HallowsId),
    Power = lists:sum([Power0
		       || #partner{power = Power0} <- Partners]),
    {_, FaceFile, FaceUpdateTime} =
	role_face:face_info(Role),
    Ext = util:if_true(FaceUpdateTime > 0,
		       [{1, FaceUpdateTime}], []),
    #formation_role{id = RoleId, name = Name, lev = Lev,
		    sex = Sex, power = Power, max_power = MaxPower,
		    face_id = FaceId, face_file = FaceFile,
		    avatar_bid = AvatarBaseId, look_id = LookId,
		    formation_type = FormationType, formation_lev = 1,
		    hallows_id = HallowsId, hallows_lev = HallowsLev,
		    hallows_skill_lev = HallowsSkillLev,
		    hallows_look_id = HallowsLookId,
		    hallows_all_look_ids = HallowsLookIds,
		    hallows_lucky = HallowsLucky,
		    hallows_seal = HallowsSeal,
		    hallows_refine = HallowsRefine, sprite_lev = SpriteLev,
		    sprite_break_lev = SpriteBreakLev, sprites = Sprites,
		    zone_id = Role#role.zone_id,
		    reg_time = Role#role.reg_time, time = date:unixtime(),
		    partners =
			[to_formation_partner(P, PosInfo) || P <- Partners],
		    ext = Ext}.

to_formation_partner(P = #partner{id = Id,
				  resonate_lev = ResonateLev},
		     PosInfo) ->
    #formation_pos{pos = Pos} = lists:keyfind(Id,
					      #formation_pos.id, PosInfo),
    Ext = util:if_true(ResonateLev > 0, [{1, ResonateLev}],
		       []),
    #formation_partner{id = P#partner.id, pos = Pos,
		       bid = P#partner.bid, lev = P#partner.lev,
		       star = P#partner.star, break_lev = P#partner.break_lev,
		       power = P#partner.power, use_skin = P#partner.use_skin,
		       break_skills = P#partner.break_skills,
		       set_skills = P#partner.set_skills,
		       skills = P#partner.skills,
		       dower_skill = P#partner.dower_skill,
		       all_attr = P#partner.all_attr,
		       base_attr = P#partner.base_attr,
		       eqm =
			   [ItemBid
			    || #item{base_id = ItemBid} <- P#partner.eqm],
		       artifacts =
			   [{ItemBid, Attr, Extra}
			    || {_,
				#item{base_id = ItemBid, attr = Attr,
				      extra = Extra}}
				   <- P#partner.artifacts],
		       holy_eqm =
			   [{ItemBid, MainAttr}
			    || #item{base_id = ItemBid, main_attr = MainAttr}
				   <- P#partner.holy_eqm],
		       ext = Ext}.

to_partner(FP = #formation_partner{bid = Bid,
				   ext = Ext}) ->
    #partner_base_data{name = Name, camp_type = CampType,
		       type = PartnerType, rare_type = RareType} =
	partner_data:get_base(Bid),
    ResonateLev1 = case lists:keyfind(1, 1, Ext) of
		     {1, ResonateLev} -> ResonateLev;
		     _ -> 0
		   end,
    #partner{id = FP#formation_partner.id, name = Name,
	     camp_type = CampType, type = PartnerType,
	     rare_type = RareType, bid = FP#formation_partner.bid,
	     lev = FP#formation_partner.lev,
	     star = FP#formation_partner.star,
	     break_lev = FP#formation_partner.break_lev,
	     power = FP#formation_partner.power,
	     use_skin = FP#formation_partner.use_skin,
	     break_skills = FP#formation_partner.break_skills,
	     set_skills = FP#formation_partner.set_skills,
	     skills = FP#formation_partner.skills,
	     dower_skill = FP#formation_partner.dower_skill,
	     all_attr = FP#formation_partner.all_attr,
	     base_attr = FP#formation_partner.base_attr,
	     eqm = to_items(eqm, FP#formation_partner.eqm),
	     holy_eqm =
		 to_items(holy_eqm, FP#formation_partner.holy_eqm),
	     artifacts =
		 to_items(artifacts, FP#formation_partner.artifacts),
	     resonate_lev = ResonateLev1}.

to_items(Flag, L) -> to_items(Flag, 1, L, []).

to_items(_Flag, _N, [], Items) -> Items;
to_items(Flag, N, [I | T], Items) ->
    case to_item(Flag, N, I) of
      false -> to_items(Flag, N + 1, T, Items);
      ReturnItem ->
	  to_items(Flag, N + 1, T, [ReturnItem | Items])
    end.

to_item(artifacts, N, {BaseId, Attr, Extra}) ->
    {ok, [Item]} = item:make(BaseId, 1, 1),
    {N, Item#item{attr = Attr, extra = Extra}};
to_item(holy_eqm, _N, {BaseId, MainAttr}) ->
    case item:make(BaseId, 1, 1) of
      {ok, [Item]} -> Item#item{main_attr = MainAttr};
      _ -> false
    end;
to_item(eqm, _N, BaseId) ->
    {ok, [Item]} = item:make(BaseId, 1, 1), Item.

judge_13_star(_, Time, MaxTime) when Time > MaxTime ->
    false;
judge_13_star([], _Time, _MaxTime) -> true;
judge_13_star([#partner{star = Star} | Rest], Time,
	      MaxTime)
    when Star >= 13 ->
    judge_13_star(Rest, Time + 1, MaxTime);
judge_13_star([#partner{} | Rest], Time, MaxTime) ->
    judge_13_star(Rest, Time, MaxTime);
judge_13_star(_Rest, _Time, _MaxTime) -> false.


