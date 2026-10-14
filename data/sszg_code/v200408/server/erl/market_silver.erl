-file("src/mod/market/market_silver.erl", 1).

-module(market_silver).

-lager_records([{state,
		 [reset_timer, recover_timer, platform, zone_id]},
		{buff_data,
		 [bid, name, type, time_type, group, effect, seconds]},
		{role_buff, [ver, buff_list]},
		{role_buff_data, [bid, group, effect, end_time]},
		{market_silver_draw_item,
		 [cell_id, base_id, num, rest, price, pcnt, attrs]},
		{market_silver_item_data,
		 [base_id, type, step, classes, min_lev, max_lev,
		  is_system, is_quest_need, def_price, min_price,
		  max_price, gain_label, open_lev, pre_base_id, pre_pcnt,
		  group, group_id, update_time, chain_type, fix_price,
		  make_pcnt, rand_num]},
		{market_silver_refresh,
		 [id, item_base_id, num, item_attrs, price, cell_id,
		  seller_id, status]},
		{market_silver_price,
		 [ver, item_base_id, price, sellers, deal_price,
		  recover_num, day_recover, day_auto, ext]},
		{market_silver_shop_cell,
		 [ver, cell_id, item_base_id, num, item_attrs, price,
		  expiry, sold_num, status, system_price, percent,
		  sale_time]},
		{market_silver_shop,
		 [ver, rid, max_cell_id, free_ids, cells, name, pid,
		  last_logout]},
		{m_market_silver,
		 [ver, refresh_time, is_first_on_sale, refresh]},
		{market_price, [base_id, price, assets, source]},
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
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{notice_board,
		 [id, type, title, summary, content, sort, lev, items,
		  start_time, end_time, channel]},
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
		{link, [socket, conn_pid, ip, port, lag]},
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

-file("src/mod/market/market_silver.erl", 25).

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

-file("src/mod/market/market_silver.erl", 26).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/mod/market/market_silver.erl", 27).

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

-file("src/mod/market/market_silver.erl", 28).

-file("inc/notice.hrl", 1).

-record(notice_board,
	{id = 0, type = 1, title = <<>>, summary = <<>>,
	 content = <<>>, sort = 0, lev = 0, items = [],
	 start_time = 0, end_time = 0, channel = []}).

-file("src/mod/market/market_silver.erl", 29).

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

-file("src/mod/market/market_silver.erl", 30).

-file("inc/log.hrl", 1).

-file("src/mod/market/market_silver.erl", 31).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("src/mod/market/market_silver.erl", 32).

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

-file("src/mod/market/market_silver.erl", 33).

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

-file("src/mod/market/market_silver.erl", 34).

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

-file("src/mod/market/market_silver.erl", 35).

-file("inc/market.hrl", 1).

-record(market_price,
	{base_id = 0, price = 0, assets = 0, source = 0}).

-file("src/mod/market/market_silver.erl", 36).

-file("inc/market_silver.hrl", 1).

-record(m_market_silver,
	{ver = 1, refresh_time = 0, is_first_on_sale = 1,
	 refresh = []}).

-record(market_silver_shop,
	{ver = 1, rid, max_cell_id = 0, free_ids = [],
	 cells = [], name = "", pid, last_logout = 0}).

-record(market_silver_shop_cell,
	{ver = 1, cell_id = 0, item_base_id = 0, num = 0,
	 item_attrs = [], price = 0, expiry = 0, sold_num = 0,
	 status = 0, system_price = 0, percent = 100,
	 sale_time = 0}).

-record(market_silver_price,
	{ver = 1, item_base_id = 0, price = 0, sellers = [],
	 deal_price = [], recover_num = 0, day_recover = 0,
	 day_auto = 0, ext = []}).

-record(market_silver_refresh,
	{id = 0, item_base_id = 0, num = 0, item_attrs = [],
	 price = 0, cell_id = 0, seller_id, status = 0}).

-record(market_silver_item_data,
	{base_id = 0, type = 0, step = 0, classes = 0,
	 min_lev = 0, max_lev = 0, is_system = 1,
	 is_quest_need = 0, def_price = 0, min_price = 0,
	 max_price = 0, gain_label = coin, open_lev = 0,
	 pre_base_id = 0, pre_pcnt = 1000, group = 0,
	 group_id = 0, update_time, chain_type = 0,
	 fix_price = 0, make_pcnt = 1000, rand_num = {1, 1}}).

-record(market_silver_draw_item,
	{cell_id = 0, base_id = 0, num = 0, rest = 0, price = 0,
	 pcnt = 0, attrs = []}).

-file("src/mod/market/market_silver.erl", 37).

-file("inc/buff.hrl", 1).

-record(role_buff_data,
	{bid, group, effect = [], end_time}).

-record(role_buff,
	{ver = 1, buff_list = []  :: [#role_buff_data{}]}).

-record(buff_data,
	{bid, name, type, time_type, group, effect = [],
	 seconds}).

-file("src/mod/market/market_silver.erl", 38).

-export([start_link/0, init/0, login/1, logout/1,
	 level_up/2, reload/0, on_sale/3, on_sale_again/4,
	 get_refresh_goods/3, buy_n/4, take_off/2, draw/2,
	 one_click/2, get_goods_price/1, open_cell/1, refresh/2,
	 get_pages/3, get_pages/4, get_silver_shop/1,
	 push_shop/1, push_ico_mark/1, check_cell_draw_status/1,
	 recover_timeout/1, set_cell_timer/1,
	 callback_recover_timeout/2, query_market_price/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state,
	{reset_timer, recover_timer, platform = "",
	 zone_id = 0}).

start_link() ->
    gen_server:start_link({local, market_silver},
			  market_silver, [], []).

init() -> #m_market_silver{}.

init_shop(#role{id = Rid, pid = Pid, name = Name}) ->
    gen_server:cast(market_silver,
		    {init_shop, {Rid, Pid, Name}}).

server_init_shop({Rid, Pid, Name}) ->
    Shop = #market_silver_shop{rid = Rid, name = Name,
			       pid = Pid,
			       max_cell_id =
				   market_silver_data:get_const(silvermarket_booth),
			       free_ids =
				   lists:seq(1,
					     market_silver_data:get_const(silvermarket_booth)),
			       cells = []},
    save(market_silver_shop_tab, Shop).

revise_shop_cells(#role{id = Rid}) ->
    gen_server:cast(market_silver,
		    {revise_shop_cells, Rid}).

server_revise_shop_cells(Rid) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [Shop = #market_silver_shop{max_cell_id = MaxCellid}] ->
	  case MaxCellid <
		 market_silver_data:get_const(silvermarket_booth)
	      of
	    true ->
		NewShop = server_revise_shop_cells(Shop,
						   market_silver_data:get_const(silvermarket_booth),
						   market_silver_data:get_const(silvermarket_booth)),
		save(market_silver_shop_tab, NewShop),
		ok;
	    _ -> ok
	  end;
      _ -> ok
    end.

server_revise_shop_cells(Shop =
			     #market_silver_shop{max_cell_id = Count},
			 Count, MaxId) ->
    Shop#market_silver_shop{max_cell_id = MaxId};
server_revise_shop_cells(Shop =
			     #market_silver_shop{free_ids = FreeIds},
			 Count, MaxId) ->
    server_revise_shop_cells(Shop#market_silver_shop{free_ids
							 = [Count | FreeIds]},
			     Count - 1, MaxId).

-spec login(#role{}) -> ok | {ok, #role{}}.

login(Role = #role{id = Rid, lev = _Lev}) ->
    NRole = case catch ets:lookup(market_silver_shop_tab,
				  Rid)
		of
	      [Shop = #market_silver_shop{max_cell_id = MaxCellid}] ->
		  case MaxCellid <
			 market_silver_data:get_const(silvermarket_booth)
		      of
		    true ->
			revise_shop_cells(Role),
			case recover_timeout(Role, Shop) of
			  false -> set_cell_timer(Role, Shop);
			  ok -> Role
			end;
		    _ ->
			case recover_timeout(Role, Shop) of
			  false -> set_cell_timer(Role, Shop);
			  ok -> Role
			end
		  end;
	      _ -> init_shop(Role), Role
	    end,
    {ok, NRole};
login(_Role) -> ok.

logout(#role{id = Rid}) ->
    gen_server:cast(market_silver, {logout, Rid}), ok.

server_logout(Rid) ->
    Now = date:unixtime(),
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [Shop] ->
	  NewShop = Shop#market_silver_shop{last_logout = Now,
					    pid = undefined},
	  save(market_silver_shop_tab, NewShop);
      _ -> ok
    end.

level_up(_OldRole, Role = #role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [#market_silver_shop{max_cell_id = MaxCellid}] ->
	  case MaxCellid <
		 market_silver_data:get_const(silvermarket_booth)
	      of
	    true -> revise_shop_cells(Role), {ok, Role};
	    _ -> {ok, Role}
	  end;
      [_] -> {ok, Role};
      _ ->
	  init_shop(Role),
	  case refresh(1, Role) of
	    {ok, NRole, _Rtn} -> {ok, NRole};
	    false -> {ok, Role}
	  end
    end;
level_up(_OldRole, Role) -> {ok, Role}.

-spec save(Tab :: atom(), Data :: term()) -> boolean().

save(Tab, Data) ->
    case catch ets:insert(Tab, Data) of
      true ->
	  case catch dets:insert(Tab, Data) of
	    ok -> true;
	    _ -> false
	  end;
      _ -> false
    end.

-spec delete(Tab :: atom(), Key :: term()) -> boolean().

delete(Tab, Key) ->
    case catch ets:delete(Tab, Key) of
      true ->
	  case catch dets:delete(Tab, Key) of
	    ok -> true;
	    _ -> false
	  end;
      _ -> false
    end.

reload() -> gen_server:cast(market_silver, reload), ok.

on_sale(From, {ItemId, Num, Percent, CellId}, Role) ->
    case Num =< 5 of
      true ->
	  case check_unbind(From, ItemId, Num, Role) of
	    {ok, Label, Item} ->
		on_sale(Item, Num, Percent, CellId, Label, Role);
	    False -> False
	  end;
      false -> {false, lang:get(<<"同个摊位最多只能上架5个物品哟！"/utf8>>)}
    end.

on_sale(Item = #item{base_id = ItemBaseId}, Num,
	Percent, CellId, Label, Role) ->
    case check_on_sale_cell(CellId, Role) of
      true ->
	  case do_check_on_sale_price(ItemBaseId, Percent, Role)
	      of
	    {true, PrePrice} ->
		do_on_sale(Item, Num, Label, PrePrice, Percent, CellId,
			   Role);
	    False -> False
	  end;
      False -> False
    end.

check_unbind(From, ItemId, Num, #role{p_bag = PBag}) ->
    {Label, Unbind} = case From of
			1 -> {item_id, check_unbind(PBag, ItemId, Num)};
			_ -> {false, false}
		      end,
    case Unbind of
      Item = #item{} -> {ok, Label, Item};
      False -> False
    end.

check_unbind(Package, ItemId, Num) ->
    case package:find(by_id, ItemId, Package) of
      {ok, Item = #item{quantity = Q}} when Q >= Num -> Item;
      {ok, #item{}} -> {false, lang:get(<<"上架物品数量不足"/utf8>>)};
      _False -> {false, lang:get(<<"未找到相应物品"/utf8>>)}
    end.

do_on_sale(Item = #item{id = ItemId,
			base_id = ItemBaseId, step = Step},
	   Num, Label, PrePrice, Percent, CellId, Role) ->
    Loss = [#loss{label = Label, val = [{ItemId, Num}],
		  flag = del_marketsilver}],
    case role_gain:do(Role, Loss) of
      {ok, LossRole = #role{id = RoleId}} ->
	  Attrs = [{1, Step}],
	  case case catch gen_server:call(market_silver,
					  {on_sale, RoleId,
					   {ItemBaseId, Num, PrePrice, Percent,
					    CellId, Attrs}},
					  10000)
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
		       {__Pidmarket_silver373, _,
			{__Levelmarket_silver373, __Tracesmarket_silver373}}
			   when __Levelmarket_silver373 band 8 /= 0 orelse
				  __Tracesmarket_silver373 /= [] ->
			   lager:do_log(error,
					[{module, market_silver},
					 {function, do_on_sale}, {line, 373},
					 {pid, pid_to_list(self())},
					 {node, node()}
					 | lager:md()],
					io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
						      [market_silver,
						       {on_sale, RoleId,
							{ItemBaseId, Num,
							 PrePrice, Percent,
							 CellId, Attrs}},
						       10000,
						       erlang:get_stacktrace()]),
					none, 4096, 8, __Levelmarket_silver373,
					__Tracesmarket_silver373, lager_event,
					__Pidmarket_silver373);
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
	    ok ->
		TimerRole = case set_cell_timer(LossRole) of
			      {ok, SetTimerRole} -> SetTimerRole;
			      _False -> LossRole
			    end,
		on_sale_reply(Item, Num, PrePrice, CellId, TimerRole);
	    {error, timeout} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmarket_silver383, _,
		   {__Levelmarket_silver383, __Tracesmarket_silver383}}
		      when __Levelmarket_silver383 band 64 /= 0 orelse
			     __Tracesmarket_silver383 /= [] ->
		      lager:do_log(info,
				   [{module, market_silver},
				    {function, do_on_sale}, {line, 383},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("上架处理超时，不回退角色损耗, 角色名:~w, 上架物品:{~w, ~w}",
						 [Role#role.name, ItemId, Num]),
				   none, 4096, 64, __Levelmarket_silver383,
				   __Tracesmarket_silver383, lager_event,
				   __Pidmarket_silver383);
		  _ -> ok
		end,
		{ok, LossRole};
	    _False -> false
	  end;
      _ -> false
    end.

on_sale_reply(Item, Num, PrePrice, CellId,
	      Role = #role{m_market_silver = MSilver}) ->
    push_shop(Role),
    FirstRole = Role#role{m_market_silver =
			      MSilver#m_market_silver{is_first_on_sale = 0}},
    NewRole =
	role_trigger:fire(#evt_market_silver_first_on_sale{},
			  FirstRole),
    LogText = log_on_sale_text(Item, Num, PrePrice, CellId),
    log:save(market_silver, {NewRole, LogText}),
    {ok, NewRole}.

check_on_sale_cell(CellId, #role{id = RoleId}) ->
    case catch ets:lookup(market_silver_shop_tab, RoleId) of
      [#market_silver_shop{free_ids = []}] ->
	  {false, lang:get(<<"没有空的摊位"/utf8>>)};
      [#market_silver_shop{free_ids = FreeIds}] ->
	  case lists:member(CellId, FreeIds) of
	    true -> true;
	    false -> {false, lang:get(<<"摊位已使用"/utf8>>)}
	  end;
      _ -> false
    end.

do_check_on_sale_price(ItemBaseId, Percent,
		       #role{lev = Lev}) ->
    case market_silver_data:get(ItemBaseId) of
      #market_silver_item_data{min_price = MinPrice,
			       max_price = MaxPrice, open_lev = OpenLev}
	  when OpenLev =< Lev ->
	  case catch ets:lookup(market_silver_price_tab,
				ItemBaseId)
	      of
	    [#market_silver_price{price = BasePrice}] ->
		Hund = 100,
		MinPcntBool = Hund * 9.4999999999999996e-1 =< Percent,
		MaxPcntBool = Percent =< Hund * 1.05,
		case MinPcntBool andalso MaxPcntBool of
		  true ->
		      BasePrice1 = case MaxPrice =:= MinPrice of
				     true -> MinPrice;
				     false -> BasePrice
				   end,
		      Price = util:floor(BasePrice1 * Percent / Hund),
		      MaxPriceBool = Price =< MaxPrice,
		      MinPriceBool = Price >= MinPrice,
		      case MaxPriceBool andalso MinPriceBool of
			true -> {true, Price};
			_False ->
			    Args = [item:attr(name, ItemBaseId), Percent],
			    Msg = if MaxPriceBool =:= false ->
					 util:fbin(lang:get(<<"~ts不能再贵了，无法按~w%上架"/utf8>>),
						   Args);
				     true ->
					 util:fbin(lang:get(<<"~ts不能再便宜了，无法按~w%上架"/utf8>>),
						   Args)
				  end,
			    {false, Msg}
		      end;
		  false ->
		      Args = [item:attr(name, ItemBaseId), Percent],
		      Msg = if MinPcntBool =:= false ->
				   util:fbin(lang:get(<<"~ts不能再便宜了，无法按~w%上架"/utf8>>),
					     Args);
			       true ->
				   util:fbin(lang:get(<<"~ts不能再贵了，无法按~w%上架"/utf8>>),
					     Args)
			    end,
		      {false, Msg}
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
		  {__Pidmarket_silver455, _,
		   {__Levelmarket_silver455, __Tracesmarket_silver455}}
		      when __Levelmarket_silver455 band 8 /= 0 orelse
			     __Tracesmarket_silver455 /= [] ->
		      lager:do_log(error,
				   [{module, market_silver},
				    {function, do_check_on_sale_price},
				    {line, 455}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("未找到物品[~w]价格", [ItemBaseId]),
				   none, 4096, 8, __Levelmarket_silver455,
				   __Tracesmarket_silver455, lager_event,
				   __Pidmarket_silver455);
		  _ -> ok
		end,
		false
	  end;
      #market_silver_item_data{open_lev = OpenLev} ->
	  ItemName = item:attr(name, ItemBaseId),
	  {false,
	   util:fbin(lang:get(<<"~ts需要达到~w级才能上架"/utf8>>),
		     [ItemName, OpenLev])};
      _False ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_silver462, _,
	     {__Levelmarket_silver462, __Tracesmarket_silver462}}
		when __Levelmarket_silver462 band 8 /= 0 orelse
		       __Tracesmarket_silver462 /= [] ->
		lager:do_log(error,
			     [{module, market_silver},
			      {function, do_check_on_sale_price}, {line, 462},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("没有该银币市场配置数据[ItemBaseId:~w]",
					   [ItemBaseId]),
			     none, 4096, 8, __Levelmarket_silver462,
			     __Tracesmarket_silver462, lager_event,
			     __Pidmarket_silver462);
	    _ -> ok
	  end,
	  false
    end.

on_sale_again(CellId, Percent, Num, Role) ->
    case check_on_sale_again(CellId, Percent, Role) of
      {true,
       Cell = #market_silver_shop_cell{num = OldNum,
				       sold_num = SoldNum, price = Price,
				       item_base_id = ItemBaseId},
       PrePrice} ->
	  if Num =:= OldNum ->
		 do_on_sale_again(CellId, SoldNum, Price, Num, PrePrice,
				  Cell, Percent, Role);
	     Num < OldNum ->
		 case role_gain:do(Role,
				   [#gain{label = item_base_id,
					  val =
					      [{ItemBaseId, 1, OldNum - Num}]}])
		     of
		   {ok, GainRole} ->
		       do_on_sale_again(CellId, SoldNum, Price, Num, PrePrice,
					Cell, Percent, GainRole);
		   {false, _} -> {false, lang:get(<<"背包已满，无法重新上架"/utf8>>)};
		   _Err -> false
		 end;
	     true ->
		 Text = util:fbin(lang:get(<<"当前摊位上的物品数量不足~ts个"/utf8>>),
				  [color:format({orange, Num})]),
		 {false, Text}
	  end;
      {false, Msg} -> {false, Msg};
      false -> false
    end.

do_on_sale_again(CellId, 0, _Price, Num, PrePrice, Cell,
		 Percent, Role = #role{id = Rid}) ->
    ServerRtn = case case catch
			    gen_server:call(market_silver,
					    {on_sale, Rid,
					     {CellId, PrePrice, Num, Percent}},
					    10000)
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
			     {__Pidmarket_silver495, _,
			      {__Levelmarket_silver495,
			       __Tracesmarket_silver495}}
				 when __Levelmarket_silver495 band 8 /= 0 orelse
					__Tracesmarket_silver495 /= [] ->
				 lager:do_log(error,
					      [{module, market_silver},
					       {function, do_on_sale_again},
					       {line, 495},
					       {pid, pid_to_list(self())},
					       {node, node()}
					       | lager:md()],
					      io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
							    [market_silver,
							     {on_sale, Rid,
							      {CellId, PrePrice,
							       Num, Percent}},
							     10000,
							     erlang:get_stacktrace()]),
					      none, 4096, 8,
					      __Levelmarket_silver495,
					      __Tracesmarket_silver495,
					      lager_event,
					      __Pidmarket_silver495);
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
		  ok -> set_cell_timer(Role);
		  _False -> false
		end,
    case ServerRtn of
      {ok, NRole} ->
	  NewRole =
	      role_trigger:fire(#evt_market_silver_first_on_sale{},
				NRole),
	  push_shop(NewRole),
	  notice:alert(NewRole, lang:get(<<"重新上架成功"/utf8>>)),
	  LogText = log_on_sale_again_text(Cell, Num, PrePrice),
	  log:save(market_silver, {NewRole, LogText}),
	  {ok, NewRole};
      _Unknow -> false
    end;
do_on_sale_again(CellId, SoldNum, Price, Num, PrePrice,
		 Cell, Percent, Role = #role{id = Rid}) ->
    TotalPrice = SoldNum * Price,
    ExtraCoin = util:ceil(TotalPrice * 1.0e-1),
    DiffCoin = TotalPrice - ExtraCoin,
    Gains = [#gain{label = silver_coin, val = DiffCoin}],
    case role_gain:do(Role, Gains) of
      {ok, NRole} ->
	  ServerRtn = case case catch
				  gen_server:call(market_silver,
						  {on_sale, Rid,
						   {CellId, PrePrice, Num,
						    Percent}},
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
				   {__Pidmarket_silver520, _,
				    {__Levelmarket_silver520,
				     __Tracesmarket_silver520}}
				       when __Levelmarket_silver520 band 8 /= 0
					      orelse
					      __Tracesmarket_silver520 /= [] ->
				       lager:do_log(error,
						    [{module, market_silver},
						     {function,
						      do_on_sale_again},
						     {line, 520},
						     {pid, pid_to_list(self())},
						     {node, node()}
						     | lager:md()],
						    io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
								  [market_silver,
								   {on_sale,
								    Rid,
								    {CellId,
								     PrePrice,
								     Num,
								     Percent}},
								   10000,
								   erlang:get_stacktrace()]),
						    none, 4096, 8,
						    __Levelmarket_silver520,
						    __Tracesmarket_silver520,
						    lager_event,
						    __Pidmarket_silver520);
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
			ok -> {ok, NRole};
			{ok, _} ->
			    Timer = #timer{id = market_silver_cell_timer,
					   timeout = 24 * 3600,
					   m = market_silver,
					   f = recover_timeout, a = []},
			    TimerRole = role_timer:set(Timer, NRole),
			    {ok, TimerRole};
			_False -> false
		      end,
	  case ServerRtn of
	    {ok, NewRole} ->
		Text =
		    util:fbin(lang:get(<<"重新上架成功，获得~ts，扣除手续费~ts"/utf8>>),
			      [format:gain_text(Gains, NewRole), ExtraCoin]),
		notice:alert(NewRole, Text),
		push_shop(NewRole),
		LogAgainText = log_on_sale_again_text(Cell, Num,
						      PrePrice),
		log:save(market_silver, {NewRole, LogAgainText}),
		{ok, NewRole};
	    _ -> false
	  end;
      _ -> false
    end.

check_on_sale_again(CellId, Percent,
		    Role = #role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [#market_silver_shop{cells = []}] ->
	  {false, lang:get(<<"物品无需重新上架"/utf8>>)};
      [#market_silver_shop{cells = Cells}] ->
	  case lists:keyfind(CellId,
			     #market_silver_shop_cell.cell_id, Cells)
	      of
	    #market_silver_shop_cell{status = 2} ->
		{false, lang:get(<<"此物品现已不允许在市场上出售，无法重新上架"/utf8>>)};
	    #market_silver_shop_cell{status = 1} ->
		{false, lang:get(<<"物品已售出，无需再次上架"/utf8>>)};
	    Cell = #market_silver_shop_cell{status = Status,
					    item_base_id = ItemBaseId}
		when Status =:= 0 orelse
		       Status =:= 5 orelse Status =:= 6 ->
		case do_check_on_sale_price(ItemBaseId, Percent, Role)
		    of
		  {true, PrePrice} -> {true, Cell, PrePrice};
		  Rtn -> Rtn
		end;
	    _Err -> {false, lang:get(<<"未找到可上架的物品"/utf8>>)}
	  end;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_silver571, _,
	     {__Levelmarket_silver571, __Tracesmarket_silver571}}
		when __Levelmarket_silver571 band 8 /= 0 orelse
		       __Tracesmarket_silver571 /= [] ->
		lager:do_log(error,
			     [{module, market_silver},
			      {function, check_on_sale_again}, {line, 571},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "未找到物品信息", none, 4096, 8, __Levelmarket_silver571,
			     __Tracesmarket_silver571, lager_event,
			     __Pidmarket_silver571);
	    _ -> ok
	  end,
	  false
    end.

get_refresh_goods(Type, RefreshId,
		  #role{m_market_silver =
			    #m_market_silver{refresh = Refresh}}) ->
    case lists:keyfind(Type, 1, Refresh) of
      {Type, List} ->
	  case lists:keyfind(RefreshId, #market_silver_refresh.id,
			     List)
	      of
	    RefreshGoods = #market_silver_refresh{} -> RefreshGoods;
	    _Err -> false
	  end;
      _Err -> false
    end.

buy_n(Type, RefreshId, PurchsNum, Role = #role{}) ->
    case buy(Type, RefreshId, PurchsNum, Role) of
      {reply, Reply, NewRole} -> {reply, Reply, NewRole};
      Rtn -> Rtn
    end;
buy_n(_Type, _RefreshId, _PurchsNum, _Role) ->
    {false, lang:get(<<"暂时无法购买商品"/utf8>>)}.

buy(Type, RefreshId, PurchsNum,
    Role = #role{id = Rid}) ->
    case get_refresh_goods(Type, RefreshId, Role) of
      #market_silver_refresh{seller_id = Rid} ->
	  {false, lang:get(<<"这是您自己出售的物品"/utf8>>)};
      #market_silver_refresh{status = 1, num = Num} ->
	  {reply, {Type, RefreshId, 1, Num},
	   lang:get(<<"此物品已被您购买完啦"/utf8>>)};
      #market_silver_refresh{status = 2, num = Num} ->
	  {reply, {Type, RefreshId, 2, Num},
	   lang:get(<<"来晚了一步，物品已被他人购买啦"/utf8>>)};
      #market_silver_refresh{status = 3, num = Num} ->
	  {reply, {Type, RefreshId, 2, Num},
	   lang:get(<<"来晚了一步，该道具已售罄"/utf8>>)};
      RefreshGoods = #market_silver_refresh{cell_id = 0,
					    num = Num}
	  when Num >= PurchsNum ->
	  buy_system(RefreshGoods, Type, PurchsNum, Role);
      RefreshGoods = #market_silver_refresh{status = 0,
					    cell_id = CellId,
					    seller_id = SellerId}
	  when CellId > 0 ->
	  case buy_seller(CellId, SellerId, PurchsNum, Role) of
	    {ok, RestNum, NRole} ->
		Status = case RestNum > 0 of
			   true -> 0;
			   false -> 1
			 end,
		NewRefreshGoods =
		    RefreshGoods#market_silver_refresh{status = Status,
						       num = RestNum},
		NewRole = replace_refresh_goods(NRole, Type,
						NewRefreshGoods),
		{reply, {Type, RefreshId, Status, RestNum}, NewRole};
	    {false, 2} ->
		NewRefreshGoods =
		    RefreshGoods#market_silver_refresh{status = 2},
		NewRole = replace_refresh_goods(Role, Type,
						NewRefreshGoods),
		{reply, {Type, RefreshId, 2, 0},
		 lang:get(<<"来晚了一步，该道具已售罄"/utf8>>), NewRole};
	    {false, 3} ->
		NewRefreshGoods =
		    RefreshGoods#market_silver_refresh{status = 3},
		NewRole = replace_refresh_goods(Role, Type,
						NewRefreshGoods),
		{reply, {Type, RefreshId, 2, 0},
		 lang:get(<<"来晚了一步，该道具已售罄"/utf8>>), NewRole};
	    {false, Int} when is_integer(Int) ->
		{reply, {Type, RefreshId, 4, 0},
		 lang:get(<<"来晚了一步，该道具已售罄"/utf8>>)};
	    {false, Msg} -> {false, Msg};
	    false -> {false, lang:get(<<"来晚了一步，该道具已售罄"/utf8>>)}
	  end;
      _False -> {false, lang:get(<<"来晚了一步，该道具已售罄"/utf8>>)}
    end.

replace_refresh_goods(Role = #role{m_market_silver =
				       MMarketSilver = #m_market_silver{refresh
									    =
									    Refresh}},
		      Type, RefreshGoods = #market_silver_refresh{id = Id}) ->
    case lists:keytake(Type, 1, Refresh) of
      {value, {Type, List}, RestRefresh} ->
	  NewList = lists:keystore(Id, #market_silver_refresh.id,
				   List, RefreshGoods),
	  NewRefresh = [{Type, NewList} | RestRefresh],
	  NewMSilver = MMarketSilver#m_market_silver{refresh =
							 NewRefresh},
	  Role#role{m_market_silver = NewMSilver};
      false -> Role
    end.

buy_system(RefreshGoods = #market_silver_refresh{id =
						     RefreshId,
						 item_base_id = ItemBaseId,
						 num = Num, price = Price},
	   Type, PurchsNum, Role) ->
    {GainLabel, LossMsg} = case
			     market_silver_data:get(ItemBaseId)
			       of
			     #market_silver_item_data{gain_label = gold} ->
				 {gold, lang:get(<<"钻石不足，无法购买"/utf8>>)};
			     #market_silver_item_data{gain_label =
							  silver_coin} ->
				 {silver_coin, lang:get(<<"银币不足，无法购买"/utf8>>)};
			     _False ->
				 {silver_coin, lang:get(<<"银币不足，无法购买"/utf8>>)}
			   end,
    Discount = 0,
    Price1 = util:ceil(Price * (1000 - Discount) / 1000),
    TotalPrice = util:ceil(Price1 * PurchsNum),
    Loss = [#loss{label = GainLabel, val = TotalPrice,
		  msg = LossMsg}],
    case role_gain:do(Role, Loss) of
      {ok, LossRole} ->
	  Items = [{ItemBaseId, 1, PurchsNum}],
	  Gain = [#gain{label = item_base_id, val = Items}],
	  case role_gain:do_notice(LossRole, Gain) of
	    {ok, NRole} ->
		RestNum = Num - PurchsNum,
		Status = case RestNum > 0 of
			   true -> 0;
			   false -> 1
			 end,
		NewRefreshGoods = RefreshGoods#market_silver_refresh{num
									 =
									 RestNum,
								     status =
									 Status},
		FireRole = role_trigger:fire(#evt_market_silver_buy{num
									=
									PurchsNum,
								    price =
									TotalPrice},
					     NRole),
		NewRole = replace_refresh_goods(FireRole, Type,
						NewRefreshGoods),
		record_recover_timeout(ItemBaseId, PurchsNum),
		LogText = log_purchs_text(default, Loss,
					  {ItemBaseId, PurchsNum}),
		log:save(market_silver, {NewRole, LogText}),
		log:log_gain(Loss ++ Gain, Role, NewRole,
			     <<"银币市场"/utf8>>,
			     util:fbin("银币市场购买~w~w", [PurchsNum, ItemBaseId])),
		{reply, {Type, RefreshId, Status, RestNum}, NewRole};
	    {false, _} -> {false, lang:get(<<"背包已满，请先整理背包"/utf8>>)};
	    _ -> false
	  end;
      {false, #loss{msg = Msg}} -> {false, Msg};
      _ -> {false, lang:get(<<"银币不足"/utf8>>)}
    end.

buy_seller(#market_silver_shop_cell{cell_id = CellId,
				    item_base_id = ItemBaseId,
				    system_price = SysPrice, price = OldPrice},
	   #market_silver_shop{rid = SellerId, name = SellerName},
	   PurchsNum, Role) ->
    {GainLabel, LossMsg} = case
			     market_silver_data:get(ItemBaseId)
			       of
			     #market_silver_item_data{gain_label = gold} ->
				 {gold, lang:get(<<"钻石不足，无法购买"/utf8>>)};
			     _NotFound ->
				 {silver_coin, lang:get(<<"银币不足，无法购买"/utf8>>)}
			   end,
    Price = case SysPrice =:= 0 of
	      true -> calc_system_price(OldPrice);
	      false -> SysPrice
	    end,
    Discount = 0,
    Price1 = util:ceil(Price * (1000 - Discount) / 1000),
    TotalPrice = util:ceil(Price1 * PurchsNum),
    Loss = [#loss{label = GainLabel, val = TotalPrice,
		  msg = LossMsg}],
    case role_gain:do(Role, Loss) of
      {ok, LossRole = #role{id = Rid}} ->
	  Items = [{ItemBaseId, 1, PurchsNum}],
	  Gain = [#gain{label = item_base_id, val = Items}],
	  case role_gain:do_notice(LossRole, Gain) of
	    {ok, NRole} ->
		case case catch gen_server:call(market_silver,
						{buy, Rid,
						 {CellId, SellerId, PurchsNum}},
						10000)
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
			     {__Pidmarket_silver740, _,
			      {__Levelmarket_silver740,
			       __Tracesmarket_silver740}}
				 when __Levelmarket_silver740 band 8 /= 0 orelse
					__Tracesmarket_silver740 /= [] ->
				 lager:do_log(error,
					      [{module, market_silver},
					       {function, buy_seller},
					       {line, 740},
					       {pid, pid_to_list(self())},
					       {node, node()}
					       | lager:md()],
					      io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
							    [market_silver,
							     {buy, Rid,
							      {CellId, SellerId,
							       PurchsNum}},
							     10000,
							     erlang:get_stacktrace()]),
					      none, 4096, 8,
					      __Levelmarket_silver740,
					      __Tracesmarket_silver740,
					      lager_event,
					      __Pidmarket_silver740);
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
		  {ok, RestNum} ->
		      LogText = log_purchs_text({SellerId, SellerName,
						 CellId},
						Loss, {ItemBaseId, PurchsNum}),
		      NewRole = role_trigger:fire(#evt_market_silver_buy{num =
									     PurchsNum,
									 price =
									     TotalPrice},
						  NRole),
		      log:save(market_silver, {NewRole, LogText}),
		      log:log_gain(Loss ++ Gain, Role, NewRole,
				   <<"银币市场"/utf8>>,
				   util:fbin("银币市场购买~w~w",
					     [PurchsNum, ItemBaseId])),
		      {ok, RestNum, NewRole};
		  Rtn = {false, _Msg} -> Rtn;
		  false -> false
		end;
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    _ -> false
	  end;
      {false, #loss{msg = Msg}} -> {false, Msg};
      _False -> false
    end;
buy_seller(CellId, SellerId, PurchsNum,
	   Role = #role{m_market_silver =
			    #m_market_silver{refresh_time = RefreshTime}}) ->
    case catch ets:lookup(market_silver_shop_tab, SellerId)
	of
      [Shop = #market_silver_shop{cells = Cells}] ->
	  Now = date:unixtime(),
	  case lists:keyfind(CellId,
			     #market_silver_shop_cell.cell_id, Cells)
	      of
	    #market_silver_shop_cell{status = 1} -> {false, 2};
	    #market_silver_shop_cell{status = 0, expiry = Timeout}
		when Now >= Timeout ->
		{false, 3};
	    Cell = #market_silver_shop_cell{status = Status,
					    num = Num, expiry = Timeout}
		when RefreshTime - 180 + 24 * 3600 >= Timeout andalso
		       RefreshTime - 180 < Timeout andalso
			 (Status =:= 0 orelse Status =:= 5) andalso
			   Num >= PurchsNum ->
		buy_seller(Cell, Shop, PurchsNum, Role);
	    #market_silver_shop_cell{} -> {false, 3};
	    _False -> false
	  end;
      _False -> false
    end.

take_off(CellId, Role = #role{id = Rid, pid = Pid}) ->
    case get_cell(CellId, Role) of
      {ok, #market_silver_shop_cell{status = 1}} ->
	  draw(CellId, Role);
      {ok, #market_silver_shop_cell{status = 5}} ->
	  role:apply(async, Pid, {market_silver, push_shop, []}),
	  false;
      {ok,
       Cell = #market_silver_shop_cell{status = Status,
				       item_base_id = ItemBaseId, num = Num}}
	  when Status =:= 0 orelse
		 Status =:= 6 orelse Status =:= 2 ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_silver800, _,
	     {__Levelmarket_silver800, __Tracesmarket_silver800}}
		when __Levelmarket_silver800 band 128 /= 0 orelse
		       __Tracesmarket_silver800 /= [] ->
		lager:do_log(debug,
			     [{module, market_silver}, {function, take_off},
			      {line, 800}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("位置:~w, 物品ID:~w, 数量:~w",
					   [CellId, ItemBaseId, Num]),
			     none, 4096, 128, __Levelmarket_silver800,
			     __Tracesmarket_silver800, lager_event,
			     __Pidmarket_silver800);
	    _ -> ok
	  end,
	  Items = [{ItemBaseId, 1, Num}],
	  Gain = [#gain{label = item_base_id, val = Items}],
	  case role_gain:do(Role, Gain) of
	    {ok, NR} ->
		case case catch gen_server:call(market_silver,
						{take_off, Rid, {CellId}},
						10000)
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
			     {__Pidmarket_silver805, _,
			      {__Levelmarket_silver805,
			       __Tracesmarket_silver805}}
				 when __Levelmarket_silver805 band 8 /= 0 orelse
					__Tracesmarket_silver805 /= [] ->
				 lager:do_log(error,
					      [{module, market_silver},
					       {function, take_off},
					       {line, 805},
					       {pid, pid_to_list(self())},
					       {node, node()}
					       | lager:md()],
					      io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
							    [market_silver,
							     {take_off, Rid,
							      {CellId}},
							     10000,
							     erlang:get_stacktrace()]),
					      none, 4096, 8,
					      __Levelmarket_silver805,
					      __Tracesmarket_silver805,
					      lager_event,
					      __Pidmarket_silver805);
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
		  {ok, {_ReplyId, ReplyNum}} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidmarket_silver807, _,
			 {__Levelmarket_silver807, __Tracesmarket_silver807}}
			    when __Levelmarket_silver807 band 128 /= 0 orelse
				   __Tracesmarket_silver807 /= [] ->
			    lager:do_log(debug,
					 [{module, market_silver},
					  {function, take_off}, {line, 807},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("=========物品下架, BaseId:~w, Num:~w",
						       [_ReplyId, ReplyNum]),
					 none, 4096, 128,
					 __Levelmarket_silver807,
					 __Tracesmarket_silver807, lager_event,
					 __Pidmarket_silver807);
			_ -> ok
		      end,
		      NRole = case Num > ReplyNum of
				true ->
				    Loss = format:val_to_loss([{ItemBaseId,
								Num -
								  ReplyNum}]),
				    case role_gain:do(NR, Loss) of
				      {ok, NR1} ->
					  case {whereis(lager_event),
						whereis(lager_event),
						lager_config:get({lager_event,
								  loglevel},
								 {0, []})}
					      of
					    {undefined, undefined, _} ->
						fun () ->
							{error,
							 lager_not_running}
						end();
					    {undefined, _, _} ->
						fun () ->
							{error,
							 {sink_not_configured,
							  lager_event}}
						end();
					    {__Pidmarket_silver813, _,
					     {__Levelmarket_silver813,
					      __Tracesmarket_silver813}}
						when __Levelmarket_silver813
						       band 64
						       /= 0
						       orelse
						       __Tracesmarket_silver813
							 /= [] ->
						lager:do_log(info,
							     [{module,
							       market_silver},
							      {function,
							       take_off},
							      {line, 813},
							      {pid,
							       pid_to_list(self())},
							      {node, node()}
							      | lager:md()],
							     io_lib:format("铜币市场，角色名~ts, 物品~w，角色增加物品数量~w, 下架数量~w, "
									   "自动扣除数量~w",
									   [NR#role.name,
									    ItemBaseId,
									    Num,
									    ReplyNum,
									    Num
									      -
									      ReplyNum]),
							     none, 4096, 64,
							     __Levelmarket_silver813,
							     __Tracesmarket_silver813,
							     lager_event,
							     __Pidmarket_silver813);
					    _ -> ok
					  end,
					  NR1;
				      {false, _Reason} -> NR;
				      _ -> NR
				    end;
				_ -> NR
			      end,
		      push_shop(NRole),
		      push_take_off(NRole, {CellId, 1}),
		      NewRole = case set_cell_timer(NRole) of
				  {ok, TimerRole} -> TimerRole;
				  _Ok ->
				      role_timer:del(market_silver_cell_timer,
						     NRole)
				end,
		      LogText = log_take_off_text(Cell, {ItemBaseId, Num}),
		      log:save(market_silver, {NRole, LogText}),
		      {ok, NewRole};
		  {error, timeout} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidmarket_silver834, _,
			 {__Levelmarket_silver834, __Tracesmarket_silver834}}
			    when __Levelmarket_silver834 band 64 /= 0 orelse
				   __Tracesmarket_silver834 /= [] ->
			    lager:do_log(info,
					 [{module, market_silver},
					  {function, take_off}, {line, 834},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("物品下架超时，角色名:~w, 物品:{~w, ~w}",
						       [NR#role.name,
							ItemBaseId, Num]),
					 none, 4096, 64,
					 __Levelmarket_silver834,
					 __Tracesmarket_silver834, lager_event,
					 __Pidmarket_silver834);
			_ -> ok
		      end,
		      {ok, NR};
		  {false, 1} ->
		      push_take_off(NR, {CellId, 0}), {false, 1};
		  _Reply -> false
		end;
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    _Fail -> ok
	  end;
      _False -> false
    end.

draw(CellId, Role = #role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [#market_silver_shop{cells = Cells}] ->
	  case lists:keyfind(CellId,
			     #market_silver_shop_cell.cell_id, Cells)
	      of
	    Cell = #market_silver_shop_cell{} ->
		do_draw(Cell, Role);
	    _ -> false
	  end;
      _ -> false
    end.

do_draw(Cell = #market_silver_shop_cell{cell_id =
					    CellId,
					item_base_id = ItemBaseId},
	Role = #role{id = Rid}) ->
    case case catch gen_server:call(market_silver,
				    {draw, Rid, {CellId}}, 10000)
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
		 {__Pidmarket_silver864, _,
		  {__Levelmarket_silver864, __Tracesmarket_silver864}}
		     when __Levelmarket_silver864 band 8 /= 0 orelse
			    __Tracesmarket_silver864 /= [] ->
		     lager:do_log(error,
				  [{module, market_silver}, {function, do_draw},
				   {line, 864}, {pid, pid_to_list(self())},
				   {node, node()}
				   | lager:md()],
				  io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
						[market_silver,
						 {draw, Rid, {CellId}}, 10000,
						 erlang:get_stacktrace()]),
				  none, 4096, 8, __Levelmarket_silver864,
				  __Tracesmarket_silver864, lager_event,
				  __Pidmarket_silver864);
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
      {ok, #market_silver_draw_item{num = 0}} ->
	  {false, lang:get(<<"该摊位物品还未被购买，无法提现"/utf8>>)};
      {ok,
       DrawItem = #market_silver_draw_item{price = Price,
					   num = SoldNum}} ->
	  GainVal = Price * SoldNum,
	  _Format = lang:get(<<"提现成功，扣除手续费~ts，获得~ts"/utf8>>),
	  {GainLabel, Fee, NewGainVal, _FormatArgs} = case
							market_silver_data:get(ItemBaseId)
							  of
							#market_silver_item_data{gain_label
										     =
										     gold} ->
							    GoldFee1 =
								erlang:max(util:ceil(GainVal
										       *
										       2.0e-1),
									   1),
							    GoldFee =
								calc_pray_discount_draw(Role,
											GoldFee1),
							    GainGold = GainVal -
									 GoldFee,
							    GoldFmtArgs =
								[{assets_1, 3,
								  GoldFee},
								 {assets_1, 3,
								  GainGold}],
							    {gold, GoldFee,
							     GainGold,
							     GoldFmtArgs};
							_Other ->
							    CoinFee1 =
								util:ceil(GainVal
									    *
									    1.0e-1),
							    CoinFee =
								calc_pray_discount_draw(Role,
											CoinFee1),
							    GainCoin = GainVal -
									 CoinFee,
							    CoinFmtArgs =
								[{assets_1, 2,
								  CoinFee},
								 {assets_1, 2,
								  GainCoin}],
							    {silver_coin,
							     CoinFee, GainCoin,
							     CoinFmtArgs}
						      end,
	  Gain = [#gain{label = GainLabel, val = NewGainVal}],
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole} ->
		SoldEvt = #evt_market_silver_sold{assets =
						      [{GainLabel, NewGainVal}],
						  sold_items = [DrawItem]},
		SoldFireRole = role_trigger:fire(SoldEvt, NRole),
		NewRole = SoldFireRole,
		push_shop(NewRole),
		push_draw(NewRole, {CellId, 1}),
		LogText = log_draw_text(Cell, Fee, NewGainVal),
		log:save(market_silver, {NewRole, LogText}),
		log:log_gain(Gain, Role, NewRole, <<"银币市场"/utf8>>,
			     <<"金币提现"/utf8>>),
		{ok, NewRole};
	    _ -> false
	  end;
      false -> false
    end.

calc_pray_discount_draw(_Role, Fee) ->
    Value = 0, util:ceil(Fee * (1000 - Value) / 1000).

draw_gain([], CoinFee, Coin, GoldFee, Gold, Logs,
	  _Role) ->
    {util:ceil(CoinFee), util:ceil(Coin),
     util:ceil(GoldFee), util:ceil(Gold), Logs};
draw_gain([#market_silver_draw_item{base_id = BaseId,
				    price = Price, num = Num, cell_id = CellId,
				    attrs = Attrs, rest = RestNum}
	   | Rest],
	  CoinFee, Coin, GoldFee, Gold, Logs, Role) ->
    case market_silver_data:get(BaseId) of
      #market_silver_item_data{gain_label = gold} ->
	  Total = Price * Num,
	  AddFee1 = Total * 2.0e-1,
	  AddFee = calc_pray_discount_draw(Role, AddFee1),
	  GainGold = Total - AddFee,
	  Log = #{base_id => BaseId, label => gold,
		  price => Price, num => Num, fee => AddFee,
		  gain_val => GainGold, attrs => Attrs, cell_id => CellId,
		  rest => RestNum},
	  draw_gain(Rest, CoinFee, Coin, GoldFee + AddFee,
		    Gold + GainGold, [Log | Logs], Role);
      _Other ->
	  Total = Price * Num,
	  AddFee1 = Total * 1.0e-1,
	  AddFee = calc_pray_discount_draw(Role, AddFee1),
	  GainCoin = Total - AddFee,
	  Log = #{base_id => BaseId, label => silver_coin,
		  price => Price, num => Num, fee => AddFee,
		  gain_val => GainCoin, attrs => Attrs, cell_id => CellId,
		  rest => RestNum},
	  draw_gain(Rest, CoinFee + AddFee, Coin + GainCoin,
		    GoldFee, Gold, [Log | Logs], Role)
    end.

one_click(Type = 2, Role = #role{id = Rid}) ->
    case case catch gen_server:call(market_silver,
				    {one_click, Rid, {Type}}, 10000)
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
		 {__Pidmarket_silver943, _,
		  {__Levelmarket_silver943, __Tracesmarket_silver943}}
		     when __Levelmarket_silver943 band 8 /= 0 orelse
			    __Tracesmarket_silver943 /= [] ->
		     lager:do_log(error,
				  [{module, market_silver},
				   {function, one_click}, {line, 943},
				   {pid, pid_to_list(self())}, {node, node()}
				   | lager:md()],
				  io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
						[market_silver,
						 {one_click, Rid, {Type}},
						 10000,
						 erlang:get_stacktrace()]),
				  none, 4096, 8, __Levelmarket_silver943,
				  __Tracesmarket_silver943, lager_event,
				  __Pidmarket_silver943);
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
      {ok, []} -> {false, lang:get(<<"没有摊位可以提现"/utf8>>)};
      {ok, GainAcc} ->
	  {Loss, Gain, Logs} = case draw_gain(GainAcc, 0, 0, 0, 0,
					      [], Role)
				   of
				 {0, _, GoldFee, Gold, RtnLogs} ->
				     LossGold = [#loss{label = gold,
						       val = GoldFee}],
				     GainGold = [#gain{label = gold,
						       val = Gold}],
				     {LossGold, GainGold, RtnLogs};
				 {CoinFee, Coin, 0, _, RtnLogs} ->
				     LossCoin = [#loss{label = silver_coin,
						       val = CoinFee}],
				     GainList = [#gain{label = silver_coin,
						       val = Coin}],
				     {LossCoin, GainList, RtnLogs};
				 {CoinFee, Coin, GoldFee, Gold, RtnLogs} ->
				     LossCoin = [#loss{label = silver_coin,
						       val = CoinFee},
						 #loss{label = gold,
						       val = GoldFee}],
				     GainList = [#gain{label = silver_coin,
						       val = Coin},
						 #gain{label = gold,
						       val = Gold}],
				     {LossCoin, GainList, RtnLogs}
			       end,
	  LossTag = lang:get(<<"扣除手续费"/utf8>>),
	  Msg = format:gain_text(Loss ++ Gain,
				 #gain_loss_opts{loss_tag = LossTag}, Role),
	  role:send_buff_begin(),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole} ->
		GainAssets = draw_assets_evts(Gain, []),
		SoldEvt = #evt_market_silver_sold{assets = GainAssets,
						  sold_items = GainAcc},
		SoldFireRole = role_trigger:fire(SoldEvt, NRole),
		NewRole = SoldFireRole,
		Text = util:fbin(lang:get(<<"提现成功，~ts"/utf8>>), [Msg]),
		notice:alert(NRole, Text),
		push_shop(NRole),
		log_one_click_draw_text(Logs, Role, NewRole),
		role:send_buff_flush(),
		{ok, NewRole};
	    _ -> role:send_buff_clean(), false
	  end;
      false -> false
    end;
one_click(Type = 1, Role = #role{id = Rid}) ->
    case case catch gen_server:call(market_silver,
				    {one_click, Rid, {Type}}, 10000)
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
		 {__Pidmarket_silver984, _,
		  {__Levelmarket_silver984, __Tracesmarket_silver984}}
		     when __Levelmarket_silver984 band 8 /= 0 orelse
			    __Tracesmarket_silver984 /= [] ->
		     lager:do_log(error,
				  [{module, market_silver},
				   {function, one_click}, {line, 984},
				   {pid, pid_to_list(self())}, {node, node()}
				   | lager:md()],
				  io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
						[market_silver,
						 {one_click, Rid, {Type}},
						 10000,
						 erlang:get_stacktrace()]),
				  none, 4096, 8, __Levelmarket_silver984,
				  __Tracesmarket_silver984, lager_event,
				  __Pidmarket_silver984);
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
      {ok, false} ->
	  {false, lang:get(<<"没有可以重新上架的物品"/utf8>>)};
      {ok, RepeatCells} when is_list(RepeatCells) ->
	  notice:alert(Role, lang:get(<<"重新上架成功"/utf8>>)),
	  push_shop(Role),
	  log_one_click_sale_text(RepeatCells, Role),
	  set_cell_timer(Role);
      _False ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_silver992, _,
	     {__Levelmarket_silver992, __Tracesmarket_silver992}}
		when __Levelmarket_silver992 band 8 /= 0 orelse
		       __Tracesmarket_silver992 /= [] ->
		lager:do_log(error,
			     [{module, market_silver}, {function, one_click},
			      {line, 992}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("一键上架错误:~w", [_False]), none, 4096,
			     8, __Levelmarket_silver992,
			     __Tracesmarket_silver992, lager_event,
			     __Pidmarket_silver992);
	    _ -> ok
	  end,
	  {false, lang:get(<<"没有可以重新上架的物品"/utf8>>)}
    end;
one_click(_Type, _Role) -> ok.

draw_assets_evts([], Evts) -> Evts;
draw_assets_evts([#gain{label = Label, val = Val}
		  | Rest],
		 Evts) ->
    draw_assets_evts(Rest, [{Label, Val} | Evts]);
draw_assets_evts([_ | Rest], Evts) ->
    draw_assets_evts(Rest, Evts).

get_silver_shop(#role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [Shop = #market_silver_shop{}] -> {ok, Shop};
      [] -> false;
      false -> false
    end.

get_goods_price(ItemBaseId) ->
    case catch ets:lookup(market_silver_price_tab,
			  ItemBaseId)
	of
      [#market_silver_price{price = GoodsPrice}] ->
	  {ok, GoodsPrice};
      [] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_silver1014, _,
	     {__Levelmarket_silver1014, __Tracesmarket_silver1014}}
		when __Levelmarket_silver1014 band 128 /= 0 orelse
		       __Tracesmarket_silver1014 /= [] ->
		lager:do_log(debug,
			     [{module, market_silver},
			      {function, get_goods_price}, {line, 1014},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("未知银币市场物品[Id:~w]", [ItemBaseId]),
			     none, 4096, 128, __Levelmarket_silver1014,
			     __Tracesmarket_silver1014, lager_event,
			     __Pidmarket_silver1014);
	    _ -> ok
	  end,
	  false;
      _ -> false
    end.

get_pages(Start, End, Role) ->
    get_pages([1], Start, End, Role, []).

get_pages([], _Start, _End, _Role, Acc) -> Acc;
get_pages([Type | Rest], Start, End, Role, Acc) ->
    List = get_pages(Type, Start, End, Role),
    get_pages(Rest, Start, End, Role, [{Type, List} | Acc]).

get_pages(Type, Start, End,
	  #role{m_market_silver =
		    #m_market_silver{refresh = Refresh}})
    when End > Start ->
    case lists:keyfind(Type, 1, Refresh) of
      {_, []} -> [];
      {_, List} -> List;
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_silver1046, _,
	     {__Levelmarket_silver1046, __Tracesmarket_silver1046}}
		when __Levelmarket_silver1046 band 8 /= 0 orelse
		       __Tracesmarket_silver1046 /= [] ->
		lager:do_log(error,
			     [{module, market_silver}, {function, get_pages},
			      {line, 1046}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("没有分页数据[type:~w, start:~w, end:~w]",
					   [Type, Start, End]),
			     none, 4096, 8, __Levelmarket_silver1046,
			     __Tracesmarket_silver1046, lager_event,
			     __Pidmarket_silver1046);
	    _ -> ok
	  end,
	  []
    end;
get_pages(Type, Start, End, _Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_silver1050, _,
       {__Levelmarket_silver1050, __Tracesmarket_silver1050}}
	  when __Levelmarket_silver1050 band 8 /= 0 orelse
		 __Tracesmarket_silver1050 /= [] ->
	  lager:do_log(error,
		       [{module, market_silver}, {function, get_pages},
			{line, 1050}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("没有分页数据[type:~w, start:~w, end:~w]",
				     [Type, Start, End]),
		       none, 4096, 8, __Levelmarket_silver1050,
		       __Tracesmarket_silver1050, lager_event,
		       __Pidmarket_silver1050);
      _ -> ok
    end,
    [].

open_cell(Role = #role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [#market_silver_shop{max_cell_id = MaxId}] ->
	  case MaxId <
		 market_silver_data:get_const(silvermarket_boothnum)
	      of
	    true ->
		case market_silver_data:get_cell_loss(MaxId + 1) of
		  LossVal = [_ | _] ->
		      Loss = format:val_to_loss(LossVal, open_cell),
		      case role_gain:do_notice(Role, Loss) of
			Rtn = {ok, LossRole = #role{id = Rid}} ->
			    case case catch gen_server:call(market_silver,
							    {open_cell, Rid},
							    10000)
				     of
				   {'EXIT', _Call_Err} ->
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
					 {__Pidmarket_silver1064, _,
					  {__Levelmarket_silver1064,
					   __Tracesmarket_silver1064}}
					     when __Levelmarket_silver1064 band
						    8
						    /= 0
						    orelse
						    __Tracesmarket_silver1064 /=
						      [] ->
					     lager:do_log(error,
							  [{module,
							    market_silver},
							   {function,
							    open_cell},
							   {line, 1064},
							   {pid,
							    pid_to_list(self())},
							   {node, node()}
							   | lager:md()],
							  io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
									[market_silver,
									 {open_cell,
									  Rid},
									 10000,
									 erlang:get_stacktrace()]),
							  none, 4096, 8,
							  __Levelmarket_silver1064,
							  __Tracesmarket_silver1064,
							  lager_event,
							  __Pidmarket_silver1064);
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
			      ok ->
				  push_shop(LossRole),
				  LogText = log_open_cell_text(MaxId + 1,
							       LossVal),
				  log:save(market_silver, {LossRole, LogText}),
				  log:log_gain(Loss, Role, LossRole,
					       <<"银币市场"/utf8>>,
					       util:fbin("摊位开放~w",
							 [MaxId + 1])),
				  Rtn;
			      false -> false
			    end;
			{false, #loss{label = silver_coin}} ->
			    {false, lang:get(<<"银币不足"/utf8>>)};
			_ -> false
		      end;
		  _ -> false
		end;
	    _ ->
		{false,
		 util:fbin(lang:get(<<"最多只可以开启~w个格子哟!"/utf8>>),
			   [market_silver_data:get_const(silvermarket_boothnum)])}
	  end;
      _False ->
	  {false,
	   util:fbin(lang:get(<<"最多只可以开启~w个格子哟!"/utf8>>),
		     [market_silver_data:get_const(silvermarket_boothnum)])}
    end.

query_market_price(BaseId) ->
    case market_silver_data:get(BaseId) of
      Data = #market_silver_item_data{} ->
	  case catch ets:lookup(market_silver_price_tab, BaseId)
	      of
	    [#market_silver_price{price = Price}] ->
		query_market_price(Price, Data);
	    _False ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmarket_silver1092, _,
		   {__Levelmarket_silver1092, __Tracesmarket_silver1092}}
		      when __Levelmarket_silver1092 band 8 /= 0 orelse
			     __Tracesmarket_silver1092 /= [] ->
		      lager:do_log(error,
				   [{module, market_silver},
				    {function, query_market_price},
				    {line, 1092}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("未知银币市场物品[BaseId:~w]",
						 [BaseId]),
				   none, 4096, 8, __Levelmarket_silver1092,
				   __Tracesmarket_silver1092, lager_event,
				   __Pidmarket_silver1092);
		  _ -> ok
		end,
		false
	  end;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_silver1096, _,
	     {__Levelmarket_silver1096, __Tracesmarket_silver1096}}
		when __Levelmarket_silver1096 band 8 /= 0 orelse
		       __Tracesmarket_silver1096 /= [] ->
		lager:do_log(error,
			     [{module, market_silver},
			      {function, query_market_price}, {line, 1096},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("未知银币市场物品[BaseId:~w]", [BaseId]),
			     none, 4096, 8, __Levelmarket_silver1096,
			     __Tracesmarket_silver1096, lager_event,
			     __Pidmarket_silver1096);
	    _ -> ok
	  end,
	  false
    end.

query_market_price(Price,
		   #market_silver_item_data{gain_label = Label,
					    base_id = BaseId}) ->
    {Assets, Pcnt} = case Label of
		       silver_coin -> {2, 1.1};
		       _ -> {3, 1.05}
		     end,
    NewPrice = util:ceil(Price * Pcnt),
    MarketPrice = #market_price{base_id = BaseId,
				price = NewPrice, assets = Assets, source = 3},
    {ok, MarketPrice}.

refresh(2, Role) ->
    Loss = [#loss{label = silver_coin,
		  val = market_silver_data:get_const(silvermarket_cost)}],
    case role_gain:do_notice(Role, Loss) of
      {ok,
       LossRole = #role{m_market_silver = MMarketSilver}} ->
	  TypeGoods = do_refresh(LossRole),
	  Now = date:unixtime(),
	  Time = Now + 180,
	  NewRole = LossRole#role{m_market_silver =
				      MMarketSilver#m_market_silver{refresh =
									TypeGoods,
								    refresh_time
									=
									Time}},
	  RtnList = get_pages(1, 2, NewRole),
	  LogText = util:fbin(<<"银币市场刷新，消耗金币300"/utf8>>, []),
	  log:save(market_silver, {NewRole, LogText}),
	  {ok, NewRole, {Time, RtnList}};
      _ -> notice:alert(lang:get(<<"金币不足"/utf8>>)), false
    end;
refresh(1,
	Role = #role{m_market_silver =
			 MMarketSilver = #m_market_silver{refresh =
							      OldTypeGoods,
							  refresh_time =
							      RefreshTime}}) ->
    Now = date:unixtime(),
    case check_refresh_empty(OldTypeGoods) of
      true ->
	  TypeGoods = do_refresh(Role),
	  Time = Now + 180,
	  NewRole = Role#role{m_market_silver =
				  MMarketSilver#m_market_silver{refresh =
								    TypeGoods,
								refresh_time =
								    Time}},
	  RtnList = get_pages(1, 2, NewRole),
	  {ok, NewRole, {Time, RtnList}};
      _ ->
	  case Now > RefreshTime - 3 of
	    true ->
		TypeGoods = do_refresh(Role),
		Time = Now + 180,
		NewRole = Role#role{m_market_silver =
					MMarketSilver#m_market_silver{refresh =
									  TypeGoods,
								      refresh_time
									  =
									  Time}},
		RtnList = get_pages(1, 2, NewRole),
		{ok, NewRole, {Time, RtnList}};
	    false -> false
	  end
    end;
refresh(3,
	Role = #role{m_market_silver =
			 MMarketSilver = #m_market_silver{refresh =
							      OldTypeGoods,
							  refresh_time =
							      RefreshTime}}) ->
    Now = date:unixtime(),
    case check_refresh_empty(OldTypeGoods) of
      true ->
	  TypeGoods = do_refresh(Role),
	  Time = Now + 180,
	  NewRole = Role#role{m_market_silver =
				  MMarketSilver#m_market_silver{refresh =
								    TypeGoods,
								refresh_time =
								    Time}},
	  RtnList = get_pages(1, 2, NewRole),
	  {ok, NewRole, {Time, RtnList}};
      _ ->
	  RtnList = get_pages(1, 2, Role),
	  {ok, {RefreshTime, RtnList}}
    end;
refresh(_Unknow, _Role) -> false.

do_refresh(Role) ->
    TypeGoods = get_goods([1], Role, []),
    random_goods(TypeGoods, Role, []).

random_goods([], _Role, Acc) -> Acc;
random_goods([{Type, 0, List} | Rest], Role, Acc) ->
    random_goods(Rest, Role, [{Type, List} | Acc]);
random_goods([{Type, _Len, GoodsList} | Rest], Role,
	     Acc) ->
    Size = 10,
    Now = date:unixtime(),
    {Size1, RandAcc1, SPriceAcc} = rand_round_1(GoodsList,
						Size, Now, [], []),
    StatusticsData = statistics_refresh_count(RandAcc1, []),
    MaxRfCount = calc_rfgoods_count(StatusticsData),
    {Size3, RandAcc3} = rand_round_3(Size1, Size1,
				     SPriceAcc, Now, [], StatusticsData,
				     MaxRfCount),
    NRandAcc = RandAcc3 ++ RandAcc1,
    SortRandAcc = sort_rand(NRandAcc, []),
    {DefRandAcc, NonDefRandAcc} = rand_round_4(Size3,
					       SortRandAcc, []),
    NewRandAcc = shuffle_rand(NonDefRandAcc ++ DefRandAcc,
			      0, [], 0, []),
    SeqList = seq_goods(NewRandAcc, 1, Size, []),
    random_goods(Rest, Role, [{Type, SeqList} | Acc]).

rand_round_3(0, Size, _SPriceAcc, _Now, Acc,
	     _StatusticsData, _MaxRfCount) ->
    {Size, Acc};
rand_round_3(Size, NSize, SPriceAcc, Now, Acc,
	     StatusticsData, MaxRfCountVal) ->
    case util:rand_list(SPriceAcc) of
      SPrice = #market_silver_price{sellers = Sellers,
				    item_base_id = BaseId} ->
	  MaxRfCount = case is_quest_need(BaseId) of
			 false -> 1;
			 true -> MaxRfCountVal
		       end,
	  Result = case lists:keyfind(BaseId, 1, StatusticsData)
		       of
		     {BaseId, Num} -> {MaxRfCount > Num, Num};
		     false -> {true, 0}
		   end,
	  case Result of
	    {true, StNum} ->
		RefreshList = check_rand_cell(Sellers, BaseId, Now, []),
		case util:rand_list(RefreshList) of
		  Goods = #market_silver_refresh{seller_id = SellerId,
						 cell_id = CellId} ->
		      NewSellers = lists:delete({SellerId, CellId}, Sellers),
		      NewSPrice = SPrice#market_silver_price{sellers =
								 NewSellers},
		      NewSPriceAcc = lists:keystore(BaseId,
						    #market_silver_price.item_base_id,
						    SPriceAcc, NewSPrice),
		      NewStatusticsData = lists:keyreplace(BaseId, 1,
							   StatusticsData,
							   {BaseId, StNum + 1}),
		      rand_round_3(Size - 1, NSize - 1, NewSPriceAcc, Now,
				   [Goods | Acc], NewStatusticsData,
				   MaxRfCount);
		  _ ->
		      rand_round_3(Size - 1, NSize, SPriceAcc, Now, Acc,
				   StatusticsData, MaxRfCount)
		end;
	    {false, _} ->
		rand_round_3(Size - 1, NSize, SPriceAcc, Now, Acc,
			     StatusticsData, MaxRfCount)
	  end;
      _ ->
	  rand_round_3(Size - 1, NSize, SPriceAcc, Now, Acc,
		       StatusticsData, MaxRfCountVal)
    end.

sort_rand([], Acc) -> lists:keysort(2, Acc);
sort_rand([Price = #market_silver_refresh{item_base_id =
					      BaseId}
	   | Rest],
	  Acc) ->
    case lists:keyfind(BaseId, 1, Acc) of
      {_, Len, List} ->
	  New = {BaseId, Len + 1, [Price | List]},
	  NewAcc = lists:keystore(BaseId, 1, Acc, New),
	  sort_rand(Rest, NewAcc);
      _ ->
	  NewAcc = [{BaseId, 1, [Price]} | Acc],
	  sort_rand(Rest, NewAcc)
    end.

shuffle_rand([], QLen, QAcc, OLen, OAcc) ->
    case QLen > OLen of
      true -> shuffle(OAcc) ++ shuffle(QAcc);
      false -> shuffle(QAcc) ++ shuffle(OAcc)
    end;
shuffle_rand([{_BaseId, Len, List} | Rest], QLen, QAcc,
	     OLen, OAcc) ->
    shuffle_rand(Rest, QLen + Len, List ++ QAcc, OLen,
		 OAcc).

rand_round_4(0, RandAcc, NonDefRandAcc) ->
    {RandAcc, NonDefRandAcc};
rand_round_4(_, [], NonDefRandAcc) ->
    {[], NonDefRandAcc};
rand_round_4(Size,
	     RandAcc = [{BaseId, Len, List} | Rest],
	     NonDefRandAcc) ->
    case catch ets:lookup(market_silver_price_tab, BaseId)
	of
      [SPrice = #market_silver_price{}] ->
	  case make_default_goods(BaseId, SPrice, Size, 1) of
	    {Size, _} ->
		rand_round_4(Size, Rest,
			     [{BaseId, Len, List} | NonDefRandAcc]);
	    {NSize, Default} ->
		New = [{BaseId, Len + 1, Default ++ List} | Rest],
		NewRandAcc = lists:keysort(2, New),
		rand_round_4(NSize, NewRandAcc, NonDefRandAcc)
	  end;
      _ -> rand_round_4(Size - 1, RandAcc, NonDefRandAcc)
    end.

rand_round_1(_, 0, _Now, Acc, SPriceAcc) ->
    {0, Acc, SPriceAcc};
rand_round_1([], Size, _Now, Acc, SPriceAcc) ->
    {Size, Acc, SPriceAcc};
rand_round_1([#market_silver_item_data{base_id = BaseId,
				       is_quest_need = _IsQuestNeed}
	      | Rest],
	     Size, Now, Acc, SPriceAcc) ->
    case catch ets:lookup(market_silver_price_tab, BaseId)
	of
      [SPrice = #market_silver_price{sellers = []}] ->
	  RandNum = 1,
	  {NewSize, Default} = make_default_goods(BaseId, SPrice,
						  Size, RandNum),
	  rand_round_1(Rest, NewSize, Now, Default ++ Acc,
		       SPriceAcc);
      [SPrice = #market_silver_price{sellers = Sellers,
				     price = _Price}] ->
	  RefreshList = check_rand_cell(Sellers, BaseId, Now, []),
	  RandNum = 1,
	  case util:rand_list_n(RefreshList, RandNum) of
	    RandList = [_ | _] ->
		Len = length(RandList),
		DelSellers = [{SellerId, CellId}
			      || #market_silver_refresh{seller_id = SellerId,
							cell_id = CellId}
				     <- RandList],
		NewSellers = sub_big_list(Sellers, DelSellers),
		NewSPrice = SPrice#market_silver_price{sellers =
							   NewSellers},
		{NSize, Default} = case Len < 1 of
				     true ->
					 make_default_goods(BaseId, SPrice,
							    Size, 1);
				     false -> {Size, []}
				   end,
		NewSize = erlang:max(NSize - Len, 0),
		NewAcc = Default ++ RandList ++ Acc,
		rand_round_1(Rest, NewSize, Now, NewAcc,
			     [NewSPrice | SPriceAcc]);
	    _ ->
		{NSize, Default} = make_default_goods(BaseId, SPrice,
						      Size, 2),
		rand_round_1(Rest, NSize, Now, Default ++ Acc,
			     SPriceAcc)
	  end;
      _ -> rand_round_1(Rest, Size, Now, Acc, SPriceAcc)
    end.

check_rand_cell([], _BaseId, _Now, Acc) -> Acc;
check_rand_cell([{Rid, CellId} | Rest], BaseId, Now,
		Acc) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [#market_silver_shop{cells = Cells}] ->
	  case lists:keyfind(CellId,
			     #market_silver_shop_cell.cell_id, Cells)
	      of
	    #market_silver_shop_cell{status = Status,
				     item_base_id = BaseId, num = Num,
				     sale_time = SaleTime,
				     system_price = SysPrice, price = Price,
				     item_attrs = Attrs, expiry = Expiry}
		when Expiry > Now andalso
		       Now > SaleTime andalso
			 (Status =:= 0 orelse Status =:= 5) ->
		NewPrice = case SysPrice =:= 0 of
			     true -> calc_system_price(Price);
			     _ -> SysPrice
			   end,
		Goods = #market_silver_refresh{cell_id = CellId,
					       item_base_id = BaseId, num = Num,
					       price = NewPrice,
					       seller_id = Rid,
					       item_attrs = Attrs},
		check_rand_cell(Rest, BaseId, Now, [Goods | Acc]);
	    _False -> check_rand_cell(Rest, BaseId, Now, Acc)
	  end;
      _False -> check_rand_cell(Rest, BaseId, Now, Acc)
    end.

seq_goods([], _N, _Size, Acc) -> lists:reverse(Acc);
seq_goods(_Rest, N, Size, Acc) when N > Size ->
    lists:reverse(Acc);
seq_goods([Goods | Rest], N, Size, Acc) ->
    seq_goods(Rest, N + 1, Size,
	      [Goods#market_silver_refresh{id = N} | Acc]).

make_default_goods(BaseId,
		   SPrice = #market_silver_price{price = BasePrice}, Size,
		   MakeSize) ->
    DefaultPrice = util:ceil(BasePrice),
    SystemPrice = calc_system_price(DefaultPrice),
    case market_silver_data:get(BaseId) of
      Data = #market_silver_item_data{min_price = Min,
				      max_price = Max, is_system = 1,
				      type = _Type,
				      rand_num = {MinRand, MaxRand},
				      make_pcnt = MakePcent} ->
	  case util:rand_per_mille(MakePcent) of
	    true ->
		NewPrice = erlang:min(erlang:max(Min, SystemPrice),
				      Max),
		RandNum = util:rand(MinRand, MaxRand),
		List = lists:duplicate(MakeSize, RandNum),
		PriceList = make_default_goods(List, BaseId, NewPrice,
					       SPrice, Data, []),
		NSize = erlang:max(Size - length(PriceList), 0),
		{NSize, PriceList};
	    _ -> {Size, []}
	  end;
      _ -> {Size, []}
    end.

make_default_goods([], _BaseId, _Price, _SPrice, _Data,
		   Acc) ->
    Acc;
make_default_goods([Num | Rest], BaseId, Price, SPrice,
		   Data = #market_silver_item_data{}, Acc) ->
    Attrs = [],
    Refresh = #market_silver_refresh{item_base_id = BaseId,
				     num = Num, price = Price,
				     item_attrs = Attrs},
    make_default_goods(Rest, BaseId, Price, SPrice, Data,
		       [Refresh | Acc]).

get_goods([], _Role, Acc) -> Acc;
get_goods([Type | Rest], Role, Acc) ->
    Goods = market_silver_data:get_item_by_type(Type),
    NewGoods = util:shuffle(Goods),
    {Len, FilterGoods} = filter_goods(NewGoods, Role, 0,
				      []),
    get_goods(Rest, Role, [{Type, Len, FilterGoods} | Acc]).

filter_goods([], _Role, Count, Acc) ->
    {Count, lists:reverse(Acc)};
filter_goods([Goods | Rest], Role, Count, Acc) ->
    case check_goods([lev], Goods, Role) of
      true ->
	  filter_goods(Rest, Role, Count + 1, [Goods | Acc]);
      false -> filter_goods(Rest, Role, Count, Acc)
    end.

check_goods([], _Goods, _Role) -> true;
check_goods([lev | Rest],
	    Data = #market_silver_item_data{open_lev = OpenLev},
	    Role = #role{lev = Lev})
    when OpenLev =< Lev ->
    check_goods(Rest, Data, Role);
check_goods(_Cond, _Data, _Role) -> false.

push_ico_mark(Role) ->
    role:pack_send(Role, 23519, {}), ok.

check_cell_draw_status([]) -> false;
check_cell_draw_status([#market_silver_shop_cell{status
						     = Status}
			| _Rest])
    when Status =:= 5 orelse
	   Status =:= 1 orelse Status =:= 6 ->
    true;
check_cell_draw_status([#market_silver_shop_cell{status
						     = Status,
						 expiry = Expiry}
			| Rest]) ->
    TimeOutStatus = case Expiry < date:unixtime() of
		      false -> Status;
		      true -> 6
		    end,
    case TimeOutStatus of
      6 -> true;
      _ -> check_cell_draw_status(Rest)
    end;
check_cell_draw_status(#role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [#market_silver_shop{cells = Cells}] ->
	  check_cell_draw_status(Cells);
      _ -> false
    end;
check_cell_draw_status([_H | Rest]) ->
    check_cell_draw_status(Rest).

record_recover_timeout(BaseId, Num) ->
    gen_server:cast(market_silver,
		    {record_recover_timeout, BaseId, Num}).

recover_timeout(Role = #role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [Shop = #market_silver_shop{}] ->
	  recover_timeout(Role, Shop);
      _ -> false
    end,
    remove.

recover_timeout(#role{id = Rid, pid = Pid},
		#market_silver_shop{cells = Cells, pid = ShopPid}) ->
    Now = date:unixtime(),
    RecoverCells = recover_cell(Cells, Now, []),
    case RecoverCells of
      [] ->
	  case ShopPid =:= Pid of
	    true -> false;
	    false ->
		gen_server:cast(market_silver, {login, Rid, Pid}), false
	  end;
      _ ->
	  CellIds = [CellId
		     || #market_silver_shop_cell{cell_id = CellId}
			    <- RecoverCells],
	  gen_server:cast(market_silver,
			  {recover_timeout, Rid, Pid, CellIds}),
	  ok
    end.

set_cell_timer(Role = #role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [#market_silver_shop{cells = []}] -> ok;
      [Shop] ->
	  TimerRole = set_cell_timer(Role, Shop), {ok, TimerRole};
      _False -> ok
    end.

set_cell_timer(Role, #market_silver_shop{cells = []}) ->
    Role;
set_cell_timer(Role,
	       #market_silver_shop{cells = Cells}) ->
    case get_cell_timer(Cells) of
      false -> Role;
      {ok, Timer} ->
	  NewRole = role_timer:set(Timer, Role), NewRole
    end.

get_cell_timer(Cells) ->
    Now = date:unixtime(),
    RecoverCells = recover_cell(Cells, Now, []),
    case RecoverCells of
      [] -> false;
      _ ->
	  SortList =
	      lists:keysort(#market_silver_shop_cell.expiry,
			    RecoverCells),
	  ValidList = [Cell
		       || Cell = #market_silver_shop_cell{status = Status,
							  expiry = Expiry}
			      <- SortList,
			  Status =/= 6, Expiry > Now],
	  case ValidList of
	    [#market_silver_shop_cell{expiry = Expiry} | _] ->
		Timeout = erlang:max((Expiry - Now) * 1000, 1),
		Timer = #timer{id = market_silver_cell_timer,
			       timeout = Timeout, m = market_silver,
			       f = recover_timeout, a = []},
		{ok, Timer};
	    _ -> false
	  end
    end.

recover_cell([], _Now, Acc) -> Acc;
recover_cell([Cell = #market_silver_shop_cell{status =
						  Status,
					      percent = Percent,
					      item_base_id = BaseId}
	      | Rest],
	     Now, Acc)
    when Status =:= 0 orelse
	   Status =:= 5 orelse Status =:= 6 ->
    {LimitPercent, _} =
	market_silver_data:get_recover_upprice(BaseId),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_silver1532, _,
       {__Levelmarket_silver1532, __Tracesmarket_silver1532}}
	  when __Levelmarket_silver1532 band 128 /= 0 orelse
		 __Tracesmarket_silver1532 /= [] ->
	  lager:do_log(debug,
		       [{module, market_silver}, {function, recover_cell},
			{line, 1532}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("进行回购确认，道具:~w小于：~w进行回购",
				     [BaseId, LimitPercent]),
		       none, 4096, 128, __Levelmarket_silver1532,
		       __Tracesmarket_silver1532, lager_event,
		       __Pidmarket_silver1532);
      _ -> ok
    end,
    case Percent =< LimitPercent of
      true -> recover_cell(Rest, Now, [Cell | Acc]);
      false -> recover_cell(Rest, Now, Acc)
    end;
recover_cell([_ | Rest], Now, Acc) ->
    recover_cell(Rest, Now, Acc).

callback_recover_timeout(Role, Shop) ->
    push_ico_mark(Role),
    push_shop(Role, Shop),
    NewRole = set_cell_timer(Role, Shop),
    {ok, NewRole}.

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_silver1552, _,
       {__Levelmarket_silver1552, __Tracesmarket_silver1552}}
	  when __Levelmarket_silver1552 band 64 /= 0 orelse
		 __Tracesmarket_silver1552 /= [] ->
	  lager:do_log(info,
		       [{module, market_silver}, {function, init},
			{line, 1552}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [market_silver]), none,
		       4096, 64, __Levelmarket_silver1552,
		       __Tracesmarket_silver1552, lager_event,
		       __Pidmarket_silver1552);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    case catch load_data() of
      ok ->
	  TRef = reset_timer(),
	  RecoverRef = set_server_recover_timer(),
	  Pltm = case sys_env:get(platform) of
		   undefined -> "";
		   TmpPltm -> TmpPltm
		 end,
	  ZoneId = case sys_env:get(zone_id) of
		     undefined -> 0;
		     TmpZoneId -> TmpZoneId
		   end,
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_silver1560, _,
	     {__Levelmarket_silver1560, __Tracesmarket_silver1560}}
		when __Levelmarket_silver1560 band 64 /= 0 orelse
		       __Tracesmarket_silver1560 /= [] ->
		lager:do_log(info,
			     [{module, market_silver}, {function, init},
			      {line, 1560}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~w] 启动完成", [market_silver]), none,
			     4096, 64, __Levelmarket_silver1560,
			     __Tracesmarket_silver1560, lager_event,
			     __Pidmarket_silver1560);
	    _ -> ok
	  end,
	  {ok,
	   #state{reset_timer = TRef, recover_timer = RecoverRef,
		  platform = Pltm, zone_id = ZoneId}};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_silver1563, _,
	     {__Levelmarket_silver1563, __Tracesmarket_silver1563}}
		when __Levelmarket_silver1563 band 8 /= 0 orelse
		       __Tracesmarket_silver1563 /= [] ->
		lager:do_log(error,
			     [{module, market_silver}, {function, init},
			      {line, 1563}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~w] 启动失败，无法载入数据[Err:~w]",
					   [market_silver, Err]),
			     none, 4096, 8, __Levelmarket_silver1563,
			     __Tracesmarket_silver1563, lager_event,
			     __Pidmarket_silver1563);
	    _ -> ok
	  end,
	  {stop, abnormal}
    end.

handle_call({on_sale, RoleId, Data}, _From, State) ->
    Reply = do_save_on_sale(RoleId, Data),
    {reply, Reply, State};
handle_call({buy, RoleId, Data}, _From, State) ->
    Reply = server_buy(RoleId, Data), {reply, Reply, State};
handle_call({open_cell, Rid}, _From, State) ->
    Reply = do_save_open_cell(Rid), {reply, Reply, State};
handle_call({one_click, Rid, Data}, _From, State) ->
    Reply = do_save_one_click(Rid, Data),
    {reply, Reply, State};
handle_call({take_off, Rid, Data}, _From, State) ->
    Reply = do_save_take_off(Rid, Data),
    {reply, Reply, State};
handle_call({draw, Rid, Data}, _From, State) ->
    Reply = do_save_draw(Rid, Data), {reply, Reply, State};
handle_call(server_recover, _From, State) ->
    Reply = server_recover(), {reply, Reply, State};
handle_call(_Request, _From, State) ->
    Reply = ok, {reply, Reply, State}.

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
      {__Pidmarket_silver1594, _,
       {__Levelmarket_silver1594, __Tracesmarket_silver1594}}
	  when __Levelmarket_silver1594 band 64 /= 0 orelse
		 __Tracesmarket_silver1594 /= [] ->
	  lager:do_log(info,
		       [{module, market_silver}, {function, handle_cast},
			{line, 1594}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "银币市场重载完成", none, 4096, 64, __Levelmarket_silver1594,
		       __Tracesmarket_silver1594, lager_event,
		       __Pidmarket_silver1594);
      _ -> ok
    end,
    {noreply, State};
handle_cast({init_shop, Info}, State) ->
    server_init_shop(Info), {noreply, State};
handle_cast({revise_shop_cells, Rid}, State) ->
    server_revise_shop_cells(Rid), {noreply, State};
handle_cast({record_recover_timeout, BaseId, Num},
	    State) ->
    server_record_recover_timeout(BaseId, Num, timeout),
    {noreply, State};
handle_cast({recover_timeout, Rid, Pid, CellIds},
	    State) ->
    server_recover_timeout(Rid, Pid, CellIds),
    {noreply, State};
handle_cast({auto_buy_seller, ItemInfo}, State) ->
    case catch package:merge(ItemInfo) of
      NewInfo = [_ | _] -> server_auto_buy_seller(NewInfo);
      _ -> skip
    end,
    {noreply, State};
handle_cast({login, Rid, Pid}, State) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [Shop = #market_silver_shop{}] ->
	  save(market_silver_shop_tab,
	       Shop#market_silver_shop{pid = Pid});
      _ -> false
    end,
    {noreply, State};
handle_cast({logout, Rid}, State) ->
    server_logout(Rid), {noreply, State};
handle_cast(Msg, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_silver1626, _,
       {__Levelmarket_silver1626, __Tracesmarket_silver1626}}
	  when __Levelmarket_silver1626 band 8 /= 0 orelse
		 __Tracesmarket_silver1626 /= [] ->
	  lager:do_log(error,
		       [{module, market_silver}, {function, handle_cast},
			{line, 1626}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]接收到错误的消息[~w]", [market_silver, Msg]),
		       none, 4096, 8, __Levelmarket_silver1626,
		       __Tracesmarket_silver1626, lager_event,
		       __Pidmarket_silver1626);
      _ -> ok
    end,
    {noreply, State}.

handle_info(reset,
	    #state{reset_timer = TRef} = State) ->
    erlang:cancel_timer(TRef),
    reset_price(State),
    NewTRef = reset_timer(),
    garbage_collect(),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_silver1634, _,
       {__Levelmarket_silver1634, __Tracesmarket_silver1634}}
	  when __Levelmarket_silver1634 band 64 /= 0 orelse
		 __Tracesmarket_silver1634 /= [] ->
	  lager:do_log(info,
		       [{module, market_silver}, {function, handle_info},
			{line, 1634}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "0点重置银币市场服务器价格完成", none, 4096, 64,
		       __Levelmarket_silver1634, __Tracesmarket_silver1634,
		       lager_event, __Pidmarket_silver1634);
      _ -> ok
    end,
    {noreply, State#state{reset_timer = NewTRef}};
handle_info(server_recover,
	    #state{recover_timer = TRef} = State) ->
    erlang:cancel_timer(TRef),
    server_recover(),
    garbage_collect(),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_silver1640, _,
       {__Levelmarket_silver1640, __Tracesmarket_silver1640}}
	  when __Levelmarket_silver1640 band 128 /= 0 orelse
		 __Tracesmarket_silver1640 /= [] ->
	  lager:do_log(debug,
		       [{module, market_silver}, {function, handle_info},
			{line, 1640}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "定时10分钟回收玩家道具", none, 4096, 128,
		       __Levelmarket_silver1640, __Tracesmarket_silver1640,
		       lager_event, __Pidmarket_silver1640);
      _ -> ok
    end,
    NewTRef = set_server_recover_timer(),
    {noreply, State#state{recover_timer = NewTRef}};
handle_info(_Info, State) -> {noreply, State}.

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
	    {__Pidmarket_silver1649, _,
	     {__Levelmarket_silver1649, __Tracesmarket_silver1649}}
		when __Levelmarket_silver1649 band 64 /= 0 orelse
		       __Tracesmarket_silver1649 /= [] ->
		lager:do_log(info,
			     [{module, market_silver}, {function, terminate},
			      {line, 1649}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("银币市场正常关闭:[~w]", [market_silver]),
			     none, 4096, 64, __Levelmarket_silver1649,
			     __Tracesmarket_silver1649, lager_event,
			     __Pidmarket_silver1649);
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
	    {__Pidmarket_silver1650, _,
	     {__Levelmarket_silver1650, __Tracesmarket_silver1650}}
		when __Levelmarket_silver1650 band 64 /= 0 orelse
		       __Tracesmarket_silver1650 /= [] ->
		lager:do_log(info,
			     [{module, market_silver}, {function, terminate},
			      {line, 1650}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "由Supervisor主动shutdown银币市场进程", none, 4096, 64,
			     __Levelmarket_silver1650,
			     __Tracesmarket_silver1650, lager_event,
			     __Pidmarket_silver1650);
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
	    {__Pidmarket_silver1651, _,
	     {__Levelmarket_silver1651, __Tracesmarket_silver1651}}
		when __Levelmarket_silver1651 band 8 /= 0 orelse
		       __Tracesmarket_silver1651 /= [] ->
		lager:do_log(error,
			     [{module, market_silver}, {function, terminate},
			      {line, 1651}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("银币市场关闭异常:[Reason:~w]", [_Unknow]),
			     none, 4096, 8, __Levelmarket_silver1651,
			     __Tracesmarket_silver1651, lager_event,
			     __Pidmarket_silver1651);
	    _ -> ok
	  end
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

push_take_off(Role, Data) ->
    role:pack_send(Role, 23506, Data).

push_draw(Role, Data) ->
    role:pack_send(Role, 23511, Data).

push_shop(Role) ->
    case get_silver_shop(Role) of
      false -> false;
      {ok, Shop} -> role:pack_send(Role, 23507, {Shop})
    end,
    ok.

push_shop(Role, Shop) ->
    role:pack_send(Role, 23507, {Shop}), ok.

load_data() ->
    market_silver_shop_tab = ets:new(market_silver_shop_tab,
				     [set, named_table, public,
				      {keypos, #market_silver_shop.rid}]),
    {ok, market_silver_shop_tab} =
	dets:open_file(market_silver_shop_tab,
		       [{file, "dets/market_silver_shop.dets"},
			{keypos, #market_silver_shop.rid}, {type, set}]),
    market_silver_shop_tab =
	dets:to_ets(market_silver_shop_tab,
		    market_silver_shop_tab),
    market_silver_price_tab =
	ets:new(market_silver_price_tab,
		[set, named_table, public,
		 {keypos, #market_silver_price.item_base_id}]),
    {ok, market_silver_price_tab} =
	dets:open_file(market_silver_price_tab,
		       [{file, "dets/market_silver_price.dets"},
			{keypos, #market_silver_price.item_base_id},
			{type, set}]),
    silver_shop_var(),
    silver_price_ver(),
    reload_data(),
    ok.

silver_price_ver() ->
    FunPrice = fun (SilverPrice, Acc) ->
		       case market_ver:silver_price_ver(SilverPrice) of
			 {ok,
			  NVerPrice = #market_silver_price{sellers =
							       Sellers}} ->
			     NewSellers = remove_duplicate(Sellers),
			     NewSilverPrice =
				 NVerPrice#market_silver_price{sellers =
								   NewSellers},
			     [NewSilverPrice | Acc];
			 {false, _Msg} -> [SilverPrice | Acc]
		       end
	       end,
    case dets:foldl(FunPrice, [], market_silver_price_tab)
	of
      {error, PriceErr} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_silver1706, _,
	     {__Levelmarket_silver1706, __Tracesmarket_silver1706}}
		when __Levelmarket_silver1706 band 8 /= 0 orelse
		       __Tracesmarket_silver1706 /= [] ->
		lager:do_log(error,
			     [{module, market_silver},
			      {function, silver_price_ver}, {line, 1706},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("银币市场价格数据载入错误:~w", [PriceErr]), none,
			     4096, 8, __Levelmarket_silver1706,
			     __Tracesmarket_silver1706, lager_event,
			     __Pidmarket_silver1706);
	    _ -> ok
	  end,
	  false;
      PriceList ->
	  ok = dets:insert(market_silver_price_tab, PriceList),
	  true = ets:insert(market_silver_price_tab, PriceList),
	  ok
    end.

silver_shop_var() ->
    FunShop = fun (Shop, Acc) ->
		      case market_ver:silver_shop_ver(Shop) of
			{ok, NShop = #market_silver_shop{}} -> [NShop | Acc];
			{false, _Msg} -> [Shop | Acc]
		      end
	      end,
    case dets:foldl(FunShop, [], market_silver_shop_tab) of
      {error, ShopErr} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_silver1725, _,
	     {__Levelmarket_silver1725, __Tracesmarket_silver1725}}
		when __Levelmarket_silver1725 band 8 /= 0 orelse
		       __Tracesmarket_silver1725 /= [] ->
		lager:do_log(error,
			     [{module, market_silver},
			      {function, silver_shop_var}, {line, 1725},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("银币市场摊位数据载入错误:~w", [ShopErr]), none,
			     4096, 8, __Levelmarket_silver1725,
			     __Tracesmarket_silver1725, lager_event,
			     __Pidmarket_silver1725);
	    _ -> ok
	  end,
	  false;
      ShopList ->
	  ok = dets:insert(market_silver_shop_tab, ShopList),
	  true = ets:insert(market_silver_shop_tab, ShopList),
	  ok
    end.

reload_data() ->
    Now = date:unixtime(),
    {Date, _Time} = date:seconds_to_datetime(Now),
    CfgItems = market_silver_data:get_all_items(),
    ItemList = ets:tab2list(market_silver_price_tab),
    {AddItems, DelItems} = reload_data(ItemList, CfgItems,
				       Date, [], [], []),
    [delete(market_silver_price_tab, Id) || Id <- DelItems],
    save(market_silver_price_tab, AddItems),
    garbage_collect(),
    ok.

reload_data([], CfgItems, _Date, UpdateItems, DelItems,
	    PriceChain) ->
    AddItems = [#market_silver_price{item_base_id =
					 ItemBaseId,
				     price = Price}
		|| #market_silver_item_data{base_id = ItemBaseId,
					    def_price = Price}
		       <- CfgItems],
    NewUpdateItems = AddItems ++ UpdateItems,
    NewItems = reload_price(PriceChain, NewUpdateItems,
			    CfgItems),
    {NewItems, DelItems};
reload_data([PriceRec =
		 #market_silver_price{item_base_id = ItemBaseId,
				      sellers = Sellers, price = _Price}
	     | Rest],
	    CfgItems, Date, UpdateItems, DelItems, PriceChain) ->
    case lists:keyfind(ItemBaseId,
		       #market_silver_item_data.base_id, CfgItems)
	of
      Data = #market_silver_item_data{update_time = Date,
				      def_price = DefPrice, group = Group} ->
	  UpdatePriceRec = PriceRec#market_silver_price{price =
							    DefPrice,
							deal_price = []},
	  NewPriceRec = fix_price(UpdatePriceRec),
	  NewPriceChain = case Group > 0 of
			    true ->
				case lists:keyfind(Group, 1, PriceChain) of
				  {_, List} ->
				      NewList = [Data | List],
				      DelPriceChan = lists:keydelete(Group, 1,
								     PriceChain),
				      [{Group, NewList} | DelPriceChan];
				  _ -> [{Group, [Data]} | PriceChain]
				end;
			    _ -> PriceChain
			  end,
	  NewCfgItems = lists:keydelete(ItemBaseId,
					#market_silver_item_data.base_id,
					CfgItems),
	  reload_data(Rest, NewCfgItems, Date,
		      [NewPriceRec | UpdateItems], DelItems, NewPriceChain);
      #market_silver_item_data{} ->
	  NewCfgItems = lists:keydelete(ItemBaseId,
					#market_silver_item_data.base_id,
					CfgItems),
	  NewPriceRec = fix_price(PriceRec),
	  reload_data(Rest, NewCfgItems, Date,
		      [NewPriceRec | UpdateItems], DelItems, PriceChain);
      false ->
	  reload_cells(Sellers),
	  reload_data(Rest, CfgItems, Date, UpdateItems,
		      [ItemBaseId | DelItems], PriceChain)
    end.

reload_price([], Update, _Cfg) -> Update;
reload_price([{_, List} | Rest], Update, Cfg) ->
    SortList =
	lists:keysort(#market_silver_item_data.group_id, List),
    NewUpdate = do_reload_price(SortList, Update, Cfg),
    reload_price(Rest, NewUpdate, Cfg).

do_reload_price([], Update, _Cfg) -> Update;
do_reload_price([#market_silver_item_data{pre_base_id =
					      0}
		 | Rest],
		Update, Cfg) ->
    do_reload_price(Rest, Update, Cfg);
do_reload_price([Data = #market_silver_item_data{base_id
						     = BaseId}
		 | Rest],
		Update, Cfg) ->
    NewUpdate = case calc_chain_price(Data, Update, Cfg) of
		  {ok, NewPriceRec} ->
		      lists:keystore(BaseId,
				     #market_silver_price.item_base_id, Update,
				     NewPriceRec);
		  _ -> Update
		end,
    do_reload_price(Rest, NewUpdate, Cfg).

recalc_chain_price([], _Date, _WorldLev, _State, Acc) ->
    Acc;
recalc_chain_price([{_, PriceList, DataList} | Rest],
		   Date, WorldLev, State, Acc) ->
    SortList =
	lists:keysort(#market_silver_item_data.group_id,
		      DataList),
    NewPriceList = do_recalc_chain_price(SortList, Date,
					 WorldLev, State, PriceList, DataList),
    recalc_chain_price(Rest, Date, WorldLev, State,
		       NewPriceList ++ Acc).

do_recalc_chain_price([], _Date, _WorldLev, _State,
		      Update, _Cfg) ->
    Update;
do_recalc_chain_price([Data =
			   #market_silver_item_data{pre_base_id = 0,
						    base_id = BaseId}
		       | Rest],
		      Date, WorldLev, State, Update, Cfg) ->
    NewUpdate = case lists:keyfind(BaseId,
				   #market_silver_price.item_base_id, Update)
		    of
		  PriceRec = #market_silver_price{} ->
		      NewPrice = calc_base_price(PriceRec, Data, WorldLev,
						 State, Date),
		      NewPriceRec = PriceRec#market_silver_price{price =
								     NewPrice,
								 deal_price =
								     []},
		      lists:keystore(BaseId,
				     #market_silver_price.item_base_id, Update,
				     NewPriceRec);
		  _ -> Update
		end,
    do_recalc_chain_price(Rest, Date, WorldLev, State,
			  NewUpdate, Cfg);
do_recalc_chain_price([Data =
			   #market_silver_item_data{base_id = BaseId}
		       | Rest],
		      Date, WorldLev, State, Update, Cfg) ->
    NewUpdate = case calc_chain_price(Data, Update, Cfg) of
		  {ok, NPriceRec} ->
		      NewPrice = calc_base_price(NPriceRec, Data, WorldLev,
						 State, Date),
		      NewPriceRec = NPriceRec#market_silver_price{price =
								      NewPrice,
								  deal_price =
								      []},
		      lists:keystore(BaseId,
				     #market_silver_price.item_base_id, Update,
				     NewPriceRec);
		  _ -> Update
		end,
    do_recalc_chain_price(Rest, Date, WorldLev, State,
			  NewUpdate, Cfg).

calc_chain_price(Data =
		     #market_silver_item_data{pre_base_id = PreBaseId,
					      pre_pcnt = PrePcnt,
					      base_id = BaseId,
					      chain_type = ChainType},
		 Update, Cfg) ->
    case lists:keyfind(BaseId,
		       #market_silver_price.item_base_id, Update)
	of
      PriceRec = #market_silver_price{} ->
	  case get_item_pre_price(PreBaseId, Update, Cfg) of
	    {ok, PrePrice} ->
		NewPriceRec = case ChainType of
				1 ->
				    calc_price_mutil_pre(Data, PriceRec,
							 PrePrice, PrePcnt);
				_ ->
				    calc_price_ge_pre(Data, PriceRec, PrePrice,
						      PrePcnt)
			      end,
		{ok, NewPriceRec};
	    _ -> false
	  end;
      _ -> false
    end.

get_item_pre_price(PreBaseId, Update, Cfg) ->
    case lists:keyfind(PreBaseId,
		       #market_silver_price.item_base_id, Update)
	of
      #market_silver_price{price = TmpPrePrice} ->
	  {ok, TmpPrePrice};
      _ ->
	  case catch ets:lookup(market_silver_price_tab,
				PreBaseId)
	      of
	    [#market_silver_price{price = TmpPrePrice}] ->
		{ok, TmpPrePrice};
	    _ ->
		case lists:keyfind(PreBaseId,
				   #market_silver_item_data.base_id, Cfg)
		    of
		  #market_silver_item_data{def_price = TmpPrePrice} ->
		      {ok, TmpPrePrice};
		  _ -> false
		end
	  end
    end.

calc_price_ge_pre(#market_silver_item_data{min_price =
					       MinPrice,
					   def_price = DefPrice,
					   max_price = MaxPrice,
					   base_id = _BaseId},
		  PriceRec = #market_silver_price{price = CurPrice},
		  PrePrice, Pcnt) ->
    CalcPrice = util:floor(PrePrice * Pcnt / 1000),
    CompPrice1 = erlang:max(MinPrice, DefPrice),
    CompPrice2 = erlang:max(CompPrice1, CurPrice),
    CompPrice3 = erlang:max(CompPrice2, CalcPrice),
    Price = erlang:min(CompPrice3, MaxPrice),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_silver1883, _,
       {__Levelmarket_silver1883, __Tracesmarket_silver1883}}
	  when __Levelmarket_silver1883 band 128 /= 0 orelse
		 __Tracesmarket_silver1883 /= [] ->
	  lager:do_log(debug,
		       [{module, market_silver}, {function, calc_price_ge_pre},
			{line, 1883}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("银币市场重新计算联动价格（不低于前置），BaseId:~w, PrePrice:~w, "
				     "CurPrice:~w, CalcPrice:~w, Pcnt:~w, "
				     "Price:~w",
				     [_BaseId, PrePrice, CurPrice, CalcPrice,
				      Pcnt, Price]),
		       none, 4096, 128, __Levelmarket_silver1883,
		       __Tracesmarket_silver1883, lager_event,
		       __Pidmarket_silver1883);
      _ -> ok
    end,
    PriceRec#market_silver_price{price = Price}.

calc_price_mutil_pre(#market_silver_item_data{base_id =
						  _BaseId},
		     PriceRec, PrePrice, Pcnt) ->
    Price = util:floor(PrePrice * Pcnt / 1000),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_silver1890, _,
       {__Levelmarket_silver1890, __Tracesmarket_silver1890}}
	  when __Levelmarket_silver1890 band 128 /= 0 orelse
		 __Tracesmarket_silver1890 /= [] ->
	  lager:do_log(debug,
		       [{module, market_silver},
			{function, calc_price_mutil_pre}, {line, 1890},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("银币市场重新计算联动价格（前置倍数），BaseId:~w, PrePrice:~w, "
				     "Pcnt:~w, Price:~w",
				     [_BaseId, PrePrice, Pcnt, Price]),
		       none, 4096, 128, __Levelmarket_silver1890,
		       __Tracesmarket_silver1890, lager_event,
		       __Pidmarket_silver1890);
      _ -> ok
    end,
    PriceRec#market_silver_price{price = Price}.

reload_cells([]) -> ok;
reload_cells([{Rid, CellId} | Rest]) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [Shop = #market_silver_shop{cells = Cells}] ->
	  case lists:keytake(CellId,
			     #market_silver_shop_cell.cell_id, Cells)
	      of
	    {value, Cell, RestCells} ->
		NewCell = Cell#market_silver_shop_cell{status = 2},
		NewCells = [NewCell | RestCells],
		save(market_silver_shop_tab,
		     Shop#market_silver_shop{cells = NewCells}),
		reload_cells(Rest);
	    false -> reload_cells(Rest)
	  end;
      _ -> reload_cells(Rest)
    end.

reset_price(State) ->
    Now = date:unixtime(),
    {Date, _Time} = date:seconds_to_datetime(Now),
    PriceList = ets:tab2list(market_silver_price_tab),
    WorldLev = 0,
    NewList = reset_price(PriceList, Date, WorldLev, State,
			  [], []),
    ResetList = [SilverPrice#market_silver_price{day_auto =
						     0,
						 day_recover = 0}
		 || SilverPrice <- NewList],
    save(market_silver_price_tab, ResetList),
    ok.

reset_normal_price(SilverPrice =
		       #market_silver_price{item_base_id = ItemBaseId},
		   WorldLev, State, Date) ->
    case market_silver_data:get(ItemBaseId) of
      Data = #market_silver_item_data{group = Group}
	  when Group > 0 ->
	  {chain, Data};
      Data = #market_silver_item_data{} ->
	  NewPrice = calc_base_price(SilverPrice, Data, WorldLev,
				     State, Date),
	  NSilverPrice = SilverPrice#market_silver_price{price =
							     NewPrice,
							 deal_price = []},
	  {normal, NSilverPrice};
      _False -> false
    end.

reset_price([], Date, WorldLev, State, NormalAcc,
	    ChainAcc) ->
    NewChainPrice = recalc_chain_price(ChainAcc, Date,
				       WorldLev, State, []),
    NewChainPrice ++ NormalAcc;
reset_price([Price | Rest], Date, WorldLev, State,
	    NormalAcc, ChainAcc) ->
    case reset_normal_price(Price, WorldLev, State, Date) of
      {normal, NewPrice} ->
	  NewNormalAcc = [NewPrice | NormalAcc],
	  reset_price(Rest, Date, WorldLev, State, NewNormalAcc,
		      ChainAcc);
      {chain,
       Data = #market_silver_item_data{group = Group}} ->
	  NewChainAcc = case lists:keyfind(Group, 1, ChainAcc) of
			  {_, PriceList, List} ->
			      NewList = [Data | List],
			      NewPriceList = [Price | PriceList],
			      DelChainAcc = lists:keydelete(Group, 1, ChainAcc),
			      [{Group, NewPriceList, NewList} | DelChainAcc];
			  _ -> [{Group, [Price], [Data]} | ChainAcc]
			end,
	  reset_price(Rest, Date, WorldLev, State, NormalAcc,
		      NewChainAcc);
      _ ->
	  reset_price(Rest, Date, WorldLev, State, NormalAcc,
		      ChainAcc)
    end.

calc_base_price(#market_silver_price{price = Price,
				     deal_price = DealList,
				     day_recover = _DayRecover,
				     day_auto = _DayAuto,
				     item_base_id = BaseId},
		#market_silver_item_data{min_price = MinPrice,
					 max_price = MaxPrice, base_id = BaseId,
					 update_time = UpdateTime,
					 def_price = DefPrice,
					 open_lev = WorldLevCfg},
		WorldLev, #state{}, Date) ->
    {RtnPrice, _RtnNum, _RtnAvgPrice} = case UpdateTime =:=
					       Date
					    of
					  true -> {DefPrice, 0, 0};
					  false ->
					      Flag = WorldLev >= WorldLevCfg,
					      Num = length(DealList),
					      if Num < 10 andalso Flag ->
						     Tag1 = util:floor(DefPrice
									 *
									 9.0e-1),
						     NewPrice = case Tag1 >
								       Price
								    of
								  true -> Price;
								  false ->
								      util:floor(Price
										   *
										   9.7999999999999998e-1)
								end,
						     {NewPrice, Num, 0};
						 Num >= 10 andalso Flag ->
						     AvgPrice =
							 list_avg(DealList),
						     {_, LimitUpPrice} =
							 market_silver_data:get_recover_upprice(BaseId),
						     Tag1 = util:floor(Price *
									 LimitUpPrice
									 / 100),
						     BasePrice = if AvgPrice >
								      Tag1 ->
									Price +
									  (AvgPrice
									     -
									     Tag1)
									    *
									    2.5e-1;
								    AvgPrice <
								      Price ->
									Price -
									  (Price
									     -
									     AvgPrice)
									    *
									    5.0e-1;
								    true ->
									Price *
									  9.7999999999999998e-1
								 end,
						     NewPrice =
							 erlang:min(MaxPrice,
								    erlang:max(MinPrice,
									       util:floor(BasePrice))),
						     {NewPrice, Num, AvgPrice};
						 true -> {Price, Num, 0}
					      end
					end,
    Price.

do_save_take_off(Rid, {CellId}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [Shop = #market_silver_shop{cells = Cells,
				  free_ids = FreeIds}] ->
	  case lists:keytake(CellId,
			     #market_silver_shop_cell.cell_id, Cells)
	      of
	    {value, #market_silver_shop_cell{status = 1},
	     _RestCells} ->
		{false, 1};
	    {value,
	     #market_silver_shop_cell{status = Status,
				      item_base_id = ItemBaseId, num = Num},
	     RestCells}
		when Status =:= 0 orelse
		       Status =:= 6 orelse Status =:= 2 ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmarket_silver2030, _,
		   {__Levelmarket_silver2030, __Tracesmarket_silver2030}}
		      when __Levelmarket_silver2030 band 128 /= 0 orelse
			     __Tracesmarket_silver2030 /= [] ->
		      lager:do_log(debug,
				   [{module, market_silver},
				    {function, do_save_take_off}, {line, 2030},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("物品下架, Rid:~w, 位置ID:~w, 物品Id:~w, 数量:~w",
						 [Rid, CellId, ItemBaseId,
						  Num]),
				   none, 4096, 128, __Levelmarket_silver2030,
				   __Tracesmarket_silver2030, lager_event,
				   __Pidmarket_silver2030);
		  _ -> ok
		end,
		NewShop = Shop#market_silver_shop{cells = RestCells,
						  free_ids =
						      [CellId | FreeIds]},
		case catch ets:lookup(market_silver_price_tab,
				      ItemBaseId)
		    of
		  [PriceRec = #market_silver_price{sellers = Sellers}] ->
		      NewSellers = lists:delete({Rid, CellId}, Sellers),
		      save(market_silver_price_tab,
			   PriceRec#market_silver_price{sellers = NewSellers}),
		      save(market_silver_shop_tab, NewShop),
		      {ok, {ItemBaseId, Num}};
		  _ when Status =:= 2 ->
		      save(market_silver_shop_tab, NewShop),
		      {ok, {ItemBaseId, Num}};
		  _ -> false
		end;
	    false -> false
	  end;
      _ -> false
    end.

do_save_draw(Rid, {CellId}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [Shop = #market_silver_shop{cells = Cells,
				  free_ids = FreeIds}] ->
	  case lists:keytake(CellId,
			     #market_silver_shop_cell.cell_id, Cells)
	      of
	    {value,
	     _Cell = #market_silver_shop_cell{price = Price, num = 0,
					      sold_num = SoldNum,
					      item_base_id = BaseId,
					      percent = Percent},
	     RestCells} ->
		NewShop = Shop#market_silver_shop{free_ids =
						      [CellId | FreeIds],
						  cells = RestCells},
		save(market_silver_shop_tab, NewShop),
		DrawItem = #market_silver_draw_item{base_id = BaseId,
						    num = SoldNum,
						    pcnt = Percent,
						    price = Price},
		{ok, DrawItem};
	    {value,
	     Cell = #market_silver_shop_cell{price = Price,
					     sold_num = SoldNum,
					     expiry = Expiry,
					     item_base_id = BaseId,
					     percent = Percent},
	     RestCells} ->
		Now = date:unixtime(),
		NewStatus = case Expiry < Now of
			      false -> 0;
			      true -> 6
			    end,
		NewCell = Cell#market_silver_shop_cell{sold_num = 0,
						       status = NewStatus},
		NewShop = Shop#market_silver_shop{cells =
						      [NewCell | RestCells]},
		save(market_silver_shop_tab, NewShop),
		DrawItem = #market_silver_draw_item{base_id = BaseId,
						    num = SoldNum,
						    pcnt = Percent,
						    price = Price},
		{ok, DrawItem};
	    _False -> false
	  end;
      _ -> false
    end.

do_save_open_cell(Rid) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [Shop = #market_silver_shop{free_ids = FreeIds,
				  max_cell_id = MaxId}] ->
	  case MaxId <
		 market_silver_data:get_const(silvermarket_boothnum)
	      of
	    true ->
		NewMaxId = MaxId + 1,
		NewShop = Shop#market_silver_shop{free_ids =
						      [NewMaxId | FreeIds],
						  max_cell_id = NewMaxId},
		save(market_silver_shop_tab, NewShop),
		ok;
	    _ -> false
	  end;
      _ -> false
    end.

server_buy(_Rid, {CellId, SellerId, PurchsNum}) ->
    case catch ets:lookup(market_silver_shop_tab, SellerId)
	of
      [Shop = #market_silver_shop{cells = Cells,
				  pid = SellerPid}] ->
	  case lists:keytake(CellId,
			     #market_silver_shop_cell.cell_id, Cells)
	      of
	    {value,
	     Cell = #market_silver_shop_cell{status = Status,
					     num = Num, sold_num = SouldNum},
	     RestCells}
		when Num >= PurchsNum andalso
		       (Status =:= 0 orelse Status =:= 5) ->
		RestNum = Num - PurchsNum,
		NewSoldNum = SouldNum + PurchsNum,
		NewStatus = case RestNum =:= 0 of
			      true -> 1;
			      false -> 5
			    end,
		NewCell = Cell#market_silver_shop_cell{status =
							   NewStatus,
						       num = RestNum,
						       sold_num = NewSoldNum},
		NewShop = Shop#market_silver_shop{cells =
						      [NewCell | RestCells]},
		case save(market_silver_shop_tab, NewShop) of
		  true -> server_buy_price(NewCell, SellerId, SellerPid);
		  false -> false
		end;
	    _ -> false
	  end;
      _ -> false
    end.

server_buy_price(#market_silver_shop_cell{cell_id =
					      CellId,
					  item_base_id = ItemBaseId,
					  status = Status, price = Price,
					  num = Num},
		 SellerId, Pid) ->
    case catch ets:lookup(market_silver_price_tab,
			  ItemBaseId)
	of
      [PriceRec = #market_silver_price{deal_price = Deal,
				       sellers = Sellers}] ->
	  NewSellers = case Status of
			 1 -> lists:delete({SellerId, CellId}, Sellers);
			 5 -> Sellers
		       end,
	  case save(market_silver_price_tab,
		    PriceRec#market_silver_price{deal_price =
						     [Price | Deal],
						 sellers = NewSellers})
	      of
	    true ->
		case is_pid(Pid) of
		  true ->
		      role:apply(async, Pid,
				 {market_silver, push_ico_mark, []});
		  false -> ok
		end,
		{ok, Num};
	    false -> false
	  end;
      _ -> false
    end.

do_save_on_sale(RoleId,
		{CellId, Price, Num, Percent}) ->
    case catch ets:lookup(market_silver_shop_tab, RoleId) of
      [Shop = #market_silver_shop{cells = Cells}] ->
	  case lists:keytake(CellId,
			     #market_silver_shop_cell.cell_id, Cells)
	      of
	    {value,
	     Cell = #market_silver_shop_cell{item_base_id =
						 ItemBaseId},
	     RestCells} ->
		Now = date:unixtime(),
		Expiry = Now + 24 * 3600,
		SaleTime = calc_sale_time(Now),
		SystemPrice = calc_system_price(ItemBaseId, Price),
		NewCell = Cell#market_silver_shop_cell{price = Price,
						       status = 0, num = Num,
						       sold_num = 0,
						       expiry = Expiry,
						       percent = Percent,
						       sale_time = SaleTime,
						       system_price =
							   SystemPrice},
		NewShop = Shop#market_silver_shop{cells =
						      [NewCell | RestCells]},
		case catch ets:lookup(market_silver_price_tab,
				      ItemBaseId)
		    of
		  [PriceRec = #market_silver_price{sellers = Sellers}] ->
		      DelSellers = lists:delete({RoleId, CellId}, Sellers),
		      NewSellers = [{RoleId, CellId} | DelSellers],
		      MaxStepPrice = update_max_step(PriceRec, NewCell),
		      NewPriceRec = MaxStepPrice#market_silver_price{sellers =
									 NewSellers},
		      save(market_silver_shop_tab, NewShop),
		      save(market_silver_price_tab, NewPriceRec),
		      ok;
		  _ -> false
		end;
	    false -> false
	  end;
      _Err -> false
    end;
do_save_on_sale(RoleId,
		{BaseId, Num, Price, Percent, CellId, Attrs}) ->
    case catch ets:lookup(market_silver_shop_tab, RoleId) of
      [Shop = #market_silver_shop{free_ids = FreeIds,
				  cells = Cells}] ->
	  RestFreeIds = lists:delete(CellId, FreeIds),
	  Now = date:unixtime(),
	  Expiry = Now + 24 * 3600,
	  SaleTime = calc_sale_time(Now),
	  SystemPrice = calc_system_price(BaseId, Price),
	  NewCell = #market_silver_shop_cell{cell_id = CellId,
					     item_base_id = BaseId, num = Num,
					     sale_time = SaleTime,
					     price = Price, expiry = Expiry,
					     item_attrs = Attrs,
					     percent = Percent,
					     system_price = SystemPrice},
	  NewShop = Shop#market_silver_shop{free_ids =
						RestFreeIds,
					    cells = [NewCell | Cells]},
	  case catch ets:lookup(market_silver_price_tab, BaseId)
	      of
	    [PriceRec = #market_silver_price{sellers = Sellers}] ->
		NewSellers = [{RoleId, CellId} | Sellers],
		MaxStepPrice = update_max_step(PriceRec, NewCell),
		NewPriceRec = MaxStepPrice#market_silver_price{sellers =
								   NewSellers},
		save(market_silver_shop_tab, NewShop),
		save(market_silver_price_tab, NewPriceRec),
		ok;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmarket_silver2199, _,
		   {__Levelmarket_silver2199, __Tracesmarket_silver2199}}
		      when __Levelmarket_silver2199 band 128 /= 0 orelse
			     __Tracesmarket_silver2199 /= [] ->
		      lager:do_log(debug,
				   [{module, market_silver},
				    {function, do_save_on_sale}, {line, 2199},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("查询物品[~w]价格报错", [BaseId]),
				   none, 4096, 128, __Levelmarket_silver2199,
				   __Tracesmarket_silver2199, lager_event,
				   __Pidmarket_silver2199);
		  _ -> ok
		end,
		false
	  end;
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmarket_silver2203, _,
	     {__Levelmarket_silver2203, __Tracesmarket_silver2203}}
		when __Levelmarket_silver2203 band 128 /= 0 orelse
		       __Tracesmarket_silver2203 /= [] ->
		lager:do_log(debug,
			     [{module, market_silver},
			      {function, do_save_on_sale}, {line, 2203},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("查询摊位[~w]信息报错, ~w", [RoleId, _Err]),
			     none, 4096, 128, __Levelmarket_silver2203,
			     __Tracesmarket_silver2203, lager_event,
			     __Pidmarket_silver2203);
	    _ -> ok
	  end,
	  false
    end.

do_save_one_click(Rid, {1}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [Shop = #market_silver_shop{cells = Cells}] ->
	  Now = date:unixtime(),
	  {PriceRecList, NewCells, RepeatCells} =
	      one_click_on_sale(Cells, Rid, Now, [], [], []),
	  NewShop = Shop#market_silver_shop{cells = NewCells},
	  case PriceRecList of
	    [_ | _] ->
		save(market_silver_shop_tab, NewShop),
		save(market_silver_price_tab, PriceRecList),
		{ok, RepeatCells};
	    _ -> save(market_silver_shop_tab, NewShop), {ok, false}
	  end;
      _Err -> false
    end;
do_save_one_click(Rid, {2}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [Shop = #market_silver_shop{cells = Cells,
				  free_ids = FreeIds}] ->
	  Now = date:unixtime(),
	  {NewCells, NewFreeIds, GainAcc} = one_click_draw(Cells,
							   Now, Rid, FreeIds,
							   [], []),
	  NewShop = Shop#market_silver_shop{cells = NewCells,
					    free_ids = NewFreeIds},
	  save(market_silver_shop_tab, NewShop),
	  {ok, GainAcc};
      _ -> false
    end.

one_click_on_sale([], _Rid, _Now, PriceRecList, Cells,
		  RepeatCells) ->
    {PriceRecList, Cells, RepeatCells};
one_click_on_sale([Cell =
		       #market_silver_shop_cell{status = Status,
						expiry = Expiry,
						item_base_id = ItemBaseId,
						cell_id = CellId}
		   | Rest],
		  Rid, Now, PriceRecList, Cells, RepeatCells)
    when Status =:= 6 orelse
	   Status =:= 0 andalso Now >= Expiry ->
    case catch ets:lookup(market_silver_price_tab,
			  ItemBaseId)
	of
      [PriceRec = #market_silver_price{sellers = Sellers,
				       price = Price}] ->
	  NewCell = Cell#market_silver_shop_cell{expiry =
						     Now + 24 * 3600,
						 price = Price, status = 0},
	  MaxStepPrice = update_max_step(PriceRec, NewCell),
	  NewPriceRec = MaxStepPrice#market_silver_price{sellers =
							     [{Rid, CellId}
							      | lists:delete({Rid,
									      CellId},
									     Sellers)]},
	  one_click_on_sale(Rest, Rid, Now,
			    [NewPriceRec | PriceRecList], [NewCell | Cells],
			    [NewCell | RepeatCells]);
      _ ->
	  one_click_on_sale(Rest, Rid, Now, PriceRecList,
			    [Cell | Cells], RepeatCells)
    end;
one_click_on_sale([Cell | Rest], Rid, Now, PriceRecList,
		  Cells, RepeatCells) ->
    one_click_on_sale(Rest, Rid, Now, PriceRecList,
		      [Cell | Cells], RepeatCells).

one_click_draw([], _Now, _Rid, FreeIds, Cells, Acc) ->
    {Cells, FreeIds, Acc};
one_click_draw([Cell = #market_silver_shop_cell{sold_num
						    = SoldNum,
						num = Num, cell_id = CellId,
						price = Price, expiry = Expiry,
						item_base_id = BaseId,
						percent = Pcnt,
						item_attrs = ItemAttrs}
		| Rest],
	       Now, Rid, FreeIds, Cells, Acc)
    when SoldNum > 0 ->
    {NewFreeIds, NewCells} = case Num =:= 0 of
			       true ->
				   case catch
					  ets:lookup(market_silver_price_tab,
						     BaseId)
				       of
				     [Price = #market_silver_price{sellers =
								       Sellers}] ->
					 NewSellers = lists:delete({Rid,
								    CellId},
								   Sellers),
					 NewPrice =
					     Price#market_silver_price{sellers =
									   NewSellers},
					 save(market_silver_price_tab,
					      NewPrice),
					 ok;
				     _ -> ok
				   end,
				   {[CellId | FreeIds], Cells};
			       false ->
				   NewStatus = case Expiry < Now of
						 false -> 0;
						 true -> 6
					       end,
				   NewCell =
				       Cell#market_silver_shop_cell{sold_num =
									0,
								    status =
									NewStatus},
				   {FreeIds, [NewCell | Cells]}
			     end,
    DrawItem = #market_silver_draw_item{base_id = BaseId,
					num = SoldNum, price = Price,
					pcnt = Pcnt, attrs = ItemAttrs,
					cell_id = CellId, rest = Num},
    NewAcc = [DrawItem | Acc],
    one_click_draw(Rest, Now, Rid, NewFreeIds, NewCells,
		   NewAcc);
one_click_draw([Cell | Rest], Now, Rid, FreeIds, Cells,
	       Acc) ->
    one_click_draw(Rest, Now, Rid, FreeIds, [Cell | Cells],
		   Acc).

-spec server_recover_timeout(BaseId, Num,
			     Source) -> true | false when BaseId ::
							      pos_integer(),
							  Num :: pos_integer(),
							  Source :: auto |
								    timeout.

server_record_recover_timeout(BaseId, Num, Source) ->
    case catch ets:lookup(market_silver_price_tab, BaseId)
	of
      [SilverPrice = #market_silver_price{recover_num =
					      CurNum,
					  day_auto = DayAuto}] ->
	  NSilverPrice = case CurNum < 50 of
			   true ->
			       Max = erlang:min(CurNum + Num, 50),
			       SilverPrice#market_silver_price{recover_num =
								   Max};
			   false -> SilverPrice
			 end,
	  NDayAuto = case Source of
		       auto -> DayAuto + Num;
		       _ -> DayAuto
		     end,
	  NewPrice = NSilverPrice#market_silver_price{day_auto =
							  NDayAuto},
	  save(market_silver_price_tab, NewPrice);
      _False -> false
    end.

server_recover_timeout(Rid, Pid, CellIds) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [Shop = #market_silver_shop{cells = Cells,
				  pid = ShopPid}] ->
	  IsPush = 0,
	  case do_server_recover_timeout(CellIds, Cells, Rid,
					 IsPush)
	      of
	    {0, _} ->
		case ShopPid =:= Pid of
		  true -> false;
		  false ->
		      save(market_silver_shop_tab,
			   Shop#market_silver_shop{pid = Pid})
		end;
	    {1, NewCells} ->
		NewShop = Shop#market_silver_shop{cells = NewCells,
						  pid = Pid},
		role:apply(async, Pid,
			   {market_silver, callback_recover_timeout,
			    [NewShop]}),
		save(market_silver_shop_tab, NewShop)
	  end;
      _False -> false
    end.

do_server_recover_timeout([], Cells, _Rid, IsPush) ->
    {IsPush, Cells};
do_server_recover_timeout([CellId | Rest], Cells, Rid,
			  IsPush) ->
    case server_recover_cell(CellId, Cells, Rid) of
      {ok, _, RecoverPrice, NewCell} ->
	  AvgPrice = update_avg_step(RecoverPrice, NewCell),
	  save(market_silver_price_tab, AvgPrice),
	  NewCells = lists:keystore(CellId,
				    #market_silver_shop_cell.cell_id, Cells,
				    NewCell),
	  do_server_recover_timeout(Rest, NewCells, Rid, 1);
      false ->
	  do_server_recover_timeout(Rest, Cells, Rid, IsPush)
    end.

update_avg_step(SPrice =
		    #market_silver_price{item_base_id = ItemBaseId,
					 ext = Ext},
		#market_silver_shop_cell{item_attrs = Attrs}) ->
    case market_silver_data:get(ItemBaseId) of
      #market_silver_item_data{type = _Type, step = Step}
	  when Step > 0 ->
	  case lists:keyfind(1, 1, Attrs) of
	    {_, CellStep} ->
		{ok, AvgStep} = get_silver_price_ext(avg_step, SPrice,
						     Step),
		NewAvgStep = (AvgStep + CellStep) div 2,
		NewExt = lists:keystore(avg_step, 1, Ext,
					{avg_step, NewAvgStep}),
		SPrice#market_silver_price{ext = NewExt};
	    _ -> SPrice
	  end;
      _ -> SPrice
    end.

update_max_step(SPrice =
		    #market_silver_price{item_base_id = _ItemBaseId,
					 ext = _Ext},
		#market_silver_shop_cell{item_attrs = _Attrs}) ->
    SPrice.

server_recover_cell(CellId, Cells, Rid) ->
    case lists:keyfind(CellId,
		       #market_silver_shop_cell.cell_id, Cells)
	of
      Cell = #market_silver_shop_cell{status = 6} ->
	  do_server_recover_cell(Rid, Cell);
      Cell = #market_silver_shop_cell{status = Status}
	  when Status =:= 0 orelse Status =:= 5 ->
	  do_server_recover_cell(Rid, Cell);
      _False -> false
    end.

do_server_recover_cell(SellerId,
		       Cell = #market_silver_shop_cell{item_base_id = BaseId,
						       num = Num,
						       sold_num = SoldNum,
						       cell_id = CellId}) ->
    LimitNum = erlang:min(Num, 5),
    case catch ets:lookup(market_silver_price_tab, BaseId)
	of
      [#market_silver_price{recover_num = 0}] -> false;
      [Price = #market_silver_price{recover_num = RequireNum,
				    day_recover = DayRecover,
				    sellers = Sellers}]
	  when LimitNum =< RequireNum ->
	  NDayRecover = DayRecover + LimitNum,
	  NRequireNum = RequireNum - LimitNum,
	  UpdatePrice = Price#market_silver_price{recover_num =
						      NRequireNum,
						  day_recover = NDayRecover},
	  {NewPrice, NewCell} = case Num > LimitNum of
				  true ->
				      NewSoldNum = SoldNum + LimitNum,
				      NewNum = Num - LimitNum,
				      UpdateCell =
					  Cell#market_silver_shop_cell{status =
									   5,
								       sold_num
									   =
									   NewSoldNum,
								       num =
									   NewNum},
				      {UpdatePrice, UpdateCell};
				  false ->
				      NewSoldNum = SoldNum + LimitNum,
				      UpdateCell =
					  Cell#market_silver_shop_cell{status =
									   1,
								       sold_num
									   =
									   NewSoldNum,
								       num = 0},
				      NewSellers = lists:delete({SellerId,
								 CellId},
								Sellers),
				      RtnPrice =
					  UpdatePrice#market_silver_price{sellers
									      =
									      NewSellers},
				      {RtnPrice, UpdateCell}
				end,
	  {ok, LimitNum, NewPrice, NewCell};
      [Price = #market_silver_price{recover_num = RequireNum,
				    day_recover = DayRecover}] ->
	  NewSoldNum = SoldNum + RequireNum,
	  NewNum = Num - RequireNum,
	  NDayRecover = DayRecover + RequireNum,
	  UpdatePrice = Price#market_silver_price{recover_num = 0,
						  day_recover = NDayRecover},
	  UpdateCell = Cell#market_silver_shop_cell{status = 5,
						    sold_num = NewSoldNum,
						    num = NewNum},
	  {ok, RequireNum, UpdatePrice, UpdateCell};
      _False -> false
    end.

reset_timer() ->
    Now = date:unixtime(),
    Time = date:unixtime({next_day, Now}),
    erlang:send_after((Time - Now) * 1000, self(), reset).

set_server_recover_timer() ->
    NextDiff = 10 * 60,
    erlang:send_after(NextDiff * 1000, self(),
		      server_recover).

clean(#state{reset_timer = TRef}) ->
    erlang:cancel_timer(TRef),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_silver2450, _,
       {__Levelmarket_silver2450, __Tracesmarket_silver2450}}
	  when __Levelmarket_silver2450 band 128 /= 0 orelse
		 __Tracesmarket_silver2450 /= [] ->
	  lager:do_log(debug,
		       [{module, market_silver}, {function, clean},
			{line, 2450}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "清理银币市场数据", none, 4096, 128, __Levelmarket_silver2450,
		       __Tracesmarket_silver2450, lager_event,
		       __Pidmarket_silver2450);
      _ -> ok
    end,
    util:close_dets(market_silver_shop_tab),
    util:close_dets(market_silver_price_tab).

shuffle(L) ->
    List1 = [{rand:uniform(), X} || X <- L],
    List2 = lists:keysort(1, List1),
    [E || {_, E} <- List2].

get_cell(CellId, #role{id = Rid}) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [#market_silver_shop{cells = Cells}] ->
	  case lists:keyfind(CellId,
			     #market_silver_shop_cell.cell_id, Cells)
	      of
	    Cell = #market_silver_shop_cell{} -> {ok, Cell};
	    false -> false
	  end;
      _False -> false
    end.

server_recover() ->
    Now = date:unixtime(),
    F = fun (#market_silver_price{sellers =
				      Sellers = [_ | _],
				  recover_num = Num},
	     Acc)
		when Num > 0 ->
		merge_sellers(Sellers, Acc);
	    (_H, Acc) -> Acc
	end,
    Rids = ets:foldl(F, [], market_silver_price_tab),
    Shops = recover_shops(Rids, Now, []),
    ShuffleShops = shuffle(Shops),
    do_server_recover(ShuffleShops, Now, []).

merge_sellers([], Acc) -> Acc;
merge_sellers([{Rid, _} | Rest], Acc) ->
    NewAcc = case lists:member(Rid, Acc) of
	       true -> Acc;
	       _ -> [Rid | Acc]
	     end,
    merge_sellers(Rest, NewAcc).

recover_shops([], _Now, Shops) -> Shops;
recover_shops([Rid | Rest], Now, Shops) ->
    case catch ets:lookup(market_silver_shop_tab, Rid) of
      [Shop = #market_silver_shop{pid = Pid}]
	  when is_pid(Pid) ->
	  recover_shops(Rest, Now, [Shop | Shops]);
      [Shop = #market_silver_shop{last_logout = LastLogout}]
	  when Now - LastLogout < 86400 ->
	  recover_shops(Rest, Now, [Shop | Shops]);
      _ -> recover_shops(Rest, Now, Shops)
    end.

do_server_recover([], _Now, ShopList) ->
    [role:apply(async, Pid,
		{market_silver, push_ico_mark, []})
     || #market_silver_shop{pid = Pid} <- ShopList,
	is_pid(Pid)],
    save(market_silver_shop_tab, ShopList),
    {ok, ShopList};
do_server_recover([Shop = #market_silver_shop{cells =
						  Cells,
					      rid = Rid}
		   | Rest],
		  Now, ShopList) ->
    RecoverCells = recover_cell(Cells, Now, []),
    CellIds = [CellId
	       || #market_silver_shop_cell{cell_id = CellId}
		      <- RecoverCells],
    case do_server_recover_timeout(CellIds, Cells, Rid, 0)
	of
      {0, _} -> do_server_recover(Rest, Now, ShopList);
      {1, NewCells} ->
	  NewShop = Shop#market_silver_shop{cells = NewCells},
	  do_server_recover(Rest, Now, [NewShop | ShopList])
    end.

server_auto_buy_seller([]) -> ok;
server_auto_buy_seller([{BaseId, Num} | Rest]) ->
    case catch ets:lookup(market_silver_price_tab, BaseId)
	of
      [#market_silver_price{sellers = []}] ->
	  server_record_recover_timeout(BaseId, Num, auto),
	  server_auto_buy_seller(Rest);
      [#market_silver_price{sellers = Sellers}] ->
	  server_auto_buy_seller(Num, Sellers, BaseId),
	  server_auto_buy_seller(Rest);
      _ -> server_auto_buy_seller(Rest)
    end;
server_auto_buy_seller([_ | Rest]) ->
    server_auto_buy_seller(Rest);
server_auto_buy_seller(_) -> false.

server_auto_buy_seller(0, _Sellers, _BaseId) -> ok;
server_auto_buy_seller(Num, [], BaseId) ->
    server_record_recover_timeout(BaseId, Num, auto), ok;
server_auto_buy_seller(Num, [{SellerId, CellId} | Rest],
		       BaseId) ->
    case catch ets:lookup(market_silver_shop_tab, SellerId)
	of
      [Shop = #market_silver_shop{cells = Cells}] ->
	  case server_recover_cell(CellId, Cells, SellerId) of
	    {ok, RecoverNum,
	     SilverPrice = #market_silver_price{day_auto = DayAuto},
	     NewCell} ->
		NewCells = lists:keystore(CellId,
					  #market_silver_shop_cell.cell_id,
					  Cells, NewCell),
		NewNum = erlang:max(Num - RecoverNum, 0),
		NewDayAuto = DayAuto + RecoverNum,
		NSilverPrice = SilverPrice#market_silver_price{day_auto
								   =
								   NewDayAuto},
		save(market_silver_price_tab, NSilverPrice),
		save(market_silver_shop_tab,
		     Shop#market_silver_shop{cells = NewCells}),
		server_auto_buy_seller(NewNum, Rest, BaseId);
	    _False -> server_auto_buy_seller(Num, Rest, BaseId)
	  end;
      _False -> server_auto_buy_seller(Num, Rest, BaseId)
    end.

calc_sale_time(Now) ->
    Rand = util:rand(5, 10), Now + Rand * 60.

calc_system_price(Price) ->
    Rand = util:rand(1, 10),
    case Rand >= 5 of
      true ->
	  Percent = (5 + Rand - 10) / 100,
	  util:ceil(Price * Percent) + Price;
      false ->
	  Percent = (5 - Rand) / 100,
	  Price - util:ceil(Price * Percent)
    end.

calc_system_price(ItemBaseId, Price) ->
    SystemPrice = calc_system_price(Price),
    case market_silver_data:get(ItemBaseId) of
      #market_silver_item_data{min_price = Min,
			       max_price = Max} ->
	  erlang:min(Max, erlang:max(Min, SystemPrice));
      _ -> SystemPrice
    end.

fix_price(SPrice = #market_silver_price{item_base_id =
					    BaseId,
					sellers = Sellers}) ->
    NewSellers = del_dirty_sellers(Sellers, BaseId, []),
    SPrice#market_silver_price{sellers = NewSellers}.

del_dirty_sellers([], _BaseId, Sellers) -> Sellers;
del_dirty_sellers([{Rid, CellId} | Rest], BaseId,
		  Sellers) ->
    NewSellers = case catch
			ets:lookup(market_silver_shop_tab, Rid)
		     of
		   [#market_silver_shop{cells = Cells}] ->
		       case lists:keyfind(CellId,
					  #market_silver_shop_cell.cell_id,
					  Cells)
			   of
			 #market_silver_shop_cell{item_base_id = BaseId} ->
			     [{Rid, CellId} | Sellers];
			 _False -> Sellers
		       end;
		   _ -> Sellers
		 end,
    del_dirty_sellers(Rest, BaseId, NewSellers).

get_silver_price_ext(Tag,
		     #market_silver_price{ext = Ext}, Default) ->
    case lists:keyfind(Tag, 1, Ext) of
      {Tag, Val} -> {ok, Val};
      _ -> {ok, Default}
    end.

remove_duplicate([]) -> [];
remove_duplicate(L = [_ | _]) ->
    sets:to_list(sets:from_list(L)).

log_purchs_text(default, _Loss, {BaseId, Num}) ->
    ItemStr = item:attr(name, BaseId),
    util:fbin(<<"银币市场购买系统生成的~w个~ts"/utf8>>, [Num, ItemStr]);
log_purchs_text({_RId, Name, CellId}, _Loss,
		{BaseId, Num}) ->
    ItemStr = item:attr(name, BaseId),
    util:fbin(<<"银币市场购买~ts摊位~w，购买~w个~ts"/utf8>>,
	      [Name, CellId, Num, ItemStr]);
log_purchs_text(_Unknow, Loss, Items) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_silver2629, _,
       {__Levelmarket_silver2629, __Tracesmarket_silver2629}}
	  when __Levelmarket_silver2629 band 8 /= 0 orelse
		 __Tracesmarket_silver2629 /= [] ->
	  lager:do_log(error,
		       [{module, market_silver}, {function, log_purchs_text},
			{line, 2629}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知购买日志:[~w][~w][~w]",
				     [_Unknow, Loss, Items]),
		       none, 4096, 8, __Levelmarket_silver2629,
		       __Tracesmarket_silver2629, lager_event,
		       __Pidmarket_silver2629);
      _ -> ok
    end,
    "".

log_on_sale_text(#item{base_id = ItemBaseId}, Num,
		 Price, CellId) ->
    ItemStr = item:attr(name, ItemBaseId),
    util:fbin(<<"银币市场上架~w个~w ~ts,价格~w,摊位~w"/utf8>>,
	      [Num, ItemBaseId, ItemStr, Price, CellId]);
log_on_sale_text(_Unknow, Num, Price, CellId) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmarket_silver2637, _,
       {__Levelmarket_silver2637, __Tracesmarket_silver2637}}
	  when __Levelmarket_silver2637 band 8 /= 0 orelse
		 __Tracesmarket_silver2637 /= [] ->
	  lager:do_log(error,
		       [{module, market_silver}, {function, log_on_sale_text},
			{line, 2637}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知日志:[~w][~w][~w][~w]",
				     [_Unknow, Num, Price, CellId]),
		       none, 4096, 8, __Levelmarket_silver2637,
		       __Tracesmarket_silver2637, lager_event,
		       __Pidmarket_silver2637);
      _ -> ok
    end,
    "".

log_on_sale_again_text(#market_silver_shop_cell{cell_id
						    = CellId,
						item_base_id = ItemBaseId,
						num = OldNum},
		       NewNum, PrePrice) ->
    ItemStr = item:attr(name, ItemBaseId),
    util:fbin(<<"银币市场重新上架~w个~w ~ts,原剩数量：~w,价格~w,摊位~w"/utf8>>,
	      [NewNum, ItemBaseId, ItemStr, OldNum, PrePrice,
	       CellId]).

log_one_click_sale_text([], _Role) -> ok;
log_one_click_sale_text([#market_silver_shop_cell{cell_id
						      = CellId,
						  item_base_id = ItemBaseId,
						  num = Num, price = Price}
			 | Rest],
			Role) ->
    CellStr = util:flist("{~w,~ts,~w,~w}",
			 [ItemBaseId, item:attr(name, ItemBaseId), Num, Price]),
    LogText =
	util:fbin(<<"一键重新上架,CellId:~w,CellStr:~ts"/utf8>>,
		  [CellId, CellStr]),
    log:save(market_silver, {Role, LogText}),
    log_one_click_sale_text(Rest, Role).

log_draw_text(#market_silver_shop_cell{cell_id = CellId,
				       item_base_id = ItemBaseId,
				       sold_num = SoldNum, num = Num,
				       price = Price},
	      ExtraCoin, GainCoin) ->
    item:attr(name, ItemBaseId),
    CellStr = util:flist("{~w, ~w,~ts,~w,~w}",
			 [CellId, ItemBaseId, item:attr(name, ItemBaseId), Num,
			  Price]),
    util:fbin(<<"银币市场提现卖出~w 提现~w 手续费~w，摊位数据:~ts"/utf8>>,
	      [SoldNum, GainCoin, ExtraCoin, CellStr]).

log_one_click_draw_text([], _Role, _NewRole) -> ok;
log_one_click_draw_text([H | Rest], Role, NewRole) ->
    case H of
      #{base_id := BaseId, label := _Label, price := Price,
	num := Num, fee := AddFee, gain_val := GainVal,
	cell_id := CellId, rest := RestNum} ->
	  item:attr(name, BaseId),
	  CellStr = util:flist("{~w, ~w,~ts,~w,~w}",
			       [CellId, BaseId, item:attr(name, BaseId),
				RestNum, Price]),
	  LogText =
	      util:fbin(<<"银币市场提现卖出~w 提现~w 手续费~w，摊位数据:~ts"/utf8>>,
			[Num, GainVal, AddFee, CellStr]),
	  log:save(market_silver, {NewRole, LogText}),
	  ok;
      _ -> ok
    end,
    log_one_click_draw_text(Rest, Role, NewRole).

log_take_off_text(#market_silver_shop_cell{cell_id =
					       CellId},
		  {ItemBaseId, Num}) ->
    ItemStr = item:attr(name, ItemBaseId),
    util:fbin(<<"银币市场下架~w个~w ~ts,摊位~w"/utf8>>,
	      [Num, ItemBaseId, ItemStr, CellId]).

log_open_cell_text(CellId, LossVal) ->
    util:fbin(<<"开放摊位,CellId:~w,消耗:~w"/utf8>>,
	      [CellId, LossVal]).

calc_rfgoods_count(StatisticeInfo) ->
    TypeCount = calc_type_count(StatisticeInfo),
    TotalCount = 10,
    Count = case TypeCount =:= 0 of
	      true -> TypeCount + 1;
	      false -> TypeCount
	    end,
    TotalCount div Count + 2.

calc_type_count(StatisticeInfo) ->
    calc_type_count(StatisticeInfo, 0).

calc_type_count([], Num) -> Num;
calc_type_count([{BaseId, _N} | Rest], Num) ->
    case is_quest_need(BaseId) of
      true -> calc_type_count(Rest, Num + 1);
      false -> calc_type_count(Rest, Num)
    end.

is_quest_need(BaseId) ->
    case market_silver_data:get(BaseId) of
      #market_silver_item_data{is_quest_need = 1} -> true;
      _ -> false
    end.

statistics_refresh_count([], RetAcc) -> RetAcc;
statistics_refresh_count([#market_silver_refresh{item_base_id
						     = BaseId}
			  | Rest],
			 RetAcc) ->
    case lists:keyfind(BaseId, 1, RetAcc) of
      {BaseId, OldNum} ->
	  NewAcc = lists:keyreplace(BaseId, 1, RetAcc,
				    {BaseId, OldNum + 1}),
	  statistics_refresh_count(Rest, NewAcc);
      false ->
	  statistics_refresh_count(Rest, [{BaseId, 1} | RetAcc])
    end.

check_refresh_empty([]) -> true;
check_refresh_empty([{_, Goods} | Rest]) ->
    case Goods of
      [_ | _] -> false;
      [] -> check_refresh_empty(Rest);
      _ -> false
    end;
check_refresh_empty(_) -> false.

sub_big_list(L1, L2) ->
    H1 = ordsets:from_list(L1),
    H2 = ordsets:from_list(L2),
    ordsets:subtract(H1, H2).

list_avg(List) -> list_avg(List, 0, 0).

list_avg([], _Sum, 0) -> 0;
list_avg([], Sum, Len) -> erlang:round(Sum / Len);
list_avg([Int | Rest], Sum, Len) when is_integer(Int) ->
    list_avg(Rest, Sum + Int, Len + 1);
list_avg([_H | Rest], Sum, Len) ->
    list_avg(Rest, Sum, Len).


