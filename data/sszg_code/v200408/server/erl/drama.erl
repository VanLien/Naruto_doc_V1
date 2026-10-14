-file("data/drama.erl", 1).

-file("src/mod/drama/drama.erl", 1).

-module(drama).

-lager_records([{link,
		 [socket, conn_pid, ip, port, lag]},
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
		{drama_quest_unit,
		 [label, id, base_id, type, pos, dir, act_type,
		  is_rand_pos]},
		{drama_play,
		 [id, act_type, label, base_id, map_bid, x, y, type, val,
		  name, desc]},
		{drama_obj,
		 [id, name, base_id, type, minor_type, map_bid, x, y,
		  dir, act_type, looks, status, quest_id, quest_prog_id,
		  sex, career]},
		{drama_data,
		 [bid, name, lev, is_open, is_skip, num, event, act_cond,
		  act, condition, offline]},
		{drama, [id, act_idx, num]},
		{m_drama,
		 [ver, finished, play_list, do_list, combat_list,
		  obj_list, guide_list, finish_guide]},
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
		{condition, [label, op, val, msg]},
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

-export([init/0, login/1, level_up/2, skip/2, event/3,
	 client_play/3, trigger_send/2, get_obj/3, exec_act/2,
	 exec_act/3, ready/1, append_play/2, trigger_send2/2]).

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

-file("src/mod/drama/drama.erl", 30).

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

-file("src/mod/drama/drama.erl", 31).

-file("inc/role_misc.hrl", 1).

-record(role_misc,
	{reg_zero_time = 0, self_charge = 0,
	 combat_watch_pid = 0, mail_posting = [],
	 is_do_online = 0, gm_attr = [], dun_auto_num = 0,
	 dun_auto_lose = 0, invite_code_list = [],
	 return_code_list = [], need_captcha = 0}).

-file("src/mod/drama/drama.erl", 32).

-file("inc/condition.hrl", 1).

-record(condition,
	{label  :: atom(),
	 op = eq  ::
	     ue | eq | lt | gt | le | ge | range | include,
	 val  :: term(), msg = <<>>  :: bitstring()}).

-file("src/mod/drama/drama.erl", 33).

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

-file("src/mod/drama/drama.erl", 34).

-file("inc/drama.hrl", 1).

-record(m_drama,
	{ver = 1, finished = []  :: [pos_integer()],
	 play_list = []  :: [pos_integer()],
	 do_list = []  :: [tuple()],
	 combat_list = []  :: [tuple()], obj_list = [],
	 guide_list = []  :: [pos_integer()],
	 finish_guide = []  :: list()}).

-record(drama, {id = 0, act_idx = 0, num = 0}).

-record(drama_data,
	{bid = 0, name = <<>>, lev = 0, is_open = 0,
	 is_skip = 0, num = 1, event, act_cond = [], act = [],
	 condition = [], offline = 1}).

-record(drama_obj,
	{id = 0, name = <<>>  :: binary(),
	 base_id = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(), minor_type = 0,
	 map_bid = 0  :: non_neg_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 dir = 0  :: non_neg_integer(),
	 act_type = ""  :: bitstring(), looks = []  :: [tuple()],
	 status = 0  :: non_neg_integer(),
	 quest_id = 0  :: non_neg_integer(),
	 quest_prog_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer()}).

-record(drama_play,
	{id = 0  :: non_neg_integer(),
	 act_type = 0  :: non_neg_integer(),
	 label = act  :: atom(),
	 base_id = 0  :: non_neg_integer(),
	 map_bid = 0  :: non_neg_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 type = 0  :: non_neg_integer(),
	 val = 0  :: non_neg_integer(), name = <<>>  :: binary(),
	 desc = <<>>  :: binary()}).

-record(drama_quest_unit,
	{label, id = 0, base_id = 0, type = 0, pos, dir,
	 act_type, is_rand_pos = 0  :: 0 | 1}).

-file("src/mod/drama/drama.erl", 35).

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

-file("src/mod/drama/drama.erl", 36).

-file("inc/log.hrl", 1).

-file("src/mod/drama/drama.erl", 37).

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

-file("src/mod/drama/drama.erl", 38).

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

-file("src/mod/drama/drama.erl", 39).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/mod/drama/drama.erl", 40).

-export([gm_play/3, gm_skip_all/1, gm_skip/2]).

gm_play(Role = #role{m_drama =
			 MDrama = #m_drama{do_list = DoL, play_list = PlayL,
					   combat_list = CombatDoL}},
	Id, Step) ->
    case drama_data:get(Id) of
      Data = #drama_data{} ->
	  case is_combat_drama(Data) of
	    false ->
		NRole = case lists:keyfind(Id, #drama.id, DoL) of
			  #drama{act_idx = ActIdx} when ActIdx > 0 ->
			      {ok, Role};
			  Drama = #drama{} ->
			      NewDoL = lists:keyreplace(Id, #drama.id, DoL,
							Drama#drama{act_idx =
									Step}),
			      Role#role{m_drama =
					    MDrama#m_drama{play_list =
							       PlayL ++ [Id],
							   do_list = NewDoL}};
			  _ ->
			      Drama = #drama{id = Id, act_idx = Step},
			      Role#role{m_drama =
					    MDrama#m_drama{play_list =
							       PlayL ++ [Id],
							   do_list =
							       [Drama | DoL]}}
			end,
		{ok, play_next(NRole)};
	    true ->
		case lists:keyfind(Id, #drama.id, CombatDoL) of
		  Drama = #drama{act_idx = ActIdx} when ActIdx > 0 ->
		      NewCombatDoL = lists:keyreplace(Id, #drama.id,
						      CombatDoL,
						      Drama#drama{act_idx = 0}),
		      NRole = Role#role{m_drama =
					    MDrama#m_drama{play_list =
							       lists:delete(Id,
									    PlayL),
							   combat_list =
							       NewCombatDoL}},
		      {ok, NRole};
		  #drama{} -> {ok, Role};
		  _ ->
		      Drama = #drama{id = Id, act_idx = 0},
		      NRole = Role#role{m_drama =
					    MDrama#m_drama{play_list =
							       lists:delete(Id,
									    PlayL),
							   combat_list =
							       [Drama
								| CombatDoL]}},
		      ready(NRole)
		end
	  end;
      _ -> {reply, util:fbin("剧情[Id:~w]基础数据不存在", [Id])}
    end.

gm_skip(Role = #role{m_drama =
			 MDrama = #m_drama{play_list = PlayL, do_list = DoL,
					   finished = FinishL,
					   combat_list = CombatDoL}},
	MaxId) ->
    NewMDrama = case PlayL of
		  [Id | _] ->
		      NewDoL = [Drama
				|| Drama = #drama{id = DoId} <- DoL,
				   Id =:= DoId],
		      NewCombatDoL = [Drama
				      || Drama = #drama{id = DoId} <- CombatDoL,
					 Id =:= DoId],
		      [combat_drama:gm_finish(Role, DoId)
		       || #drama{id = DoId} <- CombatDoL, Id =/= DoId,
			  DoId < MaxId],
		      OpenList = [OpenId
				  || OpenId <- drama_data:open_list(),
				     OpenId < MaxId]
				   -- FinishL -- [Id],
		      NewFinL = FinishL ++ OpenList,
		      MDrama#m_drama{play_list = [Id], do_list = NewDoL,
				     finished = NewFinL,
				     combat_list = NewCombatDoL,
				     guide_list = []};
		  _ ->
		      [combat_drama:gm_finish(Role, DoId)
		       || #drama{id = DoId} <- CombatDoL, DoId < MaxId],
		      OpenList = [OpenId
				  || OpenId <- drama_data:open_list(),
				     OpenId < MaxId]
				   -- FinishL,
		      NewFinL = FinishL ++ OpenList,
		      MDrama#m_drama{play_list = [], do_list = [],
				     finished = NewFinL, combat_list = [],
				     guide_list = []}
		end,
    Role#role{m_drama = NewMDrama};
gm_skip(Role, _MaxId) -> Role.

gm_skip_all(Role = #role{m_drama =
			     MDrama = #m_drama{play_list = PlayL, do_list = DoL,
					       finished = FinishL,
					       combat_list = CombatDoL}}) ->
    NewMDrama = case PlayL of
		  [Id | _] ->
		      NewDoL = [Drama
				|| Drama = #drama{id = DoId} <- DoL,
				   Id =:= DoId],
		      NewCombatDoL = [Drama
				      || Drama = #drama{id = DoId} <- CombatDoL,
					 Id =:= DoId],
		      [combat_drama:gm_finish(Role, DoId)
		       || #drama{id = DoId} <- CombatDoL, Id =/= DoId],
		      OpenList = drama_data:open_list() -- FinishL -- [Id],
		      NewFinL = FinishL ++ OpenList,
		      MDrama#m_drama{play_list = [Id], do_list = NewDoL,
				     finished = NewFinL,
				     combat_list = NewCombatDoL,
				     guide_list = []};
		  _ ->
		      [combat_drama:gm_finish(Role, DoId)
		       || #drama{id = DoId} <- CombatDoL],
		      OpenList = drama_data:open_list() -- FinishL,
		      NewFinL = FinishL ++ OpenList,
		      MDrama#m_drama{play_list = [], do_list = [],
				     finished = NewFinL, combat_list = [],
				     guide_list = []}
		end,
    Role#role{m_drama = NewMDrama};
gm_skip_all(Role) -> Role.

init() -> #m_drama{}.

login(#role{platform = <<"verifyios">>}) -> ok;
login(Role) ->
    ResetRole = #role{m_drama = #m_drama{do_list = DoL}} =
		    reset(Role),
    NRole = set_trigger(DoL, ResetRole),
    set_login_drama(NRole),
    {ok, NRole}.

set_login_drama(#role{m_drama =
			  #m_drama{guide_list = [{GuideId, _, _}]}}) ->
    put(login_guide_id, GuideId);
set_login_drama(_) -> ok.

-spec level_up(OldRole :: #role{}, #role{}) -> {ok,
						#role{}}.

level_up(_OldRole, #role{platform = <<"verifyios">>}) ->
    ok;
level_up(OldRole, Role = #role{}) ->
    OpenIds = drama_data:open_list(),
    NRole = levup_open(OpenIds, OldRole, Role),
    {ok, NRole}.

levup_open([], _OldRole, Role) -> Role;
levup_open([Id | T], OldRole = #role{lev = OldLev},
	   Role = #role{lev = Lev}) ->
    case drama_data:get(Id) of
      Data = #drama_data{lev = LevCfg}
	  when Lev >= LevCfg andalso LevCfg > OldLev ->
	  NewRole = add_drama(Role, Data),
	  levup_open(T, OldRole, NewRole);
      _ -> levup_open(T, OldRole, Role)
    end.

-spec ready(#role{}) -> {ok, #role{}}.

ready(Role = #role{platform = <<"verifyios">>}) ->
    {ok, Role};
ready(Role = #role{m_drama =
		       #m_drama{obj_list = ObjList, do_list = DoL,
				combat_list = CombatDoL}}) ->
    drama_quest:send_drama_obj_act(Role, ObjList),
    InitRole = init_client_play(DoL ++ CombatDoL, Role),
    FireRole = role_trigger:fire([#evt_cli_loaded{},
				  #r_evt_role_register_days{}],
				 InitRole),
    {ok, FireRole1} = holiday_lucky_dog_lib:fire(FireRole,
						 evt_cli_loaded, 0),
    NewRole = #role{m_drama =
			MDrama = #m_drama{guide_list = GuideList}} =
		  reset_status(FireRole1),
    NewGuideList = [Guide
		    || Guide <- GuideList,
		       drama_cond:check_guide_cond(element(1, Guide), Role)],
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddrama173, _, {__Leveldrama173, __Tracesdrama173}}
	  when __Leveldrama173 band 128 /= 0 orelse
		 __Tracesdrama173 /= [] ->
	  lager:do_log(debug,
		       [{module, drama}, {function, ready}, {line, 173},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]需要播放引导:~w",
				     [Role#role.name, NewGuideList]),
		       none, 4096, 128, __Leveldrama173, __Tracesdrama173,
		       lager_event, __Piddrama173);
      _ -> ok
    end,
    NRole = finish_guide(GuideList -- NewGuideList,
			 NewRole#role{m_drama =
					  MDrama#m_drama{guide_list =
							     NewGuideList}},
			 <<"登录条件检查"/utf8>>),
    {ok, play_next(NRole)}.

init_client_play([], Role) -> Role;
init_client_play([_Drama = #drama{id = Id,
				  act_idx = ActIdx}
		  | T],
		 Role = #role{m_drama =
				  MDrama = #m_drama{play_list = PlayList,
						    do_list = DoL,
						    combat_list = CombatDoL}})
    when ActIdx > 0 ->
    case drama_data:get(Id) of
      Data = #drama_data{offline = _OffLine} ->
	  NRole = play(Data, Role, ActIdx, 999, true),
	  init_client_play(T, NRole);
      _ ->
	  Rest = lists:delete(Id, PlayList),
	  NewDoL = lists:keydelete(Id, #drama.id, DoL),
	  NewCombatDoL = lists:keydelete(Id, #drama.id,
					 CombatDoL),
	  NewMDrama = MDrama#m_drama{do_list = NewDoL,
				     combat_list = NewCombatDoL,
				     play_list = Rest},
	  NewRole = Role#role{m_drama = NewMDrama},
	  init_client_play(T, NewRole)
    end;
init_client_play([_ | T], Role) ->
    init_client_play(T, Role).

-spec skip(Role :: #role{},
	   DramaBid :: pos_integer()) -> ok | {ok, #role{}} |
					 {false, Msg :: binary()}.

skip(Role = #role{m_drama =
		      #m_drama{play_list = [DramaBid | _], do_list = DoL,
			       combat_list = CombatDoL}},
     DramaBid) ->
    case drama_data:get(DramaBid) of
      Data = #drama_data{is_skip = 1} ->
	  List = case is_combat_drama(Data) of
		   false -> DoL;
		   true -> CombatDoL
		 end,
	  case lists:keyfind(DramaBid, #drama.id, List) of
	    #drama{} -> NewRole = finish(Role, Data), {ok, NewRole};
	    _ ->
		{false,
		 lang:get(<<"Không tìm thấy cốt truyện mà bạn muốn "
			    "bỏ qua"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Cốt truyện không thể bỏ qua"/utf8>>)}
    end;
skip(_Role, _DramaBid) ->
    {false,
     lang:get(<<"Cốt truyện này chưa được chơi và không "
		"thể bỏ qua"/utf8>>)}.

-spec exec_act(#role{}, tuple() | list()) -> {ok,
					      #role{}}.

exec_act(Role, Acts) -> exec_act(Role, Acts, true).

exec_act(Role, Acts, Push) ->
    drama_act:reset_act_play_list(),
    NRole = drama_act:do(Acts, Role),
    send_to_client(#drama_data{}, NRole, Push),
    {ok, NRole}.

-spec event(Evt :: tuple(), #role{},
	    DramaId :: pos_integer()) -> ok | remove |
					 {remove, #role{}} | {ok, #role{}}.

event(_Evt, #role{misc = #role_misc{self_charge = 1}},
      _Id) ->
    remove;
event(Evt,
      Role = #role{m_drama =
		       MDrama = #m_drama{do_list = DoL, play_list = PlayL}},
      Id) ->
    case lists:keyfind(Id, #drama.id, DoL) of
      #drama{act_idx = ActIdx} when ActIdx > 0 -> ok;
      Drama = #drama{num = Num} ->
	  case drama_data:get(Id) of
	    #drama_data{act_cond = ActCond, num = MaxNum}
		when Num < MaxNum orelse MaxNum =:= 0 ->
		case drama_cond:check(ActCond, Evt, Role) of
		  true ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Piddrama243, _, {__Leveldrama243, __Tracesdrama243}}
			    when __Leveldrama243 band 128 /= 0 orelse
				   __Tracesdrama243 /= [] ->
			    lager:do_log(debug,
					 [{module, drama}, {function, event},
					  {line, 243},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[~ts]【剧情】[Evt:~w][Cond:~w]===========> "
						       "[Id:~w]",
						       [Role#role.name, Evt,
							ActCond, Id]),
					 none, 4096, 128, __Leveldrama243,
					 __Tracesdrama243, lager_event,
					 __Piddrama243);
			_ -> ok
		      end,
		      NewPlayL = PlayL ++ [Id],
		      NewDoL = lists:keyreplace(Id, #drama.id, DoL,
						Drama#drama{act_idx = 1,
							    num = Num + 1}),
		      NewMDrama = MDrama#m_drama{play_list = NewPlayL,
						 do_list = NewDoL},
		      NewRole = Role#role{m_drama = NewMDrama},
		      case PlayL of
			[] -> {remove, play_next(NewRole)};
			_ -> {remove, NewRole}
		      end;
		  false -> ok
		end;
	    #drama{} -> remove;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Piddrama261, _, {__Leveldrama261, __Tracesdrama261}}
		      when __Leveldrama261 band 8 /= 0 orelse
			     __Tracesdrama261 /= [] ->
		      lager:do_log(error,
				   [{module, drama}, {function, event},
				    {line, 261}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]不存在的剧情配置[Id:~w]",
						 [Role#role.name, Id]),
				   none, 4096, 8, __Leveldrama261,
				   __Tracesdrama261, lager_event,
				   __Piddrama261);
		  _ -> ok
		end,
		remove
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
	    {__Piddrama265, _, {__Leveldrama265, __Tracesdrama265}}
		when __Leveldrama265 band 128 /= 0 orelse
		       __Tracesdrama265 /= [] ->
		lager:do_log(debug,
			     [{module, drama}, {function, event}, {line, 265},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]此触发器事件可能已完成 已经不在当前进行触发器列表中[Id:~w]",
					   [Role#role.name, Id]),
			     none, 4096, 128, __Leveldrama265, __Tracesdrama265,
			     lager_event, __Piddrama265);
	    _ -> ok
	  end,
	  remove
    end;
event(_Evt, _Role, _Id) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddrama269, _, {__Leveldrama269, __Tracesdrama269}}
	  when __Leveldrama269 band 128 /= 0 orelse
		 __Tracesdrama269 /= [] ->
	  lager:do_log(debug,
		       [{module, drama}, {function, event}, {line, 269},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]未加载完成时触发[Evt:~w]剧情[Id:~w]，不进行处理",
				     [_Role#role.name, _Evt, _Id]),
		       none, 4096, 128, __Leveldrama269, __Tracesdrama269,
		       lager_event, __Piddrama269);
      _ -> ok
    end,
    ok.

client_play(Role = #role{m_drama =
			     #m_drama{play_list = []}},
	    _DramaId, _Step) ->
    Role;
client_play(Role = #role{m_drama =
			     #m_drama{play_list = [DramaId | _Rest],
				      do_list = DoL, combat_list = CombatDoL}},
	    DramaId, Step) ->
    case drama_data:get(DramaId) of
      DramaData = #drama_data{} ->
	  List = case is_combat_drama(DramaData) of
		   false -> DoL;
		   true -> CombatDoL
		 end,
	  case lists:keyfind(DramaId, #drama.id, List) of
	    #drama{act_idx = Step} ->
		case DramaId of
		  10008 when Step == 1 ->
		      log:save(task,
			       {Role, 0, DramaId, integer_to_binary(DramaId),
				113, <<"剧情id"/utf8>>, <<"触发开场介绍"/utf8>>});
		  _ -> skip
		end,
		play(DramaData, Role, Step, 1, false);
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Piddrama293, _, {__Leveldrama293, __Tracesdrama293}}
		      when __Leveldrama293 band 8 /= 0 orelse
			     __Tracesdrama293 /= [] ->
		      lager:do_log(error,
				   [{module, drama}, {function, client_play},
				    {line, 293}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]播放剧情异常[DramaId:~w][Step:~w][Err:~w]",
						 [Role#role.name, DramaId, Step,
						  Err]),
				   none, 4096, 8, __Leveldrama293,
				   __Tracesdrama293, lager_event,
				   __Piddrama293);
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
	    {__Piddrama297, _, {__Leveldrama297, __Tracesdrama297}}
		when __Leveldrama297 band 8 /= 0 orelse
		       __Tracesdrama297 /= [] ->
		lager:do_log(error,
			     [{module, drama}, {function, client_play},
			      {line, 297}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]没有对应的剧情[DramaId:~w]配置",
					   [Role#role.name, DramaId]),
			     none, 4096, 8, __Leveldrama297, __Tracesdrama297,
			     lager_event, __Piddrama297);
	    _ -> ok
	  end,
	  Role
    end;
client_play(Role = #role{m_drama =
			     #m_drama{play_list = PlayL}},
	    DramaId, _Step) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddrama301, _, {__Leveldrama301, __Tracesdrama301}}
	  when __Leveldrama301 band 8 /= 0 orelse
		 __Tracesdrama301 /= [] ->
	  lager:do_log(error,
		       [{module, drama}, {function, client_play}, {line, 301},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]开始播放剧情错误[DramaId:~w][PlayL:~w]",
				     [Role#role.name, DramaId, PlayL]),
		       none, 4096, 8, __Leveldrama301, __Tracesdrama301,
		       lager_event, __Piddrama301);
      _ -> ok
    end,
    Role.

play(#drama_data{act = ActL, bid = DramaBid}, Role,
     Step, _LimitStep, _IsSkip)
    when length(ActL) < Step orelse Step =:= 0 ->
    finish(Role, drama_data:get(DramaBid));
play(Data = #drama_data{act = ActL}, Role, Step,
     LimitStep, _IsSkip) ->
    Size = length(ActL),
    drama_act:reset_act_play_list(),
    PlayRole = do_play(Data, Role, Step, Size, LimitStep),
    send_to_client(Data, PlayRole, true),
    case Step + LimitStep > Size + 1 orelse Step =:= 0 of
      true -> finish(PlayRole, Data);
      _ -> inc_drama_step(PlayRole, Data, Step)
    end;
play(_Data, Role, _Step, _Num, _IsSkip) -> Role.

do_play(Data = #drama_data{act = ActL}, Role, Step,
	Size, Num)
    when Size >= Step andalso Num > 0 andalso Step > 0 ->
    Act = lists:nth(Step, ActL),
    NRole = drama_act:do(Act, Role),
    do_play(Data, NRole, Step + 1, Size, Num - 1);
do_play(_Data, Role, _Step, _Size, _Num) -> Role.

-spec set_trigger(DramaId :: pos_integer() |
			     #drama_data{} | [#drama{}],
		  #role{}) -> #role{}.

set_trigger([], Role) -> Role;
set_trigger([#drama{id = Id} | T], Role) ->
    NRole = set_trigger(Id, Role), set_trigger(T, NRole);
set_trigger(#drama_data{bid = Bid, event = undefined},
	    Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddrama335, _, {__Leveldrama335, __Tracesdrama335}}
	  when __Leveldrama335 band 8 /= 0 orelse
		 __Tracesdrama335 /= [] ->
	  lager:do_log(error,
		       [{module, drama}, {function, set_trigger}, {line, 335},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]未定义剧情[Id:~w]触发条件",
				     [Role#role.name, Bid]),
		       none, 4096, 8, __Leveldrama335, __Tracesdrama335,
		       lager_event, __Piddrama335);
      _ -> ok
    end,
    Role;
set_trigger(#drama_data{bid = Id, event = Label},
	    Role) ->
    Tri = #trigger{label = Label, m = drama, f = event,
		   a = [Id]},
    {_, NewRole} = role_trigger:add(Tri, Role),
    NewRole;
set_trigger(Id, Role) ->
    case drama_data:get(Id) of
      Data = #drama_data{} ->
	  case is_combat_drama(Data) of
	    false -> set_trigger(Data, Role);
	    true -> Role
	  end;
      _ -> Role
    end.

reset(Role) ->
    Role1 = reset_doing(Role),
    Role2 = reset_combat(Role1),
    Role3 = reset_open(Role2),
    Role4 = reset_play(Role3),
    Role5 = drama_quest:login(Role4),
    NRole = Role5,
    reset_status(NRole).

reset_doing(Role = #role{m_drama =
			     #m_drama{do_list = DoL}}) ->
    do_reset_doing(DoL, Role).

do_reset_doing([], Role) -> Role;
do_reset_doing([Drama = #drama{id = Id, num = _Num,
			       act_idx = ActIdx}
		| T],
	       Role = #role{m_drama =
				MDrama = #m_drama{play_list = [Id | PlayList],
						  finished = _FinL,
						  do_list = DoL}})
    when ActIdx > 0 ->
    case drama_data:get(Id) of
      #drama_data{offline = OffLine, act = _Acts,
		  num = _MaxNum} ->
	  if OffLine =:= 2 ->
		 NewDoL = lists:keystore(Id, #drama.id, DoL,
					 Drama#drama{act_idx = 1}),
		 NRole = Role#role{m_drama =
				       MDrama#m_drama{do_list = NewDoL}},
		 do_reset_doing(T, NRole);
	     true -> do_reset_doing(T, Role)
	  end;
      _ ->
	  do_reset_doing(T,
			 Role#role{m_drama =
				       MDrama#m_drama{do_list =
							  lists:keydelete(Id,
									  #drama.id,
									  DoL),
						      play_list = PlayList}})
    end;
do_reset_doing([#drama{id = Id} | T],
	       Role = #role{m_drama =
				MDrama = #m_drama{do_list = DoL,
						  play_list = PlayList}}) ->
    case drama_data:get(Id) of
      #drama_data{is_open = 1} -> do_reset_doing(T, Role);
      _ ->
	  do_reset_doing(T,
			 Role#role{m_drama =
				       MDrama#m_drama{do_list =
							  lists:keydelete(Id,
									  #drama.id,
									  DoL),
						      play_list =
							  lists:delete(Id,
								       PlayList)}})
    end.

reset_combat(Role = #role{m_drama =
			      #m_drama{combat_list = DoL}}) ->
    do_reset_combat(DoL, Role).

do_reset_combat([],
		Role = #role{m_drama =
				 MDrama = #m_drama{combat_list = CombatDoL,
						   play_list = PlayL}}) ->
    DramaIds = [DramaId
		|| #drama{id = DramaId} <- CombatDoL],
    NewPlayL = PlayL -- DramaIds,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddrama397, _, {__Leveldrama397, __Tracesdrama397}}
	  when __Leveldrama397 band 128 /= 0 orelse
		 __Tracesdrama397 /= [] ->
	  lager:do_log(debug,
		       [{module, drama}, {function, do_reset_combat},
			{line, 397}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts] ====> 检查战斗正在进行的剧情[CombatDoL:~w][PlayL:~w]",
				     [Role#role.name, CombatDoL, PlayL]),
		       none, 4096, 128, __Leveldrama397, __Tracesdrama397,
		       lager_event, __Piddrama397);
      _ -> ok
    end,
    NewMDrama = MDrama#m_drama{play_list = NewPlayL},
    Role#role{m_drama = NewMDrama};
do_reset_combat([Drama = #drama{id = Id,
				act_idx = ActIdx, num = Num}
		 | T],
		Role = #role{m_drama =
				 MDrama = #m_drama{combat_list = CombatDoL,
						   play_list = PlayL,
						   finished = Finished}}) ->
    case drama_data:get(Id) of
      #drama_data{is_open = 1, offline = 2, num = MaxNum}
	  when ActIdx > 0 andalso MaxNum > Num ->
	  NewCombatDoL = lists:keyreplace(Id, #drama.id,
					  CombatDoL, Drama#drama{act_idx = 0}),
	  NewPlayL = lists:delete(Id, PlayL),
	  NewMDrama = MDrama#m_drama{combat_list = NewCombatDoL,
				     play_list = NewPlayL},
	  do_reset_combat(T, Role#role{m_drama = NewMDrama});
      #drama_data{is_open = 1} when ActIdx > 0 ->
	  NewCombatDoL = lists:keydelete(Id, #drama.id,
					 CombatDoL),
	  NewPlayL = lists:delete(Id, PlayL),
	  NewMDrama = MDrama#m_drama{combat_list = NewCombatDoL,
				     play_list = NewPlayL,
				     finished =
					 [Id | lists:delete(Id, Finished)]},
	  do_reset_combat(T, Role#role{m_drama = NewMDrama});
      #drama_data{is_open = 1} ->
	  NewPlayL = lists:delete(Id, PlayL),
	  NewMDrama = MDrama#m_drama{play_list = NewPlayL},
	  do_reset_combat(T, Role#role{m_drama = NewMDrama});
      _ ->
	  NewCombatDoL = lists:keydelete(Id, #drama.id,
					 CombatDoL),
	  NewPlayL = lists:delete(Id, PlayL),
	  NewMDrama = MDrama#m_drama{play_list = NewPlayL,
				     combat_list = NewCombatDoL},
	  do_reset_combat(T, Role#role{m_drama = NewMDrama})
    end.

reset_play(Role = #role{m_drama =
			    MDrama = #m_drama{play_list = PlayL,
					      do_list = DoL}}) ->
    NowL = [Id
	    || #drama{id = Id, act_idx = ActIdx} <- DoL,
	       ActIdx > 0],
    PlayL0 = [Id || Id <- PlayL, lists:member(Id, NowL)],
    NewPlayL = PlayL0 ++ NowL -- PlayL,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddrama428, _, {__Leveldrama428, __Tracesdrama428}}
	  when __Leveldrama428 band 128 /= 0 orelse
		 __Tracesdrama428 /= [] ->
	  lager:do_log(debug,
		       [{module, drama}, {function, reset_play}, {line, 428},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]重置正在播放的剧情===========[Play:~w]",
				     [Role#role.name, NewPlayL]),
		       none, 4096, 128, __Leveldrama428, __Tracesdrama428,
		       lager_event, __Piddrama428);
      _ -> ok
    end,
    Role#role{m_drama =
		  MDrama#m_drama{play_list = NewPlayL}}.

reset_open(Role) ->
    OpenIds = drama_data:open_list(),
    do_reset_open(OpenIds, Role).

do_reset_open([], Role) -> Role;
do_reset_open([Id | T], Role = #role{lev = Lev}) ->
    case drama_data:get(Id) of
      Data = #drama_data{lev = NeedLev} when Lev >= NeedLev ->
	  case add(Role, Data) of
	    {ok, NRole} -> do_reset_open(T, NRole);
	    _ -> do_reset_open(T, Role)
	  end;
      _ -> do_reset_open(T, Role)
    end.

-spec reset_status(#role{}) -> #role{}.

reset_status(Role = #role{status = 0,
			  m_drama = #m_drama{play_list = [_ | _]}}) ->
    Role#role{status = 3};
reset_status(Role = #role{status = 3,
			  m_drama = #m_drama{play_list = []}}) ->
    Role#role{status = 0};
reset_status(Role) -> Role.

add_drama(Role, Data) ->
    case add(Role, Data) of
      {ok, AddRole} -> set_trigger(Data, AddRole);
      _ -> Role
    end.

-spec add(#role{},
	  pos_integer() | #drama_data{}) -> {ok, #role{}}.

add(Role = #role{m_drama =
		     MDrama = #m_drama{finished = FinL,
				       combat_list = CombatDoL, do_list = DoL}},
    Data = #drama_data{bid = Id}) ->
    case lists:member(Id, FinL) of
      false ->
	  case is_combat_drama(Data) of
	    false ->
		case lists:keyfind(Id, #drama.id, DoL) of
		  false ->
		      NewDoL = [#drama{id = Id} | DoL],
		      NewMDrama = MDrama#m_drama{do_list = NewDoL},
		      {ok, Role#role{m_drama = NewMDrama}};
		  _ -> false
		end;
	    true ->
		case lists:keyfind(Id, #drama.id, CombatDoL) of
		  false ->
		      NewCombatDoL = [#drama{id = Id} | CombatDoL],
		      NewMDrama = MDrama#m_drama{combat_list = NewCombatDoL},
		      {ok, Role#role{m_drama = NewMDrama}};
		  _ -> false
		end
	  end;
      _ -> false
    end.

-spec get_obj(#role{}, Type :: pos_integer(),
	      Bid :: pos_integer()) -> {ok, #drama_obj{}} |
				       {error, bitstring()}.

get_obj(#role{m_drama = #m_drama{obj_list = ObjList}},
	_Type, BaseId) ->
    case lists:keyfind(BaseId, #drama_obj.base_id, ObjList)
	of
      Obj = #drama_obj{} -> {ok, Obj};
      _ -> {error, lang:get(<<"Đơn vị không tồn tại"/utf8>>)}
    end.

append_play(_Role, []) -> ok;
append_play(Role = #role{m_drama =
			     #m_drama{play_list = PlayL}},
	    DramaIds) ->
    case do_append_play(Role, DramaIds) of
      {ok,
       NewRole = #role{m_drama =
			   #m_drama{play_list = [DramaId | _]}}} ->
	  case drama_data:get(DramaId) of
	    Data = #drama_data{act = [{play_guide, _}]} ->
		NRole = finish(NewRole, Data), {ok, NRole};
	    _ ->
		case PlayL of
		  [] -> trigger_send(NewRole, DramaId);
		  _ -> skip
		end,
		{ok, NewRole}
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
	    {__Piddrama527, _, {__Leveldrama527, __Tracesdrama527}}
		when __Leveldrama527 band 8 /= 0 orelse
		       __Tracesdrama527 /= [] ->
		lager:do_log(error,
			     [{module, drama}, {function, append_play},
			      {line, 527}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]无法添加战斗播放剧情:~w",
					   [Role#role.name, DramaIds]),
			     none, 4096, 8, __Leveldrama527, __Tracesdrama527,
			     lager_event, __Piddrama527);
	    _ -> ok
	  end,
	  ok
    end.

do_append_play(Role, []) -> {ok, Role};
do_append_play(Role = #role{m_drama =
				MDrama = #m_drama{play_list = PlayL,
						  combat_list = CombatDoL}},
	       [DramaId | Rest]) ->
    case lists:keyfind(DramaId, #drama.id, CombatDoL) of
      Drama = #drama{num = Num, act_idx = 0} ->
	  case drama_data:get(DramaId) of
	    #drama_data{num = _MaxNum} ->
		NewCombatDoL = lists:keyreplace(DramaId, #drama.id,
						CombatDoL,
						Drama#drama{act_idx = 1,
							    num = Num + 1}),
		NewMDrama = MDrama#m_drama{play_list =
					       PlayL ++ [DramaId],
					   combat_list = NewCombatDoL},
		NewRole = Role#role{m_drama = NewMDrama},
		do_append_play(NewRole, Rest);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Piddrama546, _, {__Leveldrama546, __Tracesdrama546}}
		      when __Leveldrama546 band 8 /= 0 orelse
			     __Tracesdrama546 /= [] ->
		      lager:do_log(error,
				   [{module, drama}, {function, do_append_play},
				    {line, 546}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]无法找到战斗播放剧情的配置:~w",
						 [Role#role.name, DramaId]),
				   none, 4096, 8, __Leveldrama546,
				   __Tracesdrama546, lager_event,
				   __Piddrama546);
		  _ -> ok
		end,
		ok
	  end;
      Data = #drama{} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddrama550, _, {__Leveldrama550, __Tracesdrama550}}
		when __Leveldrama550 band 8 /= 0 orelse
		       __Tracesdrama550 /= [] ->
		lager:do_log(error,
			     [{module, drama}, {function, do_append_play},
			      {line, 550}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]触发已播放的战斗剧情:~w",
					   [Role#role.name, Data]),
			     none, 4096, 8, __Leveldrama550, __Tracesdrama550,
			     lager_event, __Piddrama550);
	    _ -> ok
	  end,
	  ok;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddrama553, _, {__Leveldrama553, __Tracesdrama553}}
		when __Leveldrama553 band 8 /= 0 orelse
		       __Tracesdrama553 /= [] ->
		lager:do_log(error,
			     [{module, drama}, {function, do_append_play},
			      {line, 553}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]无法添加战斗播放剧情:~w",
					   [Role#role.name, DramaId]),
			     none, 4096, 8, __Leveldrama553, __Tracesdrama553,
			     lager_event, __Piddrama553);
	    _ -> ok
	  end,
	  ok
    end.

trigger_send(Role = #role{is_ready = 1}, DramaId) ->
    case DramaId == drama_data:get_const(delay_drama_id) of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddrama561, _, {__Leveldrama561, __Tracesdrama561}}
		when __Leveldrama561 band 128 /= 0 orelse
		       __Tracesdrama561 /= [] ->
		lager:do_log(debug,
			     [{module, drama}, {function, trigger_send},
			      {line, 561}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]触发剧情协议1秒后发送[Id:~w]",
					   [Role#role.name, DramaId]),
			     none, 4096, 128, __Leveldrama561, __Tracesdrama561,
			     lager_event, __Piddrama561);
	    _ -> ok
	  end,
	  erlang:send_after(1500, self(),
			    {apply_async, {drama, trigger_send2, [DramaId]}}),
	  ok;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddrama565, _, {__Leveldrama565, __Tracesdrama565}}
		when __Leveldrama565 band 128 /= 0 orelse
		       __Tracesdrama565 /= [] ->
		lager:do_log(debug,
			     [{module, drama}, {function, trigger_send},
			      {line, 565}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]触发剧情协议发送[Id:~w]",
					   [Role#role.name, DramaId]),
			     none, 4096, 128, __Leveldrama565, __Tracesdrama565,
			     lager_event, __Piddrama565);
	    _ -> ok
	  end,
	  role:pack_send(proxy, Role#role.pid, 11101, {DramaId})
    end;
trigger_send(_Role, _DramaId) -> ok.

trigger_send2(Role, DramaId) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddrama571, _, {__Leveldrama571, __Tracesdrama571}}
	  when __Leveldrama571 band 128 /= 0 orelse
		 __Tracesdrama571 /= [] ->
	  lager:do_log(debug,
		       [{module, drama}, {function, trigger_send2},
			{line, 571}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]触发剧情协议发送[Id:~w]",
				     [Role#role.name, DramaId]),
		       none, 4096, 128, __Leveldrama571, __Tracesdrama571,
		       lager_event, __Piddrama571);
      _ -> ok
    end,
    role:pack_send(proxy, Role#role.pid, 11101, {DramaId}),
    {ok, Role}.

inc_drama_step(Role = #role{m_drama =
				MDrama = #m_drama{do_list = DoL,
						  combat_list = CombatDoL}},
	       Data = #drama_data{bid = DramaBid}, Step) ->
    case is_combat_drama(Data) of
      false ->
	  case lists:keyfind(DramaBid, #drama.id, DoL) of
	    Drama = #drama{} ->
		NewDrama = Drama#drama{act_idx = Step + 1},
		NewDoL = lists:keyreplace(DramaBid, #drama.id, DoL,
					  NewDrama),
		Role#role{m_drama = MDrama#m_drama{do_list = NewDoL}};
	    _ -> Role
	  end;
      true ->
	  case lists:keyfind(DramaBid, #drama.id, CombatDoL) of
	    Drama = #drama{} ->
		NewDrama = Drama#drama{act_idx = Step + 1},
		NewCombatDoL = lists:keyreplace(DramaBid, #drama.id,
						CombatDoL, NewDrama),
		Role#role{m_drama =
			      MDrama#m_drama{combat_list = NewCombatDoL}};
	    _ -> Role
	  end
    end.

finish(Role = #role{m_drama =
			MDrama = #m_drama{play_list = PlayL, finished = FinL,
					  do_list = DoL,
					  combat_list = CombatDoL}},
       Data = #drama_data{bid = DramaId, act = Acts}) ->
    NewFinL = [DramaId | lists:delete(DramaId, FinL)],
    NewPlayL = lists:delete(DramaId, PlayL),
    Role1 = case is_combat_drama(Data) of
	      false ->
		  NewDoL = redo(Data, DoL),
		  add_guide(Role#role{m_drama =
					  MDrama#m_drama{finished = NewFinL,
							 play_list = NewPlayL,
							 do_list = NewDoL}},
			    lists:reverse(Acts));
	      true ->
		  NewCombatDoL = redo(Data, CombatDoL),
		  combat_drama:drama_finish(Role, DramaId),
		  Role#role{m_drama =
				MDrama#m_drama{finished = NewFinL,
					       play_list = NewPlayL,
					       combat_list = NewCombatDoL}}
	    end,
    DramaRole = Role1,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddrama616, _, {__Leveldrama616, __Tracesdrama616}}
	  when __Leveldrama616 band 128 /= 0 orelse
		 __Tracesdrama616 /= [] ->
	  lager:do_log(debug,
		       [{module, drama}, {function, finish}, {line, 616},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]=========>动作执行完成~w",
				     [Role#role.name, DramaId]),
		       none, 4096, 128, __Leveldrama616, __Tracesdrama616,
		       lager_event, __Piddrama616);
      _ -> ok
    end,
    Evt = #evt_broadcast_drama{base_id = DramaId},
    FireRole = role_trigger:fire(Evt, DramaRole),
    case DramaId of
      10010 -> role_lib:push_setname(FireRole);
      10008 ->
	  log:save(task,
		   {Role, 1, DramaId, integer_to_binary(DramaId), 113,
		    <<"剧情id"/utf8>>, <<"触发开场介绍"/utf8>>});
      _ -> skip
    end,
    play_next(FireRole).

add_guide(Role = #role{lev = Lev,
		       m_drama = MDrama = #m_drama{guide_list = GuideList}},
	  [{play_guide, GuideId} | _]) ->
    case drama_cond:check_guide_tri_cond(GuideId, Role) of
      true ->
	  case get(skip_guide) of
	    1 ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Piddrama632, _, {__Leveldrama632, __Tracesdrama632}}
		      when __Leveldrama632 band 128 /= 0 orelse
			     __Tracesdrama632 /= [] ->
		      lager:do_log(debug,
				   [{module, drama}, {function, add_guide},
				    {line, 632}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("~ts 引导跳过[~w],直接完成",
						 [Role#role.name, GuideId]),
				   none, 4096, 128, __Leveldrama632,
				   __Tracesdrama632, lager_event,
				   __Piddrama632);
		  _ -> ok
		end,
		role_trigger:fire(#evt_finish_guide{base_id = GuideId},
				  Role);
	    _ ->
		case GuideList of
		  [] ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Piddrama636, _, {__Leveldrama636, __Tracesdrama636}}
			    when __Leveldrama636 band 128 /= 0 orelse
				   __Tracesdrama636 /= [] ->
			    lager:do_log(debug,
					 [{module, drama},
					  {function, add_guide}, {line, 636},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~ts=========播放引导:~w",
						       [Role#role.name,
							GuideId]),
					 none, 4096, 128, __Leveldrama636,
					 __Tracesdrama636, lager_event,
					 __Piddrama636);
			_ -> ok
		      end;
		  _ ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Piddrama637, _, {__Leveldrama637, __Tracesdrama637}}
			    when __Leveldrama637 band 8 /= 0 orelse
				   __Tracesdrama637 /= [] ->
			    lager:do_log(error,
					 [{module, drama},
					  {function, add_guide}, {line, 637},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("~ts=========播放引导:~w GuileList:~w",
						       [Role#role.name, GuideId,
							GuideList]),
					 none, 4096, 8, __Leveldrama637,
					 __Tracesdrama637, lager_event,
					 __Piddrama637);
			_ -> ok
		      end
		end,
		NRole = Role#role{m_drama =
				      MDrama#m_drama{guide_list =
							 [{GuideId, 0,
							   date:unixtime()}]}},
		log:save(task,
			 {NRole, 0, GuideId, integer_to_binary(GuideId), 99,
			  <<"引导"/utf8>>, util:fbin("lev:~w", [Lev])}),
		finish_guide(GuideList, NRole,
			     util:fbin(<<"播放下一引导:~w"/utf8>>, [GuideId]))
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
	    {__Piddrama644, _, {__Leveldrama644, __Tracesdrama644}}
		when __Leveldrama644 band 8 /= 0 orelse
		       __Tracesdrama644 /= [] ->
		lager:do_log(error,
			     [{module, drama}, {function, add_guide},
			      {line, 644}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~ts 引导[~w]触发条件不足,直接完成:~w",
					   [Role#role.name, GuideId, _Err]),
			     none, 4096, 8, __Leveldrama644, __Tracesdrama644,
			     lager_event, __Piddrama644);
	    _ -> ok
	  end,
	  role_trigger:fire(#evt_finish_guide{base_id = GuideId},
			    Role)
    end;
add_guide(Role, _) -> Role.

play_next(Role = #role{m_drama =
			   #m_drama{play_list = [NextId | _T]}}) ->
    case drama_data:get(NextId) of
      Data = #drama_data{act = []} -> finish(Role, Data);
      Data = #drama_data{act = [{play_guide, _GuideId}]} ->
	  finish(Role, Data);
      _Data -> trigger_send(Role, NextId), Role
    end;
play_next(Role = #role{m_drama =
			   #m_drama{guide_list = [{GuideId, N, _Time} | _]}}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddrama662, _, {__Leveldrama662, __Tracesdrama662}}
	  when __Leveldrama662 band 128 /= 0 orelse
		 __Tracesdrama662 /= [] ->
	  lager:do_log(debug,
		       [{module, drama}, {function, play_next}, {line, 662},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~ts 通知客户端播放引导:~w n:~w",
				     [Role#role.name, GuideId, N]),
		       none, 4096, 128, __Leveldrama662, __Tracesdrama662,
		       lager_event, __Piddrama662);
      _ -> ok
    end,
    sys_conn:pack_send(11120, {GuideId, N}),
    Role;
play_next(Role) -> reset_status(Role).

redo(#drama_data{bid = DramaId, num = MaxNum}, DoL) ->
    case lists:keyfind(DramaId, #drama.id, DoL) of
      Drama = #drama{num = Num}
	  when Num < MaxNum andalso MaxNum > 1 ->
	  NewDrama = Drama#drama{act_idx = 0},
	  lists:keyreplace(DramaId, #drama.id, DoL, NewDrama);
      #drama{} -> lists:keydelete(DramaId, #drama.id, DoL);
      _ -> DoL
    end.

send_to_client(#drama_data{bid = Id}, Role, true) ->
    case drama_act:get_act_play_list() of
      [] -> skip;
      L ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddrama685, _, {__Leveldrama685, __Tracesdrama685}}
		when __Leveldrama685 band 128 /= 0 orelse
		       __Tracesdrama685 /= [] ->
		lager:do_log(debug,
			     [{module, drama}, {function, send_to_client},
			      {line, 685}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts] 推送本次播报剧情", [Role#role.name]),
			     none, 4096, 128, __Leveldrama685, __Tracesdrama685,
			     lager_event, __Piddrama685);
	    _ -> ok
	  end,
	  role:pack_send(Role, 11110, {Id, L})
    end;
send_to_client(_Data, _Role, _IsPush) -> skip.

is_combat_drama(#drama_data{event = Label}) ->
    Label =:= evt_combat_drama;
is_combat_drama(DramaId) ->
    case drama_data:get(DramaId) of
      Data = #drama_data{} -> is_combat_drama(Data);
      _ -> false
    end.

finish_guide([], Role, _Reason) -> Role;
finish_guide([Guide | T], Role, Reason) ->
    GuideId = element(1, Guide),
    NRole = role_trigger:fire(#evt_finish_guide{base_id =
						    GuideId},
			      Role),
    log:save(task,
	     {NRole, 1, GuideId, integer_to_binary(GuideId), 99,
	      <<"引导"/utf8>>}),
    finish_guide(T, NRole, Reason).


