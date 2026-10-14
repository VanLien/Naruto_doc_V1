-file("data/friend.erl", 1).

-file("src/mod/sns/friend.erl", 1).

-module(friend).

-lager_records([{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
		{room_rank_info,
		 [id, name, lev, face, avatar_bid, time, fans_num, rank,
		  look_id, face_update_time, face_file]},
		{room_fans_num, [id, fans]}, {room_fans, [myid, fid]},
		{room_bbs_message_below, [id, role_id, name, bbs_id]},
		{room_bbs_message,
		 [id, bbs_id, bbs_type, reply_name, reply_bbs_id,
		  reply_id, msg, time, tar_id, face_id, avatar_id, lev,
		  sex, name, face_update_time, face_file]},
		{room_honor_badges, [id, time]},
		{room_grow, [id, order, time, arge, ext]},
		{m_room_grow, [ver, finish, doing, info, next_id, ext]},
		{m_room_feat, [ver, flag, finish, doing, overdue, ext]},
		{m_room,
		 [ver, city_id, fanse_list, honor_badges, honor_point,
		  use_badges, room_bbs_set, room_bbs_num]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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
		{role_online,
		 [id, pid, conn_pid, name, account, status, lev, sex,
		  realm, platform, channel, career, power, face_id,
		  face_file, face_update_time, socket, max_dun_id,
		  province_name, city_name]},
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

-export([init/0, login/1, logout/1, save_info/1,
	 sync_status/2, sync_info/2, batch_req_add/2, req_add/2,
	 apply_req_add/2, apply_req_add_by_offline/2,
	 reply_add/3, apply_reply_add/2,
	 apply_reply_add_by_offline/2, apply_reply_add_check/2,
	 del/2, apply_del/2, batch_del/2, add_intimacy/3,
	 search_list/1, add_intimacy_list/3,
	 update_main_partner_used/3, present/3, apply_present/3,
	 batch_present/3, zero_push/1, batch_add/2,
	 apply_present_status/3, friend_num/1]).

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

-file("src/mod/sns/friend.erl", 37).

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

-file("src/mod/sns/friend.erl", 38).

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

-file("src/mod/sns/friend.erl", 39).

-file("inc/role_online.hrl", 1).

-record(role_online,
	{id = {0, 0}, pid, conn_pid, name, account, status, lev,
	 sex, realm, platform, channel, career, power, face_id,
	 face_file = <<>>, face_update_time = 0, socket,
	 max_dun_id, province_name, city_name}).

-file("src/mod/sns/friend.erl", 40).

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

-file("src/mod/sns/friend.erl", 41).

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

-file("src/mod/sns/friend.erl", 42).

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

-file("src/mod/sns/friend.erl", 43).

-file("inc/game_assets.hrl", 1).

-file("src/mod/sns/friend.erl", 44).

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

-file("src/mod/sns/friend.erl", 45).

-file("inc/log.hrl", 1).

-file("src/mod/sns/friend.erl", 46).

-file("inc/role_room.hrl", 1).

-record(m_room,
	{ver = 3, city_id = 0, fanse_list = [],
	 honor_badges = [], honor_point = 0, use_badges = [],
	 room_bbs_set = 1, room_bbs_num = 0}).

-record(m_room_feat,
	{ver = 1, flag = 0,
	 finish = []  :: [{pos_integer(), pos_integer()}],
	 doing = []  :: [tuple()],
	 overdue = []  :: [pos_integer()], ext = []}).

-record(m_room_grow,
	{ver = 1, finish = []  :: [pos_integer()],
	 doing = []  :: [tuple()], info = [], next_id = 1,
	 ext = []}).

-record(room_grow,
	{id = 0, order = 0, time = 0, arge = [], ext = []}).

-record(room_honor_badges, {id = 0, time = 0}).

-record(room_bbs_message,
	{id = {0, <<>>}, bbs_id = 0, bbs_type = 0,
	 reply_name = <<>>, reply_bbs_id = 0,
	 reply_id = {0, <<>>}, msg = <<>>, time = 0,
	 tar_id = {0, <<>>}, face_id = 0, avatar_id = 0, lev = 0,
	 sex = 0, name = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(room_bbs_message_below,
	{id = {0, <<>>}, role_id = {0, <<>>}, name = <<>>,
	 bbs_id = 0}).

-record(room_fans, {myid = {0, <<>>}, fid = {0, <<>>}}).

-record(room_fans_num, {id = {0, <<>>}, fans = 0}).

-record(room_rank_info,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 avatar_bid = 0, time = 0, fans_num = 0, rank = 0,
	 look_id = 0, face_update_time = 0, face_file = <<>>}).

-file("src/mod/sns/friend.erl", 47).

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

-file("src/mod/sns/friend.erl", 48).

-spec init() -> #m_friend{}.

init() -> #m_friend{}.

-spec login(#role{}) -> ok | {ok, #role{}}.

login(Role = #role{id = RoleId,
		   m_friend =
		       MFriend = #m_friend{is_open = 1, list = []}}) ->
    case ets:lookup(friend_req_list, RoleId) of
      [{RoleId, ReqList}] ->
	  ets:delete(friend_req_list, RoleId),
	  put(friend_req_list, ReqList);
      _ -> pass
    end,
    {ok, RF} = role_convert:do(role_friend, Role),
    friend_mgr:update_ets(role_friend, RF, all),
    L = friend_mgr:list_friends(RoleId),
    RoleT = ref_data(Role),
    {_, DrawCount} = var:get_var(RoleT, day, 55, {10, 30}),
    List = load_friend(L, RoleT, date:unixtime(), DrawCount,
		       []),
    NRole = RoleT#role{m_friend =
			   MFriend#m_friend{list = List}},
    NRole2 = push_present_info(NRole),
    friend_cross:online(NRole2, 1),
    friend_lib:apply_friends(List,
			     {friend, sync_status,
			      [{RoleId, 1, RF#role_friend.login_time}]}),
    {ok, NRole2};
login(Role) ->
    NRole = push_present_info(Role), {ok, NRole}.

load_friend([], _Role, _Now, _RestDrawCount, L) -> L;
load_friend([F = #friend{fid = Fid} | T],
	    Role = #role{m_room = #m_room{fanse_list = FanseList}},
	    Now, RestDrawCount, L) ->
    IsCross = case sys_lib:is_local(Fid) of
		true -> 0;
		_ -> 1
	      end,
    case friend_mgr:get_role_friend(Fid, IsCross) of
      {ok, RF} ->
	  UsedCount = var:get_list_val(Role, day, 57, Fid, 0),
	  IsPresent = var:get_list_val(Role, day, 56, Fid, 0),
	  IsFanse = lists:member(Fid, FanseList),
	  FTmp = to_tmp(F, RF, IsCross, UsedCount, IsPresent,
			RestDrawCount, IsFanse),
	  NewRestDrawCount = util:if_true(FTmp#friend_tmp.is_draw
					    =:= 1,
					  RestDrawCount - 1, RestDrawCount),
	  load_friend(T, Role, Now, NewRestDrawCount, [FTmp | L]);
      _ -> load_friend(T, Role, Now, RestDrawCount, L)
    end.

to_tmp(#friend{fid = Fid, intimacy = Intimacy,
	       ctime = Ctime, is_draw = Draw},
       #role_friend{name = Name, dun_id = DunId, gname = Gname,
		    gid = Gid, sex = Sex, career = Career, face_id = FaceId,
		    lev = Lev, power = Power, login_time = LoginTime,
		    login_out_time = LoginoutTime, is_online = IsOnLine,
		    main_partner_id = MainPartnerId,
		    partner_lev = PartnerLev, partner_bid = PartnerBid,
		    partner_star = PartnerStar, is_home = IsHome,
		    avatar_bid = AvatarBaseId, vip_lev = VipLev,
		    soft = Soft, face_update_time = FaceUpdateTime,
		    face_file = FaceFile},
       IsCross, UsedCount, IsPresent, RestDrawCount,
       IsFanse) ->
    IsUsed = util:if_true(UsedCount =:= 0, 0, 1),
    IsDraw = util:if_true(RestDrawCount > 0, Draw, 0),
    #friend_tmp{fid = Fid, intimacy = Intimacy,
		dun_id = DunId, ctime = Ctime, name = Name,
		gname = Gname, gid = Gid, sex = Sex, career = Career,
		face_id =
		    util:if_true(holiday_return_new:is_return(Fid) =:= 1,
				 FaceId * 10000, FaceId),
		lev = Lev, power = Power, login_time = LoginTime,
		login_out_time = LoginoutTime, is_online = IsOnLine,
		is_cross = IsCross, is_used = IsUsed,
		main_partner_id = MainPartnerId,
		partner_lev = PartnerLev, partner_bid = PartnerBid,
		partner_star = PartnerStar, is_present = IsPresent,
		is_draw = IsDraw, avatar_bid = AvatarBaseId,
		vip_lev = VipLev, is_fanse = IsFanse, is_home = IsHome,
		soft = Soft, face_update_time = FaceUpdateTime,
		face_file = FaceFile}.

ref_data(Role) ->
    Role1 = misc:five_data_to_zero(Role, 514, 55),
    Role2 = misc:five_data_to_zero(Role1, 513, 57),
    Role3 = misc:five_data_to_zero(Role2, 512, 56),
    Role3.

-spec logout(#role{}) -> ok | {ok, #role{}}.

logout(Role = #role{id = Rid,
		    m_friend = #m_friend{is_open = 1, list = List}}) ->
    {ok, RF} = role_convert:do(role_friend, Role),
    NewRF = RF#role_friend{is_online = 0,
			   login_out_time = date:unixtime()},
    friend_cross:online(Role, 0),
    friend_mgr:update_ets(role_friend, NewRF, all),
    friend_lib:apply_friends(List,
			     {friend, sync_status,
			      [{Rid, 0, NewRF#role_friend.login_time}]}),
    ok;
logout(_Role) -> ok.

-spec save_info(#role{}) -> ok.

save_info(Role = #role{type = role,
		       m_friend = #m_friend{is_open = 1}}) ->
    {ok, RF} = role_convert:do(role_friend, Role),
    friend_lib:apply_friends(Role,
			     {friend, sync_info, [RF]}),
    CrossFriends = friend_lib:cross_friends(Role),
    Fun = fun ({MainSrvId, _}) ->
		  cluster_lib:cast(MainSrvId, friend_mgr, update_ets,
				   [role_friend_cross, RF, all])
	  end,
    cluster_lib:split_srv_exec(CrossFriends,
			       #friend_tmp.fid, Fun),
    friend_mgr:update_ets(role_friend, RF, all);
save_info(_Role) -> ok.

-spec sync_status(#role{}, tuple()) -> {ok, #role{}}.

sync_status(Role = #role{m_friend =
			     MFriend = #m_friend{list = List}},
	    {Fid, IsOnline, Now}) ->
    NewList = case lists:keyfind(Fid, #friend_tmp.fid, List)
		  of
		false -> List;
		F = #friend_tmp{} ->
		    LoginoutTime = util:if_true(IsOnline == 0,
						date:unixtime(), 0),
		    NewF = F#friend_tmp{is_online = IsOnline,
					login_time = Now,
					login_out_time = LoginoutTime},
		    case {whereis(lager_event), whereis(lager_event),
			  lager_config:get({lager_event, loglevel}, {0, []})}
			of
		      {undefined, undefined, _} ->
			  fun () -> {error, lager_not_running} end();
		      {undefined, _, _} ->
			  fun () -> {error, {sink_not_configured, lager_event}}
			  end();
		      {__Pidfriend144, _,
		       {__Levelfriend144, __Tracesfriend144}}
			  when __Levelfriend144 band 128 /= 0 orelse
				 __Tracesfriend144 /= [] ->
			  lager:do_log(debug,
				       [{module, friend},
					{function, sync_status}, {line, 144},
					{pid, pid_to_list(self())},
					{node, node()}
					| lager:md()],
				       io_lib:format("好友在线状态:~w", [IsOnline]),
				       none, 4096, 128, __Levelfriend144,
				       __Tracesfriend144, lager_event,
				       __Pidfriend144);
		      _ -> ok
		    end,
		    sys_conn:pack_send(13301,
				       {Fid, Now, IsOnline, LoginoutTime}),
		    lists:keyreplace(Fid, #friend_tmp.fid, List, NewF)
	      end,
    {ok,
     Role#role{m_friend = MFriend#m_friend{list = NewList}}}.

-spec sync_info(#role{}, tuple()) -> {ok, #role{}}.

sync_info(Role = #role{m_friend =
			   MFriend = #m_friend{list = List}},
	  #role_friend{dun_id = DunId, name = Name, gname = Gname,
		       gid = Gid, sex = Sex, career = Career, face_id = FaceId,
		       lev = Lev, power = Power, id = Fid,
		       main_partner_id = MainPartnerId,
		       partner_bid = PartnerBid, partner_lev = PartnerLev,
		       partner_star = PartnerStar, is_home = IsHome,
		       avatar_bid = AvatarBaseId, soft = Soft,
		       face_update_time = FaceUpdateTime,
		       face_file = FaceFile}) ->
    NewList = case lists:keyfind(Fid, #friend_tmp.fid, List)
		  of
		false -> List;
		F = #friend_tmp{} ->
		    NewF = F#friend_tmp{dun_id = DunId, name = Name,
					gname = Gname, gid = Gid, sex = Sex,
					career = Career,
					face_id =
					    util:if_true(holiday_return_new:is_return(F#friend_tmp.fid)
							   =:= 1,
							 FaceId * 10000,
							 FaceId),
					lev = Lev, power = Power,
					main_partner_id = MainPartnerId,
					partner_bid = PartnerBid,
					partner_lev = PartnerLev,
					partner_star = PartnerStar,
					is_home = IsHome,
					avatar_bid = AvatarBaseId, soft = Soft,
					face_update_time = FaceUpdateTime,
					face_file = FaceFile},
		    sys_conn:pack_send(13302, NewF),
		    lists:keyreplace(Fid, #friend_tmp.fid, List, NewF)
	      end,
    {ok,
     Role#role{m_friend = MFriend#m_friend{list = NewList}}}.

-spec batch_req_add(#role{}, [role_id()]) -> {ok,
					      #role{}}.

batch_req_add(Role, []) -> {ok, Role};
batch_req_add(Role, [Id | T]) ->
    case req_add(Role, Id) of
      {ok, _Msg, NRole} -> batch_req_add(NRole, T);
      _ -> batch_req_add(Role, T)
    end.

-spec req_add(#role{}, role_id()) -> {false,
				      bitstring()} |
				     {ok, bitstring()} |
				     {ok, bitstring(), #role{}}.

req_add(#role{id = Rid}, Rid) ->
    {false,
     lang:get(<<"Bạn không thể thêm chính mình làm bạn "
		"bè."/utf8>>)};
req_add(#role{lev = Lev}, _Rid) when Lev < 5 ->
    {false,
     lang:get(<<"Cấp độ của bạn chưa đủ 5, không thể "
		"thêm bạn bè."/utf8>>)};
req_add(Role = #role{id = Rid,
		     m_friend =
			 MFriend = #m_friend{list = List, is_open = IsOpen}},
	Fid) ->
    Num = length(List),
    Max = max_num(Role),
    case lists:keyfind(Fid, #friend_tmp.fid, List) of
      #friend_tmp{} ->
	  {false,
	   lang:get(<<"Người chơi này đã là bạn bè của bạn."/utf8>>)};
      _ when Num >= Max ->
	  {false,
	   lang:get(<<"Số lượng bạn bè của bạn đã đạt giới "
		      "hạn."/utf8>>)};
      false ->
	  case check_req_add_by_emulator(Role) of
	    {false, Reason} -> {false, Reason};
	    {true, Role1} ->
		case friend_cross:check_cross(Role1, Fid) of
		  {false, Reason} -> {false, Reason};
		  _ ->
		      case sns_black:is_black(Rid, Fid) of
			true ->
			    {ok,
			     lang:get(<<"Không thể thêm đối tượng trong danh "
					"sách đen làm bạn bè."/utf8>>)};
			false ->
			    {ok, FReq} = role_convert:do(friend_req, Role1),
			    case catch role_lib:call(by_id, Fid,
						     {friend, apply_req_add,
						      [FReq]})
				of
			      ok when IsOpen =:= 1 ->
				  {ok,
				   lang:get(<<"Yêu cầu đã được gửi, vui lòng chờ đợi."/utf8>>)};
			      ok ->
				  {ok, RF} = role_convert:do(role_friend,
							     Role1),
				  friend_mgr:update_ets(role_friend, RF, all),
				  {ok,
				   lang:get(<<"Yêu cầu đã được gửi, vui lòng chờ đợi."/utf8>>),
				   Role1#role{m_friend =
						  MFriend#m_friend{is_open =
								       1}}};
			      {error, not_found} ->
				  case catch cluster_lib:call(element(2, Fid),
							      friend,
							      apply_req_add_by_offline,
							      [Fid, FReq])
				      of
				    ok when IsOpen =:= 1 ->
					{ok,
					 lang:get(<<"Yêu cầu đã được gửi, vui lòng chờ đợi."/utf8>>)};
				    ok ->
					{ok, RF} = role_convert:do(role_friend,
								   Role1),
					friend_mgr:update_ets(role_friend, RF,
							      all),
					{ok,
					 lang:get(<<"Yêu cầu đã được gửi, vui lòng chờ đợi."/utf8>>),
					 Role1#role{m_friend =
							MFriend#m_friend{is_open
									     =
									     1}}};
				    {false, Reason} -> {false, Reason};
				    _ ->
					{false,
					 lang:get(<<"Đối phương hiện không trực tuyến."/utf8>>)}
				  end;
			      {false, Reason} -> {false, Reason};
			      _ ->
				  {false,
				   lang:get(<<"Đối phương hiện không trực tuyến."/utf8>>)}
			    end
		      end
		end
	  end
    end.

apply_req_add(#role{lev = Lev}, _) when Lev < 5 ->
    {ok,
     {false,
      lang:get(<<"Cấp độ của đối phương không đủ."/utf8>>)}};
apply_req_add(Role = #role{id = Rid, name = Name,
			   m_friend = #m_friend{list = List}},
	      FReq = #friend_req{id = Fid}) ->
    Max = max_num(Role),
    Num = length(List),
    ReqList = util:get(friend_req_list, []),
    Now = date:unixtime(),
    case lists:keyfind(Fid, #friend_req.id, ReqList) of
      false when Num >= Max ->
	  {ok,
	   {false,
	    lang:get(<<"Số lượng bạn bè của đối phương đã đạt "
		       "giới hạn."/utf8>>)}};
      #friend_req{time = T} when Now - T < 60 ->
	  {ok,
	   {false,
	    lang:get(<<"Yêu cầu đã được gửi, vui lòng chờ đợi."/utf8>>)}};
      _ ->
	  case sns_black:is_black(Rid, Fid) of
	    true ->
		{ok,
		 {false,
		  lang:get(<<"Đối phương đã đưa bạn vào danh sách "
			     "đen."/utf8>>)}};
	    _ ->
		case friend_cross:check_cross(Role, Fid) of
		  {false, Reason} ->
		      {ok, {false, util:fbin("[~s]~s", [Name, Reason])}};
		  _ ->
		      NewFReq = FReq#friend_req{time = date:unixtime()},
		      put(friend_req_list,
			  [NewFReq | lists:keydelete(Fid, #friend_req.id,
						     ReqList)]),
		      notice_below:send(add_friend),
		      sys_conn:pack_send(13304, NewFReq),
		      {ok, ok}
		end
	  end
    end.

check_req_add_by_emulator(Role = #role{lev = Lev,
				       m_vip = #m_vip{lev = 0}})
    when Lev < 50 ->
    case get(emulator) of
      <<"true">> ->
	  case var:get_var(Role, day, 114, 0) of
	    0 -> {true, var:set_var(Role, day, 114, 1)};
	    _ -> {false, <<>>}
	  end;
      _ -> {true, Role}
    end;
check_req_add_by_emulator(Role) -> {true, Role}.

apply_req_add_by_offline(RoleId,
			 FReq = #friend_req{id = Fid}) ->
    IsCross = case sys_lib:is_local(Fid) of
		true -> 0;
		_ -> 1
	      end,
    case friend_mgr:get_role_friend(RoleId, 0) of
      {ok, #role_friend{lev = Lev}}
	  when IsCross =:= 1 andalso Lev =< 5 ->
	  {false,
	   lang:get(<<"Cấp độ của đối phương không đủ, không "
		      "thể thêm bạn bè liên server."/utf8>>)};
      {ok, _} ->
	  case length(friend_mgr:list_friends(RoleId)) >= 100 of
	    true ->
		{false,
		 lang:get(<<"Số lượng bạn bè của đối phương đã đạt "
			    "giới hạn."/utf8>>)};
	    false ->
		case sns_black:is_black(RoleId, Fid) of
		  true ->
		      {false,
		       lang:get(<<"Đối phương đã đưa bạn vào danh sách "
				  "đen."/utf8>>)};
		  _ ->
		      ReqList = case ets:lookup(friend_req_list, RoleId) of
				  [{_, L1}] -> L1;
				  _ -> []
				end,
		      case lists:keyfind(Fid, #friend_req.id, ReqList) of
			#friend_req{} ->
			    {false,
			     lang:get(<<"Yêu cầu đã được gửi, vui lòng kiên nhẫn "
					"chờ đợi"/utf8>>)};
			_ ->
			    ets:insert(friend_req_list,
				       {RoleId, [FReq | ReqList]}),
			    ok
		      end
		end
	  end;
      _ ->
	  {false,
	   lang:get(<<"Không tìm thấy dữ liệu thông tin bạn "
		      "bè của bên kia"/utf8>>)}
    end.

batch_add(Role, Ids) -> do_batch_add(Role, Ids, []).

do_batch_add(Role, [], DelIds) -> {ok, Role, DelIds};
do_batch_add(Role, [Id | T], DelIds) ->
    case reply_add(Role, Id, 1) of
      {ok, NRole} -> do_batch_add(NRole, T, [Id | DelIds]);
      _ -> do_batch_add(Role, T, DelIds)
    end.

-spec reply_add(#role{}, role_id(), 0 | 1) -> {false,
					       bitstring()} |
					      {ok, #role{}}.

reply_add(#role{id = Rid}, Rid, _Agree) ->
    {false,
     lang:get(<<"Không thể xử lý yêu cầu của riêng mình"/utf8>>)};
reply_add(Role = #role{id = RoleId,
		       m_friend = #m_friend{list = List}},
	  Fid, 1) ->
    case lists:keyfind(Fid, #friend_req.id,
		       util:get(friend_req_list, []))
	of
      #friend_req{} ->
	  put(friend_req_list,
	      lists:keydelete(Fid, #friend_req.id,
			      util:get(friend_req_list, []))),
	  Max = max_num(Role),
	  Num = length(List),
	  case lists:keyfind(Fid, #friend_tmp.fid, List) of
	    false when Num >= Max ->
		{false,
		 lang:get(<<"Số lượng bạn bè đã đạt đến giới hạn!"/utf8>>)};
	    false ->
		case sns_black:is_black(RoleId, Fid) of
		  true ->
		      {false,
		       lang:get(<<"Bên kia đã bị bạn đưa vào danh sách "
				  "đen"/utf8>>)};
		  _ ->
		      {ok, RF} = role_convert:do(role_friend, Role),
		      IsCross = case sys_lib:is_local(Fid) of
				  true -> 0;
				  _ -> 1
				end,
		      case catch role_lib:call(by_id, Fid,
					       {friend, apply_reply_add,
						[{RF, self(), IsCross}]})
			  of
			{ok, TarRF} ->
			    NRole = add_new(Role, TarRF, IsCross), {ok, NRole};
			{false, Reason} -> {false, Reason};
			{error, not_found} ->
			    case catch cluster_lib:call(element(2, Fid), friend,
							apply_reply_add_by_offline,
							[Fid,
							 {RF, self(), IsCross}])
				of
			      {ok, TarRF} ->
				  NRole = add_new(Role, TarRF, IsCross),
				  {ok, NRole};
			      {false, Reason} -> {false, Reason};
			      _ ->
				  {false,
				   lang:get(<<"Bên kia không trực tuyến và không thể "
					      "lấy được thông tin dữ liệu của bên kia"/utf8>>)}
			    end;
			_ ->
			    {false,
			     lang:get(<<"Bên kia không trực tuyến"/utf8>>)}
		      end
		end;
	    _ ->
		{false,
		 lang:get(<<"Bên kia đã là bạn của bạn rồi"/utf8>>)}
	  end;
      _ ->
	  {false, lang:get(<<"Không thêm được bạn bè"/utf8>>)}
    end;
reply_add(#role{name = Name}, Fid, _Agree) ->
    put(friend_req_list,
	lists:keydelete(Fid, #friend_req.id,
			util:get(friend_req_list, []))),
    notice:alert(Fid,
		 util:fbin(lang:get(<<"~tsYêu cầu kết bạn của bạn đã bị từ "
				      "chối"/utf8>>),
			   [Name])),
    ok.

apply_reply_add(Role = #role{id = RoleId,
			     m_friend = #m_friend{list = List}},
		{TarRF = #role_friend{id = Fid}, TarPid, IsCross}) ->
    Max = max_num(Role),
    Num = length(List),
    case Num >= Max of
      true ->
	  {ok,
	   {false,
	    lang:get(<<"Số lượng bạn bè của bên kia đã đầy"/utf8>>)}};
      _ ->
	  case sns_black:is_black(RoleId, Fid) of
	    true ->
		{ok,
		 {false,
		  lang:get(<<"Bên kia đã đưa bạn vào danh sách đen"/utf8>>)}};
	    _ ->
		{ok, RF} = role_convert:do(role_friend, Role),
		NRole = add_new(Role, TarRF, IsCross),
		role:apply(async, TarPid,
			   {friend, apply_reply_add_check, [{RF, IsCross}]}),
		{ok, {ok, RF}, NRole}
	  end
    end.

apply_reply_add_by_offline(RoleId,
			   {TarRF = #role_friend{id = Fid}, TarPid, IsCross}) ->
    case friend_mgr:get_role_friend(RoleId, 0) of
      {ok, #role_friend{lev = Lev}}
	  when IsCross =:= 1 andalso Lev =< 5 ->
	  {false,
	   lang:get(<<"Cấp độ của bên kia không đủ cao để thêm "
		      "bạn bè liên máy chủ"/utf8>>)};
      {ok, RF} ->
	  case length(friend_mgr:list_friends(RoleId)) >= 100 of
	    true ->
		{false,
		 lang:get(<<"Số lượng bạn bè của bên kia đã đạt đến "
			    "giới hạn trên"/utf8>>)};
	    false ->
		case sns_black:is_black(RoleId, Fid) of
		  true ->
		      {false,
		       lang:get(<<"Bên kia đã đưa bạn vào danh sách đen"/utf8>>)};
		  _ ->
		      Tab = case IsCross of
			      1 -> role_friend_cross;
			      _ -> role_friend
			    end,
		      F = #friend{myid = RoleId, fid = Fid,
				  ctime = date:unixtime()},
		      friend_mgr:update_ets(friends, F, all),
		      friend_mgr:update_ets(Tab, TarRF, all),
		      role:apply(async, TarPid,
				 {friend, apply_reply_add_check,
				  [{RF, IsCross}]}),
		      {ok, RF}
		end
	  end;
      _ ->
	  {false,
	   lang:get(<<"Bên kia không trực tuyến và không thể "
		      "lấy được thông tin dữ liệu nhân vật "
		      "của bên kia."/utf8>>)}
    end.

apply_reply_add_check(Role = #role{m_friend =
				       #m_friend{list = List}},
		      {TarRF, IsCross}) ->
    case lists:keyfind(TarRF#role_friend.id,
		       #friend_tmp.fid, List)
	of
      false ->
	  NRole = add_new(Role, TarRF, IsCross), {ok, NRole};
      _ -> ok
    end.

add_new(Role = #role{id = RoleId,
		     m_friend = MFriend = #m_friend{list = List},
		     m_room = #m_room{fanse_list = FanseList}},
	TarRF = #role_friend{id = Fid = {FSid, _}, name = FName,
			     login_time = Time},
	IsCross) ->
    F = #friend{myid = RoleId, fid = Fid, ctime = Time},
    UsedCount = var:get_list_val(Role, day, 57, Fid, 0),
    IsPresent = var:get_list_val(Role, day, 56, Fid, 0),
    IsFanse = lists:member(Fid, FanseList),
    FTmp = to_tmp(F, TarRF, IsCross, UsedCount, IsPresent,
		  0, IsFanse),
    Tab = case IsCross of
	    1 -> role_friend_cross;
	    _ -> role_friend
	  end,
    friend_mgr:update_ets(friends, F, all),
    friend_mgr:update_ets(Tab, TarRF, all),
    sys_conn:pack_send(13310, FTmp),
    FrdRole = Role#role{m_friend =
			    MFriend#m_friend{is_open = 1,
					     list = [FTmp | List]}},
    Evts = case IsCross of
	     1 ->
		 [#evt_add_friend{}, #evt_friend{},
		  #evt_friend_cluster{},
		  #r_evt_friend_add{cache = #{friend_name => FName}},
		  #r_evt_friend_cluster_add{cache =
						#{friend_name => FName,
						  service_name =>
						      util:fbin(lang:get(<<"S_~w"/utf8>>),
								[FSid])}}];
	     _ ->
		 [#evt_add_friend{}, #evt_friend{},
		  #evt_friend_cluster{},
		  #r_evt_friend_add{cache = #{friend_name => FName}}]
	   end,
    role_trigger:fire(Evts, FrdRole).

-spec update_main_partner_used(#role{}, role_id(),
			       0 | 1) -> #role{}.

update_main_partner_used(Role = #role{m_friend =
					  MFriend = #m_friend{list = List}},
			 Fid, IsUsed) ->
    case lists:keyfind(Fid, #friend_tmp.fid, List) of
      FTmp = #friend_tmp{is_used = OldIsUsed}
	  when OldIsUsed =/= IsUsed ->
	  NewList = lists:keyreplace(Fid, #friend_tmp.fid, List,
				     FTmp#friend_tmp{is_used = IsUsed}),
	  sys_conn:pack_send(13302,
			     FTmp#friend_tmp{is_used = IsUsed}),
	  Role#role{m_friend = MFriend#m_friend{list = NewList}};
      _ -> Role
    end.

-spec del(#role{}, role_id()) -> {false, bitstring()} |
				 {ok, #role{}}.

del(Role = #role{id = RoleId,
		 m_friend = MFriend = #m_friend{list = List}},
    Fid = {_, FSrvId}) ->
    case lists:keyfind(Fid, #friend_tmp.fid, List) of
      false ->
	  {false,
	   lang:get(<<"Không có bạn bè nào như vậy, xóa không "
		      "thành công"/utf8>>)};
      _ ->
	  friend_mgr:del_friend(RoleId, Fid),
	  say_private:do_del_private_offine_msg(RoleId, Fid),
	  say_private:do_del_private_offine_msg(Fid, RoleId),
	  NRole = Role#role{m_friend =
				MFriend#m_friend{list =
						     lists:keydelete(Fid,
								     #friend_tmp.fid,
								     List)}},
	  NewRole = role_trigger:fire([#evt_friend{},
				       #evt_friend_cluster{}],
				      NRole),
	  cluster_lib:cast(FSrvId, friend, apply_del,
			   [Fid, RoleId]),
	  {ok, NewRole}
    end.

apply_del(RoleId = {_, _}, Fid) ->
    friend_mgr:del_friend(RoleId, Fid),
    role_lib:cast(by_id, RoleId,
		  {friend, apply_del, [Fid]});
apply_del(Role = #role{id = RoleId,
		       m_friend = MFriend = #m_friend{list = List}},
	  Fid) ->
    case lists:keyfind(Fid, #friend_tmp.fid, List) of
      false -> ok;
      _ ->
	  friend_mgr:del_friend(Fid, RoleId),
	  NRole = Role#role{m_friend =
				MFriend#m_friend{list =
						     lists:keydelete(Fid,
								     #friend_tmp.fid,
								     List)}},
	  NewRole = role_trigger:fire([#evt_friend{},
				       #evt_friend_cluster{}],
				      NRole),
	  sys_conn:pack_send(13308, Fid),
	  {ok, NewRole}
    end.

-spec batch_del(#role{}, [role_id()]) -> {ok, #role{},
					  [role_id()]}.

batch_del(Role, Ids) -> do_batch_del(Role, Ids, []).

do_batch_del(Role, [], DelIds) -> {ok, Role, DelIds};
do_batch_del(Role, [Id | T], DelIds) ->
    case del(Role, Id) of
      {ok, NRole} -> do_batch_del(NRole, T, [Id | DelIds]);
      _ -> do_batch_del(Role, T, DelIds)
    end.

-spec present(#role{}, role_id(),
	      pos_integer()) -> {false, bitstring()} |
				{ok, #role{}, pos_integer(), pos_integer()}.

present(Role = #role{m_friend = #m_friend{list = List}},
	Fid, Type) ->
    case lists:keyfind(Fid, #friend_tmp.fid, List) of
      FTmp = #friend_tmp{} -> present2(Role, Fid, Type, FTmp);
      _ ->
	  {false,
	   lang:get(<<"Người chơi này không phải là bạn của "
		      "bạn"/utf8>>)}
    end.

present2(Role = #role{name = RoleName, id = Id,
		      m_friend = MFriend = #m_friend{list = List}},
	 Fid, 0,
	 FTmp = #friend_tmp{name = Name, is_draw = Draw}) ->
    IsPresent = var:get_list_val(Role, day, 56, Fid, 0),
    {PresentCount, DrawCount} = var:get_var(Role, day, 55,
					    {10, 30}),
    if IsPresent == 1 ->
	   {false,
	    lang:get(<<"Điểm tình bạn đã được trao tặng"/utf8>>)};
       PresentCount =< 0 ->
	   {false,
	    lang:get(<<"Đã đạt đến giới hạn điểm tình bạn được "
		       "trao tặng hôm nay"/utf8>>)};
       true ->
	   NewList = lists:keyreplace(Fid, #friend_tmp.fid, List,
				      FTmp#friend_tmp{is_present = 1}),
	   GL = format:val_to_gain([{1, 10000}], friend_present),
	   case role_gain:do(Role, GL) of
	     {false, #gain{msg = Msg}} -> {false, Msg};
	     {ok, GRole} ->
		 role_lib:cast(by_id, Fid,
			       {friend, apply_present, [Id, RoleName]}),
		 apply_present_status(Fid, Id),
		 notice:alert(GRole,
			      util:fbin(lang:get(<<"Đã thành công gửi quà tặng cho ~ts, "
						   "~ts."/utf8>>),
					[Name, format:gain_text(GL, GRole)])),
		 Role1 = var:set_list_val(GRole, day, 56, Fid, 1),
		 VarRole = var:set_var(Role1, day, 55,
				       {PresentCount - 1, DrawCount}),
		 NRole = VarRole#role{m_friend =
					  MFriend#m_friend{list = NewList}},
		 NRole1 = role_weekly:fire(NRole, {add_send_point, 1}),
		 {ok, NRole2} = holiday_lucky_dog_lib:fire(NRole1,
							   evt_friend_present,
							   0),
		 NewRole = role_trigger:fire(#evt_friend_present{base_id
								     = 14,
								 val = 10},
					     NRole2),
		 log:log_gain(GL, Role, NewRole, <<"好友"/utf8>>,
			      util:fbin("赠送好友友情点:~w", [Fid])),
		 {ok, NewRole, 1, Draw}
	   end
    end;
present2(Role = #role{id = RoleId,
		      m_friend = MFriend = #m_friend{list = List}},
	 Fid, 1,
	 FTmp = #friend_tmp{name = _Name, is_draw = IsDraw}) ->
    {PresentCount, DrawCount} = var:get_var(Role, day, 55,
					    {10, 30}),
    if DrawCount =< 0 ->
	   {false,
	    lang:get(<<"Số điểm tình bạn nhận được trong hôm "
		       "nay đã đạt giới hạn."/utf8>>)};
       IsDraw =/= 1 ->
	   {false,
	    lang:get(<<"Hiện tại không có điểm tình bạn nào "
		       "để nhận."/utf8>>)};
       true ->
	   Times = calc_present_times(1, DrawCount),
	   GL = case Times < 20 of
		  true ->
		      format:val_to_gain([{14, 10}, {1, 10000}],
					 friend_present);
		  _ -> format:val_to_gain([{1, 10000}], friend_present)
		end,
	   case role_gain:do(Role, GL) of
	     {false, #gain{msg = Msg}} -> {false, Msg};
	     {ok, Role1} ->
		 log:log_gain(GL, Role, Role1, <<"好友"/utf8>>,
			      util:fbin("领取好友赠送友情点:~w", [Fid])),
		 L = friend_mgr:list_friends(RoleId),
		 case lists:keyfind(Fid, #friend.fid, L) of
		   F = #friend{} ->
		       friend_mgr:update_friend(F#friend{is_draw = 0});
		   _ -> skip
		 end,
		 notice:alert(Role1,
			      util:fbin(lang:get(<<"Đã thành công nhận quà từ bạn bè.,~ts"/utf8>>),
					[format:gain_text(GL, Role1)])),
		 NRole = var:set_var(Role1, day, 55,
				     {PresentCount, DrawCount - 1}),
		 NewRole = role_trigger:fire(#evt_get_friend_point{count
								       = 10},
					     NRole),
		 NewList = lists:keyreplace(Fid, #friend_tmp.fid, List,
					    FTmp#friend_tmp{is_draw = 0}),
		 IsPresent = var:get_list_val(Role, day, 56, Fid, 0),
		 {ok,
		  NewRole#role{m_friend =
				   MFriend#m_friend{list = NewList}},
		  IsPresent, 0}
	   end
    end;
present2(_Role, _Fid, _Type, _FTmp) ->
    {false, lang:get(<<"Lỗi tham số."/utf8>>)}.

apply_present_status(Fid, Id) ->
    L = friend_mgr:list_friends(Fid),
    case lists:keyfind(Id, #friend.fid, L) of
      F = #friend{} ->
	  friend_mgr:update_friend(F#friend{is_draw = 1});
      _ -> ok
    end,
    ok.

apply_present_status(Role, Fid, Id) ->
    L = friend_mgr:list_friends(Fid),
    case lists:keyfind(Id, #friend.fid, L) of
      F = #friend{} ->
	  friend_mgr:update_friend(F#friend{is_draw = 1});
      _ -> ok
    end,
    {ok, Role}.

apply_present(Role = #role{m_friend =
			       MFriend = #m_friend{list = List},
			   id = RoleId},
	      Fid, FRoleName) ->
    {_, DrawCount} = var:get_var(Role, day, 55, {10, 30}),
    NotDrawCount = length([1
			   || #friend_tmp{is_draw = 1} <- List]),
    case lists:keyfind(Fid, #friend_tmp.fid, List) of
      FTmp = #friend_tmp{is_draw = Draw} when Draw =/= 1 ->
	  NewList = case DrawCount - NotDrawCount > 0 of
		      true ->
			  sys_conn:pack_send(13302,
					     FTmp#friend_tmp{is_draw = 1}),
			  notice_below:send(RoleId, give),
			  notice:alert(Role,
				       util:fbin(lang:get(<<"~tsĐã gửi cho bạn một món quà!"/utf8>>),
						 [color:format({name, Fid,
								FRoleName})])),
			  lists:keyreplace(Fid, #friend_tmp.fid, List,
					   FTmp#friend_tmp{is_draw = 1});
		      _ -> List
		    end,
	  {ok,
	   Role#role{m_friend = MFriend#m_friend{list = NewList}}};
      _ -> {ok, Role}
    end.

batch_present(Role, [], 1) ->
    {false,
     lang:get(<<"Bạn đã nhận tất cả quà tặng."/utf8>>), [],
     Role};
batch_present(Role, [], 0) ->
    {PresentCount, _} = var:get_var(Role, day, 55,
				    {10, 30}),
    case PresentCount =< 0 of
      true ->
	  {false,
	   lang:get(<<"Số điểm tình bạn tặng trong hôm nay "
		      "đã đạt giới hạn."/utf8>>),
	   [], Role};
      _ ->
	  {false,
	   lang:get(<<"Hiện tại không có bạn bè để tặng quà"/utf8>>),
	   [], Role}
    end;
batch_present(Role, Ids, Type) ->
    batch_present2(Role, Ids, Type, [], ok, <<>>).

batch_present2(Role = #role{m_friend =
				#m_friend{list = List}},
	       [], _Type, L, Flag, Reason) ->
    {PresentCount, DrawCount} = var:get_var(Role, day, 55,
					    {10, 30}),
    role:pack_send(Role, 13300,
		   {PresentCount, DrawCount, 30, List}),
    {Flag, Reason, L, Role};
batch_present2(Role, [{Rid, SrvId} | Ids], Type, L,
	       Flag, Reason) ->
    case friend:present(Role, {Rid, SrvId}, Type) of
      {ok, NRole, Present, Draw} ->
	  batch_present2(NRole, Ids, Type,
			 [{Rid, SrvId, Present, Draw} | L], Flag, Reason);
      {false, Msg} ->
	  batch_present2(Role, Ids, Type, L, false, Msg)
    end.

zero_push(Role = #role{m_friend =
			   MFriend = #m_friend{list = List}}) ->
    Fun = fun (FTmp, Acc) ->
		  [FTmp#friend_tmp{is_present = 0, is_used = 0} | Acc]
	  end,
    NList = lists:foldl(Fun, [], List),
    role:redirect(Role, 13300, {}),
    {ok,
     Role#role{m_friend = MFriend#m_friend{list = NList}}}.

-spec add_intimacy_list(#role{}, #combat{},
			pos_integer()) -> #role{}.

add_intimacy_list(Role, _Combat, _CombatResult) -> Role.

-spec add_intimacy(#role{}, role_id(),
		   pos_integer()) -> {ok, #role{}}.

add_intimacy(Role, _Fid, _AddVal) -> {ok, Role}.

-spec max_num(#role{}) -> pos_integer().

max_num(_Role) -> 100.

-spec search_list(#role{}) -> [#role_online{}].

search_list(Role) ->
    L = role_lib:get_online_role(),
    L1 = filter_search_list(L, Role, []),
    N = 5,
    case length(L1) > N of
      true -> list_util:rand_more(L1, N);
      _ -> L1
    end.

filter_search_list([], _Role, L) -> L;
filter_search_list([#role_online{id = Rid} | T],
		   Role = #role{id = Rid}, L) ->
    filter_search_list(T, Role, L);
filter_search_list([#role_online{lev = Lev} | T], Role,
		   L)
    when Lev < 5 ->
    filter_search_list(T, Role, L);
filter_search_list([#role_online{lev = Lev1} | T],
		   Role = #role{lev = Lev}, L)
    when abs(Lev - Lev1) > 30 ->
    filter_search_list(T, Role, L);
filter_search_list([R | T], Role, L) ->
    case sns_black:is_black(Role#role.id, R#role_online.id)
	of
      true -> filter_search_list(T, Role, L);
      _ ->
	  case friend_lib:is_friend(Role, R#role_online.id) of
	    true -> filter_search_list(T, Role, L);
	    _ -> filter_search_list(T, Role, [R | L])
	  end
    end.

calc_present_times(1, Time) when is_integer(Time) ->
    30 - Time;
calc_present_times(0, Time) when is_integer(Time) ->
    10 - Time;
calc_present_times(_, _Time) -> 0.

push_present_info(Role = #role{m_friend =
				   MFriend = #m_friend{list = List},
			       id = RoleId}) ->
    L = friend_mgr:list_friends(RoleId),
    {_, DrawCount} = var:get_var(Role, day, 55, {10, 30}),
    NotDrawCount = length([1
			   || #friend_tmp{is_draw = 1} <- List]),
    Fun = fun (Friend, {Count, Acc}) ->
		  case Friend of
		    #friend{fid = Fid, is_draw = 1} ->
			case lists:keyfind(Fid, #friend_tmp.fid, Acc) of
			  FTmp = #friend_tmp{is_draw = Draw} when Draw =/= 1 ->
			      NewList = case Count > 0 of
					  true ->
					      role:pack_send(RoleId, 13302,
							     FTmp#friend_tmp{is_draw
										 =
										 1}),
					      notice_below:send(RoleId, give),
					      lists:keyreplace(Fid,
							       #friend_tmp.fid,
							       Acc,
							       FTmp#friend_tmp{is_draw
										   =
										   1});
					  _ -> List
					end,
			      {Count - 1, NewList};
			  _ -> {Count, Acc}
			end;
		    _ -> {Count, Acc}
		  end
	  end,
    {_, NewTmpL} = lists:foldl(Fun,
			       {DrawCount - NotDrawCount, List}, L),
    NewMFriend = MFriend#m_friend{list = NewTmpL},
    NRole = Role#role{m_friend = NewMFriend},
    NRole.

-spec friend_num(#role{}) -> integer().

friend_num(#role{m_friend = #m_friend{list = List}}) ->
    length(List).


