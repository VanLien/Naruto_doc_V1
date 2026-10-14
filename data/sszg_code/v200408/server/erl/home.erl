-file("src/mod/home/home.erl", 1).

-module(home).

-lager_records([{room_rank_info,
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
		{cluster_dynamic_local_group, [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
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
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
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
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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

-export([gm_set_hook_time/2, login/1, zero_flush/1,
	 apply_hook_timer/1, take_hook_items/1,
	 push_change_worship/1, push_change_data/1,
	 push_red_point/1, init/0, check_open/1, enter/2,
	 visit/3, push_info/1, first_choose/2, put_furniture/5,
	 calc_soft/1, activate_look/2, use_look/2, rand_list/1,
	 get_log/1, rename/2, fire/2, push_set_list/1,
	 take_set_reward/2, get_ranks/1, get_rank_list/3,
	 set_main_floor/2, item_activate_look/2]).

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

-file("src/mod/home/home.erl", 38).

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

-file("src/mod/home/home.erl", 39).

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

-file("src/mod/home/home.erl", 40).

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

-file("src/mod/home/home.erl", 41).

-file("inc/log.hrl", 1).

-file("src/mod/home/home.erl", 42).

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

-file("src/mod/home/home.erl", 43).

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

-file("src/mod/home/home.erl", 44).

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

-file("src/mod/home/home.erl", 45).

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

-file("src/mod/home/home.erl", 46).

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

-file("src/mod/home/home.erl", 47).

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

-file("src/mod/home/home.erl", 48).

gm_set_hook_time(Role = #role{m_home = MHome}, Hour) ->
    LastHookTime = date:unixtime() - 3600 * Hour,
    NRole = Role#role{m_home =
			  MHome#m_home{last_hook_time = LastHookTime}},
    online(NRole).

init() -> #m_home{}.

-spec login(#role{}) -> ok.

login(Role) ->
    case check_open(Role) of
      true ->
	  {ok, RandVisit} = role_convert:do(home_rand_visit,
					    Role),
	  home_mgr:sync_rand_visit(RandVisit),
	  online(Role);
      _ -> ok
    end.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_home = MHome}) ->
    NRole = Role#role{m_home =
			  MHome#m_home{worship = 0, worship_list = [],
				       day_visitors = []}},
    {ok, NRole}.

online(Role = #role{m_home =
			MHome = #m_home{last_hook_time = LastHookTime,
					acc_hook_time = AccHookTime,
					acc_hook_items = AccHookItems}}) ->
    case check_open(Role) of
      true ->
	  Now = date:unixtime(),
	  MaxLimit = home_data:get_const(homecoin_hoarding_limit),
	  NTime = min(min(Now - LastHookTime, 3600 * MaxLimit),
		      3600 * MaxLimit - AccHookTime),
	  BaseNum = util:floor(NTime / 3600),
	  case BaseNum > 0 of
	    true ->
		NewAccHookTime = AccHookTime + BaseNum * 3600,
		{_, MaxFloorSoft} = calc_max_soft_floor(Role),
		LimitMaxSoft = min(MaxFloorSoft,
				   home_data:get_const(comfort_limit)),
		AddItems = [{31,
			     home_data:make_home_coin(LimitMaxSoft) * BaseNum}],
		NewAccHookItems = item_lib:merge(AddItems,
						 AccHookItems),
		NewLastHookTime = LastHookTime + 3600 * BaseNum,
		NRole = Role#role{m_home =
				      MHome#m_home{last_hook_time =
						       NewLastHookTime,
						   acc_hook_time =
						       NewAccHookTime,
						   acc_hook_items =
						       NewAccHookItems}},
		{ok, set_hook_timer(NRole)};
	    _ -> {ok, set_hook_timer(Role)}
	  end;
      _ -> {ok, Role}
    end.

-spec push_change_worship(#role{}) -> ok.

push_change_worship(#role{id = RoleId}) ->
    NewWorship = var:get_role_var(RoleId, other, 11, 0),
    sys_conn:pack_send(26012, {NewWorship}),
    ok.

push_change_data(#role{m_home =
			   #m_home{acc_hook_time = AccHookTime,
				   worship = WorshipNum,
				   max_soft = MaxSoft}}) ->
    RestWorship = max(0,
		      home_data:get_const(day_praise_limit) - WorshipNum),
    sys_conn:pack_send(26015,
		       {RestWorship, AccHookTime, MaxSoft}),
    ok.

-spec push_red_point(#role{}) -> ok.

push_red_point(#role{id = RoleId,
		     m_home = #m_home{acc_hook_time = AccHookTime}}) ->
    N = var:get_role_var(RoleId, other, 12, 0),
    Flag = util:if_true(N > 0, 1, 0),
    HookFlag = util:if_true(AccHookTime >=
			      3600 *
				home_data:get_const(coin_redpoint_time_condition),
			    1, 0),
    sys_conn:pack_send(26018, {Flag, HookFlag}),
    ok.

-spec set_hook_timer(#role{}) -> #role{}.

set_hook_timer(Role = #role{m_home =
				#m_home{acc_hook_time = AccHookTime,
					last_hook_time = LastHookTime}}) ->
    case AccHookTime >=
	   3600 * home_data:get_const(homecoin_hoarding_limit)
	of
      true -> Role;
      _ ->
	  Now = date:unixtime(),
	  RestTime = max(1, 3600 - (Now - LastHookTime)),
	  role_timer:set(#timer{id = home_hook_timer,
				timeout = RestTime * 1000, times = 1, m = home,
				f = apply_hook_timer},
			 Role)
    end.

-spec apply_hook_timer(#role{}) -> {ok, #role{}}.

apply_hook_timer(Role = #role{m_home =
				  MHome = #m_home{acc_hook_time = AccHookTime,
						  acc_hook_items =
						      AccHookItems}}) ->
    case min(AccHookTime + 3600,
	     3600 * home_data:get_const(homecoin_hoarding_limit))
	of
      AccHookTime -> {ok, Role};
      NewAccHookTime ->
	  {_, MaxFloorSoft} = calc_max_soft_floor(Role),
	  LimitMaxSoft = min(MaxFloorSoft,
			     home_data:get_const(comfort_limit)),
	  AddItems = [{31,
		       home_data:make_home_coin(LimitMaxSoft)}],
	  NewItems = item_lib:merge(AddItems, AccHookItems),
	  NRole = Role#role{m_home =
				MHome#m_home{last_hook_time = date:unixtime(),
					     acc_hook_time = NewAccHookTime,
					     acc_hook_items = NewItems}},
	  push_change_data(NRole),
	  {ok, set_hook_timer(NRole)}
    end.

-spec take_hook_items(#role{}) -> {false, binary()} |
				  {ok, #role{}}.

take_hook_items(#role{m_home =
			  #m_home{acc_hook_items = []}}) ->
    {false, lang:get(<<"需要累计一定收益才能领取"/utf8>>)};
take_hook_items(Role = #role{m_home =
				 MHome = #m_home{soft = Soft,
						 acc_hook_time = AccHookTime,
						 acc_hook_items = AccHookItems,
						 last_hook_time =
						     LastHookTime}}) ->
    GL = format:val_to_gain(AccHookItems, home_hook),
    case role_gain:do_notice(Role, GL) of
      {false, #gain{msg = Msg}} -> {false, Msg};
      {ok, Role1} ->
	  log:log_gain(GL, Role, Role1, <<"家园玩法"/utf8>>,
		       util:fbin("家园币挂机~w秒，舒适度~w", [AccHookTime, Soft])),
	  NewLastHookTime = util:if_true(AccHookTime >=
					   3600 *
					     home_data:get_const(homecoin_hoarding_limit),
					 date:unixtime(), LastHookTime),
	  Role2 = Role1#role{m_home =
				 MHome#m_home{acc_hook_items = [],
					      acc_hook_time = 0,
					      last_hook_time =
						  NewLastHookTime}},
	  Role3 = role_trigger:fire(#evt_gain_home_coin{}, Role2),
	  NRole = set_hook_timer(Role3),
	  push_change_data(NRole),
	  {ok, NRole}
    end.

-spec check_open(#role{}) -> boolean().

check_open(#role{lev = Lev,
		 m_home = #m_home{look_id = LookId, list = ItemList}}) ->
    case LookId =/= 0 andalso
	   ItemList =/= [] andalso
	     Lev >= home_data:get_const(open_lev)
	of
      true -> true;
      _ -> false
    end.

-spec enter(#role{}, pos_integer()) -> {false,
					bitstring()} |
				       {ok, tuple(), #role{}} | {ok, tuple()}.

enter(Role = #role{id = RoleId, name = Name,
		   m_home =
		       MHome = #m_home{acc_hook_time = AccHookTime,
				       look_id = LookId, list = ItemList,
				       worship = WorshipNum,
				       open_floor = ROpenFloor,
				       max_sum_soft = MaxSumSoft,
				       floor_list = RFloorList}},
      Floor) ->
    Cond = [{lev, home_data:get_const(open_lev)},
	    {finish_room_feat,
	     home_data:get_const(open_experience_condition)}],
    case LookId =:= 0 of
      true -> {false, lang:get(<<"未选择形象"/utf8>>)};
      _ ->
	  case role_misc:check_open_cond(Cond, Role) of
	    true ->
		Now = date:unixtime(),
		case home_lib:lookup(RoleId) of
		  {ok,
		   Home = #home{name = HomeName, soft = Soft,
				wall_bid = WallBid, land_bid = LandBid,
				home_unit = HomeUnit, main_floor = MainFloor,
				floor_list = FloorList,
				open_floor = OpenFloor}} ->
		      NowFloor = util:if_true(Floor =< 0, MainFloor, Floor),
		      Visitors = home_lib:get_visit(RoleId),
		      CliL = [{RidT, SrvIdT, NameT, LookIdT}
			      || #home_visitor{id = {RidT, SrvIdT},
					       name = NameT, time = Time,
					       look_id = LookIdT}
				     <- Visitors,
				 Time +
				   3600 * home_data:get_const(visitor_show_time)
				   > Now],
		      Worship = var:get_role_var(RoleId, other, 11, 0),
		      RestWorship = max(0,
					home_data:get_const(day_praise_limit) -
					  WorshipNum),
		      case NowFloor == 1 of
			true ->
			    {MaxSoftFloor, MaxFloorSoft} =
				calc_max_soft_floor(Role),
			    OtherBid = calc_other_bid(Role, NowFloor),
			    CliData = {HomeName, LookId, Worship, RestWorship,
				       Soft, WallBid, LandBid, HomeUnit, CliL,
				       AccHookTime, NowFloor, MainFloor,
				       MaxSoftFloor, MaxSumSoft, OtherBid,
				       MaxFloorSoft},
			    NRole = role_trigger:fire(#evt_enter_home{}, Role),
			    {ok, NRole, CliData};
			_ ->
			    case lists:keyfind(NowFloor, #home_floor.floor,
					       FloorList)
				of
			      #home_floor{wall_bid = WallBid2,
					  land_bid = LandBid2,
					  home_unit = HomeUnit2,
					  soft = Soft2} ->
				  {MaxSoftFloor, MaxFloorSoft} =
				      calc_max_soft_floor(Role),
				  OtherBid = calc_other_bid(Role, NowFloor),
				  CliData = {HomeName, LookId, Worship,
					     RestWorship, Soft2, WallBid2,
					     LandBid2, HomeUnit2, CliL,
					     AccHookTime, NowFloor, MainFloor,
					     MaxSoftFloor, MaxSumSoft, OtherBid,
					     MaxFloorSoft},
				  NRole = role_trigger:fire(#evt_enter_home{},
							    Role),
				  {ok, NRole, CliData};
			      false ->
				  Cond2 = home_data:open_floor(NowFloor),
				  case role_misc:check_open_cond(Cond2, Role) of
				    true ->
					DefaultSoft = home:calc_soft([200151,
								      200152]),
					HomeFloor = #home_floor{floor =
								    NowFloor,
								wall_bid =
								    200152,
								land_bid =
								    200151,
								soft =
								    DefaultSoft},
					NewFloorList = lists:keystore(NowFloor,
								      #home_floor.floor,
								      FloorList,
								      HomeFloor),
					NewHome = Home#home{floor_list =
								NewFloorList,
							    open_floor =
								[NowFloor
								 | OpenFloor]},
					home_mgr:update_ets(NewHome, all),
					NewRFloorList = [{NowFloor, DefaultSoft,
							  [{200151, 1},
							   {200152, 1}]}
							 | RFloorList],
					Role1 = Role#role{m_home =
							      MHome#m_home{open_floor
									       =
									       [NowFloor
										| ROpenFloor],
									   floor_list
									       =
									       NewRFloorList,
									   max_sum_soft
									       =
									       MaxSumSoft
										 +
										 DefaultSoft}},
					NRole =
					    role_trigger:fire(#evt_enter_home{},
							      Role1),
					{MaxSoftFloor, MaxFloorSoft} =
					    calc_max_soft_floor(NRole),
					OtherBid = calc_other_bid(NRole,
								  NowFloor),
					CliData = {HomeName, LookId, Worship,
						   RestWorship, DefaultSoft,
						   200152, 200151, [], CliL,
						   AccHookTime, NowFloor,
						   MainFloor, MaxSoftFloor,
						   MaxSumSoft + DefaultSoft,
						   OtherBid, MaxFloorSoft},
					{ok, NRole, CliData};
				    {false, Msg} -> {false, Msg}
				  end
			    end
		      end;
		  false ->
		      case ItemList of
			[_ | _] ->
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
			      {__Pidhome235, _,
			       {__Levelhome235, __Traceshome235}}
				  when __Levelhome235 band 8 /= 0 orelse
					 __Traceshome235 /= [] ->
				  lager:do_log(error,
					       [{module, home},
						{function, enter}, {line, 235},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("~ts玩家居然在布置家园后还要进行初始化操作~w",
							     [Name, ItemList]),
					       none, 4096, 8, __Levelhome235,
					       __Traceshome235, lager_event,
					       __Pidhome235);
			      _ -> ok
			    end,
			    {false, lang:get(<<"家园处于异常状况"/utf8>>)};
			_ ->
			    Gain = format:val_to_gain([{31,
							home_data:get_const(initial_homecoin_reward)}],
						      init_home),
			    case role_gain:do(Role, Gain) of
			      {ok, NRole} ->
				  log:log_gain(Gain, Role, NRole,
					       <<"家园玩法"/utf8>>,
					       <<"初始化家园奖励"/utf8>>),
				  DefaultSoft = home:calc_soft([200151,
								200152]),
				  HomeName = <<Name/binary, "的家园"/utf8>>,
				  Home = #home{id = RoleId, bid = Name,
					       name = HomeName,
					       look_id = LookId,
					       wall_bid = 200152,
					       land_bid = 200151,
					       soft = DefaultSoft,
					       open_floor = [1],
					       main_floor = 1},
				  home_mgr:update_ets(Home, ets),
				  Role1 = NRole#role{m_home =
							 MHome#m_home{last_hook_time
									  = Now,
								      soft =
									  DefaultSoft,
								      max_soft =
									  DefaultSoft,
								      max_sum_soft
									  =
									  DefaultSoft,
								      list =
									  [{200151,
									    1},
									   {200152,
									    1}],
								      open_floor
									  = [1],
								      main_floor
									  = 1}},
				  CliData = {HomeName, LookId, 0,
					     home_data:get_const(day_praise_limit),
					     DefaultSoft, 200152, 200151, [],
					     [], 0, 1, 1, 1, DefaultSoft, [],
					     DefaultSoft},
				  Role2 =
				      role_trigger:fire([#evt_first_enter_home{},
							 #evt_enter_home{},
							 #evt_home_soft{soft =
									    DefaultSoft}],
							Role1),
				  Role3 = set_hook_timer(Role2),
				  Role4 = fire(Role3,
					       #evt_get_item{base_id = 200151}),
				  NewRole = fire(Role4,
						 #evt_get_item{base_id =
								   200152}),
				  {ok, RandVisit} =
				      role_convert:do(home_rand_visit, NewRole),
				  home_mgr:sync_rand_visit(RandVisit),
				  friend:save_info(NewRole),
				  role_robot:sync_role(NewRole),
				  sys_conn:pack_send(26017, {1}),
				  {ok, NewRole, CliData};
			      _ -> {false, lang:get(<<"初始化家园失败"/utf8>>)}
			    end
		      end
		end;
	    {false, Msg} -> {false, Msg};
	    _ -> {false, lang:get(<<"未满足开放条件"/utf8>>)}
	  end
    end.

-spec visit(#role{}, role_id(),
	    pos_integer()) -> {false, bitstring()} |
			      {ok, #role{}, tuple()}.

visit(#role{id = RoleId}, RoleId, _) ->
    {false, lang:get(<<"这是你自己的家园啦"/utf8>>)};
visit(Role = #role{id = RoleId = {Rid, SrvId},
		   name = RoleName, face_id = Face, lev = Lev,
		   m_home =
		       MHome = #m_home{soft = MySoft, look_id = LookId,
				       last_visitors = LastVisitors,
				       day_visitors = DayVisitors}},
      TarRoleId = {TarRid, TarSrvId}, Floor0) ->
    case check_open(Role) of
      true ->
	  case home_lib:cluster_lookup(TarRoleId) of
	    {ok,
	     #home{name = HomeName, look_id = TarLookId,
		   soft = Soft0, wall_bid = WallBid0, land_bid = LandBid0,
		   home_unit = HomeUnit0, bid = TarName,
		   floor_list = FloorList, main_floor = MainFloor,
		   open_floor = OpenFloor}} ->
		Floor = util:if_true(Floor0 =< 0, MainFloor, Floor0),
		case lists:member(Floor, OpenFloor) of
		  true ->
		      Visitors = home_lib:cluster_get_visit(TarRoleId),
		      Now = date:unixtime(),
		      HomeVisitor = #home_visitor{id = RoleId,
						  name = RoleName,
						  look_id = LookId, time = Now},
		      IsFriend = util:if_true(friend_lib:is_friend(Role,
								   TarRoleId),
					      1, 0),
		      {_, FaceFile, FaceUpdateTime} =
			  role_face:face_info(Role),
		      cluster_lib:cast(element(2, TarRoleId), home_mgr, info,
				       [{visit, TarRoleId, IsFriend, Face,
					 FaceFile, FaceUpdateTime, Lev,
					 HomeVisitor, MySoft}]),
		      CliL0 = [{RidT, SrvIdT, NameT, LookIdT}
			       || #home_visitor{id = RoleIdT = {RidT, SrvIdT},
						name = NameT, time = Time,
						look_id = LookIdT}
				      <- Visitors,
				  RoleIdT =/= RoleId,
				  Time +
				    3600 *
				      home_data:get_const(visitor_show_time)
				    > Now],
		      CliL = lists:sublist([{Rid, SrvId, RoleName, LookId}
					    | CliL0],
					   home_data:get_const(visitors_num_limit)),
		      Worship = var:get_role_var_cluster(TarRoleId, other, 11,
							 0),
		      WorshipStatus = role_misc:worship_status(Role,
							       TarRoleId, 5),
		      {WallBid, LandBid, HomeUnit, Soft} = case Floor == 1 of
							     true ->
								 {WallBid0,
								  LandBid0,
								  HomeUnit0,
								  Soft0};
							     _ ->
								 case
								   lists:keyfind(Floor,
										 #home_floor.floor,
										 FloorList)
								     of
								   #home_floor{wall_bid
										   =
										   WallBid2,
									       land_bid
										   =
										   LandBid2,
									       home_unit
										   =
										   HomeUnit2,
									       soft
										   =
										   Soft2} ->
								       {WallBid2,
									LandBid2,
									HomeUnit2,
									Soft2};
								   _ ->
								       case
									 {whereis(lager_event),
									  whereis(lager_event),
									  lager_config:get({lager_event,
											    loglevel},
											   {0,
											    []})}
									   of
									 {undefined,
									  undefined,
									  _} ->
									     fun
									       () ->
										   {error,
										    lager_not_running}
									     end();
									 {undefined,
									  _,
									  _} ->
									     fun
									       () ->
										   {error,
										    {sink_not_configured,
										     lager_event}}
									     end();
									 {__Pidhome300,
									  _,
									  {__Levelhome300,
									   __Traceshome300}}
									     when
									       __Levelhome300
										 band
										 8
										 /=
										 0
										 orelse
										 __Traceshome300
										   /=
										   [] ->
									     lager:do_log(error,
											  [{module,
											    home},
											   {function,
											    visit},
											   {line,
											    300},
											   {pid,
											    pid_to_list(self())},
											   {node,
											    node()}
											   | lager:md()],
											  io_lib:format("别人访问~w的~w层房间，居然找不到",
													[TarRoleId,
													 Floor]),
											  none,
											  4096,
											  8,
											  __Levelhome300,
											  __Traceshome300,
											  lager_event,
											  __Pidhome300);
									 _ -> ok
								       end,
								       DefaultSoft =
									   home:calc_soft([200151,
											   200152]),
								       {200152,
									200151,
									[],
									DefaultSoft}
								 end
							   end,
		      CliData = {1, <<>>, TarRid, TarSrvId, HomeName,
				 TarLookId, Worship, WorshipStatus, Soft,
				 WallBid, LandBid, HomeUnit, CliL, TarName,
				 Floor},
		      NewLastVisitors = case LastVisitors of
					  [_ | _] ->
					      case lists:member(TarRoleId,
								LastVisitors)
						  of
						true -> LastVisitors;
						_ ->
						    {NewLV, DelLV} =
							list_util:split(home_data:get_const(figure_existence_at_once_limit),
									[TarRoleId
									 | LastVisitors]),
						    [cluster_lib:cast(DelSrvId,
								      home_mgr,
								      info,
								      [{del_visit,
									DelTarId,
									RoleId}])
						     || DelTarId = {_, DelSrvId}
							    <- DelLV],
						    NewLV
					      end;
					  _ -> [TarRoleId]
					end,
		      NewDayVisitors = case lists:member(TarRoleId,
							 DayVisitors)
					   of
					 false ->
					     cluster_lib:cast(TarSrvId,
							      home_mgr, info,
							      [{update_rank,
								TarRoleId,
								visit}]),
					     [TarRoleId | DayVisitors];
					 _ -> DayVisitors
				       end,
		      Role1 = Role#role{m_home =
					    MHome#m_home{last_visitors =
							     NewLastVisitors,
							 day_visitors =
							     NewDayVisitors}},
		      NRole = role_trigger:fire(#evt_visit_home{}, Role1),
		      {ok, NRole, CliData};
		  _ -> {false, lang:get(<<"第二层暂未开启"/utf8>>)}
		end;
	    {false, Msg} -> {false, Msg}
	  end;
      _ -> {false, lang:get(<<"未满足开放条件"/utf8>>)}
    end.

-spec put_furniture(#role{}, pos_integer(),
		    pos_integer(), list(), pos_integer()) -> {ok, #role{},
							      pos_integer(),
							      pos_integer(),
							      pos_integer(),
							      list()} |
							     {false,
							      bitstring()}.

put_furniture(Role = #role{id = RoleId, name = RoleName,
			   m_home =
			       MHome = #m_home{list = NowList,
					       max_soft = MaxSoft,
					       max_sum_soft = MaxSumSoft,
					       floor_list = FloorList}},
	      WallBid, LandBid, List, 1) ->
    case check_furniture(WallBid, LandBid, List) of
      {false, Msg} -> {false, Msg};
      true ->
	  LossItems0 = [{Bid, 1} || {Bid, _, _} <- List],
	  LossItems = [{WallBid, 1}, {LandBid, 1} | LossItems0],
	  NewGainList0 = NowList -- LossItems,
	  NewLossItems0 = LossItems -- NowList,
	  NewGainList = item_lib:merge(NewGainList0, []),
	  NewLossItems = item_lib:merge(NewLossItems0, []),
	  Gain = format:val_to_gain(NewGainList, change),
	  Loss = format:val_to_loss(NewLossItems, change),
	  GL = Gain ++ Loss,
	  case role_gain:do(Role, GL) of
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, Role1} ->
		AllBidList0 = [Bid || {Bid, _, _} <- List],
		AllBidList = [WallBid, LandBid | AllBidList0],
		NewSoft = calc_soft(AllBidList),
		case home_mgr:check_put_furniture(RoleId, RoleName,
						  WallBid, LandBid, NewSoft,
						  List, 1)
		    of
		  ok ->
		      log:log_gain(GL, Role, Role1, <<"家园玩法"/utf8>>,
				   util:fbin("摆放家具~w ~w ~w ~w",
					     [WallBid, LandBid, List,
					      NewSoft])),
		      log:save(soft, {Role, util:fbin("舒适度:~w", [NewSoft])}),
		      NewMaxSoft = util:if_true(NewSoft > MaxSoft, NewSoft,
						MaxSoft),
		      NewSumSoft = NewSoft +
				     lists:sum([SoftT
						|| {_, SoftT, _} <- FloorList]),
		      NewMaxSumSoft = util:if_true(NewSumSoft > MaxSumSoft,
						   NewSumSoft, MaxSumSoft),
		      Role2 = Role1#role{m_home =
					     MHome#m_home{list = LossItems,
							  soft = NewSoft,
							  max_soft = NewMaxSoft,
							  max_sum_soft =
							      NewMaxSumSoft}},
		      NRole = role_trigger:fire(#evt_home_soft{soft =
								   NewSoft},
						Role2),
		      push_change_data(NRole),
		      {MaxSoftFloor, MaxFloorSoft} =
			  calc_max_soft_floor(NRole),
		      OtherBid = calc_other_bid(NRole, 1),
		      {ok, NRole, NewSoft, MaxSoftFloor, NewMaxSumSoft,
		       OtherBid, MaxFloorSoft};
		  {false, Msg} -> {false, Msg};
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
			{__Pidhome379, _, {__Levelhome379, __Traceshome379}}
			    when __Levelhome379 band 8 /= 0 orelse
				   __Traceshome379 /= [] ->
			    lager:do_log(error,
					 [{module, home},
					  {function, put_furniture},
					  {line, 379},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~ts无法保存家园~w",
						       [Role#role.name, _ERR]),
					 none, 4096, 8, __Levelhome379,
					 __Traceshome379, lager_event,
					 __Pidhome379);
			_ -> ok
		      end,
		      {false, lang:get(<<"暂时无法保存"/utf8>>)}
		end
	  end
    end;
put_furniture(Role = #role{id = RoleId, name = RoleName,
			   m_home =
			       MHome = #m_home{max_soft = MaxSoft, soft = Soft,
					       open_floor = OpenFloor,
					       max_sum_soft = MaxSumSoft,
					       floor_list = FloorList}},
	      WallBid, LandBid, List, Floor) ->
    case lists:member(Floor, OpenFloor) of
      true ->
	  case check_furniture(WallBid, LandBid, List) of
	    {false, Msg} -> {false, Msg};
	    true ->
		case lists:keyfind(Floor, 1, FloorList) of
		  {_, _, NowList} ->
		      LossItems0 = [{Bid, 1} || {Bid, _, _} <- List],
		      LossItems = [{WallBid, 1}, {LandBid, 1} | LossItems0],
		      NewGainList0 = NowList -- LossItems,
		      NewLossItems0 = LossItems -- NowList,
		      NewGainList = item_lib:merge(NewGainList0, []),
		      NewLossItems = item_lib:merge(NewLossItems0, []),
		      Gain = format:val_to_gain(NewGainList, change),
		      Loss = format:val_to_loss(NewLossItems, change),
		      GL = Gain ++ Loss,
		      case role_gain:do(Role, GL) of
			{false, #loss{msg = Msg}} -> {false, Msg};
			{false, #gain{msg = Msg}} -> {false, Msg};
			{ok, Role1} ->
			    AllBidList0 = [Bid || {Bid, _, _} <- List],
			    AllBidList = [WallBid, LandBid | AllBidList0],
			    NewSoft = calc_soft(AllBidList),
			    case home_mgr:check_put_furniture(RoleId, RoleName,
							      WallBid, LandBid,
							      NewSoft, List,
							      Floor)
				of
			      ok ->
				  log:log_gain(GL, Role, Role1, <<"家园玩法"/utf8>>,
					       util:fbin("摆放~w层家具~w ~w ~w ~w",
							 [Floor, WallBid,
							  LandBid, List,
							  NewSoft])),
				  log:save(soft,
					   {Role,
					    util:fbin("舒适度:~w", [NewSoft])}),
				  NewMaxSoft = util:if_true(NewSoft > MaxSoft,
							    NewSoft, MaxSoft),
				  NewFloorList = lists:keystore(Floor, 1,
								FloorList,
								{Floor, NewSoft,
								 LossItems}),
				  NewSumSoft = Soft +
						 lists:sum([SoftT
							    || {_, SoftT, _}
								   <- NewFloorList]),
				  NewMaxSumSoft = util:if_true(NewSumSoft >
								 MaxSumSoft,
							       NewSumSoft,
							       MaxSumSoft),
				  Role2 = Role1#role{m_home =
							 MHome#m_home{max_soft =
									  NewMaxSoft,
								      floor_list
									  =
									  NewFloorList,
								      max_sum_soft
									  =
									  NewMaxSumSoft}},
				  NRole = role_trigger:fire(#evt_home_soft{soft
									       =
									       NewSoft},
							    Role2),
				  push_change_data(NRole),
				  {MaxSoftFloor, MaxFloorSoft} =
				      calc_max_soft_floor(NRole),
				  OtherBid = calc_other_bid(NRole, Floor),
				  {ok, NRole, NewSoft, MaxSoftFloor,
				   NewMaxSumSoft, OtherBid, MaxFloorSoft};
			      {false, Msg} -> {false, Msg};
			      _ERR ->
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
				    {__Pidhome428, _,
				     {__Levelhome428, __Traceshome428}}
					when __Levelhome428 band 8 /= 0 orelse
					       __Traceshome428 /= [] ->
					lager:do_log(error,
						     [{module, home},
						      {function, put_furniture},
						      {line, 428},
						      {pid,
						       pid_to_list(self())},
						      {node, node()}
						      | lager:md()],
						     io_lib:format("~ts无法保存家园~w",
								   [Role#role.name,
								    _ERR]),
						     none, 4096, 8,
						     __Levelhome428,
						     __Traceshome428,
						     lager_event, __Pidhome428);
				    _ -> ok
				  end,
				  {false, lang:get(<<"暂时无法保存"/utf8>>)}
			    end
		      end;
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
			{__Pidhome433, _, {__Levelhome433, __Traceshome433}}
			    when __Levelhome433 band 8 /= 0 orelse
				   __Traceshome433 /= [] ->
			    lager:do_log(error,
					 [{module, home},
					  {function, put_furniture},
					  {line, 433},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~ts居然无法保存~w层家园~w",
						       [Role#role.name, Floor,
							_ERR]),
					 none, 4096, 8, __Levelhome433,
					 __Traceshome433, lager_event,
					 __Pidhome433);
			_ -> ok
		      end,
		      {false, lang:get(<<"暂时无法保存"/utf8>>)}
		end
	  end;
      _ -> {false, lang:get(<<"该层尚未开放"/utf8>>)}
    end.

check_furniture(WallBid, LandBid, List) ->
    WallType = home_data:get_type(WallBid),
    LandType = home_data:get_type(LandBid),
    if WallType =/= 4 ->
	   {false, lang:get(<<"没有布置墙壁呢"/utf8>>)};
       LandType =/= 3 -> {false, lang:get(<<"没有布置地板呢"/utf8>>)};
       true ->
	   case lists:all(fun ({Bid, _, _}) ->
				  home_data:get_type(Bid) =/= undefined
			  end,
			  List)
	       of
	     true -> true;
	     _ -> {false, lang:get(<<"存在不是家具的道具"/utf8>>)}
	   end
    end.

calc_soft(BidList) ->
    CountBidList = list_util:calc_element_count(BidList),
    Fun = fun ({BidT, CountT}, Acc) ->
		  MaxCountT = home_data:get_effect_count(BidT),
		  NewCountT = util:if_true(CountT > MaxCountT, MaxCountT,
					   CountT),
		  [{BidT, NewCountT} | Acc]
	  end,
    EffectBidList = lists:foldl(Fun, [], CountBidList),
    Soft1 = lists:sum([home_data:get_soft(Bid) * CountT
		       || {Bid, CountT} <- EffectBidList]),
    FilterBidList = list_util:filter_replicat(BidList),
    SetIdList = [home_data:get_set_id(Bid)
		 || Bid <- FilterBidList],
    SetCountList = list_util:calc_element_count(SetIdList),
    Soft2 = lists:sum([home_data:get_set_soft({SetId, Num})
		       || {SetId, Num} <- SetCountList]),
    Soft1 + Soft2.

-spec push_info(#role{}) -> ok.

push_info(#role{m_home =
		    #m_home{look_id = LookId, max_soft = MaxSoft,
			    look_list = LookList},
		m_room_feat = #m_room_feat{finish = Finish}}) ->
    IsFinish =
	util:if_true(lists:keymember(home_data:get_const(open_experience_condition),
				     1, Finish),
		     1, 0),
    sys_conn:pack_send(26004,
		       {LookId, MaxSoft, LookList, IsFinish}),
    ok.

-spec first_choose(#role{}, pos_integer()) -> {ok,
					       #role{}} |
					      {false, bitstring()}.

first_choose(Role = #role{m_home =
			      MHome = #m_home{look_list = []}},
	     LookId) ->
    Cond = [{lev, home_data:get_const(open_lev)},
	    {finish_room_feat,
	     home_data:get_const(open_experience_condition)}],
    case role_misc:check_open_cond(Cond, Role) of
      true ->
	  case home_data:is_first_choose(LookId) of
	    1 ->
		NRole = Role#role{m_home =
				      MHome#m_home{look_list = [LookId],
						   look_id = LookId}},
		push_info(NRole),
		{ok, NRole};
	    _ -> {false, lang:get(<<"该形象不是初始形象"/utf8>>)}
	  end;
      {false, Msg} -> {false, Msg}
    end;
first_choose(_, _) ->
    {false, lang:get(<<"初始形象已选择"/utf8>>)}.

-spec activate_look(#role{}, pos_integer()) -> {ok,
						#role{}} |
					       {false, bitstring()}.

activate_look(Role = #role{m_home =
			       MHome = #m_home{max_soft = MaxSoft,
					       look_list = LookList}},
	      LookId) ->
    case lists:member(LookId, LookList) of
      false ->
	  case home_data:get_home_look(LookId) of
	    {OpenSoft, LossCfg} ->
		case MaxSoft >= OpenSoft of
		  true ->
		      Loss = format:val_to_loss(LossCfg, activate_look),
		      case role_gain:do(Role, Loss) of
			{false, #loss{msg = Msg}} -> {false, Msg};
			{ok, Role1} ->
			    log:log_gain(Loss, Role, Role1, <<"家园玩法"/utf8>>,
					 util:fbin("解锁形象 ~w", [LookId])),
			    NRole = Role1#role{m_home =
						   MHome#m_home{look_list =
								    [LookId
								     | LookList]}},
			    {ok, NRole}
		      end;
		  _ ->
		      {false,
		       util:fbin(lang:get(<<"达到舒适度~w可购买"/utf8>>), [OpenSoft])}
		end;
	    _ -> {false, lang:get(<<"非家园形象"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"该形象已激活"/utf8>>)}
    end.

-spec item_activate_look(#role{}, pos_integer()) -> {ok,
						     #role{}} |
						    {false, bitstring()}.

item_activate_look(Role = #role{id = RoleId,
				m_home = MHome = #m_home{look_list = LookList}},
		   LookId) ->
    case home_lib:lookup(RoleId) of
      {ok, #home{}} ->
	  case lists:member(LookId, LookList) of
	    false ->
		case home_data:get_home_look(LookId) of
		  {_OpenSoft, _LossCfg} ->
		      NRole = Role#role{m_home =
					    MHome#m_home{look_list =
							     [LookId
							      | LookList]}},
		      push_info(NRole),
		      {ok, NRole};
		  _ -> {false, lang:get(<<"非家园形象"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"该形象已激活"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"家园未解锁"/utf8>>)}
    end.

-spec use_look(#role{}, pos_integer()) -> {ok,
					   #role{}} |
					  {false, bitstring()}.

use_look(Role = #role{m_home =
			  MHome = #m_home{look_list = LookList}},
	 LookId) ->
    case lists:member(LookId, LookList) of
      true ->
	  NRole = Role#role{m_home =
				MHome#m_home{look_id = LookId}},
	  home_mgr:sync_role(NRole, LookId, look_id),
	  push_info(NRole),
	  {ok, NRole};
      _ -> {false, lang:get(<<"该形象尚未激活"/utf8>>)}
    end.

-spec rand_list(#role{}) -> {false, list()} |
			    {ok, #role{}, list()}.

rand_list(Role = #role{id = RoleId,
		       m_home =
			   MHome = #m_home{last_rand_time = LastRandTime,
					   rand_list = OldRandList}}) ->
    Now = date:unixtime(),
    case LastRandTime + 60 > Now of
      false ->
	  case call_main() of
	    {ok, NewRandList0} ->
		NewRandList = [V
			       || V = #home_rand_visit{id = RoleIdT}
				      <- NewRandList0,
				  RoleIdT =/= RoleId],
		NRole = Role#role{m_home =
				      MHome#m_home{last_rand_time = Now,
						   rand_list = NewRandList}},
		{ok, NRole, NewRandList};
	    _ -> {false, OldRandList}
	  end;
      _ -> {false, OldRandList}
    end.

-spec get_log(#role{}) -> ok.

get_log(#role{id = RoleId}) ->
    case home_lib:lookup_ext(RoleId) of
      {ok, #home_ext{log = Logs}} ->
	  NewLogs = [do_log_ver(Log) || Log <- Logs],
	  sys_conn:pack_send(26010, {NewLogs}),
	  ok;
      _ -> sys_conn:pack_send(26010, {[]}), ok
    end.

do_log_ver({home_log, Id, Name, Face, Lev, IsFriend,
	    Type, Time, IntArgs, StrArgs}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    do_log_ver({home_log, Id, Name, Face, Lev, IsFriend,
		Type, Time, IntArgs, StrArgs, FaceUpdateTime,
		FaceFile});
do_log_ver(Data = #home_log{}) -> Data;
do_log_ver(Data) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhome599, _, {__Levelhome599, __Traceshome599}}
	  when __Levelhome599 band 8 /= 0 orelse
		 __Traceshome599 /= [] ->
	  lager:do_log(error,
		       [{module, home}, {function, do_log_ver}, {line, 599},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("访客记录版本转换失败:~w", [Data]), none, 4096, 8,
		       __Levelhome599, __Traceshome599, lager_event,
		       __Pidhome599);
      _ -> ok
    end,
    Data.

-spec rename(#role{}, bitstring()) -> {ok, #role{},
				       bitstring()} |
				      {false, bitstring()}.

rename(Role, HomeName0) ->
    HomeName = case
		 is_binary([string_util:trim(binary_to_list(HomeName0))])
		   of
		 false ->
		     list_to_binary([string_util:trim(binary_to_list(HomeName0))]);
		 true -> [string_util:trim(binary_to_list(HomeName0))]
	       end,
    NLen = string_util:utf8_len(HomeName),
    case keyword:check(name, HomeName) of
      false -> {false, lang:get(<<"名字不合法"/utf8>>)};
      _ when NLen < 1 orelse NLen > 9 ->
	  {false, lang:get(<<"名字长度不对"/utf8>>)};
      _ ->
	  home_mgr:sync_role(Role, HomeName, name),
	  NRole = role_trigger:fire(#evt_rename_home{}, Role),
	  {ok, NRole, HomeName}
    end.

-spec fire(#role{}, #evt_get_item{}) -> #role{}.

fire(Role = #role{m_home =
		      MHome = #m_home{set_list = SetList}},
     #evt_get_item{base_id = BaseId}) ->
    case home_data:get_set_id(BaseId) of
      SetId when SetId =/= 0 ->
	  HomeUnitSet = #home_unit_set{collect = Collect} =
			    list_util:keyfind(SetId, #home_unit_set.set_id,
					      SetList,
					      #home_unit_set{set_id = SetId}),
	  case lists:member(BaseId, Collect) of
	    false ->
		NewCollect = [BaseId | Collect],
		NewHomeUnitSet = HomeUnitSet#home_unit_set{collect =
							       NewCollect},
		NewSetList = lists:keystore(SetId,
					    #home_unit_set.set_id, SetList,
					    NewHomeUnitSet),
		NRole = Role#role{m_home =
				      MHome#m_home{set_list = NewSetList}},
		push_set_list(NRole),
		NRole;
	    _ -> Role
	  end;
      _ -> Role
    end.

-spec push_set_list(#role{}) -> ok.

push_set_list(#role{m_home =
			#m_home{set_list = SetList}}) ->
    sys_conn:pack_send(26013, {SetList}), ok.

-spec take_set_reward(#role{}, pos_integer()) -> {ok,
						  #role{}} |
						 {false, bitstring()}.

take_set_reward(Role = #role{m_home =
				 #m_home{set_list = SetList0}},
		RewardId) ->
    case home_data:get_set_reward(RewardId) of
      {SetId, SetNum, Reward} ->
	  case lists:keyfind(SetId, #home_unit_set.set_id,
			     SetList0)
	      of
	    #home_unit_set{reward = RewardList0,
			   collect = Collect} ->
		Len = length(Collect),
		IsGain = lists:member(RewardId, RewardList0),
		if IsGain -> {false, lang:get(<<"该奖励已领取"/utf8>>)};
		   SetNum > Len -> {false, lang:get(<<"未达到领取条件"/utf8>>)};
		   true ->
		       Gain = format:val_to_gain(Reward, home_set_reward),
		       case role_gain:do_notice(Role, Gain) of
			 {false, #gain{msg = Msg}} -> {false, Msg};
			 {ok,
			  Role1 = #role{m_home =
					    MHome = #m_home{set_list =
								SetList}}} ->
			     HomeUnitSet = #home_unit_set{reward = RewardList} =
					       lists:keyfind(SetId,
							     #home_unit_set.set_id,
							     SetList),
			     NewHomeUnitSet = HomeUnitSet#home_unit_set{reward =
									    [RewardId
									     | RewardList]},
			     NewSetList = lists:keystore(SetId,
							 #home_unit_set.set_id,
							 SetList,
							 NewHomeUnitSet),
			     NRole = Role1#role{m_home =
						    MHome#m_home{set_list =
								     NewSetList}},
			     log:log_gain(Gain, Role, NRole, <<"家园玩法"/utf8>>,
					  util:fbin("套装奖励~w", [RewardId])),
			     push_set_list(NRole),
			     {ok, NRole}
		       end
		end;
	    _ -> {false, lang:get(<<"未达到领取条件"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"奖励不存在"/utf8>>)}
    end.

-spec get_ranks(#role{}) -> {pos_integer(),
			     pos_integer(), list()}.

get_ranks(#role{id = RoleId}) ->
    Max = home_data:get_const(rank_list_limit),
    List = get_rank_list(1, Max, []),
    {MyRank, MyScore} = case lists:keyfind(RoleId,
					   #home_rank_rc.id, List)
			    of
			  #home_rank_rc{rank = Rank, score = Score}
			      when Rank > 0 ->
			      {Rank, Score};
			  _ ->
			      case home_mgr:roleid_rank(RoleId) of
				#home_rank_rc{rank = RankT, score = ScoreT} ->
				    {RankT, ScoreT};
				_ -> {0, 0}
			      end
			end,
    {MyRank, MyScore, List}.

get_rank_list(Start, Num, L) when Start > Num ->
    lists:reverse(L);
get_rank_list(Start, Num, L) ->
    case catch ets:lookup(home_rank, Start) of
      [Info = #home_rank_rc{} | _] ->
	  get_rank_list(Start + 1, Num, [Info | L]);
      _ -> lists:reverse(L)
    end.

-spec set_main_floor(#role{}, pos_integer()) -> {ok,
						 #role{}, pos_integer()} |
						{false, bitstring()}.

set_main_floor(Role = #role{m_home =
				MHome = #m_home{open_floor = OpenFloor}},
	       MainFloor) ->
    case lists:member(MainFloor, OpenFloor) of
      true ->
	  home_mgr:sync_role(Role, MainFloor, main_floor),
	  NRole = Role#role{m_home =
				MHome#m_home{main_floor = MainFloor}},
	  {NewMaxFloor, _} = calc_max_soft_floor(NRole),
	  {ok, NRole, NewMaxFloor};
      _ -> {false, lang:get(<<"该层尚未开通"/utf8>>)}
    end.

calc_max_soft_floor(#role{m_home =
			      #m_home{soft = Soft1, floor_list = FloorList,
				      main_floor = MainFloor}}) ->
    Fun = fun ({FloorT, SoftT, _}, {MaxFloorT, MaxSoftT}) ->
		  case SoftT > MaxSoftT orelse
			 SoftT >= MaxSoftT andalso MainFloor == FloorT
		      of
		    true -> {FloorT, SoftT};
		    _ -> {MaxFloorT, MaxSoftT}
		  end
	  end,
    {MaxFloor, MaxSoft} = lists:foldl(Fun, {0, 0},
				      [{1, Soft1, []} | FloorList]),
    {MaxFloor, MaxSoft}.

calc_other_bid(#role{m_home =
			 #m_home{floor_list = FloorList, list = List}},
	       Floor) ->
    ItemList = [{1, List} | [{FloorT, BidL}
			     || {FloorT, _, BidL} <- FloorList]],
    OtherFloorItems = lists:flatten([BidL
				     || {FloorT, BidL} <- ItemList,
					FloorT =/= Floor]),
    item_lib:merge(OtherFloorItems, []).

call_main() ->
    case sys_env:get(home_merge_status, false) of
      true -> home_mgr:call(get_rand_visit);
      _ ->
	  cluster_dynamic_group:call_main(1, home_mgr, call,
					  [get_rand_visit])
    end.


