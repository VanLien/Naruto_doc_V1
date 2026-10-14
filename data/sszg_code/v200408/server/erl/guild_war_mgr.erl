-file("src/mod/guild_war2/guild_war_mgr.erl", 1).

-module(guild_war_mgr).

-lager_records([{cluster_dynamic_local_group,
		 [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
		{activity, [id, status, name, data, ext_args]},
		{guild_war_role_log,
		 [id, name, lev, face, power, formation_type,
		  formation_lev, time, repaly_id, result, hp, defense,
		  face_update_time, face_file]},
		{guild_war_log,
		 [flag1, flag2, time, id1, name1, id2, name2, gid, gname,
		  int_args, str_args]},
		{guild_war_partner,
		 [id, bid, lev, star, break_lev, base_attr, all_attr,
		  skills, break_skills, set_skills, ext_data]},
		{guild_war_role,
		 [pos, id, name, lev, face, power, formation_type,
		  formation_lev, war_score, star, defense, hp, hp_max,
		  status, def_count, def_log, count, repaly_info,
		  relic_def_count, hallows_id, hallows_lev,
		  hallows_skill_lev, hallows_look_id, hallows_lucky,
		  hallows_seal, hallows_all_look_ids, extra, look_id,
		  face_update_time, face_file, break_groups]},
		{guild_war_sign,
		 [gid, group_id, srv_name, gname, def_num, defense,
		  last_matchs, avg_power, star_time, buff_lev, rank, hp,
		  hp_max, war_log, lev]},
		{state, [state_name, ts, time_out, match_info, week]}]).

-behaviour(gen_server).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([get_state/0, get_state_info/0,
	 get_match_info/0, get_war_result/1]).

-record(state,
	{state_name = idle, ts = 0, time_out = 0,
	 match_info = [], week = 0}).

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

-file("src/mod/guild_war2/guild_war_mgr.erl", 18).

-file("inc/guild_war.hrl", 1).

-record(guild_war_sign,
	{gid = {0, <<>>}, group_id = 0, srv_name = <<>>,
	 gname = <<>>, def_num = 0, defense = [],
	 last_matchs = {0, <<>>}, avg_power = 0, star_time = 0,
	 buff_lev = 0, rank = 0, hp = 0, hp_max = 0,
	 war_log = [], lev = 0}).

-record(guild_war_role,
	{pos = 0, id = {0, <<>>}, name = <<>>, lev = 0,
	 face = 0, power = 0, formation_type = 0,
	 formation_lev = 0, war_score = 0, star = 0,
	 defense = [], hp = 3, hp_max = 3, status = 0,
	 def_count = 0, def_log = [], count = 0,
	 repaly_info = [], relic_def_count = 0, hallows_id = 0,
	 hallows_lev = 0, hallows_skill_lev = 0, hallows_look_id,
	 hallows_lucky, hallows_seal, hallows_all_look_ids = [],
	 extra = [], look_id = 0, face_update_time = 0,
	 face_file = <<>>, break_groups = []}).

-record(guild_war_partner,
	{id = 0, bid = 0, lev = 0, star = 0, break_lev = 0,
	 base_attr = [], all_attr = [], skills = [],
	 break_skills = [], set_skills = [], ext_data = []}).

-record(guild_war_log,
	{flag1 = 0, flag2 = 0, time = 0, id1 = {0, <<>>},
	 name1 = <<>>, id2 = {0, <<>>}, name2 = <<>>,
	 gid = {0, <<>>}, gname = <<>>, int_args = [],
	 str_args = []}).

-record(guild_war_role_log,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 power = 0, formation_type = 0, formation_lev = 0,
	 time = 0, repaly_id = 0, result = 0, hp = 0,
	 defense = [], face_update_time = 0, face_file = <<>>}).

-file("src/mod/guild_war2/guild_war_mgr.erl", 19).

-file("inc/activity.hrl", 1).

-record(activity,
	{id = 0, status = 0, name = <<>>, data = [],
	 ext_args = []}).

-file("src/mod/guild_war2/guild_war_mgr.erl", 20).

-file("inc/cluster_dynamic_group.hrl", 1).

-record(cluster_dynamic_group,
	{id = {1, <<>>}, min_world_lev = 0, group_lev = 0,
	 mode = 1, list = [], srv_num = 0, time = 0}).

-record(cluster_dynamic_srv,
	{id = {1, <<>>}, name = <<>>, main_srv = <<>>,
	 list = [], mode = 1, group_lev = 0, init_world_lev = 0,
	 world_lev = 0, open_time = 0, time = 0}).

-record(cluster_dynamic_local_group,
	{type = 0, main, list = []}).

-file("src/mod/guild_war2/guild_war_mgr.erl", 21).

-spec get_state() -> atom().

get_state() ->
    case sys_env:get(guild_war_state) of
      {State, _, _, _, _} -> State;
      _ -> idle
    end.

-spec get_state_info() -> atom().

get_state_info() ->
    case sys_env:get(guild_war_state) of
      {State, Ts, TimeOut, MatchInfo, _} ->
	  {State, Ts, TimeOut, MatchInfo};
      _ -> {idle, 0, 0, []}
    end.

-spec get_match_info() -> list().

get_match_info() ->
    case sys_env:get(guild_war_state) of
      {_, _, _, L, _} -> L;
      _ -> []
    end.

get_war_result(Gid) ->
    L = get_match_info(),
    case lists:keyfind(Gid, 1, L) of
      {_, _, _, _, _, _, _, _, 0, _} -> 0;
      {_, _, _, _, _, _, _, _, 1, Gid} -> 2;
      {_, _, _, _, _, _, _, _, 1, {0, <<>>}} -> 3;
      {_, _, _, _, _, _, _, _, 1, _} -> 1;
      _ ->
	  case lists:keyfind(Gid, 5, L) of
	    {_, _, _, _, _, _, _, _, 0, _} -> 0;
	    {_, _, _, _, _, _, _, _, 1, Gid} -> 2;
	    {_, _, _, _, _, _, _, _, 1, {0, <<>>}} -> 3;
	    {_, _, _, _, _, _, _, _, 1, _} -> 1;
	    _ -> 0
	  end
    end.

info(Info) -> guild_war_mgr ! Info.

cast(Info) -> gen_server:cast(guild_war_mgr, Info).

call(Info) ->
    case catch gen_server:call(guild_war_mgr, Info, 10000)
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
	    {__Pidguild_war_mgr72, _,
	     {__Levelguild_war_mgr72, __Tracesguild_war_mgr72}}
		when __Levelguild_war_mgr72 band 8 /= 0 orelse
		       __Tracesguild_war_mgr72 /= [] ->
		lager:do_log(error,
			     [{module, guild_war_mgr}, {function, call},
			      {line, 72}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [guild_war_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelguild_war_mgr72,
			     __Tracesguild_war_mgr72, lager_event,
			     __Pidguild_war_mgr72);
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
    gen_server:start_link({local, guild_war_mgr},
			  guild_war_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_war_mgr78, _,
       {__Levelguild_war_mgr78, __Tracesguild_war_mgr78}}
	  when __Levelguild_war_mgr78 band 64 /= 0 orelse
		 __Tracesguild_war_mgr78 /= [] ->
	  lager:do_log(info,
		       [{module, guild_war_mgr}, {function, init}, {line, 78},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [guild_war_mgr]), none,
		       4096, 64, __Levelguild_war_mgr78,
		       __Tracesguild_war_mgr78, lager_event,
		       __Pidguild_war_mgr78);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(guild_war_sign,
		   [{file, "./dets/guild_war_sign.dets"},
		    {keypos, #guild_war_sign.gid}, {type, set}]),
    ets:new(guild_war_sign,
	    [set, named_table, public,
	     {keypos, #guild_war_sign.gid}]),
    Fun = fun (G) ->
		  NewG = #guild_war_sign{defense = Defs} =
			     guild_war_ver:do_ver(G),
		  NewDefs = [GRole#guild_war_role{status = 0}
			     || GRole <- Defs],
		  guild_war_db:update_ets(guild_war_sign,
					  NewG#guild_war_sign{defense =
								  NewDefs},
					  ets),
		  continue
	  end,
    dets:traverse(guild_war_sign, Fun),
    dets:open_file(guild_war_guild_match,
		   [{file, "./dets/guild_war_guild_match.dets"},
		    {keypos, 1}, {type, set}]),
    ets:new(guild_war_guild_match,
	    [set, named_table, public, {keypos, 1}]),
    guild_war_db:load(guild_war_guild_match),
    ets:new(guild_war_zone,
	    [set, named_table, public, {keypos, 1}]),
    {StatName, Ts, TimeOut, MatchInfo, Week} =
	sys_env:get(guild_war_state, {idle, 0, 0, [], 0}),
    State = #state{state_name = StatName, ts = Ts,
		   time_out = TimeOut, match_info = MatchInfo,
		   week = Week},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_war_mgr103, _,
       {__Levelguild_war_mgr103, __Tracesguild_war_mgr103}}
	  when __Levelguild_war_mgr103 band 64 /= 0 orelse
		 __Tracesguild_war_mgr103 /= [] ->
	  lager:do_log(info,
		       [{module, guild_war_mgr}, {function, init}, {line, 103},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [guild_war_mgr]), none, 4096,
		       64, __Levelguild_war_mgr103, __Tracesguild_war_mgr103,
		       lager_event, __Pidguild_war_mgr103);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

save_state(#state{state_name = StateName, ts = Ts,
		  time_out = TimeOut, match_info = L, week = Week}) ->
    sys_env:save(guild_war_state,
		 {StateName, Ts, TimeOut, L, Week}).

handle_info(sync_data, State) ->
    cluster_lib:cast(center, c_guild_war_mgr, info,
		     [{sync_data, self()}]),
    {noreply, State};
handle_info({role_ready, _RolePid},
	    State = #state{ts = Ts, time_out = TimeOut,
			   state_name = match_over}) ->
    activity_global:set_and_push(22, 1,
				 [(Ts + TimeOut) div 1000]),
    {noreply, State};
handle_info({role_ready, _RolePid},
	    State = #state{ts = Ts, time_out = TimeOut,
			   state_name = open}) ->
    activity_global:set_and_push(22, 2,
				 [(Ts + TimeOut) div 1000]),
    {noreply, State};
handle_info({sync_status_to_zone, StateName = idle, Ts,
	     TimeOut},
	    State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_war_mgr131, _,
       {__Levelguild_war_mgr131, __Tracesguild_war_mgr131}}
	  when __Levelguild_war_mgr131 band 64 /= 0 orelse
		 __Tracesguild_war_mgr131 /= [] ->
	  lager:do_log(info,
		       [{module, guild_war_mgr}, {function, handle_info},
			{line, 131}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("同步空闲阶段", []), none, 4096, 64,
		       __Levelguild_war_mgr131, __Tracesguild_war_mgr131,
		       lager_event, __Pidguild_war_mgr131);
      _ -> ok
    end,
    activity_global:set_and_push(22, 0, [0]),
    NewState = State#state{ts = Ts, state_name = StateName,
			   time_out = TimeOut},
    save_state(NewState),
    role_group:apply(world,
		     {guild_war_lib, get_war_info, []}),
    {noreply, NewState};
handle_info({sync_status_to_zone, StateName = match, Ts,
	     TimeOut},
	    State = #state{state_name = match}) ->
    case check_open() of
      false ->
	  NewState = State#state{ts = Ts, state_name = StateName,
				 time_out = TimeOut},
	  save_state(NewState),
	  {noreply, NewState};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_war_mgr144, _,
	     {__Levelguild_war_mgr144, __Tracesguild_war_mgr144}}
		when __Levelguild_war_mgr144 band 64 /= 0 orelse
		       __Tracesguild_war_mgr144 /= [] ->
		lager:do_log(info,
			     [{module, guild_war_mgr}, {function, handle_info},
			      {line, 144}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("同步匹配阶段", []), none, 4096, 64,
			     __Levelguild_war_mgr144, __Tracesguild_war_mgr144,
			     lager_event, __Pidguild_war_mgr144);
	    _ -> ok
	  end,
	  self() ! match_push,
	  NewState = State#state{ts = Ts, state_name = StateName,
				 time_out = TimeOut, match_info = []},
	  save_state(NewState),
	  activity_global:set_and_push(22, 0, [0]),
	  role_group:apply(world,
			   {guild_war_lib, get_war_info, []}),
	  {noreply, NewState}
    end;
handle_info({sync_status_to_zone, StateName = match, Ts,
	     TimeOut},
	    State) ->
    case check_open() of
      false ->
	  NewState = State#state{ts = Ts, state_name = StateName,
				 time_out = TimeOut},
	  save_state(NewState),
	  {noreply, NewState};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_war_mgr159, _,
	     {__Levelguild_war_mgr159, __Tracesguild_war_mgr159}}
		when __Levelguild_war_mgr159 band 64 /= 0 orelse
		       __Tracesguild_war_mgr159 /= [] ->
		lager:do_log(info,
			     [{module, guild_war_mgr}, {function, handle_info},
			      {line, 159}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("开始进入匹配阶段", []), none, 4096, 64,
			     __Levelguild_war_mgr159, __Tracesguild_war_mgr159,
			     lager_event, __Pidguild_war_mgr159);
	    _ -> ok
	  end,
	  activity_global:set_and_push(22, 0, [0]),
	  guild_war_db:update_ets(guild_war_sign, [], clear),
	  put(guild_war_sys_match_member,
	      {guild_war:get_guild_member_info(), []}),
	  info(do_add_match_member_data),
	  NewState = State#state{ts = Ts, state_name = StateName,
				 time_out = TimeOut,
				 week = date:day_of_the_week(),
				 match_info = []},
	  save_state(NewState),
	  role_group:apply(world,
			   {guild_war_lib, get_war_info, []}),
	  {noreply, NewState}
    end;
handle_info({sync_status_to_zone,
	     StateName = match_over, Ts, TimeOut},
	    State = #state{state_name = match_over,
			   match_info = [_ | _]}) ->
    case check_open() of
      false ->
	  NewState = State#state{ts = Ts, state_name = StateName,
				 time_out = TimeOut},
	  save_state(NewState),
	  {noreply, NewState};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_war_mgr180, _,
	     {__Levelguild_war_mgr180, __Tracesguild_war_mgr180}}
		when __Levelguild_war_mgr180 band 64 /= 0 orelse
		       __Tracesguild_war_mgr180 /= [] ->
		lager:do_log(info,
			     [{module, guild_war_mgr}, {function, handle_info},
			      {line, 180}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("同步匹配结果展示阶段", []), none, 4096, 64,
			     __Levelguild_war_mgr180, __Tracesguild_war_mgr180,
			     lager_event, __Pidguild_war_mgr180);
	    _ -> ok
	  end,
	  NewState = State#state{ts = Ts, state_name = StateName,
				 time_out = TimeOut},
	  save_state(NewState),
	  activity_global:set_and_push(22, 1,
				       [(Ts + TimeOut) div 1000]),
	  role_group:apply(world,
			   {guild_war_lib, get_war_info, []}),
	  {noreply, NewState}
    end;
handle_info({sync_status_to_zone,
	     StateName = match_over, Ts, TimeOut},
	    State = #state{week = Week}) ->
    erlang:send_after(util:rand(1, 20000), self(),
		      {sync_status_to_zone2, StateName, Ts, TimeOut}),
    {noreply, State};
handle_info({sync_status_to_zone2,
	     StateName = match_over, Ts, TimeOut},
	    State = #state{week = Week}) ->
    case check_open() of
      false ->
	  NewState = State#state{ts = Ts, state_name = StateName,
				 time_out = TimeOut},
	  save_state(NewState),
	  {noreply, NewState};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_war_mgr197, _,
	     {__Levelguild_war_mgr197, __Tracesguild_war_mgr197}}
		when __Levelguild_war_mgr197 band 64 /= 0 orelse
		       __Tracesguild_war_mgr197 /= [] ->
		lager:do_log(info,
			     [{module, guild_war_mgr}, {function, handle_info},
			      {line, 197}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("开始进入匹配结果展示阶段", []), none, 4096, 64,
			     __Levelguild_war_mgr197, __Tracesguild_war_mgr197,
			     lager_event, __Pidguild_war_mgr197);
	    _ -> ok
	  end,
	  List = case get_group_id() of
		   GroupId when GroupId =/= undefined ->
		       case catch cluster_lib:call(center, ets, lookup,
						   [c_guild_war_match_info,
						    GroupId])
			   of
			 [{_, L} | _] -> L;
			 [] ->
			     Guilds2 = list_util:mkeysort2([{r,
							     #guild_war_sign.lev},
							    {r,
							     #guild_war_sign.avg_power}],
							   ets:tab2list(guild_war_sign)),
			     guild_war:do_match(Guilds2, []);
			 _ -> pass
		       end;
		   _ ->
		       Guilds2 = list_util:mkeysort2([{r, #guild_war_sign.lev},
						      {r,
						       #guild_war_sign.avg_power}],
						     ets:tab2list(guild_war_sign)),
		       guild_war:do_match(Guilds2, [])
		 end,
	  case is_list(List) of
	    true ->
		List2 = [{Gid1, SrvName1, GName1, Rank1, Gid2, SrvName2,
			  GName2, Rank2, 0, {0, <<>>}}
			 || {#guild_war_sign{srv_name = SrvName1, gid = Gid1,
					     gname = GName1, rank = Rank1},
			     #guild_war_sign{srv_name = SrvName2, gid = Gid2,
					     gname = GName2, rank = Rank2}}
				<- List],
		List3 = lists:flatten([[G1, G2]
				       || {G1 = #guild_war_sign{gid =
								    {_, SId1}},
					   G2 = #guild_war_sign{gid =
								    {_, SId2}}}
					      <- List,
					  sys_lib:is_local(SId1) orelse
					    sys_lib:is_local(SId2)]),
		Fun2 = fun ({#guild_war_sign{gid = G1 = {_, SId1}},
			     #guild_war_sign{gid = G2 = {_, SId2}}},
			    Acc2) ->
			       Flag1 = sys_lib:is_local(SId1),
			       Flag2 = sys_lib:is_local(SId2),
			       if Flag1, Flag2 -> [{G1, G2}, {G2, G1} | Acc2];
				  Flag1 -> [{G1, G2} | Acc2];
				  Flag2 -> [{G2, G1} | Acc2];
				  true -> Acc2
			       end
		       end,
		List4 = lists:foldl(Fun2, [], List),
		guild_war_db:update_ets(guild_war_sign,
					[Temp
					 || Temp = #guild_war_sign{gid =
								       {_,
									TempSid}}
						<- List3,
					    not sys_lib:is_local(TempSid)]),
		guild_war_db:update_ets(guild_war_guild_match, List4,
					reset_all),
		activity_global:set_and_push(22, 1,
					     [(Ts + TimeOut) div 1000]),
		Ms1 = {string,
		       {blue, util:fbin(lang:get(<<"周~w"/utf8>>), [Week])}},
		Msg =
		    color:msg(lang:get(<<"号外号外！~ts公会战的匹配结果已经出来啦，请公会中的勇士们查看，为荣誉和丰厚奖励努力吧！"
					 "(｀･ω･´)ゞ ~ts"/utf8>>),
			      [Ms1,
			       {href,
				{48, green, [], lang:get(<<"【前往查看】"/utf8>>)}}]),
		notice:broadcast(rumor, Msg),
		NewState = State#state{ts = Ts, state_name = StateName,
				       time_out = TimeOut, match_info = List2},
		save_state(NewState),
		role_group:apply(world,
				 {guild_war_lib, get_war_info, []}),
		{noreply, NewState};
	    _ ->
		NewState = State#state{ts = Ts, state_name = StateName,
				       time_out = TimeOut},
		save_state(NewState),
		{noreply, NewState}
	  end
    end;
handle_info({sync_status_to_zone, StateName = open, Ts,
	     TimeOut},
	    State = #state{state_name = open,
			   match_info = MatchInfo}) ->
    case check_open() of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_war_mgr257, _,
	     {__Levelguild_war_mgr257, __Tracesguild_war_mgr257}}
		when __Levelguild_war_mgr257 band 64 /= 0 orelse
		       __Tracesguild_war_mgr257 /= [] ->
		lager:do_log(info,
			     [{module, guild_war_mgr}, {function, handle_info},
			      {line, 257}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("同步战斗阶段", []), none, 4096, 64,
			     __Levelguild_war_mgr257, __Tracesguild_war_mgr257,
			     lager_event, __Pidguild_war_mgr257);
	    _ -> ok
	  end,
	  NewState = State#state{ts = Ts, state_name = StateName,
				 time_out = TimeOut},
	  save_state(NewState),
	  {noreply, NewState};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_war_mgr262, _,
	     {__Levelguild_war_mgr262, __Tracesguild_war_mgr262}}
		when __Levelguild_war_mgr262 band 64 /= 0 orelse
		       __Tracesguild_war_mgr262 /= [] ->
		lager:do_log(info,
			     [{module, guild_war_mgr}, {function, handle_info},
			      {line, 262}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("同步战斗阶段", []), none, 4096, 64,
			     __Levelguild_war_mgr262, __Tracesguild_war_mgr262,
			     lager_event, __Pidguild_war_mgr262);
	    _ -> ok
	  end,
	  guild_war:do_open(MatchInfo),
	  NewState = State#state{ts = Ts, state_name = StateName,
				 time_out = TimeOut},
	  save_state(NewState),
	  role_group:apply(world,
			   {guild_war_lib, get_war_info, []}),
	  {noreply, NewState}
    end;
handle_info({sync_status_to_zone, StateName = open, Ts,
	     TimeOut},
	    State = #state{match_info = MatchInfo}) ->
    case check_open() of
      false ->
	  NewState = State#state{ts = Ts, state_name = StateName,
				 time_out = TimeOut},
	  save_state(NewState),
	  {noreply, NewState};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_war_mgr276, _,
	     {__Levelguild_war_mgr276, __Tracesguild_war_mgr276}}
		when __Levelguild_war_mgr276 band 64 /= 0 orelse
		       __Tracesguild_war_mgr276 /= [] ->
		lager:do_log(info,
			     [{module, guild_war_mgr}, {function, handle_info},
			      {line, 276}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("开始进入战斗阶段", []), none, 4096, 64,
			     __Levelguild_war_mgr276, __Tracesguild_war_mgr276,
			     lager_event, __Pidguild_war_mgr276);
	    _ -> ok
	  end,
	  ets:delete_all_objects(guild_war_zone),
	  guild_war:do_open(MatchInfo),
	  NewState = State#state{ts = Ts, state_name = StateName,
				 time_out = TimeOut},
	  Msg =
	      color:msg(lang:get(<<"公会战已经开始！请参加的公会勇士们开始你们的表演，冲鸭！ヾ(ﾟ∀ﾟ*)ﾉ "
				   "~ts"/utf8>>),
			[{href, {48, green, [], lang:get(<<"【前往战场】"/utf8>>)}}]),
	  notice:broadcast(rumor, Msg),
	  activity_global:set_and_push(22, 2,
				       [(Ts + TimeOut) div 1000]),
	  save_state(NewState),
	  role_group:apply(world,
			   {guild_war_lib, get_war_info, []}),
	  guild:apply(async, all,
		      {guild_handle, apply_update_day_war_time, []}),
	  {noreply, NewState}
    end;
handle_info({sync_status_to_zone, StateName = finish,
	     Ts, TimeOut},
	    State = #state{state_name = finish}) ->
    case check_open() of
      false ->
	  NewState = State#state{ts = Ts, state_name = StateName,
				 time_out = TimeOut},
	  save_state(NewState),
	  {noreply, NewState};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_war_mgr300, _,
	     {__Levelguild_war_mgr300, __Tracesguild_war_mgr300}}
		when __Levelguild_war_mgr300 band 64 /= 0 orelse
		       __Tracesguild_war_mgr300 /= [] ->
		lager:do_log(info,
			     [{module, guild_war_mgr}, {function, handle_info},
			      {line, 300}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("同步结算阶段", []), none, 4096, 64,
			     __Levelguild_war_mgr300, __Tracesguild_war_mgr300,
			     lager_event, __Pidguild_war_mgr300);
	    _ -> ok
	  end,
	  NewState = State#state{ts = Ts, state_name = StateName,
				 time_out = TimeOut},
	  save_state(NewState),
	  activity_global:set_and_push(22, 0, [0]),
	  role_group:apply(world,
			   {guild_war_lib, get_war_info, []}),
	  {noreply, NewState}
    end;
handle_info({sync_status_to_zone, StateName = finish,
	     Ts, TimeOut},
	    State = #state{match_info = MatchInfo}) ->
    case check_open() of
      false ->
	  NewState = State#state{ts = Ts, state_name = StateName,
				 time_out = TimeOut},
	  save_state(NewState),
	  {noreply, NewState};
      _ ->
	  L = ets:tab2list(guild_war_zone),
	  [Pid ! {stop, normal} || {_, Pid} <- L],
	  Msg =
	      color:msg(lang:get(<<"本次公会战已结束，参战者请领取宝箱奖励，大家也可前往公会战界面中查看对阵结果，大家辛苦了！"
				   "(｀･ω･´)ゞ ~ts"/utf8>>),
			[{href, {48, green, [], lang:get(<<"【查看结果】"/utf8>>)}}]),
	  notice:broadcast(rumor, Msg),
	  activity_global:set_and_push(22, 0, [0]),
	  NewMatchInfo = do_finish(MatchInfo, []),
	  ets:delete_all_objects(guild_war_zone),
	  NewState = State#state{ts = Ts, state_name = StateName,
				 time_out = TimeOut, match_info = NewMatchInfo},
	  save_state(NewState),
	  guild:apply(async, all,
		      {guild_war, guild_war_award, []}),
	  guild:apply(async, all,
		      {guild_handle, apply_update_day_war_time, []}),
	  role_group:apply(world,
			   {guild_war_lib, get_war_info, []}),
	  {noreply, NewState}
    end;
handle_info(do_add_match_member_data, State) ->
    case get(guild_war_sys_match_member) of
      {[{G, []} | L], L2} ->
	  case L2 == [] of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidguild_war_mgr334, _,
		   {__Levelguild_war_mgr334, __Tracesguild_war_mgr334}}
		      when __Levelguild_war_mgr334 band 8 /= 0 orelse
			     __Tracesguild_war_mgr334 /= [] ->
		      lager:do_log(error,
				   [{module, guild_war_mgr},
				    {function, handle_info}, {line, 334},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("===联盟没有参与人员：~w", [G]), none,
				   4096, 8, __Levelguild_war_mgr334,
				   __Tracesguild_war_mgr334, lager_event,
				   __Pidguild_war_mgr334);
		  _ -> ok
		end;
	    _ ->
		SignG = #guild_war_sign{defense = Defens} =
			    guild_war:do_guild_war_sign(G, L2),
		GroupId = get_group_id(),
		case GroupId of
		  undefined -> skip;
		  _ ->
		      MatchG = SignG#guild_war_sign{defense =
							[RoleTemp#guild_war_role{defense
										     =
										     []}
							 || RoleTemp
								<- Defens]},
		      cluster_lib:cast(center, c_guild_war_mgr, info,
				       [{match_push, {GroupId, [MatchG]}}])
		end
	  end,
	  put(guild_war_sys_match_member, {L, []}),
	  erlang:send_after(util:rand(3, 20), self(),
			    do_add_match_member_data);
      {[{G, [MemId | MemS]} | L], L2} ->
	  erlang:send_after(util:rand(10, 600), self(),
			    do_add_match_member_data),
	  case guild_war:to_guild_war_role(MemId) of
	    GuildRole = #guild_war_role{} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidguild_war_mgr352, _,
		   {__Levelguild_war_mgr352, __Tracesguild_war_mgr352}}
		      when __Levelguild_war_mgr352 band 128 /= 0 orelse
			     __Tracesguild_war_mgr352 /= [] ->
		      lager:do_log(debug,
				   [{module, guild_war_mgr},
				    {function, handle_info}, {line, 352},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("当前机器人数量:~w",
						 [ets:info(role_robot, size)]),
				   none, 4096, 128, __Levelguild_war_mgr352,
				   __Tracesguild_war_mgr352, lager_event,
				   __Pidguild_war_mgr352);
		  _ -> ok
		end,
		put(guild_war_sys_match_member,
		    {[{G, MemS} | L], [GuildRole | L2]});
	    _ ->
		put(guild_war_sys_match_member, {[{G, MemS} | L], L2})
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
	    {__Pidguild_war_mgr358, _,
	     {__Levelguild_war_mgr358, __Tracesguild_war_mgr358}}
		when __Levelguild_war_mgr358 band 64 /= 0 orelse
		       __Tracesguild_war_mgr358 /= [] ->
		lager:do_log(info,
			     [{module, guild_war_mgr}, {function, handle_info},
			      {line, 358}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "获取信息完成", none, 4096, 64, __Levelguild_war_mgr358,
			     __Tracesguild_war_mgr358, lager_event,
			     __Pidguild_war_mgr358);
	    _ -> ok
	  end
    end,
    {noreply, State};
handle_info(match_push, State) ->
    case get_group_id() of
      undefined -> ok;
      GroupId ->
	  List = ets:tab2list(guild_war_sign),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_war_mgr370, _,
	     {__Levelguild_war_mgr370, __Tracesguild_war_mgr370}}
		when __Levelguild_war_mgr370 band 64 /= 0 orelse
		       __Tracesguild_war_mgr370 /= [] ->
		lager:do_log(info,
			     [{module, guild_war_mgr}, {function, handle_info},
			      {line, 370}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("同步信息到中央服:~w", [length(List)]), none,
			     4096, 64, __Levelguild_war_mgr370,
			     __Tracesguild_war_mgr370, lager_event,
			     __Pidguild_war_mgr370);
	    _ -> ok
	  end,
	  cluster_lib:cast(center, c_guild_war_mgr, info,
			   [{match_push, {GroupId, List}}])
    end,
    {noreply, State};
handle_info(re_open,
	    State = #state{match_info = MatchInfo}) ->
    L = guild_war:do_open(MatchInfo),
    [Pid ! {stop, normal}
     || {error, {already_started, Pid}} <- L],
    guild_war:do_open(MatchInfo),
    {noreply, State};
handle_info({update_guild_war_role_defs, Gid, Pos, L},
	    State = #state{}) ->
    case guild_war_db:get_sign(Gid) of
      {ok, G = #guild_war_sign{defense = Defs}} ->
	  case lists:keyfind(Pos, #guild_war_role.pos, Defs) of
	    OldWarRole = #guild_war_role{defense = []} ->
		NewDefs = lists:keyreplace(Pos, #guild_war_role.pos,
					   Defs,
					   OldWarRole#guild_war_role{defense =
									 L}),
		guild_war_db:update_ets(guild_war_sign,
					G#guild_war_sign{defense = NewDefs},
					all);
	    _ -> ok
	  end;
      _ -> ok
    end,
    {noreply, State};
handle_info(Info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_war_mgr404, _,
       {__Levelguild_war_mgr404, __Tracesguild_war_mgr404}}
	  when __Levelguild_war_mgr404 band 8 /= 0 orelse
		 __Tracesguild_war_mgr404 /= [] ->
	  lager:do_log(error,
		       [{module, guild_war_mgr}, {function, handle_info},
			{line, 404}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未处理的消息~w", [Info]), none, 4096, 8,
		       __Levelguild_war_mgr404, __Tracesguild_war_mgr404,
		       lager_event, __Pidguild_war_mgr404);
      _ -> ok
    end,
    {noreply, State}.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_war_mgr408, _,
       {__Levelguild_war_mgr408, __Tracesguild_war_mgr408}}
	  when __Levelguild_war_mgr408 band 64 /= 0 orelse
		 __Tracesguild_war_mgr408 /= [] ->
	  lager:do_log(info,
		       [{module, guild_war_mgr}, {function, terminate},
			{line, 408}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelguild_war_mgr408,
		       __Tracesguild_war_mgr408, lager_event,
		       __Pidguild_war_mgr408);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_finish([], L) -> L;
do_finish([G = {_Gid1, _, _GName1, _Rank1, _Gid2, _, _,
		_, 1, _}
	   | Other],
	  L) ->
    do_finish(Other, [G | L]);
do_finish([{Gid1, T1, T2, T3, Gid2, T4, T5, T6, _, _}
	   | Other],
	  L) ->
    {Hp1, StarTime1} = case guild_war_db:get_sign(Gid1) of
			 {ok, #guild_war_sign{hp = Hp, star_time = StarTime}} ->
			     {Hp, StarTime};
			 _ -> {0, 0}
		       end,
    {Hp2, StarTime2} = case guild_war_db:get_sign(Gid2) of
			 {ok,
			  #guild_war_sign{hp = HpT, star_time = StarTimeT}} ->
			     {HpT, StarTimeT};
			 _ -> {0, 0}
		       end,
    Win = if Hp1 > Hp2 -> Gid1;
	     Hp2 > Hp1 -> Gid2;
	     StarTime1 < StarTime2 andalso StarTime1 =/= 0 -> Gid1;
	     StarTime2 < StarTime1 andalso StarTime2 =/= 0 -> Gid2;
	     true -> {0, <<>>}
	  end,
    do_finish(Other,
	      [{Gid1, T1, T2, T3, Gid2, T4, T5, T6, 1, Win} | L]).

check_open() ->
    OpenDay = date:open_srv_day(),
    LimitDay = guild_war_data:get_const(limit_open_time),
    OpenDay > LimitDay.

get_group_id() ->
    case cluster_dynamic_group:group_main_srvid(1) of
      undefined ->
	  case sys_env:get(group_id) of
	    GroupIdT
		when is_integer(GroupIdT) andalso GroupIdT > 0 ->
		GroupIdT;
	    _ -> undefined
	  end;
      GroupIdT -> GroupIdT
    end.


