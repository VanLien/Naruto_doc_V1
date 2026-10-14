-file("data/sprite_hatch.erl", 1).

-file("src/mod/sprite/sprite_hatch.erl", 1).

-module(sprite_hatch).

-lager_records([{package,
		 [type, next_id, volume, open_times, free_cell, items]},
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
		{login,
		 [login_time, logout_time, prev_logout_time,
		  prev_login_time, log_login_time]},
		{privilege_data,
		 [id, name, pay_type, charge_id, loss, limit_type,
		  limit_day, reward, limit_lev]},
		{privilege_gift,
		 [ver, id, status, buy_time, expire_time]},
		{privilege, [ver, id, expire_time]},
		{m_privilege, [ver, list, gift]},
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
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{sprite_plan, [ver, id, name, plan_sprites]},
		{team_sprite, [ver, team, plan_id, team_sprites]},
		{formation_sprite, [ver, type, team_list]},
		{m_sprite_tree,
		 [ver, lev, break_lev, all_attr, sprites, power,
		  max_power, formation_list, plan_list]},
		{sprite_hatch,
		 [ver, id, is_open, lev, do_id, need_point, do_point,
		  state, end_time, all_end_time]},
		{m_sprite_hatch,
		 [ver, list, day_privilege_mail, day_buy_list, handbook,
		  baodi_info]},
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

-export([init/0, login/1, zero_flush/1, apply_timer/2,
	 lev_up/2, sprite_hatch_start/3, sprite_hatch_expedite/5,
	 sprite_hatch_stop/2, sprite_hatch_finish/2,
	 sprite_hatch_buy_item/4, sprite_compound/4,
	 sprite_hatch_open/2, sprite_holiday_decompound/2,
	 info/1, handbook_info/1, fire/1, fire_HandBook/2,
	 check_open/2]).

-export([gm_del_do_point/3, gm_ref_baodi/1,
	 gm_open_egg/6]).

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

-file("src/mod/sprite/sprite_hatch.erl", 35).

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

-file("src/mod/sprite/sprite_hatch.erl", 36).

-file("inc/sprite.hrl", 1).

-record(m_sprite_hatch,
	{ver = 5, list = [], day_privilege_mail = 0,
	 day_buy_list = [], handbook = [], baodi_info = []}).

-record(sprite_hatch,
	{ver = 2, id = 0, is_open = 0, lev = 0, do_id = 0,
	 need_point = 0, do_point = 0, state = 0, end_time = 0,
	 all_end_time = 0}).

-record(m_sprite_tree,
	{ver = 3, lev = 1, break_lev = 0, all_attr,
	 sprites = [], power = 0, max_power = 0,
	 formation_list = []  :: list(),
	 plan_list = []  :: list()}).

-record(formation_sprite,
	{ver = 1  :: pos_integer(), type = 0  :: pos_integer(),
	 team_list = []  :: list()}).

-record(team_sprite,
	{ver = 1  :: pos_integer(), team = 1  :: pos_integer(),
	 plan_id = 0  :: pos_integer(),
	 team_sprites = []  :: list()}).

-record(sprite_plan,
	{ver = 1  :: pos_integer(), id = 1  :: pos_integer(),
	 name = <<>>  :: string(),
	 plan_sprites = []  :: list()}).

-file("src/mod/sprite/sprite_hatch.erl", 37).

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

-file("src/mod/sprite/sprite_hatch.erl", 38).

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

-file("src/mod/sprite/sprite_hatch.erl", 39).

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

-file("src/mod/sprite/sprite_hatch.erl", 40).

-file("inc/log.hrl", 1).

-file("src/mod/sprite/sprite_hatch.erl", 41).

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

-file("src/mod/sprite/sprite_hatch.erl", 42).

-file("inc/privilege.hrl", 1).

-record(m_privilege, {ver = 1, list = [], gift = []}).

-record(privilege, {ver = 1, id = 0, expire_time = 0}).

-record(privilege_gift,
	{ver = 1, id = 0, status = 0, buy_time = 0,
	 expire_time = 0}).

-record(privilege_data,
	{id = 0, name = <<>>, pay_type = 0, charge_id = 0,
	 loss = 0, limit_type = 0, limit_day = 0, reward = [],
	 limit_lev = 0}).

-file("src/mod/sprite/sprite_hatch.erl", 43).

-file("inc/login.hrl", 1).

-record(login,
	{login_time = 0, logout_time = 0, prev_logout_time = 0,
	 prev_login_time = 0, log_login_time = 0}).

-file("src/mod/sprite/sprite_hatch.erl", 44).

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

-file("src/mod/sprite/sprite_hatch.erl", 45).

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

-file("src/mod/sprite/sprite_hatch.erl", 46).

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

-file("src/mod/sprite/sprite_hatch.erl", 47).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("src/mod/sprite/sprite_hatch.erl", 48).

gm_open_egg(_Role, _DoId, Num, DoNum, Msg, Eggs)
    when Num < DoNum ->
    Fun = fun ({Quality, QNum}, Acc) ->
		  MsgList =
		      util:fbin(lang:get(<<"Chất lượng:~w  Số lượng:~w \n"/utf8>>),
				[Quality, QNum]),
		  <<Acc/binary, MsgList/binary>>
	  end,
    Msg2 = lists:foldl(Fun,
		       lang:get(<<"Tổng cộng：\n"/utf8>>),
		       lists:keysort(1, Eggs)),
    {Msg, Msg2};
gm_open_egg(Role, DoId, Num, DoNum, AllMsg, Eggs) ->
    case gm_open_egg(Role, DoId) of
      {ok, NewRole, Items, IsBaodi, BaodiCount} ->
	  MsgList =
	      util:fbin(lang:get(<<"第~w次开启成功：奖励列表=~w, 是否保底=~w, 当前保底次数=~w \n"/utf8>>),
			[DoNum, Items, IsBaodi, BaodiCount]),
	  AMsg2 = <<AllMsg/binary, MsgList/binary>>,
	  Fun = fun ({BaseId, _}, Acc) ->
			case item_data:get(BaseId) of
			  #item_base{type = 36, quality = Q} -> [{Q, 1} | Acc];
			  _ -> Acc
			end
		end,
	  AddEggs = lists:foldl(Fun, [], Items),
	  gm_open_egg(NewRole, DoId, Num, DoNum + 1, AMsg2,
		      item_lib:merge(Eggs, AddEggs));
      {false, Msg} ->
	  MsgList = case DoNum == 1 of
		      true ->
			  util:fbin(lang:get(<<"\n第~w次开启失败：~ts\n"/utf8>>),
				    [DoNum, Msg]);
		      _ ->
			  util:fbin(lang:get(<<"第~w次开启失败：~ts\n"/utf8>>),
				    [DoNum, Msg])
		    end,
	  AMsg2 = <<AllMsg/binary, MsgList/binary>>,
	  gm_open_egg(Role, DoId, Num, DoNum + 1, AMsg2, Eggs)
    end.

gm_open_egg(Role = #role{m_sprite_hatch =
			     MS = #m_sprite_hatch{baodi_info = BaodiInfo}},
	    DoId) ->
    BaodiCount = sprite_data:get_baodi_count(DoId),
    DoBaodiCount = list_util:keyfind(DoId, BaodiInfo, 0),
    case sprite_data:get_hatch_award(DoId) of
      {DropId1, BaodiDropIds, DropId2, Award} ->
	  IsBaodi = DoBaodiCount >= BaodiCount andalso
		      BaodiCount > 0,
	  DropIds = case IsBaodi of
		      true -> BaodiDropIds ++ DropId2;
		      _ -> DropId1 ++ DropId2
		    end,
	  Items1 = case drop_lib:common_drop(Role, DropIds) of
		     [{_, DropItems, _, _}] ->
			 [{Bid, Val} || {Bid, _, Val} <- DropItems];
		     _ -> []
		   end,
	  Items = item_lib:merge(Award, Items1),
	  Gain = format:val_to_gain(Items, sprite_hatch_finish),
	  case role_gain:do(Role, Gain) of
	    {ok, NRole} ->
		NewBaodiInfo = calc_baodi(BaodiInfo, DoId, Items1,
					  IsBaodi, BaodiCount, DoBaodiCount),
		NewRole = NRole#role{m_sprite_hatch =
					 MS#m_sprite_hatch{baodi_info =
							       NewBaodiInfo}},
		{ok, NewRole, Items, IsBaodi,
		 list_util:keyfind(DoId, NewBaodiInfo, 0)};
	    {false, #gain{msg = Msg}} -> {false, Msg}
	  end;
      _ -> {false, lang:get(<<"参数错误"/utf8>>)}
    end.

gm_del_do_point(Role = #role{m_sprite_hatch =
				 MS = #m_sprite_hatch{list = List}},
		Id, DelPiont) ->
    case lists:keyfind(Id, #sprite_hatch.id, List) of
      S = #sprite_hatch{state = 1, lev = Lev,
			need_point = NeedPiont, do_point = DoPoint} ->
	  NewDoPoint = DoPoint + DelPiont,
	  NewS = case NeedPiont =< NewDoPoint of
		   true -> S#sprite_hatch{state = 2, do_point = NeedPiont};
		   _ -> S#sprite_hatch{do_point = NewDoPoint}
		 end,
	  NewList = lists:keyreplace(Id, #sprite_hatch.id, List,
				     NewS),
	  NewRole = Role#role{m_sprite_hatch =
				  MS#m_sprite_hatch{list = NewList}},
	  TimeOut = sprite_data:get_need_time(Lev),
	  NewRole2 = set_timer(NewRole, NewS, TimeOut),
	  update_hatch([NewS]),
	  NewRole3 =
	      role_trigger:fire([#evt_sprite_hatch_expedite{}],
				NewRole2),
	  {ok, NewRole3};
      _ -> {false, lang:get(<<"该孵化器未开始孵化"/utf8>>)}
    end.

gm_ref_baodi(Role = #role{m_sprite_hatch = MS}) ->
    {ok,
     Role#role{m_sprite_hatch =
		   MS#m_sprite_hatch{baodi_info = []}}}.

init() ->
    List = [init_sprite_hatch(Id)
	    || Id <- sprite_data:get_hatch_ids()],
    #m_sprite_hatch{list = List}.

init_sprite_hatch(Id) -> #sprite_hatch{id = Id}.

-spec login(#role{}) -> {ok, #role{}}.

login(RoleT) ->
    RoleT1 = do_mail(RoleT),
    Role = add_new(RoleT1),
    {Role1 = #role{m_sprite_hatch =
		       #m_sprite_hatch{list = List}},
     _} =
	chekc_open(Role),
    Now = date:unixtime(),
    Fun = fun (S = #sprite_hatch{id = Id,
				 need_point = NeedPiont, state = State,
				 all_end_time = AllEndTime},
	       {Acc1, Acc2}) ->
		  case State == 1 of
		    true when AllEndTime > 0 andalso Now >= AllEndTime ->
			NS = S#sprite_hatch{state = 2}, {Acc1, [NS | Acc2]};
		    true when AllEndTime > 0 ->
			Timer1 = #timer{id = {sprite_hatch_timer, Id},
					timeout =
					    max(1, AllEndTime - Now) * 1000,
					times = 1, m = sprite_hatch,
					f = apply_timer, a = [Id]},
			NAcc1 = role_timer:set(Timer1, Acc1),
			{NAcc1, [S | Acc2]};
		    true ->
			NS = S#sprite_hatch{state = 2, do_point = NeedPiont,
					    all_end_time = Now},
			Timer1 = #timer{id = {sprite_hatch_timer, Id},
					timeout = 1 * 1000, times = 1,
					m = sprite_hatch, f = apply_timer,
					a = [Id]},
			NAcc1 = role_timer:set(Timer1, Acc1),
			{NAcc1, [NS | Acc2]};
		    _ -> {Acc1, [S | Acc2]}
		  end
	  end,
    {TimerRole, NList} = lists:foldl(Fun, {Role1, []},
				     List),
    MailRole = #role{m_sprite_hatch = MS} =
		   do_privilege_mail(TimerRole),
    NewRole = MailRole#role{m_sprite_hatch =
				MS#m_sprite_hatch{list = NList}},
    {ok, NewRole}.

add_new(Role = #role{m_sprite_hatch =
			 M = #m_sprite_hatch{list = List}}) ->
    AllIds = sprite_data:get_hatch_ids(),
    Fun = fun (Id, Acc) ->
		  case lists:keyfind(Id, #sprite_hatch.id, Acc) of
		    #sprite_hatch{} -> Acc;
		    false -> [init_sprite_hatch(Id) | Acc]
		  end
	  end,
    NewList = lists:foldl(Fun, List, AllIds),
    NewM = M#m_sprite_hatch{list = NewList},
    Role#role{m_sprite_hatch = NewM}.

do_mail(Role = #role{p_bag = #package{items = Items},
		     m_sprite_hatch = #m_sprite_hatch{list = List}}) ->
    case var:get_var(Role, other, 3100, 0) of
      0 ->
	  Role1 = var:set_var(Role, other, 3100, 1),
	  Fun = fun (#sprite_hatch{lev = Lev}, Acc) ->
			max(Lev, Acc)
		end,
	  MaxLev = lists:foldl(Fun, 0, List),
	  Now = date:unixtime(),
	  NewRole = case sprite_data:get_lev_mail_award(MaxLev) of
		      AwardList = [_ | _] ->
			  Title = lang:get(<<"灵窝升级返还"/utf8>>),
			  Content =
			      lang:get(<<"亲爱的冒险者大人：\n        全新精灵系统已经上线啦！欢迎您前往体验！\n "
					 "       由于改版后灵窝等级的取消，现根据各位的灵窝等级，全数返还升级灵窝时消耗的钻石"
					 "，请查收"/utf8>>),
			  {MailAssets, MailItems} =
			      format:split_assets_items(AwardList),
			  Mail = {Title, Content, MailAssets, MailItems,
				  <<"灵窝升级返还"/utf8>>, 86400 * 3 + Now},
			  {ok, NNRole} = mail:add(Role1, Mail),
			  NNRole;
		      _ -> Role1
		    end,
	  AllLossId = [{BaseId, NumT}
		       || #item{base_id = BaseId, quantity = NumT} <- Items,
			  lists:member(BaseId, sprite_data:get_egg_bids())],
	  EggAwards1 = item_lib:merge(lists:flatten([[{IdT2,
						       NumT2 * NumT}
						      || {IdT2, NumT2}
							     <- sprite_data:get_reset_award(IdT)]
						     || {IdT, NumT}
							    <- AllLossId]),
				      []),
	  Fun2 = fun (#sprite_hatch{do_id = ItemId,
				    state = State},
		      Acc2) ->
			 case State == 1 orelse State == 2 of
			   true ->
			       item_lib:merge(sprite_data:get_reset_award(ItemId),
					      Acc2);
			   _ -> Acc2
			 end
		 end,
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsprite_hatch214, _,
	     {__Levelsprite_hatch214, __Tracessprite_hatch214}}
		when __Levelsprite_hatch214 band 64 /= 0 orelse
		       __Tracessprite_hatch214 /= [] ->
		lager:do_log(info,
			     [{module, sprite_hatch}, {function, do_mail},
			      {line, 214}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("精灵蛋补偿:~w",
					   [{AllLossId, EggAwards1}]),
			     none, 4096, 64, __Levelsprite_hatch214,
			     __Tracessprite_hatch214, lager_event,
			     __Pidsprite_hatch214);
	    _ -> ok
	  end,
	  case lists:foldl(Fun2, EggAwards1, List) of
	    AllEggAward = [_ | _] ->
		Title2 = lang:get(<<"精灵孵化补偿"/utf8>>),
		Content2 =
		    lang:get(<<"亲爱的冒险者大人：\n        为了给大家带来更好的游玩体验，我们对【精灵系统】进行"
			       "了优化！\n        这是您调整后的补发奖励，请查收～\n    "
			       "    感谢一路上的支持与陪伴~祝大大游戏愉快"/utf8>>),
		{MailAssets2, MailItems2} =
		    format:split_assets_items(AllEggAward),
		Mail2 = {Title2, Content2, MailAssets2, MailItems2,
			 <<"精灵孵化补偿"/utf8>>, 86400 * 3 + Now},
		{ok, NewRole3} = mail:add(NewRole, Mail2),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidsprite_hatch222, _,
		   {__Levelsprite_hatch222, __Tracessprite_hatch222}}
		      when __Levelsprite_hatch222 band 64 /= 0 orelse
			     __Tracessprite_hatch222 /= [] ->
		      lager:do_log(info,
				   [{module, sprite_hatch}, {function, do_mail},
				    {line, 222}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts][~w] 精灵蛋补偿发放：~w",
						 [Role#role.name, Role#role.id,
						  AllEggAward]),
				   none, 4096, 64, __Levelsprite_hatch222,
				   __Tracessprite_hatch222, lager_event,
				   __Pidsprite_hatch222);
		  _ -> ok
		end,
		NewRole3;
	    AllEggAward ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidsprite_hatch225, _,
		   {__Levelsprite_hatch225, __Tracessprite_hatch225}}
		      when __Levelsprite_hatch225 band 8 /= 0 orelse
			     __Tracessprite_hatch225 /= [] ->
		      lager:do_log(error,
				   [{module, sprite_hatch}, {function, do_mail},
				    {line, 225}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts][~w] 精灵蛋补偿失败：~w",
						 [Role#role.name, Role#role.id,
						  AllEggAward]),
				   none, 4096, 8, __Levelsprite_hatch225,
				   __Tracessprite_hatch225, lager_event,
				   __Pidsprite_hatch225);
		  _ -> ok
		end,
		NewRole
	  end;
      _ -> Role
    end.

do_privilege_mail(Role = #role{m_sprite_hatch =
				   MS = #m_sprite_hatch{day_privilege_mail =
							    0}}) ->
    case privilege:is_effect(Role, 5) of
      true ->
	  MailItem = sprite_data:get_const(daily_free_gift),
	  {Assets, Items} = format:split_assets_items(MailItem),
	  {ok, Role2} = mail:add(Role,
				 {lang:get(<<"Quà tặng hàng ngày đặc quyền vĩ thú"/utf8>>),
				  lang:get(<<"Thân gửi nhẫn giả, trứng yêu tinh hôm "
					     "nay đã được giao! ! Vui lòng kiểm tra~ "/utf8>>),
				  Assets, Items,
				  <<"Quà tặng hàng ngày đặc quyền vĩ thú"/utf8>>,
				  86400 + date:unixtime()}),
	  NewMS = MS#m_sprite_hatch{day_privilege_mail = 1},
	  Role2#role{m_sprite_hatch = NewMS};
      _ -> Role
    end;
do_privilege_mail(TimerRole) -> TimerRole.

set_timer(Role, #sprite_hatch{id = Id, state = 1},
	  TimeOut) ->
    Timer1 = #timer{id = {sprite_hatch_timer, Id},
		    timeout = TimeOut * 1000, times = 1, m = sprite_hatch,
		    f = apply_timer, a = [Id]},
    NRole = role_timer:set(Timer1, Role),
    NRole;
set_timer(Role, #sprite_hatch{id = Id}, _TimeOut) ->
    role_timer:del({sprite_hatch_timer, Id}, Role);
set_timer(Role, _S, _TimeOut) -> Role.

del_timer(Role, Id) ->
    role_timer:del({sprite_hatch_timer, Id}, Role).

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_sprite_hatch = MS}) ->
    NewMS = MS#m_sprite_hatch{day_buy_list = [],
			      day_privilege_mail = 0},
    NewRole = Role#role{m_sprite_hatch = NewMS},
    NewRole2 = do_privilege_mail(NewRole),
    info(NewRole2),
    {ok, NewRole2}.

-spec apply_timer(#role{}, Id :: integer()) -> {ok,
						#role{}}.

apply_timer(Role = #role{m_sprite_hatch =
			     MS = #m_sprite_hatch{list = List}},
	    Id) ->
    case lists:keyfind(Id, #sprite_hatch.id, List) of
      S = #sprite_hatch{id = Id, lev = Lev, state = 1,
			need_point = NeedPiont, do_point = DoPoint} ->
	  NewS = S#sprite_hatch{state = 2, do_point = NeedPiont},
	  NewList = lists:keyreplace(Id, #sprite_hatch.id, List,
				     NewS),
	  NewRole = Role#role{m_sprite_hatch =
				  MS#m_sprite_hatch{list = NewList}},
	  update_hatch([NewS]),
	  {ok, NewRole};
      _ -> {ok, Role}
    end.

-spec fire(#role{}) -> {ok, #role{}} |
		       {false, binary()}.

fire(Role) ->
    {NewRole, UpdateList} = chekc_open(Role),
    update_hatch(UpdateList),
    NewRole2 = do_privilege_mail(NewRole),
    NewRole2.

-spec fire_HandBook(#role{}, term()) -> {ok, #role{}} |
					{false, binary()}.

fire_HandBook(Role = #role{m_sprite_hatch =
			       MS = #m_sprite_hatch{handbook = HandBook}},
	      #evt_get_item{base_id = BaseId}) ->
    case item_data:get(BaseId) of
      #item_base{type = 36} ->
	  case lists:member(BaseId, HandBook) of
	    true -> Role;
	    _ ->
		NewMS = MS#m_sprite_hatch{handbook =
					      [BaseId | HandBook]},
		sys_conn:pack_send(26520, {[BaseId]}),
		NewRole = Role#role{m_sprite_hatch = NewMS},
		NewRole2 = sprite_hatch:fire(NewRole),
		NewRole2
	  end;
      _ -> Role
    end;
fire_HandBook(Role, _) -> Role.

chekc_open(Role = #role{lev = Lev,
			m_sprite_hatch = MS = #m_sprite_hatch{list = List}}) ->
    case Lev >= sprite_data:get_const(sprite_unlocked_lv) of
      true ->
	  Fun = fun (S = #sprite_hatch{id = Id, is_open = IsOpen},
		     {Acc1, Acc2}) ->
			NewIsOpen = check_open(Role, Id, IsOpen),
			NewS = S#sprite_hatch{is_open = NewIsOpen},
			NAcc1 = [NewS | Acc1],
			NAcc2 = util:if_true(IsOpen == NewIsOpen, Acc2,
					     [NewS | Acc2]),
			{NAcc1, NAcc2}
		end,
	  {NewList, UpdateList} = lists:foldl(Fun, {[], []},
					      List),
	  NewMS = MS#m_sprite_hatch{list = NewList},
	  NewRole = Role#role{m_sprite_hatch = NewMS},
	  {NewRole, UpdateList};
      _ -> {Role, []}
    end.

check_open(Role = #role{lev = Lev}, Id) ->
    check_open(Role = #role{lev = Lev}, Id, 0);
check_open(#role_robot{lev = Lev}, Id) ->
    case sprite_data:get_hatch_cond(Id) of
      {lev, NeedLev} when Lev >= NeedLev -> true;
      _ -> false
    end.

check_open(Role = #role{lev = Lev,
			m_sprite_hatch = #m_sprite_hatch{handbook = HandBook},
			m_sprite_tree =
			    #m_sprite_tree{lev = TreeLev, break_lev = BreakLev,
					   max_power = MaxTreePower}},
	   Id, OldStateT) ->
    OldState = util:int_bool(OldStateT),
    Expend = sprite_data:get_hatch_open_expend(Id),
    case sprite_data:get_hatch_cond(Id) of
      {lev, NeedLev} when Lev >= NeedLev -> 1;
      {privilege, PrivilegeId} ->
	  util:int_bool(privilege:is_effect(Role, PrivilegeId));
      {sprite_tree_break, NeedBreakLev}
	  when BreakLev >= NeedBreakLev andalso OldState == 0 ->
	  case Expend =/= [] of
	    true -> 2;
	    _ -> 1
	  end;
      {sprite_tree_lv, NeedTreeLev}
	  when TreeLev >= NeedTreeLev andalso OldState == 0 ->
	  case Expend =/= [] of
	    true -> 2;
	    _ -> 1
	  end;
      {has_any_sprite, Sprites} when OldState == 0 ->
	  case [Bid
		|| Bid <- HandBook, lists:member(Bid, Sprites)]
	      of
	    [_ | _] when Expend =/= [] -> 2;
	    [_ | _] -> 1;
	    _ -> OldState
	  end;
      {sprite_tree_power, NeedPower} when OldState == 0 ->
	  case MaxTreePower >= NeedPower of
	    true when Expend =/= [] -> 2;
	    true -> 1;
	    _ -> OldState
	  end;
      {sprite_power, NeedPower} when OldState == 0 ->
	  SpritePower = sprite_tree:calc_sprite_power(Role),
	  case SpritePower >= NeedPower of
	    true when Expend =/= [] -> 2;
	    true -> 1;
	    _ -> OldState
	  end;
      _ -> OldState
    end.

-spec sprite_hatch_open(#role{},
			Id :: integer()) -> {ok, #role{}} | {false, binary()}.

sprite_hatch_open(Role = #role{m_vip =
				   #m_vip{lev = VipLev},
			       m_sprite_hatch =
				   MS = #m_sprite_hatch{list = List}},
		  Id) ->
    case lists:keyfind(Id, #sprite_hatch.id, List) of
      S = #sprite_hatch{is_open = 2} ->
	  case sprite_data:get_hatch_open_expend(Id) of
	    Expend = [_ | _] ->
		Loss = format:val_to_loss(Expend, sprite_hatch_open),
		case role_gain:do(Role, Loss) of
		  {ok, NRole} ->
		      log:log_gain(Loss, Role, NRole, <<"孵化器升级"/utf8>>,
				   util:fbin(<<"精灵孵化器激活:~w"/utf8>>, [Id])),
		      NewS = S#sprite_hatch{is_open = 1},
		      NewList = lists:keyreplace(Id, #sprite_hatch.id, List,
						 NewS),
		      NewRole = NRole#role{m_sprite_hatch =
					       MS#m_sprite_hatch{list =
								     NewList}},
		      update_hatch(NewList),
		      {ok, NewRole};
		  {false, #loss{msg = Msg}} -> {false, Msg}
		end;
	    _ -> {false, lang:get(<<"参数错误"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"参数错误"/utf8>>)}
    end.

-spec lev_up(#role{}, Id :: integer()) -> {ok,
					   #role{}} |
					  {false, binary()}.

lev_up(Role = #role{m_vip = #m_vip{lev = VipLev},
		    m_sprite_hatch = MS = #m_sprite_hatch{list = List}},
       Id) ->
    case lists:keyfind(Id, #sprite_hatch.id, List) of
      #sprite_hatch{lev = Lev} ->
	  MaxLev = sprite_data:get_lev_max(),
	  case sprite_data:get_lev_expend(Lev + 1) of
	    _ when Lev >= MaxLev ->
		{false, lang:get(<<"等级已满"/utf8>>)};
	    {LimitVip, Expend}
		when VipLev >= LimitVip andalso is_list(Expend) ->
		Loss = format:val_to_loss(Expend, sprite_hatch_lev_up),
		case role_gain:do(Role, Loss) of
		  {ok, NRole} ->
		      NewLev = Lev + 1,
		      log:log_gain(Loss, Role, NRole, <<"孵化器升级"/utf8>>,
				   util:fbin(<<"孵化器升级:~w,~w"/utf8>>,
					     [Id, Lev])),
		      NewList = [ST#sprite_hatch{lev = NewLev} || ST <- List],
		      NewRole = NRole#role{m_sprite_hatch =
					       MS#m_sprite_hatch{list =
								     NewList}},
		      update_hatch(NewList),
		      {ok, NewRole, NewLev};
		  {false, #loss{msg = Msg}} -> {false, Msg}
		end;
	    {LimitVip, Expend} when is_list(Expend) ->
		{false,
		 util:fbin(lang:get(<<"VIP~w才能继续升级"/utf8>>),
			   [LimitVip])};
	    _ -> {false, lang:get(<<"等级已满"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"参数错误"/utf8>>)}
    end.

-spec sprite_hatch_start(#role{}, Id :: integer(),
			 ItemBid :: integer()) -> {ok, #role{}} |
						  {false, binary()}.

sprite_hatch_start(Role = #role{m_sprite_hatch =
				    MS = #m_sprite_hatch{list = List}},
		   Id, ItemBid) ->
    HasPrivilege = privilege:is_effect(Role, 5),
    case lists:keyfind(Id, #sprite_hatch.id, List) of
      _
	  when (Id == 2 orelse Id == 3) andalso
		 HasPrivilege == false ->
	  {false, lang:get(<<"特权未激活"/utf8>>)};
      S = #sprite_hatch{lev = Lev, state = 0, is_open = 1} ->
	  case sprite_data:get_need_piont(ItemBid) of
	    NeedPiont
		when is_integer(NeedPiont) andalso NeedPiont > 0 ->
		Loss = format:val_to_loss([{ItemBid, 1}],
					  sprite_hatch_start),
		case role_gain:do(Role, Loss) of
		  {ok, NRole} ->
		      log:log_gain(Loss, Role, NRole, <<"孵化消耗"/utf8>>,
				   util:fbin(<<"孵化器开始:孵化器id~w,蛋id~w,所需点数:~w"/utf8>>,
					     [Id, ItemBid, NeedPiont])),
		      #item_base{quality = Quality} = item_data:get(ItemBid),
		      Now = date:unixtime(),
		      TimeOut = sprite_data:get_need_time(Lev),
		      NeedTime = sprite_data:get_const(hatch_rate) *
				   NeedPiont,
		      NewS = S#sprite_hatch{do_id = ItemBid,
					    all_end_time = Now + NeedTime,
					    end_time = Now + TimeOut,
					    need_point = NeedPiont,
					    do_point = 0, state = 1},
		      NewList = lists:keyreplace(Id, #sprite_hatch.id, List,
						 NewS),
		      NewRole = NRole#role{m_sprite_hatch =
					       MS#m_sprite_hatch{list =
								     NewList}},
		      NewRole2 = set_timer(NewRole, NewS, NeedTime),
		      update_hatch([NewS]),
		      {ok, NewRole2};
		  {false, #loss{msg = Msg}} -> {false, Msg}
		end;
	    NeedPiont when is_integer(NeedPiont) ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidsprite_hatch471, _,
		   {__Levelsprite_hatch471, __Tracessprite_hatch471}}
		      when __Levelsprite_hatch471 band 8 /= 0 orelse
			     __Tracessprite_hatch471 /= [] ->
		      lager:do_log(error,
				   [{module, sprite_hatch},
				    {function, sprite_hatch_start}, {line, 471},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("孵化配置出错，所需点数为0，bid:~w",
						 [ItemBid]),
				   none, 4096, 8, __Levelsprite_hatch471,
				   __Tracessprite_hatch471, lager_event,
				   __Pidsprite_hatch471);
		  _ -> ok
		end,
		{false, lang:get(<<"配置出错"/utf8>>)};
	    _ -> {false, lang:get(<<"参数错误"/utf8>>)}
	  end;
      #sprite_hatch{is_open = 0} ->
	  {false, lang:get(<<"该孵化器未激活"/utf8>>)};
      _ -> {false, lang:get(<<"该孵化器正在孵化"/utf8>>)}
    end.

get_quality_name(4) -> <<"橙蛋"/utf8>>;
get_quality_name(3) -> <<"紫蛋"/utf8>>;
get_quality_name(_) -> <<"蓝蛋"/utf8>>.

-spec sprite_hatch_expedite(#role{}, Id :: integer(),
			    ItemBid :: integer(), Num :: integer(),
			    Type :: integer()) -> {ok, #role{}} |
						  {false, binary()}.

sprite_hatch_expedite(Role = #role{m_sprite_hatch =
				       #m_sprite_hatch{list = List,
						       day_buy_list =
							   DayBuyList}},
		      Id, ItemBid, Num, Type) ->
    case lists:keyfind(Id, #sprite_hatch.id, List) of
      S = #sprite_hatch{state = 1, lev = Lev,
			need_point = NeedPiont, do_point = DoPoint} ->
	  case sprite_data:get_del_piont(ItemBid) of
	    DelPiont
		when is_integer(DelPiont) andalso DelPiont > 0 ->
		Loss = format:val_to_loss([{ItemBid, Num}],
					  sprite_hatch_expedite),
		case role_gain:do(Role, Loss) of
		  {ok, NRole = #role{m_sprite_hatch = MS}} ->
		      log:log_gain(Loss, Role, NRole, <<"孵化加速"/utf8>>,
				   util:fbin(<<"加速孵化:孵化器id~w,蛋id~w,所需点数:~w"/utf8>>,
					     [Id, {ItemBid, Num}, NeedPiont])),
		      NewDoPoint = DoPoint + DelPiont * Num,
		      NewS = case NeedPiont =< NewDoPoint of
			       true ->
				   S#sprite_hatch{state = 2,
						  do_point = NeedPiont};
			       _ -> S#sprite_hatch{do_point = NewDoPoint}
			     end,
		      NewList = lists:keyreplace(Id, #sprite_hatch.id, List,
						 NewS),
		      NewRole = NRole#role{m_sprite_hatch =
					       MS#m_sprite_hatch{list =
								     NewList}},
		      TimeOut = sprite_data:get_need_time(Lev),
		      NewRole2 = set_timer(NewRole, NewS, TimeOut),
		      update_hatch([NewS]),
		      NewRole3 =
			  role_trigger:fire([#evt_sprite_hatch_expedite{}],
					    NewRole2),
		      {ok, NewRole3};
		  _ when Type == 1 ->
		      {CanBuy, Expend, LimitCount} =
			  sprite_data:get_item_buy_info(ItemBid),
		      DayCount = list_util:keyfind(ItemBid, DayBuyList, 0),
		      NewDayCount = DayCount + Num,
		      case NewDayCount > LimitCount of
			true -> {false, lang:get(<<"今日购买已达上限"/utf8>>)};
			_ when CanBuy == 1 ->
			    Loss2 = format:val_to_loss([{ExpendId,
							 ExpendNum * Num}
							|| {ExpendId, ExpendNum}
							       <- Expend],
						       sprite_hatch_buy_item),
			    case role_gain:do_notice(Role, Loss2) of
			      {ok, NRole = #role{m_sprite_hatch = MS}} ->
				  log:log_gain(Loss2, Role, NRole,
					       <<"孵化加速"/utf8>>,
					       util:fbin(<<"钻石加速孵化:孵化器id~w,蛋id~w,所需点数:~w"/utf8>>,
							 [Id, {ItemBid, Num},
							  NeedPiont])),
				  NewDoPoint = DoPoint + DelPiont,
				  NewS = case NeedPiont =< NewDoPoint of
					   true ->
					       S#sprite_hatch{state = 2,
							      do_point =
								  NeedPiont};
					   _ ->
					       S#sprite_hatch{do_point =
								  NewDoPoint}
					 end,
				  NewList = lists:keyreplace(Id,
							     #sprite_hatch.id,
							     List, NewS),
				  NewMS = MS#m_sprite_hatch{day_buy_list =
								lists:keystore(ItemBid,
									       1,
									       DayBuyList,
									       {ItemBid,
										NewDayCount}),
							    list = NewList},
				  NewRole = NRole#role{m_sprite_hatch = NewMS},
				  TimeOut = sprite_data:get_need_time(Lev),
				  NewRole2 = set_timer(NewRole, NewS, TimeOut),
				  update_hatch([NewS]),
				  NewRole3 =
				      role_trigger:fire([#evt_sprite_hatch_expedite{}],
							NewRole2),
				  info(NewRole3),
				  {ok, NewRole3};
			      {false, #loss{msg = Msg}} -> {false, Msg};
			      {false, #gain{msg = Msg}} -> {false, Msg}
			    end;
			_ -> {false, lang:get(<<"该物品不能购买"/utf8>>)}
		      end;
		  {false, #loss{msg = Msg}} -> {false, Msg}
		end;
	    DelPiont when is_integer(DelPiont) ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidsprite_hatch549, _,
		   {__Levelsprite_hatch549, __Tracessprite_hatch549}}
		      when __Levelsprite_hatch549 band 8 /= 0 orelse
			     __Tracessprite_hatch549 /= [] ->
		      lager:do_log(error,
				   [{module, sprite_hatch},
				    {function, sprite_hatch_expedite},
				    {line, 549}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("孵化配置出错，所需点数为0，bid:~w",
						 [ItemBid]),
				   none, 4096, 8, __Levelsprite_hatch549,
				   __Tracessprite_hatch549, lager_event,
				   __Pidsprite_hatch549);
		  _ -> ok
		end,
		{false, lang:get(<<"配置出错"/utf8>>)};
	    _ -> {false, lang:get(<<"参数错误"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"该孵化器未开始孵化"/utf8>>)}
    end.

-spec sprite_hatch_stop(#role{},
			Id :: integer()) -> {ok, #role{}} | {false, binary()}.

sprite_hatch_stop(Role = #role{m_sprite_hatch =
				   #m_sprite_hatch{list = List}},
		  Id) ->
    case lists:keyfind(Id, #sprite_hatch.id, List) of
      S = #sprite_hatch{state = 1, do_id = DoId} ->
	  Gain = format:val_to_gain([{DoId, 1}],
				    sprite_hatch_stop),
	  case role_gain:do(Role, Gain) of
	    {ok, NRole = #role{m_sprite_hatch = MS}} ->
		log:log_gain(Gain, Role, NRole, <<"孵化取消"/utf8>>,
			     util:fbin(<<"终止孵化:孵化器id~w,蛋id~w"/utf8>>,
				       [Id, DoId])),
		NewS = S#sprite_hatch{do_id = 0, need_point = 0,
				      do_point = 0, state = 0},
		NewList = lists:keyreplace(Id, #sprite_hatch.id, List,
					   NewS),
		NewRole = NRole#role{m_sprite_hatch =
					 MS#m_sprite_hatch{list = NewList}},
		NewRole2 = del_timer(NewRole, Id),
		update_hatch([NewS]),
		{ok, NewRole2};
	    {false, #gain{msg = Msg}} -> {false, Msg}
	  end;
      _ -> {false, lang:get(<<"该孵化器未开始孵化"/utf8>>)}
    end.

-spec sprite_hatch_finish(#role{},
			  Id :: integer()) -> {ok, #role{}} | {false, binary()}.

sprite_hatch_finish(Role = #role{m_sprite_hatch =
				     #m_sprite_hatch{list = List,
						     baodi_info = BaodiInfo}},
		    Id) ->
    case lists:keyfind(Id, #sprite_hatch.id, List) of
      S = #sprite_hatch{state = 2, do_id = DoId} ->
	  BaodiCount = sprite_data:get_baodi_count(DoId),
	  DoBaodiCount = list_util:keyfind(DoId, BaodiInfo, 0),
	  case sprite_data:get_hatch_award(DoId) of
	    {DropId1, BaodiDropIds, DropId2, Award} ->
		IsBaodi = DoBaodiCount >= BaodiCount andalso
			    BaodiCount > 0,
		DropIds = case IsBaodi of
			    true -> BaodiDropIds ++ DropId2;
			    _ -> DropId1 ++ DropId2
			  end,
		{Items1, NoticeMsg} = case drop_lib:common_drop(Role,
								DropIds)
					  of
					[{_, DropItems, _, NoticeMsgT}] ->
					    {[{Bid, Val}
					      || {Bid, _, Val} <- DropItems],
					     NoticeMsgT};
					_ -> {[], <<>>}
				      end,
		Items = item_lib:merge(Award, Items1),
		Gain = format:val_to_gain(Items, sprite_hatch_finish),
		case role_gain:do(Role, Gain) of
		  {ok, NRole = #role{m_sprite_hatch = MS}} ->
		      log:log_gain(Gain, Role, NRole, <<"孵化领取"/utf8>>,
				   util:fbin(<<"孵化领取奖励:孵化器id~w,蛋id~w"/utf8>>,
					     [Id, DoId])),
		      NewBaodiInfo = calc_baodi(BaodiInfo, DoId, Items1,
						IsBaodi, BaodiCount,
						DoBaodiCount),
		      NewS = S#sprite_hatch{do_id = 0, need_point = 0,
					    do_point = 0, state = 0},
		      NewList = lists:keyreplace(Id, #sprite_hatch.id, List,
						 NewS),
		      NewRole = NRole#role{m_sprite_hatch =
					       MS#m_sprite_hatch{list = NewList,
								 baodi_info =
								     NewBaodiInfo}},
		      NewRole2 = del_timer(NewRole, Id),
		      update_hatch([NewS]),
		      NewRole3 = role_trigger:fire([#evt_sprite_hatch{},
						    #evt_appoint_sprite{bids =
									    Items}],
						   NewRole2),
		      drop_lib:drop_notice(NoticeMsg),
		      {ok, NewRole3, Items};
		  {false, #gain{msg = Msg}} -> {false, Msg}
		end;
	    _ -> {false, lang:get(<<"该孵化器未完成孵化1"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"该孵化器未完成孵化"/utf8>>)}
    end.

calc_baodi(BaodiInfo, DoId, _Items1, true, _BaodiCount,
	   _DoBaodiCount) ->
    lists:keystore(DoId, 1, BaodiInfo, {DoId, 0});
calc_baodi(BaodiInfo, DoId, Items, _IsBaodi, BaodiCount,
	   DoBaodiCount)
    when BaodiCount > 0 ->
    BaodiQuality = sprite_data:get_baodi_quality(DoId),
    Fun = fun ({BaseId, _}, Acc) ->
		  case item_data:get(BaseId) of
		    #item_base{type = 36, quality = Q}
			when Q >= BaodiQuality ->
			[{Q, 1} | Acc];
		    _ -> Acc
		  end
	  end,
    case lists:foldl(Fun, [], Items) of
      [_ | _] ->
	  lists:keystore(DoId, 1, BaodiInfo, {DoId, 0});
      _ ->
	  lists:keystore(DoId, 1, BaodiInfo,
			 {DoId, DoBaodiCount + 1})
    end;
calc_baodi(BaodiInfo, _DoId, _Items, _IsBaodi,
	   _BaodiCount, _DoBaodiCount) ->
    BaodiInfo.

-spec sprite_hatch_buy_item(#role{}, Type :: integer(),
			    ItemBid :: integer(), Num :: integer()) -> {ok,
									#role{}} |
								       {false,
									binary()}.

sprite_hatch_buy_item(Role = #role{m_sprite_hatch =
				       #m_sprite_hatch{day_buy_list =
							   DayBuyList}},
		      Type, ItemBid, Num) ->
    {CanBuy, Expend, LimitCount} = case Type == 1 of
				     true ->
					 sprite_data:get_egg_buy_info(ItemBid);
				     _ -> sprite_data:get_item_buy_info(ItemBid)
				   end,
    DayCount = list_util:keyfind(ItemBid, DayBuyList, 0),
    NewDayCount = DayCount + Num,
    case NewDayCount > LimitCount of
      true -> {false, lang:get(<<"今日购买已达上限"/utf8>>)};
      _ when CanBuy == 1 ->
	  Gain = format:val_to_gain([{ItemBid, Num}],
				    sprite_hatch_buy_item),
	  Loss = format:val_to_loss([{ExpendId, ExpendNum * Num}
				     || {ExpendId, ExpendNum} <- Expend],
				    sprite_hatch_buy_item),
	  case role_gain:do_notice(Role, Gain ++ Loss) of
	    {ok, NRole = #role{m_sprite_hatch = MS}} ->
		LS = util:if_true(Type == 1, <<"孵化买精灵蛋"/utf8>>,
				  <<"孵化买加速道具"/utf8>>),
		log:log_gain(Gain ++ Loss, Role, NRole, LS,
			     util:fbin(<<"购买精灵道具:类型~w,数量~w,今日已购买:~w"/utf8>>,
				       [Type, Num, DayCount])),
		NewS = MS#m_sprite_hatch{day_buy_list =
					     lists:keystore(ItemBid, 1,
							    DayBuyList,
							    {ItemBid,
							     NewDayCount})},
		NewRole = NRole#role{m_sprite_hatch = NewS},
		{ok, NewRole, NewDayCount};
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {false, #gain{msg = Msg}} -> {false, Msg}
	  end;
      _ -> {false, lang:get(<<"该物品不能购买"/utf8>>)}
    end.

-spec sprite_compound(#role{}, ItemBid :: integer(),
		      Num :: integer(), 0 | 1) -> {ok, #role{}} |
						  {false, binary()}.

sprite_compound(Role, ItemBid, Num, 0) ->
    case sprite_data:get_sprite_compound_info(ItemBid) of
      {Expend, AwardId} ->
	  Gain = format:val_to_gain([{AwardId, Num}],
				    sprite_compound),
	  Loss = format:val_to_loss(item_lib:merge([{ItemBid,
						     Num}],
						   [{ItemId, ItemNum * Num}
						    || {ItemId, ItemNum}
							   <- Expend]),
				    sprite_compound),
	  case role_gain:do_notice(Role, Gain ++ Loss) of
	    {ok, NRole} ->
		log:log_gain(Gain ++ Loss, Role, NRole, <<"精灵合成"/utf8>>,
			     util:fbin(<<"精灵合成:~w"/utf8>>, [ItemBid])),
		NRole1 = role_trigger:fire([#evt_sprite_compound{},
					    #evt_appoint_sprite_compound{bids =
									     [AwardId]}],
					   NRole),
		NewRole =
		    sprite_formation:compound_exchange_sprites(NRole1,
							       ItemBid,
							       AwardId),
		{ok, NewRole};
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {false, #gain{msg = Msg}} -> {false, Msg}
	  end;
      _ -> {false, lang:get(<<"参数错误"/utf8>>)}
    end;
sprite_compound(Role = #role{m_sprite_tree =
				 MS = #m_sprite_tree{sprites = Sprites}},
		ItemBid, Num, Pos) ->
    case lists:keyfind(Pos, 1, Sprites) of
      {_, ItemBid} ->
	  case sprite_data:get_sprite_compound_info(ItemBid) of
	    {Expend, AwardId} ->
		Loss = format:val_to_loss([{ItemId, ItemNum * Num}
					   || {ItemId, ItemNum} <- Expend],
					  sprite_compound),
		case role_gain:do_notice(Role, Loss) of
		  {ok, NRole} ->
		      log:log_gain(Loss, Role, NRole, <<"精灵合成"/utf8>>,
				   util:fbin(<<"精灵合成:~w"/utf8>>, [ItemBid])),
		      NewMS = MS#m_sprite_tree{sprites =
						   lists:keyreplace(Pos, 1,
								    Sprites,
								    {Pos,
								     AwardId})},
		      NewRole1 = NRole#role{m_sprite_tree = NewMS},
		      NewRole = sprite_tree:calc_attr(NewRole1),
		      sprite_tree:info(NewRole),
		      arena_elite_mirror:update_mirror(NewRole),
		      NewRole2 = role_trigger:fire([#evt_sprite_compound{},
						    #evt_appoint_sprite_compound{bids
										     =
										     [AwardId]}],
						   NewRole),
		      NewRole3 = fire_HandBook(NewRole2,
					       #evt_get_item{base_id =
								 AwardId}),
		      NewRole4 =
			  sprite_formation:compound_exchange_sprites(NewRole3,
								     ItemBid,
								     AwardId),
		      {ok, NewRole4};
		  {false, #loss{msg = Msg}} -> {false, Msg};
		  {false, #gain{msg = Msg}} -> {false, Msg}
		end;
	    _ -> {false, lang:get(<<"参数错误1"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"参数错误"/utf8>>)}
    end.

-spec info(#role{}) -> ok.

info(#role{m_sprite_hatch =
	       #m_sprite_hatch{list = List,
			       day_buy_list = BuyList}}) ->
    sys_conn:pack_send(26500, {List, BuyList}).

-spec handbook_info(#role{}) -> ok.

handbook_info(#role{m_sprite_hatch =
			#m_sprite_hatch{handbook = HandBook}}) ->
    sys_conn:pack_send(26509, {HandBook}).

-spec update_hatch(list()) -> ok.

update_hatch([]) -> ok;
update_hatch(UpdateList) ->
    sys_conn:pack_send(26501, {UpdateList}).

-spec sprite_holiday_decompound(#role{},
				ItemBid :: integer()) -> {ok, #role{}} |
							 {false, binary()}.

sprite_holiday_decompound(Role, ItemBid) ->
    case holiday_lib:get_open_holiday(Role,
				      [3044, 93044, 993044])
	of
      #holiday{camp_id = CampId} ->
	  case sprite_data:get_sprite_holiday_decompound({CampId,
							  ItemBid})
	      of
	    Award = [_ | _] ->
		Gain = format:val_to_gain(Award,
					  sprite_holiday_decompound),
		Loss = format:val_to_loss([{ItemBid, 1}],
					  sprite_holiday_decompound),
		GL = Gain ++ Loss,
		case role_gain:do_notice(Role, GL) of
		  {ok, NewRole} ->
		      log:log_gain(GL, Role, NewRole, <<"精灵回退活动"/utf8>>,
				   util:fbin(<<"精灵回退:~w"/utf8>>, [ItemBid])),
		      NewRole1 = sprite_formation:clear_up_sprites(NewRole),
		      {ok, NewRole1};
		  {false, #loss{msg = Msg}} -> {false, Msg};
		  {false, #gain{msg = Msg}} -> {false, Msg}
		end;
	    _ -> {false, lang:get(<<"该精灵不能回退"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.


