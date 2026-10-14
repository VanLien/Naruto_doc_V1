-file("data/arena_champion_mgr.erl", 1).

-file("src/mod/arena/arena_champion_mgr.erl", 1).

-module(arena_champion_mgr).

-lager_records([{formation_partner,
		 [ver, id, pos, bid, lev, star, break_lev, power,
		  use_skin, break_skills, set_skills, skills, dower_skill,
		  all_attr, base_attr, eqm, artifacts, holy_eqm, ext]},
		{formation_role_match,
		 [id, lev, power, max_power, zone_id]},
		{formation_role,
		 [ver, id, name, lev, sex, power, max_power, face_id,
		  face_file, avatar_bid, look_id, reg_time, zone_id, time,
		  formation_type, formation_lev, hallows_id, hallows_lev,
		  hallows_skill_lev, hallows_look_id,
		  hallows_all_look_ids, hallows_lucky, hallows_seal,
		  hallows_refine, sprite_lev, sprite_break_lev, sprites,
		  partners, ext]},
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
	 update_combat_fighter/1, arena_champion_role_ver/1,
	 match_back/3]).

-export([init/1, handle_event/3, handle_sync_event/4,
	 handle_info/3, terminate/3, code_change/4]).

-export([idle/2]).

-export([score_notice/2, score_ready/2, score_ready2/2,
	 score_guess/2, score_fight/2]).

-export([champion_ready/2, champion_ready2/2,
	 champion_guess/2, champion_fight/2, champion_end/2]).

-export([gm_get_all_robot_star/0,
	 gm_match_robot_info/0]).

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

-file("src/mod/arena/arena_champion_mgr.erl", 39).

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

-file("src/mod/arena/arena_champion_mgr.erl", 40).

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

-file("src/mod/arena/arena_champion_mgr.erl", 41).

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

-file("src/mod/arena/arena_champion_mgr.erl", 42).

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

-file("src/mod/arena/arena_champion_mgr.erl", 43).

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

-file("src/mod/arena/arena_champion_mgr.erl", 44).

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

-file("src/mod/arena/arena_champion_mgr.erl", 45).

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

-file("src/mod/arena/arena_champion_mgr.erl", 46).

-file("inc/looks.hrl", 1).

-record(m_look, {use_id = 0, list = []}).

-file("src/mod/arena/arena_champion_mgr.erl", 47).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/arena/arena_champion_mgr.erl", 48).

-file("inc/log.hrl", 1).

-file("src/mod/arena/arena_champion_mgr.erl", 49).

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

-file("src/mod/arena/arena_champion_mgr.erl", 50).

-file("inc/game_assets.hrl", 1).

-file("src/mod/arena/arena_champion_mgr.erl", 51).

-file("inc/partner.hrl", 1).

-file("src/mod/arena/arena_champion_mgr.erl", 52).

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

-file("src/mod/arena/arena_champion_mgr.erl", 53).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/arena/arena_champion_mgr.erl", 54).

-file("inc/getui.hrl", 1).

-record(getui_role,
	{id = {0, <<>>}, getui_cid = <<>>, package_name = <<>>,
	 os_name = <<>>}).

-record(getui_msg,
	{id = {{0, <<>>}, 0}, name = <<>>, timeout = 0,
	 ext = []}).

-file("src/mod/arena/arena_champion_mgr.erl", 55).

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

-file("src/mod/arena/arena_champion_mgr.erl", 56).

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

-file("src/mod/arena/arena_champion_mgr.erl", 57).

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

-file("src/mod/arena/arena_champion_mgr.erl", 58).

-file("inc/formation_role.hrl", 1).

-record(formation_role,
	{ver = 1, id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 power = 0, max_power = 0, face_id = 0, face_file = <<>>,
	 avatar_bid = 0, look_id = 0, reg_time = 0, zone_id = 0,
	 time = 0, formation_type = 0, formation_lev = 0,
	 hallows_id = 0, hallows_lev = 0, hallows_skill_lev = 0,
	 hallows_look_id = 0, hallows_all_look_ids = [],
	 hallows_lucky = 0, hallows_seal = 0, hallows_refine = 0,
	 sprite_lev = 0, sprite_break_lev = 0, sprites = [],
	 partners = [], ext = []}).

-record(formation_role_match,
	{id = {0, <<>>}, lev = 0, power = 0, max_power = 0,
	 zone_id = 0}).

-record(formation_partner,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 pos = 0  :: pos_integer(), bid = 1  :: pos_integer(),
	 lev = 1  :: pos_integer(), star = 1  :: pos_integer(),
	 break_lev = 1  :: pos_integer(),
	 power = 1  :: pos_integer(),
	 use_skin = 0  :: pos_integer(),
	 break_skills = []  :: list(),
	 set_skills = []  :: list(), skills = []  :: list(),
	 dower_skill = []  :: list(), all_attr, base_attr,
	 eqm = []  :: list(), artifacts = []  :: list(),
	 holy_eqm = []  :: list(), ext = []  :: list()}).

-file("src/mod/arena/arena_champion_mgr.erl", 59).

gm_get_all_robot_star() ->
    L = ets:tab2list(arena_champion_formation_info),
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

gm_match_robot_info() ->
    RL = ets:tab2list(arena_champion_role),
    MinPower = case
		 lists:keysort(#arena_champion_role.max_power,
			       [R
				|| R = #arena_champion_role{robot_id = 0}
				       <- RL])
		   of
		 [#arena_champion_role{max_power = Power1} | _] ->
		     Power1;
		 _ -> arena_champion_data:get_const(base_power)
	       end,
    RL1 = lists:keysort(#arena_champion_role.id,
			[R || R = #arena_champion_role{id = {_, <<>>}} <- RL]),
    L =
	[io_lib:format("~w power=~w, lev=~w match_id={~w,~s}",
		       [N, Power, Lev, MatchId, MatchSrvId])
	 || #arena_champion_role{id = {N, _}, power = Power,
				 lev = Lev, match_id = {MatchId, MatchSrvId}}
		<- RL1],
    Msg = util:fbin("min_power=~w ~n ~ts",
		    [MinPower, string:join(L, "\n")]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr84, _,
       {__Levelarena_champion_mgr84,
	__Tracesarena_champion_mgr84}}
	  when __Levelarena_champion_mgr84 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr84 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr},
			{function, gm_match_robot_info}, {line, 84},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       Msg, none, 4096, 64, __Levelarena_champion_mgr84,
		       __Tracesarena_champion_mgr84, lager_event,
		       __Pidarena_champion_mgr84);
      _ -> ok
    end,
    sys_conn:pack_send(10399, {1, Msg}),
    ok.

-spec calc_bet_ratio(non_neg_integer(),
		     non_neg_integer()) -> non_neg_integer().

calc_bet_ratio(Val, Val) -> 1750;
calc_bet_ratio(Val1, Val2) when Val1 > Val2 ->
    round((2 - Val1 / (Val1 + Val2) * 5.0e-1) * 1000);
calc_bet_ratio(Val1, Val2) ->
    round((1.5 + Val2 / (Val1 + Val2) * 5.0e-1) * 1000).

-spec sync_role(#role{}, atom()) -> ok.

sync_role(Role = #role{id = RoleId}, Flag) ->
    case ets:member(arena_champion_role, RoleId) of
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
    ets:update_element(arena_champion_role, RoleId, L);
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
    ets:update_element(arena_champion_role, RoleId, L).

-spec extract_join_role() -> ok.

extract_join_role() ->
    [combat_replay_mgr:dec_replay_reference(ReplayId)
     || {ReplayId} <- ets:tab2list(arena_champion_replay)],
    d_ets_lib:clear_d_ets(arena_champion_replay),
    d_ets_lib:clear_d_ets(arena_champion_role),
    d_ets_lib:clear_d_ets(arena_champion_bet),
    d_ets_lib:clear_d_ets(arena_champion_pk),
    ets:delete_all_objects(arena_champion_rank),
    do_extract_join_role(1),
    info({notify_score_start}).

do_extract_join_role(Rank) when Rank =< 128 ->
    case arena_lib:rank_role(Rank) of
      {ok,
       #arena_role{id = Id, name = Name, lev = Lev, sex = Sex,
		   gid = Gid, gname = Gname, face = Face,
		   champion_power = Power, max_power = MaxPower,
		   lookid = LookId, score = OldScore, avatar_id = AvatarId,
		   face_update_time = FaceUpdateTime,
		   face_file = FaceFile}} ->
	  Group = (Rank - 1) rem 1 + 1,
	  Score =
	      round(arena_champion_data:get_const(battel_score) *
		      OldScore
		      / 1000),
	  d_ets_lib:save_ets(arena_champion_role,
			     #arena_champion_role{id = Id, name = Name,
						  lev = Lev, sex = Sex,
						  gid = Gid, gname = Gname,
						  face = Face, power = Power,
						  max_power = MaxPower,
						  lookid = LookId,
						  old_score = OldScore,
						  old_rank = Rank, rank = Rank,
						  avatar_id = AvatarId,
						  group = Group, score = Score,
						  face_update_time =
						      FaceUpdateTime,
						  face_file = FaceFile}),
	  ets:insert(arena_champion_rank,
		     #arena_champion_rank{rank = Rank, old_rank = Rank,
					  id = Id, score = Score}),
	  role_lib:cast(by_id, Id,
			{arena_champion_mgr, sync_role, [all]}),
	  do_extract_join_role(Rank + 1);
      _ -> ok
    end;
do_extract_join_role(_Rank) -> ok.

-spec match_back(pid(), list(), tuple()) -> ok.

match_back(MgrPid, [FormationRole], Id) ->
    MgrPid ! {match_back, Id, FormationRole};
match_back(_MgrPid, _Ret, _Id) -> ok.

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
      {__Pidarena_champion_mgr155, _,
       {__Levelarena_champion_mgr155,
	__Tracesarena_champion_mgr155}}
	  when __Levelarena_champion_mgr155 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr155 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, m},
			{line, 155}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "有人输入了下阶段", none, 4096, 64,
		       __Levelarena_champion_mgr155,
		       __Tracesarena_champion_mgr155, lager_event,
		       __Pidarena_champion_mgr155);
      _ -> ok
    end,
    case ets:info(arena_champion_role, size) of
      0 -> extract_join_role();
      _ -> gen_fsm:send_event(arena_champion_mgr, timeout)
    end.

info(Info) -> arena_champion_mgr ! Info.

cast(Event) ->
    gen_fsm:send_all_state_event(arena_champion_mgr, Event).

call(Event) ->
    case catch
	   gen_fsm:sync_send_all_state_event(arena_champion_mgr,
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
	    {__Pidarena_champion_mgr172, _,
	     {__Levelarena_champion_mgr172,
	      __Tracesarena_champion_mgr172}}
		when __Levelarena_champion_mgr172 band 8 /= 0 orelse
		       __Tracesarena_champion_mgr172 /= [] ->
		lager:do_log(error,
			     [{module, arena_champion_mgr}, {function, call},
			      {line, 172}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [arena_champion_mgr, Event, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelarena_champion_mgr172,
			     __Tracesarena_champion_mgr172, lager_event,
			     __Pidarena_champion_mgr172);
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

apply({M, F, A}) -> info({apply, M, F, A}).

start_link() ->
    gen_fsm:start_link({local, arena_champion_mgr},
		       arena_champion_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr182, _,
       {__Levelarena_champion_mgr182,
	__Tracesarena_champion_mgr182}}
	  when __Levelarena_champion_mgr182 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr182 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, init},
			{line, 182}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动", none, 4096, 64, __Levelarena_champion_mgr182,
		       __Tracesarena_champion_mgr182, lager_event,
		       __Pidarena_champion_mgr182);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(arena_champion_replay,
			"dets/arena_champion_replay.dets", 1, set),
    d_ets_lib:load_dets_to_ets(arena_champion_replay,
			       undefined),
    d_ets_lib:new_d_ets(arena_champion_bet,
			"dets/arena_champion_bet.dets", #champion_bet.id, set),
    d_ets_lib:load_dets_to_ets(arena_champion_bet,
			       undefined),
    d_ets_lib:new_d_ets(arena_champion_ext,
			"dets/arena_champion_ext.dets", 1, set),
    d_ets_lib:load_dets_to_ets(arena_champion_ext,
			       undefined),
    d_ets_lib:new_d_ets(arena_champion_result,
			"dets/arena_champion_result.dets", #champion_result.id,
			set),
    d_ets_lib:load_dets_to_ets(arena_champion_result,
			       undefined),
    d_ets_lib:new_d_ets(arena_champion_pk,
			"dets/arena_champion_pk.dets", #champion_pk.id, set),
    arena_champion_ver:do_init_champion_pk(arena_champion_pk),
    d_ets_lib:new_d_ets(arena_champion_role_log,
			"dets/arena_champion_role_log.dets",
			#champion_role_log.id, set),
    d_ets_lib:load_dets_to_ets(arena_champion_role_log,
			       undefined),
    d_ets_lib:new_d_ets(arena_champion_role,
			"dets/arena_champion_role.dets",
			#arena_champion_role.id, set),
    d_ets_lib:load_dets_to_ets(arena_champion_role,
			       fun (D) -> arena_champion_role_ver(D) end),
    d_ets_lib:new_ets(arena_champion_rank,
		      #arena_champion_rank.rank, set),
    ets:foldl(fun (#arena_champion_role{id = Id,
					rank = Rank, old_rank = OldRank,
					score = Score, score_32 = Score32},
		   _) ->
		      ets:insert(arena_champion_rank,
				 #arena_champion_rank{rank = Rank,
						      old_rank = OldRank,
						      id = Id, score = Score,
						      score_32 = Score32})
	      end,
	      0, arena_champion_role),
    d_ets_lib:new_ets(arena_champion_formation_info, 1,
		      set),
    d_ets_lib:new_ets(arena_champion_formation, 1, set),
    sys_env:set(arena_champion_set_formation, 1),
    Ms = date:unixtime(ms),
    erlang:send_after(20000, self(), init_next_season_time),
    util:set_timer(notice_msg, 60 * 10, {notice_msg, 1}),
    {StateName, State} = init_state(Ms),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr219, _,
       {__Levelarena_champion_mgr219,
	__Tracesarena_champion_mgr219}}
	  when __Levelarena_champion_mgr219 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr219 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, init},
			{line, 219}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("启动完成:~w", [StateName]), none, 4096, 64,
		       __Levelarena_champion_mgr219,
		       __Tracesarena_champion_mgr219, lager_event,
		       __Pidarena_champion_mgr219);
      _ -> ok
    end,
    {ok, StateName, State,
     max(1, State#champion_state.state_end_time - Ms)}.

handle_event(_Event, StateName, State) ->
    continue(StateName, State).

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok, continue(StateName, Reply, State).

handle_info(gm_init_season, StateName, State) ->
    self() ! init_next_season_time,
    continue(StateName,
	     State#champion_state{season_start_time = 0});
handle_info({gm_set_state, NewState}, StateName,
	    _State) ->
    continue(StateName, NewState);
handle_info(init_next_season_time, StateName,
	    State = #champion_state{season_start_time =
					SeasonStartTime0,
				    season_end_time = SeasonEndTime0}) ->
    Now = date:unixtime(),
    case SeasonStartTime0 =:= 0 orelse
	   SeasonStartTime0 > Now orelse Now > SeasonEndTime0
	of
      true ->
	  ArenaInfo = sys_env:get(arena_state, #{}),
	  ArenaSeasonStartTime = maps:get(season_start_time,
					  ArenaInfo, 0),
	  MergeIndex = sys_env:get(merge_index, 0),
	  ArenaChampionMergeIndex =
	      sys_env:get(arena_champion_merge_index, 0),
	  Flag = MergeIndex =/= ArenaChampionMergeIndex,
	  SeasonStartTime = if Flag ->
				   sys_env:save(arena_champion_merge_index,
						MergeIndex),
				   ArenaSeasonStartTime;
			       ArenaSeasonStartTime + 86400 * 4 - 10 =< Now ->
				   ArenaSeasonStartTime + 86400 * 5;
			       true -> ArenaSeasonStartTime + 86400 * 2
			    end,
	  SeasonEndTime = SeasonStartTime + 86400 * 1 +
			    date:time_sec(arena_champion_data:get_const(time_champion_end)),
	  StepStatusTime = SeasonStartTime +
			     date:time_sec(arena_champion_data:get_const(time_score_start)),
	  util:set_timer(notice_msg, 60 * 40, {notice_msg, 1}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_champion_mgr258, _,
	     {__Levelarena_champion_mgr258,
	      __Tracesarena_champion_mgr258}}
		when __Levelarena_champion_mgr258 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr258 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, handle_info}, {line, 258},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("初始化下一赛期时间,now=~w arena_seasonstarttime=~w "
					   "start_time=~w, end_time=~w",
					   [Now, ArenaSeasonStartTime,
					    SeasonStartTime, SeasonEndTime]),
			     none, 4096, 64, __Levelarena_champion_mgr258,
			     __Tracesarena_champion_mgr258, lager_event,
			     __Pidarena_champion_mgr258);
	    _ -> ok
	  end,
	  case Now >= SeasonStartTime andalso
		 Now < SeasonStartTime + 3600 * 20
	      of
	    true -> self() ! zero_update;
	    _ -> pass
	  end,
	  continue(StateName,
		   State#champion_state{season_start_time =
					    SeasonStartTime,
					season_end_time = SeasonEndTime,
					step_status_time = StepStatusTime});
      _ -> continue(StateName, State)
    end;
handle_info({notify_score_start}, StateName, State) ->
    case ets:info(arena_champion_role, size) of
      N when N > 0 ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_champion_mgr272, _,
	     {__Levelarena_champion_mgr272,
	      __Tracesarena_champion_mgr272}}
		when __Levelarena_champion_mgr272 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr272 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, handle_info}, {line, 272},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("玩家存在参与资格人数:~w  ~w", [N, StateName]),
			     none, 4096, 64, __Levelarena_champion_mgr272,
			     __Tracesarena_champion_mgr272, lager_event,
			     __Pidarena_champion_mgr272);
	    _ -> ok
	  end,
	  RL = case ets:match_object(arena_champion_role,
				     #arena_champion_role{old_rank = N,
							  _ = '_'})
		   of
		 RL1 = [_ | _] -> RL1;
		 _ ->
		     case {whereis(lager_event), whereis(lager_event),
			   lager_config:get({lager_event, loglevel}, {0, []})}
			 of
		       {undefined, undefined, _} ->
			   fun () -> {error, lager_not_running} end();
		       {undefined, _, _} ->
			   fun () -> {error, {sink_not_configured, lager_event}}
			   end();
		       {__Pidarena_champion_mgr276, _,
			{__Levelarena_champion_mgr276,
			 __Tracesarena_champion_mgr276}}
			   when __Levelarena_champion_mgr276 band 8 /= 0 orelse
				  __Tracesarena_champion_mgr276 /= [] ->
			   lager:do_log(error,
					[{module, arena_champion_mgr},
					 {function, handle_info}, {line, 276},
					 {pid, pid_to_list(self())},
					 {node, node()}
					 | lager:md()],
					io_lib:format("数据异常，查找不到指定名次数据", []),
					none, 4096, 8,
					__Levelarena_champion_mgr276,
					__Tracesarena_champion_mgr276,
					lager_event,
					__Pidarena_champion_mgr276);
		       _ -> ok
		     end,
		     ets:tab2list(arena_champion_role)
	       end,
	  AllRL = ets:tab2list(arena_champion_role),
	  [#arena_champion_role{max_power = MinPower = Power,
				lev = Lev}
	   | _] =
	      lists:keysort(#arena_champion_role.max_power, AllRL),
	  [#arena_champion_role{id = RoleId, old_score = OldScore}
	   | _] =
	      RL,
	  d_ets_lib:save_ets(arena_champion_ext,
			     {last_role, RoleId}),
	  put(pk_list,
	      lists:concat(ets:match(arena_champion_role,
				     #arena_champion_role{id = '$1',
							  robot_id = 0,
							  _ = '_'}))),
	  self() ! load_pk_info,
	  init_robot(N + 1, 1, Power, MinPower, Lev, OldScore);
      N ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_champion_mgr287, _,
	     {__Levelarena_champion_mgr287,
	      __Tracesarena_champion_mgr287}}
		when __Levelarena_champion_mgr287 band 8 /= 0 orelse
		       __Tracesarena_champion_mgr287 /= [] ->
		lager:do_log(error,
			     [{module, arena_champion_mgr},
			      {function, handle_info}, {line, 287},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("没有玩家存在参与资格:~w ~w", [N, StateName]),
			     none, 4096, 8, __Levelarena_champion_mgr287,
			     __Tracesarena_champion_mgr287, lager_event,
			     __Pidarena_champion_mgr287);
	    _ -> ok
	  end,
	  d_ets_lib:save_ets(arena_champion_ext,
			     {last_role, null}),
	  init_robot(1, 1,
		     arena_champion_data:get_const(base_power),
		     arena_champion_data:get_const(base_power),
		     arena_champion_data:get_const(base_lev),
		     arena_champion_data:get_const(base_score))
    end,
    put(match_formation_role_list, []),
    ets:delete_all_objects(arena_champion_formation_info),
    ets:delete_all_objects(arena_champion_formation),
    Now = date:unixtime(),
    SeasonStartTime = date:unixtime({zero, Now + 10}),
    SeasonEndTime = SeasonStartTime + 86400 * 1 +
		      date:time_sec(arena_champion_data:get_const(time_champion_end)),
    NewState = State#champion_state{step = 1,
				    step_status = 0,
				    season_start_time = SeasonStartTime,
				    season_end_time = SeasonEndTime, round = 0,
				    round_status = 0},
    save_state(score_notice, NewState),
    util:set_timer(notice_msg, 60 * 2, {notice_msg, 1}),
    self() ! {notify_state, 1},
    getui:batch_send_msg(100,
			 lang:get(<<"Nhắc nhở chức vô địch"/utf8>>),
			 util:fbin(lang:get(<<"Nhẫn Giả Thân Mến!，Giải đấu vô địch "
					      "của bạn trong ~ts sắp bắt đầu. Hãy tham "
					      "gia để nhận được những phần thưởng phong "
					      "phú như danh tiếng cạnh tranh, danh "
					      "hiệu hiếm, v.v."/utf8>>),
				   [sys_env:get(zone_name)])),
    continue(score_notice, NewState);
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
      {__Pidarena_champion_mgr307, _,
       {__Levelarena_champion_mgr307,
	__Tracesarena_champion_mgr307}}
	  when __Levelarena_champion_mgr307 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr307 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, handle_info},
			{line, 307}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("冠军赛0点检查:~w now=~w season_start_time=~w "
				     "season_end_time=~w",
				     [StateName, Now, SeasonStartTime,
				      SeasonEndTime]),
		       none, 4096, 64, __Levelarena_champion_mgr307,
		       __Tracesarena_champion_mgr307, lager_event,
		       __Pidarena_champion_mgr307);
      _ -> ok
    end,
    case Now >= SeasonStartTime andalso
	   Now < SeasonStartTime + 86400 andalso StateName =:= idle
	of
      true ->
	  Timeout =
	      date:next_diff(arena_champion_data:get_const(time_score_start)),
	  EndTime = Now + Timeout,
	  mail_notify_start(Now + Timeout),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_champion_mgr313, _,
	     {__Levelarena_champion_mgr313,
	      __Tracesarena_champion_mgr313}}
		when __Levelarena_champion_mgr313 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr313 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, handle_info}, {line, 313},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("冠军赛今天开始,距离开启时间:~w", [Timeout]),
			     none, 4096, 64, __Levelarena_champion_mgr313,
			     __Tracesarena_champion_mgr313, lager_event,
			     __Pidarena_champion_mgr313);
	    _ -> ok
	  end,
	  activity_global:set_and_push(14, 1, [EndTime]),
	  NewState = set_state_timeout(State#champion_state{step =
								1,
							    step_status = 0,
							    step_status_time =
								Now + Timeout,
							    round = 0,
							    round_status = 0},
				       Timeout * 1000),
	  util:set_timer(notice_msg, 60 * 40, {notice_msg, 1}),
	  ets:delete_all_objects(arena_champion_formation_info),
	  ets:delete_all_objects(arena_champion_formation),
	  save_state(score_notice, State),
	  continue(score_notice, NewState);
      _ when Now > SeasonEndTime andalso StateName =:= idle ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_champion_mgr322, _,
	     {__Levelarena_champion_mgr322,
	      __Tracesarena_champion_mgr322}}
		when __Levelarena_champion_mgr322 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr322 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, handle_info}, {line, 322},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("冠军赛赛季已结束,结束时间:~w", [SeasonEndTime]),
			     none, 4096, 64, __Levelarena_champion_mgr322,
			     __Tracesarena_champion_mgr322, lager_event,
			     __Pidarena_champion_mgr322);
	    _ -> ok
	  end,
	  self() ! init_next_season_time,
	  continue(StateName, State);
      _ -> continue(StateName, State)
    end;
handle_info({notice_msg, N}, StateName = idle,
	    State = #champion_state{step_status_time = StepTime}) ->
    case date:day_diff(StepTime, date:unixtime()) of
      1 ->
	  notice_msg(StateName, #{}),
	  util:set_timer(notice_msg, 60 * 40,
			 {notice_msg, N + 1});
      _ ->
	  util:set_timer(notice_msg, 60 * 60, {notice_msg, N + 1})
    end,
    continue(StateName, State);
handle_info({notice_msg, N}, StateName = score_notice,
	    State) ->
    {Hour, _Minu, _Sec} = time(),
    case Hour >= 20 of
      true ->
	  notice_msg(StateName, #{num => 2}),
	  util:set_timer(notice_msg, 60 * 5, {notice_msg, N + 1});
      _ ->
	  notice_msg(StateName, #{num => N rem 2}),
	  util:set_timer(notice_msg, 60 * 20, {notice_msg, N + 1})
    end,
    continue(StateName, State);
handle_info({add_score, _Id, 0},
	    StateName = score_fight, State) ->
    dec_combat_num(), continue(StateName, State);
handle_info({add_score, Id, AddScore},
	    StateName = score_fight, State) ->
    dec_combat_num(),
    case arena_champion_lib:get_role(Id) of
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
	    {__Pidarena_champion_mgr361, _,
	     {__Levelarena_champion_mgr361,
	      __Tracesarena_champion_mgr361}}
		when __Levelarena_champion_mgr361 band 8 /= 0 orelse
		       __Tracesarena_champion_mgr361 /= [] ->
		lager:do_log(error,
			     [{module, arena_champion_mgr},
			      {function, handle_info}, {line, 361},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("获取竞技冠军参战者信息失败:~w, ~w",
					   [Id, AddScore]),
			     none, 4096, 8, __Levelarena_champion_mgr361,
			     __Tracesarena_champion_mgr361, lager_event,
			     __Pidarena_champion_mgr361);
	    _ -> ok
	  end
    end,
    continue(StateName, State);
handle_info(load_pk_info, StateName, State)
    when StateName =:= score_ready orelse
	   StateName =:= champion_ready orelse
	     StateName =:= score_notice ->
    case get(pk_list) of
      [RoleId | T] when StateName =:= score_notice ->
	  erlang:send_after(100, self(), load_pk_info),
	  pre_load_role(RoleId),
	  put(pk_list, T);
      [RoleId | T] ->
	  put(pk_list, T),
	  erlang:send_after(10, self(), load_pk_info),
	  {ok, PK} = arena_champion_lib:get_pk(RoleId),
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
	    {__Pidarena_champion_mgr377, _,
	     {__Levelarena_champion_mgr377,
	      __Tracesarena_champion_mgr377}}
		when __Levelarena_champion_mgr377 band 128 /= 0 orelse
		       __Tracesarena_champion_mgr377 /= [] ->
		lager:do_log(debug,
			     [{module, arena_champion_mgr},
			      {function, handle_info}, {line, 377},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("加载角色阵法信息完成", []), none, 4096, 128,
			     __Levelarena_champion_mgr377,
			     __Tracesarena_champion_mgr377, lager_event,
			     __Pidarena_champion_mgr377);
	    _ -> ok
	  end
    end,
    continue(StateName, State);
handle_info({match_robot, Id, Lev, MinPower, MaxPower},
	    StateName, State)
    when StateName =:= score_notice orelse
	   StateName =:= score_ready ->
    MinLev = max(1,
		 Lev - arena_champion_data:get_const(wave_lev_min)),
    MaxLev = Lev +
	       arena_champion_data:get_const(wave_lev_max),
    Powers = [[{MinPower, MaxPower}]],
    formation_role_lib:match({self(), Id, Lev, MinLev,
			      MaxLev},
			     Powers, [],
			     {arena_champion_mgr, match_back, [Id]}),
    continue(StateName, State);
handle_info({match_back, Id, FormationRole}, StateName,
	    State)
    when StateName =:= score_notice orelse
	   StateName =:= score_ready ->
    case arena_champion_lib:get_role(Id) of
      {ok, R} ->
	  try sync_robot_info(R, FormationRole) catch
	    X:E ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_champion_mgr395, _,
		   {__Levelarena_champion_mgr395,
		    __Tracesarena_champion_mgr395}}
		      when __Levelarena_champion_mgr395 band 8 /= 0 orelse
			     __Tracesarena_champion_mgr395 /= [] ->
		      lager:do_log(error,
				   [{module, arena_champion_mgr},
				    {function, handle_info}, {line, 395},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~w 执行方法 出错:~w:~w ~w, state:~w",
						 [StateName, X, E,
						  erlang:get_stacktrace(),
						  State]),
				   none, 4096, 8, __Levelarena_champion_mgr395,
				   __Tracesarena_champion_mgr395, lager_event,
				   __Pidarena_champion_mgr395);
		  _ -> ok
		end
	  end;
      _ -> skip
    end,
    continue(StateName, State);
handle_info({combat_end_notify, Flag}, StateName,
	    State) ->
    sys_env:set(arena_champion_set_formation, 1),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr405, _,
       {__Levelarena_champion_mgr405,
	__Tracesarena_champion_mgr405}}
	  when __Levelarena_champion_mgr405 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr405 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, handle_info},
			{line, 405}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("所有战斗计算结束，通知前端刷新UI进入录像观战:~w", [Flag]),
		       none, 4096, 64, __Levelarena_champion_mgr405,
		       __Tracesarena_champion_mgr405, lager_event,
		       __Pidarena_champion_mgr405);
      _ -> ok
    end,
    self() ! {notify_state, 2},
    continue(StateName, State);
handle_info({notify_state, Flag}, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr411, _,
       {__Levelarena_champion_mgr411,
	__Tracesarena_champion_mgr411}}
	  when __Levelarena_champion_mgr411 band 128 /= 0 orelse
		 __Tracesarena_champion_mgr411 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_champion_mgr}, {function, handle_info},
			{line, 411}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("通知全服状态发生变化:~w", [Flag]), none, 4096, 128,
		       __Levelarena_champion_mgr411,
		       __Tracesarena_champion_mgr411, lager_event,
		       __Pidarena_champion_mgr411);
      _ -> ok
    end,
    role_group:send(world,
		    proto_lib:pack(20250, pack_state(Flag, State))),
    continue(StateName, State);
handle_info({push_state, ConnPid}, StateName, State) ->
    sys_conn:pack_send(ConnPid, 20250,
		       pack_state(0, State)),
    continue(StateName, State);
handle_info({apply, M, F, A}, StateName, State) ->
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
	    {__Pidarena_champion_mgr425, _,
	     {__Levelarena_champion_mgr425,
	      __Tracesarena_champion_mgr425}}
		when __Levelarena_champion_mgr425 band 8 /= 0 orelse
		       __Tracesarena_champion_mgr425 /= [] ->
		lager:do_log(error,
			     [{module, arena_champion_mgr},
			      {function, handle_info}, {line, 425},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w 执行方法:~w:~w, ~w, 出错:~w:~w ~w, state:~w",
					   [StateName, M, F, A, X, E,
					    erlang:get_stacktrace(), State]),
			     none, 4096, 8, __Levelarena_champion_mgr425,
			     __Tracesarena_champion_mgr425, lager_event,
			     __Pidarena_champion_mgr425);
	    _ -> ok
	  end
    end,
    continue(StateName, State);
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
      {__Pidarena_champion_mgr431, _,
       {__Levelarena_champion_mgr431,
	__Tracesarena_champion_mgr431}}
	  when __Levelarena_champion_mgr431 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr431 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, handle_info},
			{line, 431}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("gm设置状态信息:~w, ~w ==> ~w, ~w",
				     [StateName, State, NewStateName,
				      NewState]),
		       none, 4096, 64, __Levelarena_champion_mgr431,
		       __Tracesarena_champion_mgr431, lager_event,
		       __Pidarena_champion_mgr431);
      _ -> ok
    end,
    continue(NewStateName, NewState);
handle_info(gm_stop, _StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr436, _,
       {__Levelarena_champion_mgr436,
	__Tracesarena_champion_mgr436}}
	  when __Levelarena_champion_mgr436 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr436 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, handle_info},
			{line, 436}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "gm_stop", none, 4096, 64, __Levelarena_champion_mgr436,
		       __Tracesarena_champion_mgr436, lager_event,
		       __Pidarena_champion_mgr436);
      _ -> ok
    end,
    NewState = set_state_timeout(State, 864000000),
    save_state(idle, NewState),
    continue(idle, NewState);
handle_info(_Info, StateName, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr442, _,
       {__Levelarena_champion_mgr442,
	__Tracesarena_champion_mgr442}}
	  when __Levelarena_champion_mgr442 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr442 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, handle_info},
			{line, 442}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("接收到信息:~w, ~w", [StateName, _Info]), none,
		       4096, 64, __Levelarena_champion_mgr442,
		       __Tracesarena_champion_mgr442, lager_event,
		       __Pidarena_champion_mgr442);
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
      {__Pidarena_champion_mgr446, _,
       {__Levelarena_champion_mgr446,
	__Tracesarena_champion_mgr446}}
	  when __Levelarena_champion_mgr446 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr446 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, terminate},
			{line, 446}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始关闭", none, 4096, 64, __Levelarena_champion_mgr446,
		       __Tracesarena_champion_mgr446, lager_event,
		       __Pidarena_champion_mgr446);
      _ -> ok
    end,
    save_state(StateName, State),
    dets:insert(arena_champion_role,
		ets:tab2list(arena_champion_role)),
    dets:insert(arena_champion_ext,
		ets:tab2list(arena_champion_ext)),
    dets:insert(arena_champion_replay,
		ets:tab2list(arena_champion_replay)),
    dets:insert(arena_champion_bet,
		ets:tab2list(arena_champion_bet)),
    dets:insert(arena_champion_pk,
		ets:tab2list(arena_champion_pk)),
    dets:insert(arena_champion_role_log,
		ets:tab2list(arena_champion_role_log)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr454, _,
       {__Levelarena_champion_mgr454,
	__Tracesarena_champion_mgr454}}
	  when __Levelarena_champion_mgr454 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr454 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, terminate},
			{line, 454}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelarena_champion_mgr454,
		       __Tracesarena_champion_mgr454, lager_event,
		       __Pidarena_champion_mgr454);
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
	arena_champion_lib:get_ext(arena_champion_state, #{}),
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
	  activity_global:set_and_push(14, 1,
				       [State#champion_state.step_status_time]);
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
    d_ets_lib:save_d_ets(arena_champion_ext,
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
    RoundStatusTime = date:unixtime() +
			(StateEndTime - date:unixtime(ms)) div 1000,
    {SeasonStartTime, SeasonEndTime, Step, StepStatus,
     StepStatusTime, Round, RoundStatus, RoundStatusTime,
     Flag}.

step_time(1) ->
    (arena_champion_data:get_const(time_score_ready) +
       arena_champion_data:get_const(time_score_guess)
       + arena_champion_data:get_const(time_score_fight))
      * 6;
step_time(32) ->
    (arena_champion_data:get_const(time_champion_ready) +
       arena_champion_data:get_const(time_champion_guess)
       + arena_champion_data:get_const(time_champion_fight))
      * 3;
step_time(4) ->
    (arena_champion_data:get_const(time_champion_ready) +
       arena_champion_data:get_const(time_champion_guess)
       + arena_champion_data:get_const(time_champion_fight))
      * 2;
step_time(all) ->
    step_time(1) + step_time(32) + step_time(4).

idle(timeout, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr518, _,
       {__Levelarena_champion_mgr518,
	__Tracesarena_champion_mgr518}}
	  when __Levelarena_champion_mgr518 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr518 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, idle},
			{line, 518}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "空闲时间超时", none, 4096, 64, __Levelarena_champion_mgr518,
		       __Tracesarena_champion_mgr518, lager_event,
		       __Pidarena_champion_mgr518);
      _ -> ok
    end,
    continue(idle, set_state_timeout(State, 86400000));
idle(_Any, State) -> continue(idle, State).

score_notice(timeout, State) ->
    case ets:info(arena_champion_role, size) of
      0 ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_champion_mgr527, _,
	     {__Levelarena_champion_mgr527,
	      __Tracesarena_champion_mgr527}}
		when __Levelarena_champion_mgr527 band 8 /= 0 orelse
		       __Tracesarena_champion_mgr527 /= [] ->
		lager:do_log(error,
			     [{module, arena_champion_mgr},
			      {function, score_notice}, {line, 527},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "竞技场参与人数为0，采集数据", none, 4096, 8,
			     __Levelarena_champion_mgr527,
			     __Tracesarena_champion_mgr527, lager_event,
			     __Pidarena_champion_mgr527);
	    _ -> ok
	  end,
	  extract_join_role(),
	  ets:delete_all_objects(arena_champion_formation_info),
	  ets:delete_all_objects(arena_champion_formation),
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
	    {__Pidarena_champion_mgr533, _,
	     {__Levelarena_champion_mgr533,
	      __Tracesarena_champion_mgr533}}
		when __Levelarena_champion_mgr533 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr533 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, score_notice}, {line, 533},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "选拔赛进入准备阶段:1", none, 4096, 64,
			     __Levelarena_champion_mgr533,
			     __Tracesarena_champion_mgr533, lager_event,
			     __Pidarena_champion_mgr533);
	    _ -> ok
	  end,
	  d_ets_lib:clear_d_ets(arena_champion_ext, top_three),
	  notice_msg(score_start, #{}),
	  Now = date:unixtime(),
	  StepStatusTime = Now + step_time(all),
	  NewState = State#champion_state{round = 1,
					  round_status = 1, step_status = 1,
					  step_status_time = StepStatusTime},
	  activity_global:set_and_push(14, 2, [StepStatusTime]),
	  score_match(NewState),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_champion_mgr541, _,
	     {__Levelarena_champion_mgr541,
	      __Tracesarena_champion_mgr541}}
		when __Levelarena_champion_mgr541 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr541 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, score_notice}, {line, 541},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("选拔赛匹配对手完成:1", []), none, 4096, 64,
			     __Levelarena_champion_mgr541,
			     __Tracesarena_champion_mgr541, lager_event,
			     __Pidarena_champion_mgr541);
	    _ -> ok
	  end,
	  Timeout =
	      arena_champion_data:get_const(time_score_ready),
	  self() ! {notify_state, 1},
	  continue(score_ready,
		   set_state_timeout(NewState, Timeout * 1000))
    end;
score_notice(_Any, State) ->
    continue(score_notice, State).

score_ready(timeout,
	    State = #champion_state{round = Round}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr551, _,
       {__Levelarena_champion_mgr551,
	__Tracesarena_champion_mgr551}}
	  when __Levelarena_champion_mgr551 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr551 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, score_ready},
			{line, 551}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("选拔赛进入准备结束期:~w",
				     [State#champion_state.round]),
		       none, 4096, 64, __Levelarena_champion_mgr551,
		       __Tracesarena_champion_mgr551, lager_event,
		       __Pidarena_champion_mgr551);
      _ -> ok
    end,
    sys_env:set(arena_champion_set_formation, 0),
    score_pre_load_combat_fighter(Round),
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
      {__Pidarena_champion_mgr561, _,
       {__Levelarena_champion_mgr561,
	__Tracesarena_champion_mgr561}}
	  when __Levelarena_champion_mgr561 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr561 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, score_ready2},
			{line, 561}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("选拔赛进入竞猜阶段:~w",
				     [State#champion_state.round]),
		       none, 4096, 64, __Levelarena_champion_mgr561,
		       __Tracesarena_champion_mgr561, lager_event,
		       __Pidarena_champion_mgr561);
      _ -> ok
    end,
    sys_env:set(arena_champion_set_formation, 0),
    guess_score_supply(arena_champion_data:get_const(guess_number1),
		       State),
    select_guess(State),
    Timeout =
	arena_champion_data:get_const(time_score_guess),
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
      {__Pidarena_champion_mgr573, _,
       {__Levelarena_champion_mgr573,
	__Tracesarena_champion_mgr573}}
	  when __Levelarena_champion_mgr573 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr573 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, score_guess},
			{line, 573}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("选拔赛进入对战阶段:~w",
				     [State#champion_state.round]),
		       none, 4096, 64, __Levelarena_champion_mgr573,
		       __Tracesarena_champion_mgr573, lager_event,
		       __Pidarena_champion_mgr573);
      _ -> ok
    end,
    score_combat(Round),
    Timeout =
	arena_champion_data:get_const(time_score_fight),
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
    sys_env:set(arena_champion_set_formation, 1),
    guess_stat(0, State),
    RankL = arena_champion_lib:list_rank(100),
    d_ets_lib:save_ets(arena_champion_ext,
		       {rank_list, RankL}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr588, _,
       {__Levelarena_champion_mgr588,
	__Tracesarena_champion_mgr588}}
	  when __Levelarena_champion_mgr588 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr588 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, score_fight},
			{line, 588}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("选拔赛对战完成:~w combat_num=~w",
				     [State#champion_state.round,
				      get(combat_num)]),
		       none, 4096, 64, __Levelarena_champion_mgr588,
		       __Tracesarena_champion_mgr588, lager_event,
		       __Pidarena_champion_mgr588);
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
	    {__Pidarena_champion_mgr592, _,
	     {__Levelarena_champion_mgr592,
	      __Tracesarena_champion_mgr592}}
		when __Levelarena_champion_mgr592 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr592 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, score_fight}, {line, 592},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("选拔赛结束，进入32强比赛时间:~w", [Round]), none,
			     4096, 64, __Levelarena_champion_mgr592,
			     __Tracesarena_champion_mgr592, lager_event,
			     __Pidarena_champion_mgr592);
	    _ -> ok
	  end,
	  Timeout =
	      arena_champion_data:get_const(time_champion_ready),
	  StepStatusTime = date:unixtime() + step_time(32),
	  NewState = State#champion_state{round = 1,
					  round_status = 1, step = 32,
					  step_status = 1,
					  step_status_time = StepStatusTime},
	  L = champion_match(32, 1, NewState),
	  [d_ets_lib:save_ets(arena_champion_ext,
			      {{champion_32, Group}, L1})
	   || {Group, L1} <- L],
	  [d_ets_lib:save_ets(arena_champion_ext,
			      {{champion_32_temp, Group}, L1})
	   || {Group, L1} <- L],
	  [[ets:update_element(arena_champion_role, RoleId,
			       {#arena_champion_role.group32, Group})
	    || #champion_32_pk{id = RoleId} <- L1]
	   || {Group, L1} <- L],
	  self() ! {notify_state, 1},
	  notice_msg(champion_start, #{}),
	  RL0 = [arena_champion_lib:rank_roleid(Rank)
		 || Rank <- lists:seq(1, 32)],
	  sys_env:save(arena_champion_32_ids, RL0),
	  role_group:apply(world,
			   {arena_champion_lib, trigger, [arena_champion_32]}),
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
	    {__Pidarena_champion_mgr612, _,
	     {__Levelarena_champion_mgr612,
	      __Tracesarena_champion_mgr612}}
		when __Levelarena_champion_mgr612 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr612 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, score_fight}, {line, 612},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("选拔赛匹配对手完成, 进入回合：~w", [Round + 1]),
			     none, 4096, 64, __Levelarena_champion_mgr612,
			     __Tracesarena_champion_mgr612, lager_event,
			     __Pidarena_champion_mgr612);
	    _ -> ok
	  end,
	  Timeout =
	      arena_champion_data:get_const(time_score_ready),
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
      {__Pidarena_champion_mgr621, _,
       {__Levelarena_champion_mgr621,
	__Tracesarena_champion_mgr621}}
	  when __Levelarena_champion_mgr621 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr621 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr},
			{function, champion_ready}, {line, 621},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("32强进入竞猜阶段,step:~w, round:~w",
				     [State#champion_state.step,
				      State#champion_state.round]),
		       none, 4096, 64, __Levelarena_champion_mgr621,
		       __Tracesarena_champion_mgr621, lager_event,
		       __Pidarena_champion_mgr621);
      _ -> ok
    end,
    sys_env:set(arena_champion_set_formation, 0),
    champion_pre_load_combat_fighter(State),
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
      {__Pidarena_champion_mgr631, _,
       {__Levelarena_champion_mgr631,
	__Tracesarena_champion_mgr631}}
	  when __Levelarena_champion_mgr631 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr631 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr},
			{function, champion_ready2}, {line, 631},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("32强进入竞猜阶段,step:~w, round:~w",
				     [State#champion_state.step,
				      State#champion_state.round]),
		       none, 4096, 64, __Levelarena_champion_mgr631,
		       __Tracesarena_champion_mgr631, lager_event,
		       __Pidarena_champion_mgr631);
      _ -> ok
    end,
    sys_env:set(arena_champion_set_formation, 0),
    guess_score_supply(arena_champion_data:get_const(guess_number2),
		       State),
    select_guess(State),
    Timeout =
	arena_champion_data:get_const(time_champion_guess),
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
      {__Pidarena_champion_mgr643, _,
       {__Levelarena_champion_mgr643,
	__Tracesarena_champion_mgr643}}
	  when __Levelarena_champion_mgr643 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr643 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr},
			{function, champion_guess}, {line, 643},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("32强进入对战阶段,step:~w, round:~w",
				     [State#champion_state.step,
				      State#champion_state.round]),
		       none, 4096, 64, __Levelarena_champion_mgr643,
		       __Tracesarena_champion_mgr643, lager_event,
		       __Pidarena_champion_mgr643);
      _ -> ok
    end,
    put(combat_num, 0),
    champion_combat(State),
    Timeout =
	arena_champion_data:get_const(time_champion_fight),
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
	       State = #champion_state{round = Round, step = Step,
				       season_start_time = SeasonStartTime,
				       season_end_time = SeasonEndTime}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr655, _,
       {__Levelarena_champion_mgr655,
	__Tracesarena_champion_mgr655}}
	  when __Levelarena_champion_mgr655 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr655 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr},
			{function, champion_fight}, {line, 655},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("32强对战完成,step:~w, round:~w, combat_num:~w",
				     [Step, Round, get(combat_num)]),
		       none, 4096, 64, __Levelarena_champion_mgr655,
		       __Tracesarena_champion_mgr655, lager_event,
		       __Pidarena_champion_mgr655);
      _ -> ok
    end,
    sys_env:set(arena_champion_set_formation, 1),
    champion_combat_check(State),
    guess_stat(0, State),
    RankL = arena_champion_lib:list_rank(100),
    d_ets_lib:save_ets(arena_champion_ext,
		       {rank_list, RankL}),
    self() ! {notify_state, 1},
    case {Step, Round} of
      {32, 3} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_champion_mgr664, _,
	     {__Levelarena_champion_mgr664,
	      __Tracesarena_champion_mgr664}}
		when __Levelarena_champion_mgr664 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr664 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, champion_fight}, {line, 664},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "32强比赛结束，进入4强", none, 4096, 64,
			     __Levelarena_champion_mgr664,
			     __Tracesarena_champion_mgr664, lager_event,
			     __Pidarena_champion_mgr664);
	    _ -> ok
	  end,
	  StepStatusTime = date:unixtime() + step_time(4),
	  NewState = State#champion_state{step = 4,
					  step_status_time = StepStatusTime,
					  round = 1, round_status = 1},
	  [{_, L}] = champion_match(4, 0, NewState),
	  d_ets_lib:save_ets(arena_champion_ext, {champion_4, L}),
	  d_ets_lib:save_ets(arena_champion_ext,
			     {champion_4_temp, L}),
	  [d_ets_lib:clear_d_ets(arena_champion_ext,
				 {champion_32_temp, Group})
	   || Group <- lists:seq(1, 4)],
	  notice_msg(champion_4_start, #{}),
	  Timeout =
	      arena_champion_data:get_const(time_champion_ready),
	  continue(champion_ready,
		   set_state_timeout(NewState, Timeout * 1000));
      {4, 2} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_champion_mgr675, _,
	     {__Levelarena_champion_mgr675,
	      __Tracesarena_champion_mgr675}}
		when __Levelarena_champion_mgr675 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr675 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, champion_fight}, {line, 675},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("4强比赛结束", []), none, 4096, 64,
			     __Levelarena_champion_mgr675,
			     __Tracesarena_champion_mgr675, lager_event,
			     __Pidarena_champion_mgr675);
	    _ -> ok
	  end,
	  RankTopL = arena_champion_lib:list_rank(3),
	  Now = date:unixtime(),
	  d_ets_lib:clear_d_ets(arena_champion_result),
	  d_ets_lib:save_ets(arena_champion_ext,
			     {rank_top, RankTopL}),
	  d_ets_lib:save_ets(arena_champion_ext,
			     {rank_top_time, {SeasonStartTime, SeasonEndTime}}),
	  d_ets_lib:save_ets(arena_champion_ext,
			     {top_three, Now}),
	  MaxNum = ets:info(arena_champion_role, size),
	  rank_reward(1, MaxNum),
	  save_result(1, MaxNum),
	  mail_bet(),
	  {Day, Hour, Minu, Sec} =
	      arena_champion_data:get_const(time_champion_end),
	  Timeout = date:now_diff(Day, {Hour, Minu, Sec}),
	  NewState = set_state_timeout(State#champion_state{round
								= 0,
							    round_status = 0,
							    step_status = 2,
							    step_status_time =
								Now + Timeout},
				       Timeout * 1000),
	  activity_global:set_and_push(14, 0, [0]),
	  d_ets_lib:clear_d_ets(arena_champion_ext,
				champion_4_temp),
	  role_group:apply(world,
			   {arena_champion, push_top_three, []}),
	  notice_msg(champion_end, #{}),
	  ets:delete_all_objects(arena_champion_formation),
	  ets:delete_all_objects(arena_champion_formation_info),
	  save_state(champion_end, NewState),
	  continue(champion_end, NewState);
      _ ->
	  NewState = State#champion_state{round = Round + 1,
					  round_status = 1},
	  notice_msg(champion_round_start, NewState),
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
	    {__Pidarena_champion_mgr703, _,
	     {__Levelarena_champion_mgr703,
	      __Tracesarena_champion_mgr703}}
		when __Levelarena_champion_mgr703 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr703 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, champion_fight}, {line, 703},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("32强进入下回合,step:~w, round:~w",
					   [Step, Round + 1]),
			     none, 4096, 64, __Levelarena_champion_mgr703,
			     __Tracesarena_champion_mgr703, lager_event,
			     __Pidarena_champion_mgr703);
	    _ -> ok
	  end,
	  Timeout =
	      arena_champion_data:get_const(time_champion_ready),
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
      {__Pidarena_champion_mgr712, _,
       {__Levelarena_champion_mgr712,
	__Tracesarena_champion_mgr712}}
	  when __Levelarena_champion_mgr712 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr712 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, champion_end},
			{line, 712}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("冠军赛结束,信息清理处理", []), none, 4096, 64,
		       __Levelarena_champion_mgr712,
		       __Tracesarena_champion_mgr712, lager_event,
		       __Pidarena_champion_mgr712);
      _ -> ok
    end,
    [combat_replay_mgr:dec_replay_reference(ReplayId)
     || {ReplayId} <- ets:tab2list(arena_champion_replay)],
    d_ets_lib:clear_d_ets(arena_champion_replay),
    [d_ets_lib:clear_d_ets(arena_champion_ext,
			   {champion_32, Group})
     || Group <- lists:seq(1, 4)],
    d_ets_lib:clear_d_ets(arena_champion_ext, champion_4),
    d_ets_lib:clear_d_ets(arena_champion_bet),
    d_ets_lib:clear_d_ets(arena_champion_pk),
    d_ets_lib:clear_d_ets(arena_champion_role_log),
    d_ets_lib:clear_d_ets(arena_champion_role),
    ets:delete_all_objects(arena_champion_rank),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr722, _,
       {__Levelarena_champion_mgr722,
	__Tracesarena_champion_mgr722}}
	  when __Levelarena_champion_mgr722 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr722 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, champion_end},
			{line, 722}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("冠军赛结束,信息清理处理完成", []), none, 4096, 64,
		       __Levelarena_champion_mgr722,
		       __Tracesarena_champion_mgr722, lager_event,
		       __Pidarena_champion_mgr722);
      _ -> ok
    end,
    Timeout = date:now_diff(3,
			    arena_champion_data:get_const(time_score_start)),
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

init_robot(Rank, N, BasePower, BaseMinPower, BaseLev,
	   BaseScore)
    when Rank =< 128 ->
    case arena_champion_data:get_robot(N) of
      Data = #{robot := _RobotIds,
	       robot_power := _RobotPowers, robot_lev := _RobotLevs,
	       score := Score} ->
	  R = gen_robot_champion_role(Data, BasePower,
				      BaseMinPower, BaseLev, Rank, N,
				      max(0, BaseScore - Score)),
	  d_ets_lib:save_ets(arena_champion_role, R),
	  ets:insert(arena_champion_rank,
		     #arena_champion_rank{rank = Rank, old_rank = Rank,
					  score = R#arena_champion_role.score,
					  id = {N, <<>>}}),
	  init_robot(Rank + 1, N + 1, BasePower, BaseMinPower,
		     BaseLev, BaseScore);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_champion_mgr741, _,
	     {__Levelarena_champion_mgr741,
	      __Tracesarena_champion_mgr741}}
		when __Levelarena_champion_mgr741 band 8 /= 0 orelse
		       __Tracesarena_champion_mgr741 /= [] ->
		lager:do_log(error,
			     [{module, arena_champion_mgr},
			      {function, init_robot}, {line, 741},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("查找不到机器人数据:rank:~w, id:~w",
					   [Rank, N]),
			     none, 4096, 8, __Levelarena_champion_mgr741,
			     __Tracesarena_champion_mgr741, lager_event,
			     __Pidarena_champion_mgr741);
	    _ -> ok
	  end
    end;
init_robot(_Rank, _N, _BasePower, _BaseMinPower,
	   _BaseLev, _BaseScore) ->
    ok.

gen_robot_champion_role(#{robot := RobotIds,
			  robot_power := RobotPowers, robot_lev := RobotLevs},
			BasePower, BaseMinPower, BaseLev, Rank, N, BaseScore) ->
    Score = round(arena_champion_data:get_const(score_arg) *
		    BaseScore
		    / 1000),
    {MinRatio, MaxRatio} = util:rand_list(RobotPowers),
    MinPower = round(BasePower * MinRatio / 1000),
    MaxPower = round(BasePower * MaxRatio / 1000),
    Power = util:rand(MinPower, MaxPower),
    Name1 = util:rand_list(random_name_data:arena_list(1)),
    Name2 = util:rand_list(random_name_data:arena_list(2)),
    Name3 = util:rand_list(random_name_data:arena_list(3)),
    Name = <<Name1/binary, Name2/binary, Name3/binary>>,
    Sex = util:rand(0, 1),
    Face =
	util:rand_list(arena_champion_data:get_const(face_list)),
    LookId =
	util:rand_list(arena_champion_data:get_const(look_list)),
    RobotId = util:rand_list(RobotIds),
    {MinLev, MaxLev} = util:rand_list(RobotLevs),
    Lev = min(max(10, BaseLev + util:rand(MinLev, MaxLev)),
	      role_career_data:get_const(max_lev)),
    Group = (Rank - 1) rem 1 + 1,
    RoleId = {N, <<>>},
    case arena_champion_data:match_powers(N) of
      [{MatchMinRatio, MatchMaxRatio}] ->
	  erlang:send_after(util:rand(1, 30000), self(),
			    {match_robot, RoleId, BaseLev,
			     round(BaseMinPower * MatchMinRatio / 1000),
			     round(BaseMinPower * MatchMaxRatio / 1000)});
      _ -> skip
    end,
    #arena_champion_role{id = RoleId, name = Name,
			 sex = Sex, face = Face, old_rank = Rank, rank = Rank,
			 robot_id = RobotId, power = Power, max_power = Power,
			 lookid = LookId, group = Group, lev = Lev,
			 old_score = BaseScore, score = Score}.

sync_robot_info(R = #arena_champion_role{id = RoleId},
		#formation_role{id = MatchId, name = MatchName,
				power = Power, formation_type = FormationType,
				formation_lev = FormationLev,
				partners = Partners, hallows_id = HallowsId,
				hallows_lev = HallowsLev,
				hallows_skill_lev = HallowsSkillLev,
				hallows_look_id = HallowsLookId,
				hallows_all_look_ids = HallowsLookIds,
				hallows_lucky = HallowsLucky,
				hallows_seal = HallowsSeal,
				hallows_refine = HallowsRefine}) ->
    LimitBids =
	arena_champion_data:get_const(hero_bid_limit),
    MatchedIds = util:get(match_formation_role_list, []),
    Flag = lists:member(MatchId, MatchedIds),
    case Flag =:= false andalso
	   [1
	    || Bid <- LimitBids,
	       lists:keymember(Bid, #formation_partner.bid, Partners)]
	     =:= []
	of
      true ->
	  put(match_formation_role_list, [MatchId | MatchedIds]),
	  #formation_data{pos = FightPos} =
	      formation_data:get_formation(FormationType),
	  {PList, FightObjects} = to_fight_object(Partners,
						  FightPos, [], []),
	  ets:insert(arena_champion_formation_info,
		     {RoleId, FormationType, FormationLev, PList, 0, []}),
	  ets:insert(arena_champion_formation,
		     {RoleId, FormationType, FormationLev, FightObjects}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_champion_mgr782, _,
	     {__Levelarena_champion_mgr782,
	      __Tracesarena_champion_mgr782}}
		when __Levelarena_champion_mgr782 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr782 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, sync_robot_info}, {line, 782},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("获取跨服玩家数据成功:~w ~ts power=~w",
					   [MatchId, MatchName, Power]),
			     none, 4096, 64, __Levelarena_champion_mgr782,
			     __Tracesarena_champion_mgr782, lager_event,
			     __Pidarena_champion_mgr782);
	    _ -> ok
	  end,
	  NewR = R#arena_champion_role{power = Power,
				       max_power = Power, match_id = MatchId},
	  d_ets_lib:save_ets(arena_champion_role, NewR);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_champion_mgr786, _,
	     {__Levelarena_champion_mgr786,
	      __Tracesarena_champion_mgr786}}
		when __Levelarena_champion_mgr786 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr786 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, sync_robot_info}, {line, 786},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w匹配到玩家，但玩家信息不符合规则，或重复匹配到 flag=~w",
					   [RoleId, Flag]),
			     none, 4096, 64, __Levelarena_champion_mgr786,
			     __Tracesarena_champion_mgr786, lager_event,
			     __Pidarena_champion_mgr786);
	    _ -> ok
	  end,
	  sync_robot_info(R, false)
    end;
sync_robot_info(R = #arena_champion_role{id = RoleId,
					 robot_id = RobotId, lev = Lev,
					 power = Power},
		_) ->
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
	     || #partner{id = Pos, bid = PBid, lev = PLev,
			 star = PStar, quality = PQuality, break_lev = BreakLev,
			 all_attr = #attr{hp_max = HpMax}, use_skin = UseSkin,
			 power = PPower, resonate_lev = ResonateLev}
		    <- Partners],
    NewPower = lists:sum([PPower
			  || #partner{power = PPower} <- Partners]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr796, _,
       {__Levelarena_champion_mgr796,
	__Tracesarena_champion_mgr796}}
	  when __Levelarena_champion_mgr796 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr796 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr},
			{function, sync_robot_info}, {line, 796},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("机器人首次访问锁定数据处理：~w power=~w",
				     [RoleId, NewPower]),
		       none, 4096, 64, __Levelarena_champion_mgr796,
		       __Tracesarena_champion_mgr796, lager_event,
		       __Pidarena_champion_mgr796);
      _ -> ok
    end,
    ets:insert(arena_champion_formation,
	       {RoleId, FormationType, FormationLev, FightObjects}),
    ets:insert(arena_champion_formation_info,
	       {RoleId, FormationType, FormationLev, PList, 0, []}),
    NewR = R#arena_champion_role{power = NewPower,
				 max_power = NewPower},
    d_ets_lib:save_ets(arena_champion_role, NewR);
sync_robot_info(_R, _FormationRole) -> skip.

to_fight_object([], _FightPos, PList, FightObjects) ->
    {PList, FightObjects};
to_fight_object([FP = #formation_partner{pos = Pos,
					 bid = PBid, lev = PLev, star = PStar,
					 break_lev = BreakLev, all_attr = Attr,
					 use_skin = UseSkin, power = PPower,
					 ext = Ext}
		 | T],
		FightPos, PList, FightObjects) ->
    ResonateLev = list_util:keyfind(1, Ext, 0),
    ExtData = [{5, UseSkin}, {11, ResonateLev}],
    NewAttr = #attr{hp_max = HpMax} =
		  attr_calc:ratio(arena_champion_data:get_const(combat_down),
				  Attr),
    P = #{id => Pos, pos => Pos, bid => PBid, lev => PLev,
	  ext_data => ExtData, quality => 0, star => PStar,
	  break_lev => BreakLev, hurt => 0, behurt => 0,
	  curt => 0, hp => HpMax, hp_max => HpMax,
	  power => PPower, match_type => match},
    Partner =
	formation_role_lib:to_partner(FP#formation_partner{all_attr
							       = NewAttr}),
    FO = partner_lib:gen_fight_object({Pos, <<>>}, self(),
				      Partner, combat_lib:is_leader(Pos),
				      {Pos, <<>>}, 0),
    Pos1 = list_util:keyfind(Pos, FightPos),
    to_fight_object(T, FightPos, [P | PList],
		    [FO#fight_object{pos = Pos1} | FightObjects]).

score_match(State) ->
    put(pk_list, []),
    self() ! load_pk_info,
    L1 = ets:tab2list(arena_champion_role),
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
	arena_champion_data:get_score_match({Round, Rank}),
    {MinRank, MaxRank} = util:rand_list(Ranks),
    PKRoleIds = case arena_champion_lib:get_pk(Id) of
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
		 {__Pidarena_champion_mgr840, _,
		  {__Levelarena_champion_mgr840,
		   __Tracesarena_champion_mgr840}}
		     when __Levelarena_champion_mgr840 band 8 /= 0 orelse
			    __Tracesarena_champion_mgr840 /= [] ->
		     lager:do_log(error,
				  [{module, arena_champion_mgr},
				   {function, do_score_match_group},
				   {line, 840}, {pid, pid_to_list(self())},
				   {node, node()}
				   | lager:md()],
				  io_lib:format("根据配置无法匹配到玩家,id=~w rank=~w, min_rank=~w, "
						"max_rank=~w, round=~w pkroleid=~w",
						[Id, Rank, MinRank, MaxRank,
						 Round, PKRoleIds]),
				  none, 4096, 8, __Levelarena_champion_mgr840,
				  __Tracesarena_champion_mgr840, lager_event,
				  __Pidarena_champion_mgr840);
		 _ -> ok
	       end,
	       util:rand_list(L);
	   GetR -> GetR
	 end,
    PK = convert_pk(State, 1, 0, 0, 0, R, R2),
    d_ets_lib:save_ets(arena_champion_pk,
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
    RL0 = arena_champion_lib:list_rank(Num),
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
      {__Pidarena_champion_mgr873, _,
       {__Levelarena_champion_mgr873,
	__Tracesarena_champion_mgr873}}
	  when __Levelarena_champion_mgr873 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr873 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr},
			{function, champion_match}, {line, 873},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("获取~w强数据:~w:~w",
				     [Num, length(L1), length(L2)]),
		       none, 4096, 64, __Levelarena_champion_mgr873,
		       __Tracesarena_champion_mgr873, lager_event,
		       __Pidarena_champion_mgr873);
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
    d_ets_lib:save_ets(arena_champion_pk,
		       convert_pk(State, 1, Group, N, N + 1, R1, R2)),
    d_ets_lib:save_ets(arena_champion_pk,
		       convert_pk(State, 0, Group, N + 1, N, R2, R1)),
    do_champion_match(T1, T2, N + 2, State,
		      [{Group, [PK2, PK1 | L1]} | T]).

gen_next_champion_pk(State = #champion_state{step =
						 32}) ->
    [do_gen_next_champion_pk(Group, State,
			     arena_champion_lib:get_ext({champion_32_temp,
							 Group},
							[]),
			     State)
     || Group <- lists:seq(1, 4)];
gen_next_champion_pk(State) ->
    do_gen_next_champion_pk(0, State,
			    arena_champion_lib:get_ext(champion_4_temp, []),
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
    {ok, R1} = arena_champion_lib:get_role(Id1),
    {ok, R2} = arena_champion_lib:get_role(Id2),
    d_ets_lib:save_ets(arena_champion_pk,
		       convert_pk(State, 1, Group, Pos1, Pos2, R1, R2)),
    d_ets_lib:save_ets(arena_champion_pk,
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
      {__Pidarena_champion_mgr900, _,
       {__Levelarena_champion_mgr900,
	__Tracesarena_champion_mgr900}}
	  when __Levelarena_champion_mgr900 band 8 /= 0 orelse
		 __Tracesarena_champion_mgr900 /= [] ->
	  lager:do_log(error,
		       [{module, arena_champion_mgr},
			{function, do_gen_next_champion_pk_}, {line, 900},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("产生PK信息失败：group:~w ~w:~w pk ~w:~w, list=~w",
				     [_Group, _Pos1, _R1, _Pos2, _R2, L]),
		       none, 4096, 8, __Levelarena_champion_mgr900,
		       __Tracesarena_champion_mgr900, lager_event,
		       __Pidarena_champion_mgr900);
      _ -> ok
    end.

update_rank(ArenaRole = #arena_champion_role{rank =
						 1 = Rank,
					     old_rank = OldRank, id = RoleId,
					     score = Score,
					     score_32 = Score32}) ->
    d_ets_lib:save_ets(arena_champion_role, ArenaRole),
    ets:insert(arena_champion_rank,
	       #arena_champion_rank{rank = Rank, old_rank = OldRank,
				    id = RoleId, score = Score,
				    score_32 = Score32});
update_rank(ArenaRole = #arena_champion_role{rank =
						 Rank,
					     old_rank = OldRank, score = Score,
					     score_32 = Score32,
					     id = RoleId}) ->
    case ets:lookup(arena_champion_rank, Rank - 1) of
      [#arena_champion_rank{id = RoleId2, score = Score2,
			    score_32 = Score32_2, old_rank = OldRank2}]
	  when Score + Score32 > Score2 + Score32_2 orelse
		 Score + Score32 =:= Score2 + Score32_2 andalso
		   OldRank2 > OldRank ->
	  ets:insert(arena_champion_rank,
		     #arena_champion_rank{rank = Rank, id = RoleId2,
					  old_rank = OldRank2, score = Score2,
					  score_32 = Score32_2}),
	  ets:update_element(arena_champion_role, RoleId2,
			     {#arena_champion_role.rank, Rank}),
	  update_rank(ArenaRole#arena_champion_role{rank =
							Rank - 1});
      _ ->
	  d_ets_lib:save_ets(arena_champion_role, ArenaRole),
	  ets:insert(arena_champion_rank,
		     #arena_champion_rank{rank = Rank, old_rank = OldRank,
					  id = RoleId, score = Score,
					  score_32 = Score32})
    end.

score_pre_load_combat_fighter(Round) ->
    L = ets:match_object(arena_champion_pk,
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
		  {arena_champion_mgr, apply_pre_load_combat_fighter,
		   []});
do_pre_load_combat_fighter(_) -> ok.

update_combat_fighter(Robot = #role_robot{id = RoleId,
					  name = Name}) ->
    case catch ets:member(arena_champion_formation, RoleId)
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
	    {__Pidarena_champion_mgr937, _,
	     {__Levelarena_champion_mgr937,
	      __Tracesarena_champion_mgr937}}
		when __Levelarena_champion_mgr937 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr937 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, update_combat_fighter}, {line, 937},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~ts=== update_combat_fighter",
					   [Name]),
			     none, 4096, 64, __Levelarena_champion_mgr937,
			     __Tracesarena_champion_mgr937, lager_event,
			     __Pidarena_champion_mgr937);
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
	    {__Pidarena_champion_mgr946, _,
	     {__Levelarena_champion_mgr946,
	      __Tracesarena_champion_mgr946}}
		when __Levelarena_champion_mgr946 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr946 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, apply_pre_load_combat_fighter},
			      {line, 946}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~ts=== apply_pre_load_combat_fighter",
					   [Role#role.name]),
			     none, 4096, 64, __Levelarena_champion_mgr946,
			     __Tracesarena_champion_mgr946, lager_event,
			     __Pidarena_champion_mgr946);
	    _ -> ok
	  end,
	  gen_fight_objects(Robot);
      _ -> skip
    end,
    ok.

score_combat(Round) ->
    GuessId = get(guess_roleid),
    L = ets:match_object(arena_champion_pk,
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
    ets:delete(arena_champion_pk, Id),
    case util:rand(1, 1000) > 500 of
      true -> info({add_score, Id, 0});
      _ ->
	  #{score := AddScore} =
	      arena_champion_data:get_score_match({Round, 1}),
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
		 {arena_champion_mgr, async_fun_combat_over,
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
    case combat_lib:start_pk(10, AtkList, DefList,
			     CombatRoles, Args)
	of
      {ok, ComPid} ->
	  case GmCmd of
	    undefined -> skip;
	    _ -> erlang:send_after(20, ComPid, GmCmd)
	  end;
      _Err ->
	  arena_champion_mgr:apply({arena_champion_mgr,
				    async_fun_combat_over,
				    [#combat{type = 10},
				     #combat_result{result = 1,
						    replay_info = [{<<>>, 0}]},
				     {score, Id, Name}]}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_champion_mgr981, _,
	     {__Levelarena_champion_mgr981,
	      __Tracesarena_champion_mgr981}}
		when __Levelarena_champion_mgr981 band 8 /= 0 orelse
		       __Tracesarena_champion_mgr981 /= [] ->
		lager:do_log(error,
			     [{module, arena_champion_mgr},
			      {function, do_score_combat_}, {line, 981},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w=start_combat_err===>~w === ~w",
					   [Id, _Err, R]),
			     none, 4096, 8, __Levelarena_champion_mgr981,
			     __Tracesarena_champion_mgr981, lager_event,
			     __Pidarena_champion_mgr981);
	    _ -> ok
	  end
    end.

champion_pre_load_combat_fighter(State =
				     #champion_state{step = 32}) ->
    [do_champion_pre_load_combat_fighter(Group,
					 arena_champion_lib:get_ext({champion_32_temp,
								     Group},
								    []),
					 State)
     || Group <- lists:seq(1, 4)];
champion_pre_load_combat_fighter(State) ->
    do_champion_pre_load_combat_fighter(0,
					arena_champion_lib:get_ext(champion_4_temp,
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

champion_combat(State = #champion_state{step = 32}) ->
    [do_champion_combat(Group,
			arena_champion_lib:get_ext({champion_32_temp, Group},
						   []),
			State)
     || Group <- lists:seq(1, 4)];
champion_combat(State) ->
    do_champion_combat(0,
		       arena_champion_lib:get_ext(champion_4_temp, []), State).

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
		 {arena_champion_mgr, async_fun_combat_over,
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
    case combat_lib:start_pk(10, AtkList, DefList,
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
	    {__Pidarena_champion_mgr1025, _,
	     {__Levelarena_champion_mgr1025,
	      __Tracesarena_champion_mgr1025}}
		when __Levelarena_champion_mgr1025 band 8 /= 0 orelse
		       __Tracesarena_champion_mgr1025 /= [] ->
		lager:do_log(error,
			     [{module, arena_champion_mgr},
			      {function, do_champion_combat_}, {line, 1025},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w pk ~w=start_combat_err===>~w ~w == ~w",
					   [Id1, Id2, _Err, R1, R2]),
			     none, 4096, 8, __Levelarena_champion_mgr1025,
			     __Tracesarena_champion_mgr1025, lager_event,
			     __Pidarena_champion_mgr1025);
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
      {__Pidarena_champion_mgr1028, _,
       {__Levelarena_champion_mgr1028,
	__Tracesarena_champion_mgr1028}}
	  when __Levelarena_champion_mgr1028 band 8 /= 0 orelse
		 __Tracesarena_champion_mgr1028 /= [] ->
	  lager:do_log(error,
		       [{module, arena_champion_mgr},
			{function, do_champion_combat_}, {line, 1028},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("发起战斗失败：group:~w step:~w round:~w ~w "
				     "pk ~w",
				     [_Group, _Step, _Round, _R1, _R2]),
		       none, 4096, 8, __Levelarena_champion_mgr1028,
		       __Tracesarena_champion_mgr1028, lager_event,
		       __Pidarena_champion_mgr1028);
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
						  32}) ->
    [do_champion_combat_check(Group, State,
			      arena_champion_lib:get_ext({champion_32_temp,
							  Group},
							 []),
			      State)
     || Group <- lists:seq(1, 4)],
    [d_ets_lib:save_ets(arena_champion_ext,
			{{champion_32, Group},
			 arena_champion_lib:get_ext({champion_32_temp, Group},
						    [])})
     || Group <- lists:seq(1, 4)];
champion_combat_check(State) ->
    do_champion_combat_check(0, State,
			     arena_champion_lib:get_ext(champion_4_temp, []),
			     State),
    d_ets_lib:save_ets(arena_champion_ext,
		       {champion_4,
			arena_champion_lib:get_ext(champion_4_temp, [])}).

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
      {__Pidarena_champion_mgr1049, _,
       {__Levelarena_champion_mgr1049,
	__Tracesarena_champion_mgr1049}}
	  when __Levelarena_champion_mgr1049 band 8 /= 0 orelse
		 __Tracesarena_champion_mgr1049 /= [] ->
	  lager:do_log(error,
		       [{module, arena_champion_mgr},
			{function, do_champion_combat_check_}, {line, 1049},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("战斗异常结束，不能正常结算,group=~w, pos1=~w, pos2=~w, "
				     "power1=~w, power2=~w, ret=~w",
				     [Group, Pos1, Pos2, Power1, Power2,
				      Result]),
		       none, 4096, 8, __Levelarena_champion_mgr1049,
		       __Tracesarena_champion_mgr1049, lager_event,
		       __Pidarena_champion_mgr1049);
      _ -> ok
    end,
    async_fun_combat_over(champion_fight, State,
			  #combat{type = 10},
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
	    {__Pidarena_champion_mgr1058, _,
	     {__Levelarena_champion_mgr1058,
	      __Tracesarena_champion_mgr1058}}
		when __Levelarena_champion_mgr1058 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr1058 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, dec_combat_num}, {line, 1058},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "战斗统计完成", none, 4096, 64,
			     __Levelarena_champion_mgr1058,
			     __Tracesarena_champion_mgr1058, lager_event,
			     __Pidarena_champion_mgr1058);
	    _ -> ok
	  end,
	  util:set_ms_timer(combat_end_notify, 10,
			    {combat_end_notify, finish});
      _ -> pass
    end.

step_round_combat_pos(4, 1) -> [{1, 2}, {3, 4}];
step_round_combat_pos(4, 2) -> [{5, 6}];
step_round_combat_pos(32, 1) ->
    [{1, 2}, {3, 4}, {5, 6}, {7, 8}];
step_round_combat_pos(32, 2) -> [{9, 10}, {11, 12}];
step_round_combat_pos(32, 3) -> [{13, 14}];
step_round_combat_pos(_, _) -> [].

select_guess(State = #champion_state{step = Step,
				     round = Round}) ->
    L1 = update_pk_info(State),
    MatchPerPowers =
	arena_champion_data:get_const(battel_guess),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr1075, _,
       {__Levelarena_champion_mgr1075,
	__Tracesarena_champion_mgr1075}}
	  when __Levelarena_champion_mgr1075 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr1075 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, select_guess},
			{line, 1075}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("竞技信息per_power=~w, len=~w size=~w",
				     [MatchPerPowers, length(L1),
				      ets:info(arena_champion_role, size)]),
		       none, 4096, 64, __Levelarena_champion_mgr1075,
		       __Tracesarena_champion_mgr1075, lager_event,
		       __Pidarena_champion_mgr1075);
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
    d_ets_lib:save_ets(arena_champion_ext,
		       {guess_id, [RoleId, Id]}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_champion_mgr1087, _,
       {__Levelarena_champion_mgr1087,
	__Tracesarena_champion_mgr1087}}
	  when __Levelarena_champion_mgr1087 band 64 /= 0 orelse
		 __Tracesarena_champion_mgr1087 /= [] ->
	  lager:do_log(info,
		       [{module, arena_champion_mgr}, {function, select_guess},
			{line, 1087}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("本次竞猜信息:~w diff_power:~w, a_power:~w, "
				     "b_power:~w a_name=~ts b_name=~ts guess_id=~w",
				     [GuessInfo, DiffPower, APower, BPower,
				      AName, BName, Id]),
		       none, 4096, 64, __Levelarena_champion_mgr1087,
		       __Tracesarena_champion_mgr1087, lager_event,
		       __Pidarena_champion_mgr1087);
      _ -> ok
    end.

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
	    {__Pidarena_champion_mgr1093, _,
	     {__Levelarena_champion_mgr1093,
	      __Tracesarena_champion_mgr1093}}
		when __Levelarena_champion_mgr1093 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr1093 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, do_select_guess_range_per_power},
			      {line, 1093}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("没有找到双方都满5个英雄的队伍，只能不管队伍人数了", []),
			     none, 4096, 64, __Levelarena_champion_mgr1093,
			     __Tracesarena_champion_mgr1093, lager_event,
			     __Pidarena_champion_mgr1093);
	    _ -> ok
	  end,
	  do_select_guess_min_power2(L, 0, 0, 9999999999, null);
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
	    {__Pidarena_champion_mgr1106, _,
	     {__Levelarena_champion_mgr1106,
	      __Tracesarena_champion_mgr1106}}
		when __Levelarena_champion_mgr1106 band 64 /= 0 orelse
		       __Tracesarena_champion_mgr1106 /= [] ->
		lager:do_log(info,
			     [{module, arena_champion_mgr},
			      {function, do_select_guess_range_per_power},
			      {line, 1106}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("战力匹配符合组:~w", [length(L1)]), none,
			     4096, 64, __Levelarena_champion_mgr1106,
			     __Tracesarena_champion_mgr1106, lager_event,
			     __Pidarena_champion_mgr1106);
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
      {__Pidarena_champion_mgr1121, _,
       {__Levelarena_champion_mgr1121,
	__Tracesarena_champion_mgr1121}}
	  when __Levelarena_champion_mgr1121 band 128 /= 0 orelse
		 __Tracesarena_champion_mgr1121 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_champion_mgr},
			{function, do_select_guess_min_star}, {line, 1121},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("AStarList=~w AvgAStar=~w MAStar=~w BStarList="
				     "~w AvgBStar=~w MBStar=~w  Diff:~w ~w",
				     [AStarList, AvgAStar, MAStar, BStarList,
				      AvgBStar, MBStar, DiffStar1, DiffStar]),
		       none, 4096, 128, __Levelarena_champion_mgr1121,
		       __Tracesarena_champion_mgr1121, lager_event,
		       __Pidarena_champion_mgr1121);
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
		       {arena_champion_mgr, sync_role, [all]})
	of
      ignore -> role_robot:get_role(RoleId);
      _ -> pass
    end.

update_pk_info(#champion_state{step = Step,
			       round = Round}) ->
    L = ets:match_object(arena_champion_pk,
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
      _ -> d_ets_lib:save_ets(arena_champion_pk, NewPK)
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
	arena_champion_lib:get_role(RoleId),
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
	arena_champion_lib:get_role(RoleId),
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
		   b_formation_lev = FormationLev, b_face_file = FaceFile,
		   b_face_update_time = FaceUpdateTime, b_plist = PList,
		   diff_power = abs(Power - APower)}.

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
	    {__Pidarena_champion_mgr1210, _,
	     {__Levelarena_champion_mgr1210,
	      __Tracesarena_champion_mgr1210}}
		when __Levelarena_champion_mgr1210 band 8 /= 0 orelse
		       __Tracesarena_champion_mgr1210 /= [] ->
		lager:do_log(error,
			     [{module, arena_champion_mgr},
			      {function, get_formation_info}, {line, 1210},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("获取角色阵法信息失败:~w, ~ts",
					   [RoleId, Name]),
			     none, 4096, 8, __Levelarena_champion_mgr1210,
			     __Tracesarena_champion_mgr1210, lager_event,
			     __Pidarena_champion_mgr1210);
	    _ -> ok
	  end,
	  get_formation_info({RoleId, Lev, 10000, MaxPower})
    end;
get_formation_info({RoleId, Lev, RobotId, Power}) ->
    case ets:lookup(arena_champion_formation_info, RoleId)
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
		   || #partner{id = Pos, bid = PBid, lev = PLev,
			       star = PStar, quality = PQuality,
			       break_lev = BreakLev,
			       all_attr = #attr{hp_max = HpMax},
			       use_skin = UseSkin, power = PPower,
			       resonate_lev = ResonateLev}
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
		  {__Pidarena_champion_mgr1225, _,
		   {__Levelarena_champion_mgr1225,
		    __Tracesarena_champion_mgr1225}}
		      when __Levelarena_champion_mgr1225 band 64 /= 0 orelse
			     __Tracesarena_champion_mgr1225 /= [] ->
		      lager:do_log(info,
				   [{module, arena_champion_mgr},
				    {function, get_formation_info},
				    {line, 1225}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("机器人首次访问锁定数据处理：~w", [RoleId]),
				   none, 4096, 64,
				   __Levelarena_champion_mgr1225,
				   __Tracesarena_champion_mgr1225, lager_event,
				   __Pidarena_champion_mgr1225);
		  _ -> ok
		end,
		ets:insert(arena_champion_formation,
			   {RoleId, FormationType, FormationLev, FightObjects}),
		ets:insert(arena_champion_formation_info,
			   {RoleId, FormationType, FormationLev, PList, 0, []});
	    _ -> skip
	  end,
	  {FormationType, FormationLev, PList, 0, [], <<>>, 0}
    end;
get_formation_info(Robot = #role_robot{m_formation =
					   #m_formation{},
				       partners = Partners}) ->
    #formation_sys{type = FormationType,
		   pos_info = PosInfo} =
	formation:get_sys_formation(Robot, 6),
    {SpriteLev, Sprites} = sprite_tree:get_sprite_lev(Robot,
						      6),
    FormationLev = 1,
    Fun = fun (#formation_pos{id = Id, pos = Pos}) ->
		  #partner{lev = PLev, bid = PBid, use_skin = UseSkin,
			   quality = PQuality, star = PStar,
			   break_lev = BreakLev,
			   all_attr = #attr{hp_max = HpMax}, power = PPower,
			   resonate_lev = ResonateLev} =
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
    {ok, R} = arena_champion_lib:get_role(Id),
    gen_fight_objects(R);
gen_fight_objects(R = #arena_champion_role{id = RoleId,
					   name = Name, robot_id = 0}) ->
    case catch ets:lookup(arena_champion_formation, RoleId)
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
	    {__Pidarena_champion_mgr1250, _,
	     {__Levelarena_champion_mgr1250,
	      __Tracesarena_champion_mgr1250}}
		when __Levelarena_champion_mgr1250 band 128 /= 0 orelse
		       __Tracesarena_champion_mgr1250 /= [] ->
		lager:do_log(debug,
			     [{module, arena_champion_mgr},
			      {function, gen_fight_objects}, {line, 1250},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("缓存里已有阵法战斗信息，不再从机器人列表中获取:~ts",
					   [Name]),
			     none, 4096, 128, __Levelarena_champion_mgr1250,
			     __Tracesarena_champion_mgr1250, lager_event,
			     __Pidarena_champion_mgr1250);
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
		  {__Pidarena_champion_mgr1257, _,
		   {__Levelarena_champion_mgr1257,
		    __Tracesarena_champion_mgr1257}}
		      when __Levelarena_champion_mgr1257 band 8 /= 0 orelse
			     __Tracesarena_champion_mgr1257 /= [] ->
		      lager:do_log(error,
				   [{module, arena_champion_mgr},
				    {function, gen_fight_objects}, {line, 1257},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("获取角色[~w][~ts]机器人数据失败",
						 [RoleId, Name]),
				   none, 4096, 8, __Levelarena_champion_mgr1257,
				   __Tracesarena_champion_mgr1257, lager_event,
				   __Pidarena_champion_mgr1257);
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
    case catch ets:lookup(arena_champion_formation, RoleId)
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
	    {__Pidarena_champion_mgr1264, _,
	     {__Levelarena_champion_mgr1264,
	      __Tracesarena_champion_mgr1264}}
		when __Levelarena_champion_mgr1264 band 128 /= 0 orelse
		       __Tracesarena_champion_mgr1264 /= [] ->
		lager:do_log(debug,
			     [{module, arena_champion_mgr},
			      {function, gen_fight_objects}, {line, 1264},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("缓存里已有机器人阵法战斗信息，不再从机器人列表中获取:~ts",
					   [_Name]),
			     none, 4096, 128, __Levelarena_champion_mgr1264,
			     __Tracesarena_champion_mgr1264, lager_event,
			     __Pidarena_champion_mgr1264);
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
	  ets:insert(arena_champion_formation,
		     {RoleId, FormationType, FormationLev, FL}),
	  {FormationType, FormationLev, FL}
    end;
gen_fight_objects(PK = #champion_pk{b_id = RoleId,
				    b_name = Name, b_robot_id = 0}) ->
    case catch ets:lookup(arena_champion_formation, RoleId)
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
	    {__Pidarena_champion_mgr1279, _,
	     {__Levelarena_champion_mgr1279,
	      __Tracesarena_champion_mgr1279}}
		when __Levelarena_champion_mgr1279 band 128 /= 0 orelse
		       __Tracesarena_champion_mgr1279 /= [] ->
		lager:do_log(debug,
			     [{module, arena_champion_mgr},
			      {function, gen_fight_objects}, {line, 1279},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("缓存里已有阵法战斗信息，不再从机器人列表中获取:~ts",
					   [Name]),
			     none, 4096, 128, __Levelarena_champion_mgr1279,
			     __Tracesarena_champion_mgr1279, lager_event,
			     __Pidarena_champion_mgr1279);
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
		  {__Pidarena_champion_mgr1286, _,
		   {__Levelarena_champion_mgr1286,
		    __Tracesarena_champion_mgr1286}}
		      when __Levelarena_champion_mgr1286 band 8 /= 0 orelse
			     __Tracesarena_champion_mgr1286 /= [] ->
		      lager:do_log(error,
				   [{module, arena_champion_mgr},
				    {function, gen_fight_objects}, {line, 1286},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("获取角色[~w][~ts]机器人数据失败",
						 [RoleId, Name]),
				   none, 4096, 8, __Levelarena_champion_mgr1286,
				   __Tracesarena_champion_mgr1286, lager_event,
				   __Pidarena_champion_mgr1286);
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
    case catch ets:lookup(arena_champion_formation, RoleId)
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
	    {__Pidarena_champion_mgr1293, _,
	     {__Levelarena_champion_mgr1293,
	      __Tracesarena_champion_mgr1293}}
		when __Levelarena_champion_mgr1293 band 128 /= 0 orelse
		       __Tracesarena_champion_mgr1293 /= [] ->
		lager:do_log(debug,
			     [{module, arena_champion_mgr},
			      {function, gen_fight_objects}, {line, 1293},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("缓存里已有机器人阵法战斗信息，不再从机器人列表中获取:~ts",
					   [_Name]),
			     none, 4096, 128, __Levelarena_champion_mgr1293,
			     __Tracesarena_champion_mgr1293, lager_event,
			     __Pidarena_champion_mgr1293);
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
	  ets:insert(arena_champion_formation,
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
    FL = combat_attr:calc(FL0, 10, Robot),
    ets:insert(arena_champion_formation,
	       {RoleId, FormationType, FormationLev, FL}),
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
    d_ets_lib:save_ets(arena_champion_replay, {ReplayId}),
    combat_replay_mgr:acc_replay_reference(ReplayId),
    catch do_fire_after_combat(Id, a, Combat, CombatResult),
    case arena_champion_lib:get_role(Id) of
      {ok,
       R = #arena_champion_role{score = Score, win = Win,
				combat_num = CombatNum}}
	  when Result =:= 1 ->
	  #{score := AddScore} =
	      arena_champion_data:get_score_match({Round, 1}),
	  update_pk_ret_info(Id, 1, ReplayId, 0, AStatInfo,
			     BStatInfo, AddScore),
	  update_rank(R#arena_champion_role{score =
						Score + AddScore,
					    win = Win + 1,
					    combat_num = CombatNum + 1});
      {ok, _R} ->
	  ets:update_counter(arena_champion_role, Id,
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
	    {__Pidarena_champion_mgr1332, _,
	     {__Levelarena_champion_mgr1332,
	      __Tracesarena_champion_mgr1332}}
		when __Levelarena_champion_mgr1332 band 128 /= 0 orelse
		       __Tracesarena_champion_mgr1332 /= [] ->
		lager:do_log(debug,
			     [{module, arena_champion_mgr},
			      {function, async_fun_combat_over}, {line, 1332},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("战斗结束:~w", [Id]), none, 4096, 128,
			     __Levelarena_champion_mgr1332,
			     __Tracesarena_champion_mgr1332, lager_event,
			     __Pidarena_champion_mgr1332);
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
	    {__Pidarena_champion_mgr1334, _,
	     {__Levelarena_champion_mgr1334,
	      __Tracesarena_champion_mgr1334}}
		when __Levelarena_champion_mgr1334 band 8 /= 0 orelse
		       __Tracesarena_champion_mgr1334 /= [] ->
		lager:do_log(error,
			     [{module, arena_champion_mgr},
			      {function, async_fun_combat_over}, {line, 1334},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("战斗结束,查找不到参赛成员信息:~w, ~ts",
					   [Id, Name]),
			     none, 4096, 8, __Levelarena_champion_mgr1334,
			     __Tracesarena_champion_mgr1334, lager_event,
			     __Pidarena_champion_mgr1334);
	    _ -> ok
	  end
    end;
async_fun_combat_over(champion_fight,
		      #champion_state{step = 4}, Combat,
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
      {__Pidarena_champion_mgr1337, _,
       {__Levelarena_champion_mgr1337,
	__Tracesarena_champion_mgr1337}}
	  when __Levelarena_champion_mgr1337 band 128 /= 0 orelse
		 __Tracesarena_champion_mgr1337 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_champion_mgr},
			{function, async_fun_combat_over}, {line, 1337},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("4强对战结束 pos1:~w, pos2:~w, ret:~w",
				     [Pos1, Pos2, Result]),
		       none, 4096, 128, __Levelarena_champion_mgr1337,
		       __Tracesarena_champion_mgr1337, lager_event,
		       __Pidarena_champion_mgr1337);
      _ -> ok
    end,
    dec_combat_num(),
    L = arena_champion_lib:get_ext(champion_4_temp, []),
    PK1 = #champion_32_pk{id = Id1} = lists:keyfind(Pos1,
						    #champion_32_pk.pos, L),
    PK2 = #champion_32_pk{id = Id2} = lists:keyfind(Pos2,
						    #champion_32_pk.pos, L),
    [{_, ReplayId} | _] = ReplayInfo,
    catch do_fire_after_combat(Id1, a, Combat,
			       CombatResult),
    catch do_fire_after_combat(Id2, b, Combat,
			       CombatResult),
    d_ets_lib:save_ets(arena_champion_replay, {ReplayId}),
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
					arena_champion_lib:get_role(Id1),
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
				    ets:update_counter(arena_champion_role, Id2,
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
					arena_champion_lib:get_role(Id2),
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
				    ets:update_counter(arena_champion_role, Id1,
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
	       1 -> 5;
	       3 -> 6;
	       5 -> 7
	     end,
    L3 = [NewPK#champion_32_pk{pos = NewPos} | L2],
    d_ets_lib:save_ets(arena_champion_ext,
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
      {__Pidarena_champion_mgr1375, _,
       {__Levelarena_champion_mgr1375,
	__Tracesarena_champion_mgr1375}}
	  when __Levelarena_champion_mgr1375 band 128 /= 0 orelse
		 __Tracesarena_champion_mgr1375 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_champion_mgr},
			{function, async_fun_combat_over}, {line, 1375},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("32强对战结束 group:~w, pos1:~w, pos2:~w, "
				     "ret:~w",
				     [Group, Pos1, Pos2, Result]),
		       none, 4096, 128, __Levelarena_champion_mgr1375,
		       __Tracesarena_champion_mgr1375, lager_event,
		       __Pidarena_champion_mgr1375);
      _ -> ok
    end,
    dec_combat_num(),
    L = arena_champion_lib:get_ext({champion_32_temp,
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
    d_ets_lib:save_ets(arena_champion_replay, {ReplayId}),
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
					arena_champion_lib:get_role(Id1),
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
				    ets:update_counter(arena_champion_role, Id2,
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
					arena_champion_lib:get_role(Id2),
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
				    ets:update_counter(arena_champion_role, Id1,
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
    d_ets_lib:save_ets(arena_champion_ext,
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
      {__Pidarena_champion_mgr1417, _,
       {__Levelarena_champion_mgr1417,
	__Tracesarena_champion_mgr1417}}
	  when __Levelarena_champion_mgr1417 band 8 /= 0 orelse
		 __Tracesarena_champion_mgr1417 /= [] ->
	  lager:do_log(error,
		       [{module, arena_champion_mgr},
			{function, async_fun_combat_over}, {line, 1417},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("战斗结束处理失败，state_name=~w, _Arg:~w",
				     [_StateName, _Arg]),
		       none, 4096, 8, __Levelarena_champion_mgr1417,
		       __Tracesarena_champion_mgr1417, lager_event,
		       __Pidarena_champion_mgr1417);
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
    case arena_champion_lib:get_pk(Id) of
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
	    {__Pidarena_champion_mgr1436, _,
	     {__Levelarena_champion_mgr1436,
	      __Tracesarena_champion_mgr1436}}
		when __Levelarena_champion_mgr1436 band 128 /= 0 orelse
		       __Tracesarena_champion_mgr1436 /= [] ->
		lager:do_log(debug,
			     [{module, arena_champion_mgr},
			      {function, update_pk_ret_info}, {line, 1436},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("更新PK结果信息:id:~w, ret=~w, replay_id=~w, "
					   "copy_id=~w",
					   [Id, Ret, ReplayId, CopyId]),
			     none, 4096, 128, __Levelarena_champion_mgr1436,
			     __Tracesarena_champion_mgr1436, lager_event,
			     __Pidarena_champion_mgr1436);
	    _ -> ok
	  end,
	  case Id of
	    {_, <<>>} -> ets:delete(arena_champion_pk, Id);
	    _ ->
		Log = #champion_role_log{logs = Logs} =
			  arena_champion_lib:get_log(Id),
		N = length(Logs) + 1,
		NewLog = Log#champion_role_log{logs = [N | Logs]},
		d_ets_lib:save_ets(arena_champion_role_log, NewLog),
		d_ets_lib:save_ets(arena_champion_pk,
				   PK1#champion_pk{id = {Id, N}}),
		d_ets_lib:save_ets(arena_champion_pk, PK1)
	  end,
	  case Id =:= get(guess_roleid) of
	    true ->
		d_ets_lib:save_ets(arena_champion_ext,
				   {guess_id, [get(guess_id)]}),
		d_ets_lib:save_ets(arena_champion_pk,
				   PK1#champion_pk{id = get(guess_id)});
	    _ -> pass
	  end,
	  case CopyId > 0 of
	    true ->
		d_ets_lib:save_ets(arena_champion_pk,
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
	    {__Pidarena_champion_mgr1462, _,
	     {__Levelarena_champion_mgr1462,
	      __Tracesarena_champion_mgr1462}}
		when __Levelarena_champion_mgr1462 band 8 /= 0 orelse
		       __Tracesarena_champion_mgr1462 /= [] ->
		lager:do_log(error,
			     [{module, arena_champion_mgr},
			      {function, update_pk_ret_info}, {line, 1462},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("更新PK结果失败:~w", [Id]), none, 4096, 8,
			     __Levelarena_champion_mgr1462,
			     __Tracesarena_champion_mgr1462, lager_event,
			     __Pidarena_champion_mgr1462);
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
	    {__Pidarena_champion_mgr1473, _,
	     {__Levelarena_champion_mgr1473,
	      __Tracesarena_champion_mgr1473}}
		when __Levelarena_champion_mgr1473 band 8 /= 0 orelse
		       __Tracesarena_champion_mgr1473 /= [] ->
		lager:do_log(error,
			     [{module, arena_champion_mgr},
			      {function, merge_partner_combat_info},
			      {line, 1473}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("查找不到伙伴战斗信息,id=~w, bid=~w",
					   [Id, Bid]),
			     none, 4096, 8, __Levelarena_champion_mgr1473,
			     __Tracesarena_champion_mgr1473, lager_event,
			     __Pidarena_champion_mgr1473);
	    _ -> ok
	  end,
	  merge_partner_combat_info(T, StatInfo, [P | List])
    end.

guess_score_supply(_BaseVal,
		   #champion_state{step = 1, round = 1}) ->
    ok;
guess_score_supply(BaseVal, _State) ->
    [ets:update_counter(arena_champion_bet, RoleId,
			{#champion_bet.bet, BaseVal})
     || {RoleId, _, _} <- util:get(guess_list, [])].

guess_stat(BaseVal, State) ->
    erase(guess_roleid),
    case arena_champion_lib:get_pk(get(guess_id)) of
      {ok, #champion_pk{ret = Ret}} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_champion_mgr1490, _,
	     {__Levelarena_champion_mgr1490,
	      __Tracesarena_champion_mgr1490}}
		when __Levelarena_champion_mgr1490 band 128 /= 0 orelse
		       __Tracesarena_champion_mgr1490 /= [] ->
		lager:do_log(debug,
			     [{module, arena_champion_mgr},
			      {function, guess_stat}, {line, 1490},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("结算竞猜信息:guess_id=~w, a_bet=~w, b_bet=~w",
					   [get(guess_id), get(guess_a_bet),
					    get(guess_b_bet)]),
			     none, 4096, 128, __Levelarena_champion_mgr1490,
			     __Tracesarena_champion_mgr1490, lager_event,
			     __Pidarena_champion_mgr1490);
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
	    {__Pidarena_champion_mgr1495, _,
	     {__Levelarena_champion_mgr1495,
	      __Tracesarena_champion_mgr1495}}
		when __Levelarena_champion_mgr1495 band 8 /= 0 orelse
		       __Tracesarena_champion_mgr1495 /= [] ->
		lager:do_log(error,
			     [{module, arena_champion_mgr},
			      {function, guess_stat}, {line, 1495},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("查找不到竞猜对象信息:~w", [get(guess_id)]),
			     none, 4096, 8, __Levelarena_champion_mgr1495,
			     __Tracesarena_champion_mgr1495, lager_event,
			     __Pidarena_champion_mgr1495);
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
	      arena_champion_lib:get_bet(RoleId),
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
			   [{arena_champion_guess_win_count, RoleId,
			     GuessWinCount}]),
    case GetVal > 0 of
      true ->
	  case role_query:local_pid(by_id, RoleId) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    Val1 = var:get_var(R, acc, 2054, 0),
				    NewVal = Val1 + 1,
				    NR_1 = var:set_var(R, acc, 2054, NewVal),
				    DayVal = var:get_var(NR_1, day, 84, 0),
				    NewDayVal = DayVal + 1,
				    NR = var:set_var(NR_1, day, 84, NewDayVal),
				    NewR =
					role_trigger:fire([#evt_championships_bet_win{},
							   #evt_championships_bet_cont_win{count
											       =
											       NewVal}],
							  NR),
				    {ok, NewR}
			    end});
	    _ -> skip
	  end,
	  role:pack_send(RoleId, 12742,
			 {[{19, 0, GetVal, 0, 0}], Step * 10 + Round});
      _ ->
	  case role_query:local_pid(by_id, RoleId) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NR_1 = var:set_var(R, acc, 2054, 0),
				    NR = var:set_var(NR_1, day, 84, 0),
				    NewR =
					role_trigger:fire([#evt_championships_bet_cont_win{count
											       =
											       0}],
							  NR),
				    {ok, NewR}
			    end});
	    _ -> skip
	  end
    end,
    d_ets_lib:save_ets(arena_champion_bet, NewBet).

mail_notify_start(Time) ->
    {{_Y, Month, Day}, {Hour, Minu, _}} =
	date:seconds_to_datetime(Time),
    mail:global_send(#gmail{id = {arena, Day},
			    end_time = Time,
			    subject =
				lang:get(<<"Xem trước giải vô địch"/utf8>>),
			    content =
				color:msg(lang:get(<<"Kính gửi Quý Nhẫn Giả:\nChức vô địch "
						     "mới sẽ bắt đầu vào ~ts tháng~ts ngày~ts:~ts. "
						     "Truy cập vào Đấu trườngTham gia cuộc "
						     "thi và các phương thức cá cược liên "
						     "quan, đồng thời những phần thưởng hậu "
						     "hĩnh đang chờ đợi bạn. Ba người đứng "
						     "đầu cũng sẽ nhận được các danh hiệu "
						     "độc quyền.\nAi có thể giành được danh "
						     "hiệu vô địch?Chúng ta sẽ thấy。"/utf8>>),
					  [{binary, Month}, {binary, Day},
					   {binary, Hour}, {time, Minu}]),
			    conds = [{minlev, 10}]}).

rank_reward(Rank, MaxNum) when Rank =< MaxNum ->
    case arena_champion_data:rank_reward(Rank) of
      Items = [_ | _] ->
	  case arena_champion_lib:rank_role(Rank) of
	    {ok, #arena_champion_role{id = {_, <<>>}}} -> pass;
	    {ok, #arena_champion_role{id = RoleId = {_, Sid}}} ->
		var:update_role_var_list(RoleId, other,
					 [{min, 2, Rank}]),
		catch cluster_lib:cast(Sid, room_feat_mgr, info,
				       [{arena_champion_do_feat, RoleId,
					 Rank}]),
		mail:send(RoleId,
			  {lang:get(<<"Phần thưởng mùa giải vô địch"/utf8>>),
			   color:msg(lang:get(<<"Quý Nhẫn Giả thân mến: \nXin chúc mừng "
						"bạn đã giành được vị trí trong chức "
						"vô địch này. Đây là phần thưởng xếp "
						"hạng của bạn。"/utf8>>),
				     [{binary, Rank}]),
			   items, Items, <<"Đấu trường"/utf8>>});
	    _ -> pass
	  end;
      _ -> pass
    end,
    rank_reward(Rank + 1, MaxNum);
rank_reward(_Rank, _MaxNum) -> pass.

save_result(Rank, MaxNum) when Rank =< MaxNum ->
    case arena_champion_lib:rank_role(Rank) of
      {ok, #arena_champion_role{id = {_, <<>>}}} -> pass;
      {ok,
       #arena_champion_role{id = RoleId, combat_num = CNum,
			    win = Win}} ->
	  d_ets_lib:save_d_ets(arena_champion_result,
			       #champion_result{id = RoleId, rank = Rank,
						cnum = CNum, win = Win});
      _ -> pass
    end,
    save_result(Rank + 1, MaxNum);
save_result(_Rank, _MaxNum) -> pass.

mail_bet() ->
    [do_mail_bet(I)
     || I <- ets:tab2list(arena_champion_bet)].

do_mail_bet(#champion_bet{id = RoleId, bet = Bet})
    when Bet > 0 ->
    Items = [{8, Bet}],
    mail:send(RoleId,
	      {lang:get(<<"Nhận điểm thi đấu vô địch"/utf8>>),
	       lang:get(<<"Thưa Quý Nhẫn Giả:  \n\t\t\tĐây là điểm "
			  "thi đấu được chuyển đổi từ số xu dự "
			  "đoán mà bạn đã nhận được trong giải "
			  "đấu vô địch lần này. \n\t\t\tCó thể "
			  "sử dụng điểm thi đấu trong “Cửa hàng "
			  "- Cửa hàng điểm” để đổi vật phẩm."/utf8>>),
	       items, Items, <<"Đấu trường"/utf8>>}),
    ets:update_element(arena_champion_bet, RoleId,
		       {#champion_bet.bet, 0});
do_mail_bet(_) -> ok.

notice_msg(idle, #{}) ->
    notice:broadcast(rumor,
		     color:msg(lang:get(<<"Vòng mới của chức vô địch <div fontcolor=#d95"
					  "014> sẽ bắt đầu vào 21:05 tối mai</div>。128 "
					  "nhẫn giả đứng đầu bảng xếp hạng sẽ tham "
					  "gia tranh tài. Chúng ta hãy cùng chờ "
					  "xem ai sẽ lên ngôi vô địch.。"/utf8>>),
			       []));
notice_msg(score_notice, #{num := 0}) ->
    notice:broadcast(rumor,
		     color:msg(lang:get(<<"Vòng mới của chức vô địch <div fontcolor=#d95"
					  "014> sẽ bắt đầu vào lúc 21:05 tối nay</div>。1"
					  "28 nhẫn giả đứng đầu bảng xếp hạng sẽ "
					  "tham gia tranh tài. Chúng ta hãy cùng "
					  "chờ xem ai sẽ lên ngôi vô địch.。"/utf8>>),
			       []));
notice_msg(score_notice, #{num := 1}) ->
    notice:broadcast(rumor,
		     color:msg(lang:get(<<"Vòng mới của chức vô địch <div fontcolor=#d95"
					  "014> sẽ bắt đầu vào lúc 21:05 tối nay</div>。T"
					  "ham gia vào trò chơi đoán để kiếm điểm "
					  "đoán, có thể dùng để đổi các đạo cụ "
					  "quý hiếm tại trung tâm mua điểm.。"/utf8>>),
			       []));
notice_msg(score_notice, #{num := 2}) ->
    notice:broadcast(rumor,
		     color:msg(lang:get(<<"Giải vô địch này sắp bắt đầu, bạn có "
					  "thể <div fontcolor=#d95014> tham gia "
					  "cuộc thi và đoán cách chơi</div>，Rất "
					  "nhiều phần thưởng đang chờ đợi bạn！！"/utf8>>),
			       []));
notice_msg(score_start, _Arg) ->
    notice:broadcast(rumor_left_top,
		     color:msg(lang:get(<<"Chức vô địch này chính thức bắt đầu! "
					  "Bạn có thể đến đấu trường để tham gia "
					  "các cuộc thi và câu đố, đồng thời nhiều "
					  "phần thưởng hào phóng đang chờ đợi bạn."/utf8>>),
			       []));
notice_msg(champion_start, _Arg) ->
    notice:broadcast(rumor_left_top,
		     color:msg(lang:get(<<"Sau khi cuộc thi tuyển chọn kết thúc, "
					  "cuộc thi top 32 đã bắt đầu! Hãy đến "
					  "và tham gia dự đoán để nhận được nhiều "
					  "phần thưởng!。~ts"/utf8>>),
			       [{href,
				 {30, green, [],
				  lang:get(<<"Đi xem trận đấu"/utf8>>)}}]));
notice_msg(champion_4_start, _Arg) ->
    notice:broadcast(rumor_left_top,
		     color:msg(lang:get(<<"Bốn nhẫn giả dẫn đầu giải vô địch đã "
					  "có mặt. Họ là:：~ts。Ai sẽ lên ngôi vô "
					  "địch?？"/utf8>>),
			       [{list,
				 [{name, Rid, Name}
				  || #arena_champion_role{id = Rid, name = Name}
					 <- arena_champion_lib:list_rank(4)]}]));
notice_msg(champion_round_start,
	   #champion_state{step = 4, round = 2}) ->
    notice:broadcast(rumor_left_top,
		     color:msg(lang:get(<<"Chúc mừng~tsVượt qua vòng vây và lọt "
					  "vào trận chung kết, ai sẽ giành chức "
					  "vô địch?？~ts  "/utf8>>),
			       [{list,
				 [{name, Rid, Name}
				  || #arena_champion_role{id = Rid, name = Name}
					 <- arena_champion_lib:list_rank(2)]},
				{href,
				 {30, green, [],
				  lang:get(<<"Đi xem trận đấu"/utf8>>)}}]));
notice_msg(champion_end, _Arg) ->
    notice:broadcast(rumor_left_top,
		     color:msg(lang:get(<<"Giải vô địch này đã kết thúc, xin chúc "
					  "mừng~tsTrở thành người chiến thắng chức "
					  "vô địch này！"/utf8>>),
			       [{name, Rid, Name}
				|| #arena_champion_role{id = Rid, name = Name}
				       <- arena_champion_lib:list_rank(1)]));
notice_msg(_Label, _Arg) -> ok.

arena_champion_role_ver({arena_champion_role, Id, Name,
			 Lev, Sex, Gid, Gname, Face, MaxPower, Power, LookId,
			 OldRank, OldScore, Score, Score32, Rank, AvatarId,
			 RobotId, Group, Group32, CombatNum, Win, Lose,
			 Time}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    arena_champion_role_ver({arena_champion_role, Id, Name,
			     Lev, Sex, Gid, Gname, Face, MaxPower, Power,
			     LookId, OldRank, OldScore, Score, Score32, Rank,
			     AvatarId, RobotId, Group, Group32, CombatNum, Win,
			     Lose, Time, FaceUpdateTime, FaceFile});
arena_champion_role_ver({arena_champion_role, Id, Name,
			 Lev, Sex, Gid, Gname, Face, MaxPower, Power, LookId,
			 OldRank, OldScore, Score, Score32, Rank, AvatarId,
			 RobotId, Group, Group32, CombatNum, Win, Lose, Time,
			 FaceUpdateTime, FaceFile}) ->
    MatchId = {0, <<>>},
    arena_champion_role_ver({arena_champion_role, Id, Name,
			     Lev, Sex, Gid, Gname, Face, MaxPower, Power,
			     LookId, OldRank, OldScore, Score, Score32, Rank,
			     AvatarId, RobotId, Group, Group32, CombatNum, Win,
			     Lose, Time, FaceUpdateTime, FaceFile, MatchId});
arena_champion_role_ver(R = #arena_champion_role{}) ->
    {ok, R}.


