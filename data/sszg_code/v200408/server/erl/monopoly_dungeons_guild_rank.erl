-file("src/mod/monopoly_dungeons/monopoly_dungeons_g"
      "uild_rank.erl",
      1).

-module(monopoly_dungeons_guild_rank).

-lager_records([{guild_marketplace,
		 [ver, id, next_booth_id, item_list, board_list]},
		{market_board,
		 [ver, type, name, operation, reward_list, unixtime]},
		{market_item,
		 [ver, id, base_id, num, attr, extra, holy_eqm_attr,
		  end_time, score]},
		{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]},
		{g_mem_red_packet,
		 [id, rid, name, face_id, avatar_bid, post, type, num,
		  max_num, val, max_val, list, mems, start_time, end_time,
		  msg_id, face_update_time, face_file]},
		{guild_data, [lev, exp, num, maintain]},
		{guild_position, [id, name, limit]},
		{g_merge,
		 [gid, gname, gid2, gname2, role_id, rname, end_time,
		  gold]},
		{guild_rank,
		 [id, name, lev, exp, leader_name, leader_id,
		  leader_face, leader_lev, members_num, members_max,
		  apply_lev, apply_type, create_time, power, index,
		  leader_avatar_bid, leader_look_id,
		  leader_face_update_time, leader_face_file,
		  apply_power]},
		{guild_apply,
		 [gid, id, pid, name, face, lev, power, post, vip_lev,
		  online, apply_time, face_update_time, face_file]},
		{guild_member,
		 [ver, id, pid, name, face, lev, sex, power, post,
		  vip_lev, online, join_time, login_time, donate,
		  day_donate, avatar_bid, red_packet_num,
		  red_packet_price, red_packet_time, red_packet_recv_num,
		  red_packet_recv_time, active_lev, day_donate_type,
		  day_donate_time, day_dun_time, day_war_time, look_id,
		  face_update_time, face_file]},
		{guild_war_box,
		 [order, rid, sid, name, item_id, item_num]},
		{guild_cache, []},
		{guild,
		 [ver, id, name, lev, exp, day_exp, pid, leader_name,
		  leader_id, members, members_num, members_max, next_id,
		  sign, apply_lev, apply_type, recruit_num, cache, sync,
		  create_time, power, rename_time, lock_time, donate_exp,
		  red_packet, guild_war_box_end_time, guild_war_relust,
		  guild_war_box, guild_war_sign, day_var,
		  vice_leader_mail, normal_mail, vitality, apply_power]},
		{guild_bag,
		 [ver, id, pid, name, post, lev, join_time, quit_time,
		  send_time, send_num, recv_num, true_quit_time,
		  quit_post]},
		{guild_log_info,
		 [id, guild_id, type, time, role_id, role_name, msg]},
		{guild_log, [key, list]},
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
		{monopoly_dungeons_guild_rank,
		 [ver, id, stage_guild_rank]},
		{guild_stage_rank,
		 [ver, id, name, dps, unixtime, is_reward, leader_name,
		  member, members_max, lev]},
		{monopoly_dungeons,
		 [ver, id, camp_id, stage_list, buffs]},
		{dungeons_stage, [ver, id, develop, boss_list, rank]},
		{dungeons_boss, [ver, id, base_id, hp, max_hp]},
		{stage_rank,
		 [ver, id, name, dps, unixtime, lev, face_id, avatar_bid,
		  power]},
		{state, []}]).

-behaviour(gen_server).

-export([update_monopoly_dungeons_guild_rank/1,
	 get_monopoly_dungeons_guild_rank/1, in_rank/8, push/3,
	 gm_delete/0, merge_convert/1]).

-export([call_apply/1, apply/1]).

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

-file("src/mod/monopoly_dungeons/monopoly_dungeons_g"
      "uild_rank.erl",
      21).

-file("inc/monopoly_dungeons.hrl", 1).

-record(stage_rank,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: string(), dps = 0  :: pos_integer(),
	 unixtime = 0  :: pos_integer(),
	 lev = 0  :: pos_integer(),
	 face_id = 0  :: pos_integer(),
	 avatar_bid = 0  :: pos_integer(),
	 power = 0  :: pos_integer()}).

-record(dungeons_boss,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 base_id = 0  :: pos_integer(), hp = 0  :: pos_integer(),
	 max_hp = 0  :: pos_integer()}).

-record(dungeons_stage,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 develop = 0  :: pos_integer(),
	 boss_list = []  :: list(), rank = []  :: list()}).

-record(monopoly_dungeons,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 camp_id = 0  :: pos_integer(),
	 stage_list = []  :: list(), buffs = []  :: list()}).

-record(guild_stage_rank,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: string(), dps = 0  :: pos_integer(),
	 unixtime = 0  :: pos_integer(),
	 is_reward = 0  :: boolean(),
	 leader_name = <<>>  :: string(),
	 member = 0  :: pos_integer(),
	 members_max = 0  :: pos_integer(),
	 lev = 0  :: pos_integer()}).

-record(monopoly_dungeons_guild_rank,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 stage_guild_rank = []  :: list()}).

-file("src/mod/monopoly_dungeons/monopoly_dungeons_g"
      "uild_rank.erl",
      22).

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

-file("src/mod/monopoly_dungeons/monopoly_dungeons_g"
      "uild_rank.erl",
      23).

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

-file("src/mod/monopoly_dungeons/monopoly_dungeons_g"
      "uild_rank.erl",
      24).

-file("inc/log.hrl", 1).

-file("src/mod/monopoly_dungeons/monopoly_dungeons_g"
      "uild_rank.erl",
      25).

-file("inc/guild.hrl", 1).

-record(guild_log, {key = {0, <<>>}, list = []}).

-record(guild_log_info,
	{id = 0, guild_id = {0, <<>>}, type = 0, time = 0,
	 role_id = {0, <<>>}, role_name = 0, msg = <<>>}).

-record(guild_bag,
	{ver = 2, id = {0, <<>>}, pid, name = <<>>, post = 0,
	 lev = 0, join_time = 0, quit_time = 0, send_time = 0,
	 send_num = 0, recv_num = 0, true_quit_time = 0,
	 quit_post = 0}).

-record(guild,
	{ver = 7, id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 day_exp = 0, pid = 0, leader_name = <<>>,
	 leader_id = {0, <<>>}, members = [], members_num = 1,
	 members_max = 50, next_id = 1, sign = <<>>,
	 apply_lev = guild_data:get_const(guild_min_lev),
	 apply_type = 1, recruit_num = 0, cache, sync = 0,
	 create_time = 0, power = 0, rename_time = 0,
	 lock_time = 0, donate_exp = 0, red_packet = [],
	 guild_war_box_end_time = 0, guild_war_relust = 0,
	 guild_war_box = [], guild_war_sign = [], day_var = [],
	 vice_leader_mail = 0, normal_mail = 0, vitality = 0,
	 apply_power = 0}).

-record(guild_cache, {}).

-record(guild_war_box,
	{order = 0, rid = 0, sid = <<>>, name = <<>>,
	 item_id = 0, item_num = 0}).

-record(guild_member,
	{ver = 6, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, sex = 1, power = 0, post = 0,
	 vip_lev = 0, online = 1, join_time = 0, login_time = 0,
	 donate = 0, day_donate = 0, avatar_bid = 0,
	 red_packet_num = 0, red_packet_price = 0,
	 red_packet_time = 0, red_packet_recv_num = 0,
	 red_packet_recv_time = 0, active_lev = 0,
	 day_donate_type = 0, day_donate_time = 0,
	 day_dun_time = 0, day_war_time = 0, look_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(guild_apply,
	{gid = {0, <<>>}, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, power = 0, post = 0, vip_lev = 0,
	 online = 1, apply_time = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(guild_rank,
	{id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 leader_name = <<>>, leader_id = {0, <<>>},
	 leader_face = 0, leader_lev = 0, members_num = 1,
	 members_max = 50, apply_lev = 0, apply_type = 1,
	 create_time = 0, power = 0, index = 0,
	 leader_avatar_bid = 0, leader_look_id = 0,
	 leader_face_update_time = 0, leader_face_file = <<>>,
	 apply_power = 0}).

-record(g_merge,
	{gid = {0, <<>>}, gname = <<>>, gid2 = {0, <<>>},
	 gname2 = <<>>, role_id = {0, <<>>}, rname = <<>>,
	 end_time = 0, gold = 0}).

-record(guild_position,
	{id = 0, name = <<>>, limit = []}).

-record(guild_data,
	{lev = 0, exp = 0, num = 0, maintain = 0}).

-record(g_mem_red_packet,
	{id = {{0, <<>>}, 0}, rid = {0, <<>>}, name = <<>>,
	 face_id = 0, avatar_bid = 0, post = <<>>, type = 0,
	 num = 0, max_num = 0, val = 0, max_val = 0, list = [],
	 mems = [], start_time = 0, end_time = 0, msg_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/mod/monopoly_dungeons/monopoly_dungeons_g"
      "uild_rank.erl",
      26).

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

-file("src/mod/monopoly_dungeons/monopoly_dungeons_g"
      "uild_rank.erl",
      27).

-file("inc/guild_marketplace.hrl", 1).

-record(market_item,
	{ver = 1  :: pos_integer(), id = 0  :: pos_integer(),
	 base_id = 0  :: pos_integer(),
	 num = 0  :: pos_integer(), attr = []  :: list(),
	 extra = []  :: list(), holy_eqm_attr = []  :: list(),
	 end_time = []  :: list(), score = 0  :: pos_integer()}).

-record(market_board,
	{ver = 1  :: pos_integer(), type = 1  :: pos_integer(),
	 name = <<>>  :: bitstring(),
	 operation = 1  :: pos_integer(),
	 reward_list = []  :: list(),
	 unixtime = 0  :: pos_integer()}).

-record(guild_marketplace,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 next_booth_id = 1  :: pos_integer(),
	 item_list = []  :: list(), board_list = []  :: list()}).

-file("src/mod/monopoly_dungeons/monopoly_dungeons_g"
      "uild_rank.erl",
      28).

merge_convert(P = #monopoly_dungeons_guild_rank{id =
						    StageId,
						stage_guild_rank =
						    GuildRank}) ->
    case ets:lookup(monopoly_dungeons_guild_rank, StageId)
	of
      [P1 = #monopoly_dungeons_guild_rank{stage_guild_rank =
					      OldGuildRank}] ->
	  NewP = P1#monopoly_dungeons_guild_rank{stage_guild_rank
						     =
						     OldGuildRank ++ GuildRank},
	  ets:insert(monopoly_dungeons_guild_rank, NewP),
	  dets:insert(monopoly_dungeons_guild_rank, NewP),
	  {ok, NewP};
      _ ->
	  ets:insert(monopoly_dungeons_guild_rank, P),
	  dets:insert(monopoly_dungeons_guild_rank, P),
	  {ok, P}
    end;
merge_convert(P) -> {ok, P}.

gm_delete() ->
    ets:delete_all_objects(monopoly_dungeons),
    dets:delete_all_objects(monopoly_dungeons),
    delete_all().

-spec
     update_monopoly_dungeons_guild_rank(pos_integer()) -> ok.

update_monopoly_dungeons_guild_rank(Data) ->
    ets:insert(monopoly_dungeons_guild_rank, Data),
    dets:insert(monopoly_dungeons_guild_rank, Data).

-spec
     get_monopoly_dungeons_guild_rank(tuple()) -> #monopoly_dungeons_guild_rank{} |
						  false.

get_monopoly_dungeons_guild_rank(Id) ->
    case catch ets:lookup(monopoly_dungeons_guild_rank, Id)
	of
      [SA = #monopoly_dungeons_guild_rank{}] -> SA;
      _ -> false
    end.

-spec push(#role{}, pos_integer(), tuple()) -> ok.

push(Role = #role{guild_bag = #guild_bag{id = RoleGid}},
     Code = 27503, {StageId, Flag}) ->
    Data = case
	     monopoly_dungeons_guild_rank:get_monopoly_dungeons_guild_rank(StageId)
	       of
	     #monopoly_dungeons_guild_rank{stage_guild_rank =
					       GuildRank} ->
		 ClientList = [{Gid, Name, Dps, Rank, LeaderName, Member,
				MembersMax, Lev}
			       || {#guild_stage_rank{id = Gid, name = Name,
						     dps = Dps,
						     leader_name = LeaderName,
						     member = Member,
						     members_max = MembersMax,
						     lev = Lev},
				   Rank}
				      <- rank(GuildRank)],
		 RoleClient1 = case lists:keyfind(RoleGid, 1, ClientList)
				   of
				 RoleClient when is_tuple(RoleClient) ->
				     RoleClient;
				 _ -> {{0, <<>>}, <<>>, 0, 0, <<>>, 0, 0, 0}
			       end,
		 case Flag of
		   1 -> {StageId, ClientList, RoleClient1};
		   _ ->
		       {StageId, lists:sublist(ClientList, 3), RoleClient1}
		 end;
	     _ ->
		 {StageId, [], {{0, <<>>}, <<>>, 0, 0, <<>>, 0, 0, 0}}
	   end,
    role:pack_send(Role, Code, Data),
    ok;
push(_, _, _) -> ok.

-spec in_rank(tuple(), string(), pos_integer(),
	      pos_integer(), string(), pos_integer(), pos_integer(),
	      pos_integer()) -> ok.

in_rank(Gid, GName, StageId, Dps, LeaderName,
	MembersNum, MembersMax, GLev) ->
    info({in_rank, Gid, GName, StageId, Dps, LeaderName,
	  MembersNum, MembersMax, GLev}),
    ok.

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> monopoly_dungeons_guild_rank ! Info.

cast(Info) ->
    gen_server:cast(monopoly_dungeons_guild_rank, Info).

call(Info) ->
    case catch gen_server:call(monopoly_dungeons_guild_rank,
			       Info, 10000)
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
	    {__Pidmonopoly_dungeons_guild_rank148, _,
	     {__Levelmonopoly_dungeons_guild_rank148,
	      __Tracesmonopoly_dungeons_guild_rank148}}
		when __Levelmonopoly_dungeons_guild_rank148 band 8 /= 0
		       orelse __Tracesmonopoly_dungeons_guild_rank148 /= [] ->
		lager:do_log(error,
			     [{module, monopoly_dungeons_guild_rank},
			      {function, call}, {line, 148},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [monopoly_dungeons_guild_rank, Info,
					    10000, erlang:get_stacktrace()]),
			     none, 4096, 8,
			     __Levelmonopoly_dungeons_guild_rank148,
			     __Tracesmonopoly_dungeons_guild_rank148,
			     lager_event, __Pidmonopoly_dungeons_guild_rank148);
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
    gen_server:start_link({local,
			   monopoly_dungeons_guild_rank},
			  monopoly_dungeons_guild_rank, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmonopoly_dungeons_guild_rank154, _,
       {__Levelmonopoly_dungeons_guild_rank154,
	__Tracesmonopoly_dungeons_guild_rank154}}
	  when __Levelmonopoly_dungeons_guild_rank154 band 64 /= 0
		 orelse __Tracesmonopoly_dungeons_guild_rank154 /= [] ->
	  lager:do_log(info,
		       [{module, monopoly_dungeons_guild_rank},
			{function, init}, {line, 154},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...",
				     [monopoly_dungeons_guild_rank]),
		       none, 4096, 64, __Levelmonopoly_dungeons_guild_rank154,
		       __Tracesmonopoly_dungeons_guild_rank154, lager_event,
		       __Pidmonopoly_dungeons_guild_rank154);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(monopoly_dungeons_guild_rank,
		   [{file, "./dets/monopoly_dungeons_guild_rank.dets"},
		    {keypos, #monopoly_dungeons_guild_rank.id}]),
    ets:new(monopoly_dungeons_guild_rank,
	    [set, named_table, public,
	     {keypos, #monopoly_dungeons_guild_rank.id}]),
    load_data(),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmonopoly_dungeons_guild_rank163, _,
       {__Levelmonopoly_dungeons_guild_rank163,
	__Tracesmonopoly_dungeons_guild_rank163}}
	  when __Levelmonopoly_dungeons_guild_rank163 band 64 /= 0
		 orelse __Tracesmonopoly_dungeons_guild_rank163 /= [] ->
	  lager:do_log(info,
		       [{module, monopoly_dungeons_guild_rank},
			{function, init}, {line, 163},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成",
				     [monopoly_dungeons_guild_rank]),
		       none, 4096, 64, __Levelmonopoly_dungeons_guild_rank163,
		       __Tracesmonopoly_dungeons_guild_rank163, lager_event,
		       __Pidmonopoly_dungeons_guild_rank163);
      _ -> ok
    end,
    {ok, State}.

handle_call(Request, From, State) ->
    case catch do_handle_call(Request, From, State) of
      {reply, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmonopoly_dungeons_guild_rank171, _,
	     {__Levelmonopoly_dungeons_guild_rank171,
	      __Tracesmonopoly_dungeons_guild_rank171}}
		when __Levelmonopoly_dungeons_guild_rank171 band 8 /= 0
		       orelse __Tracesmonopoly_dungeons_guild_rank171 /= [] ->
		lager:do_log(error,
			     [{module, monopoly_dungeons_guild_rank},
			      {function, handle_call}, {line, 171},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8,
			     __Levelmonopoly_dungeons_guild_rank171,
			     __Tracesmonopoly_dungeons_guild_rank171,
			     lager_event, __Pidmonopoly_dungeons_guild_rank171);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    monopoly_dungeons_guild_rank, 172,
				    _Reason}),
	  {reply, {false, lang:get(<<"执行出错"/utf8>>)}, State}
    end.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(Info, State) ->
    case catch do_handle_info(Info, State) of
      {noreply, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmonopoly_dungeons_guild_rank184, _,
	     {__Levelmonopoly_dungeons_guild_rank184,
	      __Tracesmonopoly_dungeons_guild_rank184}}
		when __Levelmonopoly_dungeons_guild_rank184 band 8 /= 0
		       orelse __Tracesmonopoly_dungeons_guild_rank184 /= [] ->
		lager:do_log(error,
			     [{module, monopoly_dungeons_guild_rank},
			      {function, handle_info}, {line, 184},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8,
			     __Levelmonopoly_dungeons_guild_rank184,
			     __Tracesmonopoly_dungeons_guild_rank184,
			     lager_event, __Pidmonopoly_dungeons_guild_rank184);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    monopoly_dungeons_guild_rank, 185,
				    _Reason}),
	  {noreply, State}
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
      {__Pidmonopoly_dungeons_guild_rank190, _,
       {__Levelmonopoly_dungeons_guild_rank190,
	__Tracesmonopoly_dungeons_guild_rank190}}
	  when __Levelmonopoly_dungeons_guild_rank190 band 64 /= 0
		 orelse __Tracesmonopoly_dungeons_guild_rank190 /= [] ->
	  lager:do_log(info,
		       [{module, monopoly_dungeons_guild_rank},
			{function, terminate}, {line, 190},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64,
		       __Levelmonopoly_dungeons_guild_rank190,
		       __Tracesmonopoly_dungeons_guild_rank190, lager_event,
		       __Pidmonopoly_dungeons_guild_rank190);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_handle_call({apply, M, F, A}, _From, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmonopoly_dungeons_guild_rank202, _,
	     {__Levelmonopoly_dungeons_guild_rank202,
	      __Tracesmonopoly_dungeons_guild_rank202}}
		when __Levelmonopoly_dungeons_guild_rank202 band 8 /= 0
		       orelse __Tracesmonopoly_dungeons_guild_rank202 /= [] ->
		lager:do_log(error,
			     [{module, monopoly_dungeons_guild_rank},
			      {function, do_handle_call}, {line, 202},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8,
			     __Levelmonopoly_dungeons_guild_rank202,
			     __Tracesmonopoly_dungeons_guild_rank202,
			     lager_event, __Pidmonopoly_dungeons_guild_rank202);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    monopoly_dungeons_guild_rank, 203,
				    _Reason}),
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
    end;
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info(reload, State) ->
    {NowCampId, IsReward} =
	sys_env:get(monopoly_dungeons_guild_rank_camp_id,
		    {0, 1}),
    case holiday_lib:get_open_holiday([3040, 93040, 993040])
	of
      #holiday{camp_id = NowCampId} -> skip;
      #holiday{camp_id = NewCampId} when IsReward =:= 0 ->
	  erlang:send_after(10000, self(), reward_rank_new),
	  sys_env:save(monopoly_dungeons_guild_rank_camp_id,
		       {NewCampId, 0});
      #holiday{camp_id = NewCampId} ->
	  delete_all(),
	  sys_env:save(monopoly_dungeons_guild_rank_camp_id,
		       {NewCampId, 0});
      _ when IsReward =:= 0 ->
	  erlang:send_after(10000, self(), reward_rank),
	  sys_env:save(monopoly_dungeons_guild_rank_camp_id,
		       {0, 1});
      _ -> skip
    end,
    {noreply, State};
do_handle_info(reward_rank, State) ->
    reward_rank(), {noreply, State};
do_handle_info(reward_rank_new, State) ->
    reward_rank(), delete_all(), {noreply, State};
do_handle_info({in_rank, Gid, GName, StageId, Dps,
		LeaderName, MembersNum, MembersMax, GLev},
	       State) ->
    Data = case get_monopoly_dungeons_guild_rank(StageId) of
	     MonopolyGuildRank =
		 #monopoly_dungeons_guild_rank{stage_guild_rank =
						   GuildRank} ->
		 NewStageRank = case lists:keyfind(Gid,
						   #guild_stage_rank.id,
						   GuildRank)
				    of
				  StageRank = #guild_stage_rank{is_reward =
								    1} ->
				      StageRank;
				  StageRank = #guild_stage_rank{dps = OldDps} ->
				      StageRank1 =
					  StageRank#guild_stage_rank{name =
									 GName,
								     dps =
									 OldDps
									   +
									   Dps,
								     unixtime =
									 date:unixtime()},
				      StageRank1;
				  _ ->
				      StageRank = #guild_stage_rank{id = Gid,
								    name =
									GName,
								    dps = Dps,
								    unixtime =
									date:unixtime(),
								    leader_name
									=
									LeaderName,
								    member =
									MembersNum,
								    members_max
									=
									MembersMax,
								    lev = GLev},
				      StageRank
				end,
		 NewGuildRank = lists:keystore(Gid, #guild_stage_rank.id,
					       GuildRank, NewStageRank),
		 NewMonopolyGuildRank =
		     MonopolyGuildRank#monopoly_dungeons_guild_rank{stage_guild_rank
									=
									NewGuildRank},
		 NewMonopolyGuildRank;
	     _ ->
		 StageRank = #guild_stage_rank{id = Gid, name = GName,
					       dps = Dps,
					       unixtime = date:unixtime(),
					       leader_name = LeaderName,
					       member = MembersNum,
					       members_max = MembersMax,
					       lev = GLev},
		 MonopolyGuildRank = #monopoly_dungeons_guild_rank{id =
								       StageId,
								   stage_guild_rank
								       =
								       [StageRank]},
		 MonopolyGuildRank
	   end,
    update_monopoly_dungeons_guild_rank(Data),
    {noreply, State};
do_handle_info({apply, M, F, A}, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmonopoly_dungeons_guild_rank276, _,
	     {__Levelmonopoly_dungeons_guild_rank276,
	      __Tracesmonopoly_dungeons_guild_rank276}}
		when __Levelmonopoly_dungeons_guild_rank276 band 8 /= 0
		       orelse __Tracesmonopoly_dungeons_guild_rank276 /= [] ->
		lager:do_log(error,
			     [{module, monopoly_dungeons_guild_rank},
			      {function, do_handle_info}, {line, 276},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8,
			     __Levelmonopoly_dungeons_guild_rank276,
			     __Tracesmonopoly_dungeons_guild_rank276,
			     lager_event, __Pidmonopoly_dungeons_guild_rank276);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    monopoly_dungeons_guild_rank, 277,
				    _Reason}),
	  {noreply, State}
    end;
do_handle_info(_Info, State) -> {noreply, State}.

load_data() ->
    case dets:first(monopoly_dungeons_guild_rank) of
      '$end_of_table' ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmonopoly_dungeons_guild_rank291, _,
	     {__Levelmonopoly_dungeons_guild_rank291,
	      __Tracesmonopoly_dungeons_guild_rank291}}
		when __Levelmonopoly_dungeons_guild_rank291 band 64 /= 0
		       orelse __Tracesmonopoly_dungeons_guild_rank291 /= [] ->
		lager:do_log(info,
			     [{module, monopoly_dungeons_guild_rank},
			      {function, load_data}, {line, 291},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "没有数据需要加载", none, 4096, 64,
			     __Levelmonopoly_dungeons_guild_rank291,
			     __Tracesmonopoly_dungeons_guild_rank291,
			     lager_event, __Pidmonopoly_dungeons_guild_rank291);
	    _ -> ok
	  end,
	  [];
      _ ->
	  dets:traverse(monopoly_dungeons_guild_rank,
			fun (C) ->
				case monopoly_dungeons_ver:do_rank(C) of
				  {false, Reason} ->
				      case {whereis(lager_event),
					    whereis(lager_event),
					    lager_config:get({lager_event,
							      loglevel},
							     {0, []})}
					  of
					{undefined, undefined, _} ->
					    fun () -> {error, lager_not_running}
					    end();
					{undefined, _, _} ->
					    fun () ->
						    {error,
						     {sink_not_configured,
						      lager_event}}
					    end();
					{__Pidmonopoly_dungeons_guild_rank298,
					 _,
					 {__Levelmonopoly_dungeons_guild_rank298,
					  __Tracesmonopoly_dungeons_guild_rank298}}
					    when
					      __Levelmonopoly_dungeons_guild_rank298
						band 8
						/= 0
						orelse
						__Tracesmonopoly_dungeons_guild_rank298
						  /= [] ->
					    lager:do_log(error,
							 [{module,
							   monopoly_dungeons_guild_rank},
							  {function, load_data},
							  {line, 298},
							  {pid,
							   pid_to_list(self())},
							  {node, node()}
							  | lager:md()],
							 io_lib:format("圣夜奇境排行榜数据转换失败:~w",
								       [Reason]),
							 none, 4096, 8,
							 __Levelmonopoly_dungeons_guild_rank298,
							 __Tracesmonopoly_dungeons_guild_rank298,
							 lager_event,
							 __Pidmonopoly_dungeons_guild_rank298);
					_ -> ok
				      end,
				      {done, false};
				  {ok, NewC} ->
				      update_monopoly_dungeons_guild_rank(NewC),
				      continue
				end
			end)
    end.

delete_all() ->
    case ets:info(monopoly_dungeons_guild_rank, size) of
      0 -> skip;
      _ ->
	  ets:delete_all_objects(monopoly_dungeons_guild_rank),
	  dets:delete_all_objects(monopoly_dungeons_guild_rank)
    end.

rank(GuildRank) ->
    GuildRank1 = util:keys_sort([{asc,
				  #guild_stage_rank.unixtime},
				 #guild_stage_rank.dps],
				GuildRank),
    RankList = add_rank(GuildRank1, 1, []),
    RankList.

add_rank([], _, OldRankList) ->
    lists:reverse(OldRankList);
add_rank([Data | Rest], Rank, OldRankList) ->
    add_rank(Rest, Rank + 1, [{Data, Rank} | OldRankList]);
add_rank(_, _, OldRankList) -> OldRankList.

reward_rank() ->
    GuildRankList =
	ets:tab2list(monopoly_dungeons_guild_rank),
    [reward_rank1(StageRank, rank(StageRank), MonopolyRank)
     || MonopolyRank =
	    #monopoly_dungeons_guild_rank{stage_guild_rank =
					      StageRank}
	    <- GuildRankList].

reward_rank1([], _, MonopolyRank) ->
    update_monopoly_dungeons_guild_rank(MonopolyRank);
reward_rank1([GRank = #guild_stage_rank{id = Gid,
					is_reward = 0, name = GName}
	      | Rest],
	     RankList,
	     MonopolyRank = #monopoly_dungeons_guild_rank{id =
							      StageId,
							  stage_guild_rank =
							      StageRank}) ->
    {_, Rank} = lists:keyfind(GRank, 1, RankList),
    case monopoly_dungeons_data:get_rank_reward({StageId,
						 Rank})
	of
      {RewardList, StageName} when is_list(RewardList) ->
	  stage_rank_reward(Gid, StageId, Rank, RewardList,
			    StageName, GName),
	  NewGRank = GRank#guild_stage_rank{is_reward = 1},
	  NewGuildRank = lists:keyreplace(Gid,
					  #guild_stage_rank.id, StageRank,
					  NewGRank),
	  NewMonopolyRank =
	      MonopolyRank#monopoly_dungeons_guild_rank{stage_guild_rank
							    = NewGuildRank},
	  reward_rank1(Rest, RankList, NewMonopolyRank);
      _ -> reward_rank1(Rest, RankList, MonopolyRank)
    end;
reward_rank1([_ | Rest], RankList, MonopolyRank) ->
    reward_rank1(Rest, RankList, MonopolyRank);
reward_rank1(_, _, MonopolyRank) ->
    update_monopoly_dungeons_guild_rank(MonopolyRank).

stage_rank_reward(Gid, _StageId, Rank, RewardList,
		  StageName, GName) ->
    case guild_marketplace:get_guild_marketplace_pid(Gid) of
      {ok, Pid} ->
	  ItemList = make_item_list(RewardList, []),
	  guild_marketplace:info(Pid,
				 {put_into_market, 5, StageName, ItemList}),
	  case guild_lib:elem(Gid, #guild.members) of
	    {ok, Members = [_ | _]} ->
		Fun1 = fun (#guild_member{id = MemId}) ->
			       Content =
				   util:fbin(lang:get(<<"亲爱的冒险者大人：\n圣夜奇境活动公会排行奖励已结算，恭喜您的公会「~ts」获得了「~ts"
							"」boss挑战公会第~ts名，相关奖励已发放进入公会宝库，请各位冒险者大人前往公会宝库获取"
							"。"/utf8>>),
					     [color:string(green, GName),
					      color:string(green, StageName),
					      color:string(green, Rank)]),
			       Mail = {lang:get(<<"圣夜奇境活动公会排行结算通知"/utf8>>),
				       Content, [], [], "圣夜奇境"},
			       mail:send(MemId, Mail)
		       end,
		lists:map(Fun1, Members);
	    _ -> skip
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
	    {__Pidmonopoly_dungeons_guild_rank414, _,
	     {__Levelmonopoly_dungeons_guild_rank414,
	      __Tracesmonopoly_dungeons_guild_rank414}}
		when __Levelmonopoly_dungeons_guild_rank414 band 8 /= 0
		       orelse __Tracesmonopoly_dungeons_guild_rank414 /= [] ->
		lager:do_log(error,
			     [{module, monopoly_dungeons_guild_rank},
			      {function, stage_rank_reward}, {line, 414},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "找不到公会宝库", none, 4096, 8,
			     __Levelmonopoly_dungeons_guild_rank414,
			     __Tracesmonopoly_dungeons_guild_rank414,
			     lager_event, __Pidmonopoly_dungeons_guild_rank414);
	    _ -> ok
	  end,
	  ok
    end.

make_item_list([], OldItemList) -> OldItemList;
make_item_list([{BaseId, Num} | Rest], OldItemList) ->
    case item:make(BaseId, 0, Num) of
      {ok, [Item]} ->
	  make_item_list(Rest, [{Item, Num} | OldItemList]);
      _ -> make_item_list(Rest, OldItemList)
    end;
make_item_list(_, OldItemList) -> OldItemList.


