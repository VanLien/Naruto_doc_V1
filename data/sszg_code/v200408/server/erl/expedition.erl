-file("src/mod/expedition/expedition.erl", 1).

-module(expedition).

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
		{arena_pk_log,
		 [id, rid, name, lev, sex, face, avatar_id, power, type,
		  ret, replay_id, score, time, face_update_time,
		  face_file]},
		{arena_role_log, [id, logs]},
		{arena_rank, [rank, id, score]},
		{arena_role,
		 [id, name, lev, sex, gid, gname, face, power, max_power,
		  lookid, score, rank, time, avatar_id, champion_power,
		  face_update_time, face_file]},
		{arena_f_pos,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, ext]},
		{arena_f,
		 [id, name, idx, lev, sex, face, power, status,
		  formation_type, formation_lev, pos_info, robot_id,
		  avatar_id, face_update_time, face_file, gid, gname]},
		{m_arena,
		 [ver, ref_time, ref_list, cont_win, buff_id,
		  season_ref_time, can_combat_num, had_combat_num,
		  buy_combat_num, acc_combat_num, season_reward]},
		{expedition_replay_partner, [pos, bid, lev, star, ext]},
		{expedition_replay,
		 [id, round, ret, time, difficulty, guard_id, a_id,
		  a_name, a_lev, a_power, a_formation_type, a_end_hp,
		  b_id, b_name, b_lev, b_power, b_formation_type,
		  b_end_hp, a_plist, b_plist, ext]},
		{expedition_log, [id, list]},
		{expedition_employ_p,
		 [id, bid, lev, star, quality, break_lev, power, num,
		  ext]},
		{expedition_employ, [rid, rname, num, list]},
		{expedition_f_pos,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, ext]},
		{expedition_f,
		 [id, type, robot_id, role_id, name, lev, face, power,
		  hallows_id, formation_type, items, guards, partner_hp,
		  status]},
		{m_expedition,
		 [ver, guard_id, partner_hp, list, employ, appoint,
		  difficulty, max_difficulty, last_join_time,
		  last_difficulty, max_power]},
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

-export([gm/2, init/0, login/1, level_up/2,
	 start_combat/4, zero_flush/1, init_list/1,
	 push_base_info/1, push_red_point/1, get_target_info/2,
	 get_ext_reward/2, combat_over/4, get_formation/2,
	 can_skip_combat/1, choose_difficulty/2, get_log/2,
	 push_log_info/2, pass_floor/1]).

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

-file("src/mod/expedition/expedition.erl", 28).

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

-file("src/mod/expedition/expedition.erl", 29).

-file("inc/expedition.hrl", 1).

-record(m_expedition,
	{ver = 2, guard_id = 0, partner_hp = [], list = [],
	 employ = [], appoint = [], difficulty = 0,
	 max_difficulty = 0, last_join_time = 0,
	 last_difficulty = {0, 0}, max_power = 0}).

-record(expedition_f,
	{id = 1  :: 1..100, type = 1, robot_id = 0,
	 role_id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: bitstring(),
	 lev = 0  :: non_neg_integer(),
	 face = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 hallows_id = 0  :: non_neg_integer(),
	 formation_type = 0  :: non_neg_integer(),
	 items = []  :: list(), guards = []  :: list(),
	 partner_hp = []  :: list(), status = 0  :: 0..2}).

-record(expedition_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, ext = []}).

-record(expedition_employ,
	{rid = {0, <<>>}, rname = <<>>, num = 0, list = []}).

-record(expedition_employ_p,
	{id = 0, bid = 0, lev = 0, star = 0, quality = 0,
	 break_lev = 0, power = 0, num = 0, ext = []}).

-record(expedition_log,
	{id = {{0, <<>>}, 0}, list = []}).

-record(expedition_replay,
	{id = 0, round = 0, ret = 0, time = 0, difficulty = 0,
	 guard_id = 0, a_id = {0, <<>>}, a_name = <<>>,
	 a_lev = 0, a_power = 0, a_formation_type = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_name = <<>>,
	 b_lev = 0, b_power = 0, b_formation_type = 0,
	 b_end_hp = 0, a_plist = [], b_plist = [], ext = []}).

-record(expedition_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-file("src/mod/expedition/expedition.erl", 30).

-file("inc/arena.hrl", 1).

-record(m_arena,
	{ver = 1, ref_time = 0, ref_list = [], cont_win = 0,
	 buff_id = 0, season_ref_time = 0, can_combat_num = 0,
	 had_combat_num = 0, buy_combat_num = 0,
	 acc_combat_num = 0, season_reward = []}).

-record(arena_f,
	{id = {0, <<>>}, name = <<>>, idx = 0, lev = 0, sex = 0,
	 face = 0, power = 0, status = 0, formation_type = 0,
	 formation_lev = 0, pos_info = [], robot_id = 0,
	 avatar_id = 0, face_update_time = 0, face_file = <<>>,
	 gid = {0, <<>>}, gname = <<>>}).

-record(arena_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, ext}).

-record(arena_role,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, score = 0, rank = 0,
	 time = 0, avatar_id = 0, champion_power = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(arena_rank,
	{rank = 0, id = {0, <<>>}, score = 0}).

-record(arena_role_log, {id = {0, <<>>}, logs = []}).

-record(arena_pk_log,
	{id = 0, rid = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, avatar_id = 0, power = 0, type = 1, ret = 1,
	 replay_id = 0, score = 0, time = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/mod/expedition/expedition.erl", 31).

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

-file("src/mod/expedition/expedition.erl", 32).

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

-file("src/mod/expedition/expedition.erl", 33).

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

-file("src/mod/expedition/expedition.erl", 34).

-file("inc/log.hrl", 1).

-file("src/mod/expedition/expedition.erl", 35).

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

-file("src/mod/expedition/expedition.erl", 36).

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

-file("src/mod/expedition/expedition.erl", 37).

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

-file("src/mod/expedition/expedition.erl", 38).

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

-file("src/mod/expedition/expedition.erl", 39).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/expedition/expedition.erl", 40).

-spec gm(#role{}, tuple()) -> {ok, #role{}}.

gm(Role, {next_guard}) -> {ok, Role}.

-spec init() -> #m_expedition{}.

init() -> #m_expedition{}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{platform = <<"verifyios">>}) ->
    NRole = init_list(Role), {ok, NRole};
login(Role) -> {ok, Role}.

-spec level_up(#role{}, #role{}) -> {ok, #role{}}.

level_up(_, Role) -> {ok, Role}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{max_power = MaxPower,
			m_expedition =
			    #m_expedition{guard_id = GuardId,
					  difficulty = Difficulty,
					  max_difficulty = MaxDifficulty,
					  last_join_time = LastJoinTime}}) ->
    NRole = Role#role{m_expedition =
			  #m_expedition{last_join_time = LastJoinTime,
					last_difficulty =
					    {Difficulty, max(0, GuardId - 1)},
					max_difficulty = MaxDifficulty,
					max_power = MaxPower}},
    push_base_info(NRole),
    sys_conn:pack_send(24413, {}),
    {ok, NRole}.

push_base_info(Role = #role{m_expedition =
				#m_expedition{guard_id = Id, list = List,
					      difficulty = Difficulty,
					      max_difficulty =
						  MaxDifficulty}}) ->
    BoxList = expedition_data:type_list(2),
    Fun = fun (BoxId) ->
		  case lists:keyfind(BoxId, #expedition_f.id, List) of
		    #expedition_f{type = 2, status = 2} -> true;
		    _ -> false
		  end
	  end,
    CliL = lists:filter(Fun, BoxList),
    FunR = fun (#expedition_f{status = 2, items = Items},
		Acc) ->
		   case is_open_holiday(Role) of
		     1 ->
			 AddItems = [{ItemId, util:ufloor(Num * 1.0e-1)}
				     || {ItemId, Num} <- Items, ItemId =:= 25],
			 ItemsT = item_lib:merge(AddItems, Items),
			 item_lib:merge(ItemsT, Acc);
		     _ -> item_lib:merge(Items, Acc)
		   end;
	       (_, Acc) -> Acc
	   end,
    CliReward = lists:foldl(FunR, [{1, 0}, {25, 0}], List),
    sys_conn:pack_send(24400,
		       {Id, Difficulty, MaxDifficulty, CliL, CliReward}),
    ok.

push_red_point(#role{m_expedition =
			 #m_expedition{partner_hp = PartnerHp,
				       guard_id = GuardId, list = List,
				       employ = EmployL},
		     partner_bag = #partner_bag{partner_list = PartnerL}}) ->
    case lists:keyfind(GuardId, #expedition_f.id, List) of
      #expedition_f{type = 1, power = Power, status = 1} ->
	  Fun = fun (#partner{power = PartnerPower, id = Id}) ->
			case lists:keyfind(Id, 1, PartnerHp) of
			  {_, 0} -> false;
			  _ ->
			      util:if_true(PartnerPower >=
					     Power *
					       (expedition_data:get_const(red_war_ratio)
						  / 1000),
					   true, false)
			end;
		    ({Id, _, _, _, _, _, PartnerPower, 0, _Ext}) ->
			case lists:keyfind(Id, 1, PartnerHp) of
			  {_, 0} -> false;
			  _ ->
			      util:if_true(PartnerPower >=
					     Power *
					       (expedition_data:get_const(red_war_ratio)
						  / 1000),
					   true, false)
			end;
		    (_) -> false
		end,
	  IsShow = lists:any(Fun, EmployL ++ PartnerL),
	  sys_conn:pack_send(24410, {util:if_true(IsShow, 1, 0)});
      _ -> sys_conn:pack_send(24410, {0})
    end,
    ok.

init_list(Role) -> Role.

create_exped_new(Role, Difficulty, AutoId) ->
    Ids = expedition_data:ids(),
    create_exped_new(Ids, Role, Difficulty, AutoId, []).

create_exped_new([], Role, _Difficulty, _AutoId,
		 Reward) ->
    {Role, Reward};
create_exped_new([Id | Other],
		 Role = #role{m_expedition =
				  MExepedition = #m_expedition{list = List,
							       max_power =
								   MaxPower}},
		 Difficulty, AutoId, AccReward) ->
    case expedition_data:get_ref(Id) of
      #{type := 2} ->
	  {Reward, _} = expedition_data:new_reward({Difficulty,
						    Id, MaxPower}),
	  Status = util:if_true(AutoId >= Id, 1, 0),
	  Expedition = #expedition_f{id = Id, status = Status,
				     type = 2, items = Reward},
	  NewList = lists:keystore(Id, #expedition_f.id, List,
				   Expedition),
	  NRole = Role#role{m_expedition =
				MExepedition#m_expedition{list = NewList}},
	  create_exped_new(Other, NRole, Difficulty, AutoId,
			   AccReward);
      #{type := 1} when AutoId >= Id ->
	  Expedition = #expedition_f{guards = Guards,
				     items = Reward} =
			   match_player_new(Role, Id),
	  TargetPartnerHp = [{PId, 0}
			     || #expedition_f_pos{id = PId} <- Guards],
	  NewExpedition = Expedition#expedition_f{status = 2,
						  partner_hp = TargetPartnerHp},
	  NewList = lists:keystore(Id, #expedition_f.id, List,
				   NewExpedition),
	  NewAccReward = item_lib:merge(Reward, AccReward),
	  create_exped_new(Other,
			   Role#role{m_expedition =
					 MExepedition#m_expedition{list =
								       NewList}},
			   Difficulty, AutoId, NewAccReward);
      _ ->
	  create_exped_new(Other, Role, Difficulty, AutoId,
			   AccReward)
    end.

pass_exped_new(Role = #role{m_expedition =
				MExpedition = #m_expedition{guard_id = Id,
							    list = List}}) ->
    case expedition_data:get_ref(Id) of
      #{type := 1} ->
	  Expedition = match_player_new(Role, Id),
	  NewList = lists:keystore(Id, #expedition_f.id, List,
				   Expedition),
	  Role#role{m_expedition =
			MExpedition#m_expedition{list = NewList}};
      #{type := 2} ->
	  case lists:keyfind(Id, #expedition_f.id, List) of
	    Ef = #expedition_f{status = 0, type = 2} ->
		NewEf = Ef#expedition_f{status = 1},
		NewList = lists:keystore(Id, #expedition_f.id, List,
					 NewEf),
		NRole = Role#role{m_expedition =
				      MExpedition#m_expedition{guard_id =
								   Id + 1,
							       list = NewList}},
		pass_exped_new(NRole);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidexpedition159, _,
		   {__Levelexpedition159, __Tracesexpedition159}}
		      when __Levelexpedition159 band 8 /= 0 orelse
			     __Tracesexpedition159 /= [] ->
		      lager:do_log(error,
				   [{module, expedition},
				    {function, pass_exped_new}, {line, 159},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~ts的远征通关奖励出错了Id:【~w】",
						 [Role#role.name, Id]),
				   none, 4096, 8, __Levelexpedition159,
				   __Tracesexpedition159, lager_event,
				   __Pidexpedition159);
		  _ -> ok
		end,
		Role
	  end;
      _ -> Role
    end.

match_player_new(Role = #role{id = RoleId,
			      m_expedition =
				  #m_expedition{max_power = MaxPower,
						difficulty = Difficulty}},
		 Id) ->
    MappingPower = case Difficulty of
		     1 ->
			 min(MaxPower,
			     expedition_data:get_const(easy_mapping_power));
		     2 ->
			 min(MaxPower,
			     expedition_data:get_const(difficult_mapping_power));
		     3 ->
			 min(MaxPower,
			     expedition_data:get_const(hell_mapping_power))
		   end,
    {Reward, PowerRange} =
	expedition_data:new_reward({Difficulty, Id,
				    MappingPower}),
    MatchPowers = [{round(MinPowerRatio * MappingPower /
			    1000),
		    round(MaxPowerRatio * MappingPower / 1000)}
		   || {MinPowerRatio, MaxPowerRatio} <- PowerRange],
    case do_match_by_power(MatchPowers, [RoleId]) of
      {ok, L1} ->
	  L2 = [{abs(MappingPower - R#arena_role.power), R}
		|| R <- L1],
	  L3 = lists:sublist(lists:keysort(1, L2), 5),
	  L4 = [R || {_, R} <- L3],
	  gen_expedition_f(Role, Id, util:shuffle(L4), Reward);
      _ -> gen_robot(Role, Id, Reward)
    end.

do_match_by_power([], _ExcludeRoleIds) -> false;
do_match_by_power([{MinPower, MaxPower} | T],
		  ExcludeRoleIds) ->
    MS = [{{arena_role, '_', '_', '_', '_', '_', '_', '_',
	    '$1', '_', '_', '_', '_', '_', '_', '_', '_', '_'},
	   [{'andalso', {'>=', '$1', {const, MinPower}},
	     {'=<', '$1', {const, MaxPower}}}],
	   ['$_']}],
    case ets:select(arena_role, MS, 10) of
      {L1, _} ->
	  case [I
		|| I = #arena_role{id = RoleId} <- L1,
		   not lists:member(RoleId, ExcludeRoleIds)]
	      of
	    L2 = [_ | _] -> {ok, L2};
	    _ -> do_match_by_power(T, ExcludeRoleIds)
	  end;
      _ -> do_match_by_power(T, ExcludeRoleIds)
    end.

gen_expedition_f(Role, Id, [], Reward) ->
    gen_robot(Role, Id, Reward);
gen_expedition_f(Role, Id,
		 [#arena_role{id = TarRoleId, name = Name, lev = Lev,
			      face = Face, power = Power}
		  | T],
		 Reward) ->
    case role_robot:get_role(TarRoleId) of
      {ok, Robot = #role_robot{partners = Partners}} ->
	  #formation_sys{pos_info = PosInfo} =
	      formation:get_sys_formation(Robot, 1),
	  case length(PosInfo) < 4 of
	    true -> gen_expedition_f(Role, Id, T, Reward);
	    _ ->
		#formation_sys{pos_info = PosInfo, type = FormationType,
			       hallows_id = HallowsId} =
		    formation:get_sys_formation(Robot, 1),
		Fun = fun (#formation_pos{pos = Pos, id = PId}) ->
			      #partner{bid = Bid, use_skin = UseSkin,
				       lev = PLev, break_lev = BreakLev,
				       quality = Quality, star = Star,
				       power = PtnPower,
				       all_attr =
					   #attr{speed = Speed, atk = Atk,
						 def = Def, hp_max = HpMax}} =
				  lists:keyfind(PId, #partner.id, Partners),
			      #expedition_f_pos{pos = Pos, id = PId,
						ext = [{5, UseSkin}], bid = Bid,
						break_lev = BreakLev,
						lev = PLev, quality = Quality,
						star = Star, power = PtnPower,
						speed = Speed, atk = Atk,
						def = Def, hp = HpMax}
		      end,
		PList = [Fun(I) || I <- PosInfo],
		HalfAvgPower = formation:get_sys_formation_power(Role,
								 1)
				 / length(PosInfo)
				 / 2,
		case is_under(PList, HalfAvgPower, 0) of
		  true -> gen_expedition_f(Role, Id, T, Reward);
		  false ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidexpedition218, _,
			 {__Levelexpedition218, __Tracesexpedition218}}
			    when __Levelexpedition218 band 128 /= 0 orelse
				   __Tracesexpedition218 /= [] ->
			    lager:do_log(debug,
					 [{module, expedition},
					  {function, gen_expedition_f},
					  {line, 218},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("成功匹配到玩家:~ts==idx:~w power:~w pos_info:~w",
						       [Name, Id, Power,
							PosInfo]),
					 none, 4096, 128, __Levelexpedition218,
					 __Tracesexpedition218, lager_event,
					 __Pidexpedition218);
			_ -> ok
		      end,
		      #expedition_f{id = Id, role_id = TarRoleId, name = Name,
				    lev = Lev, face = Face, power = Power,
				    status = 0, guards = PList,
				    formation_type = FormationType,
				    hallows_id = HallowsId, items = Reward}
		end
	  end;
      _ -> gen_expedition_f(Role, Id, T, Reward)
    end;
gen_expedition_f(Role, Id, _Args, Reward) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidexpedition226, _,
       {__Levelexpedition226, __Tracesexpedition226}}
	  when __Levelexpedition226 band 8 /= 0 orelse
		 __Tracesexpedition226 /= [] ->
	  lager:do_log(error,
		       [{module, expedition}, {function, gen_expedition_f},
			{line, 226}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("远征匹配有些问题 ~w", [_Args]), none, 4096, 8,
		       __Levelexpedition226, __Tracesexpedition226,
		       lager_event, __Pidexpedition226);
      _ -> ok
    end,
    gen_robot(Role, Id, Reward).

gen_robot(Role = #role{partner_bag =
			   #partner_bag{partner_list = PartnerList},
		       m_expedition =
			   #m_expedition{difficulty = Difficulty,
					 max_power = MaxPower}},
	  Id, Reward) ->
    MappingPower = case Difficulty of
		     1 ->
			 min(MaxPower,
			     expedition_data:get_const(easy_mapping_power));
		     2 ->
			 min(MaxPower,
			     expedition_data:get_const(difficult_mapping_power));
		     3 ->
			 min(MaxPower,
			     expedition_data:get_const(hell_mapping_power))
		   end,
    {RobotIds, Powers} = robot_range(Id, MappingPower, 10,
				     Difficulty),
    {MinRatio, MaxRatio} = util:rand_list(Powers),
    PowerRatio = util:rand(MinRatio, MaxRatio),
    Power = round(MappingPower * PowerRatio / 1000),
    {RobotId, _} = util:rand_list(RobotIds, 2),
    Name1 = util:rand_list(random_name_data:arena_list(1)),
    Name2 = util:rand_list(random_name_data:arena_list(2)),
    Name3 = util:rand_list(random_name_data:arena_list(3)),
    Name = <<Name1/binary, Name2/binary, Name3/binary>>,
    MaxNum = max(1, min(5, length(PartnerList))),
    AvgPower = Power div MaxNum,
    #{partners := Partners, formation := FormationType,
      lev := Lev1, face := Face,
      hallows := {HallowsId, _, _}} =
	robot:get(Role, RobotId,
		  #{power => AvgPower, max_num => MaxNum}),
    PList = [#expedition_f_pos{pos = PId,
			       ext = [{5, UseSkin}], id = PId, bid = Bid,
			       lev = PLev, break_lev = BreakLev, star = Star,
			       power = Power1, attr_ratio = PowerRatio,
			       speed = Speed, atk = Atk, def = Def, hp = HpMax}
	     || #partner{id = PId, use_skin = UseSkin, bid = Bid,
			 lev = PLev, break_lev = BreakLev, star = Star,
			 power = Power1,
			 all_attr =
			     #attr{speed = Speed, atk = Atk, def = Def,
				   hp_max = HpMax}}
		    <- Partners],
    ExpedPower = lists:sum([PPower
			    || #partner{power = PPower} <- Partners]),
    #expedition_f{id = Id, name = Name, lev = Lev1,
		  face = Face, formation_type = FormationType,
		  robot_id = RobotId, power = ExpedPower, guards = PList,
		  status = 0, hallows_id = HallowsId, items = Reward}.

is_under(_Partners, _HalfAvgPower, Num) when Num >= 3 ->
    true;
is_under([], _HalfAvgPower, _Num) -> false;
is_under([#expedition_f_pos{power = Power} | T],
	 HalfAvgPower, Num) ->
    case Power < HalfAvgPower of
      true ->
	  NewNum = Num + 1, is_under(T, HalfAvgPower, NewNum);
      false -> is_under(T, HalfAvgPower, Num)
    end.

-spec start_combat(#role{}, pos_integer(),
		   pos_integer(), list()) -> {ok, #role{}} |
					     {false, bitstring()}.

start_combat(Role = #role{id = RoleId,
			  m_expedition =
			      #m_expedition{guard_id = GuardId,
					    difficulty = Difficulty}},
	     FormationType, HallowsId, PosInfo) ->
    case check_can_combat([is_pass, gen_fight], Role,
			  #{pos_info => PosInfo, guard_id => GuardId,
			    formation => FormationType, hallows => HallowsId})
	of
      {false, Reason} -> {false, Reason};
      #{atk_group := AtkGroup, def_group := DefGroup,
	def_formation := BFormationType, target_name := TarName,
	used_employ := UEmploy} ->
	  Now = date:unixtime(),
	  Args = #{on_role_combat_end =>
		       {expedition, combat_over,
			[{Difficulty, GuardId, UEmploy, Now, FormationType,
			  BFormationType}]},
		   formation =>
		       [{1, FormationType, 1}, {2, BFormationType, 1}],
		   target_role_name => TarName,
		   ext_args => [{save_replay, true}]},
	  case combat_lib:start_combat(Role, 21, AtkGroup,
				       [DefGroup], Args)
	      of
	    {false, Reason} -> {false, Reason};
	    {ok, _ComPid} ->
		PosInfo0 = [{Pos, PId}
			    || {Pos, OwnId, OwnSrvId, PId} <- PosInfo,
			       {OwnId, OwnSrvId} =:= RoleId],
		{ok, NRole} = case formation:set_sys_formation(Role, 10,
							       FormationType,
							       PosInfo0,
							       HallowsId)
				  of
				{ok, Role1} -> {ok, Role1};
				_ -> {ok, Role}
			      end,
		#{floor := Floor} = expedition_data:get_ref(GuardId),
		log:save(task,
			 {NRole, 0, Difficulty * 100 + Floor,
			  util:fbin(lang:get(<<"难度~w第~w关"/utf8>>),
				    [Difficulty, Floor]),
			  95, <<"远征"/utf8>>,
			  util:fbin(lang:get(<<"lev:~w,power:~w"/utf8>>),
				    [Role#role.lev, Role#role.power])}),
		{ok, NRole}
	  end;
      _ -> {false, lang:get(<<"发起挑战失败"/utf8>>)}
    end.

gen_def_fight_objects(Role = #role{m_expedition =
				       #m_expedition{difficulty = Difficulty,
						     max_power = MaxPower,
						     guard_id = GuardId}},
		      #expedition_f{role_id = TarRoleId, robot_id = RobotId,
				    power = Power, guards = PosInfo})
    when RobotId > 0 ->
    AttrZoom = expedition_data:robot_attr_zoom({Difficulty,
						GuardId, MaxPower}),
    FOL0 = robot:gen_fight_objects(Role, RobotId,
				   #{power => Power div length(PosInfo),
				     max_num => length(PosInfo),
				     base_ratio => AttrZoom},
				   TarRoleId),
    Fun = fun (FO2 = #fight_object{object_id = OId,
				   object_type = 2}) ->
		  case lists:keyfind(OId, #expedition_f_pos.id, PosInfo)
		      of
		    #expedition_f_pos{lev = PLev} ->
			FO2#fight_object{lev = PLev};
		    _ -> FO2
		  end;
	      (FO3) -> FO3
	  end,
    FOL = [Fun(FO) || FO <- FOL0],
    {ok, FOL};
gen_def_fight_objects(Role = #role{m_expedition =
				       #m_expedition{difficulty = Difficulty,
						     max_power = MaxPower,
						     guard_id = GuardId}},
		      AF = #expedition_f{role_id = TarRoleId,
					 guards = PosInfo,
					 hallows_id = HallowsId}) ->
    case role_robot:get_role(TarRoleId) of
      {ok, Robot} ->
	  AttrZoom = expedition_data:match_attr_zoom({Difficulty,
						      GuardId, MaxPower}),
	  Obj = [gen_def_fight_objects_(P, AF, Robot, Role,
					AttrZoom)
		 || P <- PosInfo],
	  {ok,
	   sprite_tree:gen_fight_object(Robot) ++
	     hallows_lib:gen_fight_object(Robot, HallowsId) ++ Obj};
      _ -> {false, lang:get(<<"获取对方数据失败"/utf8>>)}
    end.

gen_def_fight_objects_(#expedition_f_pos{pos = Pos,
					 id = PId, bid = Bid, lev = Lev,
					 star = Star, speed = Speed, atk = Atk,
					 def = Def, hp = Hp,
					 break_lev = BreakLev},
		       #expedition_f{formation_type = FormationType},
		       #role_robot{id = RoleId, partners = Partners,
				   name = Name},
		       Role, AttrZoom) ->
    #formation_data{pos = FightPos} =
	formation_data:get_formation(FormationType),
    Pos1 = list_util:keyfind(Pos, FightPos),
    P = #partner{all_attr = AllAttr} = case
					 lists:keyfind(PId, #partner.id,
						       Partners)
					   of
					 P0 = #partner{} -> P0;
					 _ ->
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
					       {__Pidexpedition321, _,
						{__Levelexpedition321,
						 __Tracesexpedition321}}
						   when __Levelexpedition321
							  band 64
							  /= 0
							  orelse
							  __Tracesexpedition321
							    /= [] ->
						   lager:do_log(info,
								[{module,
								  expedition},
								 {function,
								  gen_def_fight_objects_},
								 {line, 321},
								 {pid,
								  pid_to_list(self())},
								 {node, node()}
								 | lager:md()],
								io_lib:format("玩家[~ts]伙伴已不存在:~w",
									      [Name,
									       Bid]),
								none, 4096, 64,
								__Levelexpedition321,
								__Tracesexpedition321,
								lager_event,
								__Pidexpedition321);
					       _ -> ok
					     end,
					     BaseData = #partner_base_data{} =
							    partner_data:get_base(Bid),
					     P0 = partner:init_partner(Role,
								       BaseData,
								       PId, Lev,
								       Star),
					     partner_lib:calc_attr(Role,
								   P0#partner{break_lev
										  =
										  BreakLev})
				       end,
    AllAttrT = AllAttr#attr{speed = Speed, atk = Atk,
			    def = Def, hp = Hp, hp_max = Hp},
    NewAllAttr = attr_calc:base_ratio(AttrZoom, AllAttrT),
    P1 = P#partner{all_attr = NewAllAttr, lev = Lev,
		   star = Star, break_lev = BreakLev},
    FO1 = partner_lib:gen_fight_object(RoleId, 0, P1,
				       combat_lib:is_leader(Pos), RoleId, 1),
    FO1#fight_object{pos = Pos1}.

get_fight_object([], _Role, L, UEmployL, _PartnerHp,
		 _PosInfo, _PBids) ->
    {ok, L, UEmployL};
get_fight_object([{_, _, _, 0} | T], Role, L, UEmployL,
		 PartnerHp, PosInfo, PBids) ->
    get_fight_object(T, Role, L, UEmployL, PartnerHp,
		     PosInfo, PBids);
get_fight_object([{Pos, Rid, SrvId, Id} | T],
		 Role = #role{id = RoleId}, L, UEmployL, PartnerHp,
		 PosInfo, PBids)
    when {Rid, SrvId} =:= RoleId orelse
	   {Rid, SrvId} =:= {0, <<>>} ->
    case [1
	  || {Pos2, Rid2, SrvId2, Id2} <- T, Id2 > 0,
	     Pos =:= Pos2 orelse
	       Id =:= Id2 andalso {Rid2, SrvId2} =:= RoleId]
	of
      [] ->
	  case partner_lib:get_partner(Role, Id) of
	    false ->
		get_fight_object(T, Role, L, PartnerHp, UEmployL,
				 PosInfo, PBids);
	    #partner{end_time = EndTime} when EndTime =/= 0 ->
		{false, lang:get(<<"赋能英雄无法参与远征"/utf8>>)};
	    Partner = #partner{bid = Bid} ->
		case lists:member(Bid, PBids) of
		  false ->
		      FO1 = partner_lib:gen_fight_object(Role, Partner,
							 combat_lib:is_leader(Pos)),
		      #formation_fight_info{fight_pos = FightPos} =
			  lists:keyfind(Pos, #formation_fight_info.pos,
					PosInfo),
		      FO2 = #fight_object{hp_max = HpMax} =
				FO1#fight_object{pos = FightPos},
		      case lists:keyfind(Id, 1, PartnerHp) of
			{_, 0} ->
			    get_fight_object(T, Role, L, UEmployL, PartnerHp,
					     PosInfo, [Bid | PBids]);
			{Id, HpPer} ->
			    get_fight_object(T, Role,
					     [FO2#fight_object{hp =
								   round(HpPer *
									   HpMax
									   /
									   100)}
					      | L],
					     UEmployL, PartnerHp, PosInfo,
					     [Bid | PBids]);
			_ ->
			    get_fight_object(T, Role, [FO2 | L], UEmployL,
					     PartnerHp, PosInfo, [Bid | PBids])
		      end;
		  _ -> {false, lang:get(<<"不能上阵重复英雄"/utf8>>)}
		end
	  end;
      _ -> {false, lang:get(<<"不能上阵重复英雄"/utf8>>)}
    end;
get_fight_object([{Pos, Rid, SrvId, Id} | T],
		 Role = #role{id = RoleId,
			      m_expedition = #m_expedition{employ = EmployL}},
		 L, UEmployL, PartnerHp, PosInfo, PBids) ->
    case [1
	  || {Pos2, Rid2, SrvId2, Id2} <- T, Id2 > 0,
	     Pos =:= Pos2 orelse
	       {Rid, SrvId, Id} =:= {Rid2, SrvId2, Id2}]
	of
      [] ->
	  case lists:keyfind({{Rid, SrvId}, Id}, 1, EmployL) of
	    false ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidexpedition369, _,
		   {__Levelexpedition369, __Tracesexpedition369}}
		      when __Levelexpedition369 band 8 /= 0 orelse
			     __Tracesexpedition369 /= [] ->
		      lager:do_log(error,
				   [{module, expedition},
				    {function, get_fight_object}, {line, 369},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~w的支援英雄 {~w, ~w} ~w 不存在了3",
						 [RoleId, Rid, SrvId, Id]),
				   none, 4096, 8, __Levelexpedition369,
				   __Tracesexpedition369, lager_event,
				   __Pidexpedition369);
		  _ -> ok
		end,
		{false, lang:get(<<"支援英雄不存在"/utf8>>)};
	    {_, RName, Bid, PLev, Star, BreakLev, Power, 0, Ext} ->
		case lists:member(Bid, PBids) of
		  false ->
		      Fun = fun (#fight_object{master_id = MasterId})
				    when MasterId =/= RoleId ->
				    true;
				(_) -> false
			    end,
		      case lists:any(Fun, L) of
			false ->
			    Partner = case role_robot:get_partner({Rid, SrvId},
								  Id)
					  of
					{ok, P2 = #partner{}} -> P2;
					_ ->
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
					      {__Pidexpedition383, _,
					       {__Levelexpedition383,
						__Tracesexpedition383}}
						  when __Levelexpedition383 band
							 64
							 /= 0
							 orelse
							 __Tracesexpedition383
							   /= [] ->
						  lager:do_log(info,
							       [{module,
								 expedition},
								{function,
								 get_fight_object},
								{line, 383},
								{pid,
								 pid_to_list(self())},
								{node, node()}
								| lager:md()],
							       io_lib:format("玩家[~ts]英雄已不存在:~w",
									     [RName,
									      Bid]),
							       none, 4096, 64,
							       __Levelexpedition383,
							       __Tracesexpedition383,
							       lager_event,
							       __Pidexpedition383);
					      _ -> ok
					    end,
					    BaseData = #partner_base_data{} =
							   partner_data:get_base(Bid),
					    P0 = partner:init_partner(Role,
								      BaseData,
								      Id),
					    partner_lib:calc_attr(Role,
								  P0#partner{lev
										 =
										 PLev,
									     star
										 =
										 Star,
									     break_lev
										 =
										 BreakLev,
									     power
										 =
										 Power,
									     use_skin
										 =
										 list_util:keyfind(5,
												   Ext,
												   0)})
				      end,
			    FO1 = partner_lib:gen_fight_object({Rid, SrvId},
							       self(), Partner,
							       combat_lib:is_leader(Pos),
							       {Rid, SrvId}, 0),
			    #formation_fight_info{fight_pos = FightPos} =
				lists:keyfind(Pos, #formation_fight_info.pos,
					      PosInfo),
			    FO2 = #fight_object{hp_max = HpMax} =
				      FO1#fight_object{pos = FightPos},
			    case lists:keyfind({{Rid, SrvId}, Id}, 1, PartnerHp)
				of
			      {_, 0} ->
				  get_fight_object(T, Role, L, UEmployL,
						   PartnerHp, PosInfo,
						   [Bid | PBids]);
			      {Id, HpPer} ->
				  get_fight_object(T, Role,
						   [FO2#fight_object{hp =
									 round(HpPer
										 *
										 HpMax
										 /
										 100)}
						    | L],
						   [{{Rid, SrvId}, Id}
						    | UEmployL],
						   PartnerHp, PosInfo,
						   [Bid | PBids]);
			      _ ->
				  get_fight_object(T, Role, [FO2 | L],
						   [{{Rid, SrvId}, Id}
						    | UEmployL],
						   PartnerHp, PosInfo,
						   [Bid | PBids])
			    end;
			_ -> {false, lang:get(<<"每次只能上阵一个支援英雄"/utf8>>)}
		      end;
		  _ -> {false, lang:get(<<"不能上阵重复英雄"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"已经使用过该支援英雄了"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"不能上阵重复英雄"/utf8>>)}
    end.

check_can_combat([is_pass | Other],
		 Role = #role{m_expedition = #m_expedition{list = List}},
		 Cache = #{guard_id := GuardId}) ->
    case lists:keyfind(GuardId, #expedition_f.id, List) of
      #expedition_f{type = 1, status = 2} ->
	  {false, lang:get(<<"该关卡已挑战"/utf8>>)};
      Ef = #expedition_f{type = 1, partner_hp = PartnerHp,
			 name = TarName, formation_type = BFormationType} ->
	  case gen_def_fight_objects(Role, Ef) of
	    {false, Reason} -> {false, Reason};
	    {ok, DefGroup0} ->
		DefGroup = combat_lib:init_fight_object_hp(DefGroup0,
							   PartnerHp),
		check_can_combat(Other, Role,
				 Cache#{def_group => DefGroup,
					target_name => TarName,
					def_formation => BFormationType})
	  end;
      _ -> {false, lang:get(<<"该关卡无法挑战"/utf8>>)}
    end;
check_can_combat([formation | Other],
		 Role = #role{m_formation = #m_formation{list = List}},
		 Cache = #{formation := FormationType}) ->
    case lists:keyfind(FormationType, 1, List) of
      false -> {false, lang:get(<<"相关阵法不存在或未激活"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([gen_fight | Other],
		 Role = #role{m_expedition =
				  #m_expedition{partner_hp = PartnerHp}},
		 Cache = #{formation := FormationType,
			   pos_info := PosInfo, hallows := Hallows}) ->
    FightPos = formation_lib:gen_fight_pos(PosInfo,
					   FormationType),
    case get_fight_object(PosInfo, Role, [], [], PartnerHp,
			  FightPos, [])
	of
      {false, Msg} -> {false, Msg};
      {ok, [], _} -> {false, lang:get(<<"至少上阵一个英雄"/utf8>>)};
      {ok, AtkGroup, UEmploy} ->
	  NewAtkGroup = sprite_tree:gen_fight_object(Role) ++
			  hallows_lib:gen_fight_object(Role, Hallows) ++
			    AtkGroup,
	  check_can_combat(Other, Role,
			   Cache#{atk_group => NewAtkGroup,
				  used_employ => UEmploy});
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidexpedition445, _,
	     {__Levelexpedition445, __Tracesexpedition445}}
		when __Levelexpedition445 band 8 /= 0 orelse
		       __Tracesexpedition445 /= [] ->
		lager:do_log(error,
			     [{module, expedition},
			      {function, check_can_combat}, {line, 445},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "远征生成英雄失败", none, 4096, 8, __Levelexpedition445,
			     __Tracesexpedition445, lager_event,
			     __Pidexpedition445);
	    _ -> ok
	  end,
	  {false, lang:get(<<"英雄生成失败"/utf8>>)}
    end;
check_can_combat([], _Role, Cache) -> Cache.

-spec combat_over(#role{}, #combat_result{}, #combat{},
		  tuple()) -> {ok, #role{}, list()}.

combat_over(Role = #role{id = RoleId,
			 max_power = MaxPower,
			 m_expedition =
			     MExpedition = #m_expedition{guard_id = GuardId,
							 partner_hp = PartnerHp,
							 list = List,
							 employ = EmployL,
							 max_difficulty =
							     MaxDifficulty}},
	    CombatResult = #combat_result{result = 1,
					  a_stat_info = ARemainHp,
					  hurt_statistics = HurtStatistics},
	    Combat,
	    {Difficulty, Id, UEmployL, CombatTime, FormationType,
	     BFormationType}) ->
    Now = date:unixtime(),
    case date:is_same_day(CombatTime, Now) of
      true ->
	  case lists:keyfind(Id, #expedition_f.id, List) of
	    ExpeditionF = #expedition_f{role_id = TarId,
					guards = Guards, items = Items,
					name = BName, lev = BLev} ->
		#{floor := Floor} = expedition_data:get_ref(Id),
		TargetPartnerHp = [{PId, 0}
				   || #expedition_f_pos{id = PId} <- Guards],
		NewExpeditionF = ExpeditionF#expedition_f{status = 2,
							  partner_hp =
							      TargetPartnerHp},
		NewList = lists:keyreplace(Id, #expedition_f.id, List,
					   NewExpeditionF),
		NewEmployL = [{EId, RName, Bid, PLev, Star, BreakLev,
			       Power,
			       util:if_true(lists:member(EId, UEmployL), 1,
					    Flag),
			       Ext}
			      || {EId, RName, Bid, PLev, Star, BreakLev, Power,
				  Flag, Ext}
				     <- EmployL],
		NewPartnerHp = merge_partner_hp(ARemainHp, RoleId,
						PartnerHp),
		NewMaxDifficulty = util:if_true(Floor >= 15 andalso
						  Difficulty > MaxDifficulty,
						Difficulty, MaxDifficulty),
		NewMexpedition = MExpedition#m_expedition{guard_id =
							      GuardId + 1,
							  list = NewList,
							  partner_hp =
							      NewPartnerHp,
							  employ = NewEmployL,
							  max_difficulty =
							      NewMaxDifficulty},
		Role1 = Role#role{m_expedition = NewMexpedition},
		NewItems = case is_open_holiday(Role) of
			     1 ->
				 AddItems = [{ItemId, util:ufloor(Num * 1.0e-1)}
					     || {ItemId, Num} <- Items,
						ItemId =:= 25],
				 item_lib:merge(AddItems, Items);
			     _ -> Items
			   end,
		{ok, Role2, RewardItems} =
		    drop_lib:gain_combat_drop(Role1, Combat, 1, NewItems,
					      <<"远征"/utf8>>,
					      util:fbin("远征通关难度Id[~w][~w] ",
							[Difficulty, Id])),
		Role3 = role_trigger:fire([#evt_expedition_fight{round =
								     Floor,
								 difficulty =
								     Difficulty},
					   #evt_expedition_fight_count{},
					   #r_evt_expedition_pass{cache =
								      #{difficulty
									    =>
									    Difficulty,
									floor =>
									    Floor}}],
					  Role2),
		NewRole = pass_exped_new(Role3),
		LogData = to_log(NewRole, CombatResult, TarId, BName,
				 BLev, FormationType, BFormationType,
				 Difficulty, GuardId, HurtStatistics),
		expedition_mgr:info({add_log, RoleId, GuardId,
				     LogData}),
		push_base_info(NewRole),
		push_red_point(NewRole),
		expedition_employ:push_partner_info(NewRole),
		log:save(join,
			 {NewRole, <<"功能玩法"/utf8>>, <<"远征"/utf8>>}),
		log:save(task,
			 {NewRole, 1, Difficulty * 100 + Floor,
			  util:fbin(lang:get(<<"难度~w第~w关"/utf8>>),
				    [Difficulty, Floor]),
			  95, <<"远征"/utf8>>,
			  util:fbin(lang:get(<<"lev:~w,power:~w"/utf8>>),
				    [Role#role.lev, Role#role.power])}),
		{ok, NewRole, RewardItems};
	    _D ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidexpedition488, _,
		   {__Levelexpedition488, __Tracesexpedition488}}
		      when __Levelexpedition488 band 8 /= 0 orelse
			     __Tracesexpedition488 /= [] ->
		      lager:do_log(error,
				   [{module, expedition},
				    {function, combat_over}, {line, 488},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("【~ts】的远征关卡【~w】消失了",
						 [Role#role.name, GuardId]),
				   none, 4096, 8, __Levelexpedition488,
				   __Tracesexpedition488, lager_event,
				   __Pidexpedition488);
		  _ -> ok
		end,
		ok
	  end;
      _ ->
	  {Reward, _} = expedition_data:new_reward({Difficulty,
						    Id, MaxPower}),
	  NewReward = case is_open_holiday(Role) of
			1 ->
			    AddReward = [{ItemId, util:ufloor(Num * 1.0e-1)}
					 || {ItemId, Num} <- Reward,
					    ItemId =:= 25],
			    item_lib:merge(AddReward, Reward);
			_ -> Reward
		      end,
	  {ok, Role1, RewardItems} =
	      drop_lib:gain_combat_drop(Role, Combat, 1, NewReward,
					<<"远征"/utf8>>,
					util:fbin("重置后远征通关难度Id[~w][~w] ",
						  [Difficulty, Id])),
	  #{floor := Floor} = expedition_data:get_ref(Id),
	  NewRole = role_trigger:fire([#evt_expedition_fight{round
								 = Floor,
							     difficulty =
								 Difficulty,
							     is_rank = 0},
				       #evt_expedition_fight_count{},
				       #r_evt_expedition_pass{cache =
								  #{difficulty
									=>
									Difficulty,
								    floor =>
									Floor}}],
				      Role1),
	  log:save(join,
		   {NewRole, <<"功能玩法"/utf8>>, <<"远征"/utf8>>}),
	  log:save(task,
		   {NewRole, 1, Difficulty * 100 + Floor,
		    util:fbin(lang:get(<<"难度~w第~w关"/utf8>>),
			      [Difficulty, Floor]),
		    95, <<"远征"/utf8>>,
		    util:fbin(lang:get(<<"lev:~w,power:~w"/utf8>>),
			      [Role#role.lev, Role#role.power])}),
	  push_base_info(NewRole),
	  push_red_point(NewRole),
	  {ok, NewRole, RewardItems}
    end;
combat_over(Role = #role{id = RoleId,
			 m_expedition =
			     MExpedition = #m_expedition{guard_id = GuardId,
							 partner_hp = PartnerHp,
							 list = List,
							 employ = EmployL,
							 max_difficulty =
							     MaxDifficulty}},
	    CombatResult = #combat_result{a_stat_info = ARemainHp,
					  b_stat_info = BRemainHp,
					  hurt_statistics = HurtStatistics},
	    Combat,
	    {Difficulty, Id, UEmployL, CombatTime, FormationType,
	     BFormationType}) ->
    Now = date:unixtime(),
    case date:is_same_day(CombatTime, Now) of
      true ->
	  case lists:keyfind(Id, #expedition_f.id, List) of
	    ExpeditionF = #expedition_f{role_id = TarId,
					partner_hp = TarPartnerHp,
					items = Items, name = BName,
					lev = BLev} ->
		#{floor := Floor} = expedition_data:get_ref(Id),
		NewTarPartnerHp = merge_target_hp(BRemainHp,
						  TarPartnerHp),
		NewExpeditionF = ExpeditionF#expedition_f{partner_hp =
							      NewTarPartnerHp},
		case check_is_all_dead(NewExpeditionF) of
		  true ->
		      #{floor := Floor} = expedition_data:get_ref(Id),
		      NewExpeditionF0 = NewExpeditionF#expedition_f{status =
									2},
		      NewList = lists:keyreplace(Id, #expedition_f.id, List,
						 NewExpeditionF0),
		      NewEmployL = [{EId, RName, Bid, PLev, Star, BreakLev,
				     Power,
				     util:if_true(lists:member(EId, UEmployL),
						  1, Flag),
				     Ext}
				    || {EId, RName, Bid, PLev, Star, BreakLev,
					Power, Flag, Ext}
					   <- EmployL],
		      NewPartnerHp = merge_partner_hp(ARemainHp, RoleId,
						      PartnerHp),
		      NewMaxDifficulty = util:if_true(Floor >= 15 andalso
							Difficulty >
							  MaxDifficulty,
						      Difficulty,
						      MaxDifficulty),
		      NewMexpedition = MExpedition#m_expedition{guard_id =
								    GuardId + 1,
								list = NewList,
								partner_hp =
								    NewPartnerHp,
								employ =
								    NewEmployL,
								max_difficulty =
								    NewMaxDifficulty},
		      Role1 = Role#role{m_expedition = NewMexpedition},
		      NewItems = case is_open_holiday(Role) of
				   1 ->
				       AddItems = [{ItemId,
						    util:ufloor(Num * 1.0e-1)}
						   || {ItemId, Num} <- Items,
						      ItemId =:= 25],
				       item_lib:merge(AddItems, Items);
				   _ -> Items
				 end,
		      {ok, Role2, RewardItems} =
			  drop_lib:gain_combat_drop(Role1, Combat, 1, NewItems,
						    <<"远征"/utf8>>,
						    util:fbin("远征通关难度Id[~w][~w] ",
							      [Difficulty,
							       Id])),
		      Role3 = role_trigger:fire([#evt_expedition_fight{round =
									   Floor,
								       difficulty
									   =
									   Difficulty},
						 #r_evt_expedition_pass{cache =
									    #{difficulty
										  =>
										  Difficulty,
									      floor
										  =>
										  Floor}}],
						Role2),
		      NewRole = pass_exped_new(Role3),
		      LogData = to_log(NewRole, CombatResult, TarId, BName,
				       BLev, FormationType, BFormationType,
				       Difficulty, GuardId, HurtStatistics),
		      expedition_mgr:info({add_log, RoleId, GuardId,
					   LogData}),
		      push_base_info(NewRole),
		      push_red_point(NewRole),
		      expedition_employ:push_partner_info(NewRole),
		      log:save(join,
			       {NewRole, <<"功能玩法"/utf8>>, <<"远征"/utf8>>}),
		      log:save(task,
			       {NewRole, 1, Difficulty * 100 + Floor,
				util:fbin(lang:get(<<"难度~w第~w关"/utf8>>),
					  [Difficulty, Floor]),
				95, <<"远征"/utf8>>,
				util:fbin(lang:get(<<"lev:~w,power:~w"/utf8>>),
					  [Role#role.lev, Role#role.power])}),
		      {ok, NewRole, RewardItems};
		  _ ->
		      NewList = lists:keyreplace(Id, #expedition_f.id, List,
						 NewExpeditionF),
		      NewPartnerHp = merge_partner_hp(ARemainHp, RoleId,
						      PartnerHp),
		      NewMexpedition = MExpedition#m_expedition{list =
								    NewList,
								partner_hp =
								    NewPartnerHp},
		      NewRole = Role#role{m_expedition = NewMexpedition},
		      LogData = to_log(NewRole, CombatResult, TarId, BName,
				       BLev, FormationType, BFormationType,
				       Difficulty, GuardId, HurtStatistics),
		      expedition_mgr:info({add_log, RoleId, GuardId,
					   LogData}),
		      push_base_info(NewRole),
		      push_red_point(NewRole),
		      expedition_employ:push_partner_info(NewRole),
		      log:save(join,
			       {NewRole, <<"功能玩法"/utf8>>, <<"远征"/utf8>>}),
		      log:save(task,
			       {NewRole, 2, Difficulty * 100 + Floor,
				util:fbin(lang:get(<<"难度~w第~w关"/utf8>>),
					  [Difficulty, Floor]),
				95, <<"远征"/utf8>>,
				util:fbin(lang:get(<<"lev:~w,power:~w"/utf8>>),
					  [Role#role.lev, Role#role.power])}),
		      {ok, NewRole}
		end;
	    _D ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidexpedition561, _,
		   {__Levelexpedition561, __Tracesexpedition561}}
		      when __Levelexpedition561 band 8 /= 0 orelse
			     __Tracesexpedition561 /= [] ->
		      lager:do_log(error,
				   [{module, expedition},
				    {function, combat_over}, {line, 561},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("【~ts】的远征关卡【~w】消失了",
						 [Role#role.name, Id]),
				   none, 4096, 8, __Levelexpedition561,
				   __Tracesexpedition561, lager_event,
				   __Pidexpedition561);
		  _ -> ok
		end,
		ok
	  end;
      _ ->
	  #{floor := Floor} = expedition_data:get_ref(Id),
	  log:save(join, {Role, <<"功能玩法"/utf8>>, <<"远征"/utf8>>}),
	  log:save(task,
		   {Role, 2, Difficulty * 100 + Floor,
		    util:fbin(lang:get(<<"难度~w第~w关"/utf8>>),
			      [Difficulty, Floor]),
		    95, <<"远征"/utf8>>,
		    util:fbin(lang:get(<<"lev:~w,power:~w"/utf8>>),
			      [Role#role.lev, Role#role.power])}),
	  ok
    end.

merge_partner_hp([], _RoleId, PList) -> PList;
merge_partner_hp([#{master_id := RoleId,
		    object_id := PId, hp := Hp, hp_max := HpMax}
		  | T],
		 RoleId, PList) ->
    merge_partner_hp(T, RoleId,
		     lists:keystore(PId, 1, PList,
				    {PId, util:ceil(Hp * 100 / HpMax)}));
merge_partner_hp([#{master_id := MasterId,
		    object_id := PId, hp := Hp, hp_max := HpMax}
		  | T],
		 RoleId, PList) ->
    FPId = {MasterId, PId},
    merge_partner_hp(T, RoleId,
		     lists:keystore(FPId, 1, PList,
				    {FPId, util:ceil(Hp * 100 / HpMax)})).

merge_target_hp([], PList) -> PList;
merge_target_hp([#{object_id := PId, hp := Hp,
		   hp_max := HpMax}
		 | T],
		PList) ->
    merge_target_hp(T,
		    lists:keystore(PId, 1, PList,
				   {PId, util:ceil(Hp * 100 / HpMax)})).

check_is_all_dead(#expedition_f{guards = Guards,
				partner_hp = PartnerHp, type = 1}) ->
    Fun = fun (#expedition_f_pos{id = Id}) ->
		  case lists:keyfind(Id, 1, PartnerHp) of
		    {_, 0} -> true;
		    _ -> false
		  end
	  end,
    lists:all(Fun, Guards);
check_is_all_dead(_) -> false.

-spec get_ext_reward(#role{},
		     Id :: pos_integer()) -> {ok, #role{}} |
					     {false, binary()}.

get_ext_reward(Role = #role{m_expedition =
				MExpedition = #m_expedition{list = List}},
	       Id) ->
    case lists:keyfind(Id, #expedition_f.id, List) of
      Ef = #expedition_f{status = 1, type = 2,
			 items = Items} ->
	  NewItems = case is_open_holiday(Role) of
		       1 ->
			   AddItems = [{ItemId, util:ufloor(Num * 1.0e-1)}
				       || {ItemId, Num} <- Items,
					  ItemId =:= 25],
			   item_lib:merge(AddItems, Items);
		       _ -> Items
		     end,
	  GL = format:val_to_gain(NewItems, expedition),
	  case role_gain:do_notice(Role, GL) of
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, Role1} ->
		NewEf = Ef#expedition_f{status = 2},
		NewList = lists:keystore(Id, #expedition_f.id, List,
					 NewEf),
		NRole = Role1#role{m_expedition =
				       MExpedition#m_expedition{list =
								    NewList}},
		log:log_gain(GL, Role, NRole, <<"远征"/utf8>>,
			     util:fbin("远征阶段奖励id:~w", [Id])),
		push_base_info(NRole),
		NewRole = role_trigger:fire(#evt_expedition_open_box{},
					    NRole),
		{ok, NewRole}
	  end;
      #expedition_f{status = 2, type = 2} ->
	  {false, lang:get(<<"奖励已领取"/utf8>>)};
      _ -> {false, lang:get(<<"领取条件未达成"/utf8>>)}
    end.

-spec get_target_info(#role{}, role_id()) -> {ok,
					      tuple()} |
					     {false, binary()}.

get_target_info(Role = #role{m_expedition =
				 #m_expedition{list = RefList}},
		Id) ->
    case lists:keyfind(Id, #expedition_f.id, RefList) of
      #expedition_f{role_id = {Rid, SrvId}, name = Name,
		    lev = Lev, face = Face, power = Power, guards = PosInfo,
		    partner_hp = PartnerHp, items = Items, type = 1,
		    status = Status} ->
	  PList = [{Pos, Bid, PLev, Star,
		    list_util:keyfind(PId, PartnerHp, 100), Ext}
		   || #expedition_f_pos{ext = Ext, pos = Pos, id = PId,
					bid = Bid, lev = PLev, star = Star}
			  <- PosInfo],
	  NewItems = case is_open_holiday(Role) of
		       1 ->
			   AddItems = [{ItemId, util:ufloor(Num * 1.0e-1)}
				       || {ItemId, Num} <- Items,
					  ItemId =:= 25],
			   item_lib:merge(AddItems, Items);
		       _ -> Items
		     end,
	  {ok,
	   {Id, Rid, SrvId, Name, Face, Lev, Power, PList,
	    NewItems, is_open_holiday(Role), Status}};
      #expedition_f{type = 2, items = Items,
		    status = Status} ->
	  NewItems = case is_open_holiday(Role) of
		       1 ->
			   AddItems = [{ItemId, util:ufloor(Num * 1.0e-1)}
				       || {ItemId, Num} <- Items,
					  ItemId =:= 25],
			   item_lib:merge(AddItems, Items);
		       _ -> Items
		     end,
	  {ok,
	   {Id, 0, <<>>, <<>>, 0, 0, 0, [], NewItems,
	    is_open_holiday(Role), Status}};
      _ -> {false, lang:get(<<"请先通关前置关卡"/utf8>>)}
    end.

-spec get_formation(#role{}, pos_integer()) -> tuple().

get_formation(Role = #role{m_expedition =
			       #m_expedition{partner_hp = PList}},
	      SysType) ->
    #formation_sys{type = FormationType, pos_info = PosInfo,
		   hallows_id = HallowsId} =
	formation:get_sys_formation(Role, SysType),
    DiePIds = [PId || {PId, 0} <- PList],
    NewPosInfo = [I
		  || I <- PosInfo,
		     not lists:member(I#formation_pos.id, DiePIds)],
    {FormationType, NewPosInfo, HallowsId}.

robot_range(Id, _Power, 0, Difficulty) ->
    expedition_data:new_robot({Difficulty, Id, 999999});
robot_range(Id, Power, Num, Difficulty) ->
    case expedition_data:new_robot({Difficulty, Id, Power})
	of
      Info = {_, _} -> Info;
      _ -> robot_range(Id, Power + 5000, Num - 1, Difficulty)
    end.

-spec choose_difficulty(#role{},
			pos_integer()) -> {false, binary()} | {ok, #role{}}.

choose_difficulty(Role = #role{max_power = MaxPower,
			       m_expedition =
				   MExpedition = #m_expedition{max_power =
								   OldMaxPower,
							       difficulty =
								   OldDiff,
							       max_difficulty =
								   MaxDifficulty,
							       last_join_time =
								   LastJoinTime,
							       last_difficulty =
								   {LastDifficulty,
								    LastGuardId}}},
		  Difficulty) ->
    if OldDiff =/= 0 -> {false, lang:get(<<"难度已选择"/utf8>>)};
       Difficulty > MaxDifficulty + 1 ->
	   {false, lang:get(<<"请先通关前置难度"/utf8>>)};
       true ->
	   case
	     role_misc:check_open_cond(dailyplay_data:get_cond(3),
				       Role)
	       of
	     true ->
		 case expedition_data:power_limit(Difficulty) of
		   LimitPower
		       when is_integer(LimitPower) andalso
			      MaxPower >= LimitPower ->
		       Now = date:unixtime(),
		       LastFloorId = pass_floor(LastGuardId),
		       AutoFloorId = max(0,
					 LastFloorId -
					   expedition_data:get_const(regression_level)),
		       AutoId = case date:day_diff(LastJoinTime, Now) =< 1
				       andalso LastDifficulty =:= Difficulty
				    of
				  true ->
				      expedition_data:floor_to_id(AutoFloorId);
				  _ -> 0
				end,
		       NewMaxPower = util:if_true(OldMaxPower =:= 0, MaxPower,
						  OldMaxPower),
		       NRole = Role#role{m_expedition =
					     MExpedition#m_expedition{difficulty
									  =
									  Difficulty,
								      guard_id =
									  AutoId
									    + 1,
								      last_join_time
									  =
									  date:unixtime(),
								      max_power
									  =
									  NewMaxPower}},
		       {NRole1, Reward} = create_exped_new(NRole, Difficulty,
							   AutoId),
		       NewReward = case is_open_holiday(Role) of
				     1 ->
					 AddItems = [{ItemId,
						      util:ufloor(Num * 1.0e-1)}
						     || {ItemId, Num} <- Reward,
							ItemId =:= 25],
					 item_lib:merge(AddItems, Reward);
				     _ -> Reward
				   end,
		       NRole2 = case NewReward of
				  [_ | _] ->
				      GL = format:val_to_gain(NewReward,
							      auto_expedition),
				      case role_gain:do(NRole1, GL) of
					{ok, NRoleT} ->
					    log:log_gain(GL, Role, NRoleT,
							 <<"远征"/utf8>>,
							 util:fbin("远征自动扫荡关卡:~w, 难度:~w, id:~w",
								   [AutoFloorId,
								    Difficulty,
								    AutoId])),
					    sys_conn:pack_send(24414,
							       {AutoId + 1,
								AutoFloorId,
								NewReward}),
					    role_trigger:fire([#evt_expedition_fight{round
											 =
											 AutoFloorId,
										     difficulty
											 =
											 Difficulty,
										     count
											 =
											 AutoFloorId},
							       #evt_expedition_fight_count{count
											       =
											       AutoFloorId}],
							      NRoleT);
					_ ->
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
					      {__Pidexpedition711, _,
					       {__Levelexpedition711,
						__Tracesexpedition711}}
						  when __Levelexpedition711 band
							 8
							 /= 0
							 orelse
							 __Tracesexpedition711
							   /= [] ->
						  lager:do_log(error,
							       [{module,
								 expedition},
								{function,
								 choose_difficulty},
								{line, 711},
								{pid,
								 pid_to_list(self())},
								{node, node()}
								| lager:md()],
							       io_lib:format("~ts自动扫荡远征获取~w出错~w ~w",
									     [Role#role.name,
									      NewReward,
									      AutoFloorId,
									      AutoId]),
							       none, 4096, 8,
							       __Levelexpedition711,
							       __Tracesexpedition711,
							       lager_event,
							       __Pidexpedition711);
					      _ -> ok
					    end,
					    NRole1
				      end;
				  _ -> NRole1
				end,
		       NewRole = pass_exped_new(NRole2),
		       push_base_info(NewRole),
		       {ok, NewRole};
		   _ -> {false, lang:get(<<"未达到战力要求"/utf8>>)}
		 end;
	     _ -> {false, lang:get(<<"未达到开启条件"/utf8>>)}
	   end
    end.

-spec can_skip_combat(#role{}) -> true |
				  {false, binary()}.

can_skip_combat(#role{m_expedition =
			  #m_expedition{difficulty = Difficulty}}) ->
    case Difficulty >= 2 of
      true -> true;
      _ ->
	  {false,
	   util:fbin(lang:get(<<"只有地狱和困难模式和才能跳过战斗"/utf8>>), [])}
    end.

is_open_holiday(Role) ->
    case holiday_lib:get_open_holiday(Role,
				      [7004, 97004, 997004])
	of
      #holiday{end_time = EndTime} ->
	  case EndTime - date:unixtime() - 86400 > 0 of
	    true -> 1;
	    _ -> 0
	  end;
      _ -> 0
    end.

pass_floor(Id) when Id =< 0 -> 0;
pass_floor(Id) ->
    case expedition_data:id_to_floor(Id) of
      FloorId when is_integer(FloorId) -> FloorId;
      _ -> pass_floor(Id - 1)
    end.

to_log(#role{id = RoleId, name = AName, lev = ALev},
       #combat_result{action_count = ActionCount,
		      replay_id = ReplayId, a_stat_info = AStatInfo,
		      b_stat_info = BStatInfo, result = ResultT},
       TarId, BName, BLev, FormationType, BFormationType,
       Difficulty, GuardId, HurtStatistics) ->
    {APower, APlist, AEndHp} = to_p_list(AStatInfo),
    {BPower, BPlist, BEndHp} = to_p_list(BStatInfo),
    #expedition_replay{id = ReplayId, round = ActionCount,
		       ret = ResultT, time = date:unixtime(),
		       difficulty = Difficulty, guard_id = GuardId,
		       a_id = RoleId, a_name = AName, a_lev = ALev,
		       a_power = APower, a_formation_type = FormationType,
		       a_end_hp = AEndHp, b_id = TarId, b_name = BName,
		       b_lev = BLev, b_power = BPower,
		       b_formation_type = BFormationType, b_end_hp = BEndHp,
		       a_plist = APlist, b_plist = BPlist,
		       ext = [{1, HurtStatistics}]}.

to_p_list(StatInfo) ->
    Fun = fun (#{pos := Pos, extra_data := ExtraData,
		 star := Star, power := Power, lev := Lev,
		 object_bid := ObjectBid, hp := Hp, hp_max := HpMax},
	       {Acc1, Acc2, Acc3, Acc4}) ->
		  ReplayP = #expedition_replay_partner{pos =
							   combat_target:logic_pos(Pos),
						       bid = ObjectBid,
						       lev = Lev, star = Star,
						       ext =
							   [{5,
							     list_util:keyfind(5,
									       ExtraData,
									       0)}]},
		  {Acc1 + Power, [ReplayP | Acc2], Acc3 + Hp,
		   Acc4 + HpMax}
	  end,
    {AllPower, PList, AllHp, AllMaxHp} = lists:foldl(Fun,
						     {0, [], 0, 0}, StatInfo),
    {AllPower, PList, util:ceil(AllHp * 100 / AllMaxHp)}.

-spec get_log(role_id(),
	      pos_integer()) -> #expedition_log{}.

get_log(RoleId, GuardId) ->
    case ets:lookup(expedition_log, {RoleId, GuardId}) of
      [Log] -> Log;
      _ ->
	  case dets:lookup(expedition_log, {RoleId, GuardId}) of
	    [Log] -> ets:insert(expedition_log, Log), Log;
	    [] ->
		Log = #expedition_log{id = {RoleId, GuardId}},
		ets:insert(expedition_log, Log),
		Log
	  end
    end.

-spec push_log_info(#role{}, pos_integer()) -> ok.

push_log_info(#role{id = RoleId}, GuardId) ->
    #expedition_log{list = L} = get_log(RoleId, GuardId),
    PushL = [{ReplayLog,
	      [arena_elite_ver:do_partner_hurt_ver(Data)
	       || Data <- list_util:keyfind(1, Ext, [])]}
	     || ReplayLog = #expedition_replay{ext = Ext} <- L],
    sys_conn:pack_send(24415, {PushL}),
    ok.


