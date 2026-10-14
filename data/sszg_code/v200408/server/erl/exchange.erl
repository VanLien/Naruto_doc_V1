-file("data/exchange.erl", 1).

-file("src/mod/exchange/exchange.erl", 1).

-module(exchange).

-lager_records([{m_arena_elite_war_order,
		 [ver, period, period_day, end_time, win_count,
		  rmb_status, card, lev_reward, start_time, ext]},
		{arena_replay_partner, [pos, bid, lev, star, ext]},
		{arena_replay_info,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_elite_log,
		 [id, atk_id, atk_name, atk_face, atk_lev, atk_rank,
		  atk_elite_lev, def_id, def_name, def_face, def_lev,
		  def_rank, def_elite_lev, ret, win_count, lose_count,
		  combat_type, replay_list, time, atk_face_update_time,
		  atk_face_file, def_face_update_time, def_face_file]},
		{role_arena_elite_log, [id, list]},
		{arena_elite_rank,
		 [ver, rank, id, name, power, lev, face, look_id, score,
		  elite_lev, time, avatar_id, face_update_time,
		  face_file]},
		{arena_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, dower_skill,
		  set_skill, attr, extra]},
		{arena_elite_rival_defense,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, partner_infos, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  extra]},
		{c_e_role,
		 [ver, id, name, power, lev, face, look_id, score,
		  elite_lev, avatar_id, is_king, match_power, all_star,
		  win_rio, zid, face_update_time, face_file]},
		{arena_elite_role,
		 [ver, id, name, lev, sex, gid, gname, face, power,
		  look_id, score, elite_lev, time, avatar_id, is_king,
		  defense, manifesto, face_update_time, face_file,
		  break_groups]},
		{c_elite_srv_info,
		 [type, sid, num, world_lev, open_time, merge_srvs]},
		{m_arena_elite_defens, [type, formations]},
		{m_arena_elite_log,
		 [ver, period, max_lev, max_score, combat_win_count1,
		  combat_all_count1, combat_win_count2, combat_all_count2,
		  max_dps, mvp_info, winning_streak, winning_streak_now,
		  beast_rivl_info, extra, log_zone_id, log_rank]},
		{arena_elite_role_best,
		 [id, name, lev, sex, gid, gname, face, power, look_id,
		  score, elite_lev, time, avatar_id, is_king, extra,
		  face_update_time, face_file]},
		{m_arena_elite,
		 [ver, lev, init_lev, period, score, day_combat_count,
		  day_buy_count, frist_ref_time, ref_count, match_cd_time,
		  had_combat_num, acc_combat_num, lev_reward,
		  last_combat_id, promoted_info, rival_info, defens,
		  old_rank, day_point_count, log, extra, last_reset_time,
		  max_day_buy_count, is_skip]},
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
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
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
		{recruit_limit, [key, info]},
		{holiday_info, [camp_id, stats, ext]},
		{recruit_info, [group_id, stats, ext]},
		{m_recruit_award, [ver, list]},
		{m_recruit,
		 [ver, free_cd_end, list, convert_list, convert_state,
		  holiday_list, holy_eqm_lottery, logs,
		  holiday_sprite_lottery_list, lucky_sprites,
		  lucky_holy_eqm, all_score]},
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
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
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
		{m_star, [ver, star_list, fetter_list, all_attr]},
		{star_tower_replay, [tower, replays]},
		{tower_replay_data,
		 [type, rid, sid, name, face_id, time, power, repaly_id,
		  face_update_time, face_file]},
		{m_star_divination,
		 [ver, luck, quality, all_count, flag, ref_count,
		  day_gold_count, day_hun_count]},
		{m_star_tower, [ver, max_tower, award_list]},
		{star,
		 [ver, set_id, break_lev, lev, natals, add_attr,
		  fetter_attr, set_skill_id, power]},
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{exchange_data_other,
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

-export([buy_num_list/2, buy/3, auto_buy/3, mystery/2,
	 mystery_refresh/2, time_check/1, login/1, flush/2,
	 mystery_buy/5, init/0, get_ext/2, is_mystery/1,
	 exchange_soul/2, add_exchange_free_num/2,
	 gm_test_refresh/4, get_holiday_exchange/2,
	 holiday_buy/4, get_holiday_buy_num/3,
	 ref_pumpkin_time/0, ref_pumpkin_time/1,
	 get_mystery_free/2, check_refresh_cd/1]).

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

-file("src/mod/exchange/exchange.erl", 32).

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

-file("src/mod/exchange/exchange.erl", 33).

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

-file("src/mod/exchange/exchange.erl", 34).

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

-file("src/mod/exchange/exchange.erl", 35).

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

-file("src/mod/exchange/exchange.erl", 36).

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

-file("src/mod/exchange/exchange.erl", 37).

-file("inc/log.hrl", 1).

-file("src/mod/exchange/exchange.erl", 38).

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

-file("src/mod/exchange/exchange.erl", 39).

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

-file("src/mod/exchange/exchange.erl", 40).

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

-file("src/mod/exchange/exchange.erl", 41).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("src/mod/exchange/exchange.erl", 42).

-file("inc/star.hrl", 1).

-record(star,
	{ver = 1  :: non_neg_integer(),
	 set_id = 0  :: non_neg_integer(),
	 break_lev = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), natals = []  :: list(),
	 add_attr = []  :: list(), fetter_attr = []  :: list(),
	 set_skill_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer()}).

-record(m_star_tower,
	{ver = 1  :: non_neg_integer(),
	 max_tower = 0  :: non_neg_integer(),
	 award_list = []  :: list()}).

-record(m_star_divination,
	{ver = 1  :: non_neg_integer(),
	 luck = 1  :: non_neg_integer(),
	 quality = 1  :: non_neg_integer(),
	 all_count = 0  :: non_neg_integer(),
	 flag = 0  :: non_neg_integer(),
	 ref_count = 0  :: non_neg_integer(),
	 day_gold_count = 0  :: non_neg_integer(),
	 day_hun_count = 0  :: non_neg_integer()}).

-record(tower_replay_data,
	{type = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(), sid = 0  :: binary(),
	 name = <<>>  :: binary(),
	 face_id = 0  :: non_neg_integer(),
	 time = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 repaly_id = 0  :: non_neg_integer(),
	 face_update_time = 0, face_file = <<>>}).

-record(star_tower_replay,
	{tower = 0  :: non_neg_integer(),
	 replays = []  :: [#tower_replay_data{}]}).

-record(m_star,
	{ver = 1  :: non_neg_integer(),
	 star_list = []  :: [#star{}],
	 fetter_list = []  :: list(), all_attr = []  :: list()}).

-file("src/mod/exchange/exchange.erl", 43).

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

-file("src/mod/exchange/exchange.erl", 44).

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

-file("src/mod/exchange/exchange.erl", 45).

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

-file("src/mod/exchange/exchange.erl", 46).

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

-file("src/mod/exchange/exchange.erl", 47).

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

-file("src/mod/exchange/exchange.erl", 48).

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

-file("src/mod/exchange/exchange.erl", 49).

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

-file("src/mod/exchange/exchange.erl", 50).

-file("inc/arena_elite.hrl", 1).

-record(m_arena_elite,
	{ver = 6, lev = 1, init_lev = 1, period = 0, score = 0,
	 day_combat_count = 0, day_buy_count = 0,
	 frist_ref_time = 0, ref_count = 0, match_cd_time = 0,
	 had_combat_num = 0, acc_combat_num = 0, lev_reward = [],
	 last_combat_id = {0, <<>>}, promoted_info = [],
	 rival_info = [], defens = [], old_rank = [],
	 day_point_count = [], log = [], extra = [],
	 last_reset_time = 0, max_day_buy_count = 0,
	 is_skip = 0}).

-record(arena_elite_role_best,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = [],
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, extra = [],
	 face_update_time = 0, face_file = <<>>}).

-record(m_arena_elite_log,
	{ver = 2, period = 0, max_lev = 1, max_score = 1000,
	 combat_win_count1 = 0, combat_all_count1 = 0,
	 combat_win_count2 = 0, combat_all_count2 = 0,
	 max_dps = 0, mvp_info = [], winning_streak = 0,
	 winning_streak_now = 0,
	 beast_rivl_info = #arena_elite_role_best{}, extra = [],
	 log_zone_id = 0, log_rank = 0}).

-record(m_arena_elite_defens,
	{type = 1, formations = []}).

-record(c_elite_srv_info,
	{type = 1, sid = <<>>, num = 0, world_lev = 0,
	 open_time = 0, merge_srvs = []}).

-record(arena_elite_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, defense = [],
	 manifesto = [], face_update_time = 0, face_file = <<>>,
	 break_groups = []}).

-record(c_e_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, power = 0,
	 lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, avatar_id = 0, is_king = 0,
	 match_power = 1, all_star = 1, win_rio = 1, zid = 1,
	 face_update_time = 0, face_file = <<>>}).

-record(arena_elite_rival_defense,
	{order, formation_type, hallows_id, hallows_lev,
	 hallows_skill_lev, partner_infos, hallows_look_id,
	 hallows_lucky, hallows_seal, hallows_all_look_ids = [],
	 extra = []}).

-record(arena_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, dower_skill = [],
	 set_skill = [], attr, extra = []}).

-record(arena_elite_rank,
	{ver = 2, rank = 0, id = {0, <<>>}, name = <<>>,
	 power = 0, lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, time = 0, avatar_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(role_arena_elite_log,
	{id = {0, <<>>}, list = []}).

-record(arena_elite_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_lev = 0, atk_rank = 0,
	 atk_elite_lev = 0, def_id = {0, <<>>}, def_name = <<>>,
	 def_face = 0, def_lev = 0, def_rank = 0,
	 def_elite_lev = 0, ret = 1, win_count = 0,
	 lose_count = 0, combat_type = 0, replay_list = [],
	 time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(arena_replay_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-record(m_arena_elite_war_order,
	{ver = 2, period = 0, period_day = 0, end_time = 0,
	 win_count = 0, rmb_status = 0, card = [],
	 lev_reward = [], start_time = 0, ext = []}).

-file("src/mod/exchange/exchange.erl", 51).

-spec init() -> #m_shop{}.

init() -> #m_shop{}.

-spec login(#role{}) -> #role{}.

login(Role) ->
    Role1 = set_exchange_timer(Role, 4),
    Role2 = set_exchange_timer(Role1, 16),
    Role3 = set_exchange_timer(Role2, 9),
    Role4 = set_exchange_timer(Role3, 34),
    Role5 = set_exchange_timer(Role4, 43),
    Role6 = ref_arena_cluster_num(Role5),
    Role7 = ref_mystery_price(Role6),
    ref_pumpkin_time(Role7).

ref_arena_cluster_num(Role = #role{m_exchange =
				       #m_shop{items = Items}}) ->
    case lists:keyfind(34, 1, Items) of
      {_, List} ->
	  case length(List) =/=
		 exchange_data:get_const(cluster_commodity_num)
	      of
	    true ->
		{NewRole, _, _} = do_first_rand(Role, 34), NewRole;
	    _ -> Role
	  end;
      _ -> Role
    end.

ref_pumpkin_time() ->
    role_group:apply(world,
		     {exchange, ref_pumpkin_time, []}),
    ok.

ref_pumpkin_time(Role = #role{id = {_, SrvId}}) ->
    case lists:member(SrvId,
		      [<<"dev_1">>, <<"release2_2">>, <<"symlf_1">>,
		       <<"symlf_2">>, <<"symlf_3">>, <<"symlf_4">>,
		       <<"symlf_5">>, <<"symlf_6">>])
	of
      true ->
	  case var:get_var(Role, other, 3071, 0) of
	    0 ->
		case exchange_data:get_by_eid(80008) of
		  Data = #exchange_data{} ->
		      BuyNum = get_buy_num(Data, Role),
		      Role1 = var:set_var(Role, other, 3071, max(1, BuyNum)),
		      Role2 = add_buy_num(Data, Role1, 0),
		      {ok, Role2};
		  _ -> {ok, Role}
		end;
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end.

-spec time_check(#role{}) -> {ok, #role{}}.

time_check(Role) ->
    role:pack_send(13404, []), {ok, Role}.

-spec is_mystery(pos_integer()) -> true | false.

is_mystery(Type) ->
    lists:member(Type, [2, 4, 16, 9, 34, 43]).

-spec get_ext(#role{}, pos_integer()) -> list().

get_ext(Role = #role{m_exchange =
			 #m_shop{expire_list = ExpireList}},
	EId) ->
    case exchange_data:get_by_eid(EId) of
      #exchange_data{goods_type = 1} ->
	  case lists:keyfind(EId, #exchange_expire_gift.eid,
			     ExpireList)
	      of
	    #exchange_expire_gift{timeout = Timeout} ->
		[{4, Timeout}];
	    _ -> []
	  end;
      #exchange_data{limit_week = LimitWeek}
	  when LimitWeek > 0 ->
	  Num = exchange_lib:get_tmp_week(Role, EId), [{2, Num}];
      #exchange_data{limit_day = LimitDay}
	  when LimitDay > 0 ->
	  Num = exchange_lib:get_val(Role, EId), [{1, Num}];
      #exchange_data{limit_month = LimitMonth}
	  when LimitMonth > 0 ->
	  Num = exchange_lib:get_tmp_month(Role, EId), [{3, Num}];
      #exchange_data{limit_count = LimitCount}
	  when LimitCount > 0 ->
	  Num = exchange_lib:get_tmp_other(Role, EId), [{5, Num}];
      #exchange_data{} -> []
    end.

-spec buy_num_list(#role{}, pos_integer()) -> [tuple()].

buy_num_list(Role, Type) ->
    TypeList = exchange_data:list_by_type(Type),
    case check_open(Role, Type) of
      {false, Msg} -> {false, Msg};
      _ -> buy_num_list_f1(TypeList, Role, [])
    end.

check_open(#role{lev = Lev,
		 m_star_tower = #m_star_tower{max_tower = MaxTower}},
	   Type) ->
    OpenLv = exchange_data:get_const(open_gold_lev),
    case OpenLv > Lev of
      true -> {false, lang:get(<<"Cấp Độ Không Đủ"/utf8>>)};
      _ ->
	  case exchange_data:get_limit_open(Type) of
	    [{star_power, Limit} | _] when MaxTower < Limit ->
		{false,
		 util:fbin(lang:get(<<"Tháp Tinh Mệnh vượt qua ~w tầng mở khóa"/utf8>>),
			   [Limit])};
	    _ -> true
	  end
    end.

buy_num_list_f1([], _Role, Acc) -> Acc;
buy_num_list_f1([#exchange_data{goods_type = 1,
				id = EId}
		 | TypeList],
		Role = #role{m_exchange = #m_shop{expire_list = List}},
		Acc) ->
    NewAcc = case lists:keyfind(EId,
				#exchange_expire_gift.eid, List)
		 of
	       #exchange_expire_gift{timeout = Timeout} ->
		   [{EId, [{4, Timeout}]} | Acc];
	       _ -> Acc
	     end,
    buy_num_list_f1(TypeList, Role, NewAcc);
buy_num_list_f1([E | TypeList], Role, Acc) ->
    Num = get_buy_num(E, Role),
    NewAcc = set_buy_num(E, Acc, Num),
    buy_num_list_f1(TypeList, Role, NewAcc).

-spec buy(#role{}, pos_integer(), pos_integer()) -> {ok,
						     bitstring(), #role{}} |
						    {error, bitstring()}.

buy(_Role, _EId, ENum)
    when ENum < 1 orelse ENum > 999 ->
    {false,
     lang:get(<<"Số Lượng Mua Hàng Không Hợp Lệ"/utf8>>)};
buy(Role, EId, ENum) ->
    do_buy([data, is_holiday, expire, buy_num, buy_lev,
	    limit_lev, limit_vip, limit_rank, limit_soft,
	    limit_dun_heaven, limit_but_monopoly, finish],
	   Role, #{eid => EId, enum => ENum, is_holiday => false}).

-spec auto_buy(#role{}, pos_integer(),
	       pos_integer()) -> {ok, bitstring(), #role{}} |
				 {error, bitstring()}.

auto_buy(Role, _EId, 0) -> {ok, Role};
auto_buy(_Role, _EId, ENum)
    when ENum < 1 orelse ENum > 999 ->
    {false,
     lang:get(<<"Số Lượng Mua Hàng Không Hợp Lệ"/utf8>>)};
auto_buy(Role, EId, ENum) ->
    do_buy([data, is_holiday, expire, buy_num, buy_lev,
	    limit_lev, limit_vip, limit_rank, limit_soft,
	    limit_dun_heaven, limit_but_monopoly, auto_buy],
	   Role, #{eid => EId, enum => ENum, is_holiday => false}).

-spec holiday_buy(#role{}, pos_integer(), pos_integer(),
		  #holiday{}) -> {ok, bitstring(), #role{}} |
				 {error, bitstring()}.

holiday_buy(_Role, _EId, ENum, _Holiday)
    when ENum < 1 orelse ENum > 999 ->
    {false,
     lang:get(<<"Số lượng mua hàng không hợp lệ"/utf8>>)};
holiday_buy(Role, EId, ENum, Holiday) ->
    do_buy([data, is_holiday, expire, hd_buy_num, buy_lev,
	    limit_lev, limit_vip, limit_rank, limit_soft,
	    limit_dun_heaven, limit_but_monopoly, holiday_finish],
	   Role,
	   #{eid => EId, enum => ENum, holiday => Holiday,
	     is_holiday => true}).

do_buy([data | Other], Role, Cache = #{eid := EId}) ->
    case exchange_data:get_by_eid(EId) of
      undefined ->
	  {false,
	   lang:get(<<"Vật phẩm không tồn tại, vui lòng thử "
		      "lại sau"/utf8>>)};
      Exchange ->
	  do_buy(Other, Role, Cache#{exchange_data => Exchange})
    end;
do_buy([expire | Other], Role,
       Cache = #{exchange_data := Exchange, enum := ENum}) ->
    case check_buy_cond(Role, Exchange, ENum) of
      {error, Msg} -> {false, Msg};
      _ -> do_buy(Other, Role, Cache)
    end;
do_buy([is_holiday | Other], Role,
       Cache = #{exchange_data := #exchange_data{type = Type},
		 is_holiday := Flag}) ->
    if Type == 80 andalso Flag ->
	   do_buy(Other, Role, Cache);
       Type =/= 80 andalso not Flag ->
	   do_buy(Other, Role, Cache);
       true ->
	   {false,
	    lang:get(<<"Không thể sử dụng phương thức này để "
		       "mua"/utf8>>)}
    end;
do_buy([buy_num | Other], Role,
       Cache = #{exchange_data := Exchange, enum := ENum}) ->
    LimitCount = get_limit_num(Exchange),
    BuyNum = get_buy_num(Exchange, Role),
    case BuyNum + ENum > LimitCount andalso LimitCount > 0
	of
      true -> get_msg(Exchange);
      _ -> do_buy(Other, Role, Cache#{buy_num => BuyNum})
    end;
do_buy([hd_buy_num | Other], Role,
       Cache = #{exchange_data := Exchange, enum := ENum,
		 holiday := Holiday}) ->
    LimitCount = get_limit_num(Exchange),
    BuyNum = get_hd_buy_num(Exchange, Role, Holiday),
    case BuyNum + ENum > LimitCount andalso LimitCount > 0
	of
      true -> get_msg(Exchange);
      _ -> do_buy(Other, Role, Cache#{buy_num => BuyNum})
    end;
do_buy([buy_lev | Other], Role,
       Cache = #{exchange_data :=
		     #exchange_data{glev = LimitGlev, lev = Lev,
				    arena_elite_lev = Elitelev}}) ->
    case check_lev_type(Role,
			[{glev, LimitGlev}, {arena_elite_lev, Elitelev},
			 {lev, Lev}])
	of
      {false, Msg} -> {false, Msg};
      _ -> do_buy(Other, Role, Cache)
    end;
do_buy([limit_lev | Other], Role = #role{lev = RLev},
       Cache = #{exchange_data :=
		     #exchange_data{type = Type}}) ->
    OpenLev = get_open_lev(Type),
    case RLev > OpenLev of
      false ->
	  {false,
	   lang:get(<<"Chưa đạt cấp độ mở của cửa hàng này"/utf8>>)};
      _ -> do_buy(Other, Role, Cache)
    end;
do_buy([limit_rank | Other],
       Role = #role{m_sky_ladder =
			#m_sky_ladder{best_rank = BestRank}},
       Cache = #{exchange_data :=
		     #exchange_data{limit_rank = Rank}}) ->
    case Rank > 0 andalso
	   (BestRank =:= 0 orelse BestRank > Rank)
	of
      true ->
	  {false,
	   lang:get(<<"Chưa đạt cấp độ có thể mua được vật "
		      "phẩm này"/utf8>>)};
      _ -> do_buy(Other, Role, Cache)
    end;
do_buy([limit_soft | Other],
       Role = #role{m_home = #m_home{max_soft = MaxSoft}},
       Cache = #{exchange_data :=
		     #exchange_data{limit_soft = LimitSoft}}) ->
    case LimitSoft > 0 andalso LimitSoft > MaxSoft of
      true ->
	  {false,
	   util:fbin(lang:get(<<"Đạt mức độ thoải mái ~w có thể mua được"/utf8>>),
		     [LimitSoft])};
      _ -> do_buy(Other, Role, Cache)
    end;
do_buy([limit_vip | Other],
       Role = #role{m_vip = #m_vip{lev = Vip}},
       Cache = #{exchange_data :=
		     #exchange_data{limit_vip = LimitVip}}) ->
    case Vip < LimitVip of
      true ->
	  {false,
	   util:fbin(lang:get(<<"Có thể mua được với VIP~w trở lên"/utf8>>),
		     [LimitVip])};
      _ -> do_buy(Other, Role, Cache)
    end;
do_buy([limit_dun_heaven | Other], Role,
       Cache = #{exchange_data :=
		     #exchange_data{buy_condit = BuyCondit}}) ->
    case BuyCondit =:= 0 orelse
	   holy_eqm_lottery:check_holy_score(Role, BuyCondit)
	of
      true -> do_buy(Other, Role, Cache);
      _ ->
	  {false,
	   lang:get(<<"Cần tổng điểm trang bị thần của 5 anh "
		      "hùng mạnh nhất chưa đạt yêu cầu, không "
		      "thể mua"/utf8>>)}
    end;
do_buy([limit_but_monopoly | Other], Role,
       Cache = #{exchange_data :=
		     #exchange_data{buy_stage = Stage}}) ->
    case Stage =:= 0 orelse
	   monopoly_maps:check_stage_finish(Role, Stage)
	of
      true -> do_buy(Other, Role, Cache);
      _ ->
	  {false,
	   util:fbin(lang:get(<<"Mở khóa giai đoạn ~w có thể mua được"/utf8>>),
		     [Stage])}
    end;
do_buy([auto_buy | _], Role,
       #{enum := ENum, eid := EId, exchange_data := Exchange,
	 buy_num := BuyNum}) ->
    Price = Exchange#exchange_data.price,
    Label = Exchange#exchange_data.label,
    PayType = Exchange#exchange_data.pay_type,
    ItemBid = Exchange#exchange_data.item_bid,
    Type = Exchange#exchange_data.type,
    ItemNum = Exchange#exchange_data.item_num,
    Discount = Exchange#exchange_data.discount,
    NewPrice = case is_integer(Label) andalso Label =/= 0 of
		 true -> Discount;
		 _ -> Price
	       end,
    SumPrice = ENum * NewPrice,
    Loss = format:val_to_loss([{PayType, SumPrice}],
			      exchange_buy),
    case role_gain:do(Role, Loss) of
      {false, #loss{msg = Msg}} -> {false, Msg};
      {ok, NewRole} ->
	  LogType = get_log_exchange_name(Type),
	  log:log_gain(Loss, Role, NewRole, LogType,
		       util:fbin("Mua hàng tự động trong cửa hàng:~w", [EId])),
	  log:save(shop,
		   {NewRole, LogType, ItemBid, ENum * ItemNum, PayType,
		    SumPrice,
		    util:fbin("Mua hàng tự động trong cửa hàng:~w",
			      [EId])}),
	  NewRole2 = add_buy_num(Exchange, NewRole,
				 BuyNum + ENum),
	  {ok, NewRole2}
    end;
do_buy([finish | _], Role,
       #{enum := ENum, eid := EId, exchange_data := Exchange,
	 buy_num := BuyNum}) ->
    Price = Exchange#exchange_data.price,
    Label = Exchange#exchange_data.label,
    PayType = Exchange#exchange_data.pay_type,
    ItemBid = Exchange#exchange_data.item_bid,
    Type = Exchange#exchange_data.type,
    ItemNum = Exchange#exchange_data.item_num,
    Discount = Exchange#exchange_data.discount,
    NewPrice = case is_integer(Label) andalso Label =/= 0 of
		 true -> Discount;
		 _ -> Price
	       end,
    SumPrice = ENum * NewPrice,
    Loss = format:val_to_loss([{PayType, SumPrice}],
			      exchange_buy),
    case role_gain:do(Role, Loss) of
      {false, #loss{msg = Msg}} -> {false, Msg};
      {ok, NRole} ->
	  ItemTempList = [{ItemBid, ENum * ItemNum}],
	  GL = format:val_to_gain(ItemTempList, exchange_buy),
	  Result = case lists:member(Type, [51, 52]) of
		     true -> role_gain:do_notice(NRole, GL);
		     _ ->
			 role_gain:do_notice(NRole, GL,
					     #gain_loss_opts{type = 1})
		   end,
	  case Result of
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, NewRole} ->
		LogType = get_log_exchange_name(Type),
		log:log_gain(Loss ++ GL, Role, NewRole, LogType,
			     util:fbin("Mua hàng trong cửa hàng:~w", [EId])),
		log:save(shop,
			 {NewRole, LogType, ItemBid, ENum * ItemNum, PayType,
			  SumPrice,
			  util:fbin("Mua hàng trong cửa hàng:~w", [EId])}),
		NewRole2 = add_buy_num(Exchange, NewRole,
				       BuyNum + ENum),
		NewRole3 = role_trigger:fire(#evt_exchange{type = Type},
					     NewRole2),
		{ok, NewRole3}
	  end
    end;
do_buy([holiday_finish | _], Role,
       #{enum := ENum, eid := EId, exchange_data := Exchange,
	 buy_num := BuyNum, holiday := Holiday}) ->
    Price = Exchange#exchange_data.price,
    Label = Exchange#exchange_data.label,
    PayType = Exchange#exchange_data.pay_type,
    ItemBid = Exchange#exchange_data.item_bid,
    Type = Exchange#exchange_data.type,
    ItemNum = Exchange#exchange_data.item_num,
    Discount = Exchange#exchange_data.discount,
    NewPrice = case is_integer(Label) andalso Label =/= 0 of
		 true -> Discount;
		 _ -> Price
	       end,
    SumPrice = ENum * NewPrice,
    Flag = if is_atom(PayType) -> exchange_buy;
	      true ->
		  case item_data:get(PayType) of
		    #item_base{gain_type = 10} -> holiday_item;
		    _ -> exchange_buy
		  end
	   end,
    Loss = format:val_to_loss([{PayType, SumPrice}], Flag),
    ItemTempList = [{ItemBid, ENum * ItemNum}],
    GL = format:val_to_gain(ItemTempList, exchange_buy),
    case role_gain:do_notice(Role, Loss ++ GL) of
      {false, #loss{msg = Msg}} -> {false, Msg};
      {false, #gain{msg = Msg}} -> {false, Msg};
      {ok, NewRole} ->
	  LogType = get_log_exchange_name(Type),
	  log:log_gain(Loss ++ GL, Role, NewRole, LogType,
		       util:fbin("Mua hàng trong cửa hàng:~w", [EId])),
	  log:save(shop,
		   {NewRole, LogType, ItemBid, ENum * ItemNum, PayType,
		    SumPrice,
		    util:fbin("Mua hàng trong cửa hàng:~w", [EId])}),
	  NewRole2 = add_hd_buy_num(Exchange, NewRole,
				    BuyNum + ENum, Holiday),
	  NewRole3 = role_trigger:fire(#evt_exchange{type = Type},
				       NewRole2),
	  {ok, NewRole3}
    end.

check_buy_cond(#role{m_exchange =
			 #m_shop{expire_list = List}},
	       #exchange_data{goods_type = 1, id = EId}, ENum) ->
    case lists:keyfind(EId, #exchange_expire_gift.eid, List)
	of
      false when ENum =:= 1 -> ok;
      false ->
	  {error,
	   lang:get(<<"Không thể mua nhiều gói ưu đãi đặc biệt"/utf8>>)};
      _ ->
	  {error,
	   lang:get(<<"Bạn hiện đã mua gói ưu đãi đặc biệt "
		      "này"/utf8>>)}
    end;
check_buy_cond(#role{lev = Lev},
	       #exchange_data{type = Type}, _ENum) ->
    case exchange_data:get_limit_open(Type) of
      [{lev, Limit} | _] when Lev < Limit ->
	  {false,
	   util:fbin(lang:get(<<"Mở khóa mua khi nhân vật đạt cấp ~w"/utf8>>),
		     [Limit])};
      _ -> true
    end.

check_lev_type(Role = #role{guild_bag =
				#guild_bag{id = Id}},
	       [{glev, LimitGlev} | Other]) ->
    GuildLev = case guild_lib:info(by_id, Id) of
		 {ok, #guild{lev = Lev}} -> Lev;
		 _ -> 0
	       end,
    case GuildLev < LimitGlev of
      true ->
	  {false,
	   util:fbin(lang:get(<<"Công hội đạt cấp ~w mới có thể mua"/utf8>>),
		     [LimitGlev])};
      _ -> check_lev_type(Role, Other)
    end;
check_lev_type(#role{m_arena_elite =
			 #m_arena_elite{lev = MyLev}},
	       [{arena_elite_lev, Lev} | _Other])
    when is_integer(Lev) andalso MyLev < Lev ->
    {false,
     util:fbin(lang:get(<<"Cần đạt cấp bậc ~ts trở lên"/utf8>>),
	       [arena_elite_data:get_lev_name(Lev)])};
check_lev_type(Role, [{arena_elite_lev, _} | Other]) ->
    check_lev_type(Role, Other);
check_lev_type(#role{lev = MyLev}, [{lev, {Min, Max}}])
    when MyLev < Min orelse MyLev >= Max ->
    {false,
     lang:get(<<"Không nằm trong khoảng cấp độ hạn chế "
		"của sản phẩm"/utf8>>)};
check_lev_type(#role{lev = MyLev}, [{lev, Lev}])
    when is_integer(Lev) andalso MyLev < Lev ->
    {false,
     util:fbin(lang:get(<<"Nhân vật đạt cấp ~w mới có thể mua"/utf8>>),
	       [Lev])};
check_lev_type(_, _) -> true.

ref_mystery_price(Role = #role{m_exchange =
				   MShop = #m_shop{items = Items}}) ->
    case lists:keyfind(4, 1, Items) of
      {Type, List} ->
	  NewList = do_ref_mystery_price_items(List, []),
	  NewItems = lists:keyreplace(Type, 1, Items,
				      {Type, NewList}),
	  Role#role{m_exchange = MShop#m_shop{items = NewItems}};
      _ -> Role
    end.

do_ref_mystery_price_items([], List) ->
    lists:reverse(List);
do_ref_mystery_price_items([I = #exchange_ref{type_type
						  = TypeType,
					      type = Type, item_bid = ItemBid,
					      price = _OldPrice,
					      pay_type = PayType,
					      item_num = ItemNum}
			    | T],
			   List) ->
    case exchange_data:get_rand2({Type, TypeType}) of
      L = [_ | _] ->
	  case [Item
		|| Item = #exchange_ref{item_bid = ItemBid1,
					item_num = ItemNum1,
					pay_type = PayType1}
		       <- L,
		   ItemBid1 =:= ItemBid, ItemNum =:= ItemNum1,
		   PayType =:= PayType1]
	      of
	    [#exchange_ref{pay_type = PayType, label = Label,
			   price = Price, discount = Discount,
			   item_num = ItemNum}] ->
		do_ref_mystery_price_items(T,
					   [I#exchange_ref{price = Price,
							   label = Label,
							   discount = Discount}
					    | List]);
	    _ -> do_ref_mystery_price_items(T, [I | List])
	  end;
      _ -> do_ref_mystery_price_items(T, [I | List])
    end;
do_ref_mystery_price_items([I | T], List) ->
    do_ref_mystery_price_items(T, [I | List]).

-spec mystery(#role{}, pos_integer()) -> tuple().

mystery(Role = #role{m_exchange =
			 #m_shop{items = Items}},
	Type) ->
    Count = get_mystery_count(Role, Type),
    FreeCount = get_mystery_free(Role, Type),
    Num = get_exchange_num(Type),
    TimeOut = get_mystery_refresh_time(Role, Type),
    case lists:keyfind(Type, 1, Items) of
      {_, List} ->
	  PushList = mystery_to_push(List, [], Role),
	  {ok, Count, FreeCount, Num, TimeOut, PushList, Role};
      _ ->
	  {NewRole, PushList, NewTime} = do_first_rand(Role,
						       Type),
	  {ok, Count, FreeCount, Num, NewTime, PushList, NewRole}
    end.

gey_mystery_buy_gl(#exchange_ref{price = Price,
				 pay_type = PayType, item_bid = ItemId,
				 discount = Discount, item_num = ItemNum},
		   ENum)
    when Discount == 0 ->
    Loss = format:val_to_loss([{PayType, Price * ENum}],
			      mystery_buy),
    GL = format:val_to_gain([{ItemId, ItemNum * ENum}],
			    mystery_buy),
    {Loss, GL};
gey_mystery_buy_gl(#exchange_ref{pay_type = PayType,
				 item_bid = ItemId, discount = Discount,
				 item_num = ItemNum},
		   ENum) ->
    Loss = format:val_to_loss([{PayType, Discount * ENum}],
			      mystery_buy),
    GL = format:val_to_gain([{ItemId, ItemNum * ENum}],
			    mystery_buy),
    {Loss, GL}.

-spec mystery_buy(#role{}, pos_integer(), pos_integer(),
		  pos_integer(), pos_integer()) -> {false, binary()} |
						   {ok, #role{}}.

mystery_buy(Role = #role{m_exchange =
			     MyChange = #m_shop{items = Items}},
	    BuyOrder, Type, _BuyType, ENum)
    when ENum > 0 ->
    case lists:keyfind(Type, 1, Items) of
      {_, List} ->
	  case lists:keyfind(BuyOrder, #exchange_ref.order, List)
	      of
	    ExchangRef = #exchange_ref{price = Price,
				       pay_type = PayType, item_bid = ItemId,
				       item_num = ItemNum, has_buy = HasBuy,
				       limit_count = LimitCount,
				       discount = Discount} ->
		TimeCount = get_limit_num(ExchangRef),
		BuyNum = get_buy_num(ExchangRef, Role),
		if LimitCount =/= 0 andalso HasBuy >= LimitCount ->
		       {false, lang:get(<<"Sản phẩm này đã bán hết"/utf8>>)};
		   LimitCount =/= 0 andalso HasBuy + ENum > LimitCount ->
		       {false,
			lang:get(<<"Số lượng sản phẩm mua không đủ"/utf8>>)};
		   TimeCount =/= 0 andalso BuyNum >= TimeCount ->
		       {false, lang:get(<<"Sản phẩm này đã bán hết"/utf8>>)};
		   TimeCount =/= 0 andalso BuyNum + ENum > TimeCount ->
		       {false,
			lang:get(<<"Số lượng sản phẩm mua không đủ"/utf8>>)};
		   TimeCount == 0 andalso HasBuy >= 1 ->
		       {false, lang:get(<<"Sản phẩm này đã bán hết"/utf8>>)};
		   true ->
		       {Loss, GL} = gey_mystery_buy_gl(ExchangRef, ENum),
		       case role_gain:do_notice(Role, Loss ++ GL,
						#gain_loss_opts{type = 1})
			   of
			 {ok, Role1} ->
			     NRole = role_trigger:fire(#evt_mystery_buy{type =
									    Type},
						       Role1),
			     LogType = get_log_exchange_name(Type),
			     log:log_gain(GL ++ Loss, Role, NRole, LogType,
					  util:fbin("Mua hàng trong cửa hàng, loại cửa hàng: "
						    "~w, số hiệu: ~w, số lượng: ~w",
						    [Type, BuyOrder, ENum])),
			     NewPrice = util:if_true(Discount == 0, Price,
						     Discount),
			     log:save(shop,
				      {NRole, LogType, ItemId, ItemNum, PayType,
				       NewPrice,
				       util:fbin("Mua hàng trong cửa hàng, loại cửa hàng: "
						 "~w, số hiệu: ~w",
						 [Type, BuyOrder])}),
			     NewExchangRef = ExchangRef#exchange_ref{has_buy =
									 HasBuy
									   +
									   ENum},
			     NewList = lists:keystore(BuyOrder,
						      #exchange_ref.order, List,
						      NewExchangRef),
			     NewItems = lists:keystore(Type, 1, Items,
						       {Type, NewList}),
			     NewMyChange = MyChange#m_shop{items = NewItems},
			     NRole0 = NRole#role{m_exchange = NewMyChange},
			     NRole1 = add_buy_num(ExchangRef, NRole0,
						  BuyNum + ENum),
			     NewRole = check_all_buy(NRole1, Type),
			     NewRole1 = case Type =:= 4 of
					  true ->
					      role_trigger:fire([#evt_mystery_mall_buy{}],
								NewRole);
					  _ -> NewRole
					end,
			     {ok, NewRole1};
			 {false, #loss{msg = Msg}} -> {false, Msg};
			 {false, #gain{msg = Msg}} -> {false, Msg}
		       end
		end;
	    _ -> {false, lang:get(<<"Lỗi tham số"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Loại cửa hàng không xác định"/utf8>>)}
    end;
mystery_buy(_Role, _BuyOrder, _Type, _BuyType, _ENum) ->
    {false,
     lang:get(<<"Loại cửa hàng không xác định"/utf8>>)}.

check_refresh_cd(2) ->
    case role_misc:check_cd(soul_13405, 500) of
      true -> ok;
      _ -> false
    end;
check_refresh_cd(4) ->
    case role_misc:check_cd(mystery_13405, 500) of
      true -> ok;
      _ -> false
    end;
check_refresh_cd(9) ->
    case role_misc:check_cd(skill_13405, 500) of
      true -> ok;
      _ -> false
    end;
check_refresh_cd(16) ->
    case role_misc:check_cd(dial_13405, 500) of
      true -> ok;
      _ -> false
    end;
check_refresh_cd(34) ->
    case role_misc:check_cd(cluster_13405, 500) of
      true -> ok;
      _ -> false
    end;
check_refresh_cd(43) ->
    case role_misc:check_cd(home_13405, 500) of
      true -> ok;
      _ -> false
    end;
check_refresh_cd(_) -> ok.

-spec mystery_refresh(#role{}, pos_integer()) -> {ok,
						  pos_integer(), pos_integer(),
						  list(), #role{}} |
						 {false, bitstring()}.

mystery_refresh(Role, Type) ->
    RefCount = get_mystery_count(Role, Type),
    MaxCount = get_ref_max_count(Role, Type),
    FreeRefCount = get_mystery_free(Role, Type),
    case FreeRefCount > 0 of
      true ->
	  do_mystery_free_refresh(Role, Type, FreeRefCount);
      _ ->
	  case RefCount >= MaxCount of
	    true ->
		{false,
		 lang:get(<<"Cửa hàng nhỏ đã hết hàng, vui lòng quay "
			    "lại sau 0 giờ để làm mới"/utf8>>)};
	    _ ->
		Expend = get_ref_expend(Type, RefCount),
		Loss2 = format:val_to_loss(Expend, mystery_refresh),
		case role_gain:do(Role, Loss2) of
		  {ok, NRole} ->
		      LogType = get_log_exchange_name(Type),
		      log:log_gain(Loss2, Role, NRole, LogType,
				   util:fbin("Làm mới cửa hàng, loại: ~w",
					     [Type])),
		      do_mystery_refresh(NRole, Type, RefCount);
		  {false, #loss{msg = Msg}} -> {false, Msg}
		end
	  end
    end.

do_mystery_refresh(Role, Type, RefCount) ->
    {NRole, List2, NewTime} = do_rand(Role, Type),
    NewRole = set_mystery_count(NRole, Type, RefCount + 1),
    FreeCount = get_mystery_free(NewRole, Type),
    Num = get_exchange_num(Type),
    {ok, RefCount + 1, FreeCount, Num, NewTime, List2,
     NewRole}.

do_mystery_free_refresh(Role, Type, FreeRefCount) ->
    {NRole, List2, _} = do_rand(Role, Type),
    NewRole = set_mystery_free(NRole, Type, FreeRefCount),
    NewTime = get_mystery_refresh_time(NewRole, Type),
    RefCount = get_mystery_count(NewRole, Type),
    charge_mall:push_point(NewRole),
    RestFreeCount = FreeRefCount - 1,
    Num = get_exchange_num(Type),
    {ok, RefCount, RestFreeCount, Num, NewTime, List2,
     NewRole}.

do_first_rand(Role = #role{m_exchange =
			       MExchange = #m_shop{items = Items}},
	      Type = 4) ->
    RefTime = get_mystery_refresh_time(Role, Type),
    List = exchange_data:first_rand(),
    List2 = mystery_to_push(List, [], Role),
    NewItems = lists:keystore(Type, 1, Items, {Type, List}),
    NRole = Role#role{m_exchange =
			  MExchange#m_shop{items = NewItems}},
    {NRole, List2, RefTime};
do_first_rand(Role, Type) -> do_rand(Role, Type).

do_rand(Role = #role{m_exchange =
			 MExchange = #m_shop{items = Items}},
	Type) ->
    RefTime = get_mystery_refresh_time(Role, Type),
    List = myrand(Type, Role),
    List2 = mystery_to_push(List, [], Role),
    NewItems = lists:keystore(Type, 1, Items, {Type, List}),
    NRole = Role#role{m_exchange =
			  MExchange#m_shop{items = NewItems}},
    {NRole, List2, RefTime}.

mystery_to_push([], PushList, _Role) -> PushList;
mystery_to_push([ExchangeRef | NList], PushList,
		Role) ->
    Item = ExchangeRef#exchange_ref.item,
    PayType = ExchangeRef#exchange_ref.pay_type,
    {PayType2, Price2} = ExchangeRef#exchange_ref.pay_type2,
    Discount = ExchangeRef#exchange_ref.discount,
    DiscountType = ExchangeRef#exchange_ref.label,
    HasBuy = ExchangeRef#exchange_ref.has_buy,
    LimitCount = ExchangeRef#exchange_ref.limit_count,
    ItemType = ExchangeRef#exchange_ref.item_type,
    Price = ExchangeRef#exchange_ref.price,
    Order = ExchangeRef#exchange_ref.order,
    ItemId = ExchangeRef#exchange_ref.item_bid,
    ItemNum = ExchangeRef#exchange_ref.item_num,
    LimitDay = ExchangeRef#exchange_ref.limit_day,
    LimitWeek = ExchangeRef#exchange_ref.limit_week,
    LimitMonth = ExchangeRef#exchange_ref.limit_month,
    ItemDesc = ExchangeRef#exchange_ref.item_desc,
    {Scour, AttrList} = case Item of
			  [] -> {0, []};
			  _ ->
			      {Item#item.all_score,
			       partner_lib:to_cli(Item#item.main_attr)}
			end,
    NewPayType = util:if_true(is_integer(PayType), PayType,
			      item_data:assets_atom2code(PayType)),
    TimeCount = get_limit_num(ExchangeRef),
    NewHasBuy = util:if_true(TimeCount > 0,
			     get_buy_num(ExchangeRef, Role), HasBuy),
    mystery_to_push(NList,
		    [{ItemId, ItemNum, Order, Price, ItemType, NewPayType,
		      NewHasBuy, LimitCount, LimitDay, LimitWeek, LimitMonth,
		      DiscountType, Discount, AttrList, PayType2, Price2,
		      Scour, ItemDesc}
		     | PushList],
		    Role).

myrand(Type, Role) ->
    Num = get_exchange_num(Type),
    myrand(Num, [], 1, Type, Role).

myrand(0, L, _, _Type, _Role) -> L;
myrand(Num, L, Order, Type, Role = #role{lev = Lev}) ->
    case do_myrand1(Order, Type, Lev) of
      {false, _Msg} ->
	  myrand(Num - 1, L, Order + 1, Type, Role);
      {ok, RandType} ->
	  case do_myrand2(RandType, Type, Role, Order) of
	    {false, _Msg} ->
		myrand(Num - 1, L, Order + 1, Type, Role);
	    ExchangeRefT ->
		myrand(Num - 1, [ExchangeRefT | L], Order + 1, Type,
		       Role)
	  end
    end.

do_myrand1(Order, Type, Lev) ->
    case exchange_data:get_rand1({Order, Type}) of
      [] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidexchange720, _,
	     {__Levelexchange720, __Tracesexchange720}}
		when __Levelexchange720 band 8 /= 0 orelse
		       __Tracesexchange720 /= [] ->
		lager:do_log(error,
			     [{module, exchange}, {function, do_myrand1},
			      {line, 720}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("Làm mới cửa hàng thất bại, loại: ~w, "
					   "vị trí: ~w",
					   [Type, Order]),
			     none, 4096, 8, __Levelexchange720,
			     __Tracesexchange720, lager_event,
			     __Pidexchange720);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Làm mới cửa hàng thất bại, thiếu một "
		      "số cấu hình"/utf8>>)};
      RandListT1 ->
	  RandTypeList = [{RandTypeTemp, Pro}
			  || {RandTypeTemp, Pro, {LvMin, LvMax}} <- RandListT1,
			     Lev >= LvMin andalso Lev =< LvMax],
	  case list_util:keyrand(RandTypeList, 2) of
	    {RandType, _} -> {ok, RandType};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidexchange728, _,
		   {__Levelexchange728, __Tracesexchange728}}
		      when __Levelexchange728 band 8 /= 0 orelse
			     __Tracesexchange728 /= [] ->
		      lager:do_log(error,
				   [{module, exchange}, {function, do_myrand1},
				    {line, 728}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("Làm mới cửa hàng thất bại, không có "
						 "dữ liệu cấu hình cấp độ thay đổi trong "
						 "thư viện ngẫu nhiên, loại: ~w, vị trí: "
						 "~w",
						 [Type, Order]),
				   none, 4096, 8, __Levelexchange728,
				   __Tracesexchange728, lager_event,
				   __Pidexchange728);
		  _ -> ok
		end,
		{false,
		 lang:get(<<"Làm mới cửa hàng thất bại, thiếu một "
			    "số cấu hình"/utf8>>)}
	  end
    end.

do_myrand2(RandType, Type, Role = #role{lev = Lev},
	   Order) ->
    RandListTemp = exchange_data:get_rand2({RandType,
					    Type}),
    RandList = [ExchangeRef
		|| ExchangeRef = #exchange_ref{lev = {LvMin, LvMax},
					       assets_range = {AsMin, AsMax},
					       pay_type = PayType}
		       <- RandListTemp,
		   Lev >= LvMin andalso Lev =< LvMax,
		   AsMin =:= -1 orelse
		     begin
		       As = role_lib:get_assets(PayType, Role),
		       As >= AsMin andalso As =< AsMax
		     end],
    case list_util:keyrand(RandList, #exchange_ref.pro) of
      undefined ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidexchange740, _,
	     {__Levelexchange740, __Tracesexchange740}}
		when __Levelexchange740 band 8 /= 0 orelse
		       __Tracesexchange740 /= [] ->
		lager:do_log(error,
			     [{module, exchange}, {function, do_myrand2},
			      {line, 740}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("Làm mới cửa hàng thất bại, không có "
					   "dữ liệu cấu hình cấp độ thay đổi trong "
					   "thư viện ngẫu nhiên, loại: ~w, loại "
					   "ngẫu nhiên 1: ~w, Cấp độ: ~w",
					   [Type, RandType, Lev]),
			     none, 4096, 8, __Levelexchange740,
			     __Tracesexchange740, lager_event,
			     __Pidexchange740);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Làm mới cửa hàng thất bại, thiếu một "
		      "số cấu hình"/utf8>>)};
      ExchangeRefT = #exchange_ref{item_bid = ItemId} ->
	  Item = case partner_eqm:gen_eqm_item(ItemId) of
		   {true, ItemTemp} -> ItemTemp;
		   _ -> []
		 end,
	  ExchangeRefT#exchange_ref{item = Item, order = Order}
    end.

check_all_buy(Role = #role{m_exchange =
			       #m_shop{items = Items}},
	      Type = 2) ->
    case lists:keyfind(Type, 1, Items) of
      {_, List} ->
	  Fun = fun (#exchange_ref{limit_count = LimitCount,
				   has_buy = HasBuy}) ->
			LimitCount =:= 0 orelse HasBuy >= LimitCount
		end,
	  case lists:all(Fun, List) of
	    true ->
		{NRole, _, _} = do_rand(Role, Type),
		role:redirect(self(), 13403, {Type}),
		NRole;
	    _ -> Role
	  end
    end;
check_all_buy(Role, _) -> Role.

-spec flush(#role{}, pos_integer()) -> {ok, #role{}}.

flush(Role = #role{m_exchange =
		       MExchange = #m_shop{ref_time_list = RefTimeList,
					   items = Items}},
      Type = 16) ->
    Now = date:unixtime(),
    NextDiff =
	date:next_diff(exchange_data:get_const(treasure_time)) +
	  Now,
    NewRefTimeList = lists:keystore(Type, 1, RefTimeList,
				    {Type, 0, NextDiff}),
    NRole = Role#role{m_exchange =
			  MExchange#m_shop{ref_time_list = NewRefTimeList}},
    NewRole = case lists:keyfind(Type, 1, Items) of
		{_, _} ->
		    Count = get_mystery_count(NRole, 16),
		    FreeCount = get_mystery_free(NRole, 16),
		    Num = get_exchange_num(16),
		    {NRole1, List, _NewTime} = do_rand(NRole, 16),
		    sys_conn:pack_send(13403,
				       {Type, 1, <<>>, Count, FreeCount, Num,
					NextDiff, List}),
		    NRole1;
		_ -> NRole
	      end,
    Timer = #timer{id = {flush_exchange, Type},
		   m = exchange, f = flush, a = [Type],
		   timeout = max(4, NextDiff - Now) * 1000},
    {ok, role_timer:set(Timer, NewRole)};
flush(Role, _) -> {ok, Role}.

-spec add_exchange_free_num(#role{},
			    pos_integer()) -> {ok, #role{}}.

add_exchange_free_num(Role = #role{m_exchange =
				       MExchange = #m_shop{ref_time_list =
							       RefTimeList}},
		      Type)
    when Type == 43 orelse
	   Type == 34 orelse Type == 9 orelse Type == 4 ->
    Now = date:unixtime(),
    Interval = if Type == 9 ->
		      exchange_data:get_const(skill_recovery);
		  Type == 34 -> exchange_data:get_const(cluster_recovery);
		  Type == 43 ->
		      exchange_data:get_const(furniture_recovery);
		  Type == 4 -> exchange_data:get_const(number_recovery)
	       end,
    MaxFreeNum = if Type == 9 ->
			exchange_data:get_const(skill_refresh_free);
		    Type == 34 ->
			exchange_data:get_const(cluster_refresh_free);
		    Type == 43 ->
			exchange_data:get_const(furniture_refresh_free);
		    Type == 4 -> exchange_data:get_const(max_free_times)
		 end,
    RefNum = get_mystery_count(Role, Type),
    case lists:keyfind(Type, 1, RefTimeList) of
      {_, Num, RefTime} ->
	  AddNum = (Now - RefTime + Interval) div Interval,
	  RestTime = (Now - RefTime) rem Interval,
	  NewNum = min(MaxFreeNum, Num + AddNum),
	  NewRefTime = util:if_true(NewNum >= MaxFreeNum, 0,
				    Now + Interval - RestTime),
	  NewRefTimeList = lists:keystore(Type, 1, RefTimeList,
					  {Type, NewNum, NewRefTime}),
	  NRole = Role#role{m_exchange =
				MExchange#m_shop{ref_time_list =
						     NewRefTimeList}},
	  sys_conn:pack_send(13420,
			     {Type, RefNum, NewNum, NewRefTime}),
	  charge_mall:push_point(NRole),
	  case NewRefTime > 0 of
	    true ->
		Timer = #timer{id = {add_exchange_free_num, Type},
			       m = exchange, f = add_exchange_free_num,
			       a = [Type],
			       timeout = max(3, NewRefTime - Now) * 1000},
		{ok, role_timer:set(Timer, NRole)};
	    _ -> {ok, NRole}
	  end;
      _ ->
	  NewRefTimeList = lists:keystore(Type, 1, RefTimeList,
					  {Type, MaxFreeNum, 0}),
	  NRole = Role#role{m_exchange =
				MExchange#m_shop{ref_time_list =
						     NewRefTimeList}},
	  {ok, NRole}
    end;
add_exchange_free_num(Role, _) -> {ok, Role}.

set_exchange_timer(Role = #role{m_exchange =
				    MExchange = #m_shop{ref_time_list =
							    RefTimeList}},
		   Type = 16) ->
    Now = date:unixtime(),
    case lists:keyfind(Type, 1, RefTimeList) of
      {_, _, NextRefTime} ->
	  role_timer:set(#timer{id = {flush_exchange, Type},
				m = exchange, f = flush, a = [Type],
				timeout = max(4, NextRefTime - Now) * 1000},
			 Role);
      _ ->
	  NextDiff =
	      date:next_diff(exchange_data:get_const(treasure_time)),
	  NewRefTimeList = lists:keystore(Type, 1, RefTimeList,
					  {Type, 0, Now + NextDiff}),
	  NRole = Role#role{m_exchange =
				MExchange#m_shop{ref_time_list =
						     NewRefTimeList}},
	  role_timer:set(#timer{id = {flush_exchange, Type},
				m = exchange, f = flush, a = [Type],
				timeout = max(4, NextDiff) * 1000},
			 NRole)
    end;
set_exchange_timer(Role = #role{m_exchange =
				    MExchange = #m_shop{ref_time_list =
							    RefTimeList}},
		   Type)
    when Type == 43 orelse
	   Type == 34 orelse Type == 9 orelse Type == 4 ->
    MaxFreeNum = if Type == 9 ->
			exchange_data:get_const(skill_refresh_free);
		    Type == 34 ->
			exchange_data:get_const(cluster_refresh_free);
		    Type == 43 ->
			exchange_data:get_const(furniture_refresh_free);
		    Type == 4 -> exchange_data:get_const(max_free_times)
		 end,
    Now = date:unixtime(),
    case lists:keyfind(Type, 1, RefTimeList) of
      {_, Num, _} when Num >= MaxFreeNum -> Role;
      {_, _, NextRefTime} ->
	  role_timer:set(#timer{id =
				    {add_exchange_free_num, Type},
				m = exchange, f = add_exchange_free_num,
				a = [Type],
				timeout = max(3, NextRefTime - Now) * 1000},
			 Role);
      _ ->
	  NewRefTimeList = lists:keystore(Type, 1, RefTimeList,
					  {Type, MaxFreeNum, 0}),
	  Role#role{m_exchange =
			MExchange#m_shop{ref_time_list = NewRefTimeList}}
    end;
set_exchange_timer(Role, _) -> Role.

get_exchange_num(4) ->
    exchange_data:get_const(mall_def);
get_exchange_num(2) ->
    exchange_data:get_const(soul_def);
get_exchange_num(16) ->
    exchange_data:get_const(treasure_plaid);
get_exchange_num(9) -> 6;
get_exchange_num(34) ->
    exchange_data:get_const(cluster_commodity_num);
get_exchange_num(43) -> 6;
get_exchange_num(_) -> 0.

get_mystery_count(Role, 4) ->
    var:get_var(Role, day, 52, 0);
get_mystery_count(Role, 2) ->
    var:get_var(Role, day, 53, 0);
get_mystery_count(Role, 16) ->
    var:get_var(Role, day, 54, 0);
get_mystery_count(Role, 9) ->
    var:get_var(Role, day, 69, 0);
get_mystery_count(Role, 34) ->
    var:get_var(Role, day, 81, 0);
get_mystery_count(Role, 43) ->
    var:get_var(Role, day, 96, 0);
get_mystery_count(_Role, _) -> 0.

set_mystery_count(Role, 4, RefCount) ->
    var:set_var(Role, day, 52, RefCount);
set_mystery_count(Role, 2, RefCount) ->
    var:set_var(Role, day, 53, RefCount);
set_mystery_count(Role, 16, RefCount) ->
    var:set_var(Role, day, 54, RefCount);
set_mystery_count(Role, 9, RefCount) ->
    var:set_var(Role, day, 69, RefCount);
set_mystery_count(Role, 34, RefCount) ->
    var:set_var(Role, day, 81, RefCount);
set_mystery_count(Role, 43, RefCount) ->
    var:set_var(Role, day, 96, RefCount);
set_mystery_count(Role, _Type, _RefCount) -> Role.

get_ref_max_count(_Role, 4) ->
    exchange_data:get_const(maximum_number);
get_ref_max_count(_Role, 9) ->
    exchange_data:get_const(skill_refresh_number);
get_ref_max_count(_Role, 34) ->
    exchange_data:get_const(cluster_refresh_number);
get_ref_max_count(_Role, 43) ->
    exchange_data:get_const(furniture_refresh_number);
get_ref_max_count(_, _Type) -> 99999.

get_ref_item(4) -> exchange_data:get_const(cost_item);
get_ref_item(_) -> 0.

get_ref_expend(Type, _RefCount) ->
    exchange_data:get_cost_list(Type).

get_mystery_free(#role{m_exchange =
			   #m_shop{ref_time_list = RefTimeList}},
		 Type = 4) ->
    case lists:keyfind(Type, 1, RefTimeList) of
      {_, FreeNum, _} -> FreeNum;
      _ -> exchange_data:get_const(max_free_times)
    end;
get_mystery_free(#role{m_exchange =
			   #m_shop{ref_time_list = RefTimeList}},
		 Type = 9) ->
    case lists:keyfind(Type, 1, RefTimeList) of
      {_, FreeNum, _} -> FreeNum;
      _ -> exchange_data:get_const(skill_refresh_free)
    end;
get_mystery_free(#role{m_exchange =
			   #m_shop{ref_time_list = RefTimeList}},
		 Type = 34) ->
    case lists:keyfind(Type, 1, RefTimeList) of
      {_, FreeNum, _} -> FreeNum;
      _ -> exchange_data:get_const(cluster_refresh_free)
    end;
get_mystery_free(#role{m_exchange =
			   #m_shop{ref_time_list = RefTimeList}},
		 Type = 43) ->
    case lists:keyfind(Type, 1, RefTimeList) of
      {_, FreeNum, _} -> FreeNum;
      _ -> exchange_data:get_const(furniture_refresh_free)
    end;
get_mystery_free(_Role, _) -> 0.

get_mystery_refresh_time(_Role, 16) ->
    date:next_diff(exchange_data:get_const(treasure_time)) +
      date:unixtime();
get_mystery_refresh_time(#role{m_exchange =
				   #m_shop{ref_time_list = RefTimeList}},
			 Type)
    when Type == 43 orelse
	   Type == 34 orelse Type == 9 orelse Type == 4 ->
    case lists:keyfind(Type, 1, RefTimeList) of
      {_, _, RefTime} -> RefTime;
      _ -> 0
    end;
get_mystery_refresh_time(_, _) -> 0.

set_mystery_free(Role = #role{m_exchange =
				  MExchange = #m_shop{ref_time_list =
							  RefTimeList}},
		 Type = 4, RefCount) ->
    OldRefTime = get_mystery_refresh_time(Role, Type),
    RefTime = util:if_true(OldRefTime > 0, OldRefTime,
			   date:unixtime() +
			     exchange_data:get_const(number_recovery)),
    NewRefTimeList = lists:keystore(Type, 1, RefTimeList,
				    {Type, RefCount - 1, RefTime}),
    NRole = Role#role{m_exchange =
			  MExchange#m_shop{ref_time_list = NewRefTimeList}},
    set_exchange_timer(NRole, Type);
set_mystery_free(Role = #role{m_exchange =
				  MExchange = #m_shop{ref_time_list =
							  RefTimeList}},
		 Type = 9, RefCount) ->
    OldRefTime = get_mystery_refresh_time(Role, Type),
    RefTime = util:if_true(OldRefTime > 0, OldRefTime,
			   date:unixtime() +
			     exchange_data:get_const(skill_recovery)),
    NewRefTimeList = lists:keystore(Type, 1, RefTimeList,
				    {Type, RefCount - 1, RefTime}),
    NRole = Role#role{m_exchange =
			  MExchange#m_shop{ref_time_list = NewRefTimeList}},
    set_exchange_timer(NRole, Type);
set_mystery_free(Role = #role{m_exchange =
				  MExchange = #m_shop{ref_time_list =
							  RefTimeList}},
		 Type = 34, RefCount) ->
    OldRefTime = get_mystery_refresh_time(Role, Type),
    RefTime = util:if_true(OldRefTime > 0, OldRefTime,
			   date:unixtime() +
			     exchange_data:get_const(cluster_recovery)),
    NewRefTimeList = lists:keystore(Type, 1, RefTimeList,
				    {Type, RefCount - 1, RefTime}),
    NRole = Role#role{m_exchange =
			  MExchange#m_shop{ref_time_list = NewRefTimeList}},
    set_exchange_timer(NRole, Type);
set_mystery_free(Role = #role{m_exchange =
				  MExchange = #m_shop{ref_time_list =
							  RefTimeList}},
		 Type = 43, RefCount) ->
    OldRefTime = get_mystery_refresh_time(Role, Type),
    RefTime = util:if_true(OldRefTime > 0, OldRefTime,
			   date:unixtime() +
			     exchange_data:get_const(furniture_recovery)),
    NewRefTimeList = lists:keystore(Type, 1, RefTimeList,
				    {Type, RefCount - 1, RefTime}),
    NRole = Role#role{m_exchange =
			  MExchange#m_shop{ref_time_list = NewRefTimeList}},
    set_exchange_timer(NRole, Type);
set_mystery_free(Role, _Type, _RefCount) -> Role.

set_buy_num(_, Acc, 0) -> Acc;
set_buy_num(#exchange_data{id = EId,
			   limit_day = LimitDay},
	    Acc, Num)
    when LimitDay > 0 ->
    [{EId, [{1, Num}]} | Acc];
set_buy_num(#exchange_data{id = EId,
			   limit_week = LimitWeek},
	    Acc, Num)
    when LimitWeek > 0 ->
    [{EId, [{2, Num}]} | Acc];
set_buy_num(#exchange_data{id = EId,
			   limit_month = LimitMonth},
	    Acc, Num)
    when LimitMonth > 0 ->
    [{EId, [{3, Num}]} | Acc];
set_buy_num(#exchange_data{id = EId,
			   limit_count = LimitCount},
	    Acc, Num)
    when LimitCount > 0 ->
    [{EId, [{5, Num}]} | Acc];
set_buy_num(_, Acc, _Num) -> Acc.

get_buy_num(#exchange_data{type = 6, id = EId,
			   limit_day = LimitDay,
			   open_srv_timestamp = TimeStamp},
	    Role)
    when LimitDay > 0 ->
    case game_lib:server_open_time(ms) > TimeStamp of
      true when TimeStamp > 0 ->
	  exchange_lib:get_val(Role, EId);
      _ -> 0
    end;
get_buy_num(#exchange_data{type = 6, id = EId,
			   limit_week = LimitWeek,
			   open_srv_timestamp = TimeStamp},
	    Role)
    when LimitWeek > 0 ->
    case game_lib:server_open_time(ms) > TimeStamp of
      true when TimeStamp > 0 ->
	  exchange_lib:get_tmp_week(Role, EId);
      _ -> 0
    end;
get_buy_num(#exchange_data{type = 6, id = EId,
			   limit_month = LimitMonth,
			   open_srv_timestamp = TimeStamp},
	    Role)
    when LimitMonth > 0 ->
    case game_lib:server_open_time(ms) > TimeStamp of
      true when TimeStamp > 0 ->
	  exchange_lib:get_tmp_month(Role, EId);
      _ -> 0
    end;
get_buy_num(#exchange_data{type = 6, id = EId,
			   limit_count = LimitCount,
			   open_srv_timestamp = TimeStamp},
	    Role)
    when LimitCount > 0 ->
    case game_lib:server_open_time(ms) > TimeStamp of
      true when TimeStamp > 0 ->
	  exchange_lib:get_tmp_other(Role, EId);
      _ -> 0
    end;
get_buy_num(#exchange_data{id = EId,
			   limit_day = LimitDay},
	    Role)
    when LimitDay > 0 ->
    exchange_lib:get_val(Role, EId);
get_buy_num(#exchange_data{id = EId,
			   limit_week = LimitWeek},
	    Role)
    when LimitWeek > 0 ->
    exchange_lib:get_tmp_week(Role, EId);
get_buy_num(#exchange_data{id = EId,
			   limit_month = LimitMonth},
	    Role)
    when LimitMonth > 0 ->
    exchange_lib:get_tmp_month(Role, EId);
get_buy_num(#exchange_data{id = EId,
			   limit_count = LimitCount},
	    Role)
    when LimitCount > 0 ->
    exchange_lib:get_tmp_other(Role, EId);
get_buy_num(#exchange_ref{id = EId,
			  limit_day = LimitDay},
	    Role)
    when LimitDay > 0 ->
    exchange_lib:get_val(Role, EId);
get_buy_num(#exchange_ref{id = EId,
			  limit_week = LimitWeek},
	    Role)
    when LimitWeek > 0 ->
    exchange_lib:get_tmp_week(Role, EId);
get_buy_num(#exchange_ref{id = EId,
			  limit_month = LimitMonth},
	    Role)
    when LimitMonth > 0 ->
    exchange_lib:get_tmp_month(Role, EId);
get_buy_num(_, _Role) -> 0.

get_hd_buy_num(#exchange_data{id = EId,
			      limit_count = LimitCount},
	       Role, #holiday{camp_id = CampId, bid = Bid})
    when LimitCount > 0 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    Num = list_util:keyfind(EId, Lists, 0),
    Num;
get_hd_buy_num(ExchangeData, Role, _) ->
    get_buy_num(ExchangeData, Role).

add_buy_num(#exchange_data{type = 6, id = EId,
			   limit_day = LimitDay,
			   open_srv_timestamp = TimeStamp},
	    Role, Count)
    when LimitDay > 0 ->
    case game_lib:server_open_time(ms) > TimeStamp of
      true when TimeStamp > 0 ->
	  exchange_lib:set_val(Role, EId, Count);
      _ -> Role
    end;
add_buy_num(#exchange_data{type = 6, id = EId,
			   limit_week = LimitWeek,
			   open_srv_timestamp = TimeStamp},
	    Role, Count)
    when LimitWeek > 0 ->
    case game_lib:server_open_time(ms) > TimeStamp of
      true when TimeStamp > 0 ->
	  exchange_lib:set_one_week(Role, EId, Count);
      _ -> Role
    end;
add_buy_num(#exchange_data{type = 6, id = EId,
			   limit_month = LimitMonth,
			   open_srv_timestamp = TimeStamp},
	    Role, Count)
    when LimitMonth > 0 ->
    case game_lib:server_open_time(ms) > TimeStamp of
      true when TimeStamp > 0 ->
	  exchange_lib:set_one_month(Role, EId, Count);
      _ -> Role
    end;
add_buy_num(#exchange_data{type = 6, id = EId,
			   limit_count = LimitCount,
			   open_srv_timestamp = TimeStamp},
	    Role, Count)
    when LimitCount > 0 ->
    case game_lib:server_open_time(ms) > TimeStamp of
      true when TimeStamp > 0 ->
	  exchange_lib:set_tmp_other(Role, EId, Count);
      _ -> Role
    end;
add_buy_num(#exchange_data{id = EId,
			   limit_day = LimitDay},
	    Role, Count)
    when LimitDay > 0 ->
    exchange_lib:set_val(Role, EId, Count);
add_buy_num(#exchange_data{id = EId,
			   limit_week = LimitWeek},
	    Role, Count)
    when LimitWeek > 0 ->
    exchange_lib:set_one_week(Role, EId, Count);
add_buy_num(#exchange_data{id = EId,
			   limit_month = LimitMonth},
	    Role, Count)
    when LimitMonth > 0 ->
    exchange_lib:set_one_month(Role, EId, Count);
add_buy_num(#exchange_data{id = EId,
			   limit_count = LimitCount},
	    Role, Count)
    when LimitCount > 0 ->
    exchange_lib:set_tmp_other(Role, EId, Count);
add_buy_num(#exchange_ref{id = EId,
			  limit_day = LimitDay},
	    Role, Count)
    when LimitDay > 0 ->
    exchange_lib:set_val(Role, EId, Count);
add_buy_num(#exchange_ref{id = EId,
			  limit_week = LimitWeek},
	    Role, Count)
    when LimitWeek > 0 ->
    exchange_lib:set_one_week(Role, EId, Count);
add_buy_num(#exchange_ref{id = EId,
			  limit_month = LimitMonth},
	    Role, Count)
    when LimitMonth > 0 ->
    exchange_lib:set_one_month(Role, EId, Count);
add_buy_num(_, Role, _Count) -> Role.

add_hd_buy_num(#exchange_data{id = EId,
			      limit_count = LimitCount},
	       Role, Count,
	       Holiday = #holiday{camp_id = CampId, bid = Bid})
    when LimitCount > 0 ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    NewList = lists:keystore(EId, 1, Lists, {EId, Count}),
    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
    holiday_lib:set_tv_val(CampId, Role, NewList,
			   ExpireSec);
add_hd_buy_num(ExchangeData, Role, Count, _) ->
    add_buy_num(ExchangeData, Role, Count).

get_limit_num(#exchange_data{type = 6,
			     limit_day = LimitDay,
			     open_srv_timestamp = TimeStamp})
    when LimitDay > 0 ->
    case game_lib:server_open_time(ms) > TimeStamp of
      true when TimeStamp > 0 -> LimitDay;
      _ -> 0
    end;
get_limit_num(#exchange_data{type = 6,
			     limit_week = LimitWeek,
			     open_srv_timestamp = TimeStamp})
    when LimitWeek > 0 ->
    case game_lib:server_open_time(ms) > TimeStamp of
      true when TimeStamp > 0 -> LimitWeek;
      _ -> 0
    end;
get_limit_num(#exchange_data{type = 6,
			     limit_month = LimitMonth,
			     open_srv_timestamp = TimeStamp})
    when LimitMonth > 0 ->
    case game_lib:server_open_time(ms) > TimeStamp of
      true when TimeStamp > 0 -> LimitMonth;
      _ -> 0
    end;
get_limit_num(#exchange_data{type = 6,
			     limit_count = LimitCount,
			     open_srv_timestamp = TimeStamp})
    when LimitCount > 0 ->
    case game_lib:server_open_time(ms) > TimeStamp of
      true when TimeStamp > 0 -> LimitCount;
      _ -> 0
    end;
get_limit_num(#exchange_data{limit_day = LimitDay})
    when LimitDay > 0 ->
    LimitDay;
get_limit_num(#exchange_data{limit_week = LimitWeek})
    when LimitWeek > 0 ->
    LimitWeek;
get_limit_num(#exchange_data{limit_month = LimitMonth})
    when LimitMonth > 0 ->
    LimitMonth;
get_limit_num(#exchange_data{limit_count = LimitCount})
    when LimitCount > 0 ->
    LimitCount;
get_limit_num(#exchange_ref{limit_day = LimitDay})
    when LimitDay > 0 ->
    LimitDay;
get_limit_num(#exchange_ref{limit_week = LimitWeek})
    when LimitWeek > 0 ->
    LimitWeek;
get_limit_num(#exchange_ref{limit_month = LimitMonth})
    when LimitMonth > 0 ->
    LimitMonth;
get_limit_num(_) -> 0.

get_open_lev(1) ->
    exchange_data:get_const(open_gold_lev);
get_open_lev(2) ->
    exchange_data:get_const(open_hero_soul_lev);
get_open_lev(3) ->
    exchange_data:get_const(open_point_lev);
get_open_lev(4) ->
    exchange_data:get_const(open_secret_lev);
get_open_lev(5) ->
    exchange_data:get_const(open_guild_lev);
get_open_lev(6) ->
    exchange_data:get_const(open_arena_cent_lev);
get_open_lev(7) ->
    exchange_data:get_const(open_god_point_lev);
get_open_lev(9) ->
    exchange_data:get_const(open_skill_lev);
get_open_lev(_) -> 0.

get_msg(#exchange_data{limit_day = LimitDay})
    when LimitDay > 0 ->
    {false,
     lang:get(<<"Số lần mua trong ngày vượt quá giới "
		"hạn"/utf8>>)};
get_msg(#exchange_data{limit_week = LimitWeek})
    when LimitWeek > 0 ->
    {false,
     lang:get(<<"Số lần mua vượt quá giới hạn số lần "
		"trong tuần"/utf8>>)};
get_msg(#exchange_data{limit_month = LimitMonth})
    when LimitMonth > 0 ->
    {false,
     lang:get(<<"Số lần mua vượt quá giới hạn số lần "
		"trong tháng"/utf8>>)};
get_msg(#exchange_data{limit_count = LimitCount})
    when LimitCount > 0 ->
    {false,
     lang:get(<<"Số lần mua vượt quá giới hạn"/utf8>>)};
get_msg(_) ->
    {false, lang:get(<<"Số lần mua không đủ"/utf8>>)}.

get_log_exchange_name(1) ->
    lang:get(<<"Cửa hàng vật phẩm"/utf8>>);
get_log_exchange_name(2) ->
    lang:get(<<"Cửa hàng anh hùng"/utf8>>);
get_log_exchange_name(3) ->
    lang:get(<<"Cửa hàng điểm thưởng"/utf8>>);
get_log_exchange_name(4) ->
    lang:get(<<"Cửa hàng tạp hóa"/utf8>>);
get_log_exchange_name(5) ->
    lang:get(<<"Cửa hàng liên minh"/utf8>>);
get_log_exchange_name(6) ->
    lang:get(<<"Cửa hàng thi đấu"/utf8>>);
get_log_exchange_name(8) ->
    lang:get(<<"Cửa hàng viễn chinh"/utf8>>);
get_log_exchange_name(9) ->
    lang:get(<<"Cửa hàng kỹ năng"/utf8>>);
get_log_exchange_name(16) ->
    lang:get(<<"Cửa hàng khám phá bảo vật"/utf8>>);
get_log_exchange_name(17) ->
    lang:get(<<"Cửa hàng cấp bậc"/utf8>>);
get_log_exchange_name(18) ->
    lang:get(<<"Cửa hàng skin"/utf8>>);
get_log_exchange_name(28) ->
    lang:get(<<"Cửa hàng trang bị thần"/utf8>>);
get_log_exchange_name(30) ->
    lang:get(<<"Cửa hàng thang thiên đường liên server"/utf8>>);
get_log_exchange_name(31) ->
    lang:get(<<"Cửa hàng tiên tri"/utf8>>);
get_log_exchange_name(34) ->
    lang:get(<<"Cửa hàng đấu trường liên server"/utf8>>);
get_log_exchange_name(36) ->
    lang:get(<<"Cửa hàng vô địch liên server"/utf8>>);
get_log_exchange_name(37) ->
    lang:get(<<"Cửa hàng đỉnh cao"/utf8>>);
get_log_exchange_name(41) ->
    lang:get(<<"Cửa hàng nội thất gia viên"/utf8>>);
get_log_exchange_name(42) ->
    lang:get(<<"Cửa hàng di chuyển gia viên"/utf8>>);
get_log_exchange_name(43) ->
    lang:get(<<"Cửa hàng ngẫu nhiên gia viên"/utf8>>);
get_log_exchange_name(51) ->
    lang:get(<<"Thánh Vũ - Cửa hàng anh hùng"/utf8>>);
get_log_exchange_name(52) ->
    lang:get(<<"Thánh Vũ - Cửa hàng trang bị thần"/utf8>>);
get_log_exchange_name(53) ->
    lang:get(<<"Cửa hàng anh hồn"/utf8>>);
get_log_exchange_name(80) ->
    lang:get(<<"Cửa hàng kỳ cảnh"/utf8>>);
get_log_exchange_name(_) ->
    lang:get(<<"Thêm mới cửa hàng"/utf8>>).

-spec exchange_soul(#role{}, pos_integer()) -> {false,
						binary()} |
					       {ok, #role{}}.

exchange_soul(_Role, Num)
    when is_integer(Num) andalso Num =< 0 ->
    {false, lang:get(<<"Số lượng đổi bị lỗi"/utf8>>)};
exchange_soul(Role, Num) ->
    Cost = util:uceil(Num / 10),
    Soul = Cost * 10,
    Loss = format:val_to_loss([{3, Cost}], exchange_soul),
    GL = format:val_to_gain([{11, Soul}], exchange_soul),
    AllGL = Loss ++ GL,
    case role_gain:do(Role, AllGL) of
      {false, #loss{msg = Msg}} -> {false, Msg};
      {ok, NRole} ->
	  log:log_gain(AllGL, Role, NRole, <<"Đổi tài sản"/utf8>>,
		       util:fbin("Thiếu thần cách để đổi:~w", [Num])),
	  {ok, NRole}
    end.

gm_test_refresh(_Role, _ExchangeType, Num,
		{BidL, QualityL})
    when Num =< 0 ->
    {BidL, QualityL};
gm_test_refresh(Role, ExchangeType, Num, Result) ->
    List = myrand(ExchangeType, Role),
    Fun = fun (#exchange_ref{item_bid = Bid, type = Type},
	       {BidL, QualityL}) ->
		  {_, Num1} = list_util:keyfind(Bid, 1, BidL, {Bid, 0}),
		  {_, Num2} = list_util:keyfind(Type, 1, QualityL,
						{Type, 0}),
		  NewBidL = lists:keystore(Bid, 1, BidL, {Bid, Num1 + 1}),
		  NewQualityL = lists:keystore(Type, 1, QualityL,
					       {Type, Num2 + 1}),
		  {NewBidL, NewQualityL}
	  end,
    NewResult = lists:foldl(Fun, Result, List),
    gm_test_refresh(Role, ExchangeType, Num - 1, NewResult).

get_holiday_exchange(Holiday = #holiday{tbid = 3040},
		     Role) ->
    TypeList = exchange_data:list_by_type(80),
    Fun = fun (ExchangeData = #exchange_data{id = Aim,
					     item_name = BStr,
					     pay_type = PayType,
					     price = ExpendNum,
					     item_bid = ItemBid,
					     item_num = ItemNum,
					     buy_stage = Stage},
	       Acc) ->
		  ExpendId = util:if_true(is_integer(PayType), PayType,
					  item_data:assets_atom2code(PayType)),
		  LimitNum = get_limit_num(ExchangeData),
		  Num = get_hd_buy_num(ExchangeData, Role, Holiday),
		  LimitType = get_limit_type(ExchangeData),
		  IsOpen = util:if_true(Stage =:= 0 orelse
					  monopoly_maps:check_stage_finish(Role,
									   Stage),
					1, 0),
		  Extend = [{1, Stage, <<>>}, {2, LimitType, <<>>},
			    {3, IsOpen, <<>>}],
		  [{Aim, BStr, Num, LimitNum, 0, ExpendId, ExpendNum,
		    [{ItemBid, ItemNum}], Extend}
		   | Acc]
	  end,
    ExchangeList = lists:foldl(Fun, [], TypeList),
    ExchangeList;
get_holiday_exchange(_, _) -> [].

get_limit_type(#exchange_data{limit_day = LimitDay})
    when LimitDay > 0 ->
    1;
get_limit_type(#exchange_data{limit_week = LimitWeek})
    when LimitWeek > 0 ->
    2;
get_limit_type(#exchange_data{limit_month = LimitMonth})
    when LimitMonth > 0 ->
    3;
get_limit_type(#exchange_data{limit_count = LimitCount})
    when LimitCount > 0 ->
    4;
get_limit_type(_) -> 0.

get_holiday_buy_num(EId, Role,
		    Holiday = #holiday{tbid = 3040}) ->
    case exchange_data:get_by_eid(EId) of
      ExchangeData = #exchange_data{} ->
	  get_hd_buy_num(ExchangeData, Role, Holiday);
      _ -> 0
    end;
get_holiday_buy_num(EId, Role,
		    #holiday{camp_id = CampId, bid = Bid}) ->
    Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
    list_util:keyfind(EId, Lists, 0).


