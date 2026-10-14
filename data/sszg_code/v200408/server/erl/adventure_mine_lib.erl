-file("src/mod/adventure/adventure_mine_lib.erl", 1).

-module(adventure_mine_lib).

-lager_records([{adventure_mine_owned_data, [id, pos]},
		{adventure_mine_owned, [id, list]},
		{adventure_mine_log,
		 [replay_id, floor, room_id, rid, name, lev, mine_id,
		  face, avatar_id, power, type, ret, loss, time, expire]},
		{adventure_mine_role_log, [id, logs]},
		{adventure_mine_group, [group_id, num, power, list]},
		{adventure_mine_role,
		 [id, max_power, login_time, group_id]},
		{adventure_mine_fight_lock,
		 [id, is_fight, fight_rid, fight_pid]},
		{adventure_mine_pos,
		 [pos, id, bid, lev, star, break_lev, power, use_skin,
		  set_skill, attr, ext]},
		{adventure_mine_hook,
		 [id, role_id, mine_id, plunder_count, last_hook_time,
		  acc_hook_items, acc_hook_time, occupy_time,
		  primary_count, senior_count, log]},
		{adventure_mine_group_hook, [group_id, list]},
		{adventure_mine_hole,
		 [room_id, mine_id, role_id, name, lev, face, last_fight,
		  occupy_time, defense, hallows_id, power, formation_type,
		  robot_id, cool_time, last_replay_id]},
		{adventure_mine_floor, [id, list]},
		{adventure_data, [id, room, name, lose]},
		{a_room,
		 [id, idx, evt_id, res_id, status, cond_status, lock,
		  init_evt_id, ext]},
		{m_adventure,
		 [ver, pass_id, pass_num, explore_num, id, room,
		  first_room, boss_room, room_list, buff_list, shop_list,
		  start_time, end_time, plist, is_kill_boss, init_time,
		  skill_list, bag_list, map_id, partner_id, skill_used,
		  round_reward, round_evt_group, kill_mon,
		  mine_combat_num, mine_round_combat, mine_round_reward,
		  current_id, mine_buy_count, init_id, laste_num]},
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

-export([get_adventure_mine_floor/2,
	 get_adventure_mine_floor_cli/2,
	 get_adventure_mine_hole/3, get_group_id/1, get_log/1,
	 get_lock/3, get_lock_partner_ids/1,
	 get_lock_partner_ids_except/3, get_owned_floor/1,
	 get_mine_owned/1, get_mine_owned_num/1, get_max_floor/1,
	 get_mine_hook_group/1, get_mine_hook_group/3,
	 get_zone_pid/1, get_used_hallows/1,
	 cluster_get_adventure_mine_floor_cli/2,
	 cluster_get_adventure_mine_hole/3,
	 cluster_get_group_id/1, cluster_get_lock_partner_ids/1,
	 cluster_get_lock_partner_ids_except/3,
	 cluster_get_owned_floor/1, cluster_get_mine_owned/1,
	 cluster_get_mine_owned_num/1,
	 cluster_get_mine_hook_group/1,
	 cluster_get_mine_hook_group/3, cluster_get_zone_pid/1,
	 cluster_get_used_hallows/1]).

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

-file("src/mod/adventure/adventure_mine_lib.erl", 38).

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

-file("src/mod/adventure/adventure_mine_lib.erl", 39).

-file("inc/adventure.hrl", 1).

-record(m_adventure,
	{ver = 10, pass_id = 0, pass_num = 0, explore_num = 0,
	 id = 0, room = 0, first_room = 0, boss_room = 0,
	 room_list = [], buff_list = [], shop_list = [],
	 start_time = 0, end_time = 0, plist = [],
	 is_kill_boss = 0, init_time = 0, skill_list = [],
	 bag_list = [], map_id = 0, partner_id = 0,
	 skill_used = [], round_reward = [],
	 round_evt_group = [], kill_mon = 0, mine_combat_num = 0,
	 mine_round_combat = 0, mine_round_reward = [],
	 current_id = 0, mine_buy_count = 0, init_id = 0,
	 laste_num = 999}).

-record(a_room,
	{id = 1, idx = 0, evt_id = 0, res_id = 0, status = 0,
	 cond_status = 0, lock = 0, init_evt_id = 0, ext = []}).

-record(adventure_data,
	{id = 0, room = 0, name = <<>>, lose = []}).

-file("src/mod/adventure/adventure_mine_lib.erl", 40).

-file("inc/adventure_mine.hrl", 1).

-record(adventure_mine_floor, {id = {0, 0}, list = []}).

-record(adventure_mine_hole,
	{room_id = 0, mine_id = 0, role_id = {0, <<>>},
	 name = <<>>, lev = 0, face = 0, last_fight = {0, <<>>},
	 occupy_time = 0, defense = [], hallows_id = 0,
	 power = 0, formation_type = 1, robot_id = 0,
	 cool_time = 0, last_replay_id = 0}).

-record(adventure_mine_group_hook,
	{group_id = 0, list = []}).

-record(adventure_mine_hook,
	{id = {0, 0}, role_id = {0, <<>>}, mine_id = 0,
	 plunder_count = 0, last_hook_time = 0,
	 acc_hook_items = [], acc_hook_time = 0, occupy_time = 0,
	 primary_count = 0, senior_count = 0, log = []}).

-record(adventure_mine_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, use_skin = 0, set_skill = [],
	 attr, ext = []}).

-record(adventure_mine_fight_lock,
	{id = {0, 0, 0}, is_fight = 0, fight_rid = {0, <<>>},
	 fight_pid = 0}).

-record(adventure_mine_role,
	{id = {0, <<>>}, max_power = 0, login_time = 0,
	 group_id = 0}).

-record(adventure_mine_group,
	{group_id = 0, num = 0, power = 0, list = []}).

-record(adventure_mine_role_log,
	{id = {0, <<>>}, logs = []}).

-record(adventure_mine_log,
	{replay_id = 0, floor = 0, room_id = 0, rid = {0, <<>>},
	 name = <<>>, lev = 0, mine_id = 0, face = 0,
	 avatar_id = 0, power = 0, type = 1, ret = 1, loss = [],
	 time = 0, expire = 0}).

-record(adventure_mine_owned,
	{id = {0, <<>>}, list = []}).

-record(adventure_mine_owned_data,
	{id = {0, 0}, pos = []}).

-file("src/mod/adventure/adventure_mine_lib.erl", 41).

-spec get_adventure_mine_floor(pos_integer(),
			       pos_integer()) -> {ok, #adventure_mine_floor{}} |
						 false.

get_adventure_mine_floor(GroupId, Floor) ->
    case ets:lookup(adventure_mine_floor, {GroupId, Floor})
	of
      [AMF = #adventure_mine_floor{}] -> {ok, AMF};
      _ -> false
    end.

get_adventure_mine_floor_cli(GroupId, Floor) ->
    case get_adventure_mine_floor(GroupId, Floor) of
      {ok, #adventure_mine_floor{list = List}} ->
	  CliL = to_mine_cli(List, GroupId, Floor,
			     date:unixtime(), []),
	  {ok, CliL};
      _ -> false
    end.

to_mine_cli([], _GroupId, _FloorId, _Now, CliL) -> CliL;
to_mine_cli([Hole = #adventure_mine_hole{room_id =
					     RoomId,
					 cool_time = CoolTime}
	     | Other],
	    GroupId, FloorId, Now, CliL) ->
    if CoolTime >= Now ->
	   to_mine_cli(Other, GroupId, FloorId, Now,
		       [{Hole, 2} | CliL]);
       true ->
	   #adventure_mine_fight_lock{is_fight = IsFight} =
	       adventure_mine_lib:get_lock(GroupId, FloorId, RoomId),
	   Status = util:if_true(IsFight == 1, 1, 0),
	   to_mine_cli(Other, GroupId, FloorId, Now,
		       [{Hole, Status} | CliL])
    end.

-spec get_adventure_mine_hole(pos_integer(),
			      pos_integer(), pos_integer()) -> {ok,
								#adventure_mine_hole{}} |
							       false.

get_adventure_mine_hole(GroupId, Floor, RoomId) ->
    case get_adventure_mine_floor(GroupId, Floor) of
      {ok, #adventure_mine_floor{list = List}} ->
	  case lists:keyfind(RoomId, #adventure_mine_hole.room_id,
			     List)
	      of
	    Hole = #adventure_mine_hole{} -> {ok, Hole};
	    _ -> false
	  end;
      _ -> false
    end.

-spec get_group_id(role_id()) -> pos_integer().

get_group_id(RoleId) ->
    case ets:lookup(adventure_mine_role, RoleId) of
      [#adventure_mine_role{group_id = 0}] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_lib91, _,
	     {__Leveladventure_mine_lib91,
	      __Tracesadventure_mine_lib91}}
		when __Leveladventure_mine_lib91 band 8 /= 0 orelse
		       __Tracesadventure_mine_lib91 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine_lib},
			      {function, get_group_id}, {line, 91},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w没有矿战分组临时取组1", [RoleId]), none,
			     4096, 8, __Leveladventure_mine_lib91,
			     __Tracesadventure_mine_lib91, lager_event,
			     __Pidadventure_mine_lib91);
	    _ -> ok
	  end,
	  1;
      [#adventure_mine_role{group_id = GroupId}] -> GroupId;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_lib95, _,
	     {__Leveladventure_mine_lib95,
	      __Tracesadventure_mine_lib95}}
		when __Leveladventure_mine_lib95 band 8 /= 0 orelse
		       __Tracesadventure_mine_lib95 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine_lib},
			      {function, get_group_id}, {line, 95},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w找不到矿战分组,给他手动分组", [RoleId]), none,
			     4096, 8, __Leveladventure_mine_lib95,
			     __Tracesadventure_mine_lib95, lager_event,
			     __Pidadventure_mine_lib95);
	    _ -> ok
	  end,
	  role_lib:cast(by_id, RoleId,
			{adventure_mine_mgr, sync_role, []}),
	  0
    end.

-spec get_log(role_id()) -> #adventure_mine_role_log{}.

get_log(RoleId) ->
    case ets:lookup(adventure_mine_role_log, RoleId) of
      [Log] -> Log;
      _ ->
	  case dets:lookup(adventure_mine_role_log, RoleId) of
	    [Log] -> ets:insert(adventure_mine_role_log, Log), Log;
	    [] ->
		Log = #adventure_mine_role_log{id = RoleId},
		ets:insert(adventure_mine_role_log, Log),
		Log
	  end
    end.

-spec get_lock(pos_integer(), pos_integer(),
	       pos_integer()) -> #adventure_mine_fight_lock{}.

get_lock(GroupId, Floor, RoomId) ->
    case ets:lookup(adventure_mine_fight_lock,
		    {GroupId, Floor, RoomId})
	of
      [Lock] -> Lock;
      _ ->
	  #adventure_mine_fight_lock{id =
					 {GroupId, Floor, RoomId}}
    end.

-spec get_lock_partner_ids(role_id()) -> list().

get_lock_partner_ids(RoleId) ->
    case ets:lookup(adventure_mine_owned, RoleId) of
      [#adventure_mine_owned{list = List}] ->
	  lists:flatten([Pos
			 || #adventure_mine_owned_data{pos = Pos} <- List]);
      _ -> []
    end.

-spec get_lock_partner_ids_except(role_id(),
				  pos_integer(), pos_integer()) -> list().

get_lock_partner_ids_except(RoleId, Floor, RoomId) ->
    case ets:lookup(adventure_mine_owned, RoleId) of
      [#adventure_mine_owned{list = List}] ->
	  lists:flatten([Pos
			 || #adventure_mine_owned_data{id = {FloorT, RoomIdT},
						       pos = Pos}
				<- List,
			    {FloorT, RoomIdT} =/= {Floor, RoomId}]);
      _ -> []
    end.

-spec get_owned_floor(role_id()) -> list().

get_owned_floor(RoleId) ->
    case ets:lookup(adventure_mine_owned, RoleId) of
      [#adventure_mine_owned{list = List}] ->
	  list_util:filter_replicat([Floor
				     || #adventure_mine_owned_data{id =
								       {Floor,
									_}}
					    <- List]);
      _ -> []
    end.

get_mine_owned(RoleId) ->
    case ets:lookup(adventure_mine_owned, RoleId) of
      [Owned = #adventure_mine_owned{}] -> Owned;
      _ -> #adventure_mine_owned{id = RoleId}
    end.

get_mine_owned_num(RoleId) ->
    #adventure_mine_owned{list = L} =
	get_mine_owned(RoleId),
    length(L).

get_mine_hook_group(GroupId) ->
    case ets:lookup(adventure_mine_group_hook, GroupId) of
      [GroupHook = #adventure_mine_group_hook{}] -> GroupHook;
      _ -> #adventure_mine_group_hook{group_id = GroupId}
    end.

get_mine_hook_group(GroupId, Floor, RoomId) ->
    #adventure_mine_group_hook{list = List} =
	get_mine_hook_group(GroupId),
    case lists:keyfind({Floor, RoomId},
		       #adventure_mine_hook.id, List)
	of
      Hook = #adventure_mine_hook{} -> Hook;
      _ -> #adventure_mine_hook{}
    end.

-spec get_max_floor(role_id()) -> pos_integer().

get_max_floor(RoleId = {_, SrvId}) ->
    case cluster_lib:call(SrvId, ets, lookup,
			  [adventure_mine_floor_max, RoleId])
	of
      [{RoleId, MaxFloor}] -> MaxFloor;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidadventure_mine_lib185, _,
	     {__Leveladventure_mine_lib185,
	      __Tracesadventure_mine_lib185}}
		when __Leveladventure_mine_lib185 band 8 /= 0 orelse
		       __Tracesadventure_mine_lib185 /= [] ->
		lager:do_log(error,
			     [{module, adventure_mine_lib},
			      {function, get_max_floor}, {line, 185},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w在计算矿战收益时居然无法获得他的最大通关层", [RoleId]),
			     none, 4096, 8, __Leveladventure_mine_lib185,
			     __Tracesadventure_mine_lib185, lager_event,
			     __Pidadventure_mine_lib185);
	    _ -> ok
	  end,
	  0
    end.

get_zone_pid(RoleId) ->
    GroupId = get_group_id(RoleId),
    case ets:lookup(adventure_mine_zone, GroupId) of
      [{_, Pid}] -> Pid;
      _ -> undefined
    end.

get_used_hallows(RoleId) ->
    GroupId = get_group_id(RoleId),
    #adventure_mine_owned{list = OwnedList} =
	get_mine_owned(RoleId),
    Fun = fun (#adventure_mine_owned_data{id =
					      {Floor, RoomId}},
	       Acc) ->
		  case get_adventure_mine_hole(GroupId, Floor, RoomId) of
		    {ok, #adventure_mine_hole{hallows_id = HallowsId}}
			when HallowsId =/= 0 ->
			[{Floor, RoomId, HallowsId} | Acc];
		    _ -> Acc
		  end
	  end,
    lists:foldl(Fun, [], OwnedList).

cluster_get_adventure_mine_floor_cli(GroupId, Floor) ->
    case adventure_mine_mgr:send_call(adventure_mine_lib,
				      get_adventure_mine_floor_cli,
				      [GroupId, Floor])
	of
      {ok, CliL} -> {ok, CliL};
      _ -> false
    end.

cluster_get_adventure_mine_hole(GroupId, Floor,
				RoomId) ->
    case adventure_mine_mgr:send_call(adventure_mine_lib,
				      get_adventure_mine_hole,
				      [GroupId, Floor, RoomId])
	of
      {ok, Hole} -> {ok, Hole};
      _ -> false
    end.

cluster_get_group_id(RoleId) ->
    case adventure_mine_mgr:send_call(adventure_mine_lib,
				      get_group_id, [RoleId])
	of
      GroupId when is_integer(GroupId) -> GroupId;
      _ -> 1
    end.

cluster_get_lock_partner_ids(RoleId) ->
    case adventure_mine_mgr:send_call(adventure_mine_lib,
				      get_lock_partner_ids, [RoleId])
	of
      List when is_list(List) -> List;
      _ -> []
    end.

cluster_get_lock_partner_ids_except(RoleId, Floor,
				    RoomId) ->
    case adventure_mine_mgr:send_call(adventure_mine_lib,
				      get_lock_partner_ids_except,
				      [RoleId, Floor, RoomId])
	of
      List when is_list(List) -> List;
      _ -> []
    end.

cluster_get_owned_floor(RoleId) ->
    case adventure_mine_mgr:send_call(adventure_mine_lib,
				      get_owned_floor, [RoleId])
	of
      List when is_list(List) -> List;
      _ -> []
    end.

cluster_get_mine_owned(RoleId) ->
    case adventure_mine_mgr:send_call(adventure_mine_lib,
				      get_mine_owned, [RoleId])
	of
      Owned = #adventure_mine_owned{} -> Owned;
      _ -> #adventure_mine_owned{id = RoleId}
    end.

cluster_get_mine_owned_num(RoleId) ->
    case adventure_mine_mgr:send_call(adventure_mine_lib,
				      get_mine_owned_num, [RoleId])
	of
      NumT when is_integer(NumT) -> NumT;
      _ -> 0
    end.

cluster_get_mine_hook_group(GroupId) ->
    case adventure_mine_mgr:send_call(adventure_mine_lib,
				      get_mine_hook_group, [GroupId])
	of
      GroupHook = #adventure_mine_group_hook{} -> GroupHook;
      _ -> #adventure_mine_group_hook{group_id = GroupId}
    end.

cluster_get_mine_hook_group(GroupId, Floor, RoomId) ->
    case adventure_mine_mgr:send_call(adventure_mine_lib,
				      get_mine_hook_group,
				      [GroupId, Floor, RoomId])
	of
      Hook = #adventure_mine_hook{} -> Hook;
      _ -> #adventure_mine_hook{}
    end.

cluster_get_zone_pid(RoleId) ->
    case adventure_mine_mgr:send_call(adventure_mine_lib,
				      get_zone_pid, [RoleId])
	of
      Pid when is_pid(Pid) -> Pid;
      _ -> undefined
    end.

cluster_get_used_hallows(RoleId) ->
    case adventure_mine_mgr:send_call(adventure_mine_lib,
				      get_used_hallows, [RoleId])
	of
      List when is_list(List) -> List;
      _ -> []
    end.


