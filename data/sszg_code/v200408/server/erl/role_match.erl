-file("src/mod/role/role_match.erl", 1).

-module(role_match).

-lager_records([{role_match,
		 [id, name, lev, power, max_power, arena_power,
		  arena_max_power]},
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
		{state, []}]).

-behaviour(gen_server).

-export([search/1, update/1]).

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

-file("src/mod/role/role_match.erl", 16).

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

-file("src/mod/role/role_match.erl", 17).

-file("inc/role_match.hrl", 1).

-record(role_match,
	{id = {0, <<>>}, name = <<>>, lev = 0, power = 0,
	 max_power = 0, arena_power = 0, arena_max_power = 0}).

-file("src/mod/role/role_match.erl", 18).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/role/role_match.erl", 19).

-spec search(#{}) -> {ok, #{}, [#role_match{}]} | false.

search(Opt = #{conds :=
		   [Cond = #{type := name, name := Name, min_lev := MinLev}
		    | T]}) ->
    Num = maps:get(num, Opt, 1),
    ExcludeList = maps:get(exclude, Opt, []),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_match25, _,
       {__Levelrole_match25, __Tracesrole_match25}}
	  when __Levelrole_match25 band 128 /= 0 orelse
		 __Tracesrole_match25 /= [] ->
	  lager:do_log(debug,
		       [{module, role_match}, {function, search}, {line, 25},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("==名字=~w", [Name]), none, 4096, 128,
		       __Levelrole_match25, __Tracesrole_match25, lager_event,
		       __Pidrole_match25);
      _ -> ok
    end,
    Spec = [{{role_match, '_', '$1', '$2', '_', '_', '_',
	      '_'},
	     [{'==', '$1', {const, Name}}], ['$_']}],
    case ets:select(role_match, Spec, Num) of
      {List, _Continue} ->
	  case [I
		|| I <- List,
		   not lists:member(I#role_match.id, ExcludeList)]
	      of
	    [] -> search(Opt#{conds := T});
	    L -> {ok, Cond, L}
	  end;
      _ -> search(Opt#{conds := T})
    end;
search(Opt = #{conds :=
		   [Cond = #{type := power, min_lev := MinLev,
			     max_lev := MaxLev, min_power := MinPower,
			     max_power := MaxPower}
		    | T]}) ->
    Num = maps:get(num, Opt, 1),
    ExcludeList = maps:get(exclude, Opt, []),
    Spec = [{{role_match, '_', '_', '$2', '$1', '_', '_',
	      '_'},
	     [{'andalso', {'>=', '$1', {const, MinPower}},
	       {'andalso', {'=<', '$1', {const, MaxPower}},
		{'andalso', {'=<', '$2', {const, MaxLev}},
		 {'>=', '$2', {const, MinLev}}}}}],
	     ['$_']}],
    case ets:select(role_match, Spec, Num) of
      {List, _Continue} ->
	  case [I
		|| I <- List,
		   not lists:member(I#role_match.id, ExcludeList)]
	      of
	    [] -> search(Opt#{conds := T});
	    L -> {ok, Cond, L}
	  end;
      _ -> search(Opt#{conds := T})
    end;
search(Opt = #{conds :=
		   [Cond = #{type := arena_power, min_lev := MinLev,
			     max_lev := MaxLev, min_power := MinPower,
			     max_power := MaxPower}
		    | T]}) ->
    Num = maps:get(num, Opt, 1),
    ExcludeList = maps:get(exclude, Opt, []),
    Spec = [{{role_match, '_', '_', '$2', '_', '_', '$1',
	      '_'},
	     [{'andalso', {'>=', '$1', {const, MinPower}},
	       {'andalso', {'=<', '$1', {const, MaxPower}},
		{'andalso', {'=<', '$2', {const, MaxLev}},
		 {'>=', '$2', {const, MinLev}}}}}],
	     ['$_']}],
    case ets:select(role_match, Spec, Num) of
      {List, _Continue} ->
	  case [I
		|| I <- List,
		   not lists:member(I#role_match.id, ExcludeList)]
	      of
	    [] -> search(Opt#{conds := T});
	    L -> {ok, Cond, L}
	  end;
      _ -> search(Opt#{conds := T})
    end;
search(_) -> false.

-spec update(#role{}) -> ok.

update(#role{lev = Lev, power = Power,
	     max_power = MaxPower, arena_power = ArenaPower,
	     arena_max_power = ArenaMaxPower, name = Name,
	     id = RoleId})
    when Lev >= 15 andalso MaxPower >= 1000 ->
    R = #role_match{id = RoleId, name = Name, lev = Lev,
		    power = Power, max_power = MaxPower,
		    arena_power = ArenaPower,
		    arena_max_power = ArenaMaxPower},
    ets:insert(role_match, R);
update(_Role) -> ok.

info(Info) -> role_match ! Info.

cast(Info) -> gen_server:cast(role_match, Info).

call(Info) ->
    case catch gen_server:call(role_match, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrole_match92, _,
	     {__Levelrole_match92, __Tracesrole_match92}}
		when __Levelrole_match92 band 8 /= 0 orelse
		       __Tracesrole_match92 /= [] ->
		lager:do_log(error,
			     [{module, role_match}, {function, call},
			      {line, 92}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [role_match, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelrole_match92,
			     __Tracesrole_match92, lager_event,
			     __Pidrole_match92);
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
    gen_server:start_link({local, role_match}, role_match,
			  [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_match98, _,
       {__Levelrole_match98, __Tracesrole_match98}}
	  when __Levelrole_match98 band 64 /= 0 orelse
		 __Tracesrole_match98 /= [] ->
	  lager:do_log(info,
		       [{module, role_match}, {function, init}, {line, 98},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [role_match]), none, 4096,
		       64, __Levelrole_match98, __Tracesrole_match98,
		       lager_event, __Pidrole_match98);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    ets:new(role_match,
	    [set, named_table, public, {keypos, #role_match.id}]),
    load(),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrole_match103, _,
       {__Levelrole_match103, __Tracesrole_match103}}
	  when __Levelrole_match103 band 64 /= 0 orelse
		 __Tracesrole_match103 /= [] ->
	  lager:do_log(info,
		       [{module, role_match}, {function, init}, {line, 103},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [role_match]), none, 4096,
		       64, __Levelrole_match103, __Tracesrole_match103,
		       lager_event, __Pidrole_match103);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load() ->
    Now = date:unixtime(),
    Time = Now - 86400 * 90,
    case db:get_all("select rid, srv_id, name, lev, power, "
		    "max_power, arena_power, arena_max_power "
		    "from role where login_time > ? and lev "
		    ">= ? and power > ? order by power desc "
		    "limit 10000",
		    [Time, 15, 1000], 60000)
	of
      {ok, L} -> do_load(L);
      _ -> skip
    end.

do_load([]) -> ok;
do_load([[Rid, SrvId, Name, Lev, Power, MaxPower,
	  ArenaPower, ArenaMaxPower]
	 | T]) ->
    R = #role_match{id = {Rid, SrvId}, name = Name,
		    lev = Lev, power = Power, max_power = MaxPower,
		    arena_power = ArenaPower,
		    arena_max_power = ArenaMaxPower},
    ets:insert(role_match, R),
    do_load(T).


