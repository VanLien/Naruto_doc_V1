-file("data/role_misc.erl", 1).

-file("src/mod/role/role_misc.erl", 1).

-module(role_misc).

-lager_records([{guild_skill_break_group,
		 [ver, career, attr_formation, skill_formation, ext]},
		{guild_skill_group,
		 [ver, career, group_id, skill_ids, group_ids]},
		{m_guild_skill, [ver, groups, break_groups]},
		{recruit_limit, [key, info]},
		{holiday_info, [camp_id, stats, ext]},
		{recruit_info, [group_id, stats, ext]},
		{m_recruit_award, [ver, list]},
		{m_recruit,
		 [ver, free_cd_end, list, convert_list, convert_state,
		  holiday_list, holy_eqm_lottery, logs,
		  holiday_sprite_lottery_list, lucky_sprites,
		  lucky_holy_eqm, all_score]},
		{m_home_pet,
		 [ver, name, id, rename_count, state, calc_time,
		  start_time, end_time, vigor, vigor_time, set_item,
		  next_evt_id, city, evt_list, do_evts, acc_evts,
		  fire_time, acc_out_time, acc_out_count, acc_items,
		  photos, diarys, day_talk, day_feed, photos_next_id,
		  diarys_next_id, photos_had]},
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
		{room_rank_info,
		 [id, name, lev, face, avatar_bid, time, fans_num, rank,
		  look_id, face_update_time, face_file]},
		{room_fans_num, [id, fans]}, {room_fans, [myid, fid]},
		{room_bbs_message_below, [id, role_id, name, bbs_id]},
		{room_bbs_message,
		 [id, bbs_id, bbs_type, reply_name, reply_bbs_id,
		  reply_id, msg, time, tar_id, face_id, avatar_id, lev,
		  sex, name, face_update_time, face_file]},
		{room_honor_badges, [id, time]},
		{room_grow, [id, order, time, arge, ext]},
		{m_room_grow, [ver, finish, doing, info, next_id, ext]},
		{m_room_feat, [ver, flag, finish, doing, overdue, ext]},
		{m_room,
		 [ver, city_id, fanse_list, honor_badges, honor_point,
		  use_badges, room_bbs_set, room_bbs_num]},
		{arena_cluster_fight_lock,
		 [id, is_fight, fight_rid, fight_pid]},
		{arena_cluster_replay_partner,
		 [pos, bid, lev, star, ext]},
		{arena_cluster_replay,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_cluster_log,
		 [id, atk_id, atk_name, atk_face, atk_lev, atk_rank,
		  atk_score, def_id, def_name, def_face, def_lev,
		  def_rank, def_score, ret, win_count, lose_count,
		  combat_type, replay_list, time, atk_face_update_time,
		  atk_face_file, def_face_update_time, def_face_file]},
		{role_arena_cluster_log, [id, list]},
		{arena_cluster_role,
		 [id, name, vip, lev, sex, gid, gname, face, power,
		  max_power, lookid, score, rank, time, avatar_id,
		  cont_win, ext]},
		{arena_cluster_rank, [rank, id, score]},
		{arena_cluster_f_pos,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  dower_skill, set_skill, attr, extra]},
		{arena_cluster_f_order,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, pos_info, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  power, is_hidden, extra]},
		{arena_cluster_f,
		 [id, name, gname, idx, lev, vip_lev, sex, face, power,
		  rank, order_info, robot_id, avatar_id, look, ext]},
		{m_arena_cluster,
		 [ver, ref_time, formations, ref_list, season_ref_time,
		  season_combat_num, best_rank, day_combat_num,
		  acc_combat_num, day_reward, turn_card_reward,
		  turn_card_num, turn_card_history, worship,
		  worship_list]},
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
		{sky_ladder_result,
		 [result, id, def_name, def_lev, def_face,
		  def_change_rank, def_rank, def_old_rank,
		  is_change_best_rank, atk_change_rank, atk_rank,
		  atk_old_rank, atk_cont_win, reward,
		  def_face_update_time, def_face_file]},
		{sky_ladder_highlight,
		 [id, atk_id, atk_name, atk_face, atk_rank, def_id,
		  def_name, def_face, def_rank, ret, replay_id, time,
		  atk_face_update_time, atk_face_file,
		  def_face_update_time, def_face_file]},
		{sky_ladder_pk_log,
		 [id, rid, name, lev, sex, face, avatar_id, power,
		  atk_power, enemy_old_rank, old_rank, type, ret,
		  replay_id, rank_type, rank, time, face_update_time,
		  face_file]},
		{sky_ladder_role_log,
		 [id, name, face, logs, face_update_time, face_file]},
		{sky_ladder_rank,
		 [rank, id, is_fight, fight_rid, fight_pid]},
		{sky_ladder_role,
		 [id, name, vip, lev, sex, gid, gname, face, power,
		  max_power, lookid, rank, best_rank, time, avatar_id,
		  robot_unit, cont_win, face_update_time, face_file]},
		{sky_ladder_f_pos,
		 [pos, id, bid, lev, use_skin, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, is_robot]},
		{sky_ladder_f,
		 [id, name, gname, idx, lev, vip_lev, sex, face, power,
		  rank, formation_type, formation_lev, hallows_id,
		  pos_info, robot_id, avatar_id, look, face_update_time,
		  face_file]},
		{m_sky_ladder,
		 [ver, ref_time, combat_time, ref_list, best_rank,
		  can_combat_num, had_combat_num, buy_combat_num,
		  acc_combat_num, first_reward, next_reset_nine, worship,
		  worship_list, season_idx, merge_index, now_combat_num]},
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
		{role_online,
		 [id, pid, conn_pid, name, account, status, lev, sex,
		  realm, platform, channel, career, power, face_id,
		  face_file, face_update_time, socket, max_dun_id,
		  province_name, city_name]},
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
		{login,
		 [login_time, logout_time, prev_logout_time,
		  prev_login_time, log_login_time]},
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

-author("Zhao").

-export([set_game_set/2, get_game_set/1, name/1,
	 rand_name/1, check_name/1, rename/3, insert_name/2,
	 check_cd/1, check_cd/2, check_cd_with_end_time/1,
	 check_cd_with_end_time/2, calc_power/1, worship/3,
	 push_worship/1, push_cluster_worship/1,
	 push_peak_worship/1, worship_status/2, worship_status/3,
	 check_open_cond/2, get_city_name/1, get_backdrop/1,
	 def_backdrop/0, set_backdrop/2]).

-compile({inline, [{get_cd, 1}]}).

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

-file("src/mod/role/role_misc.erl", 43).

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

-file("src/mod/role/role_misc.erl", 44).

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

-file("src/mod/role/role_misc.erl", 45).

-file("inc/login.hrl", 1).

-record(login,
	{login_time = 0, logout_time = 0, prev_logout_time = 0,
	 prev_login_time = 0, log_login_time = 0}).

-file("src/mod/role/role_misc.erl", 46).

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

-file("src/mod/role/role_misc.erl", 47).

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

-file("src/mod/role/role_misc.erl", 48).

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

-file("src/mod/role/role_misc.erl", 49).

-file("inc/log.hrl", 1).

-file("src/mod/role/role_misc.erl", 50).

-file("inc/attr.hrl", 1).

-file("src/mod/role/role_misc.erl", 51).

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

-file("src/mod/role/role_misc.erl", 52).

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

-file("src/mod/role/role_misc.erl", 53).

-file("inc/role_online.hrl", 1).

-record(role_online,
	{id = {0, 0}, pid, conn_pid, name, account, status, lev,
	 sex, realm, platform, channel, career, power, face_id,
	 face_file = <<>>, face_update_time = 0, socket,
	 max_dun_id, province_name, city_name}).

-file("src/mod/role/role_misc.erl", 54).

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

-file("src/mod/role/role_misc.erl", 55).

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

-file("src/mod/role/role_misc.erl", 56).

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

-file("src/mod/role/role_misc.erl", 57).

-file("inc/sky_ladder.hrl", 1).

-record(m_sky_ladder,
	{ver = 2, ref_time = 0, combat_time = 0, ref_list = [],
	 best_rank = 0,
	 can_combat_num = sky_ladder_data:get_const(join_times),
	 had_combat_num = 0, buy_combat_num = 0,
	 acc_combat_num = 0, first_reward = [],
	 next_reset_nine = 0, worship = 0, worship_list = [],
	 season_idx = 0, merge_index = 0, now_combat_num = 0}).

-record(sky_ladder_f,
	{id = {0, <<>>}, name = <<>>, gname = <<>>, idx = 0,
	 lev = 0, vip_lev = 0, sex = 0, face = 0, power = 0,
	 rank = 0, formation_type = 0, formation_lev = 0,
	 hallows_id = 0, pos_info = [], robot_id = 0,
	 avatar_id = 0, look = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(sky_ladder_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, use_skin = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, is_robot = 0}).

-record(sky_ladder_role,
	{id = {0, <<>>}, name = <<>>, vip = 0, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, rank = 0, best_rank = 0,
	 time = 0, avatar_id = 0, robot_unit = 0, cont_win = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(sky_ladder_rank,
	{rank = 0, id = {0, <<>>}, is_fight = 0,
	 fight_rid = {0, <<>>}, fight_pid = 0}).

-record(sky_ladder_role_log,
	{id = {0, <<>>}, name = <<>>, face = 0, logs = [],
	 face_update_time = 0, face_file = <<>>}).

-record(sky_ladder_pk_log,
	{id = 0, rid = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, avatar_id = 0, power = 0, atk_power = 0,
	 enemy_old_rank = 0, old_rank = 0, type = 1, ret = 1,
	 replay_id = 0, rank_type = 0, rank = 0, time = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(sky_ladder_highlight,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_rank = 0, def_id = {0, <<>>},
	 def_name = <<>>, def_face = 0, def_rank = 0, ret = 1,
	 replay_id = 0, time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(sky_ladder_result,
	{result = 0, id = {0, <<>>}, def_name = <<>>,
	 def_lev = 0, def_face = 0, def_change_rank = 0,
	 def_rank = 0, def_old_rank = 0, is_change_best_rank = 0,
	 atk_change_rank = 0, atk_rank = 0, atk_old_rank = 0,
	 atk_cont_win = 0, reward = [], def_face_update_time = 0,
	 def_face_file = <<>>}).

-file("src/mod/role/role_misc.erl", 58).

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

-file("src/mod/role/role_misc.erl", 59).

-file("inc/arena_cluster.hrl", 1).

-record(m_arena_cluster,
	{ver = 1, ref_time = 0, formations = [], ref_list = [],
	 season_ref_time = 0, season_combat_num = 0,
	 best_rank = 0, day_combat_num = 0, acc_combat_num = 0,
	 day_reward = [], turn_card_reward = [],
	 turn_card_num = 0, turn_card_history = [], worship = 0,
	 worship_list = []}).

-record(arena_cluster_f,
	{id = {0, <<>>}, name = <<>>, gname = <<>>, idx = 0,
	 lev = 0, vip_lev = 0, sex = 0, face = 0, power = 0,
	 rank = 0, order_info = [], robot_id = 0, avatar_id = 0,
	 look = 0, ext = []}).

-record(arena_cluster_f_order,
	{order, formation_type = 1, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0, pos_info = [],
	 hallows_look_id = 0, hallows_lucky = 0,
	 hallows_seal = 0, hallows_all_look_ids = [], power = 0,
	 is_hidden = 0, extra = []}).

-record(arena_cluster_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0,
	 dower_skill = [], set_skill = [], attr, extra = []}).

-record(arena_cluster_rank,
	{rank = 0, id = {0, <<>>}, score = 0}).

-record(arena_cluster_role,
	{id = {0, <<>>}, name = <<>>, vip = 0, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, score = 0, rank = 0,
	 time = 0, avatar_id = 0, cont_win = 0, ext = []}).

-record(role_arena_cluster_log,
	{id = {0, <<>>}, list = []}).

-record(arena_cluster_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_lev = 0, atk_rank = 0, atk_score = 0,
	 def_id = {0, <<>>}, def_name = <<>>, def_face = 0,
	 def_lev = 0, def_rank = 0, def_score = 0, ret = 1,
	 win_count = 0, lose_count = 0, combat_type = 0,
	 replay_list = [], time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(arena_cluster_replay,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_cluster_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-record(arena_cluster_fight_lock,
	{id = {0, <<>>}, is_fight = 0, fight_rid = {0, <<>>},
	 fight_pid = 0}).

-file("src/mod/role/role_misc.erl", 60).

-file("inc/role_room.hrl", 1).

-record(m_room,
	{ver = 3, city_id = 0, fanse_list = [],
	 honor_badges = [], honor_point = 0, use_badges = [],
	 room_bbs_set = 1, room_bbs_num = 0}).

-record(m_room_feat,
	{ver = 1, flag = 0,
	 finish = []  :: [{pos_integer(), pos_integer()}],
	 doing = []  :: [tuple()],
	 overdue = []  :: [pos_integer()], ext = []}).

-record(m_room_grow,
	{ver = 1, finish = []  :: [pos_integer()],
	 doing = []  :: [tuple()], info = [], next_id = 1,
	 ext = []}).

-record(room_grow,
	{id = 0, order = 0, time = 0, arge = [], ext = []}).

-record(room_honor_badges, {id = 0, time = 0}).

-record(room_bbs_message,
	{id = {0, <<>>}, bbs_id = 0, bbs_type = 0,
	 reply_name = <<>>, reply_bbs_id = 0,
	 reply_id = {0, <<>>}, msg = <<>>, time = 0,
	 tar_id = {0, <<>>}, face_id = 0, avatar_id = 0, lev = 0,
	 sex = 0, name = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(room_bbs_message_below,
	{id = {0, <<>>}, role_id = {0, <<>>}, name = <<>>,
	 bbs_id = 0}).

-record(room_fans, {myid = {0, <<>>}, fid = {0, <<>>}}).

-record(room_fans_num, {id = {0, <<>>}, fans = 0}).

-record(room_rank_info,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 avatar_bid = 0, time = 0, fans_num = 0, rank = 0,
	 look_id = 0, face_update_time = 0, face_file = <<>>}).

-file("src/mod/role/role_misc.erl", 61).

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

-file("src/mod/role/role_misc.erl", 62).

-file("inc/home_pet.hrl", 1).

-record(m_home_pet,
	{ver = 6, name = <<>>, id = 0, rename_count = 0,
	 state = 0, calc_time = 0, start_time = 0, end_time = 0,
	 vigor = 0, vigor_time = 0, set_item = [],
	 next_evt_id = 1, city = 0, evt_list = [], do_evts = [],
	 acc_evts = [], fire_time = 0, acc_out_time = 0,
	 acc_out_count = 0, acc_items = [], photos = [],
	 diarys = [], day_talk = 0, day_feed = 0,
	 photos_next_id = 1, diarys_next_id = 1,
	 photos_had = []}).

-file("src/mod/role/role_misc.erl", 63).

-file("inc/recruit.hrl", 1).

-record(m_recruit,
	{ver = 7, free_cd_end = 0, list = [], convert_list = [],
	 convert_state = [], holiday_list = [],
	 holy_eqm_lottery = [], logs = [],
	 holiday_sprite_lottery_list = [], lucky_sprites = [],
	 lucky_holy_eqm = [], all_score = 0}).

-record(m_recruit_award, {ver = 1, list = []}).

-record(recruit_info,
	{group_id = 0, stats = #{}, ext = #{}}).

-record(holiday_info,
	{camp_id = 0, stats = #{}, ext = #{}}).

-record(recruit_limit, {key, info = #{}}).

-file("src/mod/role/role_misc.erl", 64).

-file("inc/guild_skill.hrl", 1).

-record(m_guild_skill,
	{ver = 2  :: pos_integer(), groups = []  :: list(),
	 break_groups = []  :: list()}).

-record(guild_skill_group,
	{ver = 1, career = 0, group_id = 0, skill_ids = [],
	 group_ids = []}).

-record(guild_skill_break_group,
	{ver = 1  :: pos_integer(),
	 career = 0  :: pos_integer(),
	 attr_formation = []  :: list(),
	 skill_formation = {0, 0}  :: tuple(),
	 ext = []  :: list()}).

-file("src/mod/role/role_misc.erl", 65).

set_game_set(Role = #role{}, Code) ->
    {ok, Role#role{game_set = Code}, Code}.

get_game_set(#role{game_set = GameSet}) ->
    util:if_undefined(GameSet, 0).

-spec name(bitstring()) -> bitstring().

name(<<"【R"/utf8, _/binary>>) ->
    lang:get(<<"召唤师"/utf8>>);
name(Name) -> Name.

-spec rand_name(Rid :: integer()) -> bitstring().

rand_name(Rid) -> do_rand_name(0, Rid).

do_rand_name(3, Rid) ->
    util:fbin(<<"【R~w"/utf8>>, [Rid]);
do_rand_name(N, Rid) ->
    Name1 = util:rand_list(random_name_data:list(1)),
    Name2 = util:rand_list(random_name_data:list(2)),
    Name3 = util:rand_list(random_name_data:list(3)),
    Name = <<Name1/binary, Name2/binary, Name3/binary>>,
    case check_name_used(Name) of
      {ok, NewName} -> NewName;
      _ -> do_rand_name(N + 1, Rid)
    end.

check_name(<<"【"/utf8, _Bin/binary>>) ->
    {error, lang:get(<<"名字不合法"/utf8>>)};
check_name(Name) ->
    Name1 = case
	      is_binary([string_util:trim(binary_to_list(Name))])
		of
	      false ->
		  list_to_binary([string_util:trim(binary_to_list(Name))]);
	      true -> [string_util:trim(binary_to_list(Name))]
	    end,
    NLen = string_util:name_width(Name1),
    if NLen < 4 orelse NLen > 12 ->
	   {error, lang:get(<<"名字长度为2~6个汉字"/utf8>>)};
       true ->
	   case keyword:check(name, Name1) of
	     false -> {error, lang:get(<<"名字不合法"/utf8>>)};
	     true -> check_name_used(Name1)
	   end
    end.

check_name_used(Name) ->
    case db:get_one("SELECT COUNT(*) FROM role WHERE name "
		    "= ?",
		    [Name])
	of
      {error, _} -> {error, lang:get(<<"检查名字存在失败1"/utf8>>)};
      {ok, Num} when Num > 0 ->
	  {error, lang:get(<<"角色名已存在"/utf8>>)};
      {ok, _} ->
	  case
	    db:get_one("SELECT COUNT(*) FROM mod_old_name WHERE "
		       "name = ?",
		       [Name])
	      of
	    {error, _} -> {error, lang:get(<<"检查名字存在失败2"/utf8>>)};
	    {ok, Num} when Num > 0 ->
		{error, lang:get(<<"角色名已存在"/utf8>>)};
	    {ok, _} -> {ok, Name}
	  end
    end.

-spec rename(#role{}, bitstring(),
	     Sex :: non_neg_integer()) -> {error, bitstring()} |
					  {ok, #role{}}.

rename(#role{name = Name, sex = Sex}, Name, Sex) ->
    {error, lang:get(<<"角色信息没有变化"/utf8>>)};
rename(_Role, <<"【"/utf8, _Bin/binary>>, _Sex) ->
    {error, lang:get(<<"名字不合法"/utf8>>)};
rename(Role = #role{name = Name}, Name, Sex) ->
    do_rename(Role, Name, Sex);
rename(Role, Name, Sex) ->
    case check_name(Name) of
      {error, Reason} -> {error, Reason};
      {ok, Name1} -> do_rename(Role, Name1, Sex)
    end.

do_rename(Role = #role{s_name = SName}, Name, Sex)
    when SName < 2 ->
    case insert_name(Name, Role, Sex) of
      {error, Msg} -> {error, Msg};
      {ok, NRole} ->
	  NRole1 = NRole#role{face_id =
				  role_face:def_face(NRole)},
	  NRole2 = role_looks:init(NRole1),
	  NRole3 = partner:init_role_partner(NRole2),
	  NRole4 = formation_lib:get_info(NRole3#role{m_formation
							  =
							  formation_lib:init(NRole3)}),
	  role_lib:push_base_info(NRole4),
	  {ok, NRole4}
    end;
do_rename(Role = #role{s_name = 2, sex = Sex}, Name,
	  _Sex) ->
    case sys_env:get(sys_ban_rename, false) of
      true -> {error, lang:get(<<"功能维护中，暂时关闭，请谅解"/utf8>>)};
      _ ->
	  case insert_name(Name, Role, Sex) of
	    {error, Msg} -> {error, Msg};
	    {ok, NRole} ->
		notice:alert(lang:get(<<"改名成功"/utf8>>)), {ok, NRole}
	  end
    end;
do_rename(Role = #role{name = <<"【"/utf8, _Bin/binary>>,
		       sex = Sex},
	  Name, _Sex) ->
    case sys_env:get(sys_ban_rename, false) of
      true -> {error, lang:get(<<"功能维护中，暂时关闭，请谅解"/utf8>>)};
      _ ->
	  case insert_name(Name, Role, Sex) of
	    {error, Msg} -> {error, Msg};
	    {ok, NRole} ->
		notice:alert(lang:get(<<"改名成功"/utf8>>)), {ok, NRole}
	  end
    end;
do_rename(Role = #role{sex = Sex}, Name, _Sex) ->
    case sys_env:get(sys_ban_rename, false) of
      true -> {error, lang:get(<<"功能维护中，暂时关闭，请谅解"/utf8>>)};
      _ ->
	  case role_gain:do(Role,
			    [#loss{label = gold, val = 200}])
	      of
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {ok, Role1} ->
		case insert_name(Name, Role1, Sex) of
		  {error, Msg} -> {error, Msg};
		  {ok, NRole} ->
		      notice:alert(lang:get(<<"改名成功"/utf8>>)), {ok, NRole}
		end
	  end
    end.

get_backdrop(#role{backdrop_list = FaceList,
		   m_home_pet = #m_home_pet{photos_had = Photos}}) ->
    [def_backdrop() | FaceList] ++ [IdT || IdT <- Photos].

def_backdrop() -> 0.

set_backdrop(Role = #role{backdrop_id = BackdropId},
	     BackdropId) ->
    {ok, Role};
set_backdrop(Role, BackdropId) ->
    case lists:member(BackdropId, get_backdrop(Role)) of
      true ->
	  NRole = Role#role{backdrop_id = BackdropId},
	  role_robot:sync_role(NRole),
	  {ok, NRole};
      false -> {error, lang:get(<<"空间背景设置失败"/utf8>>)}
    end.

insert_name(Name, Role = #role{sex = Sex}) ->
    insert_name(Name, Role, Sex).

insert_name(Name,
	    Role = #role{account = Account, name = OldName,
			 id = {Rid, SrvId}, s_name = SName, login = Login},
	    Sex) ->
    Now = date:unixtime(),
    Sql = "update `role` set `name` = ?, sex=?, "
	  "login_time=? where rid=? and srv_id=?;",
    case db:execute(Sql, [Name, Sex, Now, Rid, SrvId]) of
      {error, _} -> {error, lang:get(<<"该名称已被使用"/utf8>>)};
      {ok, 0} -> {error, lang:get(<<"更改失败"/utf8>>)};
      {ok, _} ->
	  NRole = role_trigger:fire(#evt_name{},
				    Role#role{name = Name, sex = Sex,
					      s_name = max(1, SName) + 1,
					      login =
						  Login#login{log_login_time =
								  Now}}),
	  case OldName of
	    <<"【"/utf8, _/binary>> -> skip;
	    Name -> skip;
	    _ ->
		db:insert("insert into mod_old_name (name,rid,srv_id,cti"
			  "me) values(?,?,?,?)",
			  [OldName, Rid, SrvId, Now])
	  end,
	  big_world_lib:cast(center_all, d_ets_lib, save_d_ets,
			     [invite_code_acc, {Account, 1}]),
	  friend:save_info(NRole),
	  invite_code:sync_info(NRole),
	  guild_member:update(NRole, sync),
	  arena_mgr:sync_role(NRole, all),
	  role_match:update(NRole),
	  ets:delete(role_name_index, OldName),
	  role_query:sync_cache(NRole),
	  role_query:sync_index(NRole),
	  log:save(login, {NRole}),
	  arena_champion_mgr:sync_role(NRole, all),
	  endless_employ:sync(NRole),
	  sky_ladder_mgr:sync_role(NRole, all),
	  primus:sync_role(NRole),
	  role_robot:sync_role(NRole),
	  role_data:sync_reg(NRole),
	  rank_listener:update_val(name, {Rid, SrvId}, Name),
	  {ok, NRole}
    end.

-spec push_worship(#role{}) -> ok.

push_worship(#role{id = RoleId}) ->
    Worship = var:get_role_var(RoleId, other, 1, 0),
    sys_conn:pack_send(10317, {Worship}),
    ok.

-spec push_cluster_worship(#role{}) -> ok.

push_cluster_worship(#role{id = RoleId}) ->
    Worship = var:get_role_var(RoleId, other, 15, 0),
    sys_conn:pack_send(10319, {Worship}),
    ok.

-spec push_peak_worship(#role{}) -> ok.

push_peak_worship(#role{id = RoleId}) ->
    Worship = var:get_role_var(RoleId, other, 18, 0),
    sys_conn:pack_send(10320, {Worship}),
    ok.

-spec worship_status(#role{}, role_id()) -> 0..1.

worship_status(Role, TarRoleId) ->
    {Num, RL} = var:get_var(Role, five, 557, {0, []}),
    case lists:member(TarRoleId, RL) of
      false when Num < 10 -> 0;
      _ -> 1
    end.

-spec worship_status(#role{}, role_id(),
		     pos_integer()) -> 0..1.

worship_status(Role, TarRoleId, 2) ->
    {Num, RL} = var:get_var(Role, five, 588, {0, []}),
    case lists:member(TarRoleId, RL) of
      false when Num < 10 -> 0;
      _ -> 1
    end;
worship_status(#role{m_arena_cluster =
			 #m_arena_cluster{worship = Num, worship_list = RL}},
	       TarRoleId, 4) ->
    case lists:member(TarRoleId, RL) of
      false when Num < 3 -> 0;
      _ -> 1
    end;
worship_status(#role{m_sky_ladder =
			 #m_sky_ladder{worship = Num, worship_list = RL}},
	       TarRoleId, 3) ->
    case lists:member(TarRoleId, RL) of
      false when Num < 3 -> 0;
      _ -> 1
    end;
worship_status(Role, TarRoleId, 6) ->
    {Num, RL} = var:get_var(Role, five, 598, {0, []}),
    Max = arena_cluster_champion_data:get_const(like_max),
    case lists:member(TarRoleId, RL) of
      false when Num < Max -> 0;
      _ -> 1
    end;
worship_status(Role, TarRoleId, 8) ->
    {Num, RL} = var:get_var(Role, five, 599, {0, []}),
    Max = arena_peak_champion_data:get_constant(like_max),
    case lists:member(TarRoleId, RL) of
      false when Num < Max -> 0;
      _ -> 1
    end;
worship_status(#role{m_home =
			 #m_home{worship = Num, worship_list = RL}},
	       TarRoleId, 5) ->
    Limit = home_data:get_const(day_praise_limit),
    case lists:member(TarRoleId, RL) of
      false when Num < Limit -> 0;
      _ -> 1
    end;
worship_status(Role, TarRoleId, 7) ->
    {Num, RL} = var:get_var(Role, day, 108, {0, []}),
    Max = monopoly_dungeons_data:get_const(day_worship_max),
    case lists:member(TarRoleId, RL) of
      false when Num < Max -> 0;
      _ -> 1
    end.

-spec worship(#role{}, non_neg_integer(),
	      role_id()) -> {ok, #role{}} | {false, binary()}.

worship(Role = #role{id = RoleId, name = RoleName,
		     m_sky_ladder =
			 MSkyLadder = #m_sky_ladder{worship = Num,
						    worship_list = RL}},
	3, TarRoleId = {_, SrvId}) ->
    Max = 3,
    case lists:member(TarRoleId, RL) of
      true ->
	  {false, lang:get(<<"Đã thích người chơi này"/utf8>>)};
      _ when Num >= Max ->
	  {false,
	   util:fbin(lang:get(<<"Bạn chỉ có thể thích những chiến binh "
				"mỗi ngày~wHạng hai，Xin hãy quay lại "
				"vào ngày mai！"/utf8>>),
		     [Max])};
      _ ->
	  case check_worship_target_(TarRoleId) of
	    {false, Reason} -> {false, Reason};
	    true ->
		GL =
		    format:val_to_gain(sky_ladder_data:get_const(worship_reward),
				       worship),
		case role_gain:do(Role, GL) of
		  {ok, NRole} ->
		      log:log_gain(GL, Role, NRole, <<"点赞"/utf8>>,
				   util:fbin("天梯点赞 ~w", [TarRoleId])),
		      Msg1 = format:gain_text(GL, NRole),
		      notice:alert(NRole,
				   color:msg(lang:get(<<"Thích thành công，~ts"/utf8>>),
					     [Msg1])),
		      cluster_lib:cast(SrvId, var, acc_role_var,
				       [TarRoleId, other, 5, 0]),
		      Role1 = NRole#role{m_sky_ladder =
					     MSkyLadder#m_sky_ladder{worship =
									 Num +
									   1,
								     worship_list
									 =
									 [TarRoleId
									  | RL]}},
		      case RoleId =/= TarRoleId of
			true ->
			    notice:alert(TarRoleId,
					 util:fbin(lang:get(<<"~tsTôi thích bạn trong thang máy chủ "
							      "liên server！"/utf8>>),
						   [color:format({name, RoleId,
								  RoleName})]));
			_ -> skip
		      end,
		      {ok, Role1};
		  _ -> {false, lang:get(<<"Thích thất bại"/utf8>>)}
		end
	  end
    end;
worship(Role = #role{id = RoleId, name = RoleName,
		     m_arena_cluster =
			 MArenaCluster = #m_arena_cluster{worship = Num,
							  worship_list = RL}},
	4, TarRoleId = {_, SrvId}) ->
    Max = 3,
    case lists:member(TarRoleId, RL) of
      true ->
	  {false, lang:get(<<"Đã thích người chơi này"/utf8>>)};
      _ when Num >= Max ->
	  {false,
	   util:fbin(lang:get(<<"Bạn chỉ có thể thích những người chơi "
				"mỗi ngày~wHạng hai，Xin hãy quay lại "
				"vào ngày mai！"/utf8>>),
		     [Max])};
      _ ->
	  case check_worship_target_(TarRoleId) of
	    {false, Reason} -> {false, Reason};
	    true ->
		GL =
		    format:val_to_gain([arena_cluster_data:get_const(like_reward)],
				       worship),
		case role_gain:do(Role, GL) of
		  {ok, NRole} ->
		      log:log_gain(GL, Role, NRole, <<"点赞"/utf8>>,
				   util:fbin("跨服竞技场点赞 ~w", [TarRoleId])),
		      Msg1 = format:gain_text(GL, NRole),
		      notice:alert(NRole,
				   color:msg(lang:get(<<"Thích thành công，~ts"/utf8>>),
					     [Msg1])),
		      cluster_lib:cast(SrvId, var, acc_role_var,
				       [TarRoleId, other, 8, 0]),
		      Role1 = NRole#role{m_arena_cluster =
					     MArenaCluster#m_arena_cluster{worship
									       =
									       Num
										 +
										 1,
									   worship_list
									       =
									       [TarRoleId
										| RL]}},
		      case RoleId =/= TarRoleId of
			true ->
			    notice:alert(TarRoleId,
					 util:fbin(lang:get(<<"~tsTôi đã thích bạn trong đấu trường "
							      "liên máy chủ！"/utf8>>),
						   [color:format({name, RoleId,
								  RoleName})]));
			_ -> skip
		      end,
		      arena_cluster:push_red_point(Role1),
		      {ok, Role1};
		  _ -> {false, lang:get(<<"Thích thất bại"/utf8>>)}
		end
	  end
    end;
worship(Role = #role{}, 7, TarRoleId) ->
    {Num, RL} = var:get_var(Role, day, 108, {0, []}),
    Max = arena_cluster_champion_data:get_const(like_max),
    case lists:member(TarRoleId, RL) of
      true ->
	  {false, lang:get(<<"Đã thích người chơi này"/utf8>>)};
      _ when Num >= Max ->
	  {false,
	   lang:get(<<"Số lượt thích hôm nay đã đạt đến giới "
		      "hạn!"/utf8>>)};
      _ ->
	  case check_worship_target_(TarRoleId) of
	    {false, Reason} -> {false, Reason};
	    true ->
		GL =
		    format:val_to_gain(monopoly_dungeons_data:get_const(worship_reward),
				       worship),
		case role_gain:do(Role, GL) of
		  {ok, NRole} ->
		      cluster_lib:cast(element(2, TarRoleId), var,
				       acc_role_var, [TarRoleId, other, 17, 0]),
		      log:log_gain(GL, Role, NRole, <<"点赞"/utf8>>,
				   util:fbin("圣夜奇境boss排行榜点赞 ~w", [TarRoleId])),
		      Msg1 = format:gain_text(GL, NRole),
		      notice:alert(NRole,
				   color:msg(lang:get(<<"Thích thành công，~ts"/utf8>>),
					     [Msg1])),
		      Role1 = var:set_var(NRole, day, 108,
					  {Num + 1, [TarRoleId | RL]}),
		      {ok, Role1};
		  _ -> {false, lang:get(<<"Thích thất bại"/utf8>>)}
		end
	  end
    end;
worship(#role{id = RoleId}, _Type, RoleId) ->
    {false,
     lang:get(<<"Không thể thích chính mình"/utf8>>)};
worship(Role = #role{id = RoleId, name = RoleName}, 1,
	TarRoleId) ->
    {Num, RL} = var:get_var(Role, five, 586, {0, []}),
    Max = zs_war_data:get_const(like_times),
    case lists:member(TarRoleId, RL) of
      true ->
	  {false, lang:get(<<"Đã thích người chơi này"/utf8>>)};
      _ when Num >= Max ->
	  {false,
	   lang:get(<<"Số lượng thích hôm nay đã đạt đến giới "
		      "hạn!"/utf8>>)};
      _ ->
	  case check_worship_target_(TarRoleId) of
	    {false, Reason} -> {false, Reason};
	    true ->
		GL =
		    format:val_to_gain(zs_war_data:get_const(like_reward),
				       worship),
		case role_gain:do(Role, GL) of
		  {ok, NRole} ->
		      log:log_gain(GL, Role, NRole, <<"点赞"/utf8>>,
				   util:fbin("众神战场点赞 ~w", [TarRoleId])),
		      Msg1 = format:gain_text(GL, NRole),
		      notice:alert(NRole,
				   color:msg(lang:get(<<"Thích thành công，~ts"/utf8>>),
					     [Msg1])),
		      cluster_lib:cast(element(2, TarRoleId), var,
				       acc_role_var, [TarRoleId, other, 1, 0]),
		      Role1 = var:set_var(NRole, five, 586,
					  {Num + 1, [TarRoleId | RL]}),
		      role_lib:cast(by_id, TarRoleId,
				    {fun (R) ->
					     push_worship(R),
					     case var:get_var(R, five, 587) >=
						    10
						 of
					       true ->
						   notice:alert(R,
								util:fbin(lang:get(<<"~tsXin chúc mừng thành tích của bạn "
										     "trên bảng xếp hạng Gods Battlegrounds！"/utf8>>),
									  [color:format({name,
											 RoleId,
											 RoleName})])),
						   ok;
					       _ ->
						   GL2 =
						       format:val_to_gain(zs_war_data:get_const(liked_reward),
									  worship),
						   case role_gain:do(R, GL2) of
						     {ok, NR} ->
							 log:log_gain(GL, R, NR,
								      <<"点赞"/utf8>>,
								      util:fbin("众神战场被点赞 ~w",
										[RoleId])),
							 Msg2 =
							     format:gain_text(GL2,
									      NR),
							 notice:alert(NR,
								      color:msg(lang:get(<<"Người chơi~tsThích cho bạn，~ts"/utf8>>),
										[{name,
										  RoleId,
										  RoleName},
										 Msg2])),
							 R1 = var:acc_var(NR,
									  five,
									  587),
							 {ok, R1};
						     _ -> {ok, R}
						   end
					     end
				     end}),
		      {ok, Role1};
		  _ -> {false, lang:get(<<"Thích thất bại"/utf8>>)}
		end
	  end
    end;
worship(Role = #role{id = RoleId, name = RoleName,
		     m_home =
			 MHome = #m_home{worship = Num, worship_list = RL}},
	5, TarRoleId = {_, SrvId}) ->
    Max = home_data:get_const(day_praise_limit),
    case lists:member(TarRoleId, RL) of
      true ->
	  {false,
	   lang:get(<<"Ngôi nhà này đã được yêu thích ngày "
		      "hôm nay"/utf8>>)};
      _ when Num >= Max ->
	  {false,
	   util:fbin(lang:get(<<"Chỉ được phép thích mỗi ngày~wHạng hai，Xin "
				"hãy quay lại vào ngày mai！"/utf8>>),
		     [Max])};
      _ ->
	  case check_worship_target_(TarRoleId) of
	    {false, Reason} -> {false, Reason};
	    true ->
		IsFriend = friend_lib:is_friend(Role, TarRoleId),
		Gain = util:if_true(IsFriend,
				    home_data:get_const(friends_praise_reward),
				    home_data:get_const(normal_praise_reward)),
		GL = format:val_to_gain(Gain, worship),
		case role_gain:do(Role, GL) of
		  {ok, Role2} ->
		      TarWorship = var:get_role_var_cluster(TarRoleId, other,
							    11, 0),
		      cluster_lib:cast(SrvId, var, acc_role_var,
				       [TarRoleId, other, 11, 0]),
		      cluster_lib:cast(SrvId, home_mgr, info,
				       [{update_rank, TarRoleId, worship}]),
		      NRole = role_trigger:fire(#evt_worship{type = 5},
						Role2),
		      log:log_gain(GL, Role, NRole, <<"点赞"/utf8>>,
				   util:fbin("家园点赞 ~w", [TarRoleId])),
		      Msg1 = format:gain_text(GL, NRole),
		      notice:alert(NRole,
				   color:msg(lang:get(<<"Thích thành công，~ts"/utf8>>),
					     [Msg1])),
		      notice:alert(TarRoleId,
				   util:fbin(lang:get(<<"~tsThích ngôi nhà của bạn"/utf8>>),
					     [color:format({name, RoleId,
							    RoleName})])),
		      Role1 = NRole#role{m_home =
					     MHome#m_home{worship = Num + 1,
							  worship_list =
							      [TarRoleId
							       | RL]}},
		      home:push_change_data(Role1),
		      role:pack_send(TarRoleId, 26012, {TarWorship + 1}),
		      {ok, Role1};
		  _ -> {false, lang:get(<<"Thích thất bại"/utf8>>)}
		end
	  end
    end;
worship(Role = #role{}, 2, TarRoleId) ->
    {Num, RL} = var:get_var(Role, five, 588, {0, []}),
    Max = guild_dun_data:const(praise_time),
    case lists:member(TarRoleId, RL) of
      true ->
	  {false, lang:get(<<"Đã thích người chơi này"/utf8>>)};
      _ when Num >= Max ->
	  {false,
	   util:fbin(lang:get(<<"Bạn chỉ có thể thích những người chơi "
				"mỗi ngày~wHạng hai，Xin hãy quay lại "
				"vào ngày mai！"/utf8>>),
		     [Max])};
      _ ->
	  case check_worship_target_(TarRoleId) of
	    {false, Reason} -> {false, Reason};
	    true ->
		GL =
		    format:val_to_gain(guild_dun_data:const(praise_reward),
				       worship),
		case role_gain:do(Role, GL) of
		  {ok, NRole} ->
		      log:log_gain(GL, Role, NRole, <<"点赞"/utf8>>,
				   util:fbin("联盟副本点赞 ~w", [TarRoleId])),
		      Msg1 = format:gain_text(GL, NRole),
		      notice:alert(NRole,
				   color:msg(lang:get(<<"Thích thành công，~ts"/utf8>>),
					     [Msg1])),
		      cluster_lib:cast(element(2, TarRoleId), var,
				       acc_role_var, [TarRoleId, other, 4, 0]),
		      Role1 = var:set_var(NRole, five, 588,
					  {Num + 1, [TarRoleId | RL]}),
		      {ok, Role1};
		  _ -> {false, lang:get(<<"Thích thất bại"/utf8>>)}
		end
	  end
    end;
worship(Role = #role{}, 6, TarRoleId) ->
    {Num, RL} = var:get_var(Role, five, 598, {0, []}),
    Max = arena_cluster_champion_data:get_const(like_max),
    case lists:member(TarRoleId, RL) of
      true ->
	  {false, lang:get(<<"Đã thích người chơi này"/utf8>>)};
      _ when Num >= Max ->
	  {false,
	   lang:get(<<"Số lượng thích hôm nay đã đạt đến giới "
		      "hạn!"/utf8>>)};
      _ ->
	  case check_worship_target_(TarRoleId) of
	    {false, Reason} -> {false, Reason};
	    true ->
		GL =
		    format:val_to_gain(arena_cluster_champion_data:get_const(like_reward),
				       worship),
		case role_gain:do(Role, GL) of
		  {ok, NRole} ->
		      cluster_lib:cast(element(2, TarRoleId), var,
				       acc_role_var, [TarRoleId, other, 15, 0]),
		      log:log_gain(GL, Role, NRole, <<"点赞"/utf8>>,
				   util:fbin("周冠军赛点赞 ~w", [TarRoleId])),
		      Msg1 = format:gain_text(GL, NRole),
		      notice:alert(NRole,
				   color:msg(lang:get(<<"Thích thành công，~ts"/utf8>>),
					     [Msg1])),
		      Role1 = var:set_var(NRole, five, 598,
					  {Num + 1, [TarRoleId | RL]}),
		      NRole2 = role_trigger:fire(#evt_worship{type = 6},
						 Role1),
		      {ok, NRole2};
		  _ -> {false, lang:get(<<"Thích thất bại"/utf8>>)}
		end
	  end
    end;
worship(Role = #role{}, 8, TarRoleId) ->
    {Num, RL} = var:get_var(Role, five, 599, {0, []}),
    Max = arena_peak_champion_data:get_constant(like_max),
    case lists:member(TarRoleId, RL) of
      true ->
	  {false, lang:get(<<"Đã thích người chơi này"/utf8>>)};
      _ when Num >= Max ->
	  {false,
	   lang:get(<<"Số lượng thích hôm nay đã đạt đến giới "
		      "hạn!"/utf8>>)};
      _ ->
	  case check_worship_target_(TarRoleId) of
	    {false, Reason} -> {false, Reason};
	    true ->
		GL =
		    format:val_to_gain(arena_peak_champion_data:get_constant(like_reward),
				       worship),
		case role_gain:do(Role, GL) of
		  {ok, NRole} ->
		      cluster_lib:cast(element(2, TarRoleId), var,
				       acc_role_var, [TarRoleId, other, 18, 0]),
		      log:log_gain(GL, Role, NRole, <<"点赞"/utf8>>,
				   util:fbin("周冠军赛点赞 ~w", [TarRoleId])),
		      Msg1 = format:gain_text(GL, NRole),
		      notice:alert(NRole,
				   color:msg(lang:get(<<"Thích thành công，~ts"/utf8>>),
					     [Msg1])),
		      Role1 = var:set_var(NRole, five, 599,
					  {Num + 1, [TarRoleId | RL]}),
		      NRole2 = role_trigger:fire(#evt_worship{type = 8},
						 Role1),
		      {ok, NRole2};
		  _ -> {false, lang:get(<<"Thích thất bại"/utf8>>)}
		end
	  end
    end;
worship(Role = #role{id = RoleId, name = RoleName},
	_Type, TarRoleId) ->
    {Num, RL} = var:get_var(Role, five, 557, {0, []}),
    case lists:member(TarRoleId, RL) of
      true ->
	  {false, lang:get(<<"Đã thích người chơi này"/utf8>>)};
      _ when Num >= 10 ->
	  {false,
	   lang:get(<<"Số lượng thích hôm nay đã đạt đến giới "
		      "hạn!"/utf8>>)};
      _ ->
	  case check_worship_target_(TarRoleId) of
	    {false, Reason} -> {false, Reason};
	    true ->
		GL = [#gain{label = coin, val = 3000}],
		case role_gain:do(Role, GL) of
		  {ok, NRole} ->
		      log:log_gain(GL, Role, NRole, <<"点赞"/utf8>>,
				   util:fbin("竞技场点赞 ~w", [TarRoleId])),
		      Msg1 = format:gain_text([#gain{label = coin,
						     val = 3000}],
					      NRole),
		      notice:alert(NRole,
				   color:msg(lang:get(<<"Thích thành công，~ts"/utf8>>),
					     [Msg1])),
		      notice:alert(TarRoleId,
				   util:fbin(lang:get(<<"~tsChúc mừng vì thành tích của bạn trên "
							"bảng xếp hạng Arena！"/utf8>>),
					     [color:format({name, RoleId,
							    RoleName})])),
		      cluster_lib:cast(element(2, TarRoleId), room_feat_mgr,
				       info,
				       [{arena_worship_do_feat, TarRoleId,
					 RoleName, Num + 1}]),
		      role_lib:cast(by_id, TarRoleId,
				    {role_misc, push_worship, []}),
		      cluster_lib:cast(element(2, TarRoleId), var,
				       acc_role_var, [TarRoleId, other, 1, 0]),
		      Role1 = var:set_var(NRole, five, 557,
					  {Num + 1, [TarRoleId | RL]}),
		      {ok, Role1};
		  _ -> {false, lang:get(<<"Thích thất bại"/utf8>>)}
		end
	  end
    end.

check_worship_target_(_) -> true.

-spec calc_power(#role{}) -> {ok, #role{}}.

calc_power(Role = #role{pid = RolePid, lev = RoleLev,
			type = Type, power = OldPower, max_power = MaxPower,
			max_power_time = MaxPowerTime,
			arena_max_power = ArenaMaxPower,
			arena_max_power_time = ArenaMaxPowerTime,
			arena_elite_power = ArenaEliteMaxPower,
			arena_elite_max_star = OldArenaEliteStar,
			arena_elite_power_time = ArenaEliteMaxPowerTime}) ->
    Now = date:unixtime(),
    ArenaPower = formation:get_sys_formation_power(Role, 1),
    Role1 = case ArenaPower >= ArenaMaxPower of
	      true ->
		  Role#role{arena_power = ArenaPower,
			    arena_max_power = ArenaPower,
			    arena_max_power_time = Now};
	      _ -> Role#role{arena_power = ArenaPower}
	    end,
    ArenaElitePower =
	arena_elite_lib:get_sys_formation_power(Role1),
    ArenaEliteStar =
	arena_elite_lib:get_sys_formation_star(Role1),
    Role2T = case MaxPower > ArenaEliteMaxPower + 2000000 of
	       true ->
		   case {whereis(lager_event), whereis(lager_event),
			 lager_config:get({lager_event, loglevel}, {0, []})}
		       of
		     {undefined, undefined, _} ->
			 fun () -> {error, lager_not_running} end();
		     {undefined, _, _} ->
			 fun () -> {error, {sink_not_configured, lager_event}}
			 end();
		     {__Pidrole_misc668, _,
		      {__Levelrole_misc668, __Tracesrole_misc668}}
			 when __Levelrole_misc668 band 64 /= 0 orelse
				__Tracesrole_misc668 /= [] ->
			 lager:do_log(info,
				      [{module, role_misc},
				       {function, calc_power}, {line, 668},
				       {pid, pid_to_list(self())},
				       {node, node()}
				       | lager:md()],
				      io_lib:format("[~ts] ~w修复战力刷新漏洞，角色最大战力为~w, 阵容战力为~w",
						    [Role#role.name,
						     Role#role.id, MaxPower,
						     {ArenaElitePower,
						      ArenaEliteMaxPower}]),
				      none, 4096, 64, __Levelrole_misc668,
				      __Tracesrole_misc668, lager_event,
				      __Pidrole_misc668);
		     _ -> ok
		   end,
		   Role1#role{arena_elite_power = MaxPower,
			      arena_elite_power_time = Now};
	       _ when ArenaElitePower >= ArenaEliteMaxPower ->
		   Role1#role{arena_elite_power = ArenaElitePower,
			      arena_elite_power_time = Now};
	       _ -> Role1
	     end,
    #formation_lineup{pos_info = PosInfo} =
	formation_lib:query_formation_info(Role),
    PIds = [PId || #formation_pos{id = PId} <- PosInfo],
    Power = partner_lib:get_power(Role, PIds),
    PowerStar = partner_lib:get_partner_star(Role, PIds),
    Role2 = case ArenaEliteStar > OldArenaEliteStar orelse
		   ArenaEliteStar > 55
		of
	      true ->
		  Role2T#role{arena_elite_max_star = ArenaEliteStar};
	      _
		  when MaxPower > 2000000 andalso
			 OldArenaEliteStar < 50 ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidrole_misc683, _,
		     {__Levelrole_misc683, __Tracesrole_misc683}}
			when __Levelrole_misc683 band 64 /= 0 orelse
			       __Tracesrole_misc683 /= [] ->
			lager:do_log(info,
				     [{module, role_misc},
				      {function, calc_power}, {line, 683},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("[~ts] ~w修复战力刷新漏洞，角色最大战力为~w, 阵容星数为~w",
						   [Role#role.name,
						    Role#role.id, MaxPower,
						    {OldArenaEliteStar,
						     ArenaEliteStar}]),
				     none, 4096, 64, __Levelrole_misc683,
				     __Tracesrole_misc683, lager_event,
				     __Pidrole_misc683);
		    _ -> ok
		  end,
		  Role2T#role{arena_elite_max_star = PowerStar};
	      _ -> Role2T
	    end,
    NewRole = #role{max_power = NewMaxPower} = case Power >=
						      MaxPower
						   of
						 true ->
						     Role2Temp =
							 Role2#role{power =
									Power,
								    max_power =
									Power,
								    max_power_time
									= Now},
						     BestStr =
							 partner_lib:get_partner_formations(PIds,
											    Role2Temp,
											    <<>>),
						     put(role_power_log_sub,
							 true),
						     var:set_var(Role2Temp,
								 other, 3054,
								 BestStr);
						 _ -> Role2#role{power = Power}
					       end,
    arena_team_member:update_member(NewRole, check_power),
    case Power =/= OldPower andalso is_pid(RolePid) of
      true ->
	  role:pack_send(Role, 10306, {Power, NewMaxPower}),
	  power_gift:fire(NewRole, MaxPower),
	  rank_listener:handle(power, NewRole, 1),
	  role_trigger:async_fire(RolePid,
				  [#evt_power{},
				   #r_evt_power{power = NewMaxPower,
						cache =
						    #{power_number =>
							  NewMaxPower}}]);
      _ -> pass
    end,
    NewRole2 = case Type == robot of
		 true -> NewRole;
		 _ ->
		     role_robot:sync_role(NewRole),
		     case var:get_var(NewRole, other, 3087, 0) of
		       0 when RoleLev >= 15 ->
			   log:save(role_power_info, {NewRole}),
			   var:set_var(NewRole, other, 3087, 1);
		       _ -> NewRole
		     end
	       end,
    {ok, NewRole2}.

-spec check_cd(CmdName :: atom()) -> true | false.

check_cd(CmdName) ->
    Time = get_cd(CmdName), check_cd(CmdName, Time).

check_cd(CmdName, Time) ->
    Now = date:unixtime(ms),
    case get(CmdName) of
      T when is_integer(T) ->
	  case Now - T >= Time of
	    true -> put(CmdName, Now), true;
	    false -> false
	  end;
      _ -> put(CmdName, Now), true
    end.

-spec check_cd_with_end_time(CmdName ::
				 atom()) -> true | {false, integer()}.

check_cd_with_end_time(CmdName) ->
    Time = get_cd(CmdName),
    check_cd_with_end_time(CmdName, Time).

check_cd_with_end_time(CmdName, Time) ->
    Now = date:unixtime(ms),
    case get(CmdName) of
      T when is_integer(T) ->
	  case Now - T >= Time of
	    true -> put(CmdName, Now), true;
	    false -> {false, max(0, (Time + T - Now) div 1000)}
	  end;
      _ -> put(CmdName, Now), true
    end.

get_cd(_) -> 1000.

get_city_name(#role{m_room =
			#m_room{city_id = CityId}}) ->
    case role_career_data:get_city_info(CityId) of
      {ProvinceName, CityName} -> {ProvinceName, CityName};
      _ ->
	  {util:get(province_name, <<>>),
	   util:get(city_name, <<>>)}
    end.

-spec check_open_cond(list(), #role{}) -> true |
					  {false, bitstring()}.

check_open_cond([], _Role) -> true;
check_open_cond([{open_day, OpenDay} | Rest], Role) ->
    case game_lib:server_open_time(day) >= OpenDay of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Số ngày mở máy chủ không đủ"/utf8>>)}
    end;
check_open_cond([{reg_day, OpenDay} | Rest], Role) ->
    EndTime = holiday_role:parse_time({reg_day, OpenDay},
				      Role),
    case date:unixtime() >= EndTime of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false, lang:get(<<"Ngày đăng ký không đủ"/utf8>>)}
    end;
check_open_cond([{reg_day_less, Day} | Rest],
		Role = #role{reg_time = RegTime}) ->
    EndTime = RegTime + 86400 * Day,
    case date:unixtime() < EndTime of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Ngày đăng ký không đáp ứng yêu cầu"/utf8>>)}
    end;
check_open_cond([{open_day_time, OpenDay, Time} | Rest],
		Role) ->
    TimeStamp = date:parse_time(Time),
    OpenTime = game_lib:server_open_time(ms),
    StampOpenDay = max(1,
		       (date:unixtime({zero, TimeStamp}) -
			  date:unixtime({zero, OpenTime}))
			 div 86400
			 + 1),
    case StampOpenDay >= OpenDay of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Số ngày mở máy chủ không đủ"/utf8>>)}
    end;
check_open_cond([{open_srv_time, min, Time} | Rest],
		Role) ->
    TimeStamp = date:parse_time(Time),
    OpenTime = game_lib:server_open_time(ms),
    case OpenTime >= TimeStamp of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Số ngày mở máy chủ không đủ"/utf8>>)}
    end;
check_open_cond([{open_srv_time, max, Time} | Rest],
		Role) ->
    TimeStamp = date:parse_time(Time),
    OpenTime = game_lib:server_open_time(ms),
    case OpenTime =< TimeStamp of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Số ngày mở máy chủ không đủ"/utf8>>)}
    end;
check_open_cond([{dun, DunId} | Rest], Role) ->
    case dungeon:is_pass(Role, DunId) of
      true -> check_open_cond(Rest, Role);
      false ->
	  case dungeon_data:get(DunId) of
	    #dungeon_data{name = Name} ->
		Msg =
		    util:fbin(lang:get(<<"Cần phải qua cửa ải~tsMở khóa"/utf8>>),
			      [Name]),
		{false, Msg};
	    _ ->
		{false, lang:get(<<"Chưa xóa bản sao tương ứng"/utf8>>)}
	  end
    end;
check_open_cond([{lev, LimitLev} | Rest],
		Role = #role{lev = Lev}) ->
    case LimitLev =< Lev of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Không đạt đến mức tương ứng"/utf8>>)}
    end;
check_open_cond([{lev_max, LimitLev} | Rest],
		Role = #role{lev = Lev}) ->
    case Lev =< LimitLev of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Không đạt đến mức tương ứng"/utf8>>)}
    end;
check_open_cond([{lev_equal, LimitLev} | Rest],
		Role = #role{lev = Lev}) ->
    case LimitLev =:= Lev of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Không đạt đến mức tương ứng"/utf8>>)}
    end;
check_open_cond([{charge_sum, Val1, Val2} | Rest],
		Role) ->
    AllCharge = charge_misc:charge_sum(Role),
    case AllCharge >= Val1 andalso AllCharge =< Val2 of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Không nằm trong phạm vi số tiền nạp "
		      "tương ứng"/utf8>>)}
    end;
check_open_cond([{world_lev, LimitLev} | Rest], Role) ->
    WorldLev = world_lev:get_world_lev(),
    case LimitLev =< WorldLev of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Không đạt đến cấp độ thế giới tương "
		      "ứng"/utf8>>)}
    end;
check_open_cond([{dungeon_heaven, DunId} | Rest],
		Role) ->
    case DunId == 0 orelse
	   dungeon_heaven_lib:check_dun_finish(Role, DunId)
	of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Chưa vượt qua ngục tối thiên thể được "
		      "chỉ định"/utf8>>)}
    end;
check_open_cond([{prevlogout, PrevLogoutTimeLimit}
		 | Rest],
		Role) ->
    PrevLogoutTime = role_lib:get_logout_time(Role),
    Now = date:unixtime(),
    DayDiff = date:day_diff(PrevLogoutTime, Now) + 1,
    case PrevLogoutTime =/= 0 andalso
	   PrevLogoutTimeLimit >= DayDiff
	of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Thời gian ngoại tuyến không đạt yêu "
		      "cầu"/utf8>>)}
    end;
check_open_cond([{prevlogout_day, PrevLogoutTimeLimit}
		 | Rest],
		Role) ->
    PrevLogoutTime = role_lib:get_logout_time(Role),
    Now = date:unixtime(),
    DayDiff = date:day_diff(PrevLogoutTime, Now) + 1,
    case PrevLogoutTime =/= 0 andalso
	   PrevLogoutTimeLimit < DayDiff
	of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Thời gian ngoại tuyến không đạt yêu "
		      "cầu"/utf8>>)}
    end;
check_open_cond([{finish_room_feat, RoomFeatId} | Rest],
		Role = #role{m_room_feat =
				 #m_room_feat{finish = Finish}}) ->
    case lists:keymember(RoomFeatId, 1, Finish) of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Điều kiện tiên quyết không được đáp "
		      "ứng"/utf8>>)}
    end;
check_open_cond([{soft, SoftLimit} | Rest],
		Role = #role{m_home =
				 #m_home{max_sum_soft = MaxSumSoft}}) ->
    case SoftLimit =< MaxSumSoft of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Mức độ thoải mái không đạt yêu cầu"/utf8>>)}
    end;
check_open_cond([{max_tower_equal, Tower} | Rest],
		Role = #role{}) ->
    case star_tower:tower(Role) =:= Tower of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false,
	   lang:get(<<"Số lượng các tầng của tháp thử nghiệm "
		      "chưa đạt được"/utf8>>)}
    end;
check_open_cond([{have_enter_dungeon, 1} | Rest],
		Role = #role{id = RoleId}) ->
    case var:get_role_var_cluster(RoleId, other, 20, 0) of
      0 -> check_open_cond(Rest, Role);
      _ ->
	  {false,
	   lang:get(<<"Chưa bao giờ bước vào cõi Thiên Đường"/utf8>>)}
    end;
check_open_cond([{channel, ChannelList} | Rest],
		Role = #role{reg_channel = Channel}) ->
    case lists:member(Channel, ChannelList) of
      true -> check_open_cond(Rest, Role);
      _ ->
	  {false,
	   lang:get(<<"Không đáp ứng được các hạn chế của kênh"/utf8>>)}
    end;
check_open_cond([{hero_star, NeedStar, Num} | Rest],
		Role = #role{partner_bag =
				 #partner_bag{partner_had = HasList}}) ->
    case length([{Id, Star}
		 || {Id, _, _, Star} <- HasList, Star >= NeedStar])
	   >= Num
	of
      true -> check_open_cond(Rest, Role);
      _ ->
	  {false,
	   lang:get(<<"Không đáp ứng được các hạn chế của kênh"/utf8>>)}
    end;
check_open_cond([{holy_eqm_score, Score} | Rest],
		Role = #role{m_recruit =
				 #m_recruit{all_score = AllScore}}) ->
    case AllScore >= Score of
      true -> check_open_cond(Rest, Role);
      _ ->
	  {false,
	   lang:get(<<"Tổng điểm giới hạn của trang bị thần "
		      "thánh không đạt được"/utf8>>)}
    end;
check_open_cond([{holy_eqm_score_max, Score} | Rest],
		Role = #role{m_recruit =
				 #m_recruit{all_score = AllScore}}) ->
    case AllScore =< Score of
      true -> check_open_cond(Rest, Role);
      _ ->
	  {false,
	   lang:get(<<"Tổng điểm giới hạn của trang bị thần "
		      "thánh không đạt được"/utf8>>)}
    end;
check_open_cond([{guild_break_skill, Career} | Rest],
		Role = #role{m_guild_skill =
				 #m_guild_skill{break_groups = BreakGroups}}) ->
    case lists:keyfind(Career,
		       #guild_skill_break_group.career, BreakGroups)
	of
      #guild_skill_break_group{} ->
	  check_open_cond(Rest, Role);
      _ ->
	  {false,
	   lang:get(<<"Không có đột phá trong kỹ năng của guild"/utf8>>)}
    end;
check_open_cond(Cond, Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_misc965, _,
       {__Levelrole_misc965, __Tracesrole_misc965}}
	  when __Levelrole_misc965 band 8 /= 0 orelse
		 __Tracesrole_misc965 /= [] ->
	  lager:do_log(error,
		       [{module, role_misc}, {function, check_open_cond},
			{line, 965}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]Lỗi khi bật cấu hình điều kiện[~w]",
				     [Role#role.name, Cond]),
		       none, 4096, 8, __Levelrole_misc965,
		       __Tracesrole_misc965, lager_event, __Pidrole_misc965);
      _ -> ok
    end,
    {false, lang:get(<<"Không đủ điều kiện để mở"/utf8>>)}.


