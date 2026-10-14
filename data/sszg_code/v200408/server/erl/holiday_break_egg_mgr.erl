-file("src/mod/holiday/holiday_break_egg_mgr.erl", 1).

-module(holiday_break_egg_mgr).

-lager_records([{break_egg_data,
		 [id, rewards, rate, lev_min, lev_max, time_min,
		  time_max, is_record, is_notice, is_effect, role_max,
		  srv_max, hit_must_not_after_m_times,
		  not_hit_must_after_n_times]},
		{m_break_egg,
		 [ver, camp_id, lucky, refresh_time, break_time,
		  egg_type, last_list, each_list, logs]},
		{holiday,
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
		{state, []}]).

-behaviour(gen_server).

-export([get_log/0]).

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

-file("src/mod/holiday/holiday_break_egg_mgr.erl", 13).

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

-file("src/mod/holiday/holiday_break_egg_mgr.erl", 14).

-file("inc/break_egg.hrl", 1).

-record(m_break_egg,
	{ver = 1, camp_id = 0, lucky = 0, refresh_time = 0,
	 break_time = 0, egg_type = [], last_list = [],
	 each_list = [], logs = []}).

-record(break_egg_data,
	{id = 0, rewards = [], rate = 0, lev_min = 0,
	 lev_max = 0, time_min = 0, time_max = 0, is_record = 0,
	 is_notice = 0, is_effect = 0, role_max = 0, srv_max = 0,
	 hit_must_not_after_m_times = 0,
	 not_hit_must_after_n_times = 0}).

-file("src/mod/holiday/holiday_break_egg_mgr.erl", 15).

info(Info) -> holiday_break_egg_mgr ! Info.

cast(Info) ->
    gen_server:cast(holiday_break_egg_mgr, Info).

call(Info) ->
    case catch gen_server:call(holiday_break_egg_mgr, Info,
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
	    {__Pidholiday_break_egg_mgr24, _,
	     {__Levelholiday_break_egg_mgr24,
	      __Tracesholiday_break_egg_mgr24}}
		when __Levelholiday_break_egg_mgr24 band 8 /= 0 orelse
		       __Tracesholiday_break_egg_mgr24 /= [] ->
		lager:do_log(error,
			     [{module, holiday_break_egg_mgr}, {function, call},
			      {line, 24}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holiday_break_egg_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_break_egg_mgr24,
			     __Tracesholiday_break_egg_mgr24, lager_event,
			     __Pidholiday_break_egg_mgr24);
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
    gen_server:start_link({local, holiday_break_egg_mgr},
			  holiday_break_egg_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_break_egg_mgr30, _,
       {__Levelholiday_break_egg_mgr30,
	__Tracesholiday_break_egg_mgr30}}
	  when __Levelholiday_break_egg_mgr30 band 64 /= 0 orelse
		 __Tracesholiday_break_egg_mgr30 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_break_egg_mgr}, {function, init},
			{line, 30}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [holiday_break_egg_mgr]),
		       none, 4096, 64, __Levelholiday_break_egg_mgr30,
		       __Tracesholiday_break_egg_mgr30, lager_event,
		       __Pidholiday_break_egg_mgr30);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    State = #state{},
    dets:open_file(holiday_break_egg_log,
		   [{file, "./dets/holiday_break_egg_log.dets"},
		    {keypos, 1}]),
    ets:new(holiday_break_egg_log,
	    [set, named_table, public, {keypos, 1}]),
    dets:to_ets(holiday_break_egg_log,
		holiday_break_egg_log),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_break_egg_mgr37, _,
       {__Levelholiday_break_egg_mgr37,
	__Tracesholiday_break_egg_mgr37}}
	  when __Levelholiday_break_egg_mgr37 band 64 /= 0 orelse
		 __Tracesholiday_break_egg_mgr37 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_break_egg_mgr}, {function, init},
			{line, 37}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [holiday_break_egg_mgr]),
		       none, 4096, 64, __Levelholiday_break_egg_mgr37,
		       __Tracesholiday_break_egg_mgr37, lager_event,
		       __Pidholiday_break_egg_mgr37);
      _ -> ok
    end,
    {ok, State}.

handle_call({get_env_info, CampId}, _From, State) ->
    Reply = env_info(CampId), {reply, Reply, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({add, Id}, State) ->
    case get_open_holiday() of
      #holiday{camp_id = CampId} ->
	  List = env_info(CampId),
	  {_, Count} = list_util:keyfind(Id, 1, List, {Id, 0}),
	  NewCount = Count + 1,
	  NewList = lists:keystore(Id, 1, List, {Id, NewCount}),
	  save(CampId, NewList),
	  ok;
      _ -> skip
    end,
    {noreply, State};
handle_info({add_list, Ids}, State) ->
    case get_open_holiday() of
      #holiday{camp_id = CampId} ->
	  List = env_info(CampId),
	  Fun = fun (Id, Acc) ->
			case lists:keyfind(Id, 1, Acc) of
			  {Id, Count} ->
			      lists:keystore(Id, 1, Acc, {Id, Count + 1});
			  _ -> lists:keystore(Id, 1, Acc, {Id, 1})
			end
		end,
	  NewList = lists:foldl(Fun, List, Ids),
	  save(CampId, NewList),
	  ok;
      _ -> skip
    end,
    {noreply, State};
handle_info({add_log, _ConnPid, AddLogs}, State) ->
    case get_open_holiday() of
      #holiday{camp_id = CampId} ->
	  Logs = get_log(CampId),
	  NewLogs = lists:sublist(AddLogs ++ Logs,
				  break_egg_data:get_const(record_len)),
	  ets:insert(holiday_break_egg_log, {CampId, NewLogs}),
	  role_group:pack_send(world, 16685, {2, NewLogs});
      _ -> ok
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
      {__Pidholiday_break_egg_mgr99, _,
       {__Levelholiday_break_egg_mgr99,
	__Tracesholiday_break_egg_mgr99}}
	  when __Levelholiday_break_egg_mgr99 band 64 /= 0 orelse
		 __Tracesholiday_break_egg_mgr99 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_break_egg_mgr}, {function, terminate},
			{line, 99}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelholiday_break_egg_mgr99,
		       __Tracesholiday_break_egg_mgr99, lager_event,
		       __Pidholiday_break_egg_mgr99);
      _ -> ok
    end,
    dets:insert(holiday_break_egg_log,
		ets:tab2list(holiday_break_egg_log)),
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

-spec get_log() -> list().

get_log() ->
    case get_open_holiday() of
      #holiday{camp_id = CampId} -> get_log(CampId);
      _ -> []
    end.

get_log(CampId) ->
    case ets:lookup(holiday_break_egg_log, CampId) of
      [{CampId, Logs}] -> Logs;
      _ -> []
    end.

env_info(CampId) ->
    sys_env:get({holiday_break_egg_mgr, CampId}, []).

save(CampId, Val) ->
    sys_env:save({holiday_break_egg_mgr, CampId}, Val).

get_open_holiday() ->
    Bids = [3024, 93024, 993024],
    holiday_lib:get_open_holiday(Bids).


