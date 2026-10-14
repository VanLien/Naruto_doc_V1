-file("src/mod/element_temple/element_temple_mgr.erl",
      1).

-module(element_temple_mgr).

-lager_records([{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{m_element_temple,
		 [ver, combat_num, buy_num, refresh_num_time, end_time,
		  combat_list, privilege_free_num, privilege_buy_num]},
		{state, []}]).

-behaviour(gen_server).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([get_group/0]).

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

-file("src/mod/element_temple/element_temple_mgr.erl",
      15).

-file("inc/element_temple.hrl", 1).

-record(m_element_temple,
	{ver = 2, combat_num = 0, buy_num = 0,
	 refresh_num_time = 0, end_time = 0, combat_list = [],
	 privilege_free_num = 0, privilege_buy_num = 0}).

-file("src/mod/element_temple/element_temple_mgr.erl",
      16).

-file("inc/rank.hrl", 1).

-record(rank,
	{type = 0  :: non_neg_integer(), list = []  :: list(),
	 last_val = 0  :: non_neg_integer(),
	 len = 0  :: non_neg_integer(), is_cross = 0  :: 0 | 1,
	 ctime = 0  :: non_neg_integer()}).

-record(rank_rc,
	{ver = 3  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 idx = 0  :: non_neg_integer(),
	 val1 = 0  :: non_neg_integer(),
	 val2 = 0  :: non_neg_integer(),
	 val3 = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 look_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 guild_name = <<>>  :: bitstring(),
	 power = 0  :: non_neg_integer(),
	 all_power = 0  :: non_neg_integer(),
	 desc = <<>>  :: bitstring(), looks = []  :: list(),
	 ext = []  :: list(), time = 0  :: non_neg_integer(),
	 is_cross = false, avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(rank_cfg,
	{type = 0  :: non_neg_integer(),
	 num = 300  :: non_neg_integer(),
	 keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
	 min_val = 1  :: non_neg_integer(),
	 nologin = 0  :: non_neg_integer(),
	 zone = rank_zone_1  :: atom(), exit_rank = 0  :: 0..1}).

-file("src/mod/element_temple/element_temple_mgr.erl",
      17).

-file("inc/log.hrl", 1).

-file("src/mod/element_temple/element_temple_mgr.erl",
      18).

info(Info) -> element_temple_mgr ! Info.

cast(Info) -> gen_server:cast(element_temple_mgr, Info).

call(Info) ->
    case catch gen_server:call(element_temple_mgr, Info,
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
	    {__Pidelement_temple_mgr31, _,
	     {__Levelelement_temple_mgr31,
	      __Traceselement_temple_mgr31}}
		when __Levelelement_temple_mgr31 band 8 /= 0 orelse
		       __Traceselement_temple_mgr31 /= [] ->
		lager:do_log(error,
			     [{module, element_temple_mgr}, {function, call},
			      {line, 31}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [element_temple_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelelement_temple_mgr31,
			     __Traceselement_temple_mgr31, lager_event,
			     __Pidelement_temple_mgr31);
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
    gen_server:start_link({local, element_temple_mgr},
			  element_temple_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidelement_temple_mgr37, _,
       {__Levelelement_temple_mgr37,
	__Traceselement_temple_mgr37}}
	  when __Levelelement_temple_mgr37 band 64 /= 0 orelse
		 __Traceselement_temple_mgr37 /= [] ->
	  lager:do_log(info,
		       [{module, element_temple_mgr}, {function, init},
			{line, 37}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [element_temple_mgr]),
		       none, 4096, 64, __Levelelement_temple_mgr37,
		       __Traceselement_temple_mgr37, lager_event,
		       __Pidelement_temple_mgr37);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    State = #state{},
    Info = env_info(),
    case maps:get(endtime, Info, 0) of
      0 -> init_group();
      EndTime when is_integer(EndTime) ->
	  util:set_timer(reset_timer,
			 max(4, EndTime - date:unixtime()), reset)
    end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidelement_temple_mgr47, _,
       {__Levelelement_temple_mgr47,
	__Traceselement_temple_mgr47}}
	  when __Levelelement_temple_mgr47 band 64 /= 0 orelse
		 __Traceselement_temple_mgr47 /= [] ->
	  lager:do_log(info,
		       [{module, element_temple_mgr}, {function, init},
			{line, 47}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [element_temple_mgr]), none,
		       4096, 64, __Levelelement_temple_mgr47,
		       __Traceselement_temple_mgr47, lager_event,
		       __Pidelement_temple_mgr47);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(reset, State) ->
    Rank = #rank{list = List} = rank_mgr:lookup(40),
    send_rank_reward(List),
    log_rank:save(Rank),
    rank_mgr:clear([40]),
    init_group(),
    role_group:apply(world,
		     {element_temple, push_base, []}),
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
      {__Pidelement_temple_mgr70, _,
       {__Levelelement_temple_mgr70,
	__Traceselement_temple_mgr70}}
	  when __Levelelement_temple_mgr70 band 64 /= 0 orelse
		 __Traceselement_temple_mgr70 /= [] ->
	  lager:do_log(info,
		       [{module, element_temple_mgr}, {function, terminate},
			{line, 70}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelelement_temple_mgr70,
		       __Traceselement_temple_mgr70, lager_event,
		       __Pidelement_temple_mgr70);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

env_info() ->
    sys_env:get(element_temple_info_env,
		#{endtime => 0, current => [], history => []}).

save_env_info(Info) ->
    sys_env:save(element_temple_info_env, Info).

get_group() ->
    Info = env_info(), maps:get(current, Info, []).

init_group() ->
    Info = env_info(),
    History = maps:get(history, Info, []),
    Fun = fun (CampId, {CurrentT, HistoryT}) ->
		  GroupL = element_temple_data:group(CampId),
		  CampHistoryL = list_util:keyfind(CampId, HistoryT, []),
		  CanGroupL = GroupL -- CampHistoryL,
		  case CanGroupL of
		    [_ | _] ->
			GroupId = list_util:rand(CanGroupL),
			NewCurrentT = lists:keystore(CampId, 1, CurrentT,
						     {CampId, GroupId}),
			NewHistoryT = lists:keystore(CampId, 1, HistoryT,
						     {CampId,
						      [GroupId
						       | CampHistoryL]}),
			{NewCurrentT, NewHistoryT};
		    _ ->
			GroupId = list_util:rand(GroupL),
			NewCurrentT = lists:keystore(CampId, 1, CurrentT,
						     {CampId, GroupId}),
			NewHistoryT = lists:keystore(CampId, 1, HistoryT,
						     {CampId, [GroupId]}),
			{NewCurrentT, NewHistoryT}
		  end
	  end,
    {NewCurrent, NewHistory} = lists:foldl(Fun,
					   {[], History}, [1, 2, 3, 4, 5]),
    NewEndTime = date:unixtime() +
		   date:week_next_diff([1], {0, 0, 0}),
    NewInfo = Info#{endtime => NewEndTime,
		    current => NewCurrent, history => NewHistory},
    save_env_info(NewInfo),
    util:set_timer(reset_timer,
		   max(4, NewEndTime - date:unixtime()), reset),
    ok.

send_rank_reward([]) -> ok;
send_rank_reward([#rank_rc{id = Rid = {_, Sid},
			   idx = Idx}
		  | Rest]) ->
    case element_temple_data:rank_reward(Idx) of
      Cfg when is_list(Cfg) ->
	  catch cluster_lib:cast(Sid, room_feat_mgr, info,
				 [{element_temple_do_feat, Rid, Idx}]),
	  catch cluster_lib:cast(Sid, role_weekly_mgr, info,
				 [{element_rank, Rid, Idx}]),
	  mail:send(Rid,
		    {lang:get(<<"元素圣殿探索结算奖励"/utf8>>),
		     color:msg(lang:get(<<"亲爱的冒险者大人：恭喜您在上周元素圣殿的探索排名中获得了第~ts名的成绩，以下是您的排名奖励!"/utf8>>),
			       [{green, Idx}]),
		     items, Cfg, <<"元素圣殿"/utf8>>}),
	  send_rank_reward(Rest);
      Undef ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidelement_temple_mgr127, _,
	     {__Levelelement_temple_mgr127,
	      __Traceselement_temple_mgr127}}
		when __Levelelement_temple_mgr127 band 8 /= 0 orelse
		       __Traceselement_temple_mgr127 /= [] ->
		lager:do_log(error,
			     [{module, element_temple_mgr},
			      {function, send_rank_reward}, {line, 127},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("未知的元素圣殿奖励id:~w, Idx:~w, Undef:~w",
					   [Rid, Idx, Undef]),
			     none, 4096, 8, __Levelelement_temple_mgr127,
			     __Traceselement_temple_mgr127, lager_event,
			     __Pidelement_temple_mgr127);
	    _ -> ok
	  end,
	  ok
    end.


