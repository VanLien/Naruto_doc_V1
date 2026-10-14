-file("src/mod/data/say.erl", 1).

-module(say).

-lager_records([{arena_team_arge,
		 [result, win_count, lose_count, a_team_id, a_score,
		  a_new_score, a_rank, a_new_rank, a_team_members,
		  a_team_name, b_team_id, b_score, b_new_score, b_rank,
		  b_new_rank, b_team_name, b_team_members,
		  all_hurt_statistics, extra]},
		{arena_team_replay_partner,
		 [pos, bid, lev, star, skin_id, ext]},
		{arena_team_replay_info,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_team_log,
		 [id, atk_id, atk_name, a_score, a_new_score, a_rank,
		  a_new_rank, a_team_members, a_team_power, b_team_id,
		  b_score, b_new_score, b_rank, b_new_rank, b_team_name,
		  b_team_members, b_team_power, ret, win_count,
		  lose_count, replay_list, time]},
		{role_arena_team_log, [id, list]},
		{arena_term_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, skin_id,
		  dower_skill, set_skill, attr, extra]},
		{arena_team_defense,
		 [order, role_id, role_lev, formation_type, hallows_id,
		  hallows_lev, hallows_skill_lev, partner_infos,
		  hallows_look_id, hallows_lucky, hallows_seal,
		  hallows_refine, hallows_all_look_ids, sprite_lev,
		  sprites, sprites_attr, extra, break_groups]},
		{arena_team_rival,
		 [id, leader_id, team_name, team_power, team_rank,
		  team_score, team_members, defense, ext]},
		{arena_team_partner,
		 [pos, id, bid, lev, star, break_lev, power, skin_id,
		  ext]},
		{arena_team_member,
		 [id, name, lev, face_id, avatar_bid, power, pos,
		  is_hide, team_partner, formation_type, hallows_id,
		  sprite_lev, sprites, ext, face_update_time, face_file,
		  break_groups]},
		{c_arena_team,
		 [ver, id, rank, score, team_match_power, score_time,
		  ext, members]},
		{arena_team,
		 [ver, id, creat_id, leader_id, leader_name, team_pid,
		  team_name, team_limit_power, team_limit_lev,
		  team_is_check, team_power, team_match_power,
		  team_members, join_list, is_sign, join_num, rival_info,
		  count, add_time, combat_count]},
		{m_arena_team,
		 [ver, period, team_id, combat_count, award_list,
		  old_data, point_info]},
		{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
		{cluster_dynamic_local_group, [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
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
		{honor_info, [key, list, end_time]},
		{honor_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr, add_exp, dynamic]},
		{honor, [ver, base_id, expire_time]},
		{m_honor, [ver, used, list]}, {role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
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
		{pos,
		 [ver, srv_id, map_id, map_pid, map_bid, map_grid_pid,
		  last, hidden, x, y, dir]},
		{pos_history, [map_id, map_bid, srv_id, x, y]},
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

-export([ready/1, translate/2, speak/2,
	 do_check_speak/3, init/0, pack_speak/2, mention/3,
	 read_mention/2, say_history/1, lookup_say_history/1,
	 silent/4, replace_emoji/2, check_ban/1]).

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

-file("src/mod/data/say.erl", 22).

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

-file("src/mod/data/say.erl", 23).

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

-file("src/mod/data/say.erl", 24).

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

-file("src/mod/data/say.erl", 25).

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

-file("src/mod/data/say.erl", 26).

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

-file("src/mod/data/say.erl", 27).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/data/say.erl", 28).

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

-file("src/mod/data/say.erl", 29).

-file("inc/honor.hrl", 1).

-record(m_honor, {ver = 1, used = 0, list = []}).

-record(honor, {ver = 1, base_id = 0, expire_time = 0}).

-record(honor_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = [], add_exp = 0, dynamic = 0}).

-record(honor_info,
	{key  :: atom(), list = []  :: list(),
	 end_time = 0  :: non_neg_integer()}).

-file("src/mod/data/say.erl", 30).

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

-file("src/mod/data/say.erl", 31).

-file("inc/cluster_dynamic_group.hrl", 1).

-record(cluster_dynamic_group,
	{id = {1, <<>>}, min_world_lev = 0, group_lev = 0,
	 mode = 1, list = [], srv_num = 0, time = 0}).

-record(cluster_dynamic_srv,
	{id = {1, <<>>}, name = <<>>, main_srv = <<>>,
	 list = [], mode = 1, group_lev = 0, init_world_lev = 0,
	 world_lev = 0, open_time = 0, time = 0}).

-record(cluster_dynamic_local_group,
	{type = 0, main, list = []}).

-file("src/mod/data/say.erl", 32).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/data/say.erl", 33).

-file("inc/arena_team.hrl", 1).

-record(m_arena_team,
	{ver = 4, period = 0, team_id = {0, <<>>},
	 combat_count = 0, award_list = [], old_data = [],
	 point_info = []}).

-record(arena_team,
	{ver = 1, id = {0, <<>>}, creat_id = {0, <<>>},
	 leader_id = {0, <<>>}, leader_name = <<>>, team_pid = 0,
	 team_name = <<>>, team_limit_power = 0,
	 team_limit_lev = 0, team_is_check = 0, team_power = 0,
	 team_match_power = 0, team_members = [], join_list = [],
	 is_sign = 0, join_num = 1, rival_info = [], count = 0,
	 add_time = 0, combat_count = 0}).

-record(c_arena_team,
	{ver = 1, id = {0, <<>>}, rank = 0, score = 1000,
	 team_match_power = 0, score_time = 0, ext = [],
	 members = []}).

-record(arena_team_member,
	{id = {0, <<>>}, name = <<>>, lev = 0, face_id = 0,
	 avatar_bid = 0, power = 0, pos = 0, is_hide = 0,
	 team_partner = [], formation_type = 1, hallows_id = 0,
	 sprite_lev = 0, sprites = [], ext = [],
	 face_update_time = 0, face_file = <<>>,
	 break_groups = []}).

-record(arena_team_partner,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, skin_id = 0, ext = []}).

-record(arena_team_rival,
	{id = {0, <<>>}, leader_id = {0, <<>>},
	 team_name = <<>>, team_power = 0, team_rank = 0,
	 team_score = 0, team_members = [], defense = [],
	 ext = []}).

-record(arena_team_defense,
	{order, role_id, role_lev, formation_type, hallows_id,
	 hallows_lev, hallows_skill_lev, partner_infos,
	 hallows_look_id, hallows_lucky, hallows_seal,
	 hallows_refine, hallows_all_look_ids = [],
	 sprite_lev = 0, sprites = [], sprites_attr, extra = [],
	 break_groups = []}).

-record(arena_term_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, skin_id = 0, dower_skill = [],
	 set_skill = [], attr, extra = []}).

-record(role_arena_team_log,
	{id = {0, <<>>}, list = []}).

-record(arena_team_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 a_score = 0, a_new_score = 0, a_rank = 0,
	 a_new_rank = 0, a_team_members = [], a_team_power = 0,
	 b_team_id = {0, <<>>}, b_score = 0, b_new_score = 0,
	 b_rank = 0, b_new_rank = 0, b_team_name = <<>>,
	 b_team_members = [], b_team_power = 0, ret = 1,
	 win_count = 0, lose_count = 0, replay_list = [],
	 time = 0}).

-record(arena_team_replay_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_team_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, skin_id = 0,
	 ext = []}).

-record(arena_team_arge,
	{result = 0, win_count = 0, lose_count = 0,
	 a_team_id = {0, <<>>}, a_score = 0, a_new_score = 0,
	 a_rank = 0, a_new_rank = 0, a_team_members = [],
	 a_team_name = 0, b_team_id = {0, <<>>}, b_score = 0,
	 b_new_score = 0, b_rank = 0, b_new_rank = 0,
	 b_team_name = 0, b_team_members = [],
	 all_hurt_statistics = [], extra = []}).

-file("src/mod/data/say.erl", 34).

-spec ready(#role{}) -> ok.

ready(Role = #role{id = RoleId, lev = Lev,
		   guild_bag = #guild_bag{pid = GuildPid}}) ->
    {ProvinceName, _CityName} =
	role_misc:get_city_name(Role),
    say_mgr:info({world_say_push, RoleId, get('@conn_pid'),
		  ProvinceName, Lev}),
    guild:info(GuildPid, {say_push, get('@conn_pid')}),
    arena_team_lib:push_team_msg(Role),
    re_mention(Role),
    ok.

init() -> #m_say{}.

-spec translate(#role{}, tuple()) -> ok.

translate(Role = #role{id = {Rid, RSrvId}},
	  {Channel, TId, SayMsg}) ->
    Data = #{msg => SayMsg, len => 0, channel => Channel},
    case check_speak(Role, Data) of
      {false, Reason} -> {false, Reason};
      {false, Reason, NRole} -> {false, Reason, NRole};
      {send_self, Reason, NRole} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsay61, _, {__Levelsay61, __Tracessay61}}
		when __Levelsay61 band 128 /= 0 orelse
		       __Tracessay61 /= [] ->
		lager:do_log(debug,
			     [{module, say}, {function, translate}, {line, 61},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~ts语音存在问题,只发给自己：~ts",
					   [Role#role.name, Reason]),
			     none, 4096, 128, __Levelsay61, __Tracessay61,
			     lager_event, __Pidsay61);
	    _ -> ok
	  end,
	  {false, Reason, NRole};
      ok ->
	  {FilterMsg, KeyWords} =
	      keyword:filter_return_keyword(SayMsg),
	  translate_broadcast(Role, Channel,
			      {Channel, TId, FilterMsg}),
	  log:chat(Role, Channel, <<>>, SayMsg, KeyWords),
	  insert_say_history({Rid, RSrvId}, {Channel, FilterMsg}),
	  ok
    end.

translate_broadcast(_Role, 1, SayData) ->
    role_group:pack_send(world, 12763, SayData);
translate_broadcast(_Role, 1024, SayData) ->
    case cluster_dynamic_group:group_cast(1, role_group,
					  pack_send, [world, 12763, SayData])
	of
      false ->
	  notice:alert(lang:get(<<"当前与跨服时空断开连接，请耐心等待下次跨服重组"/utf8>>));
      _ -> ok
    end;
translate_broadcast(Role, 4, SayData) ->
    guild_member:pack_send(Role, all, 12763, SayData);
translate_broadcast(Role, 8, SayData) ->
    arena_team_action:translate_broadcast(Role, SayData);
translate_broadcast(Role, 2048, SayData) ->
    {PName, _CityName} = role_misc:get_city_name(Role),
    case cluster_lib:cast(all, role_group, cond_send,
			  [{province, PName,
			    misc_data:get_const(province_level)},
			   12763, SayData])
	of
      {error, _} ->
	  notice:alert(lang:get(<<"当前与跨服时空断开连接，请耐心等待下次跨服重组"/utf8>>));
      _ -> ok
    end;
translate_broadcast(_Role, _Channel, _SayData) -> ok.

-spec speak(#role{}, map()) -> ok |
			       {false, bitstring()} |
			       {false, bitstring(), #role{}}.

speak(Role,
      Data = #{from := sys, msg := SayMsg, len := Len,
	       channel := Channel}) ->
    case do_check_speak(lev, Role, Data) of
      ok ->
	  CheckWord = maps:get(check, Data, <<>>),
	  case CheckWord == <<>> of
	    true ->
		SayMsgData = pack_speak(Role, {Channel, Len, SayMsg}),
		notice:alert(maps:get(alert, Data,
				      lang:get(<<"分享成功"/utf8>>))),
		speak_broadcast(Role, Data, Channel, SayMsgData);
	    _ ->
		case do_check_speak([channel, ad, banned, ad2, cd,
				     space, ban_word],
				    Role,
				    Data#{msg => CheckWord, msg2 => CheckWord})
		    of
		  ok ->
		      SayMsgData = pack_speak(Role, {Channel, Len, SayMsg}),
		      notice:alert(maps:get(alert, Data,
					    lang:get(<<"分享成功"/utf8>>))),
		      speak_broadcast(Role, Data, Channel, SayMsgData);
		  _ERR ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidsay114, _, {__Levelsay114, __Tracessay114}}
			    when __Levelsay114 band 128 /= 0 orelse
				   __Tracessay114 /= [] ->
			    lager:do_log(debug,
					 [{module, say}, {function, speak},
					  {line, 114},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("分享失败 ~w", [_ERR]), none,
					 4096, 128, __Levelsay114,
					 __Tracessay114, lager_event,
					 __Pidsay114);
			_ -> ok
		      end,
		      ok
		end
	  end;
      {false, Msg} -> notice:alert(Msg), ok
    end;
speak(Role = #role{id = {Rid, RSrvId}, name = RoleName},
      Data = #{msg := SayMsg, len := Len,
	       channel := Channel}) ->
    case check_speak(Role, Data) of
      {false, Reason} -> {false, Reason};
      {false, Reason, NRole} -> {false, Reason, NRole};
      {send_self, Reason, NRole} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsay129, _, {__Levelsay129, __Tracessay129}}
		when __Levelsay129 band 128 /= 0 orelse
		       __Tracessay129 /= [] ->
		lager:do_log(debug,
			     [{module, say}, {function, speak}, {line, 129},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~ts信息存在问题,只发给自己：~ts",
					   [Role#role.name, Reason]),
			     none, 4096, 128, __Levelsay129, __Tracessay129,
			     lager_event, __Pidsay129);
	    _ -> ok
	  end,
	  {false, Reason, NRole};
      ok ->
	  {FilterMsg, KeyWords} = case Len of
				    1 -> {SayMsg, []};
				    _ -> keyword:filter_return_keyword(SayMsg)
				  end,
	  SayMsgData = pack_speak(Role,
				  {Channel, Len, FilterMsg}),
	  case speak_broadcast(Role, Data, Channel, SayMsgData) of
	    ok when Len =/= 1 ->
		SenderInfo = {Rid, RSrvId, RoleName, Channel, SayMsg},
		erlang:send_after(1000, say_mgr,
				  {mention, SayMsg, Channel, SenderInfo}),
		log:chat(Role, Channel, <<>>, SayMsg, KeyWords),
		insert_say_history({Rid, RSrvId}, {Channel, FilterMsg}),
		ok;
	    Ret -> Ret
	  end
    end.

-spec pack_speak(#role{}, tuple()) -> tuple().

pack_speak(Role = #role{id = {Rid, SrvId}, name = Name,
			face_id = FaceId, lev = Lev, sex = Sex, career = Career,
			capacity = Capacity, m_vip = #m_vip{lev = VipLev},
			guild_bag =
			    #guild_bag{id = GuildId, name = GuildName,
				       post = Post},
			m_avatar = #m_avatar{used = AvatarUsed},
			m_say = #m_say{used = ChatBubbleBid},
			m_honor = #m_honor{used = Honor}},
	   {Channel, Len, SayMsg}) ->
    ExtList1 = case Channel of
		 4 -> [{1, Post}];
		 8 -> [{4, arena_team_lib:is_leader(Role)}];
		 _ ->
		     ArenaLev = arena:role_score_lev(Role),
		     case ArenaLev > 0 of
		       true -> [{2, ArenaLev}];
		       _ -> []
		     end
	       end,
    ExtList = case Honor of
		Honor when is_integer(Honor) andalso Honor =/= 0 ->
		    [{3, Honor} | ExtList1];
		_ -> ExtList1
	      end,
    NewIsShowVip = 0,
    {ProvinceNameT, CityName} =
	role_misc:get_city_name(Role),
    ProvinceName = util:if_true(ProvinceNameT =:= <<>>,
				lang:get(<<"神秘之地"/utf8>>), ProvinceNameT),
    {Province, City} = case Channel of
			 2048 ->
			     {ProvinceName,
			      util:if_true(CityName =:= <<>>, ProvinceName,
					   CityName)};
			 _ -> {<<>>, <<>>}
		       end,
    {_, FaceFile, FaceUpdateTime} =
	role_face:face_info(Role),
    {[{Rid, SrvId, Name,
       util:if_true(holiday_return_new:is_return({Rid, SrvId})
		      =:= 1,
		    FaceId * 10000, FaceId),
       Lev, Sex, Career, VipLev, NewIsShowVip, Province, City,
       Capacity, AvatarUsed, ChatBubbleBid, ExtList, GuildId,
       GuildName, FaceUpdateTime, FaceFile}],
     Channel, Len, SayMsg, date:unixtime()}.

speak_broadcast(Role, #{auto_cross := true},
		Channel = 1, SayData) ->
    case sys_env:get(group_id) of
      0 ->
	  role_group:pack_send(world, 12761, SayData),
	  say_mgr:info({say, 1, SayData}),
	  role_trigger:async_fire(Role,
				  #evt_say{channel = Channel}),
	  ok;
      _ ->
	  NewSayData = setelement(2, SayData, 1024),
	  cluster_dynamic_group:group_cast(1, say_mgr, info,
					   [{say, 1024, NewSayData}]),
	  cluster_dynamic_group:group_cast(1, role_group,
					   pack_send,
					   [world, 12761, NewSayData]),
	  ok
    end;
speak_broadcast(Role, _ExtData, Channel = 1, SayData) ->
    role_group:pack_send(world, 12761, SayData),
    say_mgr:info({say, 1, SayData}),
    role_trigger:async_fire(Role,
			    #evt_say{channel = Channel}),
    ok;
speak_broadcast(_Role, _ExtData, 1024, SayData) ->
    case cluster_dynamic_group:group_cast(1, say_mgr, info,
					  [{say, 1024, SayData}])
	of
      false ->
	  notice:alert(lang:get(<<"当前与跨服时空断开连接，请耐心等待下次跨服重组"/utf8>>));
      _ ->
	  cluster_dynamic_group:group_cast(1, role_group,
					   pack_send, [world, 12761, SayData])
    end,
    ok;
speak_broadcast(#role{guild_bag =
			  #guild_bag{pid = GuildPid}},
		_ExtData, 4, SayData) ->
    case is_pid(GuildPid) of
      true -> guild:info(GuildPid, {say, SayData, true}), ok;
      _ -> {false, lang:get(<<"你没有公会"/utf8>>)}
    end;
speak_broadcast(Role, _ExtData, 8, SayData) ->
    arena_team_action:speak(Role, SayData);
speak_broadcast(#role{pos =
			  #pos{map_id = MapId, srv_id = SrvId}},
		_ExtData, 2, SayData) ->
    cluster_lib:cast(SrvId, map, pack_send_to_all,
		     [MapId, 12761, SayData]),
    ok;
speak_broadcast(Role, _ExtData, 2048, SayData) ->
    {PName, _CityName} = role_misc:get_city_name(Role),
    case cluster_lib:cast(all, say_mgr, info,
			  [{say, 2048, PName, SayData}])
	of
      {error, _} ->
	  notice:alert(lang:get(<<"当前与跨服时空断开连接，请耐心等待下次跨服重组"/utf8>>));
      _ ->
	  cluster_lib:cast(all, role_group, cond_send,
			   [{province, PName,
			     misc_data:get_const(province_level)},
			    12761, SayData])
    end,
    ok;
speak_broadcast(_Role, _ExtData, 8, _SayData) ->
    {false, lang:get(<<"你没有队伍"/utf8>>)};
speak_broadcast(_Role, _ExtData, _Channel, _SayData) ->
    ok.

-spec check_speak(#role{}, map()) -> ok |
				     {false, bitstring()} |
				     {false, bitstring(), #role{}} |
				     {send_self, bitstring(), #role{}}.

check_speak(Role = #role{lev = Lev},
	    Data = #{msg := SayMsg}) ->
    L = [lev, channel, emulator, ad, banned, sys_ban, ad2,
	 msg_len, cross, cd, space, repeak2, voice, sign],
    {NSayMsg, NoNameMsg, Flag} = replace_mention(SayMsg),
    case Flag == true andalso
	   Lev < say_data:const(at_condition)
	of
      true -> {send_self, <<>>, Role};
      _ ->
	  NSayMsg2 = replace_emoji(NSayMsg, <<>>),
	  NoNameMsg2 = replace_emoji(NoNameMsg, <<>>),
	  do_check_speak(L, Role,
			 Data#{msg => NSayMsg, msg2 => NSayMsg2,
			       msg3 => NoNameMsg2, origin_msg => SayMsg})
    end.

do_check_speak([], _Role, _Data) -> ok;
do_check_speak([Label | T], Role, Data) ->
    case do_check_speak(Label, Role, Data) of
      ok -> do_check_speak(T, Role, Data);
      Ret -> Ret
    end;
do_check_speak(_,
	       #role{misc = #role_misc{need_captcha = 1}}, _) ->
    {false, <<>>};
do_check_speak(lev, #role{lev = Lev},
	       #{channel := Channel}) ->
    LimitLev = case Channel of
		 1024 -> misc_data:get_const(cross_level);
		 1 -> 20;
		 2048 -> misc_data:get_const(province_level);
		 8 -> arena_team_data:get_const(open_lev);
		 _ -> 1
	       end,
    util:if_true(Lev >= LimitLev, ok,
		 {false,
		  util:fbin(lang:get(<<"等级不足~w级, 频道未开启"/utf8>>),
			    [LimitLev])});
do_check_speak(channel, _Role, #{channel := Channel}) ->
    util:if_true(lists:member(Channel,
			      [1, 2, 4, 8, 16, 32, 64, 128, 1024, 2048]),
		 ok, {false, lang:get(<<"频道异常"/utf8>>)});
do_check_speak(emulator,
	       Role = #role{lev = Lev, m_vip = #m_vip{lev = VipLev}},
	       _Data) ->
    case get(emulator) of
      <<"true">> when Lev < 50 andalso VipLev < 1 ->
	  Now = date:unixtime(),
	  case get(emulator_say_time) of
	    {Time, _} when Now - Time > 7200 ->
		put(emulator_say_time, {Now, 1}), ok;
	    {_Time, N} when N >= 2 -> {send_self, <<>>, Role};
	    {Time, N} -> put(emulator_say_time, {Time, N + 1}), ok;
	    _ -> put(emulator_say_time, {Now, 1}), ok
	  end;
      _ -> ok
    end;
do_check_speak(banned,
	       Role = #role{lev = Lev, banned_time = BannedTime},
	       _Data) ->
    Reason = util:if_true(Lev > 30, <<>>, <<>>),
    util:if_true(date:unixtime() >= BannedTime, ok,
		 {send_self, Reason, Role});
do_check_speak(msg_len, _Role, #{msg := SayMsg}) ->
    MsgLen = string_util:utf8_len(SayMsg),
    util:if_true(MsgLen =< 200 andalso MsgLen > 0, ok,
		 {false, lang:get(<<"消息过长"/utf8>>)});
do_check_speak(sys_ban, _Role, #{channel := Channel}) ->
    case sys_env:get(sys_ban_channel, []) of
      BanList = [_ | _] ->
	  util:if_true(lists:member(Channel, BanList),
		       {false, lang:get(<<"频道维护中，暂未开放"/utf8>>)}, ok);
      _ -> ok
    end;
do_check_speak(cd, _Role, #{channel := Channel}) ->
    Platform = sys_env:get(platform),
    TimeMs = case Channel of
	       _ when Platform == "release2" -> 0;
	       1024 -> say_data:const(cooldown_cross_service) * 1000;
	       1 -> say_data:const(cooldown_world) * 1000;
	       2 -> 9000;
	       4 -> say_data:const(cooldown_guild) * 1000;
	       8 -> 1000;
	       999999999 -> 1000;
	       2048 -> say_data:const(cooldown_same_province) * 1000;
	       _ -> 100
	     end,
    util:if_true(role_misc:check_cd({speak_cd, Channel},
				    TimeMs),
		 ok, {false, lang:get(<<"说话太快"/utf8>>)});
do_check_speak(ad,
	       Role = #role{id = RoleId, lev = Lev,
			    m_vip = #m_vip{lev = VipLev}},
	       #{msg := SayMsg}) ->
    case Lev >= 80 orelse VipLev >= 4 of
      true -> ok;
      _ ->
	  case keyword:is_ad(Lev, SayMsg) of
	    true -> ok;
	    {false, AdWord} ->
		case keyword:ad_type(AdWord) of
		  3 ->
		      log:save(report,
			       {Role,
				util:fbin("发放了广播信息 后台自动封号关键词:~ts => ~ts",
					  [AdWord, SayMsg])}),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidsay333, _, {__Levelsay333, __Tracessay333}}
			    when __Levelsay333 band 64 /= 0 orelse
				   __Tracessay333 /= [] ->
			    lager:do_log(info,
					 [{module, say},
					  {function, do_check_speak},
					  {line, 333},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~ts发放了广播信息 自动封号:~ts => ~ts  word=~w",
						       [Role#role.name, AdWord,
							SayMsg, AdWord]),
					 none, 4096, 64, __Levelsay333,
					 __Tracessay333, lager_event,
					 __Pidsay333);
			_ -> ok
		      end,
		      role:stop(async, self(), interdict,
				lang:get(<<"您的账号出现异常，请联系GM！"/utf8>>)),
		      {false, <<>>,
		       Role#role{interdict_time = date:unixtime() + 86400}};
		  2 ->
		      log:save(report,
			       {Role,
				util:fbin("发放了广播信息 后台自动禁言关键词:~ts => ~ts",
					  [AdWord, SayMsg])}),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidsay338, _, {__Levelsay338, __Tracessay338}}
			    when __Levelsay338 band 64 /= 0 orelse
				   __Tracessay338 /= [] ->
			    lager:do_log(info,
					 [{module, say},
					  {function, do_check_speak},
					  {line, 338},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~ts发放了广播信息 自动禁言:~ts => ~ts word=~w",
						       [Role#role.name, AdWord,
							SayMsg, AdWord]),
					 none, 4096, 64, __Levelsay338,
					 __Tracessay338, lager_event,
					 __Pidsay338);
			_ -> ok
		      end,
		      var:set_role_var(RoleId, other, 21,
				       {lang:get(<<"您因频繁发言而被禁言，%s后解禁"/utf8>>),
					date:unixtime() + 10800}),
		      {send_self, <<>>,
		       Role#role{banned_time = date:unixtime() + 10800}};
		  _ ->
		      N = util:get(say_keyword_ad, 0),
		      case N + 1 > 4 of
			false -> put(say_keyword_ad, N + 1), ok;
			_ ->
			    log:save(report,
				     {Role,
				      util:fbin("发放了广播信息 后台自动禁言关键词 模糊词:~ts => ~ts",
						[AdWord, SayMsg])}),
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
			      {__Pidsay349, _, {__Levelsay349, __Tracessay349}}
				  when __Levelsay349 band 64 /= 0 orelse
					 __Tracessay349 /= [] ->
				  lager:do_log(info,
					       [{module, say},
						{function, do_check_speak},
						{line, 349},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("~ts发放了广播信息 自动禁言:~ts => ~ts word=~w",
							     [Role#role.name,
							      AdWord, SayMsg,
							      AdWord]),
					       none, 4096, 64, __Levelsay349,
					       __Tracessay349, lager_event,
					       __Pidsay349);
			      _ -> ok
			    end,
			    var:set_role_var(RoleId, other, 21,
					     {lang:get(<<"您因频繁发言而被禁言，%s后解禁"/utf8>>),
					      date:unixtime() + 10800}),
			    {send_self, <<>>,
			     Role#role{banned_time = date:unixtime() + 10800}}
		      end
		end
	  end
    end;
do_check_speak(cross, _Role, _Data) -> ok;
do_check_speak(repeak,
	       Role = #role{id = RoleId, lev = Lev,
			    m_vip = #m_vip{lev = VipLev}},
	       #{msg := SayMsg}) ->
    case Lev >= 80 orelse VipLev >= 4 of
      true -> ok;
      _ ->
	  case is_cn(SayMsg) of
	    true when byte_size(SayMsg) > 10 ->
		Now = date:unixtime(),
		case get(say_last_key) of
		  {Time, _N, SayMsg} when Now - Time > 3600 ->
		      put(say_last_key, {Now, 1, SayMsg}), ok;
		  {_Time, N, SayMsg} when N >= 3 ->
		      erase(say_last_key),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidsay376, _, {__Levelsay376, __Tracessay376}}
			    when __Levelsay376 band 64 /= 0 orelse
				   __Tracessay376 /= [] ->
			    lager:do_log(info,
					 [{module, say},
					  {function, do_check_speak},
					  {line, 376},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~ts重复同一个信息多次 自动禁言30分:~ts",
						       [Role#role.name,
							SayMsg]),
					 none, 4096, 64, __Levelsay376,
					 __Tracessay376, lager_event,
					 __Pidsay376);
			_ -> ok
		      end,
		      log:save(report,
			       {Role,
				util:fbin("重复发送相似信息多次，自动禁言30分钟:~ts",
					  [SayMsg])}),
		      var:set_role_var(RoleId, other, 21,
				       {lang:get(<<"您因频繁发言而被禁言，%s后解禁"/utf8>>),
					Now + 60 * 30}),
		      {send_self, <<>>,
		       Role#role{banned_time = Now + 60 * 30}};
		  {Time, N, SayMsg} ->
		      put(say_last_key, {Time, N + 1, SayMsg}),
		      {send_self, <<>>, Role};
		  {_TIme, _, LastMsg} ->
		      put(say_last_key, {Now, 1, SayMsg}),
		      case check_similar(LastMsg, SayMsg) of
			true -> {send_self, <<>>, Role};
			false -> ok
		      end;
		  _ -> put(say_last_key, {Now, 1, SayMsg}), ok
		end;
	    _ -> ok
	  end
    end;
do_check_speak(repeak2,
	       Role = #role{id = RoleId, lev = Lev,
			    m_vip = #m_vip{lev = VipLev}},
	       Map = #{msg := SayMsg1}) ->
    SayMsg2 = maps:get(msg3, Map, undefined),
    SayMsg = util:if_true(SayMsg2 == undefined, SayMsg1,
			  SayMsg2),
    case Lev >= say_data:const(say_repeak_lev) orelse
	   VipLev >= say_data:const(say_repeak_vip)
	of
      true -> ok;
      _ ->
	  SizeLimit = say_data:const(say_string_length),
	  SizeLength = string_util:utf8_len(SayMsg) * 3,
	  Now = date:unixtime(),
	  case get(say_last_msg) of
	    {Time, SayMsgL} ->
		case Now - Time > 60 * say_data:const(say_repeak_span)
		    of
		  true -> put(say_last_msg, {Now, [SayMsg]}), ok;
		  _ ->
		      case lists:member(SayMsg, SayMsgL) of
			true -> {send_self, <<>>, Role};
			_ ->
			    case SizeLength > SizeLimit andalso
				   check_similar_lists(SayMsgL, SayMsg)
				of
			      true ->
				  erase(say_last_msg),
				  log:save(report,
					   {Role,
					    util:fbin("重复发送相似信息多次，自动禁言~w小时:~ts",
						      [say_data:const(say_repeak_time),
						       SayMsg])}),
				  case {whereis(lager_event),
					whereis(lager_event),
					lager_config:get({lager_event,
							  loglevel},
							 {0, []})}
				      of
				    {undefined, undefined, _} ->
					fun () -> {error, lager_not_running}
					end();
				    {undefined, _, _} ->
					fun () ->
						{error,
						 {sink_not_configured,
						  lager_event}}
					end();
				    {__Pidsay421, _,
				     {__Levelsay421, __Tracessay421}}
					when __Levelsay421 band 64 /= 0 orelse
					       __Tracessay421 /= [] ->
					lager:do_log(info,
						     [{module, say},
						      {function,
						       do_check_speak},
						      {line, 421},
						      {pid,
						       pid_to_list(self())},
						      {node, node()}
						      | lager:md()],
						     io_lib:format("~ts重复发送相似信息多次，自动禁言~w小时:~ts",
								   [Role#role.name,
								    say_data:const(say_repeak_time),
								    SayMsg]),
						     none, 4096, 64,
						     __Levelsay421,
						     __Tracessay421,
						     lager_event, __Pidsay421);
				    _ -> ok
				  end,
				  var:set_role_var(RoleId, other, 21,
						   {lang:get(<<"您因频繁发言而被禁言，%s后解禁"/utf8>>),
						    Now +
						      3600 *
							say_data:const(say_repeak_time)}),
				  {send_self, <<>>,
				   Role#role{banned_time =
						 Now +
						   3600 *
						     say_data:const(say_repeak_time)}};
			      false ->
				  put(say_last_msg, {Now, [SayMsg | SayMsgL]}),
				  ok
			    end
		      end
		end;
	    _ -> put(say_last_msg, {Now, [SayMsg]}), ok
	  end
    end;
do_check_speak(freqcy,
	       Role = #role{id = RoleId, m_vip = #m_vip{lev = VipLev}},
	       Data) ->
    case VipLev >= 2 of
      true -> ok;
      false ->
	  case maps:get(to_rid, Data, undefined) of
	    ToRid when is_tuple(ToRid) ->
		Num = case VipLev > 0 of
			true -> 8;
			_ -> 5
		      end,
		Now = date:unixtime(),
		{Time, Ids} = case get(say_freqcy) of
				{TmpTime, TmpIds} -> {TmpTime, TmpIds};
				_ -> {Now, []}
			      end,
		case Now - Time < 3600 of
		  true ->
		      NewIds = [ToRid | lists:delete(ToRid, Ids)],
		      case length(NewIds) > Num of
			false -> put(say_freqcy, {Time, NewIds}), ok;
			true ->
			    erase(say_freqcy),
			    Hour = 48,
			    log:save(report,
				     {Role,
				      util:fbin("在1小时内私聊人数超过:~w人, 自动禁言~w小时Ids:~w",
						[Num, Hour, NewIds])}),
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
			      {__Pidsay461, _, {__Levelsay461, __Tracessay461}}
				  when __Levelsay461 band 64 /= 0 orelse
					 __Tracessay461 /= [] ->
				  lager:do_log(info,
					       [{module, say},
						{function, do_check_speak},
						{line, 461},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("~ts在1小时内私聊人数超过:~w人, 自动禁言~w小时Ids:~w",
							     [Role#role.name,
							      Num, Hour,
							      NewIds]),
					       none, 4096, 64, __Levelsay461,
					       __Tracessay461, lager_event,
					       __Pidsay461);
			      _ -> ok
			    end,
			    var:set_role_var(RoleId, other, 21,
					     {lang:get(<<"您因频繁发言而被禁言，%s后解禁"/utf8>>),
					      Now + 60 * Hour}),
			    {send_self, <<>>,
			     Role#role{banned_time = Now + 60 * Hour}}
		      end;
		  false -> put(say_freqcy, {Now, [ToRid]}), ok
		end;
	    _ -> ok
	  end
    end;
do_check_speak(ad2,
	       Role = #role{id = RoleId, platform = PlatForm,
			    lev = Lev, m_vip = #m_vip{lev = VipLev}},
	       #{msg := SayMsg}) ->
    case (Lev >= 80 orelse VipLev >= 4) andalso
	   (PlatForm == <<"9377">> orelse
	      PlatForm == <<"9377ios">>)
	of
      true -> ok;
      _ ->
	  case unicode:characters_to_list(SayMsg) of
	    Msg when is_list(Msg) ->
		{Flag, BanWord1, BanWord2} = case get(chat_compile) of
					       {4, Compile1, Compile2}
						   when is_list(Compile1)
							  andalso
							  is_list(Compile2) ->
						   {Flag1, MatchWord1} =
						       banned_check_by_type(Compile2,
									    Msg,
									    match_any),
						   {Flag2, MatchWord2} =
						       banned_check_by_type(Compile1,
									    Msg,
									    match_three),
						   {Flag1 orelse Flag2,
						    MatchWord1, MatchWord2};
					       _ ->
						   {Ver, Compile1, Compile2} =
						       make_compile(),
						   put(chat_compile,
						       {Ver, Compile1,
							Compile2}),
						   {Flag1, MatchWord1} =
						       banned_check_by_type(Compile2,
									    Msg,
									    match_any),
						   {Flag2, MatchWord2} =
						       banned_check_by_type(Compile1,
									    Msg,
									    match_three),
						   {Flag1 orelse Flag2,
						    MatchWord1, MatchWord2}
					     end,
		case Flag of
		  false -> ok;
		  _ ->
		      log:save(report,
			       {Role,
				util:fbin("发放了敏感词信息 自动禁言: ~ts 一次关键词: ~ts  三次关键词: "
					  "~ts",
					  [SayMsg, BanWord1, BanWord2])}),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidsay499, _, {__Levelsay499, __Tracessay499}}
			    when __Levelsay499 band 64 /= 0 orelse
				   __Tracessay499 /= [] ->
			    lager:do_log(info,
					 [{module, say},
					  {function, do_check_speak},
					  {line, 499},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~ts发放了敏感词信息 自动禁言: ~ts 一次关键词: ~ts  三次关键词: "
						       "~ts",
						       [Role#role.name, SayMsg,
							BanWord1, BanWord2]),
					 none, 4096, 64, __Levelsay499,
					 __Tracessay499, lager_event,
					 __Pidsay499);
			_ -> ok
		      end,
		      var:set_role_var(RoleId, other, 21,
				       {lang:get(<<"您因发言涉及敏感词汇而被禁言，%s后解禁"/utf8>>),
					date:unixtime() + 60 * 30}),
		      {false, lang:get(<<"消息含有敏感字词"/utf8>>),
		       Role#role{banned_time = date:unixtime() + 60 * 30}}
		end;
	    _ -> {false, lang:get(<<"消息含有敏感字词"/utf8>>)}
	  end
    end;
do_check_speak(space,
	       Role = #role{lev = Lev, m_vip = #m_vip{lev = VipLev}},
	       #{msg2 := SayMsg}) ->
    case Lev >= 80 orelse VipLev >= 4 of
      _ ->
	  Space = [],
	  Compile = [re:compile(H, [unicode, ungreedy])
		     || H <- Space],
	  case unicode:characters_to_list(SayMsg) of
	    Msg when is_list(Msg) ->
		{Flag, _} = banned_check_any(Compile, Msg),
		case Flag of
		  false -> ok;
		  _ -> {send_self, <<>>, Role}
		end;
	    _ -> {false, lang:get(<<"消息含有敏感字词"/utf8>>)}
	  end
    end;
do_check_speak(ban_word,
	       #role{lev = Lev, m_vip = #m_vip{lev = VipLev}},
	       #{from := sys, msg2 := SayMsg}) ->
    case Lev >= 80 orelse VipLev >= 4 of
      true -> ok;
      _ ->
	  Space = [],
	  Compile = [re:compile(H, [unicode, ungreedy])
		     || H <- Space],
	  case unicode:characters_to_list(SayMsg) of
	    Msg when is_list(Msg) ->
		{Flag, _} = banned_check_any(Compile, Msg),
		case Flag of
		  false -> ok;
		  _ -> {false, <<>>}
		end;
	    _ -> {false, lang:get(<<"消息含有敏感字词"/utf8>>)}
	  end
    end;
do_check_speak(ban_word, _Role, #{msg2 := SayMsg}) ->
    Space = [],
    Compile = [re:compile(H, [unicode, ungreedy])
	       || H <- Space],
    case unicode:characters_to_list(SayMsg) of
      Msg when is_list(Msg) ->
	  {Flag, _} = banned_check_any(Compile, Msg),
	  case Flag of
	    false -> ok;
	    _ -> {false, <<>>}
	  end;
      _ -> {false, lang:get(<<"消息含有敏感字词"/utf8>>)}
    end;
do_check_speak(voice,
	       Role = #role{id = RoleId, lev = Lev,
			    m_vip = #m_vip{lev = VipLev}},
	       Args = #{channel := Channel}) ->
    Len = maps:get(len, Args, 0),
    Key = {say_cont_acc_channel, Channel},
    sys_env:set(Key, RoleId),
    case Lev >= 80 orelse
	   VipLev >= 4 orelse
	     Len =:= 0 orelse
	       lists:member(Channel, [4, 999999999, 8])
	of
      true -> ok;
      _ ->
	  case sys_env:get(Key) of
	    RoleId ->
		put(Key, util:get(Key, 0) + 1),
		case get(Key) > 8 of
		  true ->
		      log:save(report,
			       {Role, util:fbin("同一频道内连续个人语音~w次", [get(Key)])}),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidsay573, _, {__Levelsay573, __Tracessay573}}
			    when __Levelsay573 band 64 /= 0 orelse
				   __Tracessay573 /= [] ->
			    lager:do_log(info,
					 [{module, say},
					  {function, do_check_speak},
					  {line, 573},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~ts同一频道内连续个人语音~w次:~w",
						       [Role#role.name,
							get(Key), Channel]),
					 none, 4096, 64, __Levelsay573,
					 __Tracessay573, lager_event,
					 __Pidsay573);
			_ -> ok
		      end,
		      var:set_role_var(RoleId, other, 21,
				       {lang:get(<<"您因频繁发言而被禁言，%s后解禁"/utf8>>),
					date:unixtime() + 60 * 60}),
		      {send_self, <<>>,
		       Role#role{banned_time = date:unixtime() + 60 * 60}};
		  _ -> ok
		end;
	    _ -> put(Key, 1), ok
	  end
    end;
do_check_speak(sign,
	       Role = #role{id = {Rid, SrvId}, lev = Lev,
			    m_vip = #m_vip{lev = 0}},
	       #{sign := Sign, channel := Channel, len := Len,
		 origin_msg := Msg})
    when Lev < 80 ->
    case util:md5(lists:concat([Rid, binary_to_list(SrvId),
				Channel, Len, binary_to_list(Msg), "____"]))
	of
      Sign -> ok;
      _Tick ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsay588, _, {__Levelsay588, __Tracessay588}}
		when __Levelsay588 band 8 /= 0 orelse
		       __Tracessay588 /= [] ->
		lager:do_log(error,
			     [{module, say}, {function, do_check_speak},
			      {line, 588}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]发送信息失败,sign_error:~ts",
					   [Role#role.name, Msg]),
			     none, 4096, 8, __Levelsay588, __Tracessay588,
			     lager_event, __Pidsay588);
	    _ -> ok
	  end,
	  {send_self, <<>>, Role}
    end;
do_check_speak(sign, _Role, _Data) -> ok;
do_check_speak(_Label, _Role, _Data) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsay595, _, {__Levelsay595, __Tracessay595}}
	  when __Levelsay595 band 8 /= 0 orelse
		 __Tracessay595 /= [] ->
	  lager:do_log(error,
		       [{module, say}, {function, do_check_speak}, {line, 595},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未处理聊天判断类型：~w", [_Label]), none, 4096, 8,
		       __Levelsay595, __Tracessay595, lager_event,
		       __Pidsay595);
      _ -> ok
    end,
    {false, lang:get(<<"信息发送失败"/utf8>>)}.

is_cn(<<H:8, _Rest/binary>>) when H > 127 -> true;
is_cn(<<_H:8, Rest/binary>>) -> is_cn(Rest);
is_cn(_) -> false.

check_similar_lists(LastMsgL, SayMsg) ->
    Len = length([1
		  || LastMsg <- LastMsgL,
		     check_similar(LastMsg, SayMsg)]),
    Len >= say_data:const(say_repeak_num) - 1.

check_similar(Msg1, Msg2)
    when byte_size(Msg2) >= 10 andalso
	   abs(byte_size(Msg1) - byte_size(Msg2)) < 20 ->
    S1 = unicode:characters_to_list(Msg1),
    S2 = unicode:characters_to_list(Msg2),
    case is_list(S1) andalso is_list(S2) of
      true ->
	  S = S2 -- S1,
	  N2 = length(S2),
	  N = length(S),
	  Degree = util:round((N2 - N) / N2 * 100),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsay619, _, {__Levelsay619, __Tracessay619}}
		when __Levelsay619 band 128 /= 0 orelse
		       __Tracessay619 /= [] ->
		lager:do_log(debug,
			     [{module, say}, {function, check_similar},
			      {line, 619}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("msg1=~w msg2=~w diff=~w =~w",
					   [S1, S2, S, (N2 - N) / N2]),
			     none, 4096, 128, __Levelsay619, __Tracessay619,
			     lager_event, __Pidsay619);
	    _ -> ok
	  end,
	  Degree >= say_data:const(say_repeak_similar);
      _ -> false
    end;
check_similar(_Msg1, _Msg2) -> false.

mention(<<"<div href=atpeople srvid="/utf8,
	  Bin/binary>>,
	Channel, SenderInfo)
    when Channel =:= 1 orelse
	   Channel =:= 4 orelse
	     Channel =:= 1024 orelse Channel =:= 8 ->
    case do_mention_srv(Bin, <<>>) of
      {SrvId, Rest} ->
	  mention(Rest, Channel, SenderInfo, SrvId);
      _ -> ok
    end;
mention(_, _, _) -> ok.

mention(<<"@"/utf8, Bin/binary>>, Channel, SenderInfo,
	SrvId) ->
    N = case ets:lookup(say_mention, Channel) of
	  [{_, N1}] when is_integer(N1) -> N1;
	  _ -> 0
	end,
    case do_mention(Bin, <<>>, 12) of
      Name when is_bitstring(Name) ->
	  Now = date:unixtime(),
	  ets:insert(say_mention, {Channel, N + 1}),
	  ets:insert(say_mention,
		     {{Channel, Name}, N, Now, SenderInfo}),
	  ets:match_delete(say_mention,
			   [{{'_', '$1', '_', '_'}, [{'<', '$1', N - 10}],
			     [true]}]),
	  case role_query:conn_pid(by_name, Name, SrvId) of
	    {ok, Pid} ->
		role:pack_send(Pid, 12767, SenderInfo),
		notice_below:send_mention(Pid, SenderInfo);
	    _ -> ok
	  end;
      _ -> ok
    end;
mention(_, _, _, _) -> ok.

do_mention(_Bin, Body, Num) when Num < 0 -> Body;
do_mention(<<>>, _Body, _Num) -> false;
do_mention(Bin, Body, 0) ->
    {Word, _Rest} = string_util:get_word(Bin),
    case Word of
      <<",">> -> Body;
      _ -> false
    end;
do_mention(Bin, Body, Num) ->
    {Word, Rest} = string_util:get_word(Bin),
    NLen = string_util:string_width(Word),
    case Word of
      <<",">> -> do_mention(Rest, Body, -1);
      _ ->
	  do_mention(Rest, <<Body/binary, Word/binary>>,
		     Num - NLen)
    end.

do_mention_srv(<<>>, _) -> false;
do_mention_srv(Bin, Body) ->
    {Word, Rest} = string_util:get_word(Bin),
    case Word of
      <<">">> -> {Body, Rest};
      _ -> do_mention_srv(Rest, <<Body/binary, Word/binary>>)
    end.

-spec re_mention(#role{}) -> ok.

re_mention(Role) ->
    Now = date:unixtime(), re_mention([1, 4, 8], Now, Role).

re_mention([], _Now, _Role) -> ok;
re_mention([Channel | Rest], Now, Role) ->
    do_re_mention(Channel, Now, Role),
    re_mention(Rest, Now, Role).

do_re_mention(Channel, Now,
	      Role = #role{name = Name}) ->
    AllN = case ets:lookup(say_mention, Channel) of
	     [{_, N1}] when is_integer(N1) -> N1;
	     _ -> 0
	   end,
    case ets:lookup(say_mention, {Channel, Name}) of
      [{_, N, OldTime, SenderInfo}]
	  when AllN - N =< 20 andalso Now - OldTime =< 60 * 60 ->
	  role:pack_send(Role, 12767, SenderInfo);
      _ -> ok
    end;
do_re_mention(_, _, _) -> ok.

-spec read_mention(#role{}, pos_integer()) -> true.

read_mention(#role{name = Name}, Channel) ->
    ets:delete(say_mention, {Channel, Name}).

replace_mention(Msg =
		    <<"<div href=atpeople srvid="/utf8, Bin/binary>>) ->
    case do_mention_srv(Bin, <<>>) of
      {_, <<"@"/utf8, NBin/binary>>} ->
	  case do_mention(NBin, <<>>, 12) of
	    Name when is_bitstring(Name) ->
		Size = byte_size(Name),
		case NBin of
		  <<_T:Size/binary, " "/utf8, "</div>"/utf8,
		    Rest/binary>> ->
		      {<<"@"/utf8, Name/binary, Rest/binary>>,
		       <<Rest/binary>>, true};
		  _ -> {Msg, Msg, false}
		end;
	    _ -> {Msg, Msg, false}
	  end;
      _ -> {Msg, Msg, false}
    end;
replace_mention(Msg = <<"<div fontcolor="/utf8,
			_C:7/binary, " href="/utf8, Bin/binary>>) ->
    case do_mention_srv(Bin, <<>>) of
      {_, NBin} -> {NBin, NBin, false};
      _ -> {Msg, Msg, false}
    end;
replace_mention(Bin) -> {Bin, Bin, false}.

replace_emoji(<<>>, NewMsg) -> NewMsg;
replace_emoji(<<"#"/utf8, H1:8, H2:8, H3:8,
		Rest/binary>>,
	      NewMsg)
    when (H1 >= $0 andalso H1 =< $9) andalso
	   (H2 >= $0 andalso H2 =< $9) andalso
	     H3 >= $0 andalso H3 =< $9 ->
    replace_emoji(Rest,
		  <<NewMsg/binary, "#"/utf8, H1, H2, H3>>);
replace_emoji(<<"#"/utf8, H1:8, H2:8, Rest/binary>>,
	      NewMsg)
    when (H1 >= $0 andalso H1 =< $9) andalso
	   H2 >= $0 andalso H2 =< $9 ->
    H = binary_to_integer(<<H1, H2>>),
    case H >= 1 andalso H =< 57 of
      true -> replace_emoji(Rest, NewMsg);
      _ ->
	  replace_emoji(Rest, <<NewMsg/binary, "#"/utf8, H1, H2>>)
    end;
replace_emoji(<<"#"/utf8, H1:8, Rest/binary>>, NewMsg)
    when H1 >= $0 andalso H1 =< $9 ->
    H = binary_to_integer(<<H1>>),
    case H >= 1 andalso H =< 57 of
      true -> replace_emoji(Rest, NewMsg);
      _ ->
	  replace_emoji(Rest, <<NewMsg/binary, "#"/utf8, H1>>)
    end;
replace_emoji(<<H:8, Rest/binary>>, NewMsg)
    when H =< 127 ->
    replace_emoji(Rest, <<NewMsg/binary, H>>);
replace_emoji(<<H:8, B:1, Rest/binary>>, NewMsg)
    when H >= 192, H =< 223 ->
    replace_emoji(Rest, <<NewMsg/binary, H, B>>);
replace_emoji(<<H:8, B:2, Rest/binary>>, NewMsg)
    when H >= 224, H =< 239 ->
    replace_emoji(Rest, <<NewMsg/binary, H, B>>);
replace_emoji(<<H:8, B:3, Rest/binary>>, NewMsg)
    when H >= 240, H =< 247 ->
    replace_emoji(Rest, <<NewMsg/binary, H, B>>);
replace_emoji(<<H:8, B:4, Rest/binary>>, NewMsg)
    when H >= 248, H =< 251 ->
    replace_emoji(Rest, <<NewMsg/binary, H, B>>);
replace_emoji(<<H:8, B:5, Rest/binary>>, NewMsg)
    when H >= 252, H =< 253 ->
    replace_emoji(Rest, <<NewMsg/binary, H, B>>);
replace_emoji(<<H:8, Rest/binary>>, NewMsg) ->
    replace_emoji(Rest, <<NewMsg/binary, H>>).

-spec say_history(role_id()) -> #say_history{}.

say_history(RoleId) ->
    cluster_lib:call(element(2, RoleId), say,
		     lookup_say_history, [RoleId]).

-spec lookup_say_history(role_id()) -> #say_history{}.

lookup_say_history(RoleId) ->
    case ets:lookup(say_history, RoleId) of
      [SH = #say_history{}] -> SH;
      _ -> #say_history{id = RoleId}
    end.

insert_say_history(RoleId, {Channel, SayMsg})
    when Channel =:= 1024 orelse
	   Channel =:= 1 orelse Channel == 2048 ->
    Now = date:unixtime(),
    NewSayHistory = case ets:lookup(say_history, RoleId) of
		      [SH = #say_history{lists = L}] ->
			  L1 = L ++ [{Channel, SayMsg}],
			  NewL = case length(L1) > 5 of
				   true -> [_ | L2] = L1, L2;
				   _ -> L1
				 end,
			  SH#say_history{clear_time = Now + 86400 * 1,
					 lists = NewL};
		      _ ->
			  #say_history{id = RoleId,
				       clear_time = Now + 86400 * 1,
				       lists = [{Channel, SayMsg}]}
		    end,
    ets:insert(say_history, NewSayHistory),
    ok;
insert_say_history(_, _) -> skip.

-spec silent(role_id(), bitstring(), pos_integer(),
	     role_id()) -> ok.

silent(TargetId = {TarRid, TarSrvId}, TargetName,
       TargetVipLev, RoleId) ->
    NewRec = #violators_record{lists = NewL} = case
						 ets:lookup(violators_record,
							    TargetId)
						   of
						 [RecT = #violators_record{lists
									       =
									       L}] ->
						     RecT#violators_record{name
									       =
									       TargetName,
									   lists
									       =
									       [RoleId
										| L]};
						 _ ->
						     #violators_record{id =
									   TargetId,
								       name =
									   TargetName,
								       lists =
									   [RoleId]}
					       end,
    BanCount = case [Count
		     || {NeedVip, Count}
			    <- role_career_data:get_const(role_reported_vip_limit),
			TargetVipLev =< NeedVip]
		   of
		 BanCountL = [_ | _] -> lists:min(BanCountL);
		 _ -> 999
	       end,
    case length(NewL) >= BanCount of
      true ->
	  TimeOut = date:unixtime() + 3600 * 2,
	  case role_query:pid(by_id, {TarRid, TarSrvId}) of
	    {ok, RPid} ->
		role:apply(async, RPid,
			   {fun (R) ->
				    var:set_role_var(TargetId, other, 21,
						     {lang:get(<<"您因触犯禁言规则而被禁言，%s后解禁"/utf8>>),
						      TimeOut}),
				    {sync, R#role{banned_time = TimeOut}}
			    end,
			    []});
	    _ ->
		Sql = "update role set banned_time = ? where "
		      "rid=? and srv_id=?",
		var:set_role_var(TargetId, other, 21,
				 {lang:get(<<"您因触犯禁言规则而被禁言，%s后解禁"/utf8>>),
				  TimeOut}),
		db:execute(Sql, [TimeOut, TarRid, TarSrvId])
	  end,
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsay848, _, {__Levelsay848, __Tracessay848}}
		when __Levelsay848 band 64 /= 0 orelse
		       __Tracessay848 /= [] ->
		lager:do_log(info,
			     [{module, say}, {function, silent}, {line, 848},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~ts被多人举报禁言2小时", [TargetName]), none,
			     4096, 64, __Levelsay848, __Tracessay848,
			     lager_event, __Pidsay848);
	    _ -> ok
	  end,
	  log:save(report,
		   {#{id => TarRid, srv_id => TarSrvId,
		      name => TargetName},
		    util:fbin("VIP~w被多人举报封禁2小时", [TargetVipLev])}),
	  cluster_lib:cast(all, say_mgr, info,
			   [{del_say, {TarRid, TarSrvId}}]),
	  ets:insert(violators_record,
		     #violators_record{id = TargetId, name = TargetName});
      _ -> ets:insert(violators_record, NewRec)
    end,
    ok;
silent(_, _, _, _) -> ok.

banned_check_by_type(Compile, Msg, match_three) ->
    banned_check(Compile, Msg);
banned_check_by_type(Compile, Msg, match_any) ->
    banned_check_any(Compile, Msg).

banned_check(Compile, Msg) ->
    List = case get(three_banned) of
	     ListT when is_list(ListT) -> ListT;
	     _ -> []
	   end,
    Num = length([1 || 1 <- List]),
    banned_check(Compile, Msg, List, Num, <<>>).

banned_check([_ | _T], _Msg, _List, Num, BanWord)
    when Num >= 3 ->
    erase(three_banned), {true, BanWord};
banned_check([], _Msg, List, Num, BanWord) ->
    case Num >= 3 of
      true -> erase(three_banned), {true, BanWord};
      false ->
	  L = [0 | List],
	  NewL = case length(L) > 7 of
		   true -> [_ | L2] = L, L2;
		   _ -> L
		 end,
	  put(three_banned, NewL),
	  {false, BanWord}
    end;
banned_check([{ok, Re} | T], Msg, List, Num, BanWord) ->
    case re:run(Msg, Re, [{capture, first, list}]) of
      {match, Word} ->
	  L = [1 | List],
	  NewL = case length(L) > 7 of
		   true -> [_ | L2] = L, L2;
		   _ -> L
		 end,
	  put(three_banned, NewL),
	  NewMsg = util:fbin(lang:get(<<"~ts"/utf8>>), Word),
	  NewBanWord = <<BanWord/binary, "|"/utf8,
			 NewMsg/binary>>,
	  banned_check(T, Msg, NewL, Num + 1, NewBanWord);
      _ -> banned_check(T, Msg, List, Num, BanWord)
    end;
banned_check([_ | T], Msg, List, Num, BanWord) ->
    banned_check(T, Msg, List, Num, BanWord).

banned_check_any([], _Msg) -> {false, <<>>};
banned_check_any([{ok, Re} | T], Msg) ->
    case re:run(Msg, Re, [{capture, first, list}]) of
      {match, Word} ->
	  {true, util:fbin(lang:get(<<"~ts"/utf8>>), Word)};
      _ -> banned_check_any(T, Msg)
    end;
banned_check_any([_Bad | T], Msg) ->
    banned_check_any(T, Msg).

make_compile() ->
    {4,
     [re:compile(H, [unicode, ungreedy])
      || H <- keyword_list_threed()],
     [re:compile(Word, [unicode, ungreedy])
      || Word <- keyword_list_any()]}.

keyword_list_threed() -> [].

keyword_list_any() -> [].

check_ban(_Role = #role{id = RoleId,
			banned_time = BannedTime}) ->
    Now = date:unixtime(),
    case var:get_role_var(RoleId, other, 21, {<<>>, 0}) of
      {Msg, BannedTime} when BannedTime > Now ->
	  {Msg, BannedTime};
      _ -> ok
    end.


