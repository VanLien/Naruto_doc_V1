-file("data/sky_ladder.erl", 1).

-file("src/mod/sky_ladder/sky_ladder.erl", 1).

-module(sky_ladder).

-lager_records([{sprite_plan,
		 [ver, id, name, plan_sprites]},
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{guild_log, [key, list]}, {s_timer, [ref, timers]},
		{rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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
		{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
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

-export([gm/2, login/1, ready/1, zero_flush/1,
	 apply_worship_refresh/1, init/0, combat/2,
	 refresh_list/1, combat_over/4, init_refresh_list/1,
	 do_update_list/1, match/1, do_match/1, do_match/2,
	 get_target_info/2, buy_combat_num/1, buy_combat_time/1,
	 auto_combat/1, push/1, push_open/1, push_list/2,
	 push_list/3, push_def_lose/1, push_combat_num/1,
	 push_can_worship/1, role_rank/1, get_log/1,
	 set_formation/2, list_rank/1, hero_hall/0,
	 calc_best_rank_reward/2, find_partner/3,
	 is_match_range/2, check_open/1]).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 44).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 45).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 46).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 47).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 48).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 49).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 50).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/sky_ladder/sky_ladder.erl", 51).

-file("inc/log.hrl", 1).

-file("src/mod/sky_ladder/sky_ladder.erl", 52).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 53).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 54).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 55).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 56).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 57).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 58).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 59).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 60).

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

-file("src/mod/sky_ladder/sky_ladder.erl", 61).

gm(Role = #role{m_sky_ladder = MSkyLadder},
   {reset_time}) ->
    NRole = Role#role{m_sky_ladder =
			  MSkyLadder#m_sky_ladder{ref_time = 0,
						  combat_time = 0}},
    push(NRole),
    {ok, NRole};
gm(_Role, {info, Id}) ->
    if Id =:= 1 -> sky_ladder_mgr:info(add_highlight);
       Id =:= 2 -> sky_ladder_mgr:info(gm_reset_robot);
       Id =:= 3 ->
	   Env = sys_env:get(sky_ladder_cluster_info_env),
	   NewEnv = Env#{server_type => cluster},
	   sys_env:save(sky_ladder_cluster_info_env, NewEnv);
       Id =:= 4 ->
	   Env = sys_env:get(sky_ladder_cluster_info_env),
	   NewEnv = Env#{server_type => merge},
	   sys_env:save(sky_ladder_cluster_info_env, NewEnv);
       true -> skip
    end;
gm(Role, {reset_worship}) ->
    NRole = role_timer:set(#timer{id =
				      sky_ladder_worship_timer,
				  m = sky_ladder, f = apply_worship_refresh,
				  timeout = 10 * 1000},
			   Role),
    {ok, NRole};
gm(_Role, {open, Status}) ->
    case Status =:= 1 of
      true ->
	  sky_ladder_mgr:send_info(sky_ladder_mgr, info,
				   [gm_open]);
      _ ->
	  sky_ladder_mgr:send_info(sky_ladder_mgr, info,
				   [gm_close])
    end,
    ok.

-spec init() -> #m_sky_ladder{}.

init() -> #m_sky_ladder{}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{}) -> {ok, Role}.

ready(Role) -> push_combat_num(Role), ok.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_sky_ladder = MSkyLadder}) ->
    NRole = Role#role{m_sky_ladder =
			  MSkyLadder#m_sky_ladder{can_combat_num =
						      sky_ladder_data:get_const(join_times),
						  buy_combat_num = 0,
						  worship = 0,
						  worship_list = []}},
    push(NRole),
    push_can_worship(NRole),
    {ok, NRole}.

-spec apply_worship_refresh(#role{}) -> {ok, #role{}} |
					ok.

apply_worship_refresh(Role = #role{m_sky_ladder =
				       MSkyLadder =
					   #m_sky_ladder{next_reset_nine =
							     ResetNine}}) ->
    Now = date:unixtime(),
    case Now >= ResetNine of
      true ->
	  NextNine = date:next_diff(21, 0, 30),
	  NewMSkyLadder = MSkyLadder#m_sky_ladder{worship = 0,
						  worship_list = [],
						  next_reset_nine =
						      Now + NextNine},
	  Role1 = Role#role{m_sky_ladder = NewMSkyLadder},
	  NewRole = role_timer:set(#timer{id =
					      sky_ladder_worship_timer,
					  m = sky_ladder,
					  f = apply_worship_refresh,
					  timeout = max(1, NextNine) * 1000},
				   Role1),
	  sys_conn:pack_send(24313, {1}),
	  {ok, NewRole};
      _ -> ok
    end.

-spec combat(#role{}, role_id()) -> {ok, #role{}} |
				    {false, bitstring()} |
				    {false, bitstring(), #role{}}.

combat(#role{m_sky_ladder =
		 #m_sky_ladder{can_combat_num = 0}},
       _TarRoleId) ->
    {false, lang:get(<<"Những thách thức không đủ"/utf8>>)};
combat(#role{id = RoleId}, RoleId) ->
    {false,
     lang:get(<<"Tôi không bao giờ nghĩ rằng tôi sẽ gặp "
		"lại chính mình.!"/utf8>>)};
combat(Role = #role{id = RoleId,
		    m_sky_ladder =
			MSkyLadder = #m_sky_ladder{ref_list = RefList}},
       TarRoleId) ->
    Now = date:unixtime(),
    case check_can_combat([is_open, lev, cooltime,
			   combat_type, arena],
			  Role, #{now => Now})
	of
      ok ->
	  case lists:keyfind(TarRoleId, #sky_ladder_f.id, RefList)
	      of
	    F = #sky_ladder_f{idx = Idx, rank = Rank0,
			      name = TarName, formation_type = BFormationType,
			      formation_lev = BFormationLev} ->
		case sky_ladder_mgr:fight_begin(Role, Rank0, TarRoleId)
		    of
		  {ok, Rank} ->
		      {AFormationType, AFormationLev, FightPos,
		       FormationArgs} =
			  formation_lib:combat_formation_info(Role),
		      AtkGroup0 = combat_lib:gen_fight_objects(Role,
							       FightPos),
		      AtkGroup1 = sprite_tree:gen_fight_object_type(Role, 9)
				    ++
				    hallows_lib:gen_fight_object(Role,
								 maps:get(hallows_id,
									  FormationArgs,
									  0))
				      ++ AtkGroup0,
		      case gen_def_fight_objects(Role, F) of
			{false, Reason} ->
			    sky_ladder_mgr:del_combat(RoleId, Rank),
			    {false, Reason};
			{false, Reason, NewPList} ->
			    sky_ladder_mgr:del_combat(RoleId, Rank),
			    NewF = F#sky_ladder_f{pos_info = NewPList},
			    NewRefList = lists:keyreplace(TarRoleId,
							  #sky_ladder_f.id,
							  RefList, NewF),
			    NewRole = Role#role{m_sky_ladder =
						    MSkyLadder#m_sky_ladder{ref_list
										=
										NewRefList}},
			    push_list(NewRole, 1, TarRoleId),
			    {false, Reason, NewRole};
			{ok, DefGroup, SpriteLev, Sprites} ->
			    AtkGroup = combat_attr:calc(AtkGroup1, 18, Role),
			    MyRank = sky_ladder:role_rank(RoleId),
			    ReplayInfo0 = replay_hall:convert(#replay_info{}, a,
							      Role,
							      #{formation_type
								    =>
								    AFormationType,
								rank => MyRank,
								type => 9}),
			    ReplayInfo = replay_hall:convert(ReplayInfo0, b, F,
							     #{formation_type =>
								   BFormationType,
							       rank => Rank,
							       sprite_lev =>
								   SpriteLev,
							       sprites =>
								   Sprites}),
			    Args = #{on_role_combat_end =>
					 {sky_ladder, combat_over, [{F, Now}]},
				     replay_info => ReplayInfo,
				     formation =>
					 [{1, AFormationType, AFormationLev},
					  {2, BFormationType, BFormationLev}],
				     ext_args =>
					 [{is_show_panel, false},
					  {save_replay, true}],
				     target_role_name => TarName},
			    case combat_lib:start_combat(Role, 18, AtkGroup,
							 [DefGroup], Args)
				of
			      {false, Reason} ->
				  sky_ladder_mgr:del_combat(RoleId, Rank),
				  {false, Reason};
			      {ok, ComPid} ->
				  sky_ladder_mgr:set_combat_pid(RoleId, Rank,
								ComPid),
				  NewRole = Role#role{m_sky_ladder =
							  MSkyLadder#m_sky_ladder{combat_time
										      =
										      Now
											+
											sky_ladder_data:get_const(battle_cd)}},
				  NewRole2 =
				      role_trigger:fire([#evt_cross_server_ladder{}],
							NewRole),
				  {ok, NewRole2}
			    end
		      end;
		  skip ->
		      role:redirect(Role#role.pid, 24301, {}),
		      {false,
		       lang:get(<<"Bậc thang của mùa giải này đã kết thúc"/utf8>>)};
		  {false, Msg, all} ->
		      NewRefList = match(Role),
		      NewRidRank = sky_ladder_lib:role_rank(RoleId),
		      NRole = Role#role{m_sky_ladder =
					    MSkyLadder#m_sky_ladder{ref_list =
									NewRefList,
								    merge_index
									=
									NewRidRank}},
		      push_list(NRole, 0),
		      {false, Msg, NRole};
		  {false, Msg, one} ->
		      NewOne = match_one(Role, Idx),
		      RefListT = lists:keydelete(Idx, #sky_ladder_f.idx,
						 RefList),
		      NewRefList = NewOne ++ RefListT,
		      NRole = Role#role{m_sky_ladder =
					    MSkyLadder#m_sky_ladder{ref_list =
									NewRefList}},
		      push_list(NRole, 0),
		      {false, Msg, NRole};
		  {false, Msg, _NewRank} ->
		      role:redirect(Role#role.pid, 24301, {}), {false, Msg};
		  {false, Msg} -> {false, Msg};
		  _ERR ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidsky_ladder206, _,
			 {__Levelsky_ladder206, __Tracessky_ladder206}}
			    when __Levelsky_ladder206 band 8 /= 0 orelse
				   __Tracessky_ladder206 /= [] ->
			    lager:do_log(error,
					 [{module, sky_ladder},
					  {function, combat}, {line, 206},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("【~ts】跨服天梯请求挑战状态时返回异常【~w】",
						       [Role#role.name, _ERR]),
					 none, 4096, 8, __Levelsky_ladder206,
					 __Tracessky_ladder206, lager_event,
					 __Pidsky_ladder206);
			_ -> ok
		      end,
		      {false,
		       lang:get(<<"Không thể thách thức tại thời điểm này, "
				  "vui lòng thử lại sau"/utf8>>)}
		end;
	    _ ->
		{false,
		 lang:get(<<"Mục tiêu không có trong danh sách"/utf8>>)}
	  end;
      {false, Msg} -> {false, Msg}
    end.

check_can_combat([lev | Other], Role = #role{lev = Lev},
		 Cache) ->
    OpenLev = sky_ladder_data:get_const(join_min_lev),
    case Lev < OpenLev of
      true -> {false, lang:get(<<"Cấp độ không đủ"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([cooltime | Other],
		 Role = #role{m_sky_ladder =
				  #m_sky_ladder{combat_time = NextTime}},
		 Cache = #{now := Now}) ->
    case Now < NextTime of
      true ->
	  {false, lang:get(<<"Thách thức làm mát"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([combat_type | Other], Role, Cache) ->
    case combat_lib:in_type_combat(Role, 18) of
      true ->
	  {false, lang:get(<<"Thử thách đang diễn ra"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([arena | Other],
		 Role = #role{id = RoleId}, Cache) ->
    ArenaRank = arena_lib:role_rank(RoleId),
    LimitRank = sky_ladder_data:get_const(arena_rank),
    case ArenaRank =/= 0 andalso ArenaRank =< LimitRank of
      false ->
	  {false,
	   util:fbin(lang:get(<<"Yêu cầu Xếp hạng Đấu trường~wtên"/utf8>>),
		     [LimitRank])};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([is_open | Other], Role, Cache) ->
    case sky_ladder_mgr:is_open() of
      false ->
	  {false,
	   lang:get(<<"Cuộc thi leo thang bắt đầu lúc 00:00 "
		      "thứ Bảy hàng tuần"/utf8>>)};
      _ -> check_can_combat(Other, Role, Cache)
    end;
check_can_combat([], _Role, _Cache) -> ok.

gen_def_fight_objects(Role,
		      #sky_ladder_f{id = TarRoleId, robot_id = RobotId})
    when RobotId > 0 ->
    case robot:gen_fight_objects(Role, RobotId, #{},
				 TarRoleId)
	of
      [] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsky_ladder260, _,
	     {__Levelsky_ladder260, __Tracessky_ladder260}}
		when __Levelsky_ladder260 band 8 /= 0 orelse
		       __Tracessky_ladder260 /= [] ->
		lager:do_log(error,
			     [{module, sky_ladder},
			      {function, gen_def_fight_objects}, {line, 260},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w跨服天梯场景怪配置出错", [RobotId]), none,
			     4096, 8, __Levelsky_ladder260,
			     __Tracessky_ladder260, lager_event,
			     __Pidsky_ladder260);
	    _ -> ok
	  end,
	  {false,
	   lang:get(<<"Không lấy được dữ liệu của bên kia"/utf8>>)};
      DefendList = [_ | _] -> {ok, DefendList, 0, []}
    end;
gen_def_fight_objects(Role,
		      AF = #sky_ladder_f{id = TarRoleId,
					 pos_info = PosInfo}) ->
    case role_robot:get_role(TarRoleId) of
      {ok, Robot = #role_robot{partners = Partners}} ->
	  {SpriteLev, Sprites} = sprite_tree:get_sprite_lev(Robot,
							    9),
	  #formation_sys{pos_info = NewPosInfo,
			 hallows_id = HallowsId} =
	      formation:get_sys_formation(Robot, 9),
	  OldP = [Id || #sky_ladder_f_pos{id = Id} <- PosInfo],
	  NewP = [Id || #formation_pos{id = Id} <- NewPosInfo],
	  case NewP -- OldP =:= [] andalso OldP -- NewP =:= [] of
	    true ->
		FOList1 = sprite_tree:gen_fight_object_type(Robot, 9) ++
			    hallows_lib:gen_fight_object(Robot, HallowsId) ++
			      [gen_fight_object_(P, AF, Robot, Role)
			       || P <- PosInfo],
		FOList = combat_attr:calc(FOList1, 18, Robot),
		{ok, FOList, SpriteLev, Sprites};
	    _ ->
		NewPList = gen_sky_ladder_f_pos(NewPosInfo, Partners),
		{false,
		 lang:get(<<"Đội hình của đội đối phương đã thay "
			    "đổi"/utf8>>),
		 NewPList}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Không lấy được dữ liệu của bên kia"/utf8>>)}
    end.

gen_fight_object_(#sky_ladder_f_pos{pos = Pos, id = PId,
				    bid = Bid, lev = Lev, star = Star,
				    use_skin = UseSkin, speed = Speed,
				    atk = Atk, def = Def, hp = Hp,
				    break_lev = BreakLev},
		  #sky_ladder_f{formation_type = FormationType},
		  Robot = #role_robot{id = RoleId, partners = Partners,
				      name = Name},
		  Role) ->
    #formation_data{pos = FightPos} =
	formation_data:get_formation(FormationType),
    Pos1 = list_util:keyfind(Pos, FightPos),
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
					       {__Pidsky_ladder291, _,
						{__Levelsky_ladder291,
						 __Tracessky_ladder291}}
						   when __Levelsky_ladder291
							  band 64
							  /= 0
							  orelse
							  __Tracessky_ladder291
							    /= [] ->
						   lager:do_log(info,
								[{module,
								  sky_ladder},
								 {function,
								  gen_fight_object_},
								 {line, 291},
								 {pid,
								  pid_to_list(self())},
								 {node, node()}
								 | lager:md()],
								io_lib:format("玩家[~ts]伙伴已不存在:~w",
									      [Name,
									       Bid]),
								none, 4096, 64,
								__Levelsky_ladder291,
								__Tracessky_ladder291,
								lager_event,
								__Pidsky_ladder291);
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
									      use_skin
										  =
										  UseSkin,
									      break_lev
										  =
										  BreakLev})
				       end,
    P1 = P#partner{all_attr =
		       AllAttr#attr{speed = Speed, atk = Atk, def = Def,
				    hp = Hp, hp_max = Hp},
		   lev = Lev, star = Star, use_skin = UseSkin,
		   break_lev = BreakLev},
    FO1 = partner_lib:gen_fight_object(Robot, 0, P1,
				       combat_lib:is_leader(Pos), RoleId, 1),
    FO1#fight_object{pos = Pos1}.

combat_over(Role = #role{id = RoleId, name = RoleName,
			 guild_bag = #guild_bag{name = GuildName},
			 m_sky_ladder =
			     MSkyLadder = #m_sky_ladder{can_combat_num =
							    CanCombatNum,
							acc_combat_num =
							    AccCombatNum,
							best_rank =
							    OldBestRank}},
	    CombatResult = #combat_result{replay_id = ReplayId,
					  result = Result,
					  hurt_statistics = HurtStatistics},
	    #combat{target_role_name = TargetName},
	    {F = #sky_ladder_f{id = DefRid}, FightTime}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder301, _,
       {__Levelsky_ladder301, __Tracessky_ladder301}}
	  when __Levelsky_ladder301 band 128 /= 0 orelse
		 __Tracessky_ladder301 /= [] ->
	  lager:do_log(debug,
		       [{module, sky_ladder}, {function, combat_over},
			{line, 301}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w,~ts]=====~w ret-=~w",
				     [RoleId, RoleName, F, Result]),
		       none, 4096, 128, __Levelsky_ladder301,
		       __Tracessky_ladder301, lager_event, __Pidsky_ladder301);
      _ -> ok
    end,
    {ok, AtkSKR} = role_convert:do(sky_ladder_role, Role),
    case sky_ladder_mgr:fight_end({AtkSKR, DefRid,
				   CombatResult, OldBestRank, FightTime})
	of
      {ok,
       FightResult = #sky_ladder_result{is_change_best_rank =
					    IsChangeBestRank,
					atk_old_rank = AtkOldRank,
					atk_rank = NewAtkRank}} ->
	  BestReward = case IsChangeBestRank of
			 1 -> calc_best_rank_reward(NewAtkRank, OldBestRank);
			 _ -> []
		       end,
	  CommonReward = case Result of
			   1 -> sky_ladder_data:get_const(win_reward);
			   _ -> sky_ladder_data:get_const(lose_reward)
			 end,
	  AllRewards = item_lib:merge(BestReward, CommonReward),
	  GL = format:val_to_gain(AllRewards, sky_ladder_combat),
	  Role1 = case role_gain:do(Role, GL) of
		    {false, _} -> Role;
		    {ok, RoleT} -> RoleT
		  end,
	  RefList = match(Role1),
	  NewMSkyLadder = MSkyLadder#m_sky_ladder{ref_list =
						      RefList,
						  best_rank =
						      util:if_true(IsChangeBestRank
								     =:= 1,
								   NewAtkRank,
								   OldBestRank),
						  can_combat_num =
						      max(0, CanCombatNum - 1),
						  acc_combat_num =
						      AccCombatNum + 1,
						  merge_index = NewAtkRank},
	  Role2 = Role1#role{m_sky_ladder = NewMSkyLadder},
	  NewRole = case Result of
		      1 ->
			  role_trigger:fire([#evt_sky_ladder_rank{rank =
								      NewAtkRank},
					     #evt_sky_ladder_win{}],
					    Role2);
		      _ ->
			  role_trigger:fire(#evt_sky_ladder_rank{rank =
								     NewAtkRank},
					    Role2)
		    end,
	  log:save(join,
		   {NewRole, <<"功能玩法"/utf8>>, <<"跨服天梯"/utf8>>}),
	  log:log_gain(GL, Role, NewRole, <<"跨服天梯"/utf8>>,
		       util:fbin("排名【~w】到【~w】奖励, 胜负情况【~w】",
				 [AtkOldRank, NewAtkRank, Result])),
	  NewFightResult = FightResult#sky_ladder_result{reward =
							     AllRewards},
	  case Result of
	    1 ->
		notice_msg(RoleId, GuildName, RoleName, FightResult),
		notice_mail(RoleId, GuildName, RoleName, FightResult);
	    _ -> skip
	  end,
	  sys_conn:pack_send(24307,
			     {NewFightResult, TargetName, HurtStatistics,
			      ReplayId}),
	  log(NewRole, CombatResult, F, NewFightResult),
	  push(NewRole),
	  push_list(NewRole, 0),
	  push_combat_num(NewRole),
	  {ok, NewRole};
      skip ->
	  CommonReward = case Result of
			   1 -> sky_ladder_data:get_const(win_reward);
			   _ -> sky_ladder_data:get_const(lose_reward)
			 end,
	  GL = format:val_to_gain(CommonReward,
				  sky_ladder_combat),
	  Role1 = case role_gain:do_notice(Role, GL) of
		    {false, _} -> Role;
		    {ok, RoleT} -> RoleT
		  end,
	  RefList = match(Role1),
	  NewRole = Role1#role{m_sky_ladder =
				   MSkyLadder#m_sky_ladder{ref_list = RefList,
							   merge_index = 0}},
	  log:save(join,
		   {NewRole, <<"功能玩法"/utf8>>, <<"跨服天梯"/utf8>>}),
	  log:log_gain(GL, Role, NewRole, <<"跨服天梯"/utf8>>,
		       util:fbin("挑战过程中结束了天梯，胜负情况~w", [Result])),
	  notice:alert(lang:get(<<"Bậc thang của mùa giải này đã kết thúc"/utf8>>)),
	  push(NewRole),
	  push_list(NewRole, 0),
	  push_combat_num(NewRole),
	  {ok, NewRole};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsky_ladder364, _,
	     {__Levelsky_ladder364, __Tracessky_ladder364}}
		when __Levelsky_ladder364 band 8 /= 0 orelse
		       __Tracessky_ladder364 /= [] ->
		lager:do_log(error,
			     [{module, sky_ladder}, {function, combat_over},
			      {line, 364}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]战斗结束，上报战斗结果错误[Err:~w]",
					   [Role#role.name, Err]),
			     none, 4096, 8, __Levelsky_ladder364,
			     __Tracessky_ladder364, lager_event,
			     __Pidsky_ladder364);
	    _ -> ok
	  end,
	  {ok, Role}
    end.

log(Role = #role{id = RoleId = {_, ReplaySrvId},
		 name = Name, lev = Lev, sex = Sex, face_id = Face,
		 m_avatar = #m_avatar{used = AvatarId}, power = Power},
    #combat_result{replay_id = ReplayId, result = Result},
    #sky_ladder_f{robot_id = RobotId,
		  id = BRoleId = {_, BSrvId}, name = BName, lev = BLev,
		  sex = BSex, face = BFace, avatar_id = BAvatarId,
		  power = BPower, face_update_time = BFaceUpdateTime,
		  face_file = BFaceFile},
    #sky_ladder_result{atk_rank = AtkRank,
		       def_rank = DefRank, atk_change_rank = AtkChangeRank,
		       def_old_rank = DefOldRank,
		       atk_old_rank = AtkOldRank}) ->
    Now = date:unixtime(),
    Ret = util:if_true(Result =:= 1, 1, 2),
    AtkRankType = util:if_true(AtkChangeRank > 0, 1, 0),
    ALog = #sky_ladder_pk_log{rid = BRoleId, name = BName,
			      lev = BLev, sex = BSex, face = BFace,
			      avatar_id = BAvatarId, power = BPower, ret = Ret,
			      replay_id = ReplayId, rank_type = AtkRankType,
			      rank = AtkRank, time = Now, old_rank = AtkOldRank,
			      enemy_old_rank = DefOldRank,
			      face_update_time = BFaceUpdateTime,
			      face_file = BFaceFile},
    {_, FaceFile, FaceUpdateTime} =
	role_face:face_info(Role),
    sky_ladder_mgr:send_info(sky_ladder_mgr, info,
			     [{add_log, RoleId, Name, Face, ALog, ReplaySrvId,
			       FaceUpdateTime, FaceFile}]),
    case RobotId of
      0 ->
	  BRet = util:if_true(Result =:= 1, 2, 1),
	  DefRankType = util:if_true(AtkRankType =:= 1, 2, 0),
	  BLog = #sky_ladder_pk_log{rid = RoleId, name = Name,
				    lev = Lev, sex = Sex, face = Face,
				    avatar_id = AvatarId, power = Power,
				    type = 2, ret = BRet, replay_id = ReplayId,
				    rank_type = DefRankType, rank = DefRank,
				    time = Now, old_rank = DefOldRank,
				    enemy_old_rank = AtkOldRank,
				    face_update_time = FaceUpdateTime,
				    face_file = FaceFile},
	  cluster_lib:cast(BSrvId, var, acc_role_var,
			   [BRoleId, other, 7, 0]),
	  role:pack_send(BRoleId, 24314, {1}),
	  sky_ladder_mgr:send_info(sky_ladder_mgr, info,
				   [{add_log, BRoleId, BName, BFace, BLog,
				     ReplaySrvId, FaceUpdateTime, FaceFile}]);
      _ -> skip
    end;
log(_Role, _CombatResult, _SkyLadderF, _FightResult) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsky_ladder389, _,
       {__Levelsky_ladder389, __Tracessky_ladder389}}
	  when __Levelsky_ladder389 band 8 /= 0 orelse
		 __Tracessky_ladder389 /= [] ->
	  lager:do_log(error,
		       [{module, sky_ladder}, {function, log}, {line, 389},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]写日志失败 get_fight=~w",
				     [_Role#role.name, _SkyLadderF]),
		       none, 4096, 8, __Levelsky_ladder389,
		       __Tracessky_ladder389, lager_event, __Pidsky_ladder389);
      _ -> ok
    end.

-spec auto_combat(#role{}) -> {ok, #role{}} |
			      {false, binary()}.

auto_combat(#role{m_sky_ladder =
		      #m_sky_ladder{can_combat_num = 0}}) ->
    {false, lang:get(<<"Những thách thức không đủ"/utf8>>)};
auto_combat(Role = #role{m_sky_ladder =
			     MSkyLadder = #m_sky_ladder{can_combat_num =
							    CanCombatNum,
							acc_combat_num =
							    AccCombatNum}}) ->
    Now = date:unixtime(),
    case check_can_combat([is_open, lev, combat_type,
			   arena],
			  Role, #{now => Now})
	of
      ok ->
	  Rewards = sky_ladder_data:get_const(swap_times),
	  GL = format:val_to_gain(Rewards, sky_ladder_combat),
	  case role_gain:do_notice(Role, GL) of
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    {ok, Role1} ->
		NRole = Role1#role{m_sky_ladder =
				       MSkyLadder#m_sky_ladder{can_combat_num =
								   CanCombatNum
								     - 1,
							       acc_combat_num =
								   AccCombatNum
								     + 1}},
		log:log_gain(GL, Role, NRole, <<"跨服天梯"/utf8>>,
			     lang:get(<<"Thử thách leo rank liên máy chủ chỉ "
					"bằng một cú nhấp chuột"/utf8>>)),
		push(NRole),
		push_combat_num(NRole),
		NewRole2 =
		    role_trigger:fire([#evt_cross_server_ladder{},
				       #evt_sky_ladder_win{}],
				      NRole),
		{ok, NewRole2}
	  end;
      {false, Msg} -> {false, Msg}
    end.

calc_best_rank_reward(BestRank, 0) ->
    MaxRank = sky_ladder_data:max_best_rank(),
    do_calc_best_rank_reward(BestRank, MaxRank + 1, []);
calc_best_rank_reward(BestRank, OldBestRank) ->
    do_calc_best_rank_reward(BestRank, OldBestRank, []).

do_calc_best_rank_reward(BestRank, OldBestRank, L)
    when BestRank >= OldBestRank ->
    L;
do_calc_best_rank_reward(BestRank, OldBestRank, L) ->
    case sky_ladder_data:best_rank_reward(BestRank) of
      {_MinRank, MaxRank, Reward} ->
	  case OldBestRank > MaxRank of
	    true ->
		RewardCount = MaxRank - BestRank + 1,
		NewReward = [{IdT, NumT * RewardCount}
			     || {IdT, NumT} <- Reward],
		NewL = item_lib:merge(NewReward, L),
		do_calc_best_rank_reward(MaxRank + 1, OldBestRank,
					 NewL);
	    _ ->
		RewardCount = OldBestRank - BestRank,
		NewReward = [{IdT, NumT * RewardCount}
			     || {IdT, NumT} <- Reward],
		NewL = item_lib:merge(NewReward, L),
		NewL
	  end;
      _ -> L
    end.

-spec check_open(#role{}) -> true | false.

check_open(#role{lev = Lev}) ->
    Lev >= sky_ladder_data:get_const(join_min_lev) andalso
      sky_ladder_mgr:is_open().

-spec init_refresh_list(#role{}) -> #role{}.

init_refresh_list(Role = #role{m_sky_ladder =
				   MSkyLadder = #m_sky_ladder{ref_list =
								  []}}) ->
    case check_open(Role) of
      true ->
	  EndTime = sky_ladder_mgr:end_time(),
	  RefList = match(Role),
	  Role#role{m_sky_ladder =
			MSkyLadder#m_sky_ladder{ref_list = RefList,
						season_idx = EndTime,
						merge_index = 0}};
      _ ->
	  NewRefList = rand_look(),
	  Role#role{m_sky_ladder =
			MSkyLadder#m_sky_ladder{ref_list = NewRefList,
						merge_index = 0}}
    end;
init_refresh_list(Role = #role{m_sky_ladder =
				   MSkyLadder = #m_sky_ladder{ref_list =
								  RefList,
							      season_idx =
								  OldEndTime}}) ->
    case check_open(Role) of
      true ->
	  EndTime = sky_ladder_mgr:end_time(),
	  Now = date:unixtime(),
	  case RefList of
	    [#sky_ladder_f{id = {0, <<>>}} | _] ->
		NewRefList = match(Role),
		Role#role{m_sky_ladder =
			      MSkyLadder#m_sky_ladder{ref_list = NewRefList,
						      season_idx = EndTime,
						      merge_index = 0}};
	    [#sky_ladder_f{} | _] when Now > OldEndTime ->
		NewRefList = match(Role),
		Role#role{m_sky_ladder =
			      MSkyLadder#m_sky_ladder{ref_list = NewRefList,
						      season_idx = EndTime,
						      merge_index = 0}};
	    [#sky_ladder_f{} | _] ->
		NewRefList = update_list(Role, RefList),
		Role#role{m_sky_ladder =
			      MSkyLadder#m_sky_ladder{ref_list = NewRefList}};
	    _ ->
		NewRefList = match(Role),
		Role#role{m_sky_ladder =
			      MSkyLadder#m_sky_ladder{ref_list = NewRefList,
						      season_idx = EndTime}}
	  end;
      _ ->
	  NewRefList = case rand_look(RefList, []) of
			 [] -> RefList;
			 I -> I
		       end,
	  Role#role{m_sky_ladder =
			MSkyLadder#m_sky_ladder{ref_list = NewRefList,
						merge_index = 0}}
    end.

update_list(Role, RefList) ->
    case sky_ladder_mgr:send_call(sky_ladder,
				  do_update_list, [RefList])
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
	    {__Pidsky_ladder490, _,
	     {__Levelsky_ladder490, __Tracessky_ladder490}}
		when __Levelsky_ladder490 band 8 /= 0 orelse
		       __Tracessky_ladder490 /= [] ->
		lager:do_log(error,
			     [{module, sky_ladder}, {function, update_list},
			      {line, 490}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("更新天梯数据列表失败[~ts][~w]",
					   [Msg, RefList]),
			     none, 4096, 8, __Levelsky_ladder490,
			     __Tracessky_ladder490, lager_event,
			     __Pidsky_ladder490);
	    _ -> ok
	  end,
	  RefList;
      L = [_ | _] ->
	  Fun = fun (SLF = #sky_ladder_f{robot_id = RobotId}, Acc)
			when RobotId > 0 ->
			#{partners := PL, formation := FormationType,
			  hallows := {HallowsId, _, _}} =
			    robot:get(Role, RobotId, #{max_num => 5}),
			{PosInfo, AllPower} = enemy_partner_robot_info(PL, [],
								       0),
			NewSLF = SLF#sky_ladder_f{pos_info = PosInfo,
						  formation_type =
						      FormationType,
						  hallows_id = HallowsId,
						  power = AllPower},
			[NewSLF | Acc];
		    (SLF = #sky_ladder_f{}, Acc) -> [SLF | Acc]
		end,
	  NewL = lists:foldl(Fun, [], L),
	  NewL
    end.

-spec do_update_list(list()) -> list().

do_update_list(RefList) -> do_update_list(RefList, []).

do_update_list([], NewL) -> NewL;
do_update_list([F = #sky_ladder_f{} | Rest], L) ->
    NewF = do_update_list(F, L),
    do_update_list(Rest, [NewF | L]);
do_update_list(F = #sky_ladder_f{idx = Idx, id = Id},
	       _) ->
    case sky_ladder_lib:get_role(Id) of
      {ok, R} ->
	  case gen_sky_ladder_f(Idx, R) of
	    NewF = #sky_ladder_f{} -> NewF;
	    _ -> F
	  end;
      _ -> F
    end.

-spec refresh_list(#role{}) -> {ok, #role{}} |
			       {false, binary()}.

refresh_list(Role = #role{id = RoleId,
			  m_sky_ladder =
			      MSkyLadder = #m_sky_ladder{ref_time =
							     RefTime}}) ->
    Now = date:unixtime(),
    case sky_ladder_mgr:is_open() of
      false ->
	  {false,
	   lang:get(<<"Cuộc thi leo thang bắt đầu lúc 00:00 "
		      "thứ Bảy hàng tuần"/utf8>>)};
      _ ->
	  case Now >= RefTime of
	    false ->
		{false,
		 lang:get(<<"Đang làm mới thời gian hồi chiêu, vui "
			    "lòng đợi"/utf8>>)};
	    true ->
		NewRank = sky_ladder:role_rank(RoleId),
		RefList = match(Role),
		NewRefTime = Now +
			       sky_ladder_data:get_const(refresh_time),
		NRole = Role#role{m_sky_ladder =
				      MSkyLadder#m_sky_ladder{ref_list =
								  RefList,
							      ref_time =
								  NewRefTime,
							      merge_index =
								  NewRank}},
		push(NRole),
		push_list(NRole, 0),
		{ok, NRole}
	  end
    end.

rand_look() ->
    Looks = sky_ladder_data:get_const(robot_body),
    Acc = [#sky_ladder_f{idx = Idx,
			 look = util:rand_list(Looks)}
	   || Idx <- lists:seq(1, 5)],
    Acc.

rand_look([], Acc) -> Acc;
rand_look([#sky_ladder_f{id = {0, <<>>}} | _], Acc) ->
    Acc;
rand_look([#sky_ladder_f{idx = Idx} | T], Acc) ->
    Looks = sky_ladder_data:get_const(robot_body),
    NewSLF = #sky_ladder_f{idx = Idx,
			   look = util:rand_list(Looks)},
    rand_look(T, [NewSLF | Acc]);
rand_look(_, _) -> rand_look().

match(Role) ->
    case check_open(Role) of
      true ->
	  case sky_ladder_mgr:send_call(sky_ladder, do_match,
					[Role#role.id])
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
		  {__Pidsky_ladder567, _,
		   {__Levelsky_ladder567, __Tracessky_ladder567}}
		      when __Levelsky_ladder567 band 8 /= 0 orelse
			     __Tracessky_ladder567 /= [] ->
		      lager:do_log(error,
				   [{module, sky_ladder}, {function, match},
				    {line, 567}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]跨服天梯匹配出错[~ts]",
						 [Role#role.name, Msg]),
				   none, 4096, 8, __Levelsky_ladder567,
				   __Tracessky_ladder567, lager_event,
				   __Pidsky_ladder567);
		  _ -> ok
		end,
		[];
	    L = [_ | _] ->
		Fun = fun (SLF = #sky_ladder_f{robot_id = RobotId}, Acc)
			      when RobotId > 0 ->
			      #{partners := PL, formation := FormationType,
				hallows := {HallowsId, _, _}} =
				  robot:get(Role, RobotId, #{max_num => 5}),
			      {PosInfo, AllPower} = enemy_partner_robot_info(PL,
									     [],
									     0),
			      NewSLF = SLF#sky_ladder_f{pos_info = PosInfo,
							formation_type =
							    FormationType,
							hallows_id = HallowsId,
							power = AllPower},
			      [NewSLF | Acc];
			  (SLF = #sky_ladder_f{}, Acc) -> [SLF | Acc]
		      end,
		NewL = lists:foldl(Fun, [], L),
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
		  {__Pidsky_ladder581, _,
		   {__Levelsky_ladder581, __Tracessky_ladder581}}
		      when __Levelsky_ladder581 band 8 /= 0 orelse
			     __Tracessky_ladder581 /= [] ->
		      lager:do_log(error,
				   [{module, sky_ladder}, {function, match},
				    {line, 581}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]跨服天梯匹配出错[~w]",
						 [Role#role.name, _ERR]),
				   none, 4096, 8, __Levelsky_ladder581,
				   __Tracessky_ladder581, lager_event,
				   __Pidsky_ladder581);
		  _ -> ok
		end,
		[]
	  end;
      _ -> rand_look()
    end.

match_one(Role, Idx) ->
    case check_open(Role) of
      true ->
	  case sky_ladder_mgr:send_call(sky_ladder, do_match,
					[Role#role.id, Idx])
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
		  {__Pidsky_ladder593, _,
		   {__Levelsky_ladder593, __Tracessky_ladder593}}
		      when __Levelsky_ladder593 band 8 /= 0 orelse
			     __Tracessky_ladder593 /= [] ->
		      lager:do_log(error,
				   [{module, sky_ladder}, {function, match_one},
				    {line, 593}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]跨服天梯匹配出错[~ts]",
						 [Role#role.name, Msg]),
				   none, 4096, 8, __Levelsky_ladder593,
				   __Tracessky_ladder593, lager_event,
				   __Pidsky_ladder593);
		  _ -> ok
		end,
		[];
	    L = [_ | _] ->
		Fun = fun (SLF = #sky_ladder_f{robot_id = RobotId}, Acc)
			      when RobotId > 0 ->
			      #{partners := PL, formation := FormationType,
				hallows := {HallowsId, _, _}} =
				  robot:get(Role, RobotId, #{max_num => 5}),
			      {PosInfo, AllPower} = enemy_partner_robot_info(PL,
									     [],
									     0),
			      NewSLF = SLF#sky_ladder_f{pos_info = PosInfo,
							formation_type =
							    FormationType,
							hallows_id = HallowsId,
							power = AllPower},
			      [NewSLF | Acc];
			  (SLF = #sky_ladder_f{}, Acc) -> [SLF | Acc]
		      end,
		NewL = lists:foldl(Fun, [], L),
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
		  {__Pidsky_ladder607, _,
		   {__Levelsky_ladder607, __Tracessky_ladder607}}
		      when __Levelsky_ladder607 band 8 /= 0 orelse
			     __Tracessky_ladder607 /= [] ->
		      lager:do_log(error,
				   [{module, sky_ladder}, {function, match_one},
				    {line, 607}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]跨服天梯匹配出错[~ts]",
						 [Role#role.name, _ERR]),
				   none, 4096, 8, __Levelsky_ladder607,
				   __Tracessky_ladder607, lager_event,
				   __Pidsky_ladder607);
		  _ -> ok
		end,
		[]
	  end;
      _ -> rand_look()
    end.

-spec do_match(role_id()) -> list().

do_match(RoleId) ->
    Rank = sky_ladder_lib:role_rank(RoleId),
    RankRangL = sky_ladder_data:match_rank(Rank),
    do_match_(5, Rank, RankRangL, []).

do_match(RoleId, Idx) ->
    Rank = sky_ladder_lib:role_rank(RoleId),
    RankRangL = sky_ladder_data:match_rank(Rank),
    {MaxRank, MinRank} = lists:nth(Idx, RankRangL),
    ORank = util:rand(MinRank, MaxRank),
    ERank = util:if_true(ORank =:= Rank, ORank + 1, ORank),
    case sky_ladder_lib:rank_role(ERank) of
      {ok, SkyRole = #sky_ladder_role{}} ->
	  case gen_sky_ladder_f(Idx, SkyRole) of
	    F = #sky_ladder_f{} -> [F];
	    _ -> []
	  end;
      _ -> []
    end.

do_match_(0, _, _, L) -> L;
do_match_(Idx, Rank, RankRangL, L) ->
    {MaxRank, MinRank} = lists:nth(Idx, RankRangL),
    ORank = util:rand(MinRank, MaxRank),
    ERank = util:if_true(ORank =:= Rank, ORank + 1, ORank),
    case sky_ladder_lib:rank_role(ERank) of
      {ok, SkyRole = #sky_ladder_role{}} ->
	  case gen_sky_ladder_f(Idx, SkyRole) of
	    F = #sky_ladder_f{} ->
		do_match_(Idx - 1, Rank, RankRangL, [F | L]);
	    _ -> do_match_(Idx - 1, Rank, RankRangL, L)
	  end;
      _ -> do_match_(Idx - 1, Rank, RankRangL, L)
    end.

gen_sky_ladder_f(Idx,
		 #sky_ladder_role{id = TarRoleId, name = Name, lev = Lev,
				  sex = Sex, face = Face, power = Power,
				  rank = Rank, robot_unit = RobotId,
				  lookid = LookId})
    when RobotId > 0 ->
    #sky_ladder_f{idx = Idx, id = TarRoleId, name = Name,
		  lev = Lev, sex = Sex, face = Face, look = LookId,
		  power = Power, rank = Rank, robot_id = RobotId};
gen_sky_ladder_f(Idx,
		 #sky_ladder_role{vip = VipLev, id = TarRoleId,
				  name = Name, gname = GName, lev = Lev,
				  sex = Sex, face = Face, rank = Rank,
				  lookid = Look, avatar_id = AvatarId}) ->
    case role_robot:get_role(TarRoleId) of
      {ok,
       Robot = #role_robot{partners = Partners,
			   face_file = FaceFile,
			   face_update_time = FaceUpdateTime}} ->
	  #formation_sys{type = FormationType,
			 pos_info = PosInfo} =
	      formation:get_sys_formation(Robot, 9),
	  FormationLev = formation_lib:get_formation_lev(Robot,
							 FormationType),
	  PList = gen_sky_ladder_f_pos(PosInfo, Partners),
	  NewPower = lists:sum([PtnPower
				|| #sky_ladder_f_pos{power = PtnPower}
				       <- PList]),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsky_ladder667, _,
	     {__Levelsky_ladder667, __Tracessky_ladder667}}
		when __Levelsky_ladder667 band 128 /= 0 orelse
		       __Tracessky_ladder667 /= [] ->
		lager:do_log(debug,
			     [{module, sky_ladder},
			      {function, gen_sky_ladder_f}, {line, 667},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("成功匹配到玩家:~ts==idx:~w power:~w rank:~w "
					   "pos_info:~w",
					   [Name, Idx, NewPower, Rank,
					    PosInfo]),
			     none, 4096, 128, __Levelsky_ladder667,
			     __Tracessky_ladder667, lager_event,
			     __Pidsky_ladder667);
	    _ -> ok
	  end,
	  #sky_ladder_f{id = TarRoleId, name = Name,
			gname = GName, idx = Idx, lev = Lev, vip_lev = VipLev,
			sex = Sex, face = Face, avatar_id = AvatarId,
			look = Look, power = NewPower, rank = Rank,
			formation_type = FormationType,
			formation_lev = FormationLev, pos_info = PList,
			face_file = FaceFile,
			face_update_time = FaceUpdateTime};
      _ -> false
    end.

gen_sky_ladder_f_pos(PosInfo, Partners) ->
    Fun = fun (#formation_pos{pos = Pos, id = PId}) ->
		  #partner{bid = Bid, lev = PLev, break_lev = BreakLev,
			   use_skin = UseSkin, star = Star, power = PtnPower,
			   all_attr =
			       #attr{speed = Speed, atk = Atk, def = Def,
				     hp_max = HpMax}} =
		      lists:keyfind(PId, #partner.id, Partners),
		  #sky_ladder_f_pos{pos = Pos, id = PId, bid = Bid,
				    break_lev = BreakLev, lev = PLev,
				    use_skin = UseSkin, star = Star,
				    power = PtnPower, speed = Speed, atk = Atk,
				    def = Def, hp = HpMax}
	  end,
    [Fun(I) || I <- PosInfo].

-spec get_target_info(#role{}, role_id()) -> {ok,
					      tuple()} |
					     {false, binary()}.

get_target_info(#role{m_sky_ladder =
			  #m_sky_ladder{ref_list = RefList}},
		TarRoleId) ->
    case lists:keyfind(TarRoleId, #sky_ladder_f.id, RefList)
	of
      #sky_ladder_f{id = {Rid, SrvId}, name = Name,
		    gname = GName, lev = Lev, vip_lev = VipLev, face = Face,
		    avatar_id = AvatarId, sex = Sex, power = Power,
		    formation_type = FormationType,
		    formation_lev = FormationLev, rank = Rank,
		    pos_info = PosInfo, face_update_time = FaceUpdateTime,
		    face_file = FaceFile} ->
	  PList = [{Pos, Id, Bid, PLev, UseSkin, Star, IsRobot}
		   || #sky_ladder_f_pos{id = Id, pos = Pos, bid = Bid,
					lev = PLev, use_skin = UseSkin,
					star = Star, is_robot = IsRobot}
			  <- PosInfo],
	  {ok,
	   {Rid, SrvId, Name, Lev, VipLev, Face, Sex, Power, Rank,
	    GName, AvatarId, FormationType, FormationLev, PList,
	    FaceUpdateTime, FaceFile}};
      _ ->
	  {false,
	   lang:get(<<"Mục tiêu không có trong danh sách"/utf8>>)}
    end.

-spec buy_combat_num(#role{}) -> {ok, #role{}} |
				 {false, binary()}.

buy_combat_num(Role = #role{m_sky_ladder =
				MSkyLadder = #m_sky_ladder{buy_combat_num =
							       BuyCombatNum,
							   can_combat_num =
							       CanCombatNum},
			    m_vip = #m_vip{lev = VipLev}}) ->
    case sky_ladder_mgr:is_open() of
      false ->
	  {false,
	   lang:get(<<"Cuộc thi leo thang bắt đầu lúc 00:00 "
		      "thứ Bảy hàng tuần"/utf8>>)};
      _ ->
	  case sky_ladder_data:buy_num(BuyCombatNum + 1) of
	    #{vip := NeedVipLev} when NeedVipLev > VipLev ->
		{false, lang:get(<<"Cấp độ VIP không đủ"/utf8>>)};
	    #{cost := Cost} ->
		GL = format:val_to_loss([{3, Cost}], sky_ladder),
		case role_gain:do(Role, GL) of
		  {false, #loss{msg = Msg}} -> {false, Msg};
		  {ok, Role1} ->
		      NRole = Role1#role{m_sky_ladder =
					     MSkyLadder#m_sky_ladder{buy_combat_num
									 =
									 BuyCombatNum
									   + 1,
								     can_combat_num
									 =
									 CanCombatNum
									   +
									   1}},
		      log:log_gain(GL, Role, NRole, <<"跨服天梯"/utf8>>,
				   util:fbin("购买次数num:~w", [BuyCombatNum + 1])),
		      push(NRole),
		      push_combat_num(NRole),
		      {ok, NRole}
		end;
	    _ ->
		{false,
		 lang:get(<<"Giới hạn mua hàng hôm nay đã được sử "
			    "dụng hết"/utf8>>)}
	  end
    end.

-spec buy_combat_time(#role{}) -> {ok, #role{}} |
				  {false, binary()}.

buy_combat_time(Role = #role{m_sky_ladder =
				 MSkyLadder = #m_sky_ladder{combat_time =
								CombatTime}}) ->
    Now = date:unixtime(),
    case Now >= CombatTime of
      true ->
	  {false,
	   lang:get(<<"Không có thời gian hồi chiêu"/utf8>>)};
      _ ->
	  Loss = sky_ladder_data:get_const(battle_offcd),
	  GL = format:val_to_loss(Loss, sky_ladder),
	  case role_gain:do(Role, GL) of
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {ok, Role1} ->
		NRole = Role1#role{m_sky_ladder =
				       MSkyLadder#m_sky_ladder{combat_time =
								   0}},
		log:log_gain(GL, Role, NRole, <<"跨服天梯"/utf8>>,
			     lang:get(<<"Mua thời gian hồi chiêu"/utf8>>)),
		push(NRole),
		{ok, NRole}
	  end
    end.

enemy_partner_robot_info([], Acc, Power) ->
    {Acc, Power};
enemy_partner_robot_info([#partner{id = PId, bid = Bid,
				   lev = PLev, star = Star, power = Power,
				   break_lev = BreakLev}
			  | Rest],
			 Acc, AllPower) ->
    Data = #sky_ladder_f_pos{pos = PId, id = PId, bid = Bid,
			     lev = PLev, is_robot = 1, star = Star,
			     power = Power, break_lev = BreakLev},
    NewAcc = [Data | Acc],
    enemy_partner_robot_info(Rest, NewAcc,
			     AllPower + Power).

-spec push(#role{}) -> ok.

push(#role{id = RoleId,
	   m_sky_ladder =
	       #m_sky_ladder{best_rank = BestRank,
			     can_combat_num = CanCombatNum,
			     buy_combat_num = BuyCombatNum,
			     ref_time = RefTime}}) ->
    Rank = sky_ladder:role_rank(RoleId),
    EndTime = sky_ladder_mgr:end_time(),
    sys_conn:pack_send(24300,
		       {Rank, BestRank, CanCombatNum, BuyCombatNum, RefTime,
			EndTime}),
    ok.

-spec push_open(#role{}) -> ok.

push_open(_Role) ->
    IsOpen = sky_ladder_mgr:is_open(),
    sys_conn:pack_send(24312, {util:if_true(IsOpen, 1, 0)}),
    ok.

-spec push_combat_num(#role{}) -> ok.

push_combat_num(Role = #role{m_sky_ladder =
				 #m_sky_ladder{can_combat_num =
						   CanCombatNum}}) ->
    case check_can_combat([is_open, lev, arena], Role, #{})
	of
      ok ->
	  case CanCombatNum > 0 of
	    true -> sys_conn:pack_send(24317, {1});
	    _ -> sys_conn:pack_send(24317, {0})
	  end;
      _ -> sys_conn:pack_send(24317, {0})
    end,
    ok.

-spec push_can_worship(#role{}) -> ok.

push_can_worship(Role = #role{lev = Lev}) ->
    case Lev >= sky_ladder_data:get_const(join_min_lev) of
      true ->
	  L = sky_ladder:hero_hall(),
	  WL = [role_misc:worship_status(Role, TarRoleId, 3)
		|| #sky_ladder_role{id = TarRoleId = {_, SrvId}} <- L,
		   SrvId =/= <<"robot">>],
	  case lists:member(0, WL) of
	    true -> sys_conn:pack_send(24313, {1});
	    _ -> sys_conn:pack_send(24313, {0})
	  end;
      _ -> skip
    end,
    ok.

-spec push_list(#role{}, non_neg_integer()) -> ok.

push_list(#role{m_sky_ladder =
		    #m_sky_ladder{ref_list = RefList}},
	  Type) ->
    sys_conn:pack_send(24301, {RefList, Type}), ok.

push_list(#role{m_sky_ladder =
		    #m_sky_ladder{ref_list = RefList}},
	  Type, TarRoleId) ->
    case lists:keyfind(TarRoleId, #sky_ladder_f.id, RefList)
	of
      false -> skip;
      NewF -> sys_conn:pack_send(24301, {[NewF], Type})
    end,
    ok.

-spec push_def_lose(#role{}) -> ok.

push_def_lose(#role{id = RoleId}) ->
    N = var:get_role_var(RoleId, other, 7, 0),
    Flag = util:if_true(N > 0, 1, 0),
    sys_conn:pack_send(24314, {Flag}),
    ok.

-spec get_log(role_id() |
	      pos_integer()) -> #sky_ladder_role_log{}.

get_log(RoleId) ->
    case sky_ladder_mgr:send_call(sky_ladder_lib, get_log,
				  [RoleId])
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
	    {__Pidsky_ladder817, _,
	     {__Levelsky_ladder817, __Tracessky_ladder817}}
		when __Levelsky_ladder817 band 8 /= 0 orelse
		       __Tracessky_ladder817 /= [] ->
		lager:do_log(error,
			     [{module, sky_ladder}, {function, get_log},
			      {line, 817}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("跨服天梯获取[~w]日志出错[~ts]",
					   [RoleId, Msg]),
			     none, 4096, 8, __Levelsky_ladder817,
			     __Tracessky_ladder817, lager_event,
			     __Pidsky_ladder817);
	    _ -> ok
	  end,
	  #sky_ladder_role_log{};
      L = #sky_ladder_role_log{} -> L;
      _ -> #sky_ladder_role_log{}
    end.

-spec role_rank(role_id()) -> Rank :: non_neg_integer().

role_rank(RoleId) ->
    case sky_ladder_mgr:send_call(sky_ladder_lib, role_rank,
				  [RoleId])
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
	    {__Pidsky_ladder830, _,
	     {__Levelsky_ladder830, __Tracessky_ladder830}}
		when __Levelsky_ladder830 band 64 /= 0 orelse
		       __Tracessky_ladder830 /= [] ->
		lager:do_log(info,
			     [{module, sky_ladder}, {function, role_rank},
			      {line, 830}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("跨服天梯获取[~w]排名出错[~ts]",
					   [RoleId, Msg]),
			     none, 4096, 64, __Levelsky_ladder830,
			     __Tracessky_ladder830, lager_event,
			     __Pidsky_ladder830);
	    _ -> ok
	  end,
	  0;
      Rank when is_integer(Rank) -> Rank;
      _ -> 0
    end.

-spec list_rank(Num ::
		    pos_integer()) -> [#sky_ladder_role{}].

list_rank(Num) ->
    case sky_ladder_mgr:send_call(sky_ladder_lib, list_rank,
				  [Num])
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
	    {__Pidsky_ladder843, _,
	     {__Levelsky_ladder843, __Tracessky_ladder843}}
		when __Levelsky_ladder843 band 8 /= 0 orelse
		       __Tracessky_ladder843 /= [] ->
		lager:do_log(error,
			     [{module, sky_ladder}, {function, list_rank},
			      {line, 843}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("跨服天梯获取排行榜出错[~ts]", [Msg]), none,
			     4096, 8, __Levelsky_ladder843,
			     __Tracessky_ladder843, lager_event,
			     __Pidsky_ladder843);
	    _ -> ok
	  end,
	  [];
      L when is_list(L) -> L;
      _ -> []
    end.

-spec hero_hall() -> [#sky_ladder_role{}].

hero_hall() ->
    HistoryHall = sys_env:get(sky_ladder_hero_hall, []),
    case sky_ladder_mgr:is_open() orelse HistoryHall =:= []
	of
      true ->
	  case sky_ladder_mgr:send_call(sky_ladder_lib, hero_hall,
					[])
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
		  {__Pidsky_ladder857, _,
		   {__Levelsky_ladder857, __Tracessky_ladder857}}
		      when __Levelsky_ladder857 band 8 /= 0 orelse
			     __Tracessky_ladder857 /= [] ->
		      lager:do_log(error,
				   [{module, sky_ladder}, {function, hero_hall},
				    {line, 857}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("跨服天梯获取英雄榜出错[~ts]", [Msg]),
				   none, 4096, 8, __Levelsky_ladder857,
				   __Tracessky_ladder857, lager_event,
				   __Pidsky_ladder857);
		  _ -> ok
		end,
		[];
	    L when is_list(L) -> L;
	    _ -> []
	  end;
      _ -> sky_ladder_mgr:role_ver(HistoryHall)
    end.

-spec set_formation(#role{},
		    #formation_sys{}) -> {false, binary()} | {ok, #role{}}.

set_formation(Role, FormationSys) ->
    {ok, NRole} = formation:save_sys_formation(Role,
					       FormationSys),
    sky_ladder_mgr:sync_role(NRole, all),
    role_robot:sync_role(NRole),
    {ok, NRole}.

notice_msg(RoleId, GuildName, Name,
	   #sky_ladder_result{id = DefId, def_name = DefName,
			      atk_old_rank = AtkOldRank,
			      def_old_rank = DefOldRank,
			      atk_cont_win = ContWin}) ->
    case DefOldRank =/= 0 andalso
	   DefOldRank =< 3 andalso AtkOldRank > DefOldRank
	of
      true ->
	  case GuildName of
	    <<>> ->
		notice:broadcast(rumor_left_top,
				 color:msg(lang:get(<<"~tsĐánh bại xếp hạng~tscủa~ts ，Một người "
						      "đàn ông mạnh mẽ mới đã ra đời！~ts"/utf8>>),
					   [{kf_name, RoleId, Name},
					    {green, DefOldRank},
					    {name, DefId, DefName},
					    {href,
					     {52, green, [],
					      lang:get(<<"【Tôi muốn thử thách】"/utf8>>)}}]));
	    _ ->
		notice:broadcast(rumor_left_top,
				 color:msg(lang:get(<<"Từ~tscủa~tsĐánh bại xếp hạng~tscủa~ts "
						      "，Một người đàn ông mạnh mẽ mới đã ra "
						      "đời！~ts"/utf8>>),
					   [{kf_name, RoleId, GuildName},
					    {name, RoleId, Name},
					    {green, DefOldRank},
					    {name, DefId, DefName},
					    {href,
					     {52, green, [],
					      lang:get(<<"【Tôi muốn thử thách】"/utf8>>)}}]))
	  end;
      _ ->
	  case ContWin >= 5 andalso ContWin rem 5 =:= 0 of
	    true ->
		case GuildName of
		  <<>> ->
		      notice:broadcast(rumor_left_top,
				       color:msg(lang:get(<<"~tsCó chuỗi chiến thắng trong bảng xếp "
							    "hạng liên máy chủ~tscánh đồng，Không "
							    "ai có thể ngăn cản anh ấy nữa.！~ts"/utf8>>),
						 [{kf_name, RoleId, Name},
						  {green, ContWin},
						  {href,
						   {52, green, [],
						    lang:get(<<"【Tôi muốn thử thách】"/utf8>>)}}]));
		  _ ->
		      notice:broadcast(rumor_left_top,
				       color:msg(lang:get(<<"Từ~tscủa~tsCó chuỗi chiến thắng trong "
							    "bảng xếp hạng liên máy chủ~tscánh đồng，Không "
							    "ai có thể ngăn cản anh ấy nữa.！~ts"/utf8>>),
						 [{kf_name, RoleId, GuildName},
						  {name, RoleId, Name},
						  {green, ContWin},
						  {href,
						   {52, green, [],
						    lang:get(<<"【Tôi muốn thử thách】"/utf8>>)}}]))
		end;
	    _ ->
		case DefOldRank =/= 0 andalso
		       DefOldRank =< 10 andalso AtkOldRank > DefOldRank
		    of
		  true ->
		      case GuildName of
			<<>> ->
			    notice:broadcast(rumor_left_top,
					     color:msg(lang:get(<<"Đạt đến đỉnh cao，~tsĐã đạt được thứ "
								  "hạng 1 thành công trong bảng xếp hạng "
								  "liên máy chủ~tstên！~ts"/utf8>>),
						       [{kf_name, RoleId, Name},
							{green, DefOldRank},
							{href,
							 {52, green, [],
							  lang:get(<<"【Tôi muốn thử thách】"/utf8>>)}}]));
			_ ->
			    notice:broadcast(rumor_left_top,
					     color:msg(lang:get(<<"Đạt đến đỉnh cao，Từ~tscủa~tsĐã đạt được "
								  "thứ hạng 1 thành công trong bảng xếp "
								  "hạng liên máy chủ~tstên！~ts"/utf8>>),
						       [{kf_name, RoleId,
							 GuildName},
							{name, RoleId, Name},
							{green, DefOldRank},
							{href,
							 {52, green, [],
							  lang:get(<<"【Tôi muốn thử thách】"/utf8>>)}}]))
		      end;
		  _ -> skip
		end
	  end
    end.

notice_mail(RoleId, GuildName, Name,
	    #sky_ladder_result{id = DefId,
			       def_old_rank = DefOldRank,
			       def_rank = DefRank}) ->
    case DefOldRank =/= 0 andalso
	   DefOldRank =< 20 andalso DefRank > DefOldRank
	of
      true ->
	  case DefId of
	    {_, <<"robot">>} -> skip;
	    _ ->
		case GuildName of
		  <<>> ->
		      mail:send(DefId,
				{lang:get(<<"Thông báo thay đổi thứ hạng bậc thang"/utf8>>),
				 color:msg(lang:get(<<"Thân gửi nhà thám hiểm,：\n     Bạn bị "
						      "ảnh hưởng~tsThách thức, xếp hạng xuống~tstên。"
						      "Chúng ta hãy tập hợp lại và tiếp tụcTiếp "
						      "tục đi。"/utf8>>),
					   [{kf_name, RoleId, Name},
					    {green, DefRank}]),
				 [], [], <<"Thang liên máy chủ"/utf8>>});
		  _ ->
		      mail:send(DefId,
				{lang:get(<<"Thông báo thay đổi thứ hạng bậc thang"/utf8>>),
				 color:msg(lang:get(<<"Thân gửi nhà thám hiểm,：\n     Bạn nhận "
						      "được từ~tscủa~tsThách thức, xếp hạng "
						      "xuống~tstên. Chúng ta hãyTập hợp lại "
						      "và tiếp tục tiến về phía trước。"/utf8>>),
					   [{kf_name, RoleId, GuildName},
					    {name, RoleId, Name},
					    {green, DefRank}]),
				 [], [], <<"Thang liên máy chủ"/utf8>>})
		end,
		ok
	  end;
      _ -> skip
    end,
    ok.

-spec find_partner(#role{}, role_id(),
		   pos_integer()) -> ok | {false, binary()}.

find_partner(Role = #role{m_sky_ladder =
			      #m_sky_ladder{ref_list = RefList}},
	     TarRoleId, Pos) ->
    case lists:keyfind(TarRoleId, #sky_ladder_f.id, RefList)
	of
      #sky_ladder_f{robot_id = RobotId, pos_info = PosInfo}
	  when RobotId > 0 ->
	  case lists:keyfind(Pos, #sky_ladder_f_pos.pos, PosInfo)
	      of
	    #sky_ladder_f_pos{id = Id} ->
		case robot:find(Role, RobotId, Id, #{}) of
		  P = #partner{} ->
		      sys_conn:pack_send(11061,
					 partner_share:to_share_data(Role, P)),
		      ok;
		  _ ->
		      {false,
		       lang:get(<<"Người anh hùng không còn tồn tại nữa"/utf8>>)}
		end;
	    _ ->
		{false,
		 lang:get(<<"Người anh hùng không còn tồn tại nữa"/utf8>>)}
	  end;
      #sky_ladder_f{pos_info = PosInfo} ->
	  case lists:keyfind(Pos, #sky_ladder_f_pos.pos, PosInfo)
	      of
	    #sky_ladder_f_pos{id = PId} ->
		case role_robot:get_role(TarRoleId) of
		  {ok, #role_robot{partners = Partners}} ->
		      case lists:keyfind(PId, #partner.id, Partners) of
			P = #partner{} ->
			    sys_conn:pack_send(11061,
					       partner_share:to_share_data(Role,
									   P)),
			    ok;
			_ ->
			    {false,
			     lang:get(<<"Không lấy được dữ liệu của bên kia"/utf8>>)}
		      end;
		  _ ->
		      {false,
		       lang:get(<<"Không lấy được dữ liệu của bên kia"/utf8>>)}
		end;
	    _ ->
		{false,
		 lang:get(<<"Người anh hùng không còn tồn tại nữa"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Mục tiêu không có trong danh sách"/utf8>>)}
    end.

-spec is_match_range(pos_integer(),
		     pos_integer()) -> boolean().

is_match_range(MyRank, TarRank) ->
    MatchList = sky_ladder_data:match_rank(MyRank),
    Fun = fun ({MaxRank, MinRank}) ->
		  TarRank >= MinRank andalso TarRank =< MaxRank
	  end,
    lists:any(Fun, MatchList).


