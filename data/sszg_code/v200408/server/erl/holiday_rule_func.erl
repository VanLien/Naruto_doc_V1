-file("src/mod/holiday/holiday_rule_func.erl", 1).

-module(holiday_rule_func).

-lager_records([{exchange_data_other,
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{condition, [label, op, val, msg]},
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
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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

-export([get_exchange_info/2, fire/3, qry/2, take/4,
	 zero_flush/2, send_mail/2, set_timer/1]).

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

-file("src/mod/holiday/holiday_rule_func.erl", 16).

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

-file("src/mod/holiday/holiday_rule_func.erl", 17).

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

-file("src/mod/holiday/holiday_rule_func.erl", 18).

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

-file("src/mod/holiday/holiday_rule_func.erl", 19).

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

-file("src/mod/holiday/holiday_rule_func.erl", 20).

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

-file("src/mod/holiday/holiday_rule_func.erl", 21).

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

-file("src/mod/holiday/holiday_rule_func.erl", 22).

-file("inc/log.hrl", 1).

-file("src/mod/holiday/holiday_rule_func.erl", 23).

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

-file("src/mod/holiday/holiday_rule_func.erl", 24).

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

-file("src/mod/holiday/holiday_rule_func.erl", 25).

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

-file("src/mod/holiday/holiday_rule_func.erl", 26).

-file("inc/condition.hrl", 1).

-record(condition,
	{label  :: atom(),
	 op = eq  ::
	     ue | eq | lt | gt | le | ge | range | include,
	 val  :: term(), msg = <<>>  :: bitstring()}).

-file("src/mod/holiday/holiday_rule_func.erl", 27).

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

-file("src/mod/holiday/holiday_rule_func.erl", 28).

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

-file("src/mod/holiday/holiday_rule_func.erl", 29).

-spec get_exchange_info(#holiday{}, #role{}) -> list().

get_exchange_info(#holiday{tbid = TBid,
			   camp_id = CampId, bid = Bid, end_time = EndTime,
			   reward = [_, _, ExchangeName, NeedId, Reward]},
		  Role)
    when TBid =:= 3003 orelse
	   TBid =:= 3010 orelse
	     TBid =:= 3011 orelse
	       TBid =:= 3012 orelse TBid =:= 3017 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Fun = fun ({Aim, LimitNum, ExpendId, ExpendNum, Award,
		IsLable, BStr},
	       Acc) ->
		  Num = list_util:keyfind(Aim, Lists, 0),
		  [{Aim, BStr, Num, LimitNum, IsLable, ExpendId,
		    ExpendNum, Award, []}
		   | Acc]
	  end,
    ExchangeList = lists:foldl(Fun, [], Reward),
    [{Bid, EndTime, ExchangeName, NeedId, ExchangeList}];
get_exchange_info(#holiday{tbid = TBid,
			   camp_id = CampId, bid = Bid, end_time = EndTime,
			   reward = [ExchangeName, Reward]},
		  Role)
    when TBid =:= 3018 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    OpenDay = date:open_srv_day(),
    {_, HolidayOpenDay} =
	sys_env:get(holiday_lantern_adventure),
    DoDay = max(1, OpenDay - HolidayOpenDay + 1),
    Fun = fun ({Aim, LimitNum, ExpendId, ExpendNum, Award,
		IsLable, LimitDay, BStr},
	       Acc) ->
		  case DoDay >= LimitDay of
		    true ->
			Num = list_util:keyfind(Aim, Lists, 0),
			[{Aim, BStr, Num, LimitNum, IsLable, ExpendId,
			  ExpendNum, Award, []}
			 | Acc];
		    _ -> Acc
		  end
	  end,
    ExchangeList = lists:foldl(Fun, [], Reward),
    [{Bid, EndTime, ExchangeName, 0, ExchangeList}];
get_exchange_info(#holiday{tbid = TBid,
			   camp_id = CampId, bid = Bid, end_time = EndTime,
			   reward = [ExchangeName, Reward]},
		  Role)
    when TBid =:= 3031 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    OpenDay = date:open_srv_day(),
    {_, HolidayOpenDay} =
	sys_env:get(holiday_lantern_adventure1),
    DoDay = max(1, OpenDay - HolidayOpenDay + 1),
    Fun = fun ({Aim, LimitNum, ExpendId, ExpendNum, Award,
		IsLable, LimitDay, BStr},
	       Acc) ->
		  case DoDay >= LimitDay of
		    true ->
			Num = list_util:keyfind(Aim, Lists, 0),
			[{Aim, BStr, Num, LimitNum, IsLable, ExpendId,
			  ExpendNum, Award, []}
			 | Acc];
		    _ -> Acc
		  end
	  end,
    ExchangeList = lists:foldl(Fun, [], Reward),
    [{Bid, EndTime, ExchangeName, 0, ExchangeList}];
get_exchange_info(#holiday{tbid = TBid,
			   camp_id = CampId, bid = Bid, end_time = EndTime,
			   reward = [ExchangeName, Reward]},
		  Role)
    when TBid =:= 3032 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    OpenDay = date:open_srv_day(),
    {_, HolidayOpenDay} =
	sys_env:get(holiday_lantern_adventure2),
    DoDay = max(1, OpenDay - HolidayOpenDay + 1),
    Fun = fun ({Aim, LimitNum, ExpendId, ExpendNum, Award,
		IsLable, LimitDay, BStr},
	       Acc) ->
		  case DoDay >= LimitDay of
		    true ->
			Num = list_util:keyfind(Aim, Lists, 0),
			[{Aim, BStr, Num, LimitNum, IsLable, ExpendId,
			  ExpendNum, Award, []}
			 | Acc];
		    _ -> Acc
		  end
	  end,
    ExchangeList = lists:foldl(Fun, [], Reward),
    [{Bid, EndTime, ExchangeName, 0, ExchangeList}];
get_exchange_info(#holiday{tbid = TBid,
			   camp_id = CampId, bid = Bid, end_time = EndTime,
			   reward = [ExchangeName, Reward]},
		  Role)
    when TBid =:= 3033 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    OpenDay = date:open_srv_day(),
    {_, HolidayOpenDay} =
	sys_env:get(holiday_lantern_adventure3),
    DoDay = max(1, OpenDay - HolidayOpenDay + 1),
    Fun = fun ({Aim, LimitNum, ExpendId, ExpendNum, Award,
		IsLable, LimitDay, BStr},
	       Acc) ->
		  case DoDay >= LimitDay of
		    true ->
			Num = list_util:keyfind(Aim, Lists, 0),
			[{Aim, BStr, Num, LimitNum, IsLable, ExpendId,
			  ExpendNum, Award, []}
			 | Acc];
		    _ -> Acc
		  end
	  end,
    ExchangeList = lists:foldl(Fun, [], Reward),
    [{Bid, EndTime, ExchangeName, 0, ExchangeList}];
get_exchange_info(#holiday{tbid = TBid,
			   camp_id = CampId, bid = Bid, end_time = EndTime,
			   reward = [ExchangeName, NeedId, Reward]},
		  Role)
    when TBid =:= 3029 orelse
	   TBid =:= 3037 orelse TBid =:= 3049 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Fun = fun ({Aim, LimitNum, ExpendId, ExpendNum, Award,
		IsLable, BStr},
	       Acc) ->
		  Num = list_util:keyfind(Aim, Lists, 0),
		  [{Aim, BStr, Num, LimitNum, IsLable, ExpendId,
		    ExpendNum, Award, []}
		   | Acc]
	  end,
    ExchangeList = lists:foldl(Fun, [], Reward),
    [{Bid, EndTime, ExchangeName, NeedId, ExchangeList}];
get_exchange_info(Holiday = #holiday{tbid = 3040,
				     bid = Bid, end_time = EndTime},
		  Role) ->
    ExchangeList = exchange:get_holiday_exchange(Holiday,
						 Role),
    ExchangeName = lang:get(<<"圣夜商店"/utf8>>),
    NeedId = 80244,
    [{Bid, EndTime, ExchangeName, NeedId, ExchangeList}];
get_exchange_info(_Holiday, _Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule_func131, _,
       {__Levelholiday_rule_func131,
	__Tracesholiday_rule_func131}}
	  when __Levelholiday_rule_func131 band 128 /= 0 orelse
		 __Tracesholiday_rule_func131 /= [] ->
	  lager:do_log(debug,
		       [{module, holiday_rule_func},
			{function, get_exchange_info}, {line, 131},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("请求了未处理的商城数据~w", [_Holiday]), none, 4096,
		       128, __Levelholiday_rule_func131,
		       __Tracesholiday_rule_func131, lager_event,
		       __Pidholiday_rule_func131);
      _ -> ok
    end,
    [].

-spec fire(#holiday{}, #role{}, tuple()) -> {ok,
					     #role{}}.

fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = 3007, reward = [{AllAward, Reward}]},
     Role = #role{assets = #assets{vip_exp = VipExp}},
     #evt_cli_loaded{}) ->
    {AllAwardStaus, Lists} = holiday_lib:get_tv_val(CampId,
						    Bid, Role),
    Fun = fun ({Aim, {Evt, Type}, _BStr, _Award}, Acc) ->
		  case list_util:keyfind(Aim, Lists, 0) of
		    Status = 0 ->
			NewStatus = case Evt of
				      evt_month_card ->
					  case month_card:is_activate(Role,
								      Type)
					      of
					    true -> 1;
					    _ -> Status
					  end;
				      evt_charge_invest ->
					  case holiday_lib:get_tv_val(1001,
								      991003,
								      Role)
					      of
					    {AccVal0, _} when AccVal0 > 0 -> 1;
					    _ -> Status
					  end;
				      evt_charge_fund ->
					  case holiday_lib:get_tv_val(1001,
								      991003,
								      Role)
					      of
					    {AccVal0, _} when AccVal0 > 0 -> 1;
					    _ -> Status
					  end;
				      evt_pay ->
					  case VipExp > 0 of
					    true -> 1;
					    _ -> Status
					  end;
				      _ -> Status
				    end,
			[{Aim, NewStatus} | Acc];
		    Status -> [{Aim, Status} | Acc]
		  end
	  end,
    NewList = lists:foldl(Fun, [], Reward),
    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
    {NewRole, NewAllAwardStaus} = do_mail(Role, NewList,
					  AllAward, AllAwardStaus),
    NewRole2 = holiday_lib:set_tv_val(CampId, NewRole,
				      {NewAllAwardStaus, NewList}, ExpireSec),
    holiday:push_bid_can_reward(NewRole2, Bid),
    holiday_lib:push_holiday_one(NewRole2, Bid),
    {ok, NewRole2};
fire(Holiday = #holiday{tbid = 3007}, Role = #role{},
     #evt_pay{}) ->
    do_func_honor_fire(Holiday, Role, evt_pay, 0);
fire(Holiday = #holiday{tbid = 3007}, Role = #role{},
     #evt_charge_invest{}) ->
    do_func_honor_fire(Holiday, Role, evt_charge_invest, 0);
fire(Holiday = #holiday{tbid = 3007}, Role = #role{},
     #evt_charge_fund{}) ->
    do_func_honor_fire(Holiday, Role, evt_charge_fund, 0);
fire(Holiday = #holiday{tbid = 3007}, Role = #role{},
     #evt_month_card{type = Type}) ->
    do_func_honor_fire(Holiday, Role, evt_month_card, Type);
fire(Holiday = #holiday{tbid = TBid, camp_id = CampId,
			bid = Bid, reward = Reward},
     Role = #role{}, #evt_partner_star_up{star = Star})
    when TBid == 3013 orelse TBid == 3014 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Fun = fun ({Aim, MaxCount, NeedStart, _Award, _BStr},
	       Acc) ->
		  {FinishCount, AwardCount} = list_util:keyfind(Aim,
								Lists, {0, 0}),
		  case Star == NeedStart of
		    true ->
			case FinishCount >= MaxCount of
			  true -> [{Aim, {FinishCount, AwardCount}} | Acc];
			  _ -> [{Aim, {FinishCount + 1, AwardCount}} | Acc]
			end;
		    _ -> [{Aim, {FinishCount, AwardCount}} | Acc]
		  end
	  end,
    NewList = lists:foldl(Fun, [], Reward),
    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
    NewRole2 = holiday_lib:set_tv_val(CampId, Role, NewList,
				      ExpireSec),
    holiday:push_bid_can_reward(NewRole2, Bid),
    holiday_lib:push_holiday_one(NewRole2, Bid),
    {ok, NewRole2};
fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = 3023},
     Role, #evt_gain_activity{val = Val}) ->
    case Val > 0 of
      true ->
	  {Count, GetAimList} = holiday_lib:get_tv_val(CampId,
						       Bid, Role),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NewRole = holiday_lib:set_tv_val(CampId, Role,
					   {Count + Val, GetAimList},
					   ExpireSec),
	  holiday:push_bid_can_reward(NewRole, Bid),
	  holiday_lib:push_holiday_one(NewRole, Bid),
	  {ok, NewRole};
      false -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = 3025, reward = Reward},
     Role, #evt_holiday_break_egg{count = AddCount}) ->
    {Count, Lists} = holiday_lib:get_tv_val(CampId, Bid,
					    Role),
    NewCount = Count + AddCount,
    Fun = fun ({Aim, NeedCount, _Award, _BStr}, Acc) ->
		  case list_util:keyfind(Aim, Lists, 0) of
		    0 when NeedCount =< NewCount -> [{Aim, 1} | Acc];
		    Status -> [{Aim, Status} | Acc]
		  end
	  end,
    NewList = lists:foldl(Fun, [], Reward),
    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
    NewRole2 = holiday_lib:set_tv_val(CampId, Role,
				      {NewCount, NewList}, ExpireSec),
    holiday:push_bid_can_reward(NewRole2, Bid),
    holiday_lib:push_holiday_one(NewRole2, Bid),
    {ok, NewRole2};
fire(Holiday = #holiday{tbid = 3026, camp_id = CampId,
			bid = Bid, reward = Reward},
     Role = #role{}, Evt)
    when is_record(Evt, evt_partner_star_up) orelse
	   is_record(Evt, evt_partner_star_up_specific) ->
    {PBid, Star} = case Evt of
		     #evt_partner_star_up{bid = PBidT, star = StarT} ->
			 {PBidT, StarT};
		     #evt_partner_star_up_specific{bid = PBidT,
						   star = StarT} ->
			 {PBidT, StarT};
		     _ -> {0, 0}
		   end,
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Fun = fun ({Aim, MaxCount, NeedPartnerBid, NeedStart,
		_Award, _BStr},
	       Acc) ->
		  {FinishCount, AwardCount} = list_util:keyfind(Aim,
								Lists, {0, 0}),
		  case NeedPartnerBid == PBid andalso Star >= NeedStart of
		    true ->
			case FinishCount >= MaxCount of
			  true -> [{Aim, {FinishCount, AwardCount}} | Acc];
			  _ -> [{Aim, {FinishCount + 1, AwardCount}} | Acc]
			end;
		    _ -> [{Aim, {FinishCount, AwardCount}} | Acc]
		  end
	  end,
    NewList = lists:foldl(Fun, [], Reward),
    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
    NewRole2 = holiday_lib:set_tv_val(CampId, Role, NewList,
				      ExpireSec),
    holiday:push_bid_can_reward(NewRole2, Bid),
    holiday_lib:push_holiday_one(NewRole2, Bid),
    {ok, NewRole2};
fire(Holiday = #holiday{tbid = 3028, camp_id = CampId,
			bid = Bid},
     Role = #role{}, #evt_zero_push{}) ->
    {_DayList, BuyList} = holiday_lib:get_tv_val(CampId,
						 Bid, Role),
    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
    NewRole2 = holiday_lib:set_tv_val(CampId, Role,
				      {[], BuyList}, ExpireSec),
    holiday_lib:push_holiday_one(NewRole2, Bid),
    {ok, NewRole2};
fire(Holiday, Role, _Evt) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule_func281, _,
       {__Levelholiday_rule_func281,
	__Tracesholiday_rule_func281}}
	  when __Levelholiday_rule_func281 band 8 /= 0 orelse
		 __Tracesholiday_rule_func281 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule_func}, {function, fire},
			{line, 281}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]处理活动~w失败:~w",
				     [Role#role.name, Holiday, _Evt]),
		       none, 4096, 8, __Levelholiday_rule_func281,
		       __Tracesholiday_rule_func281, lager_event,
		       __Pidholiday_rule_func281);
      _ -> ok
    end,
    {ok, Role}.

do_func_honor_fire(Holiday = #holiday{camp_id = CampId,
				      bid = Bid, reward = [{AllAward, Reward}]},
		   Role, Atom, Type) ->
    case [I
	  || I = {_Aim, {Evt, TypeT}, _, _Award} <- Reward,
	     Evt == Atom andalso TypeT == Type]
	of
      [{Aim, _, _, _} | _] ->
	  {AllAwardStaus, GetAimList} = case
					  holiday_lib:get_tv_val(CampId, Bid,
								 Role)
					    of
					  {0, []} ->
					      {0,
					       [{IdT, 0}
						|| {IdT, _, _, _} <- Reward]};
					  Val -> Val
					end,
	  case lists:keyfind(Aim, 1, GetAimList) of
	    {_, Status} when Status =/= 0 -> {ok, Role};
	    _ ->
		NewList = lists:keystore(Aim, 1, GetAimList, {Aim, 1}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		{NewRole, NewAllAwardStaus} = do_mail(Role, NewList,
						      AllAward, AllAwardStaus),
		NewRole2 = holiday_lib:set_tv_val(CampId, NewRole,
						  {NewAllAwardStaus, NewList},
						  ExpireSec),
		holiday:push_bid_can_reward(NewRole2, Bid),
		holiday_lib:push_holiday_one(NewRole2, Bid),
		{ok, NewRole2}
	  end;
      _ -> {ok, Role}
    end.

do_mail(Role, NewList, AllAward, OldStatus) ->
    case [AimT || {AimT, StatusT} <- NewList, StatusT == 0]
	   == []
	   andalso OldStatus == 0
	of
      true ->
	  Content = lang:get(<<"恭喜您达成所有条件,获得了尊贵的称号礼"/utf8>>),
	  {MailAssets, MailItems} =
	      format:split_assets_items(AllAward),
	  Mail = {lang:get(<<"强力称号礼奖励"/utf8>>), Content,
		  MailAssets, MailItems, lang:get(<<"强力称号礼奖励"/utf8>>)},
	  {ok, NewRoleT} = mail:add(Role, Mail),
	  {NewRoleT, 1};
      _ -> {Role, OldStatus}
    end.

-spec qry(#holiday{}, #role{}) -> {error, bitstring()} |
				  tuple().

qry(#holiday{tbid = 3002}, _Role) ->
    {0, 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3003, reward = [_, _, _, NeedId, _],
	     end_time = EndTime, cli_reward = CliReward,
	     item_effect = ItemEff},
    _Role) ->
    Now = date:unixtime(),
    RewardData = [{0, <<>>, 0, [], [{4, NeedId, <<>>}]}],
    RankList = [],
    {max(0, EndTime - Now), 0, RewardData, ItemEff, [],
     CliReward, RankList};
qry(#holiday{tbid = 3006, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Reward,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    Now = date:unixtime(),
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Fun = fun ({PartnerBid, Aim, ExpendId, ExpendNum, Award,
		{ShowId, ShowNum}}) ->
		  Num = list_util:keyfind(PartnerBid, Lists, 0),
		  Status = if Num >= Aim -> 2;
			      true -> 0
			   end,
		  AimArgs = [{18, PartnerBid, <<>>}, {19, ExpendId, <<>>},
			     {20, ExpendNum, <<>>}, {21, ShowId, <<>>},
			     {22, ShowNum, <<>>}],
		  {Aim, <<>>, Status, Award, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_func366, _,
		     {__Levelholiday_rule_func366,
		      __Tracesholiday_rule_func366}}
			when __Levelholiday_rule_func366 band 8 /= 0 orelse
			       __Tracesholiday_rule_func366 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_func},
				      {function, qry}, {line, 366},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8, __Levelholiday_rule_func366,
				     __Tracesholiday_rule_func366, lager_event,
				     __Pidholiday_rule_func366);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    RankList = [],
    {max(0, EndTime - Now), 0, RewardData, ItemEff, [],
     CliReward, RankList};
qry(#holiday{tbid = 3007, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = [{_, Reward}],
	     cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    Now = date:unixtime(),
    {AllAwardStaus, Lists} = holiday_lib:get_tv_val(CampId,
						    Bid, Role),
    Fun = fun ({Aim, {Evt, _}, BStr, Award}) ->
		  Status = list_util:keyfind(Aim, Lists, 0),
		  GotoType = case Evt of
			       evt_month_card -> 2;
			       evt_charge_invest -> 3;
			       evt_charge_fund -> 4;
			       _ -> 1
			     end,
		  AimArgs = [{28, GotoType, <<>>}],
		  {Aim, BStr, Status, Award, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_func390, _,
		     {__Levelholiday_rule_func390,
		      __Tracesholiday_rule_func390}}
			when __Levelholiday_rule_func390 band 8 /= 0 orelse
			       __Tracesholiday_rule_func390 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_func},
				      {function, qry}, {line, 390},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8, __Levelholiday_rule_func390,
				     __Tracesholiday_rule_func390, lager_event,
				     __Pidholiday_rule_func390);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    RankList = [],
    {max(0, EndTime - Now), AllAwardStaus, RewardData,
     ItemEff, [], CliReward, RankList};
qry(Holiday = #holiday{tbid = 3009, bid = Bid,
		       camp_id = CampId, end_time = EndTime,
		       cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    Now = date:unixtime(),
    {Status, _} = holiday_lib:get_tv_val(CampId, Bid, Role),
    {AccRebate, AimList} =
	holiday_groupon:reward_info(Holiday, Role),
    NewStatus = util:if_true(AccRebate > 0, Status, 1),
    Args = [{3, NewStatus, <<>>}, {4, CampId, <<>>}],
    {max(0, EndTime - Now), AccRebate, AimList, ItemEff,
     Args, CliReward, []};
qry(#holiday{tbid = TBid, reward = [_, _, _, NeedId, _],
	     end_time = EndTime, cli_reward = CliReward,
	     item_effect = ItemEff},
    _Role)
    when TBid =:= 3010 orelse
	   TBid =:= 3011 orelse
	     TBid =:= 3012 orelse TBid =:= 3017 ->
    Now = date:unixtime(),
    RewardData = [{0, <<>>, 0, [], [{4, NeedId, <<>>}]}],
    RankList = [],
    {max(0, EndTime - Now), 0, RewardData, ItemEff, [],
     CliReward, RankList};
qry(#holiday{tbid = TBid, camp_id = CampId, bid = Bid,
	     reward = Reward, end_time = EndTime,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role)
    when TBid == 3013 orelse TBid == 3014 ->
    Now = date:unixtime(),
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Fun = fun ({Aim, MaxCount, _NeedStart, Award, BStr}) ->
		  {FinishCount, AwardCount} = list_util:keyfind(Aim,
								Lists, {0, 0}),
		  Status = util:if_true(FinishCount > AwardCount, 1, 0),
		  AimArgs = [{4, MaxCount, <<>>}, {6, FinishCount, <<>>}],
		  {Aim, BStr, Status, Award, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_func423, _,
		     {__Levelholiday_rule_func423,
		      __Tracesholiday_rule_func423}}
			when __Levelholiday_rule_func423 band 8 /= 0 orelse
			       __Tracesholiday_rule_func423 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_func},
				      {function, qry}, {line, 423},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8, __Levelholiday_rule_func423,
				     __Tracesholiday_rule_func423, lager_event,
				     __Pidholiday_rule_func423);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    RankList = [],
    {max(0, EndTime - Now), 0, RewardData, ItemEff, [],
     CliReward, RankList};
qry(#holiday{tbid = 3015, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [{0, <<>>, 0, [], []}], [],
     [], <<>>, []};
qry(#holiday{tbid = 3016, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3018, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3031, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3032, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3033, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3019, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3020, camp_id = CampId, bid = Bid,
	     start_time = StartTime, end_time = EndTime,
	     reward = Reward, cli_reward = CliReward,
	     item_effect = ItemEff},
    Role = #role{reg_time = RegTime}) ->
    Now = date:unixtime(),
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Days = date:diff(day, Now, StartTime) + 1,
    Time_4_5 = 1585929600 + 86400,
    Fun = fun ({Aim, Award, AimStr}) ->
		  Status = case lists:keyfind(Aim, 1, Lists) of
			     {Aim, Status0} -> Status0;
			     _
				 when CampId =:= 49994 andalso
					Aim =:= 1 andalso RegTime < Time_4_5 ->
				 1;
			     _ when Days > Aim -> 3;
			     _ when Days =:= Aim -> 1;
			     _ -> 0
			   end,
		  AimArgs = [],
		  {Aim, AimStr, Status, Award, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_func468, _,
		     {__Levelholiday_rule_func468,
		      __Tracesholiday_rule_func468}}
			when __Levelholiday_rule_func468 band 8 /= 0 orelse
			       __Tracesholiday_rule_func468 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_func},
				      {function, qry}, {line, 468},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8, __Levelholiday_rule_func468,
				     __Tracesholiday_rule_func468, lager_event,
				     __Pidholiday_rule_func468);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    RankList = [],
    {max(0, EndTime - Now), 0, RewardData, ItemEff,
     [{1, StartTime, <<>>}, {2, EndTime, <<>>}], CliReward,
     RankList};
qry(#holiday{tbid = 3021, camp_id = CampId, bid = Bid,
	     start_time = StartTime, end_time = EndTime,
	     reward = Reward},
    Role) ->
    Now = date:unixtime(),
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Fun = fun ({Aim, Name, ItemId, ItemNum, Price,
		LimitCount, LimitType}) ->
		  TarVal = list_util:keyfind(Aim, Lists, 0),
		  AimArgs = [{2, LimitCount, <<>>}, {6, TarVal, <<>>},
			     {27, Price, <<>>}, {7, LimitType, <<>>}],
		  {Aim, Name, 0, [{ItemId, ItemNum}], AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_func488, _,
		     {__Levelholiday_rule_func488,
		      __Tracesholiday_rule_func488}}
			when __Levelholiday_rule_func488 band 8 /= 0 orelse
			       __Tracesholiday_rule_func488 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_func},
				      {function, qry}, {line, 488},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8, __Levelholiday_rule_func488,
				     __Tracesholiday_rule_func488, lager_event,
				     __Pidholiday_rule_func488);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    {max(0, EndTime - Now), 0, RewardData, [],
     [{1, StartTime, <<>>}, {2, EndTime, <<>>}], <<>>, []};
qry(#holiday{tbid = 3022, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3023, camp_id = CampId, bid = Bid,
	     start_time = StartTime, end_time = EndTime,
	     reward = [LossGold, AddCount, Reward, BuyLists]},
    Role) ->
    Now = date:unixtime(),
    Day = date:day_diff(StartTime, Now) + 1,
    {Count, GetAimList} = holiday_lib:get_tv_val(CampId,
						 Bid, Role),
    Fun = fun ({Aim, LimitCount, Items}) ->
		  Status = case lists:member(Aim, GetAimList) of
			     true -> 2;
			     _ -> util:if_true(Count >= LimitCount, 1, 0)
			   end,
		  AimArgs = [{2, LimitCount, <<>>}],
		  {Aim, <<>>, Status, Items, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_func509, _,
		     {__Levelholiday_rule_func509,
		      __Tracesholiday_rule_func509}}
			when __Levelholiday_rule_func509 band 8 /= 0 orelse
			       __Tracesholiday_rule_func509 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_func},
				      {function, qry}, {line, 509},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8, __Levelholiday_rule_func509,
				     __Tracesholiday_rule_func509, lager_event,
				     __Pidholiday_rule_func509);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    BuyLimit = list_util:keyfind(Day, BuyLists, 0),
    BuyCount = var:get_var(Role, day, 74, 0),
    {max(0, EndTime - Now), Count, RewardData, [],
     [{1, StartTime, <<>>}, {2, EndTime, <<>>},
      {3, BuyLimit, <<>>}, {4, BuyCount, <<>>},
      {5, LossGold, <<>>}, {6, AddCount, <<>>}],
     <<>>, []};
qry(#holiday{tbid = 3024, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [{0, <<>>, 0, [], []}], [],
     [], <<>>, []};
qry(#holiday{tbid = 3025, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Reward,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    Now = date:unixtime(),
    {Count, Lists} = holiday_lib:get_tv_val(CampId, Bid,
					    Role),
    Fun = fun ({Aim, NeedCount, Award, BStr}) ->
		  Status = list_util:keyfind(Aim, Lists, 0),
		  AimArgs = [{4, NeedCount, <<>>}, {5, Count, <<>>}],
		  {Aim, BStr, Status, Award, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_func531, _,
		     {__Levelholiday_rule_func531,
		      __Tracesholiday_rule_func531}}
			when __Levelholiday_rule_func531 band 8 /= 0 orelse
			       __Tracesholiday_rule_func531 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_func},
				      {function, qry}, {line, 531},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8, __Levelholiday_rule_func531,
				     __Tracesholiday_rule_func531, lager_event,
				     __Pidholiday_rule_func531);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    RankList = [],
    {max(0, EndTime - Now), Count, RewardData, ItemEff, [],
     CliReward, RankList};
qry(#holiday{tbid = 3026, camp_id = CampId, bid = Bid,
	     reward = Reward, end_time = EndTime,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    Now = date:unixtime(),
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Fun = fun ({Aim, MaxCount, NeedPartnerBid, _NeedStart,
		Award, BStr}) ->
		  {FinishCount, AwardCount} = list_util:keyfind(Aim,
								Lists, {0, 0}),
		  Status = if FinishCount > AwardCount -> 1;
			      MaxCount > AwardCount -> 0;
			      true -> 2
			   end,
		  AimArgs = [{4, MaxCount, <<>>}, {6, FinishCount, <<>>},
			     {18, NeedPartnerBid, <<>>}],
		  {Aim, BStr, Status, Award, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_func555, _,
		     {__Levelholiday_rule_func555,
		      __Tracesholiday_rule_func555}}
			when __Levelholiday_rule_func555 band 8 /= 0 orelse
			       __Tracesholiday_rule_func555 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_func},
				      {function, qry}, {line, 555},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8, __Levelholiday_rule_func555,
				     __Tracesholiday_rule_func555, lager_event,
				     __Pidholiday_rule_func555);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    RankList = [],
    {max(0, EndTime - Now), 0, RewardData, ItemEff, [],
     CliReward, RankList};
qry(#holiday{tbid = 3027, camp_id = CampId,
	     end_time = EndTime},
    _Role) ->
    Now = date:unixtime(),
    Args = [{4, CampId, <<>>}],
    {max(0, EndTime - Now), 0, [{0, <<>>, 0, [], []}], [],
     Args, <<>>, []};
qry(#holiday{tbid = 3028, camp_id = CampId,
	     end_time = EndTime},
    _Role) ->
    Now = date:unixtime(),
    Args = [{4, CampId, <<>>}],
    {max(0, EndTime - Now), 0, [{0, <<>>, 0, [], []}], [],
     Args, <<>>, []};
qry(#holiday{tbid = 3029, camp_id = CampId,
	     end_time = EndTime},
    _Role) ->
    Now = date:unixtime(),
    Args = [{4, CampId, <<>>}],
    {max(0, EndTime - Now), 0, [{0, <<>>, 0, [], []}], [],
     Args, <<>>, []};
qry(#holiday{tbid = 3030, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [{0, <<>>, 0, [], []}], [],
     [], <<>>, []};
qry(#holiday{tbid = 3034, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [{0, <<>>, 0, [], []}], [],
     [], <<>>, []};
qry(#holiday{tbid = 3036}, _Role) -> {error, not_found};
qry(#holiday{tbid = 3038, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Reward,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    Now = date:unixtime(),
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    RewardData = case lists:keyfind(0, 1, Lists) of
		   false -> [{0, <<>>, 1, Reward, []}];
		   _ -> [{0, <<>>, 2, Reward, []}]
		 end,
    {max(0, EndTime - Now), 0, RewardData, ItemEff, [],
     CliReward, []};
qry(#holiday{tbid = 3040}, _Role) -> {error, not_found};
qry(#holiday{tbid = 3041, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3042, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3043, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = [_, Reward],
	     cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    Now = date:unixtime(),
    {_, AwardId} = case holiday_lib:get_tv_val(CampId, Bid,
					       Role)
		       of
		     {IsPointT, AwardIdT} -> {IsPointT, AwardIdT};
		     {IsPointT, AwardIdT, _} -> {IsPointT, AwardIdT};
		     Temp -> Temp
		   end,
    Fun = fun ({Aim, Award}) ->
		  Status = util:if_true(Aim =< AwardId, 2, 1),
		  AimArgs = [],
		  {Aim, <<>>, Status, Award, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_func612, _,
		     {__Levelholiday_rule_func612,
		      __Tracesholiday_rule_func612}}
			when __Levelholiday_rule_func612 band 8 /= 0 orelse
			       __Tracesholiday_rule_func612 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_func},
				      {function, qry}, {line, 612},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8, __Levelholiday_rule_func612,
				     __Tracesholiday_rule_func612, lager_event,
				     __Pidholiday_rule_func612);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    {max(0, EndTime - Now), 0, RewardData, ItemEff, [],
     CliReward, []};
qry(#holiday{tbid = 3044, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3045, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3046, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3047, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3048, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3050, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{tbid = 3051, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [{0, <<>>, 0, [], []}], [],
     [], <<>>, []};
qry(#holiday{tbid = 3053, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [], [], [], <<>>, []};
qry(#holiday{bid = Bid}, Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule_func642, _,
       {__Levelholiday_rule_func642,
	__Tracesholiday_rule_func642}}
	  when __Levelholiday_rule_func642 band 8 /= 0 orelse
		 __Tracesholiday_rule_func642 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule_func}, {function, qry},
			{line, 642}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]查询未处理的活动[Bid:~w]",
				     [Role#role.name, Bid]),
		       none, 4096, 8, __Levelholiday_rule_func642,
		       __Tracesholiday_rule_func642, lager_event,
		       __Pidholiday_rule_func642);
      _ -> ok
    end,
    {error, not_found}.

-spec take(#holiday{}, #role{}, pos_integer(),
	   pos_integer()) -> {error, bitstring()} |
			     {ok, bitstring(), #role{}}.

take(Holiday = #holiday{title = Name, tbid = TBid,
			camp_id = CampId, bid = Bid,
			reward = [_, _, _, _, Reward]},
     Role, Aim, BuyNum)
    when TBid =:= 3003 orelse
	   TBid =:= 3010 orelse
	     TBid =:= 3011 orelse
	       TBid =:= 3012 orelse TBid =:= 3017 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Num = list_util:keyfind(Aim, Lists, 0),
    case lists:keyfind(Aim, 1, Reward) of
      _ when BuyNum =< 0 ->
	  {error, lang:get(<<"道具不足无法购买"/utf8>>)};
      {Aim, LimitNum, _ExpendId, _ExpendNum, _Award, _IsLable,
       _BStr}
	  when Num + BuyNum > LimitNum ->
	  {error, lang:get(<<"剩余兑换次数不足"/utf8>>)};
      {Aim, _LimitNum, ExpendId, ExpendNum, Award, _IsLable,
       _BStr} ->
	  Loss = format:val_to_loss([{ExpendId,
				      ExpendNum * BuyNum}],
				    holiday_item),
	  Gain = format:val_to_gain([{IdT, NumT * BuyNum}
				     || {IdT, NumT} <- Award],
				    holiday_item),
	  case role_gain:do_notice(Role, Gain ++ Loss) of
	    {ok, NRole} ->
		log:log_gain(Loss ++ Gain, Role, NRole,
			     util:fbin(lang:get(<<"运营活动_~ts"/utf8>>), [Name]),
			     util:fbin("兑换购买:~w", [Aim])),
		NewList = lists:keystore(Aim, 1, Lists,
					 {Aim, Num + BuyNum}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole, NewList,
						 ExpireSec),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      false -> {error, lang:get(<<"信息不存在"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = 3006, camp_id = CampId,
			bid = Bid, reward = Reward},
     Role = #role{id = RoleId, name = Name}, PartnerBid,
     _Arg) ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Num = list_util:keyfind(PartnerBid, Lists, 0),
    case lists:keyfind(PartnerBid, 1, Reward) of
      {PartnerBid, Aim, _ExpendId, _ExpendNum, _Award, _}
	  when Num >= Aim ->
	  {error, lang:get(<<"该神将已购买"/utf8>>)};
      {PartnerBid, _Aim, ExpendId, ExpendNum, Award, _} ->
	  Loss = format:val_to_loss([{ExpendId, ExpendNum}],
				    holiday_partner),
	  Gain = format:val_to_gain(Award, holiday_partner),
	  case role_gain:do_notice(Role, Gain ++ Loss) of
	    {ok, NRole} ->
		log:log_gain(Loss ++ Gain, Role, NRole, <<"伙伴"/utf8>>,
			     util:fbin("神将活动购买:~w", [PartnerBid])),
		NRole2 = partner:add_partners(NRole, PartnerBid, skip),
		NewList = lists:keystore(PartnerBid, 1, Lists,
					 {PartnerBid, Num + 1}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole2,
						 NewList, ExpireSec),
		#partner_base_data{rare_type = RareType,
				   name = PartnerName} =
		    partner_data:get_base(PartnerBid),
		Msg1 = {partner,
			{RareType,
			 util:fbin(lang:get(<<"神将·~ts"/utf8>>),
				   [PartnerName])}},
		Msg =
		    color:msg(lang:get(<<"~ts在~ts活动中获得了~ts，竟还获赠价值2440钻大礼包！可谓实力暴涨.~ts"/utf8>>),
			      [{name, RoleId, Name},
			       {string, {blue, lang:get(<<"神将热卖"/utf8>>)}},
			       Msg1,
			       {href,
				{47, green, [93006],
				 lang:get(<<"【前往兑换】"/utf8>>)}}]),
		notice:broadcast(rumor, Msg),
		holiday_lib:push_holiday_one(NewRole, Bid),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      false -> {error, lang:get(<<"神将信息不存在"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = 3007, camp_id = CampId,
			bid = Bid, reward = [{_, Reward}]},
     Role, Id, _Arg) ->
    {AllAwardStaus, Lists} = holiday_lib:get_tv_val(CampId,
						    Bid, Role),
    Status = list_util:keyfind(Id, Lists, 0),
    case lists:keyfind(Id, 1, Reward) of
      {Id, _, _, _Award} when Status == 0 ->
	  {error, lang:get(<<"未激活该奖励"/utf8>>)};
      {Id, _, _, _Award} when Status == 2 ->
	  {error, lang:get(<<"该奖励已领取"/utf8>>)};
      {Id, _, _, Award} when Status == 1 ->
	  Gain = format:val_to_gain(Award, holiday_func_honor),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole} ->
		log:log_gain(Gain, Role, NRole, <<"闪烁之光称号礼活动"/utf8>>,
			     util:fbin("称号礼活动领取:~w", [Id])),
		NewList = lists:keystore(Id, 1, Lists, {Id, 2}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole,
						 {AllAwardStaus, NewList},
						 ExpireSec),
		holiday:push_bid_can_reward(NewRole, Bid),
		holiday_lib:push_holiday_one(NewRole, Bid),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      false -> {error, lang:get(<<"神将信息不存在"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = 3009, camp_id = CampId,
			bid = Bid, end_time = EndTime},
     Role, Id, _Arg) ->
    Now = date:unixtime(),
    {Status, GetAimList} = holiday_lib:get_tv_val(CampId,
						  Bid, Role),
    case EndTime - Now > 86400 of
      true ->
	  case holiday_groupon_data:reward({CampId, Id}) of
	    {Reward, Gold, Limit, AllLimit} ->
		case list_util:keyfind(Id, 1, GetAimList,
				       {Id, 0, 0, []})
		    of
		  {Id, Count, _AllCount, _}
		      when Limit =/= 0 andalso Count >= Limit ->
		      {error, lang:get(<<"该物品已售罄"/utf8>>)};
		  {Id, _Count, AllCount, _}
		      when AllLimit =/= 0 andalso AllCount >= AllLimit ->
		      {error, lang:get(<<"该物品已售罄"/utf8>>)};
		  {Id, Count, AllCount, BuyList} ->
		      case holiday_groupon:current_discount(CampId, Id) of
			Discount when is_integer(Discount) ->
			    NewGold = util:round(Gold * Discount / 1000),
			    Loss = format:val_to_loss([{3, NewGold}],
						      holiday_func_groupon),
			    Gain = format:val_to_gain(Reward,
						      holiday_func_groupon),
			    GL = Loss ++ Gain,
			    case role_gain:do_notice(Role, GL) of
			      {ok, NRole} ->
				  log:log_gain(GL, Role, NRole,
					       <<"运营活动_团购"/utf8>>,
					       util:fbin("团购活动购买Id:~w，现价~w",
							 [Id, NewGold])),
				  NewList = lists:keystore(Id, 1, GetAimList,
							   {Id, Count + 1,
							    AllCount + 1,
							    [NewGold
							     | BuyList]}),
				  ExpireSec =
				      holiday_lib:get_tv_timeout(Holiday),
				  NewRole = holiday_lib:set_tv_val(CampId,
								   NRole,
								   {Status,
								    NewList},
								   ExpireSec),
				  holiday_groupon:add(Id),
				  holiday:push_bid_can_reward(NewRole, Bid),
				  holiday_lib:push_holiday_one(NewRole, Bid),
				  {ok, <<>>, NewRole};
			      {false, #loss{msg = Msg}} -> {error, Msg};
			      {false, #gain{msg = Msg}} -> {error, Msg}
			    end;
			_ -> {error, lang:get(<<"暂时无法购买"/utf8>>)}
		      end;
		  _ -> {error, lang:get(<<"购买信息出错"/utf8>>)}
		end;
	    _ -> {error, lang:get(<<"物品不存在"/utf8>>)}
	  end;
      _ ->
	  case Status =:= 0 andalso Id =:= 0 of
	    true ->
		{Rebate, _} = holiday_groupon:reward_info(Holiday,
							  Role),
		Gain = format:val_to_gain([{3, Rebate}],
					  holiday_func_groupon),
		case role_gain:do_notice(Role, Gain) of
		  {ok, NRole} ->
		      log:log_gain(Gain, Role, NRole, <<"运营活动_团购"/utf8>>,
				   util:fbin("团购共领取返利~w", [Rebate])),
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      NewRole = holiday_lib:set_tv_val(CampId, NRole,
						       {1, GetAimList},
						       ExpireSec),
		      holiday:push_bid_can_reward(NewRole, Bid),
		      holiday_lib:push_holiday_one(NewRole, Bid),
		      {ok, <<>>, NewRole};
		  {false, #gain{msg = Msg}} -> {error, Msg}
		end;
	    _ -> {error, lang:get(<<"返利已领取"/utf8>>)}
	  end
    end;
take(Holiday = #holiday{tbid = TBid, camp_id = CampId,
			bid = Bid, reward = Reward},
     Role, Aim, _Arg)
    when TBid == 3013 orelse TBid == 3014 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    {FinishCount, AwardCount} = list_util:keyfind(Aim,
						  Lists, {0, 0}),
    case lists:keyfind(Aim, 1, Reward) of
      _ when FinishCount =< AwardCount ->
	  {error, lang:get(<<"没有可领取的奖励"/utf8>>)};
      {Aim, MaxCount, _NeedStart, _Award, _BStr}
	  when AwardCount >= MaxCount ->
	  {error, lang:get(<<"奖励已全部领取"/utf8>>)};
      {Aim, _MaxCount, _NeedStart, Award, _BStr} ->
	  Gain = format:val_to_gain(Award, holiday_func_honor),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole} ->
		log:log_gain(Gain, Role, NRole, <<"运营活动_融合祝福"/utf8>>,
			     util:fbin("融合祝福奖励领取:~w 第几次领取:~w 当前触发了几次:~w",
				       [Aim, AwardCount, FinishCount])),
		NewList = lists:keystore(Aim, 1, Lists,
					 {Aim, {FinishCount, AwardCount + 1}}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole, NewList,
						 ExpireSec),
		holiday:push_bid_can_reward(NewRole, Bid),
		holiday_lib:push_holiday_one(NewRole, Bid),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      _ -> {error, lang:get(<<"奖励信息不存在"/utf8>>)}
    end;
take(Holiday = #holiday{title = Name, tbid = TBid,
			camp_id = CampId, bid = Bid, reward = [_, Reward]},
     Role, Aim, BuyNum)
    when TBid =:= 3018 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Num = list_util:keyfind(Aim, Lists, 0),
    OpenDay = date:open_srv_day(),
    {_, HolidayOpenDay} =
	sys_env:get(holiday_lantern_adventure),
    DoDay = max(1, OpenDay - HolidayOpenDay + 1),
    case lists:keyfind(Aim, 1, Reward) of
      _ when BuyNum =< 0 ->
	  {error, lang:get(<<"道具不足无法购买"/utf8>>)};
      {Aim, LimitNum, _ExpendId, _ExpendNum, _Award, _IsLable,
       _NeedDay, _BStr}
	  when Num + BuyNum > LimitNum ->
	  {error, lang:get(<<"剩余兑换次数不足"/utf8>>)};
      {Aim, _LimitNum, _ExpendId, _ExpendNum, _Award,
       _IsLable, NeedDay, _BStr}
	  when DoDay < NeedDay ->
	  {error, lang:get(<<"商品未到天数 不能购买"/utf8>>)};
      {Aim, _LimitNum, ExpendId, ExpendNum, Award, _IsLable,
       _NeedDay, _BStr} ->
	  Flag = case item_data:get(ExpendId) of
		   #item_base{gain_type = 10} -> holiday_item;
		   _ -> item_base_id
		 end,
	  Loss = format:val_to_loss([{ExpendId,
				      ExpendNum * BuyNum}],
				    Flag),
	  Gain = format:val_to_gain([{IdT, NumT * BuyNum}
				     || {IdT, NumT} <- Award],
				    Flag),
	  case role_gain:do_notice(Role, Gain ++ Loss) of
	    {ok, NRole} ->
		log:log_gain(Loss ++ Gain, Role, NRole,
			     util:fbin(lang:get(<<"运营活动_~ts"/utf8>>), [Name]),
			     util:fbin("兑换购买:~w", [Aim])),
		NewList = lists:keystore(Aim, 1, Lists,
					 {Aim, Num + BuyNum}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole, NewList,
						 ExpireSec),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      _ -> {error, lang:get(<<"信息不存在"/utf8>>)}
    end;
take(Holiday = #holiday{title = Name, tbid = TBid,
			camp_id = CampId, bid = Bid, reward = [_, Reward]},
     Role, Aim, BuyNum)
    when TBid =:= 3031 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Num = list_util:keyfind(Aim, Lists, 0),
    OpenDay = date:open_srv_day(),
    {_, HolidayOpenDay} =
	sys_env:get(holiday_lantern_adventure1),
    DoDay = max(1, OpenDay - HolidayOpenDay + 1),
    case lists:keyfind(Aim, 1, Reward) of
      _ when BuyNum =< 0 ->
	  {error, lang:get(<<"道具不足无法购买"/utf8>>)};
      {Aim, LimitNum, _ExpendId, _ExpendNum, _Award, _IsLable,
       _NeedDay, _BStr}
	  when Num + BuyNum > LimitNum ->
	  {error, lang:get(<<"剩余兑换次数不足"/utf8>>)};
      {Aim, _LimitNum, _ExpendId, _ExpendNum, _Award,
       _IsLable, NeedDay, _BStr}
	  when DoDay < NeedDay ->
	  {error, lang:get(<<"商品未到天数 不能购买"/utf8>>)};
      {Aim, _LimitNum, ExpendId, ExpendNum, Award, _IsLable,
       _NeedDay, _BStr} ->
	  Flag = case item_data:get(ExpendId) of
		   #item_base{gain_type = 10} -> holiday_item;
		   _ -> item_base_id
		 end,
	  Loss = format:val_to_loss([{ExpendId,
				      ExpendNum * BuyNum}],
				    Flag),
	  Gain = format:val_to_gain([{IdT, NumT * BuyNum}
				     || {IdT, NumT} <- Award],
				    Flag),
	  case role_gain:do_notice(Role, Gain ++ Loss) of
	    {ok, NRole} ->
		log:log_gain(Loss ++ Gain, Role, NRole,
			     util:fbin(lang:get(<<"运营活动_~ts"/utf8>>), [Name]),
			     util:fbin("兑换购买:~w", [Aim])),
		NewList = lists:keystore(Aim, 1, Lists,
					 {Aim, Num + BuyNum}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole, NewList,
						 ExpireSec),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      _ -> {error, lang:get(<<"信息不存在"/utf8>>)}
    end;
take(Holiday = #holiday{title = Name, tbid = TBid,
			camp_id = CampId, bid = Bid, reward = [_, Reward]},
     Role, Aim, BuyNum)
    when TBid =:= 3032 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Num = list_util:keyfind(Aim, Lists, 0),
    OpenDay = date:open_srv_day(),
    {_, HolidayOpenDay} =
	sys_env:get(holiday_lantern_adventure2),
    DoDay = max(1, OpenDay - HolidayOpenDay + 1),
    case lists:keyfind(Aim, 1, Reward) of
      _ when BuyNum =< 0 ->
	  {error, lang:get(<<"道具不足无法购买"/utf8>>)};
      {Aim, LimitNum, _ExpendId, _ExpendNum, _Award, _IsLable,
       _NeedDay, _BStr}
	  when Num + BuyNum > LimitNum ->
	  {error, lang:get(<<"剩余兑换次数不足"/utf8>>)};
      {Aim, _LimitNum, _ExpendId, _ExpendNum, _Award,
       _IsLable, NeedDay, _BStr}
	  when DoDay < NeedDay ->
	  {error, lang:get(<<"商品未到天数 不能购买"/utf8>>)};
      {Aim, _LimitNum, ExpendId, ExpendNum, Award, _IsLable,
       _NeedDay, _BStr} ->
	  Flag = case item_data:get(ExpendId) of
		   #item_base{gain_type = 10} -> holiday_item;
		   _ -> item_base_id
		 end,
	  Loss = format:val_to_loss([{ExpendId,
				      ExpendNum * BuyNum}],
				    Flag),
	  Gain = format:val_to_gain([{IdT, NumT * BuyNum}
				     || {IdT, NumT} <- Award],
				    Flag),
	  case role_gain:do_notice(Role, Gain ++ Loss) of
	    {ok, NRole} ->
		log:log_gain(Loss ++ Gain, Role, NRole,
			     util:fbin(lang:get(<<"运营活动_~ts"/utf8>>), [Name]),
			     util:fbin("兑换购买:~w", [Aim])),
		NewList = lists:keystore(Aim, 1, Lists,
					 {Aim, Num + BuyNum}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole, NewList,
						 ExpireSec),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      _ -> {error, lang:get(<<"信息不存在"/utf8>>)}
    end;
take(Holiday = #holiday{title = Name, tbid = TBid,
			camp_id = CampId, bid = Bid, reward = [_, Reward]},
     Role, Aim, BuyNum)
    when TBid =:= 3033 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Num = list_util:keyfind(Aim, Lists, 0),
    OpenDay = date:open_srv_day(),
    {_, HolidayOpenDay} =
	sys_env:get(holiday_lantern_adventure3),
    DoDay = max(1, OpenDay - HolidayOpenDay + 1),
    case lists:keyfind(Aim, 1, Reward) of
      _ when BuyNum =< 0 ->
	  {error, lang:get(<<"道具不足无法购买"/utf8>>)};
      {Aim, LimitNum, _ExpendId, _ExpendNum, _Award, _IsLable,
       _NeedDay, _BStr}
	  when Num + BuyNum > LimitNum ->
	  {error, lang:get(<<"剩余兑换次数不足"/utf8>>)};
      {Aim, _LimitNum, _ExpendId, _ExpendNum, _Award,
       _IsLable, NeedDay, _BStr}
	  when DoDay < NeedDay ->
	  {error, lang:get(<<"商品未到天数 不能购买"/utf8>>)};
      {Aim, _LimitNum, ExpendId, ExpendNum, Award, _IsLable,
       _NeedDay, _BStr} ->
	  Flag = case item_data:get(ExpendId) of
		   #item_base{gain_type = 10} -> holiday_item;
		   _ -> item_base_id
		 end,
	  Loss = format:val_to_loss([{ExpendId,
				      ExpendNum * BuyNum}],
				    Flag),
	  Gain = format:val_to_gain([{IdT, NumT * BuyNum}
				     || {IdT, NumT} <- Award],
				    Flag),
	  case role_gain:do_notice(Role, Gain ++ Loss) of
	    {ok, NRole} ->
		log:log_gain(Loss ++ Gain, Role, NRole,
			     util:fbin(lang:get(<<"运营活动_~ts"/utf8>>), [Name]),
			     util:fbin("兑换购买:~w", [Aim])),
		NewList = lists:keystore(Aim, 1, Lists,
					 {Aim, Num + BuyNum}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole, NewList,
						 ExpireSec),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      _ -> {error, lang:get(<<"信息不存在"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = 3020, camp_id = CampId,
			bid = Bid, reward = Reward, start_time = StartTime},
     Role = #role{reg_time = RegTime}, Id, _Arg) ->
    Now = date:unixtime(),
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Days = date:diff(day, Now, StartTime) + 1,
    Status = list_util:keyfind(Id, Lists, 0),
    Time_4_5 = 1585929600 + 86400,
    case lists:keyfind(Id, 1, Reward) of
      {Id, _Award, _} when Status == 0 andalso Id > Days ->
	  {error, lang:get(<<"未达奖励领取时间"/utf8>>)};
      {Id, _Award, _} when Status == 2 ->
	  {error, lang:get(<<"福利已领取，下周再接再厉"/utf8>>)};
      {Id, Award, _}
	  when Id =:= Days orelse
		 CampId =:= 49994 andalso
		   Id =:= 1 andalso RegTime < Time_4_5 ->
	  Gain = format:val_to_gain(Award, holiday_3020_func),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole} ->
		log:log_gain(Gain, Role, NRole, <<"开工福利"/utf8>>,
			     util:fbin("开工福利活动领取:~w", [Id])),
		NewList = lists:keystore(Id, 1, Lists, {Id, 2}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole, NewList,
						 ExpireSec),
		holiday:push_bid_can_reward(NewRole, Bid),
		holiday_lib:push_holiday_one(NewRole, Bid),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      {_, _, _} -> {error, lang:get(<<"领取时间已过，请下周再来"/utf8>>)};
      false -> {error, lang:get(<<"活动信息不存在"/utf8>>)}
    end;
take(Holiday = #holiday{title = Name, tbid = 3023,
			camp_id = CampId, bid = Bid,
			reward = [LossGold, AddCount, Reward, BuyLists],
			start_time = StartTime},
     Role, Id, Arg) ->
    {Count, GetAimList} = holiday_lib:get_tv_val(CampId,
						 Bid, Role),
    case Id =:= 0 of
      true ->
	  Now = date:unixtime(),
	  Day = date:day_diff(StartTime, Now) + 1,
	  BuyCount = var:get_var(Role, day, 74, 0),
	  case lists:keyfind(Day, 1, BuyLists) of
	    _ when Arg =< 0 ->
		{error, lang:get(<<"请选择购买数量"/utf8>>)};
	    {_, BuyLimit} when BuyCount + Arg > BuyLimit ->
		{error, lang:get(<<"超出限购数量"/utf8>>)};
	    {_, _} ->
		Loss = format:val_to_loss([{3, LossGold * Arg}],
					  holiday_activity),
		case role_gain:do(Role, Loss) of
		  {false, #loss{msg = Msg}} -> {error, Msg};
		  {ok, Role1} ->
		      log:log_gain(Loss, Role, Role1,
				   util:fbin(lang:get(<<"运营活动_~ts"/utf8>>),
					     [Name]),
				   util:fbin("购买活跃次数:~w", [Arg])),
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      Role2 = holiday_lib:set_tv_val(CampId, Role1,
						     {Count + Arg * AddCount,
						      GetAimList},
						     ExpireSec),
		      NewBuyCount = BuyCount + Arg,
		      NewRole = var:set_var(Role2, day, 74, NewBuyCount),
		      holiday:push_bid_can_reward(NewRole, Bid),
		      holiday_lib:push_holiday_one(NewRole, Bid),
		      notice:assets([#gain{label = item_base_id,
					   val =
					       [{80221, 1, Arg * AddCount}]}]),
		      {ok, <<>>, NewRole}
		end;
	    _ -> {error, lang:get(<<"本日无法购买"/utf8>>)}
	  end;
      _ ->
	  Status = case lists:member(Id, GetAimList) of
		     true -> 2;
		     _ -> 0
		   end,
	  case lists:keyfind(Id, 1, Reward) of
	    _ when Status == 2 ->
		{error, lang:get(<<"奖励已领取"/utf8>>)};
	    {Id, LimitCount, _}
		when Status == 0 andalso LimitCount > Count ->
		{error, lang:get(<<"未达到活跃值哟"/utf8>>)};
	    {Id, _, Items} when Status == 0 ->
		Gain = format:val_to_gain(Items, holiday_activity),
		case role_gain:do_notice(Role, Gain) of
		  {false, #gain{msg = Msg}} -> {error, Msg};
		  {ok, Role1} ->
		      log:log_gain(Gain, Role, Role1,
				   util:fbin(lang:get(<<"运营活动_~ts"/utf8>>),
					     [Name]),
				   util:fbin("领取活跃奖励:~w", [Id])),
		      NewGetAimList = [Id | GetAimList],
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      NewRole = holiday_lib:set_tv_val(CampId, Role1,
						       {Count, NewGetAimList},
						       ExpireSec),
		      holiday:push_bid_can_reward(NewRole, Bid),
		      holiday_lib:push_holiday_one(NewRole, Bid),
		      {ok, <<>>, NewRole}
		end;
	    _ -> {error, lang:get(<<"活动信息不存在"/utf8>>)}
	  end
    end;
take(Holiday = #holiday{tbid = 3025, camp_id = CampId,
			bid = Bid, reward = Reward},
     Role, Aim, _Arg) ->
    {Count, Lists} = holiday_lib:get_tv_val(CampId, Bid,
					    Role),
    Status = list_util:keyfind(Aim, Lists, 0),
    case lists:keyfind(Aim, 1, Reward) of
      {Aim, _NeedCount, _Award, _BStr} when Status == 0 ->
	  {error, lang:get(<<"未激活该奖励"/utf8>>)};
      {Aim, _NeedCount, _Award, _BStr} when Status == 2 ->
	  {error, lang:get(<<"该奖励已领取"/utf8>>)};
      {Aim, _NeedCount, Award, _BStr} ->
	  Gain = format:val_to_gain(Award, holiday_func_coin),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole} ->
		log:log_gain(Gain, Role, NRole, <<"运营活动_累计砸蛋"/utf8>>,
			     util:fbin("领取奖励:~w", [Aim])),
		NewList = lists:keystore(Aim, 1, Lists, {Aim, 2}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole,
						 {Count, NewList}, ExpireSec),
		holiday_lib:push_holiday_one(NewRole, Bid),
		holiday:push_bid_can_reward(NewRole, Bid),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      _ -> {error, lang:get(<<"奖励信息不存在"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = 3026, camp_id = CampId,
			bid = Bid, reward = Reward},
     Role, Aim, _Arg) ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    {FinishCount, AwardCount} = list_util:keyfind(Aim,
						  Lists, {0, 0}),
    case lists:keyfind(Aim, 1, Reward) of
      _ when FinishCount =< AwardCount ->
	  {error, lang:get(<<"没有可领取的奖励"/utf8>>)};
      {Aim, MaxCount, _NeedPartnerBid, _NeedStart, _Award,
       _BStr}
	  when AwardCount >= MaxCount ->
	  {error, lang:get(<<"奖励已全部领取"/utf8>>)};
      {Aim, _MaxCount, _NeedPartnerBid, _NeedStart, Award,
       _BStr} ->
	  Gain = format:val_to_gain(Award, holiday_func_star_up),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole} ->
		log:log_gain(Gain, Role, NRole, <<"运营活动_英雄觉醒"/utf8>>,
			     util:fbin("英雄觉醒奖励领取:~w 第几次领取:~w 当前触发了几次:~w",
				       [Aim, AwardCount, FinishCount])),
		NewList = lists:keystore(Aim, 1, Lists,
					 {Aim, {FinishCount, AwardCount + 1}}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole, NewList,
						 ExpireSec),
		holiday:push_bid_can_reward(NewRole, Bid),
		holiday_lib:push_holiday_one(NewRole, Bid),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      _ -> {error, lang:get(<<"奖励信息不存在"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = TBid, title = Name,
			camp_id = CampId, bid = Bid, reward = [_, _, Reward]},
     Role, Aim, BuyNum)
    when TBid =:= 3029 orelse
	   TBid =:= 3037 orelse TBid =:= 3049 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Num = list_util:keyfind(Aim, Lists, 0),
    case lists:keyfind(Aim, 1, Reward) of
      _ when BuyNum =< 0 ->
	  {error, lang:get(<<"道具不足无法购买"/utf8>>)};
      {Aim, LimitNum, _ExpendId, _ExpendNum, _Award, _IsLable,
       _BStr}
	  when Num + BuyNum > LimitNum ->
	  {error, lang:get(<<"剩余兑换次数不足"/utf8>>)};
      {Aim, _LimitNum, ExpendId, ExpendNum, Award, _IsLable,
       _BStr} ->
	  Loss = format:val_to_loss([{ExpendId,
				      ExpendNum * BuyNum}],
				    holiday_item),
	  Gain = format:val_to_gain([{IdT, NumT * BuyNum}
				     || {IdT, NumT} <- Award],
				    holiday_item),
	  case role_gain:do_notice(Role, Gain ++ Loss) of
	    {ok, NRole} ->
		log:log_gain(Loss ++ Gain, Role, NRole,
			     util:fbin(lang:get(<<"运营活动_~ts"/utf8>>), [Name]),
			     util:fbin("兑换购买:~w", [Aim])),
		NewList = lists:keystore(Aim, 1, Lists,
					 {Aim, Num + BuyNum}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole, NewList,
						 ExpireSec),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      false -> {error, lang:get(<<"信息不存在"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = 3038, camp_id = CampId,
			bid = Bid, reward = Reward},
     Role, 0, _Arg) ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Gain = format:val_to_gain(Reward, holiday_3038_func),
    case lists:keyfind(0, 1, Lists) of
      false ->
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole} ->
		log:log_gain(Gain, Role, NRole, <<"活动预告"/utf8>>,
			     util:fbin("活动预告活动领取:~w", [0])),
		NewList = lists:keystore(0, 1, Lists, {0, 2}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole, NewList,
						 ExpireSec),
		holiday:push_bid_can_reward(NewRole, Bid),
		holiday_lib:push_holiday_one(NewRole, Bid),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      _ -> {error, lang:get(<<"没有可领取的奖励"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = 3040}, Role, Aim,
     BuyNum) ->
    case exchange:holiday_buy(Role, Aim, BuyNum, Holiday) of
      {ok, NRole} -> {ok, <<>>, NRole};
      {false, Msg} -> {error, Msg};
      _ -> {error, lang:get(<<"暂时无法购买"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = 3043, camp_id = CampId,
			bid = Bid, reward = [_, Reward]},
     Role = #role{id = {Rid, _}, platform = Platform,
		  zone_id = ZoneId},
     _, CardId0) ->
    {IsPoint, AwardId, UseList} = case
				    holiday_lib:get_tv_val(CampId, Bid, Role)
				      of
				    {IsPointT, AwardIdT} ->
					{IsPointT, AwardIdT, []};
				    {IsPointT, AwardIdT, UseListT} ->
					{IsPointT, AwardIdT, UseListT};
				    Temp -> Temp
				  end,
    DoAwardId = AwardId + 1,
    case lists:member(CardId0, UseList) of
      true -> {error, lang:get(<<"已领取该礼包码"/utf8>>)};
      _ ->
	  case lists:keyfind(AwardId + 1, 1, Reward) of
	    {DoAwardId, Award} ->
		CardId = case
			   is_binary([string_util:trim(binary_to_list(CardId0))])
			     of
			   false ->
			       list_to_binary([string_util:trim(binary_to_list(CardId0))]);
			   true -> [string_util:trim(binary_to_list(CardId0))]
			 end,
		Url =
		    lists:concat(["http://weekly-sszg.shiyuegame.com/api.php/pf/"
				  "carnival/check"]),
		Time = date:unixtime(),
		Key = "He952ae2a6ea8cdG7410j6T42d7ce32",
		Sign = string_util:md5(lists:concat([Rid,
						     binary_to_list(Platform),
						     ZoneId, Time,
						     binary_to_list(CardId),
						     Key])),
		List = [{platform, Platform}, {time, Time},
			{sign, Sign}, {zone_id, ZoneId}, {no, CardId},
			{role_id, Rid}, {card_no, CardId}],
		Body = game_lib:to_url_body_str(List),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_func1199, _,
		   {__Levelholiday_rule_func1199,
		    __Tracesholiday_rule_func1199}}
		      when __Levelholiday_rule_func1199 band 128 /= 0 orelse
			     __Tracesholiday_rule_func1199 /= [] ->
		      lager:do_log(debug,
				   [{module, holiday_rule_func},
				    {function, take}, {line, 1199},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~ts==>~ts", [Url, Body]),
				   none, 4096, 128,
				   __Levelholiday_rule_func1199,
				   __Tracesholiday_rule_func1199, lager_event,
				   __Pidholiday_rule_func1199);
		  _ -> ok
		end,
		case catch httpc:request(post,
					 {Url, [],
					  "application/x-www-form-urlencoded",
					  Body},
					 [{timeout, 5000}], [])
		    of
		  {ok, {_StatusLine, _Headers, RtnBody}} ->
		      case catch ejson:decode(RtnBody) of
			{[{<<"error">>, 666}, {<<"msg">>, {L}}]} ->
			    {_, CardNum} = lists:keyfind(<<"card_no">>, 1, L),
			    GL = format:val_to_gain(Award, carnival_card_make),
			    Title = lang:get(<<"【时空胶囊】奖励补发"/utf8>>),
			    Content = lang:get(<<"这是您补发的【时空胶囊】奖励，请查收"/utf8>>),
			    {ok, NRole, #gain_loss_opts{return_gl = RetGL}} =
				role_gain:do_mail(Role, GL, Title, Content,
						  <<"嘉年华奖励"/utf8>>),
			    notice:assets(RetGL),
			    log:log_gain(GL, Role, NRole, <<"媒体卡"/utf8>>,
					 util:fbin("领取嘉年华奖励card_id=~s,CardNum=~w",
						   [CardId, CardNum])),
			    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
			    NewRole = holiday_lib:set_tv_val(CampId, NRole,
							     {IsPoint,
							      DoAwardId,
							      [CardId0
							       | UseList]},
							     ExpireSec),
			    holiday:push_bid_can_reward(NewRole, Bid),
			    holiday_lib:push_holiday_one(NewRole, Bid),
			    {ok, <<>>, NewRole};
			{[{<<"error">>, _}, {<<"msg">>, Msg}]}
			    when is_binary(Msg) ->
			    {error, Msg};
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
			      {__Pidholiday_rule_func1221, _,
			       {__Levelholiday_rule_func1221,
				__Tracesholiday_rule_func1221}}
				  when __Levelholiday_rule_func1221 band 8 /= 0
					 orelse
					 __Tracesholiday_rule_func1221 /= [] ->
				  lager:do_log(error,
					       [{module, holiday_rule_func},
						{function, take}, {line, 1221},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("ret==>~ts",
							     [RtnBody]),
					       none, 4096, 8,
					       __Levelholiday_rule_func1221,
					       __Tracesholiday_rule_func1221,
					       lager_event,
					       __Pidholiday_rule_func1221);
			      _ -> ok
			    end,
			    {error, lang:get(<<"领取失败"/utf8>>)}
		      end;
		  {error, _Reason} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_rule_func1225, _,
			 {__Levelholiday_rule_func1225,
			  __Tracesholiday_rule_func1225}}
			    when __Levelholiday_rule_func1225 band 8 /= 0 orelse
				   __Tracesholiday_rule_func1225 /= [] ->
			    lager:do_log(error,
					 [{module, holiday_rule_func},
					  {function, take}, {line, 1225},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("领取媒体卡接口提交异常~w",
						       [_Reason]),
					 none, 4096, 8,
					 __Levelholiday_rule_func1225,
					 __Tracesholiday_rule_func1225,
					 lager_event,
					 __Pidholiday_rule_func1225);
			_ -> ok
		      end,
		      {error, lang:get(<<"领取失败"/utf8>>)};
		  Any ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_rule_func1228, _,
			 {__Levelholiday_rule_func1228,
			  __Tracesholiday_rule_func1228}}
			    when __Levelholiday_rule_func1228 band 8 /= 0 orelse
				   __Tracesholiday_rule_func1228 /= [] ->
			    lager:do_log(error,
					 [{module, holiday_rule_func},
					  {function, take}, {line, 1228},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("领取媒体卡接口提交异常~w", [Any]),
					 none, 4096, 8,
					 __Levelholiday_rule_func1228,
					 __Tracesholiday_rule_func1228,
					 lager_event,
					 __Pidholiday_rule_func1228);
			_ -> ok
		      end,
		      {error, lang:get(<<"领取失败"/utf8>>)}
		end;
	    _ -> {error, lang:get(<<"奖励已领完"/utf8>>)}
	  end
    end;
take(#holiday{bid = Bid}, Role, Aim, Arg) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule_func1237, _,
       {__Levelholiday_rule_func1237,
	__Tracesholiday_rule_func1237}}
	  when __Levelholiday_rule_func1237 band 8 /= 0 orelse
		 __Tracesholiday_rule_func1237 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule_func}, {function, take},
			{line, 1237}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]无法领取奖励[Bid:~w][Aim:~w][Arg:~w]",
				     [Role#role.name, Bid, Aim, Arg]),
		       none, 4096, 8, __Levelholiday_rule_func1237,
		       __Tracesholiday_rule_func1237, lager_event,
		       __Pidholiday_rule_func1237);
      _ -> ok
    end,
    {error, <<>>}.

-spec zero_flush(#role{}, #holiday{}) -> #role{}.

zero_flush(Role = #role{},
	   Holiday = #holiday{tbid = 3009, camp_id = CampId,
			      bid = Bid, end_time = EndTime}) ->
    {Status, GetAimList} = holiday_lib:get_tv_val(CampId,
						  Bid, Role),
    Now = date:unixtime(),
    case Now >= EndTime of
      true ->
	  {Rebate, _} = holiday_groupon:reward_info(Holiday,
						    Role),
	  case Status =:= 0 andalso Rebate =/= 0 of
	    true ->
		Title = lang:get(<<"团购活动返利"/utf8>>),
		Content =
		    lang:get(<<"亲爱的冒险者大人，您在团购活动中的返利奖励未领取，现返还如下："/utf8>>),
		Remark = <<"运营活动_团购"/utf8>>,
		Assets = [{3, Rebate}],
		{ok, NRole} = mail:add(Role,
				       {Title, Content, Assets, [], Remark,
					86400 + date:unixtime()}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole,
						 {1, GetAimList}, ExpireSec),
		NewRole;
	    _ -> Role
	  end;
      _ ->
	  NewGetAimList = [{Aim, 0, AllBuyCount, AccL}
			   || {Aim, _, AllBuyCount, AccL} <- GetAimList],
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NRole = holiday_lib:set_tv_val(CampId, Role,
					 {Status, NewGetAimList}, ExpireSec),
	  NRole
    end;
zero_flush(Role = #role{},
	   Holiday = #holiday{tbid = TBid, camp_id = CampId,
			      bid = Bid, reward = Reward, end_time = EndTime})
    when TBid == 3013 orelse TBid == 3014 ->
    List = holiday_lib:get_tv_val(CampId, Bid, Role),
    Now = date:unixtime(),
    case Now >= EndTime of
      true ->
	  Fun = fun ({Aim, MaxCount, _NeedStart, Award, _BStr},
		     {Acc1, Acc2}) ->
			{FinishCount, AwardCount} = list_util:keyfind(Aim, List,
								      {0, 0}),
			case FinishCount > AwardCount of
			  true ->
			      FinishCount2 = min(MaxCount, FinishCount),
			      AddAcc1 = [{ItemId,
					  ItemNum * (FinishCount2 - AwardCount)}
					 || {ItemId, ItemNum} <- Award],
			      NAcc1 = item_lib:merge(Acc1, AddAcc1),
			      NAcc2 = lists:keystore(Aim, 1, Acc2,
						     {Aim,
						      {FinishCount2,
						       FinishCount2}}),
			      {NAcc1, NAcc2};
			  _ -> {Acc1, Acc2}
			end
		end,
	  {MailAward, NewList} = lists:foldl(Fun, {[], List},
					     Reward),
	  case MailAward == [] of
	    true -> Role;
	    _ ->
		Mails = case TBid == 3013 of
			  true ->
			      Title = lang:get(<<"融合祝福奖励补发"/utf8>>),
			      Content =
				  lang:get(<<"亲爱的冒险者大人，这是为您补发融合祝福活动未领取的奖励，请查收，祝您游戏愉快！"/utf8>>),
			      Remark = <<"融合祝福奖励补发"/utf8>>,
			      {Assets, Items} =
				  format:split_assets_items(MailAward),
			      {Title, Content, Assets, Items, Remark,
			       86400 + date:unixtime()};
			  _ ->
			      Title = lang:get(<<"升星有礼奖励补发"/utf8>>),
			      Content =
				  lang:get(<<"亲爱的冒险者大人，这是为您补发升星有礼活动未领取的奖励，请查收，祝您游戏愉快！"/utf8>>),
			      Remark = <<"升星有礼奖励补发"/utf8>>,
			      {Assets, Items} =
				  format:split_assets_items(MailAward),
			      {Title, Content, Assets, Items, Remark,
			       86400 + date:unixtime()}
			end,
		{ok, NRole} = mail:add(Role, Mails),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole, NewList,
						 ExpireSec),
		NewRole
	  end;
      _ -> Role
    end;
zero_flush(Role = #role{},
	   Holiday = #holiday{tbid = 3021, camp_id = CampId,
			      bid = Bid, reward = Reward}) ->
    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Fun = fun ({Aim, BuyNum}, Acc) ->
		  case lists:keyfind(Aim, 1, Reward) of
		    {_Aim, _Name, _ItemId, _ItemNum, _Price, _LimitCount,
		     2} ->
			[{Aim, BuyNum} | Acc];
		    _ -> Acc
		  end
	  end,
    NewList = lists:foldl(Fun, [], Lists),
    NewRole = holiday_lib:set_tv_val(CampId, Role, NewList,
				     ExpireSec),
    holiday_lib:push_holiday_one(NewRole, Bid),
    NewRole;
zero_flush(Role = #role{},
	   Holiday = #holiday{tbid = 3026, camp_id = CampId,
			      bid = Bid, reward = Reward,
			      end_time = EndTime}) ->
    List = holiday_lib:get_tv_val(CampId, Bid, Role),
    Now = date:unixtime(),
    case Now >= EndTime of
      true ->
	  Fun = fun ({Aim, MaxCount, _NeedPartnerBid, _NeedStart,
		      Award, _BStr},
		     {Acc1, Acc2}) ->
			{FinishCount, AwardCount} = list_util:keyfind(Aim, List,
								      {0, 0}),
			case FinishCount > AwardCount of
			  true ->
			      FinishCount2 = min(MaxCount, FinishCount),
			      AddAcc1 = [{ItemId,
					  ItemNum * (FinishCount2 - AwardCount)}
					 || {ItemId, ItemNum} <- Award],
			      NAcc1 = item_lib:merge(Acc1, AddAcc1),
			      NAcc2 = lists:keystore(Aim, 1, Acc2,
						     {Aim,
						      {FinishCount2,
						       FinishCount2}}),
			      {NAcc1, NAcc2};
			  _ -> {Acc1, Acc2}
			end
		end,
	  {MailAward, NewList} = lists:foldl(Fun, {[], List},
					     Reward),
	  case MailAward == [] of
	    true -> Role;
	    _ ->
		Title = lang:get(<<"英雄觉醒奖励补发"/utf8>>),
		Content =
		    lang:get(<<"亲爱的冒险者大人，这是为您补发英雄觉醒活动未领取的奖励，请查收，祝您游戏愉快！"/utf8>>),
		Remark = <<"英雄觉醒奖励补发"/utf8>>,
		{Assets, Items} = format:split_assets_items(MailAward),
		Mails = {Title, Content, Assets, Items, Remark,
			 86400 + date:unixtime()},
		{ok, NRole} = mail:add(Role, Mails),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole, NewList,
						 ExpireSec),
		NewRole
	  end;
      _ -> Role
    end;
zero_flush(Role = #role{},
	   Holiday = #holiday{tbid = 3028, camp_id = CampId,
			      bid = Bid}) ->
    {_DayList, BuyList} = holiday_lib:get_tv_val(CampId,
						 Bid, Role),
    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
    NewRole2 = holiday_lib:set_tv_val(CampId, Role,
				      {[], BuyList}, ExpireSec),
    holiday_lib:push_holiday_one(NewRole2, Bid),
    NewRole2;
zero_flush(Role, Holiday = #holiday{tbid = 3030}) ->
    case holiday_lib:check_cond(Role, Holiday) of
      true ->
	  IsMail = var:get_var(Role, other, 3092, 0),
	  case IsMail == 1 of
	    true -> Role;
	    _ ->
		MailItem = [{10010, 10}],
		{Assets, Items} = format:split_assets_items(MailItem),
		{ok, NRole} = mail:add(Role,
				       {lang:get(<<"系统邮件"/utf8>>),
					lang:get(<<"亲爱的冒险者大人：\n        附件是小助手赠与您的【重生材料】，在2月13日维护之"
						   "前将<div fontcolor=#c23f35>「潘」</div>提升了至10星及以上的"
						   "玩家，可以前往<div fontcolor=#c23f35>【限时活动-限时重生】</di"
						   "v>页面进行使用，材料<div fontcolor=#c23f35>仅可用于「潘」回退操作"
						   "</div>，详情请前往活动页面查看\n【注意】可进行回退操作的时间段为：<div "
						   "fontcolor=#c23f35>2月13日维护后至2月19日23:59</div>。过"
						   "期后道具将被销毁，并无法进行回退操作"/utf8>>),
					Assets, Items, <<"运营活动_潘重生"/utf8>>,
					86400 * 3 + date:unixtime()}),
		NewRole = var:set_var(NRole, other, 3092, 1),
		NewRole
	  end;
      _ -> Role
    end;
zero_flush(Role = #role{p_bag = Bag},
	   Holiday = #holiday{camp_id = CampId, end_time = EndTime,
			      tbid = 3044, reward = [Bid]}) ->
    Role;
zero_flush(Role, _Holiday) -> Role.

-spec set_timer(#holiday{}) -> ok.

set_timer(#holiday{title = Name, tbid = TBid,
		   start_time = _StartTime, end_time = EndTime,
		   reward = [_, _, _, NeedId, _], camp_id = CampId,
		   condition = Conds})
    when TBid =:= 3003 orelse
	   TBid =:= 3010 orelse
	     TBid =:= 3011 orelse
	       TBid =:= 3012 orelse TBid =:= 3017 ->
    Now = date:unixtime(),
    NextTime = EndTime - Now - 86400 * 2,
    case NextTime > 0 of
      true ->
	  {{Y, M, D}, _} = date:seconds_to_datetime(EndTime),
	  DataMsg = {string,
		     {red,
		      util:fbin(lang:get(<<"~w年~w月~w日"/utf8>>), [Y, M, D])}},
	  GMail = #gmail{id = {hd_func_drop, TBid, Now},
			 subject =
			     util:fbin(lang:get(<<"~ts活动结束通知"/utf8>>), [Name]),
			 content =
			     color:msg(lang:get(<<"亲爱的冒险者大人：\n     本期「~ts」活动已结束，挂机战斗已不再掉落~ts。活动商"
						  "城将在~ts后完全关闭，关闭后~ts将无法继续使用，请及时使用。"/utf8>>),
				       [Name, {item, NeedId}, DataMsg,
					{item, NeedId}]),
			 conds = Conds, source = <<"限时掉落提醒"/utf8>>},
	  util:set_timer({hd_func_drop, CampId}, NextTime,
			 {apply,
			  {holiday_rule_func, send_mail, [TBid, GMail]}});
      _ -> ok
    end;
set_timer(#holiday{tbid = TBid, camp_id = CampId})
    when TBid =:= 3015 ->
    case sys_env:get(holiday_lantern_festival) of
      {CampId, _} -> skip;
      _ ->
	  OpenDay = date:open_srv_day(),
	  sys_env:set(holiday_lantern_festival, {CampId, OpenDay})
    end;
set_timer(#holiday{tbid = TBid, camp_id = CampId})
    when TBid =:= 3018 ->
    case sys_env:get(holiday_lantern_adventure) of
      {CampId, _} -> skip;
      _ ->
	  OpenDay = date:open_srv_day(),
	  sys_env:set(holiday_lantern_adventure,
		      {CampId, OpenDay})
    end;
set_timer(#holiday{tbid = TBid, camp_id = CampId})
    when TBid =:= 3031 ->
    case sys_env:get(holiday_lantern_adventure1) of
      {CampId, _} -> skip;
      _ ->
	  OpenDay = date:open_srv_day(),
	  sys_env:set(holiday_lantern_adventure1,
		      {CampId, OpenDay})
    end;
set_timer(#holiday{tbid = TBid, camp_id = CampId})
    when TBid =:= 3032 ->
    case sys_env:get(holiday_lantern_adventure2) of
      {CampId, _} -> skip;
      _ ->
	  OpenDay = date:open_srv_day(),
	  sys_env:set(holiday_lantern_adventure2,
		      {CampId, OpenDay})
    end;
set_timer(#holiday{tbid = TBid, camp_id = CampId})
    when TBid =:= 3033 ->
    case sys_env:get(holiday_lantern_adventure3) of
      {CampId, _} -> skip;
      _ ->
	  OpenDay = date:open_srv_day(),
	  sys_env:set(holiday_lantern_adventure3,
		      {CampId, OpenDay})
    end;
set_timer(#holiday{camp_id = CampId, tbid = 3016}) ->
    case sys_env:get(holiday_rule_make, []) of
      List when is_list(List) ->
	  case lists:keyfind(CampId, 1, List) of
	    false ->
		OpenDay = date:open_srv_day(),
		case holiday_make_data:reward_group({CampId, OpenDay})
		    of
		  GroupId when is_integer(GroupId) ->
		      NewList = [{CampId, OpenDay, GroupId} | List],
		      sys_env:save(holiday_rule_make, NewList),
		      ok;
		  _ ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_rule_func1491, _,
			 {__Levelholiday_rule_func1491,
			  __Tracesholiday_rule_func1491}}
			    when __Levelholiday_rule_func1491 band 8 /= 0 orelse
				   __Tracesholiday_rule_func1491 /= [] ->
			    lager:do_log(error,
					 [{module, holiday_rule_func},
					  {function, set_timer}, {line, 1491},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("【~w】材料制作活动不存在【~w】天的奖励",
						       [CampId, OpenDay]),
					 none, 4096, 8,
					 __Levelholiday_rule_func1491,
					 __Tracesholiday_rule_func1491,
					 lager_event,
					 __Pidholiday_rule_func1491);
			_ -> ok
		      end,
		      skip
		end;
	    _ -> skip
	  end;
      _ERR ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule_func1498, _,
	     {__Levelholiday_rule_func1498,
	      __Tracesholiday_rule_func1498}}
		when __Levelholiday_rule_func1498 band 8 /= 0 orelse
		       __Tracesholiday_rule_func1498 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule_func},
			      {function, set_timer}, {line, 1498},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("材料制作活动取到奇怪的数据【~w】", [_ERR]), none,
			     4096, 8, __Levelholiday_rule_func1498,
			     __Tracesholiday_rule_func1498, lager_event,
			     __Pidholiday_rule_func1498);
	    _ -> ok
	  end,
	  skip
    end;
set_timer(_Holiday) -> ok.

send_mail(3003, GMailT) ->
    Now = date:unixtime(),
    GMail = GMailT#gmail{start_time = Now,
			 end_time = Now + 86400 * 2},
    mail:global_send(GMail),
    ok;
send_mail(3010, GMailT) ->
    Now = date:unixtime(),
    GMail = GMailT#gmail{start_time = Now,
			 end_time = Now + 86400 * 2},
    mail:global_send(GMail),
    ok;
send_mail(3011, GMailT) ->
    Now = date:unixtime(),
    GMail = GMailT#gmail{start_time = Now,
			 end_time = Now + 86400 * 2},
    mail:global_send(GMail),
    ok;
send_mail(3012, GMailT) ->
    Now = date:unixtime(),
    GMail = GMailT#gmail{start_time = Now,
			 end_time = Now + 86400 * 2},
    mail:global_send(GMail),
    ok;
send_mail(3017, GMailT) ->
    Now = date:unixtime(),
    GMail = GMailT#gmail{start_time = Now,
			 end_time = Now + 86400 * 2},
    mail:global_send(GMail),
    ok;
send_mail(_, _) -> ok.


