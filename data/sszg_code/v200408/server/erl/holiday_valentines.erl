-file("src/mod/holiday_valentines/holiday_valentines"
      ".erl",
      1).

-module(holiday_valentines).

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
		{m_holiday_valentines,
		 [ver, camp_id, score, reward, ext]},
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

-export([init/0, repair_data/1, zero_flush/1, login/1,
	 push_base_info/1, point/1, get_reward/2, donate/3,
	 get_lev_score/2]).

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

-file("src/mod/holiday_valentines/holiday_valentines"
      ".erl",
      19).

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

-file("src/mod/holiday_valentines/holiday_valentines"
      ".erl",
      20).

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

-file("src/mod/holiday_valentines/holiday_valentines"
      ".erl",
      21).

-file("inc/holiday_valentines.hrl", 1).

-record(m_holiday_valentines,
	{ver = 1  :: pos_integer(),
	 camp_id = 0  :: pos_integer(),
	 score = 0  :: pos_integer(), reward = []  :: list(),
	 ext = []  :: list()}).

-file("src/mod/holiday_valentines/holiday_valentines"
      ".erl",
      22).

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

-file("src/mod/holiday_valentines/holiday_valentines"
      ".erl",
      23).

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

-file("src/mod/holiday_valentines/holiday_valentines"
      ".erl",
      24).

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

-file("src/mod/holiday_valentines/holiday_valentines"
      ".erl",
      25).

repair_data(all) ->
    role_group:apply(world,
		     {holiday_valentines, repair_data, []});
repair_data(Role = #role{power = Power, id = RoleId,
			 m_holiday_valentines =
			     MH = #m_holiday_valentines{score = OldScore}}) ->
    case role_score(RoleId) of
      RoleScore
	  when is_integer(RoleScore) andalso
		 RoleScore > OldScore ->
	  case holiday_lib:get_open_holiday(Role,
					    [3049, 93049, 993049])
	      of
	    #holiday{camp_id = 49905} ->
		case var:get_var(Role, acc, 2062, 0) of
		  0 ->
		      OpenSrvTime = game_lib:server_open_time(ms),
		      MinTime = 1581004800,
		      MaxTime = 1581091200,
		      NRole = var:set_var(Role, acc, 2062, 1),
		      case OpenSrvTime >= MinTime andalso
			     OpenSrvTime < MaxTime
			  of
			true ->
			    NewMH = MH#m_holiday_valentines{camp_id = 49905,
							    score = RoleScore},
			    NRole1 = NRole#role{m_holiday_valentines = NewMH},
			    push_base_info(NRole1),
			    rank_listener:handle(valentines_score, NRole1,
						 #{time => date:unixtime(),
						   count => RoleScore,
						   power => Power}),
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
			      {__Pidholiday_valentines46, _,
			       {__Levelholiday_valentines46,
				__Tracesholiday_valentines46}}
				  when __Levelholiday_valentines46 band 64 /= 0
					 orelse
					 __Tracesholiday_valentines46 /= [] ->
				  lager:do_log(info,
					       [{module, holiday_valentines},
						{function, repair_data},
						{line, 46},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("玩家~w执行情人节活动数据修复,积分由~w修复为~w",
							     [RoleId, OldScore,
							      RoleScore]),
					       none, 4096, 64,
					       __Levelholiday_valentines46,
					       __Tracesholiday_valentines46,
					       lager_event,
					       __Pidholiday_valentines46);
			      _ -> ok
			    end,
			    {ok, NRole1};
			_ -> {ok, NRole}
		      end;
		  _ -> {ok, Role}
		end;
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end.

-spec init() -> #m_holiday_valentines{}.

init() -> #m_holiday_valentines{}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_holiday_valentines =
			    MH = #m_holiday_valentines{camp_id = RoleCampId,
						       reward = RewardList}}) ->
    {EndCampId, EndScore, EndMaxScore} =
	sys_env:get(end_valentines_score, {0, 0, 0}),
    NewRole = case holiday_lib:get_open_holiday(Role,
						[3049, 93049, 993049])
		  of
		#holiday{camp_id = RoleCampId} -> Role;
		#holiday{camp_id = NewCampId}
		    when EndCampId =:= RoleCampId andalso RoleCampId > 0 ->
		    MailRole = mail_reward(Role, RewardList, EndScore,
					   EndMaxScore),
		    EndMH = MH#m_holiday_valentines{camp_id = NewCampId,
						    reward = [], score = 0,
						    ext = []},
		    NRole1 = MailRole#role{m_holiday_valentines = EndMH},
		    NRole1;
		#holiday{camp_id = NewCampId} ->
		    NRole2 = Role#role{m_holiday_valentines =
					   MH#m_holiday_valentines{camp_id =
								       NewCampId,
								   reward = [],
								   score = 0,
								   ext = []}},
		    NRole2;
		_
		    when EndCampId =:= RoleCampId andalso RoleCampId > 0 ->
		    MailRole = mail_reward(Role, RewardList, EndScore,
					   EndMaxScore),
		    EndMH = MH#m_holiday_valentines{camp_id = 0,
						    reward = [], score = 0,
						    ext = []},
		    NRole3 = MailRole#role{m_holiday_valentines = EndMH},
		    NRole3;
		_ ->
		    NRole4 = Role#role{m_holiday_valentines =
					   MH#m_holiday_valentines{camp_id = 0,
								   reward = [],
								   score = 0,
								   ext = []}},
		    NRole4
	      end,
    holiday:push_bid_can_reward(NewRole, 93049),
    {ok, NewRole}.

-spec login(#role{}) -> {ok, #role{}}.

login(OldRole) ->
    {_,
     Role = #role{m_holiday_valentines =
		      MH = #m_holiday_valentines{camp_id = RoleCampId,
						 reward = RewardList}}} =
	repair_data(OldRole),
    {EndCampId, EndScore, EndMaxScore} =
	sys_env:get(end_valentines_score, {0, 0, 0}),
    NewRole = case holiday_lib:get_open_holiday(Role,
						[3049, 93049, 993049])
		  of
		#holiday{camp_id = RoleCampId} -> Role;
		#holiday{camp_id = NewCampId}
		    when EndCampId =:= RoleCampId andalso RoleCampId > 0 ->
		    MailRole = mail_reward(Role, RewardList, EndScore,
					   EndMaxScore),
		    EndMH = MH#m_holiday_valentines{camp_id = NewCampId,
						    reward = [], score = 0,
						    ext = []},
		    NRole1 = MailRole#role{m_holiday_valentines = EndMH},
		    NRole1;
		#holiday{camp_id = NewCampId} ->
		    NRole2 = Role#role{m_holiday_valentines =
					   MH#m_holiday_valentines{camp_id =
								       NewCampId,
								   reward = [],
								   score = 0,
								   ext = []}},
		    NRole2;
		_
		    when EndCampId =:= RoleCampId andalso RoleCampId > 0 ->
		    MailRole = mail_reward(Role, RewardList, EndScore,
					   EndMaxScore),
		    EndMH = MH#m_holiday_valentines{camp_id = 0,
						    reward = [], score = 0,
						    ext = []},
		    NRole3 = MailRole#role{m_holiday_valentines = EndMH},
		    NRole3;
		_ ->
		    NRole4 = Role#role{m_holiday_valentines =
					   MH#m_holiday_valentines{camp_id = 0,
								   reward = [],
								   score = 0,
								   ext = []}},
		    NRole4
	      end,
    holiday:push_bid_can_reward(NewRole, 93049),
    {ok, NewRole}.

-spec push_base_info(#role{}) -> ok.

push_base_info(Role = #role{pid = RolePid,
			    m_holiday_valentines =
				#m_holiday_valentines{camp_id = CampId,
						      reward = RewardList,
						      score = MyScore}}) ->
    {SysTemCampId, Score, MaxScore} =
	sys_env:get(valentines_score, {0, 0, 0}),
    Now = date:unixtime(),
    case holiday_lib:get_open_holiday(Role,
				      [3049, 93049, 993049])
	of
      #holiday{camp_id = CampId, end_time = EndTime}
	  when SysTemCampId =:= CampId ->
	  LastTime = max(0, EndTime - Now),
	  {NowLev, NowScore, NowMaxScore} = get_lev_score(Score,
							  MaxScore),
	  role:apply(async, RolePid,
		     {holiday_valentines, point, []}),
	  holiday:push_bid_can_reward(Role, 93049),
	  role:pack_send(28500,
			 {LastTime, NowLev, NowScore, NowMaxScore, MyScore,
			  Score, MaxScore, RewardList});
      _ -> role:pack_send(28500, {0, 0, 0, 0, 0, 0, 0, []})
    end,
    ok.

point(Role) ->
    NRole1 = var:set_var(Role, day, 125, 1),
    holiday:push_bid_can_reward(NRole1, 93049),
    {ok, NRole1}.

-spec get_reward(list(), #role{}) -> {ok, #role{}} |
				     {false, string()}.

get_reward(IdList, Role) ->
    case holiday_lib:get_open_holiday(Role,
				      [3049, 93049, 993049])
	of
      #holiday{} ->
	  case check_reward_cond(IdList, Role, []) of
	    {ok, DataRewardList} ->
		Gain = format:val_to_gain(DataRewardList,
					  holiday_merge_goal),
		case role_gain:do_notice(Role, Gain) of
		  {ok,
		   GainRole = #role{m_holiday_valentines =
					MH = #m_holiday_valentines{reward =
								       RewardList}}} ->
		      NewMH = MH#m_holiday_valentines{reward =
							  IdList ++ RewardList},
		      NewRole = GainRole#role{m_holiday_valentines = NewMH},
		      push_base_info(NewRole),
		      log:log_gain(Gain, Role, NewRole, <<"甜蜜大作战积分奖励"/utf8>>,
				   <<"领取奖励"/utf8>>),
		      {ok, NewRole};
		  _ -> {false, lang:get(<<"领取奖励失败"/utf8>>)}
		end;
	    {false, Reason} -> {false, Reason};
	    _ -> {false, lang:get(<<"没有奖励"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec donate(#role{}, pos_integer(),
	     pos_integer()) -> {ok, #role{}} | {false, string()}.

donate(Role = #role{power = Power,
		    m_holiday_valentines = #m_holiday_valentines{},
		    pid = RolePid},
       Id, Num) ->
    case holiday_lib:get_open_holiday(Role,
				      [3049, 93049, 993049])
	of
      #holiday{} ->
	  Item1 =
	      holiday_valentines_data:get_const(holiday_item1),
	  Item2 =
	      holiday_valentines_data:get_const(holiday_item2),
	  ScoreNum = if Id =:= Item1 ->
			    holiday_valentines_data:get_const(holiday_score1) *
			      Num;
			Id =:= Item2 ->
			    holiday_valentines_data:get_const(holiday_score2) *
			      Num;
			true ->
			    holiday_valentines_data:get_const(holiday_score3) *
			      Num
		     end,
	  Reward =
	      [{holiday_valentines_data:get_const(score_item_id),
		ScoreNum}],
	  Expend = [{Id, Num}],
	  Gain = format:val_to_gain(Reward,
				    holiday_valentines_gain),
	  Loss = format:val_to_loss(Expend,
				    holiday_valentines_loss),
	  case role_gain:do_notice(Role, Gain ++ Loss,
				   #gain_loss_opts{type = 1})
	      of
	    {ok,
	     GainRole = #role{m_holiday_valentines =
				  MH = #m_holiday_valentines{score =
								 OldScore}}} ->
		log:log_gain(Gain, Role, GainRole, <<"甜蜜大作战捐献"/utf8>>,
			     <<"甜蜜大作战捐献"/utf8>>),
		holiday_valentines_mgr:info({add_score, RolePid,
					     ScoreNum}),
		NewScore = OldScore + ScoreNum,
		NewMH = MH#m_holiday_valentines{score = NewScore},
		NewRole = GainRole#role{m_holiday_valentines = NewMH},
		NewRole1 =
		    role_trigger:fire([#evt_donate_sweet_score{count =
								   ScoreNum}],
				      NewRole),
		Now = date:unixtime(),
		rank_listener:handle(valentines_score, NewRole1,
				     #{time => Now, count => NewScore,
				       power => Power}),
		{ok, NewRole1};
	    _ -> {false, lang:get(<<"道具不足"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

check_reward_cond([], _, OldDataRewardList) ->
    {ok, OldDataRewardList};
check_reward_cond([Id | Rest], Role,
		  OldDataRewardList) ->
    case check_reward_cond(Id, Role) of
      {ok, DataRewardList} ->
	  check_reward_cond(Rest, Role,
			    DataRewardList ++ OldDataRewardList);
      {false, Reason} -> {false, Reason}
    end;
check_reward_cond(_, _, _) ->
    {false, lang:get(<<"参数错误"/utf8>>)}.

check_reward_cond(Id,
		  #role{m_holiday_valentines =
			    #m_holiday_valentines{camp_id = CampId,
						  reward = RewardList}}) ->
    {SysTemCampId, Score, MaxScore} =
	sys_env:get(valentines_score, {0, 0, 0}),
    case SysTemCampId =:= CampId andalso SysTemCampId > 0 of
      true ->
	  Percent = Score / max(1, MaxScore) * 1000,
	  case lists:member(Id, RewardList) of
	    true -> {false, lang:get(<<"你已经领取过该奖励了"/utf8>>)};
	    _ ->
		case holiday_valentines_data:get_score_award(Id) of
		  {DataPercent, DataRewardList}
		      when Percent >= DataPercent ->
		      {ok, DataRewardList};
		  _ -> {false, lang:get(<<"当前不能领取该奖励"/utf8>>)}
		end
	  end;
      _ -> {false, lang:get(<<"当前没有奖励可领取"/utf8>>)}
    end.

-spec get_lev_score(pos_integer(),
		    pos_integer()) -> {pos_integer(), pos_integer(),
				       pos_integer()}.

get_lev_score(Score, MaxScore) ->
    ALLIntervalDataList =
	holiday_valentines_data:get_all_lev(),
    ALLIntervalDataList1 = lists:keysort(1,
					 ALLIntervalDataList),
    do_get_lev_score(Score, MaxScore, ALLIntervalDataList1,
		     0).

do_get_lev_score(Score, MaxScore, IntervalList,
		 OldAllPro) ->
    case IntervalList of
      [{Lev, Pro} | Rest] ->
	  LevMaxScore = MaxScore * Pro / 1000,
	  case Score > LevMaxScore of
	    true ->
		case Rest of
		  [] ->
		      {Lev,
		       round(max(0, Score - MaxScore * OldAllPro / 1000)),
		       round(MaxScore * max(0, Pro - OldAllPro) / 1000)};
		  _ -> do_get_lev_score(Score, MaxScore, Rest, Pro)
		end;
	    _ ->
		{Lev,
		 round(max(0, Score - MaxScore * OldAllPro / 1000)),
		 round(MaxScore * max(0, Pro - OldAllPro) / 1000)}
	  end;
      _ ->
	  {7, round(max(0, Score - MaxScore * 860 / 1000)),
	   round(MaxScore * 140 / 1000)}
    end.

mail_reward(Role, IdList, EndScore, EndMaxScore) ->
    ALLIntervalDataList =
	holiday_valentines_data:get_all_lev(),
    Pro = EndScore / EndMaxScore * 1000,
    case get_mail_reward(ALLIntervalDataList, Pro, IdList,
			 [])
	of
      [] -> Role;
      RewardList when is_list(RewardList) ->
	  {Assets, Items} = format:split_assets_items(RewardList),
	  {ok, MailRole} = mail:add(Role,
				    {lang:get(<<"甜蜜大作战活动补发奖励"/utf8>>),
				     lang:get(<<"亲爱的冒险者大人，这是您在甜蜜大作战活动中尚未领取的奖励，现通过邮件补发，请注意查收"/utf8>>),
				     Assets, Items, <<"甜蜜大作战活动补发奖励"/utf8>>,
				     86400 + date:unixtime()}),
	  MailRole;
      _ -> Role
    end.

get_mail_reward([], _, _, RewardList) -> RewardList;
get_mail_reward([{Lev, DataPro} | Rest], Pro, IdList,
		RewardList) ->
    case Pro >= DataPro of
      true ->
	  case lists:member(Lev, IdList) of
	    true -> get_mail_reward(Rest, Pro, IdList, RewardList);
	    _ ->
		case holiday_valentines_data:get_score_award(Lev) of
		  {_, DataRewardList} ->
		      get_mail_reward(Rest, Pro, IdList,
				      DataRewardList ++ RewardList);
		  _ -> get_mail_reward(Rest, Pro, IdList, RewardList)
		end
	  end;
      _ -> get_mail_reward(Rest, Pro, IdList, RewardList)
    end;
get_mail_reward(_, _, _, RewardList) -> RewardList.

role_score({1009, <<"symix2_1358">>}) -> 34;
role_score({1015, <<"symix2_1362">>}) -> 35;
role_score({1021, <<"symix2_1361">>}) -> 25;
role_score({1024, <<"symix2_1358">>}) -> 34;
role_score({1028, <<"symix2_1357">>}) -> 7;
role_score({103, <<"symix2_1362">>}) -> 32;
role_score({104, <<"9377_1395">>}) -> 45;
role_score({1044, <<"9377_1394">>}) -> 22;
role_score({1044, <<"symix2_1361">>}) -> 50;
role_score({1060, <<"symix_1362">>}) -> 25;
role_score({1081, <<"9377_1395">>}) -> 15;
role_score({109, <<"symix_1359">>}) -> 16;
role_score({1091, <<"symix2_1359">>}) -> 20;
role_score({1096, <<"symix_1361">>}) -> 15;
role_score({1099, <<"symix_1358">>}) -> 31;
role_score({1101, <<"symix_1358">>}) -> 21;
role_score({1113, <<"symlf_3011">>}) -> 48;
role_score({1121, <<"symlf_3007">>}) -> 35;
role_score({1127, <<"symlf_3007">>}) -> 21;
role_score({1134, <<"symix_1358">>}) -> 21;
role_score({1135, <<"symix_1361">>}) -> 14;
role_score({1135, <<"symlf_3007">>}) -> 14;
role_score({1137, <<"symix_1361">>}) -> 76;
role_score({1143, <<"symix_1362">>}) -> 95;
role_score({1159, <<"symlf_3007">>}) -> 137;
role_score({1171, <<"symix_1359">>}) -> 36;
role_score({1171, <<"symix_1362">>}) -> 30;
role_score({1176, <<"symlf_3007">>}) -> 8;
role_score({120, <<"symix_1358">>}) -> 14;
role_score({1200, <<"symix_1361">>}) -> 15;
role_score({1243, <<"symix2_1361">>}) -> 7;
role_score({125, <<"symlf_3007">>}) -> 10;
role_score({1251, <<"symlf_3011">>}) -> 51;
role_score({1303, <<"9377_1394">>}) -> 28;
role_score({1309, <<"symlf_3008">>}) -> 405;
role_score({1310, <<"symix2_1357">>}) -> 21;
role_score({1310, <<"symix2_1361">>}) -> 14;
role_score({1320, <<"symix2_1358">>}) -> 35;
role_score({1332, <<"symlf_3007">>}) -> 8;
role_score({1343, <<"symix2_1360">>}) -> 15;
role_score({1346, <<"symlf_3011">>}) -> 527;
role_score({1351, <<"symlf_3007">>}) -> 19;
role_score({1354, <<"symix_1358">>}) -> 12;
role_score({1367, <<"symix_1362">>}) -> 9;
role_score({1383, <<"symix2_1361">>}) -> 51;
role_score({139, <<"symix_1361">>}) -> 22;
role_score({1399, <<"symix2_1357">>}) -> 6;
role_score({140, <<"symix_1358">>}) -> 15;
role_score({140, <<"symlf_3007">>}) -> 190;
role_score({1412, <<"symix_1361">>}) -> 56;
role_score({1419, <<"symlf_3011">>}) -> 35;
role_score({1431, <<"symix2_1358">>}) -> 14;
role_score({1469, <<"symlf_3008">>}) -> 55;
role_score({1470, <<"symlf_3009">>}) -> 11;
role_score({1476, <<"9377_1395">>}) -> 14;
role_score({15, <<"symix2_1361">>}) -> 25;
role_score({1505, <<"9377_1394">>}) -> 400;
role_score({1515, <<"symix2_1358">>}) -> 17;
role_score({152, <<"symix_1362">>}) -> 50;
role_score({1528, <<"symix_1362">>}) -> 28;
role_score({153, <<"symix_1362">>}) -> 6;
role_score({1547, <<"symix2_1362">>}) -> 19;
role_score({1552, <<"symix_1361">>}) -> 13;
role_score({1588, <<"symlf_3007">>}) -> 3;
role_score({1590, <<"symlf_3007">>}) -> 95;
role_score({1601, <<"symix_1358">>}) -> 20;
role_score({1606, <<"symix_1358">>}) -> 47;
role_score({1623, <<"symix2_1358">>}) -> 11;
role_score({1626, <<"symlf_3007">>}) -> 156;
role_score({1630, <<"9377_1394">>}) -> 27;
role_score({1662, <<"symlf_3008">>}) -> 14;
role_score({1669, <<"symix2_1358">>}) -> 52;
role_score({1670, <<"symix_1362">>}) -> 83;
role_score({1697, <<"9377_1395">>}) -> 35;
role_score({1716, <<"symix2_1362">>}) -> 86;
role_score({1719, <<"symix2_1362">>}) -> 8;
role_score({1730, <<"symlf_3009">>}) -> 17;
role_score({1741, <<"symlf_3009">>}) -> 34;
role_score({1746, <<"symix2_1362">>}) -> 15;
role_score({1751, <<"symix_1362">>}) -> 9;
role_score({1752, <<"symix2_1362">>}) -> 84;
role_score({1774, <<"symix_1361">>}) -> 44;
role_score({178, <<"icebird_811">>}) -> 80;
role_score({1804, <<"symix_1362">>}) -> 28;
role_score({1806, <<"9377_1395">>}) -> 460;
role_score({184, <<"symix2_1357">>}) -> 16;
role_score({1851, <<"symix2_1361">>}) -> 14;
role_score({1857, <<"symlf_3009">>}) -> 14;
role_score({186, <<"symix_1361">>}) -> 27;
role_score({1865, <<"symix_1361">>}) -> 45;
role_score({1865, <<"symix2_1358">>}) -> 20;
role_score({1870, <<"symlf_3008">>}) -> 8;
role_score({1890, <<"symix_1361">>}) -> 13;
role_score({1919, <<"symlf_3009">>}) -> 19;
role_score({1932, <<"symix_1362">>}) -> 81;
role_score({1966, <<"9377_1395">>}) -> 15;
role_score({1970, <<"9377_1395">>}) -> 8;
role_score({1980, <<"symix_1361">>}) -> 34;
role_score({199, <<"symix2_1358">>}) -> 175;
role_score({1991, <<"symix2_1358">>}) -> 1;
role_score({2000, <<"9377_1395">>}) -> 19;
role_score({2002, <<"9377_1395">>}) -> 10;
role_score({2005, <<"symlf_3008">>}) -> 14;
role_score({2016, <<"9377_1395">>}) -> 44;
role_score({2063, <<"symix_1362">>}) -> 16;
role_score({208, <<"9377_1395">>}) -> 19;
role_score({208, <<"symix2_1362">>}) -> 58;
role_score({2081, <<"symix2_1360">>}) -> 31;
role_score({2086, <<"symix_1361">>}) -> 35;
role_score({209, <<"9377_1394">>}) -> 16;
role_score({2110, <<"symlf_3011">>}) -> 6;
role_score({2112, <<"symix2_1362">>}) -> 41;
role_score({2116, <<"symix_1362">>}) -> 73;
role_score({2141, <<"symix_1359">>}) -> 26;
role_score({2145, <<"symix_1362">>}) -> 14;
role_score({2190, <<"symlf_3011">>}) -> 36;
role_score({2199, <<"9377_1394">>}) -> 37;
role_score({2226, <<"symix2_1361">>}) -> 67;
role_score({2241, <<"symix_1362">>}) -> 16;
role_score({225, <<"symix2_1357">>}) -> 6;
role_score({2253, <<"symix_1361">>}) -> 16;
role_score({2268, <<"symix2_1358">>}) -> 71;
role_score({2270, <<"symix2_1357">>}) -> 6;
role_score({2299, <<"symlf_3008">>}) -> 17;
role_score({23, <<"symix2_1358">>}) -> 12;
role_score({2318, <<"symix_1361">>}) -> 31;
role_score({2319, <<"symlf_3009">>}) -> 16;
role_score({2321, <<"9377_1395">>}) -> 8;
role_score({2331, <<"symix2_1359">>}) -> 16;
role_score({2334, <<"symix_1362">>}) -> 59;
role_score({234, <<"symix2_1362">>}) -> 16;
role_score({2357, <<"symix_1362">>}) -> 59;
role_score({2360, <<"symlf_3011">>}) -> 13;
role_score({2365, <<"9377_1395">>}) -> 14;
role_score({2376, <<"symix2_1360">>}) -> 61;
role_score({2386, <<"symlf_3011">>}) -> 115;
role_score({2397, <<"symix_1361">>}) -> 70;
role_score({240, <<"symix2_1361">>}) -> 30;
role_score({2414, <<"symlf_3011">>}) -> 12;
role_score({2500, <<"symlf_3011">>}) -> 16;
role_score({2507, <<"symlf_3011">>}) -> 54;
role_score({2509, <<"symix2_1362">>}) -> 7;
role_score({2517, <<"symix2_1360">>}) -> 16;
role_score({2538, <<"symlf_3011">>}) -> 5;
role_score({2550, <<"symlf_3008">>}) -> 15;
role_score({256, <<"symix_1362">>}) -> 86;
role_score({2563, <<"symlf_3009">>}) -> 28;
role_score({2572, <<"symlf_3009">>}) -> 29;
role_score({2612, <<"symix_1359">>}) -> 21;
role_score({2631, <<"symlf_3011">>}) -> 6;
role_score({2648, <<"symix_1359">>}) -> 15;
role_score({2660, <<"9377_1394">>}) -> 8;
role_score({2663, <<"symix2_1362">>}) -> 14;
role_score({2664, <<"symlf_3007">>}) -> 1;
role_score({268, <<"symix2_1360">>}) -> 16;
role_score({2695, <<"9377_1394">>}) -> 34;
role_score({27, <<"symix_1359">>}) -> 19;
role_score({2700, <<"symix_1359">>}) -> 17;
role_score({2707, <<"symix_1361">>}) -> 15;
role_score({2711, <<"symix2_1362">>}) -> 20;
role_score({2726, <<"9377_1395">>}) -> 24;
role_score({273, <<"symix2_1357">>}) -> 8;
role_score({2734, <<"symix2_1362">>}) -> 41;
role_score({2740, <<"9377_1394">>}) -> 8;
role_score({2750, <<"9377_1394">>}) -> 37;
role_score({2761, <<"symix2_1360">>}) -> 25;
role_score({2787, <<"symix2_1358">>}) -> 14;
role_score({2790, <<"symix2_1358">>}) -> 11;
role_score({2791, <<"symix2_1359">>}) -> 134;
role_score({283, <<"symlf_3007">>}) -> 48;
role_score({2858, <<"symix2_1359">>}) -> 18;
role_score({2860, <<"symix2_1358">>}) -> 31;
role_score({2865, <<"symix2_1361">>}) -> 26;
role_score({2878, <<"symix_1361">>}) -> 30;
role_score({2885, <<"symix2_1358">>}) -> 28;
role_score({2887, <<"symix_1361">>}) -> 35;
role_score({29, <<"9377_1395">>}) -> 15;
role_score({291, <<"symlf_3011">>}) -> 19;
role_score({2939, <<"symlf_3011">>}) -> 22;
role_score({2958, <<"symix2_1361">>}) -> 30;
role_score({3008, <<"9377_1394">>}) -> 41;
role_score({3018, <<"9377_1395">>}) -> 41;
role_score({3025, <<"symix_1359">>}) -> 22;
role_score({3048, <<"symlf_3007">>}) -> 186;
role_score({3059, <<"symix2_1358">>}) -> 7;
role_score({3064, <<"9377_1394">>}) -> 142;
role_score({3073, <<"9377_1395">>}) -> 12;
role_score({3092, <<"symix2_1359">>}) -> 325;
role_score({31, <<"symix_1362">>}) -> 49;
role_score({3134, <<"symlf_3008">>}) -> 7;
role_score({3141, <<"symix2_1359">>}) -> 39;
role_score({3142, <<"9377_1395">>}) -> 15;
role_score({3199, <<"9377_1395">>}) -> 76;
role_score({3217, <<"symix2_1360">>}) -> 119;
role_score({3222, <<"symlf_3007">>}) -> 12;
role_score({325, <<"symix2_1357">>}) -> 16;
role_score({3297, <<"symlf_3009">>}) -> 49;
role_score({333, <<"9377_1395">>}) -> 15;
role_score({3348, <<"symlf_3007">>}) -> 43;
role_score({3401, <<"9377_1394">>}) -> 14;
role_score({3409, <<"9377_1394">>}) -> 6;
role_score({3413, <<"9377_1394">>}) -> 17;
role_score({344, <<"9377_1395">>}) -> 231;
role_score({346, <<"symix2_1362">>}) -> 7;
role_score({35, <<"symlf_3011">>}) -> 27;
role_score({3517, <<"symlf_3008">>}) -> 255;
role_score({353, <<"9377_1394">>}) -> 43;
role_score({353, <<"symix_1358">>}) -> 21;
role_score({3593, <<"symlf_3009">>}) -> 20;
role_score({3601, <<"symlf_3007">>}) -> 388;
role_score({362, <<"icebird_811">>}) -> 15;
role_score({3622, <<"symlf_3009">>}) -> 15;
role_score({3623, <<"symlf_3011">>}) -> 16;
role_score({3639, <<"symlf_3008">>}) -> 15;
role_score({364, <<"symix2_1359">>}) -> 56;
role_score({3698, <<"symlf_3011">>}) -> 16;
role_score({3715, <<"symlf_3008">>}) -> 19;
role_score({3743, <<"symlf_3008">>}) -> 9;
role_score({3748, <<"symlf_3008">>}) -> 66;
role_score({3749, <<"symlf_3011">>}) -> 24;
role_score({375, <<"symix2_1359">>}) -> 14;
role_score({3751, <<"9377_1394">>}) -> 65;
role_score({3794, <<"symlf_3008">>}) -> 119;
role_score({381, <<"symix_1359">>}) -> 15;
role_score({3859, <<"symlf_3007">>}) -> 7;
role_score({389, <<"symix2_1360">>}) -> 24;
role_score({39, <<"symix2_1358">>}) -> 51;
role_score({3965, <<"symlf_3007">>}) -> 41;
role_score({397, <<"symlf_3007">>}) -> 144;
role_score({4025, <<"symlf_3007">>}) -> 35;
role_score({409, <<"symix2_1357">>}) -> 23;
role_score({4092, <<"symlf_3008">>}) -> 16;
role_score({4132, <<"9377_1394">>}) -> 50;
role_score({4156, <<"9377_1394">>}) -> 13;
role_score({4246, <<"symlf_3009">>}) -> 19;
role_score({4309, <<"9377_1394">>}) -> 90;
role_score({431, <<"9377_1395">>}) -> 12;
role_score({440, <<"9377_1395">>}) -> 23;
role_score({45, <<"symix2_1360">>}) -> 19;
role_score({4562, <<"symlf_3009">>}) -> 14;
role_score({4574, <<"symlf_3008">>}) -> 20;
role_score({46, <<"symix_1361">>}) -> 20;
role_score({466, <<"icebird_811">>}) -> 11;
role_score({505, <<"symlf_3007">>}) -> 26;
role_score({512, <<"symix2_1357">>}) -> 17;
role_score({52, <<"9377_1394">>}) -> 11;
role_score({52, <<"symix2_1359">>}) -> 74;
role_score({536, <<"9377_1394">>}) -> 15;
role_score({539, <<"symix_1359">>}) -> 20;
role_score({548, <<"symix2_1357">>}) -> 19;
role_score({563, <<"symlf_3009">>}) -> 20;
role_score({579, <<"symix_1362">>}) -> 56;
role_score({587, <<"symix_1361">>}) -> 15;
role_score({614, <<"symlf_3008">>}) -> 33;
role_score({616, <<"9377_1395">>}) -> 73;
role_score({63, <<"symix_1361">>}) -> 34;
role_score({644, <<"symix_1359">>}) -> 14;
role_score({662, <<"9377_1394">>}) -> 16;
role_score({681, <<"9377_1395">>}) -> 8;
role_score({689, <<"symix_1359">>}) -> 22;
role_score({692, <<"symlf_3011">>}) -> 14;
role_score({693, <<"symix_1358">>}) -> 79;
role_score({71, <<"symix_1359">>}) -> 115;
role_score({71, <<"symlf_3008">>}) -> 15;
role_score({710, <<"symix2_1362">>}) -> 25;
role_score({723, <<"symix2_1357">>}) -> 15;
role_score({744, <<"symix2_1357">>}) -> 55;
role_score({749, <<"9377_1394">>}) -> 20;
role_score({750, <<"symix2_1361">>}) -> 110;
role_score({758, <<"symix2_1361">>}) -> 41;
role_score({758, <<"symix2_1362">>}) -> 226;
role_score({77, <<"symlf_3007">>}) -> 15;
role_score({782, <<"symlf_3008">>}) -> 154;
role_score({828, <<"symix_1359">>}) -> 15;
role_score({828, <<"symix_1362">>}) -> 13;
role_score({839, <<"symlf_3011">>}) -> 20;
role_score({851, <<"symix2_1358">>}) -> 66;
role_score({865, <<"symix_1362">>}) -> 8;
role_score({87, <<"symix2_1360">>}) -> 54;
role_score({88, <<"symix2_1359">>}) -> 5;
role_score({923, <<"symix2_1361">>}) -> 34;
role_score({939, <<"symix2_1357">>}) -> 146;
role_score({940, <<"symix2_1357">>}) -> 6;
role_score({968, <<"symix2_1358">>}) -> 42;
role_score({982, <<"9377_1394">>}) -> 90;
role_score(_) -> 0.


