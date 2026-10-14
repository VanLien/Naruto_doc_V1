-file("src/mod/item/package.erl", 1).

-module(package).

-lager_records([{role_var, [id, vars]},
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
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{link, [socket, conn_pid, ip, port, lag]},
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
		{package,
		 [type, next_id, volume, open_times, free_cell, items]},
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

-export([init/1, login/1, free/1, del/3, find/3,
	 count/3, find_bind_unbind/2, fetch/3, fresh_item/4,
	 fresh_eqm/3, replace_item/4, check_pos/4,
	 push_item_info/3, push_gain/2, overlap/4,
	 overlap_not_push/4, add_auto_overlap/2, add_volume/2,
	 push_package_volume/2, gm_do_ref_bag/0]).

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

-file("src/mod/item/package.erl", 33).

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

-file("src/mod/item/package.erl", 34).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("src/mod/item/package.erl", 35).

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

-file("src/mod/item/package.erl", 36).

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

-file("src/mod/item/package.erl", 37).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/mod/item/package.erl", 38).

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

-file("src/mod/item/package.erl", 39).

-file("inc/log.hrl", 1).

-file("src/mod/item/package.erl", 40).

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

-file("src/mod/item/package.erl", 41).

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

-file("src/mod/item/package.erl", 42).

-spec gm_do_ref_bag() -> ok.

gm_do_ref_bag() ->
    role_group:apply(world, {package, login, []}).

-spec init(Atom) -> #package{} when Atom :: bag |
					    store | eqm | pet.

init(bag) ->
    #package{type = 1,
	     volume = package_data:get_const(bag_vol_def),
	     free_cell =
		 lists:seq(1, package_data:get_const(bag_vol_def))};
init(eqm) ->
    #package{type = 3,
	     volume = package_data:get_const(partner_eqm_vol_def),
	     free_cell =
		 lists:seq(1,
			   package_data:get_const(partner_eqm_vol_def))};
init(pet) ->
    #package{type = 5,
	     volume = package_data:get_const(bag_vol_def),
	     free_cell =
		 lists:seq(1, package_data:get_const(bag_vol_def))};
init(home) ->
    #package{type = 4,
	     volume = package_data:get_const(bag_vol_def),
	     free_cell =
		 lists:seq(1, package_data:get_const(bag_vol_def))}.

-spec login(#role{}) -> {ok, #role{}} | ok.

login(Role = #role{p_bag =
		       Bag = #package{volume = Volume, free_cell = FreeCell},
		   p_eqm =
		       EqmBag = #package{volume = EmqVolume,
					 free_cell = EqmFreeCell,
					 open_times = OpenTimes},
		   pet_bag = PetBag = #package{volume = PetVolume}}) ->
    DefVolume = package_data:get_const(bag_vol_def),
    Role1 = case DefVolume > Volume of
	      true ->
		  Role#role{p_bag =
				Bag#package{volume = DefVolume,
					    free_cell =
						FreeCell ++
						  lists:seq(Volume + 1,
							    DefVolume)}};
	      _ -> Role
	    end,
    NPetVolume = package_data:get_const(bag_vol_def),
    Role2 = case NPetVolume > PetVolume of
	      true ->
		  NRoleT = Role1#role{pet_bag =
					  PetBag#package{volume = NPetVolume,
							 free_cell =
							     FreeCell ++
							       lists:seq(PetVolume
									   + 1,
									 NPetVolume)}},
		  package:push_package_volume(NRoleT, 5),
		  NRoleT;
	      _ -> Role1
	    end,
    NewEmqVolume =
	min(package_data:get_const(partner_eqm_vol_def) +
	      OpenTimes *
		package_data:get_const(eqm_bag_vol_open_def),
	    package_data:get_const(eqm_bag_vol_max)),
    case NewEmqVolume > EmqVolume of
      true ->
	  NewRole = Role2#role{p_eqm =
				   EqmBag#package{volume = NewEmqVolume,
						  free_cell =
						      EqmFreeCell ++
							lists:seq(EmqVolume + 1,
								  NewEmqVolume)}},
	  package:push_package_volume(NewRole, 3),
	  {ok, NewRole};
      _ -> {ok, Role2}
    end.

-spec free(#package{}) -> non_neg_integer().

free(#package{free_cell = Cell}) -> length(Cell).

-spec overlap(Package, BaseId, Bind, Num) -> {false,
					      bitstring()} |
					     full |
					     {ok, NewPackage, AddItems,
					      RefItems} when Package ::
								 #package{},
							     BaseId ::
								 pos_integer(),
							     Bind :: 0..1,
							     Num ::
								 pos_integer(),
							     NewPackage ::
								 #package{},
							     AddItems ::
								 [#item{}],
							     RefItems ::
								 [#item{}].

overlap(Package, ItemBaseId, Bind, Num) ->
    MakeArgs = #item_make_args{base_id = ItemBaseId,
			       bind = Bind, quantity = Num},
    overlap(Package, MakeArgs).

overlap(Package = #package{type = Type},
	MakeArgs = #item_make_args{}) ->
    case overlap_not_push(Package, MakeArgs, []) of
      {ok, NewPackage, AddItems, RefItems} ->
	  package:push_item_info(add, get('@conn_pid'),
				 [{Type, AddItems}]),
	  package:push_item_info(update, get('@conn_pid'),
				 [{Type, RefItems}]),
	  {ok, NewPackage, AddItems, RefItems};
      Ret -> Ret
    end.

-spec overlap_not_push(Package, BaseId, Bind,
		       Num) -> {false, bitstring()} | full |
			       {ok, NewPackage, AddItems,
				RefItems} when Package :: #package{},
					       BaseId :: pos_integer(),
					       Bind :: 0..1,
					       Num :: pos_integer(),
					       NewPackage :: #package{},
					       AddItems :: [#item{}],
					       RefItems :: [#item{}].

overlap_not_push(Package, ItemBaseId, Bind, Num) ->
    MakeArgs = #item_make_args{base_id = ItemBaseId,
			       bind = Bind, quantity = Num,
			       flag =
				   util:get(role_item_make_flag,
					    default_iflag)},
    overlap_not_push(Package, MakeArgs, []).

overlap_not_push(Package, Items) ->
    overlap_not_push(Package, Items, []).

overlap_not_push(Package,
		 MakeArgs = #item{base_id = ItemBaseId, quantity = Num,
				  bind = Bind},
		 RefItems) ->
    case item_data:get(ItemBaseId) of
      #item_base{overlap = Overlap} when Overlap > 1 ->
	  overlap_not_push(Package,
			   #item_make_args{base_id = ItemBaseId, quantity = Num,
					   bind = Bind});
      #item_base{overlap = 1} ->
	  case do_add_no_push_base_id(Package, [MakeArgs], []) of
	    {ok, NewPackage, AddItems} ->
		{ok, NewPackage, AddItems, RefItems};
	    Ret -> Ret
	  end;
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidpackage138, _,
	     {__Levelpackage138, __Tracespackage138}}
		when __Levelpackage138 band 8 /= 0 orelse
		       __Tracespackage138 /= [] ->
		lager:do_log(error,
			     [{module, package}, {function, overlap_not_push},
			      {line, 138}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("未知的堆叠物品[item_base_id:~w][Err:~w]",
					   [ItemBaseId, Err]),
			     none, 4096, 8, __Levelpackage138,
			     __Tracespackage138, lager_event, __Pidpackage138);
	    _ -> ok
	  end,
	  {false, lang:get(<<"无法进行堆叠"/utf8>>)}
    end;
overlap_not_push(Package = #package{items = Items},
		 MakeArgs0 = #item_make_args{base_id = ItemBaseId,
					     quantity = Num},
		 RefItems)
    when Num >= 1 ->
    MakeArgs = MakeArgs0#item_make_args{bind = 1},
    case item_data:get(ItemBaseId) of
      ItemData = #item_base{overlap = Overlap}
	  when Overlap > 1 ->
	  case get_overlap_item(Items, ItemData, MakeArgs) of
	    MinPosItem = #item{id = Id, quantity = Q}
		when Q + Num > Overlap ->
		OverlapItem = MinPosItem#item{quantity = Overlap},
		NewItems = lists:keyreplace(Id, #item.id, Items,
					    OverlapItem),
		put(role_gain_items,
		    [MinPosItem#item{quantity = Num}
		     | get(role_gain_items)]),
		overlap_not_push(Package#package{items = NewItems},
				 MakeArgs#item_make_args{quantity =
							     Num + Q - Overlap},
				 [OverlapItem | RefItems]);
	    MinPosItem = #item{id = Id, quantity = Q} ->
		OverlapItem = MinPosItem#item{quantity = Q + Num},
		NewItems = lists:keyreplace(Id, #item.id, Items,
					    OverlapItem),
		put(role_gain_items,
		    [MinPosItem#item{quantity = Num}
		     | get(role_gain_items)]),
		{ok, Package#package{items = NewItems}, [],
		 [OverlapItem | RefItems]};
	    _ ->
		case do_add_no_push_base_id(Package, [MakeArgs], []) of
		  {ok, NewPackage, AddItems} ->
		      {ok, NewPackage, AddItems, RefItems};
		  Ret -> Ret
		end
	  end;
      #item_base{overlap = 1} ->
	  case do_add_no_push_base_id(Package, [MakeArgs], []) of
	    {ok, NewPackage, AddItems} ->
		{ok, NewPackage, AddItems, RefItems};
	    Ret -> Ret
	  end;
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidpackage170, _,
	     {__Levelpackage170, __Tracespackage170}}
		when __Levelpackage170 band 8 /= 0 orelse
		       __Tracespackage170 /= [] ->
		lager:do_log(error,
			     [{module, package}, {function, overlap_not_push},
			      {line, 170}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("未知的堆叠物品[item_base_id:~w][Err:~w]",
					   [ItemBaseId, Err]),
			     none, 4096, 8, __Levelpackage170,
			     __Tracespackage170, lager_event, __Pidpackage170);
	    _ -> ok
	  end,
	  {false, lang:get(<<"无法进行堆叠"/utf8>>)}
    end.

get_overlap_item(Items, ItemData, PackArgs) ->
    get_overlap_item(Items, ItemData, PackArgs, 0).

get_overlap_item([], _ItemData, _MakeArgs, 0) -> false;
get_overlap_item([], _ItemData, _MakeArgs,
		 MinPosItem) ->
    MinPosItem;
get_overlap_item([#item{step = OldStep} | T], ItemData,
		 MakeArgs = #item_make_args{step = Step}, MinPosItem)
    when Step =/= OldStep ->
    get_overlap_item(T, ItemData, MakeArgs, MinPosItem);
get_overlap_item([Item = #item{base_id = ItemBaseId,
			       bind = Bind, quantity = Q}
		  | T],
		 ItemBase = #item_base{overlap = Overlap},
		 MakeArgs = #item_make_args{base_id = ItemBaseId,
					    bind = Bind},
		 0)
    when Q < Overlap ->
    get_overlap_item(T, ItemBase, MakeArgs, Item);
get_overlap_item([Item = #item{pos = Pos1,
			       base_id = ItemBaseId, bind = Bind, quantity = Q}
		  | T],
		 ItemBase = #item_base{overlap = Overlap},
		 MakeArgs = #item_make_args{base_id = ItemBaseId,
					    bind = Bind},
		 #item{pos = Pos2})
    when Q < Overlap andalso Pos1 < Pos2 ->
    get_overlap_item(T, ItemBase, MakeArgs, Item);
get_overlap_item([_ | T], ItemBase, MakeArgs,
		 MinPosItem) ->
    get_overlap_item(T, ItemBase, MakeArgs, MinPosItem).

-spec add_auto_overlap([tuple()], #package{}) -> {ok,
						  #package{}, RefL :: list(),
						  AddL :: list()} |
						 false | false.

add_auto_overlap(ItemInfo, Package) ->
    do_add_auto_overlap(ItemInfo, Package, [], []).

do_add_auto_overlap([], Package, RefL, AddL) ->
    {ok, Package, RefL, AddL};
do_add_auto_overlap([{BaseId, Bind, Num} | T], Package,
		    RefL, AddL) ->
    case overlap_not_push(Package, BaseId, Bind, Num) of
      {ok, NewPackage, AddItems, RefItems} ->
	  do_add_auto_overlap(T, NewPackage, RefItems ++ RefL,
			      AddItems ++ AddL);
      Ret -> Ret
    end;
do_add_auto_overlap([I = #item{} | T], Package, RefL,
		    AddL) ->
    case overlap_not_push(Package, I) of
      {ok, NewPackage, AddItems, RefItems} ->
	  do_add_auto_overlap(T, NewPackage, RefItems ++ RefL,
			      AddItems ++ AddL);
      Ret -> Ret
    end;
do_add_auto_overlap([H = #item_make_args{} | T],
		    Package, RefL, AddL) ->
    case overlap_not_push(Package, H, []) of
      {ok, NewPackage, AddItems, RefItems} ->
	  do_add_auto_overlap(T, NewPackage, RefItems ++ RefL,
			      AddItems ++ AddL);
      Ret -> Ret
    end.

-spec del(Flag, #package{}, ItemInfo) -> {false,
					  bitstring(), tuple()} |
					 {ok, #package{}, DelList, FreshList} |
					 {ok, #package{}, DelList} when Flag ::
									    by_id |
									    by_base_id,
									ItemInfo ::
									    [{ItemId,
									      non_neg_integer()}] |
									    [{ItemBaseId,
									      non_neg_integer()}],
									ItemId ::
									    non_neg_integer(),
									ItemBaseId ::
									    non_neg_integer(),
									DelList ::
									    [#item{}],
									FreshList ::
									    [#item{}].

del(by_id, Package, ItemInfo) ->
    del_by_id(Package, ItemInfo);
del(by_base_id, Package, ItemInfo) ->
    del_by_base_id(Package, ItemInfo);
del(by_base_id_all, Package, ItemInfo) ->
    del_all_by_base_id(Package, ItemInfo).

-spec fetch(Pack, pos_integer(), #role{}) -> {ok,
					      #item{}} |
					     false when Pack :: 1 | 2 | 3 | 5 |
								4.

fetch(1, Id, #role{p_bag = #package{items = Items}}) ->
    case lists:keyfind(Id, #item.id, Items) of
      Item = #item{id = Id} -> {ok, Item};
      false -> false
    end;
fetch(3, Id, #role{p_eqm = #package{items = Items}}) ->
    case lists:keyfind(Id, #item.id, Items) of
      Item = #item{id = Id} -> {ok, Item};
      false -> false
    end;
fetch(5, Id,
      #role{pet_bag = #package{items = Items}}) ->
    case lists:keyfind(Id, #item.id, Items) of
      Item = #item{id = Id} -> {ok, Item};
      false -> false
    end;
fetch(4, Id, #role{p_home = #package{items = Items}}) ->
    case lists:keyfind(Id, #item.id, Items) of
      Item = #item{id = Id} -> {ok, Item};
      false -> false
    end;
fetch(_, _, _) -> false.

-spec find(Mode, integer(), #package{}) -> false |
					   {ok, #item{}} when Mode :: by_id |
								      by_type |
								      by_pos.

find(by_id, Id, #package{items = Items}) ->
    case lists:keyfind(Id, #item.id, Items) of
      Item = #item{id = Id} -> {ok, Item};
      false -> false
    end;
find(by_pos, Pos, #package{items = Items}) ->
    case lists:keyfind(Pos, #item.pos, Items) of
      Item = #item{pos = Pos} -> {ok, Item};
      false -> false
    end.

-spec count(Mode, integer(), #package{}) -> {[#item{}] |
					     [],
					     non_neg_integer()} when Mode ::
									 by_base_id |
									 by_type.

count(by_base_id, BaseId, #package{items = Items}) ->
    do_count(by_base_id, BaseId, Items);
count(by_type, Type, #package{items = Items}) ->
    do_count(by_type, Type, Items).

-spec find_bind_unbind(BaseId :: non_neg_integer(),
		       #package{}) -> {BindItems, UnBindItems, BindNum,
				       UnBindNum} when BindItems :: [#item{}],
						       UnBindItems :: [#item{}],
						       BindNum ::
							   non_neg_integer(),
						       UnBindNum ::
							   non_neg_integer().

find_bind_unbind(BaseId, #package{items = Items}) ->
    do_find_bind_unbind(Items, BaseId, [], [], 0, 0).

do_find_bind_unbind([], _BaseId, BindItems, UnBindItems,
		    BindNum, UnBindNum) ->
    {BindItems, UnBindItems, BindNum, UnBindNum};
do_find_bind_unbind([Item = #item{bind = 1,
				  quantity = N, base_id = BaseId}
		     | T],
		    BaseId, BindItems, UnBindItems, BindNum, UnBindNum) ->
    do_find_bind_unbind(T, BaseId, [Item | BindItems],
			UnBindItems, BindNum + N, UnBindNum);
do_find_bind_unbind([Item = #item{quantity = N,
				  base_id = BaseId}
		     | T],
		    BaseId, BindItems, UnBindItems, BindNum, UnBindNum) ->
    do_find_bind_unbind(T, BaseId, BindItems,
			[Item | UnBindItems], BindNum, UnBindNum + N);
do_find_bind_unbind([_ | T], BaseId, BindItems,
		    UnBindItems, BindNum, UnBindNum) ->
    do_find_bind_unbind(T, BaseId, BindItems, UnBindItems,
			BindNum, UnBindNum).

-spec fresh_item(#item{}, #item{}, #package{},
		 #role{}) -> {ok, #package{}, #item{}}.

fresh_item(OldItem, NewItem,
	   Package = #package{type = 3, items = Items}, Role) ->
    NewItems = lists:keyreplace(OldItem#item.id, #item.id,
				Items, NewItem),
    push_item_info(update, Role, [{3, NewItem}]),
    {ok, Package#package{items = NewItems}, NewItem};
fresh_item(OldItem, NewItem,
	   Package = #package{type = 5, items = Items}, Role) ->
    NewItems = lists:keyreplace(OldItem#item.id, #item.id,
				Items, NewItem),
    push_item_info(update, Role, [{5, NewItem}]),
    {ok, Package#package{items = NewItems}, NewItem};
fresh_item(OldItem, NewItem,
	   Package = #package{type = PackType,
			      free_cell = FreeCell, items = Items},
	   Role) ->
    NewItems = lists:keyreplace(OldItem#item.id, #item.id,
				Items, NewItem),
    push_item_info(update, Role, [{PackType, NewItem}]),
    case NewItem#item.pos =:= OldItem#item.pos of
      true ->
	  {ok, Package#package{items = NewItems}, NewItem};
      false ->
	  NewFreeCell = lists:sort([OldItem#item.pos | FreeCell --
							 [NewItem#item.pos]]),
	  {ok,
	   Package#package{items = NewItems,
			   free_cell = NewFreeCell},
	   NewItem}
    end;
fresh_item(_, _, _, _) -> false.

fresh_eqm(OldItem, NewItem,
	  Package = #package{type = 3, items = Items}) ->
    NewItems = lists:keyreplace(OldItem#item.id, #item.id,
				Items, NewItem),
    {ok, Package#package{items = NewItems}}.

-spec replace_item(#item{}, #item{}, #package{},
		   #role{}) -> {ok, #package{}, #item{}}.

replace_item(OldItem, NewItem,
	     Pack = #package{type = 3, items = Items}, Role) ->
    NewItems = lists:keyreplace(OldItem#item.id, #item.id,
				Items, NewItem),
    push_item_info(del, Role, [{3, OldItem}]),
    push_item_info(add, Role, [{3, NewItem}]),
    {ok, Pack#package{items = NewItems}, NewItem};
replace_item(OldItem, NewItem,
	     Pack = #package{type = 5, items = Items}, Role) ->
    NewItems = lists:keyreplace(OldItem#item.id, #item.id,
				Items, NewItem),
    push_item_info(del, Role, [{5, OldItem}]),
    push_item_info(add, Role, [{5, NewItem}]),
    {ok, Pack#package{items = NewItems}, NewItem};
replace_item(OldItem, NewItem,
	     Pack = #package{type = PackType, free_cell = FreeCell,
			     items = Items},
	     Role) ->
    NewItems = lists:keyreplace(OldItem#item.id, #item.id,
				Items, NewItem),
    push_item_info(del, Role, [{PackType, OldItem}]),
    push_item_info(add, Role, [{PackType, NewItem}]),
    case NewItem#item.pos =:= OldItem#item.pos of
      true -> {ok, Pack#package{items = NewItems}, NewItem};
      false ->
	  NewFreeCell = lists:sort([OldItem#item.pos | FreeCell --
							 [NewItem#item.pos]]),
	  {ok,
	   Pack#package{items = NewItems, free_cell = NewFreeCell},
	   NewItem}
    end;
replace_item(_, _, _, _) -> false.

-spec push_item_info(Mode, Send,
		     ItemList) -> ok when Mode :: add | del | update,
					  Send :: #role{} | pid() | #link{},
					  ItemList :: [{PackageType, #item{}}] |
						      [{PackageType,
							[#item{}]}],
					  PackageType :: 1 | 2 | 3.

push_item_info(Mode,
	       #role{link = #link{conn_pid = ConnPid}}, ItemList) ->
    do_send_info(Mode, ConnPid, ItemList, []);
push_item_info(Mode, ConnPid, ItemList)
    when is_pid(ConnPid) ->
    do_send_info(Mode, ConnPid, ItemList, []);
push_item_info(Mode, #link{conn_pid = ConnPid},
	       ItemList) ->
    do_send_info(Mode, ConnPid, ItemList, []);
push_item_info(_Mode, _Send, _Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpackage374, _,
       {__Levelpackage374, __Tracespackage374}}
	  when __Levelpackage374 band 8 /= 0 orelse
		 __Tracespackage374 /= [] ->
	  lager:do_log(error,
		       [{module, package}, {function, push_item_info},
			{line, 374}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("错误的参数结构，无法推送物品更新通知[_Mode:~w, _Send:~w, "
				     "_Info:~w",
				     [_Mode, _Send, _Info]),
		       none, 4096, 8, __Levelpackage374, __Tracespackage374,
		       lager_event, __Pidpackage374);
      _ -> ok
    end,
    ok.

-spec push_gain(GainList,
		#role{}) -> ok when GainList :: [{Type, Add, Del,
						  Update}],
				    Type :: 1, Add :: [#item{}],
				    Del :: [#item{}], Update :: [#item{}].

push_gain([], _Role) -> ok;
push_gain([{Type, Add, Del, Update} | T], Role) ->
    push_item_info(del, Role, [{Type, Del}]),
    push_item_info(add, Role, [{Type, Add}]),
    push_item_info(update, Role, [{Type, Update}]),
    push_gain(T, Role).

do_send_info(_Mode, _ConnPid, [], []) -> skip;
do_send_info(add, ConnPid, [], SendList) ->
    sys_conn:pack_send(ConnPid, 10510,
		       {lists:reverse([{PackageType,
					item_lib:to_cli_items3(Item)}
				       || {PackageType, Item} <- SendList])}),
    ok;
do_send_info(add, ConnPid,
	     [{PackageType, Item = #item{}} | T], SendList) ->
    NewSendList = [{PackageType, Item} | SendList],
    do_send_info(add, ConnPid, T, NewSendList);
do_send_info(add, ConnPid, [{PackageType, Items} | T],
	     SendList)
    when is_list(Items) ->
    NewItemInfo = [{PackageType, Item} || Item <- Items],
    do_send_info(add, ConnPid, T, NewItemInfo ++ SendList);
do_send_info(del, ConnPid, [], SendList) ->
    sys_conn:pack_send(ConnPid, 10511,
		       {lists:reverse(SendList)}),
    ok;
do_send_info(del, ConnPid,
	     [{PackageType, Item = #item{}} | T], SendList) ->
    NewSendList = [{PackageType, Item} | SendList],
    do_send_info(del, ConnPid, T, NewSendList);
do_send_info(del, ConnPid, [{PackageType, Items} | T],
	     SendList)
    when is_list(Items) ->
    NewItemInfo = [{PackageType, Item} || Item <- Items],
    do_send_info(del, ConnPid, T, NewItemInfo ++ SendList);
do_send_info(update, ConnPid, [], SendList) ->
    sys_conn:pack_send(ConnPid, 10512,
		       {[{PackageType, item_lib:to_cli_items3(Item)}
			 || {PackageType, Item} <- SendList]}),
    ok;
do_send_info(update, ConnPid,
	     [{PackageType, Item = #item{}} | T], SendList) ->
    NewSendList = [{PackageType, Item} | SendList],
    do_send_info(update, ConnPid, T, NewSendList);
do_send_info(update, ConnPid,
	     [{PackageType, Items} | T], SendList)
    when is_list(Items) ->
    NewItemInfo = [{PackageType, Item} || Item <- Items],
    do_send_info(update, ConnPid, T,
		 NewItemInfo ++ SendList).

check_pos(#package{volume = Volume1}, Pos1,
	  #package{volume = Volume2}, Pos2) ->
    Pos1 >= 1 andalso
      Pos1 =< Volume1 andalso
	Pos2 >= 1 andalso Pos2 =< Volume2.

do_count(Mode, Key, Items) ->
    do_count(Mode, Key, Items, [], 0).

do_count(_, _, [], Result, Num) -> {Result, Num};
do_count(by_base_id, BaseId,
	 [Item = #item{base_id = BaseId, quantity = Quantity}
	  | T],
	 Result, Num) ->
    do_count(by_base_id, BaseId, T, [Item | Result],
	     Num + Quantity);
do_count(by_type, Type,
	 [Item = #item{type = Type, quantity = Quantity} | T],
	 Result, Num) ->
    do_count(by_type, Type, T, [Item | Result],
	     Num + Quantity);
do_count(Mode, Key, [_ | T], Result, Num) ->
    do_count(Mode, Key, T, Result, Num).

do_add_no_push_items(Package, [], AddItems) ->
    {ok, Package, AddItems};
do_add_no_push_items(Package, [H | T], AddItems) ->
    case do_add(Package, H, AddItems) of
      full -> full;
      false -> false;
      {ok, NewPackage, NewAddItems} ->
	  do_add_no_push_items(NewPackage, T, NewAddItems)
    end.

do_add_no_push_base_id(Package, [], Items) ->
    do_add_no_push_items(Package, Items, []);
do_add_no_push_base_id(Package,
		       [{BaseId, Bind, Num} | T], Items) ->
    case item:make(BaseId, Bind, Num) of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidpackage460, _,
	     {__Levelpackage460, __Tracespackage460}}
		when __Levelpackage460 band 8 /= 0 orelse
		       __Tracespackage460 /= [] ->
		lager:do_log(error,
			     [{module, package},
			      {function, do_add_no_push_base_id}, {line, 460},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("生成物品失败: ~w", [{BaseId, Bind, Num}]),
			     none, 4096, 8, __Levelpackage460,
			     __Tracespackage460, lager_event, __Pidpackage460);
	    _ -> ok
	  end,
	  false;
      {ok, NewItems} ->
	  do_add_no_push_base_id(Package, T, NewItems ++ Items)
    end;
do_add_no_push_base_id(Package,
		       [NewItems = #item{} | T], Items) ->
    do_add_no_push_base_id(Package, T, [NewItems | Items]);
do_add_no_push_base_id(Package,
		       [H = #item_make_args{} | T], Items) ->
    case item:make(H) of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidpackage470, _,
	     {__Levelpackage470, __Tracespackage470}}
		when __Levelpackage470 band 8 /= 0 orelse
		       __Tracespackage470 /= [] ->
		lager:do_log(error,
			     [{module, package},
			      {function, do_add_no_push_base_id}, {line, 470},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("生成物品失败: ~w", [H]), none, 4096, 8,
			     __Levelpackage470, __Tracespackage470, lager_event,
			     __Pidpackage470);
	    _ -> ok
	  end,
	  false;
      {ok, NewItems} ->
	  do_add_no_push_base_id(Package, T, NewItems ++ Items)
    end;
do_add_no_push_base_id(_Package, [_H | _T], _Items) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpackage476, _,
       {__Levelpackage476, __Tracespackage476}}
	  when __Levelpackage476 band 8 /= 0 orelse
		 __Tracespackage476 /= [] ->
	  lager:do_log(error,
		       [{module, package}, {function, do_add_no_push_base_id},
			{line, 476}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("增加物品参数错误:~w", [_H]), none, 4096, 8,
		       __Levelpackage476, __Tracespackage476, lager_event,
		       __Pidpackage476);
      _ -> ok
    end,
    false.

do_add(#package{free_cell = []}, _Item, _BackItems) ->
    full;
do_add(Package = #package{next_id = NextId,
			  free_cell = [Pos | FreeCell], items = Items},
       Item = #item{id = OldId}, BackItems) ->
    case OldId > 0 of
      true ->
	  NewI = Item#item{pos = Pos},
	  {ok,
	   Package#package{free_cell = FreeCell,
			   items = [NewI | Items]},
	   [NewI | BackItems]};
      _ ->
	  NewI = Item#item{id = NextId, pos = Pos},
	  {ok,
	   Package#package{next_id = NextId + 1,
			   free_cell = FreeCell, items = [NewI | Items]},
	   [NewI | BackItems]}
    end.

del_by_id(Package, ItemInfo) ->
    do_del_by_id(Package, ItemInfo, [], []).

do_del_by_id(Package, [], DelList, FreshList) ->
    {ok, Package, DelList, FreshList};
do_del_by_id(Package, [{ItemId, Num} | T], DelList,
	     FreshList) ->
    case do_del_by_id(Package, ItemId, Num, DelList,
		      FreshList)
	of
      {false, Reason} -> {false, Reason, {ItemId, Num}};
      {ok, NewPackage, NewDelList, NewFreshList} ->
	  do_del_by_id(NewPackage, T, NewDelList, NewFreshList)
    end.

do_del_by_id(Package = #package{free_cell = FreeCell,
				items = Items},
	     ItemId, Num, DelList, FreshList)
    when Num > 0 ->
    SortItem = lists:sort(fun sort_item_by_bind/2, Items),
    case do_del_by_id(SortItem, [], ItemId, [], Num,
		      DelList, FreshList)
	of
      {false, Reason} -> {false, Reason};
      {ok, NewItems, NewFreeCell, NewDelList, NewFreshList} ->
	  F = lists:sort(NewFreeCell ++ FreeCell),
	  {ok, Package#package{free_cell = F, items = NewItems},
	   NewDelList, NewFreshList}
    end;
do_del_by_id(_Package, _, _, _, _) ->
    {false, lang:get(<<"无法扣除0个物品"/utf8>>)}.

do_del_by_id([], _Items, _ItemId, _NewFreeCell, _Num,
	     _DelList, _FreshList) ->
    {false, lang:get(<<"未发现物品"/utf8>>)};
do_del_by_id([Item = #item{id = Fid, quantity = Q,
			   pos = Pos}
	      | T],
	     Items, Fid, NewFreeCell, Num, DelList, FreshList) ->
    N = Q - Num,
    if N =:= 0 ->
	   {ok, T ++ Items, [Pos | NewFreeCell], [Item | DelList],
	    FreshList};
       N > 0 ->
	   {ok, [Item#item{quantity = N} | T] ++ Items,
	    NewFreeCell, DelList,
	    [Item#item{quantity = N} | FreshList]};
       true -> {false, lang:get(<<"数量不足，无法扣除"/utf8>>)}
    end;
do_del_by_id([Item | T], Items, Id, NewFreeCell, Num,
	     DelList, FreshList) ->
    do_del_by_id(T, [Item | Items], Id, NewFreeCell, Num,
		 DelList, FreshList).

del_all_by_base_id(Package, ItemInfo) ->
    do_del_all_by_base_id(Package, ItemInfo, []).

do_del_all_by_base_id(Package = #package{free_cell =
					     FreeCell},
		      [], DelList) ->
    NewFreeCell = lists:sort(FreeCell),
    {ok, Package#package{free_cell = NewFreeCell}, DelList};
do_del_all_by_base_id(Package = #package{free_cell =
					     FreeCell,
					 items = Items},
		      [BaseId | T], DelList) ->
    Fun = fun (I = #item{base_id = IB, pos = Pos},
	       {ItemL, DelL, FreeL}) ->
		  case IB of
		    BaseId -> {ItemL, [I | DelL], [Pos | FreeL]};
		    _ -> {[I | ItemL], DelL, FreeL}
		  end
	  end,
    {NewItems, NewDelList, NewFreeCell} = lists:foldl(Fun,
						      {[], DelList, FreeCell},
						      Items),
    do_del_all_by_base_id(Package#package{free_cell =
					      NewFreeCell,
					  items = NewItems},
			  T, NewDelList).

del_by_base_id(Package, ItemInfo) ->
    do_del_by_base_id(Package, ItemInfo, [], []).

do_del_by_base_id(Package, [], DelList, FreshList) ->
    {ok, Package, DelList, FreshList};
do_del_by_base_id(Package, [{BaseId, Num} | T], DelList,
		  FreshList) ->
    case do_del_by_base_id(Package, BaseId, Num, DelList,
			   FreshList)
	of
      {false, Reason} -> {false, Reason, {BaseId, Num}};
      {ok, NewPackage, NewDelList, NewFreshList} ->
	  do_del_by_base_id(NewPackage, T, NewDelList,
			    NewFreshList)
    end.

do_del_by_base_id(Package = #package{free_cell =
					 FreeCell,
				     items = Items},
		  BaseId, Num, DelList, FreshList)
    when Num > 0 ->
    SortItem = lists:sort(fun sort_item_by_bind/2, Items),
    case do_del_by_base_id(SortItem, [], BaseId, [], Num,
			   DelList, FreshList)
	of
      {false, Reason} -> {false, Reason};
      {ok, NewItems, NewFreeCell, NewDelList, NewFreshList} ->
	  F = lists:sort(NewFreeCell ++ FreeCell),
	  {ok, Package#package{free_cell = F, items = NewItems},
	   NewDelList, NewFreshList}
    end;
do_del_by_base_id(_Package, _, _, _, _) ->
    {false, lang:get(<<"无法扣除0个物品"/utf8>>)}.

do_del_by_base_id([], _Items, BaseId, _NewFreeCell, Num,
		  _DelList, _FreshList)
    when Num > 0 ->
    {false,
     util:fbin(lang:get(<<"物品[~ts]不足"/utf8>>),
	       [item:attr(name, BaseId)])};
do_del_by_base_id([Item = #item{base_id = BaseId,
				quantity = Q, pos = Pos}
		   | T],
		  Items, BaseId, NewFreeCell, Num, DelList, FreshList) ->
    N = Q - Num,
    if N =:= 0 ->
	   {ok, T ++ Items, [Pos | NewFreeCell], [Item | DelList],
	    FreshList};
       N > 0 ->
	   {ok, [Item#item{quantity = N} | T] ++ Items,
	    NewFreeCell, DelList,
	    [Item#item{quantity = N} | FreshList]};
       true ->
	   do_del_by_base_id(T, Items, BaseId, [Pos | NewFreeCell],
			     Num - Q, [Item | DelList], FreshList)
    end;
do_del_by_base_id([Item | T], Items, BaseId,
		  NewFreeCell, Num, DelList, FreshList) ->
    do_del_by_base_id(T, [Item | Items], BaseId,
		      NewFreeCell, Num, DelList, FreshList).

sort_quantity(#item{quantity = Q1},
	      #item{quantity = Q2})
    when Q1 < Q2 ->
    true;
sort_quantity(_, _) -> false.

sort_item_by_bind(#item{bind = Bind1},
		  #item{bind = Bind2})
    when Bind1 > Bind2 ->
    true;
sort_item_by_bind(Item1 = #item{bind = Bind},
		  Item2 = #item{bind = Bind}) ->
    sort_quantity(Item1, Item2);
sort_item_by_bind(_, _) -> false.

add_volume(Role = #role{p_eqm =
			    #package{open_times = OpenTimes}},
	   3) ->
    NewOpenTimes = OpenTimes + 1,
    CostL = package_data:get({3, NewOpenTimes}),
    Loss = format:val_to_loss(CostL, make_package),
    case Loss of
      [_ | _] ->
	  case role_gain:do(Role, Loss) of
	    {ok,
	     LossRole = #role{p_eqm =
				  PEqm = #package{volume = Volume,
						  free_cell = FreeCell}}} ->
		log:log_gain(Loss, Role, LossRole, <<"背包扩容"/utf8>>,
			     util:fbin("存储空间扩容, 次数:~w", [NewOpenTimes])),
		NewVolume = Volume +
			      package_data:get_const(eqm_bag_vol_open_def),
		NewPEqm = PEqm#package{volume = NewVolume,
				       free_cell =
					   FreeCell ++
					     lists:seq(Volume + 1, NewVolume),
				       open_times = NewOpenTimes},
		NewRole = LossRole#role{p_eqm = NewPEqm},
		{ok, NewRole};
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidpackage641, _,
		   {__Levelpackage641, __Tracespackage641}}
		      when __Levelpackage641 band 8 /= 0 orelse
			     __Tracespackage641 /= [] ->
		      lager:do_log(error,
				   [{module, package}, {function, add_volume},
				    {line, 641}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("[~ts]装备背包扩容[Times:~w]失败：~w",
						 [Role#role.name, OpenTimes,
						  Err]),
				   none, 4096, 8, __Levelpackage641,
				   __Tracespackage641, lager_event,
				   __Pidpackage641);
		  _ -> ok
		end,
		{false, lang:get(<<"钻石不足，扩容失败"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"无法消耗钻石，扩容失败"/utf8>>)}
    end;
add_volume(_Role, _Type) ->
    {false, lang:get(<<"无法扩容未知的存储空间"/utf8>>)}.

push_package_volume(Role = #role{p_eqm =
				     #package{volume = Volume,
					      open_times = OpenTimes}},
		    Type = 3) ->
    role:pack_send(Role, 10526,
		   {Type, Volume + month_card:package_vol(Role),
		    OpenTimes}),
    ok;
push_package_volume(Role = #role{pet_bag =
				     #package{volume = Volume,
					      open_times = OpenTimes}},
		    Type = 5) ->
    role:pack_send(Role, 10526, {Type, Volume, OpenTimes}),
    ok;
push_package_volume(Role, Type) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpackage657, _,
       {__Levelpackage657, __Tracespackage657}}
	  when __Levelpackage657 band 8 /= 0 orelse
		 __Tracespackage657 /= [] ->
	  lager:do_log(error,
		       [{module, package}, {function, push_package_volume},
			{line, 657}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]无法推送存储空间容量信息:~w",
				     [Role#role.name, Type]),
		       none, 4096, 8, __Levelpackage657, __Tracespackage657,
		       lager_event, __Pidpackage657);
      _ -> ok
    end,
    ok.


