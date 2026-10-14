-file("src/mod/star/star_tower_mgr.erl", 1).

-module(star_tower_mgr).

-lager_records([{m_star,
		 [ver, star_list, fetter_list, all_attr]},
		{star_tower_replay, [tower, replays]},
		{tower_replay_data,
		 [type, rid, sid, name, face_id, time, power, repaly_id,
		  face_update_time, face_file]},
		{m_star_divination,
		 [ver, luck, quality, all_count, flag, ref_count,
		  day_gold_count, day_hun_count]},
		{m_star_tower, [ver, max_tower, award_list]},
		{star,
		 [ver, set_id, break_lev, lev, natals, add_attr,
		  fetter_attr, set_skill_id, power]},
		{state, []}]).

-behaviour(gen_server).

-export([ref_repaly/3, get_relay_by_tower/1,
	 star_tower_role_replays/2, do_ref_repaly/0,
	 gm_delete_replay/1]).

-export([info/2, cast/2, call/2, start_link/0]).

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

-file("src/mod/star/star_tower_mgr.erl", 19).

-file("inc/star.hrl", 1).

-record(star,
	{ver = 1  :: non_neg_integer(),
	 set_id = 0  :: non_neg_integer(),
	 break_lev = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), natals = []  :: list(),
	 add_attr = []  :: list(), fetter_attr = []  :: list(),
	 set_skill_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer()}).

-record(m_star_tower,
	{ver = 1  :: non_neg_integer(),
	 max_tower = 0  :: non_neg_integer(),
	 award_list = []  :: list()}).

-record(m_star_divination,
	{ver = 1  :: non_neg_integer(),
	 luck = 1  :: non_neg_integer(),
	 quality = 1  :: non_neg_integer(),
	 all_count = 0  :: non_neg_integer(),
	 flag = 0  :: non_neg_integer(),
	 ref_count = 0  :: non_neg_integer(),
	 day_gold_count = 0  :: non_neg_integer(),
	 day_hun_count = 0  :: non_neg_integer()}).

-record(tower_replay_data,
	{type = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(), sid = 0  :: binary(),
	 name = <<>>  :: binary(),
	 face_id = 0  :: non_neg_integer(),
	 time = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 repaly_id = 0  :: non_neg_integer(),
	 face_update_time = 0, face_file = <<>>}).

-record(star_tower_replay,
	{tower = 0  :: non_neg_integer(),
	 replays = []  :: [#tower_replay_data{}]}).

-record(m_star,
	{ver = 1  :: non_neg_integer(),
	 star_list = []  :: [#star{}],
	 fetter_list = []  :: list(), all_attr = []  :: list()}).

-file("src/mod/star/star_tower_mgr.erl", 20).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/star/star_tower_mgr.erl", 21).

gm_delete_replay(N) ->
    LimitTime = date:unixtime() - 86400 * N,
    case
      db:get_all("select rid, srv_id from role where logout_tim"
		 "e < ? and login_time < ? ",
		 [LimitTime, LimitTime], 60000)
	of
      {ok, L} ->
	  Ids = [{Rid, Sid} || [Rid, Sid] <- L],
	  Fun = fun (Id, Acc) ->
			Ms = [{{{'$1', '_'}, '$2', '_'},
			       [{'==', '$1', {const, Id}}], ['$2']}],
			case catch ets:select(star_tower_other, Ms) of
			  L2 = [_ | _] ->
			      combat_replay_mgr:dec_replay_reference(L2),
			      [{Id, length(L2)} | Acc];
			  _ -> Acc
			end
		end,
	  DelInfo = lists:foldl(Fun, [], Ids),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidstar_tower_mgr39, _,
	     {__Levelstar_tower_mgr39, __Tracesstar_tower_mgr39}}
		when __Levelstar_tower_mgr39 band 64 /= 0 orelse
		       __Tracesstar_tower_mgr39 /= [] ->
		lager:do_log(info,
			     [{module, star_tower_mgr},
			      {function, gm_delete_replay}, {line, 39},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("手动删除星命塔个人录像结果:~p", [DelInfo]), none,
			     4096, 64, __Levelstar_tower_mgr39,
			     __Tracesstar_tower_mgr39, lager_event,
			     __Pidstar_tower_mgr39);
	    _ -> ok
	  end,
	  DelInfo;
      _ -> []
    end.

do_ref_repaly() -> cast(star_tower_mgr, do_ref_repaly).

-spec ref_repaly(pos_integer(), #tower_replay_data{},
		 pos_integer()) -> ok.

ref_repaly(StarTower, Replay, MaxTower) ->
    cast(star_tower_mgr,
	 {ref, StarTower, Replay, MaxTower}).

-spec
     get_relay_by_tower(pos_integer()) -> [#tower_replay_data{}].

get_relay_by_tower(Tower) ->
    case catch ets:lookup(star_tower_replay, Tower) of
      [#star_tower_replay{replays = L} | _] ->
	  [log_ver(I) || I <- L];
      _ -> []
    end.

log_ver({tower_replay_data, Type, Rid, Sid, Name,
	 FaceId, Time, Power, ReplayId}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    log_ver({tower_replay_data, Type, Rid, Sid, Name,
	     FaceId, Time, Power, ReplayId, FaceUpdateTime,
	     FaceFile});
log_ver(Log) -> Log.

-spec star_tower_role_replays(role_id(),
			      pos_integer()) -> undefined | pos_integer().

star_tower_role_replays(RoleId, Tower) ->
    case ets:lookup(star_tower_other, {RoleId, Tower}) of
      [{{RoleId, Tower}, Id, Time} | _] -> {Id, Time};
      _ ->
	  case dets:lookup(star_tower_other, {RoleId, Tower}) of
	    [{{RoleId, Tower}, Id, Time} | _] ->
		ets:insert(star_tower_other,
			   {{RoleId, Tower}, Id, Time}),
		{Id, Time};
	    _ -> undefined
	  end
    end.

-spec update_ets(atom(), any(), ets | dets | all) -> ok.

update_ets(Tab, Data, ets) -> ets:insert(Tab, Data);
update_ets(Tab, Data, dets) -> dets:insert(Tab, Data);
update_ets(Tab, Data, all) ->
    ets:insert(Tab, Data), dets:insert(Tab, Data).

info(Pid, Info) -> Pid ! Info.

cast(Pid, Info) -> gen_server:cast(Pid, Info).

call(Pid, Info) ->
    case catch gen_server:call(Pid, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidstar_tower_mgr101, _,
	     {__Levelstar_tower_mgr101, __Tracesstar_tower_mgr101}}
		when __Levelstar_tower_mgr101 band 8 /= 0 orelse
		       __Tracesstar_tower_mgr101 /= [] ->
		lager:do_log(error,
			     [{module, star_tower_mgr}, {function, call},
			      {line, 101}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [Pid, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelstar_tower_mgr101,
			     __Tracesstar_tower_mgr101, lager_event,
			     __Pidstar_tower_mgr101);
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
    gen_server:start_link({local, star_tower_mgr},
			  star_tower_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidstar_tower_mgr108, _,
       {__Levelstar_tower_mgr108, __Tracesstar_tower_mgr108}}
	  when __Levelstar_tower_mgr108 band 64 /= 0 orelse
		 __Tracesstar_tower_mgr108 /= [] ->
	  lager:do_log(info,
		       [{module, star_tower_mgr}, {function, init},
			{line, 108}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [star_tower_mgr]), none,
		       4096, 64, __Levelstar_tower_mgr108,
		       __Tracesstar_tower_mgr108, lager_event,
		       __Pidstar_tower_mgr108);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(star_tower_replay,
		   [{file, "./dets/star_tower_replay.dets"},
		    {keypos, #star_tower_replay.tower}]),
    ets:new(star_tower_replay,
	    [set, named_table, public,
	     {keypos, #star_tower_replay.tower}]),
    dets:open_file(star_tower_other,
		   [{file, "./dets/star_tower_other.dets"}, {keypos, 1}]),
    ets:new(star_tower_other,
	    [set, named_table, public, {keypos, 1}]),
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
      {__Pidstar_tower_mgr118, _,
       {__Levelstar_tower_mgr118, __Tracesstar_tower_mgr118}}
	  when __Levelstar_tower_mgr118 band 64 /= 0 orelse
		 __Tracesstar_tower_mgr118 /= [] ->
	  lager:do_log(info,
		       [{module, star_tower_mgr}, {function, init},
			{line, 118}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [star_tower_mgr]), none,
		       4096, 64, __Levelstar_tower_mgr118,
		       __Tracesstar_tower_mgr118, lager_event,
		       __Pidstar_tower_mgr118);
      _ -> ok
    end,
    {ok, State}.

load() ->
    ets:from_dets(star_tower_replay, star_tower_replay),
    Fun = fun (E = #star_tower_replay{replays = L}, Acc) ->
		  [E#star_tower_replay{replays = [log_ver(I) || I <- L]}
		   | Acc]
	  end,
    List = dets:foldl(Fun, [], star_tower_replay),
    put(star_tower_replay, List).

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(do_ref_repaly, State) ->
    List = get_replay(),
    Fun = fun (#star_tower_replay{replays = Replays}) ->
		  case Replays of
		    [#tower_replay_data{repaly_id = RepalyId},
		     #tower_replay_data{repaly_id = RepalyId}] ->
			combat_replay_mgr:acc_replay_reference(RepalyId),
			combat_replay_mgr:acc_replay_reference(RepalyId);
		    _ -> ok
		  end
	  end,
    lists:map(Fun, List),
    {noreply, State};
handle_cast({ref, StarTower,
	     Repaly = #tower_replay_data{rid = RId, time = Time,
					 sid = SId, repaly_id = RepalyId},
	     MaxTower},
	    State) ->
    List = get_replay(),
    case lists:keyfind(StarTower, #star_tower_replay.tower,
		       List)
	of
      false ->
	  combat_replay_mgr:acc_replay_reference(RepalyId),
	  combat_replay_mgr:acc_replay_reference(RepalyId),
	  combat_replay_mgr:acc_replay_reference(RepalyId),
	  NewRepaly = init(StarTower, Repaly),
	  update_ets(star_tower_replay, NewRepaly, all),
	  put(star_tower_replay, [NewRepaly | List]),
	  case StarTower =< MaxTower - 20 of
	    true -> ok;
	    _ ->
		do_del_replay2({RId, SId}, StarTower),
		update_ets(star_tower_other,
			   {{{RId, SId}, StarTower}, RepalyId, Time}, all),
		do_del_replay3({RId, SId}, MaxTower - 20, MaxTower - 20)
	  end;
      Old = #star_tower_replay{replays = ReplayList} ->
	  combat_replay_mgr:acc_replay_reference(RepalyId),
	  NewReplayList = ref(ReplayList, Repaly),
	  NewList = lists:keystore(StarTower,
				   #star_tower_replay.tower, List,
				   Old#star_tower_replay{replays =
							     NewReplayList}),
	  update_ets(star_tower_replay,
		     Old#star_tower_replay{replays = NewReplayList}, all),
	  put(star_tower_replay, NewList),
	  case StarTower =< MaxTower - 20 of
	    true -> ok;
	    _ ->
		do_del_replay2({RId, SId}, StarTower),
		update_ets(star_tower_other,
			   {{{RId, SId}, StarTower}, RepalyId, Time}, all),
		do_del_replay3({RId, SId}, MaxTower - 20, MaxTower - 20)
	  end
    end,
    {noreply, State};
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
      {__Pidstar_tower_mgr189, _,
       {__Levelstar_tower_mgr189, __Tracesstar_tower_mgr189}}
	  when __Levelstar_tower_mgr189 band 64 /= 0 orelse
		 __Tracesstar_tower_mgr189 /= [] ->
	  lager:do_log(info,
		       [{module, star_tower_mgr}, {function, terminate},
			{line, 189}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelstar_tower_mgr189,
		       __Tracesstar_tower_mgr189, lager_event,
		       __Pidstar_tower_mgr189);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

get_replay() ->
    case get(star_tower_replay) of
      L when is_list(L) -> L;
      undefined -> []
    end.

init(StarTower, Repaly) ->
    #star_tower_replay{tower = StarTower,
		       replays =
			   [Repaly#tower_replay_data{type = 1},
			    Repaly#tower_replay_data{type = 2}]}.

ref(ReplayList, Repaly) ->
    ref(ReplayList, Repaly, [], false).

ref([], _Repaly, L, _) -> L;
ref([#tower_replay_data{type = 1, time = OldTime,
			repaly_id = Id}
     | ReplayList],
    Repaly = #tower_replay_data{repaly_id = RepalyId,
				time = Time},
    L, Flag)
    when Time < OldTime ->
    combat_replay_mgr:dec_replay_reference(Id),
    combat_replay_mgr:acc_replay_reference(RepalyId),
    ref(ReplayList, Repaly,
	[Repaly#tower_replay_data{type = 1} | L], Flag);
ref([#tower_replay_data{type = 2, power = OldPower,
			repaly_id = Id}
     | ReplayList],
    Repaly = #tower_replay_data{repaly_id = RepalyId,
				power = Power},
    L, Flag)
    when Power < OldPower ->
    combat_replay_mgr:dec_replay_reference(Id),
    combat_replay_mgr:acc_replay_reference(RepalyId),
    ref(ReplayList, Repaly,
	[Repaly#tower_replay_data{type = 2} | L], Flag);
ref([Data | ReplayList], Repaly, L, Flag) ->
    ref(ReplayList, Repaly, [Data | L], Flag).

do_del_replay(Id) ->
    Ms = [{{'$1', '$2', '$3'}, [{'=:=', '$2', Id}],
	   ['$1', '$2']}],
    case catch ets:select(star_tower_other, Ms) of
      [_ | _] -> ok;
      _ -> combat_replay_mgr:dec_replay_reference(Id)
    end.

do_del_replay2(RoleId, Tower) ->
    case star_tower_role_replays(RoleId, Tower) of
      undefined -> ok;
      {Id, _} -> combat_replay_mgr:dec_replay_reference(Id)
    end.

do_del_replay3(_RoleId, Start, End) when Start > End ->
    ok;
do_del_replay3(RoleId, 1, 1) ->
    case star_tower_role_replays(RoleId, 1) of
      {Id, _} -> combat_replay_mgr:dec_replay_reference(Id);
      _ -> ok
    end;
do_del_replay3(RoleId, Start, End) when Start == 1 ->
    case star_tower_role_replays(RoleId, Start) of
      {Id, _} ->
	  combat_replay_mgr:dec_replay_reference(Id),
	  do_del_replay3(RoleId, Start + 1, End);
      _ -> do_del_replay3(RoleId, End, End)
    end;
do_del_replay3(RoleId, Start, End) ->
    case star_tower_role_replays(RoleId, Start) of
      {Id, _} -> combat_replay_mgr:dec_replay_reference(Id);
      _ -> skip
    end,
    do_del_replay3(RoleId, Start + 1, End).


