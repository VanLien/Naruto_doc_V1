-file("data/shipping.erl", 1).

-file("src/mod/shipping/shipping.erl", 1).

-module(shipping).

-lager_records([{holiday,
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
		{privilege_data,
		 [id, name, pay_type, charge_id, loss, limit_type,
		  limit_day, reward, limit_lev]},
		{privilege_gift,
		 [ver, id, status, buy_time, expire_time]},
		{privilege, [ver, id, expire_time]},
		{m_privilege, [ver, list, gift]},
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
		{shipping_order,
		 [ver, order_id, order_bid, status, end_time,
		  assign_ids]},
		{m_shipping,
		 [ver, free_times, coin_times, day_times, all_times,
		  next_order_id, free_list, do_list, apear_list,
		  rand_counts]},
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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

-export([init/0, login/1, flush/1, fire/1, info/1,
	 order_timeout/2, do_order/3, finish_order/3,
	 one_finish_order/1, refresh_orders/1,
	 is_open_holiday/1]).

-export([gm_reward/1, gm_test_refresh/3]).

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

-file("src/mod/shipping/shipping.erl", 27).

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

-file("src/mod/shipping/shipping.erl", 28).

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

-file("src/mod/shipping/shipping.erl", 29).

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

-file("src/mod/shipping/shipping.erl", 30).

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

-file("src/mod/shipping/shipping.erl", 31).

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

-file("src/mod/shipping/shipping.erl", 32).

-file("inc/timer.hrl", 1).

-record(timer,
	{id  :: term(), timeout = 1000  :: pos_integer(),
	 m  :: undefined | atom(), f  :: function() | atom(),
	 a = []  :: [term()], times = 1  :: integer(),
	 next_tick = 0  :: non_neg_integer(),
	 set_time = 1  :: pos_integer()}).

-record(rtimer,
	{ref  :: undefined | reference(),
	 key = 0  :: non_neg_integer(),
	 timers = []  :: [#timer{}]}).

-record(s_timer,
	{ref  :: undefined | reference(),
	 timers = []  :: [#timer{}]}).

-file("src/mod/shipping/shipping.erl", 33).

-file("inc/shipping.hrl", 1).

-record(m_shipping,
	{ver = 3, free_times = 0, coin_times = 0, day_times = 0,
	 all_times = 0, next_order_id = 1, free_list = [],
	 do_list = [], apear_list = [], rand_counts = []}).

-record(shipping_order,
	{ver = 1, order_id, order_bid = 0, status = 1,
	 end_time = 0, assign_ids = []}).

-file("src/mod/shipping/shipping.erl", 34).

-file("inc/package.hrl", 1).

-file("src/mod/shipping/shipping.erl", 35).

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

-file("src/mod/shipping/shipping.erl", 36).

-file("inc/log.hrl", 1).

-file("src/mod/shipping/shipping.erl", 37).

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

-file("src/mod/shipping/shipping.erl", 38).

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

-file("src/mod/shipping/shipping.erl", 39).

-file("inc/privilege.hrl", 1).

-record(m_privilege, {ver = 1, list = [], gift = []}).

-record(privilege, {ver = 1, id = 0, expire_time = 0}).

-record(privilege_gift,
	{ver = 1, id = 0, status = 0, buy_time = 0,
	 expire_time = 0}).

-record(privilege_data,
	{id = 0, name = <<>>, pay_type = 0, charge_id = 0,
	 loss = 0, limit_type = 0, limit_day = 0, reward = [],
	 limit_lev = 0}).

-file("src/mod/shipping/shipping.erl", 40).

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

-file("src/mod/shipping/shipping.erl", 41).

gm_reward(Role = #role{m_shipping =
			   #m_shipping{do_list = DoList}}) ->
    OrderIdList = [OrderId
		   || #shipping_order{order_id = OrderId} <- DoList],
    set_reward(OrderIdList, Role).

set_reward([], Role) -> Role;
set_reward([OrderId | Rest], Role) ->
    NewRole = do_set_reward(Role, OrderId),
    set_reward(Rest, NewRole).

do_set_reward(Role = #role{m_shipping =
			       MShipping = #m_shipping{do_list = Orders}},
	      OrderId) ->
    case lists:keyfind(OrderId, #shipping_order.order_id,
		       Orders)
	of
      Order = #shipping_order{status = 2} ->
	  NewOrder = Order#shipping_order{status = 3},
	  NewOrders = lists:keyreplace(OrderId,
				       #shipping_order.order_id, Orders,
				       NewOrder),
	  NewMShipping = MShipping#m_shipping{do_list =
						  NewOrders},
	  NRole = Role#role{m_shipping = NewMShipping},
	  push_order_ref(NRole, NewOrder),
	  NRole;
      _ -> Role
    end.

-spec init() -> #m_shipping{}.

init() -> #m_shipping{}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role) -> set_timer(Role).

-spec flush(#role{}) -> {ok, #role{}}.

flush(Role = #role{lev = Lev,
		   m_shipping = MShipping}) ->
    case Lev >= shipping_data:get_const(guild_lev) of
      true ->
	  NewMShipping = MShipping#m_shipping{day_times = 0,
					      free_times = 0, coin_times = 0,
					      rand_counts = []},
	  NRole = Role#role{m_shipping = NewMShipping},
	  push_shipping_info(NRole),
	  {ok, NRole};
      _ -> {ok, Role}
    end.

-spec fire(#role{}) -> {ok, #role{}}.

fire(Role = #role{lev = Lev,
		  m_shipping =
		      MShipping = #m_shipping{rand_counts = RandCounts,
					      apear_list = ApearList,
					      all_times = AllTime,
					      next_order_id = NextId}}) ->
    case Lev >= shipping_data:get_const(guild_lev) andalso
	   AllTime == 0 andalso NextId == 1
	of
      true ->
	  {NewOrders, NewNextId, RandIds} =
	      do_refresh_orders(Role#role{m_shipping = MShipping}, 1),
	  NewApearList = do_add_apear_count(RandIds, ApearList),
	  NewRandCounts = do_add_rand_counts(RandIds, RandCounts),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidshipping98, _,
	     {__Levelshipping98, __Tracesshipping98}}
		when __Levelshipping98 band 128 /= 0 orelse
		       __Tracesshipping98 /= [] ->
		lager:do_log(debug,
			     [{module, shipping}, {function, fire}, {line, 98},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("远航随机id:~w", [RandIds]), none, 4096,
			     128, __Levelshipping98, __Tracesshipping98,
			     lager_event, __Pidshipping98);
	    _ -> ok
	  end,
	  NRole = Role#role{m_shipping =
				MShipping#m_shipping{rand_counts =
							 NewRandCounts,
						     apear_list = NewApearList,
						     free_list = NewOrders,
						     next_order_id = NewNextId,
						     all_times = AllTime + 1}},
	  push_shipping_info(NRole),
	  NRole;
      _ -> Role
    end.

-spec info(#role{}) -> ok.

info(Role = #role{lev = Lev}) ->
    LimitLev = shipping_data:get_const(guild_lev),
    case Lev >= LimitLev of
      true -> push_shipping_info(Role);
      _ ->
	  notice:alert(util:fbin(lang:get(<<"~wBật tính năng này"/utf8>>),
				 [LimitLev])),
	  ok
    end.

-spec order_timeout(#role{}, pos_integer()) -> {ok,
						#role{}}.

order_timeout(Role = #role{m_shipping =
			       MShipping = #m_shipping{do_list = Orders}},
	      OrderId) ->
    Now = date:unixtime(),
    case lists:keyfind(OrderId, #shipping_order.order_id,
		       Orders)
	of
      Order = #shipping_order{end_time = EndTime, status = 2}
	  when Now >= EndTime ->
	  NewOrder = Order#shipping_order{status = 3},
	  NewOrders = lists:keyreplace(OrderId,
				       #shipping_order.order_id, Orders,
				       NewOrder),
	  NewMShipping = MShipping#m_shipping{do_list =
						  NewOrders},
	  NRole = Role#role{m_shipping = NewMShipping},
	  push_order_ref(NRole, NewOrder),
	  {ok, NRole};
      _ -> {ok, Role}
    end.

-spec do_order(#role{}, pos_integer(), list()) -> {ok,
						   #role{}} |
						  {false, binary()}.

do_order(Role = #role{m_shipping =
			  MShipping = #m_shipping{free_list = List,
						  do_list = DoList}},
	 OrderId, PartnerIds) ->
    case checkout_arge(Role, OrderId, PartnerIds) of
      {false, Msg} -> {false, Msg};
      {ok, Pnts,
       Order = #shipping_order{order_bid = OrderBid}} ->
	  Conditions =
	      lists:flatten([shipping_data:get_condition_info(ConditionId)
			     || ConditionId
				    <- shipping_data:get_order_condition(OrderBid)]),
	  case check_gain_cond(Conditions, Pnts) of
	    {false, Msg} -> {false, Msg};
	    _ ->
		Expend = shipping_data:get_order_expend(OrderBid),
		NewExped = case is_open_holiday(Role) of
			     1 ->
				 Discount = shipping_data:get_const(discount),
				 [{I, util:round(N * Discount / 1000)}
				  || {I, N} <- Expend];
			     _ -> Expend
			   end,
		Quality = shipping_data:get_order_quality(OrderBid),
		Loss = format:val_to_loss(NewExped, shipping_do_order),
		case role_gain:do(Role, Loss) of
		  {ok, NRole} ->
		      Now = date:unixtime(),
		      log:log_gain(Loss, Role, NRole, <<"远航接订单"/utf8>>,
				   util:fbin(lang:get(<<"Yuanhang nhận được lệnh, thời gian:~w,Đặt "
							"hàng:~w, phần thưởng:~w"/utf8>>),
					     [Now, OrderBid,
					      shipping_data:get_order_award(OrderBid)])),
		      NewList = lists:keydelete(OrderId,
						#shipping_order.order_id, List),
		      NeedTime = shipping_data:get_order_need_time(OrderBid),
		      NewOrder = Order#shipping_order{end_time =
							  Now + NeedTime,
						      assign_ids = PartnerIds,
						      status = 2},
		      NewDoList = [NewOrder | DoList],
		      NRole1 = NRole#role{m_shipping =
					      MShipping#m_shipping{free_list =
								       NewList,
								   do_list =
								       NewDoList}},
		      NRole2 = var:add_var(NRole1, day, 92, 1),
		      NewRole = role_trigger:fire(#evt_shipping{quality =
								    Quality},
						  NRole2),
		      push_order_ref(NewRole, NewOrder),
		      NewRole2 = set_timer(NewRole, NewOrder, Now),
		      NewRole3 = do_shipping_monitoring(NewRole2, OrderBid),
		      {ok, NewRole3};
		  {false, #loss{msg = Msg}} -> {false, Msg}
		end
	  end
    end.

do_shipping_monitoring(Role, OrderBid) ->
    List = [3, 10403, 14001, 10452, 10453, 10454],
    Award = shipping_data:get_order_award(OrderBid),
    case [Bid || {Bid, _} <- Award, lists:member(Bid, List)]
	of
      [_ | _] ->
	  Val = var:get_var(Role, other, 3066, 0),
	  var:set_var(Role, other, 3066, Val + 1);
      _ -> var:set_var(Role, other, 3066, 0)
    end.

-spec finish_order(#role{}, pos_integer(),
		   pos_integer()) -> {ok, #role{}} | {false, binary()}.

finish_order(Role = #role{m_shipping =
			      #m_shipping{do_list = DoList}},
	     OrderId, Type) ->
    case lists:keyfind(OrderId, #shipping_order.order_id,
		       DoList)
	of
      #shipping_order{order_bid = Bid, status = 2,
		      end_time = EndTime}
	  when Type == 1 ->
	  Now = date:unixtime(),
	  ExpendTime = max(0, EndTime - Now),
	  Expend = shipping_data:get_expend_by_time(ExpendTime),
	  Loss = format:val_to_loss([{3, Expend}],
				    shipping_do_finish_order),
	  do_finish_order(Role, Bid, OrderId, Loss,
			  <<"远航快速完成订单"/utf8>>);
      #shipping_order{order_bid = Bid, status = 3} ->
	  do_finish_order(Role, Bid, OrderId, [],
			  <<"远航完成订单"/utf8>>);
      _ ->
	  {false,
	   lang:get(<<"Không thể yêu cầu phần thưởng đơn hàng"/utf8>>)}
    end.

do_finish_order(Role = #role{m_shipping =
				 MShipping = #m_shipping{do_list = DoList}},
		Bid, OrderId, Loss, LS) ->
    Now = date:unixtime(),
    Award = shipping_data:get_order_award(Bid),
    Gain = format:val_to_gain(Award,
			      shipping_do_finish_order),
    case role_gain:do(Role, Loss) of
      {ok, Role1} ->
	  log:log_gain(Loss, Role, Role1, LS,
		       util:fbin(<<"远航完成订单,时间:~w,订单:~w"/utf8>>, [Now, Bid])),
	  case role_gain:do_notice(Role1, Gain) of
	    {ok, NRole} ->
		log:log_gain(Gain, Role1, NRole, LS,
			     util:fbin(<<"远航完成订单,时间:~w,订单:~w"/utf8>>,
				       [Now, Bid])),
		NewRole = NRole#role{m_shipping =
					 MShipping#m_shipping{do_list =
								  lists:keydelete(OrderId,
										  #shipping_order.order_id,
										  DoList)}},
		NewRole2 = del_timer(NewRole, OrderId),
		{ok, NewRole2};
	    {false, #gain{msg = Msg}} -> {false, Msg}
	  end;
      {false, #loss{msg = Msg}} -> {false, Msg}
    end.

-spec one_finish_order(#role{}) -> {ok, #role{},
				    list()} |
				   {false, binary()}.

one_finish_order(Role = #role{m_shipping =
				  MShipping = #m_shipping{do_list = DoList}}) ->
    Now = date:unixtime(),
    RewardOrderList = [{OrderId, Bid}
		       || #shipping_order{order_id = OrderId, order_bid = Bid,
					  status = Status}
			      <- DoList,
			  Status =:= 3],
    case RewardOrderList of
      [_ | _] ->
	  OrderIdList = [OrderId1
			 || {OrderId1, _} <- RewardOrderList],
	  BidList = [Bid1 || {_, Bid1} <- RewardOrderList],
	  AwardList = get_award(RewardOrderList, []),
	  Gain = format:val_to_gain(AwardList,
				    shipping_do_finish_order),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole} ->
		log:log_gain(Gain, Role, NRole, <<"远航完成订单"/utf8>>,
			     util:fbin(<<"远航完成订单一键领取,时间:~w,订单:~w"/utf8>>,
				       [Now, BidList])),
		NewDoList = del_order_ids(OrderIdList, DoList),
		NewRole = NRole#role{m_shipping =
					 MShipping#m_shipping{do_list =
								  NewDoList}},
		{ok, NewRole, OrderIdList};
	    {false, #gain{msg = Msg}} -> {false, Msg}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Hiện tại không có phần thưởng nào có "
		      "sẵn"/utf8>>)}
    end.

del_order_ids([], DoList) -> DoList;
del_order_ids([OrderId | Rest], DoList) ->
    NewDoList = lists:keydelete(OrderId,
				#shipping_order.order_id, DoList),
    del_order_ids(Rest, NewDoList).

get_award([], Acc) -> Acc;
get_award([{_, Bid} | Rest], Acc) ->
    case shipping_data:get_order_award(Bid) of
      Award = [_ | _] -> get_award(Rest, Acc ++ Award);
      _ -> get_award(Rest, Acc)
    end.

-spec refresh_orders(#role{}) -> {ok, list()}.

refresh_orders(Role = #role{m_shipping =
				MShipping = #m_shipping{rand_counts =
							    RandCounts,
							apear_list = ApearList,
							all_times = AllTime,
							free_times =
							    DayFreeCount,
							day_times = DayCount,
							coin_times =
							    DayCoinCount}}) ->
    case check_refresh_orders(Role) of
      {1, _Expend, _ItemExpend} ->
	  {NewOrders, NewNextId, RandIds} =
	      do_refresh_orders(Role, 1),
	  NewApearList = do_add_apear_count(RandIds, ApearList),
	  NewRandCounts = do_add_rand_counts(RandIds, RandCounts),
	  NewMShipping = MShipping#m_shipping{rand_counts =
						  NewRandCounts,
					      free_list = NewOrders,
					      apear_list = NewApearList,
					      next_order_id = NewNextId,
					      all_times = AllTime + 1,
					      day_times = DayCount + 1,
					      free_times = DayFreeCount + 1},
	  Role1 = Role#role{m_shipping = NewMShipping},
	  NewRole = role_trigger:fire(#evt_shipping_refresh{},
				      Role1),
	  push_shipping_info(NewRole),
	  {ok, NewRole};
      {_, Loss, LossItems} ->
	  case role_gain:do(Role, LossItems) of
	    {ok, NRole} ->
		{NewOrders, NewNextId, RandIds} =
		    do_refresh_orders(NRole, 0),
		log:log_gain(Loss, Role, NRole, <<"远航刷新订单"/utf8>>,
			     util:fbin(lang:get(<<"Tổng số chuyến đi hôm nay đã được làm "
						  "mới:~w, Thời gian rảnh rỗi:~w, Làm mới "
						  "đơn hàngbid:~w"/utf8>>),
				       [DayCount, DayFreeCount,
					[BidTemp
					 || #shipping_order{order_bid = BidTemp}
						<- NewOrders]])),
		NewApearList = do_add_apear_count(RandIds, ApearList),
		NewRandCounts = do_add_rand_counts(RandIds, RandCounts),
		NewMShipping = MShipping#m_shipping{rand_counts =
							NewRandCounts,
						    free_list = NewOrders,
						    apear_list = NewApearList,
						    next_order_id = NewNextId,
						    all_times = AllTime + 1,
						    day_times = DayCount + 1,
						    coin_times =
							DayCoinCount + 1},
		NRole1 = NRole#role{m_shipping = NewMShipping},
		NewRole = role_trigger:fire(#evt_shipping_refresh{},
					    NRole1),
		push_shipping_info(NewRole),
		RefreshBids = [OrderBidT
			       || #shipping_order{order_bid = OrderBidT}
				      <- NewOrders],
		log:log_gain(LossItems, Role, NRole, <<"远航刷新订单"/utf8>>,
			     util:fbin(lang:get(<<"Tổng số chuyến đi hôm nay đã được làm "
						  "mới:~w, Thời gian rảnh rỗi:~w，Làm cho "
						  "khỏe lạibid:~w"/utf8>>),
				       [DayCount, DayFreeCount, RefreshBids])),
		{ok, NewRole};
	    _ ->
		case role_gain:do(Role, Loss) of
		  {ok, NRole} ->
		      {NewOrders, NewNextId, RandIds} =
			  do_refresh_orders(NRole, 0),
		      log:log_gain(Loss, Role, NRole, <<"远航刷新订单"/utf8>>,
				   util:fbin(lang:get(<<"Tổng số chuyến đi hôm nay đã được làm "
							"mới:~w, Thời gian rảnh rỗi:~w, Làm mới "
							"đơn hàngbid:~w"/utf8>>),
					     [DayCount, DayFreeCount,
					      [BidTemp
					       || #shipping_order{order_bid =
								      BidTemp}
						      <- NewOrders]])),
		      NewApearList = do_add_apear_count(RandIds, ApearList),
		      NewRandCounts = do_add_rand_counts(RandIds, RandCounts),
		      NewMShipping = MShipping#m_shipping{rand_counts =
							      NewRandCounts,
							  free_list = NewOrders,
							  apear_list =
							      NewApearList,
							  next_order_id =
							      NewNextId,
							  all_times =
							      AllTime + 1,
							  day_times =
							      DayCount + 1,
							  coin_times =
							      DayCoinCount + 1},
		      NRole1 = NRole#role{m_shipping = NewMShipping},
		      NewRole = role_trigger:fire(#evt_shipping_refresh{},
						  NRole1),
		      push_shipping_info(NewRole),
		      RefreshBids = [OrderBidT
				     || #shipping_order{order_bid = OrderBidT}
					    <- NewOrders],
		      log:log_gain(Loss, Role, NRole, <<"远航刷新订单"/utf8>>,
				   util:fbin(lang:get(<<"Tổng số chuyến đi hôm nay đã được làm "
							"mới:~w, Thời gian rảnh rỗi:~w，Làm cho "
							"khỏe lạibid:~w"/utf8>>),
					     [DayCount, DayFreeCount,
					      RefreshBids])),
		      {ok, NewRole};
		  {false, #loss{msg = Msg}} -> {false, Msg}
		end
	  end;
      {false, Msg} -> {false, Msg}
    end.

check_refresh_orders(#role{lev = Lev,
			   m_vip = #m_vip{lev = VipLev},
			   m_shipping =
			       #m_shipping{free_times = DayFreeCount,
					   coin_times = DayCoinCount}}) ->
    {AllCount, Expend, FreeCount} =
	shipping_data:get_ref_info(VipLev),
    IsFree = util:if_true(DayFreeCount >= FreeCount, 0, 1),
    ItemExpend = shipping_data:get_const(refresh_cost),
    LimitLev = shipping_data:get_const(guild_lev),
    case Lev >= LimitLev of
      true ->
	  case DayCoinCount >= AllCount andalso IsFree == 0 of
	    true ->
		{false, lang:get(<<"Số lần làm mới đã hết"/utf8>>)};
	    _ ->
		Loss = format:val_to_loss(Expend,
					  shipping_refresh_orders),
		LossItems = format:val_to_loss(ItemExpend,
					       shipping_refresh_orders),
		{IsFree, Loss, LossItems}
	  end;
      _ ->
	  {false,
	   util:fbin(lang:get(<<"~wBật tính năng này"/utf8>>),
		     [LimitLev])}
    end.

do_add_apear_count(RandIds, ApearList) ->
    NApearList = [{RandId, Count + 1}
		  || {RandId, Count} <- ApearList],
    do_add_apear_count2(RandIds, NApearList).

do_add_apear_count2([], ApearList) -> ApearList;
do_add_apear_count2([RandId | RandIds], ApearList) ->
    case shipping_data:get_must_no_count(RandId) of
      T when T > 0 ->
	  do_add_apear_count2(RandIds,
			      lists:keystore(RandId, 1, ApearList,
					     {RandId, 0}));
      _ -> do_add_apear_count2(RandIds, ApearList)
    end.

do_add_rand_counts([], RandCounts) -> RandCounts;
do_add_rand_counts([RandId | RandIds], RandCounts) ->
    Count = list_util:keyfind(RandId, RandCounts, 0),
    NRandCounts = lists:keystore(RandId, 1, RandCounts,
				 {RandId, Count + 1}),
    do_add_rand_counts(RandIds, NRandCounts).

do_refresh_orders(Role = #role{m_shipping =
				   #m_shipping{rand_counts = RandCounts,
					       apear_list = ApearList,
					       day_times = DayTimes,
					       coin_times = CoinTimes,
					       all_times = AllTime,
					       next_order_id = NextId}},
		  IsFree) ->
    Num = shipping_data:get_const(max_quest),
    {RandListT, MustIds} = case AllTime == 0 of
			     true -> {shipping_data:rand_list3(), []};
			     _ ->
				 HasPrivilege1 = privilege:is_effect(Role, 2),
				 HasPrivilege2 = privilege:is_effect(Role, 3),
				 case shipping_data:get_const(refresh_bless) of
				   MustNum when MustNum > 0 ->
				       case (DayTimes + 1) rem MustNum == 0 of
					 true ->
					     {shipping_data:rand_list2(), []};
					 _ -> {shipping_data:rand_list(), []}
				       end;
				   _ when IsFree == 1 ->
				       {shipping_data:rand_list(), []};
				   _
				       when CoinTimes == 0 andalso
					      HasPrivilege1 ->
				       {shipping_data:rand_list(),
					shipping_data:get_const(refresh_vip)};
				   _
				       when CoinTimes == 2 andalso
					      HasPrivilege2 ->
				       {shipping_data:rand_list(),
					shipping_data:get_const(refresh_highvip)};
				   _ -> {shipping_data:rand_list(), []}
				 end
			   end,
    RandListT2 = [{RandId, Pro, LimitNum}
		  || {RandId, Pro, LimitNum, MustNoCount} <- RandListT,
		     MustNoCount == 0 orelse
		       list_util:keyfind(RandId, ApearList, 999) >=
			 MustNoCount],
    Fun2 = fun ({RandId, _Pro, LimitNum}, Acc) ->
		   case shipping_data:get_pro_damping(RandId) of
		     [] -> Acc;
		     L ->
			 case list_util:keyfind(RandId, RandCounts, 0) of
			   0 -> Acc;
			   Count ->
			       CountPro = list_util:keyfind(Count, L, 0),
			       lists:keyreplace(RandId, 1, Acc,
						{RandId, CountPro, LimitNum})
			 end
		   end
	   end,
    RandList = lists:foldl(Fun2, RandListT2, RandListT2),
    {MustOrders, NewNextId} = case AllTime == 0 of
				true ->
				    MustShippingIds =
					shipping_data:get_const(first_refresh),
				    Fun = fun (OrderId, {Acc1, Acc2}) ->
						  Order = to_order_info(Acc2,
									OrderId),
						  {[Order | Acc1], Acc2 + 1}
					  end,
				    lists:foldl(Fun, {[], NextId},
						MustShippingIds);
				_ -> {[], NextId}
			      end,
    do_refresh_orders(Num - length(MustOrders), NewNextId,
		      RandList, [], MustIds, MustOrders).

do_refresh_orders(0, NextId, _RandList, L, _MustIds,
		  MustOrders) ->
    {do_refresh_orders2(L, MustOrders), NextId,
     [RandId || {_, RandId} <- L]};
do_refresh_orders(Num, NextId, RandList, L, [],
		  MustOrders) ->
    Fun = fun ({RandId, Pro, LimitNum}, Acc) ->
		  RandNum = length([RandIdT
				    || {_, RandIdT} <- L, RandIdT == RandId]),
		  case RandNum >= LimitNum andalso LimitNum =/= 0 of
		    true -> Acc;
		    _ -> [{RandId, Pro, LimitNum} | Acc]
		  end
	  end,
    NRandList = lists:foldl(Fun, [], RandList),
    {Id, _, _} = util:rand_list(NRandList, 2),
    do_refresh_orders(Num - 1, NextId + 1, RandList,
		      [{NextId, Id} | L], [], MustOrders);
do_refresh_orders(Num, NextId, RandList, L,
		  [RandId | Other], MustOrders) ->
    do_refresh_orders(Num - 1, NextId + 1, RandList,
		      [{NextId, RandId} | L], Other, MustOrders).

do_refresh_orders2([], L) -> L;
do_refresh_orders2([{Id, RandId} | Other], L) ->
    RandList = shipping_data:order_rand_list(RandId),
    {OrderId, _} = util:rand_list(RandList, 2),
    Order = to_order_info(Id, OrderId),
    do_refresh_orders2(Other, [Order | L]).

to_order_info(Id, OrderId) ->
    #shipping_order{order_id = Id, order_bid = OrderId}.

set_timer(Role = #role{m_shipping =
			   #m_shipping{do_list = Orders}}) ->
    set_timer(Role, Orders).

set_timer(Role, Orders) ->
    Now = date:unixtime(), set_timer(Role, Orders, Now).

set_timer(Role, [], _Now) -> Role;
set_timer(Role, [Order | Rest], Now) ->
    NRole = set_timer(Role, Order, Now),
    set_timer(NRole, Rest, Now);
set_timer(Role,
	  #shipping_order{status = 2, order_id = OrderId,
			  end_time = EndTime},
	  Now) ->
    Timeout = max(EndTime - Now, 1),
    Timer = #timer{id = {shipping_order, OrderId},
		   timeout = Timeout * 1000, m = shipping,
		   f = order_timeout, a = [OrderId]},
    role_timer:set(Timer, Role);
set_timer(Role, _Order, _Now) -> Role.

del_timer(Role, OrderId) ->
    role_timer:del({shipping_order, OrderId}, Role).

push_order_ref(Role, Order) ->
    role:pack_send(Role, 23801, {Order}), ok.

push_shipping_info(Role = #role{m_shipping =
				    #m_shipping{free_list = FList,
						do_list = Orders,
						free_times = FTime,
						coin_times = CTime}}) ->
    role:pack_send(Role, 23800,
		   {FList ++ Orders, FTime, CTime}),
    ok.

check_gain_cond([], _Ptns) -> true;
check_gain_cond([Data | Rest], Ptns) ->
    case check_gain_cond2(Data, Ptns) of
      true -> check_gain_cond(Rest, Ptns);
      _ ->
	  {false,
	   lang:get(<<"Điều kiện giao hàng không được đáp ứng"/utf8>>)}
    end.

check_gain_cond2({partner_star, Star, Num}, Ptns) ->
    Len = length([1
		  || #partner{star = PtnStar} <- Ptns, PtnStar >= Star]),
    Len >= Num;
check_gain_cond2({partner_camp_type, CampType, Num},
		 Ptns) ->
    Len = length([1
		  || #partner{camp_type = CampTypeT} <- Ptns,
		     CampTypeT == CampType]),
    Len >= Num;
check_gain_cond2(Unknow, _Ptns) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidshipping490, _,
       {__Levelshipping490, __Tracesshipping490}}
	  when __Levelshipping490 band 8 /= 0 orelse
		 __Tracesshipping490 /= [] ->
	  lager:do_log(error,
		       [{module, shipping}, {function, check_gain_cond2},
			{line, 490}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的派遣条件:~w", [Unknow]), none, 4096, 8,
		       __Levelshipping490, __Tracesshipping490, lager_event,
		       __Pidshipping490);
      _ -> ok
    end,
    {false,
     lang:get(<<"Điều kiện điều phối không xác định"/utf8>>)}.

checkout_arge(#role{lev = Lev, name = RoleName,
		    partner_bag = #partner_bag{partner_list = PL},
		    m_shipping =
			#m_shipping{free_list = List, do_list = DoList}},
	      OrderId, PartnerIds) ->
    DoP = lists:flatten([Temp
			 || #shipping_order{assign_ids = Temp} <- DoList]),
    LimitLev = shipping_data:get_const(guild_lev),
    case Lev >= shipping_data:get_const(guild_lev) of
      true ->
	  case lists:keyfind(OrderId, #shipping_order.order_id,
			     List)
	      of
	    Order = #shipping_order{order_bid = OrderBid,
				    status = 1} ->
		LimitNum = shipping_data:get_order_limit_num(OrderBid),
		case check_sail_partner(PartnerIds, DoP, PL, [],
					RoleName)
		    of
		  {false, Msg} -> {false, Msg};
		  _ when length(PartnerIds) > LimitNum ->
		      {false,
		       lang:get(<<"Số lượng anh hùng được phái đi vượt "
				  "quá giới hạn trên"/utf8>>)};
		  {ok, Pnts} -> {ok, Pnts, Order}
		end;
	    #shipping_order{} ->
		{false, lang:get(<<"Đơn hàng đã được nhận"/utf8>>)};
	    _ ->
		{false, lang:get(<<"Không có thứ tự như vậy"/utf8>>)}
	  end;
      _ ->
	  {false,
	   util:fbin(lang:get(<<"~wBật tính năng này"/utf8>>),
		     [LimitLev])}
    end.

check_sail_partner([], _AssignIds, _Partners, Acc,
		   _RoleName) ->
    {ok, Acc};
check_sail_partner([PartnerId | Rest], AssignIds,
		   Partners, Acc, RoleName) ->
    case lists:keyfind(PartnerId, #partner.id, Partners) of
      P = #partner{name = Name} ->
	  case lists:member(PartnerId, AssignIds) of
	    false ->
		check_sail_partner(Rest, AssignIds, Partners, [P | Acc],
				   RoleName);
	    _ ->
		{false,
		 util:fbin(lang:get(<<"~tsHộ tống trong các đội điều phối khác"/utf8>>),
			   [Name])}
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
	    {__Pidshipping532, _,
	     {__Levelshipping532, __Tracesshipping532}}
		when __Levelshipping532 band 8 /= 0 orelse
		       __Tracesshipping532 /= [] ->
		lager:do_log(error,
			     [{module, shipping},
			      {function, check_sail_partner}, {line, 532},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]客户端数据含有不存在的英雄id:~w",
					   [RoleName, PartnerId]),
			     none, 4096, 8, __Levelshipping532,
			     __Tracesshipping532, lager_event,
			     __Pidshipping532);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Anh hùng hộ tống quá lười để đi"/utf8>>)}
    end.

is_open_holiday(Role) ->
    case holiday_lib:get_open_holiday(Role,
				      [7003, 97003, 997003])
	of
      #holiday{end_time = EndTime} ->
	  case EndTime - date:unixtime() - 86400 > 0 of
	    true -> 1;
	    _ -> 0
	  end;
      _ -> 0
    end.

gm_test_refresh(_Role, Num, {BidL, QualityL})
    when Num =< 0 ->
    {BidL, QualityL};
gm_test_refresh(Role = #role{m_shipping =
				 MShipping = #m_shipping{rand_counts =
							     RandCounts,
							 apear_list = ApearList,
							 all_times = AllTime,
							 free_times =
							     DayFreeCount,
							 day_times = DayCount}},
		Num, Result) ->
    {NewOrders, NewNextId, RandIds} =
	do_refresh_orders(Role, 0),
    NewApearList = do_add_apear_count(RandIds, ApearList),
    NewRandCounts = do_add_rand_counts(RandIds, RandCounts),
    NewMShipping = MShipping#m_shipping{rand_counts =
					    NewRandCounts,
					free_list = NewOrders,
					apear_list = NewApearList,
					next_order_id = NewNextId,
					all_times = AllTime + 1,
					day_times = DayCount + 1,
					free_times = DayFreeCount + 1},
    Role1 = Role#role{m_shipping = NewMShipping},
    Fun = fun (#shipping_order{order_bid = Bid},
	       {BidL, QualityL}) ->
		  Quality = shipping_data:get_order_quality(Bid),
		  {_, Num1} = list_util:keyfind(Bid, 1, BidL, {Bid, 0}),
		  {_, Num2} = list_util:keyfind(Quality, 1, QualityL,
						{Quality, 0}),
		  NewBidL = lists:keystore(Bid, 1, BidL, {Bid, Num1 + 1}),
		  NewQualityL = lists:keystore(Quality, 1, QualityL,
					       {Quality, Num2 + 1}),
		  {NewBidL, NewQualityL}
	  end,
    NewResult = lists:foldl(Fun, Result, NewOrders),
    gm_test_refresh(Role1, Num - 1, NewResult).


