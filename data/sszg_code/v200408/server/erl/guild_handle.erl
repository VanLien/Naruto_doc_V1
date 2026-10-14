-file("data/guild_handle.erl", 1).

-file("src/mod/guild/guild_handle.erl", 1).

-module(guild_handle).

-lager_records([{violators_record, [id, name, lists]},
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

-export([push_base/1, get_guild_log/1, add_guild_log/5,
	 apply_add_guild_log/5, del_guild_log/3,
	 apply_del_guild_log/3, one_notice/3, notice_offline/1,
	 send_mail/2, create/2, kick/2, apply_kick/2, quit/1,
	 apply_quit/2, set_post/3, apply_set_post/2,
	 apply_gm_set_post/2, disband/1, apply_disband/2,
	 set_sign/2, apply_set_sign/2, set_apply/4,
	 apply_set_apply/2, recruit/1, apply_recruit/2,
	 impeach/1, apply_impeach/2, apply_impeach_fail/1,
	 do_disband/2, apply_rename/2, rename/2, donate/2,
	 apply_donate/2, maintain/1, reload_data/1,
	 zero_update/2, five_update/1, donate_box/2,
	 gm_set_leader_time/1, ref_data/0, ref_data/1,
	 apply_update_day_dun_time/2,
	 apply_update_day_war_time/1, gm_apply_set_offtime/2]).

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

-file("src/mod/guild/guild_handle.erl", 53).

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

-file("src/mod/guild/guild_handle.erl", 54).

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

-file("src/mod/guild/guild_handle.erl", 55).

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

-file("src/mod/guild/guild_handle.erl", 56).

-file("inc/log.hrl", 1).

-file("src/mod/guild/guild_handle.erl", 57).

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

-file("src/mod/guild/guild_handle.erl", 58).

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

-file("src/mod/guild/guild_handle.erl", 59).

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

-file("src/mod/guild/guild_handle.erl", 60).

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

-file("src/mod/guild/guild_handle.erl", 61).

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

-file("src/mod/guild/guild_handle.erl", 62).

-spec ref_data(#role{}) -> {ok, #role{}}.

ref_data() ->
    role_group:apply(world, {guild_handle, ref_data, []}).

ref_data(RoleT = #role{guild_bag =
			   #guild_bag{id = GuildId}}) ->
    Role = case var:get_var(RoleT, five, 547, []) of
	     Temp = [_ | _] ->
		 Role1 = var:set_var(RoleT, five, 547, []),
		 var:set_var(Role1, day, 47, Temp);
	     _ -> RoleT
	   end,
    Role2 = case var:get_var(Role, five, 575, {GuildId, []})
		of
	      {_, []} -> Role;
	      {T1, T2} ->
		  RoleT1 = var:set_var(Role, five, 575, {T1, []}),
		  var:set_var(RoleT1, day, 48, {T1, T2})
	    end,
    {ok, Role2}.

-spec push_base(#role{}) -> ok.

push_base(RoleT = #role{guild_bag =
			    #guild_bag{id = GuildId}}) ->
    {DonateDayList, RoleT2} = case var:get_var(RoleT, five,
					       547, [])
				  of
				Temp = [_ | _] ->
				    Role1 = var:set_var(RoleT, five, 547, []),
				    Role2 = var:set_var(Role1, day, 47, Temp),
				    {Temp, Role2};
				_ -> {var:get_var(RoleT, day, 47, []), RoleT}
			      end,
    {{_, Boxes}, Role} = case var:get_var(RoleT2, five, 575,
					  {GuildId, []})
			     of
			   {_, []} ->
			       {var:get_var(RoleT2, day, 48, {GuildId, []}),
				RoleT2};
			   {T1, T2} ->
			       RoleTT1 = var:set_var(RoleT2, five, 575,
						     {T1, []}),
			       RoleTT2 = var:set_var(RoleTT1, day, 48,
						     {T1, T2}),
			       {{T1, T2}, RoleTT2}
			 end,
    DonateExp = get_donate_exp(GuildId),
    DaySendNum = var:get_var(Role, day, 20, 0),
    DayRecvNum = guild_mem_red_packet:day_recv_num(Role),
    sys_conn:pack_send(13523,
		       {DonateDayList, Boxes, DonateExp, DaySendNum,
			DayRecvNum}),
    ok.

-spec get_guild_log(tuple()) -> {ok}.

get_guild_log(GuildId) ->
    #guild_log{list = LogList} =
	guild_lib:get_guild_log(GuildId),
    sys_conn:pack_send(13577, {LogList}),
    ok.

del_guild_log(Role = #role{guild_bag =
			       #guild_bag{pid = GPid}},
	      StartNum, Num)
    when is_pid(GPid), is_integer(StartNum),
	 is_integer(Num), StartNum > 0, Num >= 0 ->
    guild:apply(async, GPid,
		{guild_handle, apply_del_guild_log, [StartNum, Num]}),
    {ok, Role};
del_guild_log(Role, _StartNum, _Num) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_handle126, _,
       {__Levelguild_handle126, __Tracesguild_handle126}}
	  when __Levelguild_handle126 band 8 /= 0 orelse
		 __Tracesguild_handle126 /= [] ->
	  lager:do_log(error,
		       [{module, guild_handle}, {function, del_guild_log},
			{line, 126}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "参数错误！", none, 4096, 8, __Levelguild_handle126,
		       __Tracesguild_handle126, lager_event,
		       __Pidguild_handle126);
      _ -> ok
    end,
    {ok, Role}.

apply_del_guild_log(#guild{id = GuildId}, StartNum,
		    Num) ->
    GuildLog = #guild_log{list = Log} =
		   guild_lib:get_guild_log(GuildId),
    {List, List1} = list_util:split(StartNum + Num - 1,
				    Log),
    {List2, _} = list_util:split(StartNum - 1, List),
    NewList = List1 ++ List2,
    NewGuildLog = GuildLog#guild_log{list = NewList},
    d_ets_lib:save_ets(guild_log, NewGuildLog),
    ok.

add_guild_log(RoleId, RoleName, GPid, Msg, Type)
    when is_pid(GPid) ->
    guild:apply(async, GPid,
		{guild_handle, apply_add_guild_log,
		 [RoleId, RoleName, Msg, Type]}),
    ok;
add_guild_log(_RoleId, _RoleName, _GPid, _Msg, _Type) ->
    ok.

apply_add_guild_log(G = #guild{id = GuildId}, RoleId,
		    RoleName, Msg, 3) ->
    GuildLog = #guild_log{list = Log} =
		   guild_lib:get_guild_log(GuildId),
    Now = date:unixtime(),
    case lists:filter(fun (#guild_log_info{role_id = Id,
					   type = Type}) ->
			      RoleId =:= Id andalso Type =:= 3
		      end,
		      Log)
	of
      [#guild_log_info{time = Time} | _]
	  when Now - Time < 600 ->
	  ok;
      _ ->
	  LogId = case Log of
		    [#guild_log_info{id = LogId1} | _] -> LogId1 + 1;
		    _ -> 1
		  end,
	  NewLog = #guild_log_info{id = LogId, guild_id = GuildId,
				   type = 3, time = Now, role_id = RoleId,
				   role_name = RoleName, msg = Msg},
	  {NewList, _DelList} = list_util:split(30,
						[NewLog | Log]),
	  NewGuildLog = GuildLog#guild_log{list = NewList},
	  d_ets_lib:save_ets(guild_log, NewGuildLog),
	  guild_member:pack_send(G, all, 13578, {[NewLog]}),
	  ok
    end;
apply_add_guild_log(G = #guild{id = GuildId}, RoleId,
		    RoleName, Msg, Type) ->
    GuildLog = #guild_log{list = Log} =
		   guild_lib:get_guild_log(GuildId),
    Now = date:unixtime(),
    LogId = case Log of
	      [#guild_log_info{id = LogId1} | _] -> LogId1 + 1;
	      _ -> 1
	    end,
    NewLog = #guild_log_info{id = LogId, guild_id = GuildId,
			     type = Type, time = Now, role_id = RoleId,
			     role_name = RoleName, msg = Msg},
    {NewList, _DelList} = list_util:split(30,
					  [NewLog | Log]),
    NewGuildLog = GuildLog#guild_log{list = NewList},
    d_ets_lib:save_ets(guild_log, NewGuildLog),
    guild_member:pack_send(G, all, 13578, {[NewLog]}),
    ok.

-spec one_notice(string(), integer(), list()) -> {true,
						  string()} |
						 {false, string()}.

one_notice(GuildId, Type, List) ->
    case guild_lib:info(by_id, GuildId) of
      {ok, #guild{members = Members}} ->
	  case do_one_notice(Type, List, Members) of
	    true ->
		{true, lang:get(<<"Nhắc nhở thành công"/utf8>>)};
	    false ->
		{false,
		 lang:get(<<"Có thành viên không thuộc gia tộc"/utf8>>)}
	  end;
      _ ->
	  {false, lang:get(<<"Không tìm thấy gia tộc này"/utf8>>)}
    end.

do_one_notice(_Type, [], _Members) -> true;
do_one_notice(Type, [RoleId | T], Members) ->
    case lists:keyfind(RoleId, #guild_member.id, Members) of
      #guild_member{online = 1} ->
	  notice_type(RoleId, Type),
	  do_one_notice(Type, T, Members);
      #guild_member{} ->
	  NoticeL = lookup_notice(RoleId),
	  Now = date:unixtime(),
	  NewNoticeL = lists:keystore(Type, 1, NoticeL,
				      {Type, Now}),
	  ets:insert(guild_notice,
		     {RoleId, NewNoticeL, date:unixtime()}),
	  do_one_notice(Type, T, Members);
      _ -> false
    end.

notice_type(RoleId, Type) ->
    case Type of
      1 -> notice_below:send(RoleId, guild_war);
      2 -> notice_below:send(RoleId, guild);
      3 -> notice_below:send(RoleId, guild_voyage);
      _ -> skip
    end.

-spec notice_offline(role_id()) -> ok.

notice_offline(RoleId) ->
    NoticeL = lookup_notice(RoleId),
    notice_offline(RoleId, date:unixtime(), NoticeL),
    catch ets:delete(guild_notice, RoleId),
    ok.

notice_offline(_RoleId, _Now, []) -> ok;
notice_offline(RoleId, Now, [{Type, Date} | Other]) ->
    case Now - Date > 86400 of
      true -> notice_offline(RoleId, Now, Other);
      _ ->
	  notice_type(RoleId, Type),
	  notice_offline(RoleId, Now, Other)
    end;
notice_offline(_RoleId, _Now, _Other) -> skip.

lookup_notice(RoleId) ->
    case catch ets:lookup(guild_notice, RoleId) of
      [{_, TypeL, _}] -> TypeL;
      _ -> []
    end.

apply_update_day_dun_time(Guild = #guild{members =
					     Members},
			  Count) ->
    NMembers = [G#guild_member{day_dun_time = Count}
		|| G <- Members],
    {sync, Guild#guild{members = NMembers}}.

apply_update_day_war_time(Guild = #guild{id = Gid,
					 members = Members}) ->
    NMembers = [G#guild_member{day_war_time =
				   guild_war_lib:get_end_count(RoleId, Gid)}
		|| G = #guild_member{id = RoleId} <- Members],
    {sync, Guild#guild{members = NMembers}}.

-spec create(#role{}, tuple()) -> {false, bitstring()} |
				  {ok, #role{}}.

create(_Role,
       {<<"【"/utf8, _/binary>>, _Sign, _ApplyType, _ApplyLev,
	_ApplyPower}) ->
    {false, lang:get(<<"Tên không hợp lệ"/utf8>>)};
create(Role = #role{id = RoleId, name = Name,
		    guild_bag = GuildBag = #guild_bag{id = {0, _}}},
       {Gname0, Sign, ApplyType, ApplyLev, ApplyPower}) ->
    Gname = case
	      is_binary([string_util:trim(binary_to_list(Gname0))])
		of
	      false ->
		  list_to_binary([string_util:trim(binary_to_list(Gname0))]);
	      true -> [string_util:trim(binary_to_list(Gname0))]
	    end,
    case check_create_cond(Role, Gname, Sign) of
      true ->
	  GL = [#loss{label = gold,
		      val = guild_data:get_const(create_gold)}],
	  case role_gain:do(Role, GL) of
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {ok, Role1} ->
		{ok, M = #guild_member{join_time = Now}} =
		    role_convert:do(guild_member, Role),
		NewM = M#guild_member{post = 1},
		#guild_data{lev = GLev, num = MaxNum} =
		    guild_data:get(1),
		G = #guild{name = Gname, leader_id = RoleId,
			   leader_name = Name, members = [NewM], lev = GLev,
			   members_max = MaxNum, create_time = Now, sign = Sign,
			   apply_type = ApplyType, apply_lev = ApplyLev,
			   apply_power = ApplyPower},
		TempInfo = {RoleId, {0, <<>>}},
		case ets:insert_new(guild_member, TempInfo) of
		  true ->
		      case guild_mgr:call({create, G}) of
			{ok, GPid, {Gid, GSrvId}} ->
			    Role2 = Role1#role{guild_bag =
						   GuildBag#guild_bag{id =
									  {Gid,
									   GSrvId},
								      pid =
									  GPid,
								      name =
									  Gname,
								      join_time
									  = Now,
								      lev =
									  GLev,
								      post =
									  1}},
			    NRole = guild_member:join_fire(Role2, create),
			    {ok, Role3} = guild_member:set_lev(Role, NRole),
			    Role4 = guild_dun_lib:reset_first(Role3),
			    NewRole = role_trigger:fire(#r_evt_build_guild{cache
									       =
									       #{guild_name
										     =>
										     Gname}},
							Role4),
			    sys_conn:pack_send(21320,
					       {guild_dun_lib:get_award_info(NewRole)}),
			    log:log_gain(GL, Role, NewRole, <<"创建联盟"/utf8>>,
					 util:fbin("创建公会:~ts", [Gname])),
			    notice:broadcast(world, undefined, rumor,
					     color:msg(lang:get(<<"Nhà lãnh đạo sáng suốt ~ts hôm nay đã "
								  "thành lập gia tộc ~ts, chân thành mời "
								  "các nhẫn giả tham gia！~ts"/utf8>>),
						       [Role,
							{string,
							 {rumor_guild, Gname}},
							{href,
							 {6, deep_green,
							  [Gid, GSrvId],
							  lang:get(<<"【Tôi muốn gia nhập】"/utf8>>)}}])),
			    {ok, NewRole};
			{false, Reason} ->
			    ets:delete_object(guild_member, TempInfo),
			    {false, Reason};
			_ ->
			    ets:delete_object(guild_member, TempInfo),
			    {false, lang:get(<<"Tạo gia tộc thất bại"/utf8>>)}
		      end;
		  _ ->
		      {false,
		       lang:get(<<"Phát hiện thấy bạn đã có thông tin gia "
				  "tộc"/utf8>>)}
		end
	  end;
      {false, Msg} -> {false, Msg}
    end;
create(_Role, _Info) ->
    {false,
     lang:get(<<"Hiện tại bạn đã có gia tộc"/utf8>>)}.

rename(_Role, <<"【"/utf8, _/binary>>) ->
    {false, lang:get(<<"Tên không hợp lệ"/utf8>>)};
rename(Role = #role{guild_bag =
			#guild_bag{id = GuildId, name = OldName, pid = GPid,
				   post = Post}},
       GName0)
    when is_pid(GPid) ->
    case Post of
      1 ->
	  case guild_merge:is_merge(GuildId) of
	    false ->
		GName = case
			  is_binary([string_util:trim(binary_to_list(GName0))])
			    of
			  false ->
			      list_to_binary([string_util:trim(binary_to_list(GName0))]);
			  true -> [string_util:trim(binary_to_list(GName0))]
			end,
		NLen = string_util:string_width(GName),
		case keyword:check(name, GName) of
		  false -> {false, lang:get(<<"Tên không hợp lệ"/utf8>>)};
		  _ when NLen < 2 orelse NLen > 12 ->
		      {false, lang:get(<<"Độ dài tên không đúng"/utf8>>)};
		  true ->
		      case sys_env:get(sys_ban_rename, false) of
			true ->
			    {false,
			     lang:get(<<"Chức năng đang bảo trì, tạm thời đóng "
					"cửa, xin vui lòng thông cảm"/utf8>>)};
			_ ->
			    case OldName of
			      <<"【"/utf8, _/binary>> ->
				  case guild_mgr:call({rename, GPid, GName}) of
				    ok -> {ok, Role};
				    {false, Msg} -> {false, Msg}
				  end;
			      _ ->
				  GL = [#loss{label = gold,
					      val =
						  guild_data:get_const(rename_gold)}],
				  case role_gain:do(Role, GL) of
				    {false, #loss{msg = Msg}} -> {false, Msg};
				    {ok, Role1} ->
					log:log_gain(GL, Role, Role1,
						     <<"联盟改名"/utf8>>,
						     util:fbin("修改公会名字,旧名字:~w  新名字:~ts",
							       [OldName,
								GName0])),
					case guild_mgr:call({rename, GPid,
							     GName})
					    of
					  ok -> {ok, Role1};
					  {false, Msg} -> {false, Msg}
					end
				  end
			    end
		      end
		end;
	    true ->
		{false,
		 lang:get(<<"Đang trong quá trình hợp nhất gia tộc, "
			    "không thể đổi tên"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Chỉ có chủ gia tộc mới có thể đổi tên"/utf8>>)}
    end;
rename(_Role, _GName) ->
    {false, lang:get(<<"Bạn không có gia tộc"/utf8>>)}.

apply_rename(G = #guild{id = Gid,
			rename_time = LastTime},
	     NewName) ->
    Seconds = 3600 * guild_data:get_const(rename_time),
    Now = date:unixtime(),
    case Now - LastTime of
      N when N > Seconds ->
	  NewG = G#guild{name = NewName, rename_time = Now},
	  guild_member:mems_apply(NewG, all,
				  {guild_member, set,
				   [{set_name, Gid, NewName}]}),
	  guild_member:pack_send(G, all, 13518, {NewG, -1}),
	  log_http:guild_sync(NewG),
	  {sync, ok, NewG};
      N1 ->
	  RemainS = Seconds - N1,
	  Msg = case RemainS div 3600 of
		  0 ->
		      case RemainS div 60 of
			0 ->
			    util:format_ex(lang:get(<<"~wgiây"/utf8>>),
					   [RemainS]);
			M -> util:format_ex(lang:get(<<"~wPhút"/utf8>>), [M])
		      end;
		  H -> util:format_ex(lang:get(<<"~wGiờ"/utf8>>), [H])
		end,
	  {ok,
	   {false,
	    util:format_ex(lang:get(<<"Còn thời gian đến lần đổi tên tiếp theo~s"/utf8>>),
			   [Msg])}}
    end.

-spec kick(#role{}, role_id()) -> {false, bitstring()} |
				  ok.

kick(#role{id = RoleId}, RoleId) ->
    {false,
     lang:get(<<"Không thể đá (loại) chính mình"/utf8>>)};
kick(Role = #role{id = RoleId, pid = RolePid,
		  guild_bag = #guild_bag{id = _Gid, pid = GPid}},
     TarRoleId)
    when is_pid(GPid) ->
    case guild_member:check_post(Role, kick_member) of
      {false, Reason} -> {false, Reason};
      true ->
	  guild:apply(async, GPid,
		      {guild_handle, apply_kick,
		       [{RoleId, RolePid, TarRoleId}]}),
	  ok
    end;
kick(_Role, _TarRoleId) ->
    {false, lang:get(<<"Bạn không có gia tộc"/utf8>>)}.

-spec apply_kick(#guild{}, tuple()) -> ok |
				       {ok, #guild{}} | {sync, #guild{}}.

apply_kick(G = #guild{members = Members,
		      name = _GuildName, day_var = DayVar},
	   {RoleId, RolePid, TarRoleId}) ->
    case lists:keyfind(RoleId, #guild_member.id, Members) of
      #guild_member{post = Post, name = _Name} ->
	  KickNum = list_util:keyfind(1, DayVar, 0),
	  KickMax = guild_data:get_const(remove_limit),
	  GoldKickMax =
	      guild_data:get_const(gold_donate_remove_limit),
	  GoldKickNum = list_util:keyfind(2, DayVar, 0),
	  case lists:keyfind(TarRoleId, #guild_member.id, Members)
	      of
	    #guild_member{post = TarPost} when TarPost =< Post ->
		notice:alert({role_pid, RolePid},
			     lang:get(<<"Không thể đá (loại) thành viên có quyền "
					"cao hơn hoặc bằng với mình"/utf8>>)),
		ok;
	    #guild_member{} when KickNum >= KickMax ->
		notice:alert({role_pid, RolePid},
			     lang:get(<<"Hôm nay đã đạt giới hạn số lần loại "
					"bỏ thành viên trong ngày, không thể "
					"loại bỏ thêm"/utf8>>)),
		ok;
	    #guild_member{day_donate_type = DayDonateType}
		when GoldKickNum >= GoldKickMax andalso
		       DayDonateType >= 2 ->
		notice:alert({role_pid, RolePid},
			     lang:get(<<"Thành viên này đã có đóng góp lớn cho "
					"gia tộc, tạm thời không thể loại bỏ "
					"họ khỏi gia tộc"/utf8>>)),
		ok;
	    M = #guild_member{pid = TarRolePid, name = TarName,
			      day_donate_type = DayDonateType} ->
		DayVar1 = lists:keystore(1, 1, DayVar,
					 {1, KickNum + 1}),
		DayVar2 = case DayDonateType >= 2 of
			    true ->
				lists:keystore(2, 1, DayVar1,
					       {2, GoldKickNum + 1});
			    _ -> DayVar1
			  end,
		NewMembers = lists:keydelete(TarRoleId,
					     #guild_member.id, Members),
		NewG = G#guild{members = NewMembers,
			       members_num = length(NewMembers),
			       day_var = DayVar2},
		guild_member:del(TarRoleId),
		role:apply(async, TarRolePid,
			   {guild_member, set, [{quit, kick}]}),
		mail:send(TarRoleId,
			  {lang:get(<<"Rời gia tộc"/utf8>>),
			   color:msg(lang:get(<<"Do bất đồng chí hướng, bạn đã bị Chủ "
						"gia tộc mời rời khỏi gia tộc. Lần đầu "
						"bị rời gia tộc một cách bị động, bạn "
						"có thể ngay lập tức gia nhập gia tộc "
						"mới. Sau đó, nếu muốn chuyển gia tộc "
						"lại, cần phải chờ 24 giờThời gian làm "
						"mới trong ~ giờ, vui lòng lựa chọn gia "
						"tộc phù hợp một cách cẩn thận！"/utf8>>),
				     []),
			   [], [], <<"联盟踢人"/utf8>>}),
		notice:broadcast(guild, NewMembers, sys_guild,
				 color:msg(lang:get(<<"Rất tiếc, nhẫn giả ~ts đã bị loại khỏi "
						      "gia tộc, hãy cùng chúng ta tưởng nhớ "
						      "anh ấy"/utf8>>),
					   [{name, TarRoleId, TarName}])),
		guild_member:pack_send(G, all, 13542, {2, [M]}),
		guild_member:pack_send(G, all, 13518, {NewG, -1}),
		notice:alert({role_pid, RolePid},
			     util:fbin(lang:get(<<"Đã thành công loại bỏ ~ts khỏi gia tộc"/utf8>>),
				       [TarName])),
		log_http:guild_sync(NewG),
		{sync, NewG};
	    _ ->
		notice:alert({role_pid, RolePid},
			     lang:get(<<"Đối phương không phải là thành viên "
					"của gia tộc này"/utf8>>)),
		ok
	  end;
      _ -> ok
    end.

-spec quit(#role{}) -> ok | {false, bitstring()} | ok.

quit(#role{guild_bag = #guild_bag{post = 1}}) ->
    {false,
     lang:get(<<"Chủ gia tộc không thể trực tiếp rời "
		"gia tộc"/utf8>>)};
quit(#role{id = RoleId, pid = RolePid,
	   guild_bag = #guild_bag{id = _Gid, pid = GPid}})
    when is_pid(GPid) ->
    guild:apply(async, GPid,
		{guild_handle, apply_quit, [{RoleId, RolePid}]}),
    ok;
quit(_Role) ->
    {false, lang:get(<<"Bạn không có gia tộc"/utf8>>)}.

-spec apply_quit(#guild{}, tuple()) -> ok |
				       {ok, #guild{}} | {sync, #guild{}}.

apply_quit(G = #guild{members = Members},
	   {RoleId, RolePid}) ->
    case lists:keyfind(RoleId, #guild_member.id, Members) of
      #guild_member{post = 1} -> ok;
      M = #guild_member{} ->
	  NewMembers = lists:keydelete(RoleId, #guild_member.id,
				       Members),
	  NewG = G#guild{members = NewMembers,
			 members_num = length(NewMembers)},
	  guild_member:del(RoleId),
	  var:set_role_var(RoleId, other, 4, 0),
	  role:apply(async, RolePid,
		     {guild_member, set, [{quit, quit}]}),
	  guild_member:pack_send(NewG, all, 13542, {2, [M]}),
	  guild_member:pack_send(NewG, all, 13518, {NewG, -1}),
	  log_http:guild_sync(NewG),
	  {sync, NewG};
      _ -> ok
    end.

-spec set_post(#role{}, role_id(),
	       pos_integer()) -> ok | {false, bitstring()}.

set_post(#role{id = RoleId}, RoleId, _Post) ->
    {false,
     lang:get(<<"Không thể thiết lập chính mình"/utf8>>)};
set_post(#role{id = RoleId, pid = RolePid,
	       guild_bag = #guild_bag{pid = GPid, post = TarPost}},
	 TarRoleId, TarPost = 1)
    when is_pid(GPid) ->
    guild:apply(async, GPid,
		{guild_handle, apply_set_post,
		 [{RoleId, RolePid, TarRoleId, TarPost}]}),
    ok;
set_post(#role{guild_bag = #guild_bag{post = Post}},
	 _TarRoleId, TarPost)
    when Post >= TarPost ->
    {false,
     lang:get(<<"Chỉ có thể thiết lập cho vị trí mục "
		"tiêu thấp hơn vị trí của mình"/utf8>>)};
set_post(Role = #role{id = RoleId, pid = RolePid,
		      guild_bag = #guild_bag{pid = GPid}},
	 TarRoleId, TarPost)
    when is_pid(GPid) ->
    case guild_member:check_post(Role, recall_position) of
      {false, Reason} -> {false, Reason};
      true ->
	  case guild_data:get_position(TarPost) of
	    #guild_position{} ->
		guild:apply(async, GPid,
			    {guild_handle, apply_set_post,
			     [{RoleId, RolePid, TarRoleId, TarPost}]}),
		ok;
	    _ ->
		{false,
		 lang:get(<<"Vị trí liên quan không tồn tại"/utf8>>)}
	  end
    end;
set_post(_Role, _TarRoleId, _Post) ->
    {false, lang:get(<<"Bạn không có gia tộc"/utf8>>)}.

-spec apply_set_post(#guild{}, tuple()) -> ok |
					   {ok, #guild{}} | {sync, #guild{}}.

apply_set_post(G = #guild{id = GuildId, pid = GPid,
			  members = Members, lev = GLev,
			  create_time = CreateTime},
	       {RoleId, RolePid, TarRoleId, TarPost}) ->
    case lists:keyfind(RoleId, #guild_member.id, Members) of
      LM = #guild_member{post = Post, name = Name} ->
	  #guild_position{name = PostName} =
	      guild_data:get_position(TarPost),
	  case lists:keyfind(TarRoleId, #guild_member.id, Members)
	      of
	    #guild_member{post = TarPost} -> ok;
	    M = #guild_member{pid = MemPid, post = MemPost,
			      name = TarName, online = TarOnline,
			      login_time = TarLoginTime}
		when Post =:= TarPost andalso TarPost =:= 1 ->
		Now = date:unixtime(),
		DiffTime = CreateTime +
			     3600 *
			       guild_data:get_const(transfer_time_condition)
			     - Now,
		case DiffTime > 0 of
		  true ->
		      notice:alert({role_pid, RolePid},
				   util:fbin(lang:get(<<"Sau khi gia tộc được tạo, cần phải chờ "
							"~w giờ mới có thể chuyển nhượng chức "
							"vụ Chủ gia tộc, vui lòng đợi~ts"/utf8>>),
					     [guild_data:get_const(transfer_time_condition),
					      format:sec(DiffTime)])),
		      ok;
		  false ->
		      NewLM = LM#guild_member{post = MemPost},
		      NewM = M#guild_member{post = TarPost},
		      Members1 = lists:keyreplace(RoleId, #guild_member.id,
						  Members, NewLM),
		      NewMembers = lists:keyreplace(TarRoleId,
						    #guild_member.id, Members1,
						    NewM),
		      NewG = G#guild{members = NewMembers,
				     leader_id = TarRoleId,
				     leader_name = TarName},
		      role:apply(async, RolePid,
				 {guild_member, set,
				  [{set_post, GuildId, MemPost}]}),
		      role:apply(async, MemPid,
				 {guild_member, set,
				  [{set_post, GuildId, TarPost}]}),
		      guild_member:pack_send(G, all, 13542,
					     {0, [NewLM, NewM]}),
		      notice:broadcast(guild, Members, sys_guild,
				       color:msg(lang:get(<<"“Bạn là người sẽ kế thừa ý chí của tôi! "
							    "~ts sẽ chuyển nhượng chức vụ Chủ gia "
							    "tộc cho ~ts, tất cả mọi người đã chứng "
							    "kiến sự ra đời của tân Chủ gia tộc！"/utf8>>),
						 [{name, RoleId, Name},
						  {name, TarRoleId, TarName}])),
		      MsgLog1 =
			  util:fbin(lang:get(<<"~tsĐược bổ nhiệm làm Chủ gia tộc"/utf8>>),
				    [TarName]),
		      add_guild_log(RoleId, TarName, GPid, MsgLog1, 4),
		      guild_member:pack_send(G, all, 13518, {NewG, -1}),
		      notice:alert({role_pid, RolePid},
				   util:fbin(lang:get(<<"Đã bổ nhiệm ~ts làm ~ts thành công"/utf8>>),
					     [TarName, PostName])),
		      case TarOnline of
			1 -> [];
			_ ->
			    guild:set_timer(vice_leader_mail, TarLoginTime,
					    TarName, TarRoleId, 1),
			    guild:set_timer(normal_mail, TarLoginTime, TarName,
					    TarRoleId, 2)
		      end,
		      guild_lib:switch_leader(NewG),
		      log_http:guild_sync(NewG),
		      {sync, NewG}
		end;
	    #guild_member{post = MemPost}
		when MemPost =< Post orelse TarPost =< Post ->
		notice:alert({role_pid, RolePid},
			     lang:get(<<"Chỉ có thể thao tác đối với thành viên "
					"có vị trí thấp hơn mình"/utf8>>)),
		ok;
	    M = #guild_member{post = MemPost, pid = MemPid,
			      name = TarName} ->
		PostMax = guild_data:get_position_num({TarPost, GLev}),
		PostNum = length([1
				  || #guild_member{post = P} <- Members,
				     P =:= TarPost]),
		case PostNum < PostMax of
		  true ->
		      NewM = M#guild_member{post = TarPost},
		      NewMembers = lists:keyreplace(TarRoleId,
						    #guild_member.id, Members,
						    NewM),
		      NewG = G#guild{members = NewMembers},
		      role:apply(async, MemPid,
				 {guild_member, set,
				  [{set_post, GuildId, TarPost}]}),
		      guild_member:pack_send(G, all, 13542, {0, [NewM]}),
		      notice:alert({role_pid, RolePid},
				   util:fbin(lang:get(<<"Đã bổ nhiệm ~ts làm ~ts thành công"/utf8>>),
					     [TarName, PostName])),
		      case {MemPost, TarPost} of
			{2, 3} ->
			    notice:broadcast(guild, Members, sys_guild,
					     color:msg(lang:get(<<"~tsSau khi suy nghĩ nặng nề, với một "
								  "trái tim buồn,~tsChức vụ phó gia tộc "
								  "đã bị thu hồi。"/utf8>>),
						       [{name, RoleId, Name},
							{name, TarRoleId,
							 TarName}])),
			    MsgLog2 =
				util:fbin(lang:get(<<"Bị cách chức Phó gia tộc"/utf8>>),
					  []),
			    add_guild_log(RoleId, TarName, GPid, MsgLog2, 4);
			{3, 2} ->
			    notice:broadcast(guild, Members, sys_guild,
					     color:msg(lang:get(<<"Tin tức mới nhất! Tin tức mới nhất! "
								  "Sau một quyết định nghiêm túc，~tsChúng "
								  "ta hãy chúc mừng ông được bổ nhiệm làm "
								  "Phó gia tộc！"/utf8>>),
						       [{name, TarRoleId,
							 TarName}])),
			    MsgLog3 =
				util:fbin(lang:get(<<"Được bổ nhiệm làm Phó gia tộc"/utf8>>),
					  []),
			    add_guild_log(RoleId, TarName, GPid, MsgLog3, 4);
			_ -> skip
		      end,
		      {sync, NewG};
		  _ ->
		      notice:alert({role_pid, RolePid},
				   lang:get(<<"Số lượng người cho vị trí này đã đạt "
					      "đến giới hạn trên"/utf8>>)),
		      ok
		end;
	    _ ->
		notice:alert({role_pid, RolePid},
			     lang:get(<<"gia tộc không có thành viên này"/utf8>>)),
		ok
	  end;
      _ -> ok
    end.

-spec apply_gm_set_post(#guild{}, tuple()) -> ok |
					      {ok, #guild{}} | {sync, #guild{}}.

apply_gm_set_post(G = #guild{id = GuildId,
			     members = Members, lev = GLev},
		  {TarRoleId, TarPost, _Msg}) ->
    case lists:keyfind(1, #guild_member.post, Members) of
      LM = #guild_member{id = RoleId, pid = RolePid,
			 post = Post, name = _Name} ->
	  #guild_position{name = _PostName} =
	      guild_data:get_position(TarPost),
	  case lists:keyfind(TarRoleId, #guild_member.id, Members)
	      of
	    #guild_member{post = TarPost} ->
		{ok, {ok, lang:get(<<"Thiết lập thành công"/utf8>>)}};
	    M = #guild_member{pid = MemPid, post = MemPost,
			      name = TarName}
		when Post =:= TarPost andalso TarPost =:= 1 ->
		NewLM = LM#guild_member{post = MemPost},
		NewM = M#guild_member{post = TarPost},
		Members1 = lists:keyreplace(RoleId, #guild_member.id,
					    Members, NewLM),
		NewMembers = lists:keyreplace(TarRoleId,
					      #guild_member.id, Members1, NewM),
		NewG = G#guild{members = NewMembers,
			       leader_id = TarRoleId, leader_name = TarName},
		role:apply(async, RolePid,
			   {guild_member, set, [{set_post, GuildId, MemPost}]}),
		role:apply(async, MemPid,
			   {guild_member, set, [{set_post, GuildId, TarPost}]}),
		guild_member:pack_send(G, all, 13542,
				       {0, [NewLM, NewM]}),
		notice:broadcast(guild, Members, sys_guild,
				 color:msg(lang:get(<<"Tin lớn, GM chuyển giao chức chủ gia "
						      "tộc cho~ts"/utf8>>),
					   [{name, TarRoleId, TarName}])),
		guild_member:pack_send(G, all, 13518, {NewG, -1}),
		guild_lib:switch_leader(NewG),
		log_http:guild_sync(NewG),
		{sync, {ok, lang:get(<<"Thiết lập thành công"/utf8>>)},
		 NewG};
	    M = #guild_member{post = MemPost, pid = MemPid,
			      name = TarName} ->
		PostMax = guild_data:get_position_num({TarPost, GLev}),
		PostNum = length([1
				  || #guild_member{post = P} <- Members,
				     P =:= TarPost]),
		case PostNum < PostMax of
		  true ->
		      NewM = M#guild_member{post = TarPost},
		      NewMembers = lists:keyreplace(TarRoleId,
						    #guild_member.id, Members,
						    NewM),
		      NewG = G#guild{members = NewMembers},
		      role:apply(async, MemPid,
				 {guild_member, set,
				  [{set_post, GuildId, TarPost}]}),
		      guild_member:pack_send(G, all, 13542, {0, [NewM]}),
		      case {MemPost, TarPost} of
			{2, 3} ->
			    notice:broadcast(guild, Members, sys_guild,
					     color:msg(lang:get(<<"GMĐã hủy~tsPhó gia tộc"/utf8>>),
						       [{name, TarRoleId,
							 TarName}]));
			{3, 2} ->
			    notice:broadcast(guild, Members, sys_guild,
					     color:msg(lang:get(<<"Tin lớn, bổ nhiệm GM~tsPhó gia tộc"/utf8>>),
						       [{name, TarRoleId,
							 TarName}]));
			_ -> skip
		      end,
		      {sync, {ok, lang:get(<<"Thiết lập thành công"/utf8>>)},
		       NewG};
		  _ -> {ok, {false, lang:get(<<"Vị trí đã đầy"/utf8>>)}}
		end;
	    _ ->
		{ok,
		 {false,
		  lang:get(<<"Người chơi không ở trong một guild"/utf8>>)}}
	  end;
      _ ->
	  {ok,
	   {false,
	    lang:get(<<"Thiết lập không thành công"/utf8>>)}}
    end.

-spec disband(#role{}) -> ok | {false, bitstring()}.

disband(#role{guild_bag =
		  #guild_bag{pid = GPid, post = 1},
	      id = RoleId, pid = RolePid})
    when is_pid(GPid) ->
    guild:apply(async, GPid,
		{guild_handle, apply_disband, [{RoleId, RolePid}]}),
    ok;
disband(_Role) ->
    {false,
     lang:get(<<"Bạn không phải là chủ gia tộc"/utf8>>)}.

-spec apply_disband(#guild{}, tuple()) -> ok |
					  {stop, normal, #guild{}}.

apply_disband(#guild{lev = Lev, members_num = MemNum},
	      {_, RolePid})
    when Lev >= 5 andalso MemNum > 2 ->
    notice:alert({role_pid, RolePid},
		 lang:get(<<"gia tộc quá phát triển để có thể giải "
			    "tán trực tiếp"/utf8>>)),
    ok;
apply_disband(G = #guild{leader_id = RoleId},
	      {RoleId, RolePid}) ->
    case do_disband(G, leader) of
      {ok, NewG} -> {stop, normal, NewG};
      {false, Reason} ->
	  notice:alert({role_pid, RolePid}, Reason), ok
    end;
apply_disband(_, _) -> ok.

-spec do_disband(#guild{}, leader | sys) -> {ok,
					     #guild{}} |
					    {false, bitstring()}.

do_disband(G = #guild{id = GuildId, name = Gname,
		      members = Members, leader_id = LeaderId,
		      leader_name = LeaderName},
	   Flag) ->
    case check_disband(G) of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_handle663, _,
	     {__Levelguild_handle663, __Tracesguild_handle663}}
		when __Levelguild_handle663 band 64 /= 0 orelse
		       __Tracesguild_handle663 /= [] ->
		lager:do_log(info,
			     [{module, guild_handle}, {function, do_disband},
			      {line, 663}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("公会[~w,~ts]解散处理:~w",
					   [GuildId, Gname, Flag]),
			     none, 4096, 64, __Levelguild_handle663,
			     __Tracesguild_handle663, lager_event,
			     __Pidguild_handle663);
	    _ -> ok
	  end,
	  Now = date:unixtime(),
	  Fun = fun (#guild_member{pid = MemPid, id = MemId}) ->
			guild_member:del(MemId),
			case Flag of
			  leader ->
			      case MemId =:= LeaderId of
				true ->
				    role:apply(async, MemPid,
					       {guild_member, set,
						[{quit, leader_disband}]});
				_ ->
				    role:apply(async, MemPid,
					       {guild_member, set,
						[{quit, disband}]})
			      end,
			      ets:insert(guild_member_quit, {MemId, Now}),
			      mail:send(MemId,
					{lang:get(<<"Giải thể gia tộc"/utf8>>),
					 color:msg(lang:get(<<"Những ngọn núi vẫn xanh và dòng nước "
							      "vẫn chảy mãi! Chủ gai tộc~tsGiải tán "
							      "guild！"/utf8>>),
						   [{name, LeaderId,
						     LeaderName}]),
					 [], [], <<"联盟解散"/utf8>>});
			  sys ->
			      role:apply(async, MemPid,
					 {guild_member, set,
					  [{quit, sys_kick}]}),
			      ets:insert(guild_member_quit, {MemId, 0}),
			      mail:send(MemId,
					{lang:get(<<"Giải thể gia tộc"/utf8>>),
					 lang:get(<<"Gia tộc đã tự động giải tán do thiếu "
						    "kinh nghiệm bảo trì."/utf8>>),
					 [], [], <<"联盟解散"/utf8>>});
			  _ ->
			      role:apply(async, MemPid,
					 {guild_member, set, [{quit, disband}]})
			end
		end,
	  [Fun(M) || M <- Members],
	  guild_rank:exit_rank(GuildId),
	  ets:delete(guild_list, GuildId),
	  dets:delete(guild_list, GuildId),
	  guild_dun:close(GuildId),
	  guild_mem_red_packet:disband(GuildId),
	  log_http:guild_sync(G#guild{members_num = 0}),
	  {ok, G};
      {false, Reason} -> {false, Reason}
    end.

check_disband(#guild{id = GuildId}) ->
    case guild_merge:is_merge(GuildId) of
      false -> true;
      _ ->
	  {false,
	   lang:get(<<"Hội đang được sáp nhập và không thể "
		      "giải thể."/utf8>>)}
    end.

-spec set_sign(#role{}, Sign :: bitstring()) -> ok |
						{false, bitstring()}.

set_sign(_Role, Sign) when byte_size(Sign) > 300 ->
    {false, lang:get(<<"Nội dung quá dài"/utf8>>)};
set_sign(Role = #role{pid = RolePid, id = RoleId,
		      name = Name, lev = Lev, m_vip = #m_vip{lev = VipLev},
		      guild_bag = #guild_bag{pid = GPid}},
	 Sign)
    when is_pid(GPid) ->
    Now = date:unixtime(),
    case var:get_var(Role, other, 3082, 0) of
      Time
	  when Time >= Now andalso Lev < 60 andalso VipLev < 4 ->
	  ok;
      _ ->
	  case guild_member:check_post(Role, set_sign) of
	    {false, Reason} -> {false, Reason};
	    true ->
		case sys_env:get(sys_ban_rename, false) of
		  true ->
		      {false,
		       lang:get(<<"Chức năng này đang được bảo trì và tạm "
				  "thời đóng. Xin hãy thông cảm."/utf8>>)};
		  _ ->
		      case keyword:check(base, Sign) of
			true ->
			    guild:apply(async, GPid,
					{guild_handle, apply_set_sign,
					 [{RoleId, Name, RolePid, Sign}]}),
			    ok;
			_ -> {false, lang:get(<<"Nội dung bất hợp pháp"/utf8>>)}
		      end
		end
	  end
    end;
set_sign(_Role, _Sign) ->
    {false, lang:get(<<"Bạn không có gia tộc"/utf8>>)}.

-spec apply_set_sign(#guild{}, tuple()) -> ok |
					   {ok, #guild{}} | {sync, #guild{}}.

apply_set_sign(Guild = #guild{lock_time = 0},
	       {RoleId, Name, RolePid, Sign}) ->
    NewGuild = Guild#guild{sign = Sign},
    role:pack_send(proxy, RolePid, 13518, {NewGuild, -1}),
    notice:broadcast(guild, Guild, sys_guild,
		     color:msg(lang:get(<<"~ts坐在马桶上经过严肃的思考后，一拍大腿，将公会公告修改为：~ts。"/utf8>>),
			       [{name, RoleId, Name}, {binary, Sign}])),
    notice:alert({role_pid, RolePid},
		 lang:get(<<"修改宣言成功"/utf8>>)),
    guild:update_element(NewGuild, [#guild.sign]),
    log_http:guild_sync(NewGuild),
    {nosync, NewGuild};
apply_set_sign(_Guild,
	       {_RoleId, _Name, RolePid, _Sign}) ->
    notice:alert({role_pid, RolePid},
		 lang:get(<<"公会被锁定，请联系GM"/utf8>>)),
    ok.

-spec set_apply(#role{}, 0..1, non_neg_integer(),
		non_neg_integer()) -> ok | {false, bitstring()}.

set_apply(Role = #role{pid = RolePid,
		       guild_bag = #guild_bag{pid = GPid}},
	  ApplyType, ApplyLev, ApplyPower)
    when is_pid(GPid) ->
    case guild_member:check_post(Role, set_apply) of
      {false, Reason} -> {false, Reason};
      true ->
	  guild:apply(async, GPid,
		      {guild_handle, apply_set_apply,
		       [{RolePid, ApplyType, ApplyLev, ApplyPower}]}),
	  ok
    end;
set_apply(_Role, _, _, _) ->
    {false, lang:get(<<"Bạn không có gia tộc"/utf8>>)}.

-spec apply_set_apply(#guild{}, tuple()) -> ok |
					    {ok, #guild{}} | {sync, #guild{}}.

apply_set_apply(Guild,
		{RolePid, ApplyType, ApplyLev, ApplyPower}) ->
    NewGuild = Guild#guild{apply_type = ApplyType,
			   apply_lev = ApplyLev, apply_power = ApplyPower},
    guild:update_element(NewGuild,
			 [#guild.apply_type, #guild.apply_lev,
			  #guild.apply_power]),
    guild_member:pack_send(NewGuild, all, 13518,
			   {NewGuild, -1}),
    guild_rank:in_rank(NewGuild),
    notice:alert({role_pid, RolePid},
		 lang:get(<<"更改设置成功"/utf8>>)),
    {nosync, NewGuild}.

-spec recruit(#role{}) -> {ok, #role{}} |
			  {false, bitstring()}.

recruit(Role = #role{guild_bag =
			 #guild_bag{id = Gid, pid = GPid}})
    when is_pid(GPid) ->
    case guild_member:check_post(Role, recruit) of
      {false, Reason} -> {false, Reason};
      true ->
	  case role_misc:check_cd_with_end_time(guild_recruit,
						180000)
	      of
	    {false, EndTime} ->
		{false,
		 util:fbin(lang:get(<<"操作过于频繁，~w秒后可招募"/utf8>>),
			   [EndTime])};
	    _ ->
		Ret = case guild_lib:elem(Gid, #guild.recruit_num) of
			{ok, 0} -> {ok, Role};
			{ok, Num} ->
			    CostVal = guild_data:get_const(recruit_cost),
			    LimitNum = guild_data:get_const(recruit_limit),
			    case Num >= LimitNum of
			      true -> {false, lang:get(<<"招募次数已达上限"/utf8>>)};
			      _ ->
				  role_gain:do(Role,
					       [#loss{label = gold,
						      val = CostVal}])
			    end;
			_ -> {false, lang:get(<<"系统繁忙"/utf8>>)}
		      end,
		case Ret of
		  {false, #loss{msg = Msg}} -> {false, Msg};
		  {false, Reason} -> {false, Reason};
		  {ok, NRole} ->
		      log:log_assets(gold, Role, NRole, <<"联盟招募"/utf8>>,
				     util:fbin("发招募广告", [])),
		      {SayInfo, _, _, _, _} = say:pack_speak(Role,
							     {1, 1, <<>>}),
		      guild:apply(async, GPid,
				  {guild_handle, apply_recruit, [{SayInfo}]}),
		      log:save(join,
			       {NRole, <<"功能玩法"/utf8>>, <<"公会发布招募"/utf8>>}),
		      {ok, NRole}
		end
	  end
    end;
recruit(_Role) ->
    {false, lang:get(<<"Bạn không có gia tộc"/utf8>>)}.

-spec apply_recruit(#guild{}, tuple()) -> {nosync,
					   #guild{}}.

apply_recruit(Guild = #guild{id = {Gid, GSrvId},
			     lev = GLev, name = Gname, apply_lev = ApplyLev,
			     recruit_num = RecruitNum,
			     apply_power = ApplyPower},
	      {SayInfo}) ->
    NewGuild = Guild#guild{recruit_num = RecruitNum + 1},
    guild:update_element(NewGuild, [#guild.recruit_num]),
    guild_member:pack_send(NewGuild, all, 13518,
			   {NewGuild, -1}),
    Msg =
	color:msg(lang:get(<<"~ts级公会~ts正在招募成员，诚邀各位冒险者加入！（申请等级~ts级以上）（申请战力~t"
			     "s以上）~ts"/utf8>>),
		  [{string, {orange, GLev}},
		   {string, {rumor_guild, Gname}},
		   {string, {orange, ApplyLev}},
		   {string, {orange, ApplyPower}},
		   {href,
		    {6, deep_green, [Gid, GSrvId],
		     lang:get(<<"【我要加入】"/utf8>>)}}]),
    Data = {SayInfo, 1, 0, Msg, date:unixtime()},
    role_group:pack_send(world, 12761, Data),
    notice:broadcast(world, undefined, rumor, Msg),
    {nosync, NewGuild}.

-spec impeach(#role{}) -> {false, bitstring()} |
			  {ok, #role{}}.

impeach(#role{guild_bag = #guild_bag{post = 1}}) ->
    {false, lang:get(<<"你已经是会长了"/utf8>>)};
impeach(Role = #role{id = RoleId, pid = RolePid,
		     guild_bag = #guild_bag{id = Gid, pid = GPid}})
    when is_pid(GPid) ->
    Loss = guild_data:get_const(impeach_gold),
    GL = format:val_to_loss(Loss, guild_impeach),
    case role_gain:do(Role, GL) of
      {false, #loss{msg = Msg}} -> {false, Msg};
      {ok, NRole} ->
	  case guild_lib:info(by_id, Gid) of
	    {ok, #guild{leader_id = LeaderId, members = Members}} ->
		Now = date:unixtime(),
		MyPost = case lists:keyfind(RoleId, #guild_member.id,
					    Members)
			     of
			   #guild_member{post = Post} -> Post;
			   _ -> 3
			 end,
		Day = case MyPost of
			2 -> guild_data:get_const(impeach_offline_day1);
			_ -> guild_data:get_const(impeach_offline_day2)
		      end,
		case lists:keyfind(LeaderId, #guild_member.id, Members)
		    of
		  #guild_member{login_time = LoginTime, online = Online}
		      when Now - LoginTime < 86400 * Day orelse
			     Online =:= 1 ->
		      {false,
		       util:fbin(lang:get(<<"会长需要下线~w天以上才能弹劾"/utf8>>), [Day])};
		  #guild_member{name = LeaderName} ->
		      case role_misc:check_cd(guild_impeach, 10000) of
			false -> {false, lang:get(<<"操作过频繁"/utf8>>)};
			_ ->
			    log:log_gain(GL, Role, NRole, <<"盟主弹劾"/utf8>>,
					 util:fbin("会长:~ts", [LeaderName])),
			    guild:apply(async, GPid,
					{guild_handle, apply_impeach,
					 [{RoleId, RolePid, LeaderId, Now}]}),
			    {ok, NRole}
		      end;
		  _ -> {false, lang:get(<<"获取会长信息失败"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"获取公会数据失败"/utf8>>)}
	  end
    end;
impeach(_Role) ->
    {false, lang:get(<<"Bạn không có gia tộc"/utf8>>)}.

gm_apply_set_offtime(G = #guild{leader_id = LeaderId,
				members = Members},
		     {Day}) ->
    Now = date:unixtime(),
    case lists:keyfind(LeaderId, #guild_member.id, Members)
	of
      M = #guild_member{post = 1, online = 0} ->
	  NewM = M#guild_member{login_time = Now - 86400 * Day},
	  Members1 = lists:keyreplace(LeaderId, #guild_member.id,
				      Members, NewM),
	  NewG = G#guild{members = Members1},
	  guild_member:pack_send(G, all, 13542, {0, [NewM]}),
	  guild_member:pack_send(G, all, 13518, {NewG, -1}),
	  log_http:guild_sync(NewG),
	  {sync, NewG};
      _ -> ok
    end.

-spec apply_impeach(#guild{}, tuple()) -> {ok,
					   #guild{}}.

apply_impeach(G = #guild{id = GuildId, name = GName,
			 leader_id = LeaderId, members = Members},
	      {RoleId, RolePid, LeaderId, Now}) ->
    MyPost = case lists:keyfind(RoleId, #guild_member.id,
				Members)
		 of
	       #guild_member{post = Post} -> Post;
	       _ -> 3
	     end,
    Day = case MyPost of
	    2 -> guild_data:get_const(impeach_offline_day1);
	    _ -> guild_data:get_const(impeach_offline_day2)
	  end,
    case lists:keyfind(LeaderId, #guild_member.id, Members)
	of
      LM = #guild_member{login_time = LoginTime,
			 post = TarPost, name = LeaderName, online = 0}
	  when Now - LoginTime >= 86400 * Day ->
	  case lists:keyfind(RoleId, #guild_member.id, Members) of
	    M = #guild_member{post = MemPost, name = Name} ->
		NewLM = LM#guild_member{post = MemPost},
		NewM = M#guild_member{post = TarPost},
		Members1 = lists:keyreplace(LeaderId, #guild_member.id,
					    Members, NewLM),
		NewMembers = lists:keyreplace(RoleId, #guild_member.id,
					      Members1, NewM),
		NewG = G#guild{members = NewMembers, leader_id = RoleId,
			       leader_name = Name},
		role:apply(async, RolePid,
			   {guild_member, set, [{set_post, GuildId, TarPost}]}),
		guild_member:pack_send(G, all, 13542,
				       {0, [NewLM, NewM]}),
		notice:broadcast(guild, Members, sys_guild,
				 color:msg(lang:get(<<"号外号外！~ts弹劾了决心归隐田园的原会长~ts,成为了新的会长，大家见证了这神圣庄严的一"
						      "刻！一个新时代的诞生！鼓掌！干杯！ヾ(*≧∇≦)〃"/utf8>>),
					   [{name, RoleId, Name},
					    {name, LeaderId, LeaderName}])),
		Content =
		    color:msg(lang:get(<<"由于您的不在线时长超过~ts天，您在公会[~ts]中的会长位置已被~ts玩家接替。"/utf8>>),
			      [{string, {red, Day}}, {string, {blue, GName}},
			       {name, RoleId, Name}]),
		Mail = {lang:get(<<"会长被弹劾通知"/utf8>>), Content, [], [],
			<<"会长被弹劾通知"/utf8>>, 86400 + date:unixtime()},
		mail:send(LeaderId, Mail),
		Content1 =
		    color:msg(lang:get(<<"亲爱的冒险者大人，您公会的~ts弹劾原会长~ts成功，成为新的公会会长。"/utf8>>),
			      [{name, RoleId, Name},
			       {name, LeaderId, LeaderName}]),
		Mail1 = {lang:get(<<"公会通知"/utf8>>), Content1, [], [],
			 <<"公会通知"/utf8>>, 86400 + date:unixtime()},
		MembersId = [MId
			     || #guild_member{id = MId} <- Members,
				MId =/= LeaderId],
		mail:send(MembersId, Mail1),
		guild_member:pack_send(G, all, 13518, {NewG, -1}),
		notice:alert({role_pid, RolePid},
			     util:fbin(lang:get(<<"您成功弹劾会长，并成为新任会长"/utf8>>),
				       [])),
		guild_lib:switch_leader(NewG),
		log_http:guild_sync(NewG),
		{sync, NewG};
	    _ ->
		role:apply(async, RolePid,
			   {guild_handle, apply_impeach_fail, []}),
		ok
	  end;
      _ ->
	  role:apply(async, RolePid,
		     {guild_handle, apply_impeach_fail, []}),
	  ok
    end;
apply_impeach(_G,
	      {_RoleId, RolePid, _LeaderId, _Now}) ->
    role:apply(async, RolePid,
	       {guild_handle, apply_impeach_fail, []}),
    ok.

-spec apply_impeach_fail(#role{}) -> {ok, #role{}}.

apply_impeach_fail(Role) ->
    GL = [#gain{label = gold,
		val = guild_data:get_const(impeach_gold)}],
    case role_gain:do(Role, GL) of
      {ok, NRole} ->
	  log:log_gain(GL, Role, NRole, <<"盟主弹劾"/utf8>>,
		       util:fbin("弹劾失败", [])),
	  notice:alert(lang:get(<<"弹劾失败"/utf8>>)),
	  {ok, NRole};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_handle957, _,
	     {__Levelguild_handle957, __Tracesguild_handle957}}
		when __Levelguild_handle957 band 8 /= 0 orelse
		       __Tracesguild_handle957 /= [] ->
		lager:do_log(error,
			     [{module, guild_handle},
			      {function, apply_impeach_fail}, {line, 957},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("角色Id:~w, 名字:~w, 损益操作失败",
					   [Role#role.id, Role#role.name]),
			     none, 4096, 8, __Levelguild_handle957,
			     __Tracesguild_handle957, lager_event,
			     __Pidguild_handle957);
	    _ -> ok
	  end,
	  {ok, Role}
    end.

-spec donate(#role{}, non_neg_integer()) -> {false,
					     bitstring()} |
					    {ok, #role{}}.

donate(RoleT = #role{id = RoleId, pid = RolePid,
		     guild_bag = #guild_bag{pid = GPid}},
       Type)
    when is_pid(GPid) ->
    {DonateDayList, Role} = case var:get_var(RoleT, five,
					     547, [])
				of
			      Temp = [_ | _] ->
				  RoleT1 = var:set_var(RoleT, five, 547, []),
				  RoleT2 = var:set_var(RoleT1, day, 47, Temp),
				  {Temp, RoleT2};
			      _ -> {var:get_var(RoleT, day, 47, []), RoleT}
			    end,
    DayN = lists:sum([N || {_, N} <- DonateDayList]),
    DayMaxN = 1,
    case guild_data:get_donate(Type) of
      _ when DayN >= DayMaxN ->
	  {false, lang:get(<<"今天捐献次数已达上限"/utf8>>)};
      #{loss := Loss, gain := Rewards = [_ | _],
	name := Name} ->
	  LossL = format:val_to_loss(Loss, guild_donate),
	  Fun = fun (GainCfg = {GainLabel, ValCfg}, Ret) ->
			if GainLabel =:= 16 ->
			       Val = maps:get(guild_exp, Ret, 0),
			       Ret#{guild_exp => Val + ValCfg};
			   GainLabel =:= 10 ->
			       GainL = maps:get(gain_list, Ret, []),
			       Val = maps:get(guild, Ret, 0),
			       Ret#{guild => Val + ValCfg,
				    gain_list => [GainCfg | GainL]};
			   true ->
			       GainL = maps:get(gain_list, Ret, []),
			       Ret#{gain_list => [GainCfg | GainL]}
			end
		end,
	  RewardMap = lists:foldl(Fun, #{}, Rewards),
	  GainValL = maps:get(gain_list, RewardMap, []),
	  GL = LossL ++
		 format:val_to_gain(GainValL, guild_donate),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_handle996, _,
	     {__Levelguild_handle996, __Tracesguild_handle996}}
		when __Levelguild_handle996 band 128 /= 0 orelse
		       __Tracesguild_handle996 /= [] ->
		lager:do_log(debug,
			     [{module, guild_handle}, {function, donate},
			      {line, 996}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]进行公会[Type:~w]捐献:~w",
					   [Role#role.name, Type, GL]),
			     none, 4096, 128, __Levelguild_handle996,
			     __Tracesguild_handle996, lager_event,
			     __Pidguild_handle996);
	    _ -> ok
	  end,
	  case role_gain:do_notice(Role, GL) of
	    {ok, Role1} ->
		NRole = var:set_list_val(Role1, day, 47, Type,
					 DayN + 1),
		Exp = maps:get(guild_exp, RewardMap, 0),
		GVal = maps:get(guild, RewardMap, 0),
		guild:apply(async, GPid,
			    {guild_handle, apply_donate,
			     [{donate, RoleId, RolePid, Type, Exp, GVal}]}),
		NewRole = role_trigger:fire([#evt_guild_donate{type =
								   Type},
					     #evt_guild_donate_expend{type =
									  Type,
								      loss =
									  Loss}],
					    NRole),
		log:log_gain(GL, Role, NewRole, <<"联盟捐献"/utf8>>,
			     util:fbin("捐献type:~w", [Type])),
		MsgLog = util:fbin(lang:get(<<"进行了~ts。"/utf8>>),
				   [Name]),
		guild_handle:add_guild_log(RoleId, Role#role.name, GPid,
					   MsgLog, 2),
		push_base(NewRole),
		{ok, NewRole};
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidguild_handle1013, _,
		   {__Levelguild_handle1013, __Tracesguild_handle1013}}
		      when __Levelguild_handle1013 band 8 /= 0 orelse
			     __Tracesguild_handle1013 /= [] ->
		      lager:do_log(error,
				   [{module, guild_handle}, {function, donate},
				    {line, 1013}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]捐献[type:~w]失败:~w",
						 [Role#role.name, Type, Err]),
				   none, 4096, 8, __Levelguild_handle1013,
				   __Tracesguild_handle1013, lager_event,
				   __Pidguild_handle1013);
		  _ -> ok
		end,
		{false, lang:get(<<"背包已满，捐献失败"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"捐献类型不存在"/utf8>>)}
    end;
donate(_Role, _Type) ->
    {false, lang:get(<<"Bạn không có gia tộc"/utf8>>)}.

-spec apply_donate(#guild{}, tuple()) -> ok |
					 {ok, #guild{}} | {sync, #guild{}}.

apply_donate(Guild = #guild{id = Gid, exp = Exp,
			    day_exp = DayExp, lev = GLev, members = Members,
			    donate_exp = DonateExp},
	     {Flag, RoleId, RolePid, Type, AddExp, GVal}) ->
    case lists:keyfind(RoleId, #guild_member.id, Members) of
      M = #guild_member{donate = Donate,
			day_donate = DayDonate} ->
	  Now = date:unixtime(),
	  NewM = M#guild_member{donate = Donate + GVal,
				day_donate = DayDonate + GVal,
				day_donate_type = Type, day_donate_time = Now},
	  NewMembers = lists:keyreplace(RoleId, #guild_member.id,
					Members, NewM),
	  NewDonateExp = case Flag of
			   donate -> DonateExp + AddExp;
			   _ -> DonateExp
			 end,
	  Guild1 = Guild#guild{members = NewMembers,
			       donate_exp = NewDonateExp},
	  AddExp0 = case Flag of
		      gm -> AddExp;
		      _ ->
			  max(0,
			      min(AddExp,
				  guild_data:get_const(day_exp_max) - DayExp))
		    end,
	  case AddExp0 > 0 of
	    true ->
		NewGuild = #guild{lev = NewGLev} =
			       do_lev(Guild1#guild{exp = Exp + AddExp0,
						   day_exp = DayExp + AddExp0}),
		case GLev < NewGLev of
		  true ->
		      notice:broadcast(guild, {self(), true}, sys_guild,
				       color:msg(lang:get(<<"Nâng cấp bang gia tộc lên~tsCấp， Đây "
							    "là công lao của tất cả các thành viên! "
							    "Vinh quang đồng hành cùng chúng ta! "
							    "Cạn ly！"/utf8>>),
						 [{binary,
						   util:to_binary(NewGLev)}])),
		      guild_member:mems_apply(Guild, all,
					      {guild_member, set,
					       [{set_lev, Gid, NewGLev}]});
		  _ -> pass
		end,
		guild_member:pack_send(NewGuild, all, 13518,
				       {NewGuild, -1}),
		case Flag of
		  donate ->
		      notice:alert({role_pid, RolePid},
				   util:fbin(lang:get(<<"Quyên góp thành công, kinh nghiệm gia "
							"tộc+~w，Cống Hiến+~w"/utf8>>),
					     [AddExp0, GVal]));
		  guild_dun ->
		      notice:alert({role_pid, RolePid},
				   util:fbin(lang:get(<<"Đã đánh bại thành công Boss, kinh nghiệm "
							"gia tộc+~w"/utf8>>),
					     [AddExp0]));
		  _ ->
		      notice:alert({role_pid, RolePid},
				   util:fbin(lang:get(<<"Quyên góp thành công, kinh nghiệm gia "
							"tộc+~w"/utf8>>),
					     [AddExp0]))
		end,
		guild_member:pack_send(NewGuild, all, 13575,
				       {NewDonateExp}),
		{sync, NewGuild};
	    _ ->
		case Flag of
		  donate ->
		      notice:alert({role_pid, RolePid},
				   util:fbin(lang:get(<<"Quyên góp thành công, kinh nghiệm gia "
							"tộc hôm nay đã đạt giới hạn, chỉ nhận "
							"được cống hiến cá nhân+~w"/utf8>>),
					     [GVal]));
		  _ -> ok
		end,
		guild:sync_cache(Guild1, false),
		guild_member:pack_send(Guild1, all, 13575,
				       {NewDonateExp}),
		{nosync, Guild1}
	  end;
      _ -> ok
    end.

do_lev(Guild = #guild{lev = GLev, exp = Exp}) ->
    case guild_data:get(GLev) of
      #guild_data{exp = NeedExp}
	  when Exp >= NeedExp andalso NeedExp > 0 ->
	  case guild_data:get(GLev + 1) of
	    #guild_data{num = NewMemMax} ->
		do_lev(Guild#guild{lev = GLev + 1, exp = Exp - NeedExp,
				   members_max = NewMemMax});
	    _ -> Guild
	  end;
      _ -> Guild
    end.

-spec donate_box(#role{}, BoxId :: integer()) -> {ok,
						  #role{}} |
						 {false, binary()}.

donate_box(RoleT = #role{guild_bag =
			     #guild_bag{id = GuildId}},
	   BoxId) ->
    case check_donate_box(RoleT, BoxId) of
      {ok, #{boxes := Boxes, rewards := Rewards}, Role} ->
	  Gains = format:val_to_gain(Rewards, make_guild),
	  case role_gain:do_notice(Role, Gains) of
	    {ok, GainRole} ->
		NewRole = var:set_var(GainRole, day, 48,
				      {GuildId, [BoxId | Boxes]}),
		log:log_gain(Gains, Role, NewRole, <<"联盟捐献"/utf8>>,
			     util:fbin(<<"领取公会进度宝箱:~w"/utf8>>, [BoxId])),
		{ok, NewRole};
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidguild_handle1100, _,
		   {__Levelguild_handle1100, __Tracesguild_handle1100}}
		      when __Levelguild_handle1100 band 8 /= 0 orelse
			     __Tracesguild_handle1100 /= [] ->
		      lager:do_log(error,
				   [{module, guild_handle},
				    {function, donate_box}, {line, 1100},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]领取公会捐献进度宝箱id:~w失败：~w",
						 [Role#role.name, BoxId, Err]),
				   none, 4096, 8, __Levelguild_handle1100,
				   __Tracesguild_handle1100, lager_event,
				   __Pidguild_handle1100);
		  _ -> ok
		end,
		{false, lang:get(<<"Không thể nhận phần thưởng"/utf8>>)}
	  end;
      {false, Msg} -> {false, Msg}
    end.

check_donate_box(Role = #role{guild_bag =
				  #guild_bag{pid = GPid, id = GuildId}},
		 BoxId)
    when is_pid(GPid) ->
    case guild_data:donate_box(BoxId) of
      #{box_val := BoxVal, rewards := Rewards = [_ | _]} ->
	  {{OldGuildId, Boxes}, NewRole} = case var:get_var(Role,
							    five, 575,
							    {GuildId, []})
					       of
					     {_, []} ->
						 {var:get_var(Role, day, 48,
							      {GuildId, []}),
						  Role};
					     {OldTemp, Temp} ->
						 Role1 = var:set_var(Role, five,
								     575,
								     {OldTemp,
								      []}),
						 Role2 = var:set_var(Role1, day,
								     48,
								     {OldTemp,
								      Temp}),
						 {{OldTemp, Temp}, Role2}
					   end,
	  case OldGuildId =:= GuildId of
	    true ->
		case lists:member(BoxId, Boxes) of
		  false ->
		      DonateExp = get_donate_exp(GuildId),
		      case DonateExp >= BoxVal of
			true ->
			    {ok, #{rewards => Rewards, boxes => Boxes},
			     NewRole};
			false ->
			    {false,
			     lang:get(<<"Tiến độ quyên góp hộp kho báu không đủ"/utf8>>)}
		      end;
		  _ -> {false, lang:get(<<"Đã nhận phần thưởng"/utf8>>)}
		end;
	    _ ->
		{false,
		 lang:get(<<"Trong ngày chỉ có thể nhận hộp kho báu "
			    "quyên góp của cùng một gia tộc thôi "
			    "nhé"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Hộp kho báu tiến độ quyên góp chưa xác "
		      "định"/utf8>>)}
    end;
check_donate_box(_Role, _BoxId) ->
    {false,
     lang:get(<<"Vui lòng gia nhập một gia tộc trước"/utf8>>)}.

get_donate_exp(GuildId) ->
    case guild_lib:elem(GuildId, #guild.donate_exp) of
      {ok, Val} -> Val;
      _ -> 0
    end.

-spec maintain(#guild{}) -> ok | {ok, #guild{}}.

maintain(G = #guild{id = Gid, name = GName,
		    create_time = CreateTime, lev = Lev, exp = Exp,
		    members_num = MemNum, members = Members}) ->
    case date:unixtime() - CreateTime >
	   guild_data:get_const(maintain_start_time)
	of
      true ->
	  MinExp = guild_data:get_const(maintain_min_exp),
	  case Lev =:= 1 andalso Exp < MinExp of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidguild_handle1157, _,
		   {__Levelguild_handle1157, __Tracesguild_handle1157}}
		      when __Levelguild_handle1157 band 64 /= 0 orelse
			     __Tracesguild_handle1157 /= [] ->
		      lager:do_log(info,
				   [{module, guild_handle},
				    {function, maintain}, {line, 1157},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("公会[~ts]维护资金不足，自动解散, glev:~w exp:~w",
						 [GName, Lev, Exp]),
				   none, 4096, 64, __Levelguild_handle1157,
				   __Tracesguild_handle1157, lager_event,
				   __Pidguild_handle1157);
		  _ -> ok
		end,
		case guild_handle:do_disband(G, sys) of
		  {ok, NewG} -> {stop, normal, NewG};
		  {false, Reason} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidguild_handle1162, _,
			 {__Levelguild_handle1162, __Tracesguild_handle1162}}
			    when __Levelguild_handle1162 band 8 /= 0 orelse
				   __Tracesguild_handle1162 /= [] ->
			    lager:do_log(error,
					 [{module, guild_handle},
					  {function, maintain}, {line, 1162},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("公会[~ts]解散失败:~ts",
						       [GName, Reason]),
					 none, 4096, 8, __Levelguild_handle1162,
					 __Tracesguild_handle1162, lager_event,
					 __Pidguild_handle1162);
			_ -> ok
		      end,
		      ok
		end;
	    _ ->
		#guild_data{maintain = LossExp} = guild_data:get(Lev),
		notice:broadcast(guild, {self(), true}, sys_guild,
				 color:msg(lang:get(<<"gia tộc trừ kinh nghiệm bảo trì hàng "
						      "ngày~ts"/utf8>>),
					   [{deep_green, LossExp}])),
		case Exp < LossExp andalso Lev > 1 of
		  true ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidguild_handle1170, _,
			 {__Levelguild_handle1170, __Tracesguild_handle1170}}
			    when __Levelguild_handle1170 band 64 /= 0 orelse
				   __Tracesguild_handle1170 /= [] ->
			    lager:do_log(info,
					 [{module, guild_handle},
					  {function, maintain}, {line, 1170},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("公会[~ts]扣除维护经验 降级处理:lev:~w exp:~w loss_exp:~w",
						       [GName, Lev, Exp,
							LossExp]),
					 none, 4096, 64,
					 __Levelguild_handle1170,
					 __Tracesguild_handle1170, lager_event,
					 __Pidguild_handle1170);
			_ -> ok
		      end,
		      NewLev = Lev - 1,
		      #guild_data{exp = LevExp, num = NewMemMax} =
			  guild_data:get(NewLev),
		      Members2 = case MemNum > NewMemMax of
				   true ->
				       case {whereis(lager_event),
					     whereis(lager_event),
					     lager_config:get({lager_event,
							       loglevel},
							      {0, []})}
					   of
					 {undefined, undefined, _} ->
					     fun () ->
						     {error, lager_not_running}
					     end();
					 {undefined, _, _} ->
					     fun () ->
						     {error,
						      {sink_not_configured,
						       lager_event}}
					     end();
					 {__Pidguild_handle1176, _,
					  {__Levelguild_handle1176,
					   __Tracesguild_handle1176}}
					     when __Levelguild_handle1176 band
						    64
						    /= 0
						    orelse
						    __Tracesguild_handle1176 /=
						      [] ->
					     lager:do_log(info,
							  [{module,
							    guild_handle},
							   {function, maintain},
							   {line, 1176},
							   {pid,
							    pid_to_list(self())},
							   {node, node()}
							   | lager:md()],
							  io_lib:format("公会[~ts]人数调整:~w=>~w",
									[GName,
									 MemNum,
									 NewMemMax]),
							  none, 4096, 64,
							  __Levelguild_handle1176,
							  __Tracesguild_handle1176,
							  lager_event,
							  __Pidguild_handle1176);
					 _ -> ok
				       end,
				       Members1 = util:keys_sort([{asc,
								   #guild_member.login_time},
								  #guild_member.post],
								 Members),
				       kick_member_maintain(Members1,
							    MemNum - NewMemMax);
				   _ -> Members
				 end,
		      NewMembers = check_position_num(Members2, 2, NewLev),
		      NewG = G#guild{lev = NewLev,
				     exp = max(0, Exp + LevExp - LossExp),
				     members_max = NewMemMax,
				     members_num = length(NewMembers),
				     members = NewMembers},
		      guild_member:mems_apply(NewG, all,
					      {guild_member, set,
					       [{set_lev, Gid, NewLev}]}),
		      guild_member:pack_send(NewG, all, 13518, {NewG, -1}),
		      log_http:guild_sync(NewG),
		      {ok, NewG};
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
			{__Pidguild_handle1189, _,
			 {__Levelguild_handle1189, __Tracesguild_handle1189}}
			    when __Levelguild_handle1189 band 64 /= 0 orelse
				   __Tracesguild_handle1189 /= [] ->
			    lager:do_log(info,
					 [{module, guild_handle},
					  {function, maintain}, {line, 1189},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("公会[~ts]扣除维护经验:lev:~w exp:~w loss_exp:~w",
						       [GName, Lev, Exp,
							LossExp]),
					 none, 4096, 64,
					 __Levelguild_handle1189,
					 __Tracesguild_handle1189, lager_event,
					 __Pidguild_handle1189);
			_ -> ok
		      end,
		      NewG = G#guild{exp = max(0, Exp - LossExp)},
		      guild_member:pack_send(NewG, all, 13518, {NewG, -1}),
		      {ok, NewG}
		end
	  end;
      _ -> ok
    end.

reload_data(all) ->
    guild:apply(async, all,
		{guild_handle, reload_data, []});
reload_data(G = #guild{name = Name, lev = Lev,
		       members_max = MemMax, members_num = _MemNum}) ->
    #guild_data{num = NewMemMax} = guild_data:get(Lev),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_handle1203, _,
       {__Levelguild_handle1203, __Tracesguild_handle1203}}
	  when __Levelguild_handle1203 band 64 /= 0 orelse
		 __Tracesguild_handle1203 /= [] ->
	  lager:do_log(info,
		       [{module, guild_handle}, {function, reload_data},
			{line, 1203}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("data_reload ~ts公会等级~w mem_max=~w=>~w",
				     [Name, Lev, MemMax, NewMemMax]),
		       none, 4096, 64, __Levelguild_handle1203,
		       __Tracesguild_handle1203, lager_event,
		       __Pidguild_handle1203);
      _ -> ok
    end,
    NewG = G#guild{members_max = max(MemMax, NewMemMax)},
    guild_member:pack_send(NewG, all, 13518, {NewG, -1}),
    {ok, NewG}.

kick_member_maintain(Members, 0) -> Members;
kick_member_maintain([#guild_member{id = RoleId,
				    name = RName, pid = RolePid, post = 3}
		      | T],
		     N) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_handle1212, _,
       {__Levelguild_handle1212, __Tracesguild_handle1212}}
	  when __Levelguild_handle1212 band 64 /= 0 orelse
		 __Tracesguild_handle1212 /= [] ->
	  lager:do_log(info,
		       [{module, guild_handle},
			{function, kick_member_maintain}, {line, 1212},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("公会维护 玩家[~ts]被系统踢出公会", [RName]), none,
		       4096, 64, __Levelguild_handle1212,
		       __Tracesguild_handle1212, lager_event,
		       __Pidguild_handle1212);
      _ -> ok
    end,
    guild_member:del(RoleId),
    ets:insert(guild_member_quit, {RoleId, 0}),
    role:apply(async, RolePid,
	       {guild_member, set, [{quit, sys_kick}]}),
    kick_member_maintain(T, N - 1).

check_position_num(Members, Post, GLev) ->
    PostMembers = [M
		   || M <- Members, M#guild_member.post =:= Post],
    PostMax = guild_data:get_position_num({Post, GLev}),
    case PostMax > 0 andalso length(PostMembers) > PostMax
	of
      true ->
	  PostMembers1 = util:keys_sort([{asc,
					  #guild_member.login_time}],
					PostMembers),
	  PostMembers2 = lists:sublist(PostMembers1,
				       length(PostMembers) - PostMax),
	  set_position_to_normal(PostMembers2, Members);
      _ -> Members
    end.

set_position_to_normal([], Members) -> Members;
set_position_to_normal([M = #guild_member{id = RoleId}
			| T],
		       Members) ->
    set_position_to_normal(T,
			   lists:keyreplace(RoleId, #guild_member.id, Members,
					    M#guild_member{post = 3})).

-spec zero_update(#guild{}, tuple()) -> ok.

zero_update(Guild = #guild{members = Members}, _) ->
    NewMembers = [M1#guild_member{day_donate = 0,
				  day_donate_type = 0, day_donate_time = 0,
				  day_dun_time =
				      lists:max(guild_dun_data:get_buy_count())}
		  || M1 <- Members],
    NewGuild = Guild#guild{members = NewMembers,
			   recruit_num = 0, red_packet = [], day_exp = 0,
			   donate_exp = 0, day_var = []},
    guild_member:pack_send(NewGuild, all, 13518,
			   {NewGuild, -1}),
    guild_member:pack_send(NewGuild, all, 13546, {[]}),
    {ok, NewGuild}.

-spec five_update(#guild{}) -> ok.

five_update(Guild = #guild{}) ->
    guild_member:pack_send(Guild, all, 13518, {Guild, -1}),
    {ok, Guild}.

check_create_cond(#role{lev = Lev,
			m_vip = #m_vip{lev = VipLev},
			guild_bag =
			    #guild_bag{true_quit_time = TrueQuitTime,
				       quit_post = QuitPost}},
		  Gname, Sign) ->
    NeedVip = guild_data:get_const(maintain_vip_condition),
    Now = date:unixtime(),
    LimitTime = util:if_true(QuitPost =:= 1,
			     3600 *
			       guild_data:get_const(guild_leader_create_guild_cd),
			     3600 *
			       guild_data:get_const(guild_mem_create_guild_cd))
		  + TrueQuitTime,
    case Now > LimitTime of
      true ->
	  case Lev >= guild_data:get_const(guild_min_lev) of
	    true when VipLev < NeedVip ->
		{false,
		 lang:get(<<"Cần VIP2 trở lên để có thể tạo gia tộc"/utf8>>)};
	    true ->
		NLen = string_util:string_width(Gname),
		case keyword:check(name, Gname) of
		  false -> {false, lang:get(<<"Tên không hợp lệ"/utf8>>)};
		  _ when NLen =< 2 orelse NLen > 12 ->
		      {false, lang:get(<<"Độ dài tên không đúng"/utf8>>)};
		  true ->
		      case keyword:check(base, Sign) of
			false ->
			    {false,
			     lang:get(<<"Nội dung tuyên ngôn không hợp lệ"/utf8>>)};
			true -> true
		      end
		end;
	    false -> {false, lang:get(<<"Cấp độ không đủ"/utf8>>)}
	  end;
      _ when QuitPost =:= 1 ->
	  {false,
	   util:fbin(lang:get(<<"gia tộc chưa đủ thời gian giải tán ~w "
				"giờ, ~ts sau mới có thể tạo lại gia "
				"tộc"/utf8>>),
		     [guild_data:get_const(guild_leader_create_guild_cd),
		      format:sec(LimitTime - Now)])};
      _ ->
	  {false,
	   util:fbin(lang:get(<<"Chưa đủ ~w giờ để rời gia tộc, ~ts sau "
				"mới có thể tạo lại gia tộc"/utf8>>),
		     [guild_data:get_const(guild_mem_create_guild_cd),
		      format:sec(LimitTime - Now)])}
    end.

-spec send_mail(#role{}, bitstring()) -> {false,
					  bitstring()} |
					 {ok, #role{}}.

send_mail(_Role, Content)
    when byte_size(Content) > 300 ->
    {false, lang:get(<<"Nội dung quá dài"/utf8>>)};
send_mail(Role = #role{guild_bag =
			   #guild_bag{id = GuildId, pid = GPid}},
	  Content)
    when is_pid(GPid) ->
    case guild_member:check_post(Role, set_sign) of
      {false, Reason} -> {false, Reason};
      true ->
	  Num = var:get_var(Role, day, 85, 0),
	  case Num >= 3 of
	    true ->
		{false,
		 lang:get(<<"Đã đạt giới hạn gửi trong ngày"/utf8>>)};
	    _ ->
		case keyword:check(base, Content) of
		  true ->
		      case guild_lib:elem(GuildId, #guild.members) of
			{ok, Members} ->
			    case length(Members) of
			      1 ->
				  {false,
				   lang:get(<<"Tạm thời không thể gửi email"/utf8>>)};
			      _ ->
				  MembersId = [MId
					       || #guild_member{id = MId}
						      <- Members,
						  MId =/= Role#role.id],
				  mail:send(MembersId,
					    {lang:get(<<"gia tộc email"/utf8>>),
					     Content, [], [],
					     <<"会长公会邮件"/utf8>>}),
				  NRole = var:set_var(Role, day, 85, Num + 1),
				  {ok, NRole}
			    end;
			_ ->
			    {false,
			     lang:get(<<"Tạm thời không thể gửi email"/utf8>>)}
		      end;
		  _ -> {false, lang:get(<<"Nội dung vi phạm"/utf8>>)}
		end
	  end
    end;
send_mail(_Role, _Content) ->
    {false, lang:get(<<"Bạn không có gia tộc"/utf8>>)}.

gm_set_leader_time(Guild = #guild{leader_id = LeaderId,
				  members = Members}) ->
    case lists:keyfind(LeaderId, #guild_member.id, Members)
	of
      M = #guild_member{} ->
	  NewM = M#guild_member{login_time =
				    date:unixtime() - 86400 * 5},
	  NewMembers = lists:keyreplace(LeaderId,
					#guild_member.id, Members, NewM),
	  NewGuild = Guild#guild{members = NewMembers},
	  guild_member:pack_send(NewGuild, all, 13518,
				 {NewGuild, -1}),
	  {sync, NewGuild};
      _ -> ok
    end.


