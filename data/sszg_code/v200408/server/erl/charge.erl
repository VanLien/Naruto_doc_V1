-file("data/charge.erl", 1).

-file("src/mod/charge/charge.erl", 1).

-module(charge).

-lager_records([{holiday_return_feat_data,
		 [period, id, f_id, s_id, ref_day, progress, award]},
		{m_holiday_return_feat,
		 [ver, quest_list, period, extra, old_data]},
		{m_holiday_return,
		 [ver, period, start_time, end_time, is_buy,
		  exchange_day_list, exchange_buy_list,
		  return_discount_buy_list, bind_code, bind_end_time,
		  bind_roleid, reward_list, old_data, bind_power,
		  bind_charge, partner_half]},
		{m_holiday_return_sign, [ver, status_list, login_day]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{triple_rebate_data,
		 [id, charge_sum, reward_times, mail_title,
		  mail_content]},
		{charge_data,
		 [id, name, val, gold, first_add, add, vip_exp, pic,
		  is_show, is_iosverify, type, items]},
		{m_charge,
		 [ver, charge_list, first_gift, triple_rebate_list,
		  merge_count, merge_charge_list, day_gift, week_refresh,
		  week_gift, month_refresh, month_gift, day_first_gift,
		  first_gift_ver, choose_first_gift_status,
		  reset_charge_list, warehouse_charge_list]},
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

-export([init/0, login/1, cli_info/1, notice/3, pay/3,
	 ready/1, zero_flush/1, fire/2]).

-export([gm_pay/2, gm_fire/2]).

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

-file("src/mod/charge/charge.erl", 21).

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

-file("src/mod/charge/charge.erl", 22).

-file("inc/charge.hrl", 1).

-record(m_charge,
	{ver = 9, charge_list = [], first_gift = [],
	 triple_rebate_list = [], merge_count = 0,
	 merge_charge_list = [], day_gift = [], week_refresh = 0,
	 week_gift = [], month_refresh = 0, month_gift = [],
	 day_first_gift = {0, 0}, first_gift_ver = 0,
	 choose_first_gift_status = 0, reset_charge_list = [],
	 warehouse_charge_list = []}).

-record(charge_data,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(), val = 0  :: float(),
	 gold = 0  :: non_neg_integer(),
	 first_add = 0  :: non_neg_integer(),
	 add = 0  :: non_neg_integer(),
	 vip_exp = 0  :: non_neg_integer(),
	 pic = 0  :: non_neg_integer(), is_show = 0  :: 0..1,
	 is_iosverify = 1  :: 0..1,
	 type = 0  :: non_neg_integer(), items = []  :: list()}).

-record(triple_rebate_data,
	{id = 0  :: non_neg_integer(),
	 charge_sum = 0  :: bitstring(),
	 reward_times = 0  :: non_neg_integer(),
	 mail_title = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring()}).

-file("src/mod/charge/charge.erl", 23).

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

-file("src/mod/charge/charge.erl", 24).

-file("inc/log.hrl", 1).

-file("src/mod/charge/charge.erl", 25).

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

-file("src/mod/charge/charge.erl", 26).

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

-file("src/mod/charge/charge.erl", 27).

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

-file("src/mod/charge/charge.erl", 28).

-file("inc/holiday_return.hrl", 1).

-record(m_holiday_return_sign,
	{ver = 2, status_list = [], login_day = 0}).

-record(m_holiday_return,
	{ver = 3, period = 0, start_time = 0, end_time = 0,
	 is_buy = 0, exchange_day_list = [],
	 exchange_buy_list = [], return_discount_buy_list = [],
	 bind_code = 0, bind_end_time = 0,
	 bind_roleid = {0, <<>>}, reward_list = [],
	 old_data = [], bind_power = 0, bind_charge = 0,
	 partner_half = []}).

-record(m_holiday_return_feat,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 period = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(holiday_return_feat_data,
	{period = 0  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(), f_id = 0, s_id = 0,
	 ref_day = 0, progress = [], award = []}).

-file("src/mod/charge/charge.erl", 29).

-spec gm_pay(#role{}, pos_integer()) -> #role{}.

gm_pay(Role,
       Opt = #{money := Money, gold := Gold0,
	       package_id := PackageId}) ->
    CurrencyType = gm,
    Sn = <<"gm"/utf8>>,
    DataMod = charge_lib:data_mod(),
    {Gold, VipExp} = case DataMod:get(PackageId) of
		       #charge_data{gold = Gold1, vip_exp = VipExp0} ->
			   {Gold1, VipExp0};
		       _ when Gold0 > 0 -> {Gold0, Gold0};
		       _ ->
			   Gold1 = charge_lib:currency_to_gold(CurrencyType,
							       Money),
			   {Gold1, Gold1}
		     end,
    case role_gain:do(Role,
		      [#gain{label = gold_acc, val = Gold},
		       #gain{label = gold, val = Gold},
		       #gain{label = vip_exp, val = VipExp}])
	of
      {ok, Role1} ->
	  case Gold > 0 of
	    true ->
		notice:alert(color:msg(lang:get(<<"Việc nạp tiền thành công và bạn nhận "
						  "được~s~s"/utf8>>),
				       [{assets, gold}, {green, Gold}]));
	    _ -> skip
	  end,
	  log:log_assets(gold, Role, Role1, <<"nạp tiền"/utf8>>,
			 util:fbin("nạp tiền:money=~w,sn=~ts package=~w",
				   [Money, Sn, PackageId])),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge50, _, {__Levelcharge50, __Tracescharge50}}
		when __Levelcharge50 band 64 /= 0 orelse
		       __Tracescharge50 /= [] ->
		lager:do_log(info,
			     [{module, charge}, {function, gm_pay}, {line, 50},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]gm补订单，充值金额:~f 获得:~w package_id:~w",
					   [Role1#role.name, Money, Gold,
					    PackageId]),
			     none, 4096, 64, __Levelcharge50, __Tracescharge50,
			     lager_event, __Pidcharge50);
	    _ -> ok
	  end,
	  fire(Role1,
	       Opt#{gold := Gold, vip_exp => VipExp,
		    data_mod => DataMod, sn => Sn,
		    package_name => <<"gm补订单"/utf8>>, currency_type => gm,
		    flag => gm});
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge53, _, {__Levelcharge53, __Tracescharge53}}
		when __Levelcharge53 band 8 /= 0 orelse
		       __Tracescharge53 /= [] ->
		lager:do_log(error,
			     [{module, charge}, {function, gm_pay}, {line, 53},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("角色Id:~w, 名字:~w, gm补订单损益操作失败",
					   [Role#role.id, Role#role.name]),
			     none, 4096, 8, __Levelcharge53, __Tracescharge53,
			     lager_event, __Pidcharge53);
	    _ -> ok
	  end,
	  Role
    end.

gm_fire(Role,
	Opt = #{money := Money, gold := Gold, vip_exp := VipExp,
		package_id := PackageId}) ->
    FireList = [{vip, charge, []}, {month_fund, fire, []},
		{month_card, activate1, []},
		{month_card, activate2, []},
		{holiday_rule_charge, buy, []}, {star_gift, buy, []},
		{charge_misc, fire_loop_gift, []},
		{charge_misc, fire_day_gift, []}, {privilege, fire, []},
		{guild_mem_red_packet, fire, []},
		{charge_misc, fire_day_first_charge, []},
		{holiday_war_order, fire, []},
		{holiday_holy_eqm, buy, []},
		{holiday_return, return_discount, []},
		{holiday_return, fire_gift, []},
		{holiday_personal_gift, buy, []},
		{charge_misc, fire_9377_vip, []},
		{charge_misc, fire_week_gift, []},
		{charge_misc, skin_mall_buy, []},
		{arena_elite_war_order, fire, []},
		{holiday_fire_gift, buy, []},
		{holiday_personal_fire_gift, buy, []},
		{holiday_charge_rebate, fire, []},
		{planes_war_order, fire, []},
		{holiday_new_war_order, fire, []},
		{subscriber, fire, []}, {holiday_dime, fire, []},
		{personal_push_gift, buy, []},
		{holiday_new_week_card, fire, []}],
    {Role1, NOpt} = do_fire(FireList, Role, Opt),
    {ok, Role2} = acc_charge_num(Role1, NOpt),
    Role3 = return_charge(Role2, NOpt),
    Role4 = role_trigger:fire([#evt_pay{gold = Gold,
					info = NOpt},
			       #evt_pay_acc{gold = Gold},
			       #evt_charge_acc{gold = VipExp}],
			      Role3),
    Role5 = day_goals:do_ref2(Role4, charge, VipExp,
			      PackageId),
    Role6 = var:set_charge_count(Role5, VipExp),
    Role7 =
	holiday_return_new:return_first_charge_log(Role6, NOpt),
    {ok, Role8} = holiday_lucky_dog_lib:fire(Role7,
					     charge_rmb, Money),
    NRole = Role8,
    NewRole = case Money >= 1 of
		true -> var:add_var(NRole, day, 27, 1, 0);
		_ -> NRole
	      end,
    do_push_info(NewRole, Opt),
    NewRole.

init() -> #m_charge{}.

ready(Role) ->
    Var = var:get_var(Role, day, 27, 0),
    role:pack_send(Role, 21002, {Var}),
    ok.

zero_flush(Role) ->
    Var = var:get_var(Role, day, 27, 0),
    role:pack_send(Role, 21002, {Var}),
    ok.

-spec login(#role{}) -> ok | {ok, #role{}}.

login(Role = #role{id = {Rid, SrvId}, pid = RolePid,
		   account = _Account}) ->
    case ets:match_object(charge_sn, {'_', Rid, SrvId}) of
      L = [_ | _] ->
	  [role:apply(async, RolePid, {charge, pay, [Sn, login]})
	   || {Sn, _, _} <- L];
      _ -> skip
    end,
    charge_misc:handle(Role).

-spec cli_info(#role{}) -> tuple().

cli_info(#role{platform = <<"verifyios">>}) ->
    DataMod = charge_lib:data_mod(),
    Fun = fun (Id) ->
		  case DataMod:get(Id) of
		    #charge_data{val = Rmb, name = Name, gold = GetGold,
				 pic = Pic, is_iosverify = 1} ->
			{true,
			 {Id, Name, round(Rmb * 100), GetGold, 0, 0, Pic}};
		    _ -> false
		  end
	  end,
    L = lists:filtermap(Fun, DataMod:list()),
    {L};
cli_info(_Role = #role{m_charge =
			   #m_charge{charge_list = ChargeList}}) ->
    DataMod = charge_lib:data_mod(),
    Fun = fun (Id) ->
		  case DataMod:get(Id) of
		    #charge_data{val = Rmb, name = Name, gold = GetGold,
				 first_add = FirstGold, add = AddGold0,
				 pic = Pic, is_show = 1} ->
			IsFirst1 = case FirstGold > 0 andalso
					  not lists:keymember(Id, 1, ChargeList)
				       of
				     true -> 1;
				     _ -> 0
				   end,
			AddGold = case IsFirst1 of
				    1 -> FirstGold;
				    _ -> AddGold0
				  end,
			{true,
			 {Id, Name, round(Rmb * 100), GetGold, AddGold,
			  IsFirst1, Pic}};
		    _ -> false
		  end
	  end,
    L = lists:filtermap(Fun, DataMod:list()),
    {L}.

-spec notice(pos_integer(), bitstring(),
	     bitstring()) -> ok | offline.

notice(Rid, SrvId, Sn) ->
    ets:insert(charge_sn, {Sn, Rid, SrvId}),
    case role_query:pid(by_id, {Rid, SrvId}) of
      {ok, Pid} ->
	  role:apply(async, Pid, {charge, pay, [Sn, notice]}), ok;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge186, _,
	     {__Levelcharge186, __Tracescharge186}}
		when __Levelcharge186 band 64 /= 0 orelse
		       __Tracescharge186 /= [] ->
		lager:do_log(info,
			     [{module, charge}, {function, notice}, {line, 186},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~w:~s]不在线，订单在上线时处理:~s",
					   [Rid, SrvId, Sn]),
			     none, 4096, 64, __Levelcharge186,
			     __Tracescharge186, lager_event, __Pidcharge186);
	    _ -> ok
	  end,
	  offline
    end.

-spec pay(#role{}, Sn :: bitstring(), atom()) -> {sync,
						  #role{}} |
						 ok.

pay(Role = #role{account = Account, id = {Rid, SrvId}},
    Sn, Flag) ->
    case
      db:get_row("select status, rid, srv_id, money, gold, "
		 "package_id, package_name, currency_type, "
		 "channel, pay_channel, category from "
		 "mod_charge where sn = ?",
		 [Sn])
	of
      {ok,
       [0, Rid, SrvId, Money, Gold, PackageId, PackageName,
	CurrencyType, Channel, PayChannel, Category]} ->
	  ets:delete(charge_sn_fail, Sn),
	  NewMoney = util:if_true(PackageId =:= 1705,
				  float(util:uround(Money)), Money),
	  {sync,
	   do_deal_charge(Role,
			  #{sn => Sn, money => NewMoney, gold => Gold,
			    package_id => PackageId,
			    package_name => PackageName,
			    currency_type => CurrencyType, channel => Channel,
			    pay_channel => PayChannel, category => Category,
			    flag => Flag, db_money => Money})};
      {ok, [1, Rid, SrvId | _]} ->
	  ets:delete(charge_sn, Sn),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge200, _,
	     {__Levelcharge200, __Tracescharge200}}
		when __Levelcharge200 band 8 /= 0 orelse
		       __Tracescharge200 /= [] ->
		lager:do_log(error,
			     [{module, charge}, {function, pay}, {line, 200},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]无法处理订单[~ts],订单已处理",
					   [Role#role.name, Sn]),
			     none, 4096, 8, __Levelcharge200, __Tracescharge200,
			     lager_event, __Pidcharge200);
	    _ -> ok
	  end,
	  ok;
      {ok, R} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge203, _,
	     {__Levelcharge203, __Tracescharge203}}
		when __Levelcharge203 band 8 /= 0 orelse
		       __Tracescharge203 /= [] ->
		lager:do_log(error,
			     [{module, charge}, {function, pay}, {line, 203},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]无法处理订单[~ts],订单信息异常:~w",
					   [Role#role.name, Sn, R]),
			     none, 4096, 8, __Levelcharge203, __Tracescharge203,
			     lager_event, __Pidcharge203);
	    _ -> ok
	  end,
	  ok;
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge206, _,
	     {__Levelcharge206, __Tracescharge206}}
		when __Levelcharge206 band 8 /= 0 orelse
		       __Tracescharge206 /= [] ->
		lager:do_log(error,
			     [{module, charge}, {function, pay}, {line, 206},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]处理订单[~ts]时发生异常:~w",
					   [Role#role.name, Sn, _Err]),
			     none, 4096, 8, __Levelcharge206, __Tracescharge206,
			     lager_event, __Pidcharge206);
	    _ -> ok
	  end,
	  ok
    end.

do_deal_charge(Role = #role{lev = Lev,
			    reg_time = RegTime, platform = <<"verifyios">>},
	       Opt = #{sn := Sn, money := Money, gold := Gold0,
		       package_id := PackageId, package_name := PackageName,
		       flag := Flag}) ->
    Now = date:unixtime(),
    DataMod = charge_lib:data_mod(),
    #charge_data{items = Items, vip_exp = VipExp,
		 gold = Gold1} =
	DataMod:get(PackageId),
    case
      db:execute("update mod_charge set status = 1, lev=?, "
		 "reg_time=?, time_deal = ? where sn =?",
		 [Lev, RegTime, Now, Sn])
	of
      {ok, _} ->
	  Gold = max(Gold0, Gold1),
	  GL0 = format:val_to_gain(Items, charge),
	  GL = [#gain{label = gold_acc, val = Gold},
		#gain{label = vip_exp, val = VipExp}
		| GL0],
	  case role_gain:do(Role, GL) of
	    {ok, Role1} ->
		ets:delete(charge_sn, Sn),
		notice:alert(format:gain_text(GL0, Role1)),
		log:log_assets(gold, Role, Role1, <<"充值"/utf8>>,
			       util:fbin("充值:money=~w,sn=~ts package=~w:~ts",
					 [Money, Sn, PackageId, PackageName])),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcharge230, _,
		   {__Levelcharge230, __Tracescharge230}}
		      when __Levelcharge230 band 64 /= 0 orelse
			     __Tracescharge230 /= [] ->
		      lager:do_log(info,
				   [{module, charge},
				    {function, do_deal_charge}, {line, 230},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("角色[~ts]订单:~s 充值:~f 获得:~w package_id:~w:~ts "
						 "Flag:~w",
						 [Role1#role.name, Sn, Money,
						  Gold, PackageId, PackageName,
						  Flag]),
				   none, 4096, 64, __Levelcharge230,
				   __Tracescharge230, lager_event,
				   __Pidcharge230);
		  _ -> ok
		end,
		fire(Role1,
		     Opt#{gold := Gold, vip_exp => VipExp,
			  data_mod => DataMod});
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcharge233, _,
		   {__Levelcharge233, __Tracescharge233}}
		      when __Levelcharge233 band 8 /= 0 orelse
			     __Tracescharge233 /= [] ->
		      lager:do_log(error,
				   [{module, charge},
				    {function, do_deal_charge}, {line, 233},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("角色Id:~w, 名字:~w, 损益操作失败",
						 [Role#role.id,
						  Role#role.name]),
				   none, 4096, 8, __Levelcharge233,
				   __Tracescharge233, lager_event,
				   __Pidcharge233);
		  _ -> ok
		end,
		Role
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
	    {__Pidcharge237, _,
	     {__Levelcharge237, __Tracescharge237}}
		when __Levelcharge237 band 8 /= 0 orelse
		       __Tracescharge237 /= [] ->
		lager:do_log(error,
			     [{module, charge}, {function, do_deal_charge},
			      {line, 237}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]处理订单[~s]时失败了;~w",
					   [Role#role.name, Sn, _Err]),
			     none, 4096, 8, __Levelcharge237, __Tracescharge237,
			     lager_event, __Pidcharge237);
	    _ -> ok
	  end,
	  Role
    end;
do_deal_charge(Role = #role{lev = Lev,
			    reg_time = RegTime},
	       Opt = #{sn := Sn, money := Money, gold := Gold0,
		       package_id := PackageId, package_name := PackageName,
		       currency_type := CurrencyType, flag := Flag}) ->
    Now = date:unixtime(),
    DataMod = charge_lib:data_mod(),
    {Gold, VipExp} = case DataMod:get(PackageId) of
		       #charge_data{gold = Gold1, vip_exp = VipExp0} ->
			   {Gold1, VipExp0};
		       _ when Gold0 > 0 -> {Gold0, Gold0};
		       _ ->
			   Gold1 = charge_lib:currency_to_gold(CurrencyType,
							       Money),
			   {Gold1, Gold1}
		     end,
    case
      db:execute("update mod_charge set status = 1, gold=?, "
		 "lev=?, reg_time=?, time_deal = ? where "
		 "sn =?",
		 [Gold, Lev, RegTime, Now, Sn])
	of
      {ok, _} ->
	  ets:delete(charge_sn, Sn),
	  case role_gain:do(Role,
			    [#gain{label = gold_acc, val = Gold},
			     #gain{label = gold, val = Gold},
			     #gain{label = vip_exp, val = VipExp}])
	      of
	    {ok, Role1} ->
		case Gold > 0 of
		  true ->
		      notice:alert(color:msg(lang:get(<<"Việc nạp tiền thành công và bạn nhận "
							"được~s~s"/utf8>>),
					     [{assets, gold}, {green, Gold}]));
		  _ -> skip
		end,
		log:log_assets(gold, Role, Role1, <<"充值"/utf8>>,
			       util:fbin("充值:money=~w,sn=~ts package=~w:~ts",
					 [Money, Sn, PackageId, PackageName])),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcharge260, _,
		   {__Levelcharge260, __Tracescharge260}}
		      when __Levelcharge260 band 64 /= 0 orelse
			     __Tracescharge260 /= [] ->
		      lager:do_log(info,
				   [{module, charge},
				    {function, do_deal_charge}, {line, 260},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("角色[~ts]订单:~s 充值:~f 获得:~w package_id:~w:~ts "
						 "Flag:~w",
						 [Role1#role.name, Sn, Money,
						  Gold, PackageId, PackageName,
						  Flag]),
				   none, 4096, 64, __Levelcharge260,
				   __Tracescharge260, lager_event,
				   __Pidcharge260);
		  _ -> ok
		end,
		fire(Role1,
		     Opt#{gold := Gold, vip_exp => VipExp,
			  data_mod => DataMod});
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcharge263, _,
		   {__Levelcharge263, __Tracescharge263}}
		      when __Levelcharge263 band 8 /= 0 orelse
			     __Tracescharge263 /= [] ->
		      lager:do_log(error,
				   [{module, charge},
				    {function, do_deal_charge}, {line, 263},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("角色Id:~w, 名字:~w, 损益操作失败",
						 [Role#role.id,
						  Role#role.name]),
				   none, 4096, 8, __Levelcharge263,
				   __Tracescharge263, lager_event,
				   __Pidcharge263);
		  _ -> ok
		end,
		Role
	  end;
      _Err = {error,
	      {'EXIT',
	       {{failed_to_recv_packet_header, timeout}, _}}} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge267, _,
	     {__Levelcharge267, __Tracescharge267}}
		when __Levelcharge267 band 8 /= 0 orelse
		       __Tracescharge267 /= [] ->
		lager:do_log(error,
			     [{module, charge}, {function, do_deal_charge},
			      {line, 267}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]处理订单[~s]时失败了deal_time=~w; ~w",
					   [Role#role.name, Sn, Now, _Err]),
			     none, 4096, 8, __Levelcharge267, __Tracescharge267,
			     lager_event, __Pidcharge267);
	    _ -> ok
	  end,
	  charge_mgr:info({delay_check, Sn, Now}),
	  server_monitor:error(4),
	  server_monitor:error_log({2, <<"充值处理失败"/utf8>>,
				    util:fbin(<<"角色[~w:~ts]充值处理失败，需上线查看服务器状态"/utf8>>,
					      [Role#role.id, Role#role.name]),
				    charge, 270, _Err}),
	  Role;
      _Err = {error, {'EXIT', {mysql_timeout, _, {}}}} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge273, _,
	     {__Levelcharge273, __Tracescharge273}}
		when __Levelcharge273 band 8 /= 0 orelse
		       __Tracescharge273 /= [] ->
		lager:do_log(error,
			     [{module, charge}, {function, do_deal_charge},
			      {line, 273}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]处理订单[~s]时失败了deal_time=~w; ~w",
					   [Role#role.name, Sn, Now, _Err]),
			     none, 4096, 8, __Levelcharge273, __Tracescharge273,
			     lager_event, __Pidcharge273);
	    _ -> ok
	  end,
	  charge_mgr:info({delay_check, Sn, Now}),
	  server_monitor:error(4),
	  server_monitor:error_log({2, <<"充值处理失败"/utf8>>,
				    util:fbin(<<"角色[~w:~ts]充值处理失败，需上线查看服务器状态"/utf8>>,
					      [Role#role.id, Role#role.name]),
				    charge, 276, _Err}),
	  Role;
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge279, _,
	     {__Levelcharge279, __Tracescharge279}}
		when __Levelcharge279 band 8 /= 0 orelse
		       __Tracescharge279 /= [] ->
		lager:do_log(error,
			     [{module, charge}, {function, do_deal_charge},
			      {line, 279}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]处理订单[~s]时失败了;~w",
					   [Role#role.name, Sn, _Err]),
			     none, 4096, 8, __Levelcharge279, __Tracescharge279,
			     lager_event, __Pidcharge279);
	    _ -> ok
	  end,
	  charge_mgr:info({delay_check, Sn, Now}),
	  server_monitor:error(4),
	  server_monitor:error_log({2, <<"充值处理失败"/utf8>>,
				    util:fbin(<<"角色[~w:~ts]充值处理失败，需马上上线查看处理"/utf8>>,
					      [Role#role.id, Role#role.name]),
				    charge, 282, _Err}),
	  Role
    end.

fire(Role = #role{assets = #assets{gold = OldGold},
		  platform = <<"verifyios">>},
     Opt = #{gold := Gold}) ->
    FireList = [{vip, charge, []}],
    {Role1, NOpt} = do_fire(FireList, Role, Opt),
    Role2 = role_trigger:fire(#evt_pay{gold = Gold,
				       info = NOpt},
			      Role1),
    NRole = #role{assets = #assets{gold = NewGold}} = Role2,
    NewRole = var:add_var(NRole, day, 27, 1, 0),
    do_push_info(NewRole, Opt),
    log:save(pay,
	     {NewRole, NOpt#{gold := Gold + NewGold - OldGold}}),
    NewRole;
fire(Role = #role{assets = #assets{gold = OldGold}},
     Opt = #{money := Money, gold := Gold, vip_exp := VipExp,
	     package_id := PackageId}) ->
    FireList = [{vip, charge, []}, {month_fund, fire, []},
		{month_card, activate1, []},
		{month_card, activate2, []},
		{holiday_rule_charge, buy, []}, {star_gift, buy, []},
		{charge_misc, fire_loop_gift, []},
		{charge_misc, fire_day_gift, []}, {privilege, fire, []},
		{guild_mem_red_packet, fire, []},
		{charge_misc, fire_day_first_charge, []},
		{holiday_war_order, fire, []},
		{holiday_holy_eqm, buy, []},
		{holiday_return, return_discount, []},
		{holiday_return, fire_gift, []},
		{holiday_personal_gift, buy, []},
		{charge_misc, fire_9377_vip, []},
		{charge_misc, fire_week_gift, []},
		{charge_misc, skin_mall_buy, []},
		{arena_elite_war_order, fire, []},
		{holiday_fire_gift, buy, []},
		{holiday_personal_fire_gift, buy, []},
		{holiday_charge_rebate, fire, []},
		{planes_war_order, fire, []},
		{holiday_new_war_order, fire, []},
		{subscriber, fire, []}, {holiday_dime, fire, []},
		{personal_push_gift, buy, []},
		{holiday_new_week_card, fire, []}],
    {Role1, NOpt} = do_fire(FireList, Role, Opt),
    {ok, Role2} = acc_charge_num(Role1, NOpt),
    Role3 = return_charge(Role2, NOpt),
    Role4 = role_trigger:fire([#evt_pay{gold = Gold,
					info = NOpt},
			       #evt_pay_acc{gold = Gold},
			       #evt_charge_acc{gold = VipExp}],
			      Role3),
    Role5 = day_goals:do_ref2(Role4, charge, VipExp,
			      PackageId),
    Role6 = var:set_charge_count(Role5, VipExp),
    Role7 =
	holiday_return_new:return_first_charge_log(Role6, NOpt),
    {ok, Role8} = holiday_lucky_dog_lib:fire(Role7,
					     charge_rmb, Money),
    NRole = #role{assets = #assets{gold = NewGold}} = Role8,
    NewRole = case Money >= 1 of
		true -> var:add_var(NRole, day, 27, 1, 0);
		_ -> NRole
	      end,
    log:save(pay,
	     {NewRole, NOpt#{gold := Gold + NewGold - OldGold}}),
    do_push_info(NewRole, Opt),
    NewRole.

do_fire([], Role, Opt) -> {Role, Opt};
do_fire([{Mod, Fun, Args} | T], Role, Opt) ->
    case apply(Mod, Fun, [Role, Opt | Args]) of
      ok -> do_fire(T, Role, Opt);
      {ok, NRole = #role{}} -> do_fire(T, NRole, Opt);
      {ok, NRole = #role{}, NewOpt} ->
	  do_fire(T, NRole, NewOpt);
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcharge359, _,
	     {__Levelcharge359, __Tracescharge359}}
		when __Levelcharge359 band 8 /= 0 orelse
		       __Tracescharge359 /= [] ->
		lager:do_log(error,
			     [{module, charge}, {function, do_fire},
			      {line, 359}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[~ts]调用方法~w:~w 出错:~w",
					   [Role#role.name, Mod, Fun, _Err]),
			     none, 4096, 8, __Levelcharge359, __Tracescharge359,
			     lager_event, __Pidcharge359);
	    _ -> ok
	  end,
	  do_fire(T, Role, Opt)
    end.

acc_charge_num(Role = #role{m_charge =
				MCharge = #m_charge{charge_list = ChargeList,
						    warehouse_charge_list =
							WareHouseChargeList}},
	       #{gold := Gold, package_id := PackageId, money := Money,
		 flag := Flag, data_mod := DataMod}) ->
    NewWareHouseChargeList = [{date:unixtime(), PackageId,
			       util:round(Money)}
			      | WareHouseChargeList],
    {AddGold, NRole} = case DataMod:get(PackageId) of
			 #charge_data{first_add = FirstGold, add = AddGold0} ->
			     case lists:keyfind(PackageId, 1, ChargeList) of
			       false ->
				   NewChargeList = [{PackageId, 1}
						    | ChargeList],
				   RtnRole = Role#role{m_charge =
							   MCharge#m_charge{charge_list
										=
										NewChargeList,
									    warehouse_charge_list
										=
										NewWareHouseChargeList}},
				   {FirstGold, RtnRole};
			       {_, N} ->
				   NewChargeList = lists:keyreplace(PackageId,
								    1,
								    ChargeList,
								    {PackageId,
								     N + 1}),
				   RtnRole = Role#role{m_charge =
							   MCharge#m_charge{charge_list
										=
										NewChargeList,
									    warehouse_charge_list
										=
										NewWareHouseChargeList}},
				   {AddGold0, RtnRole}
			     end;
			 _ -> {0, Role}
		       end,
    case AddGold > 0 of
      true ->
	  mail:send(Role,
		    {lang:get(<<"Giảm giá nạp tiền"/utf8>>),
		     util:fbin(lang:get(<<"Chúc mừng bạn đã nạp tiền thành công "
					  "và nhận được ~w kim cương. Và được giảm "
					  "giá nạp thêm ~ kim cương. \nMong bạn "
					  "tiếp tục chăm chỉ trong game và ở một "
					  "mìnhĐi đầu！"/utf8>>),
			       [Gold, AddGold]),
		     [{gold, AddGold}], [],
		     lang:get(<<"Giảm giá nạp tiền"/utf8>>)});
      _ -> skip
    end,
    {ok, NRole}.

return_charge(Role = #role{m_holiday_return =
			       MHolidayReturn = #m_holiday_return{bind_code =
								      BindCode,
								  bind_charge =
								      BindCharge}},
	      #{money := Money}) ->
    case BindCode > 0 of
      true ->
	  NewMoney = util:round(Money),
	  NRole = Role#role{m_holiday_return =
				MHolidayReturn#m_holiday_return{bind_charge =
								    BindCharge +
								      NewMoney}},
	  invite_code_return:sync_info(NRole),
	  NRole;
      _ -> Role
    end.

do_push_info(_Role, #{flag := login}) -> pass;
do_push_info(Role, _Opt) ->
    ready(Role),
    role:pack_send(Role, 21005,
		   charge_misc:info_triple_rebate(Role)),
    checkin:push(Role),
    role_lib:push_assets(Role),
    role_lib:push_base_info(Role),
    role:redirect(Role, 16700, {}),
    partner:push_partner_bag(Role),
    ok.


