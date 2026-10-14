-file("src/mod/guild_secret_area/guild_secret_area_l"
      "ib.erl",
      1).

-module(guild_secret_area_lib).

-lager_records([{m_face,
		 [ver, status, update_time, file]},
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
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
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
		{guild_secret_area_rank, [ver, id, rank_detail]},
		{secret_rank, [ver, number, chapter_id, dps_list]},
		{role_rank,
		 [ver, r_id, lev, face_id, avatar_bid, name, dps, rank,
		  max_dps, power, face_update_time, face_file]},
		{guild_secret_area,
		 [ver, id, boss_detail, boss_list, number,
		  fail_boss_list, last_crusade]},
		{boss_detail,
		 [ver, bid, hp, max_hp, end_time, count_time,
		  kill_time]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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

-export([push/2, push/3, crusade/2, loss_vitality/2,
	 combat_start/5, ban_boss/1, start_crusade/5, login/1,
	 combat_over/4, buy_time/2, get_progress_reward/2,
	 mop/2]).

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

-file("src/mod/guild_secret_area/guild_secret_area_l"
      "ib.erl",
      23).

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

-file("src/mod/guild_secret_area/guild_secret_area_l"
      "ib.erl",
      24).

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

-file("src/mod/guild_secret_area/guild_secret_area_l"
      "ib.erl",
      25).

-file("inc/guild_secret_area.hrl", 1).

-record(boss_detail,
	{ver = 2  :: pos_integer(), bid = 0  :: pos_integer(),
	 hp = 0  :: pos_integer(), max_hp = 0  :: pos_integer(),
	 end_time = 0  :: pos_integer(),
	 count_time = 0  :: pos_integer(),
	 kill_time = 0  :: pos_integer()}).

-record(guild_secret_area,
	{ver = 2  :: pos_integer(),
	 id = {0, <<>>}  :: {pos_integer(), binary()},
	 boss_detail = #boss_detail{}  :: tuple(),
	 boss_list = []  :: list(), number = 0  :: pos_integer(),
	 fail_boss_list = []  :: pos_integer(),
	 last_crusade = 0  :: pos_integer()}).

-record(role_rank,
	{ver = 2  :: pos_integer(),
	 r_id = {0, <<>>}  :: tuple(), lev = 0  :: pos_integer(),
	 face_id = 0  :: pos_integer(),
	 avatar_bid = 0  :: pos_integer(),
	 name = <<>>  :: string(), dps = 0  :: pos_integer(),
	 rank = 0  :: pos_integer(),
	 max_dps = 0  :: pos_integer(),
	 power = 0  :: pos_integer(),
	 face_update_time = 0  :: pos_integer(),
	 face_file = <<>>  :: string()}).

-record(secret_rank,
	{ver = 1  :: pos_integer(),
	 number = 0  :: pos_integer(),
	 chapter_id = 0  :: pos_integer(),
	 dps_list = []  :: list()}).

-record(guild_secret_area_rank,
	{ver = 1  :: pos_integer(),
	 id = {0, <<>>}  :: {pos_integer(), binary()},
	 rank_detail = []  :: list()}).

-file("src/mod/guild_secret_area/guild_secret_area_l"
      "ib.erl",
      26).

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

-file("src/mod/guild_secret_area/guild_secret_area_l"
      "ib.erl",
      27).

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

-file("src/mod/guild_secret_area/guild_secret_area_l"
      "ib.erl",
      28).

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

-file("src/mod/guild_secret_area/guild_secret_area_l"
      "ib.erl",
      29).

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

-file("src/mod/guild_secret_area/guild_secret_area_l"
      "ib.erl",
      30).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/guild_secret_area/guild_secret_area_l"
      "ib.erl",
      31).

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

-file("src/mod/guild_secret_area/guild_secret_area_l"
      "ib.erl",
      32).

-file("inc/face.hrl", 1).

-record(m_face,
	{ver = 1, status = 0, update_time = 0, file = <<>>}).

-file("src/mod/guild_secret_area/guild_secret_area_l"
      "ib.erl",
      33).

login(Role = #role{guild_bag =
		       #guild_bag{id = Gid, pid = Pid}}) ->
    #guild_secret_area{number = Number,
		       boss_detail = #boss_detail{bid = BossId},
		       last_crusade = NowCrusade} =
	guild_secret_area_mgr:get_guild_secret(Gid),
    {RoleGid, RoleNumber, PlayTime, BuyTime, _Dps,
     LastUpdateTime} =
	var:get_var(Role, other, 3063,
		    {{0, <<>>}, 0, 0, 0, 0, 0}),
    {BanGid, BanNumber} = var:get_var(Role, other, 3062,
				      {{0, <<>>}, 0}),
    Now = date:unixtime(),
    LastSecond = date:diff(second, Now, LastUpdateTime),
    NeedSecond =
	guild_secret_area_data:get_const(player_reset_interval),
    NewRole = case is_pid(Pid) andalso BossId > 0 of
		true when BanGid =:= Gid andalso BanNumber =:= Number ->
		    Role;
		true
		    when RoleGid =:= Gid andalso RoleNumber =:= Number ->
		    Role;
		true when LastSecond < NeedSecond ->
		    Role1 = var:set_var(Role, other, 3063,
					{Gid, Number, PlayTime, BuyTime, 0,
					 LastUpdateTime}),
		    Role1;
		true ->
		    Role1 = var:set_var(Role, other, 3063,
					{Gid, Number, 0, 0, 0, NowCrusade}),
		    Role1;
		_ -> Role
	      end,
    {ok, NewRole}.

-spec buy_time(#role{}, pos_integer()) -> {ok,
					   #role{}} |
					  {false, string()}.

buy_time(Role = #role{guild_bag =
			  #guild_bag{id = Gid, pid = Pid, lev = GuildLev}},
	 BossId) ->
    #guild_secret_area{number = Number,
		       boss_detail =
			   #boss_detail{bid = OldBossId,
					count_time = CountTime}} =
	guild_secret_area_mgr:get_guild_secret(Gid),
    {RoleGid, RoleNumber, PlayTime, BuyTime, Dps,
     LastUpdateTime} =
	var:get_var(Role, other, 3063,
		    {{0, <<>>}, 0, 0, 0, 0, 0}),
    {BanGid, BanNumber} = var:get_var(Role, other, 3062,
				      {{0, <<>>}, 0}),
    OldResidueTime = get_residue_time_information(Role),
    {OldResidueBuyTime, _OldBuyLoss} =
	get_residue_buy_time_information(Role),
    GuildLevLimit =
	guild_secret_area_data:get_const(guild_secret_open_lev),
    case is_pid(Pid) of
      true when GuildLev < GuildLevLimit ->
	  {false, lang:get(<<"公会等级不够"/utf8>>)};
      true when BanGid =:= Gid andalso BanNumber =:= Number ->
	  {false, lang:get(<<"不能挑战此Boss"/utf8>>), OldResidueTime,
	   OldResidueBuyTime};
      true when CountTime > 0 ->
	  {false, lang:get(<<"Boss已结算，无需购买"/utf8>>),
	   OldResidueTime, OldResidueBuyTime};
      true ->
	  case RoleGid =:= Gid andalso
		 RoleNumber =:= Number andalso BossId =:= OldBossId
	      of
	    true ->
		case guild_secret_area_data:get_buy_time(BuyTime + 1) of
		  LossList when is_list(LossList) ->
		      Loss = format:val_to_loss(LossList, guild_secret_area),
		      case role_gain:do(Role, Loss) of
			{ok, LossRole} ->
			    NewRole = var:set_var(LossRole, other, 3063,
						  {RoleGid, RoleNumber,
						   PlayTime, BuyTime + 1, Dps,
						   LastUpdateTime}),
			    ResidueTime = get_residue_time_information(NewRole),
			    {ResidueBuyTime, _BuyLoss} =
				get_residue_buy_time_information(NewRole),
			    log:log_gain(Loss, Role, LossRole, <<"公会秘境"/utf8>>,
					 <<"公会秘境购买次数"/utf8>>),
			    {ok, NewRole, ResidueTime, ResidueBuyTime};
			_ ->
			    {false, lang:get(<<"资产不足"/utf8>>), OldResidueTime,
			     OldResidueBuyTime}
		      end;
		  _ ->
		      {false, lang:get(<<"购买次数已满"/utf8>>), OldResidueTime,
		       OldResidueBuyTime}
		end;
	    _ ->
		{false, lang:get(<<"该boss还未开启哦~"/utf8>>),
		 OldResidueTime, OldResidueBuyTime}
	  end;
      _ ->
	  {false, lang:get(<<"你没有公会"/utf8>>), OldResidueTime,
	   OldResidueBuyTime}
    end.

-spec crusade(pos_integer(), #role{}) -> ok |
					 {false, string()}.

crusade(BossId, Role) ->
    crusade([check_cond, do_crusade], BossId, Role, #{}).

-spec push(pos_integer(), #role{}) -> ok.

push(26800,
     Role = #role{guild_bag =
		      #guild_bag{id = GId, pid = Pid}}) ->
    GuildSecret = #guild_secret_area{number = Number,
				     boss_detail =
					 #boss_detail{bid = OldBossId,
						      count_time = CountTime},
				     last_crusade = LastCrusade} =
		      guild_secret_area_mgr:get_guild_secret(GId),
    ResidueTime = get_residue_time_information(Role),
    {ResidueBuyTime, BuyLoss} =
	get_residue_buy_time_information(Role),
    {RoleGid, RoleNumber, RewardList} = var:get_var(Role,
						    other, 3059,
						    {{0, <<>>}, 0, []}),
    NewRewardList = case RoleGid =:= GId andalso
			   RoleNumber =:= Number andalso is_pid(Pid)
			of
		      true -> RewardList;
		      _ -> []
		    end,
    IsReward = case check_progress_reward(Role) of
		 ok -> 1;
		 _ -> 0
	       end,
    {ModGid, ModNumber, _PlayTime, _BuyTime, Dps,
     _LastUpdateTime} =
	var:get_var(Role, other, 3063,
		    {{0, <<>>}, 0, 0, 0, 0, 0}),
    NewDps = case ModGid =:= GId andalso
		    ModNumber =:= Number andalso is_pid(Pid)
		 of
	       true -> Dps;
	       _ -> 0
	     end,
    Now = date:unixtime(),
    LastSecond = date:diff(second, Now, LastCrusade),
    NeedSecond =
	guild_secret_area_data:get_const(player_reset_interval),
    IsSameDay = date:is_same_day(CountTime, Now),
    Button = case OldBossId > 0 of
	       true when CountTime =:= 0 -> 0;
	       true when IsSameDay =:= true -> 0;
	       true when LastSecond < NeedSecond -> 0;
	       _ -> 1
	     end,
    role:pack_send(26800,
		   {ResidueTime, ResidueBuyTime, BuyLoss, GuildSecret,
		    NewRewardList, NewDps, Button, IsReward}),
    ok;
push(26810, #role{guild_bag = #guild_bag{id = Gid}}) ->
    case guild_lib:info(by_id, Gid) of
      {ok, #guild{vitality = Vitality}} ->
	  role:pack_send(26810, {Vitality}), ok;
      _ -> ok
    end;
push(_, _) -> ok.

-spec push(pos_integer(), #role{}, tuple()) -> ok.

push(26807, #role{}, Data) ->
    role:pack_send(26807, Data), ok;
push(26808, #role{},
     {Flag, UseTime, PutItemList, RewardList}) ->
    role:pack_send(26808,
		   {Flag, UseTime, PutItemList, RewardList}),
    ok;
push(26809, #role{}, Data) ->
    role:pack_send(26809, Data), ok;
push(_, _, _) -> ok.

-spec loss_vitality(#guild{}, pos_integer()) -> {sync,
						 ok, #guild{}} |
						{ok, {false, string()}}.

loss_vitality(Guild = #guild{vitality = Vitality},
	      LossNum) ->
    case Vitality >= LossNum of
      true ->
	  NewGuild = Guild#guild{vitality = Vitality - LossNum},
	  {sync, ok, NewGuild};
      _ -> {ok, {false, lang:get(<<"公会活跃度不足"/utf8>>)}}
    end.

-spec combat_start(#role{}, pos_integer(),
		   pos_integer(), list(), pos_integer()) -> {ok, #role{}} |
							    {false, string()}.

combat_start(Role = #role{lev = Lev}, BossId,
	     FormationType, PosInfo, HallowsId) ->
    case check_can_combat([count, formation, boss, unit],
			  Role,
			  #{boss_id => BossId, formation => FormationType,
			    pos_info => PosInfo, hallows_id => HallowsId})
	of
      {false, Msg} -> {false, Msg};
      {Hp, _UnitId} ->
	  CombatType = 34,
	  FormationLev = formation_lib:get_formation_lev(Role,
							 FormationType),
	  FightPos = formation_lib:gen_fight_pos(PosInfo,
						 FormationType),
	  AtkGroup0 = combat_lib:gen_fight_objects(Role,
						   FightPos),
	  AtkGroup = sprite_tree:gen_fight_object_type(Role, 27)
		       ++
		       hallows_lib:gen_fight_object(Role, HallowsId) ++
			 AtkGroup0,
	  #unit_data{formation = {BFormationType, BFormationLev},
		     name = TarName} =
	      unit_data:get(BossId),
	  {RoleGid, RoleNumber, PlayTime, BuyTime, _Dps,
	   LastUpdateTime} =
	      var:get_var(Role, other, 3063,
			  {{0, <<>>}, 0, 0, 0, 0, 0}),
	  Args = #{on_role_combat_end =>
		       {guild_secret_area_lib, combat_over,
			[{RoleGid, RoleNumber, PlayTime, BuyTime, BossId,
			  LastUpdateTime}]},
		   ext_args =>
		       [{cli_ext_args, [BossId]}, {is_show_panel, false}],
		   formation =>
		       [{1, FormationType, FormationLev},
			{2, BFormationType, BFormationLev}],
		   target_role_name => TarName},
	  case unit_monster:gen_fight_objects(Lev, BossId) of
	    [] -> {false, lang:get(<<"怪物配置有问题"/utf8>>)};
	    [DefendList | _] ->
		NewDefendList = get_new_hp(DefendList, Hp, []),
		case combat_lib:start_combat(Role, CombatType, AtkGroup,
					     [NewDefendList], Args)
		    of
		  {ok, _CombatPid} ->
		      log:save(join,
			       {Role, <<"功能玩法"/utf8>>, <<"公会秘境"/utf8>>}),
		      case formation:set_sys_formation(Role, 27,
						       FormationType, PosInfo,
						       HallowsId)
			  of
			{ok, NewRole} ->
			    NewRole11 =
				role_trigger:fire([#evt_guild_secret_area_combat{}],
						  NewRole),
			    {ok, CombatType, NewRole11};
			_ -> {ok, CombatType, Role}
		      end;
		  {false, Msg} -> {false, Msg};
		  _ -> {false, lang:get(<<"无法挑战公会秘境Boss"/utf8>>)}
		end
	  end
    end.

-spec combat_over(#role{}, #combat_result{}, #combat{},
		  tuple()) -> {ok, #role{}}.

combat_over(Role = #role{id = RId, name = Name,
			 lev = Lev, power = Power, face_id = FaceId,
			 m_avatar = #m_avatar{used = AvatarBid}},
	    #combat_result{total_hurt = Dps,
			   hurt_statistics = HurtStatistics},
	    #combat{},
	    {RoleGid, RoleNumber, PlayTime, BuyTime, BossId,
	     LastUpdateTime}) ->
    {_, FaceFile, FaceUpdateTime} =
	role_face:face_info(Role),
    NewRole = case guild_secret_area_mgr:call({kill_boss,
					       RoleGid, RoleNumber, Dps, RId,
					       Name, Lev, FaceId, AvatarBid,
					       Power, FaceUpdateTime, FaceFile})
		  of
		ok ->
		    Role1 = var:set_var(Role, other, 3063,
					{RoleGid, RoleNumber, PlayTime + 1,
					 BuyTime, Dps, LastUpdateTime}),
		    Role2 = reward_combat_over(Role1, Dps, BossId,
					       HurtStatistics),
		    Role2;
		{false, Reason} -> notice:alert(Reason), Role;
		_ -> Role
	      end,
    push(26800, NewRole),
    {ok, NewRole}.

-spec ban_boss(#role{}) -> #role{}.

ban_boss(Role = #role{guild_bag =
			  #guild_bag{id = Gid}}) ->
    #guild_secret_area{number = Number,
		       boss_detail = #boss_detail{bid = BossId}} =
	guild_secret_area_mgr:get_guild_secret(Gid),
    case BossId > 0 of
      true ->
	  NewRole = var:set_var(Role, other, 3062, {Gid, Number}),
	  NewRole;
      _ -> Role
    end.

-spec start_crusade(#role{}, pos_integer(),
		    pos_integer(), pos_integer(), pos_integer()) -> {ok,
								     #role{}} |
								    ok.

start_crusade(Role = #role{guild_bag =
			       #guild_bag{id = Gid}},
	      Gid, Number, EndTime, NowUpdateTime) ->
    {_, _, LastPlayTime, LastBuyTime, _, LastUpdateTime} =
	var:get_var(Role, other, 3063,
		    {{0, <<>>}, 0, 0, 0, 0, 0}),
    Now = date:unixtime(),
    LastSecond = date:diff(second, Now, LastUpdateTime),
    NeedSecond =
	guild_secret_area_data:get_const(player_reset_interval),
    Role2 = case LastSecond < NeedSecond of
	      true ->
		  Role1 = var:set_var(Role, other, 3063,
				      {Gid, Number, LastPlayTime, LastBuyTime,
				       0, LastUpdateTime}),
		  Role1;
	      _ ->
		  Role1 = var:set_var(Role, other, 3063,
				      {Gid, Number, 0, 0, 0, NowUpdateTime}),
		  Role1
	    end,
    Role3 = var:set_var(Role2, other, 3060,
			{Gid, Number, 1}),
    push(26807, Role3, {0, EndTime}),
    push(26800, Role3),
    push(26810, Role3),
    {ok, Role3};
start_crusade(_, _, _, _, _) -> ok.

-spec get_progress_reward(tuple(), #role{}) -> {ok,
						#role{}} |
					       {false, string()}.

get_progress_reward({BossId, Order}, Role) ->
    get_progress_reward([guild, check_cond, reward], Role,
			#{boss_id => BossId, order => Order}).

-spec mop(pos_integer(), #role{}) -> {ok, #role{}} |
				     {false, string()}.

mop(BossId,
    Role = #role{id = RId, name = Name, lev = Lev,
		 power = Power, face_id = FaceId,
		 m_avatar = #m_avatar{used = AvatarBid}}) ->
    case check_can_combat([count, boss, unit], Role,
			  #{boss_id => BossId})
	of
      {false, Msg} -> {false, Msg};
      {_Hp, _UnitId} ->
	  {RoleGid, RoleNumber, PlayTime, BuyTime, Dps,
	   LastUpdateTime} =
	      var:get_var(Role, other, 3063,
			  {{0, <<>>}, 0, 0, 0, 0, 0}),
	  case Dps > 0 of
	    true ->
		{_, FaceFile, FaceUpdateTime} =
		    role_face:face_info(Role),
		case guild_secret_area_mgr:call({kill_boss, RoleGid,
						 RoleNumber, Dps, RId, Name,
						 Lev, FaceId, AvatarBid, Power,
						 FaceUpdateTime, FaceFile})
		    of
		  ok ->
		      Role1 = var:set_var(Role, other, 3063,
					  {RoleGid, RoleNumber, PlayTime + 1,
					   BuyTime, Dps, LastUpdateTime}),
		      Role2 = reward_combat_over(Role1, Dps, BossId),
		      NewRole =
			  role_trigger:fire([#evt_guild_secret_area_combat{}],
					    Role2),
		      {ok, NewRole};
		  {false, _Reason} -> {false, _Reason};
		  _ -> {false, lang:get(<<"扫荡失败"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"需要挑战过一次才能扫荡喔!"/utf8>>)}
	  end
    end.

crusade([], _, _, _) -> ok;
crusade([One | Rest], BossId, Role, Args) ->
    case do_crusade(One, BossId, Role, Args) of
      ok -> crusade(Rest, BossId, Role, Args);
      {ok, NewArgs} -> crusade(Rest, BossId, Role, NewArgs);
      {false, Reason} -> {false, Reason};
      _ -> {false, lang:get(<<"讨伐失败"/utf8>>)}
    end;
crusade(_, _, _, _) ->
    {false, lang:get(<<"讨伐失败"/utf8>>)}.

do_crusade(check_cond, BossId,
	   #role{guild_bag =
		     #guild_bag{post = Post, lev = GuildLev}},
	   Args) ->
    case guild_secret_area_data:get_boss(BossId) of
      {NeedLev, LiveTime, LossNum} when GuildLev >= NeedLev ->
	  case Post =:= 1 orelse Post =:= 2 of
	    true ->
		{ok, Args#{live_time => LiveTime, loss_num => LossNum}};
	    _ -> {false, lang:get(<<"需要会长或者副会长消耗公会活跃开启"/utf8>>)}
	  end;
      {_, _, _} -> {false, lang:get(<<"公会等级不足"/utf8>>)};
      _ -> {false, lang:get(<<"配置错误"/utf8>>)}
    end;
do_crusade(do_crusade, BossId,
	   #role{guild_bag = #guild_bag{id = Gid}},
	   #{live_time := LiveTime, loss_num := LossNum}) ->
    case guild_secret_area_mgr:call({update_guild_secret,
				     Gid, BossId, LiveTime, LossNum})
	of
      {ok, Number, EndTime, NowUpdateTime} ->
	  case guild_member:mems_apply(Gid, all,
				       {guild_secret_area_lib, start_crusade,
					[Gid, Number, EndTime, NowUpdateTime]})
	      of
	    ok -> ok;
	    _ -> {false, lang:get(<<"你没有公会"/utf8>>)}
	  end;
      {false, Reason} -> {false, Reason};
      _ -> {false, lang:get(<<"讨伐失败"/utf8>>)}
    end;
do_crusade(_, _, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

get_residue_time_information(Role = #role{guild_bag =
					      #guild_bag{id = Gid,
							 pid = Pid}}) ->
    #guild_secret_area{number = Number} =
	guild_secret_area_mgr:get_guild_secret(Gid),
    {RoleGid, RoleNumber, PlayTime, BuyTime, _Dps,
     _LastUpdateTime} =
	var:get_var(Role, other, 3063,
		    {{0, <<>>}, 0, 0, 0, 0, 0}),
    {BanGid, BanNumber} = var:get_var(Role, other, 3062,
				      {{0, <<>>}, 0}),
    case is_pid(Pid) of
      true ->
	  case BanGid =:= Gid andalso BanNumber =:= Number of
	    true -> 0;
	    _ ->
		case RoleGid =:= Gid andalso RoleNumber =:= Number of
		  true ->
		      FreeTime =
			  guild_secret_area_data:get_const(guild_secret_free_time),
		      ResidueTime = max(0, FreeTime + BuyTime - PlayTime),
		      ResidueTime;
		  _ -> 0
		end
	  end;
      _ -> 0
    end.

get_residue_buy_time_information(Role = #role{guild_bag
						  =
						  #guild_bag{id = Gid,
							     pid = Pid}}) ->
    #guild_secret_area{number = Number} =
	guild_secret_area_mgr:get_guild_secret(Gid),
    {RoleGid, RoleNumber, _PlayTime, BuyTime, _Dps,
     _LastUpdateTime} =
	var:get_var(Role, other, 3063,
		    {{0, <<>>}, 0, 0, 0, 0, 0}),
    {BanGid, BanNumber} = var:get_var(Role, other, 3062,
				      {{0, <<>>}, 0}),
    case is_pid(Pid) of
      true ->
	  case BanGid =:= Gid andalso BanNumber =:= Number of
	    true -> {0, []};
	    _ ->
		case RoleGid =:= Gid andalso RoleNumber =:= Number of
		  true ->
		      case guild_secret_area_data:get_buy_time(BuyTime + 1) of
			LossList when is_list(LossList) ->
			    MaxTime =
				lists:max(guild_secret_area_data:get_buy_max_time()),
			    LastTime = max(0, MaxTime - BuyTime),
			    {LastTime, LossList};
			_ -> {0, []}
		      end;
		  _ -> {0, []}
		end
	  end;
      _ -> {0, []}
    end.

check_can_combat([], _Role,
		 #{hp := Hp, unit_id := UnitId}) ->
    {Hp, UnitId};
check_can_combat([count | Rest], Role, Cache) ->
    case get_residue_time_information(Role) > 0 of
      true -> check_can_combat(Rest, Role, Cache);
      _ -> {false, lang:get(<<"已达到本次讨伐挑战次数上限"/utf8>>)}
    end;
check_can_combat([formation | Other], Role,
		 Cache = #{formation := FormationType,
			   pos_info := PosInfo, hallows_id := HallowsId}) ->
    case formation:check_formation_pos_info(Role,
					    FormationType, PosInfo, HallowsId,
					    27)
	of
      {false, Reason} -> {false, Reason};
      {ok, []} -> {false, lang:get(<<"至少需要上阵一个英雄"/utf8>>)};
      {ok, _NewPosInfo} ->
	  check_can_combat(Other, Role, Cache)
    end;
check_can_combat([boss | Other],
		 Role = #role{guild_bag = #guild_bag{id = Gid}},
		 Cache = #{boss_id := BossId}) ->
    Now = date:unixtime(),
    case guild_secret_area_mgr:get_guild_secret(Gid) of
      #guild_secret_area{boss_detail =
			     #boss_detail{bid = Bid, end_time = EndTime}}
	  when Bid =/= 0 andalso
		 Bid =:= BossId andalso Now > EndTime ->
	  {false, lang:get(<<"该Boss不在挑战时间范围内"/utf8>>)};
      #guild_secret_area{boss_detail =
			     #boss_detail{bid = Bid, count_time = CountTime}}
	  when Bid =/= 0 andalso
		 Bid =:= BossId andalso CountTime > 0 ->
	  {false, lang:get(<<"该Boss已结算，不能挑战"/utf8>>)};
      #guild_secret_area{boss_detail =
			     #boss_detail{bid = Bid, hp = Hp, max_hp = MaxHp}}
	  when Bid =/= 0 andalso Bid =:= BossId ->
	  case Hp > 0 of
	    true -> check_can_combat(Other, Role, Cache#{hp => Hp});
	    _ -> check_can_combat(Other, Role, Cache#{hp => MaxHp})
	  end;
      _ -> {false, lang:get(<<"不能挑战该Boss"/utf8>>)}
    end;
check_can_combat([unit | Other], Role,
		 Cache = #{boss_id := BossId}) ->
    case guild_secret_area_data:get_unit_id(BossId) of
      UnitId when is_integer(UnitId) ->
	  check_can_combat(Other, Role,
			   Cache#{unit_id => UnitId});
      _ -> {false, lang:get(<<"boss配置错误"/utf8>>)}
    end;
check_can_combat(_, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

get_new_hp([], _, FightObjectList) -> FightObjectList;
get_new_hp([FightObject = #fight_object{} | DefendList],
	   Hp, FightObjectList) ->
    NewFightObject = FightObject#fight_object{hp =
						  max(Hp, 1)},
    get_new_hp(DefendList, Hp,
	       [NewFightObject | FightObjectList]);
get_new_hp(_, _, FightObjectList) -> FightObjectList.

check_progress_reward(Role = #role{id = RId,
				   guild_bag = #guild_bag{id = GId, pid = Pid}})
    when is_pid(Pid) ->
    #guild_secret_area{boss_detail =
			   #boss_detail{bid = Bid},
		       number = Number} =
	guild_secret_area_mgr:get_guild_secret(GId),
    {BanGid, BanNumber} = var:get_var(Role, other, 3062,
				      {{0, <<>>}, 0}),
    case BanGid =:= GId andalso BanNumber =:= Number of
      true -> false;
      _ when Bid > 0 ->
	  case
	    guild_secret_area_rank:get_guild_secret_dps_list(GId,
							     Bid)
	      of
	    DpsList when is_list(DpsList) ->
		case lists:keyfind(RId, #role_rank.r_id, DpsList) of
		  #role_rank{} -> ok;
		  _ -> false
		end;
	    _ -> false
	  end;
      _ -> false
    end;
check_progress_reward(_) -> false.

get_progress_reward([], Role, _) -> {ok, Role};
get_progress_reward([Label | Rest], Role, Args) ->
    case get_progress_reward(Label, Role, Args) of
      {ok, NewRole} ->
	  get_progress_reward(Rest, NewRole, Args);
      {ok, NewRole, NewArgs} ->
	  get_progress_reward(Rest, NewRole, NewArgs);
      {false, Reason} -> {false, Reason};
      _ -> {false, lang:get(<<"参数错误"/utf8>>)}
    end;
get_progress_reward(guild,
		    Role = #role{guild_bag =
				     #guild_bag{id = GId, pid = Pid}},
		    Args = #{boss_id := BossId, order := Order}) ->
    case is_pid(Pid) of
      true ->
	  #guild_secret_area{boss_detail =
				 #boss_detail{bid = Bid, hp = Hp,
					      max_hp = MaxHp},
			     number = Number} =
	      guild_secret_area_mgr:get_guild_secret(GId),
	  {BanGid, BanNumber} = var:get_var(Role, other, 3062,
					    {{0, <<>>}, 0}),
	  case BossId =:= Bid andalso Bid > 0 of
	    true when BanGid =:= GId andalso BanNumber =:= Number ->
		{false, lang:get(<<"由于您在该轮讨伐开始后加入公会，因此无法领取该奖励"/utf8>>)};
	    true ->
		BossProgress = Hp / max(1, MaxHp),
		case guild_secret_area_data:get_progress({BossId,
							  Order})
		    of
		  {Progress, RewardList}
		      when BossProgress =< Progress / 1000 ->
		      {ok, Role,
		       Args#{number => Number, reward => RewardList}};
		  {_, _} -> {false, lang:get(<<"目前还不能领取该奖励"/utf8>>)};
		  _ -> {false, lang:get(<<"配置数据错误"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"不能领取该奖励"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"你没有公会"/utf8>>)}
    end;
get_progress_reward(check_cond,
		    Role = #role{id = RId,
				 guild_bag = #guild_bag{id = GId}},
		    #{order := Order, number := Number,
		      boss_id := BossId}) ->
    {RoleGid, RoleNumber, OldRewardList} = var:get_var(Role,
						       other, 3059,
						       {{0, <<>>}, 0, []}),
    IsMember = lists:member(Order, OldRewardList),
    case RoleGid =:= GId andalso RoleNumber =:= Number of
      true when IsMember =:= true ->
	  {false, lang:get(<<"你已经领取过该奖励了"/utf8>>)};
      true ->
	  case
	    guild_secret_area_rank:get_guild_secret_dps_list(GId,
							     BossId)
	      of
	    DpsList when is_list(DpsList) ->
		case lists:keyfind(RId, #role_rank.r_id, DpsList) of
		  #role_rank{} ->
		      NewRole = var:set_var(Role, other, 3059,
					    {RoleGid, RoleNumber,
					     [Order | OldRewardList]}),
		      {ok, NewRole};
		  _ -> {false, lang:get(<<"至少挑战过一次boss才可以领取哦~"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"奖励飞走了"/utf8>>)}
	  end;
      _ ->
	  case
	    guild_secret_area_rank:get_guild_secret_dps_list(GId,
							     BossId)
	      of
	    DpsList when is_list(DpsList) ->
		case lists:keyfind(RId, #role_rank.r_id, DpsList) of
		  #role_rank{} ->
		      NewRole = var:set_var(Role, other, 3059,
					    {GId, Number, [Order]}),
		      {ok, NewRole};
		  _ -> {false, lang:get(<<"至少挑战过一次boss才可以领取哦~"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"奖励飞走了"/utf8>>)}
	  end
    end;
get_progress_reward(reward, Role,
		    #{reward := RewardList}) ->
    Gain = format:val_to_gain(RewardList,
			      guild_secret_area),
    case role_gain:do_notice(Role, Gain) of
      {ok, GainRole} ->
	  log:log_gain(Gain, Role, GainRole, <<"公会秘境奖励"/utf8>>,
		       <<"公会秘境阶段奖励"/utf8>>),
	  push(26800, GainRole),
	  {ok, GainRole};
      _ -> {false, lang:get(<<"领取奖励失败"/utf8>>)}
    end;
get_progress_reward(_, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

reward_combat_over(Role, Dps, BossId, HurtStatistics) ->
    case guild_secret_area_data:get_combat_reward(BossId) of
      {Coefficient, MaxCoefficient, RewardList}
	  when is_integer(Coefficient),
	       is_integer(MaxCoefficient), Coefficient > 0 ->
	  RewardTimes = util:uceil(Dps / Coefficient),
	  RealTimes = min(RewardTimes, MaxCoefficient),
	  RealRewardList = [{Id, Num * RealTimes}
			    || {Id, Num} <- RewardList],
	  Gain = format:val_to_gain(RealRewardList,
				    guild_secret_area),
	  case role_gain:do(Role, Gain) of
	    {ok, GainRole} ->
		push(26809, GainRole,
		     {1, RealRewardList, HurtStatistics}),
		log:log_gain(Gain, Role, GainRole, <<"公会秘境奖励"/utf8>>,
			     <<"公会秘境战斗奖励"/utf8>>),
		GainRole;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidguild_secret_area_lib614, _,
		   {__Levelguild_secret_area_lib614,
		    __Tracesguild_secret_area_lib614}}
		      when __Levelguild_secret_area_lib614 band 8 /= 0 orelse
			     __Tracesguild_secret_area_lib614 /= [] ->
		      lager:do_log(error,
				   [{module, guild_secret_area_lib},
				    {function, reward_combat_over}, {line, 614},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "公会秘境战斗奖励配置错误", none, 4096, 8,
				   __Levelguild_secret_area_lib614,
				   __Tracesguild_secret_area_lib614,
				   lager_event, __Pidguild_secret_area_lib614);
		  _ -> ok
		end,
		Role
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
	    {__Pidguild_secret_area_lib618, _,
	     {__Levelguild_secret_area_lib618,
	      __Tracesguild_secret_area_lib618}}
		when __Levelguild_secret_area_lib618 band 8 /= 0 orelse
		       __Tracesguild_secret_area_lib618 /= [] ->
		lager:do_log(error,
			     [{module, guild_secret_area_lib},
			      {function, reward_combat_over}, {line, 618},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "公会秘境战斗奖励配置错误", none, 4096, 8,
			     __Levelguild_secret_area_lib618,
			     __Tracesguild_secret_area_lib618, lager_event,
			     __Pidguild_secret_area_lib618);
	    _ -> ok
	  end,
	  Role
    end.

reward_combat_over(Role, Dps, BossId) ->
    case guild_secret_area_data:get_combat_reward(BossId) of
      {Coefficient, MaxCoefficient, RewardList}
	  when is_integer(Coefficient),
	       is_integer(MaxCoefficient), Coefficient > 0 ->
	  RewardTimes = util:uceil(Dps / Coefficient),
	  RealTimes = min(RewardTimes, MaxCoefficient),
	  RealRewardList = [{Id, Num * RealTimes}
			    || {Id, Num} <- RewardList],
	  Gain = format:val_to_gain(RealRewardList,
				    guild_secret_area),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, GainRole} ->
		log:log_gain(Gain, Role, GainRole, <<"公会秘境奖励"/utf8>>,
			     <<"公会秘境战斗奖励"/utf8>>),
		GainRole;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidguild_secret_area_lib635, _,
		   {__Levelguild_secret_area_lib635,
		    __Tracesguild_secret_area_lib635}}
		      when __Levelguild_secret_area_lib635 band 8 /= 0 orelse
			     __Tracesguild_secret_area_lib635 /= [] ->
		      lager:do_log(error,
				   [{module, guild_secret_area_lib},
				    {function, reward_combat_over}, {line, 635},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "公会秘境战斗奖励配置错误", none, 4096, 8,
				   __Levelguild_secret_area_lib635,
				   __Tracesguild_secret_area_lib635,
				   lager_event, __Pidguild_secret_area_lib635);
		  _ -> ok
		end,
		Role
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
	    {__Pidguild_secret_area_lib639, _,
	     {__Levelguild_secret_area_lib639,
	      __Tracesguild_secret_area_lib639}}
		when __Levelguild_secret_area_lib639 band 8 /= 0 orelse
		       __Tracesguild_secret_area_lib639 /= [] ->
		lager:do_log(error,
			     [{module, guild_secret_area_lib},
			      {function, reward_combat_over}, {line, 639},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "公会秘境战斗奖励配置错误", none, 4096, 8,
			     __Levelguild_secret_area_lib639,
			     __Tracesguild_secret_area_lib639, lager_event,
			     __Pidguild_secret_area_lib639);
	    _ -> ok
	  end,
	  Role
    end.


