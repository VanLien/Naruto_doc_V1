-file("data/arena_peak_champion_mgr.erl", 1).

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_mgr.erl",
      1).

-module(arena_peak_champion_mgr).

-lager_records([{activity,
		 [id, status, name, data, ext_args]},
		{role_feedback_info,
		 [role_id, id, state, status2, start_time, end_msg_time,
		  finish_time, score_time, title, content,
		  questions_lists, answer_lists, score]},
		{feedback,
		 [sess, rid, feedback_id, status, score, send_time,
		  time_out]},
		{gmail,
		 [id, type, mail_type, subject, content, assets, items,
		  start_time, end_time, conds, source, can_del]},
		{mail,
		 [sess, to, to_name, from, from_name, type, group_id,
		  status, subject, content, assets, items, source, rev_ts,
		  read_time, send_time, time_out, can_del]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
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
		{cluster_dynamic_local_group, [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
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
		  p_eqm, p_home]},
		{state, [ts, timeout, switch]}]).

-behaviour(gen_fsm).

-export([m/0, info/1, cast/1, call/1, start_link/0]).

-export([call_apply/1, apply/1]).

-export([continue/2, continue/3]).

-export([init/1, handle_event/3, handle_sync_event/4,
	 handle_info/3, terminate/3, code_change/4]).

-export([idle/2, score_guess/2, score_fight/2,
	 score_ready/2, champion_guess/2, champion_fight/2,
	 champion_ready/2]).

-export([async_fun_combat_over/7, calc_bet_ratio/2,
	 cluster_cast/3]).

-export([gm_update_data/0]).

-export([gm_send_mail_2019_12_16/0, gm_update/0]).

-record(state, {ts = 0, timeout = 0, switch = open}).

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
      "on_mgr.erl",
      30).

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
      "on_mgr.erl",
      31).

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
      "on_mgr.erl",
      32).

-file("inc/cluster_dynamic_group.hrl", 1).

-record(cluster_dynamic_group,
	{id = {1, <<>>}, min_world_lev = 0, group_lev = 0,
	 mode = 1, list = [], srv_num = 0, time = 0}).

-record(cluster_dynamic_srv,
	{id = {1, <<>>}, name = <<>>, main_srv = <<>>,
	 list = [], mode = 1, group_lev = 0, init_world_lev = 0,
	 world_lev = 0, open_time = 0, time = 0}).

-record(cluster_dynamic_local_group,
	{type = 0, main, list = []}).

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_mgr.erl",
      33).

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
      "on_mgr.erl",
      34).

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
      "on_mgr.erl",
      35).

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
      "on_mgr.erl",
      36).

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
      "on_mgr.erl",
      37).

-file("inc/combat.hrl", 1).

-file("inc/common.hrl", 1).

-file("inc/combat.hrl", 13).

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
      "on_mgr.erl",
      38).

-file("inc/log.hrl", 1).

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_mgr.erl",
      39).

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

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_mgr.erl",
      40).

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
      "on_mgr.erl",
      41).

-file("inc/mail.hrl", 1).

-record(mail,
	{sess  :: {pos_integer(), bitstring()},
	 to  :: {pos_integer(), bitstring()},
	 to_name = <<>>  :: bitstring(),
	 from  :: {non_neg_integer(), bitstring()},
	 from_name = <<>>  :: bitstring(), type = 1  :: 0..1,
	 group_id = 0  :: non_neg_integer(), status = 0  :: 0..1,
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 source = <<>>  :: pos_integer(),
	 rev_ts = 0  :: pos_integer(),
	 read_time = 0  :: pos_integer(),
	 send_time = 0  :: pos_integer(),
	 time_out = 0  :: pos_integer(), can_del = 1  :: 0..1}).

-record(gmail,
	{id = 0, type = 0  :: non_neg_integer(),
	 mail_type = 1  :: non_neg_integer(),
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 conds = []  :: list(), source = <<>>  :: pos_integer(),
	 can_del = 1  :: 0..1}).

-record(feedback,
	{sess, rid, feedback_id = 0, status = 0, score = 0,
	 send_time = 0, time_out = 0}).

-record(role_feedback_info,
	{role_id, id = 0, state = 0, status2 = 0,
	 start_time = 0, end_msg_time = 0, finish_time = 0,
	 score_time = 0, title = <<>>, content = <<>>,
	 questions_lists = [], answer_lists = [], score = 0}).

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_mgr.erl",
      42).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/arena_peak_champion/arena_peak_champi"
      "on_mgr.erl",
      43).

gm_update() -> info(update_role_defense).

gm_send_mail_2019_12_16() ->
    L = sys_env:get(arena_peak_champione_old_data, []),
    Fun = fun (#arena_cluster_role{id = RoleId,
				   rank = Rank},
	       Acc) ->
		  Award = get_gm_mail_award(Rank),
		  {MailAssets, MailItems} =
		      format:split_assets_items(Award),
		  Content =
		      color:msg(lang:get(<<"Nhẫn Giả thân mến：\n     Khi Giải vô "
					   "địch đỉnh cao bắt đầu vào ngày 1/12, "
					   "do mạng biến động nên thông tin tham "
					   "gia của bạnThông tin không được đưa "
					   "tin kịp thời và bỏ lỡ vòng loại của "
					   "giải đấu đỉnh cao。\n    Tại đây, cô "
					   "trợ lý nhỏ bày tỏ lời chào chân thành "
					   "tới nhẫn giả.Xin lỗi, thứ hạng của Đấu "
					   "trường liên máy chủ lúc đó là ~ts, bây "
					   "giờ chúng tôi sẽ phát hành phần thưởng "
					   "đền bù。\n\n            Quy định bồi "
					   "thường cụ thể như sau：\n    [1-3 người] "
					   "Khung hình Avatar chiến binh đỉnh cao*1, "
					   "Đồng xu đỉnh cao*9000，金币*90w\n   【4-10名】巅峰勇者头"
					   "像框*1，巅峰币*7000，金币*70w\n  【11-100】巅峰币*6000，金币*6"
					   "0w\n   在今后的工作中小助手会更加谨慎、细心，做好风险预防措施，尽量避免这类问题给大"
					   "人带来的不良体验。\n   补偿奖励已随信附上，希望大人可以谅解并继续支持我们。"/utf8>>),
				[{string, {red, Rank}}]),
		  Mail =
		      {lang:get(<<"Phần thưởng đền bù vô địch đỉnh cao"/utf8>>),
		       Content, MailAssets, MailItems,
		       lang:get(<<"Phần thưởng đền bù vô địch đỉnh cao"/utf8>>)},
		  mail:send(RoleId, Mail),
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidarena_peak_champion_mgr58, _,
		     {__Levelarena_peak_champion_mgr58,
		      __Tracesarena_peak_champion_mgr58}}
			when __Levelarena_peak_champion_mgr58 band 64 /= 0
			       orelse __Tracesarena_peak_champion_mgr58 /= [] ->
			lager:do_log(info,
				     [{module, arena_peak_champion_mgr},
				      {function, gm_send_mail_2019_12_16},
				      {line, 58}, {pid, pid_to_list(self())},
				      {node, node()}
				      | lager:md()],
				     io_lib:format("巅峰冠军赛补偿奖励发放,id:~w, 排行:~w",
						   [RoleId, Rank]),
				     none, 4096, 64,
				     __Levelarena_peak_champion_mgr58,
				     __Tracesarena_peak_champion_mgr58,
				     lager_event,
				     __Pidarena_peak_champion_mgr58);
		    _ -> ok
		  end,
		  Acc
	  end,
    lists:foldl(Fun, [], L).

get_gm_mail_award(Rank)
    when Rank >= 1 andalso Rank =< 3 ->
    [{50026, 1}, {38, 9000}, {1, 900000}];
get_gm_mail_award(Rank)
    when Rank >= 4 andalso Rank =< 10 ->
    [{50027, 1}, {38, 7000}, {1, 700000}];
get_gm_mail_award(_Rank) -> [{38, 6000}, {1, 600000}].

gm_update_data() ->
    L = ets:tab2list(arena_peak_champion_role),
    Fun = fun (R = #arena_peak_champion_role{id = RoleId,
					     score = Score, rank = Rank},
	       Acc) ->
		  case Score of
		    undefined ->
			#champion_role_log{logs = Logs} =
			    arena_peak_champion_db:get_log(RoleId),
			Fun2 = fun (N, Sum) ->
				       case
					 arena_peak_champion_db:get_pk({RoleId,
									N})
					   of
					 {ok,
					  #peak_champion_pk{score =
								AddScore}} ->
					     Sum + AddScore;
					 _ -> Sum
				       end
			       end,
			AddScore = lists:foldl(Fun2, 0, Logs),
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
			  {__Pidarena_peak_champion_mgr80, _,
			   {__Levelarena_peak_champion_mgr80,
			    __Tracesarena_peak_champion_mgr80}}
			      when __Levelarena_peak_champion_mgr80 band 64 /= 0
				     orelse
				     __Tracesarena_peak_champion_mgr80 /= [] ->
			      lager:do_log(info,
					   [{module, arena_peak_champion_mgr},
					    {function, gm_update_data},
					    {line, 80},
					    {pid, pid_to_list(self())},
					    {node, node()}
					    | lager:md()],
					   io_lib:format("巅峰冠军赛修复积分显示异常:~w",
							 [{RoleId, Rank, Score,
							   AddScore}]),
					   none, 4096, 64,
					   __Levelarena_peak_champion_mgr80,
					   __Tracesarena_peak_champion_mgr80,
					   lager_event,
					   __Pidarena_peak_champion_mgr80);
			  _ -> ok
			end,
			case ets:lookup(arena_peak_champion_rank, Rank) of
			  [R2 = #arena_champion_rank{id = RoleId,
						     score = Score2}
			   | _]
			      when Score2 == undefined ->
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
				{__Pidarena_peak_champion_mgr83, _,
				 {__Levelarena_peak_champion_mgr83,
				  __Tracesarena_peak_champion_mgr83}}
				    when __Levelarena_peak_champion_mgr83 band
					   64
					   /= 0
					   orelse
					   __Tracesarena_peak_champion_mgr83 /=
					     [] ->
				    lager:do_log(info,
						 [{module,
						   arena_peak_champion_mgr},
						  {function, gm_update_data},
						  {line, 83},
						  {pid, pid_to_list(self())},
						  {node, node()}
						  | lager:md()],
						 io_lib:format("巅峰冠军赛修复积分显示异常,排名数据:~w",
							       [{RoleId, Rank,
								 Score,
								 AddScore}]),
						 none, 4096, 64,
						 __Levelarena_peak_champion_mgr83,
						 __Tracesarena_peak_champion_mgr83,
						 lager_event,
						 __Pidarena_peak_champion_mgr83);
				_ -> ok
			      end,
			      R3 = R2#arena_champion_rank{score = AddScore},
			      ets:insert(arena_peak_champion_rank, R3),
			      ok;
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
				{__Pidarena_peak_champion_mgr88, _,
				 {__Levelarena_peak_champion_mgr88,
				  __Tracesarena_peak_champion_mgr88}}
				    when __Levelarena_peak_champion_mgr88 band
					   64
					   /= 0
					   orelse
					   __Tracesarena_peak_champion_mgr88 /=
					     [] ->
				    lager:do_log(info,
						 [{module,
						   arena_peak_champion_mgr},
						  {function, gm_update_data},
						  {line, 88},
						  {pid, pid_to_list(self())},
						  {node, node()}
						  | lager:md()],
						 io_lib:format("巅峰冠军赛修复积分显示异常,排名数据异常:~w",
							       [{RoleId, Rank,
								 Score,
								 AddScore}]),
						 none, 4096, 64,
						 __Levelarena_peak_champion_mgr88,
						 __Tracesarena_peak_champion_mgr88,
						 lager_event,
						 __Pidarena_peak_champion_mgr88);
				_ -> ok
			      end,
			      ok
			end,
			NR = R#arena_peak_champion_role{score = AddScore},
			[NR | Acc];
		    _ -> Acc
		  end
	  end,
    L2 = lists:foldl(Fun, [], L),
    case L2 == [] of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr100, _,
	     {__Levelarena_peak_champion_mgr100,
	      __Tracesarena_peak_champion_mgr100}}
		when __Levelarena_peak_champion_mgr100 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr100 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, gm_update_data}, {line, 100},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("巅峰冠军赛修复积分显示异常， 无异常:~w", [L2]), none,
			     4096, 64, __Levelarena_peak_champion_mgr100,
			     __Tracesarena_peak_champion_mgr100, lager_event,
			     __Pidarena_peak_champion_mgr100);
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
	    {__Pidarena_peak_champion_mgr102, _,
	     {__Levelarena_peak_champion_mgr102,
	      __Tracesarena_peak_champion_mgr102}}
		when __Levelarena_peak_champion_mgr102 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr102 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, gm_update_data}, {line, 102},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("巅峰冠军赛修复积分显示异常， 修复数量:~w",
					   [length(L2)]),
			     none, 4096, 64, __Levelarena_peak_champion_mgr102,
			     __Tracesarena_peak_champion_mgr102, lager_event,
			     __Pidarena_peak_champion_mgr102);
	    _ -> ok
	  end,
	  ets:insert(arena_peak_champion_role, L2),
	  dets:insert(arena_peak_champion_role, L2)
    end,
    ok.

cluster_cast(M, F, A) ->
    SrvList = arena_peak_champion_db:get_ext(zone_all_srvs,
					     []),
    [cluster_lib:cast(Sid, M, F, A) || Sid <- SrvList].

-spec calc_bet_ratio(non_neg_integer(),
		     non_neg_integer()) -> non_neg_integer().

calc_bet_ratio(Val, Val) -> 1750;
calc_bet_ratio(Val1, Val2) when Val1 > Val2 ->
    round((2 - Val1 / (Val1 + Val2) * 4.8999999999999999e-1)
	    * 1000);
calc_bet_ratio(Val1, Val2) ->
    round((1.51 + Val2 / (Val1 + Val2) * 5.0e-1) * 1000).

-spec m() -> ok.

m() ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr125, _,
       {__Levelarena_peak_champion_mgr125,
	__Tracesarena_peak_champion_mgr125}}
	  when __Levelarena_peak_champion_mgr125 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr125 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr}, {function, m},
			{line, 125}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "有人输入了下阶段", none, 4096, 64,
		       __Levelarena_peak_champion_mgr125,
		       __Tracesarena_peak_champion_mgr125, lager_event,
		       __Pidarena_peak_champion_mgr125);
      _ -> ok
    end,
    gen_fsm:send_event(arena_peak_champion_mgr, timeout).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> arena_peak_champion_mgr ! Info.

cast(Event) ->
    gen_fsm:send_all_state_event(arena_peak_champion_mgr,
				 Event).

call(Event) ->
    case catch
	   gen_fsm:sync_send_all_state_event(arena_peak_champion_mgr,
					     Event, 10000)
	of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr146, _,
	     {__Levelarena_peak_champion_mgr146,
	      __Tracesarena_peak_champion_mgr146}}
		when __Levelarena_peak_champion_mgr146 band 8 /= 0
		       orelse __Tracesarena_peak_champion_mgr146 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_mgr},
			      {function, call}, {line, 146},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [arena_peak_champion_mgr, Event,
					    10000, erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelarena_peak_champion_mgr146,
			     __Tracesarena_peak_champion_mgr146, lager_event,
			     __Pidarena_peak_champion_mgr146);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end.

start_link() ->
    gen_fsm:start_link({local, arena_peak_champion_mgr},
		       arena_peak_champion_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr152, _,
       {__Levelarena_peak_champion_mgr152,
	__Tracesarena_peak_champion_mgr152}}
	  when __Levelarena_peak_champion_mgr152 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr152 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr}, {function, init},
			{line, 152}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动", none, 4096, 64,
		       __Levelarena_peak_champion_mgr152,
		       __Tracesarena_peak_champion_mgr152, lager_event,
		       __Pidarena_peak_champion_mgr152);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(arena_peak_champion_old_info,
			"dets/arena_peak_champion_old_info.dets", 1, set),
    d_ets_lib:load_dets_to_ets(arena_peak_champion_old_info,
			       undefined),
    d_ets_lib:new_ets(arena_peak_champion_main_id, 1, set),
    d_ets_lib:new_ets(arena_peak_champion_zone_info, 1,
		      set),
    d_ets_lib:new_d_ets(arena_peak_champion_replay,
			"dets/arena_peak_champion_replay.dets", 1, set),
    d_ets_lib:load_dets_to_ets(arena_peak_champion_replay,
			       undefined),
    d_ets_lib:new_d_ets(arena_peak_champion_bet,
			"dets/arena_peak_champion_bet.dets", #champion_bet.id,
			set),
    d_ets_lib:load_dets_to_ets(arena_peak_champion_bet,
			       undefined),
    d_ets_lib:new_d_ets(arena_peak_champion_ext,
			"dets/arena_peak_champion_ext.dets", 1, set),
    d_ets_lib:load_dets_to_ets(arena_peak_champion_ext,
			       undefined),
    d_ets_lib:new_d_ets(arena_peak_champion_result,
			"dets/arena_peak_champion_result.dets",
			#champion_result.id, set),
    d_ets_lib:load_dets_to_ets(arena_peak_champion_result,
			       undefined),
    d_ets_lib:new_d_ets(arena_peak_champion_pk,
			"dets/arena_peak_champion_pk.dets",
			#peak_champion_pk.id, set),
    arena_peak_champion_ver:do_init_peak_champion_pk(arena_peak_champion_pk),
    d_ets_lib:new_d_ets(arena_peak_champion_role_log,
			"dets/arena_peak_champion_role_log.dets",
			#champion_role_log.id, set),
    d_ets_lib:load_dets_to_ets(arena_peak_champion_role_log,
			       undefined),
    d_ets_lib:new_d_ets(arena_peak_champion_role,
			"dets/arena_peak_champion_role.dets",
			#arena_peak_champion_role.id, set),
    arena_peak_champion_ver:do_init_peak_champion_role(arena_peak_champion_role),
    d_ets_lib:new_ets(arena_peak_champion_rank,
		      #arena_champion_rank.rank, set),
    ets:foldl(fun (#arena_peak_champion_role{id = Id,
					     rank = Rank, old_rank = OldRank,
					     score = Score, score_32 = Score32},
		   _) ->
		      ets:insert(arena_peak_champion_rank,
				 #arena_champion_rank{rank = Rank,
						      old_rank = OldRank,
						      id = Id, score = Score,
						      score_32 = Score32})
	      end,
	      0, arena_peak_champion_role),
    d_ets_lib:new_ets(arena_peak_champion_old_rank, 1, set),
    GuessInfo = {_Group, _Pos, Id, _} =
		    arena_peak_champion_db:get_ext(guess_info,
						   {0, 0, 0, {0, <<>>}}),
    RoleId = arena_peak_champion_db:get_ext(guess_roleid,
					    {0, <<>>}),
    GuessABet = arena_peak_champion_db:get_ext(guess_a_bet,
					       0),
    GuessBBet = arena_peak_champion_db:get_ext(guess_b_bet,
					       0),
    GuessList = arena_peak_champion_db:get_ext(guess_list,
					       []),
    put(guess_roleid, RoleId),
    put(guess_id, Id),
    put(guess_info, GuessInfo),
    put(guess_a_bet, GuessABet),
    put(guess_b_bet, GuessBBet),
    put(guess_list, GuessList),
    util:set_timer(update_role_defense,
		   date:next_diff({5, 30, 0}), update_role_defense),
    util:set_timer(six_reset_time,
		   date:next_diff({6, 0, 0}), six_reset_time),
    Ms = date:unixtime(ms),
    {StateName, State} = init_state(Ms),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr215, _,
       {__Levelarena_peak_champion_mgr215,
	__Tracesarena_peak_champion_mgr215}}
	  when __Levelarena_peak_champion_mgr215 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr215 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr}, {function, init},
			{line, 215}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "启动完成", none, 4096, 64,
		       __Levelarena_peak_champion_mgr215,
		       __Tracesarena_peak_champion_mgr215, lager_event,
		       __Pidarena_peak_champion_mgr215);
      _ -> ok
    end,
    {ok, StateName, State,
     max(1, State#champion_state.state_end_time - Ms)}.

init_state(Ms) ->
    StateInfo =
	arena_peak_champion_db:get_ext(arena_champion_state,
				       #{}),
    Now = date:unixtime(),
    {Week, H, M} =
	arena_peak_champion_data:get_constant(season_start),
    TimeOut = date:week_next_diff([Week], {H, M, 0}),
    State = #champion_state{season_start_time =
				maps:get(season_start_time, StateInfo,
					 Now + TimeOut),
			    season_end_time =
				maps:get(season_end_time, StateInfo,
					 Now + TimeOut +
					   86400 *
					     arena_peak_champion_data:get_constant(open_time)),
			    state_start_time =
				maps:get(state_start_time, StateInfo, Ms),
			    state_end_time =
				maps:get(state_end_time, StateInfo,
					 Ms + 864000000),
			    step = maps:get(step, StateInfo, 0),
			    step_status = maps:get(step_status, StateInfo, 0),
			    step_status_time =
				maps:get(step_status_time, StateInfo, 0),
			    round = maps:get(round, StateInfo, 0),
			    round_status =
				maps:get(round_status, StateInfo, 0)},
    StateName = maps:get(state_name, StateInfo, idle),
    if StateName == champion_guess;
       StateName == score_guess ->
	   util:set_timer(do_open_ico,
			  max(10, date:next_diff({20, 0, 0})), open_ico),
	   util:set_timer(do_notice, date:next_diff({20, 25, 0}),
			  {notify_state, 3});
       StateName == champion_ready; StateName == score_ready ->
	   [];
       true -> skip
    end,
    {StateName, State}.

save_state(StateName,
	   #champion_state{state_start_time = StateStartTime,
			   state_end_time = StateEndTime,
			   season_start_time = SeasonStartTime,
			   season_end_time = SeasonEndTime, step = Step,
			   step_status = StepStatus,
			   step_status_time = StepStatusTime, round = Round,
			   round_status = RoundStatus}) ->
    d_ets_lib:save_d_ets(arena_peak_champion_ext,
			 {arena_champion_state,
			  #{season_start_time => SeasonStartTime,
			    season_end_time => SeasonEndTime,
			    state_name => StateName,
			    state_start_time => StateStartTime,
			    state_end_time => StateEndTime, step => Step,
			    step_status => StepStatus,
			    step_status_time => StepStatusTime, round => Round,
			    round_status => RoundStatus}}).

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(Request, From, StateName, State) ->
    case catch do_handle_sync_event(Request, From,
				    StateName, State)
	of
      {reply, Reply, NewStateName, NewState} ->
	  continue(NewStateName, Reply, NewState);
      _Reason ->
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    arena_peak_champion_mgr, 260, _Reason}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr261, _,
	     {__Levelarena_peak_champion_mgr261,
	      __Tracesarena_peak_champion_mgr261}}
		when __Levelarena_peak_champion_mgr261 band 8 /= 0
		       orelse __Tracesarena_peak_champion_mgr261 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_mgr},
			      {function, handle_sync_event}, {line, 261},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [Request, StateName, _Reason]),
			     none, 4096, 8, __Levelarena_peak_champion_mgr261,
			     __Tracesarena_peak_champion_mgr261, lager_event,
			     __Pidarena_peak_champion_mgr261);
	    _ -> ok
	  end,
	  continue(StateName,
		   {false, lang:get(<<"Lỗi thực thi"/utf8>>)}, State)
    end.

handle_info({switch, S}, StateName, State)
    when S =:= open orelse S =:= close ->
    continue(StateName, State#state{switch = S});
handle_info(Info, StateName, State) ->
    case catch do_handle_info(Info, StateName, State) of
      {noreply, NewStateName, NewState} ->
	  continue(NewStateName, NewState);
      _Reason ->
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    arena_peak_champion_mgr, 274, _Reason}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr275, _,
	     {__Levelarena_peak_champion_mgr275,
	      __Tracesarena_peak_champion_mgr275}}
		when __Levelarena_peak_champion_mgr275 band 8 /= 0
		       orelse __Tracesarena_peak_champion_mgr275 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_mgr},
			      {function, handle_info}, {line, 275},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [Info, StateName, _Reason]),
			     none, 4096, 8, __Levelarena_peak_champion_mgr275,
			     __Tracesarena_peak_champion_mgr275, lager_event,
			     __Pidarena_peak_champion_mgr275);
	    _ -> ok
	  end,
	  continue(StateName, State)
    end.

terminate(_Reason, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr280, _,
       {__Levelarena_peak_champion_mgr280,
	__Tracesarena_peak_champion_mgr280}}
	  when __Levelarena_peak_champion_mgr280 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr280 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, terminate}, {line, 280},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始关闭", none, 4096, 64,
		       __Levelarena_peak_champion_mgr280,
		       __Tracesarena_peak_champion_mgr280, lager_event,
		       __Pidarena_peak_champion_mgr280);
      _ -> ok
    end,
    save_state(StateName, State),
    dets:insert(arena_peak_champion_role_log,
		ets:tab2list(arena_peak_champion_role_log)),
    dets:insert(arena_peak_champion_replay,
		ets:tab2list(arena_peak_champion_replay)),
    dets:insert(arena_peak_champion_bet,
		ets:tab2list(arena_peak_champion_bet)),
    dets:insert(arena_peak_champion_ext,
		ets:tab2list(arena_peak_champion_ext)),
    dets:insert(arena_peak_champion_result,
		ets:tab2list(arena_peak_champion_result)),
    dets:insert(arena_peak_champion_pk,
		ets:tab2list(arena_peak_champion_pk)),
    dets:insert(arena_peak_champion_role,
		ets:tab2list(arena_peak_champion_role)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr289, _,
       {__Levelarena_peak_champion_mgr289,
	__Tracesarena_peak_champion_mgr289}}
	  when __Levelarena_peak_champion_mgr289 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr289 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, terminate}, {line, 289},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64,
		       __Levelarena_peak_champion_mgr289,
		       __Tracesarena_peak_champion_mgr289, lager_event,
		       __Pidarena_peak_champion_mgr289);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

do_handle_sync_event(_Request, _From, StateName,
		     State) ->
    {reply, ok, StateName, State}.

do_handle_info(gm_update_time, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr300, _,
       {__Levelarena_peak_champion_mgr300,
	__Tracesarena_peak_champion_mgr300}}
	  when __Levelarena_peak_champion_mgr300 band 128 /= 0
		 orelse __Tracesarena_peak_champion_mgr300 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_peak_champion_mgr},
			{function, do_handle_info}, {line, 300},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("巅峰冠军赛保存重要数据:~w", [State]), none, 4096,
		       128, __Levelarena_peak_champion_mgr300,
		       __Tracesarena_peak_champion_mgr300, lager_event,
		       __Pidarena_peak_champion_mgr300);
      _ -> ok
    end,
    Now = date:unixtime(),
    {Week, H, M} =
	arena_peak_champion_data:get_constant(season_start),
    TimeOut = date:week_next_diff([Week], {H, M, 0}),
    NState = State#champion_state{season_start_time =
				      Now + TimeOut,
				  season_end_time =
				      Now + TimeOut +
					86400 *
					  arena_peak_champion_data:get_constant(open_time)},
    {noreply, StateName, NState};
do_handle_info(six_reset_time, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr312, _,
       {__Levelarena_peak_champion_mgr312,
	__Tracesarena_peak_champion_mgr312}}
	  when __Levelarena_peak_champion_mgr312 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr312 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_handle_info}, {line, 312},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("6点重置红点数据:~w", [State]), none, 4096, 64,
		       __Levelarena_peak_champion_mgr312,
		       __Tracesarena_peak_champion_mgr312, lager_event,
		       __Pidarena_peak_champion_mgr312);
      _ -> ok
    end,
    role_group:apply(world,
		     {arena_peak_champion, reset_point, []}),
    {noreply, StateName, State};
do_handle_info(open_ico, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr318, _,
       {__Levelarena_peak_champion_mgr318,
	__Tracesarena_peak_champion_mgr318}}
	  when __Levelarena_peak_champion_mgr318 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr318 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_handle_info}, {line, 318},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("广播开启图标:~w", [State]), none, 4096, 64,
		       __Levelarena_peak_champion_mgr318,
		       __Tracesarena_peak_champion_mgr318, lager_event,
		       __Pidarena_peak_champion_mgr318);
      _ -> ok
    end,
    cluster_cast(arena_peak_champion_mgr, info,
		 [do_open_ico]),
    {noreply, StateName, State};
do_handle_info(do_open_ico, StateName, State) ->
    WorldLev = world_lev:get_world_lev(),
    LimitWorldLev =
	arena_peak_champion_data:get_constant(open_world_lev_limit),
    case WorldLev >= LimitWorldLev of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr326, _,
	     {__Levelarena_peak_champion_mgr326,
	      __Tracesarena_peak_champion_mgr326}}
		when __Levelarena_peak_champion_mgr326 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr326 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, do_handle_info}, {line, 326},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("收到广播开启图标:~w", [State]), none, 4096,
			     64, __Levelarena_peak_champion_mgr326,
			     __Tracesarena_peak_champion_mgr326, lager_event,
			     __Pidarena_peak_champion_mgr326);
	    _ -> ok
	  end,
	  Now = date:unixtime(),
	  TimeOut = date:next_diff({21, 0, 0}),
	  activity_global:set_and_push(26, 1, [Now + TimeOut]),
	  util:set_timer(do_close_ico, TimeOut, close_ico);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr332, _,
	     {__Levelarena_peak_champion_mgr332,
	      __Tracesarena_peak_champion_mgr332}}
		when __Levelarena_peak_champion_mgr332 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr332 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, do_handle_info}, {line, 332},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("收到广播开启图标,但是世界等级不足:~w",
					   [{WorldLev, State}]),
			     none, 4096, 64, __Levelarena_peak_champion_mgr332,
			     __Tracesarena_peak_champion_mgr332, lager_event,
			     __Pidarena_peak_champion_mgr332);
	    _ -> ok
	  end,
	  skip
    end,
    {noreply, StateName, State};
do_handle_info(close_ico, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr337, _,
       {__Levelarena_peak_champion_mgr337,
	__Tracesarena_peak_champion_mgr337}}
	  when __Levelarena_peak_champion_mgr337 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr337 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_handle_info}, {line, 337},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("收到广播开启图标:~w", [State]), none, 4096, 64,
		       __Levelarena_peak_champion_mgr337,
		       __Tracesarena_peak_champion_mgr337, lager_event,
		       __Pidarena_peak_champion_mgr337);
      _ -> ok
    end,
    activity_global:set_and_push(26, 0, [0]),
    {noreply, StateName, State};
do_handle_info({merge_move_finish, NewMainSrvId},
	       _StateName, _State) ->
    ets:foldl(fun (#arena_peak_champion_role{id = Id,
					     rank = Rank, old_rank = OldRank,
					     score = Score, score_32 = Score32},
		   _) ->
		      ets:insert(arena_peak_champion_rank,
				 #arena_champion_rank{rank = Rank,
						      old_rank = OldRank,
						      id = Id, score = Score,
						      score_32 = Score32})
	      end,
	      0, arena_peak_champion_role),
    GuessInfo = {_Group, _Pos, Id, _} =
		    arena_peak_champion_db:get_ext(guess_info,
						   {0, 0, 0, {0, <<>>}}),
    RoleId = arena_peak_champion_db:get_ext(guess_roleid,
					    {0, <<>>}),
    GuessABet = arena_peak_champion_db:get_ext(guess_a_bet,
					       0),
    GuessBBet = arena_peak_champion_db:get_ext(guess_b_bet,
					       0),
    GuessList = arena_peak_champion_db:get_ext(guess_list,
					       []),
    put(guess_roleid, RoleId),
    put(guess_id, Id),
    put(guess_info, GuessInfo),
    put(guess_a_bet, GuessABet),
    put(guess_b_bet, GuessBBet),
    put(guess_list, GuessList),
    util:set_timer(update_role_defense,
		   date:next_diff({5, 30, 0}), update_role_defense),
    cluster_cast(arena_peak_champion_mgr, info,
		 [cluster_ready]),
    Ms = date:unixtime(ms),
    {NewSStateName, NewState} = init_state(Ms),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr368, _,
       {__Levelarena_peak_champion_mgr368,
	__Tracesarena_peak_champion_mgr368}}
	  when __Levelarena_peak_champion_mgr368 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr368 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_handle_info}, {line, 368},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "新主服合服数据完成", none, 4096, 64,
		       __Levelarena_peak_champion_mgr368,
		       __Tracesarena_peak_champion_mgr368, lager_event,
		       __Pidarena_peak_champion_mgr368);
      _ -> ok
    end,
    {noreply, NewSStateName, NewState};
do_handle_info({move_to_new_main, NewMainSrvId},
	       _StateName, State) ->
    move_ets_to_new_main(arena_peak_champion_replay,
			 NewMainSrvId),
    move_ets_to_new_main(arena_peak_champion_ext,
			 NewMainSrvId),
    move_ets_to_new_main(arena_peak_champion_bet,
			 NewMainSrvId),
    move_ets_to_new_main(arena_peak_champion_pk,
			 NewMainSrvId),
    move_ets_to_new_main(arena_peak_champion_role_log,
			 NewMainSrvId),
    move_ets_to_new_main(arena_peak_champion_role,
			 NewMainSrvId),
    move_ets_to_new_main(arena_peak_champion_result,
			 NewMainSrvId),
    cluster_lib:cast(NewMainSrvId, arena_peak_champion_mgr,
		     info, [{merge_move_finish, NewMainSrvId}]),
    util:unset_timer(update_role_defense),
    Timeout =
	date:next_diff(arena_peak_champion_data:get_constant(time_score_fight)),
    NewState = set_state_timeout(State#champion_state{round
							  = 0,
						      round_status = 0,
						      step_status = 0,
						      step = 0},
				 Timeout * 1000),
    save_state(idle, NewState),
    {noreply, idle, NewState};
do_handle_info({sync_peak_local_hallows_look, RoleId,
		Rank, EndTime},
	       StateName, State) ->
    Now = date:unixtime(),
    List0 = sys_env:get(arena_peak_champion_hallows_look,
			[]),
    List1 = [T
	     || T = {_, _, EndTime0} <- List0, EndTime0 > Now],
    List = lists:keystore(RoleId, 1, List1,
			  {RoleId, Rank, EndTime}),
    sys_env:save(arena_peak_champion_hallows_look, List),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr417, _,
       {__Levelarena_peak_champion_mgr417,
	__Tracesarena_peak_champion_mgr417}}
	  when __Levelarena_peak_champion_mgr417 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr417 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_handle_info}, {line, 417},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("巅峰冠军赛神器幻化数据变化前 ~w 变化后 ~w",
				     [List0, List]),
		       none, 4096, 64, __Levelarena_peak_champion_mgr417,
		       __Tracesarena_peak_champion_mgr417, lager_event,
		       __Pidarena_peak_champion_mgr417);
      _ -> ok
    end,
    role_lib:cast(by_id, RoleId,
		  {hallows_look, arena_peak_champion_activate, []}),
    {noreply, StateName, State};
do_handle_info(save_data, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr423, _,
       {__Levelarena_peak_champion_mgr423,
	__Tracesarena_peak_champion_mgr423}}
	  when __Levelarena_peak_champion_mgr423 band 128 /= 0
		 orelse __Tracesarena_peak_champion_mgr423 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_peak_champion_mgr},
			{function, do_handle_info}, {line, 423},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("巅峰冠军赛保存重要数据:~w", [State]), none, 4096,
		       128, __Levelarena_peak_champion_mgr423,
		       __Tracesarena_peak_champion_mgr423, lager_event,
		       __Pidarena_peak_champion_mgr423);
      _ -> ok
    end,
    dets:insert(arena_peak_champion_pk,
		ets:tab2list(arena_peak_champion_pk)),
    dets:insert(arena_peak_champion_role,
		ets:tab2list(arena_peak_champion_role)),
    {noreply, StateName, State};
do_handle_info(cluster_ready, StateName, State) ->
    SrvId = sys_lib:srv_id(),
    AllSrvs = lists:usort([SrvId | lists:delete(SrvId,
						sys_lib:srv_full_id())]),
    cluster_lib:cast(center, c_arena_peak_champion_mgr,
		     info,
		     [{update_all_period_info, SrvId, AllSrvs, self()}]),
    {noreply, StateName, State};
do_handle_info({update_all_period_info, L, ZoneInfo,
		MainIds, SrvLists},
	       StateName, State) ->
    sys_env:save(arena_peak_champion_period, L),
    ets:insert(arena_peak_champion_main_id, MainIds),
    ets:insert(arena_peak_champion_zone_info, ZoneInfo),
    d_ets_lib:save_d_ets(arena_peak_champion_ext,
			 {zone_all_srvs, SrvLists}),
    {noreply, StateName, State};
do_handle_info(sys_old_rank, StateName, State) ->
    case arena_peak_champion_db:list_rank2(10) of
      Ranks = [_ | _] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr444, _,
	     {__Levelarena_peak_champion_mgr444,
	      __Tracesarena_peak_champion_mgr444}}
		when __Levelarena_peak_champion_mgr444 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr444 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, do_handle_info}, {line, 444},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("本服前10名:~w", [Ranks]), none, 4096,
			     64, __Levelarena_peak_champion_mgr444,
			     __Tracesarena_peak_champion_mgr444, lager_event,
			     __Pidarena_peak_champion_mgr444);
	    _ -> ok
	  end,
	  cluster_lib:cast(center, c_arena_peak_champion_mgr,
			   info, [{sys_rank_data, sys_lib:srv_id(), Ranks}]);
      _ -> skip
    end,
    {noreply, StateName, State};
do_handle_info({synv_srv_join, Sid}, StateName,
	       State) ->
    SrvList = arena_peak_champion_db:get_ext(zone_all_srvs,
					     []),
    d_ets_lib:save_d_ets(arena_peak_champion_ext,
			 {zone_all_srvs, [Sid | lists:delete(Sid, SrvList)]}),
    {noreply, StateName, State};
do_handle_info(update_zone_info, StateName, State) ->
    SrvId = sys_lib:srv_id(),
    MergeSrvs = sys_lib:srv_full_id(),
    WorldLev = world_lev:get_world_lev(),
    OPenTime = sys_env:get(open_timestamp),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr465, _,
       {__Levelarena_peak_champion_mgr465,
	__Tracesarena_peak_champion_mgr465}}
	  when __Levelarena_peak_champion_mgr465 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr465 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_handle_info}, {line, 465},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("===同步游戏服活跃人数~w",
				     [{SrvId, WorldLev, OPenTime, MergeSrvs}]),
		       none, 4096, 64, __Levelarena_peak_champion_mgr465,
		       __Tracesarena_peak_champion_mgr465, lager_event,
		       __Pidarena_peak_champion_mgr465);
      _ -> ok
    end,
    cluster_lib:cast(center, c_arena_peak_champion_mgr,
		     info,
		     [{update_zone_info,
		       {SrvId, WorldLev, OPenTime, MergeSrvs}}]),
    case sys_env:get(arena_cluster_info) of
      #{is_main := 1} ->
	  GroupSrvs = case cluster_dynamic_group:get_group(1) of
			{true, #cluster_dynamic_local_group{list = List}} ->
			    List;
			_ -> [SrvId]
		      end,
	  RankList = sys_env:get(arena_peak_champione_data, []),
	  cluster_lib:cast(center, c_arena_peak_champion_mgr,
			   info,
			   [{update_zone_group_info,
			     {SrvId, GroupSrvs, length(RankList)}}]);
      _ -> skip
    end,
    {noreply, StateName, State};
do_handle_info({{synv_period_info, check_close}},
	       StateName, State) ->
    [combat_replay_mgr:dec_replay_reference(ReplayId)
     || {ReplayId}
	    <- ets:tab2list(arena_peak_champion_replay)],
    d_ets_lib:clear_d_ets(arena_peak_champion_replay),
    [d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			   {champion_256, Group})
     || Group <- lists:seq(1, 16)],
    [d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			   {champion_64, Group})
     || Group <- lists:seq(1, 8)],
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  champion_4),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  zone_all_srvs),
    d_ets_lib:clear_d_ets(arena_peak_champion_bet),
    d_ets_lib:clear_d_ets(arena_peak_champion_pk),
    d_ets_lib:clear_d_ets(arena_peak_champion_role_log),
    d_ets_lib:clear_d_ets(arena_peak_champion_role),
    ets:delete_all_objects(arena_peak_champion_rank),
    ets:delete_all_objects(arena_peak_champion_main_id),
    ets:delete_all_objects(arena_peak_champion_zone_info),
    erase(guess_roleid),
    erase(guess_id),
    erase(guess_info),
    erase(guess_a_bet),
    erase(guess_b_bet),
    erase(guess_list),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_roleid),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_id),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_info),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_a_bet),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_b_bet),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_list),
    {noreply, StateName, State};
do_handle_info({synv_period_info, Period, MaxZoneId,
		MainInfo},
	       StateName, State) ->
    L = sys_env:get(arena_peak_champion_period, []),
    sys_env:save(arena_peak_champion_period,
		 lists:keystore(Period, 1, L, {Period, MaxZoneId})),
    [combat_replay_mgr:dec_replay_reference(ReplayId)
     || {ReplayId}
	    <- ets:tab2list(arena_peak_champion_replay)],
    d_ets_lib:clear_d_ets(arena_peak_champion_replay),
    [d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			   {champion_256, Group})
     || Group <- lists:seq(1, 16)],
    [d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			   {champion_64, Group})
     || Group <- lists:seq(1, 8)],
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  champion_4),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  zone_all_srvs),
    d_ets_lib:clear_d_ets(arena_peak_champion_role),
    d_ets_lib:clear_d_ets(arena_peak_champion_bet),
    d_ets_lib:clear_d_ets(arena_peak_champion_pk),
    d_ets_lib:clear_d_ets(arena_peak_champion_role_log),
    ets:delete_all_objects(arena_peak_champion_rank),
    ets:delete_all_objects(arena_peak_champion_main_id),
    ets:delete_all_objects(arena_peak_champion_zone_info),
    erase(guess_roleid),
    erase(guess_id),
    erase(guess_info),
    erase(guess_a_bet),
    erase(guess_b_bet),
    erase(guess_list),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_roleid),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_id),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_info),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_a_bet),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_b_bet),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_list),
    ets:insert(arena_peak_champion_main_id, MainInfo),
    info(cluster_ready),
    case lists:keyfind(sys_lib:srv_id(), 2, MainInfo) of
      {_, _} ->
	  cluster_lib:cast(center, c_arena_peak_champion_mgr,
			   info, [{synv_zone_info, sys_lib:srv_id()}]);
      _ -> skip
    end,
    {noreply, StateName, State};
do_handle_info({synv_zone_info, Period,
		#c_arena_zone_info{zone_id = ZoneId, main_id = MainId,
				   main_list = MainList, srv_lists = SrvLists}},
	       StateName, State) ->
    case sys_lib:srv_id() == MainId andalso
	   StateName == idle
	of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr565, _,
	     {__Levelarena_peak_champion_mgr565,
	      __Tracesarena_peak_champion_mgr565}}
		when __Levelarena_peak_champion_mgr565 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr565 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, do_handle_info}, {line, 565},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("巅峰冠军赛今天开始,距离开启时间, 正在准备数据~w",
					   [{Period, ZoneId}]),
			     none, 4096, 64, __Levelarena_peak_champion_mgr565,
			     __Tracesarena_peak_champion_mgr565, lager_event,
			     __Pidarena_peak_champion_mgr565);
	    _ -> ok
	  end,
	  extract_join_role(MainList, SrvLists);
      _ -> skip
    end,
    {noreply, StateName, State};
do_handle_info(gm_close, StateName, State) ->
    [combat_replay_mgr:dec_replay_reference(ReplayId)
     || {ReplayId}
	    <- ets:tab2list(arena_peak_champion_replay)],
    d_ets_lib:clear_d_ets(arena_peak_champion_replay),
    [d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			   {champion_256, Group})
     || Group <- lists:seq(1, 16)],
    [d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			   {champion_64, Group})
     || Group <- lists:seq(1, 8)],
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  champion_4),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  zone_all_srvs),
    d_ets_lib:clear_d_ets(arena_peak_champion_bet),
    d_ets_lib:clear_d_ets(arena_peak_champion_pk),
    d_ets_lib:clear_d_ets(arena_peak_champion_role_log),
    d_ets_lib:clear_d_ets(arena_peak_champion_role),
    ets:delete_all_objects(arena_peak_champion_rank),
    ets:delete_all_objects(arena_peak_champion_main_id),
    ets:delete_all_objects(arena_peak_champion_zone_info),
    erase(guess_roleid),
    erase(guess_id),
    erase(guess_info),
    erase(guess_a_bet),
    erase(guess_b_bet),
    erase(guess_list),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_roleid),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_id),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_info),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_a_bet),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_b_bet),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_list),
    save_state(idle, State),
    {noreply, idle, State};
do_handle_info(gm_re_ready, StateName, State) ->
    [combat_replay_mgr:dec_replay_reference(ReplayId)
     || {ReplayId}
	    <- ets:tab2list(arena_peak_champion_replay)],
    d_ets_lib:clear_d_ets(arena_peak_champion_replay),
    [d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			   {champion_256, Group})
     || Group <- lists:seq(1, 16)],
    [d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			   {champion_64, Group})
     || Group <- lists:seq(1, 8)],
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  champion_4),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  zone_all_srvs),
    d_ets_lib:clear_d_ets(arena_peak_champion_bet),
    d_ets_lib:clear_d_ets(arena_peak_champion_pk),
    d_ets_lib:clear_d_ets(arena_peak_champion_role_log),
    d_ets_lib:clear_d_ets(arena_peak_champion_role),
    ets:delete_all_objects(arena_peak_champion_rank),
    ets:delete_all_objects(arena_peak_champion_main_id),
    ets:delete_all_objects(arena_peak_champion_zone_info),
    erase(guess_roleid),
    erase(guess_id),
    erase(guess_info),
    erase(guess_a_bet),
    erase(guess_b_bet),
    erase(guess_list),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_roleid),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_id),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_info),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_a_bet),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_b_bet),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_list),
    extract_join_role([sys_lib:srv_id()],
		      [sys_lib:srv_id()]),
    save_state(idle, State),
    {noreply, idle, State};
do_handle_info(open, StateName, State) ->
    case StateName == idle of
      true ->
	  Now = date:unixtime(),
	  Timeout =
	      date:next_diff(arena_peak_champion_data:get_constant(time_score_fight)),
	  util:set_timer(do_notice, max(1, Timeout - 60 * 5),
			 {notify_state, 3}),
	  util:set_timer(do_open_ico,
			 max(10, date:next_diff({20, 0, 0})), open_ico),
	  NewState = set_state_timeout(State#champion_state{round
								= 1,
							    round_status = 2,
							    step = 1,
							    step_status = 1,
							    step_status_time =
								Now + Timeout,
							    season_start_time =
								Now,
							    season_end_time =
								Now +
								  86400 *
								    arena_peak_champion_data:get_constant(open_time)},
				       Timeout * 1000),
	  arena_peak_champion_lib:score_match(NewState, init),
	  select_guess(NewState),
	  save_state(score_guess, NewState),
	  self() ! {notify_state, 1},
	  cluster_cast(arena_peak_champion_mgr, info,
		       [send_open_mail]),
	  say_subtitle:clear(103),
	  {noreply, score_guess, NewState};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr665, _,
	     {__Levelarena_peak_champion_mgr665,
	      __Tracesarena_peak_champion_mgr665}}
		when __Levelarena_peak_champion_mgr665 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr665 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, do_handle_info}, {line, 665},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("巅峰冠军赛今天开始,距离开启时间, 赛区主服数据不同步，注意查看",
					   []),
			     none, 4096, 64, __Levelarena_peak_champion_mgr665,
			     __Tracesarena_peak_champion_mgr665, lager_event,
			     __Pidarena_peak_champion_mgr665);
	    _ -> ok
	  end,
	  {noreply, StateName, State}
    end;
do_handle_info(send_merge_open_mail, StateName,
	       State) ->
    WorldLev = world_lev:get_world_lev(),
    LimitWorldLev =
	arena_peak_champion_data:get_constant(open_world_lev_limit),
    case WorldLev >= LimitWorldLev of
      true ->
	  Now = date:unixtime(),
	  {{_Y, _Month, Day}, {_Hour, _Minu, _}} =
	      date:seconds_to_datetime(Now),
	  LimitLev =
	      arena_peak_champion_data:get_constant(open_lev_limit),
	  Subject =
	      lang:get(<<"Thông báo khai mạc giải vô địch đỉnh "
			 "cao"/utf8>>),
	  Content =
	      lang:get(<<"Gửi các Nhẫn Giả: \n Lối vào [Giải vô "
			 "địch đỉnh cao] đã được mở lại! Chào "
			 "mừng bạn tiếp tục tham gia"/utf8>>),
	  mail:global_send(#gmail{id =
				      {arena_peak_champion_merge_open_mail,
				       Day},
				  end_time = Now + 86400 * 1, subject = Subject,
				  content = Content,
				  conds = [{minlev, LimitLev}]}),
	  ok;
      _ -> skip
    end,
    {noreply, StateName, State};
do_handle_info(send_open_mail, StateName, State) ->
    WorldLev = world_lev:get_world_lev(),
    LimitWorldLev =
	arena_peak_champion_data:get_constant(open_world_lev_limit),
    case WorldLev >= LimitWorldLev of
      true ->
	  Now = date:unixtime(),
	  {{_Y, Month, Day}, {_Hour, _Minu, _}} =
	      date:seconds_to_datetime(Now),
	  DataMsg = {string,
		     {green,
		      util:fbin(lang:get(<<"~wThứ 2~wCN06：00"/utf8>>),
				[Month, Day])}},
	  StrMsg = {string,
		    {green, lang:get(<<"Cược Hàng Ngày"/utf8>>)}},
	  LimitLev =
	      arena_peak_champion_data:get_constant(open_lev_limit),
	  Subject =
	      lang:get(<<"Giải vô địch đỉnh cao bắt đầu"/utf8>>),
	  Content =
	      color:msg(lang:get(<<"Kính gửi Quý Nhẫn Giả：\n     Mùa giải "
				   "mới của Giải vô địch đỉnh cao đã bắt "
				   "đầu vào lúc ~ts. Người chơi hãy chú "
				   "ý đến lịch trình của mình.。\n     Những "
				   "người chơi không thể tham gia cũng có "
				   "thể tham gia ~ts và chú ý đến sự kiện "
				   "hàng đầu hàng tháng này và sẽ có những "
				   "phần thưởng hậu hĩnhĐang chờ bạn đến "
				   "và lấy nó。\n     Chúng ta hãy chờ xem "
				   "ai sẽ giành được danh hiệu vô địch。"/utf8>>),
			[DataMsg, StrMsg]),
	  mail:global_send(#gmail{id = {arena_peak_champion, Day},
				  end_time = Now + 86400 * 3, subject = Subject,
				  content = Content,
				  conds = [{minlev, LimitLev}]}),
	  ok;
      _ -> skip
    end,
    {noreply, StateName, State};
do_handle_info({sync_role_init_data, L}, StateName,
	       State) ->
    d_ets_lib:save_d_ets(arena_peak_champion_role, L),
    {noreply, StateName, State};
do_handle_info({add_score, _Id, 0},
	       StateName = score_fight, State) ->
    dec_combat_num(), {noreply, StateName, State};
do_handle_info({add_score, Id, AddScore},
	       StateName = score_fight, State) ->
    dec_combat_num(),
    case arena_peak_champion_db:get_role(Id) of
      {ok, R = #arena_peak_champion_role{score = Score}} ->
	  update_rank(R#arena_peak_champion_role{score =
						     Score + AddScore});
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr719, _,
	     {__Levelarena_peak_champion_mgr719,
	      __Tracesarena_peak_champion_mgr719}}
		when __Levelarena_peak_champion_mgr719 band 8 /= 0
		       orelse __Tracesarena_peak_champion_mgr719 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_mgr},
			      {function, do_handle_info}, {line, 719},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("获取竞技冠军参战者信息失败:~w, ~w",
					   [Id, AddScore]),
			     none, 4096, 8, __Levelarena_peak_champion_mgr719,
			     __Tracesarena_peak_champion_mgr719, lager_event,
			     __Pidarena_peak_champion_mgr719);
	    _ -> ok
	  end
    end,
    {noreply, StateName, State};
do_handle_info({do_combat, MainId, IsGuess, R,
		ApplyArge},
	       StateName, State) ->
    arena_peak_champion_lib:do_combat(R, MainId, IsGuess,
				      ApplyArge),
    {noreply, StateName, State};
do_handle_info({push_state, ConnPid}, StateName,
	       State) ->
    sys_conn:pack_send(ConnPid, 27700,
		       pack_state(0, State)),
    {noreply, StateName, State};
do_handle_info({notify_state, 3}, StateName, State) ->
    Data = pack_state(3, State),
    cluster_cast(arena_peak_champion_mgr, info,
		 [{do_notify_state, 3, Data}]),
    {noreply, StateName, State};
do_handle_info({notify_state, Flag}, StateName,
	       State) ->
    Data = pack_state(Flag, State),
    cluster_cast(arena_peak_champion_mgr, info,
		 [{do_notify_state, Data}]),
    {noreply, StateName, State};
do_handle_info({do_notify_state, 3, Data}, StateName,
	       State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr745, _,
       {__Levelarena_peak_champion_mgr745,
	__Tracesarena_peak_champion_mgr745}}
	  when __Levelarena_peak_champion_mgr745 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr745 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_handle_info}, {line, 745},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("巅峰冠军赛广播弹窗:~w", [StateName]), none, 4096,
		       64, __Levelarena_peak_champion_mgr745,
		       __Tracesarena_peak_champion_mgr745, lager_event,
		       __Pidarena_peak_champion_mgr745);
      _ -> ok
    end,
    Now = date:unixtime(),
    case Now > util:get(do_notify_state_3_cd, 0) of
      true ->
	  put(do_notify_state_3_cd, Now + 3),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr750, _,
	     {__Levelarena_peak_champion_mgr750,
	      __Tracesarena_peak_champion_mgr750}}
		when __Levelarena_peak_champion_mgr750 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr750 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, do_handle_info}, {line, 750},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("巅峰冠军赛广播弹窗执行:~w", [StateName]), none,
			     4096, 64, __Levelarena_peak_champion_mgr750,
			     __Tracesarena_peak_champion_mgr750, lager_event,
			     __Pidarena_peak_champion_mgr750);
	    _ -> ok
	  end,
	  role_group:send(world, proto_lib:pack(27700, Data));
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr753, _,
	     {__Levelarena_peak_champion_mgr753,
	      __Tracesarena_peak_champion_mgr753}}
		when __Levelarena_peak_champion_mgr753 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr753 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, do_handle_info}, {line, 753},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("巅峰冠军赛广播弹窗执行失败:~w", [StateName]),
			     none, 4096, 64, __Levelarena_peak_champion_mgr753,
			     __Tracesarena_peak_champion_mgr753, lager_event,
			     __Pidarena_peak_champion_mgr753);
	    _ -> ok
	  end,
	  skip
    end,
    {noreply, StateName, State};
do_handle_info({do_notify_state, Data}, StateName,
	       State) ->
    role_group:send(world, proto_lib:pack(27700, Data)),
    {noreply, StateName, State};
do_handle_info({do_notify_state_guess}, StateName,
	       State) ->
    role_group:send(world, proto_lib:pack(27716, {})),
    {noreply, StateName, State};
do_handle_info({combat_end_notify, Flag}, StateName,
	       State) ->
    self() ! {notify_state, 2},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr786, _,
       {__Levelarena_peak_champion_mgr786,
	__Tracesarena_peak_champion_mgr786}}
	  when __Levelarena_peak_champion_mgr786 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr786 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_handle_info}, {line, 786},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("所有战斗计算结束，通知前端刷新UI进入录像观战:~w", [Flag]),
		       none, 4096, 64, __Levelarena_peak_champion_mgr786,
		       __Tracesarena_peak_champion_mgr786, lager_event,
		       __Pidarena_peak_champion_mgr786);
      _ -> ok
    end,
    {noreply, StateName, State};
do_handle_info(gm_set_timer, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr791, _,
       {__Levelarena_peak_champion_mgr791,
	__Tracesarena_peak_champion_mgr791}}
	  when __Levelarena_peak_champion_mgr791 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr791 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_handle_info}, {line, 791},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("巅峰冠军赛修复刷新布阵定时器:~w", [StateName]), none,
		       4096, 64, __Levelarena_peak_champion_mgr791,
		       __Tracesarena_peak_champion_mgr791, lager_event,
		       __Pidarena_peak_champion_mgr791);
      _ -> ok
    end,
    util:set_timer(update_role_defense,
		   date:next_diff({5, 30, 0}), update_role_defense),
    RankList = sys_env:get(arena_peak_champione_data, []),
    sys_env:save(arena_peak_champione_old_data, RankList),
    {noreply, StateName, State};
do_handle_info(update_role_defense, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr799, _,
       {__Levelarena_peak_champion_mgr799,
	__Tracesarena_peak_champion_mgr799}}
	  when __Levelarena_peak_champion_mgr799 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr799 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_handle_info}, {line, 799},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("巅峰冠军赛刷新布阵数据:~w", [StateName]), none,
		       4096, 64, __Levelarena_peak_champion_mgr799,
		       __Tracesarena_peak_champion_mgr799, lager_event,
		       __Pidarena_peak_champion_mgr799);
      _ -> ok
    end,
    put(all_roles, ets:tab2list(arena_peak_champion_role)),
    util:set_ms_timer(do_update_role_defense,
		      util:rand(1, 200), do_update_role_defense),
    {noreply, StateName, State};
do_handle_info(do_update_role_defense, StateName,
	       State) ->
    case get(all_roles) of
      [R | Other] ->
	  arena_peak_champion_lib:update_role_defense(R),
	  put(all_roles, Other),
	  util:set_ms_timer(do_update_role_defense,
			    util:rand(200, 800), do_update_role_defense);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr810, _,
	     {__Levelarena_peak_champion_mgr810,
	      __Tracesarena_peak_champion_mgr810}}
		when __Levelarena_peak_champion_mgr810 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr810 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, do_handle_info}, {line, 810},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("巅峰冠军赛刷新布阵数据完成", []), none, 4096, 64,
			     __Levelarena_peak_champion_mgr810,
			     __Tracesarena_peak_champion_mgr810, lager_event,
			     __Pidarena_peak_champion_mgr810);
	    _ -> ok
	  end,
	  util:set_timer(update_role_defense,
			 date:next_diff({5, 30, 0}), update_role_defense),
	  erase(all_roles),
	  skip
    end,
    {noreply, StateName, State};
do_handle_info({apply, undefined, F, A}, StateName,
	       State) ->
    erlang:apply(F, [StateName, State | A]),
    {noreply, StateName, State};
do_handle_info({apply, M, F, A}, StateName, State) ->
    try erlang:apply(M, F, [StateName, State | A]) catch
      X:E ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr826, _,
	     {__Levelarena_peak_champion_mgr826,
	      __Tracesarena_peak_champion_mgr826}}
		when __Levelarena_peak_champion_mgr826 band 8 /= 0
		       orelse __Tracesarena_peak_champion_mgr826 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_mgr},
			      {function, do_handle_info}, {line, 826},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w 执行方法:~w:~w, ~w, 出错:~w:~w ~w, state:~w",
					   [StateName, M, F, A, X, E,
					    erlang:get_stacktrace(), State]),
			     none, 4096, 8, __Levelarena_peak_champion_mgr826,
			     __Tracesarena_peak_champion_mgr826, lager_event,
			     __Pidarena_peak_champion_mgr826);
	    _ -> ok
	  end
    end,
    {noreply, StateName, State};
do_handle_info(_Info, StateName, State) ->
    {noreply, StateName, State}.

pack_state(Flag,
	   #champion_state{step = Step, step_status = StepStatus,
			   step_status_time = StepStatusTime, round = Round,
			   round_status = RoundStatus,
			   season_start_time = SeasonStartTime,
			   season_end_time = SeasonEndTime,
			   state_end_time = StateEndTime}) ->
    RoundStatusTime = date:unixtime() +
			(StateEndTime - date:unixtime(ms)) div 1000,
    L = sys_env:get(arena_peak_champion_period, []),
    {Period, MaxZoneId} = case L of
			    [] -> {1, 1};
			    _ ->
				case lists:reverse(lists:keysort(1, L)) of
				  [{PeriodT, MaxZoneIdT} | _] ->
				      {PeriodT, MaxZoneIdT};
				  _ -> {1, 1}
				end
			  end,
    ZoneId = case ets:lookup(arena_peak_champion_zone_info,
			     sys_lib:srv_id())
		 of
	       [{_, ZoneIdT} | _] -> ZoneIdT;
	       _ -> 1
	     end,
    {SeasonStartTime, SeasonEndTime, Step, StepStatus,
     StepStatusTime, Round, RoundStatus, RoundStatusTime,
     Flag, Period, ZoneId, MaxZoneId}.

set_state_timeout(State, Timeout) ->
    Ms = date:unixtime(ms),
    State#champion_state{state_start_time = Ms,
			 state_end_time = Ms + Timeout}.

continue(StateName,
	 State = #champion_state{state_end_time = EndTime}) ->
    {next_state, StateName, State,
     max(1, EndTime - date:unixtime(ms))}.

continue(StateName, Reply,
	 State = #champion_state{state_end_time = EndTime}) ->
    {reply, Reply, StateName, State,
     max(1, EndTime - date:unixtime(ms))}.

idle(timeout, State) ->
    case catch do_state_handle(timeout, idle, State) of
      {noreply, NewStateName, NewState} ->
	  save_state(NewStateName, NewState),
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr874, _,
	     {__Levelarena_peak_champion_mgr874,
	      __Tracesarena_peak_champion_mgr874}}
		when __Levelarena_peak_champion_mgr874 band 8 /= 0
		       orelse __Tracesarena_peak_champion_mgr874 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_mgr},
			      {function, idle}, {line, 874},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [timeout, State, _Reason]),
			     none, 4096, 8, __Levelarena_peak_champion_mgr874,
			     __Tracesarena_peak_champion_mgr874, lager_event,
			     __Pidarena_peak_champion_mgr874);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理出现异常，需马上上线查看处理"/utf8>>,
					      []),
				    arena_peak_champion_mgr, 875, _Reason}),
	  continue(idle,
		   State#champion_state{state_end_time =
					    date:unixtime(ms) + 86400000})
    end;
idle(_Any, State) -> continue(idle, State).

score_guess(timeout, State) ->
    case catch do_state_handle(timeout, score_guess, State)
	of
      {noreply, NewStateName, NewState} ->
	  save_state(NewStateName, NewState),
	  self() ! {notify_state, 0},
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr889, _,
	     {__Levelarena_peak_champion_mgr889,
	      __Tracesarena_peak_champion_mgr889}}
		when __Levelarena_peak_champion_mgr889 band 8 /= 0
		       orelse __Tracesarena_peak_champion_mgr889 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_mgr},
			      {function, score_guess}, {line, 889},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [timeout, State, _Reason]),
			     none, 4096, 8, __Levelarena_peak_champion_mgr889,
			     __Tracesarena_peak_champion_mgr889, lager_event,
			     __Pidarena_peak_champion_mgr889);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理出现异常，需马上上线查看处理"/utf8>>,
					      []),
				    arena_peak_champion_mgr, 890, _Reason}),
	  continue(score_guess,
		   State#champion_state{state_end_time =
					    date:unixtime(ms) + 86400000})
    end;
score_guess(_Any, State) ->
    continue(score_guess, State).

score_fight(timeout, State) ->
    case catch do_state_handle(timeout, score_fight, State)
	of
      {noreply, NewStateName, NewState} ->
	  self() ! {notify_state, 1},
	  save_state(NewStateName, NewState),
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr904, _,
	     {__Levelarena_peak_champion_mgr904,
	      __Tracesarena_peak_champion_mgr904}}
		when __Levelarena_peak_champion_mgr904 band 8 /= 0
		       orelse __Tracesarena_peak_champion_mgr904 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_mgr},
			      {function, score_fight}, {line, 904},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [timeout, State, _Reason]),
			     none, 4096, 8, __Levelarena_peak_champion_mgr904,
			     __Tracesarena_peak_champion_mgr904, lager_event,
			     __Pidarena_peak_champion_mgr904);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理出现异常，需马上上线查看处理"/utf8>>,
					      []),
				    arena_peak_champion_mgr, 905, _Reason}),
	  continue(score_fight,
		   State#champion_state{state_end_time =
					    date:unixtime(ms) + 86400000})
    end;
score_fight(_Any, State) ->
    continue(score_fight, State).

score_ready(timeout, State) ->
    case catch do_state_handle(timeout, score_ready, State)
	of
      {noreply, NewStateName, NewState} ->
	  self() ! {notify_state, 1},
	  save_state(NewStateName, NewState),
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr919, _,
	     {__Levelarena_peak_champion_mgr919,
	      __Tracesarena_peak_champion_mgr919}}
		when __Levelarena_peak_champion_mgr919 band 8 /= 0
		       orelse __Tracesarena_peak_champion_mgr919 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_mgr},
			      {function, score_ready}, {line, 919},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [timeout, State, _Reason]),
			     none, 4096, 8, __Levelarena_peak_champion_mgr919,
			     __Tracesarena_peak_champion_mgr919, lager_event,
			     __Pidarena_peak_champion_mgr919);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理出现异常，需马上上线查看处理"/utf8>>,
					      []),
				    arena_peak_champion_mgr, 920, _Reason}),
	  continue(score_ready,
		   State#champion_state{state_end_time =
					    date:unixtime(ms) + 86400000})
    end;
score_ready(_Any, State) ->
    continue(score_ready, State).

champion_guess(timeout, State) ->
    case catch do_state_handle(timeout, champion_guess,
			       State)
	of
      {noreply, NewStateName, NewState} ->
	  self() ! {notify_state, 0},
	  save_state(NewStateName, NewState),
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr934, _,
	     {__Levelarena_peak_champion_mgr934,
	      __Tracesarena_peak_champion_mgr934}}
		when __Levelarena_peak_champion_mgr934 band 8 /= 0
		       orelse __Tracesarena_peak_champion_mgr934 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_mgr},
			      {function, champion_guess}, {line, 934},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [timeout, State, _Reason]),
			     none, 4096, 8, __Levelarena_peak_champion_mgr934,
			     __Tracesarena_peak_champion_mgr934, lager_event,
			     __Pidarena_peak_champion_mgr934);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理出现异常，需马上上线查看处理"/utf8>>,
					      []),
				    arena_peak_champion_mgr, 935, _Reason}),
	  continue(champion_guess,
		   State#champion_state{state_end_time =
					    date:unixtime(ms) + 86400000})
    end;
champion_guess(_Any, State) ->
    continue(champion_guess, State).

champion_fight(timeout, State) ->
    case catch do_state_handle(timeout, champion_fight,
			       State)
	of
      {noreply, NewStateName, NewState} ->
	  self() ! {notify_state, 1},
	  save_state(NewStateName, NewState),
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr949, _,
	     {__Levelarena_peak_champion_mgr949,
	      __Tracesarena_peak_champion_mgr949}}
		when __Levelarena_peak_champion_mgr949 band 8 /= 0
		       orelse __Tracesarena_peak_champion_mgr949 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_mgr},
			      {function, champion_fight}, {line, 949},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [timeout, State, _Reason]),
			     none, 4096, 8, __Levelarena_peak_champion_mgr949,
			     __Tracesarena_peak_champion_mgr949, lager_event,
			     __Pidarena_peak_champion_mgr949);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理出现异常，需马上上线查看处理"/utf8>>,
					      []),
				    arena_peak_champion_mgr, 950, _Reason}),
	  continue(champion_fight,
		   State#champion_state{state_end_time =
					    date:unixtime(ms) + 86400000})
    end;
champion_fight(_Any, State) ->
    continue(champion_fight, State).

champion_ready(timeout, State) ->
    case catch do_state_handle(timeout, champion_ready,
			       State)
	of
      {noreply, NewStateName, NewState} ->
	  self() ! {notify_state, 1},
	  save_state(NewStateName, NewState),
	  continue(NewStateName, NewState);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr964, _,
	     {__Levelarena_peak_champion_mgr964,
	      __Tracesarena_peak_champion_mgr964}}
		when __Levelarena_peak_champion_mgr964 band 8 /= 0
		       orelse __Tracesarena_peak_champion_mgr964 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_mgr},
			      {function, champion_ready}, {line, 964},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("状态机消息处理错误, 消息:~w, 状态:~w, ~w",
					   [timeout, State, _Reason]),
			     none, 4096, 8, __Levelarena_peak_champion_mgr964,
			     __Tracesarena_peak_champion_mgr964, lager_event,
			     __Pidarena_peak_champion_mgr964);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理出现异常，需马上上线查看处理"/utf8>>,
					      []),
				    arena_peak_champion_mgr, 965, _Reason}),
	  continue(champion_ready,
		   State#champion_state{state_end_time =
					    date:unixtime(ms) + 86400000})
    end;
champion_ready(_Any, State) ->
    continue(champion_ready, State).

do_state_handle(timeout, idle,
		State = #champion_state{}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr972, _,
       {__Levelarena_peak_champion_mgr972,
	__Tracesarena_peak_champion_mgr972}}
	  when __Levelarena_peak_champion_mgr972 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr972 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_state_handle}, {line, 972},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("巅峰冠军赛空闲超时", []), none, 4096, 64,
		       __Levelarena_peak_champion_mgr972,
		       __Tracesarena_peak_champion_mgr972, lager_event,
		       __Pidarena_peak_champion_mgr972);
      _ -> ok
    end,
    {noreply, idle, set_state_timeout(State, 86400000)};
do_state_handle(timeout, score_guess,
		State = #champion_state{round = Round}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr975, _,
       {__Levelarena_peak_champion_mgr975,
	__Tracesarena_peak_champion_mgr975}}
	  when __Levelarena_peak_champion_mgr975 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr975 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_state_handle}, {line, 975},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("巅峰冠军赛进入预选赛战斗阶段:~w", [State]), none, 4096,
		       64, __Levelarena_peak_champion_mgr975,
		       __Tracesarena_peak_champion_mgr975, lager_event,
		       __Pidarena_peak_champion_mgr975);
      _ -> ok
    end,
    score_combat(Round),
    TimeOut =
	date:next_diff(arena_peak_champion_data:get_constant(time_score_ready)),
    {noreply, score_fight,
     set_state_timeout(State#champion_state{round_status =
						3},
		       TimeOut * 1000)};
do_state_handle(timeout, score_fight,
		State = #champion_state{}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr981, _,
       {__Levelarena_peak_champion_mgr981,
	__Tracesarena_peak_champion_mgr981}}
	  when __Levelarena_peak_champion_mgr981 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr981 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_state_handle}, {line, 981},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("选拔赛进入预选赛休整阶段:~w", [State]), none, 4096,
		       64, __Levelarena_peak_champion_mgr981,
		       __Tracesarena_peak_champion_mgr981, lager_event,
		       __Pidarena_peak_champion_mgr981);
      _ -> ok
    end,
    guess_stat(0, State),
    Timeout =
	date:next_diff(arena_peak_champion_data:get_constant(time_score_guess)),
    {noreply, score_ready,
     set_state_timeout(State#champion_state{round_status =
						1},
		       Timeout * 1000)};
do_state_handle(timeout, score_ready,
		State = #champion_state{round = Round}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr987, _,
       {__Levelarena_peak_champion_mgr987,
	__Tracesarena_peak_champion_mgr987}}
	  when __Levelarena_peak_champion_mgr987 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr987 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_state_handle}, {line, 987},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("选拔赛对战完成:~w", [State]), none, 4096, 64,
		       __Levelarena_peak_champion_mgr987,
		       __Tracesarena_peak_champion_mgr987, lager_event,
		       __Pidarena_peak_champion_mgr987);
      _ -> ok
    end,
    Timeout =
	date:next_diff(arena_peak_champion_data:get_constant(time_score_fight)),
    util:set_timer(do_notice, max(1, Timeout - 60 * 5),
		   {notify_state, 3}),
    util:set_timer(do_open_ico,
		   max(10, date:next_diff({20, 0, 0})), open_ico),
    util:set_ms_timer(save_data_timer, util:rand(1, 60000),
		      save_data),
    say_subtitle:clear(103),
    case Round of
      6 ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr996, _,
	     {__Levelarena_peak_champion_mgr996,
	      __Tracesarena_peak_champion_mgr996}}
		when __Levelarena_peak_champion_mgr996 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr996 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, do_state_handle}, {line, 996},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("选拔赛结束，进入256强竞猜时间:~w", [Round]),
			     none, 4096, 64, __Levelarena_peak_champion_mgr996,
			     __Tracesarena_peak_champion_mgr996, lager_event,
			     __Pidarena_peak_champion_mgr996);
	    _ -> ok
	  end,
	  NewState = State#champion_state{round = 1,
					  round_status = 2, step = 256,
					  step_status = 1},
	  L = arena_peak_champion_lib:champion_match3(256, 1,
						      NewState),
	  [d_ets_lib:save_d_ets(arena_peak_champion_ext,
				{{champion_256, Group}, L1})
	   || {Group, L1} <- L],
	  [d_ets_lib:save_d_ets(arena_peak_champion_ext,
				{{champion_256_temp, Group}, L1})
	   || {Group, L1} <- L],
	  [[ets:update_element(arena_peak_champion_role, RoleId,
			       {#arena_peak_champion_role.group256, Group})
	    || #peak_champion_32_pk{id = RoleId} <- L1]
	   || {Group, L1} <- L],
	  util:set_ms_timer(save_data_timer, util:rand(1, 60000),
			    save_data),
	  guess_score_supply(arena_peak_champion_data:get_constant(guess_number1),
			     NewState),
	  select_guess(NewState),
	  self() ! sync_status_to_zone,
	  {noreply, champion_guess,
	   set_state_timeout(NewState, Timeout * 1000)};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr1009, _,
	     {__Levelarena_peak_champion_mgr1009,
	      __Tracesarena_peak_champion_mgr1009}}
		when __Levelarena_peak_champion_mgr1009 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr1009 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, do_state_handle}, {line, 1009},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("选拔赛匹配对手完成, 进入回合：~w", [Round + 1]),
			     none, 4096, 64, __Levelarena_peak_champion_mgr1009,
			     __Tracesarena_peak_champion_mgr1009, lager_event,
			     __Pidarena_peak_champion_mgr1009);
	    _ -> ok
	  end,
	  NewState = State#champion_state{round = Round + 1,
					  round_status = 2},
	  arena_peak_champion_lib:score_match(NewState, skip),
	  guess_score_supply(arena_peak_champion_data:get_constant(guess_number1),
			     NewState),
	  select_guess(NewState),
	  {noreply, score_guess,
	   set_state_timeout(NewState, Timeout * 1000)}
    end;
do_state_handle(timeout, champion_guess, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr1017, _,
       {__Levelarena_peak_champion_mgr1017,
	__Tracesarena_peak_champion_mgr1017}}
	  when __Levelarena_peak_champion_mgr1017 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr1017 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_state_handle}, {line, 1017},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("32强进入战斗阶段:~w", [State]), none, 4096, 64,
		       __Levelarena_peak_champion_mgr1017,
		       __Tracesarena_peak_champion_mgr1017, lager_event,
		       __Pidarena_peak_champion_mgr1017);
      _ -> ok
    end,
    put(combat_num, 0),
    champion_combat(State),
    TimeOut =
	date:next_diff(arena_peak_champion_data:get_constant(time_score_ready)),
    self() ! sync_status_to_zone,
    {noreply, champion_fight,
     set_state_timeout(State#champion_state{round_status =
						3},
		       TimeOut * 1000)};
do_state_handle(timeout, champion_fight, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr1025, _,
       {__Levelarena_peak_champion_mgr1025,
	__Tracesarena_peak_champion_mgr1025}}
	  when __Levelarena_peak_champion_mgr1025 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr1025 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_state_handle}, {line, 1025},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("32强进入休整阶段:~w", [State]), none, 4096, 64,
		       __Levelarena_peak_champion_mgr1025,
		       __Tracesarena_peak_champion_mgr1025, lager_event,
		       __Pidarena_peak_champion_mgr1025);
      _ -> ok
    end,
    champion_combat_check(State),
    guess_stat(0, State),
    TimeOut =
	date:next_diff(arena_peak_champion_data:get_constant(time_score_guess)),
    self() ! sync_status_to_zone,
    {noreply, champion_ready,
     set_state_timeout(State#champion_state{round_status =
						1},
		       TimeOut * 1000)};
do_state_handle(timeout, champion_ready,
		State = #champion_state{round = Round, step = Step}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr1033, _,
       {__Levelarena_peak_champion_mgr1033,
	__Tracesarena_peak_champion_mgr1033}}
	  when __Levelarena_peak_champion_mgr1033 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr1033 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, do_state_handle}, {line, 1033},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("32强对战完成:~w", [State]), none, 4096, 64,
		       __Levelarena_peak_champion_mgr1033,
		       __Tracesarena_peak_champion_mgr1033, lager_event,
		       __Pidarena_peak_champion_mgr1033);
      _ -> ok
    end,
    Timeout =
	date:next_diff(arena_peak_champion_data:get_constant(time_score_fight)),
    util:set_ms_timer(save_data_timer, util:rand(1, 60000),
		      save_data),
    case {Step, Round} of
      {256, 2} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr1039, _,
	     {__Levelarena_peak_champion_mgr1039,
	      __Tracesarena_peak_champion_mgr1039}}
		when __Levelarena_peak_champion_mgr1039 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr1039 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, do_state_handle}, {line, 1039},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "256强比赛结束，进入64强", none, 4096, 64,
			     __Levelarena_peak_champion_mgr1039,
			     __Tracesarena_peak_champion_mgr1039, lager_event,
			     __Pidarena_peak_champion_mgr1039);
	    _ -> ok
	  end,
	  NewState = State#champion_state{round = 1,
					  round_status = 2, step = 64,
					  step_status = 1},
	  L = arena_peak_champion_lib:champion_match2(64, 1,
						      NewState),
	  [d_ets_lib:save_d_ets(arena_peak_champion_ext,
				{{champion_64, Group}, L1})
	   || {Group, L1} <- L],
	  [d_ets_lib:save_d_ets(arena_peak_champion_ext,
				{{champion_64_temp, Group}, L1})
	   || {Group, L1} <- L],
	  [[ets:update_element(arena_peak_champion_role, RoleId,
			       {#arena_peak_champion_role.group64, Group})
	    || #peak_champion_32_pk{id = RoleId} <- L1]
	   || {Group, L1} <- L],
	  guess_score_supply(arena_peak_champion_data:get_constant(guess_number1),
			     NewState),
	  select_guess(NewState),
	  util:set_timer(do_notice, max(1, Timeout - 60 * 5),
			 {notify_state, 3}),
	  util:set_timer(do_open_ico,
			 max(10, date:next_diff({20, 0, 0})), open_ico),
	  say_subtitle:clear(103),
	  self() ! sync_status_to_zone,
	  {noreply, champion_guess,
	   set_state_timeout(NewState, Timeout * 1000)};
      {64, 3} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr1054, _,
	     {__Levelarena_peak_champion_mgr1054,
	      __Tracesarena_peak_champion_mgr1054}}
		when __Levelarena_peak_champion_mgr1054 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr1054 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, do_state_handle}, {line, 1054},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "64强比赛结束，进入8强", none, 4096, 64,
			     __Levelarena_peak_champion_mgr1054,
			     __Tracesarena_peak_champion_mgr1054, lager_event,
			     __Pidarena_peak_champion_mgr1054);
	    _ -> ok
	  end,
	  NewState = State#champion_state{round = 1,
					  round_status = 2, step = 8,
					  step_status = 1},
	  [{_, L}] = arena_peak_champion_lib:champion_match(8, 0,
							    NewState),
	  d_ets_lib:save_d_ets(arena_peak_champion_ext,
			       {champion_4, L}),
	  d_ets_lib:save_d_ets(arena_peak_champion_ext,
			       {champion_4_temp, L}),
	  guess_score_supply(arena_peak_champion_data:get_constant(guess_number1),
			     NewState),
	  select_guess(NewState),
	  self() ! sync_status_to_zone,
	  util:set_timer(do_notice, max(1, Timeout - 60 * 5),
			 {notify_state, 3}),
	  util:set_timer(do_open_ico,
			 max(10, date:next_diff({20, 0, 0})), open_ico),
	  say_subtitle:clear(103),
	  {noreply, champion_guess,
	   set_state_timeout(NewState, Timeout * 1000)};
      {8, 3} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr1068, _,
	     {__Levelarena_peak_champion_mgr1068,
	      __Tracesarena_peak_champion_mgr1068}}
		when __Levelarena_peak_champion_mgr1068 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr1068 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, do_state_handle}, {line, 1068},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("8强比赛结束", []), none, 4096, 64,
			     __Levelarena_peak_champion_mgr1068,
			     __Tracesarena_peak_champion_mgr1068, lager_event,
			     __Pidarena_peak_champion_mgr1068);
	    _ -> ok
	  end,
	  Now = date:unixtime(),
	  CloseDay =
	      arena_peak_champion_data:get_constant(close_time),
	  OpenDay =
	      arena_peak_champion_data:get_constant(open_time),
	  self() ! sync_status_to_zone,
	  MaxNum = ets:info(arena_peak_champion_role, size),
	  rank_reward(1, MaxNum),
	  save_result(1, MaxNum),
	  mail_bet(),
	  NewState = set_state_timeout(State#champion_state{round
								= 0,
							    round_status = 0,
							    step_status = 2,
							    step_status_time =
								Now +
								  86400 *
								    CloseDay,
							    season_start_time =
								Now +
								  86400 *
								    CloseDay,
							    season_end_time =
								Now +
								  86400 *
								    (CloseDay +
								       OpenDay)},
				       Timeout * 1000),
	  util:set_ms_timer(sys_old_rank_timer,
			    util:rand(1, 10 * 60000), sys_old_rank),
	  {noreply, idle, NewState};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr1093, _,
	     {__Levelarena_peak_champion_mgr1093,
	      __Tracesarena_peak_champion_mgr1093}}
		when __Levelarena_peak_champion_mgr1093 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr1093 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, do_state_handle}, {line, 1093},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("32强进入下回合,step:~w, round:~w",
					   [Step, Round + 1]),
			     none, 4096, 64, __Levelarena_peak_champion_mgr1093,
			     __Tracesarena_peak_champion_mgr1093, lager_event,
			     __Pidarena_peak_champion_mgr1093);
	    _ -> ok
	  end,
	  NewState = State#champion_state{round = Round + 1,
					  round_status = 2},
	  arena_peak_champion_lib:gen_next_champion_pk(NewState),
	  guess_score_supply(arena_peak_champion_data:get_constant(guess_number2),
			     NewState),
	  select_guess(NewState),
	  self() ! sync_status_to_zone,
	  util:set_timer(do_notice, max(1, Timeout - 60 * 5),
			 {notify_state, 3}),
	  util:set_timer(do_open_ico,
			 max(10, date:next_diff({20, 0, 0})), open_ico),
	  say_subtitle:clear(103),
	  {noreply, champion_guess,
	   set_state_timeout(NewState, Timeout * 1000)}
    end;
do_state_handle(_Info, StateName, State) ->
    {noreply, StateName, State}.

-spec extract_join_role(list(), list()) -> ok.

extract_join_role(MainList, SrvLists) ->
    [combat_replay_mgr:dec_replay_reference(ReplayId)
     || {ReplayId}
	    <- ets:tab2list(arena_peak_champion_replay)],
    d_ets_lib:clear_d_ets(arena_peak_champion_replay),
    [d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			   {champion_256, Group})
     || Group <- lists:seq(1, 16)],
    [d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			   {champion_64, Group})
     || Group <- lists:seq(1, 8)],
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  champion_4),
    d_ets_lib:clear_d_ets(arena_peak_champion_role),
    d_ets_lib:clear_d_ets(arena_peak_champion_bet),
    d_ets_lib:clear_d_ets(arena_peak_champion_pk),
    d_ets_lib:clear_d_ets(arena_peak_champion_role_log),
    ets:delete_all_objects(arena_peak_champion_rank),
    d_ets_lib:save_d_ets(arena_peak_champion_ext,
			 {zone_all_srvs, SrvLists}),
    erase(guess_roleid),
    erase(guess_id),
    erase(guess_info),
    erase(guess_a_bet),
    erase(guess_b_bet),
    erase(guess_list),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_roleid),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_id),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_info),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_a_bet),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_b_bet),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_list),
    [cluster_lib:cast(Sid, arena_peak_champion_lib,
		      do_extract_join_role, [sys_lib:srv_id()])
     || Sid <- MainList],
    info({notify_score_start}).

guess_score_supply(_BaseVal,
		   #champion_state{step = 1, round = 1}) ->
    ok;
guess_score_supply(BaseVal, _State) ->
    [ets:update_counter(arena_peak_champion_bet, RoleId,
			{#champion_bet.bet, BaseVal})
     || {RoleId, _, _} <- util:get(guess_list, [])],
    dets:insert(arena_peak_champion_bet,
		ets:tab2list(arena_peak_champion_bet)).

select_guess(#champion_state{step = Step,
			     round = Round}) ->
    L1 = ets:match_object(arena_peak_champion_pk,
			  #peak_champion_pk{ret = 0, step = Step, round = Round,
					    _ = '_'}),
    {BaseMinPower, BaseMaxPower} =
	arena_peak_champion_data:get_constant(battel_guess),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr1155, _,
       {__Levelarena_peak_champion_mgr1155,
	__Tracesarena_peak_champion_mgr1155}}
	  when __Levelarena_peak_champion_mgr1155 band 128 /= 0
		 orelse __Tracesarena_peak_champion_mgr1155 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_peak_champion_mgr},
			{function, select_guess}, {line, 1155},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("竞技信息min_power=~w, max_power=~w, len=~w "
				     "size=~w",
				     [BaseMinPower, BaseMaxPower, length(L1),
				      ets:info(arena_peak_champion_role,
					       size)]),
		       none, 4096, 128, __Levelarena_peak_champion_mgr1155,
		       __Tracesarena_peak_champion_mgr1155, lager_event,
		       __Pidarena_peak_champion_mgr1155);
      _ -> ok
    end,
    #peak_champion_pk{a_id = RoleId, group = Group,
		      a_pos = Pos, a_power = APower, b_power = BPower,
		      diff_power = DiffPower} =
	case [PK
	      || PK = #peak_champion_pk{is_guess = 1,
					diff_power = DiffPower}
		     <- L1,
		 BaseMinPower =< DiffPower andalso
		   DiffPower =< BaseMaxPower]
	    of
	  [] ->
	      do_select_guess_min_power(L1, BaseMinPower,
					BaseMaxPower, 9999999999, null);
	  L2 ->
	      case [PK
		    || PK = #peak_champion_pk{a_id = Aid, b_id = Bid} <- L2,
		       not_robot(Aid) orelse not_robot(Bid)]
		  of
		L3 = [_ | _] -> util:rand_list(L3);
		_ -> util:rand_list(L2)
	      end
	end,
    Id = Step * 10 + Round,
    GuessInfo = {Group, Pos, Id, RoleId},
    d_ets_lib:save_d_ets(arena_peak_champion_ext,
			 {guess_info, GuessInfo}),
    d_ets_lib:save_d_ets(arena_peak_champion_ext,
			 {guess_roleid, RoleId}),
    d_ets_lib:save_d_ets(arena_peak_champion_ext,
			 {guess_a_bet, 0}),
    d_ets_lib:save_d_ets(arena_peak_champion_ext,
			 {guess_b_bet, 0}),
    d_ets_lib:save_d_ets(arena_peak_champion_ext,
			 {guess_list, []}),
    put(guess_roleid, RoleId),
    put(guess_id, Id),
    put(guess_info, GuessInfo),
    put(guess_a_bet, 0),
    put(guess_b_bet, 0),
    put(guess_list, []),
    d_ets_lib:save_d_ets(arena_peak_champion_ext,
			 {guess_id, [RoleId, Id]}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr1180, _,
       {__Levelarena_peak_champion_mgr1180,
	__Tracesarena_peak_champion_mgr1180}}
	  when __Levelarena_peak_champion_mgr1180 band 128 /= 0
		 orelse __Tracesarena_peak_champion_mgr1180 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_peak_champion_mgr},
			{function, select_guess}, {line, 1180},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("本次竞猜信息:~w diff_power:~w, a_power:~w, "
				     "b_power:~w",
				     [GuessInfo, DiffPower, APower, BPower]),
		       none, 4096, 128, __Levelarena_peak_champion_mgr1180,
		       __Tracesarena_peak_champion_mgr1180, lager_event,
		       __Pidarena_peak_champion_mgr1180);
      _ -> ok
    end.

do_select_guess_min_power([], _MinPower, _MaxPower,
			  _DiffPower, R) ->
    R;
do_select_guess_min_power([R1 =
			       #peak_champion_pk{is_guess = 1,
						 diff_power = Power}
			   | T],
			  MinPower, MaxPower, DiffPower, R) ->
    DiffPower1 = min(abs(Power - MinPower),
		     abs(Power - MaxPower)),
    case DiffPower1 =< DiffPower of
      true ->
	  do_select_guess_min_power(T, MinPower, MaxPower,
				    DiffPower1, R1);
      _ ->
	  do_select_guess_min_power(T, MinPower, MaxPower,
				    DiffPower, R)
    end;
do_select_guess_min_power([_ | T], MinPower, MaxPower,
			  DiffPower, R) ->
    do_select_guess_min_power(T, MinPower, MaxPower,
			      DiffPower, R).

not_robot(<<>>) -> false;
not_robot(<<"robot">>) -> false;
not_robot(_) -> true.

score_combat(Round) ->
    GuessId = get(guess_roleid),
    L = ets:match_object(arena_peak_champion_pk,
			 #peak_champion_pk{ret = 0, round = Round, _ = '_'}),
    put(combat_num, length(L)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr1203, _,
       {__Levelarena_peak_champion_mgr1203,
	__Tracesarena_peak_champion_mgr1203}}
	  when __Levelarena_peak_champion_mgr1203 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr1203 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, score_combat}, {line, 1203},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("选拔赛打几场:~w", [get(combat_num)]), none,
		       4096, 64, __Levelarena_peak_champion_mgr1203,
		       __Tracesarena_peak_champion_mgr1203, lager_event,
		       __Pidarena_peak_champion_mgr1203);
      _ -> ok
    end,
    GmCmd = get(gm_combat_info),
    [spawn(fun () ->
		   do_score_combat_(R, GuessId, Round, GmCmd)
	   end)
     || R <- L].

do_score_combat_(#peak_champion_pk{a_id =
				       {_, <<>>} = Id},
		 GuessId, Round, _GmCmd)
    when Id =/= GuessId ->
    ets:delete(arena_peak_champion_pk, Id),
    case util:rand(1, 1000) > 500 of
      true -> info({add_score, Id, 0});
      _ ->
	  #{score := AddScoreT} =
	      arena_peak_champion_data:get_score_match({Round, 1}),
	  AddScore = round(AddScoreT *
			     arena_peak_champion_data:get_constant(robot_win_score)
			     * 1.0e-3),
	  info({add_score, Id, AddScore})
    end;
do_score_combat_(#peak_champion_pk{a_id = Id = {_, Sid},
				   b_id = {_, Sid2}, a_name = Name},
		 GuessId, Round, win) ->
    arena_peak_champion_mgr:apply({arena_peak_champion_mgr,
				   async_fun_combat_over,
				   [1, [], [], [], {score, Id, Name}]});
do_score_combat_(R = #peak_champion_pk{a_id =
					   Id = {_, Sid},
				       b_id = {_, Sid2}, a_name = Name},
		 _GuessId, Round, GmCmd) ->
    IsGuess = Id =:= get(guess_roleid),
    MainId = sys_lib:srv_id(),
    if Sid == <<>>, Sid2 == <<>> ->
	   info({do_combat, MainId, IsGuess, R,
		 {score, Id, Name}});
       Sid == <<>> ->
	   cluster_lib:cast(Sid2, arena_peak_champion_mgr, info,
			    [{do_combat, MainId, IsGuess, R,
			      {score, Id, Name}}]);
       true ->
	   cluster_lib:cast(Sid, arena_peak_champion_mgr, info,
			    [{do_combat, MainId, IsGuess, R,
			      {score, Id, Name}}])
    end.

champion_combat(State = #champion_state{step = 256}) ->
    [do_champion_combat(Group,
			arena_peak_champion_db:get_ext({champion_256_temp,
							Group},
						       []),
			State)
     || Group <- lists:seq(1, 16)];
champion_combat(State = #champion_state{step = 64}) ->
    [do_champion_combat(Group,
			arena_peak_champion_db:get_ext({champion_64_temp,
							Group},
						       []),
			State)
     || Group <- lists:seq(1, 8)];
champion_combat(State) ->
    do_champion_combat(0,
		       arena_peak_champion_db:get_ext(champion_4_temp, []),
		       State).

do_champion_combat(Group, L,
		   #champion_state{step = Step, round = Round}) ->
    PosL =
	arena_peak_champion_lib:step_round_combat_pos(Step,
						      Round),
    put(combat_num, get(combat_num) + length(PosL)),
    GmCmd = get(gm_combat_info),
    [spawn(fun () ->
		   do_champion_combat_(Group, Step, Round,
				       lists:keyfind(Pos1,
						     #peak_champion_32_pk.pos,
						     L),
				       lists:keyfind(Pos2,
						     #peak_champion_32_pk.pos,
						     L),
				       GmCmd)
	   end)
     || {Pos1, Pos2} <- PosL].

do_champion_combat_(Group, Step, Round,
		    R1 = #peak_champion_32_pk{pos = Pos1,
					      id = Id1 = {_, Sid1},
					      name = Name1, max_power = Power1},
		    R2 = #peak_champion_32_pk{pos = Pos2,
					      id = Id2 = {_, Sid2},
					      name = Name2, max_power = Power2},
		    win) ->
    arena_peak_champion_mgr:apply({arena_peak_champion_mgr,
				   async_fun_combat_over,
				   [1, [], [], [],
				    {champion, Group, Pos1, Pos2}]});
do_champion_combat_(Group, Step, Round,
		    R1 = #peak_champion_32_pk{pos = Pos1,
					      id = Id1 = {_, Sid1},
					      name = Name1, max_power = Power1},
		    R2 = #peak_champion_32_pk{pos = Pos2,
					      id = Id2 = {_, Sid2},
					      name = Name2, max_power = Power2},
		    GmCmd) ->
    IsGuess = lists:member(get(guess_roleid), [Id1, Id2]),
    MainId = sys_lib:srv_id(),
    case arena_peak_champion_db:get_pk([Id1, Id2]) of
      {ok, PK = #peak_champion_pk{}} ->
	  if Sid1 == <<>>, Sid2 == <<>> ->
		 info({do_combat, MainId, IsGuess, PK,
		       {champion, Group, Pos1, Pos2}});
	     Sid1 == <<>> ->
		 cluster_lib:cast(Sid2, arena_peak_champion_mgr, info,
				  [{do_combat, MainId, IsGuess, PK,
				    {champion, Group, Pos1, Pos2}}]);
	     true ->
		 cluster_lib:cast(Sid1, arena_peak_champion_mgr, info,
				  [{do_combat, MainId, IsGuess, PK,
				    {champion, Group, Pos1, Pos2}}])
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
	    {__Pidarena_peak_champion_mgr1266, _,
	     {__Levelarena_peak_champion_mgr1266,
	      __Tracesarena_peak_champion_mgr1266}}
		when __Levelarena_peak_champion_mgr1266 band 8 /= 0
		       orelse __Tracesarena_peak_champion_mgr1266 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_mgr},
			      {function, do_champion_combat_}, {line, 1266},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("发起战斗失败：group:~w step:~w round:~w ~w "
					   "pk ~w",
					   [Group, Step, Round, R1, R2]),
			     none, 4096, 8, __Levelarena_peak_champion_mgr1266,
			     __Tracesarena_peak_champion_mgr1266, lager_event,
			     __Pidarena_peak_champion_mgr1266);
	    _ -> ok
	  end
    end;
do_champion_combat_(_Group, _Step, _Round, _R1, _R2,
		    _GmCmd) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr1269, _,
       {__Levelarena_peak_champion_mgr1269,
	__Tracesarena_peak_champion_mgr1269}}
	  when __Levelarena_peak_champion_mgr1269 band 8 /= 0
		 orelse __Tracesarena_peak_champion_mgr1269 /= [] ->
	  lager:do_log(error,
		       [{module, arena_peak_champion_mgr},
			{function, do_champion_combat_}, {line, 1269},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("发起战斗失败：group:~w step:~w round:~w ~w "
				     "pk ~w",
				     [_Group, _Step, _Round, _R1, _R2]),
		       none, 4096, 8, __Levelarena_peak_champion_mgr1269,
		       __Tracesarena_peak_champion_mgr1269, lager_event,
		       __Pidarena_peak_champion_mgr1269);
      _ -> ok
    end.

champion_combat_check(State = #champion_state{step =
						  256}) ->
    [do_champion_combat_check(Group, State,
			      arena_peak_champion_db:get_ext({champion_256_temp,
							      Group},
							     []),
			      State)
     || Group <- lists:seq(1, 16)],
    [d_ets_lib:save_d_ets(arena_peak_champion_ext,
			  {{champion_256, Group},
			   arena_peak_champion_db:get_ext({champion_256_temp,
							   Group},
							  [])})
     || Group <- lists:seq(1, 16)];
champion_combat_check(State = #champion_state{step =
						  64}) ->
    [do_champion_combat_check(Group, State,
			      arena_peak_champion_db:get_ext({champion_64_temp,
							      Group},
							     []),
			      State)
     || Group <- lists:seq(1, 8)],
    [d_ets_lib:save_d_ets(arena_peak_champion_ext,
			  {{champion_64, Group},
			   arena_peak_champion_db:get_ext({champion_64_temp,
							   Group},
							  [])})
     || Group <- lists:seq(1, 8)];
champion_combat_check(State) ->
    do_champion_combat_check(0, State,
			     arena_peak_champion_db:get_ext(champion_4_temp,
							    []),
			     State),
    d_ets_lib:save_d_ets(arena_peak_champion_ext,
			 {champion_4,
			  arena_peak_champion_db:get_ext(champion_4_temp, [])}).

do_champion_combat_check(Group, State, L,
			 #champion_state{step = Step, round = Round}) ->
    PosL =
	arena_peak_champion_lib:step_round_combat_pos(Step,
						      Round),
    [do_champion_combat_check_(Group, State,
			       lists:keyfind(Pos1, #peak_champion_32_pk.pos, L),
			       lists:keyfind(Pos2, #peak_champion_32_pk.pos, L))
     || {Pos1, Pos2} <- PosL].

do_champion_combat_check_(Group, State,
			  #peak_champion_32_pk{pos = Pos1, ret = 0,
					       max_power = Power1},
			  #peak_champion_32_pk{pos = Pos2, ret = 0,
					       max_power = Power2}) ->
    Result = util:if_true(Power1 >= Power2, 1, 2),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr1286, _,
       {__Levelarena_peak_champion_mgr1286,
	__Tracesarena_peak_champion_mgr1286}}
	  when __Levelarena_peak_champion_mgr1286 band 8 /= 0
		 orelse __Tracesarena_peak_champion_mgr1286 /= [] ->
	  lager:do_log(error,
		       [{module, arena_peak_champion_mgr},
			{function, do_champion_combat_check_}, {line, 1286},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("战斗异常结束，不能正常结算,group=~w, pos1=~w, pos2=~w, "
				     "power1=~w, power2=~w, ret=~w",
				     [Group, Pos1, Pos2, Power1, Power2,
				      Result]),
		       none, 4096, 8, __Levelarena_peak_champion_mgr1286,
		       __Tracesarena_peak_champion_mgr1286, lager_event,
		       __Pidarena_peak_champion_mgr1286);
      _ -> ok
    end,
    async_fun_combat_over(champion_fight, State, Result, [],
			  [], [], {champion, Group, Pos1, Pos2});
do_champion_combat_check_(_Group, _State, _R1, _R2) ->
    ok.

dec_combat_num() ->
    case put(combat_num, util:get(combat_num, 0) - 1) of
      1 ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr1295, _,
	     {__Levelarena_peak_champion_mgr1295,
	      __Tracesarena_peak_champion_mgr1295}}
		when __Levelarena_peak_champion_mgr1295 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr1295 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, dec_combat_num}, {line, 1295},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "战斗统计完成", none, 4096, 64,
			     __Levelarena_peak_champion_mgr1295,
			     __Tracesarena_peak_champion_mgr1295, lager_event,
			     __Pidarena_peak_champion_mgr1295);
	    _ -> ok
	  end,
	  util:set_ms_timer(save_data_timer, util:rand(1, 60000),
			    save_data),
	  util:set_ms_timer(combat_end_notify, 100,
			    {combat_end_notify, finish});
      _ -> pass
    end.

update_rank(ArenaRole = #arena_peak_champion_role{rank =
						      1 = Rank,
						  old_rank = OldRank,
						  id = RoleId, score = Score,
						  score_32 = Score32}) ->
    d_ets_lib:save_ets(arena_peak_champion_role, ArenaRole),
    ets:insert(arena_peak_champion_rank,
	       #arena_champion_rank{rank = Rank, old_rank = OldRank,
				    id = RoleId, score = Score,
				    score_32 = Score32});
update_rank(ArenaRole = #arena_peak_champion_role{rank =
						      Rank,
						  old_rank = OldRank,
						  score = Score,
						  score_32 = Score32,
						  id = RoleId}) ->
    case ets:lookup(arena_peak_champion_rank, Rank - 1) of
      [#arena_champion_rank{id = RoleId2, score = Score2,
			    score_32 = Score32_2, old_rank = OldRank2}]
	  when Score + Score32 > Score2 + Score32_2 orelse
		 Score + Score32 =:= Score2 + Score32_2 andalso
		   OldRank2 > OldRank ->
	  ets:insert(arena_peak_champion_rank,
		     #arena_champion_rank{rank = Rank, id = RoleId2,
					  old_rank = OldRank2, score = Score2,
					  score_32 = Score32_2}),
	  ets:update_element(arena_peak_champion_role, RoleId2,
			     {#arena_peak_champion_role.rank, Rank}),
	  update_rank(ArenaRole#arena_peak_champion_role{rank =
							     Rank - 1});
      _ ->
	  d_ets_lib:save_ets(arena_peak_champion_role, ArenaRole),
	  ets:insert(arena_peak_champion_rank,
		     #arena_champion_rank{rank = Rank, old_rank = OldRank,
					  id = RoleId, score = Score,
					  score_32 = Score32})
    end.

guess_stat(BaseVal, State) ->
    erase(guess_roleid),
    d_ets_lib:clear_d_ets(arena_peak_champion_ext,
			  guess_roleid),
    case arena_peak_champion_db:get_pk(get(guess_id)) of
      {ok, #peak_champion_pk{ret = Ret}} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr1322, _,
	     {__Levelarena_peak_champion_mgr1322,
	      __Tracesarena_peak_champion_mgr1322}}
		when __Levelarena_peak_champion_mgr1322 band 128 /= 0
		       orelse __Tracesarena_peak_champion_mgr1322 /= [] ->
		lager:do_log(debug,
			     [{module, arena_peak_champion_mgr},
			      {function, guess_stat}, {line, 1322},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("结算竞猜信息:guess_id=~w, a_bet=~w, b_bet=~w",
					   [get(guess_id), get(guess_a_bet),
					    get(guess_b_bet)]),
			     none, 4096, 128,
			     __Levelarena_peak_champion_mgr1322,
			     __Tracesarena_peak_champion_mgr1322, lager_event,
			     __Pidarena_peak_champion_mgr1322);
	    _ -> ok
	  end,
	  ABetRatio = calc_bet_ratio(get(guess_a_bet),
				     get(guess_b_bet)),
	  BBetRatio = calc_bet_ratio(get(guess_b_bet),
				     get(guess_a_bet)),
	  [do_guess_stat(I, Ret, BaseVal, ABetRatio, BBetRatio,
			 State)
	   || I <- get(guess_list)];
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr1327, _,
	     {__Levelarena_peak_champion_mgr1327,
	      __Tracesarena_peak_champion_mgr1327}}
		when __Levelarena_peak_champion_mgr1327 band 8 /= 0
		       orelse __Tracesarena_peak_champion_mgr1327 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_mgr},
			      {function, guess_stat}, {line, 1327},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("查找不到竞猜对象信息:~w", [get(guess_id)]),
			     none, 4096, 8, __Levelarena_peak_champion_mgr1327,
			     __Tracesarena_peak_champion_mgr1327, lager_event,
			     __Pidarena_peak_champion_mgr1327);
	    _ -> ok
	  end
    end.

do_guess_stat({RoleId, Target, Val}, Ret, BaseVal,
	      ABetRatio, BBetRatio,
	      #champion_state{step = Step, round = Round}) ->
    ValTime = util:if_true(Target =:= 1, ABetRatio,
			   BBetRatio),
    GetVal = util:if_true(Target =:= Ret,
			  round(Val * ValTime / 1000), 0),
    Bet = #champion_bet{bet = CanBet, logs = Logs} =
	      arena_peak_champion_db:get_bet(RoleId),
    Log = lists:keyfind(get(guess_id), #champion_bet_log.id,
			Logs),
    Log1 = Log#champion_bet_log{get_bet = GetVal},
    NewLogs = lists:keyreplace(get(guess_id),
			       #champion_bet_log.id, Logs, Log1),
    NewBet = Bet#champion_bet{bet = 0, logs = NewLogs},
    MailVal = CanBet + GetVal + BaseVal,
    GuessWinCount = length([win
			    || #champion_bet_log{get_bet = GetValTemp}
				   <- NewLogs,
			       GetValTemp > 0]),
    catch cluster_lib:cast(element(2, RoleId),
			   room_feat_mgr, info,
			   [{evt_peak_championships_bet_cont_win_season, RoleId,
			     GuessWinCount}]),
    case GetVal > 0 of
      true ->
	  Items = case
		    arena_peak_champion_data:get_constant(guess_reward)
		      of
		    ItemsT when is_list(ItemsT) -> [{38, MailVal} | ItemsT];
		    _ -> [{38, MailVal}]
		  end,
	  {MailAssets, MailItems} =
	      format:split_assets_items(Items),
	  mail:send(RoleId,
		    {lang:get(<<"Phần thưởng cá cược giải vô địch đỉnh "
				"cao"/utf8>>),
		     lang:get(<<"Gửi đến các Quý Nhẫn Giả: \nXin chúc "
				"mừng bạn đã đoán thành công trong vòng "
				"Giải vô địch Đỉnh cao này! Tất cả các "
				"đồng xu dự đoán chiến thắng đã được "
				"giải quyết dưới dạng đồng xu đỉnh cao, "
				"đồng thờiCó những phần thưởng bổ sung "
				"hào phóng, vui lòng kiểm tra chúng！"/utf8>>),
		     MailAssets, MailItems,
		     <<"Giải vô địch đỉnh cao"/utf8>>});
      _ -> skip
    end,
    d_ets_lib:save_d_ets(arena_peak_champion_bet, NewBet).

rank_reward(Rank, MaxNum) when Rank =< MaxNum ->
    case arena_peak_champion_data:rank_reward(Rank) of
      Items = [_ | _] ->
	  case arena_peak_champion_db:rank_role(Rank) of
	    {ok, #arena_peak_champion_role{id = {_, <<>>}}} -> pass;
	    {ok,
	     #arena_peak_champion_role{id = RoleId = {_, Sid}}} ->
		catch cluster_lib:cast(Sid, var, update_role_var_list,
				       [RoleId, other, [{min, 22, Rank}]]),
		catch cluster_lib:cast(Sid, room_feat_mgr, info,
				       [{arena_peak_champion_do_feat, RoleId,
					 Rank}]),
		case Rank > 0 andalso
		       Rank =<
			 arena_peak_champion_data:get_constant(hallowskin_reward_rank)
		    of
		  true ->
		      EndTime = date:unixtime() + 86400 * 28,
		      catch cluster_lib:cast(Sid, arena_peak_champion_mgr,
					     info,
					     [{sync_peak_local_hallows_look,
					       RoleId, Rank, EndTime}]),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidarena_peak_champion_mgr1379, _,
			 {__Levelarena_peak_champion_mgr1379,
			  __Tracesarena_peak_champion_mgr1379}}
			    when __Levelarena_peak_champion_mgr1379 band 64 /= 0
				   orelse
				   __Tracesarena_peak_champion_mgr1379 /= [] ->
			    lager:do_log(info,
					 [{module, arena_peak_champion_mgr},
					  {function, rank_reward}, {line, 1379},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~w领取了巅峰冠军赛~w名的幻化皮肤",
						       [RoleId, Rank]),
					 none, 4096, 64,
					 __Levelarena_peak_champion_mgr1379,
					 __Tracesarena_peak_champion_mgr1379,
					 lager_event,
					 __Pidarena_peak_champion_mgr1379);
			_ -> ok
		      end,
		      ok;
		  _ -> skip
		end,
		mail:send(RoleId,
			  {lang:get(<<"Phần thưởng mùa giải vô địch đỉnh cao"/utf8>>),
			   color:msg(lang:get(<<"Quý Nhẫn Giả thân mến: \n \nXin chúc "
						"mừng thứ hạng ~ts của bạn trong Giải "
						"vô địch đỉnh cao này. Đây là phần thưởng "
						"xếp hạng của bạn"/utf8>>),
				     [{binary, Rank}]),
			   items, Items, <<"Giải vô địch đỉnh cao"/utf8>>});
	    _ -> pass
	  end;
      _ -> pass
    end,
    rank_reward(Rank + 1, MaxNum);
rank_reward(_Rank, _MaxNum) -> pass.

save_result(Rank, MaxNum) when Rank =< MaxNum ->
    case arena_peak_champion_db:rank_role(Rank) of
      {ok, #arena_peak_champion_role{id = {_, <<>>}}} -> pass;
      {ok,
       #arena_peak_champion_role{id = RoleId,
				 combat_num = CNum, win = Win}} ->
	  d_ets_lib:save_d_ets(arena_peak_champion_result,
			       #champion_result{id = RoleId, rank = Rank,
						cnum = CNum, win = Win});
      _ -> pass
    end,
    save_result(Rank + 1, MaxNum);
save_result(_Rank, _MaxNum) -> pass.

mail_bet() ->
    [do_mail_bet(I)
     || I <- ets:tab2list(arena_peak_champion_bet)],
    dets:insert(arena_peak_champion_bet,
		ets:tab2list(arena_peak_champion_bet)).

do_mail_bet(#champion_bet{id = RoleId, bet = Bet})
    when Bet > 0 ->
    ets:update_element(arena_peak_champion_bet, RoleId,
		       {#champion_bet.bet, 0});
do_mail_bet(_) -> ok.

async_fun_combat_over(score_fight,
		      #champion_state{round = Round}, Result, ReplayLists,
		      AStatInfo, BStatInfo, {score, Id, Name}) ->
    dec_combat_num(),
    d_ets_lib:save_d_ets(arena_peak_champion_replay,
			 [{ReplayId} || {_, _, ReplayId} <- ReplayLists]),
    case arena_peak_champion_db:get_role(Id) of
      {ok,
       R = #arena_peak_champion_role{robot_id = RobotId,
				     score = Score, win = Win,
				     combat_num = CombatNum}}
	  when Result =:= 1 ->
	  #{score := AddScoreT} =
	      arena_peak_champion_data:get_score_match({Round, 1}),
	  AddScore = util:if_true(RobotId == 0, AddScoreT,
				  round(AddScoreT *
					  arena_peak_champion_data:get_constant(robot_win_score)
					  * 1.0e-3)),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr1424, _,
	     {__Levelarena_peak_champion_mgr1424,
	      __Tracesarena_peak_champion_mgr1424}}
		when __Levelarena_peak_champion_mgr1424 band 128 /= 0
		       orelse __Tracesarena_peak_champion_mgr1424 /= [] ->
		lager:do_log(debug,
			     [{module, arena_peak_champion_mgr},
			      {function, async_fun_combat_over}, {line, 1424},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("对战结束 AddScore:~w, RobotId:~w, AddScoreT:~w, "
					   "robot_win_score:~w, ~w",
					   [AddScore, RobotId, AddScoreT,
					    arena_peak_champion_data:get_constant(robot_win_score),
					    round(AddScoreT *
						    arena_peak_champion_data:get_constant(robot_win_score)
						    * 1.0e-3)]),
			     none, 4096, 128,
			     __Levelarena_peak_champion_mgr1424,
			     __Tracesarena_peak_champion_mgr1424, lager_event,
			     __Pidarena_peak_champion_mgr1424);
	    _ -> ok
	  end,
	  update_pk_ret_info(Id, 1, ReplayLists, 0, AStatInfo,
			     BStatInfo, AddScore),
	  update_rank(R#arena_peak_champion_role{score =
						     Score + AddScore,
						 win = Win + 1,
						 combat_num = CombatNum + 1});
      {ok, _R} ->
	  ets:update_counter(arena_peak_champion_role, Id,
			     [{#arena_peak_champion_role.combat_num, 1},
			      {#arena_peak_champion_role.lose, 1}]),
	  update_pk_ret_info(Id, 2, ReplayLists, 0, AStatInfo,
			     BStatInfo, 0),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr1430, _,
	     {__Levelarena_peak_champion_mgr1430,
	      __Tracesarena_peak_champion_mgr1430}}
		when __Levelarena_peak_champion_mgr1430 band 128 /= 0
		       orelse __Tracesarena_peak_champion_mgr1430 /= [] ->
		lager:do_log(debug,
			     [{module, arena_peak_champion_mgr},
			      {function, async_fun_combat_over}, {line, 1430},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("战斗结束:~w", [Id]), none, 4096, 128,
			     __Levelarena_peak_champion_mgr1430,
			     __Tracesarena_peak_champion_mgr1430, lager_event,
			     __Pidarena_peak_champion_mgr1430);
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
	    {__Pidarena_peak_champion_mgr1432, _,
	     {__Levelarena_peak_champion_mgr1432,
	      __Tracesarena_peak_champion_mgr1432}}
		when __Levelarena_peak_champion_mgr1432 band 64 /= 0
		       orelse __Tracesarena_peak_champion_mgr1432 /= [] ->
		lager:do_log(info,
			     [{module, arena_peak_champion_mgr},
			      {function, async_fun_combat_over}, {line, 1432},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("战斗结束,查找不到参赛成员信息:~w, ~ts",
					   [Id, Name]),
			     none, 4096, 64, __Levelarena_peak_champion_mgr1432,
			     __Tracesarena_peak_champion_mgr1432, lager_event,
			     __Pidarena_peak_champion_mgr1432);
	    _ -> ok
	  end
    end;
async_fun_combat_over(champion_fight,
		      #champion_state{step = 8}, Result, ReplayLists,
		      AStatInfo, BStatInfo, {champion, Group, Pos1, Pos2}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr1435, _,
       {__Levelarena_peak_champion_mgr1435,
	__Tracesarena_peak_champion_mgr1435}}
	  when __Levelarena_peak_champion_mgr1435 band 128 /= 0
		 orelse __Tracesarena_peak_champion_mgr1435 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_peak_champion_mgr},
			{function, async_fun_combat_over}, {line, 1435},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("4强对战结束 pos1:~w, pos2:~w, ret:~w",
				     [Pos1, Pos2, Result]),
		       none, 4096, 128, __Levelarena_peak_champion_mgr1435,
		       __Tracesarena_peak_champion_mgr1435, lager_event,
		       __Pidarena_peak_champion_mgr1435);
      _ -> ok
    end,
    dec_combat_num(),
    L = arena_peak_champion_db:get_ext(champion_4_temp, []),
    PK1 = #peak_champion_32_pk{id = Id1} =
	      lists:keyfind(Pos1, #peak_champion_32_pk.pos, L),
    PK2 = #peak_champion_32_pk{id = Id2} =
	      lists:keyfind(Pos2, #peak_champion_32_pk.pos, L),
    d_ets_lib:save_d_ets(arena_peak_champion_replay,
			 [{ReplayId} || {_, _, ReplayId} <- ReplayLists]),
    NewPos = case Pos1 of
	       1 -> 9;
	       3 -> 10;
	       5 -> 11;
	       7 -> 12;
	       9 -> 13;
	       11 -> 13;
	       10 -> 14;
	       12 -> 14;
	       13 -> 15;
	       14 -> 15
	     end,
    BReplayLists = [R#arena_peak_result_info{ret =
						 util:if_true(Temp == 2, 1, 2),
					     a_end_hp = BTemp, b_end_hp = ATemp}
		    || R = #arena_peak_result_info{ret = Temp,
						   a_end_hp = ATemp,
						   b_end_hp = BTemp}
			   <- ReplayLists],
    {NewPK1, NewPK2, NewPK} = case Result of
				1 ->
				    update_pk_ret_info(Id1, 1, ReplayLists,
						       10000 + Group * 1000 +
							 NewPos,
						       AStatInfo, BStatInfo, 0),
				    update_pk_ret_info(Id2, 2, BReplayLists, 0,
						       BStatInfo, AStatInfo, 0),
				    {ok,
				     R1 = #arena_peak_champion_role{score_32 =
									Score1,
								    win = Win,
								    combat_num =
									CombatNum}} =
					arena_peak_champion_db:get_role(Id1),
				    update_rank(R1#arena_peak_champion_role{score_32
										=
										Score1
										  +
										  10000,
									    win
										=
										Win
										  +
										  1,
									    combat_num
										=
										CombatNum
										  +
										  1}),
				    ets:update_counter(arena_peak_champion_role,
						       Id2,
						       [{#arena_peak_champion_role.combat_num,
							 1},
							{#arena_peak_champion_role.lose,
							 1}]),
				    {PK1#peak_champion_32_pk{ret = 1},
				     PK2#peak_champion_32_pk{ret = 2}, PK1};
				_ ->
				    update_pk_ret_info(Id1, 2, ReplayLists,
						       10000 + Group * 1000 +
							 NewPos,
						       AStatInfo, BStatInfo, 0),
				    update_pk_ret_info(Id2, 1, BReplayLists, 0,
						       BStatInfo, AStatInfo, 0),
				    {ok,
				     R2 = #arena_peak_champion_role{score_32 =
									Score2,
								    win = Win2,
								    combat_num =
									CombatNum2}} =
					arena_peak_champion_db:get_role(Id2),
				    update_rank(R2#arena_peak_champion_role{score_32
										=
										Score2
										  +
										  10000,
									    win
										=
										Win2
										  +
										  1,
									    combat_num
										=
										CombatNum2
										  +
										  1}),
				    ets:update_counter(arena_peak_champion_role,
						       Id1,
						       [{#arena_peak_champion_role.combat_num,
							 1},
							{#arena_peak_champion_role.lose,
							 1}]),
				    {PK1#peak_champion_32_pk{ret = 2},
				     PK2#peak_champion_32_pk{ret = 1}, PK2}
			      end,
    L1 = lists:keyreplace(Pos1, #peak_champion_32_pk.pos, L,
			  NewPK1),
    L2 = lists:keyreplace(Pos2, #peak_champion_32_pk.pos,
			  L1, NewPK2),
    L3 = [NewPK#peak_champion_32_pk{pos = NewPos} | L2],
    d_ets_lib:save_d_ets(arena_peak_champion_ext,
			 {champion_4_temp, L3});
async_fun_combat_over(champion_fight,
		      #champion_state{step = 64}, Result, ReplayLists,
		      AStatInfo, BStatInfo, {champion, Group, Pos1, Pos2}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr1487, _,
       {__Levelarena_peak_champion_mgr1487,
	__Tracesarena_peak_champion_mgr1487}}
	  when __Levelarena_peak_champion_mgr1487 band 128 /= 0
		 orelse __Tracesarena_peak_champion_mgr1487 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_peak_champion_mgr},
			{function, async_fun_combat_over}, {line, 1487},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("64强对战结束 group:~w, pos1:~w, pos2:~w, "
				     "ret:~w",
				     [Group, Pos1, Pos2, Result]),
		       none, 4096, 128, __Levelarena_peak_champion_mgr1487,
		       __Tracesarena_peak_champion_mgr1487, lager_event,
		       __Pidarena_peak_champion_mgr1487);
      _ -> ok
    end,
    dec_combat_num(),
    L = arena_peak_champion_db:get_ext({champion_64_temp,
					Group},
				       []),
    PK1 = #peak_champion_32_pk{id = Id1} =
	      lists:keyfind(Pos1, #peak_champion_32_pk.pos, L),
    PK2 = #peak_champion_32_pk{id = Id2} =
	      lists:keyfind(Pos2, #peak_champion_32_pk.pos, L),
    d_ets_lib:save_d_ets(arena_peak_champion_replay,
			 [{ReplayId} || {_, _, ReplayId} <- ReplayLists]),
    NewPos = case Pos1 of
	       1 -> 9;
	       3 -> 10;
	       5 -> 11;
	       7 -> 12;
	       9 -> 13;
	       11 -> 13;
	       10 -> 14;
	       12 -> 14;
	       13 -> 15;
	       14 -> 15
	     end,
    BReplayLists = [R#arena_peak_result_info{ret =
						 util:if_true(Temp == 2, 1, 2),
					     a_end_hp = BTemp, b_end_hp = ATemp}
		    || R = #arena_peak_result_info{ret = Temp,
						   a_end_hp = ATemp,
						   b_end_hp = BTemp}
			   <- ReplayLists],
    {NewPK1, NewPK2, NewPK} = case Result of
				1 ->
				    update_pk_ret_info(Id1, 1, ReplayLists,
						       100000 + Group * 1000 +
							 NewPos,
						       AStatInfo, BStatInfo, 0),
				    update_pk_ret_info(Id2, 2, BReplayLists, 0,
						       BStatInfo, AStatInfo, 0),
				    {ok,
				     R1 = #arena_peak_champion_role{score_32 =
									Score1,
								    win = Win,
								    combat_num =
									CombatNum}} =
					arena_peak_champion_db:get_role(Id1),
				    update_rank(R1#arena_peak_champion_role{score_32
										=
										Score1
										  +
										  10000,
									    win
										=
										Win
										  +
										  1,
									    combat_num
										=
										CombatNum
										  +
										  1}),
				    ets:update_counter(arena_peak_champion_role,
						       Id2,
						       [{#arena_peak_champion_role.combat_num,
							 1},
							{#arena_peak_champion_role.lose,
							 1}]),
				    {PK1#peak_champion_32_pk{ret = 1},
				     PK2#peak_champion_32_pk{ret = 2}, PK1};
				_ ->
				    update_pk_ret_info(Id1, 2, ReplayLists,
						       100000 + Group * 1000 +
							 NewPos,
						       AStatInfo, BStatInfo, 0),
				    update_pk_ret_info(Id2, 1, BReplayLists, 0,
						       BStatInfo, AStatInfo, 0),
				    {ok,
				     R2 = #arena_peak_champion_role{score_32 =
									Score2,
								    win = Win2,
								    combat_num =
									CombetNum2}} =
					arena_peak_champion_db:get_role(Id2),
				    update_rank(R2#arena_peak_champion_role{score_32
										=
										Score2
										  +
										  10000,
									    win
										=
										Win2
										  +
										  1,
									    combat_num
										=
										CombetNum2
										  +
										  1}),
				    ets:update_counter(arena_peak_champion_role,
						       Id1,
						       [{#arena_peak_champion_role.combat_num,
							 1},
							{#arena_peak_champion_role.lose,
							 1}]),
				    {PK1#peak_champion_32_pk{ret = 2},
				     PK2#peak_champion_32_pk{ret = 1}, PK2}
			      end,
    L1 = lists:keyreplace(Pos1, #peak_champion_32_pk.pos, L,
			  NewPK1),
    L2 = lists:keyreplace(Pos2, #peak_champion_32_pk.pos,
			  L1, NewPK2),
    L3 = [NewPK#peak_champion_32_pk{pos = NewPos} | L2],
    d_ets_lib:save_d_ets(arena_peak_champion_ext,
			 {{champion_64_temp, Group}, L3});
async_fun_combat_over(champion_fight, #champion_state{},
		      Result, ReplayLists, AStatInfo, BStatInfo,
		      {champion, Group, Pos1, Pos2}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr1534, _,
       {__Levelarena_peak_champion_mgr1534,
	__Tracesarena_peak_champion_mgr1534}}
	  when __Levelarena_peak_champion_mgr1534 band 128 /= 0
		 orelse __Tracesarena_peak_champion_mgr1534 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_peak_champion_mgr},
			{function, async_fun_combat_over}, {line, 1534},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("256强对战结束 group:~w, pos1:~w, pos2:~w, "
				     "ret:~w",
				     [Group, Pos1, Pos2, Result]),
		       none, 4096, 128, __Levelarena_peak_champion_mgr1534,
		       __Tracesarena_peak_champion_mgr1534, lager_event,
		       __Pidarena_peak_champion_mgr1534);
      _ -> ok
    end,
    dec_combat_num(),
    L = arena_peak_champion_db:get_ext({champion_256_temp,
					Group},
				       []),
    PK1 = #peak_champion_32_pk{id = Id1} =
	      lists:keyfind(Pos1, #peak_champion_32_pk.pos, L),
    PK2 = #peak_champion_32_pk{id = Id2} =
	      lists:keyfind(Pos2, #peak_champion_32_pk.pos, L),
    d_ets_lib:save_d_ets(arena_peak_champion_replay,
			 [{ReplayId} || {_, _, ReplayId} <- ReplayLists]),
    NewPos = case Pos1 of
	       1 -> 17;
	       3 -> 18;
	       5 -> 19;
	       7 -> 20;
	       9 -> 21;
	       11 -> 22;
	       13 -> 23;
	       15 -> 24;
	       17 -> 25;
	       18 -> 26;
	       19 -> 27;
	       20 -> 28
	     end,
    BReplayLists = [R#arena_peak_result_info{ret =
						 util:if_true(Temp == 2, 1, 2),
					     a_end_hp = BTemp, b_end_hp = ATemp}
		    || R = #arena_peak_result_info{ret = Temp,
						   a_end_hp = ATemp,
						   b_end_hp = BTemp}
			   <- ReplayLists],
    {NewPK1, NewPK2, NewPK} = case Result of
				1 ->
				    update_pk_ret_info(Id1, 1, ReplayLists,
						       1000000 + Group * 1000 +
							 NewPos,
						       AStatInfo, BStatInfo, 0),
				    update_pk_ret_info(Id2, 2, BReplayLists, 0,
						       BStatInfo, AStatInfo, 0),
				    {ok,
				     R1 = #arena_peak_champion_role{score_32 =
									Score1,
								    win = Win,
								    combat_num =
									CombatNum}} =
					arena_peak_champion_db:get_role(Id1),
				    update_rank(R1#arena_peak_champion_role{score_32
										=
										Score1
										  +
										  10000,
									    win
										=
										Win
										  +
										  1,
									    combat_num
										=
										CombatNum
										  +
										  1}),
				    ets:update_counter(arena_peak_champion_role,
						       Id2,
						       [{#arena_peak_champion_role.combat_num,
							 1},
							{#arena_peak_champion_role.lose,
							 1}]),
				    {PK1#peak_champion_32_pk{ret = 1},
				     PK2#peak_champion_32_pk{ret = 2}, PK1};
				_ ->
				    update_pk_ret_info(Id1, 2, ReplayLists,
						       1000000 + Group * 1000 +
							 NewPos,
						       AStatInfo, BStatInfo, 0),
				    update_pk_ret_info(Id2, 1, BReplayLists, 0,
						       BStatInfo, AStatInfo, 0),
				    {ok,
				     R2 = #arena_peak_champion_role{score_32 =
									Score2,
								    win = Win2,
								    combat_num =
									CombetNum2}} =
					arena_peak_champion_db:get_role(Id2),
				    update_rank(R2#arena_peak_champion_role{score_32
										=
										Score2
										  +
										  10000,
									    win
										=
										Win2
										  +
										  1,
									    combat_num
										=
										CombetNum2
										  +
										  1}),
				    ets:update_counter(arena_peak_champion_role,
						       Id1,
						       [{#arena_peak_champion_role.combat_num,
							 1},
							{#arena_peak_champion_role.lose,
							 1}]),
				    {PK1#peak_champion_32_pk{ret = 2},
				     PK2#peak_champion_32_pk{ret = 1}, PK2}
			      end,
    L1 = lists:keyreplace(Pos1, #peak_champion_32_pk.pos, L,
			  NewPK1),
    L2 = lists:keyreplace(Pos2, #peak_champion_32_pk.pos,
			  L1, NewPK2),
    L3 = [NewPK#peak_champion_32_pk{pos = NewPos} | L2],
    d_ets_lib:save_d_ets(arena_peak_champion_ext,
			 {{champion_256_temp, Group}, L3});
async_fun_combat_over(_StateName, _ChampionState,
		      _Result, _ReplayLists, _AStatInfo, _BStatInfo, _Arg) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr1583, _,
       {__Levelarena_peak_champion_mgr1583,
	__Tracesarena_peak_champion_mgr1583}}
	  when __Levelarena_peak_champion_mgr1583 band 8 /= 0
		 orelse __Tracesarena_peak_champion_mgr1583 /= [] ->
	  lager:do_log(error,
		       [{module, arena_peak_champion_mgr},
			{function, async_fun_combat_over}, {line, 1583},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("战斗结束处理失败，state_name=~w, _Arg:~w",
				     [_StateName, _Arg]),
		       none, 4096, 8, __Levelarena_peak_champion_mgr1583,
		       __Tracesarena_peak_champion_mgr1583, lager_event,
		       __Pidarena_peak_champion_mgr1583);
      _ -> ok
    end.

update_pk_ret_info(Id, Ret, ReplayLists, CopyId,
		   AStatInfo, BStatInfo, GetScore) ->
    case arena_peak_champion_db:get_pk(Id) of
      {ok,
       PK = #peak_champion_pk{a_defense = APList,
			      b_defense = BPList}} ->
	  NewAPList = merge_partner_combat_info(APList, AStatInfo,
						[]),
	  NewBPList = merge_partner_combat_info(BPList, BStatInfo,
						[]),
	  PK1 = PK#peak_champion_pk{score = GetScore, ret = Ret,
				    result_info = ReplayLists,
				    a_defense = NewAPList,
				    b_defense = NewBPList},
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_peak_champion_mgr1592, _,
	     {__Levelarena_peak_champion_mgr1592,
	      __Tracesarena_peak_champion_mgr1592}}
		when __Levelarena_peak_champion_mgr1592 band 128 /= 0
		       orelse __Tracesarena_peak_champion_mgr1592 /= [] ->
		lager:do_log(debug,
			     [{module, arena_peak_champion_mgr},
			      {function, update_pk_ret_info}, {line, 1592},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("更新PK结果信息:id:~w, ret=~w, replay_id=~w, "
					   "copy_id=~w",
					   [Id, Ret, ReplayLists, CopyId]),
			     none, 4096, 128,
			     __Levelarena_peak_champion_mgr1592,
			     __Tracesarena_peak_champion_mgr1592, lager_event,
			     __Pidarena_peak_champion_mgr1592);
	    _ -> ok
	  end,
	  case Id of
	    {_, <<>>} -> ets:delete(arena_peak_champion_pk, Id);
	    _ ->
		Log = #champion_role_log{logs = Logs} =
			  arena_peak_champion_db:get_log(Id),
		N = length(Logs) + 1,
		NewLog = Log#champion_role_log{logs = [N | Logs]},
		d_ets_lib:save_ets(arena_peak_champion_role_log,
				   NewLog),
		d_ets_lib:save_ets(arena_peak_champion_pk,
				   PK1#peak_champion_pk{id = {Id, N}}),
		d_ets_lib:save_ets(arena_peak_champion_pk, PK1)
	  end,
	  case Id =:= get(guess_roleid) of
	    true ->
		d_ets_lib:save_d_ets(arena_peak_champion_ext,
				     {guess_id, [get(guess_id)]}),
		d_ets_lib:save_ets(arena_peak_champion_pk,
				   PK1#peak_champion_pk{id = get(guess_id)});
	    _ -> pass
	  end,
	  case CopyId > 0 of
	    true ->
		d_ets_lib:save_ets(arena_peak_champion_pk,
				   PK1#peak_champion_pk{id = CopyId});
	    _ -> pass
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
	    {__Pidarena_peak_champion_mgr1618, _,
	     {__Levelarena_peak_champion_mgr1618,
	      __Tracesarena_peak_champion_mgr1618}}
		when __Levelarena_peak_champion_mgr1618 band 8 /= 0
		       orelse __Tracesarena_peak_champion_mgr1618 /= [] ->
		lager:do_log(error,
			     [{module, arena_peak_champion_mgr},
			      {function, update_pk_ret_info}, {line, 1618},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("更新PK结果失败:~w", [Id]), none, 4096, 8,
			     __Levelarena_peak_champion_mgr1618,
			     __Tracesarena_peak_champion_mgr1618, lager_event,
			     __Pidarena_peak_champion_mgr1618);
	    _ -> ok
	  end
    end.

merge_partner_combat_info([], _, List) ->
    lists:reverse(List);
merge_partner_combat_info([P =
			       #arena_peak_role_defense{plist = PList}
			   | T],
			  StatInfo, List) ->
    NewPList = [merge_partner_combat_info(PT, StatInfo)
		|| PT <- PList],
    merge_partner_combat_info(T, StatInfo,
			      [P#arena_peak_role_defense{plist = NewPList}
			       | List]).

merge_partner_combat_info(P =
			      #arena_peak_role_partner{id = Id},
			  StatInfo) ->
    case maps_util:keyfind(StatInfo, object_id, Id) of
      {ok,
       #{hurt := Hurt, curt := Curt, be_hurt := BeHurt}} ->
	  P#arena_peak_role_partner{hurt = Hurt, curt = Curt,
				    behurt = BeHurt};
      _ ->
	  P#arena_peak_role_partner{hurt = 0, curt = 0,
				    behurt = 0}
    end.

move_ets_to_new_main(EtsName, NewMainSrvId) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr1639, _,
       {__Levelarena_peak_champion_mgr1639,
	__Tracesarena_peak_champion_mgr1639}}
	  when __Levelarena_peak_champion_mgr1639 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr1639 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, move_ets_to_new_main}, {line, 1639},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("名字~w 开始时间 ~w",
				     [EtsName, date:unixtime(ms)]),
		       none, 4096, 64, __Levelarena_peak_champion_mgr1639,
		       __Tracesarena_peak_champion_mgr1639, lager_event,
		       __Pidarena_peak_champion_mgr1639);
      _ -> ok
    end,
    L = ets:tab2list(EtsName),
    move_ets_to_new_main(L, EtsName, NewMainSrvId),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_peak_champion_mgr1642, _,
       {__Levelarena_peak_champion_mgr1642,
	__Tracesarena_peak_champion_mgr1642}}
	  when __Levelarena_peak_champion_mgr1642 band 64 /= 0
		 orelse __Tracesarena_peak_champion_mgr1642 /= [] ->
	  lager:do_log(info,
		       [{module, arena_peak_champion_mgr},
			{function, move_ets_to_new_main}, {line, 1642},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("名字~w 结束时间 ~w",
				     [EtsName, date:unixtime(ms)]),
		       none, 4096, 64, __Levelarena_peak_champion_mgr1642,
		       __Tracesarena_peak_champion_mgr1642, lager_event,
		       __Pidarena_peak_champion_mgr1642);
      _ -> ok
    end,
    ok.

move_ets_to_new_main([], _EtsName, _NewMainSrvId) -> ok;
move_ets_to_new_main(List, EtsName, NewMainSrvId) ->
    {MoveList, NextMoveList} = list_util:split(50, List),
    cluster_lib:cast(NewMainSrvId, d_ets_lib, save_d_ets,
		     [EtsName, MoveList]),
    move_ets_to_new_main(NextMoveList, EtsName,
			 NewMainSrvId).


