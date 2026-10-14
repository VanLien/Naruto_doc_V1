-file("src/mod/adventure/adventure_mine.erl", 1).

-module(adventure_mine).

-lager_records([{link,
		 [socket, conn_pid, ip, port, lag]},
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
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{combat_drama,
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
		{formation_attr_data,
		 [type, lev, expend, attr_1, attr_2, attr_3, attr_4,
		  attr_5, attr_6, attr_7, attr_8, attr_9, power]},
		{formation_data,
		 [type, pos, need_lev, name, need_items, restrain_s,
		  restrain_w]},
		{formation_info_p, [id, name, power, pos_info]},
		{pk_formation_info,
		 [id, name, formation, ffor_target, power, is_ready,
		  guild_name, lev, face_id, pid]},
		{formation_fight_info, [pos, fight_pos, id]},
		{formation_base_p,
		 [id, lev, exp, pos_info, formation_list, power,
		  hallows_id, all_lineups]},
		{formation_pos, [pos, id]},
		{formation_lineup,
		 [id, name, power, pos_info, max_power, type,
		  hallows_id]},
		{formation_sys, [id, type, pos_info, hallows_id]},
		{m_formation,
		 [ver, list, use_lineup, all_lineups, sys_formations]},
		{adventure_mine_owned_data, [id, pos]},
		{adventure_mine_owned, [id, list]},
		{adventure_mine_log,
		 [replay_id, floor, room_id, rid, name, lev, mine_id,
		  face, avatar_id, power, type, ret, loss, time, expire]},
		{adventure_mine_role_log, [id, logs]},
		{adventure_mine_group, [group_id, num, power, list]},
		{adventure_mine_role,
		 [id, max_power, login_time, group_id]},
		{adventure_mine_fight_lock,
		 [id, is_fight, fight_rid, fight_pid]},
		{adventure_mine_pos,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  set_skill, attr, ext]},
		{adventure_mine_hook,
		 [id, role_id, mine_id, plunder_count, last_hook_time,
		  acc_hook_items, acc_hook_time, occupy_time,
		  primary_count, senior_count, log]},
		{adventure_mine_group_hook, [group_id, list]},
		{adventure_mine_hole,
		 [room_id, mine_id, role_id, name, lev, face, last_fight,
		  occupy_time, defense, hallows_id, power, formation_type,
		  robot_id, cool_time, last_replay_id]},
		{adventure_mine_floor, [id, list]},
		{adventure_data, [id, room, name, lose]},
		{a_room,
		 [id, idx, evt_id, res_id, status, cond_status, lock,
		  init_evt_id, ext]},
		{m_adventure,
		 [ver, pass_id, pass_num, explore_num, id, room,
		  first_room, boss_room, room_list, buff_list, shop_list,
		  start_time, end_time, plist, is_kill_boss, init_time,
		  skill_list, bag_list, map_id, partner_id, skill_used,
		  round_reward, round_evt_group, kill_mon,
		  mine_combat_num, mine_round_combat, mine_round_reward,
		  current_id, mine_buy_count, init_id, laste_num]},
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

-export([ready/1, combat/4, combat_over/4, push_floor/3,
	 push_room/3, save_formation/6, push_round_reward/1,
	 get_round_reward/2, push_log/1, push_log/3, give_up/3,
	 push_my_owned/1, buy_miner/4, buy_count/1,
	 push_back_atk/2, mail_round_reward/1]).

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

-file("src/mod/adventure/adventure_mine.erl", 26).

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

-file("src/mod/adventure/adventure_mine.erl", 27).

-file("inc/adventure.hrl", 1).

-record(m_adventure,
	{ver = 10, pass_id = 0, pass_num = 0, explore_num = 0,
	 id = 0, room = 0, first_room = 0, boss_room = 0,
	 room_list = [], buff_list = [], shop_list = [],
	 start_time = 0, end_time = 0, plist = [],
	 is_kill_boss = 0, init_time = 0, skill_list = [],
	 bag_list = [], map_id = 0, partner_id = 0,
	 skill_used = [], round_reward = [],
	 round_evt_group = [], kill_mon = 0, mine_combat_num = 0,
	 mine_round_combat = 0, mine_round_reward = [],
	 current_id = 0, mine_buy_count = 0, init_id = 0,
	 laste_num = 999}).

-record(a_room,
	{id = 1, idx = 0, evt_id = 0, res_id = 0, status = 0,
	 cond_status = 0, lock = 0, init_evt_id = 0, ext = []}).

-record(adventure_data,
	{id = 0, room = 0, name = <<>>, lose = []}).

-file("src/mod/adventure/adventure_mine.erl", 28).

-file("inc/adventure_mine.hrl", 1).

-record(adventure_mine_floor, {id = {0, 0}, list = []}).

-record(adventure_mine_hole,
	{room_id = 0, mine_id = 0, role_id = {0, <<>>},
	 name = <<>>, lev = 0, face = 0, last_fight = {0, <<>>},
	 occupy_time = 0, defense = [], hallows_id = 0,
	 power = 0, formation_type = 1, robot_id = 0,
	 cool_time = 0, last_replay_id = 0}).

-record(adventure_mine_group_hook,
	{group_id = 0, list = []}).

-record(adventure_mine_hook,
	{id = {0, 0}, role_id = {0, <<>>}, mine_id = 0,
	 plunder_count = 0, last_hook_time = 0,
	 acc_hook_items = [], acc_hook_time = 0, occupy_time = 0,
	 primary_count = 0, senior_count = 0, log = []}).

-record(adventure_mine_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0, set_skill = [],
	 attr, ext = []}).

-record(adventure_mine_fight_lock,
	{id = {0, 0, 0}, is_fight = 0, fight_rid = {0, <<>>},
	 fight_pid = 0}).

-record(adventure_mine_role,
	{id = {0, <<>>}, max_power = 0, login_time = 0,
	 group_id = 0}).

-record(adventure_mine_group,
	{group_id = 0, num = 0, power = 0, list = []}).

-record(adventure_mine_role_log,
	{id = {0, <<>>}, logs = []}).

-record(adventure_mine_log,
	{replay_id = 0, floor = 0, room_id = 0, rid = {0, <<>>},
	 name = <<>>, lev = 0, mine_id = 0, face = 0,
	 avatar_id = 0, power = 0, type = 1, ret = 1, loss = [],
	 time = 0, expire = 0}).

-record(adventure_mine_owned,
	{id = {0, <<>>}, list = []}).

-record(adventure_mine_owned_data,
	{id = {0, 0}, pos = []}).

-file("src/mod/adventure/adventure_mine.erl", 29).

-file("inc/formation.hrl", 1).

-record(m_formation,
	{ver = 1, list = [], use_lineup = 1, all_lineups = [],
	 sys_formations = []}).

-record(formation_sys,
	{id = 1, type = 1, pos_info = [], hallows_id = 0}).

-record(formation_lineup,
	{id = 1, name = <<>>, power = 0, pos_info = [],
	 max_power = 0, type = 1, hallows_id = 0}).

-record(formation_pos, {pos, id = 0}).

-record(formation_base_p,
	{id, lev, exp, pos_info, formation_list, power,
	 hallows_id = 0, all_lineups}).

-record(formation_fight_info, {pos, fight_pos, id = 0}).

-record(pk_formation_info,
	{id, name, formation, ffor_target, power,
	 is_ready = false, guild_name = <<>>, lev = 0, face_id,
	 pid = none}).

-record(formation_info_p,
	{id = 0, name = <<>>, power = 0, pos_info = []}).

-record(formation_data,
	{type, pos, need_lev, name, need_items = [],
	 restrain_s = [], restrain_w = []}).

-record(formation_attr_data,
	{type, lev, expend = [], attr_1 = [], attr_2 = [],
	 attr_3 = [], attr_4 = [], attr_5 = [], attr_6 = [],
	 attr_7 = [], attr_8 = [], attr_9 = [], power}).

-file("src/mod/adventure/adventure_mine.erl", 30).

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

-file("src/mod/adventure/adventure_mine.erl", 31).

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

-file("src/mod/adventure/adventure_mine.erl", 32).

-file("inc/log.hrl", 1).

-file("src/mod/adventure/adventure_mine.erl", 33).

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

-file("src/mod/adventure/adventure_mine.erl", 34).

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

-file("src/mod/adventure/adventure_mine.erl", 35).

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

-file("src/mod/adventure/adventure_mine.erl", 36).

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

-file("src/mod/adventure/adventure_mine.erl", 37).

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

-file("src/mod/adventure/adventure_mine.erl", 38).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/mod/adventure/adventure_mine.erl", 39).

ready(#role{id = RoleId,
	    link = #link{conn_pid = ConnPid}}) ->
    case var:get_role_var(RoleId, other, 13, 0) of
      N when N > 0 -> notice_below:send(ConnPid, mine_defeat);
      _ -> skip
    end,
    ok.

-spec combat(#role{}, pos_integer(), pos_integer(),
	     pos_integer()) -> {false, bitstring()} | {ok, #role{}}.

combat(Role = #role{id = RoleId}, Floor, RoomId,
       IsSkip) ->
    case check_can_combat([lev, combat_num, floor], Role,
			  #{floor => Floor})
	of
      ok ->
	  Pid = adventure_mine_lib:cluster_get_zone_pid(RoleId),
	  case adventure_mine_zone:call(Pid,
					{can_combat, RoleId, Floor, RoomId})
	      of
	    {ok,
	     MineHole = #adventure_mine_hole{role_id = BRoleId,
					     name = TarName, mine_id = MIneId,
					     formation_type =
						 BFormationType}} ->
		#formation_sys{type = FormationType, pos_info = PosInfo,
			       hallows_id = HallowsId} =
		    formation:get_sys_formation(Role, 23),
		FightPos = formation_lib:gen_fight_pos(PosInfo,
						       FormationType),
		AtkGroup0 = combat_lib:gen_fight_objects(Role,
							 FightPos),
		AtkGroup = sprite_tree:gen_fight_object(Role) ++
			     hallows_lib:gen_fight_object(Role, HallowsId) ++
			       AtkGroup0,
		case gen_def_fight_objects(Role, MineHole) of
		  {ok, DefGroup} ->
		      {ok, CombatRole0} = role_convert:do(combat_role, Role),
		      {CombatRole, IsRobot} = case IsSkip == 1 of
						true ->
						    {CombatRole0#combat_role{is_offline
										 =
										 true,
									     watching
										 =
										 0},
						     1};
						_ -> {CombatRole0, 0}
					      end,
		      Args = #{on_role_combat_end =>
				   {adventure_mine, combat_over,
				    [{Floor, RoomId, BRoleId, TarName,
				      MIneId}]},
			       ext_args =>
				   [{save_replay, true},
				    {is_show_panel, false}],
			       formation =>
				   [{1, FormationType, 0},
				    {2, BFormationType, 0}],
			       target_role_name => TarName,
			       combat_role => CombatRole, is_robot => IsRobot},
		      case combat_lib:start_combat(Role, 30, AtkGroup,
						   [DefGroup], Args)
			  of
			{false, Reason} ->
			    adventure_mine_zone:info(Pid,
						     {unlock_mine, Floor,
						      RoomId}),
			    {false, Reason};
			{ok, _ComPid} ->
			    NRole = role_trigger:fire(#evt_mine_combat{}, Role),
			    log:save(join,
				     {NRole, <<"功能玩法"/utf8>>, <<"矿战玩法"/utf8>>}),
			    {ok, NRole}
		      end;
		  {false, Msg} ->
		      adventure_mine_zone:info(Pid,
					       {unlock_mine, Floor, RoomId}),
		      {false, Msg}
		end;
	    {false, Msg} -> {false, Msg};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidadventure_mine94, _,
		   {__Leveladventure_mine94, __Tracesadventure_mine94}}
		      when __Leveladventure_mine94 band 8 /= 0 orelse
			     __Tracesadventure_mine94 /= [] ->
		      lager:do_log(error,
				   [{module, adventure_mine},
				    {function, combat}, {line, 94},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~ts挑战~w ~w矿战延时",
						 [Role#role.name, Floor,
						  RoomId]),
				   none, 4096, 8, __Leveladventure_mine94,
				   __Tracesadventure_mine94, lager_event,
				   __Pidadventure_mine94);
		  _ -> ok
		end,
		adventure_mine_zone:info(Pid,
					 {unlock_mine, Floor, RoomId}),
		{false, lang:get(<<"网络繁忙，请稍后重试"/utf8>>)}
	  end;
      {false, Msg} -> {false, Msg}
    end.

check_can_combat([lev | Other], Role = #role{lev = Lev},
		 Cache) ->
    OpenLev = adventure_data:get_const(open_lev),
    case Lev < OpenLev of
      true -> {false, lang:get(<<"等级不足"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([combat_num | Other],
		 Role = #role{m_adventure =
				  #m_adventure{mine_combat_num =
						   MineCombatNum}},
		 Cache) ->
    case MineCombatNum =< 0 of
      true -> {false, lang:get(<<"挑战次数不足"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([floor | Other],
		 Role = #role{m_adventure =
				  #m_adventure{pass_id = MaxId}},
		 Cache = #{floor := Floor}) ->
    case MaxId < Floor of
      true -> {false, lang:get(<<"无法挑战尚未探索到的楼层"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([], _Role, _Cache) -> ok.

gen_def_fight_objects(Role,
		      #adventure_mine_hole{role_id = TarRoleId = {0, <<>>},
					   robot_id = RobotId}) ->
    case robot:gen_fight_objects(Role, RobotId, #{},
				 TarRoleId)
	of
      [] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine130, _,
	     {__Leveladventure_mine130, __Tracesadventure_mine130}}
		when __Leveladventure_mine130 band 8 /= 0 orelse
		       __Tracesadventure_mine130 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine},
			      {function, gen_def_fight_objects}, {line, 130},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w矿战场景怪配置出错", [RobotId]), none,
			     4096, 8, __Leveladventure_mine130,
			     __Tracesadventure_mine130, lager_event,
			     __Pidadventure_mine130);
	    _ -> ok
	  end,
	  {false, lang:get(<<"获取对方数据失败"/utf8>>)};
      DefendList = [_ | _] -> {ok, DefendList}
    end;
gen_def_fight_objects(Role,
		      #adventure_mine_hole{role_id = TarRoleId,
					   hallows_id = HallowsId,
					   formation_type = FormationType,
					   defense = PosInfo}) ->
    case role_robot:get_role(TarRoleId) of
      {ok, Robot} ->
	  {ok,
	   sprite_tree:gen_fight_object(Robot) ++
	     hallows_lib:gen_fight_object(Robot, HallowsId) ++
	       [gen_def_fight_object_(P, FormationType, Robot, Role)
		|| P <- PosInfo]};
      _ -> {false, lang:get(<<"获取对方数据失败"/utf8>>)}
    end.

gen_def_fight_object_(#adventure_mine_pos{pos = Pos,
					  id = PId, bid = Bid, lev = Lev,
					  star = Star, break_lev = BreakLev,
					  power = Power, set_skill = SetSkill,
					  attr = AllAttr, use_skin = UseSkin},
		      FormationType,
		      Robot = #role_robot{id = RoleId, partners = Partners,
					  name = Name},
		      Role) ->
    #formation_data{pos = FightPos} =
	formation_data:get_formation(FormationType),
    Pos1 = list_util:keyfind(Pos, FightPos),
    P = case lists:keyfind(PId, #partner.id, Partners) of
	  P0 = #partner{} -> P0;
	  _ ->
	      case {whereis(lager_event), whereis(lager_event),
		    lager_config:get({lager_event, loglevel}, {0, []})}
		  of
		{undefined, undefined, _} ->
		    fun () -> {error, lager_not_running} end();
		{undefined, _, _} ->
		    fun () -> {error, {sink_not_configured, lager_event}}
		    end();
		{__Pidadventure_mine148, _,
		 {__Leveladventure_mine148, __Tracesadventure_mine148}}
		    when __Leveladventure_mine148 band 64 /= 0 orelse
			   __Tracesadventure_mine148 /= [] ->
		    lager:do_log(info,
				 [{module, adventure_mine},
				  {function, gen_def_fight_object_},
				  {line, 148}, {pid, pid_to_list(self())},
				  {node, node()}
				  | lager:md()],
				 io_lib:format("玩家[~ts]伙伴已不存在:~w", [Name, Bid]),
				 none, 4096, 64, __Leveladventure_mine148,
				 __Tracesadventure_mine148, lager_event,
				 __Pidadventure_mine148);
		_ -> ok
	      end,
	      BaseData = #partner_base_data{} =
			     partner_data:get_base(Bid),
	      P0 = partner:init_partner(Role, BaseData, PId, Lev,
					Star),
	      P1 = partner_lib:calc_attr(Role,
					 P0#partner{break_lev = BreakLev}),
	      P1#partner{all_attr = AllAttr, power = Power,
			 set_skills = SetSkill, use_skin = UseSkin, lev = Lev,
			 star = Star, break_lev = BreakLev}
	end,
    FO1 = partner_lib:gen_fight_object(Robot, 0, P,
				       combat_lib:is_leader(Pos), RoleId, 1),
    FO1#fight_object{pos = Pos1}.

combat_over(Role = #role{id = RoleId,
			 m_adventure =
			     MAdventure = #m_adventure{mine_combat_num =
							   MineCombatNum,
						       mine_round_combat =
							   MineRoundCombat}},
	    CombatResult = #combat_result{result = Result = 1,
					  replay_id = ReplayId,
					  hurt_statistics = HurtStatistics},
	    Combat = #combat{target_role_name = TargetName},
	    {Floor, RoomId, BRoleId, BName, MineId}) ->
    Pid = adventure_mine_lib:cluster_get_zone_pid(RoleId),
    adventure_mine_zone:info(Pid,
			     {unlock_mine_delayed, Floor, RoomId}),
    case adventure_mine_zone:call(Pid,
				  {combat_win, RoleId, Floor, RoomId, ReplayId})
	of
      {ok, PlunderItems} ->
	  Role1 = Role#role{m_adventure =
				MAdventure#m_adventure{mine_combat_num =
							   MineCombatNum - 1,
						       mine_round_combat =
							   MineRoundCombat +
							     1}},
	  {ok, NRole, _RewardItems} =
	      drop_lib:gain_combat_drop(Role1, Combat, 1,
					PlunderItems, <<"冒险矿战"/utf8>>,
					util:fbin("挑战层数房间[~w][~w]",
						  [Floor, RoomId])),
	  log(NRole, CombatResult, BRoleId, BName, MineId, Floor,
	      RoomId, PlunderItems),
	  EndTime = date:unixtime() +
		      adventure_mine_data:get_const(count_down),
	  sys_conn:pack_send(20649,
			     {Result, Floor, RoomId, MineCombatNum - 1,
			      PlunderItems, TargetName, HurtStatistics,
			      EndTime}),
	  {ok, NRole};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine171, _,
	     {__Leveladventure_mine171, __Tracesadventure_mine171}}
		when __Leveladventure_mine171 band 8 /= 0 orelse
		       __Tracesadventure_mine171 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine}, {function, combat_over},
			      {line, 171}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]战斗结束，上报战斗结果错误[Err:~w]",
					   [Role#role.name, Err]),
			     none, 4096, 8, __Leveladventure_mine171,
			     __Tracesadventure_mine171, lager_event,
			     __Pidadventure_mine171);
	    _ -> ok
	  end,
	  {ok, Role}
    end;
combat_over(Role = #role{id = RoleId,
			 m_adventure =
			     MAdventure = #m_adventure{mine_combat_num =
							   MineCombatNum,
						       mine_round_combat =
							   MineRoundCombat}},
	    CombatResult = #combat_result{result = Result,
					  hurt_statistics = HurtStatistics},
	    #combat{target_role_name = TargetName},
	    {Floor, RoomId, BRoleId, BName, MineId}) ->
    Pid = adventure_mine_lib:cluster_get_zone_pid(RoleId),
    adventure_mine_zone:info(Pid,
			     {unlock_mine, Floor, RoomId}),
    NRole = Role#role{m_adventure =
			  MAdventure#m_adventure{mine_combat_num =
						     MineCombatNum - 1,
						 mine_round_combat =
						     MineRoundCombat + 1}},
    log(NRole, CombatResult, BRoleId, BName, MineId, Floor,
	RoomId, []),
    EndTime = date:unixtime() +
		adventure_mine_data:get_const(count_down),
    sys_conn:pack_send(20649,
		       {Result, Floor, RoomId, MineCombatNum - 1, [],
			TargetName, HurtStatistics, EndTime}),
    {ok, NRole}.

log(#role{id = RoleId, name = Name, lev = Lev,
	  face_id = Face, arena_power = Power},
    #combat_result{replay_id = ReplayId, result = Result},
    BRoleId = {_, BSrvId}, _BName, MineId, Floor, RoomId,
    LossItems) ->
    Now = date:unixtime(),
    case BSrvId of
      <<>> -> skip;
      _ ->
	  BRet = util:if_true(Result =:= 1, 2, 1),
	  BLog = #adventure_mine_log{rid = RoleId, name = Name,
				     lev = Lev, face = Face, power = Power,
				     floor = Floor, room_id = RoomId,
				     mine_id = MineId, type = 2, ret = BRet,
				     replay_id = ReplayId, loss = LossItems,
				     time = Now},
	  cluster_lib:cast(BSrvId, adventure_mine_mgr, info,
			   [{add_log, BRoleId, BLog}])
    end.

-spec push_floor(#role{}, pos_integer(),
		 pos_integer()) -> ok.

push_floor(Role = #role{id = RoleId,
			m_adventure =
			    MAdventure = #m_adventure{mine_combat_num =
							  MineCombatNum,
						      mine_buy_count =
							  MineBuyCount}},
	   Floor, IsNotice) ->
    GroupId =
	adventure_mine_lib:cluster_get_group_id(RoleId),
    case
      adventure_mine_lib:cluster_get_adventure_mine_floor_cli(GroupId,
							      Floor)
	of
      {ok, CliL} ->
	  MineNum =
	      adventure_mine_lib:cluster_get_mine_owned_num(RoleId),
	  sys_conn:pack_send(20640,
			     {Floor, MineCombatNum, MineNum, CliL,
			      MineBuyCount}),
	  Role1 = Role#role{m_adventure =
				MAdventure#m_adventure{current_id = Floor}},
	  Role2 = role_trigger:fire(#evt_enter_adventure_mine{},
				    Role1),
	  NRole = var:set_var(Role2, day, 105, 0),
	  {ok, NRole};
      _ ->
	  case IsNotice == 1 of
	    true ->
		notice:alert(lang:get(<<"冒险家请稍等，新一轮矿战将于几分钟后开启哦"/utf8>>));
	    _ -> skip
	  end,
	  skip
    end.

-spec push_room(#role{}, pos_integer(),
		pos_integer()) -> ok.

push_room(#role{id = RoleId}, Floor, RoomId) ->
    GroupId =
	adventure_mine_lib:cluster_get_group_id(RoleId),
    case
      adventure_mine_lib:cluster_get_adventure_mine_hole(GroupId,
							 Floor, RoomId)
	of
      {ok,
       MineHole = #adventure_mine_hole{room_id = RoomId,
				       mine_id = MineId,
				       role_id = TRoleId = {TRid, TSrvId},
				       name = Name, lev = Lev, face = Face,
				       power = Power, occupy_time = OccupyTime,
				       formation_type = FormationType,
				       hallows_id = HallowsId}} ->
	  #adventure_mine_hook{acc_hook_items = AccHookItems,
			       plunder_count = PlunderCount} =
	      adventure_mine_lib:cluster_get_mine_hook_group(GroupId,
							     Floor, RoomId),
	  CliDefense = cli_defense(MineHole),
	  CliPlunderCount = util:if_true(RoleId == TRoleId,
					 PlunderCount,
					 max(0,
					     adventure_mine_data:get_const(rob_number)
					       - PlunderCount)),
	  MaxFloor = adventure_mine_lib:get_max_floor(RoleId),
	  RewardRate =
	      adventure_mine_data:get_plunder_reward(max(0,
							 MaxFloor - Floor)),
	  CliAccHookItemsT = if TRoleId == {0, <<>>} ->
				    adventure_mine_data:get_hole_base_items(MineId);
				RoleId == TRoleId -> AccHookItems;
				CliPlunderCount > 0 ->
				    [{ItemIdT,
				      util:round(NumT * RewardRate / 1000)}
				     || {ItemIdT, NumT} <- AccHookItems];
				true -> []
			     end,
	  CliAccHookItems = [{ItemIdT, NumT}
			     || {ItemIdT, NumT} <- CliAccHookItemsT,
				NumT =/= 0],
	  sys_conn:pack_send(20641,
			     {Floor, MineId, TRid, TSrvId, Name, Lev, Face,
			      Power, CliPlunderCount, OccupyTime, CliDefense,
			      CliAccHookItems, FormationType, HallowsId}),
	  ok;
      _ -> skip
    end.

cli_defense(#adventure_mine_hole{role_id = {0, <<>>},
				 defense = Defense}) ->
    [{Pos, PId, PBid, PLev, PStar, UseSkin}
     || #adventure_mine_pos{pos = Pos, id = PId, bid = PBid,
			    lev = PLev, star = PStar, use_skin = UseSkin}
	    <- Defense];
cli_defense(#adventure_mine_hole{role_id = RoleId,
				 defense = Defense}) ->
    case role_robot:get_role(RoleId) of
      {ok, #role_robot{partners = Partners}} ->
	  do_cli_defense(Defense, Partners, []);
      _ ->
	  [{Pos, PId, PBid, PLev, PStar, UseSkin}
	   || #adventure_mine_pos{pos = Pos, id = PId, bid = PBid,
				  lev = PLev, star = PStar, use_skin = UseSkin}
		  <- Defense]
    end.

do_cli_defense([], _, CliL) -> CliL;
do_cli_defense([#adventure_mine_pos{pos = Pos, id = PId,
				    bid = PBid, lev = PLev, star = PStar,
				    use_skin = UseSkin}
		| T],
	       Partners, CliL) ->
    case lists:keyfind(PId, #partner.id, Partners) of
      #partner{lev = Lev, star = Star, use_skin = UseSkin1} ->
	  do_cli_defense(T, Partners,
			 [{Pos, PId, PBid, Lev, Star, UseSkin1} | CliL]);
      _ ->
	  do_cli_defense(T, Partners,
			 [{Pos, PId, PBid, PLev, PStar, UseSkin} | CliL])
    end.

save_formation(Role = #role{id = RoleId,
			    name = RoleName, lev = RLev, face_id = RFace},
	       Floor, RoomId, FormationType, PosInfo, HallowsId) ->
    CanOwnedNum = get_owned_count(Role),
    UsedHallowsData =
	adventure_mine_lib:cluster_get_used_hallows(RoleId),
    UsedHallowsIds = lists:flatten([HallowsIdT
				    || {FloorT, RoomIdT, HallowsIdT}
					   <- UsedHallowsData,
				       {FloorT, RoomIdT} =/= {Floor, RoomId},
				       HallowsIdT =/= 0]),
    case formation:check_formation_pos_info(Role,
					    FormationType, PosInfo, HallowsId)
	of
      {false, Reason} -> {false, Reason};
      {ok, NewPosInfo} ->
	  LockIds =
	      adventure_mine_lib:cluster_get_lock_partner_ids_except(RoleId,
								     Floor,
								     RoomId),
	  PIds = [PId || #formation_pos{id = PId} <- NewPosInfo],
	  case lists:any(fun (PId) -> lists:member(PId, LockIds)
			 end,
			 PIds)
	      of
	    true -> {false, lang:get(<<"存在已派出防守的英雄"/utf8>>)};
	    _ ->
		case lists:member(HallowsId, UsedHallowsIds) of
		  false ->
		      Power = partner_lib:get_power(Role, PIds),
		      Defense = [#adventure_mine_pos{pos = Pos, id = PIdT,
						     bid = PBid, lev = PLev,
						     star = PStar,
						     break_lev = BreakLev,
						     power = PowerT,
						     use_skin = UseSkin,
						     set_skill = SetSkill,
						     attr = AllAttr}
				 || {Pos,
				     #partner{id = PIdT, bid = PBid, lev = PLev,
					      star = PStar,
					      break_lev = BreakLev,
					      power = PowerT,
					      use_skin = UseSkin,
					      set_skills = SetSkill,
					      all_attr = AllAttr}}
					<- [{Pos,
					     partner_lib:get_partner(Role, PId)}
					    || #formation_pos{pos = Pos,
							      id = PId}
						   <- NewPosInfo]],
		      Pid = adventure_mine_lib:cluster_get_zone_pid(RoleId),
		      case adventure_mine_zone:call(Pid,
						    {save_defense, RoleId,
						     RoleName, RLev, RFace,
						     Power, Floor, RoomId,
						     FormationType, Defense,
						     HallowsId, CanOwnedNum})
			  of
			ok -> ok;
			{false, Msg} -> {false, Msg};
			_ERR ->
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
			      {__Pidadventure_mine295, _,
			       {__Leveladventure_mine295,
				__Tracesadventure_mine295}}
				  when __Leveladventure_mine295 band 8 /= 0
					 orelse
					 __Tracesadventure_mine295 /= [] ->
				  lager:do_log(error,
					       [{module, adventure_mine},
						{function, save_formation},
						{line, 295},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("[~ts]在防守布阵的时候报错了[Err:~w]",
							     [Role#role.name,
							      _ERR]),
					       none, 4096, 8,
					       __Leveladventure_mine295,
					       __Tracesadventure_mine295,
					       lager_event,
					       __Pidadventure_mine295);
			      _ -> ok
			    end,
			    {false, lang:get(<<"网络繁忙，请重新打开界面"/utf8>>)}
		      end;
		  _ -> {false, lang:get(<<"该神器已被其他队伍装备中"/utf8>>)}
		end
	  end
    end.

mail_round_reward(Role = #role{m_adventure =
				   #m_adventure{mine_round_combat = RoundCombat,
						mine_round_reward = Reward}})
    when RoundCombat >= 3 ->
    case var:get_var(Role, other, 3088, 0) of
      0 ->
	  case
	    item_lib:merge(lists:concat([adventure_mine_data:get_box_reward(Num)
					 || Num <- [3, 5, 8, 12],
					    RoundCombat >= Num,
					    not lists:member(Num, Reward)]),
			   [])
	      of
	    [] -> Role;
	    Items ->
		{ok, NRole} = mail:add(Role,
				       {lang:get(<<"矿战宝箱补发"/utf8>>),
					lang:get(<<"亲爱的冒险家您好，冒险矿战由于体验不佳，暂时关闭，系统自动返还您在本轮矿战中未领取的宝箱奖"
						   "励。以下是返还的奖励："/utf8>>),
					[], Items, <<"矿战宝箱补发"/utf8>>,
					86400 * 7 + date:unixtime()}),
		var:set_var(NRole, other, 3088, 1)
	  end;
      _ -> Role
    end;
mail_round_reward(Role) -> Role.

-spec push_round_reward(#role{}) -> ok.

push_round_reward(#role{m_adventure =
			    #m_adventure{mine_round_combat = RoundCombat,
					 mine_round_reward = Reward,
					 mine_combat_num = MineCombatNum}}) ->
    sys_conn:pack_send(20647,
		       {RoundCombat, Reward, MineCombatNum}),
    ok.

-spec get_round_reward(#role{},
		       Num :: pos_integer()) -> {false, binary()} |
						{ok, #role{}}.

get_round_reward(Role = #role{m_adventure =
				  MAdventure = #m_adventure{mine_round_combat =
								RoundCombat,
							    mine_round_reward =
								Reward}},
		 Num)
    when RoundCombat >= Num ->
    case adventure_mine_data:get_box_reward(Num) of
      Items = [_ | _] ->
	  case lists:member(Num, Reward) of
	    true -> {false, lang:get(<<"该奖励已领取"/utf8>>)};
	    false ->
		GL = format:val_to_gain(Items, adventure_mine_reward),
		case role_gain:do_notice(Role, GL) of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, Role1} ->
		      NRole = Role1#role{m_adventure =
					     MAdventure#m_adventure{mine_round_reward
									=
									[Num
									 | Reward]}},
		      log:log_gain(GL, Role, NRole, <<"矿战玩法"/utf8>>,
				   util:fbin("矿战挑战次数奖励num:~w", [Num])),
		      {ok, NRole}
		end
	  end;
      _ -> {false, lang:get(<<"该宝箱不存在哟"/utf8>>)}
    end;
get_round_reward(_Role, _Num) ->
    {false, lang:get(<<"挑战次数未达标"/utf8>>)}.

-spec push_log(#role{}) -> ok.

push_log(#role{id = RoleId}) ->
    #adventure_mine_role_log{logs = L} =
	adventure_mine_lib:get_log(RoleId),
    sys_conn:pack_send(20644, {L}),
    ok.

-spec push_log(#role{}, pos_integer(),
	       pos_integer()) -> ok.

push_log(#role{id = RoleId}, Floor, RoomId) ->
    #adventure_mine_role_log{logs = L} =
	adventure_mine_lib:get_log(RoleId),
    CliL = [Log
	    || Log = #adventure_mine_log{floor = FloorT,
					 room_id = RoomIdT}
		   <- L,
	       FloorT == Floor, RoomIdT == RoomId],
    sys_conn:pack_send(20645, {CliL}),
    ok.

-spec give_up(#role{}, pos_integer(),
	      pos_integer()) -> ok | {false, bitstring()}.

give_up(Role = #role{id = RoleId}, Floor, RoomId) ->
    Pid = adventure_mine_lib:cluster_get_zone_pid(RoleId),
    case adventure_mine_zone:call(Pid,
				  {give_up, RoleId, Floor, RoomId})
	of
      ok -> ok;
      {false, Msg} -> {false, Msg};
      _ERR ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine376, _,
	     {__Leveladventure_mine376, __Tracesadventure_mine376}}
		when __Leveladventure_mine376 band 8 /= 0 orelse
		       __Tracesadventure_mine376 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine}, {function, give_up},
			      {line, 376}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]在放弃矿脉的时候报错了[Err:~w]",
					   [Role#role.name, _ERR]),
			     none, 4096, 8, __Leveladventure_mine376,
			     __Tracesadventure_mine376, lager_event,
			     __Pidadventure_mine376);
	    _ -> ok
	  end,
	  {false, lang:get(<<"网络繁忙，请稍后重试"/utf8>>)}
    end.

push_my_owned(#role{id = RoleId}) ->
    GroupId =
	adventure_mine_lib:cluster_get_group_id(RoleId),
    #adventure_mine_owned{list = OwnedList} =
	adventure_mine_lib:cluster_get_mine_owned(RoleId),
    CliL = case OwnedList =/= [] of
	     true ->
		 #adventure_mine_group_hook{list = HookList} =
		     adventure_mine_lib:cluster_get_mine_hook_group(GroupId),
		 to_cli_owned(OwnedList, RoleId, HookList, []);
	     _ -> []
	   end,
    sys_conn:pack_send(20652, {CliL}),
    ok.

to_cli_owned([], _RoleId, _HookList, CliL) -> CliL;
to_cli_owned([#adventure_mine_owned_data{id =
					     Id = {Floor, RoomId}}
	      | Other],
	     RoleId, HookList, CliL) ->
    case lists:keyfind(Id, #adventure_mine_hook.id,
		       HookList)
	of
      #adventure_mine_hook{role_id = RoleId, mine_id = MineId,
			   occupy_time = OccupyTime,
			   primary_count = PrimaryCount,
			   senior_count = SeniorCount,
			   acc_hook_items = AccHookItems} ->
	  Cli = {Floor, RoomId, MineId, OccupyTime, PrimaryCount,
		 SeniorCount, AccHookItems},
	  to_cli_owned(Other, RoleId, HookList, [Cli | CliL]);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine401, _,
	     {__Leveladventure_mine401, __Tracesadventure_mine401}}
		when __Leveladventure_mine401 band 8 /= 0 orelse
		       __Tracesadventure_mine401 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine},
			      {function, to_cli_owned}, {line, 401},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("居然找不到~w的矿脉收益~w层~w位置",
					   [RoleId, Floor, RoomId]),
			     none, 4096, 8, __Leveladventure_mine401,
			     __Tracesadventure_mine401, lager_event,
			     __Pidadventure_mine401);
	    _ -> ok
	  end,
	  to_cli_owned(Other, RoleId, HookList, CliL)
    end.

-spec buy_miner(#role{}, pos_integer(), pos_integer(),
		pos_integer()) -> {ok, #role{}} | {false, bitstring()}.

buy_miner(Role = #role{id = RoleId}, Floor, RoomId,
	  Type) ->
    GroupId =
	adventure_mine_lib:cluster_get_group_id(RoleId),
    case
      adventure_mine_lib:cluster_get_adventure_mine_hole(GroupId,
							 Floor, RoomId)
	of
      {ok,
       #adventure_mine_hole{mine_id = MineId,
			    role_id = RoleId}} ->
	  LossCfg = util:if_true(Type == 1,
				 adventure_mine_data:get_primary_loss(MineId),
				 adventure_mine_data:get_senior_loss(MineId)),
	  Loss = format:val_to_loss(LossCfg, buy_miner),
	  case role_gain:do(Role, Loss) of
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {ok, NRole} ->
		Pid = adventure_mine_lib:cluster_get_zone_pid(RoleId),
		case adventure_mine_zone:call(Pid,
					      {buy_miner, RoleId, Floor, RoomId,
					       Type, MineId})
		    of
		  ok ->
		      log:log_gain(Loss, Role, NRole, <<"矿战玩法"/utf8>>,
				   util:fbin("购买矿工 ~w ~w ~w",
					     [Floor, RoomId, Type])),
		      NewRole = role_trigger:fire(#evt_mine_buy_miner{},
						  NRole),
		      {ok, NewRole};
		  {false, Msg} -> {false, Msg};
		  _ERR ->
		      log:log_gain(Loss, Role, NRole, <<"矿战玩法"/utf8>>,
				   util:fbin("购买矿工超时了 ~w ~w ~w",
					     [Floor, RoomId, Type])),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidadventure_mine427, _,
			 {__Leveladventure_mine427, __Tracesadventure_mine427}}
			    when __Leveladventure_mine427 band 8 /= 0 orelse
				   __Tracesadventure_mine427 /= [] ->
			    lager:do_log(error,
					 [{module, adventure_mine},
					  {function, buy_miner}, {line, 427},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~ts购买矿工请求超时了~w ~w ~w",
						       [Role#role.name, Floor,
							RoomId, Type]),
					 none, 4096, 8,
					 __Leveladventure_mine427,
					 __Tracesadventure_mine427, lager_event,
					 __Pidadventure_mine427);
			_ -> ok
		      end,
		      {ok, NRole}
		end
	  end;
      _ -> {false, lang:get(<<"尚未占领该矿脉"/utf8>>)}
    end.

get_owned_count(Role) ->
    OpenCond = adventure_mine_data:floor_cond(),
    check_owned_count(OpenCond, Role, 0).

check_owned_count([], _Role, Num) -> Num;
check_owned_count([{_, Cond} | Other],
		  Role = #role{lev = Lev, m_vip = #m_vip{lev = VipLev}},
		  Num) ->
    case Cond of
      [] -> check_owned_count(Other, Role, Num + 1);
      [{lev, LevLimit}] when Lev >= LevLimit ->
	  check_owned_count(Other, Role, Num + 1);
      [{vip, VipLevLimit}] when VipLev >= VipLevLimit ->
	  check_owned_count(Other, Role, Num + 1);
      _ -> check_owned_count(Other, Role, Num)
    end.

-spec buy_count(#role{}) -> {ok, #role{}, pos_integer(),
			     pos_integer()} |
			    {false, bitstring(), pos_integer(), pos_integer()}.

buy_count(Role = #role{m_adventure =
			   MAdventure = #m_adventure{mine_buy_count =
							 MineBuyCount,
						     mine_combat_num =
							 MineCombatNum}}) ->
    case adventure_mine_data:get_const(diamond_attack) >
	   MineBuyCount
	of
      true ->
	  Loss = format:val_to_loss([{3,
				      adventure_mine_data:get_const(diamond_cost)}],
				    buy_mine_count),
	  case role_gain:do(Role, Loss) of
	    {false, #loss{msg = Msg}} ->
		{false, Msg, MineCombatNum, MineBuyCount};
	    {ok, Role1} ->
		log:log_gain(Loss, Role, Role1, <<"矿战玩法"/utf8>>,
			     util:fbin("购买矿战次数，当前已买~w次", [MineCombatNum + 1])),
		NRole = Role1#role{m_adventure =
				       MAdventure#m_adventure{mine_buy_count =
								  MineBuyCount +
								    1,
							      mine_combat_num =
								  MineCombatNum
								    + 1}},
		{ok, NRole, MineCombatNum + 1, MineBuyCount + 1}
	  end;
      _ ->
	  {false, lang:get(<<"已达到可购买次数上限"/utf8>>), MineCombatNum,
	   MineBuyCount}
    end.

-spec push_back_atk(#role{}, role_id()) -> ok.

push_back_atk(#role{m_adventure =
			#m_adventure{pass_id = MaxId},
		    id = RoleId},
	      TarRoleId) ->
    #adventure_mine_owned{list = List} =
	adventure_mine_lib:cluster_get_mine_owned(TarRoleId),
    CliL = [D
	    || D = #adventure_mine_owned_data{id = {Floor, _}}
		   <- List,
	       MaxId >= Floor],
    case CliL of
      [_ | _] ->
	  GroupId =
	      adventure_mine_lib:cluster_get_group_id(RoleId),
	  Now = date:unixtime(),
	  Fun = fun (#adventure_mine_owned_data{id =
						    {FloorT, RoomIdT}},
		     Acc) ->
			case
			  adventure_mine_lib:cluster_get_adventure_mine_hole(GroupId,
									     FloorT,
									     RoomIdT)
			    of
			  {ok, #adventure_mine_hole{cool_time = CoolTime}}
			      when Now >= CoolTime ->
			      [{FloorT, RoomIdT} | Acc];
			  _ -> Acc
			end
		end,
	  CliL2 = lists:foldl(Fun, [], CliL),
	  case CliL2 of
	    [{Floor, RoomId} | _] ->
		sys_conn:pack_send(20656, {Floor, RoomId});
	    _ -> sys_conn:pack_send(20656, {0, 0})
	  end;
      _ -> sys_conn:pack_send(20656, {0, 0})
    end,
    ok.


