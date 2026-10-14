-file("src/mod/data/home_pet_evt.erl", 1).

-module(home_pet_evt).

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
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{m_home_pet,
		 [ver, name, id, rename_count, state, calc_time,
		  start_time, end_time, vigor, vigor_time, set_item,
		  next_evt_id, city, evt_list, do_evts, acc_evts,
		  fire_time, acc_out_time, acc_out_count, acc_items,
		  photos, diarys, day_talk, day_feed, photos_next_id,
		  diarys_next_id, photos_had]},
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

-export([set_add_vigor/1, set_add_vigor2/1,
	 set_evt_clock/2, do_set_next_evt/1,
	 check_home_pet_out/1, do_check_out/1, do_out/2,
	 do_calc_count/2, do_calc_go_home/1]).

-export([gm_home_pet_test/5]).

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

-file("src/mod/data/home_pet_evt.erl", 22).

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

-file("src/mod/data/home_pet_evt.erl", 23).

-file("inc/home_pet.hrl", 1).

-record(m_home_pet,
	{ver = 6, name = <<>>, id = 0, rename_count = 0,
	 state = 0, calc_time = 0, start_time = 0, end_time = 0,
	 vigor = 0, vigor_time = 0, set_item = [],
	 next_evt_id = 1, city = 0, evt_list = [], do_evts = [],
	 acc_evts = [], fire_time = 0, acc_out_time = 0,
	 acc_out_count = 0, acc_items = [], photos = [],
	 diarys = [], day_talk = 0, day_feed = 0,
	 photos_next_id = 1, diarys_next_id = 1,
	 photos_had = []}).

-file("src/mod/data/home_pet_evt.erl", 24).

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

-file("src/mod/data/home_pet_evt.erl", 25).

-file("inc/package.hrl", 1).

-record(package,
	{type = 1  :: integer(), next_id = 1  :: pos_integer(),
	 volume = 0  :: non_neg_integer(),
	 open_times = 0  :: non_neg_integer(),
	 free_cell = []  :: list(), items = []  :: [tuple()]}).

-file("src/mod/data/home_pet_evt.erl", 26).

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

-file("src/mod/data/home_pet_evt.erl", 27).

-file("inc/log.hrl", 1).

-file("src/mod/data/home_pet_evt.erl", 28).

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

-file("src/mod/data/home_pet_evt.erl", 29).

gm_home_pet_test(_Role, _FoodId, _ItemId, Count, Msg)
    when Count =< 0 ->
    Msg;
gm_home_pet_test(Role = #role{m_home_pet = MPet},
		 FoodId, ItemId, Count, Msg) ->
    case gm_do_out(Role, FoodId, ItemId) of
      {CityId, EvtList} ->
	  MsgList = to_gm_msg(EvtList,
			      util:fbin(lang:get(<<"Số lần:~w, Thành thị:~w, Sự kiện:\n"/utf8>>),
					[Count, CityId])),
	  AMsg2 = <<MsgList/binary, Msg/binary>>,
	  gm_home_pet_test(Role, FoodId, ItemId, Count - 1,
			   AMsg2);
      _ ->
	  MsgList =
	      util:fbin(lang:get(<<"Số lần:~w, Du lịch thất bại\n"/utf8>>),
			[Count]),
	  gm_home_pet_test(Role, FoodId, ItemId, Count - 1,
			   <<MsgList/binary, Msg/binary>>)
    end.

gm_do_out(Role, FoodId, ItemId) ->
    RandList = gm_get_rand_citys(FoodId, ItemId),
    case util:rand_list(RandList, 2) of
      {CityId, _} ->
	  NeedTime = home_pet_data:get_time(CityId),
	  EvtList = gm_get_rand_city_evt_list(ItemId, CityId),
	  StartTime = date:unixtime(),
	  EndTime = StartTime + NeedTime,
	  case do_fire_evt(Role, EvtList, StartTime, EndTime, 1,
			   [])
	      of
	    {_NewNextId, FireEvtList} -> {CityId, FireEvtList};
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidhome_pet_evt55, _,
		   {__Levelhome_pet_evt55, __Traceshome_pet_evt55}}
		      when __Levelhome_pet_evt55 band 64 /= 0 orelse
			     __Traceshome_pet_evt55 /= [] ->
		      lager:do_log(info,
				   [{module, home_pet_evt},
				    {function, gm_do_out}, {line, 55},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("Các sự kiện du lịch cho thú cưng là "
						 "ngẫu nhiên[]，Đừng đi du lịch, hãy kiểm "
						 "tra trước:~w",
						 [{CityId, EvtList}]),
				   none, 4096, 64, __Levelhome_pet_evt55,
				   __Traceshome_pet_evt55, lager_event,
				   __Pidhome_pet_evt55);
		  _ -> ok
		end,
		false
	  end;
      _ -> false
    end.

gm_get_rand_citys(FoodId, ItemId) ->
    case item_data:get(FoodId) of
      #item_base{effect = Effect} ->
	  CityList = list_util:keyfind(38, Effect, []),
	  RandList = [{IdT, home_pet_data:get_pro(IdT)}
		      || IdT <- CityList],
	  case item_data:get(ItemId) of
	    #item_base{effect = Effect} ->
		AddCityProList = list_util:keyfind(37, Effect, []),
		Fun = fun ({CityId, AddPro}, Acc) ->
			      OldPro = list_util:keyfind(CityId, Acc, 0),
			      lists:keyreplace(CityId, 1, Acc,
					       {CityId, AddPro + OldPro})
		      end,
		lists:foldl(Fun, RandList, AddCityProList);
	    _ -> RandList
	  end;
      _ -> []
    end.

gm_get_rand_city_evt_list(ItemId, CityId) ->
    EvtList1 = home_pet_data:get_evt_list(CityId),
    case item_data:get(ItemId) of
      #item_base{effect = Effect} ->
	  AddCityProList = list_util:keyfind(37, Effect, []),
	  Fun = fun (EvtId, Acc) ->
			case home_pet_data:get_evt_pro(EvtId) of
			  {EvtId, Pro, Arge, LimitCount} ->
			      [Type | _] = home_pet_data:get_evt_type(EvtId),
			      AddPro = list_util:keyfind(Type, AddCityProList,
							 0),
			      [{EvtId, Pro + AddPro, Arge, LimitCount} | Acc];
			  _ -> Acc
			end
		end,
	  lists:foldl(Fun, [], EvtList1);
      _ ->
	  [home_pet_data:get_evt_pro(EidT) || EidT <- EvtList1]
    end.

to_gm_msg([], Msg) -> Msg;
to_gm_msg([{_EvtId, _Time, 1, _EvtAward} | EvtList],
	  AMsg) ->
    to_gm_msg(EvtList, AMsg);
to_gm_msg([{EvtId, _Time, EEId, EvtAward} | EvtList],
	  AMsg) ->
    case home_pet_data:get_evt_is_notice(EEId) of
      0 when EEId =/= 2 -> to_gm_msg(EvtList, AMsg);
      _ ->
	  Fun = fun ({Bid, Num}, AccMsg) ->
			#item_base{name = Name} = item_data:get(Bid),
			Msg =
			    util:fbin(lang:get(<<"        id：~w  Tên:~ts  số lượng:~w \n"/utf8>>),
				      [Bid, Name, Num]),
			<<AccMsg/binary, Msg/binary>>
		end,
	  PtnMsg1 = lists:foldl(Fun,
				util:fbin(lang:get(<<"   Phát động sự kiện:~w, sự kiện phụ:~w "
						     "phần thưởng:\n"/utf8>>),
					  [EvtId, EEId]),
				EvtAward),
	  AMsg2 = <<AMsg/binary, PtnMsg1/binary>>,
	  to_gm_msg(EvtList, AMsg2)
    end.

-spec set_add_vigor(#role{}) -> {ok, #role{}}.

set_add_vigor(Role = #role{m_home_pet =
			       MPet = #m_home_pet{vigor_time = VigorTime,
						  state = 1}}) ->
    Now = date:unixtime(),
    CdTime = case VigorTime >= Now of
	       true -> max(1, VigorTime - Now);
	       _ -> home_pet_data:get_const(power_recovery_speed)
	     end,
    Role1 = Role#role{m_home_pet =
			  MPet#m_home_pet{vigor_time = Now + CdTime}},
    Role2 = role_timer:set(#timer{id = home_pet_add_vigor,
				  timeout = CdTime * 1000, m = home_pet_evt,
				  f = set_add_vigor2, a = []},
			   Role1),
    home_pet_lib:push_vigor(Role2),
    {ok, Role2};
set_add_vigor(Role) -> {ok, Role}.

set_add_vigor2(Role = #role{m_home_pet =
				MPet = #m_home_pet{state = 1,
						   vigor = Vigor}}) ->
    MaxVigor = home_pet_data:get_const(power_upper_limit),
    case Vigor >= MaxVigor of
      true -> {ok, Role};
      _ ->
	  Now = date:unixtime(),
	  CdTime = home_pet_data:get_const(power_recovery_speed),
	  Role1 = Role#role{m_home_pet =
				MPet#m_home_pet{vigor =
						    min(MaxVigor, Vigor + 1),
						vigor_time = Now + CdTime}},
	  Role2 = role_timer:set(#timer{id = home_pet_add_vigor,
					timeout = CdTime * 1000,
					m = home_pet_evt, f = set_add_vigor2,
					a = []},
				 Role1),
	  home_pet_lib:push_vigor(Role2),
	  {ok, Role2}
    end;
set_add_vigor2(Role) -> {ok, Role}.

-spec check_home_pet_out(#role{}) -> {ok, #role{}}.

check_home_pet_out(Role = #role{m_home_pet =
				    MPet = #m_home_pet{state = 1,
						       set_item = SetItem}}) ->
    case lists:keymember(1, 1, SetItem) of
      true ->
	  Now = date:unixtime(),
	  CdTime =
	      home_pet_data:get_const(travel_judgement_interval),
	  Role1 = Role#role{m_home_pet =
				MPet#m_home_pet{calc_time = Now + CdTime}},
	  Role2 = role_timer:set(#timer{id = home_pet_check_out,
					timeout = CdTime * 1000,
					m = home_pet_evt, f = do_check_out,
					a = []},
				 Role1),
	  {ok, Role2};
      _ ->
	  Role2 = role_timer:del(home_pet_check_out, Role),
	  {ok, Role2}
    end;
check_home_pet_out(Role) -> {ok, Role}.

set_evt_clock(Role = #role{m_home_pet =
			       MHomePet = #m_home_pet{state = 2,
						      evt_list = EvtList,
						      acc_evts = AccEvts}},
	      out) ->
    Role1 = case lists:keyfind(1, 3, EvtList) of
	      {EvtId, Time, _, EvtAward} ->
		  case lists:keymember(EvtId, 1, AccEvts) of
		    true -> Role;
		    _ ->
			sys_conn:pack_send(26108,
					   {[{EvtId, Time, 1, EvtAward}]}),
			Role#role{m_home_pet =
				      MHomePet#m_home_pet{acc_evts =
							      [{EvtId, Time, 1,
								EvtAward}
							       | AccEvts]}}
		  end;
	      _ -> Role
	    end,
    do_set_next_evt(Role1);
set_evt_clock(Role = #role{m_home_pet =
			       MHomePet = #m_home_pet{state = 2,
						      evt_list = EvtList,
						      acc_evts = AccEvts}},
	      EvtId) ->
    Role1 = case lists:keyfind(EvtId, 1, EvtList) of
	      {EvtId, Time, 2, EvtAward} ->
		  sys_conn:pack_send(26108,
				     {[{EvtId, Time, 2, EvtAward}]}),
		  RoleT1 = Role#role{m_home_pet =
					 MHomePet#m_home_pet{acc_evts =
								 [{EvtId, Time,
								   2, EvtAward}
								  | AccEvts]}},
		  do_calc_go_home(RoleT1);
	      {EvtId, Time, EEId, EvtAward} ->
		  sys_conn:pack_send(26108,
				     {[{EvtId, Time, EEId, EvtAward}]}),
		  case home_pet_data:get_evt_is_notice(EEId) of
		    0 -> Role;
		    _ ->
			Role#role{m_home_pet =
				      MHomePet#m_home_pet{acc_evts =
							      [{EvtId, Time,
								EEId, EvtAward}
							       | AccEvts]}}
		  end;
	      _ -> Role
	    end,
    do_set_next_evt(Role1);
set_evt_clock(Role, _EvtId) -> {ok, Role}.

do_set_next_evt(Role = #role{m_home_pet =
				 #m_home_pet{state = 2, evt_list = EvtList,
					     do_evts = DoEvts,
					     acc_evts = AccEvts}}) ->
    Now = date:unixtime(),
    case lists:keysort(2,
		       [{EId, ETime}
			|| {EId, ETime, EEid, _} <- EvtList,
			   ETime >= Now andalso
			     not lists:member(EId, DoEvts) andalso
			       not lists:keymember(EId, 1, AccEvts) andalso
				 home_pet_data:get_evt_is_notice(EEid) == 1])
	of
      [{EvtId, Time} | _] ->
	  NRole = role_timer:set(#timer{id =
					    home_pet_set_evt_time,
					timeout = (Time - Now) * 1000,
					m = home_pet_evt, f = set_evt_clock,
					a = [EvtId]},
				 Role),
	  {ok, NRole};
      _ -> check_home_pet_out(Role)
    end;
do_set_next_evt(Role) ->
    {ok, Role1} = check_home_pet_out(Role),
    set_add_vigor(Role1).

do_calc_go_home(Role = #role{m_home_pet =
				 MPet = #m_home_pet{start_time = StartTime,
						    acc_out_time = AccTime,
						    end_time = EndTime,
						    set_item = SetItem}}) ->
    AddItem = [],
    NewSetItem = to_next_item(SetItem),
    NRole = Role#role{m_home_pet =
			  MPet#m_home_pet{state = 1, set_item = NewSetItem,
					  calc_time =
					      EndTime +
						home_pet_data:get_const(travel_judgement_interval),
					  vigor_time =
					      EndTime +
						home_pet_data:get_const(power_recovery_speed),
					  acc_out_time =
					      AccTime + EndTime - StartTime}},
    NewRole = do_calc_count(NRole, AddItem),
    home_pet_lib:info(NewRole),
    NewRole1 = role_trigger:fire([#evt_travel_time{time =
						       EndTime - StartTime}],
				 NewRole),
    NewRole1.

get_drop_item(_SetItem, [], L) -> L;
get_drop_item(SetItem, [Id | Ids], L) ->
    case lists:keyfind(Id, 1, SetItem) of
      {_, ItemId} ->
	  get_drop_item(SetItem, Ids, [ItemId | L]);
      _ -> get_drop_item(SetItem, Ids, L)
    end.

to_next_item(SetItem) ->
    [{Id - 2, Item}
     || {Id, Item} <- SetItem, lists:member(Id, [3, 4])].

do_calc_count(NRole, []) -> NRole;
do_calc_count(Role, AddItem) ->
    Fun = fun (Id, Acc) ->
		  case package:fetch(5, Id, Role) of
		    {ok, #item{base_id = BaseId, extra = Extra}} ->
			Count = list_util:keyfind(11, Extra, 1),
			case Count > 0 of
			  true -> [{BaseId, 1} | Acc];
			  _ -> Acc
			end;
		    _ -> Acc
		  end
	  end,
    Loss = lists:foldl(Fun, [], AddItem),
    GL = format:val_to_loss(Loss, pet_item_base_id),
    case role_gain:do(Role, GL) of
      {ok, NRole} ->
	  log:log_gain(GL, Role, NRole, <<"萌宠出行消耗"/utf8>>,
		       util:fbin("Khấu trừ thực phẩm cho chuyến du lịch "
				 "thú cưng dễ thương:id:~w; bid:~w",
				 [AddItem, Loss])),
	  NRole;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhome_pet_evt265, _,
	     {__Levelhome_pet_evt265, __Traceshome_pet_evt265}}
		when __Levelhome_pet_evt265 band 8 /= 0 orelse
		       __Traceshome_pet_evt265 /= [] ->
		lager:do_log(error,
			     [{module, home_pet_evt}, {function, do_calc_count},
			      {line, 265}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]id:~wKhấu trừ khi vật nuôi đi du "
					   "lịch~wKhông thành công, đoán rằng dữ "
					   "liệu hành lý bất thường, kiểm tra cẩn "
					   "thận！！！！",
					   [Role#role.name, Role#role.id,
					    AddItem]),
			     none, 4096, 8, __Levelhome_pet_evt265,
			     __Traceshome_pet_evt265, lager_event,
			     __Pidhome_pet_evt265);
	    _ -> ok
	  end,
	  fail
    end.

-spec do_check_out(#role{}) -> {ok, #role{}}.

do_check_out(Role = #role{m_home_pet =
			      #m_home_pet{vigor = Vigor}}) ->
    Rio = round(1000 * Vigor /
		  home_pet_data:get_const(power_upper_limit)),
    case util:rand(1, 1000) =< Rio of
      true ->
	  Now = date:unixtime(),
	  case do_out(Role, Now) of
	    no_item -> {ok, Role};
	    {ok,
	     NRole = #role{m_home_pet = #m_home_pet{state = 2}}} ->
		NRole2 = role_timer:del(home_pet_add_vigor, NRole),
		{ok, NewRole} = set_evt_clock(NRole2, out),
		home_pet_lib:info(NewRole),
		{ok, NewRole};
	    {_, NRole} -> check_home_pet_out(NRole)
	  end;
      _ -> check_home_pet_out(Role)
    end.

do_out(Role = #role{m_home_pet =
			MPet = #m_home_pet{next_evt_id = NextId, vigor = Vigor,
					   set_item = SetItem,
					   acc_out_count = AccOutTime}},
       StartTime) ->
    case get_rand_citys(Role, SetItem) of
      RandList = [_ | _] ->
	  case [IdT
		|| {IdT, _} <- RandList,
		   Vigor < home_pet_data:get_expend_vigor(IdT)]
	      of
	    [] ->
		case util:rand_list(RandList, 2) of
		  {CityId, _} ->
		      ExpendVigor = home_pet_data:get_expend_vigor(CityId),
		      NeedTime = home_pet_data:get_time(CityId),
		      EvtList = get_rand_city_evt_list(Role, SetItem, CityId),
		      EndTime = StartTime + NeedTime,
		      case do_fire_evt(Role, EvtList, StartTime, EndTime,
				       NextId, [])
			  of
			{NewNextId, FireEvtList} ->
			    AddItem = get_drop_item(SetItem, [1, 2], []),
			    case do_calc_count(Role, AddItem) of
			      Role1 when is_record(Role1, role) ->
				  NewSetItem = [{Id, Item}
						|| {Id, Item} <- SetItem,
						   lists:member(Id, [3, 4])],
				  NRole = Role1#role{m_home_pet =
							 MPet#m_home_pet{vigor =
									     max(0,
										 Vigor
										   -
										   ExpendVigor),
									 state =
									     2,
									 end_time
									     =
									     EndTime,
									 start_time
									     =
									     StartTime,
									 city =
									     CityId,
									 evt_list
									     =
									     FireEvtList,
									 do_evts
									     =
									     [],
									 next_evt_id
									     =
									     NewNextId,
									 acc_out_count
									     =
									     AccOutTime
									       +
									       1,
									 set_item
									     =
									     NewSetItem}},
				  {ok, NRole};
			      _ -> no_item
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
			      {__Pidhome_pet_evt327, _,
			       {__Levelhome_pet_evt327,
				__Traceshome_pet_evt327}}
				  when __Levelhome_pet_evt327 band 64 /= 0
					 orelse __Traceshome_pet_evt327 /= [] ->
				  lager:do_log(info,
					       [{module, home_pet_evt},
						{function, do_out}, {line, 327},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("Các sự kiện du lịch cho thú cưng là "
							     "ngẫu nhiên[]，đừng đi du lịch, hãy kiểm "
							     "tra trước:~w",
							     [{CityId,
							       EvtList}]),
					       none, 4096, 64,
					       __Levelhome_pet_evt327,
					       __Traceshome_pet_evt327,
					       lager_event,
					       __Pidhome_pet_evt327);
			      _ -> ok
			    end,
			    {false, Role}
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
			{__Pidhome_pet_evt331, _,
			 {__Levelhome_pet_evt331, __Traceshome_pet_evt331}}
			    when __Levelhome_pet_evt331 band 8 /= 0 orelse
				   __Traceshome_pet_evt331 /= [] ->
			    lager:do_log(error,
					 [{module, home_pet_evt},
					  {function, do_out}, {line, 331},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("Cấu hình thành phố thức ăn cho thú cưng "
						       "có thể sai:~w",
						       [SetItem]),
					 none, 4096, 8, __Levelhome_pet_evt331,
					 __Traceshome_pet_evt331, lager_event,
					 __Pidhome_pet_evt331);
			_ -> ok
		      end,
		      {false, Role}
		end;
	    _ -> {false, Role}
	  end;
      no_item -> no_item
    end.

get_rand_citys(Role, SetItem) ->
    Id = list_util:keyfind(1, SetItem, 0),
    case package:fetch(5, Id, Role) of
      {ok, #item{base_id = Bid}} ->
	  case item_data:get(Bid) of
	    #item_base{effect = Effect} ->
		CityList = list_util:keyfind(38, Effect, []),
		RandList = [{IdT, home_pet_data:get_pro(IdT)}
			    || IdT <- CityList],
		get_rand_city_list(Role, SetItem, RandList);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidhome_pet_evt351, _,
		   {__Levelhome_pet_evt351, __Traceshome_pet_evt351}}
		      when __Levelhome_pet_evt351 band 8 /= 0 orelse
			     __Traceshome_pet_evt351 /= [] ->
		      lager:do_log(error,
				   [{module, home_pet_evt},
				    {function, get_rand_citys}, {line, 351},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("Lỗi cấu hình thức ăn cho thú cưng:~w",
						 [Bid]),
				   none, 4096, 8, __Levelhome_pet_evt351,
				   __Traceshome_pet_evt351, lager_event,
				   __Pidhome_pet_evt351);
		  _ -> ok
		end,
		no_item
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
	    {__Pidhome_pet_evt355, _,
	     {__Levelhome_pet_evt355, __Traceshome_pet_evt355}}
		when __Levelhome_pet_evt355 band 8 /= 0 orelse
		       __Traceshome_pet_evt355 /= [] ->
		lager:do_log(error,
			     [{module, home_pet_evt},
			      {function, get_rand_citys}, {line, 355},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("Lỗi cấu hình thức ăn cho thú cưng:~w",
					   [SetItem]),
			     none, 4096, 8, __Levelhome_pet_evt355,
			     __Traceshome_pet_evt355, lager_event,
			     __Pidhome_pet_evt355);
	    _ -> ok
	  end,
	  no_item
    end.

get_rand_city_list(Role, SetItem, CityList) ->
    Id = list_util:keyfind(2, SetItem, 0),
    case package:fetch(5, Id, Role) of
      {ok, #item{base_id = Bid}} ->
	  case item_data:get(Bid) of
	    #item_base{effect = Effect} ->
		AddCityProList = list_util:keyfind(37, Effect, []),
		Fun = fun ({CityId, AddPro}, Acc) ->
			      OldPro = list_util:keyfind(CityId, Acc, 0),
			      lists:keyreplace(CityId, 1, Acc,
					       {CityId, AddPro + OldPro})
		      end,
		lists:foldl(Fun, CityList, AddCityProList);
	    _ -> CityList
	  end;
      _ -> CityList
    end.

get_rand_city_evt_list(Role, SetItem, CityId) ->
    EvtList1 = home_pet_data:get_evt_list(CityId),
    Id = list_util:keyfind(2, SetItem, 0),
    case package:fetch(5, Id, Role) of
      {ok, #item{base_id = Bid}} ->
	  case item_data:get(Bid) of
	    #item_base{effect = Effect} ->
		AddCityProList = list_util:keyfind(37, Effect, []),
		Fun = fun (EvtId, Acc) ->
			      case home_pet_data:get_evt_pro(EvtId) of
				{EvtId, Pro, Arge, LimitCount} ->
				    [Type | _] =
					home_pet_data:get_evt_type(EvtId),
				    AddPro = list_util:keyfind(Type,
							       AddCityProList,
							       0),
				    [{EvtId, Pro + AddPro, Arge, LimitCount}
				     | Acc];
				_ -> Acc
			      end
		      end,
		lists:foldl(Fun, [], EvtList1);
	    _ ->
		[home_pet_data:get_evt_pro(EidT) || EidT <- EvtList1]
	  end;
      _ ->
	  [home_pet_data:get_evt_pro(EidT) || EidT <- EvtList1]
    end.

do_fire_evt(_Role, [], _CalcTime, _EndTime, _NextId,
	    []) ->
    false;
do_fire_evt(Role, [], CalcTime, EndTime, NextId, L) ->
    TimeGap = max(1,
		  (EndTime - CalcTime - 1) div length(L)),
    L1 = [{CalcTime, 1}, {EndTime, 2}] ++
	   ran_time(list_util:shuffle(L), TimeGap, CalcTime + 1,
		    EndTime - 1, []),
    set_evt_id(Role, NextId, lists:keysort(1, L1), []);
do_fire_evt(Role,
	    [{EvtId, Pro, DoCountArge, LimitCount} | EvtList],
	    CalcTime, EndTime, NextId, L)
    when DoCountArge > 0 ->
    DoCount = (EndTime - CalcTime) div DoCountArge,
    EvtRandList = home_pet_data:get_evt_son_ids(EvtId),
    EvtL = do_rand_count(EvtRandList, EvtId, Pro, DoCount,
			 LimitCount, 0, []),
    do_fire_evt(Role, EvtList, CalcTime, EndTime, NextId,
		EvtL ++ L);
do_fire_evt(Role, [_ | EvtList], CalcTime, EndTime,
	    NextId, L) ->
    do_fire_evt(Role, EvtList, CalcTime, EndTime, NextId,
		L).

ran_time([EId | L], TimeGap, CalcTime, EndTime, [])
    when is_integer(EId) ->
    ran_time(L, TimeGap, CalcTime, EndTime,
	     [{CalcTime, EId}]);
ran_time([EId | L], TimeGap, CalcTime, EndTime,
	 RandList = [{_, 1}])
    when is_integer(EId) ->
    ran_time(L, TimeGap, CalcTime, EndTime,
	     [{CalcTime, EId} | RandList]);
ran_time([EId | L], TimeGap, CalcTime, EndTime,
	 RandList = [{_, 2}])
    when is_integer(EId) ->
    ran_time(L, TimeGap, CalcTime, EndTime,
	     [{CalcTime, EId} | RandList]);
ran_time([EId | L], TimeGap, CalcTime, EndTime,
	 RandList = [{_, 1}, {_, 2}])
    when is_integer(EId) ->
    ran_time(L, TimeGap, CalcTime, EndTime,
	     [{CalcTime, EId} | RandList]);
ran_time([], _TimeGap, _CalcTime, _EndTime, RandList) ->
    RandList;
ran_time(_, _TimeGap, CalcTime, EndTime, RandList)
    when CalcTime > EndTime ->
    RandList;
ran_time([{Time, EId} | L], TimeGap, CalcTime, EndTime,
	 RandList) ->
    ran_time(L, TimeGap, CalcTime + TimeGap, EndTime,
	     [{Time, EId} | RandList]);
ran_time([EId | L], TimeGap, CalcTime, EndTime,
	 RandList) ->
    case util:rand(CalcTime, CalcTime + TimeGap) of
      RandTime when RandTime < EndTime ->
	  ran_time(L, TimeGap, CalcTime + TimeGap, EndTime,
		   [{RandTime, EId} | RandList]);
      _ ->
	  ran_time(L, TimeGap, CalcTime + TimeGap, EndTime,
		   RandList)
    end.

do_rand_count(_EvtRandList, _EvtId, _Pro, _DoCount,
	      LimitCount, _Count, L)
    when length(L) >= LimitCount ->
    L;
do_rand_count(_EvtRandList, _EvtId, _Pro, DoCount,
	      _LimitCount, Count, L)
    when Count >= DoCount ->
    L;
do_rand_count(EvtRandList, EvtId, Pro, DoCount,
	      LimitCount, Count, L) ->
    case util:rand(1, 1000) =< Pro of
      true ->
	  EvtSId = list_util:rand(EvtRandList),
	  do_rand_count(EvtRandList, EvtId, Pro, DoCount,
			LimitCount, Count + 1, [EvtSId | L]);
      _ ->
	  do_rand_count(EvtRandList, EvtId, Pro, DoCount,
			LimitCount, Count + 1, L)
    end.

set_evt_id(_Role, NextId, [], L) ->
    case lists:keyfind(2, 3, L) of
      {EId, EvtTime, EvtSId, _} ->
	  Fun = fun ({_EIdT, _EvtTimeT, EvtSIdT, EvtAwardT},
		     Acc) ->
			case home_pet_data:get_evt_award_type(EvtSIdT) of
			  1 -> Acc ++ EvtAwardT;
			  _ -> Acc
			end
		end,
	  EvtAward1 = lists:foldl(Fun, [], L),
	  EvtAward = item_lib:merge(EvtAward1, []),
	  case EvtAward of
	    [] ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidhome_pet_evt465, _,
		   {__Levelhome_pet_evt465, __Traceshome_pet_evt465}}
		      when __Levelhome_pet_evt465 band 64 /= 0 orelse
			     __Traceshome_pet_evt465 /= [] ->
		      lager:do_log(info,
				   [{module, home_pet_evt},
				    {function, set_evt_id}, {line, 465},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("Phần thưởng của sự kiện du lịch về nhà "
						 "cho thú cưng là[]:~w",
						 [L]),
				   none, 4096, 64, __Levelhome_pet_evt465,
				   __Traceshome_pet_evt465, lager_event,
				   __Pidhome_pet_evt465);
		  _ -> ok
		end,
		false;
	    _ ->
		{NextId,
		 lists:keyreplace(2, 3, L,
				  {EId, EvtTime, EvtSId, EvtAward})}
	  end;
      _ -> {NextId, L}
    end;
set_evt_id(Role, NextId, [{EvtTime, EvtSId} | Other],
	   L) ->
    EvtAward1 = home_pet_data:get_evt_award(EvtSId),
    EvtAward2 = get_drop_award(Role, EvtSId),
    EvtAward = item_lib:merge(EvtAward1, EvtAward2),
    set_evt_id(Role, NextId + 1, Other,
	       [{NextId, EvtTime, EvtSId, EvtAward} | L]).

get_drop_award(Role, EvtSId) ->
    DropIds = home_pet_data:get_evt_drop_ids(EvtSId),
    case drop_lib:common_drop(Role, DropIds) of
      [{_, DropItems, _, _}] ->
	  [{Bid, Val} || {Bid, _, Val} <- DropItems];
      _ -> []
    end.


