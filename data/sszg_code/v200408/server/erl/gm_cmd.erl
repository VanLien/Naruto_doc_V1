-file("data/gm_cmd.erl", 1).

-file("src/gm/gm_cmd.erl", 1).

-module(gm_cmd).

-lager_records([{m_holiday_optional_lottery,
		 [ver, camp_id, round, optional_type_id_list,
		  optional_type_info, round_draw_count, draw_count,
		  draw_info, draw_type_info, ext]},
		{login,
		 [login_time, logout_time, prev_logout_time,
		  prev_login_time, log_login_time]},
		{m_encounter,
		 [ver, id, page, update_time, last_id, had_list, must_id,
		  max_power, choice]},
		{self_add_info,
		 [id, time, score, status, total_time, interval]},
		{get_red_packet_info,
		 [r_id, red_id, name, lev, face_id, avatar_bid, time,
		  item]},
		{petard_red_packet,
		 [id, rid, name, face_id, avatar_bid, num, max_num,
		  is_max, mems, must_not, start_time, end_time, msg_id]},
		{m_holiday_petard,
		 [ver, camp_id, end_time, get_red_count, send_red_count,
		  send_notice, must_not_small, must_not_big,
		  petard_reward, red_packet_info, get_red_info]},
		{holiday_term_begins_boss_rank, [rank, id, all_dps]},
		{holiday_term_begins_boss_rank_role,
		 [var, rank, r_id, name, boss_id, all_dps, avatar_bid,
		  lev, family_name, face_id, power, time]},
		{holiday_term_begins_boss,
		 [var, id, unit_id, boss_endtime, boss_hp, dps, buff_lev,
		  paper_num, reward, kill_reward, is_kill, boss_id]},
		{m_holiday_term_begins,
		 [ver, camp_id, round, round_endtime, difficulty,
		  order_id, order_endtime, fight_count, buy_count,
		  order_hp, submit_paper, paper_reward, boss_endtime,
		  boss_dps, boss_dps_list, all_boss_dps, best_partner_id,
		  hurt_statistics]},
		{arena_pk_log,
		 [id, rid, name, lev, sex, face, avatar_id, power, type,
		  ret, replay_id, score, time, face_update_time,
		  face_file]},
		{arena_role_log, [id, logs]},
		{arena_rank, [rank, id, score]},
		{arena_role,
		 [id, name, lev, sex, gid, gname, face, power, max_power,
		  lookid, score, rank, time, avatar_id, champion_power,
		  face_update_time, face_file]},
		{arena_f_pos,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, ext]},
		{arena_f,
		 [id, name, idx, lev, sex, face, power, status,
		  formation_type, formation_lev, pos_info, robot_id,
		  avatar_id, face_update_time, face_file, gid, gname]},
		{m_arena,
		 [ver, ref_time, ref_list, cont_win, buff_id,
		  season_ref_time, can_combat_num, had_combat_num,
		  buy_combat_num, acc_combat_num, season_reward]},
		{m_holiday_personal_gift,
		 [ver, period, start_time, end_time, award_id, count,
		  limit_count, ext]},
		{break_egg_data,
		 [id, rewards, rate, lev_min, lev_max, time_min,
		  time_max, is_record, is_notice, is_effect, role_max,
		  srv_max, hit_must_not_after_m_times,
		  not_hit_must_after_n_times]},
		{m_break_egg,
		 [ver, camp_id, lucky, refresh_time, break_time,
		  egg_type, last_list, each_list, logs]},
		{holiday,
		 [camp_id, total_id, bid, tbid, cli_type, cli_type_name,
		  start_time, end_time, condition, type, title, title2,
		  main_ico, ico, type_ico, top_banner, rule_str, time_str,
		  bottom_alert, sort_val, reward_title, aim_title, reward,
		  item_effect, mail_subject, mail_content, cli_reward,
		  panel_type, open_day, open_day_min, open_day_max,
		  merge_day, process_show_reward, platform_id,
		  platform_exclude_id, hide_srv_ids, channel_ban]},
		{holiday_total,
		 [id, name, icon_id, start_time, end_time, status,
		  open_day, merge_day, is_show, type]},
		{m_element_temple,
		 [ver, combat_num, buy_num, refresh_num_time, end_time,
		  combat_list, privilege_free_num, privilege_buy_num]},
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
		{role_auth_adult,
		 [platform, name, can_charge, is_nonage, charge_limit,
		  is_wallow, down_sec, is_show_phone, show_info, is_mail,
		  is_mid_exp, is_lev_60]},
		{dungeon_replay, [dun_id, replays]},
		{dungeon_replay_log,
		 [type, rid, sid, name, face_id, time, power, repaly_id,
		  face_update_time, face_file]},
		{dungeon_data,
		 [id, name, chapter_id, mode, next_id, unit_id, items,
		  drop_ids, hook_unit_id, hook_items, hook_drop_ids,
		  hook_lev_add, time, is_big, energy_max, auto_items,
		  power, lev_limit, floor]},
		{dungeon, [id, status, cool_time, auto_num]},
		{dun_chapter, [id, status, list]},
		{m_dungeon,
		 [ver, mode, chapter_id, dun_id, max_dun_id,
		  last_hook_time, list, drop_idx, ext_reward, buff_list,
		  fast_combat_add_time, auto_combat_id, auto_combat_num,
		  auto_combat_items, chapter_awrads, is_first,
		  acc_hook_time, acc_hook_items]},
		{violators_record, [id, name, lists]},
		{say_history, [id, clear_time, lists]},
		{say_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{say_frame, [ver, base_id, expire_time]},
		{m_say, [ver, used, frames]},
		{say_subtitle_msg, [id, role_id, name, msg, time]},
		{say_subtitle_role, [pid, conn_pid, type]},
		{say_msg, [len, msg, tick]},
		{say_send,
		 [id, name, sex, career, lev, face_id, vip_lev, capacity,
		  head_bid, chat_bubble, msg_list, face_update_time,
		  face_file]},
		{say_mon,
		 [rid, srv_id, name, ctime, lev, vip_lev, msg, remark]},
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
		{notice_board,
		 [id, type, title, summary, content, sort, lev, items,
		  start_time, end_time, channel]},
		{triple_rebate_data,
		 [id, charge_sum, reward_times, mail_title,
		  mail_content]},
		{charge_data,
		 [id, name, val, gold, first_add, add, vip_exp, pic,
		  is_show, is_iosverify, type, items]},
		{m_charge,
		 [ver, charge_list, first_gift, triple_rebate_list,
		  merge_count, merge_charge_list, day_gift, week_refresh,
		  week_gift, month_refresh, month_gift, day_first_gift,
		  first_gift_ver, choose_first_gift_status,
		  reset_charge_list, warehouse_charge_list]},
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
		{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
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
		{exchange_data_other,
		 [lv, type, pos, item_id, itemname, item_num, pro, price,
		  pay_type, limit_lev, limit_day]},
		{exchange_expire_gift,
		 [ver, eid, base_id, bind, num, timeout, reward_time]},
		{exchange_other,
		 [ver, type, pos, item_id, itemname, item_num, price,
		  pay_type, status]},
		{m_shop,
		 [ver, ref_time_list, items, expire_list, extra]},
		{exchange_data,
		 [type, type2, id, item_bid, day, item_name, item_num,
		  bind, pay_type, price, limit_vip, limit_day, limit_week,
		  limit_month, glev, lev, is_partner, goods_type,
		  limit_count, label, discount, limit_rank, buy_condit,
		  limit_soft, buy_stage, open_srv_timestamp,
		  arena_elite_lev]},
		{exchange_ref,
		 [type_type, lev, type, order, item_bid, item_name,
		  item_num, pro, price, pay_type, has_buy, item_type,
		  label, discount, limit_count, assets_range, pay_type2,
		  flag, item, id, limit_day, limit_week, limit_month,
		  item_desc]},
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
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
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
		{pos,
		 [ver, srv_id, map_id, map_pid, map_bid, map_grid_pid,
		  last, hidden, x, y, dir]},
		{pos_history, [map_id, map_bid, srv_id, x, y]},
		{link, [socket, conn_pid, ip, port, lag]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{r_evt_partner_holy_eqpt, [cache]},
		{r_evt_guild_war_rank, [cache]},
		{r_evt_guild_dun_rank, [cache]},
		{r_evt_arena_like_number, [cache]},
		{r_evt_arena_firstrank_end, [cache]},
		{r_evt_arena_elite_end_rankget, [cache]},
		{r_evt_arena_elite_end_lev, [cache]},
		{r_evt_arena_elite_end_levget, [cache]},
		{r_evt_sky_ladder_end_rank, [cache]},
		{r_evt_championships_end_rank, [cache]},
		{r_evt_arena_cluster_rank, [cache]},
		{r_evt_arena_cluster_rankget, [cache]},
		{r_evt_friend_cluster_add, [cache]},
		{r_evt_friend_add, [cache]},
		{r_evt_room_liked, [cache]},
		{r_evt_hallows_rank, [cache]},
		{r_evt_build_guild, [cache]},
		{r_evt_join_guild, [cache]},
		{r_evt_first_partnerskill_learn, [cache]},
		{r_evt_partner_eqpt_item, [cache]},
		{r_evt_primus_first_fight_rank, [rank, cache]},
		{r_evt_primus_first_fight_pass, [rank, cache]},
		{r_evt_partner_get, [cache]},
		{r_evt_role_register_days, [cache]},
		{r_evt_expedition_pass, [cache]},
		{r_evt_endless_pass_light_dark, [round, cache]},
		{r_evt_endless_pass_wind, [round, cache]},
		{r_evt_endless_pass_fire, [round, cache]},
		{r_evt_endless_pass_water, [round, cache]},
		{r_evt_endless_pass, [round, cache]},
		{r_evt_star_tower_floor, [cache]},
		{r_evt_first_recruit, [cache]},
		{r_evt_hero_compose, [cache]},
		{r_evt_role_lev, [cache]},
		{r_evt_power, [power, cache]},
		{evt_guild_break_skill, []},
		{evt_holiday_arena_team_combat_win_count, []},
		{evt_holiday_arena_team_combat_count, []},
		{evt_holiday_arena_team_join_team, []},
		{evt_holiday_arena_team_lev_up, []},
		{evt_enter_holiday_arena_team, []}, {evt_skin, []},
		{evt_nian_fight_gold_monster, []},
		{evt_nian_firework, []}, {evt_nian_red_packet, []},
		{evt_nian_fight_big_monster, []},
		{evt_nian_fight_monster, []}, {evt_enter_nian, []},
		{evt_planes_kill_guard, []}, {evt_planes_pass, []},
		{evt_enter_secret_pass, [dun_id]},
		{evt_enter_secret_treasure, []},
		{evt_enter_secret_loan, []},
		{evt_enter_secret_reply, []},
		{evt_enter_secret_kill_monster2, [count]},
		{evt_enter_secret_kill_monster, []},
		{evt_enter_secret_dun, []},
		{evt_monopoly_kill_boss, []},
		{evt_monopoly_dungeon, []}, {evt_monopoly_dice, [type]},
		{evt_monopoly_develop, [stage_id, develop]},
		{evt_enter_monopoly, []}, {evt_sprite_tree, []},
		{evt_sprite_set_pos, []},
		{evt_sprite_hatch_expedite, []}, {evt_sprite_hatch, []},
		{evt_sprite_compound, []},
		{evt_guild_secret_area_combat, [count]},
		{evt_arena_team_double_kill, []},
		{evt_arena_team_defense_success, [count]},
		{evt_arena_team_join, [count]},
		{evt_arena_team_season_found_team, [count]},
		{evt_arena_team_last, [count]},
		{evt_arena_team_first, [count]},
		{evt_arena_team_season_one, [count]},
		{evt_arena_team_season_five, [count]},
		{evt_arena_team_two_win, [count]},
		{evt_arena_team_leader_join, [count]},
		{evt_arena_team_win, [count]},
		{evt_arena_use_sprite, [bids, result]},
		{evt_appoint_sprite_compound, [bids]},
		{evt_appoint_sprite, [bids]},
		{evt_recruit_lottery, [count]},
		{evt_sprite_lottery, [count]},
		{evt_elite_recruit_info, [partner_infos]},
		{evt_elite_recruit, [count]},
		{evt_normal_recruit, [count]},
		{evt_donate_sweet_score, [count]},
		{evt_use_petard, [count]}, {evt_petard_score, [count]},
		{evt_petard_send_red_packet, [count]},
		{evt_petard_red_packet, [count]},
		{evt_petard_firework, [count]},
		{evt_petard_meteor, [count]}, {evt_get_gold, [count]},
		{evt_get_friend_point, [count]},
		{evt_arena_cluster_champion_bet, [count]},
		{evt_get_hook_count, [count]},
		{evt_recruit_convert, [count]},
		{evt_partner_dungeon_stone_win, [count]},
		{evt_element_temple_win, [count]},
		{evt_dun_heaven_win, [count]},
		{evt_arena_elite_combat_count, [count]},
		{evt_holy_eqm_ref, [count]},
		{evt_holy_eqm_lottery, [count]},
		{evt_mystery_mall_buy, [count]},
		{evt_add_friend, [count]},
		{evt_term_beigns_boss, [count]},
		{evt_term_beigns_paper, [count]},
		{evt_term_beigns_win_order, [difficulty]},
		{evt_term_beigns_order, [count]},
		{evt_resonate_levup, []}, {evt_extract_award, []},
		{evt_extract_start, []}, {evt_get_furniture, [num]},
		{evt_travel_time, [time]}, {evt_get_speciality, []},
		{evt_cluster_champion_join, []},
		{evt_cluster_champion_sub_count, []},
		{evt_hallows_refine, [lev]}, {evt_mine_owned, []},
		{evt_mine_combat, []}, {evt_mine_buy_miner, []},
		{evt_mine_save_defense, []},
		{evt_enter_adventure_mine, []},
		{evt_home_pet_set_items, []}, {evt_home_soft, [soft]},
		{evt_rename_home, []}, {evt_gain_home_coin, []},
		{evt_worship, [type]}, {evt_visit_home, []},
		{evt_enter_home, []}, {evt_first_enter_home, []},
		{evt_partnerskill_learn, [lev]},
		{evt_combat_balance, []},
		{evt_arena_cluster_end_rank, [rank]},
		{evt_arena_cluster_win, []},
		{evt_dun_heaven_perfectpass, [chapter_id]},
		{evt_combat_over,
		 [hurt_statistics_a, curt_statistics_a, combat_type,
		  continue_hurt, anti_kill_num, halo_kill_num,
		  revive_info, dodge_count, max_fire_num,
		  sprite_kill_num]},
		{evt_combat_pvp_over,
		 [round, atk_power, def_power, halo_dizzy_num, result,
		  hp_info, max_num_diff, kill_info, dizzy_info]},
		{evt_element_temple_end_rank, [rank]},
		{evt_element_temple_pass, [round]},
		{evt_replay_hall_watch, []}, {evt_honor_share, []},
		{evt_grow_share, []}, {evt_replay_share, []},
		{evt_replay_hall_like, []},
		{evt_recruit_trial_partner, [bid]},
		{evt_pass_holiday_boss_new, [id, difficulty]},
		{evt_fight_holiday_boss_new, []},
		{evt_holiday_boss_get_score, []},
		{evt_pass_holiday_boss, [id]},
		{evt_fight_holiday_boss, []},
		{evt_holiday_break_egg, [count]},
		{evt_arena_elite_end_rank, [rank]},
		{evt_arena_elite_end_lev, [lev, score]},
		{evt_arena_elite_champion, [combat_type]},
		{evt_arena_elite_win_count, []},
		{evt_arena_elite_cont_win, [count]},
		{evt_arena_elite_rank, [rank]},
		{evt_sky_ladder_win, []},
		{evt_sky_ladder_end_rank, [rank]},
		{evt_sky_ladder_rank, [rank]},
		{evt_cluster_championships_end_rank, [rank]},
		{evt_championships_end_rank, [rank]},
		{evt_championships_32, []},
		{evt_cluster_championships_takepartin, []},
		{evt_peak_championships_takepartin, []},
		{evt_peak_championships_end_rank, [rank]},
		{evt_peak_championships_bet_cont_win_season, [count]},
		{evt_cluster_championships_bet_cont_win_day, [count]},
		{evt_championships_bet_cont_win_day, [count]},
		{evt_championships_bet_cont_win, [count]},
		{evt_championships_bet_win, []},
		{evt_championships_bet, []},
		{evt_cross_server_ladder, []},
		{evt_adventure_floor_count, []},
		{evt_holiday_make_dumplings, [count]},
		{evt_expedition_fight_count, [id, count]},
		{evt_artifact_compose_quality, [id]},
		{evt_artifact_recast_skills, [skills]},
		{evt_artifact_recast, []},
		{evt_hallows_step_intensify, []},
		{evt_adventure_item_expend_count, [id]},
		{evt_partner_add_new, [star]},
		{evt_equipment_compound, [count]},
		{evt_adventure_trade_count, []},
		{evt_adventure_treasure_open, []},
		{evt_partner_advance, []},
		{evt_adventure_boss_fight_count, []},
		{evt_artifact_compose, []}, {evt_primus_fight, []},
		{evt_expedition_open_box, []},
		{evt_expedition_fight,
		 [round, difficulty, count, is_rank]},
		{evt_eqm_compound, []}, {evt_mystery_buy, [type]},
		{evt_guild_war, []}, {evt_guild_quest_lev, [lev]},
		{evt_hook_time, []},
		{evt_loss_hallows_essence, [count]},
		{evt_dial, [count]}, {evt_guild_dun_buff, []},
		{evt_exchange, [type]}, {evt_guild_skill, []},
		{evt_partner_stone_all_lv, []}, {evt_stone_all_lv, []},
		{evt_hallows_step, []}, {evt_hallows_all_step, []},
		{evt_hallows_activate, [id]}, {evt_escort_fight, []},
		{evt_escort_enter, []},
		{evt_guild_war_join_and_win, []},
		{evt_guild_war_top, [rank]}, {evt_guild_war_join, []},
		{evt_shipping_refresh, []}, {evt_shipping, [quality]},
		{evt_dungeon_stone_fight, [type]},
		{evt_valentine_boss, []}, {evt_endless_appoint, []},
		{evt_endless_pass_light_dark, [round]},
		{evt_endless_pass_wind, [round]},
		{evt_endless_pass_fire, [round]},
		{evt_endless_pass_water, [round]},
		{evt_endless_pass, [round]}, {evt_endless_fight, []},
		{evt_guild_redpacket_best, []},
		{evt_guild_red_packet_reward, [type]},
		{evt_guild_mem_red_packet_price,
		 [type, max_val, assets]},
		{evt_guild_mem_red_packet_send, [type]},
		{evt_formation_level_up, [lev]},
		{evt_formation_open, []},
		{evt_star_natal_level_up, [natal]},
		{evt_star_level_up, []}, {evt_star_natal, []},
		{evt_star_divination, [type, count]},
		{evt_world_boss_fight_ko, []},
		{evt_world_boss_fight, []},
		{evt_boss_fight_result, [result, boss_id]},
		{evt_boss_fight, []},
		{evt_adventure_use_partner, [bids]},
		{evt_adventure_kill_mon, []},
		{evt_adventure_answer_all_right, []},
		{evt_adventure_room_finish, [evt_id, room_id]},
		{evt_adventure_box, [items]},
		{evt_adventure_finger_guessing, [result]},
		{evt_adventure_goto_floor, [id]},
		{evt_adventure_plunder_result, [result]},
		{evt_adventure_plunder, [status]},
		{evt_star_tower_floor_pass, []},
		{evt_adventure_explore, [num]}, {evt_say, [channel]},
		{evt_market_silver_buy, [price, num]},
		{evt_market_silver_sold, [assets, sold_items]},
		{evt_market_coin_sold, [base_id, price, num]},
		{evt_market_gold_buy, [assets, price, num]},
		{evt_market_silver_first_on_sale, []},
		{evt_eqm_sell, []}, {evt_login_days_reward, [day]},
		{evt_recruit_high, [group, count]},
		{evt_recruit, [group, count, partner_infos]},
		{evt_arena_use_partner, [bids, result]},
		{evt_arena_score2, [score]}, {evt_arena_score, [score]},
		{evt_arena_score_lev, [score_lev]},
		{evt_arena_rank, [rank]},
		{evt_arena_fight_result, [result, use_sprite]},
		{evt_arena_fight, []}, {evt_checkin, [now]},
		{evt_guild_dun_damage, [dps]},
		{evt_guild_dun_fight_ko, [boss_id]},
		{evt_guild_dun_fight, [count, boss_id]},
		{evt_partner_decompose, [count, star]},
		{evt_partner_artifact, []}, {evt_partner_eqm, []},
		{evt_partner_enchant_eqm, [count]},
		{evt_partner_levelup, [bid, lev]}, {evt_partner, [ext]},
		{evt_add_new_partner_bi_bid, [bid, star]},
		{evt_partner_star_up_specific, [bid, star]},
		{evt_partner_star_up, [bid, star]},
		{evt_partner_star, [star]},
		{evt_holiday, [camp_id, bid]}, {evt_invest, [type]},
		{evt_power, [combat_type]},
		{evt_guild_donate_expend, [type, loss]},
		{evt_guild_donate, [type]}, {evt_guild_join, []},
		{evt_combat_drama, [type, step, round, base_ids, ext]},
		{evt_combat_start, [fid, type, ext]},
		{evt_friend_present, [base_id, val]},
		{evt_gain_partner, [partners]}, {evt_friend_sns, []},
		{evt_friend_cluster, [num]}, {evt_friend, [num]},
		{evt_star_tower_pass, [tower]},
		{evt_enter_adventure, [floor, room_id, evt_id]},
		{evt_dungeon_fast_combat, []},
		{evt_dungeon_auto, [count]},
		{evt_dungeon_make, [dun_id]},
		{evt_dungeon_pass, [type, dungeon_id, info]},
		{evt_dungeon_enter, [type, count, info]},
		{holy_eqm_frist_open, []},
		{evt_finish_guide, [base_id]},
		{evt_broadcast_drama, [base_id]},
		{evt_move_map, [base_id, x, y]},
		{evt_leave_map, [id, base_id, x, y]},
		{evt_enter_map, [id, base_id, x, y]},
		{evt_cli_loaded, [mod]}, {evt_zero_push, []},
		{evt_loss_assets, [id, val]}, {evt_loss_guild, [val]},
		{evt_gain_guild, [val]}, {evt_gain_activity, [val]},
		{evt_loss_hero_soul, [val]}, {evt_loss_energy, [val]},
		{evt_gain_energy, [val]},
		{evt_loss_red_gold_or_gold, [val]},
		{evt_loss_red_gold, [val]}, {evt_gain_red_gold, [val]},
		{evt_loss_gold, [val]}, {evt_gain_gold, [val]},
		{evt_loss_silver_coin, [val]},
		{evt_loss_hero_exp, [val]},
		{evt_gain_silver_coin, [val]}, {evt_loss_coin, [val]},
		{evt_gain_coin, [val]},
		{evt_fight_unit, [id, base_id, host_base_id, num]},
		{evt_kill_npc_lose, [id, base_id, host_base_id, num]},
		{evt_kill_npc, [id, base_id, host_base_id, num]},
		{evt_combat_lose, [type]}, {evt_combat_win, [type]},
		{evt_giveup_quest, [id]}, {evt_finish_quest, [id]},
		{evt_commit_quest, [id, type]},
		{evt_accept_quest, [id]}, {evt_use_item_type, [type]},
		{evt_use_item, [base_id, num]},
		{evt_del_item, [base_id, num]},
		{evt_get_item, [base_id, num]},
		{evt_unit_click, [id, type, base_id, do_type]},
		{evt_levup, [old_lev, lev]}, {evt_convert, []},
		{evt_charge_acc, [gold]}, {evt_pay_acc, [gold]},
		{evt_recruit_high_gift, [count, info]},
		{evt_high_recruit, [count, info]},
		{evt_pay, [gold, info]}, {evt_charge_fund, []},
		{evt_charge_invest, []}, {evt_month_card, [type]},
		{evt_name, []}, {evt_create, []},
		{trigger, [id, label, m, f, type, a]},
		{gain_loss_opts,
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
		{gm_data, [id, lev, classes, skill_lev, eqm, pet_lev]},
		{gm_cmd, [cmd, args, desc, do]}]).

-export([do/2, cmds/0, save/0, clone_account/2]).

-compile(export_all).

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

-file("src/gm/gm_cmd.erl", 16).

-file("inc/gm.hrl", 1).

-record(gm_cmd,
	{cmd = ""  :: string(), args = []  :: list(),
	 desc = ""  :: string(), do  :: function()}).

-record(gm_data,
	{id = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 classes = 0  :: non_neg_integer(),
	 skill_lev = 0  :: non_neg_integer(),
	 eqm = []  :: list(),
	 pet_lev = 0  :: non_neg_integer()}).

-file("src/gm/gm_cmd.erl", 17).

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

-file("src/gm/gm_cmd.erl", 18).

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

-file("src/gm/gm_cmd.erl", 19).

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

-file("src/gm/gm_cmd.erl", 20).

-file("inc/trigger.hrl", 1).

-record(trigger,
	{id = 1  :: pos_integer(), label  :: atom(),
	 m  :: undefined | atom(), f  :: function() | atom(),
	 type = 0  :: non_neg_integer(), a = []  :: list()}).

-record(evt_create, {}).

-record(evt_name, {}).

-record(evt_month_card, {type = 0}).

-record(evt_charge_invest, {}).

-record(evt_charge_fund, {}).

-record(evt_pay, {gold = 0, info = #{}}).

-record(evt_high_recruit, {count = 0, info = #{}}).

-record(evt_recruit_high_gift, {count = 0, info = #{}}).

-record(evt_pay_acc, {gold = 0}).

-record(evt_charge_acc, {gold = 0}).

-record(evt_convert, {}).

-record(evt_levup,
	{old_lev = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer()}).

-record(evt_unit_click,
	{id = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(),
	 base_id = 0  :: non_neg_integer(),
	 do_type = -1  :: integer()}).

-record(evt_get_item,
	{base_id = 1  :: pos_integer(),
	 num = 1  :: pos_integer()}).

-record(evt_del_item,
	{base_id  :: pos_integer(), num = 0  :: pos_integer()}).

-record(evt_use_item,
	{base_id  :: pos_integer(), num = 0  :: pos_integer()}).

-record(evt_use_item_type,
	{type = 0  :: non_neg_integer()}).

-record(evt_accept_quest, {id = 0  :: pos_integer()}).

-record(evt_commit_quest,
	{id = 0  :: pos_integer(), type = 0}).

-record(evt_finish_quest, {id = 0  :: pos_integer()}).

-record(evt_giveup_quest, {id = 0  :: pos_integer()}).

-record(evt_combat_win, {type = 0}).

-record(evt_combat_lose, {type = 0}).

-record(evt_kill_npc,
	{id = 0  :: non_neg_integer(),
	 base_id = 1  :: pos_integer(),
	 host_base_id = 1  :: pos_integer(),
	 num = 1  :: pos_integer()}).

-record(evt_kill_npc_lose,
	{id = 0  :: non_neg_integer(),
	 base_id = 1  :: pos_integer(),
	 host_base_id = 1  :: pos_integer(),
	 num = 1  :: pos_integer()}).

-record(evt_fight_unit,
	{id = 0  :: non_neg_integer(),
	 base_id = 1  :: pos_integer(),
	 host_base_id = 1  :: pos_integer(),
	 num = 1  :: pos_integer()}).

-record(evt_gain_coin, {val = 1  :: pos_integer()}).

-record(evt_loss_coin, {val = 1  :: pos_integer()}).

-record(evt_gain_silver_coin,
	{val = 1  :: pos_integer()}).

-record(evt_loss_hero_exp, {val = 1  :: pos_integer()}).

-record(evt_loss_silver_coin,
	{val = 1  :: pos_integer()}).

-record(evt_gain_gold, {val = 1  :: pos_integer()}).

-record(evt_loss_gold, {val = 1  :: pos_integer()}).

-record(evt_gain_red_gold, {val = 1  :: pos_integer()}).

-record(evt_loss_red_gold, {val = 1  :: pos_integer()}).

-record(evt_loss_red_gold_or_gold,
	{val = 1  :: pos_integer()}).

-record(evt_gain_energy, {val = 1  :: pos_integer()}).

-record(evt_loss_energy, {val = 1  :: pos_integer()}).

-record(evt_loss_hero_soul,
	{val = 1  :: pos_integer()}).

-record(evt_gain_activity, {val = 0}).

-record(evt_gain_guild, {val = 0}).

-record(evt_loss_guild, {val = 0}).

-record(evt_loss_assets, {id = 0, val = 0}).

-record(evt_zero_push, {}).

-record(evt_cli_loaded,
	{mod = 0  :: non_neg_integer()}).

-record(evt_enter_map,
	{id = 1  :: pos_integer(),
	 base_id = 1  :: pos_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer()}).

-record(evt_leave_map,
	{id = 1  :: pos_integer(),
	 base_id = 1  :: pos_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer()}).

-record(evt_move_map,
	{base_id = 1  :: non_neg_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer()}).

-record(evt_broadcast_drama, {base_id = 0}).

-record(evt_finish_guide, {base_id = 0}).

-record(holy_eqm_frist_open, {}).

-record(evt_dungeon_enter,
	{type = 0, count = 0, info = #{}}).

-record(evt_dungeon_pass,
	{type = 0, dungeon_id = 0, info = #{}}).

-record(evt_dungeon_make, {dun_id = 0}).

-record(evt_dungeon_auto, {count = 0}).

-record(evt_dungeon_fast_combat, {}).

-record(evt_enter_adventure,
	{floor = 0, room_id = 0, evt_id = 0}).

-record(evt_star_tower_pass, {tower = 0}).

-record(evt_friend, {num = 0}).

-record(evt_friend_cluster, {num = 0}).

-record(evt_friend_sns, {}).

-record(evt_gain_partner, {partners = []}).

-record(evt_friend_present, {base_id = 0, val = 0}).

-record(evt_combat_start, {fid, type, ext = #{}}).

-record(evt_combat_drama,
	{type = 0, step, round = 0, base_ids = [], ext = []}).

-record(evt_guild_join, {}).

-record(evt_guild_donate, {type = 0}).

-record(evt_guild_donate_expend, {type = 0, loss = []}).

-record(evt_power, {combat_type = 0}).

-record(evt_invest, {type = 0}).

-record(evt_holiday, {camp_id = 0, bid = 0}).

-record(evt_partner_star, {star = 0}).

-record(evt_partner_star_up, {bid = 0, star = 0}).

-record(evt_partner_star_up_specific,
	{bid = 0, star = 0}).

-record(evt_add_new_partner_bi_bid,
	{bid = 0, star = 0}).

-record(evt_partner, {ext = #{}}).

-record(evt_partner_levelup, {bid = 0, lev = 0}).

-record(evt_partner_enchant_eqm, {count}).

-record(evt_partner_eqm, {}).

-record(evt_partner_artifact, {}).

-record(evt_partner_decompose, {count = 0, star = 0}).

-record(evt_guild_dun_fight, {count, boss_id}).

-record(evt_guild_dun_fight_ko, {boss_id}).

-record(evt_guild_dun_damage, {dps = 0}).

-record(evt_checkin, {now = 0}).

-record(evt_arena_fight, {}).

-record(evt_arena_fight_result,
	{result, use_sprite = 0}).

-record(evt_arena_rank, {rank}).

-record(evt_arena_score_lev, {score_lev}).

-record(evt_arena_score, {score}).

-record(evt_arena_score2, {score}).

-record(evt_arena_use_partner, {bids = [], result = 0}).

-record(evt_recruit,
	{group = 0, count = 0, partner_infos = []}).

-record(evt_recruit_high, {group = 0, count = 0}).

-record(evt_login_days_reward, {day = 0}).

-record(evt_eqm_sell, {}).

-record(evt_market_silver_first_on_sale, {}).

-record(evt_market_gold_buy, {assets, price, num}).

-record(evt_market_coin_sold,
	{base_id = 0, price = 0, num}).

-record(evt_market_silver_sold,
	{assets = [], sold_items = []}).

-record(evt_market_silver_buy, {price, num = 0}).

-record(evt_say, {channel}).

-record(evt_adventure_explore, {num = 0}).

-record(evt_star_tower_floor_pass, {}).

-record(evt_adventure_plunder, {status}).

-record(evt_adventure_plunder_result, {result}).

-record(evt_adventure_goto_floor, {id}).

-record(evt_adventure_finger_guessing, {result}).

-record(evt_adventure_box, {items = []}).

-record(evt_adventure_room_finish,
	{evt_id = 0, room_id = 0}).

-record(evt_adventure_answer_all_right, {}).

-record(evt_adventure_kill_mon, {}).

-record(evt_adventure_use_partner, {bids = []}).

-record(evt_boss_fight, {}).

-record(evt_boss_fight_result, {result, boss_id}).

-record(evt_world_boss_fight, {}).

-record(evt_world_boss_fight_ko, {}).

-record(evt_star_divination, {type, count}).

-record(evt_star_natal, {}).

-record(evt_star_level_up, {}).

-record(evt_star_natal_level_up, {natal}).

-record(evt_formation_open, {}).

-record(evt_formation_level_up, {lev}).

-record(evt_guild_mem_red_packet_send, {type = 0}).

-record(evt_guild_mem_red_packet_price,
	{type = 0, max_val = 0, assets = 0}).

-record(evt_guild_red_packet_reward, {type = 0}).

-record(evt_guild_redpacket_best, {}).

-record(evt_endless_fight, {}).

-record(evt_endless_pass, {round = 0}).

-record(evt_endless_pass_water, {round = 0}).

-record(evt_endless_pass_fire, {round = 0}).

-record(evt_endless_pass_wind, {round = 0}).

-record(evt_endless_pass_light_dark, {round = 0}).

-record(evt_endless_appoint, {}).

-record(evt_valentine_boss, {}).

-record(evt_dungeon_stone_fight, {type = 0}).

-record(evt_shipping, {quality = 0}).

-record(evt_shipping_refresh, {}).

-record(evt_guild_war_join, {}).

-record(evt_guild_war_top, {rank = 0}).

-record(evt_guild_war_join_and_win, {}).

-record(evt_escort_enter, {}).

-record(evt_escort_fight, {}).

-record(evt_hallows_activate, {id = 0}).

-record(evt_hallows_all_step, {}).

-record(evt_hallows_step, {}).

-record(evt_stone_all_lv, {}).

-record(evt_partner_stone_all_lv, {}).

-record(evt_guild_skill, {}).

-record(evt_exchange, {type = 0}).

-record(evt_guild_dun_buff, {}).

-record(evt_dial, {count = 0}).

-record(evt_loss_hallows_essence, {count = 0}).

-record(evt_hook_time, {}).

-record(evt_guild_quest_lev, {lev = 0}).

-record(evt_guild_war, {}).

-record(evt_mystery_buy, {type = 0}).

-record(evt_eqm_compound, {}).

-record(evt_expedition_fight,
	{round = 0, difficulty = 0, count = 1, is_rank = 1}).

-record(evt_expedition_open_box, {}).

-record(evt_primus_fight, {}).

-record(evt_artifact_compose, {}).

-record(evt_adventure_boss_fight_count, {}).

-record(evt_partner_advance, {}).

-record(evt_adventure_treasure_open, {}).

-record(evt_adventure_trade_count, {}).

-record(evt_equipment_compound, {count = 0}).

-record(evt_partner_add_new, {star = 0}).

-record(evt_adventure_item_expend_count, {id = 0}).

-record(evt_hallows_step_intensify, {}).

-record(evt_artifact_recast, {}).

-record(evt_artifact_recast_skills, {skills = []}).

-record(evt_artifact_compose_quality, {id = 0}).

-record(evt_expedition_fight_count,
	{id = 0, count = 1}).

-record(evt_holiday_make_dumplings, {count = 0}).

-record(evt_adventure_floor_count, {}).

-record(evt_cross_server_ladder, {}).

-record(evt_championships_bet, {}).

-record(evt_championships_bet_win, {}).

-record(evt_championships_bet_cont_win, {count = 0}).

-record(evt_championships_bet_cont_win_day,
	{count = 0}).

-record(evt_cluster_championships_bet_cont_win_day,
	{count = 0}).

-record(evt_peak_championships_bet_cont_win_season,
	{count = 0}).

-record(evt_peak_championships_end_rank, {rank = 0}).

-record(evt_peak_championships_takepartin, {}).

-record(evt_cluster_championships_takepartin, {}).

-record(evt_championships_32, {}).

-record(evt_championships_end_rank, {rank = 0}).

-record(evt_cluster_championships_end_rank, {rank = 0}).

-record(evt_sky_ladder_rank, {rank = 0}).

-record(evt_sky_ladder_end_rank, {rank = 0}).

-record(evt_sky_ladder_win, {}).

-record(evt_arena_elite_rank, {rank = 0}).

-record(evt_arena_elite_cont_win, {count = 0}).

-record(evt_arena_elite_win_count, {}).

-record(evt_arena_elite_champion, {combat_type = 0}).

-record(evt_arena_elite_end_lev, {lev = 0, score = 0}).

-record(evt_arena_elite_end_rank, {rank = 0}).

-record(evt_holiday_break_egg, {count = 0}).

-record(evt_fight_holiday_boss, {}).

-record(evt_pass_holiday_boss, {id = 0}).

-record(evt_holiday_boss_get_score, {}).

-record(evt_fight_holiday_boss_new, {}).

-record(evt_pass_holiday_boss_new,
	{id = 0, difficulty = 0}).

-record(evt_recruit_trial_partner, {bid = 0}).

-record(evt_replay_hall_like, {}).

-record(evt_replay_share, {}).

-record(evt_grow_share, {}).

-record(evt_honor_share, {}).

-record(evt_replay_hall_watch, {}).

-record(evt_element_temple_pass, {round = 0}).

-record(evt_element_temple_end_rank, {rank = 0}).

-record(evt_combat_pvp_over,
	{round = 0, atk_power, def_power, halo_dizzy_num = 0,
	 result, hp_info, max_num_diff, kill_info, dizzy_info}).

-record(evt_combat_over,
	{hurt_statistics_a = [], curt_statistics_a = [],
	 combat_type = 0, continue_hurt = [], anti_kill_num = 0,
	 halo_kill_num = 0, revive_info = [], dodge_count = 0,
	 max_fire_num = 0, sprite_kill_num = 0}).

-record(evt_dun_heaven_perfectpass, {chapter_id = 0}).

-record(evt_arena_cluster_win, {}).

-record(evt_arena_cluster_end_rank, {rank = 0}).

-record(evt_combat_balance, {}).

-record(evt_partnerskill_learn, {lev = 0}).

-record(evt_first_enter_home, {}).

-record(evt_enter_home, {}).

-record(evt_visit_home, {}).

-record(evt_worship, {type = 0}).

-record(evt_gain_home_coin, {}).

-record(evt_rename_home, {}).

-record(evt_home_soft, {soft = 0}).

-record(evt_home_pet_set_items, {}).

-record(evt_enter_adventure_mine, {}).

-record(evt_mine_save_defense, {}).

-record(evt_mine_buy_miner, {}).

-record(evt_mine_combat, {}).

-record(evt_mine_owned, {}).

-record(evt_hallows_refine, {lev = 0}).

-record(evt_cluster_champion_sub_count, {}).

-record(evt_cluster_champion_join, {}).

-record(evt_get_speciality, {}).

-record(evt_travel_time, {time = 0}).

-record(evt_get_furniture, {num = 0}).

-record(evt_extract_start, {}).

-record(evt_extract_award, {}).

-record(evt_resonate_levup, {}).

-record(evt_term_beigns_order, {count = 0}).

-record(evt_term_beigns_win_order, {difficulty = 0}).

-record(evt_term_beigns_paper, {count = 0}).

-record(evt_term_beigns_boss, {count = 0}).

-record(evt_add_friend, {count = 0}).

-record(evt_mystery_mall_buy, {count = 0}).

-record(evt_holy_eqm_lottery, {count = 0}).

-record(evt_holy_eqm_ref, {count = 0}).

-record(evt_arena_elite_combat_count, {count = 0}).

-record(evt_dun_heaven_win, {count = 0}).

-record(evt_element_temple_win, {count = 0}).

-record(evt_partner_dungeon_stone_win, {count = 0}).

-record(evt_recruit_convert, {count = 0}).

-record(evt_get_hook_count, {count = 0}).

-record(evt_arena_cluster_champion_bet, {count = 0}).

-record(evt_get_friend_point, {count = 0}).

-record(evt_get_gold, {count = 0}).

-record(evt_petard_meteor, {count = 0}).

-record(evt_petard_firework, {count = 0}).

-record(evt_petard_red_packet, {count = 0}).

-record(evt_petard_send_red_packet, {count = 0}).

-record(evt_petard_score, {count = 0}).

-record(evt_use_petard, {count = 0}).

-record(evt_donate_sweet_score, {count = 0}).

-record(evt_normal_recruit, {count = 0}).

-record(evt_elite_recruit, {count = 0}).

-record(evt_elite_recruit_info, {partner_infos = []}).

-record(evt_sprite_lottery, {count = 0}).

-record(evt_recruit_lottery, {count = 0}).

-record(evt_appoint_sprite, {bids = []}).

-record(evt_appoint_sprite_compound, {bids = []}).

-record(evt_arena_use_sprite, {bids = [], result = 0}).

-record(evt_arena_team_win, {count = 0}).

-record(evt_arena_team_leader_join, {count = 0}).

-record(evt_arena_team_two_win, {count = 0}).

-record(evt_arena_team_season_five, {count = 0}).

-record(evt_arena_team_season_one, {count = 0}).

-record(evt_arena_team_first, {count = 0}).

-record(evt_arena_team_last, {count = 0}).

-record(evt_arena_team_season_found_team, {count = 0}).

-record(evt_arena_team_join, {count = 0}).

-record(evt_arena_team_defense_success, {count = 0}).

-record(evt_arena_team_double_kill, {}).

-record(evt_guild_secret_area_combat, {count = 0}).

-record(evt_sprite_compound, {}).

-record(evt_sprite_hatch, {}).

-record(evt_sprite_hatch_expedite, {}).

-record(evt_sprite_set_pos, {}).

-record(evt_sprite_tree, {}).

-record(evt_enter_monopoly, {}).

-record(evt_monopoly_develop,
	{stage_id = 0, develop = 0}).

-record(evt_monopoly_dice, {type = 0}).

-record(evt_monopoly_dungeon, {}).

-record(evt_monopoly_kill_boss, {}).

-record(evt_enter_secret_dun, {}).

-record(evt_enter_secret_kill_monster, {}).

-record(evt_enter_secret_kill_monster2, {count = 1}).

-record(evt_enter_secret_reply, {}).

-record(evt_enter_secret_loan, {}).

-record(evt_enter_secret_treasure, {}).

-record(evt_enter_secret_pass, {dun_id = 0}).

-record(evt_planes_pass, {}).

-record(evt_planes_kill_guard, {}).

-record(evt_enter_nian, {}).

-record(evt_nian_fight_monster, {}).

-record(evt_nian_fight_big_monster, {}).

-record(evt_nian_red_packet, {}).

-record(evt_nian_firework, {}).

-record(evt_nian_fight_gold_monster, {}).

-record(evt_skin, {}).

-record(evt_enter_holiday_arena_team, {}).

-record(evt_holiday_arena_team_lev_up, {}).

-record(evt_holiday_arena_team_join_team, {}).

-record(evt_holiday_arena_team_combat_count, {}).

-record(evt_holiday_arena_team_combat_win_count, {}).

-record(evt_guild_break_skill, {}).

-record(r_evt_power, {power = 0, cache = #{}}).

-record(r_evt_role_lev, {cache = #{}}).

-record(r_evt_hero_compose, {cache = #{}}).

-record(r_evt_first_recruit, {cache = #{}}).

-record(r_evt_star_tower_floor, {cache = #{}}).

-record(r_evt_endless_pass, {round = 0, cache = #{}}).

-record(r_evt_endless_pass_water,
	{round = 0, cache = #{}}).

-record(r_evt_endless_pass_fire,
	{round = 0, cache = #{}}).

-record(r_evt_endless_pass_wind,
	{round = 0, cache = #{}}).

-record(r_evt_endless_pass_light_dark,
	{round = 0, cache = #{}}).

-record(r_evt_expedition_pass, {cache = #{}}).

-record(r_evt_role_register_days, {cache = #{}}).

-record(r_evt_partner_get, {cache = #{}}).

-record(r_evt_primus_first_fight_pass,
	{rank = 0, cache = #{}}).

-record(r_evt_primus_first_fight_rank,
	{rank = 0, cache = #{}}).

-record(r_evt_partner_eqpt_item, {cache = #{}}).

-record(r_evt_first_partnerskill_learn, {cache = #{}}).

-record(r_evt_join_guild, {cache = #{}}).

-record(r_evt_build_guild, {cache = #{}}).

-record(r_evt_hallows_rank, {cache = #{}}).

-record(r_evt_room_liked, {cache = #{}}).

-record(r_evt_friend_add, {cache = #{}}).

-record(r_evt_friend_cluster_add, {cache = #{}}).

-record(r_evt_arena_cluster_rankget, {cache = #{}}).

-record(r_evt_arena_cluster_rank, {cache = #{}}).

-record(r_evt_championships_end_rank, {cache = #{}}).

-record(r_evt_sky_ladder_end_rank, {cache = #{}}).

-record(r_evt_arena_elite_end_levget, {cache = #{}}).

-record(r_evt_arena_elite_end_lev, {cache = #{}}).

-record(r_evt_arena_elite_end_rankget, {cache = #{}}).

-record(r_evt_arena_firstrank_end, {cache = #{}}).

-record(r_evt_arena_like_number, {cache = #{}}).

-record(r_evt_guild_dun_rank, {cache = #{}}).

-record(r_evt_guild_war_rank, {cache = #{}}).

-record(r_evt_partner_holy_eqpt, {cache = #{}}).

-file("src/gm/gm_cmd.erl", 21).

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

-file("src/gm/gm_cmd.erl", 22).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/gm/gm_cmd.erl", 23).

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

-file("src/gm/gm_cmd.erl", 24).

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

-file("src/gm/gm_cmd.erl", 25).

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

-file("src/gm/gm_cmd.erl", 26).

-file("inc/log.hrl", 1).

-file("src/gm/gm_cmd.erl", 27).

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

-file("src/gm/gm_cmd.erl", 28).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("src/gm/gm_cmd.erl", 29).

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

-file("src/gm/gm_cmd.erl", 30).

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

-file("src/gm/gm_cmd.erl", 31).

-file("inc/exchange.hrl", 1).

-record(exchange_ref,
	{type_type = 0, lev = {0, 0}, type = 0, order = 0,
	 item_bid = 0, item_name = <<>>, item_num = 0, pro = 0,
	 price = 0, pay_type = 0, has_buy = 0, item_type = 0,
	 label = 0, discount = 0, limit_count = 0,
	 assets_range = {-1, 0}, pay_type2 = {0, 0}, flag = 1,
	 item = [], id = 0, limit_day = 0, limit_week = 0,
	 limit_month = 0, item_desc = <<>>}).

-record(exchange_data,
	{type = 0, type2 = 0, id = 0, item_bid = 0, day = 0,
	 item_name = <<>>, item_num = 0, bind = 1, pay_type = 0,
	 price = 0, limit_vip = 0, limit_day = 0, limit_week = 0,
	 limit_month = 0, glev = 0, lev = 0, is_partner = 0,
	 goods_type = 0, limit_count = 0, label = 0,
	 discount = 0, limit_rank = 0, buy_condit = 0,
	 limit_soft = 0, buy_stage = 0, open_srv_timestamp = 0,
	 arena_elite_lev = 0}).

-record(m_shop,
	{ver = 3, ref_time_list = [], items = [],
	 expire_list = [], extra = []}).

-record(exchange_other,
	{ver = 1, type = 0, pos = 0, item_id, itemname,
	 item_num, price, pay_type, status = 0}).

-record(exchange_expire_gift,
	{ver = 1, eid = 0, base_id = 0, bind = 0, num = 0,
	 timeout = 0, reward_time = 0}).

-record(exchange_data_other,
	{lv = {1, 999}, type, pos, item_id, itemname, item_num,
	 pro, price, pay_type, limit_lev = 0, limit_day = 1}).

-file("src/gm/gm_cmd.erl", 32).

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

-file("src/gm/gm_cmd.erl", 33).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/gm/gm_cmd.erl", 34).

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

-file("src/gm/gm_cmd.erl", 35).

-file("inc/charge.hrl", 1).

-record(m_charge,
	{ver = 9, charge_list = [], first_gift = [],
	 triple_rebate_list = [], merge_count = 0,
	 merge_charge_list = [], day_gift = [], week_refresh = 0,
	 week_gift = [], month_refresh = 0, month_gift = [],
	 day_first_gift = {0, 0}, first_gift_ver = 0,
	 choose_first_gift_status = 0, reset_charge_list = [],
	 warehouse_charge_list = []}).

-record(charge_data,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(), val = 0  :: float(),
	 gold = 0  :: non_neg_integer(),
	 first_add = 0  :: non_neg_integer(),
	 add = 0  :: non_neg_integer(),
	 vip_exp = 0  :: non_neg_integer(),
	 pic = 0  :: non_neg_integer(), is_show = 0  :: 0..1,
	 is_iosverify = 1  :: 0..1,
	 type = 0  :: non_neg_integer(), items = []  :: list()}).

-record(triple_rebate_data,
	{id = 0  :: non_neg_integer(),
	 charge_sum = 0  :: bitstring(),
	 reward_times = 0  :: non_neg_integer(),
	 mail_title = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring()}).

-file("src/gm/gm_cmd.erl", 36).

-file("inc/notice.hrl", 1).

-record(notice_board,
	{id = 0, type = 1, title = <<>>, summary = <<>>,
	 content = <<>>, sort = 0, lev = 0, items = [],
	 start_time = 0, end_time = 0, channel = []}).

-file("src/gm/gm_cmd.erl", 37).

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

-file("src/gm/gm_cmd.erl", 38).

-file("inc/say.hrl", 1).

-record(say_mon,
	{rid = 0  :: pos_integer(), srv_id = <<>>  :: binary(),
	 name = <<>>  :: bitstring(),
	 ctime = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 msg = <<>>  :: binary(), remark = <<>>  :: binary()}).

-record(say_send,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 lev = 0, face_id = 0, vip_lev = 0, capacity = 0,
	 head_bid = 0, chat_bubble = 0, msg_list = [],
	 face_update_time = 0, face_file = <<>>}).

-record(say_msg, {len = 0, msg = <<>>, tick = 0}).

-record(say_subtitle_role,
	{pid = 0  :: 0 | pid(), conn_pid = 0  :: 0 | pid(),
	 type = 0  :: integer()}).

-record(say_subtitle_msg,
	{id = 0  :: non_neg_integer(),
	 role_id = {0, <<>>}  ::
	     {non_neg_integer(), bitstring()},
	 name = <<>>  :: bitstring(), msg = <<>>  :: bitstring(),
	 time = 0  :: non_neg_integer()}).

-record(m_say, {ver = 1, used = 0, frames = []}).

-record(say_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(say_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-record(say_history,
	{id = {0, <<>>}, clear_time = 0, lists = []}).

-record(violators_record,
	{id = {0, <<>>}, name = <<>>, lists = []}).

-file("src/gm/gm_cmd.erl", 39).

-file("inc/dungeon.hrl", 1).

-record(m_dungeon,
	{ver = 6, mode = 1, chapter_id = 0, dun_id = 0,
	 max_dun_id = 0, last_hook_time = 0, list = [],
	 drop_idx = 0, ext_reward = [], buff_list = [],
	 fast_combat_add_time = 0, auto_combat_id = 0,
	 auto_combat_num = 0, auto_combat_items = [],
	 chapter_awrads = [], is_first = 1, acc_hook_time = 0,
	 acc_hook_items = []}).

-record(dun_chapter, {id = 0, status = 0, list = []}).

-record(dungeon,
	{id = 0, status = 0, cool_time = 0, auto_num = 0}).

-record(dungeon_data,
	{id = 0, name = <<>>, chapter_id = 0, mode = 1,
	 next_id = 0, unit_id = 0, items = [], drop_ids = [],
	 hook_unit_id = 0, hook_items = [], hook_drop_ids = [],
	 hook_lev_add = [], time = 0, is_big = 0, energy_max = 0,
	 auto_items = [], power = 0, lev_limit = 0, floor = 0}).

-record(dungeon_replay_log,
	{type = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(), sid = 0  :: binary(),
	 name = <<>>  :: binary(),
	 face_id = 0  :: non_neg_integer(),
	 time = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 repaly_id = 0  :: non_neg_integer(),
	 face_update_time = 0, face_file = <<>>}).

-record(dungeon_replay,
	{dun_id = 0  :: non_neg_integer(),
	 replays = []  :: [#dungeon_replay_log{}]}).

-file("src/gm/gm_cmd.erl", 40).

-file("inc/role_auth.hrl", 1).

-record(role_auth_adult,
	{platform = <<>>, name = <<>>, can_charge = 1,
	 is_nonage = 0, charge_limit = 5000, is_wallow = 0,
	 down_sec = 10800, is_show_phone = 0, show_info = <<>>,
	 is_mail = 0, is_mid_exp = 0, is_lev_60 = 0}).

-file("src/gm/gm_cmd.erl", 41).

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

-file("src/gm/gm_cmd.erl", 42).

-file("inc/element_temple.hrl", 1).

-record(m_element_temple,
	{ver = 2, combat_num = 0, buy_num = 0,
	 refresh_num_time = 0, end_time = 0, combat_list = [],
	 privilege_free_num = 0, privilege_buy_num = 0}).

-file("src/gm/gm_cmd.erl", 43).

-file("inc/holiday.hrl", 1).

-record(holiday_total,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 icon_id = 0  :: non_neg_integer(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 is_show = 0  :: 0..1, type = 0  :: 0..2}).

-record(holiday,
	{camp_id = 0  :: non_neg_integer(),
	 total_id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 tbid = 0  :: non_neg_integer(),
	 cli_type = 0  :: non_neg_integer(),
	 cli_type_name = <<>>  :: binary(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(), condition = [],
	 type = 0  :: 0..2, title = <<>>  :: bitstring(),
	 title2 = <<>>  :: bitstring(),
	 main_ico = 0  :: pos_integer() | tuple(),
	 ico = <<>>  :: bitstring(),
	 type_ico = 0  :: non_neg_integer(),
	 top_banner = <<>>  :: bitstring(),
	 rule_str = <<>>  :: bitstring(),
	 time_str = <<>>  :: bitstring(),
	 bottom_alert = <<>>  :: bitstring(),
	 sort_val = 0  :: non_neg_integer(),
	 reward_title = <<>>  :: bitstring(),
	 aim_title = <<>>  :: bitstring(),
	 reward = []  :: list(), item_effect = []  :: list(),
	 mail_subject = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring(),
	 cli_reward = <<>>  :: bitstring(),
	 panel_type = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 open_day_min = 0  :: non_neg_integer(),
	 open_day_max = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 process_show_reward = 0  :: non_neg_integer(),
	 platform_id = []  :: list(),
	 platform_exclude_id = []  :: list(), hide_srv_ids = [],
	 channel_ban = <<>>  :: bitstring()}).

-file("src/gm/gm_cmd.erl", 44).

-file("inc/break_egg.hrl", 1).

-record(m_break_egg,
	{ver = 1, camp_id = 0, lucky = 0, refresh_time = 0,
	 break_time = 0, egg_type = [], last_list = [],
	 each_list = [], logs = []}).

-record(break_egg_data,
	{id = 0, rewards = [], rate = 0, lev_min = 0,
	 lev_max = 0, time_min = 0, time_max = 0, is_record = 0,
	 is_notice = 0, is_effect = 0, role_max = 0, srv_max = 0,
	 hit_must_not_after_m_times = 0,
	 not_hit_must_after_n_times = 0}).

-file("src/gm/gm_cmd.erl", 45).

-file("inc/holiday_personal_gift.hrl", 1).

-record(m_holiday_personal_gift,
	{ver = 1, period = 0  :: non_neg_integer(),
	 start_time = 0, end_time = 0, award_id = 0, count = 0,
	 limit_count = 0, ext = []}).

-file("src/gm/gm_cmd.erl", 46).

-file("inc/arena.hrl", 1).

-record(m_arena,
	{ver = 1, ref_time = 0, ref_list = [], cont_win = 0,
	 buff_id = 0, season_ref_time = 0, can_combat_num = 0,
	 had_combat_num = 0, buy_combat_num = 0,
	 acc_combat_num = 0, season_reward = []}).

-record(arena_f,
	{id = {0, <<>>}, name = <<>>, idx = 0, lev = 0, sex = 0,
	 face = 0, power = 0, status = 0, formation_type = 0,
	 formation_lev = 0, pos_info = [], robot_id = 0,
	 avatar_id = 0, face_update_time = 0, face_file = <<>>,
	 gid = {0, <<>>}, gname = <<>>}).

-record(arena_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, ext}).

-record(arena_role,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, score = 0, rank = 0,
	 time = 0, avatar_id = 0, champion_power = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(arena_rank,
	{rank = 0, id = {0, <<>>}, score = 0}).

-record(arena_role_log, {id = {0, <<>>}, logs = []}).

-record(arena_pk_log,
	{id = 0, rid = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, avatar_id = 0, power = 0, type = 1, ret = 1,
	 replay_id = 0, score = 0, time = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/gm/gm_cmd.erl", 47).

-file("inc/holiday_term_begins.hrl", 1).

-record(m_holiday_term_begins,
	{ver = 1, camp_id = 0, round = 0, round_endtime = 0,
	 difficulty = 0, order_id = 1, order_endtime = 0,
	 fight_count = 0, buy_count = 0, order_hp = [],
	 submit_paper = 0, paper_reward = [], boss_endtime = 0,
	 boss_dps = 0, boss_dps_list = [], all_boss_dps = 0,
	 best_partner_id = 0, hurt_statistics = []}).

-record(holiday_term_begins_boss,
	{var = 1, id = 0, unit_id = 0, boss_endtime = 0,
	 boss_hp = [], dps = 0, buff_lev = 0, paper_num = 0,
	 reward = [], kill_reward = [], is_kill = 0,
	 boss_id = 0}).

-record(holiday_term_begins_boss_rank_role,
	{var = 1, rank = 0, r_id = {0, <<>>}, name = <<>>,
	 boss_id = 0, all_dps = 0, avatar_bid = 0,
	 lev = 0  :: non_neg_integer(),
	 family_name = <<>>  :: bitstring(),
	 face_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(), time = 0}).

-record(holiday_term_begins_boss_rank,
	{rank = 0, id = {0, <<>>}, all_dps = 0}).

-file("src/gm/gm_cmd.erl", 48).

-file("inc/holiday_petard.hrl", 1).

-record(m_holiday_petard,
	{ver = 2, camp_id = 0, end_time = 0, get_red_count = 0,
	 send_red_count = 0, send_notice = 0,
	 must_not_small = [], must_not_big = [],
	 petard_reward = [], red_packet_info = [],
	 get_red_info = []}).

-record(petard_red_packet,
	{id = 0, rid = {0, <<>>}, name = <<>>, face_id = 0,
	 avatar_bid = 0, num = 0, max_num = 0, is_max = 0,
	 mems = [], must_not = [], start_time = 0, end_time = 0,
	 msg_id = 0}).

-record(get_red_packet_info,
	{r_id = {0, <<>>}, red_id = 0, name = <<>>, lev = 0,
	 face_id = 0, avatar_bid = 0, time = 0, item = []}).

-record(self_add_info,
	{id = 0, time = 0, score = 0, status = 0,
	 total_time = 0, interval = 0}).

-file("src/gm/gm_cmd.erl", 49).

-file("inc/encounter.hrl", 1).

-record(m_encounter,
	{ver = 2  :: pos_integer(), id = 0  :: pos_integer(),
	 page = 0  :: pos_integer(),
	 update_time = 0  :: pos_integer(),
	 last_id = 0  :: pos_integer(), had_list = []  :: list(),
	 must_id = 0  :: pos_integer(),
	 max_power = 0  :: pos_integer(),
	 choice = 0  :: pos_integer()}).

-file("src/gm/gm_cmd.erl", 50).

-file("inc/login.hrl", 1).

-record(login,
	{login_time = 0, logout_time = 0, prev_logout_time = 0,
	 prev_login_time = 0, log_login_time = 0}).

-file("src/gm/gm_cmd.erl", 51).

-file("inc/holiday_optional_lottery.hrl", 1).

-record(m_holiday_optional_lottery,
	{ver = 1, camp_id = 0, round = 0,
	 optional_type_id_list = [], optional_type_info = [],
	 round_draw_count = [], draw_count = 0, draw_info = [],
	 draw_type_info = [], ext = []}).

-file("src/gm/gm_cmd.erl", 52).

-spec save() -> ok.

save() ->
    Content = help(cmds()),
    File = "./gm_cmd.txt",
    case file:write_file(File, Content) of
      ok ->
	  io:format("~ts",
		    [io_lib:format("> 已生成GM命令文件: ~ts~n", [File])]);
      Err1 ->
	  io:format("~ts",
		    [io_lib:format("> 生成文件[~ts]时发生异常: ~w~n", [File, Err1])])
    end.

-spec cmds() -> [#gm_cmd{}].

cmds() ->
    [#gm_cmd{cmd = "help",
	     args = [{string, "GM命令关键词, 不填为所有", ""}],
	     desc = "显示相关GM命令帮助信息",
	     do =
		 fun ([Str], _Role) ->
			 Cmds = [Cmd
				 || Cmd = #gm_cmd{cmd = Desc} <- cmds(),
				    re:run(Desc, Str,
					   [{capture, none}, caseless, unicode])
				      =:= match],
			 {reply, help(Cmds)}
		 end},
     #gm_cmd{cmd = "不存档", args = [],
	     desc = "本次登录所有角色变化状态不存档, 如果备份 则为备份状态",
	     do =
		 fun ([], _Role = #role{s_event = 0}) ->
			 put(role_bak_flag, true), ok;
		     ([], _Role) -> {false, "当前不能进行此操作"}
		 end},
     #gm_cmd{cmd = "存档", args = [],
	     desc = "登录所有角色变化状态存档, (配合 永久不存档 使用)",
	     do =
		 fun ([], Role = #role{s_event = 0}) ->
			 {ok, var:del_var(Role, other, role_bak_flag)};
		     ([], _Role) -> {false, "当前不能进行此操作"}
		 end},
     #gm_cmd{cmd = "永不存档", args = [],
	     desc =
		 "以后每次登录所有角色变化状态不存档, 如果备份 则为备份状态 直到存档命令出现 "
		 "注意：本操作会备份一次",
	     do =
		 fun ([], Role = #role{s_event = Event})
			 when Event =:= 0 ->
			 NRole = var:set_var(Role, other, role_bak_flag, 1),
			 put(role_bak, NRole),
			 {ok, NRole};
		     ([], _Role) -> {false, "当前不能进行此操作"}
		 end},
     #gm_cmd{cmd = "备份", args = [], desc = "登记角色当前状态",
	     do =
		 fun ([], Role = #role{s_event = 0}) ->
			 put(role_bak, Role), ok;
		     ([], _Role) -> {false, "当前不能进行此操作"}
		 end},
     #gm_cmd{cmd = "开启回归活动", args = [], desc = "开启回归活动",
	     do =
		 fun ([], Role = #role{login = Login = #login{}}) ->
			 Now = date:unixtime(),
			 Role2 = Role#role{login =
					       Login#login{prev_logout_time =
							       Now - 86400 * 30
								 - 1}},
			 {ok, Role2}
		 end},
     #gm_cmd{cmd = "还原", args = [], desc = "将当前角色返回前一次备份状态",
	     do =
		 fun ([], _Role = #role{s_event = 0}) ->
			 case get(role_bak) of
			   Role = #role{} -> {ok, Role};
			   _ -> {reply, lang:get(<<"当前没有备份过角色状态记录"/utf8>>)}
			 end;
		     ([], _Role) -> {false, "当前不能进行此操作"}
		 end},
     #gm_cmd{cmd = "clone",
	     args =
		 [{string, "账号名"}, {string, "服务器ID", "undefined"}],
	     desc = "克隆当前角色到指定角色",
	     do =
		 fun ([Account, ToSrvIdT], Role) ->
			 ToSrvId = util:if_true(ToSrvIdT == "undefined",
						sys_env:get(server_id),
						list_to_binary(ToSrvIdT)),
			 case cluster_lib:call(ToSrvId, gm_cmd, clone_account,
					       [Account, Role])
			     of
			   {reply, Msg} -> {reply, Msg};
			   _ -> {reply, "克隆失败"}
			 end
		 end},
     #gm_cmd{cmd = "全服存档", args = [{bin, "Key"}],
	     desc = "存档角色到中央服",
	     do =
		 fun ([Key], Role) -> c_gm_mgr:save(Key, Role), ok end},
     #gm_cmd{cmd = "全服读档",
	     args = [{bin, "Key"}, {bin, "account"}],
	     desc = "读档中央服存档角色到当前服",
	     do =
		 fun ([Key, Account], _Role) ->
			 c_gm_mgr:clone(Key, Account)
		 end},
     #gm_cmd{cmd = "正常状态", args = [], desc = "正常状态",
	     do =
		 fun ([], Role) ->
			 NewRole = Role#role{s_event = 0,
					     s_event_pid = undefined},
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "重载个推礼包", args = [], desc = "重载个推礼包",
	     do =
		 fun ([],
		      Role = #role{m_holiday_personal_gift =
				       MHPG = #m_holiday_personal_gift{}}) ->
			 NewRole = Role#role{m_holiday_personal_gift =
						 MHPG#m_holiday_personal_gift{period
										  =
										  0}},
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "匹配个推礼包", args = [{int, "值", 0}],
	     desc = "匹配个推礼包",
	     do =
		 fun ([Id],
		      Role = #role{m_holiday_personal_gift =
				       MHolidayPersonalGift =
					   #m_holiday_personal_gift{ext =
									Ext}}) ->
			 NewRole = case
				     holiday_personal_gift_data:get_award1(Id)
				       of
				     {_, LimitCount} ->
					 NewExt = lists:keystore(1, 1, Ext,
								 {1, 1}),
					 Role#role{m_holiday_personal_gift =
						       MHolidayPersonalGift#m_holiday_personal_gift{award_id
													=
													Id,
												    count
													=
													0,
												    limit_count
													=
													LimitCount,
												    ext
													=
													NewExt}};
				     _ -> Role
				   end,
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "开学副本下阶段", args = [{int, "是否重置", 1}],
	     desc = "开学副本下阶段",
	     do =
		 fun ([Flag],
		      Role = #role{m_holiday_term_begins =
				       HB = #m_holiday_term_begins{}}) ->
			 case Flag == 1 of
			   true ->
			       holiday_term_begins_mgr:info({get_group}),
			       holiday_term_begins_mgr:info(upload_data),
			       erlang:send_after(8000,
						 whereis(holiday_term_begins_mgr),
						 match_boss);
			   _ -> skip
			 end,
			 Now = date:unixtime(),
			 NewOrderEndTime = Now - 1,
			 NewBossEndTime = NewOrderEndTime + 3600 * 48 - 30 * 60,
			 NewRole = Role#role{m_holiday_term_begins =
						 HB#m_holiday_term_begins{order_endtime
									      =
									      NewOrderEndTime,
									  boss_endtime
									      =
									      NewBossEndTime}},
			 holiday_term_begins:push(NewRole),
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "开学副本结算阶段", args = [], desc = "开学副本结算阶段",
	     do =
		 fun ([],
		      Role = #role{m_holiday_term_begins =
				       HB = #m_holiday_term_begins{}}) ->
			 Now = date:unixtime(),
			 NewBossEndTime = Now - 1,
			 NewOrderEndTime = NewBossEndTime - 3600 * 47 - 30 * 60
					     - 1,
			 NewRole = Role#role{m_holiday_term_begins =
						 HB#m_holiday_term_begins{order_endtime
									      =
									      NewOrderEndTime,
									  boss_endtime
									      =
									      NewBossEndTime}},
			 holiday_term_begins:push(NewRole),
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "开学副本重载", args = [], desc = "开学副本重载",
	     do =
		 fun ([],
		      Role = #role{m_holiday_term_begins =
				       HB = #m_holiday_term_begins{}}) ->
			 NewRole = Role#role{m_holiday_term_begins =
						 HB#m_holiday_term_begins{camp_id
									      =
									      0}},
			 holiday_term_begins:push(NewRole),
			 holiday_term_begins_mgr:info({get_group}),
			 holiday_term_begins_mgr:info({clear_data}),
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "开学副本匹配",
	     args =
		 [{int, "轮次", 1}, {int, "活跃人数", 500}, {int, "世界等级", 150},
		  {int, "捐献试卷", 5000}],
	     desc = "开学副本重载",
	     do =
		 fun ([Round, ActNum, WorldLev, PaperNum],
		      Role = #role{m_holiday_term_begins =
				       HB = #m_holiday_term_begins{}}) ->
			 case sys_env:get(term_main_srv) of
			   undefined ->
			       holiday_term_begins_mgr:info({gm_match_boss,
							     Round, ActNum,
							     WorldLev,
							     PaperNum});
			   _ ->
			       cluster_group:cast_main(holiday_term_begins_mgr,
						       info,
						       [{gm_match_boss, Round,
							 ActNum, WorldLev,
							 PaperNum}])
			 end,
			 NRole = Role#role{m_holiday_term_begins =
					       HB#m_holiday_term_begins{round =
									    Round}},
			 holiday_term_begins:push(NRole),
			 {ok, NRole}
		 end},
     #gm_cmd{cmd = "花火大会重载", args = [], desc = "花火大会重载",
	     do =
		 fun ([],
		      Role = #role{m_holiday_petard =
				       HB = #m_holiday_petard{}}) ->
			 NewRole = Role#role{m_holiday_petard =
						 HB#m_holiday_petard{camp_id =
									 0}},
			 sys_env:save(holiday_petard_campid, 0),
			 holiday_mgr:reload(),
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "红包过期", args = [], desc = "红包过期",
	     do =
		 fun ([], Role) ->
			 holiday_petard:gm_red_past_time(Role), ok
		 end},
     #gm_cmd{cmd = "加经验", args = [{int, "值", 0}],
	     desc = "增加角色经验",
	     do =
		 fun ([Val], Role) ->
			 role_gain:do(Role, [#gain{label = exp, val = Val}])
		 end},
     #gm_cmd{cmd = "设等级", args = [{int, "值", 50}],
	     desc = "设置当前角色的等级",
	     do =
		 fun ([Val], Role = #role{}) ->
			 case Val > role_career_data:get_const(max_lev) of
			   true -> {ok, Role};
			   false ->
			       NewRole = Role#role{lev = Val,
						   uplev_time = date:unixtime(),
						   is_gain = 1},
			       role_lib:push_base_info(NewRole),
			       {ok, NewRole}
			 end
		 end},
     #gm_cmd{cmd = "设元宝", args = [{int, "值", 999999999}],
	     desc = "设置当前角色的元宝数量",
	     do =
		 fun ([Val], Role = #role{assets = Assets}) ->
			 NewRole = Role#role{assets =
						 Assets#assets{gold = Val}},
			 role_lib:push_assets(NewRole),
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "设铜钱", args = [{int, "值", 999999999}],
	     desc = "设置当前角色的铜钱数量",
	     do =
		 fun ([Val], Role = #role{assets = Assets}) ->
			 NewRole = Role#role{assets =
						 Assets#assets{coin = Val}},
			 role_lib:push_assets(NewRole),
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "设体力", args = [{int, "值", 100}],
	     desc = "设置体力值",
	     do =
		 fun ([Val], Role = #role{assets = Assets}) ->
			 NRole = Role#role{assets =
					       Assets#assets{energy = Val,
							     energy_time = 0}},
			 NewRole = assets:check_energy_timer(NRole),
			 role_lib:push_assets(NewRole),
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "活动重载", args = [], desc = "活动重载",
	     do = fun ([], _Role) -> holiday_mgr:reload(), ok end},
     #gm_cmd{cmd = "活动排行榜", args = [{int, "BID"}],
	     desc = "发放活动排行榜奖励",
	     do =
		 fun ([Bid], _Role) ->
			 holiday_mgr:info({apply,
					   {holiday_rule_rank, apply_reward,
					    [Bid, #{flag => reward}]}}),
			 ok
		 end},
     #gm_cmd{cmd = "查看活动偏移小时", args = [], desc = "查看活动偏移小时",
	     do =
		 fun ([], _Role) ->
			 Hour = holiday_mgr:get_holiday_hour(),
			 {reply,
			  util:fbin("当前活动偏移~ts小时",
				    [color:string(orange, Hour)])}
		 end},
     #gm_cmd{cmd = "设活动偏移小时", args = [{int, "小时", 1}],
	     desc = "设活动偏移小时",
	     do =
		 fun ([Hour], Role) ->
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
			   {__Pidgm_cmd424, _,
			    {__Levelgm_cmd424, __Tracesgm_cmd424}}
			       when __Levelgm_cmd424 band 128 /= 0 orelse
				      __Tracesgm_cmd424 /= [] ->
			       lager:do_log(debug,
					    [{module, gm_cmd}, {function, cmds},
					     {line, 424},
					     {pid, pid_to_list(self())},
					     {node, node()}
					     | lager:md()],
					    io_lib:format("[~ts]设置了活动偏移小时[OffsetHour:~w]",
							  [Role#role.name,
							   Hour]),
					    none, 4096, 128, __Levelgm_cmd424,
					    __Tracesgm_cmd424, lager_event,
					    __Pidgm_cmd424);
			   _ -> ok
			 end,
			 holiday_mgr:set_holiday_hour(Hour),
			 cluster_lib:cast(center, holiday_mgr, set_holiday_hour,
					  [Hour]),
			 notice:broadcast(sys_top,
					  util:fbin("~ts设置了活动偏移小时~ts",
						    [color:format({role,
								   Role#role.name}),
						     color:string(orange,
								  Hour)])),
			 ok
		 end},
     #gm_cmd{cmd = "称号过期", args = [], desc = "称号过期",
	     do =
		 fun ([], Role) ->
			 NewRole = honor:set_overdue(Role), {ok, NewRole}
		 end},
     #gm_cmd{cmd = "禁言自己", args = [], desc = "禁言自己",
	     do =
		 fun ([], Role = #role{id = {Rid, SrvId}}) ->
			 say_mgr:info({del_say, {Rid, SrvId}}), ok
		 end},
     #gm_cmd{cmd = "设会长离线天数", args = [{int, "天"}],
	     desc = "设会长离线天数",
	     do =
		 fun ([Day],
		      #role{guild_bag = #guild_bag{pid = GPid}}) ->
			 guild:apply(async, GPid,
				     {guild_handle, gm_apply_set_offtime,
				      [{Day}]}),
			 ok
		 end},
     #gm_cmd{cmd = "重置积天豪礼", args = [{int, "周期"}],
	     desc = "重置积天豪礼",
	     do =
		 fun ([Period], Role) ->
			 case holiday_accumulate:gm_read_award(Role, Period) of
			   {ok, NewRole} -> {ok, NewRole};
			   _ -> {reply, "重置失败"}
			 end
		 end},
     #gm_cmd{cmd = "设活动偏移时间",
	     args =
		 [{int, "年", 2017}, {int, "月", 1}, {int, "日", 1},
		  {int, "时", 0}, {int, "分", 0}, {int, "秒", 0}],
	     desc = "设活动偏移时间",
	     do =
		 fun (_Offset = [Year, Month, Day, HH, MM, SS], Role) ->
			 Time = date:datetime_to_seconds({{Year, Month, Day},
							  {HH, MM, SS}}),
			 Now = date:unixtime(),
			 case Time >= Now of
			   true ->
			       OffsetHour = util:floor((Time - Now) div 3600) +
					      1,
			       case {whereis(lager_event), whereis(lager_event),
				     lager_config:get({lager_event, loglevel},
						      {0, []})}
				   of
				 {undefined, undefined, _} ->
				     fun () -> {error, lager_not_running} end();
				 {undefined, _, _} ->
				     fun () ->
					     {error,
					      {sink_not_configured,
					       lager_event}}
				     end();
				 {__Pidgm_cmd497, _,
				  {__Levelgm_cmd497, __Tracesgm_cmd497}}
				     when __Levelgm_cmd497 band 128 /= 0 orelse
					    __Tracesgm_cmd497 /= [] ->
				     lager:do_log(debug,
						  [{module, gm_cmd},
						   {function, cmds},
						   {line, 497},
						   {pid, pid_to_list(self())},
						   {node, node()}
						   | lager:md()],
						  io_lib:format("[~ts]设置了活动偏移时间[Offset:~w][OffsetHour:~w]",
								[Role#role.name,
								 _Offset,
								 OffsetHour]),
						  none, 4096, 128,
						  __Levelgm_cmd497,
						  __Tracesgm_cmd497,
						  lager_event, __Pidgm_cmd497);
				 _ -> ok
			       end,
			       holiday_mgr:set_holiday_hour(OffsetHour),
			       cluster_lib:cast(center, holiday_mgr,
						set_holiday_hour, [OffsetHour]),
			       notice:broadcast(sys_top,
						util:fbin("~ts设置了活动偏移时间~w/~w/~w ~w:~w:~w",
							  [color:format({role,
									 Role#role.name}),
							   Month, Day, Year, HH,
							   MM, SS])),
			       ok;
			   false -> {reply, "活动偏移时间有误"}
			 end
		 end},
     #gm_cmd{cmd = "获取物品",
	     args =
		 [{bin, "物品名/ID"}, {int, "数量", 1}, {int, "绑定", 1},
		  {int, "飞向", 0}],
	     desc = "获取指定物品",
	     do =
		 fun ([Str, Num, Bind, MoveTo], Role) ->
			 Bid = case catch list_to_integer(binary_to_list(Str))
				   of
				 Val when is_integer(Val) -> Val;
				 _Err ->
				     Fun = fun (Id, Ret) ->
						   case item_data:get(Id) of
						     #item_base{name = Str} ->
							 Id;
						     _ -> Ret
						   end
					   end,
				     lists:foldl(Fun, 0, item_data:all())
			       end,
			 case role_gain:do_notice(Role,
						  format:val_to_gain([{Bid,
								       Bind,
								       Num}],
								     #gain{flag
									       =
									       default_iflag,
									   move_to
									       =
									       MoveTo}))
			     of
			   {ok, NRole} -> {ok, NRole};
			   Err ->
			       case {whereis(lager_event), whereis(lager_event),
				     lager_config:get({lager_event, loglevel},
						      {0, []})}
				   of
				 {undefined, undefined, _} ->
				     fun () -> {error, lager_not_running} end();
				 {undefined, _, _} ->
				     fun () ->
					     {error,
					      {sink_not_configured,
					       lager_event}}
				     end();
				 {__Pidgm_cmd532, _,
				  {__Levelgm_cmd532, __Tracesgm_cmd532}}
				     when __Levelgm_cmd532 band 8 /= 0 orelse
					    __Tracesgm_cmd532 /= [] ->
				     lager:do_log(error,
						  [{module, gm_cmd},
						   {function, cmds},
						   {line, 532},
						   {pid, pid_to_list(self())},
						   {node, node()}
						   | lager:md()],
						  io_lib:format("[~ts]获取物品失败{Bid:~w, Num:~w, Bind:~w}Err:~w",
								[Role#role.name,
								 Bid, Num, Bind,
								 Err]),
						  none, 4096, 8,
						  __Levelgm_cmd532,
						  __Tracesgm_cmd532,
						  lager_event, __Pidgm_cmd532);
				 _ -> ok
			       end,
			       {reply, "获取物品失败"}
			 end
		 end},
     #gm_cmd{cmd = "扣除物品",
	     args = [{bin, "物品名/ID"}, {int, "数量", 1}],
	     desc = "扣除指定物品",
	     do =
		 fun ([Str, Num], Role) ->
			 Bid = case catch list_to_integer(binary_to_list(Str))
				   of
				 Val when is_integer(Val) -> Val;
				 _Err ->
				     Fun = fun (Id, Ret) ->
						   case item_data:get(Id) of
						     #item_base{name = Str} ->
							 Id;
						     _ -> Ret
						   end
					   end,
				     lists:foldl(Fun, 0, item_data:all())
			       end,
			 case role_gain:do_notice(Role,
						  format:val_to_loss([{Bid,
								       Num}],
								     default_iflag))
			     of
			   {ok, NRole} -> {ok, NRole};
			   _ -> {reply, "扣除物品失败"}
			 end
		 end},
     #gm_cmd{cmd = "清空红钻", args = [], desc = "清空背包",
	     do =
		 fun ([], Role = #role{assets = Assets}) ->
			 {ok, Role#role{assets = Assets#assets{red_gold = 0}}}
		 end},
     #gm_cmd{cmd = "清空背包", args = [], desc = "清空背包",
	     do =
		 fun ([],
		      Role = #role{p_bag =
				       Bag = #package{volume = Volume,
						      type = Type,
						      items = Items}}) ->
			 package:push_item_info(del, Role, [{Type, Items}]),
			 {ok,
			  Role#role{p_bag =
					Bag#package{items = [],
						    free_cell =
							lists:seq(1, Volume)}}}
		 end},
     #gm_cmd{cmd = "清空邮件", args = [], desc = "清空邮件",
	     do =
		 fun ([], Role = #role{}) -> {ok, Role#role{m_mail = []}}
		 end},
     #gm_cmd{cmd = "清空装备背包", args = [], desc = "清空装备背包",
	     do =
		 fun ([],
		      Role = #role{p_eqm =
				       Bag = #package{volume = Volume,
						      type = Type,
						      items = Items}}) ->
			 package:push_item_info(del, Role, [{Type, Items}]),
			 {ok,
			  Role#role{p_eqm =
					Bag#package{items = [],
						    free_cell =
							lists:seq(1, Volume)}}}
		 end},
     #gm_cmd{cmd = "点金加速", args = [], desc = "点金加速",
	     do =
		 fun ([], Role) -> convert:gm(Role, {clear_coin_timer})
		 end},
     #gm_cmd{cmd = "物品飞向", args = [], desc = "物品飞向",
	     do =
		 fun ([], _Role) ->
			 role:pack_send(12742,
					{[{10004, 0, 1, 0, 1},
					  {10004, 0, 1, 0, 2}],
					 0}),
			 ok
		 end},
     #gm_cmd{cmd = "测试协议包", args = [{int, "数量", 100}],
	     desc = "测试压力包",
	     do = fun ([_Val], Role) -> {ok, Role} end},
     #gm_cmd{cmd = "lookup",
	     args =
		 [{string, "字段名", "m_pet"}, {int, "二级字段位置(0为所有)", 0},
		  {int, "返回方式(0:可视 1:原样)", 0}],
	     desc = "查看角色数据",
	     do =
		 fun ([Filed, Pos, Mod], Role) ->
			 F = list_to_atom(Filed),
			 L = lists:zip([record_name | record_info(fields,
								  role)],
				       tuple_to_list(Role)),
			 Fun = fun (Val) when Mod =:= 0 andalso is_list(Val) ->
				       {reply,
					util:fbin("~ts ==> ~w", [Filed, Val])};
				   (Val) ->
				       {reply,
					util:fbin("~ts ==> ~w", [Filed, Val])}
			       end,
			 case lists:keyfind(F, 1, L) of
			   {_, Val} when Pos =:= 0 -> Fun(Val);
			   {_, Val} -> Fun(element(Pos, Val));
			   _ -> {reply, "查找不到内容"}
			 end
		 end},
     #gm_cmd{cmd = "lookget",
	     args = [{string, "字段名", "plot_pause_list"}],
	     desc = "查看角色进程字典数据",
	     do =
		 fun ([Filed], _Role) ->
			 F = list_to_atom(Filed),
			 {reply, util:fbin("~ts ==> ~w", [Filed, get(F)])}
		 end},
     #gm_cmd{cmd = "lookfun",
	     args =
		 [{atom, "模块名"}, {atom, "方法名"}, {string, "参数", "[]"}],
	     desc = "查看方法返回",
	     do =
		 fun ([Mod, F, A], Role) ->
			 {ok, Args} = util:string_to_term(A),
			 Fun1 = fun (role) -> Role;
				    (A1) -> A1
				end,
			 Ret = erlang:apply(Mod, F, [Fun1(A1) || A1 <- Args]),
			 {reply, util:fbin("结果:~w", [Ret])}
		 end},
     #gm_cmd{cmd = "清空变量", args = [{int, "类型(默认是所有)", 0}],
	     desc = "清空变量",
	     do =
		 fun ([0], Role = #role{m_var = MVar}) ->
			 NRole = Role#role{m_var =
					       MVar#m_var{day_vars = [],
							  five_vars = [],
							  week_vars = [],
							  month_vars = [],
							  timeout_vars = [],
							  acc_vars = [],
							  other_vars = []}},
			 {ok, NRole};
		     ([Type],
		      Role = #role{m_var =
				       MVar = #m_var{day_vars = DayVars,
						     acc_vars = AccVars}}) ->
			 NRole = Role#role{m_var =
					       MVar#m_var{day_vars =
							      lists:keydelete(Type,
									      1,
									      DayVars),
							  acc_vars =
							      lists:keydelete(Type,
									      1,
									      AccVars)}},
			 {ok, NRole}
		 end},
     #gm_cmd{cmd = "清空天变量", args = [], desc = "清空天变量",
	     do =
		 fun ([], Role = #role{m_var = MVar}) ->
			 NRole = Role#role{m_var =
					       MVar#m_var{day_vars = [],
							  five_vars = []}},
			 {ok, NRole}
		 end},
     #gm_cmd{cmd = "设置变量",
	     args =
		 [{int, "类型", 0}, {int, "值", 0},
		  {atom, "day/acc/other", day}],
	     desc = "设置变量",
	     do =
		 fun ([Type, Val, Label], Role) ->
			 NRole = var:set_var(Role, Label, Type, Val),
			 {ok, NRole}
		 end},
     #gm_cmd{cmd = "设置列表变量",
	     args =
		 [{int, "类型", 0}, {int, "键", 0}, {int, "值", 0},
		  {atom, "day/acc/other/five", day}],
	     desc = "设置变量",
	     do =
		 fun ([Type, Key, Val, Label], Role) ->
			 NRole = var:set_list_val(Role, Label, Type, Key, Val),
			 {ok, NRole}
		 end},
     #gm_cmd{cmd = "新战令天数", args = [{int, "类型", 1}],
	     desc = "新战令天数",
	     do =
		 fun ([Day], Role) ->
			 holiday_new_war_order:gm_set_day(Role, Day)
		 end},
     #gm_cmd{cmd = "0点更新", args = [], desc = "进入一次0点更新",
	     do =
		 fun ([], Role = #role{m_var = MVar}) ->
			 guild_rank:info(zero),
			 NRole = Role#role{m_var =
					       MVar#m_var{last_reset_time = 0,
							  last_reset_day =
							      {0, 0, 0}}},
			 global_event_listener:loop_daily_zero_hour(sys_env:get(server_type),
								    date:day_of_the_week()),
			 guild:apply(async, all,
				     {guild_handle, zero_update, [null]}),
			 endless_mgr ! send_reward,
			 expedition_mgr ! send_reward,
			 var:reset(NRole, zero_flush)
		 end},
     #gm_cmd{cmd = "5点更新", args = [], desc = "进入一次5点更新",
	     do =
		 fun ([],
		      Role = #role{m_var = MVar,
				   guild_bag = #guild_bag{id = Gid}}) ->
			 NRole = Role#role{m_var =
					       MVar#m_var{last_reset_five = 0}},
			 global_event_listener:loop_five(sys_env:get(server_type),
							 date:day_of_the_week()),
			 guild_dun_mgr:five_plush_by_gid(Gid),
			 var:reset(NRole, five_flush)
		 end},
     #gm_cmd{cmd = "活动0点更新", args = [], desc = "进入一次活动0点更新",
	     do =
		 fun ([], Role = #role{m_var = MVar}) ->
			 guild_rank:info(zero),
			 NewRole = Role#role{m_var =
						 MVar#m_var{last_reset_time = 0,
							    last_reset_day =
								{0, 0, 0}}},
			 holiday_mgr:notify(0),
			 var:reset(NewRole, zero_flush)
		 end},
     #gm_cmd{cmd = "设注册时间",
	     args =
		 [{int, "年", 2017}, {int, "月", 1}, {int, "日", 1},
		  {int, "时", 0}, {int, "分", 0}, {int, "秒", 0}],
	     desc = "修改注册时间",
	     do =
		 fun ([Year, Month, Day, HH, MM, SS], Role) ->
			 NRole = Role#role{reg_time =
					       date:datetime_to_seconds({{Year,
									  Month,
									  Day},
									 {HH,
									  MM,
									  SS}})},
			 util:set_timer(delay_kick_out, 1,
					{stop, normal,
					 lang:get(<<"修改注册时间需重新登录"/utf8>>)}),
			 {ok, NRole}
		 end},
     #gm_cmd{cmd = "设注册天数", args = [{int, "天", 1}],
	     desc = "修改注册时间",
	     do =
		 fun ([D], Role) ->
			 NRole = Role#role{reg_time =
					       date:unixtime(zero) -
						 86400 * max(0, D - 1)},
			 util:set_timer(delay_kick_out, 1,
					{stop, normal,
					 lang:get(<<"修改注册时间需重新登录"/utf8>>)}),
			 {ok, NRole}
		 end},
     #gm_cmd{cmd = "注册前一天", args = [], desc = "注册前一天",
	     do =
		 fun ([],
		      Role = #role{reg_time = RegTime,
				   misc =
				       Misc = #role_misc{reg_zero_time =
							     RegZeroTime}}) ->
			 NRole = Role#role{reg_time = RegTime - 86400,
					   misc =
					       Misc#role_misc{reg_zero_time =
								  RegZeroTime -
								    86400}},
			 {ok, NewRole} = holiday_role:reload(NRole),
			 {reply, "成功注册前一天", NewRole}
		 end},
     #gm_cmd{cmd = "查看注册时间", args = [], desc = "查看当前角色注册时间",
	     do =
		 fun ([], #role{reg_time = RegTime}) ->
			 {reply,
			  util:fbin("~w", [date:seconds_to_datetime(RegTime)])}
		 end},
     #gm_cmd{cmd = "设开服时间",
	     args =
		 [{int, "年", 2015}, {int, "月", 1}, {int, "日", 1},
		  {int, "时", 0}, {int, "分", 0}, {int, "秒", 0}],
	     desc = "修改开服时间",
	     do =
		 fun ([Year, Month, Day, HH, MM, SS], _Role) ->
			 case Year >= 2010 of
			   true ->
			       sys_env:save(open_datetime,
					    {{Year, Month, Day}, {HH, MM, SS}}),
			       sys_env ! init_time,
			       erlang:send_after(2000, whereis(guild_war_mgr),
						 zero_update),
			       ok;
			   _ -> ok
			 end
		 end},
     #gm_cmd{cmd = "设开服天数", args = [{int, "天", 1}],
	     desc = "修改开服时间",
	     do =
		 fun ([Day], _Role) ->
			 sys_env:save(open_datetime,
				      date:unixtime(zero) -
					86400 * max(0, Day - 1)),
			 sys_env ! init_time,
			 erlang:send_after(2000, whereis(guild_war_mgr),
					   zero_update),
			 ok
		 end},
     #gm_cmd{cmd = "查看开服时间", args = [], desc = "查看当前服务器开服时间",
	     do =
		 fun ([], _Role) ->
			 {reply,
			  util:fbin("~w",
				    [date:seconds_to_datetime(sys_env:srv_open_time())])}
		 end},
     #gm_cmd{cmd = "查看合服时间", args = [], desc = "查看当前服务器合服时间",
	     do =
		 fun ([], _Role) ->
			 {reply,
			  util:fbin("~w",
				    [date:seconds_to_datetime(sys_env:get(merge_timestamp))])}
		 end},
     #gm_cmd{cmd = "设合服时间",
	     args =
		 [{int, "年", 2015}, {int, "月", 1}, {int, "日", 1},
		  {int, "时", 0}, {int, "分", 0}, {int, "秒", 0}],
	     desc = "修改合服时间",
	     do =
		 fun ([Year, Month, Day, HH, MM, SS], _Role) ->
			 sys_env:save(merge_datetime,
				      {{Year, Month, Day}, {HH, MM, SS}}),
			 sys_env ! init_time,
			 ok
		 end},
     #gm_cmd{cmd = "设合服天数", args = [{int, "天", 1}],
	     desc = "修改合服时间",
	     do =
		 fun ([Day], _Role) ->
			 sys_env:save(merge_datetime,
				      date:unixtime(zero) -
					86400 * max(0, Day - 1)),
			 sys_env ! init_time,
			 erlang:send_after(2000, whereis(guild_war_mgr),
					   zero_update),
			 ok
		 end},
     #gm_cmd{cmd = "合服次数", args = [{int, "idx", 0}],
	     desc = "合服次数",
	     do =
		 fun ([Idx], _Role) -> sys_env:save(merge_index, Idx), ok
		 end},
     #gm_cmd{cmd = "开机器人",
	     args =
		 [{int, "开始编号", 1}, {int, "结束编号", 1},
		  {atom, "模式", robot}, {atom, "服", self}],
	     desc =
		 binary_to_list(util:fbin("模式:~w",
					  [catch tester_ai_base:mod()])),
	     do =
		 fun ([Min, Max, _Mod, _Srv], _Role)
			 when Min > Max orelse Max - Min > 2000 ->
			 {reply, "非法参数"};
		     ([Min, Max, Mod, Srv], _Role) ->
			 test:t(Srv, Mod, Min, Max), ok
		 end},
     #gm_cmd{cmd = "关闭机器人", args = [], desc = "关闭机器人",
	     do = fun ([], _Role) -> tester:info(all, del), ok end},
     #gm_cmd{cmd = "邮件测试",
	     args =
		 [{term, "资产列表", []}, {term, "物品列表", []},
		  {int, "超时时间(秒)", 86400},
		  {bin, "标题", <<"邮件测试显示十字情况"/utf8>>},
		  {bin, "内容",
		   <<"由于您的宗门未达到宗门战报名要求，2级宗门以上，并且当天45级活跃人数超过10人，所以未能"
		     "报名。请下次加油"/utf8>>}],
	     desc = "邮件测试",
	     do =
		 fun ([Assets, Items, Timeout, Title, Content], Role) ->
			 mail:send(Role#role.id,
				   #{title => Title, content => Content,
				     timeout => date:unixtime() + Timeout,
				     assets => Assets, items => Items,
				     source => <<"GM测试"/utf8>>}),
			 ok
		 end},
     #gm_cmd{cmd = "公告测试",
	     args =
		 [{int, "类型(1-4)", 2}, {int, "公告编号", 1},
		  {int, "超时时间(秒)", 86400},
		  {bin, "标题", <<"公告测试显示十字情况"/utf8>>},
		  {bin, "概率", <<"这是内容概要说明"/utf8>>},
		  {bin, "内容",
		   <<"公告您的宗门未达到宗门战报名要求，2级宗门以上，并且当天45级活跃人数超过10人，所以未能"
		     "报名。请下次加油"/utf8>>}],
	     desc = "公告测试",
	     do =
		 fun ([Type, Id, Timeout, Title, Summary, Content],
		      _Role) ->
			 ST = date:unixtime(),
			 ET = date:unixtime() + Timeout,
			 Lev = 0,
			 Sort = 0,
			 ChannelNames = [],
			 case Type of
			   1 ->
			       db:execute("delete from sys_notice_board where type "
					  "= 1");
			   _ ->
			       Board = #notice_board{id = Id, type = Type,
						     title = Title,
						     summary = Summary,
						     content = Content,
						     sort = Sort, lev = Lev,
						     start_time = ST,
						     end_time = ET},
			       ets:insert(notice_board, Board),
			       notice_board:board(Id)
			 end,
			 db:execute("replace into sys_notice_board (id, type, "
				    "title, summary, content, sort, lev, "
				    "start_time, end_time,channel) values(?,?,?,?,"
				    "?,?,?,?,?,?)",
				    [Id, Type, Title, Summary, Content, Sort,
				     Lev, ST, ET,
				     util:term_to_string(ChannelNames)]),
			 ok
		 end},
     #gm_cmd{cmd = "断线", args = [], desc = "断开连接进程",
	     do =
		 fun ([], _Role) ->
			 get('@conn_pid') ! {'EXIT', self(), gm_exit}, ok
		 end},
     #gm_cmd{cmd = "强制下线", args = [], desc = "强制关闭角色进程",
	     do =
		 fun ([], _Role) ->
			 self() ! {stop, normal, lang:get(<<"GM强制下线"/utf8>>)},
			 ok
		 end},
     #gm_cmd{cmd = "协议监控", args = [{atom, "状态", true}],
	     desc = "协议请求发送监控 true | false",
	     do =
		 fun ([Debug], _Role) ->
			 get('@conn_pid') ! {debug, Debug}, ok
		 end},
     #gm_cmd{cmd = "协议请求",
	     args =
		 [{int, "协议号"}, {string, "协议请求附带值 举例=>1,abc", ""},
		  {int, "发送次数", 1}],
	     desc = "协议请求消息(服务器端测试使用)",
	     do =
		 fun ([Code, Info, Num], Role) ->
			 case mapping:module(game_server, Code) of
			   {ok, _, object, _Parser, Mod} ->
			       Tuple = case util:string_to_term(Info) of
					 {ok, Term} -> Term;
					 _ ->
					     L = string:tokens(Info, ";"),
					     Fun = fun (A) ->
							   case catch
								  list_to_integer(A)
							       of
							     {'EXIT', _} ->
								 case catch
									list_to_float(A)
								     of
								   {'EXIT',
								    _} ->
								       case
									 util:string_to_term(A)
									   of
									 {ok,
									  Term}
									     when
									       is_list(Term)
										 orelse
										 is_tuple(Term) ->
									     Term;
									 _ ->
									     list_to_binary(A)
								       end;
								   Float ->
								       Float
								 end;
							     Int -> Int
							   end
						   end,
					     ArgL = lists:map(Fun, L),
					     list_to_tuple(ArgL)
				       end,
			       [role:rpc(Role#role.pid, Mod, Code, Tuple)
				|| _ <- lists:seq(1, max(1, Num))],
			       ok;
			   _ -> {reply, "非法协议号"}
			 end
		 end},
     #gm_cmd{cmd = "协议推送",
	     args =
		 [{int, "协议号"}, {string, "协议请求附带值 举例=>1;abc", ""},
		  {int, "发送次数", 1}],
	     desc = "推送请求消息(客户端测试使用)",
	     do =
		 fun ([Code, Info, Max], _Role) ->
			 L = string:tokens(Info, ";"),
			 Fun = fun (A) ->
				       case catch list_to_integer(A) of
					 {'EXIT', _} ->
					     case catch list_to_float(A) of
					       {'EXIT', _} ->
						   case util:string_to_term(A)
						       of
						     {ok, Term}
							 when is_list(Term)
								orelse
								is_tuple(Term) ->
							 Term;
						     _ -> A
						   end;
					       Float -> Float
					     end;
					 Int -> Int
				       end
			       end,
			 ArgL = lists:map(Fun, L),
			 Tuple = list_to_tuple(ArgL),
			 [sys_conn:pack_send(Code, Tuple)
			  || _ <- lists:seq(1, max(1, Max))],
			 ok
		 end},
     #gm_cmd{cmd = "发起战斗",
	     args = [{int, "怪物id"}, {int, "战斗类型", 1}],
	     desc = "发起战斗打怪物",
	     do =
		 fun ([MonId, CombatType], Role) ->
			 combat_lib:start_mon_combat(Role, CombatType, MonId,
						     #{}),
			 ok
		 end},
     #gm_cmd{cmd = "战斗多次", args = [{int, "数量", 1000}],
	     desc = "战斗多次",
	     do =
		 fun ([Num], Role) -> combat_pk:gm_must_pk(Role, Num)
		 end},
     #gm_cmd{cmd = "伙伴等级", args = [{int, "伙伴等级"}],
	     desc = "设伙伴等级，不超过最大等级",
	     do =
		 fun ([Level], Role) ->
			 partner_lib:gm_set_lev(Role, Level)
		 end},
     #gm_cmd{cmd = "伙伴星级",
	     args = [{int, "伙伴bid"}, {int, "伙伴星级"}],
	     desc = "设伙伴星级，不超过最大等级",
	     do =
		 fun ([Bid, Star], Role) ->
			 partner_lib:gm_set_star(Role, Bid, Star)
		 end},
     #gm_cmd{cmd = "一键上阵", args = [], desc = "一键上阵",
	     do =
		 fun ([], Role) -> formation_lib:gm_on_pos(Role) end},
     #gm_cmd{cmd = "伙伴进阶", args = [{int, "伙伴阶级"}],
	     desc = "设伙伴突破，不超过最大等级",
	     do =
		 fun ([BreakLev], Role) ->
			 partner_lib:gm_break(Role, BreakLev)
		 end},
     #gm_cmd{cmd = "伙伴清空", args = [{int, "伙伴星数", 10}],
	     desc = "设伙伴突破，不超过最大等级",
	     do =
		 fun ([Star], Role) -> partner_lib:gm_delete(Role, Star)
		 end},
     #gm_cmd{cmd = "解锁技能", args = [], desc = "一键解锁伙伴所有技能",
	     do =
		 fun ([], Role) -> partner:gm_unlock_skill(Role) end},
     #gm_cmd{cmd = "竞技场赛季", args = [], desc = "竞技场赛季结算",
	     do =
		 fun ([], _Role) ->
			 arena_mgr:info(season_reward), {reply, "请查看奖励邮件"}
		 end},
     #gm_cmd{cmd = "竞技场下赛季", args = [], desc = "竞技场进入下一赛季",
	     do =
		 fun ([], _Role) ->
			 arena_mgr:info(season_end), {reply, "执行成功"}
		 end},
     #gm_cmd{cmd = "竞技场加积分", args = [{int, "积分", 1}],
	     desc = "竞技场增加积分",
	     do =
		 fun ([AddScore], Role) ->
			 arena:gm(Role, {add_score, AddScore})
		 end},
     #gm_cmd{cmd = "竞技场清空奖励", args = [], desc = "竞技场清空奖励",
	     do =
		 fun ([], Role) -> arena:gm(Role, {reset_reward}) end},
     #gm_cmd{cmd = "竞技场清冷却", args = [], desc = "竞技场清冷却",
	     do =
		 fun ([], Role) -> arena:gm(Role, {reset_cool}) end},
     #gm_cmd{cmd = "冠军赛下阶段", args = [], desc = "冠军赛下阶段",
	     do = fun ([], _Role) -> arena_champion_mgr:m(), ok end},
     #gm_cmd{cmd = "冠军赛结束", args = [], desc = "冠军赛结束",
	     do =
		 fun ([], _Role) -> arena_champion_mgr:info(gm_stop), ok
		 end},
     #gm_cmd{cmd = "冠军赛匹配情况", args = [], desc = "冠军赛机器人匹配情况",
	     do =
		 fun ([], _Role) ->
			 arena_champion_mgr:gm_match_robot_info(), ok
		 end},
     #gm_cmd{cmd = "冠军赛竞猜", args = [{atom, "结果", win}],
	     desc = "冠军赛竞猜结果锁定",
	     do =
		 fun ([Info], _Role) ->
			 arena_champion_mgr:apply({undefined,
						   fun (_, _) ->
							   put(gm_combat_info,
							       Info)
						   end,
						   []}),
			 ok
		 end},
     #gm_cmd{cmd = "巅峰冠军赛竞猜", args = [{atom, "结果", win}],
	     desc = "冠军赛竞猜结果锁定",
	     do =
		 fun ([Info], _Role) ->
			 arena_peak_champion_mgr:apply({undefined,
							fun (_, _) ->
								put(gm_combat_info,
								    Info)
							end,
							[]}),
			 ok
		 end},
     #gm_cmd{cmd = "跨服冠军赛下阶段", args = [], desc = "跨服冠军赛下阶段",
	     do =
		 fun ([], _Role) ->
			 cluster_dynamic_group:cast_main(1,
							 arena_cluster_champion_mgr,
							 m, []),
			 ok
		 end},
     #gm_cmd{cmd = "跨服冠军赛竞猜", args = [{atom, "结果", win}],
	     desc = "跨服冠军赛竞猜结果锁定",
	     do =
		 fun ([Info], _Role) ->
			 cluster_dynamic_group:cast_main(1,
							 arena_cluster_champion_mgr,
							 apply,
							 [{undefined,
							   fun (_, _) ->
								   put(gm_combat_info,
								       Info)
							   end,
							   []}]),
			 ok
		 end},
     #gm_cmd{cmd = "跨服冠军赛重置赛季", args = [],
	     desc = "跨服冠军赛重置赛季",
	     do =
		 fun ([], _Role) ->
			 cluster_dynamic_group:cast_main(1,
							 arena_cluster_champion_mgr,
							 info,
							 [gm_init_season]),
			 ok
		 end},
     #gm_cmd{cmd = "众神战下阶段", args = [], desc = "众神战下阶段",
	     do = fun ([], _Role) -> zs_war_mgr:m(), ok end},
     #gm_cmd{cmd = "联盟战下阶段", args = [], desc = "联盟战下阶段",
	     do = fun ([], _Role) -> c_guild_war_mgr:m(), ok end},
     #gm_cmd{cmd = "加属性",
	     args =
		 [{int, "攻", 9999999}, {int, "血", 9999999},
		  {int, "速", 9999999}, {int, "防", 9999999},
		  {int, "暴", 999999}],
	     desc = "GM增加属性值",
	     do =
		 fun ([Atk, Hp, Speed, Def, Crit],
		      Role = #role{misc = Misc}) ->
			 Role1 = Role#role{misc =
					       Misc#role_misc{gm_attr =
								  [{atk, Atk},
								   {hp_max, Hp},
								   {speed,
								    Speed},
								   {def, Def},
								   {crit_rate,
								    Crit}]}},
			 {ok, partner_lib:ref_formation_attr(Role1, 0)}
		 end},
     #gm_cmd{cmd = "win", args = [{int, "战斗类型", 0}],
	     desc = "战斗胜利",
	     do =
		 fun ([0], #role{combat_pid = Pid, id = Rid})
			 when is_pid(Pid) ->
			 Pid ! {win, Rid}, ok;
		     ([CombatType], Role) ->
			 case combat_lib:combat_pid(Role, CombatType) of
			   {CombatType, CombatPid} ->
			       CombatPid ! {win, Role#role.id};
			   _ -> ok
			 end,
			 ok
		 end},
     #gm_cmd{cmd = "lose", args = [{int, "战斗类型", 0}],
	     desc = "战斗失败",
	     do =
		 fun ([0], #role{combat_pid = Pid, id = Rid})
			 when is_pid(Pid) ->
			 Pid ! {lose, Rid}, ok;
		     ([CombatType], Role) ->
			 case combat_lib:combat_pid(Role, CombatType) of
			   {CombatType, CombatPid} ->
			       CombatPid ! {lose, Role#role.id};
			   _ -> ok
			 end,
			 ok
		 end},
     #gm_cmd{cmd = "无CD", args = [{int, "有没有技能CD", 1}],
	     desc = "设置战斗中没有技能CD",
	     do =
		 fun ([IsNoCd], #role{combat_pid = Pid})
			 when is_pid(Pid) ->
			 combat:gm_set_no_cd(Pid, IsNoCd), ok;
		     (_, #role{}) -> ok
		 end},
     #gm_cmd{cmd = "战斗掉落", args = [{int, "单位ID"}],
	     desc = "战斗掉落测试",
	     do =
		 fun ([MonId],
		      Role = #role{id = RoleId, career = Career,
				   lev = Lev}) ->
			 Winner = #fight_object{master_id = RoleId,
						career = Career, lev = Lev,
						object_type = 1},
			 case drop_lib:combat_drop(#combat{ext_args =
							       [{unit,
								 {0, 0,
								  MonId}}],
							   attack_list =
							       [Winner]},
						   a_win)
			     of
			   [{_, Items}] ->
			       {ok, NRole, _} = drop_lib:gain_combat_drop(Role,
									  #combat{},
									  0, [],
									  Items),
			       {ok, NRole};
			   _ -> {reply, "没有掉落"}
			 end
		 end},
     #gm_cmd{cmd = "掉落",
	     args = [{int, "掉落ID"}, {int, "次数", 1}], desc = "掉落测试",
	     do =
		 fun ([DropId, Num], Role) ->
			 Role2 = drop_lib:gm_drop(Role, DropId, Num),
			 {ok, Role2}
		 end},
     #gm_cmd{cmd = "怪物掉落",
	     args = [{int, "怪物ID"}, {int, "次数", 1}], desc = "怪物掉落测试",
	     do =
		 fun ([MonId, Num], Role) ->
			 Role2 = drop_lib:gm_drop_mon(Role, MonId, Num),
			 {ok, Role2}
		 end},
     #gm_cmd{cmd = "打自己", args = [{int, "战斗类型", 1}],
	     desc = "打自己",
	     do =
		 fun ([CombatType], Role) ->
			 combat_lib:start_pk_with_myself(Role, CombatType), ok
		 end},
     #gm_cmd{cmd = "护送双倍", args = [], desc = "护送双倍检查",
	     do =
		 fun ([], _Role) -> escort_mgr:info(double_time), ok
		 end},
     #gm_cmd{cmd = "PK",
	     args = [{bin, "目标名"}, {int, "目标是否进战斗", 0}],
	     desc = "PK指定目标",
	     do =
		 fun ([TarName, Mode], Role) ->
			 combat_pk:pk_target(Role, TarName, Mode)
		 end},
     #gm_cmd{cmd = "观战", args = [{int, "战斗类型", 1}],
	     desc = "根据类型观看自己相关战斗",
	     do =
		 fun ([CombatType],
		      Role = #role{play_speed = Speed,
				   combat_type_list = CombatTypeList,
				   id = RoleId, pid = RolePid,
				   link = #link{conn_pid = ConnPid},
				   misc = Misc}) ->
			 case lists:keyfind(CombatType, 1, CombatTypeList) of
			   {_, CombatPid} ->
			       combat:quit_watch_combat(Role),
			       combat:watch_combat(CombatPid, RoleId, RolePid,
						   ConnPid, Speed),
			       {ok,
				Role#role{combat_pid = 0,
					  misc =
					      Misc#role_misc{combat_watch_pid =
								 0}}};
			   _ -> {reply, "相关战斗不存在"}
			 end
		 end},
     #gm_cmd{cmd = "充值",
	     args = [{int, "人民币", 1000}, {int, "ID", 0}],
	     desc = "充值指定钻石",
	     do =
		 fun ([Money, Bid],
		      #role{id = {Rid, SrvId}, account = Account, name = Name,
			    channel = Channel}) ->
			 Sn = list_to_binary(lists:concat([gm_,
							   date:unixtime(ms) *
							     100000000,
							   Rid])),
			 _Ret =
			     db:execute("insert into mod_charge(sn, category, "
					"currency_type, status, gold, money, "
					"package_id, account, rid, srv_id, name, "
					"channel, pay_channel, ctime) values(?, "
					"?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
					"?)",
					[Sn, 3, "CNY", 0, 0, max(1, Money), Bid,
					 Account, Rid, SrvId, Name, Channel,
					 "GM", date:unixtime()]),
			 charge:notice(Rid, SrvId, Sn),
			 ok
		 end},
     #gm_cmd{cmd = "小数充值",
	     args = [{float, "人民币", 1000}, {int, "ID", 0}],
	     desc = "充值指定钻石",
	     do =
		 fun ([Money, Bid],
		      #role{id = {Rid, SrvId}, account = Account, name = Name,
			    channel = Channel}) ->
			 Sn = list_to_binary(lists:concat([gm_,
							   date:unixtime(ms) *
							     100000000,
							   Rid])),
			 _Ret =
			     db:execute("insert into mod_charge(sn, category, "
					"currency_type, status, gold, money, "
					"package_id, account, rid, srv_id, name, "
					"channel, pay_channel, ctime) values(?, "
					"?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
					"?)",
					[Sn, 3, "CNY", 0, 0, Money, Bid,
					 Account, Rid, SrvId, Name, Channel,
					 "GM", date:unixtime()]),
			 charge:notice(Rid, SrvId, Sn),
			 ok
		 end},
     #gm_cmd{cmd = "设VIP等级", args = [{int, "值", 1}],
	     desc = "设置角色VIP等级",
	     do =
		 fun ([Val], Role = #role{m_vip = MVip}) ->
			 case Val > 15 of
			   true -> {ok, Role};
			   false ->
			       NewRole = Role#role{m_vip =
						       MVip#m_vip{lev = Val}},
			       role_lib:push_base_info(NewRole),
			       {ok, NewRole}
			 end
		 end},
     #gm_cmd{cmd = "发送周报邮件", args = [], desc = "发送周报邮件",
	     do =
		 fun ([], Role) ->
			 role_weekly_lib:gm_send_weekly_mail(Role), ok
		 end},
     #gm_cmd{cmd = "加buff", args = [{int, "值", 1}],
	     desc = "加战斗外buff",
	     do =
		 fun ([Val], Role) -> role_buff:add_buff(Role, Val) end},
     #gm_cmd{cmd = "剧情副本全开", args = [{int, "难度", 1}],
	     desc = "剧情副本全开",
	     do =
		 fun ([Mode], Role) -> dungeon:gm(Role, {open_all, Mode})
		 end},
     #gm_cmd{cmd = "剧情章节通关", args = [{int, "关卡", 0}],
	     desc = "剧情本难度本章节全部通关",
	     do =
		 fun ([DunId], Role) ->
			 case DunId > 0 of
			   true -> dungeon:gm(Role, {open_to, DunId});
			   _ -> dungeon:gm(Role, {chapter_open})
			 end
		 end},
     #gm_cmd{cmd = "剧情关卡冷却", args = [], desc = "剧情关卡冷却跳过",
	     do =
		 fun ([], Role) -> dungeon:gm(Role, {skip_cool_time})
		 end},
     #gm_cmd{cmd = "副本下一关", args = [], desc = "剧情副本跳到下一关卡",
	     do = fun ([], Role) -> dungeon:gm(Role, {next}) end},
     #gm_cmd{cmd = "特惠礼包", args = [{int, "商品ID"}],
	     desc = "特惠礼包刷新",
	     do =
		 fun ([EId],
		      Role = #role{m_exchange =
				       MExchange = #m_shop{expire_list =
							       List}}) ->
			 case lists:keyfind(EId, #exchange_expire_gift.eid,
					    List)
			     of
			   Gift = #exchange_expire_gift{timeout = Timeout} ->
			       NTimeout = Timeout - 86400,
			       NewRole = case NTimeout > 0 of
					   true ->
					       NewGift =
						   Gift#exchange_expire_gift{timeout
										 =
										 NTimeout,
									     reward_time
										 =
										 0},
					       NewList = lists:keystore(EId,
									#exchange_expire_gift.eid,
									List,
									NewGift),
					       NewMexchange =
						   MExchange#m_shop{expire_list
									=
									NewList},
					       NRole = Role#role{m_exchange =
								     NewMexchange},
					       exchange_gift:zero_flush(NRole);
					   false ->
					       {ok, NRole} =
						   exchange_gift:del_expire_gift(Role,
										 EId),
					       NRole
					 end,
			       {reply, "特惠礼包刷新成功", NewRole};
			   _ -> {reply, "特惠礼包刷新失败"}
			 end
		 end},
     #gm_cmd{cmd = "播放剧情",
	     args = [{int, "剧情ID"}, {int, "第几步", 1}],
	     desc = "播放指定剧情",
	     do =
		 fun ([Id, Step], Role) ->
			 case drama:gm_play(Role, Id, Step) of
			   {ok, NewRole} -> {ok, NewRole};
			   {false, Msg} -> {reply, Msg};
			   _ -> {reply, "无法播放该剧情"}
			 end
		 end},
     #gm_cmd{cmd = "跳过所有剧情", args = [], desc = "跳过所有剧情",
	     do =
		 fun ([], Role) ->
			 NewRole = drama:gm_skip_all(Role),
			 {reply, "成功跳过所有剧情", NewRole}
		 end},
     #gm_cmd{cmd = "跳过新手剧情", args = [], desc = "跳过新手剧情",
	     do =
		 fun ([], Role) ->
			 NewRole = drama:gm_skip(Role, 20000),
			 {reply, "成功跳过新手剧情", NewRole}
		 end},
     #gm_cmd{cmd = "资产兑换", args = [{int, "类型", 1}],
	     desc = "资产兑换",
	     do =
		 fun ([Type], Role) ->
			 role:redirect(Role, 20701, {Type}), ok
		 end},
     #gm_cmd{cmd = "联盟维护", args = [], desc = "联盟维护",
	     do =
		 fun ([], _Role) ->
			 guild:apply(async, all,
				     {100, 2000, {guild_handle, maintain, []}}),
			 ok
		 end},
     #gm_cmd{cmd = "联盟成员在线", args = [{int, "时间", 1}],
	     desc = "设置成员在线时间",
	     do =
		 fun ([T], _Role) ->
			 Time = date:unixtime() - T,
			 guild:apply(async, all,
				     {fun (G = #guild{members = ML}) ->
					      {ok,
					       G#guild{members =
							   [M#guild_member{login_time
									       =
									       Time}
							    || M <- ML]}}
				      end}),
			 ok
		 end},
     #gm_cmd{cmd = "清退联盟时间", args = [], desc = "清空退出联盟时间",
	     do =
		 fun ([], Role = #role{guild_bag = GuildBag}) ->
			 {ok,
			  Role#role{guild_bag =
					GuildBag#guild_bag{quit_time = 0}}}
		 end},
     #gm_cmd{cmd = "加联盟经验", args = [{int, "经验值", 100}],
	     desc = "加联盟经验",
	     do =
		 fun ([Exp],
		      _Role = #role{id = RoleId, pid = RolePid,
				    guild_bag = #guild_bag{pid = GPid}})
			 when is_pid(GPid) ->
			 guild:apply(async, GPid,
				     {guild_handle, apply_donate,
				      [{gm, RoleId, RolePid, 1, Exp, 1}]}),
			 ok;
		     (_, _Role) -> ok
		 end},
     #gm_cmd{cmd = "加联盟活跃经验", args = [{int, "经验值", 100}],
	     desc = "加联盟活跃经验",
	     do =
		 fun ([Exp], Role) ->
			 guild_quest:gm(Role, {add_exp, Exp})
		 end},
     #gm_cmd{cmd = "炼金场红点", args = [], desc = "炼金场红点",
	     do =
		 fun ([], Role) ->
			 {ok, NewRole} = trade:gm_point(Role),
			 {reply, "炼金场红点", NewRole}
		 end},
     #gm_cmd{cmd = "接受任务", args = [{int, "任务Id", 1}],
	     desc = "接受任务",
	     do =
		 fun ([QuestId], Role) ->
			 case quest_data:get(QuestId) of
			   QuestData = #quest_data{} ->
			       case quest:accept_handle([accept, fire], Role,
							QuestData, QuestId)
				   of
				 {ok, NewRole} -> {reply, "成功接受任务", NewRole};
				 {false, Msg} -> {reply, Msg};
				 _ -> {reply, "无法接受任务"}
			       end;
			   _ -> {false, "此任务不存在"}
			 end
		 end},
     #gm_cmd{cmd = "放弃任务", args = [{int, "任务Id", 1}],
	     desc = "放弃任务",
	     do =
		 fun ([QuestId],
		      Role = #role{m_quest = #m_quest{quest = Quests}}) ->
			 case quest_data:get(QuestId) of
			   QuestData = #quest_data{} ->
			       case lists:keyfind(QuestId, #quest.id, Quests) of
				 Quest = #quest{} ->
				     case quest:commit_handle([finish,
							       del_quest, flush,
							       giveup_fire],
							      Role, Quest,
							      QuestData, [])
					 of
				       {ok, NewRole} ->
					   {reply, "成功放弃任务", NewRole};
				       {false, Msg} -> {reply, Msg};
				       _ -> {reply, "无法放弃任务"}
				     end;
				 _ -> {reply, "你并未接受此任务，无法放弃"}
			       end;
			   _ -> {false, "此任务不存在"}
			 end
		 end},
     #gm_cmd{cmd = "删除任务", args = [{int, "任务Id", 1}],
	     desc = "删除任务",
	     do =
		 fun ([QuestId],
		      Role = #role{m_quest = #m_quest{quest = Quests}}) ->
			 case quest_data:get(QuestId) of
			   QuestData = #quest_data{} ->
			       case lists:keyfind(QuestId, #quest.id, Quests) of
				 Quest = #quest{} ->
				     case quest:commit_handle([del_quest,
							       flush],
							      Role, Quest,
							      QuestData, [])
					 of
				       {ok, NewRole} ->
					   {reply, "成功删除任务", NewRole};
				       {false, Msg} -> {reply, Msg};
				       _ -> {reply, "无法删除任务"}
				     end;
				 _ -> {reply, "你并未接受此任务，无法删除"}
			       end;
			   _ -> {false, "此任务不存在"}
			 end
		 end},
     #gm_cmd{cmd = "删除任务组", args = [{int, "任务组Id", 1}],
	     desc = "删除任务组",
	     do =
		 fun ([GroupId], Role = #role{}) ->
			 List = quest_data:group(GroupId),
			 {ok, NRole} = quest:apply_del_quest(Role, List),
			 NewRole = quest:flush(NRole, push),
			 {reply, "成功删除任务组", NewRole}
		 end},
     #gm_cmd{cmd = "完成任务", args = [{int, "任务Id", 1}],
	     desc = "完成任务",
	     do =
		 fun ([QuestId],
		      Role = #role{m_quest =
				       MQuest = #m_quest{quest = Quests,
							 finished =
							     Finished}}) ->
			 case quest_data:get(QuestId) of
			   QuestData = #quest_data{} ->
			       case lists:keyfind(QuestId, #quest.id, Quests) of
				 Quest = #quest{} ->
				     Steps = [reward, finish, del_quest, fire,
					      special_fire, flush],
				     case quest:commit_handle(Steps, Role,
							      Quest, QuestData,
							      [])
					 of
				       {ok, NewRole} ->
					   {reply, "成功提交任务", NewRole};
				       {false, Msg} -> {reply, Msg};
				       _ -> {reply, "无法提交任务"}
				     end;
				 _ ->
				     NewMQuest = MQuest#m_quest{finished =
								    [QuestId
								     | lists:delete(QuestId,
										    Finished)]},
				     NewRole = Role#role{m_quest = NewMQuest},
				     {reply, "成功提交任务", NewRole}
			       end;
			   _ -> {false, "此任务不存在"}
			 end
		 end},
     #gm_cmd{cmd = "接受成就", args = [{int, "成就Id", 1}],
	     desc = "接受成就",
	     do =
		 fun ([QuestId], Role) ->
			 case feat:gm_accept(Role, QuestId) of
			   {ok, NewRole} -> {reply, "成功接受成就", NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "删除成就", args = [{int, "成就Id", 1}],
	     desc = "删除成就",
	     do =
		 fun ([QuestId], Role) ->
			 {ok, NewRole} = feat:gm_del(Role, QuestId),
			 {reply, "成功删除成就", NewRole}
		 end},
     #gm_cmd{cmd = "删除成就", args = [{int, "成就Id", 1}],
	     desc = "删除成就",
	     do =
		 fun ([QuestId], Role) ->
			 {ok, NewRole} = feat:gm_del(Role, QuestId),
			 {reply, "成功删除成就", NewRole}
		 end},
     #gm_cmd{cmd = "个人空间成就完成", args = [{int, "成就Id", 90090}],
	     desc = "个人空间成就完成",
	     do =
		 fun ([QuestId], Role) ->
			 room_feat:gm_finish(Role, QuestId), {reply, "成功完成成就"}
		 end},
     #gm_cmd{cmd = "激活头像框", args = [{int, "头像框基础Id", 1}],
	     desc = "激活头像框",
	     do =
		 fun ([BaseId], Role) ->
			 case avatar:gm_activate(Role, #{base_id => BaseId}) of
			   {ok, NewRole} ->
			       {reply, "Đã kích hoạt thành công khung avatar",
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "删除头像框", args = [{int, "头像框基础Id", 1}],
	     desc = "删除头像框",
	     do =
		 fun ([BaseId], Role) ->
			 case avatar:del(Role, BaseId) of
			   {ok, NewRole} ->
			       {reply, "Đã xóa khung hình đại diện thành công",
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "激活聊天框", args = [{int, "聊天框基础Id", 1}],
	     desc = "激活聊天框",
	     do =
		 fun ([BaseId], Role) ->
			 case say_frame:gm_activate(Role, #{base_id => BaseId})
			     of
			   {ok, NewRole} ->
			       {reply, "Đã kích hoạt hộp trò chuyện thành công",
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "删除聊天框", args = [{int, "聊天框基础Id", 1}],
	     desc = "删除聊天框",
	     do =
		 fun ([BaseId], Role) ->
			 case say_frame:del(Role, BaseId) of
			   {ok, NewRole} ->
			       {reply, "Đã xóa hộp trò chuyện thành công",
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "激活称号", args = [{int, "称号基础Id", 1}],
	     desc = "激活称号",
	     do =
		 fun ([BaseId], Role) ->
			 case honor:gm_activate(Role, #{base_id => BaseId}) of
			   {ok, NewRole} ->
			       {reply, "Đã kích hoạt danh hiệu thành công",
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "删除称号", args = [{int, "称号基础Id", 1}],
	     desc = "删除称号",
	     do =
		 fun ([BaseId], Role) ->
			 case honor:del(Role, BaseId) of
			   {ok, NewRole} ->
			       {reply, "Đã xóa tiêu đề thành công", NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "领取首充礼包", args = [], desc = "领取首充礼包",
	     do =
		 fun ([], Role) ->
			 case charge_misc:gm_reward(Role) of
			   {false, Msg} -> {reply, Msg};
			   {ok, NewRole} ->
			       {reply,
				"Đã nhận thành công gói quà tặng nạp "
				"tiền đầu tiên",
				NewRole}
			 end
		 end},
     #gm_cmd{cmd = "加跨服进程值", args = [{int, "进程值", 1}],
	     desc = "",
	     do =
		 fun ([Val], _Role) ->
			 group_control_mgr:gm_add_process_val(Val), ok
		 end},
     #gm_cmd{cmd = "清空跨服进程值", args = [], desc = "",
	     do =
		 fun ([], _Role) ->
			 group_control_mgr:gm_clean_process(), ok
		 end},
     #gm_cmd{cmd = "清空神器背包", args = [], desc = "",
	     do =
		 fun ([], Role) ->
			 NewRole = partner_awaken:gm_clear(Role),
			 {reply, "Ba lô hiện vật đã được làm trống", NewRole}
		 end},
     #gm_cmd{cmd = "加伙伴", args = [{int, "伙伴id", 10001}],
	     desc = "",
	     do =
		 fun ([Id], Role) ->
			 case partner:add_partners(Role, Id, gm) of
			   {false, Msg} -> {false, Msg};
			   NRole -> {ok, NRole}
			 end
		 end},
     #gm_cmd{cmd = "binary", args = [], desc = "",
	     do =
		 fun ([], Role) ->
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
			   {__Pidgm_cmd2031, _,
			    {__Levelgm_cmd2031, __Tracesgm_cmd2031}}
			       when __Levelgm_cmd2031 band 64 /= 0 orelse
				      __Tracesgm_cmd2031 /= [] ->
			       lager:do_log(info,
					    [{module, gm_cmd}, {function, cmds},
					     {line, 2031},
					     {pid, pid_to_list(self())},
					     {node, node()}
					     | lager:md()],
					    io_lib:format("acc:~w",
							  [byte_size(Role#role.account)]),
					    none, 4096, 64, __Levelgm_cmd2031,
					    __Tracesgm_cmd2031, lager_event,
					    __Pidgm_cmd2031);
			   _ -> ok
			 end,
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
			   {__Pidgm_cmd2032, _,
			    {__Levelgm_cmd2032, __Tracesgm_cmd2032}}
			       when __Levelgm_cmd2032 band 64 /= 0 orelse
				      __Tracesgm_cmd2032 /= [] ->
			       lager:do_log(info,
					    [{module, gm_cmd}, {function, cmds},
					     {line, 2032},
					     {pid, pid_to_list(self())},
					     {node, node()}
					     | lager:md()],
					    io_lib:format("name:~w",
							  [byte_size(Role#role.name)]),
					    none, 4096, 64, __Levelgm_cmd2032,
					    __Tracesgm_cmd2032, lager_event,
					    __Pidgm_cmd2032);
			   _ -> ok
			 end,
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
			   {__Pidgm_cmd2033, _,
			    {__Levelgm_cmd2033, __Tracesgm_cmd2033}}
			       when __Levelgm_cmd2033 band 64 /= 0 orelse
				      __Tracesgm_cmd2033 /= [] ->
			       lager:do_log(info,
					    [{module, gm_cmd}, {function, cmds},
					     {line, 2033},
					     {pid, pid_to_list(self())},
					     {node, node()}
					     | lager:md()],
					    io_lib:format("acc:~w",
							  [binary:referenced_byte_size(Role#role.account)]),
					    none, 4096, 64, __Levelgm_cmd2033,
					    __Tracesgm_cmd2033, lager_event,
					    __Pidgm_cmd2033);
			   _ -> ok
			 end,
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
			   {__Pidgm_cmd2034, _,
			    {__Levelgm_cmd2034, __Tracesgm_cmd2034}}
			       when __Levelgm_cmd2034 band 64 /= 0 orelse
				      __Tracesgm_cmd2034 /= [] ->
			       lager:do_log(info,
					    [{module, gm_cmd}, {function, cmds},
					     {line, 2034},
					     {pid, pid_to_list(self())},
					     {node, node()}
					     | lager:md()],
					    io_lib:format("name:~w",
							  [binary:referenced_byte_size(Role#role.name)]),
					    none, 4096, 64, __Levelgm_cmd2034,
					    __Tracesgm_cmd2034, lager_event,
					    __Pidgm_cmd2034);
			   _ -> ok
			 end,
			 ok
		 end},
     #gm_cmd{cmd = "重置召唤", args = [{int, "卡池Id", 100}],
	     desc = "重置召唤数据",
	     do =
		 fun ([GroupId], Role) ->
			 case recruit:gm_reset_group(Role, GroupId) of
			   {ok, NewRole} ->
			       {reply, "Thiết lập lại triệu hồi thành công",
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "重置高级召唤", args = [{int, "卡池Id", 1000}],
	     desc = "重置召唤数据",
	     do =
		 fun ([GroupId], Role) ->
			 case recruit_high:gm_reset_group(Role, GroupId) of
			   {ok, NewRole} ->
			       {reply, "Thiết lập lại triệu hồi thành công",
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "刷新BOSS", args = [{int, "BOSSID"}],
	     desc = "刷新指定BOSS",
	     do =
		 fun ([BossId], Role) ->
			 world_boss:gm(Role, {ref_boss, BossId})
		 end},
     #gm_cmd{cmd = "BOSS伤害",
	     args = [{int, "BOSSID"}, {int, "伤害值", 1}],
	     desc = "指定BOSS伤害值",
	     do =
		 fun ([BossId, Hurt], Role) ->
			 world_boss:gm(Role, {boss_hurt, BossId, Hurt})
		 end},
     #gm_cmd{cmd = "阵法全开", args = [], desc = "",
	     do =
		 fun ([], Role) -> {ok, formation_lib:gm_open_all(Role)}
		 end},
     #gm_cmd{cmd = "冒险全通关", args = [], desc = "",
	     do =
		 fun ([], Role) -> adventure:gm(Role, {pass_all}) end},
     #gm_cmd{cmd = "冒险事件", args = [{int, "事件编号"}],
	     desc = "冒险事件号",
	     do =
		 fun ([EvtId], Role) ->
			 adventure:gm(Role, {set_evt, EvtId})
		 end},
     #gm_cmd{cmd = "冒险层", args = [{int, "层号", 1}],
	     desc = "冒险层",
	     do =
		 fun ([N], Role) -> adventure:gm(Role, {set_floor, N})
		 end},
     #gm_cmd{cmd = "冒险重置", args = [], desc = "冒险结束重置",
	     do = fun ([], Role) -> adventure:gm(Role, {reset}) end},
     #gm_cmd{cmd = "冒险自身重置", args = [], desc = "冒险结束重置",
	     do =
		 fun ([], Role) -> adventure:gm(Role, {reset_mine}) end},
     #gm_cmd{cmd = "重置等级礼包", args = [], desc = "重置等级礼包",
	     do =
		 fun ([], Role) ->
			 {ok, NRole} = lev_gift:gm_reset(Role),
			 {reply, "Đã thiết lập lại gói cấp độ thành công",
			  NRole}
		 end},
     #gm_cmd{cmd = "重置战力礼包", args = [], desc = "重置战力礼包",
	     do =
		 fun ([], Role) ->
			 {ok, NRole} = power_gift:gm_reset(Role),
			 {reply,
			  "Đã thiết lập lại thành công gói sức "
			  "mạnh chiến đấu",
			  NRole}
		 end},
     #gm_cmd{cmd = "月卡天数",
	     args =
		 [{int, "月卡id", 1}, {int, "天数", 1}, {int, "已领取", 1},
		  {int, "当前状态", 1}],
	     desc = "设置月卡天数",
	     do =
		 fun ([CardId, Day, GainNum, Status], Role) ->
			 case month_card:gm_day(Role, CardId, Day, GainNum,
						Status)
			     of
			   {ok, NewRole} ->
			       {reply,
				util:fbin("月卡[Id:~w]天数[day:~w]设置成功",
					  [CardId, Day]),
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "基金天数",
	     args =
		 [{int, "基金id", 101}, {int, "天数", 1}, {int, "已领取", 1},
		  {int, "当前状态", 1}],
	     desc = "设置基金天数",
	     do =
		 fun ([CardId, Day, GainNum, Status], Role) ->
			 case month_fund:gm_day(Role, CardId, Day, GainNum,
						Status)
			     of
			   {ok, NewRole} ->
			       {reply,
				util:fbin("基金[Id:~w]天数[day:~w]设置成功",
					  [CardId, Day]),
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "签到天数", args = [{int, "天数", 1}],
	     desc = "设签到天数",
	     do =
		 fun ([Day], Role) ->
			 {ok, NRole} = checkin:gm_day(Role, Day),
			 {reply, util:fbin("成功设签到天数:~w", [Day]), NRole}
		 end},
     #gm_cmd{cmd = "金币市场刷新", args = [], desc = "金币市场刷新",
	     do =
		 fun ([], _Role) ->
			 Reply = market_tests:gm_gold_refresh(), {reply, Reply}
		 end},
     #gm_cmd{cmd = "金币市场重载", args = [], desc = "金币市场重载",
	     do = fun ([], _Role) -> market_gold:reload(), ok end},
     #gm_cmd{cmd = "银币市场刷新", args = [], desc = "银币市场刷新",
	     do =
		 fun ([], _Role) ->
			 Reply = market_tests:gm_silver_reset(), {reply, Reply}
		 end},
     #gm_cmd{cmd = "银币市场重载", args = [], desc = "银币市场重载",
	     do = fun ([], _Role) -> market_silver:reload(), ok end},
     #gm_cmd{cmd = "星命塔全开", args = [{int, "层数", 10}],
	     desc = "",
	     do =
		 fun ([Tower], Role) ->
			 {ok, star_tower:gm_open(Role, Tower)}
		 end},
     #gm_cmd{cmd = "重置召唤福利", args = [], desc = "",
	     do =
		 fun ([], Role) -> {ok, recruit_award:gm_ref(Role)} end},
     #gm_cmd{cmd = "重置活动转盘", args = [], desc = "",
	     do =
		 fun ([], Role) -> {ok, holiday_dial2:gm_ref(Role)} end},
     #gm_cmd{cmd = "重置联盟技能", args = [{int, "英雄职业", 0}],
	     desc = "重置联盟技能，0表示重置全部",
	     do =
		 fun ([Career], Role) ->
			 case guild_skill:gm_reset(Role, Career) of
			   {ok, NewRole} ->
			       {reply,
				"Thiết lập lại thành công kỹ năng liên "
				"minh",
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "设联盟技能", args = [{int, "英雄职业", 3}],
	     desc = "设联盟技能",
	     do =
		 fun ([Career], Role) ->
			 case guild_skill:gm_set(Role, Career) of
			   {ok, NewRole} ->
			       {reply, "Thiết lập thành công kỹ năng liên minh",
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "联盟副本击杀boss", args = [{int, "BOSSID"}],
	     desc = "",
	     do =
		 fun ([BossId], Role) ->
			 {ok, guild_dun_lib:gm_kill(Role, BossId)}
		 end},
     #gm_cmd{cmd = "联盟副本清buff", args = [], desc = "",
	     do =
		 fun ([], Role) ->
			 guild_dun:gm_ref_buff(Role),
			 {reply, "Đã thiết lập lại buff thành công"}
		 end},
     #gm_cmd{cmd = "重置七天排行", args = [], desc = "重置七天排行",
	     do =
		 fun ([], _Role) ->
			 days_rank_mgr:gm_del(0),
			 {reply,
			  "Đã thiết lập lại thành công bảng xếp "
			  "hạng bảy ngày"}
		 end},
     #gm_cmd{cmd = "远航订单重置", args = [], desc = "联盟远航订单重置",
	     do =
		 fun ([], Role) ->
			 {ok, NewRole} = guild_shipping:gm_reset(Role),
			 {reply, "Đặt lại đơn hàng thành công", NewRole}
		 end},
     #gm_cmd{cmd = "远航订单可领取", args = [], desc = "远航订单可领取",
	     do =
		 fun ([], Role) ->
			 NewRole = shipping:gm_reward(Role), {ok, NewRole}
		 end},
     #gm_cmd{cmd = "传闻测试", args = [{string, "传闻测试"}],
	     desc = "传闻测试",
	     do =
		 fun ([Msg], _Role) ->
			 notice:broadcast(rumor_left_top,
					  util:fbin("~ts", [Msg])),
			 ok
		 end},
     #gm_cmd{cmd = "远航订单刷新", args = [], desc = "联盟远航订单刷新",
	     do =
		 fun ([], Role) ->
			 {ok, NewRole} = guild_shipping:gm_ref(Role),
			 {reply, "Đã làm mới đơn hàng thành công", NewRole}
		 end},
     #gm_cmd{cmd = "七天排行提醒", args = [{int, "排行ID", 1}],
	     desc = "七天排行提醒",
	     do =
		 fun ([Id], _Role) ->
			 days_rank_mgr:early_warn(Id),
			 {reply, "Nhắc nhở xếp hạng 7 ngày thành công"}
		 end},
     #gm_cmd{cmd = "快速作战buff清除", args = [],
	     desc = "快速作战buff清除",
	     do =
		 fun ([], Role = #role{m_dungeon = MDungeon}) ->
			 NRole = Role#role{m_dungeon =
					       MDungeon#m_dungeon{buff_list =
								      []}},
			 dungeon:push_buff(NRole),
			 {reply, "Đã xóa thành công buff", NRole}
		 end},
     #gm_cmd{cmd = "设挂机时间", args = [{int, "时间", 86400}],
	     desc = "设置副本挂机时间",
	     do =
		 fun ([Time], Role) ->
			 dungeon:gm(Role, {set_hook_time, Time})
		 end},
     #gm_cmd{cmd = "快速作战buff增加", args = [],
	     desc = "快速作战buff增加",
	     do =
		 fun ([], Role) ->
			 NRole = dungeon:add_buff(Role),
			 dungeon:push_buff(NRole),
			 {reply, "Tăng buff thành công", NRole}
		 end},
     #gm_cmd{cmd = "神殿重置", args = [], desc = "重新初始化神殿信息",
	     do =
		 fun ([], _Role) -> primus_mgr:info(gm_reset), ok end},
     #gm_cmd{cmd = "设无尽关卡", args = [{int, "关卡ID", 1}],
	     desc = "无尽试炼关卡",
	     do = fun ([Id], Role) -> endless:gm(Role, Id) end},
     #gm_cmd{cmd = "无尽重新选择", args = [], desc = "无尽重新选择",
	     do = fun ([], Role) -> endless:gm_reset(Role) end},
     #gm_cmd{cmd = "设星命等级",
	     args = [{int, "套装ID", 1}, {int, "等级", 1}],
	     desc = "设星命等级",
	     do =
		 fun ([SetId, Lev], Role) ->
			 case star:gm_set_lev(Role, SetId, Lev) of
			   {ok, NewRole} ->
			       {reply, "Thiết lập thành công cấp độ sao",
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "无尽关卡奖励", args = [], desc = "无尽关卡奖励",
	     do = fun ([], _Role) -> endless_mgr:gm(), ok end},
     #gm_cmd{cmd = "无尽排行奖励",
	     args = [{int, "类型", 1}, {int, "名次", 1}],
	     desc = "无尽排行奖励",
	     do =
		 fun ([Type, Idx], Role) ->
			 endless:gm_rank(Role, Type, Idx), ok
		 end},
     #gm_cmd{cmd = "无尽合服结算", args = [], desc = "无尽合服结算",
	     do =
		 fun ([], _Role) -> endless_mgr:gm(merge_reward), ok
		 end},
     #gm_cmd{cmd = "无尽轮转", args = [{int, "类型", 1}],
	     desc = "无尽合服结算",
	     do =
		 fun ([Type], Role) -> endless:gm_type(Role, Type) end},
     #gm_cmd{cmd = "活动下一天", args = [], desc = "活动下一天",
	     do =
		 fun ([], Role = #role{m_var = MVar}) ->
			 sys_env:save(open_datetime,
				      sys_env:srv_open_time() - 86400 * 1),
			 sys_env ! init_time,
			 erlang:send_after(2000, whereis(guild_war_mgr),
					   zero_update),
			 holiday_mgr:reload(),
			 guild_rank:info(zero),
			 NRole = Role#role{m_var =
					       MVar#m_var{last_reset_time = 0,
							  last_reset_day =
							      {0, 0, 0}}},
			 global_event_listener:loop_daily_zero_hour(sys_env:get(server_type),
								    date:day_of_the_week()),
			 var:reset(NRole, zero_flush)
		 end},
     #gm_cmd{cmd = "重置召唤时间", args = [], desc = "重置召唤数据",
	     do =
		 fun ([], Role) ->
			 case recruit:gm_reset_time(Role) of
			   {ok, NewRole} ->
			       {reply, "Thiết lập lại triệu hồi thành công",
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "联盟副本双倍", args = [], desc = "联盟副本双倍",
	     do =
		 fun ([], _Role) -> guild_dun_mgr:info(double_time), ok
		 end},
     #gm_cmd{cmd = "盟主弹劾时间", args = [], desc = "盟主弹劾时间",
	     do =
		 fun ([], #role{guild_bag = #guild_bag{pid = Pid}}) ->
			 guild:apply(async, Pid,
				     {guild_handle, gm_set_leader_time, []}),
			 ok
		 end},
     #gm_cmd{cmd = "圣器过期时间",
	     args = [{int, "圣器Id", 1}, {int, "过期秒数", 60}],
	     desc = "圣器过期时间",
	     do =
		 fun ([Id, Sec], Role) ->
			 case hallows:gm_set_endtime(Role, Id, Sec) of
			   {ok, NewRole} ->
			       {reply,
				"Thiết lập thành công thời gian hết hạn "
				"của thánh vật",
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "设圣器阶数",
	     args = [{int, "圣器Id", 1}, {int, "step", 1}],
	     desc = "设圣器阶数",
	     do =
		 fun ([Id, Step], Role) ->
			 case hallows:gm_set_step(Role, Id, Step) of
			   {ok, NewRole} ->
			       {reply,
				"Thiết lập thành công cấp độ của vũ khí "
				"thánh",
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "神器精炼",
	     args = [{int, "圣器Id", 1}, {int, "step", 1}],
	     desc = "神器精炼",
	     do =
		 fun ([Id, Step], Role) ->
			 case hallows_refine:gm_refine(Role, Id, Step) of
			   {ok, NewRole} ->
			       {reply, "Thiết lập thành công Tinh chế hiện vật",
				NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "圣器重置", args = [], desc = "重置圣器信息",
	     do = fun ([], Role) -> hallows:gm(Role, {reset}) end},
     #gm_cmd{cmd = "圣器任务完成", args = [{int, "任务ID", 0}],
	     desc = "完成所有圣器任务",
	     do =
		 fun ([Id], Role) -> hallows:gm(Role, {finish_quest, Id})
		 end},
     #gm_cmd{cmd = "设圣器技能等级",
	     args = [{int, "圣器ID", 1}, {int, "技能等级", 0}],
	     desc = "设圣器技能等级",
	     do =
		 fun ([Id, Step], Role) ->
			 case hallows:gm(Role, {skill_lev_up, Id, Step}) of
			   {ok, NewRole} -> {reply, "成功技能等级", NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "七日目标全开", args = [], desc = "七日目标全开",
	     do =
		 fun ([], Role) ->
			 Role2 = day_goals:gm_open(Role), {ok, Role2}
		 end},
     #gm_cmd{cmd = "竞技场每日奖励", args = [], desc = "竞技场每日奖励",
	     do =
		 fun ([], _Role) ->
			 arena_mgr:info(daily_reward), {reply, "执行成功"}
		 end},
     #gm_cmd{cmd = "竞技场提前结算", args = [], desc = "竞技场提前结算",
	     do =
		 fun ([], _Role) ->
			 arena_mgr:info(gm_set_time), {reply, "执行成功"}
		 end},
     #gm_cmd{cmd = "重置七天跨服排行", args = [], desc = "重置七天跨服排行",
	     do =
		 fun ([], _Role) ->
			 days_rank_mgr:gm_del(1), {reply, "重置七天跨服排行"}
		 end},
     #gm_cmd{cmd = "设跨服排行天数", args = [{int, "天", 1}],
	     desc = "修改开服时间",
	     do =
		 fun ([Day], _Role) -> days_rank_mgr:gm_reset(Day), ok
		 end},
     #gm_cmd{cmd = "重置天梯时间", args = [], desc = "重置天梯时间",
	     do =
		 fun ([], Role) -> sky_ladder:gm(Role, {reset_time})
		 end},
     #gm_cmd{cmd = "天梯命令", args = [{int, "请求类型", 1}],
	     desc = "天梯命令 0每日结算 1亮眼表现",
	     do =
		 fun ([Id], Role) -> sky_ladder:gm(Role, {info, Id}), ok
		 end},
     #gm_cmd{cmd = "重置天梯点赞", args = [], desc = "重置天梯点赞",
	     do =
		 fun ([], Role) -> sky_ladder:gm(Role, {reset_worship})
		 end},
     #gm_cmd{cmd = "设防沉迷",
	     args = [{int, "状态", 2}, {int, "年龄", 18}],
	     desc = "设防沉迷状态: 0:未认证，1:未成年，2:成年",
	     do =
		 fun ([Code, Age], Role) ->
			 case lists:member(Code, [2, 1, 0]) of
			   true ->
			       NRole = role_auth:set_adult(Role, Code),
			       {ok, NewRole} = role_auth:set_timer(NRole,
								   login),
			       {reply, "设置成功", NewRole};
			   _ -> {reply, "设置状态有误"}
			 end
		 end},
     #gm_cmd{cmd = "防沉迷窗口", args = [{int, "类型", 1}],
	     desc = "防沉迷窗口",
	     do =
		 fun ([Code], Role) -> role_auth:gm_apply(Role, Code)
		 end},
     #gm_cmd{cmd = "下个在线福利", args = [], desc = "下个在线福利",
	     do =
		 fun ([], Role) -> misc:gm(Role, {next_reward}) end},
     #gm_cmd{cmd = "远征下一关", args = [],
	     do =
		 fun ([], Role) -> expedition:gm(Role, {next_guard})
		 end},
     #gm_cmd{cmd = "机器人生成",
	     args =
		 [{int, "机器人ID", 10000}, {int, "属性修正下限", 1000},
		  {int, "属性修正上限", 1000}],
	     do =
		 fun ([Id, MinRatio, MaxRatio],
		      Role = #role{arena_max_power = MaxPower1,
				   max_power = MaxPower2,
				   partner_bag =
				       #partner_bag{partner_list =
							PartnerList}}) ->
			 PowerRatio = util:rand(MinRatio, MaxRatio),
			 MaxPower = max(MaxPower1, MaxPower2),
			 Power = round(MaxPower * PowerRatio / 1000),
			 MaxNum = min(5, length(PartnerList)),
			 AvgPower = Power div MaxNum,
			 #{partners := Partners} = robot:get(Role, Id,
							     #{max_num =>
								   MaxNum,
							       power =>
								   AvgPower}),
			 Fun = fun (#partner{bid = Bid,
					     all_attr =
						 #attr{atk = Atk,
						       hp_max = HpMax,
						       def = Def,
						       speed = Speed},
					     power = ParPower, star = Star,
					     lev = Lev},
				    Acc) ->
				       Msg =
					   util:fbin(lang:get(<<"【英雄:~ts 攻:~w 血:~w 防:~w 速:~w 战力:~w 星级:~w "
								"等级:~w】\n"/utf8>>),
						     [(partner_data:get_base(Bid))#partner_base_data.name,
						      Atk, HpMax, Def, Speed,
						      ParPower, Star, Lev]),
				       case Acc of
					 <<>> -> Msg;
					 _ -> <<Acc/binary, Msg/binary>>
				       end
			       end,
			 PtnMsg = lists:foldl(Fun, <<>>, Partners),
			 {reply, util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg])}
		 end},
     #gm_cmd{cmd = "上传问卷答案", args = [],
	     do =
		 fun ([], Role) ->
			 questionnaire:sumbit(Role,
					      [{111, 4, <<51, 51, 51>>},
					       {110, 4, <<51, 51, 51>>},
					       {109, 1, <<68>>},
					       {108, 1, <<68>>},
					       {107, 1, <<66>>},
					       {106, 3, <<67>>},
					       {105, 1, <<68>>},
					       {104, 1, <<68>>},
					       {103, 1, <<67>>},
					       {102, 1, <<67>>},
					       {101, 3, <<68>>},
					       {100, 3, <<68>>},
					       {99, 1, <<68>>}, {98, 1, <<68>>},
					       {97, 1, <<68>>}])
		 end},
     #gm_cmd{cmd = "天梯赛开启状态", args = [{int, "状态", 1}],
	     do =
		 fun ([Status], Role) ->
			 sky_ladder:gm(Role, {open, Status})
		 end},
     #gm_cmd{cmd = "清空录像", args = [], desc = "清空录像",
	     do =
		 fun ([], _Role) -> replay_hall_mgr:info(gm_clear), ok
		 end},
     #gm_cmd{cmd = "删除公会日志",
	     args = [{int, "状态", 1}, {int, "状态", 1}],
	     desc = "删除公会日志",
	     do =
		 fun ([StartNum, Num], Role) ->
			 guild_handle:del_guild_log(Role, StartNum, Num), ok
		 end},
     #gm_cmd{cmd = "打机器人", args = [{int, "机器人ID", 10000}],
	     desc = "打机器人",
	     do =
		 fun ([RobotId], Role) ->
			 robot:start_combat(Role, RobotId), ok
		 end},
     #gm_cmd{cmd = "远航刷新测试", args = [{int, "测试数量", 10000}],
	     do =
		 fun ([Num], Role) ->
			 {BidLT, QualityLT} = shipping:gm_test_refresh(Role,
								       Num,
								       {[],
									[]}),
			 BidL = lists:keysort(2, BidLT),
			 QualityL = lists:keysort(2, QualityLT),
			 BidSum = lists:sum([Num1 || {_, Num1} <- BidL]),
			 QualitySum = lists:sum([Num2
						 || {_, Num2} <- QualityL]),
			 Fun = fun ({Bid, Num3}, {AccMsg, Acc}) ->
				       Msg =
					   util:fbin(lang:get(<<"Bid：~w  数量:~w  比率:~w% \n"/utf8>>),
						     [Bid, Num3,
						      util:round(Num3 / Acc *
								   1000)
							/ 10]),
				       {<<AccMsg/binary, Msg/binary>>, Acc}
			       end,
			 {PtnMsg1, _} = lists:foldl(Fun, {<<>>, BidSum}, BidL),
			 {PtnMsg2, _} = lists:foldl(Fun, {<<>>, QualitySum},
						    QualityL),
			 PtnMsg = <<"订单ID比率:\n"/utf8, PtnMsg1/binary,
				    "品质比率:\n"/utf8, PtnMsg2/binary>>,
			 {reply, util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg])}
		 end},
     #gm_cmd{cmd = "特权礼包时间",
	     args =
		 [{int, "礼包ID", 101}, {int, "过期时间", 86400},
		  {int, "特权类型", 1}],
	     desc = "特权礼包时间",
	     do =
		 fun ([Id, Time, Type], Role) ->
			 NRole = privilege:gm_set_time(Role, Id, Time, Type),
			 {reply, "修改成功", NRole}
		 end},
     #gm_cmd{cmd = "活动召唤测试",
	     args =
		 [{int, "测试数量", 100}, {int, "测试类型", 10},
		  {int, "活动ID", 14012}],
	     do =
		 fun ([Num, Times, CampId], Role) ->
			 case recruit_holiday:gm_test_refresh(Role, CampId,
							      Times, Num, [])
			     of
			   {false, Msg} -> {reply, Msg};
			   {NRole, BidLT} ->
			       BidL = lists:keysort(1, BidLT),
			       BidSum = lists:sum([Num1 || {_, Num1} <- BidL]),
			       Fun = fun ({Bid, Num3}, {AccMsg, Acc}) ->
					     Msg =
						 util:fbin(lang:get(<<"id：~w  数量:~w  比率:~w% \n"/utf8>>),
							   [Bid, Num3,
							    util:round(Num3 /
									 Acc
									 * 1000)
							      / 10]),
					     {<<AccMsg/binary, Msg/binary>>,
					      Acc}
				     end,
			       {PtnMsg1, _} = lists:foldl(Fun, {<<>>, BidSum},
							  BidL),
			       PtnMsg = <<"物品ID比率:\n"/utf8, PtnMsg1/binary>>,
			       {reply,
				util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg]),
				NRole}
			 end
		 end},
     #gm_cmd{cmd = "精灵抽奖测试",
	     args = [{int, "测试数量", 100}, {int, "测试类型", 10}],
	     do =
		 fun ([Num, Times], Role) ->
			 case sprite_lottery:gm_test_refresh(Role, Times, Num,
							     [])
			     of
			   {false, Msg} -> {reply, Msg};
			   {NRole, BidLT} ->
			       BidL = lists:keysort(1, BidLT),
			       BidSum = lists:sum([Num1 || {_, Num1} <- BidL]),
			       Fun = fun ({Bid, Num3}, {AccMsg, Acc}) ->
					     Msg =
						 util:fbin(lang:get(<<"id：~w  数量:~w  比率:~w% \n"/utf8>>),
							   [Bid, Num3,
							    util:round(Num3 /
									 Acc
									 * 1000)
							      / 10]),
					     {<<AccMsg/binary, Msg/binary>>,
					      Acc}
				     end,
			       {PtnMsg1, _} = lists:foldl(Fun, {<<>>, BidSum},
							  BidL),
			       PtnMsg = <<"物品ID比率:\n"/utf8, PtnMsg1/binary>>,
			       {reply,
				util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg]),
				NRole}
			 end
		 end},
     #gm_cmd{cmd = "活动精英召唤测试",
	     args =
		 [{int, "测试数量", 100}, {int, "测试类型", 10},
		  {int, "活动ID", 14012}],
	     do =
		 fun ([Num, Times, CampId], Role) ->
			 case recruit_holiday_elite:gm_test_refresh(Role,
								    CampId,
								    Times, Num,
								    [])
			     of
			   {false, Msg} -> {reply, Msg};
			   {NRole, BidLT} ->
			       BidL = lists:keysort(1, BidLT),
			       BidSum = lists:sum([Num1 || {_, Num1} <- BidL]),
			       Fun = fun ({Bid, Num3}, {AccMsg, Acc}) ->
					     Msg =
						 util:fbin(lang:get(<<"id：~w  数量:~w  比率:~w% \n"/utf8>>),
							   [Bid, Num3,
							    util:round(Num3 /
									 Acc
									 * 1000)
							      / 10]),
					     {<<AccMsg/binary, Msg/binary>>,
					      Acc}
				     end,
			       {PtnMsg1, _} = lists:foldl(Fun, {<<>>, BidSum},
							  BidL),
			       PtnMsg = <<"物品ID比率:\n"/utf8, PtnMsg1/binary>>,
			       {reply,
				util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg]),
				NRole}
			 end
		 end},
     #gm_cmd{cmd = "活动自选英雄召唤测试",
	     args =
		 [{int, "测试数量", 100}, {int, "测试类型", 10},
		  {int, "活动ID", 14012}],
	     do =
		 fun ([Num, Times, CampId], Role) ->
			 case recruit_holiday_lucky:gm_test_refresh(Role,
								    CampId,
								    Times, Num,
								    [])
			     of
			   {false, Msg} -> {reply, Msg};
			   {NRole, BidLT} ->
			       BidL = lists:keysort(1, BidLT),
			       BidSum = lists:sum([Num1 || {_, Num1} <- BidL]),
			       Fun = fun ({Bid, Num3}, {AccMsg, Acc}) ->
					     Msg =
						 util:fbin(lang:get(<<"id：~w  数量:~w  比率:~w% \n"/utf8>>),
							   [Bid, Num3,
							    util:round(Num3 /
									 Acc
									 * 1000)
							      / 10]),
					     {<<AccMsg/binary, Msg/binary>>,
					      Acc}
				     end,
			       {PtnMsg1, _} = lists:foldl(Fun, {<<>>, BidSum},
							  BidL),
			       PtnMsg = <<"物品ID比率:\n"/utf8, PtnMsg1/binary>>,
			       {reply,
				util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg]),
				NRole}
			 end
		 end},
     #gm_cmd{cmd = "精英赛下阶段", args = [], desc = "精英赛下阶段",
	     do =
		 fun ([], Role) ->
			 case cluster_lib:center_node() ==
				big_world_lib:center_node()
			     of
			   true ->
			       big_world_lib:cast(center, gen_fsm, send_event,
						  [c_arena_elite_mgr, timeout]);
			   _ ->
			       big_world_lib:cast(center, gen_fsm, send_event,
						  [c_arena_elite_mgr, timeout]),
			       cluster_lib:cast(center, gen_fsm, send_event,
						[c_arena_elite_mgr, timeout])
			 end,
			 notice:broadcast(sys_top,
					  util:fbin("~ts设置了精英赛下阶段",
						    [color:format({role,
								   Role#role.name})])),
			 ok
		 end},
     #gm_cmd{cmd = "获取周报数据", args = [],
	     do =
		 fun ([], Role = #role{id = RoleId}) ->
			 case role_weekly_lib:gm_get_weekly_data(RoleId) of
			   {false, Msg} -> {reply, Msg};
			   Record = {StartTime, EndTime, FaceId, Name, Lev,
				     Power, TagList, MaxStarPartners,
				     MostUsedPartners, GetPartnersNum, RankList,
				     GetGold, GetHigh, GetCrystal, LoginDay,
				     AveTime, ExpireTime, Flag} ->
			       {reply,
				util:fbin(lang:get(<<"本周期开始时间：~w，结束时间：~w，角色头像Id：~w，角色名：~w, "
						     "角色等级：~w，战力：~w，标签库：~w，最大星级的5个伙伴：~w，最常使用的英雄：~w，"
						     "获取五星英雄数；~w，玩法排名：~w，获取钻石：~w，获取高级召唤券：~w，获取水晶：~w"
						     "，登录天数：~w，平均时长：~w，过期时间：~w，是否官方包：~w，"/utf8>>),
					  [StartTime, EndTime, FaceId,
					   util:cn(Name), Lev, Power, TagList,
					   MaxStarPartners, MostUsedPartners,
					   GetPartnersNum, RankList, GetGold,
					   GetHigh, GetCrystal, LoginDay,
					   AveTime, ExpireTime, Flag]),
				Role}
			 end
		 end},
     #gm_cmd{cmd = "精英赛开战", args = [], desc = "精英赛开战",
	     do =
		 fun ([], Role) ->
			 arena_elite_mgr:m(),
			 notice:broadcast(sys_top,
					  util:fbin("~ts设置了精英赛开战/休息",
						    [color:format({role,
								   Role#role.name})])),
			 ok
		 end},
     #gm_cmd{cmd = "精英赛重置", args = [], desc = "精英赛重置",
	     do =
		 fun ([], Role) ->
			 big_world_lib:cast(center, c_arena_elite_mgr, clean,
					    []),
			 notice:broadcast(sys_top,
					  util:fbin("~ts清空重置了精英赛",
						    [color:format({role,
								   Role#role.name})])),
			 ok
		 end},
     #gm_cmd{cmd = "精英赛加载机器人", args = [], desc = "精英赛加载机器人",
	     do =
		 fun ([], Role) ->
			 big_world_lib:cast(center, c_arena_elite_mgr,
					    add_robot, []),
			 notice:broadcast(sys_top,
					  util:fbin("~ts操作精英赛加载机器人",
						    [color:format({role,
								   Role#role.name})])),
			 ok
		 end},
     #gm_cmd{cmd = "精英赛计算战力", args = [], desc = "精英赛计算战力",
	     do =
		 fun ([], Role) ->
			 big_world_lib:cast(center, c_arena_elite_mgr,
					    update_match_power, []),
			 notice:broadcast(sys_top,
					  util:fbin("~ts操作精英赛计算战力",
						    [color:format({role,
								   Role#role.name})])),
			 ok
		 end},
     #gm_cmd{cmd = "设精英赛等级", args = [{int, "精英赛段位等级", 20}],
	     desc = "设精英赛等级",
	     do =
		 fun ([Lev], Role) ->
			 Role2 = arena_elite_lib:gm_set_lev(Role, Lev),
			 {ok, Role2}
		 end},
     #gm_cmd{cmd = "设精英赛积分", args = [{int, "精英赛段位积分", 1}],
	     desc = "设精英赛积分",
	     do =
		 fun ([Score], Role) ->
			 Role2 = arena_elite_lib:gm_set_score(Role, Score),
			 {ok, Role2}
		 end},
     #gm_cmd{cmd = "精英赛同步排行", args = [], desc = "精英赛同步排行",
	     do =
		 fun ([], _Role) ->
			 arena_elite_mgr:info(sync_rank_data), ok
		 end},
     #gm_cmd{cmd = "邀请人数",
	     args = [{int, "ID", 1}, {int, "数量", 1}],
	     desc = "设置邀请数量",
	     do =
		 fun ([Id, Num], Role) ->
			 invite_code:gm(Role, {set_num, Id, Num})
		 end},
     #gm_cmd{cmd = "幻化解锁", args = [{int, "ID", 1}],
	     desc = "神器幻化解锁",
	     do =
		 fun ([Id], Role) -> hallows_look:gm(Role, {open, Id})
		 end},
     #gm_cmd{cmd = "设世界等级", args = [{int, "等级"}],
	     desc = "设置世界等级",
	     do =
		 fun ([NewWorldLev], _Role) ->
			 sys_env:set(world_lev, NewWorldLev),
			 cluster_dynamic_group:sync_world_lev(),
			 role_group:pack_send(world, 10905,
					      {world_lev:get_world_lev()}),
			 {reply,
			  util:fbin(lang:get(<<"world_lev=~w"/utf8>>),
				    [world_lev:get_world_lev()])}
		 end},
     #gm_cmd{cmd = "设神装引导世界等级", args = [],
	     desc = "设神装引导世界等级",
	     do =
		 fun ([], _Role) -> world_lev:info(gm_set_lev), ok end},
     #gm_cmd{cmd = "元素圣殿重置", args = [],
	     do =
		 fun ([],
		      Role = #role{m_element_temple = MElementTemple}) ->
			 element_temple_mgr:info(reset),
			 NRole = Role#role{m_element_temple =
					       MElementTemple#m_element_temple{combat_list
										   =
										   []}},
			 element_temple:push_base(NRole),
			 {reply, lang:get(<<"重置成功而"/utf8>>), NRole}
		 end},
     #gm_cmd{cmd = "清空动态跨服", args = [], desc = "清空动态跨服",
	     do =
		 fun ([], _Role) ->
			 cluster_lib:cast(center, c_cluster_dynamic_group, info,
					  [gm_clear]),
			 {reply, lang:get(<<"清空成功"/utf8>>)}
		 end},
     #gm_cmd{cmd = "重置动态跨服", args = [], desc = "重置动态跨服",
	     do =
		 fun ([], _Role) ->
			 cluster_lib:cast(center, c_cluster_dynamic_group, info,
					  [reset]),
			 {reply, lang:get(<<"清空成功"/utf8>>)}
		 end},
     #gm_cmd{cmd = "星河神殿进化",
	     args = [{int, "位置", 1}, {int, "挑战次数", 1}],
	     desc = "星河神殿进化",
	     do =
		 fun ([Pos, Num], _Role) ->
			 primus_mgr:info({gm_uplev, Pos, Num}), ok
		 end},
     #gm_cmd{cmd = "圣物等级",
	     args = [{int, "ID", 1}, {int, "等级", 1}],
	     desc = "设置圣物等级",
	     do =
		 fun ([Id, Lev], Role) ->
			 halidom:gm(Role, {set_lev, Id, Lev})
		 end},
     #gm_cmd{cmd = "圣物进阶",
	     args = [{int, "ID", 1}, {int, "阶数", 1}],
	     desc = "设置圣物阶数",
	     do =
		 fun ([Id, Step], Role) ->
			 halidom:gm(Role, {set_step, Id, Step})
		 end},
     #gm_cmd{cmd = "砸蛋测试", args = [{int, "测试数量", 100}],
	     do =
		 fun ([Num], Role) ->
			 case holiday_break_egg:gm_test_refresh(Role, Num, [])
			     of
			   {false, Msg} -> {reply, Msg};
			   {NRole, BidLT} ->
			       BidL = lists:keysort(2, BidLT),
			       BidSum = lists:sum([Num1 || {_, Num1} <- BidL]),
			       Fun = fun ({Bid, Num3}, {AccMsg, Acc}) ->
					     Msg =
						 util:fbin(lang:get(<<"id：~w  数量:~w  比率:~w% \n"/utf8>>),
							   [Bid, Num3,
							    util:round(Num3 /
									 Acc
									 * 1000)
							      / 10]),
					     {<<AccMsg/binary, Msg/binary>>,
					      Acc}
				     end,
			       {PtnMsg1, _} = lists:foldl(Fun, {<<>>, BidSum},
							  BidL),
			       PtnMsg = <<"物品ID比率:\n"/utf8, PtnMsg1/binary>>,
			       {reply,
				util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg]),
				NRole}
			 end
		 end},
     #gm_cmd{cmd = "清空砸蛋限制", args = [],
	     do =
		 fun ([], Role) ->
			 case holiday_lib:get_open_holiday(Role, 93024) of
			   #holiday{camp_id = CampId} ->
			       sys_env:del({holiday_break_egg_mgr, CampId}),
			       EggTypeL = holiday_break_egg:init_egg_type(),
			       NRole = Role#role{m_break_egg =
						     #m_break_egg{camp_id =
								      CampId,
								  egg_type =
								      EggTypeL}},
			       {reply, lang:get(<<"清空成功"/utf8>>), NRole};
			   _ -> {reply, lang:get(<<"活动未开启"/utf8>>)}
			 end
		 end},
     #gm_cmd{cmd = "匹配仓检ID", args = [], desc = "匹配仓检ID",
	     do =
		 fun ([], Role) ->
			 List = personal_push_gift:gm_warehouse_check(Role),
			 Fun = fun (Id, AccMsg) ->
				       Msg =
					   util:fbin(lang:get(<<"id：~w \n"/utf8>>),
						     [Id]),
				       <<AccMsg/binary, Msg/binary>>
			       end,
			 RtnMsg = lists:foldl(Fun, <<>>, List),
			 {reply,
			  util:fbin(lang:get(<<"匹配仓检id:\n~ts"/utf8>>),
				    [RtnMsg])}
		 end},
     #gm_cmd{cmd = "重置RFM礼包", args = [], desc = "重置RFM礼包",
	     do =
		 fun ([], Role) ->
			 {ok, NRole} = personal_push_gift:gm_reset(Role),
			 {reply, lang:get(<<"重置成功"/utf8>>), NRole}
		 end},
     #gm_cmd{cmd = "设置RFM",
	     args =
		 [{int, "最近一次充值距今秒数", 1}, {int, "15天内次数", 1},
		  {int, "15天内金额", 1}],
	     desc = "设置RFM",
	     do =
		 fun ([Time, Count, Money], Role) ->
			 {ok, NRole} = personal_push_gift:gm_set_rfm(Role, Time,
								     Count,
								     Money),
			 {reply, lang:get(<<"设置成功"/utf8>>), NRole}
		 end},
     #gm_cmd{cmd = "查看当前RFM", args = [], desc = "查看当前RFM",
	     do =
		 fun ([], Role) ->
			 [RecncyScore, FrequencyScore, MonetaryScore] =
			     personal_push_gift:gm_get_rfm(Role),
			 {reply,
			  util:fbin(lang:get(<<"R:~w, F:~w, M:~w"/utf8>>),
				    [RecncyScore, FrequencyScore,
				     MonetaryScore])}
		 end},
     #gm_cmd{cmd = "激活RFM礼包", args = [{int, "礼包id", 1}],
	     desc = "激活RFM礼包",
	     do =
		 fun ([Id], Role) ->
			 case personal_push_gift:gm_fire_gift(Role, Id) of
			   {ok, NRole} ->
			       {reply, lang:get(<<"激活成功"/utf8>>), NRole};
			   {false, Msg} -> {reply, Msg};
			   _ -> {reply, lang:get(<<"激活失败"/utf8>>)}
			 end
		 end},
     #gm_cmd{cmd = "神装副本3星通关",
	     args =
		 [{int, "通关星数", 3}, {int, "章节id", 1}, {int, "关卡id", 1}],
	     do =
		 fun ([Star, ChapterId, DunId], Role) ->
			 {ok, NRole} =
			     dungeon_heaven_lib:gm_open_full_star(Role, Star,
								  ChapterId,
								  DunId),
			 {reply, lang:get(<<"设置成功"/utf8>>), NRole}
		 end},
     #gm_cmd{cmd = "杂货店限购重置", args = [],
	     do =
		 fun ([], Role) ->
			 holiday_groupon:exchange_clean_buy(all),
			 {reply, lang:get(<<"设置成功"/utf8>>)}
		 end},
     #gm_cmd{cmd = "神装抽奖测试",
	     args =
		 [{int, "测试数量", 100}, {int, "测试类型", 10},
		  {int, "石像ID", 1}, {int, "物品ID", 0}],
	     do =
		 fun ([Num, Times, GroupId, ItemBid], Role) ->
			 case holy_eqm_lottery:gm_test_refresh(Role, GroupId,
							       Times, Num,
							       {[], []})
			     of
			   {false, Msg} -> {reply, Msg};
			   {NRole, {BidLT, ClassLT}} ->
			       BidL = lists:keysort(2, BidLT),
			       BidSum = lists:sum([Num1 || {_, Num1} <- BidL]),
			       ClassSum = lists:sum([Num2
						     || {_, Num2} <- ClassLT]),
			       Fun = fun ({Bid, Num3}, {AccMsg, Acc}) ->
					     Msg =
						 util:fbin(lang:get(<<"id：~w  数量:~w  比率:~w% \n"/utf8>>),
							   [Bid, Num3,
							    util:round(Num3 /
									 Acc
									 * 1000)
							      / 10]),
					     {<<AccMsg/binary, Msg/binary>>,
					      Acc}
				     end,
			       BidNum = case lists:keyfind(ItemBid, 1, BidLT) of
					  {_, BidNumT} -> BidNumT;
					  _ -> 0
					end,
			       PtnMsg1 = <<>>,
			       {PtnMsg2, _} = lists:foldl(Fun, {<<>>, ClassSum},
							  ClassLT),
			       PtnMsg = <<"物品ID比率:\n"/utf8, PtnMsg1/binary,
					  "库比率:\n"/utf8, PtnMsg2/binary>>,
			       {reply,
				util:fbin(lang:get(<<"~ts,\n 物品:~w 出现了~w"/utf8>>),
					  [PtnMsg, ItemBid, BidNum]),
				NRole}
			 end
		 end},
     #gm_cmd{cmd = "召唤测试",
	     args =
		 [{int, "测试数量", 100}, {int, "测试类型", 10},
		  {int, "组ID", 100}],
	     do =
		 fun ([Num, Times, GroupId], Role) ->
			 case recruit:gm_test_refresh(Role, GroupId, Times, Num,
						      {[], []})
			     of
			   {false, Msg} -> {reply, Msg};
			   {NRole, {BidLT, ClassLT}} ->
			       BidL = lists:keysort(2, BidLT),
			       BidSum = lists:sum([Num1 || {_, Num1} <- BidL]),
			       ClassSum = lists:sum([Num2
						     || {_, Num2} <- ClassLT]),
			       Fun = fun ({Bid, Num3}, {AccMsg, Acc}) ->
					     Msg =
						 util:fbin(lang:get(<<"id：~w  数量:~w  比率:~w% \n"/utf8>>),
							   [Bid, Num3,
							    util:round(Num3 /
									 Acc
									 * 1000)
							      / 10]),
					     {<<AccMsg/binary, Msg/binary>>,
					      Acc}
				     end,
			       {PtnMsg1, _} = lists:foldl(Fun, {<<>>, BidSum},
							  BidL),
			       {PtnMsg2, _} = lists:foldl(Fun, {<<>>, ClassSum},
							  ClassLT),
			       PtnMsg = <<"物品ID比率:\n"/utf8, PtnMsg1/binary,
					  "库比率:\n"/utf8, PtnMsg2/binary>>,
			       {reply,
				util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg]),
				NRole}
			 end
		 end},
     #gm_cmd{cmd = "先知测试",
	     args = [{int, "测试数量", 100}, {int, "组ID", 100}],
	     do =
		 fun ([Num, GroupId], Role) ->
			 case recruit_high:gm_test_refresh(Role, GroupId, 1,
							   Num, {[], []})
			     of
			   {false, Msg} -> {reply, Msg};
			   {NRole, {BidLT, ClassLT}} ->
			       BidL = lists:keysort(2, BidLT),
			       BidSum = lists:sum([Num1 || {_, Num1} <- BidL]),
			       ClassSum = lists:sum([Num2
						     || {_, Num2} <- ClassLT]),
			       Fun = fun ({Bid, Num3}, {AccMsg, Acc}) ->
					     Msg =
						 util:fbin(lang:get(<<"id：~w  数量:~w  比率:~w% \n"/utf8>>),
							   [Bid, Num3,
							    util:round(Num3 /
									 Acc
									 * 1000)
							      / 10]),
					     {<<AccMsg/binary, Msg/binary>>,
					      Acc}
				     end,
			       {PtnMsg1, _} = lists:foldl(Fun, {<<>>, BidSum},
							  BidL),
			       {PtnMsg2, _} = lists:foldl(Fun, {<<>>, ClassSum},
							  ClassLT),
			       PtnMsg = <<"物品ID比率:\n"/utf8, PtnMsg1/binary,
					  "库比率:\n"/utf8, PtnMsg2/binary>>,
			       {reply,
				util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg]),
				NRole}
			 end
		 end},
     #gm_cmd{cmd = "置换测试",
	     args = [{int, "伙伴ID", 10401}, {int, "次数", 100}],
	     do =
		 fun ([PBid, Num], Role) ->
			 case recruit_convert:gm_test_refresh(Role, PBid, Num,
							      {[], []})
			     of
			   {false, Msg} -> {reply, Msg};
			   {NRole, {BidLT, ClassLT}} ->
			       BidL = lists:keysort(2, BidLT),
			       BidSum = lists:sum([Num1 || {_, Num1} <- BidL]),
			       ClassSum = lists:sum([Num2
						     || {_, Num2} <- ClassLT]),
			       Fun = fun ({Bid, Num3}, {AccMsg, Acc}) ->
					     Msg =
						 util:fbin(lang:get(<<"id：~w  数量:~w  比率:~w% \n"/utf8>>),
							   [Bid, Num3,
							    util:round(Num3 /
									 Acc
									 * 1000)
							      / 10]),
					     {<<AccMsg/binary, Msg/binary>>,
					      Acc}
				     end,
			       {PtnMsg1, _} = lists:foldl(Fun, {<<>>, BidSum},
							  BidL),
			       PtnMsg = <<"伙伴ID比率:\n"/utf8, PtnMsg1/binary>>,
			       {reply,
				util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg]),
				NRole}
			 end
		 end},
     #gm_cmd{cmd = "活动boss重置", args = [],
	     do =
		 fun ([], Role) ->
			 NRole = holiday_boss:gm_ref(Role),
			 {reply, lang:get(<<"活动boss重置成功"/utf8>>), NRole}
		 end},
     #gm_cmd{cmd = "战令重载", args = [],
	     do =
		 fun ([], Role) ->
			 {ok, NRole} = holiday_war_order:gm_reload(Role),
			 {reply, lang:get(<<"战令重置成功"/utf8>>), NRole}
		 end},
     #gm_cmd{cmd = "新春福袋轮次", args = [{int, "次数", 1}],
	     do =
		 fun ([Round],
		      Role = #role{m_holiday_optional_lottery =
				       MH = #m_holiday_optional_lottery{}}) ->
			 MaxRound =
			     holiday_optional_lottery_data:get_const(max_round),
			 NRole = Role#role{m_holiday_optional_lottery =
					       MH#m_holiday_optional_lottery{round
										 =
										 min(MaxRound,
										     Round)}},
			 holiday_optional_lottery:push_base_info(NRole),
			 {ok, NRole}
		 end},
     #gm_cmd{cmd = "周卡前一天", args = [], desc = "周卡前一天",
	     do = fun ([], Role) -> week_card:gm_before(Role) end},
     #gm_cmd{cmd = "皮肤过期", args = [{int, "皮肤ID", 101}],
	     desc = "皮肤过期",
	     do =
		 fun ([SkinId], Role) ->
			 NRole = partner_skin:gm_time_out(Role, SkinId),
			 {reply, lang:get(<<"皮肤过期成功"/utf8>>), NRole}
		 end},
     #gm_cmd{cmd = "登陆0点更新", args = [], desc = "进入一次0点更新",
	     do =
		 fun ([], Role = #role{m_var = MVar}) ->
			 NRole = Role#role{m_var =
					       MVar#m_var{last_reset_time = 0,
							  last_reset_day =
							      {0, 0, 0}}},
			 util:set_timer(delay_kick_out, 1,
					{stop, normal,
					 lang:get(<<"模拟登陆0点更新"/utf8>>)}),
			 {ok, NRole}
		 end},
     #gm_cmd{cmd = "跨服竞技开启", args = [{int, "状态", 1}],
	     do =
		 fun ([Status], Role) ->
			 arena_cluster_mgr:gm(Role, {open, Status})
		 end},
     #gm_cmd{cmd = "勇者夺宝下阶段", args = [], desc = "勇者夺宝下阶段",
	     do =
		 fun ([], _Role) ->
			 big_world_lib:cast(center, c_holiday_snatch_mgr, m,
					    []),
			 {reply, lang:get(<<"设置成功"/utf8>>)}
		 end},
     #gm_cmd{cmd = "粉丝排行结算", args = [], desc = "粉丝排行结算",
	     do =
		 fun ([], _Role) ->
			 role_room_mgr:info(room_fans_rank_award),
			 {reply, lang:get(<<"粉丝排行结算成功"/utf8>>)}
		 end},
     #gm_cmd{cmd = "设试炼之境难度",
	     args = [{int, "轮次", 1}, {int, "难度", 1}, {int, "关卡", 1}],
	     desc = "设试炼之境难度",
	     do =
		 fun ([Round, Difficulty, OrderId], Role) ->
			 holiday_boss_new:gm_set_round(Role, Round, Difficulty,
						       OrderId)
		 end},
     #gm_cmd{cmd = "成长记录", args = [{int, "任务ID", 1}],
	     desc = "成长记录",
	     do =
		 fun ([Id], Role) -> room_grow:gm_set_log(Role, Id) end},
     #gm_cmd{cmd = "初始成长之路", args = [], desc = "初始成长之路",
	     do = fun ([], Role) -> room_grow:gm_init(Role) end},
     #gm_cmd{cmd = "回归人数",
	     args = [{int, "ID", 1}, {int, "数量", 1}],
	     desc = "设置邀请数量",
	     do =
		 fun ([Id, Num], Role) ->
			 invite_code_return:gm(Role, {set_num, Id, Num})
		 end},
     #gm_cmd{cmd = "宠物出行", args = [], desc = "宠物出行",
	     do =
		 fun ([], Role) ->
			 case home_pet_lib:gm_do_out(Role) of
			   {false, Msg} -> {reply, Msg};
			   {ok, Role2} -> {reply, "宠物出行成功", Role2}
			 end
		 end},
     #gm_cmd{cmd = "宠物回家", args = [], desc = "宠物回家",
	     do =
		 fun ([], Role) ->
			 case home_pet_lib:gm_go_home(Role) of
			   {false, Msg} -> {reply, Msg};
			   {ok, Role2} -> {reply, "宠物回家成功", Role2}
			 end
		 end},
     #gm_cmd{cmd = "宠物解锁", args = [], desc = "宠物解锁",
	     do =
		 fun ([], Role) ->
			 {ok, NRole} = home_pet_lib:gm_fire_open(Role),
			 {reply, "宠物解锁成功", NRole}
		 end},
     #gm_cmd{cmd = "宠物恢复精力", args = [{int, "值", 100}],
	     desc = "宠物恢复精力",
	     do =
		 fun ([Val], Role) ->
			 NRole = home_pet_lib:gm_set_vigor(Role, Val),
			 {reply, "宠物恢复精力成功 ", NRole}
		 end},
     #gm_cmd{cmd = "家园重置", args = [], desc = "家园重置",
	     do =
		 fun ([], Role) ->
			 {ok, NRole} = home_lib:gm_reset(Role),
			 {reply, "家园重置", NRole}
		 end},
     #gm_cmd{cmd = "联盟副本通关章节", args = [{int, "章节ID", 1}],
	     desc = "",
	     do =
		 fun ([Id], Role) ->
			 {ok, guild_dun_lib:gm_pass(Role, 1, Id)}
		 end},
     #gm_cmd{cmd = "设家园挂机时间", args = [{int, "小时", 1}],
	     desc = "",
	     do =
		 fun ([Hour], Role) ->
			 {ok, NRole} = home:gm_set_hook_time(Role, Hour),
			 home:push_change_data(NRole),
			 {ok, NRole}
		 end},
     #gm_cmd{cmd = "宠物出行测试",
	     args =
		 [{int, "食物id", 100}, {int, "道具id", 0}, {int, "次数", 1}],
	     do =
		 fun ([FoodId, ItemId, Count], Role) ->
			 PtnMsg = home_pet_evt:gm_home_pet_test(Role, FoodId,
								ItemId, Count,
								<<>>),
			 {reply, util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg])}
		 end},
     #gm_cmd{cmd = "随机商店刷新测试",
	     args = [{int, "测试数量", 10000}, {type, "商店类型", 43}],
	     do =
		 fun ([Num, Type], Role) ->
			 {BidLT, QualityLT} = exchange:gm_test_refresh(Role,
								       Type,
								       Num,
								       {[],
									[]}),
			 BidL = lists:keysort(2, BidLT),
			 QualityL = lists:keysort(2, QualityLT),
			 BidSum = lists:sum([Num1 || {_, Num1} <- BidL]),
			 QualitySum = lists:sum([Num2
						 || {_, Num2} <- QualityL]),
			 Fun = fun ({Bid, Num3}, {AccMsg, Acc}) ->
				       Msg =
					   util:fbin(lang:get(<<"id：~w  数量:~w  比率:~w% \n"/utf8>>),
						     [Bid, Num3,
						      util:round(Num3 / Acc *
								   1000)
							/ 10]),
				       {<<AccMsg/binary, Msg/binary>>, Acc}
			       end,
			 {PtnMsg1, _} = lists:foldl(Fun, {<<>>, BidSum}, BidL),
			 {PtnMsg2, _} = lists:foldl(Fun, {<<>>, QualitySum},
						    QualityL),
			 PtnMsg = <<"物品ID比率:\n"/utf8, PtnMsg1/binary,
				    "库比率:\n"/utf8, PtnMsg2/binary>>,
			 {reply, util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg])}
		 end},
     #gm_cmd{cmd = "清除冷却时间", args = [{int, "层数ID", 10}],
	     do =
		 fun ([Floor], Role) ->
			 adventure:gm(Role, {clear_time, Floor}),
			 {reply, lang:get(<<"清空成功"/utf8>>)}
		 end},
     #gm_cmd{cmd = "查看英雄ID", args = [],
	     do =
		 fun ([],
		      #role{partner_bag = #partner_bag{partner_list = PL}}) ->
			 Fun = fun (#partner{id = PId, bid = PBid, star = Star,
					     lev = Lev},
				    AccMsg) ->
				       Msg =
					   util:fbin(lang:get(<<"id：~w bid:~w ~ts 星级:~w  等级:~w \n"/utf8>>),
						     [PId, PBid,
						      (partner_data:get_base(PBid))#partner_base_data.name,
						      Star, Lev]),
				       <<AccMsg/binary, Msg/binary>>
			       end,
			 PtnMsg = lists:foldl(Fun, <<>>, PL),
			 {reply, util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg])}
		 end},
     #gm_cmd{cmd = "设晶碑等级", args = [{int, "等级", 1}],
	     do =
		 fun ([Lev], Role) ->
			 case resonate_lib:gm_set_lev(Role, Lev) of
			   {ok, NewRole} -> {reply, "设置成功", NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "设赋能过期", args = [{int, "分钟", 1}],
	     do =
		 fun ([Min], Role) ->
			 partner:gm_set_overdue_time(Role, Min)
		 end},
     #gm_cmd{cmd = "快速炼金", args = [],
	     do =
		 fun ([], Role) ->
			 resonate_extract:gm_extract_award(Role)
		 end},
     #gm_cmd{cmd = "炼金完成", args = [{int, "完成次数", 30}],
	     do =
		 fun ([Num], Role) ->
			 resonate_extract:gm_set_do_num(Role, Num)
		 end},
     #gm_cmd{cmd = "竞技场挑战", args = [{int, "次数", 30}],
	     do =
		 fun ([Num], Role = #role{m_arena = MArena}) ->
			 NewRole = Role#role{m_arena =
						 MArena#m_arena{had_combat_num =
								    Num}},
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "减少精灵孵化点",
	     args = [{int, "孵化器id", 1}, {int, "减少点数", 99999}],
	     do =
		 fun ([Id, DoPoint], Role) ->
			 case sprite_hatch:gm_del_do_point(Role, Id, DoPoint) of
			   {ok, NewRole} ->
			       {reply, "Nhận Quà Thành Công", NewRole};
			   {false, Msg} -> {reply, Msg}
			 end
		 end},
     #gm_cmd{cmd = "重置精灵保底数据", args = [],
	     do =
		 fun ([], Role) -> sprite_hatch:gm_ref_baodi(Role) end},
     #gm_cmd{cmd = "开启精灵蛋",
	     args = [{int, "精灵蛋id", 10603}, {int, "开启次数", 10}],
	     do =
		 fun ([ItemId, Count], Role) ->
			 {PtnMsg, Msg2} = sprite_hatch:gm_open_egg(Role, ItemId,
								   Count, 1,
								   <<>>, []),
			 {reply,
			  util:fbin(lang:get(<<"~ts  ~ts"/utf8>>),
				    [PtnMsg, Msg2])}
		 end},
     #gm_cmd{cmd = "屏蔽词重载", args = [],
	     do = fun ([], _Role) -> keyword:reload(), ok end},
     #gm_cmd{cmd = "代金劵推送", args = [{int, "类型", 2}],
	     do =
		 fun ([Type],
		      #role{id = {Rid, _}, platform = PlatForm,
			    zone_id = ZoneId}) ->
			 Json = case Type == 2 of
				  true -> ejson:encode({[{type, Type}]});
				  _ ->
				      Roles = [[Rid, PlatForm, ZoneId]],
				      ejson:encode({[{roles, Roles},
						     {type, Type}]})
				end,
			 adm:notice_bond(Json),
			 ok
		 end},
     #gm_cmd{cmd = "秘境重置", args = [],
	     do =
		 fun ([], Role) ->
			 guild_secret_area_mgr:gm_reset_boss(Role), ok
		 end},
     #gm_cmd{cmd = "全服禁言",
	     args =
		 [{int, "类型", 1}, {int, "是否禁言", 0},
		  {string, "限制类型", "[]"}],
	     do =
		 fun ([Type, Bool, String], Role) ->
			 {ok, List} = util:string_to_term(String),
			 case Type == 1 of
			   true ->
			       Boolean = util:if_true(Bool == 1, true, false),
			       sys_env:save(sys_ban_rename, Boolean),
			       ok;
			   _ ->
			       BanList = util:if_true(Bool == 1, List, []),
			       sys_env:save(sys_ban_channel, BanList),
			       ok
			 end
		 end},
     #gm_cmd{cmd = "秘境重置次数", args = [],
	     do =
		 fun ([], Role) ->
			 {RoleGid, RoleNumber, _, _, Dps, LastUpdateTime} =
			     var:get_var(Role, other, 3063,
					 {{0, <<>>}, 0, 0, 0, 0, 0}),
			 NewRole = var:set_var(Role, other, 3063,
					       {RoleGid, RoleNumber, 0, 0, Dps,
						LastUpdateTime}),
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "更换秘境难度",
	     args = [{int, "boss_id", 91001}],
	     do =
		 fun ([BossId], Role) ->
			 guild_secret_area_mgr:gm_change_boss_id(BossId, Role),
			 ok
		 end},
     #gm_cmd{cmd = "秘境结算", args = [],
	     do =
		 fun ([], Role) ->
			 guild_secret_area_mgr:gm_count(Role), ok
		 end},
     #gm_cmd{cmd = "宝库放入",
	     args = [{int, "boss_id", 91001}, {int, "time", 1}],
	     do =
		 fun ([BossId, Time], Role) ->
			 guild_secret_area_mgr:gm_put_into(BossId, Time, Role),
			 ok
		 end},
     #gm_cmd{cmd = "宝库放入物品",
	     args = [{int, "base_id", 10001}, {int, "num", 1}],
	     do =
		 fun ([BaseId, Num], Role) ->
			 guild_secret_area_mgr:gm_put_into_item(BaseId, Num,
								Role),
			 ok
		 end},
     #gm_cmd{cmd = "投票清除", args = [],
	     do = fun ([], _Role) -> voting_mgr:gm_delete(), ok end},
     #gm_cmd{cmd = "奇遇刷题", args = [],
	     do =
		 fun ([], Role) -> encounter:update_question(Role) end},
     #gm_cmd{cmd = "奇遇初始化", args = [],
	     do =
		 fun ([], Role) ->
			 {ok, Role#role{m_encounter = #m_encounter{}}}
		 end},
     #gm_cmd{cmd = "奇遇指定刷题", args = [{int, "id", 1}],
	     do =
		 fun ([Id], Role = #role{m_encounter = Encounter}) ->
			 NewEncounter = Encounter#m_encounter{must_id = Id},
			 NewRole = Role#role{m_encounter = NewEncounter},
			 encounter:update_question(NewRole)
		 end},
     #gm_cmd{cmd = "大富翁刷地图", args = [{int, "id", 1}],
	     do =
		 fun ([Id], Role) ->
			 NewRole = monopoly_maps:gm_update_stage(Id, Role),
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "合服目标清空", args = [],
	     do =
		 fun ([], Role) ->
			 holiday_merge_goal_mgr:gm_delete(Role), ok
		 end},
     #gm_cmd{cmd = "增加情人节活动积分", args = [{int, "score", 1}],
	     do =
		 fun ([Score], Role) ->
			 holiday_valentines_mgr:gm_add_score(Role, Score), ok
		 end},
     #gm_cmd{cmd = "合服目标奖励清空", args = [],
	     do =
		 fun ([], Role) ->
			 NewRole =
			     holiday_merge_goal_mgr:gm_delete_reward(Role),
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "组队竞技场下阶段", args = [],
	     do =
		 fun ([], Role) ->
			 cluster_dynamic_group:group_cast(1, arena_team_mgr, m,
							  []),
			 ok
		 end},
     #gm_cmd{cmd = "组队竞技场加挑战次数", args = [{int, "Count", 10}],
	     do =
		 fun ([Count], Role) ->
			 arena_team_lib:gm_add_count(Role, Count), ok
		 end},
     #gm_cmd{cmd = "合服目标全清", args = [],
	     do =
		 fun ([], Role) ->
			 holiday_merge_goal_mgr:gm_delete_all(Role), ok
		 end},
     #gm_cmd{cmd = "圣夜奇境排行榜全清", args = [],
	     do =
		 fun ([], Role) ->
			 monopoly_dungeons_guild_rank:gm_delete(), ok
		 end},
     #gm_cmd{cmd = "加探索度",
	     args = [{int, "stage", 1}, {int, "develop", 100}],
	     do =
		 fun ([StageId, Develop], Role) ->
			 NewRole = monopoly_maps:gm_add_develop(StageId,
								Develop, Role),
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "挑战Boss刷新", args = [],
	     do =
		 fun ([], #role{guild_bag = #guild_bag{id = Gid}}) ->
			 monopoly_dungeons:info(Gid, gm_update), ok
		 end},
     #gm_cmd{cmd = "Boss死亡",
	     args =
		 [{int, "stage", 1}, {int, "boss_id", 1},
		  {int, "dsp", 1}],
	     do =
		 fun ([StageId, BossId, Dps], Role) ->
			 monopoly_dungeons:gm_kill(StageId, BossId, Dps, Role),
			 ok
		 end},
     #gm_cmd{cmd = "新手训练营清空", args = [],
	     do =
		 fun ([], Role) ->
			 NewRole = training_camp:gm_clean(Role), {ok, NewRole}
		 end},
     #gm_cmd{cmd = "七日目标重置", args = [],
	     do =
		 fun ([], Role) ->
			 NewRole = day_goals:gm_reset(Role), {ok, NewRole}
		 end},
     #gm_cmd{cmd = "召唤设置",
	     args =
		 [{int, "库", 300}, {int, "抽奖次数", 1900},
		  {int, "上次出5星次数", 1860}],
	     do =
		 fun ([GroupId, DrawTimes, LastHitFiveStar], Role) ->
			 recruit:gm_set_time(Role, GroupId, DrawTimes,
					     LastHitFiveStar)
		 end},
     #gm_cmd{cmd = "巅峰冠军赛初始参赛人员", args = [],
	     do =
		 fun ([], Role) ->
			 arena_peak_champion_mgr:info(gm_re_ready), ok
		 end},
     #gm_cmd{cmd = "巅峰冠军赛开启", args = [],
	     do =
		 fun ([], Role) -> arena_peak_champion_mgr:info(open), ok
		 end},
     #gm_cmd{cmd = "巅峰冠军赛重置红点", args = [],
	     do =
		 fun ([], Role) ->
			 NewRole = arena_peak_champion:reset_point2(Role),
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "巅峰冠军赛下阶段", args = [],
	     do =
		 fun ([], Role) ->
			 case arena_peak_champion:check_open(Role) of
			   false -> ok;
			   _ ->
			       case arena_peak_champion:get_main_id(Role) of
				 undefined -> ok;
				 Sid ->
				     cluster_lib:cast(Sid,
						      arena_peak_champion_mgr,
						      m, []),
				     ok
			       end
			 end,
			 ok
		 end},
     #gm_cmd{cmd = "位面守卫匹配上报", args = [],
	     do =
		 fun ([], Role) ->
			 formation_role_lib:login(Role#role{m_var = #m_var{}}),
			 ok
		 end},
     #gm_cmd{cmd = "位面守卫匹配",
	     args = [{int, "次数", 1}, {term, "战力列表", []}],
	     do =
		 fun ([N, Powers], Role) ->
			 formation_role_lib:test_match(Role, {N, Powers})
		 end},
     #gm_cmd{cmd = "位面重置", args = [],
	     do =
		 fun ([], Role) -> {ok, secret_dun:gm_reset(Role)} end},
     #gm_cmd{cmd = "位面通关", args = [{int, "id", 1}],
	     do =
		 fun ([Id], Role) -> {ok, secret_dun:gm_pass(Role, Id)}
		 end},
     #gm_cmd{cmd = "位面指定副本", args = [{int, "id", 999}],
	     do =
		 fun ([Id], Role) -> secret_dun:gm_dun(Role, Id) end},
     #gm_cmd{cmd = "提交贡品", args = [{int, "num", 1}],
	     do =
		 fun ([Num], _Role) ->
			 holiday_nian_mgr:gm_commit_tribute(Num), ok
		 end},
     #gm_cmd{cmd = "年兽操盘", args = [{int, "type", 1}],
	     do =
		 fun ([Type], _Role) ->
			 holiday_nian_mgr:gm_operation(Type), ok
		 end},
     #gm_cmd{cmd = "年兽重置", args = [],
	     do =
		 fun ([], Role) -> {ok, holiday_nian:gm_reset(Role)}
		 end},
     #gm_cmd{cmd = "年兽管理器重置", args = [],
	     do =
		 fun ([], _Role) -> holiday_nian_mgr:gm_reset(), ok end},
     #gm_cmd{cmd = "年兽挑战次数", args = [],
	     do =
		 fun ([], Role) -> {ok, holiday_nian:gm_reset_time(Role)}
		 end},
     #gm_cmd{cmd = "位面重置2", args = [],
	     do = fun ([], Role) -> {ok, planes:gm_reset(Role)} end},
     #gm_cmd{cmd = "位面重置3", args = [],
	     do =
		 fun ([], Role) -> {ok, planes:gm_reset1(Role)} end},
     #gm_cmd{cmd = "位面雇佣机器人", args = [{int, "id"}],
	     do = fun ([Id], Role) -> planes:gm_robot(Role, Id) end},
     #gm_cmd{cmd = "位面指定遗物", args = [{int, "id", 10001}],
	     do = fun ([Id], Role) -> planes:gm_buff(Role, Id) end},
     #gm_cmd{cmd = "位面匹配", args = [],
	     do =
		 fun ([], Role) -> partner_rand_lib:gm_match(Role) end},
     #gm_cmd{cmd = "订阅特权", args = [{int, "id", 1}],
	     do =
		 fun ([Id], Role) -> subscriber:gm_buy(Role, Id) end},
     #gm_cmd{cmd = "订阅特权过期", args = [],
	     do = fun ([], Role) -> subscriber:gm_reset(Role) end},
     #gm_cmd{cmd = "查看神装战力", args = [],
	     do =
		 fun ([], Role) ->
			 holy_eqm_lottery:gm_look_power(Role), ok
		 end},
     #gm_cmd{cmd = "女神次数", args = [],
	     do =
		 fun ([], Role) ->
			 holiday_valentine_boss:reset_time(Role)
		 end},
     #gm_cmd{cmd = "符文重铸测试",
	     args =
		 [{int, "是否幸运重铸", 0}, {int, "符文id", 10455},
		  {int, "测试次数", 10}],
	     do =
		 fun ([IsLucky, ItemId, Times], Role) ->
			 case partner_artifact:gm_test_refresh(Role, IsLucky,
							       ItemId, Times,
							       {[], 0, 0})
			     of
			   {false, Msg} -> {reply, Msg};
			   {NRole, {BidLT, Count, Count2}} ->
			       BidL = lists:keysort(1, BidLT),
			       BidSum = lists:sum([Num1
						   || {_, _, Num1} <- BidL]),
			       Fun = fun ({Bid, SkillName, Num3},
					  {AccMsg, Acc}) ->
					     Msg =
						 util:fbin(lang:get(<<"id：~w: 技能名:~ts  数量:~w  比率:~w% \n"/utf8>>),
							   [Bid, SkillName,
							    Num3,
							    util:round(Num3 /
									 Acc
									 * 1000)
							      / 10]),
					     {<<AccMsg/binary, Msg/binary>>,
					      Acc}
				     end,
			       {PtnMsg1, _} = lists:foldl(Fun, {<<>>, BidSum},
							  BidL),
			       Msg1 =
				   util:fbin(lang:get(<<"双高技能比率:~w \n 极品双高技能比率:~w \n"/utf8>>),
					     [util:round(Count / Times * 1000) /
						10,
					      util:round(Count2 / Times * 1000)
						/ 10]),
			       PtnMsg = <<Msg1/binary, "技能ID比率:\n"/utf8,
					  PtnMsg1/binary>>,
			       {reply,
				util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg]),
				NRole}
			 end
		 end},
     #gm_cmd{cmd = "冠军赛查看机器人伙伴星级数据", args = [],
	     do =
		 fun ([], Role) ->
			 BidLT = arena_champion_mgr:gm_get_all_robot_star(),
			 BidL = lists:keysort(1, BidLT),
			 Fun = fun ({Bid, Num3}, {AccMsg, Acc}) ->
				       Msg =
					   util:fbin(lang:get(<<"星级：~w: 数量:~w \n"/utf8>>),
						     [Bid, Num3]),
				       {<<AccMsg/binary, Msg/binary>>, Acc}
			       end,
			 {PtnMsg1, _} = lists:foldl(Fun, {<<>>, []}, BidL),
			 PtnMsg = <<"机器人伙伴信息:\n"/utf8, PtnMsg1/binary>>,
			 {reply, util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg]),
			  Role}
		 end},
     #gm_cmd{cmd = "周冠军赛查看机器人伙伴星级数据", args = [],
	     do =
		 fun ([], Role) ->
			 BidLT =
			     arena_cluster_champion_mgr:gm_get_all_robot_star(),
			 BidL = lists:keysort(1, BidLT),
			 Fun = fun ({Bid, Num3}, {AccMsg, Acc}) ->
				       Msg =
					   util:fbin(lang:get(<<"星级：~w: 数量:~w \n"/utf8>>),
						     [Bid, Num3]),
				       {<<AccMsg/binary, Msg/binary>>, Acc}
			       end,
			 {PtnMsg1, _} = lists:foldl(Fun, {<<>>, []}, BidL),
			 PtnMsg = <<"机器人伙伴信息:\n"/utf8, PtnMsg1/binary>>,
			 {reply, util:fbin(lang:get(<<"~ts"/utf8>>), [PtnMsg]),
			  Role}
		 end},
     #gm_cmd{cmd = "位面输出",
	     args = [{int, "行数", 1}, {int, "格子", 1}],
	     do =
		 fun ([Line, Index], Role) ->
			 planes:gm_info(Role, Line, Index), ok
		 end},
     #gm_cmd{cmd = "清空排行榜", args = [{int, "类型", 0}],
	     do =
		 fun ([Type], _Role) -> rank_mgr:clear(Type), ok end},
     #gm_cmd{cmd = "竞技场清空排行榜", args = [],
	     do =
		 fun ([], _Role) -> arena_mgr:gm_delete_rank(), ok end},
     #gm_cmd{cmd = "冠军赛同步数据", args = [],
	     do =
		 fun ([], _Role) ->
			 arena_peak_champion_mgr:gm_update(), ok
		 end},
     #gm_cmd{cmd = "阵容上报", args = [],
	     do =
		 fun ([], Role) -> formation_role_lib:gm_info(Role), ok
		 end},
     #gm_cmd{cmd = "阵容上报2", args = [],
	     do =
		 fun ([], Role) ->
			 formation_role_lib:gm_info_test(Role), ok
		 end},
     #gm_cmd{cmd = "活动组队竞技加次数", args = [],
	     do =
		 fun ([], Role = #role{id = RoleId}) ->
			 var:set_role_var(RoleId, day, 2, 20), ok
		 end},
     #gm_cmd{cmd = "活动组队竞技下阶段", args = [],
	     do =
		 fun ([], Role = #role{id = RoleId}) ->
			 cluster_lib:cast(center, c_holiday_arena_team_mgr, m,
					  []),
			 ok
		 end},
     #gm_cmd{cmd = "活动组队竞技重置赛季", args = [],
	     do =
		 fun ([], Role = #role{id = RoleId}) ->
			 cluster_lib:cast(center, c_holiday_arena_team_mgr,
					  gm_clear, []),
			 notice:alert(lang:get(<<"当前处于数据采集期，5分钟后再敲活动组队竞技下阶段"/utf8>>)),
			 ok
		 end},
     #gm_cmd{cmd = "活动组队竞技查看标准战力", args = [],
	     do =
		 fun ([], Role = #role{id = RoleId}) ->
			 BasePower =
			     holiday_arena_team_lib:gm_get_base_power(Role),
			 {reply,
			  util:fbin(lang:get(<<"标准战力为：~w"/utf8>>), [BasePower])}
		 end},
     #gm_cmd{cmd = "公会技能突破", args = [],
	     do =
		 fun ([], Role) ->
			 NewRole = guild_skill:gm_break(Role), {ok, NewRole}
		 end},
     #gm_cmd{cmd = "公会突破技能",
	     args =
		 [{int, "职业", 2}, {int, "属性1等级", 1}, {int, "属性2等级", 1},
		  {int, "属性3等级", 1}, {int, "属性4等级", 1}, {int, "技能等级", 1}],
	     do =
		 fun ([Type, Lev1, Lev2, Lev3, Lev4, SkillLev], Role) ->
			 NewRole = guild_skill:gm_set_break(Role,
							    {Type, Lev1, Lev2,
							     Lev3, Lev4,
							     SkillLev}),
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "查看公会突破技能", args = [{int, "职业", 2}],
	     do =
		 fun ([Type], Role) ->
			 guild_skill:gm_info_break(Role, Type), ok
		 end},
     #gm_cmd{cmd = "新服演武重置次数", args = [],
	     do =
		 fun ([], Role) ->
			 NewRole =
			     holiday_practise_tower_lib:gm_reset_time(Role),
			 {ok, NewRole}
		 end},
     #gm_cmd{cmd = "新服演武层数", args = [{int, "层数", 1}],
	     do =
		 fun ([Id], Role) ->
			 NewRole = holiday_practise_tower_lib:gm_set_id(Role,
									Id),
			 {ok, NewRole}
		 end}].

-spec do(string(), #role{}) -> {reply, string()} |
			       {reply, string(), #role{}}.

do(CmdStr, Role) when is_binary(CmdStr) ->
    do(string:tokens(unicode:characters_to_list(CmdStr),
		     "\n"),
       Role);
do([CmdStr | T], Role) when is_list(CmdStr) ->
    case do(CmdStr, Role) of
      Ret when T =:= [] -> Ret;
      {ok, NRole} -> do(T, NRole);
      {reply, _, NRole} -> do(T, NRole);
      _ -> do(T, Role)
    end;
do(CmdStr, Role) ->
    case string:tokens(CmdStr, " ") of
      [] -> {reply, {<<"忽略"/utf8>>}};
      [Cmd | A] ->
	  case lists:keyfind(Cmd, #gm_cmd.cmd, cmds()) of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidgm_cmd4429, _,
		   {__Levelgm_cmd4429, __Tracesgm_cmd4429}}
		      when __Levelgm_cmd4429 band 8 /= 0 orelse
			     __Tracesgm_cmd4429 /= [] ->
		      lager:do_log(error,
				   [{module, gm_cmd}, {function, do},
				    {line, 4429}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("不支持的命令:~ts", [CmdStr]), none,
				   4096, 8, __Levelgm_cmd4429,
				   __Tracesgm_cmd4429, lager_event,
				   __Pidgm_cmd4429);
		  _ -> ok
		end,
		{reply, {<<"不支持的命令"/utf8>>}};
	    GmCmd = #gm_cmd{do = Do, args = ArgDefine} ->
		case parse_args(ArgDefine, A, []) of
		  {error, Reason} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidgm_cmd4434, _,
			 {__Levelgm_cmd4434, __Tracesgm_cmd4434}}
			    when __Levelgm_cmd4434 band 8 /= 0 orelse
				   __Tracesgm_cmd4434 /= [] ->
			    lager:do_log(error,
					 [{module, gm_cmd}, {function, do},
					  {line, 4434},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("解析参数出错:~p  ~ts",
						       [CmdStr, Reason]),
					 none, 4096, 8, __Levelgm_cmd4434,
					 __Tracesgm_cmd4434, lager_event,
					 __Pidgm_cmd4434);
			_ -> ok
		      end,
		      {reply,
		       {util:fbin("命令[~ts]执行失败: ~ts~n命令说明:~ts~n",
				  [Cmd, Reason, help([GmCmd])])}};
		  {ok, Args} ->
		      case catch Do(Args, Role) of
			ok -> ok;
			{ok, NewRole} -> {ok, NewRole};
			{false, Msg} ->
			    {reply, {util:fbin("[SRV] ~ts", [Msg])}};
			{error, Msg} ->
			    {reply, {util:fbin("[SRV] ~ts", [Msg])}};
			{reply, Msg} ->
			    {reply, {util:fbin("[SRV] ~ts", [Msg])}};
			{reply, Msg, NewRole} ->
			    {reply, {util:fbin("[SRV] ~ts", [Msg])}, NewRole};
			Err ->
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
			      {__Pidgm_cmd4445, _,
			       {__Levelgm_cmd4445, __Tracesgm_cmd4445}}
				  when __Levelgm_cmd4445 band 8 /= 0 orelse
					 __Tracesgm_cmd4445 /= [] ->
				  lager:do_log(error,
					       [{module, gm_cmd},
						{function, do}, {line, 4445},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("命令[~ts]执行失败: ~w",
							     [Cmd, Err]),
					       none, 4096, 8, __Levelgm_cmd4445,
					       __Tracesgm_cmd4445, lager_event,
					       __Pidgm_cmd4445);
			      _ -> ok
			    end,
			    {reply, {util:fbin("[SRV]命令[~ts]执行失败~n", [Cmd])}}
		      end
		end
	  end
    end.

do_cmds([], Role) -> {ok, Role};
do_cmds([{Cmd, Args} | T], Role) ->
    case lists:keyfind(Cmd, #gm_cmd.cmd, cmds()) of
      false ->
	  sys_conn:pack_send(9900,
			     {util:fbin(lang:get(<<"不支持的命令: ~ts"/utf8>>),
					[Cmd])}),
	  do_cmds(T, Role);
      #gm_cmd{do = Do} ->
	  case catch Do(Args, Role) of
	    ok -> do_cmds(T, Role);
	    {ok, NewRole} -> do_cmds(T, NewRole);
	    {reply, Msg, NewRole} ->
		sys_conn:pack_send(9900,
				   {util:fbin("<SRV> ~ts", [Msg])}),
		do_cmds(T, NewRole);
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidgm_cmd4468, _,
		   {__Levelgm_cmd4468, __Tracesgm_cmd4468}}
		      when __Levelgm_cmd4468 band 8 /= 0 orelse
			     __Tracesgm_cmd4468 /= [] ->
		      lager:do_log(error,
				   [{module, gm_cmd}, {function, do_cmds},
				    {line, 4468}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("命令[~ts]执行失败: ~w", [Cmd, Err]),
				   none, 4096, 8, __Levelgm_cmd4468,
				   __Tracesgm_cmd4468, lager_event,
				   __Pidgm_cmd4468);
		  _ -> ok
		end,
		do_cmds(T, Role)
	  end
    end.

parse_args([], _, L) -> {ok, lists:reverse(L)};
parse_args([{_Type, _Desc, DefVal} | T], [], L) ->
    parse_args(T, [], [DefVal | L]);
parse_args(_, [], _L) -> {error, "参数不完整"};
parse_args([{Type, Desc, _} | T], Args, L) ->
    parse_args([{Type, Desc} | T], Args, L);
parse_args([{term, Desc} | T], [V | Args], L) ->
    case catch util:string_to_term(V) of
      {ok, A} -> parse_args(T, Args, [A | L]);
      _ -> {error, util:cn("参数[~ts]无法转换成term", [Desc])}
    end;
parse_args([{int, Desc} | T], [V | Args], L) ->
    case catch list_to_integer(V) of
      {'EXIT', _} ->
	  {error, util:cn("参数[~ts]无法转换成int", [Desc])};
      A -> parse_args(T, Args, [A | L])
    end;
parse_args([{atom, _Desc} | T], [V | Args], L) ->
    parse_args(T, Args, [list_to_atom(V) | L]);
parse_args([{float, Desc} | T], [V | Args], L) ->
    case catch list_to_float(V) of
      {'EXIT', _} ->
	  {error, util:cn("参数[~ts]无法转换成float", [Desc])};
      A -> parse_args(T, Args, [A | L])
    end;
parse_args([{bin, Desc} | T], [V | Args], L) ->
    case catch unicode:characters_to_binary(V) of
      {'EXIT', _} ->
	  {error, util:cn("参数[~ts]无法转换成bitstring", [Desc])};
      A -> parse_args(T, Args, [A | L])
    end;
parse_args([{_, _} | T], [V | Args], L) ->
    parse_args(T, Args, [V | L]).

help(Cmds) ->
    unicode:characters_to_binary(lists:concat(lists:reverse(do_help(Cmds,
								    [])))).

do_help([], L) -> L;
do_help([#gm_cmd{cmd = Cmd, args = Args, desc = Desc}
	 | T],
	L) ->
    S = lists:concat(["> 说明：", Desc, ":\n  GM命令：", Cmd,
		      lists:concat([" [" ++ to_help_args(A) ++ "]"
				    || A <- Args]),
		      "\n"]),
    do_help(T, [S | L]).

to_help_args({_, Desc}) -> lists:concat([Desc, ",必须项"]);
to_help_args({_, Desc, DefVal}) ->
    lists:concat([Desc, ",默认值(", util:to_list(DefVal),
		  ")"]).

clone_account(Account,
	      Role = #role{sex = Sex, career = Career,
			   channel = Channel}) ->
    SrvId = sys_env:get(server_id),
    case
      db:get_one("SELECT count(*) FROM role WHERE account "
		 "= binary ? ",
		 [Account])
	of
      {error, _} -> {reply, "系统繁忙"};
      {ok, Num} when Num >= 1 -> {reply, "账号已存在"};
      {ok, _} ->
	  Rid = sys_env:update_counter(role_max_rid, 1),
	  Name = role_misc:rand_name(Rid),
	  IpBin = <<"0.0.0.0">>,
	  Now = date:unixtime(),
	  Sql = "insert into role(rid, srv_id, account, "
		"name, sex, career , lev, reg_time, login_time"
		", logout_time , reg_ip, login_ip, is_online, "
		"getui_cid, device_type, os_ver, carrier_name, "
		"net_type, reg_channel, reg_device_id, "
		"reg_idfa, reg_os_name, reg_app_name, "
		"reg_package_name, reg_package_version, "
		"channel, device_id, idfa, os_name, app_name, "
		"package_name, package_version, acc_group) "
		"values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
		"?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
		"?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
	  Agrs = [Rid, SrvId, Account, Name, Sex, Career, 1, Now,
		  0, 0, IpBin, IpBin, 0, Role#role.getui_cid,
		  Role#role.device_type, Role#role.os_ver,
		  Role#role.carrier_name, Role#role.net_type, Channel,
		  Role#role.device_id, Role#role.idfa, Role#role.os_name,
		  Role#role.app_name, Role#role.package_name,
		  Role#role.package_ver, Channel, Role#role.device_id,
		  Role#role.idfa, Role#role.os_name, Role#role.app_name,
		  Role#role.package_name, Role#role.package_ver, <<"2">>],
	  case db:insert(Sql, Agrs) of
	    {error, _} -> {reply, "系统繁忙"};
	    _ ->
		NRole = Role#role{id = {Rid, SrvId}, account = Account,
				  name = Name, pid = undefined},
		role_data:local_save(to_db, NRole),
		{reply, "克隆成功"}
	  end
    end.


