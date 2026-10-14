-file("arena_elite_lib.erl", 1).

-module(arena_elite_lib).

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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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

-export([init/0, init_log/0, login/1, get_info/1,
	 check_open/1, zero_flush/1, get_rival_info/1,
	 push_combat_state/1, save_is_skip/2, match/1,
	 match_over/2, push_old_rank_info/5, get_lev_award/2,
	 buy_count/1, get_formation_sys/2,
	 get_sys_formation_power/1, get_sys_formation_star/1,
	 set_formation_sys/3, get_formation_ids/1,
	 get_rank_info/1, get_log/2, push_c_log/3,
	 get_log_info/3, combat/1, auto_combat/1, do_combat2/1,
	 combat_over/4, to_arena_role/2, to_round_log/11]).

-export([gm_set_lev/2, gm_set_score/2,
	 gm_del_rival_info/1]).

-file("/sszg_code/server/inc/common.hrl", 1).

-file("/sszg_code/server/inc/lib_log.hrl", 1).

-file("/sszg_code/server/inc/common.hrl", 112).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("arena_elite_lib.erl", 53).

-file("/sszg_code/server/inc/role.hrl", 1).

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

-file("arena_elite_lib.erl", 54).

-file("/sszg_code/server/inc/arena_elite.hrl", 1).

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

-file("arena_elite_lib.erl", 55).

-file("/sszg_code/server/inc/formation.hrl", 1).

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

-file("arena_elite_lib.erl", 56).

-file("/sszg_code/server/inc/hallows.hrl", 1).

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

-file("arena_elite_lib.erl", 57).

-file("/sszg_code/server/inc/partner.hrl", 1).

-file("/sszg_code/server/inc/attr.hrl", 1).

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

-file("/sszg_code/server/inc/partner.hrl", 11).

-file("/sszg_code/server/inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("/sszg_code/server/inc/partner.hrl", 12).

-file("/sszg_code/server/inc/common.hrl", 1).

-file("/sszg_code/server/inc/partner.hrl", 13).

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

-file("arena_elite_lib.erl", 58).

-file("/sszg_code/server/inc/combat.hrl", 1).

-file("/sszg_code/server/inc/common.hrl", 1).

-file("/sszg_code/server/inc/combat.hrl", 13).

-file("/sszg_code/server/inc/attr.hrl", 1).

-file("/sszg_code/server/inc/combat.hrl", 14).

-file("/sszg_code/server/inc/skill.hrl", 1).

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

-file("/sszg_code/server/inc/combat.hrl", 15).

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

-file("arena_elite_lib.erl", 59).

-file("/sszg_code/server/inc/guild.hrl", 1).

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

-file("arena_elite_lib.erl", 60).

-file("/sszg_code/server/inc/looks.hrl", 1).

-record(m_look, {use_id = 0, list = []}).

-file("arena_elite_lib.erl", 61).

-file("/sszg_code/server/inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("arena_elite_lib.erl", 62).

-file("/sszg_code/server/inc/gain.hrl", 1).

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

-file("arena_elite_lib.erl", 63).

-file("/sszg_code/server/inc/log.hrl", 1).

-file("arena_elite_lib.erl", 64).

-file("/sszg_code/server/inc/vip.hrl", 1).

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

-file("arena_elite_lib.erl", 65).

-file("/sszg_code/server/inc/trigger.hrl", 1).

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

-file("arena_elite_lib.erl", 66).

-file("/sszg_code/server/inc/replay_hall.hrl", 1).

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

-file("arena_elite_lib.erl", 67).

-file("/sszg_code/server/inc/var.hrl", 1).

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

-file("arena_elite_lib.erl", 68).

-file("/sszg_code/server/inc/sprite.hrl", 1).

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

-file("arena_elite_lib.erl", 69).

-file("/sszg_code/server/inc/guild_skill.hrl", 1).

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

-file("arena_elite_lib.erl", 70).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("arena_elite_lib.erl", 71).

gm_set_lev(Role = #role{m_arena_elite =
			    MA = #m_arena_elite{}},
	   Lev) ->
    Role#role{m_arena_elite = MA#m_arena_elite{lev = Lev}}.

gm_set_score(Role = #role{m_arena_elite =
			      MA = #m_arena_elite{}},
	     Score) ->
    Role#role{m_arena_elite =
		  MA#m_arena_elite{score = Score}}.

gm_del_rival_info(Role = #role{m_arena_elite =
				   MArenaElite}) ->
    Role#role{m_arena_elite =
		  MArenaElite#m_arena_elite{rival_info = []}}.

-spec init() -> #m_arena_elite{}.

init() ->
    #m_arena_elite{day_combat_count =
		       arena_elite_data:get_constant(match_count),
		   lev_reward = init_arward(1),
		   max_day_buy_count =
		       arena_elite_data:get_constant(buy_count)}.

-spec init_log() -> #m_arena_elite{}.

init_log() -> [#m_arena_elite_log{period = 0}].

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{m_arena_elite =
		       MArenaElite = #m_arena_elite{match_cd_time = EndTime,
						    rival_info =
							RivalInfos}}) ->
    put(arena_elite_is_match, 0),
    Now = date:unixtime(),
    case get_arena_elite_state() of
      {Ts, _TimeOut, open} ->
	  Time = max(trunc(Ts / 1000), EndTime),
	  AccTime1 = max(0, Now - Time),
	  AccTime =
	      min(arena_elite_data:get_constant(idle_time_limit),
		  AccTime1),
	  put(arena_elite_match_cd_time, AccTime),
	  ok;
      _ -> put(arena_elite_match_cd_time, 0)
    end,
    case RivalInfos of
      [_ | _] ->
	  put(arena_elite_is_in_combat, true),
	  case get(arena_elite_to_combat_time) of
	    CombatTime
		when is_integer(CombatTime) andalso CombatTime >= Now ->
		role:set_ms_timer(arena_elite_to_combat_timer,
				  max(1, CombatTime - Now) * 1000,
				  {arena_elite_lib, auto_combat, []});
	    _ ->
		role:set_ms_timer(arena_elite_to_combat_timer, 5000,
				  {arena_elite_lib, auto_combat, []})
	  end;
      _ -> ok
    end,
    case check_open(Role) of
      {false, _} -> ok;
      _ ->
	  PushRole = to_c_arena_role(Role),
	  arena_elite_mgr:info({new_period_update_arena_role,
				PushRole})
    end,
    NewRivalInfos = [{T, arena_elite_mirror:do_ver(R)}
		     || {T, R} <- RivalInfos],
    {ok,
     Role#role{m_arena_elite =
		   MArenaElite#m_arena_elite{rival_info = NewRivalInfos}}}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_arena_elite =
			    MArenaElite = #m_arena_elite{day_combat_count =
							     OldDayCombatCount,
							 day_buy_count =
							     OldDayBuyCount,
							 last_reset_time =
							     LastResetTime,
							 max_day_buy_count =
							     OldMaxDayBuyCount}}) ->
    Now = date:unixtime(),
    DayDiff = max(1,
		  util:if_true(LastResetTime == 0, 1,
			       date:day_diff(Now, LastResetTime))),
    MaxLimitCombatCount =
	arena_elite_data:get_constant(match_count) * 2,
    AddDayCombatCount = util:if_true(OldDayCombatCount >=
				       MaxLimitCombatCount,
				     0,
				     min(MaxLimitCombatCount -
					   OldDayCombatCount,
					 DayDiff *
					   arena_elite_data:get_constant(match_count))),
    NewDayCombatCount = OldDayCombatCount +
			  AddDayCombatCount,
    RestDayBuyCount = max(0,
			  OldMaxDayBuyCount - OldDayBuyCount),
    MaxLimitBuyCount =
	arena_elite_data:get_constant(buy_count) * 2,
    AddBuyCount = util:if_true(RestDayBuyCount >=
				 MaxLimitBuyCount,
			       0,
			       min(MaxLimitBuyCount - RestDayBuyCount,
				   DayDiff *
				     arena_elite_data:get_constant(buy_count))),
    NewMaxDayBuyCount = RestDayBuyCount + AddBuyCount,
    NewMArenaElite =
	MArenaElite#m_arena_elite{day_combat_count =
				      NewDayCombatCount,
				  day_buy_count = 0, frist_ref_time = 0,
				  ref_count = 0, match_cd_time = 0,
				  last_reset_time = Now,
				  max_day_buy_count = NewMaxDayBuyCount},
    NewRole = Role#role{m_arena_elite = NewMArenaElite},
    get_info(NewRole).

-spec push_combat_state(#role{}) -> {ok, #role{}}.

push_combat_state(Role) ->
    case get_arena_elite_state() of
      {Ts, TimeOut, State} ->
	  PushState = util:if_true(State == open, 1, 0),
	  sys_conn:pack_send(24905,
			     {PushState,
			      max(0,
				  (Ts + TimeOut - date:unixtime(ms)) div
				    1000)});
      _ -> ok
    end,
    {ok, Role}.

-spec save_is_skip(#role{}, Type :: integer()) -> {ok,
						   #role{}}.

save_is_skip(Role = #role{m_arena_elite = MA}, Type) ->
    case Type == 0 orelse Type == 1 of
      true ->
	  NewMA = MA#m_arena_elite{is_skip = Type},
	  {ok, Role#role{m_arena_elite = NewMA}};
      _ -> {ok, Role}
    end.

-spec get_info(#role{}) -> {ok, #role{}}.

get_info(Role = #role{id = RoleId,
		      m_arena_elite_war_order =
			  #m_arena_elite_war_order{rmb_status = RmbStatus},
		      m_arena_elite =
			  #m_arena_elite{lev = Lev, score = Score,
					 match_cd_time = MatchCdTime,
					 period = Period, lev_reward = Rewards,
					 day_combat_count = DayComCount,
					 day_buy_count = DayBuyCount,
					 promoted_info = PromotedInfo,
					 max_day_buy_count = MaxDayBuyCount,
					 is_skip = IsSkip}}) ->
    case check_open(Role) of
      {ok, StateName, Ts, TimeOut, Period} ->
	  IsKing = get_is_king(Role),
	  State = case StateName of
		    first_routine -> 1;
		    second_routine -> 2;
		    second_king -> 3;
		    _ -> 0
		  end,
	  NewRole = arena_elite_war_order:init_war_order(Role),
	  StartTime = sys_env:get(arena_elite_state_start_time,
				  0),
	  EndTime = StartTime +
		      86400 *
			(arena_elite_data:get_constant(first_routine) +
			   arena_elite_data:get_constant(second_routine)
			   + arena_elite_data:get_constant(second_king)),
	  ZoneId = arena_elite_mgr:get_zid(RoleId),
	  Rank = arena_elite_mgr:get_role_ranks(RoleId, ZoneId),
	  case StateName == idle of
	    true ->
		sys_conn:pack_send(24900,
				   {Lev, Score, DayComCount, DayBuyCount,
				    MatchCdTime, Rank, IsKing, PromotedInfo,
				    State, Period, 0, 0,
				    max(0,
					(Ts + TimeOut - date:unixtime(ms)) div
					  1000),
				    Rewards, ZoneId, MaxDayBuyCount, IsSkip,
				    RmbStatus});
	    _ ->
		sys_conn:pack_send(24900,
				   {Lev, Score, DayComCount, DayBuyCount,
				    MatchCdTime, Rank, IsKing, PromotedInfo,
				    State, Period, StartTime, EndTime,
				    max(0,
					(Ts + TimeOut - date:unixtime(ms)) div
					  1000),
				    Rewards, ZoneId, MaxDayBuyCount, IsSkip,
				    RmbStatus})
	  end,
	  {ok, NewRole};
      {ok, _StateName, _Ts, _TimeOut, NewPeriod} ->
	  NewRole = init_new_period(Role, NewPeriod),
	  NewRole1 =
	      arena_elite_war_order:init_war_order(NewRole),
	  PushRole = to_c_arena_role(NewRole),
	  arena_elite_mgr:info({new_period_update_arena_role,
				PushRole}),
	  role:redirect(self(), 24920, {1}),
	  role:redirect(self(), 24920, {2}),
	  get_info(NewRole1);
      {false, _Msg} -> {ok, Role}
    end.

get_is_king(R) ->
    case arena_elite_mgr:check_is_king(R) of
      true -> 1;
      _ -> 0
    end.

-spec get_rival_info(#role{}) -> {ok, #role{}}.

get_rival_info(#role{m_arena_elite =
			 #m_arena_elite{day_combat_count = DayCombatCount,
					match_cd_time = MatchCDTime,
					rival_info = RivalInfo}}) ->
    ToCombatTime = util:get(arena_elite_to_combat_time, 0),
    sys_conn:pack_send(24901,
		       {max(0, DayCombatCount), MatchCDTime, ToCombatTime,
			util:get(arena_elite_is_match, 0), RivalInfo}).

-spec match(#role{}) -> ok | {false, binary()}.

match(Role = #role{id = RoleId = {Rid, _},
		   pid = RolePId, arena_elite_power = ArenaElitePower,
		   arena_elite_max_star = AllStar,
		   m_arena_elite =
		       #m_arena_elite{last_combat_id = LastId, log = Log,
				      lev = Lev, score = Score}}) ->
    case check_can_match(Role) of
      {false, Msg} ->
	  notice:alert(Msg), get_rival_info(Role), ok;
      {ok, Period} ->
	  IsKing = get_is_king(Role),
	  PusScore = arena_elite_data:get_all_score(Lev) + Score,
	  put(arena_elite_is_match, 1),
	  WinRio = get_win_rio(Period, Log, IsKing),
	  MatchPowerT = PusScore *
			  arena_elite_data:get_constant(strength_var1)
			  +
			  ArenaElitePower *
			    arena_elite_data:get_constant(strength_var2)
			    * WinRio
			    *
			    min(AllStar,
				arena_elite_data:get_constant(strength_var4))
			    / arena_elite_data:get_constant(strength_var3),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_lib249, _,
	     {__Levelarena_elite_lib249, __Tracesarena_elite_lib249}}
		when __Levelarena_elite_lib249 band 128 /= 0 orelse
		       __Tracesarena_elite_lib249 /= [] ->
		lager:do_log(debug,
			     [{module, arena_elite_lib}, {function, match},
			      {line, 249}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("===玩家战力:~w",
					   [{MatchPowerT, IsKing, WinRio}]),
			     none, 4096, 128, __Levelarena_elite_lib249,
			     __Tracesarena_elite_lib249, lager_event,
			     __Pidarena_elite_lib249);
	    _ -> ok
	  end,
	  MinMatchPowerT = util:ceil(MatchPowerT *
				       9.7999999999999998e-1),
	  MaxMatchPowerT = util:ceil(MatchPowerT * 1.02),
	  MatchPower = util:rand(MinMatchPowerT, MaxMatchPowerT),
	  arena_elite_match_mgr:cast(Rid,
				     {RolePId, MatchPower, Lev, PusScore,
				      RoleId, IsKing, 1, LastId})
    end.

get_match_power(Period, Log, IsKing, PusScore,
		ArenaElitePower, AllStar) ->
    WinRio = get_win_rio(Period, Log, IsKing),
    PusScore * arena_elite_data:get_constant(strength_var1)
      +
      ArenaElitePower *
	arena_elite_data:get_constant(strength_var2)
	* WinRio
	*
	min(AllStar,
	    arena_elite_data:get_constant(strength_var4))
	/ arena_elite_data:get_constant(strength_var3).

get_win_rio(Period, Log, IsKing) ->
    LimitCount =
	arena_elite_data:get_constant(non_count_winrate_battle),
    InitRio =
	arena_elite_data:get_constant(initial_win_rate) *
	  1.0e-3,
    LastCount =
	arena_elite_data:get_constant(last_battle_num_select),
    case lists:keyfind(Period, #m_arena_elite_log.period,
		       Log)
	of
      #m_arena_elite_log{combat_all_count1 = AllCountT}
	  when IsKing == 0 andalso AllCountT =< LimitCount ->
	  InitRio;
      #m_arena_elite_log{combat_all_count2 = AllCountT}
	  when IsKing == 1 andalso AllCountT =< LimitCount ->
	  InitRio;
      #m_arena_elite_log{combat_all_count1 = AllCountT,
			 extra = Extra}
	  when IsKing == 0 ->
	  FiveResult = list_util:keyfind(1, Extra, []),
	  {FiveResults, _} = list_util:split(LastCount,
					     FiveResult),
	  WinCount = max(1,
			 length([Result
				 || Result <- FiveResults, Result == 1])),
	  WinCount / LastCount;
      #m_arena_elite_log{combat_all_count2 = AllCountT,
			 extra = Extra} ->
	  FiveResult = list_util:keyfind(2, Extra, []),
	  {FiveResults, _} = list_util:split(LastCount,
					     FiveResult),
	  WinCount = max(1,
			 length([Result
				 || Result <- FiveResults, Result == 1])),
	  WinCount / LastCount;
      _ -> InitRio
    end.

check_can_match(Role = #role{m_arena_elite =
				 #m_arena_elite{rival_info = [_ | _]}}) ->
    get_rival_info(Role),
    {false, lang:get(<<"已有对手"/utf8>>)};
check_can_match(Role = #role{m_arena_elite =
				 #m_arena_elite{match_cd_time = CdTime,
						day_combat_count =
						    DayCombatCount}}) ->
    IsMatch = util:get(arena_elite_is_match, 0),
    Type = case get_is_king(Role) of
	     1 -> 2;
	     _ -> 1
	   end,
    case get_formation_sys(Role, Type) of
      {ok, _, []} -> {false, lang:get(<<"未布阵，不能匹配"/utf8>>)};
      _ ->
	  case check_combat(Role) of
	    {false, Msg} -> {false, Msg};
	    _ when IsMatch == 1 ->
		{false, lang:get(<<"正在匹配中..."/utf8>>)};
	    {ok, Period} ->
		Now = date:unixtime(),
		case Now < CdTime of
		  true -> {false, lang:get(<<"匹配冷却时间未结束"/utf8>>)};
		  _ when DayCombatCount > 0 -> {ok, Period};
		  _ -> {false, lang:get(<<"匹配次数不足"/utf8>>)}
		end
	  end
    end.

match_over(Role = #role{pid = RolePId,
			id = RoleId = {Rid, _},
			arena_elite_power = ArenaElitePower,
			arena_elite_max_star = Star,
			m_arena_elite =
			    MArenaElite = #m_arena_elite{is_skip = IsSkip,
							 last_combat_id =
							     LastId,
							 log = Log,
							 period = Period,
							 match_cd_time =
							     OldCdTimeT,
							 day_combat_count =
							     DayCount,
							 lev = Lev,
							 score = Score,
							 ref_count = RefCount}},
	   {TarRoleId, TarPower, TarScore, TarLev, AvatarId}) ->
    IsKing = get_is_king(Role),
    case to_arena_role(TarRoleId, IsKing) of
      ArenaRoleT = #arena_elite_role{} ->
	  ArenaRole = ArenaRoleT#arena_elite_role{score =
						      TarScore,
						  elite_lev = TarLev,
						  look_id = AvatarId,
						  power = TarPower},
	  NewRefCount = RefCount + 1,
	  Now = date:unixtime(),
	  {Ts, _TimeOut, _} = get_arena_elite_state(),
	  OldCdTime = max(trunc(Ts / 1000), OldCdTimeT),
	  AccTime =
	      min(arena_elite_data:get_constant(idle_time_limit),
		  max(0,
		      util:get(arena_elite_match_cd_time, 0) + Now -
			OldCdTime)),
	  CdTime = arena_elite_data:get_cd_time(NewRefCount),
	  NewAccTime = max(0, AccTime - CdTime),
	  put(arena_elite_match_cd_time, NewAccTime),
	  RefCdTime = Now + max(0, CdTime - AccTime),
	  NewMArenaElite = MArenaElite#m_arena_elite{ref_count =
							 NewRefCount,
						     last_combat_id = TarRoleId,
						     day_combat_count =
							 DayCount - 1,
						     match_cd_time = RefCdTime,
						     rival_info =
							 [{Now + 86400,
							   ArenaRole}]},
	  NewRole = Role#role{m_arena_elite = NewMArenaElite},
	  AfterTime = util:if_true(IsSkip == 1,
				   arena_elite_data:get_constant(skip_after_time),
				   arena_elite_data:get_constant(no_skip_after_time)),
	  put(arena_elite_is_match, 0),
	  put(arena_elite_to_combat_time, Now + AfterTime),
	  put(arena_elite_is_in_combat, true),
	  role:set_ms_timer(arena_elite_to_combat_timer,
			    AfterTime * 1000,
			    {arena_elite_lib, auto_combat, []}),
	  get_rival_info(NewRole),
	  case IsKing == 1 of
	    true ->
		log:save(join,
			 {NewRole, <<"功能玩法"/utf8>>, <<"段位赛-王者赛"/utf8>>});
	    _ ->
		log:save(join,
			 {NewRole, <<"功能玩法"/utf8>>, <<"段位赛-常规赛"/utf8>>})
	  end,
	  {ok, NewRole};
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_lib358, _,
	     {__Levelarena_elite_lib358, __Tracesarena_elite_lib358}}
		when __Levelarena_elite_lib358 band 8 /= 0 orelse
		       __Tracesarena_elite_lib358 /= [] ->
		lager:do_log(error,
			     [{module, arena_elite_lib}, {function, match_over},
			      {line, 358}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~ts找不到机器人数据~w err=~w",
					   [Role#role.name, TarRoleId, _Err]),
			     none, 4096, 8, __Levelarena_elite_lib358,
			     __Tracesarena_elite_lib358, lager_event,
			     __Pidarena_elite_lib358);
	    _ -> ok
	  end,
	  PusScore = arena_elite_data:get_all_score(Lev) + Score,
	  MatchPower = get_match_power(Period, Log, IsKing,
				       PusScore, ArenaElitePower, Star),
	  arena_elite_match_mgr:cast(Rid,
				     {arena_elite, RolePId, MatchPower, Lev,
				      PusScore, RoleId, IsKing, 1, LastId}),
	  {ok, Role}
    end;
match_over(Role = #role{pid = RolePId,
			id = RoleId = {Rid, _},
			arena_elite_power = ArenaElitePower,
			arena_elite_max_star = Star,
			m_arena_elite =
			    #m_arena_elite{last_combat_id = LastId, log = Log,
					   period = Period, lev = Lev,
					   score = Score}},
	   false) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_lib366, _,
       {__Levelarena_elite_lib366, __Tracesarena_elite_lib366}}
	  when __Levelarena_elite_lib366 band 8 /= 0 orelse
		 __Tracesarena_elite_lib366 /= [] ->
	  lager:do_log(error,
		       [{module, arena_elite_lib}, {function, match_over},
			{line, 366}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts找不到对手 在本服重新匹配", [Role#role.name]),
		       none, 4096, 8, __Levelarena_elite_lib366,
		       __Tracesarena_elite_lib366, lager_event,
		       __Pidarena_elite_lib366);
      _ -> ok
    end,
    IsKing = get_is_king(Role),
    PusScore = arena_elite_data:get_all_score(Lev) + Score,
    MatchPower = get_match_power(Period, Log, IsKing,
				 PusScore, ArenaElitePower, Star),
    arena_elite_match_mgr:cast(Rid,
			       {arena_elite, RolePId, MatchPower, Lev, PusScore,
				RoleId, IsKing, 1, LastId}),
    {ok, Role};
match_over(Role, _) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_lib373, _,
       {__Levelarena_elite_lib373, __Tracesarena_elite_lib373}}
	  when __Levelarena_elite_lib373 band 8 /= 0 orelse
		 __Tracesarena_elite_lib373 /= [] ->
	  lager:do_log(error,
		       [{module, arena_elite_lib}, {function, match_over},
			{line, 373}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts找不到对手", [Role#role.name]), none, 4096,
		       8, __Levelarena_elite_lib373,
		       __Tracesarena_elite_lib373, lager_event,
		       __Pidarena_elite_lib373);
      _ -> ok
    end,
    notice:alert(lang:get(<<"找不到对手"/utf8>>)),
    put(arena_elite_is_match, 0),
    get_rival_info(Role),
    {ok, Role}.

to_arena_role(R = #role_robot{face_update_time =
				  FaceUpdateTime,
			      face_file = FaceFile,
			      m_sprite_tree =
				  #m_sprite_tree{all_attr = SpriteAttr,
						 break_lev = SpriteBreak},
			      partners = PList,
			      arena_elite_manifesto = Manifesto,
			      m_guild_skill =
				  #m_guild_skill{break_groups = BreakGroup}},
	      IsKing) ->
    SpriteFormationType = util:if_true(IsKing == 1, 99, 93),
    {_, _, NormalDefens} = get_formation_sys(R, 1),
    {_, _, KingDefens} = get_formation_sys(R, 2),
    Fun = fun ({Order, FormationType, PosInfo, HallowsId},
	       Acc) ->
		  case [P
			|| P <- PosInfo,
			   lists:keymember(P#formation_pos.id, #partner.id,
					   PList)]
		      of
		    [] -> Acc;
		    NewPosInfo ->
			{SpriteLev, Sprites} = sprite_tree:get_sprite_lev(R,
									  SpriteFormationType,
									  Order),
			DefenseT = [to_arena_elite_partner(Pos,
							   lists:keyfind(PartnerId,
									 #partner.id,
									 PList))
				    || #formation_pos{pos = Pos, id = PartnerId}
					   <- NewPosInfo],
			{HallowsId, HallowsLev, HallowsSkillLev, HallowsLookId,
			 HallowsLookIds, HallowsLucky, HallowsSeal} =
			    hallows_lib:get_hallows_info2(R, HallowsId),
			HallowRefine = hallows_lib:get_hallows_refine(R,
								      HallowsId),
			Extra = [{1, HallowRefine},
				 {2,
				  {SpriteLev, SpriteBreak, SpriteAttr,
				   Sprites}}],
			Type = #arena_elite_rival_defense{order = Order,
							  formation_type =
							      FormationType,
							  hallows_id =
							      HallowsId,
							  hallows_lev =
							      HallowsLev,
							  hallows_skill_lev =
							      HallowsSkillLev,
							  partner_infos =
							      DefenseT,
							  hallows_look_id =
							      HallowsLookId,
							  hallows_all_look_ids =
							      HallowsLookIds,
							  hallows_lucky =
							      HallowsLucky,
							  hallows_seal =
							      HallowsSeal,
							  extra = Extra},
			[Type | Acc]
		  end
	  end,
    NormalDefens2 = lists:foldl(Fun, [], NormalDefens),
    KingDefens2 = lists:foldl(Fun, [], KingDefens),
    if NormalDefens2 == [], IsKing == 0 ->
	   {false, lang:get(<<"没有该对手阵法数据"/utf8>>)};
       KingDefens2 == [], IsKing == 1 ->
	   {false, lang:get(<<"没有该对手阵法数据1"/utf8>>)};
       true ->
	   {NormalDefens3, KingDefens3} = if NormalDefens2 == [],
					     KingDefens2 =/= [] ->
						 [F | _] = KingDefens2,
						 {[F#arena_elite_rival_defense{order
										   =
										   1}],
						  KingDefens2};
					     NormalDefens2 =/= [],
					     KingDefens2 == [] ->
						 {NormalDefens2, NormalDefens2};
					     true ->
						 {NormalDefens2, KingDefens2}
					  end,
	   Defense = [{1, NormalDefens3}, {2, KingDefens3}],
	   #arena_elite_role{id = R#role_robot.id,
			     name = R#role_robot.name, lev = R#role_robot.lev,
			     sex = R#role_robot.sex, gid = R#role_robot.gid,
			     gname = R#role_robot.gname,
			     face = R#role_robot.face_id,
			     face_update_time = FaceUpdateTime,
			     face_file = FaceFile, break_groups = BreakGroup,
			     defense = Defense, manifesto = Manifesto}
    end;
to_arena_role(TarRoleId, IsKing) ->
    case cluster_lib:call(element(2, TarRoleId),
			  arena_elite_mirror, get_mirror, [TarRoleId])
	of
      R = #arena_elite_role{defense = Defense} ->
	  NormalDefens = list_util:keyfind(1, Defense, []),
	  KingDefens = list_util:keyfind(2, Defense, []),
	  {NormalDefens2, KingDefens2} = if NormalDefens == [],
					    KingDefens =/= [] ->
						[F | _] = KingDefens,
						{[F#arena_elite_rival_defense{order
										  =
										  1}],
						 KingDefens};
					    NormalDefens =/= [],
					    KingDefens == [] ->
						{NormalDefens, NormalDefens};
					    true -> {NormalDefens, KingDefens}
					 end,
	  Defense2 = [{1, NormalDefens2}, {2, KingDefens2}],
	  R#arena_elite_role{defense = Defense2};
      _ ->
	  case role_robot:get_role(TarRoleId) of
	    {ok, Robot} -> to_arena_role(Robot, IsKing);
	    _Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_elite_lib464, _,
		   {__Levelarena_elite_lib464, __Tracesarena_elite_lib464}}
		      when __Levelarena_elite_lib464 band 8 /= 0 orelse
			     __Tracesarena_elite_lib464 /= [] ->
		      lager:do_log(error,
				   [{module, arena_elite_lib},
				    {function, to_arena_role}, {line, 464},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("找不到机器人数据~w err=~w",
						 [TarRoleId, _Err]),
				   none, 4096, 8, __Levelarena_elite_lib464,
				   __Tracesarena_elite_lib464, lager_event,
				   __Pidarena_elite_lib464);
		  _ -> ok
		end,
		{false, lang:get(<<"找不到该对手"/utf8>>)}
	  end
    end.

to_arena_elite_partner(Pos,
		       P = #partner{all_attr = Attr, set_skills = SetSkills,
				    resonate_lev = ResonateLev}) ->
    #arena_partners_info{pos = Pos, id = P#partner.id,
			 bid = P#partner.bid, lev = P#partner.lev,
			 star = P#partner.star, break_lev = P#partner.break_lev,
			 power = P#partner.power, attr = Attr,
			 set_skill = SetSkills,
			 extra = [{5, P#partner.use_skin}, {11, ResonateLev}]}.

-spec auto_combat(#role{}) -> {ok, #role{}}.

auto_combat(Role) ->
    case combat_lib:combat_pid(Role, 23) of
      {_CombatType, _CombatPid} ->
	  notice:alert(lang:get(<<"已在战斗中"/utf8>>)), ok;
      false ->
	  case get(arena_elite_is_in_combat) of
	    true ->
		case combat(Role) of
		  {false, Msg} -> notice:alert(Msg), ok;
		  {ok, NRole} ->
		      erase(arena_elite_is_in_combat),
		      role:unset_timer(arena_elite_to_combat_timer),
		      {ok, NRole}
		end;
	    _ -> notice:alert(lang:get(<<"不能重复进战斗"/utf8>>)), ok
	  end;
      _ -> ok
    end.

do_combat2(Role) ->
    case erase(arena_elite_do_combat_timer) of
      undefined -> skip;
      Timer -> erlang:cancel_timer(Timer)
    end,
    case erase(arena_elite_do_combat_arge) of
      {CombatType, Type, Round, ARound, BRound, MaxPower,
       TarScore, AStatInfo, BStatInfo} ->
	  case do_combat(Role, CombatType, Type, Round, ARound,
			 BRound, MaxPower, TarScore, AStatInfo, BStatInfo)
	      of
	    {ok, NRole} -> {ok, NRole};
	    _ERR ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_elite_lib520, _,
		   {__Levelarena_elite_lib520, __Tracesarena_elite_lib520}}
		      when __Levelarena_elite_lib520 band 8 /= 0 orelse
			     __Tracesarena_elite_lib520 /= [] ->
		      lager:do_log(error,
				   [{module, arena_elite_lib},
				    {function, do_combat2}, {line, 520},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]进战斗失败~w",
						 [Role#role.name, _ERR]),
				   none, 4096, 8, __Levelarena_elite_lib520,
				   __Tracesarena_elite_lib520, lager_event,
				   __Pidarena_elite_lib520);
		  _ -> ok
		end,
		ok
	  end;
      _Err -> ok
    end.

-spec combat(#role{}) -> {ok, #role{}} |
			 {false, binary()}.

combat(#role{m_arena_elite =
		 #m_arena_elite{rival_info = []}}) ->
    {false, lang:get(<<"未匹配到对手"/utf8>>)};
combat(Role = #role{arena_elite_power = MaxPower,
		    m_arena_elite =
			#m_arena_elite{rival_info =
					   [{_,
					     #arena_elite_role{score =
								   TarScore}}]}}) ->
    case check_combat(Role) of
      {false, Msg} -> {false, Msg};
      _ ->
	  IsKing = get_is_king(Role),
	  CombatType = util:if_true(IsKing == 1, 24, 23),
	  Type = util:if_true(IsKing == 1, 2, 1),
	  Round = 1,
	  do_combat(Role, CombatType, Type, Round, Round, Round,
		    MaxPower, TarScore, [], [])
    end.

do_combat(Role, CombatType, _Type, Round, _ARound,
	  _BRound, MaxPower, TarScore, _AStatInfo, _BStatInfo)
    when Round > 3 ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_lib543, _,
       {__Levelarena_elite_lib543, __Tracesarena_elite_lib543}}
	  when __Levelarena_elite_lib543 band 128 /= 0 orelse
		 __Tracesarena_elite_lib543 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_elite_lib}, {function, do_combat},
			{line, 543}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("do_combat==~ts====~w",
				     [Role#role.name, Round]),
		       none, 4096, 128, __Levelarena_elite_lib543,
		       __Tracesarena_elite_lib543, lager_event,
		       __Pidarena_elite_lib543);
      _ -> ok
    end,
    do_combat_over(Role, CombatType, TarScore, MaxPower);
do_combat(RoleT = #role{combat_type_list =
			    CombatTypeList,
			m_arena_elite =
			    #m_arena_elite{lev = ArenaLev,
					   rival_info =
					       [{_,
						 ArenaRole =
						     #arena_elite_role{id =
									   TarId,
								       manifesto
									   =
									   Manifesto,
								       power =
									   TarPower,
								       name =
									   TarName}}]}},
	  CombatType, Type, Round, ARound, BRound, MaxPower,
	  TarScore, AStatInfo, BStatInfo) ->
    Role = util:if_true(Round == 1, RoleT,
			RoleT#role{combat_pid = 0,
				   combat_type_list =
				       lists:keydelete(CombatType, 1,
						       CombatTypeList)}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_lib548, _,
       {__Levelarena_elite_lib548, __Tracesarena_elite_lib548}}
	  when __Levelarena_elite_lib548 band 128 /= 0 orelse
		 __Tracesarena_elite_lib548 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_elite_lib}, {function, do_combat},
			{line, 548}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("do_combat==~ts====~w ~w",
				     [Role#role.name, Round, CombatType]),
		       none, 4096, 128, __Levelarena_elite_lib548,
		       __Tracesarena_elite_lib548, lager_event,
		       __Pidarena_elite_lib548);
      _ -> ok
    end,
    {_, _, AtkLists} = get_formation_sys(Role, Type),
    {FormationType, AtkGroup0} = case lists:keyfind(ARound,
						    1, AtkLists)
				     of
				   {ARound, FormationTypeT, PosInfo,
				    HallowsId} ->
				       FightPos =
					   formation_lib:gen_fight_pos(PosInfo,
								       FormationTypeT),
				       AtkGroup0T =
					   combat_lib:gen_fight_objects(Role,
									FightPos),
				       {FormationTypeT,
					hallows_lib:gen_fight_object(Role,
								     HallowsId)
					  ++ [FO || FO <- AtkGroup0T]};
				   _ -> {1, []}
				 end,
    APartnerHp = merge_partner_hp(AStatInfo, []),
    AtkGroup = combat_lib:init_fight_object_hp(AtkGroup0,
					       APartnerHp),
    {BFormationType, DefendList0, SpriteLev, Sprites} =
	to_fight_defends(Role, ArenaRole, Type, BRound),
    BPartnerHp = merge_partner_hp(BStatInfo, []),
    DefendList =
	combat_lib:init_fight_object_hp(DefendList0,
					BPartnerHp),
    {WinCount, LoseCount} = util:get(arena_elite_win_count,
				     {0, 0}),
    SpriteFormationType = util:if_true(CombatType == 23, 93,
				       99),
    {MySpriteLev, MySprites} =
	sprite_tree:get_sprite_lev(Role, SpriteFormationType,
				   ARound),
    case DefendList == [] of
      true when CombatType == 23 ->
	  {false, lang:get(<<"没有布阵, 无法战斗1"/utf8>>)};
      true ->
	  put(arena_elite_win_count, {WinCount + 1, LoseCount}),
	  case WinCount >= 1 of
	    true ->
		do_combat_over(Role, CombatType, TarScore, MaxPower);
	    _ ->
		do_combat(Role, CombatType, Type, Round + 1, ARound,
			  BRound + 1, MaxPower, TarScore, AStatInfo, [])
	  end;
      _ ->
	  case AtkGroup == [] of
	    true when CombatType == 23 ->
		{false, lang:get(<<"没有布阵, 无法战斗"/utf8>>)};
	    true ->
		put(arena_elite_win_count, {WinCount, LoseCount + 1}),
		case LoseCount >= 1 of
		  true ->
		      do_combat_over(Role, CombatType, TarScore, MaxPower);
		  _ ->
		      do_combat(Role, CombatType, Type, Round + 1, ARound + 1,
				BRound, MaxPower, TarScore, [], BStatInfo)
		end;
	    _ ->
		AManifesto1 =
		    arena_elite_manifesto:get_manifesto_id(Role, 1),
		BManifesto1 =
		    arena_elite_manifesto:get_manifesto_id(Manifesto, 1),
		AManifesto2 =
		    arena_elite_manifesto:get_manifesto_id(Role, 2),
		BManifesto2 =
		    arena_elite_manifesto:get_manifesto_id(Manifesto, 2),
		AManifesto3 =
		    arena_elite_manifesto:get_manifesto_id(Role, 3),
		BManifesto3 =
		    arena_elite_manifesto:get_manifesto_id(Manifesto, 3),
		{ok, CRole0} = role_convert:do(combat_role, Role),
		CRole = CRole0#combat_role{conn_pid = 0, group = 1,
					   is_auto = true, is_offline = true,
					   auto_watch_model = 1, watching = 0},
		ReplayInfo0 = replay_hall:convert(#replay_info{}, a,
						  Role,
						  #{formation_type =>
							FormationType,
						    type => SpriteFormationType,
						    round => ARound}),
		ReplayInfo = replay_hall:convert(ReplayInfo0, b,
						 ArenaRole,
						 #{formation_type =>
						       BFormationType,
						   sprite_lev => SpriteLev,
						   sprites => Sprites}),
		ArenaEliteSprite = [{2, MySpriteLev}, {3, MySprites},
				    {4, SpriteLev}, {5, Sprites}],
		AtkGroup1 = combat_attr:calc(AtkGroup, CombatType,
					     Role),
		DefendList1 = combat_attr:calc(DefendList, CombatType,
					       ArenaRole),
		AtkAddPower = lists:sum([AddPower
					 || #fight_object{guild_break_power =
							      AddPower}
						<- AtkGroup1]),
		DefendAddPower = lists:sum([AddPower
					    || #fight_object{guild_break_power =
								 AddPower}
						   <- DefendList1]),
		Args = #{on_role_combat_end =>
			     {arena_elite_lib, combat_over,
			      [{CombatType, Type, Round, ARound, BRound,
				TarScore, TarPower, MaxPower, FormationType,
				BFormationType, TarId, ArenaEliteSprite,
				AtkAddPower, DefendAddPower}]},
			 ext_args =>
			     [{cli_ext_args,
			       [Round, WinCount, LoseCount, AManifesto1,
				BManifesto1, AManifesto2, BManifesto2,
				AManifesto3, BManifesto3]},
			      {is_show_panel, false}],
			 formation =>
			     [{1, FormationType, 0}, {2, BFormationType, 0}],
			 target_role_name => TarName, combat_role => CRole,
			 replay_info => ReplayInfo},
		SpriteObj = sprite_tree:gen_fight_object_type(Role,
							      SpriteFormationType,
							      ARound),
		put(is_multiple_combat, 1),
		case combat_lib:start_combat(Role, CombatType,
					     SpriteObj ++ AtkGroup1,
					     [DefendList1], Args)
		    of
		  {ok, _CombatPid} ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidarena_elite_lib626, _,
			 {__Levelarena_elite_lib626,
			  __Tracesarena_elite_lib626}}
			    when __Levelarena_elite_lib626 band 128 /= 0 orelse
				   __Tracesarena_elite_lib626 /= [] ->
			    lager:do_log(debug,
					 [{module, arena_elite_lib},
					  {function, do_combat}, {line, 626},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("do_combat==~ts====~w ~w",
						       [Role#role.name, Round,
							CombatType]),
					 none, 4096, 128,
					 __Levelarena_elite_lib626,
					 __Tracesarena_elite_lib626,
					 lager_event, __Pidarena_elite_lib626);
			_ -> ok
		      end,
		      sys_conn:pack_send(10957, {}),
		      case Round == 1 of
			true ->
			    log:save(task,
				     {Role, 0, ArenaLev,
				      integer_to_binary(ArenaLev), 92,
				      <<"跨服段位赛"/utf8>>, <<"战斗开始"/utf8>>});
			_ -> skip
		      end,
		      {ok, Role};
		  {false, Err} ->
		      case Round == 1 of
			true ->
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
			      {__Pidarena_elite_lib638, _,
			       {__Levelarena_elite_lib638,
				__Tracesarena_elite_lib638}}
				  when __Levelarena_elite_lib638 band 8 /= 0
					 orelse
					 __Tracesarena_elite_lib638 /= [] ->
				  lager:do_log(error,
					       [{module, arena_elite_lib},
						{function, do_combat},
						{line, 638},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("do_combat==~ts====~w ~w ~w",
							     [Role#role.name,
							      Round, CombatType,
							      Err]),
					       none, 4096, 8,
					       __Levelarena_elite_lib638,
					       __Tracesarena_elite_lib638,
					       lager_event,
					       __Pidarena_elite_lib638);
			      _ -> ok
			    end,
			    erase(is_multiple_combat),
			    {false, Err};
			_ ->
			    do_combat(Role, CombatType, Type, Round + 1,
				      ARound + 1, BRound + 1, MaxPower,
				      TarScore, [], [])
		      end
		end
	  end
    end.

merge_partner_hp([], PList) -> PList;
merge_partner_hp([#{object_id := PId, hp := Hp,
		    hp_max := HpMax}
		  | T],
		 PList) ->
    merge_partner_hp(T,
		     lists:keystore(PId, 1, PList,
				    {PId, util:ceil(Hp * 100 / HpMax)})).

to_fight_defends(Role,
		 #arena_elite_role{id = RoleId, lev = Rolelev,
				   name = Name, defense = Defense,
				   break_groups = BreakGroups},
		 Type, Round) ->
    {_, List} = case lists:keyfind(Type, 1, Defense) of
		  {Type, []} ->
		      OType = util:if_true(Type == 1, 2, 1),
		      case lists:keyfind(OType, 1, Defense) of
			{_, [F | _]} ->
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
			      {__Pidarena_elite_lib661, _,
			       {__Levelarena_elite_lib661,
				__Tracesarena_elite_lib661}}
				  when __Levelarena_elite_lib661 band 8 /= 0
					 orelse
					 __Tracesarena_elite_lib661 /= [] ->
				  lager:do_log(error,
					       [{module, arena_elite_lib},
						{function, to_fight_defends},
						{line, 661},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("玩家~ts ~w阵容为空，获取~w阵容",
							     [Name, Type,
							      OType]),
					       none, 4096, 8,
					       __Levelarena_elite_lib661,
					       __Tracesarena_elite_lib661,
					       lager_event,
					       __Pidarena_elite_lib661);
			      _ -> ok
			    end,
			    {Type, [F#arena_elite_rival_defense{order = 1}]};
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
			      {__Pidarena_elite_lib664, _,
			       {__Levelarena_elite_lib664,
				__Tracesarena_elite_lib664}}
				  when __Levelarena_elite_lib664 band 8 /= 0
					 orelse
					 __Tracesarena_elite_lib664 /= [] ->
				  lager:do_log(error,
					       [{module, arena_elite_lib},
						{function, to_fight_defends},
						{line, 664},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("玩家~ts常规赛王者赛阵容均为空",
							     [Name]),
					       none, 4096, 8,
					       __Levelarena_elite_lib664,
					       __Tracesarena_elite_lib664,
					       lager_event,
					       __Pidarena_elite_lib664);
			      _ -> ok
			    end,
			    {Type, []}
		      end;
		  {Type, LTemp} -> {Type, LTemp};
		  _ -> {Type, []}
		end,
    case lists:keyfind(Round,
		       #arena_elite_rival_defense.order, List)
	of
      #arena_elite_rival_defense{hallows_id = HallowsId,
				 hallows_lev = HallowsLev,
				 hallows_skill_lev = HallowsSkillLev,
				 formation_type = FormationType,
				 partner_infos = PartnerDefense,
				 hallows_look_id = HallowsLookId,
				 hallows_lucky = HallowsLucky,
				 hallows_seal = HallowsSeal,
				 hallows_all_look_ids = AllLooksIds,
				 extra = Extra} ->
	  HallowsRefine = list_util:keyfind(1, Extra, 0),
	  {SpriteLev, _SpriteBreak, SpriteAttr, Sprites} =
	      list_util:keyfind(2, Extra, {0, 0, undefined, []}),
	  {FormationType,
	   sprite_tree:gen_fight_object(Rolelev, SpriteLev,
					SpriteAttr, Sprites)
	     ++
	     hallows_lib:gen_def_fight_object(HallowsId, HallowsLev,
					      HallowsSkillLev, HallowsLookId,
					      AllLooksIds, HallowsLucky,
					      HallowsSeal, HallowsRefine)
	       ++
	       [gen_def_fight_objects_(PartnerInfo, FormationType,
				       RoleId, Role)
		|| PartnerInfo <- PartnerDefense],
	   SpriteLev, Sprites};
      _ -> {1, [], 0, []}
    end.

gen_def_fight_objects_(#arena_partners_info{pos = Pos,
					    id = Id, bid = Bid, lev = Lev,
					    star = Star, break_lev = BreakLev,
					    dower_skill = DowerSkill,
					    power = Power, attr = Attr,
					    set_skill = SetSkill,
					    extra = Extra},
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
		   set_skills = SetSkill,
		   use_skin = list_util:keyfind(5, Extra, 0),
		   resonate_lev = list_util:keyfind(11, Extra, 0)},
    FO1 = partner_lib:gen_fight_object(RoleId, 0, P1,
				       combat_lib:is_leader(Pos), RoleId, 1),
    FO1#fight_object{pos = Pos1}.

to_round_log(#role{id = RoleId}, CombatResult, ARound,
	     BRound, TarId, FormationType, BFormationType,
	     HurtStatistics, ArenaEliteSprite, AtkAddPower,
	     DefendAddPower) ->
    to_round_log(RoleId, CombatResult, ARound, BRound,
		 TarId, FormationType, BFormationType, HurtStatistics,
		 ArenaEliteSprite, AtkAddPower, DefendAddPower);
to_round_log(RoleId,
	     #combat_result{action_count = ActionCount,
			    replay_id = ReplayId, a_stat_info = AStatInfo,
			    b_stat_info = BStatInfo, result = ResultT},
	     ARound, BRound, TarId, FormationType, BFormationType,
	     HurtStatistics, ArenaEliteSprite, AtkAddPower,
	     DefendAddPower) ->
    {APower, APlist, AEndHp} = to_p_list(AStatInfo),
    {BPower, BPlist, BEndHp} = to_p_list(BStatInfo),
    combat_replay_mgr:acc_replay_reference(ReplayId),
    Ext = [{1, HurtStatistics} | ArenaEliteSprite] ++
	    [{6, AtkAddPower}, {7, DefendAddPower}],
    #arena_replay_info{id = ReplayId, round = ActionCount,
		       ret = ResultT, time = date:unixtime(), a_id = RoleId,
		       a_power = APower, a_formation_type = FormationType,
		       a_order = ARound, a_end_hp = AEndHp, b_id = TarId,
		       b_power = BPower, b_formation_type = BFormationType,
		       b_order = BRound, b_end_hp = BEndHp, a_plist = APlist,
		       b_plist = BPlist, ext = Ext}.

to_p_list(StatInfo) ->
    Fun = fun (#{pos := Pos, extra_data := ExtraData,
		 star := Star, power := Power, lev := Lev,
		 object_bid := ObjectBid, hp := Hp, hp_max := HpMax},
	       {Acc1, Acc2, Acc3, Acc4}) ->
		  ReplayP = #arena_replay_partner{pos =
						      combat_target:logic_pos(Pos),
						  bid = ObjectBid, lev = Lev,
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

to_combat_log(Role = #role{id = Id, name = Name,
			   face_id = FaceId, lev = Lev,
			   m_arena_elite =
			       #m_arena_elite{lev = EliteLev,
					      rival_info =
						  [{_,
						    #arena_elite_role{face_update_time
									  =
									  DefFaceUpdateTime,
								      face_file
									  =
									  DefFaceFile,
								      id = Id2,
								      name =
									  Name2,
								      face =
									  FaceId2,
								      elite_lev
									  =
									  EliteLev2,
								      lev =
									  Lev2}}]}},
	      ReplayList, CombatType, Ret, WinCount, LoseCount) ->
    {_, AtkFaceFile, AtkFaceUpdateTime} =
	role_face:face_info(Role),
    #arena_elite_log{atk_id = Id, atk_name = Name,
		     atk_face = FaceId, atk_lev = Lev,
		     atk_elite_lev = EliteLev, def_id = Id2,
		     def_name = Name2, def_face = FaceId2, def_lev = Lev2,
		     def_elite_lev = EliteLev2, ret = Ret,
		     win_count = WinCount, lose_count = LoseCount,
		     combat_type = CombatType, replay_list = ReplayList,
		     time = date:unixtime(),
		     atk_face_update_time = AtkFaceUpdateTime,
		     atk_face_file = AtkFaceFile,
		     def_face_update_time = DefFaceUpdateTime,
		     def_face_file = DefFaceFile}.

-spec combat_over(#role{}, #combat_result{}, #combat{},
		  tuple()) -> {ok, #role{}}.

combat_over(Role = #role{ui_combat_type = UiCombatType},
	    CombatResult = #combat_result{replay_id = ReplayId,
					  hurt_statistics = HurtStatistics,
					  a_stat_info = AStatInfo,
					  b_stat_info = BStatInfo,
					  result = ResultT},
	    _Combat,
	    {24, Type, Round, ARound, BRound, TarScore, _TarPower,
	     MaxPower, FormationType, BFormationType, TarId,
	     ArenaEliteSprite, AtkAddPower, DefendAddPower}) ->
    put(arena_elite_hurt_statistics,
	[{Round, ARound, BRound, HurtStatistics, ReplayId}
	 | util:get(arena_elite_hurt_statistics, [])]),
    {MvpBid, _MvpHurt, TotalHurt} = calc_mvp(AStatInfo, 0,
					     0, 0),
    put(arena_elite_total_hurt,
	max(TotalHurt, util:get(arena_elite_total_hurt, 0))),
    put(arena_elite_mvp_bid,
	[MvpBid | util:get(arena_elite_mvp_bid, [])]),
    {OldWinCount, OldLose} = util:get(arena_elite_win_count,
				      {0, 0}),
    {WinCount, Lose} = case ResultT == 1 of
			 true ->
			     put(arena_elite_win_count,
				 {OldWinCount + 1, OldLose}),
			     {OldWinCount + 1, OldLose};
			 _ ->
			     put(arena_elite_win_count,
				 {OldWinCount, OldLose + 1}),
			     {OldWinCount, OldLose + 1}
		       end,
    OldRoundLog = util:get(arena_elite_round_log, []),
    RoundLog = to_round_log(Role, CombatResult, ARound,
			    BRound, TarId, FormationType, BFormationType,
			    HurtStatistics, ArenaEliteSprite, AtkAddPower,
			    DefendAddPower),
    put(arena_elite_round_log,
	[{Round, RoundLog} | OldRoundLog]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_lib807, _,
       {__Levelarena_elite_lib807, __Tracesarena_elite_lib807}}
	  when __Levelarena_elite_lib807 band 128 /= 0 orelse
		 __Tracesarena_elite_lib807 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_elite_lib}, {function, combat_over},
			{line, 807}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("==精英赛战斗结束,胜场:~w, 败场:~w",
				     [WinCount, Lose]),
		       none, 4096, 128, __Levelarena_elite_lib807,
		       __Tracesarena_elite_lib807, lager_event,
		       __Pidarena_elite_lib807);
      _ -> ok
    end,
    if WinCount >= 2 orelse Lose >= 2 ->
	   do_combat_over(Role, 24, TarScore, MaxPower);
       ResultT == 1 ->
	   case UiCombatType == 23 of
	     true ->
		 put(arena_elite_do_combat_arge,
		     {24, Type, Round + 1, ARound, BRound + 1, MaxPower,
		      TarScore, AStatInfo, []}),
		 put(arena_elite_do_combat_timer,
		     erlang:send_after(1000 * 2, self(),
				       {apply_async,
					{arena_elite_lib, do_combat2, []}})),
		 ok;
	     _ ->
		 do_combat(Role, 24, Type, Round + 1, ARound, BRound + 1,
			   MaxPower, TarScore, AStatInfo, [])
	   end;
       true ->
	   case UiCombatType == 23 of
	     true ->
		 put(arena_elite_do_combat_arge,
		     {24, Type, Round + 1, ARound + 1, BRound, MaxPower,
		      TarScore, [], BStatInfo}),
		 put(arena_elite_do_combat_timer,
		     erlang:send_after(1000 * 2, self(),
				       {apply_async,
					{arena_elite_lib, do_combat2, []}})),
		 ok;
	     _ ->
		 do_combat(Role, 24, Type, Round + 1, ARound + 1, BRound,
			   MaxPower, TarScore, [], BStatInfo)
	   end
    end;
combat_over(Role = #role{id = RoleId,
			 arena_elite_power = Power, name = RoleName,
			 m_arena_elite =
			     MArenaElite = #m_arena_elite{rival_info =
							      [{_,
								TarRole =
								    #arena_elite_role{power
											  =
											  TarPower,
										      name
											  =
											  TarName}}
							       | _],
							  frist_ref_time =
							      FristRefTime,
							  lev_reward =
							      LevReward,
							  had_combat_num =
							      AllCombatNum,
							  score = Score,
							  lev = Lev,
							  promoted_info =
							      PromotedInfo}},
	    CombatResult = #combat_result{replay_id = ReplayId,
					  hurt_statistics = HurtStatistics,
					  a_stat_info = AStat,
					  result = ResultT},
	    _Combat,
	    {CombatType, _Type, _Round, ARound, BRound, TarScore,
	     _TarPower, MaxPower, FormationType, BFormationType,
	     TarId = {_, TarSrvId}, ArenaEliteSprite, AtkAddPower,
	     DefendAddPower}) ->
    IsPromoted = util:if_true(PromotedInfo == [], false,
			      true),
    Result = util:if_true(ResultT == 1, 1, 2),
    {NewScoreT, NewLev, NewPromotedInfo, PushPromotedInfo} =
	do_calc_score(Role, Result, IsPromoted, CombatType,
		      TarScore, MaxPower),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_lib839, _,
       {__Levelarena_elite_lib839, __Tracesarena_elite_lib839}}
	  when __Levelarena_elite_lib839 band 128 /= 0 orelse
		 __Tracesarena_elite_lib839 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_elite_lib}, {function, combat_over},
			{line, 839}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("elite_combat_over=~ts===~w",
				     [Role#role.name, Result]),
		       none, 4096, 128, __Levelarena_elite_lib839,
		       __Tracesarena_elite_lib839, lager_event,
		       __Pidarena_elite_lib839);
      _ -> ok
    end,
    NewLevReward = case lists:keyfind(NewLev, 1, LevReward)
		       of
		     {_, 0} ->
			 lists:keyreplace(NewLev, 1, LevReward, {NewLev, 1});
		     _ -> LevReward
		   end,
    {WinCount, LossCount} = util:if_true(ResultT == 1,
					 {1, 0}, {0, 1}),
    RoundLog = to_round_log(Role, CombatResult, ARound,
			    BRound, TarId, FormationType, BFormationType,
			    HurtStatistics, ArenaEliteSprite, AtkAddPower,
			    DefendAddPower),
    ReplayList = [{1, RoundLog}],
    CombatLog = to_combat_log(Role, ReplayList, CombatType,
			      ResultT, WinCount, LossCount),
    arena_elite_log_mgr:save_log({RoleId, Power, TarPower,
				  CombatLog}),
    cluster_lib:cast(TarSrvId, arena_elite_log_mgr,
		     save_log, [{TarId, CombatLog}]),
    NewFristRefTime = util:if_true(Result == 1,
				   FristRefTime + 1, 0),
    NoticeList =
	arena_elite_data:get_constant(wins_time_condition),
    case lists:member(NewFristRefTime, NoticeList) of
      true ->
	  NoticeMsg =
	      color:msg(lang:get(<<"~ts玩家愈战愈勇，已在~ts中豪取~ts，谁来阻止他？我要参与~ts"/utf8>>),
			[{name, RoleId, RoleName},
			 {string, {blue, lang:get(<<"精英段位赛"/utf8>>)}},
			 {string,
			  {green,
			   util:fbin(lang:get(<<"~w连胜"/utf8>>),
				     [NewFristRefTime])}},
			 {href, {55, green, [], lang:get(<<"【我要参与】"/utf8>>)}}]),
	  notice:broadcast(rumor_left_top, NoticeMsg);
      _ -> ok
    end,
    case NewLev > Lev andalso
	   NewLev >=
	     arena_elite_data:get_constant(hearsay_lev_condition)
	of
      true ->
	  Name = arena_elite_data:get_lev_name(NewLev),
	  NoticeMsg2 =
	      color:msg(lang:get(<<"在豪强云集的精英段位赛中，玩家~ts击败了一位又一位强者，在英勇的战姿下成功升至~ts段位"
				   "！~ts"/utf8>>),
			[{name, RoleId, RoleName},
			 {string,
			  {blue,
			   util:fbin(lang:get(<<"【~ts】"/utf8>>), [Name])}},
			 {href, {55, green, [], lang:get(<<"【我要参与】"/utf8>>)}}]),
	  notice:broadcast(rumor_left_top, NoticeMsg2);
      _ -> ok
    end,
    NewScore = util:if_true(NewLev == 1, max(0, NewScoreT),
			    NewScoreT),
    NewMArenaElite =
	MArenaElite#m_arena_elite{frist_ref_time =
				      NewFristRefTime,
				  score = NewScore,
				  had_combat_num = AllCombatNum + 1,
				  lev = NewLev, promoted_info = NewPromotedInfo,
				  lev_reward = NewLevReward, rival_info = []},
    NewRole = Role#role{m_arena_elite = NewMArenaElite},
    {NewRole2, Awards} = get_combat_award(NewRole, Lev,
					  Result, MaxPower, CombatType,
					  {Score, NewScore, Lev, NewLev,
					   TarScore}),
    OldContCount = var:get_var(NewRole2, acc, 2055, 0),
    NewContCount = util:if_true(ResultT == 1,
				OldContCount + 1, 0),
    NewRole2_2 = var:set_var(NewRole2, acc, 2055,
			     NewContCount),
    catch role_weekly_mgr:info({arena_elite_lev, RoleId,
				NewLev}),
    Evts = [#evt_arena_elite_combat_count{},
	    #evt_arena_elite_rank{rank = NewLev},
	    #evt_arena_elite_cont_win{count = NewContCount},
	    #evt_arena_elite_champion{combat_type = CombatType}],
    NewRole3 = case Result of
		 1 ->
		     role_trigger:fire([#evt_arena_elite_win_count{} | Evts],
				       NewRole2_2);
		 _ -> role_trigger:fire(Evts, NewRole2_2)
	       end,
    get_rival_info(NewRole),
    erase(arena_elite_hurt_statistics),
    erase(arena_elite_win_count),
    erase(arena_elite_round_log),
    erase(arena_elite_total_hurt),
    erase(arena_elite_mvp_bid),
    PusScore = arena_elite_data:get_all_score(Lev) + Score,
    NPusScore = arena_elite_data:get_all_score(NewLev) +
		  NewScore,
    PushAddScore = util:if_true(NewLev > Lev, NewScore,
				NPusScore - PusScore),
    {MvpBid, _MvpHurt, TotalHurt} = calc_mvp(AStat, 0, 0,
					     0),
    NewRole4 = add_role_log(NewRole3, TarRole, CombatType,
			    ResultT, [MvpBid], TotalHurt),
    NewRole5 = case Result of
		 1 -> arena_elite_war_order:add_win_count(NewRole4);
		 _ -> NewRole4
	       end,
    do_update_c_arena_role(NewRole5),
    arena_elite_mirror:update_mirror(NewRole5),
    case Result of
      1 ->
	  log:save(task,
		   {Role, 1, Lev, integer_to_binary(Lev), 92,
		    <<"跨服段位赛"/utf8>>, <<"战斗胜利"/utf8>>});
      _ ->
	  log:save(task,
		   {Role, 2, Lev, integer_to_binary(Lev), 92,
		    <<"跨服段位赛"/utf8>>, <<"战斗失败"/utf8>>})
    end,
    sys_conn:pack_send(24906,
		       {Result, WinCount, LossCount, CombatType,
			PushPromotedInfo, Lev, NewLev, PusScore, Score,
			NewScore, PushAddScore, Awards,
			[{1, 1, 1, HurtStatistics, ReplayId}], TarName}),
    {ok, NewRole5}.

do_combat_over(Role = #role{id = RoleId, power = Power,
			    name = RoleName,
			    m_arena_elite =
				MArenaElite = #m_arena_elite{rival_info =
								 [{_,
								   TarRole =
								       #arena_elite_role{power
											     =
											     TarPower,
											 name
											     =
											     TarName}}
								  | _],
							     frist_ref_time =
								 FristRefTime,
							     lev_reward =
								 LevReward,
							     had_combat_num =
								 AllCombatNum,
							     score = Score,
							     lev = Lev,
							     promoted_info =
								 PromotedInfo}},
	       CombatType, TarScore, MaxPower) ->
    IsPromoted = util:if_true(PromotedInfo == [], false,
			      true),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_lib926, _,
       {__Levelarena_elite_lib926, __Tracesarena_elite_lib926}}
	  when __Levelarena_elite_lib926 band 128 /= 0 orelse
		 __Tracesarena_elite_lib926 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_elite_lib}, {function, do_combat_over},
			{line, 926}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("elite_combat_over=~ts===~w",
				     [Role#role.name, TarScore]),
		       none, 4096, 128, __Levelarena_elite_lib926,
		       __Tracesarena_elite_lib926, lager_event,
		       __Pidarena_elite_lib926);
      _ -> ok
    end,
    erase(is_multiple_combat),
    {WinCount, LoseCount} = util:get(arena_elite_win_count,
				     {0, 0}),
    Result = util:if_true(WinCount >= LoseCount, 1, 2),
    {NewScoreT, NewLev, NewPromotedInfo, PushPromotedInfo} =
	do_calc_score(Role, Result, IsPromoted, CombatType,
		      TarScore, MaxPower),
    NewLevReward = case lists:keyfind(NewLev, 1, LevReward)
		       of
		     {_, 0} ->
			 lists:keyreplace(NewLev, 1, LevReward, {NewLev, 1});
		     _ -> LevReward
		   end,
    NewScore = util:if_true(NewLev == 1, max(0, NewScoreT),
			    NewScoreT),
    NewFristRefTime = util:if_true(Result == 1,
				   FristRefTime + 1, 0),
    NoticeList =
	arena_elite_data:get_constant(wins_time_condition),
    case lists:member(NewFristRefTime, NoticeList) of
      true ->
	  NoticeMsg =
	      color:msg(lang:get(<<"~ts玩家愈战愈勇，已在~ts中豪取~ts，谁来阻止他？我要参与~ts"/utf8>>),
			[{name, RoleId, RoleName},
			 {string, {blue, lang:get(<<"精英段位赛"/utf8>>)}},
			 {string,
			  {green,
			   util:fbin(lang:get(<<"~w连胜"/utf8>>),
				     [NewFristRefTime])}},
			 {href, {55, green, [], lang:get(<<"【我要参与】"/utf8>>)}}]),
	  notice:broadcast(rumor_left_top, NoticeMsg);
      _ -> ok
    end,
    NewMArenaElite = MArenaElite#m_arena_elite{score =
						   NewScore,
					       frist_ref_time = NewFristRefTime,
					       lev = NewLev,
					       had_combat_num =
						   AllCombatNum + 1,
					       promoted_info = NewPromotedInfo,
					       lev_reward = NewLevReward,
					       rival_info = []},
    NewRole = Role#role{m_arena_elite = NewMArenaElite},
    {NewRole2, Awards} = get_combat_award(NewRole, Lev,
					  Result, MaxPower, CombatType,
					  {Score, NewScore, Lev, NewLev,
					   TarScore}),
    OldContCount = var:get_var(NewRole2, acc, 2055, 0),
    NewContCount = util:if_true(Result == 1,
				OldContCount + 1, 0),
    NewRole2_2 = var:set_var(NewRole2, acc, 2055,
			     NewContCount),
    Evts = [#evt_arena_elite_combat_count{},
	    #evt_arena_elite_rank{rank = NewLev},
	    #evt_arena_elite_cont_win{count = NewContCount},
	    #evt_arena_elite_champion{combat_type = CombatType}],
    NewRole3 = case Result of
		 1 ->
		     role_trigger:fire([#evt_arena_elite_win_count{} | Evts],
				       NewRole2_2);
		 _ -> role_trigger:fire(Evts, NewRole2_2)
	       end,
    get_rival_info(NewRole),
    HurtStatistics = util:get(arena_elite_hurt_statistics,
			      []),
    ReplayList = util:get(arena_elite_round_log, []),
    CombatLog = #arena_elite_log{def_id =
				     TarId = {_, TarSrvId}} =
		    to_combat_log(Role, ReplayList, CombatType, Result,
				  WinCount, LoseCount),
    arena_elite_log_mgr:save_log({RoleId, Power, TarPower,
				  CombatLog}),
    cluster_lib:cast(TarSrvId, arena_elite_log_mgr,
		     save_log, [{TarId, CombatLog}]),
    case NewLev > Lev andalso
	   NewLev >=
	     arena_elite_data:get_constant(hearsay_lev_condition)
	of
      true ->
	  Name = arena_elite_data:get_lev_name(NewLev),
	  NoticeMsg2 =
	      color:msg(lang:get(<<"在豪强云集的精英段位赛中，玩家~ts击败了一位又一位强者，在英勇的战姿下成功晋级至~ts段"
				   "位！~ts"/utf8>>),
			[{name, RoleId, RoleName},
			 {string,
			  {blue,
			   util:fbin(lang:get(<<"【~ts】"/utf8>>), [Name])}},
			 {href, {55, green, [], lang:get(<<"【我要参与】"/utf8>>)}}]),
	  notice:broadcast(rumor_left_top, NoticeMsg2);
      _ -> ok
    end,
    PusScore = arena_elite_data:get_all_score(Lev) + Score,
    NPusScore = arena_elite_data:get_all_score(NewLev) +
		  NewScore,
    PushAddScore = util:if_true(NewLev > Lev, NewScore,
				NPusScore - PusScore),
    TotalHurt = util:get(arena_elite_total_hurt, 0),
    MvpBids = util:get(arena_elite_mvp_bid, []),
    erase(arena_elite_hurt_statistics),
    erase(arena_elite_win_count),
    erase(arena_elite_round_log),
    erase(arena_elite_total_hurt),
    erase(arena_elite_mvp_bid),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_lib999, _,
       {__Levelarena_elite_lib999, __Tracesarena_elite_lib999}}
	  when __Levelarena_elite_lib999 band 128 /= 0 orelse
		 __Tracesarena_elite_lib999 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_elite_lib}, {function, do_combat_over},
			{line, 999}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("==精英赛战斗结束,胜场:~w, 败场:~w",
				     [WinCount, LoseCount]),
		       none, 4096, 128, __Levelarena_elite_lib999,
		       __Tracesarena_elite_lib999, lager_event,
		       __Pidarena_elite_lib999);
      _ -> ok
    end,
    NewRole4 = add_role_log(NewRole3, TarRole, CombatType,
			    Result, MvpBids, TotalHurt),
    NewRole5 = case Result of
		 1 -> arena_elite_war_order:add_win_count(NewRole4);
		 _ -> NewRole4
	       end,
    do_update_c_arena_role(NewRole5),
    arena_elite_mirror:update_mirror(NewRole5),
    case Result of
      1 ->
	  log:save(task,
		   {Role, 1, Lev, integer_to_binary(Lev), 92,
		    <<"跨服段位赛"/utf8>>, <<"战斗胜利"/utf8>>});
      _ ->
	  log:save(task,
		   {Role, 2, Lev, integer_to_binary(Lev), 92,
		    <<"跨服段位赛"/utf8>>, <<"战斗失败"/utf8>>})
    end,
    sys_conn:pack_send(24906,
		       {Result, WinCount, LoseCount, CombatType,
			PushPromotedInfo, Lev, NewLev, PusScore, Score,
			NewScore, PushAddScore, Awards, HurtStatistics,
			TarName}),
    {ok, NewRole5}.

add_role_log(Role = #role{id = RoleId,
			  m_arena_elite =
			      MA = #m_arena_elite{lev = Lev, score = Score,
						  log = Log}},
	     TarRole, CombatType, ResultT, MvpBid, TotalHurt) ->
    Period = case sys_env:get(arena_elite_state) of
	       {_, _, _, PeriodT} -> PeriodT;
	       _ -> 0
	     end,
    LogScore = arena_elite_data:get_all_score(Lev) + Score,
    ZoneId = arena_elite_mgr:get_zid(RoleId),
    Rank = arena_elite_mgr:get_role_ranks(RoleId, ZoneId),
    Log1 = list_util:keyfind(0, #m_arena_elite_log.period,
			     Log,
			     #m_arena_elite_log{log_zone_id = ZoneId,
						log_rank = Rank}),
    Log2 = list_util:keyfind(Period,
			     #m_arena_elite_log.period, Log,
			     #m_arena_elite_log{period = Period,
						log_zone_id = ZoneId,
						log_rank = Rank}),
    NewLog1 = to_new_log(Log1, TarRole, CombatType, ResultT,
			 MvpBid, TotalHurt, Lev, LogScore, ZoneId, Rank),
    NewLog2 = to_new_log(Log2, TarRole, CombatType, ResultT,
			 MvpBid, TotalHurt, Lev, LogScore, ZoneId, Rank),
    NewLog3 = lists:keystore(0, #m_arena_elite_log.period,
			     Log, NewLog1),
    NewLog4 = lists:keystore(Period,
			     #m_arena_elite_log.period, NewLog3, NewLog2),
    Role#role{m_arena_elite =
		  MA#m_arena_elite{log = NewLog4}}.

to_new_log(Log = #m_arena_elite_log{max_lev = OldLev,
				    max_score = OldScore,
				    combat_win_count1 = OldCount1,
				    combat_all_count1 = OldAllCount1,
				    combat_win_count2 = OldCount2,
				    combat_all_count2 = OldAllCount2,
				    max_dps = OldDps, mvp_info = OldMvpList,
				    winning_streak = WinStreak,
				    winning_streak_now = WinStreakNow,
				    extra = ExtraData,
				    beast_rivl_info = BeastRivlInfo},
	   TarRole = #arena_elite_role{elite_lev = LevT2,
				       score = ScoreT2},
	   CombatType, ResultT, MvpBids, TotalHurt, Lev, LogScore,
	   ZoneId, Rank) ->
    RoleScore = arena_elite_data:get_all_score(LevT2) +
		  ScoreT2,
    {NewCount1, NewAllCount1} =
	get_log_combat_count(OldCount1, OldAllCount1, 23,
			     CombatType, ResultT),
    {NewCount2, NewAllCount2} =
	get_log_combat_count(OldCount2, OldAllCount2, 24,
			     CombatType, ResultT),
    Type = util:if_true(CombatType == 23, 1, 2),
    FiveResult = list_util:keyfind(Type, ExtraData, []),
    {FiveResults, _} = list_util:split(100,
				       [ResultT | FiveResult]),
    NewExtraData = lists:keystore(Type, 1, ExtraData,
				  {Type, FiveResults}),
    Fun = fun (BidT, Acc) -> list_util:keyadd(BidT, 1, Acc)
	  end,
    MvpList = lists:foldl(Fun, OldMvpList, MvpBids),
    NewWinStreakNow = util:if_true(ResultT == 1,
				   WinStreakNow + 1, 0),
    NewBeastRivlInfo = case BeastRivlInfo of
			 #arena_elite_role_best{score = ScoreT1}
			     when ScoreT1 > RoleScore ->
			     BeastRivlInfo;
			 _ ->
			     to_arena_elite_role_best(TarRole, RoleScore,
						      CombatType)
		       end,
    Log#m_arena_elite_log{max_lev = max(OldLev, Lev),
			  max_score = max(LogScore, OldScore),
			  combat_win_count1 = NewCount1,
			  combat_all_count1 = NewAllCount1,
			  combat_win_count2 = NewCount2,
			  combat_all_count2 = NewAllCount2,
			  max_dps = max(OldDps, TotalHurt), mvp_info = MvpList,
			  winning_streak = max(WinStreak, NewWinStreakNow),
			  winning_streak_now = NewWinStreakNow,
			  beast_rivl_info = NewBeastRivlInfo,
			  extra = NewExtraData, log_zone_id = ZoneId,
			  log_rank = Rank}.

get_log_combat_count(Count, AllCount, CombatType,
		     CombatType, 1) ->
    {Count + 1, AllCount + 1};
get_log_combat_count(Count, AllCount, CombatType,
		     CombatType, 2) ->
    {Count, AllCount + 1};
get_log_combat_count(Count, AllCount, _, _, _) ->
    {Count, AllCount}.

calc_mvp([], TotalHurt, MvpHurt, MvpBid) ->
    {MvpBid, MvpHurt, TotalHurt};
calc_mvp([#{object_bid := Bid, hurt := Hurt} | T],
	 TotalHurt, MvpHurt, MvpBid) ->
    case Hurt > MvpHurt of
      true -> calc_mvp(T, TotalHurt + Hurt, Hurt, Bid);
      _ -> calc_mvp(T, TotalHurt + Hurt, MvpHurt, MvpBid)
    end.

to_arena_elite_role_best(TarRole =
			     #arena_elite_role{face_update_time =
						   FaceUpdateTime,
					       face_file = FaceFile, id = TarId,
					       defense = Defense},
			 RoleScore, CombatType) ->
    Type = util:if_true(CombatType == 24, 2, 1),
    {_, List} = lists:keyfind(Type, 1, Defense),
    Powers = [{Order,
	       lists:sum([PPower
			  || #arena_partners_info{power = PPower}
				 <- PartnerDefense])}
	      || #arena_elite_rival_defense{order = Order,
					    partner_infos = PartnerDefense}
		     <- List],
    #arena_elite_role_best{id = TarId,
			   name = TarRole#arena_elite_role.name,
			   lev = TarRole#arena_elite_role.lev,
			   sex = TarRole#arena_elite_role.sex,
			   gid = TarRole#arena_elite_role.gid,
			   gname = TarRole#arena_elite_role.gname,
			   face = TarRole#arena_elite_role.face, power = Powers,
			   look_id = TarRole#arena_elite_role.look_id,
			   score = RoleScore,
			   elite_lev = TarRole#arena_elite_role.elite_lev,
			   time = date:now(),
			   avatar_id = TarRole#arena_elite_role.avatar_id,
			   is_king = TarRole#arena_elite_role.is_king,
			   face_update_time = FaceUpdateTime,
			   face_file = FaceFile}.

get_combat_award(Role, Lev, Result, MaxPower,
		 CombatType, LogArg) ->
    DropIds = get_drop_ids({Lev, Result, CombatType}),
    Items1 = case drop_lib:common_drop(Role, DropIds) of
	       [{_, DropItems, _, _}] ->
		   [{Bid, Val} || {Bid, _, Val} <- DropItems];
	       _ -> []
	     end,
    BaseAward = get_base_award({Lev, Result, CombatType}),
    OtherAwards = get_other_award(Result, MaxPower,
				  CombatType),
    Awards = item_lib:merge(BaseAward ++ Items1,
			    OtherAwards),
    Gain = format:val_to_gain(Awards, arena_elite),
    case role_gain:do(Role, Gain) of
      {ok, NewRoleT} ->
	  log:log_gain(Gain, Role, NewRoleT, <<"精英赛挑战"/utf8>>,
		       util:fbin(lang:get(<<"精英赛挑战~w, 战力:~w, 积分参数:~w"/utf8>>),
				 [CombatType, MaxPower, LogArg])),
	  {NewRoleT, Awards};
      _ -> {Role, Awards}
    end.

do_calc_score(#role{arena_elite_power = ArenaMaxPower,
		    m_arena_elite =
			#m_arena_elite{score = Score, lev = Lev,
				       promoted_info = PromotedInfo}},
	      Result, IsPromoted, CombatType, TarScore, MaxPower) ->
    PusScore = arena_elite_data:get_all_score(Lev) + Score,
    TargerScore =
	arena_elite_data:get_targer_score(ArenaMaxPower),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_lib1152, _,
       {__Levelarena_elite_lib1152,
	__Tracesarena_elite_lib1152}}
	  when __Levelarena_elite_lib1152 band 128 /= 0 orelse
		 __Tracesarena_elite_lib1152 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_elite_lib}, {function, do_calc_score},
			{line, 1152}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("积分计算~w",
				     [{TarScore, PusScore, TargerScore}]),
		       none, 4096, 128, __Levelarena_elite_lib1152,
		       __Tracesarena_elite_lib1152, lager_event,
		       __Pidarena_elite_lib1152);
      _ -> ok
    end,
    AllScore = case Result of
		 _ when IsPromoted -> 0;
		 1 ->
		     {AddScore, Rio, AddScoreRio} = case CombatType of
						      24 ->
							  arena_elite_data:get_constant(king_win_base_exp_add);
						      _ ->
							  arena_elite_data:get_constant(normal_win_base_exp_add)
						    end,
		     AllAddScore = util:ceil(AddScore *
					       (1 +
						  max(-2.0e-1,
						      min((TarScore - PusScore)
							    / PusScore,
							  Rio)))
					       +
					       max(TargerScore - PusScore, 0) *
						 AddScoreRio),
		     Score + AllAddScore;
		 _ ->
		     {AddScore, Rio, AddScoreRio} = case CombatType of
						      24 ->
							  arena_elite_data:get_constant(king_lose_base_exp_down);
						      _ ->
							  arena_elite_data:get_constant(normal_lose_base_exp_down)
						    end,
		     LoseScore = util:ceil(AddScore *
					     (1 +
						max(-2.0e-1,
						    min((PusScore - TarScore) /
							  PusScore,
							Rio)))),
		     ScoreTemp = Score - LoseScore,
		     util:if_true(Lev == 1, max(0, ScoreTemp), ScoreTemp)
	       end,
    NeedPromoted = arena_elite_data:get_need_promoted(Lev),
    {OtherExp, _} = arena_elite_data:get_init_exp(Lev),
    NeedScore = arena_elite_data:get_need_exp(Lev),
    MaxLev =
	lists:max(arena_elite_data:get_all_award_ids()),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_lib1178, _,
       {__Levelarena_elite_lib1178,
	__Tracesarena_elite_lib1178}}
	  when __Levelarena_elite_lib1178 band 128 /= 0 orelse
		 __Tracesarena_elite_lib1178 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_elite_lib}, {function, do_calc_score},
			{line, 1178}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("积分变化~w",
				     [{AllScore, PusScore, TarScore}]),
		       none, 4096, 128, __Levelarena_elite_lib1178,
		       __Tracesarena_elite_lib1178, lager_event,
		       __Pidarena_elite_lib1178);
      _ -> ok
    end,
    case [{Round, Satu}
	  || {Round, Satu} <- PromotedInfo, Satu > 0]
	of
      _ when Lev >= MaxLev ->
	  {AllScore, Lev, PromotedInfo, []};
      _ when not IsPromoted ->
	  if AllScore >= NeedScore andalso NeedPromoted == 1 ->
		 {PromotedCount, _} =
		     arena_elite_data:get_promoted_info(Lev),
		 {AllScore, Lev,
		  [{RoundT, 0} || RoundT <- lists:seq(1, PromotedCount)],
		  []};
	     AllScore >= NeedScore ->
		 NextLev = arena_elite_data:get_next_lev(Lev),
		 {_, AddExp1} = arena_elite_data:get_init_exp(NextLev),
		 {AllScore - NeedScore + AddExp1, NextLev, [], []};
	     AllScore + OtherExp < 0 andalso Lev > 1 ->
		 NextLev = max(1, Lev - 1),
		 ExpTemp = arena_elite_data:get_need_exp(NextLev),
		 {ExpTemp + AllScore, NextLev, [], []};
	     true -> {AllScore, Lev, PromotedInfo, []}
	  end;
      Temp ->
	  AllCount = length(Temp),
	  WinCount = length([{Round, 1}
			     || {Round, 1} <- PromotedInfo]),
	  WinCount2 = util:if_true(Result == 1, WinCount + 1,
				   WinCount),
	  LoseCount = length([{Round, 2}
			      || {Round, 2} <- PromotedInfo]),
	  LoseCount2 = util:if_true(Result == 2, LoseCount + 1,
				    LoseCount),
	  PushPromotedInfo = lists:keyreplace(AllCount + 1, 1,
					      PromotedInfo,
					      {AllCount + 1, Result}),
	  {PromotedCount, PromotedWinCount} =
	      arena_elite_data:get_promoted_info(Lev),
	  if WinCount2 >= PromotedWinCount ->
		 NextLev = arena_elite_data:get_next_lev(Lev),
		 {_, AddExp1} = arena_elite_data:get_init_exp(NextLev),
		 {Score - NeedScore + AddExp1, NextLev, [],
		  PushPromotedInfo};
	     LoseCount2 > PromotedCount - PromotedWinCount ->
		 DelExp = arena_elite_data:get_del_exp(Lev),
		 {max(0, NeedScore - DelExp), Lev, [], PushPromotedInfo};
	     true ->
		 NPromotedInfo = lists:keyreplace(AllCount + 1, 1,
						  PromotedInfo,
						  {AllCount + 1, Result}),
		 {Score, Lev, NPromotedInfo, PushPromotedInfo}
	  end
    end.

get_base_award({Lev, 1, 24}) ->
    arena_elite_data:get_combat_award1(Lev);
get_base_award({Lev, _Result, 24}) ->
    arena_elite_data:get_combat_award2(Lev);
get_base_award({Lev, 1, 23}) ->
    arena_elite_data:get_combat_award3(Lev);
get_base_award({Lev, _, _}) ->
    arena_elite_data:get_combat_award4(Lev).

get_drop_ids({Lev, 1, 24}) ->
    arena_elite_data:get_combat_drop_id3(Lev);
get_drop_ids({Lev, _Result, 24}) ->
    arena_elite_data:get_combat_drop_id4(Lev);
get_drop_ids({Lev, 1, 23}) ->
    arena_elite_data:get_combat_drop_id1(Lev);
get_drop_ids({Lev, _, _}) ->
    arena_elite_data:get_combat_drop_id2(Lev).

get_item_rio(1, 24) ->
    arena_elite_data:get_constant(king_win_coin_correct);
get_item_rio(_, 24) ->
    arena_elite_data:get_constant(king_lose_coin_correct);
get_item_rio(1, 23) ->
    arena_elite_data:get_constant(normal_win_coin_correct);
get_item_rio(_, _) ->
    arena_elite_data:get_constant(normal_lose_coin_correct).

get_other_award(Result, MaxPower, CombatType) ->
    ItemRiods = get_item_rio(Result, CombatType),
    [{ItemId, util:ceil(Rio * MaxPower)}
     || {ItemId, Rio} <- ItemRiods].

do_update_c_arena_role(Role) ->
    PushRole = to_c_arena_role(Role),
    arena_elite_mgr:info({update_arena_role, PushRole}).

to_c_arena_role(R = #role{id = RoleId,
			  m_look = #m_look{use_id = LookId},
			  max_power = MaxPower, arena_elite_max_star = Star,
			  arena_elite_power = ArenaElitePowerT,
			  m_avatar = #m_avatar{used = AvatarId},
			  m_arena_elite =
			      #m_arena_elite{period = Period, log = Log,
					     lev = EliteLev, score = Score}}) ->
    IsKing = get_is_king(R),
    PusScore = arena_elite_data:get_all_score(EliteLev) +
		 Score,
    ArenaElitePower = max(ArenaElitePowerT, MaxPower),
    MatchPower = get_match_power(Period, Log, IsKing,
				 PusScore, ArenaElitePower, Star),
    WinRio = get_win_rio(Period, Log, IsKing),
    Zid = arena_elite_mgr:get_zid(RoleId),
    {_, FaceFile, FaceUpdateTime} = role_face:face_info(R),
    #c_e_role{id = RoleId, name = R#role.name,
	      lev = R#role.lev, face = R#role.face_id,
	      power = R#role.arena_elite_power, look_id = LookId,
	      score = PusScore, elite_lev = EliteLev,
	      avatar_id = AvatarId, is_king = IsKing,
	      match_power = MatchPower, win_rio = WinRio,
	      all_star =
		  min(Star, arena_elite_data:get_constant(strength_var4)),
	      zid = Zid, face_update_time = FaceUpdateTime,
	      face_file = FaceFile}.

-spec check_open(#role{}) -> {false, binary()} |
			     {ok, atom, pos_integer(), pos_integer(),
			      pos_integer()}.

check_open(#role{lev = Lev}) ->
    LimitLev =
	arena_elite_data:get_constant(open_person_lev_limit),
    case Lev >= LimitLev of
      true ->
	  case arena_elite_mgr:check_open() of
	    {ok, StateName, Ts, TimeOut, Period} ->
		{ok, StateName, Ts, TimeOut, Period};
	    {false, Msg} -> {false, Msg}
	  end;
      _ ->
	  {false,
	   util:fbin(lang:get(<<"~w级开启超凡段位赛"/utf8>>), [LimitLev])}
    end.

-spec check_combat(#role{}) -> {false, binary()} | ok.

check_combat(Role) ->
    case check_open(Role) of
      {false, Msg} -> {false, Msg};
      {ok, idle, _Ts, _TimeOut, _Period} ->
	  {false, lang:get(<<"超凡段位赛未开启"/utf8>>)};
      {ok, _, _Ts, _TimeOut, Period} ->
	  case get_arena_elite_state() of
	    {_, _, open} -> {ok, Period};
	    _ -> {false, lang:get(<<"未到超凡段位赛开战时间"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"超凡段位赛未开启2"/utf8>>)}
    end.

-spec get_rank_info(#role{}) -> ok.

get_rank_info(#role{id = Id}) ->
    StartTime = sys_env:get(arena_elite_state_start_time,
			    0),
    EndTime = StartTime +
		86400 *
		  (arena_elite_data:get_constant(first_routine) +
		     arena_elite_data:get_constant(second_routine)
		     + arena_elite_data:get_constant(second_king)),
    {AwardLev, _} = case ets:lookup(arena_elite_reward_lev,
				    Id)
			of
		      [{_, AwardLevT, AwardScoreT}] ->
			  {AwardLevT, AwardScoreT};
		      _ -> {1, 1000}
		    end,
    {MyRank, EndTime2} = case ets:lookup(arena_elite_other,
					 hallows_award)
			     of
			   [{_, Ranks, EndTimeT}] ->
			       MyRankT = case lists:keyfind(Id, 1, Ranks) of
					   {_, Rank, Elev, _} ->
					       LimitLev =
						   arena_elite_data:get_rank_limit_lev(Rank),
					       util:if_true(Elev >= LimitLev,
							    Rank, 0);
					   _ ->
					       case catch
						      ets:lookup(arena_elite_hallows_award,
								 Id)
						   of
						 [{_, Rank, ELev, _} | _] ->
						     LimitLev =
							 arena_elite_data:get_rank_limit_lev(Rank),
						     util:if_true(ELev >=
								    LimitLev,
								  Rank, 0);
						 _ -> 0
					       end
					 end,
			       {MyRankT, EndTimeT};
			   _ -> {0, 0}
			 end,
    case sys_env:get(arena_elite_state) of
      {first_routine, _, _, _} ->
	  {MyRank, AwardLev, EndTime2, EndTime};
      _ -> {0, AwardLev, EndTime2, EndTime}
    end.

get_log_info(#role{id = Id}, Type, LogId) ->
    L = case Type of
	  1 -> arena_elite_log_mgr:get_log(Id);
	  2 -> util:get(arena_elite_c_log, []);
	  _ -> util:get(arena_elite_c_hall_log, [])
	end,
    PushL = case lists:keyfind(LogId, #arena_elite_log.id,
			       L)
		of
	      #arena_elite_log{replay_list = Replays} ->
		  [{Round, ReplayLog,
		    [arena_elite_ver:do_partner_hurt_ver(T)
		     || T <- list_util:keyfind(1, Ext, [])],
		    list_util:keyfind(2, Ext, 0),
		    list_util:keyfind(3, Ext, []),
		    list_util:keyfind(4, Ext, 0),
		    list_util:keyfind(5, Ext, []),
		    list_util:keyfind(6, Ext, 0),
		    list_util:keyfind(7, Ext, 0)}
		   || {Round, ReplayLog = #arena_replay_info{ext = Ext}}
			  <- Replays];
	      _ -> []
	    end,
    sys_conn:pack_send(24931, {Type, LogId, PushL}).

-spec get_log(#role{}, pos_integer()) -> ok.

get_log(#role{id = Id}, 1) ->
    L = arena_elite_log_mgr:get_log(Id),
    sys_conn:pack_send(24930, {1, L});
get_log(#role{pid = RolePid, id = {_, Sid}, lev = Lev},
	3) ->
    case role_misc:check_cd(arena_elite_get_c_hall_log,
			    60000)
	of
      false ->
	  case get(arena_elite_c_hall_log) of
	    L = [_ | _] -> sys_conn:pack_send(24930, {3, L});
	    _ ->
		case big_world_lib:cast(center, c_arena_elite_mgr, info,
					[{get_hall_log, RolePid, Lev, Sid}])
		    of
		  {error, _} -> sys_conn:pack_send(24930, {3, []});
		  _ -> ok
		end
	  end;
      _ ->
	  case big_world_lib:cast(center, c_arena_elite_mgr, info,
				  [{get_hall_log, RolePid, Lev, Sid}])
	      of
	    {error, _} -> sys_conn:pack_send(24930, {3, []});
	    _ -> ok
	  end
    end;
get_log(#role{pid = RolePid, id = {_, Sid}}, _) ->
    case role_misc:check_cd(arena_elite_get_c_log, 60000) of
      false ->
	  case get(arena_elite_c_log) of
	    L = [_ | _] -> sys_conn:pack_send(24930, {2, L});
	    _ ->
		case big_world_lib:cast(center, c_arena_elite_mgr, info,
					[{get_log, RolePid, Sid}])
		    of
		  {error, _} -> sys_conn:pack_send(24930, {2, []});
		  _ -> ok
		end
	  end;
      _ ->
	  case big_world_lib:cast(center, c_arena_elite_mgr, info,
				  [{get_log, RolePid, Sid}])
	      of
	    {error, _} -> sys_conn:pack_send(24930, {2, []});
	    _ -> ok
	  end
    end.

-spec push_c_log(#role{}, list(), pos_integer()) -> {ok,
						     #role{}}.

push_c_log(Role, L, 2) ->
    put(arena_elite_c_log, L),
    sys_conn:pack_send(24930, {2, L}),
    {ok, Role};
push_c_log(Role, L, _) ->
    put(arena_elite_c_hall_log, L),
    sys_conn:pack_send(24930, {3, L}),
    {ok, Role}.

-spec push_old_rank_info(#role{}, pos_integer(),
			 pos_integer(), pos_integer(), pos_integer()) -> ok.

push_old_rank_info(#role{id = Id,
			 m_arena_elite =
			     #m_arena_elite{lev = EliteLev, score = ScoreT,
					    old_rank = OldRanks}},
		   Period, Start, End, ZoneId) ->
    {RankList, MyRank, MyEliteLev, MyScore, MaxZoneId} =
	case arena_elite_mgr:check_open() of
	  {ok, _StateName, _Ts, _TimeOut, Period} ->
	      {[], 0, 1, 1000, 1};
	  _ ->
	      ListT2 = arena_elite_mgr:get_ranks(Period),
	      ListT = case lists:keyfind(ZoneId, 1, ListT2) of
			false -> [];
			{_, Temp} -> Temp
		      end,
	      MyRankT = case lists:keyfind(Id, #arena_elite_rank.id,
					   ListT)
			    of
			  #arena_elite_rank{rank = Rank} -> Rank;
			  _ -> 0
			end,
	      {OldLevT, OldScore} = list_util:keyfind(Period,
						      OldRanks, {1, 1000}),
	      ZoneIds = [T || {T, _} <- ListT2, is_integer(T)],
	      MaxZoneIdT = case ZoneIds of
			     [] -> 1;
			     _ -> lists:max(ZoneIds)
			   end,
	      {ListT, MyRankT, OldLevT, OldScore, MaxZoneIdT}
	end,
    PushL = lists:keysort(#arena_elite_rank.rank,
			  [Temp
			   || Temp = #arena_elite_rank{rank = Rank} <- RankList,
			      Rank =< End andalso Rank >= Start]),
    sys_conn:pack_send(24911,
		       {MyRank, MyEliteLev, MyScore, Period, PushL, ZoneId,
			MaxZoneId}).

-spec buy_count(#role{}) -> ok.

buy_count(Role = #role{m_vip = #m_vip{lev = VipLev},
		       m_arena_elite =
			   #m_arena_elite{day_buy_count = DayBuyCount,
					  max_day_buy_count =
					      MaxDayBuyCount}}) ->
    case check_combat(Role) of
      {false, Msg} -> {false, Msg};
      _ ->
	  case DayBuyCount >= MaxDayBuyCount of
	    true -> {false, lang:get(<<"购买次数已达上限"/utf8>>)};
	    _ ->
		case arena_elite_data:get_buy_count(DayBuyCount + 1) of
		  {Expend, NeedVipLev} when VipLev >= NeedVipLev ->
		      Loss = format:val_to_loss(Expend, arena_elite),
		      case role_gain:do(Role, Loss) of
			{ok,
			 NRole = #role{m_arena_elite =
					   MArenaElite =
					       #m_arena_elite{day_combat_count =
								  Count}}} ->
			    log:log_gain(Loss, Role, NRole,
					 <<"精英赛购买匹配次数"/utf8>>,
					 util:fbin(lang:get(<<"精英赛购买匹配次数~w"/utf8>>),
						   [DayBuyCount + 1])),
			    NewCount = Count + 1,
			    NewBuyCount = DayBuyCount + 1,
			    NewMArenaElite =
				MArenaElite#m_arena_elite{day_combat_count =
							      NewCount,
							  day_buy_count =
							      NewBuyCount},
			    {ok, NRole#role{m_arena_elite = NewMArenaElite},
			     NewCount, NewBuyCount};
			{false, #loss{msg = Msg}} -> {false, Msg}
		      end;
		  _ -> {false, lang:get(<<"购买次数已达上限"/utf8>>)}
		end
	  end
    end.

-spec get_lev_award(#role{}, pos_integer()) -> ok.

get_lev_award(Role = #role{m_arena_elite =
			       #m_arena_elite{lev_reward = LevReward}},
	      Lev) ->
    case lists:keyfind(Lev, 1, LevReward) of
      {Lev, 0} -> {false, lang:get(<<"该段位奖励未达成"/utf8>>)};
      {Lev, 2} -> {false, lang:get(<<"该段位奖励已领取"/utf8>>)};
      {Lev, 1} ->
	  case arena_elite_data:get_lev_award(Lev) of
	    Award when is_list(Award) ->
		Gain = format:val_to_gain(Award, get_lev_award),
		case role_gain:do_notice(Role, Gain) of
		  {ok, NRole = #role{m_arena_elite = MArenaElite}} ->
		      log:log_gain(Gain, Role, NRole, <<"精英赛段位奖励领取"/utf8>>,
				   util:fbin(lang:get(<<"精英赛段位奖励领取~w"/utf8>>),
					     [Lev])),
		      NewLevReward = lists:keyreplace(Lev, 1, LevReward,
						      {Lev, 2}),
		      NewRole = NRole#role{m_arena_elite =
					       MArenaElite#m_arena_elite{lev_reward
									     =
									     NewLevReward}},
		      {ok, NewRole, NewLevReward};
		  {false, #gain{msg = Msg}} -> {false, Msg}
		end;
	    _ -> {false, lang:get(<<"不存在的奖励"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"参数错误"/utf8>>)}
    end.

-spec get_formation_sys(#role{}, pos_integer()) -> {ok,
						    #role{}, list()}.

get_formation_sys(R = #role_robot{arena_elite_defens =
				      Defens},
		  Type) ->
    case lists:keyfind(Type, #m_arena_elite_defens.type,
		       Defens)
	of
      #m_arena_elite_defens{formations = Formations} ->
	  PushFormations = [{OrderT, FormationTypeT,
			     [Temp
			      || Temp = #formation_pos{id = IdT} <- PosInfoT,
				 partner_lib:get_partner(R, IdT) =/= false],
			     HallowsIdT}
			    || {OrderT, FormationTypeT, PosInfoT, HallowsIdT}
				   <- Formations],
	  case [1 || E <- PushFormations, element(3, E) =/= []] of
	    [_ | _] -> {ok, R, PushFormations};
	    _ ->
		#formation_lineup{pos_info = PosInfo,
				  type = FormationType,
				  hallows_id = HallowsId} =
		    formation_lib:query_formation_info_without_resonate(R),
		Formations1 = [{1, FormationType, PosInfo, HallowsId}],
		NewDefens = lists:keystore(Type,
					   #m_arena_elite_defens.type, Defens,
					   #m_arena_elite_defens{type = Type,
								 formations =
								     Formations1}),
		PushFormations1 = [{OrderT, FormationTypeT,
				    [Temp
				     || Temp = #formation_pos{id = IdT}
					    <- PosInfoT,
					partner_lib:get_partner(R, IdT) =/=
					  false],
				    HallowsIdT}
				   || {OrderT, FormationTypeT, PosInfoT,
				       HallowsIdT}
					  <- Formations1],
		{ok, R#role_robot{arena_elite_defens = NewDefens},
		 PushFormations1}
	  end;
      _ when Type == 1 ->
	  #formation_lineup{pos_info = PosInfo,
			    type = FormationType, hallows_id = HallowsId} =
	      formation_lib:query_formation_info_without_resonate(R),
	  Formations = [{1, FormationType, PosInfo, HallowsId}],
	  NewDefens = lists:keystore(Type,
				     #m_arena_elite_defens.type, Defens,
				     #m_arena_elite_defens{type = Type,
							   formations =
							       Formations}),
	  PushFormations = [{OrderT, FormationTypeT,
			     [Temp
			      || Temp = #formation_pos{id = IdT} <- PosInfoT,
				 partner_lib:get_partner(R, IdT) =/= false],
			     HallowsIdT}
			    || {OrderT, FormationTypeT, PosInfoT, HallowsIdT}
				   <- Formations],
	  {ok, R#role_robot{arena_elite_defens = NewDefens},
	   PushFormations};
      _ ->
	  {ok, R2 = #role_robot{arena_elite_defens = Defens2},
	   Formations} =
	      get_formation_sys(R, 1),
	  NewDefens = lists:keystore(Type,
				     #m_arena_elite_defens.type, Defens2,
				     #m_arena_elite_defens{type = Type,
							   formations =
							       Formations}),
	  PushFormations = [{OrderT, FormationTypeT,
			     [Temp
			      || Temp = #formation_pos{id = IdT} <- PosInfoT,
				 partner_lib:get_partner(R, IdT) =/= false],
			     HallowsIdT}
			    || {OrderT, FormationTypeT, PosInfoT, HallowsIdT}
				   <- Formations],
	  {ok, R2#role_robot{arena_elite_defens = NewDefens},
	   PushFormations}
    end;
get_formation_sys(Role = #role{m_arena_elite =
				   ArenaElite = #m_arena_elite{defens =
								   Defens}},
		  Type) ->
    Isking = get_is_king(Role),
    case check_open(Role) of
      {ok, StateName, _, _, _}
	  when Type == 2 andalso StateName =/= second_king ->
	  {ok, Role, []};
      {ok, StateName, _, _, _}
	  when Type == 2 andalso
		 StateName == second_king andalso Isking == 0 ->
	  {ok, Role, []};
      {ok, StateName, _, _, _} when StateName =/= idle ->
	  case lists:keyfind(Type, #m_arena_elite_defens.type,
			     Defens)
	      of
	    #m_arena_elite_defens{formations = Formations} ->
		PushFormations = [{OrderT, FormationTypeT,
				   [Temp
				    || Temp = #formation_pos{id = IdT}
					   <- PosInfoT,
				       partner_lib:get_partner(Role, IdT) =/=
					 false],
				   HallowsIdT}
				  || {OrderT, FormationTypeT, PosInfoT,
				      HallowsIdT}
					 <- Formations],
		case [1 || E <- PushFormations, element(3, E) =/= []] of
		  [_ | _] -> {ok, Role, PushFormations};
		  _ ->
		      #formation_lineup{pos_info = PosInfo,
					type = FormationType,
					hallows_id = HallowsId} =
			  formation_lib:query_formation_info_without_resonate(Role),
		      Formations1 = [{1, FormationType, PosInfo, HallowsId}],
		      NewDefens = lists:keystore(Type,
						 #m_arena_elite_defens.type,
						 Defens,
						 #m_arena_elite_defens{type =
									   Type,
								       formations
									   =
									   Formations1}),
		      NewArenaElite = ArenaElite#m_arena_elite{defens =
								   NewDefens},
		      PushFormations1 = [{OrderT, FormationTypeT,
					  [Temp
					   || Temp = #formation_pos{id = IdT}
						  <- PosInfoT,
					      partner_lib:get_partner(Role, IdT)
						=/= false],
					  HallowsIdT}
					 || {OrderT, FormationTypeT, PosInfoT,
					     HallowsIdT}
						<- Formations1],
		      {ok, Role#role{m_arena_elite = NewArenaElite},
		       PushFormations1}
		end;
	    _ when Type == 1 ->
		#formation_lineup{pos_info = PosInfo,
				  type = FormationType,
				  hallows_id = HallowsId} =
		    formation_lib:query_formation_info_without_resonate(Role),
		Formations = [{1, FormationType, PosInfo, HallowsId}],
		NewDefens = lists:keystore(Type,
					   #m_arena_elite_defens.type, Defens,
					   #m_arena_elite_defens{type = Type,
								 formations =
								     Formations}),
		NewArenaElite = ArenaElite#m_arena_elite{defens =
							     NewDefens},
		PushFormations = [{OrderT, FormationTypeT,
				   [Temp
				    || Temp = #formation_pos{id = IdT}
					   <- PosInfoT,
				       partner_lib:get_partner(Role, IdT) =/=
					 false],
				   HallowsIdT}
				  || {OrderT, FormationTypeT, PosInfoT,
				      HallowsIdT}
					 <- Formations],
		{ok, Role#role{m_arena_elite = NewArenaElite},
		 PushFormations};
	    _ ->
		{ok,
		 Role2 = #role{m_arena_elite =
				   NArenaElite = #m_arena_elite{defens =
								    Defens2}},
		 Formations} =
		    get_formation_sys(Role, 1),
		NewDefens = lists:keystore(Type,
					   #m_arena_elite_defens.type, Defens2,
					   #m_arena_elite_defens{type = Type,
								 formations =
								     Formations}),
		NewArenaElite = NArenaElite#m_arena_elite{defens =
							      NewDefens},
		PushFormations = [{OrderT, FormationTypeT,
				   [Temp
				    || Temp = #formation_pos{id = IdT}
					   <- PosInfoT,
				       partner_lib:get_partner(Role, IdT) =/=
					 false],
				   HallowsIdT}
				  || {OrderT, FormationTypeT, PosInfoT,
				      HallowsIdT}
					 <- Formations],
		{ok, Role2#role{m_arena_elite = NewArenaElite},
		 PushFormations}
	  end;
      _ -> {ok, Role, []}
    end.

-spec set_formation_sys(#role{}, pos_integer(),
			list()) -> {ok, #role{}} | {false, binary()}.

set_formation_sys(Role = #role{m_arena_elite =
				   ArenaElite = #m_arena_elite{defens = Defens,
							       rival_info =
								   RivalInfo}},
		  Type, Formations) ->
    CanSetFotmation = case get(arena_elite_is_in_combat) of
			true -> true;
			_ when RivalInfo == [] -> true;
			_ -> false
		      end,
    case CanSetFotmation of
      true ->
	  case check_can_set(Role, Type, Formations) of
	    {false, Msg} -> {false, Msg};
	    {ok, NFormations} ->
		NewDefens = lists:keystore(Type,
					   #m_arena_elite_defens.type, Defens,
					   #m_arena_elite_defens{type = Type,
								 formations =
								     NFormations}),
		NewArenaElite = ArenaElite#m_arena_elite{defens =
							     NewDefens},
		NewRole = Role#role{m_arena_elite = NewArenaElite},
		arena_elite_mirror:update_mirror(NewRole),
		{ok, NewRole}
	  end;
      _ -> {false, lang:get(<<"已匹配对手，不能再次布阵"/utf8>>)}
    end.

check_can_set(_, _, []) ->
    {false, lang:get(<<"至少需要布置一个英雄"/utf8>>)};
check_can_set(Role = #role{}, 1,
	      [{Order, FormationType, PosInfo, HallowsId}]) ->
    case formation:check_formation_pos_info(Role,
					    FormationType, PosInfo, HallowsId)
	of
      {false, Reason} -> {false, Reason};
      {ok, []} -> {false, lang:get(<<"至少需要上阵一个英雄"/utf8>>)};
      {ok, NewPosInfo} ->
	  {ok, [{Order, FormationType, NewPosInfo, HallowsId}]}
    end;
check_can_set(_Role, 1, Formations)
    when length(Formations) > 1 ->
    {false, lang:get(<<"常规赛最多布置1个队伍"/utf8>>)};
check_can_set(_Role, 2, Formations)
    when length(Formations) > 2 ->
    {false, lang:get(<<"王者赛最多布置2个队伍"/utf8>>)};
check_can_set(Role, 2, Formations) ->
    LimitHallowsId =
	arena_elite_data:get_constant(second_team_open_condition),
    case lists:keyfind(2, 1, Formations) of
      {_Order, _FormationType, [_ | _], _HallowsId} ->
	  case hallows_look:get_look(Role, LimitHallowsId) of
	    #hallows_looks{} ->
		case check_formations(Role, Formations, [], 0) of
		  {false, Msg} -> {false, Msg};
		  {ok, NFormations} -> {ok, NFormations}
		end;
	    _ -> {false, lang:get(<<"解锁指定神器幻化外观才可开启该编队的使用"/utf8>>)}
	  end;
      _ ->
	  case check_formations(Role, Formations, [], 0) of
	    {false, Msg} -> {false, Msg};
	    {ok, NFormations} -> {ok, NFormations}
	  end
    end.

check_formations(#role{}, [], L, _MaxPower) ->
    case [{Order, FormationType, NewPosInfo, HallowsId}
	  || {Order, FormationType, NewPosInfo, HallowsId} <- L,
	     NewPosInfo =/= []]
	of
      [] -> {false, lang:get(<<"至少需要上阵一个英雄"/utf8>>)};
      _ -> {ok, L}
    end;
check_formations(Role,
		 [{Order, FormationType, PosInfo, HallowsId}
		  | Formations],
		 L, MaxPower) ->
    case lists:keymember(HallowsId, 4, L) of
      true when HallowsId =/= 0 ->
	  {false, lang:get(<<"不同队伍不能共用同一神器"/utf8>>)};
      _ ->
	  AllPos = lists:flatten([NPosInfo
				  || {_, _, NPosInfo, _} <- L]),
	  case check_pos_info(PosInfo, AllPos) of
	    {false, Msg} -> {false, Msg};
	    _ ->
		case formation:check_formation_pos_info(Role,
							FormationType, PosInfo,
							HallowsId)
		    of
		  {false, Reason} -> {false, Reason};
		  {ok, NewPosInfo} ->
		      Power = partner_lib:get_power(Role,
						    [PId
						     || #formation_pos{id = PId}
							    <- NewPosInfo]),
		      check_formations(Role, Formations,
				       [{Order, FormationType, NewPosInfo,
					 HallowsId}
					| L],
				       max(Power, MaxPower))
		end
	  end
    end.

check_pos_info([], _AllPos) -> ok;
check_pos_info([{_Pos, Id} | PosInfo], AllPos) ->
    case lists:keymember(Id, #formation_pos.id, AllPos) of
      true -> {false, lang:get(<<"同一伙伴不能在多个队伍上阵"/utf8>>)};
      _ -> check_pos_info(PosInfo, AllPos)
    end.

-spec get_sys_formation_power(#role{}) -> pos_integer().

get_sys_formation_power(Role) ->
    Type = case get_is_king(Role) of
	     1 -> 2;
	     _ -> 1
	   end,
    {ok, _, Formations} = get_formation_sys(Role, Type),
    case Formations of
      [_ | _] ->
	  lists:max([partner_lib:get_power(Role,
					   [PId
					    || #formation_pos{id = PId}
						   <- PosInfo])
		     || {_, _, PosInfo, _} <- Formations]);
      _ -> 0
    end.

-spec get_sys_formation_star(#role{}) -> pos_integer().

get_sys_formation_star(Role) ->
    Type = case get_is_king(Role) of
	     1 -> 2;
	     _ -> 1
	   end,
    {ok, _, Formations} = get_formation_sys(Role, Type),
    case Formations of
      [_ | _] ->
	  lists:max([partner_lib:get_partner_star(Role,
						  [PId
						   || #formation_pos{id = PId}
							  <- PosInfo])
		     || {_, _, PosInfo, _} <- Formations]);
      _ -> arena_elite_data:get_constant(strength_var3)
    end.

-spec get_formation_ids(#role{}) -> pos_integer().

get_formation_ids(Role) ->
    case check_open(Role) of
      {false, _Msg} -> [];
      {ok, idle, _Ts, _TimeOut, _Period} -> [];
      _ ->
	  Formations = case get_is_king(Role) of
			 1 ->
			     {ok, _, Formations1} = get_formation_sys(Role, 2),
			     {ok, _, Formations2} = get_formation_sys(Role, 1),
			     Formations1 ++ Formations2;
			 _ ->
			     {ok, _, Formations1} = get_formation_sys(Role, 1),
			     Formations1
		       end,
	  PosInfos = lists:flatten([PosInfo
				    || {_, _, PosInfo, _} <- Formations]),
	  [PId || #formation_pos{id = PId} <- PosInfos]
    end.

do_calc_new_lev(Period, NewPeriod, Lev)
    when NewPeriod > Period ->
    NewLev = arena_elite_data:get_ref_lev(Lev),
    do_calc_new_lev(Period + 1, NewPeriod, NewLev);
do_calc_new_lev(_Period, _NewPeriod, Lev) -> Lev.

init_new_period(Role = #role{m_arena_elite =
				 MArenaElite = #m_arena_elite{period = Period,
							      lev = Lev,
							      log = Log,
							      score = Score,
							      old_rank =
								  OldRank}},
		NewPeriod) ->
    NewLev = do_calc_new_lev(Period, NewPeriod, Lev),
    NewOldRank = case NewPeriod =< 1 of
		   true -> [];
		   _ ->
		       lists:keystore(NewPeriod - 1, 1, OldRank,
				      {NewPeriod - 1, {Lev, Score}})
		 end,
    NewLog = util:if_true(NewPeriod =< 1, [], Log),
    NewMArenaElite = MArenaElite#m_arena_elite{lev = NewLev,
					       score = 0, period = NewPeriod,
					       init_lev = NewLev,
					       day_combat_count =
						   arena_elite_data:get_constant(match_count),
					       day_buy_count = 0,
					       frist_ref_time = 0,
					       ref_count = 0, match_cd_time = 0,
					       had_combat_num = 0, is_skip = 0,
					       lev_reward = init_arward(NewLev),
					       promoted_info = [],
					       old_rank = NewOldRank,
					       log = NewLog, rival_info = [],
					       max_day_buy_count =
						   arena_elite_data:get_constant(buy_count)},
    Now = date:unixtime(),
    ArenaElitePower = get_sys_formation_power(Role),
    MaxStar = get_sys_formation_star(Role),
    Role#role{m_arena_elite = NewMArenaElite,
	      arena_elite_power_time = Now,
	      arena_elite_power = ArenaElitePower,
	      arena_elite_max_star = MaxStar}.

init_arward(NewLev) ->
    [{Lev, 0}
     || Lev <- arena_elite_data:get_all_award_ids(),
	Lev >= NewLev andalso Lev > 1].

get_arena_elite_state() ->
    case sys_env:get(arena_elite_open_state) of
      {Ts, TimeOutT, StateT} -> {Ts, TimeOutT, StateT};
      _ ->
	  NextOpenTime = arena_elite_data:get_constant(open_time),
	  TimeOutT = date:next_diff(NextOpenTime) * 1000,
	  {0, TimeOutT, idle}
    end.


