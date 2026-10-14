-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      1).

-module(holiday_arena_team_lib).

-lager_records([{r_evt_partner_holy_eqpt, [cache]},
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
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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
		{friend_req,
		 [id, name, sex, career, face_id, lev, power, time,
		  avatar_bid, face_update_time, face_file]},
		{role_friend,
		 [id, name, gname, gid, sex, career, face_id, lev, power,
		  login_time, login_out_time, is_online, main_partner_id,
		  partner_bid, partner_lev, partner_star, is_home,
		  avatar_bid, vip_lev, dun_id, soft, face_update_time,
		  face_file]},
		{friend, [myid, fid, intimacy, is_draw, ctime]},
		{friend_tmp,
		 [fid, intimacy, ctime, name, gname, gid, sex, career,
		  face_id, avatar_bid, lev, vip_lev, power, login_time,
		  login_out_time, is_online, is_cross, main_partner_id,
		  partner_bid, partner_lev, partner_star, is_awake,
		  is_used, is_present, is_draw, dun_id, is_fanse, is_home,
		  soft, face_update_time, face_file]},
		{m_friend, [ver, is_open, list]},
		{holiday_arena_team_log_partner,
		 [pos, id, bid, lev, star, power, skin_id, resonate_lev,
		  hurt, be_hurt, curt, ext]},
		{holiday_arena_team_log_info,
		 [id, round, ret, time, a_id, a_name, a_power,
		  a_formation_type, a_order, a_end_hp, a_hallows_id,
		  a_hallows_look_id, a_sprite_lev, a_sprites, b_id,
		  b_name, b_power, b_formation_type, b_order, b_end_hp,
		  b_hallows_id, b_hallows_look_id, b_sprite_lev,
		  b_sprites, a_plist, b_plist, ext]},
		{holiday_arena_team_log_face,
		 [id, pos, is_leader, lev, name, face_id, avatar_bid,
		  face_file, face_update_time]},
		{holiday_arena_team_log,
		 [id, is_atk, atk_id, atk_name, atk_power, atk_face,
		  atk_ole_rank, atk_rank, atk_ole_score, atk_score,
		  def_id, def_name, def_power, def_face, def_ole_rank,
		  def_rank, def_ole_score, def_score, ret, win_count,
		  lose_count, replay_list, time]},
		{role_holiday_arena_team_log, [id, list]},
		{holiday_arena_team_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  resonate_lev, dower_skill, set_skill, attr, extra]},
		{holiday_arena_team_defense_role,
		 [id, name, face_id, power, avatar_bid, lev, pos,
		  is_leader, rank, score, score_lev, face_update_time,
		  face_file, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, partner_infos, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  hallows_refine, sprite_lev, sprite_breka_lev,
		  sprite_attr, sprites, ext, break_groups]},
		{holiday_arena_team_member,
		 [id, name, face_id, power, avatar_bid, lev, pos,
		  is_leader, rank, score, score_lev, face_update_time,
		  face_file, is_online, ext]},
		{holiday_arena_team_role,
		 [ver, id, name, lev, face_id, avatar_bid, power,
		  team_power, face_update_time, face_file, is_online,
		  rank, score, score_lev, score_time, ext]},
		{holiday_arena_team_team,
		 [id, team_role_id, is_leader, pos, is_lock,
		  match_time]},
		{holiday_arena_team_rank,
		 [rank, score, score_lev, id, score_time, power]},
		{m_holiday_arena_team,
		 [ver, period, award_lists, old_data, ref_count,
		  atk_defens, def_defens, end_time, is_enter, is_mail]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{role_match,
		 [id, name, lev, power, max_power, arena_power,
		  arena_max_power]},
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

-export([login/1, login_out/1, init/0, do_open_fire/1,
	 do_close_fire/1, push_base/1, is_open/1, invite/2,
	 invite_handle/2, apply_invite/3, get_invite/1,
	 clear_invite/1, handle_apply_invite/2,
	 invite_join_list/1, search/2, quit_team/1,
	 team_change_leader/2, get_friend_list/1,
	 apply_do_get_friend_list/2, push_save_sys_formation/1,
	 get_recommend_list/1, do_get_recommend_list/3,
	 apply_get_recommend_list/2, match/1, ref_match/1,
	 match_over/2, match_confirm/1, combat/2,
	 combat_pos_info_cache/2, auto_combat/1,
	 do_next_combat/4, do_combat2/1, do_combat_over/3,
	 apply_do_combat_over/2, apply_team_combat_over/1,
	 del_count/1, apply_del_count/1, buy_count/1, get_rank/3,
	 set_max_score/3, calc_lev_award/1, get_lev_award/2,
	 enter/1]).

-export([gm_get_base_power/1]).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      66).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      67).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      68).

-file("inc/role_match.hrl", 1).

-record(role_match,
	{id = {0, <<>>}, name = <<>>, lev = 0, power = 0,
	 max_power = 0, arena_power = 0, arena_max_power = 0}).

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      69).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      70).

-file("inc/holiday_arena_team.hrl", 1).

-record(m_holiday_arena_team,
	{ver = 3, period = 0, award_lists = [], old_data = [],
	 ref_count = 0, atk_defens = [], def_defens = [],
	 end_time = 0, is_enter = 0, is_mail = 0}).

-record(holiday_arena_team_rank,
	{rank = 0, score = 1000, score_lev = 1, id = {0, <<>>},
	 score_time = 0, power = 0}).

-record(holiday_arena_team_team,
	{id = {0, <<>>}, team_role_id = {0, <<>>},
	 is_leader = 0, pos = 0, is_lock = 0, match_time = 0}).

-record(holiday_arena_team_role,
	{ver = 1, id = {0, <<>>}, name = <<>>, lev = 0,
	 face_id = 0, avatar_bid = 0, power = 0, team_power = 0,
	 face_update_time = 0, face_file = <<>>, is_online = 0,
	 rank = 0, score = 1000, score_lev = 1, score_time = 0,
	 ext = []}).

-record(holiday_arena_team_member,
	{id = {0, <<>>}, name = <<>>, face_id = 0, power = 0,
	 avatar_bid = 0, lev = 0, pos = 1, is_leader = 1,
	 rank = 0, score = 0, score_lev = 0,
	 face_update_time = 0, face_file = <<>>, is_online = 0,
	 ext = []}).

-record(holiday_arena_team_defense_role,
	{id = {0, <<>>}, name = <<>>, face_id = 0, power = 0,
	 avatar_bid = 0, lev = 0, pos = 1, is_leader = 1,
	 rank = 0, score = 0, score_lev = 0,
	 face_update_time = 0, face_file = <<>>,
	 formation_type = 0, hallows_id = 0, hallows_lev = 0,
	 hallows_skill_lev = 0, partner_infos = [],
	 hallows_look_id = 0, hallows_lucky = 0,
	 hallows_seal = 0, hallows_all_look_ids = [],
	 hallows_refine = 0, sprite_lev = 0,
	 sprite_breka_lev = 0, sprite_attr, sprites = [],
	 ext = [], break_groups = []}).

-record(holiday_arena_team_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0,
	 resonate_lev = 0, dower_skill = [], set_skill = [],
	 attr, extra = []}).

-record(role_holiday_arena_team_log,
	{id = {0, <<>>}, list = []}).

-record(holiday_arena_team_log,
	{id = 0, is_atk = 0, atk_id = {0, <<>>},
	 atk_name = <<>>, atk_power = <<>>, atk_face = [],
	 atk_ole_rank = 0, atk_rank = 0, atk_ole_score = 0,
	 atk_score = 0, def_id = {0, <<>>}, def_name = <<>>,
	 def_power = <<>>, def_face = [], def_ole_rank = 0,
	 def_rank = 0, def_ole_score = 0, def_score = 0, ret = 1,
	 win_count = 0, lose_count = 0, replay_list = [],
	 time = 0}).

-record(holiday_arena_team_log_face,
	{id = {0, <<>>}, pos = 1, is_leader = 1, lev = 1,
	 name = <<>>, face_id = 0, avatar_bid = 0,
	 face_file = <<>>, face_update_time = 0}).

-record(holiday_arena_team_log_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_name = <<>>, a_power = 0, a_formation_type = 0,
	 a_order = 0, a_end_hp = 0, a_hallows_id = 1,
	 a_hallows_look_id = 0, a_sprite_lev = 0, a_sprites = [],
	 b_id = {0, <<>>}, b_name = <<>>, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 b_hallows_id = 1, b_hallows_look_id = 0,
	 b_sprite_lev = 0, b_sprites = [], a_plist = [],
	 b_plist = [], ext = []}).

-record(holiday_arena_team_log_partner,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0, power = 0,
	 skin_id = 0, resonate_lev = 0, hurt = 0, be_hurt = 0,
	 curt = 0, ext = #{}}).

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      71).

-file("inc/friend.hrl", 1).

-record(m_friend, {ver = 1, is_open = 0, list = []}).

-record(friend_tmp,
	{fid = {0, <<>>}, intimacy = 0, ctime = 0, name = <<>>,
	 gname = <<>>, gid = {0, <<>>}, sex = 0, career = 0,
	 face_id = 0, avatar_bid = 0, lev = 0, vip_lev = 0,
	 power = 0, login_time = 0, login_out_time = 0,
	 is_online = 0, is_cross = 0, main_partner_id = 0,
	 partner_bid = 0, partner_lev = 0, partner_star = 0,
	 is_awake = 0, is_used = 0, is_present = 0, is_draw = 0,
	 dun_id = 1, is_fanse = 0, is_home = 0, soft = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(friend,
	{myid = 0, fid = {0, <<>>}, intimacy = 0, is_draw = 0,
	 ctime = 0}).

-record(role_friend,
	{id = {0, <<>>}, name = <<>>, gname = <<>>,
	 gid = {0, <<>>}, sex = 0, career = 0, face_id = 0,
	 lev = 0, power = 0, login_time = 0, login_out_time = 0,
	 is_online = 0, main_partner_id = 0, partner_bid = 0,
	 partner_lev = 0, partner_star = 0, is_home = 0,
	 avatar_bid = 0, vip_lev = 0, dun_id = 1, soft = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(friend_req,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 face_id = 0, lev = 0, power = 0, time = 0,
	 avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      72).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      73).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      74).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      75).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      76).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      77).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      78).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      79).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      80).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_lib.erl",
      81).

gm_get_base_power(Role = #role{id = RoleId}) ->
    MainId = holiday_arena_team_db:get_main_id(RoleId, 1),
    BasePower = case catch cluster_lib:call(MainId, ets,
					    lookup,
					    [holiday_arena_team_other,
					     base_power])
		    of
		  [{_, BasePowerT} | _] -> BasePowerT;
		  _ -> 0
		end,
    BasePower.

init() -> #m_holiday_arena_team{}.

-spec login(#role{}) -> ok.

login(Role = #role{id = RoleId,
		   m_holiday_arena_team =
		       #m_holiday_arena_team{period = OldPeriod,
					     is_mail = IsMail}}) ->
    case is_open(Role) of
      {true, Period, _} when Period =/= OldPeriod ->
	  {ok, Role1} = case IsMail of
			  0 -> do_close_mail(Role);
			  _ -> {ok, Role}
			end,
	  {ok, NewRole} = do_init_new_period(Role1, Period),
	  holiday_arena_team_mgr:sync_role(NewRole, online),
	  NRole = do_2020_04_04_add_count(NewRole),
	  {ok, NRole};
      {true, Period, _} ->
	  PutLogId = get_new_log_id(RoleId),
	  case PutLogId =/= var:get_var(Role, other, 3118, 0) of
	    true -> put(holiday_arena_team_log_point, 1);
	    _ -> skip
	  end,
	  holiday_arena_team_mgr:sync_role(Role, online),
	  NRole = do_2020_04_04_add_count(Role),
	  {ok, NRole};
      _ when IsMail == 0 ->
	  {ok, Role1} = do_close_mail(Role), {ok, Role1};
      _ -> {ok, Role}
    end.

do_2020_04_04_add_count(Role = #role{id = Id}) ->
    Now = date:unixtime(),
    IsDo20200404 = var:get_var(Role, other, 3121, 0),
    case Now >= 1586016000 andalso
	   Now < 1586102400 andalso IsDo20200404 == 0
	of
      true ->
	  LogCount = min(4, get_log_count(Id)),
	  NewCount = max(0, 6 - LogCount),
	  var:set_role_var(Id, day, 2, max(0, NewCount)),
	  {_, NRole} = case NewCount > 2 of
			 true ->
			     mail:add(Role,
				      {lang:get(<<"特殊维护的协力段位赛补偿"/utf8>>),
				       lang:get(<<"您好，为表达对全国各族人民抗击新冠肺炎疫情斗争牺牲烈士和逝世同胞的深切哀悼，响应国务院全国"
						  "停止公共娱乐活动号召，游戏已于4月4日暂停服务一日。现已将4月4日未使用的次数为您补回，请"
						  "到玩法活动内查看。给您带来不便敬请谅解，祝您游戏愉快！"/utf8>>),
				       [], [],
				       lang:get(<<"特殊维护的协力段位赛补偿"/utf8>>),
				       86400 + date:unixtime()});
			 _ -> {ok, Role}
		       end,
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_arena_team_lib140, _,
	     {__Levelholiday_arena_team_lib140,
	      __Tracesholiday_arena_team_lib140}}
		when __Levelholiday_arena_team_lib140 band 64 /= 0
		       orelse __Tracesholiday_arena_team_lib140 /= [] ->
		lager:do_log(info,
			     [{module, holiday_arena_team_lib},
			      {function, do_2020_04_04_add_count}, {line, 140},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts] 日志记录次数为：~w, 当前设置的次数为:~w",
					   [Role#role.name, LogCount,
					    NewCount]),
			     none, 4096, 64, __Levelholiday_arena_team_lib140,
			     __Tracesholiday_arena_team_lib140, lager_event,
			     __Pidholiday_arena_team_lib140);
	    _ -> ok
	  end,
	  var:set_var(NRole, other, 3121, 1);
      _ -> Role
    end.

get_log_count(Id) ->
    case repair_data:get_4_5(Id) of
      Count when is_integer(Count) -> Count;
      _ -> 0
    end.

-spec login_out(#role{}) -> ok.

login_out(Role = #role{id = RoleId}) ->
    PutLogId = get_new_log_id(RoleId),
    NRole = var:set_var(Role, other, 3118, PutLogId),
    {ok, NRole}.

get_new_log_id(RoleId) ->
    #role_holiday_arena_team_log{list = L} =
	holiday_arena_team_db:get_role_log(RoleId),
    case L of
      [#holiday_arena_team_log{id = LogId} | _] -> LogId;
      _ -> 0
    end.

do_init_new_period(Role = #role{id = RoleId,
				m_holiday_arena_team =
				    M = #m_holiday_arena_team{}},
		   Period) ->
    AllAwardIds =
	holiday_arena_team_data:get_all_lev_award(),
    RankL = case catch ets:lookup(holiday_arena_team_other,
				  init_role_score_data)
		of
	      [{_, L} | _] -> L;
	      _ -> []
	    end,
    {InitScore, InitScoreLev} = list_util:keyfind(RoleId,
						  RankL, {1000, 1}),
    AwardLists = [{Id,
		   util:if_true(InitScoreLev >= Id, 1, 0)}
		  || Id <- AllAwardIds],
    NewM = M#m_holiday_arena_team{period = Period,
				  award_lists = AwardLists,
				  old_data =
				      [M#m_holiday_arena_team{old_data = []}],
				  is_mail = 0},
    NewRole = Role#role{m_holiday_arena_team = NewM},
    var:set_role_var(RoleId, other, 23,
		     {InitScore, InitScoreLev}),
    {ok, NewRole}.

-spec push_save_sys_formation(#role{}) -> #role{}.

push_save_sys_formation(NRole = #role{id = RoleId,
				      m_sprite_tree =
					  #m_sprite_tree{break_lev =
							     SpriteBreak,
							 all_attr = SpriteAttr},
				      m_holiday_arena_team =
					  M = #m_holiday_arena_team{atk_defens =
									AtkDefense}}) ->
    case lists:keyfind(RoleId,
		       #holiday_arena_team_defense_role.id, AtkDefense)
	of
      Data = #holiday_arena_team_defense_role{} ->
	  #formation_sys{type = FormationType, pos_info = PosInfo,
			 hallows_id = HallowsId} =
	      formation:get_sys_formation(NRole, 38),
	  TeamPower = formation:get_sys_formation_power(NRole,
							38),
	  TeamPartners = to_team_partner(NRole, PosInfo),
	  {HallowsId, HallowsLev, HallowsSkillLev, HallowsLookId,
	   HallowsLookIds, HallowsLucky, HallowsSeal} =
	      hallows_lib:get_hallows_info2(NRole, HallowsId),
	  HallowRefine = hallows_lib:get_hallows_refine(NRole,
							HallowsId),
	  {SpriteLev, Sprites} = sprite_tree:get_sprite_lev(NRole,
							    38),
	  NewData =
	      Data#holiday_arena_team_defense_role{formation_type =
						       FormationType,
						   hallows_id = HallowsId,
						   hallows_lev = HallowsLev,
						   hallows_skill_lev =
						       HallowsSkillLev,
						   hallows_look_id =
						       HallowsLookId,
						   hallows_lucky = HallowsLucky,
						   hallows_seal = HallowsSeal,
						   hallows_refine =
						       HallowRefine,
						   hallows_all_look_ids =
						       HallowsLookIds,
						   sprite_breka_lev =
						       SpriteBreak,
						   sprite_lev = SpriteLev,
						   sprites = Sprites,
						   sprite_attr = SpriteAttr,
						   partner_infos = TeamPartners,
						   power = TeamPower},
	  sys_conn:pack_send(29021, {NewData}),
	  NewM = M#m_holiday_arena_team{atk_defens =
					    lists:keystore(RoleId,
							   #holiday_arena_team_defense_role.id,
							   AtkDefense,
							   NewData)},
	  NewRole = NRole#role{m_holiday_arena_team = NewM},
	  holiday_arena_team_mgr:sync_role(NewRole, online),
	  NewRole;
      _ -> NRole
    end.

to_team_partner(#role{partner_bag =
			  #partner_bag{partner_list = PartnerList}},
		PartnerId) ->
    to_team_partner(PartnerList, PartnerId);
to_team_partner(#role_robot{partners = PartnerList},
		PartnerId) ->
    to_team_partner(PartnerList, PartnerId);
to_team_partner(PartnerList, PartnerIds)
    when is_list(PartnerIds) ->
    [begin
       #partner{bid = Bid, use_skin = SkinId, all_attr = Attr,
		dower_skill = DowerSkill, set_skills = SetSkill,
		lev = Lev, break_lev = BreakLev, star = Star,
		power = Power, resonate_lev = ResonateLev} =
	   lists:keyfind(Id, #partner.id, PartnerList),
       #holiday_arena_team_partners_info{attr = Attr,
					 dower_skill = DowerSkill,
					 set_skill = SetSkill, id = Id,
					 pos = Pos, bid = Bid, lev = Lev,
					 break_lev = BreakLev, star = Star,
					 power = Power, use_skin = SkinId,
					 resonate_lev = ResonateLev}
     end
     || #formation_pos{id = Id, pos = Pos} <- PartnerIds].

-spec do_open_fire(#role{}) -> {ok, #role{}}.

do_open_fire(Role = #role{m_holiday_arena_team =
			      #m_holiday_arena_team{period = OldPeriod}}) ->
    case is_open(Role) of
      {true, Period, _} when Period =/= OldPeriod ->
	  {ok, NewRole} = do_init_new_period(Role, Period),
	  holiday_arena_team_mgr:sync_role(NewRole, online),
	  {ok, NewRole};
      {true, Period, _} -> {ok, Role};
      _ -> {ok, Role}
    end.

-spec do_close_fire(#role{}) -> {ok, #role{}}.

do_close_fire(Role = #role{m_holiday_arena_team =
			       #m_holiday_arena_team{period = OldPeriod,
						     is_mail = IsMail}}) ->
    case is_open(Role) of
      {true, Period, _} when Period =/= OldPeriod ->
	  {ok, Role1} = case IsMail of
			  0 -> do_close_mail(Role);
			  _ -> {ok, Role}
			end,
	  {ok, NewRole} = do_init_new_period(Role1, Period),
	  holiday_arena_team_mgr:sync_role(NewRole, online),
	  {ok, NewRole};
      {true, Period, _} -> {ok, Role};
      _ when IsMail == 0 ->
	  {ok, Role1} = do_close_mail(Role), {ok, Role1};
      _ -> {ok, Role}
    end.

do_close_mail(Role = #role{id = RoleId,
			   m_holiday_arena_team =
			       M = #m_holiday_arena_team{award_lists =
							     AwardLists}}) ->
    {_, MaxScoreLev} = var:get_role_var(RoleId, other, 23,
					{1000, 1}),
    AllAwardIds =
	holiday_arena_team_data:get_all_lev_award(),
    Fun = fun (AwardId, {Acc, Acc2}) ->
		  case holiday_arena_team_data:get_lev_award(AwardId) of
		    Award = [_ | _] ->
			State = case catch list_util:keyfind(AwardId,
							     AwardLists, 0)
				    of
				  0 when MaxScoreLev >= AwardId -> 1;
				  1 -> 1;
				  StateT when is_integer(StateT) -> StateT;
				  _ -> 0
				end,
			case State of
			  1 ->
			      {[{AwardId, State} | Acc],
			       item_lib:merge(Award, Acc2)};
			  _ -> {[{AwardId, State} | Acc], Acc2}
			end;
		    _ -> {Acc, Acc2}
		  end
	  end,
    {NewAwardListT, RewardList} = lists:foldl(Fun, {[], []},
					      AllAwardIds),
    var:set_role_var(RoleId, other, 23, {1000, 1}),
    NewAwardList = [{AwardIdT, 2}
		    || {AwardIdT, _} <- NewAwardListT],
    NewM = M#m_holiday_arena_team{award_lists =
				      NewAwardList,
				  is_mail = 1},
    NRole = Role#role{m_holiday_arena_team = NewM},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_lib292, _,
       {__Levelholiday_arena_team_lib292,
	__Tracesholiday_arena_team_lib292}}
	  when __Levelholiday_arena_team_lib292 band 64 /= 0
		 orelse __Tracesholiday_arena_team_lib292 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_arena_team_lib},
			{function, do_close_mail}, {line, 292},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts] ~w补发未领取的奖励:~w",
				     [Role#role.name, RoleId,
				      {NewAwardListT, RewardList}]),
		       none, 4096, 64, __Levelholiday_arena_team_lib292,
		       __Tracesholiday_arena_team_lib292, lager_event,
		       __Pidholiday_arena_team_lib292);
      _ -> ok
    end,
    case RewardList of
      [_ | _] ->
	  {Assets, Items} = format:split_assets_items(RewardList),
	  {ok, NewRole} = mail:add(NRole,
				   {lang:get(<<"协力段位赛段位首达奖励补发"/utf8>>),
				    lang:get(<<"亲爱的冒险者大人，协力段位赛已结束，以下是您未领取的段位首达奖励，请查收！"/utf8>>),
				    Assets, Items,
				    lang:get(<<"协力段位赛段位首达奖励补发"/utf8>>),
				    86400 + date:unixtime()}),
	  {ok, NewRole};
      _ -> {ok, NRole}
    end.

-spec push_base(#role{}) -> {ok, #role{}}.

push_base(Role = #role{id = RoleId,
		       m_holiday_arena_team =
			   M = #m_holiday_arena_team{award_lists = AwardLists,
						     period = OldPeriod}}) ->
    case is_open(Role) of
      {true, Period, EndTime} when OldPeriod =/= Period ->
	  {ok, NewRole} = do_init_new_period(Role, Period),
	  holiday_arena_team_mgr:sync_role(NewRole, online),
	  push_base(NewRole);
      {true, Period, EndTime} ->
	  State = 1,
	  CombatCount = var:get_role_var(RoleId, day, 2,
					 holiday_arena_team_data:get_const(team_battle_free)),
	  BuyCount = var:get_var(Role, day, 153, 0),
	  TeamMateIds =
	      holiday_arena_team_db:get_teammate_info(RoleId),
	  MainId = holiday_arena_team_db:get_main_id(RoleId,
						     Period),
	  Ids = [Id || {Id, _, _} <- TeamMateIds],
	  TeamRoles = case catch cluster_lib:call(MainId,
						  holiday_arena_team_db,
						  get_role_list, [Ids])
			  of
			RankInfosT when is_list(RankInfosT) -> RankInfosT;
			_ -> []
		      end,
	  case get(holiday_arena_team_login_score) of
	    undefined ->
		case lists:keyfind(RoleId,
				   #holiday_arena_team_member.id, TeamRoles)
		    of
		  #holiday_arena_team_member{score_lev = ScoreLev} ->
		      put(holiday_arena_team_login_score, ScoreLev);
		  _ -> skip
		end;
	    _ -> skip
	  end,
	  {_, MaxScoreLev} = var:get_role_var(RoleId, other, 23,
					      {1000, 1}),
	  AllAwardIds =
	      holiday_arena_team_data:get_all_lev_award(),
	  Fun = fun (AwardId, Acc) ->
			case catch list_util:keyfind(AwardId, AwardLists, 0) of
			  0 when MaxScoreLev >= AwardId -> [{AwardId, 1} | Acc];
			  StateT when is_integer(StateT) ->
			      [{AwardId, StateT} | Acc];
			  _ -> [{AwardId, 0} | Acc]
			end
		end,
	  NewAwardList = lists:foldl(Fun, [], AllAwardIds),
	  TeamCombatCount = case
			      holiday_arena_team_db:has_team(RoleId)
				of
			      TeamRoleId = {_, TeamSid} ->
				  case catch cluster_lib:call(TeamSid, var,
							      get_role_var,
							      [TeamRoleId, day,
							       2,
							       holiday_arena_team_data:get_const(team_battle_free)])
				      of
				    Count when is_integer(Count) -> Count;
				    _ -> 0
				  end;
			      _ -> 0
			    end,
	  sys_conn:pack_send(29000,
			     {EndTime, State, CombatCount, BuyCount, TeamRoles,
			      NewAwardList, TeamCombatCount}),
	  {ok,
	   Role#role{m_holiday_arena_team =
			 M#m_holiday_arena_team{award_lists = NewAwardList}}};
      _ ->
	  sys_conn:pack_send(29000, {0, 0, 0, 0, [], [], 0}),
	  {ok, Role}
    end.

-spec search(#role{}, binary()) -> ok.

search(Role = #role{id = RoleId}, Name) ->
    case is_open(Role) of
      {true, Period, _EndTime} ->
	  Opt = #{conds =>
		      [#{type => name, name => Name,
			 min_lev =>
			     holiday_arena_team_data:get_const(team_open_lev)}]},
	  MainId = holiday_arena_team_db:get_main_id(RoleId,
						     Period),
	  ConnPid = get('@conn_pid'),
	  erlang:spawn(fun () -> do_search(ConnPid, Opt, MainId)
		       end);
      _ ->
	  notice:alert(lang:get(<<"活动未开启"/utf8>>)),
	  sys_conn:pack_send(29001, {[]})
    end.

do_search(ConnPid, Opt, MainId) ->
    MainSrvList = holiday_arena_team_db:get_main_srv_list(),
    Fun = fun (Sid, Acc) ->
		  case cluster_lib:call(Sid, role_match, search, [Opt]) of
		    {ok, _, L} -> L ++ Acc;
		    _ -> Acc
		  end
	  end,
    L = lists:foldl(Fun, [], MainSrvList),
    Ids = [Id || #role_match{id = Id} <- L],
    TeamRoles = case catch cluster_lib:call(MainId,
					    holiday_arena_team_db,
					    get_role_list, [Ids])
		    of
		  RankInfosT when is_list(RankInfosT) -> RankInfosT;
		  _ -> []
		end,
    sys_conn:pack_send(ConnPid, 29001, {TeamRoles}).

-spec invite(#role{}, binary()) -> ok |
				   {false, binary()}.

invite(#role{id = RoleId}, RoleId) ->
    {false, lang:get(<<"不能跟自己组队"/utf8>>)};
invite(Role = #role{id = RoleId},
       TarRoleId = {_, TarSid}) ->
    case check_can_invite(Role, TarRoleId) of
      {true, _MainId} ->
	  case cluster_lib:cast(TarSid, holiday_arena_team_lib,
				invite_handle, [TarRoleId, RoleId])
	      of
	    {error, _} -> {false, lang:get(<<"网络繁忙"/utf8>>)};
	    _ ->
		holiday_arena_team_db:update_join_list(RoleId,
						       {add, TarRoleId}),
		NewRole = save_log(Role, 3, #{}),
		{ok, NewRole}
	  end;
      {false, Msg} -> {false, Msg}
    end.

invite_handle(RoleId, TarRoleId) ->
    ets:insert(holiday_arena_team_invite,
	       {RoleId, TarRoleId}),
    role_lib:cast(by_id, RoleId,
		  {role, redirect, [29003, {}]}).

check_can_invite(Role = #role{id = RoleId},
		 TarRoleId = {_, TarSid}) ->
    case is_open(Role) of
      {true, Period, _EndTime} ->
	  MainId1 = holiday_arena_team_db:get_main_id(RoleId,
						      Period),
	  MainId2 = holiday_arena_team_db:get_main_id(TarRoleId,
						      Period),
	  case MainId1 == MainId2 of
	    true ->
		LimitLev =
		    holiday_arena_team_data:get_const(team_open_lev),
		case role_robot:get_role(TarRoleId) of
		  {ok, #role_robot{lev = Lev}} when Lev >= LimitLev ->
		      case holiday_arena_team_db:has_team(RoleId) of
			false ->
			    case catch cluster_lib:call(TarSid,
							holiday_arena_team_db,
							has_team, [TarRoleId])
				of
			      false -> {true, MainId1};
			      _ -> {false, lang:get(<<"该玩家已有队友"/utf8>>)}
			    end;
			_ -> {false, lang:get(<<"自己已有队伍"/utf8>>)}
		      end;
		  _ ->
		      {false,
		       util:fbin(lang:get(<<"该玩家等级不足~w级"/utf8>>), [LimitLev])}
		end;
	    _ -> {false, lang:get(<<"不能与不同赛区的玩家组成队伍"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec apply_invite(#role{}, binary(), 0 | 1) -> ok |
						{false, binary()}.

apply_invite(#role{id = RoleId}, RoleId, _) ->
    sys_conn:pack_send(29004,
		       {0, lang:get(<<"不能跟自己组队"/utf8>>)}),
    ok;
apply_invite(Role = #role{id = RoleId},
	     TarRoleId = {_, TarSid}, 1) ->
    cluster_lib:cast(TarSid, holiday_arena_team_db,
		     update_join_list, [TarRoleId, {del, RoleId}]),
    case check_can_invite(Role, TarRoleId) of
      {true, MainId} ->
	  cluster_lib:cast(MainId, holiday_arena_team_mgr, info,
			   [{apply_invite, RoleId, TarRoleId}]),
	  ok;
      {false, Msg} ->
	  sys_conn:pack_send(29004, {0, Msg}), {false, Msg}
    end;
apply_invite(#role{id = RoleId},
	     TarRoleId = {_, TarSid}, _) ->
    ets:delete_object(holiday_arena_team_invite,
		      {RoleId, TarRoleId}),
    cluster_lib:cast(TarSid, holiday_arena_team_db,
		     update_join_list, [TarRoleId, {del, RoleId}]),
    sys_conn:pack_send(29004, {1, <<>>}),
    ok.

-spec handle_apply_invite(#role{},
			  true | {false, binary()}) -> ok | {false, binary()}.

handle_apply_invite(Role, {tar_true, _}) ->
    clear_invite(Role),
    holiday_arena_team_mgr:sync_role(Role, online),
    {ok, NRole} = push_base(Role),
    {ok, NRole};
handle_apply_invite(Role, {true, _TarRoleId}) ->
    clear_invite(Role),
    holiday_arena_team_mgr:sync_role(Role, online),
    sys_conn:pack_send(29004,
		       {1, lang:get(<<"已加入队伍"/utf8>>)}),
    Role2 = save_log(Role, 4, #{}),
    {ok, NRole} = push_base(Role2),
    {ok, NRole};
handle_apply_invite(_, {false, Msg}) ->
    sys_conn:pack_send(29004, {0, Msg}), ok.

-spec get_invite(#role{}) -> list().

get_invite(Role = #role{id = RoleId}) ->
    case is_open(Role) of
      {true, Period, _EndTime} ->
	  MainId = holiday_arena_team_db:get_main_id(RoleId,
						     Period),
	  L = ets:lookup(holiday_arena_team_invite, RoleId),
	  IdsT = [IdT || {_, IdT} <- L],
	  {Ids, _} = list_util:split(40, IdsT),
	  ConnPid = get('@conn_pid'),
	  erlang:spawn(fun () ->
			       do_get_invite(ConnPid, MainId, Ids)
		       end);
      _ -> sys_conn:pack_send(29003, {[]})
    end.

do_get_invite(ConnPid, MainId, Ids) ->
    TeamRoles = case catch cluster_lib:call(MainId,
					    holiday_arena_team_db,
					    get_role_list, [Ids])
		    of
		  RankInfosT when is_list(RankInfosT) -> RankInfosT;
		  _ -> []
		end,
    sys_conn:pack_send(ConnPid, 29003, {TeamRoles}).

-spec get_recommend_list(#role{}) -> list().

get_recommend_list(Role = #role{id = RoleId,
				max_power = MaxPower, pid = RolePid,
				m_friend = #m_friend{list = List}}) ->
    case is_open(Role) of
      {true, Period, _EndTime} ->
	  case role_misc:check_cd(rpc_29008, 3000) of
	    true ->
		MainId = holiday_arena_team_db:get_main_id(RoleId,
							   Period),
		cluster_lib:cast(MainId, holiday_arena_team_lib,
				 do_get_recommend_list,
				 [RoleId, RolePid, MaxPower]),
		[];
	    _ ->
		sys_conn:pack_send(29008,
				   {util:get(rpc_29008_data, [])})
	  end;
      _ ->
	  notice:alert(lang:get(<<"活动未开启"/utf8>>)),
	  sys_conn:pack_send(29008, {[]})
    end.

do_get_recommend_list(RoleId, RolePid, MaxPower) ->
    MatchInfoT =
	holiday_arena_team_data:get_const(team_recommend_player),
    MatchInfo = [{util:floor(MaxPower * MinPowerRio),
		  util:floor(MaxPower * MaxPowerRio)}
		 || {MinPowerRio, MaxPowerRio} <- MatchInfoT],
    Ids = do_get_recommend_list2(MatchInfo, RoleId, []),
    TeamRoles = holiday_arena_team_db:get_role_list(Ids),
    role_lib:cast(by_pid, RolePid,
		  {holiday_arena_team_lib, apply_get_recommend_list,
		   [TeamRoles]}).

do_get_recommend_list2([], _RoleId, MatchList) ->
    MatchList;
do_get_recommend_list2([{MinPower, MaxPower}
			| MatchInfo],
		       RoleId, MatchList) ->
    Fun = [{{holiday_arena_team_role, '_', '$1', '_', '_',
	     '_', '_', '$2', '_', '_', '_', '_', '_', '_', '_', '_',
	     '_'},
	    [{'andalso', {'=<', {const, MinPower}, '$2'},
	      {'andalso', {'>=', {const, MaxPower}, '$2'},
	       {'=/=', '$1', {const, RoleId}}}}],
	    ['$1']}],
    case ets:select(holiday_arena_team_role, Fun, 60) of
      {MatchL = [_ | _], _} ->
	  NewMatchList = MatchList ++
			   [IdT
			    || IdT <- MatchL,
			       not lists:member(IdT, MatchList) andalso
				 not ets:member(holiday_arena_role_team, IdT)],
	  case length(NewMatchList) >= 30 of
	    true ->
		{Ids, _} = list_util:split(20,
					   list_util:shuffle(NewMatchList)),
		Ids;
	    _ ->
		do_get_recommend_list2(MatchInfo, RoleId, NewMatchList)
	  end;
      _ ->
	  do_get_recommend_list2(MatchInfo, RoleId, MatchList)
    end.

apply_get_recommend_list(Role, TeamRoles) ->
    put(rpc_29008_data, TeamRoles),
    sys_conn:pack_send(29008, {TeamRoles}),
    {ok, Role}.

-spec get_friend_list(#role{}) -> list().

get_friend_list(Role = #role{pid = RolePid, id = RoleId,
			     m_friend = #m_friend{list = List}}) ->
    case is_open(Role) of
      {true, Period, _EndTime} ->
	  case role_misc:check_cd(rpc_29009, 10000) of
	    true ->
		MainId = holiday_arena_team_db:get_main_id(RoleId,
							   Period),
		Ids = [Fid || #friend_tmp{fid = Fid} <- List],
		erlang:spawn(fun () ->
				     do_get_friend_list(RolePid, MainId, Ids,
							Period)
			     end);
	    _ ->
		sys_conn:pack_send(29009,
				   {util:get(rpc_29009_data, [])})
	  end;
      _ ->
	  notice:alert(lang:get(<<"活动未开启"/utf8>>)),
	  sys_conn:pack_send(29009, {[]})
    end.

do_get_friend_list(RolePid, MainId, IdsT, Period) ->
    Ids = [IdT
	   || IdT <- IdsT,
	      holiday_arena_team_db:get_main_id(IdT, Period) ==
		MainId],
    TeamRoles = case catch cluster_lib:call(MainId,
					    holiday_arena_team_db,
					    get_role_list, [Ids])
		    of
		  RankInfosT when is_list(RankInfosT) -> RankInfosT;
		  _ -> []
		end,
    role_lib:cast(by_pid, RolePid,
		  {holiday_arena_team_lib, apply_do_get_friend_list,
		   [TeamRoles]}).

apply_do_get_friend_list(Role, TeamRoles) ->
    put(rpc_29009_data, TeamRoles),
    sys_conn:pack_send(29009, {TeamRoles}),
    {ok, Role}.

-spec clear_invite(#role{}) -> ok.

clear_invite(#role{id = RoleId}) ->
    L = ets:lookup(holiday_arena_team_invite, RoleId),
    [cluster_lib:cast(TarSid, holiday_arena_team_db,
		      update_join_list, [TarRoleId, {del, RoleId}])
     || {_, TarRoleId = {_, TarSid}} <- L],
    ets:delete(holiday_arena_team_invite, RoleId),
    ok.

-spec invite_join_list(#role{}) -> ok.

invite_join_list(#role{id = RoleId}) ->
    L = holiday_arena_team_db:get_join_list(RoleId), L.

-spec quit_team(#role{}) -> ok | {false, binary()}.

quit_team(Role = #role{id = RoleId, pid = RolePid}) ->
    case is_open(Role) of
      {true, Period, _EndTime} ->
	  MainId = holiday_arena_team_db:get_main_id(RoleId,
						     Period),
	  case cluster_lib:cast(MainId, holiday_arena_team_mgr,
				info,
				[{quit_team, RoleId, get('@conn_pid'),
				  RolePid}])
	      of
	    {error, _} -> {false, lang:get(<<"网络繁忙"/utf8>>)};
	    _ -> ok
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec team_change_leader(#role{}, role_id()) -> ok |
						{false, binary()}.

team_change_leader(Role = #role{id = RoleId,
				pid = RolePid},
		   TarRoleId) ->
    case is_open(Role) of
      {true, Period, _EndTime} ->
	  MainId = holiday_arena_team_db:get_main_id(RoleId,
						     Period),
	  case cluster_lib:cast(MainId, holiday_arena_team_mgr,
				info,
				[{team_change_leader, RoleId, TarRoleId,
				  get('@conn_pid'), RolePid}])
	      of
	    {error, _} -> {false, lang:get(<<"网络繁忙"/utf8>>)};
	    _ -> ok
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec set_max_score(role_id(), integer(),
		    integer()) -> ok | {false, binary()}.

set_max_score(RoleId, NewScore, ScoreLev) ->
    {OldScore, Oldlev} = var:get_role_var(RoleId, other, 23,
					  {1000, 1}),
    var:set_role_var(RoleId, other, 23,
		     {max(NewScore, OldScore), max(ScoreLev, Oldlev)}),
    role_lib:cast(by_id, RoleId,
		  {holiday_arena_team_lib, calc_lev_award, []}),
    ok.

-spec calc_lev_award(#role{}) -> {ok, #role{}}.

calc_lev_award(Role = #role{id = RoleId,
			    m_holiday_arena_team =
				M = #m_holiday_arena_team{award_lists =
							      AwardLists}}) ->
    {_OldScore, Oldlev} = var:get_role_var(RoleId, other,
					   23, {1000, 1}),
    NewAwardList = [{AwardId,
		     util:if_true(AwardState == 0 andalso Oldlev >= AwardId,
				  1, AwardState)}
		    || {AwardId, AwardState} <- AwardLists],
    NewM = M#m_holiday_arena_team{award_lists =
				      NewAwardList},
    NRole = Role#role{m_holiday_arena_team = NewM},
    {ok, NewRole} = push_base(NRole),
    {ok, NewRole}.

-spec match(#role{}) -> ok | {false, binary()}.

match(Role = #role{id = RoleId = {Rid, _}, name = Name,
		   max_power = MaxPower, pid = RolePid,
		   m_holiday_arena_team =
		       #m_holiday_arena_team{ref_count = RefCount,
					     atk_defens = AtkDefens,
					     def_defens = DefDefens,
					     is_enter = IsEnter,
					     end_time = EndTime}}) ->
    case is_open(Role) of
      {true, Period, _EndTime} ->
	  case combat_lib:combat_pid(Role, 42) of
	    {_CombatType, _CombatPid} ->
		sys_conn:pack_send(29016,
				   {0, lang:get(<<"已在战斗中"/utf8>>), [], [], 0, 0,
				    0});
	    _ ->
		Data = date:unixtime(),
		case Data > EndTime of
		  true ->
		      MainId = holiday_arena_team_db:get_main_id(RoleId,
								 Period),
		      case ets:lookup(holiday_arena_role_team, RoleId) of
			[#holiday_arena_team_team{is_leader = 0} | _] ->
			    sys_conn:pack_send(29016,
					       {0,
						lang:get(<<"只有队长才能发起挑战"/utf8>>),
						[], [], 0, 0, 0});
			[#holiday_arena_team_team{team_role_id = TeamRoleId}
			 | _] ->
			    case check_count([{RoleId, Name},
					      {TeamRoleId, false}])
				of
			      true ->
				  put(holiday_arena_team_role_id,
				      holiday_arena_team_db:has_team(RoleId)),
				  holiday_arena_team_match_mgr:info(Rid,
								    {RolePid,
								     RoleId,
								     MaxPower,
								     MainId,
								     [RoleId],
								     [RoleId]}),
				  ok;
			      {false, Msg} ->
				  sys_conn:pack_send(29016,
						     {0, Msg, [], [], 0, 0, 0})
			    end;
			_ ->
			    case check_count([{RoleId, Name}]) of
			      true ->
				  put(holiday_arena_team_role_id,
				      holiday_arena_team_db:has_team(RoleId)),
				  holiday_arena_team_match_mgr:info(Rid,
								    {RolePid,
								     RoleId,
								     MaxPower,
								     MainId,
								     [RoleId],
								     [RoleId]}),
				  ok;
			      {false, Msg} ->
				  sys_conn:pack_send(29016,
						     {0, Msg, [], [], 0, 0, 0})
			    end
		      end;
		  _ ->
		      sys_conn:pack_send(29016,
					 {1, <<>>, AtkDefens, DefDefens,
					  RefCount, EndTime, IsEnter})
		end
	  end;
      _ ->
	  sys_conn:pack_send(29016,
			     {0, lang:get(<<"活动未开启"/utf8>>), [], [], 0, 0, 0})
    end.

check_count([]) -> true;
check_count([{Id, Name} | RoleIds]) ->
    case check_count(Id, Name) of
      {false, Msg} -> {false, Msg};
      _ -> check_count(RoleIds)
    end.

check_count(RoleId = {_, Sid}, NameT) ->
    case catch cluster_lib:call(Sid, var, get_role_var,
				[RoleId, day, 2,
				 holiday_arena_team_data:get_const(team_battle_free)])
	of
      Count when is_integer(Count) ->
	  case Count =< 0 of
	    true ->
		Name = case NameT == false of
			 true ->
			     case role_robot:get_role(RoleId) of
			       {ok, #role_robot{name = TarName}} -> TarName;
			       _ -> lang:get(<<"队友"/utf8>>)
			     end;
			 _ -> NameT
		       end,
		{false,
		 util:fbin(lang:get(<<"~ts 挑战次数不足"/utf8>>), [Name])};
	    _ -> true
	  end;
      _ -> {false, lang:get(<<"网络繁忙"/utf8>>)}
    end.

do_del_count(RoleId) ->
    case util:get(holiday_arena_team_role_id, false) of
      TeamRoleId = {_, _} ->
	  role_lib:cast(by_id, TeamRoleId,
			{holiday_arena_team_lib, apply_del_count, []}),
	  do_del_count2([RoleId, TeamRoleId]);
      _ -> do_del_count2([RoleId])
    end.

do_del_count2([]) -> ok;
do_del_count2([RoleId = {_, Sid} | Other]) ->
    cluster_lib:cast(Sid, holiday_arena_team_lib, del_count,
		     [RoleId]),
    do_del_count2(Other).

-spec apply_del_count(#role{}) -> ok.

apply_del_count(Role) ->
    holiday_arena_team_mgr:sync_role(Role, online),
    notice:alert(lang:get(<<"队长已在协力段位赛发起战斗，稍后可查看战报"/utf8>>)),
    ok.

-spec del_count(role_id()) -> ok.

del_count(RoleId) ->
    CombatCount = var:get_role_var(RoleId, day, 2,
				   holiday_arena_team_data:get_const(team_battle_free)),
    case CombatCount > 0 of
      true -> skip;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_arena_team_lib734, _,
	     {__Levelholiday_arena_team_lib734,
	      __Tracesholiday_arena_team_lib734}}
		when __Levelholiday_arena_team_lib734 band 8 /= 0 orelse
		       __Tracesholiday_arena_team_lib734 /= [] ->
		lager:do_log(error,
			     [{module, holiday_arena_team_lib},
			      {function, del_count}, {line, 734},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("角色id:~w玩家在扣除次数时，挑战次数异常:~w",
					   [RoleId, CombatCount]),
			     none, 4096, 8, __Levelholiday_arena_team_lib734,
			     __Tracesholiday_arena_team_lib734, lager_event,
			     __Pidholiday_arena_team_lib734);
	    _ -> ok
	  end
    end,
    var:set_role_var(RoleId, day, 2,
		     max(0, CombatCount - 1)),
    ok.

-spec buy_count(role_id()) -> ok.

buy_count(Role = #role{id = RoleId}) ->
    CombatCount = var:get_role_var(RoleId, day, 2,
				   holiday_arena_team_data:get_const(team_battle_free)),
    BuyCount = var:get_var(Role, day, 153, 0),
    case
      holiday_arena_team_data:get_buy_count_expend(BuyCount +
						     1)
	of
      Expend = [_ | _] ->
	  GL = format:val_to_loss(Expend, buy_count),
	  case role_gain:do(Role, GL) of
	    {ok, NRole} ->
		log:log_gain(GL, Role, NRole, <<"活动组队竞技场购买次数"/utf8>>,
			     util:fbin("当前次数:~w, 当前已购买次数:~w",
				       [CombatCount, BuyCount])),
		var:set_role_var(RoleId, day, 2, CombatCount + 1),
		NewRole = var:set_var(NRole, day, 153, BuyCount + 1),
		{ok, NewRole, CombatCount + 1, BuyCount + 1};
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    _ -> {false, lang:get(<<"购买次数失败"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"今日可购买次数已用完"/utf8>>)}
    end.

-spec ref_match(#role{}) -> ok | {false, binary()}.

ref_match(Role = #role{id = RoleId = {Rid, _},
		       max_power = MaxPower, pid = RolePid,
		       m_holiday_arena_team =
			   #m_holiday_arena_team{ref_count = RefCount,
						 atk_defens = AtkDefens,
						 def_defens = DefDefens,
						 is_enter = IsEnter,
						 end_time = EndTime}}) ->
    case is_open(Role) of
      {true, Period, _EndTime} when DefDefens =/= [] ->
	  case ets:lookup(holiday_arena_role_team, RoleId) of
	    [#holiday_arena_team_team{is_leader = 0} | _] ->
		sys_conn:pack_send(29017,
				   {0, lang:get(<<"只有队长刷新对手"/utf8>>)}),
		{ok, Role};
	    _ ->
		Data = date:unixtime(),
		case Data > EndTime of
		  false ->
		      MainId = holiday_arena_team_db:get_main_id(RoleId,
								 Period),
		      Ids1 = [IdT
			      || #holiday_arena_team_defense_role{id = IdT}
				     <- AtkDefens],
		      Ids2 = [IdT
			      || #holiday_arena_team_defense_role{id = IdT}
				     <- DefDefens],
		      put(holiday_arena_team_role_id,
			  holiday_arena_team_db:has_team(RoleId)),
		      holiday_arena_team_match_mgr:info(Rid,
							{ref_match, RolePid,
							 RoleId, MaxPower,
							 MainId,
							 [RoleId | Ids1],
							 [RoleId | Ids2]}),
		      NewRole =
			  role_timer:del(holiday_arena_team_to_combat_timer,
					 Role),
		      {ok, NewRole};
		  _ when RefCount > 3 ->
		      sys_conn:pack_send(29017,
					 {0, lang:get(<<"刷新次数已用完"/utf8>>)}),
		      {ok, Role};
		  _ ->
		      sys_conn:pack_send(29017,
					 {0,
					  lang:get(<<"当前对手已过期, 重新打开界面自动刷新"/utf8>>)}),
		      {ok, Role}
		end
	  end;
      {true, _Period, _EndTime} ->
	  sys_conn:pack_send(29017,
			     {0, lang:get(<<"当前未匹配对手"/utf8>>)}),
	  {ok, Role};
      _ ->
	  sys_conn:pack_send(29017,
			     {0, lang:get(<<"活动未开启"/utf8>>)}),
	  {ok, Role}
    end.

-spec match_over(#role{}, term()) -> ok |
				     {false, binary()}.

match_over(Role = #role{id = RoleId,
			m_holiday_arena_team = M},
	   {true, AtkDefens, DefDefens}) ->
    case is_open(Role) of
      {true, Period, _} ->
	  MainId = holiday_arena_team_db:get_main_id(RoleId,
						     Period),
	  AfterTime =
	      holiday_arena_team_data:get_const(team_opponent_time),
	  EndTime = date:unixtime() + AfterTime,
	  NewAtkDefens = calc_robot_data(Role, AtkDefens, []),
	  NewDefDefens = calc_robot_data(Role, DefDefens, []),
	  NewRole = Role#role{m_holiday_arena_team =
				  M#m_holiday_arena_team{atk_defens =
							     NewAtkDefens,
							 ref_count = 0,
							 def_defens =
							     NewDefDefens,
							 end_time = EndTime}},
	  sys_conn:pack_send(29016,
			     {1, <<>>, NewAtkDefens, NewDefDefens, 0, EndTime,
			      0}),
	  big_world_lib:cast(MainId, holiday_arena_team_mgr, info,
			     [{match_lock, RoleId, 3600}]),
	  Timer1 = #timer{id = holiday_arena_team_to_combat_timer,
			  timeout = max(1, AfterTime) * 1000, times = 1,
			  m = holiday_arena_team_lib, f = auto_combat, a = []},
	  NewRole2 = role_timer:add(Timer1, NewRole),
	  {ok, NewRole2};
      _ -> {ok, Role}
    end;
match_over(Role = #role{m_holiday_arena_team =
			    M = #m_holiday_arena_team{ref_count = RefCount}},
	   {true, ref_match, AtkDefens, DefDefens}) ->
    AfterTime =
	holiday_arena_team_data:get_const(team_opponent_time),
    EndTime = date:unixtime() + AfterTime,
    NewAtkDefens = calc_robot_data(Role, AtkDefens, []),
    NewDefDefens = calc_robot_data(Role, DefDefens, []),
    NewRole = Role#role{m_holiday_arena_team =
			    M#m_holiday_arena_team{atk_defens = NewAtkDefens,
						   ref_count = RefCount + 1,
						   def_defens = NewDefDefens,
						   end_time = EndTime}},
    sys_conn:pack_send(29016,
		       {1, <<>>, NewAtkDefens, NewDefDefens, RefCount + 1,
			EndTime, 0}),
    Timer1 = #timer{id = holiday_arena_team_to_combat_timer,
		    timeout = max(1, AfterTime) * 1000, times = 1,
		    m = holiday_arena_team_lib, f = auto_combat, a = []},
    NewRole2 = role_timer:add(Timer1, NewRole),
    sys_conn:pack_send(29017, {1, <<>>}),
    {ok, NewRole2};
match_over(Role = #role{m_holiday_arena_team =
			    #m_holiday_arena_team{end_time = EndTime}},
	   {false, ref_match, Msg}) ->
    sys_conn:pack_send(29017, {0, Msg}),
    Timer1 = #timer{id = holiday_arena_team_to_combat_timer,
		    timeout = max(1, EndTime - date:unixtime()) * 1000,
		    times = 1, m = holiday_arena_team_lib, f = auto_combat,
		    a = []},
    NewRole2 = role_timer:add(Timer1, Role),
    {ok, NewRole2};
match_over(Role, {false, Msg}) ->
    sys_conn:pack_send(29016, {0, Msg, [], [], 0, 0, 0}),
    {ok, Role}.

calc_robot_data(_Role, [], L) -> L;
calc_robot_data(Role,
		[Data = #holiday_arena_team_defense_role{id =
							     {_, <<"robot">>}}
		 | Defens],
		L) ->
    Data2 = calc_robot_data(Role, Data),
    calc_robot_data(Role, Defens, [Data2 | L]);
calc_robot_data(Role,
		[Data = #holiday_arena_team_defense_role{id = Id}
		 | Defens],
		L) ->
    calc_robot_data(Role, Defens, [Data | L]).

calc_robot_data(Role,
		Data = #holiday_arena_team_defense_role{id =
							    Id = {Rid, _}}) ->
    RobotId = Rid div 100,
    #{partners := PL, lev := Lev, face := Face,
      formation := FormationType,
      sprite_info := {SpriteLev, SpriteBreakLev, Sprites},
      hallows := {HallowsId, HallowsStep, HallowsSkill}} =
	robot:get(Role, RobotId, #{max_num => 5}),
    PosInfo = [#holiday_arena_team_partners_info{attr =
						     Attr,
						 dower_skill = DowerSkill,
						 set_skill = SetSkill, id = PId,
						 pos = PId, bid = Bid,
						 lev = PLev,
						 break_lev = BreakLev,
						 star = Star, power = Power,
						 use_skin = SkinId,
						 resonate_lev = ResonateLev}
	       || #partner{id = PId, bid = Bid, use_skin = SkinId,
			   lev = PLev, dower_skill = DowerSkill,
			   set_skills = SetSkill, break_lev = BreakLev,
			   all_attr = Attr, star = Star, power = Power,
			   resonate_lev = ResonateLev}
		      <- PL],
    AllPower = lists:sum([PowerT
			  || #holiday_arena_team_partners_info{power = PowerT}
				 <- PosInfo]),
    NamePrefix =
	util:rand_list(random_name_data:arena_list(1)),
    NameMiddle =
	util:rand_list(random_name_data:arena_list(2)),
    NameSuffix =
	util:rand_list(random_name_data:arena_list(3)),
    Name = <<NamePrefix/binary, NameMiddle/binary,
	     NameSuffix/binary>>,
    SpriteAttr = sprite_tree:calc_attr_by_lev(SpriteLev,
					      SpriteBreakLev),
    Data#holiday_arena_team_defense_role{name = Name,
					 face_id = Face,
					 lev =
					     min(role_career_data:get_const(max_lev),
						 Lev),
					 power = AllPower,
					 formation_type = FormationType,
					 hallows_id = HallowsId,
					 hallows_lev = HallowsStep,
					 hallows_skill_lev = HallowsSkill,
					 partner_infos = PosInfo,
					 sprite_lev = SpriteLev,
					 sprite_breka_lev = SpriteBreakLev,
					 sprite_attr = SpriteAttr,
					 sprites = Sprites}.

-spec match_confirm(#role{}) -> ok | {false, binary()}.

match_confirm(Role = #role{m_holiday_arena_team =
			       M = #m_holiday_arena_team{def_defens =
							     [_ | _]}}) ->
    NewRole = Role#role{m_holiday_arena_team =
			    M#m_holiday_arena_team{is_enter = 1}},
    {ok, NewRole};
match_confirm(Role) -> {ok, Role}.

-spec combat_pos_info_cache(#role{}, list()) -> #role{}.

combat_pos_info_cache(Role = #role{m_holiday_arena_team
				       =
				       M = #m_holiday_arena_team{atk_defens =
								     AtkDefens}},
		      PosInfo) ->
    Flag = lists:sort([IdT
		       || #holiday_arena_team_defense_role{id = IdT}
			      <- AtkDefens])
	     == lists:sort([IdT || {IdT, _} <- PosInfo]),
    Flag2 = lists:seq(1, 3) ==
	      lists:sort([PosT || {_, PosT} <- PosInfo]),
    case Flag == false orelse Flag2 == false of
      true -> Role;
      _ ->
	  Fun = fun (Data = #holiday_arena_team_defense_role{id =
								 IdT},
		     Acc) ->
			case lists:keyfind(IdT, 1, PosInfo) of
			  {IdT, PosT} ->
			      [Data#holiday_arena_team_defense_role{pos = PosT}
			       | Acc];
			  _ -> [Data | Acc]
			end
		end,
	  NAtkDefens = lists:foldl(Fun, [], AtkDefens),
	  NewM = M#m_holiday_arena_team{atk_defens = NAtkDefens},
	  Role#role{m_holiday_arena_team = NewM}
    end.

-spec auto_combat(#role{}) -> {ok, #role{}}.

auto_combat(Role) ->
    case combat_lib:combat_pid(Role, 42) of
      {_CombatType, _CombatPid} -> ok;
      false ->
	  case combat(Role) of
	    {false, Msg} -> notice:alert(Msg), ok;
	    {ok, NRole} ->
		NewRole =
		    role_timer:del(holiday_arena_team_to_combat_timer,
				   NRole),
		{ok, NewRole}
	  end;
      _ -> ok
    end.

combat(Role = #role{m_holiday_arena_team =
			#m_holiday_arena_team{atk_defens = AtkDefens,
					      def_defens = DefDefens}})
    when AtkDefens == [] orelse DefDefens == [] ->
    {ok, Role};
combat(Role = #role{m_holiday_arena_team =
			#m_holiday_arena_team{atk_defens = AtkDefens,
					      def_defens = DefDefens}}) ->
    case check_can_combat(Role) of
      {false, Msg} -> {false, Msg};
      _ ->
	  Round = 1,
	  do_combat(Role, Round, AtkDefens, DefDefens, new_combat)
    end.

to_log_face(Data) ->
    #holiday_arena_team_log_face{id =
				     Data#holiday_arena_team_defense_role.id,
				 pos = Data#holiday_arena_team_defense_role.pos,
				 is_leader =
				     Data#holiday_arena_team_defense_role.is_leader,
				 lev = Data#holiday_arena_team_defense_role.lev,
				 name =
				     Data#holiday_arena_team_defense_role.name,
				 face_id =
				     Data#holiday_arena_team_defense_role.face_id,
				 avatar_bid =
				     Data#holiday_arena_team_defense_role.avatar_bid,
				 face_file =
				     Data#holiday_arena_team_defense_role.face_file,
				 face_update_time =
				     Data#holiday_arena_team_defense_role.face_update_time}.

-spec combat(#role{}, list()) -> {ok, #role{}} |
				 {false, binary()}.

combat(Role = #role{m_holiday_arena_team =
			M = #m_holiday_arena_team{atk_defens = AtkDefens,
						  def_defens = DefDefens}},
       PosInfo) ->
    Flag = lists:sort([IdT
		       || #holiday_arena_team_defense_role{id = IdT}
			      <- AtkDefens])
	     == lists:sort([IdT || {IdT, _} <- PosInfo]),
    Flag2 = lists:seq(1, 3) ==
	      lists:sort([PosT || {_, PosT} <- PosInfo]),
    case check_can_combat(Role) of
      {false, Msg} -> {false, Msg};
      _ when Flag == false orelse Flag2 == false ->
	  {false, lang:get(<<"参数错误"/utf8>>)};
      _ ->
	  case combat_lib:combat_pid(Role, 42) of
	    {_CombatType, _CombatPid} ->
		{false, lang:get(<<"已在战斗中"/utf8>>)};
	    _ ->
		Round = 1,
		Fun = fun (Data = #holiday_arena_team_defense_role{id =
								       IdT},
			   Acc) ->
			      case lists:keyfind(IdT, 1, PosInfo) of
				{IdT, PosT} ->
				    [Data#holiday_arena_team_defense_role{pos =
									      PosT}
				     | Acc];
				_ -> [Data | Acc]
			      end
		      end,
		NAtkDefens = lists:foldl(Fun, [], AtkDefens),
		NewM = M#m_holiday_arena_team{atk_defens = NAtkDefens},
		do_combat(Role#role{m_holiday_arena_team = NewM}, Round,
			  NAtkDefens, DefDefens, new_combat)
	  end
    end.

check_can_combat(Role) ->
    case is_open(Role) of
      {true, _Period, _EndTime} -> true;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

do_combat(Role, Round, AtkDefens, DefDefens, _Result)
    when Round > 3 ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_lib990, _,
       {__Levelholiday_arena_team_lib990,
	__Tracesholiday_arena_team_lib990}}
	  when __Levelholiday_arena_team_lib990 band 128 /= 0
		 orelse __Tracesholiday_arena_team_lib990 /= [] ->
	  lager:do_log(debug,
		       [{module, holiday_arena_team_lib},
			{function, do_combat}, {line, 990},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("do_combat==~ts====~w",
				     [Role#role.name, Round]),
		       none, 4096, 128, __Levelholiday_arena_team_lib990,
		       __Tracesholiday_arena_team_lib990, lager_event,
		       __Pidholiday_arena_team_lib990);
      _ -> ok
    end,
    do_combat_over(Role, AtkDefens, DefDefens);
do_combat(RoleT = #role{id = RoleId,
			combat_type_list = CombatTypeList},
	  Round, AtkDefens, DefDefens, Result) ->
    CombatType = 42,
    Role = util:if_true(Round == 1, RoleT,
			RoleT#role{combat_pid = 0,
				   combat_type_list =
				       lists:keydelete(CombatType, 1,
						       CombatTypeList)}),
    {FormationType, AtkList, APartnerObjs} =
	get_fight_object(Role, Round, AtkDefens),
    {BFormationType, DefList, BPartnerObjs} =
	get_fight_object(Role, Round, DefDefens),
    {WinCount, LoseCount} =
	util:get(holiday_arena_team_win_count, {0, 0}),
    {Result1, Result2, Result3} =
	util:get(holiday_arena_team_combat_result, {0, 0, 0}),
    if APartnerObjs == [], BPartnerObjs == [] ->
	   if Round == 1 ->
		  put(holiday_arena_team_combat_result,
		      {3, Result2, Result3});
	      Round == 2 ->
		  put(holiday_arena_team_combat_result,
		      {Result1, 3, Result3});
	      true ->
		  put(holiday_arena_team_combat_result,
		      {Result1, Result2, 3})
	   end,
	   do_combat(Role, Round + 1, AtkDefens, DefDefens,
		     Result);
       APartnerObjs == [] ->
	   if Round == 1 ->
		  put(holiday_arena_team_combat_result,
		      {2, Result2, Result3});
	      Round == 2 ->
		  put(holiday_arena_team_combat_result,
		      {Result1, 2, Result3});
	      true ->
		  put(holiday_arena_team_combat_result,
		      {Result1, Result2, 2})
	   end,
	   put(holiday_arena_team_win_count,
	       {WinCount, LoseCount + 1}),
	   do_combat(Role, Round + 1, AtkDefens, DefDefens,
		     Result);
       BPartnerObjs == [] ->
	   if Round == 1 ->
		  put(holiday_arena_team_combat_result,
		      {1, Result2, Result3});
	      Round == 2 ->
		  put(holiday_arena_team_combat_result,
		      {Result1, 1, Result3});
	      true ->
		  put(holiday_arena_team_combat_result,
		      {Result1, Result2, 1})
	   end,
	   put(holiday_arena_team_win_count,
	       {WinCount + 1, LoseCount}),
	   do_combat(Role, Round + 1, AtkDefens, DefDefens,
		     Result);
       true ->
	   TarName = case lists:keyfind(Round,
					#holiday_arena_team_defense_role.pos,
					DefDefens)
			 of
		       #holiday_arena_team_defense_role{name = NameT} -> NameT;
		       _ -> <<>>
		     end,
	   {AName, AScoreLev} = case lists:keyfind(Round,
						   #holiday_arena_team_defense_role.pos,
						   AtkDefens)
				    of
				  #holiday_arena_team_defense_role{name =
								       NameT2,
								   score_lev =
								       ScoreLevT} ->
				      {NameT2, ScoreLevT};
				  _ -> {<<>>, 1}
				end,
	   {ok, CRole0} = role_convert:do(combat_role, Role),
	   CRole = CRole0#combat_role{name = AName, conn_pid = 0,
				      group = 1, is_auto = true,
				      is_offline = true, auto_watch_model = 1,
				      watching = 0},
	   Args = #{on_role_combat_end =>
			{holiday_arena_team_lib, do_next_combat,
			 [{Round, AtkDefens, DefDefens}]},
		    ext_args =>
			[{cli_ext_args, [Round, Result1, Result2, Result3]},
			 {is_show_panel, false}],
		    formation =>
			[{1, FormationType, 0}, {2, BFormationType, 0}],
		    target_role_name => TarName, combat_role => CRole},
	   put(is_multiple_combat, 1),
	   case combat_lib:start_combat(Role, CombatType, AtkList,
					[DefList], Args)
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
		   {__Pidholiday_arena_team_lib1045, _,
		    {__Levelholiday_arena_team_lib1045,
		     __Tracesholiday_arena_team_lib1045}}
		       when __Levelholiday_arena_team_lib1045 band 128 /= 0
			      orelse __Tracesholiday_arena_team_lib1045 /= [] ->
		       lager:do_log(debug,
				    [{module, holiday_arena_team_lib},
				     {function, do_combat}, {line, 1045},
				     {pid, pid_to_list(self())}, {node, node()}
				     | lager:md()],
				    io_lib:format("do_combat==~ts====~w ~w ~w",
						  [Role#role.name, Round,
						   CombatType,
						   Role#role.combat_type_list]),
				    none, 4096, 128,
				    __Levelholiday_arena_team_lib1045,
				    __Tracesholiday_arena_team_lib1045,
				    lager_event,
				    __Pidholiday_arena_team_lib1045);
		   _ -> ok
		 end,
		 NewRole = case Result == new_combat of
			     true ->
				 put(holiday_arena_team_combat_atk_info,
				     [to_log_face(Data) || Data <- AtkDefens]),
				 put(holiday_arena_team_combat_def_info,
				     [to_log_face(Data) || Data <- DefDefens]),
				 holiday_arena_team_mgr:sync_role(Role, online),
				 do_del_count(RoleId),
				 log:save(task,
					  {Role, 0, AScoreLev,
					   util:fbin(lang:get(<<"段位~w"/utf8>>),
						     [AScoreLev]),
					   91, <<"组队竞技胜率"/utf8>>,
					   <<"战斗开始"/utf8>>}),
				 case util:get(holiday_arena_team_role_id,
					       false)
				     of
				   {TeamRid, TeamSid} ->
				       NewRoleT = save_log(Role, 2,
							   #{team_role_id =>
								 {TeamRid,
								  TeamSid}}),
				       log:save(join,
						{Role, <<"新版组队"/utf8>>,
						 <<"队长挑战"/utf8>>, 1, 0,
						 util:fbin(<<"队友id:~w_~ts"/utf8>>,
							   [TeamRid,
							    TeamSid])}),
				       NewRoleT;
				   _ ->
				       NewRoleT = save_log(Role, 2, #{}),
				       log:save(join,
						{Role, <<"新版组队"/utf8>>,
						 <<"队长挑战"/utf8>>, 1, 0,
						 <<"队友id:[]"/utf8>>}),
				       NewRoleT
				 end;
			     _ -> Role
			   end,
		 NewRole2 =
		     role_timer:del(holiday_arena_team_to_combat_timer,
				    NewRole),
		 {ok, NewRole2};
	     {false, Err} ->
		 case Result == new_combat of
		   true ->
		       case {whereis(lager_event), whereis(lager_event),
			     lager_config:get({lager_event, loglevel}, {0, []})}
			   of
			 {undefined, undefined, _} ->
			     fun () -> {error, lager_not_running} end();
			 {undefined, _, _} ->
			     fun () ->
				     {error, {sink_not_configured, lager_event}}
			     end();
			 {__Pidholiday_arena_team_lib1072, _,
			  {__Levelholiday_arena_team_lib1072,
			   __Tracesholiday_arena_team_lib1072}}
			     when __Levelholiday_arena_team_lib1072 band 8 /= 0
				    orelse
				    __Tracesholiday_arena_team_lib1072 /= [] ->
			     lager:do_log(error,
					  [{module, holiday_arena_team_lib},
					   {function, do_combat}, {line, 1072},
					   {pid, pid_to_list(self())},
					   {node, node()}
					   | lager:md()],
					  io_lib:format("组队竞技场副本进战斗失败:~w",
							[{RoleId, Round, Err}]),
					  none, 4096, 8,
					  __Levelholiday_arena_team_lib1072,
					  __Tracesholiday_arena_team_lib1072,
					  lager_event,
					  __Pidholiday_arena_team_lib1072);
			 _ -> ok
		       end,
		       case is_open(Role) of
			 {true, Period, _EndTime} ->
			     MainId = holiday_arena_team_db:get_main_id(RoleId,
									Period),
			     big_world_lib:cast(MainId, holiday_arena_team_mgr,
						info, [{match_unlock, RoleId}]);
			 _ -> skip
		       end,
		       erase(is_multiple_combat),
		       {false, Err};
		   _ ->
		       do_combat(Role, Round + 1, AtkDefens, DefDefens, Result)
		 end
	   end
    end.

get_fight_object(Role = #role{id = Id,
			      partner_bag =
				  #partner_bag{partner_list = Partners}},
		 Round, AtkDefens) ->
    case lists:keyfind(Round,
		       #holiday_arena_team_defense_role.pos, AtkDefens)
	of
      #holiday_arena_team_defense_role{id = Id} ->
	  #formation_sys{type = FormationType, pos_info = PosInfo,
			 hallows_id = HallowsId} =
	      formation:get_sys_formation(Role, 38),
	  #formation_data{pos = FightPos} =
	      formation_data:get_formation(FormationType),
	  Fun = fun (#formation_pos{id = IdT, pos = Pos}) ->
			Partner = lists:keyfind(IdT, #partner.id, Partners),
			FO1 = partner_lib:gen_fight_object(Role, Partner,
							   combat_lib:is_leader(Pos)),
			Pos1 = list_util:keyfind(Pos, FightPos),
			FO1#fight_object{pos = Pos1}
		end,
	  PartnerObj = [Fun(P) || P <- PosInfo],
	  AtkGroup = sprite_tree:gen_fight_object_type(Role, 38)
		       ++
		       hallows_lib:gen_fight_object(Role, HallowsId) ++
			 PartnerObj,
	  AtkGroup1 = combat_attr:calc(AtkGroup, 42, Role),
	  {FormationType, AtkGroup1, PartnerObj};
      DeFenseRole = #holiday_arena_team_defense_role{id =
							 TarRoleId,
						     lev = Rolelev,
						     sprite_lev = SpriteLev,
						     sprite_attr = SpriteAttr,
						     sprites = Sprites,
						     hallows_id = HallowsId,
						     hallows_lev = HallowsLev,
						     hallows_skill_lev =
							 HallowsSkillLev,
						     formation_type =
							 FormationType,
						     hallows_refine =
							 HallowsRefine,
						     partner_infos =
							 PartnerDefense,
						     hallows_look_id =
							 HallowsLookId,
						     hallows_lucky =
							 HallowsLucky,
						     hallows_seal = HallowsSeal,
						     hallows_all_look_ids =
							 AllLooksIds} ->
	  PartnerObj = [gen_def_fight_objects_(PartnerInfo,
					       FormationType, TarRoleId, Role)
			|| PartnerInfo <- PartnerDefense],
	  AtkGroup = sprite_tree:gen_fight_object(Rolelev,
						  SpriteLev, SpriteAttr,
						  Sprites)
		       ++
		       hallows_lib:gen_def_fight_object(HallowsId, HallowsLev,
							HallowsSkillLev,
							HallowsLookId,
							AllLooksIds,
							HallowsLucky,
							HallowsSeal,
							HallowsRefine)
			 ++ PartnerObj,
	  AtkGroup1 = combat_attr:calc(AtkGroup, 42, DeFenseRole),
	  {FormationType, AtkGroup1, PartnerObj};
      _ -> {1, [], []}
    end.

gen_def_fight_objects_(#holiday_arena_team_partners_info{pos
							     = Pos,
							 id = Id, bid = Bid,
							 lev = Lev, star = Star,
							 break_lev = BreakLev,
							 dower_skill =
							     DowerSkill,
							 power = Power,
							 attr = Attr,
							 set_skill = SetSkill,
							 use_skin = UseSkin,
							 resonate_lev =
							     ResnateLev},
		       FormationType, RoleId, Role) ->
    #formation_data{pos = FightPos} =
	formation_data:get_formation(FormationType),
    Pos1 = list_util:keyfind(Pos, FightPos),
    BaseData = #partner_base_data{} =
		   partner_data:get_base(Bid),
    P0 = partner:init_partner(Role, BaseData, Id, Lev,
			      Star),
    P = partner_lib:calc_attr(Role,
			      P0#partner{break_lev = BreakLev,
					 dower_skill = DowerSkill}),
    P1 = P#partner{all_attr = Attr, power = Power,
		   lev = Lev, star = Star, break_lev = BreakLev,
		   set_skills = SetSkill, use_skin = UseSkin,
		   resonate_lev = ResnateLev},
    FO1 = partner_lib:gen_fight_object(RoleId, 0, P1,
				       combat_lib:is_leader(Pos), RoleId, 1),
    FO1#fight_object{pos = Pos1}.

do_combat2(Role) ->
    case erase(holiday_arena_team_do_combat_arge) of
      {Round, AtkDefens, DefDefens, ResultT} ->
	  case do_combat(Role, Round, AtkDefens, DefDefens,
			 ResultT)
	      of
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
		  {__Pidholiday_arena_team_lib1147, _,
		   {__Levelholiday_arena_team_lib1147,
		    __Tracesholiday_arena_team_lib1147}}
		      when __Levelholiday_arena_team_lib1147 band 8 /= 0
			     orelse __Tracesholiday_arena_team_lib1147 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_arena_team_lib},
				    {function, do_combat2}, {line, 1147},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]进战斗失败~w",
						 [Role#role.name, _ERR]),
				   none, 4096, 8,
				   __Levelholiday_arena_team_lib1147,
				   __Tracesholiday_arena_team_lib1147,
				   lager_event,
				   __Pidholiday_arena_team_lib1147);
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
	    {__Pidholiday_arena_team_lib1151, _,
	     {__Levelholiday_arena_team_lib1151,
	      __Tracesholiday_arena_team_lib1151}}
		when __Levelholiday_arena_team_lib1151 band 8 /= 0
		       orelse __Tracesholiday_arena_team_lib1151 /= [] ->
		lager:do_log(error,
			     [{module, holiday_arena_team_lib},
			      {function, do_combat2}, {line, 1151},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~ts跨服竞技场进下一场战斗失败~w",
					   [Role#role.name, _Err]),
			     none, 4096, 8, __Levelholiday_arena_team_lib1151,
			     __Tracesholiday_arena_team_lib1151, lager_event,
			     __Pidholiday_arena_team_lib1151);
	    _ -> ok
	  end,
	  ok
    end.

-spec do_next_combat(#role{}, #combat_result{},
		     #combat{}, tuple()) -> {ok, #role{}}.

do_next_combat(Role = #role{pid = Pid,
			    ui_combat_type = UiCombatType},
	       CombatResult = #combat_result{hurt_statistics =
						 HurtStatistics,
					     replay_id = ReplayId,
					     result = ResultT},
	       _Combat, {Round, AtkDefens, DefDefens}) ->
    {Result1, Result2, Result3} =
	util:get(holiday_arena_team_combat_result, {0, 0, 0}),
    if Round == 1 ->
	   put(holiday_arena_team_combat_result,
	       {ResultT, Result2, Result3});
       Round == 2 ->
	   put(holiday_arena_team_combat_result,
	       {Result1, ResultT, Result3});
       true ->
	   put(holiday_arena_team_combat_result,
	       {Result1, Result2, ResultT})
    end,
    {OldWinCount, OldLose} =
	util:get(holiday_arena_team_win_count, {0, 0}),
    {WinCount, Lose} = case ResultT == 1 of
			 true ->
			     put(holiday_arena_team_win_count,
				 {OldWinCount + 1, OldLose}),
			     {OldWinCount + 1, OldLose};
			 _ ->
			     put(holiday_arena_team_win_count,
				 {OldWinCount, OldLose + 1}),
			     {OldWinCount, OldLose + 1}
		       end,
    OldRoundLog = util:get(holiday_arena_team_round_log,
			   []),
    RoundLog = #holiday_arena_team_log_info{a_name = AName,
					    b_name = BName} =
		   to_round_log(CombatResult, Round, AtkDefens, DefDefens),
    put(holiday_arena_team_hurt_statistics,
	[{Round, Round, Round, HurtStatistics, ReplayId, AName,
	  BName, ResultT}
	 | util:get(holiday_arena_team_hurt_statistics, [])]),
    put(holiday_arena_team_round_log,
	[{Round, RoundLog} | OldRoundLog]),
    case WinCount >= 2 orelse Lose >= 2 of
      true -> do_combat_over(Role, AtkDefens, DefDefens);
      _ ->
	  case UiCombatType == 42 of
	    true ->
		put(holiday_arena_team_do_combat_arge,
		    {Round + 1, AtkDefens, DefDefens, ResultT}),
		role:apply(async, Pid,
			   {holiday_arena_team_lib, do_combat2, []}),
		{ok, Role};
	    _ ->
		do_combat(Role, Round + 1, AtkDefens, DefDefens,
			  ResultT)
	  end
    end.

do_combat_over(Role = #role{id = RoleId, pid = RolePid},
	       AtkDefens, DefDefens) ->
    HurtStatistics =
	util:get(holiday_arena_team_hurt_statistics, []),
    {WinCount, LoseCount} =
	util:get(holiday_arena_team_win_count, {0, 0}),
    put(holiday_arena_team_combat_over_statistics,
	HurtStatistics),
    erase(is_multiple_combat),
    erase(holiday_arena_team_hurt_statistics),
    erase(holiday_arena_team_win_count),
    erase(holiday_arena_team_combat_result),
    erase(holiday_arena_team_do_combat_arge),
    case is_open(Role) of
      {true, Period, EndTime} ->
	  MainId = holiday_arena_team_db:get_main_id(RoleId,
						     Period),
	  {MyRank, MyScore, MyScoreLev} = case
					    lists:keyfind(RoleId,
							  #holiday_arena_team_defense_role.id,
							  AtkDefens)
					      of
					    #holiday_arena_team_defense_role{rank
										 =
										 RankT,
									     score
										 =
										 ScoreT,
									     score_lev
										 =
										 ScoreLevT} ->
						{RankT, ScoreT, ScoreLevT};
					    _ -> {0, 1000, 1}
					  end,
	  {TarRank, TarScore, TarScoreLev, TarRoleId} = case
							  lists:keyfind(1,
									#holiday_arena_team_defense_role.is_leader,
									DefDefens)
							    of
							  #holiday_arena_team_defense_role{rank
											       =
											       RankT1,
											   score
											       =
											       ScoreT1,
											   score_lev
											       =
											       ScoreLevT1,
											   id
											       =
											       TarRoleIdT} ->
							      {RankT1, ScoreT1,
							       ScoreLevT1,
							       TarRoleIdT};
							  _ ->
							      {0, 1000, 1,
							       {0, <<>>}}
							end,
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_arena_team_lib1219, _,
	     {__Levelholiday_arena_team_lib1219,
	      __Tracesholiday_arena_team_lib1219}}
		when __Levelholiday_arena_team_lib1219 band 128 /= 0
		       orelse __Tracesholiday_arena_team_lib1219 /= [] ->
		lager:do_log(debug,
			     [{module, holiday_arena_team_lib},
			      {function, do_combat_over}, {line, 1219},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("elite_combat_over=~ts===~w",
					   [Role#role.name,
					    {MyRank, MyScore, MyScoreLev,
					     TarRank, TarScore, TarScoreLev}]),
			     none, 4096, 128, __Levelholiday_arena_team_lib1219,
			     __Tracesholiday_arena_team_lib1219, lager_event,
			     __Pidholiday_arena_team_lib1219);
	    _ -> ok
	  end,
	  Result = util:if_true(WinCount >= LoseCount, 1, 2),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_arena_team_lib1222, _,
	     {__Levelholiday_arena_team_lib1222,
	      __Tracesholiday_arena_team_lib1222}}
		when __Levelholiday_arena_team_lib1222 band 128 /= 0
		       orelse __Tracesholiday_arena_team_lib1222 /= [] ->
		lager:do_log(debug,
			     [{module, holiday_arena_team_lib},
			      {function, do_combat_over}, {line, 1222},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("combat_over=~ts===~w",
					   [Role#role.name, Result]),
			     none, 4096, 128, __Levelholiday_arena_team_lib1222,
			     __Tracesholiday_arena_team_lib1222, lager_event,
			     __Pidholiday_arena_team_lib1222);
	    _ -> ok
	  end,
	  AllPower = lists:sum([Power
				|| #holiday_arena_team_defense_role{power =
									Power}
				       <- AtkDefens]),
	  TeamRoleId = util:get(holiday_arena_team_role_id,
				false),
	  ArgMaps = #{is_win => Result,
		      team_role_id => TeamRoleId, all_power => AllPower,
		      id => RoleId, role_pid => RolePid,
		      tar_role_id => TarRoleId,
		      my_score_info => {MyRank, MyScore, MyScoreLev},
		      tar_score_info => {TarRank, TarScore, TarScoreLev},
		      win_count => WinCount, lose_count => LoseCount},
	  cluster_lib:cast(MainId, holiday_arena_team_mgr, info,
			   [{combat_over, ArgMaps}]),
	  {ok, Role};
      _ -> {ok, Role}
    end.

apply_do_combat_over(Role = #role{id = RoleId,
				  m_holiday_arena_team =
				      M = #m_holiday_arena_team{atk_defens =
								    AtkDefens,
								def_defens =
								    DefDefens}},
		     Maps) ->
    Result = maps:get(is_win, Maps, 1),
    WinCount = maps:get(win_count, Maps, 0),
    LoseCount = maps:get(lose_count, Maps, 0),
    TeamRoleId = maps:get(team_role_id, Maps, false),
    TarRoleId = maps:get(tar_role_id, Maps, false),
    {MyRank, MyScore, MyScoreLev} = maps:get(my_score_info,
					     Maps, {0, 1000, 1}),
    {MyRank2, MyScore2, MyScoreLev2} =
	maps:get(my_new_score_info, Maps, {0, 1000, 1}),
    HurtStatistics =
	util:get(holiday_arena_team_combat_over_statistics, []),
    erase(holiday_arena_team_combat_over_statistics),
    sys_conn:pack_send(29020,
		       {Result, WinCount, LoseCount, MyScoreLev, MyScoreLev2,
			MyScore, MyScore2, MyRank, MyRank2, HurtStatistics}),
    NewM = M#m_holiday_arena_team{ref_count = 0,
				  atk_defens = [], def_defens = [],
				  end_time = 0, is_enter = 0},
    NewRole = Role#role{m_holiday_arena_team = NewM},
    ReplayList = util:get(holiday_arena_team_round_log, []),
    erase(holiday_arena_team_round_log),
    AtkInfo = util:get(holiday_arena_team_combat_atk_info,
		       []),
    DefInfo = util:get(holiday_arena_team_combat_def_info,
		       []),
    {DefOldRank, DefRank, DefScore, DefOldScore} =
	maps:get(tar_new_score_info, Maps, {0, 0, 1000, 1000}),
    {TeamRank, NewTeamRank, TeamRankScore,
     NewTeamRankScore} =
	maps:get(team_role_score_info, Maps,
		 {0, 0, 1000, 1000}),
    Log = to_combat_log(AtkInfo, DefInfo,
			{MyRank, MyRank2, MyScore, MyScore2},
			{DefOldRank, DefRank, DefScore, DefOldScore}, Result,
			WinCount, LoseCount, ReplayList),
    AtkLog = Log#holiday_arena_team_log{is_atk = 1},
    DefLog = Log#holiday_arena_team_log{is_atk = 0},
    cluster_lib:cast(element(2, RoleId),
		     holiday_arena_team_mgr, info,
		     [{add_log, RoleId, AtkLog}]),
    case TeamRoleId of
      {_, SidT} ->
	  Log2 = to_combat_log(AtkInfo, DefInfo,
			       {TeamRank, NewTeamRank, TeamRankScore,
				NewTeamRankScore},
			       {DefOldRank, DefRank, DefScore, DefOldScore},
			       Result, WinCount, LoseCount, ReplayList),
	  role_lib:cast(by_id, TeamRoleId,
			{holiday_arena_team_lib, apply_team_combat_over, []}),
	  cluster_lib:cast(SidT, holiday_arena_team_mgr, info,
			   [{add_log, TeamRoleId,
			     Log2#holiday_arena_team_log{is_atk = 1}}]);
      _ -> skip
    end,
    case Result of
      1 ->
	  log:save(task,
		   {Role, 1, MyScoreLev,
		    util:fbin(lang:get(<<"段位~w"/utf8>>), [MyScoreLev]), 91,
		    <<"组队竞技胜率"/utf8>>, <<"战斗胜利"/utf8>>});
      _ ->
	  log:save(task,
		   {Role, 2, MyScoreLev,
		    util:fbin(lang:get(<<"段位~w"/utf8>>), [MyScoreLev]), 91,
		    <<"组队竞技胜率"/utf8>>, <<"战斗失败"/utf8>>})
    end,
    case TarRoleId of
      {_, SidT2} ->
	  cluster_lib:cast(SidT2, holiday_arena_team_mgr, info,
			   [{add_log, TarRoleId, DefLog}]);
      _ -> skip
    end,
    case is_open(Role) of
      {true, Period, _EndTime} ->
	  MainId = holiday_arena_team_db:get_main_id(RoleId,
						     Period),
	  big_world_lib:cast(MainId, holiday_arena_team_mgr, info,
			     [{match_unlock, RoleId}]);
      _ -> skip
    end,
    erase(is_multiple_combat),
    {ok, NewRole}.

-spec apply_team_combat_over(#role{}) -> {ok, #role{}}.

apply_team_combat_over(Role) ->
    notice:alert(lang:get(<<"您有新的战报，请前往协力段位赛查看"/utf8>>)),
    sys_conn:pack_send(29028, {1}),
    {ok, Role}.

-spec get_lev_award(#role{}, pos_integer()) -> ok |
					       {false, binary()}.

get_lev_award(Role = #role{m_holiday_arena_team =
			       #m_holiday_arena_team{award_lists = AwardLists}},
	      AwardId) ->
    case holiday_arena_team_data:get_lev_award(AwardId) of
      Award = [_ | _] ->
	  case is_open(Role) of
	    {true, _Period, _EndTime} ->
		case lists:keyfind(AwardId, 1, AwardLists) of
		  {_, 1} ->
		      GL = format:val_to_gain(Award, get_lev_award),
		      case role_gain:do_notice(Role, GL) of
			{ok,
			 NRole = #role{m_holiday_arena_team =
					   M = #m_holiday_arena_team{award_lists
									 =
									 OldAwardLists}}} ->
			    log:log_gain(GL, Role, NRole,
					 <<"活动组队竞技场领取段位奖励"/utf8>>,
					 util:fbin("奖励id:~w", [AwardId])),
			    NewAwardLists = lists:keystore(AwardId, 1,
							   OldAwardLists,
							   {AwardId, 2}),
			    NewM = M#m_holiday_arena_team{award_lists =
							      NewAwardLists},
			    {ok, NRole#role{m_holiday_arena_team = NewM},
			     NewAwardLists};
			{false, #gain{msg = Msg}} -> {false, Msg};
			_ -> {false, lang:get(<<"领取奖励失败"/utf8>>)}
		      end;
		  {_, 2} -> {false, lang:get(<<"奖励已领取"/utf8>>)};
		  _ -> {false, lang:get(<<"奖励不可领取"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"参数错误"/utf8>>)}
    end.

-spec enter(#role{}) -> #role{}.

enter(Role) ->
    NewRole =
	role_trigger:fire([#evt_enter_holiday_arena_team{}],
			  Role),
    NewRole2 = save_log(NewRole, 1, #{}),
    NewRole2.

save_log(Role, Type, Maps) ->
    List = var:get_var(Role, day, 155, []),
    case lists:member(Type, List) of
      true -> Role;
      _ ->
	  do_save_log(Role, Type, Maps),
	  RoleTemp = var:set_var(Role, day, 155, [Type | List]),
	  RoleTemp
    end.

do_save_log(Role, 4, _) ->
    log:save(join,
	     {Role, <<"新版组队"/utf8>>, <<"玩家接受邀请"/utf8>>});
do_save_log(Role, 3, _) ->
    log:save(join,
	     {Role, <<"新版组队"/utf8>>, <<"玩家发出邀请"/utf8>>});
do_save_log(Role, 2, #{team_role_id := {Rid, Sid}}) ->
    log:save(join,
	     {Role, <<"新版组队"/utf8>>, <<"首次队长挑战"/utf8>>, 1, 0,
	      util:fbin(<<"队友id:~w_~ts"/utf8>>, [Rid, Sid])});
do_save_log(Role, 2, _) ->
    log:save(join,
	     {Role, <<"新版组队"/utf8>>, <<"首次队长挑战"/utf8>>, 1, 0,
	      <<"队友id:[]"/utf8>>});
do_save_log(Role, 1, _) ->
    log:save(join,
	     {Role, <<"新版组队"/utf8>>, <<"进入组队界面"/utf8>>});
do_save_log(_Role, _, _) -> ok.

-spec get_rank(#role{}, pos_integer(),
	       pos_integer()) -> list().

get_rank(Role = #role{id = RoleId, pid = RolePid},
	 StarNum, Num) ->
    case is_open(Role) of
      {true, Period, _EndTime} ->
	  MainId = holiday_arena_team_db:get_main_id(RoleId,
						     Period),
	  ConnPid = get('@conn_pid'),
	  erlang:spawn(fun () ->
			       do_get_rank(MainId, ConnPid, RoleId, StarNum,
					   Num)
		       end);
      _ ->
	  notice:alert(lang:get(<<"活动未开启"/utf8>>)),
	  sys_conn:pack_send(29025, {0, []})
    end.

do_get_rank(MainId, ConnPid, RoleId, StarNum, Num) ->
    MyRank = cluster_lib:call(MainId, holiday_arena_team_db,
			      get_role_rank, [RoleId]),
    TeamRoles = case cluster_lib:call(MainId,
				      holiday_arena_team_db, get_rank_roles,
				      [StarNum, Num])
		    of
		  RankInfosT when is_list(RankInfosT) -> RankInfosT;
		  _ -> []
		end,
    sys_conn:pack_send(ConnPid, 29025, {MyRank, TeamRoles}).

-spec is_open(#role{}) -> true | false.

is_open(#role{lev = Lev}) ->
    LimitLev =
	holiday_arena_team_data:get_const(team_open_lev),
    LimitOpenDay =
	holiday_arena_team_data:get_const(team_open_day),
    OpenDay = date:open_srv_day(),
    Data = date:unixtime(),
    case Lev >= LimitLev andalso OpenDay >= LimitOpenDay of
      true ->
	  case sys_env:get(holiday_arena_team_info) of
	    {Period, open, EndTime} when Data < EndTime ->
		{true, Period, EndTime};
	    {Period, idle, _} -> {false, Period};
	    _ -> false
	  end;
      _ -> false
    end.

to_round_log(#combat_result{action_count = ActionCount,
			    replay_id = ReplayId, a_stat_info = AStatInfo,
			    b_stat_info = BStatInfo, result = ResultT},
	     Round, AtkDefens, DefDefens) ->
    {APower, APlist, AEndHp} = to_p_list(AStatInfo),
    {BPower, BPlist, BEndHp} = to_p_list(BStatInfo),
    {RoleId, AHallowsId, AHallowsLookId, ASpriteLev,
     ASprites, AFormationType, AName} =
	case lists:keyfind(Round,
			   #holiday_arena_team_defense_role.pos, AtkDefens)
	    of
	  #holiday_arena_team_defense_role{id = RoleIdT,
					   name = ANameT,
					   formation_type = AFormationTypeT,
					   hallows_id = AHallowsIdT,
					   hallows_look_id = AHallowsLookIdT,
					   sprite_lev = ASpriteLevT,
					   sprites = ASpritesT} ->
	      {RoleIdT, AHallowsIdT, AHallowsLookIdT, ASpriteLevT,
	       ASpritesT, AFormationTypeT, ANameT};
	  _ -> {{0, <<>>}, 1, 0, 0, [], 1, <<>>}
	end,
    {TarId, BHallowsId, BHallowsLookId, BSpriteLev,
     BSprites, BFormationType, BName} =
	case lists:keyfind(Round,
			   #holiday_arena_team_defense_role.pos, DefDefens)
	    of
	  #holiday_arena_team_defense_role{id = BRoleIdT,
					   name = BNameT,
					   formation_type = BFormationTypeT,
					   hallows_id = BHallowsIdT,
					   hallows_look_id = BHallowsLookIdT,
					   sprite_lev = BSpriteLevT,
					   sprites = BSpritesT} ->
	      {BRoleIdT, BHallowsIdT, BHallowsLookIdT, BSpriteLevT,
	       BSpritesT, BFormationTypeT, BNameT};
	  _ -> {{0, <<>>}, 1, 0, 0, [], 1, <<>>}
	end,
    combat_replay_mgr:acc_replay_reference(ReplayId),
    #holiday_arena_team_log_info{id = ReplayId,
				 round = ActionCount, ret = ResultT,
				 time = date:unixtime(), a_id = RoleId,
				 a_name = AName, a_power = APower,
				 a_formation_type = AFormationType,
				 a_order = Round, a_end_hp = AEndHp,
				 a_hallows_id = AHallowsId,
				 a_hallows_look_id = AHallowsLookId,
				 a_sprite_lev = ASpriteLev,
				 a_sprites = ASprites, b_id = TarId,
				 b_name = BName, b_power = BPower,
				 b_formation_type = BFormationType,
				 b_order = Round, b_end_hp = BEndHp,
				 b_hallows_id = BHallowsId,
				 b_hallows_look_id = BHallowsLookId,
				 b_sprite_lev = BSpriteLev,
				 b_sprites = BSprites, a_plist = APlist,
				 b_plist = BPlist}.

to_p_list(StatInfo) ->
    Fun = fun (#{pos := Pos, object_id := ObjectId,
		 hurt := Hurt, curt := Curt, be_hurt := BeHurt,
		 extra_data := ExtraData, star := Star, power := Power,
		 lev := Lev, object_bid := ObjectBid, hp := Hp,
		 hp_max := HpMax},
	       {Acc1, Acc2, Acc3, Acc4}) ->
		  ReplayP = #holiday_arena_team_log_partner{pos =
								combat_target:logic_pos(Pos),
							    id = ObjectId,
							    bid = ObjectBid,
							    lev = Lev,
							    star = Star,
							    power = Power,
							    skin_id =
								list_util:keyfind(5,
										  ExtraData,
										  0),
							    resonate_lev =
								list_util:keyfind(11,
										  ExtraData,
										  0),
							    hurt = Hurt,
							    be_hurt = BeHurt,
							    curt = Curt},
		  {Acc1 + Power, [ReplayP | Acc2], Acc3 + Hp,
		   Acc4 + HpMax}
	  end,
    {AllPower, PList, AllHp, AllMaxHp} = lists:foldl(Fun,
						     {0, [], 0, 0}, StatInfo),
    {AllPower, PList, util:ceil(AllHp * 100 / AllMaxHp)}.

to_combat_log(AtkInfo, DefInfo,
	      {AtkOldRank, AtkRank, AtkScore, AtkOldScore},
	      {DefOldRank, DefRank, DefScore, DefOldScore}, Ret,
	      WinCount, LoseCount, ReplayList) ->
    case lists:keyfind(1,
		       #holiday_arena_team_log_face.is_leader, AtkInfo)
	of
      #holiday_arena_team_log_face{id = AtkId, name = Name} ->
	  case lists:keyfind(1,
			     #holiday_arena_team_log_face.is_leader, DefInfo)
	      of
	    #holiday_arena_team_log_face{id = Id2, name = Name2} ->
		AtkPower = lists:sum([PowerT
				      || {_,
					  #holiday_arena_team_log_info{a_power =
									   PowerT}}
					     <- ReplayList]),
		DefPower = lists:sum([PowerT
				      || {_,
					  #holiday_arena_team_log_info{b_power =
									   PowerT}}
					     <- ReplayList]),
		#holiday_arena_team_log{atk_id = AtkId, atk_name = Name,
					atk_face = AtkInfo,
					atk_power = AtkPower,
					atk_ole_rank = AtkOldRank,
					atk_rank = AtkRank,
					atk_ole_score = AtkScore,
					atk_score = AtkOldScore, def_id = Id2,
					def_name = Name2, def_face = DefInfo,
					def_power = DefPower,
					def_ole_rank = DefOldRank,
					def_rank = DefRank,
					def_ole_score = DefScore,
					def_score = DefOldScore, ret = Ret,
					win_count = WinCount,
					lose_count = LoseCount,
					replay_list = ReplayList,
					time = date:unixtime()};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_arena_team_lib1498, _,
		   {__Levelholiday_arena_team_lib1498,
		    __Tracesholiday_arena_team_lib1498}}
		      when __Levelholiday_arena_team_lib1498 band 8 /= 0
			     orelse __Tracesholiday_arena_team_lib1498 /= [] ->
		      lager:do_log(error,
				   [{module, holiday_arena_team_lib},
				    {function, to_combat_log}, {line, 1498},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("战斗结算时，对手数据找不到队长:~w",
						 [DefInfo]),
				   none, 4096, 8,
				   __Levelholiday_arena_team_lib1498,
				   __Tracesholiday_arena_team_lib1498,
				   lager_event,
				   __Pidholiday_arena_team_lib1498);
		  _ -> ok
		end,
		skip
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
	    {__Pidholiday_arena_team_lib1502, _,
	     {__Levelholiday_arena_team_lib1502,
	      __Tracesholiday_arena_team_lib1502}}
		when __Levelholiday_arena_team_lib1502 band 8 /= 0
		       orelse __Tracesholiday_arena_team_lib1502 /= [] ->
		lager:do_log(error,
			     [{module, holiday_arena_team_lib},
			      {function, to_combat_log}, {line, 1502},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("战斗结算时，进攻方找不到队长:~w", [AtkInfo]),
			     none, 4096, 8, __Levelholiday_arena_team_lib1502,
			     __Tracesholiday_arena_team_lib1502, lager_event,
			     __Pidholiday_arena_team_lib1502);
	    _ -> ok
	  end,
	  skip
    end.


