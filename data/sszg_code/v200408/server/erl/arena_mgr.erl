-file("data/arena_mgr.erl", 1).

-file("src/mod/arena/arena_mgr.erl", 1).

-module(arena_mgr).

-lager_records([{formation_attr_data,
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
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
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
		{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{m_look, [use_id, list]},
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
		  p_eqm, p_home]},
		{state,
		 [next_rank, season_start_time, season_end_time,
		  season_reward_time, season_idx, last_time]}]).

-behaviour(gen_server).

-export([sync_role/2, update_role/2, async_exec/3,
	 get_rank_list_last_time/0, notice_merge_reward/1,
	 gm_delete_rank/0]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state,
	{next_rank = 0, season_start_time = 0,
	 season_end_time = 0, season_reward_time = 0,
	 season_idx = 0, last_time = 0}).

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

-file("src/mod/arena/arena_mgr.erl", 13).

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

-file("src/mod/arena/arena_mgr.erl", 14).

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

-file("src/mod/arena/arena_mgr.erl", 15).

-file("inc/log.hrl", 1).

-file("src/mod/arena/arena_mgr.erl", 16).

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

-file("src/mod/arena/arena_mgr.erl", 17).

-file("inc/looks.hrl", 1).

-record(m_look, {use_id = 0, list = []}).

-file("src/mod/arena/arena_mgr.erl", 18).

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

-file("src/mod/arena/arena_mgr.erl", 19).

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

-file("src/mod/arena/arena_mgr.erl", 20).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/arena/arena_mgr.erl", 21).

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

-file("src/mod/arena/arena_mgr.erl", 22).

gm_delete_rank() -> ets:delete_all_objects(arena_rank).

sync_role(Role = #role{id = RoleId}, Flag) ->
    case ets:member(arena_role, RoleId) of
      true -> sync_role_(Role, Flag);
      _ -> skip
    end,
    ok.

sync_role_(Role = #role{id = RoleId,
			arena_power = Power, max_power = MaxPower,
			arena_max_power = ArenaMaxPower},
	   power) ->
    ChampionPower = formation:get_sys_formation_power(Role,
						      6),
    L = [{#arena_role.power, Power},
	 {#arena_role.max_power, max(MaxPower, ArenaMaxPower)},
	 {#arena_role.champion_power, ChampionPower}],
    ets:update_element(arena_role, RoleId, L);
sync_role_(Role = #role{id = RoleId,
			arena_power = Power, max_power = MaxPower,
			arena_max_power = ArenaMaxPower,
			guild_bag = #guild_bag{id = Gid, name = GName}},
	   guild) ->
    ChampionPower = formation:get_sys_formation_power(Role,
						      6),
    L = [{#arena_role.power, Power},
	 {#arena_role.max_power, max(MaxPower, ArenaMaxPower)},
	 {#arena_role.champion_power, ChampionPower},
	 {#arena_role.gid, Gid}, {#arena_role.gname, GName}],
    ets:update_element(arena_role, RoleId, L);
sync_role_(Role = #role{id = RoleId, lev = Lev,
			name = Name, arena_power = Power, face_id = FaceId,
			guild_bag = #guild_bag{id = Gid, name = GName},
			m_look = #m_look{use_id = LookId},
			m_avatar = #m_avatar{used = AvatarId},
			max_power = MaxPower, arena_max_power = ArenaMaxPower},
	   _Flag) ->
    ChampionPower = formation:get_sys_formation_power(Role,
						      6),
    L = [{#arena_role.lev, Lev}, {#arena_role.name, Name},
	 {#arena_role.power, Power}, {#arena_role.face, FaceId},
	 {#arena_role.gid, Gid}, {#arena_role.gname, GName},
	 {#arena_role.lookid, LookId},
	 {#arena_role.avatar_id, AvatarId},
	 {#arena_role.max_power, max(MaxPower, ArenaMaxPower)},
	 {#arena_role.champion_power, ChampionPower}],
    ets:update_element(arena_role, RoleId, L).

get_rank_list_last_time() ->
    case call(get_rank_list_last_time) of
      {ok, T} -> T;
      _ -> 0
    end.

-spec update_role(role_id() | #role{},
		  pos_integer()) -> ok.

update_role({_, <<>>}, _AddScore) -> ok;
update_role(ArenaRole, AddScore) ->
    info({update_role, ArenaRole, AddScore}).

update_ets(Data = #arena_role{id = RoleId, rank = Rank,
			      score = Score},
	   all) ->
    ets:insert(arena_rank,
	       #arena_rank{rank = Rank, id = RoleId, score = Score}),
    ets:insert(arena_role, Data),
    dets:insert(get_dets(RoleId), Data);
update_ets(Data = #arena_role{id = RoleId, rank = Rank,
			      score = Score},
	   ets) ->
    ets:insert(arena_rank,
	       #arena_rank{rank = Rank, id = RoleId, score = Score}),
    ets:insert(arena_role, Data),
    ets:insert(arena_update, {RoleId}).

get_dets({Rid, _}) -> get_dets(Rid);
get_dets(1) -> arena_role_1;
get_dets(2) -> arena_role_2;
get_dets(3) -> arena_role_3;
get_dets(Rid) when Rid > 3 -> get_dets(Rid rem 3 + 1);
get_dets(_) -> arena_role_1.

-spec async_exec(atom(), atom(), list) -> ok.

async_exec(Mod, Fun, Args) ->
    info({async, Mod, Fun, Args}).

info(Info) -> arena_mgr ! Info.

cast(Info) -> gen_server:cast(arena_mgr, Info).

call(Info) ->
    case catch gen_server:call(arena_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_mgr92, _,
	     {__Levelarena_mgr92, __Tracesarena_mgr92}}
		when __Levelarena_mgr92 band 8 /= 0 orelse
		       __Tracesarena_mgr92 /= [] ->
		lager:do_log(error,
			     [{module, arena_mgr}, {function, call}, {line, 92},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [arena_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelarena_mgr92,
			     __Tracesarena_mgr92, lager_event,
			     __Pidarena_mgr92);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end.

start_link() ->
    gen_server:start_link({local, arena_mgr}, arena_mgr, [],
			  []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_mgr98, _,
       {__Levelarena_mgr98, __Tracesarena_mgr98}}
	  when __Levelarena_mgr98 band 64 /= 0 orelse
		 __Tracesarena_mgr98 /= [] ->
	  lager:do_log(info,
		       [{module, arena_mgr}, {function, init}, {line, 98},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [arena_mgr]), none, 4096,
		       64, __Levelarena_mgr98, __Tracesarena_mgr98,
		       lager_event, __Pidarena_mgr98);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(arena_role_1,
		   [{file, "./dets/arena_role_1.dets"},
		    {keypos, #arena_role.id}, {type, set}]),
    dets:open_file(arena_role_2,
		   [{file, "./dets/arena_role_2.dets"},
		    {keypos, #arena_role.id}, {type, set}]),
    dets:open_file(arena_role_3,
		   [{file, "./dets/arena_role_3.dets"},
		    {keypos, #arena_role.id}, {type, set}]),
    ets:new(arena_role,
	    [set, named_table, public, {keypos, #arena_role.id}]),
    ets:new(arena_rank,
	    [set, named_table, public, {keypos, #arena_rank.rank}]),
    ets:new(arena_update,
	    [set, named_table, public, {keypos, 1}]),
    NextRank = do_init(),
    ArenaInfo = sys_env:get(arena_state, #{}),
    SeasonStartTime = maps:get(season_start_time, ArenaInfo,
			       0),
    SeasonEndTime = maps:get(season_end_time, ArenaInfo, 0),
    SeasonRewardTime = maps:get(season_reward_time,
				ArenaInfo, max(0, SeasonEndTime - 3600 * 3)),
    SeasonIdx = maps:get(season_idx, ArenaInfo, 0),
    State = #state{next_rank = NextRank,
		   season_start_time = SeasonStartTime,
		   season_end_time = SeasonEndTime,
		   season_reward_time = SeasonRewardTime,
		   season_idx = SeasonIdx},
    util:set_timer(season_end_timer,
		   max(1, SeasonEndTime - date:unixtime()), season_end),
    util:set_timer(season_reward_timer,
		   max(30, SeasonRewardTime - date:unixtime()),
		   season_reward),
    util:set_timer(daily_reward_timer,
		   max(1,
		       date:next_diff(arena_data:get_const(daily_reward_time))),
		   daily_reward),
    util:set_timer(update_save_timer, util:rand(300, 380),
		   update_save),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_mgr117, _,
       {__Levelarena_mgr117, __Tracesarena_mgr117}}
	  when __Levelarena_mgr117 band 64 /= 0 orelse
		 __Tracesarena_mgr117 /= [] ->
	  lager:do_log(info,
		       [{module, arena_mgr}, {function, init}, {line, 117},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [arena_mgr]), none, 4096, 64,
		       __Levelarena_mgr117, __Tracesarena_mgr117, lager_event,
		       __Pidarena_mgr117);
      _ -> ok
    end,
    {ok, State}.

handle_call(get_rank_list_last_time, _From,
	    State = #state{last_time = LastTime}) ->
    {reply, {ok, LastTime}, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({async, Fun, Mod, Args}, State) ->
    try apply(Fun, Mod, Args) catch
      X:T ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_mgr135, _,
	     {__Levelarena_mgr135, __Tracesarena_mgr135}}
		when __Levelarena_mgr135 band 8 /= 0 orelse
		       __Tracesarena_mgr135 /= [] ->
		lager:do_log(error,
			     [{module, arena_mgr}, {function, handle_info},
			      {line, 135}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("exec_fun:~w,~w, error:~w,~w",
					   [Fun, Mod, X, T]),
			     none, 4096, 8, __Levelarena_mgr135,
			     __Tracesarena_mgr135, lager_event,
			     __Pidarena_mgr135);
	    _ -> ok
	  end
    end,
    {noreply, State};
handle_info(update_save, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_mgr141, _,
       {__Levelarena_mgr141, __Tracesarena_mgr141}}
	  when __Levelarena_mgr141 band 128 /= 0 orelse
		 __Tracesarena_mgr141 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_mgr}, {function, handle_info},
			{line, 141}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("竞技场数据保存:~w",
				     [ets:info(arena_update, size)]),
		       none, 4096, 128, __Levelarena_mgr141,
		       __Tracesarena_mgr141, lager_event, __Pidarena_mgr141);
      _ -> ok
    end,
    catch do_save_update(ets:tab2list(arena_update)),
    ets:delete_all_objects(arena_update),
    util:set_timer(update_save_timer, util:rand(300, 380),
		   update_save),
    {noreply, State};
handle_info({update_role,
	     ArenaRole = #arena_role{id = RoleId}, AddScore},
	    State) ->
    case arena_lib:get_role(RoleId) of
      {ok, #arena_role{score = NowScore, rank = OldRank}} ->
	  NewScore = max(NowScore + AddScore,
			 arena_data:get_const(min_score)),
	  update_rank(ArenaRole#arena_role{score = NewScore,
					   rank = OldRank},
		      NewScore - NowScore, State);
      false -> update_rank(ArenaRole, AddScore, State)
    end;
handle_info({update_role, RoleId = {_, _}, AddScore},
	    State) ->
    case arena_lib:get_role(RoleId) of
      {ok, ArenaRole = #arena_role{score = NowScore}} ->
	  NewScore = max(NowScore + AddScore,
			 arena_data:get_const(min_score)),
	  update_rank(ArenaRole#arena_role{score = NewScore},
		      NewScore - NowScore, State);
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_mgr162, _,
	     {__Levelarena_mgr162, __Tracesarena_mgr162}}
		when __Levelarena_mgr162 band 8 /= 0 orelse
		       __Tracesarena_mgr162 /= [] ->
		lager:do_log(error,
			     [{module, arena_mgr}, {function, handle_info},
			      {line, 162}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("查找不到角色信息:~w==~w",
					   [RoleId, AddScore]),
			     none, 4096, 8, __Levelarena_mgr162,
			     __Tracesarena_mgr162, lager_event,
			     __Pidarena_mgr162);
	    _ -> ok
	  end,
	  {noreply, State}
    end;
handle_info(season_reward,
	    State = #state{season_reward_time = SeasonRewardTime,
			   season_start_time = SeasonStartTime,
			   season_end_time = SeasonEndTime}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_mgr168, _,
       {__Levelarena_mgr168, __Tracesarena_mgr168}}
	  when __Levelarena_mgr168 band 64 /= 0 orelse
		 __Tracesarena_mgr168 /= [] ->
	  lager:do_log(info,
		       [{module, arena_mgr}, {function, handle_info},
			{line, 168}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("赛季结算处理:~w", [SeasonRewardTime]), none,
		       4096, 64, __Levelarena_mgr168, __Tracesarena_mgr168,
		       lager_event, __Pidarena_mgr168);
      _ -> ok
    end,
    {{_, M1, D1}, _} =
	date:seconds_to_datetime(SeasonStartTime),
    {{_, M2, D2}, _} =
	date:seconds_to_datetime(SeasonEndTime),
    Season = util:fbin("~w.~w-~w.~w", [M1, D1, M2, D2]),
    season_reward(1, Season),
    log_rank:save(5),
    NewState = State#state{season_reward_time =
			       SeasonRewardTime + 86400 * 7},
    save_state(NewState),
    {noreply, NewState};
handle_info(daily_reward, State) ->
    Now = date:unixtime(),
    Ret = daily_reward(1, 0, Now - 86400 * 30,
		       Now - 86400 * 7),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_mgr183, _,
       {__Levelarena_mgr183, __Tracesarena_mgr183}}
	  when __Levelarena_mgr183 band 64 /= 0 orelse
		 __Tracesarena_mgr183 /= [] ->
	  lager:do_log(info,
		       [{module, arena_mgr}, {function, handle_info},
			{line, 183}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("竞技场每日结算奖励:~w", [Ret]), none, 4096, 64,
		       __Levelarena_mgr183, __Tracesarena_mgr183, lager_event,
		       __Pidarena_mgr183);
      _ -> ok
    end,
    log_rank:save(5),
    util:set_timer(daily_reward_timer,
		   max(1,
		       date:next_diff(arena_data:get_const(daily_reward_time))),
		   daily_reward),
    {noreply, State};
handle_info(season_end,
	    State = #state{season_end_time = SeasonEndTime,
			   season_idx = SeasonIdx}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_mgr190, _,
       {__Levelarena_mgr190, __Tracesarena_mgr190}}
	  when __Levelarena_mgr190 band 64 /= 0 orelse
		 __Tracesarena_mgr190 /= [] ->
	  lager:do_log(info,
		       [{module, arena_mgr}, {function, handle_info},
			{line, 190}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("赛季结算处理:~w merge_handle=~w",
				     [SeasonEndTime, get(merge_handle)]),
		       none, 4096, 64, __Levelarena_mgr190,
		       __Tracesarena_mgr190, lager_event, __Pidarena_mgr190);
      _ -> ok
    end,
    Now = date:unixtime(),
    L = ets:tab2list(arena_role),
    Len = length(L),
    Timeout = if Len < 1000 -> 0;
		 Len > 12000 -> Now - 86400 * 60;
		 true -> Now - 86400 * 100
	      end,
    ets:delete_all_objects(arena_rank),
    ets:delete_all_objects(arena_role),
    ets:delete_all_objects(arena_update),
    dets:delete_all_objects(arena_role_1),
    dets:delete_all_objects(arena_role_2),
    dets:delete_all_objects(arena_role_3),
    L1 = util:keys_sort([{asc, #arena_role.time},
			 #arena_role.score],
			L),
    NextRank = season_reset(L1, Timeout,
			    arena_data:get_const(reset_score), 1),
    {NextSeasonStartTime, NextSeasonEndTime,
     SeasonRewardTime} =
	calc_season_time(),
    NewState = State#state{season_start_time =
			       NextSeasonStartTime,
			   season_end_time = NextSeasonEndTime,
			   season_reward_time = SeasonRewardTime,
			   next_rank = NextRank, season_idx = SeasonIdx + 1},
    save_state(NewState),
    util:set_timer(season_end_timer,
		   max(10, NextSeasonEndTime - date:unixtime()),
		   season_end),
    util:set_timer(season_reward_timer,
		   max(20, SeasonRewardTime - date:unixtime()),
		   season_reward),
    {noreply, NewState};
handle_info(merge_reward, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_mgr216, _,
       {__Levelarena_mgr216, __Tracesarena_mgr216}}
	  when __Levelarena_mgr216 band 64 /= 0 orelse
		 __Tracesarena_mgr216 /= [] ->
	  lager:do_log(info,
		       [{module, arena_mgr}, {function, handle_info},
			{line, 216}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "合服赛季结算处理", none, 4096, 64, __Levelarena_mgr216,
		       __Tracesarena_mgr216, lager_event, __Pidarena_mgr216);
      _ -> ok
    end,
    Flag = util:get(merge_reward_finish, false),
    case Flag of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_mgr220, _,
	     {__Levelarena_mgr220, __Tracesarena_mgr220}}
		when __Levelarena_mgr220 band 64 /= 0 orelse
		       __Tracesarena_mgr220 /= [] ->
		lager:do_log(info,
			     [{module, arena_mgr}, {function, handle_info},
			      {line, 220}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "竞技场已经进行过合服结算了", none, 4096, 64,
			     __Levelarena_mgr220, __Tracesarena_mgr220,
			     lager_event, __Pidarena_mgr220);
	    _ -> ok
	  end;
      _ ->
	  merge_reward(1),
	  log_rank:save(5),
	  put(merge_reward_finish, true)
    end,
    {noreply, State};
handle_info(gm_set_time, State) ->
    Now = date:unixtime(),
    {_, H, M, S} = arena_data:get_const(season_time),
    NewSeasonEndTime = Now + date:next_diff({H, M, S}),
    NewSeasonRewardTime = NewSeasonEndTime - 3600 * 3,
    NewState = State#state{season_end_time =
			       NewSeasonEndTime,
			   season_reward_time = NewSeasonRewardTime},
    save_state(NewState),
    util:set_timer(season_end_timer,
		   max(10, NewSeasonEndTime - date:unixtime()),
		   season_end),
    util:set_timer(season_reward_timer,
		   max(20, NewSeasonRewardTime - date:unixtime()),
		   season_reward),
    {noreply, NewState};
handle_info(reset_rank, State) ->
    L = ets:tab2list(arena_role),
    ets:delete_all_objects(arena_rank),
    ets:delete_all_objects(arena_role),
    ets:delete_all_objects(arena_update),
    dets:delete_all_objects(arena_role_1),
    dets:delete_all_objects(arena_role_2),
    dets:delete_all_objects(arena_role_3),
    L1 = util:keys_sort([{asc, #arena_role.time},
			 #arena_role.score],
			L),
    NextRank = reset_rank(L1, 1),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_mgr251, _,
       {__Levelarena_mgr251, __Tracesarena_mgr251}}
	  when __Levelarena_mgr251 band 64 /= 0 orelse
		 __Tracesarena_mgr251 /= [] ->
	  lager:do_log(info,
		       [{module, arena_mgr}, {function, handle_info},
			{line, 251}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("重置排名榜:~w", [NextRank]), none, 4096, 64,
		       __Levelarena_mgr251, __Tracesarena_mgr251, lager_event,
		       __Pidarena_mgr251);
      _ -> ok
    end,
    NewState = State#state{next_rank = NextRank},
    {noreply, NewState};
handle_info(_Info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_mgr256, _,
       {__Levelarena_mgr256, __Tracesarena_mgr256}}
	  when __Levelarena_mgr256 band 8 /= 0 orelse
		 __Tracesarena_mgr256 /= [] ->
	  lager:do_log(error,
		       [{module, arena_mgr}, {function, handle_info},
			{line, 256}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("接收到非法信息:~w", [_Info]), none, 4096, 8,
		       __Levelarena_mgr256, __Tracesarena_mgr256, lager_event,
		       __Pidarena_mgr256);
      _ -> ok
    end,
    {noreply, State}.

terminate(_Reason, State) ->
    save_state(State),
    [dets:insert(get_dets(RoleId), R)
     || R = #arena_role{id = RoleId}
	    <- ets:tab2list(arena_role)],
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_mgr262, _,
       {__Levelarena_mgr262, __Tracesarena_mgr262}}
	  when __Levelarena_mgr262 band 64 /= 0 orelse
		 __Tracesarena_mgr262 /= [] ->
	  lager:do_log(info,
		       [{module, arena_mgr}, {function, terminate},
			{line, 262}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("竞技场关闭完成", []), none, 4096, 64,
		       __Levelarena_mgr262, __Tracesarena_mgr262, lager_event,
		       __Pidarena_mgr262);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

save_state(#state{season_start_time = SeasonStartTime,
		  season_end_time = SeasonEndTime,
		  season_reward_time = SeasonRewardTime,
		  season_idx = SeasonIdx}) ->
    sys_env:save(arena_state,
		 #{season_start_time => SeasonStartTime,
		   season_end_time => SeasonEndTime,
		   season_reward_time => SeasonRewardTime,
		   season_idx => SeasonIdx}).

do_init() ->
    d_ets_lib:load_dets_to_ets(arena_role_1, arena_role,
			       fun (D) -> arena_role_ver(D) end),
    d_ets_lib:load_dets_to_ets(arena_role_2, arena_role,
			       fun (D) -> arena_role_ver(D) end),
    d_ets_lib:load_dets_to_ets(arena_role_3, arena_role,
			       fun (D) -> arena_role_ver(D) end),
    Fun = fun (#arena_role{id = RoleId, rank = Rank,
			   score = Score},
	       Rank1) ->
		  case Rank > 0 of
		    true ->
			ets:insert(arena_rank,
				   #arena_rank{rank = Rank, id = RoleId,
					       score = Score});
		    _ -> skip
		  end,
		  max(Rank, Rank1)
	  end,
    ets:foldl(Fun, 0, arena_role) + 1.

arena_role_ver({arena_role, Id, Name, Lev, Sex, Gid,
		Gname, Face, Power, MaxPower, LookId, Score, Rank, Time,
		AvatarId, ChampionPower}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    arena_role_ver({arena_role, Id, Name, Lev, Sex, Gid,
		    Gname, Face, Power, MaxPower, LookId, Score, Rank, Time,
		    AvatarId, ChampionPower, FaceUpdateTime, FaceFile});
arena_role_ver(R = #arena_role{}) -> {ok, R}.

update_rank(ArenaRole = #arena_role{id = RoleId,
				    score = Score, rank = 0},
	    ChangeScore, State = #state{next_rank = NextRank}) ->
    case Score < arena_data:get_const(in_rank_min_score) of
      true -> update_ets(ArenaRole, ets), {noreply, State};
      false ->
	  {ok, #arena_role{rank = NewRank}} =
	      do_update_rank(ArenaRole#arena_role{rank = NextRank},
			     ChangeScore),
	  role_lib:cast(by_id, RoleId,
			{arena, set_best_rank, [NewRank]}),
	  {noreply,
	   State#state{next_rank = NextRank + 1,
		       last_time = date:unixtime()}}
    end;
update_rank(ArenaRole = #arena_role{id = RoleId,
				    rank = OldRank},
	    ChangeScore, State = #state{next_rank = NextRank}) ->
    {ok, #arena_role{rank = NewRank}} =
	do_update_rank(ArenaRole, ChangeScore),
    case NewRank < OldRank andalso NewRank > 0 of
      true ->
	  role_lib:cast(by_id, RoleId,
			{arena, set_best_rank, [NewRank]});
      _ -> role_lib:cast(by_id, RoleId, {arena, push, []})
    end,
    NewNextRank = util:if_true(NewRank =:= 0, NextRank - 1,
			       NextRank),
    {noreply,
     State#state{next_rank = NewNextRank,
		 last_time = date:unixtime()}}.

do_update_rank(ArenaRole = #arena_role{rank = 1},
	       ChangeScore)
    when ChangeScore >= 0 ->
    update_ets(ArenaRole, ets), {ok, ArenaRole};
do_update_rank(ArenaRole = #arena_role{rank = Rank,
				       score = Score},
	       ChangeScore)
    when ChangeScore >= 0 ->
    case ets:lookup(arena_rank, Rank - 1) of
      [#arena_rank{id = RoleId2, score = Score2}]
	  when Score > Score2 ->
	  ets:insert(arena_rank,
		     #arena_rank{rank = Rank, id = RoleId2, score = Score2}),
	  ets:update_element(arena_role, RoleId2,
			     {#arena_role.rank, Rank}),
	  ets:insert(arena_update, {RoleId2}),
	  do_update_rank(ArenaRole#arena_role{rank = Rank - 1},
			 ChangeScore);
      _ -> update_ets(ArenaRole, ets), {ok, ArenaRole}
    end;
do_update_rank(ArenaRole = #arena_role{rank = Rank,
				       score = Score},
	       ChangeScore) ->
    case ets:lookup(arena_rank, Rank + 1) of
      [#arena_rank{id = RoleId2, score = Score2}]
	  when Score < Score2 ->
	  ets:insert(arena_rank,
		     #arena_rank{rank = Rank, id = RoleId2, score = Score2}),
	  ets:update_element(arena_role, RoleId2,
			     {#arena_role.rank, Rank}),
	  ets:insert(arena_update, {RoleId2}),
	  do_update_rank(ArenaRole#arena_role{rank = Rank + 1},
			 ChangeScore);
      _ ->
	  case Score >= arena_data:get_const(in_rank_min_score) of
	    true -> update_ets(ArenaRole, ets), {ok, ArenaRole};
	    false ->
		ets:delete(arena_rank, Rank),
		update_ets(ArenaRole#arena_role{rank = 0}, ets),
		{ok, ArenaRole#arena_role{rank = 0}}
	  end
    end.

calc_season_time() ->
    Now = date:unixtime(),
    StartTime = max(date:unixtime({zero, Now + 10}),
		    game_lib:server_open_time(zero)),
    EndTime = StartTime +
		date:time_sec(arena_data:get_const(season_time)),
    RewardTime = StartTime +
		   date:time_sec(arena_data:get_const(reward_time)),
    {StartTime, EndTime, RewardTime}.

season_reward(Rank, Season) ->
    case arena_data:rank_reward(Rank) of
      Items = [_ | _] ->
	  case arena_lib:rank_role(Rank) of
	    {ok,
	     #arena_role{id = RoleId, name = Name, score = Score}} ->
		room_feat_mgr:info({arena_do_feat, RoleId, Rank}),
		mail:send(RoleId,
			  {lang:get(<<"Giải quyết mùa đấu trường"/utf8>>),
			   color:msg(lang:get(<<"Trong số cuối cùng (~ts) của cuộc thi "
						"đấu trường, xin chúc mừng bạn đã giành "
						"được vị trí ~ts. Bây giờ bạn sẽ nhận "
						"được phần thưởng quyết toán.！"/utf8>>),
				     [{string, Season}, {green, Rank}]),
			   items, Items, <<"Đấu trường"/utf8>>}),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_mgr364, _,
		   {__Levelarena_mgr364, __Tracesarena_mgr364}}
		      when __Levelarena_mgr364 band 64 /= 0 orelse
			     __Tracesarena_mgr364 /= [] ->
		      lager:do_log(info,
				   [{module, arena_mgr},
				    {function, season_reward}, {line, 364},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~w:~ts 积分:~w 获得赛季排名奖励:~w",
						 [RoleId, Name, Score, Rank]),
				   none, 4096, 64, __Levelarena_mgr364,
				   __Tracesarena_mgr364, lager_event,
				   __Pidarena_mgr364);
		  _ -> ok
		end,
		season_reward(Rank + 1, Season);
	    _ -> ok
	  end;
      _ -> ok
    end.

daily_reward(Rank, Num, TimeOut, TimeOut2) ->
    case arena_data:day_rank_reward(Rank) of
      Items = [_ | _] ->
	  case arena_lib:rank_role(Rank) of
	    {ok, #arena_role{id = RoleId, time = Time}} ->
		case Time > TimeOut of
		  true ->
		      case Time > TimeOut2 of
			true ->
			    mail:send(RoleId,
				      {lang:get(<<"Phần thưởng xếp hạng hàng ngày của đấu "
						  "trường"/utf8>>),
				       color:msg(lang:get(<<"Kính gửi Quý Nhẫn Giả, vào lúc 21:00 "
							    "hôm nay, bạn đã đạt được thứ hạng ~ts "
							    "trong bảng xếp hạng đấu trường và nhận "
							    "được phần thưởng xếp hạng sau! làm ơn "
							    "lần nữaHãy tiếp tục làm tốt công việc "
							    "nhé！ヾ（≧∇≦）〃"/utf8>>),
						 [{green, Rank}]),
				       items, Items, <<"Đấu trường"/utf8>>});
			_ ->
			    mail:send(RoleId,
				      {lang:get(<<"Phần thưởng xếp hạng hàng ngày của đấu "
						  "trường"/utf8>>),
				       color:msg(lang:get(<<"Kính gửi Quý Nhẫn Giả, vào lúc 21:00 "
							    "hôm nay, bạn đã đạt được thứ hạng ~ts "
							    "trong bảng xếp hạng đấu trường và nhận "
							    "được phần thưởng xếp hạng sau.！làm ơn "
							    "lần nữaHãy tiếp tục làm tốt công việc "
							    "nhé！ヾ（≧∇≦）〃"/utf8>>),
						 [{green, Rank}]),
				       items, Items, <<"log"/utf8>>})
		      end,
		      daily_reward(Rank + 1, Num + 1, TimeOut, TimeOut2);
		  _ -> daily_reward(Rank + 1, Num, TimeOut, TimeOut2)
		end;
	    _ -> {Rank, Num, TimeOut, TimeOut2}
	  end;
      _ -> {Rank, Num, TimeOut, TimeOut2}
    end.

merge_reward(Rank) ->
    case arena_data:rank_reward(Rank) of
      Items = [_ | _] ->
	  case arena_lib:rank_role(Rank) of
	    {ok, #arena_role{id = RoleId}} ->
		mail:send(RoleId,
			  {lang:get(<<"Mùa giải đấu trường máy chủ tổng hợp "
				      "sẽ được giải quyết trước"/utf8>>),
			   color:msg(lang:get(<<"Các Quý Nhẫn Giả thân mến, do máy chủ "
						"này sắp được sáp nhập nên mùa giải đấu "
						"trường sẽ được thiết lập lại sau khi "
						"hợp nhất máy chủ, vì vậy mùa thi đấu "
						"trước khi hợp nhất máy chủ sẽ được thiết "
						"lập lạiViệc giải quyết sẽ được thực "
						"hiện trước. Trước khi sáp nhập máy chủ, "
						"thứ hạng đấu trường của bạn là ~ts. "
						"Bây giờ bạn sẽ nhận được phần thưởng "
						"thanh toán. Hãy đạt được kết quả tuyệt "
						"vời trong cuộc thi mới！"/utf8>>),
				     [{green, Rank}]),
			   items, Items, <<"Đấu trường"/utf8>>}),
		merge_reward(Rank + 1);
	    _ -> ok
	  end;
      _ -> ok
    end.

season_reset([], _Timeout, _ResetScore, Rank) -> Rank;
season_reset([R = #arena_role{time = Time,
			      score = Score}
	      | T],
	     Timeout, ResetScore, Rank)
    when Time > Timeout ->
    NewScore = max(arena_data:get_const(init_score),
		   round(Score * ResetScore / 1000)),
    case NewScore >= arena_data:get_const(in_rank_min_score)
	of
      true ->
	  update_ets(R#arena_role{score = NewScore, rank = Rank},
		     all),
	  season_reset(T, Timeout, ResetScore, Rank + 1);
      _ ->
	  update_ets(R#arena_role{score = NewScore, rank = 0},
		     all),
	  season_reset(T, Timeout, ResetScore, Rank)
    end;
season_reset([_ | T], Timeout, ResetScore, Rank) ->
    season_reset(T, Timeout, ResetScore, Rank).

reset_rank([], Rank) -> Rank;
reset_rank([R = #arena_role{score = Score} | T],
	   Rank) ->
    case Score >= arena_data:get_const(in_rank_min_score) of
      true ->
	  update_ets(R#arena_role{rank = Rank}, all),
	  reset_rank(T, Rank + 1);
      _ -> update_ets(R, all), reset_rank(T, Rank)
    end.

do_save_update([]) -> skip;
do_save_update([{RoleId} | T]) ->
    case arena_lib:get_role(RoleId) of
      {ok, ArenaRole} ->
	  dets:insert(get_dets(RoleId), ArenaRole);
      _ -> skip
    end,
    do_save_update(T).

notice_merge_reward(_Args) ->
    arena_mgr:info(merge_reward), ok.


