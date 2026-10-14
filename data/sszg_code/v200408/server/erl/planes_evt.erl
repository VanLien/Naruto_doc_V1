-file("data/planes_evt.erl", 1).

-file("src/mod/planes/planes_evt.erl", 1).

-module(planes_evt).

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
		{partner_rand,
		 [ver, id, bid, role_id, name, lev, star, break_skills,
		  set_skills, skills, break_lev, power, use_skin,
		  end_time, all_attr, base_attr, eqms, artifacts,
		  holy_eqm, dower_skill, ext]},
		{partner_rand_match,
		 [id, bid, role_id, lev, star, power]},
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
		{planes_load_partner,
		 [ver, pos, bid, lev, name, star, break_skills,
		  set_skills, skills, break_lev, power, use_skin,
		  end_time, all_attr, base_attr, eqms, artifacts,
		  holy_eqm, dower_skill, ext]},
		{planes_evt_data,
		 [id, type, ext, reward_list, exchange_id, group_id]},
		{planes_tile,
		 [ver, label, evt_id, ext, defend_radio, is_hide,
		  is_walk, is_business, combat_power]},
		{planes_floor,
		 [ver, floor, difficulty, map_id, line, index, tile_list,
		  is_reward, is_can_reward, is_treasure, fight_ids]},
		{m_planes,
		 [ver, floor, floor_list, update_time, partners_hp_radio,
		  buffs, buffs_ext, session_ids, load_partners,
		  load_partners_next_id, dun_power, formation, is_pass,
		  reward_list, is_spar]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
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

-export([click/5, click_tile_combat/5,
	 load_partner_back/3, guard_match_back/3, init_guard/5,
	 match_next_line/3, click_tile_combat_false/5]).

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

-file("src/mod/planes/planes_evt.erl", 17).

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

-file("src/mod/planes/planes_evt.erl", 18).

-file("inc/planes.hrl", 1).

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

-file("inc/planes.hrl", 7).

-record(m_planes,
	{ver = 2  :: pos_integer(), floor = 0  :: pos_integer(),
	 floor_list = []  :: list(),
	 update_time = 0  :: pos_integer(),
	 partners_hp_radio = []  :: list(),
	 buffs = []  :: list(), buffs_ext = []  :: list(),
	 session_ids = []  :: list(),
	 load_partners = []  :: list(),
	 load_partners_next_id = 1  :: pos_integer(),
	 dun_power = 0  :: pos_integer(),
	 formation = {1, [], 0}  :: tuple(),
	 is_pass = 0  :: boolean(), reward_list = []  :: list(),
	 is_spar = 0  :: pos_integer()}).

-record(planes_floor,
	{ver = 1  :: pos_integer(), floor = 1  :: pos_integer(),
	 difficulty = 1  :: pos_integer(),
	 map_id  :: pos_integer(), line = 1  :: pos_integer(),
	 index = 0  :: pos_integer(), tile_list = []  :: list(),
	 is_reward = 0  :: boolean(),
	 is_can_reward = 0  :: boolean(),
	 is_treasure = 0  :: boolean(),
	 fight_ids = []  :: list()}).

-record(planes_tile,
	{ver = 1  :: pos_integer(), label = {1, 1}  :: tuple(),
	 evt_id = 0  :: pos_integer(), ext = []  :: list(),
	 defend_radio = []  :: list(), is_hide = 0  :: boolean(),
	 is_walk = 0  :: boolean(),
	 is_business = 0  :: boolean(),
	 combat_power = 0  :: pos_integer()}).

-record(planes_evt_data,
	{id = 0  :: pos_integer(), type = 0  :: pos_integer(),
	 ext = []  :: list(), reward_list = []  :: list(),
	 exchange_id = 0  :: pos_integer(),
	 group_id = 0  :: pos_integer()}).

-record(planes_load_partner,
	{ver = 1  :: pos_integer(), pos = 1  :: pos_integer(),
	 bid = 1  :: pos_integer(), lev = 1  :: pos_integer(),
	 name = <<>>  :: binary(), star = 1  :: pos_integer(),
	 break_skills = []  :: list(),
	 set_skills = []  :: list(), skills = []  :: list(),
	 break_lev = 1  :: pos_integer(),
	 power = 1  :: pos_integer(),
	 use_skin = 0  :: pos_integer(),
	 end_time = 1  :: pos_integer(),
	 all_attr = #attr{}  :: #attr{},
	 base_attr = #attr{}  :: #attr{}, eqms = []  :: list(),
	 artifacts = []  :: list(), holy_eqm = []  :: list(),
	 dower_skill = []  :: list(), ext = []  :: list()}).

-file("src/mod/planes/planes_evt.erl", 19).

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

-file("src/mod/planes/planes_evt.erl", 20).

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

-file("src/mod/planes/planes_evt.erl", 21).

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

-file("src/mod/planes/planes_evt.erl", 22).

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

-file("src/mod/planes/planes_evt.erl", 23).

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

-file("src/mod/planes/planes_evt.erl", 24).

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

-file("src/mod/planes/planes_evt.erl", 25).

-file("inc/partner_rand.hrl", 1).

-file("inc/attr.hrl", 1).

-file("inc/partner_rand.hrl", 8).

-file("inc/package.hrl", 1).

-file("inc/partner_rand.hrl", 9).

-file("inc/common.hrl", 1).

-file("inc/partner_rand.hrl", 10).

-record(partner_rand_match,
	{id = 0  :: pos_integer(), bid = 1  :: pos_integer(),
	 role_id = {0, <<>>}  :: pos_integer(),
	 lev = 1  :: pos_integer(), star = 1  :: pos_integer(),
	 power = 1  :: pos_integer()}).

-record(partner_rand,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 bid = 1  :: pos_integer(),
	 role_id = {0, <<>>}  :: pos_integer(), name = <<>>,
	 lev = 1  :: pos_integer(), star = 1  :: pos_integer(),
	 break_skills = []  :: list(),
	 set_skills = []  :: list(), skills = []  :: list(),
	 break_lev = 1  :: pos_integer(),
	 power = 1  :: pos_integer(),
	 use_skin = 0  :: pos_integer(),
	 end_time = 1  :: pos_integer(),
	 all_attr = #attr{}  :: #attr{},
	 base_attr = #attr{}  :: #attr{}, eqms = []  :: list(),
	 artifacts = []  :: list(), holy_eqm = []  :: list(),
	 dower_skill = []  :: list(), ext = []  :: list()}).

-file("src/mod/planes/planes_evt.erl", 26).

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

-file("src/mod/planes/planes_evt.erl", 27).

-spec click(#role{}, pos_integer(), pos_integer(),
	    pos_integer(), list()) -> {false, string()} |
				      {ok, #role{}} | ok.

click(#role{m_planes = #m_planes{floor = 0}}, _Line,
      _Index, _Action, _Ext) ->
    {false, lang:get(<<"Không hoạt động"/utf8>>)};
click(Role = #role{m_planes =
		       Planes = #m_planes{floor_list = FloorList,
					  floor = NowFloor}},
      Line, Index, Action, Ext) ->
    case lists:keyfind(NowFloor, #planes_floor.floor,
		       FloorList)
	of
      PlanesFloor = #planes_floor{line = NowLine,
				  index = NowIndex, tile_list = TileList,
				  is_treasure = IsTreasure} ->
	  case check_click(NowLine, Line, NowIndex, Index,
			   TileList, Action)
	      of
	    #planes_tile{is_hide = 1} ->
		{false,
		 lang:get(<<"Lưới này không thể được vận hành"/utf8>>)};
	    PlanesTile = #planes_tile{evt_id = EvtId} ->
		case planes_data:get_event_type(EvtId) of
		  6 ->
		      do_click(Role, Planes, PlanesFloor, PlanesTile, Action,
			       Ext, planes_data:get_evt(EvtId));
		  _ when IsTreasure =:= 1 ->
		      {false,
		       lang:get(<<"Bạn chỉ có thể tiến về phía trước sau "
				  "khi nhặt được những di vật ở phía trước.~"/utf8>>)};
		  _ ->
		      do_click(Role, Planes, PlanesFloor, PlanesTile, Action,
			       Ext, planes_data:get_evt(EvtId))
		end;
	    {false, Reason} -> {false, Reason};
	    _ -> {false, lang:get(<<"Sự kiện còn quá xa"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Không có thông tin về lớp này"/utf8>>)}
    end.

-spec click_tile_combat(#role{}, #m_planes{},
			#planes_floor{}, #planes_tile{},
			#planes_evt_data{}) -> #role{}.

click_tile_combat(Role,
		  Planes = #m_planes{floor_list = FloorList}, PlanesFloor,
		  PlanesTile = #planes_tile{evt_id = EvtId},
		  #planes_evt_data{type = Type, exchange_id = ExchangeId,
				   reward_list = RewardList}) ->
    Role1 = planes_evt_lib:do_reward(Role, RewardList,
				     Type),
    {PlanesFloor1, PlanesTile1} =
	planes_evt_lib:exchange_tile(PlanesFloor, PlanesTile,
				     ExchangeId),
    {PlanesFloor2,
     PlanesTile2 = #planes_tile{label = Label}, PushList} =
	planes_evt_lib:walk_floor(PlanesFloor1, PlanesTile1,
				  Role1),
    {Role2,
     PlanesFloor3 = #planes_floor{tile_list = TileList,
				  floor = Floor, difficulty = Difficulty,
				  line = Line}} =
	reward_floor(Role1, PlanesFloor2, PlanesTile2, Type),
    NewTileList = lists:keyreplace(Label,
				   #planes_tile.label, TileList, PlanesTile2),
    NewPlanesFloor = PlanesFloor3#planes_floor{tile_list =
						   NewTileList},
    NewFloorList = lists:keyreplace(Floor,
				    #planes_floor.floor, FloorList,
				    NewPlanesFloor),
    NewPlanes = Planes#m_planes{floor_list = NewFloorList},
    NewRole = Role2#role{m_planes = NewPlanes},
    planes_evt:match_next_line(NewRole, Floor, Line + 2),
    planes:push(NewRole, 28606, [PlanesTile2 | PushList]),
    log_join_event(Type, TileList, Label, Floor, Difficulty,
		   NewRole),
    LogName = planes_evt_lib:get_name(Type),
    log:save(task,
	     {NewRole, 0, EvtId,
	      util:fbin(<<"类型~ts-层数~w-难度~w"/utf8>>,
			[LogName, Floor, Difficulty]),
	      107, <<"新版位面事件"/utf8>>, <<"新版位面事件"/utf8>>}),
    log:save(task,
	     {NewRole, 1, EvtId,
	      util:fbin(<<"类型~ts-层数~w-难度~w"/utf8>>,
			[LogName, Floor, Difficulty]),
	      107, <<"新版位面事件"/utf8>>, <<"新版位面事件"/utf8>>}),
    NewRole.

-spec click_tile_combat_false(#role{}, #m_planes{},
			      #planes_floor{}, #planes_tile{},
			      #planes_evt_data{}) -> #role{}.

click_tile_combat_false(Role,
			Planes = #m_planes{floor_list = FloorList}, PlanesFloor,
			PlanesTile,
			#planes_evt_data{type = Type,
					 exchange_id = ExchangeId}) ->
    {PlanesFloor1, PlanesTile1} =
	planes_evt_lib:exchange_tile(PlanesFloor, PlanesTile,
				     ExchangeId),
    {PlanesFloor2,
     PlanesTile2 = #planes_tile{label = Label}, PushList} =
	planes_evt_lib:walk_floor(PlanesFloor1, PlanesTile1,
				  Role),
    {Role1,
     PlanesFloor3 = #planes_floor{tile_list = TileList,
				  floor = Floor, difficulty = Difficulty,
				  line = Line}} =
	reward_floor_false(Role, PlanesFloor2, PlanesTile2,
			   Type),
    NewTileList = lists:keyreplace(Label,
				   #planes_tile.label, TileList, PlanesTile2),
    NewPlanesFloor = PlanesFloor3#planes_floor{tile_list =
						   NewTileList},
    NewFloorList = lists:keyreplace(Floor,
				    #planes_floor.floor, FloorList,
				    NewPlanesFloor),
    NewPlanes = Planes#m_planes{floor_list = NewFloorList},
    NewRole = Role1#role{m_planes = NewPlanes},
    planes_evt:match_next_line(NewRole, Floor, Line + 2),
    planes:push(NewRole, 28606, [PlanesTile2 | PushList]),
    log_join_event(Type, TileList, Label, Floor, Difficulty,
		   NewRole),
    NewRole.

-spec load_partner_back(#role{}, list(), list()) -> {ok,
						     #role{}}.

load_partner_back(Role = #role{m_planes =
				   Planes = #m_planes{floor_list = FloorList}},
		  MatchList1,
		  [Floor,
		   PlanesTile = #planes_tile{label = Label, ext = []},
		   #planes_evt_data{ext = DataExt}]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidplanes_evt115, _,
       {__Levelplanes_evt115, __Tracesplanes_evt115}}
	  when __Levelplanes_evt115 band 128 /= 0 orelse
		 __Tracesplanes_evt115 /= [] ->
	  lager:do_log(debug,
		       [{module, planes_evt}, {function, load_partner_back},
			{line, 115}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("匹配到~w个英雄", [length(MatchList1)]), none,
		       4096, 128, __Levelplanes_evt115, __Tracesplanes_evt115,
		       lager_event, __Pidplanes_evt115);
      _ -> ok
    end,
    PartnerNum = case lists:keyfind(num, 1, DataExt) of
		   {num, Num} -> Num;
		   _ -> 4
		 end,
    GroupId = case lists:keyfind(group, 1, DataExt) of
		{group, Group} -> Group;
		_ -> 1
	      end,
    case lists:keyfind(Floor, #planes_floor.floor,
		       FloorList)
	of
      PlanesFloor = #planes_floor{tile_list = TileList} ->
	  case length(MatchList1) >= PartnerNum of
	    true ->
		NewMatchList = lists:sublist(MatchList1, PartnerNum),
		NewPlanesTile = PlanesTile#planes_tile{ext =
							   NewMatchList},
		NewTileList = lists:keyreplace(Label,
					       #planes_tile.label, TileList,
					       NewPlanesTile),
		NewPlanesFloor = PlanesFloor#planes_floor{tile_list =
							      NewTileList},
		NewFloorList = lists:keyreplace(Floor,
						#planes_floor.floor, FloorList,
						NewPlanesFloor),
		NewPlanes = Planes#m_planes{floor_list = NewFloorList},
		NewRole = Role#role{m_planes = NewPlanes},
		planes:push(NewRole, 28622, {Label, NewMatchList}),
		{ok, NewRole};
	    _ ->
		AllPosList = lists:seq(1, PartnerNum),
		MatchList = partner_rand_lib:match_self_partner(Role,
								AllPosList --
								  [Pos
								   || #planes_load_partner{pos
											       =
											       Pos}
									  <- MatchList1])
			      ++ MatchList1,
		PosList = [Pos
			   || #planes_load_partner{pos = Pos} <- MatchList],
		LastPosList = AllPosList -- PosList,
		BidList = [MatchBid
			   || #planes_load_partner{bid = MatchBid}
				  <- MatchList],
		AddLoadPartnerList = get_loan_robot(LastPosList, Role,
						    BidList, GroupId, []),
		AllLoadPartnerList = AddLoadPartnerList ++ MatchList,
		NewPlanesTile = PlanesTile#planes_tile{ext =
							   AllLoadPartnerList},
		NewTileList = lists:keyreplace(Label,
					       #planes_tile.label, TileList,
					       NewPlanesTile),
		NewPlanesFloor = PlanesFloor#planes_floor{tile_list =
							      NewTileList},
		NewFloorList = lists:keyreplace(Floor,
						#planes_floor.floor, FloorList,
						NewPlanesFloor),
		NewPlanes = Planes#m_planes{floor_list = NewFloorList},
		NewRole = Role#role{m_planes = NewPlanes},
		planes:push(NewRole, 28622,
			    {Label, AllLoadPartnerList}),
		{ok, NewRole}
	  end;
      _ ->
	  notice:alert(lang:get(<<"Lỗi dữ liệu"/utf8>>)),
	  {ok, Role}
    end;
load_partner_back(Role, _MatchList, _Ext) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidplanes_evt171, _,
       {__Levelplanes_evt171, __Tracesplanes_evt171}}
	  when __Levelplanes_evt171 band 128 /= 0 orelse
		 __Tracesplanes_evt171 /= [] ->
	  lager:do_log(debug,
		       [{module, planes_evt}, {function, load_partner_back},
			{line, 171}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("格式匹配不上~w", [_Ext]), none, 4096, 128,
		       __Levelplanes_evt171, __Tracesplanes_evt171,
		       lager_event, __Pidplanes_evt171);
      _ -> ok
    end,
    notice:alert(lang:get(<<"Bạn đã kích hoạt sự kiện"/utf8>>)),
    {ok, Role}.

-spec init_guard(#role{}, pos_integer(), list(), list(),
		 pos_integer()) -> ok.

init_guard(Role = #role{lev = RoleLev,
			m_planes = #m_planes{dun_power = MaxPower}},
	   Floor, LabelPowerList, ExcludeRoleIds, NextLine) ->
    CalculatingCoefficient =
	planes_data:get_const(planes_calculating_coefficient),
    MinimumEffect =
	planes_data:get_const(planes_minimum_effectiveness),
    MathArgs = round(RoleLev / 5 * CalculatingCoefficient),
    RealPower = MinimumEffect +
		  round((MaxPower - MinimumEffect) / MathArgs) * MathArgs,
    {LabelList, PowerList} = filter_label_power(RealPower,
						LabelPowerList, [], []),
    formation_role_lib:match(Role, PowerList,
			     ExcludeRoleIds,
			     {planes_evt, guard_match_back,
			      [{Floor, LabelList, NextLine}]}),
    ok.

-spec guard_match_back(#role{}, #formation_role{},
		       list()) -> {ok, #role{}}.

guard_match_back(Role = #role{m_planes =
				  Planes = #m_planes{floor_list = FloorList}},
		 FormationRoleList, {Floor, LabelList, NextLine}) ->
    NewRole1 = case lists:keyfind(Floor,
				  #planes_floor.floor, FloorList)
		   of
		 PlanesFloor = #planes_floor{tile_list = TileList,
					     fight_ids = OldFightIds,
					     difficulty = Difficulty} ->
		     {NewTileList, ExchangeTileList, FightIds} =
			 do_guard_match_back(Role, Floor, Difficulty,
					     FormationRoleList, LabelList,
					     TileList, [], []),
		     NewPlanesFloor = PlanesFloor#planes_floor{tile_list =
								   NewTileList,
							       fight_ids =
								   OldFightIds
								     ++
								     FightIds},
		     NewFloorList = lists:keyreplace(Floor,
						     #planes_floor.floor,
						     FloorList, NewPlanesFloor),
		     NewPlanes = Planes#m_planes{floor_list = NewFloorList},
		     NewRole = Role#role{m_planes = NewPlanes},
		     planes:push(NewRole, 28606, ExchangeTileList),
		     NewRole;
		 _ ->
		     notice:alert(lang:get(<<"Lỗi dữ liệu"/utf8>>)), Role
	       end,
    case NextLine > 0 of
      true -> match_next_line(NewRole1, Floor, NextLine);
      _ -> skip
    end,
    {ok, NewRole1};
guard_match_back(Role, _FormationRoleList, _Args) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidplanes_evt213, _,
       {__Levelplanes_evt213, __Tracesplanes_evt213}}
	  when __Levelplanes_evt213 band 8 /= 0 orelse
		 __Tracesplanes_evt213 /= [] ->
	  lager:do_log(error,
		       [{module, planes_evt}, {function, guard_match_back},
			{line, 213}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "回调守卫匹配错误", none, 4096, 8, __Levelplanes_evt213,
		       __Tracesplanes_evt213, lager_event, __Pidplanes_evt213);
      _ -> ok
    end,
    {ok, Role}.

-spec match_next_line(#role{}, pos_integer(),
		      pos_integer()) -> ok.

match_next_line(Role = #role{m_planes =
				 #m_planes{floor_list = FloorList,
					   dun_power = MaxPower}},
		Floor, NextLine) ->
    case lists:keyfind(Floor, #planes_floor.floor,
		       FloorList)
	of
      #planes_floor{tile_list = TileList,
		    fight_ids = FightIds} ->
	  put(planes_guard_init_power_list, []),
	  init_next_guard_event(TileList, NextLine, MaxPower),
	  case get(planes_guard_init_power_list) of
	    [] -> ok;
	    LabelPowerList ->
		planes_evt:init_guard(Role, Floor, LabelPowerList,
				      FightIds, 0)
	  end;
      _ -> ok
    end.

check_click(_NowLine, Line, _NowIndex, Index, TileList,
	    0) ->
    case lists:keyfind({Line, Index}, #planes_tile.label,
		       TileList)
	of
      PlanesTile = #planes_tile{} -> PlanesTile;
      _ -> {false, lang:get(<<"Không có sự kiện"/utf8>>)}
    end;
check_click(NowLine, Line, NowIndex, Index, TileList,
	    1) ->
    case NowLine + 1 =:= Line of
      true ->
	  case lists:member(Index,
			    [NowIndex - 1, NowIndex, NowIndex + 1])
	      of
	    true ->
		case lists:keyfind({Line, Index}, #planes_tile.label,
				   TileList)
		    of
		  PlanesTile = #planes_tile{} -> PlanesTile;
		  _ -> {false, lang:get(<<"Không có sự kiện"/utf8>>)}
		end;
	    _ ->
		{false,
		 lang:get(<<"Sự kiện không thể được kích hoạt"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Sự kiện không thể được kích hoạt"/utf8>>)}
    end;
check_click(_NowLine, _Line, _NowIndex, _Index,
	    _TileList, _Action) ->
    {false, lang:get(<<"Lỗi tham số"/utf8>>)}.

do_click(Role, _Planes, _PlanesFloor, _PlanesTile, 0,
	 _Ext, #planes_evt_data{type = 0}) ->
    {ok, Role};
do_click(Role, Planes, PlanesFloor, PlanesTile, 1, _Ext,
	 EvtData = #planes_evt_data{type = 0}) ->
    NewRole = click_tile(Role, Planes, PlanesFloor,
			 PlanesTile, EvtData),
    {ok, NewRole};
do_click(Role = #role{lev = RoleLev},
	 Planes = #m_planes{dun_power = MaxPower,
			    floor_list = FloorList},
	 PlanesFloor = #planes_floor{tile_list = TileList,
				     floor = Floor},
	 PlanesTile = #planes_tile{ext = RoleExt,
				   defend_radio = DefendRadio, label = Label,
				   combat_power = CombatPower, evt_id = EvtId},
	 0, _Ext, #planes_evt_data{type = 1, ext = DataExt}) ->
    NewStrengthRadio = case lists:keyfind(strength, 1,
					  DataExt)
			   of
			 {strength, StrengthRadio} -> StrengthRadio;
			 {strength, StrengthRadio, _, _} -> StrengthRadio;
			 _ -> 1000
		       end,
    case RoleExt of
      [{FightId, Name, FormationType, PosInfo,
	{HallowsId, HallowsStep, HallowsSkill}, Partners,
	SpriteLev, SpriteBreakLev, Sprites}] ->
	  #{lev := Lev, face := Face} = robot:get(Role, FightId,
						  #{max_num => 5}),
	  NewPartners = [partner_ver:do_partner_ver(P)
			 || P <- Partners],
	  Fun = fun (#partner{power = Power, id = Pid, bid = Bid,
			      use_skin = UseSkin, lev = PLev, star = Star,
			      all_attr = #attr{atk = Atk, hp_max = HpMax}}) ->
			HpPer = case lists:keyfind(Pid, 1, DefendRadio) of
				  {_, Radio} -> Radio;
				  _ -> 100
				end,
			{Pid, Pid, Bid, PLev, Star, [{5, UseSkin}], HpPer,
			 HpMax, Atk, Power}
		end,
	  PList = [Fun(I) || I <- NewPartners],
	  planes:push(Role, 28607,
		      {FightId, <<>>, Name, Face, Lev, CombatPower, PList,
		       FormationType, Sprites, HallowsId, SpriteLev,
		       NewStrengthRadio, 0, <<>>}),
	  NewPlanesTile = PlanesTile#planes_tile{ext =
						     [{FightId, Name,
						       FormationType, PosInfo,
						       {HallowsId, HallowsStep,
							HallowsSkill},
						       NewPartners, SpriteLev,
						       SpriteBreakLev,
						       Sprites}]},
	  NewTileList = lists:keyreplace(Label,
					 #planes_tile.label, TileList,
					 NewPlanesTile),
	  NewPlanesFloor = PlanesFloor#planes_floor{tile_list =
							NewTileList},
	  NewFloorList = lists:keyreplace(Floor,
					  #planes_floor.floor, FloorList,
					  NewPlanesFloor),
	  NewPlanes = Planes#m_planes{floor_list = NewFloorList},
	  NewRole = Role#role{m_planes = NewPlanes},
	  {ok, NewRole};
      _ ->
	  CalculatingCoefficient =
	      planes_data:get_const(planes_calculating_coefficient),
	  MinimumEffect =
	      planes_data:get_const(planes_minimum_effectiveness),
	  MathArgs = round(RoleLev / 5 * CalculatingCoefficient),
	  RealPower = MinimumEffect +
			round((MaxPower - MinimumEffect) / MathArgs) * MathArgs,
	  RealPower1 = trunc(RealPower),
	  Return = case lists:keyfind(group, 1, DataExt) of
		     {group, GroupId} ->
			 case lists:keyfind(radio, 1, DataExt) of
			   {radio, Radio} ->
			       RealPower2 = round(RealPower1 * Radio / 1000),
			       case planes_data:get_robot_ids({GroupId,
							       RealPower2})
				   of
				 IdList when is_list(IdList) ->
				     {1, IdList, RealPower2};
				 _ -> false
			       end;
			   _ -> false
			 end;
		     _ -> false
		   end,
	  case Return of
	    {1, IdList1, NewPower} ->
		case util:rand_list(IdList1, 2) of
		  {FightId, _} ->
		      Name1 = case planes_data:get_event_name(EvtId) of
				undefined -> lang:get(<<"Quái vật trùm"/utf8>>);
				Name0 -> Name0
			      end,
		      Name = <<Name1/binary>>,
		      #{partners := Partners, lev := Lev, face := Face,
			formation := FormationType,
			hallows := {HallowsId, HallowsStep, HallowsSkill},
			sprite_info := {SpriteLev, SpriteBreakLev, Sprites}} =
			  robot:get(Role#role{max_power = NewPower}, FightId,
				    #{max_num => 5}),
		      ExpendPower = planes:get_monster_real_power(DataExt,
								  Partners),
		      Fun = fun (#partner{id = Pid, bid = Bid,
					  use_skin = UseSkin, lev = PLev,
					  star = Star,
					  all_attr =
					      #attr{atk = Atk, hp_max = HpMax},
					  power = Power}) ->
				    HpPer = case lists:keyfind(Pid, 1,
							       DefendRadio)
						of
					      {_, Radio1} -> Radio1;
					      _ -> 100
					    end,
				    {Pid, Pid, Bid, PLev, Star, [{5, UseSkin}],
				     HpPer, HpMax, Atk, Power}
			    end,
		      PList = [Fun(I) || I <- Partners],
		      planes:push(Role, 28607,
				  {FightId, <<>>, Name, Face, Lev, ExpendPower,
				   PList, FormationType, Sprites, HallowsId,
				   SpriteLev, NewStrengthRadio, 0, <<>>}),
		      PosInfo = [{Pid1, Pid1}
				 || #partner{id = Pid1} <- Partners],
		      NewPlanesTile = PlanesTile#planes_tile{combat_power =
								 ExpendPower,
							     ext =
								 [{FightId,
								   Name,
								   FormationType,
								   PosInfo,
								   {HallowsId,
								    HallowsStep,
								    HallowsSkill},
								   Partners,
								   SpriteLev,
								   SpriteBreakLev,
								   Sprites}]},
		      NewTileList = lists:keyreplace(Label,
						     #planes_tile.label,
						     TileList, NewPlanesTile),
		      NewPlanesFloor = PlanesFloor#planes_floor{tile_list =
								    NewTileList},
		      NewFloorList = lists:keyreplace(Floor,
						      #planes_floor.floor,
						      FloorList,
						      NewPlanesFloor),
		      NewPlanes = Planes#m_planes{floor_list = NewFloorList},
		      NewRole = Role#role{m_planes = NewPlanes},
		      {ok, NewRole};
		  _ ->
		      {false,
		       lang:get(<<"Không có quái vật tương ứng"/utf8>>)}
		end;
	    _ ->
		{false,
		 lang:get(<<"Không có quái vật tương ứng"/utf8>>)}
	  end
    end;
do_click(Role, Planes, PlanesFloor, PlanesTile, 1, Ext,
	 EvtData = #planes_evt_data{type = 1,
				    group_id = GroupId}) ->
    case planes_evt_lib:combat(Role, Planes, PlanesFloor,
			       PlanesTile, Ext, EvtData)
	of
      {ok, CombatRole,
       CombatPlanes = #m_planes{floor_list = FloorList},
       CombatPlanesFloor,
       CombatPlanesTile = #planes_tile{label = Label}} ->
	  {HidePlanesFloor = #planes_floor{floor = Floor,
					   tile_list = TileList},
	   ChangeTileList} =
	      planes_evt_lib:hide(CombatPlanesFloor, GroupId, Label),
	  NewTileList = lists:keyreplace(Label,
					 #planes_tile.label, TileList,
					 CombatPlanesTile),
	  NewPlanesFloor = HidePlanesFloor#planes_floor{tile_list
							    = NewTileList},
	  NewFloorList = lists:keyreplace(Floor,
					  #planes_floor.floor, FloorList,
					  NewPlanesFloor),
	  NewPlanes = CombatPlanes#m_planes{floor_list =
						NewFloorList},
	  NewRole = CombatRole#role{m_planes = NewPlanes},
	  planes:push(NewRole, 28606, ChangeTileList),
	  {ok, NewRole};
      {false, Reason} -> {false, Reason}
    end;
do_click(Role,
	 Planes = #m_planes{dun_power = MaxPower,
			    floor_list = FloorList},
	 PlanesFloor = #planes_floor{floor = Floor,
				     tile_list = TileList},
	 PlanesTile = #planes_tile{ext = RoleExt,
				   defend_radio = DefendRadio,
				   label = Label = {Line, _},
				   combat_power = CombatPower},
	 0, _Ext, #planes_evt_data{type = 2, ext = EventExt}) ->
    StrengthRadio = get_strength_radio(EventExt, MaxPower),
    case RoleExt of
      [{FightId = {Rid, SrvId}, Name, Face, Lev,
	FormationType, PosInfo,
	{HallowsId, HallowsLev, HallowsSkillLev, HallowsLookId,
	 AllLooksIds, HallowsLucky, HallowsSeal, HallowRefine},
	Partners, SpriteLev, SpriteBreakLev, Sprites,
	FaceUpdateTime, FaceFile}] ->
	  NewPartners = [partner_ver:do_partner_ver(P)
			 || P <- Partners],
	  Fun = fun ({Pos, PId}) ->
			#partner{bid = Bid, use_skin = UseSkin, lev = PLev,
				 star = Star,
				 all_attr = #attr{atk = Atk, hp_max = HpMax},
				 power = Power} =
			    lists:keyfind(PId, #partner.id, NewPartners),
			HpPer = case lists:keyfind(PId, 1, DefendRadio) of
				  {_, Radio} -> Radio;
				  _ -> 100
				end,
			{PId, Pos, Bid, PLev, Star, [{5, UseSkin}], HpPer,
			 HpMax, Atk, Power}
		end,
	  PList = [Fun(I) || I <- PosInfo],
	  planes:push(Role, 28607,
		      {Rid, SrvId, Name, Face, Lev, CombatPower, PList,
		       FormationType, Sprites, HallowsId, SpriteLev,
		       StrengthRadio, FaceUpdateTime, FaceFile}),
	  NewPlanesTile = PlanesTile#planes_tile{ext =
						     [{FightId = {Rid, SrvId},
						       Name, Face, Lev,
						       FormationType, PosInfo,
						       {HallowsId, HallowsLev,
							HallowsSkillLev,
							HallowsLookId,
							AllLooksIds,
							HallowsLucky,
							HallowsSeal,
							HallowRefine},
						       NewPartners, SpriteLev,
						       SpriteBreakLev, Sprites,
						       FaceUpdateTime,
						       FaceFile}]},
	  NewTileList = lists:keyreplace(Label,
					 #planes_tile.label, TileList,
					 NewPlanesTile),
	  NewPlanesFloor = PlanesFloor#planes_floor{tile_list =
							NewTileList},
	  NewFloorList = lists:keyreplace(Floor,
					  #planes_floor.floor, FloorList,
					  NewPlanesFloor),
	  NewPlanes = Planes#m_planes{floor_list = NewFloorList},
	  NewRole = Role#role{m_planes = NewPlanes},
	  {ok, NewRole};
      [{FightId = {Rid, SrvId}, Name, Face, Lev,
	FormationType, PosInfo,
	{HallowsId, HallowsLev, HallowsSkillLev, HallowsLookId,
	 AllLooksIds, HallowsLucky, HallowsSeal, HallowRefine},
	Partners, SpriteLev, SpriteBreakLev, Sprites}] ->
	  NewPartners = [partner_ver:do_partner_ver(P)
			 || P <- Partners],
	  Fun = fun ({Pos, PId}) ->
			#partner{bid = Bid, use_skin = UseSkin, lev = PLev,
				 star = Star,
				 all_attr = #attr{atk = Atk, hp_max = HpMax},
				 power = Power} =
			    lists:keyfind(PId, #partner.id, NewPartners),
			HpPer = case lists:keyfind(PId, 1, DefendRadio) of
				  {_, Radio} -> Radio;
				  _ -> 100
				end,
			{PId, Pos, Bid, PLev, Star, [{5, UseSkin}], HpPer,
			 HpMax, Atk, Power}
		end,
	  PList = [Fun(I) || I <- PosInfo],
	  planes:push(Role, 28607,
		      {Rid, SrvId, Name, Face, Lev, CombatPower, PList,
		       FormationType, Sprites, HallowsId, SpriteLev,
		       StrengthRadio, 0, <<>>}),
	  NewPlanesTile = PlanesTile#planes_tile{ext =
						     [{FightId = {Rid, SrvId},
						       Name, Face, Lev,
						       FormationType, PosInfo,
						       {HallowsId, HallowsLev,
							HallowsSkillLev,
							HallowsLookId,
							AllLooksIds,
							HallowsLucky,
							HallowsSeal,
							HallowRefine},
						       NewPartners, SpriteLev,
						       SpriteBreakLev,
						       Sprites}]},
	  NewTileList = lists:keyreplace(Label,
					 #planes_tile.label, TileList,
					 NewPlanesTile),
	  NewPlanesFloor = PlanesFloor#planes_floor{tile_list =
							NewTileList},
	  NewFloorList = lists:keyreplace(Floor,
					  #planes_floor.floor, FloorList,
					  NewPlanesFloor),
	  NewPlanes = Planes#m_planes{floor_list = NewFloorList},
	  NewRole = Role#role{m_planes = NewPlanes},
	  {ok, NewRole};
      [{FightId, Name, FormationType, PosInfo,
	{HallowsId, HallowsStep, HallowsSkill}, Partners,
	SpriteLev, SpriteBreakLev, Sprites}] ->
	  NewPartners = [partner_ver:do_partner_ver(P)
			 || P <- Partners],
	  #{lev := Lev, face := Face} = robot:get(Role, FightId,
						  #{max_num => 5}),
	  Fun = fun (#partner{id = Pid, bid = Bid,
			      use_skin = UseSkin, lev = PLev, star = Star,
			      all_attr = #attr{atk = Atk, hp_max = HpMax},
			      power = Power}) ->
			HpPer = case lists:keyfind(Pid, 1, DefendRadio) of
				  {_, Radio} -> Radio;
				  _ -> 100
				end,
			{Pid, Pid, Bid, PLev, Star, [{5, UseSkin}], HpPer,
			 HpMax, Atk, Power}
		end,
	  PList = [Fun(I) || I <- NewPartners],
	  planes:push(Role, 28607,
		      {FightId, <<>>, Name, Face, Lev, CombatPower, PList,
		       FormationType, Sprites, HallowsId, SpriteLev,
		       StrengthRadio, 0, <<>>}),
	  NewPlanesTile = PlanesTile#planes_tile{ext =
						     [{FightId, Name,
						       FormationType, PosInfo,
						       {HallowsId, HallowsStep,
							HallowsSkill},
						       NewPartners, SpriteLev,
						       SpriteBreakLev,
						       Sprites}]},
	  NewTileList = lists:keyreplace(Label,
					 #planes_tile.label, TileList,
					 NewPlanesTile),
	  NewPlanesFloor = PlanesFloor#planes_floor{tile_list =
							NewTileList},
	  NewFloorList = lists:keyreplace(Floor,
					  #planes_floor.floor, FloorList,
					  NewPlanesFloor),
	  NewPlanes = Planes#m_planes{floor_list = NewFloorList},
	  NewRole = Role#role{m_planes = NewPlanes},
	  {ok, NewRole};
      _ ->
	  notice:alert(lang:get(<<"Đang tải dữ liệu, vui lòng đợi"/utf8>>)),
	  planes_evt:match_next_line(Role, Floor, Line),
	  {ok, Role}
    end;
do_click(Role, Planes, PlanesFloor, PlanesTile, 1, Ext,
	 EvtData = #planes_evt_data{type = 2,
				    group_id = GroupId}) ->
    case planes_evt_lib:combat(Role, Planes, PlanesFloor,
			       PlanesTile, Ext, EvtData)
	of
      {ok, CombatRole,
       CombatPlanes = #m_planes{floor_list = FloorList},
       CombatPlanesFloor,
       CombatPlanesTile = #planes_tile{label = Label}} ->
	  {HidePlanesFloor = #planes_floor{tile_list = TileList,
					   floor = Floor},
	   ChangeTileList} =
	      planes_evt_lib:hide(CombatPlanesFloor, GroupId, Label),
	  NewTileList = lists:keyreplace(Label,
					 #planes_tile.label, TileList,
					 CombatPlanesTile),
	  NewPlanesFloor = HidePlanesFloor#planes_floor{tile_list
							    = NewTileList},
	  NewFloorList = lists:keyreplace(Floor,
					  #planes_floor.floor, FloorList,
					  NewPlanesFloor),
	  NewPlanes = CombatPlanes#m_planes{floor_list =
						NewFloorList},
	  NewRole = CombatRole#role{m_planes = NewPlanes},
	  planes:push(NewRole, 28606, ChangeTileList),
	  {ok, NewRole};
      {false, Reason} -> {false, Reason}
    end;
do_click(Role, _Planes, _PlanesFloor, _PlanesTile, 0,
	 _Ext, #planes_evt_data{type = 3}) ->
    {ok, Role};
do_click(Role,
	 Planes = #m_planes{partners_hp_radio = PartnerHpList},
	 PlanesFloor, PlanesTile, 1, _Ext,
	 EvtData = #planes_evt_data{type = 3,
				    ext = ReplyList}) ->
    case planes_evt_lib:collective_reply(ReplyList,
					 PartnerHpList, [])
	of
      {NewPartnerHpList, PushList}
	  when is_list(NewPartnerHpList) ->
	  NewPlanes = Planes#m_planes{partners_hp_radio =
					  NewPartnerHpList},
	  notice:alert(lang:get(<<"Sử dụng thành công, nước suối biến mất "
				  "khỏi tầm nhìn..."/utf8>>)),
	  planes:push(Role, 28609, PushList),
	  NewRole = click_tile(Role, NewPlanes, PlanesFloor,
			       PlanesTile, EvtData),
	  {ok, NewRole};
      {false, Reason} -> {false, Reason}
    end;
do_click(Role, _Planes, _PlanesFloor, _PlanesTile, 0,
	 _Ext, #planes_evt_data{type = 4}) ->
    {ok, Role};
do_click(Role,
	 Planes = #m_planes{partners_hp_radio = PartnerHpList},
	 PlanesFloor, PlanesTile, 1, _Ext,
	 EvtData = #planes_evt_data{type = 4,
				    ext = ReplyList}) ->
    case planes_evt_lib:collective_reply(ReplyList,
					 PartnerHpList, [])
	of
      {NewPartnerHpList, PushList}
	  when is_list(NewPartnerHpList) ->
	  NewPlanes = Planes#m_planes{partners_hp_radio =
					  NewPartnerHpList},
	  notice:alert(lang:get(<<"Sử dụng thành công, chữ thập biến mất "
				  "khỏi tầm nhìn..."/utf8>>)),
	  planes:push(Role, 28609, PushList),
	  NewRole = click_tile(Role, NewPlanes, PlanesFloor,
			       PlanesTile, EvtData),
	  {ok, NewRole};
      {false, Reason} -> {false, Reason}
    end;
do_click(Role,
	 Planes = #m_planes{floor_list = FloorList},
	 PlanesFloor = #planes_floor{floor = Floor,
				     tile_list = TileList},
	 PlanesTile = #planes_tile{label = Label,
				   ext = LoadPartners},
	 0, _Ext,
	 EvtData = #planes_evt_data{type = 5, ext = Ext}) ->
    case LoadPartners of
      [] ->
	  case role_misc:check_cd(planes_load, 2000) of
	    true ->
		GroupId = case lists:keyfind(group, 1, Ext) of
			    {group, Group} -> Group;
			    _ -> 1
			  end,
		partner_rand_lib:match(Role,
				       {planes_evt, load_partner_back,
					[Floor, PlanesTile, EvtData]},
				       #{group_id => GroupId}),
		{ok, Role};
	    _ ->
		{false, lang:get(<<"Xin vui lòng chờ vài giây"/utf8>>)}
	  end;
      _ ->
	  NewLoadPartners =
	      [planes_ver:do_load_partner_ver(LoadPartner)
	       || LoadPartner <- LoadPartners],
	  NewPlanesTile = PlanesTile#planes_tile{ext =
						     NewLoadPartners},
	  NewTileList = lists:keyreplace(Label,
					 #planes_tile.label, TileList,
					 NewPlanesTile),
	  NewPlanesFloor = PlanesFloor#planes_floor{tile_list =
							NewTileList},
	  NewFloorList = lists:keyreplace(Floor,
					  #planes_floor.floor, FloorList,
					  NewPlanesFloor),
	  NewPlanes = Planes#m_planes{floor_list = NewFloorList},
	  NewRole = Role#role{m_planes = NewPlanes},
	  planes:push(NewRole, 28622, {Label, LoadPartners}),
	  {ok, NewRole}
    end;
do_click(Role = #role{item_next_id = NextId},
	 Planes = #m_planes{load_partners = OldLoadPartners},
	 PlanesFloor,
	 PlanesTile = #planes_tile{ext = LoadPartners}, 1, Ext,
	 EvtData = #planes_evt_data{type = 5}) ->
    case lists:keyfind(9, 1, Ext) of
      {_, SelectId, _} ->
	  case lists:keyfind(SelectId, #planes_load_partner.pos,
			     LoadPartners)
	      of
	    LoadPartner = #planes_load_partner{name = Name} ->
		NewLoadPartner = LoadPartner#planes_load_partner{pos =
								     NextId},
		NewNextId = NextId + 1,
		NewPlanes = Planes#m_planes{load_partners =
						[NewLoadPartner
						 | OldLoadPartners]},
		Role1 = Role#role{item_next_id = NewNextId},
		notice:alert(util:fbin(lang:get(<<"~tsTham gia nhóm của chúng tôi và bạn "
						  "có thể xem nó trong danh sách anh hùng！"/utf8>>),
				       [color:format({yellow, Name})])),
		NewRole = click_tile(Role1, NewPlanes, PlanesFloor,
				     PlanesTile, EvtData),
		planes:push(NewRole, 28613),
		{ok, NewRole};
	    _ ->
		{false,
		 lang:get(<<"Không có anh hùng tương ứng"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"Lỗi tham số"/utf8>>)}
    end;
do_click(Role = #role{partner_bag =
			  #partner_bag{partner_list = PartnerList}},
	 Planes = #m_planes{buffs = Buffs, floor = Floor,
			    floor_list = FloorList,
			    load_partners = LoadPartners},
	 PlanesFloor = #planes_floor{floor = Floor,
				     tile_list = TileList},
	 PlanesTile = #planes_tile{label = Label,
				   ext = BuffList},
	 0, _Ext, #planes_evt_data{type = 6, ext = GroupList}) ->
    case BuffList of
      [] ->
	  case get_valid_partner(PartnerList, LoadPartners) of
	    ValidPartner when is_list(ValidPartner) ->
		case get_buff(Buffs, GroupList, ValidPartner, []) of
		  {ok, AddBuffs} ->
		      PushList = [{1, BuffId, 0} || BuffId <- AddBuffs],
		      planes:push(Role, 28614, {Floor, Label, PushList}),
		      NewPlanesTile = PlanesTile#planes_tile{ext = AddBuffs},
		      NewTileList = lists:keyreplace(Label,
						     #planes_tile.label,
						     TileList, NewPlanesTile),
		      NewPlanesFloor = PlanesFloor#planes_floor{tile_list =
								    NewTileList},
		      NewFloorList = lists:keyreplace(Floor,
						      #planes_floor.floor,
						      FloorList,
						      NewPlanesFloor),
		      NewPlanes = Planes#m_planes{floor_list = NewFloorList},
		      NewRole = Role#role{m_planes = NewPlanes},
		      {ok, NewRole};
		  {false, Reason} -> {false, Reason}
		end;
	    _ ->
		{false, lang:get(<<"Không có anh hùng hợp lệ"/utf8>>)}
	  end;
      _ ->
	  PushList = [{1, BuffId, 0} || BuffId <- BuffList],
	  planes:push(Role, 28614, {Floor, Label, PushList}),
	  {ok, Role}
    end;
do_click(Role, Planes = #m_planes{buffs = Buffs},
	 PlanesFloor = #planes_floor{floor = Floor,
				     difficulty = Difficulty},
	 PlanesTile = #planes_tile{ext = BuffList}, 1, Ext,
	 EvtData = #planes_evt_data{type = 6}) ->
    case lists:keyfind(5, 1, Ext) of
      {_, SelectBuffId, _} ->
	  case lists:member(SelectBuffId, BuffList) of
	    true ->
		NewPlanesFloor = PlanesFloor#planes_floor{is_treasure =
							      0},
		NewBuffs = [SelectBuffId | Buffs],
		NewPlanes = Planes#m_planes{buffs = NewBuffs},
		NewRole = click_tile(Role, NewPlanes, NewPlanesFloor,
				     PlanesTile, EvtData),
		[log:save(join,
			  {NewRole, <<"新版位面buff选择"/utf8>>,
			   util:fbin(<<"~w生成层数~w难度~w"/utf8>>,
				     [BuffId, Floor, Difficulty])})
		 || BuffId <- BuffList],
		log:save(join,
			 {NewRole, <<"新版位面buff选择"/utf8>>,
			  util:fbin(<<"~w完成层数~w难度~w"/utf8>>,
				    [SelectBuffId, Floor, Difficulty])}),
		{ok, NewRole};
	    _ -> {false, lang:get(<<"Không có Buff"/utf8>>)}
	  end;
      _ ->
	  {false, lang:get(<<"Lỗi khi chọn tham số Buff"/utf8>>)}
    end;
do_click(Role = #role{lev = Lev},
	 Planes = #m_planes{floor_list = FloorList},
	 PlanesFloor = #planes_floor{tile_list = TileList,
				     floor = Floor},
	 PlanesTile = #planes_tile{label = Label, ext = IdsList,
				   is_business = IsFlag},
	 0, _Ext, #planes_evt_data{type = 7}) ->
    case IdsList of
      [] ->
	  NewIdsList = get_businessman_item(Lev),
	  NewPlanesTile = PlanesTile#planes_tile{ext =
						     NewIdsList},
	  NewTileList = lists:keyreplace(Label,
					 #planes_tile.label, TileList,
					 NewPlanesTile),
	  NewPlanesFloor = PlanesFloor#planes_floor{tile_list =
							NewTileList},
	  NewFloorList = lists:keyreplace(Floor,
					  #planes_floor.floor, FloorList,
					  NewPlanesFloor),
	  NewPlanes = Planes#m_planes{floor_list = NewFloorList},
	  NewRole = Role#role{m_planes = NewPlanes},
	  planes:push(NewRole, 28621,
		      {NewIdsList, IsFlag, Label}),
	  {ok, NewRole};
      _ ->
	  planes:push(Role, 28621, {IdsList, IsFlag, Label}),
	  {ok, Role}
    end;
do_click(Role, Planes, PlanesFloor, PlanesTile, 1, Ext,
	 EvtData = #planes_evt_data{type = 7,
				    group_id = GroupId}) ->
    case Ext of
      [{6, _, _}] ->
	  select_business(Role, Planes, PlanesFloor, PlanesTile,
			  GroupId);
      [{7, Pos, _}] ->
	  select_business_item(Role, Planes, PlanesFloor,
			       PlanesTile, Pos);
      [{8, _, _}] ->
	  go_business(Role, Planes, PlanesFloor, PlanesTile,
		      EvtData);
      _ -> {false, lang:get(<<"Lỗi tham số"/utf8>>)}
    end;
do_click(_Role, _Planes, _PlanesFloor, _PlanesTile,
	 _Action, _Ext, _EvtData) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidplanes_evt680, _,
       {__Levelplanes_evt680, __Tracesplanes_evt680}}
	  when __Levelplanes_evt680 band 8 /= 0 orelse
		 __Tracesplanes_evt680 /= [] ->
	  lager:do_log(error,
		       [{module, planes_evt}, {function, do_click},
			{line, 680}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]操作格子:~w 失败 action=~w ext=~w, "
				     "evt_data=~w",
				     [_Role#role.name, _PlanesTile, _Action,
				      _Ext, _EvtData]),
		       none, 4096, 8, __Levelplanes_evt680,
		       __Tracesplanes_evt680, lager_event, __Pidplanes_evt680);
      _ -> ok
    end,
    {false,
     lang:get(<<"Hoạt động không thành công"/utf8>>)}.

click_tile(Role,
	   Planes = #m_planes{floor_list = FloorList}, PlanesFloor,
	   PlanesTile = #planes_tile{label = Label,
				     evt_id = EvtId},
	   #planes_evt_data{type = Type, group_id = GroupId,
			    exchange_id = ExchangeId,
			    reward_list = RewardList}) ->
    {PlanesFloor1, ChangeTileList} =
	planes_evt_lib:hide(PlanesFloor, GroupId, Label),
    Role1 = planes_evt_lib:do_reward(Role, RewardList,
				     Type),
    {PlanesFloor2, PlanesTile1} =
	planes_evt_lib:exchange_tile(PlanesFloor1, PlanesTile,
				     ExchangeId),
    {PlanesFloor3 = #planes_floor{tile_list = TileList},
     PlanesTile2 = #planes_tile{label = Label2},
     ShowCombatPushList} =
	planes_evt_lib:walk_floor(PlanesFloor2, PlanesTile1,
				  Role1),
    NewTileList = lists:keyreplace(Label2,
				   #planes_tile.label, TileList, PlanesTile2),
    NewPlanesFloor = #planes_floor{floor = Floor,
				   difficulty = Difficulty, line = Line} =
			 PlanesFloor3#planes_floor{tile_list = NewTileList},
    NewFloorList = lists:keyreplace(Floor,
				    #planes_floor.floor, FloorList,
				    NewPlanesFloor),
    NewPlanes = Planes#m_planes{floor_list = NewFloorList},
    NewRole = Role1#role{m_planes = NewPlanes},
    planes_evt:match_next_line(NewRole, Floor, Line + 2),
    NewChangeTileList = [PlanesTile2 | ChangeTileList],
    NewChangeTileList1 = NewChangeTileList ++
			   ShowCombatPushList,
    planes:push(NewRole, 28606, NewChangeTileList1),
    LogName = planes_evt_lib:get_name(Type),
    log_join_event(Type, TileList, Label, Floor, Difficulty,
		   NewRole),
    log:save(task,
	     {NewRole, 0, EvtId,
	      util:fbin(<<"类型~ts-层数~w-难度~w"/utf8>>,
			[LogName, Floor, Difficulty]),
	      107, <<"新版位面事件"/utf8>>, <<"新版位面事件"/utf8>>}),
    log:save(task,
	     {NewRole, 1, EvtId,
	      util:fbin(<<"类型~ts-层数~w-难度~w"/utf8>>,
			[LogName, Floor, Difficulty]),
	      107, <<"新版位面事件"/utf8>>, <<"新版位面事件"/utf8>>}),
    NewRole.

get_strength_radio(DataExt, MaxPower) ->
    case lists:keyfind(group, 1, DataExt) of
      {group, GroupId} ->
	  case planes_data:get_guard_ext({GroupId, MaxPower}) of
	    NewDataExt when is_list(NewDataExt) ->
		case lists:keyfind(strength, 1, NewDataExt) of
		  {strength, StrengthRadio} -> StrengthRadio;
		  {strength, StrengthRadio, _, _} -> StrengthRadio;
		  _ -> 1000
		end;
	    _ -> 1000
	  end;
      _ -> 1000
    end.

get_buff(_Buffs, [], _ValidPartner, SelectIdList) ->
    {ok, SelectIdList};
get_buff(Buffs, [GroupId | Rest], ValidPartner,
	 SelectIdList) ->
    AllBuffs = planes_data:get_buffs(),
    Fun = fun ({DataGroupId, BuffId, Weight, IsReturn,
		ExtWeightList}) ->
		  case DataGroupId =:= GroupId of
		    true when IsReturn =:= 1 ->
			AddWeight = add_weight(ExtWeightList, ValidPartner, 0),
			{true, {BuffId, Weight + AddWeight}};
		    true ->
			case lists:member(BuffId, Buffs) of
			  true -> false;
			  _ ->
			      AddWeight = add_weight(ExtWeightList,
						     ValidPartner, 0),
			      {true, {BuffId, Weight + AddWeight}}
			end;
		    _ -> false
		  end
	  end,
    FilterBuffList = lists:filtermap(Fun, AllBuffs),
    case util:rand_list(FilterBuffList, 2) of
      {SelectId, _} ->
	  get_buff([SelectId | Buffs], Rest, ValidPartner,
		   [SelectId | SelectIdList]);
      _ -> get_buff(Buffs, Rest, ValidPartner, SelectIdList)
    end;
get_buff(_Buffs, _, _ValidPartner, _SelectIdList) ->
    {false, lang:get(<<"Lỗi khi chọn tham số Buff"/utf8>>)}.

add_weight([], _ValidPartner, AddWeight) -> AddWeight;
add_weight(_ExtWeightList, [], AddWeight) -> AddWeight;
add_weight([{partner, BaseId, Weight, Time} | Rest],
	   ValidPartner, AddWeight) ->
    case length([1
		 || {PartnerId, _CampId, _CareerId} <- ValidPartner,
		    PartnerId =:= BaseId])
	of
      RealTime when RealTime > Time ->
	  add_weight(Rest, ValidPartner,
		     Weight * Time + AddWeight);
      RealTime ->
	  add_weight(Rest, ValidPartner,
		     Weight * RealTime + AddWeight)
    end;
add_weight([{camp_type, CampType, Weight, Time} | Rest],
	   ValidPartner, AddWeight) ->
    case length([1
		 || {_PartnerId, CampId, _CareerId} <- ValidPartner,
		    CampId =:= CampType])
	of
      RealTime when RealTime > Time ->
	  add_weight(Rest, ValidPartner,
		     Weight * Time + AddWeight);
      RealTime ->
	  add_weight(Rest, ValidPartner,
		     Weight * RealTime + AddWeight)
    end;
add_weight([{career_type, CareerType, Weight, Time}
	    | Rest],
	   ValidPartner, AddWeight) ->
    case length([1
		 || {_PartnerId, _CampId, CareerId} <- ValidPartner,
		    CareerId =:= CareerType])
	of
      RealTime when RealTime > Time ->
	  add_weight(Rest, ValidPartner,
		     Weight * Time + AddWeight);
      RealTime ->
	  add_weight(Rest, ValidPartner,
		     Weight * RealTime + AddWeight)
    end;
add_weight(_, _ValidPartner, AddWeight) -> AddWeight.

get_valid_partner([], _LoadPartners) ->
    {false, lang:get(<<"Không có anh hùng hợp lệ"/utf8>>)};
get_valid_partner(PartnerList, LoadPartners) ->
    PartnerIds = get_own_partner_ids(PartnerList),
    LoadPartnerIds = [LoadId
		      || #planes_load_partner{bid = LoadId} <- LoadPartners],
    ValidPartner = get_valid_partner1(PartnerIds ++
					LoadPartnerIds,
				      []),
    ValidPartner.

get_own_partner_ids(PartnerList) ->
    PowerNum =
	planes_data:get_const(planes_buff_partner_num),
    Coefficient =
	planes_data:get_const(planes_buff_coefficient),
    VailPartner =
	lists:sublist(lists:reverse(lists:keysort(#partner.power,
						  PartnerList)),
		      PowerNum),
    AllPower = lists:sum([Power
			  || #partner{power = Power} <- VailPartner]),
    VailNum = length(VailPartner),
    VailPower = AllPower / VailNum * Coefficient / 1000,
    PartnerIds = [PartnerId
		  || #partner{bid = PartnerId, power = Power1}
			 <- PartnerList,
		     Power1 > VailPower],
    PartnerIds.

get_valid_partner1([], ValidPartner) -> ValidPartner;
get_valid_partner1([BaseId | Rest], ValidPartner) ->
    case partner_data:get_base(BaseId) of
      #partner_base_data{type = Type, camp_type = CampType} ->
	  get_valid_partner1(Rest,
			     [{BaseId, CampType, Type} | ValidPartner]);
      _ -> get_valid_partner1(Rest, ValidPartner)
    end;
get_valid_partner1(_AllIds, ValidPartner) ->
    ValidPartner.

get_businessman_item(Lev) ->
    AllItems = planes_data:get_businessman(),
    PosItems = get_pos_item(AllItems, Lev, []),
    IdsList = get_pos_id(PosItems, []),
    IdsList.

get_pos_id([], IdsList) -> IdsList;
get_pos_id([{Pos, PosList} | Rest], IdsList) ->
    case util:rand_list(PosList, 2) of
      {Id, _Weight} ->
	  get_pos_id(Rest, [{Pos, Id, 0} | IdsList]);
      _ -> get_pos_id(Rest, IdsList)
    end;
get_pos_id(_, IdsList) -> IdsList.

get_pos_item([], _Lev, PosItems) -> PosItems;
get_pos_item([{MinLev, MaxLev, Pos, Id, Weight} | Rest],
	     Lev, PosItems)
    when Lev >= MinLev andalso Lev =< MaxLev ->
    case lists:keyfind(Pos, 1, PosItems) of
      {Pos, PosList} ->
	  NewPosList = [{Id, Weight} | PosList],
	  NewPosItems = lists:keyreplace(Pos, 1, PosItems,
					 {Pos, NewPosList}),
	  get_pos_item(Rest, Lev, NewPosItems);
      _ ->
	  get_pos_item(Rest, Lev,
		       [{Pos, [{Id, Weight}]} | PosItems])
    end;
get_pos_item([{_MinLev, _MaxLev, _Pos, _Id, _Weight}
	      | Rest],
	     Lev, PosItems) ->
    get_pos_item(Rest, Lev, PosItems);
get_pos_item(_, _Lev, PosItems) -> PosItems.

select_business(Role,
		Planes = #m_planes{floor_list = FloorList}, PlanesFloor,
		PlanesTile = #planes_tile{label = Label, ext = IdsList,
					  is_business = Flag},
		GroupId) ->
    case IdsList of
      [] ->
	  {false,
	   lang:get(<<"Vui lòng kiểm tra sự kiện trước"/utf8>>)};
      _ when Flag =:= 1 ->
	  {false, lang:get(<<"Bạn đã chọn sự kiện này"/utf8>>)};
      _ ->
	  {HidePlanesFloor = #planes_floor{floor = Floor,
					   tile_list = TileList},
	   ChangeTileList} =
	      planes_evt_lib:hide(PlanesFloor, GroupId, Label),
	  NewPlanesTile = PlanesTile#planes_tile{is_business = 1},
	  NewTileList = lists:keyreplace(Label,
					 #planes_tile.label, TileList,
					 NewPlanesTile),
	  NewPlanesFloor = HidePlanesFloor#planes_floor{tile_list
							    = NewTileList},
	  NewFloorList = lists:keyreplace(Floor,
					  #planes_floor.floor, FloorList,
					  NewPlanesFloor),
	  NewPlanes = Planes#m_planes{floor_list = NewFloorList},
	  NewRole = Role#role{m_planes = NewPlanes},
	  planes:push(NewRole, 28621, {IdsList, 1, Label}),
	  planes:push(NewRole, 28606, ChangeTileList),
	  {ok, NewRole}
    end.

select_business_item(Role,
		     Planes = #m_planes{floor_list = FloorList},
		     PlanesFloor = #planes_floor{floor = Floor,
						 tile_list = TileList},
		     PlanesTile = #planes_tile{label = Label, ext = IdsList,
					       is_business = 1},
		     Pos) ->
    case lists:keyfind(Pos, 1, IdsList) of
      {Pos, _Id, 1} ->
	  {false, lang:get(<<"Mặt hàng này đã bán hết"/utf8>>)};
      {Pos, Id, 0} ->
	  case planes_data:get_businessman_item(Id) of
	    {BaseId, Num, Price, CostType} ->
		PayType = item_data:assets_atom2code(CostType),
		Loss = [{PayType, Price}],
		Gain = [{BaseId, Num}],
		NewLoss = format:val_to_loss(Loss, planes),
		NewGain = format:val_to_gain(Gain, planes),
		CollectionList = NewLoss ++ NewGain,
		case role_gain:do_notice(Role, CollectionList) of
		  {ok, GainRole} ->
		      NewIdsList = lists:keyreplace(Pos, 1, IdsList,
						    {Pos, Id, 1}),
		      NewPlanesTile = PlanesTile#planes_tile{ext =
								 NewIdsList},
		      NewTileList = lists:keyreplace(Label,
						     #planes_tile.label,
						     TileList, NewPlanesTile),
		      NewPlanesFloor = PlanesFloor#planes_floor{tile_list =
								    NewTileList},
		      NewFloorList = lists:keyreplace(Floor,
						      #planes_floor.floor,
						      FloorList,
						      NewPlanesFloor),
		      NewPlanes = Planes#m_planes{floor_list = NewFloorList},
		      NewRole = GainRole#role{m_planes = NewPlanes},
		      log:log_gain(CollectionList, Role, GainRole,
				   <<"位面"/utf8>>, <<"位面商人事件"/utf8>>),
		      planes:push(NewRole, 28621, {NewIdsList, 1, Label}),
		      {ok, NewRole};
		  _ ->
		      {false,
		       lang:get(<<"Sự cứu chuộc không thành công"/utf8>>)}
		end;
	    _ ->
		{false, lang:get(<<"Không có dữ liệu sản phẩm"/utf8>>)}
	  end;
      _ ->
	  {false, lang:get(<<"Không có mục nào như vậy"/utf8>>)}
    end;
select_business_item(_Role, _Planes, _PlanesFloor,
		     _PlanesTile, _Pos) ->
    {false,
     lang:get(<<"Vui lòng chọn sự kiện trước"/utf8>>)}.

go_business(_Role, _Planes, _PlanesFloor,
	    _PlanesTile = #planes_tile{is_business = 0},
	    _EvtData) ->
    {false,
     lang:get(<<"Vui lòng chọn sự kiện trước"/utf8>>)};
go_business(Role, Planes, PlanesFloor, PlanesTile,
	    EvtData) ->
    NewRole = click_tile_combat(Role, Planes, PlanesFloor,
				PlanesTile, EvtData),
    {ok, NewRole}.

reward_floor(Role,
	     PlanesFloor = #planes_floor{is_can_reward = 0,
					 map_id = MapId, is_reward = IsReward,
					 floor = Floor, difficulty = Difficult},
	     #planes_tile{label = {Line, _}}, 1) ->
    Role1 = role_trigger:fire(#evt_planes_kill_guard{},
			      Role),
    case is_max_line(MapId, Line) of
      true ->
	  Role2 = planes_war_order:add_score(Role1, Floor,
					     Difficult),
	  NewPlanesFloor = PlanesFloor#planes_floor{is_can_reward
							= 1},
	  NewRole = case Floor >= 3 of
		      true -> role_trigger:fire(#evt_planes_pass{}, Role2);
		      _ -> Role2
		    end,
	  log:save(join,
		   {NewRole, <<"新版位面"/utf8>>,
		    util:fbin(<<"通关新版位面~w层数难度~w"/utf8>>,
			      [Floor, Difficult])}),
	  planes:push(NewRole, 28624, {1, IsReward}),
	  {NewRole, NewPlanesFloor};
      _ -> {Role1, PlanesFloor}
    end;
reward_floor(Role, PlanesFloor, _PlanesTile, 2) ->
    NewRole = role_trigger:fire(#evt_planes_kill_guard{},
				Role),
    {NewRole, PlanesFloor};
reward_floor(Role, PlanesFloor, _PlanesTile, _Type) ->
    {Role, PlanesFloor}.

reward_floor_false(Role,
		   PlanesFloor = #planes_floor{is_can_reward = 0,
					       map_id = MapId,
					       is_reward = IsReward,
					       floor = Floor,
					       difficulty = Difficult},
		   #planes_tile{label = {Line, _}}, 1) ->
    case is_max_line(MapId, Line) of
      true ->
	  Role2 = planes_war_order:add_score(Role, Floor,
					     Difficult),
	  NewPlanesFloor = PlanesFloor#planes_floor{is_can_reward
							= 1},
	  NewRole = case Floor >= 3 of
		      true -> role_trigger:fire(#evt_planes_pass{}, Role2);
		      _ -> Role2
		    end,
	  log:save(join,
		   {NewRole, <<"新版位面"/utf8>>,
		    util:fbin(<<"通关新版位面~w层数难度~w"/utf8>>,
			      [Floor, Difficult])}),
	  planes:push(NewRole, 28624, {1, IsReward}),
	  {NewRole, NewPlanesFloor};
      _ -> {Role, PlanesFloor}
    end;
reward_floor_false(Role, PlanesFloor, _PlanesTile,
		   _Type) ->
    {Role, PlanesFloor}.

is_max_line(MapId, Line) ->
    AllLineList = [DataLine
		   || {DataMapId, DataLine, _DataTile1, _DataTile2,
		       _DataTile3, _DataTile4, _DataTile5}
			  <- planes_data:get_event_id(),
		      DataMapId =:= MapId],
    case AllLineList of
      [] -> false;
      _ ->
	  case lists:max(AllLineList) =:= Line of
	    true -> true;
	    _ -> false
	  end
    end.

log_join_event(6, _TileList, _Label, _Floor,
	       _Difficulty, _Role) ->
    ok;
log_join_event(Type, TileList, {Line, _}, Floor,
	       Difficulty, Role) ->
    log_same_line(Line, TileList, Floor, Difficulty, Role),
    LogName = planes_evt_lib:get_name(Type),
    log:save(join,
	     {Role, <<"新版位面事件参与"/utf8>>,
	      util:fbin(<<"类型~ts完成层数~w难度~w"/utf8>>,
			[LogName, Floor, Difficulty])});
log_join_event(_Type, _TileList, _Label, _Floor,
	       _Difficulty, _Role) ->
    ok.

log_same_line(_Line, [], _Floor, _Difficulty, _Role) ->
    ok;
log_same_line(Line,
	      [#planes_tile{label = {Line, _}, evt_id = EvtId}
	       | Rest],
	      Floor, Difficulty, Role) ->
    case planes_data:get_evt(EvtId) of
      #planes_evt_data{type = Type} ->
	  LogName = planes_evt_lib:get_name(Type),
	  log:save(join,
		   {Role, <<"新版位面事件参与"/utf8>>,
		    util:fbin(<<"类型~ts生成层数~w难度~w"/utf8>>,
			      [LogName, Floor, Difficulty])}),
	  log_same_line(Line, Rest, Floor, Difficulty, Role);
      _ -> log_same_line(Line, Rest, Floor, Difficulty, Role)
    end;
log_same_line(Line, [#planes_tile{} | Rest], Floor,
	      Difficulty, Role) ->
    log_same_line(Line, Rest, Floor, Difficulty, Role);
log_same_line(_Line, _Rest, _Floor, _Difficulty,
	      _Role) ->
    ok.

get_loan_robot([], _Role, _BidList, _GroupId,
	       AddLoadPartnerList) ->
    AddLoadPartnerList;
get_loan_robot([Pos | Rest], Role, BidList, GroupId,
	       AddLoadPartnerList) ->
    case partner_rand_lib:planes_match(Role, Pos, BidList,
				       GroupId)
	of
      LoadPartnerRand = #planes_load_partner{bid = Bid} ->
	  get_loan_robot(Rest, Role, [Bid | BidList], GroupId,
			 [LoadPartnerRand | AddLoadPartnerList]);
      _ ->
	  get_loan_robot(Rest, Role, BidList, GroupId,
			 AddLoadPartnerList)
    end;
get_loan_robot(_Rest, _Role, _BidList, _GroupId,
	       AddLoadPartnerList) ->
    AddLoadPartnerList.

get_match_guard_monster_information(EvtId, MaxPower,
				    RoleLev) ->
    case planes_data:get_evt(EvtId) of
      #planes_evt_data{ext = DataExt} ->
	  case lists:keyfind(group, 1, DataExt) of
	    {group, GroupId} ->
		case planes_data:get_guard_ext({GroupId, MaxPower}) of
		  NewDataExt when is_list(NewDataExt) ->
		      case lists:keyfind(power, 1, NewDataExt) of
			{power, PowerList} ->
			    MinRadio1 = case PowerList of
					  [{MinRadio, _MaxRadio} | _Rest] ->
					      MinRadio;
					  _ -> 1000
					end,
			    CalculatingCoefficient =
				planes_data:get_const(planes_calculating_coefficient),
			    MinimumEffect =
				planes_data:get_const(planes_minimum_effectiveness),
			    MathArgs = round(RoleLev / 5 *
					       CalculatingCoefficient),
			    RealPower = MinimumEffect +
					  round((MaxPower - MinimumEffect) /
						  MathArgs)
					    * MathArgs,
			    RealPower1 = round(RealPower * MinRadio1 / 1000),
			    {RealPower1, NewDataExt};
			_ -> false
		      end;
		  _ -> false
		end;
	    _ -> false
	  end;
      _ -> false
    end.

get_partner_information([], _StrengthRadio, Partners,
			PosInfo, AllPower) ->
    {Partners, PosInfo, AllPower};
get_partner_information([P = #formation_partner{id = Id,
						pos = Pos}
			 | Rest],
			StrengthRadio, Partners, PosInfo, AllPower) ->
    P1 = #partner{all_attr = AllAttr} =
	     formation_role_lib:to_partner(P),
    NAttr = base_ratio(StrengthRadio, AllAttr),
    P2 = P1#partner{all_attr = NAttr},
    NewP = #partner{power = Power} =
	       partner_lib:calc_power(P2),
    get_partner_information(Rest, StrengthRadio,
			    [NewP | Partners], [{Pos, Id} | PosInfo],
			    Power + AllPower).

filter_label_power(_RealPower, [], LabelList,
		   AllPowerList) ->
    {LabelList, AllPowerList};
filter_label_power(RealPower,
		   [{Label, PowerList} | Rest], LabelList, AllPowerList) ->
    NewPowerList = [{round(MinRadio * RealPower / 1000),
		     round(MaxRadio * RealPower / 1000)}
		    || {MinRadio, MaxRadio} <- PowerList],
    filter_label_power(RealPower, Rest, [Label | LabelList],
		       [NewPowerList | AllPowerList]).

do_guard_match_back(_Role, _Floor, _Difficulty, [],
		    _LabelRest, TileList, ExchangeTileList, FightIds) ->
    {TileList, ExchangeTileList, FightIds};
do_guard_match_back(_Role, _Floor, _Difficulty,
		    _FormationRole, [], TileList, ExchangeTileList,
		    FightIds) ->
    {TileList, ExchangeTileList, FightIds};
do_guard_match_back(Role = #role{m_planes =
				     #m_planes{dun_power = MaxPower}},
		    Floor, Difficulty,
		    [#formation_role{id = ArenaId, name = Name,
				     face_id = Face, lev = Lev,
				     formation_type = FormationType,
				     partners = FormationPartners,
				     sprite_lev = SpriteLev,
				     sprite_break_lev = SpriteBreakLev,
				     sprites = Sprites, hallows_id = HallowsId,
				     hallows_lev = HallowsLev,
				     hallows_skill_lev = HallowsSkillLev,
				     hallows_look_id = HallowsLookId,
				     hallows_all_look_ids = AllLooksIds,
				     hallows_lucky = HallowsLucky,
				     hallows_seal = HallowsSeal,
				     hallows_refine = HallowRefine,
				     face_file = FaceFile,
				     ext = FormationRoleExt}
		     | RoleRest],
		    [Label | LabelRest], TileList, ExchangeTileList,
		    FightIds) ->
    case lists:keyfind(Label, #planes_tile.label, TileList)
	of
      PlanesTile = #planes_tile{ext = [], evt_id = EvtId} ->
	  StrengthRadio = get_real_strength_radio(EvtId,
						  MaxPower),
	  {Partners, PosInfo, ExpendPower} =
	      get_partner_information(FormationPartners,
				      StrengthRadio, [], [], 0),
	  FaceUpdateTime = list_util:keyfind(1, FormationRoleExt,
					     0),
	  NewPlanesTile = PlanesTile#planes_tile{combat_power =
						     ExpendPower,
						 ext =
						     [{ArenaId, Name, Face, Lev,
						       FormationType, PosInfo,
						       {HallowsId, HallowsLev,
							HallowsSkillLev,
							HallowsLookId,
							AllLooksIds,
							HallowsLucky,
							HallowsSeal,
							HallowRefine},
						       Partners, SpriteLev,
						       SpriteBreakLev, Sprites,
						       FaceUpdateTime,
						       FaceFile}]},
	  NewTileList = lists:keyreplace(Label,
					 #planes_tile.label, TileList,
					 NewPlanesTile),
	  do_guard_match_back(Role, Floor, Difficulty, RoleRest,
			      LabelRest, NewTileList,
			      [NewPlanesTile | ExchangeTileList],
			      [ArenaId | FightIds]);
      _ ->
	  do_guard_match_back(Role, Floor, Difficulty, RoleRest,
			      LabelRest, TileList, ExchangeTileList, FightIds)
    end;
do_guard_match_back(Role = #role{lev = RoleLev,
				 m_planes = #m_planes{dun_power = MaxPower}},
		    Floor, Difficulty, [false | RoleRest],
		    [Label | LabelRest], TileList, ExchangeTileList,
		    FightIds) ->
    case lists:keyfind(Label, #planes_tile.label, TileList)
	of
      PlanesTile = #planes_tile{ext = [], evt_id = EvtId} ->
	  case get_match_guard_monster_information(EvtId,
						   MaxPower, RoleLev)
	      of
	    {RealPower, DataExt} ->
		case planes_data:get_monster_ids({Floor, Difficulty,
						  RealPower})
		    of
		  IdList when is_list(IdList) ->
		      case util:rand_list(IdList, 2) of
			{FightId, _} ->
			    Name1 =
				util:rand_list(random_name_data:arena_list(1)),
			    Name2 =
				util:rand_list(random_name_data:arena_list(2)),
			    Name3 =
				util:rand_list(random_name_data:arena_list(3)),
			    Name = <<Name1/binary, Name2/binary, Name3/binary>>,
			    #{partners := Partners, formation := FormationType,
			      hallows := {HallowsId, HallowsStep, HallowsSkill},
			      sprite_info :=
				  {SpriteLev, SpriteBreakLev, Sprites}} =
				robot:get(Role#role{max_power = RealPower},
					  FightId, #{max_num => 5}),
			    ExpendPower = planes:get_monster_real_power(DataExt,
									Partners),
			    PosInfo = [{Pid1, Pid1}
				       || #partner{id = Pid1} <- Partners],
			    NewPlanesTile = PlanesTile#planes_tile{combat_power
								       =
								       ExpendPower,
								   ext =
								       [{FightId,
									 Name,
									 FormationType,
									 PosInfo,
									 {HallowsId,
									  HallowsStep,
									  HallowsSkill},
									 Partners,
									 SpriteLev,
									 SpriteBreakLev,
									 Sprites}]},
			    NewTileList = lists:keyreplace(Label,
							   #planes_tile.label,
							   TileList,
							   NewPlanesTile),
			    do_guard_match_back(Role, Floor, Difficulty,
						RoleRest, LabelRest,
						NewTileList,
						[NewPlanesTile
						 | ExchangeTileList],
						FightIds);
			_ ->
			    do_guard_match_back(Role, Floor, Difficulty,
						RoleRest, LabelRest, TileList,
						ExchangeTileList, FightIds)
		      end;
		  _ ->
		      do_guard_match_back(Role, Floor, Difficulty, RoleRest,
					  LabelRest, TileList, ExchangeTileList,
					  FightIds)
		end;
	    _ ->
		do_guard_match_back(Role, Floor, Difficulty, RoleRest,
				    LabelRest, TileList, ExchangeTileList,
				    FightIds)
	  end;
      _ ->
	  do_guard_match_back(Role, Floor, Difficulty, RoleRest,
			      LabelRest, TileList, ExchangeTileList, FightIds)
    end;
do_guard_match_back(_Role, _Floor, _Difficulty,
		    _FormationRole, _LabelRest, TileList, ExchangeTileList,
		    FightIds) ->
    {TileList, ExchangeTileList, FightIds}.

init_next_guard_event([], _Line, _MaxPower) -> skip;
init_next_guard_event([#planes_tile{label =
					Label = {Line, _},
				    evt_id = EvtId, ext = []}
		       | Rest],
		      Line, MaxPower) ->
    case planes_data:get_evt(EvtId) of
      #planes_evt_data{type = 2, ext = DataExt} ->
	  planes:put_planes_guard_init_power_list(DataExt,
						  MaxPower, Label);
      _ -> skip
    end,
    init_next_guard_event(Rest, Line, MaxPower);
init_next_guard_event([#planes_tile{} | Rest], Line,
		      MaxPower) ->
    init_next_guard_event(Rest, Line, MaxPower);
init_next_guard_event(_Rest, _Line, _MaxPower) -> skip.

get_real_strength_radio(EvtId, MaxPower) ->
    case planes_data:get_evt(EvtId) of
      #planes_evt_data{ext = DataExt} ->
	  case lists:keyfind(group, 1, DataExt) of
	    {group, GroupId} ->
		case planes_data:get_guard_ext({GroupId, MaxPower}) of
		  NewDataExt when is_list(NewDataExt) ->
		      case lists:keyfind(strength, 1, NewDataExt) of
			{strength, _Radio} -> {1000, 1000};
			{strength, _, {hp_max_per, HpRadio},
			 {atk_per, AtkRadio}} ->
			    {HpRadio, AtkRadio};
			_ -> {1000, 1000}
		      end;
		  _ -> {1000, 1000}
		end;
	    _ -> {1000, 1000}
	  end;
      _ -> {1000, 1000}
    end.

base_ratio({HpRadio, AtkRadio}, Attr) ->
    Attr#attr{atk =
		  util:round(Attr#attr.atk * AtkRadio / 1000),
	      hp_max = util:round(Attr#attr.hp_max * HpRadio / 1000)};
base_ratio(Radio, Attr) ->
    Attr#attr{atk =
		  util:round(Attr#attr.atk * Radio / 1000),
	      hp_max = util:round(Attr#attr.hp_max * Radio / 1000)}.


