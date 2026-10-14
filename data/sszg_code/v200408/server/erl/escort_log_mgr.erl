-file("src/mod/escort/escort_log_mgr.erl", 1).

-module(escort_log_mgr).

-lager_records([{escort_pos_info,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp]},
		{escort_plunder_log,
		 [id, quality, rid, name, guild_name, face, lev, sex,
		  power, avatar_id, ret, atk_ret, items, time, atk_count,
		  help_count, help_time, formation_type, formation_lev,
		  pos_info, combat_role, replay_id, ext]},
		{escort_plunder_role, [id, atk_logs, def_logs]},
		{escort,
		 [id, name, gid, quality, end_time, plunder_lists,
		  combat_lists, gname, power]},
		{m_escort, [ver, status, quality, end_time, five_data]},
		{state, []}]).

-behaviour(gen_server).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([get_log/2]).

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

-file("src/mod/escort/escort_log_mgr.erl", 15).

-file("inc/escort.hrl", 1).

-record(m_escort,
	{ver = 1  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 quality = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 five_data = []  :: list()}).

-record(escort,
	{id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: non_neg_integer(),
	 gid = {0, <<>>}  :: tuple(),
	 quality = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 plunder_lists = []  :: non_neg_integer(),
	 combat_lists = []  :: non_neg_integer(),
	 gname = <<>>  :: non_neg_integer(),
	 power = 0  :: non_neg_integer()}).

-record(escort_plunder_role,
	{id = {0, <<>>}, atk_logs = [], def_logs = []}).

-record(escort_plunder_log,
	{id = 0, quality = 0, rid = {0, <<>>}, name = <<>>,
	 guild_name = <<>>, face = 0, lev = 0, sex = 0,
	 power = 0, avatar_id = 0, ret = 0, atk_ret = 0,
	 items = [], time = 0, atk_count = 0, help_count = 0,
	 help_time = 0, formation_type = 0, formation_lev = 0,
	 pos_info = [], combat_role = [], replay_id = 0,
	 ext = []}).

-record(escort_pos_info,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0}).

-file("src/mod/escort/escort_log_mgr.erl", 16).

-spec get_log(role_id(), pos_integer()) -> list().

get_log(RoleId, Pos) ->
    try ets:lookup_element(escort_log_data, RoleId, Pos)
    catch
      _:_ ->
	  case dets:lookup(escort_log_data, RoleId) of
	    [R] ->
		R1 = tuple_util:convert_data(R, #escort_plunder_role{}),
		ets:insert(escort_log_data, R1),
		element(Pos, R1);
	    _ ->
		ets:insert_new(escort_log_data,
			       #escort_plunder_role{id = RoleId}),
		[]
	  end
    end.

info(Info) -> escort_log_mgr ! Info.

cast(Info) -> gen_server:cast(escort_log_mgr, Info).

call(Info) ->
    case catch gen_server:call(escort_log_mgr, Info, 10000)
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
	    {__Pidescort_log_mgr43, _,
	     {__Levelescort_log_mgr43, __Tracesescort_log_mgr43}}
		when __Levelescort_log_mgr43 band 8 /= 0 orelse
		       __Tracesescort_log_mgr43 /= [] ->
		lager:do_log(error,
			     [{module, escort_log_mgr}, {function, call},
			      {line, 43}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [escort_log_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelescort_log_mgr43,
			     __Tracesescort_log_mgr43, lager_event,
			     __Pidescort_log_mgr43);
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
    gen_server:start_link({local, escort_log_mgr},
			  escort_log_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidescort_log_mgr49, _,
       {__Levelescort_log_mgr49, __Tracesescort_log_mgr49}}
	  when __Levelescort_log_mgr49 band 64 /= 0 orelse
		 __Tracesescort_log_mgr49 /= [] ->
	  lager:do_log(info,
		       [{module, escort_log_mgr}, {function, init}, {line, 49},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [escort_log_mgr]), none,
		       4096, 64, __Levelescort_log_mgr49,
		       __Tracesescort_log_mgr49, lager_event,
		       __Pidescort_log_mgr49);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(escort_log_data,
		   [{file, "./dets/escort_log_data.dets"},
		    {keypos, #escort_plunder_role.id}]),
    ets:new(escort_log_data,
	    [set, named_table, public,
	     {keypos, #escort_plunder_role.id}]),
    Fun = fun (E = #escort_plunder_role{def_logs = DefLogsT,
					atk_logs = AtkLogsT},
	       Acc) ->
		  DefLogs = do_escort_log_ver(DefLogsT, []),
		  AtkLogs = do_escort_log_ver(AtkLogsT, []),
		  NewDefLogs = [Log#escort_plunder_log{combat_role = []}
				|| Log <- DefLogs],
		  NewAtkLogs = [Log#escort_plunder_log{combat_role = []}
				|| Log <- AtkLogs],
		  [E#escort_plunder_role{def_logs = NewDefLogs,
					 atk_logs = NewAtkLogs}
		   | Acc]
	  end,
    List = dets:foldl(Fun, [], escort_log_data),
    ets:insert(escort_log_data, List),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidescort_log_mgr63, _,
       {__Levelescort_log_mgr63, __Tracesescort_log_mgr63}}
	  when __Levelescort_log_mgr63 band 64 /= 0 orelse
		 __Tracesescort_log_mgr63 /= [] ->
	  lager:do_log(info,
		       [{module, escort_log_mgr}, {function, init}, {line, 63},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [escort_log_mgr]), none,
		       4096, 64, __Levelescort_log_mgr63,
		       __Tracesescort_log_mgr63, lager_event,
		       __Pidescort_log_mgr63);
      _ -> ok
    end,
    {ok, State}.

handle_call({can_atk_back, RoleId, TarRoleId, LogId},
	    _From, State) ->
    Now = date:unixtime(),
    Logs = get_log(TarRoleId,
		   #escort_plunder_role.def_logs),
    case lists:keyfind(LogId, #escort_plunder_log.id, Logs)
	of
      Log = #escort_plunder_log{atk_ret = 0,
				help_time = HelpTime, combat_role = []}
	  when Now >= HelpTime andalso RoleId == TarRoleId ->
	  {reply, {ok, Log}, State};
      Log = #escort_plunder_log{atk_ret = 0,
				help_time = HelpTime, combat_role = []}
	  when Now < HelpTime andalso RoleId =/= TarRoleId ->
	  NewLogs = lists:keystore(LogId, #escort_plunder_log.id,
				   Logs,
				   Log#escort_plunder_log{combat_role =
							      [RoleId]}),
	  ets:update_element(escort_log_data, TarRoleId,
			     [{#escort_plunder_role.def_logs, NewLogs}]),
	  {reply, {ok, Log}, State};
      #escort_plunder_log{atk_ret = 1} ->
	  {reply, {false, lang:get(<<"已成功复仇"/utf8>>)}, State};
      #escort_plunder_log{atk_ret = 2} ->
	  {reply, {false, lang:get(<<"复仇次数达到上限,不能继续复仇"/utf8>>)},
	   State};
      #escort_plunder_log{combat_role = [_ | _]} ->
	  {reply, {false, lang:get(<<"已有其他玩家在战斗"/utf8>>)}, State};
      #escort_plunder_log{help_time = HelpTime}
	  when Now >= HelpTime andalso RoleId =/= TarRoleId ->
	  {reply, {false, lang:get(<<"不在求助时间内, 不能帮助复仇"/utf8>>)},
	   State};
      #escort_plunder_log{help_time = HelpTime}
	  when Now =< HelpTime andalso RoleId == TarRoleId ->
	  {reply, {false, lang:get(<<"求助时间内, 不能复仇"/utf8>>)},
	   State};
      _ ->
	  {reply, {false, lang:get(<<"当前状态无法复仇"/utf8>>)}, State}
    end;
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({add_log, Id,
	     LogData = #escort_plunder_log{replay_id = NReplayId},
	     Pos},
	    State) ->
    Logs = get_log(Id, Pos),
    LogId = case Logs of
	      [#escort_plunder_log{id = LogId1} | _]
		  when LogId1 < 100 ->
		  LogId1 + 1;
	      _ -> 1
	    end,
    combat_replay_mgr:acc_replay_reference(NReplayId),
    {NewLogs, DelLogs} =
	list_util:split(escort_data:const(plunder_log_limit),
			[LogData#escort_plunder_log{id = LogId} | Logs]),
    [combat_replay_mgr:dec_replay_reference(ReplayId)
     || #escort_plunder_log{replay_id = ReplayId}
	    <- DelLogs],
    ets:update_element(escort_log_data, Id,
		       [{Pos, NewLogs}]),
    {noreply, State};
handle_info({atk_back_win, Id, LogId, RolePid},
	    State) ->
    Logs = get_log(Id, #escort_plunder_role.def_logs),
    case lists:keyfind(LogId, #escort_plunder_log.id, Logs)
	of
      Log = #escort_plunder_log{atk_ret = 0} ->
	  NewAtkRet = 1,
	  NewLogs = lists:keystore(LogId, #escort_plunder_log.id,
				   Logs,
				   Log#escort_plunder_log{atk_ret = NewAtkRet}),
	  ets:update_element(escort_log_data, Id,
			     [{#escort_plunder_role.def_logs, NewLogs}]),
	  role:apply(async, RolePid, {escort, ref_log, [LogId]});
      _ -> ok
    end,
    {noreply, State};
handle_info({atk_back_loss, Id, LogId, RolePid},
	    State) ->
    Logs = get_log(Id, #escort_plunder_role.def_logs),
    case lists:keyfind(LogId, #escort_plunder_log.id, Logs)
	of
      Log = #escort_plunder_log{atk_count = AtkCount,
				atk_ret = 0} ->
	  NewAtkCount = AtkCount + 1,
	  NewAtkRet = util:if_true(NewAtkCount >=
				     escort_data:const(single_revenge_limit),
				   2, 0),
	  NewLogs = lists:keystore(LogId, #escort_plunder_log.id,
				   Logs,
				   Log#escort_plunder_log{atk_count =
							      NewAtkCount,
							  atk_ret = NewAtkRet,
							  combat_role = []}),
	  ets:update_element(escort_log_data, Id,
			     [{#escort_plunder_role.def_logs, NewLogs}]),
	  role:apply(async, RolePid, {escort, ref_log, [LogId]});
      _ -> ok
    end,
    {noreply, State};
handle_info({del_combat_role, Id, LogId}, State) ->
    Logs = get_log(Id, #escort_plunder_role.def_logs),
    case lists:keyfind(LogId, #escort_plunder_log.id, Logs)
	of
      Log = #escort_plunder_log{} ->
	  NewLogs = lists:keystore(LogId, #escort_plunder_log.id,
				   Logs,
				   Log#escort_plunder_log{combat_role = []}),
	  ets:update_element(escort_log_data, Id,
			     [{#escort_plunder_role.def_logs, NewLogs}]);
      _ -> ok
    end,
    {noreply, State};
handle_info({do_help, Id, LogId, RolePid}, State) ->
    Logs = get_log(Id, #escort_plunder_role.def_logs),
    Now = date:unixtime(),
    case lists:keyfind(LogId, #escort_plunder_log.id, Logs)
	of
      Log = #escort_plunder_log{help_count = Count} ->
	  NewLogs = lists:keystore(LogId, #escort_plunder_log.id,
				   Logs,
				   Log#escort_plunder_log{help_count =
							      Count + 1,
							  help_time =
							      Now +
								escort_data:const(request_colddown)}),
	  ets:update_element(escort_log_data, Id,
			     [{#escort_plunder_role.def_logs, NewLogs}]),
	  role:apply(async, RolePid, {escort, ref_log, [LogId]});
      _ -> ok
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    L = ets:tab2list(escort_log_data),
    dets:insert(escort_log_data, L),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidescort_log_mgr170, _,
       {__Levelescort_log_mgr170, __Tracesescort_log_mgr170}}
	  when __Levelescort_log_mgr170 band 64 /= 0 orelse
		 __Tracesescort_log_mgr170 /= [] ->
	  lager:do_log(info,
		       [{module, escort_log_mgr}, {function, terminate},
			{line, 170}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelescort_log_mgr170,
		       __Tracesescort_log_mgr170, lager_event,
		       __Pidescort_log_mgr170);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_escort_log_ver([], L) -> L;
do_escort_log_ver([Log = #escort_plunder_log{} | Other],
		  L) ->
    do_escort_log_ver(Other, [Log | L]);
do_escort_log_ver([{escort_plunder_log, Id, Quality,
		    Rid, Name, GuildName, Face, Lev, Sex, Power, AvatarId,
		    Ret, AtkRet, Items, Time, AtkCount, HelpCount, HelpTime,
		    FormationType, FormationLev, PosInfo, CombatRole, Ext}
		   | Other],
		  L) ->
    Log = #escort_plunder_log{id = Id, quality = Quality,
			      rid = Rid, name = Name, guild_name = GuildName,
			      face = Face, lev = Lev, sex = Sex, power = Power,
			      avatar_id = AvatarId, ret = Ret, atk_ret = AtkRet,
			      items = Items, time = Time, atk_count = AtkCount,
			      help_count = HelpCount, help_time = HelpTime,
			      formation_type = FormationType,
			      formation_lev = FormationLev, pos_info = PosInfo,
			      combat_role = CombatRole, replay_id = 0,
			      ext = Ext},
    do_escort_log_ver([Log | Other], L);
do_escort_log_ver([Log | _], _L) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidescort_log_mgr209, _,
       {__Levelescort_log_mgr209, __Tracesescort_log_mgr209}}
	  when __Levelescort_log_mgr209 band 8 /= 0 orelse
		 __Tracesescort_log_mgr209 /= [] ->
	  lager:do_log(error,
		       [{module, escort_log_mgr},
			{function, do_escort_log_ver}, {line, 209},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("===错误的日志信息:~w ===", [Log]), none, 4096,
		       8, __Levelescort_log_mgr209, __Tracesescort_log_mgr209,
		       lager_event, __Pidescort_log_mgr209);
      _ -> ok
    end,
    false.


