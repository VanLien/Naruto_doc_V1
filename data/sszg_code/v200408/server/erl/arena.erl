-file("src/mod/data/arena.erl", 1).

-module(arena).

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
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
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
		{buff_data,
		 [bid, name, type, time_type, group, effect, seconds]},
		{role_buff, [ver, buff_list]},
		{role_buff_data, [bid, group, effect, end_time]},
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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

-export([gm_apply_reward_refresh/1, init/0, login/1,
	 zero_flush/1, five_flush/1, apply_reward_refresh/1,
	 gm/2, role_score_lev/1, push/1, push_list/2,
	 push_season_reward/1, push_def_lose/1, check_open/1,
	 init_refresh_list/1, refresh_list/1, get_target_info/2,
	 find_partner/3, buy_combat_num/2, combat/3,
	 combat_over/4, season_reward/2, add_log/2,
	 set_formation/2, set_best_rank/2, can_skip_combat/1,
	 merge_flush/1, del_target_log/1]).

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

-file("src/mod/data/arena.erl", 37).

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

-file("src/mod/data/arena.erl", 38).

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

-file("src/mod/data/arena.erl", 39).

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

-file("src/mod/data/arena.erl", 40).

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

-file("src/mod/data/arena.erl", 41).

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

-file("src/mod/data/arena.erl", 42).

-file("inc/attr.hrl", 1).

-file("src/mod/data/arena.erl", 43).

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

-file("src/mod/data/arena.erl", 44).

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

-file("src/mod/data/arena.erl", 45).

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

-file("src/mod/data/arena.erl", 46).

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

-file("src/mod/data/arena.erl", 47).

-file("inc/log.hrl", 1).

-file("src/mod/data/arena.erl", 48).

-file("inc/buff.hrl", 1).

-record(role_buff_data,
	{bid, group, effect = [], end_time}).

-record(role_buff,
	{ver = 1, buff_list = []  :: [#role_buff_data{}]}).

-record(buff_data,
	{bid, name, type, time_type, group, effect = [],
	 seconds}).

-file("src/mod/data/arena.erl", 49).

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

-file("src/mod/data/arena.erl", 50).

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

-file("src/mod/data/arena.erl", 51).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/data/arena.erl", 52).

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

-file("src/mod/data/arena.erl", 53).

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

-file("src/mod/data/arena.erl", 54).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/data/arena.erl", 55).

-spec gm_apply_reward_refresh(#role{}) -> {ok,
					   #role{}} |
					  ok.

gm_apply_reward_refresh(Role = #role{m_arena =
					 MArena}) ->
    NewMArena = MArena#m_arena{season_reward = [],
			       had_combat_num = 0, season_ref_time = 0},
    NewRole = Role#role{m_arena = NewMArena},
    push_season_reward(NewRole),
    {ok, NewRole}.

-spec init() -> #m_arena{}.

init() ->
    #m_arena{can_combat_num = arena_data:vip_free(0)}.

-spec login(#role{}) -> ok | {ok, #role{}}.

login(Role = #role{id = RoleId,
		   m_arena = #m_arena{ref_list = [_ | _]}}) ->
    NRole = set_reward_timer(Role),
    arena_mgr:sync_role(NRole, all),
    arena_champion_mgr:sync_role(NRole, all),
    Rank = arena_lib:role_rank(RoleId),
    {ok, NRole2} = set_best_rank(NRole, Rank),
    {ok, NRole2};
login(_) -> ok.

zero_flush(Role) -> {ok, Role}.

-spec five_flush(#role{}) -> {ok, #role{}}.

five_flush(Role = #role{m_arena = MArena,
			m_vip = #m_vip{lev = VipLev}}) ->
    NRole = Role#role{m_arena =
			  MArena#m_arena{can_combat_num =
					     arena_data:vip_free(VipLev),
					 buy_combat_num = 0, cont_win = 0}},
    push(NRole),
    {ok, NRole}.

set_reward_timer(Role = #role{m_arena =
				  #m_arena{season_ref_time = RefTime}})
    when RefTime > 0 ->
    Now = date:unixtime(),
    role_timer:set(#timer{id = reward_refresh_timer,
			  m = arena, f = apply_reward_refresh,
			  timeout = max(1, RefTime - Now) * 1000},
		   Role);
set_reward_timer(Role) -> Role.

-spec apply_reward_refresh(#role{}) -> {ok, #role{}} |
				       ok.

apply_reward_refresh(Role = #role{m_arena =
				      MArena = #m_arena{season_ref_time =
							    RefTime}}) ->
    Now = date:unixtime(),
    case Now >= RefTime of
      true ->
	  NewMArena = MArena#m_arena{season_reward = [],
				     had_combat_num = 0, season_ref_time = 0},
	  NewRole = Role#role{m_arena = NewMArena},
	  push_season_reward(NewRole),
	  {ok, NewRole};
      _ -> ok
    end.

-spec gm(#role{}, tuple()) -> {ok, #role{}}.

gm(Role, {add_score, AddScore}) ->
    NowScore = arena_lib:role_score(Role#role.id),
    {ok, AR} = role_convert:do(arena_role, Role),
    NewAR = AR#arena_role{score = NowScore + AddScore},
    arena_mgr:update_role(NewAR, AddScore),
    {ok, Role};
gm(Role = #role{m_arena = MArena}, {reset_reward}) ->
    NRole = Role#role{m_arena =
			  MArena#m_arena{season_ref_time =
					     date:unixtime() + 10}},
    NewRole = set_reward_timer(NRole),
    {ok, NewRole};
gm(Role = #role{m_arena = MArena}, {reset_cool}) ->
    NRole = Role#role{m_arena =
			  MArena#m_arena{ref_time = 0}},
    push(NRole),
    {ok, NRole}.

-spec role_score_lev(#role{}) -> pos_integer().

role_score_lev(#role{m_arena =
			 #m_arena{ref_list = []}}) ->
    0;
role_score_lev(#role{id = RoleId}) ->
    Score = arena_lib:role_score(RoleId),
    Data = arena_data:get_score(Score),
    maps:get(index, Data, 1).

-spec push(#role{}) -> ok.

push(#role{id = RoleId,
	   m_arena =
	       #m_arena{cont_win = ContWin,
			can_combat_num = CanCombatNum,
			buy_combat_num = BuyCombatNum, ref_time = RefTime}}) ->
    {Rank, Score} = case arena_lib:get_role(RoleId) of
		      {ok, #arena_role{rank = Rank0, score = Score0}} ->
			  {Rank0, Score0};
		      _ -> {0, arena_data:get_const(init_score)}
		    end,
    ArenaInfo = sys_env:get(arena_state, #{}),
    SeasonStartTime = maps:get(season_start_time, ArenaInfo,
			       0),
    SeasonEndTime = maps:get(season_end_time, ArenaInfo, 0),
    sys_conn:pack_send(20200,
		       {Rank, Score, CanCombatNum, BuyCombatNum, RefTime,
			SeasonStartTime, SeasonEndTime, ContWin}),
    ok.

-spec push_list(#role{}, non_neg_integer()) -> ok.

push_list(#role{id = RoleId,
		m_arena = #m_arena{ref_list = RefList}},
	  Type) ->
    Score = arena_lib:role_score(RoleId),
    CliList = to_list_cli(RefList, Score, []),
    sys_conn:pack_send(20201, {CliList, Type}),
    ok.

to_list_cli([], _SelfScore, L) ->
    util:keys_sort([9], L);
to_list_cli([#arena_f{id = {Rid, SrvId}, idx = Idx,
		      name = Name0, lev = Lev0, sex = Sex, face = Face0,
		      power = Power0, status = Status, pos_info = PosInfo,
		      face_update_time = FaceUpdateTime, face_file = FaceFile,
		      gid = {Gid, GSrvId}, gname = GName}
	     | T],
	    SelfScore, L) ->
    Score0 = arena_lib:role_score({Rid, SrvId}),
    GetScore = calc_get_score(win, SelfScore, Score0),
    PList = to_p_list(PosInfo, no_quality),
    Data = {Idx, Rid, SrvId, Name0, Lev0, Sex, Face0,
	    Power0, Score0, GetScore, Status, PList, FaceUpdateTime,
	    FaceFile, Gid, GSrvId, GName},
    to_list_cli(T, SelfScore, [Data | L]).

to_p_list(PosInfo, Type) ->
    Fun = fun (#arena_f_pos{pos = Pos, quality = Quality,
			    bid = Bid, lev = PLev, star = Star,
			    break_lev = BreakLev, ext = P},
	       Acc) ->
		  NewP = partner_ver:do_partner_ver(P),
		  Skin = NewP#partner.use_skin,
		  ResonateLev = NewP#partner.resonate_lev,
		  case Type == quality of
		    true ->
			[{Pos, Bid, PLev, Quality, Star, BreakLev, Skin,
			  ResonateLev}
			 | Acc];
		    _ ->
			[{Pos, Bid, PLev, Star, BreakLev, Skin, ResonateLev}
			 | Acc]
		  end
	  end,
    lists:foldl(Fun, [], PosInfo).

-spec push_season_reward(#role{}) -> ok.

push_season_reward(#role{m_arena =
			     #m_arena{had_combat_num = HadCombatNum,
				      season_reward = Reward}}) ->
    sys_conn:pack_send(20208, {HadCombatNum, Reward}), ok.

-spec push_def_lose(#role{}) -> ok.

push_def_lose(#role{id = RoleId}) ->
    N = var:get_role_var(RoleId, other, 3, 0),
    Flag = util:if_true(N > 0, 1, 0),
    sys_conn:pack_send(20223, {Flag}),
    ok.

-spec check_open(#role{}) -> true | false.

check_open(Role = #role{lev = Lev}) ->
    MaxDunId = dungeon:max_dun_id(Role),
    Lev >= arena_data:get_const(limit_lev) andalso
      MaxDunId >= arena_data:get_const(dun_id).

-spec can_skip_combat(#role{}) -> true |
				  {false, binary()}.

can_skip_combat(#role{m_arena =
			  #m_arena{had_combat_num = HadNum}}) ->
    Num = arena_data:get_const(arena_skip_count),
    case HadNum >= Num of
      true -> true;
      _ ->
	  {false,
	   util:fbin(lang:get(<<"Bạn cần phải thử thách ~w lần trong "
				"mùa giải trước khi có thể bỏ qua trận "
				"chiến"/utf8>>),
		     [Num])}
    end.

-spec init_refresh_list(#role{}) -> #role{}.

init_refresh_list(Role = #role{m_arena =
				   MArena = #m_arena{ref_list = []}}) ->
    case check_open(Role) of
      true ->
	  Now = date:unixtime(),
	  RefList = match(Role, true, []),
	  Role#role{m_arena =
			MArena#m_arena{ref_list = RefList, ref_time = Now}};
      _ -> Role
    end;
init_refresh_list(Role = #role{m_arena =
				   MArena = #m_arena{ref_time = RefTime,
						     ref_list =
							 RL = [#arena_f{}
							       | _]}}) ->
    Now = date:unixtime(),
    case Now >= RefTime + 86400 * 1 of
      true ->
	  ExcludeIds = [RoleIdT || #arena_f{id = RoleIdT} <- RL],
	  RefList = match(Role, false, ExcludeIds),
	  NewRefTime = date:unixtime() +
			 arena_data:get_const(ref_time),
	  NRole = Role#role{m_arena =
				MArena#m_arena{ref_list = RefList,
					       ref_time = NewRefTime}},
	  NRole;
      _ -> Role
    end;
init_refresh_list(Role) -> Role.

-spec refresh_list(#role{}) -> {ok, #role{}} |
			       {false, binary()}.

refresh_list(Role = #role{m_arena =
			      MArena = #m_arena{ref_time = RefTime,
						ref_list = RL}}) ->
    Now = date:unixtime(),
    case Now >= RefTime of
      false ->
	  {false, lang:get(<<"Làm mới, vui lòng chờ"/utf8>>)};
      true ->
	  RL1 = lists:sublist(RL, util:rand(1, 3)),
	  ExecludeIds = [RoleId || #arena_f{id = RoleId} <- RL1],
	  RefList = match(Role, false, ExecludeIds),
	  NewRefTime = Now + arena_data:get_const(ref_time),
	  NRole = Role#role{m_arena =
				MArena#m_arena{ref_list = RefList,
					       ref_time = NewRefTime,
					       buff_id = 0}},
	  push(NRole),
	  push_list(NRole, 0),
	  {ok, NRole}
    end;
refresh_list(_Role) ->
    {false, lang:get(<<"Đấu trường không mở"/utf8>>)}.

match(Role, IsFirst, ExecludeIds) ->
    Score = arena_lib:role_score(Role#role.id),
    match(Role, IsFirst, ExecludeIds, Score).

match(Role, IsFirst, ExecludeIds, Score) ->
    ArenaInfo = sys_env:get(arena_state, #{}),
    SeasonIdx = maps:get(season_idx, ArenaInfo, 1),
    MyRank = arena_lib:role_rank(Role#role.id),
    do_match_(Role, 3, Score, MyRank, SeasonIdx, IsFirst,
	      ExecludeIds, []).

do_match_(_Role, 0, _Score, _MyRank, _SeasonIdx,
	  _IsFirst, _ExecludeIds, L) ->
    L1 = util:keys_sort([{asc, #arena_f.power}], L),
    list_util:set_idx(L1, #arena_f.idx);
do_match_(Role = #role{m_arena =
			   #m_arena{ref_list = _RefList}},
	  Idx, Score, MyRank, SeasonIdx, IsFirst, ExecludeIds,
	  L) ->
    RefId = util:if_true(IsFirst, Idx + 10, Idx),
    ArenaF = case Score >=
		    arena_data:get_const(protect_score)
		 of
	       true when IsFirst =/= true ->
		   match_player_new(Role, Idx, Score, MyRank, RefId,
				    ExecludeIds, L);
	       false when Idx =:= 3 andalso IsFirst =/= true ->
		   match_player_new(Role, Idx, Score, MyRank, RefId,
				    ExecludeIds, L);
	       _ -> gen_robot(Role, Idx, RefId)
	     end,
    do_match_(Role, Idx - 1, Score, MyRank, SeasonIdx,
	      IsFirst, ExecludeIds, [ArenaF | L]).

do_match_by_score([], _N, _ExcludeRoleIds) -> false;
do_match_by_score([{MinScore, MaxScore, MinPower,
		    MaxPower}
		   | T],
		  N, ExcludeRoleIds) ->
    MS = [{{arena_role, '_', '_', '_', '_', '_', '_', '_',
	    '_', '$2', '_', '$1', '_', '_', '_', '_', '_', '_'},
	   [{'andalso', {'>=', '$1', {const, MinScore}},
	     {'andalso', {'=<', '$1', {const, MaxScore}},
	      {'andalso', {'>=', '$2', {const, MinPower}},
	       {'=<', '$2', {const, MaxPower}}}}}],
	   ['$_']}],
    case ets:select(arena_role, MS, N) of
      {L1, _} ->
	  case [I
		|| I = #arena_role{id = RoleId} <- L1,
		   not lists:member(RoleId, ExcludeRoleIds)]
	      of
	    L2 = [_ | _] -> {ok, L2};
	    _ -> do_match_by_score(T, N, ExcludeRoleIds)
	  end;
      _ -> do_match_by_score(T, N, ExcludeRoleIds)
    end.

match_player_new(Role = #role{id = RoleId,
			      max_power = MaxPower},
		 Idx, MyScore, MyRank, RefId, ExecludeIds, L) ->
    ExcludeRoleIds = [RoleId1
		      || #arena_f{id = RoleId1} <- L],
    NewExecludeIds = [RoleId | ExcludeRoleIds] ++
		       ExecludeIds,
    #{score_range := ScoreRange,
      power_range := PowerRange} =
	arena_data:get_ref(RefId),
    MatchPowers = [{round(MinPowerRatio * MaxPower / 1000),
		    round(MaxPowerRatio * MaxPower / 1000)}
		   || {MinPowerRatio, MaxPowerRatio} <- PowerRange],
    Score = MyScore * util:rand(980, 1020) / 1000,
    MatchScores = lists:concat([[{round(MinScoreRatio *
					  Score
					  / 1000),
				  round(MaxScoreRatio * Score / 1000), MinPower,
				  MaxPower2}
				 || {MinPower, MaxPower2}
					<- lists:sublist(MatchPowers, N)]
				|| {MinScoreRatio, MaxScoreRatio, N}
				       <- ScoreRange]),
    case do_match_by_rank_score(MatchScores, MyRank,
				NewExecludeIds)
	of
      {ok, R = #arena_role{}} ->
	  gen_arena_f(Role, Idx, RefId, R);
      _ -> gen_robot(Role, Idx, RefId)
    end.

do_match_by_rank_score([], _MyRank, _ExecludeIds) ->
    false;
do_match_by_rank_score([{MinScore, MaxScore, MinPower,
			 MaxPower}
			| T],
		       MyRank, ExecludeIds) ->
    case do_match_by_rank_score_([{0, 1}, {0, -1}],
				 util:rand(50, 100), MyRank, MinScore, MaxScore,
				 MinPower, MaxPower, ExecludeIds, null)
	of
      {ok, R} -> {ok, R};
      _ ->
	  case do_match_by_score([{MinScore, MaxScore, MinPower,
				   MaxPower}],
				 util:rand(50, 80), ExecludeIds)
	      of
	    {ok, L1 = [_ | _]} ->
		[R | _] = lists:keysort(#arena_role.power, L1), {ok, R};
	    _ -> do_match_by_rank_score(T, MyRank, ExecludeIds)
	  end
    end.

do_match_by_rank_score_([], _N, _MyRank, _MinScore,
			_MaxScore, _MinPower, _MaxPower, _ExecludeIds, null) ->
    false;
do_match_by_rank_score_([], _N, _MyRank, _MinScore,
			_MaxScore, _MinPower, _MaxPower, _ExecludeIds, R) ->
    {ok, R};
do_match_by_rank_score_(_, 0, _MyRank, _MinScore,
			_MaxScore, _MinPower, _MaxPower, _ExecludeIds, R) ->
    {ok, R};
do_match_by_rank_score_([{I1, I2} | T], N, MyRank,
			MinScore, MaxScore, MinPower, MaxPower, ExecludeIds,
			R) ->
    Next = I1 + I2,
    Rank = MyRank + Next,
    case ets:lookup(arena_rank, Rank) of
      [#arena_rank{id = RoleId, score = Score}]
	  when Score >= MinScore andalso Score =< MaxScore ->
	  case arena_lib:get_role(RoleId) of
	    {ok, R1 = #arena_role{name = _Name, max_power = Power}}
		when Power >= MinPower andalso Power =< MaxPower ->
		case lists:member(RoleId, ExecludeIds) of
		  true ->
		      do_match_by_rank_score_(T ++ [{Next, I2}], N - 1,
					      MyRank, MinScore, MaxScore,
					      MinPower, MaxPower, ExecludeIds,
					      R);
		  _ ->
		      NewR = compare_arena_role(R, R1),
		      do_match_by_rank_score_(T ++ [{Next, I2}], N - 1,
					      MyRank, MinScore, MaxScore,
					      MinPower, MaxPower, ExecludeIds,
					      NewR)
		end;
	    {ok, _R1} ->
		do_match_by_rank_score_(T ++ [{Next, I2}], N, MyRank,
					MinScore, MaxScore, MinPower, MaxPower,
					ExecludeIds, R);
	    _ ->
		do_match_by_rank_score_(T, N, MyRank, MinScore,
					MaxScore, MinPower, MaxPower,
					ExecludeIds, R)
	  end;
      [_R1] ->
	  do_match_by_rank_score_(T ++ [{Next, I2}], N, MyRank,
				  MinScore, MaxScore, MinPower, MaxPower,
				  ExecludeIds, R);
      _ ->
	  do_match_by_rank_score_(T, N, MyRank, MinScore,
				  MaxScore, MinPower, MaxPower, ExecludeIds, R)
    end.

compare_arena_role(null, R) -> R;
compare_arena_role(#arena_role{power = Power1},
		   R2 = #arena_role{power = Power2})
    when Power1 > Power2 ->
    R2;
compare_arena_role(R1, _R2) -> R1.

match_player(Role = #role{id = RoleId,
			  max_power = MaxPower},
	     Idx, Score, RefId, ExecludeIds, L) ->
    #{score_range := ScoreRange,
      power_range := PowerRange} =
	arena_data:get_ref(RefId),
    MatchPowers = [{round(MinPowerRatio * MaxPower / 1000),
		    round(MaxPowerRatio * MaxPower / 1000)}
		   || {MinPowerRatio, MaxPowerRatio} <- PowerRange],
    MatchScores = lists:concat([[{round(MinScoreRatio *
					  Score
					  / 1000),
				  round(MaxScoreRatio * Score / 1000), MinPower,
				  MaxPower2}
				 || {MinPower, MaxPower2}
					<- lists:sublist(MatchPowers, N)]
				|| {MinScoreRatio, MaxScoreRatio, N}
				       <- ScoreRange]),
    ExcludeRoleIds = [RoleId1
		      || #arena_f{id = RoleId1} <- L],
    case do_match_by_score(MatchScores, util:rand(50, 80),
			   [RoleId | ExcludeRoleIds] ++ ExecludeIds)
	of
      {ok, L1} ->
	  L2 = [{R#arena_role.power, R} || R <- L1],
	  L3 = lists:sublist(lists:keysort(1, L2), 1),
	  L4 = [R || {_, R} <- L3],
	  gen_arena_f(Role, Idx, RefId, util:rand_list(L4));
      _ -> gen_robot(Role, Idx, RefId)
    end.

gen_arena_f(Role, Idx, RefId,
	    #arena_role{id = TarRoleId, name = Name, lev = Lev,
			sex = Sex, face = Face, power = Power}) ->
    case role_robot:get_role(TarRoleId) of
      {ok,
       Robot = #role_robot{partners = Partners,
			   face_file = FaceFile,
			   face_update_time = FaceUpdateTime, gid = Gid,
			   gname = GName}} ->
	  #formation_sys{type = FormationType, pos_info = PosInfo,
			 hallows_id = HallowsId} =
	      formation:get_sys_formation(Robot, 1),
	  Fun = fun (#formation_pos{pos = Pos, id = PId}) ->
			P = #partner{bid = Bid, lev = PLev,
				     break_lev = BreakLev, quality = Quality,
				     star = Star, power = PtnPower,
				     all_attr =
					 #attr{speed = Speed, atk = Atk,
					       def = Def, hp_max = HpMax}} =
				lists:keyfind(PId, #partner.id, Partners),
			#arena_f_pos{pos = Pos, id = PId, bid = Bid,
				     break_lev = BreakLev, lev = PLev,
				     quality = Quality, star = Star,
				     power = PtnPower, speed = Speed, atk = Atk,
				     def = Def, hp = HpMax, ext = P}
		end,
	  PList = [Fun(I) || I <- PosInfo],
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena432, _, {__Levelarena432, __Tracesarena432}}
		when __Levelarena432 band 128 /= 0 orelse
		       __Tracesarena432 /= [] ->
		lager:do_log(debug,
			     [{module, arena}, {function, gen_arena_f},
			      {line, 432}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("成功匹配到玩家:~ts==idx:~w power:~w pos_info:~w",
					   [Name, Idx, Power, PosInfo]),
			     none, 4096, 128, __Levelarena432, __Tracesarena432,
			     lager_event, __Pidarena432);
	    _ -> ok
	  end,
	  #arena_f{id = TarRoleId, name = Name, idx = Idx,
		   lev = Lev, sex = Sex, face = Face, power = Power,
		   formation_type = FormationType,
		   formation_lev = HallowsId, pos_info = PList,
		   face_file = FaceFile, face_update_time = FaceUpdateTime,
		   gid = Gid, gname = GName};
      _ -> gen_robot(Role, Idx, RefId)
    end.

gen_robot(Role = #role{partner_bag =
			   #partner_bag{partner_list = PartnerList},
		       arena_max_power = MaxPower1, max_power = MaxPower2},
	  Idx, RefId) ->
    #{robot := RobotIds, robot_power := Powers} =
	arena_data:get_ref(RefId),
    {MinRatio, MaxRatio} = util:rand_list(Powers),
    PowerRatio = util:rand(MinRatio, MaxRatio),
    MaxPower = max(MaxPower1, MaxPower2),
    Power = round(MaxPower * PowerRatio / 1000),
    RobotId = util:rand_list(RobotIds),
    Name1 = util:rand_list(random_name_data:arena_list(1)),
    Name2 = util:rand_list(random_name_data:arena_list(2)),
    Name3 = util:rand_list(random_name_data:arena_list(3)),
    Name = <<Name1/binary, Name2/binary, Name3/binary>>,
    Sex = util:rand(0, 1),
    MaxNum = min(5, length(PartnerList)),
    AvgPower = Power div MaxNum,
    #{partners := Partners, formation := FormationType,
      lev := Lev1, face := Face,
      hallows := {HallowsId, _, _}} =
	robot:get(Role, RobotId,
		  #{power => AvgPower, max_num => MaxNum}),
    PList = [#arena_f_pos{pos = PId, id = PId, bid = Bid,
			  lev = PLev, break_lev = BreakLev, quality = Quality,
			  star = Star, power = Power1, attr_ratio = PowerRatio,
			  speed = Speed, atk = Atk, def = Def, hp = HpMax,
			  ext = P}
	     || P = #partner{id = PId, bid = Bid, lev = PLev,
			     quality = Quality, star = Star, power = Power1,
			     all_attr =
				 #attr{speed = Speed, atk = Atk, def = Def,
				       hp_max = HpMax},
			     break_lev = BreakLev}
		    <- Partners],
    ArenaPower = lists:sum([PPower
			    || #partner{power = PPower} <- Partners]),
    #arena_f{id = {Idx, <<>>}, idx = Idx, name = Name,
	     sex = Sex, lev = Lev1, face = Face, power = ArenaPower,
	     robot_id = RobotId, formation_type = FormationType,
	     formation_lev = HallowsId, pos_info = PList}.

-spec get_target_info(#role{}, role_id()) -> {ok,
					      tuple()} |
					     {false, binary()}.

get_target_info(#role{m_arena =
			  #m_arena{ref_list = RefList}},
		TarRoleId) ->
    case lists:keyfind(TarRoleId, #arena_f.id, RefList) of
      #arena_f{id = {Rid, SrvId}, name = Name, lev = Lev,
	       face = Face, power = Power,
	       formation_type = FormationType,
	       formation_lev = HallowsId, pos_info = PosInfo,
	       face_update_time = FaceUpdateTime, face_file = FaceFile,
	       gid = {Gid, GSrvId}, gname = GName} ->
	  Score = arena_lib:role_score(TarRoleId),
	  PList = to_p_list(PosInfo, quality),
	  {ok,
	   {Rid, SrvId, Name, Lev, Face, Power, Score,
	    FormationType, HallowsId, PList, FaceUpdateTime,
	    FaceFile, Gid, GSrvId, GName}};
      _ -> {false, lang:get(<<"目标不在列表中"/utf8>>)}
    end.

-spec find_partner(#role{}, role_id(),
		   pos_integer()) -> ok | {false, binary()}.

find_partner(Role = #role{m_arena =
			      #m_arena{ref_list = RefList}},
	     TarRoleId, Pos) ->
    case lists:keyfind(TarRoleId, #arena_f.id, RefList) of
      #arena_f{robot_id = RobotId, pos_info = PosInfo}
	  when RobotId > 0 ->
	  case lists:keyfind(Pos, #arena_f_pos.pos, PosInfo) of
	    #arena_f_pos{ext = P = #partner{}} ->
		sys_conn:pack_send(11061,
				   partner_share:to_share_data(Role, P)),
		ok;
	    #arena_f_pos{ext = P} ->
		NewP = partner_ver:do_partner_ver(P),
		sys_conn:pack_send(11061,
				   partner_share:to_share_data(Role, NewP)),
		ok;
	    _ -> {false, lang:get(<<"英雄不存在了"/utf8>>)}
	  end;
      #arena_f{pos_info = PosInfo} ->
	  case lists:keyfind(Pos, #arena_f_pos.pos, PosInfo) of
	    #arena_f_pos{id = PId, ext = OldP} ->
		NOldP = partner_ver:do_partner_ver(OldP),
		case role_robot:get_role(TarRoleId) of
		  {ok, #role_robot{partners = Partners}} ->
		      P = list_util:keyfind(PId, #partner.id, Partners,
					    NOldP),
		      sys_conn:pack_send(11061,
					 partner_share:to_share_data(Role, P)),
		      ok;
		  _ -> {false, lang:get(<<"获取对方数据失败"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"英雄不存在了"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"目标不在列表中"/utf8>>)}
    end.

-spec buy_combat_num(#role{}, pos_integer()) -> {ok,
						 #role{}} |
						{false, binary()}.

buy_combat_num(_Role, BuyNum) when BuyNum =< 0 ->
    {false, lang:get(<<"购买次数不足"/utf8>>)};
buy_combat_num(Role = #role{m_arena =
				MArena = #m_arena{buy_combat_num =
						      BuyCombatNum}},
	       BuyNum) ->
    CombatItem = arena_data:get_const(arena_ticket),
    LossCfg = arena_data:get_const(ticket_price),
    Gain = format:val_to_gain([{CombatItem, BuyNum}],
			      arena),
    Loss = format:val_to_loss([{ItemId, Num * BuyNum}
			       || {ItemId, Num} <- LossCfg],
			      arena),
    GL = Gain ++ Loss,
    case role_gain:do_notice(Role, GL) of
      {false, #loss{msg = Msg}} -> {false, Msg};
      {false, #gain{msg = Msg}} -> {false, Msg};
      {ok, Role1} ->
	  NRole = Role1#role{m_arena =
				 MArena#m_arena{buy_combat_num =
						    BuyCombatNum + 1}},
	  log:log_gain(GL, Role, NRole, <<"竞技场"/utf8>>,
		       util:fbin("购买次数num:~w", [BuyCombatNum])),
	  push(NRole),
	  {ok, NRole}
    end.

-spec combat(#role{}, role_id(), pos_integer()) -> {ok,
						    #role{}} |
						   {false, binary()}.

combat(Role = #role{m_arena =
			MArena = #m_arena{can_combat_num = CanCombatNum,
					  ref_list = RefList,
					  ref_time = RefTime},
		    power = Power},
       TarRoleId, IsAuto) ->
    LossCfg = util:if_true(CanCombatNum > 0, [],
			   arena_data:get_const(arena_ticketcost)),
    Loss = format:val_to_loss(LossCfg, arena),
    Now = date:unixtime(),
    case Now >= RefTime + 86400 * 1 of
      true ->
	  ExcludeIds = [RoleIdT
			|| #arena_f{id = RoleIdT} <- RefList],
	  NewRefList = match(Role, false, ExcludeIds),
	  NewRefTime = date:unixtime() +
			 arena_data:get_const(ref_time),
	  NRole = Role#role{m_arena =
				MArena#m_arena{ref_list = NewRefList,
					       ref_time = NewRefTime}},
	  push_list(NRole, 0),
	  {false,
	   lang:get(<<"Danh sách khiêu chiến đã hết hạn, vui "
		      "lòng chọn lại mục tiêu khiêu chiến"/utf8>>),
	   NRole};
      _ ->
	  case role_gain:do(Role, Loss,
			    #gain_loss_opts{need_notify_fail_item = true})
	      of
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {ok, NRole, _} ->
		case lists:keyfind(TarRoleId, #arena_f.id, RefList) of
		  #arena_f{status = 1} ->
		      {false,
		       lang:get(<<"Mục tiêu đã được khiêu chiến thành công"/utf8>>)};
		  F = #arena_f{id = TarRoleId,
			       formation_type = BFormationType, name = TarName,
			       power = Power2} ->
		      case lock_target(TarRoleId) of
			false ->
			    {false,
			     lang:get(<<"Người chơi đang bận khiêu chiến khác, "
					"vui lòng thử lại sau"/utf8>>)};
			true ->
			    try {AFormationType, AFormationLev, FightPos,
				 FormationArgs} =
				    formation_lib:combat_formation_info(NRole),
				dungeon:push_buff(NRole),
				BuffAttrs = dungeon:buff_attr(NRole),
				AtkGroup0 = combat_lib:gen_fight_objects(NRole,
									 FightPos),
				AtkGroup1 = sprite_tree:gen_fight_object(Role)
					      ++
					      hallows_lib:gen_fight_object(Role,
									   maps:get(hallows_id,
										    FormationArgs,
										    0))
						++
						[combat_lib:add_base_attr(FO,
									  BuffAttrs)
						 || FO <- AtkGroup0],
				case gen_def_fight_objects(NRole, F) of
				  {false, Reason} ->
				      unlock_target(TarRoleId), {false, Reason};
				  {ok, DefGroup, SpriteLev, Sprites} ->
				      case role_misc:check_cd(arena_combat,
							      1000)
					  of
					false ->
					    unlock_target(TarRoleId),
					    {false,
					     lang:get(<<"Thao tác quá nhanh"/utf8>>)};
					_ ->
					    AtkGroup =
						combat_attr:calc(AtkGroup1, 2,
								 Role),
					    ReplayInfo0 =
						replay_hall:convert(#replay_info{},
								    a, Role,
								    #{formation_type
									  =>
									  AFormationType,
								      rank =>
									  arena_lib:role_rank(Role#role.id)}),
					    ReplayInfo =
						replay_hall:convert(ReplayInfo0,
								    b, F,
								    #{formation_type
									  =>
									  BFormationType,
								      rank =>
									  arena_lib:role_rank(TarRoleId),
								      sprite_lev
									  =>
									  SpriteLev,
								      sprites =>
									  Sprites}),
					    IsSkip =
						util:if_true(can_skip_combat(Role)
							       =:= true,
							     1, 0),
					    UseSprite = case
							  sprite_tree:get_skills_by_type(Role,
											 0)
							    of
							  [_ | _] -> 1;
							  _ -> 0
							end,
					    Args = #{on_role_combat_end =>
							 {arena, combat_over,
							  [{F, UseSprite}]},
						     formation =>
							 [{1, AFormationType,
							   AFormationLev},
							  {2, BFormationType,
							   1}],
						     ext_args =>
							 [{is_show_panel,
							   false},
							  {cli_ext_args,
							   [IsSkip]}],
						     target_role_name =>
							 TarName,
						     replay_info => ReplayInfo,
						     attack_power => Power,
						     defend_power => Power2},
					    case IsAuto =:= 1 of
					      true ->
						  case can_skip_combat(NRole) of
						    true ->
							{ok, CRole0} =
							    role_convert:do(combat_role,
									    NRole),
							CRole =
							    CRole0#combat_role{conn_pid
										   =
										   0,
									       watching
										   =
										   0,
									       is_auto
										   =
										   true},
							NewArgs =
							    Args#{combat_role =>
								      CRole,
								  is_robot =>
								      IsAuto},
							case
							  combat_lib:start_combat(NRole,
										  2,
										  AtkGroup,
										  [DefGroup],
										  NewArgs)
							    of
							  {false, Reason} ->
							      unlock_target(TarRoleId),
							      {false, Reason};
							  {ok, ComPid} ->
							      NewRole =
								  role_trigger:fire(#evt_arena_fight{},
										    NRole),
							      log:log_gain(Loss,
									   Role,
									   NewRole,
									   <<"竞技场"/utf8>>,
									   lang:get(<<"Lệnh bài khiêu chiến"/utf8>>)),
							      lock_pid(TarRoleId,
								       ComPid),
							      {ok, NewRole}
							end;
						    {false, Reason} ->
							unlock_target(TarRoleId),
							{false, Reason};
						    _ ->
							unlock_target(TarRoleId),
							{false,
							 lang:get(<<"进入战斗失败"/utf8>>)}
						  end;
					      _ ->
						  case
						    combat_lib:start_combat(NRole,
									    2,
									    AtkGroup,
									    [DefGroup],
									    Args)
						      of
						    {false, Reason} ->
							unlock_target(TarRoleId),
							{false, Reason};
						    {ok, ComPid} ->
							NewRole =
							    role_trigger:fire(#evt_arena_fight{},
									      NRole),
							log:log_gain(Loss, Role,
								     NewRole,
								     <<"竞技场"/utf8>>,
								     lang:get(<<"竞技场挑战消耗"/utf8>>)),
							lock_pid(TarRoleId,
								 ComPid),
							{ok, NewRole}
						  end
					    end
				      end
				end
			    catch
			      X:E ->
				  case {whereis(lager_event),
					whereis(lager_event),
					lager_config:get({lager_event,
							  loglevel},
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
				    {__Pidarena621, _,
				     {__Levelarena621, __Tracesarena621}}
					when __Levelarena621 band 8 /= 0 orelse
					       __Tracesarena621 /= [] ->
					lager:do_log(error,
						     [{module, arena},
						      {function, combat},
						      {line, 621},
						      {pid,
						       pid_to_list(self())},
						      {node, node()}
						      | lager:md()],
						     io_lib:format("~ts击杀目标出错:~w:~w",
								   [Role#role.name,
								    X, E]),
						     none, 4096, 8,
						     __Levelarena621,
						     __Tracesarena621,
						     lager_event,
						     __Pidarena621);
				    _ -> ok
				  end,
				  unlock_target(TarRoleId),
				  {false, lang:get(<<"进攻失败"/utf8>>)}
			    end
		      end;
		  _ -> {false, lang:get(<<"目标不在列表中"/utf8>>)}
		end
	  end
    end.

gen_def_fight_objects(Role,
		      #arena_f{id = TarRoleId, robot_id = RobotId,
			       power = Power, pos_info = PosInfo})
    when RobotId > 0 ->
    {ok,
     robot:gen_fight_objects(Role, RobotId,
			     #{power => Power div length(PosInfo),
			       max_num => length(PosInfo)},
			     TarRoleId),
     0, []};
gen_def_fight_objects(Role,
		      AF = #arena_f{id = TarRoleId, pos_info = PosInfo,
				    formation_lev = HallowsId}) ->
    case role_robot:get_role(TarRoleId) of
      {ok, Robot = #role_robot{}} ->
	  {SpriteLev, Sprites} = sprite_tree:get_sprite_lev(Robot,
							    1),
	  FOList0 = sprite_tree:gen_fight_object_type(Robot, 1) ++
		      hallows_lib:gen_fight_object(Robot, HallowsId) ++
			[gen_fight_object_(P, AF, Robot, Role)
			 || P = #arena_f_pos{pos = Pos} <- PosInfo, Pos >= 1,
			    Pos =< 5],
	  FOList = combat_attr:calc(FOList0, 2, Robot),
	  {ok, FOList, SpriteLev, Sprites};
      _ -> {false, lang:get(<<"获取对方数据失败"/utf8>>)}
    end.

gen_fight_object_(#arena_f_pos{pos = Pos, id = PId,
			       bid = Bid, lev = Lev, star = Star,
			       quality = Quality, speed = Speed, atk = Atk,
			       def = Def, hp = Hp, break_lev = BreakLev},
		  #arena_f{formation_type = FormationType},
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
					       {__Pidarena652, _,
						{__Levelarena652,
						 __Tracesarena652}}
						   when __Levelarena652 band 64
							  /= 0
							  orelse
							  __Tracesarena652 /=
							    [] ->
						   lager:do_log(info,
								[{module,
								  arena},
								 {function,
								  gen_fight_object_},
								 {line, 652},
								 {pid,
								  pid_to_list(self())},
								 {node, node()}
								 | lager:md()],
								io_lib:format("玩家[~ts]伙伴已不存在:~w",
									      [Name,
									       Bid]),
								none, 4096, 64,
								__Levelarena652,
								__Tracesarena652,
								lager_event,
								__Pidarena652);
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
    FO1 = partner_lib:gen_fight_object(Robot, 0, P1,
				       combat_lib:is_leader(Pos), RoleId, 1),
    FO1#fight_object{pos = Pos1}.

lock_target({_, <<>>}) -> true;
lock_target(RoleId) ->
    sys_env:lock_pid({arena_pk, RoleId}).

lock_pid({_, <<>>}, _Pid) -> true;
lock_pid(RoleId, Pid) ->
    ets:insert(game_lock, {{arena_pk, RoleId}, Pid}).

unlock_target({_, <<>>}) -> true;
unlock_target(RoleId) ->
    sys_env:unlock({arena_pk, RoleId}).

-spec combat_over(#role{}, #combat_result{}, #combat{},
		  tuple()) -> {ok, #role{}, list()}.

combat_over(Role = #role{id = RoleId,
			 m_sprite_tree = #m_sprite_tree{sprites = Sprites},
			 m_arena =
			     MArena = #m_arena{season_ref_time = OldEndTime,
					       can_combat_num = CanCombatNum,
					       had_combat_num = HadCombatNum,
					       acc_combat_num = AccCombatNum,
					       cont_win = ContWin}},
	    CombatResult = #combat_result{replay_id = ReplayId,
					  result = Result = 1,
					  hurt_statistics = HurtStatistics,
					  a_stat_info = AStat},
	    #combat{target_role_name = TargetName, round = Round},
	    {F = #arena_f{idx = Idx, id = TarRoleId, name = TarName,
			  lev = TarLev, face = TarFace,
			  face_update_time = TarFaceUpdateTime,
			  face_file = TarFaceFile},
	     UseSprite}) ->
    unlock_target(TarRoleId),
    DropId = arena_data:get_const(win_drop),
    PartnerBids = [BidT || #{object_bid := BidT} <- AStat],
    {DropItems, _NoticeItems, NoticeMsg} =
	drop_lib:common_drop_items(Role, DropId),
    AllItems = item_lib:to_cli_items2(DropItems),
    NowScore = arena_lib:role_score(RoleId),
    TarScore = arena_lib:role_score(TarRoleId),
    GetScore = calc_get_score(win, NowScore, TarScore),
    LoseScore = calc_get_score(lose, NowScore, TarScore),
    GL = format:val_to_gain(AllItems, arena_combat),
    case role_gain:do(Role, GL) of
      {ok, Role1} ->
	  NewContWin = min(ContWin + 1, HadCombatNum + 1),
	  NewScore = NowScore + GetScore,
	  NewRefList = match(Role, false, [TarRoleId], NewScore),
	  ArenaInfo = sys_env:get(arena_state, #{}),
	  SeasonEndTime = maps:get(season_end_time, ArenaInfo, 0),
	  Now = date:unixtime(),
	  NewRole = case OldEndTime =:= 0 of
		      true ->
			  MArena1 = MArena#m_arena{ref_list = NewRefList,
						   ref_time = Now,
						   can_combat_num =
						       max(0, CanCombatNum - 1),
						   season_ref_time =
						       SeasonEndTime,
						   had_combat_num =
						       HadCombatNum + 1,
						   acc_combat_num =
						       AccCombatNum + 1,
						   cont_win = NewContWin},
			  Role2 = Role1#role{m_arena = MArena1},
			  set_reward_timer(Role2);
		      _ ->
			  case SeasonEndTime > OldEndTime of
			    true ->
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
				  {__Pidarena707, _,
				   {__Levelarena707, __Tracesarena707}}
				      when __Levelarena707 band 64 /= 0 orelse
					     __Tracesarena707 /= [] ->
				      lager:do_log(info,
						   [{module, arena},
						    {function, combat_over},
						    {line, 707},
						    {pid, pid_to_list(self())},
						    {node, node()}
						    | lager:md()],
						   io_lib:format("~tsĐặt lại rương kho báu khi khiêu chiến "
								 "đấu trường kết thúc",
								 [Role#role.name]),
						   none, 4096, 64,
						   __Levelarena707,
						   __Tracesarena707,
						   lager_event, __Pidarena707);
				  _ -> ok
				end,
				MArena1 = MArena#m_arena{ref_list = NewRefList,
							 ref_time = Now,
							 can_combat_num =
							     max(0,
								 CanCombatNum -
								   1),
							 season_ref_time =
							     SeasonEndTime,
							 had_combat_num = 1,
							 acc_combat_num =
							     AccCombatNum + 1,
							 cont_win = NewContWin,
							 season_reward = []},
				Role2 = Role1#role{m_arena = MArena1},
				set_reward_timer(Role2);
			    _ ->
				MArena1 = MArena#m_arena{ref_list = NewRefList,
							 ref_time = Now,
							 can_combat_num =
							     max(0,
								 CanCombatNum -
								   1),
							 season_ref_time =
							     SeasonEndTime,
							 had_combat_num =
							     HadCombatNum + 1,
							 acc_combat_num =
							     AccCombatNum + 1,
							 cont_win = NewContWin},
				Role2 = Role1#role{m_arena = MArena1},
				Role2
			  end
		    end,
	  NewTarScore = max(TarScore + LoseScore,
			    arena_data:get_const(min_score)),
	  ScoreData = arena_data:get_score(NewScore),
	  SpriteList = [Sprite || {_, Sprite} <- Sprites],
	  {ok, NewRole1} = holiday_lucky_dog_lib:fire(NewRole,
						      evt_arena_fight_result,
						      0),
	  NewRole2 = var:set_var(NewRole1, other, 3113,
				 var:get_var(NewRole1, other, 3113, 0) + 1),
	  NewRole3 = gift_trigger:fire(NewRole2,
				       arena_victory_count, []),
	  NRole =
	      role_trigger:fire([#evt_arena_fight_result{result =
							     Result,
							 use_sprite =
							     UseSprite},
				 #evt_arena_score{score = NewScore},
				 #evt_arena_score2{score = NewScore},
				 #evt_arena_score_lev{score_lev =
							  maps:get(index,
								   ScoreData,
								   1)},
				 #evt_arena_use_partner{bids = PartnerBids,
							result = Result},
				 #evt_arena_use_sprite{bids = SpriteList,
						       result = Result}],
				NewRole3),
	  {ok, AR} = role_convert:do(arena_role, NRole),
	  NewAR = AR#arena_role{score = NewScore},
	  catch role_weekly_mgr:info({arena_score, RoleId,
				      NewScore}),
	  log:log_gain(GL, Role, NRole, <<"竞技场"/utf8>>,
		       util:fbin("Số phần thưởng khiêu chiến:~w",
				 [HadCombatNum])),
	  arena_mgr:update_role(NewAR, GetScore),
	  arena_mgr:update_role(TarRoleId, LoseScore),
	  push_list(NRole, 1),
	  push(NRole),
	  push_season_reward(NRole),
	  sys_conn:pack_send(20210,
			     {1, NewScore, GetScore, AllItems, TarName, TarLev,
			      TarFace, TarFaceUpdateTime, TarFaceFile,
			      NewTarScore, LoseScore, TargetName,
			      HurtStatistics, ReplayId}),
	  log(Role, CombatResult, F, GetScore, LoseScore),
	  log:save(join,
		   {NRole, <<"Chức năng chơi"/utf8>>,
		    <<"Đấu trường"/utf8>>}),
	  log:save(pvp,
		   {NRole, <<"Đấu trường"/utf8>>, Round, 1, 1, GetScore,
		    maps:get(name, ScoreData, <<>>), NewScore,
		    util:fbin("~w,~s,~ts,idx=~w",
			      [element(1, TarRoleId), element(2, TarRoleId),
			       TarName, Idx])}),
	  if NewContWin rem 5 =:= 0 ->
		 notice:broadcast(rumor_left_top,
				  color:msg(lang:get(<<"Trời ạ ! Nhẫn giả ~ts Hôm nay tại "
						       "đấu trường ~ts Thắng liên tiếp, ai đến "
						       "ngăn cản ngài ấy!~ts"/utf8>>),
					    [Role, {orange, NewContWin},
					     {href,
					      {42, green, [],
					       lang:get(<<"【我要挑战】"/utf8>>)}}]));
	     true -> pass
	  end,
	  drop_lib:drop_notice(NoticeMsg),
	  sky_ladder:push_combat_num(NRole),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena744, _, {__Levelarena744, __Tracesarena744}}
		when __Levelarena744 band 128 /= 0 orelse
		       __Tracesarena744 /= [] ->
		lager:do_log(debug,
			     [{module, arena}, {function, combat_over},
			      {line, 744}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~ts Thắng nhận được thi đấu điểm tích "
					   "lũy:~w tar_lose_score:~w",
					   [Role#role.name, GetScore,
					    LoseScore]),
			     none, 4096, 128, __Levelarena744, __Tracesarena744,
			     lager_event, __Pidarena744);
	    _ -> ok
	  end,
	  {ok, NRole};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena747, _, {__Levelarena747, __Tracesarena747}}
		when __Levelarena747 band 8 /= 0 orelse
		       __Tracesarena747 /= [] ->
		lager:do_log(error,
			     [{module, arena}, {function, combat_over},
			      {line, 747}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色Id:~w, 名字:~w, 损益操作失败:~w",
					   [Role#role.id, Role#role.name,
					    {DropId, AllItems}]),
			     none, 4096, 8, __Levelarena747, __Tracesarena747,
			     lager_event, __Pidarena747);
	    _ -> ok
	  end,
	  ok
    end;
combat_over(Role = #role{id = RoleId,
			 m_sprite_tree = #m_sprite_tree{sprites = Sprites},
			 m_arena =
			     MArena = #m_arena{season_ref_time = OldEndTime,
					       can_combat_num = CanCombatNum,
					       had_combat_num = HadCombatNum,
					       acc_combat_num = AccCombatNum}},
	    CombatResult = #combat_result{replay_id = ReplayId,
					  result = Result,
					  hurt_statistics = HurtStatistics,
					  a_stat_info = AStat},
	    #combat{target_role_name = TargetName, round = Round},
	    {F = #arena_f{idx = Idx, id = TarRoleId, name = TarName,
			  lev = TarLev, face = TarFace,
			  face_update_time = TarFaceUpdateTime,
			  face_file = TarFaceFile},
	     UseSprite}) ->
    unlock_target(TarRoleId),
    DropId = arena_data:get_const(lose_drop),
    PartnerBids = [BidT || #{object_bid := BidT} <- AStat],
    {DropItems, _NoticeItems, NoticeMsg} =
	drop_lib:common_drop_items(Role, DropId),
    AllItems = item_lib:to_cli_items2(DropItems),
    GL = format:val_to_gain(AllItems, arena_combat),
    case role_gain:do(Role, GL) of
      {ok, Role1} ->
	  ArenaInfo = sys_env:get(arena_state, #{}),
	  SeasonEndTime = maps:get(season_end_time, ArenaInfo, 0),
	  NewRole = case OldEndTime =:= 0 of
		      true ->
			  Role2 = Role1#role{m_arena =
						 MArena#m_arena{can_combat_num =
								    max(0,
									CanCombatNum
									  - 1),
								season_ref_time
								    =
								    SeasonEndTime,
								had_combat_num =
								    HadCombatNum
								      + 1,
								acc_combat_num =
								    AccCombatNum
								      + 1,
								cont_win = 0,
								buff_id = 0}},
			  set_reward_timer(Role2);
		      _ ->
			  case SeasonEndTime > OldEndTime of
			    true ->
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
				  {__Pidarena771, _,
				   {__Levelarena771, __Tracesarena771}}
				      when __Levelarena771 band 64 /= 0 orelse
					     __Tracesarena771 /= [] ->
				      lager:do_log(info,
						   [{module, arena},
						    {function, combat_over},
						    {line, 771},
						    {pid, pid_to_list(self())},
						    {node, node()}
						    | lager:md()],
						   io_lib:format("~ts在竞技场挑战结算时重置宝箱",
								 [Role#role.name]),
						   none, 4096, 64,
						   __Levelarena771,
						   __Tracesarena771,
						   lager_event, __Pidarena771);
				  _ -> ok
				end,
				Role2 = Role1#role{m_arena =
						       MArena#m_arena{can_combat_num
									  =
									  max(0,
									      CanCombatNum
										-
										1),
								      season_ref_time
									  =
									  SeasonEndTime,
								      had_combat_num
									  = 1,
								      acc_combat_num
									  =
									  AccCombatNum
									    + 1,
								      cont_win =
									  0,
								      season_reward
									  =
									  []}},
				set_reward_timer(Role2);
			    _ ->
				Role2 = Role1#role{m_arena =
						       MArena#m_arena{can_combat_num
									  =
									  max(0,
									      CanCombatNum
										-
										1),
								      season_ref_time
									  =
									  SeasonEndTime,
								      had_combat_num
									  =
									  HadCombatNum
									    + 1,
								      acc_combat_num
									  =
									  AccCombatNum
									    + 1,
								      cont_win =
									  0}},
				Role2
			  end
		    end,
	  SpriteList = [Sprite || {_, Sprite} <- Sprites],
	  NRole =
	      role_trigger:fire([#evt_arena_fight_result{result =
							     Result,
							 use_sprite =
							     UseSprite},
				 #evt_arena_use_partner{bids = PartnerBids,
							result = Result},
				 #evt_arena_use_sprite{bids = SpriteList,
						       result = Result}],
				NewRole),
	  log:log_gain(GL, Role, NRole, <<"竞技场"/utf8>>,
		       util:fbin("挑战失败奖励num:~w", [HadCombatNum])),
	  NowScore = arena_lib:role_score(RoleId),
	  TarScore = arena_lib:role_score(TarRoleId),
	  push(NRole),
	  push_season_reward(NRole),
	  sys_conn:pack_send(20210,
			     {Result, NowScore, 0, AllItems, TarName, TarLev,
			      TarFace, TarFaceUpdateTime, TarFaceFile, TarScore,
			      0, TargetName, HurtStatistics, ReplayId}),
	  ScoreData = arena_data:get_score(NowScore),
	  log(Role, CombatResult, F, 0, 0),
	  log:save(join,
		   {NRole, <<"功能玩法"/utf8>>, <<"竞技场"/utf8>>}),
	  log:save(pvp,
		   {NRole, <<"竞技场"/utf8>>, Round, 2, 2, 1,
		    maps:get(name, ScoreData, <<>>), NowScore,
		    util:fbin("~w,~s,~ts,idx=~w",
			      [element(1, TarRoleId), element(2, TarRoleId),
			       TarName, Idx])}),
	  drop_lib:drop_notice(NoticeMsg),
	  {ok, NRole};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena794, _, {__Levelarena794, __Tracesarena794}}
		when __Levelarena794 band 8 /= 0 orelse
		       __Tracesarena794 /= [] ->
		lager:do_log(error,
			     [{module, arena}, {function, combat_over},
			      {line, 794}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色Id:~w, 名字:~w, 损益操作失败:~w",
					   [Role#role.id, Role#role.name,
					    {DropId, AllItems}]),
			     none, 4096, 8, __Levelarena794, __Tracesarena794,
			     lager_event, __Pidarena794);
	    _ -> ok
	  end,
	  ok
    end;
combat_over(_Role, _CombatResult, _Combat, _Args) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena798, _, {__Levelarena798, __Tracesarena798}}
	  when __Levelarena798 band 8 /= 0 orelse
		 __Tracesarena798 /= [] ->
	  lager:do_log(error,
		       [{module, arena}, {function, combat_over}, {line, 798},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts=战斗结果匹配不到处理方案===>~w",
				     [_Role#role.name, _Args]),
		       none, 4096, 8, __Levelarena798, __Tracesarena798,
		       lager_event, __Pidarena798);
      _ -> ok
    end,
    ok.

log(Role = #role{id = RoleId, name = Name, lev = Lev,
		 sex = Sex, face_id = Face,
		 m_avatar = #m_avatar{used = AvatarId},
		 arena_power = Power},
    #combat_result{replay_id = ReplayId, result = Result},
    #arena_f{robot_id = RobotId, id = BRoleId, name = BName,
	     lev = BLev, sex = BSex, face = BFace,
	     avatar_id = BAvatarId, power = BPower,
	     face_update_time = BFaceUpdateTime,
	     face_file = BFaceFile},
    GetScore, LoseScore) ->
    Now = date:unixtime(),
    Ret = util:if_true(Result =:= 1, 1, 2),
    ALog = #arena_pk_log{rid = BRoleId, name = BName,
			 lev = BLev, sex = BSex, face = BFace,
			 avatar_id = BAvatarId, power = BPower, ret = Ret,
			 replay_id = ReplayId, score = GetScore, time = Now,
			 face_update_time = BFaceUpdateTime,
			 face_file = BFaceFile},
    arena_log:async_exec(arena, add_log, [RoleId, ALog]),
    case RobotId of
      0 ->
	  case Result =:= 1 of
	    true ->
		var:acc_role_var(BRoleId, other, 3, 0),
		role:pack_send(BRoleId, 20223, {1}),
		role_lib:cast(by_id, BRoleId, {arena, push, []});
	    _ -> pass
	  end,
	  BRet = util:if_true(Result =:= 1, 2, 1),
	  {_, FaceFile, FaceUpdateTime} =
	      role_face:face_info(Role),
	  BLog = #arena_pk_log{rid = RoleId, name = Name,
			       lev = Lev, sex = Sex, face = Face,
			       avatar_id = AvatarId, power = Power, type = 2,
			       ret = BRet, replay_id = ReplayId,
			       score = LoseScore, time = Now,
			       face_update_time = FaceUpdateTime,
			       face_file = FaceFile},
	  arena_log:async_exec(arena, add_log, [BRoleId, BLog]);
      _ -> skip
    end;
log(_Role, _CombatResult, _ArenaF, _GetScore,
    _LoseScore) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena823, _, {__Levelarena823, __Tracesarena823}}
	  when __Levelarena823 band 8 /= 0 orelse
		 __Tracesarena823 /= [] ->
	  lager:do_log(error,
		       [{module, arena}, {function, log}, {line, 823},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]写日志失败 get_score=~w",
				     [_Role#role.name, _GetScore]),
		       none, 4096, 8, __Levelarena823, __Tracesarena823,
		       lager_event, __Pidarena823);
      _ -> ok
    end.

add_log(RoleId, Log) ->
    combat_replay_mgr:acc_replay_reference(Log#arena_pk_log.replay_id),
    RLog = #arena_role_log{logs = Logs} =
	       arena_lib:get_log(RoleId),
    LogId = case Logs of
	      [#arena_pk_log{id = LogId1} | _] when LogId1 < 100 ->
		  LogId1 + 1;
	      _ -> 1
	    end,
    {NewLogs, DelLogs} = list_util:split(20,
					 [Log#arena_pk_log{id = LogId} | Logs]),
    [combat_replay_mgr:dec_replay_reference(ReplayId)
     || #arena_pk_log{replay_id = ReplayId} <- DelLogs],
    NewRLog = RLog#arena_role_log{logs = NewLogs},
    ets:insert(arena_role_log, NewRLog).

del_target_log(RoleId) ->
    case arena_lib:get_log(RoleId) of
      #arena_role_log{logs =
			  [#arena_pk_log{rid = BRoleId} | _]} ->
	  BRLog = #arena_role_log{logs = [_ | BNewLogs]} =
		      arena_lib:get_log(BRoleId),
	  BNewRLog = BRLog#arena_role_log{logs = BNewLogs},
	  ets:insert(arena_role_log, BNewRLog);
      _ -> skip
    end.

calc_get_score(win, Score, BScore) ->
    round(math:pow(max(0, 1000 + BScore - Score) / 100, 1.2)
	    + 6);
calc_get_score(lose, Score, BScore) ->
    -round(math:pow(max(0, 1000 + BScore - Score) / 100,
		    1.2)
	     + 1).

-spec set_best_rank(#role{}, Rank :: integer()) -> {ok,
						    #role{}}.

set_best_rank(Role, Rank) ->
    BestRank = var:get_var(Role, other, 3024, 0),
    {NRole, NewBestRank} = case BestRank =:= 0 orelse
				  Rank < BestRank
			       of
			     true ->
				 VarRole = var:set_var(Role, other, 3024, Rank),
				 case Rank =:= 1 of
				   true ->
				       notice:broadcast(rumor_left_top,
							color:msg(lang:get(<<"~tsTại đấu trường một đường vượt mọi "
									     "chông gai, rốt cục đạt đến hạng 1！~ts"/utf8>>),
								  [Role,
								   {href,
								    {42, green,
								     [],
								     lang:get(<<"【Đi khiêu chiến】"/utf8>>)}}]));
				   _ -> skip
				 end,
				 {VarRole, Rank};
			     _ -> {Role, BestRank}
			   end,
    NewRole = role_trigger:fire(#evt_arena_rank{rank =
						    NewBestRank},
				NRole),
    push(NewRole),
    {ok, NewRole}.

-spec season_reward(#role{},
		    Num :: pos_integer()) -> {false, binary()} |
					     {ok, #role{}}.

season_reward(Role = #role{m_arena =
			       MArena = #m_arena{season_reward = DayReward,
						 had_combat_num =
						     HadCombatNum}},
	      Num)
    when HadCombatNum >= Num ->
    case arena_data:season_num_reward(Num) of
      Items = [_ | _] ->
	  case lists:member(Num, DayReward) of
	    true -> {false, lang:get(<<"该奖励已领取"/utf8>>)};
	    false ->
		GL = format:val_to_gain(Items, arena_day_reward),
		case role_gain:do_notice(Role, GL) of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, Role1} ->
		      NRole = Role1#role{m_arena =
					     MArena#m_arena{season_reward =
								[Num
								 | DayReward]}},
		      log:log_gain(GL, Role, NRole, <<"竞技场"/utf8>>,
				   util:fbin("赛季挑战次数奖励num:~w", [Num])),
		      push_season_reward(NRole),
		      {ok, NRole}
		end
	  end;
      _ -> {false, lang:get(<<"该宝箱不存在哟"/utf8>>)}
    end;
season_reward(_Role, _Num) ->
    {false, lang:get(<<"挑战次数未达标"/utf8>>)}.

-spec set_formation(#role{},
		    #formation_sys{}) -> {false, binary()} | {ok, #role{}}.

set_formation(Role, FormationSys) ->
    {ok, Role1} = formation:save_sys_formation(Role,
					       FormationSys),
    {ok, NRole} = role_misc:calc_power(Role1),
    arena_mgr:sync_role(NRole, power),
    {ok, NRole}.

merge_flush(Role = #role{m_arena =
			     MArena = #m_arena{season_reward = SeasonReward,
					       had_combat_num =
						   HadCombatNum}}) ->
    RewardList = arena_data:season_reward_list(),
    Fun = fun (NumId, RewardT) ->
		  case HadCombatNum >= NumId andalso
			 not lists:member(NumId, SeasonReward)
		      of
		    true ->
			Items = arena_data:season_num_reward(NumId),
			item_lib:merge(Items, RewardT);
		    _ -> RewardT
		  end
	  end,
    MailItem = lists:foldl(Fun, [], RewardList),
    NRole = case MailItem of
	      [_ | _] ->
		  {Assets, Items} = format:split_assets_items(MailItem),
		  {ok, RoleT} = mail:add(Role,
					 {lang:get(<<"Đấu Trường"/utf8>>),
					  lang:get(<<"Nhẫn giả, đây là những phần thưởng mà "
						     "bạn không nhận được trong đấu trường "
						     "trước khi phục vụ, vui lòng kiểm tra "
						     "và nhận"/utf8>>),
					  Assets, Items,
					  lang:get(<<"Rương kho báu đấu trường"/utf8>>),
					  86400 + date:unixtime()}),
		  RoleT;
	      _ -> Role
	    end,
    NewRole = NRole#role{m_arena =
			     MArena#m_arena{season_reward = [],
					    had_combat_num = 0,
					    season_ref_time = 0, ref_list = [],
					    cont_win = 0}},
    {ok, NewRole}.


