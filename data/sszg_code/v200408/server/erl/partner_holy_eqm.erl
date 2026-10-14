-file("src/mod/partner/partner_holy_eqm.erl", 1).

-module(partner_holy_eqm).

-lager_records([{role_var, [id, vars]},
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
		{holy_eqm_set_cell, [ver, id, partner_id, name, list]},
		{m_holy_eqm_set, [ver, num, buy_num, next_id, list]},
		{holy_eqm_attr_data,
		 [group_id, attr, time_min, time_max, val_range,
		  first_pro, reset_pro]},
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

-export([init/1, get_set_skill/1, info/2,
	 push_partner_holy_eqm/1, dress_holy_eqm/3,
	 drop_holy_eqm/3, holy_eqm_ref/4, holy_eqm_ref_save/3,
	 holy_eqm_sell/2, holy_eqm_sell_info/2,
	 show_holy_eqm_attr/2, fire/2, fire/3, login/1]).

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

-file("src/mod/partner/partner_holy_eqm.erl", 24).

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

-file("src/mod/partner/partner_holy_eqm.erl", 25).

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

-file("src/mod/partner/partner_holy_eqm.erl", 26).

-file("inc/holy_eqm.hrl", 1).

-record(holy_eqm_attr_data,
	{group_id = 0, attr, time_min = 0, time_max = 0,
	 val_range = [], first_pro = 0, reset_pro = 0}).

-record(m_holy_eqm_set,
	{ver = 1, num = 0, buy_num = 0, next_id = 1,
	 list = []}).

-record(holy_eqm_set_cell,
	{ver = 1, id = 0, partner_id = 0, name = <<>>,
	 list = []}).

-file("src/mod/partner/partner_holy_eqm.erl", 27).

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

-file("src/mod/partner/partner_holy_eqm.erl", 28).

-file("inc/log.hrl", 1).

-file("src/mod/partner/partner_holy_eqm.erl", 29).

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

-file("src/mod/partner/partner_holy_eqm.erl", 30).

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

-file("src/mod/partner/partner_holy_eqm.erl", 31).

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

-file("src/mod/partner/partner_holy_eqm.erl", 32).

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

-file("src/mod/partner/partner_holy_eqm.erl", 33).

-spec init(#item{}) -> #item{}.

init(Item = #item{base_id = Bid}) ->
    case is_holy_eqm(Item) of
      false -> Item;
      _ ->
	  case partner_holy_eqm_data:get_rand_attr_group(Bid) of
	    {0, _} -> Item;
	    {_, 0} -> Item;
	    {Num, GroupId} ->
		AttrMaxL = partner_holy_eqm_data:get_group_max(GroupId),
		RandList =
		    partner_holy_eqm_data:attr_rand_list(GroupId),
		NItem = do_init_attr(Num, RandList, AttrMaxL, Item),
		NItem;
	    _ -> Item
	  end
    end.

do_init_attr(_, [], _, Item) -> Item;
do_init_attr(Num, _, _, Item) when Num =< 0 -> Item;
do_init_attr(Num, RandList, AttrMaxL,
	     Item = #item{holy_eqm_attr = HolyEqmAttr,
			  data = ExtraData}) ->
    RandData = util:rand_list(RandList,
			      #holy_eqm_attr_data.first_pro),
    Attr = RandData#holy_eqm_attr_data.attr,
    TimeMin = RandData#holy_eqm_attr_data.time_min,
    {MinVal, MaxVal} =
	RandData#holy_eqm_attr_data.val_range,
    Val = util:rand(MinVal, MaxVal),
    {NewVal, NewRandList} = case lists:keyfind(Attr, 1,
					       AttrMaxL)
				of
			      {_, ValMax, IsRepeat} ->
				  NewValT = util:if_true(Val > ValMax, ValMax,
							 Val),
				  NewRandListT = case IsRepeat =:= 0 of
						   true ->
						       [D
							|| D =
							       #holy_eqm_attr_data{attr
										       =
										       AttrT}
							       <- RandList,
							   AttrT =/= Attr];
						   _ -> RandList
						 end,
				  {NewValT, NewRandListT};
			      _ -> {Val, RandList}
			    end,
    NewHolyEqmAttr = lists:keystore(Num, 1, HolyEqmAttr,
				    {Num, Attr, NewVal}),
    PosL = list_util:keyfind(104, ExtraData, []),
    NewPosL = lists:keystore(Num, 1, PosL, {Num, TimeMin}),
    NewExtraData = lists:keystore(104, 1, ExtraData,
				  {104, NewPosL}),
    NewItem = Item#item{holy_eqm_attr = NewHolyEqmAttr,
			data = NewExtraData},
    do_init_attr(Num - 1, NewRandList, AttrMaxL, NewItem).

-spec get_set_skill(#partner{}) -> {list(), list()}.

get_set_skill(#partner{holy_eqm = HolyEqm}) ->
    get_set_skill(lists:keysort(#item.set_id, HolyEqm), [],
		  []).

get_set_skill([], AttrL, SkillL) -> {AttrL, SkillL};
get_set_skill(HolyEqm = [#item{set_id = SetId} | _],
	      AttrL, SkillL) ->
    SetBid = SetId div 100,
    L1 = [I
	  || I = #item{set_id = SetT} <- HolyEqm,
	     SetT div 100 == SetBid],
    Fun1 = fun (#item{set_id = SetT},
		{AccSkills, CalcNum}) ->
		   Temp = [I
			   || I = #item{set_id = SetTemp} <- L1,
			      SetTemp >= SetT andalso
				SetTemp div 100 == SetBid],
		   NumT = length(Temp),
		   case NumT > CalcNum of
		     true ->
			 AddSkills =
			     partner_holy_eqm_data:get_eqm_set_skill({SetT,
								      NumT}),
			 DelSkills =
			     partner_holy_eqm_data:get_eqm_set_skill({SetT,
								      CalcNum}),
			 Fun2 = fun (SkillId, SkillAccT)
					when is_integer(SkillId) ->
					SkillAccT;
				    ({AttrName, DelVal}, SkillAccT) ->
					AddAttrListT = [{AttrNameT, AddVal}
							|| {AttrNameT, AddVal}
							       <- AddSkills,
							   AttrNameT ==
							     AttrName],
					AddVal2 = lists:sum([AddVal
							     || {AttrNameT,
								 AddVal}
								    <- AddAttrListT]),
					AddSkillsT = AddSkills -- AddAttrListT,
					[{AttrName, max(0, AddVal2 - DelVal)}
					 | AddSkillsT]
				end,
			 SkillsT = lists:foldl(Fun2, AddSkills, DelSkills),
			 {SkillsT ++ AccSkills, NumT};
		     _ -> {AccSkills, CalcNum}
		   end
	   end,
    {AllSkill, _} = lists:foldl(Fun1, {[], 0},
				lists:reverse(lists:keysort(#item.set_id, L1))),
    L2 = HolyEqm -- L1,
    Fun = fun (SkillId, {AttrAcc, SkillAcc})
		  when is_integer(SkillId) ->
		  {AttrAcc, [SkillId | SkillAcc]};
	      (Attr = {_, _}, {AttrAcc, SkillAcc}) ->
		  {item_lib:merge([Attr], AttrAcc), SkillAcc}
	  end,
    {NewAttrL, NewSkillL} = lists:foldl(Fun,
					{AttrL, SkillL}, AllSkill),
    get_set_skill(L2, NewAttrL, NewSkillL).

-spec info(#role{}, list()) -> {ok, #role{}} |
			       {false, binary()}.

info(Role, PartnerIds) -> info(Role, PartnerIds, []).

info(_Role, [], L) -> L;
info(Role, [PartnerId | PartnerIds], L) ->
    case partner_lib:get_partner(Role, PartnerId) of
      #partner{holy_eqm = HolyEqm} ->
	  info(Role, PartnerIds,
	       [{PartnerId, [to_push_item(E) || E <- HolyEqm]} | L]);
      _ -> info(Role, PartnerIds, [{PartnerId, []} | L])
    end.

-spec login(#role{}) -> {ok, #role{}}.

login(Role) ->
    NewRole = holy_eqm_lottery:fire_open(Role, login),
    {ok, NewRole}.

-spec fire(#role{}, atom()) -> {ok, #role{}} |
			       {false, binary()}.

fire(_, Role, lev) -> fire(Role, lev).

fire(Role = #role{lev = Lev}, lev) ->
    WorldLev = world_lev:get_world_lev(),
    LimitWorldLev = drama_data:get_const(heaven_world_lev),
    MaxLimitLev = drama_data:get_const(heaven_player_lev1),
    MinLimitLev = drama_data:get_const(heaven_player_lev2),
    case var:get_var(Role, other, 3102, 0) of
      0
	  when Lev == MaxLimitLev andalso WorldLev < LimitWorldLev
		 orelse
		 Lev == MinLimitLev andalso WorldLev >= LimitWorldLev ->
	  NRole = var:set_var(Role, other, 3102, 1),
	  FireRole = role_trigger:fire([#holy_eqm_frist_open{}],
				       NRole),
	  {ok, FireRole};
      _ -> {ok, Role}
    end;
fire(Role = #role{lev = Lev}, _) ->
    case sys_env:get(holy_eqm_check, false) of
      true ->
	  MaxLimitLev = drama_data:get_const(heaven_player_lev1),
	  MinLimitLev = drama_data:get_const(heaven_player_lev2),
	  case var:get_var(Role, other, 3102, 0) of
	    0 when Lev >= MinLimitLev andalso Lev < MaxLimitLev ->
		NRole = var:set_var(Role, other, 3102, 1),
		FireRole = role_trigger:fire([#holy_eqm_frist_open{}],
					     NRole),
		{ok, FireRole};
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end.

-spec push_partner_holy_eqm(#partner{}) -> ok.

push_partner_holy_eqm(#partner{id = Id, power = Power,
			       all_attr = Attr, holy_eqm = HolyEqm}) ->
    PushEqm = [to_push_item(E) || E <- HolyEqm],
    sys_conn:pack_send(11091, {Id, Power, Attr, PushEqm}),
    ok.

to_push_item(I = #item{main_attr = MainAttr,
		       holy_eqm_attr = HolyEqmAttr}) ->
    PushMainAttr = [{attr_data:attr_atom2id(K), V}
		    || {K, V} <- MainAttr],
    PushAttr = [{Pos, attr_data:attr_atom2id(K),
		 util:uceil(V)}
		|| {Pos, K, V} <- HolyEqmAttr],
    I#item{main_attr = PushMainAttr,
	   holy_eqm_attr = PushAttr}.

-spec dress_holy_eqm(#role{}, pos_integer(),
		     pos_integer()) -> {ok, #role{}} | {false, bitstring()}.

dress_holy_eqm(Role = #role{partner_bag =
				PB = #partner_bag{partner_list = PList}},
	       PartnerId, ItemId) ->
    case can_dress(Role, PartnerId, ItemId) of
      {false, Msg} -> {false, Msg};
      {ok, P = #partner{holy_eqm = HolyEqm, name = Name},
       Item = #item{base_id = BaseId, type = Type}} ->
	  OldItemL = case lists:keyfind(Type, #item.type, HolyEqm)
			 of
		       false -> [];
		       OldItem -> [OldItem]
		     end,
	  Loss = format:val_to_loss([{ItemId, 1}],
				    holy_eqm_dress_id),
	  Gain = format:val_to_gain(OldItemL, change),
	  case role_gain:do(Role, Loss ++ Gain) of
	    {ok, NRole} ->
		log:log_gain(Loss ++ Gain, Role, NRole, <<"神装穿戴"/utf8>>,
			     util:fbin("神装穿戴, 伙伴id:~w, 道具Id:~w, 物品Id:~w",
				       [PartnerId, ItemId, BaseId])),
		NewHolyEqm = lists:keystore(Type, #item.type, HolyEqm,
					    Item),
		NewPT = P#partner{holy_eqm = NewHolyEqm},
		NewP = partner_lib:calc_attr(NRole, NewPT),
		NewPB = PB#partner_bag{partner_list =
					   lists:keystore(PartnerId,
							  #partner.id, PList,
							  NewP)},
		NewRole0 = NRole#role{partner_bag = NewPB},
		NewRole = partner_lib:ref_formation_attr(NewRole0,
							 PartnerId),
		push_partner_holy_eqm(NewP),
		FireRole = do_dress_fire(NewRole, NewHolyEqm,
					 #{hero_name => Name}),
		NewRole2 = holy_eqm_lottery:fire_open(FireRole, fire),
		NewRole3 = cystal_resonate:fire(NewRole2),
		{ok, NewRole3};
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {false, #gain{msg = Msg}} -> {false, Msg}
	  end
    end.

do_dress_fire(Role, HolyEqm, _Cache)
    when length(HolyEqm) < 4 ->
    Role;
do_dress_fire(Role,
	      HolyEqm = [#item{base_id = Bid, set_id = SetId} | _],
	      Cache) ->
    {Star, Jie} = item_data:get_star_jie(Bid),
    NameT = partner_holy_eqm_data:get_holy_set_name(SetId),
    Name = string_util:sub(NameT, 6),
    case [I
	  || I = #item{base_id = BidT, set_id = SetIdT}
		 <- HolyEqm,
	     SetId == SetIdT andalso
	       item_data:get_star_jie(BidT) == {Star, Jie}]
	of
      L when length(L) == 4 ->
	  NCache = Cache#{holy_eqpt_star => Star,
			  holy_eqpt_name => Name, holy_eqpt_jie => Jie},
	  role_trigger:fire([#r_evt_partner_holy_eqpt{cache =
							  NCache}],
			    Role);
      _ -> Role
    end.

can_dress(Role = #role{lev = RLev}, PartnerId,
	  ItemId) ->
    case partner_lib:get_partner(Role, PartnerId) of
      false -> {false, lang:get(<<"找不到该英雄"/utf8>>)};
      P = #partner{star = Star} ->
	  case package:fetch(3, ItemId, Role) of
	    false -> {false, lang:get(<<"找不到该装备"/utf8>>)};
	    {ok, Item = #item{}} ->
		case is_holy_eqm(Item) of
		  true ->
		      case Star >=
			     partner_holy_eqm_data:get_const(open_star_condition)
			  of
			true ->
			    WorldLev = world_lev:get_world_lev(),
			    case RLev >=
				   partner_holy_eqm_data:get_const(open_lev_condition)
				   andalso
				   WorldLev >=
				     partner_holy_eqm_data:get_const(open_worldlev_condition)
				   orelse
				   RLev >=
				     partner_holy_eqm_data:get_const(open_lev_second_condition)
				of
			      true -> {ok, P, Item};
			      _ -> {false, lang:get(<<"不满足穿戴条件"/utf8>>)}
			    end;
			_ -> {false, lang:get(<<"不满足穿戴条件"/utf8>>)}
		      end;
		  _ -> {false, lang:get(<<"该物品不是神装"/utf8>>)}
		end
	  end
    end.

-spec drop_holy_eqm(#role{}, pos_integer(),
		    pos_integer()) -> {ok, #role{}} | {false, bitstring()}.

drop_holy_eqm(Role = #role{partner_bag =
			       PB = #partner_bag{partner_list = PartnerList}},
	      PartnerId, 0) ->
    case partner_lib:get_partner(Role, PartnerId) of
      false -> {false, lang:get(<<"找不到该英雄"/utf8>>)};
      #partner{holy_eqm = []} ->
	  {false, lang:get(<<"没有可卸下的神装哦"/utf8>>)};
      Partner = #partner{holy_eqm = HolyEqm} ->
	  Gain = format:val_to_gain(HolyEqm, change),
	  case role_gain:do(Role, Gain) of
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, NRole} ->
		log:log_gain(Gain, Role, NRole, <<"神装穿戴"/utf8>>,
			     util:fbin("神装一键卸下, 伙伴id:~w", [PartnerId])),
		NPartner = Partner#partner{holy_eqm = []},
		NewPartner = partner_lib:calc_attr(NRole, NPartner),
		NewPB = PB#partner_bag{partner_list =
					   lists:keystore(PartnerId,
							  #partner.id,
							  PartnerList,
							  NewPartner)},
		NRole0 = NRole#role{partner_bag = NewPB},
		NewRole = partner_lib:ref_formation_attr(NRole0,
							 PartnerId),
		NewRole3 = cystal_resonate:fire(NewRole),
		push_partner_holy_eqm(NewPartner),
		{ok, NewRole3}
	  end
    end;
drop_holy_eqm(Role = #role{partner_bag =
			       PB = #partner_bag{partner_list = PartnerList}},
	      PartnerId, ItemId) ->
    case partner_lib:get_partner(Role, PartnerId) of
      false -> {false, lang:get(<<"找不到该英雄"/utf8>>)};
      #partner{holy_eqm = []} ->
	  {false, lang:get(<<"没有可卸下的神装哦"/utf8>>)};
      Partner = #partner{holy_eqm = HolyEqm} ->
	  case lists:keyfind(ItemId, #item.id, HolyEqm) of
	    Item = #item{} ->
		Gain = format:val_to_gain([Item], change),
		case role_gain:do(Role, Gain) of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, NRole} ->
		      log:log_gain(Gain, Role, NRole, <<"神装穿戴"/utf8>>,
				   util:fbin("神装卸下, 伙伴id:~w, 部位:~w",
					     [PartnerId, ItemId])),
		      NPartner = Partner#partner{holy_eqm =
						     lists:keydelete(ItemId,
								     #item.id,
								     HolyEqm)},
		      NewPartner = partner_lib:calc_attr(NRole, NPartner),
		      NewPB = PB#partner_bag{partner_list =
						 lists:keystore(PartnerId,
								#partner.id,
								PartnerList,
								NewPartner)},
		      NRole0 = NRole#role{partner_bag = NewPB},
		      NewRole = partner_lib:ref_formation_attr(NRole0,
							       PartnerId),
		      push_partner_holy_eqm(NewPartner),
		      NewRole3 = cystal_resonate:fire(NewRole),
		      {ok, NewRole3}
		end;
	    _ -> {false, lang:get(<<"找不到该神装"/utf8>>)}
	  end
    end.

-spec holy_eqm_ref(#role{}, pos_integer(),
		   pos_integer(), list()) -> {ok, #role{}} |
					     {false, bitstring()}.

holy_eqm_ref(Role, 0, ItemId, LockPosL) ->
    case get_holy_eqm(Role, 0, ItemId, LockPosL) of
      {false, Msg} -> {false, Msg};
      {ok,
       OldItem = #item{base_id = BaseId,
		       holy_eqm_attr = HolyEqmAttr}} ->
	  LossCfg = partner_holy_eqm_data:get_ref_loss(BaseId),
	  LockLen = length(LockPosL),
	  LockLossGold = list_util:keyfind(LockLen,
					   partner_holy_eqm_data:get_const(lock_pay_diamon),
					   0),
	  LossData = LossCfg ++ [{3, LockLossGold}],
	  Loss = format:val_to_loss(LossData, holy_eqm_ref),
	  case LossCfg =:= [] of
	    true -> {false, lang:get(<<"该神装无法洗练"/utf8>>)};
	    _ ->
		case role_gain:do_notice(Role, Loss) of
		  {false, #loss{msg = Msg}} -> {false, Msg};
		  {ok, NRole = #role{p_eqm = Package}} ->
		      case partner_holy_eqm_data:get_rand_attr_group(BaseId)
			  of
			{PosMax, GroupId} when PosMax > 0 andalso GroupId > 0 ->
			    case check_can_ref(LockPosL, PosMax, GroupId,
					       HolyEqmAttr)
				of
			      true ->
				  RandList =
				      partner_holy_eqm_data:attr_rand_list(GroupId),
				  RepeatAttrL = [AttrIdT
						 || {PosT, AttrIdT, _}
							<- HolyEqmAttr,
						    lists:member(PosT,
								 LockPosL)],
				  case do_ref_attr(PosMax, RandList, LockPosL,
						   RepeatAttrL, OldItem)
				      of
				    {false, Msg} -> {false, Msg};
				    {ok,
				     NewItemT = #item{data = ExtraData,
						      extra = ExtraCli,
						      holy_eqm_attr =
							  NewHolyEqmAttr}} ->
					OldLossAcc = list_util:keyfind(105,
								       ExtraData,
								       []),
					NewLossAcc = item_lib:merge(LossData,
								    OldLossAcc),
					NewExtraData = lists:keystore(105, 1,
								      ExtraData,
								      {105,
								       NewLossAcc}),
					RefTime = list_util:keyfind(10,
								    ExtraCli,
								    0),
					NewExtraCli = lists:keystore(10, 1,
								     ExtraCli,
								     {10,
								      RefTime +
									1}),
					NewItem = NewItemT#item{data =
								    NewExtraData,
								extra =
								    NewExtraCli},
					{ok, NewPackage, _} =
					    package:fresh_item(OldItem, NewItem,
							       Package, NRole),
					log:log_gain(Loss, Role, NRole,
						     <<"神装洗练"/utf8>>,
						     util:fbin("神装Id:~w, 基础ID:~w 锁住属性:~w 新属性:~w",
							       [ItemId, BaseId,
								LockPosL,
								NewHolyEqmAttr])),
					NewRole = NRole#role{p_eqm =
								 NewPackage},
					NewRole1 =
					    cystal_resonate:fire(NewRole),
					NewRole2 =
					    role_trigger:fire([#evt_holy_eqm_ref{}],
							      NewRole1),
					{ok, NewRole2}
				  end;
			      _ -> {false, lang:get(<<"锁定的属性都达到了最大值"/utf8>>)}
			    end;
			_ -> {false, lang:get(<<"该神装无法洗练"/utf8>>)}
		      end
		end
	  end
    end;
holy_eqm_ref(Role, PartnerId, ItemId, LockPosL) ->
    case get_holy_eqm(Role, PartnerId, ItemId, LockPosL) of
      {false, Msg} -> {false, Msg};
      {ok, Partner = #partner{holy_eqm = HolyEqm},
       OldItem = #item{base_id = BaseId,
		       holy_eqm_attr = HolyEqmAttr}} ->
	  LossCfg = partner_holy_eqm_data:get_ref_loss(BaseId),
	  LockLen = length(LockPosL),
	  LockLossGold = list_util:keyfind(LockLen,
					   partner_holy_eqm_data:get_const(lock_pay_diamon),
					   0),
	  LossData = LossCfg ++ [{3, LockLossGold}],
	  Loss = format:val_to_loss(LossData, holy_eqm_ref),
	  case LossCfg =:= [] of
	    true -> {false, lang:get(<<"该神装无法洗练"/utf8>>)};
	    _ ->
		case role_gain:do_notice(Role, Loss) of
		  {false, #loss{msg = Msg}} -> {false, Msg};
		  {ok,
		   NRole = #role{partner_bag =
				     PB = #partner_bag{partner_list = PL}}} ->
		      case partner_holy_eqm_data:get_rand_attr_group(BaseId)
			  of
			{PosMax, GroupId} when PosMax > 0 andalso GroupId > 0 ->
			    case check_can_ref(LockPosL, PosMax, GroupId,
					       HolyEqmAttr)
				of
			      true ->
				  RandList =
				      partner_holy_eqm_data:attr_rand_list(GroupId),
				  RepeatAttrL = [AttrIdT
						 || {PosT, AttrIdT, _}
							<- HolyEqmAttr,
						    lists:member(PosT,
								 LockPosL)],
				  case do_ref_attr(PosMax, RandList, LockPosL,
						   RepeatAttrL, OldItem)
				      of
				    {false, Msg} -> {false, Msg};
				    {ok,
				     NewItemT = #item{data = ExtraData,
						      extra = ExtraCli,
						      holy_eqm_attr =
							  NewHolyEqmAttr}} ->
					OldLossAcc = list_util:keyfind(105,
								       ExtraData,
								       []),
					NewLossAcc = item_lib:merge(LossData,
								    OldLossAcc),
					NewExtraData = lists:keystore(105, 1,
								      ExtraData,
								      {105,
								       NewLossAcc}),
					RefTime = list_util:keyfind(10,
								    ExtraCli,
								    0),
					NewExtraCli = lists:keystore(10, 1,
								     ExtraCli,
								     {10,
								      RefTime +
									1}),
					NewItem = NewItemT#item{data =
								    NewExtraData,
								extra =
								    NewExtraCli},
					NewHolyEqm = lists:keystore(ItemId,
								    #item.id,
								    HolyEqm,
								    NewItem),
					NewPartner = Partner#partner{holy_eqm =
									 NewHolyEqm},
					NewPL = lists:keystore(PartnerId,
							       #partner.id, PL,
							       NewPartner),
					NewPB = PB#partner_bag{partner_list =
								   NewPL},
					log:log_gain(Loss, Role, NRole,
						     <<"神装洗练"/utf8>>,
						     util:fbin("神装Id:~w, 伙伴ID:~w 基础ID:~w 锁住属性:~w 新属性:~w",
							       [ItemId,
								PartnerId,
								BaseId,
								LockPosL,
								NewHolyEqmAttr])),
					NewRole = NRole#role{partner_bag =
								 NewPB},
					push_partner_holy_eqm(NewPartner),
					NewRole2 =
					    holy_eqm_lottery:fire_open(NewRole,
								       fire),
					NewRole3 =
					    cystal_resonate:fire(NewRole2),
					NewRole4 =
					    role_trigger:fire([#evt_holy_eqm_ref{}],
							      NewRole3),
					{ok, NewRole4}
				  end;
			      _ -> {false, lang:get(<<"锁定的属性都达到了最大值"/utf8>>)}
			    end;
			_ -> {false, lang:get(<<"该神装无法洗练"/utf8>>)}
		      end
		end
	  end
    end.

do_ref_attr(0, _RandList, _LockPosL, _RepeatAttrL,
	    Item) ->
    {ok, Item};
do_ref_attr(Pos, RandList, LockPosL, RepeatAttrL,
	    Item = #item{base_id = BaseId, data = ExtraData,
			 holy_eqm_attr = HolyEqmAttr}) ->
    PosL = list_util:keyfind(104, ExtraData, []),
    RefTime = list_util:keyfind(Pos, PosL, 1),
    NewPos = Pos + 100,
    case lists:keyfind(Pos, 1, HolyEqmAttr) of
      {_, AttrId, OldVal} ->
	  {_, GroupId} =
	      partner_holy_eqm_data:get_rand_attr_group(BaseId),
	  AttrMaxL = partner_holy_eqm_data:get_group_max(GroupId),
	  case lists:keyfind(AttrId, 1, AttrMaxL) of
	    {_, MaxValLimit, _} when OldVal >= MaxValLimit ->
		case lists:member(Pos, LockPosL) of
		  true ->
		      NewHolyEqmAttr = lists:keystore(NewPos, 1, HolyEqmAttr,
						      {NewPos, AttrId, OldVal}),
		      NewPosL = lists:keystore(Pos, 1, PosL,
					       {Pos, RefTime + 1}),
		      NewExtraData = lists:keystore(104, 1, ExtraData,
						    {104, NewPosL}),
		      do_ref_attr(Pos - 1, RandList, LockPosL, RepeatAttrL,
				  Item#item{holy_eqm_attr = NewHolyEqmAttr,
					    data = NewExtraData});
		  _ ->
		      RandListT = [D
				   || D = #holy_eqm_attr_data{time_min =
								  TimeMin,
							      time_max =
								  TimeMax}
					  <- RandList,
				      RefTime >= TimeMin, RefTime =< TimeMax],
		      if RandListT == [] ->
			     {false, lang:get(<<"已经达到最大洗练次数"/utf8>>)};
			 true ->
			     Fun = fun (#holy_eqm_attr_data{attr = AttrIdT}) ->
					   case lists:keyfind(AttrIdT, 1,
							      AttrMaxL)
					       of
					     {_, _, 1} -> true;
					     _ ->
						 not
						   lists:member(AttrIdT,
								RepeatAttrL)
					   end
				   end,
			     RandList1 = lists:filter(Fun, RandListT),
			     RandData = util:rand_list(RandList1,
						       #holy_eqm_attr_data.reset_pro),
			     NewAttrId = RandData#holy_eqm_attr_data.attr,
			     case lists:keyfind(NewAttrId, 1, AttrMaxL) of
			       {_, NewVal, _} ->
				   NewHolyEqmAttr = lists:keystore(NewPos, 1,
								   HolyEqmAttr,
								   {NewPos,
								    NewAttrId,
								    NewVal}),
				   NewPosL = lists:keystore(Pos, 1, PosL,
							    {Pos, RefTime + 1}),
				   NewExtraData = lists:keystore(104, 1,
								 ExtraData,
								 {104,
								  NewPosL}),
				   do_ref_attr(Pos - 1, RandList, LockPosL,
					       [NewAttrId | RepeatAttrL],
					       Item#item{holy_eqm_attr =
							     NewHolyEqmAttr,
							 data = NewExtraData});
			       _ ->
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
				     {__Pidpartner_holy_eqm474, _,
				      {__Levelpartner_holy_eqm474,
				       __Tracespartner_holy_eqm474}}
					 when __Levelpartner_holy_eqm474 band 8
						/= 0
						orelse
						__Tracespartner_holy_eqm474 /=
						  [] ->
					 lager:do_log(error,
						      [{module,
							partner_holy_eqm},
						       {function, do_ref_attr},
						       {line, 474},
						       {pid,
							pid_to_list(self())},
						       {node, node()}
						       | lager:md()],
						      io_lib:format("~w神装的~w属性没有最大值限制",
								    [BaseId,
								     AttrId]),
						      none, 4096, 8,
						      __Levelpartner_holy_eqm474,
						      __Tracespartner_holy_eqm474,
						      lager_event,
						      __Pidpartner_holy_eqm474);
				     _ -> ok
				   end,
				   {false, lang:get(<<"暂时无法重置，请与客服联系"/utf8>>)}
			     end
		      end
		end;
	    {_, _, _} ->
		RandList1 = case lists:member(Pos, LockPosL) of
			      true ->
				  [D
				   || D = #holy_eqm_attr_data{attr = AttrIdT,
							      time_min =
								  TimeMin,
							      time_max =
								  TimeMax}
					  <- RandList,
				      AttrIdT =:= AttrId, RefTime >= TimeMin,
				      RefTime =< TimeMax];
			      _ ->
				  RandListT = [D
					       || D =
						      #holy_eqm_attr_data{time_min
									      =
									      TimeMin,
									  time_max
									      =
									      TimeMax}
						      <- RandList,
						  RefTime >= TimeMin,
						  RefTime =< TimeMax],
				  Fun = fun (#holy_eqm_attr_data{attr =
								     AttrIdT}) ->
						case lists:keyfind(AttrIdT, 1,
								   AttrMaxL)
						    of
						  {_, _, 1} -> true;
						  _ ->
						      not
							lists:member(AttrIdT,
								     RepeatAttrL)
						end
					end,
				  lists:filter(Fun, RandListT)
			    end,
		if RandList1 == [] ->
		       {false, lang:get(<<"已经达到最大洗练次数"/utf8>>)};
		   true ->
		       RandData = util:rand_list(RandList1,
						 #holy_eqm_attr_data.reset_pro),
		       NewAttrId = RandData#holy_eqm_attr_data.attr,
		       {MinVal, MaxVal} =
			   RandData#holy_eqm_attr_data.val_range,
		       NewValT = util:rand(MinVal, MaxVal),
		       case lists:keyfind(NewAttrId, 1, AttrMaxL) of
			 {_, MaxValLimit, _} ->
			     NewVal = util:if_true(NewValT > MaxValLimit,
						   MaxValLimit, NewValT),
			     NewHolyEqmAttr = lists:keystore(NewPos, 1,
							     HolyEqmAttr,
							     {NewPos, NewAttrId,
							      NewVal}),
			     NewPosL = lists:keystore(Pos, 1, PosL,
						      {Pos, RefTime + 1}),
			     NewExtraData = lists:keystore(104, 1, ExtraData,
							   {104, NewPosL}),
			     do_ref_attr(Pos - 1, RandList, LockPosL,
					 [NewAttrId | RepeatAttrL],
					 Item#item{holy_eqm_attr =
						       NewHolyEqmAttr,
						   data = NewExtraData});
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
			       {__Pidpartner_holy_eqm508, _,
				{__Levelpartner_holy_eqm508,
				 __Tracespartner_holy_eqm508}}
				   when __Levelpartner_holy_eqm508 band 8 /= 0
					  orelse
					  __Tracespartner_holy_eqm508 /= [] ->
				   lager:do_log(error,
						[{module, partner_holy_eqm},
						 {function, do_ref_attr},
						 {line, 508},
						 {pid, pid_to_list(self())},
						 {node, node()}
						 | lager:md()],
						io_lib:format("~w神装的~w属性没有最大值限制",
							      [BaseId,
							       NewAttrId]),
						none, 4096, 8,
						__Levelpartner_holy_eqm508,
						__Tracespartner_holy_eqm508,
						lager_event,
						__Pidpartner_holy_eqm508);
			       _ -> ok
			     end,
			     {false, lang:get(<<"暂时无法重置，请与客服联系"/utf8>>)}
		       end
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
		  {__Pidpartner_holy_eqm513, _,
		   {__Levelpartner_holy_eqm513,
		    __Tracespartner_holy_eqm513}}
		      when __Levelpartner_holy_eqm513 band 8 /= 0 orelse
			     __Tracespartner_holy_eqm513 /= [] ->
		      lager:do_log(error,
				   [{module, partner_holy_eqm},
				    {function, do_ref_attr}, {line, 513},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~w神装的~w属性没有最大值限制",
						 [BaseId, AttrId]),
				   none, 4096, 8, __Levelpartner_holy_eqm513,
				   __Tracespartner_holy_eqm513, lager_event,
				   __Pidpartner_holy_eqm513);
		  _ -> ok
		end,
		{false, lang:get(<<"暂时无法重置，请与客服联系"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"神装出问题了"/utf8>>)}
    end.

check_can_ref([], _PosMax, _GroupId, _HolyEqmAttr) ->
    true;
check_can_ref(LockPosL, PosMax, GroupId, HolyEqmAttr) ->
    AttrMaxL = partner_holy_eqm_data:get_group_max(GroupId),
    Fun = fun (Pos) ->
		  case lists:keyfind(Pos, 1, HolyEqmAttr) of
		    {_, AttrId, OldVal} ->
			case lists:keyfind(AttrId, 1, AttrMaxL) of
			  {_, MaxValLimit, _} when OldVal >= MaxValLimit ->
			      true;
			  _ -> false
			end;
		    _ -> false
		  end
	  end,
    Flag = lists:all(Fun, LockPosL),
    not (Flag andalso PosMax =:= length(LockPosL)).

-spec holy_eqm_ref_save(#role{}, pos_integer(),
			pos_integer()) -> {false, bitstring()} | {ok, #role{}}.

holy_eqm_ref_save(Role = #role{p_eqm = Package}, 0,
		  ItemId) ->
    case package:fetch(3, ItemId, Role) of
      {ok, OldItem = #item{holy_eqm_attr = HolyEqmAttr}} ->
	  NewHolyEqmAttr = [{Pos - 100, AttrId, Val}
			    || {Pos, AttrId, Val} <- HolyEqmAttr, Pos > 100],
	  case NewHolyEqmAttr =:= [] of
	    true -> {false, lang:get(<<"没有可保存的属性"/utf8>>)};
	    _ ->
		NewItem = OldItem#item{holy_eqm_attr = NewHolyEqmAttr},
		{ok, NewPackage, _} = package:fresh_item(OldItem,
							 NewItem, Package,
							 Role),
		{ok, Role#role{p_eqm = NewPackage}}
	  end;
      _ -> {false, lang:get(<<"找不到该神装"/utf8>>)}
    end;
holy_eqm_ref_save(Role = #role{partner_bag =
				   PB = #partner_bag{partner_list = PL}},
		  PartnerId, ItemId) ->
    case partner_lib:get_partner(Role, PartnerId) of
      Partner = #partner{holy_eqm = HolyEqm} ->
	  case lists:keyfind(ItemId, #item.id, HolyEqm) of
	    OldItem = #item{holy_eqm_attr = HolyEqmAttr} ->
		NewHolyEqmAttr = [{Pos - 100, AttrId, Val}
				  || {Pos, AttrId, Val} <- HolyEqmAttr,
				     Pos > 100],
		case NewHolyEqmAttr =:= [] of
		  true -> {false, lang:get(<<"没有可保存的属性"/utf8>>)};
		  _ ->
		      NewItem = OldItem#item{holy_eqm_attr = NewHolyEqmAttr},
		      NewPartnerT = Partner#partner{holy_eqm =
							lists:keystore(ItemId,
								       #item.id,
								       HolyEqm,
								       NewItem)},
		      NewPartner = partner_lib:calc_attr(Role, NewPartnerT),
		      NewPL = lists:keystore(PartnerId, #partner.id, PL,
					     NewPartner),
		      NewPB = PB#partner_bag{partner_list = NewPL},
		      NRole = Role#role{partner_bag = NewPB},
		      NewRole = partner_lib:ref_formation_attr(NRole,
							       PartnerId),
		      push_partner_holy_eqm(NewPartner),
		      NewRole2 = holy_eqm_lottery:fire_open(NewRole, fire),
		      {ok, NewRole2}
		end;
	    _ -> {false, lang:get(<<"找不到该神装"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"未知的英雄"/utf8>>)}
    end.

-spec holy_eqm_sell(#role{}, pos_integer()) -> {ok,
						#role{}} |
					       {false, binary()}.

holy_eqm_sell(Role, Id) when is_list(Id) ->
    case holy_eqm_sell_info(Role, Id) of
      {false, Msg} -> {false, Msg};
      {ok, []} -> {false, lang:get(<<"该物品无法出售"/utf8>>)};
      {ok, Value} ->
	  Loss = [#loss{label = eqm_item_id,
			val = [{IdT, 1} || IdT <- Id]}],
	  Gain = format:val_to_gain(Value, holy_eqm_sell),
	  case role_gain:do_notice(Role, Loss ++ Gain) of
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, NRole} ->
		log:log_gain(Loss ++ Gain, Role, NRole, <<"神装出售"/utf8>>,
			     util:fbin(lang:get(<<"神装出售:id:~w"/utf8>>), [Id])),
		{ok, NRole}
	  end
    end;
holy_eqm_sell(Role, Id) ->
    case holy_eqm_sell_info(Role, Id) of
      {false, Msg} -> {false, Msg};
      {ok, []} -> {false, lang:get(<<"该物品无法出售"/utf8>>)};
      {ok, Value} ->
	  Loss = [#loss{label = eqm_item_id, val = [{Id, 1}]}],
	  Gain = format:val_to_gain(Value, holy_eqm_sell),
	  case role_gain:do_notice(Role, Loss ++ Gain) of
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, NRole} ->
		log:log_gain(Loss ++ Gain, Role, NRole, <<"神装出售"/utf8>>,
			     util:fbin(lang:get(<<"神装出售:id:~w"/utf8>>), [Id])),
		{ok, NRole}
	  end
    end.

-spec holy_eqm_sell_info(#role{},
			 pos_integer()) -> {false, bitstring()} | {ok, list()}.

holy_eqm_sell_info(Role, Id) when is_list(Id) ->
    Fun = fun (IdT, {Acc1, Acc2}) ->
		  case holy_eqm_sell_info(Role, IdT) of
		    {ok, AllValue} ->
			{item_lib:merge(Acc1, AllValue), Acc2};
		    _ -> {Acc1, lang:get(<<"存在无法出售的物品"/utf8>>)}
		  end
	  end,
    case lists:foldl(Fun, {[], <<>>}, Id) of
      {L, <<>>} -> {ok, L};
      {_, Msg} -> {false, Msg}
    end;
holy_eqm_sell_info(Role, Id) ->
    case package:fetch(3, Id, Role) of
      {ok, I = #item{base_id = BaseId, data = ExtraData}} ->
	  case item_data:get(BaseId) of
	    #item_base{value = ValueT} ->
		case is_holy_eqm(I) of
		  true ->
		      LossAcc = list_util:keyfind(105, ExtraData, []),
		      ReturnRate =
			  partner_holy_eqm_data:get_const(clear_return),
		      Fun = fun ({BidT, NumT}, Acc) ->
				    case lists:keyfind(BidT, 1, ReturnRate) of
				      {_, Rate} ->
					  NewNumT = util:uround(NumT * Rate /
								  1000),
					  [{BidT, NewNumT} | Acc];
				      _ -> Acc
				    end
			    end,
		      ReturnLoss = lists:foldl(Fun, [], LossAcc),
		      AllValue = item_lib:merge(ValueT, ReturnLoss),
		      {ok, AllValue};
		  _ -> {false, lang:get(<<"该物品不能出售"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"物品已不存在"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"物品不存在"/utf8>>)}
    end.

get_holy_eqm(Role, 0, Id, LockPosL) ->
    case package:fetch(3, Id, Role) of
      {ok, OldItem = #item{holy_eqm_attr = HolyEqmAttr}} ->
	  Fun = fun (Pos) ->
			lists:keymember(Pos, 1, HolyEqmAttr) andalso Pos < 100
		end,
	  case lists:all(Fun, LockPosL) of
	    true -> {ok, OldItem};
	    _ -> {false, lang:get(<<"锁住了不存在的属性"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"找不到该神装"/utf8>>)}
    end;
get_holy_eqm(Role, PartnerId, Id, LockPosL) ->
    case partner_lib:get_partner(Role, PartnerId) of
      P = #partner{holy_eqm = HolyEqm} ->
	  case lists:keyfind(Id, #item.id, HolyEqm) of
	    I = #item{holy_eqm_attr = HolyEqmAttr} ->
		Fun = fun (Pos) ->
			      lists:keymember(Pos, 1, HolyEqmAttr) andalso
				Pos < 100
		      end,
		case lists:all(Fun, LockPosL) of
		  true -> {ok, P, I};
		  _ -> {false, lang:get(<<"锁住了不存在的属性"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"找不到该神装"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"未知的英雄"/utf8>>)}
    end.

-spec is_holy_eqm(#item{}) -> false | true.

is_holy_eqm(#item{type = Type}) ->
    lists:member(Type, [23, 24, 25, 26]).

-spec show_holy_eqm_attr(#role{},
			 pos_integer()) -> tuple() | false.

show_holy_eqm_attr(Role, PartnerId) ->
    case partner_lib:get_partner(Role, PartnerId) of
      P = #partner{} ->
	  {AllAttr, Power} =
	      partner_lib:show_holy_eqm_gen_attr(Role, P),
	  {AllAttr, Power};
      _ -> false
    end.


