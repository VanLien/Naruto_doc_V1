-file("src/mod/dungeon_heaven/holy_eqm_lottery_mgr.erl",
      1).

-module(holy_eqm_lottery_mgr).

-lager_records([{state, []},
		{recruit_limit, [key, info]},
		{holiday_info, [camp_id, stats, ext]},
		{recruit_info, [group_id, stats, ext]},
		{m_recruit_award, [ver, list]},
		{m_recruit,
		 [ver, free_cd_end, list, convert_list, convert_state,
		  holiday_list, holy_eqm_lottery, logs,
		  holiday_sprite_lottery_list, lucky_sprites,
		  lucky_holy_eqm, all_score]}]).

-behaviour(gen_server).

-export([start_link/0, info/1, call/1, lookup/1,
	 lookup/2, save/1, save/2, delete/1, delete/2,
	 get_log/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

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

-file("src/mod/dungeon_heaven/holy_eqm_lottery_mgr.erl",
      32).

-file("inc/recruit.hrl", 1).

-record(m_recruit,
	{ver = 7, free_cd_end = 0, list = [], convert_list = [],
	 convert_state = [], holiday_list = [],
	 holy_eqm_lottery = [], logs = [],
	 holiday_sprite_lottery_list = [], lucky_sprites = [],
	 lucky_holy_eqm = [], all_score = 0}).

-record(m_recruit_award, {ver = 1, list = []}).

-record(recruit_info,
	{group_id = 0, stats = #{}, ext = #{}}).

-record(holiday_info,
	{camp_id = 0, stats = #{}, ext = #{}}).

-record(recruit_limit, {key, info = #{}}).

-file("src/mod/dungeon_heaven/holy_eqm_lottery_mgr.erl",
      33).

-record(state, {}).

-spec lookup({RoleId :: tuple(),
	      GroupId :: integer()}) -> {ok, Obj :: #recruit_limit{}}.

lookup(Key) -> lookup(holy_eqm_lottery_limit, Key).

-spec lookup(atom(), term()) -> {ok, Obj :: term()}.

lookup(Tab, Key) ->
    try case ets:lookup(Tab, Key) of
	  [Obj] -> {ok, Obj};
	  _ ->
	      case dets:lookup(Tab, Key) of
		[Obj] -> ets:insert(Tab, Obj), {ok, Obj};
		[] -> false
	      end
	end
    catch
      Type:Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholy_eqm_lottery_mgr60, _,
	     {__Levelholy_eqm_lottery_mgr60,
	      __Tracesholy_eqm_lottery_mgr60}}
		when __Levelholy_eqm_lottery_mgr60 band 8 /= 0 orelse
		       __Tracesholy_eqm_lottery_mgr60 /= [] ->
		lager:do_log(error,
			     [{module, holy_eqm_lottery_mgr},
			      {function, lookup}, {line, 60},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("查找[Tab:~w]数据错误[Type:~w][Err:~w][Key:~w]",
					   [Tab, Type, Err, Key]),
			     none, 4096, 8, __Levelholy_eqm_lottery_mgr60,
			     __Tracesholy_eqm_lottery_mgr60, lager_event,
			     __Pidholy_eqm_lottery_mgr60);
	    _ -> ok
	  end,
	  false
    end.

-spec save(#recruit_limit{} |
	   [#recruit_limit{}]) -> ok | false.

save(Objs) -> save(holy_eqm_lottery_limit, Objs).

-spec save(atom(), term() | [term()]) -> ok | false.

save(Tab, Objs) ->
    try ets:insert(Tab, Objs), dets:insert(Tab, Objs), ok
    catch
      Type:Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholy_eqm_lottery_mgr77, _,
	     {__Levelholy_eqm_lottery_mgr77,
	      __Tracesholy_eqm_lottery_mgr77}}
		when __Levelholy_eqm_lottery_mgr77 band 8 /= 0 orelse
		       __Tracesholy_eqm_lottery_mgr77 /= [] ->
		lager:do_log(error,
			     [{module, holy_eqm_lottery_mgr}, {function, save},
			      {line, 77}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("保存[Tab:~w]数据错误[Type:~w][Err:~w][Objs:~w]",
					   [Tab, Type, Err, Objs]),
			     none, 4096, 8, __Levelholy_eqm_lottery_mgr77,
			     __Tracesholy_eqm_lottery_mgr77, lager_event,
			     __Pidholy_eqm_lottery_mgr77);
	    _ -> ok
	  end,
	  false
    end.

-spec delete({RoleId :: tuple(),
	      GroupId :: integer()}) -> ok | false.

delete(Key) -> delete(holy_eqm_lottery_limit, Key).

-spec delete(atom(), term()) -> ok | false.

delete(Tab, Key) ->
    try ets:delete(Tab, Key), dets:delete(Tab, Key), ok
    catch
      Type:Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholy_eqm_lottery_mgr94, _,
	     {__Levelholy_eqm_lottery_mgr94,
	      __Tracesholy_eqm_lottery_mgr94}}
		when __Levelholy_eqm_lottery_mgr94 band 8 /= 0 orelse
		       __Tracesholy_eqm_lottery_mgr94 /= [] ->
		lager:do_log(error,
			     [{module, holy_eqm_lottery_mgr},
			      {function, delete}, {line, 94},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("删除[Tab:~w]数据错误[Type:~w][Err:~w][Key:~w]",
					   [Tab, Type, Err, Key]),
			     none, 4096, 8, __Levelholy_eqm_lottery_mgr94,
			     __Tracesholy_eqm_lottery_mgr94, lager_event,
			     __Pidholy_eqm_lottery_mgr94);
	    _ -> ok
	  end,
	  false
    end.

info(Info) -> holy_eqm_lottery_mgr ! Info.

call(Info) ->
    case catch gen_server:call(holy_eqm_lottery_mgr, Info,
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
	    {__Pidholy_eqm_lottery_mgr103, _,
	     {__Levelholy_eqm_lottery_mgr103,
	      __Tracesholy_eqm_lottery_mgr103}}
		when __Levelholy_eqm_lottery_mgr103 band 8 /= 0 orelse
		       __Tracesholy_eqm_lottery_mgr103 /= [] ->
		lager:do_log(error,
			     [{module, holy_eqm_lottery_mgr}, {function, call},
			      {line, 103}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holy_eqm_lottery_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholy_eqm_lottery_mgr103,
			     __Tracesholy_eqm_lottery_mgr103, lager_event,
			     __Pidholy_eqm_lottery_mgr103);
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
    gen_server:start_link({local, holy_eqm_lottery_mgr},
			  holy_eqm_lottery_mgr, [], []).

-spec get_log(pos_integer()) -> #recruit_limit{}.

get_log(GroupId) ->
    case lookup({lottery_logs, GroupId}) of
      {ok, RecruitLimit = #recruit_limit{}} -> RecruitLimit;
      _ ->
	  Info = #{logs => []},
	  #recruit_limit{key = {lottery_logs, GroupId},
			 info = Info}
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
      {__Pidholy_eqm_lottery_mgr127, _,
       {__Levelholy_eqm_lottery_mgr127,
	__Tracesholy_eqm_lottery_mgr127}}
	  when __Levelholy_eqm_lottery_mgr127 band 64 /= 0 orelse
		 __Tracesholy_eqm_lottery_mgr127 /= [] ->
	  lager:do_log(info,
		       [{module, holy_eqm_lottery_mgr}, {function, init},
			{line, 127}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]正在启动...", [holy_eqm_lottery_mgr]),
		       none, 4096, 64, __Levelholy_eqm_lottery_mgr127,
		       __Tracesholy_eqm_lottery_mgr127, lager_event,
		       __Pidholy_eqm_lottery_mgr127);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    case catch load_data() of
      ok ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholy_eqm_lottery_mgr131, _,
	     {__Levelholy_eqm_lottery_mgr131,
	      __Tracesholy_eqm_lottery_mgr131}}
		when __Levelholy_eqm_lottery_mgr131 band 64 /= 0 orelse
		       __Tracesholy_eqm_lottery_mgr131 /= [] ->
		lager:do_log(info,
			     [{module, holy_eqm_lottery_mgr}, {function, init},
			      {line, 131}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~w]启动完成", [holy_eqm_lottery_mgr]),
			     none, 4096, 64, __Levelholy_eqm_lottery_mgr131,
			     __Tracesholy_eqm_lottery_mgr131, lager_event,
			     __Pidholy_eqm_lottery_mgr131);
	    _ -> ok
	  end,
	  {ok, #state{}};
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholy_eqm_lottery_mgr134, _,
	     {__Levelholy_eqm_lottery_mgr134,
	      __Tracesholy_eqm_lottery_mgr134}}
		when __Levelholy_eqm_lottery_mgr134 band 8 /= 0 orelse
		       __Tracesholy_eqm_lottery_mgr134 /= [] ->
		lager:do_log(error,
			     [{module, holy_eqm_lottery_mgr}, {function, init},
			      {line, 134}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("[~w]启动失败[Err:~w]",
					   [holy_eqm_lottery_mgr, Err]),
			     none, 4096, 8, __Levelholy_eqm_lottery_mgr134,
			     __Tracesholy_eqm_lottery_mgr134, lager_event,
			     __Pidholy_eqm_lottery_mgr134);
	    _ -> ok
	  end,
	  {stop, abnormal}
    end.

handle_call(_Request, _From, State) ->
    Reply = ok, {reply, Reply, State}.

handle_cast(_Request, State) -> {noreply, State}.

handle_info({add_log, _ConnPid, GroupId, AddLogs},
	    State) ->
    Limit = #recruit_limit{info = Info} = get_log(GroupId),
    Logs = maps:get(logs, Info, []),
    NewLogs = lists:sublist(AddLogs ++ Logs, 20),
    NewInfo = Info#{logs => NewLogs},
    save(Limit#recruit_limit{info = NewInfo}),
    role_group:pack_send(world, 25218,
			 {2, GroupId, NewLogs}),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(Reason, _State) ->
    util:close_dets(holy_eqm_lottery_limit),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholy_eqm_lottery_mgr159, _,
       {__Levelholy_eqm_lottery_mgr159,
	__Tracesholy_eqm_lottery_mgr159}}
	  when __Levelholy_eqm_lottery_mgr159 band 64 /= 0 orelse
		 __Tracesholy_eqm_lottery_mgr159 /= [] ->
	  lager:do_log(info,
		       [{module, holy_eqm_lottery_mgr}, {function, terminate},
			{line, 159}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w]完成关闭:~w",
				     [holy_eqm_lottery_mgr, Reason]),
		       none, 4096, 64, __Levelholy_eqm_lottery_mgr159,
		       __Tracesholy_eqm_lottery_mgr159, lager_event,
		       __Pidholy_eqm_lottery_mgr159);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_data() ->
    {ok, holy_eqm_lottery_limit} =
	dets:open_file(holy_eqm_lottery_limit,
		       [{file, "dets/holy_eqm_lottery_limit.dets"},
			{keypos, #recruit_limit.key}]),
    holy_eqm_lottery_limit = ets:new(holy_eqm_lottery_limit,
				     [set, named_table, public,
				      {keypos, #recruit_limit.key}]),
    ok.


