-file("src/mod/role_room/room_feat_mgr.erl", 1).

-module(room_feat_mgr).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
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
		{trigger, [id, label, m, f, type, a]}, {state, []}]).

-behaviour(gen_server).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([get_info/1, del_info/1]).

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

-file("src/mod/role_room/room_feat_mgr.erl", 16).

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

-file("src/mod/role_room/room_feat_mgr.erl", 17).

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

-file("src/mod/role_room/room_feat_mgr.erl", 18).

-spec get_info(role_id()) -> ok.

get_info(Id) ->
    case catch ets:lookup(room_feat_info, Id) of
      [{_, L} | _] -> L;
      _ -> []
    end.

-spec del_info(role_id()) -> ok.

del_info(Id) ->
    ets:delete(room_feat_info, Id),
    dets:delete(room_feat_info, Id),
    ok.

update_ets(Tab, Data, reset_all) ->
    ets:delete_all_objects(Tab),
    dets:delete_all_objects(Tab),
    update_ets(Tab, Data, ets),
    update_ets(Tab, Data, dets);
update_ets(Tab, Data, all) ->
    update_ets(Tab, Data, ets), update_ets(Tab, Data, dets);
update_ets(Tab, Data, ets) -> ets:insert(Tab, Data);
update_ets(Tab, Data, dets) -> dets:insert(Tab, Data).

info(Info) -> room_feat_mgr ! Info.

cast(Info) -> gen_server:cast(room_feat_mgr, Info).

call(Info) ->
    case catch gen_server:call(room_feat_mgr, Info, 10000)
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
	    {__Pidroom_feat_mgr56, _,
	     {__Levelroom_feat_mgr56, __Tracesroom_feat_mgr56}}
		when __Levelroom_feat_mgr56 band 8 /= 0 orelse
		       __Tracesroom_feat_mgr56 /= [] ->
		lager:do_log(error,
			     [{module, room_feat_mgr}, {function, call},
			      {line, 56}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [room_feat_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelroom_feat_mgr56,
			     __Tracesroom_feat_mgr56, lager_event,
			     __Pidroom_feat_mgr56);
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
    gen_server:start_link({local, room_feat_mgr},
			  room_feat_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidroom_feat_mgr62, _,
       {__Levelroom_feat_mgr62, __Tracesroom_feat_mgr62}}
	  when __Levelroom_feat_mgr62 band 64 /= 0 orelse
		 __Tracesroom_feat_mgr62 /= [] ->
	  lager:do_log(info,
		       [{module, room_feat_mgr}, {function, init}, {line, 62},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [room_feat_mgr]), none,
		       4096, 64, __Levelroom_feat_mgr62,
		       __Tracesroom_feat_mgr62, lager_event,
		       __Pidroom_feat_mgr62);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(room_feat_info,
		   [{file, "./dets/room_feat_info.dets"}, {keypos, 1},
		    {type, set}]),
    ets:new(room_feat_info,
	    [set, named_table, public, {keypos, 1}]),
    ets:from_dets(room_feat_info, room_feat_info),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidroom_feat_mgr69, _,
       {__Levelroom_feat_mgr69, __Tracesroom_feat_mgr69}}
	  when __Levelroom_feat_mgr69 band 64 /= 0 orelse
		 __Tracesroom_feat_mgr69 /= [] ->
	  lager:do_log(info,
		       [{module, room_feat_mgr}, {function, init}, {line, 69},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [room_feat_mgr]), none, 4096,
		       64, __Levelroom_feat_mgr69, __Tracesroom_feat_mgr69,
		       lager_event, __Pidroom_feat_mgr69);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({holiday_arena_team_combat_over, Id,
	     Result},
	    State) ->
    Now = date:unixtime(),
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = case Result of
		   1 ->
		       [#evt_holiday_arena_team_combat_count{},
			#evt_holiday_arena_team_combat_win_count{}];
		   _ -> [#evt_holiday_arena_team_combat_count{}]
		 end,
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({holiday_arena_team_lev_up, Id}, State) ->
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = [#evt_holiday_arena_team_lev_up{}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({holiday_arena_team_join_team, Id},
	    State) ->
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = [#evt_holiday_arena_team_join_team{}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({guild_war_rank_do_feat, Id, GName,
	     TarGName, Score, Rank},
	    State) ->
    Now = date:unixtime(),
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = [#r_evt_guild_war_rank{cache =
					    #{time => Now, guild_name => GName,
					      guild_war_enemy_name => TarGName,
					      guild_war_score => Score,
					      guild_war_rank => Rank}}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({guild_dun_boss_do_feat, Id, GName, Rank,
	     Fid},
	    State) ->
    Now = date:unixtime(),
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = [#r_evt_guild_dun_rank{cache =
					    #{time => Now, guild_name => GName,
					      guild_dun_chapter => Fid,
					      guild_dun_rank => Rank}}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({arena_elite_do_feat, Period, Ranks},
	    State) ->
    Now = date:unixtime(),
    Fun = fun ({Id, Rank, ELev, Score}, Acc) ->
		  case sys_lib:is_local(Id) of
		    false -> Acc;
		    _ ->
			Evts = [#evt_arena_elite_end_rank{rank = Rank},
				#r_evt_arena_elite_end_rankget{cache =
								   #{time =>
									 Now,
								     arena_elite_area
									 =>
									 Period,
								     arena_elite_rank
									 =>
									 Rank}}],
			case role_query:local_pid(by_id, Id) of
			  {ok, Pid} ->
			      role:apply(async, Pid,
					 {fun (R) ->
						  NewR = role_trigger:fire(Evts,
									   R),
						  {ok, NewR}
					  end}),
			      Acc;
			  _ -> L = get_info(Id), [{Id, L ++ Evts} | Acc]
			end
		  end
	  end,
    List = lists:foldl(Fun, [], Ranks),
    update_ets(room_feat_info, List, all),
    {noreply, State};
handle_info({arena_elite_do_feat2, Ranks}, State) ->
    Now = date:unixtime(),
    Fun = fun ({Id, ELev, Score}, Acc) ->
		  case sys_lib:is_local(Id) of
		    false -> Acc;
		    _ ->
			Evts = [#evt_arena_elite_end_lev{lev = ELev,
							 score = Score},
				#r_evt_arena_elite_end_lev{cache =
							       #{time => Now,
								 arena_elite_lev
								     => ELev}},
				#r_evt_arena_elite_end_levget{cache =
								  #{time => Now,
								    arena_elite_lev
									=>
									ELev}}],
			case role_query:local_pid(by_id, Id) of
			  {ok, Pid} ->
			      role:apply(async, Pid,
					 {fun (R) ->
						  NewR = role_trigger:fire(Evts,
									   R),
						  {ok, NewR}
					  end}),
			      Acc;
			  _ -> L = get_info(Id), [{Id, L ++ Evts} | Acc]
			end
		  end
	  end,
    List = lists:foldl(Fun, [], Ranks),
    update_ets(room_feat_info, List, all),
    {noreply, State};
handle_info({arena_cluster_do_feat, Ranks}, State) ->
    Now = date:unixtime(),
    Fun = fun ({Id, Rank}, Acc) ->
		  case sys_lib:is_local(Id) of
		    false -> Acc;
		    _ ->
			Evts = [#evt_arena_cluster_end_rank{rank = Rank},
				#r_evt_arena_cluster_rank{cache =
							      #{time => Now,
								arena_cluster_rank
								    => Rank}},
				#r_evt_arena_cluster_rankget{cache =
								 #{time => Now,
								   arena_cluster_rank
								       =>
								       Rank}}],
			case role_query:local_pid(by_id, Id) of
			  {ok, Pid} ->
			      role:apply(async, Pid,
					 {fun (R) ->
						  NewR = role_trigger:fire(Evts,
									   R),
						  {ok, NewR}
					  end}),
			      Acc;
			  _ -> L = get_info(Id), [{Id, L ++ Evts} | Acc]
			end
		  end
	  end,
    List = lists:foldl(Fun, [], Ranks),
    update_ets(room_feat_info, List, all),
    {noreply, State};
handle_info({arena_champion_do_feat, Id, Rank},
	    State) ->
    Now = date:unixtime(),
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = [#evt_championships_end_rank{rank = Rank},
		  #evt_championships_bet_cont_win_day{count = 0},
		  #r_evt_championships_end_rank{cache =
						    #{time => Now,
						      arena_champion_rank =>
							  Rank}}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({arena_champion_guess_win_count, Id,
	     GuessWinCount},
	    State) ->
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = [#evt_championships_bet_cont_win_day{count =
							  GuessWinCount}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({arena_cluster_champion_do_feat, Id, Rank},
	    State) ->
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = [#evt_cluster_championships_end_rank{rank =
							  Rank},
		  #evt_cluster_championships_bet_cont_win_day{count = 0},
		  #evt_cluster_championships_takepartin{}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({evt_cluster_championships_bet_cont_win_day,
	     Id, GuessWinCount},
	    State) ->
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts =
	      [#evt_cluster_championships_bet_cont_win_day{count =
							       GuessWinCount}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({evt_peak_championships_bet_cont_win_season,
	     Id, GuessWinCount},
	    State) ->
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts =
	      [#evt_peak_championships_bet_cont_win_season{count =
							       GuessWinCount}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({arena_peak_champion_do_feat, Id, Rank},
	    State) ->
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = [#evt_peak_championships_end_rank{rank = Rank},
		  #evt_peak_championships_bet_cont_win_season{count = 0},
		  #evt_peak_championships_takepartin{}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({sky_ladder_do_feat, Id, Rank}, State) ->
    Now = date:unixtime(),
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = [#evt_sky_ladder_end_rank{rank = Rank},
		  #r_evt_sky_ladder_end_rank{cache =
						 #{time => Now,
						   sky_ladder_rank => Rank}}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({element_temple_do_feat, Id, Rank},
	    State) ->
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = [#evt_element_temple_end_rank{rank = Rank}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({arena_do_feat, Id, Rank}, State) ->
    Now = date:unixtime(),
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = [#r_evt_arena_firstrank_end{cache =
						 #{time => Now,
						   arena_rank => Rank}}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({arena_worship_do_feat, Id, RoleName,
	     _LikeNumT},
	    State) ->
    Now = date:unixtime(),
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  LikeNum = var:get_role_var(Id, other, 1, 0),
	  Evts = [#r_evt_arena_like_number{cache =
					       #{time => Now,
						 arena_like_role_name =>
						     RoleName,
						 arena_like_number =>
						     LikeNum}}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({role_room_fans_do_feat, Id, TarRoleName,
	     NFanseNum},
	    State) ->
    Now = date:unixtime(),
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = [#r_evt_room_liked{cache =
					#{time => Now,
					  room_like_role_name => TarRoleName,
					  room_like_role_number => NFanseNum}}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({guild_war_do_feat, Ids}, State) ->
    Fun = fun (Id, Acc) ->
		  case sys_lib:is_local(Id) of
		    false -> Acc;
		    _ ->
			Evts = [#evt_guild_war_join_and_win{}],
			case role_query:local_pid(by_id, Id) of
			  {ok, Pid} ->
			      role:apply(async, Pid,
					 {fun (R) ->
						  NewR = role_trigger:fire(Evts,
									   R),
						  {ok, NewR}
					  end}),
			      Acc;
			  _ -> L = get_info(Id), [{Id, L ++ Evts} | Acc]
			end
		  end
	  end,
    List = lists:foldl(Fun, [], Ids),
    update_ets(room_feat_info, List, all),
    {noreply, State};
handle_info({guild_mem_red_do_feat, Id}, State) ->
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = [#evt_guild_redpacket_best{}],
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({arena_team_do_feat_def, Id, Maps},
	    State) ->
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  IsWin = maps:get(is_win, Maps),
	  Evts = case IsWin =:= 1 of
		   true -> [#evt_arena_team_defense_success{}];
		   _ -> []
		 end,
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({arena_team_do_feat, Id, Maps}, State) ->
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = get_evts([evt_arena_team_join,
			   evt_arena_team_win, evt_arena_team_two_win,
			   evt_arena_team_first, evt_arena_team_last,
			   evt_arena_team_double_kill],
			  Id, Maps, []),
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({arena_team_do_feat_rank, Id, Rank},
	    State) ->
    case sys_lib:is_local(Id) of
      false -> ok;
      _ ->
	  Evts = case Rank =< 5 of
		   true when Rank =< 1 ->
		       [#evt_arena_team_season_five{},
			#evt_arena_team_season_one{}];
		   true -> [#evt_arena_team_season_five{}];
		   _ -> []
		 end,
	  case role_query:local_pid(by_id, Id) of
	    {ok, Pid} ->
		role:apply(async, Pid,
			   {fun (R) ->
				    NewR = role_trigger:fire(Evts, R),
				    {ok, NewR}
			    end}),
		ok;
	    _ ->
		L = get_info(Id),
		update_ets(room_feat_info, {Id, L ++ Evts}, all)
	  end
    end,
    {noreply, State};
handle_info({monopoly_dungeons_kill, Ids}, State) ->
    Fun = fun (Id, Acc) ->
		  case sys_lib:is_local(Id) of
		    false -> Acc;
		    _ ->
			Evts = [#evt_monopoly_kill_boss{}],
			case role_query:local_pid(by_id, Id) of
			  {ok, Pid} ->
			      role:apply(async, Pid,
					 {fun (R) ->
						  NewR = role_trigger:fire(Evts,
									   R),
						  {ok, NewR}
					  end}),
			      Acc;
			  _ -> L = get_info(Id), [{Id, L ++ Evts} | Acc]
			end
		  end
	  end,
    List = lists:foldl(Fun, [], Ids),
    update_ets(room_feat_info, List, all),
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
      {__Pidroom_feat_mgr642, _,
       {__Levelroom_feat_mgr642, __Tracesroom_feat_mgr642}}
	  when __Levelroom_feat_mgr642 band 128 /= 0 orelse
		 __Tracesroom_feat_mgr642 /= [] ->
	  lager:do_log(debug,
		       [{module, room_feat_mgr}, {function, handle_info},
			{line, 642}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("被成就进程忽略的消息:~w", [_Info]), none, 4096,
		       128, __Levelroom_feat_mgr642, __Tracesroom_feat_mgr642,
		       lager_event, __Pidroom_feat_mgr642);
      _ -> ok
    end,
    {noreply, State}.

get_evts([], _Id, _Maps, NewEvts) -> NewEvts;
get_evts([evt_arena_team_join | T], Id, Maps,
	 NewEvts) ->
    get_evts(T, Id, Maps,
	     [#evt_arena_team_join{} | NewEvts]);
get_evts([evt_arena_team_win | T], Id, Maps, NewEvts) ->
    IsWin = maps:get(is_win, Maps),
    case IsWin =:= 1 of
      true ->
	  get_evts(T, Id, Maps,
		   [#evt_arena_team_win{} | NewEvts]);
      _ -> get_evts(T, Id, Maps, NewEvts)
    end;
get_evts([evt_arena_team_two_win | T], Id, Maps,
	 NewEvts) ->
    IsWin = maps:get(is_win, Maps),
    APos = maps:get(a_pos, Maps),
    case IsWin =:= 1 andalso APos =< 2 of
      true ->
	  get_evts(T, Id, Maps,
		   [#evt_arena_team_two_win{} | NewEvts]);
      _ -> get_evts(T, Id, Maps, NewEvts)
    end;
get_evts([evt_arena_team_first | T], Id, Maps,
	 NewEvts) ->
    IsWin = maps:get(is_win, Maps),
    AtkPos = maps:get(atk_pos, Maps),
    {_, FirstId} = lists:keyfind(1, 1, AtkPos),
    case IsWin =:= 1 andalso FirstId =:= Id of
      true ->
	  get_evts(T, Id, Maps,
		   [#evt_arena_team_first{} | NewEvts]);
      _ -> get_evts(T, Id, Maps, NewEvts)
    end;
get_evts([evt_arena_team_last | T], Id, Maps,
	 NewEvts) ->
    IsWin = maps:get(is_win, Maps),
    AtkPos = maps:get(atk_pos, Maps),
    {_, LastId} = lists:keyfind(length(AtkPos), 1, AtkPos),
    case IsWin =:= 1 andalso LastId =:= Id of
      true ->
	  get_evts(T, Id, Maps,
		   [#evt_arena_team_last{} | NewEvts]);
      _ -> get_evts(T, Id, Maps, NewEvts)
    end;
get_evts([evt_arena_team_double_kill | T], Id, Maps,
	 NewEvts) ->
    WinCount = maps:get(win_count, Maps, 0),
    case WinCount >= 2 of
      true ->
	  get_evts(T, Id, Maps,
		   [#evt_arena_team_double_kill{} | NewEvts]);
      _ -> get_evts(T, Id, Maps, NewEvts)
    end.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidroom_feat_mgr696, _,
       {__Levelroom_feat_mgr696, __Tracesroom_feat_mgr696}}
	  when __Levelroom_feat_mgr696 band 64 /= 0 orelse
		 __Tracesroom_feat_mgr696 /= [] ->
	  lager:do_log(info,
		       [{module, room_feat_mgr}, {function, terminate},
			{line, 696}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelroom_feat_mgr696,
		       __Tracesroom_feat_mgr696, lager_event,
		       __Pidroom_feat_mgr696);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.


