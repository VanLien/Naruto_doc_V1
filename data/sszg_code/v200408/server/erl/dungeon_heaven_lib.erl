-file("data/dungeon_heaven_lib.erl", 1).

-file("src/mod/dungeon_heaven/dungeon_heaven_lib.erl",
      1).

-module(dungeon_heaven_lib).

-lager_records([{role_var, [id, vars]},
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
		{heaven_dun, [ver, id, state, star, star_info]},
		{heaven_chapter,
		 [ver, id, star, chapter_awards, dun_list]},
		{m_dungeon_heaven,
		 [ver, count, buy_count, chapter_list, formations]},
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

-export([init/0, login/1, zero_flush/1,
	 get_all_chapter_info/1, get_chapter_info/2,
	 get_chapter_ward/3, get_max_dun_id/1, buy_count/1,
	 auto_combat/3, combat/3, do_combat2/1, combat_over/4,
	 check_dun_finish/2, get_formation_sys/2,
	 set_formation_sys/3, is_perfect_over/2]).

-export([gm_open_full_star/4]).

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

-file("src/mod/dungeon_heaven/dungeon_heaven_lib.erl",
      32).

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

-file("src/mod/dungeon_heaven/dungeon_heaven_lib.erl",
      33).

-file("inc/dungeon_heaven.hrl", 1).

-record(m_dungeon_heaven,
	{ver = 1, count = 0, buy_count = 0, chapter_list = [],
	 formations = []}).

-record(heaven_chapter,
	{ver = 1, id = 0, star = 0, chapter_awards = [],
	 dun_list = []}).

-record(heaven_dun,
	{ver = 1, id = 0, state = 0, star = 0, star_info = []}).

-file("src/mod/dungeon_heaven/dungeon_heaven_lib.erl",
      34).

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

-file("src/mod/dungeon_heaven/dungeon_heaven_lib.erl",
      35).

-file("inc/log.hrl", 1).

-file("src/mod/dungeon_heaven/dungeon_heaven_lib.erl",
      36).

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

-file("src/mod/dungeon_heaven/dungeon_heaven_lib.erl",
      37).

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

-file("src/mod/dungeon_heaven/dungeon_heaven_lib.erl",
      38).

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

-file("src/mod/dungeon_heaven/dungeon_heaven_lib.erl",
      39).

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

-file("src/mod/dungeon_heaven/dungeon_heaven_lib.erl",
      40).

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

-file("src/mod/dungeon_heaven/dungeon_heaven_lib.erl",
      41).

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

-file("src/mod/dungeon_heaven/dungeon_heaven_lib.erl",
      42).

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

-file("src/mod/dungeon_heaven/dungeon_heaven_lib.erl",
      43).

gm_open_full_star(Role = #role{m_dun_heaven = MD}, Star,
		  ChapterId, OrderId) ->
    NewL = gm_do_open(1, ChapterId, OrderId, [], Star),
    NewRole = Role#role{m_dun_heaven =
			    MD#m_dungeon_heaven{chapter_list = NewL}},
    {ok, NewRole}.

gm_do_open(ChapterIdT, ChapterId, _OrderId, NewL, _S)
    when ChapterIdT > ChapterId + 1 ->
    NewL;
gm_do_open(ChapterIdT, ChapterId, _OrderId, NewL, _S)
    when ChapterIdT == ChapterId + 1 ->
    case dungeon_heaven:check_open(NewL, ChapterIdT) of
      AddChapter = #heaven_chapter{} -> [AddChapter | NewL];
      _ -> NewL
    end;
gm_do_open(ChapterIdT, ChapterId, OrderId, NewL, 3) ->
    CP = #heaven_chapter{dun_list = DunList} =
	     dungeon_heaven:init_chapter(ChapterIdT),
    Fun = fun (Dun = #heaven_dun{id = IdT}, {Acc, Acc2}) ->
		  if ChapterIdT =/= ChapterId ->
			 {[#heaven_dun{id = IdT, state = 2, star = 3,
				       star_info = [{1, 1}, {2, 1}, {3, 1}]}
			   | Acc],
			  Acc2 + 3};
		     IdT == OrderId + 1 ->
			 {[#heaven_dun{id = IdT, state = 1} | Acc], Acc2};
		     IdT =< OrderId ->
			 {[#heaven_dun{id = IdT, state = 2, star = 3,
				       star_info = [{1, 1}, {2, 1}, {3, 1}]}
			   | Acc],
			  Acc2 + 3};
		     true -> {[Dun | Acc], Acc2}
		  end
	  end,
    {NewDunList, NewStar} = lists:foldl(Fun, {[], 0},
					DunList),
    ChapterAward = [{AwardId, 1}
		    || AwardId
			   <- dungeon_heaven_data:get_chapter_award_list(ChapterId)],
    NewChapter = CP#heaven_chapter{dun_list = NewDunList,
				   star = NewStar,
				   chapter_awards = ChapterAward},
    gm_do_open(ChapterIdT + 1, ChapterId, OrderId,
	       [NewChapter | NewL], 3);
gm_do_open(ChapterIdT, ChapterId, OrderId, NewL, 1) ->
    CP = #heaven_chapter{dun_list = DunList} =
	     dungeon_heaven:init_chapter(ChapterIdT),
    Fun = fun (Dun = #heaven_dun{id = IdT}, {Acc, Acc2}) ->
		  Fun2 = fun ({IdTemp, CondId}, AccT) ->
				 case CondId == 1001 of
				   true -> [{IdTemp, 1} | AccT];
				   _ -> [{IdTemp, 0} | AccT]
				 end
			 end,
		  StarInfo = lists:foldl(Fun2, [],
					 dungeon_heaven_data:get_cond_info({ChapterId,
									    IdT})),
		  if ChapterIdT =/= ChapterId ->
			 {[#heaven_dun{id = IdT, state = 2, star = 1,
				       star_info = StarInfo}
			   | Acc],
			  Acc2 + 1};
		     IdT == OrderId + 1 ->
			 {[#heaven_dun{id = IdT, state = 1} | Acc], Acc2};
		     IdT =< OrderId ->
			 {[#heaven_dun{id = IdT, state = 2, star = 1,
				       star_info = StarInfo}
			   | Acc],
			  Acc2 + 1};
		     true -> {[Dun | Acc], Acc2}
		  end
	  end,
    {NewDunList, NewStar} = lists:foldl(Fun, {[], 0},
					DunList),
    ChapterAward = [{AwardId, 0}
		    || AwardId
			   <- dungeon_heaven_data:get_chapter_award_list(ChapterId)],
    NewChapter = CP#heaven_chapter{dun_list = NewDunList,
				   star = NewStar,
				   chapter_awards = ChapterAward},
    gm_do_open(ChapterIdT + 1, ChapterId, OrderId,
	       [NewChapter | NewL], 1).

init() ->
    #m_dungeon_heaven{count =
			  dungeon_heaven_data:get_constant(refresh_number),
		      chapter_list = [dungeon_heaven:init_chapter(1)]}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_dun_heaven = DunHeaven}) ->
    NewDunHeaven = DunHeaven#m_dungeon_heaven{count =
						  dungeon_heaven_data:get_constant(refresh_number),
					      buy_count = 0},
    NRole = Role#role{m_dun_heaven = NewDunHeaven},
    get_all_chapter_info(NRole),
    holy_eqm_lottery:push_base(NRole),
    {ok, NRole}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{max_power = MaxPower,
		   m_dun_heaven = #m_dungeon_heaven{chapter_list = L}}) ->
    NewRole = dungeon_heaven:check_next_open(Role),
    case check_open(Role) of
      ok ->
	  case var:get_var(NewRole, day, 156, 0) of
	    0 ->
		log:save(join,
			 {NewRole, <<"Phó bản Thiên Giới."/utf8>>,
			  <<"Phó bản Thiên Giới.可参与玩家"/utf8>>, 1, MaxPower}),
		NewRole1 = var:set_var(NewRole, day, 156, 1),
		{ok, NewRole1};
	    _ -> {ok, NewRole}
	  end;
      _ -> {ok, NewRole}
    end.

-spec get_max_dun_id(#role{} | list()) -> pos_integer().

get_max_dun_id(#role{m_dun_heaven =
			 #m_dungeon_heaven{chapter_list = L}}) ->
    get_max_dun_id(L);
get_max_dun_id(L) ->
    Fun = fun (#heaven_chapter{id = Id, dun_list = DunList},
	       Acc1) ->
		  MaxDunId = case [IdTemp
				   || #heaven_dun{id = IdTemp, state = Status}
					  <- DunList,
				      Status == 2]
				 of
			       Temp = [_ | _] ->
				   OrderId = lists:max(Temp),
				   dungeon_heaven_data:get_dun_id({Id,
								   OrderId});
			       _ -> 0
			     end,
		  max(MaxDunId, Acc1)
	  end,
    lists:foldl(Fun, 0, L).

-spec get_all_chapter_info(#role{}) -> ok.

get_all_chapter_info(Role = #role{m_dun_heaven =
				      #m_dungeon_heaven{count = Count,
							buy_count = BuyCount,
							chapter_list = L}}) ->
    case check_open(Role) of
      {false, Msg} -> ok;
      _ ->
	  {MaxDunId, PushInfo} = chapter_push_info(L),
	  sys_conn:pack_send(25200,
			     {Count, BuyCount, MaxDunId, PushInfo})
    end.

chapter_push_info(L) ->
    Fun = fun (#heaven_chapter{id = Id, star = AllStar,
			       chapter_awards = Awards, dun_list = DunList},
	       {Acc1, Acc}) ->
		  IsFinish = case [D
				   || D = #heaven_dun{state = Status}
					  <- DunList,
				      Status =/= 2]
				 of
			       [] ->
				   util:if_true(AllStar >= length(DunList) * 3,
						2, 1);
			       _ -> 0
			     end,
		  AllStar = lists:sum([Star
				       || #heaven_dun{star = Star} <- DunList]),
		  MaxDunId = case [IdTemp
				   || #heaven_dun{id = IdTemp, state = Status}
					  <- DunList,
				      Status == 2]
				 of
			       Temp = [_ | _] ->
				   OrderId = lists:max(Temp),
				   dungeon_heaven_data:get_dun_id({Id,
								   OrderId});
			       _ -> 0
			     end,
		  {max(MaxDunId, Acc1),
		   [{Id, AllStar, Awards, IsFinish} | Acc]}
	  end,
    lists:foldl(Fun, {0, []}, L).

-spec check_dun_finish(#role{},
		       pos_integer() | term()) -> true | false.

check_dun_finish(#role{m_dun_heaven =
			   #m_dungeon_heaven{chapter_list = L}},
		 {ChapterId, OrderId}) ->
    case lists:keyfind(ChapterId, #heaven_chapter.id, L) of
      #heaven_chapter{dun_list = DunList} ->
	  case lists:keyfind(OrderId, #heaven_dun.id, DunList) of
	    #heaven_dun{state = 2} -> true;
	    _ -> false
	  end;
      _ -> false
    end;
check_dun_finish(Role, DunId) ->
    case dungeon_heaven_data:get_chapter_by_dun_id(DunId) of
      {ChapterId, OrderId} ->
	  check_dun_finish(Role, {ChapterId, OrderId});
      _ -> false
    end.

-spec get_chapter_info(#role{}, pos_integer()) -> ok.

get_chapter_info(Role = #role{m_dun_heaven =
				  #m_dungeon_heaven{chapter_list = L}},
		 ChapterId) ->
    case check_open(Role) of
      {false, Msg} -> notice:alert(Msg), ok;
      _ ->
	  case lists:keyfind(ChapterId, #heaven_chapter.id, L) of
	    #heaven_chapter{dun_list = DunList} ->
		AllStar = lists:sum([Star
				     || #heaven_dun{star = Star} <- DunList]),
		sys_conn:pack_send(25201,
				   {ChapterId, AllStar, DunList});
	    _ ->
		notice:alert(lang:get(<<"Chương chưa được mở"/utf8>>)),
		ok
	  end
    end.

-spec is_perfect_over(#role{}, pos_integer()) -> true |
						 false.

is_perfect_over(#role{m_dun_heaven =
			  #m_dungeon_heaven{chapter_list = L}},
		Target) ->
    case lists:keyfind(Target, #heaven_chapter.id, L) of
      #heaven_chapter{} ->
	  [Star
	   || #heaven_chapter{star = Star, id = Id} <- L,
	      Id =< Target andalso Star < 30]
	    == [];
      _ -> false
    end.

-spec get_chapter_ward(#role{}, pos_integer(),
		       pos_integer()) -> {false, binary(), pos_integer(),
					  pos_integer()} |
					 {ok, #role{}, pos_integer(),
					  pos_integer()}.

get_chapter_ward(Role = #role{m_dun_heaven =
				  MD = #m_dungeon_heaven{chapter_list = L}},
		 ChapterId, AwardId) ->
    case lists:keyfind(ChapterId, #heaven_chapter.id, L) of
      Chapter = #heaven_chapter{chapter_awards = Awards} ->
	  case lists:keyfind(AwardId, 1, Awards) of
	    {_, 0} ->
		{false, lang:get(<<"Phần thưởng không đạt được"/utf8>>),
		 Awards};
	    {_, 2} ->
		{false, lang:get(<<"Phần thưởng để yêu cầu"/utf8>>),
		 Awards};
	    {_, 1} ->
		Item = dungeon_heaven_data:get_chapter_award({ChapterId,
							      AwardId}),
		Gain = format:val_to_gain(Item,
					  dungeon_heaven_get_chapter_ward),
		case role_gain:do_notice(Role, Gain) of
		  {ok, NRole} ->
		      log:log_gain(Gain, Role, NRole, <<"神装副本领取章节奖励"/utf8>>,
				   util:fbin("章节id:~w 奖励id:~w",
					     [ChapterId, AwardId])),
		      NewAwards = lists:keyreplace(AwardId, 1, Awards,
						   {AwardId, 2}),
		      NewChapter = Chapter#heaven_chapter{chapter_awards =
							      NewAwards},
		      NewL = lists:keyreplace(ChapterId, #heaven_chapter.id,
					      L, NewChapter),
		      NewRole = NRole#role{m_dun_heaven =
					       MD#m_dungeon_heaven{chapter_list
								       = NewL}},
		      {ok, NewRole, NewAwards};
		  {false, #loss{msg = Msg}} -> {false, Msg, Awards};
		  {false, #gain{msg = Msg}} -> {false, Msg, Awards}
		end;
	    _ ->
		{false,
		 lang:get(<<"Không có phần thưởng như vậy"/utf8>>),
		 Awards}
	  end;
      _ -> {false, lang:get(<<"Lỗi tham số"/utf8>>), []}
    end.

-spec buy_count(#role{}) -> {false, binary(),
			     pos_integer(), pos_integer()} |
			    {ok, #role{}, pos_integer(), pos_integer()}.

buy_count(Role = #role{m_vip = #m_vip{lev = VipLev},
		       m_dun_heaven =
			   MD = #m_dungeon_heaven{count = Count,
						  buy_count = BuyCount}}) ->
    MaxCount =
	dungeon_heaven_data:get_constant(refresh_number),
    case dungeon_heaven_data:get_buy_count_info(BuyCount +
						  1)
	of
      _ when Count >= MaxCount ->
	  {false,
	   lang:get(<<"Số lượng thử thách đã đạt đến giới hạn "
		      "trên"/utf8>>),
	   Count, BuyCount};
      {LimitVipLev, ExpendNum} when VipLev >= LimitVipLev ->
	  Loss = format:val_to_loss([{3, ExpendNum}],
				    dungeon_heaven_buy_count),
	  case role_gain:do(Role, Loss) of
	    {ok, NRole} ->
		log:log_gain(Loss, Role, NRole, <<"神装副本购买次数"/utf8>>,
			     util:fbin("当前次数:~w,当前已购买次数:~w",
				       [Count, BuyCount])),
		NCount = Count + 1,
		NBuyCount = BuyCount + 1,
		NewRole = NRole#role{m_dun_heaven =
					 MD#m_dungeon_heaven{count = NCount,
							     buy_count =
								 NBuyCount}},
		{ok, NewRole, NCount, NBuyCount};
	    {false, #loss{msg = Msg}} ->
		{false, Msg, Count, BuyCount}
	  end;
      {LimitVipLev, _ExpendNum} ->
	  {false,
	   util:fbin(lang:get(<<"VIP~wChỉ có thể mua khi"/utf8>>),
		     [LimitVipLev]),
	   Count, BuyCount};
      _ ->
	  {false, lang:get(<<"Số lượng mua đã hết"/utf8>>), Count,
	   BuyCount}
    end.

-spec get_formation_sys(#role{}, pos_integer()) -> {ok,
						    #role{}, list()}.

get_formation_sys(Role = #role{m_dun_heaven =
				   MD = #m_dungeon_heaven{formations = Defens}},
		  Type) ->
    case lists:keyfind(Type, 1, Defens) of
      {_, Formations} ->
	  PushFormations = [{OrderT, FormationTypeT,
			     [Temp
			      || Temp = #formation_pos{id = IdT} <- PosInfoT,
				 partner_lib:get_partner(Role, IdT) =/= false],
			     HallowsIdT}
			    || {OrderT, FormationTypeT, PosInfoT, HallowsIdT}
				   <- Formations],
	  case [1 || E <- PushFormations, element(3, E) =/= []] of
	    [_ | _] -> {ok, Role, PushFormations};
	    _ ->
		#formation_lineup{pos_info = PosInfo,
				  type = FormationType,
				  hallows_id = HallowsId} =
		    formation_lib:query_formation_info_without_resonate(Role),
		Formations1 = [{1, FormationType, PosInfo, HallowsId}],
		NewDefens = lists:keystore(Type, 1, Defens,
					   {Type, Formations1}),
		NewMD = MD#m_dungeon_heaven{formations = NewDefens},
		PushFormations1 = [{OrderT, FormationTypeT,
				    [Temp
				     || Temp = #formation_pos{id = IdT}
					    <- PosInfoT,
					partner_lib:get_partner(Role, IdT) =/=
					  false],
				    HallowsIdT}
				   || {OrderT, FormationTypeT, PosInfoT,
				       HallowsIdT}
					  <- Formations1],
		{ok, Role#role{m_dun_heaven = NewMD}, PushFormations1}
	  end;
      _ when Type == 1 ->
	  #formation_lineup{pos_info = PosInfo,
			    type = FormationType, hallows_id = HallowsId} =
	      formation_lib:query_formation_info_without_resonate(Role),
	  Formations = [{1, FormationType, PosInfo, HallowsId}],
	  NewDefens = lists:keystore(Type, 1, Defens,
				     {Type, Formations}),
	  NewMD = MD#m_dungeon_heaven{formations = NewDefens},
	  PushFormations = [{OrderT, FormationTypeT,
			     [Temp
			      || Temp = #formation_pos{id = IdT} <- PosInfoT,
				 partner_lib:get_partner(Role, IdT) =/= false],
			     HallowsIdT}
			    || {OrderT, FormationTypeT, PosInfoT, HallowsIdT}
				   <- Formations],
	  {ok, Role#role{m_dun_heaven = NewMD}, PushFormations};
      _ ->
	  {ok,
	   Role2 = #role{m_dun_heaven =
			     MD2 = #m_dungeon_heaven{formations = Defens2}},
	   Formations} =
	      get_formation_sys(Role, 1),
	  NewDefens = lists:keystore(Type, 1, Defens2,
				     {Type, Formations}),
	  NewMD = MD2#m_dungeon_heaven{formations = NewDefens},
	  PushFormations = [{OrderT, FormationTypeT,
			     [Temp
			      || Temp = #formation_pos{id = IdT} <- PosInfoT,
				 partner_lib:get_partner(Role, IdT) =/= false],
			     HallowsIdT}
			    || {OrderT, FormationTypeT, PosInfoT, HallowsIdT}
				   <- Formations],
	  {ok, Role2#role{m_dun_heaven = NewMD}, PushFormations}
    end.

-spec set_formation_sys(#role{}, pos_integer(),
			list()) -> {ok, #role{}} | {false, binary()}.

set_formation_sys(Role = #role{m_dun_heaven =
				   MD = #m_dungeon_heaven{formations = Defens}},
		  Type, Formations) ->
    case check_can_set(Role, Type, Formations) of
      {false, Msg} -> {false, Msg};
      {ok, NFormations} ->
	  NewDefens = lists:keystore(Type, 1, Defens,
				     {Type, NFormations}),
	  NewArenaElite = MD#m_dungeon_heaven{formations =
						  NewDefens},
	  NewRole = Role#role{m_dun_heaven = NewArenaElite},
	  {ok, NewRole}
    end.

check_can_set(_, _, []) ->
    {false,
     lang:get(<<"Ít nhất một anh hùng cần được triển "
		"khai"/utf8>>)};
check_can_set(Role = #role{}, 1,
	      [{Order, FormationType, PosInfo, HallowsId}]) ->
    case formation:check_formation_pos_info(Role,
					    FormationType, PosInfo, HallowsId)
	of
      {false, Reason} -> {false, Reason};
      {ok, []} ->
	  {false,
	   lang:get(<<"Cần có ít nhất một anh hùng"/utf8>>)};
      {ok, NewPosInfo} ->
	  {ok, [{Order, FormationType, NewPosInfo, HallowsId}]}
    end;
check_can_set(_Role, 1, Formations)
    when length(Formations) > 1 ->
    {false,
     lang:get(<<"Có thể bố trí tối đa 1 đội ở cấp độ "
		"thường"/utf8>>)};
check_can_set(_Role, 2, Formations)
    when length(Formations) > 2 ->
    {false,
     lang:get(<<"Trong trận đấu boss, tối đa có thể bố "
		"trí 2 đội"/utf8>>)};
check_can_set(Role, 2, Formations) ->
    case lists:keyfind(2, 1, Formations) of
      {_Order, _FormationType, [_ | _], _HallowsId} ->
	  case check_formations(Role, Formations, [], 0) of
	    {false, Msg} -> {false, Msg};
	    {ok, NFormations} -> {ok, NFormations}
	  end;
      _ ->
	  case check_formations(Role, Formations, [], 0) of
	    {false, Msg} -> {false, Msg};
	    {ok, NFormations} -> {ok, NFormations}
	  end
    end.

check_formations(#role{}, [], L, _MaxPower) ->
    case [{Order, FormationType, NewPosInfo, HallowsId}
	  || {Order, FormationType, NewPosInfo, HallowsId} <- L,
	     NewPosInfo =/= []]
	of
      [] ->
	  {false,
	   lang:get(<<"Ít nhất cần có một anh hùng tham gia"/utf8>>)};
      _ -> {ok, L}
    end;
check_formations(Role,
		 [{Order, FormationType, PosInfo, HallowsId}
		  | Formations],
		 L, MaxPower) ->
    case lists:keymember(HallowsId, 4, L) of
      true when HallowsId =/= 0 ->
	  {false,
	   lang:get(<<"Các đội khác nhau không thể sử dụng "
		      "cùng một nhẫn cụ"/utf8>>)};
      _ ->
	  AllPos = lists:flatten([NPosInfo
				  || {_, _, NPosInfo, _} <- L]),
	  case check_pos_info(PosInfo, AllPos) of
	    {false, Msg} -> {false, Msg};
	    _ ->
		case formation:check_formation_pos_info(Role,
							FormationType, PosInfo,
							HallowsId)
		    of
		  {false, Reason} -> {false, Reason};
		  {ok, NewPosInfo} ->
		      Power = partner_lib:get_power(Role,
						    [PId
						     || #formation_pos{id = PId}
							    <- NewPosInfo]),
		      check_formations(Role, Formations,
				       [{Order, FormationType, NewPosInfo,
					 HallowsId}
					| L],
				       max(Power, MaxPower))
		end
	  end
    end.

check_pos_info([], _AllPos) -> ok;
check_pos_info([{_Pos, Id} | PosInfo], AllPos) ->
    case lists:keymember(Id, #formation_pos.id, AllPos) of
      true ->
	  {false,
	   lang:get(<<"Không thể cho cùng một ninja tham gia "
		      "trong nhiều đội"/utf8>>)};
      _ -> check_pos_info(PosInfo, AllPos)
    end.

-spec auto_combat(#role{}, pos_integer(),
		  pos_integer()) -> {false, binary(), pos_integer()} |
				    {ok, #role{}, pos_integer()}.

auto_combat(Role = #role{m_dun_heaven =
			     MD = #m_dungeon_heaven{count = Count,
						    chapter_list = L}},
	    ChapterId, OrderId) ->
    case lists:keyfind(ChapterId, #heaven_chapter.id, L) of
      _ when Count =< 0 ->
	  {false, lang:get(<<"Số lần thử thách không đủ"/utf8>>),
	   Count};
      #heaven_chapter{dun_list = DunList} ->
	  case lists:keyfind(OrderId, #heaven_dun.id, DunList) of
	    #heaven_dun{star = Star} when Star >= 3 ->
		{Award1, Drops} =
		    dungeon_heaven_data:get_award({ChapterId, OrderId}),
		Items1 = case drop_lib:common_drop(Role, Drops) of
			   [{_, DropItems, _, _}] ->
			       [{Bid, Val} || {Bid, _, Val} <- DropItems];
			   _ -> []
			 end,
		Award = item_lib:merge(Award1, Items1),
		Gain = format:val_to_gain(Award,
					  dungeon_heaven_auto_combat),
		case role_gain:do_notice(Role, Gain) of
		  {ok, NRole} ->
		      log:log_gain(Gain, Role, NRole, <<"神装副本扫荡关卡"/utf8>>,
				   util:fbin("章节id:~w关卡序号:~w当前次数:~w",
					     [ChapterId, OrderId, Count])),
		      NCount = Count - 1,
		      NewRole = NRole#role{m_dun_heaven =
					       MD#m_dungeon_heaven{count =
								       NCount}},
		      NewRole1 = role_trigger:fire([#evt_dun_heaven_win{}],
						   NewRole),
		      log:save(join,
			       {NewRole1, <<"功能玩法"/utf8>>, <<"神装副本"/utf8>>}),
		      {ok, NewRole1, NCount};
		  {false, #loss{msg = Msg}} -> {false, Msg, Count}
		end;
	    _ ->
		{false,
		 lang:get(<<"Chỉ có thể tiến hành quét sau khi hoàn "
			    "thành 3 sao"/utf8>>),
		 Count}
	  end;
      _ -> {false, lang:get(<<"Lỗi tham số"/utf8>>), Count}
    end.

-spec combat(#role{}, pos_integer(),
	     pos_integer()) -> {ok, #role{}} | {false, binary()}.

combat(Role = #role{max_power = MaxPower,
		    m_dun_heaven = MD = #m_dungeon_heaven{count = Count}},
       ChapterId, OrderId) ->
    case check_can_combat(Role, ChapterId, OrderId) of
      {false, Msg} -> {false, Msg};
      {ok, UnitIds, Flag, StarInfo} ->
	  Type = dungeon_heaven_data:is_boss({ChapterId,
					      OrderId}),
	  PosInfo = dungeon_heaven:get_formation_pos_info(Role,
							  Type),
	  case do_combat(Role, Type, Flag, UnitIds, 1, 1, 1, [],
			 [], ChapterId, OrderId, PosInfo, StarInfo, combat_over)
	      of
	    {false, Reason} -> {false, Reason};
	    {ok, _ComPid} ->
		NewRole = Role#role{m_dun_heaven =
					MD#m_dungeon_heaven{count = Count - 1}},
		log:save(join,
			 {NewRole, <<"功能玩法"/utf8>>, <<"神装副本"/utf8>>}),
		log:save(join,
			 {NewRole, <<"Phó bản Thiên Giới."/utf8>>,
			  util:fbin("~w-~w参与", [ChapterId, OrderId]), 1,
			  MaxPower}),
		log:save(task,
			 {Role, 0, ChapterId * 100 + OrderId,
			  util:fbin(lang:get(<<"Phó bản Thiên giới-~w-~w"/utf8>>),
				    [ChapterId, OrderId]),
			  90, <<"Phó bản Thiên giới"/utf8>>,
			  <<"Trận đấu bắt đầu"/utf8>>}),
		{ok, NewRole}
	  end
    end.

do_combat2(Role) ->
    case erase(dungeon_heaven_do_combat_timer) of
      undefined -> skip;
      Timer -> erlang:cancel_timer(Timer)
    end,
    case erase(dungeon_heaven_do_combat_arge) of
      {Type, Flag, UnitIds, Round, ARound, BRound, AStatInfo,
       BStatInfo, ChapterId, OrderId, PosInfo, StarInfo,
       EndType} ->
	  case do_combat(Role, Type, Flag, UnitIds, Round, ARound,
			 BRound, AStatInfo, BStatInfo, ChapterId, OrderId,
			 PosInfo, StarInfo, EndType)
	      of
	    {ok, NRole} -> {ok, NRole};
	    _ERR ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Piddungeon_heaven_lib461, _,
		   {__Leveldungeon_heaven_lib461,
		    __Tracesdungeon_heaven_lib461}}
		      when __Leveldungeon_heaven_lib461 band 8 /= 0 orelse
			     __Tracesdungeon_heaven_lib461 /= [] ->
		      lager:do_log(error,
				   [{module, dungeon_heaven_lib},
				    {function, do_combat2}, {line, 461},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]进Thất bại trong trận đấu~w",
						 [Role#role.name, _ERR]),
				   none, 4096, 8, __Leveldungeon_heaven_lib461,
				   __Tracesdungeon_heaven_lib461, lager_event,
				   __Piddungeon_heaven_lib461);
		  _ -> ok
		end,
		ok
	  end;
      _Err -> ok
    end.

do_combat(RoleT = #role{combat_type_list =
			    CombatTypeList},
	  Type, Flag, UnitIds, Round, ARound, BRound, AStatInfo,
	  BStatInfo, ChapterId, OrderId, PosInfo, StarInfo,
	  EndType) ->
    CombatType = 27,
    Role = util:if_true(Round == 1, RoleT,
			RoleT#role{combat_pid = 0,
				   combat_type_list =
				       lists:keydelete(CombatType, 1,
						       CombatTypeList)}),
    case dungeon_heaven:get_unit_fight_object(Role, UnitIds,
					      BRound, BStatInfo)
	of
      {false, Msg} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddungeon_heaven_lib472, _,
	     {__Leveldungeon_heaven_lib472,
	      __Tracesdungeon_heaven_lib472}}
		when __Leveldungeon_heaven_lib472 band 8 /= 0 orelse
		       __Tracesdungeon_heaven_lib472 /= [] ->
		lager:do_log(error,
			     [{module, dungeon_heaven_lib},
			      {function, do_combat}, {line, 472},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("神装副本进Thất bại trong trận đấu:~w",
					   [{ChapterId, OrderId, ARound, BRound,
					     Msg}]),
			     none, 4096, 8, __Leveldungeon_heaven_lib472,
			     __Tracesdungeon_heaven_lib472, lager_event,
			     __Piddungeon_heaven_lib472);
	    _ -> ok
	  end,
	  case Round == 1 of
	    true -> {false, Msg};
	    _ ->
		do_combat_over(Role, Flag, ChapterId, OrderId, PosInfo,
			       EndType)
	  end;
      {TarName, BFormationType, DefendList} ->
	  case dungeon_heaven:gen_fight_object(Role, ARound,
					       AStatInfo, Type)
	      of
	    {false, Msg} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Piddungeon_heaven_lib481, _,
		   {__Leveldungeon_heaven_lib481,
		    __Tracesdungeon_heaven_lib481}}
		      when __Leveldungeon_heaven_lib481 band 8 /= 0 orelse
			     __Tracesdungeon_heaven_lib481 /= [] ->
		      lager:do_log(error,
				   [{module, dungeon_heaven_lib},
				    {function, do_combat}, {line, 481},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("神装副本进Thất bại trong trận đấu:~w",
						 [{ChapterId, OrderId, ARound,
						   BRound, Msg}]),
				   none, 4096, 8, __Leveldungeon_heaven_lib481,
				   __Tracesdungeon_heaven_lib481, lager_event,
				   __Piddungeon_heaven_lib481);
		  _ -> ok
		end,
		case Round == 1 of
		  true -> {false, Msg};
		  _ ->
		      do_combat_over(Role, Flag, ChapterId, OrderId, PosInfo,
				     EndType)
		end;
	    {FormationType, []}
		when Type == 1 andalso ARound == 1 ->
		{WinCount, LoseCount} =
		    util:get(dungeon_heaven_win_count, {0, 0}),
		put(dungeon_heaven_win_count,
		    {WinCount, LoseCount + 1}),
		do_combat(Role, 1, Flag, UnitIds, Round + 1, ARound + 1,
			  BRound, [], BStatInfo, ChapterId, OrderId, PosInfo,
			  StarInfo, EndType);
	    {FormationType, [#fight_object{object_type = 4}]}
		when Type == 1 andalso ARound == 1 ->
		{WinCount, LoseCount} =
		    util:get(dungeon_heaven_win_count, {0, 0}),
		put(dungeon_heaven_win_count,
		    {WinCount, LoseCount + 1}),
		do_combat(Role, 1, Flag, UnitIds, Round + 1, ARound + 1,
			  BRound, [], BStatInfo, ChapterId, OrderId, PosInfo,
			  StarInfo, EndType);
	    {FormationType, [#fight_object{object_type = 5}]}
		when Type == 1 andalso ARound == 1 ->
		{WinCount, LoseCount} =
		    util:get(dungeon_heaven_win_count, {0, 0}),
		put(dungeon_heaven_win_count,
		    {WinCount, LoseCount + 1}),
		do_combat(Role, 1, Flag, UnitIds, Round + 1, ARound + 1,
			  BRound, [], BStatInfo, ChapterId, OrderId, PosInfo,
			  StarInfo, EndType);
	    {FormationType,
	     [#fight_object{object_type = 4},
	      #fight_object{object_type = 5}]}
		when Type == 1 andalso ARound == 1 ->
		{WinCount, LoseCount} =
		    util:get(dungeon_heaven_win_count, {0, 0}),
		put(dungeon_heaven_win_count,
		    {WinCount, LoseCount + 1}),
		do_combat(Role, 1, Flag, UnitIds, Round + 1, ARound + 1,
			  BRound, [], BStatInfo, ChapterId, OrderId, PosInfo,
			  StarInfo, EndType);
	    {FormationType,
	     [#fight_object{object_type = 5},
	      #fight_object{object_type = 4}]}
		when Type == 1 andalso ARound == 1 ->
		{WinCount, LoseCount} =
		    util:get(dungeon_heaven_win_count, {0, 0}),
		put(dungeon_heaven_win_count,
		    {WinCount, LoseCount + 1}),
		do_combat(Role, 1, Flag, UnitIds, Round + 1, ARound + 1,
			  BRound, [], BStatInfo, ChapterId, OrderId, PosInfo,
			  StarInfo, EndType);
	    {FormationType, AtkGroup} ->
		Star1 = list_util:keyfind(1, StarInfo, 0),
		Star2 = list_util:keyfind(2, StarInfo, 0),
		Star3 = list_util:keyfind(3, StarInfo, 0),
		Flag2 = case Type == 1 andalso ARound == 1 of
			  true ->
			      case dungeon_heaven:gen_fight_object(Role,
								   ARound + 1,
								   [], Type)
				  of
				{false, _} -> 0;
				{_, []} -> 0;
				{_, [#fight_object{object_type = 4}]} -> 0;
				{_, [#fight_object{object_type = 5}]} -> 0;
				{_,
				 [#fight_object{object_type = 4},
				  #fight_object{object_type = 5}]} ->
				    0;
				{_,
				 [#fight_object{object_type = 5},
				  #fight_object{object_type = 4}]} ->
				    0;
				_ -> 1
			      end;
			  _ -> 0
			end,
		{ok, CRole0} = role_convert:do(combat_role, Role),
		CRole = CRole0#combat_role{conn_pid = 0, group = 1,
					   is_auto = true, is_offline = true,
					   auto_watch_model = 1, watching = 0},
		Args = #{on_role_combat_end =>
			     {dungeon_heaven_lib, combat_over,
			      [{Type, Flag, UnitIds, Round, ARound, BRound,
				ChapterId, OrderId, FormationType, PosInfo,
				StarInfo}]},
			 ext_args =>
			     [{cli_ext_args,
			       [ChapterId, OrderId, Star1, Star2, Star3, Flag,
				Type, ARound, Flag2]},
			      {is_show_panel, false}],
			 formation =>
			     [{1, FormationType, 0}, {2, BFormationType, 0}],
			 target_role_name => TarName, combat_role => CRole},
		put(is_multiple_combat, 1),
		case combat_lib:start_combat(Role, CombatType, AtkGroup,
					     [DefendList], Args)
		    of
		  {ok, _CombatPid} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Piddungeon_heaven_lib538, _,
			 {__Leveldungeon_heaven_lib538,
			  __Tracesdungeon_heaven_lib538}}
			    when __Leveldungeon_heaven_lib538 band 128 /= 0
				   orelse __Tracesdungeon_heaven_lib538 /= [] ->
			    lager:do_log(debug,
					 [{module, dungeon_heaven_lib},
					  {function, do_combat}, {line, 538},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("do_combat==~ts====~w ~w",
						       [Role#role.name, Round,
							CombatType]),
					 none, 4096, 128,
					 __Leveldungeon_heaven_lib538,
					 __Tracesdungeon_heaven_lib538,
					 lager_event,
					 __Piddungeon_heaven_lib538);
			_ -> ok
		      end,
		      {ok, Role};
		  {false, Err} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Piddungeon_heaven_lib541, _,
			 {__Leveldungeon_heaven_lib541,
			  __Tracesdungeon_heaven_lib541}}
			    when __Leveldungeon_heaven_lib541 band 8 /= 0 orelse
				   __Tracesdungeon_heaven_lib541 /= [] ->
			    lager:do_log(error,
					 [{module, dungeon_heaven_lib},
					  {function, do_combat}, {line, 541},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("神装副本进Thất bại trong trận đấu:~w",
						       [{ChapterId, OrderId,
							 ARound, BRound, Err}]),
					 none, 4096, 8,
					 __Leveldungeon_heaven_lib541,
					 __Tracesdungeon_heaven_lib541,
					 lager_event,
					 __Piddungeon_heaven_lib541);
			_ -> ok
		      end,
		      case Round == 1 of
			true -> erase(is_multiple_combat), {false, Err};
			_ ->
			    do_combat_over(Role, Flag, ChapterId, OrderId,
					   PosInfo, EndType)
		      end
		end
	  end
    end.

do_next_combat(Role = #role{pid = Pid,
			    ui_combat_type = UiCombatType},
	       Arg = {Type, Flag, UnitIds, Round, ARound, BRound,
		      AStatInfo, BStatInfo, ChapterId, OrderId, PosInfo,
		      StarInfo, EndType}) ->
    case UiCombatType == 27 of
      true ->
	  put(dungeon_heaven_do_combat_arge, Arg),
	  sys_conn:pack_send(25216, {27, 1}),
	  role:apply(async, Pid,
		     {dungeon_heaven_lib, do_combat2, []}),
	  ok;
      _ ->
	  do_combat(Role, Type, Flag, UnitIds, Round, ARound,
		    BRound, AStatInfo, BStatInfo, ChapterId, OrderId,
		    PosInfo, StarInfo, EndType)
    end.

-spec combat_over(#role{}, #combat_result{}, #combat{},
		  tuple()) -> {ok, #role{}}.

combat_over(Role = #role{ui_combat_type = UiCombatType},
	    #combat_result{end_type = EndType, result = Result,
			   hurt_statistics = HurtStatistics,
			   a_stat_info = AStatInfo, b_stat_info = BStatInfo},
	    Combat = #combat{target_role_name = TargetName,
			     round = CombatRound},
	    {1, Flag, UnitIds, Round, ARound, BRound, ChapterId,
	     OrderId, FormationType, PosInfo, StarInfo}) ->
    put(dungeon_heaven_hurt_statistics,
	[{Round, ARound, BRound, TargetName, HurtStatistics}
	 | util:get(dungeon_heaven_hurt_statistics, [])]),
    {OldWinCount, OldLose} =
	util:get(dungeon_heaven_win_count, {0, 0}),
    put(dungeon_heaven_combat_round, CombatRound),
    {WinCount, Lose} = case Result == 1 of
			 true ->
			     put(dungeon_heaven_win_count,
				 {OldWinCount + 1, OldLose}),
			     {OldWinCount + 1, OldLose};
			 _ ->
			     put(dungeon_heaven_win_count,
				 {OldWinCount, OldLose + 1}),
			     {OldWinCount, OldLose + 1}
		       end,
    AInfo = util:get(dungeon_heaven_a_info, []),
    case EndType == quit2 of
      true ->
	  HpInfo = [{Pos, Hp, HpMax}
		    || #{pos := Pos, hp := Hp, hp_max := HpMax}
			   <- AStatInfo],
	  put(dungeon_heaven_a_info,
	      lists:keystore(ARound, 1, AInfo,
			     {ARound, Combat#combat.round, FormationType,
			      HpInfo}));
      _ ->
	  HpInfo = [{Pos, Hp, HpMax}
		    || #{pos := Pos, hp := Hp, hp_max := HpMax}
			   <- AStatInfo],
	  put(dungeon_heaven_a_info,
	      lists:keystore(ARound, 1, AInfo,
			     {ARound, Combat#combat.round, FormationType,
			      HpInfo}))
    end,
    if WinCount >= 2 orelse Lose >= 2 ->
	   do_combat_over(Role, Flag, ChapterId, OrderId, PosInfo,
			  EndType);
       EndType == quit ->
	   do_combat_over(Role, Flag, ChapterId, OrderId, PosInfo,
			  EndType);
       EndType == quit2 ->
	   Arge = {1, Flag, UnitIds, Round + 1, ARound + 1, BRound,
		   [], BStatInfo, ChapterId, OrderId, PosInfo, StarInfo,
		   EndType},
	   do_next_combat(Role, Arge);
       Result == 1 ->
	   Arge = {1, Flag, UnitIds, Round + 1, ARound, BRound + 1,
		   AStatInfo, [], ChapterId, OrderId, PosInfo, StarInfo,
		   EndType},
	   do_next_combat(Role, Arge);
       true ->
	   Arge = {1, Flag, UnitIds, Round + 1, ARound + 1, BRound,
		   [], BStatInfo, ChapterId, OrderId, PosInfo, StarInfo,
		   EndType},
	   do_next_combat(Role, Arge)
    end;
combat_over(Role = #role{max_power = MaxPower,
			 m_dun_heaven =
			     #m_dungeon_heaven{buy_count = BuyCount,
					       count = Count}},
	    #combat_result{result = 1, a_stat_info = AStatInfo,
			   hurt_statistics = HurtStatistics},
	    Combat = #combat{target_role_name = TargetName},
	    {_, Flag, _UnitIds, _Round, _ARound, _BRound, ChapterId,
	     OrderId, FormationType, PosInfo, _StarInfo}) ->
    HpInfo = [{Pos, Hp, HpMax}
	      || #{pos := Pos, hp := Hp, hp_max := HpMax}
		     <- AStatInfo],
    Cache = #{result => 1, pos_info => PosInfo,
	      order => [Combat#combat.round],
	      formation_type => [FormationType],
	      a_hp_info => [HpInfo], a_round => 1},
    {NewRole0, PushDunList, PushChapterList, StarInfo} =
	dungeon_heaven:ref_dun_heaven(Role, Cache, ChapterId,
				      OrderId),
    NewRole = holiday_holy_eqm:fire(NewRole0),
    holiday_fire_gift:fire(NewRole),
    {DropRole, AllAward} = combat_award(NewRole, Combat,
					ChapterId, OrderId, Flag),
    StarTemp = length([StateTemp
		       || {_, StateTemp} <- StarInfo, StateTemp == 1]),
    log:save(join,
	     {NewRole, <<"Phó bản Thiên Giới."/utf8>>,
	      util:fbin("~w-~w通关", [ChapterId, OrderId]), 1, MaxPower,
	      util:fbin(<<"~w星"/utf8>>, [StarTemp])}),
    sys_conn:pack_send(25206,
		       {1, ChapterId, OrderId, StarInfo, AllAward,
			[{1, 1, 1, TargetName, HurtStatistics}]}),
    {MaxDunId, PushChapterInfo} =
	chapter_push_info(PushChapterList),
    sys_conn:pack_send(25203,
		       {Count, BuyCount, MaxDunId, PushChapterInfo}),
    sys_conn:pack_send(25204, {ChapterId, PushDunList}),
    erase(dungeon_heaven_hurt_statistics),
    erase(dungeon_heaven_win_count),
    erase(dungeon_heaven_a_info),
    erase(dungeon_heaven_combat_round),
    Star = calc_star(DropRole),
    rank_listener:handle(dungeon_heaven, DropRole,
			 #{star => Star, time => date:unixtime()}),
    FireRole =
	role_trigger:fire([#evt_dun_heaven_perfectpass{chapter_id
							   = ChapterId},
			   #evt_dun_heaven_win{}],
			  DropRole),
    log:save(task,
	     {Role, 1, ChapterId * 100 + OrderId,
	      util:fbin(lang:get(<<"Phó bản Thiên Giới.-~w-~w"/utf8>>),
			[ChapterId, OrderId]),
	      90, <<"Phó bản Thiên Giới."/utf8>>,
	      <<"Chiến thắng trong trận đấu"/utf8>>}),
    {ok, FireRole};
combat_over(Role = #role{m_dun_heaven =
			     MDHeaven = #m_dungeon_heaven{count = Count,
							  buy_count =
							      BuyCount}},
	    #combat_result{end_type = EndType,
			   hurt_statistics = HurtStatistics},
	    #combat{target_role_name = TargetName},
	    {_, _Flag, _UnitIds, _Round, _ARound, _BRound,
	     ChapterId, OrderId, _FormationType, _PosInfo,
	     _StarInfo}) ->
    NewRole = Role#role{m_dun_heaven =
			    MDHeaven#m_dungeon_heaven{count =
							  min(dungeon_heaven_data:get_constant(refresh_number),
							      Count + 1)}},
    case EndType == quit of
      true -> skip;
      _ ->
	  sys_conn:pack_send(25206,
			     {2, ChapterId, OrderId, [], [],
			      [{1, 1, 1, TargetName, HurtStatistics}]})
    end,
    log:save(task,
	     {Role, 2, ChapterId * 100 + OrderId,
	      util:fbin(lang:get(<<"Phó bản Thiên Giới.-~w-~w"/utf8>>),
			[ChapterId, OrderId]),
	      90, <<"Phó bản Thiên Giới."/utf8>>,
	      <<"Thất bại trong trận đấu"/utf8>>}),
    sys_conn:pack_send(25203, {Count + 1, BuyCount, 0, []}),
    erase(dungeon_heaven_hurt_statistics),
    erase(dungeon_heaven_win_count),
    erase(dungeon_heaven_a_info),
    erase(dungeon_heaven_combat_round),
    {ok, NewRole};
combat_over(Role, CombatResult, Combat, Arge) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddungeon_heaven_lib680, _,
       {__Leveldungeon_heaven_lib680,
	__Tracesdungeon_heaven_lib680}}
	  when __Leveldungeon_heaven_lib680 band 8 /= 0 orelse
		 __Tracesdungeon_heaven_lib680 /= [] ->
	  lager:do_log(error,
		       [{module, dungeon_heaven_lib}, {function, combat_over},
			{line, 680}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("错误的参数~w",
				     [{CombatResult, Combat, Arge}]),
		       none, 4096, 8, __Leveldungeon_heaven_lib680,
		       __Tracesdungeon_heaven_lib680, lager_event,
		       __Piddungeon_heaven_lib680);
      _ -> ok
    end,
    erase(dungeon_heaven_hurt_statistics),
    erase(dungeon_heaven_win_count),
    erase(dungeon_heaven_a_info),
    erase(dungeon_heaven_combat_round),
    {ok, Role}.

do_combat_over(Role = #role{max_power = MaxPower,
			    m_dun_heaven =
				MDHeaven = #m_dungeon_heaven{count = Count,
							     buy_count =
								 BuyCount}},
	       Flag, ChapterId, OrderId, PosInfo, EndType) ->
    AllHurtStatistics =
	util:get(dungeon_heaven_hurt_statistics, []),
    erase(dungeon_heaven_hurt_statistics),
    erase(dungeon_heaven_combat_round),
    AInfo = erase(dungeon_heaven_a_info),
    sys_conn:pack_send(25216, {27, 0}),
    erase(is_multiple_combat),
    case erase(dungeon_heaven_win_count) of
      {WinCount, LoseCount} when WinCount > LoseCount ->
	  Order = [Ord
		   || {_ARound, Ord, _FormationType, _HpInfo} <- AInfo],
	  Formations = [FormationType
			|| {_ARound, _Ord, FormationType, _HpInfo} <- AInfo],
	  HpInfos = [HpInfo
		     || {_ARound, _Ord, _FormationType, HpInfo} <- AInfo],
	  Cache = #{result => 1, pos_info => PosInfo,
		    order => Order, formation_type => Formations,
		    a_hp_info => HpInfos, a_round => 1},
	  {NewRole0, PushDunList, PushChapterList, StarInfo} =
	      dungeon_heaven:ref_dun_heaven(Role, Cache, ChapterId,
					    OrderId),
	  NewRole = holiday_holy_eqm:fire(NewRole0),
	  holiday_fire_gift:fire(NewRole),
	  {DropRole, AllAward} = combat_award(NewRole, #combat{},
					      ChapterId, OrderId, Flag),
	  sys_conn:pack_send(25206,
			     {1, ChapterId, OrderId, StarInfo, AllAward,
			      AllHurtStatistics}),
	  StarTemp = length([StateTemp
			     || {_, StateTemp} <- StarInfo, StateTemp == 1]),
	  log:save(join,
		   {NewRole, <<"Phó bản Thiên Giới."/utf8>>,
		    util:fbin("~w-~w通关", [ChapterId, OrderId]), 1, MaxPower,
		    util:fbin(<<"~w星"/utf8>>, [StarTemp])}),
	  {MaxDunId, PushChapterInfo} =
	      chapter_push_info(PushChapterList),
	  sys_conn:pack_send(25203,
			     {Count, BuyCount, MaxDunId, PushChapterInfo}),
	  sys_conn:pack_send(25204, {ChapterId, PushDunList}),
	  Star = calc_star(DropRole),
	  rank_listener:handle(dungeon_heaven, DropRole,
			       #{star => Star, time => date:unixtime()}),
	  FireRole =
	      role_trigger:fire([#evt_dun_heaven_perfectpass{chapter_id
								 = ChapterId},
				 #evt_dun_heaven_win{}],
				DropRole),
	  log:save(task,
		   {Role, 1, ChapterId * 100 + OrderId,
		    util:fbin(lang:get(<<"Phó bản Thiên Giới.-~w-~w"/utf8>>),
			      [ChapterId, OrderId]),
		    90, <<"Phó bản Thiên Giới."/utf8>>,
		    <<"Chiến thắng trong trận đấu"/utf8>>}),
	  {ok, FireRole};
      _ ->
	  NewRole = Role#role{m_dun_heaven =
				  MDHeaven#m_dungeon_heaven{count =
								min(dungeon_heaven_data:get_constant(refresh_number),
								    Count +
								      1)}},
	  case EndType == quit of
	    true -> skip;
	    _ ->
		sys_conn:pack_send(25206,
				   {2, ChapterId, OrderId, [], [],
				    AllHurtStatistics})
	  end,
	  log:save(task,
		   {Role, 2, ChapterId * 100 + OrderId,
		    util:fbin(lang:get(<<"Phó bản Thiên Giới.-~w-~w"/utf8>>),
			      [ChapterId, OrderId]),
		    90, <<"Phó bản Thiên Giới."/utf8>>,
		    <<"Thất bại trong trận đấu"/utf8>>}),
	  sys_conn:pack_send(25203, {Count + 1, BuyCount, 0, []}),
	  {ok, NewRole}
    end.

calc_star(#role{m_dun_heaven =
		    #m_dungeon_heaven{chapter_list = L}}) ->
    lists:sum([Star || #heaven_chapter{star = Star} <- L]).

combat_award(Role, Combat, ChapterId, OrderId, Flag) ->
    {Awards, Drops} = case Flag of
			1 ->
			    dungeon_heaven_data:get_f_award({ChapterId,
							     OrderId});
			_ -> dungeon_heaven_data:get_award({ChapterId, OrderId})
		      end,
    Items1 = case drop_lib:common_drop(Role, Drops) of
	       [{_, DropItems, _, _}] ->
		   [{Bid, Val} || {Bid, _, Val} <- DropItems];
	       _ -> []
	     end,
    AllAward = item_lib:merge(Items1, Awards),
    {ok, DropRole, _} = drop_lib:gain_combat_drop(Role,
						  Combat, 1, AllAward,
						  <<"神装副本通关奖励"/utf8>>,
						  util:fbin("章节:~w 关卡:~w 是否首通~w",
							    [ChapterId, OrderId,
							     Flag])),
    {DropRole, AllAward}.

check_can_combat(Role = #role{m_dun_heaven =
				  #m_dungeon_heaven{count = Count,
						    chapter_list = L}},
		 ChapterId, OrderId) ->
    case check_open(Role) of
      {false, Msg} -> {false, Msg};
      _ when Count =< 0 ->
	  {false, lang:get(<<"Số lần thử thách không đủ"/utf8>>)};
      _ ->
	  case lists:keyfind(ChapterId, #heaven_chapter.id, L) of
	    #heaven_chapter{dun_list = DunList} ->
		case lists:keyfind(OrderId, #heaven_dun.id, DunList) of
		  #heaven_dun{state = 0} ->
		      {false, lang:get(<<"Chương này chưa được mở"/utf8>>)};
		  #heaven_dun{state = State, star_info = StarInfo} ->
		      case dungeon_heaven_data:get_unit_id({ChapterId,
							    OrderId})
			  of
			UnitIds = [_ | _] ->
			    Flag = util:if_true(State == 1, 1, 0),
			    {ok, UnitIds, Flag, StarInfo};
			_ -> {false, lang:get(<<"Lỗi tham số"/utf8>>)}
		      end;
		  _ ->
		      {false,
		       lang:get(<<"Không có thông tin về cấp độ này"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"Chương chưa được mở"/utf8>>)}
	  end
    end.

check_open(#role{lev = Lev}) ->
    LimitWorldLev =
	dungeon_heaven_data:get_constant(open_world_lev),
    WorldLev = world_lev:get_world_lev(),
    LimitLev = dungeon_heaven_data:get_constant(open_lev),
    LimitLev2 =
	dungeon_heaven_data:get_constant(open_lev_second),
    if Lev >= LimitLev2 -> ok;
       LimitWorldLev > WorldLev ->
	   {false,
	    util:fbin(lang:get(<<"Cấp độ thế giới~wcấp trên"/utf8>>),
		      [LimitWorldLev])};
       LimitLev > Lev ->
	   {false,
	    util:fbin(lang:get(<<"~wCấp trên"/utf8>>), [LimitLev])};
       true -> ok
    end.


