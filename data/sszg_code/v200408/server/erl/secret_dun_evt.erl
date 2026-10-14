-file("src/mod/secret_dun/secret_dun_evt.erl", 1).

-module(secret_dun_evt).

-lager_records([{sprite_plan,
		 [ver, id, name, plan_sprites]},
		{team_sprite, [ver, team, plan_id, team_sprites]},
		{formation_sprite, [ver, type, team_list]},
		{m_sprite_tree,
		 [ver, lev, break_lev, all_attr, sprites, power,
		  max_power, formation_list, plan_list]},
		{sprite_hatch,
		 [ver, id, is_open, lev, do_id, need_point, do_point,
		  state, end_time, all_end_time]},
		{m_sprite_hatch,
		 [ver, list, day_privilege_mail, day_buy_list, handbook,
		  baodi_info]},
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
		{role_match,
		 [id, name, lev, power, max_power, arena_power,
		  arena_max_power]},
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

-export([click/4, action/8]).

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

-file("src/mod/secret_dun/secret_dun_evt.erl", 12).

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

-file("src/mod/secret_dun/secret_dun_evt.erl", 13).

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

-file("src/mod/secret_dun/secret_dun_evt.erl", 14).

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

-file("src/mod/secret_dun/secret_dun_evt.erl", 15).

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

-file("src/mod/secret_dun/secret_dun_evt.erl", 16).

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

-file("src/mod/secret_dun/secret_dun_evt.erl", 17).

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

-file("src/mod/secret_dun/secret_dun_evt.erl", 18).

-file("inc/role_match.hrl", 1).

-record(role_match,
	{id = {0, <<>>}, name = <<>>, lev = 0, power = 0,
	 max_power = 0, arena_power = 0, arena_max_power = 0}).

-file("src/mod/secret_dun/secret_dun_evt.erl", 19).

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

-file("src/mod/secret_dun/secret_dun_evt.erl", 20).

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

-file("src/mod/secret_dun/secret_dun_evt.erl", 21).

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

-file("src/mod/secret_dun/secret_dun_evt.erl", 22).

-file("inc/game_assets.hrl", 1).

-file("src/mod/secret_dun/secret_dun_evt.erl", 23).

-file("inc/sprite.hrl", 1).

-record(m_sprite_hatch,
	{ver = 5, list = [], day_privilege_mail = 0,
	 day_buy_list = [], handbook = [], baodi_info = []}).

-record(sprite_hatch,
	{ver = 2, id = 0, is_open = 0, lev = 0, do_id = 0,
	 need_point = 0, do_point = 0, state = 0, end_time = 0,
	 all_end_time = 0}).

-record(m_sprite_tree,
	{ver = 3, lev = 1, break_lev = 0, all_attr,
	 sprites = [], power = 0, max_power = 0,
	 formation_list = []  :: list(),
	 plan_list = []  :: list()}).

-record(formation_sprite,
	{ver = 1  :: pos_integer(), type = 0  :: pos_integer(),
	 team_list = []  :: list()}).

-record(team_sprite,
	{ver = 1  :: pos_integer(), team = 1  :: pos_integer(),
	 plan_id = 0  :: pos_integer(),
	 team_sprites = []  :: list()}).

-record(sprite_plan,
	{ver = 1  :: pos_integer(), id = 1  :: pos_integer(),
	 name = <<>>  :: string(),
	 plan_sprites = []  :: list()}).

-file("src/mod/secret_dun/secret_dun_evt.erl", 24).

-spec click(#role{}, Index :: pos_integer(),
	    Action :: non_neg_integer(), Ext :: list()) -> {false,
							    binary()} |
							   {ok, #role{}} | ok.

click(#role{m_secret_dun = #m_secret_dun{dun_id = 0}},
      _, _, _) ->
    {false, lang:get(<<"无法操作"/utf8>>)};
click(Role = #role{m_secret_dun =
		       SecretDun = #m_secret_dun{floor_list = FloorList,
						 dun_floor = NowFloor}},
      Index, Action, Ext) ->
    case lists:keyfind(NowFloor, #secret_floor.floor,
		       FloorList)
	of
      SecretFloor = #secret_floor{index = NowIndex,
				  tile_list = TileList} ->
	  case secret_dun_tile:check_click(NowIndex, Index) of
	    true ->
		case lists:keyfind(Index, #secret_tile.index, TileList)
		    of
		  false -> {false, lang:get(<<"格子事件不存在"/utf8>>)};
		  #secret_tile{is_hide = 1} ->
		      {false, lang:get(<<"该格子不能操作"/utf8>>)};
		  #secret_tile{status = Status}
		      when Status =:= 2 orelse Status =:= 3 ->
		      {false, lang:get(<<"该格子不能操作"/utf8>>)};
		  SecretTile = #secret_tile{evtid = EvtId, status = 1} ->
		      do_click(Role, SecretDun, SecretFloor, SecretTile,
			       Action, Ext, secret_dun_data:get_evt(EvtId));
		  _ -> {false, lang:get(<<"格子状态异常"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"事件距离太远"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"没有该层的信息"/utf8>>)}
    end.

-spec action(#role{}, #m_secret_dun{}, #secret_floor{},
	     #secret_tile{}, list(), #evt_data{}, list(),
	     tuple()) -> {ok, #role{}} | {false, string()}.

action(Role = #role{},
       SecretDun = #m_secret_dun{floor_list = FloorList,
				 dun_id = DunId, dun_floor = NowFloor},
       SecretFloor = #secret_floor{floor = Floor,
				   tile_list = TileList},
       SecretTile = #secret_tile{index = Index, evtid = EvtId},
       _,
       #evt_data{type = Type, group_id = GroupId, id = LogId},
       [], Args) ->
    NewTileList = lists:keyreplace(Index,
				   #secret_tile.index, TileList, SecretTile),
    NewSecretFloor = SecretFloor#secret_floor{tile_list =
						  NewTileList},
    NewFloorList = lists:keyreplace(Floor,
				    #secret_floor.floor, FloorList,
				    NewSecretFloor),
    NewSecretDun = SecretDun#m_secret_dun{floor_list =
					      NewFloorList},
    NewRole = Role#role{m_secret_dun = NewSecretDun},
    NewRole1 = secret_dun:session(NewRole, EvtId),
    ChangeTileList = maps:get(change_tile_list, Args, []),
    NewChangeTileList = [SecretTile | ChangeTileList],
    secret_dun:push(NewRole1, 23102,
		    {Floor, NewChangeTileList}),
    secret_dun:push(NewRole1, 23100),
    NewRole3 = case Type of
		 3 ->
		     role_trigger:fire(#evt_enter_secret_treasure{},
				       NewRole1);
		 2 ->
		     case maps:get(combat, Args, 0) of
		       0 ->
			   case maps:get(flag, Args, 0) of
			     1 ->
				 role_trigger:fire([#evt_enter_secret_kill_monster{},
						    #evt_enter_secret_kill_monster2{}],
						   NewRole1);
			     _ -> NewRole1
			   end;
		       _ -> NewRole1
		     end;
		 16 ->
		     role_trigger:fire(#evt_enter_secret_reply{}, NewRole1);
		 9 ->
		     secret_dun:push(NewRole1, 23115),
		     role_trigger:fire(#evt_enter_secret_loan{}, NewRole1);
		 8 ->
		     case lists:keyfind(NowFloor, #secret_floor.floor,
					NewFloorList)
			 of
		       #secret_floor{walk_tile = WalkTile} ->
			   case length(WalkTile) > 1 of
			     true -> ok;
			     _ ->
				 LogName = case
					     secret_dun_data:get_dun_name({DunId,
									   NowFloor})
					       of
					     undefined ->
						 lang:get(<<"极冰雪原"/utf8>>);
					     Name -> Name
					   end,
				 log:save(join,
					  {NewRole1, <<"位面探险"/utf8>>,
					   util:fbin(<<"~ts-~w"/utf8>>,
						     [LogName, NowFloor])}),
				 log:save(task,
					  {NewRole1, 0, DunId,
					   util:fbin(<<"进入位面探险副本-~w"/utf8>>,
						     [NowFloor]),
					   101, <<"位面探险通关"/utf8>>,
					   util:fbin(<<"任务对应层数-~w"/utf8>>,
						     [NowFloor])}),
				 log:save(task,
					  {NewRole1, 1, DunId,
					   util:fbin(<<"进入位面探险副本-~w"/utf8>>,
						     [Floor]),
					   101, <<"位面探险通关"/utf8>>,
					   util:fbin(<<"任务对应层数-~w"/utf8>>,
						     [Floor])})
			   end
		     end,
		     NewRole1;
		 _ -> NewRole1
	       end,
    IsPass = maps:get(is_pass, Args, 0),
    NewRole4 = case IsPass =:= 1 of
		 true ->
		     log:save(task,
			      {NewRole3, 1, DunId,
			       util:fbin(<<"进入位面探险副本-~w"/utf8>>, [DunId]), 101,
			       <<"位面探险通关"/utf8>>, <<"位面探险通关"/utf8>>}),
		     log:save(task,
			      {NewRole3, 1, DunId,
			       util:fbin(<<"进入位面探险副本-~w"/utf8>>, [Floor]), 101,
			       <<"位面探险通关"/utf8>>,
			       util:fbin(<<"任务对应层数-~w"/utf8>>, [Floor])}),
		     log:save(task,
			      {NewRole3, 0, LogId,
			       util:fbin(<<"位面探险通关100%副本Id-~w"/utf8>>, [DunId]),
			       105, <<"位面探险"/utf8>>, <<"位面探险"/utf8>>}),
		     log:save(task,
			      {NewRole3, 1, LogId,
			       util:fbin(<<"位面探险通关100%副本Id-~w"/utf8>>, [DunId]),
			       105, <<"位面探险"/utf8>>, <<"位面探险"/utf8>>}),
		     role_trigger:fire(#evt_enter_secret_pass{dun_id =
								  DunId},
				       NewRole3);
		 _ -> NewRole3
	       end,
    case lists:member(Type,
		      secret_dun_evt_lib:get_no_log_event())
	of
      true -> ok;
      _ ->
	  IsCombatLog = maps:get(combat, Args, 0),
	  case (Type =:= 1 orelse Type =:= 2) andalso
		 IsCombatLog =:= 1
	      of
	    true -> ok;
	    _ ->
		TypeLogName = secret_dun_evt_lib:get_name(Type),
		log:save(join,
			 {NewRole4, <<"位面探险事件参与"/utf8>>,
			  util:fbin(<<"~ts-~w-~w"/utf8>>,
				    [TypeLogName, DunId, Floor])}),
		log:save(task,
			 {NewRole4, 0, LogId,
			  util:fbin(<<"~w-~w-~ts"/utf8>>,
				    [DunId, Floor, TypeLogName]),
			  102, <<"位面探险事件"/utf8>>, <<"位面探险事件"/utf8>>}),
		log:save(task,
			 {NewRole4, 1, LogId,
			  util:fbin(<<"~w-~w-~ts"/utf8>>,
				    [DunId, Floor, TypeLogName]),
			  102, <<"位面探险事件"/utf8>>, <<"位面探险事件"/utf8>>}),
		case GroupId > 0 of
		  true ->
		      log:save(task,
			       {NewRole4, 0,
				DunId * 1000000 + Floor * 1000 + GroupId,
				util:fbin(<<"~w-~w-~w"/utf8>>,
					  [DunId, Floor, GroupId]),
				104, <<"位面探险事件"/utf8>>, <<"位面探险事件"/utf8>>}),
		      log:save(task,
			       {NewRole4, 1,
				DunId * 1000000 + Floor * 1000 + GroupId,
				util:fbin(<<"~w-~w-~w"/utf8>>,
					  [DunId, Floor, GroupId]),
				104, <<"位面探险事件"/utf8>>, <<"位面探险事件"/utf8>>});
		  _ -> ok
		end
	  end
    end,
    {ok, NewRole4};
action(Role, SecretDun, SecretFloor, SecretTile, Ext,
       EvtData, [do | Rest], Args) ->
    case do_action(Role, SecretDun, SecretFloor, SecretTile,
		   Ext, EvtData, Args)
	of
      ok ->
	  action(Role, SecretDun, SecretFloor, SecretTile, Ext,
		 EvtData, Rest, Args#{flag => 1});
      {ok, NewRole, NewSecretDun, NewSecretFloor,
       NewSecretTile, NewArgs} ->
	  action(NewRole, NewSecretDun, NewSecretFloor,
		 NewSecretTile, Ext, EvtData, Rest, NewArgs);
      {ok, NewRole, NewSecretDun, NewSecretFloor,
       NewSecretTile, NewArgs, combat} ->
	  action(NewRole, NewSecretDun, NewSecretFloor,
		 NewSecretTile, Ext, EvtData, [hide],
		 NewArgs#{combat => 1});
      {false, Reason} -> {false, Reason};
      _ -> {false, lang:get(<<"参数错误"/utf8>>)}
    end;
action(Role, SecretDun, SecretFloor,
       SecretTile = #secret_tile{status = Status}, Ext,
       EvtData = #evt_data{win_delete = WinFlag,
			   false_delete = LoseFlag, type = Type},
       [delete | Rest], Args = #{flag := Flag}) ->
    {NewSecretTile, FlagExchage} = case Type =:= 10 of
				     true ->
					 {SecretTile#secret_tile{status = 2},
					  1};
				     _ ->
					 case Flag =:= 1 andalso WinFlag =:= 1
						orelse
						Flag =:= 0 andalso
						  LoseFlag =:= 1
					     of
					   true ->
					       case Status =:= 1 of
						 true ->
						     {SecretTile#secret_tile{status
										 =
										 2},
						      1};
						 _ -> {SecretTile, 1}
					       end;
					   _ -> {SecretTile, 0}
					 end
				   end,
    action(Role, SecretDun, SecretFloor, NewSecretTile, Ext,
	   EvtData, Rest, Args#{exchange => FlagExchage});
action(Role, SecretDun, SecretFloor,
       SecretTile = #secret_tile{win_reward_time =
				     WinRewardTime,
				 false_reward_time = FalseRewardTime},
       Ext,
       EvtData = #evt_data{win_reward_time = WinDataTime,
			   win_reward_list = WinRewardList,
			   false_reward_time = FalseDataTime,
			   false_reward_list = FalseRewardList, type = Type},
       [reward | Rest], Args = #{flag := Flag}) ->
    Return = case Flag of
	       3 ->
		   RewardList = maps:get(reward, Args, []),
		   reward(Role, SecretDun, SecretFloor, SecretTile, Flag,
			  RewardList, Type);
	       1 when WinDataTime > WinRewardTime ->
		   reward(Role, SecretDun, SecretFloor, SecretTile, Flag,
			  WinRewardList, Type);
	       0 when FalseDataTime > FalseRewardTime ->
		   reward(Role, SecretDun, SecretFloor, SecretTile, Flag,
			  FalseRewardList, Type);
	       _ -> {Role, SecretDun, SecretFloor, SecretTile}
	     end,
    case Return of
      {NewRole, NewSecretDun, NewSecretFloor,
       NewSecretTile} ->
	  action(NewRole, NewSecretDun, NewSecretFloor,
		 NewSecretTile, Ext, EvtData, Rest, Args);
      {false, Reason} -> {false, Reason};
      _ -> {false, lang:get(<<"获得奖励失败"/utf8>>)}
    end;
action(Role, SecretDun, SecretFloor,
       SecretTile = #secret_tile{}, Ext,
       EvtData = #evt_data{exchange_id = ExchangeId},
       [exchange | Rest], Args = #{exchange := Exchange}) ->
    NewSecretTile = case Exchange =:= 1 of
		      true when ExchangeId < 0 -> SecretTile;
		      true when ExchangeId =:= 0 ->
			  SecretTile#secret_tile{status = 3, evtid = 0,
						 win_reward_time = 0,
						 false_reward_time = 0,
						 ext = [], defend_radio = [],
						 platform = 0, switch = 0,
						 is_hide = 0};
		      true ->
			  SecretTile#secret_tile{status = 1, evtid = ExchangeId,
						 win_reward_time = 0,
						 false_reward_time = 0,
						 ext = [], defend_radio = [],
						 platform = 0, switch = 0,
						 is_hide = 0};
		      _ -> SecretTile
		    end,
    action(Role, SecretDun, SecretFloor, NewSecretTile, Ext,
	   EvtData, Rest, Args);
action(Role, SecretDun, SecretFloor,
       SecretTile = #secret_tile{index = Index}, Ext,
       EvtData = #evt_data{group_id = GroupId}, [hide | Rest],
       Args) ->
    case GroupId =:= 0 of
      true ->
	  action(Role, SecretDun, SecretFloor, SecretTile, Ext,
		 EvtData, Rest, Args);
      _ ->
	  {NewSecretFloor, AddChangeTileList} =
	      secret_dun_evt_lib:hide(SecretFloor, GroupId, Index),
	  ChangeTileList = maps:get(change_tile_list, Args, []),
	  NewChangeTileList = ChangeTileList ++ AddChangeTileList,
	  action(Role, SecretDun, NewSecretFloor, SecretTile, Ext,
		 EvtData, Rest,
		 Args#{change_tile_list => NewChangeTileList})
    end;
action(Role,
       SecretDun = #m_secret_dun{val = Val, max_val = MaxVal,
				 dun_ids = DunIds, dun_id = DunId},
       SecretFloor, SecretTile = #secret_tile{evtid = EvTid},
       Ext, EvtData, [add_val | Rest], Args) ->
    AddVal = secret_dun_data:get_event_val(EvTid),
    NewVal = AddVal + Val,
    NewDunIds = case NewVal >= MaxVal of
		  true ->
		      case lists:member(DunId, DunIds) of
			true -> DunIds;
			_ -> [DunId | DunIds]
		      end;
		  _ -> DunIds
		end,
    IsPass = case Val < MaxVal andalso NewVal >= MaxVal of
	       true -> 1;
	       _ -> 0
	     end,
    NewSecretDun = SecretDun#m_secret_dun{val = NewVal,
					  dun_ids = NewDunIds},
    action(Role, NewSecretDun, SecretFloor, SecretTile, Ext,
	   EvtData, Rest, Args#{is_pass => IsPass});
action(_, _, _, _, _, _, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

do_click(Role, SecretDun, SecretFloor, SecretTile, 0,
	 Ext, EvtData) ->
    case observer(Role, SecretDun, SecretFloor, SecretTile,
		  Ext, EvtData)
	of
      ok -> {ok, Role};
      {ok, NewRole,
       NewSecretDun = #m_secret_dun{floor_list = FloorList},
       NewSecretFloor = #secret_floor{floor = Floor,
				      tile_list = TileList},
       NewSecretTile = #secret_tile{index = Index}} ->
	  NewTileList = lists:keyreplace(Index,
					 #secret_tile.index, TileList,
					 NewSecretTile),
	  NewSecretFloor1 = NewSecretFloor#secret_floor{tile_list
							    = NewTileList},
	  NewFloorList = lists:keyreplace(Floor,
					  #secret_floor.floor, FloorList,
					  NewSecretFloor1),
	  NewSecretDun1 = NewSecretDun#m_secret_dun{floor_list =
							NewFloorList},
	  NewRole1 = NewRole#role{m_secret_dun = NewSecretDun1},
	  {ok, NewRole1};
      {false, Reason} -> {false, Reason}
    end;
do_click(Role, SecretDun, SecretFloor, SecretTile, 1,
	 Ext, EvtData) ->
    action(Role, SecretDun, SecretFloor, SecretTile, Ext,
	   EvtData, [do, delete, reward, add_val, exchange, hide],
	   #{});
do_click(_Role, _SecretDun, _SecretFloor, _SecretTile,
	 _Action, _Ext, _EvtData) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsecret_dun_evt278, _,
       {__Levelsecret_dun_evt278, __Tracessecret_dun_evt278}}
	  when __Levelsecret_dun_evt278 band 8 /= 0 orelse
		 __Tracessecret_dun_evt278 /= [] ->
	  lager:do_log(error,
		       [{module, secret_dun_evt}, {function, do_click},
			{line, 278}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]操作格子:~w 失败 action=~w ext=~w, "
				     "evt_data=~w",
				     [_Role#role.name, _SecretTile, _Action,
				      _Ext, _EvtData]),
		       none, 4096, 8, __Levelsecret_dun_evt278,
		       __Tracessecret_dun_evt278, lager_event,
		       __Pidsecret_dun_evt278);
      _ -> ok
    end,
    {false, lang:get(<<"操作失败"/utf8>>)}.

observer(_Role, _SecretDun, _SecretFloor, _SecretTile,
	 _Ext, #evt_data{type = 0}) ->
    ok;
observer(_Role, _SecretDun, _SecretFloor, _SecretTile,
	 _Ext, #evt_data{type = 3}) ->
    ok;
observer(Role = #role{lev = RoleLev},
	 SecretDun = #m_secret_dun{dun_id = DunId,
				   dun_power = MaxPower},
	 SecretFloor,
	 SecretTile = #secret_tile{ext = RoleExt,
				   defend_radio = DefendRadio},
	 _Ext, #evt_data{type = 1, ext = DataExt}) ->
    NewStrengthRadio = case lists:keyfind(strength, 1,
					  DataExt)
			   of
			 {strength, StrengthRadio} -> StrengthRadio;
			 _ -> 1000
		       end,
    case RoleExt of
      [{FightId, Name}] ->
	  #{partners := Partners, lev := Lev, face := Face,
	    formation := FormationType,
	    hallows := {HallowsId, _, _}} =
	      robot:get(Role, FightId, #{max_num => 5}),
	  ExpendPower = lists:sum([PPower
				   || #partner{power = PPower} <- Partners]),
	  Fun = fun (#partner{id = Pid, bid = Bid,
			      use_skin = UseSkin, lev = PLev, star = Star}) ->
			HpPer = case lists:keyfind(Pid, 1, DefendRadio) of
				  {_, Radio} -> Radio;
				  _ -> 100
				end,
			{Pid, Pid, Bid, PLev, Star, [{5, UseSkin}], HpPer}
		end,
	  PList = [Fun(I) || I <- Partners],
	  secret_dun:push(Role, 23109,
			  {FightId, <<>>, Name, Face, Lev, ExpendPower, PList,
			   FormationType, [], HallowsId, 0, NewStrengthRadio}),
	  ok;
      [{FightId, Name, FormationType, _PosInfo,
	{HallowsId, _HallowsStep, _HallowsSkill}, Partners,
	SpriteLev, _SpriteBreakLev, Sprites}] ->
	  #{lev := Lev, face := Face} = robot:get(Role, FightId,
						  #{max_num => 5}),
	  ExpendPower = lists:sum([PPower
				   || #partner{power = PPower} <- Partners]),
	  Fun = fun (#partner{id = Pid, bid = Bid,
			      use_skin = UseSkin, lev = PLev, star = Star}) ->
			HpPer = case lists:keyfind(Pid, 1, DefendRadio) of
				  {_, Radio} -> Radio;
				  _ -> 100
				end,
			{Pid, Pid, Bid, PLev, Star, [{5, UseSkin}], HpPer}
		end,
	  PList = [Fun(I) || I <- Partners],
	  secret_dun:push(Role, 23109,
			  {FightId, <<>>, Name, Face, Lev, ExpendPower, PList,
			   FormationType, Sprites, HallowsId, SpriteLev,
			   NewStrengthRadio}),
	  ok;
      _ ->
	  CalculatingCoefficient =
	      secret_dun_data:get_const(calculating_coefficient),
	  MinPowerLimit1 = case
			     secret_dun_data:get_limit_power(DunId)
			       of
			     MinPowerLimit when is_integer(MinPowerLimit) ->
				 MinPowerLimit;
			     _ -> 100000
			   end,
	  RealPower = (MinPowerLimit1 +
			 round(MaxPower - MinPowerLimit1))
			/ (round(RoleLev / 5) * CalculatingCoefficient)
			* (round(RoleLev / 5) * CalculatingCoefficient),
	  RealPower1 = trunc(RealPower),
	  Return = case lists:keyfind(group, 1, DataExt) of
		     {group, GroupId} ->
			 case secret_dun_data:get_robot_ids({GroupId,
							     RealPower1})
			     of
			   IdList when is_list(IdList) -> {1, IdList};
			   _ -> false
			 end;
		     _ -> false
		   end,
	  case Return of
	    {1, IdList1} ->
		case util:rand_list(IdList1, 2) of
		  {FightId, _} ->
		      Name1 = lang:get(<<"首领怪物"/utf8>>),
		      Name = <<Name1/binary>>,
		      #{partners := Partners, lev := Lev, face := Face,
			formation := FormationType,
			hallows := {HallowsId, HallowsStep, HallowsSkill},
			sprite_info := {SpriteLev, SpriteBreakLev, Sprites}} =
			  robot:get(Role#role{max_power = RealPower1}, FightId,
				    #{max_num => 5}),
		      ExpendPower = lists:sum([PPower
					       || #partner{power = PPower}
						      <- Partners]),
		      Fun = fun (#partner{id = Pid, bid = Bid,
					  use_skin = UseSkin, lev = PLev,
					  star = Star}) ->
				    HpPer = case lists:keyfind(Pid, 1,
							       DefendRadio)
						of
					      {_, Radio1} -> Radio1;
					      _ -> 100
					    end,
				    {Pid, Pid, Bid, PLev, Star, [{5, UseSkin}],
				     HpPer}
			    end,
		      PList = [Fun(I) || I <- Partners],
		      secret_dun:push(Role, 23109,
				      {FightId, <<>>, Name, Face, Lev,
				       ExpendPower, PList, FormationType,
				       Sprites, HallowsId, SpriteLev,
				       NewStrengthRadio}),
		      PosInfo = [{Pid1, Pid1}
				 || #partner{id = Pid1} <- Partners],
		      NewSecretTile = SecretTile#secret_tile{ext =
								 [{FightId,
								   Name,
								   FormationType,
								   PosInfo,
								   {HallowsId,
								    HallowsStep,
								    HallowsSkill},
								   Partners,
								   SpriteLev,
								   SpriteBreakLev,
								   Sprites}]},
		      {ok, Role, SecretDun, SecretFloor, NewSecretTile};
		  _ -> {false, lang:get(<<"没有对应的怪物"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"没有对应的怪物"/utf8>>)}
	  end
    end;
observer(Role,
	 SecretDun = #m_secret_dun{dun_power = MaxPower},
	 SecretFloor,
	 SecretTile = #secret_tile{ext = RoleExt,
				   defend_radio = DefendRadio},
	 Ext, DataExt = #evt_data{type = 2, ext = EventExt}) ->
    NewStrengthRadio = case lists:keyfind(group, 1,
					  EventExt)
			   of
			 {group, GroupId} ->
			     case secret_dun_data:get_guard_ext({GroupId,
								 MaxPower})
				 of
			       NewDataExt when is_list(NewDataExt) ->
				   case lists:keyfind(strength, 1, NewDataExt)
				       of
				     {strength, StrengthRadio} -> StrengthRadio;
				     _ -> 1000
				   end;
			       _ -> 1000
			     end;
			 _ -> 1000
		       end,
    case RoleExt of
      [{FightId = {Rid, SrvId}, Name}] ->
	  case role_robot:get_role(FightId) of
	    {ok,
	     Robot = #role_robot{face_id = Face, lev = Lev,
				 partners = Partners,
				 m_sprite_tree =
				     #m_sprite_tree{sprites = Sprites}}} ->
		#formation_sys{pos_info = PosInfo, type = FormationType,
			       hallows_id = HallowsId} =
		    formation:get_sys_formation(Robot, 1),
		{PushList, AllPower} = get_push_and_power(PosInfo,
							  Partners, DefendRadio,
							  [], 0),
		secret_dun:push(Role, 23109,
				{Rid, SrvId, Name, Face, Lev, AllPower,
				 PushList, FormationType, Sprites, HallowsId, 0,
				 NewStrengthRadio}),
		ok;
	    _ ->
		get_arena_defend(Role, SecretDun, SecretFloor,
				 SecretTile, Ext, DataExt)
	  end;
      [{FightId = {Rid, SrvId}, Name, FormationType, PosInfo,
	HallowsId, Partners, SpriteLev, _SpriteBreakLev,
	Sprites}] ->
	  case role_robot:get_role(FightId) of
	    {ok, #role_robot{face_id = Face, lev = Lev}} ->
		Fun = fun ({Pos, PId}) ->
			      #partner{bid = Bid, use_skin = UseSkin,
				       lev = PLev, star = Star} =
				  lists:keyfind(PId, #partner.id, Partners),
			      HpPer = case lists:keyfind(PId, 1, DefendRadio) of
					{_, Radio} -> Radio;
					_ -> 100
				      end,
			      {PId, Pos, Bid, PLev, Star, [{5, UseSkin}], HpPer}
		      end,
		PList = [Fun(I) || I <- PosInfo],
		ExpendPower = lists:sum([PPower
					 || #partner{power = PPower}
						<- Partners]),
		secret_dun:push(Role, 23109,
				{Rid, SrvId, Name, Face, Lev, ExpendPower,
				 PList, FormationType, Sprites, HallowsId,
				 SpriteLev, NewStrengthRadio}),
		ok;
	    _ ->
		get_arena_defend(Role, SecretDun, SecretFloor,
				 SecretTile, Ext, DataExt)
	  end;
      [{FightId, Name}] ->
	  #{partners := Partners, lev := Lev, face := Face,
	    formation := FormationType,
	    hallows := {HallowsId, _, _}} =
	      robot:get(Role, FightId, #{max_num => 5}),
	  ExpendPower = lists:sum([PPower
				   || #partner{power = PPower} <- Partners]),
	  Fun = fun (#partner{id = Pid, bid = Bid,
			      use_skin = UseSkin, lev = PLev, star = Star}) ->
			HpPer = case lists:keyfind(Pid, 1, DefendRadio) of
				  {_, Radio} -> Radio;
				  _ -> 100
				end,
			{Pid, Pid, Bid, PLev, Star, [{5, UseSkin}], HpPer}
		end,
	  PList = [Fun(I) || I <- Partners],
	  secret_dun:push(Role, 23109,
			  {FightId, <<>>, Name, Face, Lev, ExpendPower, PList,
			   FormationType, [], HallowsId, 0, NewStrengthRadio}),
	  ok;
      [{FightId, Name, FormationType, _PosInfo,
	{HallowsId, _HallowsStep, _HallowsSkill}, Partners,
	SpriteLev, _SpriteBreakLev, Sprites}] ->
	  #{lev := Lev, face := Face} = robot:get(Role, FightId,
						  #{max_num => 5}),
	  ExpendPower = lists:sum([PPower
				   || #partner{power = PPower} <- Partners]),
	  Fun = fun (#partner{id = Pid, bid = Bid,
			      use_skin = UseSkin, lev = PLev, star = Star}) ->
			HpPer = case lists:keyfind(Pid, 1, DefendRadio) of
				  {_, Radio} -> Radio;
				  _ -> 100
				end,
			{Pid, Pid, Bid, PLev, Star, [{5, UseSkin}], HpPer}
		end,
	  PList = [Fun(I) || I <- Partners],
	  secret_dun:push(Role, 23109,
			  {FightId, <<>>, Name, Face, Lev, ExpendPower, PList,
			   FormationType, Sprites, HallowsId, SpriteLev,
			   NewStrengthRadio}),
	  ok;
      _ ->
	  get_arena_defend(Role, SecretDun, SecretFloor,
			   SecretTile, Ext, DataExt)
    end;
observer(_Role, _SecretDun, _SecretFloor, _SecretTile,
	 _Ext, #evt_data{type = 4}) ->
    ok;
observer(Role,
	 _SecretDun = #m_secret_dun{dun_id = DunId},
	 _SecretFloor = #secret_floor{floor = Floor},
	 _SecretTile = #secret_tile{index = Index}, _Ext,
	 #evt_data{type = 5, ext = BillBoardId}) ->
    case BillBoardId of
      [Id | _] ->
	  secret_dun:push(Role, 23108,
			  {DunId, Floor, Index, [{8, Id, 0}]}),
	  ok;
      _ -> ok
    end;
observer(_Role, _SecretDun, _SecretFloor, _SecretTile,
	 _Ext, #evt_data{type = 6}) ->
    ok;
observer(_Role, _SecretDun, _SecretFloor, _SecretTile,
	 _Ext, #evt_data{type = Type})
    when Type =:= 7 orelse Type =:= 16 ->
    ok;
observer(_Role, _SecretDun, _SecretFloor, _SecretTile,
	 _Ext, #evt_data{type = 8}) ->
    ok;
observer(Role = #role{id = RoleId,
		      partner_bag = #partner_bag{partner_list = PartnerList}},
	 SecretDun = #m_secret_dun{dun_power = MaxPower},
	 SecretFloor, SecretTile = #secret_tile{ext = ShowList},
	 _Ext, #evt_data{type = 9, ext = DataExt}) ->
    case ShowList of
      [] ->
	  PlayerNumber = secret_dun_data:get_const(number_player),
	  CorrectionFactor =
	      secret_dun_data:get_const(correction_factor),
	  {MinPowerRadio, MaxPowerRadio} =
	      secret_dun_data:get_const(combat_section),
	  MinPlayerPower = round(MinPowerRadio * MaxPower / 1000),
	  MaxPlayerPower = round(MaxPowerRadio * MaxPower / 1000),
	  PartnerNum = case lists:keyfind(num, 1, DataExt) of
			 {num, Num} -> Num;
			 _ -> 4
		       end,
	  PartnerPowerSection1 = case lists:keyfind(power, 1,
						    DataExt)
				     of
				   {power, PartnerPowerSection} ->
				       PartnerPowerSection;
				   _ -> [{800, 1200}]
				 end,
	  MaxPartnerPower = case
			      lists:reverse(lists:keysort(#partner.power,
							  PartnerList))
				of
			      #partner{power = Power} -> Power;
			      _ -> 10000
			    end,
	  RealPower = MaxPower / 5 +
			max(MaxPartnerPower - MaxPower / 5 * CorrectionFactor,
			    0),
	  case role_match:search(#{num => PlayerNumber,
				   conds =>
				       [#{type => power, min_lev => 0,
					  max_lev => 200,
					  min_power => MinPlayerPower,
					  max_power => MaxPlayerPower,
					  exclude => [RoleId]}]})
	      of
	    {ok, _, L} ->
		NewL = list_util:shuffle(L),
		case get_load_partner(NewL, PartnerNum,
				      PartnerPowerSection1, RealPower, [],
				      MaxPower)
		    of
		  {ok, NewShowList} ->
		      NewSecretTile = SecretTile#secret_tile{ext =
								 NewShowList},
		      secret_dun:push(Role, 23107, {NewShowList}),
		      {ok, Role, SecretDun, SecretFloor, NewSecretTile};
		  {false, Reason} -> {false, Reason}
		end;
	    _ ->
		case secret_dun_data:get_loan_group(MaxPower) of
		  RobotGroup when is_integer(RobotGroup) ->
		      FilterRobotGroup = [{LoanId, LoanWeight}
					  || {LoanId, GroupId, LoanWeight}
						 <- secret_dun_data:get_all_loan_partner(),
					     GroupId =:= RobotGroup],
		      AddLoanPartner = get_loan_robot(PartnerNum,
						      FilterRobotGroup, [], []),
		      NewShowList = convert_load_partner(1, AddLoanPartner,
							 []),
		      NewSecretTile = SecretTile#secret_tile{ext =
								 NewShowList},
		      secret_dun:push(Role, 23107, {NewShowList}),
		      {ok, Role, SecretDun, SecretFloor, NewSecretTile};
		  _ -> {false, lang:get(<<"没有符合条件的租借英雄"/utf8>>)}
		end
	  end;
      _ -> secret_dun:push(Role, 23107, {ShowList}), ok
    end;
observer(Role,
	 SecretDun = #m_secret_dun{dun_id = DunId},
	 SecretFloor = #secret_floor{floor = Floor},
	 SecretTile = #secret_tile{index = Index, ext = RoleExt},
	 _Ext, #evt_data{type = 10, ext = QuestionList}) ->
    case RoleExt of
      [] ->
	  case util:rand_list(QuestionList, 2) of
	    {QuestionId, _} ->
		NewSecretTile = SecretTile#secret_tile{ext =
							   [QuestionId]},
		secret_dun:push(Role, 23108,
				{DunId, Floor, Index, [{5, QuestionId, 0}]}),
		{ok, Role, SecretDun, SecretFloor, NewSecretTile};
	    _ -> {false, lang:get(<<"没有题目"/utf8>>)}
	  end;
      [QuestionId | _] ->
	  secret_dun:push(Role, 23108,
			  {DunId, Floor, Index, [{5, QuestionId, 0}]}),
	  ok;
      _ -> {false, lang:get(<<"没有题目"/utf8>>)}
    end;
observer(Role,
	 _SecretDun = #m_secret_dun{dun_id = DunId},
	 _SecretFloor = #secret_floor{floor = Floor},
	 _SecretTile = #secret_tile{index = Index}, _Ext,
	 #evt_data{type = 11, ext = IdList}) ->
    PushList = [{6, BaseId, Num}
		|| {BaseId, Num} <- IdList],
    secret_dun:push(Role, 23108,
		    {DunId, Floor, Index, PushList}),
    ok;
observer(_Role, _SecretDun, _SecretFloor, _SecretTile,
	 _Ext, #evt_data{type = 12}) ->
    ok;
observer(_Role, _SecretDun, _SecretFloor, _SecretTile,
	 _Ext, #evt_data{type = 13}) ->
    ok;
observer(_Role, _SecretDun, _SecretFloor, _SecretTile,
	 _Ext, #evt_data{type = 14}) ->
    ok;
observer(Role,
	 SecretDun = #m_secret_dun{dun_id = DunId,
				   buffs = Buffs},
	 SecretFloor = #secret_floor{floor = Floor},
	 SecretTile = #secret_tile{index = Index,
				   ext = BuffList},
	 _Ext, #evt_data{type = 15, ext = GroupList}) ->
    case BuffList of
      [] ->
	  case get_buff(Buffs, GroupList, []) of
	    {ok, AddBuffs} ->
		PushList = [{7, BuffId, 0} || BuffId <- AddBuffs],
		secret_dun:push(Role, 23108,
				{DunId, Floor, Index, PushList}),
		NewSecretTile = SecretTile#secret_tile{ext = AddBuffs},
		{ok, Role, SecretDun, SecretFloor, NewSecretTile};
	    {false, Reason} -> {false, Reason}
	  end;
      _ ->
	  PushList = [{7, BuffId, 0} || BuffId <- BuffList],
	  secret_dun:push(Role, 23108,
			  {DunId, Floor, Index, PushList}),
	  ok
    end;
observer(_, _, _, _, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

do_action(_Role, _SecretDun, _SecretFloor, _SecretTile,
	  _Ext, #evt_data{type = 0}, _Args) ->
    ok;
do_action(Role, SecretDun, SecretFloor, SecretTile, Ext,
	  EvtData = #evt_data{type = 1}, Args) ->
    case secret_dun_evt_lib:combat(Role, SecretDun,
				   SecretFloor, SecretTile, Ext, EvtData, Args)
	of
      {ok, NewRole, NewSecretDun, NewSecretFloor,
       NewSecretTile} ->
	  {ok, NewRole, NewSecretDun, NewSecretFloor,
	   NewSecretTile, Args, combat};
      {false, Reason} -> {false, Reason}
    end;
do_action(Role, SecretDun, SecretFloor, SecretTile, Ext,
	  EvtData = #evt_data{type = 2}, Args) ->
    case secret_dun_evt_lib:combat(Role, SecretDun,
				   SecretFloor, SecretTile, Ext, EvtData, Args)
	of
      {ok, NewRole, NewSecretDun, NewSecretFloor,
       NewSecretTile} ->
	  {ok, NewRole, NewSecretDun, NewSecretFloor,
	   NewSecretTile, Args, combat};
      {false, Reason} -> {false, Reason}
    end;
do_action(Role = #role{}, SecretDun = #m_secret_dun{},
	  SecretFloor, SecretTile, _Ext, #evt_data{type = 3},
	  Args) ->
    {ok, Role, SecretDun, SecretFloor, SecretTile,
     Args#{flag => 1}};
do_action(_Role, _SecretDun, _SecretFloor, _SecretTile,
	  _Ext, #evt_data{type = 4}, _Args) ->
    ok;
do_action(_Role, _SecretDun, _SecretFloor, _SecretTile,
	  _Ext, #evt_data{type = 5}, _Args) ->
    ok;
do_action(_Role, _SecretDun, _SecretFloor, _SecretTile,
	  _Ext, #evt_data{type = 6}, _Args) ->
    ok;
do_action(Role,
	  SecretDun = #m_secret_dun{partners_hp_radio =
					PartnerList},
	  SecretFloor, SecretTile, _Ext,
	  #evt_data{type = Type, ext = ReplyList}, Args)
    when Type =:= 7 orelse Type =:= 16 ->
    case secret_dun_evt_lib:collective_reply(ReplyList,
					     PartnerList, [])
	of
      {NewPartnerList, PushList}
	  when is_list(NewPartnerList) ->
	  NewSecretDun = SecretDun#m_secret_dun{partners_hp_radio
						    = NewPartnerList},
	  case Type =:= 7 of
	    true ->
		notice:alert(lang:get(<<"使用成功，泉水从眼前消失..."/utf8>>));
	    _ -> notice:alert(lang:get(<<"使用成功，十字架从眼前消失..."/utf8>>))
	  end,
	  secret_dun:push(Role, 23119, PushList),
	  {ok, Role, NewSecretDun, SecretFloor, SecretTile,
	   Args#{flag => 1}};
      {false, Reason} -> {false, Reason}
    end;
do_action(Role,
	  SecretDun = #m_secret_dun{floor_list = FloorList,
				    dun_id = DunId},
	  SecretFloor, SecretTile, _Ext,
	  #evt_data{type = 8, ext = DataExt}, Args) ->
    case DataExt of
      [Floor | _Rest] ->
	  case lists:keyfind(Floor, #secret_floor.floor,
			     FloorList)
	      of
	    #secret_floor{} ->
		NewSecretDun = SecretDun#m_secret_dun{dun_floor =
							  Floor},
		NewRole = Role#role{m_secret_dun = NewSecretDun},
		secret_dun:push(NewRole, 23101),
		NewRole1 = #role{m_secret_dun = NewSecretDun1} =
			       secret_dun:session(NewRole, {DunId, Floor}),
		{ok, NewRole1, NewSecretDun1, SecretFloor, SecretTile,
		 Args#{flag => 1}};
	    _ -> {false, lang:get(<<"没有该层的数据"/utf8>>)}
	  end
    end;
do_action(Role,
	  SecretDun = #m_secret_dun{load_partners_next_id =
					NextId,
				    load_partners = OldLoadPartners},
	  SecretFloor,
	  SecretTile = #secret_tile{ext = LoadPartners}, Ext,
	  #evt_data{type = 9}, Args) ->
    case lists:keyfind(10, 1, Ext) of
      {_, SelectId, _} ->
	  case lists:keyfind(SelectId, #load_partner.pos,
			     LoadPartners)
	      of
	    LoadPartner = #load_partner{name = Name} ->
		NewLoadPartner = LoadPartner#load_partner{pos = NextId},
		NewNextId = NextId + 1,
		NewSecretDun =
		    SecretDun#m_secret_dun{load_partners_next_id =
					       NewNextId,
					   load_partners =
					       [NewLoadPartner
						| OldLoadPartners]},
		notice:alert(util:fbin(lang:get(<<"~ts加入我方队伍，可在英雄列表查看！"/utf8>>),
				       [color:format({yellow, Name})])),
		{ok, Role, NewSecretDun, SecretFloor, SecretTile,
		 Args#{flag => 1}};
	    _ -> {false, lang:get(<<"没有对应的英雄"/utf8>>)}
	  end
    end;
do_action(Role, SecretDun, SecretFloor,
	  SecretTile = #secret_tile{ext = TileExt}, Ext,
	  #evt_data{type = 10}, Args) ->
    case secret_dun_evt_lib:conversation(TileExt, Ext) of
      RewardList when is_list(RewardList) ->
	  {ok, Role, SecretDun, SecretFloor, SecretTile,
	   Args#{flag => 3, reward => RewardList}};
      {false, Reason} -> {false, Reason}
    end;
do_action(Role = #role{}, SecretDun, SecretFloor,
	  SecretTile, _Ext, #evt_data{type = 11, ext = LossList},
	  Args) ->
    case secret_dun_bag:loss(SecretDun, LossList) of
      {ok, NewSecretDun} ->
	  {ok, Role, NewSecretDun, SecretFloor, SecretTile,
	   Args#{flag => 1}};
      {false, Reason} -> {false, Reason}
    end;
do_action(Role, SecretDun, SecretFloor,
	  SecretTile = #secret_tile{switch = Switch}, _Ext,
	  #evt_data{type = 12, ext = PlatformIds}, Args) ->
    {NewSecretFloor, ChangeTileList} =
	secret_dun_evt_lib:change_platform(SecretFloor,
					   PlatformIds),
    NewSwitch = secret_dun_evt_lib:change_status(Switch),
    NewSecretTile = SecretTile#secret_tile{switch =
					       NewSwitch},
    {ok, Role, SecretDun, NewSecretFloor, NewSecretTile,
     Args#{flag => 1, change_tile_list => ChangeTileList}};
do_action(_Role, _SecretDun, _SecretFloor, _SecretTile,
	  _Ext, #evt_data{type = 13}, _Args) ->
    ok;
do_action(_Role, _SecretDun, _SecretFloor, _SecretTile,
	  _Ext, #evt_data{type = 14}, _Args) ->
    ok;
do_action(Role,
	  SecretDun = #m_secret_dun{buffs = Buffs,
				    dun_id = DunId},
	  SecretFloor, SecretTile = #secret_tile{ext = BuffList},
	  Ext, #evt_data{type = 15}, Args) ->
    case lists:keyfind(9, 1, Ext) of
      {_, SelectBuffId, _} ->
	  case lists:member(SelectBuffId, BuffList) of
	    true ->
		NewBuffs = [SelectBuffId | Buffs],
		NewSecretDun = SecretDun#m_secret_dun{buffs = NewBuffs},
		log:save(task,
			 {Role, 0, SelectBuffId,
			  util:fbin(<<"~w-~w"/utf8>>, [DunId, SelectBuffId]),
			  103, <<"位面探险BUFF"/utf8>>, <<"位面探险BUFF"/utf8>>}),
		log:save(task,
			 {Role, 1, SelectBuffId,
			  util:fbin(<<"~w-~w"/utf8>>, [DunId, SelectBuffId]),
			  103, <<"位面探险BUFF"/utf8>>, <<"位面探险BUFF"/utf8>>}),
		{ok, Role, NewSecretDun, SecretFloor, SecretTile,
		 Args#{flag => 1}};
	    _ -> {false, lang:get(<<"没有该Buff"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"选择Buff参数错误"/utf8>>)}
    end;
do_action(_, _, _, _, _, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

reward(Role, SecretDun, SecretFloor,
       SecretTile = #secret_tile{win_reward_time = WinTime,
				 false_reward_time = FalseTime},
       Flag, RewardList, Type) ->
    RewardSecretTile = case Flag of
			 1 ->
			     SecretTile#secret_tile{win_reward_time =
							WinTime + 1};
			 0 ->
			     SecretTile#secret_tile{false_reward_time =
							FalseTime + 1};
			 _ -> SecretTile
		       end,
    case do_reward(Role, SecretDun, SecretFloor,
		   RewardSecretTile, RewardList, Type)
	of
      {NewRole, NewSecretDun, NewSecretFloor,
       NewSecretTile} ->
	  {NewRole, NewSecretDun, NewSecretFloor, NewSecretTile};
      {false, Reason} -> {false, Reason}
    end.

do_reward(Role, SecretDun, SecretFloor,
	  RewardSecretTile, [], _) ->
    {Role, SecretDun, SecretFloor, RewardSecretTile};
do_reward(Role,
	  SecretDun = #m_secret_dun{dun_ids = DunIds,
				    dun_id = DunId},
	  SecretFloor = #secret_floor{floor = Floor},
	  RewardSecretTile = #secret_tile{index = Index},
	  [Id | Rest], Type) ->
    case secret_dun_data:get_reward(Id) of
      {1, RewardList, IsAddFlag} when is_list(RewardList) ->
	  AddRadio = get_add_radio(IsAddFlag, DunIds),
	  NewRewardList = [{BaseId, round(Num * AddRadio)}
			   || {BaseId, Num} <- RewardList],
	  NewItems = case secret_dun:is_open_holiday(Role) of
		       1 ->
			   AddItems = [{ItemId1, util:ufloor(Num1 * 1.0e-1)}
				       || {ItemId1, Num1} <- NewRewardList,
					  ItemId1 =:= 25],
			   item_lib:merge(AddItems, NewRewardList);
		       _ -> NewRewardList
		     end,
	  Gain = format:val_to_gain(NewItems, secret_dun),
	  case Type =:= 1 orelse Type =:= 2 of
	    true ->
		case role_gain:do(Role, Gain) of
		  {ok, GainRole} ->
		      log:log_gain(Gain, Role, GainRole, <<"位面探险"/utf8>>,
				   <<"获得奖励"/utf8>>),
		      do_reward(GainRole, SecretDun, SecretFloor,
				RewardSecretTile, Rest, Type);
		  _ -> {false, lang:get(<<"获得物品奖励失败"/utf8>>)}
		end;
	    _ ->
		case role_gain:do_notice(Role, Gain) of
		  {ok, GainRole} ->
		      log:log_gain(Gain, Role, GainRole, <<"位面探险"/utf8>>,
				   <<"获得奖励"/utf8>>),
		      do_reward(GainRole, SecretDun, SecretFloor,
				RewardSecretTile, Rest, Type);
		  _ -> {false, lang:get(<<"获得物品奖励失败"/utf8>>)}
		end
	  end;
      {2, PropList, IsAddFlag} when is_list(PropList) ->
	  AddRadio = get_add_radio(IsAddFlag, DunIds),
	  NewPropList = [{BaseId, round(Num * AddRadio)}
			 || {BaseId, Num} <- PropList],
	  case secret_dun_bag:gain(SecretDun, NewPropList) of
	    {ok, NewSecretDun} ->
		ExtList = [{9, EBaseId, ENum}
			   || {EBaseId, ENum} <- NewPropList],
		secret_dun:push(Role, 23108,
				{DunId, Floor, Index, ExtList}),
		do_reward(Role, NewSecretDun, SecretFloor,
			  RewardSecretTile, Rest, Type);
	    {false, Reason} -> {false, Reason}
	  end;
      {3, DropList, IsAddFlag} when is_list(DropList) ->
	  AddRadio = get_add_radio(IsAddFlag, DunIds),
	  RewardList = case drop_lib:common_drop(Role, DropList)
			   of
			 [{_, DropItems, _, _}] ->
			     [{Bid, round(Val * AddRadio)}
			      || {Bid, _, Val} <- DropItems];
			 _ -> []
		       end,
	  Gain = format:val_to_gain(RewardList, secret_dun),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, GainRole} ->
		log:log_gain(Gain, Role, GainRole, <<"位面探险"/utf8>>,
			     <<"获得奖励"/utf8>>),
		do_reward(GainRole, SecretDun, SecretFloor,
			  RewardSecretTile, Rest, Type);
	    _ -> {false, lang:get(<<"获得掉落奖励失败"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"没有该类型的奖励"/utf8>>)}
    end;
do_reward(_, _, _, _, _, _) ->
    {false, lang:get(<<"获得奖励参数错误"/utf8>>)}.

get_buff(_, [], SelectIdList) -> {ok, SelectIdList};
get_buff(Buffs, [GroupId | Rest], SelectIdList) ->
    AllBuffs = secret_dun_data:get_buffs(),
    Fun = fun ({DataGroupId, BuffId, Weight, IsReturn}) ->
		  case DataGroupId =:= GroupId of
		    true when IsReturn =:= 1 -> {true, {BuffId, Weight}};
		    true ->
			case lists:member(BuffId, Buffs) of
			  true -> false;
			  _ -> {true, {BuffId, Weight}}
			end;
		    _ -> false
		  end
	  end,
    FilterBuffList = lists:filtermap(Fun, AllBuffs),
    case util:rand_list(FilterBuffList, 2) of
      {SelectId, _} ->
	  get_buff([SelectId | Buffs], Rest,
		   [SelectId | SelectIdList]);
      _ -> get_buff(Buffs, Rest, SelectIdList)
    end;
get_buff(_, _, _) ->
    {false, lang:get(<<"选择Buff参数错误"/utf8>>)}.

get_arena_defend(Role = #role{lev = RoleLev},
		 SecretDun = #m_secret_dun{dun_id = DunId,
					   dun_power = MaxPower},
		 SecretFloor, SecretTile = #secret_tile{}, _Ext,
		 #evt_data{ext = DataExt}) ->
    CalculatingCoefficient =
	secret_dun_data:get_const(calculating_coefficient),
    MinPowerLimit1 = case
		       secret_dun_data:get_limit_power(DunId)
			 of
		       MinPowerLimit when is_integer(MinPowerLimit) ->
			   MinPowerLimit;
		       _ -> 100000
		     end,
    RealPower = (MinPowerLimit1 +
		   round(MaxPower - MinPowerLimit1))
		  / (round(RoleLev / 5) * CalculatingCoefficient)
		  * (round(RoleLev / 5) * CalculatingCoefficient),
    case lists:keyfind(group, 1, DataExt) of
      {group, GroupId} ->
	  case secret_dun_data:get_guard_ext({GroupId, MaxPower})
	      of
	    NewDataExt when is_list(NewDataExt) ->
		case lists:keyfind(power, 1, NewDataExt) of
		  {power, PowerList} ->
		      NewStrengthRadio = case lists:keyfind(strength, 1,
							    NewDataExt)
					     of
					   {strength, StrengthRadio} ->
					       StrengthRadio;
					   _ -> 1000
					 end,
		      RealPower1 = trunc(RealPower),
		      get_get_arena_defend1(PowerList, RealPower1, Role,
					    SecretDun, SecretFloor, SecretTile,
					    NewDataExt, NewStrengthRadio);
		  _ -> {false, lang:get(<<"战斗参数错误"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"战斗参数错误"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"战斗参数错误"/utf8>>)}
    end.

get_get_arena_defend1([], RealPower, Role,
		      SecretDun = #m_secret_dun{dun_id = DunId},
		      SecretFloor = #secret_floor{floor = Floor}, SecretTile,
		      _DataExt, NewStrengthRadio) ->
    case secret_dun_data:get_monster_ids({DunId, Floor,
					  RealPower})
	of
      IdList when is_list(IdList) ->
	  case util:rand_list(IdList, 2) of
	    {FightId, _} ->
		Name1 = util:rand_list(random_name_data:arena_list(1)),
		Name2 = util:rand_list(random_name_data:arena_list(2)),
		Name3 = util:rand_list(random_name_data:arena_list(3)),
		Name = <<Name1/binary, Name2/binary, Name3/binary>>,
		#{partners := Partners, lev := Lev, face := Face,
		  formation := FormationType,
		  hallows := {HallowsId, HallowsStep, HallowsSkill},
		  sprite_info := {SpriteLev, SpriteBreakLev, Sprites}} =
		    robot:get(Role#role{max_power = RealPower}, FightId,
			      #{max_num => 5}),
		ExpendPower = lists:sum([PPower
					 || #partner{power = PPower}
						<- Partners]),
		PList = [{Pid, Pid, Bid, PLev, Star, [{5, UseSkin}],
			  100}
			 || #partner{id = Pid, bid = Bid, use_skin = UseSkin,
				     lev = PLev, star = Star}
				<- Partners],
		secret_dun:push(Role, 23109,
				{FightId, <<>>, Name, Face, Lev, ExpendPower,
				 PList, FormationType, Sprites, HallowsId,
				 SpriteLev, NewStrengthRadio}),
		PosInfo = [{Pid1, Pid1}
			   || #partner{id = Pid1} <- Partners],
		NewSecretTile = SecretTile#secret_tile{ext =
							   [{FightId, Name,
							     FormationType,
							     PosInfo,
							     {HallowsId,
							      HallowsStep,
							      HallowsSkill},
							     Partners,
							     SpriteLev,
							     SpriteBreakLev,
							     Sprites}]},
		{ok, Role, SecretDun, SecretFloor, NewSecretTile};
	    _ -> {false, lang:get(<<"没有对应的怪物"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"没有对应的怪物"/utf8>>)}
    end;
get_get_arena_defend1([{MinRadio, MaxRadio} | Rest],
		      RealPower, Role = #role{id = RoleId, lev = RoleLev},
		      SecretDun,
		      SecretFloor = #secret_floor{fight_ids = FightIds},
		      SecretTile, DataExt, NewStrengthRadio) ->
    MatchMinPower = round(MinRadio * RealPower / 1000),
    MatchMaxPower = round(MaxRadio * RealPower / 1000),
    case secret_dun_evt_lib:do_match_by_power(MatchMinPower,
					      MatchMaxPower,
					      [RoleId | FightIds], RoleLev)
	of
      {ok, ArenaId = {Rid, SrvId}, Name} ->
	  case role_robot:get_role(ArenaId) of
	    {ok,
	     Robot = #role_robot{face_id = Face, lev = Lev,
				 partners = Partners, power = ExpendPower,
				 m_sprite_tree =
				     #m_sprite_tree{lev = SpriteLev,
						    break_lev = SpriteBreakLev,
						    sprites = Sprites}}} ->
		#formation_sys{pos_info = PosInfo, type = FormationType,
			       hallows_id = HallowsId} =
		    formation:get_sys_formation(Robot, 1),
		{PList, SaveList} = get_push_list(PosInfo, Partners, [],
						  []),
		NewPosInfo = [{Pos1, Pid1}
			      || #formation_pos{pos = Pos1, id = Pid1}
				     <- PosInfo],
		secret_dun:push(Role, 23109,
				{Rid, SrvId, Name, Face, Lev, ExpendPower,
				 PList, FormationType, Sprites, HallowsId,
				 SpriteLev, NewStrengthRadio}),
		NewSecretTile = SecretTile#secret_tile{ext =
							   [{ArenaId, Name,
							     FormationType,
							     NewPosInfo,
							     HallowsId,
							     SaveList,
							     SpriteLev,
							     SpriteBreakLev,
							     Sprites}]},
		NewSecretFloor = SecretFloor#secret_floor{fight_ids =
							      [ArenaId
							       | FightIds]},
		{ok, Role, SecretDun, NewSecretFloor, NewSecretTile};
	    _ ->
		get_get_arena_defend1(Rest, RealPower, Role, SecretDun,
				      SecretFloor, SecretTile, DataExt,
				      NewStrengthRadio)
	  end;
      _ ->
	  get_get_arena_defend1(Rest, RealPower, Role, SecretDun,
				SecretFloor, SecretTile, DataExt,
				NewStrengthRadio)
    end;
get_get_arena_defend1(_, _, _, _, _, _, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

get_push_list([], _Partners, PushList, SaveList) ->
    {PushList, SaveList};
get_push_list([#formation_pos{pos = Pos, id = PId}
	       | Rest],
	      Partners, PushList, SaveList) ->
    case lists:keyfind(PId, #partner.id, Partners) of
      Partner = #partner{bid = Bid, use_skin = UseSkin,
			 lev = PLev, star = Star} ->
	  get_push_list(Rest, Partners,
			[{PId, Pos, Bid, PLev, Star, [{5, UseSkin}], 100}
			 | PushList],
			[Partner | SaveList]);
      _ -> get_push_list(Rest, Partners, PushList, SaveList)
    end;
get_push_list(_, _Partners, PushList, SaveList) ->
    {PushList, SaveList}.

get_load_partner([], PartnerNum, _, _, OldPartnerList,
		 MaxPower) ->
    ShowBaseId = [BaseId
		  || #partner{bid = BaseId} <- OldPartnerList],
    NowNum = length(OldPartnerList),
    case NowNum >= PartnerNum of
      true ->
	  ShowList = convert_load_partner(1, OldPartnerList, []),
	  {ok, ShowList};
      _ ->
	  LastNum = PartnerNum - NowNum,
	  case secret_dun_data:get_loan_group(MaxPower) of
	    RobotGroup when is_integer(RobotGroup) ->
		FilterRobotGroup = [{LoanId, LoanWeight}
				    || {LoanId, GroupId, LoanWeight}
					   <- secret_dun_data:get_all_loan_partner(),
				       GroupId =:= RobotGroup],
		AddLoanPartner = get_loan_robot(LastNum,
						FilterRobotGroup, ShowBaseId,
						[]),
		NewPartnerList = OldPartnerList ++ AddLoanPartner,
		ShowList = convert_load_partner(1, NewPartnerList, []),
		{ok, ShowList};
	    _ ->
		ShowList = convert_load_partner(1, OldPartnerList, []),
		{ok, ShowList}
	  end
    end;
get_load_partner([#role_match{id = Id} | Rest],
		 PartnerNum, PartnerPowerSection, RealPower,
		 OldPartnerList, MaxPower) ->
    NowNum = length(OldPartnerList),
    case NowNum >= PartnerNum of
      true ->
	  ShowList = convert_load_partner(1, OldPartnerList, []),
	  {ok, ShowList};
      _ ->
	  LastNum = PartnerNum - NowNum,
	  ShowBaseId = [BaseId
			|| #partner{bid = BaseId} <- OldPartnerList],
	  case role_robot:get_role(Id) of
	    {ok, #role_robot{partners = PartnerList}} ->
		case get_partner(PartnerList, LastNum,
				 PartnerPowerSection, RealPower, ShowBaseId)
		    of
		  {ok, AddPartnerList} ->
		      NewShowList = AddPartnerList ++ OldPartnerList,
		      get_load_partner(Rest, PartnerNum, PartnerPowerSection,
				       RealPower, NewShowList, MaxPower);
		  _ ->
		      get_load_partner(Rest, PartnerNum, PartnerPowerSection,
				       RealPower, OldPartnerList, MaxPower)
		end;
	    _ ->
		get_load_partner(Rest, PartnerNum, PartnerPowerSection,
				 RealPower, OldPartnerList, MaxPower)
	  end
    end;
get_load_partner(_, _, _, _, _, _) ->
    {false, lang:get(<<"没有符合的玩家"/utf8>>)}.

get_partner(_, _, [], _, _) -> false;
get_partner(PartnerList, LastNum,
	    [{MinRadio, MaxRadio} | Rest], RealPower, ShowBaseId) ->
    MinPower = round(MinRadio * RealPower / 1000),
    MaxPower = round(MaxRadio * RealPower / 1000),
    FilterPartnerList = filter_partner(PartnerList,
				       MinPower, MaxPower, ShowBaseId, []),
    case length(FilterPartnerList) >= LastNum of
      true ->
	  case util:rand_list_n(FilterPartnerList, LastNum) of
	    NewFilterPartnerList
		when is_list(NewFilterPartnerList) ->
		{ok, NewFilterPartnerList};
	    _ ->
		get_partner(PartnerList, LastNum, Rest, RealPower,
			    ShowBaseId)
	  end;
      _ ->
	  case Rest of
	    [] -> {ok, FilterPartnerList};
	    _ ->
		get_partner(PartnerList, LastNum, Rest, RealPower,
			    ShowBaseId)
	  end
    end;
get_partner(_, _, _, _, _) -> false.

filter_partner([], _, _, _, PartnerList) -> PartnerList;
filter_partner([Partner = #partner{power = Power,
				   bid = BaseId}
		| Rest],
	       MinPower, MaxPower, ShowBaseId, PartnerList)
    when Power >= MinPower, Power =< MaxPower ->
    case lists:member(BaseId, ShowBaseId) of
      true ->
	  filter_partner(Rest, MinPower, MaxPower, ShowBaseId,
			 PartnerList);
      _ ->
	  filter_partner(Rest, MinPower, MaxPower,
			 [BaseId | ShowBaseId], [Partner | PartnerList])
    end;
filter_partner([_Partner | Rest], MinPower, MaxPower,
	       ShowBaseId, PartnerList) ->
    filter_partner(Rest, MinPower, MaxPower, ShowBaseId,
		   PartnerList).

get_loan_robot(LastNum, _, _, OldLoadPartnerList)
    when LastNum < 1 ->
    OldLoadPartnerList;
get_loan_robot(LastNum, RobotGroup, ShowBaseId,
	       OldLoadPartnerList) ->
    case util:rand_list(RobotGroup, 2) of
      NowSelect = {LoadId, _} ->
	  case secret_dun_data:get_loan_partner(LoadId) of
	    {PartnerBid, Lev, Star, BreakLev, Skills, Attr} ->
		case lists:member(PartnerBid, ShowBaseId) of
		  true ->
		      get_loan_robot(LastNum, RobotGroup -- [NowSelect],
				     ShowBaseId, OldLoadPartnerList);
		  _ ->
		      BaseData = #partner_base_data{} =
				     partner_data:get_base(PartnerBid),
		      Role = role_data:first_init(#role{id =
							    {1,
							     sys_env:get(server_id)},
							type = robot}),
		      P0 = partner:init_partner(Role, BaseData, 1),
		      P1 = #partner{set_skills = OldSetSkills,
				    all_attr = OldAllAttr} =
			       partner_lib:calc_attr(Role,
						     P0#partner{lev = Lev,
								star = Star,
								break_lev =
								    BreakLev,
								use_skin = 0}),
		      {ok, #attr_calc{attr = AttrAdd, ratio = Ratio}} =
			  attr_data:do_sub_list(Attr, 1, 4, #attr_calc{}),
		      BaseAttrT1 = case Attr of
				     [] ->
					 attr_data:mix_attr_and_attr(OldAllAttr,
								     AttrAdd);
				     _ ->
					 attr_data:mix_attr_and_attr(#attr{},
								     AttrAdd)
				   end,
		      BaseAttrT2 = attr_data:mix_attr_and_ratio(BaseAttrT1,
								Ratio),
		      BaseAttr2 = attr_data:mix_attr_and_attr(BaseAttrT1,
							      BaseAttrT2),
		      P2 = P1#partner{set_skills = Skills ++ OldSetSkills,
				      all_attr = BaseAttr2,
				      base_attr = BaseAttr2},
		      P3 = partner_lib:calc_power(P2),
		      get_loan_robot(LastNum - 1, RobotGroup -- [NowSelect],
				     [PartnerBid | ShowBaseId],
				     [P3 | OldLoadPartnerList])
		end;
	    _ ->
		get_loan_robot(LastNum, RobotGroup -- [NowSelect],
			       ShowBaseId, OldLoadPartnerList)
	  end;
      _ -> OldLoadPartnerList
    end.

convert_load_partner(_, [], ShowList) -> ShowList;
convert_load_partner(Pos,
		     [#partner{bid = Bid, lev = Lev, name = Name,
			       star = Star, break_lev = BreakLev,
			       use_skin = UseSkin, all_attr = AllAttr,
			       base_attr = BaseAttr, skills = Skills,
			       break_skills = BreakSkills,
			       set_skills = SetSkills, eqm = EqmData,
			       artifacts = Artifacts, holy_eqm = HolyEqm,
			       end_time = EndTime, dower_skill = DowerSkill,
			       power = Power}
		      | Rest],
		     ShowList) ->
    Eqm = [{ItemId, ItemBid, ItemType}
	   || #item{id = ItemId, base_id = ItemBid,
		    type = ItemType}
		  <- EqmData],
    LoadPartner = #load_partner{pos = Pos, bid = Bid,
				lev = Lev, name = Name, star = Star,
				break_lev = BreakLev, use_skin = UseSkin,
				all_attr = AllAttr, base_attr = BaseAttr,
				skills = Skills, break_skills = BreakSkills,
				set_skills = SetSkills, eqms = Eqm,
				artifacts = Artifacts, holy_eqm = HolyEqm,
				end_time = EndTime, dower_skill = DowerSkill,
				power = Power},
    convert_load_partner(Pos + 1, Rest,
			 [LoadPartner | ShowList]);
convert_load_partner(_, _, ShowList) -> ShowList.

get_add_radio(1, DunIds) ->
    AllRadio = get_all_add_radio(DunIds, 0),
    (1000 + AllRadio) / 1000;
get_add_radio(_, _) -> 1.

get_all_add_radio([], AllRadio) -> AllRadio;
get_all_add_radio([Id | Rest], OldAllRadio) ->
    case secret_dun_data:get_pass_radio(Id) of
      AddRadio when is_integer(AddRadio) ->
	  get_all_add_radio(Rest, AddRadio + OldAllRadio);
      _ -> get_all_add_radio(Rest, OldAllRadio)
    end;
get_all_add_radio(_, AllRadio) -> AllRadio.

get_push_and_power([], _, _, PushList, AllPower) ->
    {PushList, AllPower};
get_push_and_power([#formation_pos{pos = Pos, id = PId}
		    | Rest],
		   Partners, DefendRadio, PushList, AllPower) ->
    #partner{bid = Bid, use_skin = UseSkin, lev = PLev,
	     star = Star, power = Power} =
	lists:keyfind(PId, #partner.id, Partners),
    HpPer = case lists:keyfind(PId, 1, DefendRadio) of
	      {_, Radio} -> Radio;
	      _ -> 100
	    end,
    get_push_and_power(Rest, Partners, DefendRadio,
		       [{PId, Pos, Bid, PLev, Star, [{5, UseSkin}], HpPer}
			| PushList],
		       Power + AllPower);
get_push_and_power(_, _, _, PushList, AllPower) ->
    {PushList, AllPower}.


