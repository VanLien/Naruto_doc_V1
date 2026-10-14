-file("data/endless.erl", 1).

-file("src/mod/endless/endless.erl", 1).

-module(endless).

-lager_records([{personal_push_gift_data,
		 [gift_id, type_id, charge_id, limit_count, money,
		  costly_num, valid_time, open_cond, warehouse_id, award,
		  over_time, buy_count, trigger_id]},
		{m_personal_push,
		 [ver, fire_type, fire_not_buy, fire_gift, ext]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{link, [socket, conn_pid, ip, port, lag]},
		{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
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
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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

-export([login/1, ready/1, init/0, zero_flush/1,
	 start_combat/5, is_combat_end/2, combat_over/4,
	 push_ext_reward/2, get_ext_reward/3, push_base_info/1,
	 async_role/4, push_combat_info/2, push_combat_info/3,
	 check_need_select_buff/2, push_select_buff_list/1,
	 push_select_buff_list/4, select/2, select_apply/4, gm/2,
	 push/2, get_type/0, get_new_end_less/2, gm_reset/1,
	 push/3, push_combat_info/1, get_type/3, gm_type/2,
	 gm_rank/3]).

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

-file("src/mod/endless/endless.erl", 38).

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

-file("src/mod/endless/endless.erl", 39).

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

-file("src/mod/endless/endless.erl", 40).

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

-file("src/mod/endless/endless.erl", 41).

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

-file("src/mod/endless/endless.erl", 42).

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

-file("src/mod/endless/endless.erl", 43).

-file("inc/log.hrl", 1).

-file("src/mod/endless/endless.erl", 44).

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

-file("src/mod/endless/endless.erl", 45).

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

-file("src/mod/endless/endless.erl", 46).

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

-file("src/mod/endless/endless.erl", 47).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/mod/endless/endless.erl", 48).

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

-file("src/mod/endless/endless.erl", 49).

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

-file("src/mod/endless/endless.erl", 50).

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

-file("src/mod/endless/endless.erl", 51).

-file("inc/personal_push.hrl", 1).

-record(m_personal_push,
	{ver = 1, fire_type = [], fire_not_buy = [],
	 fire_gift = [], ext = []}).

-record(personal_push_gift_data,
	{gift_id = 0, type_id = 0, charge_id = 0,
	 limit_count = 0, money = 0, costly_num = 0,
	 valid_time = 0, open_cond = [], warehouse_id = [],
	 award = [], over_time = 0, buy_count = 0,
	 trigger_id = 0}).

-file("src/mod/endless/endless.erl", 52).

gm_rank(#role{id = Id}, Type, Idx) ->
    case endless_data:rank_reward({Type, Idx}) of
      Cfg when is_list(Cfg) ->
	  mail:send(Id,
		    {lang:get(<<"Danh sách xếp hạng phần thưởng"/utf8>>),
		     color:msg(lang:get(<<"Nhẫn Giả thân mến, bạn đã đạt được~tsKết "
					  "quả tuyệt vời! Vui lòng kiểm tra！"/utf8>>),
			       [{green, Idx}]),
		     items, Cfg, <<"无尽试炼"/utf8>>});
      Undef ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidendless61, _,
	     {__Levelendless61, __Tracesendless61}}
		when __Levelendless61 band 8 /= 0 orelse
		       __Tracesendless61 /= [] ->
		lager:do_log(error,
			     [{module, endless}, {function, gm_rank},
			      {line, 61}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("未知的无尽排行奖励id:~w, Idx:~w, Undef:~w， type:~w",
					   [Id, Idx, Undef, Type]),
			     none, 4096, 8, __Levelendless61, __Tracesendless61,
			     lager_event, __Pidendless61);
	    _ -> ok
	  end,
	  ok
    end.

gm_type(Role = #role{m_endless =
			 MEndless = #m_endless{new_endless_list =
						   NewEndLessList}},
	Type) ->
    NewEndLessList1 = get_new_end_less(Type,
				       NewEndLessList),
    NRole = Role#role{m_endless =
			  MEndless#m_endless{type = 0, select_type = Type,
					     new_endless_list =
						 NewEndLessList1}},
    push_base_info(NRole),
    {ok, NRole}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{m_endless =
		       EndLess = #m_endless{type = Type, day_pass = DayPass,
					    flag = Flag}}) ->
    NewEndLess = case Flag of
		   0 ->
		       case Type =:= 0 andalso DayPass > 0 of
			 true ->
			     EndLess#m_endless{day_pass = 0, day_reward = []};
			 _ -> EndLess
		       end;
		   _ -> EndLess
		 end,
    NewEndLess1 = NewEndLess#m_endless{flag = 1},
    NewRole = Role#role{m_endless = NewEndLess1},
    {ok, NewRole}.

ready(Role) ->
    case combat_lib:combat_pid(Role, 11) of
      {_, ComPid} when is_pid(ComPid) ->
	  push_select_buff_list(Role), ok;
      _ -> ok
    end.

-spec init() -> #m_endless{}.

init() ->
    SelectType = get_type(),
    NewEndLessList1 = get_new_end_less(SelectType, []),
    #m_endless{select_type = SelectType,
	       new_endless_list = NewEndLessList1}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_endless =
			    MEndless = #m_endless{max_id = MaxId,
						  new_endless_list =
						      NewEndLessList}}) ->
    SelectType = get_type(),
    NewEndLessList1 = get_new_end_less(SelectType,
				       NewEndLessList),
    BeginId = calc_begin_round(MaxId),
    NRole = Role#role{m_endless =
			  MEndless#m_endless{day_begin = BeginId, day_pass = 0,
					     day_reward = [], appoint = [],
					     type = 0, select_type = SelectType,
					     new_endless_list =
						 NewEndLessList1}},
    push_base_info(NRole),
    endless_employ:push_self_employ(NRole),
    NewMaxIdLimit =
	endless_data:get_const(endless_new_limit),
    case MaxId >= NewMaxIdLimit of
      true ->
	  log:save(join,
		   {NRole, <<"新版无尽"/utf8>>, <<"新版无尽可参与玩家"/utf8>>});
      _ -> skip
    end,
    {ok, NRole}.

-spec start_combat(#role{}, pos_integer(),
		   pos_integer(), list(), pos_integer()) -> {ok, #role{}} |
							    {false,
							     bitstring()}.

start_combat(Role = #role{id = RoleId,
			  m_endless =
			      MEndless = #m_endless{day_reward = DayReward,
						    type = RoleType}},
	     Type, FormationType, PosInfo, HallowsId) ->
    case check_can_combat([lev, formation, gen_fight, type,
			   unit, total_wave],
			  Role,
			  #{formation => FormationType, pos_info => PosInfo,
			    type => Type})
	of
      {false, Reason} -> {false, Reason};
      {AtkGroup0, FormationLev, PBids, UnitId, TotalWave,
       BeginId} ->
	  case gen_monster_object(BeginId, Type) of
	    {false, Reason} -> {false, Reason};
	    {DefendList, BFormationType, BFormationLev, TarName} ->
		Now = date:unixtime(),
		SysFormationType = get_sys_information_type(Type),
		Args = #{on_role_combat_end =>
			     {endless, combat_over,
			      [{BeginId, DayReward, PBids, Type, Now}]},
			 ext_args =>
			     [{cli_ext_args, [UnitId]}, {is_show_panel, false},
			      {begin_round, {BeginId, DayReward, Type}}],
			 formation =>
			     [{1, FormationType, FormationLev},
			      {2, BFormationType, BFormationLev}],
			 target_role_name => TarName,
			 is_combat_end =>
			     {endless, is_combat_end, [{BeginId, Type}]},
			 total_wave => TotalWave,
			 select_buff_callback =>
			     {endless, check_need_select_buff, [BeginId]}},
		DunAttrs = dungeon:buff_attr(Role),
		AtkGroup1 = [combat_lib:add_base_attr(FO, DunAttrs)
			     || FO <- AtkGroup0],
		AtkGroup = sprite_tree:gen_fight_object_type(Role,
							     SysFormationType)
			     ++
			     hallows_lib:gen_fight_object(Role, HallowsId) ++
			       AtkGroup1,
		case combat_lib:start_combat(Role, 11, AtkGroup,
					     [DefendList], Args)
		    of
		  {ok, _CombatPid} ->
		      PosInfo0 = [{Pos, PId}
				  || {Pos, OwnId, OwnSrvId, PId} <- PosInfo,
				     {OwnId, OwnSrvId} =:= RoleId],
		      NewType = case RoleType =:= 0 of
				  true -> Type;
				  _ -> RoleType
				end,
		      Role1 = Role#role{m_endless =
					    MEndless#m_endless{r_id = BeginId,
							       type = NewType}},
		      {ok, NRole} = case formation:set_sys_formation(Role1,
								     SysFormationType,
								     FormationType,
								     PosInfo0,
								     HallowsId)
					of
				      {ok, Role2} -> {ok, Role2};
				      _ -> {ok, Role1}
				    end,
		      holiday_return_new:send_return(NRole, {RoleId, PosInfo},
						     endless),
		      NewRole = send_friend_point(PosInfo, NRole),
		      {ok, NewRole};
		  {false, Msg} -> {false, Msg};
		  _ ->
		      {false,
		       lang:get(<<"Không thể bắt đầu trận chiến Endless "
				  "Trial"/utf8>>)}
		end
	  end
    end.

-spec is_combat_end(#combat{}, tuple()) -> {true,
					    atom()} |
					   {false, atom(), pos_integer(),
					    list(), tuple(), string()}.

is_combat_end(#combat{combat_roles =
			  [#combat_role{pid = Pid}],
		      total_wave = TotalWave, wave = CurrentWave},
	      {BeginId, Type}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidendless185, _,
       {__Levelendless185, __Tracesendless185}}
	  when __Levelendless185 band 128 /= 0 orelse
		 __Tracesendless185 /= [] ->
	  lager:do_log(debug,
		       [{module, endless}, {function, is_combat_end},
			{line, 185}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("is combat end ~w ~w", [BeginId, Type]),
		       none, 4096, 128, __Levelendless185, __Tracesendless185,
		       lager_event, __Pidendless185);
      _ -> ok
    end,
    case combat_util:is_current_wave_action_end() of
      {true, a_win} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidendless188, _,
	     {__Levelendless188, __Tracesendless188}}
		when __Levelendless188 band 128 /= 0 orelse
		       __Tracesendless188 /= [] ->
		lager:do_log(debug,
			     [{module, endless}, {function, is_combat_end},
			      {line, 188}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("is combat end ~w, ~w,~w, ~w",
					   [BeginId, CurrentWave, TotalWave,
					    Type]),
			     none, 4096, 128, __Levelendless188,
			     __Tracesendless188, lager_event, __Pidendless188);
	    _ -> ok
	  end,
	  case CurrentWave >= TotalWave of
	    true -> {true, a_win};
	    false ->
		NewMaxPass =
		    endless_data:get_const(endless_new_max_pass),
		case Type =/= 5 of
		  true when CurrentWave >= NewMaxPass ->
		      notice:alert({role_pid, Pid},
				   lang:get(<<"Đã đạt đến giới hạn giải phóng mặt bằng "
					      "cho ngày hôm nay"/utf8>>)),
		      {true, a_win};
		  _ ->
		      Round = BeginId + CurrentWave,
		      case gen_monster_object(Round, Type) of
			{false, Msg} ->
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
			      {__Pidendless201, _,
			       {__Levelendless201, __Tracesendless201}}
				  when __Levelendless201 band 8 /= 0 orelse
					 __Tracesendless201 /= [] ->
				  lager:do_log(error,
					       [{module, endless},
						{function, is_combat_end},
						{line, 201},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("无尽试炼类型~w第~w关怪物数据出错 ~w",
							     [Type, Round,
							      Msg]),
					       none, 4096, 8, __Levelendless201,
					       __Tracesendless201, lager_event,
					       __Pidendless201);
			      _ -> ok
			    end,
			    {true, a_win};
			{DefendList, BFormationType, BFormationLev, TarName} ->
			    NewWave = CurrentWave + 1,
			    pass_round_buff(),
			    role:apply(async, Pid,
				       {fun async_role/4,
					[BeginId, Type, CurrentWave]}),
			    {false, next_wave, NewWave, DefendList,
			     {BFormationType, BFormationLev}, TarName}
		      end
		end
	  end;
      Other -> Other
    end.

-spec combat_over(#role{}, #combat_result{}, #combat{},
		  tuple()) -> {ok, #role{}} | ok.

combat_over(Role,
	    #combat_result{wave_num = CurrentWave,
			   hurt_statistics = HurtStatistics},
	    Combat = #combat{target_role_name = TargetName},
	    {BeginId, DayReward, PBids, Type, StartCombatTime}) ->
    PassId = BeginId + CurrentWave - 1,
    {DayItems, NewDayReward, _, _} =
	calc_day_reward(BeginId, PassId, DayReward, Type),
    {Role1, NewMaxId} = set_endless(Role, Type, PassId,
				    CurrentWave, NewDayReward, StartCombatTime),
    LogType = get_log_type(Type),
    {ok, Role2, _} = drop_lib:gain_combat_drop(Role1,
					       Combat, 1, DayItems, LogType,
					       util:fbin("挑战无尽试炼奖励类型~w:从~w至~w，使用英雄：~w",
							 [Type, BeginId, PassId,
							  PBids])),
    NRole = fire_trigger(Type, NewMaxId, Role2),
    combat_over_rank(NRole, Type),
    push_base_info(NRole),
    push_ext_reward(NRole, Type),
    endless_employ:push_self_employ(NRole),
    log_join(NRole, Type),
    case DayItems of
      [] ->
	  sys_conn:pack_send(20006,
			     {1, [], 0, 0, 0, 11, TargetName, HurtStatistics, 0,
			      0, []});
      _ ->
	  sys_conn:pack_send(20006,
			     {1,
			      combat_end:gen_cli_items(world_lev:recalc_list_exp(Role,
										 DayItems),
						       []),
			      1, 0, 0, 11, TargetName, HurtStatistics, 0, 0,
			      []})
    end,
    {ok, NRole};
combat_over(Role = #role{m_endless =
			     #m_endless{type = RoleType}},
	    #combat_result{}, _Combat,
	    {_BeginId, _DayReward, _PBids, Type,
	     _StartCombatTime}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidendless241, _,
       {__Levelendless241, __Tracesendless241}}
	  when __Levelendless241 band 8 /= 0 orelse
		 __Tracesendless241 /= [] ->
	  lager:do_log(error,
		       [{module, endless}, {function, combat_over},
			{line, 241}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("新无尽战斗结束失败玩家:~ts id:~w, 类型~w, 自己选择类型~w",
				     [Role#role.name, Role#role.id, Type,
				      RoleType]),
		       none, 4096, 8, __Levelendless241, __Tracesendless241,
		       lager_event, __Pidendless241);
      _ -> ok
    end,
    ok;
combat_over(_Role, _CombatResult, _Combat, _Args) -> ok.

-spec push_ext_reward(#role{}, pos_integer()) -> ok.

push_ext_reward(Role = #role{m_endless =
				 #m_endless{max_id = MaxId,
					    ext_reward = ExtReward,
					    new_endless_list = NewEndLess}},
		Type) ->
    Data = case Type of
	     5 ->
		 ExtRewardDataList = [DataId
				      || {DataId, DataType}
					     <- endless_data:list_ext_reward(),
					 DataType =:= Type],
		 case lists:sort(ExtRewardDataList -- ExtReward) of
		   [Id | _] ->
		       #{limit_id := LimitId} = endless_data:ext_reward({Id,
									 Type}),
		       {Id, util:if_true(MaxId >= LimitId, 1, 0), MaxId,
			ExtReward, Type};
		   _ -> {0, 0, MaxId, ExtReward, Type}
		 end;
	     _ ->
		 case lists:keyfind(Type, #new_endless.type, NewEndLess)
		     of
		   #new_endless{max_id = NewMaxId,
				ext_reward = NewExtReward} ->
		       ExtRewardDataList = [DataId
					    || {DataId, DataType}
						   <- endless_data:list_ext_reward(),
					       DataType =:= Type],
		       case lists:sort(ExtRewardDataList -- NewExtReward) of
			 [Id | _] ->
			     #{limit_id := LimitId} =
				 endless_data:ext_reward({Id, Type}),
			     {Id, util:if_true(NewMaxId >= LimitId, 1, 0),
			      NewMaxId, NewExtReward, Type};
			 _ -> {0, 0, NewMaxId, NewExtReward, Type}
		       end;
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
			 {__Pidendless272, _,
			  {__Levelendless272, __Tracesendless272}}
			     when __Levelendless272 band 8 /= 0 orelse
				    __Tracesendless272 /= [] ->
			     lager:do_log(error,
					  [{module, endless},
					   {function, push_ext_reward},
					   {line, 272},
					   {pid, pid_to_list(self())},
					   {node, node()}
					   | lager:md()],
					  io_lib:format("新无尽类型获得失败玩家:~ts id:~w, 类型~w, 自己可选择列表~w",
							[Role#role.name,
							 Role#role.id, Type,
							 NewEndLess]),
					  none, 4096, 8, __Levelendless272,
					  __Tracesendless272, lager_event,
					  __Pidendless272);
			 _ -> ok
		       end,
		       {0, 0, 0, [], Type}
		 end
	   end,
    sys_conn:pack_send(23903, Data),
    ok.

-spec get_ext_reward(#role{}, Id :: pos_integer(),
		     pos_integer()) -> {ok, #role{}} | {false, binary()}.

get_ext_reward(Role = #role{m_endless =
				MEndLess = #m_endless{max_id = MaxId,
						      ext_reward = ExtReward}},
	       Id, Type = 5) ->
    case endless_data:ext_reward({Id, Type}) of
      #{limit_id := LimitId} when LimitId > MaxId ->
	  {false,
	   lang:get(<<"Không đáp ứng được điều kiện thông quan"/utf8>>)};
      #{items := Items, limit_id := LimitId} ->
	  case lists:member(Id, ExtReward) of
	    true ->
		{false, lang:get(<<"Phần thưởng nhận được"/utf8>>)};
	    false ->
		GL = format:val_to_gain(Items, endless),
		case role_gain:do_notice(Role, GL) of
		  {ok, Role1} ->
		      NRole = Role1#role{m_endless =
					     MEndLess#m_endless{ext_reward =
								    [Id
								     | ExtReward]}},
		      NRole1 = gift_trigger:fire(NRole, endless_pass_every,
						 [{1, LimitId}]),
		      log:log_gain(GL, Role, NRole1, <<"无尽试炼"/utf8>>,
				   util:fbin("无尽试炼类型~w额外奖励id:~w", [Type, Id])),
		      push_ext_reward(NRole1, Type),
		      {ok, NRole1};
		  {false, #gain{msg = Msg}} -> {false, Msg}
		end
	  end;
      _ ->
	  {false, lang:get(<<"Phần thưởng không tồn tại"/utf8>>)}
    end;
get_ext_reward(Role = #role{m_endless =
				MEndLess = #m_endless{new_endless_list =
							  NewEndList}},
	       Id, Type) ->
    case lists:keyfind(Type, #new_endless.type, NewEndList)
	of
      NewEndLess = #new_endless{max_id = MaxId,
				ext_reward = ExtReward} ->
	  case endless_data:ext_reward({Id, Type}) of
	    #{limit_id := LimitId} when LimitId > MaxId ->
		{false,
		 lang:get(<<"Không đáp ứng được điều kiện thông quan"/utf8>>)};
	    #{items := Items} ->
		case lists:member(Id, ExtReward) of
		  true ->
		      {false, lang:get(<<"Phần thưởng nhận được"/utf8>>)};
		  false ->
		      GL = format:val_to_gain(Items, endless),
		      case role_gain:do_notice(Role, GL) of
			{ok, Role1} ->
			    NewNewEndLess = NewEndLess#new_endless{ext_reward =
								       [Id
									| ExtReward]},
			    NewNewEndList = lists:keyreplace(Type,
							     #new_endless.type,
							     NewEndList,
							     NewNewEndLess),
			    NewMEndLess = MEndLess#m_endless{new_endless_list =
								 NewNewEndList},
			    NRole = Role1#role{m_endless = NewMEndLess},
			    log:log_gain(GL, Role, NRole, <<"无尽试炼"/utf8>>,
					 util:fbin("无尽试炼类型~w额外奖励id:~w",
						   [Type, Id])),
			    push_ext_reward(NRole, Type),
			    {ok, NRole};
			{false, #gain{msg = Msg}} -> {false, Msg}
		      end
		end;
	    _ ->
		{false, lang:get(<<"Phần thưởng không tồn tại"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Không có dữ liệu nào thuộc loại này"/utf8>>)}
    end.

-spec push_base_info(#role{}) -> ok.

push_base_info(Role = #role{id = Rid,
			    m_endless =
				#m_endless{day_begin = BeginId, max_id = MaxId,
					   day_pass = DayPass, employ = EmployL,
					   day_reward = DayReward, type = Type,
					   select_type = SelectType,
					   new_endless_list =
					       NewEndlessList}}) ->
    {MyIdx, RankL} = rank_info(18, Role),
    {NextType, NextLastTime} = get_next_type(),
    NewRankType = get_new_end_less_rank_type(SelectType),
    {MyNewIdx, NewRankL} = rank_info(NewRankType, Role),
    {NewMaxId1, NewBeginId1, NewDayPass1} = case
					      lists:keyfind(SelectType,
							    #new_endless.type,
							    NewEndlessList)
						of
					      #new_endless{max_id = NewMaxId,
							   day_begin =
							       NewBeginId,
							   day_pass =
							       NewDayPass} ->
						  {NewMaxId, NewBeginId,
						   NewDayPass};
					      _ ->
						  case {whereis(lager_event),
							whereis(lager_event),
							lager_config:get({lager_event,
									  loglevel},
									 {0,
									  []})}
						      of
						    {undefined, undefined, _} ->
							fun () ->
								{error,
								 lager_not_running}
							end();
						    {undefined, _, _} ->
							fun () ->
								{error,
								 {sink_not_configured,
								  lager_event}}
							end();
						    {__Pidendless355, _,
						     {__Levelendless355,
						      __Tracesendless355}}
							when __Levelendless355
							       band 8
							       /= 0
							       orelse
							       __Tracesendless355
								 /= [] ->
							lager:do_log(error,
								     [{module,
								       endless},
								      {function,
								       push_base_info},
								      {line,
								       355},
								      {pid,
								       pid_to_list(self())},
								      {node,
								       node()}
								      | lager:md()],
								     io_lib:format("新无尽类型获得失败玩家:~ts id:~w, 可选类型~w, 自己可选择列表~w",
										   [Role#role.name,
										    Rid,
										    SelectType,
										    NewEndlessList]),
								     none, 4096,
								     8,
								     __Levelendless355,
								     __Tracesendless355,
								     lager_event,
								     __Pidendless355);
						    _ -> ok
						  end,
						  {0, 0, 0}
					    end,
    IsEmploy = util:if_true(length(EmployL) =:= 0, 0, 1),
    CliEmployL = [{Id, Bid, PLev, Star, Quality, Power, Ext}
		  || {{{_Rid, _SrvId}, Id}, _Name, Bid, PLev, Star,
		      Quality, _BreakLev, Power, Ext}
			 <- EmployL],
    IsAppoint = case endless_employ:r_list(Rid) of
		  [] -> 0;
		  _ -> 1
		end,
    IsReward = util:if_true(length(DayReward) >=
			      endless_data:get_const(dayreward_roundnum),
			    1, 0),
    sys_conn:pack_send(23900,
		       {Type, SelectType, NextType, NextLastTime, MaxId,
			BeginId, DayPass, MyIdx, RankL, NewMaxId1, NewBeginId1,
			NewDayPass1, MyNewIdx, NewRankL, IsEmploy, CliEmployL,
			IsAppoint, IsReward}),
    ok.

-spec async_role(#role{}, pos_integer(), pos_integer(),
		 pos_integer()) -> {ok, #role{}}.

async_role(Role = #role{name = Name, id = Id,
			m_endless = MEndless},
	   BeginId, Type, PassNum) ->
    CurrentRound = BeginId + PassNum - 1,
    NextRound = BeginId + PassNum,
    {NewMaxId, NewMEndless} = set_new_max_id(MEndless, Type,
					     CurrentRound, Name, Id),
    NewMEndless1 = NewMEndless#m_endless{r_id = NextRound},
    Role1 = Role#role{m_endless = NewMEndless1},
    NRole = fire_trigger(Type, NewMaxId, Role1),
    push_combat_info(NRole, Type),
    {ok, NRole}.

-spec push_combat_info(#role{}) -> ok.

push_combat_info(Role = #role{pid = Pid,
			      m_endless = #m_endless{type = 0}}) ->
    case combat_lib:combat_pid(Role, 11) of
      {_, ComPid} when is_pid(ComPid) ->
	  combat:send_info(ComPid, endless, get_type, [{Pid}]);
      _ -> ok
    end,
    ok;
push_combat_info(Role = #role{m_endless =
				  #m_endless{type = Type}}) ->
    push_combat_info(Role, Type).

-spec get_type(_, #combat{}, tuple()) -> ok.

get_type(_, #combat{ext_args = ExtArgs}, {Pid}) ->
    case lists:keyfind(begin_round, 1, ExtArgs) of
      {begin_round, {_ExtBeginId, _ExtDayReward, ExtType}} ->
	  role:apply(async, Pid,
		     {fun push_combat_info/2, [ExtType]});
      _ -> ok
    end,
    ok.

-spec push_combat_info(#role{}, pos_integer()) -> ok.

push_combat_info(Role = #role{link =
				  #link{conn_pid = ConnPid},
			      name = Name, id = Id,
			      m_endless =
				  #m_endless{r_id = CombatRound,
					     day_begin = BeginId,
					     day_reward = DayReward,
					     max_id = MaxId,
					     ext_reward = ExtReward,
					     new_endless_list =
						 NewEndLessList}},
		 Type) ->
    case combat_lib:combat_pid(Role, 11) of
      {_, ComPid} when is_pid(ComPid) ->
	  case Type of
	    5 ->
		combat:send_info(ComPid, endless, push_combat_info,
				 [{ConnPid, CombatRound, BeginId, DayReward,
				   MaxId, ExtReward, Type}]);
	    _ ->
		case lists:keyfind(Type, #new_endless.type,
				   NewEndLessList)
		    of
		  #new_endless{day_begin = NewBeginId, max_id = NewMaxId,
			       ext_reward = NewExtReward} ->
		      combat:send_info(ComPid, endless, push_combat_info,
				       [{ConnPid, CombatRound, NewBeginId,
					 DayReward, NewMaxId, NewExtReward,
					 Type}]);
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
			{__Pidendless427, _,
			 {__Levelendless427, __Tracesendless427}}
			    when __Levelendless427 band 8 /= 0 orelse
				   __Tracesendless427 /= [] ->
			    lager:do_log(error,
					 [{module, endless},
					  {function, push_combat_info},
					  {line, 427},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("玩家~ts id~w无尽回合结束推送读取失败type~w,无尽列表~w",
						       [Name, Id, Type,
							NewEndLessList]),
					 none, 4096, 8, __Levelendless427,
					 __Tracesendless427, lager_event,
					 __Pidendless427);
			_ -> ok
		      end,
		      ok
		end
	  end,
	  ok;
      _ -> ok
    end.

-spec push_combat_info(_, #combat{}, tuple()) -> ok.

push_combat_info(_, #combat{ext_args = ExtArgs},
		 {ConnPid, CombatRound, DayBegin, OldDayReward, MaxId,
		  ExtReward, Type}) ->
    {BeginId, DayReward, NewType} = case
				      lists:keyfind(begin_round, 1, ExtArgs)
					of
				      {begin_round,
				       {ExtBeginId, ExtDayReward, ExtType}} ->
					  {ExtBeginId, ExtDayReward, ExtType};
				      _ -> {DayBegin, OldDayReward, Type}
				    end,
    ExtRewardDataList = [DataId
			 || {DataId, DataType}
				<- endless_data:list_ext_reward(),
			    DataType =:= NewType],
    {ExtId, ExtStatus} = case lists:sort(ExtRewardDataList
					   -- ExtReward)
			     of
			   [Id | _] ->
			       #{limit_id := LimitId} =
				   endless_data:ext_reward({Id, NewType}),
			       {Id, util:if_true(MaxId >= LimitId, 1, 0)};
			   _ -> {0, 0}
			 end,
    {AccReward, NDayReward, RestRewardRound,
     MaxRewardRound} =
	calc_day_reward(BeginId, CombatRound - 1, DayReward,
			NewType),
    BuffList = combat_dict:get_var(buff_rest_round, []),
    Fun = fun ({BuffId, RestRound}, Acc) ->
		  #{group_id := GroupId} = endless_data:get_buff(BuffId),
		  [{BuffId, GroupId, RestRound} | Acc]
	  end,
    NBuffList = lists:foldl(Fun, [], BuffList),
    IsRewardBuff = util:if_true(length(NDayReward) >=
				  endless_data:get_const(dayreward_roundnum),
				1, 0),
    sys_conn:pack_send(ConnPid, 23902,
		       {CombatRound, MaxId, NBuffList, RestRewardRound,
			MaxRewardRound, IsRewardBuff, AccReward, ExtId,
			ExtStatus, NewType}),
    ok.

-spec check_need_select_buff(#combat{},
			     pos_integer()) -> {true, #combat{},
						pos_integer()} |
					       false.

check_need_select_buff(Combat = #combat{combat_roles =
					    [#combat_role{conn_pid = ConnPid}],
					wave = Wave},
		       BeginId) ->
    LastWave = combat_dict:get_var(select_buff_wave, 0),
    case LastWave =:= 0 orelse
	   Wave - LastWave >=
	     endless_data:get_const(buffchoice_interval)
	of
      true ->
	  RandBuffL = rand_buff_list(),
	  FightObject = combat_util:a_objects(),
	  combat_dict:set_var(select_buff_list, RandBuffL),
	  PList = cli_partner_status(FightObject, []),
	  {FormationType, FormationLev} =
	      combat_dict:get_formation(1),
	  notice_below:send(ConnPid, endless),
	  sys_conn:pack_send(ConnPid, 23910,
			     {1, RandBuffL, PList, FormationType, FormationLev,
			      BeginId + Wave - 1}),
	  {true, Combat, 3600000 * 1};
      _ -> false
    end.

-spec push_select_buff_list(#role{}) -> ok.

push_select_buff_list(Role = #role{link =
				       #link{conn_pid = ConnPid},
				   m_endless =
				       #m_endless{r_id = CurrentRound}}) ->
    case combat_lib:combat_pid(Role, 11) of
      {_, ComPid} when is_pid(ComPid) ->
	  combat:send_info(ComPid, endless, push_select_buff_list,
			   [ConnPid, CurrentRound]),
	  ok;
      _ -> ok
    end.

-spec push_select_buff_list(atom(), #combat{}, pid(),
			    pos()) -> ok.

push_select_buff_list(in_select_buff, #combat{},
		      ConnPid, CurrentRound) ->
    case combat_dict:get_var(select_buff_list, []) of
      SelectBuffList = [_ | _] ->
	  FightObject = combat_util:a_objects(),
	  PList = cli_partner_status(FightObject, []),
	  {FormationType, FormationLev} =
	      combat_dict:get_formation(1),
	  notice_below:send(ConnPid, endless),
	  sys_conn:pack_send(ConnPid, 23910,
			     {1, SelectBuffList, PList, FormationType,
			      FormationLev, CurrentRound}),
	  ok;
      _ -> ok
    end;
push_select_buff_list(_StateName, _Combat, _ConnPid,
		      _) ->
    ok.

-spec select(#role{}, pos_integer()) -> ok |
					{false, bitstring()}.

select(Role = #role{link = #link{conn_pid = ConnPid}},
       Id) ->
    case combat_lib:combat_pid(Role, 11) of
      {_, ComPid} when is_pid(ComPid) ->
	  combat:send_info(ComPid, endless, select_apply,
			   [Id, ConnPid]),
	  ok;
      _ ->
	  {false,
	   lang:get(<<"Trận chiến hiện tại đã kết thúc"/utf8>>)}
    end.

-spec select_apply(atom(), #combat{}, pos_integer(),
		   pid()) -> ok | {atom(), atom()}.

select_apply(in_select_buff,
	     #combat{combat_roles =
			 [#combat_role{pid = Pid, name = Name}],
		     wave = CurrentWave, ext_args = ExtArgs},
	     Id, ConnPid) ->
    case combat_dict:get_var(select_buff_list, []) of
      SBuffIds = [_ | _] ->
	  BuffIds = [B || {_, B} <- SBuffIds],
	  case lists:member(Id, BuffIds) of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidendless529, _,
		   {__Levelendless529, __Tracesendless529}}
		      when __Levelendless529 band 8 /= 0 orelse
			     __Tracesendless529 /= [] ->
		      lager:do_log(error,
				   [{module, endless}, {function, select_apply},
				    {line, 529}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("玩家[~ts]选择BUFF[~w][~w]不存在",
						 [Name, Id, SBuffIds]),
				   none, 4096, 8, __Levelendless529,
				   __Tracesendless529, lager_event,
				   __Pidendless529);
		  _ -> ok
		end,
		sys_conn:pack_send(ConnPid, 23911,
				   {1,
				    lang:get(<<"Buff không tồn tại"/utf8>>)}),
		ok;
	    _ ->
		#{skill_id := SkillId, round := Round} =
		    endless_data:get_buff(Id),
		Skill = skill_data:get_skill(SkillId),
		Fun = fun (Pos) ->
			      NSkill = [Skill],
			      combat_dict:set_passive_skills(Pos, NSkill)
		      end,
		lists:map(Fun, combat_dict:all_a()),
		combat_dict:set_var(select_buff_list, []),
		combat_dict:set_var(select_buff_wave, CurrentWave),
		BuffRest = combat_dict:get_var(buff_rest_round, []),
		NewBuffRest = lists:keystore(Id, 1, BuffRest,
					     {Id, Round}),
		combat_dict:set_var(buff_rest_round, NewBuffRest),
		sys_conn:pack_send(ConnPid, 23911,
				   {1, lang:get(<<"Chọn thành công"/utf8>>)}),
		role:apply(async, Pid,
			   {fun push_select_buff_list/1, []}),
		case lists:keyfind(begin_round, 1, ExtArgs) of
		  {begin_round, {_, _, ExtType}} ->
		      role:apply(async, Pid,
				 {fun push_combat_info/2, [ExtType]});
		  _ -> ok
		end,
		case CurrentWave =:= 1 of
		  true ->
		      role_trigger:async_fire(Pid, #evt_endless_fight{});
		  _ -> ok
		end,
		{next_state, in_ready}
	  end;
      _Temp ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidendless561, _,
	     {__Levelendless561, __Tracesendless561}}
		when __Levelendless561 band 8 /= 0 orelse
		       __Tracesendless561 /= [] ->
		lager:do_log(error,
			     [{module, endless}, {function, select_apply},
			      {line, 561}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("玩家[~ts]选择BUFF[~w][~w]不存在",
					   [Name, _Temp, Id]),
			     none, 4096, 8, __Levelendless561,
			     __Tracesendless561, lager_event, __Pidendless561);
	    _ -> ok
	  end,
	  sys_conn:pack_send(ConnPid, 23911,
			     {1, lang:get(<<"BUFF không tồn tại"/utf8>>)}),
	  ok
    end;
select_apply(_StateName, _Combat, _BuffId, ConnPid) ->
    sys_conn:pack_send(ConnPid, 23911,
		       {1,
			lang:get(<<"Giai đoạn lựa chọn BUFF hiện tại không "
				   "được tiến hành"/utf8>>)}),
    ok.

-spec gm(#role{}, integer()) -> {ok, #role{}}.

gm(Role = #role{m_endless =
		    MEndless = #m_endless{max_id = MaxId}},
   Id) ->
    NewMaxId = util:if_true(MaxId >= Id, MaxId, Id),
    NRole = Role#role{m_endless =
			  MEndless#m_endless{day_begin = Id,
					     max_id = NewMaxId}},
    push_base_info(NRole),
    {ok, NRole}.

-spec gm_reset(#role{}) -> {ok, #role{}}.

gm_reset(Role = #role{m_endless = MEndless}) ->
    NewMEndless = MEndless#m_endless{type = 0},
    NewRole = Role#role{m_endless = NewMEndless},
    push_base_info(NewRole),
    {ok, NewRole}.

push(#role{m_endless =
	       #m_endless{max_id = MaxId, ext_reward = ExtReward,
			  new_endless_list = NewEndLessList,
			  select_type = SelectType}},
     Code = 23912) ->
    ExtRewardDataList = [DataId
			 || {DataId, DataType}
				<- endless_data:list_ext_reward(),
			    DataType =:= 5],
    Flag = case lists:sort(ExtRewardDataList -- ExtReward)
	       of
	     [Id | _] ->
		 #{limit_id := LimitId} = endless_data:ext_reward({Id,
								   5}),
		 case MaxId >= LimitId of
		   true -> 1;
		   _ -> 0
		 end;
	     _ -> 0
	   end,
    NewFlag = case Flag of
		0 ->
		    case lists:keyfind(SelectType, #new_endless.type,
				       NewEndLessList)
			of
		      #new_endless{max_id = NewMaxId,
				   ext_reward = NewExtReward} ->
			  ExtRewardDataList1 = [DataId1
						|| {DataId1, DataType1}
						       <- endless_data:list_ext_reward(),
						   DataType1 =:= SelectType],
			  case lists:sort(ExtRewardDataList1 -- NewExtReward) of
			    [Id1 | _] ->
				#{limit_id := LimitId1} =
				    endless_data:ext_reward({Id1, SelectType}),
				case NewMaxId >= LimitId1 of
				  true -> 1;
				  _ -> 0
				end;
			    _ -> 0
			  end;
		      _ -> 0
		    end;
		_ -> 1
	      end,
    sys_conn:pack_send(Code, {NewFlag}),
    ok;
push(Role, Code) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidendless629, _,
       {__Levelendless629, __Tracesendless629}}
	  when __Levelendless629 band 8 /= 0 orelse
		 __Tracesendless629 /= [] ->
	  lager:do_log(error,
		       [{module, endless}, {function, push}, {line, 629},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("协议请求错误玩家~ts id~w 协议号~w",
				     [Role#role.name, Role#role.id, Code]),
		       none, 4096, 8, __Levelendless629, __Tracesendless629,
		       lager_event, __Pidendless629);
      _ -> ok
    end,
    ok.

push(Role, Code = 23913, Type) ->
    NewRankType = get_new_end_less_rank_type(Type),
    {MyNewIdx, NewRankL} = rank_info(NewRankType, Role),
    sys_conn:pack_send(Code, {MyNewIdx, NewRankL}),
    ok;
push(Role, Code, Data) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidendless639, _,
       {__Levelendless639, __Tracesendless639}}
	  when __Levelendless639 band 8 /= 0 orelse
		 __Tracesendless639 /= [] ->
	  lager:do_log(error,
		       [{module, endless}, {function, push}, {line, 639},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("协议请求错误玩家~ts id~w 协议号~w, 数据~w",
				     [Role#role.name, Role#role.id, Code,
				      Data]),
		       none, 4096, 8, __Levelendless639, __Tracesendless639,
		       lager_event, __Pidendless639);
      _ -> ok
    end,
    ok.

-spec get_type() -> pos_integer().

get_type() ->
    StartUnixTime =
	date:datetime_to_seconds(endless_data:get_const(endless_start_date)),
    StartDay = date:day_diff(StartUnixTime, date:unixtime())
		 + 1,
    AllType = endless_data:get_all_type(),
    AllDay = lists:sum(endless_data:get_all_day()),
    NowDay = case StartDay rem AllDay of
	       0 -> AllDay;
	       RemDay -> RemDay
	     end,
    Type = do_get_type(NowDay, AllType, 1, 0),
    Type.

-spec get_new_end_less(pos_integer(), list()) -> list().

get_new_end_less(SelectType, NewEndLessList) ->
    case lists:keyfind(SelectType, #new_endless.type,
		       NewEndLessList)
	of
      NewEndLess = #new_endless{max_id = MaxId} ->
	  BeginId = calc_begin_round(MaxId),
	  NewEndLess1 = NewEndLess#new_endless{day_begin =
						   BeginId,
					       day_pass = 0},
	  NewEndLessList1 = lists:keyreplace(SelectType,
					     #new_endless.type, NewEndLessList,
					     NewEndLess1),
	  NewEndLessList1;
      _ ->
	  BeginId = calc_begin_round(0),
	  NewEndLess = #new_endless{type = SelectType,
				    day_begin = BeginId},
	  NewEndLessList1 = [NewEndLess | NewEndLessList],
	  NewEndLessList1
    end.

get_fight_object([], _Role, _BuffAttrs, L, _PosInfo,
		 PBids, _Type) ->
    {ok, L, PBids};
get_fight_object([{_, _, _, 0} | T], Role, BuffAttrs, L,
		 PosInfo, PBids, Type) ->
    get_fight_object(T, Role, BuffAttrs, L, PosInfo, PBids,
		     Type);
get_fight_object([{Pos, Rid, SrvId, Id} | T],
		 Role = #role{id = RoleId}, BuffAttrs, L, PosInfo, PBids,
		 Type)
    when {Rid, SrvId} =:= RoleId ->
    case [1
	  || {Pos2, Rid2, SrvId2, Id2} <- T, Id2 > 0,
	     Pos =:= Pos2 orelse
	       Id =:= Id2 andalso {Rid2, SrvId2} =:= RoleId]
	of
      [] ->
	  case partner_lib:get_partner(Role, Id) of
	    false ->
		get_fight_object(T, Role, BuffAttrs, L, PosInfo, PBids,
				 Type);
	    #partner{end_time = EndTime} when EndTime =/= 0 ->
		{false,
		 lang:get(<<"Ninja đã được cấp năng không thể tham "
			    "gia Vùng đất thử nghiệm"/utf8>>)};
	    Partner = #partner{bid = Bid, camp_type = CampType} ->
		Flag = case judge_type(CampType, Type) of
			 ok ->
			     case endless_data:get_limit_partner_list(Type) of
			       BidList when is_list(BidList) ->
				   case lists:member(Bid, BidList) of
				     true -> false;
				     _ -> ok
				   end;
			       _ -> ok
			     end;
			 _ -> false
		       end,
		case Flag of
		  ok ->
		      case lists:member(Bid, PBids) of
			false ->
			    FO1 = partner_lib:gen_fight_object(Role, Partner,
							       combat_lib:is_leader(Pos)),
			    #partner_base_data{rare_type = Quality} =
				partner_data:get_base(Bid),
			    #formation_fight_info{fight_pos = FightPos} =
				lists:keyfind(Pos, #formation_fight_info.pos,
					      PosInfo),
			    get_fight_object(T, Role, BuffAttrs,
					     [FO1#fight_object{pos = FightPos,
							       quality =
								   Quality}
					      | L],
					     PosInfo, [Bid | PBids], Type);
			_ ->
			    {false,
			     lang:get(<<"Không thể triển khai các ninja trùng "
					"lặp"/utf8>>)}
		      end;
		  _ ->
		      {false,
		       lang:get(<<"Một ninja không đáp ứng được các yêu "
				  "cầu đã được triển khai"/utf8>>)}
		end
	  end;
      _ ->
	  {false,
	   lang:get(<<"Không thể triển khai các ninja trùng "
		      "lặp"/utf8>>)}
    end;
get_fight_object([{Pos, Rid, SrvId, Id} | T],
		 Role = #role{lev = RoleLev, id = RoleId,
			      m_endless = #m_endless{employ = EmployL}},
		 BuffAttrs, L, PosInfo, PBids, Type)
    when {Rid, SrvId} =:= {0, <<>>} ->
    case [1
	  || {Pos2, Rid2, SrvId2, Id2} <- T, Id2 > 0,
	     Pos =:= Pos2 orelse
	       Id =:= Id2 andalso {Rid2, SrvId2} =:= {0, <<>>}]
	of
      [] ->
	  case lists:keyfind({{Rid, SrvId}, Id}, 1, EmployL) of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidendless731, _,
		   {__Levelendless731, __Tracesendless731}}
		      when __Levelendless731 band 8 /= 0 orelse
			     __Tracesendless731 /= [] ->
		      lager:do_log(error,
				   [{module, endless},
				    {function, get_fight_object}, {line, 731},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~w的支援英雄 {~w, ~w} ~w 不存在了1",
						 [RoleId, Rid, SrvId, Id]),
				   none, 4096, 8, __Levelendless731,
				   __Tracesendless731, lager_event,
				   __Pidendless731);
		  _ -> ok
		end,
		{false,
		 lang:get(<<"Anh hùng hỗ trợ không tồn tại"/utf8>>)};
	    {_, _RName, Bid, PLev, Star, Quality, _BreakLev, _Power,
	     _Ext} ->
		#partner_base_data{camp_type = CampType} =
		    partner_data:get_base(Bid),
		Flag = case judge_type(CampType, Type) of
			 ok ->
			     case endless_data:get_limit_partner_list(Type) of
			       BidList when is_list(BidList) ->
				   case lists:member(Bid, BidList) of
				     true -> false;
				     _ -> ok
				   end;
			       _ -> ok
			     end;
			 _ -> false
		       end,
		case Flag of
		  ok ->
		      case lists:member(Bid, PBids) of
			false ->
			    Fun = fun (#fight_object{master_id = MasterId})
					  when MasterId =/= RoleId ->
					  true;
				      (_) -> false
				  end,
			    case lists:any(Fun, L) of
			      false ->
				  case endless_data:get_robot(Id) of
				    #endless_robot_data{unit_id = UnitId} ->
					#formation_fight_info{fight_pos =
								  FightPos} =
					    lists:keyfind(Pos,
							  #formation_fight_info.pos,
							  PosInfo),
					FO =
					    unit_monster:to_fight_object(RoleLev,
									 FightPos,
									 UnitId),
					FO1 = FO#fight_object{master_id =
								  RoleId,
							      object_id = Id,
							      object_bid = Bid,
							      object_type = 2,
							      star = Star,
							      lev = PLev,
							      quality =
								  Quality},
					get_fight_object(T, Role, BuffAttrs,
							 [FO1 | L], PosInfo,
							 PBids, Type);
				    _ ->
					case {whereis(lager_event),
					      whereis(lager_event),
					      lager_config:get({lager_event,
								loglevel},
							       {0, []})}
					    of
					  {undefined, undefined, _} ->
					      fun () ->
						      {error, lager_not_running}
					      end();
					  {undefined, _, _} ->
					      fun () ->
						      {error,
						       {sink_not_configured,
							lager_event}}
					      end();
					  {__Pidendless768, _,
					   {__Levelendless768,
					    __Tracesendless768}}
					      when __Levelendless768 band 8 /= 0
						     orelse
						     __Tracesendless768 /= [] ->
					      lager:do_log(error,
							   [{module, endless},
							    {function,
							     get_fight_object},
							    {line, 768},
							    {pid,
							     pid_to_list(self())},
							    {node, node()}
							    | lager:md()],
							   io_lib:format("~w的支援英雄 {~w, ~w} ~w 不存在了2",
									 [RoleId,
									  Rid,
									  SrvId,
									  Id]),
							   none, 4096, 8,
							   __Levelendless768,
							   __Tracesendless768,
							   lager_event,
							   __Pidendless768);
					  _ -> ok
					end,
					{false,
					 lang:get(<<"Anh hùng hỗ trợ không tồn tại"/utf8>>)}
				  end;
			      _ ->
				  {false,
				   lang:get(<<"Chỉ có thể triển khai một anh hùng hỗ "
					      "trợ tại một thời điểm"/utf8>>)}
			    end;
			_ ->
			    {false,
			     lang:get(<<"Không thể triển khai các anh hùng trùng "
					"lặp"/utf8>>)}
		      end;
		  _ ->
		      {false,
		       lang:get(<<"Một anh hùng không đáp ứng được các "
				  "yêu cầu đã được triển khai"/utf8>>)}
		end
	  end;
      _ ->
	  {false,
	   lang:get(<<"Không thể triển khai các anh hùng trùng "
		      "lặp"/utf8>>)}
    end;
get_fight_object([{Pos, Rid, SrvId, Id} | T],
		 Role = #role{id = RoleId,
			      partner_bag =
				  #partner_bag{partner_list = PartnerList},
			      m_endless = #m_endless{employ = EmployL}},
		 BuffAttrs, L, PosInfo, PBids, Type) ->
    case [1
	  || {Pos2, Rid2, SrvId2, Id2} <- T, Id2 > 0,
	     Pos =:= Pos2 orelse
	       {Rid, SrvId, Id} =:= {Rid2, SrvId2, Id2}]
	of
      [] ->
	  case lists:keyfind({{Rid, SrvId}, Id}, 1, EmployL) of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidendless790, _,
		   {__Levelendless790, __Tracesendless790}}
		      when __Levelendless790 band 8 /= 0 orelse
			     __Tracesendless790 /= [] ->
		      lager:do_log(error,
				   [{module, endless},
				    {function, get_fight_object}, {line, 790},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~w的支援英雄 {~w, ~w} ~w 不存在了3",
						 [RoleId, Rid, SrvId, Id]),
				   none, 4096, 8, __Levelendless790,
				   __Tracesendless790, lager_event,
				   __Pidendless790);
		  _ -> ok
		end,
		{false,
		 lang:get(<<"Anh hùng hỗ trợ không tồn tại"/utf8>>)};
	    {_, RName, Bid, PLev, Star, _Quality, BreakLev, Power,
	     Ext} ->
		#partner_base_data{camp_type = CampType} =
		    partner_data:get_base(Bid),
		Flag = case judge_type(CampType, Type) of
			 ok ->
			     case endless_data:get_limit_partner_list(Type) of
			       BidList when is_list(BidList) ->
				   case lists:member(Bid, BidList) of
				     true -> false;
				     _ -> ok
				   end;
			       _ -> ok
			     end;
			 _ -> false
		       end,
		Flag1 = case Type of
			  5 -> Flag;
			  _ when Flag =:= false -> Flag;
			  _ ->
			      case get_same_camp_partner(PartnerList, CampType)
				  of
				[] -> false;
				NewPartnerList ->
				    #partner{power = PowerT} =
					list_util:keymax(NewPartnerList,
							 #partner.power),
				    case Power =< PowerT * 1.2 of
				      true -> ok;
				      _ -> false
				    end
			      end
			end,
		case Flag1 of
		  ok ->
		      case lists:member(Bid, PBids) of
			false ->
			    Fun = fun (#fight_object{master_id = MasterId})
					  when MasterId =/= RoleId ->
					  true;
				      (_) -> false
				  end,
			    case lists:any(Fun, L) of
			      false ->
				  Partner = case role_robot:get_partner({Rid,
									 SrvId},
									Id)
						of
					      {ok, P2 = #partner{}} -> P2;
					      _ ->
						  case {whereis(lager_event),
							whereis(lager_event),
							lager_config:get({lager_event,
									  loglevel},
									 {0,
									  []})}
						      of
						    {undefined, undefined, _} ->
							fun () ->
								{error,
								 lager_not_running}
							end();
						    {undefined, _, _} ->
							fun () ->
								{error,
								 {sink_not_configured,
								  lager_event}}
							end();
						    {__Pidendless844, _,
						     {__Levelendless844,
						      __Tracesendless844}}
							when __Levelendless844
							       band 64
							       /= 0
							       orelse
							       __Tracesendless844
								 /= [] ->
							lager:do_log(info,
								     [{module,
								       endless},
								      {function,
								       get_fight_object},
								      {line,
								       844},
								      {pid,
								       pid_to_list(self())},
								      {node,
								       node()}
								      | lager:md()],
								     io_lib:format("玩家[~ts]英雄已不存在:~w",
										   [RName,
										    Bid]),
								     none, 4096,
								     64,
								     __Levelendless844,
								     __Tracesendless844,
								     lager_event,
								     __Pidendless844);
						    _ -> ok
						  end,
						  BaseData =
						      #partner_base_data{} =
							  partner_data:get_base(Bid),
						  P0 =
						      partner:init_partner(Role,
									   BaseData,
									   Id,
									   PLev,
									   Star),
						  UseSkin = list_util:keyfind(5,
									      Ext,
									      0),
						  partner_lib:calc_attr(Role,
									P0#partner{break_lev
										       =
										       BreakLev,
										   power
										       =
										       Power,
										   use_skin
										       =
										       UseSkin})
					    end,
				  FO1 = partner_lib:gen_fight_object({Rid,
								      SrvId},
								     self(),
								     Partner,
								     combat_lib:is_leader(Pos),
								     {Rid,
								      SrvId},
								     0),
				  #formation_fight_info{fight_pos = FightPos} =
				      lists:keyfind(Pos,
						    #formation_fight_info.pos,
						    PosInfo),
				  get_fight_object(T, Role, BuffAttrs,
						   [FO1#fight_object{pos =
									 FightPos}
						    | L],
						   PosInfo, PBids, Type);
			      _ ->
				  {false,
				   lang:get(<<"Chỉ có thể triển khai một anh hùng hỗ "
					      "trợ tại một thời điểm"/utf8>>)}
			    end;
			_ ->
			    {false,
			     lang:get(<<"Không thể triển khai các anh hùng trùng "
					"lặp"/utf8>>)}
		      end;
		  _ ->
		      {false,
		       lang:get(<<"Một anh hùng không đáp ứng được các "
				  "yêu cầu đã được triển khai"/utf8>>)}
		end
	  end;
      _ ->
	  {false,
	   lang:get(<<"Không thể triển khai các anh hùng trùng "
		      "lặp"/utf8>>)}
    end.

gen_monster_object(Round, Type) ->
    #endless_data{lev = ULev, unit_ids = [UnitId],
		  name = TarName, formation = EndLessFormation} =
	endless_data:get({Type, Round}),
    #unit_data{formation = UnitFormation} =
	unit_data:get(UnitId),
    {BFormationType, BFormationLev} =
	util:if_true(EndLessFormation =:= undefined,
		     UnitFormation, EndLessFormation),
    case unit_monster:gen_fight_objects(ULev, UnitId,
					BFormationType, BFormationLev)
	of
      [] ->
	  {false, lang:get(<<"Vấn đề cấu hình quái vật"/utf8>>)};
      [DefendList1 | _] ->
	  DefendList = [DFO#fight_object{lev = ULev}
			|| DFO = #fight_object{} <- DefendList1],
	  {DefendList, BFormationType, BFormationLev, TarName}
    end.

check_can_combat([lev | Other],
		 Role = #role{lev = Lev,
			      m_endless = #m_endless{max_id = MaxId}},
		 Cache = #{type := Type}) ->
    OpenCond = endless_data:get_const(open_lev),
    case Type of
      5 ->
	  case role_misc:check_open_cond(OpenCond, Role) of
	    {false, Msg} -> {false, Msg};
	    _ -> check_can_combat(Other, Role, Cache)
	  end;
      _ ->
	  NewMaxIdLimit =
	      endless_data:get_const(endless_new_limit),
	  NewLimitLev =
	      endless_data:get_const(endless_new_limit_lev),
	  case MaxId >= NewMaxIdLimit of
	    true ->
		case Lev >= NewLimitLev of
		  true -> check_can_combat(Other, Role, Cache);
		  _ ->
		      {false,
		       lang:get(<<"Thử thách bắt đầu sau cấp độ 90"/utf8>>)}
		end;
	    _ ->
		{false,
		 lang:get(<<"Mở khóa sau khi vượt qua cấp độ 200 "
			    "của Vùng đất thử nghiệm"/utf8>>)}
	  end
    end;
check_can_combat([formation | Other],
		 Role = #role{m_formation = #m_formation{list = List}},
		 Cache = #{formation := FormationType}) ->
    case lists:member(FormationType, List) of
      false ->
	  {false,
	   lang:get(<<"Mảng liên quan không tồn tại hoặc không "
		      "được kích hoạt"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([gen_fight | Other], Role,
		 Cache = #{formation := FormationType,
			   pos_info := PosInfo, type := Type}) ->
    FightPos = formation_lib:gen_fight_pos(PosInfo,
					   FormationType),
    FormationLev = formation_lib:get_formation_lev(Role,
						   FormationType),
    case get_fight_object(PosInfo, Role, [], [], FightPos,
			  [], Type)
	of
      {false, Msg} -> {false, Msg};
      {ok, [], _} ->
	  {false, lang:get(<<"Ít nhất một anh hùng"/utf8>>)};
      {ok, AtkGroup, PBids} ->
	  check_can_combat(Other, Role,
			   Cache#{atk_group => AtkGroup,
				  formation_lev => FormationLev,
				  p_bids => PBids});
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidendless923, _,
	     {__Levelendless923, __Tracesendless923}}
		when __Levelendless923 band 8 /= 0 orelse
		       __Tracesendless923 /= [] ->
		lager:do_log(error,
			     [{module, endless}, {function, check_can_combat},
			      {line, 923}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "无尽试炼生成英雄失败", none, 4096, 8, __Levelendless923,
			     __Tracesendless923, lager_event, __Pidendless923);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Sinh ra anh hùng không thành công"/utf8>>)}
    end;
check_can_combat([is_employ | Other],
		 Role = #role{id = RoleId},
		 Cache = #{pos_info := PosInfo}) ->
    case [1
	  || {_Pos, Rid, SrvId, _Id} <- PosInfo,
	     {Rid, SrvId} =/= RoleId]
	of
      [] ->
	  check_can_combat(Other, Role, Cache#{is_employ => 0});
      _ ->
	  check_can_combat(Other, Role, Cache#{is_employ => 1})
    end;
check_can_combat([type | Other],
		 Role = #role{m_endless =
				  #m_endless{day_begin = BeginId,
					     new_endless_list = NewEndLessList,
					     type = RoleType,
					     select_type = SelectType}},
		 Cache = #{type := Type}) ->
    case RoleType of
      0 when Type =:= 5 ->
	  check_can_combat(Other, Role,
			   Cache#{beginId => BeginId});
      0 ->
	  case Type =:= SelectType of
	    true ->
		case lists:keyfind(Type, #new_endless.type,
				   NewEndLessList)
		    of
		  #new_endless{day_begin = NewDayBegin} ->
		      check_can_combat(Other, Role,
				       Cache#{beginId => NewDayBegin});
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
			{__Pidendless949, _,
			 {__Levelendless949, __Tracesendless949}}
			    when __Levelendless949 band 8 /= 0 orelse
				   __Tracesendless949 /= [] ->
			    lager:do_log(error,
					 [{module, endless},
					  {function, check_can_combat},
					  {line, 949},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("挑战新无尽玩家:~ts数据异常 id:~w, type:~w, 无尽列表~w",
						       [Role#role.name,
							Role#role.id, Type,
							NewEndLessList]),
					 none, 4096, 8, __Levelendless949,
					 __Tracesendless949, lager_event,
					 __Pidendless949);
			_ -> ok
		      end,
		      {false,
		       lang:get(<<"Dữ liệu người chơi bất thường"/utf8>>)}
		end;
	    _ ->
		{false,
		 lang:get(<<"Loại thử thách này hiện không khả dụng"/utf8>>)}
	  end;
      5 when Type =:= 5 ->
	  check_can_combat(Other, Role,
			   Cache#{beginId => BeginId});
      5 ->
	  {false,
	   lang:get(<<"Loại thử thách này hiện không khả dụng"/utf8>>)};
      Type ->
	  case Type =:= SelectType of
	    true ->
		case lists:keyfind(Type, #new_endless.type,
				   NewEndLessList)
		    of
		  #new_endless{day_begin = NewDayBegin} ->
		      check_can_combat(Other, Role,
				       Cache#{beginId => NewDayBegin});
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
			{__Pidendless970, _,
			 {__Levelendless970, __Tracesendless970}}
			    when __Levelendless970 band 8 /= 0 orelse
				   __Tracesendless970 /= [] ->
			    lager:do_log(error,
					 [{module, endless},
					  {function, check_can_combat},
					  {line, 970},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("挑战新无尽玩家:~ts数据异常 id:~w, type:~w, 无尽列表~w",
						       [Role#role.name,
							Role#role.id, Type,
							NewEndLessList]),
					 none, 4096, 8, __Levelendless970,
					 __Tracesendless970, lager_event,
					 __Pidendless970);
			_ -> ok
		      end,
		      {false,
		       lang:get(<<"Dữ liệu người chơi bất thường"/utf8>>)}
		end;
	    _ ->
		{false,
		 lang:get(<<"Loại thử thách này hiện không khả dụng"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Loại thử thách này hiện không khả dụng"/utf8>>)}
    end;
check_can_combat([unit | Other], Role,
		 Cache = #{type := Type, beginId := BeginId}) ->
    case endless_data:get({Type, BeginId}) of
      #endless_data{unit_ids = [UnitId]} ->
	  check_can_combat(Other, Role,
			   Cache#{unit_id => UnitId});
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidendless985, _,
	     {__Levelendless985, __Tracesendless985}}
		when __Levelendless985 band 8 /= 0 orelse
		       __Tracesendless985 /= [] ->
		lager:do_log(error,
			     [{module, endless}, {function, check_can_combat},
			      {line, 985}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]发起了类型~w[~w]关的无尽试炼",
					   [Role#role.name, Type, BeginId]),
			     none, 4096, 8, __Levelendless985,
			     __Tracesendless985, lager_event, __Pidendless985);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Không thể bắt đầu trận chiến Endless "
		      "Trial"/utf8>>)}
    end;
check_can_combat([total_wave | Other], Role,
		 Cache = #{type := Type, beginId := BeginId}) ->
    case Type of
      5 ->
	  TotalWave = endless_data:get_const(max_roundnum) -
			BeginId
			+ 1,
	  check_can_combat(Other, Role,
			   Cache#{total_wave => TotalWave});
      _ ->
	  TotalWave = endless_data:get_const(new_max_roundnum) -
			BeginId
			+ 1,
	  check_can_combat(Other, Role,
			   Cache#{total_wave => TotalWave})
    end;
check_can_combat([], _Role,
		 #{atk_group := AtkGroup, formation_lev := FormationLev,
		   p_bids := PBids, unit_id := UnitId,
		   total_wave := TotalWave, beginId := BeginId}) ->
    {AtkGroup, FormationLev, PBids, UnitId, TotalWave,
     BeginId}.

calc_begin_round(MaxId) ->
    max(1, MaxId - endless_data:get_const(backoff_num)).

calc_day_reward(DayId, PassId, DayReward, Type) ->
    Fun = fun (Id, {Acc, DayAcc}) ->
		  case Id =< 0 orelse
			 length(DayAcc) >=
			   endless_data:get_const(dayreward_roundnum)
			   orelse lists:member(Id, DayReward)
		      of
		    true -> {Acc, DayAcc};
		    _ ->
			R = endless_data:day_reward({Id, Type}),
			{item_lib:merge(R, Acc), [Id | DayAcc]}
		  end
	  end,
    {DayItems, NewDayReward} = lists:foldr(Fun,
					   {[], DayReward},
					   lists:seq(DayId, PassId)),
    RestRound = util:if_true(length(NewDayReward) =<
			       endless_data:get_const(dayreward_roundnum),
			     endless_data:get_const(dayreward_roundnum) -
			       length(NewDayReward),
			     0),
    MaxRewardRound = case Type of
		       5 ->
			   min(DayId +
				 endless_data:get_const(dayreward_roundnum)
				 - 1,
			       endless_data:get_const(max_roundnum));
		       _ ->
			   min(DayId +
				 endless_data:get_const(dayreward_roundnum)
				 - 1,
			       endless_data:get_const(new_max_roundnum))
		     end,
    RestRewardRound = max(MaxRewardRound - RestRound -
			    PassId
			    + 1,
			  0),
    {DayItems, NewDayReward, RestRewardRound,
     MaxRewardRound}.

rank_info(0, _Role) -> {0, []};
rank_info(Type, Role = #role{id = Rid}) ->
    RankList = rank:list(Type),
    {ok, Acc} = case rank:check_rank_cond_endless(Role) of
		  ok -> do_rank_info(Type, RankList, 3, []);
		  _ -> {ok, []}
		end,
    MyIdx = rank:idx(Type, Rid, RankList),
    {MyIdx, Acc}.

do_rank_info(_Type, _RankList, Num, Acc)
    when Num =< 0 ->
    {ok, Acc};
do_rank_info(Type, RankList, Num, Acc) ->
    case rank:rank(Type, Num, RankList) of
      {ok,
       #rank_rc{name = Name, rid = FstRid, srv_id = FstSrvId,
		val1 = Val}} ->
	  NewAcc = [{Num, Name, FstRid, FstSrvId, Val} | Acc],
	  do_rank_info(Type, RankList, Num - 1, NewAcc);
      _Other -> do_rank_info(Type, RankList, Num - 1, Acc)
    end.

cli_partner_status([], Acc) -> Acc;
cli_partner_status([#fight_object{object_type = 4}
		    | Rest],
		   Acc) ->
    cli_partner_status(Rest, Acc);
cli_partner_status([#fight_object{object_type = 5}
		    | Rest],
		   Acc) ->
    cli_partner_status(Rest, Acc);
cli_partner_status([#fight_object{master_id =
				      {RId, SrvId},
				  pos = Pos, object_id = PId, hp = Hp,
				  hp_max = HpMax, object_bid = PBid, lev = Lev,
				  star = Star, extra_data = ExtraAata}
		    | Rest],
		   Acc) ->
    UseSkin = list_util:keyfind(5, ExtraAata, 0),
    ResnateLev = list_util:keyfind(11, ExtraAata, 0),
    NAcc = [{RId, SrvId, Pos, PId, PBid, Lev, Star, 1,
	     util:ceil(Hp * 100 / HpMax), UseSkin, ResnateLev}
	    | Acc],
    cli_partner_status(Rest, NAcc).

pass_round_buff() ->
    BuffRest = combat_dict:get_var(buff_rest_round, []),
    Fun = fun ({Id, RestRound}, Acc) ->
		  case RestRound - 1 > 0 of
		    true -> [{Id, RestRound - 1} | Acc];
		    _ ->
			lists:map(fun (Pos) ->
					  #{skill_id := SkillId} =
					      endless_data:get_buff(Id),
					  OldSkill =
					      combat_dict:get_passive_skills(Pos),
					  NSkill = lists:keydelete(SkillId,
								   #skill_data.bid,
								   OldSkill),
					  combat_dict:set_passive_skills(Pos,
									 NSkill)
				  end,
				  combat_dict:all_a()),
			Acc
		  end
	  end,
    NewBuffRest = lists:foldl(Fun, [], BuffRest),
    combat_dict:set_var(buff_rest_round, NewBuffRest),
    ok.

rand_buff_list() -> do_group_buff_rand([1, 2, 3], []).

do_group_buff_rand([], L) -> L;
do_group_buff_rand([GroupId | Rest], L) ->
    BuffCfgs = endless_data:buff_type(GroupId),
    NBuffCfgs = [BuffData
		 || BuffData = #{condition := Cond} <- BuffCfgs,
		    check_buff_cond(Cond)],
    [#{id := BuffId}] = util:rand_list_n(NBuffCfgs, weight,
					 1),
    do_group_buff_rand(Rest, [{GroupId, BuffId} | L]).

check_buff_cond({dead_partner, DeadCond}) ->
    case [1
	  || Pos <- combat_dict:all_a(), combat_util:is_dead(Pos)]
	of
      List when is_list(List) ->
	  DeadNum = length(List), DeadNum >= DeadCond;
      _ -> false
    end;
check_buff_cond(_) -> true.

send_friend_point([], Role) -> Role;
send_friend_point([{_Pos, Rid, SrvId, Id} | Rest],
		  Role = #role{m_endless = #m_endless{employ = EmployL},
			       id = RoleId})
    when Rid > 0 andalso {Rid, SrvId} =/= RoleId ->
    Key = {{Rid, SrvId}, Id},
    case lists:keyfind(Key, 1, EmployL) of
      false -> send_friend_point(Rest, Role);
      _ ->
	  RoleIds = var:get_var(Role, day, 149, []),
	  case lists:member(Key, RoleIds) of
	    true -> send_friend_point(Rest, Role);
	    _ ->
		case ets:lookup(endless_employ_point, Key) of
		  [{_, Num}] ->
		      case Num < endless_data:get_const(support_reward_limit)
			  of
			true ->
			    send_friend_point_mail({Rid, SrvId}),
			    endless_mgr:update_data({Key, Num + 1}, point),
			    var:set_var(Role, day, 149, [Key | RoleIds]);
			_ -> Role
		      end;
		  _ ->
		      send_friend_point_mail({Rid, SrvId}),
		      endless_mgr:update_data({Key, 1}, point),
		      var:set_var(Role, day, 149, [Key | RoleIds])
		end
	  end
    end;
send_friend_point([_ | Rest], Role) ->
    send_friend_point(Rest, Role).

send_friend_point_mail(Rid) ->
    mail:send(Rid,
	      {lang:get(<<"Phần thưởng hỗ trợ"/utf8>>),
	       lang:get(<<"Nhẫn Giả thân mến, những người chơi "
			  "khác đã đề cử anh hùng hỗ trợ của bạn "
			  "tham gia Thử thách vô tận! Tặng bạn "
			  "điểm tình bạn như một lời cảm ơn！"/utf8>>),
	       [{14, endless_data:get_const(support_reward)}], [],
	       <<"无尽试炼"/utf8>>}).

get_next_type() ->
    StartUnixTime =
	date:datetime_to_seconds(endless_data:get_const(endless_start_date)),
    StartDay = date:day_diff(StartUnixTime, date:unixtime())
		 + 1,
    AllType = endless_data:get_all_type(),
    AllDay = lists:sum(endless_data:get_all_day()),
    NowDay = case StartDay rem AllDay of
	       0 -> AllDay;
	       RemDay -> RemDay
	     end,
    {NextType, LastTime} = do_get_next_type(NowDay, AllType,
					    1, 0),
    {NextType, LastTime}.

do_get_next_type(NowDay, AllType, Id, OldDays) ->
    case lists:keyfind(Id, 1, AllType) of
      {Id, _Type, DataDay} ->
	  NowDays = DataDay + OldDays,
	  case NowDays >= NowDay of
	    true ->
		LastTime = (NowDays - NowDay) * 86400 +
			     date:next_diff(0, 0, 0),
		case lists:keyfind(Id + 1, 1, AllType) of
		  {_, NextType, _} -> {NextType, LastTime};
		  _ ->
		      case lists:keyfind(1, 1, AllType) of
			{_, NextType, _} -> {NextType, LastTime};
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
			      {__Pidendless1185, _,
			       {__Levelendless1185, __Tracesendless1185}}
				  when __Levelendless1185 band 8 /= 0 orelse
					 __Tracesendless1185 /= [] ->
				  lager:do_log(error,
					       [{module, endless},
						{function, do_get_next_type},
						{line, 1185},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("无尽试炼下一类型匹配失败~w 全部类型~w",
							     [1, AllType]),
					       none, 4096, 8,
					       __Levelendless1185,
					       __Tracesendless1185, lager_event,
					       __Pidendless1185);
			      _ -> ok
			    end,
			    {0, 0}
		      end
		end;
	    _ -> do_get_next_type(NowDay, AllType, Id + 1, NowDays)
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
	    {__Pidendless1193, _,
	     {__Levelendless1193, __Tracesendless1193}}
		when __Levelendless1193 band 8 /= 0 orelse
		       __Tracesendless1193 /= [] ->
		lager:do_log(error,
			     [{module, endless}, {function, do_get_next_type},
			      {line, 1193}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("无尽试炼新类型匹配失败~w 全部类型~w",
					   [Id, AllType]),
			     none, 4096, 8, __Levelendless1193,
			     __Tracesendless1193, lager_event,
			     __Pidendless1193);
	    _ -> ok
	  end,
	  {0, 0}
    end.

do_get_type(NowDay, AllType, Id, OldDays) ->
    case lists:keyfind(Id, 1, AllType) of
      {Id, Type, DataDay} ->
	  NowDays = DataDay + OldDays,
	  case NowDays >= NowDay of
	    true -> Type;
	    _ -> do_get_type(NowDay, AllType, Id + 1, NowDays)
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
	    {__Pidendless1209, _,
	     {__Levelendless1209, __Tracesendless1209}}
		when __Levelendless1209 band 8 /= 0 orelse
		       __Tracesendless1209 /= [] ->
		lager:do_log(error,
			     [{module, endless}, {function, do_get_type},
			      {line, 1209}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("无尽试炼新类型匹配失败~w 全部类型~w",
					   [Id, AllType]),
			     none, 4096, 8, __Levelendless1209,
			     __Tracesendless1209, lager_event,
			     __Pidendless1209);
	    _ -> ok
	  end,
	  0
    end.

get_new_end_less_rank_type(1) -> 52;
get_new_end_less_rank_type(2) -> 53;
get_new_end_less_rank_type(3) -> 54;
get_new_end_less_rank_type(4) -> 55;
get_new_end_less_rank_type(5) -> 18;
get_new_end_less_rank_type(_Type) -> 0.

fire_trigger(1, NewMaxId, Role) ->
    role_trigger:fire([#evt_endless_pass_water{round =
						   NewMaxId},
		       #r_evt_endless_pass_water{round = NewMaxId}],
		      Role);
fire_trigger(2, NewMaxId, Role) ->
    role_trigger:fire([#evt_endless_pass_fire{round =
						  NewMaxId},
		       #r_evt_endless_pass_fire{round = NewMaxId}],
		      Role);
fire_trigger(3, NewMaxId, Role) ->
    role_trigger:fire([#evt_endless_pass_wind{round =
						  NewMaxId},
		       #r_evt_endless_pass_wind{round = NewMaxId}],
		      Role);
fire_trigger(4, NewMaxId, Role) ->
    role_trigger:fire([#evt_endless_pass_light_dark{round =
							NewMaxId},
		       #r_evt_endless_pass_light_dark{round = NewMaxId}],
		      Role);
fire_trigger(5, NewMaxId, Role) ->
    role_trigger:fire([#evt_endless_pass{round = NewMaxId},
		       #r_evt_endless_pass{round = NewMaxId}],
		      Role);
fire_trigger(Type, _NewMaxId, Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidendless1239, _,
       {__Levelendless1239, __Tracesendless1239}}
	  when __Levelendless1239 band 8 /= 0 orelse
		 __Tracesendless1239 /= [] ->
	  lager:do_log(error,
		       [{module, endless}, {function, fire_trigger},
			{line, 1239}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("玩家~ts id~w触发无尽任务类型失败 类型~w",
				     [Role#role.name, Role#role.id, Type]),
		       none, 4096, 8, __Levelendless1239, __Tracesendless1239,
		       lager_event, __Pidendless1239);
      _ -> ok
    end,
    Role.

set_new_max_id(MEndless = #m_endless{max_id = MaxId,
				     new_endless_list = NewEndLessList},
	       Type, CurrentRound, Name, Id) ->
    case Type of
      5 ->
	  MaxId1 = max(CurrentRound, MaxId),
	  {MaxId1, MEndless#m_endless{max_id = MaxId1}};
      _ ->
	  case lists:keyfind(Type, #new_endless.type,
			     NewEndLessList)
	      of
	    NewEndLess = #new_endless{max_id = NewMaxId} ->
		NewMaxId1 = max(CurrentRound, NewMaxId),
		NewNewEndLess = NewEndLess#new_endless{max_id =
							   NewMaxId1},
		NewNewEndLessList = lists:keyreplace(Type,
						     #new_endless.type,
						     NewEndLessList,
						     NewNewEndLess),
		{NewMaxId1,
		 MEndless#m_endless{new_endless_list =
					NewNewEndLessList}};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidendless1256, _,
		   {__Levelendless1256, __Tracesendless1256}}
		      when __Levelendless1256 band 8 /= 0 orelse
			     __Tracesendless1256 /= [] ->
		      lager:do_log(error,
				   [{module, endless},
				    {function, set_new_max_id}, {line, 1256},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("玩家~ts id~w无尽回合结束类型读取失败type~w,无尽列表~w",
						 [Name, Id, Type,
						  NewEndLessList]),
				   none, 4096, 8, __Levelendless1256,
				   __Tracesendless1256, lager_event,
				   __Pidendless1256);
		  _ -> ok
		end,
		{0, MEndless}
	  end
    end.

set_endless(Role = #role{m_endless =
			     MEndLess = #m_endless{max_id = MaxId,
						   day_pass = DayPass}},
	    5, PassId, CurrentWave, NewDayReward,
	    StartCombatTime) ->
    NewMaxId = max(MaxId, PassId),
    NewDayPass = util:if_true(CurrentWave > DayPass,
			      CurrentWave, DayPass),
    case date:is_same_day(date:unixtime(), StartCombatTime)
	of
      true ->
	  {Role#role{m_endless =
			 MEndLess#m_endless{max_id = NewMaxId,
					    day_reward = NewDayReward,
					    employ = [],
					    day_pass = NewDayPass}},
	   NewMaxId};
      _ ->
	  {Role#role{m_endless =
			 MEndLess#m_endless{max_id = NewMaxId, employ = []}},
	   NewMaxId}
    end;
set_endless(Role = #role{m_endless =
			     MEndLess = #m_endless{new_endless_list =
						       NewEndLessList}},
	    Type, PassId, CurrentWave, NewDayReward,
	    StartCombatTime) ->
    NewEndLess = #new_endless{max_id = MaxId,
			      day_pass = DayPass} =
		     lists:keyfind(Type, #new_endless.type, NewEndLessList),
    NewMaxId = max(MaxId, PassId),
    NewDayPass = util:if_true(CurrentWave > DayPass,
			      CurrentWave, DayPass),
    case date:is_same_day(date:unixtime(), StartCombatTime)
	of
      true ->
	  NewNewEndLess = NewEndLess#new_endless{max_id =
						     NewMaxId,
						 day_pass = NewDayPass},
	  NewNewEndLessList = lists:keyreplace(Type,
					       #new_endless.type,
					       NewEndLessList, NewNewEndLess),
	  {Role#role{m_endless =
			 MEndLess#m_endless{day_reward = NewDayReward,
					    employ = [],
					    new_endless_list =
						NewNewEndLessList}},
	   NewMaxId};
      _ ->
	  NewNewEndLess = NewEndLess#new_endless{max_id =
						     NewMaxId},
	  NewNewEndLessList = lists:keyreplace(Type,
					       #new_endless.type,
					       NewEndLessList, NewNewEndLess),
	  {Role#role{m_endless =
			 MEndLess#m_endless{employ = [],
					    new_endless_list =
						NewNewEndLessList}},
	   NewMaxId}
    end.

combat_over_rank(NRole, 1) ->
    rank_listener:handle(endless_water_round, NRole, 1);
combat_over_rank(NRole, 2) ->
    rank_listener:handle(endless_fire_round, NRole, 1);
combat_over_rank(NRole, 3) ->
    rank_listener:handle(endless_wind_round, NRole, 1);
combat_over_rank(NRole, 4) ->
    rank_listener:handle(endless_light_dark_round, NRole,
			 1);
combat_over_rank(NRole, 5) ->
    rank_listener:handle(endless_round, NRole, 1);
combat_over_rank(NRole, Type) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidendless1305, _,
       {__Levelendless1305, __Tracesendless1305}}
	  when __Levelendless1305 band 8 /= 0 orelse
		 __Tracesendless1305 /= [] ->
	  lager:do_log(error,
		       [{module, endless}, {function, combat_over_rank},
			{line, 1305}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("新无尽战斗结束上排行榜失败玩家:~ts id:~w, 类型~w",
				     [NRole#role.name, NRole#role.id, Type]),
		       none, 4096, 8, __Levelendless1305, __Tracesendless1305,
		       lager_event, __Pidendless1305);
      _ -> ok
    end,
    ok.

get_sys_information_type(1) -> 34;
get_sys_information_type(2) -> 35;
get_sys_information_type(3) -> 36;
get_sys_information_type(4) -> 37;
get_sys_information_type(_) -> 7.

get_log_type(1) -> <<"水系无尽试炼"/utf8>>;
get_log_type(2) -> <<"火系无尽试炼"/utf8>>;
get_log_type(3) -> <<"风系无尽试炼"/utf8>>;
get_log_type(4) -> <<"光暗无尽试炼"/utf8>>;
get_log_type(_) -> <<"无尽试炼"/utf8>>.

log_join(NRole, 1) ->
    log:save(join,
	     {NRole, <<"新版无尽"/utf8>>, <<"参与水系试炼"/utf8>>});
log_join(NRole, 2) ->
    log:save(join,
	     {NRole, <<"新版无尽"/utf8>>, <<"参与火系试炼"/utf8>>});
log_join(NRole, 3) ->
    log:save(join,
	     {NRole, <<"新版无尽"/utf8>>, <<"参与风系试炼"/utf8>>});
log_join(NRole, 4) ->
    log:save(join,
	     {NRole, <<"新版无尽"/utf8>>, <<"参与光暗试炼"/utf8>>});
log_join(NRole, Type) ->
    log:save(join,
	     {NRole, <<"功能玩法"/utf8>>, <<"无尽试炼"/utf8>>, 1, 0,
	      util:fbin(<<"类型~w"/utf8>>, [Type])}).

judge_type(_, 5) -> ok;
judge_type(1, 1) -> ok;
judge_type(2, 2) -> ok;
judge_type(3, 3) -> ok;
judge_type(4, 4) -> ok;
judge_type(5, 4) -> ok;
judge_type(_, _) -> false.

get_same_camp_partner(PartnerList, CampType = 4) ->
    [P
     || P = #partner{camp_type = CampType1} <- PartnerList,
	CampType1 =:= CampType orelse CampType1 =:= 5];
get_same_camp_partner(PartnerList, CampType = 5) ->
    [P
     || P = #partner{camp_type = CampType1} <- PartnerList,
	CampType1 =:= CampType orelse CampType1 =:= 4];
get_same_camp_partner(PartnerList, CampType) ->
    [P
     || P = #partner{camp_type = CampType1} <- PartnerList,
	CampType1 =:= CampType].


