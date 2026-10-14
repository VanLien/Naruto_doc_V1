-file("data/day_goals_new.erl", 1).

-file("src/mod/holiday_day_goals/day_goals_new.erl", 1).

-module(day_goals_new).

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
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{activity, [id, status, name, data, ext_args]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{grow_data,
		 [ver, day, goal_id, status, condition, lev, progress,
		  target_type]},
		{m_day_goals,
		 [ver, end_time, num, welfare_list, grow_list,
		  price_list, finish_list, period, charge, old_data,
		  period_day, new_grow_list, lev_reward, old_data2]},
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

-export([compensate/1, bug_login/1, login/1,
	 zero_flush/1, reissue_award/2, set_activity_status/3,
	 push_quest/1, push_lev_reward/1, push_change_lev/2,
	 take_lev_reward/2, update_quest/3, commit_quest/2,
	 get_quest/1, del_quest/2, do_2020_04_04/1]).

-export([gm_update_quest_2019_12_19/0,
	 gm_update_quest_2019_12_19/1, gm_update_quest/1,
	 gm_finish_quest/1]).

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

-file("src/mod/holiday_day_goals/day_goals_new.erl",
      32).

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

-file("src/mod/holiday_day_goals/day_goals_new.erl",
      33).

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

-file("src/mod/holiday_day_goals/day_goals_new.erl",
      34).

-file("inc/day_goals.hrl", 1).

-record(m_day_goals,
	{ver = 3, end_time = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 welfare_list = []  :: list(), grow_list = []  :: list(),
	 price_list = []  :: list(), finish_list = []  :: list(),
	 period = 1  :: list(), charge = 0  :: list(),
	 old_data = [], period_day = 0, new_grow_list = [],
	 lev_reward = [], old_data2 = []}).

-record(grow_data,
	{ver = 2, day = 0  :: non_neg_integer(),
	 goal_id = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 condition = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), progress = []  :: list(),
	 target_type = 1  :: non_neg_integer()}).

-file("src/mod/holiday_day_goals/day_goals_new.erl",
      35).

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

-file("src/mod/holiday_day_goals/day_goals_new.erl",
      36).

-file("inc/log.hrl", 1).

-file("src/mod/holiday_day_goals/day_goals_new.erl",
      37).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/holiday_day_goals/day_goals_new.erl",
      38).

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

-file("src/mod/holiday_day_goals/day_goals_new.erl",
      39).

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

-file("src/mod/holiday_day_goals/day_goals_new.erl",
      40).

gm_update_quest_2019_12_19() ->
    role_group:apply(world,
		     {day_goals_new, gm_update_quest_2019_12_19, []}),
    ok.

gm_update_quest_2019_12_19(Role) ->
    case date:unixtime() >= 1576771199 + 1 of
      true -> {ok, Role};
      _ ->
	  case var:get_var(Role, other, 3077, 0) of
	    0 ->
		{ok, Role1} = bug_login(Role),
		{ok, Role2} = day_goals:do_ref_quest(Role1),
		{ok, Role3} = holiday_war_order:gm_login(Role2),
		NewRole =
		    role_trigger:fire(#evt_enter_secret_kill_monster2{count
									  = 5},
				      Role3),
		NewRole2 = var:set_var(NewRole, other, 3077, 1),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidday_goals_new57, _,
		   {__Levelday_goals_new57, __Tracesday_goals_new57}}
		      when __Levelday_goals_new57 band 64 /= 0 orelse
			     __Tracesday_goals_new57 /= [] ->
		      lager:do_log(info,
				   [{module, day_goals_new},
				    {function, gm_update_quest_2019_12_19},
				    {line, 57}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("玩家~w修复了七日目标、战令任务，并且补偿了次数",
						 [Role#role.id]),
				   none, 4096, 64, __Levelday_goals_new57,
				   __Tracesday_goals_new57, lager_event,
				   __Pidday_goals_new57);
		  _ -> ok
		end,
		{ok, NewRole2};
	    _ -> {ok, Role}
	  end
    end.

gm_update_quest(all) ->
    role_group:apply(world,
		     {day_goals_new, gm_update_quest, []});
gm_update_quest(Role = #role{m_day_goals =
				 #m_day_goals{period = Period,
					      grow_list = GrowList}})
    when GrowList =/= [] andalso
	   (Period == 2 orelse Period == 3) ->
    {ok, Role1} = day_goals:do_ref_quest2(Role),
    {ok, Role2} = bug_login(Role1),
    set_activity_status(Period, 1, []),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidday_goals_new71, _,
       {__Levelday_goals_new71, __Tracesday_goals_new71}}
	  when __Levelday_goals_new71 band 64 /= 0 orelse
		 __Tracesday_goals_new71 /= [] ->
	  lager:do_log(info,
		       [{module, day_goals_new}, {function, gm_update_quest},
			{line, 71}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("玩家~w处理了七日目标新旧版本混乱的问题, 周期:~w",
				     [Role#role.id, Period]),
		       none, 4096, 64, __Levelday_goals_new71,
		       __Tracesday_goals_new71, lager_event,
		       __Pidday_goals_new71);
      _ -> ok
    end,
    NewRole = var:set_var(Role2, other, 3078, 1),
    {ok, NewRole};
gm_update_quest(Role) -> {ok, Role}.

-spec bug_login(#role{}) -> {ok, #role{}}.

bug_login(all) ->
    role_group:apply(world, {day_goals_new, bug_login, []}),
    ok;
bug_login(Role = #role{m_day_goals =
			   #m_day_goals{new_grow_list = []}}) ->
    {ok, Role};
bug_login(Role = #role{m_day_goals =
			   #m_day_goals{new_grow_list = QuestList}}) ->
    Role1 = del_quest(QuestList, Role),
    QuestList1 = quest_revise:do_list(Role1, day_goals_new,
				      QuestList),
    {NewQuestList, Role2 = #role{m_day_goals = MDayGoals}} =
	quest:load_quest(QuestList1, [], day_goals_new, Role1),
    NRole = Role2#role{m_day_goals =
			   MDayGoals#m_day_goals{new_grow_list = NewQuestList}},
    NRole2 = check_new_quest(NRole),
    {ok, NRole2}.

-spec compensate(#role{}) -> {ok, #role{}}.

compensate(all) ->
    role_group:apply(world,
		     {day_goals_new, compensate, []}),
    ok;
compensate(Role = #role{reg_time = RegTime,
			m_day_goals = #m_day_goals{period = Period}}) ->
    IsCompensate = var:get_var(Role, other, 3047, 2),
    Now = date:unixtime(),
    case IsCompensate =/= 3 of
      true ->
	  case Now < 1555603200 of
	    true ->
		Day = date:day_diff(RegTime, Now) + 1,
		if Period =:= 13 ->
		       ExpItem = day_goals_new_data:get_exp_item(Period),
		       Num = max(0, (Day - 84) * 50 - 20),
		       {ok, RoleT} = mail:add(Role,
					      {lang:get(<<"Hoàn lại tiến độ"/utf8>>),
					       lang:get(<<"Kính thưa Quý Nhẫn Giả, đây là vật phẩm "
							  "bổ sung tiến độ sự kiện bí mật Hộp Ma "
							  "của bạn, xin vui lòng kiểm tra và xác "
							  "nhận."/utf8>>),
					       [], [{ExpItem, Num}],
					       lang:get(<<"Tiến độ bổ sung mục tiêu 7 ngày mới"/utf8>>),
					       86400 + Now}),
		       NRole = var:set_var(RoleT, other, 3047, 3),
		       {ok, NRole};
		   true -> {ok, var:set_var(Role, other, 3047, 3)}
		end;
	    _ -> {ok, var:set_var(Role, other, 3047, 3)}
	  end;
      _ -> {ok, Role}
    end.

-spec gm_finish_quest(#role{}) -> {ok, #role{}}.

gm_finish_quest(all) ->
    role_group:apply(world,
		     {day_goals_new, gm_finish_quest, []}),
    ok;
gm_finish_quest(Role = #role{m_day_goals =
				 M = #m_day_goals{new_grow_list = QuestList,
						  period = Period,
						  period_day = PeriodDay}})
    when Period == 2 orelse Period == 3 ->
    case date:unixtime() > 1576857599 of
      true -> {ok, Role};
      _ ->
	  Fun = fun (Q = #quest{finish = IsFinish, id = GrowId,
				progress = Progress},
		     Acc) ->
			case IsFinish of
			  2 -> [Q | Acc];
			  _ ->
			      NewQ = case day_goals_new_data:get_quest(GrowId)
					 of
				       #grow_data{day = PeriodDay} ->
					   NewProgress =
					       [Tmp#quest_progress{finish = 1,
								   value =
								       Target}
						|| Tmp =
						       #quest_progress{target_val
									   =
									   Target}
						       <- Progress],
					   Q#quest{finish = 1,
						   progress = NewProgress};
				       _ -> Q
				     end,
			      [NewQ | Acc]
			end
		end,
	  NewQuestList = lists:foldl(Fun, [], QuestList),
	  NewM = M#m_day_goals{new_grow_list = NewQuestList},
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidday_goals_new149, _,
	     {__Levelday_goals_new149, __Tracesday_goals_new149}}
		when __Levelday_goals_new149 band 64 /= 0 orelse
		       __Tracesday_goals_new149 /= [] ->
		lager:do_log(info,
			     [{module, day_goals_new},
			      {function, gm_finish_quest}, {line, 149},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w执行了任务修正", [Role#role.id]), none,
			     4096, 64, __Levelday_goals_new149,
			     __Tracesday_goals_new149, lager_event,
			     __Pidday_goals_new149);
	    _ -> ok
	  end,
	  {ok, Role#role{m_day_goals = NewM}}
    end;
gm_finish_quest(Role) -> {ok, Role}.

get_period_name(2) ->
    lang:get(<<"Nhật ký phiêu lưu"/utf8>>);
get_period_name(3) ->
    lang:get(<<"Hộp Ma Bí Mật"/utf8>>);
get_period_name(5) ->
    lang:get(<<"Nhật ký phiêu lưu"/utf8>>);
get_period_name(6) ->
    lang:get(<<"Hộp Ma Bí Mật"/utf8>>);
get_period_name(8) ->
    lang:get(<<"Nhật ký phiêu lưu"/utf8>>);
get_period_name(9) ->
    lang:get(<<"Hộp Ma Bí Mật"/utf8>>);
get_period_name(10) ->
    lang:get(<<"Nhật ký phiêu lưu"/utf8>>);
get_period_name(11) ->
    lang:get(<<"Hộp Ma Bí Mật"/utf8>>);
get_period_name(12) ->
    lang:get(<<"Nhật ký phiêu lưu"/utf8>>);
get_period_name(13) ->
    lang:get(<<"Hộp Ma Bí Mật"/utf8>>);
get_period_name(_) ->
    lang:get(<<"Mục tiêu 7 ngày mới"/utf8>>).

do_award_2020_4_4(Role = #role{m_day_goals =
				   MDayGoals = #m_day_goals{period = Period,
							    lev_reward =
								LevReward}},
		  7) ->
    LevRewardCfg = [LevId
		    || LevId <- day_goals_new_data:lev_reward_list(Period)],
    CanGetLevReward = LevRewardCfg -- LevReward,
    GetLevReward =
	lists:flatten([day_goals_new_data:get_lev_reward({Period,
							  LevId})
		       || LevId <- CanGetLevReward]),
    NewMailItem = item_lib:merge(GetLevReward, []),
    NRole1 = case NewMailItem of
	       [_ | _] ->
		   case {whereis(lager_event), whereis(lager_event),
			 lager_config:get({lager_event, loglevel}, {0, []})}
		       of
		     {undefined, undefined, _} ->
			 fun () -> {error, lager_not_running} end();
		     {undefined, _, _} ->
			 fun () -> {error, {sink_not_configured, lager_event}}
			 end();
		     {__Pidday_goals_new174, _,
		      {__Levelday_goals_new174, __Tracesday_goals_new174}}
			 when __Levelday_goals_new174 band 64 /= 0 orelse
				__Tracesday_goals_new174 /= [] ->
			 lager:do_log(info,
				      [{module, day_goals_new},
				       {function, do_award_2020_4_4},
				       {line, 174}, {pid, pid_to_list(self())},
				       {node, node()}
				       | lager:md()],
				      io_lib:format("[~ts] 七日目标数据福利任务补发邮件内容为:~w, 当前已领取的奖励id为:~w",
						    [Role#role.name,
						     NewMailItem, LevReward]),
				      none, 4096, 64, __Levelday_goals_new174,
				      __Tracesday_goals_new174, lager_event,
				      __Pidday_goals_new174);
		     _ -> ok
		   end,
		   {Assets, Items} =
		       format:split_assets_items(NewMailItem),
		   PeriodName = get_period_name(Period),
		   Msg =
		       util:fbin(lang:get(<<"尊敬的玩家：\n      您好，为表达对全国各族人民抗击新冠肺炎疫情斗争牺牲烈士和逝世同"
					    "胞的深切哀悼，响应国务院全国停止公共娱乐活动号召，游戏已于4月4日暂停服务一日，因您的角色"
					    "在4月4日处于（~ts）活动期最后一天，现为您补发由于暂停服务而无法完成的进度奖励，请查收"
					    "，祝游戏愉快。"/utf8>>),
				 [PeriodName]),
		   {ok, RoleT} = mail:add(Role,
					  {lang:get(<<"活动补发邮件"/utf8>>), Msg,
					   Assets, Items,
					   lang:get(<<"活动补发邮件"/utf8>>),
					   86400 + date:unixtime()}),
		   RoleT#role{m_day_goals =
				  MDayGoals#m_day_goals{lev_reward =
							    LevRewardCfg}};
	       _ ->
		   case {whereis(lager_event), whereis(lager_event),
			 lager_config:get({lager_event, loglevel}, {0, []})}
		       of
		     {undefined, undefined, _} ->
			 fun () -> {error, lager_not_running} end();
		     {undefined, _, _} ->
			 fun () -> {error, {sink_not_configured, lager_event}}
			 end();
		     {__Pidday_goals_new181, _,
		      {__Levelday_goals_new181, __Tracesday_goals_new181}}
			 when __Levelday_goals_new181 band 64 /= 0 orelse
				__Tracesday_goals_new181 /= [] ->
			 lager:do_log(info,
				      [{module, day_goals_new},
				       {function, do_award_2020_4_4},
				       {line, 181}, {pid, pid_to_list(self())},
				       {node, node()}
				       | lager:md()],
				      io_lib:format("[~ts] 七日目标数据没有需要补发的奖励:~w, 当前已领取的奖励id为:~w",
						    [Role#role.name,
						     NewMailItem, LevReward]),
				      none, 4096, 64, __Levelday_goals_new181,
				      __Tracesday_goals_new181, lager_event,
				      __Pidday_goals_new181);
		     _ -> ok
		   end,
		   Role
	     end,
    var:set_var(NRole1, other, 3120, 1);
do_award_2020_4_4(Role = #role{m_day_goals =
				   #m_day_goals{period = Period}},
		  _) ->
    L = [{2, [{80212, 75}]}, {3, [{80214, 60}]},
	 {5, [{80213, 75}]}, {6, [{80215, 60}]},
	 {8, [{80216, 75}]}, {9, [{80217, 60}]},
	 {10, [{80218, 75}]}, {11, [{80219, 60}]},
	 {12, [{80220, 75}]}, {13, [{80222, 60}]}],
    case lists:keyfind(Period, 1, L) of
      {_, MailItem} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidday_goals_new189, _,
	     {__Levelday_goals_new189, __Tracesday_goals_new189}}
		when __Levelday_goals_new189 band 64 /= 0 orelse
		       __Tracesday_goals_new189 /= [] ->
		lager:do_log(info,
			     [{module, day_goals_new},
			      {function, do_award_2020_4_4}, {line, 189},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts] 七日目标数据福利任务补发邮件内容为:~w",
					   [Role#role.name, MailItem]),
			     none, 4096, 64, __Levelday_goals_new189,
			     __Tracesday_goals_new189, lager_event,
			     __Pidday_goals_new189);
	    _ -> ok
	  end,
	  {Assets, Items} = format:split_assets_items(MailItem),
	  PeriodName = get_period_name(Period),
	  Msg =
	      util:fbin(lang:get(<<"尊敬的玩家：\n      您好，为表达对全国各族人民抗击新冠肺炎疫情斗争牺牲烈士和逝世同"
				   "胞的深切哀悼，响应国务院全国停止公共娱乐活动号召，游戏已于4月4日暂停服务一日，因您的角色"
				   "在4月4日处于(~ts)活动期内，现为您补发一天的任务进度值道具，请查收，祝游戏愉快"/utf8>>),
			[PeriodName]),
	  {ok, RoleT} = mail:add(Role,
				 {lang:get(<<"活动补发邮件"/utf8>>), Msg, Assets,
				  Items, lang:get(<<"活动补发邮件"/utf8>>),
				  86400 + date:unixtime()}),
	  var:set_var(RoleT, other, 3120, 1);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidday_goals_new196, _,
	     {__Levelday_goals_new196, __Tracesday_goals_new196}}
		when __Levelday_goals_new196 band 8 /= 0 orelse
		       __Tracesday_goals_new196 /= [] ->
		lager:do_log(error,
			     [{module, day_goals_new},
			      {function, do_award_2020_4_4}, {line, 196},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("20200404停服七日目标补发失败,~w", [Period]),
			     none, 4096, 8, __Levelday_goals_new196,
			     __Tracesday_goals_new196, lager_event,
			     __Pidday_goals_new196);
	    _ -> ok
	  end,
	  var:set_var(Role, other, 3120, 1)
    end.

do_2020_04_04(Role = #role{reg_time = RegTime,
			   m_day_goals = #m_day_goals{period = Period}}) ->
    Now = date:unixtime(),
    IsDd20200404 = var:get_var(Role, other, 3120, 0),
    case Now >= 1586016000 andalso
	   Now < 1586102400 andalso IsDd20200404 == 0
	of
      true ->
	  RegDay = date:day_diff(RegTime, Now) + 1,
	  RegDayList = [{2, 9, 15}, {3, 16, 22}, {5, 30, 36},
			{6, 37, 43}, {8, 51, 57}, {9, 58, 64}, {10, 65, 71},
			{11, 72, 78}, {12, 79, 85}, {13, 86, 92}],
	  case [{Min, Max}
		|| {PeriodT, Min, Max} <- RegDayList,
		   RegDay >= Min andalso
		     RegDay =< Max andalso PeriodT == Period]
	      of
	    [{_, RegDay} | _] ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidday_goals_new210, _,
		   {__Levelday_goals_new210, __Tracesday_goals_new210}}
		      when __Levelday_goals_new210 band 64 /= 0 orelse
			     __Tracesday_goals_new210 /= [] ->
		      lager:do_log(info,
				   [{module, day_goals_new},
				    {function, do_2020_04_04}, {line, 210},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts] 七日目标补发为补发第7天，注册天数为:~w",
						 [Role#role.name, RegDay]),
				   none, 4096, 64, __Levelday_goals_new210,
				   __Tracesday_goals_new210, lager_event,
				   __Pidday_goals_new210);
		  _ -> ok
		end,
		do_award_2020_4_4(Role, 7);
	    [{_, _} | _] ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidday_goals_new213, _,
		   {__Levelday_goals_new213, __Tracesday_goals_new213}}
		      when __Levelday_goals_new213 band 64 /= 0 orelse
			     __Tracesday_goals_new213 /= [] ->
		      lager:do_log(info,
				   [{module, day_goals_new},
				    {function, do_2020_04_04}, {line, 213},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts] 七日目标补发为补发1-6天的奖励，注册天数为:~w",
						 [Role#role.name, RegDay]),
				   none, 4096, 64, __Levelday_goals_new213,
				   __Tracesday_goals_new213, lager_event,
				   __Pidday_goals_new213);
		  _ -> ok
		end,
		do_award_2020_4_4(Role, 6);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidday_goals_new216, _,
		   {__Levelday_goals_new216, __Tracesday_goals_new216}}
		      when __Levelday_goals_new216 band 64 /= 0 orelse
			     __Tracesday_goals_new216 /= [] ->
		      lager:do_log(info,
				   [{module, day_goals_new},
				    {function, do_2020_04_04}, {line, 216},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts] 注册天数不对，没有进行补发，注册天数为:~w, 旧周期数据为:~w",
						 [Role#role.name, RegDay,
						  Period]),
				   none, 4096, 64, __Levelday_goals_new216,
				   __Tracesday_goals_new216, lager_event,
				   __Pidday_goals_new216);
		  _ -> ok
		end,
		var:set_var(Role, other, 3120, 1)
	  end;
      _ -> Role
    end.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{reg_time = RegTime,
		   m_day_goals =
		       #m_day_goals{new_grow_list = QuestList,
				    grow_list = OldVersionGrowList,
				    period = OldPeriod,
				    period_day = OldPeriodDay}}) ->
    Date = date:unixtime(),
    {Period, PeriodDay} = get_period(RegTime),
    EndTime = get_end_time(RegTime, Period),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidday_goals_new229, _,
       {__Levelday_goals_new229, __Tracesday_goals_new229}}
	  when __Levelday_goals_new229 band 128 /= 0 orelse
		 __Tracesday_goals_new229 /= [] ->
	  lager:do_log(debug,
		       [{module, day_goals_new}, {function, login},
			{line, 229}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("七日目标登陆 ~w ~w ",
				     [OldPeriod, OldPeriodDay]),
		       none, 4096, 128, __Levelday_goals_new229,
		       __Tracesday_goals_new229, lager_event,
		       __Pidday_goals_new229);
      _ -> ok
    end,
    if OldVersionGrowList =/= [] -> {ok, Role};
       OldPeriod > Period -> {ok, Role};
       OldPeriod =/= Period ->
	   case Date >= EndTime of
	     true ->
		 {NRole = #role{m_day_goals = MDayGoals}, _} =
		     reissue_award(Role, 1),
		 {ok,
		  NRole#role{m_day_goals =
				 MDayGoals#m_day_goals{period = Period + 1,
						       period_day = 0}}};
	     _ ->
		 {NRole = #role{m_day_goals = MDayGoals}, _} =
		     reissue_award(Role, 1),
		 NRole1 = NRole#role{m_day_goals =
					 MDayGoals#m_day_goals{period = Period,
							       period_day =
								   PeriodDay,
							       end_time =
								   EndTime}},
		 NewRole0 = check_new_quest(NRole1),
		 {ok, NewRole} = compensate(NewRole0),
		 set_activity_status(Period, 1, []),
		 {ok, NewRole}
	   end;
       Date >= EndTime ->
	   {NRole = #role{m_day_goals = MDayGoals}, _} =
	       reissue_award(Role, 1),
	   {ok,
	    NRole#role{m_day_goals =
			   MDayGoals#m_day_goals{period = Period + 1,
						 period_day = 0}}};
       true ->
	   case OldPeriodDay =:= PeriodDay of
	     true ->
		 {ok,
		  RefRole = #role{m_day_goals =
				      #m_day_goals{new_grow_list =
						       RefQuestList}}} =
		     gm_finish_quest(Role),
		 QuestList1 = quest_revise:do_list(RefRole,
						   day_goals_new, RefQuestList),
		 {NewQuestList, Role1 = #role{m_day_goals = MDayGoals}} =
		     quest:load_quest(QuestList1, [], day_goals_new,
				      RefRole),
		 NewRole0 = check_new_quest(Role1#role{m_day_goals =
							   MDayGoals#m_day_goals{new_grow_list
										     =
										     NewQuestList,
										 end_time
										     =
										     EndTime}}),
		 set_activity_status(Period, 1, []),
		 {ok, NewRole} = compensate(NewRole0),
		 {ok, NewRole};
	     _ ->
		 {Role1 = #role{m_day_goals =
				    #m_day_goals{new_grow_list = QuestList1}},
		  _} =
		     reissue_award(Role, 0),
		 QuestList2 = quest_revise:do_list(Role, day_goals_new,
						   QuestList1),
		 {NewQuestList, NRole = #role{m_day_goals = MDayGoals}} =
		     quest:load_quest(QuestList2, [], day_goals_new, Role1),
		 NRole1 = NRole#role{m_day_goals =
					 MDayGoals#m_day_goals{period_day =
								   PeriodDay,
							       end_time =
								   EndTime,
							       new_grow_list =
								   NewQuestList}},
		 NewRole0 = check_new_quest(NRole1),
		 set_activity_status(Period, 1, []),
		 {ok, NewRole} = compensate(NewRole0),
		 {ok, NewRole}
	   end
    end.

zero_flush(Role = #role{reg_time = RegTime,
			m_day_goals =
			    #m_day_goals{grow_list = OldVersionGrowList,
					 period = OldPeriod,
					 new_grow_list = OldGrowList}}) ->
    Date = date:unixtime(),
    {Period, PeriodDay} = get_period(RegTime),
    EndTime = get_end_time(RegTime, Period),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidday_goals_new282, _,
       {__Levelday_goals_new282, __Tracesday_goals_new282}}
	  when __Levelday_goals_new282 band 128 /= 0 orelse
		 __Tracesday_goals_new282 /= [] ->
	  lager:do_log(debug,
		       [{module, day_goals_new}, {function, zero_flush},
			{line, 282}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("新七日目标0点更新 ~w", [OldPeriod]), none, 4096,
		       128, __Levelday_goals_new282, __Tracesday_goals_new282,
		       lager_event, __Pidday_goals_new282);
      _ -> ok
    end,
    if OldVersionGrowList =/= [] -> {ok, Role};
       OldPeriod > Period -> {ok, Role};
       OldPeriod =/= Period ->
	   {NRole, DelGrowList} = reissue_award(Role, 1),
	   NRole2 = #role{m_day_goals = MDayGoals} =
			del_quest(DelGrowList, NRole),
	   NRole3 = NRole2#role{m_day_goals =
				    MDayGoals#m_day_goals{period = Period,
							  period_day =
							      PeriodDay,
							  end_time = EndTime}},
	   NewRole = check_new_quest(NRole3),
	   set_activity_status(OldPeriod, 0, []),
	   set_activity_status(Period, 1, []),
	   {ok, NewRole};
       Date >= EndTime ->
	   {NRole, _} = reissue_award(Role, 1),
	   NRole2 = #role{m_day_goals = MDayGoals} =
			del_quest(OldGrowList, NRole),
	   set_activity_status(OldPeriod, 0, []),
	   {ok,
	    NRole2#role{m_day_goals =
			    MDayGoals#m_day_goals{period = Period + 1,
						  period_day = 0}}};
       true ->
	   {NRole, DelGrowList} = reissue_award(Role, 0),
	   NRole2 = #role{m_day_goals = MDayGoals} =
			del_quest(DelGrowList, NRole),
	   NRole3 = NRole2#role{m_day_goals =
				    MDayGoals#m_day_goals{period_day =
							      PeriodDay,
							  end_time = EndTime}},
	   NewRole = check_new_quest(NRole3),
	   set_activity_status(Period, 1, []),
	   {ok, NewRole}
    end.

reissue_award(Role = #role{m_day_goals =
			       MDayGoals = #m_day_goals{period = Period,
							period_day = PeriodDay,
							old_data2 = OldData,
							new_grow_list =
							    GrowList}},
	      0) ->
    ExpItemId = day_goals_new_data:get_exp_item(Period),
    {ChargeGrowL, CommGrowL} = lists:partition(fun
						 (#quest{id = GrowId}) ->
						     is_charge(GrowId)
					       end,
					       GrowList),
    GrowFun = fun (G = #quest{id = GrowId, finish = 1},
		   {AccMailItem, AccExpItem, NGrowList}) ->
		      AwardList = day_goals_new_data:get_reward(GrowId),
		      {ExpAward, MailAward} = lists:partition(fun ({ItemId,
								    _}) ->
								      ItemId =:=
									ExpItemId
							      end,
							      AwardList),
		      NewAccItem = item_lib:merge(MailAward, AccMailItem),
		      NewExpItem = item_lib:merge(ExpAward, AccExpItem),
		      NGrowListT = lists:keyreplace(GrowId, #quest.id,
						    NGrowList,
						    G#quest{finish = 2}),
		      {NewAccItem, NewExpItem, NGrowListT};
		  (_, DataT) -> DataT
	      end,
    {MailItem, ExpItem, NewCommGrowL} = lists:foldl(GrowFun,
						    {[], [], CommGrowL},
						    CommGrowL),
    NRole = case MailItem of
	      [_ | _] ->
		  {Assets, Items} = format:split_assets_items(MailItem),
		  PeriodName = day_goals_new_data:period_name(Period),
		  {ok, RoleT} = mail:add(Role,
					 {util:fbin("~ts奖励补发", [PeriodName]),
					  util:fbin("亲爱的冒险者大人, ~ts活动中您有奖励未领取, 现为你奉上！",
						    [PeriodName]),
					  Assets, Items,
					  lang:get(<<"Mục tiêu bảy ngày mới"/utf8>>),
					  86400 + date:unixtime()}),
		  RoleT;
	      _ -> Role
	    end,
    Gain = format:val_to_gain(ExpItem, day_goals_new),
    NewRole = case role_gain:do(NRole, Gain) of
		{false, _} ->
		    case {whereis(lager_event), whereis(lager_event),
			  lager_config:get({lager_event, loglevel}, {0, []})}
			of
		      {undefined, undefined, _} ->
			  fun () -> {error, lager_not_running} end();
		      {undefined, _, _} ->
			  fun () -> {error, {sink_not_configured, lager_event}}
			  end();
		      {__Pidday_goals_new341, _,
		       {__Levelday_goals_new341, __Tracesday_goals_new341}}
			  when __Levelday_goals_new341 band 8 /= 0 orelse
				 __Tracesday_goals_new341 /= [] ->
			  lager:do_log(error,
				       [{module, day_goals_new},
					{function, reissue_award}, {line, 341},
					{pid, pid_to_list(self())},
					{node, node()}
					| lager:md()],
				       io_lib:format("【~w】无法领取七日目标补发奖励~w",
						     [Role#role.name, ExpItem]),
				       none, 4096, 8, __Levelday_goals_new341,
				       __Tracesday_goals_new341, lager_event,
				       __Pidday_goals_new341);
		      _ -> ok
		    end,
		    NRole;
		{ok, NRoleT} ->
		    log:log_gain(Gain, Role, NRoleT, <<"新七日目标"/utf8>>,
				 util:fbin("领取七日目标补发奖励 ~w ~w",
					   [Period, PeriodDay])),
		    NRoleT
	      end,
    NewOldData = [{Period, PeriodDay, NewCommGrowL,
		   MailItem, []}
		  | OldData],
    {NewRole#role{m_day_goals =
		      MDayGoals#m_day_goals{old_data2 = NewOldData,
					    new_grow_list = ChargeGrowL}},
     NewCommGrowL};
reissue_award(Role = #role{m_day_goals =
			       #m_day_goals{new_grow_list = []}},
	      1) ->
    {Role, []};
reissue_award(Role = #role{m_day_goals =
			       MDayGoals = #m_day_goals{period = Period,
							period_day = PeriodDay,
							old_data2 = OldData,
							new_grow_list =
							    GrowList,
							lev_reward =
							    LevReward}},
	      1) ->
    ExpItemId = day_goals_new_data:get_exp_item(Period),
    GrowFun = fun (G = #quest{id = GrowId, finish = 1},
		   {AccMailItem, AccExpItem, NGrowList}) ->
		      AwardList = day_goals_new_data:get_reward(GrowId),
		      {ExpAward, MailAward} = lists:partition(fun ({ItemId,
								    _}) ->
								      ItemId =:=
									ExpItemId
							      end,
							      AwardList),
		      NewAccItem = item_lib:merge(MailAward, AccMailItem),
		      NewExpItem = item_lib:merge(ExpAward, AccExpItem),
		      NGrowListT = lists:keyreplace(GrowId, #quest.id,
						    NGrowList,
						    G#quest{finish = 2}),
		      {NewAccItem, NewExpItem, NGrowListT};
		  (_, DataT) -> DataT
	      end,
    {MailItem, ExpItem, NewGrowList} = lists:foldl(GrowFun,
						   {[], [], GrowList},
						   GrowList),
    Gain = format:val_to_gain(ExpItem, day_goals_new),
    NRole = case role_gain:do(Role, Gain) of
	      {false, _} ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidday_goals_new367, _,
		     {__Levelday_goals_new367, __Tracesday_goals_new367}}
			when __Levelday_goals_new367 band 8 /= 0 orelse
			       __Tracesday_goals_new367 /= [] ->
			lager:do_log(error,
				     [{module, day_goals_new},
				      {function, reissue_award}, {line, 367},
				      {pid, pid_to_list(self())}, {node, node()}
				      | lager:md()],
				     io_lib:format("【~w】无法领取七日目标补发奖励~w",
						   [Role#role.name, ExpItem]),
				     none, 4096, 8, __Levelday_goals_new367,
				     __Tracesday_goals_new367, lager_event,
				     __Pidday_goals_new367);
		    _ -> ok
		  end,
		  Role;
	      {ok, NRoleT} ->
		  log:log_gain(Gain, Role, NRoleT, <<"新七日目标"/utf8>>,
			       util:fbin("领取七日目标补发奖励 ~w ~w",
					 [Period, PeriodDay])),
		  NRoleT
	    end,
    {NewLev, _} = calc_lev(NRole),
    LevRewardCfg = [LevId
		    || LevId <- day_goals_new_data:lev_reward_list(Period),
		       NewLev >= LevId],
    CanGetLevReward = LevRewardCfg -- LevReward,
    GetLevReward =
	lists:flatten([day_goals_new_data:get_lev_reward({Period,
							  LevId})
		       || LevId <- CanGetLevReward]),
    NewMailItem = item_lib:merge(GetLevReward, MailItem),
    NewRole = case NewMailItem of
		[_ | _] ->
		    {Assets, Items} =
			format:split_assets_items(NewMailItem),
		    PeriodName = day_goals_new_data:period_name(Period),
		    {ok, RoleT} = mail:add(NRole,
					   {util:fbin("~ts奖励补发", [PeriodName]),
					    util:fbin("亲爱的冒险者大人, ~ts活动中您有奖励未领取, 现为你奉上！",
						      [PeriodName]),
					    Assets, Items,
					    lang:get(<<"Mục tiêu bảy ngày mới"/utf8>>),
					    86400 + date:unixtime()}),
		    RoleT;
		_ -> NRole
	      end,
    NewOldData = [{Period, PeriodDay, NewGrowList,
		   NewMailItem, LevReward ++ CanGetLevReward}
		  | OldData],
    {NewRole#role{m_day_goals =
		      MDayGoals#m_day_goals{old_data2 = NewOldData,
					    new_grow_list = [], lev_reward = [],
					    charge = 0, num = 0}},
     GrowList}.

-spec del_quest([#quest{}], #role{}) -> {[#quest{}],
					 #role{}}.

del_quest([], Role) -> Role;
del_quest([#quest{progress = Progress} | Other],
	  Role) ->
    Tids = [Tid
	    || #quest_progress{finish = 0, trigger = Tid}
		   <- Progress,
	       is_tuple(Tid)],
    NewRole = role_trigger:del(Tids, Role),
    del_quest(Other, NewRole).

-spec update_quest(#role{}, #quest{},
		   #quest_progress{}) -> #role{}.

update_quest(Role = #role{m_day_goals =
			      MDayGoals = #m_day_goals{new_grow_list =
							   QuestList}},
	     Q = #quest{id = QuestId, progress = P},
	     Progress = #quest_progress{id = ProgressId}) ->
    NewP = lists:keyreplace(ProgressId, #quest_progress.id,
			    P, Progress),
    case [false || #quest_progress{finish = 0} <- NewP] of
      [] ->
	  NewQuest = Q#quest{progress = NewP, finish = 1},
	  NewQuestList = lists:keyreplace(QuestId, #quest.id,
					  QuestList, NewQuest),
	  NewRole = Role#role{m_day_goals =
				  MDayGoals#m_day_goals{new_grow_list =
							    NewQuestList}},
	  push_quest(NewRole, [NewQuest]),
	  NewRole;
      _ ->
	  NewQuest = Q#quest{progress = NewP},
	  NewQuestList = lists:keyreplace(QuestId, #quest.id,
					  QuestList, NewQuest),
	  push_quest(Role, [NewQuest]),
	  Role#role{m_day_goals =
			MDayGoals#m_day_goals{new_grow_list = NewQuestList}}
    end.

-spec push_quest(#role{}) -> ok.

push_quest(Role = #role{m_day_goals =
			    #m_day_goals{new_grow_list = QuestList,
					 period = Period,
					 period_day = PeriodDay,
					 end_time = EndTime}})
    when Period == 2 orelse Period == 3 ->
    CliListT = [to_cli(I, PeriodDay)
		|| I = #quest{} <- QuestList],
    CliList = [T || T <- CliListT, T =/= undefined],
    {Lev, Exp} = calc_lev(Role),
    sys_conn:pack_send(13604,
		       {Period, PeriodDay, EndTime, Lev, Exp, CliList}),
    ok;
push_quest(Role = #role{m_day_goals =
			    #m_day_goals{new_grow_list = QuestList,
					 period = Period,
					 period_day = PeriodDay,
					 end_time = EndTime}}) ->
    CliList = [to_cli(I) || I = #quest{} <- QuestList],
    {Lev, Exp} = calc_lev(Role),
    sys_conn:pack_send(13604,
		       {Period, PeriodDay, EndTime, Lev, Exp, CliList}),
    ok.

-spec push_quest(#role{}, list()) -> ok.

push_quest(_Role = #role{m_day_goals =
			     #m_day_goals{period_day = PeriodDay,
					  period = Period}},
	   List)
    when Period == 2 orelse Period == 3 ->
    CliListT = [to_cli(I, PeriodDay) || I <- List],
    CliList = [T || T <- CliListT, T =/= undefined],
    sys_conn:pack_send(13605, {CliList}),
    ok;
push_quest(_Role, List) ->
    CliList = [to_cli(I) || I <- List],
    sys_conn:pack_send(13605, {CliList}),
    ok.

to_cli(#quest{id = Id, finish = Finish,
	      progress =
		  [#quest_progress{target_val = TarVal, value = Val}]}) ->
    {Id, Finish, TarVal, Val};
to_cli(#quest{id = Id, finish = Finish,
	      progress = []}) ->
    {Id, Finish, 1, 1}.

to_cli(#quest{id = Id, finish = Finish,
	      progress =
		  [#quest_progress{target_val = TarVal, value = Val}]},
       PeriodDay) ->
    case day_goals_new_data:get_quest(Id) of
      #grow_data{day = PeriodDay} ->
	  {Id, Finish, TarVal, Val};
      undefined -> {Id, Finish, TarVal, Val};
      _ -> undefined
    end.

-spec push_change_lev(#role{}, pos_integer()) -> ok.

push_change_lev(Role = #role{m_day_goals =
				 #m_day_goals{period = Period}},
		ItemId) ->
    NeedItemId = day_goals_new_data:get_exp_item(Period),
    case ItemId =:= NeedItemId of
      true ->
	  {Lev, Exp} = calc_lev(Role),
	  sys_conn:pack_send(13609, {Lev, Exp}),
	  ok;
      _ -> ok
    end.

-spec push_lev_reward(#role{}) -> ok.

push_lev_reward(Role = #role{m_day_goals =
				 #m_day_goals{lev_reward = LevReward}}) ->
    {Lev, _} = calc_lev(Role),
    sys_conn:pack_send(13607, {Lev, LevReward}),
    ok.

-spec take_lev_reward(#role{}, pos_integer()) -> {ok,
						  #role{}} |
						 {false, bitstring()}.

take_lev_reward(Role = #role{m_day_goals =
				 MDayGoals = #m_day_goals{lev_reward =
							      LevReward,
							  period = Period}},
		Id) ->
    {Lev, _} = calc_lev(Role),
    case Id > Lev of
      true ->
	  {false, lang:get(<<"Không đạt đến mức nhận"/utf8>>)};
      _ ->
	  case day_goals_new_data:get_lev_reward({Period, Id}) of
	    Reward = [_ | _] ->
		case lists:member(Id, LevReward) of
		  true ->
		      {false, lang:get(<<"Phần thưởng đã được nhận"/utf8>>)};
		  _ ->
		      GL = format:val_to_gain(Reward, day_goals_lev_reward),
		      case role_gain:do_notice(Role, GL) of
			{false, #gain{msg = Msg}} -> {false, Msg};
			{ok, NRole} ->
			    NewRole = NRole#role{m_day_goals =
						     MDayGoals#m_day_goals{lev_reward
									       =
									       [Id
										| LevReward]}},
			    log:log_gain(GL, Role, NewRole, <<"新七日目标"/utf8>>,
					 util:fbin("领取等级奖励 ~w", [Id])),
			    push_lev_reward(NewRole),
			    {ok, NewRole}
		      end
		end;
	    _ ->
		{false, lang:get(<<"Phần thưởng không tồn tại"/utf8>>)}
	  end
    end.

-spec commit_quest(#role{},
		   Id :: pos_integer()) -> {false, binary()} |
					   {ok, #role{}}.

commit_quest(Role = #role{m_day_goals =
			      MDayGoals = #m_day_goals{new_grow_list =
							   QuestList}},
	     Id) ->
    case day_goals_new_data:get_reward(Id) of
      Items when is_list(Items) ->
	  case lists:keyfind(Id, #quest.id, QuestList) of
	    #quest{finish = 2} ->
		{false, lang:get(<<"Nhiệm vụ đã được gửi"/utf8>>)};
	    Q = #quest{finish = 1} ->
		GL = format:val_to_gain(Items, day_goals_new_quest),
		case role_gain:do_notice(Role, GL) of
		  {false, #gain{msg = Msg}} -> {false, Msg};
		  {ok, Role1} ->
		      NewQuest = Q#quest{finish = 2},
		      NewQuestList = lists:keyreplace(Id, #quest.id,
						      QuestList, NewQuest),
		      NRole = Role1#role{m_day_goals =
					     MDayGoals#m_day_goals{new_grow_list
								       =
								       NewQuestList}},
		      push_quest(NRole, [NewQuest]),
		      log:log_gain(GL, Role, NRole, <<"新七日目标任务"/utf8>>,
				   util:fbin("id:~w", [Id])),
		      {ok, NRole}
		end;
	    #quest{} ->
		{false, lang:get(<<"Nhiệm vụ chưa hoàn thành"/utf8>>)};
	    _ ->
		{false, lang:get(<<"Nhiệm vụ không tồn tại"/utf8>>)}
	  end;
      _ ->
	  {false,
	   lang:get(<<"Dữ liệu cấu hình không tồn tại"/utf8>>)}
    end.

check_new_quest(Role = #role{m_day_goals =
				 #m_day_goals{period = Period,
					      period_day = PeriodDay}}) ->
    case day_goals_new_data:quest_list({Period, PeriodDay})
	   ++ day_goals_new_data:quest_list2(Period)
	of
      QusetL = [_ | _] -> do_check_new_quest(QusetL, Role);
      _ -> Role
    end.

do_check_new_quest([], Role) -> Role;
do_check_new_quest([#grow_data{goal_id = Id,
			       progress = Progress}
		    | T],
		   Role = #role{m_day_goals =
				    MDayGoals = #m_day_goals{new_grow_list =
								 QuestList}}) ->
    case lists:keymember(Id, #quest.id, QuestList) of
      true -> do_check_new_quest(T, Role);
      _ ->
	  Progress1 = quest_prog_init:do(Role, Progress, Id),
	  Finish = case [false
			 || #quest_progress{finish = 0} <- Progress1]
		       of
		     [] -> 1;
		     _ -> 0
		   end,
	  {NewProgress, Role1} = quest:load_progress(Progress1,
						     day_goals_new, Id, [],
						     Role),
	  NewQuest = #quest{id = Id, finish = Finish,
			    progress = NewProgress},
	  NewQuestList = [NewQuest | QuestList],
	  NRole = Role1#role{m_day_goals =
				 MDayGoals#m_day_goals{new_grow_list =
							   NewQuestList}},
	  do_check_new_quest(T, NRole)
    end.

get_period(RegTime) ->
    Date = date:unixtime(),
    Day = date:day_diff(RegTime, Date),
    Period = min(Day div 7 + 1,
		 day_goals_new_data:get_max()),
    {Period, Day rem 7 + 1}.

calc_lev(#role{holiday_assets = HolidayAssets,
	       m_day_goals = #m_day_goals{period = Period}}) ->
    ItemId = day_goals_new_data:get_exp_item(Period),
    case lists:keyfind(ItemId, 1, HolidayAssets) of
      {_, Exp} ->
	  Lev = case day_goals_new_data:get_lev({Period, Exp}) of
		  LevT when is_integer(LevT) -> LevT;
		  _ -> 0
		end,
	  {Lev, Exp};
      _ ->
	  Lev = case day_goals_new_data:get_lev({Period, 0}) of
		  LevT when is_integer(LevT) -> LevT;
		  _ -> 0
		end,
	  {Lev, 0}
    end.

get_end_time(RegTime, Period) ->
    {_, Time} = date:seconds_to_datetime(RegTime),
    N = day_goals_data:get_const(over_time) * Period - 1,
    DiffTime = N * 86400 +
		 calendar:time_to_seconds({23, 59, 59})
		 - calendar:time_to_seconds(Time),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidday_goals_new594, _,
       {__Levelday_goals_new594, __Tracesday_goals_new594}}
	  when __Levelday_goals_new594 band 128 /= 0 orelse
		 __Tracesday_goals_new594 /= [] ->
	  lager:do_log(debug,
		       [{module, day_goals_new}, {function, get_end_time},
			{line, 594}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("七日目标:~w", [N]), none, 4096, 128,
		       __Levelday_goals_new594, __Tracesday_goals_new594,
		       lager_event, __Pidday_goals_new594);
      _ -> ok
    end,
    RegTime + DiffTime.

set_activity_status(Period, Status, Args) ->
    case day_goals_new_data:get_icon(Period) of
      Icon when is_integer(Icon) ->
	  activity_self:set_activity(Icon, Status, Args);
      _ -> skip
    end.

is_charge(QuestId) ->
    case day_goals_new_data:get_quest(QuestId) of
      #grow_data{} -> false;
      _ -> true
    end.

-spec get_quest(pos_integer()) -> #grow_data{}.

get_quest(Id) ->
    case day_goals_new_data:get_quest(Id) of
      GrowData = #grow_data{} -> GrowData;
      _ -> day_goals_new_data:get_quest2(Id)
    end.


