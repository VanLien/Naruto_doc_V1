-file("src/mod/replay_hall/replay_hall.erl", 1).

-module(replay_hall).

-lager_records([{formation_attr_data,
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
		{m_arena_elite_war_order,
		 [ver, period, period_day, end_time, win_count,
		  rmb_status, card, lev_reward, start_time, ext]},
		{arena_replay_partner, [pos, bid, lev, star, ext]},
		{arena_replay_info,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_elite_log,
		 [id, atk_id, atk_name, atk_face, atk_lev, atk_rank,
		  atk_elite_lev, def_id, def_name, def_face, def_lev,
		  def_rank, def_elite_lev, ret, win_count, lose_count,
		  combat_type, replay_list, time, atk_face_update_time,
		  atk_face_file, def_face_update_time, def_face_file]},
		{role_arena_elite_log, [id, list]},
		{arena_elite_rank,
		 [ver, rank, id, name, power, lev, face, look_id, score,
		  elite_lev, time, avatar_id, face_update_time,
		  face_file]},
		{arena_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, dower_skill,
		  set_skill, attr, extra]},
		{arena_elite_rival_defense,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, partner_infos, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  extra]},
		{c_e_role,
		 [ver, id, name, power, lev, face, look_id, score,
		  elite_lev, avatar_id, is_king, match_power, all_star,
		  win_rio, zid, face_update_time, face_file]},
		{arena_elite_role,
		 [ver, id, name, lev, sex, gid, gname, face, power,
		  look_id, score, elite_lev, time, avatar_id, is_king,
		  defense, manifesto, face_update_time, face_file,
		  break_groups]},
		{c_elite_srv_info,
		 [type, sid, num, world_lev, open_time, merge_srvs]},
		{m_arena_elite_defens, [type, formations]},
		{m_arena_elite_log,
		 [ver, period, max_lev, max_score, combat_win_count1,
		  combat_all_count1, combat_win_count2, combat_all_count2,
		  max_dps, mvp_info, winning_streak, winning_streak_now,
		  beast_rivl_info, extra, log_zone_id, log_rank]},
		{arena_elite_role_best,
		 [id, name, lev, sex, gid, gname, face, power, look_id,
		  score, elite_lev, time, avatar_id, is_king, extra,
		  face_update_time, face_file]},
		{m_arena_elite,
		 [ver, lev, init_lev, period, score, day_combat_count,
		  day_buy_count, frist_ref_time, ref_count, match_cd_time,
		  had_combat_num, acc_combat_num, lev_reward,
		  last_combat_id, promoted_info, rival_info, defens,
		  old_rank, day_point_count, log, extra, last_reset_time,
		  max_day_buy_count, is_skip]},
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
		{guild_log, [key, list]}, {role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{guild_war_role_log,
		 [id, name, lev, face, power, formation_type,
		  formation_lev, time, repaly_id, result, hp, defense,
		  face_update_time, face_file]},
		{guild_war_log,
		 [flag1, flag2, time, id1, name1, id2, name2, gid, gname,
		  int_args, str_args]},
		{guild_war_partner,
		 [id, bid, lev, star, break_lev, base_attr, all_attr,
		  skills, break_skills, set_skills, ext_data]},
		{guild_war_role,
		 [pos, id, name, lev, face, power, formation_type,
		  formation_lev, war_score, star, defense, hp, hp_max,
		  status, def_count, def_log, count, repaly_info,
		  relic_def_count, hallows_id, hallows_lev,
		  hallows_skill_lev, hallows_look_id, hallows_lucky,
		  hallows_seal, hallows_all_look_ids, extra, look_id,
		  face_update_time, face_file, break_groups]},
		{guild_war_sign,
		 [gid, group_id, srv_name, gname, def_num, defense,
		  last_matchs, avg_power, star_time, buff_lev, rank, hp,
		  hp_max, war_log, lev]},
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
		{peak_champion_pk,
		 [id, step, round, group, score, is_guess, a_pos, a_id,
		  a_name, a_lev, a_face, a_avatar_id, a_sex, a_defense,
		  a_bet, a_power, a_robot_id, b_pos, b_id, b_name, b_lev,
		  b_face, b_avatar_id, b_sex, b_defense, b_bet, b_power,
		  b_robot_id, ret, result_info, diff_power, pk_rlist,
		  a_sprite_lev, a_sprites, a_sprite_attr, b_sprite_lev,
		  b_sprites, b_sprite_attr, a_face_update_time,
		  a_face_file, b_face_update_time, b_face_file,
		  a_sprites_list, b_sprites_list, a_break_groups,
		  b_break_groups]},
		{peak_champion_32_pk,
		 [pos, id, name, lev, face_id, avatar_bid, sex,
		  max_power, ret, ext]},
		{arena_peak_result_info,
		 [order, ret, time, round, a_end_hp, b_end_hp,
		  replay_info]},
		{arena_peak_role_partner,
		 [pos, id, bid, lev, star, break_lev, power, skin_id,
		  dower_skill, set_skill, attr, hurt, behurt, curt, ext]},
		{arena_peak_role_defense,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_look_id, hallows_skill_lev, hallows_lucky,
		  hallows_seal, hallows_refine, hallows_all_look_ids,
		  power, plist]},
		{arena_peak_champion_role,
		 [id, name, lev, face_id, avatar_bid, sex, power,
		  defense, sprite_lev, sprites, sprites_attr, old_rank,
		  old_score, score, score_32, rank, robot_id, group,
		  group256, group64, combat_num, win, lose,
		  face_update_time, face_file, sprites_list,
		  break_groups]},
		{arena_peak_rank,
		 [rank, id, name, lev, face_id, avatar_bid, score, power,
		  sex, face_update_time, face_file]},
		{arena_peak_rank_info, [zone_id, list]},
		{c_arena_zone_info,
		 [zone_id, main_id, main_list, srv_lists, do_merge_lists,
		  num]},
		{m_arena_peak_champion,
		 [var, period, zone_id, old_periods, defense]},
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

-export([push_base/1, convert/4, calc_replay_info/2,
	 list_role/2, list/5, like/4, collect/5, share/5,
	 inc_play/1, inc_play/2, get_partner/5,
	 push_say_replay/7]).

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

-file("src/mod/replay_hall/replay_hall.erl", 22).

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

-file("src/mod/replay_hall/replay_hall.erl", 23).

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

-file("src/mod/replay_hall/replay_hall.erl", 24).

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

-file("src/mod/replay_hall/replay_hall.erl", 25).

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

-file("src/mod/replay_hall/replay_hall.erl", 26).

-file("inc/arena_peak_champion.hrl", 1).

-record(m_arena_peak_champion,
	{var = 2, period = 0, zone_id = 0, old_periods = [],
	 defense = []}).

-record(c_arena_zone_info,
	{zone_id = 0, main_id = <<>>, main_list = [],
	 srv_lists = [], do_merge_lists = [], num = 0}).

-record(arena_peak_rank_info,
	{zone_id = {0, 0}, list = 0}).

-record(arena_peak_rank,
	{rank = 0, id = {0, <<>>}, name = 0, lev = 0,
	 face_id = 0, avatar_bid = 0, score = 0, power = 0,
	 sex = 0, face_update_time = 0, face_file = <<>>}).

-record(arena_peak_champion_role,
	{id = {0, <<>>}, name = <<>>, lev = 0, face_id = 0,
	 avatar_bid = 0, sex = 0, power = 0, defense = [],
	 sprite_lev = 0, sprites = [], sprites_attr,
	 old_rank = 0, old_score = 0, score = 0, score_32 = 0,
	 rank = 0, robot_id = 0, group = 0, group256 = 0,
	 group64 = 0, combat_num = 0, win = 0, lose = 0,
	 face_update_time = 0, face_file = <<>>,
	 sprites_list = [], break_groups = []}).

-record(arena_peak_role_defense,
	{order = 0, formation_type = 1, hallows_id = 1,
	 hallows_lev = 0, hallows_look_id = 0,
	 hallows_skill_lev = 0, hallows_lucky = 0,
	 hallows_seal = 0, hallows_refine = 0,
	 hallows_all_look_ids = [], power = 0, plist = []}).

-record(arena_peak_role_partner,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, skin_id = 0, dower_skill = [],
	 set_skill = [], attr, hurt = 0, behurt = 0, curt = 0,
	 ext = #{}}).

-record(arena_peak_result_info,
	{order = 0, ret = 0, time = 0, round = 0, a_end_hp = 0,
	 b_end_hp = 0, replay_info = {0, <<>>}}).

-record(peak_champion_32_pk,
	{pos = 0, id = {0, <<>>}, name = <<>>, lev = 0,
	 face_id = 0, avatar_bid = 0, sex = 0, max_power = 0,
	 ret = 0, ext = []}).

-record(peak_champion_pk,
	{id = 0, step = 0, round = 0, group = 0, score = 0,
	 is_guess = 1, a_pos = 0, a_id = {0, <<>>},
	 a_name = <<>>, a_lev = 0, a_face = 0, a_avatar_id = 0,
	 a_sex = 0, a_defense = [], a_bet = 0, a_power = 0,
	 a_robot_id = 0, b_pos = 0, b_id = {0, <<>>},
	 b_name = <<>>, b_lev = 0, b_face = 0, b_avatar_id = 0,
	 b_sex = 0, b_defense = [], b_bet = 0, b_power = 0,
	 b_robot_id = 0, ret = 0, result_info = [],
	 diff_power = 0, pk_rlist = [], a_sprite_lev = 0,
	 a_sprites = [], a_sprite_attr, b_sprite_lev = 0,
	 b_sprites = [], b_sprite_attr, a_face_update_time = 0,
	 a_face_file = <<>>, b_face_update_time = 0,
	 b_face_file = <<>>, a_sprites_list = [],
	 b_sprites_list = [], a_break_groups = [],
	 b_break_groups = []}).

-file("src/mod/replay_hall/replay_hall.erl", 27).

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

-file("src/mod/replay_hall/replay_hall.erl", 28).

-file("inc/guild_war.hrl", 1).

-record(guild_war_sign,
	{gid = {0, <<>>}, group_id = 0, srv_name = <<>>,
	 gname = <<>>, def_num = 0, defense = [],
	 last_matchs = {0, <<>>}, avg_power = 0, star_time = 0,
	 buff_lev = 0, rank = 0, hp = 0, hp_max = 0,
	 war_log = [], lev = 0}).

-record(guild_war_role,
	{pos = 0, id = {0, <<>>}, name = <<>>, lev = 0,
	 face = 0, power = 0, formation_type = 0,
	 formation_lev = 0, war_score = 0, star = 0,
	 defense = [], hp = 3, hp_max = 3, status = 0,
	 def_count = 0, def_log = [], count = 0,
	 repaly_info = [], relic_def_count = 0, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0, hallows_look_id,
	 hallows_lucky, hallows_seal, hallows_all_look_ids = [],
	 extra = [], look_id = 0, face_update_time = 0,
	 face_file = <<>>, break_groups = []}).

-record(guild_war_partner,
	{id = 0, bid = 0, lev = 0, star = 0, break_lev = 0,
	 base_attr = [], all_attr = [], skills = [],
	 break_skills = [], set_skills = [], ext_data = []}).

-record(guild_war_log,
	{flag1 = 0, flag2 = 0, time = 0, id1 = {0, <<>>},
	 name1 = <<>>, id2 = {0, <<>>}, name2 = <<>>,
	 gid = {0, <<>>}, gname = <<>>, int_args = [],
	 str_args = []}).

-record(guild_war_role_log,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 power = 0, formation_type = 0, formation_lev = 0,
	 time = 0, repaly_id = 0, result = 0, hp = 0,
	 defense = [], face_update_time = 0, face_file = <<>>}).

-file("src/mod/replay_hall/replay_hall.erl", 29).

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

-file("src/mod/replay_hall/replay_hall.erl", 30).

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

-file("src/mod/replay_hall/replay_hall.erl", 31).

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

-file("src/mod/replay_hall/replay_hall.erl", 32).

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

-file("src/mod/replay_hall/replay_hall.erl", 33).

-file("inc/arena_elite.hrl", 1).

-record(m_arena_elite,
	{ver = 6, lev = 1, init_lev = 1, period = 0, score = 0,
	 day_combat_count = 0, day_buy_count = 0,
	 frist_ref_time = 0, ref_count = 0, match_cd_time = 0,
	 had_combat_num = 0, acc_combat_num = 0, lev_reward = [],
	 last_combat_id = {0, <<>>}, promoted_info = [],
	 rival_info = [], defens = [], old_rank = [],
	 day_point_count = [], log = [], extra = [],
	 last_reset_time = 0, max_day_buy_count = 0,
	 is_skip = 0}).

-record(arena_elite_role_best,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = [],
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, extra = [],
	 face_update_time = 0, face_file = <<>>}).

-record(m_arena_elite_log,
	{ver = 2, period = 0, max_lev = 1, max_score = 1000,
	 combat_win_count1 = 0, combat_all_count1 = 0,
	 combat_win_count2 = 0, combat_all_count2 = 0,
	 max_dps = 0, mvp_info = [], winning_streak = 0,
	 winning_streak_now = 0,
	 beast_rivl_info = #arena_elite_role_best{}, extra = [],
	 log_zone_id = 0, log_rank = 0}).

-record(m_arena_elite_defens,
	{type = 1, formations = []}).

-record(c_elite_srv_info,
	{type = 1, sid = <<>>, num = 0, world_lev = 0,
	 open_time = 0, merge_srvs = []}).

-record(arena_elite_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, defense = [],
	 manifesto = [], face_update_time = 0, face_file = <<>>,
	 break_groups = []}).

-record(c_e_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, power = 0,
	 lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, avatar_id = 0, is_king = 0,
	 match_power = 1, all_star = 1, win_rio = 1, zid = 1,
	 face_update_time = 0, face_file = <<>>}).

-record(arena_elite_rival_defense,
	{order, formation_type, hallows_id, hallows_lev,
	 hallows_skill_lev, partner_infos, hallows_look_id,
	 hallows_lucky, hallows_seal, hallows_all_look_ids = [],
	 extra = []}).

-record(arena_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, dower_skill = [],
	 set_skill = [], attr, extra = []}).

-record(arena_elite_rank,
	{ver = 2, rank = 0, id = {0, <<>>}, name = <<>>,
	 power = 0, lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, time = 0, avatar_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(role_arena_elite_log,
	{id = {0, <<>>}, list = []}).

-record(arena_elite_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_lev = 0, atk_rank = 0,
	 atk_elite_lev = 0, def_id = {0, <<>>}, def_name = <<>>,
	 def_face = 0, def_lev = 0, def_rank = 0,
	 def_elite_lev = 0, ret = 1, win_count = 0,
	 lose_count = 0, combat_type = 0, replay_list = [],
	 time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(arena_replay_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-record(m_arena_elite_war_order,
	{ver = 2, period = 0, period_day = 0, end_time = 0,
	 win_count = 0, rmb_status = 0, card = [],
	 lev_reward = [], start_time = 0, ext = []}).

-file("src/mod/replay_hall/replay_hall.erl", 34).

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

-file("src/mod/replay_hall/replay_hall.erl", 35).

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

-file("src/mod/replay_hall/replay_hall.erl", 36).

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

-file("src/mod/replay_hall/replay_hall.erl", 37).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/replay_hall/replay_hall.erl", 38).

-spec push_base(#role{}) -> ok.

push_base(Role) ->
    LikeL = var:get_var(Role, day, 58, []),
    LikeNum = length(LikeL),
    sys_conn:pack_send(19906, {LikeNum}),
    ok.

-spec convert(#replay_info{}, a | b, tuple(),
	      #{}) -> #replay_info{}.

convert(Replay = #replay_info{ext = ReplayExt}, a,
	R = #role{id = RoleId, name = Name, lev = Lev,
		  face_id = Face, power = Power},
	Ext) ->
    NewType = case maps:get(type, Ext, false) of
		Type when is_integer(Type) -> Type;
		_ -> 0
	      end,
    NewRound = case maps:get(round, Ext, false) of
		 Round when is_integer(Round) -> Round;
		 _ -> 1
	       end,
    {SpriteLev, Sprites} = sprite_tree:get_sprite_lev(R,
						      NewType, NewRound),
    {_, FaceFile, FaceUpdateTime} = role_face:face_info(R),
    FaceInfo = util:if_true(FaceUpdateTime > 0,
			    [{a_face, {FaceUpdateTime, FaceFile}}], []),
    Replay#replay_info{a_rid = RoleId, a_name = Name,
		       a_lev = Lev, a_face = Face,
		       a_power = maps:get(power, Ext, Power),
		       a_formation_type = maps:get(formation_type, Ext, 1),
		       a_camp_type = maps:get(camp_type, Ext, 0),
		       a_rank = maps:get(rank, Ext, 0),
		       ext =
			   lists:keystore(a_sprite_info, 1, ReplayExt,
					  {a_sprite_info, {SpriteLev, Sprites}})
			     ++ FaceInfo};
convert(Replay = #replay_info{ext = ReplayExt}, b,
	R = #role{id = RoleId, name = Name, lev = Lev,
		  face_id = Face, power = Power},
	Ext) ->
    NewType = case maps:get(type, Ext, false) of
		Type when is_integer(Type) -> Type;
		_ -> 0
	      end,
    NewRound = case maps:get(round, Ext, false) of
		 Round when is_integer(Round) -> Round;
		 _ -> 1
	       end,
    {SpriteLev, Sprites} = sprite_tree:get_sprite_lev(R,
						      NewType, NewRound),
    {_, FaceFile, FaceUpdateTime} = role_face:face_info(R),
    FaceInfo = util:if_true(FaceUpdateTime > 0,
			    [{b_face, {FaceUpdateTime, FaceFile}}], []),
    Replay#replay_info{b_rid = RoleId, b_name = Name,
		       b_lev = Lev, b_face = Face,
		       b_power = maps:get(power, Ext, Power),
		       b_formation_type = maps:get(formation_type, Ext, 1),
		       b_camp_type = maps:get(camp_type, Ext, 0),
		       b_rank = maps:get(rank, Ext, 0),
		       ext =
			   lists:keystore(b_sprite_info, 1, ReplayExt,
					  {b_sprite_info, {SpriteLev, Sprites}})
			     ++ FaceInfo};
convert(Replay = #replay_info{ext = ReplayExt}, a,
	R = #role_robot{id = RoleId, name = Name, lev = Lev,
			face_id = Face, power = Power,
			face_update_time = FaceUpdateTime,
			face_file = FaceFile},
	Ext) ->
    NewType = case maps:get(type, Ext, false) of
		Type when is_integer(Type) -> Type;
		_ -> 0
	      end,
    NewRound = case maps:get(round, Ext, false) of
		 Round when is_integer(Round) -> Round;
		 _ -> 1
	       end,
    {SpriteLev, Sprites} = sprite_tree:get_sprite_lev(R,
						      NewType, NewRound),
    FaceInfo = util:if_true(FaceUpdateTime > 0,
			    [{a_face, {FaceUpdateTime, FaceFile}}], []),
    Replay#replay_info{a_rid = RoleId, a_name = Name,
		       a_lev = Lev, a_face = Face,
		       a_power = maps:get(power, Ext, Power),
		       a_formation_type = maps:get(formation_type, Ext, 1),
		       a_camp_type = maps:get(camp_type, Ext, 0),
		       a_rank = maps:get(rank, Ext, 0),
		       ext =
			   lists:keystore(a_sprite_info, 1, ReplayExt,
					  {a_sprite_info, {SpriteLev, Sprites}})
			     ++ FaceInfo};
convert(Replay = #replay_info{ext = ReplayExt}, b,
	R = #role_robot{id = RoleId, name = Name, lev = Lev,
			face_id = Face, power = Power,
			face_update_time = FaceUpdateTime,
			face_file = FaceFile},
	Ext) ->
    NewType = case maps:get(type, Ext, false) of
		Type when is_integer(Type) -> Type;
		_ -> 0
	      end,
    NewRound = case maps:get(round, Ext, false) of
		 Round when is_integer(Round) -> Round;
		 _ -> 1
	       end,
    {SpriteLev, Sprites} = sprite_tree:get_sprite_lev(R,
						      NewType, NewRound),
    FaceInfo = util:if_true(FaceUpdateTime > 0,
			    [{b_face, {FaceUpdateTime, FaceFile}}], []),
    Replay#replay_info{b_rid = RoleId, b_name = Name,
		       b_lev = Lev, b_face = Face,
		       b_power = maps:get(power, Ext, Power),
		       b_formation_type = maps:get(formation_type, Ext, 1),
		       b_camp_type = maps:get(camp_type, Ext, 0),
		       b_rank = maps:get(rank, Ext, 0),
		       ext =
			   lists:keystore(b_sprite_info, 1, ReplayExt,
					  {b_sprite_info, {SpriteLev, Sprites}})
			     ++ FaceInfo};
convert(Replay = #replay_info{ext = ReplayExt}, b,
	#arena_f{id = RoleId, name = Name, lev = Lev,
		 face = Face, power = Power,
		 face_update_time = FaceUpdateTime,
		 face_file = FaceFile},
	Ext) ->
    FaceInfo = util:if_true(FaceUpdateTime > 0,
			    [{b_face, {FaceUpdateTime, FaceFile}}], []),
    Replay#replay_info{b_rid = RoleId, b_name = Name,
		       b_lev = Lev, b_face = Face,
		       b_power = maps:get(power, Ext, Power),
		       b_formation_type = maps:get(formation_type, Ext, 1),
		       b_camp_type = maps:get(camp_type, Ext, 0),
		       b_rank = maps:get(rank, Ext, 0),
		       ext =
			   lists:keystore(b_sprite_info, 1, ReplayExt,
					  {b_sprite_info,
					   {maps:get(sprite_lev, Ext, 0),
					    maps:get(sprites, Ext, [])}})
			     ++ FaceInfo};
convert(Replay = #replay_info{ext = ReplayExt}, a,
	#champion_pk{a_id = RoleId, a_name = Name, a_lev = Lev,
		     a_face = Face, a_face_update_time = FaceUpdateTime,
		     a_face_file = FaceFile, a_power = Power,
		     a_sprite_lev = SpriteLev, a_sprites = Sprites},
	Ext) ->
    FaceInfo = util:if_true(FaceUpdateTime > 0,
			    [{a_face, {FaceUpdateTime, FaceFile}}], []),
    Replay#replay_info{a_rid = RoleId, a_name = Name,
		       a_lev = Lev, a_face = Face,
		       a_power = maps:get(power, Ext, Power),
		       a_formation_type = maps:get(formation_type, Ext, 1),
		       a_camp_type = maps:get(camp_type, Ext, 0),
		       a_rank = maps:get(rank, Ext, 0),
		       ext =
			   lists:keystore(a_sprite_info, 1, ReplayExt,
					  {a_sprite_info, {SpriteLev, Sprites}})
			     ++ FaceInfo};
convert(Replay = #replay_info{ext = ReplayExt}, b,
	#champion_pk{b_id = RoleId, b_name = Name, b_lev = Lev,
		     b_face = Face, b_face_update_time = FaceUpdateTime,
		     b_face_file = FaceFile, b_power = Power,
		     b_sprite_lev = SpriteLev, b_sprites = Sprites},
	Ext) ->
    FaceInfo = util:if_true(FaceUpdateTime > 0,
			    [{b_face, {FaceUpdateTime, FaceFile}}], []),
    Replay#replay_info{b_rid = RoleId, b_name = Name,
		       b_lev = Lev, b_face = Face,
		       b_power = maps:get(power, Ext, Power),
		       b_formation_type = maps:get(formation_type, Ext, 1),
		       b_camp_type = maps:get(camp_type, Ext, 0),
		       b_rank = maps:get(rank, Ext, 0),
		       ext =
			   lists:keystore(b_sprite_info, 1, ReplayExt,
					  {b_sprite_info, {SpriteLev, Sprites}})
			     ++ FaceInfo};
convert(Replay = #replay_info{ext = ReplayExt}, a,
	#peak_champion_pk{a_id = RoleId, a_name = Name,
			  a_lev = Lev, a_face = Face,
			  a_face_update_time = FaceUpdateTime,
			  a_face_file = FaceFile, a_power = Power,
			  a_sprite_lev = SpriteLev, a_sprites = Sprites},
	Ext) ->
    FaceInfo = util:if_true(FaceUpdateTime > 0,
			    [{a_face, {FaceUpdateTime, FaceFile}}], []),
    Replay#replay_info{a_rid = RoleId, a_name = Name,
		       a_lev = Lev, a_face = Face,
		       a_power = maps:get(power, Ext, Power),
		       a_formation_type = maps:get(formation_type, Ext, 1),
		       a_camp_type = maps:get(camp_type, Ext, 0),
		       a_rank = maps:get(rank, Ext, 0),
		       ext =
			   lists:keystore(a_sprite_info, 1, ReplayExt,
					  {a_sprite_info, {SpriteLev, Sprites}})
			     ++ FaceInfo};
convert(Replay = #replay_info{ext = ReplayExt}, b,
	#peak_champion_pk{b_id = RoleId, b_name = Name,
			  b_lev = Lev, b_face = Face,
			  b_face_update_time = FaceUpdateTime,
			  b_face_file = FaceFile, b_power = Power,
			  b_sprite_lev = SpriteLev, b_sprites = Sprites},
	Ext) ->
    FaceInfo = util:if_true(FaceUpdateTime > 0,
			    [{b_face, {FaceUpdateTime, FaceFile}}], []),
    Replay#replay_info{b_rid = RoleId, b_name = Name,
		       b_lev = Lev, b_face = Face,
		       b_power = maps:get(power, Ext, Power),
		       b_formation_type = maps:get(formation_type, Ext, 1),
		       b_camp_type = maps:get(camp_type, Ext, 0),
		       b_rank = maps:get(rank, Ext, 0),
		       ext =
			   lists:keystore(b_sprite_info, 1, ReplayExt,
					  {b_sprite_info, {SpriteLev, Sprites}})
			     ++ FaceInfo};
convert(Replay = #replay_info{ext = ReplayExt}, a,
	#champion_32_pk{id = RoleId, name = Name, lev = Lev,
			face = Face, max_power = Power,
			face_update_time = FaceUpdateTime,
			face_file = FaceFile},
	Ext) ->
    FaceInfo = util:if_true(FaceUpdateTime > 0,
			    [{a_face, {FaceUpdateTime, FaceFile}}], []),
    Replay#replay_info{a_rid = RoleId, a_name = Name,
		       a_lev = Lev, a_face = Face,
		       a_power = maps:get(power, Ext, Power),
		       a_formation_type = maps:get(formation_type, Ext, 1),
		       a_camp_type = maps:get(camp_type, Ext, 0),
		       a_rank = maps:get(rank, Ext, 0),
		       ext =
			   lists:keystore(a_sprite_info, 1, ReplayExt,
					  {a_sprite_info,
					   {maps:get(sprite_lev, Ext, 0),
					    maps:get(sprites, Ext, [])}})
			     ++ FaceInfo};
convert(Replay = #replay_info{ext = ReplayExt}, b,
	#champion_32_pk{id = RoleId, name = Name, lev = Lev,
			face = Face, face_update_time = FaceUpdateTime,
			face_file = FaceFile, max_power = Power},
	Ext) ->
    FaceInfo = util:if_true(FaceUpdateTime > 0,
			    [{b_face, {FaceUpdateTime, FaceFile}}], []),
    Replay#replay_info{b_rid = RoleId, b_name = Name,
		       b_lev = Lev, b_face = Face,
		       b_power = maps:get(power, Ext, Power),
		       b_formation_type = maps:get(formation_type, Ext, 1),
		       b_camp_type = maps:get(camp_type, Ext, 0),
		       b_rank = maps:get(rank, Ext, 0),
		       ext =
			   lists:keystore(b_sprite_info, 1, ReplayExt,
					  {b_sprite_info,
					   {maps:get(sprite_lev, Ext, 0),
					    maps:get(sprites, Ext, [])}})
			     ++ FaceInfo};
convert(Replay = #replay_info{ext = ReplayExt}, b,
	#guild_war_role{id = RoleId, name = Name, lev = Lev,
			face = Face, power = Power,
			face_update_time = FaceUpdateTime,
			face_file = FaceFile},
	Ext) ->
    FaceInfo = util:if_true(FaceUpdateTime > 0,
			    [{b_face, {FaceUpdateTime, FaceFile}}], []),
    Replay#replay_info{b_rid = RoleId, b_name = Name,
		       b_lev = Lev, b_face = Face,
		       b_power = maps:get(power, Ext, Power),
		       b_formation_type = maps:get(formation_type, Ext, 1),
		       b_camp_type = maps:get(camp_type, Ext, 0),
		       b_rank = maps:get(rank, Ext, 0),
		       ext =
			   lists:keystore(b_sprite_info, 1, ReplayExt,
					  {b_sprite_info,
					   {maps:get(sprite_lev, Ext, 0),
					    maps:get(sprites, Ext, [])}})
			     ++ FaceInfo};
convert(Replay = #replay_info{ext = ReplayExt}, b,
	#sky_ladder_f{id = RoleId, name = Name, lev = Lev,
		      face = Face, power = Power,
		      face_update_time = FaceUpdateTime,
		      face_file = FaceFile},
	Ext) ->
    FaceInfo = util:if_true(FaceUpdateTime > 0,
			    [{b_face, {FaceUpdateTime, FaceFile}}], []),
    Replay#replay_info{b_rid = RoleId, b_name = Name,
		       b_lev = Lev, b_face = Face,
		       b_power = maps:get(power, Ext, Power),
		       b_formation_type = maps:get(formation_type, Ext, 1),
		       b_camp_type = maps:get(camp_type, Ext, 0),
		       b_rank = maps:get(rank, Ext, 0),
		       ext =
			   lists:keystore(b_sprite_info, 1, ReplayExt,
					  {b_sprite_info,
					   {maps:get(sprite_lev, Ext, 0),
					    maps:get(sprites, Ext, [])}})
			     ++ FaceInfo};
convert(Replay = #replay_info{ext = ReplayExt}, b,
	#arena_elite_role{id = RoleId, name = Name, lev = Lev,
			  face = Face, power = Power,
			  face_update_time = FaceUpdateTime,
			  face_file = FaceFile},
	Ext) ->
    FaceInfo = util:if_true(FaceUpdateTime > 0,
			    [{b_face, {FaceUpdateTime, FaceFile}}], []),
    Replay#replay_info{b_rid = RoleId, b_name = Name,
		       b_lev = Lev, b_face = Face,
		       b_power = maps:get(power, Ext, Power),
		       b_formation_type = maps:get(formation_type, Ext, 1),
		       b_camp_type = maps:get(camp_type, Ext, 0),
		       b_rank = maps:get(rank, Ext, 0),
		       ext =
			   lists:keystore(b_sprite_info, 1, ReplayExt,
					  {b_sprite_info,
					   {maps:get(sprite_lev, Ext, 0),
					    maps:get(sprites, Ext, [])}})
			     ++ FaceInfo}.

calc_replay_info(Combat = #combat{replay_info =
				      ReplayInfo = #replay_info{ext = Ext},
				  type = CombatType},
		 Ret) ->
    Fun = fun (Pos, {AccList, AccPower}) ->
		  case combat_dict:object(Pos) of
		    #fight_object{replay = R, hp = Hp, hp_max = HpMax,
				  fight_attr = #attr{atk = Atk},
				  guild_break_power = AddPower} ->
			{[R#replay_partner{hurt = combat_dict:get_hurt(Pos),
					   curt = combat_dict:get_curt(Pos),
					   behurt =
					       combat_dict:get_be_hurt(Pos),
					   pos = combat_target:logic_pos(Pos),
					   hp = Hp, hp_max = HpMax, atk = Atk}
			  | AccList],
			 AddPower + AccPower};
		    _ -> {AccList, AccPower}
		  end
	  end,
    MaxActionCount =
	combat_type_data:get_max_action_count(combat_dict:combat_type()),
    Round = min(combat_dict:action_count(), MaxActionCount),
    {APlist, APAddPower} = lists:foldl(Fun, {[], 0},
				       combat_dict:all_a()),
    {BPlist, BPAddPower} = lists:foldl(Fun, {[], 0},
				       combat_dict:all_b()),
    APower = lists:sum([Power
			|| #replay_partner{power = Power} <- APlist]),
    BPower = lists:sum([Power
			|| #replay_partner{power = Power} <- BPlist]),
    Ext1 = lists:keystore(a_add_power, 1, Ext,
			  {a_add_power, APAddPower}),
    NewExt = lists:keystore(b_add_power, 1, Ext1,
			    {b_add_power, BPAddPower}),
    Combat#combat{replay_info =
		      ReplayInfo#replay_info{combat_type = CombatType,
					     round = Round, ret = Ret,
					     a_camp_type =
						 combat_dict:get_group_halo(1),
					     b_camp_type =
						 combat_dict:get_group_halo(2),
					     a_plist = APlist, b_plist = BPlist,
					     a_power = APower, b_power = BPower,
					     time = date:unixtime(),
					     ext = NewExt}};
calc_replay_info(Combat, _Winner) -> Combat.

-spec list_role(#role{}, pos_integer()) -> list().

list_role(Role = #role{id = RoleId}, Type = 99) ->
    #replay_role{list = L} =
	replay_hall_lib:get_role_replay({RoleId, Type}),
    LikeL = var:get_var(Role, day, 58, []),
    to_cli(lists:reverse(lists:sort(L)), LikeL, L, []);
list_role(Role = #role{id = RoleId}, Type) ->
    #replay_role{list = L} =
	replay_hall_lib:get_role_replay({RoleId, Type}),
    #replay_role{list = Collects} =
	replay_hall_lib:get_role_replay({RoleId, 99}),
    LikeL = var:get_var(Role, day, 58, []),
    to_cli(L, LikeL, Collects, []).

to_cli([], _LikeL, _Collects, L) -> lists:reverse(L);
to_cli([Id | T], LikeL, Collects, L) ->
    case replay_hall_lib:get_replay_info(Id) of
      {ok,
       R = #replay_info{id = {ReplayId, ReplaySid},
			ext = ReplayExt, combat_type = CombatType,
			sec_type = SecType, a_plist = APlist,
			b_plist = BPlist}} ->
	  APlist1 = [P#replay_partner{eqms = [], artifacts = [],
				      skills = [],
				      ext =
					  [{5, list_util:keyfind(5, Ext, 0)},
					   {11, list_util:keyfind(11, Ext, 0)}]}
		     || P = #replay_partner{ext = Ext} <- APlist],
	  BPlist1 = [P#replay_partner{eqms = [], artifacts = [],
				      skills = [],
				      ext =
					  [{5, list_util:keyfind(5, Ext, 0)},
					   {11, list_util:keyfind(11, Ext, 0)}]}
		     || P = #replay_partner{ext = Ext} <- BPlist],
	  CliExt = to_cli_ext(ReplayExt),
	  CliExt2 = case CombatType of
		      31 -> [{1, 0, ReplaySid, []} | CliExt];
		      _ -> CliExt
		    end,
	  NewR = R#replay_info{id = ReplayId, a_plist = APlist1,
			       b_plist = BPlist1, ext = CliExt2},
	  Name = sec_type_name(CombatType, SecType),
	  Flag = util:if_true(lists:member(Id, LikeL), 1, 0),
	  IsCollect = util:if_true(lists:member(Id, Collects), 1,
				   0),
	  {AFaceUpdateTime, AFaceFile} = list_util:keyfind(a_face,
							   ReplayExt,
							   {0, <<>>}),
	  {BFaceUpdateTime, BFaceFile} = list_util:keyfind(b_face,
							   ReplayExt,
							   {0, <<>>}),
	  Data = {Name, Flag, IsCollect, AFaceUpdateTime,
		  AFaceFile, BFaceUpdateTime, BFaceFile, NewR},
	  to_cli(T, LikeL, Collects, [Data | L]);
      {ok,
       R = #replay_info{combat_type = CombatType,
			ext = ReplayExt, sec_type = SecType, a_plist = APlist,
			b_plist = BPlist}} ->
	  APlist1 = [P#replay_partner{eqms = [], artifacts = [],
				      skills = [],
				      ext =
					  [{5, list_util:keyfind(5, Ext, 0)},
					   {11, list_util:keyfind(11, Ext, 0)}]}
		     || P = #replay_partner{ext = Ext} <- APlist],
	  BPlist1 = [P#replay_partner{eqms = [], artifacts = [],
				      skills = [],
				      ext =
					  [{5, list_util:keyfind(5, Ext, 0)},
					   {11, list_util:keyfind(11, Ext, 0)}]}
		     || P = #replay_partner{ext = Ext} <- BPlist],
	  CliExt = to_cli_ext(ReplayExt),
	  NewR = R#replay_info{a_plist = APlist1,
			       b_plist = BPlist1, ext = CliExt},
	  Name = sec_type_name(CombatType, SecType),
	  Flag = util:if_true(lists:member(Id, LikeL), 1, 0),
	  IsCollect = util:if_true(lists:member(Id, Collects), 1,
				   0),
	  {AFaceUpdateTime, AFaceFile} = list_util:keyfind(a_face,
							   ReplayExt,
							   {0, <<>>}),
	  {BFaceUpdateTime, BFaceFile} = list_util:keyfind(b_face,
							   ReplayExt,
							   {0, <<>>}),
	  Data = {Name, Flag, IsCollect, AFaceUpdateTime,
		  AFaceFile, BFaceUpdateTime, BFaceFile, NewR},
	  to_cli(T, LikeL, Collects, [Data | L]);
      _ -> to_cli(T, LikeL, Collects, L)
    end.

to_cli_ext(ReplayExt) ->
    {ASpriteLev, ASprites} =
	list_util:keyfind(a_sprite_info, ReplayExt, {0, []}),
    {BSpriteLev, BSprites} =
	list_util:keyfind(b_sprite_info, ReplayExt, {0, []}),
    AAddPower = list_util:keyfind(a_add_power, ReplayExt,
				  0),
    BAddPower = list_util:keyfind(b_add_power, ReplayExt,
				  0),
    [{2, ASpriteLev, <<>>, []}, {3, 0, <<>>, ASprites},
     {4, BSpriteLev, <<>>, []}, {5, 0, <<>>, BSprites},
     {6, AAddPower, <<>>, []}, {7, BAddPower, <<>>, []}].

sec_type_name(31, 6401) ->
    lang:get(<<"周冠军赛-64强"/utf8>>);
sec_type_name(31, 6402) ->
    lang:get(<<"周冠军赛-32强"/utf8>>);
sec_type_name(31, 6403) ->
    lang:get(<<"周冠军赛-16强"/utf8>>);
sec_type_name(31, 801) -> lang:get(<<"周冠军赛-8强"/utf8>>);
sec_type_name(31, 802) -> lang:get(<<"周冠军赛-半决赛"/utf8>>);
sec_type_name(31, 803) -> lang:get(<<"周冠军赛-决赛"/utf8>>);
sec_type_name(31, _) -> lang:get(<<"周冠军赛-选拔赛"/utf8>>);
sec_type_name(10, 3201) -> lang:get(<<"冠军赛-32强"/utf8>>);
sec_type_name(10, 3202) -> lang:get(<<"冠军赛-16强"/utf8>>);
sec_type_name(10, 3203) -> lang:get(<<"冠军赛-8强赛"/utf8>>);
sec_type_name(10, 401) -> lang:get(<<"冠军赛-半决赛"/utf8>>);
sec_type_name(10, 402) -> lang:get(<<"冠军赛-决赛"/utf8>>);
sec_type_name(10, _) -> lang:get(<<"冠军赛-选拔赛"/utf8>>);
sec_type_name(2, _) -> lang:get(<<"竞技场"/utf8>>);
sec_type_name(8, _) -> lang:get(<<"切磋"/utf8>>);
sec_type_name(16, _) -> lang:get(<<"公会战"/utf8>>);
sec_type_name(18, _) -> lang:get(<<"跨服天梯"/utf8>>);
sec_type_name(23, _) -> lang:get(<<"段位赛-常规赛"/utf8>>);
sec_type_name(_CombatType, _) -> <<>>.

calc_sort_score(#replay_info{id = Id, play = Play,
			     a_power = APower, b_power = BPower, ret = Ret,
			     a_plist = APlist, b_plist = BPlist}) ->
    BaseVal = video_data:get_const(video_base_weight),
    PlayVal = util:if_true(Play >=
			     video_data:get_const(play_weight_condition),
			   video_data:get_const(play_weight_increase), 0),
    PowerVal = util:if_true(abs(APower - BPower) /
			      max(APower, BPower)
			      <
			      video_data:get_const(battlenum_weight_condition),
			    video_data:get_const(battlenum_weight_increase), 0),
    PartnerVal = case game_lib:server_open_time(day) =<
			video_data:get_const(open_time)
		     of
		   true ->
		       PList = case Ret of
				 0 -> [];
				 1 -> APlist;
				 _ -> BPlist
			       end,
		       case [1
			     || #replay_partner{bid = PBid} <- PList,
				lists:member(PBid,
					     video_data:get_const(hero_add_weight_condition))]
			   of
			 [] -> 0;
			 _ -> video_data:get_const(hero_add_weight)
		       end;
		   _ -> 0
		 end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidreplay_hall425, _,
       {__Levelreplay_hall425, __Tracesreplay_hall425}}
	  when __Levelreplay_hall425 band 128 /= 0 orelse
		 __Tracesreplay_hall425 /= [] ->
	  lager:do_log(debug,
		       [{module, replay_hall}, {function, calc_sort_score},
			{line, 425}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("calc_sort_score===~w ",
				     [{Id, BaseVal, PlayVal, PowerVal,
				       PartnerVal}]),
		       none, 4096, 128, __Levelreplay_hall425,
		       __Tracesreplay_hall425, lager_event,
		       __Pidreplay_hall425);
      _ -> ok
    end,
    BaseVal + PlayVal + PowerVal + PartnerVal.

calc_new_sort_score(#replay_info{play = Play,
				 a_power = APower, b_power = BPower}) ->
    BaseVal = video_data:get_const(nh_video_base_weight),
    PlayVal = util:if_true(Play >=
			     video_data:get_const(nh_play_weight_condition),
			   video_data:get_const(nh_play_weight_increase), 0),
    PowerVal = util:if_true(abs(APower - BPower) /
			      max(APower, BPower)
			      <
			      video_data:get_const(nh_battlenum_weight_condition),
			    video_data:get_const(nh_battlenum_weight_increase),
			    0),
    BaseVal + PlayVal + PowerVal.

-spec list(#role{}, Type :: pos_integer(),
	   CondType :: pos_integer(), Start :: pos_integer(),
	   Num :: pos_integer()) -> tuple().

list(Role = #role{id = RoleId}, Type = 97, CondType,
     Start, Num) ->
    #replay_role{list = L} =
	replay_hall_lib:get_role_replay(97),
    Len = length(L),
    LikeL = var:get_var(Role, day, 58, []),
    #replay_role{list = Collects} =
	replay_hall_lib:get_role_replay({RoleId, 99}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidreplay_hall442, _,
       {__Levelreplay_hall442, __Tracesreplay_hall442}}
	  when __Levelreplay_hall442 band 128 /= 0 orelse
		 __Tracesreplay_hall442 /= [] ->
	  lager:do_log(debug,
		       [{module, replay_hall}, {function, list}, {line, 442},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("list_replay type=~w cond_type=~w start=~w "
				     "num=~w len=~w",
				     [Type, CondType, Start, Num, Len]),
		       none, 4096, 128, __Levelreplay_hall442,
		       __Tracesreplay_hall442, lager_event,
		       __Pidreplay_hall442);
      _ -> ok
    end,
    DataL0 = to_cli(L, LikeL, Collects, []),
    DataL1 = [{calc_new_sort_score(R), Name, Flag,
	       IsCollect, AFaceUpdateTime, AFaceFile, BFaceUpdateTime,
	       BFaceFile, R}
	      || {Name, Flag, IsCollect, AFaceUpdateTime, AFaceFile,
		  BFaceUpdateTime, BFaceFile, R}
		     <- DataL0],
    SortDataL = util:keys_sort([1], DataL1),
    DataL = [{Name, Flag, IsCollect, AFaceUpdateTime,
	      AFaceFile, BFaceUpdateTime, BFaceFile, R}
	     || {_, Name, Flag, IsCollect, AFaceUpdateTime,
		 AFaceFile, BFaceUpdateTime, BFaceFile, R}
		    <- SortDataL],
    {Type, CondType, Start, Num, Len, DataL};
list(Role = #role{id = RoleId}, Type = 98, CondType,
     Start, Num) ->
    #replay_role{list = L} =
	replay_hall_lib:get_role_replay(98),
    Map = case L of
	    [M] -> M;
	    [] -> #{}
	  end,
    HotL = maps:get(list, Map, []),
    L2 = [Id || {Id, _} <- HotL],
    Len = length(L2),
    LikeL = var:get_var(Role, day, 58, []),
    #replay_role{list = Collects} =
	replay_hall_lib:get_role_replay({RoleId, 99}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidreplay_hall461, _,
       {__Levelreplay_hall461, __Tracesreplay_hall461}}
	  when __Levelreplay_hall461 band 128 /= 0 orelse
		 __Tracesreplay_hall461 /= [] ->
	  lager:do_log(debug,
		       [{module, replay_hall}, {function, list}, {line, 461},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("list_replay type=~w cond_type=~w start=~w "
				     "num=~w len=~w",
				     [Type, CondType, Start, Num, Len]),
		       none, 4096, 128, __Levelreplay_hall461,
		       __Tracesreplay_hall461, lager_event,
		       __Pidreplay_hall461);
      _ -> ok
    end,
    DataL0 = to_cli(L2, LikeL, Collects, []),
    DataL1 = [{calc_sort_score(R), Name, Flag, IsCollect,
	       AFaceUpdateTime, AFaceFile, BFaceUpdateTime, BFaceFile,
	       R}
	      || {Name, Flag, IsCollect, AFaceUpdateTime, AFaceFile,
		  BFaceUpdateTime, BFaceFile, R}
		     <- DataL0],
    SortDataL = util:keys_sort([1], DataL1),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidreplay_hall465, _,
       {__Levelreplay_hall465, __Tracesreplay_hall465}}
	  when __Levelreplay_hall465 band 128 /= 0 orelse
		 __Tracesreplay_hall465 /= [] ->
	  lager:do_log(debug,
		       [{module, replay_hall}, {function, list}, {line, 465},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("list_replay type=~w cond_type=~w start=~w "
				     "num=~w len=~w ~w",
				     [Type, CondType, Start, Num, Len,
				      [element(1, I) || I <- SortDataL]]),
		       none, 4096, 128, __Levelreplay_hall465,
		       __Tracesreplay_hall465, lager_event,
		       __Pidreplay_hall465);
      _ -> ok
    end,
    DataL = [{Name, Flag, IsCollect, AFaceUpdateTime,
	      AFaceFile, BFaceUpdateTime, BFaceFile, R}
	     || {_, Name, Flag, IsCollect, AFaceUpdateTime,
		 AFaceFile, BFaceUpdateTime, BFaceFile, R}
		    <- SortDataL],
    {Type, CondType, Start, Num, Len, DataL};
list(Role = #role{id = RoleId}, Type, CondType, Start,
     Num) ->
    L1 = case get({srv_replay_list, Type, CondType}) of
	   L0 = [_ | _] when Start > 1 -> L0;
	   _ ->
	       Ms = case {Type, CondType} of
		      {3, 1} ->
			  [{{replay, '$1', 3, '_', '_', '_', '_', '_', '$2',
			     '_', '_', '_', '$3', '_'},
			    [{'orelse', {'>', '$2', 150}, {'>', '$3', 150}}],
			    ['$1']}];
		      {3, 2} ->
			  [{{replay, '$1', 3, '_', '_', '_', '_', '_', '$2',
			     '_', '_', '_', '$3', '_'},
			    [{'orelse',
			      {'andalso', {'>', '$2', 100}, {'=<', '$2', 150}},
			      {'andalso', {'>', '$3', 100},
			       {'=<', '$3', 150}}}],
			    ['$1']}];
		      {3, 3} ->
			  [{{replay, '$1', 3, '_', '_', '_', '_', '_', '$2',
			     '_', '_', '_', '$3', '_'},
			    [{'orelse',
			      {'andalso', {'>', '$2', 50}, {'=<', '$2', 100}},
			      {'andalso', {'>', '$3', 50}, {'=<', '$3', 100}}}],
			    ['$1']}];
		      {3, 4} ->
			  [{{replay, '$1', 3, '_', '_', '_', '_', '_', '$2',
			     '_', '_', '_', '$3', '_'},
			    [{'orelse', {'=<', '$2', 50}, {'=<', '$3', 50}}],
			    ['$1']}];
		      {1, 1} ->
			  [{{replay, '$1', 1, '_', '_', '_', '$2', '_', '_',
			     '_', '$3', '_', '_', '_'},
			    [{'orelse',
			      {'andalso', {'>', '$2', 0}, {'=<', '$2', 10}},
			      {'andalso', {'>', '$3', 0}, {'=<', '$3', 10}}}],
			    ['$1']}];
		      {1, 2} ->
			  [{{replay, '$1', 1, '_', '_', '_', '$2', '_', '_',
			     '_', '$3', '_', '_', '_'},
			    [{'orelse',
			      {'andalso', {'>', '$2', 10}, {'=<', '$2', 50}},
			      {'andalso', {'>', '$3', 10}, {'=<', '$3', 50}}}],
			    ['$1']}];
		      {1, 3} ->
			  [{{replay, '$1', 1, '_', '_', '_', '$2', '_', '_',
			     '_', '$3', '_', '_', '_'},
			    [{'orelse',
			      {'andalso', {'>', '$2', 50}, {'=<', '$2', 100}},
			      {'andalso', {'>', '$3', 50}, {'=<', '$3', 100}}}],
			    ['$1']}];
		      {1, 4} ->
			  [{{replay, '$1', 1, '_', '_', '_', '$2', '_', '_',
			     '_', '$3', '_', '_', '_'},
			    [{'orelse',
			      {'orelse', {'==', '$2', 0}, {'>', '$2', 100}},
			      {'orelse', {'=:=', '$3', 0}, {'>', '$3', 100}}}],
			    ['$1']}];
		      {2, 1} ->
			  [{{replay, '$1', 2, '_', 402, '_', '_', '_', '_', '_',
			     '_', '_', '_', '_'},
			    [], ['$1']}];
		      {2, 2} ->
			  [{{replay, '$1', 2, '_', 401, '_', '_', '_', '_', '_',
			     '_', '_', '_', '_'},
			    [], ['$1']}];
		      {2, 3} ->
			  [{{replay, '$1', 2, '_', 3203, '_', '_', '_', '_',
			     '_', '_', '_', '_', '_'},
			    [], ['$1']}];
		      {2, 4} ->
			  [{{replay, '$1', 2, '_', 3202, '_', '_', '_', '_',
			     '_', '_', '_', '_', '_'},
			    [], ['$1']}];
		      {2, 5} ->
			  [{{replay, '$1', 2, '_', 3201, '_', '_', '_', '_',
			     '_', '_', '_', '_', '_'},
			    [], ['$1']}];
		      {2, 6} ->
			  [{{replay, '$1', 2, '_', '$2', '_', '_', '_', '_',
			     '_', '_', '_', '_', '_'},
			    [{'<', '$2', 200}], ['$1']}];
		      {7, 1} ->
			  [{{replay, '$1', 7, '_', 803, '_', '_', '_', '_', '_',
			     '_', '_', '_', '_'},
			    [], ['$1']}];
		      {7, 2} ->
			  [{{replay, '$1', 7, '_', 802, '_', '_', '_', '_', '_',
			     '_', '_', '_', '_'},
			    [], ['$1']}];
		      {7, 3} ->
			  [{{replay, '$1', 7, '_', 801, '_', '_', '_', '_', '_',
			     '_', '_', '_', '_'},
			    [], ['$1']}];
		      {7, 4} ->
			  [{{replay, '$1', 7, '_', 6403, '_', '_', '_', '_',
			     '_', '_', '_', '_', '_'},
			    [], ['$1']}];
		      {7, 5} ->
			  [{{replay, '$1', 7, '_', 6402, '_', '_', '_', '_',
			     '_', '_', '_', '_', '_'},
			    [], ['$1']}];
		      {7, 6} ->
			  [{{replay, '$1', 7, '_', 6401, '_', '_', '_', '_',
			     '_', '_', '_', '_', '_'},
			    [], ['$1']}];
		      {7, 7} ->
			  [{{replay, '$1', 7, '_', '$2', '_', '_', '_', '_',
			     '_', '_', '_', '_', '_'},
			    [{'<', '$2', 200}], ['$1']}];
		      _ ->
			  [{{replay, '$1', '$2', '_', '_', '_', '_', '_', '_',
			     '_', '_', '_', '_', '_'},
			    [{'=:=', {const, Type}, '$2'}], ['$1']}]
		    end,
	       L0 = lists:reverse(lists:sort(ets:select(replay, Ms))),
	       put({srv_replay_list, Type, CondType}, L0),
	       L0
	 end,
    L2 = lists:sublist(L1, max(1, Start), min(50, Num)),
    Len = length(L1),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidreplay_hall527, _,
       {__Levelreplay_hall527, __Tracesreplay_hall527}}
	  when __Levelreplay_hall527 band 128 /= 0 orelse
		 __Tracesreplay_hall527 /= [] ->
	  lager:do_log(debug,
		       [{module, replay_hall}, {function, list}, {line, 527},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("list_replay type=~w cond_type=~w start=~w "
				     "num=~w len=~w",
				     [Type, CondType, Start, Num, Len]),
		       none, 4096, 128, __Levelreplay_hall527,
		       __Tracesreplay_hall527, lager_event,
		       __Pidreplay_hall527);
      _ -> ok
    end,
    LikeL = var:get_var(Role, day, 58, []),
    #replay_role{list = Collects} =
	replay_hall_lib:get_role_replay({RoleId, 99}),
    DataL = to_cli(L2, LikeL, Collects, []),
    {Type, CondType, Start, Num, Len, DataL}.

-spec like(#role{}, Id :: pos_integer(),
	   SrvId :: bitstring(),
	   CombatType :: pos_integer()) -> {false, binary()} |
					   {ok, #role{}}.

like(Role, ReplayId, SrvId, 18) ->
    LikeL = var:get_var(Role, day, 58, []),
    Max = video_data:get_const(likes_limit),
    Id = {ReplayId, SrvId},
    case lists:member(Id, LikeL) of
      true -> {false, lang:get(<<"今天已点赞过该录像"/utf8>>)};
      _ when length(LikeL) >= Max ->
	  {false, lang:get(<<"今天点赞次数已用完"/utf8>>)};
      _ ->
	  Tab = combat_replay_mgr:replay_info_tab(Id),
	  case ets:member(Tab, Id) of
	    true ->
		Items = video_data:get_const(likes_reward),
		GL = format:val_to_gain(Items, replay_like),
		case role_gain:do(Role, GL) of
		  {ok, Role1} ->
		      Msg1 = format:gain_text(GL, Role1),
		      notice:alert(Role1,
				   color:msg(lang:get(<<"点赞成功，~ts"/utf8>>),
					     [Msg1])),
		      ets:update_counter(Tab, Id, {#replay_info.like, 1}),
		      NRole = var:set_var(Role1, day, 58, [Id | LikeL]),
		      push_base(NRole),
		      NewRole = role_trigger:fire(#evt_replay_hall_like{},
						  NRole),
		      {ok, NewRole};
		  _ -> {false, lang:get(<<"点赞失败"/utf8>>)}
		end;
	    _ -> like(Role, ReplayId, SrvId, 1)
	  end
    end;
like(Role, ReplayId, SrvId, 31) ->
    LikeL = var:get_var(Role, day, 58, []),
    Max = video_data:get_const(likes_limit),
    Id = {ReplayId, SrvId},
    case lists:member(Id, LikeL) of
      true -> {false, lang:get(<<"今天已点赞过该录像"/utf8>>)};
      _ when length(LikeL) >= Max ->
	  {false, lang:get(<<"今天点赞次数已用完"/utf8>>)};
      _ ->
	  Tab = combat_replay_mgr:replay_info_tab(Id),
	  case ets:member(Tab, Id) of
	    true ->
		Items = video_data:get_const(likes_reward),
		GL = format:val_to_gain(Items, replay_like),
		case role_gain:do(Role, GL) of
		  {ok, Role1} ->
		      Msg1 = format:gain_text(GL, Role1),
		      notice:alert(Role1,
				   color:msg(lang:get(<<"点赞成功，~ts"/utf8>>),
					     [Msg1])),
		      ets:update_counter(Tab, Id, {#replay_info.like, 1}),
		      NRole = var:set_var(Role1, day, 58, [Id | LikeL]),
		      push_base(NRole),
		      NewRole = role_trigger:fire(#evt_replay_hall_like{},
						  NRole),
		      {ok, NewRole};
		  _ -> {false, lang:get(<<"点赞失败"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"录像信息不存在"/utf8>>)}
	  end
    end;
like(Role, Id, _, _) ->
    LikeL = var:get_var(Role, day, 58, []),
    Max = video_data:get_const(likes_limit),
    case lists:member(Id, LikeL) of
      true -> {false, lang:get(<<"今天已点赞过该录像"/utf8>>)};
      _ when length(LikeL) >= Max ->
	  {false, lang:get(<<"今天点赞次数已用完"/utf8>>)};
      _ ->
	  Tab = combat_replay_mgr:replay_info_tab(Id),
	  case ets:member(Tab, Id) of
	    true ->
		Items = video_data:get_const(likes_reward),
		GL = format:val_to_gain(Items, replay_like),
		case role_gain:do(Role, GL) of
		  {ok, Role1} ->
		      Msg1 = format:gain_text(GL, Role1),
		      notice:alert(Role1,
				   color:msg(lang:get(<<"点赞成功，~ts"/utf8>>),
					     [Msg1])),
		      ets:update_counter(Tab, Id, {#replay_info.like, 1}),
		      NRole = var:set_var(Role1, day, 58, [Id | LikeL]),
		      push_base(NRole),
		      NewRole = role_trigger:fire(#evt_replay_hall_like{},
						  NRole),
		      {ok, NewRole};
		  _ -> {false, lang:get(<<"点赞失败"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"录像信息不存在"/utf8>>)}
	  end
    end.

-spec collect(#role{}, Id :: pos_integer(),
	      Collect :: 0..1, SrvId :: bitstring(),
	      CombatType :: pos_integer()) -> {false, binary()} |
					      {ok, #role{}}.

collect(Role = #role{id = RoleId}, ReplayId, Collect,
	SrvId, CombatType)
    when CombatType == 18 orelse CombatType == 31 ->
    Replay = #replay_role{list = List} =
		 replay_hall_lib:get_role_replay({RoleId, 99}),
    Max = video_data:get_const(self_collection_limit),
    Id = {ReplayId, SrvId},
    Tab = combat_replay_mgr:replay_info_tab(Id),
    Flag = ets:member(Tab, Id),
    case lists:member(Id, List) of
      _ when Collect =:= 1 andalso length(List) >= Max ->
	  {false, lang:get(<<"录像收藏已达上限"/utf8>>)};
      _ when Flag =:= false ->
	  case lists:member(ReplayId, List) of
	    true ->
		NewReplay = Replay#replay_role{list =
						   List -- [ReplayId]},
		combat_replay_mgr:dec_replay_reference(ReplayId),
		d_ets_lib:save_ets(replay_role, NewReplay),
		ets:update_counter(Tab, ReplayId,
				   {#replay_info.collect, -1}),
		{ok, Role};
	    _ -> {false, lang:get(<<"录像已失效"/utf8>>)}
	  end;
      true when Collect =:= 1 ->
	  {false, lang:get(<<"录像已收藏"/utf8>>)};
      false when Collect =:= 0 ->
	  {false, lang:get(<<"没有收藏该录像"/utf8>>)};
      true when Collect =:= 0 ->
	  NewReplay = Replay#replay_role{list = List -- [Id]},
	  cluster_lib:cast(SrvId, combat_replay_mgr,
			   dec_cluster_replay_reference, [Id]),
	  d_ets_lib:save_ets(replay_role, NewReplay),
	  ets:update_counter(Tab, Id, {#replay_info.collect, -1}),
	  {ok, Role};
      false when Collect =:= 1 ->
	  NewReplay = Replay#replay_role{list = [Id | List]},
	  cluster_lib:cast(SrvId, combat_replay_mgr,
			   acc_replay_reference, [ReplayId]),
	  ets:update_counter(Tab, Id, {#replay_info.collect, 1}),
	  d_ets_lib:save_ets(replay_role, NewReplay),
	  {ok, Role};
      _ -> {false, lang:get(<<"参数错误"/utf8>>)}
    end;
collect(#role{id = {_, SrvId}}, _, _, ReplaySrvId, _)
    when SrvId =/= ReplaySrvId ->
    {false, lang:get(<<"跨服录像无法收藏"/utf8>>)};
collect(Role = #role{id = RoleId}, Id, Collect, _, _) ->
    Replay = #replay_role{list = List} =
		 replay_hall_lib:get_role_replay({RoleId, 99}),
    Max = video_data:get_const(self_collection_limit),
    case lists:member(Id, List) of
      _ when Collect =:= 1 andalso length(List) >= Max ->
	  {false, lang:get(<<"录像收藏已达上限"/utf8>>)};
      true when Collect =:= 1 ->
	  {false, lang:get(<<"录像已收藏"/utf8>>)};
      false when Collect =:= 0 ->
	  {false, lang:get(<<"没有收藏该录像"/utf8>>)};
      true when Collect =:= 0 ->
	  NewReplay = Replay#replay_role{list = List -- [Id]},
	  replay_hall_lib:get_replay_info(Id),
	  combat_replay_mgr:dec_replay_reference(Id),
	  d_ets_lib:save_ets(replay_role, NewReplay),
	  Tab = combat_replay_mgr:replay_info_tab(Id),
	  ets:update_counter(Tab, Id, {#replay_info.collect, -1}),
	  {ok, Role};
      false when Collect =:= 1 ->
	  Tab = combat_replay_mgr:replay_info_tab(Id),
	  case ets:member(Tab, Id) orelse
		 replay_hall_lib:get_replay_info(Id) =/= false
	      of
	    true ->
		NewReplay = Replay#replay_role{list = [Id | List]},
		combat_replay_mgr:acc_replay_reference(Id),
		ets:update_counter(Tab, Id, {#replay_info.collect, 1}),
		d_ets_lib:save_ets(replay_role, NewReplay),
		{ok, Role};
	    _ -> {false, lang:get(<<"录像已失效"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"参数错误"/utf8>>)}
    end.

-spec share(#role{}, Id :: pos_integer(),
	    Channel :: pos_integer(), SrvId :: bitstring(),
	    CombatType :: pos_integer()) -> {false, binary()} |
					    {ok, #role{}}.

share(#role{guild_bag = #guild_bag{id = {0, _}}}, _Id,
      4, _, _) ->
    {false, lang:get(<<"当前没有公会"/utf8>>)};
share(Role = #role{id = RoleId = {_, HallSrvId}},
      ReplayId, Channel, ReplaySrvId, 18) ->
    Id = {ReplayId, ReplaySrvId},
    case replay_hall_lib:get_replay_info(Id) of
      {ok,
       #replay_info{a_rid = ARid, b_rid = BRid, a_name = Name,
		    b_name = TargetName, combat_type = CombatType,
		    sec_type = SecType}} ->
	  Tab = combat_replay_mgr:replay_info_tab(Id),
	  SecTypeName = sec_type_name(CombatType, SecType),
	  ets:update_counter(Tab, Id, {#replay_info.share, 1}),
	  Msg =
	      util:format_ex(lang:get(<<"我分享了~s战斗录像~s，立即点击观看"/utf8>>),
			     [color:format({blue,
					    list_to_binary(["[", SecTypeName,
							    "]"])}),
			      color:format({combat_replay_hall,
					    {HallSrvId, ReplaySrvId, Name,
					     TargetName, ReplayId,
					     CombatType}})]),
	  say:speak(Role,
		    #{from => sys, channel => Channel, len => 0, msg => Msg,
		      check => <<Name/binary, TargetName/binary>>,
		      alert => lang:get(<<"分享成功，可前往聊天界面查看"/utf8>>)}),
	  NRole = case RoleId =:= ARid orelse RoleId =:= BRid of
		    true -> role_trigger:fire(#evt_replay_share{}, Role);
		    _ -> Role
		  end,
	  {ok, NRole};
      _ -> share(Role, ReplayId, Channel, ReplaySrvId, 1)
    end;
share(Role = #role{id = RoleId = {_, HallSrvId}},
      ReplayId, Channel, ReplaySrvId, 31) ->
    Id = {ReplayId, ReplaySrvId},
    case replay_hall_lib:get_replay_info(Id) of
      {ok,
       #replay_info{a_rid = ARid, b_rid = BRid, a_name = Name,
		    b_name = TargetName, combat_type = CombatType,
		    sec_type = SecType}} ->
	  Tab = combat_replay_mgr:replay_info_tab(Id),
	  SecTypeName = sec_type_name(CombatType, SecType),
	  ets:update_counter(Tab, Id, {#replay_info.share, 1}),
	  Msg =
	      util:format_ex(lang:get(<<"我分享了~s战斗录像~s，立即点击观看"/utf8>>),
			     [color:format({blue,
					    list_to_binary(["[", SecTypeName,
							    "]"])}),
			      color:format({combat_replay_hall,
					    {HallSrvId, ReplaySrvId, Name,
					     TargetName, ReplayId,
					     CombatType}})]),
	  say:speak(Role,
		    #{from => sys, channel => Channel, len => 0, msg => Msg,
		      check => <<Name/binary, TargetName/binary>>,
		      alert => lang:get(<<"分享成功，可前往聊天界面查看"/utf8>>)}),
	  NRole = case RoleId =:= ARid orelse RoleId =:= BRid of
		    true -> role_trigger:fire(#evt_replay_share{}, Role);
		    _ -> Role
		  end,
	  {ok, NRole};
      _ -> {false, lang:get(<<"查找不到录像信息"/utf8>>)}
    end;
share(Role = #role{id = RoleId = {_, SrvId}}, Id,
      Channel, _, _) ->
    case replay_hall_lib:get_replay_info(Id) of
      {ok,
       #replay_info{a_rid = ARid, b_rid = BRid, a_name = Name,
		    b_name = TargetName, combat_type = CombatType,
		    sec_type = SecType}} ->
	  Tab = combat_replay_mgr:replay_info_tab(Id),
	  SecTypeName = sec_type_name(CombatType, SecType),
	  ets:update_counter(Tab, Id, {#replay_info.share, 1}),
	  Msg =
	      util:format_ex(lang:get(<<"我分享了~s战斗录像~s，立即点击观看"/utf8>>),
			     [color:format({blue,
					    list_to_binary(["[", SecTypeName,
							    "]"])}),
			      color:format({combat_replay_hall,
					    {SrvId, SrvId, Name, TargetName, Id,
					     CombatType}})]),
	  say:speak(Role,
		    #{from => sys, channel => Channel, len => 0, msg => Msg,
		      check => <<Name/binary, TargetName/binary>>,
		      alert => lang:get(<<"分享成功，可前往聊天界面查看"/utf8>>)}),
	  NRole = case RoleId =:= ARid orelse RoleId =:= BRid of
		    true -> role_trigger:fire(#evt_replay_share{}, Role);
		    _ -> Role
		  end,
	  {ok, NRole};
      _ -> {false, lang:get(<<"查找不到录像信息"/utf8>>)}
    end.

-spec inc_play(pos_integer()) -> ok.

inc_play(Id) ->
    Tab = combat_replay_mgr:replay_info_tab(Id),
    case ets:member(Tab, Id) of
      true ->
	  LimitRound = video_data:get_const(hot_round_condition),
	  case catch ets:lookup_element(Tab, Id,
					#replay_info.round)
	      of
	    Round
		when is_integer(Round) andalso Round >= LimitRound ->
		ets:update_counter(Tab, Id, {#replay_info.play, 1}),
		replay_hall_mgr:info({add_hot, Id});
	    _ -> pass
	  end;
      _ -> pass
    end,
    ok.

-spec inc_play(pid(), pos_integer()) -> ok.

inc_play(RolePid, Id) ->
    Tab = combat_replay_mgr:replay_info_tab(Id),
    case ets:member(Tab, Id) of
      true ->
	  LimitRound = video_data:get_const(hot_round_condition),
	  role_trigger:async_fire(RolePid,
				  #evt_replay_hall_watch{}),
	  case catch ets:lookup_element(Tab, Id,
					#replay_info.round)
	      of
	    Round
		when is_integer(Round) andalso Round >= LimitRound ->
		ets:update_counter(Tab, Id, {#replay_info.play, 1}),
		replay_hall_mgr:info({add_hot, Id});
	    _ -> pass
	  end;
      _ -> pass
    end,
    ok.

-spec get_partner(pos_integer(), pos_integer(), 1..2,
		  SrvId :: bitstring(),
		  CombatType :: pos_integer()) -> false |
						  {ok, #replay_partner{}}.

get_partner(ReplayId, PartnerId, Type, SrvId,
	    CombatType)
    when CombatType == 18 orelse CombatType == 31 ->
    Id = {ReplayId, SrvId},
    case replay_hall_lib:get_replay_info(Id) of
      {ok, #replay_info{a_plist = PList}} when Type =:= 1 ->
	  case lists:keyfind(PartnerId, #replay_partner.id, PList)
	      of
	    P = #replay_partner{} -> {ok, P};
	    _ -> false
	  end;
      {ok, #replay_info{b_plist = PList}} ->
	  case lists:keyfind(PartnerId, #replay_partner.id, PList)
	      of
	    P = #replay_partner{} -> {ok, P};
	    _ -> false
	  end;
      _ when CombatType == 18 ->
	  get_partner(ReplayId, PartnerId, Type, SrvId, 1);
      _ -> false
    end;
get_partner(Id, PartnerId, Type, _, _) ->
    case replay_hall_lib:get_replay_info(Id) of
      {ok, #replay_info{a_plist = PList}} when Type =:= 1 ->
	  case lists:keyfind(PartnerId, #replay_partner.id, PList)
	      of
	    P = #replay_partner{} -> {ok, P};
	    _ -> false
	  end;
      {ok, #replay_info{b_plist = PList}} ->
	  case lists:keyfind(PartnerId, #replay_partner.id, PList)
	      of
	    P = #replay_partner{} -> {ok, P};
	    _ -> false
	  end;
      _ -> false
    end.

-spec push_say_replay(pid(), list(), list(),
		      pos_integer(), pos_integer(), pos_integer(),
		      pos_integer()) -> ok.

push_say_replay(ConnPid, LikeL, Collects, ReplayId,
		SrvId, 18, Channel) ->
    case replay_hall_lib:get_replay_info({ReplayId, SrvId})
	of
      {ok,
       R = #replay_info{id = Id = {ReplayId, ReplaySid},
			ext = ReplayExt, combat_type = CombatType,
			sec_type = SecType, a_plist = APlist,
			b_plist = BPlist}} ->
	  APlist1 = [P#replay_partner{eqms = [], artifacts = [],
				      skills = [],
				      ext =
					  [{5, list_util:keyfind(5, Ext, 0)},
					   {11, list_util:keyfind(11, Ext, 0)}]}
		     || P = #replay_partner{ext = Ext} <- APlist],
	  BPlist1 = [P#replay_partner{eqms = [], artifacts = [],
				      skills = [],
				      ext =
					  [{5, list_util:keyfind(5, Ext, 0)},
					   {11, list_util:keyfind(11, Ext, 0)}]}
		     || P = #replay_partner{ext = Ext} <- BPlist],
	  CliExt = to_cli_ext(ReplayExt),
	  NewR = R#replay_info{id = ReplayId, a_plist = APlist1,
			       b_plist = BPlist1, ext = CliExt},
	  Name = sec_type_name(CombatType, SecType),
	  Flag = util:if_true(lists:member(Id, LikeL), 1, 0),
	  IsCollect = util:if_true(lists:member(Id, Collects), 1,
				   0),
	  {AFaceUpdateTime, AFaceFile} = list_util:keyfind(a_face,
							   ReplayExt,
							   {0, <<>>}),
	  {BFaceUpdateTime, BFaceFile} = list_util:keyfind(b_face,
							   ReplayExt,
							   {0, <<>>}),
	  Data = {Name, Flag, IsCollect, AFaceUpdateTime,
		  AFaceFile, BFaceUpdateTime, BFaceFile, NewR},
	  role:pack_send(ConnPid, 19908,
			 {CombatType, Channel, Data}),
	  ok;
      _ -> skip
    end;
push_say_replay(ConnPid, LikeL, Collects, ReplayId,
		SrvId, 31, Channel) ->
    case replay_hall_lib:get_replay_info({ReplayId, SrvId})
	of
      {ok,
       R = #replay_info{id = Id = {ReplayId, ReplaySid},
			ext = ReplayExt, combat_type = CombatType,
			sec_type = SecType, a_plist = APlist,
			b_plist = BPlist}} ->
	  APlist1 = [P#replay_partner{eqms = [], artifacts = [],
				      skills = [],
				      ext =
					  [{5, list_util:keyfind(5, Ext, 0)},
					   {11, list_util:keyfind(11, Ext, 0)}]}
		     || P = #replay_partner{ext = Ext} <- APlist],
	  BPlist1 = [P#replay_partner{eqms = [], artifacts = [],
				      skills = [],
				      ext =
					  [{5, list_util:keyfind(5, Ext, 0)},
					   {11, list_util:keyfind(11, Ext, 0)}]}
		     || P = #replay_partner{ext = Ext} <- BPlist],
	  CliExt = to_cli_ext(ReplayExt),
	  CliExt2 = case CombatType of
		      31 -> [{1, 0, ReplaySid, []} | CliExt];
		      _ -> CliExt
		    end,
	  NewR = R#replay_info{id = ReplayId, a_plist = APlist1,
			       b_plist = BPlist1, ext = CliExt2},
	  Name = sec_type_name(CombatType, SecType),
	  Flag = util:if_true(lists:member(Id, LikeL), 1, 0),
	  IsCollect = util:if_true(lists:member(Id, Collects), 1,
				   0),
	  {AFaceUpdateTime, AFaceFile} = list_util:keyfind(a_face,
							   ReplayExt,
							   {0, <<>>}),
	  {BFaceUpdateTime, BFaceFile} = list_util:keyfind(b_face,
							   ReplayExt,
							   {0, <<>>}),
	  Data = {Name, Flag, IsCollect, AFaceUpdateTime,
		  AFaceFile, BFaceUpdateTime, BFaceFile, NewR},
	  role:pack_send(ConnPid, 19908,
			 {CombatType, Channel, Data}),
	  ok;
      _ -> skip
    end;
push_say_replay(ConnPid, LikeL, Collects, ReplayId,
		_SrvId, _, Channel) ->
    case replay_hall_lib:get_replay_info(ReplayId) of
      {ok,
       R = #replay_info{combat_type = CombatType,
			ext = ReplayExt, sec_type = SecType, a_plist = APlist,
			b_plist = BPlist}} ->
	  APlist1 = [P#replay_partner{eqms = [], artifacts = [],
				      skills = [],
				      ext =
					  [{5, list_util:keyfind(5, Ext, 0)},
					   {11, list_util:keyfind(11, Ext, 0)}]}
		     || P = #replay_partner{ext = Ext} <- APlist],
	  BPlist1 = [P#replay_partner{eqms = [], artifacts = [],
				      skills = [],
				      ext =
					  [{5, list_util:keyfind(5, Ext, 0)},
					   {11, list_util:keyfind(11, Ext, 0)}]}
		     || P = #replay_partner{ext = Ext} <- BPlist],
	  CliExt = to_cli_ext(ReplayExt),
	  NewR = R#replay_info{a_plist = APlist1,
			       b_plist = BPlist1, ext = CliExt},
	  Name = sec_type_name(CombatType, SecType),
	  Flag = util:if_true(lists:member(ReplayId, LikeL), 1,
			      0),
	  IsCollect = util:if_true(lists:member(ReplayId,
						Collects),
				   1, 0),
	  {AFaceUpdateTime, AFaceFile} = list_util:keyfind(a_face,
							   ReplayExt,
							   {0, <<>>}),
	  {BFaceUpdateTime, BFaceFile} = list_util:keyfind(b_face,
							   ReplayExt,
							   {0, <<>>}),
	  Data = {Name, Flag, IsCollect, AFaceUpdateTime,
		  AFaceFile, BFaceUpdateTime, BFaceFile, NewR},
	  role:pack_send(ConnPid, 19908,
			 {CombatType, Channel, Data}),
	  ok;
      _ -> skip
    end.


