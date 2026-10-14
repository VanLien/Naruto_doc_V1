-file("src/mod/holiday_snatch/holiday_snatch_mgr.erl",
      1).

-module(holiday_snatch_mgr).

-lager_records([{holiday,
		 [camp_id, total_id, bid, tbid, cli_type, cli_type_name,
		  start_time, end_time, condition, type, title, title2,
		  main_ico, ico, type_ico, top_banner, rule_str, time_str,
		  bottom_alert, sort_val, reward_title, aim_title, reward,
		  item_effect, mail_subject, mail_content, cli_reward,
		  panel_type, open_day, open_day_min, open_day_max,
		  merge_day, process_show_reward, platform_id,
		  platform_exclude_id, hide_srv_ids, channel_ban]},
		{holiday_total,
		 [id, name, icon_id, start_time, end_time, status,
		  open_day, merge_day, is_show, type]},
		{holiday_snatch_log,
		 [log_id, win_num, win_role_info, join_num, max_num,
		  time, award, award_name, ext]},
		{holiday_snatch_role_info,
		 [sid, num, open_srv_time, merge_srvs, ext]},
		{holiday_snatch_info,
		 [pos, round, id, num, num_list, win_num, state,
		  state_time, rand_list, win_role_info, ext]},
		{holiday_snatch, [zone_id, info, ext]},
		{m_holiday_snatch,
		 [ver, camp_id, buy_log, old_data, ext]},
		{state, [type, zone_pid]}]).

-behaviour(gen_server).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([get_info/0, get_log/0]).

-record(state, {type = cluster, zone_pid = 0}).

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

-file("src/mod/holiday_snatch/holiday_snatch_mgr.erl",
      16).

-file("inc/holiday_snatch.hrl", 1).

-record(m_holiday_snatch,
	{ver = 1, camp_id = 0, buy_log = [], old_data = [],
	 ext = []}).

-record(holiday_snatch,
	{zone_id = 0, info = [], ext = []}).

-record(holiday_snatch_info,
	{pos = 0, round = 1, id = 0, num = 0, num_list = [],
	 win_num = 0, state = 0, state_time = 0, rand_list = [],
	 win_role_info = #{}, ext = []}).

-record(holiday_snatch_role_info,
	{sid = <<>>, num = 0, open_srv_time = 0,
	 merge_srvs = [], ext = []}).

-record(holiday_snatch_log,
	{log_id = {0, 0}, win_num = 0, win_role_info = #{},
	 join_num = 0, max_num = 0, time = 0, award = [],
	 award_name = <<>>, ext = []}).

-file("src/mod/holiday_snatch/holiday_snatch_mgr.erl",
      17).

-file("inc/holiday.hrl", 1).

-record(holiday_total,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 icon_id = 0  :: non_neg_integer(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 is_show = 0  :: 0..1, type = 0  :: 0..2}).

-record(holiday,
	{camp_id = 0  :: non_neg_integer(),
	 total_id = 0  :: non_neg_integer(),
	 bid = 0  :: non_neg_integer(),
	 tbid = 0  :: non_neg_integer(),
	 cli_type = 0  :: non_neg_integer(),
	 cli_type_name = <<>>  :: binary(),
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(), condition = [],
	 type = 0  :: 0..2, title = <<>>  :: bitstring(),
	 title2 = <<>>  :: bitstring(),
	 main_ico = 0  :: pos_integer() | tuple(),
	 ico = <<>>  :: bitstring(),
	 type_ico = 0  :: non_neg_integer(),
	 top_banner = <<>>  :: bitstring(),
	 rule_str = <<>>  :: bitstring(),
	 time_str = <<>>  :: bitstring(),
	 bottom_alert = <<>>  :: bitstring(),
	 sort_val = 0  :: non_neg_integer(),
	 reward_title = <<>>  :: bitstring(),
	 aim_title = <<>>  :: bitstring(),
	 reward = []  :: list(), item_effect = []  :: list(),
	 mail_subject = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring(),
	 cli_reward = <<>>  :: bitstring(),
	 panel_type = 0  :: non_neg_integer(),
	 open_day = 0  :: non_neg_integer(),
	 open_day_min = 0  :: non_neg_integer(),
	 open_day_max = 0  :: non_neg_integer(),
	 merge_day = 0  :: non_neg_integer(),
	 process_show_reward = 0  :: non_neg_integer(),
	 platform_id = []  :: list(),
	 platform_exclude_id = []  :: list(), hide_srv_ids = [],
	 channel_ban = <<>>  :: bitstring()}).

-file("src/mod/holiday_snatch/holiday_snatch_mgr.erl",
      18).

get_info() ->
    case ets:lookup(holiday_snatch_info, info) of
      [{info, Infos} | _] -> Infos;
      _ -> []
    end.

get_log() ->
    case ets:lookup(holiday_snatch_info, logs) of
      [{logs, Logs} | _] -> Logs;
      _ -> []
    end.

info(Info) -> holiday_snatch_mgr ! Info.

cast(Info) -> gen_server:cast(holiday_snatch_mgr, Info).

call(Info) ->
    case catch gen_server:call(holiday_snatch_mgr, Info,
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
	    {__Pidholiday_snatch_mgr41, _,
	     {__Levelholiday_snatch_mgr41,
	      __Tracesholiday_snatch_mgr41}}
		when __Levelholiday_snatch_mgr41 band 8 /= 0 orelse
		       __Tracesholiday_snatch_mgr41 /= [] ->
		lager:do_log(error,
			     [{module, holiday_snatch_mgr}, {function, call},
			      {line, 41}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holiday_snatch_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_snatch_mgr41,
			     __Tracesholiday_snatch_mgr41, lager_event,
			     __Pidholiday_snatch_mgr41);
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
    gen_server:start_link({local, holiday_snatch_mgr},
			  holiday_snatch_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_snatch_mgr47, _,
       {__Levelholiday_snatch_mgr47,
	__Tracesholiday_snatch_mgr47}}
	  when __Levelholiday_snatch_mgr47 band 64 /= 0 orelse
		 __Tracesholiday_snatch_mgr47 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_snatch_mgr}, {function, init},
			{line, 47}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [holiday_snatch_mgr]),
		       none, 4096, 64, __Levelholiday_snatch_mgr47,
		       __Tracesholiday_snatch_mgr47, lager_event,
		       __Pidholiday_snatch_mgr47);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    ets:new(holiday_snatch_info,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(holiday_snatch_log,
	    [set, named_table, public, {keypos, 1}]),
    put(arena_elite_update_zone_info,
	erlang:send_after(360 * 1000 + util:rand(1, 180000),
			  self(), update_zone_role_info)),
    put(arena_elite_update_log,
	erlang:send_after(360 * 1000 + util:rand(1, 180000),
			  self(), update_zone_log)),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_snatch_mgr61, _,
       {__Levelholiday_snatch_mgr61,
	__Tracesholiday_snatch_mgr61}}
	  when __Levelholiday_snatch_mgr61 band 64 /= 0 orelse
		 __Tracesholiday_snatch_mgr61 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_snatch_mgr}, {function, init},
			{line, 61}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [holiday_snatch_mgr]), none,
		       4096, 64, __Levelholiday_snatch_mgr61,
		       __Tracesholiday_snatch_mgr61, lager_event,
		       __Pidholiday_snatch_mgr61);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(update_zone_log,
	    State = #state{zone_pid = ZonePid}) ->
    catch ZonePid ! {update_log, self()},
    put(arena_elite_update_log,
	erlang:send_after(3600 * 1000 + util:rand(1, 1800000),
			  self(), update_zone_log)),
    {noreply, State};
handle_info(update_zone_role_info, State = #state{}) ->
    SrvId = sys_lib:srv_id(),
    Num = get_alive_num(),
    OPenTime = sys_env:get(open_timestamp),
    big_world_lib:cast(center_all, c_holiday_snatch_mgr,
		       info,
		       [{update_zone_role_info, {SrvId, Num, OPenTime, []}}]),
    case big_world_lib:center_node() ==
	   cluster_lib:center_node()
	of
      true -> skip;
      _ ->
	  cluster_lib:cast(center, c_holiday_snatch_mgr, info,
			   [{update_zone_role_info,
			     {SrvId, Num, OPenTime, []}}])
    end,
    {noreply, State};
handle_info({sync_data, cluster},
	    State = #state{type = big_world}) ->
    {noreply, State};
handle_info({sync_data, cluster}, State) ->
    cluster_lib:cast(center, c_holiday_snatch_mgr, info,
		     [{sync_data, sys_lib:srv_id(), self()}]),
    {noreply, State};
handle_info({sync_data, big_world}, State) ->
    big_world_lib:cast(center, c_holiday_snatch_mgr, info,
		       [{sync_data, sys_lib:srv_id(), self()}]),
    {noreply, State};
handle_info({sync_status_to_zone, _StateName, _Ts,
	     _TimeOut, _ZonePid, cluster},
	    State = #state{type = big_world}) ->
    {noreply, State};
handle_info({sync_status_to_zone, StateName, Ts,
	     TimeOut, ZonePid, Type},
	    State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_snatch_mgr104, _,
       {__Levelholiday_snatch_mgr104,
	__Tracesholiday_snatch_mgr104}}
	  when __Levelholiday_snatch_mgr104 band 64 /= 0 orelse
		 __Tracesholiday_snatch_mgr104 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_snatch_mgr}, {function, handle_info},
			{line, 104}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("同步了~w数据, 当前处在~w",
				     [Type, State#state.type]),
		       none, 4096, 64, __Levelholiday_snatch_mgr104,
		       __Tracesholiday_snatch_mgr104, lager_event,
		       __Pidholiday_snatch_mgr104);
      _ -> ok
    end,
    sys_env:save(holiday_snatch_state,
		 {StateName, Ts, TimeOut}),
    catch ZonePid ! {sync_data, self()},
    sys_env:save(holiday_snatch_pid, ZonePid),
    push_info(),
    {noreply, State#state{type = Type, zone_pid = ZonePid}};
handle_info({sync_status_to_zone2, _StateName, _Ts,
	     _TimeOut, cluster},
	    State = #state{type = big_world}) ->
    {noreply, State};
handle_info({sync_status_to_zone2, StateName, Ts,
	     TimeOut, Type},
	    State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_snatch_mgr113, _,
       {__Levelholiday_snatch_mgr113,
	__Tracesholiday_snatch_mgr113}}
	  when __Levelholiday_snatch_mgr113 band 64 /= 0 orelse
		 __Tracesholiday_snatch_mgr113 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_snatch_mgr}, {function, handle_info},
			{line, 113}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("同步了~w数据, 当前处在~w",
				     [Type, State#state.type]),
		       none, 4096, 64, __Levelholiday_snatch_mgr113,
		       __Tracesholiday_snatch_mgr113, lager_event,
		       __Pidholiday_snatch_mgr113);
      _ -> ok
    end,
    sys_env:save(holiday_snatch_state,
		 {StateName, Ts, TimeOut}),
    push_info(),
    {noreply, State#state{type = Type}};
handle_info({update_zone_pid, _ZonePid, cluster},
	    State = #state{type = big_world}) ->
    {noreply, State};
handle_info({update_zone_pid, ZonePid, Type}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_snatch_mgr122, _,
       {__Levelholiday_snatch_mgr122,
	__Tracesholiday_snatch_mgr122}}
	  when __Levelholiday_snatch_mgr122 band 64 /= 0 orelse
		 __Tracesholiday_snatch_mgr122 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_snatch_mgr}, {function, handle_info},
			{line, 122}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("同步了~w数据, 当前处在~w",
				     [Type, State#state.type]),
		       none, 4096, 64, __Levelholiday_snatch_mgr122,
		       __Tracesholiday_snatch_mgr122, lager_event,
		       __Pidholiday_snatch_mgr122);
      _ -> ok
    end,
    sys_env:save(holiday_snatch_pid, ZonePid),
    catch ZonePid ! {sync_data, self()},
    {noreply, State#state{zone_pid = ZonePid}};
handle_info({sync_status_to_zone_by_zone, _Flag,
	     _PushInfo, cluster, _ZonePid},
	    State = #state{type = big_world}) ->
    {noreply, State};
handle_info({sync_status_to_zone_by_zone, Flag,
	     PushInfo, Type, ZonePid},
	    State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_snatch_mgr129, _,
       {__Levelholiday_snatch_mgr129,
	__Tracesholiday_snatch_mgr129}}
	  when __Levelholiday_snatch_mgr129 band 64 /= 0 orelse
		 __Tracesholiday_snatch_mgr129 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_snatch_mgr}, {function, handle_info},
			{line, 129}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("同步了~w数据, 当前处在~w",
				     [Type, State#state.type]),
		       none, 4096, 64, __Levelholiday_snatch_mgr129,
		       __Tracesholiday_snatch_mgr129, lager_event,
		       __Pidholiday_snatch_mgr129);
      _ -> ok
    end,
    ets:insert(holiday_snatch_info, {info, PushInfo}),
    push_info(),
    sys_env:save(holiday_snatch_pid, ZonePid),
    case sys_env:get(holiday_snatch_state) of
      {open, _, _} when Flag == 1 ->
	  case holiday_lib:get_open_holiday([3029, 93029, 993029])
	      of
	    #holiday{} ->
		Msg =
		    color:msg(lang:get(<<"勇者夺宝活动宝物又刷新了，快来参与吧，下一名幸运儿就是你！~ts"/utf8>>),
			      [{href,
				{60, green, [], lang:get(<<"【前往查看】"/utf8>>)}}]),
		notice:broadcast(world, undefined, rumor_left_top, Msg);
	    _ -> ok
	  end;
      _ -> ok
    end,
    {noreply, State};
handle_info({sync_status_to_zone_by_zone_one, _Flag,
	     _Info, cluster, _ZonePid},
	    State = #state{type = big_world}) ->
    {noreply, State};
handle_info({sync_status_to_zone_by_zone_one, Flag,
	     Info = #holiday_snatch_info{pos = Pos}, Type, ZonePid},
	    State) ->
    PushInfo = get_info(),
    NewPushInfo = lists:keystore(Pos,
				 #holiday_snatch_info.pos, PushInfo, Info),
    ets:insert(holiday_snatch_info, {info, NewPushInfo}),
    push_info(),
    sys_env:save(holiday_snatch_pid, ZonePid),
    case sys_env:get(holiday_snatch_state) of
      {open, _, _} when Flag == 1 ->
	  case holiday_lib:get_open_holiday([3029, 93029, 993029])
	      of
	    #holiday{} ->
		Msg =
		    color:msg(lang:get(<<"勇者夺宝活动宝物又刷新了，快来参与吧，下一名幸运儿就是你！~ts"/utf8>>),
			      [{href,
				{60, green, [], lang:get(<<"【前往查看】"/utf8>>)}}]),
		notice:broadcast(world, undefined, rumor_left_top, Msg);
	    _ -> ok
	  end;
      _ -> ok
    end,
    {noreply, State};
handle_info({update_log, Logs}, State) ->
    ets:insert(holiday_snatch_info,
	       {logs, lists:sublist(Logs, 300)}),
    push_info(),
    {noreply, State};
handle_info({add_new_log, Log}, State) ->
    Logs = get_log(),
    ets:insert(holiday_snatch_info,
	       {logs, lists:sublist([Log | Logs], 300)}),
    push_info(),
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
      {__Pidholiday_snatch_mgr182, _,
       {__Levelholiday_snatch_mgr182,
	__Tracesholiday_snatch_mgr182}}
	  when __Levelholiday_snatch_mgr182 band 64 /= 0 orelse
		 __Tracesholiday_snatch_mgr182 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_snatch_mgr}, {function, terminate},
			{line, 182}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelholiday_snatch_mgr182,
		       __Tracesholiday_snatch_mgr182, lager_event,
		       __Pidholiday_snatch_mgr182);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

push_info() ->
    case holiday_lib:get_open_holiday([3029, 93029, 993029])
	of
      #holiday{} ->
	  role_group:apply(world, {holiday_snatch_lib, info, []});
      _ -> ok
    end.

get_alive_num() ->
    MinLev = 10,
    LimitDday = holiday_snatch_data:get_constant(alive_day),
    LimitTime = date:unixtime() - 86400 * LimitDday,
    case db:get_one("select count(*) from role where lev "
		    ">= ? and (logout_time > ? or login_time "
		    "> ?)",
		    [MinLev, LimitTime, LimitTime], 60000)
	of
      {ok, Num} -> Num;
      _ -> 0
    end.


