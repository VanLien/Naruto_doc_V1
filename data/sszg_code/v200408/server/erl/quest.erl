-file("src/mod/quest/quest.erl", 1).

-module(quest).

-lager_records([{holiday_lanterm_adventure_data,
		 [camp_id, id, f_id, s_id, ref_day, progress, award]},
		{m_lanterm_adventure3,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_adventure2,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_adventure1,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_adventure,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_festival,
		 [ver, all_count, all_num, award_list, camp_id, extra,
		  old_data]},
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
		{pos,
		 [ver, srv_id, map_id, map_pid, map_bid, map_grid_pid,
		  last, hidden, x, y, dir]},
		{pos_history, [map_id, map_bid, srv_id, x, y]},
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
		{condition, [label, op, val, msg]},
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
		{quest_stats, [type, stats, desc]},
		{quest_progress,
		 [id, label, target, param, finish, trigger, target_val,
		  value, msg, ext_data, dyn_ext_data]},
		{quest,
		 [id, name, type, finish, quality, progress, accept_time,
		  end_time, finish_time, round]},
		{m_quest,
		 [ver, quest, acceptable, finished, daily_finished]},
		{quest_data,
		 [id, type, name, phase, can_giveup, lev, max_lev,
		  career, pre_quest, suffix_quest, start_time, end_time,
		  condition, progress, accept_rewards, commit_rewards,
		  commit_loss, commit_type, times, desc, group, layer,
		  dungeon_id, is_auto_finished_gain, auto_accept,
		  weekdays, white_list, black_list, extra, val_from_prev,
		  hide]},
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

-export([login/1, ready/1, set_check_timer/1,
	 time_check/2, lev_up/2, accept/2, force_accept/2,
	 callback_accept/3, callback_accept/4, callback_commit/3,
	 finish/2, commit/2, force_commit/2, giveup/2, flush/2,
	 async_flush/2, zero_flush/1, five_flush/2, load_quest/4,
	 load_progress/5, accept_handle/4, commit_handle/5,
	 commit_no_reward/2, init/0, del_quest/2,
	 apply_del_quest/2, list/1, accept_dungeon/2]).

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

-file("src/mod/quest/quest.erl", 41).

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

-file("src/mod/quest/quest.erl", 42).

-file("inc/quest.hrl", 1).

-record(quest_data,
	{id = 1  :: pos_integer(), type = 1  :: pos_integer(),
	 name = <<>>  :: binary(),
	 phase = 0  :: non_neg_integer(),
	 can_giveup = 0  :: 0..1, lev = 1  :: pos_integer(),
	 max_lev = 0  :: non_neg_integer(), career = 0  :: 0..4,
	 pre_quest  ::
	     undefined | non_neg_integer() | [non_neg_integer()],
	 suffix_quest = 0  :: non_neg_integer(),
	 start_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 end_time = 0  ::
	     tuple() | non_neg_integer() | undefined,
	 condition = []  :: [tuple()],
	 progress = []  :: [tuple()],
	 accept_rewards = []  :: [tuple()],
	 commit_rewards = []  :: [tuple()],
	 commit_loss = []  :: [tuple()],
	 commit_type = 1  :: pos_integer(),
	 times = 1  :: non_neg_integer(), desc = <<>>  :: list(),
	 group = 0, layer = 0, dungeon_id = 0,
	 is_auto_finished_gain = 0, auto_accept = 0  :: 0..1,
	 weekdays = []  :: [pos_integer()],
	 white_list = []  :: list(), black_list = []  :: list(),
	 extra = [], val_from_prev = 0  :: 0 | 1,
	 hide = 0  :: 0 | 1}).

-record(m_quest,
	{ver = 1, quest = []  :: list(),
	 acceptable = []  :: list(), finished = []  :: list(),
	 daily_finished = []}).

-record(quest,
	{id = 1  :: pos_integer(), name = <<>>  :: binary(),
	 type = 1  :: pos_integer(), finish = 0  :: 0..2,
	 quality = 0  :: 0..4, progress = []  :: [tuple()],
	 accept_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 finish_time = 0  :: non_neg_integer(),
	 round = 0  :: non_neg_integer()}).

-record(quest_progress,
	{id = 0  :: non_neg_integer(), label  :: atom(),
	 target = 0  :: non_neg_integer(), param = []  :: list(),
	 finish = 0  :: 0..1, trigger  :: undefined | tuple(),
	 target_val = 1  :: pos_integer(),
	 value = 0  :: non_neg_integer(),
	 msg = <<>>  :: bitstring() | string(),
	 ext_data = []  :: [tuple()],
	 dyn_ext_data = []  :: [tuple()]}).

-record(quest_stats, {type = 1, stats = [], desc = []}).

-file("src/mod/quest/quest.erl", 43).

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

-file("src/mod/quest/quest.erl", 44).

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

-file("src/mod/quest/quest.erl", 45).

-file("inc/condition.hrl", 1).

-record(condition,
	{label  :: atom(),
	 op = eq  ::
	     ue | eq | lt | gt | le | ge | range | include,
	 val  :: term(), msg = <<>>  :: bitstring()}).

-file("src/mod/quest/quest.erl", 46).

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

-file("src/mod/quest/quest.erl", 47).

-file("inc/pos.hrl", 1).

-record(pos_history,
	{map_id = 0  :: non_neg_integer(),
	 map_bid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer()}).

-record(pos,
	{ver = 2, srv_id = <<>>  :: bitstring(),
	 map_id = {0, <<>>}, map_pid = 0, map_bid = 0,
	 map_grid_pid = 0, last, hidden = 0, x = 0, y = 0,
	 dir = 5}).

-file("src/mod/quest/quest.erl", 48).

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

-file("src/mod/quest/quest.erl", 49).

-file("inc/log.hrl", 1).

-file("src/mod/quest/quest.erl", 50).

-file("inc/holiday_lanterm.hrl", 1).

-record(m_lanterm_festival,
	{ver = 1, all_count = []  :: non_neg_integer(),
	 all_num = 0  :: non_neg_integer(),
	 award_list = []  :: list(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure1,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure2,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure3,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(holiday_lanterm_adventure_data,
	{camp_id = 0  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(), f_id = 0, s_id = 0,
	 ref_day = 0, progress = [], award = []}).

-file("src/mod/quest/quest.erl", 51).

-type accept_steps() :: condition | loss | accept |
			fire.

-type commit_steps() :: reward | finish | del_quest |
			flush | fire | special_fire.

-export_type([accept_steps/0, commit_steps/0]).

init() -> #m_quest{}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role) ->
    Role1 = #role{m_quest = #m_quest{quest = Quests}} =
		quest_revise:do(Role),
    {_Tid, Role2} = role_trigger:add(#trigger{label =
						  evt_levup,
					      m = quest, f = lev_up, a = []},
				     Role1),
    {NewQuests, NewRole = #role{m_quest = Mquest}} =
	load_quest(Quests, [], quest, Role2),
    set_check_timer(NewQuests),
    {ok,
     NewRole#role{m_quest =
		      Mquest#m_quest{quest = NewQuests}}}.

-spec ready(#role{}) -> {ok, #role{}}.

ready(Role) ->
    {ok, NRole} = quest_revise:check_finish(Role),
    {ok, flush(NRole, not_push)}.

list(Role = #role{m_quest =
		      #m_quest{quest = Quests}}) ->
    DailyFinL = get_finished(Role, 3),
    Quests ++
      [#quest{id = Id, finish = 2} || Id <- DailyFinL].

reset_check_timer(Quests) ->
    erase(quest_check_timer), set_check_timer(Quests).

-spec set_check_timer(_) -> ok.

set_check_timer([I | T]) ->
    set_check_timer(I), set_check_timer(T);
set_check_timer(#quest{end_time = EndT}) ->
    set_check_timer(EndT);
set_check_timer(T) when is_integer(T) ->
    Now = date:unixtime(),
    case T > Now of
      true ->
	  NextT = min(864000, T - Now),
	  case get(quest_check_timer) of
	    undefined ->
		Ref = erlang:send_after(NextT * 1000, self(),
					{apply_async,
					 {quest, time_check, [T]}}),
		put(quest_check_timer, {T, Ref});
	    {OldT, OldRef} when OldT > T ->
		catch erlang:cancel_timer(OldRef),
		Ref = erlang:send_after(NextT * 1000, self(),
					{apply_async,
					 {quest, time_check, [T]}}),
		put(quest_check_timer, {T, Ref});
	    _ -> skip
	  end;
      _ -> skip
    end;
set_check_timer(_T) -> ok.

time_check(Role = #role{m_quest =
			    #m_quest{quest = Quests}},
	   T) ->
    case get(quest_check_timer) of
      {T, _Ref} ->
	  erase(quest_check_timer),
	  NRole = del_overdue(Quests, date:unixtime(), Role),
	  {ok, flush(NRole, push)};
      _ -> ok
    end.

del_overdue([], _Now, Role) -> Role;
del_overdue([I | T], Now, Role) ->
    NRole = del_overdue(I, Now, Role),
    del_overdue(T, Now, NRole);
del_overdue(Q = #quest{end_time = EndT}, Now, Role)
    when EndT > 0 andalso Now >= EndT ->
    del_quest(Q, Role);
del_overdue(_Q, _Now, Role) -> Role.

-spec lev_up(tuple(), #role{}) -> {ok, #role{}}.

lev_up(Evt, Role) ->
    Role1 = feat:level_up(Evt, Role),
    Role2 = room_feat:level_up(Evt, Role1),
    {ok, flush(Role2, push)}.

-spec auto_accept(Ids, Role) -> {ok, Role} |
				{false, Reason} | false when Ids ::
								 [pos_integer()] |
								 pos_integer(),
							     Role :: #role{},
							     Reason :: string().

auto_accept(Id, Role) when is_integer(Id) ->
    case quest_data:get(Id) of
      QuestData = #quest_data{auto_accept = 1} ->
	  accept_handle([condition, loss, accept, fire], Role,
			QuestData, Id);
      #quest_data{} -> {false, <<>>};
      Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest152, _, {__Levelquest152, __Tracesquest152}}
		when __Levelquest152 band 8 /= 0 orelse
		       __Tracesquest152 /= [] ->
		lager:do_log(error,
			     [{module, quest}, {function, auto_accept},
			      {line, 152}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("任务[~w]在可接列表中，却无法找到该任务的配置数据: ~w",
					   [Id, Reason]),
			     none, 4096, 8, __Levelquest152, __Tracesquest152,
			     lager_event, __Pidquest152);
	    _ -> ok
	  end,
	  {false, Reason}
    end;
auto_accept([], Role) ->
    case erase(accept_quest) of
      Temp when is_list(Temp) ->
	  role:pack_send(Role, 10403, {Temp}), ok;
      _ -> skip
    end,
    {ok, Role};
auto_accept([Id | T], Role) ->
    case auto_accept(Id, Role) of
      {ok, NRole} -> auto_accept(T, NRole);
      {false, _Reason} -> auto_accept(T, Role)
    end.

accept(Role, QuestId) ->
    Steps = [condition, loss, accept, fire],
    accept(Role, QuestId, Steps, []).

-spec accept(#role{}, QuestId :: pos_integer(),
	     Steps :: [], Args :: []) -> {ok, #role{}} |
					 {false, Reason :: binary()}.

accept(Role = #role{m_quest =
			#m_quest{acceptable = Acceptable}},
       QuestId, Steps, Args) ->
    case quest_data:get(QuestId) of
      QuestData = #quest_data{auto_accept = AutoAccept} ->
	  case lists:member(QuestId, Acceptable) of
	    false when AutoAccept =:= 1 -> {false, <<>>};
	    false -> {false, lang:get(<<"此任务不在可接任务列表中"/utf8>>)};
	    true ->
		Result = accept_handle(Steps, Role, QuestData, Args),
		case erase(accept_quest) of
		  Temp when is_list(Temp) ->
		      role:pack_send(Role, 10403, {Temp}), ok;
		  _ -> skip
		end,
		Result
	  end;
      {false, Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest198, _, {__Levelquest198, __Tracesquest198}}
		when __Levelquest198 band 8 /= 0 orelse
		       __Tracesquest198 /= [] ->
		lager:do_log(error,
			     [{module, quest}, {function, accept}, {line, 198},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("任务[~w]在可接列表中，却无法找到该任务的配置数据: ~w",
					   [QuestId, Reason]),
			     none, 4096, 8, __Levelquest198, __Tracesquest198,
			     lager_event, __Pidquest198);
	    _ -> ok
	  end,
	  {false, lang:get(<<"此任务不存在"/utf8>>)}
    end.

callback_accept(Role, QuestId, Steps) ->
    callback_accept(Role, QuestId, Steps, []).

-spec callback_accept(Role, QuestId, Steps,
		      Args) -> ok | {ok, Role} when Role :: #role{},
						    QuestId :: pos_integer(),
						    Steps :: accept_steps(),
						    Args :: list().

callback_accept(Role, QuestId, Steps, Args) ->
    case accept(Role, QuestId, Steps, Args) of
      Rtn = {ok, _NewRole} -> Rtn;
      {false, _Err} -> ok
    end.

-spec force_accept(QuestId :: pos_integer(),
		   #role{}) -> {ok, #role{}} | {false, Reason :: binary()}.

force_accept(QuestId,
	     Role = #role{m_quest =
			      #m_quest{acceptable = Acceptable}}) ->
    case lists:member(QuestId, Acceptable) of
      false -> {false, lang:get(<<"此任务不在可接任务列表中"/utf8>>)};
      true ->
	  case quest_data:get(QuestId) of
	    {false, Reason} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidquest227, _, {__Levelquest227, __Tracesquest227}}
		      when __Levelquest227 band 8 /= 0 orelse
			     __Tracesquest227 /= [] ->
		      lager:do_log(error,
				   [{module, quest}, {function, force_accept},
				    {line, 227}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("任务[~w]在可接列表中，却无法找到该任务的配置数据: ~w",
						 [QuestId, Reason]),
				   none, 4096, 8, __Levelquest227,
				   __Tracesquest227, lager_event,
				   __Pidquest227);
		  _ -> ok
		end,
		{false, lang:get(<<"此任务不存在"/utf8>>)};
	    QuestData ->
		accept_handle([accept, fire], Role, QuestData, QuestId)
	  end
    end.

-spec accept_handle([atom()], #role{}, #quest_data{},
		    Args :: list() | term()) -> {ok, #role{}} |
						{false, Reason :: binary()}.

accept_handle([], Role, _QuestData, _Args) ->
    {ok, Role};
accept_handle([Label | T], Role, QuestData, Args) ->
    case accept_handle(Label, Role, QuestData, Args) of
      {ok, NRole} -> accept_handle(T, NRole, QuestData, Args);
      {ok, NRole, NewQuestData} ->
	  accept_handle(T, NRole, NewQuestData, Args);
      {false, Reason} -> {false, Reason}
    end;
accept_handle(condition, Role,
	      #quest_data{condition = Cond}, _Args) ->
    case role_cond:check(Cond, Role) of
      {false, #condition{msg = <<>>}} ->
	  {false, lang:get(<<"不满足接受任务条件"/utf8>>)};
      {false, #condition{msg = Msg}} -> {false, Msg};
      true -> {ok, Role}
    end;
accept_handle(loss, Role,
	      #quest_data{accept_rewards = Rewards}, _Args) ->
    case role_gain:do(Role, Rewards) of
      {ok, NRole} -> {ok, NRole};
      {false, #loss{msg = Msg}} -> {false, Msg};
      _Err -> {false, lang:get(<<"扣除道具失败，无法接受任务"/utf8>>)}
    end;
accept_handle(accept, Role = #role{},
	      QuestData = #quest_data{id = QuestId,
				      progress = Progress, pre_quest = PreQ,
				      val_from_prev = ValFromPrev},
	      Args) ->
    Progress0 = get_val_from_prev(ValFromPrev, Progress,
				  quest_data:get(PreQ)),
    case dispatch_accept(QuestData#quest_data{progress =
						  Progress0},
			 Role, Args)
	of
      {NewQuest = #quest{}, NewRole = #role{}} ->
	  case get(accept_quest) of
	    L when is_list(L) -> put(accept_quest, [NewQuest | L]);
	    _ -> put(accept_quest, [NewQuest])
	  end,
	  log:save(task, {NewRole, 0, QuestId}),
	  {ok, NewRole};
      {false, Msg} -> {false, Msg};
      _ -> {false, lang:get(<<"接受任务失败"/utf8>>)}
    end;
accept_handle(fire, Role, #quest_data{id = QuestId},
	      _Args) ->
    {ok,
     role_trigger:fire(#evt_accept_quest{id = QuestId},
		       Role)};
accept_handle(_Label, _Role, _QuestData, _Args) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidquest277, _, {__Levelquest277, __Tracesquest277}}
	  when __Levelquest277 band 8 /= 0 orelse
		 __Tracesquest277 /= [] ->
	  lager:do_log(error,
		       [{module, quest}, {function, accept_handle},
			{line, 277}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("没有相关处理标签:~w", [_Label]), none, 4096, 8,
		       __Levelquest277, __Tracesquest277, lager_event,
		       __Pidquest277);
      _ -> ok
    end,
    {false, lang:get(<<"接受任务失败"/utf8>>)}.

-spec finish(QuestId :: pos_integer(), #role{}) -> {ok,
						    #role{}} |
						   {false, Reason :: binary()}.

finish(QuestId,
       Role = #role{m_quest =
			Mquest = #m_quest{quest = Quests}}) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
      false -> {false, lang:get(<<"你并未接受此任务，无法完成"/utf8>>)};
      Quest = #quest{finish = 0, progress = Progress} ->
	  NewQuest = Quest#quest{finish = 1,
				 progress =
				     [Prog#quest_progress{finish = 1,
							  value = TarVal}
				      || Prog = #quest_progress{target_val =
								    TarVal}
					     <- Progress]},
	  NewQuests = lists:keyreplace(QuestId, #quest.id, Quests,
				       NewQuest),
	  NRole = Role#role{m_quest =
				Mquest#m_quest{quest = NewQuests}},
	  role:pack_send(NRole, 10409, {[NewQuest]}),
	  {ok,
	   role_trigger:fire(#evt_finish_quest{id = QuestId},
			     NRole)};
      _ -> {false, lang:get(<<"此任务已完成"/utf8>>)}
    end.

-spec commit(Role, QuestId, Steps, Args) -> {ok,
					     NewRole} |
					    {false, Reason} when Role ::
								     #role{},
								 NewRole ::
								     #role{},
								 QuestId ::
								     pos_integer(),
								 Steps ::
								     commit_steps(),
								 Args :: [],
								 Reason ::
								     binary().

commit(Role = #role{m_quest = #m_quest{quest = Quests}},
       QuestId, Steps, Args) ->
    case quest_data:get(QuestId) of
      QuestData = #quest_data{} ->
	  case lists:keyfind(QuestId, #quest.id, Quests) of
	    false -> {false, lang:get(<<"你并未接受此任务，无法提交"/utf8>>)};
	    #quest{finish = 0} ->
		{false, lang:get(<<"此任务未完成，无法提交"/utf8>>)};
	    Quest = #quest{} ->
		commit_handle(Steps, Role, Quest, QuestData, Args)
	  end;
      _False ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest315, _, {__Levelquest315, __Tracesquest315}}
		when __Levelquest315 band 8 /= 0 orelse
		       __Tracesquest315 /= [] ->
		lager:do_log(error,
			     [{module, quest}, {function, commit}, {line, 315},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("任务[~w]无法找到配置数据: ~w",
					   [QuestId, _False]),
			     none, 4096, 8, __Levelquest315, __Tracesquest315,
			     lager_event, __Pidquest315);
	    _ -> ok
	  end,
	  {false, lang:get(<<"此任务不存在"/utf8>>)}
    end.

commit(Role = #role{}, QuestId) ->
    Steps = [reward, finish, del_quest, fire, special_fire,
	     flush],
    commit(Role, QuestId, Steps, []).

callback_commit(Role = #role{}, QuestId, Steps) ->
    callback_commit(Role, QuestId, Steps, []).

callback_commit(Role = #role{}, QuestId, Steps, Args) ->
    case commit(Role, QuestId, Steps, Args) of
      Rtn = {ok, _NewRole} -> Rtn;
      {false, _Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest332, _, {__Levelquest332, __Tracesquest332}}
		when __Levelquest332 band 8 /= 0 orelse
		       __Tracesquest332 /= [] ->
		lager:do_log(error,
			     [{module, quest}, {function, callback_commit},
			      {line, 332}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]回调提交任务[QuestId:~w]失败[~w]",
					   [Role#role.name, QuestId, _Err]),
			     none, 4096, 8, __Levelquest332, __Tracesquest332,
			     lager_event, __Pidquest332);
	    _ -> ok
	  end,
	  ok
    end.

-spec force_commit(QuestId :: pos_integer(),
		   #role{}) -> {ok, #role{}} | {false, Reason :: binary()}.

force_commit(QuestId,
	     Role = #role{m_quest = #m_quest{}}) ->
    Steps = [reward, finish, del_quest, flush, fire,
	     special_fire],
    commit(Steps, Role, QuestId, []).

-spec commit_no_reward(QuestId :: pos_integer(),
		       #role{}) -> {ok, #role{}} | {false, Reason :: binary()}.

commit_no_reward({R, P, Z}, QuestId) ->
    role:apply(async, {R, P, Z},
	       {quest, commit_no_reward, [QuestId]});
commit_no_reward(Role = #role{}, QuestId) ->
    Steps = [finish, del_quest, flush, fire, special_fire],
    commit(Steps, Role, QuestId, []).

-spec giveup(QuestId :: pos_integer(), #role{}) -> {ok,
						    #role{}} |
						   {false, Reason :: binary()}.

giveup(Role = #role{m_quest = #m_quest{quest = Quests}},
       QuestId) ->
    case lists:keyfind(QuestId, #quest.id, Quests) of
      false -> {false, lang:get(<<"你并未接受此任务，无法放弃"/utf8>>)};
      Quest ->
	  case quest_data:get(QuestId) of
	    QuestData = #quest_data{can_giveup = 1} ->
		commit_handle([finish, del_quest, flush, giveup_fire],
			      Role, Quest, QuestData, []);
	    _ -> {false, lang:get(<<"此任务不能放弃"/utf8>>)}
	  end
    end.

-spec commit_handle([atom()], #role{}, #quest{},
		    #quest_data{}, Args :: []) -> {ok, #role{}} |
						  {false, Reason :: binary()}.

commit_handle([], Role, _Quest, _QuestData, _Args) ->
    {ok, Role};
commit_handle([Label | T], Role, Quest, QuestData,
	      Args) ->
    case commit_handle(Label, Role, Quest, QuestData, Args)
	of
      {ok, NRole} ->
	  commit_handle(T, NRole, Quest, QuestData, Args);
      {false, Reason} -> {false, Reason}
    end;
commit_handle(reward, Role, _Quest,
	      #quest_data{id = QuestId, commit_rewards = RewardsCfg},
	      _Args) ->
    Rewards = format:val_to_gain(RewardsCfg, make_quest),
    case role_gain:do_notice(Role, Rewards,
			     #gain_loss_opts{type = 1})
	of
      {ok, NRole} ->
	  log:log_gain(Rewards, Role, NRole, <<"提交任务"/utf8>>,
		       util:fbin("提交任务:~w", [QuestId])),
	  log:save(task, {NRole, 1, QuestId}),
	  {ok, NRole};
      {false, #gain{msg = Msg}} -> {false, Msg};
      {false, #loss{msg = Msg}} -> {false, Msg};
      {false, Msg} -> {false, Msg};
      False ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidquest390, _, {__Levelquest390, __Tracesquest390}}
		when __Levelquest390 band 8 /= 0 orelse
		       __Tracesquest390 /= [] ->
		lager:do_log(error,
			     [{module, quest}, {function, commit_handle},
			      {line, 390}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]提交任务[~w]错误[~w]",
					   [Role#role.name, QuestId, False]),
			     none, 4096, 8, __Levelquest390, __Tracesquest390,
			     lager_event, __Pidquest390);
	    _ -> ok
	  end,
	  {false, ""}
    end;
commit_handle(finish, Role, _Quest, QuestData, Args) ->
    NewRole = commit_finish(Role, QuestData, Args),
    {ok, NewRole};
commit_handle(del_quest, Role, Quest, _QuestData,
	      _Args) ->
    {ok, del_quest(Quest, Role)};
commit_handle(flush, Role, _Quest, _QuestData, _Args) ->
    {ok, flush(Role, push)};
commit_handle(fire, Role,
	      #quest{id = QuestId, type = Type}, _QuestData, _Args) ->
    {ok,
     role_trigger:fire(#evt_commit_quest{id = QuestId,
					 type = Type},
		       Role)};
commit_handle(special_fire, Role, #quest{},
	      #quest_data{}, _Args) ->
    {ok, Role};
commit_handle(giveup_fire, Role, #quest{id = QuestId},
	      _QuestData, _Args) ->
    NRole = role_trigger:fire(#evt_giveup_quest{id =
						    QuestId},
			      Role),
    log:save(task, {NRole, 2, QuestId}),
    {ok, NRole};
commit_handle(Label, Role, _Quest, _QuestData, _Args) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidquest411, _, {__Levelquest411, __Tracesquest411}}
	  when __Levelquest411 band 8 /= 0 orelse
		 __Tracesquest411 /= [] ->
	  lager:do_log(error,
		       [{module, quest}, {function, commit_handle},
			{line, 411}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]没有相关处理标签[Label:~w]",
				     [Role#role.name, Label]),
		       none, 4096, 8, __Levelquest411, __Tracesquest411,
		       lager_event, __Pidquest411);
      _ -> ok
    end,
    {false, lang:get(<<"处理任务失败"/utf8>>)}.

-spec zero_flush(#role{}) -> #role{}.

zero_flush(Role = #role{m_quest =
			    Mquest = #m_quest{quest = Quests},
			pid = Pid}) ->
    NewQuests = do_zero_flush(Quests, []),
    NRole = Role#role{m_quest =
			  Mquest#m_quest{quest = NewQuests}},
    role:apply(async, Pid,
	       {quest, async_flush, [force_push]}),
    NRole.

do_zero_flush([], Quests) -> lists:reverse(Quests);
do_zero_flush([Q | T], Quests) ->
    do_zero_flush(T, [Q | Quests]).

-spec five_flush(#role{}, Flag :: term()) -> #role{}.

five_flush(Role = #role{pid = Pid}, Flag) ->
    NewRole = five_flush_daily(Role, Flag),
    role:apply(async, Pid,
	       {quest, async_flush, [force_push]}),
    NewRole.

async_flush(Role = #role{}, PushOpts) ->
    NewRole = flush(Role, PushOpts), {ok, NewRole};
async_flush(_Role, _PushOpts) -> ok.

-spec flush(#role{},
	    not_push | push | force_push) -> #role{}.

flush(Role = #role{}, not_push) ->
    AcceptRole = #role{m_quest =
			   #m_quest{acceptable = NewAcceptable}} =
		     quest_filter:accept_list(Role),
    case auto_accept(NewAcceptable, AcceptRole) of
      false -> AcceptRole;
      {ok, NewRole} -> NewRole;
      {false, _Reason} -> AcceptRole
    end;
flush(Role = #role{}, force_push) ->
    AcceptRole = #role{m_quest =
			   #m_quest{acceptable = NewAcceptable}} =
		     quest_filter:accept_list(Role),
    case auto_accept(NewAcceptable, AcceptRole) of
      false -> AcceptRole;
      {ok, NewRole} -> NewRole;
      {false, _Reason} -> AcceptRole
    end;
flush(Role = #role{m_quest =
		       #m_quest{acceptable = _OldAcceptable}},
      push) ->
    AcceptRole = #role{m_quest =
			   #m_quest{acceptable = NewAcceptable}} =
		     quest_filter:accept_list(Role),
    case auto_accept(NewAcceptable, AcceptRole) of
      false -> AcceptRole;
      {ok, NewRole} -> NewRole;
      {false, _Reason} -> AcceptRole
    end.

-spec load_quest([#quest{}], [#quest{}],
		 Label :: quest | feat | atom(), #role{}) -> {[#quest{}],
							      #role{}}.

load_quest([], Quests, _Label, Role) -> {Quests, Role};
load_quest([Q = #quest{finish = 1, id = Qid,
		       progress = Progress}
	    | T],
	   Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress, Label,
					   Qid, [], Role),
    case [Tmp
	  || Tmp = #quest_progress{finish = 0} <- NewProgress]
	of
      [] ->
	  load_quest(T,
		     [Q#quest{progress = NewProgress} | Quests], Label,
		     NewRole);
      _ ->
	  load_quest(T,
		     [Q#quest{progress = NewProgress, finish = 0} | Quests],
		     Label, NewRole)
    end;
load_quest([Q = #quest{id = Qid, progress = Progress}
	    | T],
	   Quests, Label, Role) ->
    {NewProgress, NewRole} = load_progress(Progress, Label,
					   Qid, [], Role),
    load_quest(T,
	       [Q#quest{progress = NewProgress} | Quests], Label,
	       NewRole).

-spec load_progress(Progress, TypeLabel, QuestData,
		    NewProgress, NewRole) -> {NewProgress,
					      NewRole} when Progress ::
								[#quest_progress{}],
							    NewProgress ::
								[#quest_progress{}],
							    TypeLabel :: quest |
									 atom(),
							    QuestData ::
								pos_integer() |
								#quest_data{},
							    NewProgress ::
								#role{}.

load_progress([], _TypeLabel, _Qid, [], Role) ->
    {[], Role};
load_progress([], _TypeLabel, _Qid, Progress, Role) ->
    {lists:reverse(Progress), Role};
load_progress([P = #quest_progress{finish = 0, id = Id,
				   label = Label, target = Target,
				   param = Param}
	       | T],
	      TypeLabel, Qid, Progress, Role) ->
    {Tid, NewRole} = role_trigger:add(#trigger{label =
						   Label,
					       m = quest_progress, f = event,
					       a =
						   [TypeLabel, Qid, Id, Target,
						    Param]},
				      Role),
    load_progress(T, TypeLabel, Qid,
		  [P#quest_progress{trigger = Tid} | Progress], NewRole);
load_progress([P | T], TypeLabel, Qid, Progress,
	      Role) ->
    NewRole = quest_progress:monitor_quest_prog(TypeLabel,
						P, Qid, Role),
    load_progress(T, TypeLabel, Qid,
		  [P#quest_progress{trigger = undefined} | Progress],
		  NewRole).

apply_del_quest(Role, []) -> {ok, Role};
apply_del_quest(Role, [Id | Rest]) ->
    NewRole = del_quest(Id, Role),
    apply_del_quest(NewRole, Rest).

-spec accept_dungeon(#role{},
		     DunId :: integer()) -> #role{}.

accept_dungeon(Role, DunId) ->
    case quest_data:dungeon_quest(DunId) of
      List = [_ | _] -> do_accept_dungeon(Role, List);
      _ -> Role
    end.

do_accept_dungeon(Role, []) ->
    case erase(accept_quest) of
      Temp when is_list(Temp) ->
	  role:pack_send(Role, 10403, {Temp}), ok;
      _ -> skip
    end,
    Role;
do_accept_dungeon(Role, [QuestId | Rest]) ->
    NewRole = case quest_data:get(QuestId) of
		QuestData = #quest_data{} ->
		    case accept_handle([condition, accept, fire], Role,
				       QuestData, QuestId)
			of
		      {ok, NRole} -> NRole;
		      {false, Msg} ->
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
			    {__Pidquest538, _,
			     {__Levelquest538, __Tracesquest538}}
				when __Levelquest538 band 8 /= 0 orelse
				       __Tracesquest538 /= [] ->
				lager:do_log(error,
					     [{module, quest},
					      {function, do_accept_dungeon},
					      {line, 538},
					      {pid, pid_to_list(self())},
					      {node, node()}
					      | lager:md()],
					     io_lib:format("[~ts]接受通关剧情副本开启的任务失败[QuestId:~w]:~w",
							   [Role#role.name,
							    QuestId, Msg]),
					     none, 4096, 8, __Levelquest538,
					     __Tracesquest538, lager_event,
					     __Pidquest538);
			    _ -> ok
			  end,
			  Role
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
		      {__Pidquest542, _, {__Levelquest542, __Tracesquest542}}
			  when __Levelquest542 band 8 /= 0 orelse
				 __Tracesquest542 /= [] ->
			  lager:do_log(error,
				       [{module, quest},
					{function, do_accept_dungeon},
					{line, 542}, {pid, pid_to_list(self())},
					{node, node()}
					| lager:md()],
				       io_lib:format("[~ts]接受通关剧情副本开启的任务失败，没有任务数据[QuestId:~w]",
						     [Role#role.name, QuestId]),
				       none, 4096, 8, __Levelquest542,
				       __Tracesquest542, lager_event,
				       __Pidquest542);
		      _ -> ok
		    end,
		    Role
	      end,
    do_accept_dungeon(NewRole, Rest).

-spec del_quest(integer() | #quest{},
		#role{}) -> #role{}.

del_quest(Id,
	  Role = #role{m_quest = #m_quest{quest = Quests}})
    when is_integer(Id) ->
    case lists:keyfind(Id, #quest.id, Quests) of
      false -> Role;
      Quest -> del_quest(Quest, Role)
    end;
del_quest(Quest = #quest{id = Id, progress = Progress},
	  Role = #role{m_quest =
			   Mquest = #m_quest{quest = Quests}}) ->
    Role1 = drama_quest:remove_task_unit(Role, Progress),
    Role2 = drama_quest:remove_extra_unit(Role1, Quest),
    Tids = [Tid
	    || #quest_progress{trigger = Tid, finish = 0}
		   <- Progress,
	       is_tuple(Tid)],
    NewRole = role_trigger:del(Tids, Role2),
    push_del_quest(Role, Quest),
    NewQuests = lists:keydelete(Id, #quest.id, Quests),
    reset_check_timer(NewQuests),
    NewRole#role{m_quest =
		     Mquest#m_quest{quest = NewQuests}}.

dispatch_accept(QuestData = #quest_data{id = QuestId,
					type = Type, progress = Progress,
					start_time = ST, end_time = ET,
					extra = Extra},
		Role = #role{m_quest =
				 Mquest = #m_quest{quest = Quests,
						   acceptable = Acceptable}},
		_Args) ->
    Progress0 = quest_prog_init:do(Role, Progress, QuestId),
    {NewProgress, LoadRole} = load_progress(Progress0,
					    quest, QuestId, [], Role),
    ProgRole = drama_quest:create_task_unit(LoadRole,
					    QuestId, NewProgress),
    UnitRole = drama_quest:create_extra_unit(Extra,
					     QuestData, ProgRole),
    Finish = case [false
		   || #quest_progress{finish = 0} <- NewProgress]
		 of
	       [] -> 1;
	       _ -> 0
	     end,
    {_, EndT} = date:parse_time(ST, ET),
    NQuest = #quest{id = QuestId, finish = Finish,
		    type = Type, progress = NewProgress, end_time = EndT},
    set_check_timer(EndT),
    NewQuests = [NQuest | Quests],
    NewAcceptable = lists:delete(QuestId, Acceptable),
    NewRole = UnitRole#role{m_quest =
				Mquest#m_quest{quest = NewQuests,
					       acceptable = NewAcceptable}},
    {NQuest, NewRole}.

commit_finish(Role = #role{m_quest =
			       Mquest = #m_quest{finished = Finished}},
	      #quest_data{type = 1, id = QuestId}, _Args) ->
    Role#role{m_quest =
		  Mquest#m_quest{finished = [QuestId | Finished]}};
commit_finish(Role = #role{m_quest =
			       Mquest = #m_quest{finished = Finished}},
	      #quest_data{type = 2, id = QuestId}, _Args) ->
    Role#role{m_quest =
		  Mquest#m_quest{finished = [QuestId | Finished]}};
commit_finish(Role = #role{m_quest =
			       Mquest = #m_quest{daily_finished = DayFinished}},
	      #quest_data{type = 3, id = QuestId}, _Args) ->
    Role#role{m_quest =
		  Mquest#m_quest{daily_finished =
				     [QuestId | DayFinished]}};
commit_finish(Role = #role{}, _QuestData, _Args) ->
    Role.

five_flush_daily(Role = #role{m_quest =
				  MQuest = #m_quest{quest = Quests}},
		 login) ->
    NewQuests = [Q
		 || Q = #quest{type = Type} <- Quests, Type =/= 3],
    Role#role{m_quest =
		  MQuest#m_quest{daily_finished = [], quest = NewQuests}};
five_flush_daily(Role = #role{m_quest =
				  #m_quest{quest = Quests}},
		 _Flag) ->
    DelDailyL = [Q || Q = #quest{type = 3} <- Quests],
    {ok, DelRole = #role{m_quest = MQuest}} =
	apply_del_quest(Role, DelDailyL),
    DelRole#role{m_quest =
		     MQuest#m_quest{daily_finished = []}}.

get_finished(#role{m_quest =
		       #m_quest{daily_finished = DayFinished,
				finished = Finished}},
	     0) ->
    DayFinished ++ Finished;
get_finished(#role{m_quest =
		       #m_quest{finished = Finished, quest = Quest}},
	     Type = 1) ->
    get_group_finish(Quest, Finished, Type, []);
get_finished(#role{m_quest =
		       #m_quest{daily_finished = DayFinished}},
	     3) ->
    DayFinished;
get_finished(_Role, _Type) -> [].

get_group_finish([], _Finished, _Type, Acc) -> Acc;
get_group_finish([#quest{type = Type, id = Id} | Rest],
		 Finished, Type, Acc) ->
    Layer = get_type_layer(Type),
    NewAcc = case quest_data:get(Id) of
	       #quest_data{layer = Layer, group = Group} ->
		   GroupL = quest_data:group(Group),
		   L = [QId || QId <- GroupL, lists:member(QId, Finished)],
		   L ++ Acc;
	       _ -> Acc
	     end,
    get_group_finish(Rest, Finished, Type, NewAcc);
get_group_finish([_Q | Rest], Finished, Type, Acc) ->
    get_group_finish(Rest, Finished, Type, Acc).

get_val_from_prev(1, Progs,
		  #quest_data{progress = PreProgs})
    when length(Progs) =:= length(PreProgs) ->
    do_get_val_from_prev(Progs, PreProgs, []);
get_val_from_prev(_ValFromPrev, Progs, _) -> Progs.

do_get_val_from_prev([], [], Progs) ->
    lists:reverse(Progs);
do_get_val_from_prev([Prog | T1],
		     [#quest_progress{target_val = TarVal} | T2], Progs) ->
    do_get_val_from_prev(T1, T2,
			 [Prog#quest_progress{value = TarVal} | Progs]).

push_del_quest(_Role, #quest{type = 3}) -> ok;
push_del_quest(Role = #role{m_quest =
				#m_quest{finished = Finished}},
	       #quest{id = Id}) ->
    case quest_data:get(Id) of
      #quest_data{layer = 2} -> ok;
      #quest_data{layer = 1, group = Group} ->
	  GroupL = quest_data:group(Group),
	  DelIds = [QId
		    || QId <- GroupL, lists:member(QId, Finished)],
	  role:pack_send(Role, 10408, {DelIds}),
	  ok;
      _ -> role:pack_send(Role, 10408, {[Id]}), ok
    end,
    ok.

get_type_layer(1) -> 1;
get_type_layer(Type) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidquest666, _, {__Levelquest666, __Tracesquest666}}
	  when __Levelquest666 band 8 /= 0 orelse
		 __Tracesquest666 /= [] ->
	  lager:do_log(error,
		       [{module, quest}, {function, get_type_layer},
			{line, 666}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未处理的类型层级Type:~w", [Type]), none, 4096, 8,
		       __Levelquest666, __Tracesquest666, lager_event,
		       __Pidquest666);
      _ -> ok
    end,
    0.


