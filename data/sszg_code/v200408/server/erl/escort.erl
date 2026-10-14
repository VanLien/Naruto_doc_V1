-file("src/mod/escort/escort.erl", 1).

-module(escort).

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
		{activity, [id, status, name, data, ext_args]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{violators_record, [id, name, lists]},
		{say_history, [id, clear_time, lists]},
		{say_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{say_frame, [ver, base_id, expire_time]},
		{m_say, [ver, used, frames]},
		{say_subtitle_msg, [id, role_id, name, msg, time]},
		{say_subtitle_role, [pid, conn_pid, type]},
		{say_msg, [len, msg, tick]},
		{say_send,
		 [id, name, sex, career, lev, face_id, vip_lev, capacity,
		  head_bid, chat_bubble, msg_list, face_update_time,
		  face_file]},
		{say_mon,
		 [rid, srv_id, name, ctime, lev, vip_lev, msg, remark]},
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
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
		{escort_pos_info,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp]},
		{escort_plunder_log,
		 [id, quality, rid, name, guild_name, face, lev, sex,
		  power, avatar_id, ret, atk_ret, items, time, atk_count,
		  help_count, help_time, formation_type, formation_lev,
		  pos_info, combat_role, replay_id, ext]},
		{escort_plunder_role, [id, atk_logs, def_logs]},
		{escort,
		 [id, name, gid, quality, end_time, plunder_lists,
		  combat_lists, gname, power]},
		{m_escort, [ver, status, quality, end_time, five_data]},
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

-export([init/0, ready/1, info/2, next_list/1,
	 base_info/1, ref_quality/2, do/1, q_finish/1, reward/1,
	 time_check/2, plunder_info/2, plunder/2, combat_over/4,
	 get_push_log_info/3, atk_back/3, atk_back_help/2,
	 ref_log/2, five_flush/1, login/1, push_is_double/1,
	 time_check2/1]).

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

-file("src/mod/escort/escort.erl", 31).

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

-file("src/mod/escort/escort.erl", 32).

-file("inc/escort.hrl", 1).

-record(m_escort,
	{ver = 1  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 quality = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 five_data = []  :: list()}).

-record(escort,
	{id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: non_neg_integer(),
	 gid = {0, <<>>}  :: tuple(),
	 quality = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 plunder_lists = []  :: non_neg_integer(),
	 combat_lists = []  :: non_neg_integer(),
	 gname = <<>>  :: non_neg_integer(),
	 power = 0  :: non_neg_integer()}).

-record(escort_plunder_role,
	{id = {0, <<>>}, atk_logs = [], def_logs = []}).

-record(escort_plunder_log,
	{id = 0, quality = 0, rid = {0, <<>>}, name = <<>>,
	 guild_name = <<>>, face = 0, lev = 0, sex = 0,
	 power = 0, avatar_id = 0, ret = 0, atk_ret = 0,
	 items = [], time = 0, atk_count = 0, help_count = 0,
	 help_time = 0, formation_type = 0, formation_lev = 0,
	 pos_info = [], combat_role = [], replay_id = 0,
	 ext = []}).

-record(escort_pos_info,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0}).

-file("src/mod/escort/escort.erl", 33).

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

-file("src/mod/escort/escort.erl", 34).

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

-file("src/mod/escort/escort.erl", 35).

-file("inc/log.hrl", 1).

-file("src/mod/escort/escort.erl", 36).

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

-file("src/mod/escort/escort.erl", 37).

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

-file("src/mod/escort/escort.erl", 38).

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

-file("src/mod/escort/escort.erl", 39).

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

-file("src/mod/escort/escort.erl", 40).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/escort/escort.erl", 41).

-file("inc/say.hrl", 1).

-record(say_mon,
	{rid = 0  :: pos_integer(), srv_id = <<>>  :: binary(),
	 name = <<>>  :: bitstring(),
	 ctime = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 msg = <<>>  :: binary(), remark = <<>>  :: binary()}).

-record(say_send,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 lev = 0, face_id = 0, vip_lev = 0, capacity = 0,
	 head_bid = 0, chat_bubble = 0, msg_list = [],
	 face_update_time = 0, face_file = <<>>}).

-record(say_msg, {len = 0, msg = <<>>, tick = 0}).

-record(say_subtitle_role,
	{pid = 0  :: 0 | pid(), conn_pid = 0  :: 0 | pid(),
	 type = 0  :: integer()}).

-record(say_subtitle_msg,
	{id = 0  :: non_neg_integer(),
	 role_id = {0, <<>>}  ::
	     {non_neg_integer(), bitstring()},
	 name = <<>>  :: bitstring(), msg = <<>>  :: bitstring(),
	 time = 0  :: non_neg_integer()}).

-record(m_say, {ver = 1, used = 0, frames = []}).

-record(say_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(say_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-record(say_history,
	{id = {0, <<>>}, clear_time = 0, lists = []}).

-record(violators_record,
	{id = {0, <<>>}, name = <<>>, lists = []}).

-file("src/mod/escort/escort.erl", 42).

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

-file("src/mod/escort/escort.erl", 43).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/escort/escort.erl", 44).

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

-file("src/mod/escort/escort.erl", 45).

-spec init() -> #m_escort{}.

init() -> #m_escort{quality = init_quality()}.

-spec login(#role{}) -> {ok, #role{}}.

login(#role{m_escort =
		#m_escort{status = Status, end_time = EndTime}}) ->
    Now = date:unixtime(),
    if Now >= EndTime, EndTime > 0, Status == 1 ->
	   role:set_ms_timer(escort_end_timer, 1000,
			     {escort, time_check2, []});
       Now < EndTime ->
	   role:set_ms_timer(escort_end_timer,
			     (EndTime - Now) * 1000, {escort, time_check2, []});
       true -> ok
    end,
    ok.

-spec ready(#role{}) -> {ok, #role{}}.

ready(#role{m_escort =
		#m_escort{status = Status, end_time = EndTime}}) ->
    Now = date:unixtime(),
    case Now >= EndTime andalso
	   EndTime > 0 andalso Status == 1
	of
      true ->
	  role:set_ms_timer(escort_end_timer, 3000,
			    {escort, time_check2, []});
      false -> ok
    end,
    ok.

-spec five_flush(#role{}) -> {ok, #role{}}.

five_flush(Role = #role{m_escort = MEscort}) ->
    NewRole = Role#role{m_escort =
			    MEscort#m_escort{five_data = []}},
    base_info(NewRole),
    {ok, NewRole}.

init_quality() ->
    RandList = escort_data:const(init_base),
    {Q, _} = util:rand_list(RandList, 2),
    Q.

-spec push_is_double(#role{}) -> ok.

push_is_double(_Role) ->
    Flag = case is_double() of
	     {true, EndTimes} ->
		 role:set_ms_timer(escort_push_is_double,
				   EndTimes * 1000,
				   {escort, push_is_double, []}),
		 1;
	     _ -> 0
	   end,
    sys_conn:pack_send(24020, {Flag}),
    ok.

is_double() ->
    Now = date:unixtime(),
    Times = escort_data:const(double_time),
    case get_double_time(Times, Now) of
      false -> false;
      EndTimes -> {true, EndTimes}
    end.

get_double_time([], _Now) -> false;
get_double_time([{StartTime, EndTime} | Other], Now) ->
    Time1 = date:next_diff(StartTime),
    Time2 = date:next_diff(EndTime),
    case Time2 >= Time1 of
      true -> get_double_time(Other, Now);
      _ -> Time2
    end.

-spec info(#role{}, role_id()) -> ok.

info(#role{id = RoleId, power = Power}, MustId) ->
    Now = date:unixtime(),
    case get(escort_info) of
      {OldTime, List} when Now - OldTime < 1 ->
	  sys_conn:pack_send(24000, {List});
      _ ->
	  List = escort_mgr:cluster_match(RoleId, MustId, Power),
	  init_timer(List),
	  put(escort_info, {Now, List}),
	  sys_conn:pack_send(24000, {List})
    end.

-spec next_list(#role{}) -> ok.

next_list(#role{id = RoleId, power = Power}) ->
    Now = date:unixtime(),
    List = escort_mgr:cluster_match(RoleId, {0, <<>>},
				    Power),
    init_timer(List),
    put(escort_info, {Now, List}),
    sys_conn:pack_send(24019, {List}).

-spec base_info(#role{}) -> ok.

base_info(#role{id = RoleId,
		m_escort =
		    #m_escort{five_data = FiveDatas, status = Status,
			      quality = Quality, end_time = EndTime}}) ->
    PlunderCount = case escort_mgr:get_escort(RoleId) of
		     #escort{plunder_lists = L} -> length(L);
		     _ -> 0
		   end,
    sys_conn:pack_send(24006,
		       {Status, Quality, EndTime, PlunderCount, FiveDatas}),
    ok.

init_timer(List) ->
    case lists:keysort(#escort.end_time, List) of
      [#escort{id = RId, end_time = EndTime} | _] ->
	  Time = max(1, EndTime - date:unixtime()),
	  role:set_ms_timer(ref_escort_info, Time * 1000,
			    {escort, time_check, [RId]});
      _ -> ok
    end.

-spec time_check(#role{}, role_id()) -> {ok, #role{}}.

time_check(Role = #role{id = RoleId}, RId) ->
    {Time, List} = util:get(escort_info, {0, []}),
    List2 = lists:keydelete(RId, #escort.id, List),
    DelList = [Id || #escort{id = Id} <- List2],
    AddList = escort_mgr:match2([RoleId | DelList], RoleId),
    NewList = AddList ++ List2,
    init_timer(NewList),
    put(escort_info, {Time, NewList}),
    sys_conn:pack_send(24005, {RId, AddList}),
    {ok, Role}.

-spec ref_quality(#role{}, pos_integer()) -> {ok,
					      #role{}} |
					     {false, binary()}.

ref_quality(#role{m_escort = #m_escort{status = 1}},
	    _Type) ->
    {false, lang:get(<<"护送已开始，不能继续刷新"/utf8>>)};
ref_quality(#role{m_escort = #m_escort{quality = 4}},
	    _Type) ->
    {false, lang:get(<<"已达最高品质，不可再刷新"/utf8>>)};
ref_quality(Role = #role{m_escort =
			     MEscort = #m_escort{five_data = FiveDatas,
						 quality = Quality}},
	    Type) ->
    ExpendT = get_ref_quality_expend(Type),
    RefCount = list_util:keyfind(6, FiveDatas, 0),
    FreeCount = escort_data:const(free_refresh_time),
    {Expend, NewRefCount} = if Type == 2 ->
				   {ExpendT, RefCount};
			       RefCount < FreeCount -> {[], RefCount + 1};
			       true -> {ExpendT, RefCount + 1}
			    end,
    Loss = format:val_to_loss(Expend, escort_ref_quality),
    case role_gain:do_notice(Role, Loss,
			     #gain_loss_opts{need_notify_fail_item = true})
	of
      {ok, NRole} ->
	  NewQuality = do_ref_quality(Quality, Type),
	  log:log_gain(Loss, Role, NRole, <<"护送"/utf8>>,
		       util:fbin("刷新品质, 当前次数:~w， 品质:~w  新品质:~w",
				 [RefCount, Quality, NewQuality])),
	  NewFiveDatas = lists:keystore(6, 1, FiveDatas,
					{6, NewRefCount}),
	  NewRole = NRole#role{m_escort =
				   MEscort#m_escort{quality = NewQuality,
						    five_data = NewFiveDatas}},
	  base_info(NewRole),
	  {ok, NewRole};
      {false, #loss{msg = Msg}} -> {false, Msg}
    end.

get_ref_quality_expend(2) ->
    escort_data:const(steprefresh_cost);
get_ref_quality_expend(_) ->
    escort_data:const(refresh_cost).

do_ref_quality(_Quality, 2) -> 4;
do_ref_quality(Quality, _) ->
    case escort_data:get_ref_rand_list(Quality) of
      RandList = [_ | _] ->
	  {NewQuality, _} = util:rand_list(RandList, 2),
	  NewQuality;
      _ -> 0
    end.

-spec time_check2(#role{}) -> ok.

time_check2(_) -> notice_below:send(escort), ok.

-spec do(#role{}) -> {ok, #role{}} | {false, binary()}.

do(#role{m_escort = #m_escort{status = 1}}) ->
    {false, lang:get(<<"已有未完成的护送，不能重复护送"/utf8>>)};
do(Role = #role{m_escort =
		    MEscort = #m_escort{quality = Quality,
					five_data = FiveDatas}}) ->
    OpenCond = escort_data:const(open_lev),
    case role_misc:check_open_cond(OpenCond, Role) of
      {false, Msg} -> {false, Msg};
      _ ->
	  EscortCount = list_util:keyfind(1, FiveDatas, 0),
	  case EscortCount >= escort_data:const(escort_time) of
	    false ->
		Now = date:unixtime(),
		DoTime = escort_data:get_do_time(Quality),
		NewFiveDats = lists:keystore(1, 1, FiveDatas,
					     {1, EscortCount + 1}),
		EscortData = to_escort_data(Role, Quality,
					    Now + DoTime),
		ets:insert(escort_data, EscortData),
		dets:insert(escort_data, EscortData),
		Role1 = Role#role{m_escort =
				      MEscort#m_escort{five_data = NewFiveDats,
						       status = 1,
						       end_time =
							   Now + DoTime}},
		NewRole = role_trigger:fire(#evt_escort_enter{}, Role1),
		base_info(NewRole),
		role:set_ms_timer(escort_end_timer, DoTime * 1000,
				  {escort, time_check2, []}),
		log:save(join,
			 {NewRole, <<"功能玩法"/utf8>>, <<"护送"/utf8>>}),
		do_notice(Role, Quality),
		{ok, NewRole};
	    _ -> {false, lang:get(<<"本日雇佣次数为0，请明天再来吧！"/utf8>>)}
	  end
    end.

do_notice(Role = #role{id = {Rid, Sid}}, Quality)
    when Quality >= 3 ->
    case sys_env:get(group_id) of
      0 ->
	  Name = escort_data:get_name(Quality),
	  Msg =
	      color:msg(lang:get(<<"~ts在萌兽夺宝玩法中雇佣的~ts正在路上，四处的人对它虎视眈眈!~ts"/utf8>>),
			[{role, Role#role.name}, {string, {Quality, Name}},
			 {href,
			  {34, green, [Rid, Sid],
			   lang:get(<<"【我要掠夺】"/utf8>>)}}]),
	  notice:broadcast(rumor, Msg);
      _ ->
	  Name = escort_data:get_name(Quality),
	  Msg =
	      color:msg(lang:get(<<"~ts在萌兽夺宝玩法中雇佣的~ts正在路上，四处的人对它虎视眈眈!~ts"/utf8>>),
			[{kf_name, {Rid, Sid}, Role#role.name},
			 {string, {Quality, Name}},
			 {href,
			  {34, green, [Rid, Sid],
			   lang:get(<<"【我要掠夺】"/utf8>>)}}]),
	  cluster_group:group_cast(notice, broadcast,
				   [rumor, Msg])
    end;
do_notice(_Role, _Quality) -> ok.

to_escort_data(#role{id = Id,
		     guild_bag = #guild_bag{id = Gid, name = GName},
		     name = Name},
	       Quality, EndTime) ->
    #escort{id = Id, gid = Gid, name = Name,
	    quality = Quality, end_time = EndTime, gname = GName}.

-spec q_finish(#role{}) -> {ok, #role{},
			    pos_integer()} |
			   {false, binary()}.

q_finish(#role{m_escort = #m_escort{status = 0}}) ->
    {false, lang:get(<<"没有进行中的护送, 不能快速完成"/utf8>>)};
q_finish(Role = #role{id = RoleId,
		      m_escort =
			  MEscort = #m_escort{quality = Quality,
					      end_time = EndTime}}) ->
    Now = date:unixtime(),
    Time = EndTime - Now,
    case Time > 0 of
      true ->
	  Expend = escort_data:get_finish_expend(Time),
	  Loss = format:val_to_loss(Expend, escort_q_finish),
	  Award = get_award(Role, Quality),
	  GainAward = case is_double() of
			{true, _} ->
			    [{ItemId, ItemNum * 2}
			     || {ItemId, ItemNum} <- Award];
			_ -> Award
		      end,
	  Gain = format:val_to_gain(GainAward, escort_q_finish),
	  case role_gain:do_notice(Role, Loss ++ Gain) of
	    {ok, NRole} ->
		escort_mgr:info({delete, RoleId}),
		log:log_gain(Loss ++ Gain, Role, NRole, <<"护送"/utf8>>,
			     util:fbin("快速完成，品质:~w， 剩余时间:~w", [Quality, Time])),
		NQuality = init_quality(),
		NewRole = NRole#role{m_escort =
					 MEscort#m_escort{status = 0,
							  quality = NQuality,
							  end_time = Now}},
		base_info(NewRole),
		util:unset_timer(escort_end_timer),
		{ok, NewRole};
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {false, #gain{msg = Msg}} -> {false, Msg}
	  end;
      _ -> {false, lang:get(<<"当前护送可完成, 无需支付"/utf8>>)}
    end.

get_award(#role{id = RoleId, lev = Lev}, Quality) ->
    Award = escort_data:get_award({Quality, Lev}),
    case Quality >= escort_data:const(quality_protect) of
      true -> Award;
      _ ->
	  PlunderCount = case escort_mgr:get_escort(RoleId) of
			   #escort{plunder_lists = L} ->
			       min(escort_data:const(mon_plunder_limit),
				   length(L));
			   _ -> 0
			 end,
	  PlunderAward = escort_data:get_plunder_award({Quality,
							Lev}),
	  F = fun ({Id, Num}, Acc) ->
		      DelNum = list_util:keyfind(Id, PlunderAward, 0),
		      [{Id, Num - DelNum * PlunderCount} | Acc]
	      end,
	  lists:foldl(F, [], Award)
    end.

-spec reward(#role{}) -> {ok, #role{}} |
			 {false, binary()}.

reward(#role{m_escort = #m_escort{status = 0}}) ->
    {false, lang:get(<<"没有可领取的奖励"/utf8>>)};
reward(Role = #role{id = RoleId,
		    m_escort =
			MEscort = #m_escort{quality = Quality,
					    end_time = EndTime}}) ->
    Now = date:unixtime(),
    Time = EndTime - Now,
    case Time =< 0 of
      true ->
	  Award = get_award(Role, Quality),
	  GainAward = case is_double() of
			{true, _} ->
			    [{ItemId, ItemNum * 2}
			     || {ItemId, ItemNum} <- Award];
			_ -> Award
		      end,
	  Gain = format:val_to_gain(GainAward, escort_reward),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole} ->
		escort_mgr:info({delete, RoleId}),
		log:log_gain(Gain, Role, NRole, <<"护送"/utf8>>,
			     util:fbin("快速完成，品质:~w", [Quality])),
		NQuality = init_quality(),
		NewRole = NRole#role{m_escort =
					 MEscort#m_escort{status = 0,
							  quality = NQuality,
							  end_time = Now}},
		base_info(NewRole),
		util:unset_timer(escort_end_timer),
		{ok, NewRole};
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {false, #gain{msg = Msg}} -> {false, Msg}
	  end;
      _ -> {false, lang:get(<<"护送未完成，不能领取"/utf8>>)}
    end.

-spec plunder_info(#role{}, role_id()) -> tuple().

plunder_info(Role, RoleId = {_, RoleServerId}) ->
    case cluster_lib:call(RoleServerId, escort_mgr,
			  get_escort, [RoleId])
	of
      #escort{quality = Quality} ->
	  case cluster_lib:call(RoleServerId, role_robot,
				get_role, [RoleId])
	      of
	    {ok,
	     Robot = #role_robot{gname = GuildName, gid = Gid,
				 id = RoleId, lev = Lev,
				 m_formation =
				     #m_formation{all_lineups = AllLine,
						  use_lineup = Id},
				 face_id = FaceId, power = Power,
				 partners = Partners, name = Name}} ->
		#formation_lineup{pos_info = PosInfo,
				  type = FormationType} =
		    lists:keyfind(Id, #formation_lineup.id, AllLine),
		FormationLev = formation_lib:get_formation_lev(Robot,
							       FormationType),
		PushList = get_robot_pos_info(PosInfo, Partners, []),
		{ok,
		 {Quality, RoleId, Gid, Name, Lev, FaceId, Power,
		  GuildName, FormationType, FormationLev, PushList}};
	    _ -> {false, lang:get(<<"获取对方数据失败"/utf8>>)}
	  end;
      _ ->
	  notice:alert(lang:get(<<"该雇佣兽已过期"/utf8>>)),
	  time_check(Role, RoleId),
	  ok
    end.

get_robot_pos_info([], _Partners, L) -> L;
get_robot_pos_info([#formation_pos{pos = Pos, id = Id}
		    | FightPos],
		   Partners, L) ->
    case lists:keyfind(Id, #partner.id, Partners) of
      #partner{bid = Bid, lev = Lev, quality = Quality,
	       star = Star, break_lev = BreakLev} ->
	  get_robot_pos_info(FightPos, Partners,
			     [{Pos, Bid, Lev, Quality, Star, BreakLev} | L]);
      _ -> get_robot_pos_info(FightPos, Partners, L)
    end.

-spec plunder(#role{}, role_id()) -> {false, binary()} |
				     {ok, #role{}}.

plunder(#role{id = RoleId}, RoleId) ->
    {false, lang:get(<<"不能掠夺自己"/utf8>>)};
plunder(Role = #role{id = RoleId,
		     m_escort = MEscort = #m_escort{five_data = FiveDatas},
		     guild_bag = #guild_bag{id = Gid}},
	TarRoleId = {_, TarRoleSId}) ->
    case check_can_plunder(Role) of
      {false, Msg} -> {false, Msg};
      {ok, PlunderCount} ->
	  {AFormationType, AFormationLev, FightPos,
	   FormationArgs} =
	      formation_lib:combat_formation_info(Role),
	  AttackList1 = combat_lib:gen_fight_objects(Role,
						     FightPos),
	  AttackList = sprite_tree:gen_fight_object(Role) ++
			 hallows_lib:gen_fight_object(Role,
						      maps:get(hallows_id,
							       FormationArgs,
							       0))
			   ++ AttackList1,
	  case cluster_lib:call(TarRoleSId, role_robot, get_role,
				[TarRoleId])
	      of
	    {ok, #role_robot{gid = Gid}} when Gid =/= {0, <<>>} ->
		{false, lang:get(<<"不可掠夺帮友的雇佣兽哦"/utf8>>)};
	    {ok,
	     #role_robot{m_formation =
			     #m_formation{all_lineups = []}}} ->
		{false, lang:get(<<"找不到玩家数据"/utf8>>)};
	    {ok,
	     R = #role_robot{name = TargetName, lev = TarLev,
			     m_formation =
				 #m_formation{use_lineup = Id,
					      all_lineups = AllLine,
					      list = List}}} ->
		#formation_lineup{pos_info = PosInfo,
				  type = BFormationType} =
		    lists:keyfind(Id, #formation_lineup.id, AllLine),
		{_, BFormationLev, _} =
		    list_util:keyfind(BFormationType, 1, List, {1, 1, 0}),
		BFightPos = formation_lib:gen_fight_pos(PosInfo,
							BFormationType),
		{ok, DefListTT} = role_robot:to_fight_objects(R,
							      [{Pos, PId}
							       || #formation_fight_info{fight_pos
											    =
											    Pos,
											id
											    =
											    PId}
								      <- BFightPos,
								  PId > 0]),
		case escort_mgr:cluster_check_can_combat(RoleId,
							 TarRoleId)
		    of
		  {ok, Quality} ->
		      Args = #{on_role_combat_end =>
				   {escort, combat_over,
				    [{plunder, TarRoleId, TarLev, Quality}]},
			       formation =>
				   [{1, AFormationType, AFormationLev},
				    {2, BFormationType, BFormationLev}],
			       ext_args =>
				   [{is_show_panel, false}, {save_replay, true},
				    {save_replay_other_role_ids, [TarRoleId]}],
			       target_role_name => TargetName},
		      case combat_lib:start_combat(Role, 13, AttackList,
						   [DefListTT], Args)
			  of
			{ok, _Pid} ->
			    log:save(join,
				     {Role, <<"功能玩法"/utf8>>, <<"护送掠夺"/utf8>>}),
			    NewFiveDats = lists:keystore(2, 1, FiveDatas,
							 {2, PlunderCount + 1}),
			    Role1 = Role#role{m_escort =
						  MEscort#m_escort{five_data =
								       NewFiveDats}},
			    NewRole = role_trigger:fire(#evt_escort_fight{},
							Role1),
			    base_info(NewRole),
			    {ok, NewRole};
			{false, Msg} ->
			    cluster_lib:cast(TarRoleSId, escort_mgr, info,
					     [{del_combat_role, RoleId,
					       TarRoleId}]),
			    {false, Msg}
		      end;
		  {false, Msg} -> {false, Msg}
		end;
	    _ -> {false, lang:get(<<"找不到玩家数据"/utf8>>)}
	  end
    end.

to_plunder_log_data(#role{guild_bag =
			      #guild_bag{name = GName},
			  m_avatar = #m_avatar{used = AvatarId},
			  partner_bag = #partner_bag{partner_list = Partners},
			  id = RoleId, name = Name, face_id = FaceId, lev = Lev,
			  sex = Sex, power = Power,
			  m_formation =
			      #m_formation{use_lineup = Id,
					   all_lineups = AllLine, list = List}},
		    Award, Quality, ReplayId) ->
    #formation_lineup{pos_info = PosInfo,
		      type = FormationType} =
	lists:keyfind(Id, #formation_lineup.id, AllLine),
    {_, FormationLev, _} = list_util:keyfind(FormationType,
					     1, List, {1, 1, 0}),
    F = fun (#formation_pos{pos = Pos, id = PId}) ->
		case lists:keyfind(PId, #partner.id, Partners) of
		  #partner{bid = Bid, lev = PLev, break_lev = BreakLev,
			   quality = Q, star = Star, power = Power1,
			   all_attr =
			       #attr{speed = Speed, atk = Atk, def = Def,
				     hp_max = HpMax}} ->
		      {true,
		       #escort_pos_info{pos = Pos, id = PId, bid = Bid,
					lev = PLev, break_lev = BreakLev,
					quality = Q, star = Star,
					power = Power1, speed = Speed,
					atk = Atk, def = Def, hp = HpMax}};
		  _ -> false
		end
	end,
    PList = lists:filtermap(F, PosInfo),
    #escort_plunder_log{quality = Quality, rid = RoleId,
			name = Name, guild_name = GName, face = FaceId,
			lev = Lev, sex = Sex, power = Power,
			avatar_id = AvatarId, ret = 2, items = Award,
			time = date:unixtime(), formation_type = FormationType,
			formation_lev = FormationLev, pos_info = PList,
			replay_id = ReplayId}.

to_plunder_log_data(#role{name = Name,
			  guild_bag = #guild_bag{name = GguildName}},
		    RobotId = {_, RobotSId}, Award, Result, Quality,
		    ReplayId) ->
    case cluster_lib:call(RobotSId, role_robot, get_role,
			  [RobotId])
	of
      {ok,
       #role_robot{name = TargetName, gid = Gid, gname = GName,
		   sex = Sex, power = Power, avatar_bid = AvatarId,
		   lev = TarLev, face_id = FaceId}} ->
	  case Quality >= 3 of
	    true ->
		GuildName = case GguildName of
			      <<>> ->
				  {string, {red, lang:get(<<"暂无公会"/utf8>>)}};
			      _ -> {string, {red, GguildName}}
			    end,
		EscortName = escort_data:get_name(Quality),
		NoticeMsg =
		    color:msg(lang:get(<<"大事不好啦！帮友~ts在“萌兽夺宝”中的~ts被玩家[~ts]~ts残忍掠夺！"/utf8>>),
			      [color:format({name, RobotId, TargetName}),
			       color:format({string, {Quality, EscortName}}),
			       color:format(GuildName),
			       color:format({string, {red, Name}})]),
		notice:broadcast(guild, Gid, sys_guild, NoticeMsg);
	    _ -> ok
	  end,
	  #escort_plunder_log{quality = Quality, rid = RobotId,
			      name = TargetName, guild_name = GName,
			      face = FaceId, lev = TarLev, sex = Sex,
			      power = Power, avatar_id = AvatarId, ret = Result,
			      items = Award, time = date:unixtime(),
			      replay_id = ReplayId};
      _ ->
	  #escort_plunder_log{quality = Quality, rid = RobotId,
			      ret = Result, items = Award,
			      time = date:unixtime(), replay_id = ReplayId}
    end.

-spec combat_over(#role{}, #combat_result{}, #combat{},
		  tuple()) -> {ok, #role{}} | ok.

combat_over(Role = #role{id = Id,
			 guild_bag = #guild_bag{name = GName}, name = Name},
	    #combat_result{replay_id = ReplayId,
			   replay_info = ReplayInfo, result = 1},
	    _Combat,
	    {plunder, TarRoleId = {_, TarRoleSId}, TarLev,
	     Quality}) ->
    Award = escort_data:get_plunder_award({Quality,
					   TarLev}),
    GainAward = case is_double() of
		  {true, _} ->
		      [{ItemId, ItemNum * 2} || {ItemId, ItemNum} <- Award];
		  _ -> Award
		end,
    Gain = format:val_to_gain(GainAward, escort_plunder),
    ALogData = to_plunder_log_data(Role, TarRoleId,
				   GainAward, 1, Quality, ReplayId),
    escort_log_mgr:info({add_log, Id, ALogData,
			 #escort_plunder_role.atk_logs}),
    BReplayId = list_util:keyfind(TarRoleSId, ReplayInfo,
				  0),
    BLogData = to_plunder_log_data(Role, Award, Quality,
				   BReplayId),
    cluster_lib:cast(TarRoleSId, escort_log_mgr, info,
		     [{add_log, TarRoleId, BLogData,
		       #escort_plunder_role.def_logs}]),
    RolePid = case role_query:pid(by_id, TarRoleId) of
		{ok, Pid} -> Pid;
		_ -> 0
	      end,
    cluster_lib:cast(TarRoleSId, escort_mgr, info,
		     [{combat_win, Id, TarRoleId, RolePid}]),
    {ok, Role2} = time_check(Role, TarRoleId),
    notice:alert(TarRoleId,
		 util:fbin(lang:get(<<"~ts掠夺了你的雇佣兽！"/utf8>>),
			   [color:format({name, Id, Name})])),
    EscortNameT = escort_data:get_name(Quality),
    EscortName = case Quality == 4 of
		   true -> {string, {orange_2, EscortNameT}};
		   _ -> {string, {Quality, EscortNameT}}
		 end,
    GuildName = case GName of
		  <<>> -> {string, {red, lang:get(<<"暂无公会"/utf8>>)}};
		  _ -> {string, {red, GName}}
		end,
    Content = case Quality >= 4 of
		true ->
		    color:msg(lang:get(<<"尊敬的冒险者，你在“萌兽夺宝”雇佣的~ts被[~ts]~ts残忍掠夺（橙品雇佣兽保护因此无"
					 "损失）,复仇成功可获1.5倍损失奖励！"/utf8>>),
			      [EscortName, GuildName, {string, {red, Name}}]);
		_ ->
		    color:msg(lang:get(<<"尊敬的冒险者，你在“萌兽夺宝”雇佣的~ts被[~ts]~ts残忍掠夺，损失了~ts, "
					 "可通过复仇或请求同盟帮友支援挽回损失，复仇成功可获1.5倍损失奖励，加油！"/utf8>>),
			      [EscortName, GuildName, {string, {red, Name}},
			       {item_order, Award}])
	      end,
    Mail = {lang:get(<<"“萌兽夺宝”被掠夺通知"/utf8>>), Content, [],
	    [], "“萌兽夺宝”被掠夺通知"},
    mail:send(TarRoleId, Mail),
    case role_gain:do(Role2, Gain) of
      {ok, NRole} ->
	  log:log_gain(Gain, Role2, NRole, <<"护送"/utf8>>,
		       util:fbin("掠夺 目标品质:~w  目标等级:~w 目标id:~w",
				 [Quality, TarLev, TarRoleId])),
	  sys_conn:pack_send(24012, {1, GainAward}),
	  {ok, NRole};
      _ -> sys_conn:pack_send(24012, {1, GainAward}), ok
    end;
combat_over(#role{id = Id}, _CombatResult, _Combat,
	    {plunder, TarRoleId = {_, TarRoleSId}, _TarLev,
	     _Quality}) ->
    sys_conn:pack_send(24012, {2, []}),
    cluster_lib:cast(TarRoleSId, escort_mgr, info,
		     [{del_combat_role, Id, TarRoleId}]),
    ok;
combat_over(Role = #role{id = Id, name = Name,
			 pid = RolePid},
	    #combat_result{result = 1}, _Combat,
	    {atk_back, Id, LogId, Items, Name2, RobotId}) ->
    escort_log_mgr:info({atk_back_win, Id, LogId, RolePid}),
    Ridio = escort_data:const(revenge_reward),
    Msg =
	color:msg(lang:get(<<"君子报仇十年未晚，~ts玩家在萌兽夺宝中成功向~ts玩家复仇！"/utf8>>),
		  [{name, Id, Name}, {name, RobotId, Name2}]),
    notice:broadcast(rumor, Msg),
    Award = [{ItemId, util:floor(ItemNum * Ridio * 1.0e-3)}
	     || {ItemId, ItemNum} <- Items],
    GainAward = case is_double() of
		  {true, _} ->
		      [{ItemId, ItemNum * 2} || {ItemId, ItemNum} <- Award];
		  _ -> Award
		end,
    Gain = format:val_to_gain(GainAward, atk_back),
    case role_gain:do(Role, Gain) of
      {ok, NRole} ->
	  log:log_gain(Gain, Role, NRole, <<"护送"/utf8>>,
		       util:fbin("反击 日志id:~w", [LogId])),
	  sys_conn:pack_send(24012, {1, GainAward}),
	  {ok, NRole};
      _ -> sys_conn:pack_send(24012, {1, GainAward}), ok
    end;
combat_over(Role = #role{id = Id, name = Name},
	    #combat_result{result = 1}, _Combat,
	    {atk_back, TarRoleId = {_, TarRoleSId}, LogId, ItemsT,
	     _N, _RobotId}) ->
    RolePid = case role_query:local_pid(by_id, TarRoleId) of
		{ok, Pid} -> Pid;
		_ -> 0
	      end,
    escort_log_mgr:info({atk_back_win, TarRoleId, LogId,
			 RolePid}),
    Items = case is_double() of
	      {true, _} ->
		  [{ItemId, ItemNum * 2} || {ItemId, ItemNum} <- ItemsT];
	      _ -> ItemsT
	    end,
    MailRidio = escort_data:const(help_reward),
    MailList = [{ItemId,
		 util:floor(ItemNum * MailRidio * 1.0e-3)}
		|| {ItemId, ItemNum} <- Items],
    Content =
	color:msg(lang:get(<<"不幸中的万幸，你在”萌兽夺宝“遭遇的掠夺者已被~ts玩家击退，这是击退掠夺者后留下的奖励！"/utf8>>),
		  [{name, Id, Name}]),
    {MailAssets, MailItems} =
	format:split_assets_items(MailList),
    Mail = {lang:get(<<"“萌兽夺宝”帮助奖励"/utf8>>), Content,
	    MailAssets, MailItems, "“萌兽夺宝”帮助奖励"},
    mail:send(TarRoleId, Mail),
    Name2 = case cluster_lib:call(TarRoleSId, role_robot,
				  get_role, [TarRoleId])
		of
	      {ok, #role_robot{name = NameT}} -> NameT;
	      _ -> <<>>
	    end,
    Msg =
	color:msg(lang:get(<<"~ts在萌兽夺宝中帮助~ts击退掠夺者，挽回了损失，真是热心又强大的战士！"/utf8>>),
		  [{name, Id, Name}, {name, TarRoleId, Name2}]),
    notice:broadcast(rumor, Msg),
    Ridio = escort_data:const(request_reward),
    Award = [{ItemId, util:floor(ItemNum * Ridio * 1.0e-3)}
	     || {ItemId, ItemNum} <- Items],
    Gain = format:val_to_gain(Award, atk_back),
    case role_gain:do(Role, Gain) of
      {ok, NRole} ->
	  log:log_gain(Gain, Role, NRole, <<"护送"/utf8>>,
		       util:fbin("帮助 日志id:~w", [LogId])),
	  sys_conn:pack_send(24012, {1, Award}),
	  {ok, NRole};
      _ -> sys_conn:pack_send(24012, {1, Award}), ok
    end;
combat_over(#role{id = Id, pid = RolePid},
	    _CombatResult, _Combat,
	    {atk_back, Id, LogId, _Items, _Name, _RobotId}) ->
    escort_log_mgr:info({atk_back_loss, Id, LogId,
			 RolePid}),
    sys_conn:pack_send(24012, {2, []}),
    ok;
combat_over(#role{}, _CombatResult, _Combat,
	    {atk_back, TarRoleId, LogId, _Items, _Name,
	     _RobotId}) ->
    escort_log_mgr:info({del_combat_role, TarRoleId,
			 LogId}),
    sys_conn:pack_send(24012, {2, []}),
    ok.

check_can_plunder(Role = #role{m_escort =
				   #m_escort{five_data = FiveDatas}}) ->
    PlunderCount = list_util:keyfind(2, FiveDatas, 0),
    case PlunderCount >= escort_data:const(plunder_time) of
      true -> {false, lang:get(<<"掠夺次数为0，请明天再来吧！"/utf8>>)};
      _ ->
	  OpenCond = escort_data:const(open_lev),
	  case role_misc:check_open_cond(OpenCond, Role) of
	    {false, Msg} -> {false, Msg};
	    _ -> {ok, PlunderCount}
	  end
    end.

-spec get_push_log_info(role_id(), pos_integer(),
			pos_integer()) -> tuple().

get_push_log_info(TarRoleid, LogId, Type) ->
    case get_log_info(TarRoleid, LogId) of
      {false, Msg} -> {false, Msg};
      #escort_plunder_log{quality = Quality, name = Name,
			  avatar_id = AvatarId, lev = LevT, guild_name = GName,
			  face = Face, power = Power, formation_type = FType,
			  formation_lev = FLev, pos_info = PList} ->
	  PushPosInfo = [{Pos, Bid, Lev, Q, Star,
			  min(BreakLev,
			      partner_data:get_constant(break_max_times))}
			 || #escort_pos_info{pos = Pos, bid = Bid, lev = Lev,
					     quality = Q, star = Star,
					     break_lev = BreakLev}
				<- PList],
	  {ok,
	   {Quality, LogId, Type, TarRoleid, Name, LevT, Face,
	    AvatarId, Power, GName, FType, FLev, PushPosInfo}}
    end.

get_log_info(TarRoleid, LogId) ->
    Logs = escort_log_mgr:get_log(TarRoleid,
				  #escort_plunder_role.def_logs),
    case lists:keyfind(LogId, #escort_plunder_log.id, Logs)
	of
      Log = #escort_plunder_log{} -> Log;
      _ -> {false, lang:get(<<"该掠夺信息已过期"/utf8>>)}
    end.

check_can_atk_back(Role = #role{id = TarRoleId,
				m_escort = #m_escort{five_data = FiveDatas}},
		   TarRoleId) ->
    Count = list_util:keyfind(3, FiveDatas, 0),
    case Count >= escort_data:const(revenge_time) of
      true -> {false, lang:get(<<"复仇次数为0，请明天再来吧！"/utf8>>)};
      _ ->
	  OpenCond = escort_data:const(open_lev),
	  case role_misc:check_open_cond(OpenCond, Role) of
	    {false, Msg} -> {false, Msg};
	    _ -> {ok, Count}
	  end
    end;
check_can_atk_back(Role = #role{m_escort =
				    #m_escort{five_data = FiveDatas}},
		   _TarRoleId) ->
    Count = list_util:keyfind(5, FiveDatas, 0),
    case Count >= escort_data:const(help_time) of
      true -> {false, lang:get(<<"帮助次数为0，请明天再来吧！"/utf8>>)};
      _ ->
	  OpenCond = escort_data:const(open_lev),
	  case role_misc:check_open_cond(OpenCond, Role) of
	    {false, Msg} -> {false, Msg};
	    _ -> {ok, Count}
	  end
    end.

-spec atk_back(#role{}, role_id(),
	       pos_integer()) -> {ok, #role{}} | {false, binary()}.

atk_back(Role = #role{id = RoleId,
		      m_escort = MEscort = #m_escort{five_data = FiveDatas}},
	 TarRoleId, LogId) ->
    case check_can_atk_back(Role, TarRoleId) of
      {ok, Count} ->
	  case catch escort_log_mgr:call({can_atk_back, RoleId,
					  TarRoleId, LogId})
	      of
	    {ok, #escort_plunder_log{rid = RoleId}} ->
		escort_log_mgr:info({del_combat_role, TarRoleId,
				     LogId}),
		{false, lang:get(<<"不能打自己"/utf8>>)};
	    {ok,
	     #escort_plunder_log{rid = RobotId = {_, RobotSId},
				 items = Items, name = Name, pos_info = PosInfo,
				 formation_type = BFormationType,
				 formation_lev = BFormationLev}} ->
		case cluster_lib:call(RobotSId, role_robot, get_role,
				      [RobotId])
		    of
		  {ok, Robot} ->
		      {AFormationType, AFormationLev, FightPos,
		       FormationArgs} =
			  formation_lib:combat_formation_info(Role),
		      AttackList1 = combat_lib:gen_fight_objects(Role,
								 FightPos),
		      AttackList = sprite_tree:gen_fight_object(Role) ++
				     hallows_lib:gen_fight_object(Role,
								  maps:get(hallows_id,
									   FormationArgs,
									   0))
				       ++ AttackList1,
		      DefGroup = [gen_fight_object_(P, BFormationType, Robot,
						    Role)
				  || P <- PosInfo],
		      Args = #{on_role_combat_end =>
				   {escort, combat_over,
				    [{atk_back, TarRoleId, LogId, Items, Name,
				      RobotId}]},
			       ext_args => [{is_show_panel, false}],
			       formation =>
				   [{1, AFormationType, AFormationLev},
				    {2, BFormationType, BFormationLev}],
			       target_role_name => Name},
		      case combat_lib:start_combat(Role, 13, AttackList,
						   [DefGroup], Args)
			  of
			{ok, _Pid} ->
			    log:save(join,
				     {Role, <<"功能玩法"/utf8>>,
				      <<"护送掠夺反击"/utf8>>}),
			    NewFiveDatas = case RoleId == TarRoleId of
					     true ->
						 lists:keystore(3, 1, FiveDatas,
								{3, Count + 1});
					     _ ->
						 lists:keystore(5, 1, FiveDatas,
								{5, Count + 1})
					   end,
			    NewRole = Role#role{id = RoleId,
						m_escort =
						    MEscort#m_escort{five_data =
									 NewFiveDatas}},
			    base_info(NewRole),
			    {ok, NewRole};
			{false, Msg} ->
			    escort_log_mgr:info({del_combat_role, TarRoleId,
						 LogId}),
			    {false, Msg}
		      end;
		  _ ->
		      escort_log_mgr:info({del_combat_role, TarRoleId,
					   LogId}),
		      {false, lang:get(<<"找不到该玩家数据"/utf8>>)}
		end;
	    {false, Msg} -> {false, Msg};
	    _ -> {false, lang:get(<<"请求超时"/utf8>>)}
	  end;
      {false, Msg} -> {false, Msg}
    end.

gen_fight_object_(#escort_pos_info{pos = Pos, id = PId,
				   bid = Bid, lev = Lev, star = Star,
				   quality = Quality, speed = Speed, atk = Atk,
				   def = Def, hp = Hp, break_lev = BreakLevT},
		  FormationType,
		  #role_robot{id = RoleId, partners = Partners,
			      name = Name},
		  Role) ->
    BreakLev = min(BreakLevT,
		   partner_data:get_constant(break_max_times)),
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
					       {__Pidescort765, _,
						{__Levelescort765,
						 __Tracesescort765}}
						   when __Levelescort765 band 64
							  /= 0
							  orelse
							  __Tracesescort765 /=
							    [] ->
						   lager:do_log(info,
								[{module,
								  escort},
								 {function,
								  gen_fight_object_},
								 {line, 765},
								 {pid,
								  pid_to_list(self())},
								 {node, node()}
								 | lager:md()],
								io_lib:format("玩家[~ts]伙伴已不存在:~w",
									      [Name,
									       Bid]),
								none, 4096, 64,
								__Levelescort765,
								__Tracesescort765,
								lager_event,
								__Pidescort765);
					       _ -> ok
					     end,
					     BaseData = #partner_base_data{} =
							    partner_data:get_base(Bid),
					     P0 = partner:init_partner(Role,
								       BaseData,
								       PId),
					     partner_lib:calc_attr(Role,
								   P0#partner{lev
										  =
										  Lev,
									      star
										  =
										  Star,
									      quality
										  =
										  Quality,
									      break_lev
										  =
										  BreakLev})
				       end,
    P1 = P#partner{all_attr =
		       AllAttr#attr{speed = Speed, atk = Atk, def = Def,
				    hp = Hp, hp_max = Hp},
		   lev = Lev, star = Star, quality = Quality,
		   break_lev = BreakLev},
    FO1 = partner_lib:gen_fight_object(RoleId, 0, P1,
				       combat_lib:is_leader(Pos), RoleId, 1),
    #formation_data{pos = FightPosList} =
	formation_data:get_formation(FormationType),
    FightPos = list_util:keyfind(Pos, FightPosList),
    FO1#fight_object{pos = FightPos}.

-spec atk_back_help(#role{}, pos_integer()) -> {false,
						binary()} |
					       {ok, #role{}}.

atk_back_help(#role{guild_bag =
			#guild_bag{id = {0, <<>>}}},
	      _LogId) ->
    {false, lang:get(<<"未加入公会不可发送求助哦！"/utf8>>)};
atk_back_help(Role = #role{id = {Rid, Sid},
			   pid = RolePid, name = Name,
			   m_escort =
			       MEscort = #m_escort{five_data = FiveDatas}},
	      LogId) ->
    Now = date:unixtime(),
    HelpCount = list_util:keyfind(4, FiveDatas, 0),
    case HelpCount >= escort_data:const(request_time) of
      true -> {false, lang:get(<<"今日求助次数已用完"/utf8>>)};
      _ ->
	  case get_log_info({Rid, Sid}, LogId) of
	    {false, Msg} -> {false, Msg};
	    #escort_plunder_log{atk_ret = 0, help_time = HelpTime}
		when Now < HelpTime ->
		{false, lang:get(<<"求助冷却时间未结束"/utf8>>)};
	    #escort_plunder_log{atk_ret = 1} ->
		{false, lang:get(<<"已成功复仇, 无需求助"/utf8>>)};
	    #escort_plunder_log{help_time = HelpTime}
		when Now >= HelpTime ->
		NoticeMsg2 =
		    color:msg(lang:get(<<"帮友~ts在萌兽夺宝玩法中遭到掠夺，现向大家请求帮助击败掠夺者，击败后可获得奖励！~ts"/utf8>>),
			      [{name, {Rid, Sid}, Name},
			       {href,
				{33, green, [Rid, Sid, LogId],
				 lang:get(<<"【我要帮助他】"/utf8>>)}}]),
		case say:speak(Role,
			       #{from => sys, channel => 4, len => 0,
				 msg => NoticeMsg2})
		    of
		  {false, Msg1} -> {false, Msg1};
		  {false, Msg2, _} -> {false, Msg2};
		  _ ->
		      NewFiveDatas = lists:keystore(4, 1, FiveDatas,
						    {4, HelpCount + 1}),
		      NewRole = Role#role{m_escort =
					      MEscort#m_escort{five_data =
								   NewFiveDatas}},
		      base_info(NewRole),
		      escort_log_mgr:info({do_help, {Rid, Sid}, LogId,
					   RolePid}),
		      {ok, NewRole}
		end
	  end
    end.

-spec ref_log(#role{}, pos_integer()) -> ok.

ref_log(#role{id = Id}, LogId) ->
    case get_log_info(Id, LogId) of
      Log = #escort_plunder_log{} ->
	  sys_conn:pack_send(24018, {Log}), ok;
      _ -> ok
    end.


