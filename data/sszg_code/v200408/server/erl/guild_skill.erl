-file("src/mod/guild_skill/guild_skill.erl", 1).

-module(guild_skill).

-lager_records([{assets,
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
		{guild_skill_break_group,
		 [ver, career, attr_formation, skill_formation, ext]},
		{guild_skill_group,
		 [ver, career, group_id, skill_ids, group_ids]},
		{m_guild_skill, [ver, groups, break_groups]},
		{group_attr, [atk, hp_max, def, speed]},
		{partner_base_p,
		 [partner_id, bid, lev, star, star_step, quality,
		  break_lev, power, skills, add_star, is_lock, use_skin,
		  end_time, resonate_lev, resonate_break_lev]},
		{partner_lev_data,
		 [add_hp, add_atk, add_def, add_speed]},
		{partner_base_data,
		 [bid, name, type, rare_type, init_star, show_star,
		  init_lev, pos_type, camp_type, break_lev, recruit_type,
		  skills, addition_skill, addition_skill2, skill_order,
		  ai, awake_items, awake_attr, awake_skill, init_power,
		  add_power, leader_skill, chips_num, chips_id,
		  hidden_skills, init_star5_num, hook_skills,
		  compose_expend, can_use_direct_item, awaken_info,
		  break_id, other_skills, item_id]},
		{partner_comment_p,
		 [comment_id, name, msg, like_num, no_like_num,
		  is_like]},
		{partner_comment,
		 [comment_id, partner_id, account, rid, sid, name,
		  post_time, msg, like_num, no_like_num]},
		{partner_bag,
		 [ver, type, num, buy_num, partner_list, partner_had,
		  comment_likes, partner_field, partner_star_lev,
		  max_star, partner_decomposes, partner_skins]},
		{partner_field, [lev, fields]},
		{partner_gemstone, [ver, type, gemstones]},
		{gemstone, [ver, pos, bid]},
		{partner_skin, [ver, id, end_time, ext]},
		{partner,
		 [ver, id, bid, type, career, is_lock, pos_type,
		  camp_type, rare_type, lev, quality, exp, name, star,
		  star_step, step_attr, break_lev, break_attr, power,
		  base_attr, group_attr, all_attr, skills, break_skills,
		  set_skills, eqm, hidden_skills, artifacts, fetter,
		  fetter_attr, fetter_power, score_lists, gemstones,
		  awaken_count, awaken_skills, add_star, dower_skill,
		  holy_eqm, use_skin, end_time, resonate_lev,
		  resonate_break_lev]},
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
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

-export([init/0, info/2, activate/2, disable/1,
	 set_lev/2, calc_attr/2, outline/1, calc_return_loss/2,
	 return_guild_skill/2, break/2, lev_break_attr/3,
	 lev_break_skill/2, reset_break_type/2, push/3, push/2]).

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

-file("src/mod/guild_skill/guild_skill.erl", 32).

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

-file("src/mod/guild_skill/guild_skill.erl", 33).

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

-file("src/mod/guild_skill/guild_skill.erl", 34).

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

-file("src/mod/guild_skill/guild_skill.erl", 35).

-file("inc/partner.hrl", 1).

-file("inc/attr.hrl", 1).

-record(attr,
	{fc = 0, toughness = 0, atk = 0, def = 0, def_s = 0,
	 def_p = 0, hp_max = 0, hp = 0, speed = 0, hit_rate = 0,
	 dodge_rate = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, dam = 0, res = 0,
	 cure = 0, be_cure = 0, dam_p = 0, res_p = 0, dam_s = 0,
	 res_s = 0, tenacity = 0}).

-record(attr_calc,
	{attr = #attr{}  :: #attr{},
	 attr_no_ratio = #attr{}  :: #attr{},
	 ratio = #attr{}  :: #attr{},
	 attr_no_fc = #attr{}  :: #attr{},
	 ratio_no_fc = #attr{}  :: #attr{}}).

-file("inc/partner.hrl", 11).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("inc/partner.hrl", 12).

-file("inc/common.hrl", 1).

-file("inc/partner.hrl", 13).

-record(partner,
	{ver = 7  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(), career = 0,
	 is_lock = []  :: list(),
	 pos_type = 0  :: non_neg_integer(),
	 camp_type = 0  :: non_neg_integer(),
	 rare_type = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 quality = 0  :: non_neg_integer(),
	 exp = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 star = 1  :: non_neg_integer(),
	 star_step = 0  :: non_neg_integer(), step_attr = [],
	 break_lev = 0  :: non_neg_integer(),
	 break_attr = []  :: list(),
	 power = 0  :: non_neg_integer(), base_attr  :: #attr{},
	 group_attr = [], all_attr  :: #attr{},
	 skills = []  :: [non_neg_integer()],
	 break_skills = []  ::
	     [{non_neg_integer(), non_neg_integer()}],
	 set_skills = []  :: [non_neg_integer()], eqm = [],
	 hidden_skills = [], artifacts = [], fetter = [],
	 fetter_attr = [], fetter_power = 0, score_lists = [],
	 gemstones = [], awaken_count = 0, awaken_skills = [],
	 add_star = 0, dower_skill = [], holy_eqm = [],
	 use_skin = 0, end_time = 0, resonate_lev = 0,
	 resonate_break_lev = 0}).

-record(partner_skin,
	{ver = 1, id = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 ext = []  :: list()}).

-record(gemstone,
	{ver = 1, pos = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer()}).

-record(partner_gemstone,
	{ver = 1, type = 0  :: non_neg_integer(),
	 gemstones = []  :: [#gemstone{}]}).

-record(partner_field,
	{lev = 1  :: non_neg_integer(),
	 fields = []  ::
	     [{non_neg_integer(), non_neg_integer()}]}).

-record(partner_bag,
	{ver = -1  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 buy_num = 0  :: non_neg_integer(),
	 partner_list = []  :: [#partner{}],
	 partner_had = []  ::
	     [{non_neg_integer(), non_neg_integer(),
	       non_neg_integer()}],
	 comment_likes = []  ::
	     [{non_neg_integer(), non_neg_integer()}],
	 partner_field = []  :: #partner_field{},
	 partner_star_lev = 0  :: non_neg_integer(),
	 max_star = 0  :: non_neg_integer(),
	 partner_decomposes = []  :: non_neg_integer(),
	 partner_skins = []  :: list()}).

-record(partner_comment,
	{comment_id = 0, partner_id = 0, account = <<>>,
	 rid = 0, sid = <<>>, name = <<>>, post_time = 0,
	 msg = <<>>, like_num = 0, no_like_num = 0}).

-record(partner_comment_p,
	{comment_id = 0, name = <<>>, msg = <<>>, like_num = 0,
	 no_like_num = 0, is_like = 0}).

-record(partner_base_data,
	{bid, name, type, rare_type, init_star = 0,
	 show_star = 0, init_lev = 1, pos_type = 0,
	 camp_type = 0, break_lev = 0, recruit_type = 0,
	 skills = [], addition_skill = 0, addition_skill2 = 0,
	 skill_order = [], ai = 0, awake_items = [],
	 awake_attr = [], awake_skill = none, init_power = 0,
	 add_power = 0, leader_skill = 0, chips_num = 0,
	 chips_id = 0, hidden_skills = [], init_star5_num = 0,
	 hook_skills = [], compose_expend = [],
	 can_use_direct_item = 0, awaken_info = [], break_id = 0,
	 other_skills = [], item_id = 0}).

-record(partner_lev_data,
	{add_hp = 1000, add_atk = 1000, add_def = 1000,
	 add_speed = 1000}).

-record(partner_base_p,
	{partner_id, bid, lev, star, star_step, quality,
	 break_lev, power, skills, add_star, is_lock,
	 use_skin = 0, end_time = 0, resonate_lev = 0,
	 resonate_break_lev = 0}).

-record(group_attr,
	{atk = 0, hp_max = 0, def = 0, speed = 0}).

-file("src/mod/guild_skill/guild_skill.erl", 36).

-file("inc/guild_skill.hrl", 1).

-record(m_guild_skill,
	{ver = 2  :: pos_integer(), groups = []  :: list(),
	 break_groups = []  :: list()}).

-record(guild_skill_group,
	{ver = 1, career = 0, group_id = 0, skill_ids = [],
	 group_ids = []}).

-record(guild_skill_break_group,
	{ver = 1  :: pos_integer(),
	 career = 0  :: pos_integer(),
	 attr_formation = []  :: list(),
	 skill_formation = {0, 0}  :: tuple(),
	 ext = []  :: list()}).

-file("src/mod/guild_skill/guild_skill.erl", 37).

-file("inc/attr.hrl", 1).

-file("src/mod/guild_skill/guild_skill.erl", 38).

-file("inc/log.hrl", 1).

-file("src/mod/guild_skill/guild_skill.erl", 39).

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

-file("src/mod/guild_skill/guild_skill.erl", 40).

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

-file("src/mod/guild_skill/guild_skill.erl", 41).

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

-file("src/mod/guild_skill/guild_skill.erl", 42).

-export([gm_reset/2, gm_set/2, gm_break/1,
	 gm_set_break/2, gm_info_break/2]).

gm_break(Role) ->
    Fun = fun (Type, Role1) ->
		  case break(Role1, Type) of
		    {ok, NewRole} -> NewRole;
		    _ -> Role1
		  end
	  end,
    NewRole1 = lists:foldl(Fun, Role, lists:seq(2, 5)),
    NewRole1.

gm_set_break(Role = #role{m_guild_skill =
			      GuildSkill = #m_guild_skill{break_groups =
							      BreakGroup}},
	     {Type, Lev1, Lev2, Lev3, Lev4, SkillLev}) ->
    case lists:keyfind(Type,
		       #guild_skill_break_group.career, BreakGroup)
	of
      SingGroup = #guild_skill_break_group{attr_formation =
					       AttrFormation} ->
	  SortAttrFormation = lists:keysort(1, AttrFormation),
	  NewAttrFormation = gm_do_set_break(SortAttrFormation,
					     [Lev1, Lev2, Lev3, Lev4], []),
	  NewSkillId = case
			 guild_skill_data:get_break_skill_id_lev({Type,
								  SkillLev})
			   of
			 {SkillId, _NeedLev} -> SkillId;
			 _ -> 0
		       end,
	  NewSingGroup =
	      SingGroup#guild_skill_break_group{attr_formation =
						    NewAttrFormation,
						skill_formation =
						    {NewSkillId, SkillLev}},
	  NewBreakGroup = lists:keyreplace(Type,
					   #guild_skill_break_group.career,
					   BreakGroup, NewSingGroup),
	  NewGuildSkill = GuildSkill#m_guild_skill{break_groups =
						       NewBreakGroup},
	  NewRole = Role#role{m_guild_skill = NewGuildSkill},
	  gm_info_break(NewRole, Type),
	  NewRole;
      _ -> Role
    end.

gm_do_set_break(Old, [], AttrFormation) ->
    AttrFormation ++ Old;
gm_do_set_break([], _, AttrFormation) -> AttrFormation;
gm_do_set_break([{Id, _} | Rest], [Lev | LevRest],
		AttrFormation) ->
    gm_do_set_break(Rest, LevRest,
		    [{Id, Lev} | AttrFormation]).

gm_info_break(Role = #role{m_guild_skill =
			       #m_guild_skill{break_groups = BreakGroup}},
	      Type) ->
    case lists:keyfind(Type,
		       #guild_skill_break_group.career, BreakGroup)
	of
      #guild_skill_break_group{attr_formation = AttrFormation,
			       skill_formation = SkillFormation} ->
	  notice:alert(Role,
		       util:fbin(lang:get(<<"公会突破技能 属性~w 技能~w"/utf8>>),
				 [AttrFormation, SkillFormation]));
      _ -> notice:alert(Role, lang:get(<<"没有该类型"/utf8>>)), ok
    end.

-spec gm_reset(#role{}, Career :: integer()) -> {ok,
						 #role{}} |
						{false, binary()}.

gm_reset(Role = #role{m_guild_skill =
			  MGuildSkill = #m_guild_skill{groups = Groups}},
	 Career) ->
    AllCareers = guild_skill_data:careers(),
    case Career =:= 0 orelse
	   lists:member(Career, AllCareers)
	of
      true ->
	  {NRole, Careers} = case Career of
			       0 ->
				   NewMGuildSkill =
				       MGuildSkill#m_guild_skill{groups = []},
				   {Role#role{m_guild_skill = NewMGuildSkill},
				    AllCareers};
			       _ ->
				   NewGroups = lists:keydelete(Career,
							       #guild_skill_group.career,
							       Groups),
				   NewMGuildSkill =
				       MGuildSkill#m_guild_skill{groups =
								     NewGroups},
				   {Role#role{m_guild_skill = NewMGuildSkill},
				    [Career]}
			     end,
	  {ok, OpenRole} = open_init(NRole, Careers),
	  Fun = fun (CareerCfg, TmpRole) ->
			{ok, NTmpRole} = update_partners(TmpRole, CareerCfg),
			role:redirect(NTmpRole, 23700, {CareerCfg}),
			NTmpRole
		end,
	  NewRole = lists:foldl(Fun, OpenRole, Careers),
	  {ok, NewRole};
      _ -> {false, "英雄职业错误"}
    end.

-spec gm_set(#role{}, Career :: integer()) -> {ok,
					       #role{}} |
					      {false, binary()}.

gm_set(Role = #role{m_guild_skill =
			MGuildSkill = #m_guild_skill{groups = Groups}},
       Career) ->
    AllCareers = guild_skill_data:careers(),
    case lists:member(Career, AllCareers) of
      true ->
	  Fun = fun (Seq, Acc) ->
			GroupIdCfg = guild_skill_data:group_id({Career, Seq}),
			case GroupIdCfg > 0 of
			  true -> [GroupIdCfg | Acc];
			  _ -> Acc
			end
		end,
	  GroupIds = lists:foldl(Fun, [], lists:seq(1, 40)),
	  SkillIds =
	      guild_skill_data:skill_ids(lists:max(GroupIds)),
	  NewGroup = #guild_skill_group{career = Career,
					skill_ids = SkillIds,
					group_ids = GroupIds,
					group_id = lists:max(GroupIds)},
	  NewGroups = lists:keystore(Career,
				     #guild_skill_group.career, Groups,
				     NewGroup),
	  NewMGuildSkill = MGuildSkill#m_guild_skill{groups =
							 NewGroups},
	  NRole = Role#role{m_guild_skill = NewMGuildSkill},
	  {ok, NewRole} = update_partners(NRole, Career),
	  role:redirect(NewRole, 23700, {Career}),
	  {ok, NewRole};
      false -> {false, "英雄职业错误"}
    end.

-spec init() -> #m_guild_skill{}.

init() -> #m_guild_skill{}.

-spec info(#role{}, PartnerCareer :: integer()) -> ok |
						   {ok, #guild_skill_group{}}.

info(#role{guild_bag = #guild_bag{id = {0, <<>>}}},
     _Career) ->
    ok;
info(#role{guild_bag = #guild_bag{lev = GuildLev},
	   m_guild_skill = #m_guild_skill{groups = Groups}},
     Career) ->
    case GuildLev >= 0 of
      true ->
	  case lists:keyfind(Career, #guild_skill_group.career,
			     Groups)
	      of
	    Group = #guild_skill_group{} -> {ok, Group};
	    _ -> ok
	  end;
      false -> ok
    end.

-spec set_lev(Old :: #role{}, New :: #role{}) -> {ok,
						  NewRole :: #role{}}.

set_lev(#role{guild_bag = #guild_bag{id = OldGuildId}},
	Role = #role{guild_bag =
			 #guild_bag{lev = GuildLev, id = NewGuildId}}) ->
    case NewGuildId =/= {0, <<>>} of
      true ->
	  case GuildLev >= 0 of
	    true ->
		{ok, NRole} = open_init(Role,
					guild_skill_data:careers()),
		case OldGuildId =:= {0, <<>>} of
		  true -> update_partners(NRole);
		  false -> {ok, NRole}
		end;
	    _ -> update_partners(Role)
	  end;
      false -> update_partners(Role)
    end.

-spec disable(#role{}) -> {ok, #role{}}.

disable(Role) -> update_partners(Role).

-spec activate(#role{}, SkillId :: integer()) -> {ok,
						  #role{}, map()} |
						 {false, binary()}.

activate(#role{guild_bag = #guild_bag{id = {0, <<>>}}},
	 _Id) ->
    {false, lang:get(<<"未加入公会"/utf8>>)};
activate(Role, Id) ->
    case check_cond(Role, Id) of
      {ok, SkillCfg = #{loss := LossValL},
       Group = #guild_skill_group{career = Career,
				  group_id = GroupId}} ->
	  Loss = format:val_to_loss(LossValL, del_guild_skill),
	  case role_gain:do(Role, Loss,
			    #gain_loss_opts{is_auto_buy = {5},
					    log_name = <<"联盟技能"/utf8>>})
	      of
	    {ok, LossRole, GainOpts} ->
		{ok, NewRole} = do_activate(LossRole, SkillCfg, Group),
		LogMsg =
		    util:fbin(<<"激活公会技能career:~w,group_id:~w,skill_id:~w"/utf8>>,
			      [Career, GroupId, Id]),
		log:log_gain(GainOpts, Role, NewRole, <<"联盟技能"/utf8>>,
			     LogMsg),
		{ok, NewRole, #{career => Career}};
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidguild_skill227, _,
		   {__Levelguild_skill227, __Tracesguild_skill227}}
		      when __Levelguild_skill227 band 8 /= 0 orelse
			     __Tracesguild_skill227 /= [] ->
		      lager:do_log(error,
				   [{module, guild_skill}, {function, activate},
				    {line, 227}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]无法消耗资产激活公会技能Id:~w,Err:~w",
						 [Role#role.name, Id, Err]),
				   none, 4096, 8, __Levelguild_skill227,
				   __Tracesguild_skill227, lager_event,
				   __Pidguild_skill227);
		  _ -> ok
		end,
		{false, lang:get(<<"扣除资产失败，无法激活"/utf8>>)}
	  end;
      {false, Msg} -> {false, Msg}
    end.

do_activate(Role = #role{m_guild_skill =
			     MGuildSkill = #m_guild_skill{groups = Groups}},
	    #{id := Id, group_id := GroupId, seq := Seq},
	    Group = #guild_skill_group{skill_ids = SkillIds,
				       career = Career,
				       group_ids = GroupIds}) ->
    NextGroupId = next_group_id(Career, GroupId),
    case Seq =/= max_skill_seq(GroupId) orelse
	   NextGroupId =:= 0
	of
      true ->
	  NewSkillIds = [Id | SkillIds],
	  NewGroup = Group#guild_skill_group{skill_ids =
						 NewSkillIds},
	  NewGroups = lists:keystore(Career,
				     #guild_skill_group.career, Groups,
				     NewGroup),
	  NewMGuildSkill = MGuildSkill#m_guild_skill{groups =
							 NewGroups},
	  NRole = role_trigger:fire(#evt_guild_skill{},
				    Role#role{m_guild_skill = NewMGuildSkill}),
	  {ok, NewRole} = update_partners(NRole, Career),
	  {ok, NewRole};
      false ->
	  NewGroup = Group#guild_skill_group{skill_ids = [],
					     group_id = NextGroupId,
					     group_ids = [GroupId | GroupIds]},
	  NewGroups = lists:keystore(Career,
				     #guild_skill_group.career, Groups,
				     NewGroup),
	  NewMGuildSkill = MGuildSkill#m_guild_skill{groups =
							 NewGroups},
	  NRole = role_trigger:fire(#evt_guild_skill{},
				    Role#role{m_guild_skill = NewMGuildSkill}),
	  {ok, NewRole} = update_partners(NRole, Career),
	  PushGroupId = case NextGroupId =:= 0 of
			  true -> GroupId;
			  _ -> NextGroupId
			end,
	  push_group(NewRole, Career, PushGroupId),
	  {ok, NewRole}
    end.

-spec calc_attr(#role{}, #partner{}) -> #attr{}.

calc_attr(#role{guild_bag = #guild_bag{id = {0, <<>>}},
		name = _Name},
	  _Partner) ->
    [];
calc_attr(#role{m_guild_skill =
		    #m_guild_skill{groups = Groups},
		name = _Name},
	  #partner{type = Career, name = _PtnName}) ->
    case lists:keyfind(Career, #guild_skill_group.career,
		       Groups)
	of
      #guild_skill_group{group_ids = GroupIds,
			 skill_ids = SkillIds} ->
	  AllSkillIds = all_skill_ids(GroupIds, SkillIds),
	  skill_attr(AllSkillIds, []);
      _ -> []
    end.

outline(#role{m_guild_skill =
		  #m_guild_skill{groups = Groups}}) ->
    Outline = case [Group
		    || Group = #guild_skill_group{group_id = GroupId}
			   <- Groups,
		       GroupId > 0]
		  of
		GroupL = [_ | _] ->
		    [{Career, next_skill_id(SkillIds, GroupId)}
		     || #guild_skill_group{career = Career,
					   skill_ids = SkillIds,
					   group_id = GroupId}
			    <- GroupL];
		_ -> []
	      end,
    {ok, Outline}.

-spec break(#role{}, pos_integer()) -> {ok, #role{}} |
				       {false, string()}.

break(#role{guild_bag = #guild_bag{id = {0, <<>>}}},
      _Type) ->
    {false, lang:get(<<"未加入公会"/utf8>>)};
break(Role = #role{m_guild_skill =
		       GuildSkill = #m_guild_skill{break_groups =
						       BreakGroups}},
      Type) ->
    case check_break([break, skill, data], Role, Type, #{})
	of
      {ok, GuildSkillBreakGroup} ->
	  NewBreakGroups = [GuildSkillBreakGroup | BreakGroups],
	  NewGuildSkill = GuildSkill#m_guild_skill{break_groups =
						       NewBreakGroups},
	  NewRole = Role#role{m_guild_skill = NewGuildSkill},
	  push(NewRole, 23710, Type),
	  NewRole1 = role_trigger:fire(#evt_guild_break_skill{},
				       NewRole),
	  {ok, NewRole1};
      {false, Reason} -> {false, Reason}
    end.

-spec lev_break_attr(#role{}, pos_integer(),
		     pos_integer()) -> {ok, #role{}} | {false, string()}.

lev_break_attr(#role{guild_bag =
			 #guild_bag{id = {0, <<>>}}},
	       _Type, _Id) ->
    {false, lang:get(<<"未加入公会"/utf8>>)};
lev_break_attr(Role = #role{m_guild_skill =
				GuildSkill = #m_guild_skill{break_groups =
								BreakGroups}},
	       Type, Id) ->
    case check_lev_break_attr([lev, loss], Role,
			      #{type => Type, id => Id})
	of
      {ok, {Id, OldLev}, AttrFormation, Loss,
       GuildSkillGroup} ->
	  Expend = format:val_to_loss(Loss, guild_break_lev),
	  case role_gain:do_notice(Role, Expend,
				   #gain_loss_opts{need_notify_fail_item =
						       true})
	      of
	    {ok, LossRole} ->
		NewAttrFormation = lists:keyreplace(Id, 1,
						    AttrFormation,
						    {Id, OldLev + 1}),
		NewGuildSkillGroup =
		    GuildSkillGroup#guild_skill_break_group{attr_formation =
								NewAttrFormation},
		NewBreakGroups = lists:keyreplace(Type,
						  #guild_skill_break_group.career,
						  BreakGroups,
						  NewGuildSkillGroup),
		NewGuildSkill = GuildSkill#m_guild_skill{break_groups =
							     NewBreakGroups},
		NewRole = LossRole#role{m_guild_skill = NewGuildSkill},
		log:log_gain(Expend, Role, NewRole, <<"公会突破属性技能"/utf8>>,
			     <<"公会升级突破属性"/utf8>>),
		push(NewRole, 23710, Type),
		NewRole1 = role_trigger:fire(#evt_guild_skill{},
					     NewRole),
		role_robot:sync_role(NewRole1),
		NewRole2 = day_log(NewRole1, Type),
		{ok, NewRole2};
	    _ -> {false, lang:get(<<"资产不足"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason}
    end.

-spec lev_break_skill(#role{}, pos_integer()) -> {ok,
						  #role{}} |
						 {false, string()}.

lev_break_skill(#role{guild_bag =
			  #guild_bag{id = {0, <<>>}}},
		_Type) ->
    {false, lang:get(<<"未加入公会"/utf8>>)};
lev_break_skill(Role = #role{m_guild_skill =
				 GuildSkill = #m_guild_skill{break_groups =
								 BreakGroups}},
		Type) ->
    case check_lev_break_skill([lev, loss], Role,
			       #{type => Type})
	of
      {ok, NewSkillId, OldLev, Loss, GuildSkillGroup} ->
	  Expend = format:val_to_loss(Loss, guild_break_lev),
	  case role_gain:do_notice(Role, Expend,
				   #gain_loss_opts{need_notify_fail_item =
						       true})
	      of
	    {ok, LossRole} ->
		NewGuildSkillGroup =
		    GuildSkillGroup#guild_skill_break_group{skill_formation
								=
								{NewSkillId,
								 OldLev + 1}},
		NewBreakGroups = lists:keyreplace(Type,
						  #guild_skill_break_group.career,
						  BreakGroups,
						  NewGuildSkillGroup),
		NewGuildSkill = GuildSkill#m_guild_skill{break_groups =
							     NewBreakGroups},
		NewRole = LossRole#role{m_guild_skill = NewGuildSkill},
		log:log_gain(Expend, Role, NewRole, <<"公会突破属性技能"/utf8>>,
			     <<"公会升级突破技能"/utf8>>),
		push(NewRole, 23710, Type),
		NewRole1 = role_trigger:fire(#evt_guild_skill{},
					     NewRole),
		role_robot:sync_role(NewRole1),
		NewRole2 = day_log(NewRole1, Type),
		{ok, NewRole2};
	    _ -> {false, lang:get(<<"资产不足"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason}
    end.

-spec reset_break_type(#role{}, pos_integer()) -> {ok,
						   #role{}} |
						  {false, string()}.

reset_break_type(#role{guild_bag =
			   #guild_bag{id = {0, <<>>}}},
		 _Type) ->
    {false, lang:get(<<"未加入公会"/utf8>>)};
reset_break_type(Role = #role{m_guild_skill =
				  GuildSkill = #m_guild_skill{break_groups =
								  BreakGroups}},
		 Type) ->
    case check_reset_break([type, gain, loss, data], Role,
			   #{type => Type})
	of
      {ok, Gain, GuildSkillBreakGroup, LossGold} ->
	  GainList = format:val_to_gain(Gain, guild_skill_reset),
	  LossList = format:val_to_loss([{3, LossGold}],
					guild_skill_reset),
	  GL = GainList ++ LossList,
	  case role_gain:do_notice(Role, GL) of
	    {ok, GainRole} ->
		NewBreakGroups = lists:keyreplace(Type,
						  #guild_skill_break_group.career,
						  BreakGroups,
						  GuildSkillBreakGroup),
		NewGuildSkill = GuildSkill#m_guild_skill{break_groups =
							     NewBreakGroups},
		NewRole = GainRole#role{m_guild_skill = NewGuildSkill},
		NewRole1 = var:set_var(NewRole, other, 3122, 0),
		log:log_gain(GL, Role, NewRole1, <<"公会突破属性技能"/utf8>>,
			     <<"联盟突破属性技能重置"/utf8>>),
		push(NewRole1, 23710, Type),
		{ok, NewRole1};
	    _ -> {false, lang:get(<<"重置失败"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason}
    end.

push(#role{guild_bag = #guild_bag{id = {0, <<>>}}},
     _Code) ->
    ok;
push(Role = #role{m_guild_skill =
		      #m_guild_skill{break_groups = BreakGroups}},
     Code = 23711) ->
    IsFirst = var:get_var(Role, other, 3122, 1),
    CliBreakGroups = to_cli(BreakGroups, lists:seq(2, 5)),
    sys_conn:pack_send(Code, {CliBreakGroups, IsFirst}),
    ok;
push(_, Code) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_skill390, _,
       {__Levelguild_skill390, __Tracesguild_skill390}}
	  when __Levelguild_skill390 band 8 /= 0 orelse
		 __Tracesguild_skill390 /= [] ->
	  lager:do_log(error,
		       [{module, guild_skill}, {function, push}, {line, 390},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("协议发送错误~w", [Code]), none, 4096, 8,
		       __Levelguild_skill390, __Tracesguild_skill390,
		       lager_event, __Pidguild_skill390);
      _ -> ok
    end,
    ok.

push(#role{guild_bag = #guild_bag{id = {0, <<>>}}},
     _Code, _) ->
    ok;
push(Role = #role{m_guild_skill =
		      #m_guild_skill{break_groups = BreakGroups}},
     Code = 23710, Type) ->
    IsFirst = var:get_var(Role, other, 3122, 1),
    case lists:keyfind(Type,
		       #guild_skill_break_group.career, BreakGroups)
	of
      #guild_skill_break_group{attr_formation = AttrFormation,
			       skill_formation = {SkillId, Lev}} ->
	  sys_conn:pack_send(Code,
			     {AttrFormation, {SkillId, Lev}, Type, IsFirst});
      _ ->
	  sys_conn:pack_send(Code, {[], {0, 0}, Type, IsFirst})
    end;
push(_, Code, _) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_skill405, _,
       {__Levelguild_skill405, __Tracesguild_skill405}}
	  when __Levelguild_skill405 band 8 /= 0 orelse
		 __Tracesguild_skill405 /= [] ->
	  lager:do_log(error,
		       [{module, guild_skill}, {function, push}, {line, 405},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("协议发送错误~w", [Code]), none, 4096, 8,
		       __Levelguild_skill405, __Tracesguild_skill405,
		       lager_event, __Pidguild_skill405);
      _ -> ok
    end,
    ok.

check_cond(Role = #role{guild_bag =
			    #guild_bag{lev = GuildLev},
			m_guild_skill = #m_guild_skill{groups = Groups}},
	   Id) ->
    case GuildLev >= 0 of
      true ->
	  case guild_skill_data:get(Id) of
	    SkillCfg = #{loss := [_ | _], guild_lev := LevCfg,
			 group_id := GroupId}
		when GuildLev >= LevCfg ->
		case lists:keyfind(GroupId, #guild_skill_group.group_id,
				   Groups)
		    of
		  Group = #guild_skill_group{skill_ids = SkillIds} ->
		      case lists:member(Id, SkillIds) of
			false ->
			    PrevSkillId = prev_skill_id(SkillCfg),
			    case PrevSkillId =:= 0 orelse
				   lists:member(PrevSkillId, SkillIds)
				of
			      true ->
				  case check_all_lev_cond(Role, SkillCfg) of
				    true -> {ok, SkillCfg, Group};
				    {false, Reason} -> {false, Reason}
				  end;
			      false -> {false, lang:get(<<"请先激活前置技能"/utf8>>)}
			    end;
			true -> {false, lang:get(<<"已激活技能"/utf8>>)}
		      end;
		  false -> {false, lang:get(<<"未开放技能组"/utf8>>)}
		end;
	    #{loss := []} -> {false, lang:get(<<"消耗配置有误"/utf8>>)};
	    #{} -> {false, lang:get(<<"公会等级不足"/utf8>>)};
	    _ -> {false, lang:get(<<"技能不存在"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"公会等级不足，未开放公会技能"/utf8>>)}
    end.

check_all_lev_cond(#role{m_guild_skill =
			     #m_guild_skill{groups = Groups}},
		   #{cond_all_lev := NeedLev})
    when is_integer(NeedLev) andalso NeedLev > 0 ->
    case length(Groups) >= 4 of
      true -> do_check_all_lev_cond(Groups, NeedLev);
      _ ->
	  {false,
	   util:fbin(lang:get(<<"继续升级需其他职业技能最低达到~w重天"/utf8>>),
		     [NeedLev + 1])}
    end;
check_all_lev_cond(_Role, _) -> true.

do_check_all_lev_cond([], _NeedLev) -> true;
do_check_all_lev_cond([#guild_skill_group{group_id =
					      GroupId}
		       | T],
		      NeedLev) ->
    case guild_skill_data:get_group(GroupId) of
      #{group_seq := Lev} when Lev > NeedLev ->
	  do_check_all_lev_cond(T, NeedLev);
      _ ->
	  {false,
	   util:fbin(lang:get(<<"继续升级需其他职业技能最低达到~w重天"/utf8>>),
		     [NeedLev + 1])}
    end.

open_init(Role, []) -> {ok, Role};
open_init(Role = #role{m_guild_skill =
			   MGuildSkill = #m_guild_skill{groups = Groups}},
	  [Career | Rest]) ->
    NRole = case lists:keyfind(Career,
			       #guild_skill_group.career, Groups)
		of
	      false ->
		  GroupId = guild_skill_data:group_id({Career,
						       min_group_seq(Career)}),
		  NewGroups = [#guild_skill_group{career = Career,
						  group_id = GroupId}
			       | Groups],
		  NewMGuildSkill = MGuildSkill#m_guild_skill{groups =
								 NewGroups},
		  Role#role{m_guild_skill = NewMGuildSkill};
	      _ -> Role
	    end,
    open_init(NRole, Rest).

all_skill_ids([], Acc) -> Acc;
all_skill_ids([GroupId | Rest], Acc) ->
    Ids = guild_skill_data:skill_ids(GroupId),
    all_skill_ids(Rest, Ids ++ Acc).

skill_attr([], Acc) -> Acc;
skill_attr([SkillId | Rest], Acc) ->
    NewAcc = case guild_skill_data:get(SkillId) of
	       #{attr_list := AttrList = [_ | _]} -> AttrList ++ Acc;
	       _ -> Acc
	     end,
    skill_attr(Rest, NewAcc).

push_group(Role, Career, GroupId) ->
    role:redirect(Role, 23702, {Career, GroupId}), ok.

next_group_id(Career, #{group_seq := GroupSeq}) ->
    guild_skill_data:group_id({Career, GroupSeq + 1});
next_group_id(Career, GroupId)
    when is_integer(GroupId) ->
    GroupCfg = guild_skill_data:get_group(GroupId),
    next_group_id(Career, GroupCfg).

max_skill_seq(GroupId) ->
    List = guild_skill_data:skill_seq_list(GroupId),
    case List of
      [_ | _] -> lists:max(List);
      _ -> 0
    end.

min_skill_seq(GroupId) ->
    List = guild_skill_data:skill_seq_list(GroupId),
    case List of
      [_ | _] -> lists:min(List);
      _ -> 0
    end.

min_group_seq(Career) ->
    List = guild_skill_data:group_seq_list(Career),
    case List of
      [_ | _] -> lists:min(List);
      _ -> 0
    end.

prev_skill_id(#{group_id := GroupId, seq := Seq}) ->
    guild_skill_data:skill_id({GroupId, Seq - 1}).

next_skill_id([], GroupId) ->
    guild_skill_data:skill_id({GroupId,
			       min_skill_seq(GroupId)});
next_skill_id([MaxSeqSkillId | _], GroupId) ->
    case guild_skill_data:get(MaxSeqSkillId) of
      #{seq := Seq} ->
	  guild_skill_data:skill_id({GroupId, Seq + 1});
      _ -> 0
    end.

update_partners(Role) -> update_partners(Role, 0).

update_partners(Role, Career) ->
    NRole = partner_lib:ref_partner_by_type(Role, [Career],
					    []),
    {ok, NRole}.

-spec calc_return_loss(#role{},
		       pos_integer()) -> {pos_integer(), pos_integer(),
					  list()}.

calc_return_loss(Role = #role{m_guild_skill =
				  #m_guild_skill{groups = Groups}},
		 Career) ->
    case lists:keyfind(Career, #guild_skill_group.career,
		       Groups)
	of
      #guild_skill_group{group_ids = GroupIds,
			 skill_ids = SkillIds} ->
	  GroupLoss =
	      lists:flatten([guild_skill_data:group_id_loss(GroupId)
			     || GroupId <- GroupIds]),
	  SkillLoss =
	      lists:flatten([guild_skill_data:skill_id_loss(SkillId)
			     || SkillId <- SkillIds]),
	  AllLossT = GroupLoss ++ SkillLoss,
	  AllLoss = item_lib:merge(AllLossT, []),
	  Fun = fun ({ItemId, Rate}, Acc) ->
			case lists:keyfind(ItemId, 1, Acc) of
			  {_, Count} ->
			      lists:keystore(ItemId, 1, Acc,
					     {ItemId,
					      util:round(Count * Rate / 1000)});
			  _ -> Acc
			end
		end,
	  ReturnGain = lists:foldl(Fun, AllLoss,
				   guild_skill_data:get_const(return_resource_ratio)),
	  IsFirst = var:get_var(Role, other, 3048, 1),
	  LossGold = case IsFirst =:= 1 of
		       true -> guild_skill_data:get_const(first_reset_consume);
		       _ ->
			   AllLev = length(GroupIds) * 6 + length(SkillIds),
			   max(guild_skill_data:get_const(reset_consume_var1),
			       guild_skill_data:get_const(reset_consume_var2) *
				 AllLev)
		     end,
	  {IsFirst, LossGold, ReturnGain};
      _ -> {0, 0, []}
    end.

-spec return_guild_skill(#role{},
			 pos_integer()) -> {false, bitstring()} | {ok, #role{}}.

return_guild_skill(Role = #role{m_guild_skill =
				    MGuildSkill = #m_guild_skill{groups =
								     Groups}},
		   Career) ->
    case lists:keyfind(Career, #guild_skill_group.career,
		       Groups)
	of
      #guild_skill_group{skill_ids = OldSkillIds,
			 group_ids = OldGroupIds} ->
	  {IsFirst, LossGold, ReturnGain} = calc_return_loss(Role,
							     Career),
	  case ReturnGain of
	    [_ | _] ->
		Loss = format:val_to_loss([{3, LossGold}],
					  return_guild_skill),
		Gain = format:val_to_gain(ReturnGain,
					  return_guild_skill),
		GL = Loss ++ Gain,
		case role_gain:do_notice(Role, GL,
					 #gain_loss_opts{need_notify_fail_item =
							     true})
		    of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {false, #loss{msg = Msg}} -> {false, Msg};
		  {ok, Role1} ->
		      InitGroupId = guild_skill_data:group_id({Career,
							       min_group_seq(Career)}),
		      NewGuildSkill = #guild_skill_group{career = Career,
							 group_id =
							     InitGroupId},
		      NewGroups = lists:keystore(Career,
						 #guild_skill_group.career,
						 Groups, NewGuildSkill),
		      NewMGuildSkill = MGuildSkill#m_guild_skill{groups =
								     NewGroups},
		      Role2 = Role1#role{m_guild_skill = NewMGuildSkill},
		      NRole = case IsFirst =:= 1 of
				true -> var:set_var(Role2, other, 3048, 0);
				_ -> Role2
			      end,
		      {ok, NewRole} = update_partners(NRole, Career),
		      log:log_gain(GL, Role, NewRole, <<"联盟技能"/utf8>>,
				   util:fbin("重置联盟技能，职业~w，原激活组~w，原激活技能~w",
					     [Career, OldGroupIds,
					      OldSkillIds])),
		      {ok, NewRole}
		end;
	    _ -> {false, lang:get(<<"没有可重置的技能"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"未开启该职业的公会技能"/utf8>>)}
    end.

check_break([], _Role, _Type,
	    #{guild_skill_break_group := GuildSkillBreakGroup}) ->
    {ok, GuildSkillBreakGroup};
check_break([break | Rest],
	    Role = #role{m_guild_skill =
			     #m_guild_skill{break_groups = BreakGroups}},
	    Type, Arg) ->
    case lists:keyfind(Type,
		       #guild_skill_break_group.career, BreakGroups)
	of
      #guild_skill_break_group{} ->
	  {false, lang:get(<<"已经突破过了"/utf8>>)};
      _ -> check_break(Rest, Role, Type, Arg)
    end;
check_break([skill | Rest],
	    Role = #role{m_guild_skill =
			     #m_guild_skill{groups = Groups}},
	    Type, Arg) ->
    MaxLev = guild_skill_data:get_const(max_lv),
    case lists:keyfind(Type, #guild_skill_group.career,
		       Groups)
	of
      #guild_skill_group{group_ids = GroupIds,
			 skill_ids = SkillIds}
	  when length(GroupIds) >= MaxLev orelse
		 length(GroupIds) >= MaxLev - 1 andalso
		   length(SkillIds) >= 6 ->
	  check_break(Rest, Role, Type, Arg);
      _ -> {false, lang:get(<<"技能还没达到40重天"/utf8>>)}
    end;
check_break([data | Rest], Role, Type, Arg) ->
    case [Id
	  || {Id, DataType}
		 <- guild_skill_data:get_break_attr_list(),
	     DataType =:= Type]
	of
      [] -> {false, lang:get(<<"没有对应配置内容"/utf8>>)};
      Ids ->
	  GuildSkillBreakGroup = #guild_skill_break_group{career =
							      Type,
							  attr_formation =
							      [{IdAttr, 0}
							       || IdAttr
								      <- Ids],
							  skill_formation =
							      {0, 0}},
	  check_break(Rest, Role, Type,
		      Arg#{guild_skill_break_group => GuildSkillBreakGroup})
    end;
check_break(_Rest, _Role, _Type, _Arg) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

check_lev_break_attr([], _Role,
		     #{attr_formation := AttrFormation,
		       id_lev := {Id, OldLev}, loss := Loss,
		       guild_skill_group := GuildSkillGroup}) ->
    {ok, {Id, OldLev}, AttrFormation, Loss,
     GuildSkillGroup};
check_lev_break_attr([lev | Rest],
		     Role = #role{m_guild_skill =
				      #m_guild_skill{break_groups =
							 BreakGroups}},
		     Arg = #{type := Type, id := Id}) ->
    case lists:keyfind(Type,
		       #guild_skill_break_group.career, BreakGroups)
	of
      GuildSkillGroup =
	  #guild_skill_break_group{attr_formation =
				       AttrFormation} ->
	  case lists:keyfind(Id, 1, AttrFormation) of
	    {Id, OldLev} ->
		case guild_skill_data:get_break_attr_limit_lev({Id,
								OldLev})
		    of
		  NeedLev when is_integer(NeedLev) ->
		      case do_check_attr_lev(AttrFormation, NeedLev) of
			ok ->
			    check_lev_break_attr(Rest, Role,
						 Arg#{attr_formation =>
							  AttrFormation,
						      id_lev => {Id, OldLev},
						      guild_skill_group =>
							  GuildSkillGroup});
			_ ->
			    {false,
			     util:fbin(lang:get(<<"需要其它~ts属性到达~w级"/utf8>>),
				       [get_career_type(Type), NeedLev])}
		      end;
		  _ -> {false, lang:get(<<"已达到最高等级"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"找不到对应的技能"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"找不到对应的技能"/utf8>>)}
    end;
check_lev_break_attr([loss | Rest], Role,
		     Arg = #{id_lev := {Id, OldLev}}) ->
    case guild_skill_data:get_break_attr_loss({Id, OldLev})
	of
      Loss when is_list(Loss) ->
	  check_lev_break_attr(Rest, Role, Arg#{loss => Loss});
      _ -> {false, lang:get(<<"已达到最高等级"/utf8>>)}
    end;
check_lev_break_attr(_Rest, _Role, _Arg) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

do_check_attr_lev([], _NeedLev) -> ok;
do_check_attr_lev([{_Id, Lev} | Rest], NeedLev)
    when Lev >= NeedLev ->
    do_check_attr_lev(Rest, NeedLev);
do_check_attr_lev(_, _) -> false.

check_lev_break_skill([], _Role,
		      #{skill_id := NewSkillId, old_lev := OldLev,
			loss := Loss, guild_skill_group := GuildSkillGroup}) ->
    {ok, NewSkillId, OldLev, Loss, GuildSkillGroup};
check_lev_break_skill([lev | Rest],
		      Role = #role{m_guild_skill =
				       #m_guild_skill{break_groups =
							  BreakGroups}},
		      Arg = #{type := Type}) ->
    case lists:keyfind(Type,
		       #guild_skill_break_group.career, BreakGroups)
	of
      GuildSkillGroup =
	  #guild_skill_break_group{skill_formation =
				       {_OldSkillId, OldLev},
				   attr_formation = AttrFormation} ->
	  case guild_skill_data:get_break_skill_id_lev({Type,
							OldLev + 1})
	      of
	    {NewSkillId, _} ->
		case guild_skill_data:get_break_skill_id_lev({Type,
							      OldLev})
		    of
		  {_, NeedLev} ->
		      case do_check_attr_lev(AttrFormation, NeedLev) of
			ok ->
			    check_lev_break_skill(Rest, Role,
						  Arg#{skill_id => NewSkillId,
						       old_lev => OldLev,
						       guild_skill_group =>
							   GuildSkillGroup});
			_ ->
			    {false,
			     util:fbin(lang:get(<<"需要其它~ts属性到达~w级"/utf8>>),
				       [get_career_type(Type), NeedLev])}
		      end;
		  _ -> {false, lang:get(<<"已达到最大等级"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"已达到最大等级"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"没有对应的技能"/utf8>>)}
    end;
check_lev_break_skill([loss | Rest], Role,
		      Arg = #{type := Type, old_lev := OldLev}) ->
    case guild_skill_data:get_break_skill_loss({Type,
						OldLev})
	of
      Loss when is_list(Loss) ->
	  check_lev_break_skill(Rest, Role, Arg#{loss => Loss});
      _ -> {false, lang:get(<<"已达到最大等级"/utf8>>)}
    end;
check_lev_break_skill(_, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

check_reset_break([], _Role,
		  #{gain := AllList,
		    new_guild_skill_break_group := GuildSkillBreakGroup,
		    loss := Gold}) ->
    {ok, AllList, GuildSkillBreakGroup, Gold};
check_reset_break([type | Rest],
		  Role = #role{m_guild_skill =
				   #m_guild_skill{break_groups = BreakGroups}},
		  Arg = #{type := Type}) ->
    case lists:keyfind(Type,
		       #guild_skill_break_group.career, BreakGroups)
	of
      GuildSkillBreakGroup =
	  #guild_skill_break_group{attr_formation = AttrFormation,
				   skill_formation = {_SkillId, SkillLev}} ->
	  case length([1 || {_Id, Lev} <- AttrFormation, Lev > 0])
		 > 0
		 orelse SkillLev > 0
	      of
	    true ->
		check_reset_break(Rest, Role,
				  Arg#{guild_skill_break_group =>
					   GuildSkillBreakGroup});
	    _ -> {false, lang:get(<<"当前无需重置"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"你没有突破过改类型"/utf8>>)}
    end;
check_reset_break([gain | Rest], Role,
		  Arg = #{guild_skill_break_group :=
			      #guild_skill_break_group{attr_formation =
							   AttrFormation,
						       skill_formation =
							   {_, SkillLev}},
			  type := Type}) ->
    AttrResetList = get_break_reset_attr(AttrFormation, []),
    SkillResetList =
	guild_skill_data:get_break_skill_return({Type,
						 SkillLev}),
    AllList = AttrResetList ++ SkillResetList,
    NewAllList = item_lib:merge(AllList, []),
    check_reset_break(Rest, Role, Arg#{gain => NewAllList});
check_reset_break([data | Rest], Role,
		  Arg = #{type := Type}) ->
    case [Id
	  || {Id, DataType}
		 <- guild_skill_data:get_break_attr_list(),
	     DataType =:= Type]
	of
      [] -> {false, lang:get(<<"没有对应配置内容"/utf8>>)};
      Ids ->
	  GuildSkillBreakGroup = #guild_skill_break_group{career =
							      Type,
							  attr_formation =
							      [{IdAttr, 0}
							       || IdAttr
								      <- Ids],
							  skill_formation =
							      {0, 0}},
	  check_reset_break(Rest, Role,
			    Arg#{new_guild_skill_break_group =>
				     GuildSkillBreakGroup})
    end;
check_reset_break([loss | Rest], Role,
		  Arg = #{guild_skill_break_group :=
			      #guild_skill_break_group{attr_formation =
							   AttrFormation}}) ->
    Gold = case var:get_var(Role, other, 3122, 1) of
	     1 ->
		 guild_skill_data:get_const(pvp_first_reset_consume);
	     _ ->
		 AllLev = lists:sum([Lev
				     || {_Id, Lev} <- AttrFormation]),
		 Var1 =
		     guild_skill_data:get_const(pvp_reset_consume_var1),
		 Var2 =
		     guild_skill_data:get_const(pvp_reset_consume_var2),
		 max(Var1, Var2 * AllLev)
	   end,
    check_reset_break(Rest, Role, Arg#{loss => Gold});
check_reset_break(_, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

get_break_reset_attr([], AttrResetList) ->
    AttrResetList;
get_break_reset_attr([{Id, Lev} | Rest],
		     AttrResetList) ->
    ResetList = guild_skill_data:get_break_attr_return({Id,
							Lev}),
    get_break_reset_attr(Rest, ResetList ++ AttrResetList).

day_log(Role, Type) ->
    TypeList = var:get_var(Role, day, 157, []),
    case lists:member(Type, TypeList) of
      true -> Role;
      _ ->
	  TypeName = get_career_type(Type),
	  log:save(join,
		   {Role, <<"公会pvp技能"/utf8>>,
		    util:fbin(<<"~ts参与升级玩家"/utf8>>, [TypeName])}),
	  NewRole = var:set_var(Role, day, 157,
				[Type | TypeList]),
	  NewRole
    end.

get_career_type(2) -> <<"法师"/utf8>>;
get_career_type(3) -> <<"战士"/utf8>>;
get_career_type(4) -> <<"坦克"/utf8>>;
get_career_type(5) -> <<"辅助"/utf8>>;
get_career_type(Type) -> util:fbin("~w职业", [Type]).

to_cli(BreakGroups, []) -> BreakGroups;
to_cli(BreakGroups, [Career | Rest]) ->
    case lists:keyfind(Career,
		       #guild_skill_break_group.career, BreakGroups)
	of
      #guild_skill_break_group{} -> to_cli(BreakGroups, Rest);
      _ ->
	  to_cli([#guild_skill_break_group{career = Career}
		  | BreakGroups],
		 Rest)
    end.


