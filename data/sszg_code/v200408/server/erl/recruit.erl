-file("src/mod/recruit/recruit.erl", 1).

-module(recruit).

-lager_records([{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
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

-export([init/0, login/1, five_flush/1, info/1, draw/4,
	 broadcast/2, shared_reward/1, fire/1,
	 push_recruit_guide/1, gm_test_refresh/5,
	 gm_set_time/4]).

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

-file("src/mod/recruit/recruit.erl", 28).

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

-file("src/mod/recruit/recruit.erl", 29).

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

-file("src/mod/recruit/recruit.erl", 30).

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

-file("src/mod/recruit/recruit.erl", 31).

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

-file("src/mod/recruit/recruit.erl", 32).

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

-file("src/mod/recruit/recruit.erl", 33).

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

-file("src/mod/recruit/recruit.erl", 34).

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

-file("src/mod/recruit/recruit.erl", 35).

-file("inc/log.hrl", 1).

-file("src/mod/recruit/recruit.erl", 36).

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

-file("src/mod/recruit/recruit.erl", 37).

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

-file("src/mod/recruit/recruit.erl", 38).

-export([gm_reset_group/2, gm_reset_time/1]).

-spec gm_reset_group(#role{}, integer()) -> {ok,
					     #role{}} |
					    {false, binary()}.

gm_reset_group(Role = #role{m_recruit =
				MRecruit = #m_recruit{list = List},
			    id = RoleId},
	       GroupId) ->
    case recruit_data:get_group(GroupId) of
      Cfg when is_map(Cfg) ->
	  NewList = lists:keydelete(GroupId,
				    #recruit_info.group_id, List),
	  recruit_mgr:delete({RoleId, GroupId}),
	  {ok,
	   Role#role{m_recruit =
			 MRecruit#m_recruit{list = NewList}}};
      _ -> {false, "未知的卡池"}
    end.

gm_reset_time(Role = #role{m_recruit =
			       MRecruit = #m_recruit{list = List}}) ->
    NewTime = date:unixtime() + 60 * 1,
    Fun = fun (Info = #recruit_info{group_id = GroupId,
				    stats = Stats},
	       Acc) ->
		  lists:keystore(GroupId, #recruit_info.group_id, Acc,
				 Info#recruit_info{stats =
						       Stats#{discount_endtine
								  => NewTime}})
	  end,
    NewList = lists:foldl(Fun, List, List),
    NewRole = Role#role{m_recruit =
			    MRecruit#m_recruit{list = NewList}},
    {ok, Info} = recruit:info(NewRole),
    role:pack_send(NewRole, 23200, Info),
    {ok, NewRole}.

gm_set_time(Role, GroupId, DrawTimes,
	    LastHitFiveStar) ->
    Stats = stats(GroupId, Role),
    NStats = Stats#{last_hit_five_star => LastHitFiveStar,
		    draw_times => DrawTimes},
    NRole = update_stats(GroupId, NStats, Role),
    {ok, NRole}.

init() -> #m_recruit{}.

-spec login(#role{}) -> #role{}.

login(Role) -> Role.

push_recruit_guide(Role) ->
    L = var:get_var(Role, acc, 3039, []),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrecruit86, _,
       {__Levelrecruit86, __Tracesrecruit86}}
	  when __Levelrecruit86 band 128 /= 0 orelse
		 __Tracesrecruit86 /= [] ->
	  lager:do_log(debug,
		       [{module, recruit}, {function, push_recruit_guide},
			{line, 86}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("=召唤引导=~w", [L]), none, 4096, 128,
		       __Levelrecruit86, __Tracesrecruit86, lager_event,
		       __Pidrecruit86);
      _ -> ok
    end,
    case lists:keyfind(1, 1, L) of
      {_, PushId} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrecruit89, _,
	     {__Levelrecruit89, __Tracesrecruit89}}
		when __Levelrecruit89 band 128 /= 0 orelse
		       __Tracesrecruit89 /= [] ->
		lager:do_log(debug,
			     [{module, recruit}, {function, push_recruit_guide},
			      {line, 89}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("=召唤引导=~w", [PushId]), none, 4096,
			     128, __Levelrecruit89, __Tracesrecruit89,
			     lager_event, __Pidrecruit89);
	    _ -> ok
	  end,
	  role:pack_send(10955, {1, PushId});
      _ -> ok
    end,
    ok.

-spec fire(#role{}) -> #role{}.

fire(Role) -> Role.

-spec five_flush(#role{}) -> {ok, #role{}}.

five_flush(Role) -> set_free(Role).

-spec info(#role{}) -> {ok, Groups :: list(),
			CdEnd :: integer(), FreeTimes :: integer(),
			CoinTimes :: integer(), Share :: 1 | 0,
			DayShare :: 1 | 0}.

info(Role = #role{m_recruit = #m_recruit{}}) ->
    OpenDunList = recruit_data:dun_list(),
    Share = var:get_var(Role, other, 3022, 0),
    DayShare = var:get_var(Role, five, 574, 0),
    FirstFlag = var:get_var(Role, other, 3065, 0),
    {MustFiveStarTime, NewRole} = case FirstFlag =:= 0 of
				    true ->
					Role1 = var:set_var(Role, other, 3065,
							    1),
					HighTime = maps:get(draw_times,
							    stats(300, Role1),
							    0),
					case HighTime > 0 of
					  true ->
					      Role2 = var:set_var(Role1, other,
								  3064, 0),
					      {0, Role2};
					  _ ->
					      {var:get_var(Role1, other, 3064,
							   10),
					       Role1}
					end;
				    _ ->
					{var:get_var(Role, other, 3064, 10),
					 Role}
				  end,
    List = open_list(OpenDunList, NewRole, []),
    {ok, {List, Share, DayShare, MustFiveStarTime},
     NewRole}.

-spec draw(#role{}, integer(), integer(),
	   integer()) -> {ok, #role{}} | {false, binary()}.

draw(Role, GroupId, Times, CostType) ->
    case check_cond(Role, GroupId, Times, CostType) of
      {ok, Data} -> do_draw(Role, Data, Times, CostType);
      {false, Msg} -> {false, Msg}
    end.

do_draw(Role, GroupData = #{group_id := GroupId},
	Times = 1, 1) ->
    FreeTimesL = var:get_var(Role, five, 558, []),
    case lists:member(GroupId, [100, 300]) of
      true ->
	  case lists:keyfind(GroupId, 1, FreeTimesL) of
	    false ->
		draw_by_free(Role, GroupData, Times, FreeTimesL);
	    _ ->
		{false,
		 lang:get(<<"Lượt miễn phí hôm nay đã hết"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Tượng đá này không thể cầu nguyện miễn "
		      "phí"/utf8>>)}
    end;
do_draw(Role, GroupData = #{group_id := GroupId}, Times,
	CostType) ->
    {LossItems, GainItems} = calc_gl(Times, CostType,
				     GroupData),
    Loss = format:val_to_loss(LossItems, del_recruit),
    case Loss of
      [_ | _] ->
	  Gains = format:val_to_gain(GainItems, make_recruit),
	  GL = Loss ++ Gains,
	  case draw_process(Role, GroupData, Times, CostType, GL)
	      of
	    {ok, NewRole} ->
		NewRole1 = case GroupId of
			     100 ->
				 role_trigger:fire([#evt_normal_recruit{count =
									    Times}],
						   NewRole);
			     300 ->
				 {ok, Role1} =
				     holiday_lucky_dog_lib:fire(NewRole,
								evt_high_recruit,
								Times),
				 role_trigger:fire([#evt_high_recruit{count =
									  Times}],
						   Role1);
			     _ -> NewRole
			   end,
		LogMsg = get_log_msg(GroupId, 3, Times),
		log:save(join, {NewRole1, <<"产出类玩法"/utf8>>, LogMsg}),
		NewRole2 = do_fire_award(NewRole1, CostType, Times,
					 GroupId),
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
	    {__Pidrecruit183, _,
	     {__Levelrecruit183, __Tracesrecruit183}}
		when __Levelrecruit183 band 8 /= 0 orelse
		       __Tracesrecruit183 /= [] ->
		lager:do_log(error,
			     [{module, recruit}, {function, do_draw},
			      {line, 183}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]召唤消耗有误Times:~w, CostType:~w, Data:~w",
					   [Role#role.name, Times, CostType,
					    GroupData]),
			     none, 4096, 8, __Levelrecruit183,
			     __Tracesrecruit183, lager_event, __Pidrecruit183);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Lỗi tiêu hao triệu hồi, không thể triệu "
		      "hồi"/utf8>>)}
    end.

do_fire_award(Role, 3, Count, GroupId) ->
    recruit_award:fire(Role, GroupId, Count);
do_fire_award(Role, _, _, _) -> Role.

-spec broadcast(#role{}, Msg :: binary()) -> ok.

broadcast(_Role, Msg) ->
    notice:broadcast(rumor_left_top, Msg), ok.

-spec shared_reward(#role{}) -> {ok, #role{}} |
				{false, binary()}.

shared_reward(Role) ->
    IsDayShare = var:get_var(Role, five, 574, 0),
    case IsDayShare of
      0 ->
	  IsShare = var:get_var(Role, other, 3022, 0),
	  Gains = case IsShare of
		    0 ->
			[#gain{label = gold,
			       val = recruit_data:get_const(share_role)}];
		    1 ->
			[#gain{label = gold,
			       val = recruit_data:get_const(share_day)}]
		  end,
	  case role_gain:do_notice(Role, Gains) of
	    {ok, GainRole} ->
		VarRole = var:set_var(GainRole, five, 574, 1),
		NewRole = var:set_var(VarRole, other, 3022, 1),
		log:log_gain(Gains, Role, NewRole, <<"伙伴召唤"/utf8>>,
			     util:fbin("召唤分享[Share:~w,DayShare:~w]",
				       [IsShare, IsDayShare])),
		{ok, NewRole};
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
		  {__Pidrecruit220, _,
		   {__Levelrecruit220, __Tracesrecruit220}}
		      when __Levelrecruit220 band 8 /= 0 orelse
			     __Tracesrecruit220 /= [] ->
		      lager:do_log(error,
				   [{module, recruit},
				    {function, shared_reward}, {line, 220},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]领取分享奖励失败:~w",
						 [Role#role.name, Err]),
				   none, 4096, 8, __Levelrecruit220,
				   __Tracesrecruit220, lager_event,
				   __Pidrecruit220);
		  _ -> ok
		end,
		{false,
		 lang:get(<<"Nhận thưởng chia sẻ thất bại"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Hôm nay đã nhận thưởng chia sẻ rồi"/utf8>>)}
    end.

calc_gl(1, 3,
	#{exchange_once := Exchange,
	  exchange_once_gain := Gains}) ->
    {Exchange, Gains};
calc_gl(1, 3, #{exchange_once := Exchange}) ->
    {Exchange, []};
calc_gl(10, 3,
	#{exchange_five := Exchange,
	  exchange_five_gain := Gains}) ->
    {Exchange, Gains};
calc_gl(1, 4, #{item_once := LossItems}) ->
    {LossItems, []};
calc_gl(10, 4, #{item_five := LossItems}) ->
    {LossItems, []};
calc_gl(1, 5, #{ext_item_once := LossItems}) ->
    {LossItems, []};
calc_gl(10, 5, #{ext_item_five := LossItems}) ->
    {LossItems, []};
calc_gl(_Times, _CostType, _Data) -> {[], []}.

draw_by_free(Role, Data = #{group_id := GroupId}, Times,
	     FreeTimesL) ->
    case draw_process(Role, Data, Times, 1, []) of
      {ok, DrawRole} ->
	  EndTime = date:unixtime() +
		      date:now_diff(tomorrow, {5, 0, 0}),
	  NewFreeTimesL = lists:keystore(GroupId, 1, FreeTimesL,
					 {GroupId, EndTime, 0}),
	  NewRole = var:set_var(DrawRole, five, 558,
				NewFreeTimesL),
	  LogMsg = get_log_msg(GroupId, 1, Times),
	  log:save(join, {NewRole, <<"产出类玩法"/utf8>>, LogMsg}),
	  push_base_info(GroupId, NewRole),
	  NewRole1 = case GroupId of
		       100 ->
			   role_trigger:fire([#evt_normal_recruit{count =
								      Times}],
					     NewRole);
		       300 ->
			   {ok, Role1} = holiday_lucky_dog_lib:fire(NewRole,
								    evt_high_recruit,
								    1),
			   role_trigger:fire([#evt_high_recruit{count = Times}],
					     Role1);
		       _ -> NewRole
		     end,
	  {ok, NewRole1};
      {false, Msg} -> {false, Msg}
    end.

draw_process(Role, GroupData = #{group_id := GroupId},
	     Times, CostType, GL) ->
    Stats = stats(GroupId, Role),
    DrawTimes = maps:get(draw_times, Stats, 0),
    FiveCount = maps:get(five_count, Stats, 0),
    Args = #{stats => Stats, draw_type => Times,
	     old_draw_times => DrawTimes,
	     old_five_count => FiveCount},
    case role_gain:do(Role, GL,
		      #gain_loss_opts{need_notify_fail_item = true})
	of
      {ok, LossRole, _} ->
	  case draw_process(LossRole, GroupData, Times, Args) of
	    {ok, Rewards, NewArgs} ->
		put(draw_process_partners, []),
		RecruitHeroOnce = maps:get(recruit_hero_gain, GroupData,
					   []),
		RecruitHeroGain = [{ItemBid, ItemNum * Times}
				   || {ItemBid, ItemNum} <- RecruitHeroOnce],
		RewardArgs = split_rewards(Rewards, LossRole, #{}),
		GainValL = maps:get(items, RewardArgs, []),
		Chips = maps:get(partner_chips, RewardArgs, []),
		NoticeL = maps:get(notice, RewardArgs, []),
		Gains = format:val_to_gain(GainValL ++ RecruitHeroGain,
					   make_recruit),
		case role_gain:do(LossRole, Gains) of
		  {ok, NRole} ->
		      NewLimitInfo = maps:get(limit_info, NewArgs),
		      NewStats = maps:get(stats, NewArgs),
		      UpdateRole = update_stats(GroupId, NewStats, NRole),
		      PushPartnerBids = case erase(draw_process_partners) of
					  Temp when is_list(Temp) -> Temp;
					  _ -> []
					end,
		      Flag = have_five_star(PushPartnerBids),
		      MustFiveStarTime = var:get_var(UpdateRole, other, 3064,
						     10),
		      {NewFiveRole, NewMustFiveStarTime} =
			  new_must_time(UpdateRole, MustFiveStarTime, Flag,
					GroupId),
		      role:pack_send(NewFiveRole, 23201,
				     {GroupId, Times, 0, GainValL,
				      PushPartnerBids, Chips,
				      NewMustFiveStarTime}),
		      recruit_mgr:save(NewLimitInfo),
		      TimerRole = set_broadcast_timer(NewFiveRole, NoticeL,
						      GroupId, CostType),
		      NRole1 = cystal_resonate:fire(TimerRole),
		      NewRole0 = role_trigger:fire([#evt_recruit{group =
								     GroupId,
								 count = Times,
								 partner_infos =
								     PushPartnerBids},
						    #r_evt_first_recruit{cache =
									     #{group_id
										   =>
										   GroupId,
									       partner_infos
										   =>
										   PushPartnerBids}}],
						   NRole1),
		      NewRole = days_rank_mgr:in_rank(recruit, NewRole0,
						      Times),
		      case Times =:= 10 of
			true -> push_group(NewRole, GroupData);
			_ -> skip
		      end,
		      LogMsg = get_log_msg(GroupId, CostType, Times),
		      log:log_gain(GL ++ Gains, Role, NewRole, LogMsg,
				   util:fbin("CostType:~w,times:~w, 获得:~w，数据:~w",
					     [CostType, Times, RewardArgs,
					      NewStats])),
		      {ok, NewRole};
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
			{__Pidrecruit324, _,
			 {__Levelrecruit324, __Tracesrecruit324}}
			    when __Levelrecruit324 band 8 /= 0 orelse
				   __Tracesrecruit324 /= [] ->
			    lager:do_log(error,
					 [{module, recruit},
					  {function, draw_process}, {line, 324},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[~ts]背包已满:~w",
						       [LossRole#role.name,
							Err]),
					 none, 4096, 8, __Levelrecruit324,
					 __Tracesrecruit324, lager_event,
					 __Pidrecruit324);
			_ -> ok
		      end,
		      {false, lang:get(<<"Túi đầy"/utf8>>)}
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
	    {__Pidrecruit335, _,
	     {__Levelrecruit335, __Tracesrecruit335}}
		when __Levelrecruit335 band 8 /= 0 orelse
		       __Tracesrecruit335 /= [] ->
		lager:do_log(error,
			     [{module, recruit}, {function, draw_process},
			      {line, 335}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]召唤消耗不足，无法进行召唤:~w",
					   [Role#role.name, Err]),
			     none, 4096, 8, __Levelrecruit335,
			     __Tracesrecruit335, lager_event, __Pidrecruit335);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Vật phẩm triệu hồi không đủ, không thể "
		      "triệu hồi!"/utf8>>)}
    end.

new_must_time(UpdateRole, MustFiveStarTime, Flag,
	      GroupId) ->
    case GroupId =:= 300 of
      true ->
	  case MustFiveStarTime =:= 0 of
	    true -> {UpdateRole, 0};
	    _ ->
		case Flag of
		  true ->
		      NewTime = 0,
		      FiveRole = var:set_var(UpdateRole, other, 3064,
					     NewTime),
		      {FiveRole, NewTime};
		  _ ->
		      NewTime = max(0, MustFiveStarTime - 1),
		      FiveRole = var:set_var(UpdateRole, other, 3064,
					     NewTime),
		      {FiveRole, NewTime}
		end
	  end;
      _ -> {UpdateRole, MustFiveStarTime}
    end.

have_five_star([]) -> false;
have_five_star([{_, Star} | Rest]) ->
    case Star >= 5 of
      true -> true;
      _ -> have_five_star(Rest)
    end.

draw_process(Role = #role{id = RoleId},
	     GroupData = #{group_id := GroupId}, Times, Args) ->
    RandList = recruit_data:group_items(GroupId),
    LimitInfo = limit_info({RoleId, GroupId}),
    case draw_times(Role, Times, GroupData, RandList,
		    Args#{limit_info => LimitInfo})
	of
      {ok, NewArgs} ->
	  Rewards = maps:get(rewards, NewArgs),
	  {ok, Rewards, NewArgs};
      {false, Msg} -> {false, Msg}
    end.

draw_times(Role, Times, GroupData, RandList,
	   Args = #{stats := Stats, limit_info := LimitInfo})
    when Times > 0 ->
    DrawTimes = maps:get(draw_times, Stats, 0),
    DrawType = maps:get(draw_type, Args, 1),
    CurDrawTimes = DrawTimes + 1,
    CurClassDrawTimes = util:if_true(DrawType =:= 1,
				     calc_one_draw_time(Stats) + 1,
				     CurDrawTimes),
    Steps = [must_partner_five, hit_five_star,
	     must_five_serise, must_partner, must_not_in_m_times,
	     must_after_m_times, hit_must_not_after_m_times,
	     hit_must_after_m_times, weight],
    case draw_steps(Steps, CurDrawTimes, GroupData,
		    RandList, Role, Args)
	of
      {ok, NewArgs} ->
	  NStats = maps:get(stats, NewArgs),
	  IsFiveStar = maps:get(is_five_star, NewArgs, 0),
	  NewStats = case IsFiveStar =:= 1 of
		       true ->
			   NStats#{draw_times => CurDrawTimes,
				   last_hit_five_star => CurDrawTimes};
		       _ -> NStats#{draw_times => CurDrawTimes}
		     end,
	  DrawOut = maps:get(draw_out, NewArgs),
	  NewLimitInfo = update_limit_info(DrawOut, CurDrawTimes,
					   CurClassDrawTimes, LimitInfo),
	  draw_times(Role, Times - 1, GroupData, RandList,
		     NewArgs#{stats => NewStats, limit_info => NewLimitInfo,
			      draw_out => #{}, is_five_star => 0});
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
draw_steps(must_partner_five, _CurTimes, _GroupData,
	   _RandList, #role{platform = <<"verifyios">>}, Args) ->
    PIdList = [24000, 24405, 25301, 25405, 26000],
    ItemBidList = [ItemBid
		   || ItemBid <- item_data:all(), ItemBid >= 20000,
		      ItemBid =< 29999],
    Fun = fun (ItemBid) ->
		  case item_data:get(ItemBid) of
		    #item_base{effect = [{27, {PId, _, _}}]} ->
			lists:member(PId, PIdList);
		    _ -> false
		  end
	  end,
    List = lists:filter(Fun, ItemBidList),
    case list_util:rand(List) of
      PtnBid when is_integer(PtnBid) ->
	  Rewards = maps:get(rewards, Args, []),
	  DrawOut = #{id => 0, class_id => 0, num => 1,
		      bid => PtnBid, rand_type => 2},
	  {ok,
	   Args#{rewards => [DrawOut | Rewards],
		 draw_out => DrawOut, is_break => true}};
      _ -> {ok, Args}
    end;
draw_steps(must_partner_five, CurTimes,
	   #{group_id := GroupId}, _RandList, _Role,
	   Args = #{stats := Stats}) ->
    DrawType = maps:get(draw_type, Args, 1),
    case DrawType =:= 10 of
      true ->
	  OldDrawTimes = maps:get(old_draw_times, Args, 0),
	  OldFiveCount = maps:get(old_five_count, Args, 0),
	  CurFiveTimes = OldFiveCount * 10 +
			   (CurTimes - OldDrawTimes),
	  case recruit_data:group_must({GroupId, DrawType,
					CurFiveTimes})
	      of
	    #{id := PtnBidL} ->
		case CurTimes rem 10 =:= 0 of
		  true ->
		      FiveCount = maps:get(five_count, Stats, 0),
		      {PtnBid, _} = list_util:keyrand(PtnBidL, 2),
		      Rewards = maps:get(rewards, Args, []),
		      DrawOut = #{id => 0, class_id => 0, num => 1,
				  bid => PtnBid, rand_type => 2},
		      NextFiveCount = FiveCount + 1,
		      NewStats = Stats#{five_count => NextFiveCount},
		      {ok,
		       Args#{stats => NewStats, rewards => [DrawOut | Rewards],
			     draw_out => DrawOut, is_break => true}};
		  _ ->
		      {PtnBid, _} = list_util:keyrand(PtnBidL, 2),
		      Rewards = maps:get(rewards, Args, []),
		      DrawOut = #{id => 0, class_id => 0, num => 1,
				  bid => PtnBid, rand_type => 2},
		      {ok,
		       Args#{rewards => [DrawOut | Rewards],
			     draw_out => DrawOut, is_break => true}}
		end;
	    _ -> {ok, Args}
	  end;
      _ -> {ok, Args}
    end;
draw_steps(must_five_serise, CurTimes,
	   GroupData = #{group_id := GroupId}, RandList, Role,
	   Args = #{stats := Stats,
		    limit_info := #recruit_limit{info = LimitInfo}}) ->
    DrawType = maps:get(draw_type, Args, 1),
    case DrawType =:= 10 andalso CurTimes rem 10 =:= 0 of
      true ->
	  MustFiveSS = maps:get(must_five_ss_n, GroupData, 0),
	  FiveCount = maps:get(five_count, Stats, 0),
	  FiveNotSS = maps:get(five_not_ss_times, Stats, 0),
	  NextFiveCount = FiveCount + 1,
	  NewFiveNotSS = FiveNotSS + 1,
	  case MustFiveSS > 0 of
	    true ->
		Fun = fun (#{id := Id, hit_must_not_after_m_times := N})
			      when N > 0 ->
			      IdLimit = maps:get(Id, LimitInfo, #{}),
			      HitN = maps:get(last2_hit_n, IdLimit, 0),
			      util:if_true(HitN =:= 0, true,
					   N < CurTimes - HitN);
			  (_) -> true
		      end,
		NewRandList = lists:filter(Fun, RandList),
		must_five_serise_step(DrawType, GroupId, NextFiveCount,
				      FiveNotSS, must_five_ss_n, NewRandList,
				      Role, Args);
	    false ->
		{ok,
		 Args#{stats =>
			   Stats#{five_count => NextFiveCount,
				  five_not_ss_times => NewFiveNotSS}}}
	  end;
      _ -> {ok, Args}
    end;
draw_steps(must_partner, CurTimes,
	   #{group_id := GroupId}, _RandList, _Role, Args) ->
    Rewards = maps:get(rewards, Args, []),
    DrawType = 1,
    case recruit_data:group_must({GroupId, DrawType,
				  CurTimes})
	of
      #{id := PtnBidL} ->
	  {PtnBid, _} = list_util:keyrand(PtnBidL, 2),
	  IsNotice = case item_data:get(PtnBid) of
		       #item_base{effect = [{27, {_, 5, _}}]} -> 1;
		       _ -> 0
		     end,
	  DrawOut = #{id => 0, class_id => 0, num => 1,
		      bid => PtnBid, rand_type => 2, is_notice => IsNotice},
	  NewRewards = [DrawOut | Rewards],
	  {ok,
	   Args#{rewards => NewRewards, draw_out => DrawOut,
		 is_break => true}};
      undefined -> {ok, Args}
    end;
draw_steps(hit_five_star, CurTimes,
	   GroupData = #{group_id := GroupId}, RandList, _Role,
	   Args = #{stats := Stats,
		    limit_info := #recruit_limit{info = LimitInfo}}) ->
    NotMustFiveStarL = maps:get(not_five_star_must,
				GroupData, []),
    LastHitFiveStar = maps:get(last_hit_five_star, Stats,
			       CurTimes),
    GroupRandL = recruit_data:group_items(GroupId),
    RandType = 2,
    case NotMustFiveStarL of
      [{NotMustFiveStarTimes, FiveStarRandList} | _]
	  when CurTimes - LastHitFiveStar >
		 NotMustFiveStarTimes ->
	  {ClassId, _} = util:rand_list(FiveStarRandList, 2),
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
		Rewards = maps:get(rewards, Args, []),
		IdLimit0 = maps:get(Id, LimitInfo, #{}),
		HitN0 = maps:get(last_hit_n, IdLimit0, 0),
		IsFirst = util:if_true(HitN0 =:= 0, 1, 0),
		IsFiveStar = case item_data:get(Bid) of
			       #item_base{effect = [{27, {_, 5, _}}]} -> 1;
			       _ ->
				   util:if_true(CurTimes == LastHitFiveStar, 1,
						0)
			     end,
		DrawOut = #{id => Id, class_id => ClassId, bid => Bid,
			    num => Num, rand_type => RandType,
			    is_notice => IsNotice, is_first => IsFirst},
		{ok,
		 Args#{rewards => [DrawOut | Rewards],
		       draw_out => DrawOut, is_break => true,
		       is_five_star => IsFiveStar}};
	    _ ->
		{false,
		 lang:get(<<"Không có đạo cụ ngẫu nhiên để rút"/utf8>>)}
	  end;
      _ -> {ok, Args}
    end;
draw_steps(weight, CurTimes, #{group_id := GroupId},
	   RandList, _Role,
	   Args = #{stats := Stats,
		    limit_info := #recruit_limit{info = LimitInfo}}) ->
    DrawType = maps:get(draw_type, Args, 1),
    LastHitFiveStar = maps:get(last_hit_five_star, Stats,
			       CurTimes),
    RandClassL = recruit_data:rand_class({DrawType,
					  GroupId}),
    GroupRandL = recruit_data:group_items(GroupId),
    OneDrawTimes = calc_one_draw_time(Stats) + 1,
    Fun = fun ({ClassId, _, _, N}) when N > 0 ->
		  IdLimit = maps:get(ClassId, LimitInfo, #{}),
		  HitN = maps:get(last_hit_n, IdLimit, 0),
		  util:if_true(DrawType =:= 10, N < CurTimes - HitN,
			       util:if_true(HitN =:= 0, true,
					    N < OneDrawTimes - HitN));
	      (_) -> true
	  end,
    RandClassL1 = lists:filter(Fun, RandClassL),
    RandType = 2,
    {ClassId, _, _, _} = util:rand_list(RandClassL1, 3),
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
	  Rewards = maps:get(rewards, Args, []),
	  IdLimit0 = maps:get(Id, LimitInfo, #{}),
	  HitN0 = maps:get(last_hit_n, IdLimit0, 0),
	  IsFirst = util:if_true(HitN0 =:= 0, 1, 0),
	  IsFiveStar = case item_data:get(Bid) of
			 #item_base{effect = [{27, {_, 5, _}}]} -> 1;
			 _ -> util:if_true(CurTimes == LastHitFiveStar, 1, 0)
		       end,
	  DrawOut = #{id => Id, class_id => ClassId, bid => Bid,
		      num => Num, rand_type => RandType,
		      is_notice => IsNotice, is_first => IsFirst},
	  {ok,
	   Args#{rewards => [DrawOut | Rewards],
		 draw_out => DrawOut, is_break => true,
		 is_five_star => IsFiveStar}};
      _ ->
	  {false,
	   lang:get(<<"Không có đạo cụ ngẫu nhiên để rút"/utf8>>)}
    end;
draw_steps(must_not_in_m_times, CurTimes, _GroupData,
	   RandList, _Role, Args) ->
    NewRandList = [Cfg
		   || Cfg = #{must_not_in_m_times := N} <- RandList,
		      N =:= 0 orelse CurTimes > N],
    {ok, NewRandList, Args};
draw_steps(must_after_m_times, CurTimes, _GroupData,
	   RandList, _Role, Args) ->
    NewRandList = [Cfg
		   || Cfg = #{must_after_m_times := N} <- RandList,
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
draw_steps(hit_must_after_m_times, CurTimes, _GroupData,
	   RandList, _Role,
	   Args = #{limit_info :=
			#recruit_limit{info = LimitInfo}}) ->
    Fun = fun (#{id := Id, hit_must_after_m_times := N})
		  when N > 0 ->
		  IdLimit = maps:get(Id, LimitInfo, #{}),
		  HitN = maps:get(last_hit_n, IdLimit, 0),
		  N > CurTimes - HitN;
	      (_) -> false
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
      {__Pidrecruit607, _,
       {__Levelrecruit607, __Tracesrecruit607}}
	  when __Levelrecruit607 band 8 /= 0 orelse
		 __Tracesrecruit607 /= [] ->
	  lager:do_log(error,
		       [{module, recruit}, {function, draw_steps}, {line, 607},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]未知的召唤随机过程步骤[Step:~w][Data:~w][Args:~w]",
				     [Role#role.name, Step, GroupData, Args]),
		       none, 4096, 8, __Levelrecruit607, __Tracesrecruit607,
		       lager_event, __Pidrecruit607);
      _ -> ok
    end,
    {false,
     lang:get(<<"Bước ngẫu nhiên không xác định"/utf8>>)}.

check_cond(Role = #role{partner_bag =
			    #partner_bag{num = Num, partner_list = List},
			m_vip = #m_vip{lev = VipLev}},
	   GroupId, Times, _CostType) ->
    NewNum = Num + partner:get_bag_num(Role),
    case NewNum >= length(List) + Times of
      true ->
	  case GroupId =/= 400 orelse
		 VipLev >= recruit_data:get_const(recruit_vip)
	      of
	    true ->
		case recruit_data:get_group(GroupId) of
		  Data = #{draw_list := DrawL} ->
		      case lists:member(Times, DrawL) of
			true -> check_open(Role, Data);
			false ->
			    {false, lang:get(<<"Lỗi lượt triệu hồi"/utf8>>)}
		      end;
		  _ -> {false, lang:get(<<"未知的卡池"/utf8>>)}
		end;
	    _ ->
		{false,
		 util:fbin("需要达到VIP~w才可召唤",
			   [recruit_data:get_const(recruit_vip)])}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Túi tướng đầy, không thể triệu hồi tướng"/utf8>>)}
    end.

open_dun_list([], _Role, Acc) -> Acc;
open_dun_list([Cfg | T], Role, Acc) ->
    NewAcc = case check_open(Role, Cfg) of
	       {ok, _} -> [Cfg | Acc];
	       _ -> Acc
	     end,
    open_dun_list(T, Role, NewAcc).

check_open(Role = #role{}, Data) ->
    case maps:get(limit_id, Data, []) of
      [] -> {ok, Data};
      CondList = [_ | _] ->
	  case check_open_cond(CondList, Role) of
	    true -> {ok, Data};
	    {false, Msg} -> {false, Msg}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Chưa đạt điều kiện mở Hồ triệu hồi này"/utf8>>)}
    end.

check_open_cond([], _Role) -> true;
check_open_cond([{open_day, OpenDay} | Rest], Role) ->
    case game_lib:server_open_time(day) >= OpenDay of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false, lang:get(<<"Số ngày mở server không đủ"/utf8>>)}
    end;
check_open_cond([{dun, DunId} | Rest], Role) ->
    case dungeon:is_pass(Role, DunId) of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false, lang:get(<<"Thông qua Rừng Kadar 2 mở"/utf8>>)}
    end;
check_open_cond([{lev, LimitLev} | Rest],
		Role = #role{lev = Lev}) ->
    case LimitLev =< Lev of
      true -> check_open_cond(Rest, Role);
      false ->
	  {false, lang:get(<<"Chưa đạt cấp tương ứng"/utf8>>)}
    end.

open_list([], _Role, Acc) -> Acc;
open_list([H | T], Role, Acc) ->
    NewAcc = case open_info(H, Role) of
	       {ok, Info} -> [Info | Acc];
	       _ -> Acc
	     end,
    open_list(T, Role, NewAcc).

open_info(Cfg = #{draw_list := DrawL = [_ | _],
		  group_id := GroupId},
	  Role) ->
    L = var:get_var(Role, five, 558, []),
    Acc = make_open_info(DrawL, Cfg, Role, L, []),
    {ok, {GroupId, Acc}};
open_info(Cfg, Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrecruit698, _,
       {__Levelrecruit698, __Tracesrecruit698}}
	  when __Levelrecruit698 band 8 /= 0 orelse
		 __Tracesrecruit698 /= [] ->
	  lager:do_log(error,
		       [{module, recruit}, {function, open_info}, {line, 698},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]没有召唤次数列表:~w",
				     [Role#role.name, Cfg]),
		       none, 4096, 8, __Levelrecruit698, __Tracesrecruit698,
		       lager_event, __Pidrecruit698);
      _ -> ok
    end,
    false.

make_open_info([], _Cfg, _Role, _L, Acc) -> Acc;
make_open_info([H | T], Cfg, Role, L, Acc) ->
    NewAcc = case make_open_info(H, Cfg, Role, L) of
	       {ok, Info} -> [Info | Acc];
	       _ -> Acc
	     end,
    make_open_info(T, Cfg, Role, L, NewAcc).

make_open_info(Times = 1, #{group_id := GroupId}, _Role,
	       L) ->
    {DrawFreeCount, CdTime} = case lists:member(GroupId,
						[100, 300])
				  of
				true ->
				    case lists:keyfind(GroupId, 1, L) of
				      false -> {1, 0};
				      {_, CdTimeT, _} -> {0, CdTimeT};
				      _ -> {0, 0}
				    end;
				_ -> {0, 0}
			      end,
    {ok,
     {Times, [{4, DrawFreeCount, <<>>}, {5, CdTime, <<>>}]}};
make_open_info(Times = 10, _Cfg, _Role, _L) ->
    {ok, {Times, [{4, 0, <<>>}, {5, 0, <<>>}]}};
make_open_info(_Times, Cfg, Role, _L) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrecruit723, _,
       {__Levelrecruit723, __Tracesrecruit723}}
	  when __Levelrecruit723 band 8 /= 0 orelse
		 __Tracesrecruit723 /= [] ->
	  lager:do_log(error,
		       [{module, recruit}, {function, make_open_info},
			{line, 723}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]未处理的召唤次数:~w",
				     [Role#role.name, Cfg]),
		       none, 4096, 8, __Levelrecruit723, __Tracesrecruit723,
		       lager_event, __Pidrecruit723);
      _ -> ok
    end,
    false.

push_base_info(Role) ->
    push_base_info([100, 300], Role).

push_base_info([], _Role) -> ok;
push_base_info([GroupId | Rest], Role) ->
    push_base_info(GroupId, Role),
    push_base_info(Rest, Role),
    ok;
push_base_info(GroupId, Role) ->
    FreeTimesL = var:get_var(Role, five, 558, []),
    FreeTimes = list_util:keyfind(GroupId, 1, FreeTimesL,
				  {GroupId, 0, 0}),
    role:pack_send(Role, 23202, FreeTimes),
    ok.

push_group(Role, GroupData) ->
    List = open_list([GroupData], Role, []),
    role:pack_send(Role, 23204, {List}),
    ok.

stats(GroupId,
      #role{m_recruit = #m_recruit{list = List}}) ->
    case lists:keyfind(GroupId, #recruit_info.group_id,
		       List)
	of
      #recruit_info{stats = Stats} -> Stats;
      _ -> init_stats(GroupId)
    end.

init_stats(GroupId) ->
    Data = recruit_data:get_group(GroupId),
    DiscountTime = maps:get(limit_dist_five_time, Data, 0),
    EndTime = util:if_true(DiscountTime =:= 0, 0,
			   date:unixtime() + 60 * DiscountTime),
    #{draw_times => 0, five_count => 0,
      five_not_ss_times => 0, discount_endtine => EndTime,
      discount_count => 0, last_hit_five_star => 0}.

update_stats(GroupId, Stats,
	     Role = #role{m_recruit =
			      MRecruit = #m_recruit{list = List}}) ->
    case lists:keyfind(GroupId, #recruit_info.group_id,
		       List)
	of
      Info = #recruit_info{} ->
	  NewList = lists:keystore(GroupId,
				   #recruit_info.group_id, List,
				   Info#recruit_info{stats = Stats}),
	  Role#role{m_recruit =
			MRecruit#m_recruit{list = NewList}};
      false ->
	  Role#role{m_recruit =
			MRecruit#m_recruit{list =
					       [#recruit_info{group_id =
								  GroupId,
							      stats = Stats}
						| List]}}
    end.

limit_info(Key) ->
    case recruit_mgr:lookup(Key) of
      {ok, Info = #recruit_limit{}} -> Info;
      _ ->
	  Info = #{last_hit_n => 0, last2_hit_n => 0},
	  #recruit_limit{key = Key, info = Info}
    end.

update_limit_info(#{id := Id, class_id := ClassId},
		  Times, ClassTimes,
		  LimitInfo = #recruit_limit{info = Info})
    when Id > 0 ->
    IdLimit = maps:get(Id, Info, #{}),
    ClassLimt = maps:get(ClassId, Info, #{}),
    LastN = maps:get(last_hit_n, IdLimit, 0),
    NewInfo = Info#{Id =>
			IdLimit#{last_hit_n => Times, last2_hit_n => LastN},
		    ClassId => ClassLimt#{last_hit_n => ClassTimes}},
    LimitInfo#recruit_limit{info = NewInfo};
update_limit_info(_DrawOut, _Times, _ClassTimes,
		  LimitInfo) ->
    LimitInfo.

split_rewards([], _Role, Args) -> Args;
split_rewards([Cfg = #{rand_type := 2, bid := Bid,
		       num := Num}
	       | T],
	      Role, Args) ->
    IsNotice = maps:get(is_notice, Cfg, 0),
    NoticeL = maps:get(notice, Args, []),
    case Num > 1 of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrecruit805, _,
	     {__Levelrecruit805, __Tracesrecruit805}}
		when __Levelrecruit805 band 64 /= 0 orelse
		       __Tracesrecruit805 /= [] ->
		lager:do_log(info,
			     [{module, recruit}, {function, split_rewards},
			      {line, 805}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]抽中了多个整卡伙伴道具:~w，只处理1个的情况",
					   [Role#role.name, Cfg]),
			     none, 4096, 64, __Levelrecruit805,
			     __Tracesrecruit805, lager_event, __Pidrecruit805);
	    _ -> ok
	  end;
      _ -> ok
    end,
    NewArgs = case item_data:get(Bid) of
		#item_base{effect = Eff} ->
		    case lists:keyfind(7, 1, Eff) of
		      {_, PtnBid} ->
			  PtnBids = maps:get(partner_bids, Args, []),
			  Items = maps:get(items, Args, []),
			  NewItems = [{Bid, 1} | Items],
			  Args#{items => NewItems,
				partner_bids => [PtnBid | PtnBids]};
		      _ ->
			  case lists:keyfind(27, 1, Eff) of
			    {_, {PtnBid, InitStar, _}} ->
				PtnBids = maps:get(partner_bids, Args, []),
				Items = maps:get(items, Args, []),
				NewItems = [{Bid, 1} | Items],
				NewNoticeL = util:if_true(IsNotice =:= 1,
							  [{PtnBid, InitStar}
							   | NoticeL],
							  NoticeL),
				Args#{items => NewItems,
				      partner_bids => [PtnBid | PtnBids],
				      notice => NewNoticeL};
			    _ ->
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
				  {__Pidrecruit826, _,
				   {__Levelrecruit826, __Tracesrecruit826}}
				      when __Levelrecruit826 band 8 /= 0 orelse
					     __Tracesrecruit826 /= [] ->
				      lager:do_log(error,
						   [{module, recruit},
						    {function, split_rewards},
						    {line, 826},
						    {pid, pid_to_list(self())},
						    {node, node()}
						    | lager:md()],
						   io_lib:format("[~ts]拆分未知的召唤道具奖励[Bid:~w]",
								 [Role#role.name,
								  Bid]),
						   none, 4096, 8,
						   __Levelrecruit826,
						   __Tracesrecruit826,
						   lager_event,
						   __Pidrecruit826);
				  _ -> ok
				end,
				Args
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
		      {__Pidrecruit831, _,
		       {__Levelrecruit831, __Tracesrecruit831}}
			  when __Levelrecruit831 band 8 /= 0 orelse
				 __Tracesrecruit831 /= [] ->
			  lager:do_log(error,
				       [{module, recruit},
					{function, split_rewards}, {line, 831},
					{pid, pid_to_list(self())},
					{node, node()}
					| lager:md()],
				       io_lib:format("[~ts]拆分未知的召唤道具奖励[Bid:~w]",
						     [Role#role.name, Bid]),
				       none, 4096, 8, __Levelrecruit831,
				       __Tracesrecruit831, lager_event,
				       __Pidrecruit831);
		      _ -> ok
		    end,
		    Args
	      end,
    split_rewards(T, Role, NewArgs);
split_rewards([#{bid := Bid, num := Num} | T], Role,
	      Args) ->
    Items = maps:get(items, Args, []),
    NewItems = [{Bid, Num} | Items],
    split_rewards(T, Role, Args#{items => NewItems}).

set_free(Role = #role{m_recruit = MRecruit}) ->
    NewMRecruit = MRecruit#m_recruit{free_cd_end = 0},
    NewRole = Role#role{m_recruit = NewMRecruit},
    push_base_info(NewRole),
    {ok, NewRole}.

set_broadcast_timer(Role, PartnerBids = [_ | _],
		    GroupId, CostType) ->
    #gain_loss_opts{split_str = SplitStr} =
	#gain_loss_opts{},
    Fun = fun ({Bid, InitStar}, Acc) ->
		  case partner_data:get_base(Bid) of
		    PtnData = #partner_base_data{} when InitStar == 5 ->
			Msg =
			    util:fbin(lang:get(<<"~w sao ninja cam ~ts"/utf8>>),
				      [InitStar,
				       color:format({partner, PtnData})]),
			case Acc of
			  <<>> -> Msg;
			  _ -> <<Acc/binary, SplitStr/binary, Msg/binary>>
			end;
		    _ -> Acc
		  end
	  end,
    PtnMsg = lists:foldl(Fun, <<>>, PartnerBids),
    case PtnMsg of
      <<>> -> Role;
      _ ->
	  Msg = case GroupId of
		  100 when CostType =:= 5 ->
		      color:msg(lang:get(<<"~ts dùng Cuộn triệu hồi mạo hiểm may "
					   "mắn trong ~ts nhận ~ts"/utf8>>),
				[{role, Role#role.name},
				 {role_name,
				  lang:get(<<"Triệu hồi thường"/utf8>>)},
				 PtnMsg]);
		  100 ->
		      color:msg(lang:get(<<"~ts trong ~ts nhận ~ts, thật may mắn!"/utf8>>),
				[{role, Role#role.name},
				 {role_name,
				  lang:get(<<"Triệu hồi thường"/utf8>>)},
				 PtnMsg]);
		  200 when CostType =:= 5 ->
		      color:msg(lang:get(<<"~ts dùng Cuộn triệu hồi mạo hiểm may "
					   "mắn trong ~ts nhận ~ts"/utf8>>),
				[{role, Role#role.name},
				 {role_name,
				  lang:get(<<"Triệu hồi hữu nghị"/utf8>>)},
				 PtnMsg]);
		  200 ->
		      color:msg(lang:get(<<"~ts may mắn trong ~ts nhận được ~ts"/utf8>>),
				[{role, Role#role.name},
				 {role_name,
				  lang:get(<<"Triệu hồi hữu nghị"/utf8>>)},
				 PtnMsg]);
		  300 when CostType =:= 5 ->
		      color:msg(lang:get(<<"~ts dùng Cuộn triệu hồi mạo hiểm may "
					   "mắn trong ~ts nhận ~ts"/utf8>>),
				[{role, Role#role.name},
				 {role_name,
				  lang:get(<<"Triệu hồi cao cấp"/utf8>>)},
				 PtnMsg]);
		  300 ->
		      color:msg(lang:get(<<"~ts may mắn trong ~ts nhận được ~ts"/utf8>>),
				[{role, Role#role.name},
				 {role_name,
				  lang:get(<<"Triệu hồi cao cấp"/utf8>>)},
				 PtnMsg]);
		  400 when CostType =:= 5 ->
		      color:msg(lang:get(<<"~ts dùng Cuộn triệu hồi mạo hiểm may "
					   "mắn trong ~ts nhận ~ts"/utf8>>),
				[{role, Role#role.name},
				 {role_name,
				  lang:get(<<"Điểm triệu hồi"/utf8>>)},
				 PtnMsg]);
		  400 ->
		      color:msg(lang:get(<<"~ts may mắn trong ~ts nhận được ~ts"/utf8>>),
				[{role, Role#role.name},
				 {role_name,
				  lang:get(<<"Điểm triệu hồi"/utf8>>)},
				 PtnMsg]);
		  _ ->
		      color:msg(lang:get(<<"~ts thành công triệu hồi ra ~ts"/utf8>>),
				[{role, Role#role.name}, PtnMsg])
		end,
	  Timeout = length(PartnerBids) * 4 * 1000,
	  BroadTimer = #timer{id =
				  {recruit_broadcast, date:unixtime()},
			      timeout = Timeout, m = recruit, f = broadcast,
			      a = [Msg]},
	  role_timer:set(BroadTimer, Role)
    end;
set_broadcast_timer(Role, _, _, _) -> Role.

must_five_serise_step(DrawType, GroupId, NextFiveCount,
		      FiveNotSS, FiveSeriseType, RandList, Role,
		      Args = #{stats := Stats,
			       limit_info :=
				   #recruit_limit{info = LimitInfo}}) ->
    RandType = 2,
    case recruit_data:class_ids({DrawType, GroupId,
				 RandType})
	of
      RandClassL = [_ | _] ->
	  ClassL = [Cfg
		    || Cfg = #{class_id := ClassIdCfg} <- RandList,
		       lists:member(ClassIdCfg, RandClassL)],
	  case maps_util:rand(ClassL, series_must_weight) of
	    Cfg = #{id := Id, num := Num, bid := Bid,
		    class_id := ClassId} ->
		IsNotice = maps:get(is_notice, Cfg, 0),
		Rewards = maps:get(rewards, Args, []),
		IdLimit0 = maps:get(Id, LimitInfo, #{}),
		HitN0 = maps:get(last_hit_n, IdLimit0, 0),
		IsFirst = util:if_true(HitN0 =:= 0, 1, 0),
		DrawOut = #{id => Id, class_id => ClassId, bid => Bid,
			    num => Num, rand_type => RandType,
			    is_notice => IsNotice, is_first => IsFirst},
		NewStats = case FiveSeriseType =:= must_five_ss_n of
			     true ->
				 Stats#{five_count => NextFiveCount,
					five_not_ss_times => 1};
			     _ ->
				 Stats#{five_count => NextFiveCount,
					five_not_ss_times => FiveNotSS + 1}
			   end,
		NewArgs = Args#{stats => NewStats,
				rewards => [DrawOut | Rewards],
				draw_out => DrawOut, is_break => true},
		{ok, NewArgs};
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrecruit909, _,
		   {__Levelrecruit909, __Tracesrecruit909}}
		      when __Levelrecruit909 band 8 /= 0 orelse
			     __Tracesrecruit909 /= [] ->
		      lager:do_log(error,
				   [{module, recruit},
				    {function, must_five_serise_step},
				    {line, 909}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]5连抽没有可以[~w]必出[Type:~w]英雄:~w",
						 [Role#role.name,
						  {DrawType, GroupId, RandType},
						  FiveSeriseType, Err]),
				   none, 4096, 8, __Levelrecruit909,
				   __Tracesrecruit909, lager_event,
				   __Pidrecruit909);
		  _ -> ok
		end,
		{false,
		 lang:get(<<"Không có tướng chắc chắn ra"/utf8>>)}
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
	    {__Pidrecruit913, _,
	     {__Levelrecruit913, __Tracesrecruit913}}
		when __Levelrecruit913 band 8 /= 0 orelse
		       __Tracesrecruit913 /= [] ->
		lager:do_log(error,
			     [{module, recruit},
			      {function, must_five_serise_step}, {line, 913},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]5连抽没有可以[~w]必出[Type:~w]英雄",
					   [Role#role.name,
					    {DrawType, GroupId, RandType},
					    FiveSeriseType]),
			     none, 4096, 8, __Levelrecruit913,
			     __Tracesrecruit913, lager_event, __Pidrecruit913);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Không có loại tướng chắc chắn ra"/utf8>>)}
    end.

calc_one_draw_time(#{draw_times := DrawTime,
		     five_count := FiveCount}) ->
    DrawTime - FiveCount * 5;
calc_one_draw_time(_Stat) -> 0.

get_log_msg(100, 1, Times) ->
    util:fbin(<<"普通卡库~w连_免费召唤"/utf8>>, [Times]);
get_log_msg(100, 3, Times) ->
    util:fbin(<<"普通卡库~w连_钻石召唤"/utf8>>, [Times]);
get_log_msg(100, 4, Times) ->
    util:fbin(<<"普通卡库~w连_道具召唤"/utf8>>, [Times]);
get_log_msg(100, 5, Times) ->
    util:fbin(<<"普通卡库~w连_特殊道具召唤"/utf8>>, [Times]);
get_log_msg(200, 1, Times) ->
    util:fbin(<<"友情卡库~w连_免费召唤"/utf8>>, [Times]);
get_log_msg(200, 3, Times) ->
    util:fbin(<<"友情卡库~w连_钻石召唤"/utf8>>, [Times]);
get_log_msg(200, 4, Times) ->
    util:fbin(<<"友情卡库~w连_道具召唤"/utf8>>, [Times]);
get_log_msg(200, 5, Times) ->
    util:fbin(<<"友情卡库~w连_特殊道具召唤"/utf8>>, [Times]);
get_log_msg(300, 1, Times) ->
    util:fbin(<<"高级卡库~w连_免费召唤"/utf8>>, [Times]);
get_log_msg(300, 3, Times) ->
    util:fbin(<<"高级卡库~w连_钻石召唤"/utf8>>, [Times]);
get_log_msg(300, 4, Times) ->
    util:fbin(<<"高级卡库~w连_道具召唤"/utf8>>, [Times]);
get_log_msg(300, 5, Times) ->
    util:fbin(<<"高级卡库~w连_特殊道具召唤"/utf8>>, [Times]);
get_log_msg(400, 1, Times) ->
    util:fbin(<<"积分召唤~w连_免费召唤"/utf8>>, [Times]);
get_log_msg(400, 3, Times) ->
    util:fbin(<<"积分召唤~w连_钻石召唤"/utf8>>, [Times]);
get_log_msg(400, 4, Times) ->
    util:fbin(<<"积分召唤~w连_道具召唤"/utf8>>, [Times]);
get_log_msg(400, 5, Times) ->
    util:fbin(<<"积分召唤~w连_特殊道具召唤"/utf8>>, [Times]);
get_log_msg(_, 1, Times) ->
    util:fbin(<<"新卡库~w连_免费召唤"/utf8>>, [Times]);
get_log_msg(_, 3, Times) ->
    util:fbin(<<"新卡库~w连_钻石召唤"/utf8>>, [Times]);
get_log_msg(_, 4, Times) ->
    util:fbin(<<"新卡库~w连_道具召唤"/utf8>>, [Times]);
get_log_msg(_, _, _) -> <<"未知卡库"/utf8>>.

gm_test_refresh(Role, _GroupId, _Times, Num, Result)
    when Num =< 0 ->
    {Role, Result};
gm_test_refresh(Role, GroupId, Times, Num, Result) ->
    GroupData = recruit_data:get_group(GroupId),
    Stats = stats(GroupId, Role),
    Args = #{stats => Stats, draw_type => Times},
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
    case draw_process(Role, GroupData, Times, Args) of
      {ok, Rewards, NewArgs} ->
	  NewResult = lists:foldl(Fun, Result, Rewards),
	  NewLimitInfo = maps:get(limit_info, NewArgs),
	  NewStats = maps:get(stats, NewArgs),
	  UpdateRole = update_stats(GroupId, NewStats, Role),
	  recruit_mgr:save(NewLimitInfo),
	  gm_test_refresh(UpdateRole, GroupId, Times, Num - 1,
			  NewResult);
      _ ->
	  {false, lang:get(<<"Do báo lỗi test gián đoạn"/utf8>>)}
    end.


