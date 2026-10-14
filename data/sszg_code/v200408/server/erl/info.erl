-file("src/gm/info.erl", 1).

-module(info).

-lager_records([{state, []},
		{map_data,
		 [bid, type, name, def_xy, min_lev, max_lev, condition,
		  relive, width, height, grid_x, grid_y, max_pre_layer,
		  start_type, is_single, unit_list, tile_res_list]},
		{map_grid, [map_pid, map_id, base_id, width, height]},
		{map,
		 [id, srv_id, base_id, res_id, pid, ctrl_pid, grid_info,
		  name, condition, num, max_pre_layer, width, height,
		  dynamic_block, layer_flag]},
		{unit_make_args, [pos, evts, disabled]},
		{map_unit,
		 [id, type, activity, status, guide_lev, name, layer,
		  base_id, lev, career, sex, hp, hp_max, speed, x, y, gx,
		  gy, looks]},
		{unit,
		 [id, type, minor_type, pid, activity, combat_pid, name,
		  status, guide_lev, nature, quality, layer, disabled,
		  base_id, lev, career, sex, hp, hp_max, speed, lock,
		  def_status, pos, looks, evt, ts, timeout, t_move, t_atk,
		  extra]},
		{unit_data,
		 [bid, type, minor_type, name, activity, cli_create,
		  guide_lev, status, nature, disabled, condition, lev,
		  career, sex, hp, mp, hp_max, mp_max, speed, lock,
		  t_move, t_atk, range_trace, range_atk, gain, slave,
		  waves, talk, looks, order, data, layer, def_status,
		  status_list, drop_id, act_drops, tran_pos,
		  reward_panel_type, reward, formation, camp_type]},
		{unit_order, [order, type, arg, data, condition, over]},
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
		{xrefr_warn, [filename, line, source, target, check]},
		{xrefr_conf, [extra_paths, xref_defaults, dirs]},
		{role_online,
		 [id, pid, conn_pid, name, account, status, lev, sex,
		  realm, platform, channel, career, power, face_id,
		  face_file, face_update_time, socket, max_dun_id,
		  province_name, city_name]},
		{ip_info, [ip, connected, max_conn, conn_times]},
		{link, [socket, conn_pid, ip, port, lag]},
		{pos,
		 [ver, srv_id, map_id, map_pid, map_bid, map_grid_pid,
		  last, hidden, x, y, dir]},
		{pos_history, [map_id, map_bid, srv_id, x, y]},
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

-behaviour(gen_server).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([start_link/0, auto/0, i/0, ets/0, ets/1, ets/2,
	 dets/0, dets/1, dets/2, guild/0, map/0, count_map/0,
	 map_roles/0, map_roles/1, unit/0, unit/1, count_proto/1,
	 count_info/1, p/1, roles/0, roles/1, roles/2,
	 lev_roles/0, top/3, dump/1, dump/2, ptop/1, ptop/3,
	 eprof_start/0, eprof_start/2, eprof_stop/0,
	 eprof_stop/1, unpack/1, unpack/2, unpack_bin/1,
	 print_pack/1, cprof/0, cprof/1, cprof/2, to_string/1,
	 help/0, log/0, flog/0, xrefr/0, eflame/2]).

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

-file("src/gm/info.erl", 59).

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

-file("src/gm/info.erl", 60).

-file("inc/pos.hrl", 1).

-record(pos_history,
	{map_id = 0  :: non_neg_integer(),
	 map_bid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer()}).

-record(pos,
	{ver = 2, srv_id = <<>>  :: bitstring(),
	 map_id = {0, <<>>}, map_pid = 0, map_bid = 0,
	 map_grid_pid = 0, last, hidden = 0, x = 0, y = 0,
	 dir = 5}).

-file("src/gm/info.erl", 61).

-file("inc/link.hrl", 1).

-record(link,
	{socket, conn_pid, ip = {127, 0, 0, 1}, port, lag}).

-file("src/gm/info.erl", 62).

-file("inc/ip_info.hrl", 1).

-record(ip_info,
	{ip  :: undefined | tuple(),
	 connected = 0  :: reset | non_neg_integer(),
	 max_conn = -1  :: integer(),
	 conn_times = 0  :: pos_integer()}).

-file("src/gm/info.erl", 63).

-file("inc/role_online.hrl", 1).

-record(role_online,
	{id = {0, 0}, pid, conn_pid, name, account, status, lev,
	 sex, realm, platform, channel, career, power, face_id,
	 face_file = <<>>, face_update_time = 0, socket,
	 max_dun_id, province_name, city_name}).

-file("src/gm/info.erl", 64).

-file("inc/xrefr.hrl", 1).

-record(xrefr_conf,
	{extra_paths = [], xref_defaults = [],
	 dirs = [sys_env:get(code_path) ++ "/ebin"]}).

-record(xrefr_warn,
	{filename, line, source, target, check}).

-file("src/gm/info.erl", 65).

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

-file("src/gm/info.erl", 66).

-file("inc/unit.hrl", 1).

-record(unit_order,
	{order  :: move | guard | attack | atom(),
	 type = 0  :: 0..2,
	 arg  :: undefined | tuple() | [tuple()],
	 data  :: undefined | term(), condition = []  :: list(),
	 over  :: undefined | defense | stop | atom()}).

-record(unit_data,
	{bid = auto  :: auto | pos_integer(),
	 type = 200  :: non_neg_integer(),
	 minor_type = 1  :: non_neg_integer(),
	 name = ""  :: bitstring(), activity = 0  :: 0..1,
	 cli_create = 0  :: 0..1,
	 guide_lev = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 nature = 0  :: non_neg_integer(),
	 disabled = <<>>  :: bitstring(),
	 condition = []  :: [tuple()],
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 2  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 mp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 mp_max = 0  :: non_neg_integer(),
	 speed = 180  :: pos_integer(), lock = 0  :: 0 | 1,
	 t_move = 3  :: pos_integer(),
	 t_atk = 3  :: pos_integer(),
	 range_trace = 200  :: pos_integer(),
	 range_atk = 100  :: pos_integer(), gain = []  :: list(),
	 slave = []  :: list(), waves = []  :: list(),
	 talk = []  :: list(), looks = []  :: list(),
	 order = []  :: list(), data = []  :: list(),
	 layer = 0  :: non_neg_integer(),
	 def_status = defense  :: defense | patrol | loaf,
	 status_list = []  :: list(),
	 drop_id = 0  :: non_neg_integer(),
	 act_drops = []  :: list(), tran_pos = [],
	 reward_panel_type = 1, reward = [], formation = {1, 1},
	 camp_type = 0}).

-record(unit,
	{id = {1, 1}  :: {pos_integer(), pos_integer()},
	 type = 200  :: non_neg_integer(),
	 minor_type = 1  :: non_neg_integer(),
	 pid = 0  :: non_neg_integer() | pid(),
	 activity = 0  :: 0..1,
	 combat_pid = 0  :: non_neg_integer() | pid(),
	 name = ""  :: bitstring(),
	 status = 0  :: non_neg_integer(),
	 guide_lev = 0  :: non_neg_integer(),
	 nature = 0  :: non_neg_integer(), quality = 0  :: 0..4,
	 layer = 0  :: non_neg_integer(),
	 disabled = <<>>  :: bitstring(),
	 base_id = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 speed = 1  :: pos_integer(), lock = 0  :: 0 | 1,
	 def_status = defense  :: defense,
	 pos  :: undefined | tuple(), looks = []  :: [tuple()],
	 evt = []  :: [atom()],
	 ts = {1, 1, 1}  ::
	     {pos_integer(), pos_integer(), pos_integer()},
	 timeout = 864000  :: non_neg_integer(),
	 t_move = 1  :: pos_integer(),
	 t_atk = 1  :: pos_integer(), extra = []  :: [tuple()]}).

-record(map_unit,
	{id = {1, 1}  :: {pos_integer(), pos_integer()},
	 type = 200  :: pos_integer(), activity = 0  :: 0..1,
	 status = 0  :: non_neg_integer(),
	 guide_lev = 0  :: non_neg_integer(),
	 name = ""  :: bitstring(),
	 layer = 0  :: non_neg_integer(),
	 base_id = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 career = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 hp = 0  :: non_neg_integer(),
	 hp_max = 0  :: non_neg_integer(),
	 speed = 1  :: pos_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 gx = 0  :: non_neg_integer(),
	 gy = 0  :: non_neg_integer(),
	 looks = []  :: [tuple()]}).

-record(unit_make_args,
	{pos = {0, 0, 0}, evts = [], disabled = 0  :: 0 | 1}).

-file("src/gm/info.erl", 67).

-file("inc/map.hrl", 1).

-record(map,
	{id = 1  :: pos_integer(), srv_id = ""  :: bitstring(),
	 base_id = 1  :: pos_integer(),
	 res_id = 0  :: non_neg_integer(),
	 pid  :: undefined | pid(),
	 ctrl_pid  :: undefined | pid(),
	 grid_info = []  :: [{pid(), pos_integer()}],
	 name = ""  :: bitstring(), condition = []  :: list(),
	 num = 0  :: non_neg_integer(),
	 max_pre_layer = 20  :: pos_integer(),
	 width = 1  :: pos_integer(),
	 height = 1  :: pos_integer(),
	 dynamic_block = []  :: list(),
	 layer_flag = 0  :: non_neg_integer()}).

-record(map_grid,
	{map_pid  :: undefined | pid(),
	 map_id = 1  :: pos_integer(),
	 base_id = 1  :: pos_integer(),
	 width = 1  :: pos_integer(),
	 height = 1  :: pos_integer()}).

-record(map_data,
	{bid = 1  :: pos_integer(),
	 type = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 def_xy = {0, 0}  :: {pos_integer(), pos_integer()},
	 min_lev = 0  :: non_neg_integer(),
	 max_lev = 9999  :: non_neg_integer(),
	 condition = []  :: [tuple()], relive = []  :: [tuple()],
	 width = 1  :: pos_integer(),
	 height = 1  :: pos_integer(),
	 grid_x = 0  :: pos_integer(),
	 grid_y = 0  :: pos_integer(),
	 max_pre_layer = 60  :: pos_integer(),
	 start_type = 0  :: 0..1, is_single = 0  :: 0..1,
	 unit_list = []  :: [tuple()], tile_res_list = []}).

-file("src/gm/info.erl", 68).

-record(state, {}).

help() ->
    util:cn("============================================="
	    "==================~n"),
    util:cn("info:ptop(reds).                   按CPU使用排序~n"),
    util:cn("info:ptop(mem).                    按内存使用排序~n"),
    util:cn("info:ptop(queue).                  按消息阻塞使用排序~n"),
    util:cn("info:i().                          当前节点情况 "
	    "包括在线人数~n"),
    util:cn("info:set_lev(role_id(), Lev).      设置角色等级~n"),
    util:cn("info:p(pid() | atom() | list()).   查看进程信息~n"),
    util:cn("info:ets()->ets(size).             查看ets信息~n"),
    util:cn("info:ets(size | mem | pmem | reds | "
	    "queue). 查看ets信息~n"),
    util:cn("info:dets()->dets(size).           查看dets信息~n"),
    util:cn("info:dets(size | fsize | pmem | reds "
	    "| queue). 查看dets信息~n"),
    util:cn("info:count_proto(list() | pid()).  统计连接进程协议号发"
	    "包信息~n"),
    util:cn("info:count_info(list() | pid()).   统计进程信息~n"),
    util:cn("info:roles() -> roles(recv_cnt, 30). "
	    "    角色信息~n"),
    util:cn("info:roles(Num) -> roles(recv_cnt,Num). "
	    " 角色信息~n"),
    util:cn("info:roles(Type, Num).              "
	    "     角色信息 Type:mem | queue | reds | "
	    "lev | send_cnt | recv_cnt~n"),
    util:cn("info:dump(info | procs | ip).       "
	    "     导出指定信息~n"),
    util:cn("info:dump(top, reds | queue | mem). "
	    "     导出指定信息~n"),
    util:cn("info:dump(proc, atom() | pid() | list()).导出指定"
	    "信息~n"),
    util:cn("info:eprof_start().                 "
	    "     开始eprof分析当前进程数据~n"),
    util:cn("info:eprof_start(pid, Pids).        "
	    "     开始eprof分析指定进程数据~n"),
    util:cn("info:eprof_start(role, role_id()).  "
	    "     开始eprof分析角色进程数据~n"),
    util:cn("info:eprof_stop() -> eprof_stop(\"eprof_analy"
	    "ze\"). 结束eprof分析角色进程数据~n"),
    util:cn("info:eprof_stop(FileName).          "
	    "     结束eprof分析角色进程数据~n"),
    util:cn("info:cprof() -> cprof(mod).         "
	    "     开始cprof分析~n"),
    util:cn("info:cprof(Mod) -> cprof(Mod, 10000). "
	    "   开始cprof分析~n"),
    util:cn("info:cprof(mod | f, Time)           "
	    "     开始cprof分析~n"),
    util:cn("info:unpack(Bin)                    "
	    "     解析数据包~n"),
    util:cn("info:print_pack(Bin)                "
	    "     打印数据包~n"),
    util:cn("info:to_string(any())               "
	    "     转换成可识别字符串~n"),
    util:cn("info:lev_roles()                    "
	    "     统计各等级角色信息~n"),
    util:cn("info:roles_call()                   "
	    "     统计角色调用信息~n"),
    util:cn("info:log()                          "
	    "     查看日志系统状态"),
    util:cn("============================================="
	    "==================~n"),
    ok.

start_link() ->
    gen_server:start_link({local, info}, info, [], []).

auto() -> info ! auto.

-spec i() -> ok.

i() ->
    SchedId = erlang:system_info(scheduler_id),
    SchedNum = erlang:system_info(schedulers),
    ProcCount = erlang:system_info(process_count),
    ProcLimit = erlang:system_info(process_limit),
    ProcMemUsed = trunc(erlang:memory(processes_used) / 1024
			  / 1024),
    ProcMemAlloc = trunc(erlang:memory(processes) / 1024 /
			   1024),
    EtsMem = trunc(erlang:memory(ets) / 1024 / 1024),
    BinMem = trunc(erlang:memory(binary) / 1024 / 1024),
    SysMem = trunc(erlang:memory(system) / 1024 / 1024),
    MemTot = trunc(erlang:memory(total) / 1024 / 1024),
    AtomMemAlloc = trunc(erlang:memory(atom) / 1024),
    AtomMemUsed = trunc(erlang:memory(atom_used) / 1024),
    CodeMem = trunc(erlang:memory(code) / 1024 / 1024),
    RoleNum = ets:info(role_id_index, size),
    RobotNum = ets:info(role_robot, size),
    NodesNum = ets:info(srv_id, size),
    GuildNum = ets:info(guild_list, size),
    MailNum = dets:info(mailbox, size),
    FriendRoleNum = ets:info(role_friend, size),
    CFriendRoleNum = ets:info(role_friend_cross, size),
    FriendNum = ets:info(friends, size),
    ArenaNum = ets:info(arena_role, size),
    CombatReplayNum = ets:info(combat_replay_reference,
			       size),
    CombatNum = sys_env:get(combat_num),
    util:cn("   当前节点:                            "
	    " ~40w~n   Scheduler id:             "
	    "            ~40w~n   Num scheduler: "
	    "                       ~40w~n   Erlang进程已使用的内"
	    "存(mb):           ~40w~n   已分配给Erlang进程的内存(mb)"
	    ":         ~40w~n   已分配给虚拟机的内存总量(mb): "
	    "        ~40w~n   已分配给ETS的内存(mb):    "
	    "            ~40w~n   已分配给binary的内存(mb): "
	    "            ~40w~n   已分配给system的内存(mb): "
	    "            ~40w~n   Atom(kb):      "
	    "                       ~40w~n   Atom(Used)(kb"
	    "):                       ~40w~n   Code(mb): "
	    "                            ~40w~n  "
	    " 可创建进程数量上限:                   ~40w~n "
	    "  当前节点中的进程总数:                 ~40w~n "
	    "  集群中的节点总数:                     ~40w~n "
	    "  当前节点在线角色数:                   ~40w~n "
	    "  当前节点角色机器人数:                 ~40w~n "
	    "  当前节点联盟数:                       ~40w~n "
	    "  当前节点未投递邮件数:                 ~40w~n "
	    "  当前节点好友信息数:                   ~40w~n "
	    "  当前节点跨服好友信息数:               ~40w~n "
	    "  当前节点好友关系数:                   ~40w~n "
	    "  当前节点竞技人数:                     ~40w~n "
	    "  当前节点录像引用:                     ~40w~n "
	    "  当前节点战斗数量:                     ~40w~n",
	    [node(), SchedId, SchedNum, ProcMemUsed, ProcMemAlloc,
	     MemTot, EtsMem, BinMem, SysMem, AtomMemAlloc,
	     AtomMemUsed, CodeMem, ProcLimit, ProcCount, NodesNum,
	     RoleNum, RobotNum, GuildNum, MailNum, FriendRoleNum,
	     CFriendRoleNum, FriendNum, ArenaNum, CombatReplayNum,
	     CombatNum]).

to_string(Info) when is_atom(Info) ->
    io_lib:format("~w", [Info]);
to_string(Info) when is_integer(Info) ->
    io_lib:format("~w", [Info]);
to_string(Info) when is_float(Info) ->
    io_lib:format("~w", [Info]);
to_string(Info) when is_pid(Info) ->
    io_lib:format("~w", [Info]);
to_string(Info) when is_binary(Info) ->
    io_lib:format("\"~ts\"",
		  [unicode:characters_to_list(Info)]);
to_string(Info) when is_tuple(Info) ->
    L = tuple_to_list(Info),
    S = string:join([to_string(I) || I <- L], ","),
    io_lib:format("{~ts}", [S]);
to_string(Info) when is_list(Info) ->
    case catch io_lib:format("\"~ts\"", [Info]) of
      {'EXIT', _} ->
	  S = string:join([to_string(I) || I <- Info], ","),
	  io_lib:format("[~ts]", [S]);
      S -> S
    end;
to_string(Info) -> io_lib:format("~w", [Info]).

print_pack(Bin) ->
    L = unpack(Bin),
    L1 = [{Len, Code, Data}
	  || {Len, Code, Data, _Bin} <- L],
    util:cn(to_string(L1)).

p(undefined) -> undefined;
p(Pid) when is_atom(Pid) -> p(whereis(Pid));
p(Pid) when is_list(Pid) -> p(list_to_pid(Pid));
p(Pid) when is_pid(Pid) -> erlang:process_info(Pid).

ets() -> ets(size).

ets(SortKeys) -> ets(SortKeys, 1000).

ets(size, Len) -> ets([2, 4], Len);
ets(mem, Len) -> ets([4, 2], Len);
ets(pmem, Len) -> ets([4, 6], Len);
ets(reds, Len) -> ets([4, 7], Len);
ets(queue, Len) -> ets([4, 8], Len);
ets(SortKeys = [_ | _], Len) ->
    L = ets:all(),
    F1 = fun (Tab) ->
		 Pid = ets:info(Tab, owner),
		 Mem = case process_info(Pid, memory) of
			 {_, V1} -> round(V1 / 1024);
			 _ -> 0
		       end,
		 Reds = case process_info(Pid, reductions) of
			  {_, V2} -> round(V2 / 1000);
			  _ -> 0
			end,
		 MsgLen = case process_info(Pid, message_queue_len) of
			    {_, V4} -> V4;
			    _ -> 0
			  end,
		 {Tab, ets:info(Tab, memory), Pid, ets:info(Tab, size),
		  ets:info(Tab, type), Mem, Reds, MsgLen}
	 end,
    L1 = [F1(Tab) || Tab <- L],
    L2 = util:keys_sort(SortKeys, L1),
    L3 = lists:sublist(L2, Len),
    io:format("~ts",
	      [io_lib:format("已启动的ETS总数: ~w~n", [length(L)])]),
    io:format("~ts",
	      [io_lib:format("ETS总内存(mem): ~w~n",
			     [lists:sum([element(2, I) || I <- L1])])]),
    io:format("~ts",
	      [io_lib:format("ETS进程总内存(pmem): ~w~n",
			     [lists:sum([element(6, I) * 1024 || I <- L1])])]),
    io:format("~ts",
	      [io_lib:format("---------------------------------------------"
			     "---------------------------------------------"
			     "---------------~n",
			     [])]),
    io:format("~ts",
	      [io_lib:format("~30ts ~12ts ~20ts ~12ts ~15ts ~12ts "
			     "~12ts ~12ts~n",
			     ["name", "memory", "owner", "size", "type",
			      "Pmem(kb)", "Preds(k)", "Pmsg"])]),
    F2 = fun (H) ->
		 io:format("~ts",
			   [io_lib:format("~30w ~12w ~20w ~12w ~15w ~12w ~12w ~12w~n",
					  tuple_to_list(H))])
	 end,
    lists:map(F2, L3),
    ok.

dets() -> dets(size).

dets(SortKeys) -> dets(SortKeys, 1000).

dets(size, Len) -> dets([5, 3], Len);
dets(fsize, Len) -> dets([3, 5], Len);
dets(pmem, Len) -> dets([3, 6], Len);
dets(reds, Len) -> dets([3, 7], Len);
dets(queue, Len) -> dets([3, 8], Len);
dets(SortKeys = [_ | _], Len) ->
    L = dets:all(),
    F1 = fun (Tab) ->
		 Pid = dets_server:get_pid(Tab),
		 Mem = case process_info(Pid, memory) of
			 {_, V1} -> round(V1 / 1024);
			 _ -> 0
		       end,
		 Reds = case process_info(Pid, reductions) of
			  {_, V2} -> round(V2 / 1000);
			  _ -> 0
			end,
		 MsgLen = case process_info(Pid, message_queue_len) of
			    {_, V4} -> V4;
			    _ -> 0
			  end,
		 {Tab, Pid, dets:info(Tab, size), dets:info(Tab, type),
		  dets:info(Tab, file_size), Mem, Reds, MsgLen,
		  dets:info(Tab, filename)}
	 end,
    L1 = [F1(Tab) || Tab <- L],
    L2 = util:keys_sort(SortKeys, L1),
    L3 = lists:sublist(L2, Len),
    io:format("~ts",
	      [io_lib:format("已启动的DETS总数: ~w~n", [length(L)])]),
    io:format("~ts",
	      [io_lib:format("DETS进程总内存(pmem): ~w~n",
			     [lists:sum([element(6, I) * 1024 || I <- L1])])]),
    io:format("~ts",
	      [io_lib:format("---------------------------------------------"
			     "---------------------------------------------"
			     "---------------~n",
			     [])]),
    io:format("~ts",
	      [io_lib:format("~30ts ~10ts ~12ts ~15ts ~12ts ~12ts "
			     "~12ts ~12ts ~40ts~n",
			     ["name", "pid", "size", "type", "file_size",
			      "Pmem(kb)", "Preds(k)", "Pmsg", "filename"])]),
    F2 = fun (H) ->
		 io:format("~ts",
			   [io_lib:format("~30w ~10w ~12w ~15w ~12w ~12w ~12w ~12w "
					  "~40ts~n",
					  tuple_to_list(H))])
	 end,
    lists:map(F2, L3),
    ok.

flog() ->
    io:format("~ts",
	      [io_lib:format("---------------------------------------------"
			     "---------------------------------------------"
			     "---------------~n",
			     [])]),
    io:format("~ts",
	      [io_lib:format("~50ts ~12ts ~12ts ~12ts ~12ts ~12ts "
			     "~12ts ~12ts~n",
			     ["n", "size", "filesize", "detspid", "pid", "mem",
			      "reds", "msglen"])]),
    [flog(I) || I <- ets:tab2list(log_pids)].

flog({Dets, Pid}) ->
    case dets:info(Dets) of
      [_, _, {size, Size}, {file_size, FileSize} | _] ->
	  DetsPid = dets_server:get_pid(Dets),
	  Pid = whereis(Dets),
	  Mem = case process_info(Pid, memory) of
		  {_, V1} -> round(V1 / 1024);
		  _ -> 0
		end,
	  Reds = case process_info(Pid, reductions) of
		   {_, V2} -> round(V2 / 1000);
		   _ -> 0
		 end,
	  MsgLen = case process_info(Pid, message_queue_len) of
		     {_, V4} -> V4;
		     _ -> 0
		   end,
	  io:format("~ts",
		    [io_lib:format("~50w ~12w ~12w ~12w ~12w ~12w ~12w ~12w~n",
				   [Dets, Size, FileSize, DetsPid, Pid, Mem,
				    Reds, MsgLen])]);
      _ -> ok
    end.

guild() -> guild(lev).

guild(SortKeys) -> guild(SortKeys, 1000).

guild(lev, Len) -> guild([6, 5], Len);
guild(mem, Len) -> guild([9, 8], Len);
guild(reds, Len) -> guild([8, 9], Len);
guild(queue, Len) -> guild([9, 10], Len);
guild(SortKeys = [_ | _], Len) ->
    case ets:info(guild_list, size) of
      undefined -> skip;
      Size ->
	  io:format("~ts",
		    [io_lib:format("已启动的公会总数: ~w~n", [Size])]),
	  io:format("~ts",
		    [io_lib:format("---------------------------------------------"
				   "---------------------------------------------"
				   "---------------~n",
				   [])]),
	  io:format("~ts",
		    [io_lib:format("~10s ~15ts ~20ts ~20ts ~12ts ~12ts ~12ts "
				   "~12ts ~12ts ~12ts~n",
				   ["gid", "srvid", "name", "head_name", "lev",
				    "num", "pid", "Pmem(kb)", "Preds(k)",
				    "Pmsg"])]),
	  F1 = fun (#guild{id = {Gid, GSrvId}, pid = Pid,
			   name = GName, leader_name = HeadName, lev = GLev,
			   members_num = Num},
		    L) ->
		       Mem = case process_info(Pid, memory) of
			       {_, V1} -> round(V1 / 1024);
			       _ -> 0
			     end,
		       Reds = case process_info(Pid, reductions) of
				{_, V2} -> round(V2 / 1000);
				_ -> 0
			      end,
		       MsgLen = case process_info(Pid, message_queue_len) of
				  {_, V4} -> V4;
				  _ -> 0
				end,
		       [{Gid, GSrvId, GName, HeadName, GLev, Num, Pid, Mem,
			 Reds, MsgLen}
			| L]
	       end,
	  F2 = fun (H) ->
		       io:format("~ts",
				 [io_lib:format("~10w ~15ts ~20ts ~20ts ~12w ~12w ~12w "
						"~12w ~12w ~12w~n",
						tuple_to_list(H))])
	       end,
	  L1 = ets:foldl(F1, [], guild_list),
	  L2 = util:keys_sort(SortKeys, L1),
	  L3 = lists:sublist(L2, Len),
	  lists:map(F2, L3),
	  ok
    end.

unit() ->
    case ets:info(unit_info, size) of
      undefined ->
	  io:format("~ts", [io_lib:format("单位管理器未启动~n", [])]);
      N ->
	  io:format("~ts", [io_lib:format("单位总数: ~w~n", [N])]),
	  io:format("~ts",
		    [io_lib:format("---------------------------------------------"
				   "---------------------------------------------"
				   "---------------~n",
				   [])]),
	  F = fun (#unit{base_id = BaseId,
			 pos = #pos{map_bid = MapId}},
		   L1) ->
		      case lists:keyfind(MapId, 1, L1) of
			{MapId, Num, UnitL} ->
			    NewUnitL = case lists:keyfind(BaseId, 1, UnitL) of
					 {_, V} ->
					     lists:keyreplace(BaseId, 1, UnitL,
							      {BaseId, V + 1});
					 _ -> [{BaseId, 1} | UnitL]
				       end,
			    lists:keyreplace(MapId, 1, L1,
					     {MapId, Num + 1, NewUnitL});
			_ -> [{MapId, 1, [{BaseId, 1}]} | L1]
		      end
	      end,
	  L = ets:foldl(F, [], unit_info),
	  io:format("~ts",
		    [io_lib:format("地图总数: ~w~n", [length(L)])]),
	  io:format("~ts",
		    [io_lib:format("~20ts ~20ts ~120ts~n",
				   ["Map BaseId", "Unit Num", "UnitL"])]),
	  F1 = fun ({MapId, Num, UnitL}) ->
		       io:format("~ts",
				 [io_lib:format("~20w ~20w ~120w~n",
						[MapId, Num, UnitL])])
	       end,
	  lists:map(F1, L)
    end,
    ok.

unit(MapBaseId) ->
    case ets:info(unit_info, size) of
      undefined ->
	  io:format("~ts", [io_lib:format("单位管理器未启动~n", [])]);
      N ->
	  io:format("~ts", [io_lib:format("单位总数: ~w~n", [N])]),
	  io:format("~ts",
		    [io_lib:format("---------------------------------------------"
				   "---------------------------------------------"
				   "---------------~n",
				   [])]),
	  F = fun (#unit{base_id = BaseId,
			 pos = #pos{map_id = MapId, map_bid = MapBaseId1}},
		   L1)
		      when MapBaseId =:= MapBaseId1 ->
		      case lists:keyfind(MapId, 1, L1) of
			{MapId, Num, UnitL} ->
			    NewUnitL = case lists:keyfind(BaseId, 1, UnitL) of
					 {_, V} ->
					     lists:keyreplace(BaseId, 1, UnitL,
							      {BaseId, V + 1});
					 _ -> [{BaseId, 1} | UnitL]
				       end,
			    lists:keyreplace(MapId, 1, L1,
					     {MapId, Num + 1, NewUnitL});
			_ -> [{MapId, 1, [{BaseId, 1}]} | L1]
		      end;
		  (_, L1) -> L1
	      end,
	  L = ets:foldl(F, [], unit_info),
	  io:format("~ts",
		    [io_lib:format("地图总数: ~w~n", [length(L)])]),
	  io:format("~ts",
		    [io_lib:format("~20ts ~20ts ~120ts~n",
				   ["Map Id", "Unit Num", "UnitL"])]),
	  F1 = fun ({MapId, Num, UnitL}) ->
		       io:format("~ts",
				 [io_lib:format("~20w ~20w ~120w~n",
						[MapId, Num, UnitL])])
	       end,
	  lists:map(F1, L)
    end,
    ok.

map() ->
    case ets:info(map_info, size) of
      undefined ->
	  io:format("~ts", [io_lib:format("地图管理器未启动~n", [])]);
      N ->
	  io:format("~ts",
		    [io_lib:format("已启动的地图总数: ~w~n", [N])]),
	  io:format("~ts",
		    [io_lib:format("---------------------------------------------"
				   "---------------------------------------------"
				   "---------------~n",
				   [])]),
	  io:format("~ts",
		    [io_lib:format("~10s ~10s ~15s ~10s ~100s ~20s~n",
				   ["Map Id", "Base Id", "Pid", "Role Number",
				    "Grid Info", "Name"])]),
	  F = fun (#map{id = Id, base_id = BaseId, name = Name,
			pid = Pid, num = Num, grid_info = GridInfo},
		   _) ->
		      io:format("~ts",
				[io_lib:format("~10w ~10w ~15w ~10w ~100w ~20ts~n",
					       [Id, BaseId, Pid, Num, GridInfo,
						Name])])
	      end,
	  ets:foldl(F, 0, map_info)
    end,
    ok.

count_map() ->
    case ets:info(map_info, size) of
      undefined ->
	  io:format("~ts", [io_lib:format("地图管理器未启动~n", [])]);
      N ->
	  io:format("~ts",
		    [io_lib:format("已启动的地图总数: ~w~n", [N])]),
	  io:format("~ts",
		    [io_lib:format("---------------------------------------------"
				   "---------------------------------------------"
				   "---------------~n",
				   [])]),
	  F = fun (#map{base_id = BaseId, name = Name, num = Num},
		   L1) ->
		      case lists:keyfind(BaseId, 1, L1) of
			{BaseId, Name, RoleNum, V} ->
			    lists:keyreplace(BaseId, 1, L1,
					     {BaseId, Name, Num + RoleNum,
					      V + 1});
			_ -> [{BaseId, Name, Num, 1} | L1]
		      end
	      end,
	  L = ets:foldl(F, [], map_info),
	  io:format("~ts",
		    [io_lib:format("~20s ~20s ~20s ~20s~n",
				   ["Base Id", "Num", "Role Number", "Name"])]),
	  F1 = fun ({BaseId, Name, RoleNum, MapNum}) ->
		       io:format("~ts",
				 [io_lib:format("~20w ~20w ~20w ~50ts~n",
						[BaseId, MapNum, RoleNum,
						 Name])])
	       end,
	  L1 = lists:keysort(1, L),
	  lists:map(F1, L1)
    end,
    ok.

map_roles() -> map_roles(1).

map_roles(Min) ->
    case ets:info(map_info, size) of
      undefined ->
	  io:format("~ts", [io_lib:format("地图管理器未启动~n", [])]);
      N ->
	  io:format("~ts",
		    [io_lib:format("已启动的地图总数: ~w~n", [N])]),
	  io:format("~ts",
		    [io_lib:format("---------------------------------------------"
				   "---------------------------------------------"
				   "---------------~n",
				   [])]),
	  io:format("~ts",
		    [io_lib:format("~10s ~10s ~15s ~10s ~100s ~20ts~n",
				   ["Map Id", "Base Id", "Pid", "Role Number",
				    "Grid Info", "Name"])]),
	  F = fun (#map{id = Id, base_id = BaseId, name = Name,
			pid = Pid, grid_info = GridInfo, num = Num},
		   _)
		      when Num >= Min andalso Min > 0 orelse
			     Min =:= 0 andalso Num =:= 0 ->
		      io:format("~ts",
				[io_lib:format("~10w ~10w ~15w ~10w ~100w ~20ts~n",
					       [Id, BaseId, Pid, Num, GridInfo,
						Name])]);
		  (_, _) -> skip
	      end,
	  ets:foldl(F, 0, map_info)
    end,
    ok.

log() ->
    L = sup_db_buffer:db_buffer_list(zone),
    io:format("~ts",
	      [io_lib:format("已启动的日志系统: ~w~n", [length(L)])]),
    io:format("~ts",
	      [io_lib:format("~30ts ~10ts ~12ts ~12ts ~12ts ~12ts "
			     "~12ts ~12ts ~12ts~n",
			     ["name", "pid", "mode", "interval", "number",
			      "len", "msg_len", "Pmem(kb)", "Preds(k)"])]),
    F1 = fun (Name) ->
		 Pid = whereis(Name),
		 State = sys:get_state(Pid),
		 Mode = element(3, State),
		 Int = element(4, State),
		 Len = element(8, State),
		 Number = element(5, State),
		 Mem = case process_info(Pid, memory) of
			 {_, V1} -> round(V1 / 1024);
			 _ -> 0
		       end,
		 Reds = case process_info(Pid, reductions) of
			  {_, V2} -> round(V2 / 1000);
			  _ -> 0
			end,
		 MsgLen = case process_info(Pid, message_queue_len) of
			    {_, V4} -> V4;
			    _ -> 0
			  end,
		 {Name, Pid, Mode, Int, Number, Len, MsgLen, Mem, Reds}
	 end,
    F2 = fun (H) ->
		 io:format("~ts",
			   [io_lib:format("~30w ~10w ~12w ~12w ~12w ~12w ~12w ~12w "
					  "~12w~n",
					  tuple_to_list(H))])
	 end,
    L1 = [F1(Name) || {Name, _} <- L],
    L2 = util:keys_sort([6, 7, 8], L1),
    lists:map(F2, L2),
    ok.

count_proto(Pid) when is_list(Pid) ->
    count_proto(list_to_pid(Pid));
count_proto(Pid) when is_pid(Pid) ->
    {_, L} = erlang:process_info(Pid, messages),
    List = lists:foldl(fun ({send_data,
			     <<_:32, Proto:16, _/binary>>},
			    L1) ->
			       case lists:keyfind(Proto, 1, L1) of
				 {Proto, N} ->
				     lists:keyreplace(Proto, 1, L1,
						      {Proto, N + 1});
				 _ -> [{Proto, 1} | L1]
			       end;
			   (_, L1) -> L1
		       end,
		       [], L),
    io:format("~ts",
	      [io_lib:format("~20ts ~20ts~n",
			     ["Proto Code", "Num"])]),
    Fun = fun ({Code, Num}) ->
		  io:format("~ts",
			    [io_lib:format("~20w ~20w~n", [Code, Num])])
	  end,
    lists:map(Fun, List),
    ok.

count_info(Pid) when is_list(Pid) ->
    count_info(list_to_pid(Pid));
count_info(Pid) when is_pid(Pid) ->
    {_, L} = erlang:process_info(Pid, messages),
    List = lists:foldl(fun (Info, L1) when is_tuple(Info) ->
			       Head = element(1, Info),
			       case lists:keyfind(Head, 1, L1) of
				 {Head, N} ->
				     lists:keyreplace(Head, 1, L1,
						      {Head, N + 1});
				 _ -> [{Head, 1} | L1]
			       end;
			   (_, L1) -> L1
		       end,
		       [], L),
    io:format("~ts",
	      [io_lib:format("~150ts ~20ts~n",
			     ["Info head", "Num"])]),
    Fun = fun ({Code, Num}) ->
		  io:format("~ts",
			    [io_lib:format("~150w ~20w~n", [Code, Num])])
	  end,
    lists:map(Fun, List),
    ok.

lev_roles() ->
    case ets:info(role_online, size) of
      undefined ->
	  io:format("~ts",
		    [io_lib:format("role_query模块未启动~n", [])]);
      N ->
	  Fun = fun (#role_online{lev = Lev, pid = Pid}, L1) ->
			Mem = case process_info(Pid, memory) of
				{_, V1} -> V1 / 1024;
				_ -> 0
			      end,
			Reds = case process_info(Pid, reductions) of
				 {_, V2} -> round(V2 / 1000);
				 _ -> 0
			       end,
			case lists:keyfind(Lev, 1, L1) of
			  false -> [{Lev, 1, Mem, Reds} | L1];
			  {Lev, N1, TotalMem, TotalReds} ->
			      lists:keyreplace(Lev, 1, L1,
					       {Lev, N1 + 1, Mem + TotalMem,
						Reds + TotalReds})
			end
		end,
	  List = ets:foldl(Fun, [], role_online),
	  io:format("~ts", [io_lib:format("总人数：~w~n", [N])]),
	  io:format("~ts",
		    [io_lib:format("~10s ~20s ~20s ~20s~n",
				   ["Lev", "Num", "AvgMem", "AvgReds"])]),
	  F = fun ({Lev, Num, TotalMem, TotalReds}) ->
		      io:format("~ts",
				[io_lib:format("~10w ~20w ~20w ~20w~n",
					       [Lev, Num,
						round(TotalMem) div Num,
						TotalReds div Num])])
	      end,
	  List1 = lists:keysort(1, List),
	  lists:map(F, List1),
	  ok
    end.

roles() -> roles(recv_cnt, 30).

roles(Num) when is_integer(Num) orelse Num =:= all ->
    roles(recv_cnt, Num);
roles(SortType) -> roles(SortType, 30).

roles(Sort, Num) ->
    case ets:info(role_online, size) of
      undefined ->
	  io:format("~ts",
		    [io_lib:format("role_query模块未启动~n", [])]);
      N ->
	  io:format("~ts",
		    [io_lib:format("---------------------------------------------"
				   "---------------------------------------------"
				   "---------------------------------------------"
				   "---------------------------------------------"
				   "--~n",
				   [])]),
	  io:format("~ts",
		    [io_lib:format("~14s ~14s ~10s ~10s ~7s ~7s ~7s ~6s "
				   "~7s ~7s ~7s ~7s ~18s ~20s ~12s ~10s~n",
				   ["RolePid", "ConnPid", "Rid", "SrvId", "Lev",
				    "Mem(kb)", "Reds(k)", "MsgLen", "RecvAvg",
				    "RecvCnt", "SendAvg", "SendCnt", "Account",
				    "Name", "Channel", "MaxDunId"])]),
	  F = fun (#role_online{pid = Pid, id = {Rid, SrvId},
				account = Acc, name = Name, lev = Lev,
				conn_pid = ConnPid, socket = Socket,
				channel = Channel, max_dun_id = MaxDunId},
		   {L, TotalMem}) ->
		      {RecvAvg, RecvCnt, SendAvg, SendCnt} = case catch
								    inet:getstat(Socket,
										 [recv_avg,
										  recv_cnt,
										  send_avg,
										  send_cnt])
								 of
							       {ok,
								[{_, Ra},
								 {_, Rc},
								 {_, Sa},
								 {_, Sc}]} ->
								   {Ra, Rc, Sa,
								    Sc};
							       _ -> {0, 0, 0, 0}
							     end,
		      Mem = case process_info(Pid, memory) of
			      {_, V1} -> V1 / 1024;
			      _ -> 0
			    end,
		      Reds = case process_info(Pid, reductions) of
			       {_, V2} -> round(V2 / 1000);
			       _ -> 0
			     end,
		      MsgLen = case process_info(Pid, message_queue_len) of
				 {_, V4} -> V4;
				 _ -> 0
			       end,
		      {[[Pid, ConnPid, Rid, SrvId, Lev, round(Mem), Reds,
			 MsgLen, RecvAvg, RecvCnt, SendAvg, SendCnt, Acc, Name,
			 Channel, MaxDunId]
			| L],
		       TotalMem + Mem}
	      end,
	  {L, TotalMemory} = ets:foldl(F, {[], 0}, role_online),
	  Nl = case Sort of
		 mem -> lists:sort(fun role_sort_mem/2, L);
		 reds -> lists:sort(fun role_sort_reds/2, L);
		 lev -> lists:sort(fun role_sort_lev/2, L);
		 send_cnt -> lists:sort(fun role_sort_send_cnt/2, L);
		 recv_cnt -> lists:sort(fun role_sort_recv_cnt/2, L);
		 _ -> lists:sort(fun role_sort_queue/2, L)
	       end,
	  N1 = case is_integer(Num) of
		 true -> Num;
		 _ -> N
	       end,
	  print_role(Nl, N1),
	  io:format("~ts",
		    [io_lib:format("---------------------------------------------"
				   "---------------------------------------------"
				   "---------------------------------------------"
				   "---------------------------------------------"
				   "--~n",
				   [])]),
	  io:format("~ts",
		    [io_lib:format("时间: ~w 在线角色总数: ~w 占用内存总数: ~w(mb) 可排序字段: "
				   "mem, queue, reds, lev, send_cnt, recv_cnt~n",
				   [erlang:localtime(), N,
				    round(TotalMemory / 1024)])])
    end.

role_sort_lev([_, _, _, _, A | _], [_, _, _, _, B | _])
    when A =< B ->
    false;
role_sort_lev(_, _) -> true.

role_sort_mem([_, _, _, _, _, A | _],
	      [_, _, _, _, _, B | _])
    when A =< B ->
    false;
role_sort_mem(_, _) -> true.

role_sort_reds([_, _, _, _, _, _, A | _],
	       [_, _, _, _, _, _, B | _])
    when A =< B ->
    false;
role_sort_reds(_, _) -> true.

role_sort_queue([_, _, _, _, _, _, _, A | _],
		[_, _, _, _, _, _, _, B | _])
    when A =< B ->
    false;
role_sort_queue(_, _) -> true.

role_sort_recv_cnt([_, _, _, _, _, _, _, _, _, A | _],
		   [_, _, _, _, _, _, _, _, _, B | _])
    when A =< B ->
    false;
role_sort_recv_cnt(_, _) -> true.

role_sort_send_cnt([_, _, _, _, _, _, _, _, _, _, _, A
		    | _],
		   [_, _, _, _, _, _, _, _, _, _, _, B | _])
    when A =< B ->
    false;
role_sort_send_cnt(_, _) -> true.

print_role([], _N) -> ok;
print_role(_, 0) -> ok;
print_role([H | T], N) ->
    io:format("~ts",
	      [io_lib:format("~14w ~14w ~10w ~10s ~7w ~7w ~7w ~6w "
			     "~7w ~7w ~7w ~7w ~18ts ~20ts ~12ts ~10w~n",
			     H)]),
    print_role(T, N - 1).

-spec top(Type, Start, Len) -> ProcList when Type ::
						 mem | queue | reds,
					     Start :: pos_integer(),
					     Len :: pos_integer(),
					     ProcList :: list().

top(mem, Start, Len) -> do_top(memory, Start, Len);
top(queue, Start, Len) ->
    do_top(message_queue_len, Start, Len);
top(reds, Start, Len) -> do_top(reductions, Start, Len);
top(heap, Start, Len) ->
    do_top(total_heap_size, Start, Len).

-spec dump(info | procs | ip) -> ok | {error, term()}.

dump(info) ->
    case file:write_file("./system_info.txt",
			 erlang:system_info(info))
	of
      ok ->
	  io:format("~ts",
		    [io_lib:format("> 系统状态信息已经导出到文件:./system_info.txt~n",
				   [])]);
      Err -> Err
    end;
dump(procs) ->
    case file:write_file(sys_env:get(root) ++ "/procs.txt",
			 erlang:system_info(procs))
	of
      ok ->
	  io:format("~ts",
		    [io_lib:format("> 所有进程的详细信息已经导出到文件:./procs.txt~n",
				   [])]);
      Err -> Err
    end;
dump(ip) ->
    L = lists:sort(fun sort_conn_times/2,
		   ets:tab2list(ip_mgr)),
    Nl = [io_lib:format("~18w ~12w ~12w ~12w~n",
			[Ip, C, Mc, Ct])
	  || #ip_info{ip = Ip, connected = C, max_conn = Mc,
		      conn_times = Ct}
		 <- L],
    Thead = io_lib:format("~18ts ~12ts ~12ts ~12ts~n",
			  ["IP addr", "connected", "max_conn", "conn_times"]),
    case file:write_file("ip_info.txt", [Thead | Nl]) of
      ok ->
	  io:format("~ts",
		    [io_lib:format("> 当前IP信息已经导出到文件:./ip_info.txt~n", [])]);
      Err -> Err
    end.

dump(top, Type) ->
    File = lists:concat([sys_env:get(root), "/top_", Type,
			 ".txt"]),
    case file:open(File, [write]) of
      {ok, F} ->
	  io:format(F,
		    "~20ts ~12ts ~12ts ~12ts ~12ts ~24ts "
		    "~36ts ~36ts~n",
		    ["Pid", "memory(kb)", "reds(k)", "msg_len",
		     "t_heap_size", "registered_name", "initial_call",
		     "last_calls"]),
	  Fun = fun (I, _) ->
			io:format(F,
				  "~20w ~12w ~12w ~12w ~12w ~24w ~36w ~36w~n",
				  I),
			ok
		end,
	  lists:foldl(Fun, ignore,
		      lists:reverse(top(Type, 1, 10000))),
	  file:close(F),
	  io:format("~ts",
		    [io_lib:format("> 排序后的进程信息已经导出到文件:./top_~ts.txt~n",
				   [Type])]);
      Err -> Err
    end;
dump(proc, P) when is_atom(P) -> dump(proc, whereis(P));
dump(proc, P) when is_list(P) ->
    dump(proc, list_to_pid(P));
dump(proc, P) when is_pid(P) ->
    N =
	lists:reverse(tl(lists:reverse(tl(pid_to_list(P))))),
    F = lists:concat([sys_env:get(root), "/proc_", N,
		      ".txt"]),
    case file:write_file(F,
			 io_lib:format("~p", [erlang:process_info(P)]))
	of
      ok ->
	  io:format("~ts",
		    [io_lib:format("> 进程~w的详细信息已经导出到文件:./proc_~ts.txt~n",
				   [P, N])]);
      Err -> Err
    end;
dump(state, P) when is_pid(P) ->
    F = lists:concat([sys_env:get(root),
		      "/proc_state.txt"]),
    file:write_file(F,
		    io_lib:format("~p", [sys:get_state(P)])).

-spec eprof_start() -> ok.

eprof_start() -> eprof_start(pid, [self()]).

-spec eprof_start(T, Id) -> ok when T :: pid | role |
					 map,
				    Id :: PidList | RoleId | MapId,
				    PidList :: list(),
				    RoleId :: {pos_integer(), bitstring()},
				    MapId :: pos_integer().

eprof_start(pid, Pids) ->
    case eprof:start_profiling(Pids) of
      profiling ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidinfo754, _, {__Levelinfo754, __Tracesinfo754}}
		when __Levelinfo754 band 64 /= 0 orelse
		       __Tracesinfo754 /= [] ->
		lager:do_log(info,
			     [{module, info}, {function, eprof_start},
			      {line, 754}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "eprof启动成功", none, 4096, 64, __Levelinfo754,
			     __Tracesinfo754, lager_event, __Pidinfo754);
	    _ -> ok
	  end;
      E ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidinfo755, _, {__Levelinfo755, __Tracesinfo755}}
		when __Levelinfo755 band 64 /= 0 orelse
		       __Tracesinfo755 /= [] ->
		lager:do_log(info,
			     [{module, info}, {function, eprof_start},
			      {line, 755}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("eprof启动失败: ~w", [E]), none, 4096,
			     64, __Levelinfo755, __Tracesinfo755, lager_event,
			     __Pidinfo755);
	    _ -> ok
	  end
    end;
eprof_start(role, {Rid, SrvId}) ->
    case role_query:attr(by_id, Rid, SrvId,
			 [#role.pid, #role.link])
	of
      {ok, [Pid, #link{conn_pid = ConnPid}]} ->
	  eprof_start(pid, [Pid, ConnPid]);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidinfo760, _, {__Levelinfo760, __Tracesinfo760}}
		when __Levelinfo760 band 64 /= 0 orelse
		       __Tracesinfo760 /= [] ->
		lager:do_log(info,
			     [{module, info}, {function, eprof_start},
			      {line, 760}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("角色[Rid:~w SrvId:~ts]不在线",
					   [Rid, SrvId]),
			     none, 4096, 64, __Levelinfo760, __Tracesinfo760,
			     lager_event, __Pidinfo760);
	    _ -> ok
	  end
    end.

cprof() -> cprof(mod).

cprof(Mod) -> cprof(Mod, 10000).

cprof(mod, T) ->
    cprof:start(),
    util:sleep(T),
    Ret = cprof:analyse(),
    cprof:stop(),
    Ret;
cprof(f, T) ->
    {_, L} = cprof(mod, T),
    Fun = fun ({Mod, N, L1}, {L2, L3}) ->
		  {[{Mod, N} | L2], L3 ++ L1}
	  end,
    {L4, L5} = lists:foldl(Fun, {[], []}, L),
    {lists:reverse(lists:keysort(2, L4)),
     lists:reverse(lists:keysort(2, L5))}.

-spec eprof_stop() -> ok.

eprof_stop() -> eprof_stop("eprof_analyze").

-spec eprof_stop(string()) -> ok.

eprof_stop(FileName) ->
    File = FileName ++ ".txt",
    eprof:stop_profiling(),
    eprof:log(File),
    eprof:analyze(total),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidinfo792, _, {__Levelinfo792, __Tracesinfo792}}
	  when __Levelinfo792 band 64 /= 0 orelse
		 __Tracesinfo792 /= [] ->
	  lager:do_log(info,
		       [{module, info}, {function, eprof_stop}, {line, 792},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("eprof分析结果已经输出到了:~ts", [File]), none,
		       4096, 64, __Levelinfo792, __Tracesinfo792, lager_event,
		       __Pidinfo792);
      _ -> ok
    end.

-spec ptop(atom()) -> ok.

ptop(Type) -> ptop(Type, 1, 30).

-spec ptop(atom(), pos_integer(), pos_integer()) -> ok.

ptop(Type, Start, Len) ->
    L = lists:reverse(top(Type, Start, Len)),
    case L of
      [[Pid | _] | _] when is_pid(Pid) -> put(last_pid, Pid);
      _ -> skip
    end,
    util:cn("~20ts ~12ts ~12ts ~12ts ~12ts ~48ts "
	    "~36ts ~36ts~n",
	    ["Pid", "memory(kb)", "reds(k)", "msg_len",
	     "t_heap_size", "registered_name", "initial_call",
	     "last_calls"]),
    print_top(L).

-spec unpack(binary() | list()) -> tuple().

unpack(L) when is_list(L) ->
    do_unpack(lists:flatten(L), []);
unpack(L) when is_binary(L) -> do_unpack([L], []).

do_unpack([], Data) -> lists:reverse(Data);
do_unpack([Bin | T], Data) ->
    D = unpack_bin(Bin), do_unpack(T, [D | Data]).

unpack_bin(Bin) ->
    <<Len:32, Code:16, Bin1/binary>> = Bin,
    case mapping:parser_mod(Code) of
      {ok, Parser} ->
	  case catch Parser:unpack(Code, cli, Bin1) of
	    {ok, Data} -> {Len, Code, Data, Bin1};
	    _ ->
		case catch Parser:unpack(Code, srv, Bin1) of
		  {ok, Data} -> {Len, Code, Data, Bin1};
		  _ -> false
		end
	  end;
      _ -> false
    end.

unpack(Code, Bin) ->
    case mapping:parser_mod(Code) of
      {ok, Parser} ->
	  case catch Parser:unpack(Code, srv, Bin) of
	    {ok, Data} -> {Code, Data};
	    _ ->
		case catch Parser:unpack(Code, cli, Bin) of
		  {ok, Data} -> {Code, Data};
		  _ -> false
		end
	  end;
      _ -> false
    end.

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidinfo860, _, {__Levelinfo860, __Tracesinfo860}}
	  when __Levelinfo860 band 64 /= 0 orelse
		 __Tracesinfo860 /= [] ->
	  lager:do_log(info,
		       [{module, info}, {function, init}, {line, 860},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [info]), none, 4096, 64,
		       __Levelinfo860, __Tracesinfo860, lager_event,
		       __Pidinfo860);
      _ -> ok
    end,
    State = #state{},
    self() ! snapshoot,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidinfo863, _, {__Levelinfo863, __Tracesinfo863}}
	  when __Levelinfo863 band 64 /= 0 orelse
		 __Tracesinfo863 /= [] ->
	  lager:do_log(info,
		       [{module, info}, {function, init}, {line, 863},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [info]), none, 4096, 64,
		       __Levelinfo863, __Tracesinfo863, lager_event,
		       __Pidinfo863);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(snapshoot, State) ->
    case get(snapshoot) of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidinfo875, _, {__Levelinfo875, __Tracesinfo875}}
		when __Levelinfo875 band 64 /= 0 orelse
		       __Tracesinfo875 /= [] ->
		lager:do_log(info,
			     [{module, info}, {function, handle_info},
			      {line, 875}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "正在输出系统状态快照信息:", none, 4096, 64, __Levelinfo875,
			     __Tracesinfo875, lager_event, __Pidinfo875);
	    _ -> ok
	  end,
	  ptop(mem),
	  ptop(queue),
	  i();
      _ -> skip
    end,
    erlang:send_after(10000, self(), snapshoot),
    {noreply, State};
handle_info(auto, State) ->
    put(snapshoot, get(snapshoot) =/= true),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

print_top([]) -> ok;
print_top([H | T]) ->
    io:format("~20w ~12w ~12w ~12w ~12w ~48w ~36w ~36w~n",
	      H),
    print_top(T).

do_top(Type, Start, Len) when Start > 0, Len > 0 ->
    L = do_top1(Type, erlang:processes(), []),
    NL = lists:sublist(L, Len),
    top_detail(NL, []).

do_top1(_Type, [], L) -> lists:sort(fun top_sort/2, L);
do_top1(Type, [P | Pids], L) ->
    NL = case process_info(P, Type) of
	   {_, V} -> [{P, V} | L];
	   _ -> L
	 end,
    do_top1(Type, Pids, NL).

top_detail([], L) -> L;
top_detail([{P, _} | T], L) ->
    Mem = case process_info(P, memory) of
	    {_, V1} -> trunc(V1 / 1024);
	    _ -> undefined
	  end,
    Reds = case process_info(P, reductions) of
	     {_, V2} -> trunc(V2 / 1000);
	     _ -> undefined
	   end,
    InitCall = case process_info(P, initial_call) of
		 {_, V3} -> V3;
		 _ -> undefined
	       end,
    MsgLen = case process_info(P, message_queue_len) of
	       {_, V4} -> V4;
	       _ -> undefined
	     end,
    RegName = case process_info(P, registered_name) of
		{_, V5} -> V5;
		_ -> undefined
	      end,
    LastCalls = case process_info(P, last_calls) of
		  {_, V6} -> V6;
		  _ -> undefined
		end,
    TotalHeapSize = case process_info(P, total_heap_size) of
		      {_, V7} -> V7;
		      _ -> undefined
		    end,
    top_detail(T,
	       [[P, Mem, Reds, MsgLen, TotalHeapSize, RegName,
		 InitCall, LastCalls]
		| L]).

top_sort({_, A}, {_, B}) when A =< B -> false;
top_sort(_, _) -> true.

sort_conn_times(#ip_info{conn_times = C1},
		#ip_info{conn_times = C2})
    when C1 =< C2 ->
    false;
sort_conn_times(_, _) -> true.

xrefr() ->
    Result = xref_runner:check(),
    util:cn("============================================="
	    "============================================="
	    "======================\n====================="
	    "==========================分析结果==============="
	    "===========================================\n"
	    "|                 检查类型 |            "
	    "                文件路径 |  行数 |        "
	    "                         Mfa|~n"),
    lists:foreach(fun (#xrefr_warn{check = CheckMod,
				   filename = FileName, line = Line,
				   source = Source}) ->
			  io:format("|~25w | ~35ts | ~5w | ~50ts|~n",
				    [CheckMod, FileName, Line,
				     util:to_list(Source)])
		  end,
		  Result),
    util:cn("总数量:~w", [length(Result)]),
    ok.

-spec eflame([pid()],
	     MilliSecond :: integer()) -> any().

eflame(PidList, TimeOut) ->
    File = "./log_eflame.log",
    eflame2:write_trace(global_and_local_calls, File,
			PidList, TimeOut),
    eflame2:format_trace(File).


