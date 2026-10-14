-file("src/mod/partner/partner_lib.erl", 1).

-module(partner_lib).

-lager_records([{replay_partner,
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
		{dungeon_replay, [dun_id, replays]},
		{dungeon_replay_log,
		 [type, rid, sid, name, face_id, time, power, repaly_id,
		  face_update_time, face_file]},
		{dungeon_data,
		 [id, name, chapter_id, mode, next_id, unit_id, items,
		  drop_ids, hook_unit_id, hook_items, hook_drop_ids,
		  hook_lev_add, time, is_big, energy_max, auto_items,
		  power, lev_limit, floor]},
		{dungeon, [id, status, cool_time, auto_num]},
		{dun_chapter, [id, status, list]},
		{m_dungeon,
		 [ver, mode, chapter_id, dun_id, max_dun_id,
		  last_hook_time, list, drop_idx, ext_reward, buff_list,
		  fast_combat_add_time, auto_combat_id, auto_combat_num,
		  auto_combat_items, chapter_awrads, is_first,
		  acc_hook_time, acc_hook_items]},
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
		{role_misc,
		 [reg_zero_time, self_charge, combat_watch_pid,
		  mail_posting, is_do_online, gm_attr, dun_auto_num,
		  dun_auto_lose, invite_code_list, return_code_list,
		  need_captcha]},
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

-export([calc_attr/2, calc_attr_n/2,
	 calc_attr_add_field/2, calc_power/1, get_max_partner/2,
	 get_max_lev_partner/2, get_partner_lev/2, get_partner/2,
	 get_partner_by_bid/2, partner_type/1, get_power/2,
	 get_eqm_score/1, partnner_get_atom_attr/3,
	 partner_base_power/1, gen_guild_skill_attr/2,
	 gen_attr/2, show_holy_eqm_gen_attr/2, to_cli/1,
	 gen_fight_object/3, gen_fight_object/5,
	 gen_fight_object/6, gen_fight_object_role/4,
	 rare_type_name/1, check_open/2, ref_partner_by_type/3,
	 ref_partner_by_type2/3, ref_partner_by_camp/3,
	 ref_partner_by_camp2/3, get_star/1, get_partner_star/2,
	 ref_formation_attr/2, expend_to_market/2,
	 ref_partner_stronger/1, get_partner_break_max_lev/1,
	 get_partner_skills1/1, get_all_skills/1,
	 get_partner_formations/3, calc_all_attr_no_push/1,
	 do_remove_skills/1, get_break_by_lev/1,
	 hase_partner_by_star/3]).

-export([gm_set_lev/2, gm_set_star/3, gm_break/2,
	 gm_delete/2, gm_partner_num/1, gm_del_partner/4]).

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

-file("src/mod/partner/partner_lib.erl", 62).

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

-file("src/mod/partner/partner_lib.erl", 63).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/partner/partner_lib.erl", 64).

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

-file("src/mod/partner/partner_lib.erl", 65).

-file("inc/attr.hrl", 1).

-file("src/mod/partner/partner_lib.erl", 66).

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

-file("src/mod/partner/partner_lib.erl", 67).

-file("inc/log.hrl", 1).

-file("src/mod/partner/partner_lib.erl", 68).

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

-file("src/mod/partner/partner_lib.erl", 69).

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

-file("src/mod/partner/partner_lib.erl", 70).

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

-file("src/mod/partner/partner_lib.erl", 71).

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

-file("src/mod/partner/partner_lib.erl", 72).

-file("inc/dungeon.hrl", 1).

-record(m_dungeon,
	{ver = 6, mode = 1, chapter_id = 0, dun_id = 0,
	 max_dun_id = 0, last_hook_time = 0, list = [],
	 drop_idx = 0, ext_reward = [], buff_list = [],
	 fast_combat_add_time = 0, auto_combat_id = 0,
	 auto_combat_num = 0, auto_combat_items = [],
	 chapter_awrads = [], is_first = 1, acc_hook_time = 0,
	 acc_hook_items = []}).

-record(dun_chapter, {id = 0, status = 0, list = []}).

-record(dungeon,
	{id = 0, status = 0, cool_time = 0, auto_num = 0}).

-record(dungeon_data,
	{id = 0, name = <<>>, chapter_id = 0, mode = 1,
	 next_id = 0, unit_id = 0, items = [], drop_ids = [],
	 hook_unit_id = 0, hook_items = [], hook_drop_ids = [],
	 hook_lev_add = [], time = 0, is_big = 0, energy_max = 0,
	 auto_items = [], power = 0, lev_limit = 0, floor = 0}).

-record(dungeon_replay_log,
	{type = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(), sid = 0  :: binary(),
	 name = <<>>  :: binary(),
	 face_id = 0  :: non_neg_integer(),
	 time = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 repaly_id = 0  :: non_neg_integer(),
	 face_update_time = 0, face_file = <<>>}).

-record(dungeon_replay,
	{dun_id = 0  :: non_neg_integer(),
	 replays = []  :: [#dungeon_replay_log{}]}).

-file("src/mod/partner/partner_lib.erl", 73).

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

-file("src/mod/partner/partner_lib.erl", 74).

gm_set_lev(Role = #role{partner_bag =
			    PB = #partner_bag{partner_list = PartnerList}},
	   Lev) ->
    PartnerList1 = [P#partner{lev =
				  min(Lev, partner:get_max_lev(P))}
		    || P = #partner{} <- PartnerList],
    PartnerList2 = [calc_attr(Role, P)
		    || P = #partner{} <- PartnerList1],
    NewRole = Role#role{partner_bag =
			    PB#partner_bag{partner_list = PartnerList2}},
    partner:push_all_partner(NewRole),
    {ok, NewRole}.

gm_set_star(Role = #role{partner_bag =
			     PB = #partner_bag{partner_list = PartnerList}},
	    Bid, StarT) ->
    Stars = partner_data:get_stars_by_bid(Bid),
    Star1 = max(lists:min(Stars), StarT),
    Star = min(lists:max(Stars), Star1),
    Fun = fun (P = #partner{bid = BidT}, Acc) ->
		  case BidT == Bid of
		    true ->
			NewP = partner_lib:calc_attr(Role,
						     P#partner{star = Star}),
			[NewP | Acc];
		    _ -> [P | Acc]
		  end
	  end,
    PartnerList2 = lists:foldl(Fun, [], PartnerList),
    NewRole = Role#role{partner_bag =
			    PB#partner_bag{partner_list = PartnerList2}},
    partner:push_all_partner(NewRole),
    {ok, NewRole}.

gm_break(Role = #role{partner_bag =
			  PB = #partner_bag{partner_list = PartnerList}},
	 BeakLev) ->
    PartnerList1 = [P#partner{break_lev =
				  min(BeakLev, get_partner_break_max_lev(P))}
		    || P = #partner{} <- PartnerList],
    PartnerList2 = [calc_attr(Role, P)
		    || P = #partner{} <- PartnerList1],
    NewRole = Role#role{partner_bag =
			    PB#partner_bag{partner_list = PartnerList2}},
    partner:push_all_partner(NewRole),
    {ok, NewRole}.

gm_delete(Role = #role{partner_bag =
			   PB = #partner_bag{partner_list = PL}},
	  DelStar) ->
    {NewPL, DecPL} = lists:partition(fun (#partner{star =
						       Star}) ->
					     Star >= DelStar
				     end,
				     PL),
    NewRole = Role#role{partner_bag =
			    PB#partner_bag{partner_list = NewPL},
			m_formation = formation_lib:init(Role)},
    partner:push_all_partner(NewRole),
    DecId = [DId || #partner{id = DId} <- DecPL],
    sys_conn:pack_send(11006, {DecId}),
    {ok, NewRole}.

gm_partner_num(#role{partner_bag =
			 #partner_bag{partner_list = PList}}) ->
    Fun = fun (#partner{bid = Bid, star = Star}, Acc) ->
		  case lists:keyfind(Bid, 1, Acc) of
		    {Bid, Num, Stars} ->
			lists:keystore(Bid, 1, Acc,
				       {Bid, Num + 1, [Star | Stars]});
		    _ -> lists:keystore(Bid, 1, Acc, {Bid, 1, [Star]})
		  end
	  end,
    lists:foldl(Fun, [], PList).

gm_del_partner(Role = #role{partner_bag =
				PB = #partner_bag{partner_list = PList}},
	       Bid, Star, Num) ->
    NowPartners = [P
		   || P = #partner{bid = BidT, star = StarT} <- PList,
		      Bid == BidT andalso StarT == Star],
    case length(NowPartners) < Num of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidpartner_lib139, _,
	     {__Levelpartner_lib139, __Tracespartner_lib139}}
		when __Levelpartner_lib139 band 64 /= 0 orelse
		       __Tracespartner_lib139 /= [] ->
		lager:do_log(info,
			     [{module, partner_lib}, {function, gm_del_partner},
			      {line, 139}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("扣除伙伴失败~w",
					   [{length(NowPartners), Num}]),
			     none, 4096, 64, __Levelpartner_lib139,
			     __Tracespartner_lib139, lager_event,
			     __Pidpartner_lib139);
	    _ -> ok
	  end,
	  Role;
      _ ->
	  {DelPartners, _} = list_util:split(Num, NowPartners),
	  NewPList = PList -- DelPartners,
	  Role#role{partner_bag =
			PB#partner_bag{partner_list = NewPList}}
    end.

get_partner_break_max_lev(#partner{bid = Bid,
				   type = Type}) ->
    #partner_base_data{break_id = BreakId} =
	partner_data:get_base(Bid),
    lists:max(partner_data:get_break_levs({Type, BreakId})).

get_max_partner(#role{partner_bag =
			  #partner_bag{partner_list = PartnerList}},
		Num) ->
    PartnerList1 = [P
		    || P = #partner{end_time = EndTime} <- PartnerList,
		       EndTime =:= 0],
    List = lists:sublist(list_util:mkeysort2([{r,
					       #partner.star},
					      {r, #partner.lev},
					      {r, #partner.power}],
					     PartnerList1),
			 Num),
    List.

get_max_lev_partner(#role{partner_bag =
			      #partner_bag{partner_list = PartnerList}},
		    Num) ->
    Fun = fun (#partner{end_time = EndTime}, Acc)
		  when EndTime =/= 0 ->
		  Acc;
	      (#partner{id = Id, power = Power, lev = Lev,
			resonate_lev = RLev},
	       Acc) ->
		  case RLev =:= 0 of
		    true -> [{Id, Lev, Power} | Acc];
		    _ -> [{Id, RLev, Power} | Acc]
		  end
	  end,
    PartnerList1 = lists:foldl(Fun, [], PartnerList),
    List = lists:sublist(list_util:mkeysort2([{r, 2},
					      {r, 3}],
					     PartnerList1),
			 Num),
    List.

get_partner_lev(Role, PartnerId) ->
    case get_partner(Role, PartnerId) of
      #partner{lev = Lev, resonate_lev = RLev}
	  when RLev =/= 0 ->
	  RLev;
      #partner{lev = Lev, resonate_lev = RLev} -> Lev;
      _ -> 0
    end.

-spec get_break_by_lev(#partner{}) -> integer().

get_break_by_lev(P = #partner{lev = Lev}) ->
    MaxBreakLev = get_partner_break_max_lev(P),
    min(MaxBreakLev, partner_data:get_break_by_lev(Lev)).

-spec get_partner(#role{}, pos_integer()) -> false |
					     #partner{}.

get_partner(#role{partner_bag =
		      #partner_bag{partner_list = PartnerList}},
	    PartnerId) ->
    get_partner(PartnerList, PartnerId);
get_partner(#role_robot{partners = PartnerList},
	    PartnerId) ->
    get_partner(PartnerList, PartnerId);
get_partner(PartnerList, PartnerId) ->
    case lists:keyfind(PartnerId, #partner.id, PartnerList)
	of
      P = #partner{} -> P;
      _ -> false
    end.

-spec get_partner_by_bid(#role{},
			 pos_integer()) -> false | #partner{}.

get_partner_by_bid(#role{partner_bag =
			     #partner_bag{partner_list = PartnerList}},
		   PartnerBid) ->
    get_partner_by_bid(PartnerList, PartnerBid);
get_partner_by_bid(PartnerList, PartnerBid) ->
    case lists:keyfind(PartnerBid, #partner.bid,
		       PartnerList)
	of
      P = #partner{} -> P;
      _ -> false
    end.

-spec hase_partner_by_star(#role{}, pos_integer(),
			   pos_integer()) -> false | true.

hase_partner_by_star(Role = #role{p_bag = Bag,
				  partner_bag =
				      #partner_bag{partner_list = PL}},
		     Bid, Star) ->
    HasPartner = [{BidT, StarT}
		  || #partner{bid = BidT, star = StarT,
			      end_time = EndTimeT}
			 <- PL,
		     BidT == Bid andalso StarT >= Star andalso EndTimeT == 0]
		   =/= [],
    SkinIds = partner_data:get_constant(reborn_skin_id),
    HasSkin = partner_skin:has_skin(Role,
				    [SkinIdT || {SkinIdT, _} <- SkinIds]),
    ItemIds = [ItemIdT || {_, ItemIdT} <- SkinIds],
    ItemNum = lists:sum([begin
			   case package:count(by_base_id, Bid, Bag) of
			     {_, CountT} -> CountT;
			     _ -> 0
			   end
			 end
			 || Bid <- ItemIds]),
    HasItem = ItemNum > 0,
    HasSkin orelse HasPartner orelse HasItem.

-spec get_star(#role{}) -> pos_integer().

get_star(#role{partner_bag =
		   #partner_bag{partner_list = PartnerList,
				max_star = MaxStar}}) ->
    max(MaxStar,
	lists:sum([Star
		   || #partner{star = Star} <- PartnerList])).

-spec get_power(#role{} | #role_robot{},
		pos_integer() | list()) -> pos_integer().

get_power(#role_robot{partners = PartnerList},
	  PartnerId) ->
    get_power(PartnerList, PartnerId);
get_power(#role{partner_bag =
		    #partner_bag{partner_list = PartnerList}},
	  PartnerId) ->
    get_power(PartnerList, PartnerId);
get_power(PartnerList, PartnerIds)
    when is_list(PartnerIds) ->
    lists:sum([Power
	       || #partner{power = Power, id = Id} <- PartnerList,
		  lists:member(Id, PartnerIds)]);
get_power(PartnerList, PartnerId) ->
    case lists:keyfind(PartnerId, #partner.id, PartnerList)
	of
      #partner{power = Power} -> Power;
      _ -> 0
    end.

-spec get_partner_star(#role{} | #role_robot{},
		       pos_integer() | list()) -> pos_integer().

get_partner_star(#role_robot{partners = PartnerList},
		 PartnerId) ->
    get_partner_star(PartnerList, PartnerId);
get_partner_star(#role{partner_bag =
			   #partner_bag{partner_list = PartnerList}},
		 PartnerId) ->
    get_partner_star(PartnerList, PartnerId);
get_partner_star(PartnerList, PartnerIds)
    when is_list(PartnerIds) ->
    lists:sum([Star
	       || #partner{star = Star, id = Id} <- PartnerList,
		  lists:member(Id, PartnerIds)]);
get_partner_star(PartnerList, PartnerId) ->
    case lists:keyfind(PartnerId, #partner.id, PartnerList)
	of
      #partner{star = Star} -> Star;
      _ -> 0
    end.

-spec get_partner_formations(list(), #role{},
			     binary()) -> binary().

get_partner_formations([], _Role, Str) -> Str;
get_partner_formations([Id | Other], Role, Str) ->
    case partner_lib:get_partner(Role, Id) of
      #partner{bid = PBid} ->
	  #partner_base_data{name = PName} =
	      partner_data:get_base(PBid),
	  NStr = case Str of
		   <<>> -> PName;
		   _ -> <<Str/binary, "，"/utf8, PName/binary>>
		 end,
	  get_partner_formations(Other, Role, NStr);
      _ -> get_partner_formations(Other, Role, Str)
    end.

-spec partner_type(pos_integer()) -> non_neg_integer().

partner_type(PartnerBid) ->
    case partner_data:get_base(PartnerBid) of
      #partner_base_data{type = Type} -> Type;
      _ -> 0
    end.

-spec partnner_get_atom_attr(#role{}, pos_integer(),
			     atom()) -> non_neg_integer().

partnner_get_atom_attr(Role, PartnerId, Atom) ->
    case get_partner(Role, PartnerId) of
      #partner{all_attr = Attr} ->
	  attr_data:get_attr_val(Attr, Atom);
      _ -> 0
    end.

-spec expend_to_market(#role{}, list()) -> {ItmeList ::
						list(),
					    MarketList :: list()}.

expend_to_market(Role, Expend) ->
    Fun = fun ({IdT, NumT}, {Acc1, Acc2}) ->
		  case item_data:get(IdT) of
		    #item_base{id = Bid}
			when is_atom(Bid) orelse Bid < 1000 ->
			{[{IdT, NumT} | Acc1], Acc2};
		    #item_base{gain_type = GainType} ->
			{NewItems, MarketItems} = to_expend_to_market(Role,
								      GainType,
								      IdT,
								      NumT),
			{NewItems ++ Acc1, MarketItems ++ Acc2};
		    _ -> {[{IdT, NumT} | Acc1], Acc2}
		  end
	  end,
    lists:foldl(Fun, {[], []}, Expend).

to_expend_to_market(Role, Type, ItemId, ItemNum) ->
    Bag = case Type of
	    1 -> Role#role.p_bag;
	    _ -> Role#role.p_eqm
	  end,
    {_, Count} = package:count(by_base_id, ItemId, Bag),
    case package:count(by_base_id, ItemId, Bag) of
      {_, Count} when Count == 0 -> {[], [{ItemId, ItemNum}]};
      {_, Count} when ItemNum =< Count ->
	  {[{ItemId, ItemNum}], []};
      _ -> {[{ItemId, Count}], [{ItemId, ItemNum - Count}]}
    end.

-spec to_cli(list()) -> list().

to_cli(AttrList) ->
    [{attr_data:atom_to_int(AttrType), Val}
     || {AttrType, Val} <- AttrList].

-spec get_eqm_score(list()) -> pos_integer().

get_eqm_score(MainAttrTemp) ->
    Fun = fun ({Attr, Num}, Acc) ->
		  Score =
		      util:ceil(partner_eqm_data:get_addition_attr_score(Attr)
				  * Num
				  / 1000),
		  Score + Acc
	  end,
    lists:foldl(Fun, 0, MainAttrTemp).

-spec check_open(atom(), #role{}) -> false | true.

check_open(Atom = enchant, Role) ->
    LimitId = get_check_open_limit_id(Atom),
    case dungeon:get_dun(Role, LimitId) of
      {ok, #dungeon{status = 3}} -> true;
      _ ->
	  case dungeon_data:get(LimitId) of
	    #dungeon_data{name = Name} ->
		Msg = get_check_open_msg(Atom, Name), {false, Msg};
	    _ -> {false, lang:get(<<"开启限制条件配置出错"/utf8>>)}
	  end
    end;
check_open(Atom, Role) ->
    OpenCond = get_check_open_limit_id(Atom),
    case role_misc:check_open_cond(OpenCond, Role) of
      {false, Msg} -> {false, Msg};
      _ -> true
    end.

get_check_open_msg(enchant, Name) ->
    util:fbin(lang:get(<<"精炼需通关~ts解锁"/utf8>>), [Name]);
get_check_open_msg(star_up, Name) ->
    util:fbin(lang:get(<<"升星需通关~ts解锁"/utf8>>), [Name]);
get_check_open_msg(skill, Name) ->
    util:fbin(lang:get(<<"技能学习需通关~ts解锁"/utf8>>), [Name]);
get_check_open_msg(star, Name) ->
    util:fbin(lang:get(<<"星命需通关~ts解锁"/utf8>>), [Name]);
get_check_open_msg(_, _Name) ->
    lang:get(<<"参数错误"/utf8>>).

get_check_open_limit_id(enchant) ->
    partner_data:get_constant(refine_unlock);
get_check_open_limit_id(star_up) ->
    partner_data:get_constant(unlock_1);
get_check_open_limit_id(skill) ->
    partner_data:get_constant(unlock_2);
get_check_open_limit_id(star) ->
    partner_data:get_constant(unlock_3);
get_check_open_limit_id(_) -> 0.

-spec ref_formation_attr(#role{},
			 pos_integer()) -> #role{}.

ref_formation_attr(Role, 0) ->
    do_ref_formation_attr(Role);
ref_formation_attr(Role, Id) ->
    FieldIds = partner_field_lib:get_field_partners(Role),
    case lists:member(Id, FieldIds) of
      false -> Role;
      _ -> do_ref_formation_attr(Role)
    end.

do_ref_formation_attr(Role) ->
    FormationIds = formation_lib:list_partners(Role),
    {NewRole2, _} = ref_partner_by_type2(Role, [],
					 FormationIds),
    NewRole2.

-spec ref_partner_by_camp(#role{}, list(),
			  list()) -> #role{}.

ref_partner_by_camp(Role, RefType, OtherList) ->
    {NewRole, DoList} = ref_partner_by_camp2(Role, RefType,
					     OtherList),
    FieldIds =
	partner_field_lib:get_field_partners(NewRole),
    case [X || X <- FieldIds, Y <- DoList, X =:= Y] of
      [] -> NewRole;
      _ -> do_ref_formation_attr(NewRole)
    end.

ref_partner_by_camp2(Role = #role{partner_bag =
				      PartnerBag = #partner_bag{partner_list =
								    List}},
		     RefType, OtherList) ->
    RefPaetnerIds = case lists:member(0, RefType) of
		      true -> [IdT || #partner{id = IdT} <- List];
		      _ ->
			  [IdT2
			   || #partner{id = IdT2, camp_type = Type} <- List,
			      lists:member(Type, RefType)]
			    ++ OtherList
		    end,
    Fun = fun (P = #partner{id = Id}, {Acc1, Acc2}) ->
		  case lists:member(Id, RefPaetnerIds) of
		    true ->
			NewP = calc_attr(Role, P),
			{[NewP | Acc1], [NewP | Acc2]};
		    _ -> {[P | Acc1], Acc2}
		  end
	  end,
    {NewPartnerList, RefPartners} = lists:foldl(Fun,
						{[], []}, List),
    partner:push_ref_partners(Role, RefPartners),
    NewRole = Role#role{partner_bag =
			    PartnerBag#partner_bag{partner_list =
						       NewPartnerList}},
    {NewRole, RefPaetnerIds}.

-spec ref_partner_by_type(#role{}, list(),
			  list()) -> #role{}.

ref_partner_by_type(Role, RefType, OtherList) ->
    {NewRole, DoList} = ref_partner_by_type2(Role, RefType,
					     OtherList),
    FieldIds =
	partner_field_lib:get_field_partners(NewRole),
    case [X || X <- FieldIds, Y <- DoList, X =:= Y] of
      [] -> NewRole;
      _ -> do_ref_formation_attr(NewRole)
    end.

ref_partner_by_type2(Role = #role{partner_bag =
				      PartnerBag = #partner_bag{partner_list =
								    List}},
		     RefType, OtherList) ->
    RefPaetnerIds = case lists:member(0, RefType) of
		      true -> [IdT || #partner{id = IdT} <- List];
		      _ ->
			  [IdT2
			   || #partner{id = IdT2, type = Type} <- List,
			      lists:member(Type, RefType)]
			    ++ OtherList
		    end,
    Fun = fun (P = #partner{id = Id}, {Acc1, Acc2}) ->
		  case lists:member(Id, RefPaetnerIds) of
		    true ->
			NewP = calc_attr(Role, P),
			{[NewP | Acc1], [NewP | Acc2]};
		    _ -> {[P | Acc1], Acc2}
		  end
	  end,
    {NewPartnerList, RefPartners} = lists:foldl(Fun,
						{[], []}, List),
    partner:push_ref_partners(Role, RefPartners),
    NewRole = Role#role{partner_bag =
			    PartnerBag#partner_bag{partner_list =
						       NewPartnerList}},
    {NewRole, RefPaetnerIds}.

-spec calc_attr_add_field(#role{},
			  #partner{}) -> non_neg_integer().

calc_attr_add_field(Role,
		    P = #partner{id = Id, base_attr = BaseAttr,
				 all_attr = AllAttr0}) ->
    FormationIds = formation_lib:list_partners(Role),
    case lists:member(Id, FormationIds) of
      false ->
	  FieldAttrs = partner_field_lib:get_field_attr(Role),
	  FieldAttr2 = field_attr(Role, BaseAttr, FieldAttrs),
	  AllAttr = attr_data:mix_attr_and_attr(AllAttr0,
						FieldAttr2),
	  P#partner{all_attr = AllAttr};
      _ -> P
    end.

-spec gen_guild_skill_attr(#role{},
			   #partner{}) -> {#attr{}, #attr{}}.

gen_guild_skill_attr(Role,
		     P = #partner{bid = Bid, lev = Lev, star = Star,
				  star_step = StarStep,
				  break_skills = BreakSkills,
				  break_lev = BreakLev, type = Type}) ->
    InitAttr = partner_data:get_attr(Bid),
    {BaseAttrT, _} = lev_attr_addition(InitAttr, Lev, Bid,
				       Star, StarStep, BreakLev, Type),
    BreakAttr = partner_data:get_break_attr({Type,
					     BreakLev}),
    BreakAttr2 = break_attr(Role, BaseAttrT, BreakAttr),
    BaseAttr = attr_data:mix_attr_and_attr(BaseAttrT,
					   BreakAttr2),
    Skills = get_partner_skills(P),
    AllSkills = Skills ++
		  [SkillIdTemp
		   || {_, SkillIdTemp} <- BreakSkills, SkillIdTemp > 0],
    SkillPower = skill_lib:skill_power(AllSkills),
    {BaseAttr, guild_skill:calc_attr(Role, P, BaseAttr),
     SkillPower}.

-spec calc_attr_n(#role{}, #partner{}) -> #partner{}.

calc_attr_n(Role, PartnerT) ->
    Partner = PartnerT#partner{skills =
				   get_partner_skills1(PartnerT)},
    {BaseAttr, AllAttr, SetSkills, GroupAttr} =
	gen_attr(Role, Partner),
    P1 = Partner#partner{base_attr = BaseAttr,
			 all_attr = AllAttr, group_attr = GroupAttr,
			 set_skills = SetSkills},
    calc_power(P1).

-spec ref_partner_stronger(#role{}) -> #role{}.

ref_partner_stronger(Role) ->
    FormationIds = formation_lib:list_partners(Role),
    ref_partner_stronger2(Role, FormationIds).

ref_partner_stronger2(Role, []) -> Role;
ref_partner_stronger2(Role = #role{partner_bag =
				       PB = #partner_bag{partner_list = List}},
		      [Id | FormationIds]) ->
    case lists:keyfind(Id, #partner.id, List) of
      false -> ref_partner_stronger2(Role, FormationIds);
      P ->
	  P2 = P#partner{},
	  NewList = lists:keystore(Id, #partner.id, List, P2),
	  NewRole = Role#role{partner_bag =
				  PB#partner_bag{partner_list = NewList}},
	  ref_partner_stronger2(NewRole, FormationIds)
    end.

-spec calc_all_attr_no_push(#role{}) -> #partner{}.

calc_all_attr_no_push(Role = #role{partner_bag =
				       PartnersBag = #partner_bag{partner_list =
								      L}}) ->
    NewL = [partner_lib:calc_attr(Role, P) || P <- L],
    Role#role{partner_bag =
		  PartnersBag#partner_bag{partner_list = NewL}}.

-spec calc_attr(#role{}, #partner{}) -> #partner{}.

calc_attr(Role,
	  PartnerT = #partner{bid = Bid, break_lev = BreakLev,
			      lev = Lev, star = Star,
			      dower_skill = DowerSkill}) ->
    NewDowerSkill = case Star < 13 of
		      true -> lists:keydelete(3, 1, DowerSkill);
		      _ -> DowerSkill
		    end,
    #partner_base_data{type = Type, camp_type = CampType} =
	partner_data:get_base(Bid),
    Partner = PartnerT#partner{type = Type,
			       camp_type = CampType,
			       skills = get_partner_skills1(PartnerT),
			       dower_skill = NewDowerSkill},
    {BaseAttr, AllAttr, SetSkills, GroupAttr} =
	gen_attr(Role, Partner),
    P1 = Partner#partner{base_attr = BaseAttr,
			 all_attr = AllAttr, group_attr = GroupAttr,
			 set_skills = SetSkills, lev = max(Lev, BreakLev * 10)},
    Scores = stronger_lib:calc_score(Role, P1),
    P2 = P1#partner{score_lists = Scores},
    stronger_mgr:check_first_partner(P2),
    put(partner_attr_update, 1),
    calc_power(P2).

-spec gen_attr(#role{}, #partner{}) -> {#attr{},
					#attr{}, list(), #group_attr{}}.

gen_attr(Role = #role{misc =
			  #role_misc{gm_attr = GmAttr}},
	 P = #partner{bid = Bid, dower_skill = DowetSkills,
		      type = Type, lev = Lev, break_skills = BreakSkills,
		      awaken_skills = AwakenSkills, break_lev = BreakLev,
		      star = Star, star_step = StarStep, eqm = Eqm,
		      camp_type = CampType, holy_eqm = HolyEqm}) ->
    InitAttr = partner_data:get_attr(Bid),
    {BaseAttr1, GroupAttr} = lev_attr_addition(InitAttr,
					       Lev, Bid, Star, StarStep,
					       BreakLev, Type),
    Skills2 = get_partner_skills(P),
    SkillAttr = skill_lib:skill_attrs(Lev,
				      do_remove_skills(Skills2)),
    {ok, #attr_calc{attr = AttrAdd, ratio = Ratio}} =
	attr_data:do_sub_list(SkillAttr, 1, 4, #attr_calc{}),
    BaseAttrT1 = attr_data:mix_attr_and_attr(BaseAttr1,
					     AttrAdd),
    BaseAttrT2 = attr_data:mix_attr_and_ratio(BaseAttrT1,
					      Ratio),
    BaseAttr2 = attr_data:mix_attr_and_attr(BaseAttrT1,
					    BaseAttrT2),
    #partner_base_data{break_id = BreakId} =
	partner_data:get_base(Bid),
    BreakAttr = partner_data:get_break_attr({Type, BreakId,
					     BreakLev}),
    PartnerStarAtt = partner_data:get_star_attr({Bid,
						 Star}),
    Attr1 = merge(BreakAttr, PartnerStarAtt),
    EqmAttrs = lists:flatten([EqmMain ++ EqmAttrT
			      || #item{main_attr = EqmMain, attr = EqmAttrT}
				     <- Eqm]),
    EqmSetAttr = partner_eqm:get_set_attr(P),
    Attr2 = merge(Attr1, EqmAttrs ++ EqmSetAttr),
    ArtifactAttr = partner_artifact:get_artifact_attr(P),
    Attr3 = merge(Attr2, ArtifactAttr),
    GuildSkillAttr = guild_skill:calc_attr(Role, P),
    Attr5 = merge(Attr3, GuildSkillAttr),
    GuildQuestAttr = guild_quest:calc_attr(Role),
    Attr6 = merge(Attr5, GuildQuestAttr),
    ArtifactSkills = partner_artifact:get_artifact_skill(P),
    AllSkills = [SkillIdTemp
		 || {_, SkillIdTemp}
			<- BreakSkills ++ AwakenSkills ++ DowetSkills,
		    SkillIdTemp > 0]
		  ++ ArtifactSkills,
    SkillAttr2 = skill_lib:skill_attrs(Lev,
				       do_remove_skills(AllSkills)),
    Attr7 = merge(Attr6, SkillAttr2),
    ProfileAttr = profile_attr:attr_list(Role),
    Attr8 = merge(Attr7, ProfileAttr),
    HalidomAttr = halidom:calc_attr(Role, CampType),
    HolyEqmAttrs = lists:flatten([EqmMain ++
				    [{AttrIdT, ValT}
				     || {Pos, AttrIdT, ValT} <- HolyExtEqmAttr,
					Pos < 100]
				  || #item{main_attr = EqmMain,
					   holy_eqm_attr = HolyExtEqmAttr}
					 <- HolyEqm]),
    {HolyEqmExtAttrs, HolyEqmSkills} =
	partner_holy_eqm:get_set_skill(P),
    Attr9 = merge(Attr8, HolyEqmAttrs ++ HolyEqmExtAttrs),
    SkinAttrs = partner_skin:calc_attr(Role, Bid),
    Attr10 = merge(Attr9, SkinAttrs),
    ResonateAttrs = resonate_lib:get_attr(Role),
    {ok, AttrCalc1} = attr_data:do_sub_list(Attr10, 1, 4,
					    #attr_calc{}),
    {ok, AttrCalc2} = attr_data:do_sub_list(ResonateAttrs,
					    2, 2, AttrCalc1),
    {ok,
     #attr_calc{attr = AttrAdd2, attr_no_ratio = AttrNoRatio,
		ratio = Ratio2}} =
	attr_data:do_sub_list(HalidomAttr, 2, 2, AttrCalc2),
    AllAttr3 = attr_data:mix_attr_and_attr(BaseAttr2,
					   AttrAdd2),
    AllAttr4 = attr_data:mix_attr_and_ratio(AllAttr3,
					    Ratio2),
    AllAttr5 = attr_data:mix_attr_and_attr(AllAttr3,
					   AllAttr4),
    AllAttr6 = attr_data:mix_attr_and_attr(AttrNoRatio,
					   AllAttr5),
    AllAttr = attr_calc:apply_attr_in_combat(AllAttr6,
					     GmAttr),
    SetSkills = ArtifactSkills ++
		  [SkillIdTemp
		   || {_, SkillIdTemp} <- DowetSkills, SkillIdTemp > 0]
		    ++ HolyEqmSkills,
    {lev_attr_ceil(AllAttr), AllAttr, SetSkills, GroupAttr}.

-spec show_holy_eqm_gen_attr(#role{},
			     #partner{}) -> {#attr{}, pos_integer()}.

show_holy_eqm_gen_attr(Role,
		       P = #partner{bid = Bid, dower_skill = DowetSkills,
				    type = Type, lev = Lev,
				    break_skills = BreakSkills,
				    awaken_skills = AwakenSkills,
				    break_lev = BreakLev, star = Star,
				    star_step = StarStep, eqm = Eqm,
				    camp_type = CampType,
				    holy_eqm = HolyEqm}) ->
    InitAttr = partner_data:get_attr(Bid),
    {BaseAttr1, _} = lev_attr_addition(InitAttr, Lev, Bid,
				       Star, StarStep, BreakLev, Type),
    Skills2 = get_partner_skills(P),
    SkillAttr = skill_lib:skill_attrs(Lev,
				      do_remove_skills(Skills2)),
    {ok, #attr_calc{attr = AttrAdd, ratio = Ratio}} =
	attr_data:do_sub_list(SkillAttr, 1, 4, #attr_calc{}),
    BaseAttrT1 = attr_data:mix_attr_and_attr(BaseAttr1,
					     AttrAdd),
    BaseAttrT2 = attr_data:mix_attr_and_ratio(BaseAttrT1,
					      Ratio),
    BaseAttr2 = attr_data:mix_attr_and_attr(BaseAttrT1,
					    BaseAttrT2),
    #partner_base_data{break_id = BreakId} =
	partner_data:get_base(Bid),
    BreakAttr = partner_data:get_break_attr({Type, BreakId,
					     BreakLev}),
    PartnerStarAtt = partner_data:get_star_attr({Bid,
						 Star}),
    Attr1 = merge(BreakAttr, PartnerStarAtt),
    EqmAttrs = lists:flatten([EqmMain ++ EqmAttrT
			      || #item{main_attr = EqmMain, attr = EqmAttrT}
				     <- Eqm]),
    EqmSetAttr = partner_eqm:get_set_attr(P),
    Attr2 = merge(Attr1, EqmAttrs ++ EqmSetAttr),
    ArtifactAttr = partner_artifact:get_artifact_attr(P),
    Attr3 = merge(Attr2, ArtifactAttr),
    GuildSkillAttr = guild_skill:calc_attr(Role, P),
    Attr5 = merge(Attr3, GuildSkillAttr),
    GuildQuestAttr = guild_quest:calc_attr(Role),
    Attr6 = merge(Attr5, GuildQuestAttr),
    ArtifactSkills = partner_artifact:get_artifact_skill(P),
    AllSkills = [SkillIdTemp
		 || {_, SkillIdTemp}
			<- BreakSkills ++ AwakenSkills ++ DowetSkills,
		    SkillIdTemp > 0]
		  ++ ArtifactSkills,
    SkillAttr2 = skill_lib:skill_attrs(Lev,
				       do_remove_skills(AllSkills)),
    Attr7 = merge(Attr6, SkillAttr2),
    ProfileAttr = profile_attr:attr_list(Role),
    Attr8 = merge(Attr7, ProfileAttr),
    _HalidomAttr = halidom:calc_attr(Role, CampType),
    HolyEqmAttrs = lists:flatten([EqmMain ++
				    [{AttrIdT, ValT}
				     || {Pos, AttrIdT, ValT} <- HolyExtEqmAttr,
					Pos < 100]
				  || #item{main_attr = EqmMain,
					   holy_eqm_attr = HolyExtEqmAttr}
					 <- HolyEqm]),
    {HolyEqmExtAttrs, _} =
	partner_holy_eqm:get_set_skill(P),
    HolyEqmAllAttrs = HolyEqmAttrs ++ HolyEqmExtAttrs,
    Attr9 = Attr8,
    {ok, #attr_calc{attr = AttrAdd2, ratio = Ratio2}} =
	attr_data:do_sub_list(Attr9, 1, 4, #attr_calc{}),
    AllAttr3 = attr_data:mix_attr_and_attr(BaseAttr2,
					   AttrAdd2),
    {ok, #attr_calc{attr = AttrAdd3, ratio = Ratio3}} =
	attr_data:do_sub_list(HolyEqmAllAttrs, 1, 4,
			      #attr_calc{}),
    HolyEqmAllAttr1 = attr_data:mix_attr_and_ratio(AttrAdd3,
						   Ratio2),
    HolyEqmAllAttr2 = attr_data:mix_attr_and_ratio(AllAttr3,
						   Ratio3),
    HolyEqmAllAttr3 = attr_data:mix_attr_and_ratio(AttrAdd3,
						   Ratio3),
    HolyEqmAllAttr4 =
	attr_data:mix_attr_and_attr(HolyEqmAllAttr1,
				    HolyEqmAllAttr2),
    HolyEqmAllAttr5 =
	attr_data:mix_attr_and_attr(HolyEqmAllAttr3,
				    HolyEqmAllAttr4),
    HolyEqmAllAttr = attr_data:mix_attr_and_attr(AttrAdd3,
						 HolyEqmAllAttr5),
    Power = attr_data:partner_base_power(HolyEqmAllAttr) div
	      1000,
    {HolyEqmAllAttr, Power}.

merge([], L) -> L;
merge([{Attr, Num} | T], L) ->
    case [{B, N} || {B, N} <- L, B =:= Attr] of
      [I = {Attr, N} | _] ->
	  merge(T, [{Attr, N + Num} | L -- [I]]);
      _ -> merge(T, [{Attr, Num} | L])
    end.

-spec partner_base_power(#attr{}) -> pos_integer().

partner_base_power(Attr) ->
    attr_data:attr_atom2partner_power(atk) *
      max(Attr#attr.atk - 0, 0)
      +
      attr_data:attr_atom2partner_power(def_p) *
	max(Attr#attr.def_p - 0, 0)
      +
      attr_data:attr_atom2partner_power(def_s) *
	max(Attr#attr.def_s - 0, 0)
      +
      attr_data:attr_atom2partner_power(hp_max) *
	max(Attr#attr.hp_max - 0, 0)
      +
      attr_data:attr_atom2partner_power(speed) *
	max(Attr#attr.speed - 0, 0)
      +
      attr_data:attr_atom2partner_power(def) *
	max(Attr#attr.def - 0, 0)
      +
      attr_data:attr_atom2partner_power(hit_rate) *
	max(Attr#attr.hit_rate - 0, 0)
      +
      attr_data:attr_atom2partner_power(dodge_rate) *
	max(Attr#attr.dodge_rate - 0, 0)
      +
      attr_data:attr_atom2partner_power(crit_rate) *
	max(Attr#attr.crit_rate - 0, 0)
      +
      attr_data:attr_atom2partner_power(crit_ratio) *
	max(Attr#attr.crit_ratio - 0, 0)
      +
      attr_data:attr_atom2partner_power(hit_magic) *
	max(Attr#attr.hit_magic - 0, 0)
      +
      attr_data:attr_atom2partner_power(dodge_magic) *
	max(Attr#attr.dodge_magic - 0, 0)
      +
      attr_data:attr_atom2partner_power(tenacity) *
	max(Attr#attr.tenacity - 0, 0)
      +
      attr_data:attr_atom2partner_power(dam) *
	max(Attr#attr.dam - 0, 0)
      +
      attr_data:attr_atom2partner_power(res) *
	max(Attr#attr.res - 0, 0)
      +
      attr_data:attr_atom2partner_power(cure) *
	max(Attr#attr.cure - 0, 0)
      +
      attr_data:attr_atom2partner_power(be_cure) *
	max(Attr#attr.be_cure - 0, 0)
      +
      attr_data:attr_atom2partner_power(dam_p) *
	max(Attr#attr.dam_p - 0, 0)
      +
      attr_data:attr_atom2partner_power(dam_s) *
	max(Attr#attr.dam_s - 0, 0)
      +
      attr_data:attr_atom2partner_power(res_p) *
	max(Attr#attr.res_p - 0, 0)
      +
      attr_data:attr_atom2partner_power(res_s) *
	max(Attr#attr.res_s - 0, 0).

do_remove_skills(Skills) ->
    Fun = fun (Id, ListT) ->
		  case skill_data:get_skill(Id) of
		    #skill_data{group = Group, level = Lev} ->
			case lists:keyfind(Group, 1, ListT) of
			  false -> [{Group, Id, Lev} | ListT];
			  {Group, _OldId, OldLev} when Lev =< OldLev -> ListT;
			  _ -> lists:keystore(Group, 1, ListT, {Group, Id, Lev})
			end;
		    _ -> ListT
		  end
	  end,
    SkillList = lists:foldl(Fun, [], Skills),
    [Id || {_, Id, _} <- SkillList].

calc_power(Partner = #partner{power = OldPower,
			      break_skills = BreakSkills, all_attr = Attr,
			      set_skills = SetSkillIds}) ->
    Power = attr_data:partner_base_power(Attr) div 1000,
    SkillIds = get_partner_skills(Partner),
    SkillPower = skill_lib:skill_power(SkillIds ++
					 SetSkillIds ++
					   [SkillIdTemp
					    || {_, SkillIdTemp} <- BreakSkills,
					       SkillIdTemp > 0]),
    case OldPower =/= Power + SkillPower of
      true -> put(rank_partner_power, 1);
      _ -> skip
    end,
    Partner#partner{power = Power + SkillPower}.

get_partner_skills1(#partner{type = Type, bid = Bid,
			     star = Star, break_lev = BreakLev}) ->
    #partner_base_data{break_id = BreakId} =
	partner_data:get_base(Bid),
    SkillNum = partner_data:get_skill_num({Type, BreakId,
					   BreakLev}),
    Skills = partner_data:get_skills({Bid, Star}),
    [{SkillM, SkillId}
     || {SkillM, SkillId} <- Skills, SkillM =< SkillNum].

get_partner_skills(#partner{type = Type, bid = Bid,
			    break_lev = BreakLev, skills = Skills}) ->
    #partner_base_data{break_id = BreakId} =
	partner_data:get_base(Bid),
    SkillNum = partner_data:get_skill_num({Type, BreakId,
					   BreakLev}),
    [SkillId
     || {SkillM, SkillId} <- Skills, SkillM =< SkillNum].

-spec rare_type_name(integer()) -> binary().

rare_type_name(2) -> <<"S">>;
rare_type_name(3) -> <<"SS">>;
rare_type_name(_) -> <<"A">>.

lev_attr_ceil(Attr = #attr{atk = Atk, def = Def,
			   hp_max = HpMax, speed = Speed}) ->
    Attr#attr{atk = util:ceil(Atk),
	      hp_max = util:ceil(HpMax), def = util:ceil(Def),
	      speed = util:ceil(Speed)}.

lev_attr_addition(Attr = #attr{atk = Atk, def = Def,
			       hp_max = HpMax, speed = Speed},
		  Lev, Bid, Star, StarStep, BreakLev, Type) ->
    GroupAttr = #group_attr{atk = AddAtk, hp_max = AddHp,
			    def = AddDef, speed = SpeedDef} =
		    get_group(Bid, Star, StarStep, BreakLev, Type),
    {Attr#attr{atk = Atk + Lev * AddAtk,
	       hp_max = HpMax + Lev * AddHp, def = Def + Lev * AddDef,
	       speed = Speed + Lev * SpeedDef},
     GroupAttr}.

get_group(Bid, Star, _StarStep, BreakLev, Type) ->
    #partner_lev_data{add_hp = Hp, add_atk = Dps,
		      add_def = Def, add_speed = Speed} =
	partner_data:get_lev_attr(Bid),
    #partner_base_data{break_id = BreakId} =
	partner_data:get_base(Bid),
    #partner_lev_data{add_hp = Hp1, add_atk = Dps1,
		      add_def = Def1, add_speed = Speed1} =
	partner_data:get_star_group_attr({Bid, Star}),
    #partner_lev_data{add_hp = Hp2, add_atk = Dps2,
		      add_def = Def2, add_speed = Speed2} =
	partner_data:get_break_group_attr({Type, BreakId,
					   BreakLev}),
    #group_attr{atk =
		    Dps * Dps1 * Dps2 * 1.0e-3 * 1.0e-3 * 1.0e-3,
		hp_max = Hp * Hp1 * Hp2 * 1.0e-3 * 1.0e-3 * 1.0e-3,
		def = Def * Def1 * Def2 * 1.0e-3 * 1.0e-3 * 1.0e-3,
		speed =
		    Speed * Speed1 * Speed2 * 1.0e-3 * 1.0e-3 * 1.0e-3}.

break_attr(_Role, BaseAttr, BreakAttr) ->
    {ok, #attr_calc{attr = AttrAdd, ratio = Ratio}} =
	attr_data:do_sub_list(BreakAttr, 1, 4, #attr_calc{}),
    Attr1 = attr_data:mix_attr_and_ratio(BaseAttr, Ratio),
    attr_data:mix_attr_and_attr(AttrAdd, Attr1).

field_attr(_Role, BaseAttr, Attr) ->
    {ok, #attr_calc{attr = AttrAdd, ratio = Ratio}} =
	attr_data:do_sub_list(Attr, 1, 4, #attr_calc{}),
    Attr1 = attr_data:mix_attr_and_ratio(BaseAttr, Ratio),
    attr_data:mix_attr_and_attr(AttrAdd, Attr1).

-spec gen_fight_object(#role{}, #partner{},
		       pos_integer()) -> #fight_object{}.

gen_fight_object(Role, Partner, IsLeader) ->
    gen_fight_object_role(Role, Partner, IsLeader, 0).

gen_fight_object_role(Role = #role{id = Rid, pid = Pid},
		      Partner, IsLeader, IsClone) ->
    ReplayExtData = role_view:to_attr_ext_data([guild_skill,
						halidom],
					       Role, Partner, []),
    gen_fight_object_(Rid, Pid, Partner, IsLeader, Rid,
		      IsClone, ReplayExtData).

gen_fight_object_robot(Robot = #role_robot{id = Rid},
		       Pid, Partner, IsLeader, OwnerId, IsClone) ->
    ReplayExtData = role_view:to_attr_ext_data([guild_skill,
						halidom],
					       Robot, Partner, []),
    gen_fight_object_(Rid, Pid, Partner, IsLeader, OwnerId,
		      IsClone, ReplayExtData).

gen_fight_object(RId, PId, Partner, IsLeader,
		 OwnerId) ->
    gen_fight_object_(RId, PId, Partner, IsLeader, OwnerId,
		      0, []).

gen_fight_object(Robot = #role_robot{}, PId, Partner,
		 IsLeader, OwnerId, IsClone) ->
    gen_fight_object_robot(Robot, PId, Partner, IsLeader,
			   OwnerId, IsClone);
gen_fight_object(RId, PId, Partner, IsLeader, OwnerId,
		 IsClone) ->
    gen_fight_object_(RId, PId, Partner, IsLeader, OwnerId,
		      IsClone, []).

gen_fight_object_(RId, PId, Partner, _IsLeader, OwnerId,
		  IsClone, ReplayExtData) ->
    #partner{id = Id, bid = Bid, lev = Lev,
	     base_attr = BaseAttr, all_attr = Attr, power = Power,
	     name = Name, break_lev = BreakLev,
	     break_skills = BreakSkills, use_skin = UseSkin,
	     set_skills = SetSkills, star = Star, quality = Quality,
	     hidden_skills = HiddenSkills, end_time = EndTime,
	     resonate_lev = ResonateLev} =
	Partner,
    Skills2 = get_partner_skills(Partner),
    #partner_base_data{other_skills = OtherSkills,
		       type = Type, camp_type = CampType} =
	partner_data:get_base(Bid),
    AllSkillsT = SetSkills ++
		   Skills2 ++
		     [SkillIdTemp
		      || {_, SkillIdTemp} <- BreakSkills, SkillIdTemp > 0]
		       ++ HiddenSkills,
    AllSkills = do_remove_skills(AllSkillsT),
    {ActiveSkillIds, PassiveSkillIds} =
	skill_lib:split_skills(AllSkills),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_lib840, _,
       {__Levelpartner_lib840, __Tracespartner_lib840}}
	  when __Levelpartner_lib840 band 128 /= 0 orelse
		 __Tracespartner_lib840 /= [] ->
	  lager:do_log(debug,
		       [{module, partner_lib}, {function, gen_fight_object_},
			{line, 840}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("gen fight object ~w, ~w, ~w, ~w,~w",
				     [Bid, AllSkillsT, AllSkills,
				      ActiveSkillIds, PassiveSkillIds]),
		       none, 4096, 128, __Levelpartner_lib840,
		       __Tracespartner_lib840, lager_event,
		       __Pidpartner_lib840);
      _ -> ok
    end,
    SkillGroupsT = partner_data:get_skill_order({Bid,
						 Star}),
    {ActiveSkills, SkillGroups} =
	skill_lib:transfer_skill(ActiveSkillIds ++ OtherSkills,
				 PassiveSkillIds, SkillGroupsT),
    PassiveSkills = [skill_data:get_skill(TId)
		     || TId <- PassiveSkillIds],
    SkillsOrder = lists:filtermap(fun (GroupId) ->
					  case lists:keyfind(GroupId,
							     #skill_data.group,
							     ActiveSkills)
					      of
					    false -> {true, 0};
					    #skill_data{bid = SId} ->
						{true, SId}
					  end
				  end,
				  SkillGroups),
    ExtraData = [{5, UseSkin},
		 {10, util:if_true(EndTime =/= 0, 1, 0)},
		 {11, ResonateLev}],
    ItemFun = fun (L) ->
		      [{attr_data:attr_atom2id(K), util:uceil(V * 1000)}
		       || {K, V} <- L]
	      end,
    ItemFunBase = fun (L) ->
			  [{attr_data:attr_atom2id(K), util:uceil(V)}
			   || {K, V} <- L]
		  end,
    NewReplayExtData = [{5, UseSkin},
			{111, Attr#attr.hit_rate}, {112, Attr#attr.dodge_rate},
			{117, Attr#attr.tenacity}, {121, Attr#attr.dam},
			{122, Attr#attr.res}, {123, Attr#attr.cure},
			{124, Attr#attr.be_cure}, {125, Attr#attr.dam_p},
			{126, Attr#attr.dam_s}, {127, Attr#attr.res_p},
			{128, Attr#attr.res_s}, {11, ResonateLev}
			| ReplayExtData],
    Artifacts = [{Item#item.id, Item#item.base_id, ArtPos,
		  Item#item.enchant, ItemFun(Item#item.attr),
		  ItemFun(Item#item.extra_attr), Item#item.extra}
		 || {ArtPos, Item} <- Partner#partner.artifacts],
    HolyEqms = [{Item#item.id, Item#item.base_id,
		 100 + Item#item.type, Item#item.enchant,
		 ItemFunBase(Item#item.attr),
		 ItemFunBase([{KT, VT}
			      || {Pos, KT, VT} <- Item#item.holy_eqm_attr,
				 Pos < 100]),
		 Item#item.extra}
		|| Item = #item{} <- Partner#partner.holy_eqm],
    Replay = #replay_partner{id = Id, bid = Bid, lev = Lev,
			     star = Star, break_lev = BreakLev,
			     hp = Attr#attr.hp_max, hp_max = Attr#attr.hp_max,
			     power = Power, atk = Attr#attr.atk,
			     def = Attr#attr.def, speed = Attr#attr.speed,
			     crit_rate = Attr#attr.crit_rate,
			     crit_ratio = Attr#attr.crit_ratio,
			     hit_magic = Attr#attr.hit_magic,
			     dodge_magic = Attr#attr.dodge_magic,
			     skills = Partner#partner.skills,
			     eqms =
				 [{ItemId, ItemBid, ItemType}
				  || #item{id = ItemId, base_id = ItemBid,
					   type = ItemType}
					 <- Partner#partner.eqm],
			     artifacts = Artifacts ++ HolyEqms,
			     ext = NewReplayExtData},
    #fight_object{master_id = RId, master_pid = PId,
		  object_type = 2, object_bid = Bid, object_id = Id,
		  lev = Lev, init_attr = BaseAttr, base_attr = Attr,
		  fight_attr = Attr,
		  hp = attr_data:get_attr_val(Attr, hp_max),
		  hp_max = attr_data:get_attr_val(Attr, hp_max),
		  object_name = Name, active_skills = ActiveSkills,
		  passive_skills = PassiveSkills,
		  skill_order = SkillsOrder, star = Star,
		  owner_id = OwnerId, is_clone = IsClone,
		  quality = Quality,
		  initial_hp_max = attr_data:get_attr_val(Attr, hp_max),
		  extra_data = ExtraData, camp_type = CampType,
		  career = Type, power = Power, replay = Replay}.

get_all_skills(Partner = #partner{break_skills =
				      BreakSkills,
				  set_skills = SetSkills,
				  hidden_skills = HiddenSkills}) ->
    Skills2 = get_partner_skills(Partner),
    AllSkillsT = Skills2 ++
		   [SkillIdTemp
		    || {_, SkillIdTemp} <- BreakSkills, SkillIdTemp > 0]
		     ++ HiddenSkills ++ SetSkills,
    do_remove_skills(AllSkillsT).


