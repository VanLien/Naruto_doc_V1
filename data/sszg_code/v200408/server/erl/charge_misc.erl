-file("data/charge_misc.erl", 1).

-file("src/mod/charge/charge_misc.erl", 1).

-module(charge_misc).

-lager_records([{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
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
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{activity, [id, status, name, data, ext_args]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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

-export([handle/1, zero_flush/1, fire_9377_vip/2,
	 first_gift/1, take_first_gift/2, choose_first_gift/2,
	 push_first_gift/1, is_charge/1, triple_rebate/1,
	 has_triple_rebate/1, use_triple_rebate/1,
	 info_triple_rebate/1, do_ref_time/1, charge_sum/1,
	 fire_day_gift/2, push_day_gift/1, fire_loop_gift/2,
	 fire_loop_gift_zero/2, push_loop_gift/2,
	 is_show_week_gift/1, fire_week_gift/2, refresh_loop/2,
	 push_day_gift_ext/1, get_day_gift_ext/1,
	 fire_day_first_charge/2, push_day_first_charge/1,
	 get_day_first_charge/1, skin_mall_buy/2,
	 push_day_gift_open/1, is_charge_loop_gift/2,
	 is_charge_day_gift/2, check_charge/2, merge_flush/1]).

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

-file("src/mod/charge/charge_misc.erl", 54).

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

-file("src/mod/charge/charge_misc.erl", 55).

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

-file("src/mod/charge/charge_misc.erl", 56).

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

-file("src/mod/charge/charge_misc.erl", 57).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/charge/charge_misc.erl", 58).

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

-file("src/mod/charge/charge_misc.erl", 59).

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

-file("src/mod/charge/charge_misc.erl", 60).

-file("inc/log.hrl", 1).

-file("src/mod/charge/charge_misc.erl", 61).

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

-file("src/mod/charge/charge_misc.erl", 62).

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

-file("src/mod/charge/charge_misc.erl", 63).

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

-file("src/mod/charge/charge_misc.erl", 64).

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

-file("src/mod/charge/charge_misc.erl", 65).

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

-file("src/mod/charge/charge_misc.erl", 66).

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

-file("src/mod/charge/charge_misc.erl", 67).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/charge/charge_misc.erl", 68).

-export([gm_reward/2]).

-spec gm_reward(#role{}, pos_integer()) -> {ok,
					    #role{}} |
					   {false, binary()}.

gm_reward(Role = #role{m_charge =
			   MCharge = #m_charge{first_gift = FirstGift}},
	  Id) ->
    NewFirstGift = lists:keystore(Id, 1, FirstGift,
				  {Id, 2}),
    NRole = Role#role{m_charge =
			  MCharge#m_charge{first_gift = NewFirstGift}},
    case take_first_gift(NRole, Id) of
      {ok, _Msg, NewRole} -> {ok, NewRole};
      {false, Msg} -> {false, Msg}
    end.

-spec handle(#role{}) -> {ok, #role{}}.

handle(#role{platform = <<"verifyios">>}) -> ok;
handle(Role = #role{account = Accout,
		    platform = PlatForm, reg_channel = RegChannel,
		    m_charge = #m_charge{day_first_gift = {_, Acc}}}) ->
    AllCharge = charge_sum(Role),
    DayCharge = Acc / 10,
    case (PlatForm =:= <<"9377">> orelse
	    PlatForm =:= <<"9377ios">>)
	   andalso (AllCharge >= 3000 orelse DayCharge >= 2000)
	of
      true -> activity_self:set_activity(803, 1, []);
      _ -> skip
    end,
    case PlatForm =:= <<"symlf">> andalso AllCharge >= 10000
	of
      true ->
	  case RegChannel of
	    <<"16_", _/binary>> ->
		activity_self:set_activity(803, 1, []);
	    <<"47_", _/binary>> ->
		activity_self:set_activity(803, 1, []);
	    <<"syios_", _/binary>> ->
		activity_self:set_activity(803, 1, []);
	    _ -> skip
	  end;
      _ -> skip
    end,
    case PlatForm =:= <<"icebird">> andalso
	   AllCharge >= 3000
	of
      true -> activity_self:set_activity(803, 1, []);
      _ -> skip
    end,
    Role1 = do_ver(Role),
    {_, NRole} = do_ref_time(Role1),
    open_first_gift_ico(NRole),
    open_day_first_gift_ico(NRole),
    {ok, NewRole} = set_timer(NRole),
    {ok, NewRole}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_charge =
			    MCharge = #m_charge{day_gift = DayGift,
						first_gift = FirstGift,
						day_first_gift = DayFirstGift,
						first_gift_ver = Ver}}) ->
    Fun = fun ({Id, 1}, {Rewards, NList}) ->
		  case day_first_gift_award(Id, Ver) of
		    Reward = [_ | _] ->
			{Reward ++ Rewards,
			 lists:keystore(Id, 1, NList, {Id, 2})};
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
			  {__Pidcharge_misc142, _,
			   {__Levelcharge_misc142, __Tracescharge_misc142}}
			      when __Levelcharge_misc142 band 8 /= 0 orelse
				     __Tracescharge_misc142 /= [] ->
			      lager:do_log(error,
					   [{module, charge_misc},
					    {function, zero_flush}, {line, 142},
					    {pid, pid_to_list(self())},
					    {node, node()}
					    | lager:md()],
					   io_lib:format("[~ts]无法获得首充礼包奖励:~w",
							 [Role#role.name, Err]),
					   none, 4096, 8, __Levelcharge_misc142,
					   __Tracescharge_misc142, lager_event,
					   __Pidcharge_misc142);
			  _ -> ok
			end,
			{Rewards, NList}
		  end;
	      (_, Acc) -> Acc
	  end,
    {NRewards, NFirstGift} = lists:foldl(Fun,
					 {[], FirstGift}, FirstGift),
    case NRewards of
      [] -> ok;
      _ ->
	  {Assets, Items} = format:split_assets_items(NRewards),
	  Mail =
	      {lang:get(<<"Phát hành lại phần thưởng nạp lại lần "
			  "đầu"/utf8>>),
	       color:msg(lang:get(<<"Quý Nhẫn Giả: \nĐây là phần thưởng bạn "
				    "chưa nhận được trong sự kiện ~ts. Hãy "
				    "chú ý kiểm tra"/utf8>>),
			 [{green,
			   lang:get(<<"Phần thưởng tiền gửi đầu tiên"/utf8>>)}]),
	       Assets, Items, <<"首充补偿"/utf8>>},
	  role:apply(async, Role#role.pid, {mail, send, [Mail]})
    end,
    NewFirstGift = update_status(NFirstGift, Ver),
    case DayFirstGift of
      {1, _} ->
	  OpenDay = max(1, date:open_srv_day() - 1),
	  {DayAssets, DayItems} =
	      format:split_assets_items(charge_data:day_charge_reward(OpenDay)),
	  DayMail =
	      {lang:get(<<"Phát hành lại phần thưởng nạp lần đầu "
			  "hàng ngày"/utf8>>),
	       color:msg(lang:get(<<"Quý Nhẫn Giả: \nĐây là phần thưởng bạn "
				    "chưa nhận được trong sự kiện ~ts. Hãy "
				    "chú ý kiểm tra"/utf8>>),
			 [{green,
			   lang:get(<<"Khoản tiền gửi đầu tiên hàng ngày"/utf8>>)}]),
	       DayAssets, DayItems, <<"首充补偿"/utf8>>},
	  role:apply(async, Role#role.pid,
		     {mail, send, [DayMail]});
      _ -> ok
    end,
    put(charge_reset_day_gift, DayGift),
    NRole = Role#role{m_charge =
			  MCharge#m_charge{day_gift = [],
					   first_gift = NewFirstGift,
					   day_first_gift = {0, 0}}},
    push_first_gift(NRole),
    open_first_gift_ico(NRole),
    open_day_first_gift_ico(NRole),
    push_day_gift(NRole),
    push_day_gift_ext(NRole),
    {ok, NRole}.

fire_9377_vip(Role = #role{platform = PlatForm,
			   reg_channel = RegChannel, account = Accout,
			   m_charge = #m_charge{day_first_gift = {_, Acc}}},
	      #{money := Money, currency_type := CurrencyType}) ->
    AllCharge = charge_sum(Role) + Money,
    DayCharge = Acc / 10,
    case (PlatForm =:= <<"9377">> orelse
	    PlatForm =:= <<"9377ios">>)
	   andalso (AllCharge >= 3000 orelse DayCharge >= 2000)
	of
      true -> activity_self:set_activity(803, 1, []);
      _ -> skip
    end,
    case PlatForm =:= <<"symlf">> andalso AllCharge >= 10000
	of
      true ->
	  case RegChannel of
	    <<"16_", _/binary>> ->
		activity_self:set_activity(803, 1, []);
	    <<"47_", _/binary>> ->
		activity_self:set_activity(803, 1, []);
	    <<"syios_", _/binary>> ->
		activity_self:set_activity(803, 1, []);
	    _ -> skip
	  end;
      _ -> skip
    end,
    case PlatForm =:= <<"icebird">> andalso
	   AllCharge >= 3000
	of
      true -> activity_self:set_activity(803, 1, []);
      _ -> skip
    end,
    {ok, Role}.

-spec first_gift(#role{}) -> #role{}.

first_gift(Role = #role{assets =
			    #assets{vip_exp = VipExp},
			m_charge =
			    MCharge = #m_charge{first_gift = OldFirstGifts,
						first_gift_ver = Ver = 1,
						choose_first_gift_status =
						    ChooseStatus}}) ->
    FistGiftList = charge_data:day_first_gift_list_new(),
    AddFistGiftList = [Id
		       || Id <- FistGiftList,
			  not lists:keymember(Id, 1, OldFirstGifts) andalso
			    charge_data:get_need_exp_new(Id) =< VipExp],
    AddFirstGift = [{Id, 0} || Id <- AddFistGiftList],
    NewFirstGift = update_status(AddFirstGift, Ver) ++
		     OldFirstGifts,
    NewChooseStatus = util:if_true(VipExp >= 60 andalso
				     ChooseStatus =:= 0,
				   1, ChooseStatus),
    NRole = Role#role{m_charge =
			  MCharge#m_charge{first_gift = NewFirstGift,
					   choose_first_gift_status =
					       NewChooseStatus}},
    Fun2 = fun (Id) ->
		   case lists:keyfind(Id, 1, NewFirstGift) of
		     {_, 2} -> false;
		     _ -> true
		   end
	   end,
    case lists:any(Fun2, FistGiftList) of
      true -> push_first_gift(NRole);
      _ -> ok
    end,
    NRole;
first_gift(Role = #role{assets =
			    #assets{vip_exp = VipExp},
			m_charge =
			    MCharge = #m_charge{first_gift = OldFirstGifts,
						first_gift_ver = 2}}) ->
    FistGiftList = charge_data:day_first_gift_list(),
    AddFistGiftList = [Id
		       || Id <- FistGiftList,
			  not lists:keymember(Id, 1, OldFirstGifts) andalso
			    charge_data:get_need_exp(Id) =< VipExp],
    AddFirstGift = [{Id, 0} || Id <- AddFistGiftList],
    NewFirstGift = update_status(AddFirstGift, 2) ++
		     OldFirstGifts,
    NRole = Role#role{m_charge =
			  MCharge#m_charge{first_gift = NewFirstGift}},
    Fun2 = fun (Id) ->
		   case lists:keyfind(Id, 1, NewFirstGift) of
		     {_, 2} -> false;
		     _ -> true
		   end
	   end,
    case lists:any(Fun2, FistGiftList) of
      true -> push_first_gift(NRole);
      _ -> ok
    end,
    NRole;
first_gift(Role = #role{assets =
			    #assets{vip_exp = VipExp},
			m_charge =
			    MCharge = #m_charge{first_gift = OldFirstGifts,
						first_gift_ver = 3}}) ->
    FistGiftList = charge_data:day_first_gift_list2(),
    AddFistGiftList = [Id
		       || Id <- FistGiftList,
			  not lists:keymember(Id, 1, OldFirstGifts) andalso
			    charge_data:get_need_exp2(Id) =< VipExp],
    AddFirstGift = [{Id, 0} || Id <- AddFistGiftList],
    NewFirstGift = update_status(AddFirstGift, 3) ++
		     OldFirstGifts,
    NRole = Role#role{m_charge =
			  MCharge#m_charge{first_gift = NewFirstGift}},
    Fun2 = fun (Id) ->
		   case lists:keyfind(Id, 1, NewFirstGift) of
		     {_, 2} -> false;
		     _ -> true
		   end
	   end,
    case lists:any(Fun2, FistGiftList) of
      true -> push_first_gift(NRole);
      _ -> ok
    end,
    NRole;
first_gift(Role = #role{assets =
			    #assets{vip_exp = VipExp},
			m_charge =
			    MCharge = #m_charge{first_gift = OldFirstGifts}}) ->
    FistGiftList = charge_data:day_first_gift_list4(),
    AddFistGiftList = [Id
		       || Id <- FistGiftList,
			  not lists:keymember(Id, 1, OldFirstGifts) andalso
			    charge_data:get_need_exp4(Id) =< VipExp],
    AddFirstGift = [{Id, 0} || Id <- AddFistGiftList],
    NewFirstGift = update_status(AddFirstGift, 4) ++
		     OldFirstGifts,
    NRole = Role#role{m_charge =
			  MCharge#m_charge{first_gift = NewFirstGift}},
    Fun2 = fun (Id) ->
		   case lists:keyfind(Id, 1, NewFirstGift) of
		     {_, 2} -> false;
		     _ -> true
		   end
	   end,
    case lists:any(Fun2, FistGiftList) of
      true -> push_first_gift(NRole);
      _ -> ok
    end,
    NRole;
first_gift(Role) -> Role.

update_status(FirstList, Ver) ->
    NFirstList = lists:keysort(1, FirstList),
    Fun = fun ({Id, 0}, {EndStatus, Acc}) ->
		  FId = get_first_gift_fid(Id, Ver),
		  case list_util:keyfind(FId, EndStatus, 0) of
		    0 ->
			NewAcc = lists:keyreplace(Id, 1, Acc, {Id, 1}),
			{lists:keystore(FId, 1, EndStatus, {FId, 1}), NewAcc};
		    _ -> {EndStatus, Acc}
		  end;
	      (_, Acc) -> Acc
	  end,
    {_, NewFirstList} = lists:foldl(Fun, {[], NFirstList},
				    NFirstList),
    NewFirstList.

-spec push_first_gift(#role{}) -> ok.

push_first_gift(Role = #role{m_charge =
				 #m_charge{first_gift = FirstGift,
					   choose_first_gift_status =
					       ChooseStatus,
					   first_gift_ver = 1}}) ->
    Fun = fun (Id, Acc) ->
		  case lists:keyfind(Id, 1, FirstGift) of
		    {_, Status} -> [{Id, Status} | Acc];
		    _ -> [{Id, 0} | Acc]
		  end
	  end,
    FistGiftList = charge_data:day_first_gift_list_new(),
    CliInfo = list_util:keysort(1,
				lists:foldl(Fun, [], FistGiftList)),
    ChooseId = var:get_var(Role, other, 3031, 0),
    role:pack_send(Role, 21012,
		   {ChooseStatus, ChooseId, CliInfo}),
    ok;
push_first_gift(Role = #role{m_charge =
				 #m_charge{first_gift = FirstGift,
					   first_gift_ver = 2}}) ->
    Fun = fun (Id, Acc) ->
		  case lists:keyfind(Id, 1, FirstGift) of
		    {_, Status} -> [{Id, Status} | Acc];
		    _ -> [{Id, 0} | Acc]
		  end
	  end,
    EndTime = var:get_var(Role, other, 3025, 0),
    FistGiftList = charge_data:day_first_gift_list(),
    CliInfo = list_util:keysort(1,
				lists:foldl(Fun, [], FistGiftList)),
    role:pack_send(Role, 21000, {EndTime, CliInfo}),
    ok;
push_first_gift(Role = #role{m_charge =
				 #m_charge{first_gift = FirstGift,
					   first_gift_ver = 3}}) ->
    Fun = fun (Id, Acc) ->
		  case lists:keyfind(Id, 1, FirstGift) of
		    {_, Status} -> [{Id, Status} | Acc];
		    _ -> [{Id, 0} | Acc]
		  end
	  end,
    EndTime = var:get_var(Role, other, 3025, 0),
    FistGiftList = charge_data:day_first_gift_list2(),
    CliInfo = list_util:keysort(1,
				lists:foldl(Fun, [], FistGiftList)),
    role:pack_send(Role, 21030, {EndTime, CliInfo}),
    ok;
push_first_gift(Role = #role{m_charge =
				 #m_charge{first_gift = FirstGift}}) ->
    Fun = fun (Id, Acc) ->
		  case lists:keyfind(Id, 1, FirstGift) of
		    {_, Status} -> [{Id, Status} | Acc];
		    _ -> [{Id, 0} | Acc]
		  end
	  end,
    EndTime = var:get_var(Role, other, 3025, 0),
    FistGiftList = charge_data:day_first_gift_list4(),
    CliInfo = list_util:keysort(1,
				lists:foldl(Fun, [], FistGiftList)),
    role:pack_send(Role, 21032, {EndTime, CliInfo}),
    ok.

-spec take_first_gift(#role{}, pos_integer()) -> {ok,
						  binary(), #role{}} |
						 {false, binary()}.

take_first_gift(Role = #role{m_charge =
				 MCharge = #m_charge{first_gift = FirstGift,
						     first_gift_ver = Ver}},
		Id) ->
    case lists:keyfind(Id, 1, FirstGift) of
      {_, 2} ->
	  {false,
	   lang:get(<<"Bạn đã nhận được gói quà gửi tiền đầu "
		      "tiên"/utf8>>)};
      {_, 1} ->
	  case day_first_gift_award(Id, Ver) of
	    Rewards = [_ | _] ->
		Gains = format:val_to_gain(Rewards,
					   make_charge_first_gift),
		NewFirstGift = lists:keystore(Id, 1, FirstGift,
					      {Id, 2}),
		Role1 = Role#role{m_charge =
				      MCharge#m_charge{first_gift =
							   NewFirstGift}},
		case role_gain:do_notice(Role1, Gains) of
		  {ok, NewRole} ->
		      Ls = get_ls(Id, Ver),
		      log:log_gain(Gains, Role, NewRole, Ls,
				   util:fbin("首充礼包~w", [Id])),
		      push_first_gift(NewRole),
		      open_first_gift_ico(NewRole),
		      case Id =:= 1 andalso Ver =:= 2 orelse
			     Id =:= 1 andalso Ver =:= 3 orelse
			       Id =:= 1 andalso Ver =:= 4 orelse
				 Id =:= 4 andalso Ver =:= 4
			  of
			true -> broadcast_first_gift(NewRole, Rewards, Gains);
			_ -> ok
		      end,
		      {ok, <<>>, NewRole};
		  _ ->
		      {false,
		       lang:get(<<"Ba lô đã đầy và gói quà không thể nhận "
				  "được"/utf8>>)}
		end;
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcharge_misc397, _,
		   {__Levelcharge_misc397, __Tracescharge_misc397}}
		      when __Levelcharge_misc397 band 8 /= 0 orelse
			     __Tracescharge_misc397 /= [] ->
		      lager:do_log(error,
				   [{module, charge_misc},
				    {function, take_first_gift}, {line, 397},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]无法获得首充礼包奖励:~w",
						 [Role#role.name, Err]),
				   none, 4096, 8, __Levelcharge_misc397,
				   __Tracescharge_misc397, lager_event,
				   __Pidcharge_misc397);
		  _ -> ok
		end,
		{false, lang:get(<<"Không thể nhận gói quà"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Hãy quay lại để lấy nó vào ngày mai"/utf8>>)}
    end.

-spec choose_first_gift(#role{}, pos_integer()) -> {ok,
						    #role{}} |
						   {false, binary()}.

choose_first_gift(Role = #role{m_charge =
				   MCharge = #m_charge{first_gift_ver = 1,
						       choose_first_gift_status
							   = 1}},
		  Id) ->
    case lists:keyfind(Id, 1,
		       charge_data:get_const(first_charge_new))
	of
      {_, ItemId} ->
	  GL = format:val_to_gain([{ItemId, 1}],
				  make_charge_first_gift),
	  case role_gain:do_notice(Role, GL) of
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, Role1} ->
		Role2 = Role1#role{m_charge =
				       MCharge#m_charge{choose_first_gift_status
							    = 2}},
		NRole = var:set_var(Role2, other, 3031, Id),
		log:log_gain(GL, Role, NRole, <<"运营活动_首充自选英雄"/utf8>>,
			     util:fbin("自选ID~w", [Id])),
		push_first_gift(NRole),
		open_first_gift_ico(NRole),
		broadcast_first_gift(NRole, [{ItemId, 1}], GL),
		{ok, NRole}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Chọn anh hùng không tồn tại"/utf8>>)}
    end;
choose_first_gift(#role{m_charge =
			    #m_charge{first_gift_ver = 1,
				      choose_first_gift_status = 2}},
		  _Id) ->
    {false, lang:get(<<"Đã nhận được phần thưởng"/utf8>>)};
choose_first_gift(_, _Id) ->
    {false,
     lang:get(<<"Các điều kiện để nhận nó chưa được đáp "
		"ứng."/utf8>>)}.

get_ls(Id, 0) ->
    case get_first_gift_fid(Id, 0) of
      2 -> <<"运营活动_首冲礼包_超值累充"/utf8>>;
      _ -> <<"运营活动_首冲礼包_首冲豪礼"/utf8>>
    end;
get_ls(Id, 1) ->
    case get_first_gift_fid(Id, 1) of
      2 -> <<"运营活动_新首冲礼包_超值累充"/utf8>>;
      _ -> <<"运营活动_新首冲礼包_首冲豪礼"/utf8>>
    end;
get_ls(Id, 2) ->
    case get_first_gift_fid(Id, 2) of
      2 -> <<"运营活动_耶梦首冲礼包_超值累充"/utf8>>;
      _ -> <<"运营活动_耶梦首冲礼包_首冲豪礼"/utf8>>
    end;
get_ls(Id, 3) ->
    case get_first_gift_fid(Id, 3) of
      2 -> <<"运营活动_利维坦首冲礼包_超值累充"/utf8>>;
      _ -> <<"运营活动_利维坦首冲礼包_首冲豪礼"/utf8>>
    end;
get_ls(Id, Ver) ->
    case get_first_gift_fid(Id, Ver) of
      2 -> <<"运营活动_耶梦利维坦首冲礼包_超值累充"/utf8>>;
      _ -> <<"运营活动_耶梦利维坦首冲礼包_首冲豪礼"/utf8>>
    end.

-spec is_charge(#role{}) -> boolean().

is_charge(#role{m_charge =
		    #m_charge{charge_list = ChargeList,
			      merge_charge_list = MergeChargeList,
			      reset_charge_list = ResetChargeList}}) ->
    Fun = fun ({PackId, _N}) ->
		  case charge_data:get(PackId) of
		    #charge_data{val = Val} when Val > 0 -> true;
		    _ -> false
		  end
	  end,
    lists:any(Fun,
	      ChargeList ++ MergeChargeList ++ ResetChargeList);
is_charge(_Role) -> false.

-spec triple_rebate(#role{}) -> #role{}.

triple_rebate(Role = #role{m_charge =
			       MCharge = #m_charge{triple_rebate_list =
						       TripleRebateList},
			   assets = #assets{triple_rebate = TripleExp}}) ->
    List = charge_data:list_triple_rebate(),
    NewTripleRebateList = do_ref(Role, List,
				 TripleRebateList, TripleExp, []),
    NewMCharge = MCharge#m_charge{triple_rebate_list =
				      NewTripleRebateList},
    Role#role{m_charge = NewMCharge};
triple_rebate(Role) -> Role.

-spec has_triple_rebate(#role{}) -> boolean().

has_triple_rebate(#role{m_charge =
			    #m_charge{triple_rebate_list =
					  TripleRebateList}}) ->
    List = [1 || {_, 1} <- TripleRebateList],
    case List of
      [] -> false;
      _ -> true
    end.

-spec use_triple_rebate(#role{}) -> {MinId :: integer(),
				     #role{}} |
				    false.

use_triple_rebate(Role = #role{m_charge =
				   MCharge = #m_charge{triple_rebate_list =
							   TripleRebateList},
			       name = Name}) ->
    List = [Id || {Id, 1} <- TripleRebateList],
    case List of
      [] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge_misc505, _,
	     {__Levelcharge_misc505, __Tracescharge_misc505}}
		when __Levelcharge_misc505 band 8 /= 0 orelse
		       __Tracescharge_misc505 /= [] ->
		lager:do_log(error,
			     [{module, charge_misc},
			      {function, use_triple_rebate}, {line, 505},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]无三倍返利机会", [Name]), none, 4096,
			     8, __Levelcharge_misc505, __Tracescharge_misc505,
			     lager_event, __Pidcharge_misc505);
	    _ -> ok
	  end,
	  false;
      _ ->
	  MinId = lists:min(List),
	  NewTripleRebateList = lists:keyreplace(MinId, 1,
						 TripleRebateList, {MinId, 2}),
	  NewMCharge = MCharge#m_charge{triple_rebate_list =
					    NewTripleRebateList},
	  {MinId, Role#role{m_charge = NewMCharge}}
    end.

-spec info_triple_rebate(#role{}) -> {Count ::
					  integer(),
				      TripleRebateExp :: integer(),
				      NextExp :: integer()}.

info_triple_rebate(#role{m_charge =
			     #m_charge{triple_rebate_list = TripleRebateList},
			 assets = #assets{triple_rebate = TripleRebateExp}}) ->
    Count = length([Id || {Id, 1} <- TripleRebateList]),
    List1 = charge_data:list_triple_rebate(),
    List2 = [Id
	     || {Id, Status} <- TripleRebateList, Status =/= 0],
    RemindList = List1 -- List2,
    NextExp = case RemindList of
		[] -> 0;
		_ ->
		    MinId = lists:min(RemindList),
		    charge_data:get_limit_triple(MinId)
	      end,
    {Count, TripleRebateExp, NextExp}.

-spec fire_day_gift(#role{}, map()) -> {ok, #role{}}.

fire_day_gift(Role = #role{lev = Lev,
			   m_charge = MCharge = #m_charge{day_gift = DayGift},
			   m_vip = #m_vip{lev = VipLev}},
	      Opt = #{package_id := PackageId, sn := Sn,
		      money := Money, currency_type := CurrencyType}) ->
    case charge_data:day_gift(PackageId) of
      {GiftId, LimitCount, LimitVip} ->
	  {_, BuyCount} = list_util:keyfind(GiftId, 1, DayGift,
					    {GiftId, 0}),
	  if BuyCount < LimitCount andalso VipLev >= LimitVip ->
		 Reward = charge_data:day_gift_reward({GiftId, Lev}),
		 GL = format:val_to_gain(Reward, charge_day_gift),
		 case role_gain:do_notice(Role, GL) of
		   {ok, NRole} ->
		       NewDayGift = lists:keystore(GiftId, 1, DayGift,
						   {GiftId, BuyCount + 1}),
		       NRole1 = NRole#role{m_charge =
					       MCharge#m_charge{day_gift =
								    NewDayGift}},
		       Gold = charge_lib:currency_to_gold(CurrencyType, Money),
		       Evts = [#evt_pay{gold = Gold,
					info =
					    #{gold => Gold, package_id => 0,
					      currency_type => rmb, money => 0,
					      sn => <<>>,
					      data_mod => charge_data}},
			       #evt_pay_acc{gold = Gold}],
		       NewRole = role_trigger:fire(Evts, NRole1),
		       push_day_gift(NewRole),
		       log:log_gain(GL, Role, NewRole, <<"运营活动_充值每日礼包"/utf8>>,
				    util:fbin("礼包ID: ~w", [GiftId])),
		       {ok, NewRole};
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
			 {__Pidcharge_misc552, _,
			  {__Levelcharge_misc552, __Tracescharge_misc552}}
			     when __Levelcharge_misc552 band 8 /= 0 orelse
				    __Tracescharge_misc552 /= [] ->
			     lager:do_log(error,
					  [{module, charge_misc},
					   {function, fire_day_gift},
					   {line, 552},
					   {pid, pid_to_list(self())},
					   {node, node()}
					   | lager:md()],
					  io_lib:format("【~ts】玩家激活每日礼包领取【~w】时失败",
							[Role#role.name,
							 GiftId]),
					  none, 4096, 8, __Levelcharge_misc552,
					  __Tracescharge_misc552, lager_event,
					  __Pidcharge_misc552);
			 _ -> ok
		       end,
		       {ok, Role}
		 end;
	     true ->
		 {ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		 log:log_assets(gold, Role, NRole, <<"充值"/utf8>>,
				util:fbin("每日礼包无法领取，改为充值:money=~w,sn=~ts package_id=~w",
					  [Money, Sn, PackageId])),
		 {ok, NRole}
	  end;
      _ -> {ok, Role}
    end.

-spec fire_loop_gift(#role{}, map()) -> {ok, #role{}}.

fire_loop_gift(Role = #role{reg_time = RegTime,
			    m_charge =
				MCharge = #m_charge{week_gift = WeekGift,
						    month_gift = MonthGift}},
	       Opt = #{package_id := PackageId, sn := Sn,
		       money := Money}) ->
    case misc_data:loop_gift(PackageId) of
      {GiftType, LimitCount} ->
	  GiftList = util:if_true(GiftType =:= 1, WeekGift,
				  MonthGift),
	  {_, BuyCount} = list_util:keyfind(PackageId, 1,
					    GiftList, {PackageId, 0}),
	  Now = date:unixtime(),
	  RegDay = date:day_diff(RegTime, Now) + 1,
	  Reward = misc_data:loop_gift_reward({PackageId, RegDay,
					       Role#role.reg_time}),
	  if Reward == [] ->
		 NewGiftList = lists:keystore(PackageId, 1, GiftList,
					      {PackageId, BuyCount + 1}),
		 NRole = case GiftType =:= 1 of
			   true ->
			       Role#role{m_charge =
					     MCharge#m_charge{week_gift =
								  NewGiftList}};
			   _ ->
			       Role#role{m_charge =
					     MCharge#m_charge{month_gift =
								  NewGiftList}}
			 end,
		 push_loop_gift(NRole, GiftType),
		 case {whereis(lager_event), whereis(lager_event),
		       lager_config:get({lager_event, loglevel}, {0, []})}
		     of
		   {undefined, undefined, _} ->
		       fun () -> {error, lager_not_running} end();
		   {undefined, _, _} ->
		       fun () -> {error, {sink_not_configured, lager_event}}
		       end();
		   {__Pidcharge_misc582, _,
		    {__Levelcharge_misc582, __Tracescharge_misc582}}
		       when __Levelcharge_misc582 band 8 /= 0 orelse
			      __Tracescharge_misc582 /= [] ->
		       lager:do_log(error,
				    [{module, charge_misc},
				     {function, fire_loop_gift}, {line, 582},
				     {pid, pid_to_list(self())}, {node, node()}
				     | lager:md()],
				    io_lib:format("【~ts】玩家激活循环礼包【~w】时失败，因为注册天数不对 ~w",
						  [Role#role.name, PackageId,
						   RegDay]),
				    none, 4096, 8, __Levelcharge_misc582,
				    __Tracescharge_misc582, lager_event,
				    __Pidcharge_misc582);
		   _ -> ok
		 end,
		 {ok, NRole};
	     BuyCount < LimitCount ->
		 GL = format:val_to_gain(Reward, charge_loop_gift),
		 case role_gain:do_notice(Role, GL) of
		   {ok, NRole} ->
		       NewGiftList = lists:keystore(PackageId, 1, GiftList,
						    {PackageId, BuyCount + 1}),
		       NRole1 = case GiftType =:= 1 of
				  true ->
				      NRole#role{m_charge =
						     MCharge#m_charge{week_gift
									  =
									  NewGiftList}};
				  _ ->
				      NRole#role{m_charge =
						     MCharge#m_charge{month_gift
									  =
									  NewGiftList}}
				end,
		       Evts = [],
		       NewRole = role_trigger:fire(Evts, NRole1),
		       push_loop_gift(NewRole, GiftType),
		       log:log_gain(GL, Role, NewRole, <<"运营活动_充值循环礼包"/utf8>>,
				    util:fbin("礼包ID: ~w, 注册天数： ~w",
					      [PackageId, RegDay])),
		       {ok, NewRole};
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
			 {__Pidcharge_misc599, _,
			  {__Levelcharge_misc599, __Tracescharge_misc599}}
			     when __Levelcharge_misc599 band 8 /= 0 orelse
				    __Tracescharge_misc599 /= [] ->
			     lager:do_log(error,
					  [{module, charge_misc},
					   {function, fire_loop_gift},
					   {line, 599},
					   {pid, pid_to_list(self())},
					   {node, node()}
					   | lager:md()],
					  io_lib:format("【~ts】玩家激活循环礼包领取【~w】时失败",
							[Role#role.name,
							 PackageId]),
					  none, 4096, 8, __Levelcharge_misc599,
					  __Tracescharge_misc599, lager_event,
					  __Pidcharge_misc599);
			 _ -> ok
		       end,
		       {ok, Role}
		 end;
	     true ->
		 {ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		 log:log_assets(gold, Role, NRole, <<"充值"/utf8>>,
				util:fbin("每日礼包无法领取，改为充值:money=~w,sn=~ts package_id=~w",
					  [Money, Sn, PackageId])),
		 {ok, NRole}
	  end;
      _ -> {ok, Role}
    end.

-spec fire_loop_gift_zero(#role{}, map()) -> {ok,
					      #role{}}.

fire_loop_gift_zero(Role = #role{reg_time = RegTime,
				 m_charge =
				     MCharge = #m_charge{week_gift = WeekGift,
							 month_gift =
							     MonthGift}},
		    PackageId) ->
    case misc_data:loop_gift(PackageId) of
      {GiftType, LimitCount} ->
	  GiftList = util:if_true(GiftType =:= 1, WeekGift,
				  MonthGift),
	  {_, BuyCount} = list_util:keyfind(PackageId, 1,
					    GiftList, {PackageId, 0}),
	  Now = date:unixtime(),
	  RegDay = date:day_diff(RegTime, Now) + 1,
	  Reward = misc_data:loop_gift_reward({PackageId, RegDay,
					       Role#role.reg_time}),
	  case Reward of
	    [_ | _] when BuyCount < LimitCount ->
		GL = format:val_to_gain(Reward, charge_loop_gift),
		case role_gain:do_notice(Role, GL) of
		  {ok, NRole} ->
		      NewGiftList = lists:keystore(PackageId, 1, GiftList,
						   {PackageId, BuyCount + 1}),
		      NRole1 = case GiftType =:= 1 of
				 true ->
				     NRole#role{m_charge =
						    MCharge#m_charge{week_gift =
									 NewGiftList}};
				 _ ->
				     NRole#role{m_charge =
						    MCharge#m_charge{month_gift
									 =
									 NewGiftList}}
			       end,
		      Evts = [],
		      NewRole = role_trigger:fire(Evts, NRole1),
		      charge_mall:push_point(NewRole),
		      push_loop_gift(NewRole, GiftType),
		      log:log_gain(GL, Role, NewRole, <<"运营活动_充值循环礼包"/utf8>>,
				   util:fbin("礼包ID: ~w, 注册天数： ~w",
					     [PackageId, RegDay])),
		      {ok, NewRole};
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
			{__Pidcharge_misc638, _,
			 {__Levelcharge_misc638, __Tracescharge_misc638}}
			    when __Levelcharge_misc638 band 8 /= 0 orelse
				   __Tracescharge_misc638 /= [] ->
			    lager:do_log(error,
					 [{module, charge_misc},
					  {function, fire_loop_gift_zero},
					  {line, 638},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("【~ts】玩家激活循环礼包领取【~w】时失败",
						       [Role#role.name,
							PackageId]),
					 none, 4096, 8, __Levelcharge_misc638,
					 __Tracescharge_misc638, lager_event,
					 __Pidcharge_misc638);
			_ -> ok
		      end,
		      {false, lang:get(<<"Mua hàng không thành công"/utf8>>)}
		end;
	    _ ->
		{false,
		 lang:get(<<"Gói quà tặng này đã đạt đến giới hạn "
			    "mua"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Gói quà tặng này không có sẵn để mua"/utf8>>)}
    end.

-spec fire_day_first_charge(#role{}, map()) -> {ok,
						#role{}}.

fire_day_first_charge(Role = #role{m_charge =
				       MCharge = #m_charge{day_first_gift =
							       {Status, Acc}}},
		      #{money := Money, currency_type := CurrencyType}) ->
    Gold = charge_lib:currency_to_gold(CurrencyType, Money),
    NewAcc = Acc + Gold,
    NewStatus = util:if_true(Status =:= 0 andalso
			       NewAcc >= charge_data:get_const(day_charge_goal),
			     1, Status),
    NewRole = Role#role{m_charge =
			    MCharge#m_charge{day_first_gift =
						 {NewStatus, NewAcc}}},
    push_day_first_charge(NewRole),
    {ok, NewRole};
fire_day_first_charge(Role, _) -> {ok, Role}.

push_day_gift(#role{m_charge =
			#m_charge{day_gift = DayGift}}) ->
    sys_conn:pack_send(21006, {DayGift}), ok.

push_day_gift_open(NewVipLev) ->
    case charge_data:day_gift_open_id(NewVipLev) of
      L = [_ | _] -> sys_conn:pack_send(21015, {L});
      _ -> ok
    end.

push_loop_gift(#role{reg_time = RegTime,
		     m_charge =
			 #m_charge{week_refresh = WeekRefresh,
				   month_refresh = MonthRefresh,
				   week_gift = WeekGift,
				   month_gift = MonthGift}},
	       GiftType) ->
    RegDay = date:day_diff(RegTime, date:unixtime()) + 1,
    {Refresh, RewardType, GiftL} = case GiftType =:= 1 of
				     true -> {WeekRefresh, RegDay, WeekGift};
				     _ -> {MonthRefresh, RegDay, MonthGift}
				   end,
    sys_conn:pack_send(21007,
		       {GiftType, Refresh, RewardType, GiftL}),
    ok.

is_show_week_gift(Role) ->
    AllCharge = charge_misc:charge_sum(Role),
    case AllCharge >=
	   charge_data:get_const(week_gift_charge_sum)
	of
      true -> sys_conn:pack_send(21021, {1});
      _ -> sys_conn:pack_send(21021, {0})
    end.

fire_week_gift(Role, #{money := Money}) ->
    ChargeSum = charge_misc:charge_sum(Role) + Money,
    case ChargeSum >=
	   charge_data:get_const(week_gift_charge_sum)
	of
      true -> sys_conn:pack_send(21021, {1});
      _ -> skip
    end,
    {ok, Role}.

set_timer(Role = #role{misc =
			   #role_misc{reg_zero_time = RegTime},
		       m_charge =
			   MCharge = #m_charge{week_refresh = WeekRefresh,
					       month_refresh =
						   MonthRefresh}}) ->
    Now = date:unixtime(),
    NewWeekRefresh = util:if_true(WeekRefresh =:= 0,
				  RegTime + 86400 * 7, WeekRefresh),
    NewMonthRefresh = util:if_true(MonthRefresh =:= 0,
				   RegTime + 86400 * 30, MonthRefresh),
    Role1 = Role#role{m_charge =
			  MCharge#m_charge{week_refresh = NewWeekRefresh,
					   month_refresh = NewMonthRefresh}},
    Role2 = role_timer:set(#timer{id =
				      {loop_gift_refresh, 1},
				  timeout = max(1, NewWeekRefresh - Now) * 1000,
				  m = charge_misc, f = refresh_loop, a = [1]},
			   Role1),
    Role3 = role_timer:set(#timer{id =
				      {loop_gift_refresh, 2},
				  timeout =
				      max(1, NewMonthRefresh - Now) * 1000,
				  m = charge_misc, f = refresh_loop, a = [2]},
			   Role2),
    {ok, Role3}.

-spec refresh_loop(#role{}, pos_integer()) -> {ok,
					       #role{}}.

refresh_loop(Role = #role{id = RoleId,
			  misc = #role_misc{reg_zero_time = RegTime},
			  m_charge =
			      MCharge = #m_charge{week_gift = WeekGift,
						  week_refresh = WeekRefresh}},
	     1) ->
    Now = date:unixtime(),
    case Now >= WeekRefresh of
      true ->
	  RegDay = date:day_diff(RegTime, Now) + 1,
	  NowWeek = (RegDay - 1) div 7 + 1,
	  NewWeekRefresh = RegTime + 604800 * NowWeek,
	  case NowWeek == 2 andalso
		 lists:keymember(407, 1, WeekGift) andalso
		   misc_data:loop_gift_reward({407, 7, Role#role.reg_time})
		     == []
	      of
	    true ->
		NRole = Role#role{m_charge =
				      MCharge#m_charge{week_gift = [{407, 1}],
						       week_refresh =
							   NewWeekRefresh}},
		set_timer(NRole);
	    _ ->
		RoleList = [{895, <<"9377ios_27">>},
			    {2266, <<"9377ios_19">>}, {2173, <<"9377ios_14">>},
			    {2241, <<"symix_455">>}, {1117, <<"symix2_341">>},
			    {398, <<"symlf_1601">>}, {2291, <<"symlf_1581">>},
			    {3814, <<"symlf_1569">>}, {942, <<"symlf_1553">>},
			    {3730, <<"symlf_1547">>}, {2821, <<"symlf_1541">>},
			    {1260, <<"symlf_1535">>}, {934, <<"symlf_1529">>},
			    {3264, <<"dev_1">>}],
		case NowWeek == 2 andalso
		       lists:member(RoleId, RoleList) andalso
			 misc_data:loop_gift_reward({407, 7,
						     Role#role.reg_time})
			   == []
		    of
		  true ->
		      NRole = Role#role{m_charge =
					    MCharge#m_charge{week_gift =
								 [{407, 1}],
							     week_refresh =
								 NewWeekRefresh}},
		      set_timer(NRole);
		  _ ->
		      NRole = Role#role{m_charge =
					    MCharge#m_charge{week_gift = [],
							     week_refresh =
								 NewWeekRefresh}},
		      set_timer(NRole)
		end
	  end;
      _ -> ok
    end;
refresh_loop(Role = #role{misc =
			      #role_misc{reg_zero_time = RegTime},
			  m_charge =
			      MCharge = #m_charge{month_refresh =
						      MonthRefresh}},
	     2) ->
    Now = date:unixtime(),
    case Now >= MonthRefresh of
      true ->
	  RegDay = date:day_diff(RegTime, Now) + 1,
	  NowMonth = (RegDay - 1) div 30 + 1,
	  NewMonthRefresh = RegTime + NowMonth * (86400 * 30),
	  NRole = Role#role{m_charge =
				MCharge#m_charge{month_gift = [],
						 month_refresh =
						     NewMonthRefresh}},
	  set_timer(NRole);
      _ -> ok
    end;
refresh_loop(_, _) -> ok.

-spec push_day_gift_ext(#role{}) -> ok.

push_day_gift_ext(Role) ->
    IsGain = var:get_var(Role, day, 46, 0),
    sys_conn:pack_send(21008, {IsGain}),
    ok.

-spec get_day_gift_ext(#role{}) -> {false,
				    bitstring()} |
				   {ok, #role{}}.

get_day_gift_ext(Role) ->
    IsGain = var:get_var(Role, day, 46, 0),
    case IsGain =:= 1 of
      true ->
	  {false, lang:get(<<"Đã nhận được hôm nay"/utf8>>)};
      _ ->
	  Reward = charge_data:get_const(day_gift_gift),
	  GL = format:val_to_gain(Reward, day_gift_gift),
	  case role_gain:do_notice(Role, GL) of
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, NRole} ->
		NewRole = var:set_var(NRole, day, 46, 1),
		push_day_gift_ext(NewRole),
		log:log_gain(GL, Role, NewRole, <<"每日礼"/utf8>>,
			     lang:get(<<"Nhận quà hàng ngày"/utf8>>)),
		{ok, NewRole}
	  end
    end.

-spec push_day_first_charge(#role{}) -> ok.

push_day_first_charge(#role{m_charge =
				#m_charge{day_first_gift = {Status, Acc}}}) ->
    sys_conn:pack_send(21010, {Status, Acc}), ok.

-spec get_day_first_charge(#role{}) -> {false,
					bitstring()} |
				       {ok, #role{}}.

get_day_first_charge(Role = #role{m_charge =
				      MCharge = #m_charge{day_first_gift =
							      {Status,
							       Acc}}}) ->
    if Status =:= 0 ->
	   {false,
	    lang:get(<<"Không đáp ứng đủ điều kiện để nhận"/utf8>>)};
       Status =:= 2 ->
	   {false, lang:get(<<"Gói quà đã được thu thập"/utf8>>)};
       true ->
	   OpenDay = date:open_srv_day(),
	   Reward = charge_data:day_charge_reward(OpenDay),
	   GL = format:val_to_gain(Reward, day_charge_reward),
	   case role_gain:do_notice(Role, GL) of
	     {false, #gain{msg = Msg}} -> {false, Msg};
	     {ok, NRole} ->
		 NewRole = NRole#role{m_charge =
					  MCharge#m_charge{day_first_gift =
							       {2, Acc}}},
		 push_day_first_charge(NewRole),
		 open_day_first_gift_ico(NewRole),
		 log:log_gain(GL, Role, NewRole, <<"每日首充"/utf8>>,
			      lang:get(<<"Nhận tiền gửi đầu tiên hàng ngày"/utf8>>)),
		 {ok, NewRole}
	   end
    end.

-spec skin_mall_buy(#role{}, map()) -> {ok, #role{}}.

skin_mall_buy(Role = #role{lev = Lev,
			   partner_bag = #partner_bag{partner_skins = Skins}},
	      Opt = #{package_id := PackageId, sn := Sn,
		      money := Money, currency_type := CurrencyType}) ->
    case charge_mall_data:get_item(PackageId) of
      {Reward, SkinId} ->
	  [{BaseId, _} | _] = lists:reverse(Reward),
	  {_, HasNum} = package:count(by_base_id, BaseId,
				      Role#role.p_bag),
	  Flag = case lists:keyfind(SkinId, #partner_skin.id,
				    Skins)
		     of
		   #partner_skin{end_time = 0} -> true;
		   _ -> false
		 end,
	  if HasNum =:= 0 andalso Flag =/= true ->
		 GL = format:val_to_gain(Reward, skin_mall_buy),
		 case role_gain:do_notice(Role, GL) of
		   {ok, NRole} ->
		       Gold = charge_lib:currency_to_gold(CurrencyType, Money),
		       Evts = [#evt_pay{gold = Gold,
					info =
					    #{gold => Gold, package_id => 0,
					      currency_type => rmb, money => 0,
					      sn => <<>>,
					      data_mod => charge_data}},
			       #evt_pay_acc{gold = Gold}],
		       NewRole = role_trigger:fire(Evts, NRole),
		       log:log_gain(GL, Role, NewRole, <<"皮肤直购"/utf8>>,
				    util:fbin("礼包ID: ~w", [PackageId])),
		       {ok, NewRole};
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
			 {__Pidcharge_misc839, _,
			  {__Levelcharge_misc839, __Tracescharge_misc839}}
			     when __Levelcharge_misc839 band 8 /= 0 orelse
				    __Tracescharge_misc839 /= [] ->
			     lager:do_log(error,
					  [{module, charge_misc},
					   {function, skin_mall_buy},
					   {line, 839},
					   {pid, pid_to_list(self())},
					   {node, node()}
					   | lager:md()],
					  io_lib:format("【~ts】Người chơi mua skin trực tiếp【~w】thất "
							"bại khi",
							[Role#role.name,
							 PackageId]),
					  none, 4096, 8, __Levelcharge_misc839,
					  __Tracescharge_misc839, lager_event,
					  __Pidcharge_misc839);
			 _ -> ok
		       end,
		       {ok, Role}
		 end;
	     true ->
		 {ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		 log:log_assets(gold, Role, NRole, <<"Nạp tiền"/utf8>>,
				util:fbin("Skin không thể mua trực tiếp, thay vào "
					  "đó hãy nạp tiền:money=~w,sn=~ts package_id=~w",
					  [Money, Sn, PackageId])),
		 {ok, NRole}
	  end;
      _ -> {ok, Role}
    end.

charge_sum(#role{m_charge =
		     #m_charge{charge_list = ChargeList,
			       merge_charge_list = MergeChargeList,
			       reset_charge_list = ResetChargeList}}) ->
    Fun = fun ({PackId, N}, Acc) ->
		  case charge_data:get(PackId) of
		    #charge_data{val = Val}
			when is_integer(Val) andalso Val > 0 ->
			Acc + Val * N;
		    _ -> Acc
		  end
	  end,
    lists:foldl(Fun, 0,
		ChargeList ++ MergeChargeList ++ ResetChargeList);
charge_sum(_Role) -> 0.

open_first_gift_ico(#role{m_charge =
			      #m_charge{first_gift = FirstGift,
					first_gift_ver = 0}})
    when FirstGift =/= [] ->
    FistGiftList = charge_data:day_first_gift_list(),
    Fun = fun (Id) ->
		  case lists:keyfind(Id, 1, FirstGift) of
		    {_, 2} -> false;
		    _ -> true
		  end
	  end,
    case lists:any(Fun, FistGiftList) of
      true -> activity_self:set_activity(502, 1, []);
      _ -> activity_self:set_activity(502, 0, [])
    end,
    ok;
open_first_gift_ico(#role{m_charge =
			      #m_charge{first_gift = FirstGift,
					choose_first_gift_status = ChooseStatus,
					first_gift_ver = 1}})
    when FirstGift =/= [] ->
    FistGiftList = charge_data:day_first_gift_list_new(),
    Fun = fun (Id) ->
		  case lists:keyfind(Id, 1, FirstGift) of
		    {_, 2} -> false;
		    _ -> true
		  end
	  end,
    case lists:any(Fun, FistGiftList) orelse
	   ChooseStatus =/= 2
	of
      true -> activity_self:set_activity(512, 1, []);
      _ -> activity_self:set_activity(512, 0, [])
    end,
    ok;
open_first_gift_ico(#role{m_charge =
			      #m_charge{first_gift = FirstGift,
					first_gift_ver = 2}}) ->
    FistGiftList = charge_data:day_first_gift_list(),
    Fun = fun (Id) ->
		  case lists:keyfind(Id, 1, FirstGift) of
		    {_, 2} -> false;
		    _ -> true
		  end
	  end,
    case lists:any(Fun, FistGiftList) of
      true -> activity_self:set_activity(522, 1, []);
      _ -> activity_self:set_activity(522, 0, [])
    end,
    ok;
open_first_gift_ico(#role{m_charge =
			      #m_charge{first_gift = FirstGift,
					first_gift_ver = 3}}) ->
    FistGiftList = charge_data:day_first_gift_list2(),
    Fun = fun (Id) ->
		  case lists:keyfind(Id, 1, FirstGift) of
		    {_, 2} -> false;
		    _ -> true
		  end
	  end,
    case lists:any(Fun, FistGiftList) of
      true -> activity_self:set_activity(523, 1, []);
      _ -> activity_self:set_activity(523, 0, [])
    end,
    ok;
open_first_gift_ico(#role{m_charge =
			      #m_charge{first_gift = FirstGift}}) ->
    FistGiftList = charge_data:day_first_gift_list4(),
    Fun = fun (Id) ->
		  case lists:keyfind(Id, 1, FirstGift) of
		    {_, 2} -> false;
		    _ -> true
		  end
	  end,
    case lists:any(Fun, FistGiftList) of
      true -> activity_self:set_activity(524, 1, []);
      _ -> activity_self:set_activity(524, 0, [])
    end,
    ok.

open_day_first_gift_ico(#role{m_charge =
				  #m_charge{day_first_gift = DayFirstGift}}) ->
    case DayFirstGift of
      {2, _} -> activity_self:set_activity(501, 0, []);
      _ -> activity_self:set_activity(501, 1, [])
    end.

broadcast_first_gift(#role{partner_bag =
			       #partner_bag{partner_list = List},
			   name = Name, id = RoleId},
		     Rewards, _Gains) ->
    Fun = fun (Tuple) when is_tuple(Tuple) ->
		  BaseId = element(1, Tuple),
		  case item_data:get(BaseId) of
		    #item_base{effect = [{27, {PartnerBid, _, _}}]} ->
			case lists:keyfind(PartnerBid, #partner.bid, List) of
			  Partner = #partner{} -> {true, Partner};
			  _Err ->
			      BaseData = partner_data:get_base(PartnerBid),
			      {true, BaseData}
			end;
		    _ -> false
		  end;
	      (Unknow) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidcharge_misc984, _,
		     {__Levelcharge_misc984, __Tracescharge_misc984}}
			when __Levelcharge_misc984 band 8 /= 0 orelse
			       __Tracescharge_misc984 /= [] ->
			lager:do_log(error,
				     [{module, charge_misc},
				      {function, broadcast_first_gift},
				      {line, 984}, {pid, pid_to_list(self())},
				      {node, node()}
				      | lager:md()],
				     io_lib:format("[~ts]Cấu hình gói quà lần đầu nạp sai:~w, "
						   "Rewards:~w",
						   [Name, Unknow, Rewards]),
				     none, 4096, 8, __Levelcharge_misc984,
				     __Tracescharge_misc984, lager_event,
				     __Pidcharge_misc984);
		    _ -> ok
		  end,
		  false
	  end,
    Msg = case lists:filtermap(Fun, Rewards) of
	    [Partner = #partner{} | _] ->
		PtnMsg = color:format({partner, RoleId, Partner}),
		util:fbin(lang:get(<<"~ts Kích hoạt gói quà tặng trị giá 300 "
				     "nguyên thủ quốc gia để nạp tiền và nhận "
				     "được những anh hùng 5 sao mạnh mẽ~ts "
				     "Cùng với anh ta, đẩy bản đồ và cất cánh! "
				     "~ts"/utf8>>),
			  [color:format({role, Name}), PtnMsg,
			   color:format({href,
					 {37, green, [],
					  lang:get(<<"【Tôi muốn nạp tiền】"/utf8>>)}})]);
	    [PartnerBaseData = #partner_base_data{} | _] ->
		PtnMsg = color:format({partner, PartnerBaseData}),
		util:fbin(lang:get(<<"~ts Kích hoạt gói quà tặng trị giá 300 "
				     "nguyên thủ quốc gia để nạp tiền và nhận "
				     "được những anh hùng 5 sao mạnh mẽ~ts "
				     "Cùng với anh ta, đẩy bản đồ và cất cánh! "
				     "~ts"/utf8>>),
			  [color:format({role, Name}), PtnMsg,
			   color:format({href,
					 {37, green, [],
					  lang:get(<<"【Tôi muốn nạp tiền】"/utf8>>)}})]);
	    _ -> <<>>
	  end,
    notice:broadcast(rumor_left_top, Msg),
    ok.

do_ref(_Role, [], _TiredCharge, _VipExp, L) -> L;
do_ref(Role, [Id | List], TripleRebateList, TripleExp,
       L) ->
    case lists:keyfind(Id, 1, TripleRebateList) of
      {Id, Status} when Status =/= 0 ->
	  do_ref(Role, List, TripleRebateList, TripleExp,
		 [{Id, Status} | L]);
      _ ->
	  Limit = charge_data:get_limit_triple(Id),
	  Status2 = util:if_true(Limit > TripleExp, 0, 1),
	  case Status2 == 1 of
	    true ->
		#triple_rebate_data{mail_title = Title,
				    mail_content = Content} =
		    charge_data:get_triple_rebate(Id),
		mail:send(Role,
			  {Title, util:fbin(Content, []), [], [], Title}),
		do_ref(Role, List, TripleRebateList, TripleExp,
		       [{Id, Status2} | L]);
	    _ ->
		do_ref(Role, List, TripleRebateList, TripleExp,
		       [{Id, Status2} | L])
	  end
    end.

merge_flush(Role = #role{m_charge =
			     MCharge = #m_charge{charge_list = ChargeList,
						 merge_charge_list =
						     MergeChargeList},
			 assets = Assets}) ->
    NewMergeChargeList =
	list_util:mix_key_val(MergeChargeList, ChargeList),
    NewMCharge = MCharge#m_charge{triple_rebate_list = [],
				  merge_charge_list = NewMergeChargeList,
				  charge_list = []},
    NewAssets = Assets#assets{triple_rebate = 0},
    NewRole = Role#role{m_charge = NewMCharge,
			assets = NewAssets},
    {ok, NewRole}.

-spec do_ref_time(#role{}) -> {ok, #role{}}.

do_ref_time(Role) ->
    EndTime = var:get_var(Role, other, 3025, 0),
    Now = date:unixtime(),
    NextRefTime = case Now >= EndTime of
		    true -> Now + 3600 * 36;
		    _ -> EndTime
		  end,
    NRole = var:set_var(Role, other, 3025, NextRefTime),
    case NextRefTime =:= EndTime of
      false -> push_first_gift(NRole);
      _ -> skip
    end,
    Timeout = max(NextRefTime - Now, 1),
    Timer = #timer{id = first_gift_timer,
		   timeout = Timeout * 1000, m = charge_misc,
		   f = do_ref_time},
    {ok, role_timer:set(Timer, NRole)}.

do_ver(Role = #role{m_charge =
			MCharge = #m_charge{first_gift = [],
					    first_gift_ver = 0}}) ->
    OpenTime = sys_env:get(open_timestamp),
    FirstGiftVer = case OpenTime >=
			  date:parse_time(charge_data:get_const(charge_time_newchange))
		       of
		     true ->
			 case OpenTime >=
				date:parse_time(charge_data:get_const(first_charge_ver4_time))
			     of
			   true -> 4;
			   _ -> 3
			 end;
		     _ -> 2
		   end,
    Role#role{m_charge =
		  MCharge#m_charge{first_gift_ver = FirstGiftVer}};
do_ver(Role) -> Role.

day_first_gift_award(Id, 1) ->
    charge_data:day_first_gift_award_new(Id);
day_first_gift_award(Id, 2) ->
    charge_data:day_first_gift_award(Id);
day_first_gift_award(Id, 3) ->
    charge_data:day_first_gift_award2(Id);
day_first_gift_award(Id, _) ->
    charge_data:day_first_gift_award4(Id).

get_first_gift_fid(Id, 1) ->
    charge_data:gte_first_gift_fid_new(Id);
get_first_gift_fid(Id, 2) ->
    charge_data:gte_first_gift_fid(Id);
get_first_gift_fid(Id, 3) ->
    charge_data:gte_first_gift_fid2(Id);
get_first_gift_fid(Id, _) ->
    charge_data:gte_first_gift_fid4(Id).

-spec is_charge_loop_gift(#role{},
			  pos_integer()) -> boolean().

is_charge_loop_gift(Role = #role{m_charge =
				     #m_charge{month_gift = MonthGift}},
		    ChargeId) ->
    case misc_data:loop_gift(ChargeId) of
      {GiftType, LimitCount} when GiftType =:= 2 ->
	  {_, BuyCount} = list_util:keyfind(ChargeId, 1,
					    MonthGift, {ChargeId, 0}),
	  case BuyCount < LimitCount of
	    true -> true;
	    _ -> push_loop_gift(Role, GiftType), false
	  end;
      _ -> true
    end.

-spec is_charge_day_gift(#role{},
			 pos_integer()) -> boolean().

is_charge_day_gift(Role = #role{m_charge =
				    #m_charge{day_gift = DayGift},
				m_vip = #m_vip{lev = VipLev}},
		   ChargeId) ->
    case charge_data:day_gift(ChargeId) of
      {GiftId, LimitCount, LimitVip} ->
	  {_, BuyCount} = list_util:keyfind(GiftId, 1, DayGift,
					    {GiftId, 0}),
	  case BuyCount < LimitCount andalso VipLev >= LimitVip of
	    true -> true;
	    _ -> push_day_gift(Role), false
	  end;
      _ -> true
    end.

check_charge(Role, ChargeId) ->
    CheckList = [{privilege, is_charge_privilege, []},
		 {charge_misc, is_charge_loop_gift, []},
		 {charge_misc, is_charge_day_gift, []},
		 {holiday_rule_charge, is_holiday_charge, []},
		 {holiday_war_order, is_charge_war_order, []},
		 {arena_elite_war_order, is_charge_arena_elite_war_order,
		  []},
		 {planes_war_order, is_charge_planes_war_order, []},
		 {holiday_new_war_order, is_charge_new_war_order, []}],
    do_check_charge(CheckList, Role, ChargeId).

do_check_charge([], _Role, _ChargeId) -> true;
do_check_charge([{Mod, Fun, Args} | T], Role,
		ChargeId) ->
    case apply(Mod, Fun, [Role, ChargeId | Args]) of
      true -> do_check_charge(T, Role, ChargeId);
      _ -> false
    end.


