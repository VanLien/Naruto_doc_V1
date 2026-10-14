-file("data/adventure_mine_zone.erl", 1).

-file("src/mod/data/adventure_mine_zone.erl", 1).

-module(adventure_mine_zone).

-lager_records([{r_evt_partner_holy_eqpt, [cache]},
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
		  p_eqm, p_home]},
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
		{adventure_mine_owned_data, [id, pos]},
		{adventure_mine_owned, [id, list]},
		{adventure_mine_log,
		 [replay_id, floor, room_id, rid, name, lev, mine_id,
		  face, avatar_id, power, type, ret, loss, time, expire]},
		{adventure_mine_role_log, [id, logs]},
		{adventure_mine_group, [group_id, num, power, list]},
		{adventure_mine_role,
		 [id, max_power, login_time, group_id]},
		{adventure_mine_fight_lock,
		 [id, is_fight, fight_rid, fight_pid]},
		{adventure_mine_pos,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  set_skill, attr, ext]},
		{adventure_mine_hook,
		 [id, role_id, mine_id, plunder_count, last_hook_time,
		  acc_hook_items, acc_hook_time, occupy_time,
		  primary_count, senior_count, log]},
		{adventure_mine_group_hook, [group_id, list]},
		{adventure_mine_hole,
		 [room_id, mine_id, role_id, name, lev, face, last_fight,
		  occupy_time, defense, hallows_id, power, formation_type,
		  robot_id, cool_time, last_replay_id]},
		{adventure_mine_floor, [id, list]},
		{state, [group_id]}]).

-behaviour(gen_server).

-export([call_apply/2, apply/2]).

-export([info/2, cast/2, call/2, start_link/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {group_id = 0}).

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

-file("src/mod/data/adventure_mine_zone.erl", 13).

-file("inc/adventure_mine.hrl", 1).

-record(adventure_mine_floor, {id = {0, 0}, list = []}).

-record(adventure_mine_hole,
	{room_id = 0, mine_id = 0, role_id = {0, <<>>},
	 name = <<>>, lev = 0, face = 0, last_fight = {0, <<>>},
	 occupy_time = 0, defense = [], hallows_id = 0,
	 power = 0, formation_type = 1, robot_id = 0,
	 cool_time = 0, last_replay_id = 0}).

-record(adventure_mine_group_hook,
	{group_id = 0, list = []}).

-record(adventure_mine_hook,
	{id = {0, 0}, role_id = {0, <<>>}, mine_id = 0,
	 plunder_count = 0, last_hook_time = 0,
	 acc_hook_items = [], acc_hook_time = 0, occupy_time = 0,
	 primary_count = 0, senior_count = 0, log = []}).

-record(adventure_mine_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0, set_skill = [],
	 attr, ext = []}).

-record(adventure_mine_fight_lock,
	{id = {0, 0, 0}, is_fight = 0, fight_rid = {0, <<>>},
	 fight_pid = 0}).

-record(adventure_mine_role,
	{id = {0, <<>>}, max_power = 0, login_time = 0,
	 group_id = 0}).

-record(adventure_mine_group,
	{group_id = 0, num = 0, power = 0, list = []}).

-record(adventure_mine_role_log,
	{id = {0, <<>>}, logs = []}).

-record(adventure_mine_log,
	{replay_id = 0, floor = 0, room_id = 0, rid = {0, <<>>},
	 name = <<>>, lev = 0, mine_id = 0, face = 0,
	 avatar_id = 0, power = 0, type = 1, ret = 1, loss = [],
	 time = 0, expire = 0}).

-record(adventure_mine_owned,
	{id = {0, <<>>}, list = []}).

-record(adventure_mine_owned_data,
	{id = {0, 0}, pos = []}).

-file("src/mod/data/adventure_mine_zone.erl", 14).

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

-file("src/mod/data/adventure_mine_zone.erl", 15).

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

-file("src/mod/data/adventure_mine_zone.erl", 16).

-file("inc/log.hrl", 1).

-file("src/mod/data/adventure_mine_zone.erl", 17).

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

-file("src/mod/data/adventure_mine_zone.erl", 18).

call_apply(Pid, {M, F, A}) ->
    call(Pid, {apply, M, F, A}).

apply(Pid, {M, F, A}) -> info(Pid, {apply, M, F, A}).

info(undefined, _Info) -> skip;
info(Pid, Info) -> Pid ! Info.

cast(Pid, Info) -> gen_server:cast(Pid, Info).

call(undefined, _Info) ->
    {false,
     lang:get(<<"Hiện đang được tập hợp lại"/utf8>>)};
call(Pid, Info) ->
    case catch gen_server:call(Pid, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_zone38, _,
	     {__Leveladventure_mine_zone38,
	      __Tracesadventure_mine_zone38}}
		when __Leveladventure_mine_zone38 band 8 /= 0 orelse
		       __Tracesadventure_mine_zone38 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine_zone}, {function, call},
			      {line, 38}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [Pid, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Leveladventure_mine_zone38,
			     __Tracesadventure_mine_zone38, lager_event,
			     __Pidadventure_mine_zone38);
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

start_link(GroupId) ->
    LocalName =
	list_to_atom(lists:concat(["adventure_mine_zone_",
				   GroupId])),
    gen_server:start_link({local, LocalName},
			  adventure_mine_zone, [GroupId], []).

init([GroupId]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_zone45, _,
       {__Leveladventure_mine_zone45,
	__Tracesadventure_mine_zone45}}
	  when __Leveladventure_mine_zone45 band 64 /= 0 orelse
		 __Tracesadventure_mine_zone45 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_zone}, {function, init},
			{line, 45}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [adventure_mine_zone]),
		       none, 4096, 64, __Leveladventure_mine_zone45,
		       __Tracesadventure_mine_zone45, lager_event,
		       __Pidadventure_mine_zone45);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    State = #state{group_id = GroupId},
    ets:insert(adventure_mine_zone, {GroupId, self()}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_zone50, _,
       {__Leveladventure_mine_zone50,
	__Tracesadventure_mine_zone50}}
	  when __Leveladventure_mine_zone50 band 64 /= 0 orelse
		 __Tracesadventure_mine_zone50 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_zone}, {function, init},
			{line, 50}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]组[~w] 启动完成",
				     [adventure_mine_zone, GroupId]),
		       none, 4096, 64, __Leveladventure_mine_zone50,
		       __Tracesadventure_mine_zone50, lager_event,
		       __Pidadventure_mine_zone50);
      _ -> ok
    end,
    {ok, State}.

handle_call(Request, From, State) ->
    case catch do_handle_call(Request, From, State) of
      {reply, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_zone58, _,
	     {__Leveladventure_mine_zone58,
	      __Tracesadventure_mine_zone58}}
		when __Leveladventure_mine_zone58 band 8 /= 0 orelse
		       __Tracesadventure_mine_zone58 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine_zone},
			      {function, handle_call}, {line, 58},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Leveladventure_mine_zone58,
			     __Tracesadventure_mine_zone58, lager_event,
			     __Pidadventure_mine_zone58);
	    _ -> ok
	  end,
	  {reply, {false, lang:get(<<"Lỗi thực thi"/utf8>>)},
	   State}
    end.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({stop, Reason},
	    State = #state{group_id = GroupId}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_zone66, _,
       {__Leveladventure_mine_zone66,
	__Tracesadventure_mine_zone66}}
	  when __Leveladventure_mine_zone66 band 64 /= 0 orelse
		 __Tracesadventure_mine_zone66 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_zone}, {function, handle_info},
			{line, 66}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("矿战接收到关闭信息:~w ~w", [Reason, GroupId]),
		       none, 4096, 64, __Leveladventure_mine_zone66,
		       __Tracesadventure_mine_zone66, lager_event,
		       __Pidadventure_mine_zone66);
      _ -> ok
    end,
    {stop, Reason, State};
handle_info(Info, State) ->
    case catch do_handle_info(Info, State) of
      {noreply, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_zone74, _,
	     {__Leveladventure_mine_zone74,
	      __Tracesadventure_mine_zone74}}
		when __Leveladventure_mine_zone74 band 8 /= 0 orelse
		       __Tracesadventure_mine_zone74 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine_zone},
			      {function, handle_info}, {line, 74},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Leveladventure_mine_zone74,
			     __Tracesadventure_mine_zone74, lager_event,
			     __Pidadventure_mine_zone74);
	    _ -> ok
	  end,
	  {noreply, State}
    end.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_zone79, _,
       {__Leveladventure_mine_zone79,
	__Tracesadventure_mine_zone79}}
	  when __Leveladventure_mine_zone79 band 64 /= 0 orelse
		 __Tracesadventure_mine_zone79 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_zone}, {function, terminate},
			{line, 79}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Leveladventure_mine_zone79,
		       __Tracesadventure_mine_zone79, lager_event,
		       __Pidadventure_mine_zone79);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_handle_call({apply, M, F, A}, _From, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_zone91, _,
	     {__Leveladventure_mine_zone91,
	      __Tracesadventure_mine_zone91}}
		when __Leveladventure_mine_zone91 band 8 /= 0 orelse
		       __Tracesadventure_mine_zone91 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine_zone},
			      {function, do_handle_call}, {line, 91},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Leveladventure_mine_zone91,
			     __Tracesadventure_mine_zone91, lager_event,
			     __Pidadventure_mine_zone91);
	    _ -> ok
	  end,
	  {reply, {false, lang:get(<<"lỗi thực thi"/utf8>>)},
	   State}
    end;
do_handle_call({can_combat, RoleId, Floor, RoomId},
	       _From, State = #state{group_id = GroupId}) ->
    Now = date:unixtime(),
    Lock = #adventure_mine_fight_lock{is_fight = IsFight} =
	       adventure_mine_lib:get_lock(GroupId, Floor, RoomId),
    Reply = case
	      adventure_mine_lib:get_adventure_mine_floor(GroupId,
							  Floor)
		of
	      {ok, #adventure_mine_floor{list = List}} ->
		  case lists:keyfind(RoomId, #adventure_mine_hole.room_id,
				     List)
		      of
		    _ when IsFight == 1 ->
			{false,
			 lang:get(<<"Mạch khoáng hiện nay đang bị thử thách"/utf8>>)};
		    #adventure_mine_hole{role_id = RoleId} ->
			{false, lang:get(<<"Đã chiếm mỏ rồi"/utf8>>)};
		    #adventure_mine_hole{cool_time = CoolTime}
			when CoolTime >= Now ->
			Min = max((CoolTime - Now) div 60, 1),
			{false,
			 util:fbin(lang:get(<<"Mỏ này chưa thể bị tấn công.，~wHãy quay "
					      "lại sau vài phút！"/utf8>>),
				   [Min])};
		    MineHole = #adventure_mine_hole{} ->
			NewLock = Lock#adventure_mine_fight_lock{is_fight = 1,
								 fight_rid =
								     RoleId},
			ets:insert(adventure_mine_fight_lock, NewLock),
			{ok, MineHole};
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
			  {__Pidadventure_mine_zone113, _,
			   {__Leveladventure_mine_zone113,
			    __Tracesadventure_mine_zone113}}
			      when __Leveladventure_mine_zone113 band 8 /= 0
				     orelse
				     __Tracesadventure_mine_zone113 /= [] ->
			      lager:do_log(error,
					   [{module, adventure_mine_zone},
					    {function, do_handle_call},
					    {line, 113},
					    {pid, pid_to_list(self())},
					    {node, node()}
					    | lager:md()],
					   io_lib:format("~w尝试挑战不存在的矿组~w层~w位置~w",
							 [RoleId, GroupId,
							  Floor, RoomId]),
					   none, 4096, 8,
					   __Leveladventure_mine_zone113,
					   __Tracesadventure_mine_zone113,
					   lager_event,
					   __Pidadventure_mine_zone113);
			  _ -> ok
			end,
			{false,
			 lang:get(<<"Lỗi tham số, không tìm thấy tĩnh mạch "
				    "phòng thủ"/utf8>>)}
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
		    {__Pidadventure_mine_zone117, _,
		     {__Leveladventure_mine_zone117,
		      __Tracesadventure_mine_zone117}}
			when __Leveladventure_mine_zone117 band 8 /= 0 orelse
			       __Tracesadventure_mine_zone117 /= [] ->
			lager:do_log(error,
				     [{module, adventure_mine_zone},
				      {function, do_handle_call}, {line, 117},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("~w玩家尝试攻打不存在的矿组~w层~w位置~w",
						   [RoleId, GroupId, Floor,
						    RoomId]),
				     none, 4096, 8,
				     __Leveladventure_mine_zone117,
				     __Tracesadventure_mine_zone117,
				     lager_event, __Pidadventure_mine_zone117);
		    _ -> ok
		  end,
		  {false,
		   lang:get(<<"Tĩnh mạch này không tồn tại"/utf8>>)}
	    end,
    {reply, Reply, State};
do_handle_call({combat_win, RoleId, Floor, RoomId,
		ReplayId},
	       _From, State = #state{group_id = GroupId}) ->
    Now = date:unixtime(),
    Reply = case
	      adventure_mine_lib:get_adventure_mine_floor(GroupId,
							  Floor)
		of
	      {ok, MineFloor = #adventure_mine_floor{list = List}} ->
		  case lists:keyfind(RoomId, #adventure_mine_hole.room_id,
				     List)
		      of
		    MineHole = #adventure_mine_hole{mine_id = MineId,
						    role_id =
							TarRoleId = {TarId,
								     TarSrvId},
						    name = TarName} ->
			AccHookGroup = #adventure_mine_group_hook{list =
								      HookList} =
					   adventure_mine_lib:get_mine_hook_group(GroupId),
			case lists:keyfind({Floor, RoomId},
					   #adventure_mine_hook.id, HookList)
			    of
			  MineHook = #adventure_mine_hook{role_id = TarRoleId,
							  plunder_count =
							      PlunderCount,
							  acc_hook_items =
							      AccHookItems,
							  log = Logs}
			      when TarRoleId =/= {0, <<>>} ->
			      MaxFloor =
				  adventure_mine_lib:get_max_floor(RoleId),
			      RewardRate =
				  adventure_mine_data:get_plunder_reward(max(0,
									     MaxFloor
									       -
									       Floor)),
			      LossRate =
				  adventure_mine_data:get_plunder_loss(max(0,
									   MaxFloor
									     -
									     Floor)),
			      {PlunderItems, NewAccItems} = case
							      adventure_mine_data:get_const(rob_number)
								> PlunderCount
								of
							      false ->
								  {[],
								   AccHookItems};
							      _ ->
								  Fun = fun
									  ({ItemIdT,
									    NumT},
									   {Acc1,
									    Acc2}) ->
									      GetNumT =
										  util:round(NumT
											       *
											       RewardRate
											       /
											       1000),
									      LossNumT =
										  util:round(NumT
											       *
											       LossRate
											       /
											       1000),
									      {[{ItemIdT,
										 GetNumT}
										| Acc1],
									       [{ItemIdT,
										 max(0,
										     NumT
										       -
										       LossNumT)}
										| Acc2]}
									end,
								  lists:foldl(Fun,
									      {[],
									       []},
									      AccHookItems)
							    end,
			      NewMineHook =
				  MineHook#adventure_mine_hook{acc_hook_items =
								   NewAccItems,
							       plunder_count =
								   PlunderCount
								     + 1,
							       log =
								   [{RoleId,
								     Now,
								     PlunderItems}
								    | Logs]},
			      NewAccHookGroup =
				  AccHookGroup#adventure_mine_group_hook{list =
									     lists:keyreplace({Floor,
											       RoomId},
											      #adventure_mine_hook.id,
											      HookList,
											      NewMineHook)},
			      NewMineHole =
				  MineHole#adventure_mine_hole{last_fight =
								   RoleId,
							       last_replay_id =
								   ReplayId},
			      d_ets_lib:save_d_ets(adventure_mine_floor,
						   MineFloor#adventure_mine_floor{list
										      =
										      lists:keyreplace(RoomId,
												       #adventure_mine_hole.room_id,
												       List,
												       NewMineHole)}),
			      d_ets_lib:save_d_ets(adventure_mine_group_hook,
						   NewAccHookGroup),
			      catch log:save(mine,
					     {#{id => TarId, srv_id => TarSrvId,
						name => TarName},
					      util:fbin("~ts被掠夺~w玩家~w组~w层~w房~w资产~w剩余 ",
							[TarName, RoleId,
							 GroupId, Floor, RoomId,
							 PlunderItems,
							 NewAccItems])}),
			      {ok, PlunderItems};
			  #adventure_mine_hook{role_id = OldRoleId} ->
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
				{__Pidadventure_mine_zone153, _,
				 {__Leveladventure_mine_zone153,
				  __Tracesadventure_mine_zone153}}
				    when __Leveladventure_mine_zone153 band 8 /=
					   0
					   orelse
					   __Tracesadventure_mine_zone153 /=
					     [] ->
				    lager:do_log(error,
						 [{module, adventure_mine_zone},
						  {function, do_handle_call},
						  {line, 153},
						  {pid, pid_to_list(self())},
						  {node, node()}
						  | lager:md()],
						 io_lib:format("~w掠夺矿战时组~w层~w位置~w的主人居然变更了~w",
							       [RoleId, GroupId,
								Floor, RoomId,
								OldRoleId]),
						 none, 4096, 8,
						 __Leveladventure_mine_zone153,
						 __Tracesadventure_mine_zone153,
						 lager_event,
						 __Pidadventure_mine_zone153);
				_ -> ok
			      end,
			      {false,
			       lang:get(<<"Mỏ này tạm thời không có sẵn để cướp "
					  "bóc"/utf8>>)};
			  _ ->
			      PlunderItems =
				  adventure_mine_data:get_hole_base_items(MineId),
			      NewMineHole =
				  MineHole#adventure_mine_hole{last_fight =
								   RoleId},
			      d_ets_lib:save_d_ets(adventure_mine_floor,
						   MineFloor#adventure_mine_floor{list
										      =
										      lists:keyreplace(RoomId,
												       #adventure_mine_hole.room_id,
												       List,
												       NewMineHole)}),
			      {ok, PlunderItems}
			end;
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
			  {__Pidadventure_mine_zone162, _,
			   {__Leveladventure_mine_zone162,
			    __Tracesadventure_mine_zone162}}
			      when __Leveladventure_mine_zone162 band 8 /= 0
				     orelse
				     __Tracesadventure_mine_zone162 /= [] ->
			      lager:do_log(error,
					   [{module, adventure_mine_zone},
					    {function, do_handle_call},
					    {line, 162},
					    {pid, pid_to_list(self())},
					    {node, node()}
					    | lager:md()],
					   io_lib:format("~w结算矿战1时有不存在的矿组~w层~w位置~w",
							 [RoleId, GroupId,
							  Floor, RoomId]),
					   none, 4096, 8,
					   __Leveladventure_mine_zone162,
					   __Tracesadventure_mine_zone162,
					   lager_event,
					   __Pidadventure_mine_zone162);
			  _ -> ok
			end,
			{false,
			 lang:get(<<"Cuộc chiến khai thác hiện tại đã được "
				    "giải quyết, vui lòng thử lại"/utf8>>)}
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
		    {__Pidadventure_mine_zone166, _,
		     {__Leveladventure_mine_zone166,
		      __Tracesadventure_mine_zone166}}
			when __Leveladventure_mine_zone166 band 8 /= 0 orelse
			       __Tracesadventure_mine_zone166 /= [] ->
			lager:do_log(error,
				     [{module, adventure_mine_zone},
				      {function, do_handle_call}, {line, 166},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("~w玩家结算矿战2时打不存在的矿组~w层~w位置~w",
						   [RoleId, GroupId, Floor,
						    RoomId]),
				     none, 4096, 8,
				     __Leveladventure_mine_zone166,
				     __Tracesadventure_mine_zone166,
				     lager_event, __Pidadventure_mine_zone166);
		    _ -> ok
		  end,
		  {false,
		   lang:get(<<"Cuộc chiến khai thác hiện tại đã được "
			      "giải quyết, vui lòng thử lại"/utf8>>)}
	    end,
    {reply, Reply, State};
do_handle_call({buy_miner, RoleId, Floor, RoomId, Type,
		MineId},
	       _From, State = #state{group_id = GroupId}) ->
    AccHookGroup = #adventure_mine_group_hook{list =
						  HookList} =
		       adventure_mine_lib:get_mine_hook_group(GroupId),
    Reply = case lists:keyfind({Floor, RoomId},
			       #adventure_mine_hook.id, HookList)
		of
	      MineHook = #adventure_mine_hook{role_id = RoleId,
					      mine_id = MineId,
					      primary_count = PrimaryCount,
					      senior_count = SeniorCount} ->
		  PrimaryMax =
		      adventure_mine_data:get_const(primary_count),
		  SeniorMax = adventure_mine_data:get_const(senior_count),
		  if Type == 1 andalso PrimaryCount < PrimaryMax ->
			 NewMineHook =
			     MineHook#adventure_mine_hook{primary_count =
							      PrimaryCount + 1},
			 NewAccHookGroup =
			     AccHookGroup#adventure_mine_group_hook{list =
									lists:keyreplace({Floor,
											  RoomId},
											 #adventure_mine_hook.id,
											 HookList,
											 NewMineHook)},
			 d_ets_lib:save_d_ets(adventure_mine_group_hook,
					      NewAccHookGroup),
			 ok;
		     Type == 2 andalso SeniorCount < SeniorMax ->
			 NewMineHook = MineHook#adventure_mine_hook{senior_count
									=
									SeniorCount
									  + 1},
			 NewAccHookGroup =
			     AccHookGroup#adventure_mine_group_hook{list =
									lists:keyreplace({Floor,
											  RoomId},
											 #adventure_mine_hook.id,
											 HookList,
											 NewMineHook)},
			 d_ets_lib:save_d_ets(adventure_mine_group_hook,
					      NewAccHookGroup),
			 ok;
		     true ->
			 {false,
			  lang:get(<<"Số lượng giao dịch mua được thực hiện "
				     "bởi người khai thác này đã đạt đến giới "
				     "hạn trên"/utf8>>)}
		  end;
	      MineHook = #adventure_mine_hook{} ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidadventure_mine_zone192, _,
		     {__Leveladventure_mine_zone192,
		      __Tracesadventure_mine_zone192}}
			when __Leveladventure_mine_zone192 band 8 /= 0 orelse
			       __Tracesadventure_mine_zone192 /= [] ->
			lager:do_log(error,
				     [{module, adventure_mine_zone},
				      {function, do_handle_call}, {line, 192},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("~w购买矿工组~w层~w位置~w的数据居然变更了~w",
						   [RoleId, GroupId, Floor,
						    RoomId, MineHook]),
				     none, 4096, 8,
				     __Leveladventure_mine_zone192,
				     __Tracesadventure_mine_zone192,
				     lager_event, __Pidadventure_mine_zone192);
		    _ -> ok
		  end,
		  {false, lang:get(<<"Mỏ này không thể mua được"/utf8>>)};
	      _ ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidadventure_mine_zone195, _,
		     {__Leveladventure_mine_zone195,
		      __Tracesadventure_mine_zone195}}
			when __Leveladventure_mine_zone195 band 8 /= 0 orelse
			       __Tracesadventure_mine_zone195 /= [] ->
			lager:do_log(error,
				     [{module, adventure_mine_zone},
				      {function, do_handle_call}, {line, 195},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("~w购买矿工组~w层~w位置~w的数据居然不存在",
						   [RoleId, GroupId, Floor,
						    RoomId]),
				     none, 4096, 8,
				     __Leveladventure_mine_zone195,
				     __Tracesadventure_mine_zone195,
				     lager_event, __Pidadventure_mine_zone195);
		    _ -> ok
		  end,
		  {false, lang:get(<<"Mỏ không tồn tại"/utf8>>)}
	    end,
    {reply, Reply, State};
do_handle_call({give_up, RoleId, Floor, RoomId}, _From,
	       State = #state{group_id = GroupId}) ->
    Reply = case
	      adventure_mine_lib:get_adventure_mine_floor(GroupId,
							  Floor)
		of
	      {ok, MineFloor = #adventure_mine_floor{list = List}} ->
		  case lists:keyfind(RoomId, #adventure_mine_hole.room_id,
				     List)
		      of
		    MineHole = #adventure_mine_hole{mine_id = MineId,
						    role_id = RoleId} ->
			{_, RobotIds, LevList, RobotName} =
			    adventure_mine_data:get_mine_hole(MineId),
			{RobotId, _} = util:rand_list(RobotIds, 2),
			FaceId =
			    util:rand_list(sky_ladder_data:get_const(robot_head)),
			{Lev0, Lev1, Lev2} = util:rand_list(LevList),
			AddLev = util:rand(Lev2, Lev1),
			Lev = Lev0 + AddLev,
			Role0 = role_data:first_init(#role{id =
							       {1,
								sys_env:get(server_id)},
							   type = robot}),
			Role = Role0#role{lev = Lev},
			#{partners := Partners} = robot:get(Role, RobotId, #{}),
			Power = lists:sum([PowerT
					   || #partner{power = PowerT}
						  <- Partners]),
			Defense = [#adventure_mine_pos{pos = PId, id = PId,
						       bid = PBId, lev = PLev,
						       star = PStar,
						       break_lev = BreakLev,
						       power = PowerT}
				   || #partner{id = PId, bid = PBId, lev = PLev,
					       star = PStar,
					       break_lev = BreakLev,
					       power = PowerT}
					  <- Partners],
			NewMineHole = MineHole#adventure_mine_hole{role_id =
								       {0,
									<<>>},
								   lev = Lev,
								   power =
								       Power,
								   face =
								       FaceId,
								   name =
								       RobotName,
								   defense =
								       Defense,
								   last_fight =
								       {0,
									<<>>},
								   cool_time =
								       0,
								   occupy_time =
								       0,
								   last_replay_id
								       = 0,
								   robot_id =
								       RobotId},
			d_ets_lib:save_d_ets(adventure_mine_floor,
					     MineFloor#adventure_mine_floor{list
										=
										lists:keyreplace(RoomId,
												 #adventure_mine_hole.room_id,
												 List,
												 NewMineHole)}),
			Owned = #adventure_mine_owned{list = MineList} =
				    adventure_mine_lib:get_mine_owned(RoleId),
			NewMineList = lists:keydelete({Floor, RoomId},
						      #adventure_mine_owned_data.id,
						      MineList),
			d_ets_lib:save_d_ets(adventure_mine_owned,
					     Owned#adventure_mine_owned{list =
									    NewMineList}),
			GroupHook = #adventure_mine_group_hook{list =
								   HookList} =
					adventure_mine_lib:get_mine_hook_group(GroupId),
			case lists:keyfind({Floor, RoomId},
					   #adventure_mine_hook.id, HookList)
			    of
			  #adventure_mine_hook{role_id = RoleId,
					       acc_hook_items = AccHookItems} ->
			      case AccHookItems =/= [] of
				true ->
				    mail:send(RoleId,
					      {lang:get(<<"Nhận thu nhập mạch khoáng."/utf8>>),
					       color:msg(lang:get(<<"Nhẫn giả thân mến, bạn đã từ bỏ việc "
								    "chiếm giữ các tĩnh mạch trên lớp ~ts, "
								    "và bây giờ hãy trả lại thu nhập còn "
								    "lại của bạn trong các tĩnh mạch:"/utf8>>),
							 [{green, Floor}]),
					       items, AccHookItems,
					       <<"Chế độ chơi chiến tranh mỏ"/utf8>>});
				_ -> skip
			      end;
			  T = #adventure_mine_hook{} ->
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
				{__Pidadventure_mine_zone232, _,
				 {__Leveladventure_mine_zone232,
				  __Tracesadventure_mine_zone232}}
				    when __Leveladventure_mine_zone232 band 8 /=
					   0
					   orelse
					   __Tracesadventure_mine_zone232 /=
					     [] ->
				    lager:do_log(error,
						 [{module, adventure_mine_zone},
						  {function, do_handle_call},
						  {line, 232},
						  {pid, pid_to_list(self())},
						  {node, node()}
						  | lager:md()],
						 io_lib:format("~w组~w层~w位置的矿脉有误，收益人员更替了~w",
							       [GroupId, Floor,
								RoomId, T]),
						 none, 4096, 8,
						 __Leveladventure_mine_zone232,
						 __Tracesadventure_mine_zone232,
						 lager_event,
						 __Pidadventure_mine_zone232);
				_ -> ok
			      end;
			  _ -> skip
			end,
			NewHookList = lists:keydelete({Floor, RoomId},
						      #adventure_mine_hook.id,
						      HookList),
			d_ets_lib:save_d_ets(adventure_mine_group_hook,
					     GroupHook#adventure_mine_group_hook{list
										     =
										     NewHookList}),
			ok;
		    _ ->
			{false,
			 lang:get(<<"Tĩnh mạch này vẫn chưa bị chiếm đóng"/utf8>>)}
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
		    {__Pidadventure_mine_zone243, _,
		     {__Leveladventure_mine_zone243,
		      __Tracesadventure_mine_zone243}}
			when __Leveladventure_mine_zone243 band 8 /= 0 orelse
			       __Tracesadventure_mine_zone243 /= [] ->
			lager:do_log(error,
				     [{module, adventure_mine_zone},
				      {function, do_handle_call}, {line, 243},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("~w玩家在矿战时布阵不存在的组~w层~w",
						   [RoleId, GroupId, Floor]),
				     none, 4096, 8,
				     __Leveladventure_mine_zone243,
				     __Tracesadventure_mine_zone243,
				     lager_event, __Pidadventure_mine_zone243);
		    _ -> ok
		  end,
		  {false, lang:get(<<"Lớp mảng không tồn tại"/utf8>>)}
	    end,
    {reply, Reply, State};
do_handle_call({save_defense, RoleId, RoleName, RLev,
		RFace, Power, Floor, RoomId, FormationType, Defense,
		HallowsId, CanOwnedNum},
	       _From, State = #state{group_id = GroupId}) ->
    Reply = case
	      adventure_mine_lib:get_adventure_mine_floor(GroupId,
							  Floor)
		of
	      {ok, MineFloor = #adventure_mine_floor{list = List}} ->
		  case lists:keyfind(RoomId, #adventure_mine_hole.room_id,
				     List)
		      of
		    MineHole = #adventure_mine_hole{role_id = RoleId} ->
			NewMineHole = MineHole#adventure_mine_hole{power =
								       Power,
								   defense =
								       Defense,
								   formation_type
								       =
								       FormationType,
								   hallows_id =
								       HallowsId},
			d_ets_lib:save_ets(adventure_mine_floor,
					   MineFloor#adventure_mine_floor{list =
									      lists:keyreplace(RoomId,
											       #adventure_mine_hole.room_id,
											       List,
											       NewMineHole)}),
			PIds = [PId
				|| #adventure_mine_pos{id = PId} <- Defense],
			Owned = #adventure_mine_owned{list = MineList} =
				    adventure_mine_lib:get_mine_owned(RoleId),
			NewMineList = lists:keystore({Floor, RoomId},
						     #adventure_mine_owned_data.id,
						     MineList,
						     #adventure_mine_owned_data{id
										    =
										    {Floor,
										     RoomId},
										pos
										    =
										    PIds}),
			d_ets_lib:save_ets(adventure_mine_owned,
					   Owned#adventure_mine_owned{list =
									  NewMineList}),
			role_trigger:async_fire(RoleId,
						#evt_mine_save_defense{}),
			ok;
		    MineHole = #adventure_mine_hole{role_id =
							OldRoleId = {_, BSrvId},
						    mine_id = MineId,
						    last_fight = RoleId,
						    last_replay_id =
							LastReplayId} ->
			ets:delete(adventure_mine_fight_lock,
				   {GroupId, Floor, RoomId}),
			OwnedNum =
			    adventure_mine_lib:get_mine_owned_num(RoleId),
			case CanOwnedNum > OwnedNum of
			  true ->
			      Now = date:unixtime(),
			      NewMineHole = MineHole#adventure_mine_hole{role_id
									     =
									     RoleId,
									 name =
									     RoleName,
									 lev =
									     RLev,
									 face =
									     RFace,
									 power =
									     Power,
									 defense
									     =
									     Defense,
									 formation_type
									     =
									     FormationType,
									 hallows_id
									     =
									     HallowsId,
									 occupy_time
									     =
									     Now,
									 last_fight
									     =
									     {0,
									      <<>>},
									 cool_time
									     =
									     Now
									       +
									       60
										 *
										 adventure_mine_data:get_const(protect_time)},
			      d_ets_lib:save_d_ets(adventure_mine_floor,
						   MineFloor#adventure_mine_floor{list
										      =
										      lists:keyreplace(RoomId,
												       #adventure_mine_hole.room_id,
												       List,
												       NewMineHole)}),
			      PIds = [PId
				      || #adventure_mine_pos{id = PId}
					     <- Defense],
			      case BSrvId == <<>> of
				false ->
				    cluster_lib:cast(BSrvId, adventure_mine_mgr,
						     info,
						     [{change_log, OldRoleId,
						       LastReplayId}]);
				_ -> skip
			      end,
			      change_owned(GroupId, Floor, RoomId, MineId,
					   OldRoleId, RoleId, RoleName, PIds),
			      role_trigger:async_fire(RoleId,
						      #evt_mine_owned{}),
			      role:pack_send(OldRoleId, 20642,
					     {adventure_mine_lib:get_lock_partner_ids(OldRoleId)}),
			      ok;
			  _ ->
			      {false,
			       lang:get(<<"Đã đạt đến giới hạn nghề nghiệp"/utf8>>)}
			end;
		    _ ->
			{false,
			 lang:get(<<"Hãy chiếm được mỏ trước khi bạn có thể "
				    "chiếm được nó."/utf8>>)}
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
		    {__Pidadventure_mine_zone287, _,
		     {__Leveladventure_mine_zone287,
		      __Tracesadventure_mine_zone287}}
			when __Leveladventure_mine_zone287 band 8 /= 0 orelse
			       __Tracesadventure_mine_zone287 /= [] ->
			lager:do_log(error,
				     [{module, adventure_mine_zone},
				      {function, do_handle_call}, {line, 287},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("~w玩家在矿战时布阵不存在的组~w层~w",
						   [RoleId, GroupId, Floor]),
				     none, 4096, 8,
				     __Leveladventure_mine_zone287,
				     __Tracesadventure_mine_zone287,
				     lager_event, __Pidadventure_mine_zone287);
		    _ -> ok
		  end,
		  {false, lang:get(<<"Lớp mảng không tồn tại"/utf8>>)}
	    end,
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info({apply, M, F, A}, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_zone300, _,
	     {__Leveladventure_mine_zone300,
	      __Tracesadventure_mine_zone300}}
		when __Leveladventure_mine_zone300 band 8 /= 0 orelse
		       __Tracesadventure_mine_zone300 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine_zone},
			      {function, do_handle_info}, {line, 300},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Leveladventure_mine_zone300,
			     __Tracesadventure_mine_zone300, lager_event,
			     __Pidadventure_mine_zone300);
	    _ -> ok
	  end,
	  {noreply, State}
    end;
do_handle_info(acc_hook,
	       State = #state{group_id = GroupId}) ->
    AccHookGroup = #adventure_mine_group_hook{list =
						  HookList} =
		       adventure_mine_lib:get_mine_hook_group(GroupId),
    Now = date:unixtime(),
    NewHookList = do_acc_hook(HookList, [], Now, GroupId),
    NewAccHookGroup =
	AccHookGroup#adventure_mine_group_hook{list =
						   NewHookList},
    d_ets_lib:save_d_ets(adventure_mine_group_hook,
			 NewAccHookGroup),
    util:set_timer(acc_hook_timer, 60, acc_hook),
    {noreply, State};
do_handle_info({unlock_mine_manual, Floor, RoomId,
		RoleId},
	       State = #state{group_id = GroupId}) ->
    case ets:lookup(adventure_mine_fight_lock,
		    {GroupId, Floor, RoomId})
	of
      [#adventure_mine_fight_lock{fight_rid = RoleId}] ->
	  ets:delete(adventure_mine_fight_lock,
		     {GroupId, Floor, RoomId});
      _ -> skip
    end,
    {noreply, State};
do_handle_info({unlock_mine_delayed, Floor, RoomId},
	       State) ->
    erlang:send_after(1000 *
			adventure_mine_data:get_const(count_down),
		      self(), {unlock_mine, Floor, RoomId}),
    {noreply, State};
do_handle_info({unlock_mine, Floor, RoomId},
	       State = #state{group_id = GroupId}) ->
    ets:delete(adventure_mine_fight_lock,
	       {GroupId, Floor, RoomId}),
    {noreply, State};
do_handle_info({gm_clear_time, Floor},
	       State = #state{group_id = GroupId}) ->
    case
      adventure_mine_lib:get_adventure_mine_floor(GroupId,
						  Floor)
	of
      {ok, MineFloor = #adventure_mine_floor{list = List}} ->
	  NewList = [Hole#adventure_mine_hole{cool_time = 0,
					      occupy_time = 0}
		     || Hole = #adventure_mine_hole{} <- List],
	  d_ets_lib:save_ets(adventure_mine_floor,
			     MineFloor#adventure_mine_floor{list = NewList}),
	  ok;
      _ -> skip
    end,
    {noreply, State};
do_handle_info({close_reward},
	       State = #state{group_id = GroupId}) ->
    #adventure_mine_group_hook{list = HookList} =
	adventure_mine_lib:get_mine_hook_group(GroupId),
    close_reward(HookList, [], GroupId),
    {noreply, State};
do_handle_info(_Info, State) -> {noreply, State}.

do_acc_hook([], List, _Now, _GroupId) -> List;
do_acc_hook([MineHook = #adventure_mine_hook{id =
						 {Floor, RoomId},
					     mine_id = MineId, role_id = RoleId,
					     last_hook_time = LastHookTime,
					     acc_hook_items = AccHookItems,
					     acc_hook_time = AccHookTime,
					     primary_count = PrimaryCount,
					     senior_count = SeniorCount}
	     | Other],
	    List, Now, GroupId) ->
    MaxFloor = adventure_mine_lib:get_max_floor(RoleId),
    DecRate = adventure_mine_data:get_dec_rate(MaxFloor -
						 Floor),
    MaxLimit = adventure_mine_data:get_max_time(MineId) +
		 PrimaryCount *
		   adventure_mine_data:get_const(primary_time)
		 +
		 SeniorCount *
		   adventure_mine_data:get_const(senior_time),
    MaxHookTime = 60 * MaxLimit,
    NTime = min(min(Now - LastHookTime, 60 * MaxLimit),
		60 * MaxLimit - AccHookTime),
    BaseNum = max(1, util:floor(NTime / 60)),
    AddItems = [{ItemIdT,
		 util:round(NumT * BaseNum * (1000 - DecRate) / 1000)}
		|| {ItemIdT, NumT}
		       <- adventure_mine_data:get_hole_hook_items(MineId)],
    NewAccItems = item_lib:merge(AddItems, AccHookItems),
    NewAccHookTime = AccHookTime + 60 * BaseNum,
    case NewAccHookTime >= MaxHookTime of
      true ->
	  case
	    adventure_mine_lib:get_adventure_mine_floor(GroupId,
							Floor)
	      of
	    {ok,
	     MineFloor = #adventure_mine_floor{list = HoleList}} ->
		case lists:keyfind(RoomId, #adventure_mine_hole.room_id,
				   HoleList)
		    of
		  MineHole = #adventure_mine_hole{mine_id = MineId,
						  role_id = RoleId} ->
		      {_, RobotIds, LevList, RobotName} =
			  adventure_mine_data:get_mine_hole(MineId),
		      {RobotId, _} = util:rand_list(RobotIds, 2),
		      FaceId =
			  util:rand_list(sky_ladder_data:get_const(robot_head)),
		      {Lev0, Lev1, Lev2} = util:rand_list(LevList),
		      AddLev = util:rand(Lev2, Lev1),
		      Lev = Lev0 + AddLev,
		      Role0 = role_data:first_init(#role{id =
							     {1,
							      sys_env:get(server_id)},
							 type = robot}),
		      Role = Role0#role{lev = Lev},
		      #{partners := Partners} = robot:get(Role, RobotId, #{}),
		      Power = lists:sum([PowerT
					 || #partner{power = PowerT}
						<- Partners]),
		      Defense = [#adventure_mine_pos{pos = PId, id = PId,
						     bid = PBId, lev = PLev,
						     star = PStar,
						     break_lev = BreakLev,
						     power = PowerT}
				 || #partner{id = PId, bid = PBId, lev = PLev,
					     star = PStar, break_lev = BreakLev,
					     power = PowerT}
					<- Partners],
		      NewMineHole = MineHole#adventure_mine_hole{role_id =
								     {0, <<>>},
								 lev = Lev,
								 power = Power,
								 face = FaceId,
								 name =
								     RobotName,
								 defense =
								     Defense,
								 robot_id =
								     RobotId},
		      d_ets_lib:save_d_ets(adventure_mine_floor,
					   MineFloor#adventure_mine_floor{list =
									      lists:keyreplace(RoomId,
											       #adventure_mine_hole.room_id,
											       HoleList,
											       NewMineHole)}),
		      Owned = #adventure_mine_owned{list = MineList} =
				  adventure_mine_lib:get_mine_owned(RoleId),
		      NewMineList = lists:keydelete({Floor, RoomId},
						    #adventure_mine_owned_data.id,
						    MineList),
		      role:pack_send(RoleId, 20642,
				     {lists:flatten([Pos
						     || #adventure_mine_owned_data{pos
										       =
										       Pos}
							    <- NewMineList])}),
		      d_ets_lib:save_ets(adventure_mine_owned,
					 Owned#adventure_mine_owned{list =
									NewMineList});
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
			{__Pidadventure_mine_zone389, _,
			 {__Leveladventure_mine_zone389,
			  __Tracesadventure_mine_zone389}}
			    when __Leveladventure_mine_zone389 band 8 /= 0
				   orelse
				   __Tracesadventure_mine_zone389 /= [] ->
			    lager:do_log(error,
					 [{module, adventure_mine_zone},
					  {function, do_acc_hook}, {line, 389},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~w玩家在矿战计算收益时时不存在的组~w层~w房~w是~w",
						       [RoleId, GroupId, Floor,
							RoomId, _ERR]),
					 none, 4096, 8,
					 __Leveladventure_mine_zone389,
					 __Tracesadventure_mine_zone389,
					 lager_event,
					 __Pidadventure_mine_zone389);
			_ -> ok
		      end,
		      skip
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
		  {__Pidadventure_mine_zone393, _,
		   {__Leveladventure_mine_zone393,
		    __Tracesadventure_mine_zone393}}
		      when __Leveladventure_mine_zone393 band 8 /= 0 orelse
			     __Tracesadventure_mine_zone393 /= [] ->
		      lager:do_log(error,
				   [{module, adventure_mine_zone},
				    {function, do_acc_hook}, {line, 393},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~w玩家在矿战计算收益时时不存在的组~w层~w",
						 [RoleId, GroupId, Floor]),
				   none, 4096, 8, __Leveladventure_mine_zone393,
				   __Tracesadventure_mine_zone393, lager_event,
				   __Pidadventure_mine_zone393);
		  _ -> ok
		end,
		skip
	  end,
	  mail:send(RoleId,
		    {lang:get(<<"Nhận thu nhập từ tĩnh mạch khoáng sản"/utf8>>),
		     color:msg(lang:get(<<"Nhẫn giả thân mến, bạn đang ở đây~tsCác "
					  "mạch quặng trên lớp đã đạt thu nhập "
					  "tối đa và thu nhập của bạn từ các mạch "
					  "quặng bây giờ sẽ được trả lại.:"/utf8>>),
			       [{green, Floor}]),
		     items, NewAccItems, <<"矿战玩法"/utf8>>}),
	  do_acc_hook(Other, List, Now, GroupId);
      _ ->
	  NewMineHook =
	      MineHook#adventure_mine_hook{last_hook_time = Now,
					   acc_hook_items = NewAccItems,
					   acc_hook_time = NewAccHookTime},
	  do_acc_hook(Other, [NewMineHook | List], Now, GroupId)
    end.

change_owned(GroupId, Floor, RoomId, MIneId, OldRoleId,
	     RoleId = {Rid, SrvId}, RoleName, PIds) ->
    Owned = #adventure_mine_owned{list = MineList} =
		adventure_mine_lib:get_mine_owned(RoleId),
    NewMineList = lists:keystore({Floor, RoomId},
				 #adventure_mine_owned_data.id, MineList,
				 #adventure_mine_owned_data{id =
								{Floor, RoomId},
							    pos = PIds}),
    d_ets_lib:save_ets(adventure_mine_owned,
		       Owned#adventure_mine_owned{list = NewMineList}),
    case OldRoleId =/= {0, <<>>} of
      true ->
	  TarOwned = #adventure_mine_owned{list = TarMineList} =
			 adventure_mine_lib:get_mine_owned(OldRoleId),
	  NewTarMineList = lists:keydelete({Floor, RoomId},
					   #adventure_mine_owned_data.id,
					   TarMineList),
	  d_ets_lib:save_ets(adventure_mine_owned,
			     TarOwned#adventure_mine_owned{list =
							       NewTarMineList});
      _ -> skip
    end,
    GroupHook = #adventure_mine_group_hook{list =
					       HookList} =
		    adventure_mine_lib:get_mine_hook_group(GroupId),
    case lists:keyfind({Floor, RoomId},
		       #adventure_mine_hook.id, HookList)
	of
      #adventure_mine_hook{role_id = OldRoleId,
			   acc_hook_items = AccHookItems} ->
	  case AccHookItems =/= [] of
	    true ->
		mail:send(OldRoleId,
			  {lang:get(<<"Của tôi đã bị tịch thu"/utf8>>),
			   color:msg(lang:get(<<"Nhẫn giả thân mến, bạn đang ở đây~tsCác "
						"mạch quặng trên lớp đã bị chiếm giữ "
						"và thu nhập còn lại của bạn từ các mạch "
						"quặng sẽ được trả lại cho bạn.:"/utf8>>),
				     [{green, Floor}]),
			   items, AccHookItems, <<"矿战玩法"/utf8>>});
	    _ -> skip
	  end;
      T = #adventure_mine_hook{} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_zone429, _,
	     {__Leveladventure_mine_zone429,
	      __Tracesadventure_mine_zone429}}
		when __Leveladventure_mine_zone429 band 8 /= 0 orelse
		       __Tracesadventure_mine_zone429 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine_zone},
			      {function, change_owned}, {line, 429},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w组~w层~w位置的矿脉有误，收益人员更替了~w",
					   [GroupId, Floor, RoomId, T]),
			     none, 4096, 8, __Leveladventure_mine_zone429,
			     __Tracesadventure_mine_zone429, lager_event,
			     __Pidadventure_mine_zone429);
	    _ -> ok
	  end;
      _ -> skip
    end,
    Now = date:unixtime(),
    NewMineHook = #adventure_mine_hook{id = {Floor, RoomId},
				       role_id = RoleId, mine_id = MIneId,
				       last_hook_time = Now, occupy_time = Now},
    NewHookList = lists:keystore({Floor, RoomId},
				 #adventure_mine_hook.id, HookList,
				 NewMineHook),
    d_ets_lib:save_d_ets(adventure_mine_group_hook,
			 GroupHook#adventure_mine_group_hook{list =
								 NewHookList}),
    catch log:save(mine,
		   {#{id => Rid, srv_id => SrvId, name => RoleName},
		    util:fbin("~ts占领~w玩家~w组~w层~w房 ",
			      [RoleName, OldRoleId, GroupId, Floor, RoomId])}),
    ok.

advance_reward([], List, _SrvIds, _GroupId) -> List;
advance_reward([MineHook = #adventure_mine_hook{id =
						    {Floor, RoomId},
						role_id = RoleId = {_, SrvId},
						mine_id = MineId,
						acc_hook_items = AccHookItems}
		| Other],
	       List, SrvIds, GroupId) ->
    case lists:member(SrvId, SrvIds) of
      true ->
	  case
	    adventure_mine_lib:get_adventure_mine_floor(GroupId,
							Floor)
	      of
	    {ok,
	     MineFloor = #adventure_mine_floor{list = HoleList}} ->
		case lists:keyfind(RoomId, #adventure_mine_hole.room_id,
				   HoleList)
		    of
		  MineHole = #adventure_mine_hole{mine_id = MineId,
						  role_id = RoleId} ->
		      {_, RobotIds, LevList, RobotName} =
			  adventure_mine_data:get_mine_hole(MineId),
		      {RobotId, _} = util:rand_list(RobotIds, 2),
		      FaceId =
			  util:rand_list(sky_ladder_data:get_const(robot_head)),
		      {Lev0, Lev1, Lev2} = util:rand_list(LevList),
		      AddLev = util:rand(Lev2, Lev1),
		      Lev = Lev0 + AddLev,
		      Role0 = role_data:first_init(#role{id =
							     {1,
							      sys_env:get(server_id)},
							 type = robot}),
		      Role = Role0#role{lev = Lev},
		      #{partners := Partners} = robot:get(Role, RobotId, #{}),
		      Power = lists:sum([PowerT
					 || #partner{power = PowerT}
						<- Partners]),
		      Defense = [#adventure_mine_pos{pos = PId, id = PId,
						     bid = PBId, lev = PLev,
						     star = PStar,
						     break_lev = BreakLev,
						     power = PowerT}
				 || #partner{id = PId, bid = PBId, lev = PLev,
					     star = PStar, break_lev = BreakLev,
					     power = PowerT}
					<- Partners],
		      NewMineHole = MineHole#adventure_mine_hole{role_id =
								     {0, <<>>},
								 lev = Lev,
								 power = Power,
								 face = FaceId,
								 name =
								     RobotName,
								 defense =
								     Defense,
								 last_fight =
								     {0, <<>>},
								 cool_time = 0,
								 occupy_time =
								     0,
								 last_replay_id
								     = 0,
								 robot_id =
								     RobotId},
		      d_ets_lib:save_d_ets(adventure_mine_floor,
					   MineFloor#adventure_mine_floor{list =
									      lists:keyreplace(RoomId,
											       #adventure_mine_hole.room_id,
											       HoleList,
											       NewMineHole)}),
		      Owned = #adventure_mine_owned{list = MineList} =
				  adventure_mine_lib:get_mine_owned(RoleId),
		      NewMineList = lists:keydelete({Floor, RoomId},
						    #adventure_mine_owned_data.id,
						    MineList),
		      d_ets_lib:save_ets(adventure_mine_owned,
					 Owned#adventure_mine_owned{list =
									NewMineList});
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
			{__Pidadventure_mine_zone467, _,
			 {__Leveladventure_mine_zone467,
			  __Tracesadventure_mine_zone467}}
			    when __Leveladventure_mine_zone467 band 8 /= 0
				   orelse
				   __Tracesadventure_mine_zone467 /= [] ->
			    lager:do_log(error,
					 [{module, adventure_mine_zone},
					  {function, advance_reward},
					  {line, 467},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~w玩家在矿战合服结算时不存在的组~w层~w房~w是~w",
						       [RoleId, GroupId, Floor,
							RoomId, _ERR]),
					 none, 4096, 8,
					 __Leveladventure_mine_zone467,
					 __Tracesadventure_mine_zone467,
					 lager_event,
					 __Pidadventure_mine_zone467);
			_ -> ok
		      end,
		      skip
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
		  {__Pidadventure_mine_zone471, _,
		   {__Leveladventure_mine_zone471,
		    __Tracesadventure_mine_zone471}}
		      when __Leveladventure_mine_zone471 band 8 /= 0 orelse
			     __Tracesadventure_mine_zone471 /= [] ->
		      lager:do_log(error,
				   [{module, adventure_mine_zone},
				    {function, advance_reward}, {line, 471},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("~w玩家在矿战合服结算时时不存在的组~w层~w",
						 [RoleId, GroupId, Floor]),
				   none, 4096, 8, __Leveladventure_mine_zone471,
				   __Tracesadventure_mine_zone471, lager_event,
				   __Pidadventure_mine_zone471);
		  _ -> ok
		end,
		skip
	  end,
	  mail:send(RoleId,
		    {lang:get(<<"Giải quyết máy chủ hợp nhất thu nhập "
				"khoáng sản"/utf8>>),
		     color:msg(lang:get(<<"Kính gửi quý nhẫn giả, do hoạt động "
					  "sáp nhập máy chủ，Mạch quặng của bạn "
					  "ở lớp ~ts đã được xử lý trước và thu "
					  "nhập của bạn từ mạch quặng bây giờ sẽ "
					  "được trả lại.:"/utf8>>),
			       [{green, Floor}]),
		     items, AccHookItems, <<"矿战玩法"/utf8>>}),
	  advance_reward(Other, List, SrvIds, GroupId);
      _ ->
	  advance_reward(Other, [MineHook | List], SrvIds,
			 GroupId)
    end.

close_reward([], List, _GroupId) -> List;
close_reward([#adventure_mine_hook{id = {Floor, RoomId},
				   role_id = RoleId, mine_id = MineId,
				   acc_hook_items = AccHookItems}
	      | Other],
	     List, GroupId) ->
    mail:send(RoleId,
	      {lang:get(<<"Định cư nghề quặng"/utf8>>),
	       color:msg(lang:get(<<"Xin chào nhà thám hiểm thân mến, do "
				    "kinh nghiệm kém nên Cuộc chiến Mỏ Phiêu "
				    "lưu đã tạm thời bị đóng. Hệ thống sẽ "
				    "tự động trả lại phần thưởng mỏ chưa "
				    "giải quyết của bạn trong vòng Trận chiến "
				    "Mỏ này.Phần thưởng. Sau đây là phần "
				    "thưởng được trả lại："/utf8>>),
			 []),
	       items, AccHookItems, <<"矿战玩法"/utf8>>}),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidadventure_mine_zone485, _,
       {__Leveladventure_mine_zone485,
	__Tracesadventure_mine_zone485}}
	  when __Leveladventure_mine_zone485 band 64 /= 0 orelse
		 __Tracesadventure_mine_zone485 /= [] ->
	  lager:do_log(info,
		       [{module, adventure_mine_zone},
			{function, close_reward}, {line, 485},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("功能关闭结算: role_id = ~w, mine_id=~w acc_hook_ite"
				     "ms=~w room=~w",
				     [RoleId, MineId, AccHookItems,
				      {Floor, RoomId, GroupId}]),
		       none, 4096, 64, __Leveladventure_mine_zone485,
		       __Tracesadventure_mine_zone485, lager_event,
		       __Pidadventure_mine_zone485);
      _ -> ok
    end,
    close_reward(Other, List, GroupId).


