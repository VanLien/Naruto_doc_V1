-file("data/holiday_rule_charge.erl", 1).

-file("src/mod/holiday/holiday_rule_charge.erl", 1).

-module(holiday_rule_charge).

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
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{triple_rebate_data,
		 [id, charge_sum, reward_times, mail_title,
		  mail_content]},
		{charge_data,
		 [id, name, val, gold, first_add, add, vip_exp, pic,
		  is_show, is_iosverify, type, items]},
		{m_charge,
		 [ver, charge_list, first_gift, triple_rebate_list,
		  merge_count, merge_charge_list, day_gift, week_refresh,
		  week_gift, month_refresh, month_gift, day_first_gift,
		  first_gift_ver, choose_first_gift_status,
		  reset_charge_list, warehouse_charge_list]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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

-export([qry/2, take/4, fire/3, zero_flush/2, buy/2,
	 apply_broadcast/2, is_holiday_charge/2]).

-export([gm_open_hd_1008_charge_fund/3]).

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

-file("src/mod/holiday/holiday_rule_charge.erl", 20).

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

-file("src/mod/holiday/holiday_rule_charge.erl", 21).

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

-file("src/mod/holiday/holiday_rule_charge.erl", 22).

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

-file("src/mod/holiday/holiday_rule_charge.erl", 23).

-file("inc/log.hrl", 1).

-file("src/mod/holiday/holiday_rule_charge.erl", 24).

-file("inc/charge.hrl", 1).

-record(m_charge,
	{ver = 9, charge_list = [], first_gift = [],
	 triple_rebate_list = [], merge_count = 0,
	 merge_charge_list = [], day_gift = [], week_refresh = 0,
	 week_gift = [], month_refresh = 0, month_gift = [],
	 day_first_gift = {0, 0}, first_gift_ver = 0,
	 choose_first_gift_status = 0, reset_charge_list = [],
	 warehouse_charge_list = []}).

-record(charge_data,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(), val = 0  :: float(),
	 gold = 0  :: non_neg_integer(),
	 first_add = 0  :: non_neg_integer(),
	 add = 0  :: non_neg_integer(),
	 vip_exp = 0  :: non_neg_integer(),
	 pic = 0  :: non_neg_integer(), is_show = 0  :: 0..1,
	 is_iosverify = 1  :: 0..1,
	 type = 0  :: non_neg_integer(), items = []  :: list()}).

-record(triple_rebate_data,
	{id = 0  :: non_neg_integer(),
	 charge_sum = 0  :: bitstring(),
	 reward_times = 0  :: non_neg_integer(),
	 mail_title = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring()}).

-file("src/mod/holiday/holiday_rule_charge.erl", 25).

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

-file("src/mod/holiday/holiday_rule_charge.erl", 26).

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

-file("src/mod/holiday/holiday_rule_charge.erl", 27).

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

-file("src/mod/holiday/holiday_rule_charge.erl", 28).

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

-file("src/mod/holiday/holiday_rule_charge.erl", 29).

gm_open_hd_1008_charge_fund(Holiday = #holiday{camp_id =
						   CampId,
					       bid = Bid, tbid = 1008,
					       reward = Reward},
			    Role = #role{lev = NLev},
			    #evt_pay{info = #{package_id := PackageId}}) ->
    case lists:keyfind(PackageId, 1, Reward) of
      {PackageId, RewardList} ->
	  {IsActivate0, GetAimList} =
	      holiday_lib:get_tv_val(CampId, Bid, Role),
	  case IsActivate0 > 0 of
	    false ->
		IsActivate = 1,
		Fun = fun (I, L) ->
			      Aim = element(1, I),
			      case lists:keyfind(Aim, 1, GetAimList) of
				false when NLev >= Aim -> [{Aim, 1} | L];
				false -> L;
				Temp -> [Temp | L]
			      end
		      end,
		NewGetAimList = lists:foldl(Fun, [], RewardList),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, Role,
						 {IsActivate, NewGetAimList},
						 ExpireSec),
		holiday:push_bid_can_reward(NewRole, Bid),
		holiday_lib:push_holiday_one(NewRole, Bid),
		log:save(custom,
			 {NewRole, <<"invest-plan">>,
			  [{msg, <<"手动处理成长基金激活"/utf8>>}]}),
		notice:alert(lang:get(<<"Mua hàng thành công"/utf8>>)),
		{ok, NewRole};
	    _ ->
		{false, lang:get(<<"Thực hiện không thành công"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Thực hiện không thành công 2"/utf8>>)}
    end.

-spec is_holiday_charge(#role{},
			pos_integer()) -> true | false.

is_holiday_charge(Role, ChargeId) ->
    HolidayLists = [1029],
    check_can_charge(Role, ChargeId, HolidayLists).

check_can_charge(_Role, _ChargeId, []) -> true;
check_can_charge(Role, ChargeId, [Id | Ids]) ->
    case check_can_charge(Role, ChargeId, Id) of
      false -> false;
      true -> check_can_charge(Role, ChargeId, Ids)
    end;
check_can_charge(Role, ChargeId, Id) ->
    case holiday_lib:get_open_holiday(Role, Id) of
      #holiday{camp_id = CampId, bid = Bid,
	       reward = Reward} ->
	  case lists:keyfind(ChargeId, 2, Reward) of
	    {Aim, _, LimitNum, _BuyPrice, _Price, _Items, _AimStr,
	     _GiftTitle} ->
		GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
		TargetVal = list_util:keyfind(Aim, GetAimList, 0),
		case TargetVal >= LimitNum of
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
			{__Pidholiday_rule_charge83, _,
			 {__Levelholiday_rule_charge83,
			  __Tracesholiday_rule_charge83}}
			    when __Levelholiday_rule_charge83 band 8 /= 0 orelse
				   __Tracesholiday_rule_charge83 /= [] ->
			    lager:do_log(error,
					 [{module, holiday_rule_charge},
					  {function, check_can_charge},
					  {line, 83},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[~ts]直购礼包重复购买:~w",
						       [Role#role.name,
							{CampId, ChargeId}]),
					 none, 4096, 8,
					 __Levelholiday_rule_charge83,
					 __Tracesholiday_rule_charge83,
					 lager_event,
					 __Pidholiday_rule_charge83);
			_ -> ok
		      end,
		      false;
		  _ -> true
		end
	  end;
      _ -> true
    end.

-spec qry(#holiday{}, #role{}) -> {error, bitstring()} |
				  tuple().

qry(#holiday{tbid = 1003, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = [{_PackageId, Reward}],
	     cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    {AccVal, GetAimList} = case
			     holiday_lib:get_tv_val(CampId, Bid, Role)
			       of
			     {AccVal0, L0} -> {AccVal0, L0};
			     L0 -> {0, L0}
			   end,
    Now = date:unixtime(),
    Fun = fun ({Aim, Items, AimStr}) ->
		  Status = case lists:keyfind(Aim, 1, GetAimList) of
			     {_, S} -> S;
			     false -> 0
			   end,
		  {Aim,
		   case is_binary(AimStr) of
		     false -> list_to_binary(AimStr);
		     true -> AimStr
		   end,
		   Status, holiday_lib:to_client_item(Items), []};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_charge113, _,
		     {__Levelholiday_rule_charge113,
		      __Tracesholiday_rule_charge113}}
			when __Levelholiday_rule_charge113 band 8 /= 0 orelse
			       __Tracesholiday_rule_charge113 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_charge},
				      {function, qry}, {line, 113},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8,
				     __Levelholiday_rule_charge113,
				     __Tracesholiday_rule_charge113,
				     lager_event, __Pidholiday_rule_charge113);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    RankList = [],
    {max(0, EndTime - Now), AccVal, RewardData, ItemEff, [],
     CliReward, RankList};
qry(Holiday = #holiday{tbid = 1004, camp_id = CampId,
		       bid = Bid, end_time = EndTime, reward = Rewards,
		       cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    Now = date:unixtime(),
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    F = fun ({Aim, Conds, Loss, AimRewards, AimStr}, Acc) ->
		AimStatus = case lists:member(Aim, GetAimList) of
			      true -> 2;
			      _ ->
				  case holiday_rule:check_cfg_conds(Role,
								    Holiday,
								    #{}, Conds)
				      of
				    ok ->
					case Loss of
					  [_ | _] -> 0;
					  _ -> 1
					end;
				    _ -> 0
				  end
			    end,
		LossLen = length(Loss),
		ItemValList = lists:reverse(format:item_to_val(Loss ++
								 AimRewards)),
		CondValL = holiday_rule:make_cfg_cond_ext(Conds),
		AimExt = [{1, LossLen, <<>>}],
		Data = {Aim,
			case is_binary(AimStr) of
			  false -> list_to_binary(AimStr);
			  true -> AimStr
			end,
			AimStatus, ItemValList, CondValL ++ AimExt},
		[Data | Acc];
	    (Unknow, Acc) ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge143, _,
		   {__Levelholiday_rule_charge143,
		    __Tracesholiday_rule_charge143}}
		      when __Levelholiday_rule_charge143 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge143 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, qry}, {line, 143},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]活动[Bid:~w]配置有误:~w",
						 [Role#role.name, Bid, Unknow]),
				   none, 4096, 8, __Levelholiday_rule_charge143,
				   __Tracesholiday_rule_charge143, lager_event,
				   __Pidholiday_rule_charge143);
		  _ -> ok
		end,
		Acc
	end,
    AimList = lists:foldr(F, [], Rewards),
    RankList = [],
    ArgList = [],
    {max(0, EndTime - Now), 0, AimList, ItemEff, ArgList,
     CliReward, RankList};
qry(#holiday{tbid = 1005, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Rewards,
	     cli_reward = CliReward, item_effect = ItemEff,
	     start_time = ST},
    Role) ->
    Now = date:unixtime(),
    Day = date:day_diff(ST, Now) + 1,
    DayPayAcc = var:get_list_val(Role, day, 36, CampId, 0),
    {TypeDayList, TypeAccList} =
	holiday_lib:get_tv_val(CampId, Bid, Role),
    F = fun ({Aim, Type, Target, TargetVal, AimRewards,
	      AimStr},
	     Acc) ->
		{GetAimList, GainRewards} = case Type of
					      1 ->
						  TmpAimRewards = case
								    lists:keyfind(Day,
										  1,
										  AimRewards)
								      of
								    {_Day,
								     AimRewardsCfg} ->
									AimRewardsCfg;
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
									  {__Pidholiday_rule_charge163,
									   _,
									   {__Levelholiday_rule_charge163,
									    __Tracesholiday_rule_charge163}}
									      when
										__Levelholiday_rule_charge163
										  band
										  8
										  /=
										  0
										  orelse
										  __Tracesholiday_rule_charge163
										    /=
										    [] ->
									      lager:do_log(error,
											   [{module,
											     holiday_rule_charge},
											    {function,
											     qry},
											    {line,
											     163},
											    {pid,
											     pid_to_list(self())},
											    {node,
											     node()}
											    | lager:md()],
											   io_lib:format("[~ts][Bid:~w][CampId:~w]活动奖励配置[Day:~w][Aim:~w"
													 "][Cfg:~w]有误",
													 [Role#role.name,
													  Bid,
													  CampId,
													  Day,
													  Aim,
													  AimRewards]),
											   none,
											   4096,
											   8,
											   __Levelholiday_rule_charge163,
											   __Tracesholiday_rule_charge163,
											   lager_event,
											   __Pidholiday_rule_charge163);
									  _ ->
									      ok
									end,
									[]
								  end,
						  case lists:keyfind(Day, 1,
								     TypeDayList)
						      of
						    {Day, DayList} ->
							{DayList,
							 TmpAimRewards};
						    _ -> {[], TmpAimRewards}
						  end;
					      _ -> {TypeAccList, AimRewards}
					    end,
		{Count, AimStatus} = case lists:keyfind(Aim, 1,
							GetAimList)
					 of
				       {Aim, TmpCount, TmpAimStatus} ->
					   {TmpCount, TmpAimStatus};
				       _ -> {0, 0}
				     end,
		ItemValList =
		    lists:reverse(format:item_to_val(GainRewards)),
		AimExt = [{3, Type, <<>>}, {4, Target, <<>>},
			  {5, TargetVal, <<>>}, {6, Count, <<>>}],
		Data = {Aim,
			case is_binary(AimStr) of
			  false -> list_to_binary(AimStr);
			  true -> AimStr
			end,
			AimStatus, ItemValList, AimExt},
		[Data | Acc];
	    (Unknow, Acc) ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge185, _,
		   {__Levelholiday_rule_charge185,
		    __Tracesholiday_rule_charge185}}
		      when __Levelholiday_rule_charge185 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge185 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, qry}, {line, 185},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]活动[Bid:~w]配置有误:~w",
						 [Role#role.name, Bid, Unknow]),
				   none, 4096, 8, __Levelholiday_rule_charge185,
				   __Tracesholiday_rule_charge185, lager_event,
				   __Pidholiday_rule_charge185);
		  _ -> ok
		end,
		Acc
	end,
    AimList = lists:foldr(F, [], Rewards),
    RankList = [],
    ArgList = [{1, DayPayAcc, <<>>}],
    {max(0, EndTime - Now), 0, AimList, ItemEff, ArgList,
     CliReward, RankList};
qry(#holiday{tbid = TBid, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Rewards,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role)
    when TBid =:= 1026 orelse
	   TBid =:= 1035 orelse
	     TBid =:= 1039 orelse TBid == 1048 ->
    Now = date:unixtime(),
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    F = fun ({Aim, Price, AimRewards, AccLimit, AimStr,
	      OldPrice, Sort},
	     Acc) ->
		{AimStatus, LimitArgs} = case lists:keyfind(Aim, 1,
							    GetAimList)
					     of
					   {Aim, _, AccCount}
					       when AccCount =/= 0 ->
					       List = [{2, AccLimit, <<>>},
						       {6, AccCount, <<>>},
						       {7, 1, <<>>}],
					       {util:if_true(AccCount >=
							       AccLimit,
							     2, 0),
						List};
					   false when Price =:= 0 -> {1, []};
					   false when AccLimit =/= 0 ->
					       List = [{2, AccLimit, <<>>},
						       {6, 0, <<>>},
						       {7, 1, <<>>}],
					       {0, List};
					   _ -> {0, []}
					 end,
		AimExt = [{39, Sort, <<>>}, {1, 0, <<>>},
			  {26, OldPrice, <<>>}, {27, Price, <<>>}],
		ItemValList =
		    lists:reverse(format:item_to_val(AimRewards)),
		Data = {Aim,
			case is_binary(AimStr) of
			  false -> list_to_binary(AimStr);
			  true -> AimStr
			end,
			AimStatus, ItemValList, AimExt ++ LimitArgs},
		[Data | Acc];
	    ({Aim, Price, AimRewards, AccLimit, AimStr, OldPrice},
	     Acc) ->
		{AimStatus, LimitArgs} = case lists:keyfind(Aim, 1,
							    GetAimList)
					     of
					   {Aim, _, AccCount}
					       when AccCount =/= 0 ->
					       List = [{2, AccLimit, <<>>},
						       {6, AccCount, <<>>},
						       {7, 1, <<>>}],
					       {util:if_true(AccCount >=
							       AccLimit,
							     2, 0),
						List};
					   false when Price =:= 0 -> {1, []};
					   false when AccLimit =/= 0 ->
					       List = [{2, AccLimit, <<>>},
						       {6, 0, <<>>},
						       {7, 1, <<>>}],
					       {0, List};
					   _ -> {0, []}
					 end,
		AimExt = [{1, 0, <<>>}, {26, OldPrice, <<>>},
			  {27, Price, <<>>}],
		ItemValList =
		    lists:reverse(format:item_to_val(AimRewards)),
		Data = {Aim,
			case is_binary(AimStr) of
			  false -> list_to_binary(AimStr);
			  true -> AimStr
			end,
			AimStatus, ItemValList, AimExt ++ LimitArgs},
		[Data | Acc];
	    (Unknow, Acc) ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge233, _,
		   {__Levelholiday_rule_charge233,
		    __Tracesholiday_rule_charge233}}
		      when __Levelholiday_rule_charge233 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge233 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, qry}, {line, 233},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]活动[Bid:~w]配置有误:~w",
						 [Role#role.name, Bid, Unknow]),
				   none, 4096, 8, __Levelholiday_rule_charge233,
				   __Tracesholiday_rule_charge233, lager_event,
				   __Pidholiday_rule_charge233);
		  _ -> ok
		end,
		Acc
	end,
    AimList = lists:foldl(F, [], Rewards),
    {max(0, EndTime - Now), 0, AimList, ItemEff, [],
     CliReward, []};
qry(#holiday{tbid = TBid, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Rewards,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role)
    when TBid =:= 1006 ->
    Now = date:unixtime(),
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    F = fun ({Aim, Price, AimRewards, AccLimit, AimStr,
	      OldPrice, IconId},
	     Acc) ->
		{AimStatus, LimitArgs} = case lists:keyfind(Aim, 1,
							    GetAimList)
					     of
					   {Aim, _, AccCount}
					       when AccCount =/= 0 ->
					       List = [{2, AccLimit, <<>>},
						       {6, AccCount, <<>>},
						       {7, 1, <<>>}],
					       {util:if_true(AccCount >=
							       AccLimit,
							     2, 0),
						List};
					   false when Price =:= 0 -> {1, []};
					   false when AccLimit =/= 0 ->
					       List = [{2, AccLimit, <<>>},
						       {6, 0, <<>>},
						       {7, 1, <<>>}],
					       {0, List};
					   _ -> {0, []}
					 end,
		AimExt = [{41, IconId, <<>>}, {1, 0, <<>>},
			  {26, OldPrice, <<>>}, {27, Price, <<>>}],
		ItemValList =
		    lists:reverse(format:item_to_val(AimRewards)),
		Data = {Aim,
			case is_binary(AimStr) of
			  false -> list_to_binary(AimStr);
			  true -> AimStr
			end,
			AimStatus, ItemValList, AimExt ++ LimitArgs},
		[Data | Acc];
	    ({Aim, Price, AimRewards, AccLimit, AimStr, OldPrice},
	     Acc) ->
		{AimStatus, LimitArgs} = case lists:keyfind(Aim, 1,
							    GetAimList)
					     of
					   {Aim, _, AccCount}
					       when AccCount =/= 0 ->
					       List = [{2, AccLimit, <<>>},
						       {6, AccCount, <<>>},
						       {7, 1, <<>>}],
					       {util:if_true(AccCount >=
							       AccLimit,
							     2, 0),
						List};
					   false when Price =:= 0 -> {1, []};
					   false when AccLimit =/= 0 ->
					       List = [{2, AccLimit, <<>>},
						       {6, 0, <<>>},
						       {7, 1, <<>>}],
					       {0, List};
					   _ -> {0, []}
					 end,
		AimExt = [{1, 0, <<>>}, {26, OldPrice, <<>>},
			  {27, Price, <<>>}],
		ItemValList =
		    lists:reverse(format:item_to_val(AimRewards)),
		Data = {Aim,
			case is_binary(AimStr) of
			  false -> list_to_binary(AimStr);
			  true -> AimStr
			end,
			AimStatus, ItemValList, AimExt ++ LimitArgs},
		[Data | Acc];
	    (Unknow, Acc) ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge279, _,
		   {__Levelholiday_rule_charge279,
		    __Tracesholiday_rule_charge279}}
		      when __Levelholiday_rule_charge279 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge279 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, qry}, {line, 279},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]活动[Bid:~w]配置有误:~w",
						 [Role#role.name, Bid, Unknow]),
				   none, 4096, 8, __Levelholiday_rule_charge279,
				   __Tracesholiday_rule_charge279, lager_event,
				   __Pidholiday_rule_charge279);
		  _ -> ok
		end,
		Acc
	end,
    AimList = lists:foldl(F, [], Rewards),
    {max(0, EndTime - Now), 0, AimList, ItemEff, [],
     CliReward, []};
qry(#holiday{tbid = 1007, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Rewards,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    Now = date:unixtime(),
    {LossAccList, GetAimList} =
	holiday_lib:get_tv_val(CampId, Bid, Role),
    F = fun ({Aim, AssetsId, AimLoss, AimRewards, AimStr},
	     Acc) ->
		Loss = get_loss_tbid_1007(AssetsId, LossAccList),
		AimStatus = case lists:keyfind(Aim, 1, GetAimList) of
			      {_, S} -> S;
			      _ -> 0
			    end,
		AimExt = [{4, AimLoss, <<>>}, {5, Loss, <<>>}],
		ItemValList = format:item_to_val(AimRewards),
		Data = {Aim,
			case is_binary(AimStr) of
			  false -> list_to_binary(AimStr);
			  true -> AimStr
			end,
			AimStatus, ItemValList, AimExt},
		[Data | Acc];
	    (Unknow, Acc) ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge298, _,
		   {__Levelholiday_rule_charge298,
		    __Tracesholiday_rule_charge298}}
		      when __Levelholiday_rule_charge298 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge298 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, qry}, {line, 298},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]活动[Bid:~w]配置有误:~w",
						 [Role#role.name, Bid, Unknow]),
				   none, 4096, 8, __Levelholiday_rule_charge298,
				   __Tracesholiday_rule_charge298, lager_event,
				   __Pidholiday_rule_charge298);
		  _ -> ok
		end,
		Acc
	end,
    AimList = lists:foldr(F, [], Rewards),
    {max(0, EndTime - Now), 0, AimList, ItemEff, [],
     CliReward, []};
qry(#holiday{tbid = 1008, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = [{_PackageId, Reward}],
	     cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    {AccVal, GetAimList} = case
			     holiday_lib:get_tv_val(CampId, Bid, Role)
			       of
			     {AccVal0, L0} -> {AccVal0, L0};
			     L0 -> {0, L0}
			   end,
    Now = date:unixtime(),
    Fun = fun ({Aim, Items, AimStr}) ->
		  Status = case lists:keyfind(Aim, 1, GetAimList) of
			     {_, S} -> S;
			     false -> 0
			   end,
		  {Aim,
		   case is_binary(AimStr) of
		     false -> list_to_binary(AimStr);
		     true -> AimStr
		   end,
		   Status, holiday_lib:to_client_item(Items), []};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_charge319, _,
		     {__Levelholiday_rule_charge319,
		      __Tracesholiday_rule_charge319}}
			when __Levelholiday_rule_charge319 band 8 /= 0 orelse
			       __Tracesholiday_rule_charge319 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_charge},
				      {function, qry}, {line, 319},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8,
				     __Levelholiday_rule_charge319,
				     __Tracesholiday_rule_charge319,
				     lager_event, __Pidholiday_rule_charge319);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    RankList = [],
    {max(0, EndTime - Now), AccVal, RewardData, ItemEff, [],
     CliReward, RankList};
qry(#holiday{tbid = 1009, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Reward,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    Now = date:unixtime(),
    Fun = fun ({Aim, Max, RmbL, _IdL, Items, AimStr}) ->
		  {Status, HasNum, CanNum, _OutL} = case
						      lists:keyfind(Aim, 1,
								    GetAimList)
							of
						      {_, N1, N2, L0}
							  when N1 >= Max ->
							  {2, N1, N2, L0};
						      {_, N1, N2, L0}
							  when N2 > 0 ->
							  {1, N1, N2, L0};
						      {_, N1, N2, L0} ->
							  {0, N1, N2, L0};
						      false -> {0, 0, 0, []}
						    end,
		  CliOutItems = [],
		  CliRmbL = [{17, Rmb, <<>>} || Rmb <- RmbL],
		  AimArgs = [{13, Max, <<>>}, {14, HasNum, <<>>},
			     {15, CanNum, <<>>}
			     | CliOutItems ++ CliRmbL],
		  CliItems = [{ItemBid, ItemNum}
			      || {ItemBid, ItemNum, _Rand, _CanOutNum,
				  _IsNotice, _OutMax}
				     <- Items],
		  {Aim,
		   case is_binary(AimStr) of
		     false -> list_to_binary(AimStr);
		     true -> AimStr
		   end,
		   Status, CliItems, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_charge348, _,
		     {__Levelholiday_rule_charge348,
		      __Tracesholiday_rule_charge348}}
			when __Levelholiday_rule_charge348 band 8 /= 0 orelse
			       __Tracesholiday_rule_charge348 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_charge},
				      {function, qry}, {line, 348},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8,
				     __Levelholiday_rule_charge348,
				     __Tracesholiday_rule_charge348,
				     lager_event, __Pidholiday_rule_charge348);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    RankList = [],
    {max(0, EndTime - Now), 0, RewardData, ItemEff, [],
     CliReward, RankList};
qry(#holiday{tbid = TBid, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = [{Reward, Str}],
	     cli_reward = CliReward, item_effect = ItemEff},
    Role)
    when TBid == 1011 orelse
	   TBid == 1024 orelse
	     TBid == 1025 orelse TBid == 1027 orelse TBid == 1040 ->
    {Day, GetAimList} = holiday_lib:get_tv_val(CampId, Bid,
					       Role),
    Now = date:unixtime(),
    Fun = fun ({Aim, Items, AimStr}) ->
		  Status = list_util:keyfind(Aim, GetAimList, 0),
		  {Aim,
		   case is_binary(AimStr) of
		     false -> list_to_binary(AimStr);
		     true -> AimStr
		   end,
		   Status, Items, []};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_charge363, _,
		     {__Levelholiday_rule_charge363,
		      __Tracesholiday_rule_charge363}}
			when __Levelholiday_rule_charge363 band 8 /= 0 orelse
			       __Tracesholiday_rule_charge363 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_charge},
				      {function, qry}, {line, 363},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8,
				     __Levelholiday_rule_charge363,
				     __Tracesholiday_rule_charge363,
				     lager_event, __Pidholiday_rule_charge363);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    Args = [{24, 0,
	     case is_binary(Str) of
	       false -> list_to_binary(Str);
	       true -> Str
	     end}],
    RankList = [],
    {max(0, EndTime - Now), Day, RewardData, ItemEff, Args,
     CliReward, RankList};
qry(#holiday{tbid = 1012, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Reward,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    {DoNumList, GetAimList} = holiday_lib:get_tv_val(CampId,
						     Bid, Role),
    Now = date:unixtime(),
    Fun = fun ({Aim, _Min, _Max, Items, AimStr,
		LimitNum}) ->
		  AwardNum = list_util:keyfind(Aim, GetAimList, 0),
		  DoNum = list_util:keyfind(Aim, DoNumList, 0),
		  AimArgs = [{2, LimitNum, <<>>}, {6, DoNum, <<>>},
			     {23, AwardNum, <<>>}],
		  Status = case DoNum >= LimitNum of
			     true -> 2;
			     _ -> util:if_true(AwardNum > 0, 1, 0)
			   end,
		  {Aim,
		   case is_binary(AimStr) of
		     false -> list_to_binary(AimStr);
		     true -> AimStr
		   end,
		   Status, Items, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_charge392, _,
		     {__Levelholiday_rule_charge392,
		      __Tracesholiday_rule_charge392}}
			when __Levelholiday_rule_charge392 band 8 /= 0 orelse
			       __Tracesholiday_rule_charge392 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_charge},
				      {function, qry}, {line, 392},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8,
				     __Levelholiday_rule_charge392,
				     __Tracesholiday_rule_charge392,
				     lager_event, __Pidholiday_rule_charge392);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    RankList = [],
    {max(0, EndTime - Now), 0, RewardData, ItemEff, [],
     CliReward, RankList};
qry(Holiday = #holiday{tbid = 1013}, Role) ->
    holiday_rule:qry(Holiday, Role);
qry(#holiday{tbid = 1014, camp_id = CampId,
	     aim_title = AimTitle, bid = Bid, end_time = EndTime,
	     reward = Reward, cli_reward = CliReward,
	     item_effect = ItemEff},
    Role) ->
    Now = date:unixtime(),
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    F = fun ({Aim, OldPrice, Price, Rewards, AimStr},
	     Acc) ->
		AimStatus = case lists:member(Aim, GetAimList) of
			      true -> 2;
			      _ -> 0
			    end,
		ItemValList =
		    lists:reverse(format:item_to_val(Rewards)),
		AimArgs = [{26, OldPrice, <<>>}, {27, Price, <<>>}],
		Data = {Aim,
			case is_binary(AimStr) of
			  false -> list_to_binary(AimStr);
			  true -> AimStr
			end,
			AimStatus, ItemValList, AimArgs},
		[Data | Acc];
	    (Unknow, Acc) ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge415, _,
		   {__Levelholiday_rule_charge415,
		    __Tracesholiday_rule_charge415}}
		      when __Levelholiday_rule_charge415 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge415 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, qry}, {line, 415},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]活动[Bid:~w]配置有误:~w",
						 [Role#role.name, Bid, Unknow]),
				   none, 4096, 8, __Levelholiday_rule_charge415,
				   __Tracesholiday_rule_charge415, lager_event,
				   __Pidholiday_rule_charge415);
		  _ -> ok
		end,
		Acc
	end,
    RankList = [],
    AimList = lists:foldr(F, [], Reward),
    IntArg = (catch binary_to_integer(AimTitle)),
    IntArgs = case is_integer(IntArg) of
		true -> [{1, IntArg, <<>>}];
		_ -> []
	      end,
    {max(0, EndTime - Now), 0, AimList, ItemEff, IntArgs,
     CliReward, RankList};
qry(#holiday{tbid = TBid, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Reward,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role)
    when TBid =:= 1015 orelse
	   TBid =:= 1016 orelse
	     TBid =:= 1017 orelse
	       TBid =:= 1018 orelse
		 TBid =:= 1019 orelse TBid =:= 1020 ->
    Now = date:unixtime(),
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    F = fun ({Aim, OldPrice, Price, Rewards, AimStr},
	     Acc) ->
		AimStatus = case lists:member(Aim, GetAimList) of
			      true -> 2;
			      _ -> 0
			    end,
		ItemValList =
		    lists:reverse(format:item_to_val(Rewards)),
		AimArgs = [{26, OldPrice, <<>>}, {27, Price, <<>>}],
		Data = {Aim,
			case is_binary(AimStr) of
			  false -> list_to_binary(AimStr);
			  true -> AimStr
			end,
			AimStatus, ItemValList, AimArgs},
		[Data | Acc];
	    (Unknow, Acc) ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge443, _,
		   {__Levelholiday_rule_charge443,
		    __Tracesholiday_rule_charge443}}
		      when __Levelholiday_rule_charge443 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge443 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, qry}, {line, 443},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]活动[Bid:~w]配置有误:~w",
						 [Role#role.name, Bid, Unknow]),
				   none, 4096, 8, __Levelholiday_rule_charge443,
				   __Tracesholiday_rule_charge443, lager_event,
				   __Pidholiday_rule_charge443);
		  _ -> ok
		end,
		Acc
	end,
    RankList = [],
    AimList = lists:foldr(F, [], Reward),
    {max(0, EndTime - Now), 0, AimList, ItemEff, [],
     CliReward, RankList};
qry(#holiday{tbid = 1021, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Reward,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    Now = date:unixtime(),
    {_, GetAimList} = holiday_lib:get_tv_val(CampId, Bid,
					     Role),
    F = fun ({Aim, _NeedCharge, Rewards, AimStr}, Acc) ->
		Status = list_util:keyfind(Aim, GetAimList, 0),
		AimArgs = [],
		Data = {Aim,
			case is_binary(AimStr) of
			  false -> list_to_binary(AimStr);
			  true -> AimStr
			end,
			Status, Rewards, AimArgs},
		[Data | Acc];
	    (Unknow, Acc) ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge458, _,
		   {__Levelholiday_rule_charge458,
		    __Tracesholiday_rule_charge458}}
		      when __Levelholiday_rule_charge458 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge458 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, qry}, {line, 458},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]活动[Bid:~w]配置有误:~w",
						 [Role#role.name, Bid, Unknow]),
				   none, 4096, 8, __Levelholiday_rule_charge458,
				   __Tracesholiday_rule_charge458, lager_event,
				   __Pidholiday_rule_charge458);
		  _ -> ok
		end,
		Acc
	end,
    RankList = [],
    AimList = lists:foldr(F, [], Reward),
    {max(0, EndTime - Now), 0, AimList, ItemEff, [],
     CliReward, RankList};
qry(Holiday = #holiday{tbid = 1045,
		       reward = [DefaultReward, ChannelReward]},
    Role = #role{reg_channel = RegChannel,
		 channel = Channel}) ->
    Reward = case lists:keyfind(Channel, 1, ChannelReward)
		 of
	       {_, RewardT} when RegChannel == Channel -> RewardT;
	       _ -> DefaultReward
	     end,
    NewHoliday = Holiday#holiday{reward = Reward},
    holiday_rule:qry(NewHoliday, Role);
qry(Holiday = #holiday{tbid = TBid}, Role)
    when TBid =:= 1022 orelse
	   TBid =:= 1028 orelse
	     TBid =:= 1052 orelse TBid =:= 1054 ->
    holiday_rule:qry(Holiday, Role);
qry(Holiday = #holiday{tbid = 1023}, Role) ->
    holiday_rule:qry(Holiday, Role);
qry(#holiday{tbid = TBid, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Reward,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role)
    when TBid == 1029 ->
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    Now = date:unixtime(),
    Fun = fun ({Aim, ChargeId, LimitNum, BuyPrice, Price,
		Items, AimStr, GiftTitle}) ->
		  TargetVal = list_util:keyfind(Aim, GetAimList, 0),
		  AimArgs = [{26, Price, <<>>}, {27, BuyPrice, <<>>},
			     {4, LimitNum, <<>>}, {5, TargetVal, <<>>},
			     {33, ChargeId, <<>>},
			     {34, 0,
			      case is_binary(GiftTitle) of
				false -> list_to_binary(GiftTitle);
				true -> GiftTitle
			      end}],
		  {Aim,
		   case is_binary(AimStr) of
		     false -> list_to_binary(AimStr);
		     true -> AimStr
		   end,
		   0, Items, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_charge492, _,
		     {__Levelholiday_rule_charge492,
		      __Tracesholiday_rule_charge492}}
			when __Levelholiday_rule_charge492 band 8 /= 0 orelse
			       __Tracesholiday_rule_charge492 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_charge},
				      {function, qry}, {line, 492},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8,
				     __Levelholiday_rule_charge492,
				     __Tracesholiday_rule_charge492,
				     lager_event, __Pidholiday_rule_charge492);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    Args = [],
    RankList = [],
    {max(0, EndTime - Now), 0, RewardData, ItemEff, Args,
     CliReward, RankList};
qry(#holiday{tbid = TBid, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Reward,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role)
    when TBid == 1030 orelse
	   TBid == 1033 orelse TBid == 1034 orelse TBid == 1043 ->
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    Now = date:unixtime(),
    Fun = fun ({Aim, ChargeId, Items, LimitNum, Price,
		BuyPrice, Discount, AimStr}) ->
		  TargetVal = list_util:keyfind(Aim, GetAimList, 0),
		  AimArgs = [{26, Price, <<>>}, {27, BuyPrice, <<>>},
			     {4, LimitNum, <<>>}, {5, TargetVal, <<>>},
			     {25, Discount, <<>>}, {33, ChargeId, <<>>}],
		  State = util:if_true(TargetVal >= LimitNum, 2, 0),
		  {Aim,
		   case is_binary(AimStr) of
		     false -> list_to_binary(AimStr);
		     true -> AimStr
		   end,
		   State, Items, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_charge517, _,
		     {__Levelholiday_rule_charge517,
		      __Tracesholiday_rule_charge517}}
			when __Levelholiday_rule_charge517 band 8 /= 0 orelse
			       __Tracesholiday_rule_charge517 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_charge},
				      {function, qry}, {line, 517},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8,
				     __Levelholiday_rule_charge517,
				     __Tracesholiday_rule_charge517,
				     lager_event, __Pidholiday_rule_charge517);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    Args = [],
    RankList = [],
    {max(0, EndTime - Now), 0, RewardData, ItemEff, Args,
     CliReward, RankList};
qry(#holiday{tbid = TBid, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = RewardT,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role = #role{lev = Lev})
    when TBid == 1051 ->
    {BuyLev, GetAimList} = holiday_lib:get_tv_val(CampId,
						  Bid, Role),
    UseLev = util:if_true(BuyLev == 0, Lev, BuyLev),
    Reward = lists:flatten([RewardTemp
			    || {LevMin, LevMax, RewardTemp} <- RewardT,
			       UseLev >= LevMin andalso UseLev < LevMax]),
    Now = date:unixtime(),
    Fun = fun ({Aim, ChargeId, Items, LimitNum, Price,
		BuyPrice, Discount, AimStr}) ->
		  TargetVal = list_util:keyfind(Aim, GetAimList, 0),
		  AimArgs = [{26, Price, <<>>}, {27, BuyPrice, <<>>},
			     {4, LimitNum, <<>>}, {5, TargetVal, <<>>},
			     {25, Discount, <<>>}, {33, ChargeId, <<>>}],
		  State = util:if_true(TargetVal >= LimitNum, 2, 0),
		  {Aim,
		   case is_binary(AimStr) of
		     false -> list_to_binary(AimStr);
		     true -> AimStr
		   end,
		   State, Items, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_charge544, _,
		     {__Levelholiday_rule_charge544,
		      __Tracesholiday_rule_charge544}}
			when __Levelholiday_rule_charge544 band 8 /= 0 orelse
			       __Tracesholiday_rule_charge544 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_charge},
				      {function, qry}, {line, 544},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8,
				     __Levelholiday_rule_charge544,
				     __Tracesholiday_rule_charge544,
				     lager_event, __Pidholiday_rule_charge544);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    Args = [],
    RankList = [],
    {max(0, EndTime - Now), 0, RewardData, ItemEff, Args,
     CliReward, RankList};
qry(#holiday{tbid = 1031}, _Role) ->
    {0, 0, [{0, <<>>, 0, [], []}], [], [], <<>>, []};
qry(#holiday{tbid = 1032, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Reward,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    BuyNum = holiday_lib:get_tv_val(CampId, Bid, Role),
    Now = date:unixtime(),
    Fun = fun ({_, _, Items, SkinId, ChargeId, OldPrice}) ->
		  AimArgs1 = [{35, SkinId, <<>>}, {33, ChargeId, <<>>},
			      {26, OldPrice, <<>>}],
		  AimArgs = case lists:keyfind(effects_id, 1, ItemEff) of
			      {_, EffectId} ->
				  [{40, EffectId, <<>>} | AimArgs1];
			      _ -> AimArgs1
			    end,
		  State = util:if_true(BuyNum >= 1, 2, 0),
		  {0, <<>>, State, Items, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_charge572, _,
		     {__Levelholiday_rule_charge572,
		      __Tracesholiday_rule_charge572}}
			when __Levelholiday_rule_charge572 band 8 /= 0 orelse
			       __Tracesholiday_rule_charge572 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_charge},
				      {function, qry}, {line, 572},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8,
				     __Levelholiday_rule_charge572,
				     __Tracesholiday_rule_charge572,
				     lager_event, __Pidholiday_rule_charge572);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    Args = [],
    RankList = [],
    ItemEff2 = lists:keydelete(effects_id, 1, ItemEff),
    {max(0, EndTime - Now), BuyNum, RewardData, ItemEff2,
     Args, CliReward, RankList};
qry(#holiday{tbid = 1036, camp_id = CampId, bid = Bid,
	     start_time = StartTime, end_time = EndTime,
	     reward = [ExtraRate, Reward]},
    Role) ->
    Now = date:unixtime(),
    Day = date:day_diff(StartTime, Now) + 1,
    {ShowCount, RealCount, RealDay, IsRedPoint,
     GetAimList} =
	holiday_lib:get_tv_val(CampId, Bid, Role),
    IsCharge = var:get_var(Role, day, 86, 0),
    IsSupply = var:get_var(Role, day, 82, 0),
    SupplyRealDay = if IsCharge == 0 andalso
			 Day >= RealDay + 2 ->
			   RealDay + 2;
		       IsCharge == 0 -> 0;
		       IsSupply == 0 andalso Day >= RealDay + 1 -> RealDay + 1;
		       true -> 0
		    end,
    ShowDay = if IsCharge == 0 -> RealDay + 1;
		 IsSupply == 0 -> RealDay;
		 true -> RealDay - 1
	      end,
    DayLimitRmb = case lists:keyfind(ShowDay, 1, Reward) of
		    {_, DayLimitRmbT, _, _} -> DayLimitRmbT;
		    _ -> 0
		  end,
    Fun = fun ({Aim, LimitRmb, ShowL, Items}) ->
		  Status = case lists:keyfind(Aim, 1, GetAimList) of
			     false when Aim == SupplyRealDay -> 3;
			     {_, S} -> S;
			     _ -> 0
			   end,
		  NewLimitRmb = util:if_true(Status == 3,
					     util:round(ExtraRate / 1000 *
							  LimitRmb),
					     LimitRmb),
		  {ShowId, ShowNum} = case ShowL of
					[{ShowIdT, ShowNumT} | _] ->
					    {ShowIdT, ShowNumT};
					_ -> {0, 0}
				      end,
		  RestRmb = if IsCharge == 1 andalso Status == 3 ->
				   max(0, NewLimitRmb - RealCount);
			       Status == 3 ->
				   max(0,
				       NewLimitRmb + DayLimitRmb - RealCount);
			       IsCharge == 0 andalso Aim == ShowDay ->
				   max(0, NewLimitRmb - RealCount);
			       true -> 0
			    end,
		  AimArgs = [{5, LimitRmb, <<>>}, {36, ShowId, <<>>},
			     {37, ShowNum, <<>>}, {38, RestRmb, <<>>}],
		  {Aim, <<>>, Status, Items, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_charge622, _,
		     {__Levelholiday_rule_charge622,
		      __Tracesholiday_rule_charge622}}
			when __Levelholiday_rule_charge622 band 8 /= 0 orelse
			       __Tracesholiday_rule_charge622 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_charge},
				      {function, qry}, {line, 622},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8,
				     __Levelholiday_rule_charge622,
				     __Tracesholiday_rule_charge622,
				     lager_event, __Pidholiday_rule_charge622);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    {max(0, EndTime - Now), ShowCount, RewardData, [],
     [{1, ShowDay, <<>>}, {2, IsSupply, <<>>},
      {3, IsRedPoint, <<>>}],
     <<>>, []};
qry(Holiday = #holiday{tbid = TBid}, Role)
    when TBid =:= 1037 ->
    holiday_rule:qry(Holiday, Role);
qry(Holiday = #holiday{tbid = TBid}, Role)
    when TBid =:= 1038 ->
    holiday_rule:qry(Holiday, Role);
qry(Holiday = #holiday{tbid = TBid}, Role)
    when TBid =:= 1041 ->
    holiday_rule:qry(Holiday, Role);
qry(#holiday{tbid = TBid, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Reward,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role)
    when TBid == 1042 orelse TBid == 1049 ->
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    Now = date:unixtime(),
    Fun = fun ({Aim, ChargeId, Items, LimitNum, Price,
		BuyPrice, Discount, Lable, AimStr}) ->
		  TargetVal = list_util:keyfind(Aim, GetAimList, 0),
		  AimArgs = [{26, Price, <<>>}, {27, BuyPrice, <<>>},
			     {4, LimitNum, <<>>}, {5, TargetVal, <<>>},
			     {25, Discount, <<>>}, {33, ChargeId, <<>>},
			     {30, Lable, <<>>}],
		  State = util:if_true(TargetVal >= LimitNum, 2, 0),
		  {Aim,
		   case is_binary(AimStr) of
		     false -> list_to_binary(AimStr);
		     true -> AimStr
		   end,
		   State, Items, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_charge652, _,
		     {__Levelholiday_rule_charge652,
		      __Tracesholiday_rule_charge652}}
			when __Levelholiday_rule_charge652 band 8 /= 0 orelse
			       __Tracesholiday_rule_charge652 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_charge},
				      {function, qry}, {line, 652},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8,
				     __Levelholiday_rule_charge652,
				     __Tracesholiday_rule_charge652,
				     lager_event, __Pidholiday_rule_charge652);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    Args = [],
    RankList = [],
    {max(0, EndTime - Now), 0, RewardData, ItemEff, Args,
     CliReward, RankList};
qry(#holiday{tbid = 1046, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Reward,
	     cli_reward = CliReward, item_effect = ItemEff},
    Role) ->
    BuyNum = holiday_lib:get_tv_val(CampId, Bid, Role),
    Now = date:unixtime(),
    Fun = fun ({_, _, Items, SkinId, ChargeId, OldPrice}) ->
		  AimArgs1 = [{35, SkinId, <<>>}, {33, ChargeId, <<>>},
			      {26, OldPrice, <<>>}],
		  AimArgs = case lists:keyfind(effects_id, 1, ItemEff) of
			      {_, EffectId} ->
				  [{40, EffectId, <<>>} | AimArgs1];
			      _ -> AimArgs1
			    end,
		  State = util:if_true(BuyNum >= 1, 2, 0),
		  {0, <<>>, State, Items, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_charge678, _,
		     {__Levelholiday_rule_charge678,
		      __Tracesholiday_rule_charge678}}
			when __Levelholiday_rule_charge678 band 8 /= 0 orelse
			       __Tracesholiday_rule_charge678 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_charge},
				      {function, qry}, {line, 678},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8,
				     __Levelholiday_rule_charge678,
				     __Tracesholiday_rule_charge678,
				     lager_event, __Pidholiday_rule_charge678);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    Args = [],
    RankList = [],
    ItemEff2 = lists:keydelete(effects_id, 1, ItemEff),
    {max(0, EndTime - Now), BuyNum, RewardData, ItemEff2,
     Args, CliReward, RankList};
qry(#holiday{tbid = 1047}, _Role) ->
    {0, 0, [{0, <<>>, 0, [], []}], [], [], <<>>, []};
qry(#holiday{tbid = 1050}, _Role) ->
    {0, 0, [{0, <<>>, 0, [], []}], [], [], <<>>, []};
qry(#holiday{tbid = TBid, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = [Rewards, _],
	     cli_reward = CliReward, item_effect = ItemEff},
    Role)
    when TBid =:= 1053 ->
    Now = date:unixtime(),
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    F = fun ({Aim, Price, AimRewards, AccLimit, AimStr,
	      OldPrice, Sort},
	     Acc) ->
		{AimStatus, LimitArgs} = case lists:keyfind(Aim, 1,
							    GetAimList)
					     of
					   {Aim, _, AccCount}
					       when AccCount =/= 0 ->
					       List = [{2, AccLimit, <<>>},
						       {6, AccCount, <<>>},
						       {7, 3, <<>>}],
					       {util:if_true(AccCount >=
							       AccLimit,
							     2, 0),
						List};
					   false when Price =:= 0 -> {1, []};
					   false when AccLimit =/= 0 ->
					       List = [{2, AccLimit, <<>>},
						       {6, 0, <<>>},
						       {7, 3, <<>>}],
					       {0, List};
					   _ -> {0, []}
					 end,
		AimExt = [{39, Sort, <<>>}, {1, 0, <<>>},
			  {26, OldPrice, <<>>}, {27, Price, <<>>}],
		ItemValList =
		    lists:reverse(format:item_to_val(AimRewards)),
		Data = {Aim,
			case is_binary(AimStr) of
			  false -> list_to_binary(AimStr);
			  true -> AimStr
			end,
			AimStatus, ItemValList, AimExt ++ LimitArgs},
		[Data | Acc];
	    (Unknow, Acc) ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge713, _,
		   {__Levelholiday_rule_charge713,
		    __Tracesholiday_rule_charge713}}
		      when __Levelholiday_rule_charge713 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge713 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, qry}, {line, 713},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]活动[Bid:~w]配置有误:~w",
						 [Role#role.name, Bid, Unknow]),
				   none, 4096, 8, __Levelholiday_rule_charge713,
				   __Tracesholiday_rule_charge713, lager_event,
				   __Pidholiday_rule_charge713);
		  _ -> ok
		end,
		Acc
	end,
    AimList = lists:foldl(F, [], Rewards),
    {max(0, EndTime - Now), 0, AimList, ItemEff, [],
     CliReward, []};
qry(#holiday{bid = Bid}, Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule_charge719, _,
       {__Levelholiday_rule_charge719,
	__Tracesholiday_rule_charge719}}
	  when __Levelholiday_rule_charge719 band 8 /= 0 orelse
		 __Tracesholiday_rule_charge719 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule_charge}, {function, qry},
			{line, 719}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]查询未处理的活动[~w]",
				     [Role#role.name, Bid]),
		       none, 4096, 8, __Levelholiday_rule_charge719,
		       __Tracesholiday_rule_charge719, lager_event,
		       __Pidholiday_rule_charge719);
      _ -> ok
    end,
    {error, not_found}.

-spec take(#holiday{}, #role{}, pos_integer(),
	   pos_integer()) -> {error, bitstring()} |
			     {ok, bitstring(), #role{}}.

take(Holiday = #holiday{tbid = 1003,
			reward = [{_PackageId, Reward}]},
     Role = #role{pid = Pid}, Aim, _Args) ->
    case lists:keyfind(Aim, 1, Reward) of
      {Aim, Items, _AimStr} ->
	  case holiday_rule:reward(Holiday, Role, Aim, Items, #{})
	      of
	    Data = {ok, _, #role{}} ->
		L = [Aim1 || {Aim1, _, _} <- Reward],
		Max = lists:max(L),
		case Aim =:= Max of
		  true -> role:redirect(Pid, 16601, {}), Data;
		  _ -> Data
		end;
	    Data2 -> Data2
	  end;
      _ ->
	  {error,
	   lang:get(<<"Không có cấu hình phần thưởng tương "
		      "ứng"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = 1004, bid = Bid,
			camp_id = CampId, reward = Reward},
     Role, Aim, Args) ->
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    case lists:member(Aim, GetAimList) of
      false ->
	  case lists:keyfind(Aim, 1, Reward) of
	    {_Aim, Conds, Loss, AimRewards, _AimStr} ->
		case holiday_rule:check_cfg_conds(Role, Holiday, Args,
						  Conds)
		    of
		  ok ->
		      Steps = [gl, take],
		      NewGetAimList = [Aim | GetAimList],
		      Opts = #{aim => Aim, loss => Loss, gain => AimRewards,
			       tv_val => {val, NewGetAimList}},
		      holiday_rule:take_reward(Role, Holiday, Opts, Steps);
		  {false, Msg} -> {error, Msg}
		end;
	    _ ->
		{error,
		 lang:get(<<"Gói quà tặng giá trị không xác định"/utf8>>)}
	  end;
      true ->
	  {error,
	   lang:get(<<"Bạn chỉ có thể mua nó một lần"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = 1005, bid = Bid,
			camp_id = CampId, reward = Reward, start_time = ST},
     Role, Aim, _Args) ->
    case lists:keyfind(Aim, 1, Reward) of
      {Aim, Type, _Target, _TargetVal, AimRewards, _AimStr} ->
	  Day = date:day_diff(ST, date:unixtime()) + 1,
	  {TypeDayList, TypeAccList} =
	      holiday_lib:get_tv_val(CampId, Bid, Role),
	  {GetAimList, GainRewards} = case Type of
					1 ->
					    TmpAimRewards = case
							      lists:keyfind(Day,
									    1,
									    AimRewards)
								of
							      {_Day,
							       AimRewardsCfg} ->
								  AimRewardsCfg;
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
								     _, _} ->
									fun
									  () ->
									      {error,
									       {sink_not_configured,
										lager_event}}
									end();
								    {__Pidholiday_rule_charge776,
								     _,
								     {__Levelholiday_rule_charge776,
								      __Tracesholiday_rule_charge776}}
									when
									  __Levelholiday_rule_charge776
									    band
									    8
									    /= 0
									    orelse
									    __Tracesholiday_rule_charge776
									      /=
									      [] ->
									lager:do_log(error,
										     [{module,
										       holiday_rule_charge},
										      {function,
										       take},
										      {line,
										       776},
										      {pid,
										       pid_to_list(self())},
										      {node,
										       node()}
										      | lager:md()],
										     io_lib:format("[~ts][Bid:~w][CampId:~w]活动奖励配置[Day:~w][Aim:~w"
												   "][Cfg:~w]有误",
												   [Role#role.name,
												    Bid,
												    CampId,
												    Day,
												    Aim,
												    AimRewards]),
										     none,
										     4096,
										     8,
										     __Levelholiday_rule_charge776,
										     __Tracesholiday_rule_charge776,
										     lager_event,
										     __Pidholiday_rule_charge776);
								    _ -> ok
								  end,
								  []
							    end,
					    case lists:keyfind(Day, 1,
							       TypeDayList)
						of
					      {Day, DayList} ->
						  {DayList, TmpAimRewards};
					      _ -> {[], TmpAimRewards}
					    end;
					_ -> {TypeAccList, AimRewards}
				      end,
	  case lists:keyfind(Aim, 1, GetAimList) of
	    {Aim, Count, 1} ->
		Steps = [gl, take],
		NewGetAimList = lists:keystore(Aim, 1, GetAimList,
					       {Aim, Count, 2}),
		{NewTypeDayList, NewTypeAccList} = case Type of
						     1 ->
							 {lists:keystore(Day, 1,
									 TypeDayList,
									 {Day,
									  NewGetAimList}),
							  TypeAccList};
						     _ ->
							 {TypeDayList,
							  NewGetAimList}
						   end,
		Opts = #{aim => Aim, gain => GainRewards,
			 tv_val => {val, {NewTypeDayList, NewTypeAccList}}},
		holiday_rule:take_reward(Role, Holiday, Opts, Steps);
	    _ ->
		{error,
		 lang:get(<<"Không đáp ứng được các điều kiện để "
			    "nhận được phần thưởng"/utf8>>)}
	  end;
      _ ->
	  {error,
	   lang:get(<<"Không có phần thưởng nào có sẵn"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = 1007, bid = Bid,
			camp_id = CampId, reward = Reward},
     Role, Aim, _Args) ->
    {LossAccList, GetAimList} =
	holiday_lib:get_tv_val(CampId, Bid, Role),
    case lists:keyfind(Aim, 1, Reward) of
      {Aim, _AssetsId, _AimLoss, AimRewards, _AimStr} ->
	  case lists:keyfind(Aim, 1, GetAimList) of
	    {Aim, 1} ->
		Steps = [gl, take],
		NewGetAimList = lists:keystore(Aim, 1, GetAimList,
					       {Aim, 2}),
		Opts = #{aim => Aim, gain => AimRewards,
			 tv_val => {val, {LossAccList, NewGetAimList}}},
		holiday_rule:take_reward(Role, Holiday, Opts, Steps);
	    {Aim, 2} ->
		{error, lang:get(<<"Phần thưởng đã được nhận"/utf8>>)};
	    _ ->
		{error,
		 lang:get(<<"Không đáp ứng được các điều kiện để "
			    "nhận được phần thưởng"/utf8>>)}
	  end;
      _ ->
	  {error,
	   lang:get(<<"Không có cấu hình phần thưởng tương "
		      "ứng"/utf8>>)}
    end;
take(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = 1008, reward = [{_PackageId, Reward}]},
     Role = #role{pid = Pid}, Aim, _Args) ->
    {IsActivate, _GetAimList} =
	holiday_lib:get_tv_val(CampId, Bid, Role),
    case IsActivate > 0 of
      false ->
	  {error,
	   lang:get(<<"Bạn chỉ có thể nhận được nó sau khi "
		      "mua quỹ"/utf8>>)};
      _ ->
	  case lists:keyfind(Aim, 1, Reward) of
	    {Aim, Items, _AimStr} ->
		case holiday_rule:reward(Holiday, Role, Aim,
					 item_lib:merge(Items, []), #{})
		    of
		  Data = {ok, _, NRole = #role{}} ->
		      case holiday_rule:is_gain_reward(NRole, Holiday) of
			true -> role:redirect(Pid, 16601, {});
			_ -> ok
		      end,
		      Data;
		  Data2 -> Data2
		end;
	    _ ->
		{error,
		 lang:get(<<"Không có cấu hình phần thưởng tương "
			    "ứng"/utf8>>)}
	  end
    end;
take(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = 1009, reward = Reward},
     Role = #role{pid = Pid}, Aim, _Args) ->
    case lists:keyfind(Aim, 1, Reward) of
      {Aim, Max, _RmbL, _IdL, Items, _AimStr} ->
	  GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
	  case lists:keyfind(Aim, 1, GetAimList) of
	    {Aim, N1, _N2, _OutL} when N1 >= Max ->
		{error,
		 util:fbin(lang:get(<<"Đừng nhấp, mỗi giải thưởng có mức rút "
				      "thăm tối đa~wlần"/utf8>>),
			   [Max])};
	    {Aim, N1, N2, OutL} when N2 > 0 ->
		CanOutL = [{ItemBid, ItemNum, Rand, IsNotice}
			   || {ItemBid, ItemNum, Rand, CanOutNum, IsNotice,
			       OutMax}
				  <- Items,
			      N1 >= CanOutNum,
			      list_util:keyfind(ItemBid, OutL, 0) < OutMax],
		{ItemBid, ItemNum, _Rand, IsNotice} =
		    util:rand_list(CanOutL, 3),
		GL = format:val_to_gain([{ItemBid, ItemNum}],
					make_holiday),
		case role_gain:do(Role, GL) of
		  {false, #gain{msg = Msg}} -> {error, Msg};
		  {ok, Role1} ->
		      case IsNotice of
			1 ->
			    role:apply(async, Pid,
				       {2000, 3000, holiday_rule_charge,
					apply_broadcast,
					[#{bid => 1009, push_bid => Bid,
					   item_bid => ItemBid,
					   item_num => ItemNum}]});
			_ -> pass
		      end,
		      NewOutL = lists:keystore(ItemBid, 1, OutL,
					       {ItemBid,
						list_util:keyfind(ItemBid, OutL,
								  0)
						  + 1}),
		      NewGetAimList = lists:keyreplace(Aim, 1, GetAimList,
						       {Aim, N1 + 1, N2 - 1,
							NewOutL}),
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      NewRole = holiday_lib:set_tv_val(CampId, Role1,
						       NewGetAimList,
						       ExpireSec),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday_rule_charge866, _,
			 {__Levelholiday_rule_charge866,
			  __Tracesholiday_rule_charge866}}
			    when __Levelholiday_rule_charge866 band 128 /= 0
				   orelse
				   __Tracesholiday_rule_charge866 /= [] ->
			    lager:do_log(debug,
					 [{module, holiday_rule_charge},
					  {function, take}, {line, 866},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[~ts]领取活动[Bid:~w][CampId:~w]奖励[Aim:~w][timeou"
						       "t:~w]",
						       [Role#role.name, Bid,
							CampId, Aim,
							ExpireSec]),
					 none, 4096, 128,
					 __Levelholiday_rule_charge866,
					 __Tracesholiday_rule_charge866,
					 lager_event,
					 __Pidholiday_rule_charge866);
			_ -> ok
		      end,
		      holiday:push_bid_can_reward(NewRole, Bid),
		      holiday_ico:push_ico(NewRole, Holiday),
		      log:log_gain(GL, Role, NewRole, <<"运营活动_充值返利"/utf8>>,
				   util:fbin("活动:~w:~w:~w",
					     [Bid, CampId, Aim])),
		      sys_conn:pack_send(16610, {Bid, Aim, ItemBid}),
		      {ok, <<>>, NewRole}
		end;
	    _ ->
		{error, lang:get(<<"Không có bản vẽ nào có sẵn"/utf8>>)}
	  end;
      _ ->
	  {error,
	   lang:get(<<"Không có cấu hình phần thưởng tương "
		      "ứng"/utf8>>)}
    end;
take(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = TBid, reward = [{Reward, _Str}], title = Name},
     Role, Aim, _Args)
    when TBid == 1011 orelse
	   TBid == 1024 orelse
	     TBid == 1025 orelse TBid == 1027 orelse TBid == 1040 ->
    {Day, GetAimList} = holiday_lib:get_tv_val(CampId, Bid,
					       Role),
    case lists:keyfind(Aim, 1, GetAimList) of
      {Aim, 2} ->
	  {error, lang:get(<<"Phần thưởng đã được nhận"/utf8>>)};
      {Aim, 0} ->
	  {error,
	   lang:get(<<"Phần thưởng này không được kích hoạt"/utf8>>)};
      {Aim, 1} ->
	  case lists:keyfind(Aim, 1, Reward) of
	    {Aim, Items, _AimStr} ->
		Gain = format:val_to_gain(Items, holiday_partner),
		case role_gain:do_notice(Role, Gain) of
		  {ok, NRole} ->
		      log:log_gain(Gain, Role, NRole,
				   util:fbin(lang:get(<<"Hoạt động vận hành_~ts"/utf8>>),
					     [Name]),
				   util:fbin("活动:~w:~w:~w",
					     [Bid, CampId, Aim])),
		      NewList = lists:keystore(Aim, 1, GetAimList, {Aim, 2}),
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      NewRole = holiday_lib:set_tv_val(CampId, NRole,
						       {Day, NewList},
						       ExpireSec),
		      holiday_lib:push_holiday_one(NewRole, Bid),
		      holiday:push_bid_can_reward(NewRole, Bid),
		      {ok, <<>>, NewRole};
		  {false, #gain{msg = Msg}} -> {error, Msg}
		end;
	    _ ->
		{error,
		 lang:get(<<"Không có cấu hình phần thưởng tương "
			    "ứng"/utf8>>)}
	  end;
      _ ->
	  {error,
	   lang:get(<<"Phần thưởng này không được kích hoạt"/utf8>>)}
    end;
take(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = 1012, reward = Reward},
     Role, Aim, _Args) ->
    {DoNumList, GetAimList} = holiday_lib:get_tv_val(CampId,
						     Bid, Role),
    AwardNum = list_util:keyfind(Aim, GetAimList, 0),
    DoNum = list_util:keyfind(Aim, DoNumList, 0),
    case lists:keyfind(Aim, 1, Reward) of
      {Aim, _Min, _Max, _Items, _AimStr, _Limit}
	  when AwardNum =< 0 ->
	  {error,
	   lang:get(<<"Phần thưởng này không được kích hoạt"/utf8>>)};
      {Aim, _Min, _Max, _Items, _AimStr, Limit}
	  when DoNum >= Limit ->
	  {error,
	   lang:get(<<"Tất cả các phần thưởng đã được nhận"/utf8>>)};
      {Aim, _Min, _Max, Items, _AimStr, _Limit} ->
	  Gain = format:val_to_gain(Items, holiday_partner),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole} ->
		log:log_gain(Gain, Role, NRole, <<"运营活动_单笔充值"/utf8>>,
			     util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
		NewList = lists:keystore(Aim, 1, GetAimList,
					 {Aim, AwardNum - 1}),
		NewDoNumList = lists:keystore(Aim, 1, DoNumList,
					      {Aim, DoNum + 1}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole,
						 {NewDoNumList, NewList},
						 ExpireSec),
		holiday:push_bid_can_reward(NewRole, Bid),
		holiday_lib:push_holiday_one(NewRole, Bid),
		{ok, <<>>, NewRole};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      _ ->
	  {error,
	   lang:get(<<"Không có cấu hình phần thưởng tương "
		      "ứng"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = 1013}, Role, Aim,
     _Args) ->
    case holiday_rule:take(Holiday, Role, Aim, #{}) of
      {ok, _Msg, NewRole} -> {ok, <<>>, NewRole};
      {error, Msg} -> {error, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule_charge941, _,
	     {__Levelholiday_rule_charge941,
	      __Tracesholiday_rule_charge941}}
		when __Levelholiday_rule_charge941 band 8 /= 0 orelse
		       __Tracesholiday_rule_charge941 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule_charge}, {function, take},
			      {line, 941}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]无法领取奖励:~w",
					   [Role#role.name, Err]),
			     none, 4096, 8, __Levelholiday_rule_charge941,
			     __Tracesholiday_rule_charge941, lager_event,
			     __Pidholiday_rule_charge941);
	    _ -> ok
	  end,
	  {error, <<>>}
    end;
take(Holiday = #holiday{tbid = 1021}, Role, Aim,
     _Args) ->
    case holiday_rule:take(Holiday, Role, Aim, #{}) of
      {ok, _Msg, NewRole} -> {ok, <<>>, NewRole};
      {error, Msg} -> {error, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule_charge949, _,
	     {__Levelholiday_rule_charge949,
	      __Tracesholiday_rule_charge949}}
		when __Levelholiday_rule_charge949 band 8 /= 0 orelse
		       __Tracesholiday_rule_charge949 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule_charge}, {function, take},
			      {line, 949}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]无法领取奖励:~w",
					   [Role#role.name, Err]),
			     none, 4096, 8, __Levelholiday_rule_charge949,
			     __Tracesholiday_rule_charge949, lager_event,
			     __Pidholiday_rule_charge949);
	    _ -> ok
	  end,
	  {error, <<>>}
    end;
take(Holiday = #holiday{tbid = 1045,
			reward = [DefaultReward, ChannelReward]},
     Role = #role{reg_channel = RegChannel,
		  channel = Channel},
     Aim, _Args) ->
    Reward = case lists:keyfind(Channel, 1, ChannelReward)
		 of
	       {_, RewardT} when RegChannel == Channel -> RewardT;
	       _ -> DefaultReward
	     end,
    NewHoliday = Holiday#holiday{reward = Reward},
    case holiday_rule:take(NewHoliday, Role, Aim, #{}) of
      {ok, _Msg, NewRole} -> {ok, <<>>, NewRole};
      {error, Msg} -> {error, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule_charge962, _,
	     {__Levelholiday_rule_charge962,
	      __Tracesholiday_rule_charge962}}
		when __Levelholiday_rule_charge962 band 8 /= 0 orelse
		       __Tracesholiday_rule_charge962 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule_charge}, {function, take},
			      {line, 962}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]无法领取奖励:~w",
					   [Role#role.name, Err]),
			     none, 4096, 8, __Levelholiday_rule_charge962,
			     __Tracesholiday_rule_charge962, lager_event,
			     __Pidholiday_rule_charge962);
	    _ -> ok
	  end,
	  {error, <<>>}
    end;
take(Holiday = #holiday{tbid = TBid}, Role, Aim, _Args)
    when TBid =:= 1022 orelse
	   TBid =:= 1028 orelse
	     TBid =:= 1052 orelse TBid =:= 1054 ->
    case holiday_rule:take(Holiday, Role, Aim, #{}) of
      {ok, _Msg, NewRole} -> {ok, <<>>, NewRole};
      {error, Msg} -> {error, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule_charge970, _,
	     {__Levelholiday_rule_charge970,
	      __Tracesholiday_rule_charge970}}
		when __Levelholiday_rule_charge970 band 8 /= 0 orelse
		       __Tracesholiday_rule_charge970 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule_charge}, {function, take},
			      {line, 970}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]无法领取奖励:~w",
					   [Role#role.name, Err]),
			     none, 4096, 8, __Levelholiday_rule_charge970,
			     __Tracesholiday_rule_charge970, lager_event,
			     __Pidholiday_rule_charge970);
	    _ -> ok
	  end,
	  {error, <<>>}
    end;
take(Holiday = #holiday{tbid = 1023}, Role, Aim,
     _Args) ->
    case holiday_rule:take(Holiday, Role, Aim, #{}) of
      {ok, _Msg, NewRole} -> {ok, <<>>, NewRole};
      {error, Msg} -> {error, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule_charge978, _,
	     {__Levelholiday_rule_charge978,
	      __Tracesholiday_rule_charge978}}
		when __Levelholiday_rule_charge978 band 8 /= 0 orelse
		       __Tracesholiday_rule_charge978 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule_charge}, {function, take},
			      {line, 978}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]无法领取奖励:~w",
					   [Role#role.name, Err]),
			     none, 4096, 8, __Levelholiday_rule_charge978,
			     __Tracesholiday_rule_charge978, lager_event,
			     __Pidholiday_rule_charge978);
	    _ -> ok
	  end,
	  {error, <<>>}
    end;
take(Holiday = #holiday{tbid = 1036, camp_id = CampId,
			bid = Bid, reward = [_ExtraRate, Reward]},
     Role, Id, _Arg) ->
    {ShowCount, RealCount, RealDay, IsRedPoint,
     GetAimList} =
	holiday_lib:get_tv_val(CampId, Bid, Role),
    case lists:keyfind(Id, 1, GetAimList) of
      {_, 2} ->
	  {error, lang:get(<<"Phần thưởng đã được nhận"/utf8>>)};
      {_, 1} ->
	  case lists:keyfind(Id, 1, Reward) of
	    {_, _, _, Items} ->
		Gain = format:val_to_gain(Items,
					  holiday_charge_checkin),
		case role_gain:do_notice(Role, Gain) of
		  {ok, NRole} ->
		      log:log_gain(Gain, Role, NRole, <<"运营活动_连充签到"/utf8>>,
				   util:fbin("活动:~w:~w:~w", [Bid, CampId, Id])),
		      NewGetAimList = lists:keystore(Id, 1, GetAimList,
						     {Id, 2}),
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      NewRole = holiday_lib:set_tv_val(CampId, NRole,
						       {ShowCount, RealCount,
							RealDay, IsRedPoint,
							NewGetAimList},
						       ExpireSec),
		      holiday:push_bid_can_reward(NewRole, Bid),
		      holiday_lib:push_holiday_one(NewRole, Bid),
		      {ok, <<>>, NewRole};
		  {false, #gain{msg = Msg}} -> {error, Msg}
		end;
	    _ ->
		{error, lang:get(<<"Phần thưởng không tồn tại"/utf8>>)}
	  end;
      _ ->
	  {error,
	   lang:get(<<"Không thể yêu cầu phần thưởng này"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = TBid}, Role, Aim, _Args)
    when TBid =:= 1037 ->
    case holiday_rule:take(Holiday, Role, Aim, #{}) of
      {ok, _Msg, NewRole} -> {ok, <<>>, NewRole};
      {error, Msg} -> {error, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule_charge1013, _,
	     {__Levelholiday_rule_charge1013,
	      __Tracesholiday_rule_charge1013}}
		when __Levelholiday_rule_charge1013 band 8 /= 0 orelse
		       __Tracesholiday_rule_charge1013 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule_charge}, {function, take},
			      {line, 1013}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]无法领取奖励:~w",
					   [Role#role.name, Err]),
			     none, 4096, 8, __Levelholiday_rule_charge1013,
			     __Tracesholiday_rule_charge1013, lager_event,
			     __Pidholiday_rule_charge1013);
	    _ -> ok
	  end,
	  {error, <<>>}
    end;
take(Holiday = #holiday{tbid = TBid}, Role, Aim, _Args)
    when TBid =:= 1038 ->
    case holiday_rule:take(Holiday, Role, Aim, #{}) of
      {ok, _Msg, NewRole} -> {ok, <<>>, NewRole};
      {error, Msg} -> {error, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule_charge1021, _,
	     {__Levelholiday_rule_charge1021,
	      __Tracesholiday_rule_charge1021}}
		when __Levelholiday_rule_charge1021 band 8 /= 0 orelse
		       __Tracesholiday_rule_charge1021 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule_charge}, {function, take},
			      {line, 1021}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]无法领取奖励:~w",
					   [Role#role.name, Err]),
			     none, 4096, 8, __Levelholiday_rule_charge1021,
			     __Tracesholiday_rule_charge1021, lager_event,
			     __Pidholiday_rule_charge1021);
	    _ -> ok
	  end,
	  {error, <<>>}
    end;
take(Holiday = #holiday{tbid = TBid}, Role, Aim, _Args)
    when TBid =:= 1041 ->
    case holiday_rule:take(Holiday, Role, Aim, #{}) of
      {ok, _Msg, NewRole} -> {ok, <<>>, NewRole};
      {error, Msg} -> {error, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule_charge1029, _,
	     {__Levelholiday_rule_charge1029,
	      __Tracesholiday_rule_charge1029}}
		when __Levelholiday_rule_charge1029 band 8 /= 0 orelse
		       __Tracesholiday_rule_charge1029 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule_charge}, {function, take},
			      {line, 1029}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]无法领取奖励:~w",
					   [Role#role.name, Err]),
			     none, 4096, 8, __Levelholiday_rule_charge1029,
			     __Tracesholiday_rule_charge1029, lager_event,
			     __Pidholiday_rule_charge1029);
	    _ -> ok
	  end,
	  {error, <<>>}
    end;
take(Holiday = #holiday{bid = Bid}, Role, Aim, Arg) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule_charge1033, _,
       {__Levelholiday_rule_charge1033,
	__Tracesholiday_rule_charge1033}}
	  when __Levelholiday_rule_charge1033 band 8 /= 0 orelse
		 __Tracesholiday_rule_charge1033 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule_charge}, {function, take},
			{line, 1033}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]无法领取奖励[Bid:~w][Aim:~w][Arg:~w][Holiday:~w]",
				     [Role#role.name, Bid, Aim, Arg, Holiday]),
		       none, 4096, 8, __Levelholiday_rule_charge1033,
		       __Tracesholiday_rule_charge1033, lager_event,
		       __Pidholiday_rule_charge1033);
      _ -> ok
    end,
    {error, <<>>}.

apply_broadcast(Role,
		#{bid := 1009, push_bid := Bid, item_bid := ItemBid,
		  item_num := ItemNum}) ->
    Msg =
	color:msg(lang:get(<<"Hãy đến và hít thở năng lượng châu Âu，~tsTôi "
			     "đã nhận được một món quà quý giá trong "
			     "sự kiện nạp tiền.~ts。~ts"/utf8>>),
		  [Role, {item, {ItemBid, ItemNum}},
		   {href,
		    {45, green, [holiday_lib:get_holiday_type(Bid), Bid],
		     lang:get(<<"【Tôi muốn tham gia】"/utf8>>)}}]),
    notice:broadcast(48, Msg),
    ok;
apply_broadcast(_Role, _) -> ok.

-spec fire(#holiday{}, #role{}, tuple()) -> {ok,
					     #role{}}.

fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = 1003, reward = Reward},
     Role = #role{name = Name},
     #evt_pay{info =
		  Opt = #{sn := Sn, package_id := PackageId,
			  money := Money, currency_type := CurrencyType}}) ->
    case lists:keyfind(PackageId, 1, Reward) of
      {PackageId, RewardList} ->
	  {AccVal0, GetAimList} = holiday_lib:get_tv_val(CampId,
							 Bid, Role),
	  case AccVal0 > 0 of
	    false ->
		AccVal = 1,
		Fun = fun (I, L) ->
			      Aim = element(1, I),
			      case lists:keyfind(Aim, 1, GetAimList) of
				false when AccVal >= Aim -> [{Aim, 1} | L];
				false -> L;
				Temp -> [Temp | L]
			      end
		      end,
		NewGetAimList = lists:foldl(Fun, [], RewardList),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NRole = holiday_lib:set_tv_val(CampId, Role,
					       {AccVal, NewGetAimList},
					       ExpireSec),
		Gold = charge_lib:currency_to_gold(CurrencyType, Money),
		Evts = [#evt_pay{gold = Gold,
				 info =
				     #{gold => Gold, package_id => 0,
				       currency_type => rmb, money => 0,
				       sn => <<>>, data_mod => charge_data}},
			#evt_pay_acc{gold = Gold}, #evt_charge_invest{}],
		NewRole = role_trigger:fire(Evts, NRole),
		holiday:push_bid_can_reward(NewRole, Bid),
		holiday_lib:push_holiday_one(NewRole, Bid),
		log:save(custom,
			 {NewRole, <<"invest-plan">>,
			  [{msg, util:fbin(<<"投资计划激活:sn=~ts"/utf8>>, [Sn])}]}),
		notice:alert(lang:get(<<"Mua hàng thành công"/utf8>>)),
		notice:broadcast(rumor_left_top,
				 color:msg(lang:get(<<"~tsĐã kích hoạt<div fontcolor=#ffb400>Kế "
						      "hoạch đầu tư siêu giá trị</div>，7 liên "
						      "tiếpĐăng nhập mỗi ngày để nhận vàng "
						      "khủng, gấp 8 lần tiền hoàn vàng！~ts"/utf8>>),
					   [{role, Name},
					    {href,
					     {35, green, [Bid],
					      lang:get(<<"【Tôi muốn mua】"/utf8>>)}}])),
		{ok, NewRole};
	    _ ->
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"充值"/utf8>>,
			       util:fbin("投资充值:money=~w,sn=~ts package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole}
	  end;
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = 1005, reward = Reward, start_time = ST},
     Role, #evt_pay_acc{gold = Gold}) ->
    case Gold > 0 of
      true ->
	  Day = date:day_diff(ST, date:unixtime()) + 1,
	  DayPayAcc = var:get_list_val(Role, day, 36, CampId, 0),
	  {TypeDayList, TypeAccList} =
	      holiday_lib:get_tv_val(CampId, Bid, Role),
	  NewDayPayAcc = Gold + DayPayAcc,
	  CompFun = fun (Aim, CompVal, Target, TargetVal, Acc) ->
			    AimData = case lists:keyfind(Aim, 1, Acc) of
					false -> {Aim, 0, 0};
					TmpAimData -> TmpAimData
				      end,
			    case AimData of
			      {Aim, Count, 0} ->
				  case CompVal >= Target of
				    true ->
					NewCount = Count + 1,
					case NewCount >= TargetVal of
					  true ->
					      lists:keystore(Aim, 1, Acc,
							     {Aim, TargetVal,
							      1});
					  false ->
					      lists:keystore(Aim, 1, Acc,
							     {Aim, NewCount, 0})
					end;
				    false -> Acc
				  end;
			      _ -> Acc
			    end
		    end,
	  Fun = fun ({Aim, 1, Target, TargetVal, _AimRewards,
		      _AimStr},
		     {DayList, AccList}) ->
			GetL = case lists:keyfind(Day, 1, DayList) of
				 {Day, GetListVal} -> GetListVal;
				 _ -> []
			       end,
			NewGetL = CompFun(Aim, NewDayPayAcc, Target, TargetVal,
					  GetL),
			NewDayList = lists:keystore(Day, 1, TypeDayList,
						    {Day, NewGetL}),
			{NewDayList, AccList};
		    ({Aim, 2, Target, TargetVal, _AimRewards, _AimStr},
		     {DayList, AccList}) ->
			case NewDayPayAcc >= Target andalso DayPayAcc < Target
			    of
			  true ->
			      NewAccList = CompFun(Aim, NewDayPayAcc, Target,
						   TargetVal, AccList),
			      {DayList, NewAccList};
			  false -> {DayList, AccList}
			end;
		    (_, Ret) -> Ret
		end,
	  {NewTypeDayList, NewGetAimList} = lists:foldl(Fun,
							{TypeDayList,
							 TypeAccList},
							Reward),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  TvRole = holiday_lib:set_tv_val(CampId, Role,
					  {NewTypeDayList, NewGetAimList},
					  ExpireSec),
	  NewRole = var:set_list_val(TvRole, day, 36, CampId,
				     NewDayPayAcc),
	  holiday:push_bid_can_reward(NewRole, Bid),
	  holiday_lib:push_holiday_one(NewRole, Bid),
	  {ok, NewRole};
      false -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = TBid, reward = Reward},
     Role,
     #evt_pay{info =
		  Opt = #{sn := Sn, package_id := PackageId,
			  money := Money, currency_type := CurrencyType}})
    when TBid =:= 1006 orelse
	   TBid =:= 1026 orelse
	     TBid =:= 1035 orelse
	       TBid =:= 1039 orelse TBid == 1048 ->
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    case lists:keyfind(PackageId, 1, Reward) of
      {Aim, _Price, AimRewards, AccLimit, _AimStr, _OldPrice,
       _Sort} ->
	  case check_take_tbid_1006(Aim, GetAimList, 0, AccLimit)
	      of
	    {ok, DailyCount, AccCount} ->
		Steps = [gl, buy],
		NewGetAimList = lists:keystore(Aim, 1, GetAimList,
					       {Aim, DailyCount + 1,
						AccCount + 1}),
		Opts = #{aim => PackageId, gain => AimRewards,
			 tv_val => {val, NewGetAimList}, opt => Opt},
		{ok, NRole, _} = holiday_rule:buy_reward(Role, Holiday,
							 Opts, Steps),
		Gold = charge_lib:currency_to_gold(CurrencyType, Money),
		NewRole = role_trigger:fire(#evt_pay{gold = Gold,
						     info =
							 #{gold => Gold,
							   package_id => 0,
							   currency_type => rmb,
							   money => 0,
							   sn => <<>>,
							   data_mod =>
							       charge_data}},
					    NRole),
		holiday:push_bid_can_reward(NewRole, Bid),
		holiday_lib:push_holiday_one(NewRole, Bid),
		{ok, NewRole};
	    {error, Err} ->
		notice:alert(Err),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge1153, _,
		   {__Levelholiday_rule_charge1153,
		    __Tracesholiday_rule_charge1153}}
		      when __Levelholiday_rule_charge1153 band 128 /= 0 orelse
			     __Tracesholiday_rule_charge1153 /= [] ->
		      lager:do_log(debug,
				   [{module, holiday_rule_charge},
				    {function, fire}, {line, 1153},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]已激活或领取[Sn:~s][Packageid:~w]",
						 [Role#role.name, Sn,
						  PackageId]),
				   none, 4096, 128,
				   __Levelholiday_rule_charge1153,
				   __Tracesholiday_rule_charge1153, lager_event,
				   __Pidholiday_rule_charge1153);
		  _ -> ok
		end,
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"充值"/utf8>>,
			       util:fbin("限时礼包已充值:money=~w,sn=~ts package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole};
	    _Info ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge1158, _,
		   {__Levelholiday_rule_charge1158,
		    __Tracesholiday_rule_charge1158}}
		      when __Levelholiday_rule_charge1158 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge1158 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, fire}, {line, 1158},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("未知错误~w", [_Info]), none, 4096,
				   8, __Levelholiday_rule_charge1158,
				   __Tracesholiday_rule_charge1158, lager_event,
				   __Pidholiday_rule_charge1158);
		  _ -> ok
		end,
		{ok, Role}
	  end;
      {Aim, _Price, AimRewards, AccLimit, _AimStr,
       _OldPrice} ->
	  case check_take_tbid_1006(Aim, GetAimList, 0, AccLimit)
	      of
	    {ok, DailyCount, AccCount} ->
		Steps = [gl, buy],
		NewGetAimList = lists:keystore(Aim, 1, GetAimList,
					       {Aim, DailyCount + 1,
						AccCount + 1}),
		Opts = #{aim => PackageId, gain => AimRewards,
			 tv_val => {val, NewGetAimList}, opt => Opt},
		{ok, NRole, _} = holiday_rule:buy_reward(Role, Holiday,
							 Opts, Steps),
		Gold = charge_lib:currency_to_gold(CurrencyType, Money),
		NewRole = role_trigger:fire(#evt_pay{gold = Gold,
						     info =
							 #{gold => Gold,
							   package_id => 0,
							   currency_type => rmb,
							   money => 0,
							   sn => <<>>,
							   data_mod =>
							       charge_data}},
					    NRole),
		holiday:push_bid_can_reward(NewRole, Bid),
		holiday_lib:push_holiday_one(NewRole, Bid),
		{ok, NewRole};
	    {error, Err} ->
		notice:alert(Err),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge1175, _,
		   {__Levelholiday_rule_charge1175,
		    __Tracesholiday_rule_charge1175}}
		      when __Levelholiday_rule_charge1175 band 128 /= 0 orelse
			     __Tracesholiday_rule_charge1175 /= [] ->
		      lager:do_log(debug,
				   [{module, holiday_rule_charge},
				    {function, fire}, {line, 1175},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]已激活或领取[Sn:~s][Packageid:~w]",
						 [Role#role.name, Sn,
						  PackageId]),
				   none, 4096, 128,
				   __Levelholiday_rule_charge1175,
				   __Tracesholiday_rule_charge1175, lager_event,
				   __Pidholiday_rule_charge1175);
		  _ -> ok
		end,
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"充值"/utf8>>,
			       util:fbin("限时礼包已充值:money=~w,sn=~ts package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole};
	    _Info ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge1180, _,
		   {__Levelholiday_rule_charge1180,
		    __Tracesholiday_rule_charge1180}}
		      when __Levelholiday_rule_charge1180 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge1180 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, fire}, {line, 1180},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("未知错误~w", [_Info]), none, 4096,
				   8, __Levelholiday_rule_charge1180,
				   __Tracesholiday_rule_charge1180, lager_event,
				   __Pidholiday_rule_charge1180);
		  _ -> ok
		end,
		{ok, Role}
	  end;
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = 1007, reward = Reward},
     Role, #evt_loss_assets{id = AssetsId, val = Val}) ->
    case Val > 0 of
      true ->
	  {TypeLossAccList, TypeGetAimList} =
	      holiday_lib:get_tv_val(CampId, Bid, Role),
	  OldLoss = get_loss_tbid_1007(AssetsId, TypeLossAccList),
	  NewLossAccList = lists:keystore(AssetsId, 1,
					  TypeLossAccList,
					  {AssetsId, OldLoss + Val}),
	  Fun = fun ({Aim, AimAssetsId, AimLoss, _AimRewards,
		      _AimStr},
		     Acc) ->
			Loss = get_loss_tbid_1007(AimAssetsId, NewLossAccList),
			AimData = case lists:keyfind(Aim, 1, Acc) of
				    false -> {Aim, 0};
				    TmpAimData -> TmpAimData
				  end,
			case AimData of
			  {Aim, 0} ->
			      case Loss >= AimLoss of
				true -> lists:keystore(Aim, 1, Acc, {Aim, 1});
				_ -> Acc
			      end;
			  _ -> Acc
			end;
		    (_, Ret) -> Ret
		end,
	  NewGetAimList = lists:foldl(Fun, TypeGetAimList,
				      Reward),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NewRole = holiday_lib:set_tv_val(CampId, Role,
					   {NewLossAccList, NewGetAimList},
					   ExpireSec),
	  holiday:push_bid_can_reward(NewRole, Bid),
	  holiday_lib:push_holiday_one(NewRole, Bid),
	  {ok, NewRole};
      false -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = 1008, reward = Reward},
     Role = #role{name = Name, lev = NLev},
     #evt_pay{info =
		  Opt = #{sn := Sn, package_id := PackageId,
			  money := Money, currency_type := CurrencyType}}) ->
    case lists:keyfind(PackageId, 1, Reward) of
      {PackageId, RewardList} ->
	  {IsActivate0, GetAimList} =
	      holiday_lib:get_tv_val(CampId, Bid, Role),
	  case IsActivate0 > 0 of
	    false ->
		IsActivate = 1,
		Fun = fun (I, L) ->
			      Aim = element(1, I),
			      case lists:keyfind(Aim, 1, GetAimList) of
				false when NLev >= Aim -> [{Aim, 1} | L];
				false -> L;
				Temp -> [Temp | L]
			      end
		      end,
		NewGetAimList = lists:foldl(Fun, [], RewardList),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NRole = holiday_lib:set_tv_val(CampId, Role,
					       {IsActivate, NewGetAimList},
					       ExpireSec),
		Gold = charge_lib:currency_to_gold(CurrencyType, Money),
		Evts = [#evt_pay{gold = Gold,
				 info =
				     #{gold => Gold, package_id => 0,
				       currency_type => rmb, money => 0,
				       sn => <<>>, data_mod => charge_data}},
			#evt_pay_acc{gold = Gold}, #evt_charge_fund{}],
		NewRole = role_trigger:fire(Evts, NRole),
		holiday:push_bid_can_reward(NewRole, Bid),
		holiday_lib:push_holiday_one(NewRole, Bid),
		log:save(custom,
			 {NRole, <<"invest-plan">>,
			  [{msg, util:fbin(<<"成长基金激活:sn=~ts"/utf8>>, [Sn])}]}),
		notice:alert(lang:get(<<"Mua hàng thành công"/utf8>>)),
		notice:broadcast(rumor_left_top,
				 color:msg(lang:get(<<"~tsĐã kích hoạt<div fontcolor=#c26706>Quỹ "
						      "tăng trưởng</div>，Nâng cấp để nhận đượcNhận "
						      "một lượng lớn vàng, hoàn tiền gấp 30 "
						      "lần để giúp bạn phát triển！~ts"/utf8>>),
					   [{role, Name},
					    {href,
					     {35, green, [Bid],
					      lang:get(<<"【Tôi muốn mua】"/utf8>>)}}])),
		{ok, NewRole};
	    _ ->
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"充值"/utf8>>,
			       util:fbin("成长基金充值:money=~w,sn=~ts package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole}
	  end;
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = 1008, reward = [{_PackageId, Reward}]},
     Role = #role{}, #evt_levup{lev = NLev}) ->
    {IsActivate, GetAimList} =
	holiday_lib:get_tv_val(CampId, Bid, Role),
    Fun = fun (I, L) ->
		  Aim = element(1, I),
		  case lists:keyfind(Aim, 1, GetAimList) of
		    false when NLev >= Aim -> [{Aim, 1} | L];
		    false -> L;
		    Temp -> [Temp | L]
		  end
	  end,
    NewGetAimList = lists:foldl(Fun, [], Reward),
    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
    NRole = holiday_lib:set_tv_val(CampId, Role,
				   {IsActivate, NewGetAimList}, ExpireSec),
    holiday:push_bid_can_reward(NRole, Bid),
    holiday_lib:push_holiday_one(NRole, Bid),
    {ok, NRole};
fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = 1009, reward = Reward},
     Role = #role{},
     #evt_pay{info = #{package_id := PackageId}}) ->
    case [I
	  || I = {_Aim, _Max, _RmbL, IdL, _Items, _AimStr}
		 <- Reward,
	     lists:member(PackageId, IdL)]
	of
      [{Aim, Max, _RmbL, _IdL, _Items, _AimStr} | _] ->
	  GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
	  case lists:keyfind(Aim, 1, GetAimList) of
	    {Aim, HasNum, CanNum, _OutL}
		when HasNum + CanNum >= Max ->
		{ok, Role};
	    Ret ->
		NewGetAimList = case Ret of
				  false -> [{Aim, 0, 1, []} | GetAimList];
				  {Aim, HasNum, CanNum, OutL} ->
				      lists:keyreplace(Aim, 1, GetAimList,
						       {Aim, HasNum, CanNum + 1,
							OutL})
				end,
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NRole = holiday_lib:set_tv_val(CampId, Role,
					       NewGetAimList, ExpireSec),
		holiday:push_bid_can_reward(NRole, Bid),
		holiday_lib:push_holiday_one(NRole, Bid),
		{ok, NRole}
	  end;
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{tbid = TBid, camp_id = CampId,
			bid = Bid, reward = [{Reward, _}]},
     Role = #role{}, Evt)
    when (is_record(Evt, evt_levup) orelse
	    is_record(Evt, evt_zero_push) orelse
	      is_record(Evt, evt_cli_loaded))
	   andalso
	   (TBid == 1011 orelse
	      TBid == 1024 orelse
		TBid == 1025 orelse TBid == 1027 orelse TBid == 1040) ->
    {Day, GetAimList} = holiday_lib:get_tv_val(CampId, Bid,
					       Role),
    Flag = var:get_list_val(Role, day, 38, CampId, 0),
    IsExist = lists:keymember(Day + 1, 1, Reward),
    case Flag == 0 of
      false -> {ok, Role};
      _ ->
	  case lists:keyfind(Day + 1, 1, GetAimList) of
	    {_, 2} ->
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NRole = holiday_lib:set_tv_val(CampId, Role,
					       {Day + 1, GetAimList},
					       ExpireSec),
		NewRole = var:set_list_val(NRole, day, 38, CampId, 1),
		holiday:push_bid_can_reward(NewRole, Bid),
		holiday_lib:push_holiday_one(NewRole, Bid),
		{ok, NewRole};
	    {_, 1} -> {ok, Role};
	    _ when IsExist =:= false -> {ok, Role};
	    _ ->
		NewGetAimList = lists:keystore(Day + 1, 1, GetAimList,
					       {Day + 1, 1}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NRole = holiday_lib:set_tv_val(CampId, Role,
					       {Day + 1, NewGetAimList},
					       ExpireSec),
		NewRole = var:set_list_val(NRole, day, 38, CampId, 1),
		holiday:push_bid_can_reward(NewRole, Bid),
		holiday_lib:push_holiday_one(NewRole, Bid),
		{ok, NewRole}
	  end
    end;
fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = 1012, reward = Reward},
     Role = #role{},
     #evt_pay{info =
		  #{package_id := PackageId, money := Money}}) ->
    case charge_data:get(PackageId) of
      #charge_data{type = 0} ->
	  case [I
		|| I = {_Aim, Min, Max, _Items, _AimStr, _} <- Reward,
		   Money >= Min andalso Money =< Max]
	      of
	    [{Aim, _, _, _, _, Limit} | _] ->
		{DoNumList, GetAimList} = holiday_lib:get_tv_val(CampId,
								 Bid, Role),
		AwardNum = list_util:keyfind(Aim, GetAimList, 0),
		DoNum = list_util:keyfind(Aim, DoNumList, 0),
		case DoNum >= Limit of
		  true -> {ok, Role};
		  _ ->
		      NewGetAimList = lists:keystore(Aim, 1, GetAimList,
						     {Aim, AwardNum + 1}),
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      NRole = holiday_lib:set_tv_val(CampId, Role,
						     {DoNumList, NewGetAimList},
						     ExpireSec),
		      holiday:push_bid_can_reward(NRole, Bid),
		      holiday_lib:push_holiday_one(NRole, Bid),
		      {ok, NRole}
		end;
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{bid = Bid, tbid = 1013}, Role,
     #evt_pay{gold = Gold}) ->
    {ok, NRole} = holiday_rule:finish_by_acc_val_ge(Gold,
						    Holiday, Role),
    holiday_lib:push_holiday_one(NRole, Bid),
    {ok, NRole};
fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = 1014, reward = Reward},
     Role,
     #evt_pay{info =
		  Opt = #{sn := Sn, package_id := PackageId,
			  money := Money, currency_type := CurrencyType}}) ->
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    case lists:keyfind(PackageId, 1, Reward) of
      {PackageId, _OldPrice, _Price, AimRewards, _AimStr} ->
	  case lists:member(PackageId, GetAimList) of
	    false ->
		Steps = [gl, buy],
		NewGetAimList = [PackageId | GetAimList],
		Opts = #{aim => PackageId, gain => AimRewards,
			 tv_val => {val, NewGetAimList}, opt => Opt},
		{ok, NRole, _} = holiday_rule:buy_reward(Role, Holiday,
							 Opts, Steps),
		Gold = charge_lib:currency_to_gold(CurrencyType, Money),
		NewRole = role_trigger:fire(#evt_pay{gold = Gold,
						     info =
							 #{gold => Gold,
							   package_id => 0,
							   currency_type => rmb,
							   money => 0,
							   sn => <<>>,
							   data_mod =>
							       charge_data}},
					    NRole),
		{ok, NewRole};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge1367, _,
		   {__Levelholiday_rule_charge1367,
		    __Tracesholiday_rule_charge1367}}
		      when __Levelholiday_rule_charge1367 band 128 /= 0 orelse
			     __Tracesholiday_rule_charge1367 /= [] ->
		      lager:do_log(debug,
				   [{module, holiday_rule_charge},
				    {function, fire}, {line, 1367},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]已激活或领取[Sn:~s][Packageid:~w]",
						 [Role#role.name, Sn,
						  PackageId]),
				   none, 4096, 128,
				   __Levelholiday_rule_charge1367,
				   __Tracesholiday_rule_charge1367, lager_event,
				   __Pidholiday_rule_charge1367);
		  _ -> ok
		end,
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"充值"/utf8>>,
			       util:fbin("小额直购已充值:money=~w,sn=~ts package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole}
	  end;
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = TBid, reward = Reward},
     Role,
     #evt_pay{info =
		  Opt = #{sn := Sn, package_id := PackageId,
			  money := Money, currency_type := CurrencyType}})
    when TBid =:= 1015 orelse
	   TBid =:= 1016 orelse
	     TBid =:= 1017 orelse
	       TBid =:= 1018 orelse
		 TBid =:= 1019 orelse TBid =:= 1020 ->
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    case lists:keyfind(PackageId, 1, Reward) of
      {PackageId, _OldPrice, _Price, AimRewards, _AimStr} ->
	  case lists:member(PackageId, GetAimList) of
	    false ->
		Steps = [gl, buy],
		NewGetAimList = [PackageId | GetAimList],
		Opts = #{aim => PackageId, gain => AimRewards,
			 tv_val => {val, NewGetAimList}, opt => Opt},
		{ok, NRole, _} = holiday_rule:buy_reward(Role, Holiday,
							 Opts, Steps),
		Gold = charge_lib:currency_to_gold(CurrencyType, Money),
		NewRole = role_trigger:fire(#evt_pay{gold = Gold,
						     info =
							 #{gold => Gold,
							   package_id => 0,
							   currency_type => rmb,
							   money => 0,
							   sn => <<>>,
							   data_mod =>
							       charge_data}},
					    NRole),
		{ok, NewRole};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge1391, _,
		   {__Levelholiday_rule_charge1391,
		    __Tracesholiday_rule_charge1391}}
		      when __Levelholiday_rule_charge1391 band 128 /= 0 orelse
			     __Tracesholiday_rule_charge1391 /= [] ->
		      lager:do_log(debug,
				   [{module, holiday_rule_charge},
				    {function, fire}, {line, 1391},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]已激活或领取[Sn:~s][Packageid:~w]",
						 [Role#role.name, Sn,
						  PackageId]),
				   none, 4096, 128,
				   __Levelholiday_rule_charge1391,
				   __Tracesholiday_rule_charge1391, lager_event,
				   __Pidholiday_rule_charge1391);
		  _ -> ok
		end,
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"充值"/utf8>>,
			       util:fbin("小额直购已充值:money=~w,sn=~ts package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole}
	  end;
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = 1021, reward = Reward},
     Role, #evt_pay{info = #{money := Money}}) ->
    case Money > 0 of
      true ->
	  {Status, DayPayAcc} = var:get_list_val(Role, day, 44,
						 CampId, {0, 0}),
	  {TypeDay, TypeAccList} = holiday_lib:get_tv_val(CampId,
							  Bid, Role),
	  NewTypeDay = TypeDay + 1,
	  NewDayPayAcc = Money + DayPayAcc,
	  case lists:keyfind(NewTypeDay, 1, Reward) of
	    {NewTypeDay, NeedCharge, _, _}
		when Status == 0 andalso NewDayPayAcc >= NeedCharge ->
		NewTypeAccList = lists:keystore(NewTypeDay, 1,
						TypeAccList, {NewTypeDay, 1}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		TvRole = holiday_lib:set_tv_val(CampId, Role,
						{NewTypeDay, NewTypeAccList},
						ExpireSec),
		NewRole = var:set_list_val(TvRole, day, 44, CampId,
					   {1, NewDayPayAcc}),
		holiday:push_bid_can_reward(NewRole, Bid),
		holiday_lib:push_holiday_one(NewRole, Bid),
		{ok, NewRole};
	    _ -> {ok, Role}
	  end;
      false -> {ok, Role}
    end;
fire(Holiday = #holiday{bid = Bid, tbid = 1045,
			reward = [DefaultReward, ChannelReward]},
     Role = #role{reg_channel = RegChannel,
		  channel = Channel},
     #evt_pay{info = #{money := Money}}) ->
    NewMoney = util:uround(Money),
    Reward = case lists:keyfind(Channel, 1, ChannelReward)
		 of
	       {_, RewardT} when RegChannel == Channel -> RewardT;
	       _ -> DefaultReward
	     end,
    NewHoliday = Holiday#holiday{reward = Reward},
    {ok, NRole} =
	holiday_rule:finish_by_acc_val_ge(NewMoney, NewHoliday,
					  Role),
    holiday_lib:push_holiday_one(NRole, Bid),
    {ok, NRole};
fire(Holiday = #holiday{bid = Bid, tbid = TBid}, Role,
     #evt_pay{info = #{money := Money}})
    when TBid =:= 1022 orelse
	   TBid =:= 1028 orelse
	     TBid =:= 1052 orelse TBid =:= 1054 ->
    NewMoney = util:uround(Money),
    {ok, NRole} =
	holiday_rule:finish_by_acc_val_ge(NewMoney, Holiday,
					  Role),
    holiday_lib:push_holiday_one(NRole, Bid),
    {ok, NRole};
fire(Holiday = #holiday{bid = Bid, tbid = 1023}, Role,
     #evt_loss_assets{id = AssetsId, val = Val}) ->
    case AssetsId =:= 3 of
      true ->
	  NewVal = util:uround(Val),
	  {ok, NRole} = holiday_rule:finish_by_acc_val_ge(NewVal,
							  Holiday, Role),
	  holiday_lib:push_holiday_one(NRole, Bid),
	  {ok, NRole};
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId, tbid = Tbid,
			bid = Bid, reward = Reward},
     Role, #evt_pay{info = Opt = #{package_id := PackageId}})
    when Tbid == 1029 ->
    case lists:keyfind(PackageId, 2, Reward) of
      {Aim, _, LimitNum, _BuyPrice, _Price, Items, _AimStr,
       _GiftTitle} ->
	  GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
	  TargetVal = list_util:keyfind(Aim, GetAimList, 0),
	  case TargetVal >= LimitNum of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge1454, _,
		   {__Levelholiday_rule_charge1454,
		    __Tracesholiday_rule_charge1454}}
		      when __Levelholiday_rule_charge1454 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge1454 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, fire}, {line, 1454},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]直购礼包重复购买:~w",
						 [Role#role.name,
						  {CampId, PackageId}]),
				   none, 4096, 8,
				   __Levelholiday_rule_charge1454,
				   __Tracesholiday_rule_charge1454, lager_event,
				   __Pidholiday_rule_charge1454);
		  _ -> ok
		end,
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"运营活动_新服限购"/utf8>>,
			       util:fbin("运营活动_新服限购超出购买限制，改为充值:package_id=~w",
					 [PackageId])),
		{ok, NRole};
	    _ ->
		Gain = format:val_to_gain(Items,
					  hd_1029_charge_gift_buy),
		case role_gain:do_notice(Role, Gain) of
		  {ok, NRole} ->
		      log:log_gain(Gain, Role, NRole, <<"运营活动_新服限购"/utf8>>,
				   util:fbin("活动:~w:~w:~w",
					     [Bid, CampId, Aim])),
		      NewGetAimList = lists:keystore(Aim, 1, GetAimList,
						     {Aim, TargetVal + 1}),
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      NewRole = holiday_lib:set_tv_val(CampId, NRole,
						       NewGetAimList,
						       ExpireSec),
		      holiday_lib:push_holiday_one(NewRole, Bid),
		      {ok, NewRole};
		  _ -> {ok, Role}
		end
	  end;
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId, tbid = Tbid,
			bid = Bid, reward = Reward},
     Role, #evt_pay{info = Opt = #{package_id := PackageId}})
    when Tbid == 1030 orelse
	   Tbid == 1033 orelse Tbid == 1034 orelse Tbid == 1043 ->
    case lists:keyfind(PackageId, 2, Reward) of
      {Aim, PackageId, Items, LimitNum, _Price, _BuyPrice,
       _Discount, _AimStr} ->
	  GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
	  TargetVal = list_util:keyfind(Aim, GetAimList, 0),
	  case TargetVal >= LimitNum of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge1483, _,
		   {__Levelholiday_rule_charge1483,
		    __Tracesholiday_rule_charge1483}}
		      when __Levelholiday_rule_charge1483 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge1483 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, fire}, {line, 1483},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]51超值礼包重复购买:~w",
						 [Role#role.name,
						  {CampId, PackageId}]),
				   none, 4096, 8,
				   __Levelholiday_rule_charge1483,
				   __Tracesholiday_rule_charge1483, lager_event,
				   __Pidholiday_rule_charge1483);
		  _ -> ok
		end,
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole,
			       <<"运营活动_51神秘礼包"/utf8>>,
			       util:fbin("运营活动_51神秘礼包超出购买限制，改为充值:package_id=~w",
					 [PackageId])),
		{ok, NRole};
	    _ ->
		Gain = format:val_to_gain(Items,
					  hd_1029_charge_gift_buy),
		case role_gain:do_notice(Role, Gain) of
		  {ok, NRole} ->
		      log:log_gain(Gain, Role, NRole, <<"运营活动_51神秘礼包"/utf8>>,
				   util:fbin("活动:~w:~w:~w",
					     [Bid, CampId, Aim])),
		      NewGetAimList = lists:keystore(Aim, 1, GetAimList,
						     {Aim, TargetVal + 1}),
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      NewRole = holiday_lib:set_tv_val(CampId, NRole,
						       NewGetAimList,
						       ExpireSec),
		      holiday_lib:push_holiday_one(NewRole, Bid),
		      {ok, NewRole};
		  _ -> {ok, Role}
		end
	  end;
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId, tbid = Tbid,
			bid = Bid, reward = RewardT},
     Role = #role{lev = Lev},
     #evt_pay{info = Opt = #{package_id := PackageId}})
    when Tbid == 1051 ->
    {BuyLev, GetAimList} = holiday_lib:get_tv_val(CampId,
						  Bid, Role),
    UseLev = util:if_true(BuyLev == 0, Lev, BuyLev),
    Reward = lists:flatten([RewardTemp
			    || {LevMin, LevMax, RewardTemp} <- RewardT,
			       UseLev >= LevMin andalso UseLev < LevMax]),
    case lists:keyfind(PackageId, 2, Reward) of
      {Aim, PackageId, Items, LimitNum, _Price, _BuyPrice,
       _Discount, _AimStr} ->
	  TargetVal = list_util:keyfind(Aim, GetAimList, 0),
	  case TargetVal >= LimitNum of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge1514, _,
		   {__Levelholiday_rule_charge1514,
		    __Tracesholiday_rule_charge1514}}
		      when __Levelholiday_rule_charge1514 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge1514 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, fire}, {line, 1514},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]51超值礼包重复购买:~w",
						 [Role#role.name,
						  {CampId, PackageId}]),
				   none, 4096, 8,
				   __Levelholiday_rule_charge1514,
				   __Tracesholiday_rule_charge1514, lager_event,
				   __Pidholiday_rule_charge1514);
		  _ -> ok
		end,
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole,
			       <<"运营活动_51神秘礼包"/utf8>>,
			       util:fbin("运营活动_51神秘礼包超出购买限制，改为充值:package_id=~w",
					 [PackageId])),
		{ok, NRole};
	    _ ->
		Gain = format:val_to_gain(Items,
					  hd_1029_charge_gift_buy),
		case role_gain:do_notice(Role, Gain) of
		  {ok, NRole} ->
		      log:log_gain(Gain, Role, NRole, <<"运营活动_51神秘礼包"/utf8>>,
				   util:fbin("活动:~w:~w:~w",
					     [Bid, CampId, Aim])),
		      NewGetAimList = lists:keystore(Aim, 1, GetAimList,
						     {Aim, TargetVal + 1}),
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      NewRole = holiday_lib:set_tv_val(CampId, NRole,
						       {UseLev, NewGetAimList},
						       ExpireSec),
		      holiday_lib:push_holiday_one(NewRole, Bid),
		      {ok, NewRole};
		  _ -> {ok, Role}
		end
	  end;
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId, tbid = Tbid,
			bid = Bid, reward = Reward},
     Role, #evt_pay{info = Opt = #{package_id := PackageId}})
    when Tbid == 1032 ->
    case lists:keyfind(PackageId, 5, Reward) of
      {_, _, Items, _SkinId, PackageId, _OldPrice} ->
	  BuyNum = holiday_lib:get_tv_val(CampId, Bid, Role),
	  case BuyNum >= 1 of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge1541, _,
		   {__Levelholiday_rule_charge1541,
		    __Tracesholiday_rule_charge1541}}
		      when __Levelholiday_rule_charge1541 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge1541 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, fire}, {line, 1541},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]运营活动_风王皮肤直购重复购买:~w",
						 [Role#role.name,
						  {CampId, PackageId}]),
				   none, 4096, 8,
				   __Levelholiday_rule_charge1541,
				   __Tracesholiday_rule_charge1541, lager_event,
				   __Pidholiday_rule_charge1541);
		  _ -> ok
		end,
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole,
			       <<"运营活动_风王皮肤直购"/utf8>>,
			       util:fbin("运营活动_风王皮肤直购超出购买限制，改为充值:package_id=~w",
					 [PackageId])),
		{ok, NRole};
	    _ ->
		Gain = format:val_to_gain(Items,
					  hd_1029_charge_gift_buy),
		case role_gain:do_notice(Role, Gain) of
		  {ok, NRole} ->
		      log:log_gain(Gain, Role, NRole, <<"运营活动_风王皮肤直购"/utf8>>,
				   util:fbin("活动:~w:~w", [Bid, CampId])),
		      NewGetAimList = BuyNum + 1,
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      NewRole = holiday_lib:set_tv_val(CampId, NRole,
						       NewGetAimList,
						       ExpireSec),
		      holiday_lib:push_holiday_one(NewRole, Bid),
		      {ok, NewRole};
		  _ -> {ok, Role}
		end
	  end;
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			start_time = StartTime, reward = [ExtraRate, Reward],
			tbid = 1036},
     Role, #evt_pay{info = #{money := Money}}) ->
    NewMoney = util:uround(Money),
    case NewMoney > 0 of
      true ->
	  Now = date:unixtime(),
	  Day = date:day_diff(StartTime, Now) + 1,
	  IsCharge = var:get_var(Role, day, 86, 0),
	  IsSupply = var:get_var(Role, day, 82, 0),
	  {ShowCount, RealCount, RealDay, IsRedPoint,
	   GetAimList} =
	      holiday_lib:get_tv_val(CampId, Bid, Role),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NRealCount = RealCount + NewMoney,
	  Fun = fun ({Aim, LimitRmb, _, _},
		     {GetAimListT, RealCountT, RealDayT, IsChargeT,
		      IsSupplyT}) ->
			NewLimitRmb = if IsChargeT == 0 andalso
					   Aim == RealDayT + 1 ->
					     LimitRmb;
					 IsChargeT == 1 andalso
					   IsSupplyT == 0 andalso
					     Day >= Aim andalso
					       Aim == RealDayT + 1 ->
					     util:round(ExtraRate / 1000 *
							  LimitRmb);
					 true -> 9999999
				      end,
			case lists:keyfind(Aim, 1, GetAimListT) of
			  false when RealCountT >= NewLimitRmb ->
			      NGetAimListT = lists:keystore(Aim, 1, GetAimListT,
							    {Aim, 1}),
			      NIsChargeT = util:if_true(IsChargeT == 0, 1,
							IsChargeT),
			      NIsSupplyT = util:if_true(IsChargeT == 1, 1,
							IsSupplyT),
			      {NGetAimListT, RealCountT - NewLimitRmb,
			       RealDayT + 1, NIsChargeT, NIsSupplyT};
			  _ ->
			      {GetAimListT, RealCountT, RealDayT, IsChargeT,
			       IsSupplyT}
			end
		end,
	  {NewGetAimList, NewRealCount, NewRealDay, NewIsCharge,
	   NewIsSupply} =
	      lists:foldl(Fun,
			  {GetAimList, NRealCount, RealDay, IsCharge, IsSupply},
			  Reward),
	  Role1 = var:set_var(Role, day, 86, NewIsCharge),
	  Role2 = var:set_var(Role1, day, 82, NewIsSupply),
	  NewRole = holiday_lib:set_tv_val(CampId, Role2,
					   {ShowCount + NewMoney, NewRealCount,
					    NewRealDay, IsRedPoint,
					    NewGetAimList},
					   ExpireSec),
	  holiday:push_bid_can_reward(NewRole, Bid),
	  holiday_lib:push_holiday_one(NewRole, Bid),
	  {ok, NewRole};
      false -> {ok, Role}
    end;
fire(Holiday = #holiday{bid = Bid, tbid = TBid}, Role,
     #evt_high_recruit{count = Times})
    when TBid =:= 1037 ->
    {ok, NRole} = holiday_rule:finish_by_acc_val_ge(Times,
						    Holiday, Role),
    holiday_lib:push_holiday_one(NRole, Bid),
    {ok, NRole};
fire(Holiday = #holiday{bid = Bid, tbid = TBid}, Role,
     #evt_recruit_high_gift{count = Times})
    when TBid =:= 1038 ->
    {ok, NRole} = holiday_rule:finish_by_acc_val_ge(Times,
						    Holiday, Role),
    holiday_lib:push_holiday_one(NRole, Bid),
    {ok, NRole};
fire(Holiday = #holiday{bid = Bid, tbid = TBid}, Role,
     #evt_pay{info = #{money := Money}})
    when TBid =:= 1041 ->
    NewMoney = case Money >= 6 of
		 true -> util:uround(Money);
		 _ -> 0
	       end,
    {ok, NRole} =
	holiday_rule:finish_by_acc_val_ge(NewMoney, Holiday,
					  Role),
    holiday_lib:push_holiday_one(NRole, Bid),
    {ok, NRole};
fire(Holiday = #holiday{camp_id = CampId, tbid = Tbid,
			bid = Bid, reward = Reward},
     Role, #evt_pay{info = Opt = #{package_id := PackageId}})
    when Tbid == 1042 orelse Tbid == 1049 ->
    case lists:keyfind(PackageId, 2, Reward) of
      {Aim, PackageId, Items, LimitNum, _Price, _BuyPrice,
       _Discount, _Lable, _AimStr} ->
	  GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
	  TargetVal = list_util:keyfind(Aim, GetAimList, 0),
	  case TargetVal >= LimitNum of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge1626, _,
		   {__Levelholiday_rule_charge1626,
		    __Tracesholiday_rule_charge1626}}
		      when __Levelholiday_rule_charge1626 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge1626 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, fire}, {line, 1626},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]51超值礼包重复购买:~w",
						 [Role#role.name,
						  {CampId, PackageId}]),
				   none, 4096, 8,
				   __Levelholiday_rule_charge1626,
				   __Tracesholiday_rule_charge1626, lager_event,
				   __Pidholiday_rule_charge1626);
		  _ -> ok
		end,
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole,
			       <<"运营活动_51神秘礼包"/utf8>>,
			       util:fbin("运营活动_51神秘礼包超出购买限制，改为充值:package_id=~w",
					 [PackageId])),
		{ok, NRole};
	    _ ->
		Gain = format:val_to_gain(Items,
					  hd_1042_charge_gift_buy),
		case role_gain:do_notice(Role, Gain) of
		  {ok, NRole} ->
		      log:log_gain(Gain, Role, NRole, <<"运营活动_51神秘礼包"/utf8>>,
				   util:fbin("活动:~w:~w:~w",
					     [Bid, CampId, Aim])),
		      NewGetAimList = lists:keystore(Aim, 1, GetAimList,
						     {Aim, TargetVal + 1}),
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      NewRole = holiday_lib:set_tv_val(CampId, NRole,
						       NewGetAimList,
						       ExpireSec),
		      holiday_lib:push_holiday_one(NewRole, Bid),
		      {ok, NewRole};
		  _ -> {ok, Role}
		end
	  end;
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId, tbid = Tbid,
			bid = Bid, reward = Reward},
     Role, #evt_pay{info = Opt = #{package_id := PackageId}})
    when Tbid == 1046 ->
    case lists:keyfind(PackageId, 5, Reward) of
      {_, _, Items, _SkinId, PackageId, _OldPrice} ->
	  BuyNum = holiday_lib:get_tv_val(CampId, Bid, Role),
	  case BuyNum >= 1 of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge1653, _,
		   {__Levelholiday_rule_charge1653,
		    __Tracesholiday_rule_charge1653}}
		      when __Levelholiday_rule_charge1653 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge1653 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, fire}, {line, 1653},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]运营活动_风王皮肤直购重复购买:~w",
						 [Role#role.name,
						  {CampId, PackageId}]),
				   none, 4096, 8,
				   __Levelholiday_rule_charge1653,
				   __Tracesholiday_rule_charge1653, lager_event,
				   __Pidholiday_rule_charge1653);
		  _ -> ok
		end,
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole,
			       <<"运营活动_特殊风王皮肤直购"/utf8>>,
			       util:fbin("运营活动_3-7风王皮肤直购超出购买限制，改为充值:package_id=~w",
					 [PackageId])),
		{ok, NRole};
	    _ ->
		Gain = format:val_to_gain(Items,
					  hd_1046_rmb_charge_skin_special),
		case role_gain:do_notice(Role, Gain) of
		  {ok, NRole} ->
		      log:log_gain(Gain, Role, NRole,
				   <<"运营活动_特殊风王皮肤直购"/utf8>>,
				   util:fbin("活动:~w:~w", [Bid, CampId])),
		      NewGetAimList = BuyNum + 1,
		      ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		      NewRole = holiday_lib:set_tv_val(CampId, NRole,
						       NewGetAimList,
						       ExpireSec),
		      holiday_lib:push_holiday_one(NewRole, Bid),
		      {ok, NewRole};
		  _ -> {ok, Role}
		end
	  end;
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId, bid = Bid,
			tbid = TBid, reward = [Reward, _]},
     Role,
     #evt_pay{info =
		  Opt = #{sn := Sn, package_id := PackageId,
			  money := Money, currency_type := CurrencyType}})
    when TBid == 1053 ->
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    case lists:keyfind(PackageId, 1, Reward) of
      {Aim, _Price, AimRewards, AccLimit, _AimStr, _OldPrice,
       _Sort} ->
	  case check_take_tbid_1006(Aim, GetAimList, 0, AccLimit)
	      of
	    {ok, DailyCount, AccCount} ->
		Steps = [gl, buy],
		NewGetAimList = lists:keystore(Aim, 1, GetAimList,
					       {Aim, DailyCount + 1,
						AccCount + 1}),
		Opts = #{aim => PackageId, gain => AimRewards,
			 tv_val => {val, NewGetAimList}, opt => Opt},
		{ok, NRole, _} = holiday_rule:buy_reward(Role, Holiday,
							 Opts, Steps),
		Gold = charge_lib:currency_to_gold(CurrencyType, Money),
		NewRole = role_trigger:fire(#evt_pay{gold = Gold,
						     info =
							 #{gold => Gold,
							   package_id => 0,
							   currency_type => rmb,
							   money => 0,
							   sn => <<>>,
							   data_mod =>
							       charge_data}},
					    NRole),
		holiday:push_bid_can_reward(NewRole, Bid),
		holiday_lib:push_holiday_one(NewRole, Bid),
		{ok, NewRole};
	    {error, Err} ->
		notice:alert(Err),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge1692, _,
		   {__Levelholiday_rule_charge1692,
		    __Tracesholiday_rule_charge1692}}
		      when __Levelholiday_rule_charge1692 band 128 /= 0 orelse
			     __Tracesholiday_rule_charge1692 /= [] ->
		      lager:do_log(debug,
				   [{module, holiday_rule_charge},
				    {function, fire}, {line, 1692},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]已激活或领取[Sn:~s][Packageid:~w]",
						 [Role#role.name, Sn,
						  PackageId]),
				   none, 4096, 128,
				   __Levelholiday_rule_charge1692,
				   __Tracesholiday_rule_charge1692, lager_event,
				   __Pidholiday_rule_charge1692);
		  _ -> ok
		end,
		{ok, NRole, _} = charge_lib:to_gold(Role, Opt),
		log:log_assets(gold, Role, NRole, <<"充值"/utf8>>,
			       util:fbin("限时礼包已充值:money=~w,sn=~ts package_id=~w",
					 [Money, Sn, PackageId])),
		{ok, NRole};
	    _Info ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_charge1697, _,
		   {__Levelholiday_rule_charge1697,
		    __Tracesholiday_rule_charge1697}}
		      when __Levelholiday_rule_charge1697 band 8 /= 0 orelse
			     __Tracesholiday_rule_charge1697 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_rule_charge},
				    {function, fire}, {line, 1697},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("未知错误~w", [_Info]), none, 4096,
				   8, __Levelholiday_rule_charge1697,
				   __Tracesholiday_rule_charge1697, lager_event,
				   __Pidholiday_rule_charge1697);
		  _ -> ok
		end,
		{ok, Role}
	  end;
      _ -> {ok, Role}
    end;
fire(Holiday, Role, _Evt) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule_charge1704, _,
       {__Levelholiday_rule_charge1704,
	__Tracesholiday_rule_charge1704}}
	  when __Levelholiday_rule_charge1704 band 8 /= 0 orelse
		 __Tracesholiday_rule_charge1704 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule_charge}, {function, fire},
			{line, 1704}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]处理活动~w失败:~w",
				     [Role#role.name, Holiday, _Evt]),
		       none, 4096, 8, __Levelholiday_rule_charge1704,
		       __Tracesholiday_rule_charge1704, lager_event,
		       __Pidholiday_rule_charge1704);
      _ -> ok
    end,
    {ok, Role}.

-spec zero_flush(#role{}, #holiday{}) -> #role{}.

zero_flush(Role = #role{},
	   Holiday = #holiday{tbid = 1003, camp_id = CampId,
			      bid = Bid, reward = [{_PackageId, Reward}]}) ->
    {AccVal0, GetAimList} = holiday_lib:get_tv_val(CampId,
						   Bid, Role),
    case AccVal0 > 0 of
      false -> Role;
      _ ->
	  AccVal = AccVal0 + 1,
	  Fun = fun (I, L) ->
			Aim = element(1, I),
			case lists:keyfind(Aim, 1, GetAimList) of
			  false when AccVal =:= Aim -> [{Aim, 1} | L];
			  false -> L;
			  Temp -> [Temp | L]
			end
		end,
	  NewGetAimList = lists:foldl(Fun, [], Reward),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NRole = holiday_lib:set_tv_val(CampId, Role,
					 {AccVal, NewGetAimList}, ExpireSec),
	  holiday:push_bid_can_reward(NRole, Bid),
	  NRole
    end;
zero_flush(Role = #role{id = Rid},
	   Holiday = #holiday{title = Title, tbid = 1005,
			      camp_id = CampId, bid = Bid, end_time = EndTime,
			      reward = Rewards, start_time = ST}) ->
    Now = date:unixtime(),
    PassDay = date:day_diff(ST, Now),
    {TypeDayList, TypeAccList} =
	holiday_lib:get_tv_val(CampId, Bid, Role),
    RewardFun = fun ({Day, DayReward},
		     {Aim, AimRewards, DayList, AccReward}) ->
			case Day =< PassDay of
			  true ->
			      case lists:keyfind(Aim, 1, DayReward) of
				{Aim, Count, 1} ->
				    NewDayReward = lists:keystore(Aim, 1,
								  DayReward,
								  {Aim, Count,
								   2}),
				    NewDayList = lists:keystore(Day, 1, DayList,
								{Day,
								 NewDayReward}),
				    Reward = list_util:keyfind(Day, AimRewards,
							       []),
				    {Aim, AimRewards, NewDayList,
				     Reward ++ AccReward};
				_ -> {Aim, AimRewards, DayList, AccReward}
			      end;
			  _ -> {Aim, AimRewards, DayList, AccReward}
			end;
		    ({AimId, Count, 1},
		     {Aim, AimRewards, AccList, AccReward}) ->
			case Now > EndTime andalso AimId =:= Aim of
			  true ->
			      NewAccList = lists:keystore(AimId, 1, AccList,
							  {AimId, Count, 2}),
			      {Aim, AimRewards, NewAccList,
			       AimRewards ++ AccReward};
			  _ -> {Aim, AimRewards, AccList, AccReward}
			end;
		    (_, Ret) -> Ret
		end,
    Fun = fun ({Aim, 1, _Target, _TargetVal, AimRewards,
		_AimStr},
	       {DayList, AccList, RewardList}) ->
		  {_, _, NewDayList, NewRewardList} =
		      lists:foldl(RewardFun,
				  {Aim, AimRewards, DayList, RewardList},
				  DayList),
		  {NewDayList, AccList, NewRewardList};
	      ({Aim, 2, _Target, _TargetVal, AimRewards, _AimStr},
	       {DayList, AccList, RewardList}) ->
		  {_, _, NewAccList, NewRewardList} =
		      lists:foldl(RewardFun,
				  {Aim, AimRewards, AccList, RewardList},
				  AccList),
		  {DayList, NewAccList, NewRewardList};
	      (_, Ret) -> Ret
	  end,
    {NewTypeDayList, NewGetAimList, GetRewards} =
	lists:foldl(Fun, {TypeDayList, TypeAccList, []},
		    Rewards),
    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
    NewRole = holiday_lib:set_tv_val(CampId, Role,
				     {NewTypeDayList, NewGetAimList},
				     ExpireSec),
    case GetRewards of
      [] -> ok;
      _ ->
	  {Assets, Items} = format:split_assets_items(GetRewards),
	  Mail =
	      {util:fbin(lang:get(<<"~tsPhát hành lại phần thưởng"/utf8>>),
			 [Title]),
	       color:msg(lang:get(<<"Quý nhẫn giả：\nĐây là của bạn~tsPhần "
				    "thưởng chưa nhận từ sự kiện. Vui lòng "
				    "kiểm tra"/utf8>>),
			 [{green, Title}]),
	       Assets, Items,
	       lang:get(<<"Hoạt động bổ sung nạp đầu và nạp liên "
			  "tiếp"/utf8>>)},
	  mail:send(Rid, Mail)
    end,
    holiday:push_bid_can_reward(NewRole, Bid),
    holiday_lib:push_holiday_one(NewRole, Bid),
    NewRole;
zero_flush(Role = #role{},
	   Holiday = #holiday{tbid = TBid, camp_id = CampId,
			      bid = Bid})
    when TBid =:= 1006 orelse
	   TBid =:= 1026 orelse
	     TBid =:= 1035 orelse
	       TBid =:= 1039 orelse TBid == 1048 orelse TBid == 1053 ->
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    NewGetAimList = [{Aim, 0, AccLimit}
		     || {Aim, _, AccLimit} <- GetAimList],
    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
    NRole = holiday_lib:set_tv_val(CampId, Role,
				   NewGetAimList, ExpireSec),
    NRole;
zero_flush(Role = #role{id = Rid},
	   Holiday = #holiday{title = Title, tbid = 1021,
			      camp_id = CampId, bid = Bid, reward = Rewards}) ->
    {TypeDay, TypeAccList} = holiday_lib:get_tv_val(CampId,
						    Bid, Role),
    Fun = fun ({Aim, _, Award, _}, {Acc1, Acc2}) ->
		  case lists:keyfind(Aim, 1, Acc1) of
		    {Aim, 1} ->
			{lists:keyreplace(Aim, 1, Acc1, {Aim, 2}),
			 Award ++ Acc2};
		    _ -> {Acc1, Acc2}
		  end
	  end,
    {NewTypeAccList, GetRewards} = lists:foldl(Fun,
					       {TypeAccList, []}, Rewards),
    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
    NewRole = holiday_lib:set_tv_val(CampId, Role,
				     {TypeDay, NewTypeAccList}, ExpireSec),
    case GetRewards of
      [] -> ok;
      _ ->
	  {Assets, Items} = format:split_assets_items(GetRewards),
	  Mail =
	      {util:fbin(lang:get(<<"~tsPhát hành lại phần thưởng"/utf8>>),
			 [Title]),
	       color:msg(lang:get(<<"Quý nhẫn giả：\nĐây là của bạn~tsPhần "
				    "thưởng chưa nhận từ sự kiện. Vui lòng "
				    "kiểm tra"/utf8>>),
			 [{green, Title}]),
	       Assets, Items,
	       lang:get(<<"Hoạt động bổ sung nạp đầu và nạp liên "
			  "tiếp"/utf8>>)},
	  mail:send(Rid, Mail)
    end,
    holiday:push_bid_can_reward(NewRole, Bid),
    holiday_lib:push_holiday_one(NewRole, Bid),
    NewRole;
zero_flush(Role = #role{reg_channel = RegChannel,
			channel = Channel},
	   Holiday = #holiday{title = Title, end_time = EndTime,
			      tbid = 1045, camp_id = CampId, bid = Bid,
			      reward = [DefaultReward, ChannelReward]}) ->
    {AccVal, GetAimList} = holiday_lib:get_tv_val(CampId,
						  Bid, Role),
    Now = date:unixtime(),
    Rewards = case lists:keyfind(Channel, 1, ChannelReward)
		  of
		{_, RewardT} when RegChannel == Channel -> RewardT;
		_ -> DefaultReward
	      end,
    case Now >= EndTime of
      false -> Role;
      _ ->
	  Fun = fun ({Aim, Award, _}, {Acc1, Acc2}) ->
			case lists:keyfind(Aim, 1, Acc1) of
			  {Aim, 1} ->
			      {lists:keyreplace(Aim, 1, Acc1, {Aim, 2}),
			       Award ++ Acc2};
			  _ -> {Acc1, Acc2}
			end
		end,
	  {NewGetAimList, GetRewards} = lists:foldl(Fun,
						    {GetAimList, []}, Rewards),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NRole = holiday_lib:set_tv_val(CampId, Role,
					 {AccVal, NewGetAimList}, ExpireSec),
	  NewRole = case GetRewards of
		      [] -> NRole;
		      _ ->
			  {Assets, Items} =
			      format:split_assets_items(GetRewards),
			  {ok, NewRoleT} = mail:add(NRole,
						    {util:fbin(lang:get(<<"~tsPhát hành lại phần thưởng"/utf8>>),
							       [Title]),
						     color:msg(lang:get(<<"Quý nhẫn giả：\nĐây là của bạn~tsPhần "
									  "thưởng chưa nhận từ sự kiện. Vui lòng "
									  "kiểm tra"/utf8>>),
							       [{green,
								 Title}]),
						     Assets, Items,
						     lang:get(<<"Bổ sung nạp tích lũy"/utf8>>),
						     86400 + date:unixtime()}),
			  NewRoleT
		    end,
	  NewRole
    end;
zero_flush(Role,
	   Holiday = #holiday{title = Title, end_time = EndTime,
			      tbid = TBid, camp_id = CampId, bid = Bid,
			      reward = Rewards})
    when TBid =:= 1022 orelse
	   TBid =:= 1028 orelse
	     TBid =:= 1052 orelse TBid =:= 1054 ->
    {AccVal, GetAimList} = holiday_lib:get_tv_val(CampId,
						  Bid, Role),
    Now = date:unixtime(),
    case Now >= EndTime of
      false -> Role;
      _ ->
	  Fun = fun ({Aim, Award, _}, {Acc1, Acc2}) ->
			case lists:keyfind(Aim, 1, Acc1) of
			  {Aim, 1} ->
			      {lists:keyreplace(Aim, 1, Acc1, {Aim, 2}),
			       Award ++ Acc2};
			  _ -> {Acc1, Acc2}
			end
		end,
	  {NewGetAimList, GetRewards} = lists:foldl(Fun,
						    {GetAimList, []}, Rewards),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NRole = holiday_lib:set_tv_val(CampId, Role,
					 {AccVal, NewGetAimList}, ExpireSec),
	  NewRole = case GetRewards of
		      [] -> NRole;
		      _ ->
			  {Assets, Items} =
			      format:split_assets_items(GetRewards),
			  {ok, NewRoleT} = mail:add(NRole,
						    {util:fbin(lang:get(<<"~tsPhát hành lại phần thưởng"/utf8>>),
							       [Title]),
						     color:msg(lang:get(<<"Quý nhẫn giả：\nĐây là của bạn~tsPhần "
									  "thưởng chưa nhận từ sự kiện. Vui lòng "
									  "kiểm tra"/utf8>>),
							       [{green,
								 Title}]),
						     Assets, Items,
						     lang:get(<<"Bổ sung nạp tích lũy"/utf8>>),
						     86400 + date:unixtime()}),
			  NewRoleT
		    end,
	  NewRole
    end;
zero_flush(Role,
	   Holiday = #holiday{title = Title, tbid = 1036,
			      end_time = EndTime, camp_id = CampId, bid = Bid,
			      reward = [_, Rewards]}) ->
    Now = date:unixtime(),
    {_ShowCount, _RealCount, RealDay, IsRedPoint,
     GetAimList} =
	holiday_lib:get_tv_val(CampId, Bid, Role),
    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
    case Now >= EndTime of
      false ->
	  NewRole = holiday_lib:set_tv_val(CampId, Role,
					   {0, 0, RealDay, IsRedPoint,
					    GetAimList},
					   ExpireSec),
	  holiday_lib:push_holiday_one(NewRole, Bid),
	  NewRole;
      _ ->
	  Fun = fun ({Aim, _, _, Award}, {Acc1, Acc2}) ->
			case lists:keyfind(Aim, 1, Acc1) of
			  {Aim, 1} ->
			      {lists:keyreplace(Aim, 1, Acc1, {Aim, 2}),
			       Award ++ Acc2};
			  _ -> {Acc1, Acc2}
			end
		end,
	  {NewGetAimList, GetRewards} = lists:foldl(Fun,
						    {GetAimList, []}, Rewards),
	  NRole = holiday_lib:set_tv_val(CampId, Role,
					 {0, 0, RealDay, IsRedPoint,
					  NewGetAimList},
					 ExpireSec),
	  NewRole = case GetRewards of
		      [] -> NRole;
		      _ ->
			  {Assets, Items} =
			      format:split_assets_items(GetRewards),
			  {ok, NewRoleT} = mail:add(NRole,
						    {util:fbin(lang:get(<<"~tsPhát hành lại phần thưởng"/utf8>>),
							       [Title]),
						     color:msg(lang:get(<<"Quý nhẫn giả：\nĐây là của bạn~tsPhần "
									  "thưởng chưa nhận từ sự kiện. Vui lòng "
									  "kiểm tra"/utf8>>),
							       [{green,
								 Title}]),
						     Assets, Items,
						     lang:get(<<"Cấp lại sau khi nạp tiền liên tục và "
								"đăng nhập"/utf8>>),
						     86400 + date:unixtime()}),
			  NewRoleT
		    end,
	  NewRole
    end;
zero_flush(Role,
	   Holiday = #holiday{title = Title, end_time = EndTime,
			      tbid = TBid, camp_id = CampId, bid = Bid,
			      reward = Rewards})
    when TBid =:= 1037 ->
    {AccVal, GetAimList} = holiday_lib:get_tv_val(CampId,
						  Bid, Role),
    Now = date:unixtime(),
    case Now >= EndTime of
      false -> Role;
      _ ->
	  Fun = fun ({Aim, Award, _}, {Acc1, Acc2}) ->
			case lists:keyfind(Aim, 1, Acc1) of
			  {Aim, 1} ->
			      {lists:keyreplace(Aim, 1, Acc1, {Aim, 2}),
			       Award ++ Acc2};
			  _ -> {Acc1, Acc2}
			end
		end,
	  {NewGetAimList, GetRewards} = lists:foldl(Fun,
						    {GetAimList, []}, Rewards),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NRole = holiday_lib:set_tv_val(CampId, Role,
					 {AccVal, NewGetAimList}, ExpireSec),
	  NewRole = case GetRewards of
		      [] -> NRole;
		      _ ->
			  {Assets, Items} =
			      format:split_assets_items(GetRewards),
			  {ok, NewRoleT} = mail:add(NRole,
						    {util:fbin(lang:get(<<"~tsPhát hành lại phần thưởng"/utf8>>),
							       [Title]),
						     color:msg(lang:get(<<"Quý nhẫn giả：\nĐây là của bạn~tsPhần "
									  "thưởng chưa nhận từ sự kiện. Vui lòng "
									  "kiểm tra"/utf8>>),
							       [{green,
								 Title}]),
						     Assets, Items,
						     lang:get(<<"Bổ sung nạp tích lũy"/utf8>>),
						     86400 + date:unixtime()}),
			  NewRoleT
		    end,
	  NewRole
    end;
zero_flush(Role,
	   Holiday = #holiday{title = Title, end_time = EndTime,
			      tbid = TBid, camp_id = CampId, bid = Bid,
			      reward = Rewards})
    when TBid =:= 1038 ->
    {AccVal, GetAimList} = holiday_lib:get_tv_val(CampId,
						  Bid, Role),
    Now = date:unixtime(),
    case Now >= EndTime of
      false -> Role;
      _ ->
	  Fun = fun ({Aim, Award, _}, {Acc1, Acc2}) ->
			case lists:keyfind(Aim, 1, Acc1) of
			  {Aim, 1} ->
			      {lists:keyreplace(Aim, 1, Acc1, {Aim, 2}),
			       Award ++ Acc2};
			  _ -> {Acc1, Acc2}
			end
		end,
	  {NewGetAimList, GetRewards} = lists:foldl(Fun,
						    {GetAimList, []}, Rewards),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NRole = holiday_lib:set_tv_val(CampId, Role,
					 {AccVal, NewGetAimList}, ExpireSec),
	  NewRole = case GetRewards of
		      [] -> NRole;
		      _ ->
			  {Assets, Items} =
			      format:split_assets_items(GetRewards),
			  {ok, NewRoleT} = mail:add(NRole,
						    {util:fbin(lang:get(<<"~tsPhát hành lại phần thưởng"/utf8>>),
							       [Title]),
						     color:msg(lang:get(<<"Quý nhẫn giả：\nĐây là của bạn~tsPhần "
									  "thưởng chưa nhận từ sự kiện. Vui lòng "
									  "kiểm tra"/utf8>>),
							       [{green,
								 Title}]),
						     Assets, Items,
						     lang:get(<<"Bổ sung nạp tích lũy"/utf8>>),
						     86400 + date:unixtime()}),
			  NewRoleT
		    end,
	  NewRole
    end;
zero_flush(Role,
	   Holiday = #holiday{title = Title, end_time = EndTime,
			      tbid = TBid, camp_id = CampId, bid = Bid,
			      reward = Rewards})
    when TBid =:= 1041 ->
    {AccVal, GetAimList} = holiday_lib:get_tv_val(CampId,
						  Bid, Role),
    Now = date:unixtime(),
    case Now >= EndTime of
      false -> Role;
      _ ->
	  Fun = fun ({Aim, Award, _}, {Acc1, Acc2}) ->
			case lists:keyfind(Aim, 1, Acc1) of
			  {Aim, 1} ->
			      {lists:keyreplace(Aim, 1, Acc1, {Aim, 2}),
			       Award ++ Acc2};
			  _ -> {Acc1, Acc2}
			end
		end,
	  {NewGetAimList, GetRewards} = lists:foldl(Fun,
						    {GetAimList, []}, Rewards),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NRole = holiday_lib:set_tv_val(CampId, Role,
					 {AccVal, NewGetAimList}, ExpireSec),
	  NewRole = case GetRewards of
		      [] -> NRole;
		      _ ->
			  {Assets, Items} =
			      format:split_assets_items(GetRewards),
			  {ok, NewRoleT} = mail:add(NRole,
						    {util:fbin(lang:get(<<"~tsPhát hành lại phần thưởng"/utf8>>),
							       [Title]),
						     color:msg(lang:get(<<"Quý nhẫn giả：\nĐây là của bạn~tsPhần "
									  "thưởng chưa nhận từ sự kiện. Vui lòng "
									  "kiểm tra"/utf8>>),
							       [{green,
								 Title}]),
						     Assets, Items,
						     lang:get(<<"Bổ sung nạp tích lũy"/utf8>>),
						     86400 + date:unixtime()}),
			  NewRoleT
		    end,
	  NewRole
    end;
zero_flush(Role, _Holiday) -> Role.

-spec buy(#role{}, Opts :: map()) -> {ok, #role{},
				      NewOpts :: map()}.

buy(Role,
    Opts = #{package_id := PackageId,
	     data_mod := DataMod}) ->
    case DataMod:get(PackageId) of
      #charge_data{type = 3} ->
	  Bids = [], buy(Role, Opts, Bids);
      _ -> {ok, Role, Opts}
    end;
buy(Role, Opts) -> {ok, Role, Opts}.

buy(Role, Opt, []) -> {ok, Role, Opt};
buy(Role, Opt, [Bid | Rest]) ->
    case holiday_lib:get_open_holiday(Bid) of
      Holiday = #holiday{} ->
	  {ok, NewRole, NewOpt} = buy(Role, Opt, Holiday),
	  buy(NewRole, NewOpt, Rest);
      _ -> buy(Role, Opt, Rest)
    end;
buy(Role, Opt, #holiday{bid = Bid}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule_charge2020, _,
       {__Levelholiday_rule_charge2020,
	__Tracesholiday_rule_charge2020}}
	  when __Levelholiday_rule_charge2020 band 8 /= 0 orelse
		 __Tracesholiday_rule_charge2020 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule_charge}, {function, buy},
			{line, 2020}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]未处理的货币直接购买的奖励[Bid:~w][Args:~w]",
				     [Role#role.name, Bid, Opt]),
		       none, 4096, 8, __Levelholiday_rule_charge2020,
		       __Tracesholiday_rule_charge2020, lager_event,
		       __Pidholiday_rule_charge2020);
      _ -> ok
    end,
    {ok, Role, Opt}.

check_take_tbid_1006(Aim, GetAimList, DailyLimit,
		     AccLimit) ->
    case lists:keyfind(Aim, 1, GetAimList) of
      {Aim, DailyCount, AccCount}
	  when DailyLimit =:= 0 andalso AccLimit =:= 0 orelse
		 DailyLimit =/= 0 andalso DailyCount < DailyLimit orelse
		   AccLimit =/= 0 andalso AccCount < AccLimit ->
	  {ok, DailyCount, AccCount};
      false -> {ok, 0, 0};
      {_Aim, _, _} ->
	  {error,
	   lang:get(<<"Đã đạt đến giới hạn mua hàng và bạn "
		      "không thể tiếp tục mua."/utf8>>)};
      _ ->
	  {error,
	   lang:get(<<"Không có cấu hình phần thưởng tương "
		      "ứng"/utf8>>)}
    end.

get_loss_tbid_1007(AssetsId, LossAccList) ->
    case item_data:assets_code2atom(AssetsId) of
      red_gold_or_gold ->
	  do_get_loss_tbid_1007(item_data:assets_atom2code(gold),
				LossAccList)
	    +
	    do_get_loss_tbid_1007(item_data:assets_atom2code(red_gold),
				  LossAccList);
      _ -> do_get_loss_tbid_1007(AssetsId, LossAccList)
    end.

do_get_loss_tbid_1007(AssetsId, GetAimList) ->
    case lists:keyfind(AssetsId, 1, GetAimList) of
      {_, Val} -> Val;
      _ -> 0
    end.


