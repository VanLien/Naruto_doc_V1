-file("src/mod/market/market_gold.erl", 1).

-module(market_gold).

-lager_records([{calc_sold_price,
		 [type, price, discount, exchange_base_id, exchange_num,
		  is_margin, init_price, cur_price, cur_margin]},
		{state, [reset_timer, platform, zone_id]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{market_gold_limit_data,
		 [id, min, max, num, is_show, type]},
		{market_gold_price,
		 [base_id, margin_type, init_price, buy_price, margin]},
		{market_gold_change_item, [base_id, got_list, catalg]},
		{market_gold_item,
		 [id, base_id, stock, init_stock, init_price, def_price,
		  cur_price, margin, margin_acc]},
		{market_gold_item_data,
		 [id, base_id, catalg, init_price, init_stock, open_lev,
		  max_price, min_price, limit_type, limit_num]},
		{m_market_gold, [ver, limit_data]},
		{market_price, [base_id, price, assets, source]},
		{notice_board,
		 [id, type, title, summary, content, sort, lev, items,
		  start_time, end_time, channel]},
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{link, [socket, conn_pid, ip, port, lag]},
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

-behaviour(gen_server).

-export([get_items/2, get_items_by_catalg/2, buy/3,
	 query_market_price/1, reload/0, sold/3, start_link/0,
	 push_change_items/2, push_change_items_by_bid/2,
	 change_margin/3, fill_item_price/1, query_fill_price/1,
	 role_market_init/0, push_23520/1, buy_list/3]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

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

-file("src/mod/market/market_gold.erl", 38).

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

-file("src/mod/market/market_gold.erl", 39).

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

-file("src/mod/market/market_gold.erl", 40).

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

-file("src/mod/market/market_gold.erl", 41).

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

-file("src/mod/market/market_gold.erl", 42).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/mod/market/market_gold.erl", 43).

-file("inc/log.hrl", 1).

-file("src/mod/market/market_gold.erl", 44).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("src/mod/market/market_gold.erl", 45).

-file("inc/notice.hrl", 1).

-record(notice_board,
	{id = 0, type = 1, title = <<>>, summary = <<>>,
	 content = <<>>, sort = 0, lev = 0, items = [],
	 start_time = 0, end_time = 0, channel = []}).

-file("src/mod/market/market_gold.erl", 46).

-file("inc/market.hrl", 1).

-record(market_price,
	{base_id = 0, price = 0, assets = 0, source = 0}).

-file("src/mod/market/market_gold.erl", 47).

-file("inc/market_gold.hrl", 1).

-record(m_market_gold, {ver = 1, limit_data = []}).

-record(market_gold_item_data,
	{id  :: pos_integer(), base_id  :: pos_integer(),
	 catalg  :: pos_integer(),
	 init_price  :: non_neg_integer(),
	 init_stock  :: non_neg_integer(),
	 open_lev  :: non_neg_integer(),
	 max_price  :: non_neg_integer(),
	 min_price  :: non_neg_integer(),
	 limit_type  :: pos_integer(),
	 limit_num  :: non_neg_integer()}).

-record(market_gold_item,
	{id  :: pos_integer(), base_id = 0  :: pos_integer(),
	 stock = 0  :: non_neg_integer(),
	 init_stock = 0  :: non_neg_integer(),
	 init_price = 0  :: non_neg_integer(),
	 def_price = 0  :: non_neg_integer(),
	 cur_price = 0  :: non_neg_integer(),
	 margin = 1000  :: non_neg_integer(),
	 margin_acc = 1000  :: non_neg_integer()}).

-record(market_gold_change_item,
	{base_id = 0  :: pos_integer(),
	 got_list = []  :: list(),
	 catalg = 0  :: pos_integer()}).

-record(market_gold_price,
	{base_id = 0, margin_type = 0, init_price = 0,
	 buy_price = 0, margin = 0}).

-record(market_gold_limit_data,
	{id = 0, min = 0, max = 0, num = 0, is_show = 0,
	 type = 0}).

-file("src/mod/market/market_gold.erl", 48).

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

-file("src/mod/market/market_gold.erl", 49).

-file("inc/game_assets.hrl", 1).

-file("src/mod/market/market_gold.erl", 50).

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

-file("src/mod/market/market_gold.erl", 51).

-record(state,
	{reset_timer, platform = "", zone_id = -1}).

-record(calc_sold_price,
	{type = 1, price = 0, discount = 0,
	 exchange_base_id = 0, exchange_num = 0, is_margin = 1,
	 init_price = 0, cur_price = 0, cur_margin = 0}).

role_market_init() -> #m_market_gold{}.

start_link() ->
    gen_server:start_link({local, market_gold}, market_gold,
			  [], []).

reload() -> gen_server:cast(market_gold, reload), ok.

save(Tab, Data) ->
    case catch ets:insert(Tab, Data) of
      true -> true;
      _ -> false
    end,
    case catch dets:insert(Tab, Data) of
      ok -> true;
      _ -> false
    end.

delete(Tab, Key) ->
    case catch ets:delete(Tab, Key) of
      true -> true;
      _ -> false
    end,
    case catch dets:delete(Tab, Key) of
      ok -> true;
      _ -> false
    end.

lookup(Tab, Key) ->
    case catch ets:lookup(Tab, Key) of
      [Obj] -> Obj;
      _ -> false
    end.

get_items([], Acc) -> Acc;
get_items([Id | Rest], Acc) ->
    case lookup(market_gold_item_tab, Id) of
      false -> get_items(Rest, Acc);
      Obj -> get_items(Rest, [Obj | Acc])
    end.

get_items_by_catalg(Catalg = 0, Role) ->
    Catalgs = [1, 5, 3, 4, 2],
    Items = get_items_by_catalg(Catalgs, [], Role),
    {ok, {Catalg, Items}};
get_items_by_catalg(Catalg, Role) ->
    Ids = market_gold_data:get_catalg_items(Catalg),
    NewIds = check_show(Ids, Role, #{}, []),
    Items = get_items(NewIds, []),
    {ok, {Catalg, Items}}.

get_items_by_catalg([], Acc, _Role) -> Acc;
get_items_by_catalg([Catalg | Rest], Acc, Role) ->
    Ids = market_gold_data:get_catalg_items(Catalg),
    NewIds = check_show(Ids, Role, #{}, []),
    Items = get_items(NewIds, []),
    NewAcc = Items ++ Acc,
    get_items_by_catalg(Rest, NewAcc, Role).

check_show([], _Role, _, List) -> lists:reverse(List);
check_show([{Id, OpenLev} | T], Role = #role{lev = Lev},
	   Args = #{}, List) ->
    NewList = case OpenLev =< Lev of
		true -> [Id | List];
		_ -> List
	      end,
    check_show(T, Role, Args, NewList).

query_market_price(BaseId) ->
    case case lookup(market_gold_item_tab, BaseId) of
	   #market_gold_item{margin = DefineMargin,
			     init_price = DefineInitPirce} ->
	       DefineUnitPrice = calc_price(4, BaseId, DefineInitPirce,
					    DefineMargin),
	       DefineGoldPrice = #market_gold_price{base_id = BaseId,
						    margin_type = 1000,
						    margin = DefineMargin,
						    init_price =
							DefineInitPirce,
						    buy_price =
							DefineUnitPrice},
	       {ok, DefineGoldPrice};
	   _ -> false
	 end
	of
      {ok, #market_gold_price{buy_price = Price}} ->
	  MarketPrice = #market_price{base_id = BaseId,
				      price = Price, assets = 1, source = 2},
	  {ok, MarketPrice};
      _False ->
	  case market_gold_data:get_invisible_price(BaseId) of
	    Price when is_integer(Price) ->
		MarketPrice = #market_price{base_id = BaseId,
					    price = Price, assets = 1,
					    source = 2},
		{ok, MarketPrice};
	    _ ->
		case market_gold_data:get_exchange_item(BaseId) of
		  {ExchangBaseId, ExchangNum} ->
		      case lookup(market_gold_item_tab, ExchangBaseId) of
			#market_gold_item{margin = Margin,
					  init_price = InitPirce} ->
			    UnitPrice = calc_price(4, ExchangBaseId, InitPirce,
						   Margin),
			    NewPrice = case
					 market_gold_data:get_const_price(ExchangBaseId)
					   of
					 ExchangDiscount
					     when is_integer(ExchangDiscount) ->
					     util:floor(ExchangDiscount / 1000 *
							  UnitPrice);
					 _ -> util:floor(9.0e-1 * UnitPrice)
				       end,
			    CalcPrice = #market_price{base_id = BaseId,
						      price =
							  NewPrice * ExchangNum,
						      assets = 1, source = 2},
			    {ok, CalcPrice};
			_ -> false
		      end;
		  _ -> false
		end
	  end
    end.

buy(Role, BaseId, Num) ->
    case case lookup(market_gold_item_tab, BaseId) of
	   #market_gold_item{margin = DefineMargin,
			     init_price = DefineInitPirce} ->
	       if DefineMargin >= 1100 ->
		      DefineUnitPrice = calc_price(3, BaseId, DefineInitPirce,
						   DefineMargin),
		      DefineGoldPrice = #market_gold_price{base_id = BaseId,
							   margin_type = 1100,
							   margin =
							       DefineMargin,
							   init_price =
							       DefineInitPirce,
							   buy_price =
							       DefineUnitPrice},
		      {ok, DefineGoldPrice};
		  true ->
		      DefineUnitPrice = calc_price(4, BaseId, DefineInitPirce,
						   DefineMargin),
		      DefineGoldPrice = #market_gold_price{base_id = BaseId,
							   margin_type = 1000,
							   margin =
							       DefineMargin,
							   init_price =
							       DefineInitPirce,
							   buy_price =
							       DefineUnitPrice},
		      {ok, DefineGoldPrice}
	       end;
	   _ -> false
	 end
	of
      {ok, GoldPrice} ->
	  buy_gain(Role, BaseId, Num, GoldPrice);
      Rtn = {false, _} -> Rtn;
      _ -> false
    end.

-spec buy_list(#role{}, list(), bitstring()) -> {ok,
						 #role{}} |
						false | {false, bitstring()}.

buy_list(Role, BuyList, LogType) ->
    case buy_gain_list(BuyList, 0, [], Role) of
      {ok, TotalPrice, _Items, Role1} ->
	  Loss = #loss{label = coin, val = TotalPrice},
	  GL = [Loss],
	  case role_gain:do(Role1, GL) of
	    {ok, NRole} ->
		case case catch gen_server:call(market_gold,
						{buy, BuyList}, 10000)
			 of
		       {'EXIT', _Call_Err} ->
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
			     {__Pidmarket_gold295, _,
			      {__Levelmarket_gold295, __Tracesmarket_gold295}}
				 when __Levelmarket_gold295 band 8 /= 0 orelse
					__Tracesmarket_gold295 /= [] ->
				 lager:do_log(error,
					      [{module, market_gold},
					       {function, buy_list},
					       {line, 295},
					       {pid, pid_to_list(self())},
					       {node, node()}
					       | lager:md()],
					      io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
							    [market_gold,
							     {buy, BuyList},
							     10000,
							     erlang:get_stacktrace()]),
					      none, 4096, 8,
					      __Levelmarket_gold295,
					      __Tracesmarket_gold295,
					      lager_event, __Pidmarket_gold295);
			     _ -> ok
			   end,
			   case _Call_Err of
			     {timeout, _} -> {error, timeout};
			     {noproc, _} -> {error, noproc};
			     {normal, _} -> {error, exit};
			     _ -> {error, _Call_Err}
			   end;
		       _Call_Return -> _Call_Return
		     end
		    of
		  {ok, MarginAcc} ->
		      LogText = log_purchs_list_text(Loss, BuyList,
						     MarginAcc),
		      log:save(market_gold, {NRole, LogText}),
		      NewRole = NRole,
		      push_change_items_list(NewRole),
		      push_23520(NewRole),
		      log:log_gain(GL, Role, NewRole, LogType,
				   util:fbin("金币市场批量购买列表~w", [BuyList])),
		      {ok, NewRole};
		  {false, ErrMsg} -> {false, ErrMsg};
		  false -> false;
		  Err ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidmarket_gold307, _,
			 {__Levelmarket_gold307, __Tracesmarket_gold307}}
			    when __Levelmarket_gold307 band 8 /= 0 orelse
				   __Tracesmarket_gold307 /= [] ->
			    lager:do_log(error,
					 [{module, market_gold},
					  {function, buy_list}, {line, 307},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("购买同步调用错误:[~w]", [Err]),
					 none, 4096, 8, __Levelmarket_gold307,
					 __Tracesmarket_gold307, lager_event,
					 __Pidmarket_gold307);
			_ -> ok
		      end,
		      false
		end;
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    _False -> false
	  end;
      {false, Msg} -> {false, Msg};
      _ -> false
    end.

check_limit(Role = #role{lev = Lev}, BaseId, Num) ->
    {LimitType, LimitNum, OpenLev} = case
				       market_gold_data:get(BaseId)
					 of
				       #market_gold_item_data{limit_type =
								  LimitType1,
							      limit_num =
								  LimitNum1,
							      open_lev =
								  OpenLev1} ->
					   {LimitType1, LimitNum1, OpenLev1};
				       _ -> {-1, 0, 999}
				     end,
    case OpenLev =< Lev of
      true ->
	  case LimitType of
	    0 -> {ok, Role};
	    1 ->
		HasNum = get_val(Role, day, BaseId),
		NewNum = HasNum + Num,
		case NewNum =< LimitNum of
		  true ->
		      Role_1 = set_val(Role, day, BaseId, NewNum),
		      {ok, Role_1};
		  false ->
		      NMsg =
			  util:fbin(lang:get(<<"~ts每日限购~w个，请明天再来看看吧"/utf8>>),
				    [color:format({item, BaseId}), LimitNum]),
		      {true, NMsg}
		end;
	    2 ->
		HasNum = get_val(Role, week, BaseId),
		NewNum = HasNum + Num,
		case NewNum =< LimitNum of
		  true ->
		      Role_1 = set_val(Role, week, BaseId, NewNum),
		      {ok, Role_1};
		  false ->
		      NMsg =
			  util:fbin(lang:get(<<"~ts每周限购~w个，请下周再来看看吧"/utf8>>),
				    [color:format({item, BaseId}), LimitNum]),
		      {true, NMsg}
		end;
	    _ -> {true, lang:get(<<"物品不存在"/utf8>>)}
	  end;
      _ ->
	  NMsg = util:fbin(lang:get(<<"等级不足，无法购买~ts"/utf8>>),
			   [color:format({item, BaseId})]),
	  {true, NMsg}
    end.

buy_gain(Role = #role{pid = Pid}, BaseId, Num,
	 #market_gold_price{margin_type = MarginType,
			    init_price = InitPirce, buy_price = Price,
			    margin = _CurMargin}) ->
    case check_limit(Role, BaseId, Num) of
      {true, NoticeMsg} -> {false, NoticeMsg};
      {ok, Role1} ->
	  case make_market_gold_item(BaseId, Num, Price) of
	    {ok, Item} ->
		LossMsg = util:fbin(lang:get(<<"您的~ts不足"/utf8>>),
				    [color:format({assets, 1})]),
		TotalPrice = Price * Num,
		Loss = #loss{label = coin, val = TotalPrice,
			     msg = LossMsg},
		Gain = #gain{label = items_to_bag, val = [Item]},
		GL = [Loss, Gain],
		case role_gain:do_notice(Role1, GL) of
		  {ok, NRole} ->
		      case case catch gen_server:call(market_gold,
						      {buy, Pid, {BaseId, Num}},
						      10000)
			       of
			     {'EXIT', _Call_Err} ->
				 case {whereis(lager_event),
				       whereis(lager_event),
				       lager_config:get({lager_event, loglevel},
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
				   {__Pidmarket_gold380, _,
				    {__Levelmarket_gold380,
				     __Tracesmarket_gold380}}
				       when __Levelmarket_gold380 band 8 /= 0
					      orelse
					      __Tracesmarket_gold380 /= [] ->
				       lager:do_log(error,
						    [{module, market_gold},
						     {function, buy_gain},
						     {line, 380},
						     {pid, pid_to_list(self())},
						     {node, node()}
						     | lager:md()],
						    io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
								  [market_gold,
								   {buy, Pid,
								    {BaseId,
								     Num}},
								   10000,
								   erlang:get_stacktrace()]),
						    none, 4096, 8,
						    __Levelmarket_gold380,
						    __Tracesmarket_gold380,
						    lager_event,
						    __Pidmarket_gold380);
				   _ -> ok
				 end,
				 case _Call_Err of
				   {timeout, _} -> {error, timeout};
				   {noproc, _} -> {error, noproc};
				   {normal, _} -> {error, exit};
				   _ -> {error, _Call_Err}
				 end;
			     _Call_Return -> _Call_Return
			   end
			  of
			{ok, {NewPrice, NewMargin}} ->
			    LogArgs = {InitPirce, Price, NewPrice, NewMargin},
			    LogText = log_purchs_text(Loss, Item, LogArgs),
			    log:save(market_gold, {Role, LogText}),
			    NewRole =
				role_trigger:fire(#evt_market_gold_buy{assets =
									   coin,
								       price =
									   TotalPrice,
								       num =
									   Num},
						  NRole),
			    push_23520(NewRole),
			    log:log_gain(GL, Role, NewRole, <<"金币市场"/utf8>>,
					 util:fbin("金币市场购买~w个~w",
						   [Num, BaseId])),
			    {ok, NewRole};
			{false, ErrMsg} -> {false, ErrMsg};
			false -> false;
			Err ->
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
			      {__Pidmarket_gold392, _,
			       {__Levelmarket_gold392, __Tracesmarket_gold392}}
				  when __Levelmarket_gold392 band 8 /= 0 orelse
					 __Tracesmarket_gold392 /= [] ->
				  lager:do_log(error,
					       [{module, market_gold},
						{function, buy_gain},
						{line, 392},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("购买同步调用错误:[~w]",
							     [Err]),
					       none, 4096, 8,
					       __Levelmarket_gold392,
					       __Tracesmarket_gold392,
					       lager_event,
					       __Pidmarket_gold392);
			      _ -> ok
			    end,
			    false
		      end;
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {false, #loss{msg = Msg}} -> {false, Msg};
		  _False -> false
		end;
	    false -> false
	  end
    end.

buy_gain_list([], TotalPrice, Items, Role) ->
    {ok, TotalPrice, Items, Role};
buy_gain_list([{BaseId, Num} | Rest], TotalPrice, Items,
	      Role = #role{pid = _Pid}) ->
    case case lookup(market_gold_item_tab, BaseId) of
	   #market_gold_item{margin = DefineMargin,
			     init_price = DefineInitPirce} ->
	       if DefineMargin >= 1100 ->
		      DefineUnitPrice = calc_price(3, BaseId, DefineInitPirce,
						   DefineMargin),
		      DefineGoldPrice = #market_gold_price{base_id = BaseId,
							   margin_type = 1100,
							   margin =
							       DefineMargin,
							   init_price =
							       DefineInitPirce,
							   buy_price =
							       DefineUnitPrice},
		      {ok, DefineGoldPrice};
		  true ->
		      DefineUnitPrice = calc_price(4, BaseId, DefineInitPirce,
						   DefineMargin),
		      DefineGoldPrice = #market_gold_price{base_id = BaseId,
							   margin_type = 1000,
							   margin =
							       DefineMargin,
							   init_price =
							       DefineInitPirce,
							   buy_price =
							       DefineUnitPrice},
		      {ok, DefineGoldPrice}
	       end;
	   _ -> false
	 end
	of
      {ok, #market_gold_price{buy_price = Price}} ->
	  case check_limit(Role, BaseId, Num) of
	    {true, NoticeMsg} -> {false, NoticeMsg};
	    {ok, Role1} ->
		case make_market_gold_item(BaseId, Num, Price) of
		  {ok, Item} ->
		      NewTotalPrice = TotalPrice + Price * Num,
		      NewItems = [Item | Items],
		      buy_gain_list(Rest, NewTotalPrice, NewItems, Role1);
		  false -> false
		end
	  end;
      Rtn = {false, _} -> Rtn;
      _ -> false
    end;
buy_gain_list([_ | Rest], TotalPrice, Items, Role) ->
    buy_gain_list(Rest, TotalPrice, Items, Role).

make_market_gold_item(BaseId, Num, Price) ->
    NewPrice = util:floor(9.0e-1 * Price),
    case item:make(BaseId, 0, Num) of
      {ok, [Item]} ->
	  NewItem = Item#item{extra =
				  [{5, NewPrice, ""}, {6, 1, ""}, {7, 2, ""}]},
	  {ok, NewItem};
      false -> false
    end.

fill_item_price(Item = #item{base_id = BaseId,
			     extra = Extra}) ->
    case lists:keyfind(5, 1, Extra) of
      Tuple when is_tuple(Tuple) -> Item;
      _ ->
	  case case lookup(market_gold_item_tab, BaseId) of
		 #market_gold_item{margin = DefineMargin,
				   init_price = DefineInitPirce} ->
		     if DefineMargin >= 1100 ->
			    DefineUnitPrice = calc_price(3, BaseId,
							 DefineInitPirce,
							 DefineMargin),
			    DefineGoldPrice = #market_gold_price{base_id =
								     BaseId,
								 margin_type =
								     1100,
								 margin =
								     DefineMargin,
								 init_price =
								     DefineInitPirce,
								 buy_price =
								     DefineUnitPrice},
			    {ok, DefineGoldPrice};
			true ->
			    DefineUnitPrice = calc_price(4, BaseId,
							 DefineInitPirce,
							 DefineMargin),
			    DefineGoldPrice = #market_gold_price{base_id =
								     BaseId,
								 margin_type =
								     1000,
								 margin =
								     DefineMargin,
								 init_price =
								     DefineInitPirce,
								 buy_price =
								     DefineUnitPrice},
			    {ok, DefineGoldPrice}
		     end;
		 _ -> false
	       end
	      of
	    {ok, #market_gold_price{buy_price = Price}} ->
		NewPrice = util:floor(9.0e-1 * Price),
		AddExtra = [{5, NewPrice, ""}, {6, 1, ""}, {7, 2, ""}],
		NewExtra = AddExtra ++ Extra,
		Item#item{extra = NewExtra};
	    _ ->
		case market_gold_data:get_invisible_price(BaseId) of
		  NewPrice when is_integer(NewPrice) ->
		      AddExtra = [{5, NewPrice, ""}, {6, 1, ""}, {7, 2, ""}],
		      NewExtra = AddExtra ++ Extra,
		      Item#item{extra = NewExtra};
		  _ ->
		      case get_exchange_price(BaseId) of
			{true, BuyPrice} ->
			    AddExtra = [{5, BuyPrice, ""}, {6, 1, ""},
					{7, 2, ""}],
			    NewExtra = AddExtra ++ Extra,
			    Item#item{extra = NewExtra};
			_ -> Item
		      end
		end
	  end
    end.

get_exchange_price(BaseId) ->
    case market_gold_data:get_exchange_item(BaseId) of
      {ExchangBaseId, ExchangNum} ->
	  case lookup(market_gold_item_tab, ExchangBaseId) of
	    #market_gold_item{margin = Margin,
			      init_price = InitPirce} ->
		UnitPrice = calc_price(4, ExchangBaseId, InitPirce,
				       Margin),
		BuyPrice = case
			     market_gold_data:get_const_price(ExchangBaseId)
			       of
			     Discount when is_integer(Discount) ->
				 util:floor(Discount / 1000 * UnitPrice);
			     _False -> util:floor(9.0e-1 * UnitPrice)
			   end,
		BuyPrice1 = round(BuyPrice * ExchangNum),
		{true, BuyPrice1};
	    _ -> false
	  end;
      _ -> false
    end.

query_fill_price(BaseId) ->
    case case lookup(market_gold_item_tab, BaseId) of
	   #market_gold_item{margin = DefineMargin,
			     init_price = DefineInitPirce} ->
	       if DefineMargin >= 1100 ->
		      DefineUnitPrice = calc_price(3, BaseId, DefineInitPirce,
						   DefineMargin),
		      DefineGoldPrice = #market_gold_price{base_id = BaseId,
							   margin_type = 1100,
							   margin =
							       DefineMargin,
							   init_price =
							       DefineInitPirce,
							   buy_price =
							       DefineUnitPrice},
		      {ok, DefineGoldPrice};
		  true ->
		      DefineUnitPrice = calc_price(4, BaseId, DefineInitPirce,
						   DefineMargin),
		      DefineGoldPrice = #market_gold_price{base_id = BaseId,
							   margin_type = 1000,
							   margin =
							       DefineMargin,
							   init_price =
							       DefineInitPirce,
							   buy_price =
							       DefineUnitPrice},
		      {ok, DefineGoldPrice}
	       end;
	   _ -> false
	 end
	of
      {ok, #market_gold_price{buy_price = Price}} ->
	  case market_gold_data:get_const_price(BaseId) of
	    Discount when is_integer(Discount) ->
		util:floor(Discount / 1000 * Price);
	    _False -> util:floor(9.0e-1 * Price)
	  end;
      _ ->
	  case market_gold_data:get_invisible_price(BaseId) of
	    NewPrice when is_integer(NewPrice) -> NewPrice;
	    _ -> 0
	  end
    end.

sold(Role, Id, Num) ->
    Args = #{id => Id, num => Num},
    sold_flow([check, gain], Args, #{}, Role).

check_open_lev(BaseId, Role = #role{lev = Lev}) ->
    case market_gold_data:get(BaseId) of
      #market_gold_item_data{open_lev = LimitOpenLev}
	  when Lev >= LimitOpenLev ->
	  true;
      #market_gold_item_data{open_lev = LimitOpenLev} ->
	  case item_data:get(BaseId) of
	    #item_base{id = ItemId} ->
		Fmt = lang:get(<<"等级不足~ts级，~ts无法出售"/utf8>>),
		Args = [color:format({orange, LimitOpenLev}),
			color:format({item, ItemId})],
		Text = util:fbin(Fmt, Args),
		notice:alert(Text);
	    _ -> false
	  end,
	  false;
      _ ->
	  case market_gold_data:get_invisible_open_lev(BaseId) of
	    InvOpenLev when Lev >= InvOpenLev -> true;
	    InvOpenLev when is_integer(InvOpenLev) ->
		case item_data:get(BaseId) of
		  #item_base{id = ItemId} ->
		      Fmt = lang:get(<<"等级不足~ts级，~ts无法出售"/utf8>>),
		      Args = [color:format({orange, InvOpenLev}),
			      color:format({item, ItemId})],
		      Text = util:fbin(Fmt, Args),
		      notice:alert(Text);
		  _ -> false
		end,
		false;
	    _ ->
		case market_gold_data:get_const_open_lev(BaseId) of
		  ConstOpenLev when Lev >= ConstOpenLev -> true;
		  ConstOpenLev when is_integer(ConstOpenLev) ->
		      case item_data:get(BaseId) of
			#item_base{id = ItemId} ->
			    Fmt = lang:get(<<"等级不足~ts级，~ts无法出售"/utf8>>),
			    Args = [color:format({orange, ConstOpenLev}),
				    color:format({item, ItemId})],
			    Text = util:fbin(Fmt, Args),
			    notice:alert(Text);
			_ -> false
		      end,
		      false;
		  _False ->
		      case market_gold_data:get_exchange_open_lev(BaseId) of
			ExgOpenLev when Lev >= ExgOpenLev -> true;
			ExgOpenLev when is_integer(ExgOpenLev) ->
			    case item_data:get(BaseId) of
			      #item_base{id = ItemId} ->
				  Fmt = lang:get(<<"等级不足~ts级，~ts无法出售"/utf8>>),
				  Args = [color:format({orange, ExgOpenLev}),
					  color:format({item, ItemId})],
				  Text = util:fbin(Fmt, Args),
				  notice:alert(Text);
			      _ -> false
			    end,
			    false;
			_False -> false
		      end
		end
	  end
    end.

sold_check_flow(Item = #item{base_id = BaseId,
			     extra = _Extra},
		Cache, Role) ->
    case lookup(market_gold_item_tab, BaseId) of
      #market_gold_item{margin = Margin} when Margin =< 900 ->
	  Text =
	      util:fbin(lang:get(<<"当前物品已下跌至~ts，无法继续出售"/utf8>>),
			[color:format({orange, lang:get(<<"10%"/utf8>>)})]),
	  notice:alert(Text),
	  false;
      #market_gold_item{init_price = InitPirce,
			margin = Margin, cur_price = CurPrice} ->
	  case market_gold_data:get_const_price(BaseId) of
	    Discount when is_integer(Discount) ->
		Price1 = calc_price(4, BaseId, InitPirce, Margin),
		NewPrice = util:floor(Price1 * Discount / 1000),
		CalcPrice = #calc_sold_price{type = 2, is_margin = 1,
					     discount = Discount,
					     price = NewPrice,
					     init_price = InitPirce,
					     cur_price = CurPrice,
					     cur_margin = Margin},
		{ok, Role,
		 Cache#{item => Item, calc_price => CalcPrice}};
	    _False ->
		Price1 = calc_price(4, BaseId, InitPirce, Margin),
		NewPrice = util:floor(Price1 * 9.0e-1),
		CalcPrice = #calc_sold_price{type = 1, is_margin = 1,
					     price = NewPrice,
					     init_price = InitPirce,
					     cur_price = CurPrice,
					     cur_margin = Margin},
		{ok, Role,
		 Cache#{item => Item, calc_price => CalcPrice}}
	  end;
      false ->
	  case market_gold_data:get_invisible_price(BaseId) of
	    SalePrice when is_integer(SalePrice) ->
		CalcPrice = #calc_sold_price{type = 3, is_margin = 0,
					     price = SalePrice},
		{ok, Role,
		 Cache#{item => Item, calc_price => CalcPrice}};
	    _False ->
		case market_gold_data:get_exchange_item(BaseId) of
		  {ExchangBaseId, ExchangNum} ->
		      case lookup(market_gold_item_tab, ExchangBaseId) of
			#market_gold_item{margin = Margin,
					  init_price = InitPirce} ->
			    UnitPrice = calc_price(4, ExchangBaseId, InitPirce,
						   Margin),
			    NewPrice = case
					 market_gold_data:get_const_price(ExchangBaseId)
					   of
					 ExchangDiscount
					     when is_integer(ExchangDiscount) ->
					     util:floor(ExchangDiscount / 1000 *
							  UnitPrice);
					 _False ->
					     util:floor(9.0e-1 * UnitPrice)
				       end,
			    CalcPrice = #calc_sold_price{type = 4,
							 is_margin = 0,
							 price = NewPrice,
							 exchange_num =
							     ExchangNum,
							 exchange_base_id =
							     ExchangBaseId},
			    {ok, Role,
			     Cache#{item => Item, calc_price => CalcPrice}};
			_ ->
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
			      {__Pidmarket_gold624, _,
			       {__Levelmarket_gold624, __Tracesmarket_gold624}}
				  when __Levelmarket_gold624 band 8 /= 0 orelse
					 __Tracesmarket_gold624 /= [] ->
				  lager:do_log(error,
					       [{module, market_gold},
						{function, sold_check_flow},
						{line, 624},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("未找到金币市场数据[Id:~w]",
							     [BaseId]),
					       none, 4096, 8,
					       __Levelmarket_gold624,
					       __Tracesmarket_gold624,
					       lager_event,
					       __Pidmarket_gold624);
			      _ -> ok
			    end,
			    false
		      end;
		  _False -> false
		end
	  end
    end.

sold_flow(check, #{id := Id}, Cache,
	  Role = #role{p_bag = Bag}) ->
    case package:find(by_id, Id, Bag) of
      false ->
	  notice:alert(lang:get(<<"该物品不存在"/utf8>>)), false;
      {ok, Item = #item{base_id = BaseId}} ->
	  case check_open_lev(BaseId, Role) of
	    true -> sold_check_flow(Item, Cache, Role);
	    false ->
		notice:alert(lang:get(<<"等级不足，无法出售该物品"/utf8>>)), false
	  end
    end;
sold_flow(gain, #{id := Id, num := Num},
	  #{item := #item{base_id = BaseId},
	    calc_price :=
		CalcPrice = #calc_sold_price{is_margin = IsMargin,
					     price = UnitPrice, type = Type,
					     exchange_num = ExchangNum,
					     cur_price = CurPrice,
					     cur_margin = CurMargin}},
	  Role) ->
    PriceNum = case Type of
		 4 -> ExchangNum * Num;
		 _ -> Num
	       end,
    TotalPrice = UnitPrice * PriceNum,
    Gain = #gain{label = coin, val = TotalPrice},
    GL = [#loss{label = item_id, val = [{Id, Num}],
		flag = del_marketgold},
	  Gain],
    case role_gain:do_notice(Role, GL) of
      {ok, NewRole} ->
	  UpdateData = case IsMargin of
			 1 ->
			     case change_margin(sold, {BaseId, Num}, NewRole) of
			       {ok, RtnUpdateData} -> RtnUpdateData;
			       _ -> {CurPrice, CurMargin}
			     end;
			 0 -> {CurPrice, CurMargin}
		       end,
	  LogText = log_sold_out_text({BaseId, Num}, CalcPrice,
				      UpdateData),
	  log:save(market_gold, {Role, LogText}),
	  SoleEvt = #evt_market_coin_sold{base_id = BaseId,
					  price = TotalPrice, num = Num},
	  TrgRole = role_trigger:fire(SoleEvt, NewRole),
	  notice:alert(lang:get(<<"出售成功"/utf8>>)),
	  log:log_gain(GL, Role, TrgRole, <<"金币市场"/utf8>>,
		       util:fbin("金币市场出售~w~w", [Num, BaseId])),
	  {ok, TrgRole};
      _ -> notice:alert(lang:get(<<"出售物品失败"/utf8>>)), false
    end;
sold_flow([], _, _, Role) -> {ok, Role};
sold_flow([Step | Rest], Args, Cache, Role) ->
    case sold_flow(Step, Args, Cache, Role) of
      {ok, NewRole} -> sold_flow(Rest, Args, Cache, NewRole);
      {ok, NewRole, NewCache} ->
	  sold_flow(Rest, Args, NewCache, NewRole);
      Rtn -> Rtn
    end.

change_margin(buy, Data, _Role) ->
    gen_server:cast(market_gold, {buy_margin, Data});
change_margin(sold, Data, #role{pid = Pid}) ->
    case catch gen_server:call(market_gold,
			       {sold, Pid, Data}, 10000)
	of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_gold706, _,
	     {__Levelmarket_gold706, __Tracesmarket_gold706}}
		when __Levelmarket_gold706 band 8 /= 0 orelse
		       __Tracesmarket_gold706 /= [] ->
		lager:do_log(error,
			     [{module, market_gold}, {function, change_margin},
			      {line, 706}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [market_gold, {sold, Pid, Data},
					    10000, erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelmarket_gold706,
			     __Tracesmarket_gold706, lager_event,
			     __Pidmarket_gold706);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end;
change_margin(Label, Data, _Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_gold708, _,
       {__Levelmarket_gold708, __Tracesmarket_gold708}}
	  when __Levelmarket_gold708 band 8 /= 0 orelse
		 __Tracesmarket_gold708 /= [] ->
	  lager:do_log(error,
		       [{module, market_gold}, {function, change_margin},
			{line, 708}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("无法改变涨幅，未知的操作[Label:~w][Data:~w]",
				     [Label, Data]),
		       none, 4096, 8, __Levelmarket_gold708,
		       __Tracesmarket_gold708, lager_event,
		       __Pidmarket_gold708);
      _ -> ok
    end,
    false.

get_buy_count(Role = #role{}) ->
    LimitDay = var:get_var(Role, five, 562, []),
    LimitWeek = var:get_var(Role, week, 1005, []),
    LimitDay ++ LimitWeek.

push_23520(Role = #role{}) ->
    LimitData = get_buy_count(Role),
    role:pack_send(Role, 23520, {LimitData}).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_gold726, _,
       {__Levelmarket_gold726, __Tracesmarket_gold726}}
	  when __Levelmarket_gold726 band 64 /= 0 orelse
		 __Tracesmarket_gold726 /= [] ->
	  lager:do_log(info,
		       [{module, market_gold}, {function, init}, {line, 726},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("金币市场正在启动:[~w]", [market_gold]), none,
		       4096, 64, __Levelmarket_gold726, __Tracesmarket_gold726,
		       lager_event, __Pidmarket_gold726);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    case catch load_item_data() of
      ok ->
	  reload_data(),
	  TRef = reset_timer(),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_gold732, _,
	     {__Levelmarket_gold732, __Tracesmarket_gold732}}
		when __Levelmarket_gold732 band 64 /= 0 orelse
		       __Tracesmarket_gold732 /= [] ->
		lager:do_log(info,
			     [{module, market_gold}, {function, init},
			      {line, 732}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("金币市场启动完成:[~w]", [market_gold]),
			     none, 4096, 64, __Levelmarket_gold732,
			     __Tracesmarket_gold732, lager_event,
			     __Pidmarket_gold732);
	    _ -> ok
	  end,
	  Pltm = case sys_env:get(platform) of
		   undefined -> "";
		   TmpPltm -> TmpPltm
		 end,
	  ZoneId = case sys_env:get(zone_id) of
		     undefined -> 0;
		     TmpZoneId -> TmpZoneId
		   end,
	  {ok,
	   #state{reset_timer = TRef, platform = Pltm,
		  zone_id = ZoneId}};
      {error, LoadErr} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_gold737, _,
	     {__Levelmarket_gold737, __Tracesmarket_gold737}}
		when __Levelmarket_gold737 band 8 /= 0 orelse
		       __Tracesmarket_gold737 /= [] ->
		lager:do_log(error,
			     [{module, market_gold}, {function, init},
			      {line, 737}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("金币市场启动失败:[~w][Err:~w]",
					   [market_gold, LoadErr]),
			     none, 4096, 8, __Levelmarket_gold737,
			     __Tracesmarket_gold737, lager_event,
			     __Pidmarket_gold737);
	    _ -> ok
	  end,
	  {stop, abnormal};
      Exit ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_gold740, _,
	     {__Levelmarket_gold740, __Tracesmarket_gold740}}
		when __Levelmarket_gold740 band 8 /= 0 orelse
		       __Tracesmarket_gold740 /= [] ->
		lager:do_log(error,
			     [{module, market_gold}, {function, init},
			      {line, 740}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("金币市场启动失败:[~w][Err:~w]",
					   [market_gold, Exit]),
			     none, 4096, 8, __Levelmarket_gold740,
			     __Tracesmarket_gold740, lager_event,
			     __Pidmarket_gold740);
	    _ -> ok
	  end,
	  {stop, abnormal}
    end.

handle_call({buy, Pid, Data}, _From, State) ->
    Reply = update_bill_board(buy, Pid, Data, State),
    {reply, Reply, State};
handle_call({buy, Data}, _From, State)
    when is_list(Data) ->
    Reply = update_batch_bill_board(buy, Data, State),
    {reply, Reply, State};
handle_call({sold, Pid, Data}, _From, State) ->
    Reply = update_bill_board(sold, Pid, Data, State),
    {reply, Reply, State};
handle_call(reset, _From, State) ->
    Reply = refresh(), {reply, Reply, State};
handle_call(_Request, _From, State) ->
    {reply, false, State}.

handle_cast({buy_margin, Data}, State)
    when is_list(Data) ->
    catch update_batch_bill_board(buy, Data, State),
    {noreply, State};
handle_cast({got_list, Rid, Ids}, State) ->
    update_got_list(Ids, Rid, []), {noreply, State};
handle_cast(reload, State) ->
    reload_data(),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_gold767, _,
       {__Levelmarket_gold767, __Tracesmarket_gold767}}
	  when __Levelmarket_gold767 band 64 /= 0 orelse
		 __Tracesmarket_gold767 /= [] ->
	  lager:do_log(info,
		       [{module, market_gold}, {function, handle_cast},
			{line, 767}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "金币市场重载完成", none, 4096, 64, __Levelmarket_gold767,
		       __Tracesmarket_gold767, lager_event,
		       __Pidmarket_gold767);
      _ -> ok
    end,
    {noreply, State};
handle_cast(Msg, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_gold770, _,
       {__Levelmarket_gold770, __Tracesmarket_gold770}}
	  when __Levelmarket_gold770 band 8 /= 0 orelse
		 __Tracesmarket_gold770 /= [] ->
	  lager:do_log(error,
		       [{module, market_gold}, {function, handle_cast},
			{line, 770}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]收到错误的消息:[~w]", [market_gold, Msg]),
		       none, 4096, 8, __Levelmarket_gold770,
		       __Tracesmarket_gold770, lager_event,
		       __Pidmarket_gold770);
      _ -> ok
    end,
    {noreply, State}.

handle_info(reset,
	    #state{reset_timer = TRef} = State) ->
    erlang:cancel_timer(TRef),
    refresh(),
    NewTRef = reset_timer(),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_gold778, _,
       {__Levelmarket_gold778, __Tracesmarket_gold778}}
	  when __Levelmarket_gold778 band 64 /= 0 orelse
		 __Tracesmarket_gold778 /= [] ->
	  lager:do_log(info,
		       [{module, market_gold}, {function, handle_info},
			{line, 778}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "0点重置金币市场完成", none, 4096, 64, __Levelmarket_gold778,
		       __Tracesmarket_gold778, lager_event,
		       __Pidmarket_gold778);
      _ -> ok
    end,
    {noreply, State#state{reset_timer = NewTRef}};
handle_info(_Info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_gold781, _,
       {__Levelmarket_gold781, __Tracesmarket_gold781}}
	  when __Levelmarket_gold781 band 8 /= 0 orelse
		 __Tracesmarket_gold781 /= [] ->
	  lager:do_log(error,
		       [{module, market_gold}, {function, handle_info},
			{line, 781}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]收到错误的消息:[~w]", [market_gold, _Info]),
		       none, 4096, 8, __Levelmarket_gold781,
		       __Tracesmarket_gold781, lager_event,
		       __Pidmarket_gold781);
      _ -> ok
    end,
    {noreply, State}.

terminate(Reason, State) ->
    clean(State),
    case Reason of
      normal ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_gold787, _,
	     {__Levelmarket_gold787, __Tracesmarket_gold787}}
		when __Levelmarket_gold787 band 64 /= 0 orelse
		       __Tracesmarket_gold787 /= [] ->
		lager:do_log(info,
			     [{module, market_gold}, {function, terminate},
			      {line, 787}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("金币市场正常关闭:[~w]", [market_gold]),
			     none, 4096, 64, __Levelmarket_gold787,
			     __Tracesmarket_gold787, lager_event,
			     __Pidmarket_gold787);
	    _ -> ok
	  end;
      shutdown ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_gold788, _,
	     {__Levelmarket_gold788, __Tracesmarket_gold788}}
		when __Levelmarket_gold788 band 8 /= 0 orelse
		       __Tracesmarket_gold788 /= [] ->
		lager:do_log(error,
			     [{module, market_gold}, {function, terminate},
			      {line, 788}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "由Supervisor主动shutdown金币市场进程", none, 4096, 8,
			     __Levelmarket_gold788, __Tracesmarket_gold788,
			     lager_event, __Pidmarket_gold788);
	    _ -> ok
	  end;
      _Unknow ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_gold789, _,
	     {__Levelmarket_gold789, __Tracesmarket_gold789}}
		when __Levelmarket_gold789 band 8 /= 0 orelse
		       __Tracesmarket_gold789 /= [] ->
		lager:do_log(error,
			     [{module, market_gold}, {function, terminate},
			      {line, 789}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("金币市场关闭异常:[Reason:~w]", [_Unknow]),
			     none, 4096, 8, __Levelmarket_gold789,
			     __Tracesmarket_gold789, lager_event,
			     __Pidmarket_gold789);
	    _ -> ok
	  end
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_item_data() ->
    market_gold_change_tab = ets:new(market_gold_change_tab,
				     [set, named_table, public,
				      {keypos,
				       #market_gold_change_item.base_id}]),
    market_gold_item_tab = ets:new(market_gold_item_tab,
				   [set, named_table, public,
				    {keypos, #market_gold_item.base_id}]),
    {ok, market_gold_item_tab} =
	dets:open_file(market_gold_item_tab,
		       [{file, "dets/market_gold_item.dets"},
			{keypos, #market_gold_item.base_id}, {type, set}]),
    market_gold_item_tab = dets:to_ets(market_gold_item_tab,
				       market_gold_item_tab),
    ok.

reload_data() ->
    AllItems = market_gold_data:get_all_items(),
    ItemList = ets:tab2list(market_gold_item_tab),
    {AddItems, DelItems} = reload_data(ItemList, AllItems,
				       [], []),
    [delete(market_gold_item_tab, Id) || Id <- DelItems],
    save(market_gold_item_tab, AddItems),
    garbage_collect(),
    ok.

reload_data([], OpenItems, DelItems, UpdateItems) ->
    AddItems = [#market_gold_item{id = Id, base_id = BaseId,
				  stock = InitStock, cur_price = InitPirce,
				  init_price = InitPirce, def_price = InitPirce,
				  margin = 1000, margin_acc = 1000,
				  init_stock = InitStock}
		|| #market_gold_item_data{id = Id, base_id = BaseId,
					  init_price = InitPirce,
					  init_stock = InitStock}
		       <- OpenItems],
    {UpdateItems ++ AddItems, DelItems};
reload_data([Item = #market_gold_item{base_id = BaseId,
				      def_price = PreDefPrice, margin = Margin,
				      margin_acc = MarginAcc,
				      init_price = PreInitPrice,
				      cur_price = PreCurPrice}
	     | Rest],
	    OpenItems, DelItems, UpdateItems) ->
    case lists:keytake(BaseId,
		       #market_gold_item_data.base_id, OpenItems)
	of
      false ->
	  reload_data(Rest, OpenItems, [BaseId | DelItems],
		      UpdateItems);
      {value,
       #market_gold_item_data{id = Id,
			      init_price = PreDefPrice, min_price = MinPrice,
			      max_price = MaxPrice},
       RestOpenItems} ->
	  InitPirce = erlang:max(erlang:min(PreInitPrice,
					    MaxPrice),
				 MinPrice),
	  CurPrice = erlang:max(erlang:min(PreCurPrice, MaxPrice),
				MinPrice),
	  NewItem = Item#market_gold_item{id = Id,
					  init_price = InitPirce,
					  cur_price = CurPrice},
	  reload_data(Rest, RestOpenItems, DelItems,
		      [NewItem | UpdateItems]);
      {value,
       #market_gold_item_data{id = Id, init_price = DefPirce,
			      min_price = MinPrice, max_price = MaxPrice},
       RestOpenItems} ->
	  InitPirce = erlang:max(MinPrice,
				 erlang:min(MaxPrice,
					    erlang:round(DefPirce * MarginAcc /
							   1000))),
	  CurPirce = erlang:max(MinPrice,
				erlang:min(MaxPrice,
					   erlang:round(DefPirce * MarginAcc *
							  Margin
							  / (1000 * 1000)))),
	  NewItem = Item#market_gold_item{id = Id,
					  init_price = InitPirce,
					  cur_price = CurPirce,
					  def_price = DefPirce},
	  reload_data(Rest, RestOpenItems, DelItems,
		      [NewItem | UpdateItems])
    end.

reset_timer() ->
    Now = date:unixtime(),
    Time = date:unixtime({next_day, Now}),
    erlang:send_after((Time - Now) * 1000, self(), reset).

calc_price(Type,
	   #market_gold_item_data{min_price = MinPrice,
				  max_price = MaxPrice},
	   InitPrice, Margin) ->
    CurPrice = calc_price(Type, InitPrice, Margin),
    erlang:max(MinPrice, erlang:min(MaxPrice, CurPrice));
calc_price(Type, BaseId, InitPrice, Margin) ->
    case market_gold_data:get(BaseId) of
      Data = #market_gold_item_data{} ->
	  calc_price(Type, Data, InitPrice, Margin);
      _False ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_gold874, _,
	     {__Levelmarket_gold874, __Tracesmarket_gold874}}
		when __Levelmarket_gold874 band 8 /= 0 orelse
		       __Tracesmarket_gold874 /= [] ->
		lager:do_log(error,
			     [{module, market_gold}, {function, calc_price},
			      {line, 874}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("未知的金币市场道具[BaseId:~w][False:~w]",
					   [BaseId, _False]),
			     none, 4096, 8, __Levelmarket_gold874,
			     __Tracesmarket_gold874, lager_event,
			     __Pidmarket_gold874);
	    _ -> ok
	  end,
	  calc_price(3, InitPrice, Margin)
    end.

calc_price(4, InitPirce, Margin) ->
    erlang:round(InitPirce * (Margin / 1000));
calc_price(3, InitPirce, Margin) ->
    erlang:round(InitPirce * (Margin / 1000) * 1.3).

clean(#state{reset_timer = TRef}) ->
    erlang:cancel_timer(TRef),
    util:close_dets(market_gold_item_tab).

refresh() ->
    List = ets:tab2list(market_gold_item_tab),
    NewList = refresh(List, []),
    save(market_gold_item_tab, NewList),
    garbage_collect(),
    {ok, NewList}.

refresh([], Acc) -> Acc;
refresh([Item = #market_gold_item{base_id = Id,
				  margin = Margin, margin_acc = MarginAcc,
				  def_price = PreDefPrice, cur_price = CurPrice}
	 | Rest],
	Acc) ->
    case market_gold_data:get(Id) of
      #market_gold_item_data{init_stock = InitStock,
			     init_price = DefPrice, min_price = MinPrice,
			     max_price = MaxPrice} ->
	  Base = 1000 * 1000,
	  CalcCurPrice = case DefPrice =:= PreDefPrice of
			   true -> CurPrice;
			   false ->
			       erlang:round(DefPrice * MarginAcc * Margin /
					      Base)
			 end,
	  NewCurPrice = erlang:min(erlang:max(CalcCurPrice,
					      MinPrice),
				   MaxPrice),
	  NewMarginAcc = erlang:round(Margin * MarginAcc / 1000),
	  NewItem = Item#market_gold_item{stock = InitStock,
					  init_stock = InitStock, margin = 1000,
					  margin_acc = NewMarginAcc,
					  cur_price = NewCurPrice,
					  init_price = NewCurPrice,
					  def_price = DefPrice},
	  refresh(Rest, [NewItem | Acc]);
      _False ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_gold924, _,
	     {__Levelmarket_gold924, __Tracesmarket_gold924}}
		when __Levelmarket_gold924 band 8 /= 0 orelse
		       __Tracesmarket_gold924 /= [] ->
		lager:do_log(error,
			     [{module, market_gold}, {function, refresh},
			      {line, 924}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("没有金币市场数据[baseId:~w][Err:~w]",
					   [Id, _False]),
			     none, 4096, 8, __Levelmarket_gold924,
			     __Tracesmarket_gold924, lager_event,
			     __Pidmarket_gold924);
	    _ -> ok
	  end,
	  delete(market_gold_item_tab, Id),
	  refresh(Rest, Acc)
    end.

update_bill_board(buy, Pid, {BaseId, Num}, State) ->
    case update_buy_bill_board(BaseId, Num, State) of
      {ok,
       Goods = #market_gold_item{margin = Margin,
				 cur_price = CurPrice}} ->
	  save(market_gold_item_tab, Goods),
	  change_item(BaseId, Pid),
	  {ok, {CurPrice, Margin}};
      _False -> false
    end;
update_bill_board(sold, Pid, {BaseId, Num}, _State) ->
    case lookup(market_gold_item_tab, BaseId) of
      Goods = #market_gold_item{init_price = InitPirce,
				cur_price = CurPrice, init_stock = InitStock,
				stock = Stock, margin = Margin} ->
	  case market_gold_data:get(BaseId) of
	    Data = #market_gold_item_data{max_price = MaxPrice,
					  min_price = MinPrice,
					  init_stock = CfgStock} ->
		NewStock = case CurPrice =< MinPrice of
			     true -> Stock;
			     false -> Stock + Num
			   end,
		DefInitStock = case InitStock of
				 0 -> CfgStock;
				 _ -> InitStock
			       end,
		NewMargin = case MaxPrice =:= MinPrice of
			      true -> Margin;
			      false -> calc_margin(NewStock, DefInitStock)
			    end,
		NewPrice = calc_price(4, Data, InitPirce, NewMargin),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmarket_gold959, _,
		   {__Levelmarket_gold959, __Tracesmarket_gold959}}
		      when __Levelmarket_gold959 band 128 /= 0 orelse
			     __Tracesmarket_gold959 /= [] ->
		      lager:do_log(debug,
				   [{module, market_gold},
				    {function, update_bill_board}, {line, 959},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("价格：~w, 库存：~w, 起始库存：~w, 涨幅:~w",
						 [NewPrice, NewStock,
						  DefInitStock, NewMargin]),
				   none, 4096, 128, __Levelmarket_gold959,
				   __Tracesmarket_gold959, lager_event,
				   __Pidmarket_gold959);
		  _ -> ok
		end,
		NewGoods = Goods#market_gold_item{stock = NewStock,
						  margin = NewMargin,
						  cur_price = NewPrice},
		save(market_gold_item_tab, NewGoods),
		change_item(BaseId, Pid),
		{ok, {NewPrice, NewMargin}};
	    _False ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmarket_gold968, _,
		   {__Levelmarket_gold968, __Tracesmarket_gold968}}
		      when __Levelmarket_gold968 band 8 /= 0 orelse
			     __Tracesmarket_gold968 /= [] ->
		      lager:do_log(error,
				   [{module, market_gold},
				    {function, update_bill_board}, {line, 968},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("无法找到金币市场物品[BaseId:~w][Err:~w]",
						 [BaseId, _False]),
				   none, 4096, 8, __Levelmarket_gold968,
				   __Tracesmarket_gold968, lager_event,
				   __Pidmarket_gold968);
		  _ -> ok
		end,
		false
	  end;
      _False ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_gold972, _,
	     {__Levelmarket_gold972, __Tracesmarket_gold972}}
		when __Levelmarket_gold972 band 8 /= 0 orelse
		       __Tracesmarket_gold972 /= [] ->
		lager:do_log(error,
			     [{module, market_gold},
			      {function, update_bill_board}, {line, 972},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("无法找到金币市场物品[BaseId:~w][Err:~w]",
					   [BaseId, _False]),
			     none, 4096, 8, __Levelmarket_gold972,
			     __Tracesmarket_gold972, lager_event,
			     __Pidmarket_gold972);
	    _ -> ok
	  end,
	  false
    end.

update_batch_bill_board(buy, Batch, State) ->
    case do_update_batch_bill_board(Batch, State, [], []) of
      {ok, MarginAcc} -> change_item(Batch), {ok, MarginAcc};
      _ -> false
    end.

do_update_batch_bill_board([], _State, Acc,
			   MarginAcc) ->
    save(market_gold_item_tab, Acc), {ok, MarginAcc};
do_update_batch_bill_board([{BaseId, Num} | Rest],
			   State, Acc, MarginAcc) ->
    case update_buy_bill_board(BaseId, Num, State) of
      {ok,
       Goods = #market_gold_item{margin = Margin,
				 cur_price = Price}} ->
	  NewMarginAcc = [{BaseId, Price, Margin} | MarginAcc],
	  do_update_batch_bill_board(Rest, State, [Goods | Acc],
				     NewMarginAcc);
      _False -> false
    end.

update_buy_bill_board(BaseId, Num, _State) ->
    case lookup(market_gold_item_tab, BaseId) of
      Goods = #market_gold_item{init_price = InitPirce,
				cur_price = CurPrice, stock = Stock,
				init_stock = InitStock, margin = Margin} ->
	  case market_gold_data:get(BaseId) of
	    Data = #market_gold_item_data{max_price = MaxPrice,
					  min_price = MinPrice,
					  init_stock = CfgStock} ->
		NewStock = case CurPrice >= MaxPrice of
			     true -> Stock;
			     false -> Stock - Num
			   end,
		DefInitStock = case CfgStock of
				 0 -> CfgStock;
				 _ -> InitStock
			       end,
		NewMargin = case MaxPrice =:= MinPrice of
			      true -> Margin;
			      false -> calc_margin(NewStock, DefInitStock)
			    end,
		NewPrice = calc_price(4, Data, InitPirce, NewMargin),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmarket_gold1019, _,
		   {__Levelmarket_gold1019, __Tracesmarket_gold1019}}
		      when __Levelmarket_gold1019 band 128 /= 0 orelse
			     __Tracesmarket_gold1019 /= [] ->
		      lager:do_log(debug,
				   [{module, market_gold},
				    {function, update_buy_bill_board},
				    {line, 1019}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("价格：~w, 库存：~w, 起始库存：~w, 涨幅:~w",
						 [NewPrice, NewStock,
						  DefInitStock, NewMargin]),
				   none, 4096, 128, __Levelmarket_gold1019,
				   __Tracesmarket_gold1019, lager_event,
				   __Pidmarket_gold1019);
		  _ -> ok
		end,
		NewGoods = Goods#market_gold_item{margin = NewMargin,
						  cur_price = NewPrice,
						  stock = NewStock},
		{ok, NewGoods};
	    _False ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmarket_gold1026, _,
		   {__Levelmarket_gold1026, __Tracesmarket_gold1026}}
		      when __Levelmarket_gold1026 band 8 /= 0 orelse
			     __Tracesmarket_gold1026 /= [] ->
		      lager:do_log(error,
				   [{module, market_gold},
				    {function, update_buy_bill_board},
				    {line, 1026}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("无法找到金币市场物品[BaseId:~w][Err:~w]",
						 [BaseId, _False]),
				   none, 4096, 8, __Levelmarket_gold1026,
				   __Tracesmarket_gold1026, lager_event,
				   __Pidmarket_gold1026);
		  _ -> ok
		end,
		false
	  end;
      _False ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_gold1030, _,
	     {__Levelmarket_gold1030, __Tracesmarket_gold1030}}
		when __Levelmarket_gold1030 band 8 /= 0 orelse
		       __Tracesmarket_gold1030 /= [] ->
		lager:do_log(error,
			     [{module, market_gold},
			      {function, update_buy_bill_board}, {line, 1030},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("无法找到金币市场物品[BaseId:~w][Err:~w]",
					   [BaseId, _False]),
			     none, 4096, 8, __Levelmarket_gold1030,
			     __Tracesmarket_gold1030, lager_event,
			     __Pidmarket_gold1030);
	    _ -> ok
	  end,
	  false
    end.

calc_margin(_Stock, 0) -> 1100;
calc_margin(Stock, InitStock) ->
    case Stock >= InitStock of
      true ->
	  Margin = erlang:round((1 -
				   (Stock - InitStock) / InitStock / 10)
				  * 1000),
	  case Margin >= 900 of
	    true -> Margin;
	    false -> 900
	  end;
      false ->
	  Margin = erlang:round((1 +
				   (InitStock - Stock) / InitStock / 10)
				  * 1000),
	  case Margin =< 1100 of
	    true -> Margin;
	    false -> 1100
	  end
    end.

change_item([]) -> ok;
change_item([{BaseId, _} | Rest]) ->
    case do_change_item(BaseId) of
      true -> change_item(Rest);
      _False ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_gold1061, _,
	     {__Levelmarket_gold1061, __Tracesmarket_gold1061}}
		when __Levelmarket_gold1061 band 8 /= 0 orelse
		       __Tracesmarket_gold1061 /= [] ->
		lager:do_log(error,
			     [{module, market_gold}, {function, change_item},
			      {line, 1061}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("金币市场无法找到物品[BaseId:~w]", [BaseId]),
			     none, 4096, 8, __Levelmarket_gold1061,
			     __Tracesmarket_gold1061, lager_event,
			     __Pidmarket_gold1061);
	    _ -> ok
	  end,
	  change_item(Rest)
    end;
change_item([_ | Rest]) -> change_item(Rest).

change_item(BaseId, Pid) ->
    case do_change_item(BaseId) of
      true ->
	  role:apply(async, Pid,
		     {market_gold, push_change_items_by_bid, [BaseId]});
      _False -> false
    end.

do_change_item(BaseId) ->
    case market_gold_data:get(BaseId) of
      #market_gold_item_data{catalg = C} ->
	  case catch ets:lookup(market_gold_change_tab, BaseId) of
	    [#market_gold_change_item{}] ->
		case catch ets:insert(market_gold_change_tab,
				      #market_gold_change_item{base_id = BaseId,
							       catalg = C})
		    of
		  true -> true;
		  _ -> false
		end;
	    [] ->
		case catch ets:insert(market_gold_change_tab,
				      #market_gold_change_item{base_id = BaseId,
							       catalg = C})
		    of
		  true -> true;
		  _ -> false
		end;
	    _ -> false
	  end;
      _ -> false
    end.

push_change_items_list(Role = #role{}) ->
    push_change_items_list(Role, [1, 5, 3, 4, 2]).

push_change_items_list(_Role = #role{}, []) -> ok;
push_change_items_list(Role = #role{},
		       [Catalg | Rest]) ->
    push_change_items(Role, Catalg),
    push_change_items_list(Role, Rest).

push_change_items(Role = #role{id = Rid}, Catalg) ->
    case get_change_items(Role, Catalg) of
      {ok, []} -> ok;
      {ok, Items} ->
	  Ids = [TmpBaseId
		 || #market_gold_item{base_id = TmpBaseId} <- Items],
	  gen_server:cast(market_gold, {got_list, Rid, Ids}),
	  role:pack_send(Role, 23518, {Items}),
	  ok;
      _False -> ok
    end.

push_change_items_by_bid(Role = #role{id = Rid},
			 BaseId) ->
    case market_gold_data:get(BaseId) of
      #market_gold_item_data{catalg = Catalg} ->
	  case get_change_items(Role, Catalg) of
	    {ok, []} -> ok;
	    {ok, Items} ->
		Ids = [TmpBaseId
		       || #market_gold_item{base_id = TmpBaseId} <- Items],
		gen_server:cast(market_gold, {got_list, Rid, Ids}),
		role:pack_send(Role, 23518, {Items}),
		ok;
	    _False -> ok
	  end;
      _False ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_gold1116, _,
	     {__Levelmarket_gold1116, __Tracesmarket_gold1116}}
		when __Levelmarket_gold1116 band 8 /= 0 orelse
		       __Tracesmarket_gold1116 /= [] ->
		lager:do_log(error,
			     [{module, market_gold},
			      {function, push_change_items_by_bid},
			      {line, 1116}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("金币市场无法找到物品[BaseId:~w]", [BaseId]),
			     none, 4096, 8, __Levelmarket_gold1116,
			     __Tracesmarket_gold1116, lager_event,
			     __Pidmarket_gold1116);
	    _ -> ok
	  end,
	  ok
    end.

get_change_items(#role{id = Rid, lev = Lev}, Catalg) ->
    Ms = [{#market_gold_change_item{catalg = '$1', _ = '_'},
	   [{'=:=', '$1', Catalg}], ['$_']}],
    case catch ets:select(market_gold_change_tab, Ms) of
      List = [_ | _] ->
	  Items = filter_change_items(List, Lev, Rid, []),
	  {ok, Items};
      _False -> false
    end.

filter_change_items([], _Lev, _Rid, Acc) -> Acc;
filter_change_items([#market_gold_change_item{base_id =
						  BaseId,
					      got_list = GotList}
		     | Rest],
		    Lev, Rid, Acc) ->
    case market_gold_data:get(BaseId) of
      #market_gold_item_data{open_lev = OpenLev}
	  when OpenLev =< Lev ->
	  case catch ets:lookup(market_gold_item_tab, BaseId) of
	    [Goods = #market_gold_item{}] ->
		case lists:member(Rid, GotList) of
		  true -> filter_change_items(Rest, Lev, Rid, Acc);
		  false ->
		      filter_change_items(Rest, Lev, Rid, [Goods | Acc])
		end;
	    _ -> filter_change_items(Rest, Lev, Rid, Acc)
	  end;
      _ -> filter_change_items(Rest, Lev, Rid, Acc)
    end.

update_got_list([], _Rid, Acc) ->
    case catch ets:insert(market_gold_change_tab, Acc) of
      true -> true;
      _ -> false
    end,
    ok;
update_got_list([Id | Rest], Rid, Acc) ->
    case catch ets:lookup(market_gold_change_tab, Id) of
      [Change = #market_gold_change_item{got_list =
					     GotList}] ->
	  update_got_list(Rest, Rid,
			  [Change#market_gold_change_item{got_list =
							      [Rid | GotList]}
			   | Acc]);
      _ -> update_got_list(Rest, Rid, Acc)
    end.

get_val(Role, day) ->
    case var:get_var(Role, five, 562, 0) of
      List when is_list(List) -> List;
      _ -> []
    end;
get_val(Role, week) ->
    case var:get_var(Role, week, 1005, 0) of
      List when is_list(List) -> List;
      _ -> []
    end;
get_val(List, EId) when is_list(List) ->
    list_util:keyfind(EId, List, 0).

get_val(Role = #role{}, Type, EId) ->
    List = get_val(Role, Type), get_val(List, EId).

set_val(Role, day, List) ->
    var:set_var(Role, five, 562, List);
set_val(Role, week, List) ->
    var:set_var(Role, week, 1005, List).

set_val(Role, Type, EId, Val) ->
    List = get_val(Role, Type),
    List2 = lists:keystore(EId, 1, List, {EId, Val}),
    set_val(Role, Type, List2).

log_server(Title, Role, BaseId, Num,
	   #market_gold_item{stock = OldStock,
			     cur_price = OldPrice, margin = OldMargin},
	   #market_gold_item{stock = NewStock,
			     cur_price = NewPrice, margin = NewMargin,
			     init_price = InitPrice, init_stock = InitStock,
			     margin_acc = MarginAcc}) ->
    ItemStr = item:attr(name, BaseId),
    LogText =
	util:fbin(<<"~ts物品~w个~ts$$~w$$~w$$~w$$~w$$~w$$~w$$~w$$~w$$~w"/utf8>>,
		  [Title, Num, ItemStr, InitPrice, OldPrice, NewPrice,
		   MarginAcc, OldMargin, NewMargin, InitStock, OldStock,
		   NewStock]),
    log:save(market_gold, {Role, LogText}),
    ok.

log_purchs_text(_Loss,
		#item{base_id = BaseId, quantity = Num},
		{InitPirce, Price, CurPrice, Margin}) ->
    ItemStr = item:attr(name, BaseId),
    util:fbin(<<"金币市场购买~w个~ts，起始价~w,购买价~w,当前价~w,幅度~w"/utf8>>,
	      [Num, ItemStr, InitPirce, Price, CurPrice, Margin]).

log_purchs_list_text(_Loss, BuyList, MarginAcc) ->
    util:fbin(<<"金币市场批量购买~w，价格变化~w"/utf8>>,
	      [BuyList, MarginAcc]).

log_sold_out_text({BaseId, Num},
		  #calc_sold_price{type = Type, price = Price,
				   discount = Discount,
				   exchange_num = ExchangeNum,
				   exchange_base_id = ExchangeBaseId,
				   init_price = InitPirce},
		  {CurPrice, NewMargin}) ->
    ItemStr = item:attr(name, BaseId),
    case Type of
      2 ->
	  util:fbin(<<"金币市场出售~w个~ts，起始价~w,出售价~w,当前价~w,幅度~w,固定折扣~w"/utf8>>,
		    [Num, ItemStr, InitPirce, Price, CurPrice, NewMargin,
		     Discount]);
      4 ->
	  util:fbin(<<"金币市场出售~w个~ts，起始价~w,出售价~w,当前价~w,幅度~w,转换出售~w "
		      "~w个"/utf8>>,
		    [Num, ItemStr, InitPirce, Price, CurPrice, NewMargin,
		     ExchangeBaseId, ExchangeNum]);
      _ ->
	  util:fbin(<<"金币市场出售~w个~ts，起始价~w,出售价~w,当前价~w,幅度~w"/utf8>>,
		    [Num, ItemStr, InitPirce, Price, CurPrice, NewMargin])
    end.


