-file("src/mod/combat/combat_end.erl", 1).

-module(combat_end).

-lager_records([{combat_replay,
		 [ver, combat_type, combat_plays, info]},
		{replay_partner,
		 [id, pos, bid, lev, star, break_lev, power, hp, hp_max,
		  atk, def, speed, crit_rate, crit_ratio, hit_magic,
		  dodge_magic, hurt, behurt, curt, skills, eqms,
		  artifacts, ext]},
		{replay_stat, [id, like, share, play, collect]},
		{replay_info,
		 [id, combat_type, round, sec_type, a_rid, a_name, a_lev,
		  a_face, a_power, a_formation_type, a_camp_type,
		  a_hallow, a_rank, b_rid, b_name, b_lev, b_face, b_power,
		  b_formation_type, b_camp_type, b_hallow, b_rank,
		  a_plist, b_plist, ret, time, like, share, play, collect,
		  ext]},
		{replay,
		 [id, type, combat_type, sec_type, a_rid, a_cond_val,
		  a_power, a_lev, b_rid, b_cond_val, b_power, b_lev,
		  time]},
		{replay_role, [key, list]},
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
		{link, [socket, conn_pid, ip, port, lag]},
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

-export([save_combat_replay/2, combat_end_notify/4,
	 combat_result/2, gen_cli_items/2]).

-export([send_combat_end_with_no_window/2]).

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

-file("src/mod/combat/combat_end.erl", 14).

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

-file("src/mod/combat/combat_end.erl", 15).

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

-file("src/mod/combat/combat_end.erl", 16).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/mod/combat/combat_end.erl", 17).

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

-file("src/mod/combat/combat_end.erl", 18).

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

-file("src/mod/combat/combat_end.erl", 19).

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

-file("src/mod/combat/combat_end.erl", 20).

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

-file("src/mod/combat/combat_end.erl", 21).

-file("inc/replay_hall.hrl", 1).

-record(replay_role, {key = {{0, <<>>}, 0}, list = []}).

-record(replay,
	{id = 0, type = 0, combat_type = 0, sec_type = 0,
	 a_rid = 0, a_cond_val = 0, a_power = 0, a_lev = 0,
	 b_rid = 0, b_cond_val = 0, b_power = 0, b_lev = 0,
	 time = 0}).

-record(replay_info,
	{id = 0, combat_type = 0, round = 0, sec_type = 0,
	 a_rid = {0, <<>>}, a_name = <<>>, a_lev = 0, a_face = 0,
	 a_power = 0, a_formation_type = 0, a_camp_type = 0,
	 a_hallow, a_rank = 0, b_rid = {0, <<>>}, b_name = <<>>,
	 b_lev = 0, b_face = 0, b_power = 0,
	 b_formation_type = 0, b_camp_type = 0, b_hallow,
	 b_rank = 0, a_plist = [], b_plist = [], ret = 0,
	 time = 0, like = 0, share = 0, play = 0, collect = 0,
	 ext = []}).

-record(replay_stat,
	{id = 0, like = 0, share = 0, play = 0, collect = 0}).

-record(replay_partner,
	{id = 0, pos = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, hp = 0, hp_max = 0, atk = 0,
	 def = 0, speed = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, hurt = 0, behurt = 0,
	 curt = 0, skills = [], eqms = [], artifacts = [],
	 ext = []}).

-file("src/mod/combat/combat_end.erl", 22).

-file("inc/combat_replay.hrl", 1).

-record(combat_replay,
	{ver = 1, combat_type, combat_plays = [], info}).

-file("src/mod/combat/combat_end.erl", 23).

save_combat_replay(Combat = #combat{type = CombatType,
				    ext_args = ExtArgs,
				    combat_roles = CombatRoles},
		   Winner) ->
    SaveReplay = list_util:keyfind(save_replay, ExtArgs,
				   false),
    NewExtArgs = [{combat_winner, Winner} | ExtArgs],
    save_combat_replay_dev(sys_env:get(platform), Combat),
    case need_to_save_replay(CombatType, SaveReplay, Winner)
	of
      true ->
	  case combat_dict:combat_replay() of
	    [] -> [];
	    Replay0 ->
		Ret = combat_result(CombatType, 0, Winner, 1),
		NCombat =
		    replay_hall:calc_replay_info(Combat#combat{ext_args =
								   NewExtArgs},
						 Ret),
		Replay = compress_replay(Replay0),
		OtherRoleIds =
		    list_util:keyfind(save_replay_other_role_ids, ExtArgs,
				      []),
		RoleIds = [RoleId
			   || #combat_role{id = RoleId} <- CombatRoles],
		AllRoleIds = OtherRoleIds ++ RoleIds,
		lists:foldl(fun ({_, SrvId}, ReplayInfo) ->
				    case lists:keyfind(SrvId, 1, ReplayInfo) of
				      false ->
					  ReplayId = cluster_lib:call(SrvId,
								      combat_replay_cache_mgr,
								      save_replay,
								      [NCombat,
								       Replay]),
					  [{SrvId, ReplayId} | ReplayInfo];
				      {SrvId, _} -> ReplayInfo
				    end
			    end,
			    [], AllRoleIds)
	  end;
      false ->
	  case need_to_save_replay_to_share(CombatType, Winner) of
	    true -> save_combat_to_chare(Combat);
	    _ -> []
	  end
    end.

save_combat_to_chare(#combat{type = CombatType,
			     combat_roles = [#combat_role{id = {Rid, SrvId}}]})
    when Rid > 0 andalso SrvId =/= <<>> ->
    case combat_dict:combat_replay() of
      [] -> [];
      Replay0 ->
	  Replay = compress_replay(Replay0),
	  CombatReplay = #combat_replay{combat_type = CombatType,
					combat_plays = Replay},
	  ReplayId = combat_replay_cache_mgr:get_replay_id(),
	  role_lib:cast(by_id, {Rid, SrvId},
			{fun (#role{loop_counter = C}) ->
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
				   {__Pidcombat_end68, _,
				    {__Levelcombat_end68, __Tracescombat_end68}}
				       when __Levelcombat_end68 band 128 /= 0
					      orelse
					      __Tracescombat_end68 /= [] ->
				       lager:do_log(debug,
						    [{module, combat_end},
						     {function,
						      save_combat_to_chare},
						     {line, 68},
						     {pid, pid_to_list(self())},
						     {node, node()}
						     | lager:md()],
						    io_lib:format("save_combat_to_chare=~w:~s===========+~w",
								  [Rid, SrvId,
								   ReplayId]),
						    none, 4096, 128,
						    __Levelcombat_end68,
						    __Tracescombat_end68,
						    lager_event,
						    __Pidcombat_end68);
				   _ -> ok
				 end,
				 case put({last_combat_replay, CombatType},
					  {ReplayId, C})
				     of
				   {OldReplayId, _} ->
				       erase({combat_replay, OldReplayId});
				   _ -> skip
				 end,
				 put({combat_replay, ReplayId}, CombatReplay),
				 ok
			 end}),
	  [{SrvId, ReplayId}]
    end;
save_combat_to_chare(_Combat) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcombat_end79, _,
       {__Levelcombat_end79, __Tracescombat_end79}}
	  when __Levelcombat_end79 band 128 /= 0 orelse
		 __Tracescombat_end79 /= [] ->
	  lager:do_log(debug,
		       [{module, combat_end}, {function, save_combat_to_chare},
			{line, 79}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("============+~w",
				     [_Combat#combat.combat_roles]),
		       none, 4096, 128, __Levelcombat_end79,
		       __Tracescombat_end79, lager_event, __Pidcombat_end79);
      _ -> ok
    end,
    ok.

save_combat_replay_dev(P,
		       #combat{type = CombatType,
			       combat_roles = [#combat_role{pid = RPid}]})
    when is_pid(RPid) andalso
	   (P =:= "local" orelse
	      P =:= "dev" orelse P =:= "release") ->
    case combat_dict:combat_replay() of
      [] -> pass;
      Replay0 ->
	  Replay = compress_replay(Replay0),
	  role:apply(async, RPid,
		     {fun (_R) ->
			      put(last_combat_replay, {CombatType, Replay}), ok
		      end})
    end;
save_combat_replay_dev(_P, _Combat) -> ok.

compress_replay(Replay0) ->
    Replay1 = lists:reverse(Replay0),
    CodeBin = proto_lib:pack_code_mate([20000, 20002, 20004,
					20020, 20027]),
    zlib:compress([<<(byte_size(CodeBin)):32,
		     CodeBin/binary>>
		   | Replay1]).

need_to_save_replay(8, _SaveReplay, _Winner) -> true;
need_to_save_replay(7, _SaveReplay, _Winner) -> true;
need_to_save_replay(6, true, _Winner) -> true;
need_to_save_replay(10, true, _Winner) -> true;
need_to_save_replay(31, true, _Winner) -> true;
need_to_save_replay(37, true, _Winner) -> true;
need_to_save_replay(12, _SaveReplay, a_win) -> true;
need_to_save_replay(2, _SaveReplay, _Winner) -> true;
need_to_save_replay(13, _SaveReplay, _Winner) -> true;
need_to_save_replay(16, _SaveReplay, _Winner) -> true;
need_to_save_replay(17, _SaveReplay, a_win) -> true;
need_to_save_replay(18, _SaveReplay, _Winner) -> true;
need_to_save_replay(23, _SaveReplay, _Winner) -> true;
need_to_save_replay(24, _SaveReplay, _Winner) -> true;
need_to_save_replay(3, _SaveReplay, _Winner) -> true;
need_to_save_replay(28, _SaveReplay, _Winner) -> true;
need_to_save_replay(42, _SaveReplay, _Winner) -> true;
need_to_save_replay(21, _SaveReplay, _Winner) -> true;
need_to_save_replay(30, _SaveReplay, _Winner) -> true;
need_to_save_replay(35, _SaveReplay, _Winner) -> true;
need_to_save_replay(43, _SaveReplay, _Winner) -> true;
need_to_save_replay(_CombatType, _SaveReplay,
		    _Winner) ->
    false.

need_to_save_replay_to_share(40, _) -> true;
need_to_save_replay_to_share(_CombatType, _Winner) ->
    false.

combat_end_notify(Combat = #combat{type = Type = 10,
				   on_role_combat_end = {M, F, A}},
		  Result, ReplayInfo, _EndType) ->
    CombatResult = #combat_result{result =
				      combat_result(Type, 0, Result, 1),
				  dead_partner =
				      combat_statistics:dead_partner_when_end(),
				  replay_info = ReplayInfo, end_type = Result,
				  a_stat_info =
				      combat_statistics:get_stat_info(1),
				  b_stat_info =
				      combat_statistics:get_stat_info(2),
				  hurt_statistics =
				      combat_statistics:get_all_partner_statistics(),
				  hurt_statistics_a =
				      combat_statistics:get_partner_hurt_statistics(1),
				  a_control_info = [],
				  a_halo_dizzy_num =
				      combat_dict:get_a_halo_dizzy_num(),
				  a_max_num_def =
				      combat_dict:get_a_max_num_def(),
				  a_kill_info = combat_dict:get_a_kill_info(),
				  a_continue_hurt =
				      combat_dict:get_a_continue_hurt(),
				  a_revive_info =
				      combat_dict:get_a_revive_count(),
				  curt_statistics_a =
				      combat_statistics:get_partner_curt_statistics(1),
				  a_dodge_count =
				      combat_dict:get_a_dodge_count(),
				  a_anti_kill_count =
				      combat_dict:get_anti_kill_count(),
				  a_halo_kill_count =
				      combat_dict:get_halo_kill_count(),
				  a_fire_buff_num =
				      combat_dict:get_a_fire_buff_num(),
				  b_control_info = [],
				  b_halo_dizzy_num =
				      combat_dict:get_b_halo_dizzy_num(),
				  b_max_num_def =
				      combat_dict:get_b_max_num_def(),
				  b_kill_info = combat_dict:get_b_kill_info(),
				  b_continue_hurt =
				      combat_dict:get_b_continue_hurt(),
				  b_revive_info =
				      combat_dict:get_b_revive_count(),
				  curt_statistics_b =
				      combat_statistics:get_partner_curt_statistics(2),
				  hurt_statistics_b =
				      combat_statistics:get_partner_hurt_statistics(2),
				  b_dodge_count =
				      combat_dict:get_b_dodge_count(),
				  b_anti_kill_count =
				      combat_dict:get_b_anti_kill_count(),
				  b_halo_kill_count =
				      combat_dict:get_b_halo_kill_count(),
				  b_fire_buff_num =
				      combat_dict:get_b_fire_buff_num(),
				  is_balance = combat_statistics:is_balance()},
    arena_champion_mgr:apply({M, F,
			      [Combat, CombatResult | A]});
combat_end_notify(Combat = #combat{type = Type = 31,
				   on_role_combat_end = {M, F, A}},
		  Result, ReplayInfo, _EndType) ->
    CombatResult = #combat_result{result =
				      combat_result(Type, 0, Result, 1),
				  dead_partner =
				      combat_statistics:dead_partner_when_end(),
				  replay_info = ReplayInfo, end_type = Result,
				  a_stat_info =
				      combat_statistics:get_stat_info(1),
				  b_stat_info =
				      combat_statistics:get_stat_info(2),
				  hurt_statistics =
				      combat_statistics:get_all_partner_statistics(),
				  hurt_statistics_a =
				      combat_statistics:get_partner_hurt_statistics(1),
				  a_control_info = [],
				  a_halo_dizzy_num =
				      combat_dict:get_a_halo_dizzy_num(),
				  a_max_num_def =
				      combat_dict:get_a_max_num_def(),
				  a_kill_info = combat_dict:get_a_kill_info(),
				  a_continue_hurt =
				      combat_dict:get_a_continue_hurt(),
				  a_revive_info =
				      combat_dict:get_a_revive_count(),
				  curt_statistics_a =
				      combat_statistics:get_partner_curt_statistics(1),
				  a_dodge_count =
				      combat_dict:get_a_dodge_count(),
				  a_anti_kill_count =
				      combat_dict:get_anti_kill_count(),
				  a_halo_kill_count =
				      combat_dict:get_halo_kill_count(),
				  a_fire_buff_num =
				      combat_dict:get_a_fire_buff_num(),
				  b_control_info = [],
				  b_halo_dizzy_num =
				      combat_dict:get_b_halo_dizzy_num(),
				  b_max_num_def =
				      combat_dict:get_b_max_num_def(),
				  b_kill_info = combat_dict:get_b_kill_info(),
				  b_continue_hurt =
				      combat_dict:get_b_continue_hurt(),
				  b_revive_info =
				      combat_dict:get_b_revive_count(),
				  curt_statistics_b =
				      combat_statistics:get_partner_curt_statistics(2),
				  hurt_statistics_b =
				      combat_statistics:get_partner_hurt_statistics(2),
				  b_dodge_count =
				      combat_dict:get_b_dodge_count(),
				  b_anti_kill_count =
				      combat_dict:get_b_anti_kill_count(),
				  b_halo_kill_count =
				      combat_dict:get_b_halo_kill_count(),
				  b_fire_buff_num =
				      combat_dict:get_b_fire_buff_num(),
				  is_balance = combat_statistics:is_balance()},
    arena_cluster_champion_mgr:apply({M, F,
				      [Combat, CombatResult | A]});
combat_end_notify(Combat = #combat{type = Type = 37,
				   on_role_combat_end = {M, F, A},
				   round = Round},
		  Result, ReplayInfo, _EndType) ->
    CombatResult = #combat_result{result =
				      combat_result(Type, 0, Result, 1),
				  dead_partner =
				      combat_statistics:dead_partner_when_end(),
				  replay_info = ReplayInfo, end_type = Result,
				  a_stat_info =
				      combat_statistics:get_stat_info(1),
				  b_stat_info =
				      combat_statistics:get_stat_info(2),
				  hurt_statistics =
				      combat_statistics:get_all_partner_statistics(),
				  hurt_statistics_a =
				      combat_statistics:get_partner_hurt_statistics(1),
				  action_count = Round, a_control_info = [],
				  a_halo_dizzy_num =
				      combat_dict:get_a_halo_dizzy_num(),
				  a_max_num_def =
				      combat_dict:get_a_max_num_def(),
				  a_kill_info = combat_dict:get_a_kill_info(),
				  a_continue_hurt =
				      combat_dict:get_a_continue_hurt(),
				  a_revive_info =
				      combat_dict:get_a_revive_count(),
				  curt_statistics_a =
				      combat_statistics:get_partner_curt_statistics(1),
				  a_dodge_count =
				      combat_dict:get_a_dodge_count(),
				  a_anti_kill_count =
				      combat_dict:get_anti_kill_count(),
				  a_halo_kill_count =
				      combat_dict:get_halo_kill_count(),
				  a_fire_buff_num =
				      combat_dict:get_a_fire_buff_num(),
				  b_control_info = [],
				  b_halo_dizzy_num =
				      combat_dict:get_b_halo_dizzy_num(),
				  b_max_num_def =
				      combat_dict:get_b_max_num_def(),
				  b_kill_info = combat_dict:get_b_kill_info(),
				  b_continue_hurt =
				      combat_dict:get_b_continue_hurt(),
				  b_revive_info =
				      combat_dict:get_b_revive_count(),
				  curt_statistics_b =
				      combat_statistics:get_partner_curt_statistics(2),
				  hurt_statistics_b =
				      combat_statistics:get_partner_hurt_statistics(2),
				  b_dodge_count =
				      combat_dict:get_b_dodge_count(),
				  b_anti_kill_count =
				      combat_dict:get_b_anti_kill_count(),
				  b_halo_kill_count =
				      combat_dict:get_b_halo_kill_count(),
				  b_fire_buff_num =
				      combat_dict:get_b_fire_buff_num(),
				  is_balance = combat_statistics:is_balance()},
    arena_peak_champion_mgr:apply({M, F,
				   [Combat, CombatResult | A]});
combat_end_notify(#combat{type = Type = 15,
			  on_role_combat_end = {M, F, A}},
		  Result, ReplayInfo, _EndType) ->
    CombatResult = #combat_result{result =
				      combat_result(Type, 0, Result, 1),
				  dead_partner =
				      combat_statistics:dead_partner_when_end(),
				  replay_info = ReplayInfo, end_type = Result,
				  a_stat_info =
				      combat_statistics:get_stat_info(1),
				  b_stat_info =
				      combat_statistics:get_stat_info(2),
				  hurt_statistics =
				      combat_statistics:get_all_partner_statistics(),
				  a_control_info = [],
				  a_halo_dizzy_num =
				      combat_dict:get_a_halo_dizzy_num(),
				  a_max_num_def =
				      combat_dict:get_a_max_num_def(),
				  a_kill_info = combat_dict:get_a_kill_info(),
				  a_continue_hurt =
				      combat_dict:get_a_continue_hurt(),
				  a_revive_info =
				      combat_dict:get_a_revive_count(),
				  curt_statistics_a =
				      combat_statistics:get_partner_curt_statistics(1),
				  a_dodge_count =
				      combat_dict:get_a_dodge_count(),
				  a_anti_kill_count =
				      combat_dict:get_anti_kill_count(),
				  a_halo_kill_count =
				      combat_dict:get_halo_kill_count(),
				  a_fire_buff_num =
				      combat_dict:get_a_fire_buff_num(),
				  is_balance = combat_statistics:is_balance()},
    erlang:apply(M, F, [CombatResult | A]);
combat_end_notify(Combat = #combat{type = CombatType,
				   combat_roles = Roles, wave = WaveNum,
				   round = Round},
		  Result, ReplayInfo, EndType) ->
    ok,
    Msg = case Result of _ -> <<>> end,
    DeadMonsterNum =
	length(combat_dict:get_dead_monsters()),
    CombatPid = self(),
    [begin
       CombatResult = #combat_result{result =
					 combat_result(CombatType, WaveNum,
						       Result,
						       R#combat_role.group),
				     dead_monster_num = DeadMonsterNum,
				     wave_num =
					 util:if_true(Result =:= a_win, WaveNum,
						      WaveNum - 1),
				     dead_partner =
					 combat_statistics:dead_partner_when_end(),
				     replay_id =
					 list_util:keyfind(SrvId, ReplayInfo,
							   0),
				     end_type = EndType,
				     a_stat_info =
					 combat_statistics:get_stat_info(1),
				     b_stat_info =
					 combat_statistics:get_stat_info(2),
				     total_hurt = combat_dict:a_group_hurt(),
				     action_count = Round,
				     group_a_num = length(combat_dict:all_a()),
				     replay_info = ReplayInfo,
				     hurt_statistics =
					 combat_statistics:get_all_partner_statistics(),
				     hurt_statistics_a =
					 combat_statistics:get_partner_hurt_statistics(1),
				     a_control_info = [],
				     a_halo_dizzy_num =
					 combat_dict:get_a_halo_dizzy_num(),
				     a_max_num_def =
					 combat_dict:get_a_max_num_def(),
				     a_kill_info =
					 combat_dict:get_a_kill_info(),
				     a_continue_hurt =
					 combat_dict:get_a_continue_hurt(),
				     a_revive_info =
					 combat_dict:get_a_revive_count(),
				     curt_statistics_a =
					 combat_statistics:get_partner_curt_statistics(1),
				     a_dodge_count =
					 combat_dict:get_a_dodge_count(),
				     a_anti_kill_count =
					 combat_dict:get_anti_kill_count(),
				     a_halo_kill_count =
					 combat_dict:get_halo_kill_count(),
				     a_fire_buff_num =
					 combat_dict:get_a_fire_buff_num(),
				     b_control_info = [],
				     b_halo_dizzy_num =
					 combat_dict:get_b_halo_dizzy_num(),
				     b_max_num_def =
					 combat_dict:get_b_max_num_def(),
				     b_kill_info =
					 combat_dict:get_b_kill_info(),
				     b_continue_hurt =
					 combat_dict:get_b_continue_hurt(),
				     b_revive_info =
					 combat_dict:get_b_revive_count(),
				     curt_statistics_b =
					 combat_statistics:get_partner_curt_statistics(2),
				     hurt_statistics_b =
					 combat_statistics:get_partner_hurt_statistics(2),
				     b_dodge_count =
					 combat_dict:get_b_dodge_count(),
				     b_anti_kill_count =
					 combat_dict:get_b_anti_kill_count(),
				     b_halo_kill_count =
					 combat_dict:get_b_halo_kill_count(),
				     b_fire_buff_num =
					 combat_dict:get_b_fire_buff_num(),
				     is_balance =
					 combat_statistics:is_balance(),
				     a_sprite_kill_count =
					 combat_dict:get_a_sprite_kill_count()},
       role:apply(async, R#combat_role.pid,
		  {fun do_combat_end/6,
		   [Combat, CombatResult, [], Msg, CombatPid]})
     end
     || R = #combat_role{id = {_, SrvId}} <- Roles].

combat_result(10, _Wave, draw, Group) ->
    case combat_statistics:get_total_hurt(1) >=
	   combat_statistics:get_total_hurt(2)
	of
      true -> combat_result(a_win, Group);
      false -> combat_result(b_win, Group)
    end;
combat_result(31, _Wave, draw, Group) ->
    case combat_statistics:get_total_hurt(1) >=
	   combat_statistics:get_total_hurt(2)
	of
      true -> combat_result(a_win, Group);
      false -> combat_result(b_win, Group)
    end;
combat_result(37, _Wave, draw, Group) ->
    case combat_statistics:get_total_hurt(1) >=
	   combat_statistics:get_total_hurt(2)
	of
      true -> combat_result(a_win, Group);
      false -> combat_result(b_win, Group)
    end;
combat_result(23, _Wave, draw, Group) ->
    case combat_statistics:get_total_hurt(1) >=
	   combat_statistics:get_total_hurt(2)
	of
      true -> combat_result(a_win, Group);
      false -> combat_result(b_win, Group)
    end;
combat_result(24, _Wave, draw, Group) ->
    case combat_statistics:get_total_hurt(1) >=
	   combat_statistics:get_total_hurt(2)
	of
      true -> combat_result(a_win, Group);
      false -> combat_result(b_win, Group)
    end;
combat_result(35, _Wave, draw, Group) ->
    case combat_statistics:get_total_hurt(1) >=
	   combat_statistics:get_total_hurt(2)
	of
      true -> combat_result(a_win, Group);
      false -> combat_result(b_win, Group)
    end;
combat_result(28, _Wave, draw, Group) ->
    case combat_statistics:get_total_hurt(1) >=
	   combat_statistics:get_total_hurt(2)
	of
      true -> combat_result(a_win, Group);
      false -> combat_result(b_win, Group)
    end;
combat_result(42, _Wave, draw, Group) ->
    case combat_statistics:get_total_hurt(1) >=
	   combat_statistics:get_total_hurt(2)
	of
      true -> combat_result(a_win, Group);
      false -> combat_result(b_win, Group)
    end;
combat_result(_Type, _Wave, Result, Group) ->
    combat_result(Result, Group).

combat_result(a_win, 1) -> 1;
combat_result(b_win, 2) -> 1;
combat_result(_, _) -> 2.

do_combat_end(Role, #combat{type = 1}, _CombatResult, _,
	      _Msg, _CombatPid) ->
    send_combat_end_with_no_window(Role, 1), ok;
do_combat_end(Role = #role{link =
			       #link{conn_pid = ConnPid},
			   combat_pid = NowCombatPid},
	      Combat = #combat{other_arge = OtherArge,
			       target_role_name = TargetName, round = _Round,
			       on_role_combat_end = OnRoleCombatEnd,
			       ext_args = ExtArg, type = CombatType},
	      CombatResult = #combat_result{a_stat_info = AStatInfo,
					    hurt_statistics = HurtStatistics},
	      _Statistics, Msg, CombatPid) ->
    ok,
    PartnerInFight = [],
    put(partner_in_fight, PartnerInFight),
    {ok, Role2, RetMap} = on_role_combat_end(Role,
					     CombatResult, Combat,
					     OnRoleCombatEnd),
    RewardItems = maps:get(rewards, RetMap, []),
    NowTime = maps:get(time, RetMap, 0),
    IsNextCombat = maps:get(is_next_combat, RetMap, false),
    Role3 = friend:add_intimacy_list(Role2, Combat,
				     CombatResult),
    WinOrLose = CombatResult#combat_result.result,
    AllEndHp = lists:sum([Hp || #{hp := Hp} <- AStatInfo]),
    AllEndMaxHp = lists:sum([HpMax
			     || #{hp_max := HpMax} <- AStatInfo]),
    HpRio = round(AllEndHp / AllEndMaxHp * 1000),
    AdvRoomId = list_util:keyfind(room_id, OtherArge, 0),
    AdvExtList = list_util:keyfind(ext_list, OtherArge, []),
    case is_show_panel(CombatType, ExtArg, RetMap) of
      2 -> skip;
      1 ->
	  ok,
	  ShowPanelType = util:if_true(IsNextCombat, 2, 1),
	  combat:pack_send(CombatType, Role3, 20006,
			   {WinOrLose, gen_cli_items(RewardItems, []),
			    ShowPanelType, NowTime, 0, CombatType, TargetName,
			    HurtStatistics, HpRio, AdvRoomId, AdvExtList});
      0 ->
	  case CombatType == 23 orelse
		 CombatType == 24 orelse
		   CombatType == 28 orelse
		     CombatType == 42 orelse CombatType == 35
	      of
	    true ->
		ShowPanelType = util:if_true(IsNextCombat, 2, 0),
		role:pack_send(ConnPid, 20006,
			       {WinOrLose, [], ShowPanelType, 0, 0, CombatType,
				<<>>, [], 0, AdvRoomId, AdvExtList});
	    _ -> send_combat_end_with_no_window(ConnPid, CombatType)
	  end,
	  NewGL = format:val_to_gain(RewardItems, combat_reward),
	  notice:alert(format:gain_text(NewGL, Role))
    end,
    NewRole = case CombatPid of
		NowCombatPid -> Role3#role{combat_pid = 0, status = 0};
		_ -> Role3
	      end,
    NewRole1 = role_weekly:combat_over_fire(NewRole,
					    CombatResult),
    LastRole = trigger_combat_evt(NewRole1, Combat,
				  CombatResult),
    notice:alert(Msg),
    case
      combat_type_data:get_is_save_partner_log(CombatType)
	of
      1 ->
	  log_http_json:save(LastRole, CombatResult, CombatType);
      _ -> skip
    end,
    erase(partner_in_fight),
    {ok, LastRole}.

-spec on_role_combat_end(#role{}, #combat_result{},
			 #combat{},
			 none |
			 {M :: atom(), F :: atom(), A :: [any()]}) -> {ok,
								       #role{},
								       #{}}.

on_role_combat_end(Role, _, _, undefined) ->
    {ok, Role, #{}};
on_role_combat_end(Role, CombatResult, Combat,
		   {M, F, A}) ->
    try apply(M, F, [Role, CombatResult, Combat | A]) of
      ok -> {ok, Role, #{}};
      {ok, NewR} when is_record(NewR, role) ->
	  {ok, NewR, #{}};
      {ok, NewR, RetMap = #{}} when is_record(NewR, role) ->
	  {ok, NewR, RetMap};
      {ok, NewR, Rewards} when is_record(NewR, role) ->
	  {ok, NewR, #{rewards => Rewards}};
      {ok, NewR, Rewards, NowTime}
	  when is_record(NewR, role) ->
	  {ok, NewR, #{rewards => Rewards, time => NowTime}};
      _Other ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcombat_end464, _,
	     {__Levelcombat_end464, __Tracescombat_end464}}
		when __Levelcombat_end464 band 8 /= 0 orelse
		       __Tracescombat_end464 /= [] ->
		lager:do_log(error,
			     [{module, combat_end},
			      {function, on_role_combat_end}, {line, 464},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("on role combat end other result ~w,",
					   [erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelcombat_end464,
			     __Tracescombat_end464, lager_event,
			     __Pidcombat_end464);
	    _ -> ok
	  end,
	  {ok, Role, #{}}
    catch
      T:E ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcombat_end467, _,
	     {__Levelcombat_end467, __Tracescombat_end467}}
		when __Levelcombat_end467 band 8 /= 0 orelse
		       __Tracescombat_end467 /= [] ->
		lager:do_log(error,
			     [{module, combat_end},
			      {function, on_role_combat_end}, {line, 467},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("on role combat end error ~w,~w,~w",
					   [T, E, erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelcombat_end467,
			     __Tracescombat_end467, lager_event,
			     __Pidcombat_end467);
	    _ -> ok
	  end,
	  {ok, Role, #{}}
    end;
on_role_combat_end(Role, _, _, _) -> {ok, Role, #{}}.

is_show_panel(_CombatType, _ExtArg,
	      #{is_show_panel := Type}) ->
    Type;
is_show_panel(8, _, _RetMap) -> 2;
is_show_panel(_CombatType, ExtArg, _RetMap) ->
    case lists:keyfind(unit, 1, ExtArg) of
      false ->
	  case lists:keyfind(is_show_panel, 1, ExtArg) of
	    {is_show_panel, true} -> 1;
	    {is_show_panel, false} -> 0;
	    _ -> 1
	  end;
      {unit, {_, _, BaseId}} ->
	  #unit_data{reward_panel_type = Type} =
	      unit_data:get(BaseId),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcombat_end484, _,
	     {__Levelcombat_end484, __Tracescombat_end484}}
		when __Levelcombat_end484 band 128 /= 0 orelse
		       __Tracescombat_end484 /= [] ->
		lager:do_log(debug,
			     [{module, combat_end}, {function, is_show_panel},
			      {line, 484}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("unit_show_panel_type==~w==~w",
					   [BaseId, Type]),
			     none, 4096, 128, __Levelcombat_end484,
			     __Tracescombat_end484, lager_event,
			     __Pidcombat_end484);
	    _ -> ok
	  end,
	  Type
    end.

send_combat_end_with_no_window(_Role = #role{link =
						 #link{conn_pid = ConnPid}},
			       CombatType) ->
    send_combat_end_with_no_window(ConnPid, CombatType);
send_combat_end_with_no_window(ConnPid, CombatType) ->
    role:pack_send(ConnPid, 20006,
		   {1, [], 0, 0, 0, CombatType, <<>>, [], 0, 0, []}).

trigger_combat_evt(Role = #role{id = RoleId},
		   Combat = #combat{type = CombatType,
				    combat_roles = CombatRoles,
				    ext_args = ExtArgs},
		   CombatResult = #combat_result{result = Result}) ->
    Evt = util:if_true(Result =:= 1,
		       #evt_combat_win{type = CombatType},
		       #evt_combat_lose{type = CombatType}),
    Role1_0 = role_trigger:fire(Evt, Role),
    Role1 = case CombatType == 8 of
	      true ->
		  feat_combat:combat_over_fire_pk(Role1_0, a, Combat,
						  CombatResult);
	      _ ->
		  feat_combat:combat_over_fire(Role1_0, a, Combat,
					       CombatResult)
	    end,
    case lists:keyfind(RoleId, #combat_role.id, CombatRoles)
	of
      #combat_role{group = 1} ->
	  case lists:keyfind(unit, 1, ExtArgs) of
	    {unit, {_UnitId, _UnitPid, HostBaseId}} ->
		KillEvts = case CombatResult of
			     #combat_result{result = 1} ->
				 [#evt_kill_npc{host_base_id = HostBaseId,
						num = 1}];
			     #combat_result{result = 2} ->
				 [#evt_kill_npc_lose{host_base_id = HostBaseId,
						     num = 1}];
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
				   {__Pidcombat_end519, _,
				    {__Levelcombat_end519,
				     __Tracescombat_end519}}
				       when __Levelcombat_end519 band 128 /= 0
					      orelse
					      __Tracescombat_end519 /= [] ->
				       lager:do_log(debug,
						    [{module, combat_end},
						     {function,
						      trigger_combat_evt},
						     {line, 519},
						     {pid, pid_to_list(self())},
						     {node, node()}
						     | lager:md()],
						    io_lib:format("[~ts]未匹配的战斗结果[Result:~w]",
								  [Role#role.name,
								   CombatResult]),
						    none, 4096, 128,
						    __Levelcombat_end519,
						    __Tracescombat_end519,
						    lager_event,
						    __Pidcombat_end519);
				   _ -> ok
				 end,
				 []
			   end,
		FightEvt = #evt_fight_unit{host_base_id = HostBaseId,
					   num = 1},
		Evts = [FightEvt | KillEvts],
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcombat_end524, _,
		   {__Levelcombat_end524, __Tracescombat_end524}}
		      when __Levelcombat_end524 band 128 /= 0 orelse
			     __Tracescombat_end524 /= [] ->
		      lager:do_log(debug,
				   [{module, combat_end},
				    {function, trigger_combat_evt}, {line, 524},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]战斗结束后触发事件[Evt:~w]",
						 [Role#role.name, Evts]),
				   none, 4096, 128, __Levelcombat_end524,
				   __Tracescombat_end524, lager_event,
				   __Pidcombat_end524);
		  _ -> ok
		end,
		role_trigger:fire(Evts, Role1);
	    _ -> Role1
	  end;
      #combat_role{} -> Role1;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcombat_end532, _,
	     {__Levelcombat_end532, __Tracescombat_end532}}
		when __Levelcombat_end532 band 8 /= 0 orelse
		       __Tracescombat_end532 /= [] ->
		lager:do_log(error,
			     [{module, combat_end},
			      {function, trigger_combat_evt}, {line, 532},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts] 战斗结束后触发事件失败，无法找到所属组",
					   [Role#role.name]),
			     none, 4096, 8, __Levelcombat_end532,
			     __Tracescombat_end532, lager_event,
			     __Pidcombat_end532);
	    _ -> ok
	  end,
	  Role1
    end.

gen_cli_items([], Acc) -> Acc;
gen_cli_items([{Bid, Num} | Rest], Acc) ->
    gen_cli_items(Rest, [{Bid, 0, Num, 0} | Acc]);
gen_cli_items([{Bid, Bind, Num} | Rest], Acc) ->
    gen_cli_items(Rest, [{Bid, Bind, Num, 0} | Acc]);
gen_cli_items([{Bid, Bind, Num, Id, _MoveTo} | Rest],
	      Acc) ->
    gen_cli_items(Rest, [{Bid, Bind, Num, Id} | Acc]);
gen_cli_items([I | Rest], Acc) ->
    gen_cli_items(Rest, [I | Acc]).


