-file("data/role_gain.erl", 1).

-file("src/mod/role/role_gain.erl", 1).

-module(role_gain).

-lager_records([{role_gain_args,
		 [refresh_items, push_assets, push_holiday_assets,
		  ext_args, refresh_partners, refresh_partner_artiface,
		  evts, log_name]},
		{personal_push_gift_data,
		 [gift_id, type_id, charge_id, limit_count, money,
		  costly_num, valid_time, open_cond, warehouse_id, award,
		  over_time, buy_count, trigger_id]},
		{m_personal_push,
		 [ver, fire_type, fire_not_buy, fire_gift, ext]},
		{role_weekly_report,
		 [ver, rid, end_time, account, name, lev, face_id, power,
		  channel, have_partners, used_partners, get_partner,
		  get_gold, get_high_recruit, get_crystal, get_sprite,
		  send_point, login_day, acc_time, arena_elite_lev,
		  arena_cluster_rank, star_tower_rank, arena_score,
		  endless_rank, sky_ladder_rank, cluster_champion_rank,
		  arena_team_rank, element_rank, drama_rate, tag_list,
		  ext]},
		{m_weekly,
		 [ver, used_partners, get_partner, get_gold,
		  get_high_recruit, get_crystal, get_sprite, send_point]},
		{drama_quest_unit,
		 [label, id, base_id, type, pos, dir, act_type,
		  is_rand_pos]},
		{drama_play,
		 [id, act_type, label, base_id, map_bid, x, y, type, val,
		  name, desc]},
		{drama_obj,
		 [id, name, base_id, type, minor_type, map_bid, x, y,
		  dir, act_type, looks, status, quest_id, quest_prog_id,
		  sex, career]},
		{drama_data,
		 [bid, name, lev, is_open, is_skip, num, event, act_cond,
		  act, condition, offline]},
		{drama, [id, act_idx, num]},
		{m_drama,
		 [ver, finished, play_list, do_list, combat_list,
		  obj_list, guide_list, finish_guide]},
		{m_merge_goal, [ver, camp_id, reward]},
		{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
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
		{exchange_data_other,
		 [lv, type, pos, item_id, itemname, item_num, pro, price,
		  pay_type, limit_lev, limit_day]},
		{exchange_expire_gift,
		 [ver, eid, base_id, bind, num, timeout, reward_time]},
		{exchange_other,
		 [ver, type, pos, item_id, itemname, item_num, price,
		  pay_type, status]},
		{m_shop,
		 [ver, ref_time_list, items, expire_list, extra]},
		{exchange_data,
		 [type, type2, id, item_bid, day, item_name, item_num,
		  bind, pay_type, price, limit_vip, limit_day, limit_week,
		  limit_month, glev, lev, is_partner, goods_type,
		  limit_count, label, discount, limit_rank, buy_condit,
		  limit_soft, buy_stage, open_srv_timestamp,
		  arena_elite_lev]},
		{exchange_ref,
		 [type_type, lev, type, order, item_bid, item_name,
		  item_num, pro, price, pay_type, has_buy, item_type,
		  label, discount, limit_count, assets_range, pay_type2,
		  flag, item, id, limit_day, limit_week, limit_month,
		  item_desc]},
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
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
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

-export([do/2, do/3, do_notice/2, do_notice/3,
	 do_mail/5, do_mail/6, do_mail_and_notice/5,
	 do_mail_and_notice/6, auto_sell_eqm/1, gain_notice/3]).

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

-file("src/mod/role/role_gain.erl", 26).

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

-file("src/mod/role/role_gain.erl", 27).

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

-file("src/mod/role/role_gain.erl", 28).

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

-file("src/mod/role/role_gain.erl", 29).

-file("inc/log.hrl", 1).

-file("src/mod/role/role_gain.erl", 30).

-file("inc/item_make_flag.hrl", 1).

-file("src/mod/role/role_gain.erl", 31).

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

-file("src/mod/role/role_gain.erl", 32).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("src/mod/role/role_gain.erl", 33).

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

-file("src/mod/role/role_gain.erl", 34).

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

-file("src/mod/role/role_gain.erl", 35).

-file("inc/exchange.hrl", 1).

-record(exchange_ref,
	{type_type = 0, lev = {0, 0}, type = 0, order = 0,
	 item_bid = 0, item_name = <<>>, item_num = 0, pro = 0,
	 price = 0, pay_type = 0, has_buy = 0, item_type = 0,
	 label = 0, discount = 0, limit_count = 0,
	 assets_range = {-1, 0}, pay_type2 = {0, 0}, flag = 1,
	 item = [], id = 0, limit_day = 0, limit_week = 0,
	 limit_month = 0, item_desc = <<>>}).

-record(exchange_data,
	{type = 0, type2 = 0, id = 0, item_bid = 0, day = 0,
	 item_name = <<>>, item_num = 0, bind = 1, pay_type = 0,
	 price = 0, limit_vip = 0, limit_day = 0, limit_week = 0,
	 limit_month = 0, glev = 0, lev = 0, is_partner = 0,
	 goods_type = 0, limit_count = 0, label = 0,
	 discount = 0, limit_rank = 0, buy_condit = 0,
	 limit_soft = 0, buy_stage = 0, open_srv_timestamp = 0,
	 arena_elite_lev = 0}).

-record(m_shop,
	{ver = 3, ref_time_list = [], items = [],
	 expire_list = [], extra = []}).

-record(exchange_other,
	{ver = 1, type = 0, pos = 0, item_id, itemname,
	 item_num, price, pay_type, status = 0}).

-record(exchange_expire_gift,
	{ver = 1, eid = 0, base_id = 0, bind = 0, num = 0,
	 timeout = 0, reward_time = 0}).

-record(exchange_data_other,
	{lv = {1, 999}, type, pos, item_id, itemname, item_num,
	 pro, price, pay_type, limit_lev = 0, limit_day = 1}).

-file("src/mod/role/role_gain.erl", 36).

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

-file("src/mod/role/role_gain.erl", 37).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/role/role_gain.erl", 38).

-file("inc/holiday_merge_goal.hrl", 1).

-record(m_merge_goal,
	{ver = 1  :: pos_integer(),
	 camp_id = 0  :: pos_integer(), reward = []  :: list()}).

-file("src/mod/role/role_gain.erl", 39).

-file("inc/drama.hrl", 1).

-record(m_drama,
	{ver = 1, finished = []  :: [pos_integer()],
	 play_list = []  :: [pos_integer()],
	 do_list = []  :: [tuple()],
	 combat_list = []  :: [tuple()], obj_list = [],
	 guide_list = []  :: [pos_integer()],
	 finish_guide = []  :: list()}).

-record(drama, {id = 0, act_idx = 0, num = 0}).

-record(drama_data,
	{bid = 0, name = <<>>, lev = 0, is_open = 0,
	 is_skip = 0, num = 1, event, act_cond = [], act = [],
	 condition = [], offline = 1}).

-record(drama_obj,
	{id = 0, name = <<>>  :: binary(),
	 base_id = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(), minor_type = 0,
	 map_bid = 0  :: non_neg_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 dir = 0  :: non_neg_integer(),
	 act_type = ""  :: bitstring(), looks = []  :: [tuple()],
	 status = 0  :: non_neg_integer(),
	 quest_id = 0  :: non_neg_integer(),
	 quest_prog_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer()}).

-record(drama_play,
	{id = 0  :: non_neg_integer(),
	 act_type = 0  :: non_neg_integer(),
	 label = act  :: atom(),
	 base_id = 0  :: non_neg_integer(),
	 map_bid = 0  :: non_neg_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(),
	 val = 0  :: non_neg_integer(), name = <<>>  :: binary(),
	 desc = <<>>  :: binary()}).

-record(drama_quest_unit,
	{label, id = 0, base_id = 0, type = 0, pos, dir,
	 act_type, is_rand_pos = 0  :: 0 | 1}).

-file("src/mod/role/role_gain.erl", 40).

-file("inc/weekly.hrl", 1).

-record(m_weekly,
	{ver = 1, used_partners = [], get_partner = [],
	 get_gold = 0, get_high_recruit = 0, get_crystal = 0,
	 get_sprite = [], send_point = 0}).

-record(role_weekly_report,
	{ver = 1, rid = {{0, <<>>}, 0}, end_time = 0,
	 account = <<>>, name = <<>>, lev = 1, face_id = 0,
	 power = 0, channel = 0, have_partners = [],
	 used_partners = [], get_partner = [], get_gold = 0,
	 get_high_recruit = 0, get_crystal = 0, get_sprite = [],
	 send_point = 0, login_day = 0, acc_time = 0,
	 arena_elite_lev = 0, arena_cluster_rank = 0,
	 star_tower_rank = 0, arena_score = 0, endless_rank = 0,
	 sky_ladder_rank = 0, cluster_champion_rank = 0,
	 arena_team_rank = 0, element_rank = 0, drama_rate = 0,
	 tag_list = [], ext = []}).

-file("src/mod/role/role_gain.erl", 41).

-file("inc/personal_push.hrl", 1).

-record(m_personal_push,
	{ver = 1, fire_type = [], fire_not_buy = [],
	 fire_gift = [], ext = []}).

-record(personal_push_gift_data,
	{gift_id = 0, type_id = 0, charge_id = 0,
	 limit_count = 0, money = 0, costly_num = 0,
	 valid_time = 0, open_cond = [], warehouse_id = [],
	 award = [], over_time = 0, buy_count = 0,
	 trigger_id = 0}).

-file("src/mod/role/role_gain.erl", 42).

-record(role_gain_args,
	{refresh_items = [], push_assets = [],
	 push_holiday_assets = [], ext_args = [],
	 refresh_partners = []  :: [integer()],
	 refresh_partner_artiface = []  :: [#item{}], evts = [],
	 log_name = <<>>}).

-spec do(#role{}, [#gain{} | #loss{}]) -> {ok,
					   #role{}} |
					  {false, #gain{} | #loss{}}.

do(Role, List) ->
    case do(Role, List, #gain_loss_opts{}) of
      {ok, NewRole, _RtnOpts} -> {ok, NewRole};
      {false, L} -> {false, L}
    end.

-spec do(Role, List, Opts) -> {ok, NewRole,
			       #gain_loss_opts{}} |
			      {false, GL} | {false, Msg} when Role :: #role{},
							      List :: [#gain{} |
								       #loss{}],
							      Opts ::
								  #gain_loss_opts{},
							      NewRole ::
								  #role{},
							      GL :: #gain{} |
								    #loss{},
							      Msg :: binary().

do(Role, [], DoOpts) -> {ok, Role, DoOpts};
do(Role, List, DoOpts = #gain_loss_opts{}) ->
    case to_do(List, Role, DoOpts) of
      {ok, NewRole, NewDoOpts, _FailList} ->
	  {ok, NewRole, NewDoOpts};
      {false, L} -> {false, L}
    end;
do(#role{name = Name}, _List, DoOpts) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_gain100, _,
       {__Levelrole_gain100, __Tracesrole_gain100}}
	  when __Levelrole_gain100 band 8 /= 0 orelse
		 __Tracesrole_gain100 /= [] ->
	  lager:do_log(error,
		       [{module, role_gain}, {function, do}, {line, 100},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[name:~ts]错误损益操作参数:~w", [Name, DoOpts]),
		       none, 4096, 8, __Levelrole_gain100,
		       __Tracesrole_gain100, lager_event, __Pidrole_gain100);
      _ -> ok
    end,
    {false,
     lang:get(<<"Thông số hoạt động lãi lỗ sai"/utf8>>)}.

-spec do_mail(#role{}, list(), bitstring(), bitstring(),
	      bitstring()) -> {ok, #role{}, #gain_loss_opts{}} |
			      {false, bitstring()}.

do_mail(Role, GL, Title, Subject, Remark) ->
    do_mail(Role, GL, Title, Subject, Remark,
	    #gain_loss_opts{}).

do_mail(Role, [], _Title, _Subject, _Remark, DoOpts) ->
    {ok, Role, DoOpts};
do_mail(Role, GL, Title, Subject, Remark, DoOpts) ->
    case to_do(GL, Role, DoOpts) of
      {ok, NRole, Opts, []} -> {ok, NRole, Opts};
      {ok, Role1, Opts, FailList} ->
	  {Items, Assets} = format:gain_to_items_assets(FailList),
	  {ok, NRole} = mail:add(Role1,
				 {Title, Subject, Assets, Items, Remark}),
	  {ok, NRole, Opts};
      {false, _} ->
	  {Items, Assets} = format:gain_to_items_assets(GL),
	  {ok, NRole} = mail:add(Role,
				 {Title, Subject, Assets, Items, Remark}),
	  {ok, NRole, DoOpts}
    end.

do_mail_and_notice(Role, GL, Title, Subject, Remark) ->
    do_mail_and_notice(Role, GL, Title, Subject, Remark,
		       #gain_loss_opts{}).

do_mail_and_notice(Role, [], _Title, _Subject, _Remark,
		   DoOpts) ->
    {ok, Role, DoOpts};
do_mail_and_notice(Role, GL, Title, Subject, Remark,
		   DoOpts) ->
    case to_do(GL, Role, DoOpts) of
      {ok, NRole, Opts, []} ->
	  gain_notice(NRole, Opts, DoOpts), {ok, NRole, Opts};
      {ok, Role1, Opts, FailList} ->
	  {Items, Assets} = format:gain_to_items_assets(FailList),
	  {ok, NRole} = mail:add(Role1,
				 {Title, Subject, Assets, Items, Remark}),
	  gain_notice(NRole, Opts, DoOpts),
	  {ok, NRole, Opts};
      {false, _} ->
	  {Items, Assets} = format:gain_to_items_assets(GL),
	  {ok, NRole} = mail:add(Role,
				 {Title, Subject, Assets, Items, Remark}),
	  {ok, NRole, DoOpts}
    end.

-spec do_notice(list(), #role{}, pos_integer()) -> {ok,
						    #role{}} |
						   {false, #loss{} | #gain{}}.

do_notice(Role, List) ->
    do_notice(Role, List, #gain_loss_opts{}).

do_notice(Role, List, NoticeOpt = #gain_loss_opts{}) ->
    case to_do(List, Role, NoticeOpt) of
      {ok, NewRole, GLOpts = #gain_loss_opts{}, _FailList} ->
	  gain_notice(NewRole, GLOpts, NoticeOpt), {ok, NewRole};
      Other -> Other
    end;
do_notice(Role, List, ShowType)
    when is_integer(ShowType) ->
    NoticeOpt = #gain_loss_opts{type = ShowType},
    do_notice(Role, List, NoticeOpt).

-spec init_log() -> ok.

init_log() ->
    put(role_loss_items, []),
    put(role_gain_items, []),
    put(role_gain_log_items, []).

auto_sell_eqm(Role) ->
    case erase(auto_sell_eqm_list) of
      L = [_ | _] -> ok, role:redirect(Role, 10522, {3, L});
      _ -> skip
    end.

to_do(List, Role = #role{}, DoOpts) ->
    case preprocess_items(List, Role, DoOpts) of
      {ok, List1} ->
	  fun_call:trans_begin(),
	  init_log(),
	  case gl_all(List1, Role, [],
		      #role_gain_args{log_name =
					  DoOpts#gain_loss_opts.log_name},
		      DoOpts#gain_loss_opts.is_continue, [])
	      of
	    {ok, GlRole, NewGL, Args = #role_gain_args{evts = Evts},
	     FailList} ->
		GainRole = refresh(Args, GlRole#role{is_gain = 1}),
		NRole = role_trigger:fire(lists:reverse(Evts),
					  GainRole),
		fun_call:trans_flush(),
		NewDoOpts = DoOpts#gain_loss_opts{return_gl = NewGL},
		{ok, NRole, NewDoOpts, FailList};
	    {false, L} ->
		gl_fail(Role, L, DoOpts),
		fun_call:trans_clean(),
		NewL = gl_fail_no_notice(L, DoOpts),
		{false, NewL}
	  end;
      {false, G} -> {false, G}
    end.

-spec gl_all(GL, Role, AccGL, Args, IsContinue,
	     FailList) -> {ok, NewRole, NewGL, NewArgs,
			   NewFailList} |
			  {false, False} when GL :: [#gain{} | #loss{}],
					      AccGL :: [#gain{} | #loss{}],
					      NewGL :: [#gain{} | #loss{}],
					      Role :: #role{},
					      NewRole :: #role{},
					      False :: #gain{} | #loss{},
					      Args :: #role_gain_args{},
					      IsContinue :: false | true,
					      FailList :: [#gain{} | #loss{}],
					      NewArgs :: #role_gain_args{},
					      NewFailList :: [#gain{} |
							      #loss{}].

gl_all([], Role, GL, Args = #role_gain_args{},
       _IsContinue, FailList) ->
    NewGL = case GL of
	      [_ | _] -> lists:reverse(GL);
	      _ -> []
	    end,
    {ok, Role, NewGL, Args, FailList};
gl_all([H | T], Role, NewGL, Args, IsContinue,
       FailList) ->
    case gl(H, Args, Role) of
      {ok, NewRole} ->
	  gl_all(T, NewRole, [H | NewGL], Args, IsContinue,
		 FailList);
      {ok, NewRole, NewArgs} ->
	  gl_all(T, NewRole, [H | NewGL], NewArgs, IsContinue,
		 FailList);
      {ok, NewRole, GL = [_ | _], NewArgs} ->
	  gl_all(T, NewRole, GL ++ NewGL, NewArgs, IsContinue,
		 FailList);
      {ok, NewRole, [], NewArgs} ->
	  gl_all(T, NewRole, NewGL, NewArgs, IsContinue,
		 FailList);
      {false, L} ->
	  case IsContinue of
	    false -> {false, L};
	    true ->
		gl_all(T, Role, NewGL, Args, IsContinue, [H | FailList])
	  end;
      _Unkown ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_gain234, _,
	     {__Levelrole_gain234, __Tracesrole_gain234}}
		when __Levelrole_gain234 band 8 /= 0 orelse
		       __Tracesrole_gain234 /= [] ->
		lager:do_log(error,
			     [{module, role_gain}, {function, gl_all},
			      {line, 234}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~s]错误的损益[GL:~w]操作的刷新返回值[Err:~w]",
					   [Role#role.name, H, _Unkown]),
			     none, 4096, 8, __Levelrole_gain234,
			     __Tracesrole_gain234, lager_event,
			     __Pidrole_gain234);
	    _ -> ok
	  end,
	  {false, H}
    end.

refresh(#role_gain_args{refresh_items = RefreshItems,
			push_assets = PushAssets,
			push_holiday_assets = PushHolidayAssets,
			ext_args = ExtArgs},
	Role = #role{id = _MixId, name = _RName,
		     account = _Account, platform = _Platform}) ->
    case lists:member(assets, PushAssets) of
      true -> role_lib:push_assets(Role);
      false -> skip
    end,
    case PushHolidayAssets of
      [_ | _] ->
	  role_lib:push_holiday_assets_ref(Role,
					   PushHolidayAssets);
      _ -> skip
    end,
    package:push_gain(RefreshItems, Role),
    case lists:keyfind(3, 1, RefreshItems) of
      {_PackType, AddEqms, _DelEqms, _RefEqms} ->
	  check_auto_sell_eqm(AddEqms,
			      var:get_var(Role, other, 3019, []));
      _ -> ok
    end,
    do_run_ext(ExtArgs, Role).

do_run_ext([], Role) -> Role;
do_run_ext([_ | T], Role) -> do_run_ext(T, Role).

update_gl_refresh(Label = assets,
		  Args = #role_gain_args{push_assets = PushAssets}) ->
    NewPushAssets = [Label | lists:delete(Label,
					  PushAssets)],
    Args#role_gain_args{push_assets = NewPushAssets};
update_gl_refresh({refresh_holiday_assets, Id, Val},
		  Args = #role_gain_args{push_holiday_assets =
					     PushAssets}) ->
    NewPushAssets = lists:keystore(Id, 1, PushAssets,
				   {Id, Val}),
    Args#role_gain_args{push_holiday_assets =
			    NewPushAssets};
update_gl_refresh({refresh_items,
		   Refresh = {Type, Add, Del, Update}},
		  Args = #role_gain_args{refresh_items = RefreshItems}) ->
    NewRefreshItems = case lists:keyfind(Type, 1,
					 RefreshItems)
			  of
			{Type, AddAcc, DelAcc, UpdateAcc} ->
			    UpdateAcc0 = [I
					  || I <- UpdateAcc,
					     not
					       lists:keymember(I#item.id,
							       #item.id,
							       Update)],
			    NewRefresh = {Type, Add ++ AddAcc, Del ++ DelAcc,
					  Update ++ UpdateAcc0},
			    lists:keystore(Type, 1, RefreshItems, NewRefresh);
			_ -> [Refresh | RefreshItems]
		      end,
    Args#role_gain_args{refresh_items = NewRefreshItems};
update_gl_refresh({refresh_partner, PartnerIds},
		  Args = #role_gain_args{refresh_partners = Ids}) ->
    Args#role_gain_args{refresh_partners =
			    lists:usort(Ids ++ PartnerIds)};
update_gl_refresh({refresh_partner_artiface,
		   AddArtifaceBag},
		  Args = #role_gain_args{refresh_partner_artiface =
					     Old}) ->
    Args#role_gain_args{refresh_partner_artiface =
			    lists:usort(Old ++ AddArtifaceBag)};
update_gl_refresh(Label, Args) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_gain304, _,
       {__Levelrole_gain304, __Tracesrole_gain304}}
	  when __Levelrole_gain304 band 8 /= 0 orelse
		 __Tracesrole_gain304 /= [] ->
	  lager:do_log(error,
		       [{module, role_gain}, {function, update_gl_refresh},
			{line, 304}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的更新损益操作参数标签[Label:~w]", [Label]), none,
		       4096, 8, __Levelrole_gain304, __Tracesrole_gain304,
		       lager_event, __Pidrole_gain304);
      _ -> ok
    end,
    Args.

gl(G = #gain{val = Val}, _Args, _Role)
    when is_integer(Val) andalso Val < 0 ->
    {false,
     G#gain{msg = lang:get(<<"Giá trị bất thường"/utf8>>)}};
gl(L = #loss{val = Val}, _Args, _Role)
    when is_integer(Val) andalso Val < 0 ->
    {false,
     L#loss{msg = lang:get(<<"Giá trị bất thường"/utf8>>)}};
gl(G = #gain{}, _Args,
   #role{name = Name, misc = #role_misc{need_captcha = 1},
	 m_drama = #m_drama{guide_list = []}}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_gain313, _,
       {__Levelrole_gain313, __Tracesrole_gain313}}
	  when __Levelrole_gain313 band 8 /= 0 orelse
		 __Tracesrole_gain313 /= [] ->
	  lager:do_log(error,
		       [{module, role_gain}, {function, gl}, {line, 313},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts 验证码锁定状态中", [Name]), none, 4096, 8,
		       __Levelrole_gain313, __Tracesrole_gain313, lager_event,
		       __Pidrole_gain313);
      _ -> ok
    end,
    captcha:check(monitor, 0, {}),
    {false,
     G#gain{msg =
		lang:get(<<"Vui lòng xác minh trước"/utf8>>)}};
gl(L = #loss{}, _Args,
   #role{name = Name, misc = #role_misc{need_captcha = 1},
	 m_drama = #m_drama{guide_list = []}}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_gain317, _,
       {__Levelrole_gain317, __Tracesrole_gain317}}
	  when __Levelrole_gain317 band 8 /= 0 orelse
		 __Tracesrole_gain317 /= [] ->
	  lager:do_log(error,
		       [{module, role_gain}, {function, gl}, {line, 317},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts 验证码锁定状态中", [Name]), none, 4096, 8,
		       __Levelrole_gain317, __Tracesrole_gain317, lager_event,
		       __Pidrole_gain317);
      _ -> ok
    end,
    captcha:check(monitor, 0, {}),
    {false,
     L#loss{msg =
		lang:get(<<"Vui lòng xác minh trước"/utf8>>)}};
gl(G = #gain{label = exp, val = AddVal},
   Args = #role_gain_args{},
   Role = #role{lev = Lev, assets = #assets{exp = Exp}}) ->
    NewAddVal = world_lev:calc_exp(Role, AddVal),
    NewExp = Exp + NewAddVal,
    Gains = [G#gain{val = NewAddVal}],
    case get_next_lev(Role, NewExp) of
      {ok, {Lev, NExp},
       NextRole = #role{assets = NextAssets}} ->
	  NewAssets = NextAssets#assets{exp = NExp},
	  NewRole = NextRole#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets, Args),
	  add_log_item(gain, {5, NewAddVal}),
	  {ok, NewRole, Gains, NewArgs};
      {ok, {NewLev, RestExp},
       NextRole = #role{assets = NextAssets}} ->
	  NewAssets = NextAssets#assets{exp = RestExp},
	  NewRole = NextRole#role{lev = NewLev,
				  uplev_time = date:unixtime(),
				  assets = NewAssets, need_sync = 1},
	  NewArgs = update_gl_refresh(assets, Args),
	  add_log_item(gain, {5, NewAddVal}),
	  {ok, NewRole, Gains, NewArgs}
    end;
gl(G = #gain{label = gold_acc, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{gold_acc = GoldAcc}}) ->
    NewAssets = Assets#assets{gold_acc =
				  min(GoldAcc + Val, 4200000000)},
    Gains = [G],
    NewArgs = update_gl_refresh(assets, Args),
    NewRole = Role#role{assets = NewAssets},
    {ok, NewRole, Gains, NewArgs};
gl(G = #gain{label = vip_exp, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{vip_exp = VipExp}}) ->
    NewVipExp = min(VipExp + Val, 4200000000),
    NewAssets = Assets#assets{vip_exp = NewVipExp},
    Gains = [G],
    NewRole = vip:calc_lev(Role#role{assets = NewAssets,
				     need_sync = 1}),
    NewArgs = update_gl_refresh(assets, Args),
    {ok, NewRole, Gains, NewArgs};
gl(G = #gain{label = gold, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets = Assets = #assets{gold = Gold}}) ->
    Gains = [G],
    NewAssets = Assets#assets{gold =
				  min(Gold + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets, need_sync = 1},
    NewRole1 = role_weekly:fire(NewRole0, {add_gold, Val}),
    NewRole2 = role_trigger:fire(#evt_get_gold{count = Val},
				 NewRole1),
    NewRole = var:add_list_val(NewRole2, day, 39, 3, Val),
    NewEvts = [#evt_gain_gold{val = Val} | Evts],
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = NewEvts}),
    add_log_item(gain, {3, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = gold, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets = Assets = #assets{gold = Gold}}) ->
    case Gold >= Val of
      true ->
	  NewRole = Role#role{assets =
				  Assets#assets{gold = Gold - Val},
			      need_sync = 1},
	  NewEvts = [#evt_loss_gold{val = Val},
		     #evt_loss_assets{id = item_data:assets_atom2code(gold),
				      val = Val}
		     | Evts],
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = NewEvts}),
	  Count = var:get_list_val(NewRole, acc, 2047, 3, 0),
	  NewRole2 = var:set_list_val(NewRole, acc, 2047, 3,
				      Count + Val),
	  NewRole3 = days_rank_mgr:in_rank(loss_gold, NewRole2,
					   Val),
	  add_log_item(loss, {3, Val}),
	  {ok, NewRole3, NewArgs};
      false -> {false, L#loss{reason = no, own_val = Gold}}
    end;
gl(G = #gain{label = red_gold, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{red_gold = RedGold}}) ->
    Gains = [G],
    NewAssets = Assets#assets{red_gold =
				  min(RedGold + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets, need_sync = 1},
    NewRole = var:add_list_val(NewRole0, day, 39, 4, Val),
    NewEvts = [#evt_gain_red_gold{val = Val} | Evts],
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = NewEvts}),
    add_log_item(gain, {4, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = red_gold, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{red_gold = Gold}}) ->
    case Gold >= Val of
      true ->
	  NewRole = Role#role{assets =
				  Assets#assets{red_gold = Gold - Val},
			      need_sync = 1},
	  NewEvts = [#evt_loss_red_gold{val = Val},
		     #evt_loss_assets{id =
					  item_data:assets_atom2code(red_gold),
				      val = Val}
		     | Evts],
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = NewEvts}),
	  Count = var:get_list_val(NewRole, acc, 2047, 4, 0),
	  NewRole2 = var:set_list_val(NewRole, acc, 2047, 4,
				      Count + Val),
	  add_log_item(loss, {4, Val}),
	  {ok, NewRole2, NewArgs};
      false -> {false, L#loss{reason = no, own_val = Gold}}
    end;
gl(L = #loss{label = red_gold_or_gold, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{gold = Gold, red_gold = RedGold}}) ->
    if RedGold >= Val ->
	   NewRole = Role#role{assets =
				   Assets#assets{red_gold = RedGold - Val},
			       need_sync = 1},
	   NewEvts = [#evt_loss_red_gold{val = Val},
		      #evt_loss_assets{id =
					   item_data:assets_atom2code(red_gold),
				       val = Val}
		      | Evts],
	   NewArgs = update_gl_refresh(assets,
				       Args#role_gain_args{evts = NewEvts}),
	   Count = var:get_list_val(NewRole, acc, 2047, 4, 0),
	   NewRole2 = var:set_list_val(NewRole, acc, 2047, 4,
				       Count + Val),
	   add_log_item(loss, {4, Val}),
	   {ok, NewRole2, [#loss{label = red_gold, val = Val}],
	    NewArgs};
       Gold + RedGold >= Val ->
	   SubGold = Val - RedGold,
	   NewGold = Gold - SubGold,
	   NewRole = Role#role{assets =
				   Assets#assets{gold = NewGold, red_gold = 0},
			       need_sync = 1},
	   NewEvts = [#evt_loss_gold{val = SubGold},
		      #evt_loss_red_gold{val = RedGold},
		      #evt_loss_red_gold_or_gold{val = Val},
		      #evt_loss_assets{id =
					   item_data:assets_atom2code(red_gold),
				       val = RedGold},
		      #evt_loss_assets{id = item_data:assets_atom2code(gold),
				       val = SubGold}
		      | Evts],
	   NewArgs = update_gl_refresh(assets,
				       Args#role_gain_args{evts = NewEvts}),
	   Count = var:get_list_val(NewRole, acc, 2047, 3, 0),
	   RedCount = var:get_list_val(NewRole, acc, 2047, 4, 0),
	   NewRole2 = var:set_list_val(NewRole, acc, 2047, 3,
				       Count + SubGold),
	   NewRole3 = var:set_list_val(NewRole2, acc, 2047, 4,
				       RedCount + RedGold),
	   NewRole4 = days_rank_mgr:in_rank(loss_gold, NewRole3,
					    SubGold),
	   add_log_item(loss, [{3, SubGold}, {4, RedGold}]),
	   {ok, NewRole4,
	    [#loss{label = red_gold, val = RedGold},
	     #loss{label = gold, val = SubGold}],
	    NewArgs};
       true -> {false, L#loss{reason = no, own_val = Gold}}
    end;
gl(G = #gain{label = coin, val = Val, flag = Flag},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets = Assets = #assets{coin = Coin}}) ->
    Gains = [G],
    NewAssets = Assets#assets{coin =
				  min(Coin + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = assets:add_day_val(NewRole0, Flag, 1, Val),
    NewEvts = [#evt_gain_coin{val = Val} | Evts],
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = NewEvts}),
    add_log_item(gain, {1, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = coin, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets = Assets = #assets{coin = Coin}}) ->
    case Coin >= Val of
      true ->
	  NewAssets = Assets#assets{coin = Coin - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewEvts = [#evt_loss_coin{val = Val} | Evts],
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = NewEvts}),
	  Count = var:get_list_val(NewRole, acc, 2047, 1, 0),
	  NewRole2 = var:set_list_val(NewRole, acc, 2047, 1,
				      Count + Val),
	  add_log_item(loss, {1, Val}),
	  {ok, NewRole2, NewArgs};
      false -> {false, L#loss{reason = no, own_val = Coin}}
    end;
gl(G = #gain{label = silver_coin, val = Val,
	     flag = Flag},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{silver_coin = Coin}}) ->
    Gains = [G],
    NewAssets = Assets#assets{silver_coin =
				  min(Coin + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = assets:add_day_val(NewRole0, Flag, 2, Val),
    NewEvts = [#evt_gain_silver_coin{val = Val} | Evts],
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = NewEvts}),
    add_log_item(gain, {2, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = silver_coin, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{silver_coin = Coin}}) ->
    case Coin >= Val of
      true ->
	  NewAssets = Assets#assets{silver_coin = Coin - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewEvts = [#evt_loss_silver_coin{val = Val} | Evts],
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = NewEvts}),
	  Count = var:get_list_val(NewRole, acc, 2047, 2, 0),
	  NewRole2 = var:set_list_val(NewRole, acc, 2047, 2,
				      Count + Val),
	  add_log_item(loss, {2, Val}),
	  {ok, NewRole2, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no, own_val = Coin,
		  msg = lang:get(<<"Tiền bạc không đủ"/utf8>>)}}
    end;
gl(G = #gain{label = energy, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{energy = Value}}) ->
    Gains = [G],
    NewAssets = Assets#assets{energy =
				  min(Value + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 7, Val),
    NewEvts = [#evt_gain_energy{val = Val} | Evts],
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = NewEvts}),
    add_log_item(gain, {7, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = energy, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{energy = OldValue}}) ->
    case OldValue >= Val of
      true ->
	  NewAssets = Assets#assets{energy = OldValue - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewEvts = [#evt_loss_energy{val = Val} | Evts],
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = NewEvts}),
	  add_log_item(loss, {7, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false, L#loss{reason = no, own_val = OldValue}}
    end;
gl(G = #gain{label = hero_exp, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{hero_exp = Value}}) ->
    Gains = [G],
    NewAssets = Assets#assets{hero_exp =
				  min(Value + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 22, Val),
    NewArgs = update_gl_refresh(assets, Args),
    add_log_item(gain, {22, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = hero_exp, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{hero_exp = OldValue}}) ->
    case OldValue >= Val of
      true ->
	  NewAssets = Assets#assets{hero_exp = OldValue - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewEvts = [#evt_loss_hero_exp{val = Val} | Evts],
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = NewEvts}),
	  add_log_item(loss, {22, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg =
		      lang:get(<<"Kinh nghiệm anh hùng không đủ"/utf8>>),
		  own_val = OldValue}}
    end;
gl(G = #gain{label = arena_cent, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{arena_cent = Value}}) ->
    Gains = [G],
    NewAssets = Assets#assets{arena_cent =
				  min(Value + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 8, Val),
    NewArgs = update_gl_refresh(assets, Args),
    add_log_item(gain, {8, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = arena_cent, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{arena_cent = OldValue}}) ->
    case OldValue >= Val of
      true ->
	  NewAssets = Assets#assets{arena_cent = OldValue - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets, Args),
	  add_log_item(loss, {8, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg =
		      lang:get(<<"Danh Vọng Đấu Trường không đủ"/utf8>>),
		  own_val = OldValue}}
    end;
gl(G = #gain{label = arena_guesscent, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{arena_guesscent = Value}}) ->
    Gains = [G],
    NewAssets = Assets#assets{arena_guesscent =
				  min(Value + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 20, Val),
    NewArgs = update_gl_refresh(assets, Args),
    add_log_item(gain, {20, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = arena_guesscent, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{arena_guesscent = OldValue}}) ->
    case OldValue >= Val of
      true ->
	  NewAssets = Assets#assets{arena_guesscent =
					OldValue - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets, Args),
	  add_log_item(loss, {20, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Không đủ Điểm Vô Địch"/utf8>>),
		  own_val = OldValue}}
    end;
gl(G = #gain{label = cluster_guess_cent, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{cluster_guess_cent = Value}}) ->
    Gains = [G],
    NewAssets = Assets#assets{cluster_guess_cent =
				  min(Value + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 34, Val),
    NewArgs = update_gl_refresh(assets, Args),
    add_log_item(gain, {34, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = cluster_guess_cent, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{cluster_guess_cent = OldValue}}) ->
    case OldValue >= Val of
      true ->
	  NewAssets = Assets#assets{cluster_guess_cent =
					OldValue - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets, Args),
	  add_log_item(loss, {34, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Xu Gia Tộc chiến không đủ"/utf8>>),
		  own_val = OldValue}}
    end;
gl(G = #gain{label = peak_guess_cent, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{peak_guess_cent = Value}}) ->
    Gains = [G],
    NewAssets = Assets#assets{peak_guess_cent =
				  min(Value + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 38, Val),
    NewArgs = update_gl_refresh(assets, Args),
    add_log_item(gain, {38, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = peak_guess_cent, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{peak_guess_cent = OldValue}}) ->
    case OldValue >= Val of
      true ->
	  NewAssets = Assets#assets{peak_guess_cent =
					OldValue - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets, Args),
	  add_log_item(loss, {38, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Xu Đặc Quyền không đủ"/utf8>>),
		  own_val = OldValue}}
    end;
gl(G = #gain{label = feather_exchange, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{feather_exchange = Value}}) ->
    Gains = [G],
    NewAssets = Assets#assets{feather_exchange =
				  min(Value + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 35, Val),
    NewArgs = update_gl_refresh(assets, Args),
    add_log_item(gain, {35, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = feather_exchange, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{feather_exchange = OldValue}}) ->
    case OldValue >= Val of
      true ->
	  NewAssets = Assets#assets{feather_exchange =
					OldValue - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets, Args),
	  add_log_item(loss, {35, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Thiếu Vé Ramen"/utf8>>),
		  own_val = OldValue}}
    end;
gl(G = #gain{label = brave_symbol, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{brave_symbol = Value}}) ->
    Gains = [G],
    NewAssets = Assets#assets{brave_symbol =
				  min(Value + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 36, Val),
    NewArgs = update_gl_refresh(assets, Args),
    add_log_item(gain, {36, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = brave_symbol, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{brave_symbol = OldValue}}) ->
    case OldValue >= Val of
      true ->
	  NewAssets = Assets#assets{brave_symbol =
					OldValue - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets, Args),
	  add_log_item(loss, {36, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Không đủ Chứng nhận Gia Tộc"/utf8>>),
		  own_val = OldValue}}
    end;
gl(G = #gain{label = activity, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{activity = Value}}) ->
    Gains = [G],
    NewAssets = Assets#assets{activity =
				  min(Value + Val, 4200000000)},
    NewRole = Role#role{assets = NewAssets},
    NewEvts = [#evt_gain_activity{val = Val} | Evts],
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = NewEvts}),
    add_log_item(gain, {9, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(G = #gain{label = guild, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{guild = OldVal}}) ->
    Gains = [G],
    NewAssets = Assets#assets{guild =
				  min(OldVal + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets, need_sync = 1},
    NewRole = var:add_list_val(NewRole0, day, 39, 10, Val),
    NewEvts = [#evt_gain_guild{val = Val} | Evts],
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = NewEvts}),
    add_log_item(gain, {10, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = guild, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{guild = OldVal}}) ->
    case OldVal >= Val of
      true ->
	  NewRole = Role#role{assets =
				  Assets#assets{guild = OldVal - Val},
			      need_sync = 1},
	  NewEvts = [#evt_loss_guild{val = Val} | Evts],
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = NewEvts}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Đóng góp của hội không đủ"/utf8>>),
		  own_val = OldVal}}
    end;
gl(G = #gain{label = friend_point, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{friend_point = Value}}) ->
    Gains = [G],
    NewAssets = Assets#assets{friend_point =
				  min(Value + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 14, Val),
    NewArgs = update_gl_refresh(assets, Args),
    add_log_item(gain, {14, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = friend_point, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{friend_point = OldValue}}) ->
    case OldValue >= Val of
      true ->
	  NewAssets = Assets#assets{friend_point =
					OldValue - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets, Args),
	  add_log_item(loss, {14, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Không đủ điểm tình bạn"/utf8>>),
		  own_val = OldValue}}
    end;
gl(G = #gain{label = boss_point, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{boss_point = Value}}) ->
    Gains = [G],
    NewAssets = Assets#assets{boss_point =
				  min(Value + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 13, Val),
    NewArgs = update_gl_refresh(assets, Args),
    add_log_item(gain, {13, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = boss_point, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{boss_point = OldValue}}) ->
    case OldValue >= Val of
      true ->
	  NewAssets = Assets#assets{boss_point = OldValue - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets, Args),
	  add_log_item(loss, {13, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg =
		      lang:get(<<"Không đủ mảnh trang bị màu cam"/utf8>>),
		  own_val = OldValue}}
    end;
gl(G = #gain{label = star_hun, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{star_hun = Value}}) ->
    Gains = [G],
    NewAssets = Assets#assets{star_hun =
				  min(Value + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 17, Val),
    NewArgs = update_gl_refresh(assets, Args),
    add_log_item(gain, {17, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = star_hun, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{star_hun = OldValue}}) ->
    case OldValue >= Val of
      true ->
	  NewAssets = Assets#assets{star_hun = OldValue - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets, Args),
	  add_log_item(loss, {17, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Linh hồn ngôi sao không đủ"/utf8>>),
		  own_val = OldValue}}
    end;
gl(G = #gain{label = star_point, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{star_point = Value}}) ->
    Gains = [G],
    NewAssets = Assets#assets{star_point =
				  min(Value + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 18, Val),
    NewArgs = update_gl_refresh(assets, Args),
    add_log_item(gain, {18, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = star_point, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{star_point = OldValue}}) ->
    case OldValue >= Val of
      true ->
	  NewAssets = Assets#assets{star_point = OldValue - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets, Args),
	  add_log_item(loss, {18, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Điểm Vòng Quay không đủ"/utf8>>),
		  own_val = OldValue}}
    end;
gl(G = #gain{label = holiday_item, val = {Id, Val}},
   Args = #role_gain_args{},
   Role = #role{holiday_assets = Assets, pid = RolePid}) ->
    MergeGoalId =
	holiday_merge_goal_data:get_const(goal_base_id),
    case Id =:= MergeGoalId of
      true ->
	  holiday_merge_goal_mgr:info({add_score, RolePid, Val});
      _ -> skip
    end,
    Gains = [G],
    OldVal = list_util:keyfind(Id, Assets, 0),
    NewAssets = lists:keystore(Id, 1, Assets,
			       {Id, Val + OldVal}),
    NewRole = Role#role{holiday_assets = NewAssets},
    day_goals_new:push_change_lev(NewRole, Id),
    holiday_war_order:push_change_lev(NewRole, Id),
    holiday_new_war_order:push_change_lev(NewRole, Id),
    NewArgs = update_gl_refresh({refresh_holiday_assets, Id,
				 Val + OldVal},
				Args),
    add_log_item(gain, {Id, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(G = #gain{label = holiday_item, val = {Id, _, Val}},
   Args = #role_gain_args{},
   Role = #role{holiday_assets = Assets, pid = RolePid}) ->
    MergeGoalId =
	holiday_merge_goal_data:get_const(goal_base_id),
    case Id =:= MergeGoalId of
      true ->
	  holiday_merge_goal_mgr:info({add_score, RolePid, Val});
      _ -> skip
    end,
    Gains = [G],
    OldVal = list_util:keyfind(Id, Assets, 0),
    NewAssets = lists:keystore(Id, 1, Assets,
			       {Id, Val + OldVal}),
    NewRole = Role#role{holiday_assets = NewAssets},
    holiday_new_war_order:push_change_lev(NewRole, Id),
    NewArgs = update_gl_refresh({refresh_holiday_assets, Id,
				 Val + OldVal},
				Args),
    add_log_item(gain, {Id, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = holiday_item,
	     val = [{Id, Val} | _]},
   Args = #role_gain_args{},
   Role = #role{holiday_assets = Assets}) ->
    OldVal = list_util:keyfind(Id, Assets, 0),
    case OldVal >= Val of
      true ->
	  NewAssets = lists:keystore(Id, 1, Assets,
				     {Id, OldVal - Val}),
	  add_log_item(loss, {Id, Val}),
	  NewRole = Role#role{holiday_assets = NewAssets},
	  NewArgs = update_gl_refresh({refresh_holiday_assets, Id,
				       OldVal - Val},
				      Args),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Thiếu công cụ"/utf8>>),
		  own_val = OldVal}}
    end;
gl(G = #gain{label = item_base_id_to_bag,
	     val = ItemInfo, flag = Flag},
   Args = #role_gain_args{evts = Evts}, Role = #role{})
    when is_list(ItemInfo) ->
    put(role_item_make_flag, Flag),
    case package:add_auto_overlap(ItemInfo, Role#role.p_bag)
	of
      {ok, NewPackage, RefItems, AddItems} ->
	  erase(role_item_make_flag),
	  Role1 = role_weekly:fire(Role,
				   {add_recruit_or_crystal, ItemInfo}),
	  Role2 = gift_trigger:fire(Role1, get_rune_lev,
				    [{7, ItemInfo}, {9, Flag}]),
	  NRole = Role2#role{p_bag = NewPackage, need_sync = 1},
	  put(role_gain_items, AddItems ++ get(role_gain_items)),
	  EvtItems = to_gain_evt(ItemInfo, [], Flag),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(gain, ItemInfo),
	  Refresh = {1, AddItems, [], RefItems},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  case [I || I = #item{type = 10} <- AddItems] of
	    ItemsT = [_ | _] ->
		{ok, NRole, [G#gain{val = ItemsT}], NewArgs};
	    _ -> {ok, NRole, NewArgs}
	  end;
      full ->
	  erase(role_item_make_flag),
	  {false,
	   G#gain{reason = bag_full,
		  msg =
		      lang:get(<<"Ba lô đã đầy, xin hãy sắp xếp lại trước"/utf8>>)}};
      Err ->
	  erase(role_item_make_flag),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_gain1061, _,
	     {__Levelrole_gain1061, __Tracesrole_gain1061}}
		when __Levelrole_gain1061 band 8 /= 0 orelse
		       __Tracesrole_gain1061 /= [] ->
		lager:do_log(error,
			     [{module, role_gain}, {function, gl}, {line, 1061},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]获得物品时发生错误[Err:~w]，无法生成物品列表:~w",
					   [Role#role.name, Err, ItemInfo]),
			     none, 4096, 8, __Levelrole_gain1061,
			     __Tracesrole_gain1061, lager_event,
			     __Pidrole_gain1061);
	    _ -> ok
	  end,
	  {false,
	   G#gain{reason = error_item,
		  msg = lang:get(<<"Đạo cụ sai, không thể thêm"/utf8>>)}}
    end;
gl(G = #gain{label = items_to_bag, val = Items,
	     flag = Flag},
   Args = #role_gain_args{evts = Evts}, Role)
    when is_list(Items) ->
    case package:add_auto_overlap(Items, Role#role.p_bag) of
      {ok, NewPackage, RefItems, AddItems} ->
	  Role1 = role_weekly:fire(Role,
				   {add_recruit_or_crystal, Items}),
	  Role2 = gift_trigger:fire(Role1, get_rune_lev,
				    [{7, Items}, {9, Flag}]),
	  NRole = Role2#role{p_bag = NewPackage, need_sync = 1},
	  put(role_gain_items, AddItems ++ get(role_gain_items)),
	  EvtItems = to_gain_evt(Items, [], Flag),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(gain, Items),
	  Refresh = {1, AddItems, [], RefItems},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  {ok, NRole, NewArgs};
      full ->
	  {false,
	   G#gain{reason = bag_full,
		  msg =
		      lang:get(<<"Ba lô đã đầy, việc thêm vật phẩm không "
				 "thành công"/utf8>>)}};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_gain1084, _,
	     {__Levelrole_gain1084, __Tracesrole_gain1084}}
		when __Levelrole_gain1084 band 8 /= 0 orelse
		       __Tracesrole_gain1084 /= [] ->
		lager:do_log(error,
			     [{module, role_gain}, {function, gl}, {line, 1084},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]获得物品时发生错误[Err:~w]，无法生成物品列表:~w",
					   [Role#role.name, Err, Items]),
			     none, 4096, 8, __Levelrole_gain1084,
			     __Tracesrole_gain1084, lager_event,
			     __Pidrole_gain1084);
	    _ -> ok
	  end,
	  {false,
	   G#gain{reason = error_item,
		  msg = lang:get(<<"Đạo cụ sai, không thể thêm"/utf8>>)}}
    end;
gl(G = #gain{label = item_base_id_to_eqm_bag,
	     val = ItemInfo, flag = Flag},
   Args = #role_gain_args{evts = Evts}, Role = #role{})
    when is_list(ItemInfo) ->
    case package:add_auto_overlap(ItemInfo, Role#role.p_eqm)
	of
      {ok, NewPackage, RefItems, AddItems} ->
	  Role1 = gift_trigger:fire(Role, holy_eqm,
				    [{8, ItemInfo}, {9, Flag}]),
	  NRole = Role1#role{p_eqm = NewPackage, need_sync = 1},
	  put(role_gain_items, AddItems ++ get(role_gain_items)),
	  EvtItems = to_gain_evt(ItemInfo, [], Flag),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(gain, ItemInfo),
	  Refresh = {3, AddItems, [], RefItems},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  case [I
		|| I = #item{type = Type} <- AddItems,
		   lists:member(Type, [23, 24, 25, 26])]
	      of
	    ItemsT = [_ | _] ->
		{ok, NRole, [G#gain{val = ItemsT}], NewArgs};
	    _ -> {ok, NRole, NewArgs}
	  end;
      full ->
	  {false,
	   G#gain{reason = eqm_bag_full,
		  msg =
		      lang:get(<<"Ba lô trang bị đã đầy, việc thêm vật "
				 "phẩm không thành công"/utf8>>)}};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_gain1113, _,
	     {__Levelrole_gain1113, __Tracesrole_gain1113}}
		when __Levelrole_gain1113 band 8 /= 0 orelse
		       __Tracesrole_gain1113 /= [] ->
		lager:do_log(error,
			     [{module, role_gain}, {function, gl}, {line, 1113},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]获得物品时发生错误[Err:~w]，无法生成物品列表:~w",
					   [Role#role.name, Err, ItemInfo]),
			     none, 4096, 8, __Levelrole_gain1113,
			     __Tracesrole_gain1113, lager_event,
			     __Pidrole_gain1113);
	    _ -> ok
	  end,
	  {false,
	   G#gain{reason = error_item,
		  msg =
		      lang:get(<<"Vật phẩm trang bị sai, không thể thêm "
				 "vào"/utf8>>)}}
    end;
gl(G = #gain{label = item_base_id_to_pet_bag,
	     val = ItemInfo, flag = Flag},
   Args = #role_gain_args{evts = Evts}, Role = #role{})
    when is_list(ItemInfo) ->
    case package:add_auto_overlap(ItemInfo,
				  Role#role.pet_bag)
	of
      {ok, NewPackage, RefItems, AddItems} ->
	  NRole = Role#role{pet_bag = NewPackage, need_sync = 1},
	  put(role_gain_items, AddItems ++ get(role_gain_items)),
	  EvtItems = to_gain_evt(ItemInfo, [], Flag),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(gain, ItemInfo),
	  Refresh = {5, AddItems, [], RefItems},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  {ok, NRole, NewArgs};
      full ->
	  {false,
	   G#gain{reason = pet_bag_full,
		  msg =
		      lang:get(<<"Ba lô thú cưng đã đầy và không thêm "
				 "được vật phẩm"/utf8>>)}};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_gain1135, _,
	     {__Levelrole_gain1135, __Tracesrole_gain1135}}
		when __Levelrole_gain1135 band 8 /= 0 orelse
		       __Tracesrole_gain1135 /= [] ->
		lager:do_log(error,
			     [{module, role_gain}, {function, gl}, {line, 1135},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]获得物品时发生错误[Err:~w]，无法生成物品列表:~w",
					   [Role#role.name, Err, ItemInfo]),
			     none, 4096, 8, __Levelrole_gain1135,
			     __Tracesrole_gain1135, lager_event,
			     __Pidrole_gain1135);
	    _ -> ok
	  end,
	  {false,
	   G#gain{reason = error_item,
		  msg =
		      lang:get(<<"Vật phẩm thú cưng không đúng, không "
				 "thể thêm vào"/utf8>>)}}
    end;
gl(G = #gain{label = items_to_pet_bag, val = Items,
	     flag = Flag},
   Args = #role_gain_args{evts = Evts}, Role)
    when is_list(Items) ->
    case package:add_auto_overlap(Items, Role#role.pet_bag)
	of
      {ok, NewPackage, RefItems, AddItems} ->
	  NRole = Role#role{pet_bag = NewPackage, need_sync = 1},
	  put(role_gain_items, AddItems ++ get(role_gain_items)),
	  EvtItems = to_gain_evt(Items, [], Flag),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(gain, Items),
	  Refresh = {5, AddItems, [], RefItems},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  {ok, NRole, NewArgs};
      full ->
	  {false,
	   G#gain{reason = eqm_bag_full,
		  msg =
		      lang:get(<<"Balo thú cưng đã đầy và không thêm được "
				 "vật phẩm cho thú cưng."/utf8>>)}};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_gain1156, _,
	     {__Levelrole_gain1156, __Tracesrole_gain1156}}
		when __Levelrole_gain1156 band 8 /= 0 orelse
		       __Tracesrole_gain1156 /= [] ->
		lager:do_log(error,
			     [{module, role_gain}, {function, gl}, {line, 1156},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]获得物品时发生错误[Err:~w]，无法生成物品列表:~w",
					   [Role#role.name, Err, Items]),
			     none, 4096, 8, __Levelrole_gain1156,
			     __Tracesrole_gain1156, lager_event,
			     __Pidrole_gain1156);
	    _ -> ok
	  end,
	  {false,
	   G#gain{reason = error_item,
		  msg =
		      lang:get(<<"Vật phẩm thú cưng không đúng, không "
				 "thể thêm vào"/utf8>>)}}
    end;
gl(G = #gain{label = items_to_eqm_bag, val = Items,
	     flag = Flag},
   Args = #role_gain_args{evts = Evts}, Role)
    when is_list(Items) ->
    case package:add_auto_overlap(Items, Role#role.p_eqm) of
      {ok, NewPackage, RefItems, AddItems} ->
	  Role1 = gift_trigger:fire(Role, holy_eqm,
				    [{8, Items}, {9, Flag}]),
	  NRole = Role1#role{p_eqm = NewPackage, need_sync = 1},
	  put(role_gain_items, AddItems ++ get(role_gain_items)),
	  EvtItems = to_gain_evt(Items, [], Flag),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(gain, Items),
	  Refresh = {3, AddItems, [], RefItems},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  {ok, NRole, NewArgs};
      full ->
	  {false,
	   G#gain{reason = eqm_bag_full,
		  msg =
		      lang:get(<<"Ba lô đã đầy, việc thêm thiết bị không "
				 "thành công"/utf8>>)}};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_gain1178, _,
	     {__Levelrole_gain1178, __Tracesrole_gain1178}}
		when __Levelrole_gain1178 band 8 /= 0 orelse
		       __Tracesrole_gain1178 /= [] ->
		lager:do_log(error,
			     [{module, role_gain}, {function, gl}, {line, 1178},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]获得物品时发生错误[Err:~w]，无法生成物品列表:~w",
					   [Role#role.name, Err, Items]),
			     none, 4096, 8, __Levelrole_gain1178,
			     __Tracesrole_gain1178, lager_event,
			     __Pidrole_gain1178);
	    _ -> ok
	  end,
	  {false,
	   G#gain{reason = error_item,
		  msg =
		      lang:get(<<"Thiết bị sai, không thể tăng"/utf8>>)}}
    end;
gl(G = #gain{label = item_base_id_to_home_bag,
	     val = ItemInfo, flag = Flag},
   Args = #role_gain_args{evts = Evts}, Role = #role{})
    when is_list(ItemInfo) ->
    case package:add_auto_overlap(ItemInfo,
				  Role#role.p_home)
	of
      {ok, NewPackage, RefItems, AddItems} ->
	  NRole = Role#role{p_home = NewPackage, need_sync = 1},
	  put(role_gain_items, AddItems ++ get(role_gain_items)),
	  EvtItems = to_gain_evt(ItemInfo, [], Flag),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(gain, ItemInfo),
	  Refresh = {4, AddItems, [], RefItems},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  {ok, NRole, NewArgs};
      full ->
	  {false,
	   G#gain{reason = home_bag_full,
		  msg =
		      lang:get(<<"Ba lô trang bị đã đầy, việc thêm vật "
				 "phẩm không thành công"/utf8>>)}};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_gain1200, _,
	     {__Levelrole_gain1200, __Tracesrole_gain1200}}
		when __Levelrole_gain1200 band 8 /= 0 orelse
		       __Tracesrole_gain1200 /= [] ->
		lager:do_log(error,
			     [{module, role_gain}, {function, gl}, {line, 1200},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]获得物品时发生错误[Err:~w]，无法生成物品列表:~w",
					   [Role#role.name, Err, ItemInfo]),
			     none, 4096, 8, __Levelrole_gain1200,
			     __Tracesrole_gain1200, lager_event,
			     __Pidrole_gain1200);
	    _ -> ok
	  end,
	  {false,
	   G#gain{reason = error_item,
		  msg =
		      lang:get(<<"Vật phẩm trang bị sai, không thể thêm "
				 "vào"/utf8>>)}}
    end;
gl(G = #gain{label = items_to_home_bag, val = Items,
	     flag = Flag},
   Args = #role_gain_args{evts = Evts}, Role)
    when is_list(Items) ->
    case package:add_auto_overlap(Items, Role#role.p_home)
	of
      {ok, NewPackage, RefItems, AddItems} ->
	  NRole = Role#role{p_home = NewPackage, need_sync = 1},
	  put(role_gain_items, AddItems ++ get(role_gain_items)),
	  EvtItems = to_gain_evt(Items, [], Flag),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(gain, Items),
	  Refresh = {4, AddItems, [], RefItems},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  {ok, NRole, NewArgs};
      full ->
	  {false,
	   G#gain{reason = home_bag_full,
		  msg =
		      lang:get(<<"Ba lô đã đầy, thêm đồ đạc không thành "
				 "công"/utf8>>)}};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_gain1221, _,
	     {__Levelrole_gain1221, __Tracesrole_gain1221}}
		when __Levelrole_gain1221 band 8 /= 0 orelse
		       __Tracesrole_gain1221 /= [] ->
		lager:do_log(error,
			     [{module, role_gain}, {function, gl}, {line, 1221},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]获得物品时发生错误[Err:~w]，无法生成物品列表:~w",
					   [Role#role.name, Err, Items]),
			     none, 4096, 8, __Levelrole_gain1221,
			     __Tracesrole_gain1221, lager_event,
			     __Pidrole_gain1221);
	    _ -> ok
	  end,
	  {false,
	   G#gain{reason = error_item,
		  msg =
		      lang:get(<<"Đồ đạc không đúng, không thể thêm vào"/utf8>>)}}
    end;
gl(L = #loss{label = home_item_id, val = ItemInfo,
	     flag = _Flag},
   Args = #role_gain_args{evts = Evts}, Role)
    when is_list(ItemInfo) ->
    NewItemInfo = item_lib:merge(ItemInfo, []),
    case package:del(by_id, Role#role.p_home, NewItemInfo)
	of
      {ok, NewPackage, DelList, FreshList} ->
	  LossItems = loss_items(NewItemInfo,
				 DelList ++ FreshList, []),
	  LogItems = merge_items(LossItems,
				 util:get(role_loss_items, [])),
	  put(role_loss_items, LogItems),
	  EvtItems = to_loss_evt(LossItems, []),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(loss, LossItems),
	  NewRole = Role#role{p_home = NewPackage, need_sync = 1},
	  Refresh = {4, [], DelList, FreshList},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  {ok, NewRole, NewArgs};
      {false, Reason, FailItem} ->
	  {false, L#loss{msg = Reason, val = [FailItem]}}
    end;
gl(L = #loss{label = eqm_item_id, val = ItemInfo,
	     flag = _Flag},
   Args = #role_gain_args{evts = Evts}, Role)
    when is_list(ItemInfo) ->
    NewItemInfo = item_lib:merge(ItemInfo, []),
    case package:del(by_id, Role#role.p_eqm, NewItemInfo) of
      {ok, NewPackage, DelList, FreshList} ->
	  LossItems = loss_items(NewItemInfo,
				 DelList ++ FreshList, []),
	  LogItems = merge_items(LossItems,
				 util:get(role_loss_items, [])),
	  put(role_loss_items, LogItems),
	  EvtItems = to_loss_evt(LossItems, []),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(loss, LossItems),
	  NewRole = Role#role{p_eqm = NewPackage, need_sync = 1},
	  Refresh = {3, [], DelList, FreshList},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  {ok, NewRole, NewArgs};
      {false, Reason, FailItem} ->
	  {false, L#loss{msg = Reason, val = [FailItem]}}
    end;
gl(L = #loss{label = pet_item_id, val = ItemInfo,
	     flag = _Flag},
   Args = #role_gain_args{evts = Evts}, Role)
    when is_list(ItemInfo) ->
    NewItemInfo = item_lib:merge(ItemInfo, []),
    case package:del(by_id, Role#role.pet_bag, NewItemInfo)
	of
      {ok, NewPackage, DelList, FreshList} ->
	  LossItems = loss_items(NewItemInfo,
				 DelList ++ FreshList, []),
	  LogItems = merge_items(LossItems,
				 util:get(role_loss_items, [])),
	  put(role_loss_items, LogItems),
	  EvtItems = to_loss_evt(LossItems, []),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(loss, LossItems),
	  NewRole = Role#role{pet_bag = NewPackage,
			      need_sync = 1},
	  Refresh = {5, [], DelList, FreshList},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  {ok, NewRole, NewArgs};
      {false, Reason, FailItem} ->
	  {false, L#loss{msg = Reason, val = [FailItem]}}
    end;
gl(L = #loss{label = pet_item_base_id, val = ItemInfo,
	     flag = _Flag},
   Args = #role_gain_args{evts = Evts}, Role)
    when is_list(ItemInfo) ->
    NewItemInfo = item_lib:merge(ItemInfo, []),
    case package:del(by_base_id, Role#role.pet_bag,
		     NewItemInfo)
	of
      {ok, NewPackage, DelList, FreshList} ->
	  LossItems = NewItemInfo,
	  LogItems = merge_items(LossItems,
				 util:get(role_loss_items, [])),
	  put(role_loss_items, LogItems),
	  put(role_gain_item_del_flagcode, {1, LogItems}),
	  EvtItems = to_loss_evt(LossItems, []),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(loss, LossItems),
	  NewRole = Role#role{pet_bag = NewPackage,
			      need_sync = 1},
	  Refresh = {5, [], DelList, FreshList},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  {ok, NewRole, NewArgs};
      {false, Reason, FailItem} ->
	  {false, L#loss{msg = Reason, val = [FailItem]}}
    end;
gl(L = #loss{label = item_id, val = ItemInfo,
	     flag = Flag},
   Args = #role_gain_args{evts = Evts}, Role)
    when is_list(ItemInfo) ->
    NewItemInfo = item_lib:merge(ItemInfo, []),
    case package:del(by_id, Role#role.p_bag, NewItemInfo) of
      {ok, NewPackage, DelList, FreshList} ->
	  LossItems = loss_items(NewItemInfo,
				 DelList ++ FreshList, []),
	  LogItems = merge_items(LossItems,
				 util:get(role_loss_items, [])),
	  put(role_loss_items, LogItems),
	  put(role_gain_item_del_flagcode, {Flag, LogItems}),
	  EvtItems = to_loss_evt(LossItems, []),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(loss, LossItems),
	  NewRole = Role#role{p_bag = NewPackage, need_sync = 1},
	  Refresh = {1, [], DelList, FreshList},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  {ok, NewRole, NewArgs};
      {false, Reason, FailItem} ->
	  {false, L#loss{msg = Reason, val = [FailItem]}}
    end;
gl(L = #loss{label = item_base_id, val = ItemInfo,
	     flag = _Flag},
   Args = #role_gain_args{evts = Evts}, Role)
    when is_list(ItemInfo) ->
    NewItemInfo = item_lib:merge(ItemInfo, []),
    case package:del(by_base_id, Role#role.p_bag,
		     NewItemInfo)
	of
      {ok, NewPackage, DelList, FreshList} ->
	  LossItems = NewItemInfo,
	  LogItems = merge_items(LossItems,
				 util:get(role_loss_items, [])),
	  put(role_loss_items, LogItems),
	  put(role_gain_item_del_flagcode, {1, LogItems}),
	  EvtItems = to_loss_evt(LossItems, []),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(loss, LossItems),
	  NewRole = Role#role{p_bag = NewPackage, need_sync = 1},
	  Refresh = {1, [], DelList, FreshList},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  {ok, NewRole, NewArgs};
      {false, Reason, FailItem} ->
	  {false, L#loss{msg = Reason, val = [FailItem]}}
    end;
gl(L = #loss{label = item_base_id_from_eqm,
	     val = ItemInfo, flag = _Flag},
   Args = #role_gain_args{evts = Evts}, Role)
    when is_list(ItemInfo) ->
    NewItemInfo = item_lib:merge(ItemInfo, []),
    case package:del(by_base_id, Role#role.p_eqm,
		     NewItemInfo)
	of
      {ok, NewPackage, DelList, FreshList} ->
	  LossItems = NewItemInfo,
	  LogItems = merge_items(LossItems,
				 util:get(role_loss_items, [])),
	  put(role_loss_items, LogItems),
	  put(role_gain_item_del_flagcode, {1, LogItems}),
	  EvtItems = to_loss_evt(LossItems, []),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(loss, LossItems),
	  NewRole = Role#role{p_eqm = NewPackage, need_sync = 1},
	  Refresh = {3, [], DelList, FreshList},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  {ok, NewRole, NewArgs};
      {false, Reason, FailItem} ->
	  {false, L#loss{msg = Reason, val = [FailItem]}}
    end;
gl(L = #loss{label = item_base_id_from_home,
	     val = ItemInfo, flag = _Flag},
   Args = #role_gain_args{evts = Evts}, Role)
    when is_list(ItemInfo) ->
    NewItemInfo = item_lib:merge(ItemInfo, []),
    case package:del(by_base_id, Role#role.p_home,
		     NewItemInfo)
	of
      {ok, NewPackage, DelList, FreshList} ->
	  LossItems = NewItemInfo,
	  LogItems = merge_items(LossItems,
				 util:get(role_loss_items, [])),
	  put(role_loss_items, LogItems),
	  put(role_gain_item_del_flagcode, {1, LogItems}),
	  EvtItems = to_loss_evt(LossItems, []),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(loss, LossItems),
	  NewRole = Role#role{p_home = NewPackage, need_sync = 1},
	  Refresh = {4, [], DelList, FreshList},
	  NewArgs = update_gl_refresh({refresh_items, Refresh},
				      Args#role_gain_args{evts = NewEvts}),
	  {ok, NewRole, NewArgs};
      {false, Reason, FailItem} ->
	  {false, L#loss{msg = Reason, val = [FailItem]}}
    end;
gl(G = #gain{label = use_item, val = Val, flag = Flag},
   Args = #role_gain_args{evts = Evts}, Role) ->
    Item = case Val of
	     #item{} -> Val;
	     {ItemBid, Bind, Num} ->
		 #item{base_id = ItemBid, bind = Bind, quantity = Num}
	   end,
    case item_use:use_not_loss(Role, Item, [{source, Flag}])
	of
      {ok, NewRole} ->
	  EvtItems = to_gain_evt(Item),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(gain, Item),
	  {ok, NewRole, Args#role_gain_args{evts = NewEvts}};
      {ok, _, NewRole} ->
	  EvtItems = to_gain_evt(Item),
	  NewEvts = EvtItems ++ Evts,
	  add_log_item(gain, Item),
	  {ok, NewRole, Args#role_gain_args{evts = NewEvts}};
      {false, Msg} -> {false, G#gain{msg = Msg}}
    end;
gl(G = #gain{label = hero_soul, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{hero_soul = AllPoint}}) ->
    Gains = [G],
    NewAssets = Assets#assets{hero_soul =
				  min(AllPoint + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 11, Val),
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = Evts}),
    add_log_item(gain, {11, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = hero_soul, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{hero_soul = AllPoint}}) ->
    case AllPoint >= Val of
      true ->
	  NewAssets = Assets#assets{hero_soul = AllPoint - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewEvts = [#evt_loss_hero_soul{val = Val} | Evts],
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = NewEvts}),
	  Count = var:get_list_val(NewRole, acc, 2047, 11, 0),
	  NewRole2 = var:set_list_val(NewRole, acc, 2047, 11,
				      Count + Val),
	  add_log_item(loss, {11, Val}),
	  {ok, NewRole2, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Thiếu Pha Lê Ninja"/utf8>>),
		  own_val = AllPoint}}
    end;
gl(G = #gain{label = sky_coin, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{sky_coin = SkyCoin}}) ->
    Gains = [G],
    NewAssets = Assets#assets{sky_coin =
				  min(SkyCoin + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 21, Val),
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = Evts}),
    add_log_item(gain, {21, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = sky_coin, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{sky_coin = SkyCoin}}) ->
    case SkyCoin >= Val of
      true ->
	  NewAssets = Assets#assets{sky_coin = SkyCoin - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = Evts}),
	  add_log_item(loss, {21, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Điểm thang không đủ"/utf8>>),
		  own_val = SkyCoin}}
    end;
gl(G = #gain{label = recruit_hero, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{recruit_hero = RecruitHero,
				     acc_recruit_hero = AccRecruitHero}}) ->
    Gains = [G],
    NewAssets = Assets#assets{recruit_hero =
				  min(RecruitHero + Val, 4200000000),
			      acc_recruit_hero = AccRecruitHero + Val},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 23, Val),
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = Evts}),
    add_log_item(gain, {23, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = recruit_hero, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{recruit_hero = RecruitHero}}) ->
    case RecruitHero >= Val of
      true ->
	  NewAssets = Assets#assets{recruit_hero =
					RecruitHero - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = Evts}),
	  add_log_item(loss, {23, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Điểm triệu hồi không đủ"/utf8>>),
		  own_val = RecruitHero}}
    end;
gl(G = #gain{label = predict_point, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{predict_point = PredictPoint}}) ->
    Gains = [G],
    NewAssets = Assets#assets{predict_point =
				  min(PredictPoint + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 39, Val),
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = Evts}),
    add_log_item(gain, {39, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = predict_point, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{predict_point = PredictPoint}}) ->
    case PredictPoint >= Val of
      true ->
	  NewAssets = Assets#assets{predict_point =
					PredictPoint - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = Evts}),
	  add_log_item(loss, {39, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Thẻ Sao Không Đủ"/utf8>>),
		  own_val = PredictPoint}}
    end;
gl(G = #gain{label = recruithigh_hero, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{recruithigh_hero = RecruitHero}}) ->
    Gains = [G],
    NewAssets = Assets#assets{recruithigh_hero =
				  min(RecruitHero + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 24, Val),
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = Evts}),
    add_log_item(gain, {24, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = recruithigh_hero, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{recruithigh_hero = RecruitHero}}) ->
    case RecruitHero >= Val of
      true ->
	  NewAssets = Assets#assets{recruithigh_hero =
					RecruitHero - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = Evts}),
	  add_log_item(loss, {24, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Tinh thể Tiên tri không đủ"/utf8>>),
		  own_val = RecruitHero}}
    end;
gl(G = #gain{label = expedition_medal, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{expedition_medal =
					 ExpeditionMedal}}) ->
    Gains = [G],
    NewAssets = Assets#assets{expedition_medal =
				  min(ExpeditionMedal + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 25, Val),
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = Evts}),
    add_log_item(gain, {25, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = expedition_medal, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{expedition_medal =
					 ExpeditionMedal}}) ->
    case ExpeditionMedal >= Val of
      true ->
	  NewAssets = Assets#assets{expedition_medal =
					ExpeditionMedal - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = Evts}),
	  add_log_item(loss, {25, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg =
		      lang:get(<<"Huy chương thám hiểm không đủ"/utf8>>),
		  own_val = ExpeditionMedal}}
    end;
gl(G = #gain{label = elite_coin, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{elite_coin = EliteCoin}}) ->
    Gains = [G],
    NewAssets = Assets#assets{elite_coin =
				  min(EliteCoin + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 27, Val),
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = Evts}),
    add_log_item(gain, {27, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = elite_coin, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{elite_coin = EliteCoin}}) ->
    case EliteCoin >= Val of
      true ->
	  NewAssets = Assets#assets{elite_coin = EliteCoin - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = Evts}),
	  add_log_item(loss, {27, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg =
		      lang:get(<<"Không đủ biểu tượng tinh nhuệ"/utf8>>),
		  own_val = EliteCoin}}
    end;
gl(G = #gain{label = holy_eqm_coin, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{holy_eqm_coin = HolyEqmCoin}}) ->
    Gains = [G],
    NewAssets = Assets#assets{holy_eqm_coin =
				  min(HolyEqmCoin + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 28, Val),
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = Evts}),
    add_log_item(gain, {28, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = holy_eqm_coin, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{holy_eqm_coin = HolyEqmCoin}}) ->
    case HolyEqmCoin >= Val of
      true ->
	  NewAssets = Assets#assets{holy_eqm_coin =
					HolyEqmCoin - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = Evts}),
	  add_log_item(loss, {28, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg =
		      lang:get(<<"Mảnh vỡ trang bị của Chúa không đủ"/utf8>>),
		  own_val = HolyEqmCoin}}
    end;
gl(G = #gain{label = skin_debris, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{skin_debris = SkinDebris}}) ->
    Gains = [G],
    NewAssets = Assets#assets{skin_debris =
				  min(SkinDebris + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 29, Val),
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = Evts}),
    add_log_item(gain, {29, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = skin_debris, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{skin_debris = SkinDebris}}) ->
    case SkinDebris >= Val of
      true ->
	  NewAssets = Assets#assets{skin_debris =
					SkinDebris - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = Evts}),
	  add_log_item(loss, {29, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Không đủ mảnh da"/utf8>>),
		  own_val = SkinDebris}}
    end;
gl(G = #gain{label = cluster_coin, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{cluster_coin = ClusterCoin}}) ->
    Gains = [G],
    NewAssets = Assets#assets{cluster_coin =
				  min(ClusterCoin + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 30, Val),
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = Evts}),
    add_log_item(gain, {30, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = cluster_coin, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{cluster_coin = ClusterCoin}}) ->
    case ClusterCoin >= Val of
      true ->
	  NewAssets = Assets#assets{cluster_coin =
					ClusterCoin - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = Evts}),
	  add_log_item(loss, {30, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Dấu hiệu anh hùng không đủ"/utf8>>),
		  own_val = ClusterCoin}}
    end;
gl(G = #gain{label = home_coin, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{home_coin = HomeCoin}}) ->
    Gains = [G],
    NewAssets = Assets#assets{home_coin =
				  min(HomeCoin + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 31, Val),
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = Evts}),
    add_log_item(gain, {31, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = home_coin, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{home_coin = HomeCoin}}) ->
    case HomeCoin >= Val of
      true ->
	  NewAssets = Assets#assets{home_coin = HomeCoin - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = Evts}),
	  add_log_item(loss, {31, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Xu Nhà Riêng không đủ"/utf8>>),
		  own_val = HomeCoin}}
    end;
gl(G = #gain{label = hallow_refine, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{hallow_refine = HomeCoin}}) ->
    Gains = [G],
    NewAssets = Assets#assets{hallow_refine =
				  min(HomeCoin + Val, 4200000000)},
    NewRole0 = Role#role{assets = NewAssets},
    NewRole = var:add_list_val(NewRole0, day, 39, 32, Val),
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{evts = Evts}),
    add_log_item(gain, {32, Val}),
    {ok, NewRole, Gains, NewArgs};
gl(L = #loss{label = hallow_refine, val = Val},
   Args = #role_gain_args{evts = Evts},
   Role = #role{assets =
		    Assets = #assets{hallow_refine = HomeCoin}}) ->
    case HomeCoin >= Val of
      true ->
	  NewAssets = Assets#assets{hallow_refine =
					HomeCoin - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets,
				      Args#role_gain_args{evts = Evts}),
	  add_log_item(loss, {32, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false,
	   L#loss{reason = no,
		  msg = lang:get(<<"Đá Hỏa Chí không đủ"/utf8>>),
		  own_val = HomeCoin}}
    end;
gl(G = #gain{label = feat_point, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{feat_point = FeatValue}}) ->
    Gains = [G],
    NewAssets = Assets#assets{feat_point =
				  min(FeatValue + Val, 4200000000)},
    NewRole = Role#role{assets = NewAssets},
    VarRole = var:add_var(NewRole, acc, 2043, Val, 0),
    NewArgs = update_gl_refresh(assets,
				Args#role_gain_args{}),
    add_log_item(gain, {12, Val}),
    {ok, VarRole, Gains, NewArgs};
gl(L = #loss{label = feat_point, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{feat_point = FeatValue}}) ->
    case FeatValue >= Val of
      true ->
	  NewAssets = Assets#assets{feat_point = FeatValue - Val},
	  NewRole = Role#role{assets = NewAssets},
	  NewArgs = update_gl_refresh(assets, Args),
	  add_log_item(loss, {12, Val}),
	  {ok, NewRole, NewArgs};
      false ->
	  {false, L#loss{reason = no, own_val = FeatValue}}
    end;
gl(G = #gain{label = triple_rebate, val = Val},
   Args = #role_gain_args{},
   Role = #role{assets =
		    Assets = #assets{triple_rebate = TripleRebate}}) ->
    Gains = [G],
    NewTripleRebate = min(TripleRebate + Val, 4200000000),
    NewAssets = Assets#assets{triple_rebate =
				  NewTripleRebate},
    NewRole = Role#role{assets = NewAssets},
    NewArgs = update_gl_refresh(assets, Args),
    {ok, NewRole, Gains, NewArgs};
gl(G = #loss{label = buy_from_market}, _Args, _Role) ->
    {false,
     G#loss{msg = lang:get(<<"Không thể mua được"/utf8>>)}};
gl(GL, Args, Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_gain1859, _,
       {__Levelrole_gain1859, __Tracesrole_gain1859}}
	  when __Levelrole_gain1859 band 8 /= 0 orelse
		 __Tracesrole_gain1859 /= [] ->
	  lager:do_log(error,
		       [{module, role_gain}, {function, gl}, {line, 1859},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]错误损益数据[GL:~w][Args:~w]",
				     [Role#role.name, GL, Args]),
		       none, 4096, 8, __Levelrole_gain1859,
		       __Tracesrole_gain1859, lager_event, __Pidrole_gain1859);
      _ -> ok
    end,
    {false, GL}.

to_gain_evt(_, _, change) -> [];
to_gain_evt(_, _, partner_decompose) -> [];
to_gain_evt(_, _, partner_star) -> [];
to_gain_evt(I, Acc, _Flag) -> to_gain_evt(I, Acc).

-spec to_gain_evt(Items, Acc) -> Acc when Items ::
					      [#item{} | {BaseId, Bind, Num} |
					       {BaseId, Num}],
					  Acc :: list(), BaseId :: integer(),
					  Bind :: 0 | 1,
					  Num :: non_neg_integer().

to_gain_evt([], Acc) -> Acc;
to_gain_evt([I | T], Acc) ->
    case to_gain_evt(I) of
      [Evt] -> to_gain_evt(T, [Evt | Acc]);
      _ -> to_gain_evt(T, Acc)
    end;
to_gain_evt(I, _Acc) -> to_gain_evt(I).

to_gain_evt(#item{base_id = BaseId, quantity = Num}) ->
    [#evt_get_item{base_id = BaseId, num = Num}];
to_gain_evt({BaseId, _Bind, Num}) ->
    [#evt_get_item{base_id = BaseId, num = Num}];
to_gain_evt({BaseId, Num}) ->
    [#evt_get_item{base_id = BaseId, num = Num}];
to_gain_evt(_Unkown) -> [].

-spec to_loss_evt(Items, Acc) -> Acc when Items ::
					      [#item{}],
					  Acc :: list().

to_loss_evt([], Acc) -> Acc;
to_loss_evt([I | T], Acc) ->
    case to_loss_evt(I) of
      [Evt] -> to_loss_evt(T, [Evt | Acc]);
      _ -> to_loss_evt(T, Acc)
    end;
to_loss_evt(I, _Acc) -> to_loss_evt(I).

to_loss_evt(#item{base_id = BaseId, quantity = Num}) ->
    [#evt_del_item{base_id = BaseId, num = Num}];
to_loss_evt(_Unkown) -> [].

loss_items([], _DelL, L) -> L;
loss_items([{Id, Num} | T], DelL, L) ->
    case lists:keyfind(Id, #item.id, DelL) of
      #item{base_id = BaseId} ->
	  loss_items(T, DelL, [{BaseId, Num} | L]);
      _ -> loss_items(T, DelL, L)
    end.

merge_items([], Items) -> Items;
merge_items([{BaseId, Num} | T], Items) ->
    NewItems = case lists:keyfind(BaseId, 1, Items) of
		 {_, Num1} ->
		     lists:keyreplace(BaseId, 1, Items,
				      {BaseId, Num + Num1});
		 _ -> [{BaseId, Num} | Items]
	       end,
    merge_items(T, NewItems).

add_log_item(_Label, []) -> ok;
add_log_item(Label, [I | T]) ->
    add_log_item(Label, I), add_log_item(Label, T);
add_log_item(Label, {BaseId, Num}) ->
    put(role_gain_log_items,
	[{Label, BaseId, Num} | get(role_gain_log_items)]);
add_log_item(Label, {BaseId, _, Num}) ->
    put(role_gain_log_items,
	[{Label, BaseId, Num} | get(role_gain_log_items)]);
add_log_item(Label,
	     #item{base_id = BaseId, quantity = Num}) ->
    put(role_gain_log_items,
	[{Label, BaseId, Num} | get(role_gain_log_items)]);
add_log_item(_Label, _) -> skip.

preprocess_items(List, Role, DoOpts) ->
    preprocess_items_(List, Role, DoOpts, []).

preprocess_items_(_, _Role, _DoOpts, {false, G}) ->
    {false, G};
preprocess_items_([], _Role, _DoOpts, List) ->
    {List1, List2} = lists:partition(fun (#loss{label =
						    buy_from_market}) ->
					     true;
					 (_) -> false
				     end,
				     List),
    NewList = case List1 of
		[] -> List2;
		[G] -> List2 ++ [G];
		[G | _] ->
		    List2 ++
		      [G#loss{val =
				  lists:flatten([G1#loss.val || G1 <- List1])}]
	      end,
    {ok, lists:reverse(NewList)};
preprocess_items_([G = #gain{label = red_gold} | T],
		  Role, DoOpts, NewList) ->
    New = [G#gain{label = gold} | NewList],
    preprocess_items_(T, Role, DoOpts, New);
preprocess_items_([G = #loss{label = red_gold} | T],
		  Role, DoOpts, NewList) ->
    New = [G#loss{label = gold} | NewList],
    preprocess_items_(T, Role, DoOpts, New);
preprocess_items_([G = #loss{label = red_gold_or_gold}
		   | T],
		  Role, DoOpts, NewList) ->
    New = [G#loss{label = gold} | NewList],
    preprocess_items_(T, Role, DoOpts, New);
preprocess_items_([G = #gain{label = item_base_id,
			     val = Val}
		   | T],
		  Role, DoOpts, NewList) ->
    New = to_classify_items(Val, G, NewList),
    preprocess_items_(T, Role, DoOpts, New);
preprocess_items_([G = #gain{label = items, val = Val}
		   | T],
		  Role, DoOpts, NewList) ->
    New = to_classify_items(Val, G, NewList),
    preprocess_items_(T, Role, DoOpts, New);
preprocess_items_([G = #loss{label = item_base_id,
			     val = Val}
		   | T],
		  Role, DoOpts = #gain_loss_opts{is_auto_buy = 1},
		  NewList) ->
    New = check_auto_buy(Val, G, Role, NewList),
    preprocess_items_(T, Role, DoOpts, New);
preprocess_items_([G = #loss{label = item_base_id,
			     val = Val}
		   | T],
		  Role, DoOpts = #gain_loss_opts{is_auto_buy = {Type}},
		  NewList) ->
    New = check_auto_exchange(Val, G, Role, Type, NewList),
    preprocess_items_(T, Role, DoOpts, New);
preprocess_items_([G | T], Role, DoOpts, NewList) ->
    preprocess_items_(T, Role, DoOpts, [G | NewList]).

check_auto_buy([], _G, _Role, List) -> List;
check_auto_buy([{BaseId, Num} | T], G, Role, List) ->
    case item_data:get(BaseId) of
      #item_base{gain_type = 2} ->
	  check_auto_buy(T, G, Role,
			 [G#loss{label = item_base_id_from_eqm,
				 val = [{BaseId, Num}]}
			  | List]);
      _ ->
	  {_Items, HasNum} = package:count(by_base_id, BaseId,
					   Role#role.p_bag),
	  if HasNum >= Num ->
		 check_auto_buy(T, G, Role,
				[G#loss{val = [{BaseId, Num}]} | List]);
	     HasNum > 0 ->
		 check_auto_buy(T, G, Role,
				[G#loss{val = [{BaseId, HasNum}]},
				 G#loss{label = buy_from_market,
					val = [{BaseId, Num - HasNum}]}
				 | List]);
	     true ->
		 check_auto_buy(T, G, Role,
				[G#loss{label = buy_from_market,
					val = [{BaseId, Num}]}
				 | List])
	  end
    end.

check_auto_exchange([], _G, _Role, _Type, List) -> List;
check_auto_exchange([{BaseId, Num} | T], G, Role, Type,
		    List) ->
    case item_data:get(BaseId) of
      #item_base{gain_type = 2} ->
	  check_auto_exchange(T, G, Role, Type,
			      [G#loss{label = item_base_id_from_eqm,
				      val = [{BaseId, Num}]}
			       | List]);
      _ ->
	  L = exchange_data:list_by_type(Type),
	  case lists:keyfind(BaseId, #exchange_data.item_bid, L)
	      of
	    #exchange_data{pay_type = PayType, price = Price} ->
		{_Items, HasNum} = package:count(by_base_id, BaseId,
						 Role#role.p_bag),
		if HasNum >= Num ->
		       check_auto_exchange(T, G, Role, Type,
					   [G#loss{val = [{BaseId, Num}]}
					    | List]);
		   HasNum > 0 ->
		       check_auto_exchange(T, G, Role, Type,
					   [G#loss{val = [{BaseId, HasNum}]},
					    G#loss{label = PayType,
						   val = (Num - HasNum) * Price}
					    | List]);
		   true ->
		       check_auto_exchange(T, G, Role, Type,
					   [G#loss{label = PayType,
						   val = Num * Price}
					    | List])
		end;
	    _ ->
		check_auto_exchange(T, G, Role, Type,
				    [G#loss{val = [{BaseId, Num}]} | List])
	  end
    end.

to_classify_items([], _G, List) -> List;
to_classify_items([I | T], G, List) ->
    {ItemBid, Val} = case I of
		       #item{base_id = Bid, quantity = Q} -> {Bid, Q};
		       {Bid, _, V} -> {Bid, V};
		       {Bid, V} -> {Bid, V}
		     end,
    case item_data:get(ItemBid) of
      #item_base{gain_type = 1} ->
	  to_classify_items(T, G,
			    [G#gain{label = new_label(G#gain.label), val = [I]}
			     | List]);
      #item_base{gain_type = GainType = 2} ->
	  to_classify_items(T, G,
			    [G#gain{label = new_label(GainType, G#gain.label),
				    val = [I]}
			     | List]);
      #item_base{gain_type = GainType = 7} ->
	  to_classify_items(T, G,
			    [G#gain{label = new_label(GainType, G#gain.label),
				    val = [I]}
			     | List]);
      #item_base{gain_type = GainType = 6} ->
	  to_classify_items(T, G,
			    [G#gain{label = new_label(GainType, G#gain.label),
				    val = [I]}
			     | List]);
      #item_base{gain_type = 4} ->
	  case item_data:assets_code2atom(ItemBid) of
	    undefined ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrole_gain2054, _,
		   {__Levelrole_gain2054, __Tracesrole_gain2054}}
		      when __Levelrole_gain2054 band 8 /= 0 orelse
			     __Tracesrole_gain2054 /= [] ->
		      lager:do_log(error,
				   [{module, role_gain},
				    {function, to_classify_items}, {line, 2054},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("道具数值信息有误:~w", [I]), none,
				   4096, 8, __Levelrole_gain2054,
				   __Tracesrole_gain2054, lager_event,
				   __Pidrole_gain2054);
		  _ -> ok
		end,
		{false, G};
	    Atom ->
		to_classify_items(T, G,
				  [G#gain{label = Atom, val = Val} | List])
	  end;
      #item_base{gain_type = 5} ->
	  to_classify_items(T, G,
			    [G#gain{label = use_item, val = I} | List]);
      #item_base{gain_type = 10} ->
	  to_classify_items(T, G,
			    [G#gain{label = holiday_item, val = {ItemBid, Val}}
			     | List]);
      _Data ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_gain2064, _,
	     {__Levelrole_gain2064, __Tracesrole_gain2064}}
		when __Levelrole_gain2064 band 8 /= 0 orelse
		       __Tracesrole_gain2064 /= [] ->
		lager:do_log(error,
			     [{module, role_gain},
			      {function, to_classify_items}, {line, 2064},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("不存在的道具数据信息:~w==~w", [I, _Data]),
			     none, 4096, 8, __Levelrole_gain2064,
			     __Tracesrole_gain2064, lager_event,
			     __Pidrole_gain2064);
	    _ -> ok
	  end,
	  {false, G}
    end.

new_label(item_base_id) -> item_base_id_to_bag;
new_label(items) -> items_to_bag.

new_label(2, item_base_id) -> item_base_id_to_eqm_bag;
new_label(2, items) -> items_to_eqm_bag;
new_label(7, item_base_id) -> item_base_id_to_pet_bag;
new_label(7, items) -> items_to_pet_bag;
new_label(6, item_base_id) -> item_base_id_to_home_bag;
new_label(6, items) -> items_to_home_bag;
new_label(_GainType, Label) -> new_label(Label).

get_next_lev(Role = #role{lev = Lev}, Exp) ->
    {NewLev, NewExp} = get_next_lev_2(Lev, Exp),
    {ok, {NewLev, NewExp}, Role}.

get_next_lev_2(Lev, Exp) ->
    case Lev >= role_career_data:get_const(max_lev) of
      true -> {role_career_data:get_const(max_lev), 0};
      _ ->
	  case Exp - role_career_data:get_exp(Lev) of
	    RestExp when RestExp < 0 -> {Lev, Exp};
	    RestExp when RestExp == 0 -> {Lev + 1, RestExp};
	    RestExp -> get_next_lev_2(Lev + 1, RestExp)
	  end
    end.

gl_fail(_Role, _Loss,
	#gain_loss_opts{need_notify_fail_item = no}) ->
    ok;
gl_fail(Role = #role{pid = RolePid},
	#loss{label = item_base_id, val = [{Bid, Num} | _]},
	#gain_loss_opts{need_notify_fail_item = true}) ->
    {_, HasNum} = package:count(by_base_id, Bid,
				Role#role.p_bag),
    role:pack_send(proxy, RolePid, 12745,
		   {Bid, Num, HasNum});
gl_fail(#role{pid = RolePid}, #loss{label = gold},
	_Opt) ->
    notice:alert({role_pid, RolePid},
		 lang:get(<<"Không đủ vàng"/utf8>>));
gl_fail(#role{pid = RolePid},
	#loss{label = Label, val = NeedVal, own_val = OwnVal},
	_Opt)
    when is_integer(NeedVal) ->
    Code = item_data:assets_atom2code(Label),
    case Code > 0 of
      true ->
	  role:pack_send(proxy, RolePid, 12745,
			 {Code, NeedVal, OwnVal});
      _ -> ok
    end;
gl_fail(_Role, _GL, _Opt) -> ok.

gl_fail_no_notice(Loss = #loss{},
		  #gain_loss_opts{need_notify_fail_item = true}) ->
    Loss#loss{msg = <<>>};
gl_fail_no_notice(L, _) -> L.

-spec gain_notice(#role{}, #gain_loss_opts{},
		  #gain_loss_opts{}) -> ok.

gain_notice(_Role, #gain_loss_opts{return_gl = GL},
	    #gain_loss_opts{type = 2}) ->
    notice:assets(GL), ok;
gain_notice(Role, #gain_loss_opts{return_gl = GL},
	    NoticeOpt) ->
    Msg = format:gain_text(GL, NoticeOpt, Role),
    case Msg of
      <<>> -> skip;
      _ ->
	  SayMsgData = say:pack_speak(Role, {64, 1, Msg}),
	  role:pack_send(12761, SayMsgData),
	  notice:alert(Role, Msg)
    end,
    ok.

check_auto_sell_eqm(_, []) -> ok;
check_auto_sell_eqm([], _) -> ok;
check_auto_sell_eqm([#item{id = Id, base_id = Bid,
			   quality = Quality}
		     | T],
		    StarL) ->
    ok,
    case lists:member(Quality + 1, StarL) of
      true ->
	  put(auto_sell_eqm_list,
	      [{Id, Bid, 1} | util:get(auto_sell_eqm_list, [])]),
	  check_auto_sell_eqm(T, StarL);
      _ -> check_auto_sell_eqm(T, StarL)
    end.


