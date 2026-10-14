-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_lib.erl",
      1).

-module(arena_peak_champion_lib).

-lager_records([{guild_skill_break_group,
		 [ver, career, attr_formation, skill_formation, ext]},
		{guild_skill_group,
		 [ver, career, group_id, skill_ids, group_ids]},
		{m_guild_skill, [ver, groups, break_groups]},
		{peak_champion_pk,
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
		{replay_partner,
		 [id, pos, bid, lev, star, break_lev, power, hp, hp_max,
		  atk, def, speed, crit_rate, crit_ratio, hit_magic,
		  dodge_magic, hurt, behurt, curt, skills, eqms,
		  artifacts, ext]},
		{replay_stat, [id, like, share, play, collect]},
		{replay_info,
		 [id, combat_type, round, sec_type, a_rid, a_name, a_lev,
		  a_face, a_power, a_formation_type, a_camp_type,
		  a_hallow, a_rank, b_rid, b_name, b_lev, b_face, b_power,
		  b_formation_type, b_camp_type, b_hallow, b_rank,
		  a_plist, b_plist, ret, time, like, share, play, collect,
		  ext]},
		{replay,
		 [id, type, combat_type, sec_type, a_rid, a_cond_val,
		  a_power, a_lev, b_rid, b_cond_val, b_power, b_lev,
		  time]},
		{replay_role, [key, list]},
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

-export([init/0, login/1, do_extract_join_role/1,
	 update_role_defense/1, score_match/2, champion_match/3,
	 champion_match2/3, champion_match3/3,
	 gen_next_champion_pk/1, step_round_combat_pos/2,
	 get_defense/1, do_combat/4, combat_over/11]).

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
      "on_lib.erl",
      26).

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
      "on_lib.erl",
      27).

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
      "on_lib.erl",
      28).

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

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_lib.erl",
      29).

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
      "on_lib.erl",
      30).

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
      "on_lib.erl",
      31).

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

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_lib.erl",
      32).

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
      "on_lib.erl",
      33).

-file("inc/replay_hall.hrl", 1).

-record(replay_role, {key = {{0, <<>>}, 0}, list = []}).

-record(replay,
	{id = 0, type = 0, combat_type = 0, sec_type = 0,
	 a_rid = 0, a_cond_val = 0, a_power = 0, a_lev = 0,
	 b_rid = 0, b_cond_val = 0, b_power = 0, b_lev = 0,
	 time = 0}).

-record(replay_info,
	{id = 0, combat_type = 0, round = 0, sec_type = 0,
	 a_rid = {0, <<>>}, a_name = <<>>, a_lev = 0, a_face = 0,
	 a_power = 0, a_formation_type = 0, a_camp_type = 0,
	 a_hallow, a_rank = 0, b_rid = {0, <<>>}, b_name = <<>>,
	 b_lev = 0, b_face = 0, b_power = 0,
	 b_formation_type = 0, b_camp_type = 0, b_hallow,
	 b_rank = 0, a_plist = [], b_plist = [], ret = 0,
	 time = 0, like = 0, share = 0, play = 0, collect = 0,
	 ext = []}).

-record(replay_stat,
	{id = 0, like = 0, share = 0, play = 0, collect = 0}).

-record(replay_partner,
	{id = 0, pos = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, hp = 0, hp_max = 0, atk = 0,
	 def = 0, speed = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, hurt = 0, behurt = 0,
	 curt = 0, skills = [], eqms = [], artifacts = [],
	 ext = []}).

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_lib.erl",
      34).

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
      "on_lib.erl",
      35).

-file("inc/guild_skill.hrl", 1).

-record(m_guild_skill,
	{ver = 2  :: pos_integer(), groups = []  :: list(),
	 break_groups = []  :: list()}).

-record(guild_skill_group,
	{ver = 1, career = 0, group_id = 0, skill_ids = [],
	 group_ids = []}).

-record(guild_skill_break_group,
	{ver = 1  :: pos_integer(),
	 career = 0  :: pos_integer(),
	 attr_formation = []  :: list(),
	 skill_formation = {0, 0}  :: tuple(),
	 ext = []  :: list()}).

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_lib.erl",
      36).

init() -> #m_arena_peak_champion{}.

login(Role = #role{m_arena_peak_champion =
		       M = #m_arena_peak_champion{zone_id = PointTime,
						  old_periods = PointInfo}}) ->
    Now = date:unixtime(),
    case Now >= PointTime of
      true ->
	  NewM = M#m_arena_peak_champion{zone_id =
					     Now + date:next_diff({5, 59, 59}),
					 old_periods = [{1, 0}, {2, 0}]},
	  {ok, Role#role{m_arena_peak_champion = NewM}};
      _ -> {ok, Role}
    end.

update_period(Role = #role{m_arena_peak_champion =
			       M = #m_arena_peak_champion{period =
							      OldPeriod}}) ->
    L = sys_env:get(arena_peak_champion_period, []),
    {Period, _MaxZoneId} = case lists:reverse(lists:sort(1,
							 L))
			       of
			     [{PeriodT, MaxZoneIdT} | _] ->
				 {PeriodT, MaxZoneIdT};
			     _ -> {0, 0}
			   end,
    case OldPeriod == Period of
      true -> {ok, Role};
      _ -> []
    end.

do_combat(R = #peak_champion_pk{}, MainId, IsGuess,
	  ApplyArge) ->
    do_combat(1, 1, 1, R, MainId, IsGuess, ApplyArge).

do_combat(Round, APos, BPos,
	  #peak_champion_pk{id = Id, step = Step, round = PRound},
	  MainId, _IsGuess, ApplyArge)
    when APos > 3 orelse BPos > 3 orelse Round > 3 ->
    {WinCount, LoseCount} = util:get({Step, PRound, Id,
				      arena_peak_win_count},
				     {0, 0}),
    {ReplayLists, AstatInfo, BStaeInfo} = util:get({Step,
						    PRound, Id,
						    arena_peak_replay_info},
						   {[], [], []}),
    erase({Step, PRound, Id, arena_peak_win_count}),
    erase({Step, PRound, Id, arena_peak_replay_info}),
    Result = util:if_true(WinCount > LoseCount, 1, 2),
    if WinCount == 0, LoseCount == 0 ->
	   case ApplyArge of
	     {score, _, _} ->
		 cluster_lib:cast(MainId, arena_peak_champion_mgr, apply,
				  [{arena_peak_champion_mgr,
				    async_fun_combat_over,
				    [1, [], [], [], ApplyArge]}]);
	     _ -> ok
	   end;
       true ->
	   cluster_lib:cast(MainId, arena_peak_champion_mgr, apply,
			    [{arena_peak_champion_mgr, async_fun_combat_over,
			      [Result, ReplayLists, AstatInfo, BStaeInfo,
			       ApplyArge]}])
    end;
do_combat(Round, APos, BPos,
	  R = #peak_champion_pk{id = Id, a_power = Power1,
				b_power = Power2, a_name = Name, step = Step,
				b_name = TarName, round = PRound},
	  MainId, IsGuess, ApplyArge) ->
    {AFormationType, AtkList} = gen_fight_objects(R, a,
						  Round),
    {BFormationType, DefList} = gen_fight_objects(R, b,
						  Round),
    {WinCount, LoseCount} = util:get({Step, PRound, Id,
				      arena_peak_win_count},
				     {0, 0}),
    if AtkList == [], DefList == [], Power1 >= Power2 ->
	   {ReplayLists, AStatInfos, BStatInfos} = util:get({Step,
							     PRound, Id,
							     arena_peak_replay_info},
							    {[], [], []}),
	   RoundResultInfo = #arena_peak_result_info{order = Round,
						     time = date:unixtime(),
						     ret = 1, round = 0,
						     a_end_hp = 0, b_end_hp = 0,
						     replay_info = {0, <<>>}},
	   NReplayLists = [RoundResultInfo | ReplayLists],
	   put({Step, PRound, Id, arena_peak_replay_info},
	       {NReplayLists, AStatInfos, BStatInfos}),
	   put({Step, PRound, Id, arena_peak_win_count},
	       {WinCount + 1, LoseCount}),
	   do_combat(Round + 1, APos + 1, BPos + 1, R, MainId,
		     IsGuess, ApplyArge);
       AtkList == [], DefList == [] ->
	   {ReplayLists, AStatInfos, BStatInfos} = util:get({Step,
							     PRound, Id,
							     arena_peak_replay_info},
							    {[], [], []}),
	   RoundResultInfo = #arena_peak_result_info{order = Round,
						     time = date:unixtime(),
						     ret = 2, round = 0,
						     a_end_hp = 0,
						     b_end_hp = 100,
						     replay_info = {0, <<>>}},
	   NReplayLists = [RoundResultInfo | ReplayLists],
	   put({Step, PRound, Id, arena_peak_replay_info},
	       {NReplayLists, AStatInfos, BStatInfos}),
	   put({Step, PRound, Id, arena_peak_win_count},
	       {WinCount, LoseCount + 1}),
	   do_combat(Round + 1, APos + 1, BPos + 1, R, MainId,
		     IsGuess, ApplyArge);
       AtkList == [] ->
	   {ReplayLists, AStatInfos, BStatInfos} = util:get({Step,
							     PRound, Id,
							     arena_peak_replay_info},
							    {[], [], []}),
	   RoundResultInfo = #arena_peak_result_info{order = Round,
						     time = date:unixtime(),
						     ret = 2, round = 0,
						     a_end_hp = 0,
						     b_end_hp = 100,
						     replay_info = {0, <<>>}},
	   NReplayLists = [RoundResultInfo | ReplayLists],
	   put({Step, PRound, Id, arena_peak_replay_info},
	       {NReplayLists, AStatInfos, BStatInfos}),
	   put({Step, PRound, Id, arena_peak_win_count},
	       {WinCount, LoseCount + 1}),
	   do_combat(Round + 1, APos + 1, BPos + 1, R, MainId,
		     IsGuess, ApplyArge);
       DefList == [] ->
	   {ReplayLists, AStatInfos, BStatInfos} = util:get({Step,
							     PRound, Id,
							     arena_peak_replay_info},
							    {[], [], []}),
	   RoundResultInfo = #arena_peak_result_info{order = Round,
						     time = date:unixtime(),
						     ret = 1, round = 0,
						     a_end_hp = 0, b_end_hp = 0,
						     replay_info = {0, <<>>}},
	   NReplayLists = [RoundResultInfo | ReplayLists],
	   put({Step, PRound, Id, arena_peak_replay_info},
	       {NReplayLists, AStatInfos, BStatInfos}),
	   put({Step, PRound, Id, arena_peak_win_count},
	       {WinCount + 1, LoseCount}),
	   do_combat(Round + 1, APos + 1, BPos + 1, R, MainId,
		     IsGuess, ApplyArge);
       true ->
	   ReplayInfo0 = replay_hall:convert(#replay_info{ext =
							      [{is_guess,
								IsGuess}]},
					     a, R,
					     #{formation_type =>
						   AFormationType}),
	   ReplayInfo1 = replay_hall:convert(ReplayInfo0, b, R,
					     #{formation_type =>
						   BFormationType}),
	   ReplayInfo = ReplayInfo1#replay_info{sec_type =
						    100 + Round},
	   Args = #{on_role_combat_end =>
			{arena_peak_champion_lib, combat_over,
			 [Round, APos, BPos, R, MainId, IsGuess, ApplyArge]},
		    is_robot => 1, target_role_name => TarName,
		    formation =>
			[{1, AFormationType, 0}, {2, BFormationType, 0}],
		    ext_args => [{save_replay, true}],
		    replay_info => ReplayInfo, attack_power => Power1,
		    defend_power => Power2},
	   CombatRoles = [#combat_role{id =
					   {0, sys_env:get(server_id)},
				       name = Name, pid = self()}],
	   case combat_lib:start_pk(37, AtkList, DefList,
				    CombatRoles, Args)
	       of
	     {ok, _CombatPid} -> ok;
	     {false, Err} ->
		 case {whereis(lager_event), whereis(lager_event),
		       lager_config:get({lager_event, loglevel}, {0, []})}
		     of
		   {undefined, undefined, _} ->
		       fun () -> {error, lager_not_running} end();
		   {undefined, _, _} ->
		       fun () -> {error, {sink_not_configured, lager_event}}
		       end();
		   {__Pidarena_peak_champion_lib159, _,
		    {__Levelarena_peak_champion_lib159,
		     __Tracesarena_peak_champion_lib159}}
		       when __Levelarena_peak_champion_lib159 band 8 /= 0
			      orelse __Tracesarena_peak_champion_lib159 /= [] ->
		       lager:do_log(error,
				    [{module, arena_peak_champion_lib},
				     {function, do_combat}, {line, 159},
				     {pid, pid_to_list(self())}, {node, node()}
				     | lager:md()],
				    io_lib:format("巅峰冠军进战斗失败:~w",
						  [{R, Round, APos, BPos,
						    Err}]),
				    none, 4096, 8,
				    __Levelarena_peak_champion_lib159,
				    __Tracesarena_peak_champion_lib159,
				    lager_event,
				    __Pidarena_peak_champion_lib159);
		   _ -> ok
		 end,
		 {ReplayLists, _AStatInfos, _BStatInfos} =
		     util:get({Step, PRound, Id, arena_peak_replay_info},
			      {[], [], []}),
		 case ApplyArge of
		   {score, _, _} ->
		       cluster_lib:cast(MainId, arena_peak_champion_mgr, apply,
					[{arena_peak_champion_mgr,
					  async_fun_combat_over,
					  [1, [], [], [], ApplyArge]}]);
		   _ -> ok
		 end,
		 [combat_replay_mgr:dec_replay_reference(DelReplayId)
		  || {_, _, DelReplayId} <- ReplayLists],
		 erase({Step, PRound, Id, arena_peak_win_count}),
		 erase({Step, PRound, Id, arena_peak_replay_info}),
		 ok
	   end
    end.

combat_over(_Name, _State, _Combat,
	    #combat_result{result = Result,
			   action_count = ActionCount,
			   replay_info = ReplayInfoT, a_stat_info = AStatInfo,
			   b_stat_info = BStatInfo},
	    Round, APos, BPos,
	    R = #peak_champion_pk{id = Id, step = Step,
				  round = PRound},
	    MainId, IsGuess, ApplyArge) ->
    ReplayInfo = [{ReplayIdT, ReplaySIdT}
		  || {ReplaySIdT, ReplayIdT} <- ReplayInfoT],
    [ReplayId | _] = ReplayInfo,
    {OldWinCount, OldLose} = util:get({Step, PRound, Id,
				       arena_peak_win_count},
				      {0, 0}),
    {WinCount, Lose} = case Result == 1 of
			 true -> {OldWinCount + 1, OldLose};
			 _ -> {OldWinCount, OldLose + 1}
		       end,
    put({Step, PRound, Id, arena_peak_win_count},
	{WinCount, Lose}),
    {ReplayLists, AStatInfos, BStatInfos} = util:get({Step,
						      PRound, Id,
						      arena_peak_replay_info},
						     {[], [], []}),
    RoundResult = util:if_true(Result == 1, 1, 2),
    AEndHp = to_p_list(AStatInfo),
    BEndHp = to_p_list(BStatInfo),
    RoundResultInfo = #arena_peak_result_info{order = Round,
					      time = date:unixtime(),
					      ret = RoundResult,
					      round = ActionCount,
					      a_end_hp = AEndHp,
					      b_end_hp = BEndHp,
					      replay_info = ReplayId},
    NReplayLists = [RoundResultInfo | ReplayLists],
    NewAstatInfo = merge_stat_info(AStatInfos, AStatInfo),
    NewBstatInfo = merge_stat_info(BStatInfos, BStatInfo),
    put({Step, PRound, Id, arena_peak_replay_info},
	{NReplayLists, NewAstatInfo, NewBstatInfo}),
    combat_replay_mgr:acc_replay_reference(ReplayId),
    if WinCount >= 2 orelse Lose >= 2 ->
	   do_combat_over(R, MainId, ApplyArge);
       true ->
	   do_combat(Round + 1, APos + 1, BPos + 1, R, MainId,
		     IsGuess, ApplyArge)
    end.

to_p_list(StatInfo) ->
    Fun = fun (#{hp := Hp, hp_max := HpMax},
	       {Acc1, Acc2}) ->
		  {Acc1 + Hp, Acc2 + HpMax}
	  end,
    {AllHp, AllMaxHp} = lists:foldl(Fun, {0, 0}, StatInfo),
    util:ceil(AllHp * 100 / AllMaxHp).

merge_stat_info(StatInfos, StatInfo) ->
    StatInfos ++
      [#{object_id => Id, hurt => Hurt, curt => Curt,
	 be_hurt => BeHurt}
       || #{object_id := Id, hurt := Hurt, curt := Curt,
	    be_hurt := BeHurt}
	      <- StatInfo].

do_combat_over(#peak_champion_pk{id = Id, step = Step,
				 round = PRound},
	       MainId, ApplyArge) ->
    {WinCount, LoseCount} = util:get({Step, PRound, Id,
				      arena_peak_win_count},
				     {0, 0}),
    {ReplayLists, AstatInfo, BStaeInfo} = util:get({Step,
						    PRound, Id,
						    arena_peak_replay_info},
						   {[], [], []}),
    erase({Step, PRound, Id, arena_peak_win_count}),
    erase({Step, PRound, Id, arena_peak_replay_info}),
    Result = util:if_true(WinCount > LoseCount, 1, 2),
    if WinCount == 0, LoseCount == 0 ->
	   case ApplyArge of
	     {score, _, _} ->
		 cluster_lib:cast(MainId, arena_peak_champion_mgr, apply,
				  [{arena_peak_champion_mgr,
				    async_fun_combat_over,
				    [1, [], [], [], ApplyArge]}]);
	     _ -> ok
	   end;
       true ->
	   cluster_lib:cast(MainId, arena_peak_champion_mgr, apply,
			    [{arena_peak_champion_mgr, async_fun_combat_over,
			      [Result, ReplayLists, AstatInfo, BStaeInfo,
			       ApplyArge]}])
    end.

gen_fight_objects(#peak_champion_pk{a_defense = Defense,
				    a_lev = Lev, a_id = RoleId,
				    a_sprite_lev = SpriteLev,
				    a_sprite_attr = SpriteAttr,
				    a_sprites = ASprites,
				    a_sprites_list = SpritesList,
				    a_break_groups = ABreakGroups},
		  a, Round) ->
    Role0 = role_data:first_init(#role{id =
					   {1, sys_env:get(server_id)},
				       type = robot}),
    Role = Role0#role{lev = Lev},
    case lists:keyfind(Round,
		       #arena_peak_role_defense.order, Defense)
	of
      #arena_peak_role_defense{formation_type = FormationType,
			       plist = PartnerDefense = [_ | _],
			       hallows_id = HallowsId, hallows_lev = HallowsLev,
			       hallows_skill_lev = HallowsSkillLev,
			       hallows_look_id = HallowsLookId,
			       hallows_all_look_ids = AllLooksIds,
			       hallows_lucky = HallowsLucky,
			       hallows_seal = HallowsSeal,
			       hallows_refine = HallowsRefine} ->
	  NewSprites = case lists:keyfind(Round, 1, SpritesList)
			   of
			 {Round, Sprites} -> Sprites;
			 _ -> ASprites
		       end,
	  AtkList = sprite_tree:gen_fight_object(Lev, SpriteLev,
						 SpriteAttr, NewSprites)
		      ++
		      hallows_lib:gen_def_fight_object(HallowsId, HallowsLev,
						       HallowsSkillLev,
						       HallowsLookId,
						       AllLooksIds,
						       HallowsLucky,
						       HallowsSeal,
						       HallowsRefine)
			++
			[gen_def_fight_objects_(PartnerInfo, FormationType,
						RoleId, Role)
			 || PartnerInfo <- PartnerDefense],
	  AtkList1 = combat_attr:calc(AtkList, 37, ABreakGroups),
	  {FormationType, AtkList1};
      _ -> {1, []}
    end;
gen_fight_objects(#peak_champion_pk{b_defense = Defense,
				    b_lev = Lev, b_id = RoleId,
				    b_sprite_lev = SpriteLev,
				    b_sprite_attr = SpriteAttr,
				    b_sprites = BSprites,
				    b_sprites_list = SpritesList,
				    b_break_groups = BBreakGroups},
		  b, Round) ->
    Role0 = role_data:first_init(#role{id =
					   {1, sys_env:get(server_id)},
				       type = robot}),
    Role = Role0#role{lev = Lev},
    case lists:keyfind(Round,
		       #arena_peak_role_defense.order, Defense)
	of
      #arena_peak_role_defense{formation_type = FormationType,
			       plist = PartnerDefense = [_ | _],
			       hallows_id = HallowsId, hallows_lev = HallowsLev,
			       hallows_skill_lev = HallowsSkillLev,
			       hallows_look_id = HallowsLookId,
			       hallows_all_look_ids = AllLooksIds,
			       hallows_lucky = HallowsLucky,
			       hallows_seal = HallowsSeal,
			       hallows_refine = HallowsRefine} ->
	  NewSprites = case lists:keyfind(Round, 1, SpritesList)
			   of
			 {Round, Sprites} -> Sprites;
			 _ -> BSprites
		       end,
	  AtkList = sprite_tree:gen_fight_object(Lev, SpriteLev,
						 SpriteAttr, NewSprites)
		      ++
		      hallows_lib:gen_def_fight_object(HallowsId, HallowsLev,
						       HallowsSkillLev,
						       HallowsLookId,
						       AllLooksIds,
						       HallowsLucky,
						       HallowsSeal,
						       HallowsRefine)
			++
			[gen_def_fight_objects_(PartnerInfo, FormationType,
						RoleId, Role)
			 || PartnerInfo <- PartnerDefense],
	  AtkList1 = combat_attr:calc(AtkList, 37, BBreakGroups),
	  {FormationType, AtkList1};
      _ -> {1, []}
    end.

gen_def_fight_objects_(#arena_peak_role_partner{pos =
						    Pos,
						id = Id, bid = Bid, lev = Lev,
						star = Star,
						break_lev = BreakLev,
						dower_skill = DowerSkill,
						power = Power, skin_id = SkinId,
						attr = Attr,
						set_skill = SetSkill,
						ext = Ext},
		       FormationType, RoleId, Role) ->
    ResonateLev = maps:get(11, Ext, 0),
    #formation_data{pos = FightPos} =
	formation_data:get_formation(FormationType),
    Pos1 = list_util:keyfind(Pos, FightPos),
    BaseData = #partner_base_data{} =
		   partner_data:get_base(Bid),
    P0 = partner:init_partner(Role, BaseData, Id, Lev,
			      Star),
    P = partner_lib:calc_attr(Role,
			      P0#partner{break_lev = BreakLev,
					 dower_skill = DowerSkill,
					 resonate_lev = ResonateLev}),
    P1 = P#partner{all_attr = Attr, power = Power,
		   lev = Lev, star = Star, break_lev = BreakLev,
		   set_skills = SetSkill, use_skin = SkinId},
    FO1 = partner_lib:gen_fight_object(RoleId, 0, P1,
				       combat_lib:is_leader(Pos), RoleId, 1),
    FO1#fight_object{pos = Pos1}.

-spec do_extract_join_role(role_id()) -> ok.

do_extract_join_role(MainId) ->
    RankList = sys_env:get(arena_peak_champione_data, []),
    L = do_extract_join_role(RankList, []),
    cluster_lib:cast(MainId, arena_peak_champion_mgr, info,
		     [{sync_role_init_data, L}]).

do_extract_join_role([], L) -> L;
do_extract_join_role([#arena_cluster_role{id = RoleId,
					  rank = Rank, score = Score}
		      | RankList],
		     L) ->
    case role_robot:get_role(RoleId) of
      {ok,
       R = #role_robot{face_file = FaceFile,
		       face_update_time = FaceUpdateTime,
		       m_sprite_tree = #m_sprite_tree{all_attr = SpriteAttr},
		       m_guild_skill =
			   #m_guild_skill{break_groups = BreakGroups}}} ->
	  PosInfos = get_defense(R),
	  Power = lists:sum([PowerT
			     || #arena_peak_role_defense{power = PowerT}
				    <- PosInfos]),
	  {SpriteLev, Sprites} = sprite_tree:get_sprite_lev(R,
							    95),
	  {_, Sprites1} = sprite_tree:get_sprite_lev(R, 95, 1),
	  {_, Sprites2} = sprite_tree:get_sprite_lev(R, 95, 2),
	  {_, Sprites3} = sprite_tree:get_sprite_lev(R, 95, 3),
	  ChampionRole = #arena_peak_champion_role{id =
						       R#role_robot.id,
						   name = R#role_robot.name,
						   lev = R#role_robot.lev,
						   sex = R#role_robot.sex,
						   face_id =
						       R#role_robot.face_id,
						   avatar_bid =
						       R#role_robot.avatar_bid,
						   sprites = Sprites,
						   sprite_lev = SpriteLev,
						   sprites_attr = SpriteAttr,
						   defense = PosInfos,
						   old_rank = Rank,
						   old_score = Score,
						   power = Power,
						   face_file = FaceFile,
						   face_update_time =
						       FaceUpdateTime,
						   sprites_list =
						       [{1, Sprites1},
							{2, Sprites2},
							{3, Sprites3}],
						   break_groups = BreakGroups},
	  do_extract_join_role(RankList, [ChampionRole | L]);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_lib343, _,
	     {__Levelarena_peak_champion_lib343,
	      __Tracesarena_peak_champion_lib343}}
		when __Levelarena_peak_champion_lib343 band 128 /= 0
		       orelse __Tracesarena_peak_champion_lib343 /= [] ->
		lager:do_log(debug,
			     [{module, arena_peak_champion_lib},
			      {function, do_extract_join_role}, {line, 343},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("加载玩家失败:~w", [RoleId]), none, 4096,
			     128, __Levelarena_peak_champion_lib343,
			     __Tracesarena_peak_champion_lib343, lager_event,
			     __Pidarena_peak_champion_lib343);
	    _ -> ok
	  end,
	  []
    end.

update_role_defense(R = #arena_peak_champion_role{id =
						      {_, <<>>}}) ->
    skip;
update_role_defense(PeakRole =
			#arena_peak_champion_role{id = RoleId}) ->
    case role_robot:get_role(RoleId) of
      {ok,
       R = #role_robot{face_file = FaceFile,
		       face_update_time = FaceUpdateTime,
		       m_sprite_tree = #m_sprite_tree{all_attr = SpriteAttr},
		       m_guild_skill =
			   #m_guild_skill{break_groups = BreakGroups}}} ->
	  PosInfos = get_defense(R),
	  Power = lists:sum([PowerT
			     || #arena_peak_role_defense{power = PowerT}
				    <- PosInfos]),
	  {SpriteLev, Sprites} = sprite_tree:get_sprite_lev(R,
							    95),
	  {_, Sprites1} = sprite_tree:get_sprite_lev(R, 95, 1),
	  {_, Sprites2} = sprite_tree:get_sprite_lev(R, 95, 2),
	  {_, Sprites3} = sprite_tree:get_sprite_lev(R, 95, 3),
	  ChampionRole = PeakRole#arena_peak_champion_role{name =
							       R#role_robot.name,
							   lev =
							       R#role_robot.lev,
							   sex =
							       R#role_robot.sex,
							   face_id =
							       R#role_robot.face_id,
							   avatar_bid =
							       R#role_robot.avatar_bid,
							   sprites = Sprites,
							   sprite_lev =
							       SpriteLev,
							   sprites_attr =
							       SpriteAttr,
							   defense = PosInfos,
							   power = Power,
							   face_file = FaceFile,
							   face_update_time =
							       FaceUpdateTime,
							   sprites_list =
							       [{1, Sprites1},
								{2, Sprites2},
								{3, Sprites3}],
							   break_groups =
							       BreakGroups},
	  d_ets_lib:save_d_ets(arena_peak_champion_role,
			       ChampionRole);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_lib375, _,
	     {__Levelarena_peak_champion_lib375,
	      __Tracesarena_peak_champion_lib375}}
		when __Levelarena_peak_champion_lib375 band 128 /= 0
		       orelse __Tracesarena_peak_champion_lib375 /= [] ->
		lager:do_log(debug,
			     [{module, arena_peak_champion_lib},
			      {function, update_role_defense}, {line, 375},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("加载玩家失败:~w", [RoleId]), none, 4096,
			     128, __Levelarena_peak_champion_lib375,
			     __Tracesarena_peak_champion_lib375, lager_event,
			     __Pidarena_peak_champion_lib375);
	    _ -> ok
	  end,
	  []
    end;
update_role_defense(_R) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_lib379, _,
       {__Levelarena_peak_champion_lib379,
	__Tracesarena_peak_champion_lib379}}
	  when __Levelarena_peak_champion_lib379 band 64 /= 0
		 orelse __Tracesarena_peak_champion_lib379 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_lib},
			{function, update_role_defense}, {line, 379},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("巅峰冠军赛加载数据失败:~w", [_R]), none, 4096, 64,
		       __Levelarena_peak_champion_lib379,
		       __Tracesarena_peak_champion_lib379, lager_event,
		       __Pidarena_peak_champion_lib379);
      _ -> ok
    end,
    ok.

get_defense(R = #role_robot{m_arena_peak_champion =
				#m_arena_peak_champion{defense = Defense}}) ->
    case Defense of
      [] -> init_defens(R);
      _ ->
	  NDefense = do_del_dup_defense(Defense, []),
	  [to_peak_def(R, Data) || Data <- NDefense]
    end.

do_del_dup_defense([], L) -> L;
do_del_dup_defense([{OrderId, FormationType, PosInfo,
		     HallowsId, _}
		    | Defense],
		   L) ->
    do_del_dup_defense([{OrderId, FormationType, PosInfo,
			 HallowsId}
			| Defense],
		       L);
do_del_dup_defense([{OrderId, FormationType, PosInfo,
		     HallowsId}
		    | Defense],
		   L) ->
    AllPos = lists:flatten([NPosInfo
			    || {_, _, NPosInfo, _} <- L]),
    Fun = fun (F, Acc) ->
		  case F of
		    #formation_pos{id = Id} ->
			case lists:keyfind(Id, #formation_pos.id, AllPos) of
			  #formation_pos{} -> Acc;
			  _ -> [F | Acc]
			end;
		    _ -> [F | Acc]
		  end
	  end,
    NewPosInfo = lists:foldl(Fun, [], PosInfo),
    do_del_dup_defense(Defense,
		       [{OrderId, FormationType, NewPosInfo, HallowsId} | L]).

init_defens(R) ->
    {_, _, Defense} = arena_cluster:get_formation_sys(R, 2),
    [to_peak_def(R, Data) || Data <- Defense].

to_peak_def(R,
	    {OrderId, FormationType, PosInfo, HallowsId, _}) ->
    to_peak_def(R,
		{OrderId, FormationType, PosInfo, HallowsId});
to_peak_def(R,
	    {OrderId, FormationType, PosInfo, HallowsId}) ->
    {HallowsId, HallowsLev, HallowsSkillLev, HallowsLookId,
     HallowsLookIds, HallowsLucky, HallowsSeal} =
	hallows_lib:get_hallows_info2(R, HallowsId),
    HallowRefine = hallows_lib:get_hallows_refine(R,
						  HallowsId),
    PList = to_p_list(R, PosInfo, []),
    #arena_peak_role_defense{order = OrderId,
			     formation_type = FormationType,
			     hallows_id = HallowsId, hallows_lev = HallowsLev,
			     hallows_skill_lev = HallowsSkillLev,
			     hallows_look_id = HallowsLookId,
			     hallows_lucky = HallowsLucky,
			     hallows_seal = HallowsSeal,
			     hallows_refine = HallowRefine,
			     hallows_all_look_ids = HallowsLookIds,
			     power =
				 lists:sum([PowerT
					    || #arena_peak_role_partner{power =
									    PowerT}
						   <- PList]),
			     plist = PList}.

to_p_list(_R, [], L) -> L;
to_p_list(R,
	  [#formation_pos{pos = Pos, id = Id} | PosInfo], L) ->
    case partner_lib:get_partner(R, Id) of
      P = #partner{} ->
	  PeakPartner = #arena_peak_role_partner{pos = Pos,
						 id = Id, bid = P#partner.bid,
						 lev = P#partner.lev,
						 star = P#partner.star,
						 break_lev =
						     P#partner.break_lev,
						 power = P#partner.power,
						 skin_id = P#partner.use_skin,
						 dower_skill =
						     P#partner.dower_skill,
						 set_skill =
						     P#partner.set_skills,
						 attr = P#partner.all_attr,
						 ext =
						     #{11 =>
							   P#partner.resonate_lev}},
	  to_p_list(R, PosInfo, [PeakPartner | L]);
      _ -> to_p_list(R, PosInfo, L)
    end.

-spec score_match(#champion_state{}, atom) -> ok.

score_match(State, Type) ->
    put(pk_list, []),
    self() ! load_pk_info,
    L1 = ets:tab2list(arena_peak_champion_role),
    NewL1 = case Type == init of
	      true -> do_init_rank(L1);
	      _ -> L1
	    end,
    L = util:keys_sort([#arena_peak_champion_role.power],
		       NewL1),
    score_match_group(1, State, L).

score_match_group(N, State, L = [_ | _]) when N =< 8 ->
    {L1, L2} = lists:partition(fun
				 (#arena_peak_champion_role{group = Group}) ->
				     N =:= Group
			       end,
			       L),
    do_score_match_group(L1, L1, 1, State),
    score_match_group(N + 1, State, L2);
score_match_group(_N, _State, _L) -> ok.

do_score_match_group([], _L, _Rank, _State) -> ok;
do_score_match_group([R = #arena_peak_champion_role{id =
							Id}
		      | T],
		     L, Rank, State = #champion_state{round = Round}) ->
    AllNum = length(L),
    #{rank := {MinRio, MaxRio}} =
	arena_peak_champion_data:get_score_match({Round,
						  Rank / AllNum * 1000}),
    MinRank = AllNum / 1000 * MinRio,
    MaxRank = AllNum / 1000 * MaxRio,
    PKRoleIds = case arena_peak_champion_db:get_pk(Id) of
		  {ok,
		   #peak_champion_pk{b_id = LastId, pk_rlist = PkList1}} ->
		      [LastId | PkList1];
		  _ -> []
		end,
    R2 = case do_score_match_find(L, MinRank, MaxRank,
				  [get({matched, Id}), Id | PKRoleIds], [], 1)
	     of
	   undefined ->
	       case {whereis(lager_event), whereis(lager_event),
		     lager_config:get({lager_event, loglevel}, {0, []})}
		   of
		 {undefined, undefined, _} ->
		     fun () -> {error, lager_not_running} end();
		 {undefined, _, _} ->
		     fun () -> {error, {sink_not_configured, lager_event}}
		     end();
		 {__Pidarena_peak_champion_lib490, _,
		  {__Levelarena_peak_champion_lib490,
		   __Tracesarena_peak_champion_lib490}}
		     when __Levelarena_peak_champion_lib490 band 8 /= 0
			    orelse __Tracesarena_peak_champion_lib490 /= [] ->
		     lager:do_log(error,
				  [{module, arena_peak_champion_lib},
				   {function, do_score_match_group},
				   {line, 490}, {pid, pid_to_list(self())},
				   {node, node()}
				   | lager:md()],
				  io_lib:format("根据配置无法匹配到玩家,id=~w rank=~w, min_rank=~w, "
						"max_rank=~w, round=~w pkroleid=~w",
						[Id, Rank, MinRank, MaxRank,
						 Round, PKRoleIds]),
				  none, 4096, 8,
				  __Levelarena_peak_champion_lib490,
				  __Tracesarena_peak_champion_lib490,
				  lager_event, __Pidarena_peak_champion_lib490);
		 _ -> ok
	       end,
	       util:rand_list(L);
	   GetR -> GetR
	 end,
    PK = convert_pk(State, 1, 0, 0, 0, R, R2),
    d_ets_lib:save_ets(arena_peak_champion_pk,
		       PK#peak_champion_pk{pk_rlist = PKRoleIds}),
    do_score_match_group(T, L, Rank + 1, State).

do_score_match_find([], _Min, _Max, _ExcludeRoleIds, L,
		    _Rank) ->
    util:rand_list(L);
do_score_match_find([R = #arena_peak_champion_role{id =
						       Id}
		     | T],
		    Min, Max, ExcludeRoleIds, L, Rank)
    when Rank >= Min andalso Rank =< Max ->
    case lists:member(Id, ExcludeRoleIds) of
      true ->
	  do_score_match_find(T, Min, Max, ExcludeRoleIds, L,
			      Rank + 1);
      false ->
	  do_score_match_find(T, Min, Max, ExcludeRoleIds,
			      [R | L], Rank + 1)
    end;
do_score_match_find([_ | T], Min, Max, ExcludeRoleIds,
		    L, Rank) ->
    do_score_match_find(T, Min, Max, ExcludeRoleIds, L,
			Rank + 1).

champion_match(Num, Group, State) ->
    put(pk_list, []),
    self() ! load_pk_info,
    RL0 = arena_peak_champion_db:list_rank(Num),
    RL = util:shuffle(RL0),
    [NR1, NR2, NR3, NR4, NR5, NR6, NR7, NR8] =
	lists:keysort(#arena_peak_champion_role.rank, RL0),
    {L1, L2} = {[NR1, NR2, NR4, NR3], [NR8, NR7, NR5, NR6]},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_lib520, _,
       {__Levelarena_peak_champion_lib520,
	__Tracesarena_peak_champion_lib520}}
	  when __Levelarena_peak_champion_lib520 band 64 /= 0
		 orelse __Tracesarena_peak_champion_lib520 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_lib},
			{function, champion_match}, {line, 520},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("获取~w强数据:~w:~w",
				     [Num, length(L1), length(L2)]),
		       none, 4096, 64, __Levelarena_peak_champion_lib520,
		       __Tracesarena_peak_champion_lib520, lager_event,
		       __Pidarena_peak_champion_lib520);
      _ -> ok
    end,
    do_champion_match(L1, L2, 1, State, [{Group, []}]).

do_champion_match([], [], _, _State, L) -> L;
do_champion_match(L1, L2, 9, State, L) ->
    do_champion_match(L1, L2, 1, State,
		      [{length(L) + 1, []} | L]);
do_champion_match([R1 = #arena_peak_champion_role{id =
						      Id1,
						  avatar_bid = AvaBid1,
						  name = Name1, sex = Sex1,
						  lev = Lev1, face_id = Face1,
						  face_file = FaceFile1,
						  face_update_time =
						      FaceUpdateTime1,
						  power = MaxPower1}
		   | T1],
		  [R2 = #arena_peak_champion_role{id = Id2,
						  avatar_bid = AvaBid2,
						  name = Name2, sex = Sex2,
						  face_id = Face2, lev = Lev2,
						  power = MaxPower2,
						  face_file = FaceFile2,
						  face_update_time =
						      FaceUpdateTime2}
		   | T2],
		  N, State, [{Group, L1} | T]) ->
    Ext1 = [{1, FaceUpdateTime1, FaceFile1}],
    Ext2 = [{1, FaceUpdateTime2, FaceFile2}],
    PK1 = #peak_champion_32_pk{id = Id1, name = Name1,
			       lev = Lev1, sex = Sex1, face_id = Face1,
			       avatar_bid = AvaBid1, pos = N,
			       max_power = MaxPower1, ext = Ext1},
    PK2 = #peak_champion_32_pk{id = Id2, name = Name2,
			       lev = Lev2, sex = Sex2, face_id = Face2,
			       avatar_bid = AvaBid2, pos = N + 1,
			       max_power = MaxPower2, ext = Ext2},
    d_ets_lib:save_ets(arena_peak_champion_pk,
		       convert_pk(State, 1, Group, N, N + 1, R1, R2)),
    d_ets_lib:save_ets(arena_peak_champion_pk,
		       convert_pk(State, 0, Group, N + 1, N, R2, R1)),
    do_champion_match(T1, T2, N + 2, State,
		      [{Group, [PK2, PK1 | L1]} | T]).

champion_match2(Num, Group, State) ->
    put(pk_list, []),
    self() ! load_pk_info,
    GList = arena_peak_champion_data:get_64_group(),
    Fun = fun (Rank, Acc) ->
		  case arena_peak_champion_db:rank_role(Rank) of
		    {ok, R} -> [R | Acc];
		    _ ->
			case {whereis(lager_event), whereis(lager_event),
			      lager_config:get({lager_event, loglevel},
					       {0, []})}
			    of
			  {undefined, undefined, _} ->
			      fun () -> {error, lager_not_running} end();
			  {undefined, _, _} ->
			      fun () ->
				      {error,
				       {sink_not_configured, lager_event}}
			      end();
			  {__Pidarena_peak_champion_lib545, _,
			   {__Levelarena_peak_champion_lib545,
			    __Tracesarena_peak_champion_lib545}}
			      when __Levelarena_peak_champion_lib545 band 8 /= 0
				     orelse
				     __Tracesarena_peak_champion_lib545 /= [] ->
			      lager:do_log(error,
					   [{module, arena_peak_champion_lib},
					    {function, champion_match2},
					    {line, 545},
					    {pid, pid_to_list(self())},
					    {node, node()}
					    | lager:md()],
					   io_lib:format("巅峰赛找不到排名数据：~w",
							 [Rank]),
					   none, 4096, 8,
					   __Levelarena_peak_champion_lib545,
					   __Tracesarena_peak_champion_lib545,
					   lager_event,
					   __Pidarena_peak_champion_lib545);
			  _ -> ok
			end,
			Acc
		  end
	  end,
    RL = [{GroupT, lists:foldl(Fun, [], RankList)}
	  || {GroupT, RankList} <- GList],
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_lib551, _,
       {__Levelarena_peak_champion_lib551,
	__Tracesarena_peak_champion_lib551}}
	  when __Levelarena_peak_champion_lib551 band 64 /= 0
		 orelse __Tracesarena_peak_champion_lib551 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_lib},
			{function, champion_match2}, {line, 551},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("获取~w强数据:~w", [Num, length(RL)]), none,
		       4096, 64, __Levelarena_peak_champion_lib551,
		       __Tracesarena_peak_champion_lib551, lager_event,
		       __Pidarena_peak_champion_lib551);
      _ -> ok
    end,
    do_champion_match2(RL, State, []).

do_champion_match2([], _State, L) -> L;
do_champion_match2([{Group,
		     [R1, R2, R3, R4, R5, R6, R7, R8]}
		    | Other],
		   State, T) ->
    [NR1, NR2, NR3, NR4, NR5, NR6, NR7, NR8] =
	lists:keysort(#arena_peak_champion_role.rank,
		      [R1, R2, R3, R4, R5, R6, R7, R8]),
    {T1, T2} = {[NR1, NR2, NR4, NR3], [NR8, NR7, NR5, NR6]},
    T3 = do_champion_match(T1, T2, 1, State, [{Group, []}]),
    do_champion_match2(Other, State, T3 ++ T).

champion_match3(Num, _, State) ->
    put(pk_list, []),
    self() ! load_pk_info,
    GList = arena_peak_champion_data:get_256_group(),
    Fun = fun (Rank, Acc) ->
		  case arena_peak_champion_db:rank_role(Rank) of
		    {ok, R} -> [R | Acc];
		    _ ->
			case {whereis(lager_event), whereis(lager_event),
			      lager_config:get({lager_event, loglevel},
					       {0, []})}
			    of
			  {undefined, undefined, _} ->
			      fun () -> {error, lager_not_running} end();
			  {undefined, _, _} ->
			      fun () ->
				      {error,
				       {sink_not_configured, lager_event}}
			      end();
			  {__Pidarena_peak_champion_lib571, _,
			   {__Levelarena_peak_champion_lib571,
			    __Tracesarena_peak_champion_lib571}}
			      when __Levelarena_peak_champion_lib571 band 8 /= 0
				     orelse
				     __Tracesarena_peak_champion_lib571 /= [] ->
			      lager:do_log(error,
					   [{module, arena_peak_champion_lib},
					    {function, champion_match3},
					    {line, 571},
					    {pid, pid_to_list(self())},
					    {node, node()}
					    | lager:md()],
					   io_lib:format("巅峰赛找不到排名数据：~w",
							 [Rank]),
					   none, 4096, 8,
					   __Levelarena_peak_champion_lib571,
					   __Tracesarena_peak_champion_lib571,
					   lager_event,
					   __Pidarena_peak_champion_lib571);
			  _ -> ok
			end,
			Acc
		  end
	  end,
    RL = [{GroupT, lists:foldl(Fun, [], RankList)}
	  || {GroupT, RankList} <- GList],
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_lib577, _,
       {__Levelarena_peak_champion_lib577,
	__Tracesarena_peak_champion_lib577}}
	  when __Levelarena_peak_champion_lib577 band 64 /= 0
		 orelse __Tracesarena_peak_champion_lib577 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_lib},
			{function, champion_match3}, {line, 577},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("获取~w强数据:~w", [Num, length(RL)]), none,
		       4096, 64, __Levelarena_peak_champion_lib577,
		       __Tracesarena_peak_champion_lib577, lager_event,
		       __Pidarena_peak_champion_lib577);
      _ -> ok
    end,
    do_champion_match3(RL, State, []).

do_champion_match3([], _State, L) -> L;
do_champion_match3([{Group,
		     [R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13,
		      R14, R15, R16]}
		    | Other],
		   State, T) ->
    [NR1, NR2, NR3, NR4, NR5, NR6, NR7, NR8, NR9, NR10,
     NR11, NR12, NR13, NR14, NR15, NR16] =
	lists:keysort(#arena_peak_champion_role.rank,
		      [R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13,
		       R14, R15, R16]),
    {T1, T2} = {[NR1, NR2, NR3, NR4, NR8, NR7, NR6, NR5],
		[NR16, NR15, NR14, NR13, NR9, NR10, NR11, NR12]},
    T3 = do_champion_match4(T1, T2, 1, State,
			    [{Group, []}]),
    do_champion_match3(Other, State, T3 ++ T).

do_champion_match4([], [], _, _State, L) -> L;
do_champion_match4(L1, L2, 17, State, L) ->
    do_champion_match4(L1, L2, 1, State,
		       [{length(L) + 1, []} | L]);
do_champion_match4([R1 = #arena_peak_champion_role{id =
						       Id1,
						   name = Name1,
						   avatar_bid = AvaBid1,
						   sex = Sex1, lev = Lev1,
						   face_id = Face1,
						   face_file = FaceFile1,
						   face_update_time =
						       FaceUpdateTime1,
						   power = MaxPower1}
		    | T1],
		   [R2 = #arena_peak_champion_role{id = Id2,
						   avatar_bid = AvaBid2,
						   name = Name2, sex = Sex2,
						   face_id = Face2,
						   face_file = FaceFile2,
						   face_update_time =
						       FaceUpdateTime2,
						   lev = Lev2,
						   power = MaxPower2}
		    | T2],
		   N, State, [{Group, L1} | T]) ->
    Ext1 = [{1, FaceUpdateTime1, FaceFile1}],
    Ext2 = [{1, FaceUpdateTime2, FaceFile2}],
    PK1 = #peak_champion_32_pk{id = Id1, name = Name1,
			       lev = Lev1, sex = Sex1, face_id = Face1,
			       avatar_bid = AvaBid1, pos = N,
			       max_power = MaxPower1, ext = Ext1},
    PK2 = #peak_champion_32_pk{id = Id2, name = Name2,
			       lev = Lev2, sex = Sex2, face_id = Face2,
			       avatar_bid = AvaBid2, pos = N + 1,
			       max_power = MaxPower2, ext = Ext2},
    d_ets_lib:save_ets(arena_peak_champion_pk,
		       convert_pk(State, 1, Group, N, N + 1, R1, R2)),
    d_ets_lib:save_ets(arena_peak_champion_pk,
		       convert_pk(State, 0, Group, N + 1, N, R2, R1)),
    do_champion_match4(T1, T2, N + 2, State,
		       [{Group, [PK2, PK1 | L1]} | T]).

convert_pk(#champion_state{step = Step, round = Round},
	   IsGuess, Group, APos, BPos,
	   #arena_peak_champion_role{id = Id,
				     sprite_lev = SpriteLev, sprites = Sprites,
				     sprites_attr = SpritesAttr,
				     defense = Defense, name = Name,
				     power = Power, lev = Lev, sex = Sex,
				     face_id = Face, face_file = FaceFile1,
				     face_update_time = FaceUpdateTime1,
				     avatar_bid = AvatarId, robot_id = RobotId,
				     sprites_list = SpritesList,
				     break_groups = BreakGroups},
	   #arena_peak_champion_role{id = Id2,
				     sprite_lev = SpriteLev2,
				     sprites = Sprites2,
				     sprites_attr = SpritesAttr2,
				     defense = Defense2, name = Name2,
				     sex = Sex2, face_id = Face2,
				     face_file = FaceFile2,
				     face_update_time = FaceUpdateTime2,
				     avatar_bid = AvatarId2, lev = Lev2,
				     power = Power2, robot_id = RobotId2,
				     sprites_list = SpritesList2,
				     break_groups = BreakGroups2}) ->
    put({matched, Id2}, Id),
    put({pos, Group, APos}, Id),
    put(pk_list, [Id | get(pk_list)]),
    #peak_champion_pk{id = Id, group = Group,
		      is_guess = IsGuess, a_pos = APos, a_id = Id,
		      a_name = Name, a_lev = Lev, a_power = Power,
		      a_face = Face, a_avatar_id = AvatarId, a_sex = Sex,
		      a_robot_id = RobotId, a_defense = Defense,
		      a_sprite_lev = SpriteLev, a_sprites = Sprites,
		      a_sprite_attr = SpritesAttr, b_pos = BPos, b_id = Id2,
		      b_name = Name2, b_lev = Lev2, b_power = Power2,
		      b_sex = Sex2, b_robot_id = RobotId2, b_face = Face2,
		      b_avatar_id = AvatarId2, b_defense = Defense2,
		      b_sprite_lev = SpriteLev2, b_sprites = Sprites2,
		      b_sprite_attr = SpritesAttr2,
		      diff_power = abs(Power - Power2), step = Step,
		      round = Round, a_face_update_time = FaceUpdateTime1,
		      a_face_file = FaceFile1,
		      b_face_update_time = FaceUpdateTime2,
		      b_face_file = FaceFile2, a_sprites_list = SpritesList,
		      b_sprites_list = SpritesList2,
		      a_break_groups = BreakGroups,
		      b_break_groups = BreakGroups2}.

gen_next_champion_pk(State = #champion_state{step =
						 256}) ->
    [do_gen_next_champion_pk(Group, State,
			     arena_peak_champion_db:get_ext({champion_256_temp,
							     Group},
							    []),
			     State)
     || Group <- lists:seq(1, 16)];
gen_next_champion_pk(State = #champion_state{step =
						 64}) ->
    [do_gen_next_champion_pk(Group, State,
			     arena_peak_champion_db:get_ext({champion_64_temp,
							     Group},
							    []),
			     State)
     || Group <- lists:seq(1, 8)];
gen_next_champion_pk(State) ->
    do_gen_next_champion_pk(0, State,
			    arena_peak_champion_db:get_ext(champion_4_temp, []),
			    State).

do_gen_next_champion_pk(Group, State, L,
			#champion_state{step = Step, round = Round}) ->
    PosL = step_round_combat_pos(Step, Round),
    [do_gen_next_champion_pk_(Group, State, Pos1,
			      lists:keyfind(Pos1, #peak_champion_32_pk.pos, L),
			      Pos2,
			      lists:keyfind(Pos2, #peak_champion_32_pk.pos, L),
			      L)
     || {Pos1, Pos2} <- PosL].

do_gen_next_champion_pk_(Group, State, Pos1,
			 #peak_champion_32_pk{id = Id1}, Pos2,
			 #peak_champion_32_pk{id = Id2}, _L) ->
    {ok, R1} = arena_peak_champion_db:get_role(Id1),
    {ok, R2} = arena_peak_champion_db:get_role(Id2),
    d_ets_lib:save_ets(arena_peak_champion_pk,
		       convert_pk(State, 1, Group, Pos1, Pos2, R1, R2)),
    d_ets_lib:save_ets(arena_peak_champion_pk,
		       convert_pk(State, 0, Group, Pos2, Pos1, R2, R1));
do_gen_next_champion_pk_(_Group, _State, _Pos1, _R1,
			 _Pos2, _R2, L) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_lib670, _,
       {__Levelarena_peak_champion_lib670,
	__Tracesarena_peak_champion_lib670}}
	  when __Levelarena_peak_champion_lib670 band 8 /= 0
		 orelse __Tracesarena_peak_champion_lib670 /= [] ->
	  lager:do_log(error,
		       [{module, arena_peak_champion_lib},
			{function, do_gen_next_champion_pk_}, {line, 670},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("产生PK信息失败：group:~w ~w:~w pk ~w:~w, list=~w",
				     [_Group, _Pos1, _R1, _Pos2, _R2, L]),
		       none, 4096, 8, __Levelarena_peak_champion_lib670,
		       __Tracesarena_peak_champion_lib670, lager_event,
		       __Pidarena_peak_champion_lib670);
      _ -> ok
    end.

step_round_combat_pos(8, 1) ->
    [{1, 2}, {3, 4}, {5, 6}, {7, 8}];
step_round_combat_pos(8, 2) -> [{9, 11}, {10, 12}];
step_round_combat_pos(8, 3) -> [{13, 14}];
step_round_combat_pos(64, 1) ->
    [{1, 2}, {3, 4}, {5, 6}, {7, 8}];
step_round_combat_pos(64, 2) -> [{9, 11}, {10, 12}];
step_round_combat_pos(64, 3) -> [{13, 14}];
step_round_combat_pos(256, 1) ->
    [{1, 2}, {3, 4}, {5, 6}, {7, 8}, {9, 10}, {11, 12},
     {13, 14}, {15, 16}];
step_round_combat_pos(256, 2) ->
    [{17, 21}, {18, 22}, {19, 23}, {20, 24}];
step_round_combat_pos(_, _) -> [].

do_init_rank(L) ->
    L2 = util:keys_sort([#arena_peak_champion_role.power,
			 #arena_peak_champion_role.old_score,
			 {asc, #arena_peak_champion_role.old_rank}],
			L),
    {BasePower, BaseLev} = case
			     lists:keysort(#arena_peak_champion_role.power, L)
			       of
			     [#arena_peak_champion_role{power = MaxPower,
							lev = Lev}
			      | _] ->
				 {MaxPower, Lev};
			     _ ->
				 {arena_peak_champion_data:get_constant(base_power),
				  arena_peak_champion_data:get_constant(base_lev)}
			   end,
    RobotType =
	arena_peak_champion_data:get_robot_type(BasePower),
    NewL = do_init_rank(L2, 1, [], RobotType, BasePower,
			BaseLev),
    RankL = [#arena_champion_rank{rank = Rank,
				  old_rank = OldRank, id = Id, score = Score,
				  score_32 = Score32}
	     || #arena_peak_champion_role{id = Id, rank = Rank,
					  old_rank = OldRank, score = Score,
					  score_32 = Score32}
		    <- NewL],
    d_ets_lib:save_d_ets(arena_peak_champion_role, NewL),
    d_ets_lib:save_ets(arena_peak_champion_rank, RankL),
    NewL.

do_init_rank([], Rank, L, _RobotType, _BasePower,
	     _BaseLev)
    when Rank > 256 ->
    L;
do_init_rank([], Rank, L, RobotType, BasePower, BaseLev)
    when Rank =< 256 ->
    R = init_rank_robot(Rank, BasePower, RobotType,
			BaseLev),
    Group = (Rank - 1) rem 1 + 1,
    Score = arena_peak_champion_data:get_score(Rank),
    NewR = R#arena_peak_champion_role{rank = Rank,
				      group = Group, score = Score},
    do_init_rank([], Rank + 1, [NewR | L], RobotType,
		 BasePower, BaseLev);
do_init_rank([R = #arena_peak_champion_role{old_rank =
						OldRank}
	      | L2],
	     Rank, L, RobotType, BasePower, BaseLev) ->
    Group = (Rank - 1) rem 1 + 1,
    Score = arena_peak_champion_data:get_score(OldRank),
    NewR = R#arena_peak_champion_role{rank = Rank,
				      group = Group, score = Score},
    do_init_rank(L2, Rank + 1, [NewR | L], RobotType,
		 BasePower, BaseLev).

init_rank_robot(Rank, BasePower, RobotType, BaseLev) ->
    case arena_peak_champion_data:get_robot({RobotType,
					     Rank})
	of
      Data = #{robot := _RobotIds,
	       robot_power := _RobotPowers, robot_lev := _RobotLevs} ->
	  BaseScore = arena_peak_champion_data:get_score(Rank),
	  gen_robot_champion_role(Data, BasePower, BaseLev, Rank,
				  Rank, max(0, BaseScore));
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_lib719, _,
	     {__Levelarena_peak_champion_lib719,
	      __Tracesarena_peak_champion_lib719}}
		when __Levelarena_peak_champion_lib719 band 8 /= 0
		       orelse __Tracesarena_peak_champion_lib719 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_lib},
			      {function, init_rank_robot}, {line, 719},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("查找不到机器人数据:rank:~w, id:~w",
					   [Rank, RobotType]),
			     none, 4096, 8, __Levelarena_peak_champion_lib719,
			     __Tracesarena_peak_champion_lib719, lager_event,
			     __Pidarena_peak_champion_lib719);
	    _ -> ok
	  end
    end.

gen_robot_champion_role(#{robot := RobotIds,
			  robot_power := RobotPowers, robot_lev := RobotLevs},
			BasePower, BaseLev, Rank, N, BaseScore) ->
    Score =
	round(arena_peak_champion_data:get_constant(score_arg) *
		BaseScore
		/ 1000),
    {MinRatio, MaxRatio} = util:rand_list(RobotPowers),
    PowerRatio = util:rand(MinRatio, MaxRatio),
    Power = round(BasePower * PowerRatio / 1000),
    Name1 = util:rand_list(random_name_data:arena_list(1)),
    Name2 = util:rand_list(random_name_data:arena_list(2)),
    Name3 = util:rand_list(random_name_data:arena_list(3)),
    Name = <<Name1/binary, Name2/binary, Name3/binary>>,
    Sex = util:rand(0, 1),
    Face =
	util:rand_list(arena_peak_champion_data:get_constant(face_list)),
    [RobotId | _] = AllRobotId = [util:rand_list(RobotIds),
				  util:rand_list(RobotIds),
				  util:rand_list(RobotIds)],
    {MinLev, MaxLev} = util:rand_list(RobotLevs),
    Lev = min(max(10, BaseLev + util:rand(MinLev, MaxLev)),
	      role_career_data:get_const(max_lev)),
    RobotPower = util:ceil(Power / length(AllRobotId)),
    PosInfos = get_formation_info(AllRobotId, 1, [],
				  RobotPower, Lev),
    Group = (Rank - 1) rem 1 + 1,
    #arena_peak_champion_role{id = {N, <<>>}, name = Name,
			      lev = Lev, sex = Sex, face_id = Face,
			      avatar_bid = 0, sprites = [], sprite_lev = 0,
			      sprites_attr = #attr{}, defense = PosInfos,
			      old_rank = Rank, old_score = Score,
			      robot_id = RobotId, rank = Rank, group = Group,
			      score = Score, power = Power}.

get_formation_info([], _Order, L, _RobotPower, _Lev) ->
    L;
get_formation_info([RobotId | Other], Order, L, Power,
		   Lev) ->
    Role0 = role_data:first_init(#role{id =
					   {1, sys_env:get(server_id)},
				       type = robot}),
    Role = Role0#role{lev = Lev},
    #{formation := FormationType, partners := Partners,
      hallows := {HallowsId, HallowsStep, HallowsSkill}} =
	robot:get(Role, RobotId, #{power => Power div 5}),
    FormationLev = 1,
    PList = [#arena_peak_role_partner{pos = Pos,
				      id = Order * 1000 + Pos,
				      bid = P#partner.bid, lev = P#partner.lev,
				      star = P#partner.star,
				      break_lev = P#partner.break_lev,
				      power = P#partner.power,
				      skin_id = P#partner.use_skin,
				      dower_skill = P#partner.dower_skill,
				      set_skill = P#partner.set_skills,
				      attr = P#partner.all_attr,
				      ext = #{11 => P#partner.resonate_lev}}
	     || P = #partner{id = Pos} <- Partners],
    {FormationType, FormationLev, PList, 0, []},
    Defense = #arena_peak_role_defense{order = Order,
				       formation_type = FormationType,
				       hallows_id = HallowsId,
				       hallows_lev = HallowsStep,
				       hallows_skill_lev = HallowsSkill,
				       hallows_look_id = 0,
				       power =
					   lists:sum([PowerT
						      || #arena_peak_role_partner{power
										      =
										      PowerT}
							     <- PList]),
				       plist = PList},
    get_formation_info(Other, Order + 1, [Defense | L],
		       Power, Lev).


