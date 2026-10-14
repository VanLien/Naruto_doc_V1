-file("data/partner.erl", 1).

-file("src/mod/data/partner.erl", 1).

-module(partner).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{market_price, [base_id, price, assets, source]},
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
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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

-export([gm_set_overdue_time/2, gm_set_partner_start/3,
	 gm_add_partner_star/5, gm_del_partner_skill_pos/3,
	 init/0, init_role_partner/1, login/1, add_partners/3,
	 add_partners/5, partner_lev_up/2, get_max_lev/1,
	 partner_break/2, partner_star/5, next_attr/2,
	 do_ref_partner/2, partner_compound/3, lock/4, add_max/1,
	 init_partner/3, init_partner/5, has_partner_by_bid/2,
	 check_formation_id/2, convert_partner/3,
	 holiday_convert_partner/5, get_bag_num/1, is_lock/3,
	 max_star/1, set_overdue_timer/1, overdue/1,
	 calc_hd_3030_var/1]).

-export([push_new_partner/2, push_ref_partner/2,
	 push_all_partner/1, push_all_partner2/1,
	 push_all_partner_attr/2, push_ref_partners/2,
	 to_partner_info_p/1, to_partner_info_share_p/1,
	 push_ref_new_partner/2, push_partner_bag/1,
	 push_all_partner_list/2, check_star_limit/2]).

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

-file("src/mod/data/partner.erl", 54).

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

-file("src/mod/data/partner.erl", 55).

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

-file("src/mod/data/partner.erl", 56).

-file("inc/attr.hrl", 1).

-file("src/mod/data/partner.erl", 57).

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

-file("src/mod/data/partner.erl", 58).

-file("inc/log.hrl", 1).

-file("src/mod/data/partner.erl", 59).

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

-file("src/mod/data/partner.erl", 60).

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

-file("src/mod/data/partner.erl", 61).

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

-file("src/mod/data/partner.erl", 62).

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

-file("src/mod/data/partner.erl", 63).

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

-file("src/mod/data/partner.erl", 64).

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

-file("src/mod/data/partner.erl", 65).

-file("inc/market.hrl", 1).

-record(market_price,
	{base_id = 0, price = 0, assets = 0, source = 0}).

-file("src/mod/data/partner.erl", 66).

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

-file("src/mod/data/partner.erl", 67).

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

-file("src/mod/data/partner.erl", 68).

gm_set_partner_start(Role = #role{partner_bag =
				      PB = #partner_bag{partner_list =
							    PartnerList}},
		     Id, Star) ->
    case lists:keyfind(Id, #partner.id, PartnerList) of
      P = #partner{bid = Bid, star = OldStar, lev = OldLev} ->
	  NP = P#partner{star = Star,
			 lev =
			     min(OldLev,
				 partner_data:get_star_max_lev({Bid, Star}))},
	  NewP = partner_lib:calc_attr(Role, NP),
	  Newlist = lists:keystore(Id, #partner.id, PartnerList,
				   NewP),
	  NewPB = PB#partner_bag{partner_list = Newlist},
	  NewRole0 = Role#role{partner_bag = NewPB},
	  push_ref_partner(NewRole0, NewP),
	  NewRole1 = partner_lib:ref_formation_attr(NewRole0, Id),
	  NewRole2 = resonate_lib:do_fire_calc(NewRole1, Id),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidpartner83, _,
	     {__Levelpartner83, __Tracespartner83}}
		when __Levelpartner83 band 64 /= 0 orelse
		       __Tracespartner83 /= [] ->
		lager:do_log(info,
			     [{module, partner},
			      {function, gm_set_partner_start}, {line, 83},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]GM修改伙伴星级:~w",
					   [Role#role.name,
					    {Id, OldStar, Star, OldLev}]),
			     none, 4096, 64, __Levelpartner83,
			     __Tracespartner83, lager_event, __Pidpartner83);
	    _ -> ok
	  end,
	  {ok, NewRole2};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidpartner86, _,
	     {__Levelpartner86, __Tracespartner86}}
		when __Levelpartner86 band 64 /= 0 orelse
		       __Tracespartner86 /= [] ->
		lager:do_log(info,
			     [{module, partner},
			      {function, gm_set_partner_start}, {line, 86},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]GM尝试修改伙伴id为~w的伙伴星级失败，没有该伙伴",
					   [Role#role.name, Id]),
			     none, 4096, 64, __Levelpartner86,
			     __Tracespartner86, lager_event, __Pidpartner86);
	    _ -> ok
	  end,
	  {ok, Role}
    end.

gm_del_partner_skill_pos(Role = #role{partner_bag =
					  PB = #partner_bag{partner_list =
								PartnerList}},
			 Id, Pos) ->
    case lists:keyfind(Id, #partner.id, PartnerList) of
      P = #partner{bid = Bid, dower_skill = Skills} ->
	  NewDowerSkill = lists:keydelete(Pos, 1, Skills),
	  NewP = partner_lib:calc_attr(Role,
				       P#partner{dower_skill = NewDowerSkill}),
	  NewRole = Role#role{partner_bag =
				  PB#partner_bag{partner_list =
						     lists:keyreplace(Id,
								      #partner.id,
								      PartnerList,
								      NewP)}},
	  push_ref_partner(NewRole, NewP),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidpartner100, _,
	     {__Levelpartner100, __Tracespartner100}}
		when __Levelpartner100 band 64 /= 0 orelse
		       __Tracespartner100 /= [] ->
		lager:do_log(info,
			     [{module, partner},
			      {function, gm_del_partner_skill_pos}, {line, 100},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]GM修改伙伴天赋技能:~w",
					   [Role#role.name,
					    {Id, Bid, Pos, Skills}]),
			     none, 4096, 64, __Levelpartner100,
			     __Tracespartner100, lager_event, __Pidpartner100);
	    _ -> ok
	  end,
	  {ok, NewRole};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidpartner103, _,
	     {__Levelpartner103, __Tracespartner103}}
		when __Levelpartner103 band 64 /= 0 orelse
		       __Tracespartner103 /= [] ->
		lager:do_log(info,
			     [{module, partner},
			      {function, gm_del_partner_skill_pos}, {line, 103},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]GM修改伙伴天赋技能~w失败，没有该伙伴",
					   [Role#role.name, Id]),
			     none, 4096, 64, __Levelpartner103,
			     __Tracespartner103, lager_event, __Pidpartner103);
	    _ -> ok
	  end,
	  {ok, Role}
    end.

gm_add_partner_star(Role = #role{item_next_id = NextId,
				 partner_bag = PartnersBag},
		    Bid, Star, BreakLev, Lev) ->
    BaseData = partner_data:get_base(Bid),
    NewPartnerT = #partner{} = partner:init_partner(Role,
						    BaseData, NextId, Lev,
						    Star),
    NewPartner = partner_lib:calc_attr(Role,
				       NewPartnerT#partner{break_lev =
							       BreakLev}),
    NewPartnerList = [NewPartner
		      | PartnersBag#partner_bag.partner_list],
    NewPB = PartnersBag#partner_bag{partner_list =
					NewPartnerList},
    NewRole = Role#role{partner_bag = NewPB,
			item_next_id = NextId + 1},
    partner:push_new_partner(NewRole, [NewPartner]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner116, _,
       {__Levelpartner116, __Tracespartner116}}
	  when __Levelpartner116 band 64 /= 0 orelse
		 __Tracespartner116 /= [] ->
	  lager:do_log(info,
		       [{module, partner}, {function, gm_add_partner_star},
			{line, 116}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]GM增加指定星级伙伴:~w",
				     [Role#role.name,
				      {Bid, Star, BreakLev, Lev}]),
		       none, 4096, 64, __Levelpartner116, __Tracespartner116,
		       lager_event, __Pidpartner116);
      _ -> ok
    end,
    {ok, NewRole}.

gm_set_overdue_time(Role = #role{partner_bag =
				     PB = #partner_bag{partner_list =
							   PartnerList}},
		    Min) ->
    Now = date:unixtime(),
    Fun = fun (P = #partner{end_time = EndTime}, Acc)
		  when EndTime =/= 0 ->
		  NewP = P#partner{end_time = Now + 60 * Min},
		  push_ref_partner(Role, NewP),
		  [NewP | Acc];
	      (P, Acc) -> [P | Acc]
	  end,
    NewPL = lists:foldl(Fun, [], PartnerList),
    Role1 = Role#role{partner_bag =
			  PB#partner_bag{partner_list = NewPL}},
    NRole = set_overdue_timer(Role1),
    {ok, NRole}.

-spec init() -> #partner_bag{}.

init() ->
    #partner_bag{ver = 2,
		 num = partner_data:get_constant(initial_herobag_num),
		 partner_field = #partner_field{}}.

-spec init_role_partner(#role{}) -> #role{}.

init_role_partner(Role = #role{platform =
				   <<"verifyios">>}) ->
    Bids = list_util:rand_more(partner_data:list(),
			       util:rand(2, 6)),
    do_init_role_partner(Bids, Role);
init_role_partner(R1 = #role{sex = Sex}) ->
    InitPartner = util:if_true(Sex == 1,
			       partner_data:get_constant(hero_man),
			       partner_data:get_constant(hero_woman)),
    case add_partners(R1, InitPartner, init) of
      {false, _Msg} -> R1;
      NewRole -> NewRole
    end.

do_init_role_partner([], Role) -> Role;
do_init_role_partner([Bid | T], Role) ->
    NRole = case add_partners(Role, Bid, init) of
	      {false, _Msg} -> Role;
	      NewRole -> NewRole
	    end,
    do_init_role_partner(T, NRole).

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{lev = RoleLev, type = Type,
		   partner_bag =
		       PartnersBag = #partner_bag{buy_num = BuyNum,
						  partner_list = L,
						  partner_had =
						      HasPartners}}) ->
    Fun = fun (#partner{bid = PartnerBid, star = Star,
			end_time = 0},
	       Acc) ->
		  case lists:keyfind(PartnerBid, 1, Acc) of
		    {PartnerBid, Likes, CommentNum, OldStar} ->
			NewStar = max(OldStar, Star),
			lists:keyreplace(PartnerBid, 1, Acc,
					 {PartnerBid, Likes, CommentNum,
					  NewStar});
		    _ -> [{PartnerBid, 0, 0, Star} | Acc]
		  end;
	      (_, Acc) -> Acc
	  end,
    NewHasPartners = lists:foldl(Fun, HasPartners, L),
    NewNum = partner_data:get_constant(initial_herobag_num)
	       + BuyNum * 5,
    NewL = [partner_lib:calc_attr(Role, P) || P <- L],
    Role1 = Role#role{partner_bag =
			  PartnersBag#partner_bag{num = NewNum,
						  partner_had = NewHasPartners,
						  partner_list = NewL}},
    NRole = case Type == robot of
	      true -> Role1;
	      _ ->
		  LogRole = case var:get_var(Role1, day, 122, 0) of
			      0 when RoleLev >= 15 ->
				  var:set_var(Role1, day, 122, 1);
			      _ -> Role1
			    end,
		  {ok, HolidayVarRole} = calc_hd_3030_var(LogRole),
		  set_overdue_timer(HolidayVarRole)
	    end,
    {ok, NRole}.

calc_hd_3030_var(Role = #role{p_bag = Bag,
			      partner_bag = #partner_bag{partner_list = PL}}) ->
    case holiday_lib:get_open_holiday([3030, 93030, 993030])
	of
      #holiday{} ->
	  case var:get_var(Role, other, 3093, 0) of
	    0 ->
		case [{BidT, StarT}
		      || #partner{bid = BidT, star = StarT,
				  end_time = EndTimeT}
			     <- PL,
			 BidT == 30507 andalso
			   StarT >= 10 andalso EndTimeT == 0]
		    of
		  [] ->
		      SkinIds = partner_data:get_constant(reborn_skin_id),
		      case partner_skin:has_skin(Role,
						 [SkinIdT
						  || {SkinIdT, _} <- SkinIds])
			  of
			true -> {ok, var:set_var(Role, other, 3093, 3)};
			_ ->
			    ItemIds = [ItemIdT || {_, ItemIdT} <- SkinIds],
			    ItemNum = lists:sum([begin
						   case
						     package:count(by_base_id,
								   Bid, Bag)
						       of
						     {_, CountT} -> CountT;
						     _ -> 0
						   end
						 end
						 || Bid <- ItemIds]),
			    case ItemNum > 0 of
			      true -> {ok, var:set_var(Role, other, 3093, 3)};
			      _ -> {ok, var:set_var(Role, other, 3093, 2)}
			    end
		      end;
		  _ -> {ok, var:set_var(Role, other, 3093, 1)}
		end;
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end.

log_partner_num(Role = #role{partner_bag =
				 #partner_bag{partner_list = L}}) ->
    PartnerStarNum = calc_partner_star_num(Role, L, []),
    WorldLev = world_lev:get_world_lev(),
    Msg = util:fbin(<<"~w"/utf8>>, [WorldLev]),
    Item4Num = calc_partner_item_star_num(Role, 4),
    Item5Num = calc_partner_item_star_num(Role, 5),
    Old4Num = list_util:keyfind(4, PartnerStarNum, 0),
    NewPartnerStarNum1 = lists:keystore(4, 1,
					PartnerStarNum,
					{4, Old4Num + Item4Num}),
    Old5Num = list_util:keyfind(5, NewPartnerStarNum1, 0),
    NewPartnerStarNum2 = lists:keystore(5, 1,
					NewPartnerStarNum1,
					{5, Old5Num + Item5Num}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner240, _,
       {__Levelpartner240, __Tracespartner240}}
	  when __Levelpartner240 band 128 /= 0 orelse
		 __Tracespartner240 /= [] ->
	  lager:do_log(debug,
		       [{module, partner}, {function, log_partner_num},
			{line, 240}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("PartnerStarNum = ~w",
				     [NewPartnerStarNum2]),
		       none, 4096, 128, __Levelpartner240, __Tracespartner240,
		       lager_event, __Pidpartner240);
      _ -> ok
    end,
    [catch log:save(log_partner_num, {Role, Star, Num, Msg})
     || {Star, Num} <- NewPartnerStarNum2].

calc_partner_star_num(_Role, [], StarNums) -> StarNums;
calc_partner_star_num(Role,
		      [P = #partner{star = Star} | L], StarNums)
    when Star > 3 ->
    OldNum = list_util:keyfind(Star, StarNums, 0),
    NewStarNums = lists:keystore(Star, 1, StarNums,
				 {Star, OldNum + 1}),
    calc_partner_star_num(Role, L, NewStarNums);
calc_partner_star_num(Role, [_ | L], StarNums) ->
    calc_partner_star_num(Role, L, StarNums).

calc_partner_item_star_num(#role{p_bag = Bag}, 4) ->
    Items =
	partner_data:get_constant(hero_fragment_sign_star_4),
    ItemCount = lists:sum([begin
			     case package:count(by_base_id, Bid, Bag) of
			       {_, CountT} -> CountT;
			       _ -> 0
			     end
			   end
			   || Bid <- Items]),
    round(ItemCount / 30 * 100) / 100;
calc_partner_item_star_num(#role{p_bag = Bag}, 5) ->
    Items =
	partner_data:get_constant(hero_fragment_sign_star_5),
    ItemCount = lists:sum([begin
			     case package:count(by_base_id, Bid, Bag) of
			       {_, CountT} -> CountT;
			       _ -> 0
			     end
			   end
			   || Bid <- Items]),
    round(ItemCount / 50 * 100) / 100;
calc_partner_item_star_num(_Role, _Star) -> 0.

-spec lock(#role{}, pos_integer(), pos_integer(),
	   pos_integer()) -> {ok, #role{}} | {false, binary()}.

lock(Role, PartnerId, LockType, Type) ->
    case partner_lib:get_partner(Role, PartnerId) of
      P = #partner{is_lock = Locks} ->
	  case lists:keyfind(LockType, 1, Locks) of
	    {_, 1} when Type =/= 0 ->
		{false, lang:get(<<"该英雄已锁定"/utf8>>)};
	    {_, 0} when Type =/= 1 ->
		{false, lang:get(<<"该英雄已解锁"/utf8>>)};
	    _ when Type == 0 orelse Type == 1 ->
		NewLocks = lists:keystore(LockType, 1, Locks,
					  {LockType, Type}),
		NewPartner = P#partner{is_lock = NewLocks},
		NowRole = do_ref_partner(Role, NewPartner),
		{ok, NowRole}
	  end;
      _ -> {false, lang:get(<<"找不到该英雄"/utf8>>)}
    end.

-spec is_lock(#role{}, list() | integer(),
	      list() | integer()) -> true | {false, binary()}.

is_lock(_Role, [], _LockTypes) -> true;
is_lock(Role, [PartnerId | Ids], LockTypes) ->
    case is_lock(Role, PartnerId, LockTypes) of
      {false, Msg} -> {false, Msg};
      _ -> is_lock(Role, Ids, LockTypes)
    end;
is_lock(_Role, _PartnerId, []) -> true;
is_lock(Role, PartnerId, [LockType | LockTypes]) ->
    case is_lock(Role, PartnerId, LockType) of
      {false, Msg} -> {false, Msg};
      _ -> is_lock(Role, PartnerId, LockTypes)
    end;
is_lock(Role, PartnerId, LockType) ->
    case partner_lib:get_partner(Role, PartnerId) of
      #partner{is_lock = Locks, name = Name} ->
	  case lists:keyfind(LockType, 1, Locks) of
	    {_, 1} when LockType == 1 ->
		{false,
		 util:fbin(lang:get(<<"英雄~ts已锁定"/utf8>>), [Name])};
	    {_, 1} when LockType == 2 ->
		{false,
		 util:fbin(lang:get(<<"英雄~ts置换操作未完成"/utf8>>), [Name])};
	    _ -> true
	  end;
      _ -> {false, lang:get(<<"找不到该英雄"/utf8>>)}
    end.

-spec add_max(#role{}) -> {ok, #role{}} |
			  {false, binary()}.

add_max(Role = #role{partner_bag =
			 PB = #partner_bag{buy_num = BuyNum, num = Num}}) ->
    NewNum = Num + get_bag_num(Role),
    case partner_data:get_buy_num_info(BuyNum + 1) of
      {Expend, AddNum} ->
	  Loss = format:val_to_loss(Expend, partner_add_max),
	  case role_gain:do(Role, Loss) of
	    {ok, NRole} ->
		log:log_gain(Loss, Role, NRole, <<"英雄扩容"/utf8>>,
			     util:fbin("英雄 ~w", [BuyNum])),
		NewRole = NRole#role{partner_bag =
					 PB#partner_bag{buy_num = BuyNum + 1,
							num = Num + AddNum}},
		{ok, NewRole, NewNum + AddNum, BuyNum + 1};
	    {false, #loss{msg = Msg}} -> {false, Msg}
	  end;
      _ -> {false, lang:get(<<"已达扩容上限"/utf8>>)}
    end.

-spec add_partners(#role{}, pos_integer(),
		   atom()) -> #role{}.

add_partners(Role, Id, FromFlag) ->
    case partner_data:get_base(Id) of
      #partner_base_data{init_star = InitStar} ->
	  add_partners(Role, Id, FromFlag, 1, InitStar);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidpartner341, _,
	     {__Levelpartner341, __Tracespartner341}}
		when __Levelpartner341 band 8 /= 0 orelse
		       __Tracespartner341 /= [] ->
		lager:do_log(error,
			     [{module, partner}, {function, add_partners},
			      {line, 341}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("add partner bid error ~w", [Id]),
			     none, 4096, 8, __Levelpartner341,
			     __Tracespartner341, lager_event, __Pidpartner341);
	    _ -> ok
	  end,
	  {false, lang:get(<<"没有该英雄配置"/utf8>>)}
    end.

-spec add_partners(#role{}, pos_integer(), atom(),
		   pos_integer(), pos_integer()) -> #role{}.

add_partners(Role, Id, FromFlag, InitLev, InitStar) ->
    notice_extra_partner_add(Role, Id, 0, FromFlag,
			     InitStar),
    do_add_partner(Role, Id, InitLev, InitStar).

do_add_partner(Role = #role{id = Rid, name = RoleName,
			    item_next_id = NextId,
			    partner_bag =
				PartnersBag = #partner_bag{num = Num,
							   partner_list = List,
							   partner_had =
							       HasPartners}},
	       PartnerBid, InitLev, InitStar) ->
    NewNum = Num + get_bag_num(Role),
    case NewNum > length(List) of
      true ->
	  case partner_data:get_base(PartnerBid) of
	    BaseData = #partner_base_data{camp_type = CampType} ->
		NewPartner = #partner{} = init_partner(Role, BaseData,
						       NextId, InitLev,
						       InitStar),
		NewPartnerList = [NewPartner
				  | PartnersBag#partner_bag.partner_list],
		NewPB = PartnersBag#partner_bag{partner_list =
						    NewPartnerList,
						partner_had =
						    add_partner_had(HasPartners,
								    PartnerBid,
								    InitStar)},
		Role1 = Role#role{partner_bag = NewPB,
				  item_next_id = NextId + 1},
		FireRole = role_trigger:fire(#evt_partner{}, Role1),
		NRole = role_looks:activate(FireRole, PartnerBid,
					    InitStar),
		push_new_partner(NRole, [NewPartner]),
		catch log:save(log_partner, {Role, NewPartner}),
		Evts = [#evt_partner{ext =
					 #{star => InitStar,
					   camp_type => CampType}},
			#evt_partner_star{star = InitStar},
			#evt_partner_add_new{star = InitStar},
			#r_evt_partner_get{cache =
					       #{bid => PartnerBid,
						 star => InitStar}},
			#evt_add_new_partner_bi_bid{bid = PartnerBid,
						    star = InitStar}],
		NRole1 = case InitStar =:= 5 of
			   true ->
			       role_weekly:fire(NRole,
						{add_partner, [PartnerBid]});
			   _ -> NRole
			 end,
		NewRoleT = role_trigger:fire(Evts, NRole1),
		case get(draw_process_partners) of
		  L when is_list(L) ->
		      put(draw_process_partners,
			  [{PartnerBid, InitStar} | L]);
		  _ -> ok
		end,
		NewRoleT;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidpartner382, _,
		   {__Levelpartner382, __Tracespartner382}}
		      when __Levelpartner382 band 8 /= 0 orelse
			     __Tracespartner382 /= [] ->
		      lager:do_log(error,
				   [{module, partner},
				    {function, do_add_partner}, {line, 382},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("add partner bid error ~w",
						 [PartnerBid]),
				   none, 4096, 8, __Levelpartner382,
				   __Tracespartner382, lager_event,
				   __Pidpartner382);
		  _ -> ok
		end,
		{false,
		 lang:get(<<"Không có cấu hình cho hero này"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Ba lô anh hùng đã đầy, không thể lấy "
		      "được anh hùng."/utf8>>)}
    end.

add_partner_had(HasPartners, PartnerBid, InitStar) ->
    case lists:keyfind(PartnerBid, 1, HasPartners) of
      {PartnerBid, _, _, OldStar} when InitStar =< OldStar ->
	  HasPartners;
      {PartnerBid, Likes, CommentNum, OldStar} ->
	  lists:keystore(PartnerBid, 1, HasPartners,
			 {PartnerBid, Likes, CommentNum, InitStar});
      _ ->
	  lists:keystore(PartnerBid, 1, HasPartners,
			 {PartnerBid, 0, 0, InitStar})
    end.

init_partner(Role,
	     P = #partner_base_data{init_lev = InitLev,
				    init_star = InitStar},
	     NextId) ->
    init_partner(Role, P, NextId, InitLev, InitStar).

init_partner(Role,
	     #partner_base_data{bid = Bid, name = Name,
				camp_type = CampType, type = PartnerType,
				rare_type = RareType},
	     NextId, SetLev, InitStar) ->
    Skills = partner_data:get_skills({Bid, InitStar}),
    P1 = #partner{id = NextId, bid = Bid,
		  camp_type = CampType, lev = SetLev, name = Name,
		  star = InitStar, type = PartnerType, skills = Skills,
		  rare_type = RareType, step_attr = #attr{},
		  add_star = InitStar},
    partner_lib:calc_attr(Role, P1).

notice_extra_partner_add(Role, PartnerBid, IsChips,
			 Source, InitStar) ->
    case lists:member(Source,
		      [init, make_recruit, partner_compose])
	of
      false ->
	  case Source == partner_compose_special of
	    true ->
		sys_conn:pack_send(11095,
				   {PartnerBid, IsChips, InitStar, 1});
	    _ ->
		sys_conn:pack_send(11095,
				   {PartnerBid, IsChips, InitStar, 0})
	  end;
      true -> ok
    end.

do_ref_partner(Role = #role{partner_bag =
				PB = #partner_bag{partner_list = PartnerList}},
	       Partner) ->
    NewPartner = #partner{id = PartnerId} =
		     partner_lib:calc_attr(Role, Partner),
    NewPB = PB#partner_bag{partner_list =
			       lists:keystore(PartnerId, #partner.id,
					      PartnerList, NewPartner)},
    NewRole0 = Role#role{partner_bag = NewPB},
    push_ref_partner(NewRole0, NewPartner),
    NewRole = partner_lib:ref_formation_attr(NewRole0,
					     PartnerId),
    NewRole.

-spec partner_lev_up(#role{}, pos_integer()) -> {ok,
						 #role{}} |
						{false, bitstring()}.

partner_lev_up(Role, PartnerId) ->
    case check_can_lev_up(Role, PartnerId) of
      {ok, P = #partner{bid = PartnerBid, lev = Lev}, Expend,
       UpLev} ->
	  Loss = format:val_to_loss(Expend, partner_lev_up),
	  case role_gain:do(Role, Loss) of
	    {ok, NRole} ->
		NewPartner = P#partner{lev = Lev + UpLev},
		NewRole1 = do_ref_partner(NRole, NewPartner),
		NewRole2 = cystal_resonate:fire(NewRole1),
		NewRole = role_trigger:fire([#evt_partner_levelup{bid =
								      PartnerBid,
								  lev =
								      Lev +
									UpLev},
					     #evt_partner{}],
					    NewRole2),
		log:log_gain(Loss, Role, NewRole, <<"伙伴升级"/utf8>>,
			     util:fbin("英雄升级, id:~w, bid:~w, lev:~w  uplev:~w",
				       [PartnerId, PartnerBid, Lev, UpLev])),
		log:save(partner,
			 {NewRole, P, NewPartner, lang:get(<<"升级"/utf8>>),
			  util:fbin("~w级", [NewPartner#partner.lev])}),
		{ok, NewRole};
	    {false, #loss{msg = Msg}} -> {false, Msg}
	  end;
      {false, Msg} -> {false, Msg}
    end.

check_can_lev_up(Role = #role{assets =
				  #assets{coin = Coin, hero_exp = Exp}},
		 PartnerId) ->
    case partner_lib:get_partner(Role, PartnerId) of
      #partner{end_time = EndTime} when EndTime =/= 0 ->
	  {false,
	   lang:get(<<"Anh hùng được trao quyền không thể được "
		      "nâng cấp"/utf8>>)};
      #partner{resonate_lev = ResLev} when ResLev =/= 0 ->
	  {false,
	   lang:get(<<"Anh hùng cộng hưởng không thể được nâng "
		      "cấp"/utf8>>)};
      P = #partner{lev = Lev} when Lev >= 60 ->
	  case check_max_lev(P) of
	    false ->
		case partner_data:get_lev_expend(Lev) of
		  Expend = [_ | _] -> {ok, P, Expend, 1};
		  _ -> {false, lang:get(<<"Lỗi tham số"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"Đã đầy đủ cấp độ"/utf8>>)}
	  end;
      P = #partner{lev = Lev} ->
	  MaxLev = get_max_lev(P),
	  case Lev >= MaxLev of
	    false ->
		{Expend, UpLev} = get_partner_lev_p_expend({Coin, Exp,
							    0, 0},
							   Lev, MaxLev, 5, [],
							   0),
		{ok, P, Expend, UpLev};
	    _ -> {false, lang:get(<<"Đã đầy đủ cấp độ"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Anh hùng không thể được tìm thấy"/utf8>>)}
    end.

get_partner_lev_p_expend(_, Lev, MaxLev, LimitLevUp,
			 Expends, UpLev)
    when LimitLevUp == UpLev orelse Lev == MaxLev ->
    {Expends, UpLev};
get_partner_lev_p_expend({Coin, Exp, ExpendCoin,
			  ExpendExp},
			 Lev, MaxLev, LimitLevUp, Expends, UpLev) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner481, _,
       {__Levelpartner481, __Tracespartner481}}
	  when __Levelpartner481 band 128 /= 0 orelse
		 __Tracespartner481 /= [] ->
	  lager:do_log(debug,
		       [{module, partner},
			{function, get_partner_lev_p_expend}, {line, 481},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("一键升级:~w",
				     [{Lev, MaxLev, LimitLevUp, UpLev,
				       {Coin, Exp, ExpendCoin, ExpendExp}}]),
		       none, 4096, 128, __Levelpartner481, __Tracespartner481,
		       lager_event, __Pidpartner481);
      _ -> ok
    end,
    Expend = partner_data:get_lev_expend(Lev),
    NeedCoin = list_util:keyfind(1, Expend, 0),
    NeedExp = list_util:keyfind(22, Expend, 0),
    NExpendCoin = ExpendCoin + NeedCoin,
    NExpendExp = ExpendExp + NeedExp,
    NExpends = item_lib:merge(Expend, Expends),
    case Coin < NExpendCoin orelse Exp < NExpendExp of
      true when Expends == [] -> {NExpends, max(1, UpLev)};
      true -> {Expends, max(1, UpLev)};
      _ ->
	  get_partner_lev_p_expend({Coin, Exp, NExpendCoin,
				    NExpendExp},
				   Lev + 1, MaxLev, LimitLevUp, NExpends,
				   UpLev + 1)
    end.

-spec check_formation_id(#role{}, list()) -> true |
					     false.

check_formation_id(Role, Ids) ->
    FormationIds = formation_lib:list_partners(Role),
    case [IdT
	  || IdT <- Ids, lists:member(IdT, FormationIds)]
	of
      [_ | _] ->
	  {false, lang:get(<<"Có ninja ở trên trận"/utf8>>)};
      _ ->
	  #formation_sys{pos_info = PosInfo} =
	      formation:get_sys_formation(Role, 1),
	  ArenaIds = [ParId
		      || #formation_pos{id = ParId} <- PosInfo],
	  case [IdT || IdT <- Ids, lists:member(IdT, ArenaIds)] of
	    [_ | _] ->
		{false,
		 lang:get(<<"Có ninja đang lên trận ở đấu trường "
			    "phòng thủ"/utf8>>)};
	    _ ->
		ArenaEliteIds = arena_elite_lib:get_formation_ids(Role),
		case [IdT
		      || IdT <- Ids, lists:member(IdT, ArenaEliteIds)]
		    of
		  [_ | _] ->
		      {false,
		       lang:get(<<"Tháo ninja khỏi đội hình xếp hạng đỉnh "
				  "cao"/utf8>>)};
		  _ ->
		      ArenaClusterIds = arena_cluster:get_formation_ids(Role),
		      case [IdT
			    || IdT <- Ids, lists:member(IdT, ArenaClusterIds)]
			  of
			[_ | _] ->
			    {false,
			     lang:get(<<"Tháo ninja khỏi đội hình liên server"/utf8>>)};
			_ ->
			    ResonateIds = cystal_resonate:get_ids(Role),
			    case [IdT
				  || IdT <- Ids, lists:member(IdT, ResonateIds)]
				of
			      [_ | _] ->
				  {false,
				   lang:get(<<"Có một anh hùng trong slot Force Crystal"/utf8>>)};
			      _ ->
				  ArenaTeamIds =
				      arena_team_member:get_formation_ids(Role),
				  case [IdT
					|| IdT <- Ids,
					   lists:member(IdT, ArenaTeamIds)]
				      of
				    [_ | _] ->
					{false,
					 lang:get(<<"Tháo ninja khỏi đội hình nindo"/utf8>>)};
				    _ ->
					ArenaPeakIds =
					    arena_peak_champion:get_formation_ids(Role),
					case [IdT
					      || IdT <- Ids,
						 lists:member(IdT,
							      ArenaPeakIds)]
					    of
					  [_ | _] ->
					      {false,
					       lang:get(<<"Tháo ninja khỏi đội hình nindo đỉnh "
							  "cao"/utf8>>)};
					  _ -> true
					end
				  end
			    end
		      end
		end
	  end
    end.

-spec next_attr(#role{}, pos_integer()) -> #attr{}.

next_attr(Role, PartnerId) ->
    case partner_lib:get_partner(Role, PartnerId) of
      P = #partner{break_lev = BreakLev} ->
	  MaxBreakLev = partner_lib:get_partner_break_max_lev(P),
	  case BreakLev >= MaxBreakLev of
	    true -> #attr{};
	    _ ->
		#partner{base_attr = BaseAttr} =
		    partner_lib:calc_attr(Role,
					  P#partner{break_lev = BreakLev + 1}),
		BaseAttr
	  end;
      _ -> #attr{}
    end.

-spec partner_break(#role{}, pos_integer()) -> {ok,
						#role{}} |
					       {false, bitstring()}.

partner_break(Role, PartnerId) ->
    case check_can_break(Role, PartnerId) of
      {ok, P = #partner{bid = PartnerBid, break_lev = Lev},
       Expend} ->
	  Loss = format:val_to_loss(Expend, partner_lev_up),
	  case role_gain:do(Role, Loss,
			    #gain_loss_opts{need_notify_fail_item = true})
	      of
	    {ok, NRole, _} ->
		NewPartner = P#partner{break_lev = Lev + 1},
		NewRole1 = do_ref_partner(NRole, NewPartner),
		NewRole2 = cystal_resonate:fire(NewRole1),
		NewRole = role_trigger:fire([#evt_partner{},
					     #evt_partner_advance{}],
					    NewRole2),
		log:log_gain(Loss, Role, NewRole, <<"英雄进阶"/utf8>>,
			     util:fbin("英雄进阶, id:~w, bid:~w, lev:~w",
				       [PartnerId, PartnerBid, Lev])),
		log:save(partner,
			 {NewRole, P, NewPartner, lang:get(<<"đột phá"/utf8>>),
			  util:fbin("~w级", [Lev])}),
		{ok, NewRole};
	    {false, #loss{msg = Msg}} -> {false, Msg}
	  end;
      {false, Msg} -> {false, Msg}
    end.

check_can_break(Role, PartnerId) ->
    case partner_lib:get_partner(Role, PartnerId) of
      #partner{end_time = EndTime} when EndTime =/= 0 ->
	  {false,
	   lang:get(<<"Anh hùng được trao quyền không thể thăng "
		      "tiến"/utf8>>)};
      #partner{resonate_lev = ResLev} when ResLev =/= 0 ->
	  {false,
	   lang:get(<<"Anh hùng cộng hưởng không thể vượt qua"/utf8>>)};
      P = #partner{type = Type, bid = Bid, star = Star,
		   break_lev = Lev} ->
	  MaxBreakLev = partner_lib:get_partner_break_max_lev(P),
	  case Lev >= MaxBreakLev of
	    true ->
		{false, lang:get(<<"Đã đạt đến giới hạn trên"/utf8>>)};
	    _ ->
		case check_max_lev(P) of
		  true ->
		      #partner_base_data{break_id = BreakId} =
			  partner_data:get_base(Bid),
		      case partner_data:get_break_limit({Type, BreakId,
							 Lev + 1})
			  of
			[{star, NeedStar}] when NeedStar > Star ->
			    {false, lang:get(<<"Không đủ sao"/utf8>>)};
			_ ->
			    case partner_data:get_break_expend({Type, BreakId,
								Lev})
				of
			      Expend = [_ | _] -> {ok, P, Expend};
			      _ -> {false, lang:get(<<"Lỗi tham số"/utf8>>)}
			    end
		      end;
		  _ ->
		      {false,
		       lang:get(<<"Chỉ khi bạn ở cấp độ đầy đủ, bạn mới "
				  "có thể thăng tiến"/utf8>>)}
		end
	  end;
      _ ->
	  {false,
	   lang:get(<<"Anh hùng không thể được tìm thấy"/utf8>>)}
    end.

-spec partner_star(#role{}, pos_integer(), list(),
		   list(), list()) -> {false, binary()} | {ok, #role{}}.

partner_star(Role, PartnerId, Add1, Add2, ItemExpend) ->
    case check_ids(Role, PartnerId, Add1, Add2) of
      {ok, P = #partner{star = Star, bid = Bid}, AddP1, AddP2,
       OtherList, AddLists, AddItems} ->
	  case partner_data:get_star_expend({Bid, Star + 1}) of
	    {_, Expend1, Expend2}
		when Expend1 =/= [] orelse Expend2 =/= [] ->
		case get_items(ItemExpend, []) of
		  {ok, ItemsPartner} ->
		      case check_expend(AddP1, AddP2, Expend1, Expend2,
					ItemsPartner)
			  of
			{false, Msg} -> {false, Msg};
			_ ->
			    OtherExpend =
				partner_data:get_star_other_expend({Bid,
								    Star + 1}),
			    Loss = format:val_to_loss(OtherExpend ++ ItemExpend,
						      partner_star),
			    Gain = format:val_to_gain(AddLists ++ AddItems,
						      partner_star),
			    case role_gain:do_notice(Role, Loss ++ Gain,
						     #gain_loss_opts{need_notify_fail_item
									 =
									 true})
				of
			      {ok, NRole} ->
				  PartnerIds = [{BidT, LevT, StarT, BreakT}
						|| #partner{bid = BidT,
							    star = StarT,
							    lev = LevT,
							    break_lev = BreakT}
						       <- AddP1 ++ AddP2],
				  log:save(partner_star,
					   {Role,
					    util:fbin(lang:get(<<"英雄bid:~w, 伙伴ID:~w, 星级:~w, 消耗伙伴id:~w"/utf8>>),
						      [Bid, PartnerId, Star,
						       PartnerIds])}),
				  log:log_gain(Loss ++ Gain, Role, NRole,
					       <<"伙伴升星"/utf8>>,
					       util:fbin(lang:get(<<"英雄bid:~w, 伙伴ID:~w, 星级:~w, 消耗伙伴id:~w"/utf8>>),
							 [Bid, PartnerId, Star,
							  PartnerIds])),
				  do_partner_star(NRole, P, OtherList,
						  PartnerId, Add1 ++ Add2);
			      {false, #loss{msg = Msg}} -> {false, Msg};
			      {false, #gain{msg = Msg}} -> {false, Msg}
			    end
		      end;
		  {false, Msg} -> {false, Msg};
		  _ ->
		      {false,
		       lang:get(<<"Lỗi tham số, không thể nâng cấp sao"/utf8>>)}
		end;
	    _ ->
		{false,
		 lang:get(<<"Lỗi tham số, anh hùng không thể nâng "
			    "cấp lên sao"/utf8>>)}
	  end;
      {false, Msg} -> {false, Msg}
    end.

do_partner_star(Role = #role{partner_bag = PB},
		P = #partner{bid = PartnerBid, star = Star,
			     camp_type = CampType},
		OtherList, PartnerId, Add) ->
    NewP = partner_lib:calc_attr(Role,
				 P#partner{star = Star + 1}),
    Newlist = lists:keystore(PartnerId, #partner.id,
			     OtherList, NewP),
    NewPB = PB#partner_bag{partner_list = Newlist,
			   partner_had =
			       add_partner_had(PB#partner_bag.partner_had,
					       PartnerBid, Star + 1)},
    NewRole0 = Role#role{partner_bag = NewPB},
    push_ref_partner(NewRole0, NewP),
    NewRole1 = partner_lib:ref_formation_attr(NewRole0,
					      PartnerId),
    NewStar = Star + 1,
    NewRole2 = role_looks:activate(NewRole1, PartnerBid,
				   NewStar),
    NewRole3 = resonate_lib:do_fire_calc(NewRole2,
					 PartnerId),
    NewRole4 = case NewStar =:= 5 of
		 true ->
		     role_weekly:fire(NewRole3, {add_partner, [PartnerBid]});
		 _ -> NewRole3
	       end,
    NewRole5 =
	cystal_resonate:fire_cystal_max_lev(NewRole4),
    NewRole6 = cystal_resonate:fire(NewRole5),
    NewRole8 = case Star + 1 >= 6 of
		 true ->
		     NewRole7 = var:set_var(NewRole6, other, 3112,
					    var:get_var(NewRole6, other, 3112,
							0)
					      + 1),
		     gift_trigger:fire(NewRole7, hero_upstar_every, []);
		 _ -> NewRole6
	       end,
    NewRole = role_trigger:fire([#evt_partner{ext =
						  #{star => NewStar,
						    camp_type => CampType}},
				 #evt_partner_star_up{bid = PartnerBid,
						      star = NewStar},
				 #evt_partner_star{star = NewStar},
				 #evt_partner_add_new{star = NewStar},
				 #r_evt_hero_compose{cache =
							 #{bid => PartnerBid,
							   star => NewStar}},
				 #r_evt_partner_get{cache =
							#{bid => PartnerBid,
							  star => NewStar}},
				 #evt_add_new_partner_bi_bid{bid = PartnerBid,
							     star = NewStar}],
				NewRole8),
    do_msg(NewRole, NewP),
    sys_conn:pack_send(11006, {Add}),
    log:save(partner,
	     {NewRole, P, NewP, lang:get(<<"升星"/utf8>>),
	      util:fbin("~w星", [NewStar])}),
    {ok, NewRole}.

check_ids(Role = #role{partner_bag =
			   #partner_bag{partner_list = List}},
	  PartnerId, Add1, Add2) ->
    case get_partners(List, Add1, []) of
      {false, Msg} -> {false, Msg};
      {ok, NewAdd1, List1} ->
	  case get_partners(List1, Add2, []) of
	    {false, Msg} -> {false, Msg};
	    {ok, NewAdd2, List2} ->
		case check_ids_lock(Role, PartnerId, Add1, Add2) of
		  {false, Msg} -> {false, Msg};
		  _ ->
		      case check_formation_id(Role, Add1 ++ Add2) of
			{false, Msg} -> {false, Msg};
			_ ->
			    case lists:keyfind(PartnerId, #partner.id, List2) of
			      #partner{end_time = EndTime} when EndTime =/= 0 ->
				  {false,
				   lang:get(<<"Anh hùng được trao quyền không thể được "
					      "nâng cấp lên sao"/utf8>>)};
			      P = #partner{star = Star, bid = Bid} ->
				  MaxStar = max_star(Bid),
				  case MaxStar =< Star of
				    true ->
					{false,
					 lang:get(<<"Người anh hùng đầy sao"/utf8>>)};
				    _ ->
					case check_star_limit(Role, Star + 1) of
					  {false, Msg} -> {false, Msg};
					  _ ->
					      {ok, AddLists, AddItems} =
						  partner_decompose:partner_decompose_info(Role,
											   Add1
											     ++
											     Add2,
											   [],
											   []),
					      {ok, P, NewAdd1, NewAdd2, List2,
					       AddLists, AddItems}
					end
				  end;
			      _ ->
				  {false,
				   lang:get(<<"Lỗi tham số, không tìm thấy anh hùngid"/utf8>>)}
			    end
		      end
		end
	  end
    end.

check_ids_lock(Role, PartnerId, Add1, Add2) ->
    case is_lock(Role, PartnerId, [2]) of
      {false, Msg} -> {false, Msg};
      _ ->
	  case is_lock(Role, Add1 ++ Add2, [1, 2]) of
	    {false, Msg} -> {false, Msg};
	    _ -> ok
	  end
    end.

check_expend(Add1, Add2, Expend1, Expend2,
	     ItemExpend) ->
    case check_expend1(Add1, Expend1) of
      {false, Msg} -> {false, Msg};
      _ ->
	  case check_expend(Add2, Expend2, ItemExpend) of
	    {false, Msg} -> {false, Msg};
	    _ -> ok
	  end
    end.

check_expend1([], []) -> ok;
check_expend1(Add, [{Bid, Star, Num} | Expend]) ->
    L = [P
	 || P = #partner{bid = BidT, star = StarT} <- Add,
	    StarT == Star andalso Bid == BidT],
    case length(L) == Num of
      true -> check_expend1(Add -- L, Expend);
      _ ->
	  {false,
	   lang:get(<<"Nâng cấp sao không thành công, lượng "
		      "tiêu thụ sai"/utf8>>)}
    end;
check_expend1(Add, Expend) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner763, _,
       {__Levelpartner763, __Tracespartner763}}
	  when __Levelpartner763 band 8 /= 0 orelse
		 __Tracespartner763 /= [] ->
	  lager:do_log(error,
		       [{module, partner}, {function, check_expend1},
			{line, 763}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("消耗数量选择过多:~w ~w", [Add, Expend]), none,
		       4096, 8, __Levelpartner763, __Tracespartner763,
		       lager_event, __Pidpartner763);
      _ -> ok
    end,
    {false,
     lang:get(<<"Nâng cấp sao không thành công, có quá "
		"nhiều lựa chọn tiêu dùng."/utf8>>)}.

check_expend([], [], []) -> ok;
check_expend(Add, [{CampType, Star, Num} | Expend],
	     ItemExpend) ->
    L1 = [P
	  || P = #partner{camp_type = CampTypeT, star = StarT}
		 <- Add,
	     StarT == Star andalso
	       (CampType == 0 orelse CampTypeT == CampType)],
    L2 = [T
	  || T = {CampTypeT, StarT} <- ItemExpend,
	     StarT == Star andalso
	       (CampType == 0 orelse CampTypeT == CampType)],
    L = L1 ++ L2,
    case length(L) == Num of
      true ->
	  check_expend(Add -- L1, Expend, ItemExpend -- L2);
      _ ->
	  {false,
	   lang:get(<<"Nâng cấp sao không thành công, lượng "
		      "tiêu thụ sai"/utf8>>)}
    end;
check_expend(Add, Expend, ItemExpend) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner778, _,
       {__Levelpartner778, __Tracespartner778}}
	  when __Levelpartner778 band 8 /= 0 orelse
		 __Tracespartner778 /= [] ->
	  lager:do_log(error,
		       [{module, partner}, {function, check_expend},
			{line, 778}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("消耗数量选择过多:~w ~w ~w",
				     [Add, Expend, ItemExpend]),
		       none, 4096, 8, __Levelpartner778, __Tracespartner778,
		       lager_event, __Pidpartner778);
      _ -> ok
    end,
    {false,
     lang:get(<<"Nâng cấp sao không thành công, có quá "
		"nhiều lựa chọn tiêu dùng."/utf8>>)}.

get_partners(List, [], L) -> {ok, L, List};
get_partners(List, [Id | Ids], L) ->
    case lists:keytake(Id, #partner.id, List) of
      {value, #partner{end_time = EndTime}, _Other}
	  when EndTime =/= 0 ->
	  {false,
	   lang:get(<<"Các anh hùng được cường hóa không thể "
		      "được sử dụng làm nguyên liệu nâng cấp "
		      "sao"/utf8>>)};
      {value, P, Other} -> get_partners(Other, Ids, [P | L]);
      _ ->
	  {false,
	   lang:get(<<"Lỗi tham số. Không thể tìm thấy anh "
		      "hùng."/utf8>>)}
    end.

get_items([], L) -> {ok, L};
get_items([{BaseId, Num} | Ids], L) ->
    case item_data:get(BaseId) of
      #item_base{type = 29} ->
	  {CampType, Star} = item_data:get_hero_hun(BaseId),
	  NewL = [{CampType, Star} || _I <- lists:seq(1, Num)],
	  get_items(Ids, NewL ++ L);
      _ ->
	  {false,
	   lang:get(<<"Lỗi tham số Không thể tìm thấy mục này"/utf8>>)}
    end.

max_star(Bid) ->
    lists:max(partner_data:get_stars_by_bid(Bid)).

check_star_limit(Role, 11) ->
    NeedWorldLev =
	partner_data:get_constant(staropen11_world_lev),
    NeedRoleLev =
	partner_data:get_constant(staropen11_player_lev),
    OtherLimit =
	partner_data:get_constant(staropen11_3rd_open_limit),
    case role_misc:check_open_cond(OtherLimit, Role) of
      {false, Msg} ->
	  case role_misc:check_open_cond([NeedWorldLev], Role) of
	    {false, _Msg} ->
		case role_misc:check_open_cond([NeedRoleLev], Role) of
		  {false, Msg} -> {false, Msg};
		  _ -> true
		end;
	    _ -> true
	  end;
      _ -> true
    end;
check_star_limit(Role, 12) ->
    NeedWorldLev =
	partner_data:get_constant(staropen12_world_lev),
    NeedRoleLev =
	partner_data:get_constant(staropen12_player_lev),
    OtherLimit =
	partner_data:get_constant(staropen12_3rd_open_limit),
    case role_misc:check_open_cond(OtherLimit, Role) of
      {false, Msg} ->
	  case role_misc:check_open_cond([NeedWorldLev], Role) of
	    {false, _Msg} ->
		case role_misc:check_open_cond([NeedRoleLev], Role) of
		  {false, Msg} -> {false, Msg};
		  _ -> true
		end;
	    _ -> true
	  end;
      _ -> true
    end;
check_star_limit(Role = #role{partner_bag =
				  #partner_bag{partner_had = HasList}},
		 13) ->
    LimitLev1 =
	partner_data:get_constant(staropen13_limit_lev1),
    LimitLev2 =
	partner_data:get_constant(staropen13_limit_lev2),
    {HadStar, HadSatrNum} =
	partner_data:get_constant(staropen13_limit_partner),
    OtherLimit =
	partner_data:get_constant(staropen13_3rd_open_limit),
    case role_misc:check_open_cond(OtherLimit, Role) of
      {false, Msg} ->
	  case length([{Id, Star}
		       || {Id, _, _, Star} <- HasList, Star >= HadStar])
		 >= HadSatrNum
	      of
	    true ->
		case role_misc:check_open_cond(LimitLev1, Role) of
		  {false, _Msg} ->
		      case role_misc:check_open_cond([LimitLev2], Role) of
			{false, Msg} ->
			    {false,
			     lang:get(<<"Điều kiện nâng 13 sao：\n1.Có 2 ninja "
					"12 sao\n2.Cấp độ đạt 100 hoặc cấp độ "
					"liên server đạt 100!!"/utf8>>)};
			_ -> true
		      end;
		  _ -> true
		end;
	    _ ->
		{false,
		 lang:get(<<"Điều kiện nâng 13 sao：\n1.Có 2 ninja "
			    "12 sao\n2.Cấp độ đạt 100 hoặc cấp độ "
			    "liên server đạt 100!!"/utf8>>)}
	  end;
      _ -> true
    end;
check_star_limit(_, _) -> true.

do_msg(Role, #partner{name = Name, star = 6}) ->
    Msg =
	color:msg(lang:get(<<"Chúc mừng, nhẫn giả ~ts hợp thành ~ts "
			     "ninja ~ts lực chiến tăng mạnh！"/utf8>>),
		  [{role, Role#role.name}, {red, 6}, {red, Name}]),
    notice:broadcast(rumor_left_top, Msg);
do_msg(Role, #partner{name = Name, star = Star})
    when Star > 6 andalso Star < 10 ->
    Msg =
	color:msg(lang:get(<<"Bạn bè của tôi đang choáng váng, nhận "
			     "giả ~ts đã nâng sao thành công ninja "
			     "~ts lên ~ts sao，lực chiến tăng mạnh!"/utf8>>),
		  [{role, Role#role.name}, {red, Name}, {red, Star}]),
    notice:broadcast(rumor_left_top, Msg);
do_msg(Role, #partner{name = Name, star = 10}) ->
    Msg =
	color:msg(lang:get(<<"Trời đất rung chuyển, nhẫn giả ~ts đã "
			     "nâng sao thành công anh hùng ~ts lên "
			     "~ts sao, đúng là đỉnh cao!"/utf8>>),
		  [{role, Role#role.name}, {red, Name}, {red, 10}]),
    notice:broadcast(rumor_left_top, Msg);
do_msg(Role, #partner{name = Name, star = Star})
    when Star > 10 ->
    Msg =
	color:msg(lang:get(<<"Nhẫn giả ~ts đã tăng sao thành công "
			     "anh hùng ~ts lên ~ts sao, không ai có "
			     "thể cản phá!"/utf8>>),
		  [{role, Role#role.name}, {red, Name}, {red, Star}]),
    notice:broadcast(rumor_left_top, Msg);
do_msg(_Role, _) -> ok.

get_max_lev(P = #partner{bid = Bid,
			 break_lev = BreakLev, star = Star}) ->
    #partner_base_data{type = Type, break_id = BreakId} =
	partner_data:get_base(Bid),
    MaxBreak = partner_lib:get_partner_break_max_lev(P),
    case BreakLev >= MaxBreak of
      false ->
	  partner_data:get_break_max_lev({Type, BreakId,
					  BreakLev});
      _ -> partner_data:get_star_max_lev({Bid, Star})
    end.

check_max_lev(P = #partner{lev = Lev}) ->
    MaxLev = get_max_lev(P), Lev >= MaxLev.

has_partner_by_bid(#role{partner_bag =
			     #partner_bag{partner_list = PartnerList}},
		   Id) ->
    case lists:keyfind(Id, #partner.bid, PartnerList) of
      false -> false;
      _ -> true
    end.

-spec partner_compound(#role{}, pos_integer(),
		       pos_integer()) -> {ok, #role{}, list()} |
					 {false, binary()}.

partner_compound(Role, Bid, Num) ->
    case partner_data:get_compound_info(Bid) of
      {ExpendNum, RandId} ->
	  Expend = [{Bid, ExpendNum * Num}],
	  Loss = format:val_to_loss(Expend, partner_compound),
	  case role_gain:do(Role, Loss) of
	    {ok, NRole} ->
		RandList = partner_data:get_rand_list(RandId),
		case do_partner_compound(NRole, RandList, Num, []) of
		  {false, Msg} -> {false, Msg};
		  {NewRole, AddPartnerId} ->
		      log:log_gain(Loss, Role, NRole, <<"伙伴合成"/utf8>>,
				   util:fbin(lang:get(<<"Ninja hợp thành, Cần :~w nhận được:~w"/utf8>>),
					     [Expend, AddPartnerId])),
		      {ok, NewRole, AddPartnerId}
		end;
	    {false, #loss{msg = Msg}} -> {false, Msg}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Lỗi tham số, không tìm thấy thông tin "
		      "tổng hợp"/utf8>>)}
    end.

do_partner_compound(Role, _RandList, Num, L)
    when Num =< 0 ->
    {Role, L};
do_partner_compound(Role, RandList, Num, L) ->
    {PartnerId, _} = util:rand_list(RandList, 2),
    case add_partners(Role, PartnerId, partner_compose) of
      {false, Msg} -> {false, Msg};
      NRole ->
	  do_partner_compound(NRole, RandList, Num - 1,
			      [PartnerId | L])
    end.

-spec convert_partner(#role{}, #partner{},
		      pos_integer()) -> {ok, #role{}} | {false, bitstring()}.

convert_partner(Role = #role{item_next_id = NextId,
			     partner_bag =
				 PB = #partner_bag{partner_had = HasPartners,
						   partner_list = List}},
		OldP = #partner{id = Id, bid = OldBid, star = InitStar,
				lev = InitLev, eqm = Eqm, artifacts = Artifacts,
				break_lev = BreakLev, holy_eqm = HolyEqm},
		NewBid) ->
    case partner_data:get_base(NewBid) of
      BaseData = #partner_base_data{} ->
	  NewPartnerT = #partner{} = init_partner(Role, BaseData,
						  NextId, InitLev, InitStar),
	  NewPartner1 = NewPartnerT#partner{eqm = Eqm,
					    artifacts = Artifacts,
					    break_lev = BreakLev,
					    holy_eqm = HolyEqm},
	  NewPartner = partner_lib:calc_attr(Role, NewPartner1),
	  NewPartnerList = [NewPartner | List],
	  NewList = lists:keydelete(Id, #partner.id,
				    NewPartnerList),
	  Role1 = Role#role{item_next_id = NextId + 1,
			    partner_bag =
				PB#partner_bag{partner_had =
						   add_partner_had(HasPartners,
								   NewBid,
								   InitStar),
					       partner_list = NewList}},
	  FireRole = role_trigger:fire([#evt_partner{},
					#evt_add_new_partner_bi_bid{bid =
									NewBid,
								    star =
									InitStar}],
				       Role1),
	  NRole = role_looks:activate(FireRole, NewBid, InitStar),
	  push_new_partner(NRole, [NewPartner]),
	  sys_conn:pack_send(11006, {[Id]}),
	  catch log:save(partner,
			 {Role, OldP, NewPartner,
			  lang:get(<<"Thay thế anh hùng"/utf8>>),
			  util:fbin("原Id：~w，原Bid:~w, 新Id：~w",
				    [Id, OldBid, NextId])}),
	  {ok, NRole};
      {false, Msg} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidpartner964, _,
	     {__Levelpartner964, __Tracespartner964}}
		when __Levelpartner964 band 8 /= 0 orelse
		       __Tracespartner964 /= [] ->
		lager:do_log(error,
			     [{module, partner}, {function, convert_partner},
			      {line, 964}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("转换伙伴ERR ~w, ~w级, ~w, Msg ~w",
					   [Role#role.id, InitLev, NewBid,
					    Msg]),
			     none, 4096, 8, __Levelpartner964,
			     __Tracespartner964, lager_event, __Pidpartner964);
	    _ -> ok
	  end,
	  {false, Msg}
    end.

-spec holiday_convert_partner(#role{}, #partner{},
			      pos_integer(), list(), list()) -> {false,
								 bitstring()} |
								{ok, #role{}}.

holiday_convert_partner(Role = #role{item_next_id =
					 NextId,
				     partner_bag = PB},
			OldP = #partner{id = PartnerId, bid = SrcBid,
					star = InitStar, lev = InitLev,
					eqm = Eqm, artifacts = Artifacts,
					break_lev = BreakLev,
					holy_eqm = HolyEqm,
					dower_skill = DowerSkill},
			TargetBid, RestPartnerList, Ids) ->
    case partner_data:get_base(TargetBid) of
      BaseData = #partner_base_data{} ->
	  case lists:member(InitStar,
			    partner_data:get_stars_by_bid(TargetBid))
	      of
	    true ->
		NewPartnerT = #partner{} = partner:init_partner(Role,
								BaseData,
								NextId, InitLev,
								InitStar),
		NewPartner1 = NewPartnerT#partner{eqm = Eqm,
						  artifacts = Artifacts,
						  break_lev = BreakLev,
						  holy_eqm = HolyEqm,
						  dower_skill = DowerSkill},
		NewPartner = partner_lib:calc_attr(Role, NewPartner1),
		NewPartnerList = [NewPartner | RestPartnerList],
		NewPB = PB#partner_bag{partner_list = NewPartnerList,
				       partner_had =
					   add_partner_had(PB#partner_bag.partner_had,
							   TargetBid,
							   InitStar)},
		NewRole0 = Role#role{item_next_id = NextId + 1,
				     partner_bag = NewPB},
		NewRole1 = role_looks:activate(NewRole0, TargetBid,
					       InitStar),
		NewRole = role_trigger:fire([#evt_partner{},
					     #evt_partner_star_up_specific{bid =
									       TargetBid,
									   star
									       =
									       InitStar},
					     #evt_add_new_partner_bi_bid{bid =
									     TargetBid,
									 star =
									     InitStar}],
					    NewRole1),
		push_new_partner(NewRole, [NewPartner]),
		sys_conn:pack_send(11006, {[PartnerId | Ids]}),
		log:save(partner,
			 {NewRole, OldP, NewPartner,
			  lang:get(<<"hoạt động thay thế"/utf8>>),
			  util:fbin("原Id:~w, 原Bid:~w, 新Id:~w, 新Bid:~w, 星级:~w",
				    [PartnerId, SrcBid, NextId + 1, TargetBid,
				     InitStar])}),
		{ok, NewRole};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidpartner990, _,
		   {__Levelpartner990, __Tracespartner990}}
		      when __Levelpartner990 band 8 /= 0 orelse
			     __Tracespartner990 /= [] ->
		      lager:do_log(error,
				   [{module, partner},
				    {function, holiday_convert_partner},
				    {line, 990}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("~ts英雄尝试使用伙伴Id:~w转换 Bid:~w 星级:~w 不存在的英雄",
						 [Role#role.name, PartnerId,
						  TargetBid, InitStar]),
				   none, 4096, 8, __Levelpartner990,
				   __Tracespartner990, lager_event,
				   __Pidpartner990);
		  _ -> ok
		end,
		{false,
		 lang:get(<<"Anh hùng được chuyển đổi không có xếp "
			    "hạng sao này"/utf8>>)}
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
	    {__Pidpartner994, _,
	     {__Levelpartner994, __Tracespartner994}}
		when __Levelpartner994 band 8 /= 0 orelse
		       __Tracespartner994 /= [] ->
		lager:do_log(error,
			     [{module, partner},
			      {function, holiday_convert_partner}, {line, 994},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~ts英雄尝试使用伙伴Id:~w转换 Bid:~w 不存在的英雄",
					   [Role#role.name, PartnerId,
					    TargetBid]),
			     none, 4096, 8, __Levelpartner994,
			     __Tracespartner994, lager_event, __Pidpartner994);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Anh hùng được chuyển đổi không tồn tại"/utf8>>)}
    end.

push_all_partner(Role = #role{partner_bag =
				  #partner_bag{type = Type, partner_list = List,
					       num = Num, buy_num = BuyNum}}) ->
    NewNum = Num + get_bag_num(Role),
    PushList = [to_partner_info_p(P) || P <- List],
    sys_conn:pack_send(11000,
		       {Type, NewNum, BuyNum, PushList}).

push_all_partner2(Role = #role{partner_bag =
				   #partner_bag{type = Type,
						partner_list = List, num = Num,
						buy_num = BuyNum}}) ->
    NewNum = Num + get_bag_num(Role),
    PushList = [to_partner_base_p(P) || P <- List],
    sys_conn:pack_send(11025,
		       {Type, NewNum, BuyNum, PushList}).

push_all_partner_list(Role = #role{partner_bag =
				       #partner_bag{type = Type, num = Num,
						    buy_num = BuyNum}},
		      List) ->
    NewNum = Num + get_bag_num(Role),
    PushList = [to_partner_base_p(P) || P <- List],
    sys_conn:pack_send(11025,
		       {Type, NewNum, BuyNum, PushList}).

push_all_partner_attr(#role{partner_bag =
				#partner_bag{partner_list = AllList}},
		      Ids) ->
    List = [P
	    || P = #partner{id = Id} <- AllList,
	       lists:member(Id, Ids)],
    PushList = [to_partner_attr_info_p(P) || P <- List],
    sys_conn:pack_send(11026, {PushList}).

push_new_partner(Role, Partners) ->
    PushList = [to_partner_info_p(P) || P <- Partners],
    sys_conn:pack_send(11001, {PushList}).

push_ref_partner(Role, Partner) ->
    sys_conn:pack_send(11002, to_partner_ref_info(Partner)).

push_ref_new_partner(Role, Partners) ->
    PushList = [to_partner_info_p(P) || P <- Partners],
    sys_conn:pack_send(11073, {PushList}).

push_ref_partners(_Role, RefPartners) ->
    PushList = [{Id, Power, AllAttr}
		|| #partner{id = Id, power = Power, all_attr = AllAttr}
		       <- RefPartners],
    sys_conn:pack_send(11007, {PushList}).

push_partner_bag(Role = #role{partner_bag =
				  #partner_bag{buy_num = BuyNum, num = Num}}) ->
    NewNum = Num + get_bag_num(Role),
    sys_conn:pack_send(11009,
		       {1, lang:get(<<""/utf8>>), NewNum, BuyNum}).

to_partner_attr_info_p(#partner{id = Id,
				all_attr = AllAttr, eqm = Eqm,
				artifacts = Artifacts}) ->
    PushEqm = [to_push_item(E) || E <- Eqm],
    CliArtifacts = [{Pos, to_push_item(Items)}
		    || {Pos, Items = #item{}} <- Artifacts],
    {Id, AllAttr, PushEqm, CliArtifacts}.

to_partner_info_p(Partner = #partner{all_attr = AllAttr,
				     group_attr = GroupAttr, eqm = Eqm,
				     artifacts = Artifacts,
				     dower_skill = Skills}) ->
    PushEqm = [to_push_item(E) || E <- Eqm],
    CliArtifacts = [{Pos, to_push_item(Items)}
		    || {Pos, Items = #item{}} <- Artifacts],
    {to_partner_base_p(Partner), AllAttr,
     to_cli_group(GroupAttr), PushEqm, CliArtifacts, Skills}.

to_partner_info_share_p(Partner = #partner{all_attr =
					       AllAttr,
					   group_attr = GroupAttr, eqm = Eqm,
					   artifacts = Artifacts,
					   dower_skill = DowerSkill,
					   holy_eqm = HolyEqm}) ->
    PushEqm = [to_push_item(E) || E <- Eqm],
    CliArtifacts = [{Pos, to_push_item(Items)}
		    || {Pos, Items = #item{}} <- Artifacts],
    CliHolyEqm = [to_push_item(Items) || Items <- HolyEqm],
    {to_partner_base_p(Partner), AllAttr,
     to_cli_group(GroupAttr), PushEqm, CliArtifacts,
     DowerSkill, CliHolyEqm}.

to_push_item(I = #item{main_attr = MainAttr,
		       attr = Attr, extra_attr = ExtraAttr,
		       holy_eqm_attr = HolyEqmAttr}) ->
    PushMainAttr = [{attr_data:attr_atom2id(K), V}
		    || {K, V} <- MainAttr],
    PushAttr = [{attr_data:attr_atom2id(K),
		 util:uceil(V * 1000)}
		|| {K, V} <- Attr],
    CliExtraAttr = [{attr_data:attr_atom2id(AttrType),
		     util:uceil(Val * 1000)}
		    || {AttrType, Val} <- ExtraAttr],
    CliHolyEqmAttr = [{Pos, attr_data:attr_atom2id(K),
		       util:uceil(V)}
		      || {Pos, K, V} <- HolyEqmAttr, Pos < 100],
    I#item{main_attr = PushMainAttr, attr = PushAttr,
	   extra_attr = CliExtraAttr,
	   holy_eqm_attr = CliHolyEqmAttr}.

to_partner_ref_info(Partner = #partner{all_attr =
					   AllAttr,
				       group_attr = GroupAttr}) ->
    {to_partner_base_p(Partner), AllAttr,
     to_cli_group(GroupAttr)}.

to_cli_group(GroupAttr = #group_attr{atk = Atk,
				     hp_max = HpMax, def = Def,
				     speed = Speed}) ->
    GroupAttr#group_attr{atk = util:ceil(Atk * 1000),
			 hp_max = util:ceil(HpMax * 1000),
			 def = util:ceil(Def * 1000),
			 speed = util:ceil(Speed * 1000)}.

to_partner_base_p(P) ->
    #partner_base_p{partner_id = P#partner.id,
		    bid = P#partner.bid, lev = P#partner.lev,
		    star = P#partner.star, star_step = P#partner.star_step,
		    quality = P#partner.quality,
		    break_lev = P#partner.break_lev,
		    power = P#partner.power, skills = P#partner.skills,
		    add_star = P#partner.add_star,
		    is_lock = P#partner.is_lock,
		    use_skin = P#partner.use_skin,
		    end_time = P#partner.end_time,
		    resonate_lev = P#partner.resonate_lev,
		    resonate_break_lev = P#partner.resonate_break_lev}.

-spec get_bag_num(#role{}) -> pos_integer().

get_bag_num(Role) ->
    case vip:get_effect(Role, normal) of
      L = [_ | _] -> list_util:keyfind(baglimit, L, 0);
      _ -> 0
    end.

-spec set_overdue_timer(#role{}) -> #role{}.

set_overdue_timer(Role = #role{partner_bag =
				   #partner_bag{partner_list = PartnerList}}) ->
    Now = date:unixtime(),
    RestTime = [EndTime - Now
		|| #partner{end_time = EndTime} <- PartnerList,
		   EndTime > 0],
    case RestTime of
      [] -> Role;
      TL ->
	  T = max(5, lists:min(TL)),
	  role_timer:set(#timer{id = partner_resonate_check_timer,
				timeout = T * 1000, m = partner, f = overdue,
				a = []},
			 Role)
    end.

-spec overdue(#role{}) -> {ok, #role{}}.

overdue(Role = #role{partner_bag =
			 PB = #partner_bag{partner_list = PartnerList}}) ->
    {NewPartnerList, BidList, ItemList, Logs} =
	overdue(PartnerList, [], date:unixtime(), [], [], []),
    Gain = format:val_to_gain(BidList ++ ItemList,
			      partner_decompose),
    case role_gain:do_mail_and_notice(Role, Gain,
				      lang:get(<<"Nếu anh hùng được trao quyền hết hạn, "
						 "nó sẽ được hoàn trả và phát hành lại."/utf8>>),
				      lang:get(<<"Người chơi thân mến, kho đồ của bạn "
						 "đã đầy khi anh hùng được trao quyền "
						 "của bạn hết hạn. Sau đây là các trang "
						 "bị, rune và trang bị thần thánh mà anh "
						 "hùng đeo, mời các bạn tham khảo"/utf8>>),
				      <<"Anh hùng cường hóa đã hết hạn"/utf8>>)
	of
      {ok, Role1, _} ->
	  log:log_gain(Gain, Role, Role1,
		       <<"Anh hùng cường hóa đã hết hạn"/utf8>>,
		       util:fbin("过期英雄信息:~w ", [Logs])),
	  Role2 = Role1#role{partner_bag =
				 PB#partner_bag{partner_list = NewPartnerList}},
	  Role3 = set_overdue_timer(Role2),
	  NRole = overdue_mail(Logs, Role3),
	  {ok, NRole};
      _ERR ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidpartner1131, _,
	     {__Levelpartner1131, __Tracespartner1131}}
		when __Levelpartner1131 band 8 /= 0 orelse
		       __Tracespartner1131 /= [] ->
		lager:do_log(error,
			     [{module, partner}, {function, overdue},
			      {line, 1131}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~ts在处理过期英雄时发生意外 ~w",
					   [Role#role.name, _ERR]),
			     none, 4096, 8, __Levelpartner1131,
			     __Tracespartner1131, lager_event,
			     __Pidpartner1131);
	    _ -> ok
	  end,
	  NRole = set_overdue_timer(Role),
	  {ok, NRole}
    end.

overdue([], PartnerList, _Now, BidList, ItemsList,
	Logs) ->
    {PartnerList, BidList, ItemsList, Logs};
overdue([#partner{id = Id, bid = Bid, star = Star,
		  lev = Lev, break_lev = BreakLev, end_time = EndTime,
		  artifacts = Artifacts, holy_eqm = HolyEqm, eqm = EqmsT}
	 | Other],
	PartnerList, Now, BidList, ItemsList, Logs)
    when EndTime =/= 0 andalso Now >= EndTime ->
    Eqms = [{BId, 1} || #item{base_id = BId} <- EqmsT],
    Artifact = [Data || {_, Data} <- Artifacts],
    NewLogs = [{Id, Bid, Star, Lev, BreakLev, EndTime}
	       | Logs],
    sys_conn:pack_send(11006, {[Id]}),
    overdue(Other, PartnerList, Now, Eqms ++ BidList,
	    HolyEqm ++ Artifact ++ ItemsList, NewLogs);
overdue([P | Other], PartnerList, Now, BidList,
	ItemsList, Logs) ->
    overdue(Other, [P | PartnerList], Now, BidList,
	    ItemsList, Logs).

overdue_mail([], Role) -> Role;
overdue_mail([{_Id, Bid, Star, _Lev, _BreakLev, EndTime}
	      | L],
	     Role) ->
    StartTime = EndTime -
		  60 * resonate_data:get_const(empowerment_span),
    {{Y, M, D}, {HH0, MM0, SS0}} =
	date:seconds_to_datetime(StartTime),
    HH = util:if_true(HH0 < 10, util:fbin("0~w", [HH0]),
		      integer_to_binary(HH0)),
    MM = util:if_true(MM0 < 10, util:fbin("0~w", [MM0]),
		      integer_to_binary(MM0)),
    SS = util:if_true(SS0 < 10, util:fbin("0~w", [SS0]),
		      integer_to_binary(SS0)),
    #partner_base_data{name = Name} =
	partner_data:get_base(Bid),
    {ok, RoleT} = mail:add(Role,
			   {lang:get(<<"Anh hùng được trao quyền hết hạn"/utf8>>),
			    util:fbin("尊敬的冒险者，您在~w年~w月~w日~ts:~ts:~ts中赋能的英雄~ts已失效并消失，"
				      "该英雄身上所有装备、神装、符文也会在失效后返还且存放到您的背包当中，请留意。",
				      [Y, M, D, HH, MM, SS,
				       color:string(red,
						    util:fbin(lang:get(<<"【~w星~ts】"/utf8>>),
							      [Star, Name]))]),
			    [], [], lang:get(<<"赋能英雄"/utf8>>),
			    86400 * 7 + date:unixtime()}),
    overdue_mail(L, RoleT);
overdue_mail([_ | L], Role) -> overdue_mail(L, Role).


