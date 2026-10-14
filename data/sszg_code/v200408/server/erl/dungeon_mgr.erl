-file("src/mod/dungeon/dungeon_mgr.erl", 1).

-module(dungeon_mgr).

-lager_records([{dungeon_replay, [dun_id, replays]},
		{dungeon_replay_log,
		 [type, rid, sid, name, face_id, time, power, repaly_id,
		  face_update_time, face_file]},
		{dungeon_data,
		 [id, name, chapter_id, mode, next_id, unit_id, items,
		  drop_ids, hook_unit_id, hook_items, hook_drop_ids,
		  hook_lev_add, time, is_big, energy_max, auto_items,
		  power, lev_limit, floor]},
		{dungeon, [id, status, cool_time, auto_num]},
		{dun_chapter, [id, status, list]},
		{m_dungeon,
		 [ver, mode, chapter_id, dun_id, max_dun_id,
		  last_hook_time, list, drop_idx, ext_reward, buff_list,
		  fast_combat_add_time, auto_combat_id, auto_combat_num,
		  auto_combat_items, chapter_awrads, is_first,
		  acc_hook_time, acc_hook_items]},
		{state, []}]).

-behaviour(gen_server).

-export([ref_repaly/2, get_relay_by_dun/1,
	 get_role_rank/1]).

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

-file("src/mod/dungeon/dungeon_mgr.erl", 17).

-file("inc/dungeon.hrl", 1).

-record(m_dungeon,
	{ver = 6, mode = 1, chapter_id = 0, dun_id = 0,
	 max_dun_id = 0, last_hook_time = 0, list = [],
	 drop_idx = 0, ext_reward = [], buff_list = [],
	 fast_combat_add_time = 0, auto_combat_id = 0,
	 auto_combat_num = 0, auto_combat_items = [],
	 chapter_awrads = [], is_first = 1, acc_hook_time = 0,
	 acc_hook_items = []}).

-record(dun_chapter, {id = 0, status = 0, list = []}).

-record(dungeon,
	{id = 0, status = 0, cool_time = 0, auto_num = 0}).

-record(dungeon_data,
	{id = 0, name = <<>>, chapter_id = 0, mode = 1,
	 next_id = 0, unit_id = 0, items = [], drop_ids = [],
	 hook_unit_id = 0, hook_items = [], hook_drop_ids = [],
	 hook_lev_add = [], time = 0, is_big = 0, energy_max = 0,
	 auto_items = [], power = 0, lev_limit = 0, floor = 0}).

-record(dungeon_replay_log,
	{type = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(), sid = 0  :: binary(),
	 name = <<>>  :: binary(),
	 face_id = 0  :: non_neg_integer(),
	 time = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 repaly_id = 0  :: non_neg_integer(),
	 face_update_time = 0, face_file = <<>>}).

-record(dungeon_replay,
	{dun_id = 0  :: non_neg_integer(),
	 replays = []  :: [#dungeon_replay_log{}]}).

-file("src/mod/dungeon/dungeon_mgr.erl", 18).

-spec ref_repaly(pos_integer(),
		 #dungeon_replay_log{}) -> ok.

ref_repaly(DunId, Replay) -> cast({ref, DunId, Replay}).

-spec
     get_relay_by_dun(pos_integer()) -> [#dungeon_replay_log{}].

get_relay_by_dun(DunId) ->
    case catch ets:lookup(dungeon_replay, DunId) of
      [#dungeon_replay{replays = L} | _] ->
	  [log_ver(I) || I <- L];
      _ -> []
    end.

-spec
     get_role_rank(pos_integer()) -> [#dungeon_replay_log{}].

get_role_rank(RoleId) ->
    case catch ets:lookup(dungeon_info, RoleId) of
      [{_, DunId} | _] ->
	  Size = ets:info(dungeon_info, size),
	  Ms = [{{'$1', '$2'}, [{'>', '$2', DunId}],
		 ['$1', '$2']}],
	  case catch ets:select(dungeon_info, Ms) of
	    L when is_list(L) ->
		util:ceil((Size - length(L)) * 1000 * 100 / Size);
	    _ -> 1000
	  end;
      _ -> 1000
    end.

-spec update_ets(atom(), any(), ets | dets | all) -> ok.

update_ets(Tab, Data, ets) -> ets:insert(Tab, Data);
update_ets(Tab, Data, dets) -> dets:insert(Tab, Data);
update_ets(Tab, Data, all) ->
    ets:insert(Tab, Data), dets:insert(Tab, Data).

info(Info) -> dungeon_mgr ! Info.

cast(Info) -> gen_server:cast(dungeon_mgr, Info).

call(Info) ->
    case catch gen_server:call(dungeon_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Piddungeon_mgr66, _,
	     {__Leveldungeon_mgr66, __Tracesdungeon_mgr66}}
		when __Leveldungeon_mgr66 band 8 /= 0 orelse
		       __Tracesdungeon_mgr66 /= [] ->
		lager:do_log(error,
			     [{module, dungeon_mgr}, {function, call},
			      {line, 66}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [dungeon_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Leveldungeon_mgr66,
			     __Tracesdungeon_mgr66, lager_event,
			     __Piddungeon_mgr66);
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
    gen_server:start_link({local, dungeon_mgr}, dungeon_mgr,
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
      {__Piddungeon_mgr72, _,
       {__Leveldungeon_mgr72, __Tracesdungeon_mgr72}}
	  when __Leveldungeon_mgr72 band 64 /= 0 orelse
		 __Tracesdungeon_mgr72 /= [] ->
	  lager:do_log(info,
		       [{module, dungeon_mgr}, {function, init}, {line, 72},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [dungeon_mgr]), none,
		       4096, 64, __Leveldungeon_mgr72, __Tracesdungeon_mgr72,
		       lager_event, __Piddungeon_mgr72);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(dungeon_replay,
		   [{file, "./dets/dungeon_replay.dets"},
		    {keypos, #dungeon_replay.dun_id}]),
    ets:new(dungeon_replay,
	    [set, named_table, public,
	     {keypos, #dungeon_replay.dun_id}]),
    dets:open_file(dungeon_info,
		   [{file, "./dets/dungeon_info.dets"}, {keypos, 1}]),
    ets:new(dungeon_info,
	    [set, named_table, public, {keypos, 1}]),
    ets:from_dets(dungeon_info, dungeon_info),
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
      {__Piddungeon_mgr84, _,
       {__Leveldungeon_mgr84, __Tracesdungeon_mgr84}}
	  when __Leveldungeon_mgr84 band 64 /= 0 orelse
		 __Tracesdungeon_mgr84 /= [] ->
	  lager:do_log(info,
		       [{module, dungeon_mgr}, {function, init}, {line, 84},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [dungeon_mgr]), none, 4096,
		       64, __Leveldungeon_mgr84, __Tracesdungeon_mgr84,
		       lager_event, __Piddungeon_mgr84);
      _ -> ok
    end,
    {ok, State}.

load() ->
    ets:from_dets(dungeon_replay, dungeon_replay),
    Fun = fun (E = #dungeon_replay{replays = L}, Acc) ->
		  [E#dungeon_replay{replays = [log_ver(I) || I <- L]}
		   | Acc]
	  end,
    List = dets:foldl(Fun, [], dungeon_replay),
    put(dungeon_replay, List).

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({ref, DunId,
	     Repaly = #dungeon_replay_log{}},
	    State) ->
    List = get_replay(),
    case lists:keyfind(DunId, #dungeon_replay.dun_id, List)
	of
      false ->
	  NewRepaly = init(DunId, Repaly),
	  update_ets(dungeon_replay, NewRepaly, all),
	  put(dungeon_replay, [NewRepaly | List]);
      Old = #dungeon_replay{replays = ReplayList} ->
	  NewReplayList = ref(ReplayList, Repaly),
	  NewList = lists:keystore(DunId, #dungeon_replay.dun_id,
				   List,
				   Old#dungeon_replay{replays = NewReplayList}),
	  update_ets(dungeon_replay,
		     Old#dungeon_replay{replays = NewReplayList}, all),
	  put(dungeon_replay, NewList)
    end,
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    L = ets:tab2list(dungeon_info),
    dets:insert(dungeon_info, L),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddungeon_mgr123, _,
       {__Leveldungeon_mgr123, __Tracesdungeon_mgr123}}
	  when __Leveldungeon_mgr123 band 64 /= 0 orelse
		 __Tracesdungeon_mgr123 /= [] ->
	  lager:do_log(info,
		       [{module, dungeon_mgr}, {function, terminate},
			{line, 123}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Leveldungeon_mgr123,
		       __Tracesdungeon_mgr123, lager_event,
		       __Piddungeon_mgr123);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

get_replay() ->
    case get(dungeon_replay) of
      L when is_list(L) -> L;
      undefined -> []
    end.

init(DunId,
     Repaly = #dungeon_replay_log{repaly_id = RepalyId}) ->
    combat_replay_mgr:acc_replay_reference(RepalyId),
    combat_replay_mgr:acc_replay_reference(RepalyId),
    combat_replay_mgr:acc_replay_reference(RepalyId),
    #dungeon_replay{dun_id = DunId,
		    replays =
			[Repaly#dungeon_replay_log{type = 1},
			 Repaly#dungeon_replay_log{type = 2},
			 Repaly#dungeon_replay_log{type = 3}]}.

ref(ReplayList, Repaly) ->
    ref(ReplayList, Repaly, [], false).

ref([], _Repaly, L, _) -> L;
ref([#dungeon_replay_log{type = 1, time = OldTime,
			 repaly_id = Id}
     | ReplayList],
    Repaly = #dungeon_replay_log{time = Time,
				 repaly_id = NewId},
    L, Flag)
    when Time < OldTime ->
    combat_replay_mgr:dec_replay_reference(Id),
    combat_replay_mgr:acc_replay_reference(NewId),
    ref(ReplayList, Repaly,
	[Repaly#dungeon_replay_log{type = 1} | L], Flag);
ref([#dungeon_replay_log{type = 2, power = OldPower,
			 repaly_id = Id}
     | ReplayList],
    Repaly = #dungeon_replay_log{power = Power,
				 repaly_id = NewId},
    L, Flag)
    when Power < OldPower ->
    combat_replay_mgr:dec_replay_reference(Id),
    combat_replay_mgr:acc_replay_reference(NewId),
    ref(ReplayList, Repaly,
	[Repaly#dungeon_replay_log{type = 2} | L], Flag);
ref([#dungeon_replay_log{type = 3, repaly_id = Id}
     | ReplayList],
    Repaly = #dungeon_replay_log{repaly_id = NewId}, L,
    Flag) ->
    combat_replay_mgr:dec_replay_reference(Id),
    combat_replay_mgr:acc_replay_reference(NewId),
    ref(ReplayList, Repaly,
	[Repaly#dungeon_replay_log{type = 3} | L], Flag);
ref([Data | ReplayList], Repaly, L, Flag) ->
    ref(ReplayList, Repaly, [Data | L], Flag).

log_ver({dungeon_replay_log, Type, Rid, Sid, Name,
	 FaceId, Time, Power, ReplayId}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    log_ver({dungeon_replay_log, Type, Rid, Sid, Name,
	     FaceId, Time, Power, ReplayId, FaceUpdateTime,
	     FaceFile});
log_ver(Log = #dungeon_replay_log{}) -> Log.


