-file("src/mod/map/map.erl", 1).

-module(map).

-lager_records([{link,
		 [socket, conn_pid, ip, port, lag]},
		{condition, [label, op, val, msg]},
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
		{map_data,
		 [bid, type, name, def_xy, min_lev, max_lev, condition,
		  relive, width, height, grid_x, grid_y, max_pre_layer,
		  start_type, is_single, unit_list, tile_res_list]},
		{map_grid, [map_pid, map_id, base_id, width, height]},
		{map,
		 [id, srv_id, base_id, res_id, pid, ctrl_pid, grid_info,
		  name, condition, num, max_pre_layer, width, height,
		  dynamic_block, layer_flag]},
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

-behaviour(gen_server).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([start_link/1, stop/1, add_listener/3,
	 remove_listener/3, pack_send_to_all/3, apply_to_all/2,
	 role_enter/2, role_move/4, role_move/5, role_update/1,
	 role_update/2, role_looks/3, role_update_conn_pid/3,
	 role_leave/1, role_switch_layer/4, unit_enter/2,
	 unit_move/4, unit_update/2, unit_update/1, unit_leave/2,
	 unit_list/1, repush/1, can_see/2, dynamic_block/3,
	 apply_enter/4]).

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

-file("src/mod/map/map.erl", 48).

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

-file("src/mod/map/map.erl", 49).

-file("inc/map.hrl", 1).

-record(map,
	{id = 1  :: pos_integer(), srv_id = ""  :: bitstring(),
	 base_id = 1  :: pos_integer(),
	 res_id = 0  :: non_neg_integer(),
	 pid  :: undefined | pid(),
	 ctrl_pid  :: undefined | pid(),
	 grid_info = []  :: [{pid(), pos_integer()}],
	 name = ""  :: bitstring(), condition = []  :: list(),
	 num = 0  :: non_neg_integer(),
	 max_pre_layer = 20  :: pos_integer(),
	 width = 1  :: pos_integer(),
	 height = 1  :: pos_integer(),
	 dynamic_block = []  :: list(),
	 layer_flag = 0  :: non_neg_integer()}).

-record(map_grid,
	{map_pid  :: undefined | pid(),
	 map_id = 1  :: pos_integer(),
	 base_id = 1  :: pos_integer(),
	 width = 1  :: pos_integer(),
	 height = 1  :: pos_integer()}).

-record(map_data,
	{bid = 1  :: pos_integer(),
	 type = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 def_xy = {0, 0}  :: {pos_integer(), pos_integer()},
	 min_lev = 0  :: non_neg_integer(),
	 max_lev = 9999  :: non_neg_integer(),
	 condition = []  :: [tuple()], relive = []  :: [tuple()],
	 width = 1  :: pos_integer(),
	 height = 1  :: pos_integer(),
	 grid_x = 0  :: pos_integer(),
	 grid_y = 0  :: pos_integer(),
	 max_pre_layer = 60  :: pos_integer(),
	 start_type = 0  :: 0..1, is_single = 0  :: 0..1,
	 unit_list = []  :: [tuple()], tile_res_list = []}).

-file("src/mod/map/map.erl", 50).

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

-file("src/mod/map/map.erl", 51).

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

-file("src/mod/map/map.erl", 52).

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

-file("src/mod/map/map.erl", 53).

-file("inc/condition.hrl", 1).

-record(condition,
	{label  :: atom(),
	 op = eq  ::
	     ue | eq | lt | gt | le | ge | range | include,
	 val  :: term(), msg = <<>>  :: bitstring()}).

-file("src/mod/map/map.erl", 54).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/mod/map/map.erl", 55).

-spec start_link(#map{}) -> {ok, pid()} | ignore |
			    {error, term()}.

start_link(Map) ->
    gen_server:start_link(map, [Map], []).

-spec stop(pid()) -> ok.

stop(MapPid) when is_pid(MapPid) -> MapPid ! stop, ok;
stop(_) -> ok.

-spec pack_send_to_all(MapId :: pos_integer(),
		       Cmd :: pos_integer(), Data :: tuple()) -> ok |
								 {error,
								  term()}.

pack_send_to_all(0, _Code, _Data) -> ok;
pack_send_to_all(MapId, Code, Data) ->
    case catch sys_conn:pack(Code, Data) of
      {ok, Bin} -> send_to_all(MapId, Bin);
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap80, _, {__Levelmap80, __Tracesmap80}}
		when __Levelmap80 band 8 /= 0 orelse
		       __Tracesmap80 /= [] ->
		lager:do_log(error,
			     [{module, map}, {function, pack_send_to_all},
			      {line, 80}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("打包数据出错[Code:~w][Err:~w]",
					   [Code, Err]),
			     none, 4096, 8, __Levelmap80, __Tracesmap80,
			     lager_event, __Pidmap80);
	    _ -> ok
	  end,
	  {error, pack_error}
    end.

-spec send_to_all(MapInfo :: pos_integer() | pid(),
		  Bin :: any()) -> ok | {error, term()}.

send_to_all(0, _Bin) -> ok;
send_to_all(MapPid, Bin) when is_pid(MapPid) ->
    MapPid ! {send_to_all, Bin}, ok;
send_to_all(MapId, Bin) ->
    case map_mgr:pid(MapId) of
      {ok, MapPid} -> MapPid ! {send_to_all, Bin}, ok;
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap96, _, {__Levelmap96, __Tracesmap96}}
		when __Levelmap96 band 8 /= 0 orelse
		       __Tracesmap96 /= [] ->
		lager:do_log(error,
			     [{module, map}, {function, send_to_all},
			      {line, 96}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~w", [_Err]), none, 4096, 8,
			     __Levelmap96, __Tracesmap96, lager_event,
			     __Pidmap96);
	    _ -> ok
	  end,
	  {error, map_id_error}
    end.

apply_to_all(MapPid, MFA) when is_pid(MapPid) ->
    MapPid ! {async_apply, MFA};
apply_to_all(MapId, MFA) ->
    case map_mgr:pid(MapId) of
      {ok, MapPid} -> apply_to_all(MapPid, MFA);
      _ -> error
    end.

dynamic_block(MapPid, Id, Val)
    when is_pid(MapPid) andalso
	   is_integer(Id) andalso is_integer(Val) ->
    MapPid ! {dynamic_block, Id, Val}.

-spec role_enter(Entry, #role{}) -> {ok, NewRole} |
				    {error, bitstring()} when NewRole ::
								  #role{},
							      Entry :: Bid |
								       {MapId,
									DestX,
									DestY} |
								       {SrvId,
									MapId,
									DestX,
									DestY},
							      SrvId ::
								  bitstring(),
							      Bid ::
								  pos_integer(),
							      MapId ::
								  pos_integer(),
							      DestX ::
								  non_neg_integer(),
							      DestY ::
								  non_neg_integer().

role_enter(Bid, Role) when is_integer(Bid) ->
    case map_data:get(Bid) of
      #map_data{relive = Relive = [_ | _]} ->
	  {X, Y} = util:rand_list(Relive),
	  role_enter({Bid, X, Y}, Role);
      _ -> {error, lang:get(<<"地图不存在，无法进入"/utf8>>)}
    end;
role_enter({Map, DestX, DestY}, Role)
    when is_record(Map, map) ->
    do_enter(DestX, DestY, Map, undefined, Role);
role_enter({MapId, DestX, DestY}, Role) ->
    case map_mgr:info(MapId) of
      {error, not_found} ->
	  {error, lang:get(<<"地图不存在，无法进入"/utf8>>)};
      {ok, Map} ->
	  do_enter(DestX, DestY, Map, undefined, Role)
    end;
role_enter({<<>>, MapId, DestX, DestY}, Role) ->
    role_enter({MapId, DestX, DestY}, Role);
role_enter({SrvId, MapId, DestX, DestY}, Role) ->
    case map_mgr:info(SrvId, MapId) of
      {error, not_found} ->
	  {error, lang:get(<<"地图不存在，无法进入"/utf8>>)};
      {error, _} ->
	  {error, lang:get(<<"域外时空失去联系，无法进入"/utf8>>)};
      {ok, Map} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap144, _, {__Levelmap144, __Tracesmap144}}
		when __Levelmap144 band 128 /= 0 orelse
		       __Tracesmap144 /= [] ->
		lager:do_log(debug,
			     [{module, map}, {function, role_enter},
			      {line, 144}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~s", [SrvId]), none, 4096, 128,
			     __Levelmap144, __Tracesmap144, lager_event,
			     __Pidmap144);
	    _ -> ok
	  end,
	  do_enter(DestX, DestY, Map, undefined, Role)
    end;
role_enter({SrvId, MapId, MapGridPid, DestX, DestY},
	   Role) ->
    case map_mgr:info(SrvId, MapId) of
      {error, not_found} ->
	  {error, lang:get(<<"地图不存在，无法进入"/utf8>>)};
      {error, _} ->
	  {error, lang:get(<<"域外时空失去联系，无法进入"/utf8>>)};
      {ok, Map} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap152, _, {__Levelmap152, __Tracesmap152}}
		when __Levelmap152 band 128 /= 0 orelse
		       __Tracesmap152 /= [] ->
		lager:do_log(debug,
			     [{module, map}, {function, role_enter},
			      {line, 152}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~s, ~w", [SrvId, MapGridPid]), none,
			     4096, 128, __Levelmap152, __Tracesmap152,
			     lager_event, __Pidmap152);
	    _ -> ok
	  end,
	  do_enter(DestX, DestY, Map, MapGridPid, Role)
    end.

-spec role_move(non_neg_integer(), non_neg_integer(),
		Dir :: non_neg_integer(), #role{}) -> #role{}.

role_move(DestX, DestY, Dir, Role) ->
    role_move(DestX, DestY, Dir, true, Role).

role_move(DestX, DestY, Dir, IsPush,
	  Role = #role{id = RoleId, name = RoleName, pid = Rpid,
		       pos =
			   Pos = #pos{map_pid = MapPid, map_bid = MapBaseId,
				      x = Sx, y = Sy}}) ->
    {W, H} = case map_data:get(MapBaseId) of
	       #map_data{width = Width, height = Height} ->
		   {Width, Height};
	       _ -> {1500, 720}
	     end,
    Dx = if DestX =< 0 -> 0;
	    DestX > W -> W;
	    true -> DestX
	 end,
    Dy = if DestY =< 0 -> 0;
	    DestY > H -> H;
	    true -> DestY
	 end,
    MapPid !
      {role_move, RoleId, RoleName, Rpid, Sx, Sy, Dx, Dy, Dir,
       IsPush},
    NRole = Role#role{pos =
			  Pos#pos{x = Dx, y = Dy, dir = Dir}},
    NRole.

-spec role_update(#role{}) -> ok.

role_update(Role = #role{pos =
			     #pos{map_grid_pid = Pid, map_bid = BaseId}})
    when BaseId =/= 0 ->
    case role_convert:do(map_role, Role) of
      {ok, Mr} -> (map_lib:grid_mod(BaseId)):update(Pid, Mr);
      {error, Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap177, _, {__Levelmap177, __Tracesmap177}}
		when __Levelmap177 band 8 /= 0 orelse
		       __Tracesmap177 /= [] ->
		lager:do_log(error,
			     [{module, map}, {function, role_update},
			      {line, 177}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色转换失败: ~w", [Reason]), none, 4096,
			     8, __Levelmap177, __Tracesmap177, lager_event,
			     __Pidmap177);
	    _ -> ok
	  end
    end,
    ok;
role_update(#role{name = _Name}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap181, _, {__Levelmap181, __Tracesmap181}}
	  when __Levelmap181 band 128 /= 0 orelse
		 __Tracesmap181 /= [] ->
	  lager:do_log(debug,
		       [{module, map}, {function, role_update}, {line, 181},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]没有在地图中，忽略掉该刷新请求", [_Name]), none,
		       4096, 128, __Levelmap181, __Tracesmap181, lager_event,
		       __Pidmap181);
      _ -> ok
    end,
    ignore.

role_update(Role = #role{pos =
			     #pos{map_pid = MapPid, map_grid_pid = GridPid}},
	    to_map) ->
    case role_convert:do(map_role, Role) of
      {ok, Mr} -> MapPid ! {role_update, GridPid, Mr};
      {error, Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap188, _, {__Levelmap188, __Tracesmap188}}
		when __Levelmap188 band 8 /= 0 orelse
		       __Tracesmap188 /= [] ->
		lager:do_log(error,
			     [{module, map}, {function, role_update},
			      {line, 188}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色转换失败: ~w", [Reason]), none, 4096,
			     8, __Levelmap188, __Tracesmap188, lager_event,
			     __Pidmap188);
	    _ -> ok
	  end
    end,
    ok;
role_update(#role{name = _Name}, _) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap192, _, {__Levelmap192, __Tracesmap192}}
	  when __Levelmap192 band 128 /= 0 orelse
		 __Tracesmap192 /= [] ->
	  lager:do_log(debug,
		       [{module, map}, {function, role_update}, {line, 192},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]没有在地图中，忽略掉该刷新请求", [_Name]), none,
		       4096, 128, __Levelmap192, __Tracesmap192, lager_event,
		       __Pidmap192);
      _ -> ok
    end,
    ignore.

-spec role_looks(#role{}, list(), 0 | 1) -> ok.

role_looks(Role = #role{pos =
			    #pos{map_grid_pid = Pid, map_bid = BaseId}},
	   Looks, Type)
    when is_list(Looks) ->
    case role_convert:do(map_role, Role) of
      {ok, Mr} ->
	  (map_lib:grid_mod(BaseId)):update_looks(Pid,
						  {Mr, Looks, Type});
      {error, Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap200, _, {__Levelmap200, __Tracesmap200}}
		when __Levelmap200 band 8 /= 0 orelse
		       __Tracesmap200 /= [] ->
		lager:do_log(error,
			     [{module, map}, {function, role_looks},
			      {line, 200}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色转换失败: ~w", [Reason]), none, 4096,
			     8, __Levelmap200, __Tracesmap200, lager_event,
			     __Pidmap200);
	    _ -> ok
	  end
    end;
role_looks(#role{name = _Name}, _Looks, _Type) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap203, _, {__Levelmap203, __Tracesmap203}}
	  when __Levelmap203 band 128 /= 0 orelse
		 __Tracesmap203 /= [] ->
	  lager:do_log(debug,
		       [{module, map}, {function, role_looks}, {line, 203},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]没有在地图中，忽略掉该刷新请求", [_Name]), none,
		       4096, 128, __Levelmap203, __Tracesmap203, lager_event,
		       __Pidmap203);
      _ -> ok
    end,
    ignore.

-spec role_update_conn_pid(#role{}, pid(), pid()) -> ok.

role_update_conn_pid(#role{pid = Rpid,
			   pos = #pos{map_pid = MapPid}},
		     ConnPid, NewConnPid)
    when is_pid(MapPid) ->
    MapPid !
      {role_update_conn_pid, Rpid, ConnPid, NewConnPid},
    ok;
role_update_conn_pid(_Role, _ConnPid, _NewConnPid) ->
    ok.

-spec role_leave(#role{}) -> {ok, #role{}}.

role_leave(Role = #role{pos = undefined}) ->
    {ok, Role#role{pos = #pos{}}};
role_leave(Role = #role{pos = #pos{map_id = 0}}) ->
    {ok, Role};
role_leave(Role = #role{pos =
			    #pos{map_pid = undefined}}) ->
    {ok, Role};
role_leave(Role = #role{pid = Rpid,
			pos =
			    #pos{last = Last, map_pid = MapPid, dir = Dir}}) ->
    case is_pid(MapPid) of
      true -> MapPid ! {role_leave, Rpid};
      false -> ignore
    end,
    Role1 = Role#role{pos =
			  #pos{map_id = 0, last = Last, dir = Dir}},
    {ok, Role1}.

-spec role_switch_layer(#role{}, MapPid :: pid(),
			OldGPid :: pid(), NewGPid :: pid()) -> {ok, #role{}}.

role_switch_layer(Role = #role{pid = RolePid,
			       pos =
				   Pos = #pos{map_pid = MapPid,
					      map_grid_pid = OldGPid}},
		  MapPid, OldGPid, NewGPid)
    when is_pid(MapPid) andalso OldGPid =/= NewGPid ->
    MapPid ! {switch_layer, RolePid, OldGPid, NewGPid},
    {ok, Role#role{pos = Pos#pos{map_grid_pid = NewGPid}}};
role_switch_layer(Role, _MapPid, _OldGPid, _NewGPid) ->
    {ok, Role}.

apply_switch_layer_fail(Role = #role{name = Name,
				     pos =
					 Pos = #pos{map_pid = MapPid,
						    map_bid = BaseId,
						    map_grid_pid = NewGPid}},
			MapPid, OldGPid, NewGPid)
    when is_pid(MapPid) andalso OldGPid =/= NewGPid ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap243, _, {__Levelmap243, __Tracesmap243}}
	  when __Levelmap243 band 8 /= 0 orelse
		 __Tracesmap243 /= [] ->
	  lager:do_log(error,
		       [{module, map}, {function, apply_switch_layer_fail},
			{line, 243}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]在地图[~w]切换层失败：", [Name, BaseId]),
		       none, 4096, 8, __Levelmap243, __Tracesmap243,
		       lager_event, __Pidmap243);
      _ -> ok
    end,
    {ok, Role#role{pos = Pos#pos{map_grid_pid = OldGPid}}};
apply_switch_layer_fail(Role, _MapPid, _OldGPid,
			_NewGPid) ->
    {ok, Role}.

-spec unit_enter(pos_integer(), #map_unit{}) -> {ok,
						 pos_integer(), pid(),
						 pid() | 0} |
						error.

unit_enter(MapId, MapUnit) ->
    case map_mgr:info(MapId) of
      {ok,
       #map{base_id = BaseId, pid = MapPid,
	    grid_info = GridInfo}} ->
	  MapPid ! {unit_enter, MapUnit},
	  GridPid = case GridInfo of
		      [{GridPid1, _} | _] -> GridPid1;
		      _ -> 0
		    end,
	  {ok, BaseId, MapPid, GridPid};
      _ -> error
    end.

-spec unit_move(MapPid, Unit, DestX,
		DestY) -> ok when MapPid :: pid(), Unit :: #unit{},
				  DestX :: non_neg_integer(),
				  DestY :: non_neg_integer().

unit_move(MapPid,
	  #unit{id = UnitId, base_id = UnitBaseId,
		type = UnitType, disabled = Disabled},
	  DestX, DestY) ->
    MapPid !
      {unit_move, UnitId, UnitBaseId, UnitType, DestX, DestY,
       Disabled},
    ok.

-spec unit_update(#unit{}) -> ok.

unit_update(Unit = #unit{pos = #pos{map_pid = MapPid}})
    when is_pid(MapPid) ->
    {ok, MapUnit} = unit_convert:to(map_unit, Unit),
    unit_update(MapPid, MapUnit).

-spec unit_update(pid(), #map_unit{}) -> ok.

unit_update(MapPid, MapUnit) ->
    MapPid ! {unit_update, MapUnit}, ok.

-spec unit_leave(pid(), UnitId :: tuple()) -> ok.

unit_leave(MapPid, UnitId) when is_pid(MapPid) ->
    MapPid ! {unit_leave, UnitId}, ok;
unit_leave(MapPid, UnitId) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap291, _, {__Levelmap291, __Tracesmap291}}
	  when __Levelmap291 band 8 /= 0 orelse
		 __Tracesmap291 /= [] ->
	  lager:do_log(error,
		       [{module, map}, {function, unit_leave}, {line, 291},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("单位移除错误指令:[~w, ~w]", [MapPid, UnitId]),
		       none, 4096, 8, __Levelmap291, __Tracesmap291,
		       lager_event, __Pidmap291);
      _ -> ok
    end,
    ok.

-spec unit_list(pid()) -> {ok, [#map_unit{}]} |
			  {error, term()}.

unit_list(MapPid) ->
    case catch gen_server:call(MapPid, get_unit_list, 10000)
	of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap297, _, {__Levelmap297, __Tracesmap297}}
		when __Levelmap297 band 8 /= 0 orelse
		       __Tracesmap297 /= [] ->
		lager:do_log(error,
			     [{module, map}, {function, unit_list}, {line, 297},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [MapPid, get_unit_list, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelmap297, __Tracesmap297,
			     lager_event, __Pidmap297);
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

-spec repush(#role{}) -> ok.

repush(#role{pid = RolePid,
	     pos = #pos{map_pid = MapPid},
	     link = #link{conn_pid = ConnPid}})
    when is_pid(MapPid) ->
    MapPid ! {repush, ConnPid, RolePid};
repush(_Role = #role{pid = RolePid}) ->
    role:stop(async, RolePid, kick,
	      lang:get(<<"连接断开，请刷新重新登录"/utf8>>)),
    ok.

-spec can_see(Pos1 :: #pos{}, Pos2 :: #pos{}) -> true |
						 false.

can_see(Pos1, Pos2) ->
    case calc_distance(Pos1, Pos2) of
      {ok, {Dx, Dy}} when Dx =< 1 andalso Dy < 1 -> true;
      _Other -> false
    end.

-spec add_listener(pid(), atom, pid()) -> ok.

add_listener(MapPid, Type, RecvPid) ->
    MapPid ! {add_listener, Type, RecvPid}.

-spec remove_listener(pid(), atom, pid()) -> ok.

remove_listener(MapPid, Type, RecvPid) ->
    MapPid ! {remove_listener, Type, RecvPid}, ok.

init([Map = #map{base_id = BaseId,
		 max_pre_layer = MaxPreLayer}]) ->
    process_flag(trap_exit, true),
    put(role_pids, []),
    put(unit_list, []),
    put(map_grid_mode, map_lib:grid_mod(BaseId)),
    {ok, GridPid} = grid_start(Map),
    NewMap = Map#map{pid = self(),
		     grid_info = [{GridPid, 0}],
		     max_pre_layer = MaxPreLayer},
    #map_data{unit_list = UnitList} = map_data:get(BaseId),
    sync(NewMap),
    create_unit(UnitList, NewMap),
    {ok, NewMap}.

handle_call(get_unit_list, _From, State) ->
    {reply, {ok, get(unit_list)}, State};
handle_call(_Request, _From, Map) -> {noreply, Map}.

handle_cast(_Msg, Map) -> {noreply, Map}.

handle_info({dynamic_block, Id, Val},
	    Map = #map{base_id = Bid, dynamic_block = List}) ->
    NewList = lists:keystore(Id, 1, List, {Id, Val}),
    NewMap = Map#map{dynamic_block = NewList},
    {ok, Msg} = proto_102:pack(10211, srv, {Bid, NewList}),
    do_cast(get(role_pids), Msg),
    {noreply, NewMap};
handle_info(open_layer,
	    Map = #map{grid_info = MapInfo}) ->
    {ok, GridPid} = grid_start(Map),
    NewMap = Map#map{grid_info = MapInfo ++ [{GridPid, 0}]},
    {noreply, NewMap};
handle_info(set_layer_max,
	    Map = #map{max_pre_layer = MaxPreLayer}) ->
    {noreply,
     Map#map{max_pre_layer = max(500, MaxPreLayer)}};
handle_info({role_enter,
	     MapRole = #map_role{pid = Pid, conn_pid = ConnPid,
				 name = _Name, x = X, y = Y, dir = Dir},
	     MapGridPid},
	    Map = #map{srv_id = SrvId, base_id = MapBaseId,
		       res_id = ResId, grid_info = GridInfo, num = Num,
		       width = W, height = H, dynamic_block = DynamicBlock})
    when is_pid(MapGridPid) ->
    case get({role, Pid}) of
      undefined ->
	  case lists:keyfind(MapGridPid, 1, GridInfo) of
	    {Gpid, Gnum} ->
		Dx = if X =< 0 -> 0;
			X > W -> W;
			true -> X
		     end,
		Dy = if Y =< 0 -> 0;
			Y > H -> H;
			true -> Y
		     end,
		Mr = MapRole#map_role{grid_pid = Gpid, x = Dx, y = Dy},
		put({role, Pid}, Mr),
		put(role_pids, [{ConnPid, Pid} | get(role_pids)]),
		put({role_ref, Pid}, erlang:monitor(process, Pid)),
		sys_conn:pack_send(ConnPid, 10210,
				   {MapBaseId, ResId, Dx, Dy, Dir}),
		sys_conn:pack_send(ConnPid, 10211,
				   {MapBaseId, DynamicBlock}),
		sys_conn:pack_send(ConnPid, 10220, {get(unit_list)}),
		(get(map_grid_mode)):enter(Gpid, Mr),
		NewMap = Map#map{grid_info =
				     lists:keyreplace(Gpid, 1, GridInfo,
						      {Gpid, Gnum + 1}),
				 num = Num + 1},
		sync(NewMap),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmap396, _, {__Levelmap396, __Tracesmap396}}
		      when __Levelmap396 band 128 /= 0 orelse
			     __Tracesmap396 /= [] ->
		      lager:do_log(debug,
				   [{module, map}, {function, handle_info},
				    {line, 396}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("角色[~ts]进入地图[~w]成功",
						 [_Name, MapBaseId]),
				   none, 4096, 128, __Levelmap396,
				   __Tracesmap396, lager_event, __Pidmap396);
		  _ -> ok
		end,
		role:apply(async, Pid,
			   {map, apply_enter, [SrvId, MapBaseId, Gpid]}),
		{noreply, NewMap};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmap400, _, {__Levelmap400, __Tracesmap400}}
		      when __Levelmap400 band 8 /= 0 orelse
			     __Tracesmap400 /= [] ->
		      lager:do_log(error,
				   [{module, map}, {function, handle_info},
				    {line, 400}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("角色[~ts]请求进入的地图层[~w]不存在",
						 [_Name, MapGridPid]),
				   none, 4096, 8, __Levelmap400, __Tracesmap400,
				   lager_event, __Pidmap400);
		  _ -> ok
		end,
		self() ! {role_enter, MapRole, undefined},
		{noreply, Map}
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
	    {__Pidmap405, _, {__Levelmap405, __Tracesmap405}}
		when __Levelmap405 band 128 /= 0 orelse
		       __Tracesmap405 /= [] ->
		lager:do_log(debug,
			     [{module, map}, {function, handle_info},
			      {line, 405}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]进入地图失败，已经在地图中，不能重复进入",
					   [_Name]),
			     none, 4096, 128, __Levelmap405, __Tracesmap405,
			     lager_event, __Pidmap405);
	    _ -> ok
	  end,
	  {noreply, Map}
    end;
handle_info({role_enter,
	     MapRole = #map_role{pid = Pid, conn_pid = ConnPid,
				 name = _Name, x = X, y = Y, dir = Dir},
	     _MapGridPid},
	    Map = #map{base_id = MapBaseId, res_id = ResId,
		       grid_info = GridInfo, num = Num,
		       max_pre_layer = MaxPreLayer, width = W, height = H,
		       srv_id = SrvId}) ->
    case get({role, Pid}) of
      undefined ->
	  {GridPid, GridNum} = get_layer(GridInfo, MaxPreLayer,
					 Num),
	  {Gnew, Gpid, Gnum} = case GridNum >= MaxPreLayer of
				 false -> {false, GridPid, GridNum};
				 true ->
				     case grid_start(Map) of
				       {ok, NewGridPid} when NewGridPid =/= 0 ->
					   {true, NewGridPid, 1};
				       _Err -> {false, GridPid, GridNum}
				     end
			       end,
	  Dx = if X =< 0 -> 0;
		  X > W -> W;
		  true -> X
	       end,
	  Dy = if Y =< 0 -> 0;
		  Y > H -> H;
		  true -> Y
	       end,
	  Mr = MapRole#map_role{grid_pid = Gpid, x = Dx, y = Dy},
	  put({role, Pid}, Mr),
	  put(role_pids, [{ConnPid, Pid} | get(role_pids)]),
	  put({role_ref, Pid}, erlang:monitor(process, Pid)),
	  sys_conn:pack_send(ConnPid, 10210,
			     {MapBaseId, ResId, Dx, Dy, Dir}),
	  sys_conn:pack_send(ConnPid, 10220, {get(unit_list)}),
	  (get(map_grid_mode)):enter(Gpid, Mr),
	  NewMap = case Gnew of
		     true ->
			 Map#map{grid_info = GridInfo ++ [{Gpid, Gnum}],
				 num = Num + 1};
		     false ->
			 Map#map{grid_info =
				     lists:keyreplace(Gpid, 1, GridInfo,
						      {Gpid, Gnum + 1}),
				 num = Num + 1}
		   end,
	  sync(NewMap),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap441, _, {__Levelmap441, __Tracesmap441}}
		when __Levelmap441 band 128 /= 0 orelse
		       __Tracesmap441 /= [] ->
		lager:do_log(debug,
			     [{module, map}, {function, handle_info},
			      {line, 441}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]进入地图[~w]成功",
					   [_Name, MapBaseId]),
			     none, 4096, 128, __Levelmap441, __Tracesmap441,
			     lager_event, __Pidmap441);
	    _ -> ok
	  end,
	  role:apply(async, Pid,
		     {map, apply_enter, [SrvId, MapBaseId, Gpid]}),
	  {noreply, NewMap};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap445, _, {__Levelmap445, __Tracesmap445}}
		when __Levelmap445 band 128 /= 0 orelse
		       __Tracesmap445 /= [] ->
		lager:do_log(debug,
			     [{module, map}, {function, handle_info},
			      {line, 445}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]进入地图失败，已经在地图中，不能重复进入",
					   [_Name]),
			     none, 4096, 128, __Levelmap445, __Tracesmap445,
			     lager_event, __Pidmap445);
	    _ -> ok
	  end,
	  {noreply, Map}
    end;
handle_info({repush, ConnPid, RolePid},
	    Map = #map{base_id = MapBaseId, res_id = ResId}) ->
    case get({role, RolePid}) of
      Mr = #map_role{grid_pid = GridPid, x = X, y = Y,
		     dir = Dir} ->
	  put({role, RolePid}, Mr#map_role{conn_pid = ConnPid}),
	  sys_conn:pack_send(ConnPid, 10210,
			     {MapBaseId, ResId, X, Y, Dir}),
	  sys_conn:pack_send(ConnPid, 10220, {get(unit_list)}),
	  put(role_pids,
	      [{ConnPid, RolePid} | lists:keydelete(RolePid, 2,
						    get(role_pids))]),
	  (get(map_grid_mode)):repush(GridPid,
				      Mr#map_role{conn_pid = ConnPid});
      _ ->
	  role:stop(async, RolePid, kick,
		    lang:get(<<"连接断开，请刷新重新登录"/utf8>>))
    end,
    {noreply, Map};
handle_info({add_listener, Type, Pid}, State)
    when is_atom(Type) andalso is_pid(Pid) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap465, _, {__Levelmap465, __Tracesmap465}}
	  when __Levelmap465 band 128 /= 0 orelse
		 __Tracesmap465 /= [] ->
	  lager:do_log(debug,
		       [{module, map}, {function, handle_info}, {line, 465},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("地图接收到事件增加：~w ~w", [Type, Pid]), none,
		       4096, 128, __Levelmap465, __Tracesmap465, lager_event,
		       __Pidmap465);
      _ -> ok
    end,
    case get({listener, Type}) of
      undefined -> put({listener, Type}, [Pid]);
      L -> put({listener, Type}, [Pid | L])
    end,
    {noreply, State};
handle_info({add_listener, _Type, _Pid}, State) ->
    {noreply, State};
handle_info({remove_listener, Type, Pid}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap476, _, {__Levelmap476, __Tracesmap476}}
	  when __Levelmap476 band 128 /= 0 orelse
		 __Tracesmap476 /= [] ->
	  lager:do_log(debug,
		       [{module, map}, {function, handle_info}, {line, 476},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("地图接收到事件删除：~w ~w", [Type, Pid]), none,
		       4096, 128, __Levelmap476, __Tracesmap476, lager_event,
		       __Pidmap476);
      _ -> ok
    end,
    case get({listener, Type}) of
      undefined -> ignore;
      L -> put({listener, Type}, lists:delete(Pid, L))
    end,
    {noreply, State};
handle_info({role_update_conn_pid, RolePid, ConnPid,
	     NewConnPid},
	    Map) ->
    case get({role, RolePid}) of
      Mr = #map_role{x = X, y = Y, grid_pid = GridPid} ->
	  put({role, RolePid},
	      Mr#map_role{conn_pid = NewConnPid}),
	  put(role_pids,
	      [{NewConnPid, RolePid} | lists:keydelete(RolePid, 2,
						       get(role_pids))]),
	  (get(map_grid_mode)):update_conn_pid(GridPid, RolePid,
					       X, Y, ConnPid, NewConnPid);
      _ -> ignore
    end,
    {noreply, Map};
handle_info({role_move, _RoleId, _RoleName, Rpid, _Sx,
	     _Sy, Dx, Dy, Dir, IsPush},
	    Map = #map{width = _W, height = _H}) ->
    case get({role, Rpid}) of
      R = #map_role{grid_pid = GridPid, x = SrcX, y = SrcY} ->
	  put({role, Rpid},
	      R#map_role{x = Dx, y = Dy, dir = Dir}),
	  (get(map_grid_mode)):move(GridPid,
				    {Rpid, SrcX, SrcY, Dx, Dy, Dir, IsPush});
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap505, _, {__Levelmap505, __Tracesmap505}}
		when __Levelmap505 band 128 /= 0 orelse
		       __Tracesmap505 /= [] ->
		lager:do_log(debug,
			     [{module, map}, {function, handle_info},
			      {line, 505}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "角色移动处理失败，该角色不在地图中", none, 4096, 128,
			     __Levelmap505, __Tracesmap505, lager_event,
			     __Pidmap505);
	    _ -> ok
	  end
    end,
    {noreply, Map};
handle_info({role_update, GridPid, Mr},
	    Map = #map{base_id = _BaseId}) ->
    (get(map_grid_mode)):update(GridPid, Mr),
    {noreply, Map};
handle_info({send_to_all, Bin}, State) ->
    do_cast(get(role_pids), Bin), {noreply, State};
handle_info({apply_async, MFA}, State) ->
    do_apply(get(role_pids), MFA), {noreply, State};
handle_info({'DOWN', _Ref, _Type, Rpid, _Reason},
	    Map) ->
    {noreply, do_leave(Map, erase({role, Rpid}))};
handle_info({role_leave, Rpid}, Map) ->
    case get({role, Rpid}) of
      undefined ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap531, _, {__Levelmap531, __Tracesmap531}}
		when __Levelmap531 band 128 /= 0 orelse
		       __Tracesmap531 /= [] ->
		lager:do_log(debug,
			     [{module, map}, {function, handle_info},
			      {line, 531}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "角色离开地图失败，该角色不在地图中", none, 4096, 128,
			     __Levelmap531, __Tracesmap531, lager_event,
			     __Pidmap531);
	    _ -> ok
	  end,
	  {noreply, Map};
      _ -> {noreply, do_leave(Map, erase({role, Rpid}))}
    end;
handle_info({unit_enter,
	     MapUnit = #map_unit{id = UnitId, name = _Name, x = X,
				 y = Y}},
	    State = #map{width = W, height = H}) ->
    UnitList = get(unit_list),
    case lists:keyfind(UnitId, #map_unit.id, UnitList) of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap542, _, {__Levelmap542, __Tracesmap542}}
		when __Levelmap542 band 128 /= 0 orelse
		       __Tracesmap542 /= [] ->
		lager:do_log(debug,
			     [{module, map}, {function, handle_info},
			      {line, 542}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("地图单位[~w:~ts]进入了地图",
					   [UnitId, _Name]),
			     none, 4096, 128, __Levelmap542, __Tracesmap542,
			     lager_event, __Pidmap542);
	    _ -> ok
	  end,
	  Dx = if X =< 0 -> 0;
		  X > W -> W;
		  true -> X
	       end,
	  Dy = if Y =< 0 -> 0;
		  Y > H -> H;
		  true -> Y
	       end,
	  Unit = MapUnit#map_unit{x = Dx, y = Dy},
	  put(unit_list, [Unit | UnitList]),
	  {ok, Msg} = proto_102:pack(10260, srv, MapUnit),
	  do_cast(get(role_pids), Msg);
      _ -> ignore
    end,
    {noreply, State};
handle_info({unit_move, UnitId = {BattleId, Id},
	     _UnitBaseId, _UnitType, DestX, DestY, _Disabled},
	    State = #map{width = W, height = H}) ->
    UnitList = get(unit_list),
    NewState = case lists:keyfind(UnitId, #map_unit.id,
				  UnitList)
		   of
		 false ->
		     case {whereis(lager_event), whereis(lager_event),
			   lager_config:get({lager_event, loglevel}, {0, []})}
			 of
		       {undefined, undefined, _} ->
			   fun () -> {error, lager_not_running} end();
		       {undefined, _, _} ->
			   fun () -> {error, {sink_not_configured, lager_event}}
			   end();
		       {__Pidmap559, _, {__Levelmap559, __Tracesmap559}}
			   when __Levelmap559 band 128 /= 0 orelse
				  __Tracesmap559 /= [] ->
			   lager:do_log(debug,
					[{module, map}, {function, handle_info},
					 {line, 559},
					 {pid, pid_to_list(self())},
					 {node, node()}
					 | lager:md()],
					"无效的移动操作", none, 4096, 128,
					__Levelmap559, __Tracesmap559,
					lager_event, __Pidmap559);
		       _ -> ok
		     end,
		     State;
		 N = #map_unit{name = _Name} ->
		     Dx = if DestX =< 0 -> 0;
			     DestX > W -> W;
			     true -> DestX
			  end,
		     Dy = if DestY =< 0 -> 0;
			     DestY > H -> H;
			     true -> DestY
			  end,
		     NewN = N#map_unit{x = Dx, y = Dy},
		     put(unit_list,
			 lists:keyreplace(UnitId, #map_unit.id, UnitList,
					  NewN)),
		     {ok, Msg} = proto_102:pack(10264, srv,
						{BattleId, Id, Dx, Dy}),
		     do_cast(get(role_pids), Msg),
		     State
	       end,
    {noreply, NewState};
handle_info({unit_update,
	     MapUnit = #map_unit{id = UnitId}},
	    State = #map{}) ->
    UnitList = get(unit_list),
    case lists:keyfind(UnitId, #map_unit.id, UnitList) of
      false -> ignore;
      #map_unit{x = X, y = Y} ->
	  NewN = MapUnit#map_unit{x = X, y = Y},
	  put(unit_list,
	      lists:keyreplace(UnitId, #map_unit.id, UnitList, NewN)),
	  {ok, Msg} = proto_102:pack(10266, srv, NewN),
	  do_cast(get(role_pids), Msg)
    end,
    {noreply, State};
handle_info({unit_leave, UnitId}, State = #map{}) ->
    UnitList = get(unit_list),
    case lists:keyfind(UnitId, #map_unit.id, UnitList) of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap591, _, {__Levelmap591, __Tracesmap591}}
		when __Levelmap591 band 128 /= 0 orelse
		       __Tracesmap591 /= [] ->
		lager:do_log(debug,
			     [{module, map}, {function, handle_info},
			      {line, 591}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("离开地图失败:地图单位[~w]不在地图中", [UnitId]),
			     none, 4096, 128, __Levelmap591, __Tracesmap591,
			     lager_event, __Pidmap591);
	    _ -> ok
	  end,
	  {noreply, State};
      _Unit ->
	  put(unit_list,
	      lists:keydelete(UnitId, #map_unit.id, UnitList)),
	  {ok, Msg} = proto_102:pack(10262, srv, UnitId),
	  do_cast(get(role_pids), Msg),
	  {noreply, State}
    end;
handle_info(check_layer,
	    Map = #map{num = RNum, max_pre_layer = MaxLayer,
		       grid_info = GridInfo, layer_flag = LayerFlag}) ->
    LayerNum = length(GridInfo),
    N = MaxLayer div 2,
    NewMap = case LayerNum > 1 andalso
		    (LayerNum - 1) * MaxLayer - N > RNum
		 of
	       true when LayerFlag >= 3 ->
		   case lists:keysort(2, GridInfo) of
		     [{Gpid, Num1}, {NextGPid, _Num2} | _] when Num1 < 20 ->
			 Self = self(),
			 [role:apply(async, Pid,
				     {map, role_switch_layer,
				      [Self, Gpid, NextGPid]})
			  || {{role, Pid}, #map_role{grid_pid = GridPid}}
				 <- get(),
			     Gpid =:= GridPid],
			 Map#map{layer_flag = 0};
		     _ -> Map#map{layer_flag = LayerFlag + 1}
		   end;
	       true -> Map#map{layer_flag = LayerFlag + 1};
	       _ -> Map#map{layer_flag = 0}
	     end,
    {noreply, NewMap};
handle_info({switch_layer, RolePid, OldGPid, NewGPid},
	    Map = #map{grid_info = GridInfo}) ->
    case get({role, RolePid}) of
      OldMr = #map_role{grid_pid = OldGPid, rid = Rid,
			srv_id = SrvId, x = X, y = Y} ->
	  case lists:keyfind(NewGPid, 1, GridInfo) of
	    {NewGPid, NewGNum} ->
		(get(map_grid_mode)):leave(OldGPid, RolePid, X, Y, Rid,
					   SrvId),
		NewGridInfo = case lists:keyfind(OldGPid, 1, GridInfo)
				  of
				false -> GridInfo;
				{OldGPid, Gnum} when Gnum > 1 ->
				    lists:keyreplace(OldGPid, 1, GridInfo,
						     {OldGPid, Gnum - 1});
				_ ->
				    (get(map_grid_mode)):stop(OldGPid),
				    lists:keydelete(OldGPid, 1, GridInfo)
			      end,
		Mr = OldMr#map_role{grid_pid = NewGPid},
		put({role, RolePid}, Mr),
		NewMap = Map#map{grid_info =
				     lists:keyreplace(NewGPid, 1, NewGridInfo,
						      {NewGPid, NewGNum + 1})},
		(get(map_grid_mode)):enter(NewGPid, Mr),
		sync(NewMap),
		{noreply, NewMap};
	    _ ->
		role:apply(async, RolePid,
			   {fun apply_switch_layer_fail/4,
			    [self(), OldGPid, NewGPid]}),
		{noreply, Map}
	  end;
      _ -> {noreply, Map}
    end;
handle_info({say, _SayData}, Map) -> {noreply, Map};
handle_info(stop, State) -> {stop, normal, State};
handle_info({'EXIT', _, normal}, Map) -> {noreply, Map};
handle_info(_Info, Map = #map{base_id = BaseId}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap664, _, {__Levelmap664, __Tracesmap664}}
	  when __Levelmap664 band 8 /= 0 orelse
		 __Tracesmap664 /= [] ->
	  lager:do_log(error,
		       [{module, map}, {function, handle_info}, {line, 664},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("地图[~w]收到未知消息: ~w", [BaseId, _Info]),
		       none, 4096, 8, __Levelmap664, __Tracesmap664,
		       lager_event, __Pidmap664);
      _ -> ok
    end,
    {noreply, Map}.

terminate(_Reason,
	  #map{id = Id, grid_info = GridInfo,
	       base_id = _BaseId}) ->
    lists:map(fun ({Pid, _}) ->
		      (get(map_grid_mode)):stop(Pid)
	      end,
	      GridInfo),
    catch ets:delete(map_info, Id),
    lists:foreach(fun (#map_unit{activity = Activity,
				 id = UnitId})
			  when Activity =:= 0 ->
			  catch ets:delete(unit_info, UnitId), ok;
		      (_) -> skip
		  end,
		  get(unit_list)),
    ok.

code_change(_OldVsn, Map, _Extra) -> {ok, Map}.

sync(Map) -> ets:insert(map_info, Map).

do_enter(DestX, DestY,
	 #map{width = W, height = H, base_id = BaseId},
	 _MapGridPid, _Role)
    when DestX < 0 orelse
	   DestY < 0 orelse DestX > W orelse DestY > H ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap695, _, {__Levelmap695, __Tracesmap695}}
	  when __Levelmap695 band 8 /= 0 orelse
		 __Tracesmap695 /= [] ->
	  lager:do_log(error,
		       [{module, map}, {function, do_enter}, {line, 695},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("进入地图[~w]坐标错误:DestX:~w DestY:~w width:~w "
				     "height:~w",
				     [BaseId, DestX, DestY, W, H]),
		       none, 4096, 8, __Levelmap695, __Tracesmap695,
		       lager_event, __Pidmap695);
      _ -> ok
    end,
    {error, lang:get(<<"地图坐标错误"/utf8>>)};
do_enter(DestX, DestY,
	 #map{id = MapId, srv_id = SrvId, base_id = BaseId,
	      pid = Pid, condition = Cond},
	 MapGridPid, Role = #role{pos = OldPos}) ->
    case role_cond:check(Cond, Role) of
      {false, #condition{msg = Msg}} -> {error, Msg};
      true ->
	  {ok, Role1 = #role{pos = Pos}} = role_leave(Role),
	  Dir = case {OldPos, Pos} of
		  {#pos{map_id = MapId, dir = Dir1}, _} -> Dir1;
		  {_, #pos{dir = Dir1}} -> Dir1;
		  _ -> 0
		end,
	  Pos1 = Pos#pos{srv_id = SrvId, map_id = MapId,
			 map_bid = BaseId, map_pid = Pid, x = DestX, y = DestY,
			 hidden = 1, dir = Dir},
	  NRole = Role1#role{pos = Pos1},
	  {ok, MapRole} = role_convert:do(map_role, NRole),
	  Pid ! {role_enter, MapRole, MapGridPid},
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap715, _, {__Levelmap715, __Tracesmap715}}
		when __Levelmap715 band 128 /= 0 orelse
		       __Tracesmap715 /= [] ->
		lager:do_log(debug,
			     [{module, map}, {function, do_enter}, {line, 715},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~ts==MapGridPid:~w",
					   [Role#role.name, MapGridPid]),
			     none, 4096, 128, __Levelmap715, __Tracesmap715,
			     lager_event, __Pidmap715);
	    _ -> ok
	  end,
	  {ok, NRole}
    end.

apply_enter(Role = #role{pos =
			     Pos = #pos{srv_id = SrvId, map_bid = BaseId}},
	    SrvId, BaseId, Gpid) ->
    Role1 = Role#role{pos = Pos#pos{map_grid_pid = Gpid}},
    Role2 = role_trigger:fire(#evt_enter_map{}, Role1),
    {ok, Role2};
apply_enter(#role{name = Name,
		  pos = #pos{map_bid = BaseId, srv_id = SrvId0}},
	    SrvId, NewBaseId, _Gpid) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap725, _, {__Levelmap725, __Tracesmap725}}
	  when __Levelmap725 band 8 /= 0 orelse
		 __Tracesmap725 /= [] ->
	  lager:do_log(error,
		       [{module, map}, {function, apply_enter}, {line, 725},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]收到非当前地图信息: [~s:~w]=/=[~s:~w]",
				     [Name, SrvId0, BaseId, SrvId, NewBaseId]),
		       none, 4096, 8, __Levelmap725, __Tracesmap725,
		       lager_event, __Pidmap725);
      _ -> ok
    end,
    ok.

do_leave(Map, undefined) -> Map;
do_leave(Map = #map{grid_info = GridInfo, num = Num},
	 #map_role{grid_pid = GridPid, pid = Rpid,
		   conn_pid = _ConnPid, rid = Rid, srv_id = SrvId, x = X,
		   y = Y}) ->
    {Gpid, Gnum} = case lists:keyfind(GridPid, 1, GridInfo)
		       of
		     {GridPid, GridNum} -> {GridPid, GridNum - 1};
		     false -> {0, 0}
		   end,
    erlang:demonitor(get({role_ref, Rpid})),
    put(role_pids,
	lists:keydelete(Rpid, 2, get(role_pids))),
    erase({role_ref, Rpid}),
    (get(map_grid_mode)):leave(GridPid, Rpid, X, Y, Rid,
			       SrvId),
    NewMap = case GridInfo of
	       [_, _ | _] when Gnum =< 0 ->
		   (get(map_grid_mode)):stop(GridPid),
		   Map#map{grid_info =
			       lists:keydelete(GridPid, 1, GridInfo),
			   num = max(0, Num - 1)};
	       _ ->
		   Map#map{grid_info =
			       lists:keyreplace(GridPid, 1, GridInfo,
						{Gpid, max(0, Gnum)}),
			   num = max(0, Num - 1)}
	     end,
    sync(NewMap),
    NewMap.

do_cast([], _Bin) -> ok;
do_cast([{0, _RolePid} | T], Bin) -> do_cast(T, Bin);
do_cast([{ConnPid, _RolePid} | T], Bin) ->
    ConnPid ! {send_data, Bin}, do_cast(T, Bin).

do_apply([], _MFA) -> ok;
do_apply([{_ConnPid, RolePid} | T], MFA) ->
    role:apply(async, RolePid, MFA), do_apply(T, MFA).

grid_start(#map{id = MapId, base_id = BaseId, width = W,
		height = H}) ->
    (get(map_grid_mode)):start_link(#map_grid{map_id =
						  MapId,
					      base_id = BaseId,
					      map_pid = self(), width = W,
					      height = H}).

get_layer([], _Max, _Num) -> {0, 9999999999};
get_layer([H | _T], Max, Num) when Num < Max -> H;
get_layer(LayerL, Max, Num) ->
    N = util:ceil(Num / Max),
    L = lists:sublist(LayerL, 1, N),
    [H | _] = lists:keysort(2, L),
    H.

calc_distance(#pos{map_pid = MapPid, x = X1, y = Y1},
	      #pos{map_pid = MapPid, x = X2, y = Y2}) ->
    Dx = erlang:abs(util:floor(X1 / 700) -
		      util:floor(X2 / 700)),
    Dy = erlang:abs(util:floor(Y1 / 450) -
		      util:floor(Y2 / 450)),
    {ok, {Dx, Dy}};
calc_distance(_, _) -> false.

create_unit([], _Map) -> ok;
create_unit([{Id, Bid, X, Y} | T],
	    Map = #map{id = MapId}) ->
    case unit_data:get(Bid) of
      #unit_data{cli_create = 1} -> skip;
      _ -> unit_mgr:create({0, Id}, Bid, {MapId, X, Y})
    end,
    create_unit(T, Map).


