-file("src/mod/secret_dun/secret_dun.erl", 1).

-module(secret_dun).

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
		{home_unit_data,
		 [bid, name, type, dir, set_id, soft, tile_list_1,
		  tile_list_2, effect_count]},
		{home_role_rank, [id, rank]},
		{home_rank_rc,
		 [id, name, lev, face, avatar_bid, time, cache_time,
		  worship_num, visit_num, soft, score, rank,
		  face_update_time, face_file]},
		{home_unit_set, [set_id, reward, collect]},
		{home_rand_visit,
		 [id, name, lev, sex, face, power, last_login, soft,
		  face_update_time, face_file]},
		{home_log,
		 [id, name, face, lev, is_friend, type, time, int_args,
		  str_args, face_update_time, face_file]},
		{home_visitor, [id, name, look_id, time, is_leave]},
		{home_unit, [ver, bid, index, dir]},
		{home_ext, [id, visitors, log]},
		{home_floor,
		 [floor, wall_bid, land_bid, soft, home_unit]},
		{home,
		 [ver, id, name, look_id, bid, wall_bid, land_bid, soft,
		  home_unit, floor_list, log, open_floor, main_floor]},
		{m_home,
		 [ver, num, buy_num, list, day_visitors, soft, max_soft,
		  look_id, look_list, last_visitors, worship,
		  worship_list, rand_list, last_rand_time, set_list,
		  last_hook_time, acc_hook_time, acc_hook_items,
		  open_floor, floor_list, main_floor, max_sum_soft]},
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
		{map_data,
		 [bid, type, name, def_xy, min_lev, max_lev, condition,
		  relive, width, height, grid_x, grid_y, max_pre_layer,
		  start_type, is_single, unit_list, tile_res_list]},
		{map_grid, [map_pid, map_id, base_id, width, height]},
		{map,
		 [id, srv_id, base_id, res_id, pid, ctrl_pid, grid_info,
		  name, condition, num, max_pre_layer, width, height,
		  dynamic_block, layer_flag]},
		{load_partner,
		 [ver, pos, bid, lev, name, star, break_skills,
		  set_skills, skills, break_lev, power, use_skin,
		  end_time, all_attr, base_attr, eqms, artifacts,
		  holy_eqm, dower_skill, ext]},
		{secret_item, [ver, id, base_id, num]},
		{evt_data,
		 [id, type, ext, win_delete, false_delete,
		  win_reward_time, win_reward_list, false_reward_time,
		  false_reward_list, exchange_id, group_id]},
		{secret_tile,
		 [ver, index, is_walk, status, evtid, win_reward_time,
		  false_reward_time, res_id, is_born, ext, defend_radio,
		  platform, switch, is_hide]},
		{secret_floor,
		 [ver, floor, index, map_id, tile_list, walk_tile,
		  fight_ids]},
		{m_secret_dun,
		 [ver, dun_id, dun_floor, val, max_val, floor_list,
		  dun_ids, reward_dun_ids, update_time, partners_hp_radio,
		  bag, bag_next_id, buffs, session_ids, load_partners,
		  load_partners_next_id, dun_power, formation]},
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

-export([init/0, push/2, push/3, moveto/2, enter_dun/2,
	 enter_floor/2, gm_reset/1, session/2,
	 get_first_reward/2, gm_pass/2, gm_dun/2, gm_buff/2,
	 get_formation/2, get_next_update_unixtime/0,
	 zero_flush/1, check_formation_pos_info/4,
	 is_open_holiday/1, repair/0, repair/1, login/1,
	 repair_reset/1, repair_reset/0, get_formation/1,
	 can_skip_combat/1]).

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

-file("src/mod/secret_dun/secret_dun.erl", 35).

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

-file("src/mod/secret_dun/secret_dun.erl", 36).

-file("inc/secret_dun.hrl", 1).

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

-file("inc/secret_dun.hrl", 7).

-record(m_secret_dun,
	{ver = 3  :: pos_integer(),
	 dun_id = 0  :: pos_integer(),
	 dun_floor = 1  :: pos_integer(),
	 val = 0  :: pos_integer(),
	 max_val = 0  :: pos_integer(),
	 floor_list = []  :: list(), dun_ids = []  :: list(),
	 reward_dun_ids = []  :: list(),
	 update_time = 0  :: pos_integer(),
	 partners_hp_radio = []  :: list(), bag = []  :: list(),
	 bag_next_id = 1  :: list(), buffs = []  :: list(),
	 session_ids = []  :: list(),
	 load_partners = []  :: list(),
	 load_partners_next_id = 1  :: pos_integer(),
	 dun_power = 0  :: pos_integer(),
	 formation = {1, [], 0}  :: tuple()}).

-record(secret_floor,
	{ver = 2  :: pos_integer(), floor = 1  :: pos_integer(),
	 index = 0  :: pos_integer(), map_id  :: pos_integer(),
	 tile_list = []  :: list(), walk_tile = []  :: list(),
	 fight_ids = []  :: list()}).

-record(secret_tile,
	{ver = 1  :: pos_integer(), index = 0  :: pos_integer(),
	 is_walk = 0  :: pos_integer(),
	 status = 3  :: pos_integer(),
	 evtid = 0  :: pos_integer(),
	 win_reward_time = 0  :: pos_integer(),
	 false_reward_time = 0  :: pos_integer(),
	 res_id = 0  :: pos_integer(),
	 is_born = 0  :: pos_integer(), ext = []  :: list(),
	 defend_radio = []  :: list(),
	 platform = 0  :: boolean(), switch = 0  :: boolean(),
	 is_hide = 0  :: boolean()}).

-record(evt_data,
	{id = 0  :: pos_integer(), type = 0  :: pos_integer(),
	 ext = []  :: list(), win_delete = 1  :: boolean(),
	 false_delete = 1  :: boolean(),
	 win_reward_time = 1  :: pos_integer(),
	 win_reward_list = []  :: list(),
	 false_reward_time = 1  :: pos_integer(),
	 false_reward_list = []  :: list(),
	 exchange_id = -1  :: pos_integer(),
	 group_id = 0  :: pos_integer()}).

-record(secret_item,
	{ver = 1  :: pos_integer(), id = 1  :: pos_integer(),
	 base_id = 0  :: pos_integer(),
	 num = 0  :: pos_integer()}).

-record(load_partner,
	{ver = 1  :: pos_integer(), pos = 1  :: pos_integer(),
	 bid = 1  :: pos_integer(), lev = 1  :: pos_integer(),
	 name = <<>>  :: binary(), star = 1  :: pos_integer(),
	 break_skills = []  :: list(),
	 set_skills = []  :: list(), skills = []  :: list(),
	 break_lev = 1  :: pos_integer(),
	 power = 1  :: pos_integer(),
	 use_skin = 0  :: pos_integer(),
	 end_time = 1  :: pos_integer(),
	 all_attr = #attr{}  :: #attr{},
	 base_attr = #attr{}  :: #attr{}, eqms = []  :: list(),
	 artifacts = []  :: list(), holy_eqm = []  :: list(),
	 dower_skill = []  :: list(), ext = []  :: list()}).

-file("src/mod/secret_dun/secret_dun.erl", 37).

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

-file("src/mod/secret_dun/secret_dun.erl", 38).

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

-file("src/mod/secret_dun/secret_dun.erl", 39).

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

-file("src/mod/secret_dun/secret_dun.erl", 40).

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

-file("src/mod/secret_dun/secret_dun.erl", 41).

-file("inc/home.hrl", 1).

-record(m_home,
	{ver = 3, num = 0, buy_num = 0, list = [],
	 day_visitors = [], soft = 0, max_soft = 0, look_id = 0,
	 look_list = [], last_visitors = {0, <<>>}, worship = 0,
	 worship_list = [], rand_list = [], last_rand_time = 0,
	 set_list = [], last_hook_time = 0, acc_hook_time = 0,
	 acc_hook_items = [], open_floor = [], floor_list = [],
	 main_floor = 0, max_sum_soft = 0}).

-record(home,
	{ver = 2, id = {0, <<>>}, name = <<>>, look_id = 0,
	 bid = 0, wall_bid = 0, land_bid = 0, soft = 0,
	 home_unit = [], floor_list = [], log = [],
	 open_floor = [1], main_floor = 1}).

-record(home_floor,
	{floor = 0, wall_bid = 0, land_bid = 0, soft = 0,
	 home_unit = []}).

-record(home_ext,
	{id = {0, <<>>}, visitors = [], log = []}).

-record(home_unit,
	{ver = 1, bid = 0  :: non_neg_integer(),
	 index = 0  :: non_neg_integer(), dir = 1  :: 1..2}).

-record(home_visitor,
	{id = {0, <<>>}, name = <<>>, look_id = 0, time = 0,
	 is_leave = 0}).

-record(home_log,
	{id = {0, <<>>}, name = <<>>, face = 0, lev = 0,
	 is_friend = 0, type = 0, time = 0, int_args = [],
	 str_args = [], face_update_time = 0, face_file = <<>>}).

-record(home_rand_visit,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, power = 0, last_login = 0, soft = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(home_unit_set,
	{set_id = 0, reward = [], collect = []}).

-record(home_rank_rc,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 avatar_bid = 0, time = 0, cache_time = 0,
	 worship_num = 0, visit_num = 0, soft = 0, score = 0,
	 rank = 0, face_update_time = 0, face_file = <<>>}).

-record(home_role_rank, {id = {0, <<>>}, rank = 0}).

-record(home_unit_data,
	{bid = 0, name = <<>>, type = 0, dir = 1, set_id = 0,
	 soft = 0, tile_list_1 = [], tile_list_2 = [],
	 effect_count = 1}).

-file("src/mod/secret_dun/secret_dun.erl", 42).

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

-file("src/mod/secret_dun/secret_dun.erl", 43).

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

-file("src/mod/secret_dun/secret_dun.erl", 44).

-file("inc/log.hrl", 1).

-file("src/mod/secret_dun/secret_dun.erl", 45).

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

-file("src/mod/secret_dun/secret_dun.erl", 46).

-spec init() -> #m_secret_dun{}.

init() ->
    Unixtime = date:unixtime(),
    #m_secret_dun{update_time = Unixtime}.

gm_buff(Role = #role{m_secret_dun =
			 SecretDun = #m_secret_dun{buffs = Buffs}},
	BuffId) ->
    NewBuffs = [BuffId | Buffs],
    NewSecretDun = SecretDun#m_secret_dun{buffs = NewBuffs},
    NewRole = Role#role{m_secret_dun = NewSecretDun},
    {ok, NewRole}.

gm_dun(Role, DunId) ->
    case enter_dun(Role, DunId) of
      {ok, NewRole} -> {ok, NewRole};
      _ -> {ok, Role}
    end.

gm_pass(Role = #role{m_secret_dun =
			 SecretDun = #m_secret_dun{dun_ids = DunIds}},
	Id) ->
    NewDunIds = [Id | DunIds],
    NewSecretDun = SecretDun#m_secret_dun{dun_ids =
					      NewDunIds},
    NewRole = Role#role{m_secret_dun = NewSecretDun},
    push(NewRole, 23100),
    NewRole.

gm_reset(Role = #role{m_secret_dun = SecretDun}) ->
    Now = date:unixtime(),
    NewSecretDun = SecretDun#m_secret_dun{dun_id = 0,
					  dun_floor = 1, floor_list = [],
					  update_time = Now,
					  partners_hp_radio = [], val = 0,
					  max_val = 0, bag = [], buffs = [],
					  bag_next_id = 1, session_ids = [],
					  load_partners = [],
					  load_partners_next_id = 1,
					  dun_power = 0,
					  formation = {1, [], 0}},
    NewRole = Role#role{m_secret_dun = NewSecretDun},
    push(NewRole, 23100),
    secret_dun_bag:push(NewRole, 23112),
    NewRole.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{m_secret_dun =
		       SecretDun = #m_secret_dun{dun_ids = DunIds,
						 reward_dun_ids =
						     RewardDunIds}}) ->
    AllRewardDunIds = secret_dun_data:get_all_id(),
    NewRole1 = case get_all_reward_list(DunIds,
					RewardDunIds, AllRewardDunIds, [])
		   of
		 [] -> Role;
		 RewardList when is_list(RewardList) ->
		     {Assets, Items} = format:split_assets_items(RewardList),
		     {ok, MailRole} = mail:add(Role,
					       {lang:get(<<"位面首通奖励"/utf8>>),
						lang:get(<<"亲爱的冒险者大人：\n这是您在位面中尚未领取的首通奖励，请查收。"/utf8>>),
						Assets, Items, <<"位面"/utf8>>,
						86400 + date:unixtime()}),
		     NewSecretDun = SecretDun#m_secret_dun{reward_dun_ids =
							       AllRewardDunIds},
		     NewRole = MailRole#role{m_secret_dun = NewSecretDun},
		     NewRole;
		 _ -> Role
	       end,
    {ok, NewRole1}.

repair_zero(Role = #role{name = Name, id = Id,
			 m_secret_dun =
			     SecretDun = #m_secret_dun{update_time =
							   UpdateTime}}) ->
    NewRole2 = case UpdateTime < 1577221200 andalso
		      UpdateTime > 0
		   of
		 true ->
		     Now = date:unixtime(),
		     NewSecretDun = SecretDun#m_secret_dun{dun_id = 0,
							   dun_floor = 1,
							   floor_list = [],
							   update_time = Now,
							   partners_hp_radio =
							       [],
							   val = 0, max_val = 0,
							   bag = [], buffs = [],
							   bag_next_id = 1,
							   session_ids = [],
							   load_partners = [],
							   load_partners_next_id
							       = 1,
							   dun_power = 0,
							   formation =
							       {1, [], 0}},
		     case {whereis(lager_event), whereis(lager_event),
			   lager_config:get({lager_event, loglevel}, {0, []})}
			 of
		       {undefined, undefined, _} ->
			   fun () -> {error, lager_not_running} end();
		       {undefined, _, _} ->
			   fun () -> {error, {sink_not_configured, lager_event}}
			   end();
		       {__Pidsecret_dun118, _,
			{__Levelsecret_dun118, __Tracessecret_dun118}}
			   when __Levelsecret_dun118 band 64 /= 0 orelse
				  __Tracessecret_dun118 /= [] ->
			   lager:do_log(info,
					[{module, secret_dun},
					 {function, repair_zero}, {line, 118},
					 {pid, pid_to_list(self())},
					 {node, node()}
					 | lager:md()],
					io_lib:format("位面重置玩家名字~ts， Id:~w ",
						      [Name, Id]),
					none, 4096, 64, __Levelsecret_dun118,
					__Tracessecret_dun118, lager_event,
					__Pidsecret_dun118);
		       _ -> ok
		     end,
		     NewRole = Role#role{m_secret_dun = NewSecretDun},
		     NewRole1 = var:set_var(NewRole, other, 3081,
					    UpdateTime),
		     NewRole1;
		 _ -> Role
	       end,
    push(NewRole2, 23100),
    secret_dun_bag:push(NewRole2, 23112),
    {ok, NewRole2}.

repair() ->
    role_group:apply(world, {secret_dun, repair, []}).

repair(Role = #role{m_secret_dun =
			SecretDun = #m_secret_dun{dun_id = DunId}}) ->
    Flag = var:get_var(Role, other, 3076, 0),
    NewRole = case DunId =:= 0 of
		true -> Role;
		_ ->
		    case Flag =:= 0 of
		      true ->
			  Now = date:unixtime(),
			  NewSecretDun = SecretDun#m_secret_dun{dun_id = 0,
								dun_floor = 1,
								floor_list = [],
								update_time =
								    Now,
								partners_hp_radio
								    = [],
								val = 0,
								max_val = 0,
								bag = [],
								buffs = [],
								bag_next_id = 1,
								session_ids =
								    [],
								load_partners =
								    [],
								load_partners_next_id
								    = 1,
								dun_power = 0,
								formation =
								    {1, [], 0}},
			  Role#role{m_secret_dun = NewSecretDun};
		      _ -> Role
		    end
	      end,
    push(NewRole, 23100),
    secret_dun_bag:push(NewRole, 23112),
    NewRole1 = var:set_var(NewRole, other, 3076, 1),
    {ok, NewRole1}.

repair_reset() ->
    role_group:apply(world, {secret_dun, repair_reset, []}).

repair_reset(Role = #role{name = Name, id = Id,
			  m_secret_dun =
			      SecretDun = #m_secret_dun{update_time =
							    UpdateTime}}) ->
    Flag = var:get_var(Role, other, 3080, 0),
    NewRole1 = case UpdateTime < 1576789200 andalso
		      UpdateTime > 0
		   of
		 true ->
		     case Flag =:= 0 of
		       true ->
			   Now = date:unixtime(),
			   NewSecretDun = SecretDun#m_secret_dun{dun_id = 0,
								 dun_floor = 1,
								 floor_list =
								     [],
								 update_time =
								     Now,
								 partners_hp_radio
								     = [],
								 val = 0,
								 max_val = 0,
								 bag = [],
								 buffs = [],
								 bag_next_id =
								     1,
								 session_ids =
								     [],
								 load_partners =
								     [],
								 load_partners_next_id
								     = 1,
								 dun_power = 0,
								 formation =
								     {1, [],
								      0}},
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
			     {__Pidsecret_dun165, _,
			      {__Levelsecret_dun165, __Tracessecret_dun165}}
				 when __Levelsecret_dun165 band 64 /= 0 orelse
					__Tracessecret_dun165 /= [] ->
				 lager:do_log(info,
					      [{module, secret_dun},
					       {function, repair_reset},
					       {line, 165},
					       {pid, pid_to_list(self())},
					       {node, node()}
					       | lager:md()],
					      io_lib:format("位面重置玩家名字~ts， Id:~w ",
							    [Name, Id]),
					      none, 4096, 64,
					      __Levelsecret_dun165,
					      __Tracessecret_dun165,
					      lager_event, __Pidsecret_dun165);
			     _ -> ok
			   end,
			   NewRole = Role#role{m_secret_dun = NewSecretDun},
			   var:set_var(NewRole, other, 3080, 1);
		       _ -> Role
		     end;
		 _ -> Role
	       end,
    push(NewRole1, 23100),
    secret_dun_bag:push(NewRole1, 23112),
    {ok, NewRole1}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_secret_dun =
			    SecretDun = #m_secret_dun{update_time = LastTime,
						      dun_id = DunId, val = Val,
						      max_val = MaxVal}}) ->
    case check_update_time(LastTime) of
      ok ->
	  Now = date:unixtime(),
	  NewSecretDun = SecretDun#m_secret_dun{dun_id = 0,
						dun_floor = 1, floor_list = [],
						update_time = Now,
						partners_hp_radio = [], val = 0,
						max_val = 0, bag = [],
						buffs = [], bag_next_id = 1,
						session_ids = [],
						load_partners = [],
						load_partners_next_id = 1,
						dun_power = 0,
						formation = {1, [], 0}},
	  NewRole = Role#role{m_secret_dun = NewSecretDun},
	  push(NewRole, 23100),
	  secret_dun_bag:push(NewRole, 23112),
	  NewRole1 = case DunId > 0 of
		       true ->
			   {ok, MailRole} = mail:add(NewRole,
						     {lang:get(<<"位面征战重置通知"/utf8>>),
						      lang:get(<<"尊敬的冒险者，位面征战玩法已重置，大量征战勋章和英雄碎片等你来获取！"/utf8>>),
						      [], [], <<"位面"/utf8>>,
						      86400 + date:unixtime()}),
			   MailRole;
		       _ -> NewRole
		     end,
	  log:save(custom,
		   {NewRole1, <<"位面探险"/utf8>>,
		    [{msg,
		      util:fbin(<<"副本id~w达成率~w"/utf8>>,
				[DunId, round(Val / max(1, MaxVal) * 100)])}]}),
	  NewRole2 = var:set_var(NewRole1, other, 3081, LastTime),
	  {ok, NewRole2};
      _ -> push(Role, 23100), {ok, Role}
    end.

-spec push(#role{}, pos_integer()) -> ok.

push(Role = #role{m_secret_dun =
		      #m_secret_dun{dun_id = DunId, dun_ids = DunIds,
				    val = Val, max_val = MaxVal,
				    reward_dun_ids = RewardDunIds},
		  m_home =
		      #m_home{look_id = LookId, look_list = LookList}},
     Code = 23100) ->
    SelectIds = get_select_ids(Role),
    NextUpdateUnixtime = get_next_update_unixtime(),
    CanRewardDunIds = DunIds -- RewardDunIds,
    IsHoliday = is_open_holiday(Role),
    sys_conn:pack_send(Code,
		       {DunId, Val, MaxVal, SelectIds, RewardDunIds,
			CanRewardDunIds, NextUpdateUnixtime, LookId, IsHoliday,
			LookList}),
    ok;
push(Role = #role{m_secret_dun =
		      #m_secret_dun{dun_id = DunId, dun_ids = DunIds,
				    val = Val, max_val = MaxVal,
				    reward_dun_ids = RewardDunIds}},
     Code = 23100) ->
    SelectIds = get_select_ids(Role),
    NextUpdateUnixtime = get_next_update_unixtime(),
    CanRewardDunIds = DunIds -- RewardDunIds,
    IsHoliday = is_open_holiday(Role),
    sys_conn:pack_send(Code,
		       {DunId, Val, MaxVal, SelectIds, RewardDunIds,
			CanRewardDunIds, NextUpdateUnixtime, 0, IsHoliday, []}),
    ok;
push(#role{m_secret_dun =
	       #m_secret_dun{dun_floor = Floor,
			     floor_list = FloorList}},
     Code = 23101) ->
    case lists:keyfind(Floor, #secret_floor.floor,
		       FloorList)
	of
      #secret_floor{tile_list = TileList, map_id = MapId,
		    index = Index, walk_tile = WalkTile} ->
	  sys_conn:pack_send(Code,
			     {Floor, Index, MapId, TileList, WalkTile});
      _ -> sys_conn:pack_send(Code, {Floor, 0, 0, [], []})
    end,
    ok;
push(#role{partner_bag =
	       #partner_bag{partner_list = PartnerList},
	   m_secret_dun =
	       #m_secret_dun{load_partners = LoadPartnerList,
			     partners_hp_radio = PartnerHpRadio}},
     Code = 23115) ->
    PushList1 = push_23115_load(LoadPartnerList,
				PartnerHpRadio, []),
    {LimitLev, LimitStar, LimitBreak} =
	secret_dun_data:get_const(filter_condition),
    PushList2 = push_23115_own(PartnerList, PartnerHpRadio,
			       LimitLev, LimitStar, LimitBreak, []),
    PushList3 = PushList1 ++ PushList2,
    sys_conn:pack_send(Code, {PushList3}),
    ok;
push(#role{m_secret_dun = #m_secret_dun{buffs = Buffs}},
     Code = 23118) ->
    sys_conn:pack_send(Code, {Buffs}), ok;
push(_, Code) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsecret_dun240, _,
       {__Levelsecret_dun240, __Tracessecret_dun240}}
	  when __Levelsecret_dun240 band 8 /= 0 orelse
		 __Tracessecret_dun240 /= [] ->
	  lager:do_log(error,
		       [{module, secret_dun}, {function, push}, {line, 240},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("协议发送错误~w", [Code]), none, 4096, 8,
		       __Levelsecret_dun240, __Tracessecret_dun240,
		       lager_event, __Pidsecret_dun240);
      _ -> ok
    end,
    ok.

-spec push(#role{}, pos_integer(), tuple()) -> ok.

push(#role{}, Code = 23102, Data) ->
    sys_conn:pack_send(Code, Data), ok;
push(#role{}, Code = 23107, {LoadPartnerList}) ->
    Data = client_23107(LoadPartnerList, []),
    sys_conn:pack_send(Code, {Data}),
    ok;
push(#role{}, Code = 23108, Data) ->
    sys_conn:pack_send(Code, Data), ok;
push(#role{m_secret_dun =
	       #m_secret_dun{buffs = Buffs,
			     formation = {_, PosInfo, _},
			     load_partners = LoadPartners},
	   partner_bag = #partner_bag{partner_list = PartnerList}},
     Code = 23109,
     {Rid, SrvId, Name, Face, Lev, ExpendPower, PList,
      FormationType, Sprites, HallowsId, SpriteLev,
      StrengthRadio}) ->
    PushPartners = get_formation_partner(PosInfo,
					 PartnerList, LoadPartners, []),
    {PushPartners1, PushBuffs} = calc_buff_power(Buffs,
						 PushPartners, []),
    PushPower = lists:sum([PPower
			   || #partner{power = PPower} <- PushPartners1]),
    PushPower2 = lists:sum([PPower2
			    || #load_partner{power = PPower2}
				   <- PushPartners1]),
    sys_conn:pack_send(Code,
		       {PushPower + PushPower2, PushBuffs, Rid, SrvId, Name,
			Face, Lev, ExpendPower, FormationType, PList, Sprites,
			HallowsId, SpriteLev, StrengthRadio}),
    ok;
push(#role{}, Code = 23110, Data) ->
    sys_conn:pack_send(Code, Data), ok;
push(#role{}, Code = 23111, Data) ->
    sys_conn:pack_send(Code, Data), ok;
push(#role{m_secret_dun =
	       #m_secret_dun{load_partners = LoadPartners}},
     Code = 23116, Pos) ->
    LoadPartner1 = case lists:keyfind(Pos,
				      #load_partner.pos, LoadPartners)
		       of
		     LoadPartner = #load_partner{} -> LoadPartner;
		     _ -> #load_partner{}
		   end,
    [Data] = client_23107([LoadPartner1], []),
    sys_conn:pack_send(Code, {Data}),
    ok;
push(#role{}, Code = 23119, PushList) ->
    PushList1 = push_23119(PushList, []),
    sys_conn:pack_send(Code, {PushList1}),
    ok;
push(#role{partner_bag =
	       #partner_bag{partner_list = PartnerList},
	   m_secret_dun =
	       #m_secret_dun{buffs = Buffs,
			     load_partners = LoadPartners}},
     Code = 23120, PushIds) ->
    PushPartners = get_23120_partners(PartnerList,
				      LoadPartners, PushIds, []),
    {PushPartners1, _PushBuffs} = calc_buff_power(Buffs,
						  PushPartners, []),
    PushPower1 = lists:sum([PPower1
			    || #partner{power = PPower1} <- PushPartners1]),
    PushPower2 = lists:sum([PPower2
			    || #load_partner{power = PPower2}
				   <- PushPartners1]),
    sys_conn:pack_send(Code, {PushPower1 + PushPower2}),
    ok;
push(_, Code, _) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsecret_dun292, _,
       {__Levelsecret_dun292, __Tracessecret_dun292}}
	  when __Levelsecret_dun292 band 8 /= 0 orelse
		 __Tracessecret_dun292 /= [] ->
	  lager:do_log(error,
		       [{module, secret_dun}, {function, push}, {line, 292},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("协议发送错误~w", [Code]), none, 4096, 8,
		       __Levelsecret_dun292, __Tracessecret_dun292,
		       lager_event, __Pidsecret_dun292);
      _ -> ok
    end,
    ok.

-spec get_formation(#role{}, pos_integer()) -> tuple().

get_formation(Role = #role{m_secret_dun =
			       #m_secret_dun{partners_hp_radio =
						 PartnerHpRadio},
			   partner_bag =
			       #partner_bag{partner_list = PartnerList}},
	      SysType) ->
    #formation_sys{type = FormationType, pos_info = PosInfo,
		   hallows_id = HallowsId} =
	formation:get_sys_formation(Role, SysType),
    DiePIds = [PId || {PId, 0} <- PartnerHpRadio],
    NewPosInfo = filter_formation(PosInfo, DiePIds,
				  PartnerList, []),
    {FormationType, NewPosInfo, HallowsId}.

-spec get_first_reward(#role{}, pos_integer()) -> {ok,
						   #role{}} |
						  {false, string()}.

get_first_reward(Role = #role{m_secret_dun =
				  SecretDun = #m_secret_dun{dun_ids = DunIds,
							    reward_dun_ids =
								RewardDunIds}},
		 DunId) ->
    case check_first_reward_cond(DunIds, RewardDunIds,
				 DunId)
	of
      {ok, RewardList} ->
	  Gain = format:val_to_gain(RewardList, secret_dun),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, GainRole} ->
		NewRewardDunIds = [DunId | RewardDunIds],
		NewSecretDun = SecretDun#m_secret_dun{reward_dun_ids =
							  NewRewardDunIds},
		NewRole = GainRole#role{m_secret_dun = NewSecretDun},
		{ok, NewRole};
	    _ -> {false, lang:get(<<"获得首通奖励失败"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason}
    end.

-spec enter_dun(#role{}, pos_integer()) -> {ok,
					    #role{}} |
					   {false, string()}.

enter_dun(Role = #role{m_secret_dun =
			   #m_secret_dun{dun_id = 0},
		       max_power = MaxPower},
	  Id) ->
    case check_enter_dun_cond([limit_id, lev, power], Id,
			      Role)
	of
      ok ->
	  case create_all_floor(Role, Id) of
	    NewRole = #role{m_secret_dun =
				SecretDun = #m_secret_dun{dun_id = DunId,
							  dun_floor = Floor}} ->
		NewSecretDun = SecretDun#m_secret_dun{dun_power =
							  MaxPower},
		NewRole1 = NewRole#role{m_secret_dun = NewSecretDun},
		push(NewRole1, 23100),
		NewRole2 = session(NewRole1, {DunId, Floor}),
		log:save(join,
			 {NewRole2, <<"位面探险"/utf8>>,
			  util:fbin(<<"进入位面探险副本-~w"/utf8>>, [DunId])}),
		LogName = case secret_dun_data:get_dun_name({DunId,
							     Floor})
			      of
			    undefined -> lang:get(<<"极冰雪原"/utf8>>);
			    Name -> Name
			  end,
		log:save(join,
			 {NewRole2, <<"位面探险"/utf8>>,
			  util:fbin(<<"~ts-~w"/utf8>>, [LogName, Floor])}),
		log:save(task,
			 {NewRole2, 0, DunId,
			  util:fbin(<<"进入位面探险副本-~w"/utf8>>, [DunId]), 101,
			  <<"位面探险通关"/utf8>>, <<"位面探险通关"/utf8>>}),
		log:save(task,
			 {NewRole2, 0, DunId,
			  util:fbin(<<"进入位面探险副本-~w"/utf8>>, [Floor]), 101,
			  <<"位面探险通关"/utf8>>,
			  util:fbin(<<"任务对应层数-~w"/utf8>>, [Floor])}),
		NewRole3 = var:set_var(NewRole2, other, 3083, 1),
		{ok, NewRole3};
	    {false, Reason} -> {false, Reason}
	  end;
      {false, Reason} -> {false, Reason};
      _ -> {false, lang:get(<<"进入失败"/utf8>>)}
    end;
enter_dun(Role = #role{m_secret_dun =
			   #m_secret_dun{dun_id = Id, dun_floor = Floor,
					 floor_list = FloorList}},
	  Id) ->
    case check_enter_dun_cond([limit_id, lev, power], Id,
			      Role)
	of
      ok ->
	  case lists:keyfind(Floor, #secret_floor.floor,
			     FloorList)
	      of
	    #secret_floor{} ->
		push(Role, 23100),
		NewRole = session(Role, {Id, Floor}),
		{ok, NewRole};
	    _ -> {false, lang:get(<<"没有该层的数据"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason};
      _ -> {false, lang:get(<<"进入失败"/utf8>>)}
    end;
enter_dun(_, _) ->
    {false, lang:get(<<"不能进入该副本"/utf8>>)}.

-spec enter_floor(#role{}, pos_integer()) -> {ok,
					      #role{}} |
					     {false, string()}.

enter_floor(#role{m_secret_dun =
		      #m_secret_dun{dun_id = 0}},
	    _) ->
    {false, lang:get(<<"当前没有选择副本"/utf8>>)};
enter_floor(Role = #role{m_secret_dun =
			     SecretDun = #m_secret_dun{dun_id = DunId,
						       floor_list = FloorList}},
	    Floor) ->
    case lists:keyfind(Floor, #secret_floor.floor,
		       FloorList)
	of
      #secret_floor{} ->
	  NewSecretDun = SecretDun#m_secret_dun{dun_floor =
						    Floor},
	  NewRole = Role#role{m_secret_dun = NewSecretDun},
	  push(NewRole, 23101),
	  NewRole1 = session(NewRole, {DunId, Floor}),
	  {ok, NewRole1};
      _ -> {false, lang:get(<<"没有该层的数据"/utf8>>)}
    end.

-spec moveto(#role{}, pos_integer()) -> ok |
					{false, binary()} | {ok, #role{}}.

moveto(#role{m_secret_dun = #m_secret_dun{dun_id = 0}},
       _) ->
    {false, lang:get(<<"无法操作"/utf8>>)};
moveto(Role = #role{m_secret_dun =
			MSecretDun = #m_secret_dun{dun_floor = NowFloor,
						   floor_list = FloorList}},
       ToIndex) ->
    case lists:keyfind(NowFloor, #secret_floor.floor,
		       FloorList)
	of
      #secret_floor{index = ToIndex} ->
	  {false, lang:get(<<"你已在这个格子"/utf8>>)};
      SecretFloor = #secret_floor{tile_list = TileList,
				  index = Index, walk_tile = WalkTile} ->
	  case secret_dun_tile:check_moveto(Index, ToIndex) of
	    true ->
		case lists:keyfind(ToIndex, #secret_tile.index,
				   TileList)
		    of
		  #secret_tile{is_walk = 0} ->
		      {false, lang:get(<<"目标格子不能进入"/utf8>>)};
		  #secret_tile{is_hide = 1} ->
		      {false, lang:get(<<"目标格子不能进入"/utf8>>)};
		  #secret_tile{status = Status, evtid = EvtId,
			       platform = Platform} ->
		      Flag = case Status of
			       1 ->
				   case secret_dun_data:get_evt(EvtId) of
				     #evt_data{type = 13} when Platform =:= 1 ->
					 0;
				     _ ->
					 case
					   secret_dun_data:get_event_walk(EvtId)
					     of
					   0 -> 0;
					   _ -> 1
					 end
				   end;
			       _ -> 1
			     end,
		      case Flag of
			0 -> {false, lang:get(<<"目标格子不能进入"/utf8>>)};
			_ ->
			    NewWalkTile = case lists:member(ToIndex, WalkTile)
					      of
					    true -> WalkTile;
					    _ -> [ToIndex | WalkTile]
					  end,
			    NewSecretFloor = SecretFloor#secret_floor{index =
									  ToIndex,
								      walk_tile
									  =
									  NewWalkTile},
			    NewFloorList = lists:keyreplace(NowFloor,
							    #secret_floor.floor,
							    FloorList,
							    NewSecretFloor),
			    NRole = Role#role{m_secret_dun =
						  MSecretDun#m_secret_dun{floor_list
									      =
									      NewFloorList}},
			    {ok, NRole}
		      end;
		  _ -> {false, lang:get(<<"目标格子不存在"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"格子非法进入"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"没有该层的信息"/utf8>>)}
    end.

-spec session(#role{},
	      tuple() | pos_integer()) -> #role{}.

session(Role = #role{m_secret_dun =
			 SecretDun = #m_secret_dun{session_ids = SessionIds}},
	Condition) ->
    case secret_dun_data:get_session([Condition]) of
      Id when is_integer(Id) ->
	  case lists:member(Id, SessionIds) of
	    true -> Role;
	    _ ->
		NewSessionIds = [Id | SessionIds],
		NewSecretDun = SecretDun#m_secret_dun{session_ids =
							  NewSessionIds},
		NewRole = Role#role{m_secret_dun = NewSecretDun},
		push(NewRole, 23111, {Id}),
		NewRole
	  end;
      _ -> Role
    end.

-spec get_next_update_unixtime() -> integer().

get_next_update_unixtime() ->
    StartUnixtime =
	secret_dun_data:get_const(start_unixtime),
    Now = date:unixtime(),
    case StartUnixtime < Now of
      true ->
	  UpdateDay = secret_dun_data:get_const(update_day),
	  DiffDay = date:day_diff(StartUnixtime, Now),
	  LastUpdateDay = DiffDay rem UpdateDay,
	  NextUpdateTime = case LastUpdateDay > 0 of
			     true ->
				 AddDay = max(0, UpdateDay - LastUpdateDay),
				 date:unixtime({zero, Now + AddDay * 86400});
			     _ ->
				 TodayZero = date:unixtime({zero, Now}),
				 case Now > TodayZero of
				   true ->
				       date:unixtime({zero,
						      Now + UpdateDay * 86400});
				   _ -> TodayZero
				 end
			   end,
	  NextUpdateTime;
      _ -> 0
    end.

-spec check_formation_pos_info(#role{},
			       FormationType :: pos_integer(), list(),
			       pos_integer()) -> {ok, list()} |
						 {false, binary()}.

check_formation_pos_info(Role = #role{m_formation =
					  #m_formation{list = List}},
			 FormationType, PosInfo, HallowsId) ->
    case lists:member(FormationType, List) of
      false -> {false, lang:get(<<"相关阵法不存在或未激活"/utf8>>)};
      _ ->
	  case hallows:get_hallows(Role, HallowsId) of
	    false when HallowsId =/= 0 ->
		{false, lang:get(<<"未激活该圣器"/utf8>>)};
	    _ -> check_formation_pos_info_(PosInfo, Role, [], [])
	  end
    end.

-spec is_open_holiday(#role{}) -> integer().

is_open_holiday(Role) ->
    case holiday_lib:get_open_holiday(Role,
				      [7009, 97009, 997009])
	of
      #holiday{end_time = EndTime} ->
	  case EndTime - date:unixtime() - 86400 > 0 of
	    true -> 1;
	    _ -> 0
	  end;
      _ -> 0
    end.

get_formation(Role = #role{m_secret_dun =
			       #m_secret_dun{formation =
						 {FormationType, PosInfo, HId},
					     partners_hp_radio =
						 PartnerHpRadio},
			   partner_bag =
			       #partner_bag{partner_list = PartnerList}}) ->
    case PosInfo of
      [] ->
	  #formation_sys{type = SysFormationType,
			 pos_info = SysPosInfo, hallows_id = SysHallowsId} =
	      formation:get_sys_formation(Role, 0),
	  NewSysPosInfo = [{Pos, Id, 0}
			   || #formation_pos{pos = Pos, id = Id} <- SysPosInfo],
	  NewSysPosInfo1 =
	      filter_sys_formation_pos_info(NewSysPosInfo,
					    PartnerHpRadio, PartnerList, []),
	  {SysFormationType, NewSysPosInfo1, SysHallowsId};
      _ ->
	  NewPosInfo = filter_formation_pos_info(PosInfo,
						 PartnerHpRadio, []),
	  {FormationType, NewPosInfo, HId}
    end.

-spec can_skip_combat(#role{}) -> true |
				  {false, binary()}.

can_skip_combat(#role{lev = Lev}) ->
    LimitLev = secret_dun_data:get_const(skip_battle_lev),
    case Lev >= LimitLev of
      true -> true;
      _ -> {false, lang:get(<<"等级不够，不能跳过战斗"/utf8>>)}
    end.

check_enter_dun_cond([], _, _) -> ok;
check_enter_dun_cond([limit_id | Rest], Id,
		     Role = #role{m_secret_dun =
				      #m_secret_dun{dun_ids = Ids}}) ->
    LimitIds = secret_dun_data:get_limit_id(Id),
    case LimitIds -- Ids of
      [] -> check_enter_dun_cond(Rest, Id, Role);
      _ -> {false, lang:get(<<"该副本未通关"/utf8>>)}
    end;
check_enter_dun_cond([lev | Rest], Id,
		     Role = #role{lev = Lev}) ->
    case secret_dun_data:get_limit_lev(Id) of
      LimitLev when is_integer(LimitLev), Lev >= LimitLev ->
	  check_enter_dun_cond(Rest, Id, Role);
      _ -> {false, lang:get(<<"等级不够"/utf8>>)}
    end;
check_enter_dun_cond([power | Rest], Id,
		     Role = #role{max_power = MaxPower}) ->
    case secret_dun_data:get_limit_power(Id) of
      LimitPower
	  when is_integer(LimitPower), MaxPower >= LimitPower ->
	  check_enter_dun_cond(Rest, Id, Role);
      _ -> {false, lang:get(<<"战力不够"/utf8>>)}
    end;
check_enter_dun_cond(_, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

check_update_time(LastTime) ->
    StartUnixtime =
	secret_dun_data:get_const(start_unixtime),
    Now = date:unixtime(),
    case StartUnixtime < Now of
      true ->
	  UpdateDay = secret_dun_data:get_const(update_day),
	  DiffDay = date:day_diff(StartUnixtime, Now),
	  LastUpdateDay = DiffDay rem UpdateDay,
	  LastUpdateTime = case LastUpdateDay > 0 of
			     true ->
				 date:unixtime({zero,
						Now - LastUpdateDay * 86400});
			     _ ->
				 TodayZero = date:unixtime({zero, Now}),
				 case Now >= TodayZero of
				   true -> TodayZero;
				   _ ->
				       date:unixtime({zero,
						      Now - UpdateDay * 86400})
				 end
			   end,
	  case LastTime < LastUpdateTime of
	    true -> ok;
	    _ -> false
	  end;
      _ -> false
    end.

create_all_floor(Role, Id) ->
    AllFloor = [{DunId, Floor}
		|| {DunId, Floor} <- secret_dun_data:get_all_dun(),
		   DunId =:= Id],
    case create_all_floor1(Role, AllFloor) of
      NewRole = #role{m_secret_dun = SecretDun} ->
	  MaxVal = secret_dun_data:get_dun_max_val(Id),
	  NewSecretDun = SecretDun#m_secret_dun{dun_id = Id,
						dun_floor = 1, val = 0,
						max_val = MaxVal},
	  NewRole1 = NewRole#role{m_secret_dun = NewSecretDun},
	  NewRole1;
      {false, Reason} -> {false, Reason}
    end.

create_all_floor1(Role, []) -> Role;
create_all_floor1(Role, [{Id, Floor} | Rest]) ->
    case create_floor(Role, {Id, Floor}) of
      {ok, NewRole} -> create_all_floor1(NewRole, Rest);
      {false, Reason} -> {false, Reason}
    end;
create_all_floor1(_, _) ->
    {false, lang:get(<<"生成副本数据错误"/utf8>>)}.

create_floor(Role = #role{m_secret_dun =
			      SecretDun = #m_secret_dun{floor_list = FloorList,
							dun_ids = DunIds}},
	     {Id, Floor}) ->
    case secret_dun_data:get_dun({Id, Floor}) of
      MapsData when is_list(MapsData) ->
	  NewMapId = case lists:member(Id, DunIds) of
		       true -> {MapId, _} = util:rand_list(MapsData, 2), MapId;
		       _ ->
			   case secret_dun_data:get_first_map_id({Id, Floor}) of
			     FirstMapId when is_integer(FirstMapId) ->
				 FirstMapId;
			     _ ->
				 {MapId, _} = util:rand_list(MapsData, 2), MapId
			   end
		     end,
	  case map_data:get(NewMapId) of
	    #map_data{tile_res_list = ResList} ->
		case create_floor1(Floor, NewMapId, ResList) of
		  NewFloor = #secret_floor{} ->
		      NewFloorList = lists:keystore(Floor,
						    #secret_floor.floor,
						    FloorList, NewFloor),
		      NewSecretDun = SecretDun#m_secret_dun{floor_list =
								NewFloorList},
		      NewRole = Role#role{m_secret_dun = NewSecretDun},
		      {ok, NewRole};
		  {false, Reason} -> {false, Reason}
		end;
	    _ -> {false, lang:get(<<"没有该地图的数据"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"没有该副本的数据"/utf8>>)}
    end.

create_floor1(Floor, MapId, ResList) ->
    case map_data_walkable:get(MapId) of
      WalkData when is_list(WalkData) ->
	  case map_data_tile_res:get(MapId) of
	    ResData when is_list(ResData) ->
		TitleList = get_title_list(WalkData, ResData, ResList),
		case lists:keyfind(1, #secret_tile.is_born, TitleList)
		    of
		  #secret_tile{index = Index} ->
		      #secret_floor{floor = Floor, map_id = MapId,
				    tile_list = TitleList, index = Index,
				    walk_tile = [Index]};
		  _ -> {false, lang:get(<<"没有出生点"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"没有该地图数据"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"没有该地图数据"/utf8>>)}
    end.

get_title_list(WalkData, ResData, ResList) ->
    Y = 1,
    TitleList = [],
    put(secret_dun_title, []),
    get_title_list1(WalkData, ResData, ResList, Y,
		    TitleList).

get_title_list1([], [], _, _, TitleList) -> TitleList;
get_title_list1([WalkY | WalkRest], [ResY | ResRest],
		ResList, Y, TitleList) ->
    X = 1,
    NewTitleList = get_title_list2(WalkY, ResY, ResList, Y,
				   X, TitleList),
    get_title_list1(WalkRest, ResRest, ResList, Y + 1,
		    NewTitleList);
get_title_list1(_, _, _, _, TitleList) -> TitleList.

get_title_list2([], [], _, _, _, TitleList) ->
    TitleList;
get_title_list2([0 | WalkRest], [_ResType | ResRest],
		ResList, Y, X, TitleList) ->
    get_title_list2(WalkRest, ResRest, ResList, Y, X + 1,
		    TitleList);
get_title_list2([Res | WalkRest], [ResType | ResRest],
		ResList, Y, X, TitleList)
    when Res > 1 ->
    Index = secret_dun_tile:tileIndex({X, Y}),
    Title = case maps_util:keyfind(ResList, id, ResType) of
	      {ok,
	       #{id := ResType, evtid := EvtGroupId, list := List}} ->
		  ResId = util:rand_list(List),
		  case secret_dun_data:get_events(EvtGroupId) of
		    EvtList when is_list(EvtList) ->
			create_title(EvtGroupId, Index, 1, ResId, TitleList,
				     EvtList);
		    _ ->
			#secret_tile{index = Index, is_walk = 1, status = 3,
				     evtid = 0, res_id = ResId}
		  end;
	      _ ->
		  #secret_tile{index = Index, is_walk = 1, status = 3,
			       evtid = 0, res_id = 0}
	    end,
    NewTitleList = [Title | TitleList],
    get_title_list2(WalkRest, ResRest, ResList, Y, X + 1,
		    NewTitleList);
get_title_list2([_ | WalkRest], [ResType | ResRest],
		ResList, Y, X, TitleList) ->
    Index = secret_dun_tile:tileIndex({X, Y}),
    Title = case maps_util:keyfind(ResList, id, ResType) of
	      {ok,
	       #{id := ResType, evtid := EvtGroupId, list := List}} ->
		  ResId = util:rand_list(List),
		  case secret_dun_data:get_events(EvtGroupId) of
		    EvtList when is_list(EvtList) ->
			create_title(EvtGroupId, Index, 0, ResId, TitleList,
				     EvtList);
		    _ ->
			#secret_tile{index = Index, is_walk = 0, status = 3,
				     evtid = 0, res_id = ResId}
		  end;
	      _ ->
		  #secret_tile{index = Index, is_walk = 0, status = 3,
			       evtid = 0, res_id = 0}
	    end,
    NewTitleList = [Title | TitleList],
    get_title_list2(WalkRest, ResRest, ResList, Y, X + 1,
		    NewTitleList);
get_title_list2(_, _, _, _, _, TitleList) -> TitleList.

create_title(EvtGroupId, Index, IsWalk, ResId,
	     TitleList, EvtList) ->
    case util:rand_list(EvtList, 2) of
      NowEvtData = {EvtId, _, LimitNum} ->
	  case secret_dun_data:get_evt(EvtId) of
	    #evt_data{type = 0} ->
		#secret_tile{index = Index, is_walk = IsWalk,
			     status = 3, evtid = 0, res_id = ResId};
	    #evt_data{type = Type, ext = Ext} ->
		LimitTitleList1 = case get(secret_dun_title) of
				    LimitTitleList
					when is_list(LimitTitleList) ->
					LimitTitleList;
				    _ -> []
				  end,
		NowNum = length([1
				 || {LimitTitleGroupId, LimitTitleEvtId}
					<- LimitTitleList1,
				    LimitTitleGroupId =:= EvtGroupId,
				    LimitTitleEvtId =:= EvtId]),
		case NowNum < LimitNum of
		  true ->
		      put(secret_dun_title,
			  [{EvtGroupId, EvtId} | LimitTitleList1]),
		      case Type of
			4 ->
			    #secret_tile{index = Index, is_walk = IsWalk,
					 status = 1, evtid = EvtId,
					 res_id = ResId, is_born = 1};
			13 ->
			    Platform = case Ext of
					 [Flag] when Flag =:= 1 orelse 0 ->
					     Flag;
					 _ -> 0
				       end,
			    #secret_tile{index = Index, is_walk = IsWalk,
					 status = 1, evtid = EvtId,
					 res_id = ResId, platform = Platform};
			_ ->
			    #secret_tile{index = Index, is_walk = IsWalk,
					 status = 1, evtid = EvtId,
					 res_id = ResId}
		      end;
		  _ ->
		      create_title(EvtGroupId, Index, IsWalk, ResId,
				   TitleList, EvtList -- [NowEvtData])
		end;
	    _ ->
		#secret_tile{index = Index, is_walk = IsWalk,
			     status = 3, evtid = 0, res_id = ResId}
	  end;
      _ ->
	  #secret_tile{index = Index, is_walk = IsWalk,
		       status = 3, evtid = 0, res_id = ResId}
    end.

get_max_val(FloorList) -> get_max_val1(FloorList, 0).

get_max_val1([], OldMaxVal) -> OldMaxVal;
get_max_val1([#secret_floor{tile_list = TitleList}
	      | Rest],
	     OldMaxVal) ->
    NewMaxVal = get_max_val2(TitleList, OldMaxVal),
    get_max_val1(Rest, NewMaxVal);
get_max_val1(_, OldMaxVal) -> OldMaxVal.

get_max_val2([], OldMaxVal) -> OldMaxVal;
get_max_val2([#secret_tile{evtid = EvtId} | Rest],
	     OldMaxVal) ->
    case secret_dun_data:get_event_type(EvtId) of
      Type when Type =:= 3 ->
	  get_max_val2(Rest, OldMaxVal + 1);
      _ -> get_max_val2(Rest, OldMaxVal)
    end;
get_max_val2(_, OldMaxVal) -> OldMaxVal.

push_23115_own([], _, _, _, _, OldPushList) ->
    OldPushList;
push_23115_own([#partner{id = PartnerId, bid = Bid,
			 lev = Lev, star = Star, break_lev = BreakLev,
			 power = Power, use_skin = UseSkin}
		| Rest],
	       PartnerHpRadio, LimitLev, LimitStar, LimitBreak,
	       OldPushList) ->
    case Lev >= LimitLev andalso
	   Star >= LimitStar andalso BreakLev >= LimitBreak
	of
      true ->
	  case lists:keyfind(PartnerId, 1, PartnerHpRadio) of
	    {_, Radio} ->
		Push = {0, PartnerId, Bid, Lev, Star, Power, Radio,
			[{5, UseSkin}]},
		push_23115_own(Rest, PartnerHpRadio, LimitLev,
			       LimitStar, LimitBreak, [Push | OldPushList]);
	    _ ->
		Push = {0, PartnerId, Bid, Lev, Star, Power, 100,
			[{5, UseSkin}]},
		push_23115_own(Rest, PartnerHpRadio, LimitLev,
			       LimitStar, LimitBreak, [Push | OldPushList])
	  end;
      _ ->
	  push_23115_own(Rest, PartnerHpRadio, LimitLev,
			 LimitStar, LimitBreak, OldPushList)
    end;
push_23115_own(_, _, _, _, _, OldPushList) ->
    OldPushList.

push_23115_load([], _, OldPushList) -> OldPushList;
push_23115_load([#load_partner{pos = PartnerId,
			       bid = Bid, lev = Lev, star = Star,
			       use_skin = UseSkin, power = Power}
		 | Rest],
		PartnerHpRadio, OldPushList) ->
    case lists:keyfind({PartnerId, <<>>}, 1, PartnerHpRadio)
	of
      {_, Radio} ->
	  Push = {1, PartnerId, Bid, Lev, Star, Power, Radio,
		  [{5, UseSkin}]},
	  push_23115_load(Rest, PartnerHpRadio,
			  [Push | OldPushList]);
      _ ->
	  Push = {1, PartnerId, Bid, Lev, Star, Power, 100,
		  [{5, UseSkin}]},
	  push_23115_load(Rest, PartnerHpRadio,
			  [Push | OldPushList])
    end;
push_23115_load(_, _, OldPushList) -> OldPushList.

check_first_reward_cond(DunIds, RewardDunIds, DunId) ->
    case lists:member(DunId, DunIds) of
      true ->
	  case lists:member(DunId, RewardDunIds) of
	    true -> {false, lang:get(<<"你已经领取过该奖励了"/utf8>>)};
	    _ ->
		case secret_dun_data:get_first_reward(DunId) of
		  RewardList when is_list(RewardList) -> {ok, RewardList};
		  _ -> {false, lang:get(<<"没有该奖励的数据"/utf8>>)}
		end
	  end;
      _ -> {false, lang:get(<<"还未通关，不能领取该奖励"/utf8>>)}
    end.

push_23119([], PushList) -> PushList;
push_23119([{PartnerId, Radio} | Rest], PushList)
    when is_integer(PartnerId) ->
    push_23119(Rest, [{0, PartnerId, Radio} | PushList]);
push_23119([{{PartnerId, _}, Radio} | Rest],
	   PushList) ->
    push_23119(Rest, [{1, PartnerId, Radio} | PushList]);
push_23119(_, PushList) -> PushList.

calc_buff_power([], PushPartners, PushBuffs) ->
    {PushPartners, PushBuffs};
calc_buff_power([BuffId | Rest], PushPartners,
		PushBuffs) ->
    case secret_dun_data:get_buff_client(BuffId) of
      {Quality, Radio} ->
	  NewPushBuffs = case lists:keyfind(Quality, 1, PushBuffs)
			     of
			   {Quality, OldNum} ->
			       lists:keyreplace(Quality, 1, PushBuffs,
						{Quality, OldNum + 1});
			   _ -> [{Quality, 1} | PushBuffs]
			 end,
	  case secret_dun_data:get_buff(BuffId) of
	    {Range, _} ->
		NewPartners = calc_partner_power(PushPartners, Range,
						 Radio, []),
		calc_buff_power(Rest, NewPartners, NewPushBuffs);
	    _ -> calc_buff_power(Rest, PushPartners, NewPushBuffs)
	  end;
      _ -> calc_buff_power(Rest, PushPartners, PushBuffs)
    end;
calc_buff_power(_, PushPartners, PushBuffs) ->
    {PushPartners, PushBuffs}.

calc_partner_power([], _, _, NewPartnerList) ->
    NewPartnerList;
calc_partner_power([Partner = #partner{camp_type =
					   CampType,
				       bid = BaseId, type = CareerType,
				       power = Power}
		    | Rest],
		   Range, Radio, NewPartnerList) ->
    Return = case Range of
	       [] -> 1;
	       [{career_type, CareerType}] -> 1;
	       [{camp_type, CampType}] -> 1;
	       [{partner, BaseId}] -> 1;
	       _ -> 0
	     end,
    case Return =:= 1 of
      true ->
	  NewPower = round((1 + Radio / 1000) * Power),
	  NewPartner = Partner#partner{power = NewPower},
	  calc_partner_power(Rest, Range, Radio,
			     [NewPartner | NewPartnerList]);
      _ ->
	  calc_partner_power(Rest, Range, Radio,
			     [Partner | NewPartnerList])
    end;
calc_partner_power([Partner = #load_partner{bid =
						BaseId,
					    power = Power}
		    | Rest],
		   Range, Radio, NewPartnerList) ->
    #partner_base_data{camp_type = CampType,
		       type = CareerType} =
	partner_data:get_base(BaseId),
    Return = case Range of
	       [] -> 1;
	       [{career_type, CareerType}] -> 1;
	       [{camp_type, CampType}] -> 1;
	       [{partner, BaseId}] -> 1;
	       _ -> 0
	     end,
    case Return =:= 1 of
      true ->
	  NewPower = round((1 + Radio / 1000) * Power),
	  NewPartner = Partner#load_partner{power = NewPower},
	  calc_partner_power(Rest, Range, Radio,
			     [NewPartner | NewPartnerList]);
      _ ->
	  calc_partner_power(Rest, Range, Radio,
			     [Partner | NewPartnerList])
    end;
calc_partner_power(_, _, _, NewPartnerList) ->
    NewPartnerList.

get_formation_partner([], _, _, PushPartners) ->
    PushPartners;
get_formation_partner([{_, Id, 0} | Rest], PartnerList,
		      LoadPartners, PushPartners) ->
    case lists:keyfind(Id, #partner.id, PartnerList) of
      Partner = #partner{} ->
	  get_formation_partner(Rest, PartnerList, LoadPartners,
				[Partner | PushPartners]);
      _ ->
	  get_formation_partner(Rest, PartnerList, LoadPartners,
				PushPartners)
    end;
get_formation_partner([{_, Id, _} | Rest], PartnerList,
		      LoadPartners, PushPartners) ->
    case lists:keyfind(Id, #load_partner.pos, LoadPartners)
	of
      Partner = #load_partner{} ->
	  get_formation_partner(Rest, PartnerList, LoadPartners,
				[Partner | PushPartners]);
      _ ->
	  get_formation_partner(Rest, PartnerList, LoadPartners,
				PushPartners)
    end;
get_formation_partner(_, _, _, PushPartners) ->
    PushPartners.

get_23120_partners(_, _, [], PushPartners) ->
    PushPartners;
get_23120_partners(PartnerList, LoadPartners,
		   [{Type, Id} | Rest], PushPartners) ->
    case Type =:= 1 of
      true ->
	  case lists:keyfind(Id, #load_partner.pos, LoadPartners)
	      of
	    Partner = #load_partner{} ->
		get_23120_partners(PartnerList, LoadPartners, Rest,
				   [Partner | PushPartners]);
	    _ ->
		get_23120_partners(PartnerList, LoadPartners, Rest,
				   PushPartners)
	  end;
      _ ->
	  case lists:keyfind(Id, #partner.id, PartnerList) of
	    Partner = #partner{} ->
		get_23120_partners(PartnerList, LoadPartners, Rest,
				   [Partner | PushPartners]);
	    _ ->
		get_23120_partners(PartnerList, LoadPartners, Rest,
				   PushPartners)
	  end
    end;
get_23120_partners(_, _, _, PushPartners) ->
    PushPartners.

filter_formation([], _, _, NewPosInfo) -> NewPosInfo;
filter_formation([I = #formation_pos{id = Id} | Rest],
		 DiePIds, PartnerList, NewPosInfo)
    when is_integer(Id) ->
    {LimitLev, LimitStar, LimitBreak} =
	secret_dun_data:get_const(filter_condition),
    case lists:keyfind(Id, #partner.id, PartnerList) of
      #partner{lev = Lev, star = Star, break_lev = BreakLev}
	  when Lev >= LimitLev, Star >= LimitStar,
	       BreakLev >= LimitBreak ->
	  case lists:member(I#formation_pos.id, DiePIds) of
	    true ->
		filter_formation(Rest, DiePIds, PartnerList,
				 NewPosInfo);
	    _ ->
		filter_formation(Rest, DiePIds, PartnerList,
				 [I | NewPosInfo])
	  end;
      _ ->
	  filter_formation(Rest, DiePIds, PartnerList, NewPosInfo)
    end;
filter_formation([_ | Rest], DiePIds, PartnerList,
		 NewPosInfo) ->
    filter_formation(Rest, DiePIds, PartnerList,
		     NewPosInfo);
filter_formation(_, _, _, NewPosInfo) -> NewPosInfo.

client_23107([], Data) -> Data;
client_23107([LoadPartner = #load_partner{artifacts =
					      Artifacts,
					  holy_eqm = HolyEqm}
	      | Rest],
	     Data) ->
    NewArtifacts = [{ArtifactPos,
		     item_lib:to_cli_items3(Items)}
		    || {ArtifactPos, Items} <- Artifacts],
    NewHolyEqm = [item_lib:to_cli_items3(HolyItems)
		  || HolyItems <- HolyEqm],
    NewLoadPartner = LoadPartner#load_partner{artifacts =
						  NewArtifacts,
					      holy_eqm = NewHolyEqm},
    client_23107(Rest, [NewLoadPartner | Data]);
client_23107(_, Data) -> Data.

check_formation_pos_info_([], _Role, L, _L2) -> {ok, L};
check_formation_pos_info_([{_Pos, 0, _} | T], Role, L,
			  L2) ->
    check_formation_pos_info_(T, Role, L, L2);
check_formation_pos_info_([{Pos, PId, 0} | T], Role, L,
			  L2)
    when Pos >= 1 andalso Pos =< 5 ->
    FilterL = [1
	       || {_, PId1, Isflag} <- L, PId1 =:= PId, Isflag =:= 0],
    case FilterL =:= [] of
      true ->
	  case partner_lib:get_partner(Role, PId) of
	    #partner{end_time = EndTime} when EndTime =/= 0 ->
		{false, lang:get(<<"赋能英雄不能参与该玩法"/utf8>>)};
	    #partner{bid = Bid} ->
		case lists:member(Bid, L2) of
		  false ->
		      case lists:keymember(Pos, 1, L) of
			true -> {false, lang:get(<<"一个位置只能上一个英雄"/utf8>>)};
			_ ->
			    check_formation_pos_info_(T, Role,
						      [{Pos, PId, 0} | L],
						      [Bid | L2])
		      end;
		  _ -> {false, lang:get(<<"不能同时上阵2个相同英雄"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"没有该伙伴"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"伙伴重复上阵"/utf8>>)}
    end;
check_formation_pos_info_([{Pos, PId, _} | T],
			  Role = #role{m_secret_dun =
					   #m_secret_dun{load_partners =
							     LoadPartners}},
			  L, L2)
    when Pos >= 1 andalso Pos =< 5 ->
    FilterL = [1
	       || {_, PId1, Isflag} <- L, PId1 =:= PId, Isflag =:= 1],
    case FilterL =:= [] of
      true ->
	  case lists:keyfind(PId, #load_partner.pos, LoadPartners)
	      of
	    #load_partner{bid = Bid} ->
		case lists:member(Bid, L2) of
		  false ->
		      case lists:keymember(Pos, 1, L) of
			true -> {false, lang:get(<<"一个位置只能上一个英雄"/utf8>>)};
			_ ->
			    check_formation_pos_info_(T, Role,
						      [{Pos, PId, 1} | L],
						      [Bid | L2])
		      end;
		  _ -> {false, lang:get(<<"不能同时上阵2个相同英雄"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"没有该伙伴"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"伙伴重复上阵"/utf8>>)}
    end;
check_formation_pos_info_(_, _Role, _L, _L2) ->
    {false, lang:get(<<"参数非法"/utf8>>)}.

get_select_ids(Role) ->
    AllIds = [Id
	      || {Id, _} <- secret_dun_data:get_all_limit_id()],
    do_get_select_ids(Role, AllIds, []).

do_get_select_ids(_, [], SelectIds) -> SelectIds;
do_get_select_ids(Role, [Id | Rest], SelectIds) ->
    case check_enter_dun_cond([limit_id, lev, power], Id,
			      Role)
	of
      ok -> do_get_select_ids(Role, Rest, [Id | SelectIds]);
      _ -> do_get_select_ids(Role, Rest, SelectIds)
    end;
do_get_select_ids(_, _, SelectIds) -> SelectIds.

filter_formation_pos_info([], _, NewPosInfo) ->
    NewPosInfo;
filter_formation_pos_info([{Pos, Id, 0} | Rest],
			  PartnerHpRadio, NewPosInfo) ->
    case lists:keyfind(Id, 1, PartnerHpRadio) of
      {_, 0} ->
	  filter_formation_pos_info(Rest, PartnerHpRadio,
				    NewPosInfo);
      _ ->
	  filter_formation_pos_info(Rest, PartnerHpRadio,
				    [{Pos, Id, 0} | NewPosInfo])
    end;
filter_formation_pos_info([{Pos, Id, Type} | Rest],
			  PartnerHpRadio, NewPosInfo) ->
    case lists:keyfind({Id, <<>>}, 1, PartnerHpRadio) of
      {_, 0} ->
	  filter_formation_pos_info(Rest, PartnerHpRadio,
				    NewPosInfo);
      _ ->
	  filter_formation_pos_info(Rest, PartnerHpRadio,
				    [{Pos, Id, Type} | NewPosInfo])
    end;
filter_formation_pos_info(_, _, NewPosInfo) ->
    NewPosInfo.

filter_sys_formation_pos_info([], _, _,
			      NewSysPosInfo) ->
    NewSysPosInfo;
filter_sys_formation_pos_info([{Pos, Id, IsFlag}
			       | Rest],
			      PartnerHpRadio, PartnerList, NewSysPosInfo) ->
    {LimitLev, LimitStar, LimitBreak} =
	secret_dun_data:get_const(filter_condition),
    case lists:keyfind(Id, #partner.id, PartnerList) of
      #partner{lev = Lev, star = Star, break_lev = BreakLev}
	  when Lev >= LimitLev, Star >= LimitStar,
	       BreakLev >= LimitBreak ->
	  case lists:keyfind(Id, 1, PartnerHpRadio) of
	    {_, 0} ->
		filter_sys_formation_pos_info(Rest, PartnerHpRadio,
					      PartnerList, NewSysPosInfo);
	    _ ->
		filter_sys_formation_pos_info(Rest, PartnerHpRadio,
					      PartnerList,
					      [{Pos, Id, IsFlag}
					       | NewSysPosInfo])
	  end;
      _ ->
	  filter_sys_formation_pos_info(Rest, PartnerHpRadio,
					PartnerList, NewSysPosInfo)
    end;
filter_sys_formation_pos_info(_, _, _, NewSysPosInfo) ->
    NewSysPosInfo.

get_all_reward_list(_DunIds, _RewardDunIds, [],
		    RewardList) ->
    RewardList;
get_all_reward_list(DunIds, RewardDunIds, [Id | Rest],
		    RewardList) ->
    case lists:member(Id, DunIds) of
      true ->
	  case lists:member(Id, RewardDunIds) of
	    true ->
		get_all_reward_list(DunIds, RewardDunIds, Rest,
				    RewardList);
	    _ ->
		case secret_dun_data:get_first_reward(Id) of
		  RewardListData when is_list(RewardListData) ->
		      get_all_reward_list(DunIds, RewardDunIds, Rest,
					  RewardList ++ RewardListData);
		  _ ->
		      get_all_reward_list(DunIds, RewardDunIds, Rest,
					  RewardList)
		end
	  end;
      _ ->
	  get_all_reward_list(DunIds, RewardDunIds, Rest,
			      RewardList)
    end;
get_all_reward_list(_DunIds, _RewardDunIds, _,
		    RewardList) ->
    RewardList.


