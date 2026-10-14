-file("data/guild_dun_lib.erl", 1).

-file("src/mod/guild_dun/guild_dun_lib.erl", 1).

-module(guild_dun_lib).

-lager_records([{m_look, [use_id, list]},
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
		{unit_make_args, [pos, evts, disabled]},
		{map_unit,
		 [id, type, activity, status, guide_lev, name, layer,
		  base_id, lev, career, sex, hp, hp_max, speed, x, y, gx,
		  gy, looks]},
		{unit,
		 [id, type, minor_type, pid, activity, combat_pid, name,
		  status, guide_lev, nature, quality, layer, disabled,
		  base_id, lev, career, sex, hp, hp_max, speed, lock,
		  def_status, pos, looks, evt, ts, timeout, t_move, t_atk,
		  extra]},
		{unit_data,
		 [bid, type, minor_type, name, activity, cli_create,
		  guide_lev, status, nature, disabled, condition, lev,
		  career, sex, hp, mp, hp_max, mp_max, speed, lock,
		  t_move, t_atk, range_trace, range_atk, gain, slave,
		  waves, talk, looks, order, data, layer, def_status,
		  status_list, drop_id, act_drops, tran_pos,
		  reward_panel_type, reward, formation, camp_type]},
		{unit_order, [order, type, arg, data, condition, over]},
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
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
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
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
		{m_guild_dun,
		 [var, formation_list, dps_list, first_list]},
		{guild_dun_rank_role,
		 [var, rank, r_id, name, boss_id, all_dps, avatar_bid,
		  lev, family_name, face_id, power, time, look_id,
		  face_update_time, face_file]},
		{guild_dun_rank_boss, [var, boss_id, list]},
		{guild_dun_rank_guild,
		 [var, rank, gid, name, r_name, max_id, time, day_dps,
		  leader_id]},
		{guild_dun_box, [var, boss_id, award_list]},
		{guild_dun,
		 [var, id, f_id, max_id, boss_list, box_award, rank_list,
		  unit_hp, buff_lev, buff_end_time, day_dps,
		  assemble_time]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{activity, [id, status, name, data, ext_args]},
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

-export([init/0, init/1, get_info/1, get_dun_info/2,
	 get_formation/2, get_rank/1, combat_start/5,
	 combat_over/4, get_box_info/1, get_box_award/2, login/1,
	 ready/1, buy_count/1, buy_count_info/1, auto_info/2,
	 auto_combat/2, guild_dun_rank_guild/1,
	 guild_dun_rank_role/4, push/1, ref_buff/1, add_buff/1,
	 five_flush/1, get_award_info/1, get_award/2,
	 push_is_double/1, assemble/1, reset_first/1,
	 clean_dps/1]).

-export([gm_kill/2, gm_pass/3]).

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

-file("src/mod/guild_dun/guild_dun_lib.erl", 41).

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

-file("src/mod/guild_dun/guild_dun_lib.erl", 42).

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

-file("src/mod/guild_dun/guild_dun_lib.erl", 43).

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

-file("src/mod/guild_dun/guild_dun_lib.erl", 44).

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

-file("src/mod/guild_dun/guild_dun_lib.erl", 45).

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

-file("src/mod/guild_dun/guild_dun_lib.erl", 46).

-file("inc/log.hrl", 1).

-file("src/mod/guild_dun/guild_dun_lib.erl", 47).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/guild_dun/guild_dun_lib.erl", 48).

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

-file("src/mod/guild_dun/guild_dun_lib.erl", 49).

-file("inc/guild_dun.hrl", 1).

-record(guild_dun,
	{var = 2, id = {0, <<>>}, f_id = 0, max_id = 0,
	 boss_list = [], box_award = [], rank_list = [],
	 unit_hp = [], buff_lev = 0, buff_end_time = 0,
	 day_dps = 0, assemble_time = 0}).

-record(guild_dun_box,
	{var = 1, boss_id = 0, award_list = []}).

-record(guild_dun_rank_guild,
	{var = 1, rank = 0, gid = {0, <<>>}, name = <<>>,
	 r_name = <<>>, max_id = 0, time = 0, day_dps = 0,
	 leader_id = {0, <<>>}}).

-record(guild_dun_rank_boss, {var = 1, boss_id, list}).

-record(guild_dun_rank_role,
	{var = 3, rank = 0, r_id = {0, <<>>}, name = <<>>,
	 boss_id = 0, all_dps = 0, avatar_bid = 0,
	 lev = 0  :: non_neg_integer(),
	 family_name = <<>>  :: bitstring(),
	 face_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(), time = 0,
	 look_id = 0  :: pos_integer(), face_update_time = 0,
	 face_file = <<>>}).

-record(m_guild_dun,
	{var = 2, formation_list = [], dps_list = [],
	 first_list = []}).

-file("src/mod/guild_dun/guild_dun_lib.erl", 50).

-file("inc/game_assets.hrl", 1).

-file("src/mod/guild_dun/guild_dun_lib.erl", 51).

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

-file("src/mod/guild_dun/guild_dun_lib.erl", 52).

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

-file("src/mod/guild_dun/guild_dun_lib.erl", 53).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/guild_dun/guild_dun_lib.erl", 54).

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

-file("src/mod/guild_dun/guild_dun_lib.erl", 55).

-file("inc/unit.hrl", 1).

-record(unit_order,
	{order  :: move | guard | attack | atom(),
	 type = 0  :: 0..2,
	 arg  :: undefined | tuple() | [tuple()],
	 data  :: undefined | term(), condition = []  :: list(),
	 over  :: undefined | defense | stop | atom()}).

-record(unit_data,
	{bid = auto  :: auto | pos_integer(),
	 type = 200  :: non_neg_integer(),
	 minor_type = 1  :: non_neg_integer(),
	 name = ""  :: bitstring(), activity = 0  :: 0..1,
	 cli_create = 0  :: 0..1,
	 guide_lev = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 nature = 0  :: non_neg_integer(),
	 disabled = <<>>  :: bitstring(),
	 condition = []  :: [tuple()],
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 2  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 mp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 mp_max = 0  :: non_neg_integer(),
	 speed = 180  :: pos_integer(), lock = 0  :: 0 | 1,
	 t_move = 3  :: pos_integer(),
	 t_atk = 3  :: pos_integer(),
	 range_trace = 200  :: pos_integer(),
	 range_atk = 100  :: pos_integer(), gain = []  :: list(),
	 slave = []  :: list(), waves = []  :: list(),
	 talk = []  :: list(), looks = []  :: list(),
	 order = []  :: list(), data = []  :: list(),
	 layer = 0  :: non_neg_integer(),
	 def_status = defense  :: defense | patrol | loaf,
	 status_list = []  :: list(),
	 drop_id = 0  :: non_neg_integer(),
	 act_drops = []  :: list(), tran_pos = [],
	 reward_panel_type = 1, reward = [], formation = {1, 1},
	 camp_type = 0}).

-record(unit,
	{id = {1, 1}  :: {pos_integer(), pos_integer()},
	 type = 200  :: non_neg_integer(),
	 minor_type = 1  :: non_neg_integer(),
	 pid = 0  :: non_neg_integer() | pid(),
	 activity = 0  :: 0..1,
	 combat_pid = 0  :: non_neg_integer() | pid(),
	 name = ""  :: bitstring(),
	 status = 0  :: non_neg_integer(),
	 guide_lev = 0  :: non_neg_integer(),
	 nature = 0  :: non_neg_integer(), quality = 0  :: 0..4,
	 layer = 0  :: non_neg_integer(),
	 disabled = <<>>  :: bitstring(),
	 base_id = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 speed = 1  :: pos_integer(), lock = 0  :: 0 | 1,
	 def_status = defense  :: defense,
	 pos  :: undefined | tuple(), looks = []  :: [tuple()],
	 evt = []  :: [atom()],
	 ts = {1, 1, 1}  ::
	     {pos_integer(), pos_integer(), pos_integer()},
	 timeout = 864000  :: non_neg_integer(),
	 t_move = 1  :: pos_integer(),
	 t_atk = 1  :: pos_integer(), extra = []  :: [tuple()]}).

-record(map_unit,
	{id = {1, 1}  :: {pos_integer(), pos_integer()},
	 type = 200  :: pos_integer(), activity = 0  :: 0..1,
	 status = 0  :: non_neg_integer(),
	 guide_lev = 0  :: non_neg_integer(),
	 name = ""  :: bitstring(),
	 layer = 0  :: non_neg_integer(),
	 base_id = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 speed = 1  :: pos_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 gx = 0  :: non_neg_integer(),
	 gy = 0  :: non_neg_integer(),
	 looks = []  :: [tuple()]}).

-record(unit_make_args,
	{pos = {0, 0, 0}, evts = [], disabled = 0  :: 0 | 1}).

-file("src/mod/guild_dun/guild_dun_lib.erl", 56).

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

-file("src/mod/guild_dun/guild_dun_lib.erl", 57).

-file("inc/looks.hrl", 1).

-record(m_look, {use_id = 0, list = []}).

-file("src/mod/guild_dun/guild_dun_lib.erl", 58).

-spec gm_kill(#role{}, pos_integer()) -> #role{}.

gm_kill(Role = #role{guild_bag =
			 #guild_bag{id = Gid, name = GName},
		     m_guild_dun =
			 GuildDun = #m_guild_dun{dps_list = DpsLists}},
	BossId) ->
    OldBossDps = list_util:keyfind(BossId, DpsLists, 0),
    NewBossDpsLists = lists:keystore(BossId, 1, DpsLists,
				     {BossId, OldBossDps + 100000}),
    Role2 = Role#role{m_guild_dun =
			  GuildDun#m_guild_dun{dps_list = NewBossDpsLists}},
    GuildBoosRankInfo = to_guild_dun_rank_role(Role2,
					       BossId),
    guild_dun:add_dps(Gid, 1000000, BossId, [], 1, GName,
		      GuildBoosRankInfo),
    Role2.

gm_pass(Role, Id, MaxId) when Id >= MaxId -> Role;
gm_pass(Role, Id, MaxId) ->
    case guild_dun_data:get_boss_ids(Id) of
      [{BossId, _}] ->
	  NRole = gm_kill(Role, BossId),
	  gm_pass(NRole, Id + 1, MaxId);
      _ -> Role
    end.

init() -> #m_guild_dun{}.

login(Role) ->
    NRole = reset_first(Role),
    push_is_double(Role),
    {ok, NRole}.

ready(Role) -> push_is_double(Role), ok.

-spec five_flush(#role{}) -> {ok, #role{}}.

five_flush(Role) -> {ok, Role}.

-spec add_buff(#role{}) -> {ok, #role{}, binary()} |
			   {false, binary()}.

add_buff(#role{guild_bag =
		   #guild_bag{id = {0, <<>>}}}) ->
    {false,
     lang:get(<<"Bạn cần gia nhập hội mới có thể sử dụng"/utf8>>)};
add_buff(Role = #role{id = RoleId, name = Name,
		      guild_bag = #guild_bag{pid = GPid}}) ->
    BuffCost = guild_dun_data:const(buff_cost),
    BuffItem = guild_dun_data:const(buff_item),
    Loss1 = format:val_to_loss([{BuffItem, 1}], add_buff),
    case role_gain:do(Role, Loss1) of
      {ok, NRole} ->
	  case guild_dun:add_buff(NRole) of
	    {false, Msg} -> {false, Msg};
	    {ok, Msg} ->
		log:log_gain(Loss1, Role, NRole, <<"联盟副本"/utf8>>,
			     lang:get(<<"Thêm buff1 vào phó bản hội"/utf8>>)),
		Msg2 =
		    util:fbin(lang:get(<<"Tăng hiệu ứng buff tấn công cho toàn "
					 "bộ thành viên trong hội。"/utf8>>),
			      []),
		guild_handle:add_guild_log(RoleId, Name, GPid, Msg2, 4),
		{ok, NRole, Msg}
	  end;
      _ ->
	  Loss2 = format:val_to_loss([{3, BuffCost}], add_buff),
	  case role_gain:do(Role, Loss2) of
	    {ok, NRole} ->
		case guild_dun:add_buff(NRole) of
		  {false, Msg} -> {false, Msg};
		  {ok, Msg} ->
		      log:log_gain(Loss1, Role, NRole, <<"联盟副本"/utf8>>,
				   lang:get(<<"Thêm buff2 vào phó bản hội"/utf8>>)),
		      Msg3 =
			  util:fbin(lang:get(<<"Tăng hiệu ứng buff tấn công cho toàn "
					       "bộ thành viên trong hội.。"/utf8>>),
				    []),
		      guild_handle:add_guild_log(RoleId, Name, GPid, Msg3, 4),
		      {ok, NRole, Msg}
		end;
	    {false, #loss{msg = Msg}} -> {false, Msg}
	  end
    end.

-spec ref_buff(#role{}) -> {ok, #role{}}.

ref_buff(Role) -> get_info(Role), {ok, Role}.

-spec get_formation(#role{}, pos_integer()) -> tuple().

get_formation(#role{m_guild_dun =
			#m_guild_dun{formation_list = PList}},
	      SysType) ->
    #formation_sys{type = FormationType,
		   pos_info = PosInfo} =
	case lists:keyfind(SysType, #formation_sys.id, PList) of
	  false -> #formation_sys{};
	  F -> F
	end,
    {FormationType, PosInfo}.

init(Gid) ->
    FId = 1,
    BossList = guild_dun_data:get_boss_ids(FId),
    UnitHp = init_unit_hp(BossList, []),
    #guild_dun{id = Gid, f_id = FId, boss_list = BossList,
	       unit_hp = UnitHp}.

init_unit_hp([], L) -> L;
init_unit_hp([{BossId, _} | BossList], L) ->
    UnitHp = case guild_dun_data:get_unit_id(BossId) of
	       undefine -> [];
	       UnitId ->
		   case unit_monster:gen_fight_objects(20, UnitId) of
		     [] -> [];
		     [DefendList | _] ->
			 [{MonBid, HpMax}
			  || #fight_object{object_bid = MonBid, hp_max = HpMax}
				 <- DefendList]
		   end
	     end,
    init_unit_hp(BossList, [{BossId, UnitHp} | L]).

get_f_id(#role{guild_bag = #guild_bag{id = Gid}}) ->
    get_f_id(Gid);
get_f_id(Gid) ->
    case guild_dun_mgr:get_guild_dun(Gid) of
      #guild_dun{f_id = FId} -> FId;
      _ -> 0
    end.

get_info(Role = #role{guild_bag =
			  #guild_bag{id = Gid}}) ->
    case guild_dun_mgr:get_guild_dun(Gid) of
      #guild_dun{f_id = FId, max_id = MaxId,
		 boss_list = BossListT, buff_lev = BuffLev,
		 buff_end_time = EndTime,
		 assemble_time = AssembleTime} ->
	  BossList = ref_boss_hp(BossListT, []),
	  Count = var:get_list_val(Role, day, 65, FId,
				   guild_dun_data:const(free_time)),
	  BuyCount = var:get_list_val(Role, day, 64, FId, 0),
	  DatMaxId =
	      length(lists:usort(guild_dun_data:get_all_fid())),
	  CombatList = var:get_var(Role, day, 41, []),
	  Fun = fun ({IdT, _}, Acc) ->
			case lists:keyfind(IdT, 1, CombatList) of
			  {_, Dps0, _, _, _, _} -> [{IdT, Dps0} | Acc];
			  _ -> [{IdT, 0} | Acc]
			end
		end,
	  PushList = lists:foldl(Fun, [], BossList),
	  RefEndTime = date:week_next_diff([1], {5, 0, 0}),
	  {Num, _} = var:get_var(Role, five, 588, {0, []}),
	  Now = date:unixtime(),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_dun_lib214, _,
	     {__Levelguild_dun_lib214, __Tracesguild_dun_lib214}}
		when __Levelguild_dun_lib214 band 128 /= 0 orelse
		       __Tracesguild_dun_lib214 /= [] ->
		lager:do_log(debug,
			     [{module, guild_dun_lib}, {function, get_info},
			      {line, 214}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("=公会副本数据：~w~n",
					   [{min(FId, DatMaxId),
					     min(MaxId, DatMaxId), Count,
					     BuyCount, BossList, PushList,
					     BuffLev, max(0, EndTime - Now),
					     RefEndTime}]),
			     none, 4096, 128, __Levelguild_dun_lib214,
			     __Tracesguild_dun_lib214, lager_event,
			     __Pidguild_dun_lib214);
	    _ -> ok
	  end,
	  role:pack_send(21300,
			 {min(FId, DatMaxId), min(MaxId, DatMaxId), Count,
			  BuyCount, BossList, PushList, BuffLev,
			  max(0, EndTime - Now), RefEndTime, Num,
			  max(0, AssembleTime - Now)});
      _ -> ok
    end.

ref_boss_hp([], L) -> L;
ref_boss_hp([{BossId, Hp} | BossList], L) ->
    case guild_dun_data:get_unit_id(BossId) of
      undefine -> ref_boss_hp(BossList, [{BossId, Hp} | L]);
      UnitId ->
	  MaxHp = unit_monster:get_boss_hp_max(UnitId),
	  ref_boss_hp(BossList, [{BossId, min(Hp, MaxHp)} | L])
    end.

get_dun_info(#role{guild_bag = #guild_bag{id = Gid}},
	     FId) ->
    case guild_dun_mgr:get_guild_dun(Gid) of
      #guild_dun{f_id = FId, boss_list = BossList} ->
	  BossList;
      _ -> []
    end.

get_day_dps(#role{guild_bag = #guild_bag{id = Gid}}) ->
    case guild_dun_mgr:get_guild_dun(Gid) of
      #guild_dun{day_dps = Dps} -> Dps;
      _ -> 0
    end.

guild_dun_rank_guild(Role = #role{guild_bag =
				      #guild_bag{name = MyName, id = Gid}}) ->
    List = guild_dun_rank:get_guild_rank(),
    {MyRank, MyMaxId} = case lists:keyfind(Gid,
					   #guild_dun_rank_guild.gid, List)
			    of
			  #guild_dun_rank_guild{rank = MyRank1,
						max_id = MyMaxId1} ->
			      {MyRank1, MyMaxId1};
			  _ -> {0, 0}
			end,
    MyDayDps = get_day_dps(Role),
    {OwnerId, OwnerName, FaceId, Lev, Power, AvatarBid} =
	case lists:keyfind(1, #guild_dun_rank_guild.rank, List)
	    of
	  #guild_dun_rank_guild{gid = GuildId} ->
	      case guild_lib:elem(GuildId, #guild.members) of
		{ok, List3} ->
		    case lists:keyfind(1, #guild_member.post, List3) of
		      #guild_member{id = OwnerId1, avatar_bid = AvatarBid1,
				    face = FaceId1, power = Power1, lev = Lev1,
				    name = OwnerName1} ->
			  {OwnerId1, OwnerName1, FaceId1, Lev1, Power1,
			   AvatarBid1};
		      _ -> {{0, <<>>}, <<>>, 0, 0, 0, 0}
		    end;
		_ -> {{0, <<>>}, <<>>, 0, 0, 0, 0}
	      end;
	  _ -> {{0, <<>>}, <<>>, 0, 0, 0, 0}
	end,
    {MyName, MyRank, MyMaxId, MyDayDps, OwnerId, OwnerName,
     FaceId, Lev, Power, AvatarBid, List}.

guild_dun_rank_role(#role{guild_bag =
			      #guild_bag{id = {0, <<>>}}},
		    _BossId, _StartNum, _EndNum) ->
    {0, 0, []};
guild_dun_rank_role(#role{id = RId,
			  guild_bag = #guild_bag{id = GuildId},
			  m_guild_dun = #m_guild_dun{dps_list = DpsLists}},
		    BossId, StartNum, EndNum) ->
    List = guild_dun_rank:get_boss_rank(GuildId, BossId),
    {ok, MembersT} = guild_lib:elem(GuildId,
				    #guild.members),
    Members = [MId || #guild_member{id = MId} <- MembersT],
    List2 = lists:keysort(#guild_dun_rank_role.all_dps,
			  [Data
			   || Data = #guild_dun_rank_role{r_id = RankRid}
				  <- List,
			      lists:member(RankRid, Members)]),
    Fun = fun (GuildDunRank, {Rank, Acc}) ->
		  NAcc = [GuildDunRank#guild_dun_rank_role{rank = Rank}
			  | Acc],
		  {Rank + 1, NAcc}
	  end,
    {_, List3} = lists:foldl(Fun, {1, []},
			     lists:reverse(List2)),
    PushList = [Data
		|| Data = #guild_dun_rank_role{rank = TarRank} <- List3,
		   TarRank >= StartNum, TarRank =< EndNum],
    MyDps = list_util:keyfind(BossId, DpsLists, 0),
    MyRank = case lists:keyfind(RId,
				#guild_dun_rank_role.r_id, List3)
		 of
	       #guild_dun_rank_role{rank = MyRank1} -> MyRank1;
	       _ -> 0
	     end,
    {MyRank, MyDps, PushList}.

get_rank(#role{guild_bag = #guild_bag{id = Gid}}) ->
    case guild_dun_mgr:get_guild_dun(Gid) of
      #guild_dun{rank_list = RankList} ->
	  RankList2 = [{R, Name, Post, Count, OldDps}
		       || {_RId, R, Name, Post, Count, OldDps} <- RankList],
	  RankList2;
      _ -> []
    end.

-spec push(#role{}) -> {ok, #role{}}.

push(Role) ->
    BoxList = get_box_info(Role),
    role:pack_send(21303, {BoxList}),
    {ok, Role}.

get_box_info(Role = #role{guild_bag =
			      #guild_bag{id = Gid}}) ->
    case guild_dun_mgr:get_guild_dun(Gid) of
      #guild_dun{box_award = BoxList} ->
	  GetList = var:get_var(Role, timeout, 4001, []),
	  Fun = fun ({FId, Num}, Acc) ->
			GetNum = list_util:keyfind(FId, GetList, 0),
			[{FId, max(0, Num - GetNum)} | Acc]
		end,
	  lists:foldl(Fun, [], BoxList);
      _ -> []
    end.

get_box_award(Role = #role{guild_bag =
			       #guild_bag{id = Gid}},
	      FId) ->
    BoxList = get_box_info(Role),
    case list_util:keyfind(FId, BoxList, 0) of
      Num when Num > 0 ->
	  AwardList = guild_dun_data:get_box_award(FId),
	  {ItemId, ItemNum, _, Flag} = util:rand_list(AwardList,
						      3),
	  GL = format:val_to_gain([{ItemId, ItemNum}],
				  get_box_award),
	  case role_gain:do_notice(Role, GL) of
	    {ok, NRole} ->
		log:log_gain(GL, Role, NRole, <<"联盟副本"/utf8>>,
			     util:fbin("领取公会副本宝箱奖励,公会ID:~w,章节ID:~w",
				       [Gid, FId])),
		TimeEnd = date:unixtime() +
			    date:week_next_diff([1], {5, 0, 0}),
		GetList = var:get_var(Role, timeout, 4001, []),
		NewGetList = case lists:keyfind(FId, 1, GetList) of
			       {FId, GetNum} ->
				   lists:keystore(FId, 1, GetList,
						  {FId, GetNum + 1});
			       _ -> [{FId, 1} | GetList]
			     end,
		do_box_award_notice(Role, {ItemId, ItemNum}, Flag),
		NewRole = var:set_var(NRole, {timeout, TimeEnd}, 4001,
				      NewGetList),
		{ok, NewRole, Num - 1};
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    _ -> {false, lang:get(<<"Mở rương thất bại."/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Không có rương nào để nhận."/utf8>>)}
    end.

do_box_award_notice(_Role, _, 0) -> ok;
do_box_award_notice(#role{id = RoleId, name = Name,
			  guild_bag = #guild_bag{id = Gid}},
		    {ItemId, ItemNum}, 1) ->
    Members = case guild_lib:elem(Gid, #guild.members) of
		{ok, MembersTemp = [_ | _]} -> MembersTemp;
		_ -> []
	      end,
    Msg =
	util:format_ex(lang:get(<<"Chúc mừng ~s, may mắn bùng nổ, khi mở "
				  "rương BOSS trong phó bản hội đã may "
				  "mắn nhận được ~s.！"/utf8>>),
		       [color:format({name, RoleId, Name}),
			color:format({item, {ItemId, ItemNum}})]),
    notice:broadcast(guild, Members, sys_guild, Msg).

buy_count_info(Role) ->
    FId = get_f_id(Role),
    BuyCount = var:get_list_val(Role, day, 64, FId, 0),
    MaxBuyCount = lists:max(guild_dun_data:get_buy_count()),
    Count = var:get_list_val(Role, day, 65, FId,
			     guild_dun_data:const(free_time)),
    if Count > 0 ->
	   {false,
	    lang:get(<<"Khi số lần thử thách là 0, bạn có thể "
		       "mua thêm. Hãy cố gắng thử thách Boss "
		       "nhé!！"/utf8>>)};
       BuyCount >= MaxBuyCount ->
	   {false,
	    lang:get(<<"Số lần mua trong ngày đã hết, không "
		       "thể mua thêm."/utf8>>)};
       true -> {ok, BuyCount + 1}
    end.

buy_count(Role = #role{m_vip = #m_vip{lev = VipLev}}) ->
    case buy_count_info(Role) of
      {false, Msg} -> {false, Msg};
      {ok, BuyCount} ->
	  MaxCount = guild_dun_data:get_buy_count_by_vip(VipLev),
	  case BuyCount > MaxCount of
	    true ->
		{false, lang:get(<<"Cấp độ VIP không đủ."/utf8>>)};
	    _ ->
		Expend = guild_dun_data:get_expend_by_count(BuyCount),
		GL = format:val_to_loss(Expend, guild_dun_buy_count),
		case role_gain:do(Role, GL) of
		  {ok, NRole} ->
		      log:log_gain(GL, Role, NRole, <<"联盟副本"/utf8>>,
				   util:fbin("购买公会副本挑战次数:~w", [Expend])),
		      FId = get_f_id(Role),
		      DayDunTime = lists:max(guild_dun_data:get_buy_count()) -
				     BuyCount,
		      guild_member:update(Role,
					  {update_day_dun_time, DayDunTime}),
		      NewRole1 = var:set_list_val(NRole, day, 65, FId, 1),
		      NewRole2 = var:set_list_val(NewRole1, day, 64, FId,
						  BuyCount),
		      {ok, NewRole2, 1, BuyCount};
		  {false, #loss{msg = _Msg}} ->
		      {false, lang:get(<<"Không đủ vàng"/utf8>>)}
		end
	  end
    end.

check_guild_lev(Gid, BossId) ->
    case guild_lib:info(by_id, Gid) of
      {ok, #guild{lev = GuildLev}} ->
	  [LimitLev] =
	      guild_dun_data:get_limit_lv(guild_dun_data:get_f_id(BossId)),
	  case LimitLev > GuildLev of
	    true -> false;
	    _ -> true
	  end;
      _ -> false
    end.

auto_info(Role = #role{guild_bag =
			   #guild_bag{id = Gid}},
	  BossId) ->
    List = var:get_var(Role, day, 41, []),
    case lists:keyfind(BossId, 1, List) of
      false ->
	  {false,
	   lang:get(<<"Cần thử thách 1 lần trước khi có thể "
		      "tiến hành quét."/utf8>>)};
      {BossId, Dps, MonDpsList, BestPartnerId, TargetName,
       PartnerDpsList} ->
	  case guild_dun_mgr:get_guild_dun(Gid) of
	    #guild_dun{boss_list = BossList} ->
		case lists:keyfind(BossId, 1, BossList) of
		  {BossId, Hp} when Hp > 0 ->
		      {ok, Dps, MonDpsList, BestPartnerId, TargetName,
		       PartnerDpsList};
		  _ ->
		      {false,
		       lang:get(<<"Boss này đã bị đánh bại, không thể quét "
				  "nữa."/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"Mạng đang bận."/utf8>>)}
	  end
    end.

auto_combat(Role, BossId) ->
    FId = get_f_id(Role),
    Count = var:get_list_val(Role, day, 65, FId,
			     guild_dun_data:const(free_time)),
    case Count =< 0 of
      true ->
	  case buy_count(Role) of
	    {ok, NRole, _, _} -> do_auto_combat(NRole, BossId, 1);
	    {false, Msg} -> {false, Msg};
	    {false, Msg, _} -> {false, Msg}
	  end;
      _ -> do_auto_combat(Role, BossId, Count)
    end.

do_auto_combat(Role = #role{id = RId, name = Name,
			    guild_bag = #guild_bag{pid = GPid}},
	       BossId, Count) ->
    FId = get_f_id(Role),
    case auto_info(Role, BossId) of
      {false, Msg} -> {false, Msg};
      {ok, Dps, MonDpsList, BestPartnerId, TargetName,
       PartnerDpsList} ->
	  {AwardListT, MailList} = get_award_by_dps(Dps, BossId),
	  case auto_combat(1, Role, BossId, Dps, MonDpsList, 0,
			   MailList)
	      of
	    {false, Msg} -> {false, Msg};
	    {DoCount,
	     RoleT2 = #role{m_guild_dun =
				#m_guild_dun{dps_list = AllDpsLists}}}
		when DoCount > 0 ->
		AwardList = [{T1, DoCount * T2}
			     || {T1, T2} <- AwardListT],
		NewAwardList = case is_double() of
				 {true, _} ->
				     [{ItemId, ItemNum * 2}
				      || {ItemId, ItemNum} <- AwardList];
				 _ -> AwardList
			       end,
		GL = format:val_to_gain(NewAwardList, guild_dun),
		case role_gain:do(RoleT2, GL) of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, Role2} ->
		      log:log_gain(GL, Role, Role2, <<"联盟副本"/utf8>>,
				   util:fbin("公会副本扫荡:bossid:~w, 伤害:~w",
					     [BossId, Dps])),
		      AllDps = Dps * DoCount,
		      VarRole = var:set_list_val(Role2, day, 65, FId,
						 max(Count - DoCount, 0)),
		      MsgLog =
			  util:fbin(lang:get(<<"Đã quét phó bản hội, tổng cộng gây ra "
					       "~w sát thương.。"/utf8>>),
				    [list_util:keyfind(BossId, AllDpsLists,
						       0)]),
		      guild_handle:add_guild_log(RId, Name, GPid, MsgLog, 3),
		      FightEvt = #evt_guild_dun_fight{count = DoCount,
						      boss_id = BossId},
		      Evts = case erlang:get({guild_dun_boss_ko, BossId}) of
			       1 ->
				   [FightEvt,
				    #evt_guild_dun_fight_ko{boss_id = BossId}];
			       _ -> [FightEvt]
			     end,
		      erlang:erase({guild_dun_boss_ko, BossId}),
		      NewRole = role_trigger:fire([#evt_guild_dun_damage{dps =
									     Dps}
						   | Evts],
						  VarRole),
		      get_info(NewRole),
		      log:save(join,
			       {NewRole, <<"功能玩法"/utf8>>, <<"公会副本"/utf8>>}),
		      {ok, NewRole, DoCount, AllDps, BestPartnerId,
		       NewAwardList, TargetName, PartnerDpsList}
		end;
	    _ ->
		{false,
		 lang:get(<<"Boss này đã bị đánh bại, không thể quét "
			    "lần 2."/utf8>>)}
	  end
    end.

auto_combat(0, Role, _BossId, _Dps, _MonDpsList,
	    DoCount, _MailList) ->
    {DoCount, Role};
auto_combat(Count,
	    Role = #role{id = RId, pid = RolePid, name = Name,
			 guild_bag =
			     #guild_bag{id = Gid, pid = GPid, name = GName},
			 m_guild_dun =
			     GuildDun = #m_guild_dun{dps_list = DpsLists}},
	    BossId, Dps, MonDpsList, DoCount, MailList) ->
    case guild_dun_mgr:get_guild_dun(Gid) of
      #guild_dun{boss_list = BossList} ->
	  case lists:keyfind(BossId, 1, BossList) of
	    {BossId, Hp} when Hp > 0 ->
		OldBossDps = list_util:keyfind(BossId, DpsLists, 0),
		NewBossDpsLists = lists:keystore(BossId, 1, DpsLists,
						 {BossId, OldBossDps + Dps}),
		Role2 = Role#role{m_guild_dun =
				      GuildDun#m_guild_dun{dps_list =
							       NewBossDpsLists}},
		GuildBoosRankInfo = to_guild_dun_rank_role(Role2,
							   BossId),
		case guild_dun:add_dps(Gid, Dps, BossId, MonDpsList, 2,
				       GName, GuildBoosRankInfo)
		    of
		  true ->
		      KillMailCount = var:get_var(Role2, day, 71, 0),
		      case KillMailCount < 3 of
			true ->
			    Content =
				lang:get(<<"Xin chúc mừng vì đã hạ gục thành công "
					   "BOSS trong Thử thách ngục tối bang hội "
					   "và nhận thêm phần thưởng Kẻ hủy diệt.。"/utf8>>),
			    {Assets, Items} =
				format:split_assets_items(MailList),
			    Mail =
				{lang:get(<<"Phần thưởng kết thúc Boss Gia Tộc"/utf8>>),
				 Content, Assets, Items,
				 "Phần thưởng kết thúc Boss Guild"},
			    mail:send(RId, Mail);
			_ -> skip
		      end,
		      GuildExp =
			  guild_dun_data:get_guild_exp(guild_dun_data:get_f_id(BossId)),
		      do_notice(RId, Name, BossId, GuildExp, Gid),
		      guild:apply(async, GPid,
				  {guild_handle, apply_donate,
				   [{guild_dun, RId, RolePid, 1, GuildExp,
				     0}]}),
		      erlang:put({guild_dun_boss_ko, BossId}, 1),
		      guild_member:mems_apply(GPid, all,
					      {guild_member, set,
					       [{set_first}]}),
		      NewRole = var:set_var(Role2, day, 71,
					    KillMailCount + 1),
		      {DoCount + 1, NewRole};
		  false ->
		      auto_combat(Count - 1, Role2, BossId, Dps, MonDpsList,
				  DoCount + 1, MailList);
		  _ ->
		      {false, lang:get(<<"Cuộc đột kích thất bại"/utf8>>)}
		end;
	    _ ->
		Msg =
		    util:fbin(lang:get(<<"boss ~wThể tích máu là 0"/utf8>>),
			      [BossId]),
		{false, Msg}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Không tìm thấy thông tin về trường hợp "
		      "Guild"/utf8>>)}
    end.

do_notice(RId, Name, BossId, GuildExp, Gid) ->
    NoticeMsg =
	color:msg(lang:get(<<"Báo cáo trận chiến！~tsĐã giết thành "
			     "công trùm ngục tối~ts,Trải nghiệm Guild+~ts,H"
			     "ãy đến và lấy hộp kho báu！"/utf8>>),
		  [color:format({name, RId, Name}),
		   {blue, guild_dun_data:get_boss_name(BossId)},
		   {green, GuildExp}]),
    notice:broadcast(guild, Gid, sys_guild, NoticeMsg).

-spec combat_start(#role{}, pos_integer(),
		   pos_integer(), list(), pos_integer()) -> ok.

combat_start(Role = #role{lev = Lev}, BossId,
	     FormationType, PosInfo, HallowsId) ->
    case check_can_combat([lev, count, formation, guild,
			   boss, unit],
			  Role,
			  #{boss_id => BossId, formation => FormationType,
			    pos_info => PosInfo, hallows_id => HallowsId})
	of
      {false, Msg} -> {false, Msg};
      {Hp, UnitId, UnitHpList, BuffLev} ->
	  CombatType = 9,
	  FormationLev = formation_lib:get_formation_lev(Role,
							 FormationType),
	  FightPos = formation_lib:gen_fight_pos(PosInfo,
						 FormationType),
	  DunAttrs = dungeon:buff_attr(Role),
	  BuffAttrs = buff_attr(BuffLev) ++ DunAttrs,
	  AtkGroup0 = combat_lib:gen_fight_objects(Role,
						   FightPos),
	  AtkGroup = sprite_tree:gen_fight_object_type(Role, 4) ++
		       hallows_lib:gen_fight_object(Role, HallowsId) ++
			 [combat_lib:add_base_attr(FO, BuffAttrs)
			  || FO <- AtkGroup0],
	  #unit_data{formation = {BFormationType, BFormationLev},
		     name = TarName} =
	      unit_data:get(UnitId),
	  FId = get_f_id(Role),
	  Args = #{on_role_combat_end =>
		       {guild_dun_lib, combat_over,
			[{FId, BossId, date:unixtime(), UnitHpList}]},
		   ext_args =>
		       [{cli_ext_args, [BossId]}, {is_show_panel, false}],
		   formation =>
		       [{1, FormationType, FormationLev},
			{2, BFormationType, BFormationLev}],
		   target_role_name => TarName},
	  case unit_monster:gen_fight_objects(Lev, UnitId) of
	    [] ->
		{false, lang:get(<<"Vấn đề cấu hình quái vật"/utf8>>)};
	    [DefendList | _] ->
		NewDefendList = get_new_hp(DefendList, UnitHpList, Hp,
					   []),
		case combat_lib:start_combat(Role, CombatType, AtkGroup,
					     [NewDefendList], Args)
		    of
		  {ok, _CombatPid} ->
		      NewRole = role_trigger:fire(#evt_guild_dun_fight{count =
									   1,
								       boss_id =
									   BossId},
						  Role),
		      case formation:set_sys_formation(NewRole, 4,
						       FormationType, PosInfo,
						       HallowsId)
			  of
			{ok, NRole} -> {ok, NRole};
			_ -> {ok, NewRole}
		      end;
		  {false, Msg} -> {false, Msg};
		  _ ->
		      {false,
		       lang:get(<<"Không thể bắt đầu trận chiến ngục tối "
				  "theo cốt truyện"/utf8>>)}
		end
	  end
    end.

buff_attr(BuffLev) ->
    guild_dun_data:get_buff_add_attr(BuffLev).

check_can_combat([lev | Other], Role = #role{lev = Lev},
		 Cache) ->
    JoinLev = guild_dun_data:const(join_lev),
    case Lev < JoinLev of
      true -> {false, lang:get(<<"Cấp độ không đủ"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([count | Other], Role, Cache) ->
    FId = get_f_id(Role),
    Count = var:get_list_val(Role, day, 65, FId,
			     guild_dun_data:const(free_time)),
    case Count =< 0 of
      true ->
	  {false, lang:get(<<"Những thách thức không đủ"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([guild | Other],
		 Role = #role{guild_bag = #guild_bag{id = Gid}},
		 Cache = #{boss_id := BossId}) ->
    case check_guild_lev(Gid, BossId) of
      false ->
	  {false, lang:get(<<"Cấp độ bang hội không đủ"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([boss | Other],
		 Role = #role{guild_bag = #guild_bag{id = Gid}},
		 Cache = #{boss_id := BossId}) ->
    case guild_dun_mgr:get_guild_dun(Gid) of
      #guild_dun{boss_list = BossListT, buff_lev = BuffLev,
		 unit_hp = UnitHp} ->
	  BossList = ref_boss_hp(BossListT, []),
	  case lists:keyfind(BossId, 1, BossList) of
	    {BossId, Hp} when Hp > 0 ->
		check_can_combat(Other, Role,
				 Cache#{unit_hp => UnitHp, hp => Hp,
					buff_lev => BuffLev});
	    _ -> {false, lang:get(<<"BOSS đã bị giết"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"Lỗi tham số"/utf8>>)}
    end;
check_can_combat([unit | Other], Role,
		 Cache = #{boss_id := BossId, unit_hp := UnitHp}) ->
    case guild_dun_data:get_unit_id(BossId) of
      undefine -> {false, lang:get(<<"Lỗi tham số"/utf8>>)};
      UnitId ->
	  case lists:keyfind(BossId, 1, UnitHp) of
	    false -> {false, lang:get(<<"Lỗi tham số"/utf8>>)};
	    {BossId, UnitHpList} ->
		check_can_combat(Other, Role,
				 Cache#{unit_id => UnitId,
					unit_hp_list => UnitHpList})
	  end
    end;
check_can_combat([formation | Other], Role,
		 Cache = #{formation := FormationType,
			   pos_info := PosInfo, hallows_id := HallowsId}) ->
    case formation:check_formation_pos_info(Role,
					    FormationType, PosInfo, HallowsId,
					    4)
	of
      {false, Reason} -> {false, Reason};
      {ok, []} ->
	  {false, lang:get(<<"Cần ít nhất một anh hùng"/utf8>>)};
      {ok, _NewPosInfo} ->
	  check_can_combat(Other, Role, Cache)
    end;
check_can_combat([], _Role,
		 #{hp := Hp, unit_id := UnitId,
		   unit_hp_list := UnitHpList, buff_lev := BuffLev}) ->
    {Hp, UnitId, UnitHpList, BuffLev}.

get_new_hp([], _UnitHpList, _Hp, L) -> L;
get_new_hp([FightObject = #fight_object{object_bid =
					    MonBid}
	    | DefendList],
	   UnitHpList, Hp1, L) ->
    case lists:keyfind(MonBid, 1, UnitHpList) of
      false ->
	  get_new_hp(DefendList, UnitHpList, Hp1,
		     [FightObject | L]);
      {_, _Hp} ->
	  NewFightObject = FightObject#fight_object{hp =
							max(Hp1, 1)},
	  get_new_hp(DefendList, UnitHpList, Hp1,
		     [NewFightObject | L])
    end.

to_guild_dun_rank_role(Role = #role{id = Id,
				    face_id = FaceId, lev = Lev, name = Name,
				    power = Power,
				    m_guild_dun =
					#m_guild_dun{dps_list = DpsLists},
				    guild_bag = #guild_bag{name = GName},
				    m_avatar = #m_avatar{used = AvatarBaseId},
				    m_look = #m_look{use_id = LookId}},
		       BossId) ->
    BossDps = list_util:keyfind(BossId, DpsLists, 0),
    {_, FaceFile, FaceUpdateTime} =
	role_face:face_info(Role),
    #guild_dun_rank_role{r_id = Id, name = Name,
			 avatar_bid = AvatarBaseId, lev = Lev, face_id = FaceId,
			 power = Power, family_name = GName, boss_id = BossId,
			 all_dps = BossDps, time = date:unixtime(),
			 look_id = LookId, face_update_time = FaceUpdateTime,
			 face_file = FaceFile}.

-spec combat_over(#role{}, #combat_result{},
		  pos_integer(), tuple()) -> ok.

combat_over(RoleT = #role{id = RId, pid = RolePid,
			  name = Name,
			  m_guild_dun =
			      GuildDun = #m_guild_dun{dps_list = DpsLists},
			  guild_bag =
			      #guild_bag{id = Gid, pid = GPid, name = GName}},
	    #combat_result{total_hurt = Dps,
			   hurt_statistics_a = PartnerDpsList,
			   hurt_statistics = HurtStatistics,
			   b_stat_info = MonRemainHp, result = Result},
	    #combat{target_role_name = TargetName},
	    {Fid, BossId, _StartTime, UnitHpList}) ->
    {AwardList, MailList} = get_award_by_dps(Dps, BossId),
    OldBossDps = list_util:keyfind(BossId, DpsLists, 0),
    NewBossDpsLists = lists:keystore(BossId, 1, DpsLists,
				     {BossId, OldBossDps + Dps}),
    RoleT2 = RoleT#role{m_guild_dun =
			    GuildDun#m_guild_dun{dps_list = NewBossDpsLists}},
    GuildBoosRankInfo = to_guild_dun_rank_role(RoleT2,
					       BossId),
    KillMailCount = var:get_var(RoleT2, day, 71, 0),
    Role = case guild_dun:add_dps(Gid, Dps, BossId,
				  PartnerDpsList, Result, GName,
				  GuildBoosRankInfo)
	       of
	     true when KillMailCount < 3 ->
		 Content =
		     lang:get(<<"Xin chúc mừng vì đã hạ gục thành công "
				"BOSS trong Thử thách ngục tối bang hội "
				"và nhận thêm phần thưởng Kẻ hủy diệt.。"/utf8>>),
		 {Assets, Items} = format:split_assets_items(MailList),
		 Mail =
		     {lang:get(<<"Phần thưởng kết thúc Boss Guild"/utf8>>),
		      Content, Assets, Items, "公会BOSS终结奖励"},
		 mail:send(RId, Mail),
		 GuildExp =
		     guild_dun_data:get_guild_exp(guild_dun_data:get_f_id(BossId)),
		 do_notice(RId, Name, BossId, GuildExp, Gid),
		 guild:apply(async, GPid,
			     {guild_handle, apply_donate,
			      [{guild_dun, RId, RolePid, 1, GuildExp, 0}]}),
		 role_trigger:async_fire(RoleT2,
					 #evt_guild_dun_fight_ko{}),
		 var:set_var(RoleT2, day, 71, KillMailCount + 1);
	     _ -> RoleT2
	   end,
    NewAwardList = case is_double() of
		     {true, _} ->
			 [{ItemId, ItemNum * 2}
			  || {ItemId, ItemNum} <- AwardList];
		     _ -> AwardList
		   end,
    GL = format:val_to_gain(NewAwardList, guild_dun),
    Role2 = case role_gain:do(Role, GL) of
	      {false, _} -> Role;
	      {ok, RoleTemp} -> RoleTemp
	    end,
    log:log_gain(GL, Role, Role2, <<"联盟副本"/utf8>>,
		 util:fbin("公会副本挑战:bossid:~w, 伤害:~w", [BossId, Dps])),
    CombatCount = var:get_list_val(Role2, day, 65, Fid,
				   guild_dun_data:const(free_time)),
    Role3 = var:set_list_val(Role2, day, 65, Fid,
			     max(CombatCount - 1, 0)),
    FidCombatCount = var:get_list_val(Role3, other, 3052,
				      Fid, 0),
    NewRole = var:set_list_val(Role3, other, 3052, Fid,
			       FidCombatCount + 1),
    Msg =
	util:fbin(lang:get(<<"Tấn công~wChương BOSS của Guild~wHạng "
			     "hai，Tổng cộng~wsát thương。"/utf8>>),
		  [Fid, FidCombatCount + 1, OldBossDps + Dps]),
    guild_handle:add_guild_log(RId, Name, GPid, Msg, 3),
    BestPartnerId = case lists:reverse(lists:keysort(2,
						     PartnerDpsList))
			of
		      [{BestPartnerIdTemp, _} | _] -> BestPartnerIdTemp;
		      _ -> 0
		    end,
    DoList = var:get_var(NewRole, day, 41, []),
    VarRole = var:set_var(NewRole, day, 41,
			  lists:keystore(BossId, 1, DoList,
					 {BossId, Dps, PartnerDpsList,
					  BestPartnerId, TargetName,
					  HurtStatistics})),
    get_info(VarRole),
    log:save(join,
	     {VarRole, <<"功能玩法"/utf8>>, <<"公会副本"/utf8>>}),
    sys_conn:pack_send(21309,
		       {BossId, Dps, BestPartnerId, NewAwardList, TargetName,
			HurtStatistics}),
    guild_member:mems_apply(GPid, all,
			    {guild_member, set, [{set_first}]}),
    TriggerRole =
	role_trigger:fire(#evt_guild_dun_damage{dps = Dps},
			  VarRole),
    {ok, TriggerRole}.

get_award_by_dps(Dps, BossId) ->
    FId = guild_dun_data:get_f_id(BossId),
    {_, AwardList, BaseList, _} =
	guild_dun_data:get_award(FId),
    {[{Id,
       min(Max,
	   Base +
	     trunc(math:pow(Dps, PowNum0 / 1000) * Amplify0 / 1000))}
      || {Id, Base, Max, PowNum0, Amplify0} <- AwardList],
     BaseList}.

get_award_info(Role = #role{}) ->
    #role{m_guild_dun = #m_guild_dun{first_list = List}} =
	reset_first(Role),
    lists:reverse(List).

get_award(Role = #role{m_guild_dun =
			   MGuildDun = #m_guild_dun{first_list = List},
		       guild_bag = #guild_bag{id = Gid}},
	  FId) ->
    case lists:keyfind(FId, 1, List) of
      {FId, 2} ->
	  {false,
	   lang:get(<<"Đã nhận được phần thưởng chương"/utf8>>)};
      {FId, 1} ->
	  {_, _, _, FirstList} = guild_dun_data:get_award(FId),
	  GL = format:val_to_gain(FirstList,
				  guild_dun_frist_award),
	  case role_gain:do_notice(Role, GL) of
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, Role1} ->
		log:log_gain(GL, Role, Role1, <<"联盟副本"/utf8>>,
			     util:fbin("领取公会副本首通奖励,公会ID:~w,章节ID:~w",
				       [Gid, FId])),
		NewMGuildDun = MGuildDun#m_guild_dun{first_list =
							 lists:keystore(FId, 1,
									List,
									{FId,
									 2})},
		NewRole = Role1#role{m_guild_dun = NewMGuildDun},
		sys_conn:pack_send(21320, {get_award_info(NewRole)}),
		{ok, NewRole}
	  end;
      _ ->
	  case guild_dun_mgr:get_guild_dun(Gid) of
	    #guild_dun{max_id = MaxId} when MaxId >= FId ->
		{_, _, _, FirstList} = guild_dun_data:get_award(FId),
		GL = format:val_to_gain(FirstList,
					guild_dun_frist_award),
		case role_gain:do_notice(Role, GL) of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, Role1} ->
		      log:log_gain(GL, Role, Role1, <<"联盟副本"/utf8>>,
				   util:fbin("领取公会副本首通奖励,公会ID:~w,章节ID:~w",
					     [Gid, FId])),
		      NewMGuildDun = MGuildDun#m_guild_dun{first_list =
							       lists:keystore(FId,
									      1,
									      List,
									      {FId,
									       2})},
		      NewRole = Role1#role{m_guild_dun = NewMGuildDun},
		      sys_conn:pack_send(21320, {get_award_info(NewRole)}),
		      {ok, NewRole}
		end;
	    _ ->
		{false,
		 lang:get(<<"Không đáp ứng các điều kiện để nhận"/utf8>>)}
	  end
    end.

-spec reset_first(#role{}) -> #role{}.

reset_first(Role = #role{m_guild_dun =
			     MGuildDun = #m_guild_dun{first_list = List},
			 guild_bag = #guild_bag{id = Gid}}) ->
    AllList = guild_dun_data:get_all_fid(),
    case guild_dun_mgr:get_guild_dun(Gid) of
      #guild_dun{max_id = MaxId} ->
	  Fun = fun (AwardId, Acc) ->
			case lists:keyfind(AwardId, 1, List) of
			  false ->
			      case MaxId >= AwardId of
				true -> [{AwardId, 1} | Acc];
				_ -> [{AwardId, 0} | Acc]
			      end;
			  {_, 1} when AwardId > MaxId -> [{AwardId, 0} | Acc];
			  {_, 0} when MaxId >= AwardId -> [{AwardId, 1} | Acc];
			  {_, Status} -> [{AwardId, Status} | Acc]
			end
		end,
	  NewList = lists:foldl(Fun, [], AllList),
	  Role#role{m_guild_dun =
			MGuildDun#m_guild_dun{first_list = NewList}};
      _ -> Role
    end.

-spec clean_dps(#role{}) -> ok.

clean_dps(Role = #role{m_guild_dun = GuildDun}) ->
    Role#role{m_guild_dun =
		  GuildDun#m_guild_dun{dps_list = []}}.

-spec push_is_double(#role{}) -> ok.

push_is_double(_Role) ->
    Flag = case is_double() of
	     {true, EndTimes} ->
		 role:set_ms_timer(guild_dun_push_is_double,
				   EndTimes * 1000,
				   {guild_dun_lib, push_is_double, []}),
		 1;
	     _ -> 0
	   end,
    sys_conn:pack_send(21322, {Flag}),
    ok.

is_double() -> false.

-spec assemble(#role{}) -> ok | {false, bitstring()}.

assemble(#role{id = RoleId, name = Name,
	       guild_bag =
		   #guild_bag{post = Post, id = GId, pid = GPid}}) ->
    case guild_dun:assemble(GId, Post) of
      {false, Msg, AssembleTime} ->
	  {false, Msg, AssembleTime};
      {ok, AssembleTime} ->
	  PushFun = fun (R = #role{id = PushRoleId}) ->
			    case PushRoleId =:= RoleId of
			      false ->
				  notice_below:send(R, guild_dun, [], []),
				  role:pack_send(R, 21323,
						 {1, lang:get(<<""/utf8>>),
						  AssembleTime}),
				  ok;
			      _ -> ok
			    end
		    end,
	  case Post =:= 1 of
	    true ->
		Msg =
		    color:msg(lang:get(<<"Chủ Gia Tộc ~ts đã thổi kèn tập hợp, "
					 "kêu gọi các chiến binh trong hội đến "
					 "thử thách phó bản hội, chiến thắng sẽ "
					 "nhận được phần thưởng hấp dẫn！~ts"/utf8>>),
			      [{name, RoleId, Name},
			       {href,
				{44, deep_green, [],
				 lang:get(<<"【Tôi muốn thử thách】"/utf8>>)}}]),
		notice:broadcast(guild, GId, sys_guild, Msg);
	    _ ->
		Msg =
		    color:msg(lang:get(<<"Phó hội trưởng ~ts đã thổi kèn tập hợp, "
					 "kêu gọi các chiến binh trong hội đến "
					 "thử thách phó bản hội, chiến thắng sẽ "
					 "nhận được phần thưởng hấp dẫn！~ts"/utf8>>),
			      [{name, RoleId, Name},
			       {href,
				{44, deep_green, [],
				 lang:get(<<"【Tôi muốn thử thách】"/utf8>>)}}]),
		notice:broadcast(guild, GId, sys_guild, Msg)
	  end,
	  guild_member:mems_apply(GPid, all, {PushFun, []}),
	  {ok, AssembleTime};
      _ ->
	  {false,
	   lang:get(<<"Thời gian tập hợp đã hết hạn"/utf8>>), 0}
    end.


