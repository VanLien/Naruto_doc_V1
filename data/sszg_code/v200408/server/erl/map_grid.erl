-file("src/mod/map/map_grid.erl", 1).

-module(map_grid).

-lager_records([{pos,
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
		  p_eqm, p_home]},
		{map_data,
		 [bid, type, name, def_xy, min_lev, max_lev, condition,
		  relive, width, height, grid_x, grid_y, max_pre_layer,
		  start_type, is_single, unit_list, tile_res_list]},
		{map_grid, [map_pid, map_id, base_id, width, height]},
		{map,
		 [id, srv_id, base_id, res_id, pid, ctrl_pid, grid_info,
		  name, condition, num, max_pre_layer, width, height,
		  dynamic_block, layer_flag]}]).

-behaviour(gen_server).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([start_link/1, stop/1, enter/2, repush/2,
	 move/2, leave/6, update/2, update_looks/2,
	 update_conn_pid/6, in_9grid/3, distance/2]).

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

-file("src/mod/map/map_grid.erl", 25).

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

-file("src/mod/map/map_grid.erl", 26).

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

-file("src/mod/map/map_grid.erl", 27).

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

-file("src/mod/map/map_grid.erl", 28).

-spec start_link(#map_grid{}) -> {ok, pid()} | ignore |
				 {error, term()}.

start_link(MapGrid) ->
    gen_server:start_link(map_grid, [MapGrid], []).

-spec stop(pid()) -> ok.

stop(Pid) -> Pid ! stop, ok.

-spec enter(pid(), #map_role{}) -> ok.

enter(Pid, MapRole) -> Pid ! {enter, MapRole}, ok.

-spec repush(pid(), #map_role{}) -> ok.

repush(Pid, R) -> Pid ! {repush, R}, ok.

-spec move(pid(), tuple()) -> ok.

move(Pid, Data) -> Pid ! {move, Data}, ok.

-spec leave(pid(), pid(), non_neg_integer(),
	    non_neg_integer(), pos_integer(), bitstring()) -> ok.

leave(Pid, RolePid, X, Y, Rid, SrvId) ->
    Pid ! {leave, RolePid, X, Y, Rid, SrvId}, ok.

-spec update(pid(), #map_role{}) -> ok.

update(Pid, MapRole) when is_pid(Pid) ->
    Pid ! {update, MapRole}, ok;
update(_Pid, _MapRole) -> ok.

-spec update_looks(pid(), tuple()) -> ok.

update_looks(Pid, Info) when is_pid(Pid) ->
    Pid ! {update_looks, Info}, ok;
update_looks(_Pid, _Info) -> ok.

-spec update_conn_pid(pid(), pid(), non_neg_integer(),
		      non_neg_integer(), pid(), pid()) -> ok.

update_conn_pid(Pid, RolePid, X, Y, ConnPid,
		NewConnPid) ->
    Pid !
      {update_conn_pid, RolePid, X, Y, ConnPid, NewConnPid},
    ok.

-spec in_9grid(pid(), non_neg_integer(),
	       non_neg_integer()) -> [tuple()].

in_9grid(Pid, X, Y) ->
    case catch gen_server:call(Pid, {in_9grid, X, Y}, 10000)
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
	    {__Pidmap_grid151, _,
	     {__Levelmap_grid151, __Tracesmap_grid151}}
		when __Levelmap_grid151 band 8 /= 0 orelse
		       __Tracesmap_grid151 /= [] ->
		lager:do_log(error,
			     [{module, map_grid}, {function, in_9grid},
			      {line, 151}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [Pid, {in_9grid, X, Y}, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelmap_grid151,
			     __Tracesmap_grid151, lager_event,
			     __Pidmap_grid151);
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

-spec distance(#pos{}, #pos{}) -> {ok,
				   {integer(), integer()}} |
				  false.

distance(#pos{map_pid = MapPid, x = X1, y = Y1},
	 #pos{map_pid = MapPid, x = X2, y = Y2}) ->
    Dx = erlang:abs(util:floor(X1 / 700) -
		      util:floor(X2 / 700)),
    Dy = erlang:abs(util:floor(Y1 / 450) -
		      util:floor(Y2 / 450)),
    {ok, {Dx, Dy}};
distance(_, _) -> false.

init([MapGrid = #map_grid{width = W, height = H,
			  base_id = Bid}]) ->
    put(map_base_id, Bid),
    grid(util:floor(W / 700) + 1, util:floor(H / 450) + 1),
    {ok, MapGrid}.

handle_call({in_9grid, X, Y}, _From,
	    State = #map_grid{width = W, height = H}) ->
    Dx = if X =< 0 -> 0;
	    X > W -> W;
	    true -> X
	 end,
    Dy = if Y =< 0 -> 0;
	    Y > H -> H;
	    true -> Y
	 end,
    {reply,
     get_in_9grid(util:floor(Dx / 700),
		  util:floor(Dy / 450)),
     State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(print,
	    State = #map_grid{width = W, height = H}) ->
    [[case {whereis(lager_event), whereis(lager_event),
	    lager_config:get({lager_event, loglevel}, {0, []})}
	  of
	{undefined, undefined, _} ->
	    fun () -> {error, lager_not_running} end();
	{undefined, _, _} ->
	    fun () -> {error, {sink_not_configured, lager_event}}
	    end();
	{__Pidmap_grid184, _,
	 {__Levelmap_grid184, __Tracesmap_grid184}}
	    when __Levelmap_grid184 band 64 /= 0 orelse
		   __Tracesmap_grid184 /= [] ->
	    lager:do_log(info,
			 [{module, map_grid}, {function, handle_info},
			  {line, 184}, {pid, pid_to_list(self())},
			  {node, node()}
			  | lager:md()],
			 io_lib:format("~w:~w==>~w",
				       [X, Y, length(get({X, Y}))]),
			 none, 4096, 64, __Levelmap_grid184,
			 __Tracesmap_grid184, lager_event, __Pidmap_grid184);
	_ -> ok
      end
      || X <- lists:seq(-1, util:floor(W / 700) + 1)]
     || Y <- lists:seq(-1, util:floor(H / 450) + 1)],
    {noreply, State};
handle_info({enter,
	     MapRole = #map_role{name = _Name, conn_pid = ConnPid,
				 x = X, y = Y}},
	    State = #map_grid{map_id = MapId, width = W,
			      height = H}) ->
    Dx = if X =< 0 -> 0;
	    X > W -> W;
	    true -> X
	 end,
    Dy = if Y =< 0 -> 0;
	    Y > H -> H;
	    true -> Y
	 end,
    Gx = util:floor(Dx / 700),
    Gy = util:floor(Dy / 450),
    R = MapRole#map_role{map = MapId, gx = Gx, gy = Gy},
    {ok, Bin} = proto_102:pack(10213, srv, R),
    L1 = [get(P)
	  || P
		 <- [{Gx - 1, Gy - 1}, {Gx - 1, Gy}, {Gx - 1, Gy + 1},
		     {Gx, Gy + 1}, {Gx + 1, Gy + 1}, {Gx + 1, Gy},
		     {Gx + 1, Gy - 1}, {Gx, Gy - 1}, {Gx, Gy}]],
    grid_cast(L1, Bin),
    put({Gx, Gy}, [R | get({Gx, Gy})]),
    sys_conn:pack_send(ConnPid, 10222,
		       {get_in_9grid(Gx, Gy)}),
    {noreply, State};
handle_info({move,
	     {RolePid, SrcX, SrcY, DestX, DestY, Dir, IsPush}},
	    State) ->
    Gx1 = util:floor(SrcX / 700),
    Gy1 = util:floor(SrcY / 450),
    case lists:keyfind(RolePid, #map_role.pid,
		       get({Gx1, Gy1}))
	of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap_grid209, _,
	     {__Levelmap_grid209, __Tracesmap_grid209}}
		when __Levelmap_grid209 band 128 /= 0 orelse
		       __Tracesmap_grid209 /= [] ->
		lager:do_log(debug,
			     [{module, map_grid}, {function, handle_info},
			      {line, 209}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "无效的移动操作", none, 4096, 128, __Levelmap_grid209,
			     __Tracesmap_grid209, lager_event,
			     __Pidmap_grid209);
	    _ -> ok
	  end;
      R ->
	  do_move(R#map_role{x = DestX, y = DestY,
			     gx = util:floor(DestX / 700),
			     gy = util:floor(DestY / 450), dir = Dir},
		  SrcX, SrcY, Gx1, Gy1, IsPush)
    end,
    {noreply, State};
handle_info({update_conn_pid, RolePid, X, Y, _ConnPid,
	     NewConnPid},
	    State = #map_grid{width = W, height = H}) ->
    Dx = if X =< 0 -> 0;
	    X > W -> W;
	    true -> X
	 end,
    Dy = if Y =< 0 -> 0;
	    Y > H -> H;
	    true -> Y
	 end,
    Gx = util:floor(Dx / 700),
    Gy = util:floor(Dy / 450),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap_grid221, _,
       {__Levelmap_grid221, __Tracesmap_grid221}}
	  when __Levelmap_grid221 band 128 /= 0 orelse
		 __Tracesmap_grid221 /= [] ->
	  lager:do_log(debug,
		       [{module, map_grid}, {function, handle_info},
			{line, 221}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("更新角色连接PID： ~w", [NewConnPid]), none,
		       4096, 128, __Levelmap_grid221, __Tracesmap_grid221,
		       lager_event, __Pidmap_grid221);
      _ -> ok
    end,
    case lists:keyfind(RolePid, #map_role.pid,
		       get({Gx, Gy}))
	of
      false -> ignore;
      Mr ->
	  put({Gx, Gy},
	      lists:keyreplace(RolePid, #map_role.pid, get({Gx, Gy}),
			       Mr#map_role{conn_pid = NewConnPid}))
    end,
    {noreply, State};
handle_info({update,
	     MapRole = #map_role{pid = RolePid, x = X, y = Y}},
	    State = #map_grid{width = W, height = H}) ->
    Dx = if X =< 0 -> 0;
	    X > W -> W;
	    true -> X
	 end,
    Dy = if Y =< 0 -> 0;
	    Y > H -> H;
	    true -> Y
	 end,
    Gx = util:floor(Dx / 700),
    Gy = util:floor(Dy / 450),
    Mr = MapRole#map_role{gx = Gx, gy = Gy},
    put({Gx, Gy},
	lists:keyreplace(RolePid, #map_role.pid, get({Gx, Gy}),
			 Mr)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap_grid237, _,
       {__Levelmap_grid237, __Tracesmap_grid237}}
	  when __Levelmap_grid237 band 128 /= 0 orelse
		 __Tracesmap_grid237 /= [] ->
	  lager:do_log(debug,
		       [{module, map_grid}, {function, handle_info},
			{line, 237}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("角色[~ts]更新了场景信息:[SPEED:~w, EVENT:~w]",
				     [MapRole#map_role.name,
				      MapRole#map_role.speed,
				      MapRole#map_role.event]),
		       none, 4096, 128, __Levelmap_grid237,
		       __Tracesmap_grid237, lager_event, __Pidmap_grid237);
      _ -> ok
    end,
    {ok, Bin} = proto_102:pack(10217, srv, Mr),
    L1 = [get(P)
	  || P
		 <- [{Gx - 1, Gy - 1}, {Gx - 1, Gy}, {Gx - 1, Gy + 1},
		     {Gx, Gy + 1}, {Gx + 1, Gy + 1}, {Gx + 1, Gy},
		     {Gx + 1, Gy - 1}, {Gx, Gy - 1}, {Gx, Gy}]],
    grid_cast(L1, Bin),
    {noreply, State};
handle_info({update_looks,
	     {MapRole = #map_role{pid = RolePid, rid = Rid,
				  srv_id = SrvId, x = X, y = Y},
	      Looks, Type}},
	    State = #map_grid{width = W, height = H}) ->
    Dx = if X =< 0 -> 0;
	    X > W -> W;
	    true -> X
	 end,
    Dy = if Y =< 0 -> 0;
	    Y > H -> H;
	    true -> Y
	 end,
    Gx = util:floor(Dx / 700),
    Gy = util:floor(Dy / 450),
    Mr = MapRole#map_role{gx = Gx, gy = Gy},
    put({Gx, Gy},
	lists:keyreplace(RolePid, #map_role.pid, get({Gx, Gy}),
			 Mr)),
    {ok, Bin} = proto_102:pack(10219, srv,
			       {{Rid, SrvId}, Type, Looks}),
    L1 = [get(P)
	  || P
		 <- [{Gx - 1, Gy - 1}, {Gx - 1, Gy}, {Gx - 1, Gy + 1},
		     {Gx, Gy + 1}, {Gx + 1, Gy + 1}, {Gx + 1, Gy},
		     {Gx + 1, Gy - 1}, {Gx, Gy - 1}, {Gx, Gy}]],
    grid_cast(L1, Bin),
    {noreply, State};
handle_info({leave, RolePid, X, Y, Rid, SrvId},
	    State = #map_grid{base_id = Bid, width = W,
			      height = H}) ->
    Dx = if X =< 0 -> 0;
	    X > W -> W;
	    true -> X
	 end,
    Dy = if Y =< 0 -> 0;
	    Y > H -> H;
	    true -> Y
	 end,
    Gx = util:floor(Dx / 700),
    Gy = util:floor(Dy / 450),
    put({Gx, Gy},
	lists:keydelete(RolePid, #map_role.pid, get({Gx, Gy}))),
    {ok, LeaveMsg} = proto_102:pack(10214, srv,
				    {Bid, [{Rid, SrvId}]}),
    L1 = [get(P)
	  || P
		 <- [{Gx - 1, Gy - 1}, {Gx - 1, Gy}, {Gx - 1, Gy + 1},
		     {Gx, Gy + 1}, {Gx + 1, Gy + 1}, {Gx + 1, Gy},
		     {Gx + 1, Gy - 1}, {Gx, Gy - 1}, {Gx, Gy}]],
    grid_cast(L1, LeaveMsg),
    {noreply, State};
handle_info({repush,
	     #map_role{x = X, y = Y, pid = RolePid,
		       conn_pid = ConnPid}},
	    State = #map_grid{width = W, height = H}) ->
    Dx = if X =< 0 -> 0;
	    X > W -> W;
	    true -> X
	 end,
    Dy = if Y =< 0 -> 0;
	    Y > H -> H;
	    true -> Y
	 end,
    Gx = util:floor(Dx / 700),
    Gy = util:floor(Dy / 450),
    case lists:keyfind(RolePid, #map_role.pid,
		       get({Gx, Gy}))
	of
      false -> ignore;
      Mr ->
	  put({Gx, Gy},
	      lists:keyreplace(RolePid, #map_role.pid, get({Gx, Gy}),
			       Mr#map_role{conn_pid = ConnPid}))
    end,
    sys_conn:pack_send(ConnPid, 10222,
		       {get_in_9grid(Gx, Gy)}),
    {noreply, State};
handle_info(stop, State) -> {stop, normal, State};
handle_info(_Info,
	    State = #map_grid{base_id = BaseId}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap_grid286, _,
       {__Levelmap_grid286, __Tracesmap_grid286}}
	  when __Levelmap_grid286 band 8 /= 0 orelse
		 __Tracesmap_grid286 /= [] ->
	  lager:do_log(error,
		       [{module, map_grid}, {function, handle_info},
			{line, 286}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("地图九宫格[~w]接收到未知信息：~w", [BaseId, _Info]),
		       none, 4096, 8, __Levelmap_grid286, __Tracesmap_grid286,
		       lager_event, __Pidmap_grid286);
      _ -> ok
    end,
    {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

grid(-1, Gy) -> grid_y(-1, Gy);
grid(Gx, Gy) -> grid_y(Gx, Gy), grid(Gx - 1, Gy).

grid_y(Gx, -1) -> put({Gx, -1}, []);
grid_y(Gx, Gy) -> put({Gx, Gy}, []), grid_y(Gx, Gy - 1).

grid_cast([], _Msg) -> ok;
grid_cast([H | T], Msg) ->
    do_cast(H, Msg), grid_cast(T, Msg).

do_cast([], _Bin) -> ok;
do_cast([#map_role{conn_pid = 0} | T], Bin) ->
    do_cast(T, Bin);
do_cast([#map_role{conn_pid = ConnPid} | T], Bin) ->
    ConnPid ! {send_data, Bin}, do_cast(T, Bin).

send_role_list(ConnPid, LeaveRL, RL) ->
    case flatmap(LeaveRL, []) of
      [] -> skip;
      L1 ->
	  L2 = [{Rid, SrvId}
		|| #map_role{rid = Rid, srv_id = SrvId} <- L1],
	  {ok, B1} = proto_102:pack(10214, srv,
				    {get(map_base_id), L2}),
	  ConnPid ! {send_data, B1}
    end,
    case flatmap(RL, []) of
      [] -> skip;
      L ->
	  {ok, B} = proto_102:pack(10216, srv, {L}),
	  ConnPid ! {send_data, B}
    end.

get_in_9grid(Gx, Gy) ->
    L = [get(P)
	 || P
		<- [{Gx - 1, Gy - 1}, {Gx - 1, Gy}, {Gx - 1, Gy + 1},
		    {Gx, Gy + 1}, {Gx + 1, Gy + 1}, {Gx + 1, Gy},
		    {Gx + 1, Gy - 1}, {Gx, Gy - 1}, {Gx, Gy}]],
    flatmap(L, []).

flatmap([], List) -> List;
flatmap([H | T], List) -> flatmap(T, H ++ List).

do_move(R = #map_role{pid = Rpid, rid = Rid,
		      srv_id = SrvId, x = DestX, y = DestY, dir = Dir,
		      gx = Gx2, gy = Gy2},
	_X, _Y, Gx1, Gy1, IsPush)
    when Gx1 =:= Gx2 andalso Gy1 =:= Gy2 ->
    put({Gx2, Gy2},
	lists:keyreplace(Rpid, #map_role.pid, get({Gx2, Gy2}),
			 R)),
    case IsPush of
      true ->
	  P10215 = {Rid, SrvId, Dir, DestX, DestY},
	  {ok, MoveMsg} = proto_102:pack(10215, srv, P10215),
	  L1 = [get(P)
		|| P
		       <- [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
			   {Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1},
			   {Gx1 + 1, Gy1 + 1}, {Gx1 + 1, Gy1},
			   {Gx1 + 1, Gy1 - 1}, {Gx1, Gy1 - 1}, {Gx1, Gy1}]],
	  grid_cast(L1, MoveMsg);
      _ -> skip
    end;
do_move(R = #map_role{pid = Rpid, rid = Rid,
		      srv_id = SrvId, x = DestX, y = DestY, dir = Dir,
		      gx = Gx2, gy = Gy2},
	_X, _Y, Gx1, Gy1, IsPush)
    when Gx1 =:= Gx2 andalso Gy1 > Gy2 ->
    put({Gx1, Gy1},
	lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10214 = {get(map_base_id), [{Rid, SrvId}]},
    {ok, LeaveMsg} = proto_102:pack(10214, srv, P10214),
    L = [get(P)
	 || P
		<- [{Gx2 - 1, Gy2 - 1}, {Gx2, Gy2 - 1},
		    {Gx2 + 1, Gy2 - 1}]],
    L1 = [get(P)
	  || P
		 <- [{Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1},
		     {Gx1 + 1, Gy1 + 1}]],
    {ok, Bin} = proto_102:pack(10213, srv, R),
    case IsPush of
      true ->
	  P10215 = {Rid, SrvId, Dir, DestX, DestY},
	  {ok, MoveMsg} = proto_102:pack(10215, srv, P10215),
	  AllGrid = [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
		     {Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1}, {Gx1 + 1, Gy1 + 1},
		     {Gx1 + 1, Gy1}, {Gx1 + 1, Gy1 - 1}, {Gx1, Gy1 - 1},
		     {Gx1, Gy1}],
	  Normal = AllGrid --
		     [{Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1},
		      {Gx1 + 1, Gy1 + 1}],
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1},
				  {Gx1 + 1, Gy1 + 1}]],
	  NormalList = [get(P) || P <- Normal],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(NormalList, MoveMsg),
	  grid_cast(L, [Bin, MoveMsg]);
      _ ->
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1},
				  {Gx1 + 1, Gy1 + 1}]],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(L, Bin)
    end,
    send_role_list(R#map_role.conn_pid, L1, L);
do_move(R = #map_role{pid = Rpid, rid = Rid,
		      srv_id = SrvId, x = DestX, y = DestY, dir = Dir,
		      gx = Gx2, gy = Gy2},
	_X, _Y, Gx1, Gy1, IsPush)
    when Gx1 =:= Gx2 andalso Gy1 < Gy2 ->
    put({Gx1, Gy1},
	lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10214 = {get(map_base_id), [{Rid, SrvId}]},
    {ok, LeaveMsg} = proto_102:pack(10214, srv, P10214),
    L = [get(P)
	 || P
		<- [{Gx2 - 1, Gy2 + 1}, {Gx2, Gy2 + 1},
		    {Gx2 + 1, Gy2 + 1}]],
    L1 = [get(P)
	  || P
		 <- [{Gx1 - 1, Gy1 - 1}, {Gx1, Gy1 - 1},
		     {Gx1 + 1, Gy1 - 1}]],
    {ok, Bin} = proto_102:pack(10213, srv, R),
    case IsPush of
      true ->
	  P10215 = {Rid, SrvId, Dir, DestX, DestY},
	  {ok, MoveMsg} = proto_102:pack(10215, srv, P10215),
	  AllGrid = [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
		     {Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1}, {Gx1 + 1, Gy1 + 1},
		     {Gx1 + 1, Gy1}, {Gx1 + 1, Gy1 - 1}, {Gx1, Gy1 - 1},
		     {Gx1, Gy1}],
	  Normal = AllGrid --
		     [{Gx1 - 1, Gy1 - 1}, {Gx1, Gy1 - 1},
		      {Gx1 + 1, Gy1 - 1}],
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 - 1, Gy1 - 1}, {Gx1, Gy1 - 1},
				  {Gx1 + 1, Gy1 - 1}]],
	  NormalList = [get(P) || P <- Normal],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(NormalList, MoveMsg),
	  grid_cast(L, [Bin, MoveMsg]);
      _ ->
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 - 1, Gy1 - 1}, {Gx1, Gy1 - 1},
				  {Gx1 + 1, Gy1 - 1}]],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(L, Bin)
    end,
    send_role_list(R#map_role.conn_pid, L1, L);
do_move(R = #map_role{pid = Rpid, rid = Rid,
		      srv_id = SrvId, x = DestX, y = DestY, dir = Dir,
		      gx = Gx2, gy = Gy2},
	_X, _Y, Gx1, Gy1, IsPush)
    when Gx1 > Gx2 andalso Gy1 =:= Gy2 ->
    put({Gx1, Gy1},
	lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10214 = {get(map_base_id), [{Rid, SrvId}]},
    {ok, LeaveMsg} = proto_102:pack(10214, srv, P10214),
    L = [get(P)
	 || P
		<- [{Gx2 - 1, Gy2 - 1}, {Gx2 - 1, Gy2},
		    {Gx2 - 1, Gy2 + 1}]],
    L1 = [get(P)
	  || P
		 <- [{Gx1 + 1, Gy1 - 1}, {Gx1 + 1, Gy1},
		     {Gx1 + 1, Gy1 + 1}]],
    {ok, Bin} = proto_102:pack(10213, srv, R),
    case IsPush of
      true ->
	  P10215 = {Rid, SrvId, Dir, DestX, DestY},
	  {ok, MoveMsg} = proto_102:pack(10215, srv, P10215),
	  AllGrid = [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
		     {Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1}, {Gx1 + 1, Gy1 + 1},
		     {Gx1 + 1, Gy1}, {Gx1 + 1, Gy1 - 1}, {Gx1, Gy1 - 1},
		     {Gx1, Gy1}],
	  Normal = AllGrid --
		     [{Gx1 + 1, Gy1 - 1}, {Gx1 + 1, Gy1},
		      {Gx1 + 1, Gy1 + 1}],
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 + 1, Gy1 - 1}, {Gx1 + 1, Gy1},
				  {Gx1 + 1, Gy1 + 1}]],
	  NormalList = [get(P) || P <- Normal],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(NormalList, MoveMsg),
	  grid_cast(L, [Bin, MoveMsg]);
      _ ->
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 + 1, Gy1 - 1}, {Gx1 + 1, Gy1},
				  {Gx1 + 1, Gy1 + 1}]],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(L, Bin)
    end,
    send_role_list(R#map_role.conn_pid, L1, L);
do_move(R = #map_role{pid = Rpid, rid = Rid,
		      srv_id = SrvId, x = DestX, y = DestY, dir = Dir,
		      gx = Gx2, gy = Gy2},
	_X, _Y, Gx1, Gy1, IsPush)
    when Gx1 < Gx2 andalso Gy1 =:= Gy2 ->
    put({Gx1, Gy1},
	lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10214 = {get(map_base_id), [{Rid, SrvId}]},
    {ok, LeaveMsg} = proto_102:pack(10214, srv, P10214),
    L = [get(P)
	 || P
		<- [{Gx2 + 1, Gy2 - 1}, {Gx2 + 1, Gy2},
		    {Gx2 + 1, Gy2 + 1}]],
    L1 = [get(P)
	  || P
		 <- [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
		     {Gx1 - 1, Gy1 + 1}]],
    {ok, Bin} = proto_102:pack(10213, srv, R),
    case IsPush of
      true ->
	  P10215 = {Rid, SrvId, Dir, DestX, DestY},
	  {ok, MoveMsg} = proto_102:pack(10215, srv, P10215),
	  AllGrid = [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
		     {Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1}, {Gx1 + 1, Gy1 + 1},
		     {Gx1 + 1, Gy1}, {Gx1 + 1, Gy1 - 1}, {Gx1, Gy1 - 1},
		     {Gx1, Gy1}],
	  Normal = AllGrid --
		     [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
		      {Gx1 - 1, Gy1 + 1}],
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
				  {Gx1 - 1, Gy1 + 1}]],
	  NormalList = [get(P) || P <- Normal],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(NormalList, MoveMsg),
	  grid_cast(L, [Bin, MoveMsg]);
      _ ->
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
				  {Gx1 - 1, Gy1 + 1}]],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(L, Bin)
    end,
    send_role_list(R#map_role.conn_pid, L1, L);
do_move(R = #map_role{pid = Rpid, rid = Rid,
		      srv_id = SrvId, x = DestX, y = DestY, dir = Dir,
		      gx = Gx2, gy = Gy2},
	_X, _Y, Gx1, Gy1, IsPush)
    when Gx1 > Gx2 andalso Gy1 > Gy2 ->
    put({Gx1, Gy1},
	lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10214 = {get(map_base_id), [{Rid, SrvId}]},
    {ok, LeaveMsg} = proto_102:pack(10214, srv, P10214),
    L = [get(P)
	 || P
		<- [{Gx2 - 1, Gy2 + 1}, {Gx2 - 1, Gy2},
		    {Gx2 - 1, Gy2 - 1}, {Gx2, Gy2 - 1},
		    {Gx2 + 1, Gy2 - 1}]],
    L1 = [get(P)
	  || P
		 <- [{Gx1 + 1, Gy1 - 1}, {Gx1 + 1, Gy1},
		     {Gx1 + 1, Gy1 + 1}, {Gx1, Gy1 + 1},
		     {Gx1 - 1, Gy1 + 1}]],
    {ok, Bin} = proto_102:pack(10213, srv, R),
    case IsPush of
      true ->
	  P10215 = {Rid, SrvId, Dir, DestX, DestY},
	  {ok, MoveMsg} = proto_102:pack(10215, srv, P10215),
	  AllGrid = [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
		     {Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1}, {Gx1 + 1, Gy1 + 1},
		     {Gx1 + 1, Gy1}, {Gx1 + 1, Gy1 - 1}, {Gx1, Gy1 - 1},
		     {Gx1, Gy1}],
	  Normal = AllGrid --
		     [{Gx1 + 1, Gy1 - 1}, {Gx1 + 1, Gy1}, {Gx1 + 1, Gy1 + 1},
		      {Gx1, Gy1 + 1}, {Gx1 - 1, Gy1 + 1}],
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 + 1, Gy1 - 1}, {Gx1 + 1, Gy1},
				  {Gx1 + 1, Gy1 + 1}, {Gx1, Gy1 + 1},
				  {Gx1 - 1, Gy1 + 1}]],
	  NormalList = [get(P) || P <- Normal],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(NormalList, MoveMsg),
	  grid_cast(L, [Bin, MoveMsg]);
      _ ->
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 + 1, Gy1 - 1}, {Gx1 + 1, Gy1},
				  {Gx1 + 1, Gy1 + 1}, {Gx1, Gy1 + 1},
				  {Gx1 - 1, Gy1 + 1}]],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(L, Bin)
    end,
    send_role_list(R#map_role.conn_pid, L1, L);
do_move(R = #map_role{pid = Rpid, rid = Rid,
		      srv_id = SrvId, x = DestX, y = DestY, dir = Dir,
		      gx = Gx2, gy = Gy2},
	_X, _Y, Gx1, Gy1, IsPush)
    when Gx1 > Gx2 andalso Gy1 < Gy2 ->
    put({Gx1, Gy1},
	lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10214 = {get(map_base_id), [{Rid, SrvId}]},
    {ok, LeaveMsg} = proto_102:pack(10214, srv, P10214),
    L = [get(P)
	 || P
		<- [{Gx2 - 1, Gy2 - 1}, {Gx2 - 1, Gy2},
		    {Gx2 - 1, Gy2 + 1}, {Gx2, Gy2 + 1},
		    {Gx2 + 1, Gy2 + 1}]],
    L1 = [get(P)
	  || P
		 <- [{Gx1 - 1, Gy1 - 1}, {Gx1, Gy1 - 1},
		     {Gx1 + 1, Gy1 - 1}, {Gx1 + 1, Gy1},
		     {Gx1 + 1, Gy1 + 1}]],
    {ok, Bin} = proto_102:pack(10213, srv, R),
    case IsPush of
      true ->
	  P10215 = {Rid, SrvId, Dir, DestX, DestY},
	  {ok, MoveMsg} = proto_102:pack(10215, srv, P10215),
	  AllGrid = [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
		     {Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1}, {Gx1 + 1, Gy1 + 1},
		     {Gx1 + 1, Gy1}, {Gx1 + 1, Gy1 - 1}, {Gx1, Gy1 - 1},
		     {Gx1, Gy1}],
	  Normal = AllGrid --
		     [{Gx1 - 1, Gy1 - 1}, {Gx1, Gy1 - 1}, {Gx1 + 1, Gy1 - 1},
		      {Gx1 + 1, Gy1}, {Gx1 + 1, Gy1 + 1}],
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 - 1, Gy1 - 1}, {Gx1, Gy1 - 1},
				  {Gx1 + 1, Gy1 - 1}, {Gx1 + 1, Gy1},
				  {Gx1 + 1, Gy1 + 1}]],
	  NormalList = [get(P) || P <- Normal],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(NormalList, MoveMsg),
	  grid_cast(L, [Bin, MoveMsg]);
      _ ->
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 - 1, Gy1 - 1}, {Gx1, Gy1 - 1},
				  {Gx1 + 1, Gy1 - 1}, {Gx1 + 1, Gy1},
				  {Gx1 + 1, Gy1 + 1}]],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(L, Bin)
    end,
    send_role_list(R#map_role.conn_pid, L1, L);
do_move(R = #map_role{pid = Rpid, rid = Rid,
		      srv_id = SrvId, x = DestX, y = DestY, dir = Dir,
		      gx = Gx2, gy = Gy2},
	_X, _Y, Gx1, Gy1, IsPush)
    when Gx1 < Gx2 andalso Gy1 > Gy2 ->
    put({Gx1, Gy1},
	lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10214 = {get(map_base_id), [{Rid, SrvId}]},
    {ok, LeaveMsg} = proto_102:pack(10214, srv, P10214),
    L = [get(P)
	 || P
		<- [{Gx2 - 1, Gy2 - 1}, {Gx2, Gy2 - 1},
		    {Gx2 + 1, Gy2 - 1}, {Gx2 + 1, Gy2},
		    {Gx2 + 1, Gy2 + 1}]],
    L1 = [get(P)
	  || P
		 <- [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
		     {Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1},
		     {Gx1 + 1, Gy1 + 1}]],
    {ok, Bin} = proto_102:pack(10213, srv, R),
    case IsPush of
      true ->
	  P10215 = {Rid, SrvId, Dir, DestX, DestY},
	  {ok, MoveMsg} = proto_102:pack(10215, srv, P10215),
	  AllGrid = [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
		     {Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1}, {Gx1 + 1, Gy1 + 1},
		     {Gx1 + 1, Gy1}, {Gx1 + 1, Gy1 - 1}, {Gx1, Gy1 - 1},
		     {Gx1, Gy1}],
	  Normal = AllGrid --
		     [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1}, {Gx1 - 1, Gy1 + 1},
		      {Gx1, Gy1 + 1}, {Gx1 + 1, Gy1 + 1}],
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
				  {Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1},
				  {Gx1 + 1, Gy1 + 1}]],
	  NormalList = [get(P) || P <- Normal],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(NormalList, MoveMsg),
	  grid_cast(L, [Bin, MoveMsg]);
      _ ->
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
				  {Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1},
				  {Gx1 + 1, Gy1 + 1}]],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(L, Bin)
    end,
    send_role_list(R#map_role.conn_pid, L1, L);
do_move(R = #map_role{pid = Rpid, rid = Rid,
		      srv_id = SrvId, x = DestX, y = DestY, dir = Dir,
		      gx = Gx2, gy = Gy2},
	_X, _Y, Gx1, Gy1, IsPush)
    when Gx1 < Gx2 andalso Gy1 < Gy2 ->
    put({Gx1, Gy1},
	lists:keydelete(Rpid, #map_role.pid, get({Gx1, Gy1}))),
    put({Gx2, Gy2}, [R | get({Gx2, Gy2})]),
    P10214 = {get(map_base_id), [{Rid, SrvId}]},
    {ok, LeaveMsg} = proto_102:pack(10214, srv, P10214),
    L = [get(P)
	 || P
		<- [{Gx2 + 1, Gy2 - 1}, {Gx2 + 1, Gy2},
		    {Gx2 + 1, Gy2 + 1}, {Gx2, Gy2 + 1},
		    {Gx2 - 1, Gy2 + 1}]],
    L1 = [get(P)
	  || P
		 <- [{Gx1 - 1, Gy1 + 1}, {Gx1 - 1, Gy1},
		     {Gx1 - 1, Gy1 - 1}, {Gx1, Gy1 - 1},
		     {Gx1 + 1, Gy1 - 1}]],
    {ok, Bin} = proto_102:pack(10213, srv, R),
    case IsPush of
      true ->
	  P10215 = {Rid, SrvId, Dir, DestX, DestY},
	  {ok, MoveMsg} = proto_102:pack(10215, srv, P10215),
	  AllGrid = [{Gx1 - 1, Gy1 - 1}, {Gx1 - 1, Gy1},
		     {Gx1 - 1, Gy1 + 1}, {Gx1, Gy1 + 1}, {Gx1 + 1, Gy1 + 1},
		     {Gx1 + 1, Gy1}, {Gx1 + 1, Gy1 - 1}, {Gx1, Gy1 - 1},
		     {Gx1, Gy1}],
	  Normal = AllGrid --
		     [{Gx1 - 1, Gy1 + 1}, {Gx1 - 1, Gy1}, {Gx1 - 1, Gy1 - 1},
		      {Gx1, Gy1 - 1}, {Gx1 + 1, Gy1 - 1}],
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 - 1, Gy1 + 1}, {Gx1 - 1, Gy1},
				  {Gx1 - 1, Gy1 - 1}, {Gx1, Gy1 - 1},
				  {Gx1 + 1, Gy1 - 1}]],
	  NormalList = [get(P) || P <- Normal],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(NormalList, MoveMsg),
	  grid_cast(L, [Bin, MoveMsg]);
      _ ->
	  LeaveList = [get(P)
		       || P
			      <- [{Gx1 - 1, Gy1 + 1}, {Gx1 - 1, Gy1},
				  {Gx1 - 1, Gy1 - 1}, {Gx1, Gy1 - 1},
				  {Gx1 + 1, Gy1 - 1}]],
	  grid_cast(LeaveList, LeaveMsg),
	  grid_cast(L, Bin)
    end,
    send_role_list(R#map_role.conn_pid, L1, L);
do_move(_R, _X, _Y, _Gx1, _Gy1, _IsPush) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap_grid499, _,
       {__Levelmap_grid499, __Tracesmap_grid499}}
	  when __Levelmap_grid499 band 128 /= 0 orelse
		 __Tracesmap_grid499 /= [] ->
	  lager:do_log(debug,
		       [{module, map_grid}, {function, do_move}, {line, 499},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "角色移动时的数据异常", none, 4096, 128, __Levelmap_grid499,
		       __Tracesmap_grid499, lager_event, __Pidmap_grid499);
      _ -> ok
    end,
    ignore.


