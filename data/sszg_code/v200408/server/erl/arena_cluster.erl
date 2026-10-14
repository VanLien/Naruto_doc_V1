-file("src/mod/arena_cluster/arena_cluster.erl", 1).

-module(arena_cluster).

-lager_records([{guild_skill_break_group,
		 [ver, career, attr_formation, skill_formation, ext]},
		{guild_skill_group,
		 [ver, career, group_id, skill_ids, group_ids]},
		{m_guild_skill, [ver, groups, break_groups]},
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{hallows_look_data,
		 [id, name, attr, is_item, time, loss]},
		{hallows_looks, [ver, id, endtime, eqm_hallows]},
		{hallows_quest_data, [id, hid, items, progress]},
		{hallows_data,
		 [id, step, name, attr, loss, max_lucky, clear_limit,
		  clear_time, reward, notice, open_desc, skill_order]},
		{hallows_skill, [ver, pos, lev, skill_bid, attr]},
		{hallows,
		 [ver, id, step, lucky, lucky_endtime, power, base_attr,
		  add_attr, eqm, skill, seal, reward, rebirth_loss,
		  is_notice, look_id, refine_lev]},
		{m_hallows,
		 [ver, hallows_list, all_lv, attr_list, quest_list,
		  look_list, look_quest_list]},
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
		{arena_cluster_fight_lock,
		 [id, is_fight, fight_rid, fight_pid]},
		{arena_cluster_replay_partner,
		 [pos, bid, lev, star, ext]},
		{arena_cluster_replay,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_cluster_log,
		 [id, atk_id, atk_name, atk_face, atk_lev, atk_rank,
		  atk_score, def_id, def_name, def_face, def_lev,
		  def_rank, def_score, ret, win_count, lose_count,
		  combat_type, replay_list, time, atk_face_update_time,
		  atk_face_file, def_face_update_time, def_face_file]},
		{role_arena_cluster_log, [id, list]},
		{arena_cluster_role,
		 [id, name, vip, lev, sex, gid, gname, face, power,
		  max_power, lookid, score, rank, time, avatar_id,
		  cont_win, ext]},
		{arena_cluster_rank, [rank, id, score]},
		{arena_cluster_f_pos,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  dower_skill, set_skill, attr, extra]},
		{arena_cluster_f_order,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, pos_info, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  power, is_hidden, extra]},
		{arena_cluster_f,
		 [id, name, gname, idx, lev, vip_lev, sex, face, power,
		  rank, order_info, robot_id, avatar_id, look, ext]},
		{m_arena_cluster,
		 [ver, ref_time, formations, ref_list, season_ref_time,
		  season_combat_num, best_rank, day_combat_num,
		  acc_combat_num, day_reward, turn_card_reward,
		  turn_card_num, turn_card_history, worship,
		  worship_list]},
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

-export([login/1, zero_flush/1, level_up/2,
	 init_refresh_list/1, init/0, push/1, push_list/2,
	 get_target_info/2, push_day_reward/1, get_day_reward/2,
	 push_open/1, refresh_list/1, set_best_rank/2, combat/3,
	 do_combat2/1, combat_over/4, push_turn_card/1,
	 auto_turn_card/1, turn_card/2, match/4,
	 get_formation_ids/1, get_formation_sys_def/1,
	 set_formation_sys/3, get_formation_sys/2, check_open/1,
	 check_role_open/1, can_skip_combat/1, push_red_point/1,
	 merge_flush/1]).

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

-file("src/mod/arena_cluster/arena_cluster.erl", 39).

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

-file("src/mod/arena_cluster/arena_cluster.erl", 40).

-file("inc/arena_cluster.hrl", 1).

-record(m_arena_cluster,
	{ver = 1, ref_time = 0, formations = [], ref_list = [],
	 season_ref_time = 0, season_combat_num = 0,
	 best_rank = 0, day_combat_num = 0, acc_combat_num = 0,
	 day_reward = [], turn_card_reward = [],
	 turn_card_num = 0, turn_card_history = [], worship = 0,
	 worship_list = []}).

-record(arena_cluster_f,
	{id = {0, <<>>}, name = <<>>, gname = <<>>, idx = 0,
	 lev = 0, vip_lev = 0, sex = 0, face = 0, power = 0,
	 rank = 0, order_info = [], robot_id = 0, avatar_id = 0,
	 look = 0, ext = []}).

-record(arena_cluster_f_order,
	{order, formation_type = 1, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0, pos_info = [],
	 hallows_look_id = 0, hallows_lucky = 0,
	 hallows_seal = 0, hallows_all_look_ids = [], power = 0,
	 is_hidden = 0, extra = []}).

-record(arena_cluster_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0,
	 dower_skill = [], set_skill = [], attr, extra = []}).

-record(arena_cluster_rank,
	{rank = 0, id = {0, <<>>}, score = 0}).

-record(arena_cluster_role,
	{id = {0, <<>>}, name = <<>>, vip = 0, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, score = 0, rank = 0,
	 time = 0, avatar_id = 0, cont_win = 0, ext = []}).

-record(role_arena_cluster_log,
	{id = {0, <<>>}, list = []}).

-record(arena_cluster_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_lev = 0, atk_rank = 0, atk_score = 0,
	 def_id = {0, <<>>}, def_name = <<>>, def_face = 0,
	 def_lev = 0, def_rank = 0, def_score = 0, ret = 1,
	 win_count = 0, lose_count = 0, combat_type = 0,
	 replay_list = [], time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(arena_cluster_replay,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_cluster_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-record(arena_cluster_fight_lock,
	{id = {0, <<>>}, is_fight = 0, fight_rid = {0, <<>>},
	 fight_pid = 0}).

-file("src/mod/arena_cluster/arena_cluster.erl", 41).

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

-file("src/mod/arena_cluster/arena_cluster.erl", 42).

-file("inc/combat.hrl", 1).

-file("inc/common.hrl", 1).

-file("inc/combat.hrl", 13).

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

-file("src/mod/arena_cluster/arena_cluster.erl", 43).

-file("inc/partner.hrl", 1).

-file("inc/attr.hrl", 1).

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

-file("src/mod/arena_cluster/arena_cluster.erl", 44).

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

-file("src/mod/arena_cluster/arena_cluster.erl", 45).

-file("inc/log.hrl", 1).

-file("src/mod/arena_cluster/arena_cluster.erl", 46).

-file("inc/hallows.hrl", 1).

-record(m_hallows,
	{ver = 3, hallows_list = [], all_lv = 0, attr_list = [],
	 quest_list = [], look_list = [], look_quest_list = []}).

-record(hallows,
	{ver = 4, id = 0, step = 0, lucky = 0,
	 lucky_endtime = 0, power = 0, base_attr = [],
	 add_attr = [], eqm = [], skill = [], seal = 0,
	 reward = [], rebirth_loss = [], is_notice = 0,
	 look_id = 0, refine_lev = 0}).

-record(hallows_skill,
	{ver = 1, pos = 0, lev = 0, skill_bid = 0, attr = []}).

-record(hallows_data,
	{id = 0, step = 0, name = <<>>, attr = [], loss = [],
	 max_lucky = 0, clear_limit = 0, clear_time = 0,
	 reward = [], notice = <<>>, open_desc = <<>>,
	 skill_order = []}).

-record(hallows_quest_data,
	{id = 0, hid = 0, items = [], progress = []}).

-record(hallows_looks,
	{ver = 1, id = 0, endtime = 0, eqm_hallows = 0}).

-record(hallows_look_data,
	{id = 0, name = <<>>, attr = [], is_item = 0, time = 0,
	 loss = []}).

-file("src/mod/arena_cluster/arena_cluster.erl", 47).

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

-file("src/mod/arena_cluster/arena_cluster.erl", 48).

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

-file("src/mod/arena_cluster/arena_cluster.erl", 49).

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

-file("src/mod/arena_cluster/arena_cluster.erl", 50).

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

-file("src/mod/arena_cluster/arena_cluster.erl", 51).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/arena_cluster/arena_cluster.erl", 52).

init() -> #m_arena_cluster{}.

login(Role = #role{id = RoleId}) ->
    arena_cluster_mgr:sync_role(Role),
    Role1 = auto_turn_card(Role),
    Rank = arena_cluster_lib:cluster_role_rank(RoleId),
    {ok, NRole} = set_best_rank(Role1, Rank),
    {ok, NRole}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_arena_cluster =
			    MArenaCluster = #m_arena_cluster{season_ref_time =
								 SeasonEndTime,
							     season_combat_num =
								 SeasonCombatNum}}) ->
    Now = date:unixtime(),
    NewSeasonCombatNum = util:if_true(Now >= SeasonEndTime,
				      0, SeasonCombatNum),
    Role1 = Role#role{m_arena_cluster =
			  MArenaCluster#m_arena_cluster{worship = 0,
							worship_list = [],
							day_combat_num = 0,
							day_reward = [],
							season_combat_num =
							    NewSeasonCombatNum}},
    NRole = case NewSeasonCombatNum <
		   arena_cluster_data:get_const(arena_skip_count)
		of
	      true -> var:set_var(Role1, acc, 2059, 0);
	      _ -> Role1
	    end,
    push(NRole),
    push_open(NRole),
    push_day_reward(NRole),
    push_red_point(NRole),
    {ok, NRole}.

-spec level_up(#role{}, #role{}) -> {ok, #role{}}.

level_up(_, Role = #role{lev = Lev}) ->
    arena_cluster_mgr:sync_role(Role),
    case Lev == arena_cluster_data:get_const(lev_limt) of
      true -> push_open(Role);
      _ -> skip
    end,
    {ok, Role}.

-spec init_refresh_list(#role{}) -> #role{}.

init_refresh_list(Role = #role{m_arena_cluster =
				   MArenaCluster = #m_arena_cluster{ref_list =
									[]}}) ->
    case check_open(Role) of
      true ->
	  ArenaInfo = arena_cluster_mgr:env_info(),
	  SeasonEndTime = maps:get(season_end_time, ArenaInfo, 0),
	  RefList = cluster_match(Role, []),
	  Role#role{m_arena_cluster =
			MArenaCluster#m_arena_cluster{ref_list = RefList,
						      season_ref_time =
							  SeasonEndTime}};
      _ ->
	  RefList = rand_look(),
	  Role#role{m_arena_cluster =
			MArenaCluster#m_arena_cluster{ref_list = RefList}}
    end;
init_refresh_list(Role = #role{m_arena_cluster =
				   MArenaCluster = #m_arena_cluster{ref_list =
									RefList,
								    season_ref_time
									=
									SeasonRefTime}}) ->
    case check_open(Role) of
      true ->
	  ArenaInfo = arena_cluster_mgr:env_info(),
	  SeasonEndTime = maps:get(season_end_time, ArenaInfo, 0),
	  Now = date:unixtime(),
	  case RefList of
	    [#arena_cluster_f{id = {0, <<>>}} | _] ->
		NewRefList = cluster_match(Role, []),
		Role#role{m_arena_cluster =
			      MArenaCluster#m_arena_cluster{ref_list =
								NewRefList,
							    season_ref_time =
								SeasonEndTime,
							    season_combat_num =
								0}};
	    [#arena_cluster_f{} | _] when Now >= SeasonRefTime ->
		NewRefList = cluster_match(Role, []),
		Role#role{m_arena_cluster =
			      MArenaCluster#m_arena_cluster{ref_list =
								NewRefList,
							    season_ref_time =
								SeasonEndTime,
							    season_combat_num =
								0}};
	    _ -> Role
	  end;
      _ ->
	  NewRefList = case rand_look(RefList, []) of
			 [] -> RefList;
			 I -> I
		       end,
	  Role#role{m_arena_cluster =
			MArenaCluster#m_arena_cluster{ref_list = NewRefList}}
    end.

rand_look() ->
    Looks = arena_cluster_data:get_const(robot_body),
    RandList1 = random_name_data:arena_list(1),
    RandList2 = random_name_data:arena_list(2),
    RandList3 = random_name_data:arena_list(3),
    Acc = [#arena_cluster_f{idx = Idx,
			    look = util:rand_list(Looks),
			    name =
				<<(util:rand_list(RandList1))/binary,
				  (util:rand_list(RandList2))/binary,
				  (util:rand_list(RandList3))/binary>>,
			    power = util:rand(500000, 1000000)}
	   || Idx <- lists:seq(1, 3)],
    Acc.

rand_look([], Acc) -> Acc;
rand_look([#arena_cluster_f{id = {0, <<>>}} | _],
	  Acc) ->
    Acc;
rand_look([#arena_cluster_f{idx = Idx} | T], Acc) ->
    Looks = arena_cluster_data:get_const(robot_body),
    Name1 = util:rand_list(random_name_data:arena_list(1)),
    Name2 = util:rand_list(random_name_data:arena_list(2)),
    Name3 = util:rand_list(random_name_data:arena_list(3)),
    Name = <<Name1/binary, Name2/binary, Name3/binary>>,
    NewSLF = #arena_cluster_f{idx = Idx,
			      look = util:rand_list(Looks), name = Name,
			      power = util:rand(500000, 1000000)},
    rand_look(T, [NewSLF | Acc]);
rand_look(_, _) -> rand_look().

-spec push(#role{}) -> ok.

push(Role = #role{id = RoleId,
		  m_arena_cluster =
		      #m_arena_cluster{best_rank = BestRank,
				       ref_time = RefTime,
				       season_combat_num = SeasonCombatNum}}) ->
    {Rank, Score} = case
		      arena_cluster_lib:cluster_get_role(RoleId)
			of
		      {ok,
		       #arena_cluster_role{rank = Rank0, score = Score0}} ->
			  {Rank0, Score0};
		      _ -> {0, arena_cluster_data:get_const(init_score)}
		    end,
    ArenaInfo = arena_cluster_mgr:env_info(),
    SeasonStartTime = maps:get(season_start_time, ArenaInfo,
			       0),
    SeasonEndTime = maps:get(season_end_time, ArenaInfo, 0),
    IsAuto = var:get_var(Role, acc, 2059, 0),
    sys_conn:pack_send(25600,
		       {Rank, BestRank, Score, 0, 0, RefTime, SeasonStartTime,
			SeasonEndTime, IsAuto, SeasonCombatNum}),
    ok.

-spec push_list(#role{}, non_neg_integer()) -> ok.

push_list(#role{m_arena_cluster =
		    #m_arena_cluster{ref_list = RefList}},
	  Type) ->
    CliList = to_list_cli(RefList, []),
    sys_conn:pack_send(25601, {CliList, Type}),
    ok.

to_list_cli([], L) -> util:keys_sort([1], L);
to_list_cli([#arena_cluster_f{id = {Rid, SrvId},
			      idx = Idx, name = Name0, lev = Lev0, sex = Sex,
			      face = Face0, look = Look0, power = Power0,
			      ext = Ext}
	     | T],
	    L) ->
    Score0 = arena_cluster_lib:cluster_role_score({Rid,
						   SrvId}),
    {FaceUpdateTime, FaceFile} = list_util:keyfind(1, Ext,
						   {0, <<>>}),
    Data = {Idx, Rid, SrvId, Name0, Lev0, Sex, Face0, Look0,
	    Power0, Score0, FaceUpdateTime, FaceFile},
    to_list_cli(T, [Data | L]).

-spec get_target_info(#role{}, role_id()) -> {ok,
					      tuple()} |
					     {false, binary()}.

get_target_info(#role{m_arena_cluster =
			  #m_arena_cluster{ref_list = RefList}},
		TarRoleId) ->
    case lists:keyfind(TarRoleId, #arena_cluster_f.id,
		       RefList)
	of
      #arena_cluster_f{id = {Rid, SrvId}, name = Name,
		       lev = Lev, face = Face, power = Power, sex = Sex,
		       avatar_id = AvatarId, order_info = OrderInfo,
		       ext = Ext} ->
	  Score = arena_cluster_lib:cluster_role_score(TarRoleId),
	  CliOrderL = to_order_list(1, OrderInfo, []),
	  {FaceUpdateTime, FaceFile} = list_util:keyfind(1, Ext,
							 {0, <<>>}),
	  {ok,
	   {Rid, SrvId, Name, Lev, Face, FaceUpdateTime, FaceFile,
	    Sex, Power, Score, AvatarId, CliOrderL}};
      _ -> {false, lang:get(<<"目标不在列表中"/utf8>>)}
    end.

to_order_list(OrderId, _, L) when OrderId > 3 -> L;
to_order_list(OrderId, OrderInfo, L) ->
    case lists:keyfind(OrderId,
		       #arena_cluster_f_order.order, OrderInfo)
	of
      #arena_cluster_f_order{is_hidden = 1} ->
	  CliOrder = {OrderId, 0, 1, []},
	  to_order_list(OrderId + 1, OrderInfo, [CliOrder | L]);
      #arena_cluster_f_order{order = OrderId, power = Power,
			     is_hidden = IsHidden, pos_info = PosInfo} ->
	  PList = [{Pos, Id, Bid, Lev, Star, UseSkin,
		    list_util:keyfind(11, ExtraData, 0)}
		   || #arena_cluster_f_pos{pos = Pos, id = Id, bid = Bid,
					   lev = Lev, star = Star,
					   use_skin = UseSkin,
					   extra = ExtraData}
			  <- PosInfo],
	  CliOrder = {OrderId, Power, IsHidden, PList},
	  to_order_list(OrderId + 1, OrderInfo, [CliOrder | L]);
      _ ->
	  CliOrder = {OrderId, 0, 0, []},
	  to_order_list(OrderId + 1, OrderInfo, [CliOrder | L])
    end.

-spec push_day_reward(#role{}) -> ok.

push_day_reward(#role{m_arena_cluster =
			  #m_arena_cluster{day_combat_num = DayCombatNum,
					   day_reward = Reward}}) ->
    sys_conn:pack_send(25607, {DayCombatNum, Reward}), ok.

-spec get_day_reward(#role{},
		     Num :: pos_integer()) -> {false, binary()} |
					      {ok, #role{}}.

get_day_reward(Role = #role{m_arena_cluster =
				MArenaCluster = #m_arena_cluster{day_combat_num
								     =
								     DayCombatNum,
								 day_reward =
								     DayReward}},
	       Num)
    when DayCombatNum >= Num ->
    case arena_cluster_data:day_box_reward(Num) of
      Items = [_ | _] ->
	  case lists:member(Num, DayReward) of
	    true -> {false, lang:get(<<"该奖励已领取"/utf8>>)};
	    false ->
		GL = format:val_to_gain(Items,
					arena_cluster_day_reward),
		case role_gain:do_notice(Role, GL) of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, Role1} ->
		      NRole = Role1#role{m_arena_cluster =
					     MArenaCluster#m_arena_cluster{day_reward
									       =
									       [Num
										| DayReward]}},
		      log:log_gain(GL, Role, NRole, <<"跨服竞技场"/utf8>>,
				   util:fbin("每日挑战次数奖励num:~w", [Num])),
		      push_day_reward(NRole),
		      push_red_point(NRole),
		      {ok, NRole}
		end
	  end;
      _ -> {false, lang:get(<<"该宝箱不存在哟"/utf8>>)}
    end;
get_day_reward(_Role, _Num) ->
    {false, lang:get(<<"挑战次数未达标"/utf8>>)}.

-spec push_open(#role{}) -> ok.

push_open(_Role) ->
    IsOpen = arena_cluster_mgr:is_opening(),
    Status = util:if_true(IsOpen, 1, 0),
    sys_conn:pack_send(25610, {Status}),
    ok.

-spec combat(#role{}, role_id(), boolean()) -> {ok,
						#role{}} |
					       {false, binary()}.

combat(Role = #role{id = RoleId,
		    m_arena_cluster = #m_arena_cluster{ref_list = RefList}},
       TarRoleId, IsAuto) ->
    LossCfg =
	arena_cluster_data:get_const(arena_ticketcost),
    Loss = format:val_to_loss(LossCfg, arena),
    case role_gain:do(Role, Loss,
		      #gain_loss_opts{need_notify_fail_item = true})
	of
      {false, #loss{msg = Msg}} -> {false, Msg};
      {ok, NRole, _} ->
	  case lists:keyfind(TarRoleId, #arena_cluster_f.id,
			     RefList)
	      of
	    ArenaClusterF = #arena_cluster_f{id = TarRoleId,
					     order_info = OrderInfo} ->
		case check_can_combat([lev, world_lev, is_open,
				       check_def, check_atk],
				      NRole,
				      #{def_id => TarRoleId,
					order_info => OrderInfo})
		    of
		  {false, Msg} -> {false, Msg};
		  ok ->
		      case arena_cluster_mgr:lock_target(TarRoleId, RoleId) of
			true ->
			    log:log_gain(Loss, Role, NRole, <<"跨服竞技场"/utf8>>,
					 util:fbin("挑战玩家 ~w", [TarRoleId])),
			    NewRole = var:set_var(NRole, acc, 2059, IsAuto),
			    do_combat(NewRole, 1, ArenaClusterF, IsAuto);
			false -> {false, lang:get(<<"当前玩家正在被挑战，请稍后尝试"/utf8>>)};
			_ERR -> {false, lang:get(<<"跨服暂未开启，请稍后重试"/utf8>>)}
		      end;
		  _ -> {false, lang:get(<<"暂时无法挑战"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"目标不在列表中"/utf8>>)}
	  end
    end.

check_can_combat([lev | Other], Role = #role{lev = Lev},
		 Cache) ->
    OpenLev = arena_cluster_data:get_const(lev_limt),
    case Lev < OpenLev of
      true -> {false, lang:get(<<"等级不足"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([world_lev | Other], Role, Cache) ->
    WorldLev = world_lev:get_world_lev(),
    OpenLev = arena_cluster_data:get_const(world_lev_open),
    case WorldLev < OpenLev of
      true -> {false, lang:get(<<"世界等级不足"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([is_open | Other], Role, Cache) ->
    IsOpen = arena_cluster_mgr:is_opening(),
    case IsOpen of
      false -> {false, lang:get(<<"当前不在挑战期"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([check_def | Other], Role,
		 Cache = #{def_id := TarRoleId,
			   order_info := OrderInfo}) ->
    case TarRoleId == {0, <<>>} of
      true -> {false, lang:get(<<"当前无法挑战，请尝试刷新"/utf8>>)};
      _ ->
	  TarEmptyNum = def_empty_num(OrderInfo, 3),
	  case OrderInfo == [] orelse TarEmptyNum >= 2 of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster317, _,
		   {__Levelarena_cluster317, __Tracesarena_cluster317}}
		      when __Levelarena_cluster317 band 8 /= 0 orelse
			     __Tracesarena_cluster317 /= [] ->
		      lager:do_log(error,
				   [{module, arena_cluster},
				    {function, check_can_combat}, {line, 317},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~w的阵容少于两个", [TarRoleId]),
				   none, 4096, 8, __Levelarena_cluster317,
				   __Tracesarena_cluster317, lager_event,
				   __Pidarena_cluster317);
		  _ -> ok
		end,
		{false, lang:get(<<"该对手无法被挑战，请挑战其他对手"/utf8>>)};
	    _ -> check_can_combat(Other, Role, Cache)
	  end
    end;
check_can_combat([check_atk | Other], Role, Cache) ->
    {_, _, PushFormations} = get_formation_sys(Role, 1),
    EmptyNum = atk_empty_num(PushFormations, 3),
    case PushFormations == [] orelse EmptyNum >= 2 of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster328, _,
	     {__Levelarena_cluster328, __Tracesarena_cluster328}}
		when __Levelarena_cluster328 band 8 /= 0 orelse
		       __Tracesarena_cluster328 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster},
			      {function, check_can_combat}, {line, 328},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~ts的阵容少于两个", [Role#role.name]),
			     none, 4096, 8, __Levelarena_cluster328,
			     __Tracesarena_cluster328, lager_event,
			     __Pidarena_cluster328);
	    _ -> ok
	  end,
	  {false, lang:get(<<"请布阵两个队伍以上"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([], _Role, _Cache) -> ok.

def_empty_num([], Num) -> Num;
def_empty_num([#arena_cluster_f_order{pos_info =
					  PosInfo}
	       | Other],
	      Num) ->
    case PosInfo of
      [] -> def_empty_num(Other, Num);
      _ -> def_empty_num(Other, Num - 1)
    end.

atk_empty_num([], Num) -> Num;
atk_empty_num([{_, _, PosInfo, _, _} | Other], Num) ->
    case PosInfo of
      [] -> atk_empty_num(Other, Num);
      _ -> atk_empty_num(Other, Num - 1)
    end.

do_combat(RoleT = #role{combat_type_list =
			    CombatTypeList,
			m_arena_cluster =
			    #m_arena_cluster{season_combat_num =
						 SeasonCombatNum}},
	  Round,
	  ArenaClusterF = #arena_cluster_f{id = TarRoleId,
					   name = TarName},
	  IsAuto) ->
    CombatType = 28,
    Role = util:if_true(Round == 1, RoleT,
			RoleT#role{combat_pid = 0,
				   combat_type_list =
				       lists:keydelete(CombatType, 1,
						       CombatTypeList)}),
    {BFormationType, DefendList, SpriteLev, Sprites} =
	gen_def_fight_objects(Role, ArenaClusterF, Round),
    {AFormationType, AtkGroup} = gen_fight_object(Role,
						  Round),
    {Result1, Result2, Result3} =
	util:get(arena_cluster_combat_result, {0, 0, 0}),
    put(is_multiple_combat, 1),
    {MySpriteLev, MySprites} =
	sprite_tree:get_sprite_lev(Role, 19, Round),
    put(arena_cluster_sprite,
	[{2, MySpriteLev}, {3, MySprites}, {4, SpriteLev},
	 {5, Sprites}]),
    case check_combat_fight_status(AtkGroup, DefendList) of
      {next, CombatResult} ->
	  {OldWinCount, OldLose} =
	      util:get(arena_cluster_win_count, {0, 0}),
	  {WinCount, Lose} = case CombatResult == 1 of
			       true ->
				   put(arena_cluster_win_count,
				       {OldWinCount + 1, OldLose}),
				   {OldWinCount + 1, OldLose};
			       _ ->
				   put(arena_cluster_win_count,
				       {OldWinCount, OldLose + 1}),
				   {OldWinCount, OldLose + 1}
			     end,
	  if Round == 1 ->
		 put(arena_cluster_combat_result,
		     {CombatResult, Result2, Result3});
	     Round == 2 ->
		 put(arena_cluster_combat_result,
		     {Result1, CombatResult, Result3});
	     true ->
		 put(arena_cluster_combat_result,
		     {Result1, Result2, CombatResult})
	  end,
	  OldRoundLog = util:get(arena_cluster_round_log, []),
	  RoundLog = to_round_log2(Role, CombatResult, Round,
				   Round, TarRoleId, AFormationType,
				   BFormationType, AtkGroup, DefendList),
	  put(arena_cluster_round_log,
	      [{Round, RoundLog} | OldRoundLog]),
	  if WinCount >= 2 orelse Lose >= 2 ->
		 do_combat_over(Role, ArenaClusterF);
	     true ->
		 do_next_combat(Role, {Round + 1, ArenaClusterF, IsAuto})
	  end;
      _ ->
	  {ok, CRole0} = role_convert:do(combat_role, Role),
	  Num = arena_cluster_data:get_const(arena_skip_count),
	  CRole = CRole0#combat_role{conn_pid = 0, group = 1,
				     is_auto = true, is_offline = true,
				     auto_watch_model = 1, watching = 0},
	  IsRobot = util:if_true(IsAuto =:= 1 andalso
				   SeasonCombatNum >= Num,
				 1, 0),
	  Args = #{on_role_combat_end =>
		       {arena_cluster, combat_over,
			[{Round, ArenaClusterF, AFormationType, BFormationType,
			  IsAuto}]},
		   ext_args =>
		       [{cli_ext_args, [Round, Result1, Result2, Result3]},
			{is_show_panel, false}],
		   formation =>
		       [{1, AFormationType, 0}, {2, BFormationType, 0}],
		   target_role_name => TarName, combat_role => CRole,
		   is_robot => IsRobot},
	  AtkGroup1 = combat_attr:calc(AtkGroup, CombatType,
				       Role),
	  DefendList1 = combat_attr:calc(DefendList, CombatType,
					 ArenaClusterF),
	  case combat_lib:start_combat(Role, CombatType,
				       AtkGroup1, [DefendList1], Args)
	      of
	    {ok, _CombatPid} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster407, _,
		   {__Levelarena_cluster407, __Tracesarena_cluster407}}
		      when __Levelarena_cluster407 band 128 /= 0 orelse
			     __Tracesarena_cluster407 /= [] ->
		      lager:do_log(debug,
				   [{module, arena_cluster},
				    {function, do_combat}, {line, 407},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("do_combat==~ts====~w ~w",
						 [Role#role.name, Round,
						  CombatType]),
				   none, 4096, 128, __Levelarena_cluster407,
				   __Tracesarena_cluster407, lager_event,
				   __Pidarena_cluster407);
		  _ -> ok
		end,
		{ok, Role};
	    {false, Err} ->
		case Round == 1 of
		  true ->
		      arena_cluster_mgr:unlock_target(TarRoleId),
		      erase(is_multiple_combat),
		      {false, Err};
		  _ ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidarena_cluster416, _,
			 {__Levelarena_cluster416, __Tracesarena_cluster416}}
			    when __Levelarena_cluster416 band 8 /= 0 orelse
				   __Tracesarena_cluster416 /= [] ->
			    lager:do_log(error,
					 [{module, arena_cluster},
					  {function, do_combat}, {line, 416},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~ts在跨服竞技场第~w场战斗中进入战斗失败~w",
						       [Role#role.name, Round,
							Err]),
					 none, 4096, 8, __Levelarena_cluster416,
					 __Tracesarena_cluster416, lager_event,
					 __Pidarena_cluster416);
			_ -> ok
		      end,
		      do_combat_over(Role, ArenaClusterF)
		end
	  end
    end.

check_combat_fight_status(AtkList, DefList) ->
    AtkNull = check_fight_objects_null(AtkList),
    DefNull = check_fight_objects_null(DefList),
    if AtkNull andalso DefNull -> {next, 3};
       AtkNull andalso not DefNull -> {next, 2};
       DefNull andalso not AtkNull -> {next, 1};
       true -> fight
    end.

check_fight_objects_null([]) -> true;
check_fight_objects_null([#fight_object{object_type =
					    4}]) ->
    true;
check_fight_objects_null([#fight_object{object_type =
					    5}]) ->
    true;
check_fight_objects_null([#fight_object{object_type =
					    4},
			  #fight_object{object_type = 5}]) ->
    true;
check_fight_objects_null([#fight_object{object_type =
					    5},
			  #fight_object{object_type = 4}]) ->
    true;
check_fight_objects_null(_) -> false.

do_combat2(Role) ->
    case erase(arena_cluster_do_combat_arge) of
      {Round, ArenaClusterF, IsAuto} ->
	  case do_combat(Role, Round, ArenaClusterF, IsAuto) of
	    {ok, NRole} -> {ok, NRole};
	    {ok, NRole, _} -> {ok, NRole};
	    _ERR ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster449, _,
		   {__Levelarena_cluster449, __Tracesarena_cluster449}}
		      when __Levelarena_cluster449 band 8 /= 0 orelse
			     __Tracesarena_cluster449 /= [] ->
		      lager:do_log(error,
				   [{module, arena_cluster},
				    {function, do_combat2}, {line, 449},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]进战斗失败~w",
						 [Role#role.name, _ERR]),
				   none, 4096, 8, __Levelarena_cluster449,
				   __Tracesarena_cluster449, lager_event,
				   __Pidarena_cluster449);
		  _ -> ok
		end,
		ok
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
	    {__Pidarena_cluster453, _,
	     {__Levelarena_cluster453, __Tracesarena_cluster453}}
		when __Levelarena_cluster453 band 8 /= 0 orelse
		       __Tracesarena_cluster453 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster}, {function, do_combat2},
			      {line, 453}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~ts跨服竞技场进下一场战斗失败~w",
					   [Role#role.name, _Err]),
			     none, 4096, 8, __Levelarena_cluster453,
			     __Tracesarena_cluster453, lager_event,
			     __Pidarena_cluster453);
	    _ -> ok
	  end,
	  ok
    end.

do_next_combat(Role = #role{pid = Pid,
			    ui_combat_type = UiCombatType},
	       Arg = {Round, ArenaClusterF, IsAuto}) ->
    case UiCombatType == 28 of
      true ->
	  put(arena_cluster_do_combat_arge, Arg),
	  sys_conn:pack_send(25216, {28, 1}),
	  role:apply(async, Pid, {arena_cluster, do_combat2, []}),
	  {ok, Role};
      _ -> do_combat(Role, Round, ArenaClusterF, IsAuto)
    end.

combat_over(Role = #role{},
	    CombatResult = #combat_result{hurt_statistics =
					      HurtStatistics,
					  result = ResultT},
	    _Combat,
	    {Round, ArenaClusterF = #arena_cluster_f{id = TarId},
	     FormationType, BFormationType, IsAuto}) ->
    put(arena_cluster_hurt_statistics,
	[{Round, HurtStatistics}
	 | util:get(arena_cluster_hurt_statistics, [])]),
    {OldWinCount, OldLose} =
	util:get(arena_cluster_win_count, {0, 0}),
    {Result1, Result2, Result3} =
	util:get(arena_cluster_combat_result, {0, 0, 0}),
    {WinCount, Lose} = case ResultT == 1 of
			 true ->
			     put(arena_cluster_win_count,
				 {OldWinCount + 1, OldLose}),
			     {OldWinCount + 1, OldLose};
			 _ ->
			     put(arena_cluster_win_count,
				 {OldWinCount, OldLose + 1}),
			     {OldWinCount, OldLose + 1}
		       end,
    if Round == 1 ->
	   put(arena_cluster_combat_result,
	       {ResultT, Result2, Result3});
       Round == 2 ->
	   put(arena_cluster_combat_result,
	       {Result1, ResultT, Result3});
       true ->
	   put(arena_cluster_combat_result,
	       {Result1, Result2, ResultT})
    end,
    OldRoundLog = util:get(arena_cluster_round_log, []),
    RoundLog = to_round_log(Role, CombatResult, Round,
			    Round, TarId, FormationType, BFormationType,
			    HurtStatistics),
    put(arena_cluster_round_log,
	[{Round, RoundLog} | OldRoundLog]),
    if WinCount >= 2 orelse Lose >= 2 ->
	   do_combat_over(Role, ArenaClusterF);
       true ->
	   do_next_combat(Role, {Round + 1, ArenaClusterF, IsAuto})
    end.

do_combat_over(Role = #role{id = RoleId, power = Power},
	       AF = #arena_cluster_f{id = TarRoleId, name = TarName,
				     lev = TarLev, face = TarFace,
				     power = TarPower, ext = Ext}) ->
    AllHurtStatistics =
	util:get(arena_cluster_hurt_statistics, []),
    Day = date:day_of_the_week(),
    IsOpenDay = lists:member(Day,
			     arena_cluster_data:get_const(season_time)),
    log:save(join,
	     {Role, <<"功能玩法"/utf8>>, <<"跨服竞技场"/utf8>>}),
    arena_cluster_mgr:unlock_target(TarRoleId),
    sys_conn:pack_send(25216, {28, 0}),
    erase(is_multiple_combat),
    case erase(arena_cluster_win_count) of
      {WinCount, LoseCount} when WinCount > LoseCount ->
	  NowScore = arena_cluster_lib:cluster_role_score(RoleId),
	  TarScore =
	      arena_cluster_lib:cluster_role_score(TarRoleId),
	  GetScore = calc_get_score(win, NowScore, TarScore),
	  LoseScore = calc_get_score(lose, NowScore, TarScore),
	  NewScore = NowScore + GetScore,
	  NewTarScore = max(TarScore + LoseScore,
			    arena_cluster_data:get_const(min_score)),
	  {ok, AR} = role_convert:do(arena_cluster_role, Role),
	  NewAR = AR#arena_cluster_role{score = NewScore},
	  arena_cluster_mgr:update_role(NewAR, GetScore),
	  arena_cluster_mgr:update_role(TarRoleId, LoseScore),
	  NewTurnCardList = [{Pos, 0, [], []}
			     || Pos <- lists:seq(1, 3)],
	  NewTurnCard = [{1, NewScore, NewTurnCardList}],
	  {TarFaceUpdateTime, TarFaceFile} = list_util:keyfind(1,
							       Ext, {0, <<>>}),
	  sys_conn:pack_send(25611,
			     {1, NewScore, GetScore, TarName, TarLev, TarFace,
			      TarFaceUpdateTime, TarFaceFile, NewTarScore,
			      LoseScore, AllHurtStatistics}),
	  Role1 = #role{m_arena_cluster =
			    MArenaCluster = #m_arena_cluster{season_combat_num =
								 SeasonCombatNum,
							     day_combat_num =
								 DayCombatNum,
							     acc_combat_num =
								 AccCombatNum,
							     ref_list = RL}} =
		      auto_turn_card(Role),
	  ExcludeIds = [RoleIdT
			|| #arena_cluster_f{id = RoleIdT} <- RL],
	  NewRefList = cluster_match(Role1, ExcludeIds),
	  NewDayCombatNum = util:if_true(IsOpenDay,
					 DayCombatNum + 1, DayCombatNum),
	  NRole = Role1#role{m_arena_cluster =
				 MArenaCluster#m_arena_cluster{turn_card_reward
								   =
								   NewTurnCard,
							       ref_list =
								   NewRefList,
							       season_combat_num
								   =
								   SeasonCombatNum
								     + 1,
							       day_combat_num =
								   NewDayCombatNum,
							       acc_combat_num =
								   AccCombatNum
								     + 1}},
	  ReplayList = util:get(arena_cluster_round_log, []),
	  CombatLog = #arena_cluster_log{def_id =
					     TarId = {_, TarSrvId}} =
			  to_combat_log(Role, AF, ReplayList, 28, 1, WinCount,
					LoseCount, NewScore, NewTarScore),
	  arena_cluster_mgr:save_log({RoleId, Power, TarPower,
				      CombatLog}),
	  case TarSrvId of
	    <<>> -> skip;
	    _ ->
		cluster_lib:cast(TarSrvId, var, acc_role_var,
				 [TarRoleId, other, 9, 0]),
		cluster_lib:cast(TarSrvId, arena_cluster_mgr, save_log,
				 [{TarId, CombatLog}])
	  end,
	  erase(arena_cluster_hurt_statistics),
	  erase(arena_cluster_round_log),
	  erase(arena_cluster_combat_result),
	  Num = arena_cluster_data:get_const(arena_skip_count),
	  NewRole = case SeasonCombatNum + 1 =:= Num of
		      true -> var:set_var(NRole, acc, 2059, 1);
		      _ -> NRole
		    end,
	  TriggerRole =
	      role_trigger:fire([#evt_arena_cluster_win{}], NewRole),
	  push(TriggerRole),
	  push_list(TriggerRole, 0),
	  push_day_reward(TriggerRole),
	  push_red_point(TriggerRole),
	  {ok, TriggerRole};
      {WinCount, LoseCount} ->
	  NowScore = arena_cluster_lib:cluster_role_score(RoleId),
	  TarScore =
	      arena_cluster_lib:cluster_role_score(TarRoleId),
	  NewTurnCardList = [{Pos, 0, [], []}
			     || Pos <- lists:seq(1, 3)],
	  NewTurnCard = [{2, NowScore, NewTurnCardList}],
	  Role1 = #role{m_arena_cluster =
			    MArenaCluster = #m_arena_cluster{season_combat_num =
								 SeasonCombatNum,
							     day_combat_num =
								 DayCombatNum,
							     acc_combat_num =
								 AccCombatNum}} =
		      auto_turn_card(Role),
	  NewDayCombatNum = util:if_true(IsOpenDay,
					 DayCombatNum + 1, DayCombatNum),
	  NRole = Role1#role{m_arena_cluster =
				 MArenaCluster#m_arena_cluster{turn_card_reward
								   =
								   NewTurnCard,
							       season_combat_num
								   =
								   SeasonCombatNum
								     + 1,
							       day_combat_num =
								   NewDayCombatNum,
							       acc_combat_num =
								   AccCombatNum
								     + 1}},
	  {TarFaceUpdateTime, TarFaceFile} = list_util:keyfind(1,
							       Ext, {0, <<>>}),
	  sys_conn:pack_send(25611,
			     {2, NowScore, 0, TarName, TarLev, TarFace,
			      TarFaceUpdateTime, TarFaceFile, TarScore, 0,
			      AllHurtStatistics}),
	  {ok, AR} = role_convert:do(arena_cluster_role, Role),
	  NewAR = AR#arena_cluster_role{score = NowScore},
	  arena_cluster_mgr:update_role(NewAR, 0),
	  ReplayList = util:get(arena_cluster_round_log, []),
	  CombatLog = #arena_cluster_log{def_id =
					     TarId = {_, TarSrvId}} =
			  to_combat_log(Role, AF, ReplayList, 28, 2, WinCount,
					LoseCount, NowScore, TarScore),
	  arena_cluster_mgr:save_log({RoleId, Power, TarPower,
				      CombatLog}),
	  case TarSrvId of
	    <<>> -> skip;
	    _ ->
		cluster_lib:cast(TarSrvId, var, acc_role_var,
				 [TarRoleId, other, 9, 0]),
		cluster_lib:cast(TarSrvId, arena_cluster_mgr, save_log,
				 [{TarId, CombatLog}])
	  end,
	  erase(arena_cluster_hurt_statistics),
	  erase(arena_cluster_round_log),
	  erase(arena_cluster_combat_result),
	  Num = arena_cluster_data:get_const(arena_skip_count),
	  NewRole = case SeasonCombatNum + 1 =:= Num of
		      true -> var:set_var(NRole, acc, 2059, 1);
		      _ -> NRole
		    end,
	  push(NewRole),
	  push_day_reward(NewRole),
	  push_red_point(NewRole),
	  {ok, NewRole};
      _ERR ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster599, _,
	     {__Levelarena_cluster599, __Tracesarena_cluster599}}
		when __Levelarena_cluster599 band 8 /= 0 orelse
		       __Tracesarena_cluster599 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster},
			      {function, do_combat_over}, {line, 599},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]进入错误的跨服竞技场战斗结算 ~w",
					   [Role#role.name, _ERR]),
			     none, 4096, 8, __Levelarena_cluster599,
			     __Tracesarena_cluster599, lager_event,
			     __Pidarena_cluster599);
	    _ -> ok
	  end,
	  {ok, Role}
    end.

-spec push_turn_card(#role{}) -> ok.

push_turn_card(#role{m_arena_cluster =
			 #m_arena_cluster{turn_card_reward =
					      TurnCardReward}}) ->
    case TurnCardReward of
      [{_CombatResult, _NewScore, TurnCardL} | _] ->
	  sys_conn:pack_send(25612, {TurnCardL}), ok;
      _ -> sys_conn:pack_send(25612, {[]}), skip
    end.

-spec auto_turn_card(#role{}) -> {ok, #role{}}.

auto_turn_card(Role = #role{m_arena_cluster =
				MArenaCluster =
				    #m_arena_cluster{turn_card_reward =
							 TurnCardReward}}) ->
    case TurnCardReward of
      [{CombatResult, NewScore, TurnCardL} | _] ->
	  case [1 || {_, Status, _, _} <- TurnCardL, Status == 0]
	      of
	    [_ | _] ->
		{RandGroup1, _RandGroup2, _RandGroup3} =
		    arena_cluster_data:get_turn_reward({NewScore,
							CombatResult}),
		{Group1, _} = util:rand_list(RandGroup1, 2),
		{Reward1, _, _} =
		    util:rand_list(arena_cluster_data:turn_reward_list(Group1),
				   3),
		Gain = format:val_to_gain(Reward1,
					  arena_cluster_turn_card),
		case role_gain:do(Role, Gain) of
		  {ok, Role1} ->
		      Role2 = Role1#role{m_arena_cluster =
					     MArenaCluster#m_arena_cluster{turn_card_reward
									       =
									       []}},
		      log:log_gain(Gain, Role, Role2, <<"跨服竞技场"/utf8>>,
				   lang:get(<<"跨服竞技场自动翻牌"/utf8>>)),
		      Role2;
		  _ ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidarena_cluster632, _,
			 {__Levelarena_cluster632, __Tracesarena_cluster632}}
			    when __Levelarena_cluster632 band 8 /= 0 orelse
				   __Tracesarena_cluster632 /= [] ->
			    lager:do_log(error,
					 [{module, arena_cluster},
					  {function, auto_turn_card},
					  {line, 632},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~ts自动翻牌失败了",
						       [Role#role.name]),
					 none, 4096, 8, __Levelarena_cluster632,
					 __Tracesarena_cluster632, lager_event,
					 __Pidarena_cluster632);
			_ -> ok
		      end,
		      Role#role{m_arena_cluster =
				    MArenaCluster#m_arena_cluster{turn_card_reward
								      = []}}
		end;
	    _ ->
		Role#role{m_arena_cluster =
			      MArenaCluster#m_arena_cluster{turn_card_reward =
								[]}}
	  end;
      _ -> Role
    end.

-spec turn_card(#role{}, pos_integer()) -> {false,
					    bitstring()} |
					   {ok, #role{}}.

turn_card(Role = #role{m_arena_cluster =
			   MArenaCluster = #m_arena_cluster{turn_card_reward =
								TurnCardReward}},
	  Pos) ->
    case TurnCardReward of
      [{CombatResult, NewScore, TurnCardL} | _] ->
	  case [1 || {_, Status, _, _} <- TurnCardL, Status == 0]
	      of
	    [_ | _] ->
		{RandGroup1, RandGroup2, RandGroup3} =
		    arena_cluster_data:get_turn_reward({NewScore,
							CombatResult}),
		{Group1, _} = util:rand_list(RandGroup1, 2),
		{Group2, _} = util:rand_list(RandGroup2, 2),
		{Group3, _} = util:rand_list(RandGroup3, 2),
		{Reward1, Val1, _} =
		    util:rand_list(arena_cluster_data:turn_reward_list(Group1),
				   3),
		{Reward2, Val2, _} =
		    util:rand_list(arena_cluster_data:turn_reward_list(Group2),
				   3),
		{Reward3, Val3, _} =
		    util:rand_list(arena_cluster_data:turn_reward_list(Group3),
				   3),
		Gain = format:val_to_gain(Reward1,
					  arena_cluster_turn_card),
		case role_gain:do_notice(Role, Gain,
					 #gain_loss_opts{type = 1})
		    of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, Role1} ->
		      {Pos1, Pos2, Pos3} = if Pos == 1 -> {1, 2, 3};
					      Pos == 2 -> {2, 3, 1};
					      true -> {3, 1, 2}
					   end,
		      TurnCard1 = {Pos1, 2, Reward1, Val1},
		      TurnCard2 = {Pos2, 1, Reward2, Val2},
		      TurnCard3 = {Pos3, 1, Reward3, Val3},
		      NewTurnCardL = [TurnCard1, TurnCard2, TurnCard3],
		      sys_conn:pack_send(25612, {NewTurnCardL}),
		      NewTurnCardReward = [{CombatResult, NewScore,
					    NewTurnCardL}],
		      Role2 = Role1#role{m_arena_cluster =
					     MArenaCluster#m_arena_cluster{turn_card_reward
									       =
									       NewTurnCardReward}},
		      log:log_gain(Gain, Role, Role2, <<"跨服竞技场"/utf8>>,
				   util:fbin("挑战翻牌:~w", [Pos])),
		      {ok, Role2}
		end;
	    _ ->
		case lists:keyfind(Pos, 1, TurnCardL) of
		  {_, 2, _, _} -> {false, lang:get(<<"已经翻开了"/utf8>>)};
		  {_, 1, Reward, Val} ->
		      Gain = format:val_to_gain(Reward,
						arena_cluster_turn_card),
		      Loss = format:val_to_loss(Val, arena_cluster_turn_card),
		      GL = Gain ++ Loss,
		      case role_gain:do_notice(Role, GL,
					       #gain_loss_opts{type = 1})
			  of
			{false, #gain{msg = Msg}} -> {false, Msg};
			{false, #loss{msg = Msg}} -> {false, Msg};
			{ok, Role1} ->
			    NewTurnCardL = lists:keystore(Pos, 1, TurnCardL,
							  {Pos, 2, Reward,
							   Val}),
			    sys_conn:pack_send(25612, {NewTurnCardL}),
			    NewTurnCardReward = [{CombatResult, NewScore,
						  NewTurnCardL}],
			    Role2 = Role1#role{m_arena_cluster =
						   MArenaCluster#m_arena_cluster{turn_card_reward
										     =
										     NewTurnCardReward}},
			    log:log_gain(GL, Role, Role2, <<"跨服竞技场"/utf8>>,
					 util:fbin("挑战翻牌:~w", [Pos])),
			    {ok, Role2}
		      end;
		  _ -> {false, lang:get(<<"翻的牌不存在"/utf8>>)}
		end
	  end;
      _ -> {false, lang:get(<<"没有可以翻的牌"/utf8>>)}
    end.

calc_get_score(win, Score, BScore) ->
    round(math:pow(max(0, 1000 + BScore - Score) / 100, 1.2)
	    + 6);
calc_get_score(lose, Score, BScore) ->
    -round(math:pow(max(0, 1000 + BScore - Score) / 100,
		    1.2)
	     + 1).

-spec set_best_rank(#role{}, Rank :: integer()) -> {ok,
						    #role{}}.

set_best_rank(Role, Rank) when Rank =< 0 -> {ok, Role};
set_best_rank(Role = #role{m_arena_cluster =
			       MArenaCluster = #m_arena_cluster{best_rank =
								    BestRank}},
	      Rank) ->
    NRole = case BestRank =:= 0 orelse Rank < BestRank of
	      true ->
		  Role#role{m_arena_cluster =
				MArenaCluster#m_arena_cluster{best_rank =
								  Rank}};
	      _ -> Role
	    end,
    push(NRole),
    {ok, NRole}.

-spec gen_fight_object(#role{},
		       pos_integer()) -> {false, binary()} |
					 {pos_integer(), list()}.

gen_fight_object(Role, Round) ->
    {ok, _, PushFormations} =
	arena_cluster:get_formation_sys(Role, 1),
    case lists:keyfind(Round, 1, PushFormations) of
      {Round, FormationId, PosInfo, HallowsId, _} ->
	  FightPos = formation_lib:gen_fight_pos(PosInfo,
						 FormationId),
	  AttackList0 = combat_lib:gen_fight_objects(Role,
						     FightPos),
	  AttackList = sprite_tree:gen_fight_object_type(Role, 19,
							 Round)
			 ++
			 hallows_lib:gen_fight_object(Role, HallowsId) ++
			   AttackList0,
	  {FormationId, AttackList};
      _ -> {1, []}
    end.

gen_def_fight_objects(Role,
		      #arena_cluster_f{id = TarRoleId,
				       order_info = OrderInfo},
		      Round) ->
    case lists:keyfind(Round, #arena_cluster_f_order.order,
		       OrderInfo)
	of
      AFO = #arena_cluster_f_order{formation_type =
				       FormationType,
				   pos_info = PosInfo, hallows_id = HId,
				   hallows_lev = HLev,
				   hallows_skill_lev = HSkillLev,
				   hallows_look_id = HLookId,
				   hallows_lucky = HLucky, hallows_seal = HSeal,
				   hallows_all_look_ids = HAllLookIds,
				   extra = Extra} ->
	  case role_robot:get_role(TarRoleId) of
	    {ok, Robot = #role_robot{}} ->
		{SpriteLev, Sprites} = sprite_tree:get_sprite_lev(Robot,
								  20, Round),
		{FormationType,
		 sprite_tree:gen_fight_object_type(Robot, 20, Round) ++
		   hallows_lib:gen_fight_object(Robot, HId) ++
		     [gen_def_fight_object_(P, AFO, Robot, Role)
		      || P <- PosInfo],
		 SpriteLev, Sprites};
	    _ ->
		HallowRefine = list_util:keyfind(1, Extra, 0),
		{FormationType,
		 hallows_lib:gen_def_fight_object(HId, HLev, HSkillLev,
						  HLookId, HAllLookIds, HLucky,
						  HSeal, HallowRefine)
		   ++
		   [gen_def_fight_object_(P, AFO, TarRoleId, Role)
		    || P <- PosInfo],
		 0, []}
	  end;
      _ -> {1, [], 0, []}
    end.

gen_def_fight_object_(#arena_cluster_f_pos{pos = Pos,
					   id = PId, bid = Bid, lev = Lev,
					   star = Star, break_lev = BreakLev,
					   power = Power, set_skill = SetSkill,
					   attr = AllAttr},
		      #arena_cluster_f_order{formation_type = FormationType},
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
		{__Pidarena_cluster760, _,
		 {__Levelarena_cluster760, __Tracesarena_cluster760}}
		    when __Levelarena_cluster760 band 64 /= 0 orelse
			   __Tracesarena_cluster760 /= [] ->
		    lager:do_log(info,
				 [{module, arena_cluster},
				  {function, gen_def_fight_object_},
				  {line, 760}, {pid, pid_to_list(self())},
				  {node, node()}
				  | lager:md()],
				 io_lib:format("玩家[~ts]伙伴已不存在:~w", [Name, Bid]),
				 none, 4096, 64, __Levelarena_cluster760,
				 __Tracesarena_cluster760, lager_event,
				 __Pidarena_cluster760);
		_ -> ok
	      end,
	      BaseData = #partner_base_data{} =
			     partner_data:get_base(Bid),
	      P0 = partner:init_partner(Role, BaseData, PId, Lev,
					Star),
	      P1 = partner_lib:calc_attr(Role,
					 P0#partner{break_lev = BreakLev}),
	      P1#partner{all_attr = AllAttr, power = Power,
			 set_skills = SetSkill}
	end,
    FO1 = partner_lib:gen_fight_object(Robot, 0, P,
				       combat_lib:is_leader(Pos), RoleId, 1),
    FO1#fight_object{pos = Pos1};
gen_def_fight_object_(#arena_cluster_f_pos{pos = Pos,
					   id = PId, bid = Bid, lev = Lev,
					   star = Star, break_lev = BreakLev,
					   power = Power, set_skill = SetSkill,
					   attr = AllAttr, use_skin = UseSkin},
		      #arena_cluster_f_order{formation_type = FormationType},
		      RoleId, Role) ->
    #formation_data{pos = FightPos} =
	formation_data:get_formation(FormationType),
    Pos1 = list_util:keyfind(Pos, FightPos),
    BaseData = #partner_base_data{} =
		   partner_data:get_base(Bid),
    P0 = partner:init_partner(Role, BaseData, PId, Lev,
			      Star),
    P1 = partner_lib:calc_attr(Role,
			       P0#partner{break_lev = BreakLev}),
    P = P1#partner{all_attr = AllAttr, power = Power,
		   set_skills = SetSkill, use_skin = UseSkin},
    FO1 = partner_lib:gen_fight_object(RoleId, 0, P,
				       combat_lib:is_leader(Pos), RoleId, 1),
    FO1#fight_object{pos = Pos1}.

-spec refresh_list(#role{}) -> {ok, #role{}} |
			       {false, binary()}.

refresh_list(Role = #role{m_arena_cluster =
			      MArenaCluster = #m_arena_cluster{ref_time =
								   RefTime,
							       ref_list =
								   RL}}) ->
    Now = date:unixtime(),
    case arena_cluster_mgr:is_opening() of
      false -> {false, lang:get(<<"未到达开启时间"/utf8>>), RefTime};
      _ ->
	  case Now >= RefTime of
	    false ->
		{false, lang:get(<<"刷新冷却中，请稍等"/utf8>>), RefTime};
	    true ->
		ExcludeIds = [RoleIdT
			      || #arena_cluster_f{id = RoleIdT} <- RL],
		RefList = cluster_match(Role, ExcludeIds),
		NewRefTime = Now +
			       arena_cluster_data:get_const(ref_time),
		NRole = Role#role{m_arena_cluster =
				      MArenaCluster#m_arena_cluster{ref_list =
									RefList,
								    ref_time =
									NewRefTime}},
		push(NRole),
		push_list(NRole, 0),
		{ok, NRole, NewRefTime}
	  end
    end.

cluster_match(Role = #role{m_arena_cluster =
			       #m_arena_cluster{ref_list = RefList}},
	      ExcludeIds) ->
    case check_open(Role) of
      true ->
	  IsFirst = util:if_true(RefList == [], true, false),
	  case arena_cluster_mgr:send_call(arena_cluster, match,
					   [Role#role.id, Role#role.max_power,
					    IsFirst, ExcludeIds])
	      of
	    {false, Msg} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster807, _,
		   {__Levelarena_cluster807, __Tracesarena_cluster807}}
		      when __Levelarena_cluster807 band 8 /= 0 orelse
			     __Tracesarena_cluster807 /= [] ->
		      lager:do_log(error,
				   [{module, arena_cluster},
				    {function, cluster_match}, {line, 807},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]跨服竞技场匹配出错[~ts]",
						 [Role#role.name, Msg]),
				   none, 4096, 8, __Levelarena_cluster807,
				   __Tracesarena_cluster807, lager_event,
				   __Pidarena_cluster807);
		  _ -> ok
		end,
		[];
	    L = [_ | _] ->
		Fun = fun ({Idx, RefId, R = #arena_cluster_role{}},
			   Acc) ->
			      AF = gen_arena_f(Role, Idx, RefId, R), [AF | Acc];
			  ({Idx, RefId, _}, Acc) ->
			      AF = gen_robot(Role, Idx, RefId), [AF | Acc]
		      end,
		L1 = lists:foldl(Fun, [], L),
		L2 = util:keys_sort([{asc, #arena_cluster_f.power}],
				    L1),
		NewL = list_util:set_idx(L2, #arena_cluster_f.idx),
		NewL;
	    _ERR ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster823, _,
		   {__Levelarena_cluster823, __Tracesarena_cluster823}}
		      when __Levelarena_cluster823 band 8 /= 0 orelse
			     __Tracesarena_cluster823 /= [] ->
		      lager:do_log(error,
				   [{module, arena_cluster},
				    {function, cluster_match}, {line, 823},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]跨服竞技场匹配出错[~w]",
						 [Role#role.name, _ERR]),
				   none, 4096, 8, __Levelarena_cluster823,
				   __Tracesarena_cluster823, lager_event,
				   __Pidarena_cluster823);
		  _ -> ok
		end,
		[]
	  end;
      _ -> rand_look()
    end.

-spec match(role_id(), pos_integer(), pos_integer(),
	    list()) -> list().

match(RoleId, MaxPower, IsFirst, ExcludeIds) ->
    Score = arena_cluster_lib:role_score(RoleId),
    MyRank = arena_cluster_lib:role_rank(RoleId),
    do_match_(RoleId, MaxPower, 3, Score, MyRank, IsFirst,
	      ExcludeIds, []).

do_match_(_RoleId, _, 0, _Score, _MyRank, _IsFirst,
	  _ExcludeIds, L) ->
    L;
do_match_(RoleId, MaxPower, Idx, Score, MyRank, IsFirst,
	  ExcludeIds, L) ->
    RefId = util:if_true(IsFirst, Idx + 10, Idx),
    ArenaF = case Score >=
		    arena_cluster_data:get_const(protect_score)
		 of
	       true when IsFirst =/= true ->
		   match_player_new(RoleId, MaxPower, Idx, Score, MyRank,
				    RefId, ExcludeIds, L);
	       false when Idx =:= 3 andalso IsFirst =/= true ->
		   match_player_new(RoleId, MaxPower, Idx, Score, MyRank,
				    RefId, ExcludeIds, L);
	       _ -> {Idx, RefId, 0}
	     end,
    do_match_(RoleId, MaxPower, Idx - 1, Score, MyRank,
	      IsFirst, ExcludeIds, [ArenaF | L]).

match_player_new(RoleId, MaxPower, Idx, MyScore, MyRank,
		 RefId, ExcludeIds, L) ->
    ExcludeRoleIds = [RoleId1
		      || {_, _, #arena_cluster_role{id = RoleId1}} <- L],
    NewExcludeIds = [RoleId | ExcludeRoleIds] ++ ExcludeIds,
    #{score_range := ScoreRange,
      power_range := PowerRange} =
	arena_cluster_data:get_ref(RefId),
    MatchPowers = [{round(MinPowerRatio * MaxPower / 1000),
		    round(MaxPowerRatio * MaxPower / 1000)}
		   || {MinPowerRatio, MaxPowerRatio} <- PowerRange],
    Score = MyScore * util:rand(980, 1020) / 1000,
    MatchScores = lists:concat([[{round(MinScoreRatio *
					  Score
					  / 1000),
				  round(MaxScoreRatio * Score / 1000), MinPower,
				  MaxPower2}
				 || {MinPower, MaxPower2}
					<- lists:sublist(MatchPowers, N)]
				|| {MinScoreRatio, MaxScoreRatio, N}
				       <- ScoreRange]),
    case do_match_by_rank_score(MatchScores, MyRank,
				NewExcludeIds)
	of
      {ok, R = #arena_cluster_role{}} -> {Idx, RefId, R};
      _ -> {Idx, RefId, 0}
    end.

do_match_by_rank_score([], _MyRank, _ExcludeIds) ->
    false;
do_match_by_rank_score([{MinScore, MaxScore, MinPower,
			 MaxPower}
			| T],
		       MyRank, ExcludeIds) ->
    case do_match_by_rank_score_([{0, 1}, {0, -1}],
				 util:rand(50, 100), MyRank, MinScore, MaxScore,
				 MinPower, MaxPower, ExcludeIds, null)
	of
      {ok, R} -> {ok, R};
      _ ->
	  case do_match_by_score([{MinScore, MaxScore, MinPower,
				   MaxPower}],
				 util:rand(50, 80), ExcludeIds)
	      of
	    {ok, L1 = [_ | _]} ->
		[R | _] = lists:keysort(#arena_cluster_role.power, L1),
		{ok, R};
	    _ -> do_match_by_rank_score(T, MyRank, ExcludeIds)
	  end
    end.

do_match_by_rank_score_([], _N, _MyRank, _MinScore,
			_MaxScore, _MinPower, _MaxPower, _ExcludeIds, null) ->
    false;
do_match_by_rank_score_([], _N, _MyRank, _MinScore,
			_MaxScore, _MinPower, _MaxPower, _ExcludeIds, R) ->
    {ok, R};
do_match_by_rank_score_(_, 0, _MyRank, _MinScore,
			_MaxScore, _MinPower, _MaxPower, _ExcludeIds, R) ->
    {ok, R};
do_match_by_rank_score_([{I1, I2} | T], N, MyRank,
			MinScore, MaxScore, MinPower, MaxPower, ExcludeIds,
			R) ->
    Next = I1 + I2,
    Rank = MyRank + Next,
    case ets:lookup(arena_cluster_rank, Rank) of
      [#arena_cluster_rank{id = RoleId, score = Score}]
	  when Score >= MinScore andalso Score =< MaxScore ->
	  case arena_cluster_lib:get_role(RoleId) of
	    {ok,
	     R1 = #arena_cluster_role{name = _Name,
				      max_power = Power}}
		when Power >= MinPower andalso Power =< MaxPower ->
		case lists:member(RoleId, ExcludeIds) of
		  true ->
		      do_match_by_rank_score_(T ++ [{Next, I2}], N - 1,
					      MyRank, MinScore, MaxScore,
					      MinPower, MaxPower, ExcludeIds,
					      R);
		  _ ->
		      NewR = compare_arena_role(R, R1),
		      do_match_by_rank_score_(T ++ [{Next, I2}], N - 1,
					      MyRank, MinScore, MaxScore,
					      MinPower, MaxPower, ExcludeIds,
					      NewR)
		end;
	    {ok, _R1} ->
		do_match_by_rank_score_(T ++ [{Next, I2}], N, MyRank,
					MinScore, MaxScore, MinPower, MaxPower,
					ExcludeIds, R);
	    _ ->
		do_match_by_rank_score_(T, N, MyRank, MinScore,
					MaxScore, MinPower, MaxPower,
					ExcludeIds, R)
	  end;
      [_R1] ->
	  do_match_by_rank_score_(T ++ [{Next, I2}], N, MyRank,
				  MinScore, MaxScore, MinPower, MaxPower,
				  ExcludeIds, R);
      _ ->
	  do_match_by_rank_score_(T, N, MyRank, MinScore,
				  MaxScore, MinPower, MaxPower, ExcludeIds, R)
    end.

do_match_by_score([], _N, _ExcludeRoleIds) -> false;
do_match_by_score([{MinScore, MaxScore, MinPower,
		    MaxPower}
		   | T],
		  N, ExcludeRoleIds) ->
    MS = [{{arena_cluster_role, '_', '_', '_', '_', '_',
	    '_', '_', '_', '_', '$2', '_', '$1', '_', '_', '_', '_',
	    '_'},
	   [{'andalso', {'>=', '$1', {const, MinScore}},
	     {'andalso', {'=<', '$1', {const, MaxScore}},
	      {'andalso', {'>=', '$2', {const, MinPower}},
	       {'=<', '$2', {const, MaxPower}}}}}],
	   ['$_']}],
    case ets:select(arena_cluster_role, MS, N) of
      {L1, _} ->
	  case [I
		|| I = #arena_cluster_role{id = RoleId} <- L1,
		   not lists:member(RoleId, ExcludeRoleIds)]
	      of
	    L2 = [_ | _] -> {ok, L2};
	    _ -> do_match_by_score(T, N, ExcludeRoleIds)
	  end;
      _ -> do_match_by_score(T, N, ExcludeRoleIds)
    end.

compare_arena_role(null, R) -> R;
compare_arena_role(#arena_cluster_role{power = Power1},
		   R2 = #arena_cluster_role{power = Power2})
    when Power1 > Power2 ->
    R2;
compare_arena_role(R1, _R2) -> R1.

gen_arena_f(Role, Idx, RefId,
	    #arena_cluster_role{id = TarRoleId, name = Name,
				lev = Lev, sex = Sex, face = Face,
				lookid = LookId}) ->
    case role_robot:get_role(TarRoleId) of
      {ok,
       Robot = #role_robot{partners = PList,
			   m_guild_skill =
			       #m_guild_skill{break_groups = BreakGroups}}} ->
	  {_, _, Defense} = get_formation_sys(Robot, 2),
	  EmptyNum = atk_empty_num(Defense, 3),
	  case Defense == [] orelse EmptyNum >= 2 of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster933, _,
		   {__Levelarena_cluster933, __Tracesarena_cluster933}}
		      when __Levelarena_cluster933 band 128 /= 0 orelse
			     __Tracesarena_cluster933 /= [] ->
		      lager:do_log(debug,
				   [{module, arena_cluster},
				    {function, gen_arena_f}, {line, 933},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~ts的阵容少于两队，所以不被匹配到", [Name]),
				   none, 4096, 128, __Levelarena_cluster933,
				   __Tracesarena_cluster933, lager_event,
				   __Pidarena_cluster933);
		  _ -> ok
		end,
		gen_robot(Role, Idx, RefId);
	    _ ->
		Fun = fun ({Order, FormationType, PosInfo, HallowsId,
			    IsHiddenT},
			   Acc) ->
			      case [P
				    || P <- PosInfo,
				       lists:keymember(P#formation_pos.id,
						       #partner.id, PList)]
				  of
				[] ->
				    NewOrder = #arena_cluster_f_order{order =
									  Order,
								      formation_type
									  =
									  FormationType,
								      hallows_id
									  =
									  HallowsId,
								      hallows_lev
									  = 1,
								      hallows_skill_lev
									  = 1,
								      pos_info =
									  [],
								      power = 0,
								      is_hidden
									  =
									  IsHiddenT},
				    [NewOrder | Acc];
				NewPosInfo ->
				    DefenseT = [to_arena_cluster_f_pos(Pos,
								       lists:keyfind(PartnerId,
										     #partner.id,
										     PList))
						|| #formation_pos{pos = Pos,
								  id =
								      PartnerId}
						       <- NewPosInfo],
				    {HallowsIdT, HallowsLev, HallowsSkillLev,
				     HallowsLookId, HallowsLookIds,
				     HallowsLucky, HallowsSeal} =
					hallows_lib:get_hallows_info2(Robot,
								      HallowsId),
				    AllPowerT = lists:sum([Power
							   || #arena_cluster_f_pos{power
										       =
										       Power}
								  <- DefenseT]),
				    NewOrder = #arena_cluster_f_order{order =
									  Order,
								      formation_type
									  =
									  FormationType,
								      hallows_id
									  =
									  HallowsIdT,
								      hallows_lev
									  =
									  HallowsLev,
								      hallows_skill_lev
									  =
									  HallowsSkillLev,
								      pos_info =
									  DefenseT,
								      hallows_look_id
									  =
									  HallowsLookId,
								      hallows_lucky
									  =
									  HallowsLucky,
								      hallows_seal
									  =
									  HallowsSeal,
								      hallows_all_look_ids
									  =
									  HallowsLookIds,
								      power =
									  AllPowerT,
								      is_hidden
									  =
									  IsHiddenT},
				    [NewOrder | Acc]
			      end
		      end,
		OrderList = lists:foldl(Fun, [], Defense),
		AllPower = lists:sum([PowerT
				      || #arena_cluster_f_order{power = PowerT,
								is_hidden =
								    IsHidden}
					     <- OrderList,
					 IsHidden == 0]),
		{_, FaceFile, FaceUpdateTime} =
		    role_face:face_info(Robot),
		Ext = util:if_true(FaceUpdateTime > 0,
				   [{1, {FaceUpdateTime, FaceFile}}], []),
		NewExt = [{2, BreakGroups} | Ext],
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster976, _,
		   {__Levelarena_cluster976, __Tracesarena_cluster976}}
		      when __Levelarena_cluster976 band 128 /= 0 orelse
			     __Tracesarena_cluster976 /= [] ->
		      lager:do_log(debug,
				   [{module, arena_cluster},
				    {function, gen_arena_f}, {line, 976},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("成功匹配到玩家:~ts==idx:~w power:~w",
						 [Name, Idx, AllPower]),
				   none, 4096, 128, __Levelarena_cluster976,
				   __Tracesarena_cluster976, lager_event,
				   __Pidarena_cluster976);
		  _ -> ok
		end,
		#arena_cluster_f{id = TarRoleId, name = Name, idx = Idx,
				 lev = Lev, sex = Sex, face = Face,
				 look = LookId, power = AllPower,
				 order_info = OrderList, ext = NewExt}
	  end;
      _ -> gen_robot(Role, Idx, RefId)
    end.

to_arena_cluster_f_pos(Pos,
		       P = #partner{all_attr = Attr, set_skills = SetSkills,
				    resonate_lev = ResonateLev}) ->
    #arena_cluster_f_pos{pos = Pos, id = P#partner.id,
			 bid = P#partner.bid, lev = P#partner.lev,
			 star = P#partner.star, break_lev = P#partner.break_lev,
			 power = P#partner.power, attr = Attr,
			 set_skill = SetSkills,
			 extra = [{5, P#partner.use_skin}, {11, ResonateLev}]}.

gen_robot(Role = #role{lev = RLev,
		       partner_bag = #partner_bag{partner_list = PartnerList},
		       max_power = MaxPower},
	  Idx, RefId) ->
    #{robot := RobotIds, robot_power := Powers} =
	arena_cluster_data:get_ref(RefId),
    {MinRatio, MaxRatio} = util:rand_list(Powers),
    PowerRatio = util:rand(MinRatio, MaxRatio),
    Power = round(MaxPower * PowerRatio / 1000),
    RobotId = util:rand_list(RobotIds),
    Name1 = util:rand_list(random_name_data:arena_list(1)),
    Name2 = util:rand_list(random_name_data:arena_list(2)),
    Name3 = util:rand_list(random_name_data:arena_list(3)),
    Name = <<Name1/binary, Name2/binary, Name3/binary>>,
    Sex = util:rand(0, 1),
    MaxNum = min(5, length(PartnerList)),
    AvgPower = Power div MaxNum,
    RobotList = arena_cluster_data:get_robot(RobotId),
    OrderList = do_gen_robot(RobotList, [], Role, 1,
			     AvgPower, MaxNum),
    LookId =
	util:rand_list(arena_cluster_data:get_const(robot_body)),
    FaceId =
	util:rand_list(arena_cluster_data:get_const(robot_headicon)),
    AllPower = lists:sum([PowerT
			  || #arena_cluster_f_order{power = PowerT,
						    is_hidden = IsHidden}
				 <- OrderList,
			     IsHidden == 0]),
    #arena_cluster_f{id = {Idx, <<>>}, name = Name,
		     idx = Idx, lev = RLev, sex = Sex, face = FaceId,
		     look = LookId, power = AllPower, robot_id = RobotId,
		     order_info = OrderList}.

do_gen_robot([], List, _, _, _, _) -> List;
do_gen_robot([RobotId | Other], List, Role, OrderId,
	     AvgPower, MaxNum) ->
    #{partners := Partners, formation := FormationType,
      hallows := {HallowsId, HallowsStep, HallowsSkill}} =
	robot:get(Role, RobotId,
		  #{power => AvgPower, max_num => MaxNum}),
    PosInfo = [#arena_cluster_f_pos{pos = PId, id = PId,
				    bid = Bid, lev = PLev, star = Star,
				    break_lev = BreakLev, power = Power,
				    attr = AllAttr, set_skill = SetSkills}
	       || #partner{id = PId, bid = Bid, lev = PLev,
			   star = Star, break_lev = BreakLev, power = Power,
			   all_attr = AllAttr, set_skills = SetSkills}
		      <- Partners],
    AllPower = lists:sum([Power
			  || #arena_cluster_f_pos{power = Power} <- PosInfo]),
    IsHidden = util:if_true(OrderId == 3, 1, 0),
    Order = #arena_cluster_f_order{order = OrderId,
				   formation_type = FormationType,
				   hallows_id = HallowsId,
				   hallows_lev = HallowsStep,
				   hallows_skill_lev = HallowsSkill,
				   pos_info = PosInfo, power = AllPower,
				   is_hidden = IsHidden},
    NewList = [Order | List],
    do_gen_robot(Other, NewList, Role, OrderId + 1,
		 AvgPower, MaxNum).

-spec get_formation_ids(#role{}) -> pos_integer().

get_formation_ids(Role) ->
    case check_role_open(Role) of
      false -> [];
      _ ->
	  {_, _, Formations} = get_formation_sys_def(Role),
	  PosInfos = lists:flatten([PosInfo
				    || {_, _, PosInfo, _, _} <- Formations]),
	  [PId || #formation_pos{id = PId} <- PosInfos]
    end.

get_formation_sys_def(Role = #role{partner_bag =
				       #partner_bag{partner_list = PartnerList},
				   m_hallows =
				       #m_hallows{hallows_list = HallowsList},
				   m_arena_cluster =
				       MArenaCluster =
					   #m_arena_cluster{formations =
								RFormations}}) ->
    Type = 2,
    case check_role_open(Role) of
      true ->
	  case lists:keyfind(Type, 1, RFormations) of
	    {_, Formations = [_ | _]} ->
		PushFormations = [{OrderT, FormationTypeT,
				   [FP
				    || FP = #formation_pos{id = IdT}
					   <- PosInfoT,
				       partner_lib:get_partner(Role, IdT) =/=
					 false],
				   HallowsIdT, IsHidden}
				  || {OrderT, FormationTypeT, PosInfoT,
				      HallowsIdT, IsHidden}
					 <- Formations],
		case [1 || E <- PushFormations, element(3, E) =/= []] of
		  [_ | _] -> {ok, Role, PushFormations};
		  _ ->
		      #formation_lineup{pos_info = PosInfo,
					type = FormationType,
					hallows_id = HallowsId} =
			  formation_lib:query_formation_info_without_resonate(Role),
		      ExistPartnerIds = [IdT
					 || #formation_pos{id = IdT}
						<- PosInfo],
		      RestPartnerLT = [P
				       || P = #partner{id = IdT,
						       end_time = PEndTime}
					      <- PartnerList,
					  not
					    lists:member(IdT, ExistPartnerIds),
					  PEndTime == 0],
		      RestPartnerL = util:keys_sort([#partner.power],
						    RestPartnerLT),
		      RestHallowsL = [H
				      || H = #hallows{id = IdT} <- HallowsList,
					 IdT =/= HallowsId],
		      AllPartnerBid = get_partner_bid(ExistPartnerIds,
						      PartnerList, []),
		      OtherFormations = auto_set_formations(2, RestPartnerL,
							    RestHallowsL, [],
							    AllPartnerBid),
		      AutoFormations = [{1, FormationType, PosInfo, HallowsId,
					 0}
					| OtherFormations],
		      NewRFormations = lists:keystore(Type, 1, RFormations,
						      {Type, AutoFormations}),
		      NewMArenaCluster =
			  MArenaCluster#m_arena_cluster{formations =
							    NewRFormations},
		      PushFormations1 = [{OrderT, FormationTypeT,
					  [FP
					   || FP = #formation_pos{id = IdT}
						  <- PosInfoT,
					      partner_lib:get_partner(Role, IdT)
						=/= false],
					  HallowsIdT, IsHidden}
					 || {OrderT, FormationTypeT, PosInfoT,
					     HallowsIdT, IsHidden}
						<- AutoFormations],
		      {ok, Role#role{m_arena_cluster = NewMArenaCluster},
		       PushFormations1}
		end;
	    _ ->
		#formation_lineup{pos_info = PosInfo,
				  type = FormationType,
				  hallows_id = HallowsId} =
		    formation_lib:query_formation_info_without_resonate(Role),
		ExistPartnerIds = [IdT
				   || #formation_pos{id = IdT} <- PosInfo],
		RestPartnerLT = [P
				 || P = #partner{id = IdT, end_time = PEndTime}
					<- PartnerList,
				    not lists:member(IdT, ExistPartnerIds),
				    PEndTime == 0],
		RestPartnerL = util:keys_sort([#partner.power],
					      RestPartnerLT),
		RestHallowsL = [H
				|| H = #hallows{id = IdT} <- HallowsList,
				   IdT =/= HallowsId],
		AllPartnerBid = get_partner_bid(ExistPartnerIds,
						PartnerList, []),
		OtherFormations = auto_set_formations(2, RestPartnerL,
						      RestHallowsL, [],
						      AllPartnerBid),
		AutoFormations = [{1, FormationType, PosInfo, HallowsId,
				   0}
				  | OtherFormations],
		NewRFormations = lists:keystore(Type, 1, RFormations,
						{Type, AutoFormations}),
		NewMArenaCluster =
		    MArenaCluster#m_arena_cluster{formations =
						      NewRFormations},
		PushFormations1 = [{OrderT, FormationTypeT,
				    [FP
				     || FP = #formation_pos{id = IdT}
					    <- PosInfoT,
					partner_lib:get_partner(Role, IdT) =/=
					  false],
				    HallowsIdT, IsHidden}
				   || {OrderT, FormationTypeT, PosInfoT,
				       HallowsIdT, IsHidden}
					  <- AutoFormations],
		{ok, Role#role{m_arena_cluster = NewMArenaCluster},
		 PushFormations1}
	  end;
      _ -> {ok, Role, []}
    end.

-spec get_formation_sys(#role{}, pos_integer()) -> {ok,
						    #role{}, list()}.

get_formation_sys(Robot = #role_robot{id = RoleId,
				      partners = PartnerList,
				      m_hallows =
					  #m_hallows{hallows_list =
							 HallowsList},
				      arena_cluster_formation = Formations},
		  _Type) ->
    case Formations of
      [_ | _] ->
	  PushFormations = [{OrderT, FormationTypeT,
			     [FP
			      || FP = #formation_pos{id = IdT} <- PosInfoT,
				 partner_lib:get_partner(Robot, IdT) =/= false],
			     HallowsIdT, IsHidden}
			    || {OrderT, FormationTypeT, PosInfoT, HallowsIdT,
				IsHidden}
				   <- Formations],
	  case [1 || E <- PushFormations, element(3, E) =/= []] of
	    [_ | _] ->
		HidePushFormations = check_rank_hidden(PushFormations,
						       RoleId),
		{ok, Robot, HidePushFormations};
	    _ ->
		#formation_lineup{pos_info = PosInfo,
				  type = FormationType,
				  hallows_id = HallowsId} =
		    formation_lib:query_formation_info_without_resonate(Robot),
		ExistPartnerIds = [IdT
				   || #formation_pos{id = IdT} <- PosInfo],
		RestPartnerLT = [P
				 || P = #partner{id = IdT, end_time = PEndTime}
					<- PartnerList,
				    not lists:member(IdT, ExistPartnerIds),
				    PEndTime == 0],
		RestPartnerL = util:keys_sort([#partner.power],
					      RestPartnerLT),
		RestHallowsL = [H
				|| H = #hallows{id = IdT} <- HallowsList,
				   IdT =/= HallowsId],
		AllPartnerBid = get_partner_bid(ExistPartnerIds,
						PartnerList, []),
		OtherFormations = auto_set_formations(2, RestPartnerL,
						      RestHallowsL, [],
						      AllPartnerBid),
		AutoFormations = [{1, FormationType, PosInfo, HallowsId,
				   0}
				  | OtherFormations],
		PushFormations1 = [{OrderT, FormationTypeT,
				    [FP
				     || FP = #formation_pos{id = IdT}
					    <- PosInfoT,
					partner_lib:get_partner(Robot, IdT) =/=
					  false],
				    HallowsIdT, IsHidden}
				   || {OrderT, FormationTypeT, PosInfoT,
				       HallowsIdT, IsHidden}
					  <- AutoFormations],
		HidePushFormations = check_rank_hidden(PushFormations1,
						       RoleId),
		{ok,
		 Robot#role_robot{arena_cluster_formation =
				      AutoFormations},
		 HidePushFormations}
	  end;
      _ ->
	  #formation_lineup{pos_info = PosInfo,
			    type = FormationType, hallows_id = HallowsId} =
	      formation_lib:query_formation_info_without_resonate(Robot),
	  ExistPartnerIds = [IdT
			     || #formation_pos{id = IdT} <- PosInfo],
	  RestPartnerLT = [P
			   || P = #partner{id = IdT, end_time = PEndTime}
				  <- PartnerList,
			      not lists:member(IdT, ExistPartnerIds),
			      PEndTime == 0],
	  RestPartnerL = util:keys_sort([#partner.power],
					RestPartnerLT),
	  RestHallowsL = [H
			  || H = #hallows{id = IdT} <- HallowsList,
			     IdT =/= HallowsId],
	  AllPartnerBid = get_partner_bid(ExistPartnerIds,
					  PartnerList, []),
	  OtherFormations = auto_set_formations(2, RestPartnerL,
						RestHallowsL, [],
						AllPartnerBid),
	  AutoFormations = [{1, FormationType, PosInfo, HallowsId,
			     0}
			    | OtherFormations],
	  PushFormations1 = [{OrderT, FormationTypeT,
			      [FP
			       || FP = #formation_pos{id = IdT} <- PosInfoT,
				  partner_lib:get_partner(Robot, IdT) =/=
				    false],
			      HallowsIdT, IsHidden}
			     || {OrderT, FormationTypeT, PosInfoT, HallowsIdT,
				 IsHidden}
				    <- AutoFormations],
	  HidePushFormations = check_rank_hidden(PushFormations1,
						 RoleId),
	  {ok,
	   Robot#role_robot{arena_cluster_formation =
				AutoFormations},
	   HidePushFormations}
    end;
get_formation_sys(Role = #role{id = RoleId,
			       partner_bag =
				   #partner_bag{partner_list = PartnerList},
			       m_hallows =
				   #m_hallows{hallows_list = HallowsList},
			       m_arena_cluster =
				   MArenaCluster = #m_arena_cluster{formations =
									RFormations}},
		  Type) ->
    case check_role_open(Role) of
      true ->
	  case lists:keyfind(Type, 1, RFormations) of
	    {_, Formations = [_ | _]} ->
		PushFormations = [{OrderT, FormationTypeT,
				   [FP
				    || FP = #formation_pos{id = IdT}
					   <- PosInfoT,
				       partner_lib:get_partner(Role, IdT) =/=
					 false],
				   HallowsIdT, IsHidden}
				  || {OrderT, FormationTypeT, PosInfoT,
				      HallowsIdT, IsHidden}
					 <- Formations],
		case [1 || E <- PushFormations, element(3, E) =/= []] of
		  [_ | _] ->
		      HidePushFormations = check_rank_hidden(PushFormations,
							     RoleId),
		      {ok, Role, HidePushFormations};
		  _ ->
		      #formation_lineup{pos_info = PosInfo,
					type = FormationType,
					hallows_id = HallowsId} =
			  formation_lib:query_formation_info_without_resonate(Role),
		      ExistPartnerIds = [IdT
					 || #formation_pos{id = IdT}
						<- PosInfo],
		      RestPartnerLT = [P
				       || P = #partner{id = IdT,
						       end_time = PEndTime}
					      <- PartnerList,
					  not
					    lists:member(IdT, ExistPartnerIds),
					  PEndTime == 0],
		      RestPartnerL = util:keys_sort([#partner.power],
						    RestPartnerLT),
		      RestHallowsL = [H
				      || H = #hallows{id = IdT} <- HallowsList,
					 IdT =/= HallowsId],
		      AllPartnerBid = get_partner_bid(ExistPartnerIds,
						      PartnerList, []),
		      OtherFormations = auto_set_formations(2, RestPartnerL,
							    RestHallowsL, [],
							    AllPartnerBid),
		      AutoFormations = [{1, FormationType, PosInfo, HallowsId,
					 0}
					| OtherFormations],
		      NewRFormations = lists:keystore(Type, 1, RFormations,
						      {Type, AutoFormations}),
		      NewMArenaCluster =
			  MArenaCluster#m_arena_cluster{formations =
							    NewRFormations},
		      PushFormations1 = [{OrderT, FormationTypeT,
					  [FP
					   || FP = #formation_pos{id = IdT}
						  <- PosInfoT,
					      partner_lib:get_partner(Role, IdT)
						=/= false],
					  HallowsIdT, IsHidden}
					 || {OrderT, FormationTypeT, PosInfoT,
					     HallowsIdT, IsHidden}
						<- AutoFormations],
		      HidePushFormations = check_rank_hidden(PushFormations1,
							     RoleId),
		      {ok, Role#role{m_arena_cluster = NewMArenaCluster},
		       HidePushFormations}
		end;
	    _ ->
		#formation_lineup{pos_info = PosInfo,
				  type = FormationType,
				  hallows_id = HallowsId} =
		    formation_lib:query_formation_info_without_resonate(Role),
		ExistPartnerIds = [IdT
				   || #formation_pos{id = IdT} <- PosInfo],
		RestPartnerLT = [P
				 || P = #partner{id = IdT, end_time = PEndTime}
					<- PartnerList,
				    not lists:member(IdT, ExistPartnerIds),
				    PEndTime == 0],
		RestPartnerL = util:keys_sort([#partner.power],
					      RestPartnerLT),
		RestHallowsL = [H
				|| H = #hallows{id = IdT} <- HallowsList,
				   IdT =/= HallowsId],
		AllPartnerBid = get_partner_bid(ExistPartnerIds,
						PartnerList, []),
		OtherFormations = auto_set_formations(2, RestPartnerL,
						      RestHallowsL, [],
						      AllPartnerBid),
		AutoFormations = [{1, FormationType, PosInfo, HallowsId,
				   0}
				  | OtherFormations],
		NewRFormations = lists:keystore(Type, 1, RFormations,
						{Type, AutoFormations}),
		NewMArenaCluster =
		    MArenaCluster#m_arena_cluster{formations =
						      NewRFormations},
		PushFormations1 = [{OrderT, FormationTypeT,
				    [FP
				     || FP = #formation_pos{id = IdT}
					    <- PosInfoT,
					partner_lib:get_partner(Role, IdT) =/=
					  false],
				    HallowsIdT, IsHidden}
				   || {OrderT, FormationTypeT, PosInfoT,
				       HallowsIdT, IsHidden}
					  <- AutoFormations],
		HidePushFormations = check_rank_hidden(PushFormations1,
						       RoleId),
		{ok, Role#role{m_arena_cluster = NewMArenaCluster},
		 HidePushFormations}
	  end;
      _ -> {ok, Role, []}
    end.

get_partner_bid([], _PL, AllBid) -> AllBid;
get_partner_bid([Id | Other], PL, AllBid) ->
    case partner_lib:get_partner(PL, Id) of
      #partner{bid = Bid} ->
	  get_partner_bid(Other, PL, [Bid | AllBid]);
      _ -> get_partner_bid(Other, PL, AllBid)
    end.

auto_set_formations(OrderId, _RestPartnerL,
		    _RestHallowsL, L, _AllPartnerBid)
    when OrderId > 3 ->
    L;
auto_set_formations(OrderId, [], RestHallowsL, L,
		    AllPartnerBid) ->
    DefaultFormationType = 1,
    IsHidden = util:if_true(OrderId == 3, 1, 0),
    NewOrder = {OrderId, DefaultFormationType, [], 0,
		IsHidden},
    NewL = [NewOrder | L],
    auto_set_formations(OrderId + 1, [], RestHallowsL, NewL,
			AllPartnerBid);
auto_set_formations(OrderId, RestPartnerL, RestHallowsL,
		    L, AllPartnerBid) ->
    {UsePL, NextPL} = list_util:split(5, RestPartnerL),
    {UseHL, NextHL} = list_util:split(1, RestHallowsL),
    DefaultFormationType = 1,
    HallowsId = case UseHL of
		  [#hallows{id = HallowsIdT} | _] -> HallowsIdT;
		  _ -> 0
		end,
    {NewUsePL, NewNextPL, NewAllPartnerBid} =
	remove_same_partner(UsePL, [], NextPL, [],
			    AllPartnerBid),
    {_, PosInfo} = lists:foldl(fun (#partner{id = PId},
				    {Idx, PosInfoT}) ->
				       {Idx + 1,
					[#formation_pos{pos = Idx, id = PId}
					 | PosInfoT]}
			       end,
			       {1, []}, NewUsePL),
    IsHidden = util:if_true(OrderId == 3, 1, 0),
    NewOrder = {OrderId, DefaultFormationType, PosInfo,
		HallowsId, IsHidden},
    NewL = [NewOrder | L],
    auto_set_formations(OrderId + 1, NewNextPL, NextHL,
			NewL, NewAllPartnerBid).

remove_same_partner([], PosPartnerL, RestPartnerL,
		    _BidL, AllPartnerBid) ->
    {PosPartnerL, RestPartnerL, AllPartnerBid};
remove_same_partner([P = #partner{bid = Bid} | Other],
		    PosPartnerL, RestPartnerL, BidL, AllPartnerBid) ->
    Len = length([1 || BidT <- AllPartnerBid, BidT == Bid]),
    case lists:member(Bid, BidL) orelse Len >= 2 of
      true ->
	  case get_other_partner(Bid, RestPartnerL, BidL,
				 AllPartnerBid)
	      of
	    NewP = #partner{id = NewId, bid = NewBid} ->
		RestPartnerLT = lists:keydelete(NewId, #partner.id,
						RestPartnerL),
		NewRestPartnerL = [P | RestPartnerLT],
		remove_same_partner(Other, [NewP | PosPartnerL],
				    NewRestPartnerL, [NewBid | BidL],
				    [NewBid | AllPartnerBid]);
	    _ ->
		NewRestPartnerL = [P | RestPartnerL],
		remove_same_partner(Other, PosPartnerL, NewRestPartnerL,
				    BidL, AllPartnerBid)
	  end;
      _ ->
	  remove_same_partner(Other, [P | PosPartnerL],
			      RestPartnerL, [Bid | BidL], [Bid | AllPartnerBid])
    end.

get_other_partner(_Bid, [], _BidL, _AllBidL) ->
    undefined;
get_other_partner(Bid, [#partner{bid = Bid} | Other],
		  BidL, AllBidL) ->
    get_other_partner(Bid, Other, BidL, AllBidL);
get_other_partner(Bid,
		  [P = #partner{bid = NewBid} | Other], BidL, AllBidL) ->
    case lists:member(NewBid, BidL) of
      true -> get_other_partner(Bid, Other, BidL, AllBidL);
      _ ->
	  Len = length([1 || BidT <- AllBidL, BidT == NewBid]),
	  case Len >= 2 of
	    true -> get_other_partner(Bid, Other, BidL, AllBidL);
	    _ -> P
	  end
    end.

-spec set_formation_sys(#role{}, pos_integer(),
			list()) -> {ok, #role{}} | {false, binary()}.

set_formation_sys(Role = #role{m_arena_cluster =
				   MArenaCluster = #m_arena_cluster{formations =
									RFormations}},
		  Type, Formations) ->
    SysType = util:if_true(Type == 1, 19, 20),
    case check_can_set(Role, Formations, SysType) of
      {false, Msg} -> {false, Msg};
      {ok, FormationsT} ->
	  NewRFormations = lists:keystore(Type, 1, RFormations,
					  {Type, FormationsT}),
	  NewRole = Role#role{m_arena_cluster =
				  MArenaCluster#m_arena_cluster{formations =
								    NewRFormations}},
	  role_robot:sync_role(NewRole),
	  {ok, NewRole}
    end.

check_can_set(_, [], _) ->
    {false, lang:get(<<"至少需要布置一个英雄"/utf8>>)};
check_can_set(_Role, Formations, _)
    when length(Formations) > 3 ->
    {false, lang:get(<<"最多布置3个队伍"/utf8>>)};
check_can_set(_Role, Formations, _)
    when length(Formations) < 2 ->
    {false, lang:get(<<"至少布置2个队伍"/utf8>>)};
check_can_set(Role, Formations, SysType) ->
    case check_formations(Role, Formations, [], SysType) of
      {false, Msg} -> {false, Msg};
      {ok, NFormations} -> {ok, NFormations}
    end.

check_formations(#role{id = RoleId}, [], L, _) ->
    NewL = [{Order, FormationType, NewPosInfo, HallowsId,
	     IsHidden}
	    || {Order, FormationType, NewPosInfo, HallowsId,
		IsHidden}
		   <- L,
	       NewPosInfo =/= []],
    Len = length(NewL),
    case Len < 2 of
      true -> {false, lang:get(<<"至少上阵两队英雄"/utf8>>)};
      _ -> HideL = check_rank_hidden(L, RoleId), {ok, HideL}
    end;
check_formations(Role = #role{partner_bag =
				  #partner_bag{partner_list = PL}},
		 [{Order, FormationType, PosInfo, HallowsId, IsHidden}
		  | Formations],
		 L, SysType) ->
    case lists:keymember(HallowsId, 4, L) of
      true when HallowsId =/= 0 ->
	  {false, lang:get(<<"不同队伍不能共用同一神器"/utf8>>)};
      _ ->
	  case lists:keymember(Order, 1, L) of
	    true -> {false, lang:get(<<"重复布阵同一队伍"/utf8>>)};
	    _ ->
		AllPos = lists:flatten([NPosInfo
					|| {_, _, NPosInfo, _, _} <- L]),
		AllIds = [IdT || #formation_pos{id = IdT} <- AllPos],
		PosIds = [IdT || {_, IdT} <- PosInfo],
		AllBids = get_partner_bid(AllIds, PL, []),
		PosBids = get_partner_bid(PosIds, PL, []),
		case check_pos_info(PosInfo, AllPos) of
		  {false, Msg} -> {false, Msg};
		  _ ->
		      case check_partner_bid_num(PosBids, AllBids) of
			{false, Msg} -> {false, Msg};
			_ ->
			    case formation:check_formation_pos_info(Role,
								    FormationType,
								    PosInfo,
								    HallowsId,
								    SysType)
				of
			      {false, Reason} -> {false, Reason};
			      {ok, NewPosInfo} ->
				  check_formations(Role, Formations,
						   [{Order, FormationType,
						     NewPosInfo, HallowsId,
						     IsHidden}
						    | L],
						   SysType)
			    end
		      end
		end
	  end
    end.

check_pos_info([], _AllPos) -> ok;
check_pos_info([{_Pos, Id} | PosInfo], AllPos) ->
    case lists:keymember(Id, #formation_pos.id, AllPos) of
      true -> {false, lang:get(<<"同一伙伴不能在多个队伍上阵"/utf8>>)};
      _ -> check_pos_info(PosInfo, AllPos)
    end.

check_partner_bid_num([], _AllBids) -> ok;
check_partner_bid_num([Bid | Other], AllBids) ->
    Len = length([1 || BidT <- AllBids, BidT == Bid]),
    case Len >= 2 of
      true -> {false, lang:get(<<"同一类型的伙伴最多上阵两个"/utf8>>)};
      _ -> check_partner_bid_num(Other, AllBids)
    end.

check_rank_hidden(Formations, RoleId) ->
    Rank = arena_cluster_lib:cluster_role_rank(RoleId),
    MustHideLen = util:if_true(Rank =/= 0 andalso
				 Rank =<
				   arena_cluster_data:get_const(second_hide_rank),
			       2, 1),
    HideOrderIds = [OrderId
		    || {OrderId, _, _, _, 1} <- Formations],
    case length(HideOrderIds) =/= MustHideLen of
      true ->
	  NewHideOrderIds = if MustHideLen == 1 ->
				   {HideOrderIdT, _} = list_util:split(1,
								       HideOrderIds),
				   util:if_true(HideOrderIdT == [], [3],
						HideOrderIdT);
			       true ->
				   {HideOrderIdT, _} = list_util:split(2,
								       HideOrderIds),
				   case HideOrderIdT of
				     [OrderIdT] ->
					 NewOrderIdT = util:if_true(OrderIdT ==
								      1,
								    2, 1),
					 [OrderIdT, NewOrderIdT];
				     [] -> [2, 3];
				     _ -> HideOrderIdT
				   end
			    end,
	  auto_hide_formations(Formations, [], NewHideOrderIds);
      _ -> Formations
    end.

auto_hide_formations([], L, _HideOrderIds) -> L;
auto_hide_formations([{OrderId, FormationType,
		       NewPosInfo, HallowsId, _}
		      | Other],
		     L, HideOrderIds) ->
    case lists:member(OrderId, HideOrderIds) of
      true ->
	  auto_hide_formations(Other,
			       [{OrderId, FormationType, NewPosInfo, HallowsId,
				 1}
				| L],
			       HideOrderIds);
      _ ->
	  auto_hide_formations(Other,
			       [{OrderId, FormationType, NewPosInfo, HallowsId,
				 0}
				| L],
			       HideOrderIds)
    end;
auto_hide_formations([_ERR | Other], L, HideOrderIds) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster1362, _,
       {__Levelarena_cluster1362, __Tracesarena_cluster1362}}
	  when __Levelarena_cluster1362 band 8 /= 0 orelse
		 __Tracesarena_cluster1362 /= [] ->
	  lager:do_log(error,
		       [{module, arena_cluster},
			{function, auto_hide_formations}, {line, 1362},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("跨服竞技场出现奇怪的布阵格式 ~w", [_ERR]), none, 4096,
		       8, __Levelarena_cluster1362, __Tracesarena_cluster1362,
		       lager_event, __Pidarena_cluster1362);
      _ -> ok
    end,
    auto_hide_formations(Other, L, HideOrderIds).

-spec check_role_open(#role{}) -> true | false.

check_role_open(#role{lev = Lev}) ->
    Lev >= arena_cluster_data:get_const(lev_limt) andalso
      world_lev:get_world_lev() >=
	arena_cluster_data:get_const(world_lev_open).

-spec check_open(#role{}) -> true | false.

check_open(#role{lev = Lev}) ->
    Lev >= arena_cluster_data:get_const(lev_limt) andalso
      world_lev:get_world_lev() >=
	arena_cluster_data:get_const(world_lev_open)
	andalso arena_cluster_mgr:is_open().

to_round_log(#role{id = RoleId},
	     #combat_result{action_count = ActionCount,
			    replay_id = ReplayId, a_stat_info = AStatInfo,
			    b_stat_info = BStatInfo, result = ResultT},
	     ARound, BRound, TarId, FormationType, BFormationType,
	     HurtStatistics) ->
    {APower, APlist, AEndHp} = to_p_list(AStatInfo),
    {BPower, BPlist, BEndHp} = to_p_list(BStatInfo),
    combat_replay_mgr:acc_replay_reference(ReplayId),
    #arena_cluster_replay{id = ReplayId,
			  round = ActionCount, ret = ResultT,
			  time = date:unixtime(), a_id = RoleId,
			  a_power = APower, a_formation_type = FormationType,
			  a_order = ARound, a_end_hp = AEndHp, b_id = TarId,
			  b_power = BPower, b_formation_type = BFormationType,
			  b_order = BRound, b_end_hp = BEndHp, a_plist = APlist,
			  b_plist = BPlist,
			  ext =
			      [{1, HurtStatistics}
			       | util:get(arena_cluster_sprite, [])]}.

to_round_log2(#role{id = RoleId}, ResultT, ARound,
	      BRound, TarId, FormationType, BFormationType, AtkGroup,
	      DefendList) ->
    {APower, APlist, AEndHp} = to_p_list2(AtkGroup),
    {BPower, BPlist, BEndHp} = to_p_list2(DefendList),
    #arena_cluster_replay{id = 0, round = ARound,
			  ret = ResultT, time = date:unixtime(), a_id = RoleId,
			  a_power = APower, a_formation_type = FormationType,
			  a_order = ARound, a_end_hp = AEndHp, b_id = TarId,
			  b_power = BPower, b_formation_type = BFormationType,
			  b_order = BRound, b_end_hp = BEndHp, a_plist = APlist,
			  b_plist = BPlist,
			  ext = [{1, []} | util:get(arena_cluster_sprite, [])]}.

to_p_list(StatInfo) ->
    Fun = fun (#{pos := Pos, extra_data := ExtraData,
		 star := Star, power := Power, lev := Lev,
		 object_bid := ObjectBid, hp := Hp, hp_max := HpMax},
	       {Acc1, Acc2, Acc3, Acc4}) ->
		  ReplayP = #arena_cluster_replay_partner{pos =
							      combat_target:logic_pos(Pos),
							  bid = ObjectBid,
							  lev = Lev,
							  star = Star,
							  ext =
							      [{5,
								list_util:keyfind(5,
										  ExtraData,
										  0)},
							       {11,
								list_util:keyfind(11,
										  ExtraData,
										  0)}]},
		  {Acc1 + Power, [ReplayP | Acc2], Acc3 + Hp,
		   Acc4 + HpMax}
	  end,
    {AllPower, PList, AllHp, AllMaxHp} = lists:foldl(Fun,
						     {0, [], 0, 0}, StatInfo),
    {AllPower, PList, util:ceil(AllHp * 100 / AllMaxHp)}.

to_p_list2(StatInfo) ->
    Fun = fun (#fight_object{object_type = 4},
	       {Acc1, Acc2, Acc3, Acc4}) ->
		  {Acc1, Acc2, Acc3, Acc4};
	      (#fight_object{object_type = 5},
	       {Acc1, Acc2, Acc3, Acc4}) ->
		  {Acc1, Acc2, Acc3, Acc4};
	      (#fight_object{pos = Pos, extra_data = ExtraData,
			     star = Star, power = Power, lev = Lev,
			     object_bid = ObjectBid, hp = Hp, hp_max = HpMax},
	       {Acc1, Acc2, Acc3, Acc4}) ->
		  ReplayP = #arena_cluster_replay_partner{pos =
							      combat_target:logic_pos(Pos),
							  bid = ObjectBid,
							  lev = Lev,
							  star = Star,
							  ext =
							      [{5,
								list_util:keyfind(5,
										  ExtraData,
										  0)},
							       {11,
								list_util:keyfind(11,
										  ExtraData,
										  0)}]},
		  {Acc1 + Power, [ReplayP | Acc2], Acc3 + Hp,
		   Acc4 + HpMax}
	  end,
    {AllPower, PList, _AllHp, _AllMaxHp} = lists:foldl(Fun,
						       {0, [], 0, 0}, StatInfo),
    {AllPower, PList, util:if_true(PList == [], 0, 100)}.

to_combat_log(Role = #role{id = Id, name = Name,
			   face_id = FaceId, lev = Lev},
	      #arena_cluster_f{id = Id2, name = Name2, face = FaceId2,
			       lev = Lev2, ext = Ext},
	      ReplayList, CombatType, Ret, WinCount, LoseCount,
	      AtkScore, DefScore) ->
    {_, FaceFile, FaceUpdateTime} =
	role_face:face_info(Role),
    {DefFaceUpdateTime, DefFaceFile} = list_util:keyfind(1,
							 Ext, {0, <<>>}),
    #arena_cluster_log{atk_id = Id, atk_name = Name,
		       atk_face = FaceId, atk_lev = Lev, atk_score = AtkScore,
		       atk_face_update_time = FaceUpdateTime,
		       atk_face_file = FaceFile, def_id = Id2,
		       def_name = Name2, def_face = FaceId2, def_lev = Lev2,
		       def_score = DefScore,
		       def_face_update_time = DefFaceUpdateTime,
		       def_face_file = DefFaceFile, ret = Ret,
		       win_count = WinCount, lose_count = LoseCount,
		       combat_type = CombatType, replay_list = ReplayList,
		       time = date:unixtime()}.

-spec can_skip_combat(#role{}) -> true |
				  {false, binary()}.

can_skip_combat(#role{m_arena_cluster =
			  #m_arena_cluster{season_combat_num =
					       SeasonCombatNum}}) ->
    Num = arena_cluster_data:get_const(arena_skip_count),
    case SeasonCombatNum >= Num of
      true -> true;
      _ ->
	  {false,
	   util:fbin(lang:get(<<"需要赛季挑战~w次后才能跳过战斗"/utf8>>), [Num])}
    end.

-spec push_red_point(#role{}) -> ok.

push_red_point(Role = #role{id = RoleId, lev = Lev,
			    m_arena_cluster =
				#m_arena_cluster{day_reward = DayReward,
						 day_combat_num =
						     DayCombatNum}}) ->
    case Lev >= arena_cluster_data:get_const(lev_limt) of
      true ->
	  L = arena_cluster_lib:cluster_hero_hall(),
	  WL = [role_misc:worship_status(Role, TarRoleId, 4)
		|| #arena_cluster_role{id = TarRoleId = {_, SrvId}}
		       <- L,
		   SrvId =/= <<"">>],
	  Point1 = util:if_true(lists:member(0, WL), 1, 0),
	  AllDayBoxList = arena_cluster_data:day_box_list(),
	  CanBoxList = [NumT
			|| NumT <- AllDayBoxList, DayCombatNum >= NumT],
	  RestBoxList = CanBoxList -- DayReward,
	  Point2 = util:if_true(RestBoxList == [], 0, 1),
	  N = var:get_role_var(RoleId, other, 9, 0),
	  Point3 = util:if_true(N > 0, 1, 0),
	  sys_conn:pack_send(25618, {Point1, Point2, Point3}),
	  ok;
      _ -> skip
    end,
    ok.

merge_flush(Role = #role{m_arena_cluster =
			     MArenaCluster}) ->
    NewRole = Role#role{m_arena_cluster =
			    MArenaCluster#m_arena_cluster{ref_list = []}},
    {ok, NewRole}.


