-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      1).

-module(arena_cluster_champion_mgr).

-lager_records([{cluster_dynamic_local_group,
		 [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
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
		{sky_ladder_result,
		 [result, id, def_name, def_lev, def_face,
		  def_change_rank, def_rank, def_old_rank,
		  is_change_best_rank, atk_change_rank, atk_rank,
		  atk_old_rank, atk_cont_win, reward,
		  def_face_update_time, def_face_file]},
		{sky_ladder_highlight,
		 [id, atk_id, atk_name, atk_face, atk_rank, def_id,
		  def_name, def_face, def_rank, ret, replay_id, time,
		  atk_face_update_time, atk_face_file,
		  def_face_update_time, def_face_file]},
		{sky_ladder_pk_log,
		 [id, rid, name, lev, sex, face, avatar_id, power,
		  atk_power, enemy_old_rank, old_rank, type, ret,
		  replay_id, rank_type, rank, time, face_update_time,
		  face_file]},
		{sky_ladder_role_log,
		 [id, name, face, logs, face_update_time, face_file]},
		{sky_ladder_rank,
		 [rank, id, is_fight, fight_rid, fight_pid]},
		{sky_ladder_role,
		 [id, name, vip, lev, sex, gid, gname, face, power,
		  max_power, lookid, rank, best_rank, time, avatar_id,
		  robot_unit, cont_win, face_update_time, face_file]},
		{sky_ladder_f_pos,
		 [pos, id, bid, lev, use_skin, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, is_robot]},
		{sky_ladder_f,
		 [id, name, gname, idx, lev, vip_lev, sex, face, power,
		  rank, formation_type, formation_lev, hallows_id,
		  pos_info, robot_id, avatar_id, look, face_update_time,
		  face_file]},
		{m_sky_ladder,
		 [ver, ref_time, combat_time, ref_list, best_rank,
		  can_combat_num, had_combat_num, buy_combat_num,
		  acc_combat_num, first_reward, next_reset_nine, worship,
		  worship_list, season_idx, merge_index, now_combat_num]},
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
		{getui_msg, [id, name, timeout, ext]},
		{getui_role, [id, getui_cid, package_name, os_name]},
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
		{role_feedback_info,
		 [role_id, id, state, status2, start_time, end_msg_time,
		  finish_time, score_time, title, content,
		  questions_lists, answer_lists, score]},
		{feedback,
		 [sess, rid, feedback_id, status, score, send_time,
		  time_out]},
		{gmail,
		 [id, type, mail_type, subject, content, assets, items,
		  start_time, end_time, conds, source, can_del]},
		{mail,
		 [sess, to, to_name, from, from_name, type, group_id,
		  status, subject, content, assets, items, source, rev_ts,
		  read_time, send_time, time_out, can_del]},
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
		{m_look, [use_id, list]},
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
		{champion_result, [id, rank, cnum, win]},
		{champion_pk,
		 [id, step, round, group, score, is_guess, a_pos, a_id,
		  a_name, a_lev, a_gid, a_gname, a_face, a_avatar_id,
		  a_sex, a_plist, a_bet, a_power, a_max_power, a_robot_id,
		  a_formation_type, a_formation_lev, a_time, b_pos, b_id,
		  b_name, b_lev, b_gid, b_gname, b_face, b_avatar_id,
		  b_sex, b_plist, b_bet, b_power, b_max_power,
		  b_formation_type, b_formation_lev, b_robot_id, b_time,
		  ret, replay_id, diff_power, pk_rlist, a_sprite_lev,
		  a_sprites, b_sprite_lev, b_sprites, a_face_update_time,
		  a_face_file, b_face_update_time, b_face_file]},
		{champion_role_log, [id, logs]},
		{champion_bet_log, [id, rid, target, bet, get_bet]},
		{champion_bet, [id, bet, logs]},
		{champion_32_pk,
		 [pos, id, name, lev, face, sex, max_power, ret,
		  replay_id, face_update_time, face_file]},
		{arena_champion_rank,
		 [rank, id, old_rank, score, score_32]},
		{arena_champion_role,
		 [id, name, lev, sex, gid, gname, face, max_power, power,
		  lookid, old_rank, old_score, score, score_32, rank,
		  avatar_id, robot_id, group, group32, combat_num, win,
		  lose, time, face_update_time, face_file, match_id]},
		{champion_state,
		 [round, round_status, step, step_status,
		  step_status_time, state_start_time, state_end_time,
		  season_start_time, season_end_time]},
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

-behaviour(gen_fsm).

-export([m/0, info/1, cast/1, call/1, apply/1,
	 start_link/0]).

-export([sync_role/2, extract_join_role/0,
	 async_fun_combat_over/5, do_update_pk_info/1,
	 notice_msg/2, calc_bet_ratio/2, zero_update/0,
	 apply_pre_load_combat_fighter/1,
	 update_combat_fighter/1]).

-export([init/1, handle_event/3, handle_sync_event/4,
	 handle_info/3, terminate/3, code_change/4]).

-export([idle/2]).

-export([score_notice/2, score_ready/2, score_ready2/2,
	 score_guess/2, score_fight/2]).

-export([champion_ready/2, champion_ready2/2,
	 champion_guess/2, champion_fight/2, champion_end/2]).

-export([cluster_cast/3]).

-export([cluster_call/3]).

-export([gm_open/0, gm_set_srv_id/0, gm_set_open/0]).

-export([gm_get_all_robot_star/0]).

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

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      39).

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

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      40).

-file("inc/arena_champion.hrl", 1).

-record(champion_state,
	{round = 0, round_status = 0, step = 0, step_status = 0,
	 step_status_time = 0, state_start_time = 0,
	 state_end_time = 0, season_start_time = 0,
	 season_end_time = 0}).

-record(arena_champion_role,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, max_power = 0,
	 power = 0, lookid = 0, old_rank = 0, old_score = 0,
	 score = 0, score_32 = 0, rank = 0, avatar_id = 0,
	 robot_id = 0, group = 0, group32 = 0, combat_num = 0,
	 win = 0, lose = 0, time = 0, face_update_time = 0,
	 face_file = <<>>, match_id = {0, <<>>}}).

-record(arena_champion_rank,
	{rank = 0, id = {0, <<>>}, old_rank = 0, score = 0,
	 score_32 = 0}).

-record(champion_32_pk,
	{pos = 0, id = {0, <<>>}, name = <<>>, lev = 0,
	 face = 0, sex = 0, max_power = 0, ret = 0,
	 replay_id = 0, face_update_time = 0, face_file = <<>>}).

-record(champion_bet,
	{id = {0, <<>>}, bet = 0, logs = []}).

-record(champion_bet_log,
	{id = 0, rid = {0, <<>>}, target = 1, bet = 0,
	 get_bet = 0}).

-record(champion_role_log, {id = {0, <<>>}, logs = []}).

-record(champion_pk,
	{id = 0, step = 0, round = 0, group = 0, score = 0,
	 is_guess = 1, a_pos = 0, a_id = {0, <<>>},
	 a_name = <<>>, a_lev = 0, a_gid = {0, <<>>},
	 a_gname = <<>>, a_face = 0, a_avatar_id = 0, a_sex = 0,
	 a_plist = [], a_bet = 0, a_power = 0, a_max_power = 0,
	 a_robot_id = 0, a_formation_type = 1,
	 a_formation_lev = 1, a_time = 0, b_pos = 0,
	 b_id = {0, <<>>}, b_name = <<>>, b_lev = 0,
	 b_gid = {0, <<>>}, b_gname = <<>>, b_face = 0,
	 b_avatar_id = 0, b_sex = 0, b_plist = [], b_bet = 0,
	 b_power = 0, b_max_power = 0, b_formation_type = 1,
	 b_formation_lev = 1, b_robot_id = 0, b_time = 0,
	 ret = 0, replay_id = 0, diff_power = 0, pk_rlist = [],
	 a_sprite_lev = 0, a_sprites = [], b_sprite_lev = 0,
	 b_sprites = [], a_face_update_time = 0,
	 a_face_file = <<>>, b_face_update_time = 0,
	 b_face_file = <<>>}).

-record(champion_result,
	{id = {0, <<>>}, rank = 0, cnum = 0, win = 0}).

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      41).

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

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      42).

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

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      43).

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

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      44).

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

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      45).

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

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      46).

-file("inc/looks.hrl", 1).

-record(m_look, {use_id = 0, list = []}).

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      47).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      48).

-file("inc/log.hrl", 1).

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      49).

-file("inc/mail.hrl", 1).

-record(mail,
	{sess  :: {pos_integer(), bitstring()},
	 to  :: {pos_integer(), bitstring()},
	 to_name = <<>>  :: bitstring(),
	 from  :: {non_neg_integer(), bitstring()},
	 from_name = <<>>  :: bitstring(), type = 1  :: 0..1,
	 group_id = 0  :: non_neg_integer(), status = 0  :: 0..1,
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 source = <<>>  :: pos_integer(),
	 rev_ts = 0  :: pos_integer(),
	 read_time = 0  :: pos_integer(),
	 send_time = 0  :: pos_integer(),
	 time_out = 0  :: pos_integer(), can_del = 1  :: 0..1}).

-record(gmail,
	{id = 0, type = 0  :: non_neg_integer(),
	 mail_type = 1  :: non_neg_integer(),
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 conds = []  :: list(), source = <<>>  :: pos_integer(),
	 can_del = 1  :: 0..1}).

-record(feedback,
	{sess, rid, feedback_id = 0, status = 0, score = 0,
	 send_time = 0, time_out = 0}).

-record(role_feedback_info,
	{role_id, id = 0, state = 0, status2 = 0,
	 start_time = 0, end_msg_time = 0, finish_time = 0,
	 score_time = 0, title = <<>>, content = <<>>,
	 questions_lists = [], answer_lists = [], score = 0}).

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      50).

-file("inc/game_assets.hrl", 1).

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      51).

-file("inc/partner.hrl", 1).

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      52).

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

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      53).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      54).

-file("inc/getui.hrl", 1).

-record(getui_role,
	{id = {0, <<>>}, getui_cid = <<>>, package_name = <<>>,
	 os_name = <<>>}).

-record(getui_msg,
	{id = {{0, <<>>}, 0}, name = <<>>, timeout = 0,
	 ext = []}).

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      55).

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

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      56).

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

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      57).

-file("inc/sky_ladder.hrl", 1).

-record(m_sky_ladder,
	{ver = 2, ref_time = 0, combat_time = 0, ref_list = [],
	 best_rank = 0,
	 can_combat_num = sky_ladder_data:get_const(join_times),
	 had_combat_num = 0, buy_combat_num = 0,
	 acc_combat_num = 0, first_reward = [],
	 next_reset_nine = 0, worship = 0, worship_list = [],
	 season_idx = 0, merge_index = 0, now_combat_num = 0}).

-record(sky_ladder_f,
	{id = {0, <<>>}, name = <<>>, gname = <<>>, idx = 0,
	 lev = 0, vip_lev = 0, sex = 0, face = 0, power = 0,
	 rank = 0, formation_type = 0, formation_lev = 0,
	 hallows_id = 0, pos_info = [], robot_id = 0,
	 avatar_id = 0, look = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(sky_ladder_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, use_skin = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, is_robot = 0}).

-record(sky_ladder_role,
	{id = {0, <<>>}, name = <<>>, vip = 0, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, rank = 0, best_rank = 0,
	 time = 0, avatar_id = 0, robot_unit = 0, cont_win = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(sky_ladder_rank,
	{rank = 0, id = {0, <<>>}, is_fight = 0,
	 fight_rid = {0, <<>>}, fight_pid = 0}).

-record(sky_ladder_role_log,
	{id = {0, <<>>}, name = <<>>, face = 0, logs = [],
	 face_update_time = 0, face_file = <<>>}).

-record(sky_ladder_pk_log,
	{id = 0, rid = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, avatar_id = 0, power = 0, atk_power = 0,
	 enemy_old_rank = 0, old_rank = 0, type = 1, ret = 1,
	 replay_id = 0, rank_type = 0, rank = 0, time = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(sky_ladder_highlight,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_rank = 0, def_id = {0, <<>>},
	 def_name = <<>>, def_face = 0, def_rank = 0, ret = 1,
	 replay_id = 0, time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(sky_ladder_result,
	{result = 0, id = {0, <<>>}, def_name = <<>>,
	 def_lev = 0, def_face = 0, def_change_rank = 0,
	 def_rank = 0, def_old_rank = 0, is_change_best_rank = 0,
	 atk_change_rank = 0, atk_rank = 0, atk_old_rank = 0,
	 atk_cont_win = 0, reward = [], def_face_update_time = 0,
	 def_face_file = <<>>}).

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      58).

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

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      59).

-file("inc/cluster_dynamic_group.hrl", 1).

-record(cluster_dynamic_group,
	{id = {1, <<>>}, min_world_lev = 0, group_lev = 0,
	 mode = 1, list = [], srv_num = 0, time = 0}).

-record(cluster_dynamic_srv,
	{id = {1, <<>>}, name = <<>>, main_srv = <<>>,
	 list = [], mode = 1, group_lev = 0, init_world_lev = 0,
	 world_lev = 0, open_time = 0, time = 0}).

-record(cluster_dynamic_local_group,
	{type = 0, main, list = []}).

-file("src/mod/arena_cluster_champion/arena_cluster_"
      "champion_mgr.erl",
      60).

gm_get_all_robot_star() ->
    L = ets:tab2list(arena_cluster_champion_formation_info),
    L2 = lists:flatten([[Star || #{star := Star} <- PList]
			|| {RoleId, FormationType, FormationLev, PList,
			    SpriteLev, Sprites}
			       <- L]),
    Fun = fun (Star, Acc) ->
		  case Star =< 5 of
		    true ->
			OldStar = list_util:keyfind(Star, Acc, 0),
			lists:keystore(Star, 1, Acc, {Star, OldStar + 1});
		    _ -> Acc
		  end
	  end,
    lists:foldl(Fun, [], L2).

gm_open() ->
    case is_open() andalso sky_ladder_mgr:check_open() of
      true -> m();
      _ -> skip
    end.

gm_set_srv_id() ->
    case is_open() andalso sky_ladder_mgr:check_open() of
      true ->
	  Sid = sys_lib:srv_id(),
	  sys_env:save(arena_cluster_champion_srv_id, Sid),
	  cluster_dynamic_group:group_other_cast(1, sys_env, save,
						 [arena_cluster_champion_srv_id,
						  Sid]);
      _ -> skip
    end.

gm_set_open() ->
    case is_open() andalso sky_ladder_mgr:check_open() of
      true -> info(gm_init_season);
      _ -> skip
    end.

cluster_cast(M, F, A) ->
    Sid = sys_env:get(arena_cluster_champion_srv_id,
		      cluster_dynamic_group:group_main_srvid(1)),
    Flag = get_merge_status(),
    case Sid of
      _ when Flag -> apply(M, F, A);
      undefined -> apply(M, F, A);
      _ -> cluster_lib:cast(Sid, M, F, A)
    end.

cluster_call(M, F, A) ->
    Sid = sys_env:get(arena_cluster_champion_srv_id,
		      cluster_dynamic_group:group_main_srvid(1)),
    Flag = get_merge_status(),
    case Sid of
      _ when Flag -> apply(M, F, A);
      undefined -> apply(M, F, A);
      _ -> cluster_lib:call(Sid, M, F, A)
    end.

check_sky_roles() ->
    RoleNum = sky_ladder_lib:get_role_rank_num(),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr122, _,
       {__Levelarena_cluster_champion_mgr122,
	__Tracesarena_cluster_champion_mgr122}}
	  when __Levelarena_cluster_champion_mgr122 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr122 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, check_sky_roles}, {line, 122},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("周冠军赛天梯人数判断:~w", [RoleNum]), none, 4096,
		       64, __Levelarena_cluster_champion_mgr122,
		       __Tracesarena_cluster_champion_mgr122, lager_event,
		       __Pidarena_cluster_champion_mgr122);
      _ -> ok
    end,
    RoleNum >=
      arena_cluster_champion_data:get_const(open_number_limit).

-spec calc_bet_ratio(non_neg_integer(),
		     non_neg_integer()) -> non_neg_integer().

calc_bet_ratio(Val, Val) -> 1750;
calc_bet_ratio(Val1, Val2) when Val1 > Val2 ->
    round((2 - Val1 / (Val1 + Val2) * 5.0e-1) * 1000);
calc_bet_ratio(Val1, Val2) ->
    round((1.5 + Val2 / (Val1 + Val2) * 5.0e-1) * 1000).

-spec sync_role(#role{}, atom()) -> ok.

sync_role(Role = #role{id = RoleId}, Flag) ->
    case cluster_call(ets, member,
		      [arena_cluster_champion_role, RoleId])
	of
      true -> sync_role_(Role, Flag);
      _ -> skip
    end,
    ok.

sync_role_(Role = #role{id = RoleId,
			max_power = MaxPower, arena_max_power = ArenaMaxPower},
	   power) ->
    Power = formation:get_sys_formation_power(Role, 6),
    L = [{#arena_champion_role.power, Power},
	 {#arena_champion_role.max_power,
	  lists:max([Power, MaxPower, ArenaMaxPower])},
	 {#arena_champion_role.time, date:unixtime()}],
    cluster_cast(ets, update_element,
		 [arena_cluster_champion_role, RoleId, L]);
sync_role_(Role = #role{id = RoleId, lev = Lev,
			name = Name, face_id = FaceId,
			guild_bag = #guild_bag{id = Gid, name = GName},
			m_look = #m_look{use_id = LookId},
			m_avatar = #m_avatar{used = AvatarId},
			max_power = MaxPower, arena_max_power = ArenaMaxPower},
	   _Flag) ->
    Power = formation:get_sys_formation_power(Role, 6),
    {_, FaceFile, FaceUpdateTime} =
	role_face:face_info(Role),
    L = [{#arena_champion_role.lev, Lev},
	 {#arena_champion_role.name, Name},
	 {#arena_champion_role.power, Power},
	 {#arena_champion_role.face, FaceId},
	 {#arena_champion_role.gid, Gid},
	 {#arena_champion_role.gname, GName},
	 {#arena_champion_role.lookid, LookId},
	 {#arena_champion_role.avatar_id, AvatarId},
	 {#arena_champion_role.max_power,
	  max(Power, max(MaxPower, ArenaMaxPower))},
	 {#arena_champion_role.time, date:unixtime()},
	 {#arena_champion_role.face_update_time, FaceUpdateTime},
	 {#arena_champion_role.face_file, FaceFile}],
    cluster_cast(ets, update_element,
		 [arena_cluster_champion_role, RoleId, L]).

-spec extract_join_role() -> ok.

extract_join_role() ->
    [combat_replay_mgr:dec_replay_reference(ReplayId)
     || {ReplayId}
	    <- ets:tab2list(arena_cluster_champion_replay)],
    d_ets_lib:clear_d_ets(arena_cluster_champion_replay),
    d_ets_lib:clear_d_ets(arena_cluster_champion_role),
    d_ets_lib:clear_d_ets(arena_cluster_champion_bet),
    d_ets_lib:clear_d_ets(arena_cluster_champion_pk),
    ets:delete_all_objects(arena_cluster_champion_rank),
    do_extract_join_role(1),
    info({notify_score_start}).

do_extract_join_role(Rank) when Rank =< 256 ->
    case sky_ladder_lib:rank_role(Rank) of
      {ok,
       SkyRole = #sky_ladder_role{id = Id, face = Face,
				  name = Name, lev = Lev, robot_unit = RobotId}}
	  when RobotId > 0 ->
	  put(arena_cluster_sky_robot,
	      [{Rank, Name, Lev, Face}
	       | util:get(arena_cluster_sky_robot, [])]),
	  do_extract_join_role(Rank + 1);
      {ok, SkyRole = #sky_ladder_role{id = Id}} ->
	  Score = arena_cluster_champion_data:get_score(Rank),
	  ChampionRole = to_champion_role(SkyRole, Rank),
	  d_ets_lib:save_ets(arena_cluster_champion_role,
			     ChampionRole),
	  ets:insert(arena_cluster_champion_rank,
		     #arena_champion_rank{rank = Rank, old_rank = Rank,
					  id = Id, score = Score}),
	  role_lib:cast(by_id, Id,
			{arena_cluster_champion_mgr, sync_role, [all]}),
	  do_extract_join_role(Rank + 1);
      _ -> ok
    end;
do_extract_join_role(_Rank) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr185, _,
       {__Levelarena_cluster_champion_mgr185,
	__Tracesarena_cluster_champion_mgr185}}
	  when __Levelarena_cluster_champion_mgr185 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr185 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, do_extract_join_role}, {line, 185},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("参与人数:~w",
				     [ets:info(arena_cluster_champion_role,
					       size)]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr185,
		       __Tracesarena_cluster_champion_mgr185, lager_event,
		       __Pidarena_cluster_champion_mgr185);
      _ -> ok
    end,
    case erase(arena_cluster_sky_robot) of
      L = [_ | _] ->
	  List = ets:tab2list(arena_cluster_champion_role),
	  BasePower = case
			lists:keysort(#arena_champion_role.max_power, List)
			  of
			[#arena_champion_role{max_power = MaxPower} | _] ->
			    MaxPower;
			_ -> arena_cluster_champion_data:get_const(base_power)
		      end,
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr194, _,
	     {__Levelarena_cluster_champion_mgr194,
	      __Tracesarena_cluster_champion_mgr194}}
		when __Levelarena_cluster_champion_mgr194 band 64 /= 0
		       orelse __Tracesarena_cluster_champion_mgr194 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_champion_mgr},
			      {function, do_extract_join_role}, {line, 194},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("补充机器人参与人数:~w", [length(L)]), none,
			     4096, 64, __Levelarena_cluster_champion_mgr194,
			     __Tracesarena_cluster_champion_mgr194, lager_event,
			     __Pidarena_cluster_champion_mgr194);
	    _ -> ok
	  end,
	  RobotType =
	      arena_cluster_champion_data:get_robot_type(BasePower),
	  [init_rank_robot(Rank, BasePower, Lev, Name, Face,
			   RobotType)
	   || {Rank, Name, Lev, Face} <- L],
	  ok;
      _ -> ok
    end.

init_rank_robot(Rank, BasePower, BaseLev, Name, Face,
		RobotType) ->
    case arena_cluster_champion_data:get_robot({RobotType,
						Rank})
	of
      Data = #{robot := _RobotIds,
	       robot_power := _RobotPowers, robot_lev := _RobotLevs,
	       score := Score} ->
	  BaseScore = arena_cluster_champion_data:get_score(Rank),
	  R1 = gen_robot_champion_role(Data, BasePower, BaseLev,
				       Rank, Rank, max(0, BaseScore)),
	  R = R1#arena_champion_role{name = Name, face = Face,
				     lev = BaseLev},
	  d_ets_lib:save_ets(arena_cluster_champion_role, R),
	  ets:insert(arena_cluster_champion_rank,
		     #arena_champion_rank{rank = Rank, old_rank = Rank,
					  score = R#arena_champion_role.score,
					  id = {Rank, <<>>}}),
	  ok;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr210, _,
	     {__Levelarena_cluster_champion_mgr210,
	      __Tracesarena_cluster_champion_mgr210}}
		when __Levelarena_cluster_champion_mgr210 band 8 /= 0
		       orelse __Tracesarena_cluster_champion_mgr210 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_champion_mgr},
			      {function, init_rank_robot}, {line, 210},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("查找不到机器人数据:rank:~w, id:~w",
					   [Rank, Rank]),
			     none, 4096, 8,
			     __Levelarena_cluster_champion_mgr210,
			     __Tracesarena_cluster_champion_mgr210, lager_event,
			     __Pidarena_cluster_champion_mgr210);
	    _ -> ok
	  end
    end.

to_champion_role(#sky_ladder_role{id = Id, name = Name,
				  robot_unit = RobotId, lev = Lev, sex = Sex,
				  gid = Gid, gname = Gname, face = Face,
				  power = Power, lookid = LookId,
				  avatar_id = AvatarId,
				  face_update_time = FaceUpdateTime,
				  face_file = FaceFile},
		 Rank) ->
    Group = (Rank - 1) rem 1 + 1,
    Score = arena_cluster_champion_data:get_score(Rank),
    MaxPower = case role_robot:get_role(Id) of
		 {ok, #role_robot{max_power = MaxPowerT}} -> MaxPowerT;
		 _ -> arena_cluster_champion_data:get_const(base_power)
	       end,
    #arena_champion_role{id = Id, robot_id = RobotId,
			 name = Name, lev = Lev, sex = Sex, gid = Gid,
			 gname = Gname, face = Face, power = Power,
			 max_power = MaxPower, lookid = LookId,
			 old_score = Score, old_rank = Rank, rank = Rank,
			 avatar_id = AvatarId, group = Group, score = Score,
			 face_update_time = FaceUpdateTime,
			 face_file = FaceFile}.

-spec zero_update() -> ok.

zero_update() -> info(zero_update).

-spec m() -> ok.

m() ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr229, _,
       {__Levelarena_cluster_champion_mgr229,
	__Tracesarena_cluster_champion_mgr229}}
	  when __Levelarena_cluster_champion_mgr229 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr229 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr}, {function, m},
			{line, 229}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "有人输入了下阶段", none, 4096, 64,
		       __Levelarena_cluster_champion_mgr229,
		       __Tracesarena_cluster_champion_mgr229, lager_event,
		       __Pidarena_cluster_champion_mgr229);
      _ -> ok
    end,
    case ets:info(arena_cluster_champion_role, size) of
      0 -> extract_join_role();
      _ ->
	  gen_fsm:send_event(arena_cluster_champion_mgr, timeout)
    end.

info(Info) -> arena_cluster_champion_mgr ! Info.

cast(Event) ->
    gen_fsm:send_all_state_event(arena_cluster_champion_mgr,
				 Event).

call(Event) ->
    case catch
	   gen_fsm:sync_send_all_state_event(arena_cluster_champion_mgr,
					     Event, 10000)
	of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr246, _,
	     {__Levelarena_cluster_champion_mgr246,
	      __Tracesarena_cluster_champion_mgr246}}
		when __Levelarena_cluster_champion_mgr246 band 8 /= 0
		       orelse __Tracesarena_cluster_champion_mgr246 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_champion_mgr},
			      {function, call}, {line, 246},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [arena_cluster_champion_mgr, Event,
					    10000, erlang:get_stacktrace()]),
			     none, 4096, 8,
			     __Levelarena_cluster_champion_mgr246,
			     __Tracesarena_cluster_champion_mgr246, lager_event,
			     __Pidarena_cluster_champion_mgr246);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end.

apply({M, F, A}) ->
    cluster_cast(arena_cluster_champion_mgr, info,
		 [{apply, M, F, A}]).

start_link() ->
    gen_fsm:start_link({local, arena_cluster_champion_mgr},
		       arena_cluster_champion_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr257, _,
       {__Levelarena_cluster_champion_mgr257,
	__Tracesarena_cluster_champion_mgr257}}
	  when __Levelarena_cluster_champion_mgr257 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr257 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr}, {function, init},
			{line, 257}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动", none, 4096, 64,
		       __Levelarena_cluster_champion_mgr257,
		       __Tracesarena_cluster_champion_mgr257, lager_event,
		       __Pidarena_cluster_champion_mgr257);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(arena_cluster_champion_replay,
			"dets/arena_cluster_champion_replay.dets", 1, set),
    d_ets_lib:load_dets_to_ets(arena_cluster_champion_replay,
			       undefined),
    d_ets_lib:new_d_ets(arena_cluster_champion_bet,
			"dets/arena_cluster_champion_bet.dets",
			#champion_bet.id, set),
    d_ets_lib:load_dets_to_ets(arena_cluster_champion_bet,
			       undefined),
    d_ets_lib:new_d_ets(arena_cluster_champion_ext,
			"dets/arena_cluster_champion_ext.dets", 1, set),
    d_ets_lib:load_dets_to_ets(arena_cluster_champion_ext,
			       undefined),
    d_ets_lib:new_d_ets(arena_cluster_champion_result,
			"dets/arena_cluster_champion_result.dets",
			#champion_result.id, set),
    d_ets_lib:load_dets_to_ets(arena_cluster_champion_result,
			       undefined),
    d_ets_lib:new_d_ets(arena_cluster_champion_pk,
			"dets/arena_cluster_champion_pk.dets", #champion_pk.id,
			set),
    arena_champion_ver:do_init_champion_pk(arena_cluster_champion_pk),
    d_ets_lib:new_d_ets(arena_cluster_champion_role_log,
			"dets/arena_cluster_champion_role_log.dets",
			#champion_role_log.id, set),
    d_ets_lib:load_dets_to_ets(arena_cluster_champion_role_log,
			       undefined),
    d_ets_lib:new_d_ets(arena_cluster_champion_role,
			"dets/arena_cluster_champion_role.dets",
			#arena_champion_role.id, set),
    d_ets_lib:load_dets_to_ets(arena_cluster_champion_role,
			       fun (D) ->
				       arena_champion_mgr:arena_champion_role_ver(D)
			       end),
    d_ets_lib:new_ets(arena_cluster_champion_rank,
		      #arena_champion_rank.rank, set),
    ets:foldl(fun (#arena_champion_role{id = Id,
					rank = Rank, old_rank = OldRank,
					score = Score, score_32 = Score32},
		   _) ->
		      ets:insert(arena_cluster_champion_rank,
				 #arena_champion_rank{rank = Rank,
						      old_rank = OldRank,
						      id = Id, score = Score,
						      score_32 = Score32})
	      end,
	      0, arena_cluster_champion_role),
    d_ets_lib:new_ets(arena_cluster_champion_formation, 1,
		      set),
    d_ets_lib:new_ets(arena_cluster_champion_formation_info,
		      1, set),
    sys_env:set(arena_cluster_champion_set_formation, 1),
    Ms = date:unixtime(ms),
    erlang:send_after(20000, self(), init_next_season_time),
    util:set_timer(notice_msg, 60 * 10, {notice_msg, 1}),
    init_merge(),
    {StateName, State} = init_state(Ms),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr295, _,
       {__Levelarena_cluster_champion_mgr295,
	__Tracesarena_cluster_champion_mgr295}}
	  when __Levelarena_cluster_champion_mgr295 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr295 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr}, {function, init},
			{line, 295}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("启动完成:~w", [StateName]), none, 4096, 64,
		       __Levelarena_cluster_champion_mgr295,
		       __Tracesarena_cluster_champion_mgr295, lager_event,
		       __Pidarena_cluster_champion_mgr295);
      _ -> ok
    end,
    {ok, StateName, State,
     max(1, State#champion_state.state_end_time - Ms)}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok, continue(StateName, Reply, State).

handle_info(gm_init_season, StateName, State) ->
    Now = date:unixtime(),
    SeasonStartTime = date:unixtime({zero, Now + 10}),
    SeasonEndTime = SeasonStartTime + 86400 * 7 - 60 * 5,
    zero_update(),
    continue(StateName,
	     State#champion_state{season_start_time =
				      SeasonStartTime,
				  season_end_time = SeasonEndTime});
handle_info({gm_set_state, NewState}, StateName,
	    _State) ->
    continue(StateName, NewState);
handle_info({sync_local_hallows_look, RoleId, Rank,
	     EndTime},
	    StateName, State) ->
    Now = date:unixtime(),
    List0 = sys_env:get(arena_cluster_champion_hallows_look,
			[]),
    List1 = [T
	     || T = {_, _, EndTime0} <- List0, EndTime0 > Now],
    List = lists:keystore(RoleId, 1, List1,
			  {RoleId, Rank, EndTime}),
    sys_env:save(arena_cluster_champion_hallows_look, List),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr324, _,
       {__Levelarena_cluster_champion_mgr324,
	__Tracesarena_cluster_champion_mgr324}}
	  when __Levelarena_cluster_champion_mgr324 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr324 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, handle_info}, {line, 324},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("跨服冠军赛神器幻化数据变化前 ~w 变化后 ~w",
				     [List0, List]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr324,
		       __Tracesarena_cluster_champion_mgr324, lager_event,
		       __Pidarena_cluster_champion_mgr324);
      _ -> ok
    end,
    role_lib:cast(by_id, RoleId,
		  {hallows_look, arena_cluster_champion_activate, []}),
    continue(StateName, State);
handle_info(init_next_season_time, StateName,
	    State = #champion_state{season_start_time =
					SeasonStartTime0,
				    season_end_time = SeasonEndTime0}) ->
    Now = date:unixtime(),
    case is_open() andalso sky_ladder_mgr:check_open() of
      true ->
	  case SeasonStartTime0 =:= 0 orelse
		 SeasonStartTime0 > Now orelse Now > SeasonEndTime0
	      of
	    true ->
		SeasonStartTime = Now +
				    date:week_next_diff([7], {0, 0, 0}),
		SeasonEndTime = SeasonStartTime + 86400 * 7 - 60 * 5,
		StepStatusTime = SeasonStartTime +
				   date:time_sec(arena_cluster_champion_data:get_const(time_score_start)),
		util:set_timer(notice_msg, 60 * 40, {notice_msg, 1}),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster_champion_mgr339, _,
		   {__Levelarena_cluster_champion_mgr339,
		    __Tracesarena_cluster_champion_mgr339}}
		      when __Levelarena_cluster_champion_mgr339 band 64 /= 0
			     orelse
			     __Tracesarena_cluster_champion_mgr339 /= [] ->
		      lager:do_log(info,
				   [{module, arena_cluster_champion_mgr},
				    {function, handle_info}, {line, 339},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("初始化下一赛期时间,now=~w start_time=~w, end_time=~w",
						 [Now, SeasonStartTime,
						  SeasonEndTime]),
				   none, 4096, 64,
				   __Levelarena_cluster_champion_mgr339,
				   __Tracesarena_cluster_champion_mgr339,
				   lager_event,
				   __Pidarena_cluster_champion_mgr339);
		  _ -> ok
		end,
		continue(StateName,
			 State#champion_state{season_start_time =
						  SeasonStartTime,
					      season_end_time = SeasonEndTime,
					      step_status_time =
						  StepStatusTime});
	    _ -> continue(StateName, State)
	  end;
      _ -> continue(StateName, State)
    end;
handle_info({notify_score_start}, StateName, State) ->
    case is_open() andalso sky_ladder_mgr:check_open() of
      true ->
	  case ets:info(arena_cluster_champion_role, size) of
	    N when N > 0 ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster_champion_mgr354, _,
		   {__Levelarena_cluster_champion_mgr354,
		    __Tracesarena_cluster_champion_mgr354}}
		      when __Levelarena_cluster_champion_mgr354 band 64 /= 0
			     orelse
			     __Tracesarena_cluster_champion_mgr354 /= [] ->
		      lager:do_log(info,
				   [{module, arena_cluster_champion_mgr},
				    {function, handle_info}, {line, 354},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("玩家存在参与资格人数:~w  ~w",
						 [N, StateName]),
				   none, 4096, 64,
				   __Levelarena_cluster_champion_mgr354,
				   __Tracesarena_cluster_champion_mgr354,
				   lager_event,
				   __Pidarena_cluster_champion_mgr354);
		  _ -> ok
		end,
		RL = case ets:match_object(arena_cluster_champion_role,
					   #arena_champion_role{old_rank = N,
								_ = '_'})
			 of
		       RL1 = [_ | _] -> RL1;
		       _ ->
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
			     {__Pidarena_cluster_champion_mgr358, _,
			      {__Levelarena_cluster_champion_mgr358,
			       __Tracesarena_cluster_champion_mgr358}}
				 when __Levelarena_cluster_champion_mgr358 band
					8
					/= 0
					orelse
					__Tracesarena_cluster_champion_mgr358 /=
					  [] ->
				 lager:do_log(error,
					      [{module,
						arena_cluster_champion_mgr},
					       {function, handle_info},
					       {line, 358},
					       {pid, pid_to_list(self())},
					       {node, node()}
					       | lager:md()],
					      io_lib:format("数据异常，查找不到指定名次数据",
							    []),
					      none, 4096, 8,
					      __Levelarena_cluster_champion_mgr358,
					      __Tracesarena_cluster_champion_mgr358,
					      lager_event,
					      __Pidarena_cluster_champion_mgr358);
			     _ -> ok
			   end,
			   ets:tab2list(arena_cluster_champion_role)
		     end,
		[#arena_champion_role{id = RoleId, max_power = Power,
				      lev = Lev, old_score = OldScore}
		 | _] =
		    RL,
		d_ets_lib:save_ets(arena_cluster_champion_ext,
				   {last_role, RoleId}),
		put(pk_list,
		    lists:concat(ets:match(arena_cluster_champion_role,
					   #arena_champion_role{id = '$1',
								robot_id = 0,
								_ = '_'}))),
		self() ! load_pk_info,
		init_robot(N + 1, 1, Power, Lev, OldScore);
	    N ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster_champion_mgr367, _,
		   {__Levelarena_cluster_champion_mgr367,
		    __Tracesarena_cluster_champion_mgr367}}
		      when __Levelarena_cluster_champion_mgr367 band 8 /= 0
			     orelse
			     __Tracesarena_cluster_champion_mgr367 /= [] ->
		      lager:do_log(error,
				   [{module, arena_cluster_champion_mgr},
				    {function, handle_info}, {line, 367},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("没有玩家存在参与资格:~w ~w",
						 [N, StateName]),
				   none, 4096, 8,
				   __Levelarena_cluster_champion_mgr367,
				   __Tracesarena_cluster_champion_mgr367,
				   lager_event,
				   __Pidarena_cluster_champion_mgr367);
		  _ -> ok
		end,
		d_ets_lib:save_ets(arena_cluster_champion_ext,
				   {last_role, null}),
		init_robot(1, 1,
			   arena_cluster_champion_data:get_const(base_power),
			   arena_cluster_champion_data:get_const(base_lev),
			   arena_cluster_champion_data:get_const(base_score))
	  end,
	  Now = date:unixtime(),
	  SeasonStartTime = date:unixtime({zero, Now + 10}),
	  SeasonEndTime = SeasonStartTime + 86400 * 7 - 60 * 5,
	  NewState = State#champion_state{step = 1,
					  step_status = 0,
					  season_start_time = SeasonStartTime,
					  season_end_time = SeasonEndTime,
					  round = 0, round_status = 0},
	  save_state(score_notice, NewState),
	  util:set_timer(notice_msg, 60 * 2, {notice_msg, 1}),
	  self() ! {notify_state, 1},
	  Sid = sys_lib:srv_id(),
	  sys_env:save(arena_cluster_champion_srv_id, Sid),
	  cluster_dynamic_group:group_other_cast(1, sys_env, save,
						 [arena_cluster_champion_srv_id,
						  Sid]),
	  erase(arena_cluster_champion_is_open),
	  continue(score_notice, NewState);
      _ -> continue(StateName, State)
    end;
handle_info(zero_update, StateName,
	    State = #champion_state{season_start_time =
					SeasonStartTime,
				    season_end_time = SeasonEndTime}) ->
    Now = date:unixtime(),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr392, _,
       {__Levelarena_cluster_champion_mgr392,
	__Tracesarena_cluster_champion_mgr392}}
	  when __Levelarena_cluster_champion_mgr392 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr392 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, handle_info}, {line, 392},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("周冠军赛0点检查:~w now=~w season_start_time=~w "
				     "season_end_time=~w",
				     [StateName, Now, SeasonStartTime,
				      SeasonEndTime]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr392,
		       __Tracesarena_cluster_champion_mgr392, lager_event,
		       __Pidarena_cluster_champion_mgr392);
      _ -> ok
    end,
    case is_open() andalso sky_ladder_mgr:check_open() of
      true ->
	  Week = date:day_of_the_week(Now + 60 * 10),
	  case Now >= SeasonStartTime andalso
		 Now < SeasonEndTime andalso StateName =:= idle
	      of
	    true when Week == 7 ->
		case check_sky_roles() of
		  true ->
		      Timeout =
			  date:next_diff(arena_cluster_champion_data:get_const(time_score_start)),
		      EndTime = Now + Timeout,
		      mail_notify_start(Now + Timeout),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidarena_cluster_champion_mgr404, _,
			 {__Levelarena_cluster_champion_mgr404,
			  __Tracesarena_cluster_champion_mgr404}}
			    when __Levelarena_cluster_champion_mgr404 band 64 /=
				   0
				   orelse
				   __Tracesarena_cluster_champion_mgr404 /=
				     [] ->
			    lager:do_log(info,
					 [{module, arena_cluster_champion_mgr},
					  {function, handle_info}, {line, 404},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("周冠军赛今天开始,距离开启时间:~w",
						       [Timeout]),
					 none, 4096, 64,
					 __Levelarena_cluster_champion_mgr404,
					 __Tracesarena_cluster_champion_mgr404,
					 lager_event,
					 __Pidarena_cluster_champion_mgr404);
			_ -> ok
		      end,
		      activity_global:set_and_push(16, 1, [EndTime]),
		      cluster_dynamic_group:group_other_cast(1,
							     activity_global,
							     set_and_push,
							     [16, 1,
							      [EndTime]]),
		      NewState = set_state_timeout(State#champion_state{step =
									    1,
									step_status
									    = 0,
									step_status_time
									    =
									    Now
									      +
									      Timeout,
									round =
									    0,
									round_status
									    =
									    0},
						   Timeout * 1000),
		      util:set_timer(notice_msg, 60 * 2, {notice_msg, 1}),
		      erase(arena_cluster_champion_is_open),
		      Sid = sys_lib:srv_id(),
		      sys_env:save(arena_cluster_champion_srv_id, Sid),
		      cluster_dynamic_group:group_other_cast(1, sys_env, save,
							     [arena_cluster_champion_srv_id,
							      Sid]),
		      continue(score_notice, NewState);
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
			{__Pidarena_cluster_champion_mgr415, _,
			 {__Levelarena_cluster_champion_mgr415,
			  __Tracesarena_cluster_champion_mgr415}}
			    when __Levelarena_cluster_champion_mgr415 band 64 /=
				   0
				   orelse
				   __Tracesarena_cluster_champion_mgr415 /=
				     [] ->
			    lager:do_log(info,
					 [{module, arena_cluster_champion_mgr},
					  {function, handle_info}, {line, 415},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("周冠军赛赛季参与人数不足, 不开启", []),
					 none, 4096, 64,
					 __Levelarena_cluster_champion_mgr415,
					 __Tracesarena_cluster_champion_mgr415,
					 lager_event,
					 __Pidarena_cluster_champion_mgr415);
			_ -> ok
		      end,
		      self() ! init_next_season_time,
		      put(arena_cluster_champion_is_open, 2),
		      Sid = sys_lib:srv_id(),
		      sys_env:save(arena_cluster_champion_srv_id, Sid),
		      cluster_dynamic_group:group_other_cast(1, sys_env, save,
							     [arena_cluster_champion_srv_id,
							      Sid]),
		      continue(StateName,
			       State#champion_state{season_start_time = 0})
		end;
	    _ when Now > SeasonEndTime andalso StateName =:= idle ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster_champion_mgr424, _,
		   {__Levelarena_cluster_champion_mgr424,
		    __Tracesarena_cluster_champion_mgr424}}
		      when __Levelarena_cluster_champion_mgr424 band 64 /= 0
			     orelse
			     __Tracesarena_cluster_champion_mgr424 /= [] ->
		      lager:do_log(info,
				   [{module, arena_cluster_champion_mgr},
				    {function, handle_info}, {line, 424},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("周冠军赛赛季已结束,结束时间:~w",
						 [SeasonEndTime]),
				   none, 4096, 64,
				   __Levelarena_cluster_champion_mgr424,
				   __Tracesarena_cluster_champion_mgr424,
				   lager_event,
				   __Pidarena_cluster_champion_mgr424);
		  _ -> ok
		end,
		self() ! init_next_season_time,
		continue(StateName, State);
	    _ -> continue(StateName, State)
	  end;
      _ -> continue(StateName, State)
    end;
handle_info({notice_msg, N}, StateName = score_notice,
	    State) ->
    case is_open() andalso sky_ladder_mgr:check_open() of
      true ->
	  notice_msg(StateName, #{num => 2}),
	  cluster_dynamic_group:group_other_cast(1,
						 arena_cluster_champion_mgr,
						 notice_msg,
						 [StateName, #{num => 2}]),
	  util:set_timer(notice_msg, 60 * 15,
			 {notice_msg, N + 1}),
	  continue(StateName, State);
      _ -> continue(StateName, State)
    end;
handle_info({add_score, _Id, 0},
	    StateName = score_fight, State) ->
    case is_open() andalso sky_ladder_mgr:check_open() of
      true -> dec_combat_num();
      _ -> skip
    end,
    continue(StateName, State);
handle_info({add_score, Id, AddScore},
	    StateName = score_fight, State) ->
    case is_open() andalso sky_ladder_mgr:check_open() of
      true ->
	  dec_combat_num(),
	  case arena_cluster_champion_lib:get_role(Id) of
	    {ok, R = #arena_champion_role{score = Score}} ->
		update_rank(R#arena_champion_role{score =
						      Score + AddScore});
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster_champion_mgr488, _,
		   {__Levelarena_cluster_champion_mgr488,
		    __Tracesarena_cluster_champion_mgr488}}
		      when __Levelarena_cluster_champion_mgr488 band 8 /= 0
			     orelse
			     __Tracesarena_cluster_champion_mgr488 /= [] ->
		      lager:do_log(error,
				   [{module, arena_cluster_champion_mgr},
				    {function, handle_info}, {line, 488},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("获取竞技冠军参战者信息失败:~w, ~w",
						 [Id, AddScore]),
				   none, 4096, 8,
				   __Levelarena_cluster_champion_mgr488,
				   __Tracesarena_cluster_champion_mgr488,
				   lager_event,
				   __Pidarena_cluster_champion_mgr488);
		  _ -> ok
		end
	  end,
	  continue(StateName, State);
      _ -> continue(StateName, State)
    end;
handle_info(load_pk_info, StateName, State)
    when StateName =:= score_ready orelse
	   StateName =:= champion_ready orelse
	     StateName =:= score_notice ->
    case is_open() andalso sky_ladder_mgr:check_open() of
      true ->
	  case get(pk_list) of
	    [RoleId | T] when StateName =:= score_notice ->
		erlang:send_after(100, self(), load_pk_info),
		pre_load_role(RoleId),
		put(pk_list, T);
	    [RoleId | T] ->
		put(pk_list, T),
		erlang:send_after(10, self(), load_pk_info),
		{ok, PK} = arena_cluster_champion_lib:get_pk(RoleId),
		do_update_pk_info(PK);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster_champion_mgr509, _,
		   {__Levelarena_cluster_champion_mgr509,
		    __Tracesarena_cluster_champion_mgr509}}
		      when __Levelarena_cluster_champion_mgr509 band 128 /= 0
			     orelse
			     __Tracesarena_cluster_champion_mgr509 /= [] ->
		      lager:do_log(debug,
				   [{module, arena_cluster_champion_mgr},
				    {function, handle_info}, {line, 509},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("加载角色阵法信息完成", []), none, 4096,
				   128, __Levelarena_cluster_champion_mgr509,
				   __Tracesarena_cluster_champion_mgr509,
				   lager_event,
				   __Pidarena_cluster_champion_mgr509);
		  _ -> ok
		end
	  end,
	  continue(StateName, State);
      _ -> continue(StateName, State)
    end;
handle_info({combat_end_notify, Flag}, StateName,
	    State) ->
    case is_open() andalso sky_ladder_mgr:check_open() of
      true ->
	  sys_env:set(arena_cluster_champion_set_formation, 1),
	  cluster_dynamic_group:group_other_cast(1, sys_env, set,
						 [arena_cluster_champion_set_formation,
						  1]),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr522, _,
	     {__Levelarena_cluster_champion_mgr522,
	      __Tracesarena_cluster_champion_mgr522}}
		when __Levelarena_cluster_champion_mgr522 band 64 /= 0
		       orelse __Tracesarena_cluster_champion_mgr522 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_champion_mgr},
			      {function, handle_info}, {line, 522},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("所有战斗计算结束，通知前端刷新UI进入录像观战:~w",
					   [Flag]),
			     none, 4096, 64,
			     __Levelarena_cluster_champion_mgr522,
			     __Tracesarena_cluster_champion_mgr522, lager_event,
			     __Pidarena_cluster_champion_mgr522);
	    _ -> ok
	  end,
	  self() ! {notify_state, 2},
	  continue(StateName, State);
      _ -> continue(StateName, State)
    end;
handle_info({notify_state, Flag}, StateName, State) ->
    case is_open() andalso sky_ladder_mgr:check_open() of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr533, _,
	     {__Levelarena_cluster_champion_mgr533,
	      __Tracesarena_cluster_champion_mgr533}}
		when __Levelarena_cluster_champion_mgr533 band 128 /= 0
		       orelse __Tracesarena_cluster_champion_mgr533 /= [] ->
		lager:do_log(debug,
			     [{module, arena_cluster_champion_mgr},
			      {function, handle_info}, {line, 533},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("通知全服状态发生变化:~w", [Flag]), none, 4096,
			     128, __Levelarena_cluster_champion_mgr533,
			     __Tracesarena_cluster_champion_mgr533, lager_event,
			     __Pidarena_cluster_champion_mgr533);
	    _ -> ok
	  end,
	  Data = pack_state(Flag, State),
	  role_group:send(world, proto_lib:pack(26200, Data)),
	  cluster_dynamic_group:group_other_cast(1, role_group,
						 send,
						 [world,
						  proto_lib:pack(26200, Data)]),
	  continue(StateName, State);
      _ -> continue(StateName, State)
    end;
handle_info({push_state, ConnPid}, StateName, State) ->
    case is_open() andalso sky_ladder_mgr:check_open() of
      true ->
	  sys_conn:pack_send(ConnPid, 26200,
			     pack_state(0, State)),
	  continue(StateName, State);
      _ ->
	  sys_conn:pack_send(ConnPid, 26200,
			     pack_state(0, State)),
	  continue(StateName, State)
    end;
handle_info(cluster_change, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr555, _,
       {__Levelarena_cluster_champion_mgr555,
	__Tracesarena_cluster_champion_mgr555}}
	  when __Levelarena_cluster_champion_mgr555 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr555 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, handle_info}, {line, 555},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "转换为跨服模式", none, 4096, 64,
		       __Levelarena_cluster_champion_mgr555,
		       __Tracesarena_cluster_champion_mgr555, lager_event,
		       __Pidarena_cluster_champion_mgr555);
      _ -> ok
    end,
    d_ets_lib:save_d_ets(arena_cluster_champion_ext,
			 {arena_champion_merge_status, false}),
    continue(StateName, State);
handle_info({apply, M, F, A}, StateName, State) ->
    case sky_ladder_mgr:check_open() of
      true ->
	  try util:exec_fun(M, F, [StateName, State | A]) catch
	    X:E ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster_champion_mgr567, _,
		   {__Levelarena_cluster_champion_mgr567,
		    __Tracesarena_cluster_champion_mgr567}}
		      when __Levelarena_cluster_champion_mgr567 band 8 /= 0
			     orelse
			     __Tracesarena_cluster_champion_mgr567 /= [] ->
		      lager:do_log(error,
				   [{module, arena_cluster_champion_mgr},
				    {function, handle_info}, {line, 567},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~w 执行方法:~w:~w, ~w, 出错:~w:~w ~w, state:~w",
						 [StateName, M, F, A, X, E,
						  erlang:get_stacktrace(),
						  State]),
				   none, 4096, 8,
				   __Levelarena_cluster_champion_mgr567,
				   __Tracesarena_cluster_champion_mgr567,
				   lager_event,
				   __Pidarena_cluster_champion_mgr567);
		  _ -> ok
		end
	  end,
	  continue(StateName, State);
      _ -> continue(StateName, State)
    end;
handle_info({gm_set_state, NewStateName, NewState},
	    StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr576, _,
       {__Levelarena_cluster_champion_mgr576,
	__Tracesarena_cluster_champion_mgr576}}
	  when __Levelarena_cluster_champion_mgr576 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr576 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, handle_info}, {line, 576},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("gm设置状态信息:~w, ~w ==> ~w, ~w",
				     [StateName, State, NewStateName,
				      NewState]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr576,
		       __Tracesarena_cluster_champion_mgr576, lager_event,
		       __Pidarena_cluster_champion_mgr576);
      _ -> ok
    end,
    continue(NewStateName, NewState);
handle_info({cluster_dynamic_sys_state, NewStateName,
	     NewState},
	    StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr581, _,
       {__Levelarena_cluster_champion_mgr581,
	__Tracesarena_cluster_champion_mgr581}}
	  when __Levelarena_cluster_champion_mgr581 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr581 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, handle_info}, {line, 581},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("同步了小跨服中心服数据状态信息:~w, ~w ==> ~w, ~w",
				     [StateName, State, NewStateName,
				      NewState]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr581,
		       __Tracesarena_cluster_champion_mgr581, lager_event,
		       __Pidarena_cluster_champion_mgr581);
      _ -> ok
    end,
    continue(NewStateName, NewState);
handle_info(_Info, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr585, _,
       {__Levelarena_cluster_champion_mgr585,
	__Tracesarena_cluster_champion_mgr585}}
	  when __Levelarena_cluster_champion_mgr585 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr585 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, handle_info}, {line, 585},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("接收到信息:~w, ~w", [StateName, _Info]), none,
		       4096, 64, __Levelarena_cluster_champion_mgr585,
		       __Tracesarena_cluster_champion_mgr585, lager_event,
		       __Pidarena_cluster_champion_mgr585);
      _ -> ok
    end,
    continue(StateName, State).

terminate(_Reason, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr589, _,
       {__Levelarena_cluster_champion_mgr589,
	__Tracesarena_cluster_champion_mgr589}}
	  when __Levelarena_cluster_champion_mgr589 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr589 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, terminate}, {line, 589},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始关闭", none, 4096, 64,
		       __Levelarena_cluster_champion_mgr589,
		       __Tracesarena_cluster_champion_mgr589, lager_event,
		       __Pidarena_cluster_champion_mgr589);
      _ -> ok
    end,
    save_state(StateName, State),
    sys_env:save(arena_cluster_champion_srv_id),
    dets:insert(arena_cluster_champion_role,
		ets:tab2list(arena_cluster_champion_role)),
    dets:insert(arena_cluster_champion_ext,
		ets:tab2list(arena_cluster_champion_ext)),
    dets:insert(arena_cluster_champion_replay,
		ets:tab2list(arena_cluster_champion_replay)),
    dets:insert(arena_cluster_champion_bet,
		ets:tab2list(arena_cluster_champion_bet)),
    dets:insert(arena_cluster_champion_pk,
		ets:tab2list(arena_cluster_champion_pk)),
    dets:insert(arena_cluster_champion_role_log,
		ets:tab2list(arena_cluster_champion_role_log)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr598, _,
       {__Levelarena_cluster_champion_mgr598,
	__Tracesarena_cluster_champion_mgr598}}
	  when __Levelarena_cluster_champion_mgr598 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr598 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, terminate}, {line, 598},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64,
		       __Levelarena_cluster_champion_mgr598,
		       __Tracesarena_cluster_champion_mgr598, lager_event,
		       __Pidarena_cluster_champion_mgr598);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

set_state_timeout(State, Timeout) ->
    Ms = date:unixtime(ms),
    State#champion_state{state_start_time = Ms,
			 state_end_time = Ms + Timeout}.

continue(StateName,
	 State = #champion_state{state_end_time = EndTime}) ->
    {next_state, StateName, State,
     max(1, EndTime - date:unixtime(ms))}.

continue(StateName, Reply,
	 State = #champion_state{state_end_time = EndTime}) ->
    {reply, Reply, StateName, State,
     max(1, EndTime - date:unixtime(ms))}.

init_state(Ms) ->
    StateInfo =
	arena_cluster_champion_lib:get_ext(arena_champion_state,
					   #{}),
    State = #champion_state{season_start_time =
				maps:get(season_start_time, StateInfo, 0),
			    season_end_time =
				maps:get(season_end_time, StateInfo, 0),
			    state_start_time =
				maps:get(state_start_time, StateInfo, Ms),
			    state_end_time =
				maps:get(state_end_time, StateInfo,
					 Ms + 864000000),
			    step = maps:get(step, StateInfo, 0),
			    step_status = maps:get(step_status, StateInfo, 0),
			    step_status_time =
				maps:get(step_status_time, StateInfo, 0),
			    round = maps:get(round, StateInfo, 0),
			    round_status =
				maps:get(round_status, StateInfo, 0)},
    StateName = maps:get(state_name, StateInfo, idle),
    case StateName of
      score_notice ->
	  activity_global:set_and_push(16, 1,
				       [State#champion_state.step_status_time]),
	  cluster_dynamic_group:group_other_cast(1,
						 activity_global, set_and_push,
						 [16, 1,
						  [State#champion_state.step_status_time]]);
      _ -> pass
    end,
    {StateName, State}.

save_state(StateName,
	   #champion_state{state_start_time = StateStartTime,
			   state_end_time = StateEndTime,
			   season_start_time = SeasonStartTime,
			   season_end_time = SeasonEndTime, step = Step,
			   step_status = StepStatus,
			   step_status_time = StepStatusTime, round = Round,
			   round_status = RoundStatus}) ->
    d_ets_lib:save_d_ets(arena_cluster_champion_ext,
			 {arena_champion_state,
			  #{season_start_time => SeasonStartTime,
			    season_end_time => SeasonEndTime,
			    state_name => StateName,
			    state_start_time => StateStartTime,
			    state_end_time => StateEndTime, step => Step,
			    step_status => StepStatus,
			    step_status_time => StepStatusTime, round => Round,
			    round_status => RoundStatus}}).

pack_state(Flag,
	   #champion_state{step = Step, step_status = StepStatus,
			   step_status_time = StepStatusTime, round = Round,
			   round_status = RoundStatus,
			   season_start_time = SeasonStartTime,
			   season_end_time = SeasonEndTime,
			   state_end_time = StateEndTime}) ->
    case get(arena_cluster_champion_is_open) of
      2 -> {0, 0, 0, 0, 0, 0, 0, 0, 0, <<>>, 2};
      _ ->
	  RoundStatusTime = date:unixtime() +
			      (StateEndTime - date:unixtime(ms)) div 1000,
	  Sid = sys_env:get(arena_cluster_champion_srv_id,
			    sys_lib:srv_id()),
	  {SeasonStartTime, SeasonEndTime, Step, StepStatus,
	   StepStatusTime, Round, RoundStatus, RoundStatusTime,
	   Flag, Sid, 0}
    end.

step_time(1) ->
    (arena_cluster_champion_data:get_const(time_score_ready)
       +
       arena_cluster_champion_data:get_const(time_score_guess)
       +
       arena_cluster_champion_data:get_const(time_score_fight))
      * 6;
step_time(64) ->
    (arena_cluster_champion_data:get_const(time_champion_ready)
       +
       arena_cluster_champion_data:get_const(time_champion_guess)
       +
       arena_cluster_champion_data:get_const(time_champion_fight))
      * 3
      +
      (arena_cluster_champion_data:get_const(time_champion_ready)
	 +
	 arena_cluster_champion_data:get_const(time_champion_guess)
	 +
	 arena_cluster_champion_data:get_const(time_champion_fight))
	* 3;
step_time(8) ->
    (arena_cluster_champion_data:get_const(time_champion_ready)
       +
       arena_cluster_champion_data:get_const(time_champion_guess)
       +
       arena_cluster_champion_data:get_const(time_champion_fight))
      * 3;
step_time(all) ->
    (arena_cluster_champion_data:get_const(time_score_ready)
       +
       arena_cluster_champion_data:get_const(time_score_guess)
       +
       arena_cluster_champion_data:get_const(time_score_fight))
      * 6
      +
      (arena_cluster_champion_data:get_const(time_champion_ready)
	 +
	 arena_cluster_champion_data:get_const(time_champion_guess)
	 +
	 arena_cluster_champion_data:get_const(time_champion_fight))
	* 3
      +
      (arena_cluster_champion_data:get_const(time_champion_ready)
	 +
	 arena_cluster_champion_data:get_const(time_champion_guess)
	 +
	 arena_cluster_champion_data:get_const(time_champion_fight))
	* 3;
step_time(_) ->
    (arena_cluster_champion_data:get_const(time_score_ready)
       +
       arena_cluster_champion_data:get_const(time_score_guess)
       +
       arena_cluster_champion_data:get_const(time_score_fight))
      * 6
      +
      (arena_cluster_champion_data:get_const(time_champion_ready)
	 +
	 arena_cluster_champion_data:get_const(time_champion_guess)
	 +
	 arena_cluster_champion_data:get_const(time_champion_fight))
	* 3
      +
      (arena_cluster_champion_data:get_const(time_champion_ready)
	 +
	 arena_cluster_champion_data:get_const(time_champion_guess)
	 +
	 arena_cluster_champion_data:get_const(time_champion_fight))
	* 3.

idle(timeout, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr678, _,
       {__Levelarena_cluster_champion_mgr678,
	__Tracesarena_cluster_champion_mgr678}}
	  when __Levelarena_cluster_champion_mgr678 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr678 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr}, {function, idle},
			{line, 678}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "空闲时间超时", none, 4096, 64,
		       __Levelarena_cluster_champion_mgr678,
		       __Tracesarena_cluster_champion_mgr678, lager_event,
		       __Pidarena_cluster_champion_mgr678);
      _ -> ok
    end,
    continue(idle, set_state_timeout(State, 86400000));
idle(_Any, State) -> continue(idle, State).

score_notice(timeout, State) ->
    case ets:info(arena_cluster_champion_role, size) of
      0 ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr687, _,
	     {__Levelarena_cluster_champion_mgr687,
	      __Tracesarena_cluster_champion_mgr687}}
		when __Levelarena_cluster_champion_mgr687 band 8 /= 0
		       orelse __Tracesarena_cluster_champion_mgr687 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_champion_mgr},
			      {function, score_notice}, {line, 687},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "竞技场参与人数为0，采集数据", none, 4096, 8,
			     __Levelarena_cluster_champion_mgr687,
			     __Tracesarena_cluster_champion_mgr687, lager_event,
			     __Pidarena_cluster_champion_mgr687);
	    _ -> ok
	  end,
	  extract_join_role(),
	  continue(score_notice, set_state_timeout(State, 100));
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr691, _,
	     {__Levelarena_cluster_champion_mgr691,
	      __Tracesarena_cluster_champion_mgr691}}
		when __Levelarena_cluster_champion_mgr691 band 64 /= 0
		       orelse __Tracesarena_cluster_champion_mgr691 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_champion_mgr},
			      {function, score_notice}, {line, 691},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "选拔赛进入准备阶段:1", none, 4096, 64,
			     __Levelarena_cluster_champion_mgr691,
			     __Tracesarena_cluster_champion_mgr691, lager_event,
			     __Pidarena_cluster_champion_mgr691);
	    _ -> ok
	  end,
	  d_ets_lib:clear_d_ets(arena_cluster_champion_ext,
				top_three),
	  notice_msg(score_start, #{}),
	  cluster_dynamic_group:group_other_cast(1,
						 arena_cluster_champion_mgr,
						 notice_msg,
						 [score_start, #{}]),
	  Now = date:unixtime(),
	  StepStatusTime = Now + step_time(all),
	  NewState = State#champion_state{round = 1,
					  round_status = 1, step_status = 1,
					  step_status_time = StepStatusTime},
	  activity_global:set_and_push(16, 2, [StepStatusTime]),
	  cluster_dynamic_group:group_other_cast(1,
						 activity_global, set_and_push,
						 [16, 2, [StepStatusTime]]),
	  score_match(NewState),
	  ets:delete_all_objects(arena_cluster_champion_formation),
	  ets:delete_all_objects(arena_cluster_champion_formation_info),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr703, _,
	     {__Levelarena_cluster_champion_mgr703,
	      __Tracesarena_cluster_champion_mgr703}}
		when __Levelarena_cluster_champion_mgr703 band 64 /= 0
		       orelse __Tracesarena_cluster_champion_mgr703 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_champion_mgr},
			      {function, score_notice}, {line, 703},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("选拔赛匹配对手完成:1", []), none, 4096, 64,
			     __Levelarena_cluster_champion_mgr703,
			     __Tracesarena_cluster_champion_mgr703, lager_event,
			     __Pidarena_cluster_champion_mgr703);
	    _ -> ok
	  end,
	  Timeout =
	      arena_cluster_champion_data:get_const(time_score_ready),
	  self() ! {notify_state, 1},
	  continue(score_ready,
		   set_state_timeout(NewState, Timeout * 1000))
    end;
score_notice(_Any, State) ->
    continue(score_notice, State).

score_ready(timeout, State = #champion_state{}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr713, _,
       {__Levelarena_cluster_champion_mgr713,
	__Tracesarena_cluster_champion_mgr713}}
	  when __Levelarena_cluster_champion_mgr713 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr713 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, score_ready}, {line, 713},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("选拔赛进入准备结束期:~w",
				     [State#champion_state.round]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr713,
		       __Tracesarena_cluster_champion_mgr713, lager_event,
		       __Pidarena_cluster_champion_mgr713);
      _ -> ok
    end,
    sys_env:set(arena_cluster_champion_set_formation, 0),
    cluster_dynamic_group:group_other_cast(1, sys_env, set,
					   [arena_cluster_champion_set_formation,
					    0]),
    Timeout = 2,
    continue(score_ready2,
	     set_state_timeout(State#champion_state{round_status =
							2},
			       Timeout * 1000));
score_ready(_Any, State) ->
    continue(score_ready, State).

score_ready2(timeout,
	     State = #champion_state{round = Round}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr723, _,
       {__Levelarena_cluster_champion_mgr723,
	__Tracesarena_cluster_champion_mgr723}}
	  when __Levelarena_cluster_champion_mgr723 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr723 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, score_ready2}, {line, 723},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("选拔赛进入竞猜阶段:~w",
				     [State#champion_state.round]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr723,
		       __Tracesarena_cluster_champion_mgr723, lager_event,
		       __Pidarena_cluster_champion_mgr723);
      _ -> ok
    end,
    sys_env:set(arena_cluster_champion_set_formation, 0),
    cluster_dynamic_group:group_other_cast(1, sys_env, set,
					   [arena_cluster_champion_set_formation,
					    0]),
    score_pre_load_combat_fighter(Round),
    guess_score_supply(arena_cluster_champion_data:get_const(guess_number1),
		       State),
    select_guess(State),
    Timeout =
	arena_cluster_champion_data:get_const(time_score_guess),
    self() ! {notify_state, 1},
    continue(score_guess,
	     set_state_timeout(State#champion_state{round_status =
							2},
			       Timeout * 1000));
score_ready2(_Any, State) ->
    continue(score_ready2, State).

score_guess(timeout,
	    State = #champion_state{round = Round}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr737, _,
       {__Levelarena_cluster_champion_mgr737,
	__Tracesarena_cluster_champion_mgr737}}
	  when __Levelarena_cluster_champion_mgr737 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr737 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, score_guess}, {line, 737},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("选拔赛进入对战阶段:~w",
				     [State#champion_state.round]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr737,
		       __Tracesarena_cluster_champion_mgr737, lager_event,
		       __Pidarena_cluster_champion_mgr737);
      _ -> ok
    end,
    score_combat(Round),
    Timeout =
	arena_cluster_champion_data:get_const(time_score_fight),
    self() ! {notify_state, 0},
    util:set_ms_timer(combat_end_notify, 5000,
		      {combat_end_notify, timeout}),
    continue(score_fight,
	     set_state_timeout(State#champion_state{round_status =
							3},
			       Timeout * 1000));
score_guess(_Any, State) ->
    continue(score_guess, State).

score_fight(timeout,
	    State = #champion_state{round = Round}) ->
    sys_env:set(arena_cluster_champion_set_formation, 1),
    cluster_dynamic_group:group_other_cast(1, sys_env, set,
					   [arena_cluster_champion_set_formation,
					    1]),
    guess_stat(0, State),
    RankL = arena_cluster_champion_lib:list_rank(100),
    d_ets_lib:save_ets(arena_cluster_champion_ext,
		       {rank_list, RankL}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr753, _,
       {__Levelarena_cluster_champion_mgr753,
	__Tracesarena_cluster_champion_mgr753}}
	  when __Levelarena_cluster_champion_mgr753 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr753 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, score_fight}, {line, 753},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("选拔赛对战完成:~w combat_num=~w",
				     [State#champion_state.round,
				      get(combat_num)]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr753,
		       __Tracesarena_cluster_champion_mgr753, lager_event,
		       __Pidarena_cluster_champion_mgr753);
      _ -> ok
    end,
    self() ! {notify_state, 1},
    case Round of
      6 ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr757, _,
	     {__Levelarena_cluster_champion_mgr757,
	      __Tracesarena_cluster_champion_mgr757}}
		when __Levelarena_cluster_champion_mgr757 band 64 /= 0
		       orelse __Tracesarena_cluster_champion_mgr757 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_champion_mgr},
			      {function, score_fight}, {line, 757},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("选拔赛结束，进入32强比赛时间:~w", [Round]), none,
			     4096, 64, __Levelarena_cluster_champion_mgr757,
			     __Tracesarena_cluster_champion_mgr757, lager_event,
			     __Pidarena_cluster_champion_mgr757);
	    _ -> ok
	  end,
	  Timeout =
	      arena_cluster_champion_data:get_const(time_champion_ready),
	  StepStatusTime = date:unixtime() + step_time(64),
	  NewState = State#champion_state{round = 1,
					  round_status = 1, step = 64,
					  step_status = 1,
					  step_status_time = StepStatusTime},
	  L = champion_match2(64, 1, NewState),
	  [d_ets_lib:save_ets(arena_cluster_champion_ext,
			      {{champion_32, Group}, L1})
	   || {Group, L1} <- L],
	  [d_ets_lib:save_ets(arena_cluster_champion_ext,
			      {{champion_32_temp, Group}, L1})
	   || {Group, L1} <- L],
	  [[ets:update_element(arena_cluster_champion_role,
			       RoleId, {#arena_champion_role.group32, Group})
	    || #champion_32_pk{id = RoleId} <- L1]
	   || {Group, L1} <- L],
	  self() ! {notify_state, 1},
	  notice_msg(champion_start, #{}),
	  cluster_dynamic_group:group_other_cast(1,
						 arena_cluster_champion_mgr,
						 notice_msg,
						 [champion_start, #{}]),
	  RL0 = [arena_cluster_champion_lib:rank_roleid(Rank)
		 || Rank <- lists:seq(1, 32)],
	  sys_env:save(arena_cluster_champion_32_ids, RL0),
	  cluster_dynamic_group:group_other_cast(1, sys_env, save,
						 [arena_cluster_champion_32_ids,
						  RL0]),
	  role_group:apply(world,
			   {arena_cluster_champion_lib, trigger,
			    [arena_cluster_champion_32]}),
	  cluster_dynamic_group:group_other_cast(1, role_group,
						 apply,
						 [world,
						  {arena_cluster_champion_lib,
						   trigger,
						   [arena_cluster_champion_32]}]),
	  continue(champion_ready,
		   set_state_timeout(NewState, Timeout * 1000));
      _ ->
	  NewState = State#champion_state{round = Round + 1,
					  round_status = 1},
	  score_match(NewState),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr779, _,
	     {__Levelarena_cluster_champion_mgr779,
	      __Tracesarena_cluster_champion_mgr779}}
		when __Levelarena_cluster_champion_mgr779 band 64 /= 0
		       orelse __Tracesarena_cluster_champion_mgr779 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_champion_mgr},
			      {function, score_fight}, {line, 779},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("选拔赛匹配对手完成, 进入回合：~w", [Round + 1]),
			     none, 4096, 64,
			     __Levelarena_cluster_champion_mgr779,
			     __Tracesarena_cluster_champion_mgr779, lager_event,
			     __Pidarena_cluster_champion_mgr779);
	    _ -> ok
	  end,
	  Timeout =
	      arena_cluster_champion_data:get_const(time_score_ready),
	  continue(score_ready,
		   set_state_timeout(NewState, Timeout * 1000))
    end;
score_fight(_Any, State) ->
    continue(score_fight, State).

champion_ready(timeout, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr788, _,
       {__Levelarena_cluster_champion_mgr788,
	__Tracesarena_cluster_champion_mgr788}}
	  when __Levelarena_cluster_champion_mgr788 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr788 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, champion_ready}, {line, 788},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("32强进入竞猜阶段,step:~w, round:~w",
				     [State#champion_state.step,
				      State#champion_state.round]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr788,
		       __Tracesarena_cluster_champion_mgr788, lager_event,
		       __Pidarena_cluster_champion_mgr788);
      _ -> ok
    end,
    sys_env:set(arena_cluster_champion_set_formation, 0),
    cluster_dynamic_group:group_other_cast(1, sys_env, set,
					   [arena_cluster_champion_set_formation,
					    0]),
    Timeout = 2,
    continue(champion_ready2,
	     set_state_timeout(State#champion_state{round_status =
							2},
			       Timeout * 1000));
champion_ready(_Any, State) ->
    continue(champion_ready, State).

champion_ready2(timeout, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr798, _,
       {__Levelarena_cluster_champion_mgr798,
	__Tracesarena_cluster_champion_mgr798}}
	  when __Levelarena_cluster_champion_mgr798 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr798 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, champion_ready2}, {line, 798},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("32强进入竞猜阶段,step:~w, round:~w",
				     [State#champion_state.step,
				      State#champion_state.round]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr798,
		       __Tracesarena_cluster_champion_mgr798, lager_event,
		       __Pidarena_cluster_champion_mgr798);
      _ -> ok
    end,
    sys_env:set(arena_cluster_champion_set_formation, 0),
    cluster_dynamic_group:group_other_cast(1, sys_env, set,
					   [arena_cluster_champion_set_formation,
					    0]),
    champion_pre_load_combat_fighter(State),
    guess_score_supply(arena_cluster_champion_data:get_const(guess_number2),
		       State),
    select_guess(State),
    Timeout =
	arena_cluster_champion_data:get_const(time_champion_guess),
    self() ! {notify_state, 1},
    continue(champion_guess,
	     set_state_timeout(State#champion_state{round_status =
							2},
			       Timeout * 1000));
champion_ready2(_Any, State) ->
    continue(champion_ready2, State).

champion_guess(timeout, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr812, _,
       {__Levelarena_cluster_champion_mgr812,
	__Tracesarena_cluster_champion_mgr812}}
	  when __Levelarena_cluster_champion_mgr812 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr812 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, champion_guess}, {line, 812},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("32强进入对战阶段,step:~w, round:~w",
				     [State#champion_state.step,
				      State#champion_state.round]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr812,
		       __Tracesarena_cluster_champion_mgr812, lager_event,
		       __Pidarena_cluster_champion_mgr812);
      _ -> ok
    end,
    put(combat_num, 0),
    champion_combat(State),
    Timeout =
	arena_cluster_champion_data:get_const(time_champion_fight),
    self() ! {notify_state, 0},
    util:set_ms_timer(combat_end_notify, 5000,
		      {combat_end_notify, timeout}),
    continue(champion_fight,
	     set_state_timeout(State#champion_state{round_status =
							3},
			       Timeout * 1000));
champion_guess(_Any, State) ->
    continue(champion_guess, State).

champion_fight(timeout,
	       State = #champion_state{round = Round, step = Step}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr824, _,
       {__Levelarena_cluster_champion_mgr824,
	__Tracesarena_cluster_champion_mgr824}}
	  when __Levelarena_cluster_champion_mgr824 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr824 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, champion_fight}, {line, 824},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("32强对战完成,step:~w, round:~w, combat_num:~w",
				     [Step, Round, get(combat_num)]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr824,
		       __Tracesarena_cluster_champion_mgr824, lager_event,
		       __Pidarena_cluster_champion_mgr824);
      _ -> ok
    end,
    sys_env:set(arena_cluster_champion_set_formation, 1),
    cluster_dynamic_group:group_other_cast(1, sys_env, set,
					   [arena_cluster_champion_set_formation,
					    1]),
    champion_combat_check(State),
    guess_stat(0, State),
    RankL = arena_cluster_champion_lib:list_rank(100),
    d_ets_lib:save_ets(arena_cluster_champion_ext,
		       {rank_list, RankL}),
    self() ! {notify_state, 1},
    case {Step, Round} of
      {64, 3} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr834, _,
	     {__Levelarena_cluster_champion_mgr834,
	      __Tracesarena_cluster_champion_mgr834}}
		when __Levelarena_cluster_champion_mgr834 band 64 /= 0
		       orelse __Tracesarena_cluster_champion_mgr834 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_champion_mgr},
			      {function, champion_fight}, {line, 834},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "64强比赛结束，进入8强", none, 4096, 64,
			     __Levelarena_cluster_champion_mgr834,
			     __Tracesarena_cluster_champion_mgr834, lager_event,
			     __Pidarena_cluster_champion_mgr834);
	    _ -> ok
	  end,
	  StepStatusTime = date:unixtime() + step_time(8),
	  NewState = State#champion_state{step = 8,
					  step_status_time = StepStatusTime,
					  round = 1, round_status = 1},
	  [{_, L}] = champion_match(8, 0, NewState),
	  d_ets_lib:save_ets(arena_cluster_champion_ext,
			     {champion_4, L}),
	  d_ets_lib:save_ets(arena_cluster_champion_ext,
			     {champion_4_temp, L}),
	  [d_ets_lib:clear_d_ets(arena_cluster_champion_ext,
				 {champion_32_temp, Group})
	   || Group <- lists:seq(1, 8)],
	  notice_msg(champion_4_start, #{}),
	  cluster_dynamic_group:group_other_cast(1,
						 arena_cluster_champion_mgr,
						 notice_msg,
						 [champion_4_start, #{}]),
	  Timeout =
	      arena_cluster_champion_data:get_const(time_champion_ready),
	  continue(champion_ready,
		   set_state_timeout(NewState, Timeout * 1000));
      {8, 3} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr846, _,
	     {__Levelarena_cluster_champion_mgr846,
	      __Tracesarena_cluster_champion_mgr846}}
		when __Levelarena_cluster_champion_mgr846 band 64 /= 0
		       orelse __Tracesarena_cluster_champion_mgr846 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_champion_mgr},
			      {function, champion_fight}, {line, 846},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("4强比赛结束", []), none, 4096, 64,
			     __Levelarena_cluster_champion_mgr846,
			     __Tracesarena_cluster_champion_mgr846, lager_event,
			     __Pidarena_cluster_champion_mgr846);
	    _ -> ok
	  end,
	  RankTopL = arena_cluster_champion_lib:list_rank(3),
	  Now = date:unixtime(),
	  d_ets_lib:clear_d_ets(arena_cluster_champion_result),
	  d_ets_lib:save_ets(arena_cluster_champion_ext,
			     {rank_top, RankTopL}),
	  d_ets_lib:save_ets(arena_cluster_champion_ext,
			     {top_three, Now}),
	  MaxNum = ets:info(arena_cluster_champion_role, size),
	  rank_reward(1, MaxNum),
	  save_result(1, MaxNum),
	  mail_bet(),
	  Timeout = date:now_diff(7, {0, 0, 0}) - 60 * 5,
	  NewState = set_state_timeout(State#champion_state{round
								= 0,
							    round_status = 0,
							    step_status = 2,
							    step_status_time =
								Now + Timeout},
				       Timeout * 1000),
	  activity_global:set_and_push(16, 0, [0]),
	  cluster_dynamic_group:group_other_cast(1,
						 activity_global, set_and_push,
						 [16, 0, [0]]),
	  d_ets_lib:clear_d_ets(arena_cluster_champion_ext,
				champion_4_temp),
	  role_group:apply(world,
			   {arena_cluster_champion, push_top_three, []}),
	  cluster_dynamic_group:group_other_cast(1, role_group,
						 apply,
						 [world,
						  {arena_cluster_champion,
						   push_top_three, []}]),
	  notice_msg(champion_end, #{}),
	  cluster_dynamic_group:group_other_cast(1,
						 arena_cluster_champion_mgr,
						 notice_msg,
						 [champion_end, NewState]),
	  ets:delete_all_objects(arena_cluster_champion_formation),
	  ets:delete_all_objects(arena_cluster_champion_formation_info),
	  save_state(champion_end, NewState),
	  continue(champion_end, NewState);
      _ ->
	  NewState = State#champion_state{round = Round + 1,
					  round_status = 1},
	  notice_msg(champion_round_start, NewState),
	  cluster_dynamic_group:group_other_cast(1,
						 arena_cluster_champion_mgr,
						 notice_msg,
						 [champion_round_start,
						  NewState]),
	  put(pk_list, []),
	  self() ! load_pk_info,
	  gen_next_champion_pk(NewState),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr877, _,
	     {__Levelarena_cluster_champion_mgr877,
	      __Tracesarena_cluster_champion_mgr877}}
		when __Levelarena_cluster_champion_mgr877 band 64 /= 0
		       orelse __Tracesarena_cluster_champion_mgr877 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_champion_mgr},
			      {function, champion_fight}, {line, 877},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("32强进入下回合,step:~w, round:~w",
					   [Step, Round + 1]),
			     none, 4096, 64,
			     __Levelarena_cluster_champion_mgr877,
			     __Tracesarena_cluster_champion_mgr877, lager_event,
			     __Pidarena_cluster_champion_mgr877);
	    _ -> ok
	  end,
	  Timeout =
	      arena_cluster_champion_data:get_const(time_champion_ready),
	  continue(champion_ready,
		   set_state_timeout(NewState, Timeout * 1000))
    end;
champion_fight(_Any, State) ->
    continue(champion_fight, State).

champion_end(timeout, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr886, _,
       {__Levelarena_cluster_champion_mgr886,
	__Tracesarena_cluster_champion_mgr886}}
	  when __Levelarena_cluster_champion_mgr886 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr886 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, champion_end}, {line, 886},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("周冠军赛结束,信息清理处理", []), none, 4096, 64,
		       __Levelarena_cluster_champion_mgr886,
		       __Tracesarena_cluster_champion_mgr886, lager_event,
		       __Pidarena_cluster_champion_mgr886);
      _ -> ok
    end,
    [combat_replay_mgr:dec_replay_reference(ReplayId)
     || {ReplayId}
	    <- ets:tab2list(arena_cluster_champion_replay)],
    d_ets_lib:clear_d_ets(arena_cluster_champion_replay),
    [d_ets_lib:clear_d_ets(arena_cluster_champion_ext,
			   {champion_32, Group})
     || Group <- lists:seq(1, 8)],
    d_ets_lib:clear_d_ets(arena_cluster_champion_ext,
			  champion_4),
    d_ets_lib:clear_d_ets(arena_cluster_champion_bet),
    d_ets_lib:clear_d_ets(arena_cluster_champion_pk),
    d_ets_lib:clear_d_ets(arena_cluster_champion_role_log),
    d_ets_lib:clear_d_ets(arena_cluster_champion_role),
    ets:delete_all_objects(arena_cluster_champion_rank),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr896, _,
       {__Levelarena_cluster_champion_mgr896,
	__Tracesarena_cluster_champion_mgr896}}
	  when __Levelarena_cluster_champion_mgr896 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr896 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, champion_end}, {line, 896},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("周冠军赛结束,信息清理处理完成", []), none, 4096, 64,
		       __Levelarena_cluster_champion_mgr896,
		       __Tracesarena_cluster_champion_mgr896, lager_event,
		       __Pidarena_cluster_champion_mgr896);
      _ -> ok
    end,
    Timeout = date:now_diff(7,
			    arena_cluster_champion_data:get_const(time_score_start)),
    NewState = set_state_timeout(State#champion_state{step =
							  0,
						      step_status = 0,
						      season_start_time = 0,
						      season_end_time = 0,
						      step_status_time = 0},
				 Timeout * 1000),
    save_state(idle, NewState),
    self() ! init_next_season_time,
    self() ! {notify_state, 1},
    continue(idle, NewState);
champion_end(_Any, State) ->
    continue(champion_end, State).

init_robot(Rank, N, BasePower, BaseLev, BaseScore)
    when Rank =< 256 ->
    RobotType =
	arena_cluster_champion_data:get_robot_type(BasePower),
    case arena_cluster_champion_data:get_robot({RobotType,
						N})
	of
      Data = #{robot := _RobotIds,
	       robot_power := _RobotPowers, robot_lev := _RobotLevs,
	       score := Score} ->
	  R = gen_robot_champion_role(Data, BasePower, BaseLev,
				      Rank, N, max(0, BaseScore - Score)),
	  d_ets_lib:save_ets(arena_cluster_champion_role, R),
	  ets:insert(arena_cluster_champion_rank,
		     #arena_champion_rank{rank = Rank, old_rank = Rank,
					  score = R#arena_champion_role.score,
					  id = {N, <<>>}}),
	  init_robot(Rank + 1, N + 1, BasePower, BaseLev,
		     BaseScore);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr916, _,
	     {__Levelarena_cluster_champion_mgr916,
	      __Tracesarena_cluster_champion_mgr916}}
		when __Levelarena_cluster_champion_mgr916 band 8 /= 0
		       orelse __Tracesarena_cluster_champion_mgr916 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_champion_mgr},
			      {function, init_robot}, {line, 916},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("查找不到机器人数据:rank:~w, id:~w",
					   [Rank, N]),
			     none, 4096, 8,
			     __Levelarena_cluster_champion_mgr916,
			     __Tracesarena_cluster_champion_mgr916, lager_event,
			     __Pidarena_cluster_champion_mgr916);
	    _ -> ok
	  end
    end;
init_robot(_Rank, _N, _BasePower, _BaseLev,
	   _BaseScore) ->
    ok.

gen_robot_champion_role(#{robot := RobotIds,
			  robot_power := RobotPowers, robot_lev := RobotLevs},
			BasePower, BaseLev, Rank, N, BaseScore) ->
    Score =
	round(arena_cluster_champion_data:get_const(score_arg) *
		BaseScore
		/ 1000),
    {MinRatio, MaxRatio} = util:rand_list(RobotPowers),
    PowerRatio = util:rand(MinRatio, MaxRatio),
    Power = round(BasePower * PowerRatio / 1000),
    Name1 = util:rand_list(random_name_data:arena_list(1)),
    Name2 = util:rand_list(random_name_data:arena_list(2)),
    Name3 = util:rand_list(random_name_data:arena_list(3)),
    Name = <<Name1/binary, Name2/binary, Name3/binary>>,
    Sex = util:rand(0, 1),
    Face =
	util:rand_list(arena_cluster_champion_data:get_const(face_list)),
    LookId =
	util:rand_list(arena_cluster_champion_data:get_const(look_list)),
    RobotId = util:rand_list(RobotIds),
    {MinLev, MaxLev} = util:rand_list(RobotLevs),
    Lev = min(max(10, BaseLev + util:rand(MinLev, MaxLev)),
	      role_career_data:get_const(max_lev)),
    Group = (Rank - 1) rem 1 + 1,
    #arena_champion_role{id = {N, <<>>}, name = Name,
			 sex = Sex, face = Face, old_rank = Rank, rank = Rank,
			 robot_id = RobotId, power = Power, max_power = Power,
			 lookid = LookId, group = Group, lev = Lev,
			 old_score = BaseScore, score = Score}.

score_match(State) ->
    put(pk_list, []),
    self() ! load_pk_info,
    L1 = ets:tab2list(arena_cluster_champion_role),
    L = util:keys_sort([#arena_champion_role.power,
			#arena_champion_role.max_power],
		       L1),
    score_match_group(1, State, L).

score_match_group(N, State, L = [_ | _]) when N =< 8 ->
    {L1, L2} = lists:partition(fun
				 (#arena_champion_role{group = Group}) ->
				     N =:= Group
			       end,
			       L),
    do_score_match_group(L1, L1, 1, State),
    score_match_group(N + 1, State, L2);
score_match_group(_N, _State, _L) -> ok.

do_score_match_group([], _L, _Rank, _State) -> ok;
do_score_match_group([R = #arena_champion_role{id = Id}
		      | T],
		     L, Rank, State = #champion_state{round = Round}) ->
    #{rank := Ranks} =
	arena_cluster_champion_data:get_score_match({Round,
						     Rank}),
    {MinRank, MaxRank} = util:rand_list(Ranks),
    PKRoleIds = case arena_cluster_champion_lib:get_pk(Id)
		    of
		  {ok, #champion_pk{b_id = LastId, pk_rlist = PkList1}} ->
		      [LastId | PkList1];
		  _ -> []
		end,
    R2 = case do_score_match_find(L, MinRank, MaxRank,
				  [get({matched, Id}), Id | PKRoleIds], [], 1)
	     of
	   undefined ->
	       case {whereis(lager_event), whereis(lager_event),
		     lager_config:get({lager_event, loglevel}, {0, []})}
		   of
		 {undefined, undefined, _} ->
		     fun () -> {error, lager_not_running} end();
		 {undefined, _, _} ->
		     fun () -> {error, {sink_not_configured, lager_event}}
		     end();
		 {__Pidarena_cluster_champion_mgr963, _,
		  {__Levelarena_cluster_champion_mgr963,
		   __Tracesarena_cluster_champion_mgr963}}
		     when __Levelarena_cluster_champion_mgr963 band 8 /= 0
			    orelse
			    __Tracesarena_cluster_champion_mgr963 /= [] ->
		     lager:do_log(error,
				  [{module, arena_cluster_champion_mgr},
				   {function, do_score_match_group},
				   {line, 963}, {pid, pid_to_list(self())},
				   {node, node()}
				   | lager:md()],
				  io_lib:format("根据配置无法匹配到玩家,id=~w rank=~w, min_rank=~w, "
						"max_rank=~w, round=~w pkroleid=~w",
						[Id, Rank, MinRank, MaxRank,
						 Round, PKRoleIds]),
				  none, 4096, 8,
				  __Levelarena_cluster_champion_mgr963,
				  __Tracesarena_cluster_champion_mgr963,
				  lager_event,
				  __Pidarena_cluster_champion_mgr963);
		 _ -> ok
	       end,
	       util:rand_list(L);
	   GetR -> GetR
	 end,
    PK = convert_pk(State, 1, 0, 0, 0, R, R2),
    d_ets_lib:save_ets(arena_cluster_champion_pk,
		       PK#champion_pk{pk_rlist = PKRoleIds}),
    do_score_match_group(T, L, Rank + 1, State).

do_score_match_find([], _Min, _Max, _ExcludeRoleIds, L,
		    _Rank) ->
    util:rand_list(L);
do_score_match_find([R = #arena_champion_role{id = Id}
		     | T],
		    Min, Max, ExcludeRoleIds, L, Rank)
    when Rank >= Min andalso Rank =< Max ->
    case lists:member(Id, ExcludeRoleIds) of
      true ->
	  do_score_match_find(T, Min, Max, ExcludeRoleIds, L,
			      Rank + 1);
      false ->
	  do_score_match_find(T, Min, Max, ExcludeRoleIds,
			      [R | L], Rank + 1)
    end;
do_score_match_find([_ | T], Min, Max, ExcludeRoleIds,
		    L, Rank) ->
    do_score_match_find(T, Min, Max, ExcludeRoleIds, L,
			Rank + 1).

convert_pk(#champion_state{step = Step, round = Round},
	   IsGuess, Group, APos, BPos,
	   #arena_champion_role{id = Id, name = Name,
				power = Power, max_power = MaxPower, lev = Lev,
				gid = Gid, gname = Gname, face = Face,
				avatar_id = AvatarId, sex = Sex,
				robot_id = RobotId},
	   #arena_champion_role{id = Id2, name = Name2, lev = Lev2,
				power = Power2, max_power = MaxPower2,
				robot_id = RobotId2, sex = Sex2, gid = Gid2,
				gname = Gname2, face = Face2,
				avatar_id = AvatarId2}) ->
    put({matched, Id2}, Id),
    put({pos, Group, APos}, Id),
    put(pk_list, [Id | get(pk_list)]),
    #champion_pk{id = Id, group = Group, is_guess = IsGuess,
		 a_pos = APos, a_id = Id, a_name = Name, a_lev = Lev,
		 a_power = Power, a_max_power = MaxPower, a_gid = Gid,
		 a_gname = Gname, a_face = Face, a_avatar_id = AvatarId,
		 a_sex = Sex, a_robot_id = RobotId, b_pos = BPos,
		 b_id = Id2, b_name = Name2, b_lev = Lev2,
		 b_power = Power2, b_max_power = MaxPower2, b_sex = Sex2,
		 b_robot_id = RobotId2, b_gid = Gid2, b_gname = Gname2,
		 b_face = Face2, b_avatar_id = AvatarId2,
		 diff_power = abs(Power - Power2), step = Step,
		 round = Round}.

champion_match(Num, Group, State) ->
    put(pk_list, []),
    self() ! load_pk_info,
    RL0 = arena_cluster_champion_lib:list_rank(Num),
    RL = util:shuffle(RL0),
    {L1, L2} = lists:partition(fun
				 (#arena_champion_role{rank = Rank}) ->
				     Rank rem 2 =:= 1
			       end,
			       RL),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr996, _,
       {__Levelarena_cluster_champion_mgr996,
	__Tracesarena_cluster_champion_mgr996}}
	  when __Levelarena_cluster_champion_mgr996 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr996 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, champion_match}, {line, 996},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("获取~w强数据:~w:~w",
				     [Num, length(L1), length(L2)]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr996,
		       __Tracesarena_cluster_champion_mgr996, lager_event,
		       __Pidarena_cluster_champion_mgr996);
      _ -> ok
    end,
    do_champion_match(L1, L2, 1, State, [{Group, []}]).

do_champion_match([], [], _, _State, L) -> L;
do_champion_match(L1, L2, 9, State, L) ->
    do_champion_match(L1, L2, 1, State,
		      [{length(L) + 1, []} | L]);
do_champion_match([R1 = #arena_champion_role{id = Id1,
					     name = Name1, sex = Sex1,
					     lev = Lev1, face = Face1,
					     max_power = MaxPower1,
					     face_update_time = FaceUpdateTime1,
					     face_file = FaceFile1}
		   | T1],
		  [R2 = #arena_champion_role{id = Id2, name = Name2,
					     sex = Sex2, face = Face2,
					     lev = Lev2, max_power = MaxPower2,
					     face_update_time = FaceUpdateTime2,
					     face_file = FaceFile2}
		   | T2],
		  N, State, [{Group, L1} | T]) ->
    PK1 = #champion_32_pk{id = Id1, name = Name1,
			  lev = Lev1, sex = Sex1, face = Face1, pos = N,
			  max_power = MaxPower1,
			  face_update_time = FaceUpdateTime1,
			  face_file = FaceFile1},
    PK2 = #champion_32_pk{id = Id2, name = Name2,
			  lev = Lev2, sex = Sex2, face = Face2, pos = N + 1,
			  max_power = MaxPower2,
			  face_update_time = FaceUpdateTime2,
			  face_file = FaceFile2},
    d_ets_lib:save_ets(arena_cluster_champion_pk,
		       convert_pk(State, 1, Group, N, N + 1, R1, R2)),
    d_ets_lib:save_ets(arena_cluster_champion_pk,
		       convert_pk(State, 0, Group, N + 1, N, R2, R1)),
    do_champion_match(T1, T2, N + 2, State,
		      [{Group, [PK2, PK1 | L1]} | T]).

champion_match2(Num, Group, State) ->
    put(pk_list, []),
    self() ! load_pk_info,
    RL08 = arena_cluster_champion_lib:list_rank(1, 8),
    RL8 = util:shuffle(RL08),
    RL0 = arena_cluster_champion_lib:list_rank(9, Num),
    RL = util:shuffle(RL0),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr1017, _,
       {__Levelarena_cluster_champion_mgr1017,
	__Tracesarena_cluster_champion_mgr1017}}
	  when __Levelarena_cluster_champion_mgr1017 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr1017 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, champion_match2}, {line, 1017},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("获取~w强数据:~w:~w",
				     [Num, length(RL8), length(RL)]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr1017,
		       __Tracesarena_cluster_champion_mgr1017, lager_event,
		       __Pidarena_cluster_champion_mgr1017);
      _ -> ok
    end,
    do_champion_match2(RL8, RL, State, Group, []).

do_champion_match2([], [], _State, _Group, L) -> L;
do_champion_match2([R1 | L1],
		   [R2, R3, R4, R5, R6, R7, R8 | L2], State, Group, T) ->
    RandList = util:shuffle([R1, R2, R3, R4, R5, R6, R7,
			     R8]),
    {T1, T2} = list_util:split(4, RandList),
    T3 = do_champion_match(T1, T2, 1, State, [{Group, []}]),
    do_champion_match2(L1, L2, State, Group + 1, T3 ++ T).

gen_next_champion_pk(State = #champion_state{step =
						 64}) ->
    [do_gen_next_champion_pk(Group, State,
			     arena_cluster_champion_lib:get_ext({champion_32_temp,
								 Group},
								[]),
			     State)
     || Group <- lists:seq(1, 8)];
gen_next_champion_pk(State) ->
    do_gen_next_champion_pk(0, State,
			    arena_cluster_champion_lib:get_ext(champion_4_temp,
							       []),
			    State).

do_gen_next_champion_pk(Group, State, L,
			#champion_state{step = Step, round = Round}) ->
    PosL = step_round_combat_pos(Step, Round),
    [do_gen_next_champion_pk_(Group, State, Pos1,
			      lists:keyfind(Pos1, #champion_32_pk.pos, L), Pos2,
			      lists:keyfind(Pos2, #champion_32_pk.pos, L), L)
     || {Pos1, Pos2} <- PosL].

do_gen_next_champion_pk_(Group, State, Pos1,
			 #champion_32_pk{id = Id1}, Pos2,
			 #champion_32_pk{id = Id2}, _L) ->
    {ok, R1} = arena_cluster_champion_lib:get_role(Id1),
    {ok, R2} = arena_cluster_champion_lib:get_role(Id2),
    d_ets_lib:save_ets(arena_cluster_champion_pk,
		       convert_pk(State, 1, Group, Pos1, Pos2, R1, R2)),
    d_ets_lib:save_ets(arena_cluster_champion_pk,
		       convert_pk(State, 0, Group, Pos2, Pos1, R2, R1));
do_gen_next_champion_pk_(_Group, _State, _Pos1, _R1,
			 _Pos2, _R2, L) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr1041, _,
       {__Levelarena_cluster_champion_mgr1041,
	__Tracesarena_cluster_champion_mgr1041}}
	  when __Levelarena_cluster_champion_mgr1041 band 8 /= 0
		 orelse __Tracesarena_cluster_champion_mgr1041 /= [] ->
	  lager:do_log(error,
		       [{module, arena_cluster_champion_mgr},
			{function, do_gen_next_champion_pk_}, {line, 1041},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("产生PK信息失败：group:~w ~w:~w pk ~w:~w, list=~w",
				     [_Group, _Pos1, _R1, _Pos2, _R2, L]),
		       none, 4096, 8, __Levelarena_cluster_champion_mgr1041,
		       __Tracesarena_cluster_champion_mgr1041, lager_event,
		       __Pidarena_cluster_champion_mgr1041);
      _ -> ok
    end.

update_rank(ArenaRole = #arena_champion_role{rank =
						 1 = Rank,
					     old_rank = OldRank, id = RoleId,
					     score = Score,
					     score_32 = Score32}) ->
    d_ets_lib:save_ets(arena_cluster_champion_role,
		       ArenaRole),
    ets:insert(arena_cluster_champion_rank,
	       #arena_champion_rank{rank = Rank, old_rank = OldRank,
				    id = RoleId, score = Score,
				    score_32 = Score32});
update_rank(ArenaRole = #arena_champion_role{rank =
						 Rank,
					     old_rank = OldRank, score = Score,
					     score_32 = Score32,
					     id = RoleId}) ->
    case ets:lookup(arena_cluster_champion_rank, Rank - 1)
	of
      [#arena_champion_rank{id = RoleId2, score = Score2,
			    score_32 = Score32_2, old_rank = OldRank2}]
	  when Score + Score32 > Score2 + Score32_2 orelse
		 Score + Score32 =:= Score2 + Score32_2 andalso
		   OldRank2 > OldRank ->
	  ets:insert(arena_cluster_champion_rank,
		     #arena_champion_rank{rank = Rank, id = RoleId2,
					  old_rank = OldRank2, score = Score2,
					  score_32 = Score32_2}),
	  ets:update_element(arena_cluster_champion_role, RoleId2,
			     {#arena_champion_role.rank, Rank}),
	  update_rank(ArenaRole#arena_champion_role{rank =
							Rank - 1});
      _ ->
	  d_ets_lib:save_ets(arena_cluster_champion_role,
			     ArenaRole),
	  ets:insert(arena_cluster_champion_rank,
		     #arena_champion_rank{rank = Rank, old_rank = OldRank,
					  id = RoleId, score = Score,
					  score_32 = Score32})
    end.

score_pre_load_combat_fighter(Round) ->
    L = ets:match_object(arena_cluster_champion_pk,
			 #champion_pk{ret = 0, round = Round, _ = '_'}),
    [begin
       do_pre_load_combat_fighter(AId),
       do_pre_load_combat_fighter(BId)
     end
     || #champion_pk{a_id = AId, b_id = BId} <- L],
    ok.

do_pre_load_combat_fighter({_, <<>>}) -> skip;
do_pre_load_combat_fighter({Rid, SrvId}) ->
    role_lib:cast(by_id, {Rid, SrvId},
		  {arena_cluster_champion_mgr,
		   apply_pre_load_combat_fighter, []});
do_pre_load_combat_fighter(_) -> ok.

update_combat_fighter(Robot = #role_robot{id = RoleId,
					  name = Name}) ->
    case catch ets:member(arena_cluster_champion_formation,
			  RoleId)
	of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1078, _,
	     {__Levelarena_cluster_champion_mgr1078,
	      __Tracesarena_cluster_champion_mgr1078}}
		when __Levelarena_cluster_champion_mgr1078 band 64 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1078 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_champion_mgr},
			      {function, update_combat_fighter}, {line, 1078},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~ts=== update_combat_fighter",
					   [Name]),
			     none, 4096, 64,
			     __Levelarena_cluster_champion_mgr1078,
			     __Tracesarena_cluster_champion_mgr1078,
			     lager_event, __Pidarena_cluster_champion_mgr1078);
	    _ -> ok
	  end,
	  gen_fight_objects(Robot);
      _ -> skip
    end.

apply_pre_load_combat_fighter(Role) ->
    sync_role(Role, power),
    case role_robot:sync_role(Role) of
      {ok, Robot} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1087, _,
	     {__Levelarena_cluster_champion_mgr1087,
	      __Tracesarena_cluster_champion_mgr1087}}
		when __Levelarena_cluster_champion_mgr1087 band 64 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1087 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_champion_mgr},
			      {function, apply_pre_load_combat_fighter},
			      {line, 1087}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~ts=== apply_pre_load_combat_fighter",
					   [Role#role.name]),
			     none, 4096, 64,
			     __Levelarena_cluster_champion_mgr1087,
			     __Tracesarena_cluster_champion_mgr1087,
			     lager_event, __Pidarena_cluster_champion_mgr1087);
	    _ -> ok
	  end,
	  gen_fight_objects(Robot);
      _ -> skip
    end,
    ok.

score_combat(Round) ->
    GuessId = get(guess_roleid),
    L = ets:match_object(arena_cluster_champion_pk,
			 #champion_pk{ret = 0, round = Round, _ = '_'}),
    put(combat_num, length(L)),
    GmCmd = get(gm_combat_info),
    [spawn(fun () ->
		   do_score_combat_(R, GuessId, Round, GmCmd)
	   end)
     || R <- L].

do_score_combat_(#champion_pk{a_id = {_, <<>>} = Id},
		 GuessId, Round, _GmCmd)
    when Id =/= GuessId ->
    ets:delete(arena_cluster_champion_pk, Id),
    case util:rand(1, 1000) > 500 of
      true -> info({add_score, Id, 0});
      _ ->
	  #{score := AddScoreT} =
	      arena_cluster_champion_data:get_score_match({Round, 1}),
	  AddScore = round(AddScoreT *
			     arena_cluster_champion_data:get_const(robot_win_score)
			     * 1.0e-3),
	  info({add_score, Id, AddScore})
    end;
do_score_combat_(R = #champion_pk{a_id = Id,
				  a_name = Name, b_name = TarName,
				  a_max_power = Power1, b_max_power = Power2},
		 _GuessId, Round, GmCmd) ->
    {AFormationType, AFormationLev, AtkList} =
	gen_fight_objects(Id),
    {BFormationType, BFormationLev, DefList} =
	gen_fight_objects(R),
    ReplayInfo0 = replay_hall:convert(#replay_info{ext =
						       [{is_guess,
							 Id =:=
							   get(guess_roleid)}]},
				      a, R,
				      #{formation_type => AFormationType}),
    ReplayInfo1 = replay_hall:convert(ReplayInfo0, b, R,
				      #{formation_type => BFormationType}),
    ReplayInfo = ReplayInfo1#replay_info{sec_type =
					     100 + Round},
    Args = #{on_role_combat_end =>
		 {arena_cluster_champion_mgr, async_fun_combat_over,
		  [{score, Id, Name}]},
	     is_robot => 1, target_role_name => TarName,
	     formation =>
		 [{1, AFormationType, AFormationLev},
		  {2, BFormationType, BFormationLev}],
	     ext_args => [{save_replay, true}],
	     replay_info => ReplayInfo, attack_power => Power1,
	     defend_power => Power2},
    CombatRoles = [#combat_role{id =
				    {0, sys_env:get(server_id)},
				name = Name, pid = self()}],
    case combat_lib:start_pk(31, AtkList, DefList,
			     CombatRoles, Args)
	of
      {ok, ComPid} ->
	  case GmCmd of
	    undefined -> skip;
	    _ -> erlang:send_after(20, ComPid, GmCmd)
	  end;
      _Err ->
	  arena_cluster_champion_mgr:apply({arena_cluster_champion_mgr,
					    async_fun_combat_over,
					    [#combat{type = 31},
					     #combat_result{result = 1,
							    replay_info =
								[{<<>>, 0}]},
					     {score, Id, Name}]}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1123, _,
	     {__Levelarena_cluster_champion_mgr1123,
	      __Tracesarena_cluster_champion_mgr1123}}
		when __Levelarena_cluster_champion_mgr1123 band 8 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1123 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_champion_mgr},
			      {function, do_score_combat_}, {line, 1123},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w=start_combat_err===>~w",
					   [Id, _Err]),
			     none, 4096, 8,
			     __Levelarena_cluster_champion_mgr1123,
			     __Tracesarena_cluster_champion_mgr1123,
			     lager_event, __Pidarena_cluster_champion_mgr1123);
	    _ -> ok
	  end
    end.

champion_pre_load_combat_fighter(State =
				     #champion_state{step = 64}) ->
    [do_champion_pre_load_combat_fighter(Group,
					 arena_cluster_champion_lib:get_ext({champion_32_temp,
									     Group},
									    []),
					 State)
     || Group <- lists:seq(1, 8)];
champion_pre_load_combat_fighter(State) ->
    do_champion_pre_load_combat_fighter(0,
					arena_cluster_champion_lib:get_ext(champion_4_temp,
									   []),
					State).

do_champion_pre_load_combat_fighter(_Group, L,
				    #champion_state{step = Step,
						    round = Round}) ->
    PosL = step_round_combat_pos(Step, Round),
    [begin
       do_champion_pre_load_combat_fighter_(lists:keyfind(Pos1,
							  #champion_32_pk.pos,
							  L)),
       do_champion_pre_load_combat_fighter_(lists:keyfind(Pos2,
							  #champion_32_pk.pos,
							  L))
     end
     || {Pos1, Pos2} <- PosL].

do_champion_pre_load_combat_fighter_(#champion_32_pk{id
							 = Id}) ->
    do_pre_load_combat_fighter(Id);
do_champion_pre_load_combat_fighter_(_) -> ok.

champion_combat(State = #champion_state{step = 64}) ->
    [do_champion_combat(Group,
			arena_cluster_champion_lib:get_ext({champion_32_temp,
							    Group},
							   []),
			State)
     || Group <- lists:seq(1, 8)];
champion_combat(State) ->
    do_champion_combat(0,
		       arena_cluster_champion_lib:get_ext(champion_4_temp, []),
		       State).

do_champion_combat(Group, L,
		   #champion_state{step = Step, round = Round}) ->
    PosL = step_round_combat_pos(Step, Round),
    put(combat_num, get(combat_num) + length(PosL)),
    GmCmd = get(gm_combat_info),
    [spawn(fun () ->
		   do_champion_combat_(Group, Step, Round,
				       lists:keyfind(Pos1, #champion_32_pk.pos,
						     L),
				       lists:keyfind(Pos2, #champion_32_pk.pos,
						     L),
				       GmCmd)
	   end)
     || {Pos1, Pos2} <- PosL].

do_champion_combat_(Group, Step, Round,
		    R1 = #champion_32_pk{pos = Pos1, id = Id1, name = Name1,
					 max_power = Power1},
		    R2 = #champion_32_pk{pos = Pos2, id = Id2, name = Name2,
					 max_power = Power2},
		    GmCmd) ->
    {AFormationType, AFormationLev, AtkList} =
	gen_fight_objects(Id1),
    {BFormationType, BFormationLev, DefList} =
	gen_fight_objects(Id2),
    {ASpriteLev, ASprites} = get_sprite_info(AtkList),
    {BSpriteLev, BSprites} = get_sprite_info(DefList),
    ReplayInfo0 = replay_hall:convert(#replay_info{ext =
						       [{is_guess,
							 lists:member(get(guess_roleid),
								      [Id1,
								       Id2])}]},
				      a, R1,
				      #{formation_type => AFormationType,
					sprite_lev => ASpriteLev,
					sprites => ASprites}),
    ReplayInfo1 = replay_hall:convert(ReplayInfo0, b, R2,
				      #{formation_type => BFormationType,
					sprite_lev => BSpriteLev,
					sprites => BSprites}),
    ReplayInfo = ReplayInfo1#replay_info{sec_type =
					     Step * 100 + Round},
    Args = #{on_role_combat_end =>
		 {arena_cluster_champion_mgr, async_fun_combat_over,
		  [{champion, Group, Pos1, Pos2}]},
	     is_robot => 1, target_role_name => Name2,
	     formation =>
		 [{1, AFormationType, AFormationLev},
		  {2, BFormationType, BFormationLev}],
	     ext_args => [{save_replay, true}],
	     replay_info => ReplayInfo, attack_power => Power1,
	     defend_power => Power2},
    CombatRoles = [#combat_role{id =
				    {0, sys_env:get(server_id)},
				name = Name1, pid = self()}],
    case combat_lib:start_pk(31, AtkList, DefList,
			     CombatRoles, Args)
	of
      {ok, ComPid} ->
	  case GmCmd of
	    undefined -> skip;
	    _ -> erlang:send_after(20, ComPid, GmCmd)
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
	    {__Pidarena_cluster_champion_mgr1167, _,
	     {__Levelarena_cluster_champion_mgr1167,
	      __Tracesarena_cluster_champion_mgr1167}}
		when __Levelarena_cluster_champion_mgr1167 band 8 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1167 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_champion_mgr},
			      {function, do_champion_combat_}, {line, 1167},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w pk ~w=start_combat_err===>~w",
					   [Id1, Id2, _Err]),
			     none, 4096, 8,
			     __Levelarena_cluster_champion_mgr1167,
			     __Tracesarena_cluster_champion_mgr1167,
			     lager_event, __Pidarena_cluster_champion_mgr1167);
	    _ -> ok
	  end
    end;
do_champion_combat_(_Group, _Step, _Round, _R1, _R2,
		    _GmCmd) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr1170, _,
       {__Levelarena_cluster_champion_mgr1170,
	__Tracesarena_cluster_champion_mgr1170}}
	  when __Levelarena_cluster_champion_mgr1170 band 8 /= 0
		 orelse __Tracesarena_cluster_champion_mgr1170 /= [] ->
	  lager:do_log(error,
		       [{module, arena_cluster_champion_mgr},
			{function, do_champion_combat_}, {line, 1170},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("发起战斗失败：group:~w step:~w round:~w ~w "
				     "pk ~w",
				     [_Group, _Step, _Round, _R1, _R2]),
		       none, 4096, 8, __Levelarena_cluster_champion_mgr1170,
		       __Tracesarena_cluster_champion_mgr1170, lager_event,
		       __Pidarena_cluster_champion_mgr1170);
      _ -> ok
    end.

get_sprite_info(AtkList) ->
    case [FO
	  || FO = #fight_object{object_type = 5} <- AtkList]
	of
      [#fight_object{lev = Lev, sprites = Sprites}] ->
	  {Lev, Sprites};
      _ -> {0, []}
    end.

champion_combat_check(State = #champion_state{step =
						  64}) ->
    [do_champion_combat_check(Group, State,
			      arena_cluster_champion_lib:get_ext({champion_32_temp,
								  Group},
								 []),
			      State)
     || Group <- lists:seq(1, 8)],
    [d_ets_lib:save_ets(arena_cluster_champion_ext,
			{{champion_32, Group},
			 arena_cluster_champion_lib:get_ext({champion_32_temp,
							     Group},
							    [])})
     || Group <- lists:seq(1, 8)];
champion_combat_check(State) ->
    do_champion_combat_check(0, State,
			     arena_cluster_champion_lib:get_ext(champion_4_temp,
								[]),
			     State),
    d_ets_lib:save_ets(arena_cluster_champion_ext,
		       {champion_4,
			arena_cluster_champion_lib:get_ext(champion_4_temp,
							   [])}).

do_champion_combat_check(Group, State, L,
			 #champion_state{step = Step, round = Round}) ->
    PosL = step_round_combat_pos(Step, Round),
    [do_champion_combat_check_(Group, State,
			       lists:keyfind(Pos1, #champion_32_pk.pos, L),
			       lists:keyfind(Pos2, #champion_32_pk.pos, L))
     || {Pos1, Pos2} <- PosL].

do_champion_combat_check_(Group, State,
			  #champion_32_pk{pos = Pos1, ret = 0, replay_id = 0,
					  max_power = Power1},
			  #champion_32_pk{pos = Pos2, ret = 0, replay_id = 0,
					  max_power = Power2}) ->
    Result = util:if_true(Power1 >= Power2, 1, 2),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr1191, _,
       {__Levelarena_cluster_champion_mgr1191,
	__Tracesarena_cluster_champion_mgr1191}}
	  when __Levelarena_cluster_champion_mgr1191 band 8 /= 0
		 orelse __Tracesarena_cluster_champion_mgr1191 /= [] ->
	  lager:do_log(error,
		       [{module, arena_cluster_champion_mgr},
			{function, do_champion_combat_check_}, {line, 1191},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("战斗异常结束，不能正常结算,group=~w, pos1=~w, pos2=~w, "
				     "power1=~w, power2=~w, ret=~w",
				     [Group, Pos1, Pos2, Power1, Power2,
				      Result]),
		       none, 4096, 8, __Levelarena_cluster_champion_mgr1191,
		       __Tracesarena_cluster_champion_mgr1191, lager_event,
		       __Pidarena_cluster_champion_mgr1191);
      _ -> ok
    end,
    async_fun_combat_over(champion_fight, State,
			  #combat{type = 31},
			  #combat_result{result = Result,
					 replay_info = [{<<>>, 0}]},
			  {champion, Group, Pos1, Pos2});
do_champion_combat_check_(_Group, _State, _R1, _R2) ->
    ok.

dec_combat_num() ->
    case put(combat_num, util:get(combat_num, 0) - 1) of
      1 ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1200, _,
	     {__Levelarena_cluster_champion_mgr1200,
	      __Tracesarena_cluster_champion_mgr1200}}
		when __Levelarena_cluster_champion_mgr1200 band 64 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1200 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_champion_mgr},
			      {function, dec_combat_num}, {line, 1200},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "战斗统计完成", none, 4096, 64,
			     __Levelarena_cluster_champion_mgr1200,
			     __Tracesarena_cluster_champion_mgr1200,
			     lager_event, __Pidarena_cluster_champion_mgr1200);
	    _ -> ok
	  end,
	  util:set_ms_timer(combat_end_notify, 10,
			    {combat_end_notify, finish});
      _ -> pass
    end.

step_round_combat_pos(8, 1) ->
    [{1, 2}, {3, 4}, {5, 6}, {7, 8}];
step_round_combat_pos(8, 2) -> [{9, 10}, {11, 12}];
step_round_combat_pos(8, 3) -> [{13, 14}];
step_round_combat_pos(64, 1) ->
    [{1, 2}, {3, 4}, {5, 6}, {7, 8}];
step_round_combat_pos(64, 2) -> [{9, 10}, {11, 12}];
step_round_combat_pos(64, 3) -> [{13, 14}];
step_round_combat_pos(_, _) -> [].

select_guess(State = #champion_state{step = Step,
				     round = Round}) ->
    L1 = update_pk_info(State),
    MatchPerPowers =
	arena_cluster_champion_data:get_const(battel_guess),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr1219, _,
       {__Levelarena_cluster_champion_mgr1219,
	__Tracesarena_cluster_champion_mgr1219}}
	  when __Levelarena_cluster_champion_mgr1219 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr1219 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, select_guess}, {line, 1219},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("竞技信息per_power=~w, len=~w size=~w",
				     [MatchPerPowers, length(L1),
				      ets:info(arena_cluster_champion_role,
					       size)]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr1219,
		       __Tracesarena_cluster_champion_mgr1219, lager_event,
		       __Pidarena_cluster_champion_mgr1219);
      _ -> ok
    end,
    L2 = [R || R = #champion_pk{is_guess = 1} <- L1],
    #champion_pk{a_id = RoleId, a_name = AName,
		 group = Group, b_name = BName, a_pos = Pos,
		 a_power = APower, b_power = BPower,
		 diff_power = DiffPower} =
	do_select_guess_range_per_power(MatchPerPowers, L2),
    Id = Step * 10 + Round,
    GuessInfo = {Group, Pos, Id, RoleId},
    put(guess_roleid, RoleId),
    put(guess_id, Id),
    put(guess_info, GuessInfo),
    put(guess_a_bet, 0),
    put(guess_b_bet, 0),
    put(guess_list, []),
    d_ets_lib:save_ets(arena_cluster_champion_ext,
		       {guess_id, [RoleId, Id]}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr1240, _,
       {__Levelarena_cluster_champion_mgr1240,
	__Tracesarena_cluster_champion_mgr1240}}
	  when __Levelarena_cluster_champion_mgr1240 band 64 /= 0
		 orelse __Tracesarena_cluster_champion_mgr1240 /= [] ->
	  lager:do_log(info,
		       [{module, arena_cluster_champion_mgr},
			{function, select_guess}, {line, 1240},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("本次竞猜信息:~w diff_power:~w, a_power:~w, "
				     "b_power:~w a_name=~ts b_name=~ts",
				     [GuessInfo, DiffPower, APower, BPower,
				      AName, BName]),
		       none, 4096, 64, __Levelarena_cluster_champion_mgr1240,
		       __Tracesarena_cluster_champion_mgr1240, lager_event,
		       __Pidarena_cluster_champion_mgr1240);
      _ -> ok
    end.

not_robot({_, SrvId}) -> not_robot(SrvId);
not_robot(<<>>) -> false;
not_robot(<<"robot">>) -> false;
not_robot(_) -> true.

do_select_guess_range_per_power([], L) ->
    case do_select_guess_min_power(L, 0, 0, 9999999999,
				   null)
	of
      null ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1251, _,
	     {__Levelarena_cluster_champion_mgr1251,
	      __Tracesarena_cluster_champion_mgr1251}}
		when __Levelarena_cluster_champion_mgr1251 band 64 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1251 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_champion_mgr},
			      {function, do_select_guess_range_per_power},
			      {line, 1251}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("没有找到双方都满5个英雄的队伍，只能不管队伍人数了", []),
			     none, 4096, 64,
			     __Levelarena_cluster_champion_mgr1251,
			     __Tracesarena_cluster_champion_mgr1251,
			     lager_event, __Pidarena_cluster_champion_mgr1251);
	    _ -> ok
	  end,
	  case [PK
		|| PK = #champion_pk{a_id = Aid, b_id = Bid} <- L,
		   not_robot(Aid) orelse not_robot(Bid)]
	      of
	    L2 = [_ | _] ->
		do_select_guess_min_power2(L2, 0, 0, 9999999999, null);
	    _ ->
		do_select_guess_min_power2(L, 0, 0, 9999999999, null)
	  end;
      R -> R
    end;
do_select_guess_range_per_power([{MinPerPower,
				  MaxPerPower}
				 | T],
				L) ->
    case [PK
	  || PK = #champion_pk{is_guess = 1,
			       diff_power = DiffPower, a_plist = APlist,
			       b_plist = BPlist, a_power = APower,
			       b_power = BPower}
		 <- L,
	     length(APlist) >= 5, length(BPlist) >= 5,
	     MinPerPower =< DiffPower * 1000 / max(APower, BPower),
	     MaxPerPower >= DiffPower * 1000 / max(APower, BPower)]
	of
      [] -> do_select_guess_range_per_power(T, L);
      [R1 | _] = L1 ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1269, _,
	     {__Levelarena_cluster_champion_mgr1269,
	      __Tracesarena_cluster_champion_mgr1269}}
		when __Levelarena_cluster_champion_mgr1269 band 64 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1269 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_champion_mgr},
			      {function, do_select_guess_range_per_power},
			      {line, 1269}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("战力匹配符合组:~w", [length(L1)]), none,
			     4096, 64, __Levelarena_cluster_champion_mgr1269,
			     __Tracesarena_cluster_champion_mgr1269,
			     lager_event, __Pidarena_cluster_champion_mgr1269);
	    _ -> ok
	  end,
	  do_select_guess_min_star(L1, 9999999999, R1)
    end.

do_select_guess_min_star([], _DiffStar, R) -> R;
do_select_guess_min_star([R1 = #champion_pk{a_plist =
						APlist,
					    b_plist = BPlist}
			  | T],
			 DiffStar, R) ->
    AStarList = [Star || #{star := Star} <- APlist],
    BStarList = [Star || #{star := Star} <- BPlist],
    AvgAStar = lists:sum(AStarList) / length(APlist),
    AvgBStar = lists:sum(BStarList) / length(BPlist),
    MAStar = lists:sum([abs(Star - AvgAStar)
			|| Star <- AStarList])
	       / length(APlist),
    MBStar = lists:sum([abs(Star - AvgBStar)
			|| Star <- BStarList])
	       / length(BPlist),
    DiffStar1 = abs(MAStar - MBStar),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr1284, _,
       {__Levelarena_cluster_champion_mgr1284,
	__Tracesarena_cluster_champion_mgr1284}}
	  when __Levelarena_cluster_champion_mgr1284 band 128 /= 0
		 orelse __Tracesarena_cluster_champion_mgr1284 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_cluster_champion_mgr},
			{function, do_select_guess_min_star}, {line, 1284},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("AStarList=~w AvgAStar=~w MAStar=~w BStarList="
				     "~w AvgBStar=~w MBStar=~w  Diff:~w ~w",
				     [AStarList, AvgAStar, MAStar, BStarList,
				      AvgBStar, MBStar, DiffStar1, DiffStar]),
		       none, 4096, 128, __Levelarena_cluster_champion_mgr1284,
		       __Tracesarena_cluster_champion_mgr1284, lager_event,
		       __Pidarena_cluster_champion_mgr1284);
      _ -> ok
    end,
    case DiffStar1 < DiffStar of
      true -> do_select_guess_min_star(T, DiffStar1, R1);
      _ -> do_select_guess_min_star(T, DiffStar, R)
    end.

do_select_guess_min_power([], _MinPower, _MaxPower,
			  _DiffPower, R) ->
    R;
do_select_guess_min_power([R1 = #champion_pk{is_guess =
						 1,
					     diff_power = Power,
					     a_plist = APlist, b_plist = BPlist}
			   | T],
			  MinPower, MaxPower, DiffPower, R)
    when length(APlist) >= 5 andalso length(BPlist) >= 5 ->
    DiffPower1 = min(abs(Power - MinPower),
		     abs(Power - MaxPower)),
    case DiffPower1 =< DiffPower of
      true ->
	  do_select_guess_min_power(T, MinPower, MaxPower,
				    DiffPower1, R1);
      _ ->
	  do_select_guess_min_power(T, MinPower, MaxPower,
				    DiffPower, R)
    end;
do_select_guess_min_power([_ | T], MinPower, MaxPower,
			  DiffPower, R) ->
    do_select_guess_min_power(T, MinPower, MaxPower,
			      DiffPower, R).

do_select_guess_min_power2([], _MinPower, _MaxPower,
			   _DiffPower, R) ->
    R;
do_select_guess_min_power2([R1 = #champion_pk{diff_power
						  = Power}
			    | T],
			   MinPower, MaxPower, DiffPower, R) ->
    DiffPower1 = min(abs(Power - MinPower),
		     abs(Power - MaxPower)),
    case DiffPower1 =< DiffPower of
      true ->
	  do_select_guess_min_power2(T, MinPower, MaxPower,
				     DiffPower1, R1);
      _ ->
	  do_select_guess_min_power2(T, MinPower, MaxPower,
				     DiffPower, R)
    end.

pre_load_role(RoleId) ->
    case role_lib:cast(by_id, RoleId,
		       {arena_cluster_champion_mgr, sync_role, [all]})
	of
      ignore -> role_robot:get_role(RoleId);
      _ -> pass
    end.

update_pk_info(#champion_state{step = Step,
			       round = Round}) ->
    L = ets:match_object(arena_cluster_champion_pk,
			 #champion_pk{ret = 0, step = Step, round = Round,
				      _ = '_'}),
    [do_update_pk_info(I) || I <- L].

do_update_pk_info(PK = #champion_pk{a_id = {_, <<>>},
				    b_id = {_, <<>>}, a_plist = [_ | _],
				    b_plist = [_ | _]}) ->
    PK;
do_update_pk_info(PK) ->
    NewPK = update_pk_info_b(update_pk_info_a(PK)),
    case PK of
      NewPK -> pass;
      _ ->
	  d_ets_lib:save_ets(arena_cluster_champion_pk, NewPK)
    end,
    NewPK.

update_pk_info_a(PK = #champion_pk{a_id = {_, <<>>},
				   a_plist = [_ | _]}) ->
    PK;
update_pk_info_a(PK = #champion_pk{a_id = RoleId,
				   a_robot_id = 0, a_plist = PList,
				   a_time = Time, b_power = BPower}) ->
    {ok,
     R = #arena_champion_role{power = Power,
			      max_power = MaxPower, time = Time2}} =
	arena_cluster_champion_lib:get_role(RoleId),
    case Time =:= Time2 andalso PList =/= [] of
      true -> PK;
      _ ->
	  {FormationType, FormationLev, NewPList, SpriteLev,
	   Sprites, FaceFile, FaceUpdateTime} =
	      get_formation_info(R),
	  PK#champion_pk{a_sprite_lev = SpriteLev,
			 a_sprites = Sprites, a_formation_type = FormationType,
			 a_formation_lev = FormationLev, a_plist = NewPList,
			 a_power = Power, a_max_power = MaxPower,
			 diff_power = abs(Power - BPower), a_time = Time2,
			 a_face_file = FaceFile,
			 a_face_update_time = FaceUpdateTime}
    end;
update_pk_info_a(PK = #champion_pk{a_id = ARoleId,
				   a_lev = Lev, a_robot_id = RobotId,
				   a_max_power = Power, b_power = APower}) ->
    {FormationType, FormationLev, PList, SpriteLev, Sprites,
     FaceFile, FaceUpdateTime} =
	get_formation_info({ARoleId, Lev, RobotId, Power}),
    PK#champion_pk{a_sprite_lev = SpriteLev,
		   a_sprites = Sprites, a_formation_type = FormationType,
		   a_formation_lev = FormationLev, a_plist = PList,
		   diff_power = abs(Power - APower),
		   a_face_file = FaceFile,
		   a_face_update_time = FaceUpdateTime}.

update_pk_info_b(PK = #champion_pk{b_id = {_, <<>>},
				   b_plist = [_ | _]}) ->
    PK;
update_pk_info_b(PK = #champion_pk{b_id = RoleId,
				   b_robot_id = 0, b_plist = PList,
				   b_time = Time, a_power = APower}) ->
    {ok,
     R = #arena_champion_role{power = Power,
			      max_power = MaxPower, time = Time2}} =
	arena_cluster_champion_lib:get_role(RoleId),
    case Time =:= Time2 andalso PList =/= [] of
      true -> PK;
      _ ->
	  {FormationType, FormationLev, NewPList, SpriteLev,
	   Sprites, FaceFile, FaceUpdateTime} =
	      get_formation_info(R),
	  PK#champion_pk{b_sprite_lev = SpriteLev,
			 b_sprites = Sprites, b_formation_type = FormationType,
			 b_formation_lev = FormationLev, b_plist = NewPList,
			 b_power = Power, b_max_power = MaxPower,
			 diff_power = abs(Power - APower), b_time = Time2,
			 b_face_file = FaceFile,
			 b_face_update_time = FaceUpdateTime}
    end;
update_pk_info_b(PK = #champion_pk{b_id = BRoleId,
				   b_lev = Lev, b_robot_id = RobotId,
				   b_max_power = Power, a_power = APower}) ->
    {FormationType, FormationLev, PList, SpriteLev, Sprites,
     FaceFile, FaceUpdateTime} =
	get_formation_info({BRoleId, Lev, RobotId, Power}),
    PK#champion_pk{b_sprite_lev = SpriteLev,
		   b_sprites = Sprites, b_formation_type = FormationType,
		   b_formation_lev = FormationLev, b_plist = PList,
		   diff_power = abs(Power - APower),
		   b_face_file = FaceFile,
		   b_face_update_time = FaceUpdateTime}.

get_formation_info(#arena_champion_role{id = RoleId,
					robot_id = RobotId, lev = Lev,
					max_power = MaxPower})
    when RobotId > 0 ->
    get_formation_info({RoleId, Lev, RobotId, MaxPower});
get_formation_info(#arena_champion_role{id = RoleId,
					name = Name, lev = Lev,
					max_power = MaxPower}) ->
    case role_robot:get_role(RoleId) of
      {ok, Robot} -> get_formation_info(Robot);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1373, _,
	     {__Levelarena_cluster_champion_mgr1373,
	      __Tracesarena_cluster_champion_mgr1373}}
		when __Levelarena_cluster_champion_mgr1373 band 8 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1373 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_champion_mgr},
			      {function, get_formation_info}, {line, 1373},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("获取角色阵法信息失败:~w, ~ts",
					   [RoleId, Name]),
			     none, 4096, 8,
			     __Levelarena_cluster_champion_mgr1373,
			     __Tracesarena_cluster_champion_mgr1373,
			     lager_event, __Pidarena_cluster_champion_mgr1373);
	    _ -> ok
	  end,
	  get_formation_info({RoleId, Lev, 10000, MaxPower})
    end;
get_formation_info({RoleId, Lev, RobotId, Power}) ->
    case ets:lookup(arena_cluster_champion_formation_info,
		    RoleId)
	of
      [{RoleId, FormationType, FormationLev, PList, SpriteLev,
	Sprites}] ->
	  {FormationType, FormationLev, PList, SpriteLev, Sprites,
	   <<>>, 0};
      _ ->
	  Role0 = role_data:first_init(#role{id =
						 {1, sys_env:get(server_id)},
					     type = robot}),
	  Role = Role0#role{lev = Lev},
	  #{formation := FormationType, partners := Partners,
	    fight_objects := FightObjects} =
	      robot:gen_fight_objects2(Role, RobotId,
				       #{power => Power div 5}, RoleId),
	  FormationLev = 1,
	  PList = [#{id => Pos, pos => Pos, bid => PBid,
		     lev => PLev,
		     ext_data => [{5, UseSkin}, {11, ResonateLev}],
		     quality => PQuality, star => PStar,
		     break_lev => BreakLev, hurt => 0, behurt => 0,
		     curt => 0, hp => HpMax, hp_max => HpMax,
		     power => PPower}
		   || #partner{id = Pos, resonate_lev = ResonateLev,
			       bid = PBid, lev = PLev, star = PStar,
			       quality = PQuality, break_lev = BreakLev,
			       all_attr = #attr{hp_max = HpMax},
			       use_skin = UseSkin, power = PPower}
			  <- Partners],
	  case RoleId of
	    {_, <<>>} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster_champion_mgr1388, _,
		   {__Levelarena_cluster_champion_mgr1388,
		    __Tracesarena_cluster_champion_mgr1388}}
		      when __Levelarena_cluster_champion_mgr1388 band 128 /= 0
			     orelse
			     __Tracesarena_cluster_champion_mgr1388 /= [] ->
		      lager:do_log(debug,
				   [{module, arena_cluster_champion_mgr},
				    {function, get_formation_info},
				    {line, 1388}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("机器人首次访问锁定数据处理：~w", [RoleId]),
				   none, 4096, 128,
				   __Levelarena_cluster_champion_mgr1388,
				   __Tracesarena_cluster_champion_mgr1388,
				   lager_event,
				   __Pidarena_cluster_champion_mgr1388);
		  _ -> ok
		end,
		ets:insert(arena_cluster_champion_formation,
			   {RoleId, FormationType, FormationLev, FightObjects}),
		ets:insert(arena_cluster_champion_formation_info,
			   {RoleId, FormationType, FormationLev, PList, 0, []});
	    _ -> skip
	  end,
	  {FormationType, FormationLev, PList, 0, [], <<>>, 0}
    end;
get_formation_info(Robot = #role_robot{m_formation =
					   #m_formation{},
				       partners = Partners}) ->
    {SpriteLev, Sprites} = sprite_tree:get_sprite_lev(Robot,
						      6),
    #formation_sys{type = FormationType,
		   pos_info = PosInfo} =
	formation:get_sys_formation(Robot, 6),
    FormationLev = 1,
    Fun = fun (#formation_pos{id = Id, pos = Pos}) ->
		  #partner{lev = PLev, bid = PBid, use_skin = UseSkin,
			   quality = PQuality, resonate_lev = ResonateLev,
			   star = PStar, break_lev = BreakLev,
			   all_attr = #attr{hp_max = HpMax}, power = PPower} =
		      lists:keyfind(Id, #partner.id, Partners),
		  #{id => Id, pos => Pos, bid => PBid, lev => PLev,
		    ext_data => [{5, UseSkin}, {11, ResonateLev}],
		    quality => PQuality, star => PStar,
		    break_lev => BreakLev, hurt => 0, behurt => 0,
		    curt => 0, hp => HpMax, hp_max => HpMax,
		    power => PPower}
	  end,
    {_, FaceFile, FaceUpdateTime} =
	role_face:face_info(Robot),
    {FormationType, FormationLev, [Fun(R) || R <- PosInfo],
     SpriteLev, Sprites, FaceFile, FaceUpdateTime}.

gen_fight_objects(Id = {_, _}) ->
    {ok, R} = arena_cluster_champion_lib:get_role(Id),
    gen_fight_objects(R);
gen_fight_objects(R = #arena_champion_role{id = RoleId,
					   name = Name, robot_id = 0}) ->
    case catch ets:lookup(arena_cluster_champion_formation,
			  RoleId)
	of
      [{RoleId, FormationType, FormationLev, FL = [_ | _]}] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1413, _,
	     {__Levelarena_cluster_champion_mgr1413,
	      __Tracesarena_cluster_champion_mgr1413}}
		when __Levelarena_cluster_champion_mgr1413 band 128 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1413 /= [] ->
		lager:do_log(debug,
			     [{module, arena_cluster_champion_mgr},
			      {function, gen_fight_objects}, {line, 1413},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("缓存里已有阵法战斗信息，不再从机器人列表中获取:~ts",
					   [Name]),
			     none, 4096, 128,
			     __Levelarena_cluster_champion_mgr1413,
			     __Tracesarena_cluster_champion_mgr1413,
			     lager_event, __Pidarena_cluster_champion_mgr1413);
	    _ -> ok
	  end,
	  {FormationType, FormationLev, FL};
      _ ->
	  case role_robot:get_role(RoleId) of
	    {ok, Robot} -> gen_fight_objects(Robot);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster_champion_mgr1420, _,
		   {__Levelarena_cluster_champion_mgr1420,
		    __Tracesarena_cluster_champion_mgr1420}}
		      when __Levelarena_cluster_champion_mgr1420 band 8 /= 0
			     orelse
			     __Tracesarena_cluster_champion_mgr1420 /= [] ->
		      lager:do_log(error,
				   [{module, arena_cluster_champion_mgr},
				    {function, gen_fight_objects}, {line, 1420},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("获取角色[~w][~ts]机器人数据失败",
						 [RoleId, Name]),
				   none, 4096, 8,
				   __Levelarena_cluster_champion_mgr1420,
				   __Tracesarena_cluster_champion_mgr1420,
				   lager_event,
				   __Pidarena_cluster_champion_mgr1420);
		  _ -> ok
		end,
		gen_fight_objects(R#arena_champion_role{robot_id =
							    20000})
	  end
    end;
gen_fight_objects(#arena_champion_role{id = RoleId,
				       name = _Name, lev = Lev,
				       max_power = Power,
				       robot_id = RobotId}) ->
    case catch ets:lookup(arena_cluster_champion_formation,
			  RoleId)
	of
      [{RoleId, FormationType, FormationLev, FL = [_ | _]}] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1427, _,
	     {__Levelarena_cluster_champion_mgr1427,
	      __Tracesarena_cluster_champion_mgr1427}}
		when __Levelarena_cluster_champion_mgr1427 band 128 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1427 /= [] ->
		lager:do_log(debug,
			     [{module, arena_cluster_champion_mgr},
			      {function, gen_fight_objects}, {line, 1427},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("缓存里已有机器人阵法战斗信息，不再从机器人列表中获取:~ts",
					   [_Name]),
			     none, 4096, 128,
			     __Levelarena_cluster_champion_mgr1427,
			     __Tracesarena_cluster_champion_mgr1427,
			     lager_event, __Pidarena_cluster_champion_mgr1427);
	    _ -> ok
	  end,
	  {FormationType, FormationLev, FL};
      _ ->
	  #{formation := Formation} = robot_data:get(RobotId),
	  FormationType = util:rand_list(Formation),
	  FormationLev = 1,
	  Role0 = role_data:first_init(#role{id =
						 {1, sys_env:get(server_id)},
					     type = robot}),
	  Role = Role0#role{lev = Lev},
	  FL = robot:gen_fight_objects(Role, RobotId,
				       #{power => Power div 5}, RoleId),
	  ets:insert(arena_cluster_champion_formation,
		     {RoleId, FormationType, FormationLev, FL}),
	  {FormationType, FormationLev, FL}
    end;
gen_fight_objects(PK = #champion_pk{b_id = RoleId,
				    b_name = Name, b_robot_id = 0}) ->
    case catch ets:lookup(arena_cluster_champion_formation,
			  RoleId)
	of
      [{RoleId, FormationType, FormationLev, FL = [_ | _]}] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1442, _,
	     {__Levelarena_cluster_champion_mgr1442,
	      __Tracesarena_cluster_champion_mgr1442}}
		when __Levelarena_cluster_champion_mgr1442 band 128 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1442 /= [] ->
		lager:do_log(debug,
			     [{module, arena_cluster_champion_mgr},
			      {function, gen_fight_objects}, {line, 1442},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("缓存里已有阵法战斗信息，不再从机器人列表中获取:~ts",
					   [Name]),
			     none, 4096, 128,
			     __Levelarena_cluster_champion_mgr1442,
			     __Tracesarena_cluster_champion_mgr1442,
			     lager_event, __Pidarena_cluster_champion_mgr1442);
	    _ -> ok
	  end,
	  {FormationType, FormationLev, FL};
      _ ->
	  case role_robot:get_role(RoleId) of
	    {ok, Robot} -> gen_fight_objects(Robot);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_cluster_champion_mgr1449, _,
		   {__Levelarena_cluster_champion_mgr1449,
		    __Tracesarena_cluster_champion_mgr1449}}
		      when __Levelarena_cluster_champion_mgr1449 band 8 /= 0
			     orelse
			     __Tracesarena_cluster_champion_mgr1449 /= [] ->
		      lager:do_log(error,
				   [{module, arena_cluster_champion_mgr},
				    {function, gen_fight_objects}, {line, 1449},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("获取角色[~w][~ts]机器人数据失败",
						 [RoleId, Name]),
				   none, 4096, 8,
				   __Levelarena_cluster_champion_mgr1449,
				   __Tracesarena_cluster_champion_mgr1449,
				   lager_event,
				   __Pidarena_cluster_champion_mgr1449);
		  _ -> ok
		end,
		gen_fight_objects(PK#champion_pk{b_robot_id = 20000})
	  end
    end;
gen_fight_objects(#champion_pk{b_id = RoleId,
			       b_name = _Name, b_lev = Lev, b_power = Power,
			       b_robot_id = RobotId,
			       b_formation_type = FormationType,
			       b_formation_lev = FormationLev}) ->
    case catch ets:lookup(arena_cluster_champion_formation,
			  RoleId)
	of
      [{RoleId, FormationType, FormationLev, FL = [_ | _]}] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1456, _,
	     {__Levelarena_cluster_champion_mgr1456,
	      __Tracesarena_cluster_champion_mgr1456}}
		when __Levelarena_cluster_champion_mgr1456 band 128 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1456 /= [] ->
		lager:do_log(debug,
			     [{module, arena_cluster_champion_mgr},
			      {function, gen_fight_objects}, {line, 1456},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("缓存里已有机器人阵法战斗信息，不再从机器人列表中获取:~ts",
					   [_Name]),
			     none, 4096, 128,
			     __Levelarena_cluster_champion_mgr1456,
			     __Tracesarena_cluster_champion_mgr1456,
			     lager_event, __Pidarena_cluster_champion_mgr1456);
	    _ -> ok
	  end,
	  {FormationType, FormationLev, FL};
      _ ->
	  Role0 = role_data:first_init(#role{id =
						 {1, sys_env:get(server_id)},
					     type = robot}),
	  Role = Role0#role{lev = Lev},
	  FL = robot:gen_fight_objects(Role, RobotId,
				       #{power => Power div 5}, RoleId),
	  ets:insert(arena_cluster_champion_formation,
		     {RoleId, FormationType, FormationLev, FL}),
	  {FormationType, FormationLev, FL}
    end;
gen_fight_objects(Robot = #role_robot{id = RoleId,
				      m_formation = #m_formation{},
				      partners = Partners}) ->
    #formation_sys{type = FormationType, pos_info = PosInfo,
		   hallows_id = HallowsId} =
	formation:get_sys_formation(Robot, 6),
    FormationLev = 1,
    #formation_data{pos = FightPos} =
	formation_data:get_formation(FormationType),
    Fun = fun (#formation_pos{id = Id, pos = Pos}) ->
		  P = lists:keyfind(Id, #partner.id, Partners),
		  FO1 = partner_lib:gen_fight_object(Robot, 0, P,
						     combat_lib:is_leader(Pos),
						     RoleId, 1),
		  Pos1 = list_util:keyfind(Pos, FightPos),
		  FO1#fight_object{pos = Pos1}
	  end,
    FL0 = sprite_tree:gen_fight_object_type(Robot, 6) ++
	    hallows_lib:gen_fight_object(Robot, HallowsId) ++
	      [Fun(R) || R <- PosInfo],
    FL = combat_attr:calc(FL0, 31, Robot),
    case get_merge_status() of
      true ->
	  catch ets:insert(arena_cluster_champion_formation,
			   {RoleId, FormationType, FormationLev, FL});
      _ ->
	  cluster_dynamic_group:cast_main(1, ets, insert,
					  [arena_cluster_champion_formation,
					   {RoleId, FormationType, FormationLev,
					    FL}])
    end,
    {FormationType, FormationLev, FL}.

async_fun_combat_over(score_fight,
		      #champion_state{round = Round}, Combat = #combat{},
		      CombatResult = #combat_result{result = Result,
						    replay_info = ReplayInfo,
						    a_stat_info = AStatInfo,
						    b_stat_info = BStatInfo},
		      {score, Id, Name}) ->
    dec_combat_num(),
    [{_, ReplayId} | _] = ReplayInfo,
    d_ets_lib:save_ets(arena_cluster_champion_replay,
		       {ReplayId}),
    combat_replay_mgr:acc_replay_reference(ReplayId),
    catch do_fire_after_combat(Id, a, Combat, CombatResult),
    case arena_cluster_champion_lib:get_role(Id) of
      {ok,
       R = #arena_champion_role{robot_id = RobotId,
				score = Score, win = Win,
				combat_num = CombatNum}}
	  when Result =:= 1 ->
	  #{score := AddScoreT} =
	      arena_cluster_champion_data:get_score_match({Round, 1}),
	  AddScore = util:if_true(RobotId == 0, AddScoreT,
				  round(AddScoreT *
					  arena_cluster_champion_data:get_const(robot_win_score)
					  * 1.0e-3)),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1497, _,
	     {__Levelarena_cluster_champion_mgr1497,
	      __Tracesarena_cluster_champion_mgr1497}}
		when __Levelarena_cluster_champion_mgr1497 band 128 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1497 /= [] ->
		lager:do_log(debug,
			     [{module, arena_cluster_champion_mgr},
			      {function, async_fun_combat_over}, {line, 1497},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("对战结束 AddScore:~w, RobotId:~w, AddScoreT:~w, "
					   "robot_win_score:~w, ~w",
					   [AddScore, RobotId, AddScoreT,
					    arena_cluster_champion_data:get_const(robot_win_score),
					    round(AddScoreT *
						    arena_cluster_champion_data:get_const(robot_win_score)
						    * 1.0e-3)]),
			     none, 4096, 128,
			     __Levelarena_cluster_champion_mgr1497,
			     __Tracesarena_cluster_champion_mgr1497,
			     lager_event, __Pidarena_cluster_champion_mgr1497);
	    _ -> ok
	  end,
	  update_pk_ret_info(Id, 1, ReplayId, 0, AStatInfo,
			     BStatInfo, AddScore),
	  update_rank(R#arena_champion_role{score =
						Score + AddScore,
					    win = Win + 1,
					    combat_num = CombatNum + 1});
      {ok, _R} ->
	  ets:update_counter(arena_cluster_champion_role, Id,
			     [{#arena_champion_role.combat_num, 1},
			      {#arena_champion_role.lose, 1}]),
	  update_pk_ret_info(Id, 2, ReplayId, 0, AStatInfo,
			     BStatInfo, 0),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1503, _,
	     {__Levelarena_cluster_champion_mgr1503,
	      __Tracesarena_cluster_champion_mgr1503}}
		when __Levelarena_cluster_champion_mgr1503 band 128 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1503 /= [] ->
		lager:do_log(debug,
			     [{module, arena_cluster_champion_mgr},
			      {function, async_fun_combat_over}, {line, 1503},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("战斗结束:~w", [Id]), none, 4096, 128,
			     __Levelarena_cluster_champion_mgr1503,
			     __Tracesarena_cluster_champion_mgr1503,
			     lager_event, __Pidarena_cluster_champion_mgr1503);
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
	    {__Pidarena_cluster_champion_mgr1505, _,
	     {__Levelarena_cluster_champion_mgr1505,
	      __Tracesarena_cluster_champion_mgr1505}}
		when __Levelarena_cluster_champion_mgr1505 band 8 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1505 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_champion_mgr},
			      {function, async_fun_combat_over}, {line, 1505},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("战斗结束,查找不到参赛成员信息:~w, ~ts",
					   [Id, Name]),
			     none, 4096, 8,
			     __Levelarena_cluster_champion_mgr1505,
			     __Tracesarena_cluster_champion_mgr1505,
			     lager_event, __Pidarena_cluster_champion_mgr1505);
	    _ -> ok
	  end
    end;
async_fun_combat_over(champion_fight,
		      #champion_state{step = 8}, Combat,
		      CombatResult = #combat_result{result = Result,
						    replay_info = ReplayInfo,
						    a_stat_info = AStatInfo,
						    b_stat_info = BStatInfo},
		      {champion, Group, Pos1, Pos2}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr1508, _,
       {__Levelarena_cluster_champion_mgr1508,
	__Tracesarena_cluster_champion_mgr1508}}
	  when __Levelarena_cluster_champion_mgr1508 band 128 /= 0
		 orelse __Tracesarena_cluster_champion_mgr1508 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_cluster_champion_mgr},
			{function, async_fun_combat_over}, {line, 1508},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("4强对战结束 pos1:~w, pos2:~w, ret:~w",
				     [Pos1, Pos2, Result]),
		       none, 4096, 128, __Levelarena_cluster_champion_mgr1508,
		       __Tracesarena_cluster_champion_mgr1508, lager_event,
		       __Pidarena_cluster_champion_mgr1508);
      _ -> ok
    end,
    dec_combat_num(),
    L = arena_cluster_champion_lib:get_ext(champion_4_temp,
					   []),
    PK1 = #champion_32_pk{id = Id1} = lists:keyfind(Pos1,
						    #champion_32_pk.pos, L),
    PK2 = #champion_32_pk{id = Id2} = lists:keyfind(Pos2,
						    #champion_32_pk.pos, L),
    [{_, ReplayId} | _] = ReplayInfo,
    catch do_fire_after_combat(Id1, a, Combat,
			       CombatResult),
    catch do_fire_after_combat(Id2, b, Combat,
			       CombatResult),
    d_ets_lib:save_ets(arena_cluster_champion_replay,
		       {ReplayId}),
    combat_replay_mgr:acc_replay_reference(ReplayId),
    {NewPK1, NewPK2, NewPK} = case Result of
				1 ->
				    update_pk_ret_info(Id1, 1, ReplayId,
						       10000 + Group * 1000 +
							 Pos1,
						       AStatInfo, BStatInfo, 0),
				    update_pk_ret_info(Id2, 2, ReplayId, 0,
						       BStatInfo, AStatInfo, 0),
				    {ok,
				     R1 = #arena_champion_role{score_32 =
								   Score1,
							       win = Win,
							       combat_num =
								   CombatNum}} =
					arena_cluster_champion_lib:get_role(Id1),
				    update_rank(R1#arena_champion_role{score_32
									   =
									   Score1
									     +
									     10000,
								       win =
									   Win +
									     1,
								       combat_num
									   =
									   CombatNum
									     +
									     1}),
				    ets:update_counter(arena_cluster_champion_role,
						       Id2,
						       [{#arena_champion_role.combat_num,
							 1},
							{#arena_champion_role.lose,
							 1}]),
				    {PK1#champion_32_pk{ret = 1,
							replay_id = ReplayId},
				     PK2#champion_32_pk{ret = 2,
							replay_id = ReplayId},
				     PK1};
				_ ->
				    update_pk_ret_info(Id1, 2, ReplayId,
						       10000 + Group * 1000 +
							 Pos1,
						       AStatInfo, BStatInfo, 0),
				    update_pk_ret_info(Id2, 1, ReplayId, 0,
						       BStatInfo, AStatInfo, 0),
				    {ok,
				     R2 = #arena_champion_role{score_32 =
								   Score2,
							       win = Win2,
							       combat_num =
								   CombatNum2}} =
					arena_cluster_champion_lib:get_role(Id2),
				    update_rank(R2#arena_champion_role{score_32
									   =
									   Score2
									     +
									     10000,
								       win =
									   Win2
									     +
									     1,
								       combat_num
									   =
									   CombatNum2
									     +
									     1}),
				    ets:update_counter(arena_cluster_champion_role,
						       Id1,
						       [{#arena_champion_role.combat_num,
							 1},
							{#arena_champion_role.lose,
							 1}]),
				    {PK1#champion_32_pk{ret = 2,
							replay_id = ReplayId},
				     PK2#champion_32_pk{ret = 1,
							replay_id = ReplayId},
				     PK2}
			      end,
    L1 = lists:keyreplace(Pos1, #champion_32_pk.pos, L,
			  NewPK1),
    L2 = lists:keyreplace(Pos2, #champion_32_pk.pos, L1,
			  NewPK2),
    NewPos = case Pos1 of
	       1 -> 9;
	       3 -> 10;
	       5 -> 11;
	       7 -> 12;
	       9 -> 13;
	       11 -> 14;
	       13 -> 15
	     end,
    L3 = [NewPK#champion_32_pk{pos = NewPos} | L2],
    d_ets_lib:save_ets(arena_cluster_champion_ext,
		       {champion_4_temp, L3});
async_fun_combat_over(champion_fight, #champion_state{},
		      Combat,
		      CombatResult = #combat_result{result = Result,
						    replay_info = ReplayInfo,
						    a_stat_info = AStatInfo,
						    b_stat_info = BStatInfo},
		      {champion, Group, Pos1, Pos2}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr1555, _,
       {__Levelarena_cluster_champion_mgr1555,
	__Tracesarena_cluster_champion_mgr1555}}
	  when __Levelarena_cluster_champion_mgr1555 band 128 /= 0
		 orelse __Tracesarena_cluster_champion_mgr1555 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_cluster_champion_mgr},
			{function, async_fun_combat_over}, {line, 1555},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("32强对战结束 group:~w, pos1:~w, pos2:~w, "
				     "ret:~w",
				     [Group, Pos1, Pos2, Result]),
		       none, 4096, 128, __Levelarena_cluster_champion_mgr1555,
		       __Tracesarena_cluster_champion_mgr1555, lager_event,
		       __Pidarena_cluster_champion_mgr1555);
      _ -> ok
    end,
    dec_combat_num(),
    L =
	arena_cluster_champion_lib:get_ext({champion_32_temp,
					    Group},
					   []),
    PK1 = #champion_32_pk{id = Id1} = lists:keyfind(Pos1,
						    #champion_32_pk.pos, L),
    PK2 = #champion_32_pk{id = Id2} = lists:keyfind(Pos2,
						    #champion_32_pk.pos, L),
    catch do_fire_after_combat(Id1, a, Combat,
			       CombatResult),
    catch do_fire_after_combat(Id2, b, Combat,
			       CombatResult),
    [{_, ReplayId} | _] = ReplayInfo,
    d_ets_lib:save_ets(arena_cluster_champion_replay,
		       {ReplayId}),
    combat_replay_mgr:acc_replay_reference(ReplayId),
    {NewPK1, NewPK2, NewPK} = case Result of
				1 ->
				    update_pk_ret_info(Id1, 1, ReplayId,
						       10000 + Group * 1000 +
							 Pos1,
						       AStatInfo, BStatInfo, 0),
				    update_pk_ret_info(Id2, 2, ReplayId, 0,
						       BStatInfo, AStatInfo, 0),
				    {ok,
				     R1 = #arena_champion_role{score_32 =
								   Score1,
							       win = Win,
							       combat_num =
								   CombatNum}} =
					arena_cluster_champion_lib:get_role(Id1),
				    update_rank(R1#arena_champion_role{score_32
									   =
									   Score1
									     +
									     10000,
								       win =
									   Win +
									     1,
								       combat_num
									   =
									   CombatNum
									     +
									     1}),
				    ets:update_counter(arena_cluster_champion_role,
						       Id2,
						       [{#arena_champion_role.combat_num,
							 1},
							{#arena_champion_role.lose,
							 1}]),
				    {PK1#champion_32_pk{ret = 1,
							replay_id = ReplayId},
				     PK2#champion_32_pk{ret = 2,
							replay_id = ReplayId},
				     PK1};
				_ ->
				    update_pk_ret_info(Id1, 2, ReplayId,
						       10000 + Group * 1000 +
							 Pos1,
						       AStatInfo, BStatInfo, 0),
				    update_pk_ret_info(Id2, 1, ReplayId, 0,
						       BStatInfo, AStatInfo, 0),
				    {ok,
				     R2 = #arena_champion_role{score_32 =
								   Score2,
							       win = Win2,
							       combat_num =
								   CombetNum2}} =
					arena_cluster_champion_lib:get_role(Id2),
				    update_rank(R2#arena_champion_role{score_32
									   =
									   Score2
									     +
									     10000,
								       win =
									   Win2
									     +
									     1,
								       combat_num
									   =
									   CombetNum2
									     +
									     1}),
				    ets:update_counter(arena_cluster_champion_role,
						       Id1,
						       [{#arena_champion_role.combat_num,
							 1},
							{#arena_champion_role.lose,
							 1}]),
				    {PK1#champion_32_pk{ret = 2,
							replay_id = ReplayId},
				     PK2#champion_32_pk{ret = 1,
							replay_id = ReplayId},
				     PK2}
			      end,
    L1 = lists:keyreplace(Pos1, #champion_32_pk.pos, L,
			  NewPK1),
    L2 = lists:keyreplace(Pos2, #champion_32_pk.pos, L1,
			  NewPK2),
    NewPos = case Pos1 of
	       1 -> 9;
	       3 -> 10;
	       5 -> 11;
	       7 -> 12;
	       9 -> 13;
	       11 -> 14;
	       13 -> 15
	     end,
    L3 = [NewPK#champion_32_pk{pos = NewPos} | L2],
    d_ets_lib:save_ets(arena_cluster_champion_ext,
		       {{champion_32_temp, Group}, L3});
async_fun_combat_over(_StateName, _ChampionState,
		      _Combat, _CombatResult, _Arg) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_cluster_champion_mgr1597, _,
       {__Levelarena_cluster_champion_mgr1597,
	__Tracesarena_cluster_champion_mgr1597}}
	  when __Levelarena_cluster_champion_mgr1597 band 8 /= 0
		 orelse __Tracesarena_cluster_champion_mgr1597 /= [] ->
	  lager:do_log(error,
		       [{module, arena_cluster_champion_mgr},
			{function, async_fun_combat_over}, {line, 1597},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("战斗结束处理失败，state_name=~w, _Arg:~w",
				     [_StateName, _Arg]),
		       none, 4096, 8, __Levelarena_cluster_champion_mgr1597,
		       __Tracesarena_cluster_champion_mgr1597, lager_event,
		       __Pidarena_cluster_champion_mgr1597);
      _ -> ok
    end.

do_fire_after_combat(Id, AOrB, Combat, CombatResult) ->
    case role_query:local_pid(by_id, Id) of
      {ok, Pid} ->
	  role:apply(async, Pid,
		     {fun (R) ->
			      NewR = feat_combat:combat_over_fire(R, AOrB,
								  Combat,
								  CombatResult),
			      {ok, NewR}
		      end});
      _ -> skip
    end.

update_pk_ret_info(Id, Ret, ReplayId, CopyId, AStatInfo,
		   BStatInfo, GetScore) ->
    case arena_cluster_champion_lib:get_pk(Id) of
      {ok,
       PK = #champion_pk{a_plist = APList,
			 b_plist = BPList}} ->
	  NewAPList = merge_partner_combat_info(APList, AStatInfo,
						[]),
	  NewBPList = merge_partner_combat_info(BPList, BStatInfo,
						[]),
	  PK1 = PK#champion_pk{score = GetScore, ret = Ret,
			       replay_id = ReplayId, a_plist = NewAPList,
			       b_plist = NewBPList},
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1616, _,
	     {__Levelarena_cluster_champion_mgr1616,
	      __Tracesarena_cluster_champion_mgr1616}}
		when __Levelarena_cluster_champion_mgr1616 band 128 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1616 /= [] ->
		lager:do_log(debug,
			     [{module, arena_cluster_champion_mgr},
			      {function, update_pk_ret_info}, {line, 1616},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("更新PK结果信息:id:~w, ret=~w, replay_id=~w, "
					   "copy_id=~w",
					   [Id, Ret, ReplayId, CopyId]),
			     none, 4096, 128,
			     __Levelarena_cluster_champion_mgr1616,
			     __Tracesarena_cluster_champion_mgr1616,
			     lager_event, __Pidarena_cluster_champion_mgr1616);
	    _ -> ok
	  end,
	  case Id of
	    {_, <<>>} -> ets:delete(arena_cluster_champion_pk, Id);
	    _ ->
		Log = #champion_role_log{logs = Logs} =
			  arena_cluster_champion_lib:get_log(Id),
		N = length(Logs) + 1,
		NewLog = Log#champion_role_log{logs = [N | Logs]},
		d_ets_lib:save_ets(arena_cluster_champion_role_log,
				   NewLog),
		d_ets_lib:save_ets(arena_cluster_champion_pk,
				   PK1#champion_pk{id = {Id, N}}),
		d_ets_lib:save_ets(arena_cluster_champion_pk, PK1)
	  end,
	  case Id =:= get(guess_roleid) of
	    true ->
		d_ets_lib:save_ets(arena_cluster_champion_ext,
				   {guess_id, [get(guess_id)]}),
		d_ets_lib:save_ets(arena_cluster_champion_pk,
				   PK1#champion_pk{id = get(guess_id)});
	    _ -> pass
	  end,
	  case CopyId > 0 of
	    true ->
		d_ets_lib:save_ets(arena_cluster_champion_pk,
				   PK1#champion_pk{id = CopyId});
	    _ -> pass
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
	    {__Pidarena_cluster_champion_mgr1642, _,
	     {__Levelarena_cluster_champion_mgr1642,
	      __Tracesarena_cluster_champion_mgr1642}}
		when __Levelarena_cluster_champion_mgr1642 band 8 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1642 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_champion_mgr},
			      {function, update_pk_ret_info}, {line, 1642},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("更新PK结果失败:~w", [Id]), none, 4096, 8,
			     __Levelarena_cluster_champion_mgr1642,
			     __Tracesarena_cluster_champion_mgr1642,
			     lager_event, __Pidarena_cluster_champion_mgr1642);
	    _ -> ok
	  end
    end.

merge_partner_combat_info([], _, List) ->
    lists:reverse(List);
merge_partner_combat_info([P = #{id := Id, bid := Bid}
			   | T],
			  StatInfo, List) ->
    case maps_util:keyfind(StatInfo, object_id, Id) of
      {ok,
       #{hurt := Hurt, curt := Curt, be_hurt := BeHurt,
	 hp := Hp, hp_max := HpMax}} ->
	  merge_partner_combat_info(T, StatInfo,
				    [P#{hurt := Hurt, curt := Curt,
					behurt := BeHurt, hp := Hp,
					hp_max := HpMax}
				     | List]);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1653, _,
	     {__Levelarena_cluster_champion_mgr1653,
	      __Tracesarena_cluster_champion_mgr1653}}
		when __Levelarena_cluster_champion_mgr1653 band 8 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1653 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_champion_mgr},
			      {function, merge_partner_combat_info},
			      {line, 1653}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("查找不到伙伴战斗信息,id=~w, bid=~w",
					   [Id, Bid]),
			     none, 4096, 8,
			     __Levelarena_cluster_champion_mgr1653,
			     __Tracesarena_cluster_champion_mgr1653,
			     lager_event, __Pidarena_cluster_champion_mgr1653);
	    _ -> ok
	  end,
	  merge_partner_combat_info(T, StatInfo, [P | List])
    end.

guess_score_supply(_BaseVal,
		   #champion_state{step = 1, round = 1}) ->
    ok;
guess_score_supply(BaseVal, _State) ->
    [ets:update_counter(arena_cluster_champion_bet, RoleId,
			{#champion_bet.bet, BaseVal})
     || {RoleId, _, _} <- util:get(guess_list, [])].

guess_stat(BaseVal, State) ->
    erase(guess_roleid),
    case arena_cluster_champion_lib:get_pk(get(guess_id)) of
      {ok, #champion_pk{ret = Ret}} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1670, _,
	     {__Levelarena_cluster_champion_mgr1670,
	      __Tracesarena_cluster_champion_mgr1670}}
		when __Levelarena_cluster_champion_mgr1670 band 128 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1670 /= [] ->
		lager:do_log(debug,
			     [{module, arena_cluster_champion_mgr},
			      {function, guess_stat}, {line, 1670},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("结算竞猜信息:guess_id=~w, a_bet=~w, b_bet=~w",
					   [get(guess_id), get(guess_a_bet),
					    get(guess_b_bet)]),
			     none, 4096, 128,
			     __Levelarena_cluster_champion_mgr1670,
			     __Tracesarena_cluster_champion_mgr1670,
			     lager_event, __Pidarena_cluster_champion_mgr1670);
	    _ -> ok
	  end,
	  ABetRatio = calc_bet_ratio(get(guess_a_bet),
				     get(guess_b_bet)),
	  BBetRatio = calc_bet_ratio(get(guess_b_bet),
				     get(guess_a_bet)),
	  [do_guess_stat(I, Ret, BaseVal, ABetRatio, BBetRatio,
			 State)
	   || I <- get(guess_list)];
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1675, _,
	     {__Levelarena_cluster_champion_mgr1675,
	      __Tracesarena_cluster_champion_mgr1675}}
		when __Levelarena_cluster_champion_mgr1675 band 8 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1675 /= [] ->
		lager:do_log(error,
			     [{module, arena_cluster_champion_mgr},
			      {function, guess_stat}, {line, 1675},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("查找不到竞猜对象信息:~w", [get(guess_id)]),
			     none, 4096, 8,
			     __Levelarena_cluster_champion_mgr1675,
			     __Tracesarena_cluster_champion_mgr1675,
			     lager_event, __Pidarena_cluster_champion_mgr1675);
	    _ -> ok
	  end
    end.

do_guess_stat({RoleId, Target, Val}, Ret, BaseVal,
	      ABetRatio, BBetRatio,
	      #champion_state{step = Step, round = Round}) ->
    ValTime = util:if_true(Target =:= 1, ABetRatio,
			   BBetRatio),
    GetVal = util:if_true(Target =:= Ret,
			  round(Val * ValTime / 1000), 0),
    Bet = #champion_bet{bet = CanBet, logs = Logs} =
	      arena_cluster_champion_lib:get_bet(RoleId),
    Log = lists:keyfind(get(guess_id), #champion_bet_log.id,
			Logs),
    Log1 = Log#champion_bet_log{get_bet = GetVal},
    NewLogs = lists:keyreplace(get(guess_id),
			       #champion_bet_log.id, Logs, Log1),
    NewBet = Bet#champion_bet{bet =
				  CanBet + GetVal + BaseVal,
			      logs = NewLogs},
    GuessWinCount = length([win
			    || #champion_bet_log{get_bet = GetValTemp}
				   <- NewLogs,
			       GetValTemp > 0]),
    catch cluster_lib:cast(element(2, RoleId),
			   room_feat_mgr, info,
			   [{evt_cluster_championships_bet_cont_win_day, RoleId,
			     GuessWinCount}]),
    case GetVal > 0 of
      true ->
	  role:pack_send(RoleId, 12742,
			 {[{33, 0, GetVal, 0, 0}], Step * 10 + Round});
      _ -> skip
    end,
    d_ets_lib:save_ets(arena_cluster_champion_bet, NewBet).

mail_notify_start(Time) ->
    {{_Y, Month, Day}, {Hour, Minu, _}} =
	date:seconds_to_datetime(Time),
    GMail = #gmail{id = {arena_cluster, Day},
		   end_time = Time, subject = lang:get(<<"周冠军赛预告"/utf8>>),
		   content =
		       color:msg(lang:get(<<"亲爱的冒险者大人：\n \n     新一期的周冠军赛将在本周日12:00-13:00开启"
					    "，跨服天梯前256名玩家将自动参与比赛。拥有参赛资格的人数需大于等于64人，否则本次周冠军"
					    "赛无法开启。\n参与比赛或竞猜玩法可获丰厚奖励，还有神器皮肤（死神镰刀）等你来拿。可别错过"
					    "哦"/utf8>>),
				 []),
		   conds =
		       [{minlev,
			 arena_cluster_champion_data:get_const(guess_lev_limit)}]},
    cluster_dynamic_group:group_cast(1, mail, global_send,
				     [GMail]).

rank_reward(Rank, MaxNum) when Rank =< MaxNum ->
    case arena_cluster_champion_data:rank_reward(Rank) of
      Items = [_ | _] ->
	  case arena_cluster_champion_lib:rank_role(Rank) of
	    {ok, #arena_champion_role{id = {_, <<>>}}} -> pass;
	    {ok, #arena_champion_role{id = RoleId = {_, Sid}}} ->
		catch cluster_lib:cast(Sid, var, update_role_var_list,
				       [RoleId, other, [{min, 14, Rank}]]),
		catch cluster_lib:cast(Sid, room_feat_mgr, info,
				       [{arena_cluster_champion_do_feat, RoleId,
					 Rank}]),
		catch cluster_lib:cast(Sid, role_weekly_mgr, info,
				       [{cluster_champion_rank, RoleId, Rank}]),
		case Rank > 0 andalso
		       Rank =<
			 arena_cluster_champion_data:get_const(hallowskin_reward_rank)
		    of
		  true ->
		      EndTime = date:unixtime() + 86400 * 7,
		      catch cluster_lib:cast(Sid, arena_cluster_champion_mgr,
					     info,
					     [{sync_local_hallows_look, RoleId,
					       Rank, EndTime}]),
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidarena_cluster_champion_mgr1718, _,
			 {__Levelarena_cluster_champion_mgr1718,
			  __Tracesarena_cluster_champion_mgr1718}}
			    when __Levelarena_cluster_champion_mgr1718 band 64
				   /= 0
				   orelse
				   __Tracesarena_cluster_champion_mgr1718 /=
				     [] ->
			    lager:do_log(info,
					 [{module, arena_cluster_champion_mgr},
					  {function, rank_reward}, {line, 1718},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~w领取了跨服冠军赛~w名的幻化皮肤",
						       [RoleId, Rank]),
					 none, 4096, 64,
					 __Levelarena_cluster_champion_mgr1718,
					 __Tracesarena_cluster_champion_mgr1718,
					 lager_event,
					 __Pidarena_cluster_champion_mgr1718);
			_ -> ok
		      end,
		      ok;
		  _ -> skip
		end,
		mail:send(RoleId,
			  {lang:get(<<"周冠军赛赛季奖励"/utf8>>),
			   color:msg(lang:get(<<"亲爱的冒险者大人：\n \n恭喜您在本次周冠军赛中取得~ts名的成绩。以下是您的排名奖励。\n"
						"注：前三名神器皮肤奖励——“死神镰刀”已自动激活（限时7天），可前往“神器-幻化”界面直接"
						"使用"/utf8>>),
				     [{binary, Rank}]),
			   items, Items, <<"竞技场"/utf8>>});
	    _ -> pass
	  end;
      _ -> pass
    end,
    rank_reward(Rank + 1, MaxNum);
rank_reward(_Rank, _MaxNum) -> pass.

save_result(Rank, MaxNum) when Rank =< MaxNum ->
    case arena_cluster_champion_lib:rank_role(Rank) of
      {ok, #arena_champion_role{id = {_, <<>>}}} -> pass;
      {ok,
       #arena_champion_role{id = RoleId, combat_num = CNum,
			    win = Win}} ->
	  d_ets_lib:save_d_ets(arena_cluster_champion_result,
			       #champion_result{id = RoleId, rank = Rank,
						cnum = CNum, win = Win});
      _ -> pass
    end,
    save_result(Rank + 1, MaxNum);
save_result(_Rank, _MaxNum) -> pass.

mail_bet() ->
    [do_mail_bet(I)
     || I <- ets:tab2list(arena_cluster_champion_bet)].

do_mail_bet(#champion_bet{id = RoleId, bet = Bet})
    when Bet > 0 ->
    Items = [{34, Bet}],
    mail:send(RoleId,
	      {lang:get(<<"周冠军赛冠军币领取"/utf8>>),
	       lang:get(<<"亲爱的冒险者大人：\n这是根据您在本次周冠军赛竞猜中获得的高级竞猜币转化成的冠军币。可使用"
			  "冠军币在“冠军商店”中兑换珍稀道具。"/utf8>>),
	       items, Items, <<"竞技场"/utf8>>}),
    ets:update_element(arena_cluster_champion_bet, RoleId,
		       {#champion_bet.bet, 0});
do_mail_bet(_) -> ok.

notice_msg(score_notice, _Arg) ->
    notice:broadcast(rumor,
		     color:msg(lang:get(<<"本次<div fontcolor=#d95014>周冠军赛将于12:00开启，参与比赛或竞"
					  "猜玩法可获丰厚奖励哦"/utf8>>),
			       []));
notice_msg(score_start, _Arg) ->
    notice:broadcast(rumor_left_top,
		     color:msg(lang:get(<<"本次周冠军赛正式开始！参与比赛或竞猜玩法可获丰厚奖励哦。~ts"/utf8>>),
			       [{href,
				 {65, green, [], lang:get(<<"前往参与"/utf8>>)}}]));
notice_msg(champion_start, _Arg) ->
    notice:broadcast(rumor_left_top,
		     color:msg(lang:get(<<"周冠军赛选拔赛已结束，64强选手已经产生，真正的角逐即将开始！~ts"/utf8>>),
			       [{href,
				 {65, green, [], lang:get(<<"前往参与"/utf8>>)}}]));
notice_msg(champion_4_start, _Arg) ->
    notice:broadcast(rumor_left_top,
		     color:msg(lang:get(<<"周冠军赛8强选手已经产生，谁将在跨服时空中夺得冠军宝座，让我们拭目以待！~ts"/utf8>>),
			       [{href,
				 {65, green, [], lang:get(<<"前往参与"/utf8>>)}}]));
notice_msg(champion_round_start,
	   #champion_state{step = 8, round = 2}) ->
    notice:broadcast(rumor_left_top,
		     color:msg(lang:get(<<"周冠军赛4强选手已经诞生！他们分别是~ts，谁能成为冠军，让我们拭目以待！~ts  "/utf8>>),
			       [{list,
				 [{name, Rid, Name}
				  || #arena_champion_role{id = Rid, name = Name}
					 <- arena_cluster_champion_lib:list_rank(4)]},
				{href,
				 {65, green, [], lang:get(<<"前往参与"/utf8>>)}}]));
notice_msg(champion_round_start,
	   #champion_state{step = 8, round = 3}) ->
    notice:broadcast(rumor_left_top,
		     color:msg(lang:get(<<"~ts即将进行周冠军赛的最后对决！谁将成为冠军，让我们拭目以待！~ts  "/utf8>>),
			       [{list,
				 [{name, Rid, Name}
				  || #arena_champion_role{id = Rid, name = Name}
					 <- arena_cluster_champion_lib:list_rank(2)]},
				{href,
				 {65, green, [], lang:get(<<"前往参与"/utf8>>)}}]));
notice_msg(champion_end, _Arg) ->
    [#arena_champion_role{id = Rid = {_, Sid}, name = Name}
     | _] =
	arena_cluster_champion_lib:list_rank(1),
    SRId = case Sid of
	     <<"robot">> -> sys_lib:srv_id();
	     <<>> -> sys_lib:srv_id();
	     _ -> Sid
	   end,
    Msg1 = color:format({string,
			 {red,
			  util:fbin(lang:get(<<"S~w"/utf8>>),
				    [game_lib:get_sid(SRId)])}}),
    notice:broadcast(rumor_left_top,
		     color:msg(lang:get(<<"恭喜来自~ts的~ts获得本次周冠军赛第一名！比赛和竞猜奖励已通过邮件发放，请各位冒险者大"
					  "大注意查收"/utf8>>),
			       [Msg1, {name, Rid, Name}]));
notice_msg(_Label, _Arg) -> ok.

is_open() ->
    case ets:lookup(arena_cluster_champion_ext,
		    arena_champion_merge_status)
	of
      [{_, true}] -> true;
      _ -> cluster_dynamic_group:is_main(1)
    end.

init_merge() ->
    MergeIndex = sys_env:get(merge_index, 0),
    NowIndex = case ets:lookup(arena_cluster_champion_ext,
			       arena_champion_merge_index)
		   of
		 [{_, IndexT}] -> IndexT;
		 _ -> 0
	       end,
    case MergeIndex =/= NowIndex of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_cluster_champion_mgr1801, _,
	     {__Levelarena_cluster_champion_mgr1801,
	      __Tracesarena_cluster_champion_mgr1801}}
		when __Levelarena_cluster_champion_mgr1801 band 64 /= 0
		       orelse __Tracesarena_cluster_champion_mgr1801 /= [] ->
		lager:do_log(info,
			     [{module, arena_cluster_champion_mgr},
			      {function, init_merge}, {line, 1801},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "跨服竞技场变换为合服状态", none, 4096, 64,
			     __Levelarena_cluster_champion_mgr1801,
			     __Tracesarena_cluster_champion_mgr1801,
			     lager_event, __Pidarena_cluster_champion_mgr1801);
	    _ -> ok
	  end,
	  d_ets_lib:save_d_ets(arena_cluster_champion_ext,
			       {arena_champion_merge_index, MergeIndex}),
	  d_ets_lib:save_d_ets(arena_cluster_champion_ext,
			       {arena_champion_merge_status, true});
      _ -> skip
    end,
    ok.

get_merge_status() ->
    case ets:lookup(arena_cluster_champion_ext,
		    arena_champion_merge_status)
	of
      [{_, true}] -> true;
      _ -> false
    end.


