-file("src/mod/zs_war/zs_war.erl", 1).

-module(zs_war).

-lager_records([{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{assets,
		 [ver, exp, coin, silver_coin, gold, red_gold, gold_acc,
		  vip_exp, energy, energy_max, energy_time, activity,
		  guild, arena_cent, hero_soul, feat_point, triple_rebate,
		  friend_point, boss_point, star_hun, star_point,
		  arena_guesscent, sky_coin, hero_exp, recruit_hero,
		  recruithigh_hero, expedition_medal, elite_coin,
		  holy_eqm_coin, skin_debris, cluster_coin, home_coin,
		  hallow_refine, cluster_guess_cent, feather_exchange,
		  brave_symbol, peak_guess_cent, hero_soul_coin,
		  acc_recruit_hero, predict_point]},
		{combat_drama,
		 [id, next, timeout, ts, winner, play_list, combat_list,
		  guide_list]},
		{item_reward_p, [bid, is_bind, num]},
		{assets_reward_p, [type, val]},
		{exp_reward_p,
		 [object_type, object_id, srv_id, career, sex, old_lev,
		  old_exp, new_lev, new_exp, is_die, assets_reward]},
		{combat_order_p, [pos, distance, group]},
		{skill_p, [skill_bid, end_round]},
		{fight_object_p,
		 [pos, group, owner_id, owner_srv_id, object_type,
		  object_id, object_bid, is_awake, star, object_name, sex,
		  career, lev, hp, hp_max, face_id, round, skills,
		  is_strong_partner, extra_data, camp_type, sprites]},
		{buff_play,
		 [target, buff_bid, end_round, remain_round, action_type,
		  change_type, change_value, is_dead, id, id2]},
		{sub_effect_play,
		 [sub_target, sub_effect_id, sub_hp_changed,
		  sub_distance, sub_is_hit, sub_skill_id, extra_effect]},
		{effect_play,
		 [order, actor, target, effect_bid, is_hit, is_crit,
		  hp_changed, hp, buff_list, summon_list, distance,
		  is_dead, sub_effect_play_list, is_blind,
		  skill_bid_of_effect, actor_hp_changed, actor_is_dead,
		  aid_actor, total_hurt, hurt_reward, camp_restrain]},
		{skill_play,
		 [order, actor, target, skill_bid, talk_pos,
		  talk_content, effect_play]},
		{mon_ai,
		 [bid, name, ai, is_loop, condition, rate, skill_target,
		  skill_id, talk_target, talk_content]},
		{combat_result,
		 [result, dead_monster_num, wave_num, dead_partner,
		  replay_id, a_stat_info, b_stat_info, end_type,
		  opponent_id, total_hurt, action_count, group_a_num,
		  hurt_statistics_a, curt_statistics_a, hurt_statistics,
		  replay_info, combat_pid, a_halo_dizzy_num,
		  a_max_num_def, a_control_info, a_kill_info,
		  a_continue_hurt, a_revive_info, a_dodge_count,
		  a_anti_kill_count, a_halo_kill_count, a_fire_buff_num,
		  hurt_statistics_b, curt_statistics_b, b_halo_dizzy_num,
		  b_max_num_def, b_control_info, b_kill_info,
		  b_continue_hurt, b_revive_info, b_dodge_count,
		  b_anti_kill_count, b_halo_kill_count, b_fire_buff_num,
		  is_balance, a_sprite_kill_count]},
		{partner_hurt,
		 [master_id, id, bid, star, lev, camp_type, dps, cure,
		  ext_data, be_hurt]},
		{combat,
		 [type, attack_list, defend_list, combat_roles,
		  formation, on_combat_begin, on_combat_end,
		  on_role_combat_end, state_end_time, round_countdown,
		  min_play_time, take_action, ext_args, wave, total_wave,
		  multi_wave_defend, combat_result, is_pause, combat_map,
		  combat_drama, target_role_name, is_combat_end, end_time,
		  begin_time, watching_roles, is_skip, round, is_robot,
		  select_buff_callback, terminate_func, attack_power,
		  defend_power, replay_info, other_arge]},
		{combat_buff,
		 [id, bid, actor, group, end_round, buff_result_type,
		  positive_or_negative, buff_result, join_num, can_reduce,
		  lev, probability, clean_when_dead, hit_count, is_show,
		  wave, group_pro]},
		{fight_object,
		 [master_id, master_pid, object_type, object_id,
		  object_bid, is_clone, is_auto, is_leader, host_bid,
		  object_name, is_awake, star, sex, career, lev, face_id,
		  hp, hp_max, pos, round, wave_round, distance,
		  rand_speed, init_attr, base_attr, fight_attr,
		  active_skills, passive_skills, skill_order, buff_list,
		  owner_id, passive_effects_of_skill, is_boss,
		  is_strong_partner, quality, initial_hp_max, extra_data,
		  awaken_type, camp_type, power, replay, hallows_looks,
		  sprites, guild_break_power]},
		{combat_role,
		 [id, pid, conn_pid, name, gid, gname, is_auto, is_ready,
		  is_play_over, is_offline, group, auto_watch_model, lev,
		  face_id, watching, is_load_map_finish]},
		{combat_buff_data,
		 [bid, name, group, join_type, lev, join_num, duration,
		  buff_result_type, buff_result, desc,
		  positive_or_negative, can_reduce, probability,
		  clean_when_dead, clean_next_wave, is_show, group_pro,
		  dot_type]},
		{effect_data,
		 [bid, group, target_type, target_num, effect_type,
		  hurt_type, base_hit, hit_type, effect_param, condition,
		  condition_param, extra_param, passive_effect,
		  effect_desc]},
		{skill_data,
		 [bid, name, owner, group, next_id, min_play_time, level,
		  is_normal_skill, type, trigger_condition, trigger_param,
		  target, effect_list, add_attr, cd, count, best_target,
		  fit_combat_type, skill_changed, power, is_combat_hidden,
		  priority]},
		{m_skill, [skills_used, skills_owned]},
		{zs_war_guard_data,
		 [id, camp, bid, pos_x, pos_y, max_hp, diff_hp,
		  role_attr, camp_attr, time, cd]},
		{zs_war_skill_data,
		 [id, camp, name, cd, free, loss, effect]},
		{zs_war_guard,
		 [id, camp, bid, pos_x, pos_y, status, hp, max_hp]},
		{zs_war_zone, [group, zone, num, pid]},
		{zs_war_role,
		 [id, pid, name, zone_pid, zone_id, gid, gname, group,
		  camp, lev, sex, face, avatar_id, lookid, power,
		  max_power, arena_rank, pos_x, pos_y, score, num, win,
		  win_acc, win_best, lose, lose_acc, draw, status, effect,
		  move_num, move_cd_time, combat_cd_time, combat_role_id,
		  start_time, formation_type, pos_info, partner_hp, in_ui,
		  skill_list, skill_effect, is_robot, robot_id, items,
		  cnum_list, win_list]},
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

-export([sign/1, sync_ui_status/1, sync_formation/1,
	 set_formation/2, use_skill/2, apply_use_skill/2,
	 reward/3, apply_reward/2, combat/3, combat_over/2]).

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

-file("src/mod/zs_war/zs_war.erl", 20).

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

-file("src/mod/zs_war/zs_war.erl", 21).

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

-file("src/mod/zs_war/zs_war.erl", 22).

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

-file("src/mod/zs_war/zs_war.erl", 23).

-file("inc/zs_war.hrl", 1).

-record(zs_war_role,
	{id = {0, <<>>}  :: {non_neg_integer(), bitstring()},
	 pid = 0  :: 0 | pid(), name = <<>>  :: bitstring(),
	 zone_pid = 0  :: 0 | pid(),
	 zone_id = 0  :: non_neg_integer(),
	 gid = {0, <<>>}  :: {non_neg_integer(), bitstring()},
	 gname = <<>>  :: bitstring(),
	 group = 0  :: non_neg_integer(),
	 camp = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), sex = 0  :: 0..2,
	 face = 0  :: non_neg_integer(),
	 avatar_id = 0  :: non_neg_integer(),
	 lookid = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 max_power = 0  :: non_neg_integer(),
	 arena_rank = 0  :: non_neg_integer(),
	 pos_x = 0  :: non_neg_integer(),
	 pos_y = 0  :: non_neg_integer(),
	 score = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 win = 0  :: non_neg_integer(),
	 win_acc = 0  :: non_neg_integer(),
	 win_best = 0  :: non_neg_integer(),
	 lose = 0  :: non_neg_integer(),
	 lose_acc = 0  :: non_neg_integer(),
	 draw = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 effect = 0  :: non_neg_integer(),
	 move_num = 0  :: non_neg_integer(),
	 move_cd_time = 0  :: non_neg_integer(),
	 combat_cd_time = 0  :: non_neg_integer(),
	 combat_role_id = {0, <<>>}  :: tuple(),
	 start_time = 0  :: non_neg_integer(),
	 formation_type = 0  :: non_neg_integer(),
	 pos_info = []  :: list(), partner_hp = []  :: list(),
	 in_ui = 0  :: 0..1, skill_list = []  :: list(),
	 skill_effect = []  :: list(), is_robot = 0  :: 0..1,
	 robot_id = 0  :: non_neg_integer(),
	 items = []  :: list(), cnum_list = []  :: list(),
	 win_list = []  :: list()}).

-record(zs_war_zone,
	{group = 0  :: non_neg_integer(),
	 zone = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(), pid = 0  :: pid()}).

-record(zs_war_guard,
	{id = 0  :: non_neg_integer(),
	 camp = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 pos_x = 0  :: non_neg_integer(),
	 pos_y = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 max_hp = 0  :: non_neg_integer()}).

-record(zs_war_skill_data,
	{id = 0  :: non_neg_integer(), camp = 1  :: 1..2,
	 name = <<>>  :: bitstring(),
	 cd = 0  :: non_neg_integer(),
	 free = 0  :: non_neg_integer(), loss = []  :: list(),
	 effect = []  :: list()}).

-record(zs_war_guard_data,
	{id = 0  :: non_neg_integer(),
	 camp = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 pos_x = 0  :: non_neg_integer(),
	 pos_y = 0  :: non_neg_integer(),
	 max_hp = 0  :: non_neg_integer(),
	 diff_hp = 0  :: non_neg_integer(),
	 role_attr = []  :: list(), camp_attr = []  :: list(),
	 time = 0  :: non_neg_integer(),
	 cd = 0  :: non_neg_integer()}).

-file("src/mod/zs_war/zs_war.erl", 24).

-file("inc/combat.hrl", 1).

-file("inc/common.hrl", 1).

-file("inc/combat.hrl", 13).

-file("inc/attr.hrl", 1).

-file("inc/combat.hrl", 14).

-file("inc/skill.hrl", 1).

-record(m_skill,
	{skills_used = [], skills_owned = []  :: [integer()]}).

-record(skill_data,
	{bid, name, owner, group, next_id = 0,
	 min_play_time = 0, level, is_normal_skill = 0,
	 type  ::
	     passive_skill | active_skill | eqm_passive_skill,
	 trigger_condition = none, trigger_param = 0, target,
	 effect_list = [], add_attr = [], cd, count,
	 best_target = normal, fit_combat_type = all,
	 skill_changed = none, power = 0, is_combat_hidden = 0,
	 priority = 0}).

-record(effect_data,
	{bid, group, target_type, target_num, effect_type,
	 hurt_type, base_hit, hit_type = effect_hit,
	 effect_param, condition = none, condition_param = none,
	 extra_param = [], passive_effect = none,
	 effect_desc = <<>>}).

-record(combat_buff_data,
	{bid, name, group, join_type, lev, join_num, duration,
	 buff_result_type, buff_result = [], desc,
	 positive_or_negative, can_reduce, probability = 1000,
	 clean_when_dead = true, clean_next_wave = 0,
	 is_show = true, group_pro = 0, dot_type = 0}).

-file("inc/combat.hrl", 15).

-record(combat_role,
	{id = {0, <<>>}, pid = none, conn_pid = none,
	 name = <<>>, gid = {0, <<>>}, gname = <<>>,
	 is_auto = true, is_ready = false, is_play_over = false,
	 is_offline = false, group = 0, auto_watch_model = 0,
	 lev = 0, face_id = 0, watching = 1,
	 is_load_map_finish = false}).

-record(fight_object,
	{master_id = {0, <<>>}, master_pid = none,
	 object_type = 0, object_id = 0  :: integer(),
	 object_bid = 0, is_clone = 0, is_auto = 0,
	 is_leader = 0, host_bid = 0, object_name = <<>>,
	 is_awake = 0, star = 0, sex = 0, career = 0, lev = 0,
	 face_id = 0, hp = 1, hp_max = 1, pos = 0, round = 0,
	 wave_round = 0, distance = 0, rand_speed = 0, init_attr,
	 base_attr, fight_attr = #attr{},
	 active_skills = []  :: [#skill_data{}],
	 passive_skills = []  :: [#skill_data{}],
	 skill_order = []  :: [#skill_data{}], buff_list = [],
	 owner_id = {0, <<>>},
	 passive_effects_of_skill = []  :: [#effect_data{}],
	 is_boss = false, is_strong_partner = 0, quality = 0,
	 initial_hp_max = 0, extra_data = [], awaken_type = 0,
	 camp_type = 0, power = 0, replay, hallows_looks = [],
	 sprites = [], guild_break_power = 0}).

-record(combat_buff,
	{id, bid, actor, group, end_round, buff_result_type,
	 positive_or_negative, buff_result = [], join_num,
	 can_reduce, lev, probability = 1000,
	 clean_when_dead = true, hit_count = 0, is_show = true,
	 wave = 1, group_pro = 0}).

-record(combat,
	{type = 0, attack_list = []  :: [#fight_object{}],
	 defend_list = []  :: [#fight_object{}],
	 combat_roles = []  :: [#combat_role{}],
	 formation = []  ::
	     [{pos_integer(), pos_integer(), pos_integer()}],
	 on_combat_begin, on_combat_end, on_role_combat_end,
	 state_end_time = 0, round_countdown = 0,
	 min_play_time = 0, take_action = {}, ext_args = [],
	 wave = 1, total_wave = undefined,
	 multi_wave_defend = [], combat_result,
	 is_pause = false  :: false | {true, integer()},
	 combat_map = 0, combat_drama, target_role_name = <<>>,
	 is_combat_end = {combat_util, is_combat_end, []},
	 end_time = 0, begin_time = 0, watching_roles = [],
	 is_skip = 0, round = 0, is_robot = 0,
	 select_buff_callback, terminate_func, attack_power = 0,
	 defend_power = 0, replay_info, other_arge = []}).

-record(partner_hurt,
	{master_id, id, bid, star, lev, camp_type, dps, cure,
	 ext_data = [], be_hurt = 0}).

-record(combat_result,
	{result  :: 1 | 2, dead_monster_num = 0, wave_num = 0,
	 dead_partner = [], replay_id = 0, a_stat_info = [],
	 b_stat_info = [], end_type = normal  :: normal | quit,
	 opponent_id = {0, <<>>}, total_hurt = 0,
	 action_count = 0, group_a_num = 0,
	 hurt_statistics_a = [], curt_statistics_a = [],
	 hurt_statistics = [], replay_info = [], combat_pid = 0,
	 a_halo_dizzy_num = 0, a_max_num_def = 0,
	 a_control_info = [], a_kill_info = [],
	 a_continue_hurt = [], a_revive_info = [],
	 a_dodge_count = 0, a_anti_kill_count = 0,
	 a_halo_kill_count = 0, a_fire_buff_num = 0,
	 hurt_statistics_b = [], curt_statistics_b = [],
	 b_halo_dizzy_num = 0, b_max_num_def = 0,
	 b_control_info = [], b_kill_info = [],
	 b_continue_hurt = [], b_revive_info = [],
	 b_dodge_count = 0, b_anti_kill_count = 0,
	 b_halo_kill_count = 0, b_fire_buff_num = 0,
	 is_balance = 0, a_sprite_kill_count = 0}).

-record(mon_ai,
	{bid, name, ai, is_loop, condition = [], rate,
	 skill_target = false, skill_id, talk_target = none,
	 talk_content = <<>>}).

-record(skill_play,
	{order, actor, target, skill_bid = 0, talk_pos = 0,
	 talk_content = <<>>, effect_play = []}).

-record(effect_play,
	{order, actor, target = 0, effect_bid = 0, is_hit = 1,
	 is_crit = 0, hp_changed = 0, hp = 0, buff_list = [],
	 summon_list = [], distance = -1, is_dead = 0,
	 sub_effect_play_list = [], is_blind = 0,
	 skill_bid_of_effect = 0, actor_hp_changed = 0,
	 actor_is_dead = 0, aid_actor = 0, total_hurt = 0,
	 hurt_reward = [], camp_restrain = 0}).

-record(sub_effect_play,
	{sub_target = 0, sub_effect_id = 0, sub_hp_changed = 0,
	 sub_distance = -1, sub_is_hit = 1, sub_skill_id = 0,
	 extra_effect = []}).

-record(buff_play,
	{target = 0, buff_bid = 0, end_round = 0,
	 remain_round = 0, action_type = 0, change_type = 0,
	 change_value = 0, is_dead = 0, id = 0, id2 = 0}).

-record(fight_object_p,
	{pos = 0, group = 0, owner_id = 0, owner_srv_id = <<>>,
	 object_type = 0, object_id = 0, object_bid = 0,
	 is_awake = 0, star = 0, object_name = <<>>, sex = 0,
	 career = 0, lev = 0, hp = 0, hp_max = 0, face_id = 0,
	 round = 0, skills = [], is_strong_partner = 0,
	 extra_data = [], camp_type = 0, sprites = []}).

-record(skill_p, {skill_bid = 0, end_round = 0}).

-record(combat_order_p,
	{pos = 0, distance = 0, group = 0}).

-record(exp_reward_p,
	{object_type, object_id = 0, srv_id = <<>>, career = 0,
	 sex = 0, old_lev, old_exp, new_lev, new_exp, is_die = 0,
	 assets_reward}).

-record(assets_reward_p, {type, val}).

-record(item_reward_p, {bid, is_bind, num}).

-record(combat_drama,
	{id, next, timeout = infinity, ts, winner,
	 play_list = []  :: [pos_integer()],
	 combat_list = []  :: [tuple()],
	 guide_list = []  :: [pos_integer()]}).

-file("src/mod/zs_war/zs_war.erl", 25).

-file("inc/assets.hrl", 1).

-file("inc/game_assets.hrl", 1).

-file("inc/assets.hrl", 12).

-record(assets,
	{ver = -1, exp = 0, coin = 0, silver_coin = 0, gold = 0,
	 red_gold = 0, gold_acc = 0, vip_exp = 0, energy = 0,
	 energy_max = 0, energy_time = 0, activity = 0,
	 guild = 0, arena_cent = 0, hero_soul = 0,
	 feat_point = 0, triple_rebate = 0, friend_point = 0,
	 boss_point = 0, star_hun = 0, star_point = 0,
	 arena_guesscent = 0, sky_coin = 0, hero_exp = 0,
	 recruit_hero = 0, recruithigh_hero = 0,
	 expedition_medal = 0, elite_coin = 0, holy_eqm_coin = 0,
	 skin_debris = 0, cluster_coin = 0, home_coin = 0,
	 hallow_refine = 0, cluster_guess_cent = 0,
	 feather_exchange = 0, brave_symbol = 0,
	 peak_guess_cent = 0, hero_soul_coin = 0,
	 acc_recruit_hero = 0, predict_point = 0}).

-file("src/mod/zs_war/zs_war.erl", 26).

-file("inc/game_assets.hrl", 1).

-file("src/mod/zs_war/zs_war.erl", 27).

-file("inc/log.hrl", 1).

-file("src/mod/zs_war/zs_war.erl", 28).

-file("inc/gain.hrl", 1).

-record(gain,
	{label  :: atom(), val  :: term(),
	 msg = <<>>  :: bitstring(), flag  :: atom(),
	 reason  :: atom(), ext = 0  :: term(),
	 notice = 0  :: 0..1,
	 move_to = 0  :: non_neg_integer()}).

-record(loss,
	{label  :: atom(), val  :: term(),
	 own_val = 0  :: term(), msg = <<>>  :: bitstring(),
	 flag  :: atom(), reason  :: atom(),
	 ext = 0  :: term()}).

-record(gain_loss_opts,
	{title = <<>>, return_gl = [], is_continue = false,
	 order = loss  :: gain | loss,
	 gain_tag = <<>>  :: binary(),
	 loss_tag = <<>>  :: binary(),
	 split_str = <<"，"/utf8>>  :: binary(),
	 split_op_str = <<"，"/utf8>>  :: binary(),
	 type = 2  :: non_neg_integer(),
	 is_auto_buy = 0  :: 0..1,
	 need_notify_fail_item = false  :: true | false,
	 log_name = <<"市场"/utf8>>  :: true | false}).

-file("src/mod/zs_war/zs_war.erl", 29).

-spec sign(#role{}) -> {ok, #role{}} |
		       {false, binary()}.

sign(Role = #role{lev = Lev}) ->
    MinLev = zs_war_data:get_const(limit_lev),
    case Lev < MinLev of
      true ->
	  {false,
	   util:fbin(lang:get(<<"等级不足, ~w级开启"/utf8>>), [MinLev])};
      _ ->
	  {ok, ZsWarRole} = role_convert:do(zs_war_role, Role),
	  SysFormation = #formation_sys{type = FormationType,
					pos_info = PosInfo} =
			     formation:get_sys_formation(Role, 0),
	  NewZsWarRole = ZsWarRole#zs_war_role{pos_info = PosInfo,
					       formation_type = FormationType},
	  zs_war_mgr:info({sign, NewZsWarRole}),
	  {ok, NRole} = formation:save_sys_formation(Role,
						     SysFormation#formation_sys{id
										    =
										    8}),
	  log:save(join,
		   {NRole, <<"功能玩法"/utf8>>, <<"众神战"/utf8>>}),
	  {ok, NRole}
    end.

-spec sync_ui_status(#role{}) -> #role{}.

sync_ui_status(_Role = #role{id = RoleId, pid = RolePid,
			     ui_combat_type = UICombatType}) ->
    UI = util:if_true(UICombatType =:= 15, 1, 0),
    zs_war_zone:info(RoleId,
		     {sync_ui_status, RoleId, RolePid, UI}),
    ok.

-spec sync_formation(#role{}) -> ok.

sync_formation(Role = #role{id = RoleId}) ->
    #formation_sys{type = FormationType,
		   pos_info = PosInfo} =
	formation:get_sys_formation(Role, 8),
    zs_war_zone:info(RoleId,
		     {sync_formation, RoleId, FormationType, PosInfo}),
    ok.

-spec set_formation(#role{},
		    #formation_sys{}) -> {false, binary()} | {ok, #role{}}.

set_formation(Role = #role{id = RoleId},
	      FormationSys = #formation_sys{type = FormationType,
					    pos_info = PosInfo}) ->
    {ok, NRole} = formation:save_sys_formation(Role,
					       FormationSys),
    zs_war_zone:info(RoleId,
		     {sync_formation, RoleId, FormationType, PosInfo}),
    {ok, NRole}.

-spec use_skill(#role{}, non_neg_integer()) -> ok |
					       {false, bitstring()}.

use_skill(#role{id = RoleId,
		assets =
		    #assets{gold = Gold, red_gold = RedGold, coin = Coin}},
	  Id) ->
    case zs_war_data:get_skill(Id) of
      #zs_war_skill_data{} ->
	  case zs_war_zone:info(RoleId,
				{use_skill, RoleId, Id,
				 #{gold => Gold, red_gold => RedGold,
				   coin => Coin}})
	      of
	    not_pid -> {false, lang:get(<<"当前不在众神战场中"/utf8>>)};
	    _ -> ok
	  end;
      _ -> {false, lang:get(<<"不存在技能数据"/utf8>>)}
    end;
use_skill(_Role, _Id) ->
    {false, lang:get(<<"不在众神战状态中"/utf8>>)}.

-spec apply_use_skill(#role{},
		      Id :: non_neg_integer()) -> ok | {false, bitstring()}.

apply_use_skill(Role, Id) ->
    #zs_war_skill_data{loss = Loss} =
	zs_war_data:get_skill(Id),
    GL = format:val_to_loss(Loss, zs_war_use_skill),
    case role_gain:do(Role, GL) of
      {false, _} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidzs_war92, _, {__Levelzs_war92, __Traceszs_war92}}
		when __Levelzs_war92 band 8 /= 0 orelse
		       __Traceszs_war92 /= [] ->
		lager:do_log(error,
			     [{module, zs_war}, {function, apply_use_skill},
			      {line, 92}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("玩家[~ts]使用技能:~w消耗失败",
					   [Role#role.name, Id]),
			     none, 4096, 8, __Levelzs_war92, __Traceszs_war92,
			     lager_event, __Pidzs_war92);
	    _ -> ok
	  end,
	  ok;
      {ok, NRole} ->
	  log:log_gain(GL, Role, NRole, <<"众神战使用技能"/utf8>>,
		       util:fbin("使用技能:~w", [Id])),
	  {ok, NRole}
    end.

-spec reward(#role{}, Type :: pos_integer(),
	     Num :: pos_integer()) -> ok | {false, binary()}.

reward(#role{id = RoleId, pid = RolePid}, Type, Num) ->
    case zs_war_zone:info(RoleId,
			  {reward, RoleId, RolePid, Type, Num})
	of
      not_pid -> {false, lang:get(<<"当前不在众神战场中"/utf8>>)};
      _ -> ok
    end.

-spec apply_reward(#role{}, #{}) -> ok | {ok, #role{}}.

apply_reward(Role = #role{ui_combat_type =
			      UICombatType},
	     #{type := Type, add_score := AddScore,
	       items := L = [_ | _]}) ->
    GL = format:val_to_gain(L, zs_war_reward),
    case role_gain:do(Role, GL) of
      {false, _} -> ok;
      {ok, NRole} ->
	  case UICombatType of
	    15 ->
		Msg0 = format:gain_text(GL, #gain_loss_opts{type = 1},
					Role),
		Msg = case {Type, AddScore} of
			{_, 0} ->
			    util:fbin(lang:get(<<"~ts（超过~w场战斗只获银币奖励）"/utf8>>),
				      [Msg0,
				       zs_war_data:get_const(reward_times)]);
			{_, _} ->
			    util:fbin(lang:get(<<"~ts，荣誉积分+~w"/utf8>>),
				      [Msg0, AddScore])
		      end,
		notice:alert(Role, Msg);
	    _ -> pass
	  end,
	  log:log_gain(GL, Role, NRole, <<"众神战奖励"/utf8>>,
		       util:fbin("奖励", [])),
	  {ok, NRole}
    end;
apply_reward(Role,
	     Data = #{group := Group, type := Type, num := Num}) ->
    BaseItems = maps:get(items, Data, []),
    DropIds = maps:get(drop_ids, Data, []),
    {DropItems, _NoticeItems, _NoticeMsg} =
	drop_lib:common_drop_items(Role, DropIds),
    AllItems = item_lib:merge(DropItems, BaseItems),
    GL = format:val_to_gain(AllItems, zs_war),
    case role_gain:do_notice(Role, GL,
			     #gain_loss_opts{type = 1})
	of
      {ok, NRole} ->
	  log:log_gain(GL, Role, NRole, <<"众神战挑战次数"/utf8>>,
		       util:fbin("次数奖励领取group=~w,type=~w,num=~w",
				 [Group, Type, Num])),
	  sys_conn:pack_send(21427, {1, <<>>, Type, Num}),
	  {ok, NRole};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidzs_war142, _,
	     {__Levelzs_war142, __Traceszs_war142}}
		when __Levelzs_war142 band 8 /= 0 orelse
		       __Traceszs_war142 /= [] ->
		lager:do_log(error,
			     [{module, zs_war}, {function, apply_reward},
			      {line, 142}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色Id:~w, 名字:~w, 损益操作失败",
					   [Role#role.id, Role#role.name]),
			     none, 4096, 8, __Levelzs_war142, __Traceszs_war142,
			     lager_event, __Pidzs_war142);
	    _ -> ok
	  end,
	  ok
    end;
apply_reward(_Role, _) -> ok.

-spec combat(#zs_war_role{}, #zs_war_role{}, #{}) -> ok.

combat(R1 = #zs_war_role{is_robot = 1}, R2, Ext) ->
    combat(R2, R1, Ext);
combat(R1 = #zs_war_role{id = RoleId1, name = Name1,
			 zone_pid = ZonePid, partner_hp = PartnerHp1},
       R2 = #zs_war_role{id = RoleId2, name = Name2,
			 partner_hp = PartnerHp2, camp = Camp2},
       Ext) ->
    {AFormationType, AFormationLev, AtkList, ACRoles} =
	gen_fight_objects(R1, 1, Ext),
    {BFormationType, BFormationLev, DefList, BCRoles} =
	gen_fight_objects(R2, 2, Ext),
    CombatRoles = ACRoles ++ BCRoles,
    TargetName = util:fbin("[~ts]~ts",
			   [zs_war_zone:camp_name(Camp2), Name2]),
    Args = #{terminate_func =>
		 {zs_war, combat_over, [{ZonePid, RoleId1, RoleId2}]},
	     on_role_combat_end =>
		 {zs_war, combat_over, [{ZonePid, RoleId1, RoleId2}]},
	     target_role_name => TargetName,
	     formation =>
		 [{1, AFormationType, AFormationLev},
		  {2, BFormationType, BFormationLev}],
	     ext_args => []},
    case combat_lib:start_pk(15, AtkList, DefList,
			     CombatRoles, Args)
	of
      {ok, _ComPid} -> ok;
      _Err ->
	  zs_war_zone:info(ZonePid, {combat_cancel, RoleId1}),
	  zs_war_zone:info(ZonePid, {combat_cancel, RoleId2}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidzs_war164, _,
	     {__Levelzs_war164, __Traceszs_war164}}
		when __Levelzs_war164 band 8 /= 0 orelse
		       __Traceszs_war164 /= [] ->
		lager:do_log(error,
			     [{module, zs_war}, {function, combat}, {line, 164},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w:~ts pk ~w:~ts=start_combat_err===>~w "
					   "hp1=~w hp2=~w",
					   [RoleId1, Name1, RoleId2, Name2,
					    _Err, PartnerHp1, PartnerHp2]),
			     none, 4096, 8, __Levelzs_war164, __Traceszs_war164,
			     lager_event, __Pidzs_war164);
	    _ -> ok
	  end
    end.

get_buff_attr(#zs_war_role{id = RoleId, group = Group,
			   camp = Camp, win = Win, lose = Lose},
	      Ext) ->
    #zs_war_guard_data{role_attr = Attr1,
		       camp_attr = Attr2} =
	zs_war_data:get_guard({Group, Camp}),
    Now = date:unixtime(),
    CampAttr = case maps:get(Camp, Ext, undefined) of
		 #{role_id := RoleId, buff_end_time := EndTime}
		     when Now > EndTime ->
		     Attr1;
		 #{role_id := RoleId2, buff_end_time := EndTime}
		     when RoleId2 =/= null andalso EndTime > Now ->
		     Attr2;
		 _ -> []
	       end,
    CampAttr ++
      zs_war_data:buff_attr({Group, 1, Win}) ++
	zs_war_data:buff_attr({Group, 2, Lose}).

gen_fight_objects(R = #zs_war_role{id = RoleId,
				   robot_id = RobotId, lev = Lev, power = Power,
				   partner_hp = HpList,
				   formation_type = FormationType},
		  _CGroup, Ext)
    when RobotId > 0 ->
    BuffAttr = get_buff_attr(R, Ext),
    Role0 = role_data:first_init(#role{id =
					   {1, sys_env:get(server_id)},
				       type = robot}),
    Role = Role0#role{lev = Lev},
    FL0 = robot:gen_fight_objects(Role, RobotId,
				  #{power => Power div 5}, RoleId),
    FL1 = [combat_lib:add_base_attr(FO, BuffAttr)
	   || FO <- FL0],
    FL = combat_lib:init_fight_object_hp(FL1, HpList),
    FormationLev = 1,
    {FormationType, FormationLev, FL, []};
gen_fight_objects(R = #zs_war_role{id = RoleId,
				   pid = Pid, name = Name, lev = Lev,
				   pos_info = PosInfo, face = FaceId, gid = Gid,
				   gname = Gname,
				   formation_type = FormationType, camp = Camp},
		  CGroup, Ext) ->
    case role_robot:get_role(RoleId) of
      {ok, Robot} ->
	  TargetName = util:fbin("[~ts]~ts",
				 [zs_war_zone:camp_name(Camp), Name]),
	  CR = case util:is_process_alive(Pid) of
		 true ->
		     #combat_role{id = RoleId, pid = Pid, conn_pid = 0,
				  group = CGroup, is_auto = true,
				  name = TargetName, lev = Lev,
				  is_offline = true, face_id = FaceId,
				  gid = Gid, gname = Gname,
				  auto_watch_model = 1, watching = 0};
		 _ ->
		     #combat_role{id = RoleId, pid = robot, conn_pid = 0,
				  group = CGroup, is_auto = true,
				  name = TargetName, lev = Lev,
				  is_offline = true, face_id = FaceId,
				  gid = Gid, gname = Gname,
				  auto_watch_model = 1, watching = 0}
	       end,
	  FormationLev = formation_lib:get_formation_lev(Robot,
							 FormationType),
	  {FormationType, FormationLev,
	   gen_fight_objects_(PosInfo, R, Robot, Ext, []), [CR]};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidzs_war200, _,
	     {__Levelzs_war200, __Traceszs_war200}}
		when __Levelzs_war200 band 8 /= 0 orelse
		       __Traceszs_war200 /= [] ->
		lager:do_log(error,
			     [{module, zs_war}, {function, gen_fight_objects},
			      {line, 200}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("获取角色[~w][~ts]机器人数据失败",
					   [RoleId, Name]),
			     none, 4096, 8, __Levelzs_war200, __Traceszs_war200,
			     lager_event, __Pidzs_war200);
	    _ -> ok
	  end,
	  {1, 1, [], []}
    end.

gen_fight_objects_([], ZsRole,
		   Robot = #role_robot{name = Name,
				       partners = [#partner{id = Id} | _]},
		   Ext, []) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidzs_war204, _,
       {__Levelzs_war204, __Traceszs_war204}}
	  when __Levelzs_war204 band 8 /= 0 orelse
		 __Traceszs_war204 /= [] ->
	  lager:do_log(error,
		       [{module, zs_war}, {function, gen_fight_objects_},
			{line, 204}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]阵上伙伴已分解，随便取一个使用", [Name]), none,
		       4096, 8, __Levelzs_war204, __Traceszs_war204,
		       lager_event, __Pidzs_war204);
      _ -> ok
    end,
    gen_fight_objects_([#formation_pos{id = Id, pos = 1}],
		       ZsRole, Robot, Ext, []);
gen_fight_objects_([],
		   #zs_war_role{partner_hp = HpList}, _Robot, _Ext, L) ->
    combat_lib:init_fight_object_hp(L, HpList);
gen_fight_objects_([#formation_pos{id = PId, pos = Pos}
		    | T],
		   R = #zs_war_role{id = RoleId,
				    formation_type = FormationType},
		   Robot = #role_robot{partners = Partners}, Ext, L) ->
    case lists:keyfind(PId, #partner.id, Partners) of
      false -> gen_fight_objects_(T, R, Robot, Ext, L);
      P ->
	  #formation_data{pos = FightPos} =
	      formation_data:get_formation(FormationType),
	  Pos1 = list_util:keyfind(Pos, FightPos),
	  FO1 = partner_lib:gen_fight_object(RoleId, 0, P,
					     combat_lib:is_leader(Pos), RoleId,
					     1),
	  BuffAttr = get_buff_attr(R, Ext),
	  FO2 = combat_lib:add_base_attr(FO1#fight_object{pos =
							      Pos1},
					 BuffAttr),
	  gen_fight_objects_(T, R, Robot, Ext, [FO2 | L])
    end.

-spec combat_over(#combat{} | #combat_result{},
		  tuple()) -> ok.

combat_over(#combat{combat_roles = Roles},
	    {ZonePid, RoleId1, RoleId2}) ->
    [role:apply(async, RolePid,
		{fun (R) ->
			 combat_end:send_combat_end_with_no_window(R, 15), ok
		 end})
     || #combat_role{watching = 1, pid = RolePid} <- Roles,
	is_pid(RolePid)],
    case get(zs_war_combat_over) of
      undefined ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidzs_war230, _,
	     {__Levelzs_war230, __Traceszs_war230}}
		when __Levelzs_war230 band 8 /= 0 orelse
		       __Traceszs_war230 /= [] ->
		lager:do_log(error,
			     [{module, zs_war}, {function, combat_over},
			      {line, 230}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "战斗异常结束", none, 4096, 8, __Levelzs_war230,
			     __Traceszs_war230, lager_event, __Pidzs_war230);
	    _ -> ok
	  end,
	  zs_war_zone:info(ZonePid, {combat_cancel, RoleId1}),
	  zs_war_zone:info(ZonePid, {combat_cancel, RoleId2});
      _ -> pass
    end;
combat_over(CombatResult = #combat_result{},
	    {ZonePid, RoleId1, RoleId2}) ->
    put(zs_war_combat_over, true),
    zs_war_zone:info(ZonePid,
		     {combat_over, RoleId1, RoleId2, CombatResult}).


