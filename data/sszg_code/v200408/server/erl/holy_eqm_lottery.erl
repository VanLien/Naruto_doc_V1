-file("data/holy_eqm_lottery.erl", 1).

-file("src/mod/dungeon_heaven/holy_eqm_lottery.erl", 1).

-module(holy_eqm_lottery).

-lager_records([{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
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
		{link, [socket, conn_pid, ip, port, lag]},
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
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{recruit_limit, [key, info]},
		{holiday_info, [camp_id, stats, ext]},
		{recruit_info, [group_id, stats, ext]},
		{m_recruit_award, [ver, list]},
		{m_recruit,
		 [ver, free_cd_end, list, convert_list, convert_state,
		  holiday_list, holy_eqm_lottery, logs,
		  holiday_sprite_lottery_list, lucky_sprites,
		  lucky_holy_eqm, all_score]},
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

-export([draw/4, get_log/3, broadcast/2, push_base/1,
	 push_all_score/1, take_reward/3, set_lucky_sprites/3,
	 gm_test_refresh/5, add_lucky_pro/2, fire_open/2,
	 do_calc_score/1, check_holy_score/2]).

-export([gm_look_power/1, gm_del_2020_3_5/1,
	 role_data/1]).

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

-file("src/mod/dungeon_heaven/holy_eqm_lottery.erl",
      30).

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

-file("src/mod/dungeon_heaven/holy_eqm_lottery.erl",
      31).

-file("inc/recruit.hrl", 1).

-record(m_recruit,
	{ver = 7, free_cd_end = 0, list = [], convert_list = [],
	 convert_state = [], holiday_list = [],
	 holy_eqm_lottery = [], logs = [],
	 holiday_sprite_lottery_list = [], lucky_sprites = [],
	 lucky_holy_eqm = [], all_score = 0}).

-record(m_recruit_award, {ver = 1, list = []}).

-record(recruit_info,
	{group_id = 0, stats = #{}, ext = #{}}).

-record(holiday_info,
	{camp_id = 0, stats = #{}, ext = #{}}).

-record(recruit_limit, {key, info = #{}}).

-file("src/mod/dungeon_heaven/holy_eqm_lottery.erl",
      32).

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

-file("src/mod/dungeon_heaven/holy_eqm_lottery.erl",
      33).

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

-file("src/mod/dungeon_heaven/holy_eqm_lottery.erl",
      34).

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

-file("src/mod/dungeon_heaven/holy_eqm_lottery.erl",
      35).

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

-file("src/mod/dungeon_heaven/holy_eqm_lottery.erl",
      36).

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

-file("src/mod/dungeon_heaven/holy_eqm_lottery.erl",
      37).

-file("inc/log.hrl", 1).

-file("src/mod/dungeon_heaven/holy_eqm_lottery.erl",
      38).

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

-file("src/mod/dungeon_heaven/holy_eqm_lottery.erl",
      39).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/mod/dungeon_heaven/holy_eqm_lottery.erl",
      40).

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

-file("src/mod/dungeon_heaven/holy_eqm_lottery.erl",
      41).

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

-file("src/mod/dungeon_heaven/holy_eqm_lottery.erl",
      42).

gm_look_power(#role{m_recruit =
			#m_recruit{all_score = AllScore}}) ->
    notice:alert(util:fbin(lang:get(<<"神装战力为~w"/utf8>>),
			   [AllScore])),
    ok.

gm_del_2020_3_5(Role = #role{id = RoleId}) ->
    case role_data(RoleId) of
      {_, _, DoNum1, DoNum2} ->
	  ItemId1 = 17210,
	  ItemPrice1 = 135,
	  ItemBasePrice1 = 150,
	  ItemId2 = 17211,
	  ItemPrice2 = 180,
	  ItemBasePrice2 = 200,
	  case dp_del_2020_3_5(Role, DoNum1, ItemId1, ItemPrice1,
			       ItemBasePrice1)
	      of
	    {ok, Role1, AllLoss1} ->
		case dp_del_2020_3_5(Role1, DoNum2, ItemId2, ItemPrice2,
				     ItemBasePrice2)
		    of
		  {ok, Role2, AllLoss2} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholy_eqm_lottery62, _,
			 {__Levelholy_eqm_lottery62,
			  __Tracesholy_eqm_lottery62}}
			    when __Levelholy_eqm_lottery62 band 64 /= 0 orelse
				   __Tracesholy_eqm_lottery62 /= [] ->
			    lager:do_log(info,
					 [{module, holy_eqm_lottery},
					  {function, gm_del_2020_3_5},
					  {line, 62},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("玩家[~ts]~w在bug扣除资产时成功，扣除石像1总次数:~w, 石像1扣除总道具~w, "
						       "扣除石像2总次数:~w, 石像2扣除总道具~w",
						       [Role#role.name, RoleId,
							DoNum1, AllLoss1,
							DoNum2, AllLoss2]),
					 none, 4096, 64,
					 __Levelholy_eqm_lottery62,
					 __Tracesholy_eqm_lottery62,
					 lager_event, __Pidholy_eqm_lottery62);
			_ -> ok
		      end,
		      io:format("~ts",
				[io_lib:format("玩家[~ts]~w在bug扣除资产时成功，扣除石像1总次数:~w, 石像1扣除总道具~w, "
					       "扣除石像2总次数:~w, 石像2扣除总道具~w",
					       [Role#role.name, RoleId, DoNum1,
						AllLoss1, DoNum2, AllLoss2])]),
		      file:write_file("role_msg.txt",
				      util:fbin("玩家[~ts]~w在bug扣除资产时成功，扣除石像1总次数:~w, 石像1扣除总道具~w, "
						"扣除石像2总次数:~w, 石像2扣除总道具~w",
						[Role#role.name, RoleId, DoNum1,
						 AllLoss1, DoNum2, AllLoss2])),
		      AllLoss = item_lib:merge(AllLoss1, AllLoss2),
		      AllItemNum1 = list_util:keyfind(ItemId1, AllLoss, 0),
		      AllItemNum2 = list_util:keyfind(ItemId2, AllLoss, 0),
		      HolyItemNum = list_util:keyfind(28, AllLoss, 0),
		      GoldNum = list_util:keyfind(3, AllLoss, 0),
		      XilianshiNum = list_util:keyfind(10030, AllLoss, 0),
		      Msg1 = get_del_msg(ItemId1, AllItemNum1),
		      Msg2 = get_del_msg(ItemId2, AllItemNum2),
		      Msg3 = get_del_msg(28, HolyItemNum),
		      Msg4 = get_del_msg(3, GoldNum),
		      Msg4_1 = get_del_msg(10030, XilianshiNum),
		      Msg5 =
			  lang:get(<<"亲爱的冒险者大人：\n        由于您在天界祈祷时受到了调皮的小精灵干扰，导致您的祈"
				     "祷出现了一些异常，很抱歉给您带来了困扰，目前该异常已经修复，并对异常获取的奖励做了如下处理"
				     "：\n        对于已消耗信物参与十连祈祷的情况，我们将扣除正确的信物数量，道具不足"
				     "将进行同等价值的神装碎片或钻石扣除，现已扣除您的"/utf8>>),
		      Msg6 = get_del_msg2([Msg1, Msg2, Msg3, Msg4_1, Msg4],
					  <<>>),
		      Msg7 =
			  lang:get(<<"\n        非常抱歉给您带来了不好的游戏体验，附件是小助手的一点心意，请您查收！\n "
				     "       再次感谢冒险者大人的体谅，如有疑问，可尝试联系客服咨询详情，祝游戏愉快！"/utf8>>),
		      Title = lang:get(<<"天界祈祷异常补偿邮件"/utf8>>),
		      Msg = <<Msg5/binary, Msg6/binary, Msg7/binary>>,
		      {ok, MailRole} = mail:add(Role2,
						{Title, Msg, [{3, 1000}], [],
						 <<"天界祈祷异常补偿邮件"/utf8>>,
						 86400 * 3 + date:unixtime()}),
		      VarRole = var:set_var(MailRole, other, 3106,
					    {DoNum1, DoNum2, AllLoss}),
		      {ok, VarRole};
		  _ -> {ok, Role}
		end;
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end.

get_del_msg2([], Msg5) -> Msg5;
get_del_msg2([<<>> | Other], Msg5) ->
    get_del_msg2(Other, Msg5);
get_del_msg2([Msg | Other], <<>>) ->
    get_del_msg2(Other, Msg);
get_del_msg2([Msg | Other], Msg5) ->
    NMsg5 = <<Msg5/binary, <<", ">>/binary, Msg/binary>>,
    get_del_msg2(Other, NMsg5).

get_del_msg(_, 0) -> <<>>;
get_del_msg(17210, Num) ->
    color:msg(lang:get(<<"大地信物道具*~ts个,"/utf8>>),
	      [{string, {red, Num}}]);
get_del_msg(17211, Num) ->
    color:msg(lang:get(<<"圣洁信物道具*~ts个"/utf8>>),
	      [{string, {red, Num}}]);
get_del_msg(28, Num) ->
    color:msg(lang:get(<<"神装碎片~ts个"/utf8>>),
	      [{string, {red, Num}}]);
get_del_msg(3, Num) ->
    color:msg(lang:get(<<"钻石~ts个"/utf8>>),
	      [{string, {red, Num}}]);
get_del_msg(10030, Num) ->
    color:msg(lang:get(<<"洗练石~ts个"/utf8>>),
	      [{string, {red, Num}}]).

dp_del_2020_3_5(Role, 0, _ItemId, _ItemPrice,
		_BasePrice) ->
    {ok, Role, []};
dp_del_2020_3_5(Role = #role{id = Id,
			     assets =
				 #assets{gold = Gold,
					 holy_eqm_coin = HolyEqmCoin}},
		AllCount, ItemId, ItemPrice, BasePrice) ->
    LossItemNum = case package:count(by_base_id, ItemId,
				     Role#role.p_bag)
		      of
		    {_, CountT} when CountT >= AllCount -> AllCount;
		    {_, CountT} when CountT > 0 -> CountT;
		    _ -> 0
		  end,
    NeedDelNum1 = AllCount - LossItemNum,
    NeedDelPrice1 = NeedDelNum1 * BasePrice,
    HolyPrice = HolyEqmCoin * 10,
    LoseHolyEqmCoinNum = case NeedDelNum1 > 0 of
			   true when HolyPrice >= NeedDelPrice1 ->
			       util:floor(NeedDelPrice1 / 10);
			   true -> HolyEqmCoin;
			   _ -> 0
			 end,
    NeedDelPrice2 = NeedDelPrice1 - LoseHolyEqmCoinNum * 10,
    AllXilianshiNum = case package:count(by_base_id, 10030,
					 Role#role.p_bag)
			  of
			{_, CountTemp} -> CountTemp;
			_ -> 0
		      end,
    XilianshiPrice = AllXilianshiNum * 50,
    DelXilianshiNum = case NeedDelPrice2 > 0 of
			true when XilianshiPrice >= NeedDelPrice2 ->
			    util:floor(NeedDelPrice2 / 50);
			true -> AllXilianshiNum;
			_ -> 0
		      end,
    NeedDelPrice3 = util:floor((NeedDelPrice2 -
				  DelXilianshiNum * 50)
				 * 9.0e-1),
    LoseGoldNum = case Gold >= NeedDelPrice3 of
		    true -> NeedDelPrice3;
		    _ -> Gold
		  end,
    AllLose = [{ItemId, LossItemNum},
	       {28, LoseHolyEqmCoinNum}, {10030, DelXilianshiNum},
	       {3, LoseGoldNum}],
    GL = format:val_to_loss(AllLose, dp_del_2020_3_5),
    case role_gain:do(Role, GL) of
      {ok, NRole} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholy_eqm_lottery157, _,
	     {__Levelholy_eqm_lottery157,
	      __Tracesholy_eqm_lottery157}}
		when __Levelholy_eqm_lottery157 band 64 /= 0 orelse
		       __Tracesholy_eqm_lottery157 /= [] ->
		lager:do_log(info,
			     [{module, holy_eqm_lottery},
			      {function, dp_del_2020_3_5}, {line, 157},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("玩家[~ts]~w需要扣除资产:~w",
					   [Role#role.name, Id,
					    {AllCount, ItemId, ItemPrice,
					     AllLose}]),
			     none, 4096, 64, __Levelholy_eqm_lottery157,
			     __Tracesholy_eqm_lottery157, lager_event,
			     __Pidholy_eqm_lottery157);
	    _ -> ok
	  end,
	  {ok, NRole, AllLose};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholy_eqm_lottery160, _,
	     {__Levelholy_eqm_lottery160,
	      __Tracesholy_eqm_lottery160}}
		when __Levelholy_eqm_lottery160 band 8 /= 0 orelse
		       __Tracesholy_eqm_lottery160 /= [] ->
		lager:do_log(error,
			     [{module, holy_eqm_lottery},
			      {function, dp_del_2020_3_5}, {line, 160},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("玩家在扣除资产时失败:~w",
					   [{AllCount, ItemId, ItemPrice,
					     AllLose}]),
			     none, 4096, 8, __Levelholy_eqm_lottery160,
			     __Tracesholy_eqm_lottery160, lager_event,
			     __Pidholy_eqm_lottery160);
	    _ -> ok
	  end,
	  false
    end.

role_data({100, <<"9377ios_280">>}) -> {1, 0, 9, 0};
role_data({1391, <<"symlf_2974">>}) ->
    {41, 102, 369, 918};
role_data({15, <<"symix2_1320">>}) -> {16, 0, 144, 0};
role_data({1515, <<"symlf_2957">>}) -> {1, 0, 9, 0};
role_data({2218, <<"symix2_852">>}) -> {15, 0, 135, 0};
role_data({2454, <<"symix_623">>}) -> {11, 0, 99, 0};
role_data({2881, <<"symlf_2882">>}) -> {15, 0, 135, 0};
role_data({359, <<"symlf_3001">>}) -> {40, 0, 360, 0};
role_data({495, <<"symix2_1320">>}) -> {41, 0, 369, 0};
role_data({53, <<"icebird_796">>}) -> {91, 0, 819, 0};
role_data({717, <<"symix_1343">>}) ->
    {5, 171, 45, 1539};
role_data({908, <<"9377_1388">>}) -> {21, 0, 189, 0};
role_data({1062, <<"symlf_1646">>}) -> {0, 54, 0, 486};
role_data({1083, <<"symlf_2496">>}) ->
    {0, 171, 0, 1539};
role_data({110, <<"symlf_328">>}) -> {0, 51, 0, 459};
role_data({1134, <<"symix_1117">>}) -> {0, 21, 0, 189};
role_data({127, <<"symix2_281">>}) -> {0, 30, 0, 270};
role_data({1285, <<"symix2_960">>}) -> {0, 111, 0, 999};
role_data({1289, <<"symix2_1072">>}) -> {0, 21, 0, 189};
role_data({1342, <<"symlf_2060">>}) -> {0, 3, 0, 27};
role_data({1373, <<"icebird_174">>}) ->
    {0, 131, 0, 1179};
role_data({1418, <<"symix_768">>}) -> {0, 11, 0, 99};
role_data({1432, <<"symlf_2956">>}) -> {0, 93, 0, 837};
role_data({1453, <<"symlf_2080">>}) -> {0, 11, 0, 99};
role_data({1547, <<"symix2_233">>}) -> {0, 11, 0, 99};
role_data({1579, <<"symix2_392">>}) -> {0, 21, 0, 189};
role_data({1720, <<"symlf_376">>}) -> {0, 171, 0, 1539};
role_data({1729, <<"symix2_1337">>}) -> {0, 16, 0, 144};
role_data({1788, <<"9377_813">>}) -> {0, 11, 0, 99};
role_data({1862, <<"symlf_2113">>}) -> {0, 61, 0, 549};
role_data({1895, <<"symlf_2790">>}) -> {0, 31, 0, 279};
role_data({194, <<"symix2_549">>}) -> {0, 7, 0, 63};
role_data({1969, <<"symlf_2122">>}) -> {0, 31, 0, 279};
role_data({204, <<"symix2_551">>}) -> {0, 22, 0, 198};
role_data({2043, <<"symlf_2045">>}) -> {0, 21, 0, 189};
role_data({2060, <<"9377_82">>}) -> {0, 21, 0, 189};
role_data({2200, <<"9377_723">>}) -> {0, 91, 0, 819};
role_data({2211, <<"symlf_2976">>}) ->
    {0, 171, 0, 1539};
role_data({2311, <<"9377ios_115">>}) -> {0, 21, 0, 189};
role_data({2439, <<"symix_671">>}) -> {0, 91, 0, 819};
role_data({2633, <<"icebird_264">>}) -> {0, 21, 0, 189};
role_data({2637, <<"symlf_954">>}) -> {0, 4, 0, 36};
role_data({2641, <<"symlf_2020">>}) -> {0, 11, 0, 99};
role_data({2681, <<"symlf_2938">>}) ->
    {0, 171, 0, 1539};
role_data({2787, <<"symlf_2113">>}) -> {0, 61, 0, 549};
role_data({2817, <<"symlf_1256">>}) -> {0, 11, 0, 99};
role_data({2864, <<"icebird_95">>}) -> {0, 40, 0, 360};
role_data({2881, <<"symlf_124">>}) -> {0, 116, 0, 1044};
role_data({2957, <<"symix2_17">>}) -> {0, 31, 0, 279};
role_data({303, <<"symlf_956">>}) -> {0, 19, 0, 171};
role_data({3069, <<"symlf_2069">>}) -> {0, 2, 0, 18};
role_data({3086, <<"icebird_95">>}) -> {0, 11, 0, 99};
role_data({3107, <<"symlf_2608">>}) -> {0, 21, 0, 189};
role_data({3546, <<"symlf_1869">>}) -> {0, 11, 0, 99};
role_data({362, <<"symlf_1426">>}) -> {0, 11, 0, 99};
role_data({391, <<"symix2_135">>}) -> {0, 11, 0, 99};
role_data({4022, <<"symlf_1362">>}) -> {0, 22, 0, 198};
role_data({404, <<"symlf_138">>}) -> {0, 201, 0, 1809};
role_data({4080, <<"symlf_1302">>}) -> {0, 51, 0, 459};
role_data({4197, <<"symlf_885">>}) -> {0, 21, 0, 189};
role_data({4236, <<"symlf_697">>}) -> {0, 126, 0, 1134};
role_data({424, <<"symlf_778">>}) -> {0, 11, 0, 99};
role_data({432, <<"symix2_360">>}) -> {0, 31, 0, 279};
role_data({4379, <<"symlf_1564">>}) -> {0, 88, 0, 792};
role_data({48, <<"symlf_2938">>}) -> {0, 153, 0, 1377};
role_data({4913, <<"symlf_2204">>}) -> {0, 61, 0, 549};
role_data({585, <<"icebird_174">>}) ->
    {0, 192, 0, 1728};
role_data({6, <<"symlf_2283">>}) -> {0, 18, 0, 162};
role_data({61, <<"symix_938">>}) -> {0, 11, 0, 99};
role_data({6116, <<"symlf_761">>}) -> {0, 82, 0, 738};
role_data({6142, <<"symlf_761">>}) -> {0, 11, 0, 99};
role_data({64616, <<"symix2_1">>}) -> {0, 41, 0, 369};
role_data({692, <<"symix2_241">>}) -> {0, 31, 0, 279};
role_data({710, <<"symix2_1058">>}) -> {0, 11, 0, 99};
role_data({721, <<"symix_492">>}) -> {0, 162, 0, 1458};
role_data({738, <<"symlf_266">>}) -> {0, 21, 0, 189};
role_data({778, <<"icebird_174">>}) ->
    {0, 171, 0, 1539};
role_data({781, <<"icebird_171">>}) -> {0, 31, 0, 279};
role_data({900, <<"symlf_1470">>}) -> {0, 11, 0, 99};
role_data({919, <<"icebird_174">>}) ->
    {0, 160, 0, 1440};
role_data({920, <<"symlf_2113">>}) -> {0, 110, 0, 990};
role_data({964, <<"symlf_356">>}) -> {0, 11, 0, 99};
role_data({990, <<"symlf_1573">>}) -> {0, 17, 0, 153};
role_data(_) -> undefined.

-spec fire_open(#role{}, atom()) -> ok.

fire_open(Role = #role{m_vip = #m_vip{lev = VipLev},
		       m_recruit = M = #m_recruit{all_score = OldScore},
		       partner_bag = #partner_bag{partner_list = PL}},
	  Type) ->
    {PL1, _} = list_util:split(5,
			       lists:reverse(lists:keysort(#partner.power,
							   PL))),
    AllScore = lists:sum([lists:sum([do_calc_score(I)
				     || I <- Eqms])
			  || #partner{holy_eqm = Eqms} <- PL1]),
    NewScore = max(OldScore, AllScore),
    NewM = M#m_recruit{all_score = NewScore},
    NRole = Role#role{m_recruit = NewM},
    case NewScore > OldScore of
      true ->
	  Msg = util:fbin("vip=~w, 神装战力=~w", [VipLev, NewScore]),
	  log:save(custom, {Role, <<"神装战力"/utf8>>, [{msg, Msg}]}),
	  push_all_score(NRole);
      _ -> skip
    end,
    Group = holy_eqm_lottery_data:group_list(),
    Fun = fun (GroupId, {AccRole, Acc}) ->
		  Stats = stats(GroupId, AccRole),
		  case maps:get(is_open, Stats, 0) of
		    1 -> {AccRole, Acc};
		    _ ->
			case check_open(AccRole, GroupId) of
			  1 ->
			      NewStats = Stats#{is_open => 1},
			      NewAccRole = update_stats(GroupId, NewStats, [],
							AccRole),
			      {NewAccRole, [GroupId | Acc]};
			  _ -> {AccRole, Acc}
			end
		  end
	  end,
    {NewRole, PushIds} = lists:foldl(Fun, {NRole, []},
				     Group),
    case Type of
      login -> skip;
      _ when PushIds =/= [] -> push_base(NewRole);
      _ -> skip
    end,
    NewRole.

-spec push_base(#role{}) -> ok.

push_base(Role = #role{m_recruit =
			   #m_recruit{lucky_holy_eqm = LuckyHoly}}) ->
    Group = holy_eqm_lottery_data:group_list(),
    FreeCount = var:get_var(Role, day, 80, 0),
    DayCounts = var:get_var(Role, day, 130, []),
    EndTime = date:unixtime() +
		date:now_diff(tomorrow, {0, 0, 0}),
    Fun = fun (GroupId, CliAcc) ->
		  FreeTimes =
		      holy_eqm_lottery_data:get_group_free(GroupId),
		  EveryBaodiCount =
		      holy_eqm_lottery_data:get_group_baodi(GroupId),
		  Stats = stats(GroupId, Role),
		  BaodiCount = maps:get(baodi_count, Stats, 0),
		  GetAwardIds = maps:get(get_award_ids, Stats, []),
		  AwardDrawTimes = maps:get(award_draw_times, Stats, 0),
		  IsOpen = check_open(Role, GroupId),
		  LuckyIds = list_util:keyfind(GroupId, LuckyHoly, []),
		  DayCount = list_util:keyfind(GroupId, DayCounts, 0),
		  [{GroupId, max(0, FreeTimes - FreeCount),
		    util:if_true(FreeTimes > FreeCount, 0, EndTime),
		    max(0, EveryBaodiCount - BaodiCount), LuckyIds,
		    AwardDrawTimes, GetAwardIds, DayCount, IsOpen}
		   | CliAcc]
	  end,
    CliL = lists:foldl(Fun, [], Group),
    sys_conn:pack_send(25219, {CliL}),
    ok.

-spec check_holy_score(#role{}, integer()) -> ok.

check_holy_score(#role{m_recruit =
			   #m_recruit{all_score = AllScore}},
		 BuyCondit) ->
    AllScore >= BuyCondit.

-spec push_all_score(#role{}) -> ok.

push_all_score(#role{m_recruit =
			 #m_recruit{all_score = AllScore}}) ->
    sys_conn:pack_send(25232, {AllScore}), ok.

check_open(_, 1) -> 1;
check_open(Role = #role{m_recruit =
			    #m_recruit{all_score = AllScore}},
	   GroupId) ->
    Stats = stats(GroupId, Role),
    case maps:get(is_open, Stats, 0) of
      1 -> 1;
      _ ->
	  case holy_eqm_lottery_data:get_group(GroupId) of
	    #{open_cond := OpenCond} ->
		case OpenCond =:= 0 of
		  true -> 1;
		  false -> util:if_true(AllScore >= OpenCond, 1, 0)
		end;
	    _ -> 0
	  end
    end.

do_calc_score(#item{base_id = Bid, main_attr = MainAttr,
		    holy_eqm_attr = HolyEqmAttr}) ->
    Fun = fun ({Attr, Num}, Acc) ->
		  Score =
		      util:ceil(partner_holy_eqm_data:get_holy_attr_score(Attr)
				  * Num
				  / 1000),
		  Score + Acc;
	      ({Pos, Attr, NewVal}, Acc) ->
		  case Pos >= 100 of
		    true -> Acc;
		    _ ->
			Score =
			    util:ceil(partner_holy_eqm_data:get_holy_attr_score(Attr)
					* NewVal
					/ 1000),
			Score + Acc
		  end
	  end,
    AttrScore = lists:foldl(Fun, 0,
			    MainAttr ++ HolyEqmAttr),
    BaseScore =
	partner_holy_eqm_data:get_holy_eqm_base_score(Bid),
    BaseScore + AttrScore.

-spec take_reward(#role{}, integer(), integer()) -> {ok,
						     #role{}} |
						    {false, bitstring()}.

take_reward(Role, GroupId, RewardId) ->
    case holy_eqm_lottery_data:get_baodi_reward(GroupId) of
      RewardList when is_list(RewardList) ->
	  Stats = stats(GroupId, Role),
	  GetAwardIds = maps:get(get_award_ids, Stats, []),
	  AwardDrawTimes = maps:get(award_draw_times, Stats, 0),
	  CanGetReward = [{Id, Reward}
			  || {Id, LimitTimes, Reward} <- RewardList,
			     AwardDrawTimes >= LimitTimes,
			     lists:member(Id, GetAwardIds) == false],
	  case lists:keyfind(RewardId, 1, CanGetReward) of
	    {RewardId, Award} ->
		GL = format:val_to_gain(Award, holy_eqm_lottery_award),
		case role_gain:do_notice(Role, GL) of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, NRole} ->
		      MaxTimes = lists:max([LimitTimes
					    || {_, LimitTimes, _}
						   <- RewardList]),
		      NewStats = case [IdT
				       || {IdT, _, _} <- RewardList,
					  lists:member(IdT,
						       [RewardId | GetAwardIds])
					    == false]
				     of
				   [] ->
				       Stats#{get_award_ids => [],
					      award_draw_times =>
						  max(0,
						      AwardDrawTimes -
							MaxTimes)};
				   _ ->
				       Stats#{get_award_ids =>
						  [RewardId | GetAwardIds]}
				 end,
		      NewRole = update_stats(GroupId, NewStats, [], NRole),
		      log:log_gain(GL, Role, NewRole,
				   lang:get(<<"精灵抽奖领取次数奖励"/utf8>>),
				   util:fbin("领取额外奖励Id:~w，当前次数:~w",
					     [RewardId, AwardDrawTimes])),
		      push_base(NewRole),
		      {ok, NewRole}
		end;
	    _ -> {false, lang:get(<<"该奖励不可领取"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"奖励不存在"/utf8>>)}
    end.

-spec set_lucky_sprites(#role{}, pos_integer(),
			list()) -> {ok, #role{}} | {false, bitstring()}.

set_lucky_sprites(Role = #role{m_recruit =
				   M = #m_recruit{lucky_holy_eqm = LuckyHoly}},
		  GroupId, LuckyIds) ->
    LimitNum =
	holy_eqm_lottery_data:get_group_lucky_num(GroupId),
    LimitIds =
	holy_eqm_lottery_data:get_group_lucky_ids(GroupId),
    Num1 = length(LuckyIds),
    Num2 = length(lists:usort([IdT
			       || {_, IdT} <- LuckyIds,
				  lists:member(IdT, LimitIds)])),
    Num3 = length(lists:usort([Pos
			       || {Pos, _} <- LuckyIds])),
    Num4 = length([IdT || {_, IdT} <- LuckyIds, IdT == 0]),
    case Num1 == Num3 andalso Num1 == Num2 + Num4 of
      true when Num1 =< LimitNum ->
	  NewLuckyHoly = lists:keystore(GroupId, 1, LuckyHoly,
					{GroupId, LuckyIds}),
	  NewM = M#m_recruit{lucky_holy_eqm = NewLuckyHoly},
	  NewRole = Role#role{m_recruit = NewM},
	  push_base(NewRole),
	  LogId1 = list_util:keyfind(1, LuckyIds, 0),
	  LogId2 = list_util:keyfind(2, LuckyIds, 0),
	  LogId3 = list_util:keyfind(3, LuckyIds, 0),
	  LogId4 = list_util:keyfind(4, LuckyIds, 0),
	  Msg = util:fbin("1=~w, 2=~w, 3=~w, 4=~w",
			  [LogId1, LogId2, LogId3, LogId4]),
	  log:save(custom,
		   {Role, util:fbin("神装许愿情况-~w", [GroupId]),
		    [{msg, Msg}]}),
	  {ok, NewRole};
      _ -> {false, lang:get(<<"参数错误"/utf8>>)}
    end.

-spec draw(#role{}, integer(), integer(),
	   integer()) -> {ok, #role{}} | {false, binary()}.

draw(Role, GroupId, Times, CostType) ->
    case check_cond(Role, GroupId, Times, CostType) of
      {ok, Data} -> do_draw(Role, Data, Times, CostType);
      {false, Msg} -> {false, Msg}
    end.

do_draw(Role, GroupData, Times = 1, CostType = 1) ->
    UsedFreeTimes = var:get_var(Role, day, 80, 0),
    FreeTimes = maps:get(free_times, GroupData, 0),
    case FreeTimes > 0 of
      true ->
	  case FreeTimes > UsedFreeTimes of
	    true ->
		draw_by_free(Role, GroupData, Times, CostType,
			     UsedFreeTimes);
	    _ ->
		{false,
		 lang:get(<<"Lượt miễn phí hôm nay đã dùng hết"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Bức tượng đá này không thể được cầu "
		      "nguyện miễn phí"/utf8>>)}
    end;
do_draw(Role, GroupData = #{group_id := GroupId}, Times,
	CostType) ->
    {LossItems, GainItems} = calc_gl(Times, CostType,
				     GroupData),
    Loss = format:val_to_loss(LossItems, holy_eqm_lottery),
    case Loss of
      [_ | _] ->
	  Gains = format:val_to_gain(GainItems, holy_eqm_lottery),
	  GL = Loss ++ Gains,
	  case draw_process(Role, GroupData, CostType, Times, GL)
	      of
	    {ok, NewRole} ->
		case Times == 1 of
		  true ->
		      log:save(join,
			       {NewRole, <<"产出类玩法"/utf8>>,
				util:fbin(<<"单抽~w库神装抽奖"/utf8>>, [GroupId])});
		  _ ->
		      log:save(join,
			       {NewRole, <<"产出类玩法"/utf8>>,
				util:fbin(<<"十连~w库神装抽奖"/utf8>>, [GroupId])})
		end,
		DayCount = var:get_list_val(NewRole, day, 130, GroupId,
					    0),
		NewCount = case CostType of
			     3 -> Times + DayCount;
			     _ -> DayCount
			   end,
		NewRole2 = var:set_list_val(NewRole, day, 130, GroupId,
					    NewCount),
		push_base(NewRole2),
		{ok, NewRole2};
	    {false, Msg} -> {false, Msg}
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
	    {__Pidholy_eqm_lottery473, _,
	     {__Levelholy_eqm_lottery473,
	      __Tracesholy_eqm_lottery473}}
		when __Levelholy_eqm_lottery473 band 8 /= 0 orelse
		       __Tracesholy_eqm_lottery473 /= [] ->
		lager:do_log(error,
			     [{module, holy_eqm_lottery}, {function, do_draw},
			      {line, 473}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]神装抽奖消耗有误Times:~w, Data:~w",
					   [Role#role.name, Times, GroupData]),
			     none, 4096, 8, __Levelholy_eqm_lottery473,
			     __Tracesholy_eqm_lottery473, lager_event,
			     __Pidholy_eqm_lottery473);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Có lỗi trong quá trình rút thăm may "
		      "mắn trang bị thần thánh và không thể "
		      "thực hiện rút thăm."/utf8>>)}
    end.

calc_gl(1, 3, GroupData) ->
    LossGold = maps:get(loss_gold_once, GroupData, 0),
    Gain = maps:get(gain_once, GroupData, []),
    Loss = case LossGold > 0 of
	     true -> [{3, LossGold}];
	     _ -> []
	   end,
    {Loss, Gain};
calc_gl(10, 3, GroupData) ->
    LossGold = maps:get(loss_gold_ten, GroupData, 0),
    GainOnce = maps:get(gain_once, GroupData, []),
    Gain = [{ItemT, ValT * 10}
	    || {ItemT, ValT} <- GainOnce],
    Loss = case LossGold > 0 of
	     true -> [{3, LossGold}];
	     _ -> []
	   end,
    {Loss, Gain};
calc_gl(1, 4, GroupData) ->
    Loss = maps:get(loss_item_once, GroupData, []),
    Gain = maps:get(gain_once, GroupData, []),
    {Loss, Gain};
calc_gl(10, 4, GroupData) ->
    Loss = maps:get(loss_item_ten, GroupData, []),
    GainOnce = maps:get(gain_once, GroupData, []),
    Gain = [{ItemT, ValT * 10}
	    || {ItemT, ValT} <- GainOnce],
    {Loss, Gain};
calc_gl(_Times, _CostType, _Data) -> {[], []}.

draw_by_free(Role, Data = #{group_id := GroupId}, Times,
	     CostType, UsedFreeTimes) ->
    case draw_process(Role, Data, CostType, Times, []) of
      {ok, DrawRole} ->
	  NewRole = var:set_var(DrawRole, day, 80,
				UsedFreeTimes + 1),
	  log:save(join,
		   {NewRole, <<"产出类玩法"/utf8>>,
		    util:fbin(<<"免费~w库神装抽奖"/utf8>>, [GroupId])}),
	  push_base(NewRole),
	  {ok, NewRole};
      {false, Msg} -> {false, Msg}
    end.

-spec broadcast(#role{}, Msg :: binary()) -> ok.

broadcast(_Role, Msg) ->
    notice:broadcast(rumor, Msg), ok.

draw_process(Role = #role{name = RName,
			  link = #link{conn_pid = ConnPid}},
	     GroupData = #{name := Name, group_id := GroupId},
	     CostType, Times, GL) ->
    Stats = stats(GroupId, Role),
    AllDrawTimes = calc_all_draw_times(Role),
    DrawTimes = maps:get(draw_times, Stats, 0),
    TenTimes = maps:get(ten_count, Stats, 0),
    Args = #{stats => Stats, draw_type => Times,
	     all_draw_times => AllDrawTimes,
	     old_draw_times => DrawTimes, old_ten_count => TenTimes},
    case role_gain:do(Role, GL,
		      #gain_loss_opts{need_notify_fail_item = true})
	of
      {ok, LossRole, _} ->
	  case do_draw_process(LossRole, GroupData, Times, Args)
	      of
	    {ok, Rewards, NewArgs} ->
		RewardArgs = split_rewards(Rewards, LossRole, #{}),
		Items = maps:get(items, RewardArgs, []),
		Logs = maps:get(logs, RewardArgs, []),
		Gains = format:val_to_gain(Items, holy_eqm_lottery),
		case role_gain:do(LossRole, Gains, #gain_loss_opts{}) of
		  {ok, NRole, GainOpts = #gain_loss_opts{}} ->
		      CliItemsT = format:gain_to_cli_drop(GainOpts),
		      CliItems = [{ItemIdT, ItemBidT, ValT}
				  || {ItemBidT, _, ValT, ItemIdT, _}
					 <- CliItemsT],
		      NewLimitInfo = maps:get(limit_info, NewArgs),
		      NStats = maps:get(stats, NewArgs),
		      NewStats = case Times =:= 10 of
				   true -> NStats#{ten_count => TenTimes + 1};
				   _ -> NStats
				 end,
		      NewRole = update_stats(GroupId, NewStats, Items, NRole),
		      holy_eqm_lottery_mgr:save(NewLimitInfo),
		      AddLogs = [{RName, IdT, NumT} || {IdT, NumT} <- Logs],
		      holy_eqm_lottery_mgr:info({add_log, ConnPid, GroupId,
						 AddLogs}),
		      sys_conn:pack_send(25217,
					 {GroupId, Times, CostType, CliItems}),
		      log:log_gain(GL ++ Gains, Role, NewRole,
				   <<"神装抽奖"/utf8>>,
				   util:fbin("神装抽奖[类型:~ts, 召唤获得:~w]",
					     [Name, RewardArgs])),
		      NewRole1 =
			  role_trigger:fire([#evt_holy_eqm_lottery{count =
								       Times}],
					    NewRole),
		      {ok, NewRole1};
		  {false, #gain{msg = Msg}} -> {false, Msg};
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
			{__Pidholy_eqm_lottery566, _,
			 {__Levelholy_eqm_lottery566,
			  __Tracesholy_eqm_lottery566}}
			    when __Levelholy_eqm_lottery566 band 8 /= 0 orelse
				   __Tracesholy_eqm_lottery566 /= [] ->
			    lager:do_log(error,
					 [{module, holy_eqm_lottery},
					  {function, draw_process}, {line, 566},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[~ts]Ba lô đã đầy:~w",
						       [LossRole#role.name,
							Err]),
					 none, 4096, 8,
					 __Levelholy_eqm_lottery566,
					 __Tracesholy_eqm_lottery566,
					 lager_event, __Pidholy_eqm_lottery566);
			_ -> ok
		      end,
		      {false, lang:get(<<"Ba lô đã đầy"/utf8>>)}
		end;
	    {false, Msg} -> {false, Msg}
	  end;
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
	    {__Pidholy_eqm_lottery577, _,
	     {__Levelholy_eqm_lottery577,
	      __Tracesholy_eqm_lottery577}}
		when __Levelholy_eqm_lottery577 band 8 /= 0 orelse
		       __Tracesholy_eqm_lottery577 /= [] ->
		lager:do_log(error,
			     [{module, holy_eqm_lottery},
			      {function, draw_process}, {line, 577},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]召唤消耗不足，无法进行召唤:~w",
					   [Role#role.name, Err]),
			     none, 4096, 8, __Levelholy_eqm_lottery577,
			     __Tracesholy_eqm_lottery577, lager_event,
			     __Pidholy_eqm_lottery577);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Tiêu thụ triệu hồi không đủ, không thể "
		      "triệu hồi"/utf8>>)}
    end.

do_draw_process(Role = #role{id = RoleId,
			     m_recruit =
				 #m_recruit{lucky_holy_eqm = AllLuckIds}},
		GroupData = #{group_id := GroupId}, Times, Args) ->
    RandListT = holy_eqm_lottery_data:group_items(GroupId),
    LuckIds = list_util:keyfind(GroupId, AllLuckIds, []),
    RandList = add_lucky_pro(RandListT, LuckIds),
    LimitInfo = limit_info({RoleId, GroupId}),
    case draw_times(Role, Times, GroupData, RandList,
		    Args#{limit_info => LimitInfo})
	of
      {ok, NewArgs} ->
	  Rewards = maps:get(rewards, NewArgs),
	  {ok, Rewards, NewArgs};
      {false, Msg} -> {false, Msg}
    end.

add_lucky_pro(DoList, []) -> DoList;
add_lucky_pro(DoList, LuckyIds) ->
    AllLength = length(DoList),
    Fun = fun ({_, LuckyGroupId}, Acc) ->
		  AddProList =
		      holy_eqm_lottery_data:get_lucky_items(LuckyGroupId),
		  item_lib:merge(AddProList, Acc)
	  end,
    AddProList = lists:foldl(Fun, [], LuckyIds),
    case [util:ceil(Weight *
		      max(0, list_util:keyfind(BidT, AddProList, 0) - 1000)
		      * 1.0e-3)
	  || #{bid := BidT, weight := Weight} <- DoList,
	     lists:keymember(BidT, 1, AddProList)]
	of
      Temp = [_ | _] when AllLength > length(Temp) ->
	  AllAddPro = lists:sum(Temp),
	  DelPro = util:ceil(AllAddPro /
			       (AllLength - length(Temp))),
	  Fun2 = fun (Data = #{bid := BidT, weight := Weight},
		      Acc) ->
			 case lists:keyfind(BidT, 1, AddProList) of
			   {BidT, AddPro} ->
			       NewData = Data#{weight =>
						   util:ceil(Weight * AddPro *
							       1.0e-3)},
			       [NewData | Acc];
			   _ ->
			       NewData = Data#{weight =>
						   max(0, Weight - DelPro)},
			       [NewData | Acc]
			 end
		 end,
	  lists:foldl(Fun2, [], DoList);
      _ -> DoList
    end.

draw_times(Role, Times, GroupData, RandList,
	   Args = #{stats := Stats, limit_info := LimitInfo,
		    all_draw_times := AllDrawTimes})
    when Times > 0 ->
    DrawTimes = maps:get(draw_times, Stats, 0),
    CurDrawTimes = DrawTimes + 1,
    Steps = [must_hit_ten, must_hit_once,
	     must_not_in_m_times, hit_must_not_after_m_times,
	     weight],
    case draw_steps(Steps, CurDrawTimes, GroupData,
		    RandList, Role,
		    Args#{all_draw_times => AllDrawTimes + 1})
	of
      {ok, NewArgs} ->
	  NStats = maps:get(stats, NewArgs),
	  IsBaodi = maps:get(is_baodi, NewArgs, false),
	  BaodiCount = maps:get(baodi_count, NStats, 0),
	  NBaodiCount = if IsBaodi -> 0;
			   true -> BaodiCount + 1
			end,
	  AwardDrawTimes = maps:get(award_draw_times, Stats, 0),
	  NewAwardDrawTimes = AwardDrawTimes + 1,
	  NewStats = NStats#{draw_times => CurDrawTimes,
			     baodi_count => NBaodiCount,
			     award_draw_times => NewAwardDrawTimes},
	  DrawOut = maps:get(draw_out, NewArgs),
	  NewLimitInfo = update_limit_info(DrawOut, CurDrawTimes,
					   LimitInfo),
	  draw_times(Role, Times - 1, GroupData, RandList,
		     NewArgs#{stats => NewStats, limit_info => NewLimitInfo,
			      draw_out => #{}});
      {false, Msg} -> {false, Msg}
    end;
draw_times(_Role, _Times, _GroupData, _RandList,
	   Args) ->
    {ok, Args}.

draw_steps([], _CurTimes, _GroupData, _RandList, _Role,
	   Args) ->
    {ok, Args};
draw_steps([Step | T], CurTimes, GroupData, RandList,
	   Role, Args) ->
    case draw_steps(Step, CurTimes, GroupData, RandList,
		    Role, Args)
	of
      {ok, NewArgs = #{is_break := true}} ->
	  {ok, NewArgs#{is_break => false}};
      {ok, NewArgs} ->
	  draw_steps(T, CurTimes, GroupData, RandList, Role,
		     NewArgs);
      {ok, NewRandList, NewArgs} ->
	  draw_steps(T, CurTimes, GroupData, NewRandList, Role,
		     NewArgs);
      {false, Msg} -> {false, Msg}
    end;
draw_steps(must_hit_ten, CurTimes,
	   #{group_id := GroupId}, _RandList, _Role, Args) ->
    DrawType = maps:get(draw_type, Args, 1),
    case DrawType =:= 10 of
      true ->
	  OldDrawTimes = maps:get(old_draw_times, Args, 0),
	  OldTenCount = maps:get(old_ten_count, Args, 0),
	  CurTenTimes = OldTenCount * 10 +
			  (CurTimes - OldDrawTimes),
	  case holy_eqm_lottery_data:group_must({GroupId,
						 DrawType, CurTenTimes})
	      of
	    #{id := PtnBidL} ->
		{PtnBid, _} = list_util:keyrand(PtnBidL, 2),
		Rewards = maps:get(rewards, Args, []),
		DrawOut = #{id => 0, class_id => 0, num => 1,
			    is_log => 1, bid => PtnBid},
		{ok,
		 Args#{rewards => [DrawOut | Rewards],
		       draw_out => DrawOut, is_break => true}};
	    _ -> {ok, Args}
	  end;
      _ -> {ok, Args}
    end;
draw_steps(must_hit_once, CurTimes,
	   #{group_id := GroupId}, _RandList, _Role, Args) ->
    DrawType = maps:get(draw_type, Args, 1),
    case DrawType =:= 1 of
      true ->
	  case holy_eqm_lottery_data:group_must({GroupId,
						 DrawType, CurTimes})
	      of
	    #{id := Ids} ->
		{ItemBid, _} = list_util:keyrand(Ids, 2),
		Rewards = maps:get(rewards, Args, []),
		DrawOut = #{id => 0, class_id => 0, num => 1,
			    is_log => 1, bid => ItemBid},
		NewRewards = [DrawOut | Rewards],
		{ok,
		 Args#{rewards => NewRewards, draw_out => DrawOut,
		       is_break => true}};
	    _ -> {ok, Args}
	  end;
      _ -> {ok, Args}
    end;
draw_steps(weight, CurTimes,
	   GroupData = #{group_id := GroupId}, RandList,
	   Role = #role{m_recruit =
			    #m_recruit{lucky_holy_eqm = AllLuckIds}},
	   Args = #{stats := Stats,
		    limit_info := #recruit_limit{info = LimitInfo}}) ->
    RandClassL = holy_eqm_lottery_data:rand_class(GroupId),
    GroupRandLT =
	holy_eqm_lottery_data:group_items(GroupId),
    LuckIds = list_util:keyfind(GroupId, AllLuckIds, []),
    GroupRandL = add_lucky_pro(GroupRandLT, LuckIds),
    Fun = fun ({ClassId, _, N, _}) when N > 0 ->
		  IdLimit = maps:get({class, ClassId}, LimitInfo, #{}),
		  HitN = maps:get(last_hit_n, IdLimit, 0),
		  N < CurTimes - HitN;
	      (_) -> false
	  end,
    RandClassL1 = lists:filter(Fun, RandClassL),
    EveryBaodiN = maps:get(every_baodi_n, GroupData, 0),
    BaodiCount = maps:get(baodi_count, Stats, 0),
    IsBaodi = EveryBaodiN =/= 0 andalso
		BaodiCount + 1 >= EveryBaodiN,
    ClassId = case RandClassL1 of
		_ when IsBaodi ->
		    BaodiRandClassL =
			holy_eqm_lottery_data:rand_baodi_class(GroupId),
		    {ClassIdT, _} = util:rand_list(BaodiRandClassL, 2),
		    ClassIdT;
		[_ | _] ->
		    {ClassIdT, _, _, _} = util:rand_list(RandClassL1),
		    ClassIdT;
		_ ->
		    Fun2 = fun ({ClassId, _, _, N}) when N > 0 ->
				   IdLimit = maps:get({class, ClassId},
						      LimitInfo, #{}),
				   HitN = maps:get(last_hit_n, IdLimit, 0),
				   N < CurTimes - HitN;
			       (_) -> true
			   end,
		    RandClassL2 = lists:filter(Fun2, RandClassL),
		    {ClassIdT, _, _, _} = util:rand_list(RandClassL2, 2),
		    ClassIdT
	      end,
    ClassL = [RandCfg
	      || RandCfg = #{class_id := CfgClassId} <- RandList,
		 CfgClassId =:= ClassId],
    DoList = case ClassL of
	       [_ | _] -> ClassL;
	       _ ->
		   [RandCfg
		    || RandCfg = #{class_id := CfgClassId} <- GroupRandL,
		       CfgClassId =:= ClassId]
	     end,
    case maps_util:rand(DoList, weight) of
      Cfg = #{id := Id, num := Num, bid := Bid} ->
	  IsNotice = maps:get(is_notice, Cfg, 0),
	  IsLog = maps:get(is_log, Cfg, 0),
	  Rewards = maps:get(rewards, Args, []),
	  IdLimit0 = maps:get(Id, LimitInfo, #{}),
	  HitN0 = maps:get(last_hit_n, IdLimit0, 0),
	  IsFirst = util:if_true(HitN0 =:= 0, 1, 0),
	  DrawOut = #{id => Id, class_id => ClassId, bid => Bid,
		      num => Num, is_notice => IsNotice, is_log => IsLog,
		      is_first => IsFirst},
	  {ok,
	   Args#{rewards => [DrawOut | Rewards],
		 draw_out => DrawOut, is_break => true,
		 is_baodi => IsBaodi}};
      _ERR ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholy_eqm_lottery748, _,
	     {__Levelholy_eqm_lottery748,
	      __Tracesholy_eqm_lottery748}}
		when __Levelholy_eqm_lottery748 band 8 /= 0 orelse
		       __Tracesholy_eqm_lottery748 /= [] ->
		lager:do_log(error,
			     [{module, holy_eqm_lottery},
			      {function, draw_steps}, {line, 748},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~ts 十连抽没有抽取内容:~w, ~w, ~w",
					   [Role#role.name,
					    [{Id, Weight, Bid, Num}
					     || #{id := Id, bid := Bid,
						  num := Num, weight := Weight}
						    <- DoList],
					    ClassId, _ERR]),
			     none, 4096, 8, __Levelholy_eqm_lottery748,
			     __Tracesholy_eqm_lottery748, lager_event,
			     __Pidholy_eqm_lottery748);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Không có đạo cụ ngẫu nhiên để vẽ"/utf8>>)}
    end;
draw_steps(must_not_in_m_times, CurTimes, _GroupData,
	   RandList, _Role, Args) ->
    NewRandList = [Cfg
		   || Cfg = #{must_not_in_m_times := N} <- RandList,
		      N =:= 0 orelse CurTimes > N],
    {ok, NewRandList, Args};
draw_steps(hit_must_not_after_m_times, CurTimes,
	   _GroupData, RandList, _Role,
	   Args = #{limit_info :=
			#recruit_limit{info = LimitInfo}}) ->
    Fun = fun (#{id := Id, hit_must_not_after_m_times := N})
		  when N > 0 ->
		  IdLimit = maps:get(Id, LimitInfo, #{}),
		  HitN = maps:get(last_hit_n, IdLimit, 0),
		  N < CurTimes - HitN;
	      (_) -> true
	  end,
    NewRandList = lists:filter(Fun, RandList),
    {ok, NewRandList, Args};
draw_steps(Step, _CurTimes, GroupData, _RandList, Role,
	   Args) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholy_eqm_lottery764, _,
       {__Levelholy_eqm_lottery764,
	__Tracesholy_eqm_lottery764}}
	  when __Levelholy_eqm_lottery764 band 8 /= 0 orelse
		 __Tracesholy_eqm_lottery764 /= [] ->
	  lager:do_log(error,
		       [{module, holy_eqm_lottery}, {function, draw_steps},
			{line, 764}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]未知的召唤随机过程步骤[Step:~w][Data:~w][Args:~w]",
				     [Role#role.name, Step, GroupData, Args]),
		       none, 4096, 8, __Levelholy_eqm_lottery764,
		       __Tracesholy_eqm_lottery764, lager_event,
		       __Pidholy_eqm_lottery764);
      _ -> ok
    end,
    {false,
     lang:get(<<"bước ngẫu nhiên không xác định"/utf8>>)}.

check_cond(Role = #role{lev = RLev,
			p_eqm = #package{free_cell = FreeCell}},
	   GroupId, Times, CostType) ->
    RestLength = length(FreeCell),
    case Times > RestLength of
      true -> {false, lang:get(<<"Ba lô đã đầy"/utf8>>)};
      _ ->
	  case Times =:= 1 orelse Times =:= 10 of
	    true ->
		case role_misc:check_open_cond([{dungeon_heaven,
						 holy_eqm_lottery_data:get_const(heaven_dun_condition)}],
					       Role)
		    of
		  true ->
		      WorldLev = world_lev:get_world_lev(),
		      case RLev >=
			     holy_eqm_lottery_data:get_const(player_lev_condition)
			     andalso
			     WorldLev >=
			       holy_eqm_lottery_data:get_const(world_lev_condition)
			     orelse
			     RLev >=
			       holy_eqm_lottery_data:get_const(player_lev_second_condition)
			  of
			true ->
			    DayCount = var:get_list_val(Role, day, 130, GroupId,
							0),
			    MaxCount =
				holy_eqm_lottery_data:get_day_limit_count(GroupId),
			    case DayCount + Times > MaxCount of
			      true when CostType == 3 ->
				  {false,
				   lang:get(<<"Lệnh triệu hồi kim cương ngày hôm nay "
					      "đã đạt đến giới hạn!"/utf8>>)};
			      _ ->
				  case holy_eqm_lottery_data:get_group(GroupId)
				      of
				    Data = #{open_cond := OpenCond} ->
					case check_open(Role, GroupId) of
					  1 -> {ok, Data};
					  _ ->
					      {false,
					       lang:get(<<"Điều kiện không được đáp ứng"/utf8>>)}
					end;
				    _ ->
					{false,
					 lang:get(<<"Nhóm thẻ không xác định"/utf8>>)}
				  end
			    end;
			_ ->
			    {false,
			     lang:get(<<"Điều kiện không được đáp ứng"/utf8>>)}
		      end;
		  {false, Msg} -> {false, Msg}
		end;
	    _ ->
		{false, lang:get(<<"Số lần rút không xác định"/utf8>>)}
	  end
    end.

stats(GroupId,
      #role{m_recruit =
		#m_recruit{holy_eqm_lottery = List}}) ->
    case lists:keyfind(GroupId, #recruit_info.group_id,
		       List)
	of
      #recruit_info{stats = Stats} -> Stats;
      _ ->
	  #{draw_times => 0, ten_count => 0, baodi_count => 0}
    end.

update_stats(GroupId, Stats, Reward,
	     Role = #role{m_recruit =
			      MRecruit = #m_recruit{holy_eqm_lottery = List,
						    logs = Logs}}) ->
    NewLogs = lists:sublist(Reward ++ Logs, 20),
    case lists:keyfind(GroupId, #recruit_info.group_id,
		       List)
	of
      Info = #recruit_info{} ->
	  NewList = lists:keystore(GroupId,
				   #recruit_info.group_id, List,
				   Info#recruit_info{stats = Stats}),
	  Role#role{m_recruit =
			MRecruit#m_recruit{holy_eqm_lottery = NewList,
					   logs = NewLogs}};
      false ->
	  Role#role{m_recruit =
			MRecruit#m_recruit{holy_eqm_lottery =
					       [#recruit_info{group_id =
								  GroupId,
							      stats = Stats}
						| List],
					   logs = NewLogs}}
    end.

limit_info(Key) ->
    case holy_eqm_lottery_mgr:lookup(Key) of
      {ok, Info = #recruit_limit{}} -> Info;
      _ ->
	  Info = #{last_hit_n => 0},
	  #recruit_limit{key = Key, info = Info}
    end.

update_limit_info(#{id := Id, class_id := ClassId},
		  Times, LimitInfo = #recruit_limit{info = Info})
    when Id > 0 ->
    IdLimit = maps:get(Id, Info, #{}),
    ClassLimit = maps:get({class, ClassId}, Info, #{}),
    NewInfo = Info#{Id => IdLimit#{last_hit_n => Times},
		    {class, ClassId} => ClassLimit#{last_hit_n => Times}},
    LimitInfo#recruit_limit{info = NewInfo};
update_limit_info(_DrawOut, _Times, LimitInfo) ->
    LimitInfo.

get_log(_Role, 2, GroupId) ->
    #recruit_limit{info = Info} =
	holy_eqm_lottery_mgr:get_log(GroupId),
    Logs = maps:get(logs, Info, []),
    Logs;
get_log(#role{name = Name,
	      m_recruit = #m_recruit{logs = List}},
	_, _) ->
    [{Name, IdT, NumT} || {IdT, NumT} <- List].

calc_all_draw_times(Role) ->
    GroupIds = holy_eqm_lottery_data:group_list(),
    calc_all_draw_times(GroupIds, Role, 0).

calc_all_draw_times([], _Role, Acc) -> Acc;
calc_all_draw_times([GroupId | Other], Role, Acc) ->
    Stats = stats(GroupId, Role),
    DrawTime = maps:get(draw_times, Stats, 0),
    calc_all_draw_times(Other, Role, DrawTime + Acc).

split_rewards([], _Role, Args) -> Args;
split_rewards([Cfg = #{bid := Bid, num := Num} | T],
	      Role, Args) ->
    IsLog = maps:get(is_log, Cfg, 0),
    LogsL = maps:get(logs, Args, []),
    Items = maps:get(items, Args, []),
    NewItems = [{Bid, Num} | Items],
    NewLogsL = util:if_true(IsLog == 1,
			    [{Bid, Num} | LogsL], LogsL),
    split_rewards(T, Role,
		  Args#{items => NewItems, logs => NewLogsL}).

gm_test_refresh(Role, _GroupId, _Times, Num, Result)
    when Num =< 0 ->
    {Role, Result};
gm_test_refresh(Role, GroupId, Times, Num, Result) ->
    GroupData = holy_eqm_lottery_data:get_group(GroupId),
    Stats = stats(GroupId, Role),
    AllDrawTimes = calc_all_draw_times(Role),
    Args = #{stats => Stats, draw_type => Times,
	     all_draw_times => AllDrawTimes},
    Fun = fun (#{id := Bid, class_id := ClassId},
	       {BidL, ClassL}) ->
		  {_, Num1} = list_util:keyfind(Bid, 1, BidL, {Bid, 0}),
		  {_, Num2} = list_util:keyfind(ClassId, 1, ClassL,
						{ClassId, 0}),
		  NewBidL = lists:keystore(Bid, 1, BidL, {Bid, Num1 + 1}),
		  NewClassL = lists:keystore(ClassId, 1, ClassL,
					     {ClassId, Num2 + 1}),
		  {NewBidL, NewClassL}
	  end,
    case do_draw_process(Role, GroupData, Times, Args) of
      {ok, Rewards, NewArgs} ->
	  NewResult = lists:foldl(Fun, Result, Rewards),
	  NewLimitInfo = maps:get(limit_info, NewArgs),
	  NewStats = maps:get(stats, NewArgs),
	  UpdateRole = update_stats(GroupId, NewStats, [], Role),
	  holy_eqm_lottery_mgr:save(NewLimitInfo),
	  gm_test_refresh(UpdateRole, GroupId, Times, Num - 1,
			  NewResult);
      _ERR ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholy_eqm_lottery915, _,
	     {__Levelholy_eqm_lottery915,
	      __Tracesholy_eqm_lottery915}}
		when __Levelholy_eqm_lottery915 band 8 /= 0 orelse
		       __Tracesholy_eqm_lottery915 /= [] ->
		lager:do_log(error,
			     [{module, holy_eqm_lottery},
			      {function, gm_test_refresh}, {line, 915},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("神装抽奖报错:~w", [_ERR]), none, 4096, 8,
			     __Levelholy_eqm_lottery915,
			     __Tracesholy_eqm_lottery915, lager_event,
			     __Pidholy_eqm_lottery915);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Kiểm tra bị gián đoạn do lỗi"/utf8>>)}
    end.


