-file("src/mod/misc/var.erl", 1).

-module(var).

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
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{state, []}]).

-behaviour(gen_server).

-export([init/0, login/1, logout/1, get_var/3,
	 get_var/4, acc_var/3, add_var/4, add_var/5, dec_var/3,
	 dec_max_var/4, set_var/4, del_var/3, get_list_val/4,
	 get_list_val/5, acc_list_val/4, add_list_val/5,
	 add_list_val/6, set_list_val/5, del_list_val/4,
	 calc_online_time/1, reset/2, reset_var/4,
	 reset_five_var/3, day_online_time/1,
	 total_online_time/1, check_cd/3, zero_push/1,
	 five_push/1, set_charge_count/2, get_role_some_var/3,
	 get_role_var_cluster/4, get_role_var/4,
	 update_role_var_list/3, acc_role_var/4, set_role_var/4,
	 date/0, date_var/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {}).

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

-file("src/mod/misc/var.erl", 55).

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

-file("src/mod/misc/var.erl", 56).

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

-file("src/mod/misc/var.erl", 57).

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

-file("src/mod/misc/var.erl", 58).

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

-file("src/mod/misc/var.erl", 59).

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

-file("src/mod/misc/var.erl", 60).

-type var_type() :: day | five | acc | other |
		    {day, 1..86399} | week_five | week |
		    {week, 0..86400 * 7} | month | {month, 0..86400 * 30} |
		    timeout | {timeout, pos_integer()}.

-spec init() -> #m_var{}.

init() ->
    Now = date:unixtime(),
    #m_var{ver = 3, last_reset_time = Now,
	   last_reset_day = date_var(date),
	   last_reset_week = date_var(week_number),
	   week_five_time = Now}.

-spec zero_push(#role{}) -> ok.

zero_push(#role{pid = RolePid}) ->
    role_trigger:async_fire(RolePid,
			    [#evt_zero_push{}, #r_evt_role_register_days{}]),
    ok.

-spec five_push(#role{}) -> ok.

five_push(#role{pid = RolePid}) ->
    role_trigger:async_fire(RolePid, #evt_cli_loaded{}), ok.

date() -> date_var(date).

-spec login(#role{}) -> {ok, #role{}}.

login(Role) ->
    {ok,
     Role0 = #role{m_var =
		       MVar = #m_var{day_login = DayLogin,
				     acc_login_count = AccLogin}}} =
	reset(Role, login),
    Role1 = role_timer:set(#timer{id = day_var_online_timer,
				  timeout = 180 * 1000, times = -1, m = var,
				  f = calc_online_time, a = []},
			   Role0),
    role:apply(async, self(), {var, reset, [login]}),
    merge_ver(Role1#role{m_var =
			     MVar#m_var{day_login = DayLogin + 1,
					acc_login_count = AccLogin + 1}}).

merge_ver(Role) ->
    case sys_env:get(merge_index, 0) of
      0 -> {ok, Role};
      MergeIdx ->
	  case MergeIdx > get_var(Role, other, 3067, 0) of
	    true ->
		do_merge_ver([{arena, merge_flush, []},
			      {charge_misc, merge_flush, []},
			      {arena_cluster, merge_flush, []}],
			     set_var(Role, other, 3067, MergeIdx));
	    _ -> {ok, Role}
	  end
    end.

do_merge_ver([], Role) -> {ok, Role};
do_merge_ver([{Mod, Fun, Args} | T], Role) ->
    case catch erlang:apply(Mod, Fun, [Role | Args]) of
      ok -> do_merge_ver(T, Role);
      {ok, NRole} -> do_merge_ver(T, NRole);
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidvar256, _, {__Levelvar256, __Tracesvar256}}
		when __Levelvar256 band 8 /= 0 orelse
		       __Tracesvar256 /= [] ->
		lager:do_log(error,
			     [{module, var}, {function, do_merge_ver},
			      {line, 256}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]处理合服变化时出错,~w:~w:~w err=~w",
					   [Role#role.name, Mod, Fun, Args,
					    _Err]),
			     none, 4096, 8, __Levelvar256, __Tracesvar256,
			     lager_event, __Pidvar256);
	    _ -> ok
	  end,
	  do_merge_ver(T, Role)
    end.

logout(Role = #role{is_online = IsOnline,
		    m_var =
			MVar = #m_var{last_acc_time = LastT, acc_time = AccT,
				      total_acc_time = TotalAcc}})
    when LastT > 0 andalso IsOnline == 1 ->
    Now = date:unixtime(),
    AddT = lists:min([180, Now - LastT]),
    NRole = Role#role{m_var =
			  MVar#m_var{login_charge_count = 0,
				     login_charge_num = 0, last_acc_time = 0,
				     acc_time = AccT + AddT,
				     total_acc_time = TotalAcc + AddT}},
    {ok, NRole};
logout(_Role) -> ok.

-spec set_charge_count(#role{},
		       pos_integer()) -> #role{}.

set_charge_count(Role = #role{m_var =
				  MVar = #m_var{login_charge_count =
						    LoginChargeCount,
						login_charge_num =
						    LoginChargeNum,
						acc_charge_count =
						    AccChargeCount}},
		 VipExp) ->
    Role#role{m_var =
		  MVar#m_var{login_charge_count = LoginChargeCount + 1,
			     login_charge_num = LoginChargeNum + VipExp,
			     acc_charge_count = AccChargeCount + 1}}.

-spec get_var(#role{}, Mod :: var_type(),
	      Key :: term()) -> Val :: term().

get_var(Role, Mod, Key) ->
    get_var(Role, Mod, Key, def_var(Key)).

-spec get_var(#role{}, Mod :: var_type(), Key :: term(),
	      DefVal :: term()) -> Val :: term().

get_var(Role, {day, 0}, Key, DefVal) ->
    get_var(Role, day, Key, DefVal);
get_var(Role, {day, OffSet}, Key, DefVal) ->
    case get_var(Role, other, Key, DefVal) of
      {T, Val} ->
	  case date:is_same_day(T - OffSet,
				date:unixtime() - OffSet)
	      of
	    true -> Val;
	    _ -> DefVal
	  end;
      _ -> DefVal
    end;
get_var(Role, {week, 0}, Key, DefVal) ->
    get_var(Role, week, Key, DefVal);
get_var(Role, {week, OffSet}, Key, DefVal) ->
    case get_var(Role, other, Key, DefVal) of
      {T, Val} ->
	  case date:is_same_week(T, date:unixtime(), OffSet) of
	    true -> Val;
	    _ -> DefVal
	  end;
      _ -> DefVal
    end;
get_var(Role, {month, 0}, Key, DefVal) ->
    get_var(Role, month, Key, DefVal);
get_var(Role, {month, OffSet}, Key, DefVal) ->
    case get_var(Role, other, Key, DefVal) of
      {T, Val} ->
	  case date:is_same_month(T, erlang:localtime(), OffSet)
	      of
	    true -> Val;
	    _ -> DefVal
	  end;
      _ -> DefVal
    end;
get_var(#role{m_var = #m_var{day_vars = Vars}}, day,
	Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
      {Key, Val} -> Val;
      _ -> DefVal
    end;
get_var(#role{m_var = #m_var{five_vars = Vars}}, five,
	Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
      {Key, Val} -> Val;
      _ -> DefVal
    end;
get_var(#role{m_var = #m_var{week_vars = Vars}}, week,
	Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
      {Key, Val} -> Val;
      _ -> DefVal
    end;
get_var(#role{m_var = #m_var{week_five_vars = Vars}},
	week_five, Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
      {Key, Val} -> Val;
      _ -> DefVal
    end;
get_var(#role{m_var = #m_var{month_vars = Vars}}, month,
	Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
      {Key, Val} -> Val;
      _ -> DefVal
    end;
get_var(Role, {timeout, _}, Key, DefVal) ->
    get_var(Role, timeout, Key, DefVal);
get_var(#role{m_var = #m_var{timeout_vars = Vars}},
	timeout, Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
      {_, {0, Val}} -> Val;
      {{holiday, 41015}, {T, Val}} -> Val;
      {_, {T, Val}} ->
	  Now = date:unixtime(),
	  case T > Now of
	    true -> Val;
	    _ -> DefVal
	  end;
      _ -> DefVal
    end;
get_var(#role{m_var = #m_var{timeout_vars = Vars}},
	timeout2, Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
      {_, {0, Val}} -> {0, Val};
      {_, {T, Val}} ->
	  Now = date:unixtime(),
	  case T > Now of
	    true -> {T, Val};
	    _ -> DefVal
	  end;
      _ -> DefVal
    end;
get_var(#role{m_var = #m_var{acc_vars = Vars}}, acc,
	Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
      {Key, Val} -> Val;
      _ -> DefVal
    end;
get_var(#role{m_var = #m_var{other_vars = Vars}}, other,
	Key, DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
      {Key, Val} -> Val;
      _ -> DefVal
    end.

-spec acc_var(#role{}, Mod :: var_type(),
	      Key :: term()) -> #role{}.

acc_var(Role, Mod, Key) -> add_var(Role, Mod, Key, 1).

-spec add_var(#role{}, Mod :: var_type(), Key :: term(),
	      AddVal :: non_neg_integer()) -> #role{}.

add_var(Role, Mod, Key, AddVal) ->
    add_var(Role, Mod, Key, AddVal, def_var(Key)).

add_var(Role, Mod, Key, AddVal, DefVal) ->
    Val = get_var(Role, Mod, Key, DefVal),
    set_var(Role, Mod, Key, Val + AddVal).

-spec dec_var(#role{}, Mod :: var_type(),
	      Key :: term()) -> #role{}.

dec_var(Role, Mod, Key) ->
    Val = get_var(Role, Mod, Key),
    set_var(Role, Mod, Key, max(0, Val - 1)).

-spec dec_max_var(#role{}, Mod :: var_type(),
		  Key :: term(), Val :: non_neg_integer()) -> {NewVal ::
								   non_neg_integer(),
							       #role{}}.

dec_max_var(Role, _Mod, _Key, 0) -> {0, Role};
dec_max_var(Role, Mod, Key, Val) ->
    N = get_var(Role, Mod, Key),
    NewVal = min(N, Val),
    NRole = set_var(Role, Mod, Key, N - NewVal),
    {NewVal, NRole}.

-spec set_var(#role{}, Mod :: var_type(), Key :: term(),
	      Val :: term()) -> #role{}.

set_var(Role, {day, 0}, Key, Val) ->
    set_var(Role, day, Key, Val);
set_var(Role, {day, _}, Key, Val) ->
    set_var(Role, other, Key, {date:unixtime(), Val});
set_var(Role, {week, 0}, Key, Val) ->
    set_var(Role, week, Key, Val);
set_var(Role, {week, _}, Key, Val) ->
    set_var(Role, other, Key, {date:unixtime(), Val});
set_var(Role, {month, 0}, Key, Val) ->
    set_var(Role, month, Key, Val);
set_var(Role, {month, _}, Key, Val) ->
    set_var(Role, other, Key, {erlang:localtime(), Val});
set_var(Role = #role{m_var =
			 MVar = #m_var{day_vars = Vars}},
	day, Key, Val) ->
    NewVars = [{Key, Val} | lists:keydelete(Key, 1, Vars)],
    Role#role{m_var = MVar#m_var{day_vars = NewVars}};
set_var(Role = #role{m_var =
			 MVar = #m_var{five_vars = Vars}},
	five, Key, Val) ->
    NewVars = [{Key, Val} | lists:keydelete(Key, 1, Vars)],
    Role#role{m_var = MVar#m_var{five_vars = NewVars}};
set_var(Role = #role{m_var =
			 MVar = #m_var{week_vars = Vars}},
	week, Key, Val) ->
    NewVars = [{Key, Val} | lists:keydelete(Key, 1, Vars)],
    Role#role{m_var = MVar#m_var{week_vars = NewVars}};
set_var(Role = #role{m_var =
			 MVar = #m_var{week_five_vars = Vars}},
	week_five, Key, Val) ->
    NewVars = [{Key, Val} | lists:keydelete(Key, 1, Vars)],
    Role#role{m_var = MVar#m_var{week_five_vars = NewVars}};
set_var(Role = #role{m_var =
			 MVar = #m_var{month_vars = Vars}},
	month, Key, Val) ->
    NewVars = [{Key, Val} | lists:keydelete(Key, 1, Vars)],
    Role#role{m_var = MVar#m_var{month_vars = NewVars}};
set_var(Role = #role{m_var =
			 MVar = #m_var{timeout_vars = Vars}},
	{timeout, T}, Key, Val) ->
    NewVars = [{Key, {T, Val}} | lists:keydelete(Key, 1,
						 Vars)],
    Role#role{m_var = MVar#m_var{timeout_vars = NewVars}};
set_var(Role = #role{m_var =
			 MVar = #m_var{acc_vars = Vars}},
	acc, Key, Val) ->
    NewVars = [{Key, Val} | lists:keydelete(Key, 1, Vars)],
    Role#role{m_var = MVar#m_var{acc_vars = NewVars}};
set_var(Role = #role{m_var =
			 MVar = #m_var{other_vars = Vars}},
	other, Key, Val) ->
    NewVars = [{Key, Val} | lists:keydelete(Key, 1, Vars)],
    Role#role{m_var = MVar#m_var{other_vars = NewVars}}.

-spec del_var(#role{}, Mod :: var_type(),
	      Key :: term()) -> #role{}.

del_var(Role, _Mod, []) -> Role;
del_var(Role, Mod, [Key | T]) ->
    NRole = del_var(Role, Mod, Key), del_var(NRole, Mod, T);
del_var(Role, {day, 0}, Key) -> del_var(Role, day, Key);
del_var(Role, {day, _}, Key) ->
    del_var(Role, other, Key);
del_var(Role, {week, 0}, Key) ->
    del_var(Role, week, Key);
del_var(Role, {week, _}, Key) ->
    del_var(Role, other, Key);
del_var(Role, {month, 0}, Key) ->
    del_var(Role, month, Key);
del_var(Role, {month, _}, Key) ->
    del_var(Role, other, Key);
del_var(Role, {timeout, _}, Key) ->
    del_var(Role, timeout, Key);
del_var(Role = #role{m_var =
			 MVar = #m_var{day_vars = Vars}},
	day, Key) ->
    Role#role{m_var =
		  MVar#m_var{day_vars = lists:keydelete(Key, 1, Vars)}};
del_var(Role = #role{m_var =
			 MVar = #m_var{five_vars = Vars}},
	five, Key) ->
    Role#role{m_var =
		  MVar#m_var{five_vars = lists:keydelete(Key, 1, Vars)}};
del_var(Role = #role{m_var =
			 MVar = #m_var{week_vars = Vars}},
	week, Key) ->
    Role#role{m_var =
		  MVar#m_var{week_vars = lists:keydelete(Key, 1, Vars)}};
del_var(Role = #role{m_var =
			 MVar = #m_var{week_five_vars = Vars}},
	week_five, Key) ->
    Role#role{m_var =
		  MVar#m_var{week_five_vars =
				 lists:keydelete(Key, 1, Vars)}};
del_var(Role = #role{m_var =
			 MVar = #m_var{month_vars = Vars}},
	month, Key) ->
    Role#role{m_var =
		  MVar#m_var{month_vars = lists:keydelete(Key, 1, Vars)}};
del_var(Role = #role{m_var =
			 MVar = #m_var{timeout_vars = Vars}},
	timeout, Key) ->
    Role#role{m_var =
		  MVar#m_var{timeout_vars =
				 lists:keydelete(Key, 1, Vars)}};
del_var(Role = #role{m_var =
			 MVar = #m_var{acc_vars = Vars}},
	acc, Key) ->
    Role#role{m_var =
		  MVar#m_var{acc_vars = lists:keydelete(Key, 1, Vars)}};
del_var(Role = #role{m_var =
			 MVar = #m_var{other_vars = Vars}},
	other, Key) ->
    Role#role{m_var =
		  MVar#m_var{other_vars = lists:keydelete(Key, 1, Vars)}}.

-spec check_cd(#role{}, Key :: any(),
	       MsT :: non_neg_integer()) -> {true, #role{}} | false.

check_cd(Role, Key, MsT) ->
    Now = date:unixtime(ms),
    T = get_var(Role, other, Key, 0),
    case Now - T >= MsT of
      true -> {true, set_var(Role, other, Key, Now)};
      _ -> false
    end.

-spec get_list_val(#role{}, Mod :: var_type(),
		   Key :: term(), K :: term()) -> Val :: term().

get_list_val(Role, Mod, Key, K) ->
    get_list_val(Role, Mod, Key, K, 0).

-spec get_list_val(#role{}, Mod :: var_type(),
		   Key :: term(), K :: term(), DefVal :: term()) -> Val ::
									term().

get_list_val(Role, Mod, Key, K, DefVal) ->
    ValList = get_var(Role, Mod, Key, []),
    case lists:keyfind(K, 1, ValList) of
      {K, Val} -> Val;
      _ -> DefVal
    end.

-spec acc_list_val(#role{}, Mod :: var_type(),
		   Key :: term(), K :: term()) -> #role{}.

acc_list_val(Role, Mod, Key, K) ->
    add_list_val(Role, Mod, Key, K, 1).

-spec add_list_val(#role{}, Mod :: var_type(),
		   Key :: term(), K :: term(),
		   AddV :: non_neg_integer()) -> #role{}.

add_list_val(Role, Mod, Key, K, AddV) ->
    add_list_val(Role, Mod, Key, K, AddV, 0).

add_list_val(Role, Mod, Key, K, AddV, DefVal) ->
    Val = get_list_val(Role, Mod, Key, K, DefVal),
    set_list_val(Role, Mod, Key, K, Val + AddV).

-spec set_list_val(#role{}, Mod :: var_type(),
		   Key :: term(), K :: term(), Val :: term()) -> #role{}.

set_list_val(Role, Mod, Key, K, Val) ->
    ValList = get_var(Role, Mod, Key, []),
    NewValList = lists:keystore(K, 1, ValList, {K, Val}),
    set_var(Role, Mod, Key, NewValList).

-spec del_list_val(#role{}, Mod :: var_type(),
		   Key :: term(), K :: term()) -> #role{}.

del_list_val(Role, Mod, Key, K) ->
    ValList = get_var(Role, Mod, Key, []),
    NewValList = lists:keydelete(K, 1, ValList),
    set_var(Role, Mod, Key, NewValList).

-spec day_online_time(#role{}) -> T ::
				      non_neg_integer().

day_online_time(#role{m_var =
			  #m_var{acc_time = AccT, last_acc_time = LastT}}) ->
    Now = date:unixtime(),
    AddT = lists:min([180, Now - LastT]),
    AccT + AddT.

-spec total_online_time(#role{}) -> T ::
					non_neg_integer().

total_online_time(#role{m_var =
			    #m_var{total_acc_time = AccT,
				   last_acc_time = LastT}}) ->
    Now = date:unixtime(),
    AddT = lists:min([180, Now - LastT]),
    AccT + AddT.

-spec get_role_some_var(role_id(),
			Label :: day | timeout | other,
			[{Key :: term(), DefVal :: term()}]) -> [Val :: term()].

get_role_some_var(RoleId, Label, L) ->
    RoleVal = lookup_role_var(Label, RoleId),
    [get_role_var(RoleVal, Label, Key, DefVal)
     || {Key, DefVal} <- L].

-spec get_role_var_cluster(role_id(),
			   Label :: day | timeout | other, Key :: term(),
			   DefVal :: term()) -> Val :: term().

get_role_var_cluster(RoleId = {_, SrvId}, Label, Key,
		     DefVal) ->
    case catch cluster_lib:call(SrvId, var, get_role_var,
				[RoleId, Label, Key, DefVal])
	of
      Val when is_integer(Val) -> Val;
      _ -> DefVal
    end.

-spec get_role_var(role_id(),
		   Label :: day | timeout | other, Key :: term(),
		   DefVal :: term()) -> Val :: term().

get_role_var(RoleId = {_, _}, Label, Key, DefVal) ->
    get_role_var(lookup_role_var(Label, RoleId), Label, Key,
		 DefVal);
get_role_var(R, Label, #{key := Key, k := K}, DefVal) ->
    L = get_role_var(R, Label, Key, []),
    list_util:keyfind(K, L, DefVal);
get_role_var(#role_var{vars = Vars}, timeout, Key,
	     DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
      {_, {0, Val}} -> Val;
      {{holiday, 41015}, {T, Val}} -> Val;
      {_, {T, Val}} ->
	  Now = date:unixtime(),
	  case T > Now of
	    true -> Val;
	    _ -> DefVal
	  end;
      _ -> DefVal
    end;
get_role_var(#role_var{vars = Vars}, _Label, Key,
	     DefVal) ->
    case lists:keyfind(Key, 1, Vars) of
      {Key, Val} -> Val;
      _ -> DefVal
    end.

-spec update_role_var_list(role_id(),
			   Label :: day | timeout | other, [Item]) -> [Val ::
									   term()] when Item ::
											    {set,
											     Key ::
												 term(),
											     Val ::
												 term()} |
											    {del,
											     Key ::
												 term()} |
											    {func,
											     Func ::
												 function()} |
											    {min,
											     Key ::
												 term(),
											     Val ::
												 non_neg_integer()} |
											    {max,
											     Key ::
												 term(),
											     Val ::
												 non_neg_integer()} |
											    {acc,
											     Key ::
												 term(),
											     AddVal ::
												 non_neg_integer()} |
											    {acc,
											     Key ::
												 term(),
											     DefVal ::
												 non_neg_integer(),
											     AddVal ::
												 non_neg_integer(),
											     MaxVal ::
												 non_neg_integer()} |
											    {dec,
											     Key ::
												 term(),
											     DecVal ::
												 non_neg_integer(),
											     DecVal ::
												 non_neg_integer(),
											     MinVal ::
												 non_neg_integer()}.

update_role_var_list({_, <<>>}, _Label, _L) -> ok;
update_role_var_list(RoleId, Label, L) ->
    cast({update, RoleId, Label, L}).

set_role_var(RoleId, Label, Key, Val) ->
    update_role_var_list(RoleId, Label, [{set, Key, Val}]).

acc_role_var(RoleId = {_, _}, Label, Key, DefVal) ->
    update_role_var_list(RoleId, Label,
			 [{acc, Key, DefVal, 1, 99999999999999}]).

-spec date_var(Key :: any()) -> any().

date_var(Key) ->
    case catch ets:lookup(date_var, Key) of
      [{Key, Val}] -> Val;
      _ -> date_def_var(Key)
    end.

info(Info) -> var ! Info.

cast(Info) -> gen_server:cast(var, Info).

call(Info) ->
    case catch gen_server:call(var, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidvar563, _, {__Levelvar563, __Tracesvar563}}
		when __Levelvar563 band 8 /= 0 orelse
		       __Tracesvar563 /= [] ->
		lager:do_log(error,
			     [{module, var}, {function, call}, {line, 563},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [var, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelvar563, __Tracesvar563,
			     lager_event, __Pidvar563);
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

start_link() ->
    gen_server:start_link({local, var}, var, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidvar569, _, {__Levelvar569, __Tracesvar569}}
	  when __Levelvar569 band 64 /= 0 orelse
		 __Tracesvar569 /= [] ->
	  lager:do_log(info,
		       [{module, var}, {function, init}, {line, 569},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [var]), none, 4096, 64,
		       __Levelvar569, __Tracesvar569, lager_event,
		       __Pidvar569);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(role_other_var,
		   [{file, "./dets/role_other_var.dets"},
		    {keypos, #role_var.id}]),
    ets:new(role_other_var,
	    [set, named_table, public, {keypos, #role_var.id}]),
    dets:to_ets(role_other_var, role_other_var),
    dets:open_file(role_day_var,
		   [{file, "./dets/role_day_var.dets"},
		    {keypos, #role_var.id}]),
    ets:new(role_day_var,
	    [set, named_table, public, {keypos, #role_var.id}]),
    dets:to_ets(role_day_var, role_day_var),
    dets:open_file(role_timeout_var,
		   [{file, "./dets/role_timeout_var.dets"},
		    {keypos, #role_var.id}]),
    ets:new(role_timeout_var,
	    [set, named_table, public, {keypos, #role_var.id}]),
    dets:to_ets(role_timeout_var, role_timeout_var),
    ets:new(date_var,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(date_parse,
	    [set, named_table, public, {keypos, 1}]),
    reset_date_var(erlang:date()),
    State = #state{},
    put(update_hour_zero,
	erlang:send_after(date:next_diff(0, 0, 0) * 1000,
			  self(), update_hour_zero)),
    put(update_hour_five,
	erlang:send_after(date:next_diff(5, 0, 0) * 1000,
			  self(), update_hour_five)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidvar586, _, {__Levelvar586, __Tracesvar586}}
	  when __Levelvar586 band 64 /= 0 orelse
		 __Tracesvar586 /= [] ->
	  lager:do_log(info,
		       [{module, var}, {function, init}, {line, 586},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [var]), none, 4096, 64,
		       __Levelvar586, __Tracesvar586, lager_event,
		       __Pidvar586);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({update, RoleId, Label, L = [_ | _]}, State)
    when Label =:= day orelse
	   Label =:= other orelse Label =:= timeout ->
    R = #role_var{} = lookup_role_var(Label, RoleId),
    case reset_role_var(L, Label, R) of
      NewR = #role_var{} -> save_role_var(Label, NewR);
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidvar599, _, {__Levelvar599, __Tracesvar599}}
		when __Levelvar599 band 8 /= 0 orelse
		       __Tracesvar599 /= [] ->
		lager:do_log(error,
			     [{module, var}, {function, handle_cast},
			      {line, 599}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("更新角色变量时出错:~w", [_Err]), none, 4096,
			     8, __Levelvar599, __Tracesvar599, lager_event,
			     __Pidvar599);
	    _ -> ok
	  end
    end,
    {noreply, State};
handle_cast(date_reset, State) ->
    reset_date_var(erlang:date()), {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(update_hour_zero, State) ->
    Now = date:unixtime(),
    {Date, _} = date:seconds_to_datetime(Now),
    reset_date_var(Date),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidvar616, _, {__Levelvar616, __Tracesvar616}}
	  when __Levelvar616 band 64 /= 0 orelse
		 __Tracesvar616 /= [] ->
	  lager:do_log(info,
		       [{module, var}, {function, handle_info}, {line, 616},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("zero_update==~w, now=~w", [Date, Now]),
		       none, 4096, 64, __Levelvar616, __Tracesvar616,
		       lager_event, __Pidvar616);
      _ -> ok
    end,
    group_zero_exec(),
    ets:delete_all_objects(role_day_var),
    dets:delete_all_objects(role_day_var),
    role_group:apply(world,
		     {var, reset_var, [Date, Now, zero_flush]}),
    catch erlang:cancel_timer(get(update_hour_zero)),
    put(update_hour_zero,
	erlang:send_after(date:next_diff(0, 0, 0) * 1000,
			  self(), update_hour_zero)),
    {noreply, State};
handle_info(update_hour_five, State) ->
    Date = erlang:date(),
    reset_date_var(Date),
    catch erlang:cancel_timer(get(update_hour_five)),
    put(update_hour_five,
	erlang:send_after(date:next_diff(5, 0, 0) * 1000,
			  self(), update_hour_five)),
    guild_dun_mgr:five_plush(),
    role_group:apply(world,
		     {var, reset_five_var,
		      [date_def_var(five), five_flush]}),
    ets:delete_all_objects(date_parse),
    {noreply, State};
handle_info(_Info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidvar638, _, {__Levelvar638, __Tracesvar638}}
	  when __Levelvar638 band 8 /= 0 orelse
		 __Tracesvar638 /= [] ->
	  lager:do_log(error,
		       [{module, var}, {function, handle_info}, {line, 638},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("接收到非法信息:~w", [_Info]), none, 4096, 8,
		       __Levelvar638, __Tracesvar638, lager_event,
		       __Pidvar638);
      _ -> ok
    end,
    {noreply, State}.

terminate(_Reason, _State) ->
    dets:insert(role_day_var, ets:tab2list(role_day_var)),
    dets:insert(role_timeout_var,
		ets:tab2list(role_timeout_var)),
    dets:insert(role_other_var,
		ets:tab2list(role_other_var)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidvar645, _, {__Levelvar645, __Tracesvar645}}
	  when __Levelvar645 band 64 /= 0 orelse
		 __Tracesvar645 /= [] ->
	  lager:do_log(info,
		       [{module, var}, {function, terminate}, {line, 645},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelvar645, __Tracesvar645,
		       lager_event, __Pidvar645);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

save_role_var(Label, R) ->
    Tab = label_to_tab(Label),
    dets:insert(Tab, R),
    ets:insert(Tab, R).

lookup_role_var(Label, RoleId) ->
    Tab = label_to_tab(Label),
    case catch ets:lookup(Tab, RoleId) of
      [R = #role_var{}] -> R;
      _ -> #role_var{id = RoleId}
    end.

label_to_tab(day) -> role_day_var;
label_to_tab(timeout) -> role_timeout_var;
label_to_tab(other) -> role_other_var.

reset_role_var([], _Label, R) -> R;
reset_role_var([I | T], Label, R) ->
    NewR = reset_role_var(I, Label, R),
    reset_role_var(T, Label, NewR);
reset_role_var({min, Key, Val}, Label, R) ->
    Val1 = get_role_var(R, Label, Key, Val),
    do_set_role_var(R, Label, Key, min(Val, Val1));
reset_role_var({max, Key, Val}, Label, R) ->
    Val1 = get_role_var(R, Label, Key, Val),
    do_set_role_var(R, Label, Key, max(Val, Val1));
reset_role_var({acc, Key, AddVal}, Label, R) ->
    Val = get_role_var(R, Label, Key, 0),
    do_set_role_var(R, Label, Key, Val + AddVal);
reset_role_var({acc, Key, DefVal, AddVal, MaxVal},
	       Label, R) ->
    Val = get_role_var(R, Label, Key, DefVal),
    do_set_role_var(R, Label, Key,
		    min(MaxVal, Val + AddVal));
reset_role_var({dec, Key, DefVal, DecVal, MinVal},
	       Label, R) ->
    Val = get_role_var(R, Label, Key, DefVal),
    do_set_role_var(R, Label, Key,
		    max(MinVal, Val - DecVal));
reset_role_var({set, Key, Val}, Label, R) ->
    do_set_role_var(R, Label, Key, Val);
reset_role_var({del, Key}, Label, R) ->
    del_role_var(R, Label, Key);
reset_role_var({func, Func}, _Label, R) -> Func(R);
reset_role_var(_, _Label, R) -> R.

do_set_role_var(R = #role_var{vars = Vars}, _Label,
		#{key := Key, k := K}, Val) ->
    L = case lists:keyfind(Key, 1, Vars) of
	  {Key, Val} -> Val;
	  _ -> []
	end,
    L1 = lists:keystore(K, 1, L, {K, Val}),
    R#role_var{vars =
		   [{Key, L1} | lists:keydelete(Key, 1, Vars)]};
do_set_role_var(R = #role_var{vars = Vars}, _Label, Key,
		Val) ->
    R#role_var{vars =
		   [{Key, Val} | lists:keydelete(Key, 1, Vars)]}.

del_role_var(R = #role_var{vars = Vars}, _Label,
	     #{key := Key, k := K}) ->
    L = case lists:keyfind(Key, 1, Vars) of
	  {Key, Val} -> Val;
	  _ -> []
	end,
    L1 = lists:keydelete(K, 1, L),
    R#role_var{vars =
		   [{Key, L1} | lists:keydelete(Key, 1, Vars)]};
del_role_var(R = #role_var{vars = Vars}, _Label, Key) ->
    R#role_var{vars = lists:keydelete(Key, 1, Vars)}.

reset_date_var(Date) ->
    ets:insert(date_var, {date, Date}),
    ets:insert(date_var,
	       {week_day, date:day_of_the_week(Date)}),
    ets:insert(date_var,
	       {week_number, calendar:iso_week_number(Date)}),
    ets:insert(date_var, {zero, date_def_var(zero)}),
    ets:insert(date_var, {five, date_def_var(five)}),
    ets:insert(date_var,
	       {month_start, date_def_var(month_start)}),
    ets:insert(date_var,
	       {next_month_start, date_def_var(next_month_start)}).

reset(Role = #role{m_var =
		       MVar = #m_var{last_reset_day = {LastY, LastM, LastD},
				     last_reset_five = ResetFive}},
      Push) ->
    Now = date:unixtime(),
    {ok, Role1} = case date_var(date) of
		    {LastY, LastM, LastD} ->
			{ok,
			 Role#role{m_var = MVar#m_var{last_acc_time = Now}}};
		    {Y, M, D} ->
			reset_var(Role#role{m_var = MVar}, {Y, M, D}, Now, Push)
		  end,
    {ok, Role2} = case date_var(five) of
		    ResetFive -> {ok, Role1};
		    NextFiveTime ->
			reset_five_var(Role1, NextFiveTime, Push)
		  end,
    reset_timeout_var(Role2, Now).

reset_var(Role = #role{m_var =
			   MVar = #m_var{last_reset_time = LastT,
					 last_reset_day =
					     {LastY, LastM, _LastD},
					 last_reset_week = LastWeek,
					 acc_days = AccDays,
					 month_days = MonthDays,
					 best_days = BestDays,
					 now_days = NowDays}},
	  {Y, M, D}, Now, Push) ->
    {SameMonth, MVar1} = case Y =:= LastY andalso
				M =:= LastM
			     of
			   true -> {1, MVar#m_var{month_days = MonthDays + 1}};
			   _ -> {0, MVar#m_var{month_vars = [], month_days = 1}}
			 end,
    {SameWeek, MVar2} = case date_var(week_number) of
			  LastWeek -> {true, MVar1};
			  NewWeek ->
			      {false,
			       MVar1#m_var{week_vars = [],
					   last_reset_week = NewWeek}}
			end,
    Days = case LastT of
	     0 -> 1;
	     _ -> max(1, date:day_diff(LastT + 1, Now))
	   end,
    NewNowDays = case Days of
		   1 -> NowDays + 1;
		   _ -> 1
		 end,
    NewBestDays = max(BestDays, NewNowDays),
    Role0 = Role#role{m_var =
			  MVar2#m_var{day_vars = [], day_login = 0,
				      acc_time = 0, last_reset_time = Now,
				      last_acc_time = Now,
				      last_reset_day = {Y, M, D},
				      acc_days = AccDays + 1,
				      best_days = NewBestDays,
				      now_days = NewNowDays}},
    NRole = zero_flush([{zero_flush, friend, zero_push, []},
			{all, exchange_gift, zero_flush, []},
			{all, quest, five_flush, [type]},
			{all, activity, zero_flush, []},
			{zero_flush, charge, zero_flush, []},
			{login, holiday_role, zero_flush, []},
			{all, checkin, flush, []},
			{zero_flush, login_days, flush, []},
			{zero_flush, month_card, flush, []},
			{all, arena, zero_flush, []},
			{all, assets, zero_flush, [old_role]},
			{all, day_goals, zero_flush, []},
			{all, holiday_dial, zero_flush, []},
			{all, charge_misc, zero_flush, []},
			{all, endless, zero_flush, []},
			{all, month_fund, zero_flush, []},
			{all, dungeon_stone, zero_flush, []},
			{all, adventure, zero_flush, []},
			{all, sky_ladder, zero_flush, []},
			{all, shipping, flush, []},
			{all, guild_quest, five_flush, [same_week]},
			{all, holiday_lanterm_adventure, zero_flush, []},
			{all, holiday_lanterm_adventure1, zero_flush, []},
			{all, holiday_lanterm_adventure2, zero_flush, []},
			{all, holiday_lanterm_adventure3, zero_flush, []},
			{all, arena_elite_lib, zero_flush, []},
			{zero_flush, day_goals_new, zero_flush, []},
			{all, element_temple, zero_flush, []},
			{all, holiday_dial2, zero_flush, []},
			{zero_flush, welfare, zero_flush, []},
			{all, dungeon_heaven_lib, zero_flush, []},
			{all, holiday_boss, zero_flush, []},
			{zero_flush, holiday_war_order, zero_flush, []},
			{all, holiday_holy_eqm, zero_flush, []},
			{all, week_card, zero_flush, []},
			{all, arena_cluster, zero_flush, []},
			{all, holiday_accumulate, zero_flush, []},
			{all, guild_dun_lib, five_flush, []},
			{all, holiday_boss_new, zero_flush, []},
			{zero_flush, holiday_return_sign, zero_flush, []},
			{all, holiday_return, zero_flush, []},
			{all, role_auth, login, []},
			{all, home_pet_lib, zero_flush, []},
			{all, home, zero_flush, []},
			{all, holiday_predict, zero_flush, []},
			{all, holiday_personal_gift, zero_flush, []},
			{all, resonate_extract, zero_flush, []},
			{all, sprite_hatch, zero_flush, []},
			{all, holiday_term_begins, zero_flush, []},
			{all, holiday_petard, zero_flush, []},
			{zero_flush, role_weekly, zero_flush, []},
			{all, arena_elite_war_order, zero_flush, []},
			{all, holiday_fire_gift, zero_flush, []},
			{all, holiday_return_new, zero_flush, []},
			{all, holiday_return_new_feat, zero_flush, []},
			{all, holiday_charge_rebate, zero_flush, []},
			{all, holiday_charge_reset, zero_flush, []},
			{all, holiday_optional_lottery, zero_flush, []},
			{all, holiday_lucky_dog_lib, zero_flush, []},
			{all, holiday_time_award, zero_flush, []},
			{all, holiday_valentines, zero_flush, []},
			{all, planes, zero_flush, []},
			{all, planes_war_order, zero_flush, []},
			{zero_flush, holiday_new_war_order, zero_flush, []},
			{all, subscriber, zero_flush, []},
			{all, holiday_dime, zero_flush, []},
			{all, holiday_new_week_card, zero_flush, []},
			{all, holiday_practise_tower_lib, zero_flush_log, []},
			{all, red_point, zero_flush, []},
			{zero_flush, var, zero_push, []}],
		       Role0, Push, Role, Now, Days, SameWeek, SameMonth),
    case Push of
      zero_flush ->
	  log:save(logout, {NRole}),
	  put(login_idx, util:get(login_idx, 1) + 1),
	  log:save(login, {NRole});
      _ -> skip
    end,
    {ok, NRole}.

reset_five_var(Role = #role{id = {_, _SrvId},
			    m_var =
				MVar = #m_var{last_reset_five = LastTime,
					      week_five_time = WeekFiveTime},
			    channel = _Channel},
	       NextFiveTime, Push) ->
    Now = date:unixtime(),
    Days = case LastTime of
	     0 -> 1;
	     _ -> max(1, (NextFiveTime - LastTime) div 86400)
	   end,
    SameWeek = date:is_same_week(Now, WeekFiveTime, 18000),
    Role0 = case SameWeek of
	      false ->
		  Role#role{m_var =
				MVar#m_var{five_vars = [],
					   last_reset_five = NextFiveTime,
					   week_five_vars = [],
					   week_five_time = Now}};
	      _ ->
		  Role#role{m_var =
				MVar#m_var{five_vars = [],
					   last_reset_five = NextFiveTime}}
	    end,
    NRole = zero_flush([{all, dungeon, five_flush, []},
			{all, arena, five_flush, []},
			{all, recruit, five_flush, []},
			{five_flush, var, five_push, []}],
		       Role0, Push, Role, date:unixtime(), Days, SameWeek,
		       true),
    {ok, NRole}.

calc_online_time(Role = #role{is_online = IsOnline,
			      m_var =
				  MVar = #m_var{last_acc_time = LastT,
						acc_time = AccT,
						total_acc_time = TotalAcc}})
    when IsOnline == 1 ->
    Now = date:unixtime(),
    AddT = min(180, Now - LastT),
    Nr = Role#role{m_var =
		       MVar#m_var{last_acc_time = Now, acc_time = AccT + AddT,
				  total_acc_time = TotalAcc + AddT}},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidvar794, _, {__Levelvar794, __Tracesvar794}}
	  when __Levelvar794 band 128 /= 0 orelse
		 __Tracesvar794 /= [] ->
	  lager:do_log(debug,
		       [{module, var}, {function, calc_online_time},
			{line, 794}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("累计在线时间:~w", [IsOnline]), none, 4096, 128,
		       __Levelvar794, __Tracesvar794, lager_event,
		       __Pidvar794);
      _ -> ok
    end,
    {ok, Nr};
calc_online_time(Role) -> {ok, Role}.

reset_timeout_var(Role, Now) ->
    HRole = #role{m_var =
		      MVar = #m_var{timeout_vars = TimeoutVars}} =
		holiday_lib:reset_tv_timeout(Role, Now),
    NewTimeoutVars = [{Key, {T, Val}}
		      || {Key, {T, Val}} <- TimeoutVars,
			 (T > Now orelse T =:= 0) orelse
			   lists:member(Key,
					[{holiday, 1021}, {holiday, 11007},
					 {holiday, 13014}, {holiday, 15011},
					 {holiday, 17010}, {holiday, 19003},
					 {holiday, 21001}, {holiday, 23010},
					 {holiday, 27013}, {holiday, 41015}])],
    DelTimeoutVars = [{{delay_del, Key},
		       {Now + 86400 * 5, Val}}
		      || {Key, {T, Val}} <- TimeoutVars, T > 0, Now >= T,
			 not is_delay_del(Key)],
    NewMVar = MVar#m_var{timeout_vars =
			     NewTimeoutVars ++ DelTimeoutVars},
    NewRole = HRole#role{m_var = NewMVar},
    {ok, NewRole}.

is_delay_del({delay_del, _}) -> true;
is_delay_del(_) -> false.

zero_flush([], Role, _Push, _OldRole, _Now, _Days,
	   _SameWeek, _SameMonth) ->
    Role;
zero_flush([{DoType, Mod, Fun, Args0} | T],
	   Role = #role{name = Name}, Push, OldRole, Now, Days,
	   SameWeek, SameMonth)
    when DoType =:= all orelse DoType =:= Push ->
    ArgFun = fun (type) -> Push;
		 (old_role) -> OldRole;
		 (days) -> Days;
		 (same_week) -> SameWeek;
		 (same_month) -> SameMonth;
		 (now) -> Now;
		 (A) -> A
	     end,
    Args = [ArgFun(A) || A <- Args0],
    NewArgs = case {Mod, Fun} of _ -> [Role | Args] end,
    case catch erlang:apply(Mod, Fun, NewArgs) of
      ok ->
	  zero_flush(T, Role, Push, OldRole, Now, Days, SameWeek,
		     SameMonth);
      {ok, NRole} when is_record(NRole, role) ->
	  zero_flush(T, NRole, Push, OldRole, Now, Days, SameWeek,
		     SameMonth);
      NRole = #role{} ->
	  zero_flush(T, NRole, Push, OldRole, Now, Days, SameWeek,
		     SameMonth);
      _Err ->
	  server_monitor:error(6),
	  server_monitor:error_log({2, <<"0点更新处理失败"/utf8>>,
				    util:fbin(<<"角色[~w:~ts]0点更新处理失败，需马上上线查看处理"/utf8>>,
					      [Role#role.id, Role#role.name]),
				    var, 837, _Err}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidvar838, _, {__Levelvar838, __Tracesvar838}}
		when __Levelvar838 band 8 /= 0 orelse
		       __Tracesvar838 /= [] ->
		lager:do_log(error,
			     [{module, var}, {function, zero_flush},
			      {line, 838}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]执行0点刷新调用[~w:~w:~w]时发生异常：~w",
					   [Name, Mod, Fun, Args, _Err]),
			     none, 4096, 8, __Levelvar838, __Tracesvar838,
			     lager_event, __Pidvar838);
	    _ -> ok
	  end,
	  zero_flush(T, Role, Push, OldRole, Now, Days, SameWeek,
		     SameMonth)
    end;
zero_flush([_ | T], Role, Push, OldRole, Now, Days,
	   SameWeek, SameMonth) ->
    zero_flush(T, Role, Push, OldRole, Now, Days, SameWeek,
	       SameMonth).

group_zero_exec() ->
    [catch erlang:apply(M, F, A) || {M, F, A} <- []].

def_var(_Key) -> 0.

date_def_var(date) -> erlang:date();
date_def_var(five) ->
    date:unixtime({next_time, {5, 0, 0}});
date_def_var(zero) ->
    {M, S, MS} = date:now(),
    {_, Time} = calendar:now_to_local_time({M, S, MS}),
    M * 1000000 + S - calendar:time_to_seconds(Time);
date_def_var(week_day) ->
    date:day_of_the_week(erlang:date());
date_def_var(week_number) ->
    calendar:iso_week_number(erlang:date());
date_def_var(month_start) ->
    {{_Y, _M, D}, {H, M, S}} = calendar:local_time(),
    date:unixtime() - 86400 * (D - 1) - 3600 * H - 60 * M -
      S;
date_def_var(next_month_start) ->
    {Y, M, _D} = erlang:date(),
    case M >= 12 of
      true ->
	  date:datetime_to_seconds({{Y + 1, 1, 1}, {0, 0, 0}});
      _ ->
	  date:datetime_to_seconds({{Y, M + 1, 1}, {0, 0, 0}})
    end.


