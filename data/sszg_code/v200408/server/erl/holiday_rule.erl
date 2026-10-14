-file("src/mod/holiday/holiday_rule.erl", 1).

-module(holiday_rule).

-lager_records([{vip_effect_data, [name, val]},
		{vip_data,
		 [lev, gold, price, old_price, items, ext_reward]},
		{m_vip, [ver, lev, lev_reward, tired_charge]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
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

-export([qry/2, finish_by_val_range/4,
	 finish_by_val_eq/3, finish_by_val_ge/3,
	 finish_by_acc_val_ge/3, take/3, take/4, reward/5,
	 take_reward/3, take_reward/4, take_reward_step/4,
	 buy_reward/3, buy_reward/4, buy_reward_step/4,
	 is_gain_reward/2, to_gold/3, make_cfg_cond_ext/1,
	 check_cfg_conds/4]).

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

-file("src/mod/holiday/holiday_rule.erl", 27).

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

-file("src/mod/holiday/holiday_rule.erl", 28).

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

-file("src/mod/holiday/holiday_rule.erl", 29).

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

-file("src/mod/holiday/holiday_rule.erl", 30).

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

-file("src/mod/holiday/holiday_rule.erl", 31).

-file("inc/log.hrl", 1).

-file("src/mod/holiday/holiday_rule.erl", 32).

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

-file("src/mod/holiday/holiday_rule.erl", 33).

-type take_reward_step() :: gl | take.

-type buy_reward_step() :: gl | buy.

-spec qry(#holiday{}, #role{}) -> {error, bitstring()} |
				  tuple().

qry(#holiday{camp_id = CampId, bid = Bid,
	     end_time = EndTime, reward = Reward,
	     cli_reward = CliReward, item_effect = ItemEff,
	     process_show_reward = _PShowReward},
    Role) ->
    {AccVal, GetAimList} = case
			     holiday_lib:get_tv_val(CampId, Bid, Role)
			       of
			     {AccVal0, L0} -> {AccVal0, L0};
			     L0 -> {0, L0}
			   end,
    Now = date:unixtime(),
    Fun = fun ({Aim, Items, AimStr}) ->
		  Status = case lists:keyfind(Aim, 1, GetAimList) of
			     {_, S} -> S;
			     false -> 0
			   end,
		  {Aim,
		   case is_binary(AimStr) of
		     false -> list_to_binary(AimStr);
		     true -> AimStr
		   end,
		   Status, holiday_lib:to_client_item(Items), []};
	      (I) ->
		  case {whereis(lager_event), whereis(lager_event),
			lager_config:get({lager_event, loglevel}, {0, []})}
		      of
		    {undefined, undefined, _} ->
			fun () -> {error, lager_not_running} end();
		    {undefined, _, _} ->
			fun () -> {error, {sink_not_configured, lager_event}}
			end();
		    {__Pidholiday_rule56, _,
		     {__Levelholiday_rule56, __Tracesholiday_rule56}}
			when __Levelholiday_rule56 band 8 /= 0 orelse
			       __Tracesholiday_rule56 /= [] ->
			lager:do_log(error,
				     [{module, holiday_rule}, {function, qry},
				      {line, 56}, {pid, pid_to_list(self())},
				      {node, node()}
				      | lager:md()],
				     io_lib:format("活动[~w]奖励格式非法:~w", [Bid, I]),
				     none, 4096, 8, __Levelholiday_rule56,
				     __Tracesholiday_rule56, lager_event,
				     __Pidholiday_rule56);
		    _ -> ok
		  end,
		  {0, <<>>, 0, [], []}
	  end,
    RewardData = [Fun(I) || I <- Reward],
    RankList = [],
    {max(0, EndTime - Now), AccVal, RewardData, ItemEff, [],
     CliReward, RankList}.

finish_by_val_range(Min, Max, Holiday, Role)
    when Min =< Max ->
    {ok, NRole} = finish_by_val_eq(Min, Holiday, Role),
    finish_by_val_range(Min + 1, Max, Holiday, NRole);
finish_by_val_range(_Min, _Max, _Holiday, Role) ->
    {ok, Role}.

-spec finish_by_val_eq(integer(), #holiday{},
		       #role{}) -> {ok, #role{}}.

finish_by_val_eq(Val,
		 Holiday = #holiday{camp_id = CampId, bid = Bid,
				    reward = Reward},
		 Role) ->
    case lists:keyfind(Val, 1, Reward) of
      I when is_tuple(I) ->
	  Aim = element(1, I),
	  GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
	  case lists:keyfind(Aim, 1, GetAimList) of
	    {_, 1} -> {ok, Role};
	    {_, 2} -> {ok, Role};
	    _ ->
		NewGetAimList = lists:keystore(Aim, 1, GetAimList,
					       {Aim, 1}),
		ExpireSec = holiday_lib:get_tv_timeout(Holiday),
		NRole = holiday_lib:set_tv_val(CampId, Role,
					       NewGetAimList, ExpireSec),
		holiday:push_bid_can_reward(NRole, Bid),
		{ok, NRole}
	  end;
      _ -> {ok, Role}
    end.

-spec finish_by_val_ge(integer(), #holiday{},
		       #role{}) -> {ok, #role{}}.

finish_by_val_ge(Val,
		 Holiday = #holiday{camp_id = CampId, bid = Bid,
				    reward = Reward},
		 Role) ->
    GetAimList = holiday_lib:get_tv_val(CampId, Bid, Role),
    Fun = fun (I, {Flag, L}) ->
		  Aim = element(1, I),
		  case lists:keyfind(Aim, 1, GetAimList) of
		    false when Val >= Aim -> {true, [{Aim, 1} | L]};
		    _ -> {Flag, L}
		  end
	  end,
    case lists:foldl(Fun, {false, []}, Reward) of
      {true, NewGetAimList} ->
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NRole = holiday_lib:set_tv_val(CampId, Role,
					 NewGetAimList, ExpireSec),
	  holiday:push_bid_can_reward(NRole, Bid),
	  {ok, NRole};
      _ -> {ok, Role}
    end.

-spec finish_by_acc_val_ge(integer(), #holiday{},
			   #role{}) -> {ok, #role{}}.

finish_by_acc_val_ge(Val,
		     Holiday = #holiday{camp_id = CampId, bid = Bid,
					reward = Reward},
		     Role) ->
    {AccVal0, GetAimList} = holiday_lib:get_tv_val(CampId,
						   Bid, Role),
    AccVal = AccVal0 + Val,
    Fun = fun (I, L) ->
		  Aim = element(1, I),
		  case lists:keyfind(Aim, 1, GetAimList) of
		    false when AccVal >= Aim -> [{Aim, 1} | L];
		    false -> L;
		    Temp -> [Temp | L]
		  end
	  end,
    NewGetAimList = lists:foldl(Fun, [], Reward),
    ExpireSec = holiday_lib:get_tv_timeout(Holiday),
    NRole = holiday_lib:set_tv_val(CampId, Role,
				   {AccVal, NewGetAimList}, ExpireSec),
    holiday:push_bid_can_reward(NRole, Bid),
    {ok, NRole}.

-spec take(#holiday{}, #role{},
	   pos_integer()) -> {error, binary()} |
			     {ok, binary(), #role{}}.

take(Holiday, Role, Aim) ->
    take(Holiday, Role, Aim, #{}).

-spec take(#holiday{}, #role{}, pos_integer(),
	   map()) -> {error, binary()} | {ok, binary(), #role{}}.

take(Holiday = #holiday{reward = Reward}, Role, Aim,
     Args) ->
    case lists:keyfind(Aim, 1, Reward) of
      {Aim, Items, _AimStr} ->
	  reward(Holiday, Role, Aim, Items, Args);
      {Aim, _, Items, _AimStr} ->
	  reward(Holiday, Role, Aim, Items, Args);
      _ -> {error, lang:get(<<"没有对应奖励配置"/utf8>>)}
    end.

-spec reward(#holiday{}, #role{}, pos_integer(), list(),
	     map()) -> {error, binary()} | {ok, binary(), #role{}}.

reward(Holiday = #holiday{camp_id = CampId, bid = Bid},
       Role, Aim, Items, Args) ->
    case holiday_lib:get_tv_val(CampId, Bid, Role) of
      {AccVal, GetAimList} ->
	  case lists:keyfind(Aim, 1, GetAimList) of
	    {Aim, 1} ->
		NewGetAimList = lists:keystore(Aim, 1, GetAimList,
					       {Aim, 2}),
		NewArgs = Args#{aim => Aim, gain => Items,
				tv_val => {val, {AccVal, NewGetAimList}}},
		take_reward(Role, Holiday, NewArgs);
	    {Aim, 2} -> {error, lang:get(<<"您已领取过该奖励了"/utf8>>)};
	    _ -> {error, lang:get(<<"未满足领取奖励条件"/utf8>>)}
	  end;
      GetAimList ->
	  case lists:keyfind(Aim, 1, GetAimList) of
	    {Aim, 1} ->
		NewGetAimList = lists:keystore(Aim, 1, GetAimList,
					       {Aim, 2}),
		Args = #{aim => Aim, gain => Items,
			 tv_val => {val, NewGetAimList}},
		take_reward(Role, Holiday, Args);
	    {Aim, 2} -> {error, lang:get(<<"您已领取过该奖励了"/utf8>>)};
	    _ -> {error, lang:get(<<"未满足领取奖励条件"/utf8>>)}
	  end
    end.

-spec take_reward(#role{}, #holiday{}, map()) -> {ok,
						  binary(), #role{}} |
						 {error, binary()}.

take_reward(Role, Holiday, Args) ->
    take_reward(Role, Holiday, Args, [gl, take]).

-spec take_reward(#role{}, #holiday{}, map(),
		  Steps) -> {ok, binary(), #role{}} |
			    {error, binary()} when Steps :: [Step] | [],
						   Step :: take_reward_step().

take_reward(Role, Holiday, Args, Steps) ->
    case take_reward_step(Role, Holiday, Args, Steps) of
      {ok, NewArgs, NRole} ->
	  Msg = maps:get(gl_msg, NewArgs, <<>>), {ok, Msg, NRole};
      {error, Msg} -> {error, Msg}
    end.

-spec take_reward_step(#role{}, #holiday{}, map(),
		       Steps) -> {ok, map(), #role{}} |
				 {error, binary()} when Steps :: [Step] | [],
							Step ::
							    take_reward_step().

take_reward_step(Role, _Holiday, Args, []) ->
    {ok, Args, Role};
take_reward_step(Role,
		 Holiday = #holiday{camp_id = CampId, bid = Bid}, Args,
		 [Step | Rest]) ->
    case take_reward_step(Role, Holiday, Args, Step) of
      {ok, NRole} ->
	  take_reward_step(NRole, Holiday, Args, Rest);
      {ok, NArgs, NRole} ->
	  take_reward_step(NRole, Holiday, NArgs, Rest);
      {error, Msg} -> {error, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule209, _,
	     {__Levelholiday_rule209, __Tracesholiday_rule209}}
		when __Levelholiday_rule209 band 8 /= 0 orelse
		       __Tracesholiday_rule209 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule},
			      {function, take_reward_step}, {line, 209},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]无法领取[Bid:~w][CampId:~w]活动[Step:~w]奖励Err:~w",
					   [Role#role.name, Bid, CampId, Step,
					    Err]),
			     none, 4096, 8, __Levelholiday_rule209,
			     __Tracesholiday_rule209, lager_event,
			     __Pidholiday_rule209);
	    _ -> ok
	  end,
	  {error, lang:get(<<"领取活动奖励过程错误"/utf8>>)}
    end;
take_reward_step(Role,
		 Holiday = #holiday{camp_id = CampId, bid = Bid},
		 Args = #{aim := Aim}, Step = gl) ->
    Loss = format:val_to_loss(maps:get(loss, Args, []),
			      del_holiday),
    Gains = format:val_to_gain(maps:get(gain, Args, []),
			       make_holiday),
    GL = Loss ++ Gains,
    case role_gain:do(Role, GL, #gain_loss_opts{}) of
      {ok, NRole,
       NGlOpts = #gain_loss_opts{return_gl = NewGL}} ->
	  NewArgs = case maps:get(is_notice_msg, Args, false) of
		      pass -> pass;
		      true ->
			  Msg = format:gain_text(NewGL, NRole),
			  Args#{gl_msg => Msg};
		      _ ->
			  role_gain:gain_notice(NRole, NGlOpts,
						#gain_loss_opts{}),
			  Args
		    end,
	  log_reward(Role, NRole, Holiday, Aim, NewGL, Args),
	  {ok, NewArgs, NRole};
      {false, #gain{msg = Msg}} -> {error, Msg};
      {false, #loss{msg = Msg}} -> {error, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule232, _,
	     {__Levelholiday_rule232, __Tracesholiday_rule232}}
		when __Levelholiday_rule232 band 8 /= 0 orelse
		       __Tracesholiday_rule232 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule},
			      {function, take_reward_step}, {line, 232},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]处理的活动[Bid:~w][CampId:~w]流程[Step:~w]错误:~w",
					   [Role#role.name, Bid, CampId, Step,
					    Err]),
			     none, 4096, 8, __Levelholiday_rule232,
			     __Tracesholiday_rule232, lager_event,
			     __Pidholiday_rule232);
	    _ -> ok
	  end,
	  {error, lang:get(<<"活动损益操作有误"/utf8>>)}
    end;
take_reward_step(Role,
		 Holiday = #holiday{camp_id = CampId, bid = Bid}, Args,
		 take) ->
    case handle_tv_val(Role, Holiday, Args) of
      ok ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule238, _,
	     {__Levelholiday_rule238, __Tracesholiday_rule238}}
		when __Levelholiday_rule238 band 128 /= 0 orelse
		       __Tracesholiday_rule238 /= [] ->
		lager:do_log(debug,
			     [{module, holiday_rule},
			      {function, take_reward_step}, {line, 238},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]领取活动[Bid:~w][CampId:~w]奖励[Aim:~w]",
					   [Role#role.name, Bid, CampId,
					    maps:get(aim, Args, 0)]),
			     none, 4096, 128, __Levelholiday_rule238,
			     __Tracesholiday_rule238, lager_event,
			     __Pidholiday_rule238);
	    _ -> ok
	  end,
	  holiday:push_bid_can_reward(Role, Bid),
	  holiday_ico:push_ico(Role, Holiday),
	  {ok, Role};
      {ok, TvVal} ->
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NewRole = holiday_lib:set_tv_val(CampId, Role, TvVal,
					   ExpireSec),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule245, _,
	     {__Levelholiday_rule245, __Tracesholiday_rule245}}
		when __Levelholiday_rule245 band 128 /= 0 orelse
		       __Tracesholiday_rule245 /= [] ->
		lager:do_log(debug,
			     [{module, holiday_rule},
			      {function, take_reward_step}, {line, 245},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]领取活动[Bid:~w][CampId:~w]奖励[Aim:~w][timeou"
					   "t:~w]",
					   [Role#role.name, Bid, CampId,
					    maps:get(aim, Args, 0), ExpireSec]),
			     none, 4096, 128, __Levelholiday_rule245,
			     __Tracesholiday_rule245, lager_event,
			     __Pidholiday_rule245);
	    _ -> ok
	  end,
	  holiday:push_bid_can_reward(NewRole, Bid),
	  holiday_ico:push_ico(NewRole, Holiday),
	  {ok, NewRole};
      {error, Msg} -> {error, Msg}
    end;
take_reward_step(Role,
		 #holiday{bid = Bid, camp_id = CampId}, Args, Step) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule253, _,
       {__Levelholiday_rule253, __Tracesholiday_rule253}}
	  when __Levelholiday_rule253 band 8 /= 0 orelse
		 __Tracesholiday_rule253 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule}, {function, take_reward_step},
			{line, 253}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]未处理的活动[Bid:~w][CampId:~w]领取流程[Step:~w][A"
				     "rgs:~w]",
				     [Role#role.name, Bid, CampId, Step, Args]),
		       none, 4096, 8, __Levelholiday_rule253,
		       __Tracesholiday_rule253, lager_event,
		       __Pidholiday_rule253);
      _ -> ok
    end,
    {error, lang:get(<<"未知的领取奖励流程"/utf8>>)}.

-spec buy_reward(#role{}, #holiday{}, map()) -> {ok,
						 #role{}, map()}.

buy_reward(Role, Holiday, Args) ->
    buy_reward(Role, Holiday, Args, [gl, buy]).

-spec buy_reward(#role{}, #holiday{}, map(),
		 Steps) -> {ok, #role{}, map()} when Steps :: [Step] |
							      [],
						     Step :: buy_reward_step().

buy_reward(Role, Holiday, Args, Steps) ->
    case buy_reward_step(Role, Holiday, Args, Steps) of
      {ok, NRole, NewArgs} -> {ok, NRole, NewArgs};
      {error, _Msg} -> {ok, Role, Args}
    end.

-spec buy_reward_step(#role{}, #holiday{}, map(),
		      Steps) -> {ok, #role{}, map()} |
				{error, binary()} when Steps :: [Step] | [],
						       Step ::
							   buy_reward_step().

buy_reward_step(Role, _Holiday, Args, []) ->
    {ok, Role, Args};
buy_reward_step(Role,
		Holiday = #holiday{camp_id = CampId, bid = Bid}, Args,
		[Step | Rest]) ->
    case buy_reward_step(Role, Holiday, Args, Step) of
      {ok, NRole, NArgs} ->
	  buy_reward_step(NRole, Holiday, NArgs, Rest);
      {error, Msg} -> {error, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule285, _,
	     {__Levelholiday_rule285, __Tracesholiday_rule285}}
		when __Levelholiday_rule285 band 8 /= 0 orelse
		       __Tracesholiday_rule285 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule},
			      {function, buy_reward_step}, {line, 285},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]无法领取[Bid:~w][CampId:~w]活动[Step:~w]奖励Err:~w",
					   [Role#role.name, Bid, CampId, Step,
					    Err]),
			     none, 4096, 8, __Levelholiday_rule285,
			     __Tracesholiday_rule285, lager_event,
			     __Pidholiday_rule285);
	    _ -> ok
	  end,
	  {error, lang:get(<<"领取活动奖励过程错误"/utf8>>)}
    end;
buy_reward_step(Role,
		Holiday = #holiday{camp_id = CampId, bid = Bid},
		Args = #{aim := Aim}, gl) ->
    GainValL = maps:get(gain, Args, []),
    Gains = format:val_to_gain(GainValL, make_holiday),
    case role_gain:do(Role, Gains, #gain_loss_opts{}) of
      {ok, NRole,
       NGlOpts = #gain_loss_opts{return_gl = NewGL}} ->
	  NewArgs = case maps:get(is_notice_msg, Args, false) of
		      pass -> pass;
		      true ->
			  Msg = format:gain_text(NewGL, NRole),
			  Args#{gl_msg => Msg};
		      _ ->
			  role_gain:gain_notice(NRole, NGlOpts,
						#gain_loss_opts{}),
			  Args
		    end,
	  log_reward(Role, NRole, Holiday, Aim, NewGL, Args),
	  {ok, NRole, NewArgs};
      _Err ->
	  Title = lang:get(<<"活动奖励"/utf8>>),
	  Subject = lang:get(<<"以下是您直购活动的奖励，请查收！"/utf8>>),
	  Remark =
	      util:fbin("背包已满，邮件发放直购活动奖励Bid:~w,CampId:~w,Aim:~w",
			[Bid, CampId, Aim]),
	  {Assets, Items} = format:split_assets_items(GainValL),
	  {ok, NRole} = mail:add(Role,
				 {Title, Subject, Assets, Items, Remark}),
	  {ok, NRole, Args}
    end;
buy_reward_step(Role,
		Holiday = #holiday{camp_id = CampId, bid = Bid},
		Args = #{aim := Aim}, buy) ->
    case handle_tv_val(Role, Holiday, Args) of
      ok ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule315, _,
	     {__Levelholiday_rule315, __Tracesholiday_rule315}}
		when __Levelholiday_rule315 band 8 /= 0 orelse
		       __Tracesholiday_rule315 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule},
			      {function, buy_reward_step}, {line, 315},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]活动[Bid:~w][CampId:~w]直购[Aim:~w]不应该出现未保存活"
					   "动数据的情况",
					   [Role#role.name, Bid, CampId, Aim]),
			     none, 4096, 8, __Levelholiday_rule315,
			     __Tracesholiday_rule315, lager_event,
			     __Pidholiday_rule315);
	    _ -> ok
	  end,
	  {ok, Role, Args};
      {ok, TvVal} ->
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  TvRole = holiday_lib:set_tv_val(CampId, Role, TvVal,
					  ExpireSec),
	  NewRole = fire_evt_pay_acc(TvRole,
				     maps:get(opt, Args, #{}), Holiday),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule321, _,
	     {__Levelholiday_rule321, __Tracesholiday_rule321}}
		when __Levelholiday_rule321 band 128 /= 0 orelse
		       __Tracesholiday_rule321 /= [] ->
		lager:do_log(debug,
			     [{module, holiday_rule},
			      {function, buy_reward_step}, {line, 321},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]直购活动[Bid:~w][CampId:~w]奖励[Aim:~w][timeou"
					   "t:~w]",
					   [Role#role.name, Bid, CampId, Aim,
					    ExpireSec]),
			     none, 4096, 128, __Levelholiday_rule321,
			     __Tracesholiday_rule321, lager_event,
			     __Pidholiday_rule321);
	    _ -> ok
	  end,
	  holiday:push_bid_can_reward(NewRole, Bid),
	  holiday_lib:push_holiday_one(NewRole, Bid),
	  holiday_ico:push_ico(NewRole, Holiday),
	  {ok, NewRole, Args};
      {error, Msg} -> {error, Msg}
    end;
buy_reward_step(Role,
		#holiday{bid = Bid, camp_id = CampId}, Args, Step) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule330, _,
       {__Levelholiday_rule330, __Tracesholiday_rule330}}
	  when __Levelholiday_rule330 band 8 /= 0 orelse
		 __Tracesholiday_rule330 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule}, {function, buy_reward_step},
			{line, 330}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]未处理的直购活动[Bid:~w][CampId:~w]领取流程[Step:~w]"
				     "[Args:~w]",
				     [Role#role.name, Bid, CampId, Step, Args]),
		       none, 4096, 8, __Levelholiday_rule330,
		       __Tracesholiday_rule330, lager_event,
		       __Pidholiday_rule330);
      _ -> ok
    end,
    {error, lang:get(<<"未知的直购奖励流程"/utf8>>)}.

-spec to_gold(#role{}, map(), #holiday{}) -> {ok,
					      #role{}, map()}.

to_gold(Role, Opt,
	#holiday{bid = Bid, camp_id = CampId}) ->
    {ok, NewRole, Opt} = charge_lib:to_gold(Role, Opt,
					    #{holiday_bid => Bid,
					      holiday_id => CampId}),
    {ok, NewRole, Opt}.

-spec is_gain_reward(#role{}, #holiday{}) -> boolean().

is_gain_reward(Role,
	       #holiday{reward = [{_PackageId, Reward}], bid = Bid,
			camp_id = CampId, tbid = Tbid})
    when Tbid =:= 1003 orelse Tbid =:= 1008 ->
    GetAimList = case holiday_lib:get_tv_val(CampId, Bid,
					     Role)
		     of
		   List when is_list(List) -> List;
		   {_Acc, List} when is_list(List) -> List;
		   Err ->
		       case {whereis(lager_event), whereis(lager_event),
			     lager_config:get({lager_event, loglevel}, {0, []})}
			   of
			 {undefined, undefined, _} ->
			     fun () -> {error, lager_not_running} end();
			 {undefined, _, _} ->
			     fun () ->
				     {error, {sink_not_configured, lager_event}}
			     end();
			 {__Pidholiday_rule346, _,
			  {__Levelholiday_rule346, __Tracesholiday_rule346}}
			     when __Levelholiday_rule346 band 8 /= 0 orelse
				    __Tracesholiday_rule346 /= [] ->
			     lager:do_log(error,
					  [{module, holiday_rule},
					   {function, is_gain_reward},
					   {line, 346},
					   {pid, pid_to_list(self())},
					   {node, node()}
					   | lager:md()],
					  io_lib:format("[~ts]判断是否已领取完奖励错误:~w",
							[Role#role.name, Err]),
					  none, 4096, 8, __Levelholiday_rule346,
					  __Tracesholiday_rule346, lager_event,
					  __Pidholiday_rule346);
			 _ -> ok
		       end,
		       []
		 end,
    Fun = fun (Term) when is_tuple(Term) ->
		  Aim = element(1, Term),
		  case lists:keyfind(Aim, 1, GetAimList) of
		    {Aim, 2} -> true;
		    _ -> false
		  end;
	      (_) -> false
	  end,
    lists:all(Fun, Reward);
is_gain_reward(Role,
	       #holiday{reward = Reward, bid = Bid, camp_id = CampId,
			tbid = TBid})
    when TBid =:= 1014 orelse
	   TBid =:= 1015 orelse
	     TBid =:= 1016 orelse
	       TBid =:= 1017 orelse
		 TBid =:= 1018 orelse
		   TBid =:= 1019 orelse TBid =:= 1020 ->
    GetAimList = case holiday_lib:get_tv_val(CampId, Bid,
					     Role)
		     of
		   List when is_list(List) -> List;
		   {_Acc, List} when is_list(List) -> List;
		   Err ->
		       case {whereis(lager_event), whereis(lager_event),
			     lager_config:get({lager_event, loglevel}, {0, []})}
			   of
			 {undefined, undefined, _} ->
			     fun () -> {error, lager_not_running} end();
			 {undefined, _, _} ->
			     fun () ->
				     {error, {sink_not_configured, lager_event}}
			     end();
			 {__Pidholiday_rule366, _,
			  {__Levelholiday_rule366, __Tracesholiday_rule366}}
			     when __Levelholiday_rule366 band 8 /= 0 orelse
				    __Tracesholiday_rule366 /= [] ->
			     lager:do_log(error,
					  [{module, holiday_rule},
					   {function, is_gain_reward},
					   {line, 366},
					   {pid, pid_to_list(self())},
					   {node, node()}
					   | lager:md()],
					  io_lib:format("[~ts]判断是否已领取完奖励错误:~w",
							[Role#role.name, Err]),
					  none, 4096, 8, __Levelholiday_rule366,
					  __Tracesholiday_rule366, lager_event,
					  __Pidholiday_rule366);
			 _ -> ok
		       end,
		       []
		 end,
    Fun = fun (Term) when is_tuple(Term) ->
		  Aim = element(1, Term),
		  case lists:member(Aim, GetAimList) of
		    true -> true;
		    _ -> false
		  end;
	      (_) -> false
	  end,
    lists:all(Fun, Reward);
is_gain_reward(Role,
	       #holiday{reward = Reward, bid = Bid, camp_id = CampId,
			tbid = TBid})
    when TBid =:= 1046 ->
    case holiday_lib:get_tv_val(CampId, Bid, Role) of
      BuyNum when is_integer(BuyNum) andalso BuyNum >= 1 ->
	  true;
      _ -> false
    end;
is_gain_reward(Role,
	       #holiday{reward = Reward, bid = Bid,
			camp_id = CampId}) ->
    GetAimList = case holiday_lib:get_tv_val(CampId, Bid,
					     Role)
		     of
		   List when is_list(List) -> List;
		   {_Acc, List} when is_list(List) -> List;
		   Err ->
		       case {whereis(lager_event), whereis(lager_event),
			     lager_config:get({lager_event, loglevel}, {0, []})}
			   of
			 {undefined, undefined, _} ->
			     fun () -> {error, lager_not_running} end();
			 {undefined, _, _} ->
			     fun () ->
				     {error, {sink_not_configured, lager_event}}
			     end();
			 {__Pidholiday_rule389, _,
			  {__Levelholiday_rule389, __Tracesholiday_rule389}}
			     when __Levelholiday_rule389 band 8 /= 0 orelse
				    __Tracesholiday_rule389 /= [] ->
			     lager:do_log(error,
					  [{module, holiday_rule},
					   {function, is_gain_reward},
					   {line, 389},
					   {pid, pid_to_list(self())},
					   {node, node()}
					   | lager:md()],
					  io_lib:format("[~ts]判断是否已领取完奖励错误:~w",
							[Role#role.name, Err]),
					  none, 4096, 8, __Levelholiday_rule389,
					  __Tracesholiday_rule389, lager_event,
					  __Pidholiday_rule389);
			 _ -> ok
		       end,
		       []
		 end,
    Fun = fun (Term) when is_tuple(Term) ->
		  Aim = element(1, Term),
		  case lists:keyfind(Aim, 1, GetAimList) of
		    {Aim, 2} -> true;
		    _ -> false
		  end;
	      (_) -> false
	  end,
    lists:all(Fun, Reward).

-spec make_cfg_cond_ext(term()) -> [{integer(),
				     integer(), binary()}].

make_cfg_cond_ext({lev, Lev}) -> [{200, Lev, <<>>}];
make_cfg_cond_ext([]) -> [];
make_cfg_cond_ext(Conds = [_ | _]) ->
    make_cfg_cond_ext(Conds, []).

make_cfg_cond_ext([], Acc) -> Acc;
make_cfg_cond_ext([H | T], Acc) ->
    KvL = make_cfg_cond_ext(H),
    make_cfg_cond_ext(T, KvL ++ Acc).

-spec check_cfg_conds(#role{}, #holiday{}, map(),
		      term() | list()) -> ok | {false, binary()}.

check_cfg_conds(#role{lev = Lev}, _Holiday, _Args,
		{lev, LevCfg}) ->
    case Lev >= LevCfg of
      true -> ok;
      _ -> {false, lang:get(<<"等级不足"/utf8>>)}
    end;
check_cfg_conds(_Role, _Holiday, _Args, []) -> ok;
check_cfg_conds(Role, Holiday, Args, [Cond | Rest]) ->
    case check_cfg_conds(Role, Holiday, Args, Cond) of
      ok -> check_cfg_conds(Role, Holiday, Args, Rest);
      {false, Msg} -> {false, Msg}
    end;
check_cfg_conds(Role,
		#holiday{camp_id = CampId, bid = Bid}, _Args, Unknow) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule428, _,
       {__Levelholiday_rule428, __Tracesholiday_rule428}}
	  when __Levelholiday_rule428 band 8 /= 0 orelse
		 __Tracesholiday_rule428 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule}, {function, check_cfg_conds},
			{line, 428}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]无法检查未知活动[CampId:~w][Bid:~w]条件:~w",
				     [Role#role.name, CampId, Bid, Unknow]),
		       none, 4096, 8, __Levelholiday_rule428,
		       __Tracesholiday_rule428, lager_event,
		       __Pidholiday_rule428);
      _ -> ok
    end,
    {false, lang:get(<<"未知条件"/utf8>>)}.

handle_tv_val(_Role, _Holiday, #{tv_val := ok}) -> ok;
handle_tv_val(_Role, _Holiday,
	      #{tv_val := {val, TvVal}}) ->
    {ok, TvVal};
handle_tv_val(Role,
	      #holiday{bid = Bid, camp_id = CampId},
	      Args = #{tv_val := {func, TvVal}}) ->
    Rtn = case TvVal of
	    {Fun} -> catch erlang:apply(Fun, []);
	    {Mod, Fun, FunArgs} ->
		catch erlang:apply(Mod, Fun, FunArgs);
	    Unknow -> {unknow, Unknow}
	  end,
    case Rtn of
      {ok, NTvVal} -> {ok, NTvVal};
      {error, Msg} -> {error, Msg};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule452, _,
	     {__Levelholiday_rule452, __Tracesholiday_rule452}}
		when __Levelholiday_rule452 band 8 /= 0 orelse
		       __Tracesholiday_rule452 /= [] ->
		lager:do_log(error,
			     [{module, holiday_rule}, {function, handle_tv_val},
			      {line, 452}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]更新活动变量值失败[Bid:~w][CampId:~w][Args:~w][Er"
					   "r:~w]",
					   [Role#role.name, Bid, CampId, Args,
					    Err]),
			     none, 4096, 8, __Levelholiday_rule452,
			     __Tracesholiday_rule452, lager_event,
			     __Pidholiday_rule452);
	    _ -> ok
	  end,
	  {error, lang:get(<<"更新活动变量值失败"/utf8>>)}
    end;
handle_tv_val(Role,
	      #holiday{bid = Bid, camp_id = CampId}, Args) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule456, _,
       {__Levelholiday_rule456, __Tracesholiday_rule456}}
	  when __Levelholiday_rule456 band 8 /= 0 orelse
		 __Tracesholiday_rule456 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule}, {function, handle_tv_val},
			{line, 456}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]无法更新活动变量值[Bid:~w][CampId:~w][Args:~w]",
				     [Role#role.name, Bid, CampId, Args]),
		       none, 4096, 8, __Levelholiday_rule456,
		       __Tracesholiday_rule456, lager_event,
		       __Pidholiday_rule456);
      _ -> ok
    end,
    {error, lang:get(<<"无法更新未知的活动变量值"/utf8>>)}.

fire_evt_pay_acc(Role,
		 Opt = #{money := Money, currency_type := CurrencyType,
			 gold := Gold},
		 #holiday{camp_id = CampId, bid = Bid}) ->
    case Gold > 0 of
      false ->
	  CalcGold = charge_lib:currency_to_gold(CurrencyType,
						 Money),
	  role_trigger:fire(#evt_pay_acc{gold = CalcGold}, Role);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_rule472, _,
	     {__Levelholiday_rule472, __Tracesholiday_rule472}}
		when __Levelholiday_rule472 band 64 /= 0 orelse
		       __Tracesholiday_rule472 /= [] ->
		lager:do_log(info,
			     [{module, holiday_rule},
			      {function, fire_evt_pay_acc}, {line, 472},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("[~ts]直购活动[Bid:~w][CampId:~w]还能获得蓝钻？opt:~w",
					   [Role#role.name, Bid, CampId, Opt]),
			     none, 4096, 64, __Levelholiday_rule472,
			     __Tracesholiday_rule472, lager_event,
			     __Pidholiday_rule472);
	    _ -> ok
	  end,
	  Role
    end;
fire_evt_pay_acc(Role, Opt,
		 #holiday{bid = Bid, camp_id = CampId}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_rule476, _,
       {__Levelholiday_rule476, __Tracesholiday_rule476}}
	  when __Levelholiday_rule476 band 8 /= 0 orelse
		 __Tracesholiday_rule476 /= [] ->
	  lager:do_log(error,
		       [{module, holiday_rule}, {function, fire_evt_pay_acc},
			{line, 476}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~ts]直购活动[Bid:~w][CampId:~w]触发累充事件失败:~w",
				     [Role#role.name, Bid, CampId, Opt]),
		       none, 4096, 8, __Levelholiday_rule476,
		       __Tracesholiday_rule476, lager_event,
		       __Pidholiday_rule476);
      _ -> ok
    end,
    Role.

log_reward(Role, NRole,
	   #holiday{tbid = 1021, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_积天豪礼"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1022, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_累计充值"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1052, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_新累计充值"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1054, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_新累计充值2"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1023, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_累计消费"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1006, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_礼包抢购"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1008, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_成长基金"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1026, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_限时商城"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1028, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_累计充值2"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1035, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_限时商城"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1037, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_高级召唤豪礼"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1038, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_先知召唤豪礼"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1039, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_合服商城"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1041, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_合服首充"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1045, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_累计充值3"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1048, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_限时商城3"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{tbid = 1053, camp_id = CampId, bid = Bid}, Aim,
	   GL, _Args) ->
    log:log_gain(GL, Role, NRole, <<"运营活动_新手礼包直购商城"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok;
log_reward(Role, NRole,
	   #holiday{camp_id = CampId, bid = Bid}, Aim, GL,
	   _Args) ->
    log:log_gain(GL, Role, NRole, <<"活动"/utf8>>,
		 util:fbin("活动:~w:~w:~w", [Bid, CampId, Aim])),
    ok.


