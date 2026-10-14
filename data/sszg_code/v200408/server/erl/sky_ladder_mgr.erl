-file("data/sky_ladder_mgr.erl", 1).

-file("src/mod/data/sky_ladder_mgr.erl", 1).

-module(sky_ladder_mgr).

-lager_records([{cluster_dynamic_local_group,
		 [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
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
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
		{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
		{m_look, [use_id, list]},
		{g_mem_red_packet,
		 [id, rid, name, face_id, avatar_bid, post, type, num,
		  max_num, val, max_val, list, mems, start_time, end_time,
		  msg_id, face_update_time, face_file]},
		{guild_data, [lev, exp, num, maintain]},
		{guild_position, [id, name, limit]},
		{g_merge,
		 [gid, gname, gid2, gname2, role_id, rname, end_time,
		  gold]},
		{guild_rank,
		 [id, name, lev, exp, leader_name, leader_id,
		  leader_face, leader_lev, members_num, members_max,
		  apply_lev, apply_type, create_time, power, index,
		  leader_avatar_bid, leader_look_id,
		  leader_face_update_time, leader_face_file,
		  apply_power]},
		{guild_apply,
		 [gid, id, pid, name, face, lev, power, post, vip_lev,
		  online, apply_time, face_update_time, face_file]},
		{guild_member,
		 [ver, id, pid, name, face, lev, sex, power, post,
		  vip_lev, online, join_time, login_time, donate,
		  day_donate, avatar_bid, red_packet_num,
		  red_packet_price, red_packet_time, red_packet_recv_num,
		  red_packet_recv_time, active_lev, day_donate_type,
		  day_donate_time, day_dun_time, day_war_time, look_id,
		  face_update_time, face_file]},
		{guild_war_box,
		 [order, rid, sid, name, item_id, item_num]},
		{guild_cache, []},
		{guild,
		 [ver, id, name, lev, exp, day_exp, pid, leader_name,
		  leader_id, members, members_num, members_max, next_id,
		  sign, apply_lev, apply_type, recruit_num, cache, sync,
		  create_time, power, rename_time, lock_time, donate_exp,
		  red_packet, guild_war_box_end_time, guild_war_relust,
		  guild_war_box, guild_war_sign, day_var,
		  vice_leader_mail, normal_mail, vitality, apply_power]},
		{guild_bag,
		 [ver, id, pid, name, post, lev, join_time, quit_time,
		  send_time, send_num, recv_num, true_quit_time,
		  quit_post]},
		{guild_log_info,
		 [id, guild_id, type, time, role_id, role_name, msg]},
		{guild_log, [key, list]},
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
		{activity, [id, status, name, data, ext_args]},
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
		{sky_ladder_result,
		 [result, id, def_name, def_lev, def_face,
		  def_change_rank, def_rank, def_old_rank,
		  is_change_best_rank, atk_change_rank, atk_rank,
		  atk_old_rank, atk_cont_win, reward,
		  def_face_update_time, def_face_file]},
		{sky_ladder_highlight,
		 [id, atk_id, atk_name, atk_face, atk_rank, def_id,
		  def_name, def_face, def_rank, ret, replay_id, time,
		  atk_face_update_time, atk_face_file,
		  def_face_update_time, def_face_file]},
		{sky_ladder_pk_log,
		 [id, rid, name, lev, sex, face, avatar_id, power,
		  atk_power, enemy_old_rank, old_rank, type, ret,
		  replay_id, rank_type, rank, time, face_update_time,
		  face_file]},
		{sky_ladder_role_log,
		 [id, name, face, logs, face_update_time, face_file]},
		{sky_ladder_rank,
		 [rank, id, is_fight, fight_rid, fight_pid]},
		{sky_ladder_role,
		 [id, name, vip, lev, sex, gid, gname, face, power,
		  max_power, lookid, rank, best_rank, time, avatar_id,
		  robot_unit, cont_win, face_update_time, face_file]},
		{sky_ladder_f_pos,
		 [pos, id, bid, lev, use_skin, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, is_robot]},
		{sky_ladder_f,
		 [id, name, gname, idx, lev, vip_lev, sex, face, power,
		  rank, formation_type, formation_lev, hallows_id,
		  pos_info, robot_id, avatar_id, look, face_update_time,
		  face_file]},
		{m_sky_ladder,
		 [ver, ref_time, combat_time, ref_list, best_rank,
		  can_combat_num, had_combat_num, buy_combat_num,
		  acc_combat_num, first_reward, next_reset_nine, worship,
		  worship_list, season_idx, merge_index, now_combat_num]},
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
		{state, [status, is_main]}]).

-behaviour(gen_server).

-export([send_info/3, send_call/3, srv_id/0,
	 sync_role/2, fight_begin/3, fight_end/1, del_combat/2,
	 set_combat_pid/3, is_open/0, end_time/0, do_reload/0,
	 check_open/0, check_open/1, notice_new_main/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([role_ver/1]).

-record(state, {status = 0, is_main = 0}).

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

-file("src/mod/data/sky_ladder_mgr.erl", 15).

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

-file("src/mod/data/sky_ladder_mgr.erl", 16).

-file("inc/sky_ladder.hrl", 1).

-record(m_sky_ladder,
	{ver = 2, ref_time = 0, combat_time = 0, ref_list = [],
	 best_rank = 0,
	 can_combat_num = sky_ladder_data:get_const(join_times),
	 had_combat_num = 0, buy_combat_num = 0,
	 acc_combat_num = 0, first_reward = [],
	 next_reset_nine = 0, worship = 0, worship_list = [],
	 season_idx = 0, merge_index = 0, now_combat_num = 0}).

-record(sky_ladder_f,
	{id = {0, <<>>}, name = <<>>, gname = <<>>, idx = 0,
	 lev = 0, vip_lev = 0, sex = 0, face = 0, power = 0,
	 rank = 0, formation_type = 0, formation_lev = 0,
	 hallows_id = 0, pos_info = [], robot_id = 0,
	 avatar_id = 0, look = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(sky_ladder_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, use_skin = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, is_robot = 0}).

-record(sky_ladder_role,
	{id = {0, <<>>}, name = <<>>, vip = 0, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, rank = 0, best_rank = 0,
	 time = 0, avatar_id = 0, robot_unit = 0, cont_win = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(sky_ladder_rank,
	{rank = 0, id = {0, <<>>}, is_fight = 0,
	 fight_rid = {0, <<>>}, fight_pid = 0}).

-record(sky_ladder_role_log,
	{id = {0, <<>>}, name = <<>>, face = 0, logs = [],
	 face_update_time = 0, face_file = <<>>}).

-record(sky_ladder_pk_log,
	{id = 0, rid = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, avatar_id = 0, power = 0, atk_power = 0,
	 enemy_old_rank = 0, old_rank = 0, type = 1, ret = 1,
	 replay_id = 0, rank_type = 0, rank = 0, time = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(sky_ladder_highlight,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_rank = 0, def_id = {0, <<>>},
	 def_name = <<>>, def_face = 0, def_rank = 0, ret = 1,
	 replay_id = 0, time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(sky_ladder_result,
	{result = 0, id = {0, <<>>}, def_name = <<>>,
	 def_lev = 0, def_face = 0, def_change_rank = 0,
	 def_rank = 0, def_old_rank = 0, is_change_best_rank = 0,
	 atk_change_rank = 0, atk_rank = 0, atk_old_rank = 0,
	 atk_cont_win = 0, reward = [], def_face_update_time = 0,
	 def_face_file = <<>>}).

-file("src/mod/data/sky_ladder_mgr.erl", 17).

-file("inc/log.hrl", 1).

-file("src/mod/data/sky_ladder_mgr.erl", 18).

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

-file("src/mod/data/sky_ladder_mgr.erl", 19).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/data/sky_ladder_mgr.erl", 20).

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

-file("src/mod/data/sky_ladder_mgr.erl", 21).

-file("inc/guild.hrl", 1).

-record(guild_log, {key = {0, <<>>}, list = []}).

-record(guild_log_info,
	{id = 0, guild_id = {0, <<>>}, type = 0, time = 0,
	 role_id = {0, <<>>}, role_name = 0, msg = <<>>}).

-record(guild_bag,
	{ver = 2, id = {0, <<>>}, pid, name = <<>>, post = 0,
	 lev = 0, join_time = 0, quit_time = 0, send_time = 0,
	 send_num = 0, recv_num = 0, true_quit_time = 0,
	 quit_post = 0}).

-record(guild,
	{ver = 7, id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 day_exp = 0, pid = 0, leader_name = <<>>,
	 leader_id = {0, <<>>}, members = [], members_num = 1,
	 members_max = 50, next_id = 1, sign = <<>>,
	 apply_lev = guild_data:get_const(guild_min_lev),
	 apply_type = 1, recruit_num = 0, cache, sync = 0,
	 create_time = 0, power = 0, rename_time = 0,
	 lock_time = 0, donate_exp = 0, red_packet = [],
	 guild_war_box_end_time = 0, guild_war_relust = 0,
	 guild_war_box = [], guild_war_sign = [], day_var = [],
	 vice_leader_mail = 0, normal_mail = 0, vitality = 0,
	 apply_power = 0}).

-record(guild_cache, {}).

-record(guild_war_box,
	{order = 0, rid = 0, sid = <<>>, name = <<>>,
	 item_id = 0, item_num = 0}).

-record(guild_member,
	{ver = 6, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, sex = 1, power = 0, post = 0,
	 vip_lev = 0, online = 1, join_time = 0, login_time = 0,
	 donate = 0, day_donate = 0, avatar_bid = 0,
	 red_packet_num = 0, red_packet_price = 0,
	 red_packet_time = 0, red_packet_recv_num = 0,
	 red_packet_recv_time = 0, active_lev = 0,
	 day_donate_type = 0, day_donate_time = 0,
	 day_dun_time = 0, day_war_time = 0, look_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(guild_apply,
	{gid = {0, <<>>}, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, power = 0, post = 0, vip_lev = 0,
	 online = 1, apply_time = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(guild_rank,
	{id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 leader_name = <<>>, leader_id = {0, <<>>},
	 leader_face = 0, leader_lev = 0, members_num = 1,
	 members_max = 50, apply_lev = 0, apply_type = 1,
	 create_time = 0, power = 0, index = 0,
	 leader_avatar_bid = 0, leader_look_id = 0,
	 leader_face_update_time = 0, leader_face_file = <<>>,
	 apply_power = 0}).

-record(g_merge,
	{gid = {0, <<>>}, gname = <<>>, gid2 = {0, <<>>},
	 gname2 = <<>>, role_id = {0, <<>>}, rname = <<>>,
	 end_time = 0, gold = 0}).

-record(guild_position,
	{id = 0, name = <<>>, limit = []}).

-record(guild_data,
	{lev = 0, exp = 0, num = 0, maintain = 0}).

-record(g_mem_red_packet,
	{id = {{0, <<>>}, 0}, rid = {0, <<>>}, name = <<>>,
	 face_id = 0, avatar_bid = 0, post = <<>>, type = 0,
	 num = 0, max_num = 0, val = 0, max_val = 0, list = [],
	 mems = [], start_time = 0, end_time = 0, msg_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/mod/data/sky_ladder_mgr.erl", 22).

-file("inc/looks.hrl", 1).

-record(m_look, {use_id = 0, list = []}).

-file("src/mod/data/sky_ladder_mgr.erl", 23).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/data/sky_ladder_mgr.erl", 24).

-file("inc/rank.hrl", 1).

-record(rank,
	{type = 0  :: non_neg_integer(), list = []  :: list(),
	 last_val = 0  :: non_neg_integer(),
	 len = 0  :: non_neg_integer(), is_cross = 0  :: 0 | 1,
	 ctime = 0  :: non_neg_integer()}).

-record(rank_rc,
	{ver = 3  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 idx = 0  :: non_neg_integer(),
	 val1 = 0  :: non_neg_integer(),
	 val2 = 0  :: non_neg_integer(),
	 val3 = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 look_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 guild_name = <<>>  :: bitstring(),
	 power = 0  :: non_neg_integer(),
	 all_power = 0  :: non_neg_integer(),
	 desc = <<>>  :: bitstring(), looks = []  :: list(),
	 ext = []  :: list(), time = 0  :: non_neg_integer(),
	 is_cross = false, avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(rank_cfg,
	{type = 0  :: non_neg_integer(),
	 num = 300  :: non_neg_integer(),
	 keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
	 min_val = 1  :: non_neg_integer(),
	 nologin = 0  :: non_neg_integer(),
	 zone = rank_zone_1  :: atom(), exit_rank = 0  :: 0..1}).

-file("src/mod/data/sky_ladder_mgr.erl", 25).

-file("inc/vip.hrl", 1).

-record(m_vip,
	{ver = 2, lev = 0, lev_reward = [], tired_charge = []}).

-record(vip_data,
	{lev = 0  :: non_neg_integer(),
	 gold = 0  :: non_neg_integer(), price = []  :: list(),
	 old_price = []  :: list(), items = []  :: list(),
	 ext_reward = []}).

-record(vip_effect_data,
	{name = <<>>  :: bitstring(),
	 val = 0  :: non_neg_integer()}).

-file("src/mod/data/sky_ladder_mgr.erl", 26).

-file("inc/partner.hrl", 1).

-file("inc/attr.hrl", 1).

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

-file("src/mod/data/sky_ladder_mgr.erl", 27).

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

-file("src/mod/data/sky_ladder_mgr.erl", 28).

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

-file("src/mod/data/sky_ladder_mgr.erl", 29).

role_ver(List) -> do_role_ver(List, []).

do_role_ver([], List) -> lists:reverse(List);
do_role_ver([I | T], List) ->
    {ok, NewI} = ver(I), do_role_ver(T, [NewI | List]).

check_open(#role{lev = Lev}) ->
    Lev >=
      arena_cluster_champion_data:get_const(guess_lev_limit)
      andalso check_open().

check_open() ->
    case env_info() of
      #{server_type := none} -> false;
      _ -> true
    end.

sync_role(Role = #role{id = RoleId}, Flag) ->
    case ets:member(sky_ladder_role, RoleId) of
      true -> sync_role_(Role, Flag);
      _ -> skip
    end,
    ok.

sync_role_(Role = #role{id = RoleId}, power) ->
    Power = formation:get_sys_formation_power(Role, 9),
    L = [{#sky_ladder_role.power, Power}],
    ets:update_element(sky_ladder_role, RoleId, L);
sync_role_(Role = #role{id = RoleId,
			guild_bag = #guild_bag{id = Gid, name = GName}},
	   guild) ->
    Power = formation:get_sys_formation_power(Role, 9),
    L = [{#sky_ladder_role.power, Power},
	 {#sky_ladder_role.gid, Gid},
	 {#sky_ladder_role.gname, GName}],
    ets:update_element(sky_ladder_role, RoleId, L);
sync_role_(Role = #role{id = RoleId, lev = Lev,
			m_vip = #m_vip{lev = VipLev}, name = Name,
			face_id = FaceId,
			guild_bag = #guild_bag{id = Gid, name = GName},
			m_look = #m_look{use_id = LookId},
			m_avatar = #m_avatar{used = AvatarId}},
	   _Flag) ->
    Power = formation:get_sys_formation_power(Role, 9),
    L = [{#sky_ladder_role.lev, Lev},
	 {#sky_ladder_role.vip, VipLev},
	 {#sky_ladder_role.name, Name},
	 {#sky_ladder_role.power, Power},
	 {#sky_ladder_role.face, FaceId},
	 {#sky_ladder_role.gid, Gid},
	 {#sky_ladder_role.gname, GName},
	 {#sky_ladder_role.lookid, LookId},
	 {#sky_ladder_role.avatar_id, AvatarId}],
    ets:update_element(sky_ladder_role, RoleId, L).

calc_time() ->
    StartTime = date:unixtime() +
		  date:week_next_diff([6], {0, 0, 0}),
    EndTime = date:unixtime() +
		date:week_next_diff([7], {23, 0, 0}),
    {StartTime, EndTime}.

info(Info) -> sky_ladder_mgr ! Info.

cast(Info) -> gen_server:cast(sky_ladder_mgr, Info).

call(Info) ->
    case catch gen_server:call(sky_ladder_mgr, Info, 10000)
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
	    {__Pidsky_ladder_mgr85, _,
	     {__Levelsky_ladder_mgr85, __Tracessky_ladder_mgr85}}
		when __Levelsky_ladder_mgr85 band 8 /= 0 orelse
		       __Tracessky_ladder_mgr85 /= [] ->
		lager:do_log(error,
			     [{module, sky_ladder_mgr}, {function, call},
			      {line, 85}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [sky_ladder_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelsky_ladder_mgr85,
			     __Tracessky_ladder_mgr85, lager_event,
			     __Pidsky_ladder_mgr85);
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
    gen_server:start_link({local, sky_ladder_mgr},
			  sky_ladder_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr91, _,
       {__Levelsky_ladder_mgr91, __Tracessky_ladder_mgr91}}
	  when __Levelsky_ladder_mgr91 band 64 /= 0 orelse
		 __Tracessky_ladder_mgr91 /= [] ->
	  lager:do_log(info,
		       [{module, sky_ladder_mgr}, {function, init}, {line, 91},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [sky_ladder_mgr]), none,
		       4096, 64, __Levelsky_ladder_mgr91,
		       __Tracessky_ladder_mgr91, lager_event,
		       __Pidsky_ladder_mgr91);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(sky_ladder_role,
		   [{file, "./dets/sky_ladder_role.dets"},
		    {keypos, #sky_ladder_role.id}, {type, set}]),
    ets:new(sky_ladder_role,
	    [set, named_table, public,
	     {keypos, #sky_ladder_role.id}]),
    ets:new(sky_ladder_rank,
	    [set, named_table, public,
	     {keypos, #sky_ladder_rank.rank}]),
    d_ets_lib:new_d_ets(sky_ladder_role_log,
			"dets/sky_ladder_role_log.dets",
			#sky_ladder_role_log.id, set),
    do_ver(),
    info(init_local),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr99, _,
       {__Levelsky_ladder_mgr99, __Tracessky_ladder_mgr99}}
	  when __Levelsky_ladder_mgr99 band 64 /= 0 orelse
		 __Tracessky_ladder_mgr99 /= [] ->
	  lager:do_log(info,
		       [{module, sky_ladder_mgr}, {function, init}, {line, 99},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [sky_ladder_mgr]), none,
		       4096, 64, __Levelsky_ladder_mgr99,
		       __Tracessky_ladder_mgr99, lager_event,
		       __Pidsky_ladder_mgr99);
      _ -> ok
    end,
    case sys_env:get(platform) of
      "verifyios" ->
	  NewInfo = #{start_time => 0,
		      end_time => date:unixtime() + 86400 * 30,
		      status => open, is_main => 1, server_type => cluster},
	  save_env_info(NewInfo),
	  {ok, #state{status = 1, is_main = 1}};
      _ -> {ok, #state{}}
    end.

do_ver() ->
    Fun = fun (SkyLadderRole, Acc) ->
		  case is_record(SkyLadderRole, sky_ladder_role) of
		    true -> [SkyLadderRole | Acc];
		    _ ->
			{ok, NewSkyLadderRole} = ver(SkyLadderRole),
			[NewSkyLadderRole | Acc]
		  end
	  end,
    List = dets:foldl(Fun, [], sky_ladder_role),
    ets:insert(sky_ladder_role, List),
    dets:insert(sky_ladder_role, List).

ver({sky_ladder_role, Id, Name, Vip, Lev, Sex, Gid,
     GName, Face, Power, MaxPower, LookId, Rank, BestRank,
     Time, AvatarId, RobotUnit}) ->
    ver({sky_ladder_role, Id, Name, Vip, Lev, Sex, Gid,
	 GName, Face, Power, MaxPower, LookId, Rank, BestRank,
	 Time, AvatarId, RobotUnit, 0});
ver({sky_ladder_role, Id, Name, Vip, Lev, Sex, Gid,
     GName, Face, Power, MaxPower, LookId, Rank, BestRank,
     Time, AvatarId, RobotUnit, ContWin}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    ver({sky_ladder_role, Id, Name, Vip, Lev, Sex, Gid,
	 GName, Face, Power, MaxPower, LookId, Rank, BestRank,
	 Time, AvatarId, RobotUnit, ContWin, FaceUpdateTime,
	 FaceFile});
ver(SLR = #sky_ladder_role{}) -> {ok, SLR}.

handle_call({fight_begin, Rid, Rank, DefId, OldRidRank},
	    _From, State = #state{status = 1}) ->
    Reply = call_fight_begin(Rid, Rank, DefId, OldRidRank),
    {reply, Reply, State};
handle_call({fight_end, Data}, _From,
	    State = #state{status = 1}) ->
    Reply = call_fight_end(Data), {reply, Reply, State};
handle_call({fight_begin, _Rid, _Rank, _DefId,
	     _OldRidRank},
	    _From, State) ->
    {reply, skip, State};
handle_call({fight_end, _Data}, _From, State) ->
    {reply, skip, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(init_season,
	    State = #state{is_main = 1, status = 0}) ->
    do_init(),
    Info = #{end_time := EndTime,
	     server_type := ServerType} =
	       env_info(),
    NewInfo = Info#{status => open},
    save_env_info(NewInfo),
    case ServerType of
      cluster ->
	  cluster_dynamic_group:group_other_cast(1,
						 sky_ladder_mgr, info,
						 [{sync_cluster_info,
						   NewInfo}]);
      _ -> skip
    end,
    Now = date:unixtime(),
    util:unset_timer(do_init_timer),
    util:set_timer(do_reward_timer, EndTime - Now,
		   end_season),
    util:set_timer(add_highlight_timer,
		   60 * sky_ladder_data:get_const(watch_time),
		   add_highlight),
    role_group:apply(world, {sky_ladder, push_open, []}),
    role_group:apply(world,
		     {sky_ladder, push_combat_num, []}),
    {{_Y, _Month, Day}, {_Hour, _Minu, _}} =
	date:seconds_to_datetime(EndTime),
    mail:global_send(#gmail{id = {sky_ladder, Day},
			    end_time = EndTime,
			    subject =
				lang:get(<<"Thông báo mở chế độ Đấu Trường Liên "
					   "Máy Chủ"/utf8>>),
			    content =
				lang:get(<<"Kính thưa các nhẫn giả, chế độ Đấu Trường "
					   "Liên Máy Chủ hiện đã mở, tham gia sẽ "
					   "có cơ hội nhận được các phần thưởng "
					   "quý giá như danh hiệu hiếm, trang bị "
					   "cam, tinh hoa phù văn và nhiều phần "
					   "thưởng khác. Hãy nhanh tay tham gia!Hãy "
					   "tham gia ngay thôi!"/utf8>>),
			    conds =
				[{minlev,
				  sky_ladder_data:get_const(join_min_lev)}]}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr175, _,
       {__Levelsky_ladder_mgr175, __Tracessky_ladder_mgr175}}
	  when __Levelsky_ladder_mgr175 band 64 /= 0 orelse
		 __Tracessky_ladder_mgr175 /= [] ->
	  lager:do_log(info,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 175}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("init_season == ~w", [EndTime]), none,
		       4096, 64, __Levelsky_ladder_mgr175,
		       __Tracessky_ladder_mgr175, lager_event,
		       __Pidsky_ladder_mgr175);
      _ -> ok
    end,
    {noreply, State#state{status = 1}};
handle_info(reload_season,
	    State = #state{is_main = 1, status = 0}) ->
    do_reload(),
    Info = env_info(),
    NewInfo = Info#{status => open},
    save_env_info(NewInfo),
    cluster_dynamic_group:group_other_cast(1,
					   sky_ladder_mgr, info,
					   [{sync_cluster_info, NewInfo}]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr185, _,
       {__Levelsky_ladder_mgr185, __Tracessky_ladder_mgr185}}
	  when __Levelsky_ladder_mgr185 band 64 /= 0 orelse
		 __Tracessky_ladder_mgr185 /= [] ->
	  lager:do_log(info,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 185}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("reload_season == ~w", [NewInfo]), none,
		       4096, 64, __Levelsky_ladder_mgr185,
		       __Tracessky_ladder_mgr185, lager_event,
		       __Pidsky_ladder_mgr185);
      _ -> ok
    end,
    {noreply, State#state{status = 1}};
handle_info(end_season,
	    State = #state{is_main = 1, status = 1}) ->
    Info = env_info(),
    {StartTime, EndTime} = calc_time(),
    Now = date:unixtime(),
    season_reward(1),
    log_rank:save(33),
    HeroHall = sky_ladder_lib:list_rank(3),
    sys_env:save(sky_ladder_hero_hall, HeroHall),
    cluster_dynamic_group:group_other_cast(1,
					   sky_ladder_mgr, info,
					   [{sync_hero_hall, HeroHall}]),
    case EndTime > StartTime of
      true ->
	  case Info of
	    #{server_type := local} ->
		NewInfo = Info#{start_time => StartTime,
				end_time => EndTime, status => close},
		save_env_info(NewInfo),
		util:set_timer(do_init_timer, StartTime - Now,
			       init_season);
	    _ ->
		case cluster_dynamic_group:is_main(1) of
		  true ->
		      NewInfo = Info#{start_time => StartTime,
				      end_time => EndTime, status => close,
				      server_type => cluster, is_main => 1},
		      save_env_info(NewInfo),
		      cluster_dynamic_group:group_other_cast(1,
							     sky_ladder_mgr,
							     info,
							     [{sync_cluster_info,
							       NewInfo}]),
		      util:set_timer(do_init_timer, StartTime - Now,
				     init_season);
		  _ ->
		      NewInfo = Info#{start_time => StartTime,
				      end_time => EndTime, status => close,
				      server_type => cluster, is_main => 0},
		      save_env_info(NewInfo)
		end
	  end,
	  role_group:apply(world, {sky_ladder, push_open, []}),
	  role_group:apply(world,
			   {sky_ladder, push_combat_num, []}),
	  ok;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsky_ladder_mgr221, _,
	     {__Levelsky_ladder_mgr221, __Tracessky_ladder_mgr221}}
		when __Levelsky_ladder_mgr221 band 8 /= 0 orelse
		       __Tracessky_ladder_mgr221 /= [] ->
		lager:do_log(error,
			     [{module, sky_ladder_mgr}, {function, handle_info},
			      {line, 221}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("跨服天梯进入错误的结算时间【~w】【~w】",
					   [StartTime, EndTime]),
			     none, 4096, 8, __Levelsky_ladder_mgr221,
			     __Tracessky_ladder_mgr221, lager_event,
			     __Pidsky_ladder_mgr221);
	    _ -> ok
	  end,
	  skip
    end,
    Msg =
	color:msg(lang:get(<<"Cuộc tranh tài Liên Máy Chủ lần này "
			     "đã kết thúc, chúc mừng ~ts đã giành "
			     "được vị trí trong top 3! ~ts"/utf8>>),
		  [{list,
		    [{kf_name, Rid, Name}
		     || #sky_ladder_role{id = Rid = {_, SrvId}, name = Name}
			    <- sky_ladder_lib:list_rank(3),
			SrvId =/= <<"robot">>]},
		   {href,
		    {53, green, [],
		     lang:get(<<"【Hãy đi tới để kiểm tra!】"/utf8>>)}}]),
    cluster_dynamic_group:group_cast(1, notice, broadcast,
				     [rumor_left_top, Msg]),
    util:unset_timer(do_reward_timer),
    util:unset_timer(add_highlight_timer),
    IsMain = case Info of
	       #{server_type := local} -> 1;
	       _ ->
		   util:if_true(cluster_dynamic_group:is_main(1), 1, 0)
	     end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr232, _,
       {__Levelsky_ladder_mgr232, __Tracessky_ladder_mgr232}}
	  when __Levelsky_ladder_mgr232 band 64 /= 0 orelse
		 __Tracessky_ladder_mgr232 /= [] ->
	  lager:do_log(info,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 232}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("end_season == ~w",
				     [{StartTime, EndTime, IsMain, Info}]),
		       none, 4096, 64, __Levelsky_ladder_mgr232,
		       __Tracessky_ladder_mgr232, lager_event,
		       __Pidsky_ladder_mgr232);
      _ -> ok
    end,
    {noreply, State#state{status = 0, is_main = IsMain}};
handle_info({add_log, Id, Name, Face,
	     LogData = #sky_ladder_pk_log{replay_id = NReplayId},
	     ReplaySrvId, FaceUpdateTime, FaceFile},
	    State = #state{is_main = 1}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr237, _,
       {__Levelsky_ladder_mgr237, __Tracessky_ladder_mgr237}}
	  when __Levelsky_ladder_mgr237 band 128 /= 0 orelse
		 __Tracessky_ladder_mgr237 /= [] ->
	  lager:do_log(debug,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 237}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("【~w】【~ts】玩家增加天梯录像", [Id, Name]), none,
		       4096, 128, __Levelsky_ladder_mgr237,
		       __Tracessky_ladder_mgr237, lager_event,
		       __Pidsky_ladder_mgr237);
      _ -> ok
    end,
    #sky_ladder_role_log{logs = Logs} =
	sky_ladder_lib:get_log(Id),
    LogId = case Logs of
	      [#sky_ladder_pk_log{id = LogId1} | _]
		  when LogId1 < 100 ->
		  LogId1 + 1;
	      _ -> 1
	    end,
    cluster_lib:cast(ReplaySrvId, combat_replay_mgr,
		     acc_replay_reference, [NReplayId]),
    {NewLogs, DelLogs} = list_util:split(10,
					 [LogData#sky_ladder_pk_log{id = LogId}
					  | Logs]),
    [cluster_lib:cast(ReplaySrvId, combat_replay_mgr,
		      dec_cluster_replay_reference, [{ReplayId, ReplaySrvId}])
     || #sky_ladder_pk_log{replay_id = ReplayId} <- DelLogs],
    OK = ets:update_element(sky_ladder_role_log, Id,
			    [{#sky_ladder_role_log.logs, NewLogs},
			     {#sky_ladder_role_log.name, Name},
			     {#sky_ladder_role_log.face, Face},
			     {#sky_ladder_role_log.face_update_time,
			      FaceUpdateTime},
			     {#sky_ladder_role_log.face_file, FaceFile}]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr247, _,
       {__Levelsky_ladder_mgr247, __Tracessky_ladder_mgr247}}
	  when __Levelsky_ladder_mgr247 band 128 /= 0 orelse
		 __Tracessky_ladder_mgr247 /= [] ->
	  lager:do_log(debug,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 247}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("【~ts】玩家增加日志结果【~w】", [Name, OK]), none,
		       4096, 128, __Levelsky_ladder_mgr247,
		       __Tracessky_ladder_mgr247, lager_event,
		       __Pidsky_ladder_mgr247);
      _ -> ok
    end,
    {noreply, State};
handle_info(add_highlight,
	    State = #state{is_main = 1, status = 1}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr251, _,
       {__Levelsky_ladder_mgr251, __Tracessky_ladder_mgr251}}
	  when __Levelsky_ladder_mgr251 band 128 /= 0 orelse
		 __Tracessky_ladder_mgr251 /= [] ->
	  lager:do_log(debug,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 251}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "跨服天梯新增亮眼表现", none, 4096, 128, __Levelsky_ladder_mgr251,
		       __Tracessky_ladder_mgr251, lager_event,
		       __Pidsky_ladder_mgr251);
      _ -> ok
    end,
    #sky_ladder_role_log{logs = Logs} =
	sky_ladder_lib:get_log(0),
    NLogs = match_highlight(),
    {NewLogs, DelLogs} = list_util:split(20, NLogs ++ Logs),
    [cluster_lib:cast(SrvId, combat_replay_mgr,
		      acc_replay_reference, [ReplayId])
     || #sky_ladder_highlight{atk_id = {_, SrvId},
			      replay_id = ReplayId}
	    <- NLogs],
    [cluster_lib:cast(SrvId, combat_replay_mgr,
		      dec_cluster_replay_reference, [{ReplayId, SrvId}])
     || #sky_ladder_highlight{atk_id = {_, SrvId},
			      replay_id = ReplayId}
	    <- DelLogs],
    ets:update_element(sky_ladder_role_log, 0,
		       [{#sky_ladder_role_log.logs, NewLogs}]),
    util:set_timer(add_highlight_timer,
		   60 * sky_ladder_data:get_const(watch_time),
		   add_highlight),
    {noreply, State};
handle_info({set_combat_pid, Rid, Rank, ComPid},
	    State = #state{is_main = 1}) ->
    case ets:lookup(sky_ladder_rank, Rank) of
      [#sky_ladder_rank{fight_rid = Rid, is_fight = 1}] ->
	  ets:update_element(sky_ladder_rank, Rank,
			     [{#sky_ladder_rank.fight_pid, ComPid}]);
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsky_ladder_mgr266, _,
	     {__Levelsky_ladder_mgr266, __Tracessky_ladder_mgr266}}
		when __Levelsky_ladder_mgr266 band 8 /= 0 orelse
		       __Tracessky_ladder_mgr266 /= [] ->
		lager:do_log(error,
			     [{module, sky_ladder_mgr}, {function, handle_info},
			      {line, 266}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("更新战斗状态异常 rid=~w rank=~w err=~w",
					   [Rid, Rank, _Err]),
			     none, 4096, 8, __Levelsky_ladder_mgr266,
			     __Tracessky_ladder_mgr266, lager_event,
			     __Pidsky_ladder_mgr266);
	    _ -> ok
	  end
    end,
    {noreply, State};
handle_info({del_combat, _Rid, Rank},
	    State = #state{is_main = 1}) ->
    ets:update_element(sky_ladder_rank, Rank,
		       [{#sky_ladder_rank.is_fight, 0},
			{#sky_ladder_rank.fight_rid, {0, <<>>}},
			{#sky_ladder_rank.fight_pid, 0}]),
    {noreply, State};
handle_info(cluster_open, State) ->
    Now = date:unixtime(),
    case env_info() of
      Info = #{server_type := local, status := close,
	       start_time := StartTime} ->
	  case cluster_dynamic_group:is_main(1) of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidsky_ladder_mgr280, _,
		   {__Levelsky_ladder_mgr280, __Tracessky_ladder_mgr280}}
		      when __Levelsky_ladder_mgr280 band 64 /= 0 orelse
			     __Tracessky_ladder_mgr280 /= [] ->
		      lager:do_log(info,
				   [{module, sky_ladder_mgr},
				    {function, handle_info}, {line, 280},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "跨服天梯由本地转换为跨服模式, 本服为主服", none, 4096, 64,
				   __Levelsky_ladder_mgr280,
				   __Tracessky_ladder_mgr280, lager_event,
				   __Pidsky_ladder_mgr280);
		  _ -> ok
		end,
		NewInfo = Info#{is_main => 1, server_type => cluster},
		save_env_info(NewInfo),
		util:set_timer(do_init_timer, StartTime - Now,
			       init_season),
		{noreply, State#state{is_main = 1}};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidsky_ladder_mgr286, _,
		   {__Levelsky_ladder_mgr286, __Tracessky_ladder_mgr286}}
		      when __Levelsky_ladder_mgr286 band 64 /= 0 orelse
			     __Tracessky_ladder_mgr286 /= [] ->
		      lager:do_log(info,
				   [{module, sky_ladder_mgr},
				    {function, handle_info}, {line, 286},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "跨服天梯由本地转换为跨服模式, 本服非主服", none, 4096, 64,
				   __Levelsky_ladder_mgr286,
				   __Tracessky_ladder_mgr286, lager_event,
				   __Pidsky_ladder_mgr286);
		  _ -> ok
		end,
		NewInfo = Info#{is_main => 0, server_type => cluster},
		save_env_info(NewInfo),
		util:unset_timer(add_highlight_timer),
		util:unset_timer(do_init_timer),
		util:unset_timer(do_reward_timer),
		{noreply, State#state{is_main = 0}}
	  end;
      Info = #{server_type := local, status := open} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsky_ladder_mgr295, _,
	     {__Levelsky_ladder_mgr295, __Tracessky_ladder_mgr295}}
		when __Levelsky_ladder_mgr295 band 64 /= 0 orelse
		       __Tracessky_ladder_mgr295 /= [] ->
		lager:do_log(info,
			     [{module, sky_ladder_mgr}, {function, handle_info},
			      {line, 295}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "跨服天梯由本地转换为待跨服模式", none, 4096, 64,
			     __Levelsky_ladder_mgr295,
			     __Tracessky_ladder_mgr295, lager_event,
			     __Pidsky_ladder_mgr295);
	    _ -> ok
	  end,
	  NewInfo = Info#{server_type => ready_cluster},
	  save_env_info(NewInfo),
	  {noreply, State};
      #{server_type := ready_cluster} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsky_ladder_mgr300, _,
	     {__Levelsky_ladder_mgr300, __Tracessky_ladder_mgr300}}
		when __Levelsky_ladder_mgr300 band 64 /= 0 orelse
		       __Tracessky_ladder_mgr300 /= [] ->
		lager:do_log(info,
			     [{module, sky_ladder_mgr}, {function, handle_info},
			      {line, 300}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "跨服天梯待跨服模式时收到通知，不做处理", none, 4096, 64,
			     __Levelsky_ladder_mgr300,
			     __Tracessky_ladder_mgr300, lager_event,
			     __Pidsky_ladder_mgr300);
	    _ -> ok
	  end,
	  {noreply, State};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsky_ladder_mgr303, _,
	     {__Levelsky_ladder_mgr303, __Tracessky_ladder_mgr303}}
		when __Levelsky_ladder_mgr303 band 64 /= 0 orelse
		       __Tracessky_ladder_mgr303 /= [] ->
		lager:do_log(info,
			     [{module, sky_ladder_mgr}, {function, handle_info},
			      {line, 303}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "跨服天梯跨服模式开启", none, 4096, 64,
			     __Levelsky_ladder_mgr303,
			     __Tracessky_ladder_mgr303, lager_event,
			     __Pidsky_ladder_mgr303);
	    _ -> ok
	  end,
	  case cluster_dynamic_group:is_main(1) of
	    true ->
		{StartTime, EndTime} = calc_time(),
		case env_info() of
		  Info = #{start_time := 0} ->
		      case StartTime > EndTime of
			true ->
			    NewInfo = Info#{start_time => Now,
					    end_time => EndTime, status => open,
					    is_main => 1,
					    server_type => cluster},
			    save_env_info(NewInfo),
			    do_init(),
			    util:set_timer(do_reward_timer, EndTime - Now,
					   end_season),
			    cluster_dynamic_group:group_other_cast(1,
								   sky_ladder_mgr,
								   info,
								   [{sync_cluster_info,
								     NewInfo}]),
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
			      {__Pidsky_ladder_mgr316, _,
			       {__Levelsky_ladder_mgr316,
				__Tracessky_ladder_mgr316}}
				  when __Levelsky_ladder_mgr316 band 64 /= 0
					 orelse
					 __Tracessky_ladder_mgr316 /= [] ->
				  lager:do_log(info,
					       [{module, sky_ladder_mgr},
						{function, handle_info},
						{line, 316},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("跨服天梯跨服模式开启:~w",
							     [{StartTime,
							       EndTime}]),
					       none, 4096, 64,
					       __Levelsky_ladder_mgr316,
					       __Tracessky_ladder_mgr316,
					       lager_event,
					       __Pidsky_ladder_mgr316);
			      _ -> ok
			    end,
			    {noreply, State#state{is_main = 1, status = 1}};
			_ ->
			    NewInfo = Info#{start_time => StartTime,
					    end_time => EndTime,
					    status => close, is_main => 1,
					    server_type => cluster},
			    save_env_info(NewInfo),
			    util:set_timer(do_init_timer, StartTime - Now,
					   init_season),
			    cluster_dynamic_group:group_other_cast(1,
								   sky_ladder_mgr,
								   info,
								   [{sync_cluster_info,
								     NewInfo}]),
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
			      {__Pidsky_ladder_mgr323, _,
			       {__Levelsky_ladder_mgr323,
				__Tracessky_ladder_mgr323}}
				  when __Levelsky_ladder_mgr323 band 64 /= 0
					 orelse
					 __Tracessky_ladder_mgr323 /= [] ->
				  lager:do_log(info,
					       [{module, sky_ladder_mgr},
						{function, handle_info},
						{line, 323},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("跨服天梯跨服模式开启:~w",
							     [{StartTime,
							       EndTime}]),
					       none, 4096, 64,
					       __Levelsky_ladder_mgr323,
					       __Tracessky_ladder_mgr323,
					       lager_event,
					       __Pidsky_ladder_mgr323);
			      _ -> ok
			    end,
			    {noreply, State#state{is_main = 1}}
		      end;
		  Info = #{start_time := OldStartTime,
			   end_time := OldEndTime} ->
		      case Now >= OldStartTime andalso OldEndTime > Now of
			true ->
			    NewInfo = Info#{status => open, is_main => 1,
					    server_type => cluster},
			    save_env_info(NewInfo),
			    do_reload(),
			    util:set_timer(do_reward_timer, OldEndTime - Now,
					   end_season),
			    cluster_dynamic_group:group_other_cast(1,
								   sky_ladder_mgr,
								   info,
								   [{sync_cluster_info,
								     NewInfo}]),
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
			      {__Pidsky_ladder_mgr334, _,
			       {__Levelsky_ladder_mgr334,
				__Tracessky_ladder_mgr334}}
				  when __Levelsky_ladder_mgr334 band 64 /= 0
					 orelse
					 __Tracessky_ladder_mgr334 /= [] ->
				  lager:do_log(info,
					       [{module, sky_ladder_mgr},
						{function, handle_info},
						{line, 334},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("跨服天梯跨服模式开启:~w",
							     [{StartTime,
							       EndTime}]),
					       none, 4096, 64,
					       __Levelsky_ladder_mgr334,
					       __Tracessky_ladder_mgr334,
					       lager_event,
					       __Pidsky_ladder_mgr334);
			      _ -> ok
			    end,
			    {noreply, State#state{is_main = 1, status = 1}};
			_ ->
			    NewInfo = Info#{status => close, is_main => 1,
					    server_type => cluster},
			    save_env_info(NewInfo),
			    do_reload(),
			    util:set_timer(do_init_timer, OldStartTime - Now,
					   init_season),
			    cluster_dynamic_group:group_other_cast(1,
								   sky_ladder_mgr,
								   info,
								   [{sync_cluster_info,
								     NewInfo}]),
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
			      {__Pidsky_ladder_mgr342, _,
			       {__Levelsky_ladder_mgr342,
				__Tracessky_ladder_mgr342}}
				  when __Levelsky_ladder_mgr342 band 64 /= 0
					 orelse
					 __Tracessky_ladder_mgr342 /= [] ->
				  lager:do_log(info,
					       [{module, sky_ladder_mgr},
						{function, handle_info},
						{line, 342},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("跨服天梯跨服模式开启:~w",
							     [{StartTime,
							       EndTime}]),
					       none, 4096, 64,
					       __Levelsky_ladder_mgr342,
					       __Tracessky_ladder_mgr342,
					       lager_event,
					       __Pidsky_ladder_mgr342);
			      _ -> ok
			    end,
			    {noreply, State#state{is_main = 1}}
		      end
		end;
	    _ -> {noreply, State}
	  end
    end;
handle_info(init_local, State) ->
    Now = date:unixtime(),
    {StartTime, EndTime} = calc_time(),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr355, _,
       {__Levelsky_ladder_mgr355, __Tracessky_ladder_mgr355}}
	  when __Levelsky_ladder_mgr355 band 64 /= 0 orelse
		 __Tracessky_ladder_mgr355 /= [] ->
	  lager:do_log(info,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 355}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("init_local==~w", [{StartTime, EndTime}]),
		       none, 4096, 64, __Levelsky_ladder_mgr355,
		       __Tracessky_ladder_mgr355, lager_event,
		       __Pidsky_ladder_mgr355);
      _ -> ok
    end,
    case env_info() of
      Info = #{start_time := 0} ->
	  case StartTime > EndTime of
	    true ->
		NewInfo = Info#{start_time => Now, end_time => EndTime,
				status => open, is_main => 1,
				server_type => local},
		save_env_info(NewInfo),
		do_init(),
		util:set_timer(do_reward_timer, EndTime - Now,
			       end_season),
		{noreply, State#state{is_main = 1, status = 1}};
	    _ ->
		NewInfo = Info#{start_time => StartTime,
				end_time => EndTime, status => close,
				is_main => 1, server_type => local},
		save_env_info(NewInfo),
		util:set_timer(do_init_timer, StartTime - Now,
			       init_season),
		{noreply, State#state{is_main = 1}}
	  end;
      Info = #{start_time := OldStartTime,
	       end_time := OldEndTime, server_type := ServerType}
	  when ServerType == local orelse
		 ServerType == ready_cluster ->
	  case Now >= OldStartTime andalso OldEndTime > Now of
	    true ->
		NewInfo = Info#{status => open, is_main => 1},
		save_env_info(NewInfo),
		do_reload(),
		util:set_timer(do_reward_timer, OldEndTime - Now,
			       end_season),
		{noreply, State#state{is_main = 1, status = 1}};
	    _ ->
		NewInfo = Info#{status => close, is_main => 1},
		save_env_info(NewInfo),
		do_reload(),
		util:set_timer(do_init_timer, OldStartTime - Now,
			       init_season),
		{noreply, State#state{is_main = 1}}
	  end;
      _Info -> {noreply, State}
    end;
handle_info({sync_cluster_info, Info}, State)
    when is_map(Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr391, _,
       {__Levelsky_ladder_mgr391, __Tracessky_ladder_mgr391}}
	  when __Levelsky_ladder_mgr391 band 64 /= 0 orelse
		 __Tracessky_ladder_mgr391 /= [] ->
	  lager:do_log(info,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 391}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("天梯同步状态 ~w", [Info]), none, 4096, 64,
		       __Levelsky_ladder_mgr391, __Tracessky_ladder_mgr391,
		       lager_event, __Pidsky_ladder_mgr391);
      _ -> ok
    end,
    case env_info() of
      #{server_type := ServerType}
	  when ServerType == local orelse
		 ServerType == ready_cluster ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsky_ladder_mgr394, _,
	     {__Levelsky_ladder_mgr394, __Tracessky_ladder_mgr394}}
		when __Levelsky_ladder_mgr394 band 64 /= 0 orelse
		       __Tracessky_ladder_mgr394 /= [] ->
		lager:do_log(info,
			     [{module, sky_ladder_mgr}, {function, handle_info},
			      {line, 394}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("天梯同步状态时不满足状态 ~w", [ServerType]),
			     none, 4096, 64, __Levelsky_ladder_mgr394,
			     __Tracessky_ladder_mgr394, lager_event,
			     __Pidsky_ladder_mgr394);
	    _ -> ok
	  end,
	  {noreply, State};
      _ ->
	  case cluster_dynamic_group:is_main(1) of
	    false ->
		util:unset_timer(add_highlight_timer),
		util:unset_timer(do_init_timer),
		util:unset_timer(do_reward_timer),
		save_env_info(Info#{is_main => 0,
				    server_type => cluster}),
		role_group:apply(world, {sky_ladder, push_open, []}),
		role_group:apply(world,
				 {sky_ladder, push_combat_num, []}),
		case Info of
		  #{status := open, end_time := EndTime} ->
		      {{_Y, _Month, Day}, {_Hour, _Minu, _}} =
			  date:seconds_to_datetime(EndTime),
		      mail:global_send(#gmail{id = {sky_ladder, Day},
					      end_time = EndTime,
					      subject =
						  lang:get(<<"Thông báo mở chế độ Đấu Trường Liên "
							     "Máy Chủ"/utf8>>),
					      content =
						  lang:get(<<"Kính thưa các nhẫn giả, chế độ Đấu Trường "
							     "Liên Máy Chủ hiện đã mở, tham gia sẽ "
							     "có cơ hội nhận được các phần thưởng "
							     "quý giá như danh hiệu hiếm, trang bị "
							     "cam, tinh hoa phù văn và nhiều phần "
							     "thưởng khác. Hãy nhanh tay tham gia!Hãy "
							     "tham gia ngay thôi!"/utf8>>),
					      conds =
						  [{minlev,
						    sky_ladder_data:get_const(join_min_lev)}]});
		  _ -> skip
		end,
		{noreply, State#state{is_main = 0}};
	    _ -> {noreply, State}
	  end
    end;
handle_info({sync_hero_hall, HeroHall}, State) ->
    case cluster_dynamic_group:is_main(1) of
      false ->
	  sys_env:save(sky_ladder_hero_hall, HeroHall),
	  {noreply, State};
      _ -> {noreply, State}
    end;
handle_info(clear_data, State = #state{status = 0}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr427, _,
       {__Levelsky_ladder_mgr427, __Tracessky_ladder_mgr427}}
	  when __Levelsky_ladder_mgr427 band 64 /= 0 orelse
		 __Tracessky_ladder_mgr427 /= [] ->
	  lager:do_log(info,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 427}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "clear_data", none, 4096, 64, __Levelsky_ladder_mgr427,
		       __Tracessky_ladder_mgr427, lager_event,
		       __Pidsky_ladder_mgr427);
      _ -> ok
    end,
    ets:delete_all_objects(sky_ladder_rank),
    ets:delete_all_objects(sky_ladder_role),
    dets:delete_all_objects(sky_ladder_role),
    erlang:send_after((date:next_diff(2, 30, 0) +
			 util:rand(300, 3000))
			* 1000,
		      sky_ladder_mgr, del_overdue_log),
    {noreply, State};
handle_info(clear_data, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr435, _,
       {__Levelsky_ladder_mgr435, __Tracessky_ladder_mgr435}}
	  when __Levelsky_ladder_mgr435 band 8 /= 0 orelse
		 __Tracessky_ladder_mgr435 /= [] ->
	  lager:do_log(error,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 435}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "在天梯赛进行期间重新分配了跨服分组", none, 4096, 8,
		       __Levelsky_ladder_mgr435, __Tracessky_ladder_mgr435,
		       lager_event, __Pidsky_ladder_mgr435);
      _ -> ok
    end,
    {noreply, State};
handle_info(del_overdue_log, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr439, _,
       {__Levelsky_ladder_mgr439, __Tracessky_ladder_mgr439}}
	  when __Levelsky_ladder_mgr439 band 64 /= 0 orelse
		 __Tracessky_ladder_mgr439 /= [] ->
	  lager:do_log(info,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 439}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("开始录像删除， 大小 ~w",
				     [dets:info(sky_ladder_role_log, size)]),
		       none, 4096, 64, __Levelsky_ladder_mgr439,
		       __Tracessky_ladder_mgr439, lager_event,
		       __Pidsky_ladder_mgr439);
      _ -> ok
    end,
    try Fun = fun (Log, Acc)
		      when is_tuple(Log) andalso
			     element(1, Log) =:= sky_ladder_role_log ->
		      #sky_ladder_role_log{logs = Logs, id = RoleId} =
			  sky_ladder_lib:log_ver(Log),
		      case ets:lookup(sky_ladder_role_log, RoleId) of
			[#sky_ladder_role_log{logs = Logs0}] ->
			    [del_log(Temp, RoleId) || Temp <- Logs0];
			_ -> [del_log(Temp, RoleId) || Temp <- Logs]
		      end,
		      Acc;
		  (_, Acc) -> Acc
	      end,
	dets:foldl(Fun, [], sky_ladder_role_log),
	dets:delete_all_objects(sky_ladder_role_log),
	ets:delete_all_objects(sky_ladder_role_log)
    catch
      _TryC:_TryE ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsky_ladder_mgr458, _,
	     {__Levelsky_ladder_mgr458, __Tracessky_ladder_mgr458}}
		when __Levelsky_ladder_mgr458 band 8 /= 0 orelse
		       __Tracessky_ladder_mgr458 /= [] ->
		lager:do_log(error,
			     [{module, sky_ladder_mgr}, {function, handle_info},
			      {line, 458}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("出错啦:~w : ~w error:~w",
					   [_TryC, _TryE,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelsky_ladder_mgr458,
			     __Tracessky_ladder_mgr458, lager_event,
			     __Pidsky_ladder_mgr458);
	    _ -> ok
	  end
    end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr460, _,
       {__Levelsky_ladder_mgr460, __Tracessky_ladder_mgr460}}
	  when __Levelsky_ladder_mgr460 band 64 /= 0 orelse
		 __Tracessky_ladder_mgr460 /= [] ->
	  lager:do_log(info,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 460}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "录像删除完毕", none, 4096, 64, __Levelsky_ladder_mgr460,
		       __Tracessky_ladder_mgr460, lager_event,
		       __Pidsky_ladder_mgr460);
      _ -> ok
    end,
    {noreply, State};
handle_info(gm_open, State = #state{is_main = 1}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr464, _,
       {__Levelsky_ladder_mgr464, __Tracessky_ladder_mgr464}}
	  when __Levelsky_ladder_mgr464 band 64 /= 0 orelse
		 __Tracessky_ladder_mgr464 /= [] ->
	  lager:do_log(info,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 464}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "GM有人输入了临时开启天梯赛", none, 4096, 64,
		       __Levelsky_ladder_mgr464, __Tracessky_ladder_mgr464,
		       lager_event, __Pidsky_ladder_mgr464);
      _ -> ok
    end,
    Now = date:unixtime(),
    case env_info() of
      Info = #{start_time := StartTime}
	  when StartTime > Now orelse StartTime =:= 0 ->
	  NewEndTime = Now + date:next_diff(23, 0, 0),
	  NewInfo = Info#{start_time => Now,
			  end_time => NewEndTime},
	  save_env_info(NewInfo),
	  util:set_timer(do_init_timer, 5, init_season),
	  cluster_dynamic_group:group_other_cast(1,
						 sky_ladder_mgr, info,
						 [{sync_cluster_info,
						   NewInfo}]),
	  {noreply, State};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsky_ladder_mgr475, _,
	     {__Levelsky_ladder_mgr475, __Tracessky_ladder_mgr475}}
		when __Levelsky_ladder_mgr475 band 64 /= 0 orelse
		       __Tracessky_ladder_mgr475 /= [] ->
		lager:do_log(info,
			     [{module, sky_ladder_mgr}, {function, handle_info},
			      {line, 475}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "GM天梯赛已经在开启阶段", none, 4096, 64,
			     __Levelsky_ladder_mgr475,
			     __Tracessky_ladder_mgr475, lager_event,
			     __Pidsky_ladder_mgr475);
	    _ -> ok
	  end,
	  {noreply, State}
    end;
handle_info(gm_close, State = #state{is_main = 1}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr480, _,
       {__Levelsky_ladder_mgr480, __Tracessky_ladder_mgr480}}
	  when __Levelsky_ladder_mgr480 band 64 /= 0 orelse
		 __Tracessky_ladder_mgr480 /= [] ->
	  lager:do_log(info,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 480}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "GM有人输入了关闭天梯赛", none, 4096, 64,
		       __Levelsky_ladder_mgr480, __Tracessky_ladder_mgr480,
		       lager_event, __Pidsky_ladder_mgr480);
      _ -> ok
    end,
    case env_info() of
      #{status := open} ->
	  util:set_timer(do_reward_timer, 5, end_season),
	  {noreply, State};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsky_ladder_mgr486, _,
	     {__Levelsky_ladder_mgr486, __Tracessky_ladder_mgr486}}
		when __Levelsky_ladder_mgr486 band 64 /= 0 orelse
		       __Tracessky_ladder_mgr486 /= [] ->
		lager:do_log(info,
			     [{module, sky_ladder_mgr}, {function, handle_info},
			      {line, 486}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "GM天梯赛已经在关闭阶段", none, 4096, 64,
			     __Levelsky_ladder_mgr486,
			     __Tracessky_ladder_mgr486, lager_event,
			     __Pidsky_ladder_mgr486);
	    _ -> ok
	  end,
	  {noreply, State}
    end;
handle_info(gm_reset_robot, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr491, _,
       {__Levelsky_ladder_mgr491, __Tracessky_ladder_mgr491}}
	  when __Levelsky_ladder_mgr491 band 64 /= 0 orelse
		 __Tracessky_ladder_mgr491 /= [] ->
	  lager:do_log(info,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 491}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "正在重新替换天梯机器人数据", none, 4096, 64,
		       __Levelsky_ladder_mgr491, __Tracessky_ladder_mgr491,
		       lager_event, __Pidsky_ladder_mgr491);
      _ -> ok
    end,
    ets:delete_all_objects(sky_ladder_rank),
    Fun = fun (#sky_ladder_role{id = RoleId = {_, SrvId},
				rank = Rank},
	       OK) ->
		  case SrvId =/= <<"robot">> of
		    true ->
			ets:insert(sky_ladder_rank,
				   #sky_ladder_rank{rank = Rank, id = RoleId});
		    _ -> skip
		  end,
		  OK
	  end,
    ets:foldl(Fun, ok, sky_ladder_role),
    init_robot(sky_ladder_data:get_const(max_number), []),
    {noreply, State};
handle_info(_Info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr505, _,
       {__Levelsky_ladder_mgr505, __Tracessky_ladder_mgr505}}
	  when __Levelsky_ladder_mgr505 band 8 /= 0 orelse
		 __Tracessky_ladder_mgr505 /= [] ->
	  lager:do_log(error,
		       [{module, sky_ladder_mgr}, {function, handle_info},
			{line, 505}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("error_info==~w ~w", [_Info, State]),
		       none, 4096, 8, __Levelsky_ladder_mgr505,
		       __Tracessky_ladder_mgr505, lager_event,
		       __Pidsky_ladder_mgr505);
      _ -> ok
    end,
    {noreply, State}.

terminate(_Reason, _State) ->
    Info = env_info(),
    save_env_info(Info#{status => close}),
    dets:insert(sky_ladder_role,
		ets:tab2list(sky_ladder_role)),
    dets:insert(sky_ladder_role_log,
		[Log
		 || Log = #sky_ladder_role_log{logs = Logs}
			<- ets:tab2list(sky_ladder_role_log),
		    Logs =/= []]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr513, _,
       {__Levelsky_ladder_mgr513, __Tracessky_ladder_mgr513}}
	  when __Levelsky_ladder_mgr513 band 64 /= 0 orelse
		 __Tracessky_ladder_mgr513 /= [] ->
	  lager:do_log(info,
		       [{module, sky_ladder_mgr}, {function, terminate},
			{line, 513}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelsky_ladder_mgr513,
		       __Tracessky_ladder_mgr513, lager_event,
		       __Pidsky_ladder_mgr513);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_init() ->
    log_rank:save(33),
    ets:delete_all_objects(sky_ladder_rank),
    ets:delete_all_objects(sky_ladder_role),
    dets:delete_all_objects(sky_ladder_role),
    init_robot(sky_ladder_data:get_const(max_number), []),
    ok.

do_reload() ->
    dets:to_ets(sky_ladder_role, sky_ladder_role),
    Fun = fun (#sky_ladder_role{id = RoleId, rank = Rank},
	       Rank1) ->
		  case Rank > 0 of
		    true ->
			ets:insert(sky_ladder_rank,
				   #sky_ladder_rank{rank = Rank, id = RoleId});
		    _ -> skip
		  end,
		  max(Rank, Rank1)
	  end,
    ets:foldl(Fun, 0, sky_ladder_role),
    init_robot(sky_ladder_data:get_const(max_number), []),
    util:set_timer(add_highlight_timer,
		   60 * sky_ladder_data:get_const(watch_time),
		   add_highlight),
    ok.

env_info() ->
    sys_env:get(sky_ladder_cluster_info,
		#{is_main => 0, start_time => 0, end_time => 0,
		  status => close, server_type => none}).

save_env_info(Val) ->
    sys_env:save(sky_ladder_cluster_info, Val).

season_reward(Rank) ->
    case sky_ladder_data:day_rank_reward(Rank) of
      Items = [_ | _] ->
	  case sky_ladder_lib:rank_role(Rank) of
	    {ok, #sky_ladder_role{id = {_, <<"robot">>}}} ->
		season_reward(Rank + 1);
	    {ok, #sky_ladder_role{id = RoleId = {_, Sid}}} ->
		mail:send(RoleId,
			  {lang:get(<<"Liên server"/utf8>>),
			   color:msg(lang:get(<<"Nhẫn giả thân mến, bạn đã được xếp hạng "
						"~ts trong bảng xếp hạng của mùa giải "
						"này, và bạn sẽ nhận được phần thưởng "
						"xếp hạng sau! Hãy theo kịp!ヾ （≧ ∇ ≦） "
						"〃"/utf8>>),
				     [{green, Rank}]),
			   items, Items, <<"跨服天梯"/utf8>>}),
		catch cluster_lib:cast(Sid, room_feat_mgr, info,
				       [{sky_ladder_do_feat, RoleId, Rank}]),
		catch cluster_lib:cast(Sid, role_weekly_mgr, info,
				       [{sky_ladder_rank, RoleId, Rank}]),
		season_reward(Rank + 1);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidsky_ladder_mgr564, _,
		   {__Levelsky_ladder_mgr564, __Tracessky_ladder_mgr564}}
		      when __Levelsky_ladder_mgr564 band 8 /= 0 orelse
			     __Tracessky_ladder_mgr564 /= [] ->
		      lager:do_log(error,
				   [{module, sky_ladder_mgr},
				    {function, season_reward}, {line, 564},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("Phần thưởng liên server[~w]",
						 [Rank]),
				   none, 4096, 8, __Levelsky_ladder_mgr564,
				   __Tracessky_ladder_mgr564, lager_event,
				   __Pidsky_ladder_mgr564);
		  _ -> ok
		end,
		ok
	  end;
      _ -> ok
    end.

-spec fight_begin(Role :: #role{},
		  Rank :: non_neg_integer(), DefId :: tuple()) -> ok |
								  {false,
								   binary() |
								   #sky_ladder_rank{}}.

fight_begin(#role{id = Rid,
		  m_sky_ladder = #m_sky_ladder{merge_index = OldRidRank}},
	    Rank, DefId) ->
    sky_ladder_mgr:send_call(sky_ladder_mgr, call,
			     [{fight_begin, Rid, Rank, DefId, OldRidRank}]).

-spec fight_end({AtkRid, DefRid, Result,
		 FightTime}) -> {ok, FightRet} |
				{false, Msg} when AtkRid :: tuple(),
						  DefRid :: tuple(),
						  Result :: #combat_result{},
						  FightTime :: integer(),
						  FightRet ::
						      #sky_ladder_result{},
						  Msg :: binary().

fight_end(Data) ->
    sky_ladder_mgr:send_call(sky_ladder_mgr, call,
			     [{fight_end, Data}]).

del_combat(Rid, Rank) ->
    sky_ladder_mgr:send_info(sky_ladder_mgr, info,
			     [{del_combat, Rid, Rank}]).

set_combat_pid(Rid, Rank, ComPid) ->
    sky_ladder_mgr:send_info(sky_ladder_mgr, info,
			     [{set_combat_pid, Rid, Rank, ComPid}]).

call_fight_begin(Rid, Rank, DefId, OldRidRank) ->
    NewRidRank = sky_ladder_lib:role_rank(Rid),
    IsChange = sky_ladder_data:match_rank(OldRidRank) =/=
		 sky_ladder_data:match_rank(NewRidRank),
    Now = date:unixtime(),
    case ets:lookup(sky_ladder_rank, Rank) of
      [#sky_ladder_rank{id = DefId, is_fight = 1,
			fight_pid = FightTime}]
	  when is_integer(FightTime) ->
	  case Now - FightTime > 10 of
	    true ->
		ets:update_element(sky_ladder_rank, Rank,
				   [{#sky_ladder_rank.is_fight, 0},
				    {#sky_ladder_rank.fight_rid, {0, <<>>}},
				    {#sky_ladder_rank.fight_pid, 0}]),
		{ok, Rank};
	    _ ->
		{false,
		 lang:get(<<"Người chơi trong bảng xếp hạng đang "
			    "bị thử thách, vui lòng thử lại sau."/utf8>>)}
	  end;
      [#sky_ladder_rank{id = DefId, is_fight = 1,
			fight_pid = ComPid}] ->
	  case util:is_process_alive(ComPid) of
	    true -> pass;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidsky_ladder_mgr610, _,
		   {__Levelsky_ladder_mgr610, __Tracessky_ladder_mgr610}}
		      when __Levelsky_ladder_mgr610 band 8 /= 0 orelse
			     __Tracessky_ladder_mgr610 /= [] ->
		      lager:do_log(error,
				   [{module, sky_ladder_mgr},
				    {function, call_fight_begin}, {line, 610},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("天梯战斗状态异常rank=~w, id=~w, combat_pid=~w",
						 [Rank, DefId, ComPid]),
				   none, 4096, 8, __Levelsky_ladder_mgr610,
				   __Tracessky_ladder_mgr610, lager_event,
				   __Pidsky_ladder_mgr610);
		  _ -> ok
		end,
		ets:update_element(sky_ladder_rank, Rank,
				   [{#sky_ladder_rank.is_fight, 0},
				    {#sky_ladder_rank.fight_rid, {0, <<>>}},
				    {#sky_ladder_rank.fight_pid, 0}])
	  end,
	  {false,
	   lang:get(<<"Người chơi trong bảng xếp hạng hiện "
		      "đang bị thử thách, vui lòng đợi một "
		      "lát rồi thử lại."/utf8>>)};
      [#sky_ladder_rank{id = DefId, is_fight = 0}] ->
	  case sky_ladder:is_match_range(NewRidRank, Rank) of
	    true ->
		ets:update_element(sky_ladder_rank, Rank,
				   [{#sky_ladder_rank.is_fight, 1},
				    {#sky_ladder_rank.fight_rid, Rid},
				    {#sky_ladder_rank.fight_pid, Now}]),
		{ok, Rank};
	    _ ->
		case IsChange of
		  true ->
		      {false,
		       lang:get(<<"Xếp hạng của bạn đã có sự thay đổi lớn, "
				  "hệ thống đã tiến hành ghép đối thủ mới "
				  "cho bạn."/utf8>>),
		       all};
		  _ ->
		      {false,
		       lang:get(<<"Xếp hạng của người chơi này đã có sự "
				  "thay đổi lớn, hệ thống đã tiến hành "
				  "ghép đối thủ mới cho bạn."/utf8>>),
		       one}
		end
	  end;
      [#sky_ladder_rank{}] ->
	  NewRank = sky_ladder_lib:role_rank(DefId),
	  case sky_ladder:is_match_range(NewRidRank, NewRank) of
	    true ->
		ets:update_element(sky_ladder_rank, NewRank,
				   [{#sky_ladder_rank.is_fight, 1},
				    {#sky_ladder_rank.fight_rid, Rid},
				    {#sky_ladder_rank.fight_pid, Now}]),
		{ok, NewRank};
	    _ ->
		case NewRidRank =/= 0 andalso NewRidRank < NewRank of
		  true ->
		      {false,
		       lang:get(<<"Người chơi trong bảng xếp hạng đã được "
				  "làm mới, vui lòng thử thách lại."/utf8>>),
		       NewRank};
		  _ ->
		      case IsChange of
			true ->
			    {false,
			     lang:get(<<"Xếp hạng của bạn đã có sự thay đổi lớn, "
					"hệ thống đã ghép đối thủ mới cho bạn."/utf8>>),
			     all};
			_ ->
			    {false,
			     lang:get(<<"Xếp hạng của người chơi này đã có sự "
					"thay đổi lớn, hệ thống đã ghép đối thủ "
					"mới cho bạn."/utf8>>),
			     one}
		      end
		end
	  end;
      _ ->
	  {false,
	   lang:get(<<"Người chơi này đã rơi khỏi bảng xếp "
		      "hạng, vui lòng thử thách những người "
		      "chơi khác."/utf8>>)}
    end.

call_fight_end({AtkSKR = #sky_ladder_role{id = AtkRid},
		DefRid, CombatResult, OldBestRank, FightTime}) ->
    case sky_ladder_lib:get_role(AtkRid) of
      {ok,
       #sky_ladder_role{rank = Rank, cont_win = ContWin}} ->
	  case sky_ladder_lib:get_role(DefRid) of
	    {ok, DefSKR = #sky_ladder_role{}} ->
		handle_combat_over(AtkSKR#sky_ladder_role{rank = Rank,
							  best_rank =
							      OldBestRank,
							  cont_win = ContWin},
				   DefSKR, CombatResult, FightTime);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidsky_ladder_mgr657, _,
		   {__Levelsky_ladder_mgr657, __Tracessky_ladder_mgr657}}
		      when __Levelsky_ladder_mgr657 band 8 /= 0 orelse
			     __Tracessky_ladder_mgr657 /= [] ->
		      lager:do_log(error,
				   [{module, sky_ladder_mgr},
				    {function, call_fight_end}, {line, 657},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("无法获取防守方竞技角色信息[ToRid:~w]",
						 [DefRid]),
				   none, 4096, 8, __Levelsky_ladder_mgr657,
				   __Tracessky_ladder_mgr657, lager_event,
				   __Pidsky_ladder_mgr657);
		  _ -> ok
		end,
		{false,
		 lang:get(<<"Cuộc chiến trong đấu trường đã kết thúc, "
			    "không thể cập nhật xếp hạng."/utf8>>)}
	  end;
      _ ->
	  case sky_ladder_lib:get_role(DefRid) of
	    {ok, DefSKR = #sky_ladder_role{}} ->
		handle_combat_over(AtkSKR#sky_ladder_role{best_rank =
							      OldBestRank},
				   DefSKR, CombatResult, FightTime);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidsky_ladder_mgr665, _,
		   {__Levelsky_ladder_mgr665, __Tracessky_ladder_mgr665}}
		      when __Levelsky_ladder_mgr665 band 8 /= 0 orelse
			     __Tracessky_ladder_mgr665 /= [] ->
		      lager:do_log(error,
				   [{module, sky_ladder_mgr},
				    {function, call_fight_end}, {line, 665},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("无法获取防守方竞技角色信息[ToRid:~w]",
						 [DefRid]),
				   none, 4096, 8, __Levelsky_ladder_mgr665,
				   __Tracessky_ladder_mgr665, lager_event,
				   __Pidsky_ladder_mgr665);
		  _ -> ok
		end,
		{false,
		 lang:get(<<"Cuộc chiến đấu trường đã kết thúc, không "
			    "thể cập nhật xếp hạng."/utf8>>)}
	  end
    end;
call_fight_end(Data) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr670, _,
       {__Levelsky_ladder_mgr670, __Tracessky_ladder_mgr670}}
	  when __Levelsky_ladder_mgr670 band 8 /= 0 orelse
		 __Tracessky_ladder_mgr670 /= [] ->
	  lager:do_log(error,
		       [{module, sky_ladder_mgr}, {function, call_fight_end},
			{line, 670}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的战斗结束结果Data:~w", [Data]), none, 4096,
		       8, __Levelsky_ladder_mgr670, __Tracessky_ladder_mgr670,
		       lager_event, __Pidsky_ladder_mgr670);
      _ -> ok
    end,
    {false,
     lang:get(<<"Cuộc chiến đấu trường đã kết thúc, không "
		"thể cập nhật xếp hạng."/utf8>>)}.

init_robot(Num, Acc) when Num =< 0 ->
    lists:foldl(fun init_rank/2, ok, Acc),
    ets:insert(sky_ladder_role, Acc),
    dets:insert(sky_ladder_role, Acc),
    ok;
init_robot(Num, Acc) ->
    NewAcc = case catch ets:member(sky_ladder_rank, Num) of
	       false ->
		   case sky_ladder_robot(Num) of
		     {ok, SkyLadderRole} -> [SkyLadderRole | Acc];
		     _ -> Acc
		   end;
	       true -> Acc;
	       _ERR ->
		   case {whereis(lager_event), whereis(lager_event),
			 lager_config:get({lager_event, loglevel}, {0, []})}
		       of
		     {undefined, undefined, _} ->
			 fun () -> {error, lager_not_running} end();
		     {undefined, _, _} ->
			 fun () -> {error, {sink_not_configured, lager_event}}
			 end();
		     {__Pidsky_ladder_mgr692, _,
		      {__Levelsky_ladder_mgr692, __Tracessky_ladder_mgr692}}
			 when __Levelsky_ladder_mgr692 band 8 /= 0 orelse
				__Tracessky_ladder_mgr692 /= [] ->
			 lager:do_log(error,
				      [{module, sky_ladder_mgr},
				       {function, init_robot}, {line, 692},
				       {pid, pid_to_list(self())},
				       {node, node()}
				       | lager:md()],
				      io_lib:format("天梯机器人初始化第【~w】名时出错 ~w",
						    [Num, _ERR]),
				      none, 4096, 8, __Levelsky_ladder_mgr692,
				      __Tracessky_ladder_mgr692, lager_event,
				      __Pidsky_ladder_mgr692);
		     _ -> ok
		   end,
		   Acc
	     end,
    init_robot(Num - 1, NewAcc).

sky_ladder_robot(Rank) ->
    case sky_ladder_data:robot(Rank) of
      {List, {_Min, _Max}, _Lev0} ->
	  RobotId = util:rand_list(List),
	  NamePrefix =
	      util:rand_list(random_name_data:arena_list(1)),
	  NameMiddle =
	      util:rand_list(random_name_data:arena_list(2)),
	  NameSuffix =
	      util:rand_list(random_name_data:arena_list(3)),
	  Name = <<NamePrefix/binary, NameMiddle/binary,
		   NameSuffix/binary>>,
	  LookId =
	      util:rand_list(sky_ladder_data:get_const(robot_body)),
	  FaceId =
	      util:rand_list(sky_ladder_data:get_const(robot_head)),
	  Sex = util:rand_list([0, 1]),
	  Role0 = role_data:first_init(#role{id =
						 {1, sys_env:get(server_id)},
					     type = robot}),
	  LevWave = util:rand(0, 10),
	  Lev = 55 + LevWave,
	  Role = Role0#role{lev = Lev},
	  #{partners := Partners} = robot:get(Role, RobotId, #{}),
	  AllPower = lists:sum([Power
				|| #partner{power = Power} <- Partners]),
	  SkyLadderRole = #sky_ladder_role{id =
					       {Rank, <<"robot">>},
					   name = Name, sex = Sex, lev = Lev,
					   rank = Rank, robot_unit = RobotId,
					   lookid = LookId, face = FaceId,
					   power = AllPower},
	  {ok, SkyLadderRole};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsky_ladder_mgr719, _,
	     {__Levelsky_ladder_mgr719, __Tracessky_ladder_mgr719}}
		when __Levelsky_ladder_mgr719 band 8 /= 0 orelse
		       __Tracessky_ladder_mgr719 /= [] ->
		lager:do_log(error,
			     [{module, sky_ladder_mgr},
			      {function, sky_ladder_robot}, {line, 719},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("排名[Rank:~w]对应的机器人数据有误[Err:~w]",
					   [Rank, Err]),
			     none, 4096, 8, __Levelsky_ladder_mgr719,
			     __Tracessky_ladder_mgr719, lager_event,
			     __Pidsky_ladder_mgr719);
	    _ -> ok
	  end,
	  false
    end.

init_rank(#sky_ladder_role{id = Id, rank = Rank}, OK)
    when Rank > 0 ->
    SkyLadderRank = #sky_ladder_rank{rank = Rank, id = Id},
    ets:insert(sky_ladder_rank, SkyLadderRank),
    OK;
init_rank(_, OK) -> OK.

handle_combat_over(AtkR = #sky_ladder_role{id = AtkId,
					   rank = AtkRank, best_rank = BestRank,
					   cont_win = ContWin},
		   DefR = #sky_ladder_role{id = DefId, name = DefName,
					   lev = DefLev, face = Face,
					   rank = DefRank,
					   face_update_time = DefFaceUpdateTime,
					   face_file = DefFaceFile},
		   #combat_result{result = Result = 1}, FightTime)
    when DefRank =/= 0 andalso
	   (AtkRank > DefRank orelse AtkRank =:= 0) ->
    {NewBestRank, IsChangeBestRank} = case BestRank > 0 of
					true ->
					    case BestRank =< DefRank of
					      true -> {BestRank, 0};
					      false -> {DefRank, 1}
					    end;
					_ -> {DefRank, 1}
				      end,
    NewAtkR = AtkR#sky_ladder_role{best_rank = NewBestRank,
				   rank = DefRank, time = FightTime,
				   cont_win = ContWin + 1},
    NewDefR = DefR#sky_ladder_role{rank = AtkRank,
				   cont_win = 0},
    AtkSkyRank = sky_ladder_lib:get_rank(AtkRank),
    DefSkyRank = sky_ladder_lib:get_rank(DefRank),
    update_rank(AtkSkyRank#sky_ladder_rank{rank = DefRank,
					   id = AtkId}),
    update_rank(DefSkyRank#sky_ladder_rank{rank = AtkRank,
					   is_fight = 0, fight_rid = {0, <<>>},
					   fight_pid = 0}),
    sky_ladder_lib:update_ets(sky_ladder_role, NewAtkR,
			      all),
    sky_ladder_lib:update_ets(sky_ladder_role, NewDefR,
			      all),
    DefChangeRank = util:if_true(AtkRank =:= 0, 0,
				 DefRank - AtkRank),
    AtkChangeRank = util:if_true(AtkRank =:= 0, DefRank,
				 AtkRank - DefRank),
    CombatResult = #sky_ladder_result{result = Result,
				      id = DefId, def_name = DefName,
				      def_lev = DefLev, def_face = Face,
				      def_rank = AtkRank,
				      def_old_rank = DefRank,
				      def_face_update_time = DefFaceUpdateTime,
				      def_face_file = DefFaceFile,
				      def_change_rank = DefChangeRank,
				      is_change_best_rank = IsChangeBestRank,
				      atk_change_rank = AtkChangeRank,
				      atk_rank = DefRank,
				      atk_old_rank = AtkRank,
				      atk_cont_win = ContWin + 1},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr754, _,
       {__Levelsky_ladder_mgr754, __Tracessky_ladder_mgr754}}
	  when __Levelsky_ladder_mgr754 band 128 /= 0 orelse
		 __Tracessky_ladder_mgr754 /= [] ->
	  lager:do_log(debug,
		       [{module, sky_ladder_mgr},
			{function, handle_combat_over}, {line, 754},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("11 rank=~w tar_rank=~w tar_name=~ts",
				     [AtkRank, DefRank, DefName]),
		       none, 4096, 128, __Levelsky_ladder_mgr754,
		       __Tracessky_ladder_mgr754, lager_event,
		       __Pidsky_ladder_mgr754);
      _ -> ok
    end,
    {ok, CombatResult};
handle_combat_over(AtkR = #sky_ladder_role{rank =
					       AtkRank},
		   #sky_ladder_role{id = DefId, name = DefName,
				    lev = DefLev, face = Face, rank = DefRank,
				    face_update_time = DefFaceUpdateTime,
				    face_file = DefFaceFile},
		   #combat_result{result = Result}, FightTime) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr762, _,
       {__Levelsky_ladder_mgr762, __Tracessky_ladder_mgr762}}
	  when __Levelsky_ladder_mgr762 band 128 /= 0 orelse
		 __Tracessky_ladder_mgr762 /= [] ->
	  lager:do_log(debug,
		       [{module, sky_ladder_mgr},
			{function, handle_combat_over}, {line, 762},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("22 rank=~w tar_rank=~w tar_name=~ts",
				     [AtkRank, DefRank, DefName]),
		       none, 4096, 128, __Levelsky_ladder_mgr762,
		       __Tracessky_ladder_mgr762, lager_event,
		       __Pidsky_ladder_mgr762);
      _ -> ok
    end,
    NewAtkR = AtkR#sky_ladder_role{time = FightTime,
				   cont_win = 0},
    DefSkyRank = sky_ladder_lib:get_rank(DefRank),
    update_rank(DefSkyRank#sky_ladder_rank{is_fight = 0,
					   fight_rid = {0, <<>>},
					   fight_pid = 0}),
    sky_ladder_lib:update_ets(sky_ladder_role, NewAtkR,
			      all),
    CombatResult = #sky_ladder_result{result = Result,
				      id = DefId, def_name = DefName,
				      def_lev = DefLev, def_face = Face,
				      def_rank = DefRank, atk_rank = AtkRank,
				      atk_old_rank = AtkRank,
				      def_old_rank = DefRank,
				      def_face_update_time = DefFaceUpdateTime,
				      def_face_file = DefFaceFile},
    {ok, CombatResult}.

update_rank(#sky_ladder_rank{rank = 0}) -> skip;
update_rank(SkyRank = #sky_ladder_rank{}) ->
    ets:insert(sky_ladder_rank, SkyRank).

match_highlight() ->
    BeforeTime = date:unixtime() -
		   60 * sky_ladder_data:get_const(watch_time),
    L =
	do_match_highlight(sky_ladder_data:get_const(watch_rank),
			   BeforeTime, []),
    lists:sublist(L, sky_ladder_data:get_const(watch_num)).

do_match_highlight(0, _, L) -> L;
do_match_highlight(Rank, BeforeTime, L) ->
    case sky_ladder_lib:rank_log(Rank) of
      false -> do_match_highlight(Rank - 1, BeforeTime, L);
      #sky_ladder_role_log{id = AtkId, name = Name,
			   face = Face, face_update_time = FaceUpdateTime,
			   face_file = FaceFile, logs = Logs = [_ | _]} ->
	  L1 = [{abs(AtkPower - DefPower), Log}
		|| Log = #sky_ladder_pk_log{rid = {_, SrvId},
					    time = Time, atk_power = AtkPower,
					    power = DefPower, type = 1, ret = 1,
					    old_rank = OldRank,
					    enemy_old_rank = EnemyOldRank}
		       <- Logs,
		   Time > BeforeTime, SrvId =/= <<"robot">>,
		   OldRank =/= 0 andalso
		     OldRank =< sky_ladder_data:get_const(watch_rank)
		     orelse
		     EnemyOldRank =/= 0 andalso
		       EnemyOldRank =< sky_ladder_data:get_const(watch_rank)],
	  case lists:keysort(1, L1) of
	    [{_, NLog} | _] ->
		HighLight = convert_highlight(NLog, AtkId, Name, Face,
					      FaceUpdateTime, FaceFile),
		do_match_highlight(Rank - 1, BeforeTime,
				   [HighLight | L]);
	    _ -> do_match_highlight(Rank - 1, BeforeTime, L)
	  end;
      _ -> do_match_highlight(Rank - 1, BeforeTime, L)
    end.

convert_highlight(#sky_ladder_pk_log{rid = DefId,
				     name = DefName, face = DefFace,
				     old_rank = AtkRank,
				     enemy_old_rank = DefRank, ret = Ret,
				     replay_id = ReplayId, time = Time,
				     face_update_time = DefFaceUpdateTime,
				     face_file = DefFaceFile},
		  AtkId, AtkName, AtkFace, AtkFaceUpdateTime,
		  AtkFaceFile) ->
    #sky_ladder_highlight{atk_id = AtkId,
			  atk_name = AtkName, atk_face = AtkFace,
			  atk_rank = AtkRank, def_id = DefId,
			  def_name = DefName, def_face = DefFace,
			  def_rank = DefRank, ret = Ret, replay_id = ReplayId,
			  time = Time, atk_face_update_time = AtkFaceUpdateTime,
			  atk_face_file = AtkFaceFile,
			  def_face_update_time = DefFaceUpdateTime,
			  def_face_file = DefFaceFile}.

-spec is_open() -> true | false.

is_open() ->
    case env_info() of
      #{status := open} -> true;
      _ -> false
    end.

-spec end_time() -> pos_integer().

end_time() ->
    case env_info() of
      #{end_time := EndTime} -> EndTime;
      _ -> 0
    end.

send_info(M, F, A) ->
    case env_info() of
      #{server_type := cluster} ->
	  cluster_dynamic_group:cast_main(1, M, F, A);
      #{server_type := merge} -> catch apply(M, F, A);
      #{server_type := local} -> catch apply(M, F, A);
      #{server_type := ready_cluster} -> catch apply(M, F, A);
      _ ->
	  {false,
	   lang:get(<<"Chế độ Liên Server chưa được mở."/utf8>>)}
    end.

send_call(M, F, A) ->
    case env_info() of
      #{server_type := cluster} ->
	  cluster_dynamic_group:call_main(1, M, F, A);
      #{server_type := merge} -> catch apply(M, F, A);
      #{server_type := local} -> catch apply(M, F, A);
      #{server_type := ready_cluster} -> catch apply(M, F, A);
      _ ->
	  {false,
	   lang:get(<<"Chế độ Liên Server chưa được mở."/utf8>>)}
    end.

srv_id() ->
    case env_info() of
      #{server_type := cluster} ->
	  cluster_dynamic_group:group_main_srvid(1);
      _ -> sys_env:get(server_id)
    end.

del_log(#sky_ladder_pk_log{type = 2,
			   rid = {_, ReplaySrvId}, replay_id = ReplayId},
	_) ->
    cluster_lib:cast(ReplaySrvId, combat_replay_mgr,
		     dec_cluster_replay_reference,
		     [{ReplayId, ReplaySrvId}]);
del_log(#sky_ladder_pk_log{replay_id = ReplayId},
	{_, ReplaySrvId}) ->
    cluster_lib:cast(ReplaySrvId, combat_replay_mgr,
		     dec_cluster_replay_reference,
		     [{ReplayId, ReplaySrvId}]);
del_log(#sky_ladder_highlight{replay_id = ReplayId,
			      atk_id = {_, ReplaySrvId}},
	_) ->
    cluster_lib:cast(ReplaySrvId, combat_replay_mgr,
		     dec_cluster_replay_reference,
		     [{ReplayId, ReplaySrvId}]);
del_log(_, _) -> skip.

notice_new_main(_Maps) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder_mgr879, _,
       {__Levelsky_ladder_mgr879, __Tracessky_ladder_mgr879}}
	  when __Levelsky_ladder_mgr879 band 64 /= 0 orelse
		 __Tracessky_ladder_mgr879 /= [] ->
	  lager:do_log(info,
		       [{module, sky_ladder_mgr}, {function, notice_new_main},
			{line, 879}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "通知新主服开启跨服天梯", none, 4096, 64, __Levelsky_ladder_mgr879,
		       __Tracessky_ladder_mgr879, lager_event,
		       __Pidsky_ladder_mgr879);
      _ -> ok
    end,
    erlang:send_after(10000, sky_ladder_mgr, cluster_open),
    ok.


