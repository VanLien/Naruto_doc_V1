-file("src/mod/holiday_day_goals/day_goals.erl", 1).

-module(day_goals).

-lager_records([{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
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
		{quest_stats, [type, stats, desc]},
		{quest_progress,
		 [id, label, target, param, finish, trigger, target_val,
		  value, msg, ext_data, dyn_ext_data]},
		{quest,
		 [id, name, type, finish, quality, progress, accept_time,
		  end_time, finish_time, round]},
		{m_quest,
		 [ver, quest, acceptable, finished, daily_finished]},
		{quest_data,
		 [id, type, name, phase, can_giveup, lev, max_lev,
		  career, pre_quest, suffix_quest, start_time, end_time,
		  condition, progress, accept_rewards, commit_rewards,
		  commit_loss, commit_type, times, desc, group, layer,
		  dungeon_id, is_auto_finished_gain, auto_accept,
		  weekdays, white_list, black_list, extra, val_from_prev,
		  hide]},
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
		{grow_data,
		 [ver, day, goal_id, status, condition, lev, progress,
		  target_type]},
		{m_day_goals,
		 [ver, end_time, num, welfare_list, grow_list,
		  price_list, finish_list, period, charge, old_data,
		  period_day, new_grow_list, lev_reward, old_data2]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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

-export([init/0, init_old/0, login/1, info/1,
	 get_award/3, push/1, push_quest/1, do_ref2/4,
	 zero_flush/1, gm_open/1, gm_reset/1, do_bug_ref/0,
	 do_bug_ref/1, do_ref_quest/0, do_ref_quest/1,
	 do_ref_quest2/1, reward_2020_04_04/1]).

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

-file("src/mod/holiday_day_goals/day_goals.erl", 30).

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

-file("src/mod/holiday_day_goals/day_goals.erl", 31).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_day_goals/day_goals.erl", 32).

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

-file("src/mod/holiday_day_goals/day_goals.erl", 33).

-file("inc/day_goals.hrl", 1).

-record(m_day_goals,
	{ver = 3, end_time = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 welfare_list = []  :: list(), grow_list = []  :: list(),
	 price_list = []  :: list(), finish_list = []  :: list(),
	 period = 1  :: list(), charge = 0  :: list(),
	 old_data = [], period_day = 0, new_grow_list = [],
	 lev_reward = [], old_data2 = []}).

-record(grow_data,
	{ver = 2, day = 0  :: non_neg_integer(),
	 goal_id = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 condition = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), progress = []  :: list(),
	 target_type = 1  :: non_neg_integer()}).

-file("src/mod/holiday_day_goals/day_goals.erl", 34).

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

-file("src/mod/holiday_day_goals/day_goals.erl", 35).

-file("inc/quest.hrl", 1).

-record(quest_data,
	{id = 1  :: pos_integer(), type = 1  :: pos_integer(),
	 name = <<>>  :: binary(),
	 phase = 0  :: non_neg_integer(),
	 can_giveup = 0  :: 0..1, lev = 1  :: pos_integer(),
	 max_lev = 0  :: non_neg_integer(), career = 0  :: 0..4,
	 pre_quest  ::
	     undefined | non_neg_integer() | [non_neg_integer()],
	 suffix_quest = 0  :: non_neg_integer(),
	 start_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 end_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 condition = []  :: [tuple()],
	 progress = []  :: [tuple()],
	 accept_rewards = []  :: [tuple()],
	 commit_rewards = []  :: [tuple()],
	 commit_loss = []  :: [tuple()],
	 commit_type = 1  :: pos_integer(),
	 times = 1  :: non_neg_integer(), desc = <<>>  :: list(),
	 group = 0, layer = 0, dungeon_id = 0,
	 is_auto_finished_gain = 0, auto_accept = 0  :: 0..1,
	 weekdays = []  :: [pos_integer()],
	 white_list = []  :: list(), black_list = []  :: list(),
	 extra = [], val_from_prev = 0  :: 0 | 1,
	 hide = 0  :: 0 | 1}).

-record(m_quest,
	{ver = 1, quest = []  :: list(),
	 acceptable = []  :: list(), finished = []  :: list(),
	 daily_finished = []}).

-record(quest,
	{id = 1  :: pos_integer(), name = <<>>  :: binary(),
	 type = 1  :: pos_integer(), finish = 0  :: 0..2,
	 quality = 0  :: 0..4, progress = []  :: [tuple()],
	 accept_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 finish_time = 0  :: non_neg_integer(),
	 round = 0  :: non_neg_integer()}).

-record(quest_progress,
	{id = 0  :: non_neg_integer(), label  :: atom(),
	 target = 0  :: non_neg_integer(), param = []  :: list(),
	 finish = 0  :: 0..1, trigger  :: undefined | tuple(),
	 target_val = 1  :: pos_integer(),
	 value = 0  :: non_neg_integer(),
	 msg = <<>>  :: bitstring() | string(),
	 ext_data = []  :: [tuple()],
	 dyn_ext_data = []  :: [tuple()]}).

-record(quest_stats, {type = 1, stats = [], desc = []}).

-file("src/mod/holiday_day_goals/day_goals.erl", 36).

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

-file("src/mod/holiday_day_goals/day_goals.erl", 37).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/holiday_day_goals/day_goals.erl", 38).

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

-file("src/mod/holiday_day_goals/day_goals.erl", 39).

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

-file("src/mod/holiday_day_goals/day_goals.erl", 40).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/holiday_day_goals/day_goals.erl", 41).

do_ref_quest(Role = #role{m_day_goals =
			      #m_day_goals{grow_list = GrowListT,
					   period = Period}}) ->
    NRole = #role{m_day_goals =
		      MDayGoals = #m_day_goals{grow_list = GrowList}} =
		del_quest(GrowListT, Role),
    NewGrowList1 = quest_revise:do_list(NRole, day_goals,
					GrowList),
    NewGrowList2 = add_new(NewGrowList1, NRole, Period),
    {NewGrowList, NRole2} = load_quest(NewGrowList2, [],
				       day_goals, NRole),
    NewRole = NRole2#role{m_day_goals =
			      MDayGoals#m_day_goals{grow_list = NewGrowList}},
    {ok, NewRole}.

do_ref_quest() ->
    role_group:apply(world, {day_goals, do_ref_quest, []}).

do_ref_quest2(Role = #role{reg_time = RegTime,
			   m_day_goals =
			       M = #m_day_goals{grow_list = GrowListT,
						period = Period,
						old_data = OldData}}) ->
    NRole = #role{m_day_goals = MDayGoals} =
		del_quest(GrowListT, Role),
    {_, Day} = get_period(RegTime),
    NewRole = NRole#role{m_day_goals =
			     MDayGoals#m_day_goals{period_day = Day,
						   grow_list = [],
						   old_data = [M | OldData]}},
    set_activity_status(Period, 0, []),
    {ok, NewRole}.

do_bug_ref() ->
    role_group:apply(world, {day_goals, do_bug_ref, []}).

do_bug_ref(Role = #role{id = RoleId = {_, Sid},
			reg_time = RegTime,
			m_day_goals =
			    MDayGoals = #m_day_goals{charge = AllCharge,
						     welfare_list = WelfareList,
						     period = Period,
						     old_data = OldData}})
    when Period == 2 ->
    IsRef = list_util:keyfind(is_ref, OldData, 0),
    case IsRef == 0 andalso
	   lists:member(Sid,
			[<<"dev_1">>, <<"dev_2">>, <<"local_1">>, <<"symlf_1">>,
			 <<"symlf_2">>, <<"symlf_3">>, <<"symlf_4">>,
			 <<"symlf_5">>, <<"symlf_6">>, <<"symlf_7">>,
			 <<"symlf_8">>, <<"symlf_9">>, <<"symlf_10">>,
			 <<"symlf_11">>])
	of
      true ->
	  Date = date:unixtime(),
	  DayT = date:day_diff(RegTime, Date),
	  Day = DayT rem 7 + 1,
	  RegZeroTime = date:unixtime({zero, RegTime}),
	  StarTime = RegZeroTime + 86400 * 7,
	  EndTime = date:datetime_to_seconds({2019, 1, 31, 5, 55,
					      0}),
	  AddCharge = charge_lib:calc_charge(RoleId, StarTime,
					     EndTime)
			* 10,
	  NewAllCharge = AllCharge + AddCharge,
	  AllRmb = util:ceil(NewAllCharge * 1.0e-1),
	  Fun = fun ({DayTemp, Id, Status, TargetVal, Value},
		     Acc) ->
			case day_goals_data:get_welfare_condition(Id) of
			  _ when Status =/= 0 ->
			      [{DayTemp, Id, Status, TargetVal, Value} | Acc];
			  [{login, _} | _] when DayTemp =< Day ->
			      [{DayTemp, Id, 1, TargetVal, 1} | Acc];
			  [{charge_rmb, NeedRmb} | _] when AllRmb >= NeedRmb ->
			      [{DayTemp, Id, 1, NeedRmb, NeedRmb} | Acc];
			  [{charge_rmb, NeedRmb} | _] ->
			      [{DayTemp, Id, 0, NeedRmb, AllRmb} | Acc];
			  _ -> [{DayTemp, Id, Status, TargetVal, Value} | Acc]
			end
		end,
	  NewWelfareList = lists:foldl(Fun, [], WelfareList),
	  NewOldData = [{is_ref, 1} | OldData],
	  NRole = Role#role{m_day_goals =
				MDayGoals#m_day_goals{charge = NewAllCharge,
						      welfare_list =
							  NewWelfareList,
						      old_data = NewOldData}},
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidday_goals97, _,
	     {__Levelday_goals97, __Tracesday_goals97}}
		when __Levelday_goals97 band 64 /= 0 orelse
		       __Tracesday_goals97 /= [] ->
		lager:do_log(info,
			     [{module, day_goals}, {function, do_bug_ref},
			      {line, 97}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]id:~w 执行七日目标登陆任务修复成功后, 增加充值数:~w",
					   [Role#role.name, RoleId, AddCharge]),
			     none, 4096, 64, __Levelday_goals97,
			     __Tracesday_goals97, lager_event,
			     __Pidday_goals97);
	    _ -> ok
	  end,
	  push_quest(NRole),
	  {ok, NRole};
      _ -> {ok, Role}
    end;
do_bug_ref(Role) -> {ok, Role}.

do_revise_charge(Role = #role{id = RoleId,
			      misc = #role_misc{reg_zero_time = RegZeroTime},
			      m_day_goals =
				  MDayGoals = #m_day_goals{period = 7,
							   grow_list = []}}) ->
    Now = date:unixtime(),
    StartTime = RegZeroTime + 6 * 7 * 86400,
    AddCharge = charge_lib:calc_charge(RoleId, StartTime,
				       Now),
    {true,
     Role#role{m_day_goals =
		   MDayGoals#m_day_goals{num = 0,
					 charge =
					     util:uround(AddCharge * 10)}}};
do_revise_charge(Role) -> {false, Role}.

init_old() -> #m_day_goals{}.

init() ->
    EndTime = date:unixtime() +
		date:now_diff(day_goals_data:get_const(over_time) - 1,
			      {23, 59, 59}),
    {WelfareList, GrowList, PriceList} = do_init(1),
    #m_day_goals{end_time = EndTime,
		 welfare_list = WelfareList, grow_list = GrowList,
		 price_list = PriceList, period = 1}.

do_init(Period) -> do_init(date:unixtime(), Period).

do_init(RegTime, Period = 1) ->
    NewWelfareListT =
	day_goals_data:get_welfare_list(Period),
    NewWelfareList = [{DayT, IdT, CondT}
		      || {DayT, IdT, CondT, Limit} <- NewWelfareListT,
			 check_limit_req(RegTime, Limit),
			 check_charge_rmb(CondT)],
    WelfareList = [{Day1, Id1, 0,
		    util:if_true(Type =:= login, 1, TargetVal), 0}
		   || {Day1, Id1, [{Type, TargetVal} | _]}
			  <- NewWelfareList],
    GrowList = day_goals_data:get_grow(Period),
    PriceList = [{Id3, 0}
		 || Id3 <- day_goals_data:get_price_list(Period)],
    {WelfareList, GrowList, PriceList};
do_init(RegTime, Period) ->
    NewWelfareListT =
	day_goals_data:get_welfare_list(Period),
    NewWelfareList = [{DayT, IdT, CondT}
		      || {DayT, IdT, CondT, Limit} <- NewWelfareListT,
			 check_limit_req(RegTime, Limit)],
    WelfareList = [{Day1, Id1, 0,
		    util:if_true(Type =:= login, 1, TargetVal), 0}
		   || {Day1, Id1, [{Type, TargetVal} | _]}
			  <- NewWelfareList],
    GrowList = day_goals_data:get_grow(Period),
    PriceList = [{Id3, 0}
		 || Id3 <- day_goals_data:get_price_list(Period)],
    {WelfareList, GrowList, PriceList}.

check_charge_rmb(CondT) ->
    LimitTime =
	date:parse_time(day_goals_data:get_const(limit_day_goals_charge_date)),
    OpenTimestamp = sys_env:get(open_timestamp),
    case OpenTimestamp < LimitTime of
      true -> true;
      _ ->
	  case lists:keyfind(charge_rmb, 1, CondT) of
	    {charge_rmb, _} -> false;
	    _ -> true
	  end
    end.

get_end_time(RegTime, Period) ->
    {_, Time} = date:seconds_to_datetime(RegTime),
    N = day_goals_data:get_const(over_time) * Period - 1,
    DiffTime = N * 86400 +
		 calendar:time_to_seconds({23, 59, 59})
		 - calendar:time_to_seconds(Time),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidday_goals158, _,
       {__Levelday_goals158, __Tracesday_goals158}}
	  when __Levelday_goals158 band 128 /= 0 orelse
		 __Tracesday_goals158 /= [] ->
	  lager:do_log(debug,
		       [{module, day_goals}, {function, get_end_time},
			{line, 158}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("七日目标:~w", [N]), none, 4096, 128,
		       __Levelday_goals158, __Tracesday_goals158, lager_event,
		       __Pidday_goals158);
      _ -> ok
    end,
    RegTime + DiffTime.

gm_reset(Role = #role{reg_time = RegTime}) ->
    EndTime = get_end_time(RegTime, 1),
    {WelfareList, GrowList, PriceList} = do_init(RegTime,
						 1),
    Role#role{m_day_goals =
		  #m_day_goals{period = 1, end_time = EndTime,
			       welfare_list = WelfareList, grow_list = GrowList,
			       price_list = PriceList}}.

gm_open(Role = #role{m_day_goals =
			 MDayGoals = #m_day_goals{welfare_list = WelfareList,
						  grow_list = GrowList}}) ->
    NewRegTime = date:unixtime() - 86400 * 6,
    NewEndTime = get_end_time(NewRegTime, 1),
    NewWelfareList = [{Day1, Id1, 1, TargetVal, Val}
		      || {Day1, Id1, _, TargetVal, Val} <- WelfareList],
    NewGrowList = [GrowData#grow_data{status = 1}
		   || GrowData <- GrowList],
    Role#role{reg_time = NewRegTime,
	      m_day_goals =
		  MDayGoals#m_day_goals{period = 1, old_data = [],
					end_time = NewEndTime,
					welfare_list = NewWelfareList,
					grow_list = NewGrowList}}.

get_period(RegTime) ->
    Date = date:unixtime(),
    Day = date:day_diff(RegTime, Date),
    Period = min(Day div 7 + 1, 7),
    {Period, Day rem 7 + 1}.

zero_flush(Role = #role{reg_time = RegTime,
			assets = #assets{vip_exp = VipExp},
			m_day_goals =
			    MDayGoals = #m_day_goals{welfare_list = WelfareList,
						     grow_list = OldGrowList,
						     period = OldPeriod,
						     old_data2 = OldData2,
						     new_grow_list =
							 OldNewGrowList}}) ->
    Date = date:unixtime(),
    {Period, Day} = get_period(RegTime),
    EndTime = get_end_time(RegTime, Period),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidday_goals190, _,
       {__Levelday_goals190, __Tracesday_goals190}}
	  when __Levelday_goals190 band 128 /= 0 orelse
		 __Tracesday_goals190 /= [] ->
	  lager:do_log(debug,
		       [{module, day_goals}, {function, zero_flush},
			{line, 190}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("七日目标0点更新 ~w", [OldPeriod]), none, 4096,
		       128, __Levelday_goals190, __Tracesday_goals190,
		       lager_event, __Pidday_goals190);
      _ -> ok
    end,
    NewFlag = lists:member(Period,
			   day_goals_new_data:period_list()),
    if OldPeriod > Period ->
	   set_activity_status(Period, 0, []), {ok, Role};
       OldPeriod =/= Period ->
	   if NewFlag =:= true andalso OldGrowList =/= [] ->
		  set_activity_status(OldPeriod, 0, []),
		  {NRole, NewOldData} = reissue_award(Role, Day),
		  NRole2 = del_quest(OldGrowList, NRole),
		  NewRole = NRole2#role{m_day_goals =
					    #m_day_goals{old_data = NewOldData,
							 old_data2 = OldData2,
							 charge = 0,
							 end_time = EndTime,
							 period = Period,
							 period_day = Day}},
		  {ok, NewRole};
	      NewFlag =:= true ->
		  set_activity_status(Period, 0, []), {ok, Role};
	      NewFlag =:= false andalso OldNewGrowList =/= [] ->
		  {NRole, _} = day_goals_new:reissue_award(Role, 1),
		  NRole2 = #role{m_day_goals = NewMDayGoals} =
			       day_goals_new:del_quest(OldNewGrowList, NRole),
		  {NewWelfareList, GrowList, PriceList} = do_init(RegTime,
								  Period),
		  NewRole = NRole2#role{m_day_goals =
					    NewMDayGoals#m_day_goals{period =
									 Period,
								     period_day
									 = Day,
								     charge = 0,
								     end_time =
									 EndTime,
								     welfare_list
									 =
									 NewWelfareList,
								     grow_list =
									 GrowList,
								     price_list
									 =
									 PriceList}},
		  day_goals_new:set_activity_status(OldPeriod, 0, []),
		  login(NewRole);
	      true ->
		  set_activity_status(OldPeriod, 0, []),
		  {NRole, NewOldData} = reissue_award(Role, Day),
		  NRole2 = del_quest(OldGrowList, NRole),
		  {NewWelfareList, GrowList, PriceList} = do_init(RegTime,
								  Period),
		  NewRole = NRole2#role{m_day_goals =
					    #m_day_goals{old_data = NewOldData,
							 old_data2 = OldData2,
							 charge = 0,
							 end_time = EndTime,
							 welfare_list =
							     NewWelfareList,
							 grow_list = GrowList,
							 price_list = PriceList,
							 period = Period,
							 period_day = Day}},
		  login(NewRole)
	   end;
       OldGrowList =:= [] andalso NewFlag =:= true ->
	   set_activity_status(Period, 0, []), {ok, Role};
       Date >= EndTime ->
	   set_activity_status(Period, 0, []),
	   {NRole, NewOldData} = reissue_award(Role, Day),
	   NRole2 = del_quest(OldGrowList, NRole),
	   {ok,
	    NRole2#role{m_day_goals =
			    #m_day_goals{old_data = NewOldData,
					 old_data2 = OldData2,
					 period = Period + 1}}};
       true ->
	   set_activity_status(Period, 1, []),
	   DayWelfare = lists:filter(fun ({DayT, _IdT, Sattus, _,
					   _}) ->
					     DayT == Day andalso Sattus == 0;
					 (_) -> false
				     end,
				     WelfareList),
	   NewWelfareList = do_ref(DayWelfare, WelfareList,
				   VipExp),
	   NewRole = Role#role{m_day_goals =
				   MDayGoals#m_day_goals{welfare_list =
							     NewWelfareList,
							 end_time = EndTime}},
	   {ok, NewRole}
    end.

get_period_name(1) -> lang:get(<<"七日目标"/utf8>>);
get_period_name(4) -> lang:get(<<"华彩绘章"/utf8>>);
get_period_name(7) -> lang:get(<<"星梦奇缘"/utf8>>);
get_period_name(_) -> lang:get(<<"七日目标1"/utf8>>).

do_award_2020_4_4(Role = #role{m_day_goals =
				   MDayGoals = #m_day_goals{period = Period,
							    grow_list =
								GrowList,
							    welfare_list =
								WelfareList,
							    num = Num}},
		  7) ->
    WelfFun = fun ({Day, WelfareId, 0, TargetVal, Val},
		   {AccItem, NWelfareList, Acc2}) ->
		      case day_goals_data:get_welfare_condition(WelfareId) of
			[{login, Day} | _] ->
			    {_, AwardList} =
				day_goals_data:get_award1(WelfareId),
			    NewAccItem = item_lib:merge(AwardList, AccItem),
			    {NewAccItem,
			     lists:keyreplace(WelfareId, 2, NWelfareList,
					      {Day, WelfareId, 2, TargetVal,
					       Val}),
			     [WelfareId | Acc2]};
			_ -> {AccItem, NWelfareList, Acc2}
		      end;
		  (_, DataT) -> DataT
	      end,
    {WelfareItem, NewWelfareList, DoWelfareIds} =
	lists:foldl(WelfFun, {[], WelfareList, []},
		    WelfareList),
    GrowFun = fun (G = #grow_data{goal_id = GrowId,
				  status = 0},
		   {AccItem, NumT, NGrowList, Acc2}) ->
		      {_, AwardList} = day_goals_data:get_award1(GrowId),
		      NewAccItem = item_lib:merge(AwardList, AccItem),
		      NGrowListT = lists:keyreplace(GrowId,
						    #grow_data.goal_id,
						    NGrowList,
						    G#grow_data{status = 2}),
		      {NewAccItem, NumT + 1, NGrowListT, [GrowId | Acc2]};
		  (_, DataT) -> DataT
	      end,
    {GrowItem, NewNum, NewGrowList, DoGrowIds} =
	lists:foldl(GrowFun, {[], Num, GrowList, []}, GrowList),
    MailItem = item_lib:merge(WelfareItem ++ GrowItem, []),
    NRole = case MailItem of
	      [_ | _] ->
		  {Assets, Items} = format:split_assets_items(MailItem),
		  PeriodName = get_period_name(Period),
		  Msg =
		      util:fbin(lang:get(<<"尊敬的玩家：\n      您好，为表达对全国各族人民抗击新冠肺炎疫情斗争牺牲烈士和逝世同"
					   "胞的深切哀悼，响应国务院全国停止公共娱乐活动号召，游戏已于4月4日暂停服务一日，因您的角色"
					   "在4月4日处于（~ts）活动期最后一天，现为您补发由于暂停服务而无法完成的进度奖励，请查收"
					   "，祝游戏愉快。"/utf8>>),
				[PeriodName]),
		  {ok, RoleT} = mail:add(Role,
					 {lang:get(<<"活动补发邮件"/utf8>>), Msg,
					  Assets, Items, Msg,
					  86400 + date:unixtime()}),
		  RoleT;
	      _ -> Role
	    end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidday_goals286, _,
       {__Levelday_goals286, __Tracesday_goals286}}
	  when __Levelday_goals286 band 64 /= 0 orelse
		 __Tracesday_goals286 /= [] ->
	  lager:do_log(info,
		       [{module, day_goals}, {function, do_award_2020_4_4},
			{line, 286}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts] 七日目标数据福利任务补发的id为:~w, 成长任务补发的id为:~w, "
				     "邮件内容为:~w",
				     [Role#role.name, DoWelfareIds, DoGrowIds,
				      MailItem]),
		       none, 4096, 64, __Levelday_goals286,
		       __Tracesday_goals286, lager_event, __Pidday_goals286);
      _ -> ok
    end,
    NewMDayGoals = MDayGoals#m_day_goals{grow_list =
					     NewGrowList,
					 welfare_list = NewWelfareList,
					 num = max(100, NewNum)},
    NRole1 = NRole#role{m_day_goals = NewMDayGoals},
    var:set_var(NRole1, other, 3120, 1);
do_award_2020_4_4(Role = #role{m_day_goals =
				   MDayGoals = #m_day_goals{grow_list =
								GrowList,
							    welfare_list =
								WelfareList,
							    period = Period}},
		  _) ->
    QList = [{1, 12010}, {1, 12020}, {1, 12030}, {4, 44010},
	     {4, 44020}, {4, 44030}, {4, 44040}, {4, 44050},
	     {4, 44060}, {4, 49010}, {4, 49020}, {4, 49030},
	     {4, 49040}, {4, 49050}, {4, 49060}, {7, 72010},
	     {7, 72020}, {7, 72030}, {7, 72040}, {7, 72050},
	     {7, 72060}, {7, 73010}, {7, 73020}, {7, 73030},
	     {7, 73040}, {7, 73050}, {7, 73060}],
    WelfFun = fun ({Day, WelfareId, 0, TargetVal, Val},
		   {Acc, NWelfareList}) ->
		      case day_goals_data:get_welfare_condition(WelfareId) of
			[{login, Day} | _] ->
			    {[WelfareId | Acc],
			     lists:keyreplace(WelfareId, 2, NWelfareList,
					      {Day, WelfareId, 1, TargetVal,
					       Val})};
			_ -> {Acc, NWelfareList}
		      end;
		  (_, DataT) -> DataT
	      end,
    {DoWelfareIds, NewWelfareList} = lists:foldl(WelfFun,
						 {[], WelfareList},
						 WelfareList),
    GrowFun = fun (G = #grow_data{goal_id = GrowId,
				  status = 0},
		   {Acc, NGrowList}) ->
		      case lists:member({Period, GrowId}, QList) of
			true ->
			    NGrowListT = lists:keyreplace(GrowId,
							  #grow_data.goal_id,
							  NGrowList,
							  G#grow_data{status =
									  1}),
			    {[{Period, GrowId} | Acc], NGrowListT};
			_ -> {Acc, NGrowList}
		      end;
		  (_, DataT) -> DataT
	      end,
    {DoGrowIds, NewGrowList} = lists:foldl(GrowFun,
					   {[], GrowList}, GrowList),
    NewMDayGoals = MDayGoals#m_day_goals{grow_list =
					     NewGrowList,
					 welfare_list = NewWelfareList},
    NRole1 = Role#role{m_day_goals = NewMDayGoals},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidday_goals318, _,
       {__Levelday_goals318, __Tracesday_goals318}}
	  when __Levelday_goals318 band 64 /= 0 orelse
		 __Tracesday_goals318 /= [] ->
	  lager:do_log(info,
		       [{module, day_goals}, {function, do_award_2020_4_4},
			{line, 318}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts] 七日目标数据福利任务修正的id为:~w, 成长任务修正的id为:~w",
				     [Role#role.name, DoWelfareIds, DoGrowIds]),
		       none, 4096, 64, __Levelday_goals318,
		       __Tracesday_goals318, lager_event, __Pidday_goals318);
      _ -> ok
    end,
    var:set_var(NRole1, other, 3120, 1).

reward_2020_04_04(Role) ->
    Role1 = do_2020_04_04(Role),
    Role2 = day_goals_new:do_2020_04_04(Role1),
    {ok, Role2}.

do_2020_04_04(Role = #role{reg_time = RegTime,
			   m_day_goals = #m_day_goals{period = Period}}) ->
    Now = date:unixtime(),
    IsDd20200404 = var:get_var(Role, other, 3120, 0),
    case Now >= 1586016000 andalso
	   Now < 1586102400 andalso IsDd20200404 == 0
	of
      true ->
	  RegDay = date:day_diff(RegTime, Now) + 1,
	  RegDayList = [{1, 2, 8}, {4, 23, 29}, {7, 44, 50}],
	  case [{Min, Max}
		|| {PeriodT, Min, Max} <- RegDayList,
		   RegDay >= Min andalso
		     RegDay =< Max andalso PeriodT == Period]
	      of
	    [{_, RegDay} | _] ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidday_goals336, _,
		   {__Levelday_goals336, __Tracesday_goals336}}
		      when __Levelday_goals336 band 64 /= 0 orelse
			     __Tracesday_goals336 /= [] ->
		      lager:do_log(info,
				   [{module, day_goals},
				    {function, do_2020_04_04}, {line, 336},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts] 七日目标补发为补发第7天，注册天数为:~w, 旧周期数据为:~w",
						 [Role#role.name, RegDay,
						  Period]),
				   none, 4096, 64, __Levelday_goals336,
				   __Tracesday_goals336, lager_event,
				   __Pidday_goals336);
		  _ -> ok
		end,
		do_award_2020_4_4(Role, 7);
	    [{_, _} | _] ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidday_goals339, _,
		   {__Levelday_goals339, __Tracesday_goals339}}
		      when __Levelday_goals339 band 64 /= 0 orelse
			     __Tracesday_goals339 /= [] ->
		      lager:do_log(info,
				   [{module, day_goals},
				    {function, do_2020_04_04}, {line, 339},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts] 七日目标补发为补发1-6天的奖励，注册天数为:~w, 旧周期数据为:~w",
						 [Role#role.name, RegDay,
						  Period]),
				   none, 4096, 64, __Levelday_goals339,
				   __Tracesday_goals339, lager_event,
				   __Pidday_goals339);
		  _ -> ok
		end,
		do_award_2020_4_4(Role, 6);
	    _ ->
		case lists:member(Period, [1, 4, 7]) of
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
			{__Pidday_goals344, _,
			 {__Levelday_goals344, __Tracesday_goals344}}
			    when __Levelday_goals344 band 64 /= 0 orelse
				   __Tracesday_goals344 /= [] ->
			    lager:do_log(info,
					 [{module, day_goals},
					  {function, do_2020_04_04},
					  {line, 344},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[~ts] 注册天数不对，没有进行补发，注册天数为:~w, 旧周期数据为:~w",
						       [Role#role.name, RegDay,
							Period]),
					 none, 4096, 64, __Levelday_goals344,
					 __Tracesday_goals344, lager_event,
					 __Pidday_goals344);
			_ -> ok
		      end,
		      var:set_var(Role, other, 3120, 1);
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
			{__Pidday_goals347, _,
			 {__Levelday_goals347, __Tracesday_goals347}}
			    when __Levelday_goals347 band 64 /= 0 orelse
				   __Tracesday_goals347 /= [] ->
			    lager:do_log(info,
					 [{module, day_goals},
					  {function, do_2020_04_04},
					  {line, 347},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[~ts] 周期不符合旧七日目标, 无视掉, 注册天数为:~w, 旧周期数据为:~w",
						       [Role#role.name, RegDay,
							Period]),
					 none, 4096, 64, __Levelday_goals347,
					 __Tracesday_goals347, lager_event,
					 __Pidday_goals347);
			_ -> ok
		      end,
		      Role
		end
	  end;
      _ -> Role
    end.

login(Role = #role{reg_time = RegTime,
		   assets = #assets{vip_exp = VipExp},
		   m_day_goals =
		       MDayGoals = #m_day_goals{grow_list = GrowList,
						welfare_list = WelfareList,
						price_list = PriceList,
						period = OldPeriod,
						new_grow_list = OldNewGrowList,
						old_data2 = OldData2}}) ->
    {Period, Day} = get_period(RegTime),
    EndTime = get_end_time(RegTime, Period),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidday_goals361, _,
       {__Levelday_goals361, __Tracesday_goals361}}
	  when __Levelday_goals361 band 128 /= 0 orelse
		 __Tracesday_goals361 /= [] ->
	  lager:do_log(debug,
		       [{module, day_goals}, {function, login}, {line, 361},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("七日目标:~w", [{EndTime, Period, Day}]),
		       none, 4096, 128, __Levelday_goals361,
		       __Tracesday_goals361, lager_event, __Pidday_goals361);
      _ -> ok
    end,
    Date = date:unixtime(),
    NewFlag = lists:member(Period,
			   day_goals_new_data:period_list()),
    if OldPeriod > Period -> {ok, Role};
       OldPeriod =/= Period ->
	   if NewFlag =:= true andalso GrowList =/= [] ->
		  {NRole, NewOldData} = reissue_award(Role, Day),
		  NewRole = NRole#role{m_day_goals =
					   #m_day_goals{old_data = NewOldData,
							old_data2 = OldData2,
							charge = 0,
							end_time = EndTime,
							period = Period,
							period_day = Day}},
		  {ok, NewRole};
	      NewFlag =:= true -> {ok, Role};
	      NewFlag =:= false andalso OldNewGrowList =/= [] ->
		  {NRole = #role{m_day_goals = NewMDayGoals}, _} =
		      day_goals_new:reissue_award(Role, 1),
		  {NewWelfareList, NewGrowList, NewPriceList} =
		      do_init(RegTime, Period),
		  NewRole = NRole#role{m_day_goals =
					   NewMDayGoals#m_day_goals{period =
									Period,
								    end_time =
									EndTime,
								    charge = 0,
								    welfare_list
									=
									NewWelfareList,
								    grow_list =
									NewGrowList,
								    price_list =
									NewPriceList}},
		  login(NewRole);
	      true ->
		  set_activity_status(OldPeriod, 0, []),
		  {NRole, NewOldData} = reissue_award(Role, Day),
		  {NewWelfareList, NewGrowList, NewPriceList} =
		      do_init(RegTime, Period),
		  NewRole = NRole#role{m_day_goals =
					   #m_day_goals{old_data = NewOldData,
							old_data2 = OldData2,
							charge = 0,
							end_time = EndTime,
							welfare_list =
							    NewWelfareList,
							grow_list = NewGrowList,
							price_list =
							    NewPriceList,
							period = Period,
							period_day = Day}},
		  login(NewRole)
	   end;
       GrowList =:= [] andalso NewFlag =:= true -> {ok, Role};
       Date > EndTime ->
	   {NRole, NewOldData} = reissue_award(Role, Day),
	   {ok,
	    NRole#role{m_day_goals =
			   #m_day_goals{period = Period + 1,
					old_data = NewOldData,
					old_data2 = OldData2}}};
       true ->
	   NRoleT = del_quest(GrowList, Role),
	   {ReviseFlag,
	    NRole0 = #role{m_day_goals = NewMDayGoals}} =
	       do_revise_charge(NRoleT),
	   set_activity_status(Period, 1, []),
	   NewWelfareList2 = add_new_welfare(NRoleT, Period,
					     WelfareList),
	   DayWelfare = lists:filter(fun ({DayT, _IdT, Status, _,
					   _}) ->
					     DayT == Day andalso Status == 0
				     end,
				     NewWelfareList2),
	   NewWelfareList3 = do_ref(DayWelfare, NewWelfareList2,
				    VipExp),
	   NewWelfareList = do_revise_welfare(ReviseFlag,
					      NewWelfareList3, NRole0),
	   NewGrowList1 = quest_revise:do_list(NRole0, day_goals,
					       GrowList),
	   NewGrowList2 = add_new(NewGrowList1, NRole0, Period),
	   {NewGrowList, NRole} = load_quest(NewGrowList2, [],
					     day_goals, NRole0),
	   NewPriceList = reset_price(PriceList, Period),
	   NewRole = NRole#role{m_day_goals =
				    NewMDayGoals#m_day_goals{end_time = EndTime,
							     welfare_list =
								 NewWelfareList,
							     grow_list =
								 NewGrowList,
							     price_list =
								 NewPriceList}},
	   {ok, NewRole}
    end.

add_new_welfare(Role, Period = 1, WelfareList) ->
    NewWelfareListT =
	day_goals_data:get_welfare_list(Period),
    NewWelfareList = [{DayT, IdT, CondT}
		      || {DayT, IdT, CondT, Limit} <- NewWelfareListT,
			 check_limit_req(Role, Limit), check_charge_rmb(CondT)],
    Fun = fun ({Day, Id, [{Type, TargetVal} | _]}, Acc) ->
		  case lists:keyfind(Id, 2, WelfareList) of
		    false ->
			[{Day, Id, 0,
			  util:if_true(Type =:= login, 1, TargetVal), 0}
			 | Acc];
		    {_DayT, _Id, Status} ->
			[{Day, Id, Status,
			  util:if_true(Type =:= login, 1, TargetVal), 0}
			 | Acc];
		    {_DayT, _Id, Status, _TargetVal, Val} ->
			[{Day, Id, Status,
			  util:if_true(Type =:= login, 1, TargetVal), Val}
			 | Acc]
		  end
	  end,
    lists:foldl(Fun, [], NewWelfareList);
add_new_welfare(Role, Period, WelfareList) ->
    NewWelfareListT =
	day_goals_data:get_welfare_list(Period),
    NewWelfareList = [{DayT, IdT, CondT}
		      || {DayT, IdT, CondT, Limit} <- NewWelfareListT,
			 check_limit_req(Role, Limit), check_charge_rmb(CondT)],
    Fun = fun ({Day, Id, [{Type, TargetVal} | _]}, Acc) ->
		  case lists:keyfind(Id, 2, WelfareList) of
		    false ->
			[{Day, Id, 0,
			  util:if_true(Type =:= login, 1, TargetVal), 0}
			 | Acc];
		    {_DayT, _Id, Status} ->
			[{Day, Id, Status,
			  util:if_true(Type =:= login, 1, TargetVal), 0}
			 | Acc];
		    {_DayT, _Id, Status, _TargetVal, Val} ->
			[{Day, Id, Status,
			  util:if_true(Type =:= login, 1, TargetVal), Val}
			 | Acc]
		  end
	  end,
    lists:foldl(Fun, [], NewWelfareList).

check_limit_req(_Role, undefined) -> true;
check_limit_req(#role{reg_time = RegTime}, Limit) ->
    check_limit_req(RegTime, Limit);
check_limit_req(_RegTime, undefined) -> true;
check_limit_req(RegTime, {'>=', Limit})
    when is_integer(RegTime) andalso RegTime >= Limit ->
    true;
check_limit_req(RegTime, {'=<', Limit})
    when is_integer(RegTime) andalso RegTime =< Limit ->
    true;
check_limit_req(RegTime, {'<', Limit})
    when is_integer(RegTime) andalso RegTime < Limit ->
    true;
check_limit_req(RegTime, {'>', Limit})
    when is_integer(RegTime) andalso RegTime > Limit ->
    true;
check_limit_req(_RegTime, _Limit) -> false.

set_activity_status(4, Status, Arge) ->
    activity_self:set_activity(3503, Status, Arge);
set_activity_status(3, Status, Arge) ->
    activity_self:set_activity(2503, Status, Arge);
set_activity_status(2, Status, Arge) ->
    activity_self:set_activity(1503, Status, Arge);
set_activity_status(7, Status, Arge) ->
    activity_self:set_activity(4503, Status, Arge);
set_activity_status(_Period, Status, Arge) ->
    activity_self:set_activity(503, Status, Arge).

add_new(NewGrowList, Role, Period) ->
    GrowList = day_goals_data:get_grow(Period),
    add_new2(GrowList, NewGrowList, [], Role).

add_new2([], _NewGrowList, L, _Role) -> L;
add_new2([Grow = #grow_data{day = NewDay,
			    goal_id = GrowId, progress = Progress,
			    target_type = TargetType}
	  | GrowList],
	 NewGrowList, L, Role) ->
    case lists:keyfind(GrowId, #grow_data.goal_id,
		       NewGrowList)
	of
      false ->
	  Progress1 = reset_progress_val(Role, Progress, GrowId),
	  Finish = case [false
			 || #quest_progress{finish = 0} <- Progress1]
		       of
		     [] -> 1;
		     _ -> 0
		   end,
	  NewGrow = Grow#grow_data{progress = Progress1,
				   status = Finish},
	  add_new2(GrowList, NewGrowList, [NewGrow | L], Role);
      Temp = #grow_data{} ->
	  NewTemp = Temp#grow_data{day = NewDay,
				   target_type = TargetType},
	  add_new2(GrowList, NewGrowList, [NewTemp | L], Role);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidday_goals483, _,
	     {__Levelday_goals483, __Tracesday_goals483}}
		when __Levelday_goals483 band 8 /= 0 orelse
		       __Tracesday_goals483 /= [] ->
		lager:do_log(error,
			     [{module, day_goals}, {function, add_new2},
			      {line, 483}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("无法添加新七日任务的情况 ~w ~w",
					   [GrowId, NewGrowList]),
			     none, 4096, 8, __Levelday_goals483,
			     __Tracesday_goals483, lager_event,
			     __Pidday_goals483);
	    _ -> ok
	  end,
	  add_new2(GrowList, NewGrowList, L, Role)
    end.

reset_price(PriceList, Period) ->
    OldPriceList = [OId3 || {OId3, _} <- PriceList],
    NewPriceList = [{Id3, 0}
		    || Id3
			   <- day_goals_data:get_price_list(Period) --
				OldPriceList],
    NewPriceList ++ PriceList.

reissue_award(Role = #role{m_day_goals =
			       #m_day_goals{price_list = L, period = Period,
					    old_data = OldData, num = Num,
					    grow_list = GrowList,
					    welfare_list = WelfareList,
					    finish_list = FinishList}},
	      NewDay) ->
    WelfFun = fun ({Day, WelfareId, 1, TargetVal, Val},
		   {AccItem, NWelfareList}) ->
		      {_, AwardList} = day_goals_data:get_award1(WelfareId),
		      NewAccItem = item_lib:merge(AwardList, AccItem),
		      {NewAccItem,
		       lists:keyreplace(WelfareId, 2, NWelfareList,
					{Day, WelfareId, 2, TargetVal, Val})};
		  (_, DataT) -> DataT
	      end,
    {WelfareItem, NewWelfareList} = lists:foldl(WelfFun,
						{[], WelfareList}, WelfareList),
    GrowFun = fun (G = #grow_data{goal_id = GrowId,
				  status = 1},
		   {AccItem, NumT, NGrowList}) ->
		      {_, AwardList} = day_goals_data:get_award1(GrowId),
		      NewAccItem = item_lib:merge(AwardList, AccItem),
		      NGrowListT = lists:keyreplace(GrowId,
						    #grow_data.goal_id,
						    NGrowList,
						    G#grow_data{status = 2}),
		      {NewAccItem, NumT + 1, NGrowListT};
		  (_, DataT) -> DataT
	      end,
    {GrowItem, NewNum, NewGrowList} = lists:foldl(GrowFun,
						  {[], Num, GrowList},
						  GrowList),
    FinishFun = fun ({FId, Goal, AwardList},
		     {AccItem, NFinList})
			when NewNum >= Goal ->
			case lists:member(FId, NFinList) of
			  false ->
			      NewAccItem = item_lib:merge(AwardList, AccItem),
			      {NewAccItem, [FId | NFinList]};
			  _ -> {AccItem, NFinList}
			end;
		    (_, DateT) -> DateT
		end,
    {FinItem, NewFinList} = lists:foldl(FinishFun,
					{[], FinishList},
					day_goals_data:get_finish_list(Period)),
    MailItem = WelfareItem ++ GrowItem ++ FinItem,
    NRole = case MailItem of
	      [_ | _] when NewDay > 1 ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidday_goals526, _,
		     {__Levelday_goals526, __Tracesday_goals526}}
			when __Levelday_goals526 band 8 /= 0 orelse
			       __Tracesday_goals526 /= [] ->
			lager:do_log(error,
				     [{module, day_goals},
				      {function, reissue_award}, {line, 526},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("[~ts]id:~w 七日目标未领取奖励第二期已开启大于1天不发放:~w",
						   [Role#role.name,
						    Role#role.id, MailItem]),
				     none, 4096, 8, __Levelday_goals526,
				     __Tracesday_goals526, lager_event,
				     __Pidday_goals526);
		    _ -> ok
		  end,
		  Role;
	      [_ | _] ->
		  {Assets, Items} = format:split_assets_items(MailItem),
		  {ok, RoleT} = mail:add(Role,
					 {lang:get(<<"七日目标"/utf8>>),
					  lang:get(<<"亲爱的冒险者大人, 七日目标活动中您有奖励未领取, 现为你奉上！"/utf8>>),
					  Assets, Items,
					  lang:get(<<"七日目标"/utf8>>),
					  86400 + date:unixtime()}),
		  RoleT;
	      _ -> Role
	    end,
    NewOldData = [{Period, NewNum, NewGrowList,
		   NewWelfareList, NewFinList, L, MailItem}
		  | OldData],
    {NRole#role{m_day_goals =
		    #m_day_goals{period = Period + 1}},
     NewOldData}.

-spec del_quest([#grow_data{}],
		#role{}) -> {[#grow_data{}], #role{}}.

del_quest([], Role) -> Role;
del_quest([#grow_data{progress = Progress} | Other],
	  Role) ->
    Tids = [Tid
	    || #quest_progress{finish = 0, trigger = Tid}
		   <- Progress,
	       is_tuple(Tid)],
    NewRole = role_trigger:del(Tids, Role),
    del_quest(Other, NewRole).

-spec load_quest([#grow_data{}], [#grow_data{}],
		 Label :: quest | feat | atom(),
		 #role{}) -> {[#grow_data{}], #role{}}.

load_quest([], Quests, _Label, Role) -> {Quests, Role};
load_quest([Q = #grow_data{status = 0, goal_id = GrowId,
			   progress = Progress}
	    | T],
	   Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress, Label,
					   GrowId, [], Role),
    case [Tmp
	  || Tmp = #quest_progress{finish = 0} <- NewProgress]
	of
      [] ->
	  load_quest(T,
		     [Q#grow_data{progress = NewProgress} | Quests], Label,
		     NewRole);
      _ ->
	  load_quest(T,
		     [Q#grow_data{progress = NewProgress, status = 0}
		      | Quests],
		     Label, NewRole)
    end;
load_quest([Q = #grow_data{goal_id = Qid,
			   progress = Progress}
	    | T],
	   Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress, Label,
					   Qid, [], Role),
    load_quest(T,
	       [Q#grow_data{progress = NewProgress} | Quests], Label,
	       NewRole).

-spec load_progress(Progress, TypeLabel, QuestData,
		    NewProgress, NewRole) -> {NewProgress,
					      NewRole} when Progress ::
								[#quest_progress{}],
							    NewProgress ::
								[#quest_progress{}],
							    TypeLabel :: quest |
									 atom(),
							    QuestData ::
								pos_integer() |
								#quest_data{},
							    NewProgress ::
								#role{}.

load_progress([], _TypeLabel, _Qid, [], Role) ->
    {[], Role};
load_progress([], _TypeLabel, _Qid, Progress, Role) ->
    {lists:reverse(Progress), Role};
load_progress([P = #quest_progress{finish = 0, id = Id,
				   label = Label, target = Target,
				   param = Param}
	       | T],
	      TypeLabel, Qid, Progress, Role) ->
    {Tid, NewRole} = role_trigger:add(#trigger{label =
						   Label,
					       m = quest_progress, f = event,
					       a =
						   [TypeLabel, Qid, Id, Target,
						    Param]},
				      Role),
    load_progress(T, TypeLabel, Qid,
		  [P#quest_progress{trigger = Tid} | Progress], NewRole);
load_progress([P | T], TypeLabel, Qid, Progress,
	      Role) ->
    NewRole = quest_progress:monitor_quest_prog(TypeLabel,
						P, Qid, Role),
    load_progress(T, TypeLabel, Qid,
		  [P#quest_progress{trigger = undefined} | Progress],
		  NewRole).

do_ref([], L, _VipExp) -> L;
do_ref([{Day, Id, _Status, TargetVal, Val} | List], L,
       VipExp) ->
    case day_goals_data:get_welfare_condition(Id) of
      [{login, Day} | _] ->
	  do_ref(List,
		 lists:keystore(Id, 2, L, {Day, Id, 1, TargetVal, 1}),
		 VipExp);
      [{charge_total, Num}] ->
	  case VipExp < Num of
	    true ->
		do_ref(List,
		       lists:keystore(Id, 2, L,
				      {Day, Id, 0, TargetVal, Val + VipExp}),
		       VipExp);
	    _ ->
		do_ref(List,
		       lists:keystore(Id, 2, L,
				      {Day, Id, 1, TargetVal, TargetVal}),
		       VipExp)
	  end;
      _ -> do_ref(List, L, VipExp)
    end.

do_revise_welfare(true, WelfareList,
		  #role{reg_time = RegTime,
			m_day_goals = #m_day_goals{charge = AddCharge}}) ->
    Date = date:unixtime(),
    DayT = date:day_diff(RegTime, Date),
    Day = min(2, DayT rem 7 + 1),
    AllRmb = util:ceil(AddCharge * 1.0e-1),
    Fun = fun ({DayTemp, Id, Status, TargetVal, Value},
	       Acc) ->
		  case day_goals_data:get_welfare_condition(Id) of
		    _ when Status =/= 0 ->
			[{DayTemp, Id, Status, TargetVal, Value} | Acc];
		    [{login, _} | _] when DayTemp =< Day ->
			[{DayTemp, Id, 1, TargetVal, 1} | Acc];
		    [{charge_rmb, NeedRmb} | _] when AllRmb >= NeedRmb ->
			[{DayTemp, Id, 1, NeedRmb, NeedRmb} | Acc];
		    [{charge_rmb, NeedRmb} | _] ->
			[{DayTemp, Id, 0, NeedRmb, AllRmb} | Acc];
		    _ -> [{DayTemp, Id, Status, TargetVal, Value} | Acc]
		  end
	  end,
    lists:foldl(Fun, [], WelfareList);
do_revise_welfare(_, WelfareList, _) -> WelfareList.

do_ref2(Role = #role{lev = Lev, reg_time = RegTime,
		     assets = #assets{vip_exp = VipExp},
		     m_day_goals =
			 MDayGoals = #m_day_goals{welfare_list = WelfareList,
						  charge = AllCharge}},
	Type, Gold, _PackageId) ->
    {Period, Day} = get_period(RegTime),
    NewAllCharge = case Type of
		     charge -> AllCharge + Gold;
		     _ -> AllCharge
		   end,
    AllRmb = util:uround(NewAllCharge * 1.0e-1),
    AccRmb = charge_misc:charge_sum(Role),
    Fun = fun ({DayT, IdT, Status, _, _},
	       {Acc, RoleTemp}) ->
		  case Status == 0 of
		    true ->
			case day_goals_data:get_welfare_condition(IdT) of
			  [{charge_total, Num} | _] when Type == charge ->
			      case VipExp >= Num andalso Period == 1 of
				true ->
				    {lists:keystore(IdT, 2, Acc,
						    {DayT, IdT, 1, Num, Num}),
				     RoleTemp};
				_ when NewAllCharge >= Num ->
				    {lists:keystore(IdT, 2, Acc,
						    {DayT, IdT, 1, Num, Num}),
				     RoleTemp};
				_ when Period == 1 ->
				    {lists:keystore(IdT, 2, Acc,
						    {DayT, IdT, 0, Num,
						     VipExp}),
				     RoleTemp};
				_ ->
				    {lists:keystore(IdT, 2, Acc,
						    {DayT, IdT, 1, Num,
						     NewAllCharge}),
				     RoleTemp}
			      end;
			  [{evt_levup, LimitLv}] when Type == evt_levup ->
			      case Lev >= LimitLv of
				true ->
				    {lists:keystore(IdT, 2, Acc,
						    {DayT, IdT, 1, LimitLv,
						     LimitLv}),
				     RoleTemp};
				_ ->
				    {lists:keystore(IdT, 2, Acc,
						    {DayT, IdT, 1, LimitLv,
						     Lev}),
				     RoleTemp}
			      end;
			  [{day_charge, Num} | _]
			      when Day == DayT andalso Type == charge ->
			      OldNum = var:get_var(Role, day, 30, 0),
			      NewNum = OldNum + Gold,
			      RoleTemp2 = var:set_var(RoleTemp, day, 30,
						      NewNum),
			      case NewNum >= Num of
				true ->
				    {lists:keystore(IdT, 2, Acc,
						    {DayT, IdT, 1, Num, Num}),
				     RoleTemp2};
				_ ->
				    {lists:keystore(IdT, 2, Acc,
						    {DayT, IdT, 0, Num,
						     NewNum}),
				     RoleTemp2}
			      end;
			  [{charge_rmb, NeedRmb} | _] when Type == charge ->
			      case AccRmb >= NeedRmb andalso Period == 1 of
				true ->
				    {lists:keystore(IdT, 2, Acc,
						    {DayT, IdT, 1, NeedRmb,
						     NeedRmb}),
				     RoleTemp};
				_ when AllRmb >= NeedRmb ->
				    {lists:keystore(IdT, 2, Acc,
						    {DayT, IdT, 1, NeedRmb,
						     NeedRmb}),
				     RoleTemp};
				_ when Period == 1 ->
				    {lists:keystore(IdT, 2, Acc,
						    {DayT, IdT, 0, NeedRmb,
						     AccRmb}),
				     RoleTemp};
				_ ->
				    {lists:keystore(IdT, 2, Acc,
						    {DayT, IdT, 0, NeedRmb,
						     AllRmb}),
				     RoleTemp}
			      end;
			  _ -> {Acc, RoleTemp}
			end;
		    _ -> {Acc, RoleTemp}
		  end;
	      (_, {Acc, RoleTemp}) -> {Acc, RoleTemp}
	  end,
    {NewWelfareList, Role2} = lists:foldl(Fun,
					  {WelfareList, Role}, WelfareList),
    NewRole = Role2#role{m_day_goals =
			     MDayGoals#m_day_goals{welfare_list =
						       NewWelfareList,
						   charge = NewAllCharge}},
    push_quest(NewRole),
    NewRole.

info(Role = #role{reg_time = RegTime,
		  m_day_goals =
		      #m_day_goals{end_time = EndTime, num = Num,
				   welfare_list = List1, grow_list = List2,
				   price_list = List3, finish_list = List4,
				   period = Period}}) ->
    Date = date:unixtime(),
    case Date > EndTime of
      true -> {false, lang:get(<<"活动已结束"/utf8>>)};
      _ ->
	  case get_period(RegTime) of
	    {Period, Day} ->
		DayCharge = var:get_var(Role, day, 30, 0),
		FinishL = day_goals_data:get_finish_list(Period),
		Fun = fun ({FId, FNum, _}, Acc) ->
			      case lists:member(FId, List4) of
				true -> [{FId, 2} | Acc];
				_ ->
				    Status = util:if_true(Num >= FNum, 1, 0),
				    [{FId, Status} | Acc]
			      end
		      end,
		NList4 = lists:foldl(Fun, [], FinishL),
		{ok, Period, DayCharge, Day, Num, EndTime - Date, List1,
		 List2, List3, NList4};
	    _ -> {false, lang:get(<<"数据异常"/utf8>>)}
	  end
    end.

info_quest(Role = #role{reg_time = RegTime,
			m_day_goals =
			    #m_day_goals{end_time = EndTime, num = Num,
					 welfare_list = List1,
					 grow_list = List2, price_list = List3,
					 finish_list = List4}}) ->
    Date = date:unixtime(),
    case Date > EndTime of
      true -> {false, lang:get(<<"活动已结束"/utf8>>)};
      _ ->
	  {Period, Day} = get_period(RegTime),
	  DayCharge = var:get_var(Role, day, 30, 0),
	  FinishL = day_goals_data:get_finish_list(Period),
	  Fun = fun ({FId, FNum, _}, Acc) ->
			case lists:member(FId, List4) of
			  true -> [{FId, 2} | Acc];
			  _ ->
			      Status = util:if_true(Num >= FNum, 1, 0),
			      [{FId, Status} | Acc]
			end
		end,
	  NList4 = lists:foldl(Fun, [], FinishL),
	  Fun2 = fun (GrowData = #grow_data{day = GDay,
					    status = 1},
		      Acc)
			 when GDay > Day ->
			 [GrowData#grow_data{status = 0} | Acc];
		     (GrowData, Acc) -> [GrowData | Acc]
		 end,
	  NList2 = lists:foldl(Fun2, [], List2),
	  NList3 = [{BuyId, 1} || {BuyId, _} <- List3],
	  {ok, Period, DayCharge, Day, Num, EndTime - Date, List1,
	   NList2, NList3, NList4}
    end.

push(Role) ->
    Data = case day_goals:info(Role) of
	     {false, Msg} -> {0, Msg, 0, 0, 0, 0, 0, [], [], [], []};
	     {ok, Period, Charge, Day, Num, EndTime, WelfareList,
	      GrowList, PriceList, FinishList} ->
		 PushPeriod = min(Period, 7),
		 {1, <<>>, PushPeriod, Charge, Day, Num, EndTime,
		  WelfareList, GrowList, PriceList, FinishList}
	   end,
    sys_conn:pack_send(13601, Data),
    ok.

push_quest(Role) ->
    Data = case info_quest(Role) of
	     {false, Msg} -> {0, Msg, 0, 0, 0, 0, 0, [], [], [], []};
	     {ok, Period, Charge, Day, Num, EndTime, WelfareList,
	      GrowList, PriceList, FinishList} ->
		 PushPeriod = min(Period, 7),
		 {1, <<>>, PushPeriod, Charge, Day, Num, EndTime,
		  WelfareList, GrowList, PriceList, FinishList}
	   end,
    sys_conn:pack_send(13601, Data),
    ok.

get_award(Role = #role{reg_time = RegTime,
		       m_day_goals =
			   #m_day_goals{end_time = EndTime, num = Num,
					welfare_list = List1}},
	  1, Id) ->
    Date = date:unixtime(),
    case Date > EndTime of
      true -> {false, lang:get(<<"活动已结束"/utf8>>)};
      _ ->
	  case lists:keyfind(Id, 2, List1) of
	    {_, Id, 1, TargetVal, Val} ->
		{_Period, MyDay} = get_period(RegTime),
		{ThisDay, AwardList} = day_goals_data:get_award1(Id),
		case ThisDay > MyDay of
		  true -> {false, lang:get(<<"请明天再来领取"/utf8>>)};
		  _ ->
		      GL = format:val_to_gain(AwardList, day_goals),
		      case role_gain:do_notice(Role, GL) of
			{false, #gain{msg = Msg}} -> {false, Msg};
			{ok, Role3 = #role{m_day_goals = MDayGoals}} ->
			    log:log_gain(GL, Role, Role3, <<"七日目标"/utf8>>,
					 util:fbin("七日目标奖励领取:~w", [Id])),
			    NewList1 = lists:keyreplace(Id, 2, List1,
							{ThisDay, Id, 2,
							 TargetVal, Val}),
			    NewNum = Num + 1,
			    NRole = Role3#role{m_day_goals =
						   MDayGoals#m_day_goals{num =
									     NewNum,
									 welfare_list
									     =
									     NewList1}},
			    log:save(join,
				     {NRole, <<"七日目标"/utf8>>,
				      util:fbin(<<"Day_~w"/utf8>>, [Id])}),
			    {ok, 2, NewNum, NRole}
		      end
		end;
	    {_, Id, 2, _, _} -> {false, lang:get(<<"奖励已领取"/utf8>>)};
	    _ -> {false, lang:get(<<"条件未达成，不可领取"/utf8>>)}
	  end
    end;
get_award(Role = #role{lev = Lev, reg_time = RegTime,
		       m_day_goals =
			   #m_day_goals{end_time = EndTime, num = Num,
					grow_list = List2}},
	  Type, Id)
    when Type =:= 2 orelse Type =:= 3 ->
    Date = date:unixtime(),
    case Date > EndTime of
      true -> {false, lang:get(<<"活动已结束"/utf8>>)};
      _ ->
	  case lists:keyfind(Id, #grow_data.goal_id, List2) of
	    GrowData = #grow_data{goal_id = Id, status = 1} ->
		{Period, MyDay} = get_period(RegTime),
		ListsTemp = day_goals_data:get_grow_list(Period),
		case lists:keyfind(Id, 2, ListsTemp) of
		  {_, _, LimitLev} ->
		      case LimitLev > Lev of
			true -> {false, lang:get(<<"等级不足"/utf8>>)};
			_ ->
			    {ThisDay, AwardList} =
				day_goals_data:get_award1(Id),
			    case ThisDay > MyDay of
			      true -> {false, lang:get(<<"请明天再来领取"/utf8>>)};
			      _ ->
				  GL = format:val_to_gain(AwardList, day_goals),
				  case role_gain:do_notice(Role, GL) of
				    {false, #gain{msg = Msg}} -> {false, Msg};
				    {ok,
				     Role2 = #role{m_day_goals = MDayGoals}} ->
					log:log_gain(GL, Role, Role2,
						     <<"七日目标"/utf8>>,
						     util:fbin("七日目标奖励领取:~w",
							       [Id])),
					NewList2 = lists:keyreplace(Id,
								    #grow_data.goal_id,
								    List2,
								    GrowData#grow_data{status
											   =
											   2}),
					NewNum = Num + 1,
					NRole = Role2#role{m_day_goals =
							       MDayGoals#m_day_goals{num
											 =
											 NewNum,
										     grow_list
											 =
											 NewList2}},
					log:save(join,
						 {NRole, <<"七日目标"/utf8>>,
						  util:fbin(<<"Task_~w"/utf8>>,
							    [Id])}),
					{ok, 2, NewNum, NRole}
				  end
			    end
		      end;
		  _ -> {false, lang:get(<<"参数错误"/utf8>>)}
		end;
	    #grow_data{status = 2} ->
		{false, lang:get(<<"奖励已领取"/utf8>>)};
	    _ -> {false, lang:get(<<"条件未达成，不可领取"/utf8>>)}
	  end
    end;
get_award(Role = #role{m_vip = #m_vip{lev = VipLev},
		       reg_time = RegTime,
		       m_day_goals =
			   #m_day_goals{end_time = EndTime, num = Num,
					price_list = List3}},
	  4, Id) ->
    Date = date:unixtime(),
    case Date > EndTime of
      true -> {false, lang:get(<<"活动已结束"/utf8>>)};
      _ ->
	  case lists:keyfind(Id, 1, List3) of
	    {Id, 0} ->
		{_Period, MyDay} = get_period(RegTime),
		{Day, VipLimit, Price, AwardList} =
		    day_goals_data:get_award2(Id),
		if Day > MyDay -> {false, lang:get(<<"请明天再来购买"/utf8>>)};
		   VipLimit > VipLev ->
		       {false,
			util:fbin(lang:get(<<"需要VIP~w级才能购买"/utf8>>),
				  [VipLimit])};
		   true ->
		       Loss = [#loss{label = gold, val = Price}],
		       Gain = format:val_to_gain(AwardList, day_goals_buy),
		       GL = Loss ++ Gain,
		       case role_gain:do_notice(Role, GL) of
			 {false, #gain{msg = Msg}} -> {false, Msg};
			 {false, #loss{msg = Msg}} -> {false, Msg};
			 {ok, Role1 = #role{m_day_goals = MDayGoals}} ->
			     log:log_gain(GL, Role, Role1, <<"七日目标"/utf8>>,
					  util:fbin("七日目标半价购买:~w", [Id])),
			     NewList3 = lists:keyreplace(Id, 1, List3, {Id, 1}),
			     NewNum = Num + 1,
			     NRole = Role1#role{m_day_goals =
						    MDayGoals#m_day_goals{num =
									      NewNum,
									  price_list
									      =
									      NewList3}},
			     log:save(join,
				      {NRole, <<"七日目标"/utf8>>,
				       util:fbin(<<"Buy_~w"/utf8>>, [Id])}),
			     {ok, 1, NewNum, NRole}
		       end
		end;
	    _ -> {false, lang:get(<<"已购买"/utf8>>)}
	  end
    end;
get_award(Role = #role{reg_time = RegTime,
		       m_day_goals =
			   #m_day_goals{end_time = EndTime, num = Num,
					finish_list = List4}},
	  5, Id) ->
    Date = date:unixtime(),
    case Date > EndTime of
      true -> {false, lang:get(<<"活动已结束"/utf8>>)};
      _ ->
	  {Period, MyDay} = get_period(RegTime),
	  Flag4 = lists:member(Id, List4),
	  {GoalNum, AwardList} = day_goals_data:get_award3(Id),
	  AllIds = day_goals_data:get_finish_list(Period),
	  case lists:keymember(Id, 1, AllIds) of
	    false -> {false, lang:get(<<"参数错误"/utf8>>)};
	    _ ->
		case MyDay > 7 of
		  true -> {false, lang:get(<<"超出奖励领取时间"/utf8>>)};
		  _ ->
		      case Flag4 of
			true -> {false, lang:get(<<"奖励已领取"/utf8>>)};
			_ ->
			    case Num >= GoalNum of
			      false -> {false, lang:get(<<"未到可领取条件"/utf8>>)};
			      _ ->
				  GL = format:val_to_gain(AwardList, day_goals),
				  case role_gain:do_notice(Role, GL) of
				    {false, #gain{msg = Msg}} -> {false, Msg};
				    {ok,
				     Role2 = #role{m_day_goals = MDayGoals}} ->
					log:log_gain(GL, Role, Role2,
						     <<"七日目标"/utf8>>,
						     util:fbin("七日目标奖励领取:~w",
							       [Id])),
					NewList4 = [Id | List4],
					NewNum = Num + 1,
					NRole = Role2#role{m_day_goals =
							       MDayGoals#m_day_goals{num
											 =
											 NewNum,
										     finish_list
											 =
											 NewList4}},
					log:save(join,
						 {NRole, <<"七日目标"/utf8>>,
						  util:fbin(<<"Finish_~w"/utf8>>,
							    [Id])}),
					{ok, 2, NewNum, NRole}
				  end
			    end
		      end
		end
	  end
    end;
get_award(_, _, _) ->
    {false, lang:get(<<"领取参数错误"/utf8>>)}.

reset_progress_val(#role{reg_time = RegTime,
			 m_day_goals = #m_day_goals{period = 7}},
		   [Prog = #quest_progress{label = evt_arena_fight}],
		   _GrowId) ->
    Day = date:day_diff(RegTime, date:unixtime()),
    PeriodDay = min(2, Day rem 7 + 1),
    NewNum = PeriodDay * 5,
    [update_prog(Prog, NewNum)];
reset_progress_val(#role{reg_time = RegTime,
			 m_day_goals = #m_day_goals{period = 7}},
		   [Prog = #quest_progress{label = evt_guild_dun_fight}],
		   _GrowId) ->
    Day = date:day_diff(RegTime, date:unixtime()),
    PeriodDay = min(2, Day rem 7 + 1),
    NewNum = PeriodDay * 5,
    [update_prog(Prog, NewNum)];
reset_progress_val(#role{reg_time = RegTime,
			 m_day_goals = #m_day_goals{period = 7}},
		   [Prog = #quest_progress{label =
					       evt_dungeon_stone_fight}],
		   _GrowId) ->
    Day = date:day_diff(RegTime, date:unixtime()),
    PeriodDay = min(2, Day rem 7 + 1),
    NewNum = PeriodDay * 8,
    [update_prog(Prog, NewNum)];
reset_progress_val(#role{reg_time = RegTime,
			 m_day_goals = #m_day_goals{period = 7}},
		   [Prog = #quest_progress{label = evt_star_tower_pass}],
		   _GrowId) ->
    Day = date:day_diff(RegTime, date:unixtime()),
    PeriodDay = min(2, Day rem 7 + 1),
    NewNum = PeriodDay * 4,
    [update_prog(Prog, NewNum)];
reset_progress_val(#role{reg_time = RegTime,
			 m_day_goals = #m_day_goals{period = 7}},
		   [Prog = #quest_progress{label =
					       evt_expedition_fight_count}],
		   _GrowId) ->
    Day = date:day_diff(RegTime, date:unixtime()),
    PeriodDay = min(2, Day rem 7 + 1),
    NewNum = PeriodDay * 8,
    [update_prog(Prog, NewNum)];
reset_progress_val(#role{reg_time = RegTime,
			 m_day_goals = #m_day_goals{period = 7}},
		   [Prog = #quest_progress{label = evt_artifact_recast}],
		   _GrowId) ->
    Day = date:day_diff(RegTime, date:unixtime()),
    PeriodDay = min(2, Day rem 7 + 1),
    NewNum = PeriodDay * 1,
    [update_prog(Prog, NewNum)];
reset_progress_val(#role{reg_time = RegTime,
			 m_day_goals = #m_day_goals{period = 7}},
		   [Prog = #quest_progress{label =
					       evt_adventure_treasure_open}],
		   _GrowId) ->
    Day = date:day_diff(RegTime, date:unixtime()),
    PeriodDay = min(2, Day rem 7 + 1),
    NewNum = PeriodDay * 4,
    [update_prog(Prog, NewNum)];
reset_progress_val(#role{reg_time = RegTime,
			 m_day_goals = #m_day_goals{period = 7}},
		   [Prog = #quest_progress{label = evt_shipping,
					   param = []}],
		   _GrowId) ->
    Day = date:day_diff(RegTime, date:unixtime()),
    PeriodDay = min(2, Day rem 7 + 1),
    NewNum = PeriodDay * 8,
    [update_prog(Prog, NewNum)];
reset_progress_val(#role{reg_time = RegTime,
			 m_day_goals = #m_day_goals{period = 7}},
		   [Prog = #quest_progress{label = evt_shipping_refresh}],
		   _GrowId) ->
    Day = date:day_diff(RegTime, date:unixtime()),
    PeriodDay = min(2, Day rem 7 + 1),
    NewNum = PeriodDay * 5,
    [update_prog(Prog, NewNum)];
reset_progress_val(#role{reg_time = RegTime,
			 m_day_goals = #m_day_goals{period = 7}},
		   [Prog = #quest_progress{label =
					       evt_adventure_item_expend_count}],
		   _GrowId) ->
    Day = date:day_diff(RegTime, date:unixtime()),
    PeriodDay = min(2, Day rem 7 + 1),
    NewNum = PeriodDay * 3,
    [update_prog(Prog, NewNum)];
reset_progress_val(Role, Progress, GrowId) ->
    quest_prog_init:do(Role, Progress, GrowId).

update_prog(Prog, Val) ->
    #quest_progress{target_val = TarVal, value = OldVal} =
	Prog,
    if Val >= TarVal ->
	   Prog#quest_progress{finish = 1, value = TarVal};
       Val > OldVal -> Prog#quest_progress{value = Val};
       true -> Prog
    end.


