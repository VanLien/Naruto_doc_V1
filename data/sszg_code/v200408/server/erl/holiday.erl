-file("src/mod/holiday/holiday.erl", 1).

-module(holiday).

-lager_records([{holiday_practise_tower_rank,
		 [ver, platform_zone, camp_id, rank_list, old_rank_list,
		  ext]},
		{practise_role_rank,
		 [ver, id, lev, face_id, avatar_bid, name, val, unixtime,
		  power, rank, video_id, face_update_time, face_file,
		  ext]},
		{m_holiday_practise_tower,
		 [ver, camp_id, id, times, last_buy_times,
		  last_anew_times, update_unixtime, hp_radio, is_combat,
		  is_recombat, save_list, ext]},
		{m_holiday_new_week_card,
		 [ver, camp_id, start_time, end_time, day, is_buy,
		  buy_time, award_list, ext]},
		{m_holiday_valentines,
		 [ver, camp_id, score, reward, ext]},
		{fire_gift_info,
		 [ver, id, charge_id, start_time, end_time, buy_count,
		  limit_count, is_loop, limit_type, ext]},
		{m_holiday_fire_gift,
		 [ver, gift_list, old_gift_list, ext]},
		{m_merge_goal, [ver, camp_id, reward]},
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
		{holiday_term_begins_boss_rank, [rank, id, all_dps]},
		{holiday_term_begins_boss_rank_role,
		 [var, rank, r_id, name, boss_id, all_dps, avatar_bid,
		  lev, family_name, face_id, power, time]},
		{holiday_term_begins_boss,
		 [var, id, unit_id, boss_endtime, boss_hp, dps, buff_lev,
		  paper_num, reward, kill_reward, is_kill, boss_id]},
		{m_holiday_term_begins,
		 [ver, camp_id, round, round_endtime, difficulty,
		  order_id, order_endtime, fight_count, buy_count,
		  order_hp, submit_paper, paper_reward, boss_endtime,
		  boss_dps, boss_dps_list, all_boss_dps, best_partner_id,
		  hurt_statistics]},
		{holiday_predict_info,
		 [type, count, buy_list, rand_lists, flag]},
		{m_holiday_predict, [ver, camp_id, info]},
		{m_holiday_boss,
		 [ver, camp_id, count, buy_count, order_id, score,
		  boss_hp, boss_score, awards, old_info]},
		{m_holiday_boss_new,
		 [ver, camp_id, count, buy_count, round, difficulty,
		  order_id, last_rest_round, round_endtime, round_combat,
		  round_boss, round_reward_status, boss_hp, partner_used,
		  partner_lock, old_info]},
		{m_holiday_accumulate,
		 [ver, period, flag, award, day, day_state, ext,
		  ole_data]},
		{holiday_dial_rand_data,
		 [zid, id, name, award_type, item_id, item_num,
		  gold_rate, pro, limit_lev_min, limit_lev_max,
		  not_hit_in_m, not_hit_in_m_after, hit_when_m_after,
		  notice, notice_rank, limit_count]},
		{rand_data,
		 [rand_id, id, name, item_id, item_num, rare, pro,
		  limit_lev, not_hit_in_m, notice, limit_count,
		  max_count]},
		{dial_info,
		 [type, count, lucky, lucky_award, list, award_list,
		  day_award_list, frist_type, end_time, rand_lists,
		  pos_limit_count, item_limit_count]},
		{m_holiday_dial,
		 [ver, camp_id, award_list, num, count, list, logs, lev,
		  old_data]},
		{m_dial, [ver, info, reset_time]},
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
		{holiday_lanterm_adventure_data,
		 [camp_id, id, f_id, s_id, ref_day, progress, award]},
		{m_lanterm_adventure3,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_adventure2,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_adventure1,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_adventure,
		 [ver, quest_list, camp_id, extra, old_data]},
		{m_lanterm_festival,
		 [ver, all_count, all_num, award_list, camp_id, extra,
		  old_data]},
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
		{activity, [id, status, name, data, ext_args]},
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

-export([type_all/2, holiday_one/2, point/2, point2/2,
	 take/4, can_get_reward/2, push_bid_can_reward/2,
	 push_bid_can_reward/3]).

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

-file("src/mod/holiday/holiday.erl", 17).

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

-file("src/mod/holiday/holiday.erl", 18).

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

-file("src/mod/holiday/holiday.erl", 19).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/holiday/holiday.erl", 20).

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

-file("src/mod/holiday/holiday.erl", 21).

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

-file("src/mod/holiday/holiday.erl", 22).

-file("inc/holiday_lanterm.hrl", 1).

-record(m_lanterm_festival,
	{ver = 1, all_count = []  :: non_neg_integer(),
	 all_num = 0  :: non_neg_integer(),
	 award_list = []  :: list(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure1,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure2,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(m_lanterm_adventure3,
	{ver = 1, quest_list = []  :: non_neg_integer(),
	 camp_id = 0  :: non_neg_integer(), extra = [],
	 old_data = []  :: list()}).

-record(holiday_lanterm_adventure_data,
	{camp_id = 0  :: non_neg_integer(),
	 id = 0  :: non_neg_integer(), f_id = 0, s_id = 0,
	 ref_day = 0, progress = [], award = []}).

-file("src/mod/holiday/holiday.erl", 23).

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

-file("src/mod/holiday/holiday.erl", 24).

-file("inc/dial.hrl", 1).

-record(m_dial,
	{ver = 2  :: non_neg_integer(), info = [],
	 reset_time = 0}).

-record(m_holiday_dial,
	{ver = 1  :: non_neg_integer(), camp_id = 0,
	 award_list = [], num = 0, count = 0, list = [],
	 logs = [], lev = 0, old_data = []}).

-record(dial_info,
	{type = 0, count = 0, lucky = 0, lucky_award = [],
	 list = [], award_list = [], day_award_list = [],
	 frist_type = 0, end_time = 0, rand_lists = [],
	 pos_limit_count = [], item_limit_count = []}).

-record(rand_data,
	{rand_id = 0, id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 item_id = 0  :: non_neg_integer(),
	 item_num = 0  :: non_neg_integer(), rare = 0,
	 pro = 0  :: non_neg_integer(),
	 limit_lev = 0  :: non_neg_integer(),
	 not_hit_in_m = 0  :: non_neg_integer(),
	 notice = 0  :: non_neg_integer(),
	 limit_count = 0  :: non_neg_integer(),
	 max_count = 0  :: non_neg_integer()}).

-record(holiday_dial_rand_data,
	{zid = 0, id = 110, name = <<>>, award_type = 0,
	 item_id = 0, item_num = 0, gold_rate = 0, pro = 0,
	 limit_lev_min = 0, limit_lev_max = 9999,
	 not_hit_in_m = 0, not_hit_in_m_after = 0,
	 hit_when_m_after = 0, notice = 0, notice_rank = 0,
	 limit_count = 0}).

-file("src/mod/holiday/holiday.erl", 25).

-file("inc/holiday_accumulate.hrl", 1).

-file("inc/common.hrl", 1).

-file("inc/holiday_accumulate.hrl", 8).

-record(m_holiday_accumulate,
	{ver = 2, period = 1, flag = 0, award = [], day = 1,
	 day_state = 0, ext = [], ole_data = []}).

-file("src/mod/holiday/holiday.erl", 26).

-file("inc/holiday_boss_new.hrl", 1).

-record(m_holiday_boss_new,
	{ver = 1, camp_id = 0, count = 0, buy_count = 0,
	 round = 0, difficulty = 0, order_id = 1,
	 last_rest_round = 0, round_endtime = 0,
	 round_combat = 0, round_boss = 0,
	 round_reward_status = 0, boss_hp = [],
	 partner_used = [], partner_lock = [], old_info = []}).

-file("src/mod/holiday/holiday.erl", 27).

-file("inc/holiday_boss.hrl", 1).

-record(m_holiday_boss,
	{ver = 1, camp_id = 0, count = 0, buy_count = 0,
	 order_id = 1, score = 0, boss_hp = [], boss_score = 0,
	 awards = [], old_info = []}).

-file("src/mod/holiday/holiday.erl", 28).

-file("inc/holiday_predict.hrl", 1).

-record(m_holiday_predict,
	{ver = 1  :: non_neg_integer(), camp_id = 0,
	 info = []}).

-record(holiday_predict_info,
	{type = 0, count = 0, buy_list = [], rand_lists = [],
	 flag = 0}).

-file("src/mod/holiday/holiday.erl", 29).

-file("inc/holiday_term_begins.hrl", 1).

-record(m_holiday_term_begins,
	{ver = 1, camp_id = 0, round = 0, round_endtime = 0,
	 difficulty = 0, order_id = 1, order_endtime = 0,
	 fight_count = 0, buy_count = 0, order_hp = [],
	 submit_paper = 0, paper_reward = [], boss_endtime = 0,
	 boss_dps = 0, boss_dps_list = [], all_boss_dps = 0,
	 best_partner_id = 0, hurt_statistics = []}).

-record(holiday_term_begins_boss,
	{var = 1, id = 0, unit_id = 0, boss_endtime = 0,
	 boss_hp = [], dps = 0, buff_lev = 0, paper_num = 0,
	 reward = [], kill_reward = [], is_kill = 0,
	 boss_id = 0}).

-record(holiday_term_begins_boss_rank_role,
	{var = 1, rank = 0, r_id = {0, <<>>}, name = <<>>,
	 boss_id = 0, all_dps = 0, avatar_bid = 0,
	 lev = 0  :: non_neg_integer(),
	 family_name = <<>>  :: bitstring(),
	 face_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(), time = 0}).

-record(holiday_term_begins_boss_rank,
	{rank = 0, id = {0, <<>>}, all_dps = 0}).

-file("src/mod/holiday/holiday.erl", 30).

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

-file("src/mod/holiday/holiday.erl", 31).

-file("inc/holiday_merge_goal.hrl", 1).

-record(m_merge_goal,
	{ver = 1  :: pos_integer(),
	 camp_id = 0  :: pos_integer(), reward = []  :: list()}).

-file("src/mod/holiday/holiday.erl", 32).

-file("inc/holiday_fire_gift.hrl", 1).

-record(m_holiday_fire_gift,
	{ver = 1, gift_list = [], old_gift_list = [],
	 ext = []}).

-record(fire_gift_info,
	{ver = 1, id = 0, charge_id = 0, start_time = 0,
	 end_time = 0, buy_count = 0, limit_count = 0,
	 is_loop = 0, limit_type = 0, ext = []}).

-file("src/mod/holiday/holiday.erl", 33).

-file("inc/holiday_valentines.hrl", 1).

-record(m_holiday_valentines,
	{ver = 1  :: pos_integer(),
	 camp_id = 0  :: pos_integer(),
	 score = 0  :: pos_integer(), reward = []  :: list(),
	 ext = []  :: list()}).

-file("src/mod/holiday/holiday.erl", 34).

-file("inc/holiday_new_week_card.hrl", 1).

-record(m_holiday_new_week_card,
	{ver = 1, camp_id = 0, start_time = 0, end_time = 0,
	 day = 0, is_buy = 0, buy_time = 0, award_list = [],
	 ext = []}).

-file("src/mod/holiday/holiday.erl", 35).

-file("inc/holiday_practise_tower.hrl", 1).

-record(m_holiday_practise_tower,
	{ver = 1  :: pos_integer(),
	 camp_id = 0  :: pos_integer(), id = 0  :: pos_integer(),
	 times = 0  :: pos_integer(),
	 last_buy_times = 0  :: pos_integer(),
	 last_anew_times = 0  :: pos_integer(),
	 update_unixtime = 0  :: pos_integer(),
	 hp_radio = []  :: list(),
	 is_combat = {0, []}  :: tuple(),
	 is_recombat = 0  :: list(), save_list = []  :: list(),
	 ext = []  :: list()}).

-record(practise_role_rank,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 lev = 0  :: pos_integer(),
	 face_id = 0  :: pos_integer(),
	 avatar_bid = 0  :: pos_integer(),
	 name = <<>>  :: string(), val = 0  :: pos_integer(),
	 unixtime = 0  :: pos_integer(),
	 power = 0  :: pos_integer(), rank = 0  :: pos_integer(),
	 video_id = 0  :: pos_integer(),
	 face_update_time = 0  :: pos_integer(),
	 face_file = <<>>  :: string(), ext = []  :: list()}).

-record(holiday_practise_tower_rank,
	{ver = 1  :: pos_integer(),
	 platform_zone = {<<>>, 0}  :: tuple(),
	 camp_id = 0  :: pos_integer(),
	 rank_list = []  :: list(),
	 old_rank_list = []  :: list(), ext = []  :: list()}).

-file("src/mod/holiday/holiday.erl", 36).

-spec type_all(#role{}, all | 0..2) -> tuple().

type_all(Role = #role{account = Account}, Type) ->
    HolidayList = holiday_lib:list_type_holiday(Role, Type),
    Now = date:unixtime(),
    MaxDunId = dungeon_heaven_lib:get_max_dun_id(Role),
    IsWhite = ip_mgr:is_white_acc(Account),
    F = fun (#holiday{tbid = 1031}, XSum)
		when MaxDunId =< 0 ->
		XSum;
	    (XHoliday = #holiday{tbid = 1050, end_time = EndTime,
				 cli_type = CliType,
				 cli_type_name = CliTypeName},
	     XSum) ->
		RemainSec = max(0, EndTime - Now),
		{NewGiftList, _} =
		    holiday_fire_gift:ref_gift_list(Role),
		NewGiftList1 = [F
				|| F = #fire_gift_info{end_time = EndTimeF}
				       <- NewGiftList,
				   Now =< EndTimeF],
		case NewGiftList1 of
		  [_ | _] ->
		      [{XHoliday, RemainSec, CliType, CliTypeName} | XSum];
		  _ -> XSum
		end;
	    (XHoliday = #holiday{tbid = 3052, end_time = EndTime,
				 cli_type = CliType,
				 cli_type_name = CliTypeName},
	     XSum) ->
		RemainSec = max(0, EndTime - Now),
		case holiday_new_week_card:check_open(Role) of
		  {ok, _} ->
		      [{XHoliday, RemainSec, CliType, CliTypeName} | XSum];
		  _ -> XSum
		end;
	    (XHoliday = #holiday{bid = XBid, sort_val = SortVal,
				 start_time = StartTime, end_time = EndTime,
				 cli_type = CliType,
				 cli_type_name = CliTypeName},
	     XSum)
		when Now >= StartTime ->
		RemainSec = max(0, EndTime - Now),
		case (Now < EndTime orelse EndTime =:= 0) andalso
		       SortVal > 0 andalso
			 not
			   lists:member(XBid,
					[1011, 91011, 991011, 1014, 91014,
					 991014, 1015, 91015, 991015, 1016,
					 91016, 991016, 1017, 91017, 991017,
					 1018, 91018, 991018, 1019, 91019,
					 991019, 1020, 91020, 991020, 1024,
					 91024, 991024, 1025, 91025, 991025,
					 1029, 91029, 991029, 3040, 93040,
					 993040, 1031, 91031, 991031, 7004,
					 97004, 997004, 3047, 93047, 993047,
					 7010, 97010, 997010])
		    of
		  true ->
		      case lists:member(XBid,
					[1003, 91003, 991003, 1008, 91008,
					 991008, 1014, 91014, 991014, 1015,
					 91015, 991015, 1016, 91016, 991016,
					 1017, 91017, 991017, 1018, 91018,
					 991018, 1019, 91019, 991019, 1020,
					 91020, 991020, 1046, 91046, 991046])
			  of
			false ->
			    case lists:member(XBid, []) of
			      false ->
				  [{XHoliday, RemainSec, CliType, CliTypeName}
				   | XSum];
			      true when IsWhite ->
				  [{XHoliday, RemainSec, CliType, CliTypeName}
				   | XSum];
			      _ -> XSum
			    end;
			true ->
			    case holiday_rule:is_gain_reward(Role, XHoliday) of
			      true -> XSum;
			      _ ->
				  [{XHoliday, RemainSec, CliType, CliTypeName}
				   | XSum]
			    end
		      end;
		  false ->
		      case lists:member(XBid, []) of
			true ->
			    [{XHoliday, RemainSec, CliType, CliTypeName}
			     | XSum];
			false -> XSum
		      end
		end;
	    (_, XSum) -> XSum
	end,
    HolidayList2 = lists:foldr(F, [], HolidayList),
    {HolidayList2}.

-spec holiday_one(#role{}, pos_integer()) -> tuple().

holiday_one(Role, Bid) ->
    {CliType, RemainSec, MyAim, AimList, ItemEff,
     IntArgList, CliReward, RankList} =
	holiday_lib:qry(Bid, Role),
    {Bid, CliType, RemainSec, MyAim, AimList, ItemEff,
     IntArgList, CliReward, RankList}.

-spec take(#role{}, pos_integer(), pos_integer(),
	   pos_integer()) -> {error, bitstring()} |
			     {ok, bitstring(), #role{}}.

take(Role, Bid, Aim, Arg) ->
    case holiday_lib:get_mod(Bid) of
      undefined -> {error, lang:get(<<"没有奖励可领取"/utf8>>)};
      holiday_rule_desc ->
	  {error, lang:get(<<"没有奖励可领取"/utf8>>)};
      Mod ->
	  case holiday_lib:get_open_holiday(Role, Bid) of
	    Holiday = #holiday{} ->
		Mod:take(Holiday, Role, Aim, Arg);
	    _ -> {error, lang:get(<<"活动不存在"/utf8>>)}
	  end
    end.

-spec point(#role{}, pos_integer()) -> {ok, #role{}}.

point(Role, Bid)
    when Bid == 1036 orelse
	   Bid == 91036 orelse Bid == 991036 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      Holiday = #holiday{camp_id = CampId} ->
	  {ShowCount, RealCount, RealDay, _, GetAimList} =
	      holiday_lib:get_tv_val(CampId, Bid, Role),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NewRole = holiday_lib:set_tv_val(CampId, Role,
					   {ShowCount, RealCount, RealDay, 1,
					    GetAimList},
					   ExpireSec),
	  holiday:push_bid_can_reward(NewRole, Bid),
	  NewRole;
      _ -> Role
    end;
point(Role, Bid)
    when Bid == 3043 orelse
	   Bid == 93043 orelse Bid == 993043 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      Holiday = #holiday{camp_id = CampId} ->
	  {_, AwardId, UseLists} = case
				     holiday_lib:get_tv_val(CampId, Bid, Role)
				       of
				     {IsPointT, AwardIdT} ->
					 {IsPointT, AwardIdT, []};
				     {IsPointT, AwardIdT, UseListsT} ->
					 {IsPointT, AwardIdT, UseListsT};
				     Temp -> Temp
				   end,
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NewRole = holiday_lib:set_tv_val(CampId, Role,
					   {1, AwardId, UseLists}, ExpireSec),
	  holiday:push_bid_can_reward(NewRole, Bid),
	  NewRole;
      _ -> Role
    end;
point(Role, Bid) ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      Holiday = #holiday{camp_id = CampId}
	  when Bid =:= 3021 orelse
		 Bid =:= 93021 orelse
		   Bid =:= 993021 orelse
		     Bid =:= 3027 orelse
		       Bid =:= 93027 orelse Bid =:= 993027 ->
	  Lists = holiday_lib:get_tv_val(CampId, Bid, Role),
	  NewList = lists:keystore(holiday_point, 1, Lists,
				   {holiday_point, 1}),
	  ExpireSec = holiday_lib:get_tv_timeout(Holiday),
	  NewRole = holiday_lib:set_tv_val(CampId, Role, NewList,
					   ExpireSec),
	  holiday:push_bid_can_reward(NewRole, Bid),
	  NewRole;
      #holiday{tbid = TBid}
	  when Bid =:= 7007 orelse
		 Bid =:= 97007 orelse Bid =:= 997007 ->
	  NewRole = var:set_list_val(Role, day, 76, TBid, 1),
	  holiday:push_bid_can_reward(NewRole, Bid),
	  NewRole;
      _ -> Role
    end.

point2(Role, 91029) ->
    Val = var:get_var(Role, day, 78, 1),
    sys_conn:pack_send(16687, {91029, Val}),
    var:set_var(Role, day, 78, 0);
point2(Role, Bid)
    when Bid == 991030 orelse
	   Bid == 991033 orelse Bid == 991034 ->
    case holiday_lib:qry(Bid, Role) of
      {_CliType, _RemainSec, _MyAim, AimList = [_ | _],
       _ItemEff, _IntArgList, _CliReward, _RankList} ->
	  F = fun ({_Aim, _AimStr, Status, _ItemList,
		    _AimIntArgList},
		   Sum) ->
		      case Status of
			0 -> Sum + 1;
			_ -> Sum
		      end;
		  (_Unknow, Sum) ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday173, _,
			 {__Levelholiday173, __Tracesholiday173}}
			    when __Levelholiday173 band 8 /= 0 orelse
				   __Tracesholiday173 /= [] ->
			    lager:do_log(error,
					 [{module, holiday}, {function, point2},
					  {line, 173},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[~ts]活动[Bid:~w]奖励红点匹配错误:~w",
						       [Role#role.name, Bid,
							_Unknow]),
					 none, 4096, 8, __Levelholiday173,
					 __Tracesholiday173, lager_event,
					 __Pidholiday173);
			_ -> ok
		      end,
		      Sum
	      end,
	  Num = lists:foldl(F, 0, AimList),
	  IsFirst = var:get_list_val(Role, day, 76, Bid, 0),
	  Val = util:if_true(IsFirst =:= 0 andalso Num > 0, 1, 0),
	  sys_conn:pack_send(16687, {Bid, Val}),
	  var:set_list_val(Role, day, 76, Bid, 1);
      _ -> Role
    end;
point2(Role, Bid) ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{tbid = TBid} ->
	  IsFirst = var:get_list_val(Role, day, 76, TBid, 0),
	  Val = util:if_true(IsFirst =:= 0, 1, 0),
	  sys_conn:pack_send(16687, {Bid, Val}),
	  NewRole = var:set_list_val(Role, day, 76, TBid, 1),
	  case TBid == 3048 of
	    true -> holiday:push_bid_can_reward(NewRole, Bid);
	    _ -> skip
	  end,
	  NewRole;
      _ -> Role
    end.

-spec push_bid_can_reward(#role{},
			  Bid :: pos_integer()) -> ok.

push_bid_can_reward(Role, Bid) ->
    sys_conn:pack_send(16606,
		       {Bid, get_reward_num(Role, Bid)}),
    ok.

push_bid_can_reward(_Role, Bid, Status) ->
    sys_conn:pack_send(16606, {Bid, Status}), ok.

-spec can_get_reward(#role{}, 0..3) -> list().

can_get_reward(Role, 4) ->
    can_get_reward(Role, 3) ++ can_get_reward(Role, 1);
can_get_reward(Role, Type) ->
    HolidayList = holiday_lib:list_type_holiday(Role, Type),
    CanGetList = do_can_get_reward(Role, HolidayList, []),
    CanGetList.

do_can_get_reward(_Role, [], R) -> R;
do_can_get_reward(Role,
		  [XHoliday = #holiday{bid = Bid, sort_val = SortVal}
		   | L],
		  R) ->
    R2 = case lists:member(Bid,
			   [1011, 91011, 991011, 1024, 91024, 991024, 1025,
			    91025, 991025, 1029, 91029, 991029])
	     of
	   false when SortVal > 0 ->
	       case holiday_lib:is_open(XHoliday) of
		 false -> R;
		 true ->
		     Num = get_reward_num(Role, Bid),
		     case Num > 0 of
		       false -> R;
		       true -> [{Bid, Num} | R]
		     end
	       end;
	   _ -> R
	 end,
    do_can_get_reward(Role, L, R2).

get_reward_num(Role, Bid)
    when Bid =:= 1008 orelse
	   Bid =:= 91008 orelse Bid =:= 991008 ->
    case holiday_lib:qry(Bid, Role) of
      {_CliType, _RemainSec, IsActivate, AimList = [_ | _],
       _ItemEff, _IntArgList, _CliReward, _RankList} ->
	  case IsActivate > 0 of
	    true ->
		F = fun ({_Aim, _AimStr, Status, _ItemList,
			  _AimIntArgList},
			 Sum) ->
			    case Status of
			      1 -> Sum + 1;
			      _ -> Sum
			    end;
			(_Unknow, Sum) ->
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
			      {__Pidholiday251, _,
			       {__Levelholiday251, __Tracesholiday251}}
				  when __Levelholiday251 band 8 /= 0 orelse
					 __Tracesholiday251 /= [] ->
				  lager:do_log(error,
					       [{module, holiday},
						{function, get_reward_num},
						{line, 251},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("[~ts]活动[Bid:~w]奖励红点匹配错误:~w",
							     [Role#role.name,
							      Bid, _Unknow]),
					       none, 4096, 8, __Levelholiday251,
					       __Tracesholiday251, lager_event,
					       __Pidholiday251);
			      _ -> ok
			    end,
			    Sum
		    end,
		Num = lists:foldl(F, 0, AimList),
		Num;
	    _ -> 0
	  end;
      _ -> 0
    end;
get_reward_num(Role, Bid)
    when Bid =:= 3002 orelse
	   Bid =:= 93002 orelse Bid =:= 993002 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  case lev_gift:get_lev_gift_status(Role) of
	    true -> 1;
	    _ -> 0
	  end;
      _ -> 0
    end;
get_reward_num(_Role, Bid)
    when Bid =:= 1011 orelse
	   Bid =:= 91011 orelse
	     Bid =:= 991011 orelse
	       Bid =:= 1024 orelse
		 Bid =:= 91024 orelse
		   Bid =:= 991024 orelse
		     Bid =:= 1025 orelse
		       Bid =:= 91025 orelse Bid =:= 991025 ->
    0;
get_reward_num(Role, Bid)
    when Bid =:= 3009 orelse
	   Bid =:= 93009 orelse Bid =:= 993009 ->
    case holiday_lib:qry(Bid, Role) of
      {_CliType, RemainSec, _MyAim, _AimList, _ItemEff,
       IntArgList, _CliReward, _RankList}
	  when RemainSec > 0 andalso RemainSec =< 86400 ->
	  {_, Status, _} = list_util:keyfind(3, 1, IntArgList,
					     {3, 1, <<>>}),
	  util:if_true(Status =:= 1, 0, 1);
      _ -> 0
    end;
get_reward_num(Role = #role{m_lanterm_adventure =
				#m_lanterm_adventure{quest_list = L}},
	       Bid)
    when Bid =:= 3018 orelse
	   Bid =:= 93018 orelse Bid =:= 993018 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  length([Status
		  || #quest{finish = Status} <- L, Status == 1]);
      _ -> 0
    end;
get_reward_num(Role = #role{m_lanterm_adventure1 =
				#m_lanterm_adventure1{quest_list = L}},
	       Bid)
    when Bid =:= 3031 orelse
	   Bid =:= 93031 orelse Bid =:= 993031 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  length([Status
		  || #quest{finish = Status} <- L, Status == 1]);
      _ -> 0
    end;
get_reward_num(Role = #role{m_lanterm_adventure2 =
				#m_lanterm_adventure2{quest_list = L}},
	       Bid)
    when Bid =:= 3032 orelse
	   Bid =:= 93032 orelse Bid =:= 993032 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  length([Status
		  || #quest{finish = Status} <- L, Status == 1]);
      _ -> 0
    end;
get_reward_num(Role = #role{m_lanterm_adventure3 =
				#m_lanterm_adventure3{quest_list = L}},
	       Bid)
    when Bid =:= 3033 orelse
	   Bid =:= 93033 orelse
	     Bid =:= 993033 orelse Bid =:= 9993033 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  length([Status
		  || #quest{finish = Status} <- L, Status == 1]);
      _ -> 0
    end;
get_reward_num(Role, Bid)
    when Bid =:= 3019 orelse
	   Bid =:= 93019 orelse Bid =:= 993019 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  util:if_true(var:get_var(Role, day, 68, 0) < 1, 1, 0);
      _ -> 0
    end;
get_reward_num(Role, Bid)
    when Bid =:= 3021 orelse
	   Bid =:= 93021 orelse
	     Bid =:= 993021 orelse
	       Bid =:= 3027 orelse
		 Bid =:= 93027 orelse Bid =:= 993027 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{camp_id = CampId} ->
	  List = holiday_lib:get_tv_val(CampId, Bid, Role),
	  case lists:keyfind(holiday_point, 1, List) of
	    {_, 1} -> 0;
	    _ -> 1
	  end;
      _ -> 0
    end;
get_reward_num(Role = #role{m_holiday_dial =
				#m_holiday_dial{award_list = List}},
	       Bid)
    when Bid =:= 3022 orelse
	   Bid =:= 93022 orelse Bid =:= 993022 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  Flag = var:get_var(Role, day, 73, 0),
	  case [State || {_, State} <- List, State == 1] of
	    _ when Flag == 0 -> 1;
	    [] -> 0;
	    _ -> 1
	  end;
      _ -> 0
    end;
get_reward_num(Role, Bid)
    when Bid =:= 3024 orelse
	   Bid =:= 93024 orelse Bid =:= 993024 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{tbid = TBid} ->
	  {_, HasCount} = package:count(by_base_id,
					break_egg_data:get_const(item_bid),
					Role#role.p_bag),
	  IsFirst = var:get_list_val(Role, day, 76, TBid, 0),
	  case IsFirst =:= 0 andalso HasCount > 0 of
	    true -> 1;
	    _ -> 0
	  end;
      _ -> 0
    end;
get_reward_num(_Role, Bid)
    when Bid =:= 1031 orelse
	   Bid =:= 91031 orelse Bid =:= 991031 ->
    IsPoint = util:get(holiday_holy_eqm_point, 0),
    put(holiday_holy_eqm_point, 0),
    IsPoint;
get_reward_num(#role{m_holiday_accumulate =
			 #m_holiday_accumulate{day_state = State}},
	       Bid)
    when Bid =:= 1021 ->
    case State of
      1 -> 1;
      _ -> 0
    end;
get_reward_num(Role, Bid)
    when Bid =:= 1036 orelse
	   Bid =:= 91036 orelse Bid =:= 991036 ->
    case holiday_lib:qry(Bid, Role) of
      {_CliType, _RemainSec, _MyAim, AimList = [_ | _],
       _ItemEff, IntArgList, _CliReward, _RankList} ->
	  {_, IsRedPoint, _} = list_util:keyfind(3, 1, IntArgList,
						 {3, 0, <<>>}),
	  F = fun ({_Aim, _AimStr, Status, _ItemList,
		    _AimIntArgList},
		   Sum) ->
		      case Status of
			1 -> Sum + 1;
			_ -> Sum
		      end;
		  (_Unknow, Sum) ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday365, _,
			 {__Levelholiday365, __Tracesholiday365}}
			    when __Levelholiday365 band 8 /= 0 orelse
				   __Tracesholiday365 /= [] ->
			    lager:do_log(error,
					 [{module, holiday},
					  {function, get_reward_num},
					  {line, 365},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[~ts]活动[Bid:~w]奖励红点匹配错误:~w",
						       [Role#role.name, Bid,
							_Unknow]),
					 none, 4096, 8, __Levelholiday365,
					 __Tracesholiday365, lager_event,
					 __Pidholiday365);
			_ -> ok
		      end,
		      Sum
	      end,
	  NumT = lists:foldl(F, 0, AimList),
	  Num = util:if_true(IsRedPoint == 1, NumT, NumT + 1),
	  Num;
      _ -> 0
    end;
get_reward_num(Role = #role{m_holiday_boss_new =
				#m_holiday_boss_new{count = Count,
						    order_id = OrderId}},
	       Bid)
    when Bid =:= 7007 orelse
	   Bid =:= 97007 orelse Bid =:= 997007 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  case Count > 0 andalso OrderId =< 15 of
	    true -> 1;
	    _ -> 0
	  end;
      _ -> 0
    end;
get_reward_num(Role = #role{m_holiday_boss =
				#m_holiday_boss{count = Count,
						order_id = OrderId}},
	       Bid)
    when Bid =:= 7006 orelse
	   Bid =:= 97006 orelse Bid =:= 997006 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  case Count > 0 andalso
		 OrderId =< holiday_boss_data:max_order()
	      of
	    true -> 1;
	    _ -> 0
	  end;
      _ -> 0
    end;
get_reward_num(Role, Bid)
    when Bid =:= 3034 orelse
	   Bid =:= 93034 orelse Bid =:= 993034 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  util:if_true(var:get_var(Role, day, 95, 0) < 1, 1, 0);
      _ -> 0
    end;
get_reward_num(Role, Bid)
    when Bid =:= 3051 orelse
	   Bid =:= 93051 orelse Bid =:= 993051 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  util:if_true(var:get_var(Role, day, 132, 0) < 1, 1, 0);
      _ -> 0
    end;
get_reward_num(Role, Bid)
    when Bid =:= 3035 orelse
	   Bid =:= 93035 orelse Bid =:= 993035 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  FreeTime1 = holiday_predict:get_free_ref_time(1) -
			holiday_predict:get_ref_time(Role, 1),
	  FreeTime2 = holiday_predict:get_free_ref_time(2) -
			holiday_predict:get_ref_time(Role, 2),
	  util:if_true(FreeTime1 > 0 orelse FreeTime2 > 0, 1, 0);
      _ -> 0
    end;
get_reward_num(Role = #role{m_holiday_term_begins =
				#m_holiday_term_begins{order_id = OrderId,
						       fight_count = FightCount,
						       order_endtime =
							   OrderEndTime}},
	       Bid)
    when Bid =:= 7008 orelse
	   Bid =:= 97008 orelse Bid =:= 997008 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  Now = date:unixtime(),
	  Flag = case OrderId > 20 of
		   false -> FightCount > 0;
		   _ -> false
		 end,
	  case Now > OrderEndTime of
	    false ->
		PaperId =
		    holiday_term_begins_data:get_const(paper_item_id),
		{_, PaperNum} = package:count(by_base_id, PaperId,
					      Role#role.p_bag),
		util:if_true(Flag orelse PaperNum > 100, 1, 0);
	    _ ->
		PaperId =
		    holiday_term_begins_data:get_const(paper_item_id),
		{_, PaperNum} = package:count(by_base_id, PaperId,
					      Role#role.p_bag),
		{ItemId, _} =
		    holiday_term_begins_data:get_const(boss_fight_cost),
		{_, HasNum} = package:count(by_base_id, ItemId,
					    Role#role.p_bag),
		util:if_true(Flag orelse
			       PaperNum > 100 orelse HasNum > 0,
			     1, 0)
	  end;
      _ -> 0
    end;
get_reward_num(Role = #role{m_holiday_petard =
				#m_holiday_petard{petard_reward =
						      PetardReward}},
	       Bid)
    when Bid =:= 3037 orelse
	   Bid =:= 93037 orelse Bid =:= 993037 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  PaperId = holiday_petard_data:get_const(meteor_bid),
	  {_, PaperNum} = package:count(by_base_id, PaperId,
					Role#role.p_bag),
	  Flag = lists:keyfind(1, 2, PetardReward),
	  util:if_true(PaperNum > 0 orelse Flag =/= false, 1, 0);
      _ -> 0
    end;
get_reward_num(Role = #role{m_holiday_merge_goal =
				#m_merge_goal{reward = RewardList}},
	       Bid)
    when Bid =:= 3039 orelse
	   Bid =:= 93039 orelse
	     Bid =:= 993039 orelse Bid =:= 9993039 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  {_SysTemCampId, Score, MaxScore} =
	      sys_env:get(merge_goal, {0, 0, 0}),
	  {NowLev, _NowScore, _NowMaxScore} =
	      holiday_merge_goal_mgr:get_lev_score(Score, MaxScore),
	  RewardNum = length([Id
			      || Id <- RewardList, Id =< NowLev]),
	  CanNum = max(0, NowLev - RewardNum - 1),
	  CanNum;
      _ -> 0
    end;
get_reward_num(Role, Bid)
    when Bid =:= 3041 orelse
	   Bid =:= 93041 orelse Bid =:= 993041 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  util:if_true(var:get_var(Role, day, 109, 0) < 1, 1, 0);
      _ -> 0
    end;
get_reward_num(Role, Bid)
    when Bid =:= 3042 orelse
	   Bid =:= 93042 orelse Bid =:= 993042 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} -> 0;
      _ -> 0
    end;
get_reward_num(Role, Bid)
    when Bid =:= 3043 orelse
	   Bid =:= 93043 orelse Bid =:= 993043 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{camp_id = CampId} ->
	  {IsPoint, _} = case holiday_lib:get_tv_val(CampId, Bid,
						     Role)
			     of
			   {IsPointT, AwardIdT} -> {IsPointT, AwardIdT};
			   {IsPointT, AwardIdT, _} -> {IsPointT, AwardIdT};
			   Temp -> Temp
			 end,
	  util:if_true(IsPoint < 1, 1, 0);
      _ -> 0
    end;
get_reward_num(Role, Bid)
    when Bid =:= 3048 orelse
	   Bid =:= 93048 orelse Bid =:= 993048 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{tbid = TBid} ->
	  IsFirst = var:get_list_val(Role, day, 76, TBid, 0),
	  case IsFirst =:= 0 of
	    true -> 1;
	    _ -> 0
	  end;
      _ -> 0
    end;
get_reward_num(Role = #role{m_holiday_valentines =
				#m_holiday_valentines{reward = RewardList}},
	       Bid)
    when Bid =:= 3049 orelse
	   Bid =:= 93049 orelse Bid =:= 993049 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{} ->
	  {_SysTemCampId, Score, MaxScore} =
	      sys_env:get(valentines_score, {0, 0, 0}),
	  {NowLev, _NowScore, _NowMaxScore} =
	      holiday_valentines:get_lev_score(Score, MaxScore),
	  RewardNum = length([Id
			      || Id <- RewardList, Id =< NowLev]),
	  CanNum = max(0, NowLev - RewardNum - 1),
	  LoginFlag = var:get_var(Role, day, 125, 0),
	  Flag = util:if_true(CanNum > 0 orelse LoginFlag =:= 0,
			      1, 0),
	  Flag;
      _ -> 0
    end;
get_reward_num(Role = #role{m_holiday_new_week_card =
				#m_holiday_new_week_card{award_list = List,
							 day = Day}},
	       Bid)
    when Bid =:= 3052 orelse
	   Bid =:= 93052 orelse Bid =:= 993052 ->
    case holiday_new_week_card:check_open(Role) of
      {ok, AllAwardList} ->
	  LoginFlag = var:get_var(Role, day, 152, 0),
	  Fun = fun ({Id, _, _}) ->
			RFlag = lists:member(Id, List),
			case Day >= Id andalso RFlag =:= false of
			  true -> true;
			  _ -> false
			end
		end,
	  CanNum = lists:any(Fun, AllAwardList),
	  Flag = util:if_true(CanNum =:= true orelse
				LoginFlag =:= 0,
			      1, 0),
	  Flag;
      _ -> 0
    end;
get_reward_num(Role = #role{m_holiday_practise_tower =
				#m_holiday_practise_tower{times = Time}},
	       Bid)
    when Bid =:= 3053 orelse
	   Bid =:= 93053 orelse Bid =:= 993053 ->
    case holiday_lib:get_open_holiday(Role, Bid) of
      #holiday{end_time = EndTime} ->
	  Now = date:unixtime(),
	  case EndTime - Now > 86400 of
	    true -> Time;
	    _ -> 0
	  end;
      _ -> 0
    end;
get_reward_num(Role, Bid) ->
    case holiday_lib:qry(Bid, Role) of
      {_CliType, _RemainSec, _MyAim, AimList = [_ | _],
       _ItemEff, _IntArgList, _CliReward, _RankList} ->
	  F = fun ({_Aim, _AimStr, Status, _ItemList,
		    _AimIntArgList},
		   Sum) ->
		      case Status of
			1 -> Sum + 1;
			_ -> Sum
		      end;
		  (_Unknow, Sum) ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidholiday541, _,
			 {__Levelholiday541, __Tracesholiday541}}
			    when __Levelholiday541 band 8 /= 0 orelse
				   __Tracesholiday541 /= [] ->
			    lager:do_log(error,
					 [{module, holiday},
					  {function, get_reward_num},
					  {line, 541},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("[~ts]活动[Bid:~w]奖励红点匹配错误:~w",
						       [Role#role.name, Bid,
							_Unknow]),
					 none, 4096, 8, __Levelholiday541,
					 __Tracesholiday541, lager_event,
					 __Pidholiday541);
			_ -> ok
		      end,
		      Sum
	      end,
	  Num = lists:foldl(F, 0, AimList),
	  Num;
      _ -> 0
    end.


