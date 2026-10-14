-file("data/adventure.erl", 1).

-file("src/mod/adventure/adventure.erl", 1).

-module(adventure).

-lager_records([{cluster_dynamic_local_group,
		 [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
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
		{buff_data,
		 [bid, name, type, time_type, group, effect, seconds]},
		{role_buff, [ver, buff_list]},
		{role_buff_data, [bid, group, effect, end_time]},
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{m_look, [use_id, list]},
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
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
		{unit_make_args, [pos, evts, disabled]},
		{map_unit,
		 [id, type, activity, status, guide_lev, name, layer,
		  base_id, lev, career, sex, hp, hp_max, speed, x, y, gx,
		  gy, looks]},
		{unit,
		 [id, type, minor_type, pid, activity, combat_pid, name,
		  status, guide_lev, nature, quality, layer, disabled,
		  base_id, lev, career, sex, hp, hp_max, speed, lock,
		  def_status, pos, looks, evt, ts, timeout, t_move, t_atk,
		  extra]},
		{unit_data,
		 [bid, type, minor_type, name, activity, cli_create,
		  guide_lev, status, nature, disabled, condition, lev,
		  career, sex, hp, mp, hp_max, mp_max, speed, lock,
		  t_move, t_atk, range_trace, range_atk, gain, slave,
		  waves, talk, looks, order, data, layer, def_status,
		  status_list, drop_id, act_drops, tran_pos,
		  reward_panel_type, reward, formation, camp_type]},
		{unit_order, [order, type, arg, data, condition, over]},
		{map_data,
		 [bid, type, name, def_xy, min_lev, max_lev, condition,
		  relive, width, height, grid_x, grid_y, max_pre_layer,
		  start_type, is_single, unit_list, tile_res_list]},
		{map_grid, [map_pid, map_id, base_id, width, height]},
		{map,
		 [id, srv_id, base_id, res_id, pid, ctrl_pid, grid_info,
		  name, condition, num, max_pre_layer, width, height,
		  dynamic_block, layer_flag]},
		{pos,
		 [ver, srv_id, map_id, map_pid, map_bid, map_grid_pid,
		  last, hidden, x, y, dir]},
		{pos_history, [map_id, map_bid, srv_id, x, y]},
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
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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
		{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
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

-export([init/0, login/1, logout/1, zero_flush/1, gm/2,
	 push_base/1, push_buff/1, push_skill/1, push_room/1,
	 push_shop/1, push_bag/1, push_partners/1,
	 push_unit_room/1, push_round_reward/1,
	 get_round_reward/2, set_use_partner/2, set_partners/2,
	 enter_map/2, evt_drop/2, item_concat_to_cli/2,
	 goto_floor/4, enter_room/2, acc_room_num/3,
	 log_save_task/3, room_finish/2, reset_room_status/2,
	 use_skill/3, buy/2, is_open_holiday/1, gm_reset_floor/1,
	 buy_drug/2]).

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

-file("src/mod/adventure/adventure.erl", 41).

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

-file("src/mod/adventure/adventure.erl", 42).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/adventure/adventure.erl", 43).

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

-file("src/mod/adventure/adventure.erl", 44).

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

-file("src/mod/adventure/adventure.erl", 45).

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

-file("src/mod/adventure/adventure.erl", 46).

-file("inc/log.hrl", 1).

-file("src/mod/adventure/adventure.erl", 47).

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

-file("src/mod/adventure/adventure.erl", 48).

-file("inc/map.hrl", 1).

-record(map,
	{id = 1  :: pos_integer(), srv_id = ""  :: bitstring(),
	 base_id = 1  :: pos_integer(),
	 res_id = 0  :: non_neg_integer(),
	 pid  :: undefined | pid(),
	 ctrl_pid  :: undefined | pid(),
	 grid_info = []  :: [{pid(), pos_integer()}],
	 name = ""  :: bitstring(), condition = []  :: list(),
	 num = 0  :: non_neg_integer(),
	 max_pre_layer = 20  :: pos_integer(),
	 width = 1  :: pos_integer(),
	 height = 1  :: pos_integer(),
	 dynamic_block = []  :: list(),
	 layer_flag = 0  :: non_neg_integer()}).

-record(map_grid,
	{map_pid  :: undefined | pid(),
	 map_id = 1  :: pos_integer(),
	 base_id = 1  :: pos_integer(),
	 width = 1  :: pos_integer(),
	 height = 1  :: pos_integer()}).

-record(map_data,
	{bid = 1  :: pos_integer(),
	 type = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 def_xy = {0, 0}  :: {pos_integer(), pos_integer()},
	 min_lev = 0  :: non_neg_integer(),
	 max_lev = 9999  :: non_neg_integer(),
	 condition = []  :: [tuple()], relive = []  :: [tuple()],
	 width = 1  :: pos_integer(),
	 height = 1  :: pos_integer(),
	 grid_x = 0  :: pos_integer(),
	 grid_y = 0  :: pos_integer(),
	 max_pre_layer = 60  :: pos_integer(),
	 start_type = 0  :: 0..1, is_single = 0  :: 0..1,
	 unit_list = []  :: [tuple()], tile_res_list = []}).

-file("src/mod/adventure/adventure.erl", 49).

-file("inc/unit.hrl", 1).

-record(unit_order,
	{order  :: move | guard | attack | atom(),
	 type = 0  :: 0..2,
	 arg  :: undefined | tuple() | [tuple()],
	 data  :: undefined | term(), condition = []  :: list(),
	 over  :: undefined | defense | stop | atom()}).

-record(unit_data,
	{bid = auto  :: auto | pos_integer(),
	 type = 200  :: non_neg_integer(),
	 minor_type = 1  :: non_neg_integer(),
	 name = ""  :: bitstring(), activity = 0  :: 0..1,
	 cli_create = 0  :: 0..1,
	 guide_lev = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 nature = 0  :: non_neg_integer(),
	 disabled = <<>>  :: bitstring(),
	 condition = []  :: [tuple()],
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 2  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 mp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 mp_max = 0  :: non_neg_integer(),
	 speed = 180  :: pos_integer(), lock = 0  :: 0 | 1,
	 t_move = 3  :: pos_integer(),
	 t_atk = 3  :: pos_integer(),
	 range_trace = 200  :: pos_integer(),
	 range_atk = 100  :: pos_integer(), gain = []  :: list(),
	 slave = []  :: list(), waves = []  :: list(),
	 talk = []  :: list(), looks = []  :: list(),
	 order = []  :: list(), data = []  :: list(),
	 layer = 0  :: non_neg_integer(),
	 def_status = defense  :: defense | patrol | loaf,
	 status_list = []  :: list(),
	 drop_id = 0  :: non_neg_integer(),
	 act_drops = []  :: list(), tran_pos = [],
	 reward_panel_type = 1, reward = [], formation = {1, 1},
	 camp_type = 0}).

-record(unit,
	{id = {1, 1}  :: {pos_integer(), pos_integer()},
	 type = 200  :: non_neg_integer(),
	 minor_type = 1  :: non_neg_integer(),
	 pid = 0  :: non_neg_integer() | pid(),
	 activity = 0  :: 0..1,
	 combat_pid = 0  :: non_neg_integer() | pid(),
	 name = ""  :: bitstring(),
	 status = 0  :: non_neg_integer(),
	 guide_lev = 0  :: non_neg_integer(),
	 nature = 0  :: non_neg_integer(), quality = 0  :: 0..4,
	 layer = 0  :: non_neg_integer(),
	 disabled = <<>>  :: bitstring(),
	 base_id = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 speed = 1  :: pos_integer(), lock = 0  :: 0 | 1,
	 def_status = defense  :: defense,
	 pos  :: undefined | tuple(), looks = []  :: [tuple()],
	 evt = []  :: [atom()],
	 ts = {1, 1, 1}  ::
	     {pos_integer(), pos_integer(), pos_integer()},
	 timeout = 864000  :: non_neg_integer(),
	 t_move = 1  :: pos_integer(),
	 t_atk = 1  :: pos_integer(), extra = []  :: [tuple()]}).

-record(map_unit,
	{id = {1, 1}  :: {pos_integer(), pos_integer()},
	 type = 200  :: pos_integer(), activity = 0  :: 0..1,
	 status = 0  :: non_neg_integer(),
	 guide_lev = 0  :: non_neg_integer(),
	 name = ""  :: bitstring(),
	 layer = 0  :: non_neg_integer(),
	 base_id = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 speed = 1  :: pos_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 gx = 0  :: non_neg_integer(),
	 gy = 0  :: non_neg_integer(),
	 looks = []  :: [tuple()]}).

-record(unit_make_args,
	{pos = {0, 0, 0}, evts = [], disabled = 0  :: 0 | 1}).

-file("src/mod/adventure/adventure.erl", 50).

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

-file("src/mod/adventure/adventure.erl", 51).

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

-file("src/mod/adventure/adventure.erl", 52).

-file("inc/game_assets.hrl", 1).

-file("src/mod/adventure/adventure.erl", 53).

-file("inc/looks.hrl", 1).

-record(m_look, {use_id = 0, list = []}).

-file("src/mod/adventure/adventure.erl", 54).

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

-file("src/mod/adventure/adventure.erl", 55).

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

-file("src/mod/adventure/adventure.erl", 56).

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

-file("src/mod/adventure/adventure.erl", 57).

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

-file("src/mod/adventure/adventure.erl", 58).

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

-file("src/mod/adventure/adventure.erl", 59).

-file("inc/buff.hrl", 1).

-record(role_buff_data,
	{bid, group, effect = [], end_time}).

-record(role_buff,
	{ver = 1, buff_list = []  :: [#role_buff_data{}]}).

-record(buff_data,
	{bid, name, type, time_type, group, effect = [],
	 seconds}).

-file("src/mod/adventure/adventure.erl", 60).

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

-file("src/mod/adventure/adventure.erl", 61).

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

-file("src/mod/adventure/adventure.erl", 62).

gm_reset_floor(Role = #role{m_adventure =
				MAdventure}) ->
    zero_flush(Role#role{m_adventure =
			     MAdventure#m_adventure{end_time = 0}}).

-spec init() -> #m_adventure{}.

init() ->
    #m_adventure{mine_combat_num =
		     adventure_mine_data:get_const(free_attack)}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{m_adventure =
		       #m_adventure{id = Id, boss_room = 13, room_list = [_]}})
    when Id > 0 andalso Id rem 10 =:= 0 ->
    NRole = match(Role, Id),
    {ok, adventure_mine:mail_round_reward(NRole)};
login(Role = #role{id = RoleId,
		   m_adventure = #m_adventure{id = PassId}}) ->
    {ok, adventure_mine:mail_round_reward(Role)}.

-spec logout(#role{}) -> {ok, #role{}}.

logout(Role) -> {ok, Role}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{id = RoleId,
			m_adventure =
			    MAdventure = #m_adventure{end_time = EndTime,
						      init_id = InitId,
						      pass_id = PassId, id = Id,
						      round_reward =
							  RoundReward,
						      kill_mon = KillMon}}) ->
    Now = date:unixtime(),
    case Now >= EndTime of
      true ->
	  NewId = case lists:member(PassId,
				    adventure_mine_data:floor_list())
		      of
		    _ ->
			min(Id,
			    max(1,
				PassId -
				  adventure_data:get_const(reverse_layer)))
		  end,
	  LasteNum = util:if_true(InitId > 0, max(0, Id - InitId),
				  999),
	  NewBuffList = case InitId > 0 of
			  true -> adventure_data:get_init_buffs(LasteNum);
			  _ -> []
			end,
	  RestRoundRewardId = [RewardId
			       || {RewardId, Count}
				      <- adventure_data:list_round_reward(),
				  KillMon >= Count,
				  not lists:member(RewardId, RoundReward)],
	  RestRoundReward = lists:flatten([maps:get(items,
						    adventure_data:round_reward(RewardId),
						    [])
					   || RewardId <- RestRoundRewardId]),
	  {Assets, Items} =
	      format:split_assets_items(RestRoundReward),
	  Role1 = Role#role{m_adventure =
				MAdventure#m_adventure{id = NewId,
						       laste_num = LasteNum,
						       init_id = NewId,
						       current_id = NewId,
						       room_list = [],
						       start_time = 0,
						       end_time = 0, plist = [],
						       shop_list = [],
						       buff_list = NewBuffList,
						       bag_list = [],
						       skill_used = [],
						       round_evt_group = [],
						       round_reward = [],
						       kill_mon = 0,
						       mine_combat_num =
							   adventure_mine_data:get_const(free_attack),
						       mine_round_combat = 0,
						       mine_round_reward = [],
						       mine_buy_count = 0}},
	  {ok, NRole} = case RestRoundReward of
			  [_ | _] ->
			      mail:add(Role1,
				       {lang:get(<<"Phân phối phần thưởng mục tiêu phiêu "
						   "lưu"/utf8>>),
					lang:get(<<"Thân gửi nhà thám hiểm, bạn chưa nhận "
						   "được phần thưởng mục tiêu khi giết lính "
						   "canh ở vòng trước. Tôi sẽ gửi cho bạn "
						   "qua email. Vui lòng kiểm tra.！"/utf8>>),
					Assets, Items,
					lang:get(<<"Tái bản phần thưởng phiêu lưu"/utf8>>),
					86400 + date:unixtime()});
			  _ -> {ok, Role1}
			end,
	  push_base(NRole),
	  push_partners(NRole),
	  sys_conn:pack_send(20612, {}),
	  push_buff(NRole),
	  {ok, NRole};
      _ -> {ok, Role}
    end.

-spec gm(#role{}, tuple()) -> {ok, #role{}}.

gm(Role, {reset}) ->
    cluster_dynamic_group:group_cast(1, adventure_mgr, info,
				     [season]),
    role_group:apply(world,
		     {adventure, gm, [{reset_mine}]}),
    {ok, Role};
gm(Role = #role{m_adventure = MAdventure},
   {reset_mine}) ->
    zero_flush(Role#role{m_adventure =
			     MAdventure#m_adventure{end_time = 0}});
gm(Role = #role{m_adventure =
		    MAdventure = #m_adventure{room = RoomId,
					      room_list = RoomList}},
   {set_evt, EvtId}) ->
    #{} = adventure_data:get_evt(EvtId),
    Room = lists:keyfind(RoomId, #a_room.id, RoomList),
    NewRoom = Room#a_room{evt_id = EvtId, status = 2,
			  ext = []},
    NewRoomList = lists:keyreplace(RoomId, #a_room.id,
				   RoomList, NewRoom),
    NRole = Role#role{m_adventure =
			  MAdventure#m_adventure{room_list = NewRoomList}},
    push_room(NewRoom),
    {ok, NRole};
gm(Role = #role{m_adventure =
		    MAdventure = #m_adventure{room_list = RoomList, id = Id,
					      pass_id = PassId}},
   {pass_all}) ->
    NewRoomList = [I#a_room{status = 3} || I <- RoomList],
    NRole = Role#role{m_adventure =
			  MAdventure#m_adventure{room_list = NewRoomList,
						 pass_num = length(NewRoomList),
						 explore_num =
						     length(NewRoomList),
						 pass_id = max(Id, PassId)}},
    push_base(NRole),
    push_room(NRole),
    {ok, NRole};
gm(Role = #role{id = RoleId,
		m_adventure =
		    MAdventure = #m_adventure{pass_id = PassId}},
   {set_floor, N}) ->
    Role1 = Role#role{m_adventure =
			  MAdventure#m_adventure{room_list = [],
						 pass_id = max(N - 1, PassId)}},
    NRole = match(Role1, N),
    push_base(NRole),
    push_room(NRole),
    {ok, NRole};
gm(#role{id = RoleId}, {clear_time, Floor}) ->
    Pid = adventure_mine_lib:cluster_get_zone_pid(RoleId),
    ok.

-spec push_base(#role{}) -> ok.

push_base(_Role = #role{m_adventure =
			    #m_adventure{pass_id = PassId,
					 explore_num = ExploreNum, id = Id,
					 room = Room, start_time = StartTime,
					 end_time = EndTime,
					 is_kill_boss = IsKillBoss,
					 map_id = MapId, room_list = RoomList,
					 current_id = CurrentId}}) ->
    IsAllFinish = util:if_true([1
				|| #a_room{status = Status, evt_id = EvtId}
				       <- RoomList,
				   Status =/= 3,
				   not
				     lists:member(evt_type(EvtId), [box, shop])]
				 =:= [],
			       1, 0),
    sys_conn:pack_send(20600,
		       {PassId, ExploreNum, Id, Room, IsKillBoss, MapId,
			IsAllFinish, StartTime, EndTime, CurrentId}),
    ok.

-spec push_buff(#role{}) -> ok.

push_buff(Role = #role{m_adventure =
			   #m_adventure{buff_list = BuffList}}) ->
    HolidayBuffList = util:if_true(is_open_holiday(Role) =:=
				     1,
				   [{900903, 1}], []),
    sys_conn:pack_send(20601, {BuffList, HolidayBuffList}),
    ok.

-spec push_skill(#role{}) -> ok.

push_skill(#role{m_adventure =
		     #m_adventure{skill_list = SkillList,
				  skill_used = SkillUsed}}) ->
    CliSkillList = [{Id, Num,
		     list_util:keyfind(Id, SkillUsed, 0)}
		    || {Id, Num} <- SkillList],
    sys_conn:pack_send(20609, {CliSkillList}),
    ok.

-spec push_partners(#role{}) -> ok.

push_partners(#role{m_adventure =
			#m_adventure{partner_id = PId, plist = PList}}) ->
    CombatRound = util:get(adventure_combat_round, 1),
    put(adventure_combat_round, 0),
    PushList = [{{Hp, partner:to_partner_info_p(P)}}
		|| P = #partner{all_attr = #attr{hp = Hp}} <- PList],
    sys_conn:pack_send(20604, {PId, CombatRound, PushList}),
    ok.

-spec push_bag(#role{}) -> ok.

push_bag(Role = #role{m_adventure =
			  #m_adventure{bag_list = BagItems}}) ->
    VipRio = case vip:get_effect(Role, normal) of
	       L = [_ | _] -> list_util:keyfind(adventure, L, 0);
	       _ -> 0
	     end,
    sys_conn:pack_send(20606, {BagItems, VipRio}),
    ok.

push_shop(#role{m_adventure =
		    #m_adventure{shop_list = ShopList}}) ->
    sys_conn:pack_send(20632, {ShopList}), ok.

-spec push_room(#role{} | #a_room{}) -> ok.

push_room(#role{m_adventure =
		    #m_adventure{room_list = RoomList}}) ->
    CliL = [room_to_cli(I) || I <- RoomList],
    sys_conn:pack_send(20602, {CliL}),
    ok;
push_room(Room = #a_room{}) -> push_room([Room]);
push_room(RoomL) ->
    sys_conn:pack_send(20603,
		       {[room_to_cli(I) || I <- RoomL]}),
    ok.

-spec push_unit_room(#role{}) -> ok.

push_unit_room(#role{m_adventure =
			 #m_adventure{room_list = RoomList}}) ->
    Data = case [{RoomId, EvtId}
		 || #a_room{id = RoomId, evt_id = EvtId, status = 2}
			<- RoomList,
		    lists:member(evt_type(EvtId), [mon, mon2, mon3, mon4])]
	       of
	     [] ->
		 [{RoomId, EvtId}
		  || #a_room{id = RoomId, evt_id = EvtId, status = 2}
			 <- RoomList,
		     lists:member(evt_type(EvtId), [boss])];
	     L -> L
	   end,
    sys_conn:pack_send(20611, {Data}),
    ok.

room_to_cli(#a_room{id = Id, status = Status,
		    lock = Lock, evt_id = EvtId = 0, res_id = ResId}) ->
    NewStatus = case Status of
		  2 -> 2;
		  3 -> 3;
		  _ when Lock =:= 1 -> 0;
		  _ -> 1
		end,
    {Id, NewStatus, 0, EvtId, ResId};
room_to_cli(#a_room{id = Id, status = Status,
		    lock = Lock, evt_id = EvtId, res_id = ResId}) ->
    NewEvtId = case adventure_data:get_evt(EvtId) of
		 #{evt_type := boss} when Status =:= 3 ->
		     adventure_data:get_const(next_floor_evt_id);
		 #{def_show := 1} -> EvtId;
		 _ -> EvtId
	       end,
    NewStatus = case Status of
		  2 -> 2;
		  3 -> 3;
		  _ when Lock =:= 1 -> 0;
		  _ -> 1
		end,
    {Id, NewStatus, 0, NewEvtId, ResId}.

-spec push_round_reward(#role{}) -> ok.

push_round_reward(#role{m_adventure =
			    #m_adventure{round_reward = RoundReward,
					 kill_mon = KillMon}}) ->
    Fun = fun ({Id, Count}, Acc) ->
		  case lists:member(Id, RoundReward) of
		    true -> [{Id, 2} | Acc];
		    _ -> [{Id, util:if_true(KillMon >= Count, 1, 0)} | Acc]
		  end
	  end,
    Data = lists:foldl(Fun, [],
		       adventure_data:list_round_reward()),
    sys_conn:pack_send(20634, {Data, KillMon}),
    ok.

-spec get_round_reward(#role{},
		       Id :: pos_integer()) -> {ok, #role{}} |
					       {false, binary()}.

get_round_reward(Role = #role{m_adventure =
				  MAdventure = #m_adventure{kill_mon = KillMon,
							    round_reward =
								RoundReward}},
		 0) ->
    RestRoundRewardId = [RewardId
			 || {RewardId, Count}
				<- adventure_data:list_round_reward(),
			    KillMon >= Count,
			    not lists:member(RewardId, RoundReward)],
    RestRoundReward = lists:flatten([maps:get(items,
					      adventure_data:round_reward(RewardId),
					      [])
				     || RewardId <- RestRoundRewardId]),
    case RestRoundReward of
      [_ | _] ->
	  GL = format:val_to_gain(RestRoundReward, adventure),
	  case role_gain:do_notice(Role, GL) of
	    {ok, Role1} ->
		NRole = Role1#role{m_adventure =
				       MAdventure#m_adventure{round_reward =
								  RestRoundRewardId
								    ++
								    RoundReward}},
		log:log_gain(GL, Role, NRole, <<"冒险"/utf8>>,
			     util:fbin("一键领取冒险每轮奖励:~w", [RestRoundRewardId])),
		push_round_reward(NRole),
		{ok, NRole};
	    {false, #gain{msg = Msg}} -> {false, Msg}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Không có phần thưởng nào có sẵn"/utf8>>)}
    end;
get_round_reward(Role = #role{m_adventure =
				  MAdventure = #m_adventure{kill_mon = KillMon,
							    round_reward =
								RoundReward}},
		 Id) ->
    case adventure_data:round_reward(Id) of
      #{count := Count} when Count > KillMon ->
	  {false, util:fbin("再击杀~w个守卫后即可领取", [Count - KillMon])};
      #{items := Items} ->
	  case lists:member(Id, RoundReward) of
	    true ->
		{false, lang:get(<<"Phần thưởng nhận được"/utf8>>)};
	    false ->
		GL = format:val_to_gain(Items, adventure),
		case role_gain:do_notice(Role, GL) of
		  {ok, Role1} ->
		      NRole = Role1#role{m_adventure =
					     MAdventure#m_adventure{round_reward
									=
									[Id
									 | RoundReward]}},
		      log:log_gain(GL, Role, NRole, <<"冒险"/utf8>>,
				   util:fbin("冒险每轮奖励id:~w", [Id])),
		      push_round_reward(NRole),
		      {ok, NRole};
		  {false, #gain{msg = Msg}} -> {false, Msg}
		end
	  end;
      _ ->
	  {false, lang:get(<<"Phần thưởng không tồn tại"/utf8>>)}
    end.

-spec buy_drug(#role{}, Num :: pos_integer()) -> {ok,
						  #role{}} |
						 {false, binary()}.

buy_drug(Role = #role{m_adventure =
			  MAdventure = #m_adventure{skill_list = SkillList}},
	 Num) ->
    Expend = [{ItemId, ItemNum * Num}
	      || {ItemId, ItemNum}
		     <- adventure_data:get_const(poison_price)],
    GL = format:val_to_loss(Expend, adventure),
    case role_gain:do(Role, GL) of
      {ok, Role1} ->
	  SkillId = 2,
	  OldNum = list_util:keyfind(SkillId, SkillList, 0),
	  NewSkillList = lists:keystore(SkillId, 1, SkillList,
					{SkillId, OldNum + Num}),
	  NRole = Role1#role{m_adventure =
				 MAdventure#m_adventure{skill_list =
							    NewSkillList}},
	  log:log_gain(GL, Role, NRole, <<"冒险购买药剂"/utf8>>,
		       util:fbin("冒险购买药剂,当前药剂:~w,购买药剂:~w", [OldNum, Num])),
	  Msg1 = color:format({string,
			       {store_enunciation,
				lang:get(<<"Nhận được"/utf8>>)}}),
	  Msg2 = color:format({string,
			       {purple,
				lang:get(<<"Thuốc trừ tà linh hồn"/utf8>>)}}),
	  Msg3 = color:format({string,
			       {green,
				util:fbin(lang:get(<<"x~w"/utf8>>), [Num])}}),
	  Msg = <<Msg1/binary, Msg2/binary, Msg3/binary>>,
	  sys_conn:pack_send(12743, {Msg}),
	  push_skill(NRole),
	  {ok, NRole};
      {false, #gain{msg = Msg}} -> {false, Msg};
      {false, #loss{msg = Msg}} -> {false, Msg}
    end.

-spec enter_map(#role{}, normal | tuple()) -> {ok,
					       #role{}}.

enter_map(Role = #role{m_adventure =
			   #m_adventure{plist = _PList}},
	  _Pos) ->
    {ok, Role}.

-spec init_adventure(#role{}) -> #role{}.

init_adventure(Role = #role{lev = Lev,
			    m_adventure =
				#m_adventure{room_list = [], id = Id}}) ->
    case Lev >= adventure_data:get_const(open_lev) of
      true ->
	  NRole = match(Role, max(1, Id)),
	  push_base(NRole),
	  push_room(NRole),
	  log:save(join,
		   {NRole, <<"神界探险"/utf8>>, <<"进入层"/utf8>>}),
	  NRole;
      _ -> Role
    end;
init_adventure(Role) -> Role.

match(Role = #role{m_adventure = MAdventure}, Id) ->
    case lists:member(Id, adventure_mine_data:floor_list())
	of
      _ ->
	  Data = adventure_data:get_floor(Id),
	  MapId = util:rand_list(maps:get(map_list, Data)),
	  RoomList = [#a_room{id = RoomId,
			      res_id =
				  util:rand_list(adventure_data:get_tile({MapId,
									  RoomId}))}
		      || RoomId <- lists:seq(1, maps:get(room_num, Data))],
	  Role1 = Role#role{m_adventure =
				MAdventure#m_adventure{id = Id, boss_room = 0,
						       room_list = RoomList,
						       explore_num = 0,
						       is_kill_boss = 0,
						       init_time =
							   date:unixtime(),
						       map_id = MapId,
						       current_id = Id}},
	  init_first_room(maps:get(init_evts, Data), Role1, Data)
    end.

init_first_room([],
		Role = #role{m_adventure =
				 MAdventure = #m_adventure{room_list =
							       RoomList}},
		Data) ->
    {InitEvtNum, _} = util:rand_list(maps:get(init_evt_num,
					      Data, [{0, 1}]),
				     2),
    NewRoomList = init_room_evt(InitEvtNum, RoomList,
				maps:get(init_evt_list, Data, [])),
    Role#role{m_adventure =
		  MAdventure#m_adventure{room_list = NewRoomList}};
init_first_room([{RoomId, EvtId, Status} | T],
		Role = #role{m_adventure =
				 MAdventure = #m_adventure{room_list =
							       RoomList}},
		Data) ->
    Lock = util:if_true(Status >= 2, 0, 1),
    case adventure_data:get_evt(EvtId) of
      #{evt_type := boss} ->
	  Room = lists:keyfind(RoomId, #a_room.id, RoomList),
	  NewRoom = Room#a_room{evt_id = EvtId,
				init_evt_id = EvtId, status = Status,
				lock = Lock},
	  NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					 RoomList, NewRoom),
	  Role1 = Role#role{m_adventure =
				MAdventure#m_adventure{room_list = NewRoomList,
						       boss_room = RoomId}},
	  {NRole, _} = do_reset_room_status([-1, 1, 5, -5, 4, -4,
					     6, -6],
					    Role1, NewRoom, []),
	  init_first_room(T, NRole, Data);
      _ ->
	  Room = lists:keyfind(RoomId, #a_room.id, RoomList),
	  NewRoom = Room#a_room{evt_id = EvtId,
				init_evt_id = EvtId, status = Status,
				lock = Lock},
	  NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					 RoomList, NewRoom),
	  Role1 = Role#role{m_adventure =
				MAdventure#m_adventure{room_list = NewRoomList,
						       first_room = RoomId,
						       room = RoomId}},
	  {NRole, _} = do_reset_room_status([-1, 1, 5, -5, 4, -4,
					     6, -6],
					    Role1, NewRoom, []),
	  init_first_room(T, NRole, Data)
    end.

init_room_evt(0, RoomList, _EvtList) -> RoomList;
init_room_evt(_, RoomList, []) -> RoomList;
init_room_evt(N, RoomList, EvtList) ->
    {EvtId, _} = util:rand_list(EvtList, 2),
    case [R
	  || R = #a_room{status = 0, init_evt_id = 0} <- RoomList]
	of
      [] -> RoomList;
      RL ->
	  Room = #a_room{id = RoomId} = util:rand_list(RL),
	  NewRoom = Room#a_room{evt_id = EvtId,
				init_evt_id = EvtId},
	  NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					 RoomList, NewRoom),
	  init_room_evt(N - 1, NewRoomList, EvtList)
    end.

-spec room_finish(#role{}, #a_room{}) -> #role{}.

room_finish(Role, Room = #a_room{evt_id = EvtId}) ->
    Role1 = reset_room_status(Role, Room),
    NRole = auto_open_room(Role1),
    do_finish_evt(adventure_data:get_evt(EvtId), Room,
		  NRole).

do_finish_evt(#{evt_id := Evt,
		finish_act := [{new_evt, EvtsList0}]},
	      R,
	      Role = #role{m_adventure =
			       MAdventure = #m_adventure{room_list =
							     RoomList}}) ->
    EvtsList = [{EvtId, Rand}
		|| {EvtId, Rand} <- EvtsList0,
		   evt_type(EvtId) =/= rand_evt,
		   maps:get(conds, adventure_data:get_evt(EvtId), []) =:=
		     [],
		   not
		     lists:keymember(new_evt, 1,
				     maps:get(finish_act,
					      adventure_data:get_evt(EvtId),
					      []))],
    case EvtsList =/= [] of
      true ->
	  {EvtId, _} = util:rand_list(EvtsList, 2),
	  NewRoom = R#a_room{evt_id = EvtId, status = 2},
	  NewRoomList = lists:keyreplace(R#a_room.id, #a_room.id,
					 RoomList, NewRoom),
	  push_room([NewRoom]),
	  notice:alert(lang:get(<<"Một chiếc rương kho báu rơi ra."/utf8>>)),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure425, _,
	     {__Leveladventure425, __Tracesadventure425}}
		when __Leveladventure425 band 128 /= 0 orelse
		       __Tracesadventure425 /= [] ->
		lager:do_log(debug,
			     [{module, adventure}, {function, do_finish_evt},
			      {line, 425}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~ts=触发新事件 new_evt=~w",
					   [Role#role.name, EvtId]),
			     none, 4096, 128, __Leveladventure425,
			     __Tracesadventure425, lager_event,
			     __Pidadventure425);
	    _ -> ok
	  end,
	  Role#role{m_adventure =
			MAdventure#m_adventure{room_list = NewRoomList}};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure428, _,
	     {__Leveladventure428, __Tracesadventure428}}
		when __Leveladventure428 band 8 /= 0 orelse
		       __Tracesadventure428 /= [] ->
		lager:do_log(error,
			     [{module, adventure}, {function, do_finish_evt},
			      {line, 428}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~ts通关事件处理出错：evt=~w evts=~w",
					   [Role#role.name, Evt, EvtsList]),
			     none, 4096, 8, __Leveladventure428,
			     __Tracesadventure428, lager_event,
			     __Pidadventure428);
	    _ -> ok
	  end,
	  Role
    end;
do_finish_evt(_Evt, _Room, Role) -> Role.

auto_open_room(Role = #role{m_adventure =
				#m_adventure{id = Id, room_list = RoomList}}) ->
    case adventure_data:get_floor(Id) of
      #{auto_open := 1} -> do_auto_open_room(RoomList, Role);
      _ -> Role
    end.

do_auto_open_room([], Role) -> Role;
do_auto_open_room([#a_room{id = RoomId, lock = 0,
			   status = Status}
		   | T],
		  Role)
    when Status =:= 0 orelse Status =:= 1 ->
    case enter_room(Role, RoomId) of
      {ok, NRole} -> do_auto_open_room(T, NRole);
      _ -> do_auto_open_room(T, Role)
    end;
do_auto_open_room([_ | T], Role) ->
    do_auto_open_room(T, Role).

-spec evt_type(pos_integer()) -> atom().

evt_type(0) -> null;
evt_type(EvtId) ->
    maps:get(evt_type, adventure_data:get_evt(EvtId)).

evt_group(0) -> null;
evt_group(EvtId) ->
    maps:get(evt_group, adventure_data:get_evt(EvtId)).

-spec reset_room_status(#role{}, #a_room{}) -> #role{}.

reset_room_status(Role = #role{m_adventure =
				   #m_adventure{id = _Id}},
		  Room) ->
    {NRole, UpdateL} = do_reset_room_status([-1, 1, 5, -5,
					     4, -4, 6, -6],
					    Role, Room, []),
    push_room([Room | UpdateL]),
    NRole.

do_reset_room_status([], Role, _Room, L) ->
    continue_open_room(L, Role, L);
do_reset_room_status([N | T],
		     Role = #role{m_adventure =
				      MAdventure = #m_adventure{room_list =
								    RoomList}},
		     Room = #a_room{id = RoomId, evt_id = EvtId,
				    status = Status},
		     L) ->
    #{lock := NeedLock, evt_type := EvtType} =
	adventure_data:get_evt(EvtId),
    NextRoomId = next_id(RoomId, N),
    case lists:keyfind(NextRoomId, #a_room.id, RoomList) of
      #a_room{status = 2} ->
	  do_reset_room_status(T, Role, Room, L);
      #a_room{status = 3} ->
	  do_reset_room_status(T, Role, Room, L);
      _ when EvtType =:= block ->
	  do_reset_room_status(T, Role, Room, L);
      R = #a_room{lock = 0, status = NextStatus}
	  when NeedLock =:= 1 andalso Status =:= 2 ->
	  NewR = R#a_room{lock = 1,
			  status = util:if_true(N rem 2 =/= 0, 1, NextStatus)},
	  NewRoomList = lists:keyreplace(NextRoomId, #a_room.id,
					 RoomList, NewR),
	  NRole = Role#role{m_adventure =
				MAdventure#m_adventure{room_list =
							   NewRoomList}},
	  do_reset_room_status(T, NRole, Room, [NewR | L]);
      R = #a_room{lock = 1, status = NextStatus}
	  when NeedLock =:= 1 andalso Status =:= 3 ->
	  L1 = [lists:keyfind(next_id(NextRoomId, I), #a_room.id,
			      RoomList)
		|| I <- [-1, 1, 5, -5, 4, -4, 6, -6]],
	  case [1
		|| #a_room{status = 2, evt_id = EvtId1} <- L1,
		   maps:get(lock, adventure_data:get_evt(EvtId1), 0) =:= 1]
	      of
	    [] ->
		NewR = R#a_room{lock = 0,
				status =
				    util:if_true(N rem 2 =/= 0, 1, NextStatus)},
		NewRoomList = lists:keyreplace(NextRoomId, #a_room.id,
					       RoomList, NewR),
		NRole = Role#role{m_adventure =
				      MAdventure#m_adventure{room_list =
								 NewRoomList}},
		do_reset_room_status(T, NRole, Room, [NewR | L]);
	    _ when NextStatus =:= 0 andalso N rem 2 =/= 0 ->
		NewR = R#a_room{status = 1},
		NewRoomList = lists:keyreplace(NextRoomId, #a_room.id,
					       RoomList, NewR),
		NRole = Role#role{m_adventure =
				      MAdventure#m_adventure{room_list =
								 NewRoomList}},
		do_reset_room_status(T, NRole, Room, [NewR | L]);
	    _ -> do_reset_room_status(T, Role, Room, L)
	  end;
      R = #a_room{status = 0}
	  when (Status =:= 3 orelse Status =:= 2) andalso
		 N rem 2 =/= 0 ->
	  NewR = R#a_room{status = 1},
	  NewRoomList = lists:keyreplace(NextRoomId, #a_room.id,
					 RoomList, NewR),
	  NRole = Role#role{m_adventure =
				MAdventure#m_adventure{room_list =
							   NewRoomList}},
	  do_reset_room_status(T, NRole, Room, [NewR | L]);
      _ -> do_reset_room_status(T, Role, Room, L)
    end.

continue_open_room([], Role, L) -> {Role, L};
continue_open_room([Room = #a_room{status = 1,
				   evt_id = EvtId}
		    | T],
		   Role, L)
    when EvtId > 0 ->
    case adventure_data:get_evt(EvtId) of
      #{conds := [_ | _]} ->
	  {NRole, NewL} = do_continue_open_room([-1, 1, 5, -5],
						Role, Room, L, []),
	  continue_open_room(T, NRole, NewL);
      _ -> continue_open_room(T, Role, L)
    end;
continue_open_room([_ | T], Role, L) ->
    continue_open_room(T, Role, L).

do_continue_open_room([], Role, _Room, L, L2) ->
    continue_open_room(L2, Role, L);
do_continue_open_room([N | T],
		      Role = #role{m_adventure =
				       MAdventure = #m_adventure{room_list =
								     RoomList}},
		      Room = #a_room{id = RoomId}, L, L2) ->
    NextRoomId = next_id(RoomId, N),
    case lists:keyfind(NextRoomId, #a_room.id, RoomList) of
      R = #a_room{status = 0} ->
	  NewR = R#a_room{status = 1},
	  NewRoomList = lists:keyreplace(NextRoomId, #a_room.id,
					 RoomList, NewR),
	  NRole = Role#role{m_adventure =
				MAdventure#m_adventure{room_list =
							   NewRoomList}},
	  NewL = lists:keystore(NextRoomId, #a_room.id, L, NewR),
	  do_continue_open_room(T, NRole, Room, NewL,
				[NewR | L2]);
      _ -> do_continue_open_room(T, Role, Room, L, L2)
    end.

next_id(RoomId, -1) when RoomId rem 5 =:= 1 -> 0;
next_id(RoomId, 1) when RoomId rem 5 =:= 0 -> 0;
next_id(RoomId, -6) when RoomId rem 5 =:= 1 -> 0;
next_id(RoomId, 4) when RoomId rem 5 =:= 1 -> 0;
next_id(RoomId, -4) when RoomId rem 5 =:= 0 -> 0;
next_id(RoomId, 6) when RoomId rem 5 =:= 0 -> 0;
next_id(RoomId, Add) -> RoomId + Add.

-spec evt_drop(#role{}, #{}) -> {list(), list()}.

evt_drop(Role, EvtData) ->
    BaseItems = maps:get(base_items, EvtData, []),
    DropIds = maps:get(drop_ids, EvtData, []),
    {DropItems, _NoticeItems, NoticeMsg} =
	drop_lib:common_drop_items(Role, DropIds),
    Items =
	item_lib:merge(item_lib:to_cli_items2(DropItems),
		       BaseItems),
    case NoticeMsg =/= <<>> of
      true ->
	  put(adventure_notice_msg,
	      [NoticeMsg | util:get(adventure_notice_msg, [])]);
      _ -> skip
    end,
    {Items, []}.

-spec item_concat_to_cli(list(), list()) -> list().

item_concat_to_cli(Items, BagItems) ->
    NewItems = [{Bid, Val, 2} || {Bid, Val} <- Items],
    NewBagItems = [{Bid, Val, 2} || {Bid, Val} <- BagItems],
    NewItems ++ NewBagItems.

-spec goto_floor(#role{}, pos_integer(), pos_integer(),
		 atom()) -> {ok, #role{}} | {false, binary()}.

goto_floor(Role = #role{id = RoleId,
			m_adventure =
			    MAdventure = #m_adventure{id = Id,
						      buff_list = BuffList,
						      laste_num = LasteNum,
						      explore_num = ExploreNum,
						      pass_id = PassId},
			lev = Lev, power = Power},
	   NextId, Cost, Label) ->
    case adventure_data:get_floor(NextId) of
      #{lev := LimitLev}
	  when LimitLev > Lev andalso
		 NextId > PassId andalso NextId > Id ->
	  {false,
	   util:fbin(lang:get(<<"Mức độ yêu cầu[~w]Mở lớp tiếp theo"/utf8>>),
		     [LimitLev])};
      #{power := LimitPower}
	  when LimitPower > Power andalso
		 NextId > PassId andalso NextId > Id ->
	  {false,
	   util:fbin(lang:get(<<"Cần sức mạnh chiến đấu[~w]Mở lớp tiếp "
				"theo"/utf8>>),
		     [LimitPower])};
      #{} ->
	  AllGL = case Cost > 0 of
		    true -> format:val_to_loss([{1, Cost}], adventure);
		    _ -> []
		  end,
	  case role_gain:do_notice(Role, AllGL) of
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {false, #gain{reason = eqm_bag_full, msg = Msg}} ->
		notice:open_bag_full(Role), {false, Msg};
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, Role1} ->
		NewBuffList = case NextId >= PassId of
				true ->
				    BuffList --
				      adventure_data:get_init_buffs(LasteNum);
				_ -> BuffList
			      end,
		Role2 = Role1#role{m_adventure =
				       MAdventure#m_adventure{id = NextId,
							      buff_list =
								  NewBuffList,
							      pass_id =
								  max(NextId,
								      PassId),
							      pass_num = 0,
							      explore_num = 0,
							      room = 0,
							      room_list = [],
							      current_id =
								  NextId}},
		Role3 = match(Role2, NextId),
		NRole = role_trigger:fire([#evt_adventure_goto_floor{id
									 =
									 NextId},
					   #evt_adventure_floor_count{}],
					  Role3),
		push_base(NRole),
		push_room(NRole),
		push_buff(NRole),
		push_skill(NRole),
		push_bag(Role),
		log:log_gain(AllGL, Role, NRole, <<"冒险"/utf8>>,
			     util:fbin("重置层:~w=>~w,explore_num:~w,~w",
				       [Id, NextId, ExploreNum, Label])),
		log:save(join,
			 {NRole, <<"神界探险"/utf8>>, <<"进入层"/utf8>>}),
		{ok, NRole}
	  end;
      _ ->
	  {false, lang:get(<<"Dữ liệu lớp không tồn tại"/utf8>>)}
    end.

-spec enter_room(#role{},
		 RoomId :: pos_integer()) -> {ok, #role{}} |
					     {false, binary()}.

enter_room(Role = #role{m_adventure =
			    MAdventure = #m_adventure{room_list = RoomList,
						      id = Id,
						      explore_num = ExploreNum,
						      pass_num = PassNum,
						      boss_room = BossNum,
						      round_evt_group =
							  RoundEvtGroup}},
	   RoomId) ->
    case combat_lib:in_type_combat(Role, 6) of
      true -> {false, lang:get(<<"Chiến đấu"/utf8>>)};
      false ->
	  case lists:keyfind(RoomId, #a_room.id, RoomList) of
	    #a_room{lock = 1} ->
		{false,
		 lang:get(<<"Đánh bại lính canh gần đó để khám phá "
			    "khu vực"/utf8>>)};
	    Room = #a_room{status = Status}
		when Status =:= 0 orelse Status =:= 1 ->
		case check_room_cond(Role, Room) of
		  {false, Reason} -> {false, Reason};
		  true ->
		      EvtId0 = case Room of
				 #a_room{evt_id = 0} -> make_evt(Role, Room);
				 _ -> Room#a_room.evt_id
			       end,
		      EvtId = case adventure_data:get_evt(EvtId0) of
				#{evt_type := rand_evt, effect := Effect} ->
				    element(1, util:rand_list(Effect, 2));
				_ -> EvtId0
			      end,
		      #{evt_type := EvtType, evt_group := EvtGroup} =
			  adventure_data:get_evt(EvtId),
		      {NewStatus, NewPassNum, NewBossRoom} = case EvtType of
							       null ->
								   {3,
								    PassNum + 1,
								    BossNum};
							       block ->
								   {3,
								    PassNum + 1,
								    BossNum};
							       boss ->
								   {2, PassNum,
								    RoomId};
							       _ ->
								   {2, PassNum,
								    BossNum}
							     end,
		      {_, EvtGroupCount} = list_util:keyfind(EvtGroup, 1,
							     RoundEvtGroup,
							     {EvtGroup, 0}),
		      NewRoundEvtGroup = lists:keystore(EvtGroup, 1,
							RoundEvtGroup,
							{EvtGroup,
							 EvtGroupCount + 1}),
		      NewRoom = Room#a_room{status = NewStatus,
					    evt_id = EvtId,
					    idx = ExploreNum + 1,
					    init_evt_id = EvtId0},
		      NewRoomList = lists:keyreplace(RoomId, #a_room.id,
						     RoomList, NewRoom),
		      Role2 = Role#role{m_adventure =
					    MAdventure#m_adventure{room =
								       RoomId,
								   room_list =
								       NewRoomList,
								   explore_num =
								       ExploreNum
									 + 1,
								   pass_num =
								       NewPassNum,
								   boss_room =
								       NewBossRoom,
								   round_evt_group
								       =
								       NewRoundEvtGroup}},
		      Role3 = acc_room_num(Role2, Id, 1),
		      Role4 = role_trigger:fire([#evt_adventure_explore{num =
									    1},
						 #evt_enter_adventure{evt_id =
									  EvtId}],
						Role3),
		      NRole = reset_room_status(Role4, NewRoom),
		      log:save(join, {NRole, <<"神界探险"/utf8>>, <<"探索"/utf8>>}),
		      log_save_task(NRole, EvtType, 0),
		      rank_listener:handle(adventure, NRole, 1),
		      {ok, NRole}
		end;
	    #a_room{status = _Status, lock = _Lock} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidadventure673, _,
		   {__Leveladventure673, __Tracesadventure673}}
		      when __Leveladventure673 band 128 /= 0 orelse
			     __Tracesadventure673 /= [] ->
		      lager:do_log(debug,
				   [{module, adventure}, {function, enter_room},
				    {line, 673}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("角色[~ts]操作房间:~w==status=~w lock =~w",
						 [Role#role.name, RoomId,
						  _Status, _Lock]),
				   none, 4096, 128, __Leveladventure673,
				   __Tracesadventure673, lager_event,
				   __Pidadventure673);
		  _ -> ok
		end,
		{false, <<>>};
	    _ -> {false, lang:get(<<"Hòn đảo không tồn tại"/utf8>>)}
	  end
    end.

check_room_cond(_Role, #a_room{evt_id = 0}) -> true;
check_room_cond(Role, #a_room{evt_id = EvtId}) ->
    do_check_room_cond(Role,
		       maps:get(conds, adventure_data:get_evt(EvtId), [])).

do_check_room_cond(_Role, []) -> true;
do_check_room_cond(Role, [I | T]) ->
    case do_check_room_cond(Role, I) of
      {false, Reason} -> {false, Reason};
      true -> do_check_room_cond(Role, T)
    end;
do_check_room_cond(#role{m_adventure =
			     #m_adventure{room_list = RoomList}},
		   {explore_all}) ->
    case [1
	  || #a_room{status = Status, evt_id = EvtId} <- RoomList,
	     Status < 2,
	     EvtId =:= 0 orelse
	       maps:get(conds, adventure_data:get_evt(EvtId), []) =:=
		 []]
	of
      [] -> true;
      _ ->
	  {false,
	   lang:get(<<"Mở khóa sau khi hoàn thành tất cả các "
		      "cuộc khám phá ở cấp độ này"/utf8>>)}
    end;
do_check_room_cond(#role{m_adventure =
			     #m_adventure{room_list = RoomList}},
		   {kill_mon_all}) ->
    case [1
	  || #a_room{status = Status, evt_id = EvtId} <- RoomList,
	     Status < 3,
	     EvtId =:= 0 orelse
	       maps:get(conds, adventure_data:get_evt(EvtId), []) =:=
		 []
		 andalso evt_type(EvtId) =:= mon]
	of
      [] -> true;
      _ ->
	  {false,
	   lang:get(<<"Mở khóa sau khi giết hết quái vật"/utf8>>)}
    end;
do_check_room_cond(_Role, _Cond) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure705, _,
       {__Leveladventure705, __Tracesadventure705}}
	  when __Leveladventure705 band 8 /= 0 orelse
		 __Tracesadventure705 /= [] ->
	  lager:do_log(error,
		       [{module, adventure}, {function, do_check_room_cond},
			{line, 705}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts 条件解析失败:~w",
				     [_Role#role.name, _Cond]),
		       none, 4096, 8, __Leveladventure705,
		       __Tracesadventure705, lager_event, __Pidadventure705);
      _ -> ok
    end,
    {false,
     lang:get(<<"Điều kiện không được đáp ứng"/utf8>>)}.

make_evt(Role = #role{m_adventure =
			  #m_adventure{room_list = RoomList, id = Id,
				       boss_room = BossRoom}},
	 Room) ->
    FloorData = #{evt_list := EvtList0} =
		    adventure_data:get_floor(Id),
    PosEvts = maps:get(pos_evt_list, FloorData, []),
    case lists:keyfind(Room#a_room.id, 1, PosEvts) of
      {_, EvtId} -> EvtId;
      _ ->
	  case [R || R = #a_room{evt_id = 0} <- RoomList] of
	    _ ->
		EvtList = calc_can_out(EvtList0, Role, Room, []),
		case calc_must_out(EvtList, Role, []) of
		  [] -> element(1, util:rand_list(EvtList, 2));
		  Evts -> element(1, util:rand_list(Evts, 2))
		end
	  end
    end.

calc_can_out([], _Role, _Room, L) -> L;
calc_can_out([{EvtId, Rand} | T],
	     Role = #role{m_adventure =
			      #m_adventure{room_list = RoomList,
					   explore_num = ExploreNum,
					   boss_room = BossRoom,
					   round_evt_group = RoundEvtGroup}},
	     Room, L) ->
    case adventure_data:get_evt(EvtId) of
      EvtData = #{evt_group := EvtGroup, max_num := MaxNum,
		  round_max_num := RoundMaxNum,
		  next_out_num := NextOutNum, evt_type := EvtType} ->
	  Conds = maps:get(conds, EvtData, []),
	  case ExploreNum >= maps:get(can_out_num, EvtData, 0)
		 andalso Conds =:= []
	      of
	    true when BossRoom =:= 0 orelse EvtType =/= boss ->
		case (MaxNum =:= 0 orelse
			EvtGroup =:= 0 orelse
			  MaxNum >
			    length([1
				    || R <- RoomList,
				       evt_group(R#a_room.init_evt_id) =:=
					 EvtGroup]))
		       andalso
		       (RoundMaxNum =:= 0 orelse
			  EvtGroup =:= 0 orelse
			    RoundMaxNum >
			      list_util:keyfind(EvtGroup, RoundEvtGroup, 0))
		    of
		  true ->
		      case NextOutNum =:= 0 orelse
			     EvtGroup =:= 0 orelse
			       lists:min([99 | [ExploreNum - Idx
						|| #a_room{idx = Idx,
							   init_evt_id = EvtId1}
						       <- RoomList,
						   evt_group(EvtId1) =:=
						     EvtGroup]])
				 >= NextOutNum
			  of
			true when EvtType =:= block ->
			    L1 = [lists:keyfind(next_id(Room#a_room.id, I),
						#a_room.id, RoomList)
				  || I <- [-4, 4, 6, -6]],
			    case [1
				  || #a_room{status = 2, evt_id = EvtId1} <- L1,
				     maps:get(evt_type,
					      adventure_data:get_evt(EvtId1))
				       =:= EvtType]
				of
			      [] ->
				  calc_can_out(T, Role, Room,
					       [{EvtId, Rand} | L]);
			      _ -> calc_can_out(T, Role, Room, L)
			    end;
			true ->
			    calc_can_out(T, Role, Room, [{EvtId, Rand} | L]);
			_ -> calc_can_out(T, Role, Room, L)
		      end;
		  _ -> calc_can_out(T, Role, Room, L)
		end;
	    _ -> calc_can_out(T, Role, Room, L)
	  end;
      _ -> calc_can_out(T, Role, Room, L)
    end.

calc_must_out([], _Role, L) -> L;
calc_must_out([{EvtId, Rand} | T],
	      Role = #role{m_adventure =
			       #m_adventure{room_list = RoomList,
					    explore_num = ExploreNum}},
	      L) ->
    #{must_out_num := MustOutNum} =
	adventure_data:get_evt(EvtId),
    case MustOutNum > 0 andalso
	   ExploreNum >= MustOutNum andalso
	     not
	       lists:keymember(EvtId, #a_room.init_evt_id, RoomList)
	of
      true -> calc_must_out(T, Role, [{EvtId, Rand} | L]);
      _ -> calc_must_out(T, Role, L)
    end.

-spec acc_room_num(#role{}, pos_integer(),
		   pos_integer()) -> #role{}.

acc_room_num(Role, FloorId, Num)
    when is_integer(Num) andalso is_integer(FloorId) ->
    Role;
acc_room_num(Role, FloorId, Num) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure800, _,
       {__Leveladventure800, __Tracesadventure800}}
	  when __Leveladventure800 band 8 /= 0 orelse
		 __Tracesadventure800 /= [] ->
	  lager:do_log(error,
		       [{module, adventure}, {function, acc_room_num},
			{line, 800}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("错误的探索房间数量 ~w ~w", [FloorId, Num]), none,
		       4096, 8, __Leveladventure800, __Tracesadventure800,
		       lager_event, __Pidadventure800);
      _ -> ok
    end,
    Role.

log_save_task(Role = #role{lev = Lev}, EvtType,
	      Status) ->
    case evt_type_id(EvtType) of
      0 -> pass;
      _ ->
	  log:save(task,
		   {Role, Status, evt_type_id(EvtType),
		    atom_to_binary(EvtType, unicode), 97, <<"神界冒险"/utf8>>,
		    util:fbin("lev:~w", [Lev])})
    end.

-spec set_use_partner(#role{}, pos_integer()) -> {ok,
						  #role{}} |
						 {false, bitstring()}.

set_use_partner(Role = #role{m_adventure =
				 MAdventure = #m_adventure{plist = PList}},
		PId) ->
    case lists:keyfind(PId, #partner.id, PList) of
      #partner{all_attr = #attr{hp = 0}} ->
	  {false,
	   lang:get(<<"Không thể thiết lập Ninja tử thần"/utf8>>)};
      #partner{} ->
	  NRole = Role#role{m_adventure =
				MAdventure#m_adventure{partner_id = PId}},
	  {ok, NRole};
      _ -> {false, lang:get(<<"Ninja không tồn tại"/utf8>>)}
    end.

-spec set_partners(#role{}, list()) -> {ok, #role{}} |
				       {false, bitstring()}.

set_partners(Role = #role{lev = Lev,
			  m_adventure =
			      MAdventure = #m_adventure{laste_num = LastNum,
							plist = []}},
	     PIds) ->
    case Lev >= adventure_data:get_const(open_lev) of
      true ->
	  case calc_partners(PIds, Role, []) of
	    {false, Reason} -> {false, Reason};
	    {ok, PList = [#partner{id = Id} | _]} ->
		{StartTime, EndTime} = adventure_mgr:calc_time(),
		NRole = init_adventure(Role#role{m_adventure =
						     MAdventure#m_adventure{plist
										=
										PList,
									    shop_list
										=
										[],
									    start_time
										=
										StartTime,
									    end_time
										=
										EndTime,
									    bag_list
										=
										[],
									    partner_id
										=
										Id}}),
		push_partners(NRole),
		{ok, NRole, LastNum}
	  end;
      _ -> {false, lang:get(<<"Cấp độ không đủ"/utf8>>)}
    end;
set_partners(_Role, _PIds) ->
    {false,
     lang:get(<<"Thiết lập Ninja đã hoàn tất"/utf8>>)}.

calc_partners([], _Role, []) ->
    {false, lang:get(<<"Ít nhất một Ninja"/utf8>>)};
calc_partners([], _Role, PList) -> {ok, PList};
calc_partners([Id | T], Role, PList) ->
    case partner_lib:get_partner(Role, Id) of
      false ->
	  {false, lang:get(<<"Không tìm thấy Ninja"/utf8>>)};
      #partner{end_time = EndTime} when EndTime =/= 0 ->
	  {false,
	   lang:get(<<"Anh hùng Arcane không thể tham gia vào "
		      "trò chơi này"/utf8>>)};
      Partner = #partner{bid = Bid,
			 all_attr = Attr = #attr{hp = Hp, hp_max = HpMax}} ->
	  case lists:keymember(Bid, #partner.bid, PList) of
	    true ->
		{false,
		 lang:get(<<"Không thể sử dụng các Ninja trùng lặp"/utf8>>)};
	    false ->
		calc_partners(T, Role,
			      [Partner#partner{all_attr =
						   Attr#attr{hp =
								 max(Hp,
								     HpMax)}}
			       | PList])
	  end
    end.

-spec use_skill(#role{}, SId :: pos_integer(),
		Val :: pos_integer()) -> {false, binary()} |
					 {ok, #role{}}.

use_skill(Role = #role{m_adventure =
			   #m_adventure{skill_list = SkillList,
					skill_used = SkillUsed}},
	  SId, Val) ->
    case lists:keyfind(SId, 1, SkillList) of
      {SId, Num} when Num > 0 ->
	  SkillData = adventure_data:get_skill(SId),
	  UsedNum = list_util:keyfind(SId, SkillUsed, 0),
	  MaxNum = maps:get(max_num, SkillData, 0),
	  case MaxNum =:= 0 orelse MaxNum > UsedNum of
	    true -> do_use_skill(Role, SId, Num, Val, SkillData);
	    _ ->
		{false,
		 lang:get(<<"Phước lành này đã đạt đến giới hạn sử "
			    "dụng tối đa cho vòng này"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Hiện tại vẫn chưa có phước lành nào "
		      "như vậy. Bạn có thể tìm thấy nó bằng "
		      "cách tiếp tục cuộc phiêu lưu của mình.~"/utf8>>)}
    end.

do_use_skill(Role = #role{m_adventure =
			      MAdventure = #m_adventure{skill_list = SkillList,
							shop_list = ShopList,
							skill_used =
							    SkillUsed}},
	     SkillId, BuffNum, _Val,
	     #{name := SName, effect := [{shop, Group, N}]}) ->
    N1 = length(ShopList),
    Fun = fun (I, {GoodListT, ShopListT}) ->
		  {Id, _} = adventure_action:rand_good(ShopListT,
						       adventure_data:exch_group({Group,
										  I})),
		  #{pay_type := PayType, pay_val := PayVal, bid := Bid,
		    num := Num, discount := Discount, old_val := OldVal} =
		      adventure_data:get_exch(Id),
		  GoodT = #{id => I + N1, room_id => 0, exec_id => Id,
			    pay_type => PayType, pay_val => PayVal,
			    old_val => OldVal, bid => Bid, num => Num,
			    is_buy => 0, discount => Discount},
		  {[GoodT | GoodListT], [GoodT | ShopListT]}
	  end,
    {GoodList, NewShopList} = lists:foldl(Fun,
					  {[], ShopList}, lists:seq(1, N)),
    NewSkillList = lists:keyreplace(SkillId, 1, SkillList,
				    {SkillId, BuffNum - 1}),
    {_, UsedNum} = list_util:keyfind(SkillId, 1, SkillUsed,
				     {SkillId, 0}),
    NewSkillUsed = lists:keystore(SkillId, 1, SkillUsed,
				  {SkillId, UsedNum + 1}),
    sys_conn:pack_send(20631, {2, GoodList}),
    NRole = Role#role{m_adventure =
			  MAdventure#m_adventure{shop_list = NewShopList,
						 skill_list = NewSkillList,
						 skill_used = NewSkillUsed}},
    notice:alert(util:fbin(lang:get(<<"[Triệu hồi thương gia] Sử dụng thành "
				      "công, vật phẩm này có thể được xem trong "
				      "Cửa hàng phiêu lưu"/utf8>>),
			   [])),
    push_skill(NRole),
    NewRole =
	role_trigger:fire(#evt_adventure_item_expend_count{id =
							       shop},
			  NRole),
    {ok, NewRole};
do_use_skill(Role = #role{m_adventure =
			      MAdventure = #m_adventure{skill_list = SkillList,
							plist = PList,
							skill_used =
							    SkillUsed}},
	     SkillId, Num, Val,
	     #{name := SName, effect := [{add_hp, Per}]}) ->
    case lists:keyfind(Val, #partner.id, PList) of
      #partner{all_attr = #attr{hp = 0}} ->
	  {false, lang:get(<<"Ninja đã chết"/utf8>>)};
      #partner{all_attr = #attr{hp = Hp, hp_max = Hp}} ->
	  {false,
	   lang:get(<<"Cuộc sống của người anh hùng hiện tại "
		      "thật trọn vẹn"/utf8>>)};
      P = #partner{all_attr =
		       Attr = #attr{hp = Hp, hp_max = HpMax}} ->
	  NewP = P#partner{all_attr =
			       Attr#attr{hp = Hp + round(Per * HpMax / 1000)}},
	  NewPList = lists:keyreplace(Val, #partner.id, PList,
				      NewP),
	  NewSkillList = lists:keyreplace(SkillId, 1, SkillList,
					  {SkillId, Num - 1}),
	  {_, UsedNum} = list_util:keyfind(SkillId, 1, SkillUsed,
					   {SkillId, 0}),
	  NewSkillUsed = lists:keystore(SkillId, 1, SkillUsed,
					{SkillId, UsedNum + 1}),
	  NRole = Role#role{m_adventure =
				MAdventure#m_adventure{plist = NewPList,
						       skill_list =
							   NewSkillList,
						       skill_used =
							   NewSkillUsed}},
	  notice:alert(util:fbin(lang:get(<<"【~ts】Sử dụng thành công"/utf8>>),
				 [SName])),
	  push_skill(NRole),
	  push_partners(NRole),
	  NewRole =
	      role_trigger:fire(#evt_adventure_item_expend_count{id =
								     add_hp},
				NRole),
	  {ok, NewRole};
      _ -> {false, lang:get(<<"Ninja không tồn tại"/utf8>>)}
    end;
do_use_skill(Role = #role{m_adventure =
			      MAdventure = #m_adventure{skill_list = SkillList,
							bag_list = BagList,
							room_list = RoomList,
							pass_num = PassNum,
							skill_used = SkillUsed,
							kill_mon = KillMon}},
	     SkillId, Num, Val,
	     #{name := SName, effect := [{kill_mon}]}) ->
    case lists:keyfind(Val, #a_room.id, RoomList) of
      #a_room{status = 3} ->
	  {false, lang:get(<<"Hoàn thành"/utf8>>)};
      Room = #a_room{status = 2, evt_id = EvtId} ->
	  case adventure_data:get_evt(EvtId) of
	    #{evt_type := boss} ->
		case [{RoomId, EvtId1}
		      || #a_room{id = RoomId, evt_id = EvtId1, status = 2}
			     <- RoomList,
			 lists:member(evt_type(EvtId1),
				      [mon, mon2, mon3, mon4])]
		    of
		  [] ->
		      EvtData = adventure_data:get_evt(EvtId),
		      {Items, _RatioItems} = evt_drop(Role, EvtData),
		      AllGL = format:val_to_gain(Items, adventure),
		      case role_gain:do_notice(Role, AllGL) of
			{false, #loss{msg = Msg}} -> {false, Msg};
			{false, #gain{msg = Msg}} -> {false, Msg};
			{ok, Role0} ->
			    NewRoom = Room#a_room{status = 3},
			    NewRoomList = lists:keyreplace(Val, #a_room.id,
							   RoomList, NewRoom),
			    NewSkillList = lists:keyreplace(SkillId, 1,
							    SkillList,
							    {SkillId, Num - 1}),
			    NewBagList = item_lib:merge(Items, BagList),
			    {_, UsedNum} = list_util:keyfind(SkillId, 1,
							     SkillUsed,
							     {SkillId, 0}),
			    NewSkillUsed = lists:keystore(SkillId, 1, SkillUsed,
							  {SkillId,
							   UsedNum + 1}),
			    Role1 = Role0#role{m_adventure =
						   MAdventure#m_adventure{room_list
									      =
									      NewRoomList,
									  is_kill_boss
									      =
									      1,
									  skill_list
									      =
									      NewSkillList,
									  bag_list
									      =
									      NewBagList,
									  pass_num
									      =
									      PassNum
										+
										1,
									  skill_used
									      =
									      NewSkillUsed,
									  kill_mon
									      =
									      KillMon
										+
										1}},
			    NRole = room_finish(Role1, NewRoom),
			    notice:alert(util:fbin(lang:get(<<"【~ts】Sử dụng thành công"/utf8>>),
						   [SName])),
			    push_skill(NRole),
			    push_round_reward(NRole),
			    NewRole =
				role_trigger:fire(#evt_adventure_item_expend_count{id
										       =
										       kill_mon},
						  NRole),
			    {ok, NewRole}
		      end;
		  _ ->
		      {false,
		       lang:get(<<"Hãy giết tên lính canh trước"/utf8>>)}
		end;
	    #{evt_type := EvtType}
		when EvtType =:= mon orelse
		       EvtType =:= mon2 orelse
			 EvtType =:= mon3 orelse EvtType =:= mon4 ->
		EvtData = adventure_data:get_evt(EvtId),
		{Items, _RatioItems} = evt_drop(Role, EvtData),
		AllGL = format:val_to_gain(Items, adventure),
		case role_gain:do_notice(Role, AllGL) of
		  {false, #loss{msg = Msg}} -> {false, Msg};
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, Role0} ->
		      NewRoom = Room#a_room{status = 3},
		      NewRoomList = lists:keyreplace(Val, #a_room.id,
						     RoomList, NewRoom),
		      NewSkillList = lists:keyreplace(SkillId, 1, SkillList,
						      {SkillId, Num - 1}),
		      NewBagList = item_lib:merge(Items, BagList),
		      {_, UsedNum} = list_util:keyfind(SkillId, 1, SkillUsed,
						       {SkillId, 0}),
		      NewSkillUsed = lists:keystore(SkillId, 1, SkillUsed,
						    {SkillId, UsedNum + 1}),
		      Role1 = Role0#role{m_adventure =
					     MAdventure#m_adventure{room_list =
									NewRoomList,
								    skill_list =
									NewSkillList,
								    bag_list =
									NewBagList,
								    pass_num =
									PassNum
									  + 1,
								    skill_used =
									NewSkillUsed,
								    kill_mon =
									KillMon
									  + 1}},
		      NRole = room_finish(Role1, NewRoom),
		      notice:alert(util:fbin(lang:get(<<"【~ts】Sử dụng thành công"/utf8>>),
					     [SName])),
		      push_skill(NRole),
		      push_round_reward(NRole),
		      NewRole =
			  role_trigger:fire(#evt_adventure_item_expend_count{id
										 =
										 kill_mon},
					    NRole),
		      {ok, NewRole}
		end;
	    _ ->
		{false, lang:get(<<"Loại sự kiện không đúng"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Dữ liệu phòng không tồn tại"/utf8>>)}
    end;
do_use_skill(_Role, _BuffId, _Num, _Val, _Data) ->
    {false,
     lang:get(<<"Dữ liệu cấu hình không tồn tại"/utf8>>)}.

-spec buy(#role{}, pos_integer()) -> {false,
				      bitstring()} |
				     {ok, #role{}}.

buy(Role = #role{m_adventure =
		     MAdventure = #m_adventure{shop_list = ShopList}},
    Id) ->
    case maps_util:keyfind(ShopList, id, Id) of
      {ok,
       D = #{exec_id := ExecId, is_buy := 0,
	     pay_type := PayType, pay_val := PayVal, bid := Bid,
	     num := Num}} ->
	  GL0 = format:val_to_loss([{PayType, PayVal}],
				   adventure),
	  GL1 = format:val_to_gain([{Bid, Num}], adventure),
	  GL = GL0 ++ GL1,
	  case role_gain:do_notice(Role, GL,
				   #gain_loss_opts{type = 1})
	      of
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, Role1} ->
		NewD = D#{is_buy := 1},
		NewShopList = [NewD | maps_util:keydelete(ShopList, id,
							  Id)],
		NRole = Role1#role{m_adventure =
				       MAdventure#m_adventure{shop_list =
								  NewShopList}},
		log:log_gain(GL, Role, NRole, <<"冒险"/utf8>>,
			     util:fbin("神秘商人:id:~w itembid:~w", [ExecId, Bid])),
		log_save_task(NRole, shop, 1),
		push_base(NRole),
		NewRole =
		    role_trigger:fire(#evt_adventure_trade_count{}, NRole),
		{ok, NewRole}
	  end;
      #{} -> {false, lang:get(<<"Mặt hàng đã mua"/utf8>>)};
      _ ->
	  {false, lang:get(<<"Sản phẩm không tồn tại"/utf8>>)}
    end.

evt_type_id(null) -> 0;
evt_type_id(buff) -> 1;
evt_type_id(boss) -> 2;
evt_type_id(finger_guessing) -> 3;
evt_type_id(box) -> 4;
evt_type_id(mon) -> 5;
evt_type_id(npc) -> 6;
evt_type_id(answer) -> 7;
evt_type_id(next) -> 9;
evt_type_id(effect) -> 10;
evt_type_id(freebox) -> 12;
evt_type_id(npc2) -> 13;
evt_type_id(shop) -> 14;
evt_type_id(mon2) -> 17;
evt_type_id(mon3) -> 18;
evt_type_id(mon4) -> 19;
evt_type_id(skill) -> 20;
evt_type_id(_) -> 0.

is_open_holiday(Role) ->
    case holiday_lib:get_open_holiday(Role,
				      [7005, 97005, 997005])
	of
      #holiday{end_time = EndTime} ->
	  case EndTime - date:unixtime() - 86400 > 0 of
	    true -> 1;
	    _ -> 0
	  end;
      _ -> 0
    end.


