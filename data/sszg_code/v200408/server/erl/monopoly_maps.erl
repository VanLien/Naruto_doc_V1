-file("src/mod/monopoly_maps/monopoly_maps.erl", 1).

-module(monopoly_maps).

-lager_records([{group_attr, [atk, hp_max, def, speed]},
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
		{activity, [id, status, name, data, ext_args]},
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
		{monopoly_dungeons_guild_rank,
		 [ver, id, stage_guild_rank]},
		{guild_stage_rank,
		 [ver, id, name, dps, unixtime, is_reward, leader_name,
		  member, members_max, lev]},
		{monopoly_dungeons,
		 [ver, id, camp_id, stage_list, buffs]},
		{dungeons_stage, [ver, id, develop, boss_list, rank]},
		{dungeons_boss, [ver, id, base_id, hp, max_hp]},
		{stage_rank,
		 [ver, id, name, dps, unixtime, lev, face_id, avatar_bid,
		  power]},
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
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
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
		{m_monopoly_maps, [ver, camp_id, id, stage_list]},
		{stage,
		 [ver, id, map_id, pos, develop, events, status,
		  flag_num, buffs, combat_id]},
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

-export([push/2, push/3, login/1, init/0, enter_map/2,
	 gm_update_stage/2, dice/3, trigger/2, combat_over/4,
	 gm_add_develop/3, check_stage_finish/2,
	 get_fight_information/2, repair/0, repair/1]).

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

-file("src/mod/monopoly_maps/monopoly_maps.erl", 24).

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

-file("src/mod/monopoly_maps/monopoly_maps.erl", 25).

-file("inc/monopoly_maps.hrl", 1).

-record(stage,
	{ver = 2  :: pos_integer(), id = 0  :: pos_integer(),
	 map_id = 0  :: pos_integer(), pos = 1  :: pos_integer(),
	 develop = 0  :: pos_integer(), events = []  :: list(),
	 status = 1  :: pos_integer(),
	 flag_num = 0  :: pos_integer(),
	 buffs = []  :: pos_integer(),
	 combat_id = {0, 0, <<>>}  :: tuple()}).

-record(m_monopoly_maps,
	{ver = 1  :: pos_integer(),
	 camp_id = 0  :: pos_integer(), id = 0  :: pos_integer(),
	 stage_list = []  :: list()}).

-file("src/mod/monopoly_maps/monopoly_maps.erl", 26).

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

-file("src/mod/monopoly_maps/monopoly_maps.erl", 27).

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

-file("src/mod/monopoly_maps/monopoly_maps.erl", 28).

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

-file("src/mod/monopoly_maps/monopoly_maps.erl", 29).

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

-file("src/mod/monopoly_maps/monopoly_maps.erl", 30).

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

-file("src/mod/monopoly_maps/monopoly_maps.erl", 31).

-file("inc/monopoly_dungeons.hrl", 1).

-record(stage_rank,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: string(), dps = 0  :: pos_integer(),
	 unixtime = 0  :: pos_integer(),
	 lev = 0  :: pos_integer(),
	 face_id = 0  :: pos_integer(),
	 avatar_bid = 0  :: pos_integer(),
	 power = 0  :: pos_integer()}).

-record(dungeons_boss,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 base_id = 0  :: pos_integer(), hp = 0  :: pos_integer(),
	 max_hp = 0  :: pos_integer()}).

-record(dungeons_stage,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 develop = 0  :: pos_integer(),
	 boss_list = []  :: list(), rank = []  :: list()}).

-record(monopoly_dungeons,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 camp_id = 0  :: pos_integer(),
	 stage_list = []  :: list(), buffs = []  :: list()}).

-record(guild_stage_rank,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: string(), dps = 0  :: pos_integer(),
	 unixtime = 0  :: pos_integer(),
	 is_reward = 0  :: boolean(),
	 leader_name = <<>>  :: string(),
	 member = 0  :: pos_integer(),
	 members_max = 0  :: pos_integer(),
	 lev = 0  :: pos_integer()}).

-record(monopoly_dungeons_guild_rank,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 stage_guild_rank = []  :: list()}).

-file("src/mod/monopoly_maps/monopoly_maps.erl", 32).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/monopoly_maps/monopoly_maps.erl", 33).

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

-file("src/mod/monopoly_maps/monopoly_maps.erl", 34).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/monopoly_maps/monopoly_maps.erl", 35).

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

-file("src/mod/monopoly_maps/monopoly_maps.erl", 36).

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

-file("src/mod/monopoly_maps/monopoly_maps.erl", 37).

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

-file("src/mod/monopoly_maps/monopoly_maps.erl", 38).

repair() ->
    role_group:apply(world, {monopoly_maps, repair, []}).

repair(Role = #role{name = Name,
		    m_monopoly_maps =
			MonopolyMaps = #m_monopoly_maps{camp_id = CampId,
							stage_list =
							    StageList}}) ->
    Flag = var:get_var(Role, other, 3072, 0),
    case Flag =:= 0 of
      true ->
	  {ok, NewRole1} = case holiday_lib:get_open_holiday(Role,
							     [3040, 93040,
							      993040])
			       of
			     #holiday{camp_id = CampId} ->
				 case lists:keyfind(1, #stage.id, StageList) of
				   #stage{} ->
				       case lists:keyfind(2, #stage.id,
							  StageList)
					   of
					 #stage{} -> {ok, Role};
					 _ ->
					     Length = [1
						       || #stage{id = 1}
							      <- StageList],
					     case Length > 1 of
					       true ->
						   StageList1 =
						       lists:keydelete(1,
								       #stage.id,
								       StageList),
						   StageList2 = [#stage{id = 2}
								 | StageList1],
						   NewMonopolyMaps =
						       MonopolyMaps#m_monopoly_maps{id
											=
											1,
										    stage_list
											=
											StageList2},
						   NewRole =
						       Role#role{m_monopoly_maps
								     =
								     NewMonopolyMaps},
						   {ok, NewRole};
					       _ ->
						   StageList2 = [#stage{id = 2}
								 | StageList],
						   NewMonopolyMaps =
						       MonopolyMaps#m_monopoly_maps{id
											=
											1,
										    stage_list
											=
											StageList2},
						   NewRole =
						       Role#role{m_monopoly_maps
								     =
								     NewMonopolyMaps},
						   {ok, NewRole}
					     end
				       end;
				   _ ->
				       case lists:keyfind(2, #stage.id,
							  StageList)
					   of
					 #stage{} ->
					     Length = [1
						       || #stage{id = 2}
							      <- StageList],
					     case Length > 1 of
					       true ->
						   StageList1 =
						       lists:keydelete(2,
								       #stage.id,
								       StageList),
						   StageList2 = [#stage{id = 1}
								 | StageList1],
						   NewMonopolyMaps =
						       MonopolyMaps#m_monopoly_maps{id
											=
											2,
										    stage_list
											=
											StageList2},
						   NewRole =
						       Role#role{m_monopoly_maps
								     =
								     NewMonopolyMaps},
						   {ok, NewRole};
					       _ ->
						   StageList2 = [#stage{id = 1}
								 | StageList],
						   NewMonopolyMaps =
						       MonopolyMaps#m_monopoly_maps{id
											=
											2,
										    stage_list
											=
											StageList2},
						   NewRole =
						       Role#role{m_monopoly_maps
								     =
								     NewMonopolyMaps},
						   {ok, NewRole}
					     end;
					 _ ->
					     case {whereis(lager_event),
						   whereis(lager_event),
						   lager_config:get({lager_event,
								     loglevel},
								    {0, []})}
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
					       {__Pidmonopoly_maps88, _,
						{__Levelmonopoly_maps88,
						 __Tracesmonopoly_maps88}}
						   when __Levelmonopoly_maps88
							  band 64
							  /= 0
							  orelse
							  __Tracesmonopoly_maps88
							    /= [] ->
						   lager:do_log(info,
								[{module,
								  monopoly_maps},
								 {function,
								  repair},
								 {line, 88},
								 {pid,
								  pid_to_list(self())},
								 {node, node()}
								 | lager:md()],
								io_lib:format("大富翁修复数据异常~ts 信息~w",
									      [Name,
									       StageList]),
								none, 4096, 64,
								__Levelmonopoly_maps88,
								__Tracesmonopoly_maps88,
								lager_event,
								__Pidmonopoly_maps88);
					       _ -> ok
					     end,
					     {ok, Role}
				       end
				 end;
			     _ -> {ok, Role}
			   end,
	  NewRole2 = var:set_var(NewRole1, other, 3072, 1),
	  {ok, NewRole2};
      _ -> {ok, Role}
    end.

gm_add_develop(StageId, Develop,
	       Role = #role{guild_bag = #guild_bag{id = Gid},
			    m_monopoly_maps =
				MonopolyMaps = #m_monopoly_maps{stage_list =
								    StageList}}) ->
    NewRole = case lists:keyfind(StageId, #stage.id,
				 StageList)
		  of
		Stage = #stage{develop = OldDevelop} ->
		    NewStage = Stage#stage{develop = OldDevelop + Develop},
		    NewStageList = lists:keystore(StageId, #stage.id,
						  StageList, NewStage),
		    NewMonopolyMaps =
			MonopolyMaps#m_monopoly_maps{stage_list = NewStageList},
		    Role#role{m_monopoly_maps = NewMonopolyMaps};
		_ -> Role
	      end,
    add_dungeons_develop(StageId, Develop, Gid),
    NewRole.

gm_update_stage(Id,
		Role = #role{m_monopoly_maps =
				 MonopolyMaps = #m_monopoly_maps{stage_list =
								     StageList}}) ->
    case lists:keyfind(Id, #stage.id, StageList) of
      Stage = #stage{} ->
	  case update_stage(Stage) of
	    NewStage = #stage{} ->
		NewStageList = lists:keystore(Id, #stage.id, StageList,
					      NewStage),
		NewMonopolyMaps =
		    MonopolyMaps#m_monopoly_maps{stage_list = NewStageList},
		NewRole = Role#role{m_monopoly_maps = NewMonopolyMaps},
		push(NewRole, 27401, Id),
		NewRole;
	    _ -> Role
	  end;
      _ -> Role
    end.

init() -> #m_monopoly_maps{}.

-spec push(#role{}, pos_integer()) -> ok.

push(Role = #role{m_monopoly_maps =
		      #m_monopoly_maps{camp_id = CampId,
				       stage_list = StageList}},
     Code = 27400) ->
    case holiday_lib:get_open_holiday(Role,
				      [3040, 93040, 993040])
	of
      #holiday{camp_id = CampId, end_time = EndTime} ->
	  Stages = get_stages(StageList, Role),
	  role:pack_send(Code, {1, EndTime, Stages});
      _ -> role:pack_send(Code, {0, 0, []})
    end,
    ok;
push(_, _) -> ok.

-spec push(#role{}, pos_integer(), pos_integer()) -> ok.

push(Role = #role{m_monopoly_maps =
		      #m_monopoly_maps{camp_id = CampId,
				       stage_list = StageList},
		  guild_bag = #guild_bag{id = Gid},
		  m_home = #m_home{look_id = LookId}},
     Code = 27401, Id)
    when is_integer(Id) ->
    case holiday_lib:get_open_holiday(Role,
				      [3040, 93040, 993040])
	of
      #holiday{camp_id = CampId} ->
	  GuildDevelop = case get_guild_develop(Id, Gid) of
			   {ok, GD} -> GD;
			   _ -> 0
			 end,
	  role_trigger:async_fire(Role,
				  #evt_monopoly_develop{stage_id = Id,
							develop =
							    GuildDevelop}),
	  case lists:keyfind(Id, #stage.id, StageList) of
	    Stage = #stage{status = 1} ->
		role:pack_send(Code,
			       {1, <<>>, Stage, 0, GuildDevelop, LookId});
	    Stage = #stage{pos = Pos, events = EventList} ->
		case lists:keyfind(Pos, 1, EventList) of
		  {_, Type} ->
		      role:pack_send(Code,
				     {1, <<>>, Stage, Type, GuildDevelop,
				      LookId});
		  _ ->
		      role:pack_send(Code,
				     {0, lang:get(<<"没有该地图"/utf8>>), #stage{},
				      0, 0, 0})
		end;
	    _ ->
		role:pack_send(Code,
			       {0, lang:get(<<"没有该地图"/utf8>>), #stage{}, 0, 0,
				0})
	  end;
      _ ->
	  role:pack_send(Code,
			 {0, lang:get(<<"活动没开始"/utf8>>), #stage{}, 0, 0, 0})
    end,
    ok;
push(_, Code = 27401, Msg) ->
    role:pack_send(Code, {0, Msg, #stage{}, 0, 0, 0}), ok;
push(_, Code = 27403, Data) ->
    role:pack_send(Code, Data), ok;
push(_, Code = 27404, Data) ->
    role:pack_send(Code, Data), ok;
push(_Role, Code = 27405, Data) ->
    role:pack_send(Code, Data), ok;
push(#role{m_monopoly_maps =
	       #m_monopoly_maps{stage_list = StageList}},
     Code = 27408, StageId)
    when is_integer(StageId) ->
    Data = case lists:keyfind(StageId, #stage.id, StageList)
	       of
	     #stage{buffs = Buffs, flag_num = FlagNum}
		 when FlagNum > 0 ->
		 ClientBuffs = [{Type, Num} || {Type, Num, _} <- Buffs],
		 ClientBuffs1 = [{4, FlagNum} | ClientBuffs],
		 ClientBuffs1;
	     #stage{buffs = Buffs} ->
		 ClientBuffs = [{Type, Num} || {Type, Num, _} <- Buffs],
		 ClientBuffs;
	     _ -> []
	   end,
    role:pack_send(Code, {StageId, Data}),
    ok;
push(_Role, Code = 27409, Data) ->
    role:pack_send(Code, Data), ok;
push(_, _, _) -> ok.

-spec get_fight_information(#role{},
			    pos_integer()) -> {ok, tuple(), #role{}}.

get_fight_information(Role = #role{m_monopoly_maps =
				       MonopolyMaps =
					   #m_monopoly_maps{stage_list =
								StageList}},
		      StageId) ->
    case check_trigger(Role) of
      {ok, Type,
       Stage = #stage{id = StageId, combat_id = {0, _, _}}}
	  when Type =:= 2 orelse Type =:= 7 ->
	  {FightType, FightId, FightName} =
	      get_fight_id_name(Type, Role),
	  NewStage = Stage#stage{combat_id =
				     {FightType, FightId, FightName}},
	  NewStageList = lists:keyreplace(StageId, #stage.id,
					  StageList, NewStage),
	  NewMonopolyMaps =
	      MonopolyMaps#m_monopoly_maps{stage_list = NewStageList},
	  NewRole = Role#role{m_monopoly_maps = NewMonopolyMaps},
	  {Data, NewRole1} = get_fight_client(FightType, FightId,
					      FightName, NewRole, Type, Stage),
	  {ok, Data, NewRole1};
      {ok, Type,
       Stage = #stage{combat_id =
			  {FightType, FightId, FightName}}} ->
	  {Data, NewRole} = get_fight_client(FightType, FightId,
					     FightName, Role, Type, Stage),
	  {ok, Data, NewRole};
      _ -> {false, lang:get(<<"没有信息"/utf8>>)}
    end.

-spec check_stage_finish(#role{},
			 pos_integer()) -> true | false.

check_stage_finish(Role = #role{m_monopoly_maps =
				    #m_monopoly_maps{stage_list = StageList}},
		   StageId) ->
    Stages = get_stages(StageList, Role),
    case lists:keyfind(StageId, 1, Stages) of
      {_, 0, _, _} -> true;
      _ -> false
    end.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{pid = Pid, id = RoleId,
		   m_monopoly_maps =
		       #m_monopoly_maps{camp_id = CampId}}) ->
    NewRole1 = case holiday_lib:get_open_holiday(Role,
						 [3040, 93040, 993040])
		   of
		 #holiday{camp_id = CampId} ->
		     activity_self:set_activity(805, 1, []), Role;
		 #holiday{camp_id = NewCampId} ->
		     activity_self:set_activity(805, 1, []),
		     NewMonopoly = init_monopoly(NewCampId),
		     NewRole = Role#role{m_monopoly_maps = NewMonopoly},
		     var:set_role_var(RoleId, other, 17, 0),
		     NewRole0 = var:set_var(NewRole, other, 3070, []),
		     NewRole0;
		 _ when CampId > 0 ->
		     activity_self:set_activity(805, 0, []),
		     NewMonopoly = #m_monopoly_maps{},
		     NewRole = Role#role{m_monopoly_maps = NewMonopoly},
		     role:apply(async, Pid, {monopoly_maps, push, [27400]}),
		     NewRole;
		 _ -> Role
	       end,
    {ok, NewRole2} = repair(NewRole1),
    {ok, NewRole2}.

-spec enter_map(pos_integer(), #role{}) -> {ok,
					    #role{}} |
					   {false, string()}.

enter_map(Id,
	  Role = #role{m_monopoly_maps =
			   MonopolyMaps = #m_monopoly_maps{stage_list =
							       StageList}}) ->
    case check_enter_cond(Id, Role) of
      {ok, first, Stage} ->
	  case update_stage(Stage) of
	    NewStage = #stage{} ->
		NewStageList = lists:keystore(Id, #stage.id, StageList,
					      NewStage),
		NewMonopolyMaps = MonopolyMaps#m_monopoly_maps{id = Id,
							       stage_list =
								   NewStageList},
		NewRole = Role#role{m_monopoly_maps = NewMonopolyMaps},
		push(NewRole, 27401, Id),
		{ok, NewRole};
	    {false, Reason} ->
		push(Role, 27401, Reason), {false, Reason}
	  end;
      ok ->
	  NewMonopolyMaps = MonopolyMaps#m_monopoly_maps{id = Id},
	  NewRole = Role#role{m_monopoly_maps = NewMonopolyMaps},
	  push(NewRole, 27401, Id),
	  {ok, NewRole};
      {false, Reason} ->
	  push(Role, 27401, Reason), {false, Reason}
    end.

-spec dice(pos_integer(), pos_integer(),
	   #role{}) -> {ok, pos_integer(), #role{}} |
		       {false, string()}.

dice(Type, Num,
     Role = #role{m_monopoly_maps =
		      MonopolyMaps = #m_monopoly_maps{stage_list = StageList},
		  guild_bag = #guild_bag{id = Gid, pid = GPid}}) ->
    case check_dice_cond(Type, Num, Role) of
      {ok, NewPos, AddNum,
       Stage = #stage{id = StageId, develop = OldDevelop,
		      flag_num = FlagNum, buffs = BuffList,
		      events = EventList}} ->
	  case loss_dice(Type, Role) of
	    {ok, LossRole, Loss} ->
		{FinalStage, FinalRole} = case FlagNum > 0 of
					    true ->
						Flag = case AddNum =:= FlagNum
							   of
							 true ->
							     put(flag, 1), 1;
							 _ -> 0
						       end,
						Stage1 = Stage#stage{flag_num =
									 0},
						case reward_trigger(13, Flag,
								    Stage1,
								    LossRole)
						    of
						  {ok, Stage2, Role1} ->
						      {Stage2, Role1};
						  _ -> {Stage1, LossRole}
						end;
					    _ -> {Stage, LossRole}
					  end,
		{NewOldDevelop, AddDevelop} = case lists:keyfind(3, 1,
								 BuffList)
						  of
						{_, RewardNum, Time}
						    when RewardNum > 0 ->
						    {OldDevelop + Time, Time};
						_ -> {OldDevelop + 1, 1}
					      end,
		NewStage = FinalStage#stage{pos = NewPos,
					    develop = NewOldDevelop,
					    status = 2},
		case is_pid(GPid) of
		  true ->
		      notice:alert(util:fbin(lang:get(<<"探索值~ts~ts"/utf8>>),
					     [color:format({green,
							    lang:get(<<"+"/utf8>>)}),
					      color:format({green,
							    AddDevelop})]));
		  _ -> skip
		end,
		NewStageList = lists:keystore(StageId, #stage.id,
					      StageList, NewStage),
		NewMonopolyMaps =
		    MonopolyMaps#m_monopoly_maps{stage_list = NewStageList},
		NewRole = FinalRole#role{m_monopoly_maps =
					     NewMonopolyMaps},
		GuildDevelop = case get_guild_develop(StageId, Gid) of
				 {ok, OldGuildDevelop} ->
				     OldGuildDevelop + AddDevelop;
				 _ -> 0
			       end,
		add_dungeons_develop(StageId, AddDevelop, Gid),
		case get(monopoly_num) of
		  NumList when is_list(NumList) ->
		      NewNumList = lists:keystore(StageId, 1, NumList,
						  {StageId, AddNum}),
		      put(monopoly_num, NewNumList);
		  _ -> put(monopoly_num, [{StageId, AddNum}])
		end,
		NewEventType = case lists:keyfind(NewPos, 1, EventList)
				   of
				 {_, EventType} -> EventType;
				 _ -> 0
			       end,
		log:log_gain(Loss, Role, NewRole, <<"大富翁扔骰子"/utf8>>,
			     <<"道具消耗"/utf8>>),
		NewRole1 = role_trigger:fire([#evt_monopoly_dice{type =
								     Type},
					      #evt_monopoly_develop{stage_id =
									StageId,
								    develop =
									GuildDevelop}],
					     NewRole),
		push(NewRole1, 27408, StageId),
		monopoly_dungeons:push(NewRole1, 27500, StageId),
		{ok, AddNum, NewPos, NewOldDevelop, NewEventType,
		 StageId, GuildDevelop, NewRole1};
	    _ -> {false, lang:get(<<"道具不足"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason}
    end.

-spec trigger(list(), #role{}) -> {ok, #role{}} |
				  {false, string()}.

trigger(ArgsList, Role) ->
    case check_trigger(Role) of
      {ok, Type, Stage} ->
	  case trigger(Type, Stage, Role, ArgsList) of
	    {ok, TriggerStage = #stage{id = Id, pos = Pos},
	     TriggerRole} ->
		push(Role, 27404, {1, <<>>, Pos, 1, Id}),
		FinalRole = trigger_final(TriggerStage, TriggerRole),
		NewRole = special_final(Type, Id, FinalRole),
		push(NewRole, 27408, Id),
		{ok, NewRole};
	    {fight, TriggerStage = #stage{id = Id},
	     TriggerRole = #role{m_monopoly_maps =
				     MonopolyMaps = #m_monopoly_maps{stage_list
									 =
									 StageList}}} ->
		NewStageList = lists:keyreplace(Id, #stage.id,
						StageList, TriggerStage),
		NewMonopolyMaps =
		    MonopolyMaps#m_monopoly_maps{stage_list = NewStageList},
		NewRole = TriggerRole#role{m_monopoly_maps =
					       NewMonopolyMaps},
		push(NewRole, 27408, Id),
		NewRole,
		{ok, NewRole};
	    {false, Reason} -> {false, Reason}
	  end;
      {false, Reason} -> {false, Reason}
    end.

-spec combat_over(#role{}, #combat_result{}, #combat{},
		  tuple()) -> {ok, #role{}}.

combat_over(Role = #role{m_monopoly_maps =
			     #m_monopoly_maps{stage_list = StageList}},
	    #combat_result{result = Result}, #combat{},
	    {Type, StageId}) ->
    case lists:keyfind(StageId, #stage.id, StageList) of
      Stage = #stage{id = OldId, pos = OldPos} ->
	  Flag = case Result of
		   1 -> 1;
		   _ -> 0
		 end,
	  case reward_trigger(Type, Flag, Stage, Role) of
	    {ok, TriggerStage = #stage{id = Id, pos = Pos},
	     TriggerRole} ->
		push(Role, 27404, {1, <<>>, Pos, 1, Id}),
		FinalRole = trigger_final(TriggerStage, TriggerRole),
		NewRole = special_final(Type, Id, FinalRole),
		push(NewRole, 27408, StageId),
		{ok, NewRole};
	    {false, _Reason} ->
		push(Role, 27404, {1, <<>>, OldPos, 1, OldId}),
		FinalRole = trigger_final(Stage, Role),
		NewRole = special_final(Type, OldId, FinalRole),
		push(NewRole, 27408, StageId),
		{ok, NewRole}
	  end;
      _ -> {ok, Role}
    end.

get_stages(StageList,
	   #role{guild_bag = #guild_bag{id = Gid}}) ->
    Now = date:unixtime(),
    case monopoly_dungeons:get_monopoly_dungeons(Gid) of
      #monopoly_dungeons{stage_list = DungeonsStageList} ->
	  SortStageList = lists:keysort(#stage.id, StageList),
	  Stages = do_get_stages(SortStageList, DungeonsStageList,
				 [], 0, Now),
	  Stages;
      _ ->
	  SortStageList = lists:keysort(#stage.id, StageList),
	  Stages = do_get_stages(SortStageList, [], [], 0, Now),
	  Stages
    end.

do_get_stages([], _, OldList, _, _) -> OldList;
do_get_stages([#stage{id = Id, develop = Develop}
	       | Rest],
	      DungeonsStageList, OldList, LastDevelop, Now) ->
    case monopoly_maps_data:get_id_limit(Id) of
      {StartUnixTime, NeedDevelop}
	  when Now >= StartUnixTime ->
	  case lists:keyfind(Id, #dungeons_stage.id,
			     DungeonsStageList)
	      of
	    #dungeons_stage{develop = GuildDevelop}
		when LastDevelop >= NeedDevelop ->
		do_get_stages(Rest, DungeonsStageList,
			      [{Id, 0, Develop, GuildDevelop} | OldList],
			      GuildDevelop, Now);
	    _ when NeedDevelop =:= 0 ->
		do_get_stages(Rest, DungeonsStageList,
			      [{Id, 0, Develop, 0} | OldList], 0, Now);
	    _ ->
		do_get_stages(Rest, DungeonsStageList,
			      [{Id, 1, 0, 0} | OldList], 0, Now)
	  end;
      _ ->
	  do_get_stages(Rest, DungeonsStageList,
			[{Id, 1, 0, 0} | OldList], 0, Now)
    end;
do_get_stages(_, _, OldList, _, _) -> OldList.

init_monopoly(NewCampId) ->
    AllStage = [#stage{id = Id}
		|| Id <- monopoly_maps_data:get_all_id()],
    NewMonopoly = #m_monopoly_maps{camp_id = NewCampId,
				   stage_list = AllStage},
    NewMonopoly.

update_stage(Stage) ->
    do_update_stage([map, grid, event, summary], Stage,
		    #{}).

do_update_stage([], Stage, _) -> Stage;
do_update_stage([First | Rest], Stage, Args) ->
    case do_update_stage(First, Stage, Args) of
      ok -> do_update_stage(Rest, Stage, Args);
      {ok, NewArgs} -> do_update_stage(Rest, Stage, NewArgs);
      {ok, NewArgs, NewState} ->
	  do_update_stage(Rest, NewState, NewArgs);
      {false, Reason} -> {false, Reason};
      _ -> {false, lang:get(<<"事件生成失败"/utf8>>)}
    end;
do_update_stage(map, #stage{id = Id}, Args) ->
    case monopoly_maps_data:get_map_id(Id) of
      MapList when is_list(MapList) ->
	  case util:rand_list(MapList) of
	    MapId when is_integer(MapId) ->
		{ok, Args#{map_id => MapId}};
	    _ -> {false, lang:get(<<"地图配置错误"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"地图配置错误"/utf8>>)}
    end;
do_update_stage(grid, #stage{id = Id}, Args) ->
    case monopoly_maps_data:get_map_max_grid(Id) of
      MaxGrid when is_integer(MaxGrid) ->
	  {ok, Args#{max_grid => MaxGrid}};
      _ -> {false, lang:get(<<"格子数配置错误"/utf8>>)}
    end;
do_update_stage(event, _, Args = #{map_id := MapId}) ->
    EventsDataList = monopoly_maps_data:get_events(),
    EventList = filtrate(EventsDataList, MapId, []),
    {ok, Args#{event_list => EventList}};
do_update_stage(summary, Stage,
		Args = #{map_id := MapId, max_grid := MaxGrid,
			 event_list := EventList}) ->
    NewEventList = summary_event(1, MaxGrid, EventList, []),
    NewStage = Stage#stage{pos = 1, map_id = MapId,
			   events = NewEventList, status = 1},
    {ok, Args, NewStage};
do_update_stage(_, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

summary_event(Pos, MaxGrid, _, OldEvents)
    when Pos > MaxGrid ->
    OldEvents;
summary_event(Pos, MaxGrid, EventList, OldEvents) ->
    case lists:keyfind(Pos, 1, EventList) of
      {Pos, Type} ->
	  summary_event(Pos + 1, MaxGrid, EventList,
			[{Pos, Type} | OldEvents]);
      _ ->
	  summary_event(Pos + 1, MaxGrid, EventList,
			[{Pos, 1} | OldEvents])
    end.

filtrate([], _, EventList) -> EventList;
filtrate([{MapId, Type, [MinNum, MaxNum], PosList}
	  | Rest],
	 MapId, EventList) ->
    Num = util:rand(MinNum, MaxNum),
    case util:rand_list_n(PosList, Num) of
      NowPosList when is_list(NowPosList) ->
	  TypePos = [{Pos, Type} || Pos <- NowPosList],
	  filtrate(Rest, MapId, TypePos ++ EventList);
      _ -> filtrate(Rest, MapId, EventList)
    end;
filtrate([_ | Rest], MapId, EventList) ->
    filtrate(Rest, MapId, EventList);
filtrate(_, _, EventList) -> EventList.

check_enter_cond(Id,
		 Role = #role{m_monopoly_maps =
				  #m_monopoly_maps{camp_id = CampId,
						   stage_list = StageList}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3040, 93040, 993040])
	of
      #holiday{camp_id = CampId} ->
	  Stages = get_stages(StageList, Role),
	  case lists:keyfind(Id, 1, Stages) of
	    {_, 0, _, _} ->
		case lists:keyfind(Id, #stage.id, StageList) of
		  Stage = #stage{events = []} -> {ok, first, Stage};
		  #stage{} -> ok;
		  _ -> {false, lang:get(<<"没有该地图"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"该地图还未解锁"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动没开始"/utf8>>)}
    end.

loss_dice(Type, Role) ->
    ItemId = case Type of
	       1 -> monopoly_maps_data:get_const(monopoly_dice_id);
	       _ -> monopoly_maps_data:get_const(monopoly_secret_id)
	     end,
    Loss = format:val_to_loss([{ItemId, 1}], holiday_item),
    case role_gain:do(Role, Loss) of
      {ok, NewRole} -> {ok, NewRole, Loss};
      _ -> {false, lang:get(<<"道具不足"/utf8>>)}
    end.

check_dice_cond(Type, Num,
		Role = #role{m_monopoly_maps =
				 #m_monopoly_maps{id = Id, camp_id = CampId,
						  stage_list = StageList}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3040, 93040, 993040])
	of
      #holiday{camp_id = CampId} ->
	  case lists:keyfind(Id, #stage.id, StageList) of
	    #stage{status = 2} ->
		{false, lang:get(<<"当前状态下不能扔骰子"/utf8>>)};
	    Stage = #stage{pos = Pos} when Type =:= 1 ->
		{MinNum, MaxNum} =
		    monopoly_maps_data:get_const(monopoly_dice_rand),
		RandNum = util:rand(MinNum, MaxNum),
		case monopoly_maps_data:get_map_max_grid(Id) of
		  MaxGrid when is_integer(MaxGrid) ->
		      NewPos = min(MaxGrid, Pos + RandNum),
		      AddNum = max(0, NewPos - Pos),
		      {ok, NewPos, AddNum, Stage};
		  _ -> {false, lang:get(<<"配置数据错误"/utf8>>)}
		end;
	    Stage = #stage{pos = Pos} when Type =:= 2 ->
		{MinNum, MaxNum} =
		    monopoly_maps_data:get_const(monopoly_secret_rand),
		case monopoly_maps_data:get_map_max_grid(Id) of
		  MaxGrid
		      when is_integer(MaxGrid), Num >= MinNum,
			   Num =< MaxNum ->
		      NewPos = min(MaxGrid, Pos + Num),
		      AddNum = max(0, NewPos - Pos),
		      {ok, NewPos, AddNum, Stage};
		  MaxGrid when is_integer(MaxGrid) ->
		      {false, lang:get(<<"点数不在可选择的范围内"/utf8>>)};
		  _ -> {false, lang:get(<<"配置数据错误"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"当前不在地图内"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"当前没有活动"/utf8>>)}
    end.

trigger(1, Stage, Role, _) ->
    reward_trigger(1, 1, Stage, Role);
trigger(Type = 2, Stage = #stage{buffs = BuffList},
	Role, Args) ->
    case lists:keyfind(2, 1, BuffList) of
      {BuffType, Num, _Time} when Num >= 1 ->
	  NewStage = subtraction(BuffType, Stage),
	  put(win_buff, 1),
	  reward_trigger(Type, 1, NewStage, Role);
      _ -> trigger_fight(Type, Stage, Role, Args)
    end;
trigger(3, Stage, Role, _) ->
    reward_trigger(3, 1, Stage, Role);
trigger(4, Stage = #stage{id = Id}, Role,
	[{_, Choice, _}]) ->
    SystemChoice = util:rand_list([1, 2, 3]),
    Result = case SystemChoice =:= Choice of
	       true -> 3;
	       _
		   when Choice =:= 1 andalso SystemChoice =:= 3 orelse
			  Choice =:= 2 andalso SystemChoice =:= 1 orelse
			    Choice =:= 3 andalso SystemChoice =:= 2 ->
		   1;
	       _ -> 2
	     end,
    push(Role, 27405, {Id, Choice, SystemChoice, Result}),
    Flag = case Result of
	     1 -> 1;
	     _ -> 0
	   end,
    reward_trigger(4, Flag, Stage, Role);
trigger(5, Stage = #stage{buffs = BuffList}, Role,
	[{_, QuestionId, Choice}]) ->
    case monopoly_maps_data:get_mystery_reward(QuestionId)
	of
      RewardDataList when is_list(RewardDataList) ->
	  case lists:keyfind(Choice, 1, RewardDataList) of
	    {_, RewardList} ->
		BuffStage = subtraction(3, Stage),
		reward_trigger1(RewardList, BuffStage, Role, [],
				BuffList);
	    _ -> {false, lang:get(<<"没有该选项"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"没有该题目"/utf8>>)}
    end;
trigger(6, Stage, Role, _) ->
    reward_trigger(6, 1, Stage, Role);
trigger(Type = 7, Stage = #stage{buffs = BuffList},
	Role, Args) ->
    case lists:keyfind(2, 1, BuffList) of
      {BuffType, Num, _Time} when Num >= 1 ->
	  put(win_buff, 1),
	  NewStage = subtraction(BuffType, Stage),
	  reward_trigger(Type, 1, NewStage, Role);
      _ -> trigger_fight(Type, Stage, Role, Args)
    end;
trigger(8, Stage, Role, _) ->
    reward_trigger(8, 1, Stage, Role);
trigger(9, Stage, Role, _) ->
    reward_trigger(9, 1, Stage, Role);
trigger(10, Stage, Role, _) ->
    reward_trigger(10, 1, Stage, Role);
trigger(11, Stage, Role, _) ->
    reward_trigger(11, 1, Stage, Role);
trigger(12, Stage, Role, _) ->
    reward_trigger(12, 1, Stage, Role);
trigger(13, Stage, Role, [{_, FlagNum, _}]) ->
    NewStage = Stage#stage{flag_num = FlagNum},
    {ok, NewStage, Role};
trigger(14, Stage, Role, _) ->
    reward_trigger(14, 1, Stage, Role);
trigger(_, _, _, _) ->
    {false, lang:get(<<"没有该类型的事件"/utf8>>)}.

reward_trigger(Type, Flag,
	       Stage = #stage{buffs = BuffList}, Role) ->
    case monopoly_maps_data:get_reward_id(Type) of
      {WinList, _} when Flag =:= 1, is_list(WinList) ->
	  BuffStage = subtraction(3, Stage),
	  reward_trigger1(WinList, BuffStage, Role, [], BuffList);
      {_, FalseList} when is_list(FalseList) ->
	  BuffStage = subtraction(3, Stage),
	  reward_trigger1(FalseList, BuffStage, Role, [],
			  BuffList);
      _ -> {false, lang:get(<<"没有奖励"/utf8>>)}
    end.

reward_trigger1([], Stage = #stage{id = StageId}, Role,
		RewardList, BuffList) ->
    Gain = format:val_to_gain(RewardList, monopoly_maps),
    case role_gain:do(Role, Gain) of
      {ok, NewRole} ->
	  RewardBuff = case lists:keyfind(3, 1, BuffList) of
			 {_, Num, _} when Num >= 1 -> [3];
			 _ -> []
		       end,
	  WinBuff = case get(win_buff) of
		      1 -> put(win_buff, 0), [2];
		      _ -> []
		    end,
	  Flag = case get(flag) of
		   1 -> put(flag, 0), [4];
		   _ -> []
		 end,
	  AllBuff = RewardBuff ++ WinBuff ++ Flag,
	  push(NewRole, 27409, {StageId, AllBuff, RewardList}),
	  log:log_gain(Gain, Role, NewRole, <<"大富翁事件奖励"/utf8>>,
		       <<"获得奖励"/utf8>>),
	  {ok, Stage, NewRole};
      _ -> {false, lang:get(<<"获得奖励失败"/utf8>>)}
    end;
reward_trigger1([Id | Rest], Stage, Role, RewardList,
		BuffList) ->
    NewTime = case lists:keyfind(3, 1, BuffList) of
		{_, Num, Time} when Num >= 1 -> Time;
		_ -> 1
	      end,
    case monopoly_maps_data:get_reward(Id) of
      {RewardType, DataNum, DataArgs, BuffReward} ->
	  case reward_trigger2(RewardType,
			       {DataNum * NewTime, DataArgs, BuffReward}, Stage,
			       Role, RewardList)
	      of
	    ok ->
		reward_trigger1(Rest, Stage, Role, RewardList,
				BuffList);
	    {ok, NewStage = #stage{}, NewRole = #role{},
	     NewRewardList} ->
		reward_trigger1(Rest, NewStage, NewRole, NewRewardList,
				BuffList);
	    {ok, NewStage = #stage{}} ->
		reward_trigger1(Rest, NewStage, Role, RewardList,
				BuffList);
	    {ok, NewRole = #role{}} ->
		reward_trigger1(Rest, Stage, NewRole, RewardList,
				BuffList);
	    {ok, NewRewardList} when is_list(NewRewardList) ->
		reward_trigger1(Rest, Stage, Role, NewRewardList,
				BuffList);
	    {false, Reason} -> {false, Reason};
	    _ -> {false, lang:get(<<"获得奖励失败"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"配置错误"/utf8>>)}
    end;
reward_trigger1(_, _, _, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

reward_trigger2(1, {Num, [BaseId], _}, _Stage, _Role,
		RewardList) ->
    {ok, [{BaseId, Num} | RewardList]};
reward_trigger2(2, {Num, BuffList, BuffReward}, _Stage,
		Role = #role{guild_bag = #guild_bag{pid = Pid}},
		RewardList) ->
    case is_pid(Pid) of
      true ->
	  AddBuffList = rand_buff_list(Num, BuffList, []),
	  GetReward = get_buff_reward(AddBuffList, BuffReward,
				      []),
	  add_monopoly_dungeons_buff(AddBuffList, Role),
	  {ok, GetReward ++ RewardList};
      _ -> {ok, RewardList}
    end;
reward_trigger2(4, {Num, [Time], BuffReward},
		Stage = #stage{buffs = BuffList}, Role, RewardList) ->
    NewBuffList = case lists:keyfind(3, 1, BuffList) of
		    {_, OldNum, _} ->
			BuffList1 = lists:keyreplace(3, 1, BuffList,
						     {3, OldNum + Num, Time}),
			BuffList1;
		    _ -> BuffList1 = [{3, Num, Time} | BuffList], BuffList1
		  end,
    NewStage = Stage#stage{buffs = NewBuffList},
    NewBuffReward = [{BaseId, Num}
		     || {BaseId, _} <- BuffReward],
    {ok, NewStage, Role, NewBuffReward ++ RewardList};
reward_trigger2(3, {Num, SkillIds, BuffReward},
		Stage = #stage{buffs = BuffList}, Role, RewardList) ->
    NewBuffList = case lists:keyfind(1, 1, BuffList) of
		    {_, OldNum, _} ->
			BuffList1 = lists:keyreplace(1, 1, BuffList,
						     {1, OldNum + Num,
						      SkillIds}),
			BuffList1;
		    _ ->
			BuffList1 = [{1, Num, SkillIds} | BuffList], BuffList1
		  end,
    NewStage = Stage#stage{buffs = NewBuffList},
    NewBuffReward = [{BaseId, Num}
		     || {BaseId, _} <- BuffReward],
    {ok, NewStage, Role, NewBuffReward ++ RewardList};
reward_trigger2(5, {Num, _, BuffReward},
		Stage = #stage{buffs = BuffList}, Role, RewardList) ->
    NewBuffList = case lists:keyfind(2, 1, BuffList) of
		    {_, OldNum, _} ->
			BuffList1 = lists:keyreplace(2, 1, BuffList,
						     {2, OldNum + Num, 0}),
			BuffList1;
		    _ -> BuffList1 = [{2, Num, 0} | BuffList], BuffList1
		  end,
    NewStage = Stage#stage{buffs = NewBuffList},
    NewBuffReward = [{BaseId, Num}
		     || {BaseId, _} <- BuffReward],
    {ok, NewStage, Role, NewBuffReward ++ RewardList};
reward_trigger2(6, _, Stage, _Role, _) -> {ok, Stage};
reward_trigger2(_, _, _, _, _) ->
    {false, lang:get(<<"没有该事件"/utf8>>)}.

check_trigger(Role = #role{m_monopoly_maps =
			       #m_monopoly_maps{camp_id = CampId, id = Id,
						stage_list = StageList}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3040, 93040, 993040])
	of
      #holiday{camp_id = CampId} ->
	  case lists:keyfind(Id, #stage.id, StageList) of
	    Stage = #stage{status = 2, pos = Pos,
			   events = EventsList} ->
		case lists:keyfind(Pos, 1, EventsList) of
		  {_, Type} -> {ok, Type, Stage};
		  _ -> {false, lang:get(<<"没有该位置"/utf8>>)}
		end;
	    #stage{status = 1} ->
		{false, lang:get(<<"当前没有事件发生"/utf8>>)};
	    _ -> {false, lang:get(<<"当前不在地图内"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动没开始"/utf8>>)}
    end.

trigger_final(Stage = #stage{id = StageId, pos = Pos,
			     events = EventsList},
	      Role = #role{m_monopoly_maps =
			       MonopolyMaps = #m_monopoly_maps{stage_list =
								   StageList}}) ->
    case monopoly_maps_data:get_map_max_grid(StageId) of
      Pos when is_integer(Pos) ->
	  case update_stage(Stage) of
	    NewStage = #stage{} ->
		NewStageList = lists:keyreplace(StageId, #stage.id,
						StageList, NewStage),
		NewMonopolyMaps =
		    MonopolyMaps#m_monopoly_maps{stage_list = NewStageList},
		NewRole = Role#role{m_monopoly_maps = NewMonopolyMaps},
		push(NewRole, 27401, StageId),
		NewRole;
	    _ ->
		NewEventsList = lists:keyreplace(Pos, 1, EventsList,
						 {Pos, 1}),
		NewStage = Stage#stage{status = 1,
				       events = NewEventsList},
		NewStageList = lists:keyreplace(StageId, #stage.id,
						StageList, NewStage),
		NewMonopolyMaps =
		    MonopolyMaps#m_monopoly_maps{stage_list = NewStageList},
		NewRole = Role#role{m_monopoly_maps = NewMonopolyMaps},
		NewRole
	  end;
      _ ->
	  NewEventsList = lists:keyreplace(Pos, 1, EventsList,
					   {Pos, 1}),
	  NewStage = Stage#stage{status = 1,
				 events = NewEventsList},
	  NewStageList = lists:keyreplace(StageId, #stage.id,
					  StageList, NewStage),
	  NewMonopolyMaps =
	      MonopolyMaps#m_monopoly_maps{stage_list = NewStageList},
	  NewRole = Role#role{m_monopoly_maps = NewMonopolyMaps},
	  NewRole
    end.

special_final(8, Id,
	      Role = #role{m_monopoly_maps =
			       MonopolyMaps = #m_monopoly_maps{stage_list =
								   StageList},
			   guild_bag = #guild_bag{id = Gid, pid = GPid}}) ->
    case lists:keyfind(Id, #stage.id, StageList) of
      Stage = #stage{pos = Pos, develop = OldDevelop,
		     buffs = BuffList, events = EventList} ->
	  AddNum = case get(monopoly_num) of
		     NumList when is_list(NumList) ->
			 case lists:keyfind(Id, 1, NumList) of
			   {_, Num} -> Num;
			   _ -> 1
			 end;
		     _ -> 1
		   end,
	  case monopoly_maps_data:get_map_max_grid(Id) of
	    MaxGrid when is_integer(MaxGrid) ->
		NewPos = min(MaxGrid, Pos + AddNum),
		{NewOldDevelop, AddDevelop} = case lists:keyfind(3, 1,
								 BuffList)
						  of
						{_, RewardNum, Time}
						    when RewardNum > 0 ->
						    {OldDevelop + Time, Time};
						_ -> {OldDevelop + 1, 1}
					      end,
		NewEventType = case lists:keyfind(NewPos, 1, EventList)
				   of
				 {_, EventType} -> EventType;
				 _ -> 0
			       end,
		GuildDevelop = case get_guild_develop(Id, Gid) of
				 {ok, OldGuildDevelop} ->
				     OldGuildDevelop + AddDevelop;
				 _ -> 0
			       end,
		add_dungeons_develop(Id, AddDevelop, Gid),
		NewStage = Stage#stage{pos = NewPos,
				       develop = NewOldDevelop, status = 2},
		case is_pid(GPid) of
		  true ->
		      notice:alert(util:fbin(lang:get(<<"探索值~ts~ts"/utf8>>),
					     [color:format({green,
							    lang:get(<<"+"/utf8>>)}),
					      color:format({green,
							    AddDevelop})]));
		  _ -> skip
		end,
		NewStageList = lists:keystore(Id, #stage.id, StageList,
					      NewStage),
		NewMonopolyMaps =
		    MonopolyMaps#m_monopoly_maps{stage_list = NewStageList},
		NewRole = Role#role{m_monopoly_maps = NewMonopolyMaps},
		push(NewRole, 27403,
		     {1, <<>>, AddNum, NewPos, NewOldDevelop, NewEventType,
		      Id, GuildDevelop}),
		TriggerRole =
		    role_trigger:fire(#evt_monopoly_develop{stage_id = Id,
							    develop =
								GuildDevelop},
				      NewRole),
		TriggerRole;
	    _ -> Role
	  end;
      _ -> Role
    end;
special_final(_, _, Role) -> Role.

subtraction(Type, Stage = #stage{buffs = BuffList}) ->
    NewStage = case lists:keyfind(Type, 1, BuffList) of
		 {Type, Num, Time} when Num > 1 ->
		     NewBuffList = lists:keyreplace(Type, 1, BuffList,
						    {Type, Num - 1, Time}),
		     Stage#stage{buffs = NewBuffList};
		 {Type, _, _} ->
		     NewBuffList = lists:keydelete(Type, 1, BuffList),
		     Stage#stage{buffs = NewBuffList};
		 _ -> Stage
	       end,
    NewStage.

trigger_fight(Type,
	      Stage = #stage{id = StageId, buffs = BuffList}, Role,
	      Args) ->
    NewSkillIds = case lists:keyfind(1, 1, BuffList) of
		    {_, Num, SkillIds} when Num >= 1 -> SkillIds;
		    _ -> []
		  end,
    CombatType = case StageId of
		   1 -> 101;
		   2 -> 102;
		   3 -> 103;
		   _ -> 104
		 end,
    NewFormationType = case lists:keyfind(1, 1, Args) of
			 {_, FormationType, _} -> FormationType;
			 _ -> 1
		       end,
    PosInfo = [{PartnerPos, PartnerId}
	       || {2, PartnerPos, PartnerId} <- Args],
    NewHallowsId = case lists:keyfind(3, 1, Args) of
		     {_, HallowsId, _} -> HallowsId;
		     _ -> 0
		   end,
    FormationLev = formation_lib:get_formation_lev(Role,
						   NewFormationType),
    FightPos = formation_lib:gen_fight_pos(PosInfo,
					   NewFormationType),
    AtkGroup0 = combat_lib:gen_fight_objects(Role,
					     FightPos),
    AtkGroup = sprite_tree:gen_fight_object(Role) ++
		 hallows_lib:gen_fight_object(Role, NewHallowsId) ++
		   [add_skill_buff(FO, NewSkillIds) || FO <- AtkGroup0],
    {BFormationType, TarName, DefendList} =
	get_fight_robot(Type, Role, Stage),
    case formation:check_formation_pos_info(Role,
					    NewFormationType, PosInfo,
					    NewHallowsId, 29)
	of
      {false, Reason} -> {false, Reason};
      {ok, []} -> {false, lang:get(<<"至少需要上阵一个英雄"/utf8>>)};
      {ok, _NewPosInfo} ->
	  CombatArgs = #{on_role_combat_end =>
			     {monopoly_maps, combat_over, [{Type, StageId}]},
			 formation =>
			     [{1, NewFormationType, FormationLev},
			      {2, BFormationType, 1}],
			 target_role_name => TarName,
			 ext_args => [{is_show_panel, false}]},
	  case combat_lib:start_combat(Role, CombatType, AtkGroup,
				       [DefendList], CombatArgs)
	      of
	    {ok, _CombatPid} ->
		SubStage = subtraction(1, Stage),
		NewStage = SubStage#stage{combat_id = {0, 0, <<>>}},
		case formation:set_sys_formation(Role, 29,
						 NewFormationType, PosInfo,
						 NewHallowsId)
		    of
		  {ok, NewRole} -> {fight, NewStage, NewRole};
		  _ -> {fight, NewStage, Role}
		end;
	    {false, Msg} -> {false, Msg};
	    _ -> {false, lang:get(<<"无法发起剧情副本战斗"/utf8>>)}
	  end
    end.

get_fight_robot(_, Role,
		#stage{combat_id = {CombatType, FightId, FightName}})
    when CombatType =/= 0 ->
    case CombatType of
      1 ->
	  case role_robot:get_role(FightId) of
	    {ok, Robot = #role_robot{}} ->
		#formation_sys{pos_info = PosInfo,
			       type = FormationType} =
		    formation:get_sys_formation(Robot, 29),
		BFightPos = formation_lib:gen_fight_pos(PosInfo,
							FormationType),
		{ok, DefListTT} = role_robot:to_fight_objects(Robot,
							      [{Pos, PId}
							       || #formation_fight_info{fight_pos
											    =
											    Pos,
											id
											    =
											    PId}
								      <- BFightPos,
								  PId > 0]),
		{FormationType, FightName, DefListTT};
	    _ ->
		#{formation := FormationType} = robot:get(Role, FightId,
							  #{max_num => 5}),
		FOL0 = robot:gen_fight_objects(Role, FightId,
					       #{max_num => 5}, {1, <<>>}),
		{FormationType, FightName, FOL0}
	  end;
      _ ->
	  #{formation := FormationType} = robot:get(Role, FightId,
						    #{max_num => 5}),
	  FOL0 = robot:gen_fight_objects(Role, FightId,
					 #{max_num => 5}, {1, <<>>}),
	  {FormationType, FightName, FOL0}
    end;
get_fight_robot(Type,
		Role = #role{id = RoleId, max_power = RoleMaxPower},
		_) ->
    {MinPowerRatio, MaxPowerRatio} = case Type of
				       2 ->
					   monopoly_maps_data:get_const(monopoly_event_trap_power);
				       _ ->
					   monopoly_maps_data:get_const(monopoly_event_boss_power)
				     end,
    MinPower = round(MinPowerRatio * RoleMaxPower / 1000),
    MaxPower = round(MaxPowerRatio * RoleMaxPower / 1000),
    case do_match_by_power(MinPower, MaxPower, RoleId) of
      {ok, ArenaId, Name} ->
	  case role_robot:get_role(ArenaId) of
	    {ok, Robot = #role_robot{}} ->
		#formation_sys{pos_info = PosInfo,
			       type = FormationType} =
		    formation:get_sys_formation(Robot, 29),
		BFightPos = formation_lib:gen_fight_pos(PosInfo,
							FormationType),
		{ok, DefListTT} = role_robot:to_fight_objects(Robot,
							      [{Pos, PId}
							       || #formation_fight_info{pos
											    =
											    Pos,
											id
											    =
											    PId}
								      <- BFightPos,
								  PId > 0]),
		{FormationType, Name, DefListTT};
	    _ -> gen_robot(Role, MinPower, MaxPower)
	  end;
      _ -> gen_robot(Role, MinPower, MaxPower)
    end.

gen_robot(Role, MinPower, MaxPower) ->
    MappingPower = util:rand(MinPower, MaxPower),
    RobotId = robot_range(MappingPower),
    #{formation := FormationType} = robot:get(Role, RobotId,
					      #{max_num => 5}),
    FOL0 = robot:gen_fight_objects(Role, RobotId,
				   #{max_num => 5}, {1, <<>>}),
    Name1 = util:rand_list(random_name_data:arena_list(1)),
    Name2 = util:rand_list(random_name_data:arena_list(2)),
    Name3 = util:rand_list(random_name_data:arena_list(3)),
    Name = <<Name1/binary, Name2/binary, Name3/binary>>,
    {FormationType, Name, FOL0}.

get_fight_id_name(Type,
		  #role{id = RoleId, max_power = RoleMaxPower}) ->
    {MinPowerRatio, MaxPowerRatio} = case Type of
				       2 ->
					   monopoly_maps_data:get_const(monopoly_event_trap_power);
				       _ ->
					   monopoly_maps_data:get_const(monopoly_event_boss_power)
				     end,
    MinPower = round(MinPowerRatio * RoleMaxPower / 1000),
    MaxPower = round(MaxPowerRatio * RoleMaxPower / 1000),
    case do_match_by_power(MinPower, MaxPower, RoleId) of
      {ok, ArenaId, Name} -> {1, ArenaId, Name};
      _ ->
	  MappingPower = util:rand(MinPower, MaxPower),
	  RobotId = robot_range(MappingPower),
	  Name1 = util:rand_list(random_name_data:arena_list(1)),
	  Name2 = util:rand_list(random_name_data:arena_list(2)),
	  Name3 = util:rand_list(random_name_data:arena_list(3)),
	  Name = <<Name1/binary, Name2/binary, Name3/binary>>,
	  {2, RobotId, Name}
    end.

get_fight_client(1, Id, _Name,
		 Role = #role{m_monopoly_maps =
				  MonopolyMaps = #m_monopoly_maps{stage_list =
								      StageList}},
		 Type, Stage = #stage{id = StageId}) ->
    case arena_lib:get_role(Id) of
      {ok,
       #arena_role{id = {Rid, SrvId}, name = ArenaName,
		   lev = Lev, face = Face, power = Power}} ->
	  case role_robot:get_role(Id) of
	    {ok, Robot = #role_robot{partners = Partners}} ->
		#formation_sys{pos_info = PosInfo} =
		    formation:get_sys_formation(Robot, 29),
		Fun = fun (#formation_pos{pos = Pos, id = PId}) ->
			      #partner{bid = Bid, use_skin = UseSkin,
				       lev = PLev, star = Star} =
				  lists:keyfind(PId, #partner.id, Partners),
			      {Pos, Bid, PLev, Star, [{5, UseSkin}]}
		      end,
		PList = [Fun(I) || I <- PosInfo],
		{{StageId, Rid, SrvId, ArenaName, Face, Lev, Power,
		  PList},
		 Role};
	    _ ->
		{FightType, FightId, FightName} =
		    get_fight_id_name(Type, Role),
		NewStage = Stage#stage{combat_id =
					   {FightType, FightId, FightName}},
		NewStageList = lists:keyreplace(StageId, #stage.id,
						StageList, NewStage),
		NewMonopolyMaps =
		    MonopolyMaps#m_monopoly_maps{stage_list = NewStageList},
		NewRole = Role#role{m_monopoly_maps = NewMonopolyMaps},
		get_fight_client(FightType, FightId, FightName, NewRole,
				 Type, NewStage)
	  end;
      _ ->
	  {FightType, FightId, FightName} =
	      get_fight_id_name(Type, Role),
	  NewStage = Stage#stage{combat_id =
				     {FightType, FightId, FightName}},
	  NewStageList = lists:keyreplace(StageId, #stage.id,
					  StageList, NewStage),
	  NewMonopolyMaps =
	      MonopolyMaps#m_monopoly_maps{stage_list = NewStageList},
	  NewRole = Role#role{m_monopoly_maps = NewMonopolyMaps},
	  get_fight_client(FightType, FightId, FightName, NewRole,
			   Type, NewStage)
    end;
get_fight_client(_, Id, Name, Role, _,
		 #stage{id = StageId}) ->
    #{partners := Partners, lev := Lev, face := Face} =
	robot:get(Role, Id, #{max_num => 5}),
    Power = lists:sum([PPower
		       || #partner{power = PPower} <- Partners]),
    PList = [{Pid, Bid, PLev, Star, [{5, UseSkin}]}
	     || #partner{id = Pid, bid = Bid, use_skin = UseSkin,
			 lev = PLev, star = Star}
		    <- Partners],
    {{StageId, 0, <<>>, Name, Face, Lev, Power, PList},
     Role}.

robot_range(Power) ->
    NewRobotIds = case expedition_data:new_robot({1, 6,
						  Power})
		      of
		    {RobotIds, _} -> RobotIds;
		    _ ->
			case expedition_data:new_robot({1, 1, 999999}) of
			  {RobotIds, _} -> RobotIds;
			  _ -> [{20000, 100}]
			end
		  end,
    {RobotId, _} = util:rand_list(NewRobotIds, 2),
    RobotId.

do_match_by_power(MinPower, MaxPower, RoleId) ->
    Fun = [{{arena_role, '_', '_', '_', '_', '_', '_', '_',
	     '$1', '_', '_', '_', '_', '_', '_', '_', '_', '_'},
	    [{'andalso', {'>=', '$1', {const, MinPower}},
	      {'=<', '$1', {const, MaxPower}}}],
	    ['$_']}],
    case ets:select(arena_role, Fun, 10) of
      {L1, _} ->
	  case [{ArenaId, ArenaName}
		|| #arena_role{id = ArenaId, name = ArenaName} <- L1,
		   ArenaId =/= RoleId]
	      of
	    L2 = [_ | _] ->
		case util:rand_list(L2) of
		  {Id, Name} when is_tuple(Id) -> {ok, Id, Name};
		  _ -> false
		end;
	    _ -> false
	  end;
      _ -> false
    end.

add_dungeons_develop(Id, AddDevelop, Gid) ->
    monopoly_dungeons:info(Gid,
			   {add_develop, Id, AddDevelop}),
    ok.

add_monopoly_dungeons_buff(AddBuffList,
			   #role{guild_bag = #guild_bag{id = Gid},
				 pid = Pid}) ->
    monopoly_dungeons:info(Gid, {buff, AddBuffList, Pid}),
    ok.

add_skill_buff(FO = #fight_object{passive_skills =
				      PassiveSkills},
	       NewSkillIds) ->
    AddPassiveSkills = [skill_data:get_skill(AddSkillId)
			|| AddSkillId <- NewSkillIds, is_integer(AddSkillId)],
    FO#fight_object{passive_skills =
			PassiveSkills ++ AddPassiveSkills}.

get_buff_reward([], _, RewardList) -> RewardList;
get_buff_reward([{Atom, _} | Rest], BuffReward,
		RewardList) ->
    case lists:keyfind(Atom, 1, BuffReward) of
      {_, Id, Num} ->
	  get_buff_reward(Rest, BuffReward,
			  [{Id, Num} | RewardList]);
      _ -> get_buff_reward(Atom, BuffReward, RewardList)
    end;
get_buff_reward(_, _, RewardList) -> RewardList.

rand_buff_list(Num, _, AddBuffList) when Num < 1 ->
    AddBuffList;
rand_buff_list(Num, BuffList, AddBuffList) ->
    case util:rand_list(BuffList, 3) of
      {BuffType, Val, _} ->
	  rand_buff_list(Num - 1, BuffList,
			 [{BuffType, Val} | AddBuffList]);
      _ -> rand_buff_list(Num - 1, BuffList, AddBuffList)
    end.

get_guild_develop(Id, Gid) ->
    case monopoly_dungeons:get_monopoly_dungeons(Gid) of
      #monopoly_dungeons{stage_list = StageList} ->
	  case lists:keyfind(Id, #dungeons_stage.id, StageList) of
	    #dungeons_stage{develop = Develop} -> {ok, Develop};
	    _ -> {false, 0}
	  end;
      _ -> {false, 0}
    end.


