-file("src/mod/role/role.erl", 1).

-module(role).

-lager_records([{combat_drama,
		 [id, next, timeout, ts, winner, play_list, combat_list,
		  guide_list]},
		{item_reward_p, [bid, is_bind, num]},
		{assets_reward_p, [type, val]},
		{exp_reward_p,
		 [object_type, object_id, srv_id, career, sex, old_lev,
		  old_exp, new_lev, new_exp, is_die, assets_reward]},
		{combat_order_p, [pos, distance, group]},
		{skill_p, [skill_bid, end_round]},
		{fight_object_p,
		 [pos, group, owner_id, owner_srv_id, object_type,
		  object_id, object_bid, is_awake, star, object_name, sex,
		  career, lev, hp, hp_max, face_id, round, skills,
		  is_strong_partner, extra_data, camp_type, sprites]},
		{buff_play,
		 [target, buff_bid, end_round, remain_round, action_type,
		  change_type, change_value, is_dead, id, id2]},
		{sub_effect_play,
		 [sub_target, sub_effect_id, sub_hp_changed,
		  sub_distance, sub_is_hit, sub_skill_id, extra_effect]},
		{effect_play,
		 [order, actor, target, effect_bid, is_hit, is_crit,
		  hp_changed, hp, buff_list, summon_list, distance,
		  is_dead, sub_effect_play_list, is_blind,
		  skill_bid_of_effect, actor_hp_changed, actor_is_dead,
		  aid_actor, total_hurt, hurt_reward, camp_restrain]},
		{skill_play,
		 [order, actor, target, skill_bid, talk_pos,
		  talk_content, effect_play]},
		{mon_ai,
		 [bid, name, ai, is_loop, condition, rate, skill_target,
		  skill_id, talk_target, talk_content]},
		{combat_result,
		 [result, dead_monster_num, wave_num, dead_partner,
		  replay_id, a_stat_info, b_stat_info, end_type,
		  opponent_id, total_hurt, action_count, group_a_num,
		  hurt_statistics_a, curt_statistics_a, hurt_statistics,
		  replay_info, combat_pid, a_halo_dizzy_num,
		  a_max_num_def, a_control_info, a_kill_info,
		  a_continue_hurt, a_revive_info, a_dodge_count,
		  a_anti_kill_count, a_halo_kill_count, a_fire_buff_num,
		  hurt_statistics_b, curt_statistics_b, b_halo_dizzy_num,
		  b_max_num_def, b_control_info, b_kill_info,
		  b_continue_hurt, b_revive_info, b_dodge_count,
		  b_anti_kill_count, b_halo_kill_count, b_fire_buff_num,
		  is_balance, a_sprite_kill_count]},
		{partner_hurt,
		 [master_id, id, bid, star, lev, camp_type, dps, cure,
		  ext_data, be_hurt]},
		{combat,
		 [type, attack_list, defend_list, combat_roles,
		  formation, on_combat_begin, on_combat_end,
		  on_role_combat_end, state_end_time, round_countdown,
		  min_play_time, take_action, ext_args, wave, total_wave,
		  multi_wave_defend, combat_result, is_pause, combat_map,
		  combat_drama, target_role_name, is_combat_end, end_time,
		  begin_time, watching_roles, is_skip, round, is_robot,
		  select_buff_callback, terminate_func, attack_power,
		  defend_power, replay_info, other_arge]},
		{combat_buff,
		 [id, bid, actor, group, end_round, buff_result_type,
		  positive_or_negative, buff_result, join_num, can_reduce,
		  lev, probability, clean_when_dead, hit_count, is_show,
		  wave, group_pro]},
		{fight_object,
		 [master_id, master_pid, object_type, object_id,
		  object_bid, is_clone, is_auto, is_leader, host_bid,
		  object_name, is_awake, star, sex, career, lev, face_id,
		  hp, hp_max, pos, round, wave_round, distance,
		  rand_speed, init_attr, base_attr, fight_attr,
		  active_skills, passive_skills, skill_order, buff_list,
		  owner_id, passive_effects_of_skill, is_boss,
		  is_strong_partner, quality, initial_hp_max, extra_data,
		  awaken_type, camp_type, power, replay, hallows_looks,
		  sprites, guild_break_power]},
		{combat_role,
		 [id, pid, conn_pid, name, gid, gname, is_auto, is_ready,
		  is_play_over, is_offline, group, auto_watch_model, lev,
		  face_id, watching, is_load_map_finish]},
		{combat_buff_data,
		 [bid, name, group, join_type, lev, join_num, duration,
		  buff_result_type, buff_result, desc,
		  positive_or_negative, can_reduce, probability,
		  clean_when_dead, clean_next_wave, is_show, group_pro,
		  dot_type]},
		{effect_data,
		 [bid, group, target_type, target_num, effect_type,
		  hurt_type, base_hit, hit_type, effect_param, condition,
		  condition_param, extra_param, passive_effect,
		  effect_desc]},
		{skill_data,
		 [bid, name, owner, group, next_id, min_play_time, level,
		  is_normal_skill, type, trigger_condition, trigger_param,
		  target, effect_list, add_attr, cd, count, best_target,
		  fit_combat_type, skill_changed, power, is_combat_hidden,
		  priority]},
		{m_skill, [skills_used, skills_owned]},
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
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
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
		{login,
		 [login_time, logout_time, prev_logout_time,
		  prev_login_time, log_login_time]},
		{link, [socket, conn_pid, ip, port, lag]},
		{pos,
		 [ver, srv_id, map_id, map_pid, map_bid, map_grid_pid,
		  last, hidden, x, y, dir]},
		{pos_history, [map_id, map_bid, srv_id, x, y]},
		{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
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

-export([start/5, stop/3, stop/4, rpc/4, rpc/5,
	 redirect/3, apply/3, convert/2, convert/3, element/2,
	 get_dict/1, get_dict_int/1, get_dict/2, put_dict/2,
	 put_dict/3, erase_dict/1, erase_dict/2,
	 get_dict_role_info/1, set_ms_timer/3,
	 set_loop_ms_timer/4, unset_timer/1, unset_timers/1,
	 send_buff_begin/0, send_buff_flush/0, send_buff_clean/0,
	 pack_send/2, pack_send/3, pack_send/4, send/1, send/2,
	 proxy_send/2]).

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

-file("src/mod/role/role.erl", 25).

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

-file("src/mod/role/role.erl", 26).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/role/role.erl", 27).

-file("inc/pos.hrl", 1).

-record(pos_history,
	{map_id = 0  :: non_neg_integer(),
	 map_bid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer()}).

-record(pos,
	{ver = 2, srv_id = <<>>  :: bitstring(),
	 map_id = {0, <<>>}, map_pid = 0, map_bid = 0,
	 map_grid_pid = 0, last, hidden = 0, x = 0, y = 0,
	 dir = 5}).

-file("src/mod/role/role.erl", 28).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/mod/role/role.erl", 29).

-file("inc/login.hrl", 1).

-record(login,
	{login_time = 0, logout_time = 0, prev_logout_time = 0,
	 prev_login_time = 0, log_login_time = 0}).

-file("src/mod/role/role.erl", 30).

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

-file("src/mod/role/role.erl", 31).

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

-file("src/mod/role/role.erl", 32).

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

-file("src/mod/role/role.erl", 33).

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

-file("src/mod/role/role.erl", 34).

-file("inc/combat.hrl", 1).

-file("inc/common.hrl", 1).

-file("inc/combat.hrl", 13).

-file("inc/attr.hrl", 1).

-file("inc/combat.hrl", 14).

-file("inc/skill.hrl", 1).

-record(m_skill,
	{skills_used = [], skills_owned = []  :: [integer()]}).

-record(skill_data,
	{bid, name, owner, group, next_id = 0,
	 min_play_time = 0, level, is_normal_skill = 0,
	 type  ::
	     passive_skill | active_skill | eqm_passive_skill,
	 trigger_condition = none, trigger_param = 0, target,
	 effect_list = [], add_attr = [], cd, count,
	 best_target = normal, fit_combat_type = all,
	 skill_changed = none, power = 0, is_combat_hidden = 0,
	 priority = 0}).

-record(effect_data,
	{bid, group, target_type, target_num, effect_type,
	 hurt_type, base_hit, hit_type = effect_hit,
	 effect_param, condition = none, condition_param = none,
	 extra_param = [], passive_effect = none,
	 effect_desc = <<>>}).

-record(combat_buff_data,
	{bid, name, group, join_type, lev, join_num, duration,
	 buff_result_type, buff_result = [], desc,
	 positive_or_negative, can_reduce, probability = 1000,
	 clean_when_dead = true, clean_next_wave = 0,
	 is_show = true, group_pro = 0, dot_type = 0}).

-file("inc/combat.hrl", 15).

-record(combat_role,
	{id = {0, <<>>}, pid = none, conn_pid = none,
	 name = <<>>, gid = {0, <<>>}, gname = <<>>,
	 is_auto = true, is_ready = false, is_play_over = false,
	 is_offline = false, group = 0, auto_watch_model = 0,
	 lev = 0, face_id = 0, watching = 1,
	 is_load_map_finish = false}).

-record(fight_object,
	{master_id = {0, <<>>}, master_pid = none,
	 object_type = 0, object_id = 0  :: integer(),
	 object_bid = 0, is_clone = 0, is_auto = 0,
	 is_leader = 0, host_bid = 0, object_name = <<>>,
	 is_awake = 0, star = 0, sex = 0, career = 0, lev = 0,
	 face_id = 0, hp = 1, hp_max = 1, pos = 0, round = 0,
	 wave_round = 0, distance = 0, rand_speed = 0, init_attr,
	 base_attr, fight_attr = #attr{},
	 active_skills = []  :: [#skill_data{}],
	 passive_skills = []  :: [#skill_data{}],
	 skill_order = []  :: [#skill_data{}], buff_list = [],
	 owner_id = {0, <<>>},
	 passive_effects_of_skill = []  :: [#effect_data{}],
	 is_boss = false, is_strong_partner = 0, quality = 0,
	 initial_hp_max = 0, extra_data = [], awaken_type = 0,
	 camp_type = 0, power = 0, replay, hallows_looks = [],
	 sprites = [], guild_break_power = 0}).

-record(combat_buff,
	{id, bid, actor, group, end_round, buff_result_type,
	 positive_or_negative, buff_result = [], join_num,
	 can_reduce, lev, probability = 1000,
	 clean_when_dead = true, hit_count = 0, is_show = true,
	 wave = 1, group_pro = 0}).

-record(combat,
	{type = 0, attack_list = []  :: [#fight_object{}],
	 defend_list = []  :: [#fight_object{}],
	 combat_roles = []  :: [#combat_role{}],
	 formation = []  ::
	     [{pos_integer(), pos_integer(), pos_integer()}],
	 on_combat_begin, on_combat_end, on_role_combat_end,
	 state_end_time = 0, round_countdown = 0,
	 min_play_time = 0, take_action = {}, ext_args = [],
	 wave = 1, total_wave = undefined,
	 multi_wave_defend = [], combat_result,
	 is_pause = false  :: false | {true, integer()},
	 combat_map = 0, combat_drama, target_role_name = <<>>,
	 is_combat_end = {combat_util, is_combat_end, []},
	 end_time = 0, begin_time = 0, watching_roles = [],
	 is_skip = 0, round = 0, is_robot = 0,
	 select_buff_callback, terminate_func, attack_power = 0,
	 defend_power = 0, replay_info, other_arge = []}).

-record(partner_hurt,
	{master_id, id, bid, star, lev, camp_type, dps, cure,
	 ext_data = [], be_hurt = 0}).

-record(combat_result,
	{result  :: 1 | 2, dead_monster_num = 0, wave_num = 0,
	 dead_partner = [], replay_id = 0, a_stat_info = [],
	 b_stat_info = [], end_type = normal  :: normal | quit,
	 opponent_id = {0, <<>>}, total_hurt = 0,
	 action_count = 0, group_a_num = 0,
	 hurt_statistics_a = [], curt_statistics_a = [],
	 hurt_statistics = [], replay_info = [], combat_pid = 0,
	 a_halo_dizzy_num = 0, a_max_num_def = 0,
	 a_control_info = [], a_kill_info = [],
	 a_continue_hurt = [], a_revive_info = [],
	 a_dodge_count = 0, a_anti_kill_count = 0,
	 a_halo_kill_count = 0, a_fire_buff_num = 0,
	 hurt_statistics_b = [], curt_statistics_b = [],
	 b_halo_dizzy_num = 0, b_max_num_def = 0,
	 b_control_info = [], b_kill_info = [],
	 b_continue_hurt = [], b_revive_info = [],
	 b_dodge_count = 0, b_anti_kill_count = 0,
	 b_halo_kill_count = 0, b_fire_buff_num = 0,
	 is_balance = 0, a_sprite_kill_count = 0}).

-record(mon_ai,
	{bid, name, ai, is_loop, condition = [], rate,
	 skill_target = false, skill_id, talk_target = none,
	 talk_content = <<>>}).

-record(skill_play,
	{order, actor, target, skill_bid = 0, talk_pos = 0,
	 talk_content = <<>>, effect_play = []}).

-record(effect_play,
	{order, actor, target = 0, effect_bid = 0, is_hit = 1,
	 is_crit = 0, hp_changed = 0, hp = 0, buff_list = [],
	 summon_list = [], distance = -1, is_dead = 0,
	 sub_effect_play_list = [], is_blind = 0,
	 skill_bid_of_effect = 0, actor_hp_changed = 0,
	 actor_is_dead = 0, aid_actor = 0, total_hurt = 0,
	 hurt_reward = [], camp_restrain = 0}).

-record(sub_effect_play,
	{sub_target = 0, sub_effect_id = 0, sub_hp_changed = 0,
	 sub_distance = -1, sub_is_hit = 1, sub_skill_id = 0,
	 extra_effect = []}).

-record(buff_play,
	{target = 0, buff_bid = 0, end_round = 0,
	 remain_round = 0, action_type = 0, change_type = 0,
	 change_value = 0, is_dead = 0, id = 0, id2 = 0}).

-record(fight_object_p,
	{pos = 0, group = 0, owner_id = 0, owner_srv_id = <<>>,
	 object_type = 0, object_id = 0, object_bid = 0,
	 is_awake = 0, star = 0, object_name = <<>>, sex = 0,
	 career = 0, lev = 0, hp = 0, hp_max = 0, face_id = 0,
	 round = 0, skills = [], is_strong_partner = 0,
	 extra_data = [], camp_type = 0, sprites = []}).

-record(skill_p, {skill_bid = 0, end_round = 0}).

-record(combat_order_p,
	{pos = 0, distance = 0, group = 0}).

-record(exp_reward_p,
	{object_type, object_id = 0, srv_id = <<>>, career = 0,
	 sex = 0, old_lev, old_exp, new_lev, new_exp, is_die = 0,
	 assets_reward}).

-record(assets_reward_p, {type, val}).

-record(item_reward_p, {bid, is_bind, num}).

-record(combat_drama,
	{id, next, timeout = infinity, ts, winner,
	 play_list = []  :: [pos_integer()],
	 combat_list = []  :: [tuple()],
	 guide_list = []  :: [pos_integer()]}).

-file("src/mod/role/role.erl", 35).

start(Rid, SrvId, Account, Link, Args) ->
    LocalName = list_to_atom(lists:concat(["role_",
					   bitstring_to_list(Account), "_", Rid,
					   "_", bitstring_to_list(SrvId)])),
    gen_server:start({local, LocalName}, role,
		     [Rid, SrvId, Account, Link, Args], []).

stop(sync, RolePid, Msg) ->
    gen_server:call(RolePid, {stop, normal, Msg});
stop(async, RolePid, Msg) ->
    stop(async, RolePid, normal, Msg).

stop(sync, RolePid, Reason, Msg) ->
    gen_server:call(RolePid, {stop, Reason, Msg});
stop(async, RolePid, Reason, Msg) ->
    RolePid ! {stop, Reason, Msg}.

rpc(RolePid, Mod, Cmd, Data) ->
    rpc(RolePid, Mod, Cmd, Data, false).

rpc(RolePid, Mod, Cmd, Data, IsScript) ->
    RolePid ! {rpc, Mod, Cmd, Data, IsScript}.

redirect(#role{pid = RolePid}, Cmd, Data) ->
    redirect(RolePid, Cmd, Data), ok;
redirect(RolePid, Cmd, Data) when is_pid(RolePid) ->
    case mapping:module(game_server, Cmd) of
      {ok, _Group, object, _Proto, Mod} ->
	  RolePid ! {redirect, Mod, Cmd, Data};
      _ -> ignore
    end;
redirect(Id = {_Rid, _SrvId}, Cmd, Data) ->
    case role_query:pid(by_id, Id) of
      {ok, RolePid} -> redirect(RolePid, Cmd, Data);
      _ -> ignore
    end;
redirect(_Unknow, _Cmd, _Data) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole101, _, {__Levelrole101, __Tracesrole101}}
	  when __Levelrole101 band 8 /= 0 orelse
		 __Tracesrole101 /= [] ->
	  lager:do_log(error,
		       [{module, role}, {function, redirect}, {line, 101},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("命令重定向接口参数错误:~w", [_Unknow]), none, 4096,
		       8, __Levelrole101, __Tracesrole101, lager_event,
		       __Pidrole101);
      _ -> ok
    end,
    ignore.

apply(_, RolePid, _Mfa) when not is_pid(RolePid) ->
    {error, not_pid};
apply(async, RolePid, {F}) ->
    RolePid ! {apply_async, {F}};
apply(async, RolePid, {F, A}) ->
    RolePid ! {apply_async, {F, A}};
apply(async, RolePid, {M, F, A}) ->
    RolePid ! {apply_async, {M, F, A}};
apply(async, RolePid, {Min, Max, M, F, A}) ->
    RolePid ! {apply_async, {Min, Max, M, F, A}};
apply(sync, RolePid, Mfa) when self() =:= RolePid ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole128, _, {__Levelrole128, __Tracesrole128}}
	  when __Levelrole128 band 8 /= 0 orelse
		 __Tracesrole128 /= [] ->
	  lager:do_log(error,
		       [{module, role}, {function, apply}, {line, 128},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("执行apply时发生错误：调用了自身[~w, ~w]",
				     [RolePid, Mfa]),
		       none, 4096, 8, __Levelrole128, __Tracesrole128,
		       lager_event, __Pidrole128);
      _ -> ok
    end,
    {error, self_call};
apply(sync, RolePid, {F}) ->
    gen_server:call(RolePid, {apply_sync, {F}});
apply(sync, RolePid, {F, A}) ->
    gen_server:call(RolePid, {apply_sync, {F, A}});
apply(sync, RolePid, {M, F, A}) ->
    gen_server:call(RolePid, {apply_sync, {M, F, A}}).

get_dict(Key) ->
    case get('@is_role_process') of
      true -> {ok, get(Key)};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole146, _, {__Levelrole146, __Tracesrole146}}
		when __Levelrole146 band 8 /= 0 orelse
		       __Tracesrole146 /= [] ->
		lager:do_log(error,
			     [{module, role}, {function, get_dict}, {line, 146},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "当前进程不是一个角色进程，不能使用get_dict/1", none, 4096, 8,
			     __Levelrole146, __Tracesrole146, lager_event,
			     __Pidrole146);
	    _ -> ok
	  end,
	  {error, not_a_role_process}
    end.

get_dict_int(Key) ->
    case get_dict(Key) of
      {ok, Val} when is_integer(Val) -> Val;
      _ -> 0
    end.

get_dict_role_info(role_id) -> get_dict('@role_id');
get_dict_role_info(role_account) ->
    get_dict('@role_account');
get_dict_role_info(Unknow) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole162, _, {__Levelrole162, __Tracesrole162}}
	  when __Levelrole162 band 8 /= 0 orelse
		 __Tracesrole162 /= [] ->
	  lager:do_log(error,
		       [{module, role}, {function, get_dict_role_info},
			{line, 162}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未处理的标签信息:~w", [Unknow]), none, 4096, 8,
		       __Levelrole162, __Tracesrole162, lager_event,
		       __Pidrole162);
      _ -> ok
    end,
    undefined.

get_dict(RolePid, _Key) when self() =:= RolePid ->
    {error, self_call};
get_dict(RolePid, Key) ->
    gen_server:call(RolePid, {get_dict, Key}).

put_dict(Key, Val) ->
    case get('@is_role_process') of
      true -> {ok, put(Key, Val)};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole185, _, {__Levelrole185, __Tracesrole185}}
		when __Levelrole185 band 8 /= 0 orelse
		       __Tracesrole185 /= [] ->
		lager:do_log(error,
			     [{module, role}, {function, put_dict}, {line, 185},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("当前进程不是一个角色进程，不用使用put_dict/2 Key:~w",
					   [Key]),
			     none, 4096, 8, __Levelrole185, __Tracesrole185,
			     lager_event, __Pidrole185);
	    _ -> ok
	  end,
	  {error, not_a_role_process}
    end.

put_dict(RolePid, _Key, _Val) when self() =:= RolePid ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole196, _, {__Levelrole196, __Tracesrole196}}
	  when __Levelrole196 band 8 /= 0 orelse
		 __Tracesrole196 /= [] ->
	  lager:do_log(error,
		       [{module, role}, {function, put_dict}, {line, 196},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "进行put_dict/3操作时调用了自身", none, 4096, 8, __Levelrole196,
		       __Tracesrole196, lager_event, __Pidrole196);
      _ -> ok
    end,
    {error, self_call};
put_dict(RolePid, Key, Val) ->
    gen_server:call(RolePid, {put_dict, Key, Val}).

erase_dict(Key) ->
    case get('@is_role_process') of
      true -> {ok, erase(Key)};
      _ -> {error, not_a_role_process}
    end.

erase_dict(RolePid, _Key) when self() =:= RolePid ->
    {error, self_call};
erase_dict(RolePid, Key) ->
    gen_server:call(RolePid, {erase_dict, Key}).

convert(RoleId, Type) when is_tuple(RoleId) ->
    case role_query:pid(by_id, RoleId) of
      {ok, Pid} -> convert(Pid, Type);
      Err -> Err
    end;
convert(RolePid, _Type) when self() =:= RolePid ->
    {error, self_call};
convert(RolePid, Type) ->
    gen_server:call(RolePid, {convert, Type}).

convert(RolePid, _Type, _Timeout)
    when self() =:= RolePid ->
    {error, self_call};
convert(RolePid, Type, Timeout) ->
    gen_server:call(RolePid, {convert, Type}, Timeout).

element(RolePid, _ElemPos) when self() =:= RolePid ->
    {error, self_call};
element(RolePid, ElemPos) when is_integer(ElemPos) ->
    [E] = gen_server:call(RolePid, {element, [ElemPos]}),
    {ok, E};
element(RolePid, ElemPos) when is_list(ElemPos) ->
    EL = gen_server:call(RolePid, {element, ElemPos}),
    {ok, EL}.

clean_all_dict_buff() ->
    send_buff_clean_all(),
    log:buff_clean_all(),
    fun_call:trans_clean_all(),
    ok.

-spec send_buff_begin() -> ok.

send_buff_begin() ->
    case get('@is_role_process') of
      true ->
	  case get(evt_transaction) of
	    undefined -> put(evt_transaction, []);
	    _ -> ok
	  end,
	  put(send_buff, [[] | get(send_buff)]);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole281, _, {__Levelrole281, __Tracesrole281}}
		when __Levelrole281 band 8 /= 0 orelse
		       __Tracesrole281 /= [] ->
		lager:do_log(error,
			     [{module, role}, {function, send_buff_begin},
			      {line, 281}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "不能在非角色进程内使用发送缓冲区", none, 4096, 8, __Levelrole281,
			     __Tracesrole281, lager_event, __Pidrole281);
	    _ -> ok
	  end,
	  ignore
    end,
    fun_call:trans_begin(),
    ok.

-spec send_buff_flush() -> ok.

send_buff_flush() ->
    case get(send_buff) of
      [] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole291, _, {__Levelrole291, __Tracesrole291}}
		when __Levelrole291 band 8 /= 0 orelse
		       __Tracesrole291 /= [] ->
		lager:do_log(error,
			     [{module, role}, {function, send_buff_flush},
			      {line, 291}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "发送缓冲区数据时发生异常:缓冲区为空", none, 4096, 8,
			     __Levelrole291, __Tracesrole291, lager_event,
			     __Pidrole291);
	    _ -> ok
	  end;
      [[]] -> put(send_buff, []);
      [H] ->
	  get('@conn_pid') ! {send_data, lists:reverse(H)},
	  put(send_buff, []);
      [H, H1 | T] ->
	  put(send_buff, [[lists:reverse(H) | H1] | T]);
      [H | T] -> put(send_buff, [[lists:reverse(H) | T]])
    end,
    fun_call:trans_flush(),
    ok.

send_buff_clean_all() ->
    erase(evt_transaction),
    case put(send_buff, []) of
      L = [_ | _] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole310, _, {__Levelrole310, __Tracesrole310}}
		when __Levelrole310 band 8 /= 0 orelse
		       __Tracesrole310 /= [] ->
		lager:do_log(error,
			     [{module, role}, {function, send_buff_clean_all},
			      {line, 310}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("缓冲包未被清除~w", [L]), none, 4096, 8,
			     __Levelrole310, __Tracesrole310, lager_event,
			     __Pidrole310);
	    _ -> ok
	  end;
      _ -> ok
    end.

-spec send_buff_clean() -> ok.

send_buff_clean() ->
    case get(send_buff) of
      [] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole318, _, {__Levelrole318, __Tracesrole318}}
		when __Levelrole318 band 8 /= 0 orelse
		       __Tracesrole318 /= [] ->
		lager:do_log(error,
			     [{module, role}, {function, send_buff_clean},
			      {line, 318}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "清空缓冲区数据时发生异常:缓冲区为空", none, 4096, 8,
			     __Levelrole318, __Tracesrole318, lager_event,
			     __Pidrole318);
	    _ -> ok
	  end;
      [_H] -> put(send_buff, []);
      [_H | T] -> put(send_buff, T)
    end,
    erase(evt_transaction),
    fun_call:trans_clean(),
    ok.

pack_send(Cmd, Data) ->
    Bin = proto_lib:pack(Cmd, Data),
    sys_conn:send(get('@conn_pid'), Bin).

pack_send(Id = {Rid, _SrvId}, Cmd, Data)
    when is_integer(Rid) ->
    case role_query:conn_pid(by_id, Id) of
      {ok, ConnPid} -> pack_send(ConnPid, Cmd, Data);
      _ -> ignore
    end;
pack_send(ConnPid, Cmd, Data) when is_pid(ConnPid) ->
    Bin = proto_lib:pack(Cmd, Data),
    sys_conn:send(ConnPid, Bin);
pack_send({role_pid, RolePid}, Cmd, Data) ->
    pack_send(proxy, RolePid, Cmd, Data);
pack_send(#role{link = #link{conn_pid = ConnPid}}, Cmd,
	  Data) ->
    pack_send(ConnPid, Cmd, Data);
pack_send(#link{conn_pid = ConnPid}, Cmd, Data) ->
    pack_send(ConnPid, Cmd, Data);
pack_send(_, _Cmd, _Data) -> ok.

pack_send(proxy, RolePid, Cmd, Data) ->
    RolePid ! {socket_proxy, proto_lib:pack(Cmd, Data)}.

send({role_pid, RolePid}, Bin) ->
    RolePid ! {socket_proxy, Bin};
send(Id = {_Rid, _SrvId}, Bin) ->
    case role_query:conn_pid(by_id, Id) of
      {ok, ConnPid} -> role:send(ConnPid, Bin);
      _ -> ignore
    end;
send(#role{link = #link{conn_pid = ConnPid}}, Bin) ->
    sys_conn:send(ConnPid, Bin);
send(ConnPid, Bin) when is_pid(ConnPid) ->
    sys_conn:send(ConnPid, Bin).

send(Bin) ->
    case get('@conn_pid') of
      ConnPid when is_pid(ConnPid) ->
	  sys_conn:send(ConnPid, Bin);
      _ -> pass
    end.

proxy_send(RolePid, Bin) when is_pid(RolePid) ->
    RolePid ! {socket_proxy, Bin}.

set_ms_timer(Name, Timeout, {Fun})
    when is_function(Fun) ->
    util:set_ms_timer(Name, Timeout, {apply_async, {Fun}}),
    ok;
set_ms_timer(Name, Timeout, {Fun, A})
    when is_function(Fun) ->
    util:set_ms_timer(Name, Timeout,
		      {apply_async, {Fun, A}}),
    ok;
set_ms_timer(Name, Timeout, {M, F, A}) ->
    util:set_ms_timer(Name, Timeout,
		      {apply_async, {M, F, A}}),
    ok;
set_ms_timer(Name, Timeout, {info, Mod, Event, Arg}) ->
    util:set_ms_timer(Name, Timeout,
		      {reply, Mod, Event, Arg}),
    ok.

set_loop_ms_timer(Name, Timeout, Count, Mix)
    when is_integer(Count) ->
    util:set_ms_timer(Name, Timeout,
		      {loop_timer, {Name, Timeout, Count}, Mix}),
    ok.

unset_timer(Name) -> util:unset_timer(Name), ok.

unset_timers(Names) -> util:unset_timers(Names), ok.

init([Rid, SrvId, Account,
      Link = #link{conn_pid = ConnPid}, Args]) ->
    Id = {Rid, SrvId},
    Now = date:unixtime(),
    Channel = list_util:keyfind(channel, Args, <<>>),
    case catch role_data:local_fetch(by_id, Id) of
      {ok, _Flag,
       #role{account = Acc, name = Name,
	     interdict_time = InterdictTime}}
	  when Acc =:= Account, InterdictTime > Now,
	       Channel =/= <<"release2">>, Channel =/= <<"demo">> ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole451, _, {__Levelrole451, __Tracesrole451}}
		when __Levelrole451 band 64 /= 0 orelse
		       __Tracesrole451 /= [] ->
		lager:do_log(info,
			     [{module, role}, {function, init}, {line, 451},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~ts ~w,~s,~ts 角色被封号===~w",
					   [Acc, Rid, SrvId, Name,
					    InterdictTime]),
			     none, 4096, 64, __Levelrole451, __Tracesrole451,
			     lager_event, __Pidrole451);
	    _ -> ok
	  end,
	  {stop, interdict};
      {ok, _Flag, #role{data_lock = LockTs}}
	  when LockTs > Now ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole454, _, {__Levelrole454, __Tracesrole454}}
		when __Levelrole454 band 64 /= 0 orelse
		       __Tracesrole454 /= [] ->
		lager:do_log(info,
			     [{module, role}, {function, init}, {line, 454},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("玩家数据被锁定!Rid ~w, SrvId ~w, Account ~w",
					   [Rid, SrvId, Account]),
			     none, 4096, 64, __Levelrole454, __Tracesrole454,
			     lager_event, __Pidrole454);
	    _ -> ok
	  end,
	  {stop, {data_lock, LockTs - Now}};
      {ok, _Flag,
       Role = #role{account = Acc, name = Name, login = Login,
		    power = Power, max_power = MaxPower, lev = Lev,
		    arena_power = ArenaPower, reg_time = RegTime,
		    arena_max_power = ArenaMaxPower}}
	  when Acc =:= Account ->
	  process_flag(trap_exit, true),
	  erlang:group_leader(sys_env:get(group_leader), self()),
	  put(sync_times, 0),
	  IDFA = list_util:keyfind(idfa, Args, <<>>),
	  put('@is_role_process', true),
	  put('@role_id', Id),
	  put(role_name, Name),
	  put('@role_account', Account),
	  put('@conn_pid', ConnPid),
	  put(last_power_save,
	      {Lev, Power, MaxPower, ArenaPower, ArenaMaxPower}),
	  put(send_buff, []),
	  put('@idfa', IDFA),
	  put('@timer_idx', 1),
	  put(province_name,
	      list_util:keyfind(province_name, Args, <<>>)),
	  put(city_name,
	      list_util:keyfind(city_name, Args, <<>>)),
	  NRole = login_rpc:update_login_args(Role#role{pid =
							    self(),
							is_online = 1,
							link = Link,
							loop_counter = 0,
							need_sync = 0,
							is_ready = 0,
							login =
							    Login#login{log_login_time
									    =
									    Now,
									login_time
									    =
									    Now},
							misc =
							    #role_misc{reg_zero_time
									   =
									   date:unixtime({zero,
											  RegTime}),
								       self_charge
									   =
									   adm_mgr:self_charge_status(Account)}},
					      Args, false),
	  erlang:link(ConnPid),
	  true = role_monitor:check_role(NRole),
	  role_num_online:inc_channel_online(NRole#role.channel),
	  put(save_db_time, Now + util:rand(3000, 4000)),
	  case date:unixtime() - Now of
	    UseTime when UseTime > 5 ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrole479, _, {__Levelrole479, __Tracesrole479}}
		      when __Levelrole479 band 8 /= 0 orelse
			     __Tracesrole479 /= [] ->
		      lager:do_log(error,
				   [{module, role}, {function, init},
				    {line, 479}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("角色加载用时太长:~w", [UseTime]),
				   none, 4096, 8, __Levelrole479,
				   __Tracesrole479, lager_event, __Pidrole479);
		  _ -> ok
		end;
	    _ -> skip
	  end,
	  self() ! init,
	  {ok, NRole};
      {ok, _Flag, Role} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole485, _, {__Levelrole485, __Tracesrole485}}
		when __Levelrole485 band 8 /= 0 orelse
		       __Tracesrole485 /= [] ->
		lager:do_log(error,
			     [{module, role}, {function, init}, {line, 485},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("玩家登录帐号异常Self Account:~s[~w] Target Account:~s"
					   "[~w]",
					   [Account, Account, Role#role.account,
					    Role#role.account]),
			     none, 4096, 8, __Levelrole485, __Tracesrole485,
			     lager_event, __Pidrole485);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"加载角色失败"/utf8>>,
				    util:fbin(<<"角色[~w:~s:~ts]加载失败，需马上上线查看处理"/utf8>>,
					      [Rid, SrvId, Account]),
				    role, 486, util:get_stacktrace()}),
	  {stop, bad_account};
      {error, Why} when is_binary(Why) ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole489, _, {__Levelrole489, __Tracesrole489}}
		when __Levelrole489 band 8 /= 0 orelse
		       __Tracesrole489 /= [] ->
		lager:do_log(error,
			     [{module, role}, {function, init}, {line, 489},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("加载角色数据[~w:~s:~s]时发生异常: ~s",
					   [Rid, SrvId, Account, Why]),
			     none, 4096, 8, __Levelrole489, __Tracesrole489,
			     lager_event, __Pidrole489);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"加载角色失败"/utf8>>,
				    util:fbin(<<"角色[~w:~s:~ts]加载失败，需马上上线查看处理"/utf8>>,
					      [Rid, SrvId, Account]),
				    role, 490, util:get_stacktrace()}),
	  {stop, load_failure};
      {error, Why} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole493, _, {__Levelrole493, __Tracesrole493}}
		when __Levelrole493 band 8 /= 0 orelse
		       __Tracesrole493 /= [] ->
		lager:do_log(error,
			     [{module, role}, {function, init}, {line, 493},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("加载角色数据[~w:~s:~s]时发生异常: ~w",
					   [Rid, SrvId, Account, Why]),
			     none, 4096, 8, __Levelrole493, __Tracesrole493,
			     lager_event, __Pidrole493);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"加载角色失败"/utf8>>,
				    util:fbin(<<"角色[~w:~s:~ts]加载失败，需马上上线查看处理"/utf8>>,
					      [Rid, SrvId, Account]),
				    role, 494, util:get_stacktrace()}),
	  {stop, load_failure};
      {'EXIT', Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole497, _, {__Levelrole497, __Tracesrole497}}
		when __Levelrole497 band 8 /= 0 orelse
		       __Tracesrole497 /= [] ->
		lager:do_log(error,
			     [{module, role}, {function, init}, {line, 497},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("加载角色数据[~w:~s:~s]时发生异常: ~w",
					   [Rid, SrvId, Account, Reason]),
			     none, 4096, 8, __Levelrole497, __Tracesrole497,
			     lager_event, __Pidrole497);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"加载角色失败"/utf8>>,
				    util:fbin(<<"角色[~w:~s:~ts]加载失败，需马上上线查看处理"/utf8>>,
					      [Rid, SrvId, Account]),
				    role, 498, util:get_stacktrace()}),
	  {stop, load_failure}
    end.

handle_call({apply_sync, {F}}, _From, Role) ->
    handle_apply_sync_return(catch erlang:apply(F, [Role]),
			     {undefined, F, []}, Role);
handle_call({apply_sync, {F, A}}, _From, Role) ->
    handle_apply_sync_return(catch erlang:apply(F,
						[Role | A]),
			     {undefined, F, A}, Role);
handle_call({apply_sync, {M, F, A}}, _From, Role) ->
    handle_apply_sync_return(catch erlang:apply(M, F,
						[Role | A]),
			     {M, F, A}, Role);
handle_call({get_dict, Key}, _From, Role) ->
    {reply, {ok, get(Key)}, Role};
handle_call({put_dict, Key, Val}, _From, Role) ->
    {reply, {ok, put(Key, Val)}, Role};
handle_call({erase_dict, Key}, _From, Role) ->
    {reply, {ok, erase(Key)}, Role};
handle_call({convert, to_role}, _From, Role) ->
    {reply, {ok, Role}, Role};
handle_call({convert, KeyPosList}, _From, Role)
    when is_list(KeyPosList) ->
    {reply,
     {ok,
      [erlang:element(KeyPos, Role) || KeyPos <- KeyPosList]},
     Role};
handle_call({convert, Type}, _From, Role) ->
    {reply, role_convert:do(Type, Role), Role};
handle_call({element, Pos}, _From, Role)
    when is_list(Pos) ->
    {reply,
     lists:reverse(do_element(Pos, Role, tuple_size(Role),
			      [])),
     Role};
handle_call({stop, Reason, Msg}, _From, Role) ->
    {stop, Reason, ok, do_stop(Role, Reason, Msg)};
handle_call(_Request, _From, Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole535, _, {__Levelrole535, __Tracesrole535}}
	  when __Levelrole535 band 64 /= 0 orelse
		 __Tracesrole535 /= [] ->
	  lager:do_log(info,
		       [{module, role}, {function, handle_call}, {line, 535},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("role handle_call _Request:~w",
				     [_Request]),
		       none, 4096, 64, __Levelrole535, __Tracesrole535,
		       lager_event, __Pidrole535);
      _ -> ok
    end,
    {noreply, Role}.

handle_cast(_Msg, Role) -> {noreply, Role}.

handle_info(init, Role) ->
    role_query:sync_index(Role),
    send_buff_begin(),
    Now = date:unixtime(),
    case role_login:do(Role) of
      {error, Msg} ->
	  server_monitor:error(2),
	  send_buff_clean(),
	  catch pack_send(10310, {1, Msg}),
	  {stop, normal, Role};
      {ok, NewRole} ->
	  erase(partner_attr_update),
	  send_buff_clean(),
	  true = role_monitor:check_role(NewRole),
	  role_data:set_online(NewRole#role.id),
	  role_group:join(all, NewRole),
	  role_query:sync_cache(NewRole),
	  role_query:sync_index(NewRole),
	  role_data:sync_reg(NewRole),
	  log:save(login, {NewRole}),
	  put(already_login, true),
	  case date:unixtime() - Now of
	    UseTime when UseTime > 5 ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrole566, _, {__Levelrole566, __Tracesrole566}}
		      when __Levelrole566 band 8 /= 0 orelse
			     __Tracesrole566 /= [] ->
		      lager:do_log(error,
				   [{module, role}, {function, handle_info},
				    {line, 566}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("角色login用时太长:~w", [UseTime]),
				   none, 4096, 8, __Levelrole566,
				   __Tracesrole566, lager_event, __Pidrole566);
		  _ -> ok
		end;
	    _ -> skip
	  end,
	  self() ! loop,
	  {noreply, NewRole}
    end;
handle_info(loop,
	    Role = #role{name = Name, loop_counter = C,
			 need_sync = Sync, lev = Lev}) ->
    case C rem 9 of
      0 -> sys_gc:gc(self()), clean_all_dict_buff();
      6 -> role_data:update_power(Role);
      _ -> skip
    end,
    S = case C rem 2 == 0 andalso
	       Sync == 1 andalso Lev >= 10
	    of
	  false -> Sync;
	  true ->
	      Now = date:unixtime(),
	      case Now > util:get(save_db_time, 0) of
		true ->
		    case time() of
		      {0, _, _} ->
			  put(save_db_time, Now + util:rand(60, 800)),
			  role_data:local_save(cache, Role);
		      _ ->
			  role_data:local_save(to_db, Role),
			  put(save_db_time, Now + util:rand(3000, 4000))
		    end;
		_ -> role_data:local_save(cache, Role)
	      end,
	      0
	end,
    case C rem 6 =:= 0 of
      false -> ignore;
      true ->
	  ConnPid = get('@conn_pid'),
	  case process_info(ConnPid, message_queue_len) of
	    {_, QueueLen} when QueueLen > 1500 ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrole610, _, {__Levelrole610, __Tracesrole610}}
		      when __Levelrole610 band 8 /= 0 orelse
			     __Tracesrole610 /= [] ->
		      lager:do_log(error,
				   [{module, role}, {function, handle_info},
				    {line, 610}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("角色[~ts]连接进程堆积消息过多，断开连接",
						 [Name]),
				   none, 4096, 8, __Levelrole610,
				   __Tracesrole610, lager_event, __Pidrole610);
		  _ -> ok
		end,
		erlang:exit(ConnPid, kill);
	    _ -> ignore
	  end
    end,
    check_combat_replay(C),
    erlang:send_after(20000, self(), loop),
    {noreply,
     Role#role{need_sync = S, loop_counter = C + 1}};
handle_info({apply_async, {F}}, Role) ->
    handle_apply_async_return(catch erlang:apply(F, [Role]),
			      {undefined, F, []}, Role);
handle_info({apply_async, {F, A}}, Role) ->
    handle_apply_async_return(catch erlang:apply(F,
						 [Role | A]),
			      {undefined, F, A}, Role);
handle_info({apply_async, {M, F, A}}, Role) ->
    handle_apply_async_return(catch erlang:apply(M, F,
						 [Role | A]),
			      {M, F, A}, Role);
handle_info({apply_async, {MinT, MaxT, M, F, A}}, Role)
    when MaxT >= MinT ->
    erlang:send_after(util:rand(MinT, MaxT), self(),
		      {apply_async, {M, F, A}}),
    {noreply, Role};
handle_info({rpc, Mod, Cmd, Data, IsScript},
	    Role = #role{id = {Rid, SrvId}, name = Name,
			 link = #link{conn_pid = ConnPid}}) ->
    case catch Mod:handle(Cmd, Data, Role) of
      ok -> read_next(ConnPid, Role);
      {ok} -> read_next(ConnPid, Role);
      {ok, NewRole} when is_record(NewRole, role) ->
	  rpc_monitor:rpc_do_check(IsScript, Cmd, Data, NewRole),
	  read_next(ConnPid,
		    role_monitor:check(Mod, Cmd, Data, 639, NewRole, Role));
      {reply, Reply} ->
	  sys_conn:pack_send(ConnPid, Cmd, Reply),
	  read_next(ConnPid, Role);
      {reply, Reply, NewRole} when is_record(NewRole, role) ->
	  sys_conn:pack_send(ConnPid, Cmd, Reply),
	  rpc_monitor:rpc_do_check(IsScript, Cmd, Data, NewRole),
	  read_next(ConnPid,
		    role_monitor:check(Mod, Cmd, Data, 646, NewRole, Role));
      {sync, NewRole} when is_record(NewRole, role) ->
	  role_query:sync_cache(NewRole),
	  rpc_monitor:rpc_do_check(IsScript, Cmd, Data, NewRole),
	  read_next(ConnPid,
		    role_monitor:check(Mod, Cmd, Data, 650,
				       NewRole#role{need_sync = 1}, Role));
      {sync, Reply, NewRole} when is_record(NewRole, role) ->
	  sys_conn:pack_send(ConnPid, Cmd, Reply),
	  role_query:sync_cache(NewRole),
	  rpc_monitor:rpc_do_check(IsScript, Cmd, Data, NewRole),
	  read_next(ConnPid,
		    role_monitor:check(Mod, Cmd, Data, 655,
				       NewRole#role{need_sync = 1}, Role));
      {error, unknow_command} -> read_next(ConnPid, Role);
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole659, _, {__Levelrole659, __Tracesrole659}}
		when __Levelrole659 band 8 /= 0 orelse
		       __Tracesrole659 /= [] ->
		lager:do_log(error,
			     [{module, role}, {function, handle_info},
			      {line, 659}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("id: {~w, ~s} [~ts]的角色进程处理命令时出错[Mod:~w "
					   "Cmd:~w Data:~w] Reason:~w ",
					   [Rid, SrvId, Name, Mod, Cmd, Data,
					    _Reason]),
			     none, 4096, 8, __Levelrole659, __Tracesrole659,
			     lager_event, __Pidrole659);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"角色处理协议异常"/utf8>>,
				    util:fbin(<<"协议处理异常:~w,~w"/utf8>>,
					      [Mod, Cmd]),
				    role, 660, util:get_stacktrace()}),
	  clean_all_dict_buff(),
	  read_next(ConnPid, Role)
    end;
handle_info({redirect, Mod, Cmd, Data},
	    Role = #role{name = Name,
			 link = #link{conn_pid = ConnPid}}) ->
    case catch Mod:handle(Cmd, Data, Role) of
      ok -> {noreply, Role};
      {ok} -> {noreply, Role};
      {ok, NewRole} when is_record(NewRole, role) ->
	  {noreply,
	   role_monitor:check(Mod, Cmd, Data, 672, NewRole, Role)};
      {reply, Reply} ->
	  sys_conn:pack_send(ConnPid, Cmd, Reply),
	  {noreply, Role};
      {reply, Reply, NewRole} when is_record(NewRole, role) ->
	  sys_conn:pack_send(ConnPid, Cmd, Reply),
	  {noreply,
	   role_monitor:check(Mod, Cmd, Data, 678, NewRole, Role)};
      {sync, NewRole} when is_record(NewRole, role) ->
	  role_query:sync_cache(NewRole),
	  {noreply,
	   role_monitor:check(Mod, Cmd, Data, 681,
			      NewRole#role{need_sync = 1}, Role)};
      {sync, Reply, NewRole} when is_record(NewRole, role) ->
	  sys_conn:pack_send(ConnPid, Cmd, Reply),
	  role_query:sync_cache(NewRole),
	  {noreply,
	   role_monitor:check(Mod, Cmd, Data, 685,
			      NewRole#role{need_sync = 1}, Role)};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole687, _, {__Levelrole687, __Tracesrole687}}
		when __Levelrole687 band 8 /= 0 orelse
		       __Tracesrole687 /= [] ->
		lager:do_log(error,
			     [{module, role}, {function, handle_info},
			      {line, 687}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]的角色进程处理命令时出错[Mod:~w Cmd:~w Data:~w] "
					   "Reason:~w ",
					   [Name, Mod, Cmd, Data, _Reason]),
			     none, 4096, 8, __Levelrole687, __Tracesrole687,
			     lager_event, __Pidrole687);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"角色处理协议异常"/utf8>>,
				    util:fbin(<<"协议处理异常:~w,~w"/utf8>>,
					      [Mod, Cmd]),
				    role, 688, util:get_stacktrace()}),
	  clean_all_dict_buff(),
	  {noreply, Role}
    end;
handle_info({loop_timer, TimerData, {F}}, Role) ->
    handle_loop_timer_return(catch erlang:apply(F, [Role]),
			     TimerData, {undefined, F, []}, Role);
handle_info({loop_timer, TimerData, {F, A}}, Role) ->
    handle_loop_timer_return(catch erlang:apply(F,
						[Role | A]),
			     TimerData, {undefined, F, A}, Role);
handle_info({loop_timer, TimerData, {M, F, A}}, Role) ->
    handle_loop_timer_return(catch erlang:apply(M, F,
						[Role | A]),
			     TimerData, {M, F, A}, Role);
handle_info({timer_tick, Key, _M},
	    Role = #role{timer =
			     #rtimer{key = Key, timers = [Timer | _]}}) ->
    NewRole = role_timer:tick(Role),
    NRole = role_monitor:check(timer, 0, {Timer}, 703,
			       NewRole, Role),
    {noreply, NRole};
handle_info({timer_tick, Key1, _M},
	    Role = #role{timer = #rtimer{key = Key}})
    when Key > Key1 ->
    {noreply, Role};
handle_info({timer_tick, _Key, _M},
	    Role = #role{name = _Name, timer = Timer}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole708, _, {__Levelrole708, __Tracesrole708}}
	  when __Levelrole708 band 8 /= 0 orelse
		 __Tracesrole708 /= [] ->
	  lager:do_log(error,
		       [{module, role}, {function, handle_info}, {line, 708},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]接收到非法定时器:~w, mod:~w, rtimer:~w "
				     "last_update_timer=~w",
				     [_Name, _Key, _M, Timer,
				      get(last_update_timer)]),
		       none, 4096, 8, __Levelrole708, __Tracesrole708,
		       lager_event, __Pidrole708);
      _ -> ok
    end,
    {noreply, role_timer:next(Role)};
handle_info({socket_proxy, Bin},
	    Role = #role{link = #link{conn_pid = ConnPid}}) ->
    sys_conn:send(ConnPid, Bin), {noreply, Role};
handle_info({'EXIT', Pid, Why},
	    Role = #role{name = Name,
			 link = #link{socket = Socket, conn_pid = ConnPid}})
    when Pid =:= ConnPid ->
    catch gen_tcp:close(Socket),
    self() ! disconnect,
    case Why of
      normal -> skip;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole722, _, {__Levelrole722, __Tracesrole722}}
		when __Levelrole722 band 64 /= 0 orelse
		       __Tracesrole722 /= [] ->
		lager:do_log(info,
			     [{module, role}, {function, handle_info},
			      {line, 722}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]的连接器进程[~w]退出，原因:~w",
					   [Name, Pid, Why]),
			     none, 4096, 64, __Levelrole722, __Tracesrole722,
			     lager_event, __Pidrole722);
	    _ -> ok
	  end
    end,
    {noreply, Role};
handle_info({'DOWN', _MonitorRef, process, Pid, Why},
	    Role = #role{name = Name,
			 link = #link{socket = Socket, conn_pid = ConnPid}})
    when Pid =:= ConnPid ->
    catch gen_tcp:close(Socket),
    self() ! disconnect,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole730, _, {__Levelrole730, __Tracesrole730}}
	  when __Levelrole730 band 8 /= 0 orelse
		 __Tracesrole730 /= [] ->
	  lager:do_log(error,
		       [{module, role}, {function, handle_info}, {line, 730},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]的连接器进程[~w]异常退出，原因:~w",
				     [Name, Pid, Why]),
		       none, 4096, 8, __Levelrole730, __Tracesrole730,
		       lager_event, __Pidrole730);
      _ -> ok
    end,
    {noreply, Role};
handle_info(back_disconnect,
	    Role = #role{link = #link{conn_pid = ConnPid}}) ->
    case is_pid(ConnPid) of
      true -> erlang:exit(ConnPid, normal);
      _ -> skip
    end,
    {noreply, Role};
handle_info(disconnect, Role = #role{lev = Lev}) ->
    Role2 = role_listener:disconnect(Role),
    DelayTime = case Lev < 20 of
		  true -> 60000 * 3;
		  _ -> 60000 * 3
		end,
    util:set_ms_timer(delay_stop, DelayTime,
		      {delay_stop, delay_stop,
		       lang:get(<<"角色进程延时关闭"/utf8>>)}),
    {noreply, Role2};
handle_info({delay_stop, Reason, Msg},
	    Role = #role{combat_type_list = CombatTypeList}) ->
    IsMultipleCombat = get(is_multiple_combat),
    NRole = role_logout:set_offline(Role),
    case [1
	  || {_, CPid} <- CombatTypeList,
	     util:is_process_alive(CPid)]
	of
      [_ | _] ->
	  util:set_ms_timer(delay_stop, 60000,
			    {delay_stop, Reason, Msg}),
	  {noreply, NRole};
      _ when IsMultipleCombat == 1 ->
	  put(is_multiple_combat, 0),
	  util:set_ms_timer(delay_stop, 600000,
			    {delay_stop, Reason, Msg}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole761, _, {__Levelrole761, __Tracesrole761}}
		when __Levelrole761 band 64 /= 0 orelse
		       __Tracesrole761 /= [] ->
		lager:do_log(info,
			     [{module, role}, {function, handle_info},
			      {line, 761}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色~ts在多战斗中，延时关闭进程",
					   [Role#role.name]),
			     none, 4096, 64, __Levelrole761, __Tracesrole761,
			     lager_event, __Pidrole761);
	    _ -> ok
	  end,
	  {noreply, NRole};
      _ -> {stop, normal, do_stop(Role, Reason, Msg)}
    end;
handle_info({stop, Reason, Msg}, Role) ->
    {stop, normal, do_stop(Role, Reason, Msg)};
handle_info(stop, Role) -> {stop, normal, Role};
handle_info(_Info, Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole775, _, {__Levelrole775, __Tracesrole775}}
	  when __Levelrole775 band 8 /= 0 orelse
		 __Tracesrole775 /= [] ->
	  lager:do_log(error,
		       [{module, role}, {function, handle_info}, {line, 775},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("异常的消息~w", [_Info]), none, 4096, 8,
		       __Levelrole775, __Tracesrole775, lager_event,
		       __Pidrole775);
      _ -> ok
    end,
    {noreply, Role}.

terminate(Reason, Role = #role{channel = Channel}) ->
    role_num_online:dec_channel_online(Channel),
    NewRole = case get('@already_handle_stop') of
		true -> Role;
		_ -> do_stop(Role, Reason, <<>>)
	      end,
    {ok, NRole1} = map:role_leave(NewRole),
    role_query:clean(NRole1),
    role_data:local_save(to_db, NRole1),
    ok.

code_change(_OldVsn, Role, _Extra) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole792, _, {__Levelrole792, __Tracesrole792}}
	  when __Levelrole792 band 128 /= 0 orelse
		 __Tracesrole792 /= [] ->
	  lager:do_log(debug,
		       [{module, role}, {function, code_change}, {line, 792},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("代码热更新[OldVsn:~w~n Role:~w~n Extra:~w]",
				     [_OldVsn, Role, _Extra]),
		       none, 4096, 128, __Levelrole792, __Tracesrole792,
		       lager_event, __Pidrole792);
      _ -> ok
    end,
    {ok, Role}.

do_stop(Role = #role{id = Id = {Rid, SrvId},
		     name = Name, link = #link{conn_pid = ConnPid}},
	Reason, Msg) ->
    role_group:leave(all, Role),
    say_subtitle:leave(Role),
    util:unset_all_timer(),
    put('@already_handle_stop', true),
    case is_binary(Msg) of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole805, _, {__Levelrole805, __Tracesrole805}}
		when __Levelrole805 band 64 /= 0 orelse
		       __Tracesrole805 /= [] ->
		lager:do_log(info,
			     [{module, role}, {function, do_stop}, {line, 805},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("角色~w,~s[~ts]退出了Reason:~w Msg:~ts",
					   [Rid, SrvId, Name, Reason, Msg]),
			     none, 4096, 64, __Levelrole805, __Tracesrole805,
			     lager_event, __Pidrole805);
	    _ -> ok
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
	    {__Pidrole806, _, {__Levelrole806, __Tracesrole806}}
		when __Levelrole806 band 8 /= 0 orelse
		       __Tracesrole806 /= [] ->
		lager:do_log(error,
			     [{module, role}, {function, do_stop}, {line, 806},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("角色~w,~s[~ts]的退出信息异常~w",
					   [Rid, SrvId, Name, Msg]),
			     none, 4096, 8, __Levelrole806, __Tracesrole806,
			     lager_event, __Pidrole806);
	    _ -> ok
	  end
    end,
    case Msg /= <<>> andalso Reason /= disconnect of
      false -> ignore;
      true -> catch pack_send(ConnPid, 10310, {1, Msg})
    end,
    role_data:set_offline(Id),
    case get(already_login) of
      true -> role_logout:do(Role);
      _ -> Role
    end.

do_element([], _Role, _MaxPos, L) -> L;
do_element([H | T], Role, MaxPos, L)
    when H > 0 andalso H =< MaxPos ->
    do_element(T, Role, MaxPos,
	       [erlang:element(H, Role) | L]);
do_element([H | T], Role, MaxPos, L) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole823, _, {__Levelrole823, __Tracesrole823}}
	  when __Levelrole823 band 8 /= 0 orelse
		 __Tracesrole823 /= [] ->
	  lager:do_log(error,
		       [{module, role}, {function, do_element}, {line, 823},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("传给role:element/2的参数不正确: ~w", [H]), none,
		       4096, 8, __Levelrole823, __Tracesrole823, lager_event,
		       __Pidrole823);
      _ -> ok
    end,
    do_element(T, Role, MaxPos, L).

read_next(ConnPid, Role) ->
    ConnPid ! read_next, {noreply, Role}.

handle_apply_async_return({ok, NewRole}, Mfa, Role)
    when is_record(NewRole, role) ->
    {noreply,
     role_monitor:check(async, 0, Mfa, 833, NewRole, Role)};
handle_apply_async_return({sync, NewRole}, Mfa, Role)
    when is_record(NewRole, role) ->
    role_query:sync_cache(NewRole),
    {noreply,
     role_monitor:check(async, 0, Mfa, 836,
			NewRole#role{need_sync = 1}, Role)};
handle_apply_async_return({ok}, _Mfa, Role) ->
    {noreply, Role};
handle_apply_async_return(ok, _Mfa, Role) ->
    {noreply, Role};
handle_apply_async_return(Else, {M, F, A}, Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole842, _, {__Levelrole842, __Tracesrole842}}
	  when __Levelrole842 band 8 /= 0 orelse
		 __Tracesrole842 /= [] ->
	  lager:do_log(error,
		       [{module, role}, {function, handle_apply_async_return},
			{line, 842}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]执行{~w, ~w, ~w}时得到错误的返回值格式:~w",
				     [Role#role.name, M, F, A, Else]),
		       none, 4096, 8, __Levelrole842, __Tracesrole842,
		       lager_event, __Pidrole842);
      _ -> ok
    end,
    server_monitor:error_log({2, <<"角色异步处理异常"/utf8>>,
			      util:fbin(<<"异步处理异常:~w,~w"/utf8>>, [M, F]), role,
			      843, util:get_stacktrace()}),
    clean_all_dict_buff(),
    {noreply, Role}.

handle_apply_sync_return({ok, Reply, NewRole}, Mfa,
			 Role)
    when is_record(NewRole, role) ->
    {reply, Reply,
     role_monitor:check(sync, 0, Mfa, 849, NewRole, Role)};
handle_apply_sync_return({sync, Reply, NewRole}, Mfa,
			 Role)
    when is_record(NewRole, role) ->
    role_query:sync_cache(NewRole),
    {reply, Reply,
     role_monitor:check(sync, 0, Mfa, 852,
			NewRole#role{need_sync = 1}, Role)};
handle_apply_sync_return({ok, Reply}, _Mfa, Role) ->
    {reply, Reply, Role};
handle_apply_sync_return(Else, {M, F, A}, Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole856, _, {__Levelrole856, __Tracesrole856}}
	  when __Levelrole856 band 8 /= 0 orelse
		 __Tracesrole856 /= [] ->
	  lager:do_log(error,
		       [{module, role}, {function, handle_apply_sync_return},
			{line, 856}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]同步执行{~w, ~w, ~w}时得到错误的返回值格式:~w",
				     [Role#role.name, M, F, A, Else]),
		       none, 4096, 8, __Levelrole856, __Tracesrole856,
		       lager_event, __Pidrole856);
      _ -> ok
    end,
    server_monitor:error_log({2, <<"角色同步处理异常"/utf8>>,
			      util:fbin(<<"同步处理异常:~w,~w"/utf8>>, [M, F]), role,
			      857, util:get_stacktrace()}),
    clean_all_dict_buff(),
    {reply, Else, Role}.

handle_loop_timer_return({cancel, NewRole},
			 {_Name, _Timeout, _Count}, MFA, Role)
    when is_record(NewRole, role) ->
    {noreply,
     role_monitor:check(loop_timer, 0, MFA, 863, NewRole,
			Role)};
handle_loop_timer_return({cancel},
			 {_Name, _Timeout, _Count}, _MFA, Role) ->
    {noreply, Role};
handle_loop_timer_return({ok, NewRole},
			 {Name, Timeout, Count}, MFA, Role)
    when is_record(NewRole, role) ->
    case Count of
      0 -> set_loop_ms_timer(Name, Timeout, Count, MFA);
      Tmp when Tmp > 1 ->
	  set_loop_ms_timer(Name, Timeout, Count - 1, MFA);
      _ -> ignore
    end,
    {noreply,
     role_monitor:check(loop_timer, 0, MFA, 872, NewRole,
			Role)};
handle_loop_timer_return({ok}, {Name, Timeout, Count},
			 MFA, Role) ->
    case Count of
      0 -> set_loop_ms_timer(Name, Timeout, Count, MFA);
      Tmp when Tmp > 1 ->
	  set_loop_ms_timer(Name, Timeout, Count - 1, MFA);
      _ -> ignore
    end,
    {noreply, Role};
handle_loop_timer_return(ok, {Name, Timeout, Count},
			 MFA, Role) ->
    handle_loop_timer_return({ok}, {Name, Timeout, Count},
			     MFA, Role);
handle_loop_timer_return(Else, _TimerData, {M, F, A},
			 Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole883, _, {__Levelrole883, __Tracesrole883}}
	  when __Levelrole883 band 8 /= 0 orelse
		 __Tracesrole883 /= [] ->
	  lager:do_log(error,
		       [{module, role}, {function, handle_loop_timer_return},
			{line, 883}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]执行{~w, ~w, ~w}时得到错误的返回值格式:~w",
				     [Role#role.name, M, F, A, Else]),
		       none, 4096, 8, __Levelrole883, __Tracesrole883,
		       lager_event, __Pidrole883);
      _ -> ok
    end,
    server_monitor:error_log({2, <<"角色定时处理异常"/utf8>>,
			      util:fbin(<<"定时处理异常:~w,~w"/utf8>>, [M, F]), role,
			      884, util:get_stacktrace()}),
    clean_all_dict_buff(),
    {noreply, Role}.

check_combat_replay(C) ->
    [do_check_combat_replay(I, C) || I <- [40]], ok.

do_check_combat_replay(CombatType, C) ->
    case get({last_combat_replay, CombatType}) of
      {ReplayId, C1} when C > C1 + 5 ->
	  erase({last_combat_replay, CombatType}),
	  erase({combat_replay, ReplayId});
      _ -> skip
    end.


