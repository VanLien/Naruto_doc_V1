-file("data/adventure_action.erl", 1).

-file("src/mod/adventure/adventure_action.erl", 1).

-module(adventure_action).

-lager_records([{g_mem_red_packet,
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
		{violators_record, [id, name, lists]},
		{say_history, [id, clear_time, lists]},
		{say_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{say_frame, [ver, base_id, expire_time]},
		{m_say, [ver, used, frames]},
		{say_subtitle_msg, [id, role_id, name, msg, time]},
		{say_subtitle_role, [pid, conn_pid, type]},
		{say_msg, [len, msg, tick]},
		{say_send,
		 [id, name, sex, career, lev, face_id, vip_lev, capacity,
		  head_bid, chat_bubble, msg_list, face_update_time,
		  face_file]},
		{say_mon,
		 [rid, srv_id, name, ctime, lev, vip_lev, msg, remark]},
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
		{buff_data,
		 [bid, name, type, time_type, group, effect, seconds]},
		{role_buff, [ver, buff_list]},
		{role_buff_data, [bid, group, effect, end_time]},
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

-export([do_evt/2, combat_over/4, rand_good/2]).

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

-file("src/mod/adventure/adventure_action.erl", 13).

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

-file("src/mod/adventure/adventure_action.erl", 14).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/adventure/adventure_action.erl", 15).

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

-file("src/mod/adventure/adventure_action.erl", 16).

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

-file("src/mod/adventure/adventure_action.erl", 17).

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

-file("src/mod/adventure/adventure_action.erl", 18).

-file("inc/log.hrl", 1).

-file("src/mod/adventure/adventure_action.erl", 19).

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

-file("src/mod/adventure/adventure_action.erl", 20).

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

-file("src/mod/adventure/adventure_action.erl", 21).

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

-file("src/mod/adventure/adventure_action.erl", 22).

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

-file("src/mod/adventure/adventure_action.erl", 23).

-file("inc/buff.hrl", 1).

-record(role_buff_data,
	{bid, group, effect = [], end_time}).

-record(role_buff,
	{ver = 1, buff_list = []  :: [#role_buff_data{}]}).

-record(buff_data,
	{bid, name, type, time_type, group, effect = [],
	 seconds}).

-file("src/mod/adventure/adventure_action.erl", 24).

-file("inc/game_assets.hrl", 1).

-file("src/mod/adventure/adventure_action.erl", 25).

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

-file("src/mod/adventure/adventure_action.erl", 26).

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

-file("src/mod/adventure/adventure_action.erl", 27).

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

-file("src/mod/adventure/adventure_action.erl", 28).

-file("inc/say.hrl", 1).

-record(say_mon,
	{rid = 0  :: pos_integer(), srv_id = <<>>  :: binary(),
	 name = <<>>  :: bitstring(),
	 ctime = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 msg = <<>>  :: binary(), remark = <<>>  :: binary()}).

-record(say_send,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 lev = 0, face_id = 0, vip_lev = 0, capacity = 0,
	 head_bid = 0, chat_bubble = 0, msg_list = [],
	 face_update_time = 0, face_file = <<>>}).

-record(say_msg, {len = 0, msg = <<>>, tick = 0}).

-record(say_subtitle_role,
	{pid = 0  :: 0 | pid(), conn_pid = 0  :: 0 | pid(),
	 type = 0  :: integer()}).

-record(say_subtitle_msg,
	{id = 0  :: non_neg_integer(),
	 role_id = {0, <<>>}  ::
	     {non_neg_integer(), bitstring()},
	 name = <<>>  :: bitstring(), msg = <<>>  :: bitstring(),
	 time = 0  :: non_neg_integer()}).

-record(m_say, {ver = 1, used = 0, frames = []}).

-record(say_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(say_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-record(say_history,
	{id = {0, <<>>}, clear_time = 0, lists = []}).

-record(violators_record,
	{id = {0, <<>>}, name = <<>>, lists = []}).

-file("src/mod/adventure/adventure_action.erl", 29).

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

-file("src/mod/adventure/adventure_action.erl", 30).

-spec rand_good(#role{}, list()) -> tuple().

rand_good(#role{m_adventure =
		    #m_adventure{shop_list = ShopList}},
	  List) ->
    NewList = [I
	       || I = {Id, _} <- List,
		  check_good_can_out(adventure_data:get_exch(Id),
				     ShopList)],
    util:rand_list(NewList, 2);
rand_good(ShopList, List) ->
    NewList = [I
	       || I = {Id, _} <- List,
		  check_good_can_out(adventure_data:get_exch(Id),
				     ShopList)],
    util:rand_list(NewList, 2).

check_good_can_out(#{good_group := Group,
		     round_max := Max},
		   ShopList)
    when Max > 0 ->
    Max >
      length([1
	      || #{exec_id := Id} <- ShopList,
		 maps:get(good_group, adventure_data:get_exch(Id), 0) =:=
		   Group]);
check_good_can_out(_, _) -> true.

-spec do_evt(#role{}, #{}) -> ok | {ok, #role{}} |
			      {false, binary()}.

do_evt(Role = #role{m_adventure =
			#m_adventure{boss_room = BossRoom,
				     room_list = RoomList}},
       Args = #{room_id := RoomId, ext := ExtList}) ->
    IsPid = util:get(adventure_is_combat, 0),
    IsAutoGet = list_util:keyfind(4, ExtList, 0),
    case combat_lib:in_type_combat(Role, 6) of
      true -> {false, lang:get(<<"Chiến đấu"/utf8>>)};
      false when is_pid(IsPid) andalso IsAutoGet =:= 0 ->
	  {false,
	   lang:get(<<"Trận chiến đang diễn ra. Vui lòng đợi."/utf8>>)};
      false ->
	  case lists:keyfind(RoomId, #a_room.id, RoomList) of
	    false ->
		{false,
		 lang:get(<<"Không tìm thấy thông tin, không cho "
			    "phép phiêu lưu"/utf8>>)};
	    Room = #a_room{id = BossRoom, status = 3} ->
		do_evt_(Role, Room,
			adventure_data:get_evt(adventure_data:get_const(next_floor_evt_id)),
			Args);
	    Room = #a_room{evt_id = EvtId} ->
		do_evt_(Role, Room, adventure_data:get_evt(EvtId), Args)
	  end
    end.

do_evt_(_Role, #a_room{status = 2, ext = MonPList},
	#{evt_type := boss}, #{action := 0}) ->
    HpPer = case MonPList of
	      [{_, HpPer0}] -> HpPer0;
	      _ -> 100
	    end,
    sys_conn:pack_send(20624, {HpPer}),
    ok;
do_evt_(Role = #role{power = Power, lev = Lev,
		     m_adventure =
			 MAdventure = #m_adventure{partner_id = PartnerId,
						   id = Id}},
	#a_room{id = RoomId, evt_id = EvtId, status = 2,
		ext = MonPList0},
	Evt = #{evt_type := boss, unit_id := UnitId},
	Ext = #{action := 1, ext := ExtList}) ->
    DefPower = maps:get(power, Evt, 0),
    PId = list_util:keyfind(1, ExtList, PartnerId),
    IsAuto = list_util:keyfind(2, ExtList, 0),
    IsContinue = list_util:keyfind(3, ExtList, 0),
    case gen_fight_object(Role, PId) of
      {false, Reason} -> {false, Reason};
      {true, FO} ->
	  case unit_monster:gen_fight_objects(Lev, UnitId) of
	    [] ->
		{false, lang:get(<<"Vấn đề cấu hình quái vật"/utf8>>)};
	    [DefendList0] ->
		{ok, CombatRole0} = role_convert:do(combat_role, Role),
		{CombatRole, IsRobot} = case
					  adventure_data:get_floor(Id)
					    of
					  #{auto_combat := 1}
					      when IsAuto =:= 1 ->
					      {CombatRole0#combat_role{is_offline
									   =
									   true,
								       watching
									   = 0},
					       1};
					  _ -> {CombatRole0, 0}
					end,
		MonPList = case MonPList0 of
			     [{0, 0}] -> [{0, 1}];
			     _ -> MonPList0
			   end,
		OldRound = util:get(adventure_combat_round, 0),
		put(adventure_combat_round, OldRound + 1),
		put(adventure_combat_args,
		    {Evt, Ext, IsAuto, IsContinue}),
		ShowPanel = util:if_true(IsContinue =:= 1, false, true),
		DefendList =
		    combat_lib:init_fight_object_hp(DefendList0, MonPList),
		#unit_data{name = TargetName,
			   formation = {FormationType, FormationLev}} =
		    unit_data:get(UnitId),
		Args = #{on_role_combat_end =>
			     {adventure_action, combat_over,
			      [{boss, RoomId, EvtId}]},
			 attack_power => Power, defend_power => DefPower,
			 target_role_name => TargetName,
			 formation =>
			     [{1, FormationType, FormationLev},
			      {2, FormationType, FormationLev}],
			 combat_role => CombatRole, is_robot => IsRobot,
			 ext_args => [{is_show_panel, ShowPanel}],
			 other_arge =>
			     [{room_id, RoomId}, {ext_list, ExtList}]},
		case combat_lib:start_combat(Role, 6, [FO],
					     [DefendList], Args)
		    of
		  {false, Reason} -> {false, Reason};
		  {ok, ComPid} ->
		      put(adventure_is_combat, ComPid),
		      {pass,
		       Role#role{m_adventure =
				     MAdventure#m_adventure{partner_id = PId}}}
		end
	  end
    end;
do_evt_(Role = #role{m_adventure =
			 #m_adventure{id = Id}},
	#a_room{status = 3}, #{evt_type := next},
	#{action := 1}) ->
    case adventure:goto_floor(Role, Id + 1, 0, evt_next) of
      {ok, NRole} -> {pass, NRole};
      Ret -> Ret
    end;
do_evt_(_Role, #a_room{status = 2, ext = MonPList},
	#{evt_type := EvtType}, #{action := 0})
    when EvtType =:= mon orelse
	   EvtType =:= mon2 orelse
	     EvtType =:= mon3 orelse EvtType =:= mon4 ->
    HpPer = case MonPList of
	      [{_, HpPer0}] -> HpPer0;
	      _ -> 100
	    end,
    sys_conn:pack_send(20624, {HpPer}),
    ok;
do_evt_(Role = #role{power = Power, lev = Lev,
		     m_adventure =
			 MAdventure = #m_adventure{partner_id = PartnerId,
						   id = Id}},
	#a_room{id = RoomId, evt_id = EvtId, status = 2,
		ext = MonPList0},
	Evt = #{evt_type := EvtType, unit_id := UnitId},
	Ext = #{action := 1, ext := ExtList})
    when EvtType =:= mon orelse
	   EvtType =:= mon2 orelse
	     EvtType =:= mon3 orelse EvtType =:= mon4 ->
    PId = list_util:keyfind(1, ExtList, PartnerId),
    IsAuto = list_util:keyfind(2, ExtList, 0),
    IsContinue = list_util:keyfind(3, ExtList, 0),
    case gen_fight_object(Role, PId) of
      {false, Reason} -> {false, Reason};
      {true, FO} ->
	  case unit_monster:gen_fight_objects(Lev, UnitId) of
	    [] ->
		{false, lang:get(<<"Vấn đề cấu hình quái vật"/utf8>>)};
	    [DefendList0] ->
		DefPower = maps:get(power, Evt, 0),
		MonPList = case MonPList0 of
			     [{0, 0}] -> [{0, 1}];
			     _ -> MonPList0
			   end,
		{ok, CombatRole0} = role_convert:do(combat_role, Role),
		{CombatRole, IsRobot} = case
					  adventure_data:get_floor(Id)
					    of
					  #{auto_combat := 1}
					      when IsAuto =:= 1 ->
					      {CombatRole0#combat_role{is_offline
									   =
									   true,
								       watching
									   = 0},
					       1};
					  _ -> {CombatRole0, 0}
					end,
		OldRound = util:get(adventure_combat_round, 0),
		put(adventure_combat_round, OldRound + 1),
		put(adventure_combat_args,
		    {Evt, Ext, IsAuto, IsContinue}),
		ShowPanel = util:if_true(IsContinue =:= 1, false, true),
		#unit_data{name = TargetName,
			   formation = {FormationType, FormationLev}} =
		    unit_data:get(UnitId),
		Args = #{on_role_combat_end =>
			     {adventure_action, combat_over,
			      [{mon, RoomId, EvtId}]},
			 attack_power => Power, defend_power => DefPower,
			 target_role_name => TargetName,
			 formation =>
			     [{1, FormationType, FormationLev},
			      {2, FormationType, FormationLev}],
			 combat_role => CombatRole, is_robot => IsRobot,
			 ext_args => [{is_show_panel, ShowPanel}],
			 other_arge =>
			     [{room_id, RoomId}, {ext_list, ExtList}]},
		DefendList =
		    combat_lib:init_fight_object_hp(DefendList0, MonPList),
		case combat_lib:start_combat(Role, 6, [FO],
					     [DefendList], Args)
		    of
		  {false, Reason} -> {false, Reason};
		  {ok, ComPid} ->
		      put(adventure_is_combat, ComPid),
		      {pass,
		       Role#role{m_adventure =
				     MAdventure#m_adventure{partner_id = PId}}}
		end
	  end
    end;
do_evt_(_Role, #a_room{status = 0, lock = 1},
	#{evt_type := rand_evt}, #{action := 1}) ->
    {false,
     lang:get(<<"Đánh bại lính canh gần đó để khám phá "
		"khu vực"/utf8>>)};
do_evt_(Role = #role{m_adventure =
			 MAdventure = #m_adventure{room_list = RoomList}},
	Room = #a_room{id = RoomId, status = 2},
	#{evt_type := rand_evt, effect := Effect},
	#{action := 1}) ->
    {NewEvtId, _} = util:rand_list(Effect, 2),
    NewRoom = Room#a_room{evt_id = NewEvtId},
    NewRoomList = lists:keyreplace(RoomId, #a_room.id,
				   RoomList, NewRoom),
    NRole = Role#role{m_adventure =
			  MAdventure#m_adventure{room_list = NewRoomList}},
    adventure:push_room([NewRoom]),
    {ok, NRole};
do_evt_(Role = #role{m_adventure =
			 MAdventure = #m_adventure{id = Id,
						   room_list = RoomList,
						   bag_list = BagList,
						   pass_num = PassNum}},
	Room = #a_room{id = RoomId, evt_id = EvtId, status = 2},
	#{evt_type := finger_guessing, effect := Effect,
	  lose := LoseItems},
	#{action := 1, ext := ExtList}) ->
    SelVal = list_util:keyfind(1, ExtList, 1),
    CostVal = list_util:keyfind(2, ExtList, 1),
    Lose = lists:nth(CostVal, LoseItems),
    GuessingRate =
	adventure_data:get_const(guessing_reward),
    {Ret, _} = util:rand_list(GuessingRate, 2),
    RetVal = if Ret =:= 1 andalso SelVal =:= 1 -> 2;
		Ret =:= 1 andalso SelVal =:= 2 -> 3;
		Ret =:= 1 andalso SelVal =:= 3 -> 1;
		Ret =:= 2 andalso SelVal =:= 1 -> 3;
		Ret =:= 2 andalso SelVal =:= 2 -> 1;
		Ret =:= 2 andalso SelVal =:= 3 -> 2;
		true -> SelVal
	     end,
    ItemRatio = list_util:keyfind(Ret, Effect, 0),
    GetItems = item_lib:ratio_items([Lose], ItemRatio),
    LossGL = format:val_to_loss([Lose], adventure),
    GL = format:val_to_gain(GetItems, adventure),
    AllGL = LossGL ++ GL,
    case role_gain:do(Role, AllGL) of
      {false, #loss{msg = Msg}} -> {false, Msg};
      {false, #gain{msg = Msg}} -> {false, Msg};
      {ok, Role1} ->
	  notice:alert(format:gain_text(LossGL, Role)),
	  NewRoom = Room#a_room{status = 3},
	  NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					 RoomList, NewRoom),
	  NewBagList = item_lib:merge(GetItems, BagList),
	  Role2 = Role1#role{m_adventure =
				 MAdventure#m_adventure{room_list = NewRoomList,
							bag_list = NewBagList,
							pass_num =
							    PassNum + 1}},
	  Role3 =
	      role_trigger:fire([#evt_adventure_room_finish{evt_id =
								EvtId,
							    room_id = RoomId},
				 #evt_adventure_finger_guessing{result = Ret}],
				Role2),
	  NRole = adventure:room_finish(Role3, NewRoom),
	  log:log_gain(AllGL, Role, NRole, <<"冒险"/utf8>>,
		       util:fbin("猜拳处理:~w,room:~w,evt:~w,~w-~w",
				 [Id, RoomId, EvtId, SelVal, RetVal])),
	  adventure:log_save_task(NRole, finger_guessing, 1),
	  sys_conn:pack_send(20621,
			     {SelVal, RetVal, Ret,
			      adventure:item_concat_to_cli(GetItems, [])}),
	  adventure:push_base(NRole),
	  {ok, NRole}
    end;
do_evt_(Role = #role{id = RoleId,
		     m_adventure =
			 MAdventure = #m_adventure{id = Id,
						   room_list = RoomList,
						   bag_list = BagList,
						   pass_num = PassNum}},
	Room = #a_room{id = RoomId, evt_id = EvtId, status = 2},
	EvtData = #{evt_type := box},
	#{action := 1, ext := ExtList}) ->
    IsAutoBuy = list_util:keyfind(1, ExtList, 0),
    {Items, RatioItems} = adventure:evt_drop(Role, EvtData),
    LoseItems = maps:get(lose, EvtData, []),
    LossGL = format:val_to_loss(LoseItems, adventure),
    GL = format:val_to_gain(Items, adventure),
    AllGL = LossGL ++ GL,
    case role_gain:do(Role, AllGL,
		      #gain_loss_opts{is_auto_buy = IsAutoBuy,
				      log_name = <<"冒险"/utf8>>})
	of
      {false, #loss{msg = Msg}} ->
	  {false,
	   lang:get(<<"Chìa khóa kho báu bí mật được giấu ở "
		      "một góc của tầng này."/utf8>>)};
      {false, #gain{msg = Msg}} -> {false, Msg};
      {ok, Role1, GainOpts} ->
	  CliItems = adventure:item_concat_to_cli(Items, []),
	  sys_conn:pack_send(20630, {CliItems}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_action261, _,
	     {__Leveladventure_action261,
	      __Tracesadventure_action261}}
		when __Leveladventure_action261 band 128 /= 0 orelse
		       __Tracesadventure_action261 /= [] ->
		lager:do_log(debug,
			     [{module, adventure_action}, {function, do_evt_},
			      {line, 261}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~ts宝箱奖励:room_id=~w, evt_id=~w, items=~w",
					   [Role#role.name, RoomId, EvtId,
					    Items]),
			     none, 4096, 128, __Leveladventure_action261,
			     __Tracesadventure_action261, lager_event,
			     __Pidadventure_action261);
	    _ -> ok
	  end,
	  NewRoom = Room#a_room{status = 3},
	  NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					 RoomList, NewRoom),
	  NewBagList = item_lib:merge(Items, BagList),
	  Role2 = Role1#role{m_adventure =
				 MAdventure#m_adventure{room_list = NewRoomList,
							bag_list = NewBagList,
							pass_num =
							    PassNum + 1}},
	  Role3 =
	      role_trigger:fire([#evt_adventure_room_finish{evt_id =
								EvtId,
							    room_id = RoomId},
				 #evt_adventure_treasure_open{},
				 #evt_adventure_box{items = Items}],
				Role2),
	  NRole = adventure:room_finish(Role3, NewRoom),
	  log:log_gain(GainOpts, Role, NRole, <<"冒险"/utf8>>,
		       util:fbin("打开宝箱:~w,room:~w,evt:~w",
				 [Id, RoomId, EvtId])),
	  adventure:log_save_task(NRole, box, 1),
	  adventure:push_base(NRole),
	  {ok, NRole}
    end;
do_evt_(Role = #role{id = RoleId,
		     m_adventure =
			 MAdventure = #m_adventure{id = Id,
						   room_list = RoomList,
						   bag_list = BagList,
						   pass_num = PassNum}},
	Room = #a_room{id = RoomId, evt_id = EvtId, status = 2},
	EvtData = #{evt_type := freebox},
	#{action := 1, ext := _ExtList}) ->
    {Items, RatioItems} = adventure:evt_drop(Role, EvtData),
    AllGL = format:val_to_gain(Items, adventure),
    case role_gain:do(Role, AllGL) of
      {false, #loss{msg = Msg}} -> {false, Msg};
      {false, #gain{msg = Msg}} -> {false, Msg};
      {ok, Role1} ->
	  CliItems = adventure:item_concat_to_cli(Items, []),
	  sys_conn:pack_send(20630, {CliItems}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_action286, _,
	     {__Leveladventure_action286,
	      __Tracesadventure_action286}}
		when __Leveladventure_action286 band 128 /= 0 orelse
		       __Tracesadventure_action286 /= [] ->
		lager:do_log(debug,
			     [{module, adventure_action}, {function, do_evt_},
			      {line, 286}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~ts宝箱奖励:room_id=~w, evt_id=~w, items=~w",
					   [Role#role.name, RoomId, EvtId,
					    Items]),
			     none, 4096, 128, __Leveladventure_action286,
			     __Tracesadventure_action286, lager_event,
			     __Pidadventure_action286);
	    _ -> ok
	  end,
	  NewRoom = Room#a_room{status = 3},
	  NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					 RoomList, NewRoom),
	  NewBagList = item_lib:merge(Items, BagList),
	  Role2 = Role1#role{m_adventure =
				 MAdventure#m_adventure{room_list = NewRoomList,
							bag_list = NewBagList,
							pass_num =
							    PassNum + 1}},
	  Role3 =
	      role_trigger:fire([#evt_adventure_room_finish{evt_id =
								EvtId,
							    room_id = RoomId},
				 #evt_adventure_treasure_open{},
				 #evt_adventure_box{items = Items}],
				Role2),
	  NRole = adventure:room_finish(Role3, NewRoom),
	  log:log_gain(AllGL, Role, NRole, <<"冒险"/utf8>>,
		       util:fbin("打开宝箱:~w,room:~w,evt:~w",
				 [Id, RoomId, EvtId])),
	  adventure:log_save_task(NRole, freebox, 1),
	  adventure:push_base(NRole),
	  {ok, NRole}
    end;
do_evt_(Role = #role{id = RoleId,
		     m_adventure =
			 MAdventure = #m_adventure{id = Id,
						   room_list = RoomList,
						   bag_list = BagList,
						   pass_num = PassNum}},
	Room = #a_room{id = RoomId, evt_id = EvtId, status = 2},
	EvtData = #{evt_type := effect}, #{action := 1}) ->
    {Items, RatioItems} = adventure:evt_drop(Role, EvtData),
    GL = format:val_to_gain(Items,
			    #gain{flag = adventure, move_to = 2}),
    case role_gain:do_notice(Role, GL,
			     #gain_loss_opts{type = 1})
	of
      {false, #loss{msg = Msg}} -> {false, Msg};
      {false, #gain{msg = Msg}} -> {false, Msg};
      {ok, Role1} ->
	  NewRoom = Room#a_room{status = 3},
	  NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					 RoomList, NewRoom),
	  NewBagList = item_lib:merge(Items, BagList),
	  Role2 = Role1#role{m_adventure =
				 MAdventure#m_adventure{room_list = NewRoomList,
							bag_list = NewBagList,
							pass_num =
							    PassNum + 1}},
	  Role3 = case EvtData of
		    #{sec_type := 101} ->
			role_trigger:fire([#evt_adventure_room_finish{evt_id =
									  EvtId,
								      room_id =
									  RoomId},
					   #evt_adventure_treasure_open{}],
					  Role2);
		    _ ->
			role_trigger:fire(#evt_adventure_room_finish{evt_id =
									 EvtId,
								     room_id =
									 RoomId},
					  Role2)
		  end,
	  NRole = adventure:room_finish(Role3, NewRoom),
	  log:log_gain(GL, Role, NRole, <<"冒险"/utf8>>,
		       util:fbin("特效操作:~w,room:~w,evt:~w",
				 [Id, RoomId, EvtId])),
	  adventure:log_save_task(NRole, effect, 1),
	  adventure:push_base(NRole),
	  {ok, NRole}
    end;
do_evt_(Role = #role{m_adventure =
			 MAdventure = #m_adventure{room_list = RoomList,
						   shop_list = ShopList}},
	Room = #a_room{id = RoomId, ext = RoomExt},
	#{evt_type := shop, effect := [Group, N]},
	#{action := 0}) ->
    case lists:keyfind(shop, 1, RoomExt) of
      {shop, 1, Ids} ->
	  GoodList = [G
		      || G = #{id := Id} <- ShopList, lists:member(Id, Ids)],
	  sys_conn:pack_send(20631, {1, GoodList}),
	  ok;
      _ ->
	  N1 = length(ShopList),
	  Fun = fun (I, {GoodListT, ShopListT}) ->
			{Id, _} = rand_good(ShopListT,
					    adventure_data:exch_group({Group,
								       I})),
			#{pay_type := PayType, pay_val := PayVal, bid := Bid,
			  num := Num, discount := Discount, old_val := OldVal} =
			    adventure_data:get_exch(Id),
			GoodT = #{id => I + N1, room_id => RoomId,
				  exec_id => Id, pay_type => PayType,
				  pay_val => PayVal, old_val => OldVal,
				  bid => Bid, num => Num, is_buy => 0,
				  discount => Discount},
			{[GoodT | GoodListT], [GoodT | ShopListT]}
		end,
	  {GoodList, NewShopList} = lists:foldl(Fun,
						{[], ShopList},
						lists:seq(1, N)),
	  Ids = [Id || #{id := Id} <- GoodList],
	  sys_conn:pack_send(20631, {1, GoodList}),
	  NewRoom = Room#a_room{ext = [{shop, 1, Ids}]},
	  NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					 RoomList, NewRoom),
	  NRole = Role#role{m_adventure =
				MAdventure#m_adventure{room_list = NewRoomList,
						       shop_list =
							   NewShopList}},
	  {ok, NRole}
    end;
do_evt_(Role = #role{m_adventure =
			 MAdventure = #m_adventure{room_list = RoomList,
						   shop_list = ShopList,
						   pass_num = PassNum}},
	Room = #a_room{id = RoomId, evt_id = EvtId, status = 2,
		       ext = [{shop, Ver, Ids}]},
	#{evt_type := shop}, #{action := 1, ext := ExtList}) ->
    SelId = list_util:keyfind(1, ExtList, 1),
    case maps_util:keyfind(ShopList, id, SelId) of
      {ok,
       D = #{is_buy := 0, pay_type := PayType,
	     pay_val := PayVal, bid := Bid, num := Num}} ->
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
							  SelId)],
		GoodList = [G
			    || G = #{id := Id} <- NewShopList,
			       lists:member(Id, Ids)],
		{Status, NewPassNum} = case [1
					     || #{is_buy := 0} <- GoodList]
					   of
					 [] -> {3, PassNum + 1};
					 _ -> {2, PassNum}
				       end,
		sys_conn:pack_send(20631, {1, GoodList}),
		NewRoom = Room#a_room{status = Status},
		NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					       RoomList, NewRoom),
		NRole = Role1#role{m_adventure =
				       MAdventure#m_adventure{room_list =
								  NewRoomList,
							      pass_num =
								  NewPassNum,
							      shop_list =
								  NewShopList}},
		log:log_gain(GL, Role, NRole, <<"冒险"/utf8>>,
			     util:fbin("神秘商人:room:~w,evt:~w,selid:~w",
				       [RoomId, EvtId, SelId])),
		adventure:log_save_task(NRole, shop, 1),
		adventure:push_base(NRole),
		NewRole =
		    role_trigger:fire(#evt_adventure_trade_count{}, NRole),
		{ok, NewRole}
	  end;
      #{} -> {false, lang:get(<<"Mặt hàng đã mua"/utf8>>)};
      _ ->
	  {false, lang:get(<<"Sản phẩm không tồn tại"/utf8>>)}
    end;
do_evt_(Role = #role{m_adventure =
			 MAdventure = #m_adventure{room_list = RoomList}},
	Room = #a_room{id = RoomId, evt_id = EvtId, status = 2,
		       ext = RoomExt},
	#{evt_type := npc}, #{action := 0}) ->
    case lists:keyfind(npc, 1, RoomExt) of
      {npc, TalkId} ->
	  sys_conn:pack_send(20627, {EvtId, TalkId}), ok;
      _ ->
	  TalkId =
	      util:rand_list(adventure_data:list_npc_talk(EvtId)),
	  sys_conn:pack_send(20627, {EvtId, TalkId}),
	  NewRoom = Room#a_room{ext = [{npc, TalkId} | RoomExt]},
	  NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					 RoomList, NewRoom),
	  NRole = Role#role{m_adventure =
				MAdventure#m_adventure{room_list =
							   NewRoomList}},
	  {ok, NRole}
    end;
do_evt_(Role = #role{m_adventure =
			 MAdventure = #m_adventure{id = Id,
						   room_list = RoomList,
						   bag_list = BagList,
						   pass_num = PassNum}},
	Room = #a_room{id = RoomId, evt_id = EvtId, status = 2,
		       ext = [{npc, TalkId}]},
	#{evt_type := npc}, #{action := 1, ext := ExtList}) ->
    SelNum = list_util:keyfind(1, ExtList, 1),
    case adventure_data:get_npc_talk({EvtId, TalkId,
				      SelNum})
	of
      Data = #{} ->
	  RewardRand = maps:get(reward_rand, Data, 0),
	  {Items, NoticeMsg1} = case util:rand(1, 1000) >
				       RewardRand
				    of
				  true -> {[], <<>>};
				  _ ->
				      BaseItems = maps:get(base_items, Data,
							   []),
				      DropIds = maps:get(drop_ids, Data, []),
				      {DropItems, _NoticeItems, NoticeMsg} =
					  drop_lib:common_drop_items(Role,
								     DropIds),
				      {item_lib:merge(item_lib:to_cli_items2(DropItems),
						      BaseItems),
				       NoticeMsg}
				end,
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_action412, _,
	     {__Leveladventure_action412,
	      __Tracesadventure_action412}}
		when __Leveladventure_action412 band 128 /= 0 orelse
		       __Tracesadventure_action412 /= [] ->
		lager:do_log(debug,
			     [{module, adventure_action}, {function, do_evt_},
			      {line, 412}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("npc====~w Items:~w", [Data, Items]),
			     none, 4096, 128, __Leveladventure_action412,
			     __Tracesadventure_action412, lager_event,
			     __Pidadventure_action412);
	    _ -> ok
	  end,
	  GL = format:val_to_gain(Items, adventure),
	  case role_gain:do(Role, GL) of
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, Role1} ->
		case maps:get(notice_msg, Data, <<>>) of
		  <<>> -> pass;
		  Msg ->
		      case adventure_data:get_const(notice_msg) >=
			     util:rand(1, 1000)
			  of
			true ->
			    say:speak(Role,
				      #{from => sys, channel => 1, len => 0,
					msg => Msg});
			_ -> pass
		      end
		end,
		put(adventure_notice_msg, NoticeMsg1),
		CliItems = adventure:item_concat_to_cli(Items, []),
		Tips = util:if_true(CliItems =:= [], tips2, tips),
		sys_conn:pack_send(20628,
				   {maps:get(Tips, Data, <<>>), CliItems}),
		NewRoom = Room#a_room{status = 3},
		NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					       RoomList, NewRoom),
		NewBagList = item_lib:merge(Items, BagList),
		Role2 = Role1#role{m_adventure =
				       MAdventure#m_adventure{room_list =
								  NewRoomList,
							      bag_list =
								  NewBagList,
							      pass_num =
								  PassNum + 1}},
		Role3 =
		    role_trigger:fire(#evt_adventure_room_finish{evt_id =
								     EvtId,
								 room_id =
								     RoomId},
				      Role2),
		NRole = adventure:room_finish(Role3, NewRoom),
		log:log_gain(GL, Role, NRole, <<"冒险"/utf8>>,
			     util:fbin("NPC互动:~w,room:~w,evt:~w,talkid:~w,selnum:~w",
				       [Id, RoomId, EvtId, TalkId, SelNum])),
		adventure:log_save_task(NRole, npc, 1),
		adventure:push_base(NRole),
		{ok, NRole}
	  end;
      _ ->
	  {false, lang:get(<<"Tùy chọn không tồn tại"/utf8>>)}
    end;
do_evt_(Role = #role{m_adventure =
			 MAdventure = #m_adventure{room_list = RoomList}},
	Room = #a_room{id = RoomId, evt_id = EvtId, status = 2,
		       ext = RoomExt},
	#{evt_type := npc2}, #{action := 0}) ->
    case lists:keyfind(npc, 1, RoomExt) of
      {npc, TalkId} ->
	  sys_conn:pack_send(20627, {EvtId, TalkId}), ok;
      _ ->
	  TalkId =
	      util:rand_list(adventure_data:list_npc_talk(EvtId)),
	  sys_conn:pack_send(20627, {EvtId, TalkId}),
	  NewRoom = Room#a_room{ext = [{npc, TalkId} | RoomExt]},
	  NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					 RoomList, NewRoom),
	  NRole = Role#role{m_adventure =
				MAdventure#m_adventure{room_list =
							   NewRoomList}},
	  {ok, NRole}
    end;
do_evt_(Role = #role{power = Power,
		     m_adventure =
			 MAdventure = #m_adventure{id = Id,
						   room_list = RoomList,
						   bag_list = BagList,
						   pass_num = PassNum}},
	Room = #a_room{id = RoomId, evt_id = EvtId, status = 2,
		       ext = [{npc, TalkId}]},
	Evt = #{evt_type := npc2},
	#{action := 1, ext := ExtList}) ->
    SelNum = list_util:keyfind(1, ExtList, 1),
    case adventure_data:get_npc_talk({EvtId, TalkId,
				      SelNum})
	of
      Data = #{unit_id := UnitId} when UnitId > 0 ->
	  DefPower = maps:get(power, Evt, 0),
	  Args = #{on_role_combat_end =>
		       {adventure_action, combat_over,
			[{npc2, RoomId, EvtId, Data}]},
		   attack_power => Power, defend_power => DefPower,
		   atk_add_attr => buff_attr(Role)},
	  case combat_lib:start_mon_combat(Role, 6, UnitId, Args)
	      of
	    {false, Reason} -> {false, Reason};
	    {ok, _ComPid} ->
		notice:alert(maps:get(tips, Data, <<>>)),
		NewRoom = Room#a_room{status = 3},
		NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					       RoomList, NewRoom),
		Role2 = Role#role{m_adventure =
				      MAdventure#m_adventure{room_list =
								 NewRoomList,
							     pass_num =
								 PassNum + 1}},
		Role3 =
		    role_trigger:fire(#evt_adventure_room_finish{evt_id =
								     EvtId,
								 room_id =
								     RoomId},
				      Role2),
		NRole = adventure:room_finish(Role3, NewRoom),
		adventure:log_save_task(NRole, npc2, 1),
		adventure:push_base(NRole),
		{pass, NRole}
	  end;
      Data = #{} ->
	  RewardRand = maps:get(reward_rand, Data, 0),
	  {Items, NoticeMsg1} = case util:rand(1, 1000) >
				       RewardRand
				    of
				  true -> {[], <<>>};
				  _ ->
				      BaseItems = maps:get(base_items, Data,
							   []),
				      DropIds = maps:get(drop_ids, Data, []),
				      {DropItems, _NoticeItems, NoticeMsg} =
					  drop_lib:common_drop_items(Role,
								     DropIds),
				      {item_lib:merge(item_lib:to_cli_items2(DropItems),
						      BaseItems),
				       NoticeMsg}
				end,
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_action490, _,
	     {__Leveladventure_action490,
	      __Tracesadventure_action490}}
		when __Leveladventure_action490 band 128 /= 0 orelse
		       __Tracesadventure_action490 /= [] ->
		lager:do_log(debug,
			     [{module, adventure_action}, {function, do_evt_},
			      {line, 490}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("npc====~w Items:~w", [Data, Items]),
			     none, 4096, 128, __Leveladventure_action490,
			     __Tracesadventure_action490, lager_event,
			     __Pidadventure_action490);
	    _ -> ok
	  end,
	  Lose = maps:get(lose, Data, []),
	  GL0 = format:val_to_loss(Lose, adventure),
	  GL1 = format:val_to_gain(Items, adventure),
	  GL = GL0 ++ GL1,
	  case role_gain:do(Role, GL) of
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, Role1} ->
		case maps:get(notice_msg, Data, <<>>) of
		  <<>> -> pass;
		  Msg ->
		      case adventure_data:get_const(notice_msg) >=
			     util:rand(1, 1000)
			  of
			true ->
			    say:speak(Role,
				      #{from => sys, channel => 1, len => 0,
					msg => Msg});
			_ -> pass
		      end
		end,
		put(adventure_notice_msg, NoticeMsg1),
		CliItems = adventure:item_concat_to_cli(Items, []),
		Tips = util:if_true(CliItems =:= [], tips2, tips),
		sys_conn:pack_send(20628,
				   {maps:get(Tips, Data, <<>>), CliItems}),
		NewRoom = Room#a_room{status = 3},
		NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					       RoomList, NewRoom),
		NewBagList = item_lib:merge(Items, BagList),
		Role2 = Role1#role{m_adventure =
				       MAdventure#m_adventure{room_list =
								  NewRoomList,
							      bag_list =
								  NewBagList,
							      pass_num =
								  PassNum + 1}},
		Role3 =
		    role_trigger:fire(#evt_adventure_room_finish{evt_id =
								     EvtId,
								 room_id =
								     RoomId},
				      Role2),
		NRole = adventure:room_finish(Role3, NewRoom),
		log:log_gain(GL, Role, NRole, <<"冒险"/utf8>>,
			     util:fbin("NPC2互动:~w,room:~w,evt:~w,talkid:~w,selnum:~w",
				       [Id, RoomId, EvtId, TalkId, SelNum])),
		adventure:log_save_task(NRole, npc2, 1),
		adventure:push_base(NRole),
		{ok, NRole}
	  end;
      _ ->
	  {false, lang:get(<<"Tùy chọn không tồn tại"/utf8>>)}
    end;
do_evt_(Role = #role{m_adventure =
			 MAdventure = #m_adventure{room_list = RoomList,
						   buff_list = BuffList,
						   pass_num = PassNum}},
	Room = #a_room{id = RoomId, status = 2, ext = RoomExt},
	#{evt_type := buff, effect := Effects},
	#{action := 1}) ->
    {BuffId, _Rand} = util:rand_list(Effects, 2),
    #buff_data{name = BuffName} =
	buff_data:get_buff(BuffId),
    notice:alert(util:fbin(lang:get(<<"Nhận BUFF:~ts"/utf8>>),
			   [BuffName])),
    Num = list_util:keyfind(BuffId, BuffList, 0) + 1,
    NewBuffList = lists:keystore(BuffId, 1, BuffList,
				 {BuffId, Num}),
    NewRoom = Room#a_room{ext = [{buff, BuffId} | RoomExt],
			  status = 3},
    NewRoomList = lists:keyreplace(RoomId, #a_room.id,
				   RoomList, NewRoom),
    Role1 = Role#role{m_adventure =
			  MAdventure#m_adventure{room_list = NewRoomList,
						 buff_list = NewBuffList,
						 pass_num = PassNum + 1}},
    NRole = adventure:room_finish(Role1, NewRoom),
    adventure:push_buff(NRole),
    {ok, NRole};
do_evt_(Role = #role{m_adventure =
			 MAdventure = #m_adventure{room_list = RoomList,
						   skill_list = SkillList,
						   pass_num = PassNum}},
	Room = #a_room{id = RoomId, status = 2, ext = RoomExt},
	#{evt_type := skill, effect := Effects},
	#{action := 1}) ->
    {SId, _Rand} = util:rand_list(Effects, 2),
    #{name := SName} = adventure_data:get_skill(SId),
    notice:alert(util:fbin(lang:get(<<"Nhận Phước Lành【~ts】"/utf8>>),
			   [SName])),
    sys_conn:pack_send(20625, {RoomId, SId}),
    Num = list_util:keyfind(SId, SkillList, 0) + 1,
    NewSkillList = lists:keystore(SId, 1, SkillList,
				  {SId, Num}),
    NewRoom = Room#a_room{ext = [{skill, SId} | RoomExt],
			  status = 3},
    NewRoomList = lists:keyreplace(RoomId, #a_room.id,
				   RoomList, NewRoom),
    Role1 = Role#role{m_adventure =
			  MAdventure#m_adventure{room_list = NewRoomList,
						 skill_list = NewSkillList,
						 pass_num = PassNum + 1}},
    NRole = adventure:room_finish(Role1, NewRoom),
    adventure:push_skill(NRole),
    {ok, NRole};
do_evt_(Role = #role{lev = RoleLev,
		     m_adventure =
			 MAdventure = #m_adventure{room_list = RoomList}},
	Room = #a_room{id = RoomId, status = 2, ext = RoomExt},
	EvtData = #{evt_type := answer}, #{action := 0}) ->
    case lists:keyfind(answer, 1, RoomExt) of
      {answer, N, Right, Ids} ->
	  {NowItems, MaxItems, _} = answer_reward(EvtData,
						  Right + 1, length(Ids)),
	  sys_conn:pack_send(20623,
			     {0, 0, 0, N, length(Ids), lists:nth(N, Ids), <<>>,
			      NowItems, MaxItems, []}),
	  ok;
      _ ->
	  Ids = rand_answer(RoleLev, 3, []),
	  {NowItems, MaxItems, _} = answer_reward(EvtData, 1,
						  length(Ids)),
	  sys_conn:pack_send(20623,
			     {0, 0, 0, 1, length(Ids), lists:nth(1, Ids), <<>>,
			      NowItems, MaxItems, []}),
	  NewRoom = Room#a_room{ext =
				    [{answer, 1, 0, Ids} | RoomExt]},
	  NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					 RoomList, NewRoom),
	  NRole = Role#role{m_adventure =
				MAdventure#m_adventure{room_list =
							   NewRoomList}},
	  {ok, NRole}
    end;
do_evt_(Role = #role{id = RoleId,
		     m_adventure =
			 MAdventure = #m_adventure{id = Id,
						   room_list = RoomList,
						   bag_list = BagList,
						   pass_num = PassNum}},
	Room = #a_room{id = RoomId, evt_id = EvtId, status = 2,
		       ext = RoomExt},
	EvtData = #{evt_type := answer},
	#{action := 1, ext := ExtList}) ->
    SelVal = list_util:keyfind(1, ExtList, 1),
    case lists:keyfind(answer, 1, RoomExt) of
      {answer, N, Right, Ids} ->
	  QBid = lists:nth(N, Ids),
	  Max = length(Ids),
	  {Flag, Ret, NewN, NewRight, RightRet} = case
						    adventure_data:get_answer(QBid)
						      of
						    #{result := SelVal}
							when N >= Max ->
							{stop, 1, N, Right + 1,
							 SelVal};
						    #{result := Result}
							when N >= Max ->
							{stop, 2, N, Right,
							 Result};
						    #{result := SelVal} ->
							{next, 1, N + 1,
							 Right + 1, SelVal};
						    #{result := Result} ->
							{next, 2, N + 1, Right,
							 Result}
						  end,
	  case Flag of
	    next ->
		{NowItems, MaxItems, _} = answer_reward(EvtData,
							NewRight + 1,
							length(Ids)),
		sys_conn:pack_send(20623,
				   {Ret, SelVal, RightRet, NewN, Max,
				    lists:nth(NewN, Ids), <<>>, NowItems,
				    MaxItems, []}),
		NewRoom = Room#a_room{ext =
					  lists:keyreplace(answer, 1, RoomExt,
							   {answer, NewN,
							    NewRight, Ids})},
		NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					       RoomList, NewRoom),
		NRole = Role#role{m_adventure =
				      MAdventure#m_adventure{room_list =
								 NewRoomList}},
		{ok, NRole};
	    stop ->
		{_NowItems, _MaxItems, NewEvtData} =
		    answer_reward(EvtData, NewRight, length(Ids)),
		{Items, _RatioItems} = adventure:evt_drop(Role,
							  NewEvtData),
		GL = format:val_to_gain(Items, adventure),
		Msg = case NewRight of
			0 -> lang:get(<<"Thật là xui xẻo!~"/utf8>>);
			1 -> lang:get(<<"Đúng vậy, thật đáng tiếc.~"/utf8>>);
			2 ->
			    lang:get(<<"Bạn chỉ cần thêm một câu hỏi nữa là "
				       "trả lời đúng hết. Cố lên!！"/utf8>>);
			_ ->
			    lang:get(<<"丶(*＾ワ＾*)ノHoàn toàn chính xác！！！"/utf8>>)
		      end,
		CliItems = adventure:item_concat_to_cli(Items, []),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidadventure_action606, _,
		   {__Leveladventure_action606,
		    __Tracesadventure_action606}}
		      when __Leveladventure_action606 band 128 /= 0 orelse
			     __Tracesadventure_action606 /= [] ->
		      lager:do_log(debug,
				   [{module, adventure_action},
				    {function, do_evt_}, {line, 606},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~ts room_id=~w, evt:~w items=~w",
						 [Role#role.name, RoomId, EvtId,
						  Items]),
				   none, 4096, 128, __Leveladventure_action606,
				   __Tracesadventure_action606, lager_event,
				   __Pidadventure_action606);
		  _ -> ok
		end,
		sys_conn:pack_send(20623,
				   {Ret, SelVal, RightRet, NewN, Max, 0, Msg,
				    [], [], CliItems}),
		{ok, Role1, _} = role_gain:do_mail(Role, GL,
						   lang:get(<<"Đố vui về cuộc phiêu lưu thế giới thần "
							      "thánh"/utf8>>),
						   lang:get(<<"Ba lô của bạn đã đầy. Phần thưởng sẽ "
							      "được gửi qua email. Vui lòng kiểm tra "
							      "email của bạn."/utf8>>),
						   <<"Cuộc phiêu lưu thần thánh"/utf8>>),
		NewRoom = Room#a_room{ext =
					  lists:keyreplace(answer, 1, RoomExt,
							   {answer, NewN,
							    NewRight, Ids}),
				      status = 3},
		NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					       RoomList, NewRoom),
		NewBagList = item_lib:merge(Items, BagList),
		Role2 = Role1#role{m_adventure =
				       MAdventure#m_adventure{room_list =
								  NewRoomList,
							      bag_list =
								  NewBagList,
							      pass_num =
								  PassNum + 1}},
		Role3 = case Max =:= NewRight of
			  true ->
			      role_trigger:fire([#evt_adventure_answer_all_right{},
						 #evt_adventure_room_finish{evt_id
										=
										EvtId,
									    room_id
										=
										RoomId}],
						Role2);
			  false ->
			      role_trigger:fire(#evt_adventure_room_finish{evt_id
									       =
									       EvtId,
									   room_id
									       =
									       RoomId},
						Role2)
			end,
		NRole = adventure:room_finish(Role3, NewRoom),
		log:log_gain(GL, Role, NRole, <<"冒险"/utf8>>,
			     util:fbin("答题:~w,room:~w,evt:~w,~w/~w",
				       [Id, RoomId, EvtId, NewRight, Max])),
		adventure:log_save_task(NRole, answer, 1),
		adventure:push_base(NRole),
		{ok, NRole}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Không tìm thấy thông tin tiêu đề"/utf8>>)}
    end;
do_evt_(_Role, _Room, _EvtData,
	_Args = #{action := 0}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_action630, _,
       {__Leveladventure_action630,
	__Tracesadventure_action630}}
	  when __Leveladventure_action630 band 128 /= 0 orelse
		 __Tracesadventure_action630 /= [] ->
	  lager:do_log(debug,
		       [{module, adventure_action}, {function, do_evt_},
			{line, 630}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]查看房间[~w]事件[~w]失败~w",
				     [_Role#role.name, _Room, _EvtData, _Args]),
		       none, 4096, 128, __Leveladventure_action630,
		       __Tracesadventure_action630, lager_event,
		       __Pidadventure_action630);
      _ -> ok
    end,
    ok;
do_evt_(_Role, _Room = #a_room{status = 3}, _EvtData,
	_Args) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_action634, _,
       {__Leveladventure_action634,
	__Tracesadventure_action634}}
	  when __Leveladventure_action634 band 128 /= 0 orelse
		 __Tracesadventure_action634 /= [] ->
	  lager:do_log(debug,
		       [{module, adventure_action}, {function, do_evt_},
			{line, 634}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]操作房间[~w]事件[~w]失败~w",
				     [_Role#role.name, _Room, _EvtData, _Args]),
		       none, 4096, 128, __Leveladventure_action634,
		       __Tracesadventure_action634, lager_event,
		       __Pidadventure_action634);
      _ -> ok
    end,
    {false, lang:get(<<"Đã xóa"/utf8>>), 2};
do_evt_(Role, Room, EvtData, Args) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_action638, _,
       {__Leveladventure_action638,
	__Tracesadventure_action638}}
	  when __Leveladventure_action638 band 8 /= 0 orelse
		 __Tracesadventure_action638 /= [] ->
	  lager:do_log(error,
		       [{module, adventure_action}, {function, do_evt_},
			{line, 638}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]操作房间[~w]事件[~w]失败~w",
				     [Role#role.name, Room, EvtData, Args]),
		       none, 4096, 8, __Leveladventure_action638,
		       __Tracesadventure_action638, lager_event,
		       __Pidadventure_action638);
      _ -> ok
    end,
    {false,
     lang:get(<<"Hoạt động không thành công"/utf8>>)}.

-spec combat_over(#role{}, #combat_result{}, #combat{},
		  tuple()) -> {ok, #role{}, list()}.

combat_over(Role = #role{m_adventure =
			     MAdventure = #m_adventure{id = Id,
						       bag_list = BagList,
						       plist = Plist}},
	    #combat_result{result = 1, a_stat_info = AStat}, Combat,
	    {npc2, RoomId, EvtId, Data}) ->
    NewPList = sync_partner_hp(AStat, Plist),
    EvtData = adventure_data:get_evt(EvtId),
    BaseItems = maps:get(base_items, Data, []),
    DropIds = maps:get(drop_ids, Data, []),
    {DropItems, _NoticeItems, NoticeMsg} =
	drop_lib:common_drop_items(Role, DropIds),
    AllItems =
	item_lib:merge(item_lib:to_cli_items2(DropItems),
		       BaseItems),
    NewBagList = item_lib:merge(AllItems, BagList),
    Role1 = auto_select_partner(Role#role{m_adventure =
					      MAdventure#m_adventure{bag_list =
									 NewBagList,
								     plist =
									 NewPList}}),
    {ok, NRole, RewardItems} =
	drop_lib:gain_combat_drop(Role1, Combat, 1, AllItems,
				  <<"冒险"/utf8>>,
				  util:fbin("冒险通关~w=~w,evt_id:~w,evt_type:~w",
					    [Id, RoomId, EvtId,
					     maps:get(evt_type, EvtData,
						      undefined)])),
    drop_lib:drop_notice(NoticeMsg),
    adventure:push_partners(NRole),
    {ok, NRole, RewardItems};
combat_over(Role = #role{m_adventure =
			     MAdventure = #m_adventure{room_list = RoomList,
						       plist = Plist,
						       bag_list = BagList,
						       pass_num = PassNum,
						       id = Id,
						       kill_mon = KillMon}},
	    #combat_result{result = 1, a_stat_info = AStat,
			   b_stat_info = BStat,
			   hurt_statistics = HurtStatistics},
	    Combat = #combat{other_arge = OtherArge,
			     target_role_name = TargetName},
	    {EvtType, RoomId, EvtId}) ->
    case lists:keyfind(RoomId, #a_room.id, RoomList) of
      Room = #a_room{evt_id = EvtId, status = 2, ext = Ext} ->
	  case adventure_data:get_floor(Id) of
	    _ when EvtType =:= boss ->
		notice:alert(lang:get(<<"Thử thách đã thành công và lối vào cấp "
					"độ tiếp theo đã xuất hiện."/utf8>>));
	    #{auto_combat := 1} ->
		notice:alert(lang:get(<<"Thử thách đã thành công và khu vực không "
					"được bảo vệ đã được tự động khám phá"/utf8>>));
	    _ ->
		notice:alert(lang:get(<<"Thử thách thành công, bạn có thể khám "
					"phá những khu vực không được bảo vệ"/utf8>>))
	  end,
	  NewPList = sync_partner_hp(AStat, Plist),
	  MonPList = sync_mon_hp(BStat, Ext),
	  EvtData = adventure_data:get_evt(EvtId),
	  PartnerBids = [BidT || #{object_bid := BidT} <- AStat],
	  {Items, _RatioItems} = adventure:evt_drop(Role,
						    EvtData),
	  NewBagList = item_lib:merge(Items, BagList),
	  NewRoom = Room#a_room{status = 3, ext = MonPList},
	  NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					 RoomList, NewRoom),
	  Role1 = auto_select_partner(Role#role{m_adventure =
						    MAdventure#m_adventure{room_list
									       =
									       NewRoomList,
									   plist
									       =
									       NewPList,
									   bag_list
									       =
									       NewBagList,
									   pass_num
									       =
									       PassNum
										 +
										 1,
									   kill_mon
									       =
									       KillMon
										 +
										 1}}),
	  Role2 = check_pass(Role1, NewRoom),
	  {ok, Role3, RewardItems} =
	      drop_lib:gain_combat_drop(Role2, Combat, 1, Items,
					<<"冒险"/utf8>>,
					util:fbin("冒险通关~w=~w,evt_id:~w,evt_type:~w",
						  [Id, RoomId, EvtId,
						   maps:get(evt_type, EvtData,
							    undefined)])),
	  Role4 = case EvtType of
		    mon ->
			role_trigger:fire([#evt_adventure_room_finish{evt_id =
									  EvtId,
								      room_id =
									  RoomId},
					   #evt_adventure_kill_mon{},
					   #evt_adventure_use_partner{bids =
									  PartnerBids}],
					  Role3);
		    _ ->
			role_trigger:fire([#evt_adventure_room_finish{evt_id =
									  EvtId,
								      room_id =
									  RoomId},
					   #evt_adventure_use_partner{bids =
									  PartnerBids}],
					  Role3)
		  end,
	  NRole = adventure:room_finish(Role4, NewRoom),
	  adventure:log_save_task(NRole, EvtType, 1),
	  adventure:push_base(NRole),
	  adventure:push_partners(NRole),
	  adventure:push_round_reward(NRole),
	  drop_lib:drop_notice(erase(adventure_notice_msg)),
	  {_, _, _, IsContinue} = util:get(adventure_combat_args,
					   {#{}, #{}, 0, 0}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_action690, _,
	     {__Leveladventure_action690,
	      __Tracesadventure_action690}}
		when __Leveladventure_action690 band 128 /= 0 orelse
		       __Tracesadventure_action690 /= [] ->
		lager:do_log(debug,
			     [{module, adventure_action},
			      {function, combat_over}, {line, 690},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("战斗胜利:~w evt:~w==~w reward=~w",
					   [RoomId, EvtId,
					    maps:get(unit_id, EvtData, 0),
					    RewardItems]),
			     none, 4096, 128, __Leveladventure_action690,
			     __Tracesadventure_action690, lager_event,
			     __Pidadventure_action690);
	    _ -> ok
	  end,
	  NewRole = case lists:member(EvtType, [boss, mon]) of
		      true ->
			  role_trigger:fire([#evt_adventure_boss_fight_count{}],
					    NRole);
		      _ -> NRole
		    end,
	  case RewardItems of
	    [] ->
		combat_end:send_combat_end_with_no_window(NewRole, 6),
		put(adventure_is_combat, 0),
		{ok, NewRole, #{is_show_panel => 2}};
	    _ ->
		case IsContinue =:= 1 of
		  true ->
		      AllEndHp = lists:sum([Hp || #{hp := Hp} <- AStat]),
		      AllEndMaxHp = lists:sum([HpMax
					       || #{hp_max := HpMax} <- AStat]),
		      HpRio = round(AllEndHp / AllEndMaxHp * 1000),
		      AdvRoomId = list_util:keyfind(room_id, OtherArge, 0),
		      AdvExtList = list_util:keyfind(ext_list, OtherArge, []),
		      sys_conn:pack_send(20006,
					 {1,
					  combat_end:gen_cli_items(RewardItems,
								   []),
					  1, 0, 0, 6, TargetName,
					  HurtStatistics, HpRio, AdvRoomId,
					  AdvExtList}),
		      put(adventure_is_combat, 0),
		      {ok, NewRole};
		  _ ->
		      put(adventure_is_combat, 0), {ok, NewRole, RewardItems}
		end
	  end;
      _D ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_action720, _,
	     {__Leveladventure_action720,
	      __Tracesadventure_action720}}
		when __Leveladventure_action720 band 8 /= 0 orelse
		       __Tracesadventure_action720 /= [] ->
		lager:do_log(error,
			     [{module, adventure_action},
			      {function, combat_over}, {line, 720},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]挑战房间[~w]事件[~w]后数据更新了:~w",
					   [Role#role.name, RoomId, EvtId, _D]),
			     none, 4096, 8, __Leveladventure_action720,
			     __Tracesadventure_action720, lager_event,
			     __Pidadventure_action720);
	    _ -> ok
	  end,
	  EvtData = adventure_data:get_evt(EvtId),
	  {Items, _RatioItems} = adventure:evt_drop(Role,
						    EvtData),
	  {_, _, _, IsContinue} = util:get(adventure_combat_args,
					   {#{}, #{}, 0, 0}),
	  {ok, NRole, RewardItems} =
	      drop_lib:gain_combat_drop(Role, Combat, 1, Items,
					<<"冒险"/utf8>>,
					util:fbin("冒险通关~w=~w,evt_id:~w,evt_type:~w",
						  [Id, RoomId, EvtId,
						   maps:get(evt_type, EvtData,
							    undefined)])),
	  case RewardItems of
	    [] ->
		combat_end:send_combat_end_with_no_window(NRole, 6),
		put(adventure_is_combat, 0),
		{ok, NRole, #{is_show_panel => 2}};
	    _ ->
		case IsContinue =:= 1 of
		  true ->
		      AllEndHp = lists:sum([Hp || #{hp := Hp} <- AStat]),
		      AllEndMaxHp = lists:sum([HpMax
					       || #{hp_max := HpMax} <- AStat]),
		      HpRio = round(AllEndHp / AllEndMaxHp * 1000),
		      AdvRoomId = list_util:keyfind(room_id, OtherArge, 0),
		      AdvExtList = list_util:keyfind(ext_list, OtherArge, []),
		      sys_conn:pack_send(20006,
					 {1,
					  combat_end:gen_cli_items(RewardItems,
								   []),
					  1, 0, 0, 6, TargetName,
					  HurtStatistics, HpRio, AdvRoomId,
					  AdvExtList}),
		      put(adventure_is_combat, 0),
		      {ok, NRole};
		  _ ->
		      put(adventure_is_combat, 0), {ok, NRole, RewardItems}
		end
	  end
    end;
combat_over(Role = #role{combat_type_list = CList,
			 m_adventure =
			     MAdventure = #m_adventure{end_time = EndTime,
						       room_list = RoomList,
						       plist = Plist}},
	    #combat_result{a_stat_info = AStat, b_stat_info = BStat,
			   hurt_statistics = HurtStatistics},
	    _Combat = #combat{other_arge = OtherArge,
			      target_role_name = TargetName},
	    {_EvtType, RoomId, EvtId}) ->
    case lists:keyfind(RoomId, #a_room.id, RoomList) of
      Room = #a_room{evt_id = EvtId, status = 2, ext = Ext} ->
	  NewPList = sync_partner_hp(AStat, Plist),
	  MonPList = sync_mon_hp(BStat, Ext),
	  NewRoom = Room#a_room{ext = MonPList},
	  NewRoomList = lists:keyreplace(RoomId, #a_room.id,
					 RoomList, NewRoom),
	  NRole = auto_select_partner(Role#role{m_adventure =
						    MAdventure#m_adventure{room_list
									       =
									       NewRoomList,
									   plist
									       =
									       NewPList}}),
	  {Evt, Args, IsAuto, IsContinue} =
	      util:get(adventure_combat_args, {#{}, #{}, 0, 0}),
	  case IsContinue =:= 1 andalso
		 IsAuto =:= 1 andalso
		   util:get(adventure_combat_round, 0) <
		     adventure_data:get_const(adventure_combat_round)
		     andalso
		     date:unixtime() < EndTime andalso
		       cal_partner_hp(AStat) >
			 adventure_data:get_const(partner_hp_pro)
	      of
	    true ->
		case do_evt_(NRole, NewRoom, Evt, Args) of
		  {pass, NewRole} -> {ok, NewRole, #{is_show_panel => 2}};
		  _ -> ok
		end;
	    _ ->
		case IsContinue =:= 1 of
		  true ->
		      put(adventure_is_combat, 0),
		      adventure:push_base(NRole),
		      adventure:push_partners(NRole),
		      AllEndHp = lists:sum([Hp || #{hp := Hp} <- AStat]),
		      AllEndMaxHp = lists:sum([HpMax
					       || #{hp_max := HpMax} <- AStat]),
		      HpRio = round(AllEndHp / AllEndMaxHp * 1000),
		      AdvRoomId = list_util:keyfind(room_id, OtherArge, 0),
		      AdvExtList = list_util:keyfind(ext_list, OtherArge, []),
		      sys_conn:pack_send(20006,
					 {2, [], 1, 0, 0, 6, TargetName,
					  HurtStatistics, HpRio, AdvRoomId,
					  AdvExtList}),
		      {ok, NRole, #{is_show_panel => 2}};
		  _ ->
		      put(adventure_is_combat, 0),
		      adventure:push_base(NRole),
		      adventure:push_partners(NRole),
		      {ok, NRole}
		end
	  end;
      _ -> ok
    end;
combat_over(_Role, _CombatResult, _Combat, _Args) -> ok.

cal_partner_hp(AStat) ->
    do_cal_partner_hp(AStat, [0, 0]).

do_cal_partner_hp([], [HpAll, HpMaxAll]) ->
    util:ceil(HpAll * 100 / HpMaxAll);
do_cal_partner_hp([#{hp := Hp, hp_max := HpMax} | T],
		  [HpAll, HpMaxAll]) ->
    do_cal_partner_hp(T, [HpAll + Hp, HpMaxAll + HpMax]).

auto_select_partner(Role = #role{m_adventure =
				     MAdventure = #m_adventure{partner_id =
								   PartnerId,
							       plist =
								   PList}}) ->
    case lists:keyfind(PartnerId, #partner.id, PList) of
      #partner{all_attr = #attr{hp = 0}} ->
	  case [P
		|| P = #partner{all_attr = #attr{hp = Hp}} <- PList,
		   Hp > 0]
	      of
	    [#partner{id = PId} | _] ->
		Role#role{m_adventure =
			      MAdventure#m_adventure{partner_id = PId}};
	    _ -> Role
	  end;
      _ -> Role
    end.

sync_partner_hp([], Plist) -> Plist;
sync_partner_hp([#{object_id := PId, hp := Hp} | T],
		Plist) ->
    case lists:keyfind(PId, #partner.id, Plist) of
      P = #partner{all_attr = Attr} ->
	  NewP = P#partner{all_attr = Attr#attr{hp = Hp}},
	  NewPlist = lists:keyreplace(PId, #partner.id, Plist,
				      NewP),
	  sync_partner_hp(T, NewPlist);
      _ -> sync_partner_hp(T, Plist)
    end.

sync_mon_hp([], HpList) -> HpList;
sync_mon_hp([#{object_id := PId, hp := Hp,
	       hp_max := HpMax}
	     | T],
	    HpList) ->
    NewHpList = lists:keystore(PId, 1, HpList,
			       {PId, util:ceil(Hp * 100 / HpMax)}),
    sync_mon_hp(T, NewHpList).

check_pass(Role = #role{m_adventure =
			    MAdventure = #m_adventure{boss_room = BossRoom,
						      id = Id,
						      pass_id = PassId}},
	   #a_room{id = BossRoom}) ->
    Role#role{m_adventure =
		  MAdventure#m_adventure{pass_id = max(Id, PassId),
					 is_kill_boss = 1}};
check_pass(Role, _Room) -> Role.

answer_reward(EvtData = #{effect := Effects}, N, Max) ->
    MaxItems = case lists:keyfind(Max, 1, Effects) of
		 {Max, Items1, _DropIds1, BagItems1, _BagDropIds1} ->
		     item_lib:merge(Items1, BagItems1);
		 {Max, Items1, _DropIds1} -> Items1;
		 _ -> []
	       end,
    case lists:keyfind(N, 1, Effects) of
      {N, Items2, DropIds2, _BagItems2, _BagDropIds2} ->
	  {Items2, MaxItems,
	   maps:merge(EvtData,
		      #{base_items => Items2, drop_ids => DropIds2})};
      {N, Items2, DropIds2} ->
	  {Items2, MaxItems,
	   maps:merge(EvtData,
		      #{base_items => Items2, drop_ids => DropIds2})};
      _ ->
	  {[], MaxItems,
	   maps:merge(EvtData,
		      #{base_items => [], drop_ids => []})}
    end.

gen_fight_object(Role = #role{m_adventure =
				  #m_adventure{plist = PList}},
		 PId) ->
    case lists:keyfind(PId, #partner.id, PList) of
      #partner{all_attr = #attr{hp = 0}} ->
	  {false, lang:get(<<"Đối tác đã chết"/utf8>>)};
      Partner = #partner{all_attr = #attr{hp = Hp}} ->
	  FO1 = partner_lib:gen_fight_object(Role, Partner, true),
	  BuffAttr = buff_attr(Role),
	  FO = combat_lib:add_base_attr(FO1#fight_object{pos = 5,
							 hp = Hp},
					BuffAttr),
	  {true, FO};
      _ -> {false, lang:get(<<"Đối tác không tồn tại"/utf8>>)}
    end.

-spec buff_attr(#role{}) -> [].

buff_attr(Role = #role{m_adventure =
			   #m_adventure{buff_list = BuffList}}) ->
    HolidayBuffList =
	util:if_true(adventure:is_open_holiday(Role) =:= 1,
		     [{900903, 1}], []),
    AllBuffList = BuffList ++ HolidayBuffList,
    role_buff:sum_buff_attr(AllBuffList).

rand_answer(_RoleLev, 0, L) -> L;
rand_answer(RoleLev, N, L) ->
    {Type, _Rand} =
	util:rand_list(adventure_data:list_answer_type(), 2),
    RandList1 = adventure_data:list_answer(Type),
    RandList = case [{RandId, LimitLev}
		     || {RandId, LimitLev} <- RandList1,
			RoleLev >= LimitLev andalso not lists:member(RandId, L)]
		   of
		 RandListT = [_ | _] -> RandListT;
		 _ -> RandList1
	       end,
    {Id, _} = util:rand_list(RandList),
    rand_answer(RoleLev, N - 1, [Id | L]).


