-file("data/arena_peak_champion.erl", 1).

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on.erl",
      1).

-module(arena_peak_champion).

-lager_records([{peak_champion_pk,
		 [id, step, round, group, score, is_guess, a_pos, a_id,
		  a_name, a_lev, a_face, a_avatar_id, a_sex, a_defense,
		  a_bet, a_power, a_robot_id, b_pos, b_id, b_name, b_lev,
		  b_face, b_avatar_id, b_sex, b_defense, b_bet, b_power,
		  b_robot_id, ret, result_info, diff_power, pk_rlist,
		  a_sprite_lev, a_sprites, a_sprite_attr, b_sprite_lev,
		  b_sprites, b_sprite_attr, a_face_update_time,
		  a_face_file, b_face_update_time, b_face_file,
		  a_sprites_list, b_sprites_list, a_break_groups,
		  b_break_groups]},
		{peak_champion_32_pk,
		 [pos, id, name, lev, face_id, avatar_bid, sex,
		  max_power, ret, ext]},
		{arena_peak_result_info,
		 [order, ret, time, round, a_end_hp, b_end_hp,
		  replay_info]},
		{arena_peak_role_partner,
		 [pos, id, bid, lev, star, break_lev, power, skin_id,
		  dower_skill, set_skill, attr, hurt, behurt, curt, ext]},
		{arena_peak_role_defense,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_look_id, hallows_skill_lev, hallows_lucky,
		  hallows_seal, hallows_refine, hallows_all_look_ids,
		  power, plist]},
		{arena_peak_champion_role,
		 [id, name, lev, face_id, avatar_bid, sex, power,
		  defense, sprite_lev, sprites, sprites_attr, old_rank,
		  old_score, score, score_32, rank, robot_id, group,
		  group256, group64, combat_num, win, lose,
		  face_update_time, face_file, sprites_list,
		  break_groups]},
		{arena_peak_rank,
		 [rank, id, name, lev, face_id, avatar_bid, score, power,
		  sex, face_update_time, face_file]},
		{arena_peak_rank_info, [zone_id, list]},
		{c_arena_zone_info,
		 [zone_id, main_id, main_list, srv_lists, do_merge_lists,
		  num]},
		{m_arena_peak_champion,
		 [var, period, zone_id, old_periods, defense]},
		{arena_cluster_fight_lock,
		 [id, is_fight, fight_rid, fight_pid]},
		{arena_cluster_replay_partner,
		 [pos, bid, lev, star, ext]},
		{arena_cluster_replay,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_cluster_log,
		 [id, atk_id, atk_name, atk_face, atk_lev, atk_rank,
		  atk_score, def_id, def_name, def_face, def_lev,
		  def_rank, def_score, ret, win_count, lose_count,
		  combat_type, replay_list, time, atk_face_update_time,
		  atk_face_file, def_face_update_time, def_face_file]},
		{role_arena_cluster_log, [id, list]},
		{arena_cluster_role,
		 [id, name, vip, lev, sex, gid, gname, face, power,
		  max_power, lookid, score, rank, time, avatar_id,
		  cont_win, ext]},
		{arena_cluster_rank, [rank, id, score]},
		{arena_cluster_f_pos,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  dower_skill, set_skill, attr, extra]},
		{arena_cluster_f_order,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, pos_info, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  power, is_hidden, extra]},
		{arena_cluster_f,
		 [id, name, gname, idx, lev, vip_lev, sex, face, power,
		  rank, order_info, robot_id, avatar_id, look, ext]},
		{m_arena_cluster,
		 [ver, ref_time, formations, ref_list, season_ref_time,
		  season_combat_num, best_rank, day_combat_num,
		  acc_combat_num, day_reward, turn_card_reward,
		  turn_card_num, turn_card_history, worship,
		  worship_list]},
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
		{champion_result, [id, rank, cnum, win]},
		{champion_pk,
		 [id, step, round, group, score, is_guess, a_pos, a_id,
		  a_name, a_lev, a_gid, a_gname, a_face, a_avatar_id,
		  a_sex, a_plist, a_bet, a_power, a_max_power, a_robot_id,
		  a_formation_type, a_formation_lev, a_time, b_pos, b_id,
		  b_name, b_lev, b_gid, b_gname, b_face, b_avatar_id,
		  b_sex, b_plist, b_bet, b_power, b_max_power,
		  b_formation_type, b_formation_lev, b_robot_id, b_time,
		  ret, replay_id, diff_power, pk_rlist, a_sprite_lev,
		  a_sprites, b_sprite_lev, b_sprites, a_face_update_time,
		  a_face_file, b_face_update_time, b_face_file]},
		{champion_role_log, [id, logs]},
		{champion_bet_log, [id, rid, target, bet, get_bet]},
		{champion_bet, [id, bet, logs]},
		{champion_32_pk,
		 [pos, id, name, lev, face, sex, max_power, ret,
		  replay_id, face_update_time, face_file]},
		{arena_champion_rank,
		 [rank, id, old_rank, score, score_32]},
		{arena_champion_role,
		 [id, name, lev, sex, gid, gname, face, max_power, power,
		  lookid, old_rank, old_score, score, score_32, rank,
		  avatar_id, robot_id, group, group32, combat_num, win,
		  lose, time, face_update_time, face_file, match_id]},
		{champion_state,
		 [round, round_status, step, step_status,
		  step_status_time, state_start_time, state_end_time,
		  season_start_time, season_end_time]},
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

-export([push_base/1, push_role_pk/3, push_guess/3,
	 push_guess_update/3, push_role_result/3,
	 push_role_guess/3, push_role_pk_log/3,
	 push_role_champion/3, push_pos_pk/3, push_point/3,
	 guess_bet/3, set_formation_sys/2, get_formation_sys/1,
	 get_formation_ids/1, get_point_info/1, do_point/2,
	 reset_point/1, reset_point2/1, check_open/1,
	 get_main_id/1]).

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

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on.erl",
      35).

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

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on.erl",
      36).

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

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on.erl",
      37).

-file("inc/arena_champion.hrl", 1).

-record(champion_state,
	{round = 0, round_status = 0, step = 0, step_status = 0,
	 step_status_time = 0, state_start_time = 0,
	 state_end_time = 0, season_start_time = 0,
	 season_end_time = 0}).

-record(arena_champion_role,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, max_power = 0,
	 power = 0, lookid = 0, old_rank = 0, old_score = 0,
	 score = 0, score_32 = 0, rank = 0, avatar_id = 0,
	 robot_id = 0, group = 0, group32 = 0, combat_num = 0,
	 win = 0, lose = 0, time = 0, face_update_time = 0,
	 face_file = <<>>, match_id = {0, <<>>}}).

-record(arena_champion_rank,
	{rank = 0, id = {0, <<>>}, old_rank = 0, score = 0,
	 score_32 = 0}).

-record(champion_32_pk,
	{pos = 0, id = {0, <<>>}, name = <<>>, lev = 0,
	 face = 0, sex = 0, max_power = 0, ret = 0,
	 replay_id = 0, face_update_time = 0, face_file = <<>>}).

-record(champion_bet,
	{id = {0, <<>>}, bet = 0, logs = []}).

-record(champion_bet_log,
	{id = 0, rid = {0, <<>>}, target = 1, bet = 0,
	 get_bet = 0}).

-record(champion_role_log, {id = {0, <<>>}, logs = []}).

-record(champion_pk,
	{id = 0, step = 0, round = 0, group = 0, score = 0,
	 is_guess = 1, a_pos = 0, a_id = {0, <<>>},
	 a_name = <<>>, a_lev = 0, a_gid = {0, <<>>},
	 a_gname = <<>>, a_face = 0, a_avatar_id = 0, a_sex = 0,
	 a_plist = [], a_bet = 0, a_power = 0, a_max_power = 0,
	 a_robot_id = 0, a_formation_type = 1,
	 a_formation_lev = 1, a_time = 0, b_pos = 0,
	 b_id = {0, <<>>}, b_name = <<>>, b_lev = 0,
	 b_gid = {0, <<>>}, b_gname = <<>>, b_face = 0,
	 b_avatar_id = 0, b_sex = 0, b_plist = [], b_bet = 0,
	 b_power = 0, b_max_power = 0, b_formation_type = 1,
	 b_formation_lev = 1, b_robot_id = 0, b_time = 0,
	 ret = 0, replay_id = 0, diff_power = 0, pk_rlist = [],
	 a_sprite_lev = 0, a_sprites = [], b_sprite_lev = 0,
	 b_sprites = [], a_face_update_time = 0,
	 a_face_file = <<>>, b_face_update_time = 0,
	 b_face_file = <<>>}).

-record(champion_result,
	{id = {0, <<>>}, rank = 0, cnum = 0, win = 0}).

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on.erl",
      38).

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

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on.erl",
      39).

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

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on.erl",
      40).

-file("inc/arena_cluster.hrl", 1).

-record(m_arena_cluster,
	{ver = 1, ref_time = 0, formations = [], ref_list = [],
	 season_ref_time = 0, season_combat_num = 0,
	 best_rank = 0, day_combat_num = 0, acc_combat_num = 0,
	 day_reward = [], turn_card_reward = [],
	 turn_card_num = 0, turn_card_history = [], worship = 0,
	 worship_list = []}).

-record(arena_cluster_f,
	{id = {0, <<>>}, name = <<>>, gname = <<>>, idx = 0,
	 lev = 0, vip_lev = 0, sex = 0, face = 0, power = 0,
	 rank = 0, order_info = [], robot_id = 0, avatar_id = 0,
	 look = 0, ext = []}).

-record(arena_cluster_f_order,
	{order, formation_type = 1, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0, pos_info = [],
	 hallows_look_id = 0, hallows_lucky = 0,
	 hallows_seal = 0, hallows_all_look_ids = [], power = 0,
	 is_hidden = 0, extra = []}).

-record(arena_cluster_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0,
	 dower_skill = [], set_skill = [], attr, extra = []}).

-record(arena_cluster_rank,
	{rank = 0, id = {0, <<>>}, score = 0}).

-record(arena_cluster_role,
	{id = {0, <<>>}, name = <<>>, vip = 0, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, score = 0, rank = 0,
	 time = 0, avatar_id = 0, cont_win = 0, ext = []}).

-record(role_arena_cluster_log,
	{id = {0, <<>>}, list = []}).

-record(arena_cluster_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_lev = 0, atk_rank = 0, atk_score = 0,
	 def_id = {0, <<>>}, def_name = <<>>, def_face = 0,
	 def_lev = 0, def_rank = 0, def_score = 0, ret = 1,
	 win_count = 0, lose_count = 0, combat_type = 0,
	 replay_list = [], time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(arena_cluster_replay,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_cluster_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-record(arena_cluster_fight_lock,
	{id = {0, <<>>}, is_fight = 0, fight_rid = {0, <<>>},
	 fight_pid = 0}).

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on.erl",
      41).

-file("inc/arena_peak_champion.hrl", 1).

-record(m_arena_peak_champion,
	{var = 2, period = 0, zone_id = 0, old_periods = [],
	 defense = []}).

-record(c_arena_zone_info,
	{zone_id = 0, main_id = <<>>, main_list = [],
	 srv_lists = [], do_merge_lists = [], num = 0}).

-record(arena_peak_rank_info,
	{zone_id = {0, 0}, list = 0}).

-record(arena_peak_rank,
	{rank = 0, id = {0, <<>>}, name = 0, lev = 0,
	 face_id = 0, avatar_bid = 0, score = 0, power = 0,
	 sex = 0, face_update_time = 0, face_file = <<>>}).

-record(arena_peak_champion_role,
	{id = {0, <<>>}, name = <<>>, lev = 0, face_id = 0,
	 avatar_bid = 0, sex = 0, power = 0, defense = [],
	 sprite_lev = 0, sprites = [], sprites_attr,
	 old_rank = 0, old_score = 0, score = 0, score_32 = 0,
	 rank = 0, robot_id = 0, group = 0, group256 = 0,
	 group64 = 0, combat_num = 0, win = 0, lose = 0,
	 face_update_time = 0, face_file = <<>>,
	 sprites_list = [], break_groups = []}).

-record(arena_peak_role_defense,
	{order = 0, formation_type = 1, hallows_id = 1,
	 hallows_lev = 0, hallows_look_id = 0,
	 hallows_skill_lev = 0, hallows_lucky = 0,
	 hallows_seal = 0, hallows_refine = 0,
	 hallows_all_look_ids = [], power = 0, plist = []}).

-record(arena_peak_role_partner,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, skin_id = 0, dower_skill = [],
	 set_skill = [], attr, hurt = 0, behurt = 0, curt = 0,
	 ext = #{}}).

-record(arena_peak_result_info,
	{order = 0, ret = 0, time = 0, round = 0, a_end_hp = 0,
	 b_end_hp = 0, replay_info = {0, <<>>}}).

-record(peak_champion_32_pk,
	{pos = 0, id = {0, <<>>}, name = <<>>, lev = 0,
	 face_id = 0, avatar_bid = 0, sex = 0, max_power = 0,
	 ret = 0, ext = []}).

-record(peak_champion_pk,
	{id = 0, step = 0, round = 0, group = 0, score = 0,
	 is_guess = 1, a_pos = 0, a_id = {0, <<>>},
	 a_name = <<>>, a_lev = 0, a_face = 0, a_avatar_id = 0,
	 a_sex = 0, a_defense = [], a_bet = 0, a_power = 0,
	 a_robot_id = 0, b_pos = 0, b_id = {0, <<>>},
	 b_name = <<>>, b_lev = 0, b_face = 0, b_avatar_id = 0,
	 b_sex = 0, b_defense = [], b_bet = 0, b_power = 0,
	 b_robot_id = 0, ret = 0, result_info = [],
	 diff_power = 0, pk_rlist = [], a_sprite_lev = 0,
	 a_sprites = [], a_sprite_attr, b_sprite_lev = 0,
	 b_sprites = [], b_sprite_attr, a_face_update_time = 0,
	 a_face_file = <<>>, b_face_update_time = 0,
	 b_face_file = <<>>, a_sprites_list = [],
	 b_sprites_list = [], a_break_groups = [],
	 b_break_groups = []}).

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on.erl",
      42).

-spec get_main_id(#role{}) -> ok.

get_main_id(#role{id = {_, Sid}}) ->
    case ets:lookup(arena_peak_champion_zone_info, Sid) of
      [{Sid, ZoneId} | _] -> get_main_id(ZoneId);
      _ -> sys_lib:srv_id()
    end;
get_main_id(ZoneId) ->
    case ets:lookup(arena_peak_champion_main_id, ZoneId) of
      [{ZoneId, Val} | _] -> Val;
      _ -> sys_lib:srv_id()
    end.

-spec get_point_info(#role{}) -> ok.

get_point_info(Role = #role{id = RoleId,
			    m_arena_peak_champion =
				#m_arena_peak_champion{old_periods = L}}) ->
    case arena_peak_champion:check_open(Role) of
      false ->
	  sys_conn:pack_send(27730,
			     {[{Type, 1} || {Type, _} <- L]});
      _ ->
	  case lists:keyfind(1, 1, L) of
	    {_, 1} -> sys_conn:pack_send(27730, {L});
	    _ ->
		Sid = arena_peak_champion:get_main_id(Role),
		case cluster_lib:cast(Sid, arena_peak_champion_mgr,
				      apply,
				      [{arena_peak_champion, push_point,
					[{RoleId, get('@conn_pid'), L}]}])
		    of
		  {error, _} ->
		      sys_conn:pack_send(27730,
					 {[{Type, 1} || {Type, _} <- L]}),
		      ok;
		  _ -> ok
		end
	  end
    end.

-spec do_point(#role{}, pos_integer()) -> ok.

do_point(Role = #role{m_arena_peak_champion =
			  M = #m_arena_peak_champion{old_periods = L}},
	 Type)
    when Type == 1 orelse Type == 2 ->
    NewM = M#m_arena_peak_champion{old_periods =
				       lists:keystore(Type, 1, L, {Type, 1})},
    NewRole = Role#role{m_arena_peak_champion = NewM},
    {ok, NewRole};
do_point(Role, _Type) -> {ok, Role}.

-spec reset_point(#role{}) -> ok.

reset_point(Role = #role{m_arena_peak_champion =
			     M = #m_arena_peak_champion{zone_id = Time}}) ->
    Now = date:unixtime(),
    case Now >= Time of
      true ->
	  NewM = M#m_arena_peak_champion{zone_id =
					     Now + date:next_diff({5, 59, 59}),
					 old_periods = [{1, 0}, {2, 0}]},
	  NewRole = Role#role{m_arena_peak_champion = NewM},
	  {ok, NewRole};
      _ -> {ok, Role}
    end.

reset_point2(Role = #role{m_arena_peak_champion = M}) ->
    NewM = M#m_arena_peak_champion{old_periods =
				       [{1, 0}, {2, 0}]},
    Role#role{m_arena_peak_champion = NewM}.

-spec push_base(#role{}) -> ok.

push_base(Role = #role{id = RoleId}) ->
    MainId = arena_peak_champion:get_main_id(Role),
    {NowRank, _Score, _Power, Group256, Group64} =
	arena_peak_champion_db:cluster_role_rank_info(MainId,
						      RoleId),
    BestRank = var:get_role_var(RoleId, other, 22, 0),
    #champion_bet{bet = CanBet} =
	arena_peak_champion_db:cluster_get_bet(MainId, RoleId),
    sys_conn:pack_send(27701,
		       {NowRank, BestRank, CanBet, Group256, Group64}),
    ok.

-spec push_role_pk(atom(), #champion_state{},
		   tuple()) -> ok.

push_role_pk(StateName,
	     State = #champion_state{step = Step, round = Round,
				     round_status = RoundStatus},
	     {RoleId, ConnPid}) ->
    case arena_peak_champion_db:get_pk(RoleId) of
      {ok,
       PKT = #peak_champion_pk{step = Step, round = Round}}
	  when RoundStatus =:= 3 ->
	  PK = to_cli_pk(PKT),
	  sys_conn:pack_send(ConnPid, 27702,
			     PK#peak_champion_pk{ret = 0});
      {ok, PKT} ->
	  PK = to_cli_pk(PKT),
	  sys_conn:pack_send(ConnPid, 27702, PK);
      _ ->
	  sys_conn:pack_send(ConnPid, 27702, #peak_champion_pk{})
    end,
    ok.

-spec push_point(atom(), #champion_state{},
		 tuple()) -> ok.

push_point(idle, State = #champion_state{},
	   {_RoleId, ConnPid, L}) ->
    sys_conn:pack_send(ConnPid, 27730,
		       {[{Type, 1} || {Type, _} <- L]}),
    ok;
push_point(StateName,
	   State = #champion_state{step = Step, round = Round},
	   {RoleId, ConnPid, L}) ->
    case arena_peak_champion_db:get_pk(RoleId) of
      {ok, #peak_champion_pk{step = Step, round = Round}} ->
	  sys_conn:pack_send(ConnPid, 27730,
			     {lists:keystore(1, 1, L, {1, 0})});
      _ ->
	  sys_conn:pack_send(ConnPid, 27730,
			     {lists:keystore(1, 1, L, {1, 1})})
    end,
    ok.

-spec push_guess(atom(), tuple(), tuple()) -> ok.

push_guess(StateName,
	   State = #champion_state{step = Step, round = Round,
				   round_status = RoundStatus},
	   {RoleId, ConnPid}) ->
    case arena_peak_champion_db:get_pk([get(guess_id),
					get(guess_roleid)
					| arena_peak_champion_db:get_ext(guess_id,
									 [])])
	of
      {ok,
       PKT = #peak_champion_pk{step = Step, round = Round,
			       a_bet = ABet, b_bet = BBet}}
	  when RoundStatus =:= 3 ->
	  {_, BetType, BetVal} = list_util:keyfind(RoleId, 1,
						   util:get(guess_list, []),
						   {RoleId, 0, 0}),
	  ABetRatio = arena_peak_champion_mgr:calc_bet_ratio(ABet,
							     BBet),
	  BBetRatio = arena_peak_champion_mgr:calc_bet_ratio(BBet,
							     ABet),
	  PK = to_cli_pk(PKT),
	  sys_conn:pack_send(ConnPid, 27703,
			     {BetType, BetVal, ABetRatio, BBetRatio,
			      PK#peak_champion_pk{ret = 0}});
      {ok,
       PKT = #peak_champion_pk{a_bet = ABet, b_bet = BBet}} ->
	  {_, BetType, BetVal} = list_util:keyfind(RoleId, 1,
						   util:get(guess_list, []),
						   {RoleId, 0, 0}),
	  ABetRatio = arena_peak_champion_mgr:calc_bet_ratio(ABet,
							     BBet),
	  BBetRatio = arena_peak_champion_mgr:calc_bet_ratio(BBet,
							     ABet),
	  PK = to_cli_pk(PKT),
	  sys_conn:pack_send(ConnPid, 27703,
			     {BetType, BetVal, ABetRatio, BBetRatio, PK});
      _ ->
	  sys_conn:pack_send(ConnPid, 27703,
			     {0, 0, 0, 0, #peak_champion_pk{}})
    end,
    ok.

-spec push_guess_update(atom(), tuple(), tuple()) -> ok.

push_guess_update(StateName,
		  State = #champion_state{step = Step, round = Round,
					  round_status = RoundStatus},
		  {RoleId, ConnPid}) ->
    case arena_peak_champion_db:get_pk([get(guess_id),
					get(guess_roleid)
					| arena_peak_champion_db:get_ext(guess_id,
									 [])])
	of
      {ok,
       #peak_champion_pk{step = Step, round = Round,
			 a_bet = ABet, b_bet = BBet}} ->
	  ABetRatio = arena_peak_champion_mgr:calc_bet_ratio(ABet,
							     BBet),
	  BBetRatio = arena_peak_champion_mgr:calc_bet_ratio(BBet,
							     ABet),
	  sys_conn:pack_send(ConnPid, 27707,
			     {ABet, BBet, ABetRatio, BBetRatio});
      _ -> sys_conn:pack_send(ConnPid, 27707, {0, 0, 0, 0})
    end,
    ok.

-spec push_role_guess(atom(), #champion_state{},
		      tuple()) -> ok.

push_role_guess(StateName,
		State = #champion_state{step = Step, round = Round,
					round_status = RoundStatus},
		{RoleId, ConnPid}) ->
    L = case
	  d_ets_lib:lookup_element_ets(arena_peak_champion_bet,
				       RoleId, #champion_bet.logs)
	    of
	  {ok, Logs} ->
	      Fun = fun (#champion_bet_log{id = Id, rid = Rid,
					   target = Target, bet = Bet,
					   get_bet = GetBet}) ->
			    case arena_peak_champion_db:get_pk([Id, Rid]) of
			      {ok,
			       OT = #peak_champion_pk{step = Step,
						      round = Round}}
				  when RoundStatus =:= 3 ->
				  O = to_cli_pk(OT),
				  {true,
				   {Id, Target, Bet, GetBet,
				    O#peak_champion_pk{ret = 0}}};
			      {ok, OT = #peak_champion_pk{}} ->
				  O = to_cli_pk(OT),
				  {true, {Id, Target, Bet, GetBet, O}};
			      _ -> false
			    end
		    end,
	      lists:filtermap(Fun, Logs);
	  _ -> []
	end,
    sys_conn:pack_send(ConnPid, 27705, {L}),
    ok.

-spec push_role_pk_log(atom(), #champion_state{},
		       tuple()) -> ok.

push_role_pk_log(StateName,
		 State = #champion_state{step = Step, round = Round,
					 round_status = RoundStatus},
		 {RoleId, ConnPid}) ->
    #champion_role_log{logs = Logs} =
	arena_peak_champion_db:get_log(RoleId),
    Fun = fun (N) ->
		  case arena_peak_champion_db:get_pk({RoleId, N}) of
		    {ok, #peak_champion_pk{step = Step, round = Round}}
			when RoundStatus =:= 3 ->
			false;
		    {ok, PKT = #peak_champion_pk{score = Score}} ->
			PK = to_cli_pk(PKT), {true, {N, Score, PK}};
		    _ -> false
		  end
	  end,
    L = lists:filtermap(Fun, Logs),
    sys_conn:pack_send(ConnPid, 27708, {L}),
    ok.

-spec push_role_result(atom(), #champion_state{},
		       tuple()) -> ok.

push_role_result(_StateName, _State,
		 {RoleId, ConnPid}) ->
    case ets:lookup(arena_peak_champion_result, RoleId) of
      [#champion_result{rank = Rank, cnum = Cnum,
			win = Win}] ->
	  sys_conn:pack_send(ConnPid, 27706, {Rank, Cnum, Win}),
	  d_ets_lib:clear_d_ets(arena_peak_champion_result,
				RoleId);
      _ -> pass
    end,
    ok.

-spec push_role_champion(atom(), #champion_state{},
			 tuple()) -> ok.

push_role_champion(_StateName, _State,
		   {champion_256, ZoneId, ConnPid}) ->
    Data = [{Group,
	     arena_peak_champion_db:get_ext({champion_256, Group},
					    [])}
	    || Group <- lists:seq(1, 16)],
    sys_conn:pack_send(ConnPid, 27709, {ZoneId, 1, Data}),
    ok;
push_role_champion(_StateName, _State,
		   {champion_64, ZoneId, ConnPid}) ->
    Data = [{Group,
	     arena_peak_champion_db:get_ext({champion_64, Group},
					    [])}
	    || Group <- lists:seq(1, 8)],
    sys_conn:pack_send(ConnPid, 27709, {ZoneId, 2, Data}),
    ok;
push_role_champion(_StateName, _State,
		   {champion_4, ZoneId, ConnPid}) ->
    Data = arena_peak_champion_db:get_ext(champion_4, []),
    sys_conn:pack_send(ConnPid, 27710, {ZoneId, Data}),
    ok.

-spec push_pos_pk(atom(), tuple(), tuple()) -> ok.

push_pos_pk(StateName,
	    State = #champion_state{step = Step, round = Round,
				    round_status = RoundStatus},
	    {ZoneId, Type, Group, Pos, ConnPid}) ->
    Id = case Type of
	   3 -> 10000 + Group * 1000 + Pos;
	   2 -> 100000 + Group * 1000 + Pos;
	   1 -> 1000000 + Group * 1000 + Pos
	 end,
    case arena_peak_champion_db:get_pk([Id,
					get({pos, Group, Pos})])
	of
      {ok,
       PKT = #peak_champion_pk{step = Step, round = Round}}
	  when RoundStatus =:= 3 ->
	  PK = to_cli_pk(PKT),
	  sys_conn:pack_send(ConnPid, 27712,
			     {ZoneId, Type, PK#peak_champion_pk{ret = 0}});
      {ok, PKT} ->
	  PK = to_cli_pk(PKT),
	  sys_conn:pack_send(ConnPid, 27712, {ZoneId, Type, PK});
      _ ->
	  sys_conn:pack_send(ConnPid, 27712,
			     {ZoneId, Type, #peak_champion_pk{}})
    end.

to_cli_pk(PKT = #peak_champion_pk{a_defense = ADefense,
				  b_defense = BDefense}) ->
    NewADefense = [to_cli_defense(AD) || AD <- ADefense],
    NewBDefense = [to_cli_defense(BD) || BD <- BDefense],
    PKT#peak_champion_pk{a_defense = NewADefense,
			 b_defense = NewBDefense}.

to_cli_defense(BDefense = #arena_peak_role_defense{plist
						       = PL}) ->
    NewPL = [to_cli_partner(P) || P <- PL],
    BDefense#arena_peak_role_defense{plist = NewPL}.

to_cli_partner(P = #arena_peak_role_partner{ext =
						Ext}) ->
    NewExt = maps:to_list(Ext),
    P#arena_peak_role_partner{ext = NewExt}.

-spec guess_bet(atom(), tuple(), tuple()) -> ok.

guess_bet(StateName, _State,
	  {RoleId, RolePid, ConnPid, BetType, BetVal})
    when StateName =:= score_guess orelse
	   StateName =:= champion_guess ->
    Bet = #champion_bet{bet = CanBet, logs = Logs} =
	      arena_peak_champion_db:get_bet(RoleId),
    GuessLimit =
	arena_peak_champion_data:get_constant(guess_limit),
    case lists:keymember(RoleId, 1, get(guess_list)) of
      _ when BetVal > CanBet ->
	  sys_conn:pack_send(ConnPid, 27704,
			     {0, lang:get(<<"Không đủ tiền đặt cược"/utf8>>), 0,
			      0, 0});
      _ when BetVal > GuessLimit ->
	  sys_conn:pack_send(ConnPid, 27704,
			     {0,
			      lang:get(<<"Đặt cược tiền tệ vượt quá giới hạn trên"/utf8>>),
			      0, 0, 0});
      false ->
	  Log = case BetType of
		  1 ->
		      NewVal = get(guess_a_bet) + BetVal,
		      put(guess_a_bet, NewVal),
		      d_ets_lib:save_d_ets(arena_peak_champion_ext,
					   {guess_a_bet, NewVal}),
		      NewGuessList = [{RoleId, 1, BetVal} | get(guess_list)],
		      put(guess_list, NewGuessList),
		      d_ets_lib:save_d_ets(arena_peak_champion_ext,
					   {guess_list, NewGuessList}),
		      ets:update_counter(arena_peak_champion_pk,
					 get(guess_roleid),
					 {#peak_champion_pk.a_bet, BetVal}),
		      #champion_bet_log{id = get(guess_id),
					rid = get(guess_roleid), target = 1,
					bet = BetVal};
		  _ ->
		      NewVal = get(guess_b_bet) + BetVal,
		      put(guess_b_bet, NewVal),
		      d_ets_lib:save_d_ets(arena_peak_champion_ext,
					   {guess_b_bet, NewVal}),
		      NewGuessList = [{RoleId, 2, BetVal} | get(guess_list)],
		      put(guess_list, NewGuessList),
		      d_ets_lib:save_d_ets(arena_peak_champion_ext,
					   {guess_list, NewGuessList}),
		      ets:update_counter(arena_peak_champion_pk,
					 get(guess_roleid),
					 {#peak_champion_pk.b_bet, BetVal}),
		      #champion_bet_log{id = get(guess_id),
					rid = get(guess_roleid), target = 2,
					bet = BetVal}
		end,
	  NewBet = Bet#champion_bet{bet = CanBet - BetVal,
				    logs = [Log | Logs]},
	  d_ets_lib:save_d_ets(arena_peak_champion_bet, NewBet),
	  sys_conn:pack_send(ConnPid, 27704,
			     {1, lang:get(<<"đặt cược thành công"/utf8>>),
			      CanBet - BetVal, BetType, BetVal}),
	  ABetRatio =
	      arena_peak_champion_mgr:calc_bet_ratio(get(guess_a_bet),
						     get(guess_b_bet)),
	  BBetRatio =
	      arena_peak_champion_mgr:calc_bet_ratio(get(guess_b_bet),
						     get(guess_a_bet)),
	  role:apply(async, RolePid,
		     {fun (R) ->
			      log:save(join,
				       {R, <<"功能玩法"/utf8>>,
					<<"巅峰冠军赛押注"/utf8>>}),
			      {ok, R}
		      end}),
	  arena_peak_champion_mgr:cluster_cast(arena_peak_champion_mgr,
					       info, [{do_notify_state_guess}]);
      _ ->
	  sys_conn:pack_send(ConnPid, 27704,
			     {0, lang:get(<<"Đã đặt cược"/utf8>>), 0, 0, 0})
    end;
guess_bet(_StateName, _State, Info) ->
    sys_conn:pack_send(element(3, Info), 27704,
		       {0,
			lang:get(<<"Bạn không thể đặt cược ở giai đoạn này"/utf8>>),
			0, 0, 0}),
    ok.

-spec check_open(#role{}) -> atom().

check_open(#role{lev = Lev}) ->
    Lev >=
      arena_peak_champion_data:get_constant(open_lev_limit)
      andalso
      world_lev:get_world_lev() >=
	arena_peak_champion_data:get_constant(open_world_lev_limit).

-spec get_formation_ids(#role{}) -> pos_integer().

get_formation_ids(Role = #role{m_arena_peak_champion =
				   #m_arena_peak_champion{defense =
							      Defense}}) ->
    case check_open(Role) of
      false -> [];
      _ ->
	  PosInfos = lists:flatten([PosInfo
				    || {_, _, PosInfo, _} <- Defense]),
	  [PId || #formation_pos{id = PId} <- PosInfos]
    end.

-spec set_formation_sys(#role{}, list()) -> {ok,
					     #role{}} |
					    {false, binary()}.

set_formation_sys(Role = #role{m_arena_peak_champion =
				   M},
		  Formations) ->
    case check_can_set(Role, Formations) of
      {false, Msg} -> {false, Msg};
      {ok, FormationsT} ->
	  NewRole = Role#role{m_arena_peak_champion =
				  M#m_arena_peak_champion{defense =
							      FormationsT}},
	  role_robot:sync_role(NewRole),
	  {ok, NewRole}
    end.

check_can_set(_, []) ->
    {false,
     lang:get(<<"Ít nhất một ninja cần được triển khai"/utf8>>)};
check_can_set(_Role, Formations)
    when length(Formations) > 3 ->
    {false, lang:get(<<"Sắp xếp tối đa 3 đội"/utf8>>)};
check_can_set(_Role, Formations)
    when length(Formations) < 2 ->
    {false, lang:get(<<"Sắp xếp ít nhất 2 đội"/utf8>>)};
check_can_set(Role, Formations) ->
    case check_formations(Role, Formations, []) of
      {false, Msg} -> {false, Msg};
      {ok, NFormations} -> {ok, NFormations}
    end.

check_formations(#role{}, [], L) ->
    NewL = [{Order, FormationType, NewPosInfo, HallowsId}
	    || {Order, FormationType, NewPosInfo, HallowsId} <- L,
	       NewPosInfo =/= []],
    Len = length(NewL),
    case Len < 2 of
      true ->
	  {false,
	   lang:get(<<"Nhập ít nhất hai đội ninja"/utf8>>)};
      _ -> {ok, NewL}
    end;
check_formations(Role = #role{partner_bag =
				  #partner_bag{partner_list = PL}},
		 [{Order, FormationType, PosInfo, HallowsId}
		  | Formations],
		 L) ->
    case lists:keymember(HallowsId, 4, L) of
      true when HallowsId =/= 0 ->
	  {false,
	   lang:get(<<"Các đội khác nhau không thể chia sẻ "
		      "cùng một hiện vật"/utf8>>)};
      _ ->
	  case lists:keymember(Order, 1, L) of
	    true ->
		{false,
		 lang:get(<<"Triển khai cùng một nhóm nhiều lần"/utf8>>)};
	    _ ->
		AllPos = lists:flatten([NPosInfo
					|| {_, _, NPosInfo, _} <- L]),
		AllIds = [IdT || #formation_pos{id = IdT} <- AllPos],
		PosIds = [IdT || {_, IdT} <- PosInfo],
		AllBids = get_partner_bid(AllIds, PL, []),
		PosBids = get_partner_bid(PosIds, PL, []),
		case check_pos_info(PosInfo, AllPos) of
		  {false, Msg} -> {false, Msg};
		  _ ->
		      case check_partner_bid_num(PosBids, AllBids) of
			{false, Msg} -> {false, Msg};
			_ ->
			    case formation:check_formation_pos_info(Role,
								    FormationType,
								    PosInfo,
								    HallowsId)
				of
			      {false, Reason} -> {false, Reason};
			      {ok, NewPosInfo} ->
				  check_formations(Role, Formations,
						   [{Order, FormationType,
						     NewPosInfo, HallowsId}
						    | L])
			    end
		      end
		end
	  end
    end.

check_pos_info([], _AllPos) -> ok;
check_pos_info([{_Pos, Id} | PosInfo], AllPos) ->
    case lists:keymember(Id, #formation_pos.id, AllPos) of
      true ->
	  {false,
	   lang:get(<<"Cùng một đối tác không thể chơi ở nhiều "
		      "đội"/utf8>>)};
      _ -> check_pos_info(PosInfo, AllPos)
    end.

check_partner_bid_num([], _AllBids) -> ok;
check_partner_bid_num([Bid | Other], AllBids) ->
    Len = length([1 || BidT <- AllBids, BidT == Bid]),
    case Len >= 2 of
      true ->
	  {false,
	   lang:get(<<"Tối đa hai đối tác cùng loại có thể "
		      "tham gia trận chiến"/utf8>>)};
      _ -> check_partner_bid_num(Other, AllBids)
    end.

get_partner_bid([], _PL, AllBid) -> AllBid;
get_partner_bid([Id | Other], PL, AllBid) ->
    case partner_lib:get_partner(PL, Id) of
      #partner{bid = Bid} ->
	  get_partner_bid(Other, PL, [Bid | AllBid]);
      _ -> get_partner_bid(Other, PL, AllBid)
    end.

get_formation_sys(Role = #role{m_arena_peak_champion =
				   M = #m_arena_peak_champion{defense = []}}) ->
    {_, _, Defense} = arena_cluster:get_formation_sys(Role,
						      2),
    NDefense = [{OrderId, FormationType, PosInfo, HallowsId}
		|| {OrderId, FormationType, PosInfo, HallowsId, _}
		       <- Defense],
    NewM = M#m_arena_peak_champion{defense = NDefense},
    NewRole = Role#role{m_arena_peak_champion = NewM},
    {ok, NewRole, NDefense};
get_formation_sys(Role = #role{m_arena_peak_champion =
				   M = #m_arena_peak_champion{defense =
								  Defense}}) ->
    PushFormations = [{OrderT, FormationTypeT,
		       [FP
			|| FP = #formation_pos{id = IdT} <- PosInfoT,
			   partner_lib:get_partner(Role, IdT) =/= false],
		       HallowsIdT}
		      || {OrderT, FormationTypeT, PosInfoT, HallowsIdT}
			     <- Defense],
    case PushFormations of
      [_ | _] -> {ok, Role, PushFormations};
      _ ->
	  get_formation_sys(Role#role{m_arena_peak_champion =
					  M#m_arena_peak_champion{defense =
								      []}})
    end.


