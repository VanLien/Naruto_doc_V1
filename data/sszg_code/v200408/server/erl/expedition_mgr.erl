-file("src/mod/expedition/expedition_mgr.erl", 1).

-module(expedition_mgr).

-lager_records([{expedition_replay_partner,
		 [pos, bid, lev, star, ext]},
		{expedition_replay,
		 [id, round, ret, time, difficulty, guard_id, a_id,
		  a_name, a_lev, a_power, a_formation_type, a_end_hp,
		  b_id, b_name, b_lev, b_power, b_formation_type,
		  b_end_hp, a_plist, b_plist, ext]},
		{expedition_log, [id, list]},
		{expedition_employ_p,
		 [id, bid, lev, star, quality, break_lev, power, num,
		  ext]},
		{expedition_employ, [rid, rname, num, list]},
		{expedition_f_pos,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, ext]},
		{expedition_f,
		 [id, type, robot_id, role_id, name, lev, face, power,
		  hallows_id, formation_type, items, guards, partner_hp,
		  status]},
		{m_expedition,
		 [ver, guard_id, partner_hp, list, employ, appoint,
		  difficulty, max_difficulty, last_join_time,
		  last_difficulty, max_power]},
		{state, [timer]}]).

-behaviour(gen_server).

-export([update_data/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {timer = undefined}).

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

-file("src/mod/expedition/expedition_mgr.erl", 16).

-file("inc/expedition.hrl", 1).

-record(m_expedition,
	{ver = 2, guard_id = 0, partner_hp = [], list = [],
	 employ = [], appoint = [], difficulty = 0,
	 max_difficulty = 0, last_join_time = 0,
	 last_difficulty = {0, 0}, max_power = 0}).

-record(expedition_f,
	{id = 1  :: 1..100, type = 1, robot_id = 0,
	 role_id = {0, <<>>}  :: tuple(),
	 name = <<>>  :: bitstring(),
	 lev = 0  :: non_neg_integer(),
	 face = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(),
	 hallows_id = 0  :: non_neg_integer(),
	 formation_type = 0  :: non_neg_integer(),
	 items = []  :: list(), guards = []  :: list(),
	 partner_hp = []  :: list(), status = 0  :: 0..2}).

-record(expedition_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, ext = []}).

-record(expedition_employ,
	{rid = {0, <<>>}, rname = <<>>, num = 0, list = []}).

-record(expedition_employ_p,
	{id = 0, bid = 0, lev = 0, star = 0, quality = 0,
	 break_lev = 0, power = 0, num = 0, ext = []}).

-record(expedition_log,
	{id = {{0, <<>>}, 0}, list = []}).

-record(expedition_replay,
	{id = 0, round = 0, ret = 0, time = 0, difficulty = 0,
	 guard_id = 0, a_id = {0, <<>>}, a_name = <<>>,
	 a_lev = 0, a_power = 0, a_formation_type = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_name = <<>>,
	 b_lev = 0, b_power = 0, b_formation_type = 0,
	 b_end_hp = 0, a_plist = [], b_plist = [], ext = []}).

-record(expedition_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-file("src/mod/expedition/expedition_mgr.erl", 17).

-file("inc/log.hrl", 1).

-file("src/mod/expedition/expedition_mgr.erl", 18).

info(Info) -> expedition_mgr ! Info.

cast(Info) -> gen_server:cast(expedition_mgr, Info).

call(Info) ->
    case catch gen_server:call(expedition_mgr, Info, 10000)
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
	    {__Pidexpedition_mgr27, _,
	     {__Levelexpedition_mgr27, __Tracesexpedition_mgr27}}
		when __Levelexpedition_mgr27 band 8 /= 0 orelse
		       __Tracesexpedition_mgr27 /= [] ->
		lager:do_log(error,
			     [{module, expedition_mgr}, {function, call},
			      {line, 27}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [expedition_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelexpedition_mgr27,
			     __Tracesexpedition_mgr27, lager_event,
			     __Pidexpedition_mgr27);
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
    gen_server:start_link({local, expedition_mgr},
			  expedition_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidexpedition_mgr33, _,
       {__Levelexpedition_mgr33, __Tracesexpedition_mgr33}}
	  when __Levelexpedition_mgr33 band 64 /= 0 orelse
		 __Tracesexpedition_mgr33 /= [] ->
	  lager:do_log(info,
		       [{module, expedition_mgr}, {function, init}, {line, 33},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [expedition_mgr]), none,
		       4096, 64, __Levelexpedition_mgr33,
		       __Tracesexpedition_mgr33, lager_event,
		       __Pidexpedition_mgr33);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(expedition_employ,
		   [{file, "./dets/expedition_employ.dets"},
		    {keypos, #expedition_employ.rid}]),
    ets:new(expedition_employ,
	    [set, named_table, public,
	     {keypos, #expedition_employ.rid}]),
    dets:to_ets(expedition_employ, expedition_employ),
    dets:open_file(expedition_log,
		   [{file, "./dets/expedition_log.dets"},
		    {keypos, #expedition_log.id}]),
    ets:new(expedition_log,
	    [set, named_table, public,
	     {keypos, #expedition_log.id}]),
    dets:to_ets(expedition_log, expedition_log),
    Ref = erlang:send_after(date:next_diff(0, 0, 0) * 1000 +
			      util:rand(1, 3000),
			    expedition_mgr, send_reward),
    NextDiff = date:next_diff({4, 0, 0}),
    util:set_timer(del_expedition_log_timer,
		   NextDiff + util:rand(100, 1000), del_overdue_log),
    State = #state{timer = Ref},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidexpedition_mgr48, _,
       {__Levelexpedition_mgr48, __Tracesexpedition_mgr48}}
	  when __Levelexpedition_mgr48 band 64 /= 0 orelse
		 __Tracesexpedition_mgr48 /= [] ->
	  lager:do_log(info,
		       [{module, expedition_mgr}, {function, init}, {line, 48},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [expedition_mgr]), none,
		       4096, 64, __Levelexpedition_mgr48,
		       __Tracesexpedition_mgr48, lager_event,
		       __Pidexpedition_mgr48);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({employ, RoleId, PId}, State) ->
    case ets:lookup(expedition_employ, RoleId) of
      [E = #expedition_employ{list = List, num = AccNum}] ->
	  case lists:keyfind(PId, #expedition_employ_p.id, List)
	      of
	    EP = #expedition_employ_p{num = Num} ->
		NewEP = EP#expedition_employ_p{num = Num + 1},
		NewList = lists:keyreplace(PId, #expedition_employ_p.id,
					   List, NewEP),
		NewE = E#expedition_employ{list = NewList,
					   num = AccNum + 1},
		update_data(NewE);
	    _ -> skip
	  end;
      _ -> skip
    end,
    {noreply, State};
handle_info(send_reward,
	    State = #state{timer = Timer}) ->
    cancel_timer(Timer),
    List = ets:tab2list(expedition_employ),
    send_reward(List),
    ets:delete_all_objects(expedition_employ),
    dets:delete_all_objects(expedition_employ),
    Ref = erlang:send_after(date:next_diff(0, 0, 0) * 1000 +
			      util:rand(1, 3000),
			    expedition_mgr, send_reward),
    {noreply, State#state{timer = Ref}};
handle_info({add_log, RoleId, GuardId,
	     LogData = #expedition_replay{id = NReplayId}},
	    State) ->
    OldLog = #expedition_log{list = Logs} =
		 expedition:get_log(RoleId, GuardId),
    combat_replay_mgr:acc_replay_reference(NReplayId),
    {NewLogs, DelLogs} = list_util:split(20,
					 [LogData | Logs]),
    [combat_replay_mgr:dec_replay_reference(ReplayId)
     || #expedition_replay{id = ReplayId} <- DelLogs],
    ets:insert(expedition_log,
	       OldLog#expedition_log{list = NewLogs}),
    {noreply, State};
handle_info(del_overdue_log, State) ->
    try ZeroTime = date:unixtime(zero),
	Fun = fun (RL = #expedition_log{list = Logs}, Acc) ->
		      {NewLogs, DelLogs} = lists:partition(fun
							     (#expedition_replay{time
										     =
										     Time}) ->
								 Time > ZeroTime
							   end,
							   Logs),
		      [combat_replay_mgr:dec_replay_reference(Temp)
		       || #expedition_replay{id = Temp} <- DelLogs],
		      case NewLogs of
			[_ | _] ->
			    NewRL = RL#expedition_log{list = NewLogs},
			    [NewRL | Acc];
			_ -> Acc
		      end;
		  (_, Acc) -> Acc
	      end,
	L = ets:foldl(Fun, [], expedition_log),
	dets:delete_all_objects(expedition_log),
	ets:delete_all_objects(expedition_log),
	ets:insert(expedition_log, L),
	NextDiff = date:next_diff({4, 0, 0}),
	util:set_timer(del_expedition_log_timer,
		       NextDiff + util:rand(100, 1000), del_overdue_log)
    catch
      _TryC:_TryE ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidexpedition_mgr112, _,
	     {__Levelexpedition_mgr112, __Tracesexpedition_mgr112}}
		when __Levelexpedition_mgr112 band 8 /= 0 orelse
		       __Tracesexpedition_mgr112 /= [] ->
		lager:do_log(error,
			     [{module, expedition_mgr}, {function, handle_info},
			      {line, 112}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("出错啦:~w : ~w error:~w",
					   [_TryC, _TryE,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelexpedition_mgr112,
			     __Tracesexpedition_mgr112, lager_event,
			     __Pidexpedition_mgr112);
	    _ -> ok
	  end
    end,
    {noreply, State};
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
      {__Pidexpedition_mgr119, _,
       {__Levelexpedition_mgr119, __Tracesexpedition_mgr119}}
	  when __Levelexpedition_mgr119 band 64 /= 0 orelse
		 __Tracesexpedition_mgr119 /= [] ->
	  lager:do_log(info,
		       [{module, expedition_mgr}, {function, terminate},
			{line, 119}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelexpedition_mgr119,
		       __Tracesexpedition_mgr119, lager_event,
		       __Pidexpedition_mgr119);
      _ -> ok
    end,
    d_ets_lib:save(expedition_log),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

send_reward([]) -> ok;
send_reward([#expedition_employ{rid = Rid, num = Num}
	     | Rest]) ->
    case Num > 0 of
      true ->
	  Cfg = [{ItemId, Val * Num}
		 || {ItemId, Val} <- expedition_data:get_const(drop)],
	  mail:send(Rid,
		    {lang:get(<<"远征派遣奖励"/utf8>>),
		     color:msg(lang:get(<<"尊敬的冒险者大人，您在远征中派遣的英雄共被借用~ts次，以下为所获奖励，请查收！"/utf8>>),
			       [{green, Num}]),
		     items, Cfg, <<"远征"/utf8>>}),
	  send_reward(Rest);
      _ -> send_reward(Rest)
    end;
send_reward([_Err | Rest]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidexpedition_mgr138, _,
       {__Levelexpedition_mgr138, __Tracesexpedition_mgr138}}
	  when __Levelexpedition_mgr138 band 8 /= 0 orelse
		 __Tracesexpedition_mgr138 /= [] ->
	  lager:do_log(error,
		       [{module, expedition_mgr}, {function, send_reward},
			{line, 138}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("错误的远征雇佣格式 [~w]", [_Err]), none, 4096, 8,
		       __Levelexpedition_mgr138, __Tracesexpedition_mgr138,
		       lager_event, __Pidexpedition_mgr138);
      _ -> ok
    end,
    send_reward(Rest).

-spec update_data(Data :: [tuple()] | tuple()) -> ok.

update_data(Data) ->
    ets:insert(expedition_employ, Data),
    dets:insert(expedition_employ, Data),
    ok.

cancel_timer(Ref) when is_reference(Ref) ->
    catch erlang:cancel_timer(Ref), ok;
cancel_timer(_Ref) -> ok.


