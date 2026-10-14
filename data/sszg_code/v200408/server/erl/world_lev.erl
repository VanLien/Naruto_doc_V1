-file("src/mod/misc/world_lev.erl", 1).

-module(world_lev).

-lager_records([{map_role,
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
		{state, [world_lev, len, min_lev, list]}]).

-behaviour(gen_server).

-export([get_world_lev/0, level_up/2, calc_exp/2,
	 recalc_list_exp/2, quick_info/1, calc_world_lev/1,
	 log/0]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state,
	{world_lev = 0, len = 0, min_lev = 0, list = []}).

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

-file("src/mod/misc/world_lev.erl", 20).

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

-file("src/mod/misc/world_lev.erl", 21).

-file("inc/game_assets.hrl", 1).

-file("src/mod/misc/world_lev.erl", 22).

-spec get_world_lev() -> pos_integer().

get_world_lev() -> sys_env:get(world_lev, 0).

-spec level_up(#role{}, #role{}) -> ok | {ok, #role{}}.

level_up(_OldRole, #role{id = RoleId, lev = Lev}) ->
    info({sync_role_lev, RoleId, Lev}), ok.

-spec calc_exp(#role{}, pos_integer()) -> pos_integer().

calc_exp(#role{lev = _Lev}, Exp) -> Exp.

-spec recalc_list_exp(#role{}, list()) -> list().

recalc_list_exp(#role{lev = _Lev}, List) -> List.

-spec quick_info(#role{}) -> tuple().

quick_info(#role{lev = _Lev}) -> {0, 0}.

log() -> info(log).

info(Info) -> world_lev ! Info.

cast(Info) -> gen_server:cast(world_lev, Info).

call(Info) ->
    case catch gen_server:call(world_lev, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidworld_lev97, _,
	     {__Levelworld_lev97, __Tracesworld_lev97}}
		when __Levelworld_lev97 band 8 /= 0 orelse
		       __Tracesworld_lev97 /= [] ->
		lager:do_log(error,
			     [{module, world_lev}, {function, call}, {line, 97},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [world_lev, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelworld_lev97,
			     __Tracesworld_lev97, lager_event,
			     __Pidworld_lev97);
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
    gen_server:start_link({local, world_lev}, world_lev, [],
			  []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidworld_lev103, _,
       {__Levelworld_lev103, __Tracesworld_lev103}}
	  when __Levelworld_lev103 band 64 /= 0 orelse
		 __Tracesworld_lev103 /= [] ->
	  lager:do_log(info,
		       [{module, world_lev}, {function, init}, {line, 103},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [world_lev]), none, 4096,
		       64, __Levelworld_lev103, __Tracesworld_lev103,
		       lager_event, __Pidworld_lev103);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    util:set_timer(log,
		   date:next_diff(23, 0, 0) + util:rand(1, 1800), log),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidworld_lev106, _,
       {__Levelworld_lev106, __Tracesworld_lev106}}
	  when __Levelworld_lev106 band 64 /= 0 orelse
		 __Tracesworld_lev106 /= [] ->
	  lager:do_log(info,
		       [{module, world_lev}, {function, init}, {line, 106},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [world_lev]), none, 4096, 64,
		       __Levelworld_lev106, __Tracesworld_lev106, lager_event,
		       __Pidworld_lev106);
      _ -> ok
    end,
    {ok, load()}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(log, State) ->
    WorldLev = get_world_lev(),
    OpenTime = sys_env:get(open_timestamp),
    Platform = case is_binary(sys_env:get(platform)) of
		 false -> list_to_binary(sys_env:get(platform));
		 true -> sys_env:get(platform)
	       end,
    ZoneId = sys_env:get(zone_id),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidworld_lev120, _,
       {__Levelworld_lev120, __Tracesworld_lev120}}
	  when __Levelworld_lev120 band 64 /= 0 orelse
		 __Tracesworld_lev120 /= [] ->
	  lager:do_log(info,
		       [{module, world_lev}, {function, handle_info},
			{line, 120}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("log world_lev:~w, opentime:~w",
				     [WorldLev, OpenTime]),
		       none, 4096, 64, __Levelworld_lev120,
		       __Tracesworld_lev120, lager_event, __Pidworld_lev120);
      _ -> ok
    end,
    log_http:send("service/level",
		  [{open_time, OpenTime}, {lv, WorldLev},
		   {platform_name, Platform}, {gameserver_no, ZoneId}]),
    util:set_timer(log,
		   date:next_diff(23, 0, 0) + util:rand(1, 1800), log),
    {noreply, State};
handle_info(reload, _State) -> {noreply, load()};
handle_info({sync_role_lev, RoleId, Lev},
	    State = #state{world_lev = WorldLev, len = Len,
			   min_lev = MinLev, list = List}) ->
    case Lev > MinLev orelse
	   Len < world_lev_data:get_const(worldlev_number)
	of
      true ->
	  {_NewWorldLev, NewL, NewMinLev, NewLen} =
	      calc_world_lev_sort(List, RoleId, Lev, Lev, 0,
				  world_lev_data:get_const(worldlev_number), 0,
				  []),
	  NewWorldLev = calc_world_lev(NewL),
	  case NewWorldLev =:= WorldLev of
	    true -> pass;
	    _ ->
		sys_env:set(world_lev, NewWorldLev),
		cluster_dynamic_group:sync_world_lev(),
		arena_cluster_mgr:info({change_world_lev, NewWorldLev}),
		holiday_personal_gift_mgr:info(sync_score_data),
		role_group:pack_send(world, 10905, {NewWorldLev}),
		case NewWorldLev ==
		       drama_data:get_const(heaven_world_lev)
		    of
		  true ->
		      sys_env:save(holy_eqm_check, true),
		      role_group:apply(world,
				       {partner_holy_eqm, fire, [world_lev]});
		  _ -> skip
		end
	  end,
	  {noreply,
	   State#state{world_lev = NewWorldLev, len = NewLen,
		       min_lev = NewMinLev, list = NewL}};
      _ -> {noreply, State}
    end;
handle_info(recalc, State = #state{list = List}) ->
    NewWorldLev = calc_world_lev(List),
    sys_env:set(world_lev, NewWorldLev),
    {noreply, State#state{world_lev = NewWorldLev}};
handle_info(gm_set_lev, State) ->
    NewWorldLev = drama_data:get_const(heaven_world_lev),
    sys_env:set(world_lev, NewWorldLev),
    cluster_dynamic_group:sync_world_lev(),
    arena_cluster_mgr:info({change_world_lev, NewWorldLev}),
    holiday_personal_gift_mgr:info(sync_score_data),
    role_group:pack_send(world, 10905, {NewWorldLev}),
    sys_env:save(holy_eqm_check, true),
    role_group:apply(world,
		     {partner_holy_eqm, fire, [world_lev]}),
    {noreply, State#state{world_lev = NewWorldLev}};
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
      {__Pidworld_lev177, _,
       {__Levelworld_lev177, __Tracesworld_lev177}}
	  when __Levelworld_lev177 band 64 /= 0 orelse
		 __Tracesworld_lev177 /= [] ->
	  lager:do_log(info,
		       [{module, world_lev}, {function, terminate},
			{line, 177}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelworld_lev177,
		       __Tracesworld_lev177, lager_event, __Pidworld_lev177);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load() ->
    {ok, L} =
	db:get_all("select rid, srv_id, lev from role order "
		   "by lev desc limit ?",
		   [world_lev_data:get_const(worldlev_number)], 60000),
    L1 = [{{Rid, SrvId}, Lev} || [Rid, SrvId, Lev] <- L],
    WorldLev = calc_world_lev(L1),
    sys_env:set(world_lev, WorldLev),
    #state{world_lev = WorldLev, list = L1,
	   len = length(L1),
	   min_lev =
	       lists:min([999 | [element(2, I) || I <- L1]])}.

calc_world_lev_sort([], null, _Lev, MinLev, Len,
		    _MaxLen, Sum, L) ->
    {Sum div Len, lists:reverse(L), MinLev, Len};
calc_world_lev_sort(_T, _RoleId, _Lev, MinLev, Len, Len,
		    Sum, L) ->
    {Sum div Len, lists:reverse(L), MinLev, Len};
calc_world_lev_sort([], RoleId, Lev, MinLev, Len,
		    MaxLen, Sum, L) ->
    calc_world_lev_sort([], null, Lev, min(Lev, MinLev),
			Len + 1, MaxLen, Sum + Lev, [{RoleId, Lev} | L]);
calc_world_lev_sort([{RoleId, Lev1} | T], null, Lev,
		    MinLev, Len, MaxLen, Sum, L) ->
    calc_world_lev_sort(T, null, Lev, min(Lev1, MinLev),
			Len + 1, MaxLen, Sum + Lev1, [{RoleId, Lev1} | L]);
calc_world_lev_sort([{RoleId, _} | T], RoleId, Lev,
		    MinLev, Len, MaxLen, Sum, L) ->
    calc_world_lev_sort(T, null, Lev, min(Lev, MinLev),
			Len + 1, MaxLen, Sum + Lev, [{RoleId, Lev} | L]);
calc_world_lev_sort([{RoleId1, Lev1} | T], RoleId, Lev,
		    MinLev, Len, MaxLen, Sum, L)
    when Lev1 >= Lev ->
    calc_world_lev_sort(T, RoleId, Lev, min(Lev1, MinLev),
			Len + 1, MaxLen, Sum + Lev1, [{RoleId1, Lev1} | L]);
calc_world_lev_sort(T, RoleId, Lev, MinLev, Len, MaxLen,
		    Sum, L) ->
    T1 = lists:keydelete(RoleId, 1, T),
    calc_world_lev_sort(T1, null, Lev, min(Lev, MinLev),
			Len + 1, MaxLen, Sum + Lev, [{RoleId, Lev} | L]).

calc_world_lev([]) -> 0;
calc_world_lev(L) ->
    LevL = [Lev || {_, Lev} <- L],
    do_calc_world_lev(world_lev_data:list_rank(), LevL, 0,
		      0).

do_calc_world_lev([], _, _N, Lev) -> util:floor(Lev);
do_calc_world_lev(_, [], _N, Lev) -> util:floor(Lev);
do_calc_world_lev([{_, End, V} | T], L, N, Lev) ->
    {L1, L2} = list_util:split(max(0, End - N), L),
    NewLev = Lev + lists:sum(L1) / length(L1) * (V / 1000),
    do_calc_world_lev(T, L2, End - N, NewLev).


