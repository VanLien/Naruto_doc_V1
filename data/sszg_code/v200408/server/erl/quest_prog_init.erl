-file("src/mod/quest/quest_prog_init.erl", 1).

-module(quest_prog_init).

-lager_records([{m_home_pet,
		 [ver, name, id, rename_count, state, calc_time,
		  start_time, end_time, vigor, vigor_time, set_item,
		  next_evt_id, city, evt_list, do_evts, acc_evts,
		  fire_time, acc_out_time, acc_out_count, acc_items,
		  photos, diarys, day_talk, day_feed, photos_next_id,
		  diarys_next_id, photos_had]},
		{m_holiday_boss,
		 [ver, camp_id, count, buy_count, order_id, score,
		  boss_hp, boss_score, awards, old_info]},
		{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
		{grow_data,
		 [ver, day, goal_id, status, condition, lev, progress,
		  target_type]},
		{m_day_goals,
		 [ver, end_time, num, welfare_list, grow_list,
		  price_list, finish_list, period, charge, old_data,
		  period_day, new_grow_list, lev_reward, old_data2]},
		{expedition_replay_partner, [pos, bid, lev, star, ext]},
		{expedition_replay,
		 [id, round, ret, time, difficulty, guard_id, a_id,
		  a_name, a_lev, a_power, a_formation_type, a_end_hp,
		  b_id, b_name, b_lev, b_power, b_formation_type,
		  b_end_hp, a_plist, b_plist, ext]},
		{expedition_log, [id, list]},
		{expedition_employ_p,
		 [id, bid, lev, star, quality, break_lev, power, num,
		  ext]},
		{expedition_employ, [rid, rname, num, list]},
		{expedition_f_pos,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, ext]},
		{expedition_f,
		 [id, type, robot_id, role_id, name, lev, face, power,
		  hallows_id, formation_type, items, guards, partner_hp,
		  status]},
		{m_expedition,
		 [ver, guard_id, partner_hp, list, employ, appoint,
		  difficulty, max_difficulty, last_join_time,
		  last_difficulty, max_power]},
		{hallows_look_data,
		 [id, name, attr, is_item, time, loss]},
		{hallows_looks, [ver, id, endtime, eqm_hallows]},
		{hallows_quest_data, [id, hid, items, progress]},
		{hallows_data,
		 [id, step, name, attr, loss, max_lucky, clear_limit,
		  clear_time, reward, notice, open_desc, skill_order]},
		{hallows_skill, [ver, pos, lev, skill_bid, attr]},
		{hallows,
		 [ver, id, step, lucky, lucky_endtime, power, base_attr,
		  add_attr, eqm, skill, seal, reward, rebirth_loss,
		  is_notice, look_id, refine_lev]},
		{m_hallows,
		 [ver, hallows_list, all_lv, attr_list, quest_list,
		  look_list, look_quest_list]},
		{guild_quest_lev_data, [lev, exp, items, attr]},
		{guild_quest_data, [id, name, type, exp, progress]},
		{m_guild_quest,
		 [ver, lev, exp, day_exp, week_exp, list]},
		{endless_robot_data,
		 [id, bid, rname, group_id, unit_id, lev, star, quality,
		  power]},
		{endless_employ,
		 [id, rid, rname, bid, plev, star, quality, break_lev,
		  power, num, ext]},
		{endless_data,
		 [type, id, name, lev, unit_ids, is_reset, formation]},
		{new_endless,
		 [ver, type, max_id, ext_reward, day_begin, day_pass,
		  ext]},
		{m_endless,
		 [ver, r_id, max_id, ext_reward, day_begin, day_pass,
		  day_reward, employ, appoint, type, select_type,
		  new_endless_list, ext, flag]},
		{adventure_data, [id, room, name, lose]},
		{a_room,
		 [id, idx, evt_id, res_id, status, cond_status, lock,
		  init_evt_id, ext]},
		{m_adventure,
		 [ver, pass_id, pass_num, explore_num, id, room,
		  first_room, boss_room, room_list, buff_list, shop_list,
		  start_time, end_time, plist, is_kill_boss, init_time,
		  skill_list, bag_list, map_id, partner_id, skill_used,
		  round_reward, round_evt_group, kill_mon,
		  mine_combat_num, mine_round_combat, mine_round_reward,
		  current_id, mine_buy_count, init_id, laste_num]},
		{login,
		 [login_time, logout_time, prev_logout_time,
		  prev_login_time, log_login_time]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{m_star, [ver, star_list, fetter_list, all_attr]},
		{star_tower_replay, [tower, replays]},
		{tower_replay_data,
		 [type, rid, sid, name, face_id, time, power, repaly_id,
		  face_update_time, face_file]},
		{m_star_divination,
		 [ver, luck, quality, all_count, flag, ref_count,
		  day_gold_count, day_hun_count]},
		{m_star_tower, [ver, max_tower, award_list]},
		{star,
		 [ver, set_id, break_lev, lev, natals, add_attr,
		  fetter_attr, set_skill_id, power]},
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
		{drama_quest_unit,
		 [label, id, base_id, type, pos, dir, act_type,
		  is_rand_pos]},
		{drama_play,
		 [id, act_type, label, base_id, map_bid, x, y, type, val,
		  name, desc]},
		{drama_obj,
		 [id, name, base_id, type, minor_type, map_bid, x, y,
		  dir, act_type, looks, status, quest_id, quest_prog_id,
		  sex, career]},
		{drama_data,
		 [bid, name, lev, is_open, is_skip, num, event, act_cond,
		  act, condition, offline]},
		{drama, [id, act_idx, num]},
		{m_drama,
		 [ver, finished, play_list, do_list, combat_list,
		  obj_list, guide_list, finish_guide]},
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
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{pos,
		 [ver, srv_id, map_id, map_pid, map_bid, map_grid_pid,
		  last, hidden, x, y, dir]},
		{pos_history, [map_id, map_bid, srv_id, x, y]},
		{quest_stats, [type, stats, desc]},
		{quest_progress,
		 [id, label, target, param, finish, trigger, target_val,
		  value, msg, ext_data, dyn_ext_data]},
		{quest,
		 [id, name, type, finish, quality, progress, accept_time,
		  end_time, finish_time, round]},
		{m_quest,
		 [ver, quest, acceptable, finished, daily_finished]},
		{quest_data,
		 [id, type, name, phase, can_giveup, lev, max_lev,
		  career, pre_quest, suffix_quest, start_time, end_time,
		  condition, progress, accept_rewards, commit_rewards,
		  commit_loss, commit_type, times, desc, group, layer,
		  dungeon_id, is_auto_finished_gain, auto_accept,
		  weekdays, white_list, black_list, extra, val_from_prev,
		  hide]},
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

-export([do/3, update/3]).

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

-file("src/mod/quest/quest_prog_init.erl", 12).

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

-file("src/mod/quest/quest_prog_init.erl", 13).

-file("inc/quest.hrl", 1).

-record(quest_data,
	{id = 1  :: pos_integer(), type = 1  :: pos_integer(),
	 name = <<>>  :: binary(),
	 phase = 0  :: non_neg_integer(),
	 can_giveup = 0  :: 0..1, lev = 1  :: pos_integer(),
	 max_lev = 0  :: non_neg_integer(), career = 0  :: 0..4,
	 pre_quest  ::
	     undefined | non_neg_integer() | [non_neg_integer()],
	 suffix_quest = 0  :: non_neg_integer(),
	 start_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 end_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 condition = []  :: [tuple()],
	 progress = []  :: [tuple()],
	 accept_rewards = []  :: [tuple()],
	 commit_rewards = []  :: [tuple()],
	 commit_loss = []  :: [tuple()],
	 commit_type = 1  :: pos_integer(),
	 times = 1  :: non_neg_integer(), desc = <<>>  :: list(),
	 group = 0, layer = 0, dungeon_id = 0,
	 is_auto_finished_gain = 0, auto_accept = 0  :: 0..1,
	 weekdays = []  :: [pos_integer()],
	 white_list = []  :: list(), black_list = []  :: list(),
	 extra = [], val_from_prev = 0  :: 0 | 1,
	 hide = 0  :: 0 | 1}).

-record(m_quest,
	{ver = 1, quest = []  :: list(),
	 acceptable = []  :: list(), finished = []  :: list(),
	 daily_finished = []}).

-record(quest,
	{id = 1  :: pos_integer(), name = <<>>  :: binary(),
	 type = 1  :: pos_integer(), finish = 0  :: 0..2,
	 quality = 0  :: 0..4, progress = []  :: [tuple()],
	 accept_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 finish_time = 0  :: non_neg_integer(),
	 round = 0  :: non_neg_integer()}).

-record(quest_progress,
	{id = 0  :: non_neg_integer(), label  :: atom(),
	 target = 0  :: non_neg_integer(), param = []  :: list(),
	 finish = 0  :: 0..1, trigger  :: undefined | tuple(),
	 target_val = 1  :: pos_integer(),
	 value = 0  :: non_neg_integer(),
	 msg = <<>>  :: bitstring() | string(),
	 ext_data = []  :: [tuple()],
	 dyn_ext_data = []  :: [tuple()]}).

-record(quest_stats, {type = 1, stats = [], desc = []}).

-file("src/mod/quest/quest_prog_init.erl", 14).

-file("inc/pos.hrl", 1).

-record(pos_history,
	{map_id = 0  :: non_neg_integer(),
	 map_bid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer()}).

-record(pos,
	{ver = 2, srv_id = <<>>  :: bitstring(),
	 map_id = {0, <<>>}, map_pid = 0, map_bid = 0,
	 map_grid_pid = 0, last, hidden = 0, x = 0, y = 0,
	 dir = 5}).

-file("src/mod/quest/quest_prog_init.erl", 15).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("src/mod/quest/quest_prog_init.erl", 16).

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

-file("src/mod/quest/quest_prog_init.erl", 17).

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

-file("src/mod/quest/quest_prog_init.erl", 18).

-file("inc/drama.hrl", 1).

-record(m_drama,
	{ver = 1, finished = []  :: [pos_integer()],
	 play_list = []  :: [pos_integer()],
	 do_list = []  :: [tuple()],
	 combat_list = []  :: [tuple()], obj_list = [],
	 guide_list = []  :: [pos_integer()],
	 finish_guide = []  :: list()}).

-record(drama, {id = 0, act_idx = 0, num = 0}).

-record(drama_data,
	{bid = 0, name = <<>>, lev = 0, is_open = 0,
	 is_skip = 0, num = 1, event, act_cond = [], act = [],
	 condition = [], offline = 1}).

-record(drama_obj,
	{id = 0, name = <<>>  :: binary(),
	 base_id = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(), minor_type = 0,
	 map_bid = 0  :: non_neg_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 dir = 0  :: non_neg_integer(),
	 act_type = ""  :: bitstring(), looks = []  :: [tuple()],
	 status = 0  :: non_neg_integer(),
	 quest_id = 0  :: non_neg_integer(),
	 quest_prog_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer()}).

-record(drama_play,
	{id = 0  :: non_neg_integer(),
	 act_type = 0  :: non_neg_integer(),
	 label = act  :: atom(),
	 base_id = 0  :: non_neg_integer(),
	 map_bid = 0  :: non_neg_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(),
	 val = 0  :: non_neg_integer(), name = <<>>  :: binary(),
	 desc = <<>>  :: binary()}).

-record(drama_quest_unit,
	{label, id = 0, base_id = 0, type = 0, pos, dir,
	 act_type, is_rand_pos = 0  :: 0 | 1}).

-file("src/mod/quest/quest_prog_init.erl", 19).

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

-file("src/mod/quest/quest_prog_init.erl", 20).

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

-file("src/mod/quest/quest_prog_init.erl", 21).

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

-file("src/mod/quest/quest_prog_init.erl", 22).

-file("inc/star.hrl", 1).

-record(star,
	{ver = 1  :: non_neg_integer(),
	 set_id = 0  :: non_neg_integer(),
	 break_lev = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), natals = []  :: list(),
	 add_attr = []  :: list(), fetter_attr = []  :: list(),
	 set_skill_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer()}).

-record(m_star_tower,
	{ver = 1  :: non_neg_integer(),
	 max_tower = 0  :: non_neg_integer(),
	 award_list = []  :: list()}).

-record(m_star_divination,
	{ver = 1  :: non_neg_integer(),
	 luck = 1  :: non_neg_integer(),
	 quality = 1  :: non_neg_integer(),
	 all_count = 0  :: non_neg_integer(),
	 flag = 0  :: non_neg_integer(),
	 ref_count = 0  :: non_neg_integer(),
	 day_gold_count = 0  :: non_neg_integer(),
	 day_hun_count = 0  :: non_neg_integer()}).

-record(tower_replay_data,
	{type = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(), sid = 0  :: binary(),
	 name = <<>>  :: binary(),
	 face_id = 0  :: non_neg_integer(),
	 time = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 repaly_id = 0  :: non_neg_integer(),
	 face_update_time = 0, face_file = <<>>}).

-record(star_tower_replay,
	{tower = 0  :: non_neg_integer(),
	 replays = []  :: [#tower_replay_data{}]}).

-record(m_star,
	{ver = 1  :: non_neg_integer(),
	 star_list = []  :: [#star{}],
	 fetter_list = []  :: list(), all_attr = []  :: list()}).

-file("src/mod/quest/quest_prog_init.erl", 23).

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

-file("src/mod/quest/quest_prog_init.erl", 24).

-file("inc/login.hrl", 1).

-record(login,
	{login_time = 0, logout_time = 0, prev_logout_time = 0,
	 prev_login_time = 0, log_login_time = 0}).

-file("src/mod/quest/quest_prog_init.erl", 25).

-file("inc/adventure.hrl", 1).

-record(m_adventure,
	{ver = 10, pass_id = 0, pass_num = 0, explore_num = 0,
	 id = 0, room = 0, first_room = 0, boss_room = 0,
	 room_list = [], buff_list = [], shop_list = [],
	 start_time = 0, end_time = 0, plist = [],
	 is_kill_boss = 0, init_time = 0, skill_list = [],
	 bag_list = [], map_id = 0, partner_id = 0,
	 skill_used = [], round_reward = [],
	 round_evt_group = [], kill_mon = 0, mine_combat_num = 0,
	 mine_round_combat = 0, mine_round_reward = [],
	 current_id = 0, mine_buy_count = 0, init_id = 0,
	 laste_num = 999}).

-record(a_room,
	{id = 1, idx = 0, evt_id = 0, res_id = 0, status = 0,
	 cond_status = 0, lock = 0, init_evt_id = 0, ext = []}).

-record(adventure_data,
	{id = 0, room = 0, name = <<>>, lose = []}).

-file("src/mod/quest/quest_prog_init.erl", 26).

-file("inc/endless.hrl", 1).

-record(m_endless,
	{ver = 2  :: pos_integer(), r_id = 0  :: pos_integer(),
	 max_id = 0  :: pos_integer(),
	 ext_reward = []  :: list(),
	 day_begin = 1  :: pos_integer(),
	 day_pass = 0  :: pos_integer(),
	 day_reward = []  :: list(), employ = []  :: list(),
	 appoint = []  :: list(), type = 0  :: pos_integer(),
	 select_type = 0  :: pos_integer(),
	 new_endless_list = []  :: list(), ext = []  :: list(),
	 flag = 0  :: pos_integer()}).

-record(new_endless,
	{ver = 1  :: pos_integer(), type = 0  :: pos_integer(),
	 max_id = 0  :: pos_integer(),
	 ext_reward = []  :: list(),
	 day_begin = 1  :: pos_integer(),
	 day_pass = 0  :: pos_integer(), ext = []  :: list()}).

-record(endless_data,
	{type = 0, id = 0, name = <<>>, lev = 0, unit_ids = [],
	 is_reset = 0, formation = undefined}).

-record(endless_employ,
	{id = {{0, <<>>}, 0}, rid = {0, <<>>}, rname = <<>>,
	 bid = 0, plev = 0, star = 0, quality = 0, break_lev = 0,
	 power = 0, num = 0, ext = []}).

-record(endless_robot_data,
	{id = 0, bid = 0, rname = <<>>, group_id = 0,
	 unit_id = 0, lev = 0, star = 0, quality = 0,
	 power = 0}).

-file("src/mod/quest/quest_prog_init.erl", 27).

-file("inc/guild_quest.hrl", 1).

-record(m_guild_quest,
	{ver = 1, lev = 0  :: non_neg_integer(),
	 exp = 0  :: non_neg_integer(),
	 day_exp = 0  :: non_neg_integer(),
	 week_exp = 0  :: non_neg_integer(),
	 list = []  :: list()}).

-record(guild_quest_data,
	{id = 0, name = <<>>, type = 0, exp = 0,
	 progress = []}).

-record(guild_quest_lev_data,
	{lev = 0, exp = 0, items = [], attr = []}).

-file("src/mod/quest/quest_prog_init.erl", 28).

-file("inc/hallows.hrl", 1).

-record(m_hallows,
	{ver = 3, hallows_list = [], all_lv = 0, attr_list = [],
	 quest_list = [], look_list = [], look_quest_list = []}).

-record(hallows,
	{ver = 4, id = 0, step = 0, lucky = 0,
	 lucky_endtime = 0, power = 0, base_attr = [],
	 add_attr = [], eqm = [], skill = [], seal = 0,
	 reward = [], rebirth_loss = [], is_notice = 0,
	 look_id = 0, refine_lev = 0}).

-record(hallows_skill,
	{ver = 1, pos = 0, lev = 0, skill_bid = 0, attr = []}).

-record(hallows_data,
	{id = 0, step = 0, name = <<>>, attr = [], loss = [],
	 max_lucky = 0, clear_limit = 0, clear_time = 0,
	 reward = [], notice = <<>>, open_desc = <<>>,
	 skill_order = []}).

-record(hallows_quest_data,
	{id = 0, hid = 0, items = [], progress = []}).

-record(hallows_looks,
	{ver = 1, id = 0, endtime = 0, eqm_hallows = 0}).

-record(hallows_look_data,
	{id = 0, name = <<>>, attr = [], is_item = 0, time = 0,
	 loss = []}).

-file("src/mod/quest/quest_prog_init.erl", 29).

-file("inc/expedition.hrl", 1).

-record(m_expedition,
	{ver = 2, guard_id = 0, partner_hp = [], list = [],
	 employ = [], appoint = [], difficulty = 0,
	 max_difficulty = 0, last_join_time = 0,
	 last_difficulty = {0, 0}, max_power = 0}).

-record(expedition_f,
	{id = 1  :: 1..100, type = 1, robot_id = 0,
	 role_id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: bitstring(),
	 lev = 0  :: non_neg_integer(),
	 face = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 hallows_id = 0  :: non_neg_integer(),
	 formation_type = 0  :: non_neg_integer(),
	 items = []  :: list(), guards = []  :: list(),
	 partner_hp = []  :: list(), status = 0  :: 0..2}).

-record(expedition_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, ext = []}).

-record(expedition_employ,
	{rid = {0, <<>>}, rname = <<>>, num = 0, list = []}).

-record(expedition_employ_p,
	{id = 0, bid = 0, lev = 0, star = 0, quality = 0,
	 break_lev = 0, power = 0, num = 0, ext = []}).

-record(expedition_log,
	{id = {{0, <<>>}, 0}, list = []}).

-record(expedition_replay,
	{id = 0, round = 0, ret = 0, time = 0, difficulty = 0,
	 guard_id = 0, a_id = {0, <<>>}, a_name = <<>>,
	 a_lev = 0, a_power = 0, a_formation_type = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_name = <<>>,
	 b_lev = 0, b_power = 0, b_formation_type = 0,
	 b_end_hp = 0, a_plist = [], b_plist = [], ext = []}).

-record(expedition_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-file("src/mod/quest/quest_prog_init.erl", 30).

-file("inc/day_goals.hrl", 1).

-record(m_day_goals,
	{ver = 3, end_time = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 welfare_list = []  :: list(), grow_list = []  :: list(),
	 price_list = []  :: list(), finish_list = []  :: list(),
	 period = 1  :: list(), charge = 0  :: list(),
	 old_data = [], period_day = 0, new_grow_list = [],
	 lev_reward = [], old_data2 = []}).

-record(grow_data,
	{ver = 2, day = 0  :: non_neg_integer(),
	 goal_id = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 condition = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), progress = []  :: list(),
	 target_type = 1  :: non_neg_integer()}).

-file("src/mod/quest/quest_prog_init.erl", 31).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/quest/quest_prog_init.erl", 32).

-file("inc/holiday_boss.hrl", 1).

-record(m_holiday_boss,
	{ver = 1, camp_id = 0, count = 0, buy_count = 0,
	 order_id = 1, score = 0, boss_hp = [], boss_score = 0,
	 awards = [], old_info = []}).

-file("src/mod/quest/quest_prog_init.erl", 33).

-file("inc/home_pet.hrl", 1).

-record(m_home_pet,
	{ver = 6, name = <<>>, id = 0, rename_count = 0,
	 state = 0, calc_time = 0, start_time = 0, end_time = 0,
	 vigor = 0, vigor_time = 0, set_item = [],
	 next_evt_id = 1, city = 0, evt_list = [], do_evts = [],
	 acc_evts = [], fire_time = 0, acc_out_time = 0,
	 acc_out_count = 0, acc_items = [], photos = [],
	 diarys = [], day_talk = 0, day_feed = 0,
	 photos_next_id = 1, diarys_next_id = 1,
	 photos_had = []}).

-file("src/mod/quest/quest_prog_init.erl", 34).

-spec do(#role{}, Progress :: list(),
	 QuestId :: pos_integer()) -> NewProgs :: list().

do(Role, Progress, QuestId) ->
    do(Role, Progress, QuestId, 0, []).

do(_Role, [], _QuestId, _Id, []) -> [];
do(_Role, [], _QuestId, _Id, Progress) ->
    lists:reverse(Progress);
do(Role, [Prog = #quest_progress{} | T], QuestId, Id,
   Progress) ->
    NewProg = #quest_progress{} = update(Prog, QuestId,
					 Role),
    do(Role, T, QuestId, Id + 1,
       [NewProg#quest_progress{id = Id} | Progress]).

-spec update(#quest_progress{},
	     QuestId :: pos_integer(), #role{}) -> #quest_progress{}.

update(Prog = #quest_progress{label = evt_enter_map,
			      target = Target, target_val = TargetVal},
       _QuestId, #role{pos = #pos{map_bid = Target}}) ->
    Prog#quest_progress{finish = 1, value = TargetVal};
update(Prog = #quest_progress{label = evt_use_item,
			      target = Target},
       _QuestId,
       _Role = #role{p_eqm = #package{items = Items}}) ->
    case lists:keyfind(Target, #item.base_id, Items) of
      #item{} ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_use_item_type,
			      target = Target},
       _QuestId,
       _Role = #role{p_eqm = #package{items = Items}}) ->
    case lists:keyfind(Target, #item.type, Items) of
      #item{} ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_get_item,
			      target = Target},
       _QuestId,
       #role{p_bag = Bag,
	     partner_bag = #partner_bag{partner_list = PL}})
    when Target > 0 ->
    {_, Num} = package:count(by_base_id, Target, Bag),
    Num2 = length(lists:flatten([[Target
				  || {_, #item{base_id = Bid}} <- Artifacts,
				     Bid == Target]
				 || #partner{artifacts = Artifacts} <- PL])),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Num + Num2 >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Num + Num2 > OldVal ->
	   Prog#quest_progress{value = Num + Num2};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_get_item,
			      param = [{eqm_quality, Quality}]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = PartnerList},
	     p_eqm = #package{items = PEqms}}) ->
    Num1 = length(lists:flatten([[1
				  || #item{quality = IQuality} <- Eqms,
				     IQuality =:= Quality]
				 || #partner{eqm = Eqms} <- PartnerList])),
    Num2 = lists:sum([Count
		      || #item{quality = IQuality, quantity = Count} <- PEqms,
			 IQuality =:= Quality]),
    Num = Num1 + Num2,
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Num >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_levup},
       _QuestId, #role{lev = Lev}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Lev >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Lev > OldVal -> Prog#quest_progress{value = Lev};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_guild_quest_lev},
       _QuestId,
       #role{m_guild_quest = #m_guild_quest{lev = Lev}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Lev >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Lev > OldVal -> Prog#quest_progress{value = Lev};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_cli_loaded,
			      param = []},
       _QuestId,
       #role{login =
		 #login{login_time = Time, logout_time = LogoutTime}}) ->
    case date:is_today_five(Time) orelse
	   date:is_today_five(LogoutTime)
	of
      true ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_gain_coin},
       _QuestId, #role{assets = #assets{coin = Num}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Num >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_gain_gold},
       _QuestId, #role{assets = #assets{gold = Num}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Num >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_gain_silver_coin},
       _QuestId, #role{assets = #assets{silver_coin = Num}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Num >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_gain_activity},
       _QuestId,
       #role{assets = #assets{activity = Num},
	     m_var = #m_var{last_reset_time = LastResetTime}}) ->
    case date:is_same_day(LastResetTime, date:unixtime()) of
      true ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if Num >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     Num > OldVal -> Prog#quest_progress{value = Num};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_power,
			      param = []},
       _QuestId, #role{power = Power}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Power >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Power > OldVal -> Prog#quest_progress{value = Power};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_partner,
			      param = []},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners,
			      partner_decomposes = DecomPoses}}) ->
    PartnerBids = [Bid || #partner{bid = Bid} <- Partners],
    AllP = list_util:filter_replicat(PartnerBids ++
				       DecomPoses),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if length(AllP) >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       length(AllP) > OldVal ->
	   Prog#quest_progress{value = length(AllP)};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_partner,
			      param = [{star, Star}]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners}}) ->
    List = [P
	    || P = #partner{star = PStar} <- Partners,
	       PStar >= Star],
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if length(List) >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       length(List) > OldVal ->
	   Prog#quest_progress{value = length(List)};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_partner,
			      param = [{star, Star, CampType}]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners}}) ->
    List = [P
	    || P = #partner{star = PStar, camp_type = CampTypeT}
		   <- Partners,
	       PStar >= Star andalso CampTypeT == CampType],
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if length(List) >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       length(List) > OldVal ->
	   Prog#quest_progress{value = length(List)};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_partner,
			      param = [{bind_star, Star}]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners}}) ->
    List = [P
	    || P = #partner{star = PStar} <- Partners,
	       PStar =:= Star],
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if length(List) >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       length(List) > OldVal ->
	   Prog#quest_progress{value = length(List)};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_partner,
			      param = [{bind_star, Star, CampType}]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners}}) ->
    List = [P
	    || P = #partner{star = PStar, camp_type = CampTypeT}
		   <- Partners,
	       PStar == Star andalso CampTypeT == CampType],
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if length(List) >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       length(List) > OldVal ->
	   Prog#quest_progress{value = length(List)};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_partner,
			      param = [{bind_star2, Star}]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners}}) ->
    List = [P
	    || P = #partner{star = PStar} <- Partners,
	       PStar >= Star],
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if length(List) >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       length(List) > OldVal ->
	   Prog#quest_progress{value = length(List)};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_partner,
			      param = [{bind_star2, Star, CampType}]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners}}) ->
    List = [P
	    || P = #partner{star = PStar, camp_type = CampTypeT}
		   <- Partners,
	       PStar >= Star andalso CampTypeT == CampType],
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if length(List) >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       length(List) > OldVal ->
	   Prog#quest_progress{value = length(List)};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_partner,
			      param = [{lev, Lev}]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners}}) ->
    List = [P
	    || P = #partner{lev = PLev} <- Partners, PLev >= Lev],
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if length(List) >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       length(List) > OldVal ->
	   Prog#quest_progress{value = length(List)};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_partner,
			      param = [{break_lev, BreakLev}]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners}}) ->
    List = [P
	    || P = #partner{break_lev = PBreakLev} <- Partners,
	       PBreakLev >= BreakLev],
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if length(List) >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       length(List) > OldVal ->
	   Prog#quest_progress{value = length(List)};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_partner,
			      param = [{rare_type, RareType}]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners}}) ->
    List = [P
	    || P = #partner{rare_type = PRareType} <- Partners,
	       PRareType =:= RareType],
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if length(List) >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       length(List) > OldVal ->
	   Prog#quest_progress{value = length(List)};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_partner_eqm,
			      param = [{quality, Quality, Num}]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners}}) ->
    EqmNum = case Num =:= 0 of
	       true -> length([3, 4, 1, 2]);
	       _ -> Num
	     end,
    Fun = fun (#partner{eqm = Eqms}, Acc) ->
		  Len = length([1
				|| #item{quality = EqmQuality} <- Eqms,
				   EqmQuality >= Quality]),
		  case Len >= EqmNum of
		    true -> Acc + 1;
		    false -> Acc
		  end
	  end,
    Sum = lists:foldl(Fun, 0, Partners),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Sum >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Sum > OldVal -> Prog#quest_progress{value = Sum};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_partner_eqm,
			      param = [{artifact, Quality}]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners}}) ->
    EqmNum = length([3, 4, 1, 2]),
    Fun = fun (#partner{eqm = Eqms, artifacts = Artifacts},
	       Acc) ->
		  case lists:keyfind(1, 1, Artifacts) of
		    Art1 when Art1 =/= false ->
			case lists:keyfind(2, 1, Artifacts) of
			  Art2 when Art2 =/= false ->
			      Len = length([1
					    || #item{quality = EqmQuality}
						   <- Eqms,
					       EqmQuality >= Quality]),
			      case Len >= EqmNum of
				true -> Acc + 1;
				false -> Acc
			      end;
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    Sum = lists:foldl(Fun, 0, Partners),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Sum >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Sum > OldVal -> Prog#quest_progress{value = Sum};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_partner_artifact,
			      param = [{lev, Lev}]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners}}) ->
    EqmNum = length([3, 4, 1, 2]),
    Fun = fun (#partner{eqm = Eqms}, Acc) ->
		  Len = length([1
				|| #item{enchant = Enchant} <- Eqms,
				   Enchant >= Lev]),
		  case Len >= EqmNum of
		    true -> Acc + 1;
		    false -> Acc
		  end
	  end,
    Sum = lists:foldl(Fun, 0, Partners),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Sum >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Sum > OldVal -> Prog#quest_progress{value = Sum};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_partner_artifact,
			      param = [num]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners}}) ->
    Sum = lists:sum([length(Arts)
		     || #partner{artifacts = Arts} <- Partners]),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Sum >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Sum > OldVal -> Prog#quest_progress{value = Sum};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_broadcast_drama,
			      target = Target},
       _QuestId, #role{m_drama = #m_drama{finished = Ids}}) ->
    case lists:member(Target, Ids) of
      true ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      false -> Prog
    end;
update(Prog = #quest_progress{label = evt_commit_quest,
			      param = [quest_daily]},
       _QuestId,
       #role{m_quest = #m_quest{daily_finished = FinL}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if length(FinL) >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       length(FinL) > OldVal ->
	   Prog#quest_progress{value = length(FinL)};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_friend,
			      param = [num]},
       _QuestId, Role) ->
    Num = friend:friend_num(Role),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Num >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_friend_cluster,
			      param = [num]},
       _QuestId, Role) ->
    Num = length(friend_lib:cross_friends(Role)),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Num >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_star_natal,
			      param = [set_num]},
       _QuestId,
       #role{m_star = #m_star{star_list = StarList}}) ->
    Num = length([11, 12, 13, 14]),
    Sum = length([1
		  || #star{natals = Natals} <- StarList,
		     length(Natals) >= Num]),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Sum >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Sum > OldVal -> Prog#quest_progress{value = Sum};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_star_natal,
			      param = [{set_quality_num, Quality}]},
       _QuestId,
       #role{m_star = #m_star{star_list = StarList}}) ->
    NatalNum = length([11, 12, 13, 14]),
    Fun = fun (#star{natals = Natals}, Acc) ->
		  Len = length([1
				|| #item{quality = ItemQ} <- Natals,
				   ItemQ >= Quality]),
		  case Len >= NatalNum of
		    true -> Acc + 1;
		    false -> Acc
		  end
	  end,
    Sum = lists:foldl(Fun, 0, StarList),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Sum >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Sum > OldVal -> Prog#quest_progress{value = Sum};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_star_level_up,
			      param = [{lev, Lev}]},
       _QuestId,
       #role{m_star = #m_star{star_list = StarList}}) ->
    Sum = length([1
		  || #star{lev = StarLev} <- StarList, StarLev >= Lev]),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Sum >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Sum > OldVal -> Prog#quest_progress{value = Sum};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_star_natal_level_up,
			      param = [{natal, Quality, Star}]},
       _QuestId,
       #role{m_star = #m_star{star_list = StarList}}) ->
    Fun = fun (#star{natals = List}, Acc) ->
		  Acc +
		    length([1
			    || #item{quality = ItemQ, enchant = Enchant}
				   <- List,
			       ItemQ =:= Quality andalso Enchant >= Star])
	  end,
    Sum = lists:foldl(Fun, 0, StarList),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Sum >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Sum > OldVal -> Prog#quest_progress{value = Sum};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_formation_open},
       _QuestId,
       #role{m_formation = #m_formation{list = List}}) ->
    Sum = length(List),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Sum >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Sum > OldVal -> Prog#quest_progress{value = Sum};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_formation_level_up,
			      param = [{lev, Lev}]},
       _QuestId,
       #role{m_formation = #m_formation{list = List}}) ->
    Sum = length([1 || F <- List, element(2, F) >= Lev]),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Sum >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Sum > OldVal -> Prog#quest_progress{value = Sum};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_dungeon_pass,
			      param = [chapter], target = Target},
       _QuestId, Role) ->
    case dungeon:is_pass(Role, Target) of
      true ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_star_tower_floor_pass,
			      target = Target},
       _QuestId,
       #role{m_star_tower =
		 #m_star_tower{max_tower = MaxPower}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if MaxPower >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       MaxPower > OldVal ->
	   Prog#quest_progress{value = MaxPower};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_partner_enchant_eqm,
			      param = [{lev, EqmLev}]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners}}) ->
    EqmNum = length([3, 4, 1, 2]),
    Fun = fun (#partner{eqm = Eqms}, Acc) ->
		  Len = length([1
				|| #item{enchant = Enchant} <- Eqms,
				   Enchant >= EqmLev]),
		  case Len >= EqmNum of
		    true -> Acc + 1;
		    false -> Acc
		  end
	  end,
    Sum = lists:foldl(Fun, 0, Partners),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Sum >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Sum > OldVal -> Prog#quest_progress{value = Sum};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_partner_enchant_eqm,
			      param = [{enchant, EqmLev}]},
       _QuestId,
       #role{partner_bag =
		 #partner_bag{partner_list = Partners}}) ->
    Fun = fun (#partner{eqm = Eqms}, Acc) ->
		  Len = length([1
				|| #item{enchant = Enchant} <- Eqms,
				   Enchant >= EqmLev]),
		  Acc + Len
	  end,
    Sum = lists:foldl(Fun, 0, Partners),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Sum >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Sum > OldVal -> Prog#quest_progress{value = Sum};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_arena_rank,
			      target = Target},
       _QuestId, Role) ->
    BestRank = var:get_var(Role, other, 3024, 0),
    case BestRank > 0 andalso BestRank =< Target of
      true ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if BestRank >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     BestRank > OldVal ->
		 Prog#quest_progress{value = BestRank};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_arena_score_lev,
			      target = Target},
       _QuestId, Role) ->
    ScoreLev = arena:role_score_lev(Role),
    case ScoreLev >= Target of
      true ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_adventure_goto_floor,
			      target = Target},
       _QuestId,
       #role{m_adventure =
		 #m_adventure{pass_id = PassId, id = FloorId}}) ->
    case FloorId >= Target orelse PassId >= Target of
      true ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_hallows_all_step},
       _QuestId, Role) ->
    AllStep = hallows_lib:get_all_step(Role),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if AllStep >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       AllStep > OldVal ->
	   Prog#quest_progress{value = AllStep};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_hallows_activate},
       _QuestId,
       #role{m_hallows = #m_hallows{hallows_list = List}}) ->
    Count = length(List),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Count >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Count > OldVal -> Prog#quest_progress{value = Count};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_hallows_step},
       _QuestId,
       #role{m_hallows = #m_hallows{hallows_list = List}}) ->
    MaxSteps = [Step || #hallows{step = Step} <- List],
    MaxStep = case MaxSteps =:= [] of
		true -> 0;
		_ -> lists:max(MaxSteps)
	      end,
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if MaxStep >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       MaxStep > OldVal ->
	   Prog#quest_progress{value = MaxStep};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_endless_pass,
			      target = 0},
       _QuestId,
       #role{m_endless = #m_endless{max_id = MaxId}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if MaxId >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       MaxId > OldVal -> Prog#quest_progress{value = MaxId};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_endless_pass,
			      target = Target},
       _QuestId,
       #role{m_endless = #m_endless{max_id = MaxId}}) ->
    case MaxId >= Target of
      true ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_expedition_fight,
			      target = Floor, param = [pass]},
       _QuestId,
       #role{m_expedition =
		 #m_expedition{guard_id = GuardId,
			       last_join_time = LastJoinTime}}) ->
    NowFloor = check_expedition_floor(GuardId - 1),
    case NowFloor >= Floor andalso
	   date:is_same_day(LastJoinTime, date:unixtime())
	of
      true ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_star_natal_level_up,
			      param = [{lev, StarLev}]},
       _QuestId,
       #role{m_star = #m_star{star_list = StarList}}) ->
    Fun = fun (#star{natals = Natals}, Acc) ->
		  Len = length([1
				|| #item{enchant = Enchant} <- Natals,
				   Enchant >= StarLev]),
		  Acc + Len
	  end,
    Sum = lists:foldl(Fun, 0, StarList),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Sum >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Sum > OldVal -> Prog#quest_progress{value = Sum};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_artifact_compose},
       _QuestId, Role) ->
    Sum = var:get_var(Role, acc, 2052, 0),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Sum >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Sum > OldVal -> Prog#quest_progress{value = Sum};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_pay,
			      param = [rmb]},
       _QuestId,
       #role{id = RoleId,
	     misc = #role_misc{reg_zero_time = RegZeroTime},
	     m_day_goals =
		 #m_day_goals{end_time = EndTime, period = Period}}) ->
    LimitTime = 1576857599,
    StartTime = RegZeroTime +
		  max(0, Period - 1) * 7 * 86400,
    case EndTime >= LimitTime andalso StartTime =< LimitTime
	of
      true when Period == 2 orelse Period == 3 ->
	  AddCharge = charge_lib:calc_charge(RoleId, StartTime,
					     date:unixtime()),
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if AddCharge >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     AddCharge > OldVal ->
		 Prog#quest_progress{value = AddCharge};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label = evt_charge_acc},
       _QuestId, #role{assets = #assets{vip_exp = VipExp}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if VipExp >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       VipExp > OldVal -> Prog#quest_progress{value = VipExp};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_sky_ladder_rank,
			      target = Target},
       _QuestId, #role{id = RoleId}) ->
    Rank = sky_ladder:role_rank(RoleId),
    case Rank > 0 andalso Rank =< Target of
      true ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_pass_holiday_boss,
			      target = Target},
       _QuestId,
       #role{m_holiday_boss =
		 #m_holiday_boss{order_id = OrderId}}) ->
    case OrderId > Target of
      true ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_holiday_boss_get_score},
       _QuestId,
       #role{m_holiday_boss =
		 #m_holiday_boss{score = Score}}) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Score >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Score > OldVal -> Prog#quest_progress{value = Score};
       true -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_dun_heaven_perfectpass,
			      target = Target},
       _QuestId, Role) ->
    case dungeon_heaven_lib:is_perfect_over(Role, Target) of
      true ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_artifact_recast_skills,
			      param = [{skill, Skills}]},
       _QuestId, Role) ->
    case partner_artifact:get_artifact_by_skills(Role,
						 Skills)
	of
      L = [_ | _] ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if length(L) >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     length(L) > OldVal ->
		 Prog#quest_progress{value = length(L)};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_partnerskill_learn,
			      param = [{skill_lev, Lev}]},
       _QuestId, Role) ->
    case partner_skill:get_all_skills(Role) of
      L = [_ | _] ->
	  L2 = [SkillId
		|| SkillId <- L, skill_lib:skill_lev(SkillId) >= Lev],
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if length(L2) >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     length(L2) > OldVal ->
		 Prog#quest_progress{value = length(L2)};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_element_temple_pass,
			      target = Target, param = [pass]},
       _QuestId, Role) ->
    ElementTemplePassInfo = var:get_var(Role, other, 3051,
					[{1, 0}, {2, 0}, {3, 0}, {4, 0},
					 {5, 0}]),
    case [PassInfo
	  || {_, PassInfo} <- ElementTemplePassInfo,
	     PassInfo >= Target]
	of
      [_ | _] ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_element_temple_pass,
			      target = Target, param = [{five_dept_pass}]},
       _QuestId, Role) ->
    ElementTemplePassInfo = var:get_var(Role, other, 3051,
					[{1, 0}, {2, 0}, {3, 0}, {4, 0},
					 {5, 0}]),
    case [PassInfo
	  || {_, PassInfo} <- ElementTemplePassInfo,
	     PassInfo < Target]
	of
      [] ->
	  #quest_progress{target_val = TarVal, value = OldVal} =
	      Prog,
	  if 1 >= TarVal ->
		 Prog#quest_progress{finish = 1, value = TarVal};
	     1 > OldVal -> Prog#quest_progress{value = 1};
	     true -> Prog
	  end;
      _ -> Prog
    end;
update(Prog = #quest_progress{label =
				  evt_get_speciality,
			      target = Target},
       _QuestId,
       Role = #role{m_home_pet =
			#m_home_pet{acc_items = AccItems}}) ->
    Num = length(AccItems),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Num >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_travel_time,
			      target = Target},
       _QuestId,
       Role = #role{m_home_pet =
			#m_home_pet{acc_out_time = AccOutTime}}) ->
    Time = util:floor(AccOutTime / 60 / 60),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Time >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Time > OldVal -> Prog#quest_progress{value = Time};
       true -> Prog
    end;
update(Prog = #quest_progress{label = evt_skin},
       _QuestId,
       Role = #role{partner_bag =
			#partner_bag{partner_skins = PartnerSkins}}) ->
    Num = length([1
		  || #partner_skin{end_time = 0} <- PartnerSkins]),
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Num >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Num > OldVal -> Prog#quest_progress{value = Num};
       true -> Prog
    end;
update(Prog, _QuestId, _Role) -> Prog.

check_expedition_floor(RefId) when RefId =< 0 -> 0;
check_expedition_floor(GuardId)
    when is_integer(GuardId) ->
    case expedition_data:get_ref(GuardId) of
      #{floor := Floor} -> Floor;
      _ -> check_expedition_floor(GuardId - 1)
    end;
check_expedition_floor(_) -> 0.


