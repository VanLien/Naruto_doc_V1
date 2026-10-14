-file("src/mod/holiday/holiday_rule_rank.erl", 1).

-module(holiday_rule_rank).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{adventure_data, [id, room, name, lose]},
		{a_room,
		 [id, idx, evt_id, res_id, status, cond_status, lock,
		  init_evt_id, ext]},
		{m_adventure,
		 [ver, pass_id, pass_num, explore_num, id, room,
		  first_room, boss_room, room_list, buff_list, shop_list,
		  start_time, end_time, plist, is_kill_boss, init_time,
		  skill_list, bag_list, map_id, partner_id, skill_used,
		  round_reward, round_evt_group, kill_mon,
		  mine_combat_num, mine_round_combat, mine_round_reward,
		  current_id, mine_buy_count, init_id, laste_num]},
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
		{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{holiday,
		 [camp_id, total_id, bid, tbid, cli_type, cli_type_name,
		  start_time, end_time, condition, type, title, title2,
		  main_ico, ico, type_ico, top_banner, rule_str, time_str,
		  bottom_alert, sort_val, reward_title, aim_title, reward,
		  item_effect, mail_subject, mail_content, cli_reward,
		  panel_type, open_day, open_day_min, open_day_max,
		  merge_day, process_show_reward, platform_id,
		  platform_exclude_id, hide_srv_ids, channel_ban]},
		{holiday_total,
		 [id, name, icon_id, start_time, end_time, status,
		  open_day, merge_day, is_show, type]},
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

-export([fire/3, zero_flush/2, qry/2, take/4, init/1,
	 apply_reward/2, clear_rank/1, pack/3, rank_type/1,
	 get_rank_award/2, do_ref_clear_rank/0, gm_send_mail/0,
	 gm_send_mail/1, gm_cancel_timer/0, gm_cancel_timer/1]).

-export([merge_apply_reward/1, hd_7004_2019_12_17/1,
	 hd_7009_2020_02_18/1, repair_7009/2]).

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

-file("src/mod/holiday/holiday_rule_rank.erl", 30).

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

-file("src/mod/holiday/holiday_rule_rank.erl", 31).

-file("inc/holiday.hrl", 1).

-record(holiday_total,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 icon_id = 0  :: non_neg_integer(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 is_show = 0  :: 0..1, type = 0  :: 0..2}).

-record(holiday,
	{camp_id = 0  :: non_neg_integer(),
	 total_id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 tbid = 0  :: non_neg_integer(),
	 cli_type = 0  :: non_neg_integer(),
	 cli_type_name = <<>>  :: binary(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(), condition = [],
	 type = 0  :: 0..2, title = <<>>  :: bitstring(),
	 title2 = <<>>  :: bitstring(),
	 main_ico = 0  :: pos_integer() | tuple(),
	 ico = <<>>  :: bitstring(),
	 type_ico = 0  :: non_neg_integer(),
	 top_banner = <<>>  :: bitstring(),
	 rule_str = <<>>  :: bitstring(),
	 time_str = <<>>  :: bitstring(),
	 bottom_alert = <<>>  :: bitstring(),
	 sort_val = 0  :: non_neg_integer(),
	 reward_title = <<>>  :: bitstring(),
	 aim_title = <<>>  :: bitstring(),
	 reward = []  :: list(), item_effect = []  :: list(),
	 mail_subject = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring(),
	 cli_reward = <<>>  :: bitstring(),
	 panel_type = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 open_day_min = 0  :: non_neg_integer(),
	 open_day_max = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 process_show_reward = 0  :: non_neg_integer(),
	 platform_id = []  :: list(),
	 platform_exclude_id = []  :: list(), hide_srv_ids = [],
	 channel_ban = <<>>  :: bitstring()}).

-file("src/mod/holiday/holiday_rule_rank.erl", 32).

-file("inc/rank.hrl", 1).

-record(rank,
	{type = 0  :: non_neg_integer(), list = []  :: list(),
	 last_val = 0  :: non_neg_integer(),
	 len = 0  :: non_neg_integer(), is_cross = 0  :: 0 | 1,
	 ctime = 0  :: non_neg_integer()}).

-record(rank_rc,
	{ver = 3  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 idx = 0  :: non_neg_integer(),
	 val1 = 0  :: non_neg_integer(),
	 val2 = 0  :: non_neg_integer(),
	 val3 = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 look_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 guild_name = <<>>  :: bitstring(),
	 power = 0  :: non_neg_integer(),
	 all_power = 0  :: non_neg_integer(),
	 desc = <<>>  :: bitstring(), looks = []  :: list(),
	 ext = []  :: list(), time = 0  :: non_neg_integer(),
	 is_cross = false, avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(rank_cfg,
	{type = 0  :: non_neg_integer(),
	 num = 300  :: non_neg_integer(),
	 keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
	 min_val = 1  :: non_neg_integer(),
	 nologin = 0  :: non_neg_integer(),
	 zone = rank_zone_1  :: atom(), exit_rank = 0  :: 0..1}).

-file("src/mod/holiday/holiday_rule_rank.erl", 33).

-file("inc/log.hrl", 1).

-file("src/mod/holiday/holiday_rule_rank.erl", 34).

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

-file("src/mod/holiday/holiday_rule_rank.erl", 35).

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

-file("src/mod/holiday/holiday_rule_rank.erl", 36).

-file("inc/adventure.hrl", 1).

-record(m_adventure,
	{ver = 10, pass_id = 0, pass_num = 0, explore_num = 0,
	 id = 0, room = 0, first_room = 0, boss_room = 0,
	 room_list = [], buff_list = [], shop_list = [],
	 start_time = 0, end_time = 0, plist = [],
	 is_kill_boss = 0, init_time = 0, skill_list = [],
	 bag_list = [], map_id = 0, partner_id = 0,
	 skill_used = [], round_reward = [],
	 round_evt_group = [], kill_mon = 0, mine_combat_num = 0,
	 mine_round_combat = 0, mine_round_reward = [],
	 current_id = 0, mine_buy_count = 0, init_id = 0,
	 laste_num = 999}).

-record(a_room,
	{id = 1, idx = 0, evt_id = 0, res_id = 0, status = 0,
	 cond_status = 0, lock = 0, init_evt_id = 0, ext = []}).

-record(adventure_data,
	{id = 0, room = 0, name = <<>>, lose = []}).

-file("src/mod/holiday/holiday_rule_rank.erl", 37).

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

-file("src/mod/holiday/holiday_rule_rank.erl", 38).

hd_7004_2019_12_17(Role = #role{id = Id,
				m_var = #m_var{timeout_vars = TimeOutVars}}) ->
    case sys_env:get(hd_7004_2019_12_17) of
      {_CampIdTemp, _} ->
	  case var:get_var(Role, other, 3075, 0) of
	    0 ->
		Now = date:unixtime(),
		CampIds = [4007, 15002, 19012, 24011, 28009, 32009,
			   36010, 40009, 44009, 46071, 48028, 49309],
		case [Data
		      || Data = {{holiday, CampIdT}, {T, {Val1, Val2, Lists}}}
			     <- TimeOutVars,
			 lists:member(CampIdT, CampIds)]
		    of
		  [{{_, CampId}, {T, {Val1, Val2, Lists}}} | _]
		      when T - 86400 * 2 + 1 >= 1576722642 ->
		      case lists:keyfind({holiday, CampId}, 1, TimeOutVars) of
			{_, {0, {_, _, _}}} -> {ok, Role};
			{_, {T, {Val1, Val2, Lists}}} when T > 0 ->
			    case holiday_lib:get_holiday_data(CampId) of
			      #holiday{bid = Bid, reward = [Reward, _]}
				  when Bid == 97004 ->
				  Fun = fun ({Aim, _NeedCount, Award, _BStr},
					     {Acc, Acc2}) ->
						case list_util:keyfind(Aim,
								       Lists, 0)
						    of
						  2 -> {Acc, [{Aim, 2} | Acc2]};
						  _ ->
						      {item_lib:merge(Award,
								      Acc),
						       [{Aim, 2} | Acc2]}
						end
					end,
				  {Award, NewLists} = lists:foldl(Fun, {[], []},
								  Reward),
				  Title = lang:get(<<"远征精英活动补发奖励"/utf8>>),
				  Content =
				      lang:get(<<"亲爱的冒险者大人：\n   新上线的位面谜踪活动将会替代远征精英活动来陪伴冒险者大人的冒险"
						 "之旅，因此冒险大陆对正在开启远征活动的区服作出以下补偿方案：\n\n  "
						 "  1、您的区服已开启远征精英活动，且您已参与当期远征精英活动，将会在版本更新后收到活动奖"
						 "励邮件补偿（已领取的奖励不参与）\n\n    2、版本更新后，远征排行榜会进行结算并实时"
						 "取排行榜数据，发放排行榜结算奖励邮件\n\n    附件是您在远征精英活动中未领取的活动奖"
						 "励，请注意查收"/utf8>>),
				  {MailAssets, MailItems} =
				      format:split_assets_items(Award),
				  Mail = {Title, Content, MailAssets, MailItems,
					  Title},
				  {ok, NRole} = mail:add(Role, Mail),
				  NewRole = var:set_var(NRole, {timeout, 0},
							{holiday, CampId},
							{Val1, Val2, NewLists}),
				  NewRole2 = var:set_var(NewRole, other, 3075,
							 1),
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
				    {__Pidholiday_rule_rank72, _,
				     {__Levelholiday_rule_rank72,
				      __Tracesholiday_rule_rank72}}
					when __Levelholiday_rule_rank72 band 64
					       /= 0
					       orelse
					       __Tracesholiday_rule_rank72 /=
						 [] ->
					lager:do_log(info,
						     [{module,
						       holiday_rule_rank},
						      {function,
						       hd_7004_2019_12_17},
						      {line, 72},
						      {pid,
						       pid_to_list(self())},
						      {node, node()}
						      | lager:md()],
						     io_lib:format("玩家~w领取了远征精英活动补发奖励：~w,~w",
								   [Id, Lists,
								    Award]),
						     none, 4096, 64,
						     __Levelholiday_rule_rank72,
						     __Tracesholiday_rule_rank72,
						     lager_event,
						     __Pidholiday_rule_rank72);
				    _ -> ok
				  end,
				  {ok, NewRole2};
			      _ ->
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
				    {__Pidholiday_rule_rank75, _,
				     {__Levelholiday_rule_rank75,
				      __Tracesholiday_rule_rank75}}
					when __Levelholiday_rule_rank75 band 8
					       /= 0
					       orelse
					       __Tracesholiday_rule_rank75 /=
						 [] ->
					lager:do_log(error,
						     [{module,
						       holiday_rule_rank},
						      {function,
						       hd_7004_2019_12_17},
						      {line, 75},
						      {pid,
						       pid_to_list(self())},
						      {node, node()}
						      | lager:md()],
						     io_lib:format("处理失败，远征活动数据被删了:~w",
								   [CampId]),
						     none, 4096, 8,
						     __Levelholiday_rule_rank75,
						     __Tracesholiday_rule_rank75,
						     lager_event,
						     __Pidholiday_rule_rank75);
				    _ -> ok
				  end,
				  {ok, Role}
			    end;
			_ -> {ok, Role}
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
			{__Pidholiday_rule_rank81, _,
			 {__Levelholiday_rule_rank81,
			  __Tracesholiday_rule_rank81}}
			    when __Levelholiday_rule_rank81 band 64 /= 0 orelse
				   __Tracesholiday_rule_rank81 /= [] ->
			    lager:do_log(info,
					 [{module, holiday_rule_rank},
					  {function, hd_7004_2019_12_17},
					  {line, 81},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("玩家~w远征精英活动补发奖励出错：~w",
						       [Id,
							[Data
							 || Data = {{holiday,
								     CampIdT},
								    {T,
								     {Val1,
								      Val2,
								      Lists}}}
								<- TimeOutVars,
							    lists:member(CampIdT,
									 CampIds)]]),
					 none, 4096, 64,
					 __Levelholiday_rule_rank81,
					 __Tracesholiday_rule_rank81,
					 lager_event, __Pidholiday_rule_rank81);
			_ -> ok
		      end,
		      {ok, Role}
		end;
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end.

repair_7009(Role = #role{id = Id,
			 m_var = #m_var{timeout_vars = TimeOutVars}},
	    Count) ->
    CampIds = [4008, 15000, 19014, 24015, 28015, 32016,
	       36020, 40020, 44020, 46080, 48040, 49320, 49628, 49848],
    case [Data
	  || Data = {{holiday, CampIdT}, {_, {_, _}}}
		 <- TimeOutVars,
	     lists:member(CampIdT, CampIds)]
	of
      [{{_, CampId}, {T, {Val1, Lists}}} | _]
	  when T - 86400 * 2 > 1582164000 andalso
		 T - 86400 * 2 < 1582855200 ->
	  case holiday_lib:get_holiday_data(CampId) of
	    #holiday{bid = Bid, reward = [Reward, _]}
		when Bid == 97009 ->
		Fun = fun ({Aim, NeedCount, _Award, _BStr}, Acc) ->
			      case NeedCount =< Count of
				true -> [{Aim, 1} | Acc];
				_ -> Acc
			      end
		      end,
		NewList = lists:foldl(Fun, [], Reward),
		NewRole = var:set_var(Role, {timeout, T},
				      {holiday, CampId}, {Count, NewList}),
		rank_listener:handle(secret_dun, NewRole,
				     #{time => date:unixtime(),
				       count => Count}),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_rank110, _,
		   {__Levelholiday_rule_rank110,
		    __Tracesholiday_rule_rank110}}
		      when __Levelholiday_rule_rank110 band 64 /= 0 orelse
			     __Tracesholiday_rule_rank110 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_rule_rank},
				    {function, repair_7009}, {line, 110},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("玩家~w修复了位面谜踪活动数据。原数据：~w，正确数据：~w",
						 [Id, {Val1, Lists},
						  {Count, NewList}]),
				   none, 4096, 64, __Levelholiday_rule_rank110,
				   __Tracesholiday_rule_rank110, lager_event,
				   __Pidholiday_rule_rank110);
		  _ -> ok
		end,
		{ok, NewRole};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_rank113, _,
		   {__Levelholiday_rule_rank113,
		    __Tracesholiday_rule_rank113}}
		      when __Levelholiday_rule_rank113 band 64 /= 0 orelse
			     __Tracesholiday_rule_rank113 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_rule_rank},
				    {function, repair_7009}, {line, 113},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("玩家~w位面谜踪活动补发奖励出错。找不到活动~w",
						 [Id, CampId]),
				   none, 4096, 64, __Levelholiday_rule_rank113,
				   __Tracesholiday_rule_rank113, lager_event,
				   __Pidholiday_rule_rank113);
		  _ -> ok
		end,
		{ok, Role}
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
	    {__Pidholiday_rule_rank117, _,
	     {__Levelholiday_rule_rank117,
	      __Tracesholiday_rule_rank117}}
		when __Levelholiday_rule_rank117 band 64 /= 0 orelse
		       __Tracesholiday_rule_rank117 /= [] ->
		lager:do_log(info,
			     [{module, holiday_rule_rank},
			      {function, repair_7009}, {line, 117},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("玩家~w位面谜踪活动补发奖励出错。找不到数据", [Id]),
			     none, 4096, 64, __Levelholiday_rule_rank117,
			     __Tracesholiday_rule_rank117, lager_event,
			     __Pidholiday_rule_rank117);
	    _ -> ok
	  end,
	  {ok, Role}
    end.

hd_7009_2020_02_18(Role = #role{id = Id = {_, Sid},
				m_var = #m_var{timeout_vars = TimeOutVars}}) ->
    case sys_env:get(hd_7009_2020_02_18) of
      {_CampIdTemp, _} ->
	  case var:get_var(Role, other, 3096, 0) of
	    0 ->
		MlfSids = [<<"symlf_1">>, <<"symlf_2">>, <<"symlf_3">>,
			   <<"symlf_4">>, <<"symlf_5">>, <<"symlf_6">>],
		MlfFlag = lists:member(Sid, MlfSids),
		CampIds = [4008, 15000, 19014, 24015, 28015, 32016,
			   36020, 40020, 44020, 46080, 48040, 49320, 49628,
			   49848],
		NRole1 = var:set_var(Role, other, 3096, 1),
		case [Data
		      || Data = {{holiday, CampIdT}, {T, {Val1, Lists}}}
			     <- TimeOutVars,
			 lists:member(CampIdT, CampIds)]
		    of
		  [{{_, CampId}, {T, {Val1, Lists}}} | _]
		      when MlfFlag =:= false andalso
			     T - 86400 * 2 > 1582164000 andalso
			       T - 86400 * 2 < 1582855200 ->
		      case lists:keyfind({holiday, CampId}, 1, TimeOutVars) of
			{_, {0, {_, _}}} -> {ok, NRole1};
			{_, {T, {Val1, Lists}}} when T > 0 ->
			    case holiday_lib:get_holiday_data(CampId) of
			      #holiday{bid = Bid, reward = [Reward, _]}
				  when Bid == 97009 ->
				  Fun = fun ({Aim, _NeedCount, Award, _BStr},
					     Acc) ->
						case list_util:keyfind(Aim,
								       Lists, 0)
						    of
						  1 ->
						      item_lib:merge(Award,
								     Acc);
						  _ -> Acc
						end
					end,
				  AwardList = lists:foldl(Fun, [], Reward),
				  NRole = case AwardList of
					    [_ | _] ->
						Title =
						    lang:get(<<"位面谜踪补发邮件"/utf8>>),
						Content =
						    lang:get(<<"亲爱的冒险者大人：由于位面玩法已崭新改版，因此提前结算当前的位面谜踪活动，重新开放的位面谜"
							       "踪活动将延续原位面谜踪的活动时间，以下是您未领取的次数奖励，请查收"/utf8>>),
						{MailAssets, MailItems} =
						    format:split_assets_items(AwardList),
						Mail = {Title, Content,
							MailAssets, MailItems,
							Title},
						{ok, NNRole} = mail:add(NRole1,
									Mail),
						NNRole;
					    _ -> NRole1
					  end,
				  NewRole = var:set_var(NRole, {timeout, T},
							{holiday, CampId},
							{0, []}),
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
				    {__Pidholiday_rule_rank160, _,
				     {__Levelholiday_rule_rank160,
				      __Tracesholiday_rule_rank160}}
					when __Levelholiday_rule_rank160 band 64
					       /= 0
					       orelse
					       __Tracesholiday_rule_rank160 /=
						 [] ->
					lager:do_log(info,
						     [{module,
						       holiday_rule_rank},
						      {function,
						       hd_7009_2020_02_18},
						      {line, 160},
						      {pid,
						       pid_to_list(self())},
						      {node, node()}
						      | lager:md()],
						     io_lib:format("玩家~w领取了位面谜踪活动补发奖励：~w,~w",
								   [Id, Lists,
								    AwardList]),
						     none, 4096, 64,
						     __Levelholiday_rule_rank160,
						     __Tracesholiday_rule_rank160,
						     lager_event,
						     __Pidholiday_rule_rank160);
				    _ -> ok
				  end,
				  {ok, NewRole};
			      _ ->
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
				    {__Pidholiday_rule_rank163, _,
				     {__Levelholiday_rule_rank163,
				      __Tracesholiday_rule_rank163}}
					when __Levelholiday_rule_rank163 band 8
					       /= 0
					       orelse
					       __Tracesholiday_rule_rank163 /=
						 [] ->
					lager:do_log(error,
						     [{module,
						       holiday_rule_rank},
						      {function,
						       hd_7009_2020_02_18},
						      {line, 163},
						      {pid,
						       pid_to_list(self())},
						      {node, node()}
						      | lager:md()],
						     io_lib:format("处理失败，位面谜踪数据被删了:~w",
								   [CampId]),
						     none, 4096, 8,
						     __Levelholiday_rule_rank163,
						     __Tracesholiday_rule_rank163,
						     lager_event,
						     __Pidholiday_rule_rank163);
				    _ -> ok
				  end,
				  {ok, NRole1}
			    end;
			_ -> {ok, NRole1}
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
			{__Pidholiday_rule_rank169, _,
			 {__Levelholiday_rule_rank169,
			  __Tracesholiday_rule_rank169}}
			    when __Levelholiday_rule_rank169 band 64 /= 0 orelse
				   __Tracesholiday_rule_rank169 /= [] ->
			    lager:do_log(info,
					 [{module, holiday_rule_rank},
					  {function, hd_7009_2020_02_18},
					  {line, 169},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("玩家~w位面谜踪活动补发奖励出错：~w",
						       [Id,
							[Data
							 || Data = {{holiday,
								     CampIdT},
								    {T,
								     {Val1,
								      Lists}}}
								<- TimeOutVars,
							    lists:member(CampIdT,
									 CampIds)]]),
					 none, 4096, 64,
					 __Levelholiday_rule_rank169,
					 __Tracesholiday_rule_rank169,
					 lager_event,
					 __Pidholiday_rule_rank169);
			_ -> ok
		      end,
		      {ok, NRole1}
		end;
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end.

gm_cancel_timer() ->
    util:unset_timer({rank_clear, 38009}),
    util:unset_timer({rank, 38009}),
    clear_rank(36).

gm_cancel_timer(CampId) ->
    util:unset_timer({rank_clear, CampId}),
    util:unset_timer({rank, CampId}).

gm_send_mail() ->
    L = mail_send_data:get(),
    MSid = sys_lib:srv_id(),
    L2 = [{{Rid, Sid}, Rank}
	  || {{Rid, Sid}, Rank} <- L, Sid == MSid],
    case L2 of
      [_ | _] ->
	  gm_send_mail(L2),
	  {do_send, erlang:binary_to_atom(MSid, utf8),
	   length(L2)};
      _ -> ok
    end.

gm_send_mail(L) ->
    Fun = fun ({RoleId, Rank}) ->
		  case holiday_boss_data:rank_reward(Rank) of
		    Award = [_ | _] ->
			{MailAssets, MailItems} =
			    format:split_assets_items(Award),
			Content =
			    color:msg(lang:get(<<"亲爱的冒险者大人，恭喜您在星空试炼中获取了第~ts名的成绩，附件是您的奖励。请注意查收"/utf8>>),
				      [{red, Rank}]),
			Mail = {lang:get(<<"星空试炼奖励"/utf8>>), Content,
				MailAssets, MailItems,
				lang:get(<<"星空试炼奖励"/utf8>>)},
			mail:send(RoleId, Mail);
		    _ -> ok
		  end
	  end,
    lists:map(Fun, L),
    ok.

do_ref_clear_rank() ->
    do_ref_clear_rank([34, 35, 36, 37]).

do_ref_clear_rank([]) -> ok;
do_ref_clear_rank([RType | Other]) ->
    Bid = case RType of
	    34 -> 97001;
	    35 -> 97002;
	    36 -> 97003;
	    37 -> 97004;
	    _ -> 0
	  end,
    case holiday_lib:get_open_holiday(Bid) of
      #holiday{} -> do_ref_clear_rank(Other);
      _ -> clear_rank(RType), do_ref_clear_rank(Other)
    end.

-spec merge_apply_reward(#holiday{}) -> ok.

merge_apply_reward(Holiday = #holiday{tbid = TBid,
				      bid = Bid}) ->
    case holiday_lib:get_holiday(Bid) of
      #holiday{end_time = EndTime} ->
	  Now = date:unixtime(),
	  case EndTime > Now + 86400 of
	    true ->
		do_reward(Holiday, #{flag => reward}),
		RankType = case TBid of
			     7001 -> 34;
			     7002 -> 35;
			     7003 -> 36;
			     7004 -> 37;
			     7009 -> 48;
			     _ -> 41
			   end,
		clear_rank(RankType);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_rank256, _,
		   {__Levelholiday_rule_rank256,
		    __Tracesholiday_rule_rank256}}
		      when __Levelholiday_rule_rank256 band 64 /= 0 orelse
			     __Tracesholiday_rule_rank256 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_rule_rank},
				    {function, merge_apply_reward}, {line, 256},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("活动~w已经发了奖励", [Holiday]), none,
				   4096, 64, __Levelholiday_rule_rank256,
				   __Tracesholiday_rule_rank256, lager_event,
				   __Pidholiday_rule_rank256);
		  _ -> ok
		end
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
	    {__Pidholiday_rule_rank259, _,
	     {__Levelholiday_rule_rank259,
	      __Tracesholiday_rule_rank259}}
		when __Levelholiday_rule_rank259 band 8 /= 0 orelse
		       __Tracesholiday_rule_rank259 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule_rank},
			      {function, merge_apply_reward}, {line, 259},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("活动~w已不存在:~w", [Bid, Holiday]), none,
			     4096, 8, __Levelholiday_rule_rank259,
			     __Tracesholiday_rule_rank259, lager_event,
			     __Pidholiday_rule_rank259);
	    _ -> ok
	  end
    end.

-spec zero_flush(#role{}, #holiday{}) -> #role{}.

zero_flush(Role,
	   Holiday = #holiday{camp_id = CampId, title = Title,
			      end_time = EndTime, bid = Bid, tbid = 7009,
			      reward = [Reward, _]}) ->
    Now = date:unixtime(),
    {AccVal, GetAimList} = holiday_lib:get_tv_val(CampId,
						  Bid, Role),
    case Now >= EndTime of
      true ->
	  Fun = fun ({Aim, _, Award, _}, {Acc1, Acc2}) ->
			case lists:keyfind(Aim, 1, Acc1) of
			  {Aim, 1} ->
			      {lists:keyreplace(Aim, 1, Acc1, {Aim, 2}),
			       item_lib:merge(Award, Acc2)};
			  _ -> {Acc1, Acc2}
			end
		end,
	  {NewGetAimList, GetRewards} = lists:foldl(Fun,
						    {GetAimList, []}, Reward),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NRole = holiday_lib:set_tv_val(CampId, Role,
					 {AccVal, NewGetAimList}, ExpireSec),
	  NewRole = case GetRewards of
		      [_ | _] ->
			  {Assets, Items} =
			      format:split_assets_items(GetRewards),
			  {ok, NewRoleT} = mail:add(NRole,
						    {util:fbin(lang:get(<<"系统邮件"/utf8>>),
							       []),
						     color:msg(lang:get(<<"亲爱的冒险者大人：\n这是您在~ts活动中未领取的奖励。请注意查收"/utf8>>),
							       [{green,
								 Title}]),
						     Assets, Items,
						     <<"位面谜踪补发"/utf8>>,
						     86400 + date:unixtime()}),
			  NewRoleT;
		      _ -> NRole
		    end,
	  NewRole;
      _ -> Role
    end;
zero_flush(Role, _Holiday) -> Role.

-spec fire(#holiday{}, #role{}, tuple()) -> {ok,
					     #role{}}.

fire(Holiday = #holiday{camp_id = CampId,
			end_time = EndTime, bid = Bid, tbid = 7001,
			reward = [Reward, _]},
     Role, #evt_convert{}) ->
    Now = date:unixtime(),
    case EndTime >= Now + 86400 of
      true ->
	  {Count, Lists} = holiday_lib:get_tv_val(CampId, Bid,
						  Role),
	  NewCount = Count + 1,
	  Fun = fun ({Aim, NeedCount, _Award, _BStr}, Acc) ->
			case list_util:keyfind(Aim, Lists, 0) of
			  0 when NeedCount =< NewCount -> [{Aim, 1} | Acc];
			  Status -> [{Aim, Status} | Acc]
			end
		end,
	  NewList = lists:foldl(Fun, [], Reward),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NewRole2 = holiday_lib:set_tv_val(CampId, Role,
					    {NewCount, NewList}, ExpireSec),
	  holiday:push_bid_can_reward(NewRole2, Bid),
	  holiday_lib:push_holiday_one(NewRole2, Bid),
	  rank_listener:handle(convert, NewRole2,
			       #{time => Now, count => NewCount}),
	  {ok, NewRole2};
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId,
			end_time = EndTime, bid = Bid, tbid = 7002,
			reward = [Reward, _]},
     Role, #evt_dungeon_fast_combat{}) ->
    Now = date:unixtime(),
    case EndTime >= Now + 86400 of
      true ->
	  {Count, Lists} = holiday_lib:get_tv_val(CampId, Bid,
						  Role),
	  NewCount = Count + 1,
	  Fun = fun ({Aim, NeedCount, _Award, _BStr}, Acc) ->
			case list_util:keyfind(Aim, Lists, 0) of
			  0 when NeedCount =< NewCount -> [{Aim, 1} | Acc];
			  Status -> [{Aim, Status} | Acc]
			end
		end,
	  NewList = lists:foldl(Fun, [], Reward),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NewRole2 = holiday_lib:set_tv_val(CampId, Role,
					    {NewCount, NewList}, ExpireSec),
	  holiday:push_bid_can_reward(NewRole2, Bid),
	  holiday_lib:push_holiday_one(NewRole2, Bid),
	  rank_listener:handle(fast_combat, NewRole2,
			       #{time => Now, count => NewCount}),
	  {ok, NewRole2};
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId,
			end_time = EndTime, bid = Bid, tbid = 7003,
			reward = [Reward, _]},
     Role, #evt_shipping{}) ->
    Now = date:unixtime(),
    case EndTime >= Now + 86400 of
      true ->
	  {Count, Lists} = holiday_lib:get_tv_val(CampId, Bid,
						  Role),
	  NewCount = Count + 1,
	  Fun = fun ({Aim, NeedCount, _Award, _BStr}, Acc) ->
			case list_util:keyfind(Aim, Lists, 0) of
			  0 when NeedCount =< NewCount -> [{Aim, 1} | Acc];
			  Status -> [{Aim, Status} | Acc]
			end
		end,
	  NewList = lists:foldl(Fun, [], Reward),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NewRole2 = holiday_lib:set_tv_val(CampId, Role,
					    {NewCount, NewList}, ExpireSec),
	  holiday:push_bid_can_reward(NewRole2, Bid),
	  holiday_lib:push_holiday_one(NewRole2, Bid),
	  rank_listener:handle(shipping, NewRole2,
			       #{time => Now, count => NewCount}),
	  {ok, NewRole2};
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId,
			start_time = StartTime, end_time = EndTime, bid = Bid,
			tbid = 7004, reward = [Reward, _]},
     Role,
     #evt_expedition_fight{difficulty = Difficulty,
			   count = AutoCount, is_rank = IsRank}) ->
    Now = date:unixtime(),
    case EndTime >= Now + 86400 of
      true ->
	  {Count, RankCount, Lists} = case
					holiday_lib:get_tv_val(CampId, Bid,
							       Role)
					  of
					{CountT, ListsT} ->
					    {CountT, CountT, ListsT};
					{CountT, RankCountT, ListsT} ->
					    {CountT, RankCountT, ListsT}
				      end,
	  AddCount = if Difficulty =:= 2 -> 2;
			Difficulty =:= 3 -> 3;
			true -> 1
		     end,
	  IsFirstDay = date:is_same_day(Now, StartTime),
	  NewRankCount = case IsRank =:= 1 orelse
				IsFirstDay =/= true
			     of
			   true -> RankCount + AddCount * AutoCount;
			   _ -> RankCount
			 end,
	  NewCount = Count + AutoCount,
	  Fun = fun ({Aim, NeedCount, _Award, _BStr}, Acc) ->
			case list_util:keyfind(Aim, Lists, 0) of
			  0 when NeedCount =< NewCount -> [{Aim, 1} | Acc];
			  Status -> [{Aim, Status} | Acc]
			end
		end,
	  NewList = lists:foldl(Fun, [], Reward),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NewRole2 = holiday_lib:set_tv_val(CampId, Role,
					    {NewCount, NewRankCount, NewList},
					    ExpireSec),
	  holiday:push_bid_can_reward(NewRole2, Bid),
	  holiday_lib:push_holiday_one(NewRole2, Bid),
	  rank_listener:handle(expedition, NewRole2,
			       #{time => Now, count => NewRankCount}),
	  {ok, NewRole2};
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId,
			end_time = EndTime, bid = Bid, tbid = 7005,
			reward = [Reward, _]},
     Role, #evt_adventure_goto_floor{id = NextId}) ->
    Now = date:unixtime(),
    case EndTime >= Now + 86400 of
      true ->
	  {Count, MaxId, MaxNum, Lists} = case
					    holiday_lib:get_tv_val(CampId, Bid,
								   Role)
					      of
					    {CountT, ListsT} ->
						{CountT, 0, 0, ListsT};
					    {CountT, MaxIdT, MaxNumT, ListsT} ->
						{CountT, MaxIdT, MaxNumT,
						 ListsT}
					  end,
	  NewCount = Count + 1,
	  Fun = fun ({Aim, NeedCount, _Award, _BStr}, Acc) ->
			case list_util:keyfind(Aim, Lists, 0) of
			  0 when NeedCount =< NewCount -> [{Aim, 1} | Acc];
			  Status -> [{Aim, Status} | Acc]
			end
		end,
	  NewList = lists:foldl(Fun, [], Reward),
	  NewMaxId = util:if_true(NextId > MaxId, NextId, MaxId),
	  NewMaxNum = util:if_true(NewMaxId =:= MaxId, MaxNum, 0),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NewRole2 = holiday_lib:set_tv_val(CampId, Role,
					    {NewCount, NewMaxId, NewMaxNum,
					     NewList},
					    ExpireSec),
	  holiday:push_bid_can_reward(NewRole2, Bid),
	  holiday_lib:push_holiday_one(NewRole2, Bid),
	  case MaxId == 0 of
	    true ->
		rank_listener:handle(adventure_holiday, NewRole2,
				     #{count => max(NextId - 1, 1), num => 21});
	    _ -> skip
	  end,
	  {ok, NewRole2};
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId,
			end_time = EndTime, bid = Bid, tbid = 7005},
     Role = #role{m_adventure =
		      #m_adventure{id = Id, explore_num = ExploreNum}},
     #evt_adventure_explore{}) ->
    Now = date:unixtime(),
    case EndTime >= Now + 86400 of
      true ->
	  {Count, MaxId, MaxNum, Lists} = case
					    holiday_lib:get_tv_val(CampId, Bid,
								   Role)
					      of
					    {CountT, ListsT} ->
						{CountT, Id, ExploreNum,
						 ListsT};
					    {CountT, 0, 0, ListsT} ->
						{CountT, Id, ExploreNum,
						 ListsT};
					    {CountT, MaxIdT, MaxNumT, ListsT} ->
						{CountT, MaxIdT, MaxNumT,
						 ListsT}
					  end,
	  NewMaxNum = util:if_true(MaxId =:= Id andalso
				     ExploreNum > MaxNum,
				   ExploreNum, MaxNum),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NewRole2 = holiday_lib:set_tv_val(CampId, Role,
					    {Count, MaxId, NewMaxNum, Lists},
					    ExpireSec),
	  case Id >= MaxId of
	    true ->
		rank_listener:handle(adventure_holiday, NewRole2,
				     #{count => MaxId, num => NewMaxNum});
	    _ -> skip
	  end,
	  {ok, NewRole2};
      _ -> {ok, Role}
    end;
fire(Holiday = #holiday{camp_id = CampId,
			end_time = EndTime, bid = Bid, tbid = 7009,
			reward = [Reward, _]},
     Role, #evt_planes_kill_guard{}) ->
    Now = date:unixtime(),
    case EndTime >= Now + 86400 of
      true ->
	  {Count, Lists} = holiday_lib:get_tv_val(CampId, Bid,
						  Role),
	  NewCount = Count + 1,
	  Fun = fun ({Aim, NeedCount, _Award, _BStr}, Acc) ->
			case list_util:keyfind(Aim, Lists, 0) of
			  0 when NeedCount =< NewCount -> [{Aim, 1} | Acc];
			  Status -> [{Aim, Status} | Acc]
			end
		end,
	  NewList = lists:foldl(Fun, [], Reward),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NewRole2 = holiday_lib:set_tv_val(CampId, Role,
					    {NewCount, NewList}, ExpireSec),
	  holiday:push_bid_can_reward(NewRole2, Bid),
	  holiday_lib:push_holiday_one(NewRole2, Bid),
	  rank_listener:handle(secret_dun, NewRole2,
			       #{time => Now, count => NewCount}),
	  {ok, NewRole2};
      _ -> {ok, Role}
    end;
fire(Holiday, Role, _Evt) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule_rank497, _,
       {__Levelholiday_rule_rank497,
	__Tracesholiday_rule_rank497}}
	  when __Levelholiday_rule_rank497 band 8 /= 0 orelse
		 __Tracesholiday_rule_rank497 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule_rank}, {function, fire},
			{line, 497}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]处理活动~w失败:~w",
				     [Role#role.name, Holiday, _Evt]),
		       none, 4096, 8, __Levelholiday_rule_rank497,
		       __Tracesholiday_rule_rank497, lager_event,
		       __Pidholiday_rule_rank497);
      _ -> ok
    end,
    {ok, Role}.

-spec qry(#holiday{}, #role{}) -> {error, bitstring()} |
				  tuple().

qry(#holiday{tbid = TBid, camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = [Reward, _],
	     cli_reward = CliReward, item_effect = ItemEff},
    Role)
    when TBid =:= 7001 orelse
	   TBid =:= 7002 orelse
	     TBid =:= 7003 orelse
	       TBid =:= 7004 orelse
		 TBid =:= 7005 orelse TBid =:= 7009 ->
    Now = date:unixtime(),
    {Count, Lists} = case holiday_lib:get_tv_val(CampId,
						 Bid, Role)
			 of
		       {CountT, ListsT} -> {CountT, ListsT};
		       {CountT, _, ListsT} -> {CountT, ListsT};
		       {CountT, _, _, ListsT} -> {CountT, ListsT}
		     end,
    Fun = fun ({Aim, NeedCount, Award, BStr}) ->
		  Status = list_util:keyfind(Aim, Lists, 0),
		  AimArgs = [{4, NeedCount, <<>>}, {5, Count, <<>>}],
		  {Aim, BStr, Status, Award, AimArgs};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule_rank520, _,
		     {__Levelholiday_rule_rank520,
		      __Tracesholiday_rule_rank520}}
			when __Levelholiday_rule_rank520 band 8 /= 0 orelse
			       __Tracesholiday_rule_rank520 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule_rank},
				      {function, qry}, {line, 520},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8, __Levelholiday_rule_rank520,
				     __Tracesholiday_rule_rank520, lager_event,
				     __Pidholiday_rule_rank520);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    RankList = [],
    {max(0, EndTime - Now), Count, RewardData, ItemEff, [],
     CliReward, RankList};
qry(#holiday{tbid = 7006, camp_id = CampId,
	     end_time = EndTime},
    _Role) ->
    Now = date:unixtime(),
    Args = [{4, CampId, <<>>}],
    {max(0, EndTime - Now), 0, [{0, <<>>, 0, [], []}], [],
     Args, <<>>, []};
qry(#holiday{tbid = 7007, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [{0, <<>>, 0, [], []}], [],
     [], <<>>, []};
qry(#holiday{tbid = 7010, end_time = EndTime}, _Role) ->
    Now = date:unixtime(),
    {max(0, EndTime - Now), 0, [{0, <<>>, 0, [], []}], [],
     [], <<>>, []};
qry(#holiday{bid = Bid, tbid = TBid}, Role) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule_rank537, _,
       {__Levelholiday_rule_rank537,
	__Tracesholiday_rule_rank537}}
	  when __Levelholiday_rule_rank537 band 8 /= 0 orelse
		 __Tracesholiday_rule_rank537 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule_rank}, {function, qry},
			{line, 537}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]查询未处理的活动[Bid:~w:~w]",
				     [Role#role.name, Bid, TBid]),
		       none, 4096, 8, __Levelholiday_rule_rank537,
		       __Tracesholiday_rule_rank537, lager_event,
		       __Pidholiday_rule_rank537);
      _ -> ok
    end,
    {error, not_found}.

-spec take(#holiday{}, #role{}, pos_integer(),
	   pos_integer()) -> {error, bitstring()} |
			     {ok, bitstring(), #role{}}.

take(Holiday = #holiday{tbid = 7004, camp_id = CampId,
			bid = Bid, reward = [Reward, _]},
     Role, Aim, _Arg) ->
    {Count, RankCount, Lists} = case
				  holiday_lib:get_tv_val(CampId, Bid, Role)
				    of
				  {CountT, ListsT} -> {CountT, CountT, ListsT};
				  {CountT, RankCountT, ListsT} ->
				      {CountT, RankCountT, ListsT}
				end,
    Status = list_util:keyfind(Aim, Lists, 0),
    case lists:keyfind(Aim, 1, Reward) of
      {Aim, _NeedCount, _Award, _BStr} when Status == 2 ->
	  {error, lang:get(<<"该奖励已领取"/utf8>>)};
      {Aim, _NeedCount, _Award, _BStr} when Status == 0 ->
	  {error, lang:get(<<"奖励未激活"/utf8>>)};
      {Aim, _NeedCount, Award, _BStr} ->
	  Gain = format:val_to_gain(Award, holiday_func_coin),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole} ->
		log:log_gain(Gain, Role, NRole, <<"运营活动_远征精英"/utf8>>,
			     util:fbin("远征精英领取奖励:~w", [Aim])),
		NewList = lists:keystore(Aim, 1, Lists, {Aim, 2}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole,
						 {Count, RankCount, NewList},
						 ExpireSec),
		holiday_lib:push_holiday_one(NewRole, Bid),
		holiday:push_bid_can_reward(NewRole, Bid),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      _ -> {error, lang:get(<<"奖励信息不存在"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = 7005, camp_id = CampId,
			bid = Bid, reward = [Reward, _]},
     Role, Aim, _Arg) ->
    {Count, MaxId, MaxNum, Lists} = case
				      holiday_lib:get_tv_val(CampId, Bid, Role)
					of
				      {CountT, ListsT} ->
					  {CountT, 0, 0, ListsT};
				      {CountT, MaxIdT, MaxNumT, ListsT} ->
					  {CountT, MaxIdT, MaxNumT, ListsT}
				    end,
    Status = list_util:keyfind(Aim, Lists, 0),
    case lists:keyfind(Aim, 1, Reward) of
      {Aim, _NeedCount, _Award, _BStr} when Status == 2 ->
	  {error, lang:get(<<"该奖励已领取"/utf8>>)};
      {Aim, _NeedCount, _Award, _BStr} when Status == 0 ->
	  {error, lang:get(<<"奖励未激活"/utf8>>)};
      {Aim, _NeedCount, Award, _BStr} ->
	  Gain = format:val_to_gain(Award, holiday_func_coin),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole} ->
		log:log_gain(Gain, Role, NRole, <<"运营活动_冒险集结"/utf8>>,
			     util:fbin("冒险集结领取奖励:~w", [Aim])),
		NewList = lists:keystore(Aim, 1, Lists, {Aim, 2}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole,
						 {Count, MaxId, MaxNum,
						  NewList},
						 ExpireSec),
		holiday_lib:push_holiday_one(NewRole, Bid),
		holiday:push_bid_can_reward(NewRole, Bid),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      _ -> {error, lang:get(<<"奖励信息不存在"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = 7009, camp_id = CampId,
			bid = Bid, reward = [Reward, _]},
     Role, Aim, _Arg) ->
    {Count, Lists} = holiday_lib:get_tv_val(CampId, Bid,
					    Role),
    Status = list_util:keyfind(Aim, Lists, 0),
    case lists:keyfind(Aim, 1, Reward) of
      {Aim, _NeedCount, _Award, _BStr} when Status == 2 ->
	  {error, lang:get(<<"该奖励已领取"/utf8>>)};
      {Aim, _NeedCount, _Award, _BStr} when Status == 0 ->
	  {error, lang:get(<<"奖励未激活"/utf8>>)};
      {Aim, _NeedCount, Award, _BStr} ->
	  Gain = format:val_to_gain(Award,
				    holiday_rank_secret_dun),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole} ->
		log:log_gain(Gain, Role, NRole, <<"运营活动_位面谜踪"/utf8>>,
			     util:fbin("位面谜踪领取奖励:~w", [Aim])),
		NewList = lists:keystore(Aim, 1, Lists, {Aim, 2}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole,
						 {Count, NewList}, ExpireSec),
		holiday_lib:push_holiday_one(NewRole, Bid),
		holiday:push_bid_can_reward(NewRole, Bid),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      _ -> {error, lang:get(<<"奖励信息不存在"/utf8>>)}
    end;
take(Holiday = #holiday{tbid = TBid, camp_id = CampId,
			bid = Bid, reward = [Reward, _]},
     Role, Aim, _Arg)
    when TBid =:= 7001 orelse
	   TBid =:= 7002 orelse TBid =:= 7003 ->
    {Count, Lists} = holiday_lib:get_tv_val(CampId, Bid,
					    Role),
    Status = list_util:keyfind(Aim, Lists, 0),
    case lists:keyfind(Aim, 1, Reward) of
      {Aim, _NeedCount, _Award, _BStr} when Status == 2 ->
	  {error, lang:get(<<"该奖励已领取"/utf8>>)};
      {Aim, _NeedCount, _Award, _BStr} when Status == 0 ->
	  {error, lang:get(<<"奖励未激活"/utf8>>)};
      {Aim, _NeedCount, Award, _BStr} ->
	  Gain = format:val_to_gain(Award, holiday_func_coin),
	  case role_gain:do_notice(Role, Gain) of
	    {ok, NRole} ->
		case TBid of
		  7001 ->
		      log:log_gain(Gain, Role, NRole, <<"运营活动_点石成金"/utf8>>,
				   util:fbin("点金活动领取奖励:~w", [Aim]));
		  7002 ->
		      log:log_gain(Gain, Role, NRole, <<"运营活动_速战达人"/utf8>>,
				   util:fbin("速战达人领取奖励:~w", [Aim]));
		  7003 ->
		      log:log_gain(Gain, Role, NRole, <<"运营活动_远航夺宝"/utf8>>,
				   util:fbin("远航夺宝领取奖励:~w", [Aim]))
		end,
		NewList = lists:keystore(Aim, 1, Lists, {Aim, 2}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NewRole = holiday_lib:set_tv_val(CampId, NRole,
						 {Count, NewList}, ExpireSec),
		holiday_lib:push_holiday_one(NewRole, Bid),
		holiday:push_bid_can_reward(NewRole, Bid),
		{ok, <<>>, NewRole};
	    {false, #loss{msg = Msg}} -> {error, Msg};
	    {false, #gain{msg = Msg}} -> {error, Msg}
	  end;
      _ -> {error, lang:get(<<"奖励信息不存在"/utf8>>)}
    end;
take(#holiday{bid = Bid}, Role, Aim, Arg) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule_rank662, _,
       {__Levelholiday_rule_rank662,
	__Tracesholiday_rule_rank662}}
	  when __Levelholiday_rule_rank662 band 8 /= 0 orelse
		 __Tracesholiday_rule_rank662 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule_rank}, {function, take},
			{line, 662}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]无法领取奖励[Bid:~w][Aim:~w][Arg:~w]",
				     [Role#role.name, Bid, Aim, Arg]),
		       none, 4096, 8, __Levelholiday_rule_rank662,
		       __Tracesholiday_rule_rank662, lager_event,
		       __Pidholiday_rule_rank662);
      _ -> ok
    end,
    {error, <<>>}.

handle_hd_7009_2020_02_18(Holiday = #holiday{camp_id =
						 CampId,
					     tbid = TBid,
					     start_time = StartTime,
					     end_time = EndTime}) ->
    Sid = sys_lib:srv_id(),
    NoSids = [<<"symlf_1">>, <<"symlf_2">>, <<"symlf_3">>,
	      <<"symlf_4">>, <<"symlf_5">>, <<"symlf_6">>],
    case TBid =:= 7009 andalso
	   not lists:member(Sid, NoSids) andalso
	     StartTime < 1582164000
	of
      true ->
	  case sys_env:get(hd_7009_2020_02_18) of
	    {_, _} -> skip;
	    _ ->
		Sid = sys_lib:srv_id(),
		sys_env:save(hd_7009_2020_02_18, {CampId, Sid}),
		case EndTime - date:unixtime() > 86400 of
		  true ->
		      do_reward(Holiday, #{flag => reward}),
		      util:set_timer({rank_clear, CampId}, 60,
				     {apply,
				      {holiday_rule_rank, clear_rank, [48]}});
		  _ -> skip
		end
	  end;
      _ -> skip
    end.

-spec init(#holiday{}) -> ok.

init(Holiday = #holiday{camp_id = CampId,
			tbid = TBid}) ->
    Now = date:unixtime(),
    {NextTime, MFA} = init_timer(Holiday, Now),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule_rank694, _,
       {__Levelholiday_rule_rank694,
	__Tracesholiday_rule_rank694}}
	  when __Levelholiday_rule_rank694 band 128 /= 0 orelse
		 __Tracesholiday_rule_rank694 /= [] ->
	  lager:do_log(debug,
		       [{module, holiday_rule_rank}, {function, init},
			{line, 694}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("时间:~w", [{CampId, TBid, NextTime}]),
		       none, 4096, 128, __Levelholiday_rule_rank694,
		       __Tracesholiday_rule_rank694, lager_event,
		       __Pidholiday_rule_rank694);
      _ -> ok
    end,
    case NextTime > 0 andalso NextTime < 86400 * 30 of
      true when TBid =/= 7004 ->
	  handle_hd_7009_2020_02_18(Holiday),
	  util:set_timer({rank, CampId}, NextTime, {apply, MFA});
      _ ->
	  Sid = sys_lib:srv_id(),
	  NoSids = [<<"symlf_1">>, <<"symlf_2">>, <<"symlf_3">>,
		    <<"symlf_4">>, <<"symlf_5">>, <<"symlf_6">>,
		    <<"symlf_301">>, <<"symlf_303">>, <<"symlf_307">>,
		    <<"symlf_308">>, <<"symlf_310">>, <<"symlf_314">>,
		    <<"symlf_321">>, <<"symlf_324">>, <<"symlf_333">>,
		    <<"symlf_336">>, <<"symlf_340">>, <<"symlf_342">>,
		    <<"symlf_343">>, <<"symlf_349">>, <<"symlf_352">>,
		    <<"symlf_355">>, <<"symlf_360">>, <<"symlf_364">>,
		    <<"symlf_365">>, <<"symlf_370">>, <<"symlf_377">>,
		    <<"symlf_379">>, <<"symlf_380">>, <<"symlf_381">>,
		    <<"symlf_386">>, <<"symlf_387">>, <<"symlf_391">>,
		    <<"symlf_392">>, <<"symlf_393">>, <<"symlf_394">>,
		    <<"symlf_395">>, <<"symlf_396">>, <<"symlf_397">>],
	  case TBid =:= 7004 andalso not lists:member(Sid, NoSids)
	      of
	    true ->
		util:unset_timer({rank, CampId}),
		case sys_env:get(hd_7004_2019_12_17) of
		  {_, _} -> skip;
		  _ ->
		      sys_env:save(hd_7004_2019_12_17, {CampId, Sid}),
		      do_reward(Holiday, #{flag => reward})
		end;
	    _ -> skip
	  end
    end,
    ok.

init_timer(#holiday{end_time = EndTime, bid = Bid,
		    tbid = TBid, camp_id = CampId},
	   Now)
    when TBid =:= 7001 orelse
	   TBid =:= 7002 orelse
	     TBid =:= 7003 orelse
	       TBid =:= 7004 orelse
		 TBid =:= 7005 orelse TBid =:= 7009 ->
    NextTime = EndTime - Now - 86400 + 2,
    RankType = case TBid of
		 7001 -> 34;
		 7002 -> 35;
		 7003 -> 36;
		 7004 -> 37;
		 7009 -> 48;
		 _ -> 41
	       end,
    util:set_timer({rank_clear, CampId}, EndTime - Now,
		   {apply, {holiday_rule_rank, clear_rank, [RankType]}}),
    {NextTime,
     {holiday_rule_rank, apply_reward,
      [Bid, #{flag => reward}]}};
init_timer(#holiday{camp_id = CampId,
		    end_time = EndTime, tbid = TBid, bid = Bid},
	   Now)
    when TBid =:= 7006 ->
    RankType = 43,
    NextTime = EndTime - Now,
    util:set_timer({rank_clear, CampId}, NextTime,
		   {apply, {holiday_rule_rank, clear_rank, [RankType]}}),
    {NextTime,
     {holiday_rule_rank, apply_reward,
      [Bid, #{flag => reward}]}};
init_timer(#holiday{end_time = EndTime, bid = Bid},
	   Now) ->
    NextTime = EndTime - Now,
    {NextTime,
     {holiday_rule_rank, apply_reward,
      [Bid, #{flag => reward}]}}.

-spec apply_reward(integer(), map()) -> ok.

apply_reward(Bid, Args) ->
    Flag = maps:get(flag, Args, notice),
    case holiday_lib:get_holiday(Bid) of
      Holiday = #holiday{camp_id = CampId}
	  when Flag =:= reward ->
	  case check_do(CampId) of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_rank751, _,
		   {__Levelholiday_rule_rank751,
		    __Tracesholiday_rule_rank751}}
		      when __Levelholiday_rule_rank751 band 64 /= 0 orelse
			     __Tracesholiday_rule_rank751 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_rule_rank},
				    {function, apply_reward}, {line, 751},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("活动id:~w, 活动bid:~w, 执行排行结算",
						 [CampId, Bid]),
				   none, 4096, 64, __Levelholiday_rule_rank751,
				   __Tracesholiday_rule_rank751, lager_event,
				   __Pidholiday_rule_rank751);
		  _ -> ok
		end,
		do_reward(Holiday, Args);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidholiday_rule_rank754, _,
		   {__Levelholiday_rule_rank754,
		    __Tracesholiday_rule_rank754}}
		      when __Levelholiday_rule_rank754 band 64 /= 0 orelse
			     __Tracesholiday_rule_rank754 /= [] ->
		      lager:do_log(info,
				   [{module, holiday_rule_rank},
				    {function, apply_reward}, {line, 754},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("活动id:~w, 活动bid:~w, 执行排行结算判断失败, 已执行过排行结算",
						 [CampId, Bid]),
				   none, 4096, 64, __Levelholiday_rule_rank754,
				   __Tracesholiday_rule_rank754, lager_event,
				   __Pidholiday_rule_rank754);
		  _ -> ok
		end,
		ok
	  end;
      #holiday{} -> ok;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule_rank759, _,
	     {__Levelholiday_rule_rank759,
	      __Tracesholiday_rule_rank759}}
		when __Levelholiday_rule_rank759 band 8 /= 0 orelse
		       __Tracesholiday_rule_rank759 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule_rank},
			      {function, apply_reward}, {line, 759},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("活动~w已不存在:~w", [Bid, Args]), none,
			     4096, 8, __Levelholiday_rule_rank759,
			     __Tracesholiday_rule_rank759, lager_event,
			     __Pidholiday_rule_rank759);
	    _ -> ok
	  end
    end.

check_do(CampId)
    when CampId == 46058 orelse CampId == 44009 ->
    case get(holiday_rank_bug_camp_id) of
      L = [_ | _] ->
	  case lists:member(46058, L) orelse
		 lists:member(44009, L)
	      of
	    true -> false;
	    _ -> put(holiday_rank_bug_camp_id, [CampId | L]), true
	  end;
      _ -> put(holiday_rank_bug_camp_id, [CampId]), true
    end;
check_do(_CampId) -> true.

do_reward(#holiday{camp_id = _CampId, tbid = 7001,
		   reward = [_, RankAwardsT]},
	  _Args) ->
    RankAwards = lists:keysort(1, RankAwardsT),
    #rank{list = L} = rank_mgr:lookup(34),
    Fun = fun (#rank_rc{id = RoleId, idx = Rank}) ->
		  case [{LimitRank, AwardT}
			|| {_, LimitRank, AwardT} <- RankAwards,
			   Rank =< LimitRank]
		      of
		    [{_, Award} | _] ->
			{MailAssets, MailItems} =
			    format:split_assets_items(Award),
			Content =
			    color:msg(lang:get(<<"恭喜您在点石成金活动中获得了第~ts名的好名次。附件是活动的排行奖励，请注意查收"/utf8>>),
				      [{red, Rank}]),
			Mail = {lang:get(<<"点石成金活动排行奖励"/utf8>>), Content,
				MailAssets, MailItems,
				lang:get(<<"点石成金活动排行奖励"/utf8>>)},
			mail:send(RoleId, Mail);
		    _ -> ok
		  end
	  end,
    lists:map(Fun, L),
    ok;
do_reward(#holiday{camp_id = _CampId, tbid = 7002,
		   reward = [_, RankAwardsT]},
	  _Args) ->
    RankAwards = lists:keysort(1, RankAwardsT),
    #rank{list = L} = rank_mgr:lookup(35),
    Fun = fun (#rank_rc{id = RoleId, idx = Rank}) ->
		  case [{LimitRank, AwardT}
			|| {_, LimitRank, AwardT} <- RankAwards,
			   Rank =< LimitRank]
		      of
		    [{_, Award} | _] ->
			{MailAssets, MailItems} =
			    format:split_assets_items(Award),
			Content =
			    color:msg(lang:get(<<"恭喜您在速战达人活动中获得了第~ts名的好名次。附件是活动的排行奖励，请注意查收"/utf8>>),
				      [{red, Rank}]),
			Mail = {lang:get(<<"速战达人活动排行奖励"/utf8>>), Content,
				MailAssets, MailItems,
				lang:get(<<"速战达人活动排行奖励"/utf8>>)},
			mail:send(RoleId, Mail);
		    _ -> ok
		  end
	  end,
    lists:map(Fun, L),
    ok;
do_reward(#holiday{camp_id = _CampId, tbid = 7003,
		   reward = [_, RankAwardsT]},
	  _Args) ->
    RankAwards = lists:keysort(1, RankAwardsT),
    #rank{list = L} = rank_mgr:lookup(36),
    Fun = fun (#rank_rc{id = RoleId, idx = Rank}) ->
		  case [{LimitRank, AwardT}
			|| {_, LimitRank, AwardT} <- RankAwards,
			   Rank =< LimitRank]
		      of
		    [{_, Award} | _] ->
			{MailAssets, MailItems} =
			    format:split_assets_items(Award),
			Content =
			    color:msg(lang:get(<<"恭喜您在远航夺宝活动中获得了第~ts名的好名次。附件是活动的排行奖励，请注意查收"/utf8>>),
				      [{red, Rank}]),
			Mail = {lang:get(<<"远航夺宝活动排行奖励"/utf8>>), Content,
				MailAssets, MailItems,
				lang:get(<<"远航夺宝活动排行奖励"/utf8>>)},
			mail:send(RoleId, Mail);
		    _ -> ok
		  end
	  end,
    lists:map(Fun, L),
    ok;
do_reward(#holiday{camp_id = _CampId, tbid = 7004,
		   reward = [_, RankAwardsT]},
	  _Args) ->
    RankAwards = lists:keysort(1, RankAwardsT),
    #rank{list = L} = rank_mgr:lookup(37),
    Fun = fun (#rank_rc{id = RoleId, idx = Rank}) ->
		  case [{LimitRank, AwardT}
			|| {_, LimitRank, AwardT} <- RankAwards,
			   Rank =< LimitRank]
		      of
		    [{_, Award} | _] ->
			{MailAssets, MailItems} =
			    format:split_assets_items(Award),
			Content =
			    color:msg(lang:get(<<"恭喜您在远征精英活动中获得了第~ts名的好名次。附件是活动的排行奖励，请注意查收"/utf8>>),
				      [{red, Rank}]),
			Mail = {lang:get(<<"远征精英活动排行奖励"/utf8>>), Content,
				MailAssets, MailItems,
				lang:get(<<"远征精英活动排行奖励"/utf8>>)},
			mail:send(RoleId, Mail);
		    _ -> ok
		  end
	  end,
    lists:map(Fun, L),
    ok;
do_reward(#holiday{camp_id = _CampId, tbid = 7005,
		   reward = [_, RankAwardsT]},
	  _Args) ->
    RankAwards = lists:keysort(1, RankAwardsT),
    #rank{list = L} = rank_mgr:lookup(41),
    Fun = fun (#rank_rc{id = RoleId, idx = Rank}) ->
		  case [{LimitRank, AwardT}
			|| {_, LimitRank, AwardT} <- RankAwards,
			   Rank =< LimitRank]
		      of
		    [{_, Award} | _] ->
			{MailAssets, MailItems} =
			    format:split_assets_items(Award),
			Content =
			    color:msg(lang:get(<<"恭喜您在冒险集结活动中获得了第~ts名的好名次。附件是活动的排行奖励，请注意查收"/utf8>>),
				      [{red, Rank}]),
			Mail = {lang:get(<<"冒险集结活动排行奖励"/utf8>>), Content,
				MailAssets, MailItems,
				lang:get(<<"冒险集结活动排行奖励"/utf8>>)},
			mail:send(RoleId, Mail);
		    _ -> ok
		  end
	  end,
    lists:map(Fun, L),
    ok;
do_reward(#holiday{camp_id = _CampId, tbid = 7006},
	  _Args) ->
    #rank{list = L} = rank_mgr:lookup(43),
    Fun = fun (#rank_rc{id = RoleId, idx = Rank}) ->
		  case holiday_boss_data:rank_reward(Rank) of
		    Award = [_ | _] ->
			{MailAssets, MailItems} =
			    format:split_assets_items(Award),
			Content =
			    color:msg(lang:get(<<"亲爱的冒险者大人，恭喜您在星空试炼中获取了第~ts名的成绩，附件是您的奖励。请注意查收"/utf8>>),
				      [{red, Rank}]),
			Mail = {lang:get(<<"星空试炼奖励"/utf8>>), Content,
				MailAssets, MailItems,
				lang:get(<<"星空试炼奖励"/utf8>>)},
			mail:send(RoleId, Mail);
		    _ -> ok
		  end
	  end,
    lists:map(Fun, L),
    ok;
do_reward(#holiday{camp_id = _CampId, tbid = 7009,
		   reward = [_, RankAwardsT]},
	  _Args) ->
    RankAwards = lists:keysort(1, RankAwardsT),
    #rank{list = L} = rank_mgr:lookup(48),
    Fun = fun (#rank_rc{id = RoleId, idx = Rank}) ->
		  case [{LimitRank, AwardT}
			|| {_, LimitRank, AwardT} <- RankAwards,
			   Rank =< LimitRank]
		      of
		    [{_, Award} | _] ->
			{MailAssets, MailItems} =
			    format:split_assets_items(Award),
			Content =
			    color:msg(lang:get(<<"亲爱的冒险者大人：\n恭喜您在位面谜踪活动中获得了第~ts名的好名次。附件是活动的排行奖励"
						 "，请注意查收"/utf8>>),
				      [{red, Rank}]),
			Mail = {lang:get(<<"位面谜踪活动排行奖励"/utf8>>), Content,
				MailAssets, MailItems,
				lang:get(<<"位面谜踪活动排行奖励"/utf8>>)},
			mail:send(RoleId, Mail);
		    _ -> ok
		  end
	  end,
    lists:map(Fun, L),
    ok;
do_reward(#holiday{bid = Bid}, Args) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule_rank900, _,
       {__Levelholiday_rule_rank900,
	__Tracesholiday_rule_rank900}}
	  when __Levelholiday_rule_rank900 band 8 /= 0 orelse
		 __Tracesholiday_rule_rank900 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule_rank}, {function, do_reward},
			{line, 900}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("活动[~w]查找不到处理方法[Args:~w]", [Bid, Args]),
		       none, 4096, 8, __Levelholiday_rule_rank900,
		       __Tracesholiday_rule_rank900, lager_event,
		       __Pidholiday_rule_rank900);
      _ -> ok
    end.

-spec clear_rank(db | data) -> ok.

clear_rank(db) -> rank_mgr:clear([]);
clear_rank(data) -> rank_mgr:clear([]);
clear_rank(Type) ->
    log_rank:save(Type), rank_mgr:clear([Type]).

-spec pack(MyId :: tuple(), integer(),
	   integer()) -> tuple().

pack(MyId, RType, Len) ->
    #rank{list = L} = rank_mgr:lookup(RType),
    L1 = lists:sublist(L, Len),
    CliL = [{Rid, SrvId, Name, Sex, LookId, Lev, Val}
	    || #rank_rc{id = {Rid, SrvId}, name = Name,
			look_id = LookId, sex = Sex, lev = Lev, val1 = Val}
		   <- L1],
    case lists:keyfind(MyId, 3, L) of
      #rank_rc{idx = Idx} -> {Idx, CliL};
      _ -> {0, CliL}
    end.

-spec rank_type(integer()) -> integer().

rank_type(_Bid) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule_rank926, _,
       {__Levelholiday_rule_rank926,
	__Tracesholiday_rule_rank926}}
	  when __Levelholiday_rule_rank926 band 8 /= 0 orelse
		 __Tracesholiday_rule_rank926 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule_rank}, {function, rank_type},
			{line, 926}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("查找不到指定排行榜类型:~w", [_Bid]), none, 4096, 8,
		       __Levelholiday_rule_rank926,
		       __Tracesholiday_rule_rank926, lager_event,
		       __Pidholiday_rule_rank926);
      _ -> ok
    end,
    0.

-spec get_rank_award(#role{},
		     pos_integer()) -> {pos_integer(), list()}.

get_rank_award(#role{id = Id}, Bid) ->
    TBid = holiday_lib:get_tbid(Bid),
    RankType = case TBid of
		 7001 -> 34;
		 7002 -> 35;
		 7003 -> 36;
		 7004 -> 37;
		 7009 -> 48;
		 _ -> 41
	       end,
    {MyRank, _} = pack(Id, RankType, 1),
    case holiday_lib:get_holiday(Bid) of
      #holiday{reward = [_, Awards]} -> {MyRank, Awards};
      _ -> {MyRank, []}
    end.


