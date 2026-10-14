-file("src/mod/unit/unit_mgr.erl", 1).

-module(unit_mgr).

-lager_records([{state, [next_id]},
		{attr_calc,
		 [attr, attr_no_ratio, ratio, attr_no_fc, ratio_no_fc]},
		{attr,
		 [fc, toughness, atk, def, def_s, def_p, hp_max, hp,
		  speed, hit_rate, dodge_rate, crit_rate, crit_ratio,
		  hit_magic, dodge_magic, dam, res, cure, be_cure, dam_p,
		  res_p, dam_s, res_s, tenacity]},
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
		{map_data,
		 [bid, type, name, def_xy, min_lev, max_lev, condition,
		  relive, width, height, grid_x, grid_y, max_pre_layer,
		  start_type, is_single, unit_list, tile_res_list]},
		{map_grid, [map_pid, map_id, base_id, width, height]},
		{map,
		 [id, srv_id, base_id, res_id, pid, ctrl_pid, grid_info,
		  name, condition, num, max_pre_layer, width, height,
		  dynamic_block, layer_flag]},
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
		{pos,
		 [ver, srv_id, map_id, map_pid, map_bid, map_grid_pid,
		  last, hidden, x, y, dir]},
		{pos_history, [map_id, map_bid, srv_id, x, y]},
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
		{unit_order,
		 [order, type, arg, data, condition, over]}]).

-behaviour(gen_server).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([start_link/0, fetch_ids/1, create_list/1,
	 create/2, create/3, create/4, info/1, info/2,
	 list_map/1, list_battle/1, list/2, list/3, map_type/2,
	 list_type/1, remove_map_all/1, remove_map_type/2,
	 remove/1, sync_remove/1, check_distance/4,
	 baseid_list/1]).

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

-file("src/mod/unit/unit_mgr.erl", 34).

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

-file("src/mod/unit/unit_mgr.erl", 35).

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

-file("src/mod/unit/unit_mgr.erl", 36).

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

-file("src/mod/unit/unit_mgr.erl", 37).

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

-file("src/mod/unit/unit_mgr.erl", 38).

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

-file("src/mod/unit/unit_mgr.erl", 39).

-file("inc/attr.hrl", 1).

-record(attr,
	{fc = 0, toughness = 0, atk = 0, def = 0, def_s = 0,
	 def_p = 0, hp_max = 0, hp = 0, speed = 0, hit_rate = 0,
	 dodge_rate = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, dam = 0, res = 0,
	 cure = 0, be_cure = 0, dam_p = 0, res_p = 0, dam_s = 0,
	 res_s = 0, tenacity = 0}).

-record(attr_calc,
	{attr = #attr{}  :: #attr{},
	 attr_no_ratio = #attr{}  :: #attr{},
	 ratio = #attr{}  :: #attr{},
	 attr_no_fc = #attr{}  :: #attr{},
	 ratio_no_fc = #attr{}  :: #attr{}}).

-file("src/mod/unit/unit_mgr.erl", 40).

-record(state, {next_id = 100000}).

-spec start_link() -> {ok, pid()} | ignore |
		      {error, term()}.

start_link() ->
    gen_server:start_link({local, unit_mgr}, unit_mgr, [],
			  []).

-spec remove_map_all(MapId :: pos_integer()) -> ok.

remove_map_all(MapId) ->
    UnitL = list_map(MapId), remove(UnitL).

-spec remove_map_type(MapId :: pos_integer(),
		      Type :: non_neg_integer()) -> ok.

remove_map_type(MapId, Type) ->
    UnitL = map_type(MapId, Type), remove(UnitL).

-spec remove(Unit :: tuple() | #unit{} |
		     [tuple() | #unit{}]) -> ok.

remove([]) -> ok;
remove([I | T]) -> remove(I), remove(T);
remove(#unit{pid = Pid}) when is_pid(Pid) ->
    unit:stop(Pid), ok;
remove(#unit{id = UnitId,
	     pos = #pos{map_pid = MapPid}}) ->
    map:unit_leave(MapPid, UnitId),
    catch ets:delete(unit_info, UnitId),
    ok;
remove(UnitId) ->
    case info(UnitId) of
      {ok, #unit{pid = Pid}} when is_pid(Pid) ->
	  unit:stop(Pid);
      {ok, #unit{pos = #pos{map_pid = MapPid}}} ->
	  map:unit_leave(MapPid, UnitId),
	  catch ets:delete(unit_info, UnitId);
      {error, not_found} -> skip;
      _E ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidunit_mgr93, _,
	     {__Levelunit_mgr93, __Tracesunit_mgr93}}
		when __Levelunit_mgr93 band 8 /= 0 orelse
		       __Tracesunit_mgr93 /= [] ->
		lager:do_log(error,
			     [{module, unit_mgr}, {function, remove},
			      {line, 93}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("无法删除的地图单位：~w ~w ~w",
					   [UnitId, _E, util:get_stacktrace()]),
			     none, 4096, 8, __Levelunit_mgr93,
			     __Tracesunit_mgr93, lager_event, __Pidunit_mgr93);
	    _ -> ok
	  end
    end,
    ok.

-spec sync_remove(Unit :: tuple() | #unit{}) -> ok |
						{error, any()}.

sync_remove(#unit{pid = Pid}) when is_pid(Pid) ->
    unit:sync_stop(Pid);
sync_remove(#unit{id = UnitId,
		  pos = #pos{map_pid = MapPid}}) ->
    map:unit_leave(MapPid, UnitId),
    catch ets:delete(unit_info, UnitId),
    ok;
sync_remove(UnitId) ->
    case info(UnitId) of
      {ok, #unit{pid = Pid}} when is_pid(Pid) ->
	  unit:sync_stop(Pid);
      {ok, #unit{pos = #pos{map_pid = MapPid}}} ->
	  map:unit_leave(MapPid, UnitId),
	  catch ets:delete(unit_info, UnitId),
	  ok;
      _E ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidunit_mgr117, _,
	     {__Levelunit_mgr117, __Tracesunit_mgr117}}
		when __Levelunit_mgr117 band 8 /= 0 orelse
		       __Tracesunit_mgr117 /= [] ->
		lager:do_log(error,
			     [{module, unit_mgr}, {function, sync_remove},
			      {line, 117}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("无法删除的地图单位：~w", [_E]), none, 4096, 8,
			     __Levelunit_mgr117, __Tracesunit_mgr117,
			     lager_event, __Pidunit_mgr117);
	    _ -> ok
	  end,
	  {error, null_unit}
    end.

-spec fetch_ids(pos_integer()) -> {ok, list()} |
				  {error, term()}.

fetch_ids(Num) ->
    case catch gen_server:call(unit_mgr, {fetch_ids, Num},
			       10000)
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
	    {__Pidunit_mgr124, _,
	     {__Levelunit_mgr124, __Tracesunit_mgr124}}
		when __Levelunit_mgr124 band 8 /= 0 orelse
		       __Tracesunit_mgr124 /= [] ->
		lager:do_log(error,
			     [{module, unit_mgr}, {function, fetch_ids},
			      {line, 124}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [unit_mgr, {fetch_ids, Num}, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelunit_mgr124,
			     __Tracesunit_mgr124, lager_event,
			     __Pidunit_mgr124);
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

-spec create_list([tuple()]) -> [#unit{}].

create_list(List) -> do_create_list(List, []).

do_create_list([], L) -> L;
do_create_list([{BattleId, CreateUnitId, {MapId, X, Y},
		 Args}
		| T],
	       L) ->
    case unit_mgr:create(BattleId, CreateUnitId,
			 {MapId, X, Y}, Args)
	of
      {ok, Unit} -> do_create_list(T, [Unit | L]);
      _Err -> do_create_list(T, L)
    end.

-spec create(UnitId :: pos_integer() | unit_id(),
	     Base :: pos_integer() | #unit_data{},
	     Pos :: {pos_integer(), pos_integer(),
		     pos_integer()}) -> {ok, #unit{}} | {error, term()}.

create(UnitId, Base, Pos) ->
    create(UnitId, Base, Pos, #{}).

-spec create(UnitId :: pos_integer() | unit_id(),
	     Base :: pos_integer() | #unit_data{},
	     Pos :: {pos_integer(), pos_integer(), pos_integer()},
	     Args :: #{}) -> {ok, #unit{}} | {error, term()}.

create({BattleId, Id},
       UnitBase = #unit_data{activity = 0}, Pos, Args) ->
    {ok, Unit} = unit_convert:to({unit, Pos, Args},
				 UnitBase),
    create({BattleId, Id}, Unit);
create(BattleId, UnitBase = #unit_data{}, Pos, Args) ->
    case fetch_ids(1) of
      {error, Reason} -> {error, Reason};
      {ok, [Id]} ->
	  {ok, Unit} = unit_convert:to({unit, Pos, Args},
				       UnitBase),
	  create({BattleId, Id}, Unit)
    end;
create(Id, BaseId, Pos, Args) ->
    case unit_data:get(BaseId) of
      undefined -> {error, unit_data_not_exists};
      UnitBase = #unit_data{} ->
	  create(Id, UnitBase, Pos, Args)
    end.

create(Id, Unit = #unit{activity = 1}) ->
    unit:create(Id, Unit#unit{id = Id});
create(Id,
       Unit = #unit{base_id = _BaseId,
		    pos = Pos = #pos{map_id = MapId}}) ->
    U = Unit#unit{id = Id},
    {ok, MapUnit} = unit_convert:to(map_unit, U),
    case map:unit_enter(MapId, MapUnit) of
      error ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidunit_mgr171, _,
	     {__Levelunit_mgr171, __Tracesunit_mgr171}}
		when __Levelunit_mgr171 band 8 /= 0 orelse
		       __Tracesunit_mgr171 /= [] ->
		lager:do_log(error,
			     [{module, unit_mgr}, {function, create},
			      {line, 171}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("单位[~w]进入地图[~w]失败",
					   [_BaseId, MapId]),
			     none, 4096, 8, __Levelunit_mgr171,
			     __Tracesunit_mgr171, lager_event,
			     __Pidunit_mgr171);
	    _ -> ok
	  end,
	  {error, enter_map_failed};
      {ok, MapBaseId, MapPid, GridPid} ->
	  NewU = U#unit{pos =
			    Pos#pos{map_bid = MapBaseId, map_pid = MapPid,
				    map_grid_pid = GridPid,
				    srv_id = sys_env:get(server_id)}},
	  catch ets:insert(unit_info, NewU),
	  {ok, NewU}
    end.

-spec info(UnitId) -> {ok, #unit{}} |
		      {error, not_found} when UnitId :: {pos_integer(),
							 pos_integer()} |
							pos_integer().

info(UnitId) ->
    case catch ets:lookup(unit_info, UnitId) of
      [U] -> {ok, U};
      _ -> {error, not_found}
    end.

-spec info(bitstring(), UnitId) -> {ok, #unit{}} |
				   {error, term()} when UnitId ::
							    {pos_integer(),
							     pos_integer()} |
							    pos_integer().

info(SrvId, UnitId) ->
    cluster_lib:call(SrvId, unit_mgr, info, [UnitId]).

-spec list_battle(BattleId ::
		      non_neg_integer()) -> [#unit{}].

list_battle(BattleId) ->
    case catch ets:match_object(unit_info,
				#unit{id = {BattleId, '_'}, _ = '_'})
	of
      L = [_ | _] -> L;
      _Err -> []
    end.

-spec list_map(MapId :: non_neg_integer()) -> [#unit{}].

list_map(MapId) ->
    case catch ets:match_object(unit_info,
				#unit{pos = #pos{map_id = MapId, _ = '_'},
				      _ = '_'})
	of
      L = [_ | _] -> L;
      _Err -> []
    end.

-spec baseid_list(BaseId ::
		      non_neg_integer()) -> [#unit{}].

baseid_list(BaseId) ->
    case catch ets:match_object(unit_info,
				#unit{base_id = BaseId, _ = '_'})
	of
      L = [_ | _] -> L;
      _Err -> []
    end.

-spec list(MapId :: non_neg_integer(),
	   UnitBaseId :: non_neg_integer()) -> [#unit{}].

list(MapId, UnitBaseId) ->
    case catch ets:match_object(unit_info,
				#unit{base_id = UnitBaseId,
				      pos = #pos{map_id = MapId, _ = '_'},
				      _ = '_'})
	of
      L = [_ | _] -> L;
      _Err -> []
    end.

list(MapId, MinBaseId, MaxBaseId) ->
    Ms = [{#unit{base_id = '$1',
		 pos = #pos{map_id = '$2', _ = '_'}, _ = '_'},
	   [{'andalso', {'>=', '$1', MinBaseId},
	     {'=<', '$1', MaxBaseId}, {'=:=', '$2', MapId}}],
	   ['$_']}],
    case catch ets:select(unit_info, Ms) of
      L when is_list(L) -> L;
      _ -> []
    end.

-spec map_type(MapId :: non_neg_integer(),
	       Type :: non_neg_integer()) -> [#unit{}].

map_type(MapId, Type) ->
    case catch ets:match_object(unit_info,
				#unit{type = Type,
				      pos = #pos{map_id = MapId, _ = '_'},
				      _ = '_'})
	of
      L = [_ | _] -> L;
      _Err -> []
    end.

-spec list_type(Type :: non_neg_integer()) -> [#unit{}].

list_type(Type) ->
    case catch ets:match_object(unit_info,
				#unit{type = Type, _ = '_'})
	of
      L = [_ | _] -> L;
      _ -> []
    end.

-spec check_distance(#role{}, UnitId :: tuple(),
		     UnitBaseId :: non_neg_integer(),
		     Range :: non_neg_integer()) -> true | false.

check_distance(#role{pos =
			 #pos{map_id = MapId, x = X, y = Y}},
	       {_0, 0}, UnitBaseId, Range) ->
    case map_unit_data:get(UnitBaseId) of
      {MapId, DestX, DestY} ->
	  abs(X - DestX) =< Range andalso abs(Y - DestY) =< Range;
      _ ->
	  case unit_mgr:list(MapId, UnitBaseId) of
	    [#unit{pos = #pos{map_id = MapId, x = DestX, y = DestY}}
	     | _] ->
		abs(X - DestX) =< Range andalso abs(Y - DestY) =< Range;
	    _ -> false
	  end
    end;
check_distance(#role{pos =
			 #pos{map_id = MapId, x = X, y = Y}},
	       {BattleId, UnitId}, UnitBaseId, Range) ->
    case map_unit_data:get(UnitBaseId) of
      {MapId, DestX, DestY} ->
	  abs(X - DestX) =< Range andalso abs(Y - DestY) =< Range;
      _ ->
	  case unit_mgr:info({BattleId, UnitId}) of
	    {ok,
	     #unit{pos =
		       #pos{map_id = MapId, x = DestX, y = DestY}}} ->
		abs(X - DestX) =< Range andalso abs(Y - DestY) =< Range;
	    _ -> false
	  end
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
      {__Pidunit_mgr284, _,
       {__Levelunit_mgr284, __Tracesunit_mgr284}}
	  when __Levelunit_mgr284 band 64 /= 0 orelse
		 __Tracesunit_mgr284 /= [] ->
	  lager:do_log(info,
		       [{module, unit_mgr}, {function, init}, {line, 284},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [unit_mgr]), none, 4096,
		       64, __Levelunit_mgr284, __Tracesunit_mgr284,
		       lager_event, __Pidunit_mgr284);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    ets:new(unit_info,
	    [set, named_table, public, {keypos, #unit.id}]),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidunit_mgr288, _,
       {__Levelunit_mgr288, __Tracesunit_mgr288}}
	  when __Levelunit_mgr288 band 64 /= 0 orelse
		 __Tracesunit_mgr288 /= [] ->
	  lager:do_log(info,
		       [{module, unit_mgr}, {function, init}, {line, 288},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成...", [unit_mgr]), none, 4096,
		       64, __Levelunit_mgr288, __Tracesunit_mgr288,
		       lager_event, __Pidunit_mgr288);
      _ -> ok
    end,
    {ok, State}.

handle_call({fetch_ids, Num}, _From,
	    State = #state{next_id = NextId}) ->
    {reply, {ok, lists:seq(NextId, NextId + Num - 1)},
     State#state{next_id = NextId + Num}};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidunit_mgr304, _,
       {__Levelunit_mgr304, __Tracesunit_mgr304}}
	  when __Levelunit_mgr304 band 64 /= 0 orelse
		 __Tracesunit_mgr304 /= [] ->
	  lager:do_log(info,
		       [{module, unit_mgr}, {function, terminate}, {line, 304},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在关闭...", [unit_mgr]), none, 4096,
		       64, __Levelunit_mgr304, __Tracesunit_mgr304,
		       lager_event, __Pidunit_mgr304);
      _ -> ok
    end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidunit_mgr305, _,
       {__Levelunit_mgr305, __Tracesunit_mgr305}}
	  when __Levelunit_mgr305 band 64 /= 0 orelse
		 __Tracesunit_mgr305 /= [] ->
	  lager:do_log(info,
		       [{module, unit_mgr}, {function, terminate}, {line, 305},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 关闭完成", [unit_mgr]), none, 4096, 64,
		       __Levelunit_mgr305, __Tracesunit_mgr305, lager_event,
		       __Pidunit_mgr305);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.


