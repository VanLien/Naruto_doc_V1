-file("src/mod/holiday_petard/holiday_petard.erl", 1).

-module(holiday_petard).

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
		{avatar_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{avatar_frame, [ver, base_id, expire_time]},
		{m_avatar, [ver, used, frames]},
		{s_timer, [ref, timers]}, {rtimer, [ref, key, timers]},
		{timer,
		 [id, timeout, m, f, a, times, next_tick, set_time]},
		{gain_loss_opts,
		 [title, return_gl, is_continue, order, gain_tag,
		  loss_tag, split_str, split_op_str, type, is_auto_buy,
		  need_notify_fail_item, log_name]},
		{loss, [label, val, own_val, msg, flag, reason, ext]},
		{gain,
		 [label, val, msg, flag, reason, ext, notice, move_to]},
		{self_add_info,
		 [id, time, score, status, total_time, interval]},
		{get_red_packet_info,
		 [r_id, red_id, name, lev, face_id, avatar_bid, time,
		  item]},
		{petard_red_packet,
		 [id, rid, name, face_id, avatar_bid, num, max_num,
		  is_max, mems, must_not, start_time, end_time, msg_id]},
		{m_holiday_petard,
		 [ver, camp_id, end_time, get_red_count, send_red_count,
		  send_notice, must_not_small, must_not_big,
		  petard_reward, red_packet_info, get_red_info]},
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

-export([init/0, login/1, ready/1, apply_timer/1,
	 zero_flush/1, push/1, apply_ref_petard_reward/1,
	 push_fire/2, push_red_packet/1,
	 push_red_packet_broadcast/1, red_packet_info/1,
	 send_notice/1, do_use_petard/3, use_petard/3,
	 get_petard_score_award/2, get_petard_award/4,
	 get_red_packet/2]).

-export([gm_red_past_time/1]).

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

-file("src/mod/holiday_petard/holiday_petard.erl", 30).

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

-file("src/mod/holiday_petard/holiday_petard.erl", 31).

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

-file("src/mod/holiday_petard/holiday_petard.erl", 32).

-file("inc/holiday_petard.hrl", 1).

-record(m_holiday_petard,
	{ver = 2, camp_id = 0, end_time = 0, get_red_count = 0,
	 send_red_count = 0, send_notice = 0,
	 must_not_small = [], must_not_big = [],
	 petard_reward = [], red_packet_info = [],
	 get_red_info = []}).

-record(petard_red_packet,
	{id = 0, rid = {0, <<>>}, name = <<>>, face_id = 0,
	 avatar_bid = 0, num = 0, max_num = 0, is_max = 0,
	 mems = [], must_not = [], start_time = 0, end_time = 0,
	 msg_id = 0}).

-record(get_red_packet_info,
	{r_id = {0, <<>>}, red_id = 0, name = <<>>, lev = 0,
	 face_id = 0, avatar_bid = 0, time = 0, item = []}).

-record(self_add_info,
	{id = 0, time = 0, score = 0, status = 0,
	 total_time = 0, interval = 0}).

-file("src/mod/holiday_petard/holiday_petard.erl", 33).

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

-file("src/mod/holiday_petard/holiday_petard.erl", 34).

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

-file("src/mod/holiday_petard/holiday_petard.erl", 35).

-file("inc/avatar.hrl", 1).

-record(m_avatar, {ver = 1, used = 0, frames = []}).

-record(avatar_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(avatar_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-file("src/mod/holiday_petard/holiday_petard.erl", 36).

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

-file("src/mod/holiday_petard/holiday_petard.erl", 37).

gm_red_past_time(#role{m_holiday_petard =
			   #m_holiday_petard{red_packet_info = RedInfo}}) ->
    Now = date:unixtime(),
    Fun = fun ({Id, _}) ->
		  case ets:lookup(petard_red_packet, Id) of
		    [RedPacket = #petard_red_packet{} | _] ->
			NewRedPacket = RedPacket#petard_red_packet{end_time =
								       Now - 1},
			d_ets_lib:save_d_ets(petard_red_packet, NewRedPacket);
		    _ -> skip
		  end
	  end,
    lists:foreach(Fun, RedInfo).

-spec init() -> #m_holiday_petard{}.

init() -> #m_holiday_petard{}.

-spec login(#role{}) -> {ok, #role{}}.

login(Role = #role{m_holiday_petard =
		       MHolidayPetard = #m_holiday_petard{camp_id =
							      CampId}}) ->
    NewRole = case holiday_lib:get_open_holiday(Role,
						[3037, 93037, 993037])
		  of
		#holiday{camp_id = CampId} ->
		    NRole = set_time(Role), NRole;
		#holiday{camp_id = NewCampId, end_time = EndTime} ->
		    NewMHolidayPetard =
			MHolidayPetard#m_holiday_petard{camp_id = NewCampId,
							end_time = EndTime,
							get_red_count = 0,
							send_red_count = 0,
							send_notice = 0,
							must_not_small = [],
							must_not_big = [],
							petard_reward = [],
							red_packet_info = [],
							get_red_info = []},
		    NRole = Role#role{m_holiday_petard = NewMHolidayPetard},
		    NRole1 = set_time(NRole),
		    NRole2 = item_reward_mail(NRole1),
		    NRole2;
		_ -> NRole = item_reward_mail(Role), NRole
	      end,
    push_red_packet(NewRole),
    {ok, NewRole}.

-spec ready(#role{}) -> {ok, #role{}}.

ready(Role) ->
    push_red_packet(Role),
    {ok, NRole} = send_notice(Role),
    {ok, NRole}.

set_time(Role) ->
    Now = date:unixtime(),
    Time1 = (date:unixtime(zero) +
	       3600 * holiday_petard_data:get_const(petard_start_time)
	       - Now)
	      * 1000,
    Time2 = (date:unixtime(zero) +
	       3600 *
		 (24 + holiday_petard_data:get_const(petard_start_time))
	       - Now)
	      * 1000,
    Time = util:if_true(Time1 > 0, Time1, Time2),
    Timer1 = #timer{id = petard_notice, timeout = Time,
		    times = 1, m = holiday_petard, f = apply_timer, a = []},
    NewRole = role_timer:set(Timer1, Role),
    NewRole.

apply_timer(Role = #role{m_holiday_petard =
			     MHolidayPetard = #m_holiday_petard{send_notice =
								    Flag}}) ->
    NewRole = case Flag of
		0 ->
		    case holiday_lib:get_open_holiday(Role,
						      [3037, 93037, 993037])
			of
		      #holiday{} ->
			  sys_conn:pack_send(27005, {1, <<>>}),
			  NewMHolidayPetard =
			      MHolidayPetard#m_holiday_petard{send_notice = 1},
			  NRole = Role#role{m_holiday_petard =
						NewMHolidayPetard},
			  NRole1 = set_time(NRole),
			  NRole1;
		      _ -> Role
		    end;
		_ -> Role
	      end,
    {ok, NewRole}.

-spec zero_flush(#role{}) -> {ok, #role{}}.

zero_flush(Role = #role{m_holiday_petard =
			    MHolidayPetard = #m_holiday_petard{camp_id =
								   CampId}}) ->
    NewRole = case holiday_lib:get_open_holiday(Role,
						[3037, 93037, 993037])
		  of
		#holiday{camp_id = CampId} ->
		    NewMHolidayPetard =
			MHolidayPetard#m_holiday_petard{get_red_count = 0,
							send_red_count = 0,
							send_notice = 0,
							red_packet_info = []},
		    NRole = Role#role{m_holiday_petard = NewMHolidayPetard},
		    NRole;
		#holiday{camp_id = NewCampId, end_time = EndTime} ->
		    NewMHolidayPetard =
			MHolidayPetard#m_holiday_petard{camp_id = NewCampId,
							end_time = EndTime,
							get_red_count = 0,
							send_red_count = 0,
							send_notice = 0,
							must_not_small = [],
							must_not_big = [],
							petard_reward = [],
							red_packet_info = [],
							get_red_info = []},
		    NRole = Role#role{m_holiday_petard = NewMHolidayPetard},
		    NRole;
		_ ->
		    NewMHolidayPetard =
			MHolidayPetard#m_holiday_petard{get_red_count = 0,
							send_red_count = 0,
							send_notice = 0,
							red_packet_info = []},
		    NRole = Role#role{m_holiday_petard = NewMHolidayPetard},
		    NRole
	      end,
    push_red_packet(NewRole),
    {ok, NewRole}.

item_reward_mail(Role = #role{holiday_assets =
				  HolidayAssets}) ->
    HolidayAssets1 =
	lists:keydelete(holiday_petard_data:get_const(petard_score),
			1, HolidayAssets),
    Role1 = Role#role{holiday_assets = HolidayAssets1},
    {_, MeteorNum} = package:count(by_base_id,
				   holiday_petard_data:get_const(meteor_bid),
				   Role#role.p_bag),
    {_, FireworkNum} = package:count(by_base_id,
				     holiday_petard_data:get_const(firework_bid),
				     Role#role.p_bag),
    Expend = [{holiday_petard_data:get_const(meteor_bid),
	       MeteorNum},
	      {holiday_petard_data:get_const(firework_bid),
	       FireworkNum}],
    Loss = format:val_to_loss(Expend,
			      holiday_petard_item_reward),
    NewRole = case role_gain:do(Role1, Loss) of
		{ok, NRole} ->
		    log:log_gain(Loss, Role1, NRole, <<"花火大会道具返还"/utf8>>,
				 util:fbin(<<"[{道具id,数量}]:~w"/utf8>>,
					   [Expend])),
		    {MId, MNum} =
			holiday_petard_data:get_const(meteor_item_reward),
		    {FId, FNum} =
			holiday_petard_data:get_const(firework_item_reward),
		    MeteorReward = util:if_true(MeteorNum =/= 0,
						[{MId, MNum * MeteorNum}], []),
		    FireWorkReward = util:if_true(FireworkNum =/= 0,
						  [{FId, FNum * FireworkNum}],
						  []),
		    RewardList = item_lib:merge(MeteorReward,
						FireWorkReward),
		    case RewardList of
		      [_ | _] ->
			  {Assets, Items} =
			      format:split_assets_items(RewardList),
			  {ok, Role2} = mail:add(NRole,
						 {util:fbin(lang:get(<<"花火大会道具返还"/utf8>>),
							    []),
						  color:msg(lang:get(<<"亲爱的冒险者大人：\n这是您在~ts活动尚未使用的流星弹和礼花炮道具的补偿，请查收"/utf8>>),
							    [{green,
							      lang:get(<<"花火大会"/utf8>>)}]),
						  Assets, Items,
						  <<"花火大会道具返还"/utf8>>,
						  86400 + date:unixtime()}),
			  Role2;
		      _ -> NRole
		    end;
		_ -> Role1
	      end,
    NewRole.

-spec push(#role{}) -> {ok, #role{}, pos_integer(),
			pos_integer(), pos_integer(), term()}.

push(Role = #role{m_holiday_petard =
		      MHolidayPetard = #m_holiday_petard{end_time = EndTime,
							 petard_reward =
							     PetardReward}}) ->
    TotalScore = sys_env:get(total_petard_score, 0),
    BaseMaxScore =
	holiday_petard_data:get_const(base_max_score),
    MaxScore = sys_env:get(real_max_score, BaseMaxScore),
    NewPetardReward = ref_petard_reward(TotalScore,
					PetardReward),
    NewRole = Role#role{m_holiday_petard =
			    MHolidayPetard#m_holiday_petard{petard_reward =
								NewPetardReward}},
    {ok, NewRole, EndTime, TotalScore, MaxScore,
     NewPetardReward}.

-spec apply_ref_petard_reward(#role{}) -> {ok, #role{}}.

apply_ref_petard_reward(Role = #role{m_holiday_petard =
					 MHolidayPetard =
					     #m_holiday_petard{end_time =
								   EndTime,
							       petard_reward =
								   PetardReward}}) ->
    TotalScore = sys_env:get(total_petard_score, 0),
    BaseMaxScore =
	holiday_petard_data:get_const(base_max_score),
    MaxScore = sys_env:get(real_max_score, BaseMaxScore),
    NewPetardReward = ref_petard_reward(TotalScore,
					PetardReward),
    NewRole = Role#role{m_holiday_petard =
			    MHolidayPetard#m_holiday_petard{petard_reward =
								NewPetardReward}},
    holiday:push_bid_can_reward(NewRole, 93037),
    sys_conn:pack_send(27000,
		       {EndTime, TotalScore, MaxScore, NewPetardReward}),
    {ok, NewRole}.

-spec push_fire(#role{}, term()) -> ok.

push_fire(#role{id = Rid}, SendRid) ->
    Msg = case Rid =:= SendRid of
	    true -> <<>>;
	    _ -> lang:get(<<"有玩家发放了全服红包，请点击主城左下角的红包!"/utf8>>)
	  end,
    sys_conn:pack_send(27008, {1, Msg}),
    ok.

-spec push_red_packet(#role{}) -> ok.

push_red_packet(Role = #role{m_holiday_petard =
				 #m_holiday_petard{get_red_count = GetRedCount,
						   get_red_info =
						       GetRedInfo}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3037, 93037, 993037])
	of
      #holiday{} ->
	  case GetRedCount <
		 holiday_petard_data:get_const(max_day_get_num)
	      of
	    true ->
		RedPacketList = get_red_packet_list(),
		Flag = del_take_red(RedPacketList, GetRedInfo),
		case RedPacketList =/= [] andalso Flag =:= true of
		  true ->
		      sys_conn:pack_send(27004,
					 {2,
					  lang:get(<<"有玩家发放了全服红包，请点击主城左下角的红包!"/utf8>>)});
		  _ ->
		      sys_conn:pack_send(27004,
					 {1, lang:get(<<"无可领取的红包"/utf8>>)})
		end;
	    _ ->
		sys_conn:pack_send(27004,
				   {1, lang:get(<<"已超过今日领取上限"/utf8>>)})
	  end;
      _ ->
	  sys_conn:pack_send(27004,
			     {0, lang:get(<<"活动未开启"/utf8>>)})
    end,
    ok.

del_take_red(RedPacketList, GetRedInfo) ->
    Fun = fun (Id, Acc) ->
		  case lists:keyfind(Id, #petard_red_packet.id, Acc) of
		    Red = #petard_red_packet{} -> Acc -- [Red];
		    _ -> Acc
		  end
	  end,
    NewRedPacketList = lists:foldl(Fun, RedPacketList,
				   GetRedInfo),
    case NewRedPacketList of
      [_ | _] -> true;
      _ -> false
    end.

-spec push_red_packet_broadcast(#role{}) -> ok.

push_red_packet_broadcast(_Role) ->
    BroadCastList = sys_env:get(red_packet_broadcast, []),
    sys_conn:pack_send(27006, {BroadCastList}),
    ok.

-spec red_packet_info(#role{}) -> {ok, #role{}, term(),
				   pos_integer(), pos_integer()}.

red_packet_info(Role = #role{id = Rid,
			     m_holiday_petard =
				 MHolidayPetard =
				     #m_holiday_petard{red_packet_info =
							   RedPacketInfo,
						       get_red_info =
							   GetRedInfo}}) ->
    push_red_packet(Role),
    case holiday_lib:get_open_holiday(Role,
				      [3037, 93037, 993037])
	of
      #holiday{} ->
	  RedPacketTakeList = [Info
			       || Info = {_, Status} <- RedPacketInfo,
				  Status =:= 2],
	  SelfRedPacketList =
	      lists:keysort(#petard_red_packet.start_time,
			    get_self_red_packet_list(Rid)),
	  RedPacketActList =
	      lists:keysort(#petard_red_packet.start_time,
			    get_red_packet_list()),
	  TakeLength = length(RedPacketTakeList),
	  MaxTakeLength =
	      holiday_petard_data:get_const(max_day_get_num),
	  Fun1 = fun (#petard_red_packet{id = Id}, Acc) ->
			 case lists:member(Id, GetRedInfo) =:= false of
			   true -> [{Id, 1} | Acc];
			   _ -> Acc
			 end
		 end,
	  SelfLength = max(0, MaxTakeLength - TakeLength),
	  SelfRedPacketInfo = lists:sublist(lists:foldl(Fun1, [],
							SelfRedPacketList),
					    SelfLength),
	  RedPacketActInfo = lists:foldl(Fun1, [],
					 RedPacketActList),
	  Length = max(0,
		       MaxTakeLength - TakeLength - length(SelfRedPacketInfo)),
	  Fun2 = fun (Red = {Id, _}, Acc) ->
			 case lists:keyfind(Id, 1, Acc) of
			   false -> Acc;
			   _ -> Acc -- [Red]
			 end
		 end,
	  RedPacketActInfo1 = lists:sublist(lists:foldl(Fun2,
							RedPacketActInfo,
							SelfRedPacketInfo),
					    Length),
	  NewRedPacketInfo = RedPacketTakeList ++
			       SelfRedPacketInfo ++ RedPacketActInfo1,
	  ReturnInfo = covert_info(NewRedPacketInfo),
	  NewRole = Role#role{m_holiday_petard =
				  MHolidayPetard#m_holiday_petard{red_packet_info
								      =
								      NewRedPacketInfo}},
	  {ok, NewRole, ReturnInfo, TakeLength, MaxTakeLength};
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

covert_info(NewRedPacketInfo) ->
    Fun3 = fun ({Id, Status}, Acc) ->
		   case ets:lookup(petard_red_packet, Id) of
		     [#petard_red_packet{msg_id = MsgId, name = Name} | _] ->
			 [{Id, MsgId, Name, Status} | Acc];
		     _ -> Acc
		   end
	   end,
    ReturnInfo = lists:foldl(Fun3, [], NewRedPacketInfo),
    ReturnInfo.

get_red_packet_list() ->
    Now = date:unixtime(),
    List = ets:match_object(petard_red_packet,
			    #petard_red_packet{is_max = 0, _ = '_'}),
    Fun = fun (#petard_red_packet{end_time = EndTime}) ->
		  EndTime > Now
	  end,
    NewList = lists:filter(Fun, List),
    NewList.

get_self_red_packet_list(Rid) ->
    Now = date:unixtime(),
    List = ets:match_object(petard_red_packet,
			    #petard_red_packet{is_max = 0, rid = Rid, _ = '_'}),
    Fun = fun (#petard_red_packet{end_time = EndTime}) ->
		  EndTime > Now
	  end,
    NewList = lists:filter(Fun, List),
    NewList.

-spec send_notice(#role{}) -> {ok, #role{}} |
			      {false, binary()}.

send_notice(Role = #role{m_holiday_petard =
			     MHolidayPetard = #m_holiday_petard{send_notice =
								    Flag}}) ->
    case holiday_lib:get_open_holiday(Role,
				      [3037, 93037, 993037])
	of
      #holiday{} ->
	  Now = date:unixtime(),
	  StartTime = date:unixtime(zero) +
			3600 * holiday_petard_data:get_const(petard_start_time),
	  EndTime = date:unixtime(zero) +
		      3600 * holiday_petard_data:get_const(petard_end_time),
	  case Now >= StartTime andalso Now =< EndTime of
	    true when Flag =:= 0 ->
		NewMHolidayPetard =
		    MHolidayPetard#m_holiday_petard{send_notice = 1},
		NRole = Role#role{m_holiday_petard = NewMHolidayPetard},
		sys_conn:pack_send(27005, {1, <<>>}),
		{ok, NRole};
	    _ -> {ok, Role}
	  end;
      _ -> {ok, Role}
    end.

do_use_petard(Role, Id, Num) ->
    Type1 = holiday_petard_data:get_const(meteor_bid),
    Type2 = holiday_petard_data:get_const(firework_bid),
    case Id of
      Type1 -> use_petard(Role, 1, Num);
      Type2 ->
	  Now = date:unixtime(),
	  Time1 = date:unixtime(zero) +
		    3600 * holiday_petard_data:get_const(petard_start_time),
	  Time2 = date:unixtime(zero) +
		    3600 * holiday_petard_data:get_const(petard_end_time),
	  case Now > Time1 andalso Now < Time2 of
	    true -> use_petard(Role, 2, Num);
	    _ -> {false, lang:get(<<"请在19:00-23:00之间使用"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"无法使用该物品"/utf8>>)}
    end.

-spec use_petard(#role{}, pos_integer(),
		 pos_integer()) -> {ok, #role{}} | {false, binary()}.

use_petard(Role = #role{m_holiday_petard =
			    MHolidayPetard = #m_holiday_petard{end_time =
								   EndTime,
							       must_not_small =
								   MustNotSmall,
							       petard_reward =
								   PetardReward}},
	   1, Num) ->
    case holiday_lib:get_open_holiday(Role,
				      [3037, 93037, 993037])
	of
      #holiday{} ->
	  {NewMustNotSmall, RewardList} =
	      get_petard_award(holiday_petard_data:get_const(meteor_bid),
			       MustNotSmall, Num, []),
	  Loss =
	      format:val_to_loss([{holiday_petard_data:get_const(meteor_bid),
				   Num}],
				 holiday_petard_meteor_expend),
	  Gain = format:val_to_gain(RewardList,
				    holiday_petard_meteor_award),
	  case role_gain:do_notice(Role, Loss ++ Gain) of
	    {ok, NRole} ->
		case holiday_petard_mgr:call({add_score,
					      holiday_petard_data:get_const(meteor_bid),
					      Num})
		    of
		  NewScore when is_integer(NewScore) ->
		      log:log_gain(Loss ++ Gain, Role, NRole,
				   <<"花火大会使用烟花"/utf8>>,
				   util:fbin(<<"烟花id:~w, 数量:~w"/utf8>>,
					     [holiday_petard_data:get_const(meteor_bid),
					      Num])),
		      NewPetardReward = ref_petard_reward(NewScore,
							  PetardReward),
		      BaseMaxScore =
			  holiday_petard_data:get_const(base_max_score),
		      MaxScore = sys_env:get(real_max_score, BaseMaxScore),
		      NewMHolidayPetard =
			  MHolidayPetard#m_holiday_petard{must_not_small =
							      NewMustNotSmall,
							  petard_reward =
							      NewPetardReward},
		      NewRole = NRole#role{m_holiday_petard =
					       NewMHolidayPetard},
		      sys_conn:pack_send(27000,
					 {EndTime, NewScore, MaxScore,
					  NewPetardReward}),
		      holiday:push_bid_can_reward(NewRole, 93037),
		      NewRole1 = role_trigger:fire([#evt_petard_meteor{count =
									   Num}],
						   NewRole),
		      NewRole2 = role_trigger:fire([#evt_petard_score{count =
									  Num *
									    holiday_petard_data:get_const(meteor_score)}],
						   NewRole1),
		      NewRole3 = role_trigger:fire([#evt_use_petard{count =
									Num}],
						   NewRole2),
		      {ok, NewRole3, 0, <<>>};
		  _ -> {false, lang:get(<<"物品使用失败！"/utf8>>)}
		end;
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    _ -> {false, lang:get(<<"无法使用流星弹"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end;
use_petard(Role = #role{id = Rid,
			m_holiday_petard =
			    MHolidayPetard = #m_holiday_petard{end_time =
								   EndTime,
							       must_not_big =
								   MustNotBig,
							       petard_reward =
								   PetardReward,
							       send_red_count =
								   SendRedCount}},
	   2, Num) ->
    case holiday_lib:get_open_holiday(Role,
				      [3037, 93037, 993037])
	of
      #holiday{} ->
	  DayMaxRedNum =
	      holiday_petard_data:get_const(max_day_send_num),
	  {NewMustNotBig, RewardList} =
	      get_petard_award(holiday_petard_data:get_const(firework_bid),
			       MustNotBig, Num, []),
	  Loss =
	      format:val_to_loss([{holiday_petard_data:get_const(firework_bid),
				   Num}],
				 holiday_petard_firework_expend),
	  Gain = format:val_to_gain(RewardList,
				    holiday_petard_firework_award),
	  case role_gain:do_notice(Role, Loss ++ Gain) of
	    {ok, NRole} ->
		case SendRedCount < DayMaxRedNum of
		  true ->
		      RedLimitNum = DayMaxRedNum - SendRedCount,
		      case holiday_petard_mgr:call({add_score_and_get_id,
						    holiday_petard_data:get_const(firework_bid),
						    Num, RedLimitNum})
			  of
			{NewScore, {RedId1, RedId2}}
			    when is_integer(NewScore) andalso
				   is_integer(RedId1) andalso
				     is_integer(RedId2) ->
			    log:log_gain(Loss ++ Gain, Role, NRole,
					 <<"花火大会使用烟花"/utf8>>,
					 util:fbin(<<"烟花id:~w, 数量:~w"/utf8>>,
						   [holiday_petard_data:get_const(firework_bid),
						    Num])),
			    BaseMaxScore =
				holiday_petard_data:get_const(base_max_score),
			    MaxScore = sys_env:get(real_max_score,
						   BaseMaxScore),
			    NewPetardReward = ref_petard_reward(NewScore,
								PetardReward),
			    NewSendCount = SendRedCount + min(Num, RedLimitNum),
			    NewMHolidayPetard =
				MHolidayPetard#m_holiday_petard{must_not_big =
								    NewMustNotBig,
								petard_reward =
								    NewPetardReward,
								send_red_count =
								    NewSendCount},
			    NewRole = NRole#role{m_holiday_petard =
						     NewMHolidayPetard},
			    sys_conn:pack_send(27000,
					       {EndTime, NewScore, MaxScore,
						NewPetardReward}),
			    holiday:push_bid_can_reward(NewRole, 93037),
			    role_group:apply(world,
					     {holiday_petard, push_fire,
					      [Rid]}),
			    PetardRedPacketList = init_red_packet(NRole,
								  EndTime, [],
								  {RedId1,
								   RedId2}),
			    d_ets_lib:save_d_ets(petard_red_packet,
						 PetardRedPacketList),
			    role_group:apply(world,
					     {holiday_petard, push_red_packet,
					      []}),
			    Msg = case NewSendCount >= DayMaxRedNum of
				    true ->
					lang:get(<<"已发放全服红包！今日发送红包次数已达上限"/utf8>>);
				    _ -> lang:get(<<"已发放全服红包！"/utf8>>)
				  end,
			    NewRole1 =
				role_trigger:fire([#evt_petard_firework{count =
									    Num}],
						  NewRole),
			    NewRole2 =
				role_trigger:fire([#evt_petard_score{count =
									 Num *
									   holiday_petard_data:get_const(firework_score)}],
						  NewRole1),
			    NewRole3 =
				role_trigger:fire([#evt_petard_send_red_packet{count
										   =
										   min(Num,
										       RedLimitNum)}],
						  NewRole2),
			    NewRole4 = role_trigger:fire([#evt_use_petard{count
									      =
									      Num}],
							 NewRole3),
			    {ok, NewRole4, 0, Msg};
			_ -> {false, lang:get(<<"物品使用失败！"/utf8>>)}
		      end;
		  _ ->
		      case holiday_petard_mgr:call({add_score,
						    holiday_petard_data:get_const(firework_bid),
						    Num})
			  of
			NewScore when is_integer(NewScore) ->
			    log:log_gain(Loss ++ Gain, Role, NRole,
					 <<"花火大会使用烟花"/utf8>>,
					 util:fbin(<<"烟花id:~w, 数量:~w"/utf8>>,
						   [holiday_petard_data:get_const(firework_bid),
						    Num])),
			    BaseMaxScore =
				holiday_petard_data:get_const(base_max_score),
			    MaxScore = sys_env:get(real_max_score,
						   BaseMaxScore),
			    NewPetardReward = ref_petard_reward(NewScore,
								PetardReward),
			    NewMHolidayPetard =
				MHolidayPetard#m_holiday_petard{must_not_big =
								    NewMustNotBig,
								petard_reward =
								    NewPetardReward},
			    NewRole = NRole#role{m_holiday_petard =
						     NewMHolidayPetard},
			    sys_conn:pack_send(27000,
					       {EndTime, NewScore, MaxScore,
						NewPetardReward}),
			    holiday:push_bid_can_reward(NewRole, 93037),
			    role_group:apply(world,
					     {holiday_petard, push_fire,
					      [Rid]}),
			    NewRole1 =
				role_trigger:fire([#evt_petard_firework{count =
									    Num}],
						  NewRole),
			    NewRole2 =
				role_trigger:fire([#evt_petard_score{count =
									 Num *
									   holiday_petard_data:get_const(firework_score)}],
						  NewRole1),
			    {ok, NewRole2, 0, lang:get(<<"今日不能再发红包了！"/utf8>>)};
			_ -> {false, lang:get(<<"物品使用失败！"/utf8>>)}
		      end
		end;
	    {false, #loss{msg = Msg}} -> {false, Msg};
	    {false, #gain{msg = Msg}} -> {false, Msg};
	    _ -> {false, lang:get(<<"无法使用礼花炮"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end;
use_petard(_Role, _Id, _Num) ->
    {false, lang:get(<<"无法使用该物品"/utf8>>)}.

init_red_packet(_Role, _EndTime, List, {RedId1, RedId2})
    when RedId1 > RedId2 ->
    List;
init_red_packet(Role = #role{id = Rid, name = Name,
			     face_id = FaceId,
			     m_avatar = #m_avatar{used = AvatarBaseId}},
		EndTime, List, {RedId1, RedId2}) ->
    Now = date:unixtime(),
    BlessRandList = holiday_petard_data:bless_msg(),
    {MsgId, _, _} = util:rand_list(BlessRandList, 2),
    PEndTime = min(EndTime,
		   Now +
		     3600 * holiday_petard_data:get_const(effect_time)),
    PetardRedPacket = #petard_red_packet{id = RedId1,
					 rid = Rid, name = Name,
					 face_id = FaceId,
					 avatar_bid = AvatarBaseId, num = 0,
					 max_num =
					     holiday_petard_data:get_const(max_get_num),
					 is_max = 0, mems = [], must_not = [],
					 start_time = Now, end_time = PEndTime,
					 msg_id = MsgId},
    init_red_packet(Role, EndTime, [PetardRedPacket | List],
		    {RedId1 + 1, RedId2}).

-spec get_petard_score_award(#role{},
			     pos_integer()) -> {ok, #role{}} |
					       {false, binary()}.

get_petard_score_award(Role = #role{m_holiday_petard =
					MHolidayPetard =
					    #m_holiday_petard{petard_reward =
								  PetardReward,
							      end_time =
								  EndTime}},
		       Id) ->
    case holiday_lib:get_open_holiday(Role,
				      [3037, 93037, 993037])
	of
      #holiday{} ->
	  case lists:keyfind(Id, 1, PetardReward) of
	    {Id, 1} ->
		Award = holiday_petard_data:get_score_award(Id),
		Gain = format:val_to_gain(Award,
					  holiday_petard_score_award),
		case role_gain:do_notice(Role, Gain) of
		  {ok, NRole} ->
		      log:log_gain(Gain, Role, NRole, <<"花火大会积分奖励"/utf8>>,
				   util:fbin(<<"奖励id:~w, 获取:~w"/utf8>>,
					     [Id, Award])),
		      NewPetardReward = lists:keystore(Id, 1, PetardReward,
						       {Id, 2}),
		      NewMHolidayPetard =
			  MHolidayPetard#m_holiday_petard{petard_reward =
							      NewPetardReward},
		      NewRole = NRole#role{m_holiday_petard =
					       NewMHolidayPetard},
		      TotalScore = sys_env:get(total_petard_score, 0),
		      BaseMaxScore =
			  holiday_petard_data:get_const(base_max_score),
		      MaxScore = sys_env:get(real_max_score, BaseMaxScore),
		      holiday:push_bid_can_reward(NewRole, 93037),
		      sys_conn:pack_send(27000,
					 {EndTime, TotalScore, MaxScore,
					  NewPetardReward}),
		      {ok, NewRole};
		  {false, #loss{msg = Msg}} -> {false, Msg};
		  {false, #gain{msg = Msg}} -> {false, Msg}
		end;
	    _ -> {false, lang:get(<<"无法领取该奖励"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

-spec get_red_packet(#role{}, pos_integer()) -> {ok,
						 #role{}, binary(),
						 pos_integer(), term(),
						 pos_integer(), pos_integer(),
						 pos_integer()} |
						{false, binary()}.

get_red_packet(Role = #role{id = Rid, name = Name,
			    lev = Lev, face_id = FaceId,
			    m_avatar = #m_avatar{used = AvatarBaseId},
			    m_holiday_petard =
				MHolidayPetard = #m_holiday_petard{get_red_count
								       =
								       GetRedCount,
								   red_packet_info
								       =
								       RedPacketInfo,
								   get_red_info
								       =
								       GetRedInfo}},
	       Id) ->
    case holiday_lib:get_open_holiday(Role,
				      [3037, 93037, 993037])
	of
      #holiday{} ->
	  LimitNum =
	      holiday_petard_data:get_const(max_day_get_num),
	  case lists:keyfind(Id, 1, RedPacketInfo) of
	    {Id, 1} when GetRedCount < LimitNum ->
		case holiday_petard_mgr:call({get_red_packet, Rid, Name,
					      Lev, FaceId, AvatarBaseId, Id})
		    of
		  {true, Msg, Id, Mems, Num, MaxNum, EndTime, RewardList,
		   SendName, SendFaceId, SendAvatarBid}
		      when RewardList =/= [] ->
		      Gain = format:val_to_gain(RewardList,
						holiday_petard_red_packet),
		      case role_gain:do_notice(Role, Gain) of
			{ok, NRole} ->
			    log:log_gain(Gain, Role, NRole, <<"花火大会打开红包"/utf8>>,
					 util:fbin(<<"红包id:~w, 获取:~w"/utf8>>,
						   [Id, RewardList])),
			    NewRedPacketInfo = lists:keystore(Id, 1,
							      RedPacketInfo,
							      {Id, 2}),
			    NewMHolidayPetard =
				MHolidayPetard#m_holiday_petard{get_red_count =
								    GetRedCount
								      + 1,
								red_packet_info
								    =
								    NewRedPacketInfo,
								get_red_info =
								    [Id
								     | GetRedInfo]},
			    NewRole = NRole#role{m_holiday_petard =
						     NewMHolidayPetard},
			    TranNewRedPacketInfo =
				covert_info(NewRedPacketInfo),
			    sys_conn:pack_send(27002,
					       {TranNewRedPacketInfo,
						GetRedCount + 1, LimitNum}),
			    push_red_packet(NewRole),
			    NewRole1 =
				role_trigger:fire([#evt_petard_red_packet{}],
						  NewRole),
			    {ok, NewRole1, Msg, Id, Mems, Num, MaxNum, EndTime,
			     SendName, SendFaceId, SendAvatarBid};
			{false, #loss{msg = Msg}} -> {false, Msg};
			{false, #gain{msg = Msg}} -> {false, Msg}
		      end;
		  {false, Msg} -> {false, Msg};
		  _ -> {false, lang:get(<<"领取失败"/utf8>>)}
		end;
	    {Id, 1} -> {false, lang:get(<<"已超过今日领取上限"/utf8>>)};
	    {Id, 2} ->
		case ets:lookup(petard_red_packet, Id) of
		  [#petard_red_packet{name = SendName,
				      face_id = SendFaceId,
				      avatar_bid = SendAvatarBid, num = Num,
				      max_num = MaxNum, end_time = EndTime,
				      mems = Mems}
		   | _] ->
		      push_red_packet(Role),
		      {ok, Role, lang:get(<<"该红包已领取"/utf8>>), Id, Mems, Num,
		       MaxNum, EndTime, SendName, SendFaceId, SendAvatarBid};
		  _ -> {false, lang:get(<<"红包不存在"/utf8>>)}
		end;
	    _ -> {false, lang:get(<<"无法领取该红包"/utf8>>)}
	  end;
      _ -> {false, lang:get(<<"活动未开启"/utf8>>)}
    end.

ref_petard_reward(NewScore, PetardReward) ->
    List = lists:keysort(2,
			 holiday_petard_data:score_award_list()),
    BaseMaxScore =
	holiday_petard_data:get_const(base_max_score),
    MaxScore = sys_env:get(real_max_score, BaseMaxScore),
    NewPetardReward = do_ref_petard_reward(List, NewScore,
					   PetardReward, MaxScore),
    NewPetardReward.

do_ref_petard_reward([], _NewScore, PetardReward,
		     _MaxScore) ->
    PetardReward;
do_ref_petard_reward([{Id, Pro} | Rest], NewScore,
		     PetardReward, MaxScore) ->
    Flag = lists:keyfind(Id, 1, PetardReward),
    case NewScore >= MaxScore * (Pro / 1000) andalso
	   Flag =:= false
	of
      true ->
	  do_ref_petard_reward(Rest, NewScore,
			       [{Id, 1} | PetardReward], MaxScore);
      _ ->
	  do_ref_petard_reward(Rest, NewScore, PetardReward,
			       MaxScore)
    end.

get_petard_award(_Type, MustNot, 0, RewardList) ->
    {MustNot, RewardList};
get_petard_award(Type, MustNot, Num, RewardList) ->
    Type1 = holiday_petard_data:get_const(meteor_bid),
    Type2 = holiday_petard_data:get_const(firework_bid),
    RandList = case Type of
		 Type1 -> holiday_petard_data:meteor_award();
		 Type2 -> holiday_petard_data:firework_award();
		 _ -> holiday_petard_data:red_packet_award()
	       end,
    Fun = fun ({Id, Award, Pro, MustNotCount}, Acc) ->
		  Count = list_util:keyfind(Id, MustNot, -1),
		  case Count < MustNotCount of
		    true -> [{Id, Award, Pro} | Acc];
		    _ -> Acc
		  end
	  end,
    RandList1 = lists:foldl(Fun, [], RandList),
    {Id, Award, _Pro} = util:rand_list(RandList1, 3),
    NewMustNot = do_must_not(Type, Id, MustNot),
    NewRewardList = item_lib:merge(RewardList, Award),
    get_petard_award(Type, NewMustNot, Num - 1,
		     NewRewardList).

do_must_not(Type, Id, MustNot) ->
    Type1 = holiday_petard_data:get_const(meteor_bid),
    Type2 = holiday_petard_data:get_const(firework_bid),
    MustNotCount = case Type of
		     Type1 -> holiday_petard_data:meteor_must_not(Id);
		     Type2 -> holiday_petard_data:firework_must_not(Id);
		     _ -> holiday_petard_data:red_packet_must_not(Id)
		   end,
    case MustNotCount > 0 of
      true ->
	  Count = list_util:keyfind(Id, MustNot, 0),
	  NewMustNot = lists:keystore(Id, 1, MustNot,
				      {Id, Count + 1}),
	  NewMustNot;
      _ -> MustNot
    end.


