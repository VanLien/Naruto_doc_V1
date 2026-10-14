-file("src/mod/holiday_lucky_dog/holiday_lucky_dog_m"
      "gr.erl",
      1).

-module(holiday_lucky_dog_mgr).

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
		{holiday_lucky_dog_info,
		 [ver, camp_id, period, status, lucky_dog, ext]},
		{holiday_lucky_dog_quest,
		 [quest_id, val, num, lucky_type, finish, ext]},
		{m_holiday_lucky_dog, [ver, camp_id, info, ext]},
		{state, []}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([get_info/1]).

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

-file("src/mod/holiday_lucky_dog/holiday_lucky_dog_m"
      "gr.erl",
      16).

-file("inc/holiday_lucky_dog.hrl", 1).

-record(m_holiday_lucky_dog,
	{ver = 1, camp_id = 0, info = [], ext = []}).

-record(holiday_lucky_dog_quest,
	{quest_id = 0, val = 0, num = 0, lucky_type = 0,
	 finish = 0, ext = []}).

-record(holiday_lucky_dog_info,
	{ver = 1, camp_id = 0, period = 0, status = 0,
	 lucky_dog = [], ext = []}).

-file("src/mod/holiday_lucky_dog/holiday_lucky_dog_m"
      "gr.erl",
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

-file("src/mod/holiday_lucky_dog/holiday_lucky_dog_m"
      "gr.erl",
      18).

-spec get_info(pos_integer()) -> {pos_integer(),
				  list()}.

get_info(CampId) ->
    case ets:lookup(holiday_lucky_dog_info, CampId) of
      [#holiday_lucky_dog_info{period = Period,
			       lucky_dog = Lists, status = Status}
       | _] ->
	  {Period, Status, Lists};
      _ -> info(do_init_holiday), {1, 0, []}
    end.

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> holiday_lucky_dog_mgr ! Info.

cast(Info) ->
    gen_server:cast(holiday_lucky_dog_mgr, Info).

call(Info) ->
    case catch gen_server:call(holiday_lucky_dog_mgr, Info,
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
	    {__Pidholiday_lucky_dog_mgr45, _,
	     {__Levelholiday_lucky_dog_mgr45,
	      __Tracesholiday_lucky_dog_mgr45}}
		when __Levelholiday_lucky_dog_mgr45 band 8 /= 0 orelse
		       __Tracesholiday_lucky_dog_mgr45 /= [] ->
		lager:do_log(error,
			     [{module, holiday_lucky_dog_mgr}, {function, call},
			      {line, 45}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holiday_lucky_dog_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_lucky_dog_mgr45,
			     __Tracesholiday_lucky_dog_mgr45, lager_event,
			     __Pidholiday_lucky_dog_mgr45);
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
    gen_server:start_link({local, holiday_lucky_dog_mgr},
			  holiday_lucky_dog_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_lucky_dog_mgr51, _,
       {__Levelholiday_lucky_dog_mgr51,
	__Tracesholiday_lucky_dog_mgr51}}
	  when __Levelholiday_lucky_dog_mgr51 band 64 /= 0 orelse
		 __Tracesholiday_lucky_dog_mgr51 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_lucky_dog_mgr}, {function, init},
			{line, 51}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [holiday_lucky_dog_mgr]),
		       none, 4096, 64, __Levelholiday_lucky_dog_mgr51,
		       __Tracesholiday_lucky_dog_mgr51, lager_event,
		       __Pidholiday_lucky_dog_mgr51);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(holiday_lucky_dog_info,
		   [{file, "./dets/holiday_lucky_dog_info.dets"},
		    {keypos, #holiday_lucky_dog_info.camp_id}]),
    ets:new(holiday_lucky_dog_info,
	    [set, named_table, public,
	     {keypos, #holiday_lucky_dog_info.camp_id}]),
    ets:from_dets(holiday_lucky_dog_info,
		  holiday_lucky_dog_info),
    util:set_ms_timer(do_open,
		      date:next_diff({23, 50, 0}) * 1000, do_open),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_lucky_dog_mgr61, _,
       {__Levelholiday_lucky_dog_mgr61,
	__Tracesholiday_lucky_dog_mgr61}}
	  when __Levelholiday_lucky_dog_mgr61 band 64 /= 0 orelse
		 __Tracesholiday_lucky_dog_mgr61 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_lucky_dog_mgr}, {function, init},
			{line, 61}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [holiday_lucky_dog_mgr]),
		       none, 4096, 64, __Levelholiday_lucky_dog_mgr61,
		       __Tracesholiday_lucky_dog_mgr61, lager_event,
		       __Pidholiday_lucky_dog_mgr61);
      _ -> ok
    end,
    {ok, State}.

handle_call(Request, From, State) ->
    case catch do_handle_call(Request, From, State) of
      {reply, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_lucky_dog_mgr69, _,
	     {__Levelholiday_lucky_dog_mgr69,
	      __Tracesholiday_lucky_dog_mgr69}}
		when __Levelholiday_lucky_dog_mgr69 band 8 /= 0 orelse
		       __Tracesholiday_lucky_dog_mgr69 /= [] ->
		lager:do_log(error,
			     [{module, holiday_lucky_dog_mgr},
			      {function, handle_call}, {line, 69},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelholiday_lucky_dog_mgr69,
			     __Tracesholiday_lucky_dog_mgr69, lager_event,
			     __Pidholiday_lucky_dog_mgr69);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    holiday_lucky_dog_mgr, 70, _Reason}),
	  {reply, {false, lang:get(<<"执行出错"/utf8>>)}, State}
    end.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(Info, State) ->
    case catch do_handle_info(Info, State) of
      {noreply, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_lucky_dog_mgr82, _,
	     {__Levelholiday_lucky_dog_mgr82,
	      __Tracesholiday_lucky_dog_mgr82}}
		when __Levelholiday_lucky_dog_mgr82 band 8 /= 0 orelse
		       __Tracesholiday_lucky_dog_mgr82 /= [] ->
		lager:do_log(error,
			     [{module, holiday_lucky_dog_mgr},
			      {function, handle_info}, {line, 82},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelholiday_lucky_dog_mgr82,
			     __Tracesholiday_lucky_dog_mgr82, lager_event,
			     __Pidholiday_lucky_dog_mgr82);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    holiday_lucky_dog_mgr, 83, _Reason}),
	  {noreply, State}
    end.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_lucky_dog_mgr88, _,
       {__Levelholiday_lucky_dog_mgr88,
	__Tracesholiday_lucky_dog_mgr88}}
	  when __Levelholiday_lucky_dog_mgr88 band 64 /= 0 orelse
		 __Tracesholiday_lucky_dog_mgr88 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_lucky_dog_mgr}, {function, terminate},
			{line, 88}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "执行关闭", none, 4096, 64, __Levelholiday_lucky_dog_mgr88,
		       __Tracesholiday_lucky_dog_mgr88, lager_event,
		       __Pidholiday_lucky_dog_mgr88);
      _ -> ok
    end,
    dets:insert(holiday_lucky_dog_info,
		ets:tab2list(holiday_lucky_dog_info)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_lucky_dog_mgr90, _,
       {__Levelholiday_lucky_dog_mgr90,
	__Tracesholiday_lucky_dog_mgr90}}
	  when __Levelholiday_lucky_dog_mgr90 band 64 /= 0 orelse
		 __Tracesholiday_lucky_dog_mgr90 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_lucky_dog_mgr}, {function, terminate},
			{line, 90}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelholiday_lucky_dog_mgr90,
		       __Tracesholiday_lucky_dog_mgr90, lager_event,
		       __Pidholiday_lucky_dog_mgr90);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_handle_call({apply, M, F, A}, _From, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, Reply, NewState} -> {reply, Reply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_lucky_dog_mgr102, _,
	     {__Levelholiday_lucky_dog_mgr102,
	      __Tracesholiday_lucky_dog_mgr102}}
		when __Levelholiday_lucky_dog_mgr102 band 8 /= 0 orelse
		       __Tracesholiday_lucky_dog_mgr102 /= [] ->
		lager:do_log(error,
			     [{module, holiday_lucky_dog_mgr},
			      {function, do_handle_call}, {line, 102},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_lucky_dog_mgr102,
			     __Tracesholiday_lucky_dog_mgr102, lager_event,
			     __Pidholiday_lucky_dog_mgr102);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_lucky_dog_mgr, 103, _Reason}),
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
    end;
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info({apply, M, F, A}, State) ->
    case util:exec_fun(M, F, [State | A]) of
      {ok, NewState} -> {noreply, NewState};
      _Reason ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_lucky_dog_mgr116, _,
	     {__Levelholiday_lucky_dog_mgr116,
	      __Tracesholiday_lucky_dog_mgr116}}
		when __Levelholiday_lucky_dog_mgr116 band 8 /= 0 orelse
		       __Tracesholiday_lucky_dog_mgr116 /= [] ->
		lager:do_log(error,
			     [{module, holiday_lucky_dog_mgr},
			      {function, do_handle_info}, {line, 116},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_lucky_dog_mgr116,
			     __Tracesholiday_lucky_dog_mgr116, lager_event,
			     __Pidholiday_lucky_dog_mgr116);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_lucky_dog_mgr, 117, _Reason}),
	  {noreply, State}
    end;
do_handle_info(do_open, State) ->
    util:set_ms_timer(do_open,
		      date:next_diff({23, 50, 0}) * 1000, do_open),
    case holiday_lib:get_open_holiday([3046, 93046, 993046])
	of
      #holiday{camp_id = CampId, start_time = StartTime} ->
	  Period = date:day_diff(StartTime, date:unixtime()) + 1,
	  List = [Number
		  || {_, _, _, _, _, _, Number, _}
			 <- holiday_lucky_dog_data:get_award_info({CampId,
								   Period}),
		     Number =/= 0],
	  case ets:lookup(holiday_lucky_dog_info, CampId) of
	    [Info = #holiday_lucky_dog_info{} | _] ->
		NewInfo = Info#holiday_lucky_dog_info{period = Period,
						      status = 1},
		ets:insert(holiday_lucky_dog_info, NewInfo),
		dets:insert(holiday_lucky_dog_info, NewInfo);
	    _ ->
		NewInfo = #holiday_lucky_dog_info{camp_id = CampId,
						  period = Period, status = 1},
		ets:insert(holiday_lucky_dog_info, NewInfo),
		dets:insert(holiday_lucky_dog_info, NewInfo)
	  end,
	  notice:broadcast(rumor_left_top,
			   color:msg(lang:get(<<"幸运锦鲤开奖啦！本期锦鲤奖尾号是~ts、~ts、~ts，幸运儿快来领奖吧！"/utf8>>),
				     [{red, lists:nth(1, List)},
				      {red, lists:nth(2, List)},
				      {red, lists:nth(3, List)}])),
	  role_group:apply(world,
			   {holiday_lucky_dog_lib, info, []}),
	  {noreply, State};
      _ -> {noreply, State}
    end;
do_handle_info(zero, State) ->
    case holiday_lib:get_open_holiday([3046, 93046, 993046])
	of
      #holiday{camp_id = CampId, start_time = StartTime} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_lucky_dog_mgr149, _,
	     {__Levelholiday_lucky_dog_mgr149,
	      __Tracesholiday_lucky_dog_mgr149}}
		when __Levelholiday_lucky_dog_mgr149 band 64 /= 0 orelse
		       __Tracesholiday_lucky_dog_mgr149 /= [] ->
		lager:do_log(info,
			     [{module, holiday_lucky_dog_mgr},
			      {function, do_handle_info}, {line, 149},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("锦鲤活动执行0点更新", []), none, 4096, 64,
			     __Levelholiday_lucky_dog_mgr149,
			     __Tracesholiday_lucky_dog_mgr149, lager_event,
			     __Pidholiday_lucky_dog_mgr149);
	    _ -> ok
	  end,
	  Period = date:day_diff(StartTime, date:unixtime()) + 1,
	  case ets:lookup(holiday_lucky_dog_info, CampId) of
	    [#holiday_lucky_dog_info{period = Period, status = 0}
	     | _] ->
		skip;
	    [Info = #holiday_lucky_dog_info{} | _] ->
		NewInfo = Info#holiday_lucky_dog_info{period = Period,
						      status = 0},
		ets:insert(holiday_lucky_dog_info, NewInfo),
		dets:insert(holiday_lucky_dog_info, NewInfo);
	    _ ->
		NewInfo = #holiday_lucky_dog_info{camp_id = CampId,
						  period = Period},
		ets:insert(holiday_lucky_dog_info, NewInfo),
		dets:insert(holiday_lucky_dog_info, NewInfo)
	  end,
	  {noreply, State};
      _ -> {noreply, State}
    end;
do_handle_info(do_init_holiday, State) ->
    case holiday_lib:get_open_holiday([3046, 93046, 993046])
	of
      #holiday{camp_id = CampId, start_time = StartTime} ->
	  case ets:lookup(holiday_lucky_dog_info, CampId) of
	    [#holiday_lucky_dog_info{} | _] -> skip;
	    _ ->
		Period = date:day_diff(StartTime, date:unixtime()) + 1,
		NewInfo = #holiday_lucky_dog_info{camp_id = CampId,
						  period = Period},
		ets:insert(holiday_lucky_dog_info, NewInfo),
		dets:insert(holiday_lucky_dog_info, NewInfo)
	  end,
	  util:set_ms_timer(do_open,
			    date:next_diff({23, 50, 0}) * 1000, do_open),
	  {noreply, State};
      _ -> {noreply, State}
    end;
do_handle_info({calc_num, RoleId, Period, QuestId, Lev,
		AccRmb},
	       State) ->
    case holiday_lib:get_open_holiday([3046, 93046, 993046])
	of
      #holiday{camp_id = CampId} ->
	  {Num, LuckyType} = calc_num(CampId, Period, Lev,
				      AccRmb),
	  role_lib:cast(by_id, RoleId,
			{holiday_lucky_dog_lib, apply_calc_num,
			 [{calc_num, Period, QuestId, Num, LuckyType}]}),
	  {noreply, State};
      _ -> {noreply, State}
    end;
do_handle_info(_Info, State) -> {noreply, State}.

calc_num(CampId, Period, Lev, AccRmb) ->
    AawardInfo =
	holiday_lucky_dog_data:get_award_info({CampId, Period}),
    {LuckyType, LimitNumber} = calc_lucky_type(AawardInfo,
					       CampId, Period, Lev, AccRmb),
    LimitNoNumber = [LimitNumberT
		     || {_LuckyTypeT, _LimitNum, _MinLev, _MaxLev,
			 _LimitCharge, _MustCounts, LimitNumberT, _Pro}
			    <- AawardInfo],
    {do_calc_num(LimitNumber, LimitNoNumber), LuckyType}.

do_calc_num(0, LimitNoNumber) ->
    Num1 = util:rand(1000, 9999),
    AllRandNum = lists:seq(1000, 9999),
    Fun = fun (Num, Acc) ->
		  case Num >= 1000 of
		    true -> [Num | Acc];
		    _ ->
			Acc ++
			  [T
			   || T <- AllRandNum,
			      T rem 10 == Num orelse
				T rem 100 == Num orelse T rem 1000 == Num]
		  end
	  end,
    NoNumber = lists:foldl(Fun, [], LimitNoNumber),
    Num2 = [T
	    || T <- lists:seq(1000, 9999),
	       not lists:member(T, NoNumber)],
    Num1 * 10000 + util:rand_list(Num2);
do_calc_num(LimitNumber, _LimitNoNumber)
    when LimitNumber >= 10000 ->
    Num1 = util:rand(100, 999), Num1 * 100000 + LimitNumber;
do_calc_num(LimitNumber, _LimitNoNumber)
    when LimitNumber >= 1000 andalso LimitNumber < 10000 ->
    Num1 = util:rand(1000, 9999),
    Num1 * 10000 + LimitNumber;
do_calc_num(LimitNumber, _LimitNoNumber)
    when LimitNumber >= 100 ->
    Num1 = util:rand(10000, 99990),
    Num1 * 1000 + LimitNumber;
do_calc_num(LimitNumber, _LimitNoNumber)
    when LimitNumber >= 10 ->
    Num1 = util:rand(100000, 999900),
    Num1 * 100 + LimitNumber;
do_calc_num(LimitNumber, _LimitNoNumber) ->
    Num1 = util:rand(1000000, 9999000),
    Num1 * 10 + LimitNumber.

calc_lucky_type([], _CampId, _Period, _Lev, _AccRmb) ->
    {4, 0};
calc_lucky_type([{LuckyType, LimitNum, MinLev, MaxLev,
		  LimitCharge, MustCounts, LimitNumber, Pro}
		 | AawardInfo],
		CampId, Period, Lev, AccRmb) ->
    case Lev >= MinLev andalso
	   MinLev =< MaxLev andalso AccRmb >= LimitCharge
	of
      true ->
	  case is_must(CampId, Period, LuckyType, LimitNum,
		       MustCounts)
	      of
	    {true, Info} ->
		do_add_count(Info, {Period, LuckyType}, 0, 1),
		{LuckyType, LimitNumber};
	    {false, limit_num, Info} ->
		calc_lucky_type(AawardInfo, CampId, Period, Lev,
				AccRmb);
	    {false, Info} ->
		case util:rand_per_mille(Pro) of
		  true ->
		      do_add_count(Info, {Period, LuckyType}, 0, 1),
		      {LuckyType, LimitNumber};
		  _ ->
		      calc_lucky_type(AawardInfo, CampId, Period, Lev, AccRmb)
		end;
	    _ ->
		calc_lucky_type(AawardInfo, CampId, Period, Lev, AccRmb)
	  end;
      _ ->
	  calc_lucky_type(AawardInfo, CampId, Period, Lev, AccRmb)
    end.

is_must(CampId, Period, LuckyType, LimitNum,
	MustCounts) ->
    case ets:lookup(holiday_lucky_dog_info, CampId) of
      [Info = #holiday_lucky_dog_info{lucky_dog = LuckyDog}
       | _] ->
	  Maps = list_util:keyfind({Period, LuckyType}, LuckyDog,
				   #{}),
	  DoCount = maps:get(do_count, Maps, 0),
	  MustCount = maps:get(must_count, Maps, 0),
	  do_add_count(Info, {Period, LuckyType}, 1, 0),
	  case DoCount + 1 >= LimitNum andalso LimitNum > 0 of
	    true -> {false, limit_num, Info};
	    _ -> {lists:member(MustCount, MustCounts), Info}
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
	    {__Pidholiday_lucky_dog_mgr273, _,
	     {__Levelholiday_lucky_dog_mgr273,
	      __Tracesholiday_lucky_dog_mgr273}}
		when __Levelholiday_lucky_dog_mgr273 band 8 /= 0 orelse
		       __Tracesholiday_lucky_dog_mgr273 /= [] ->
		lager:do_log(error,
			     [{module, holiday_lucky_dog_mgr},
			      {function, is_must}, {line, 273},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("新春锦鲤在计算号码时，找不到活动数据:~w", [CampId]),
			     none, 4096, 8, __Levelholiday_lucky_dog_mgr273,
			     __Tracesholiday_lucky_dog_mgr273, lager_event,
			     __Pidholiday_lucky_dog_mgr273);
	    _ -> ok
	  end,
	  error
    end.

do_add_count(Info = #holiday_lucky_dog_info{lucky_dog =
						LuckyDog},
	     {Period, LuckyType}, AddMustCount, AddDoCount) ->
    Maps = list_util:keyfind({Period, LuckyType}, LuckyDog,
			     #{}),
    DoCount = maps:get(do_count, Maps, 0),
    MustCount = maps:get(must_count, Maps, 0),
    NewDoCount = DoCount + AddDoCount,
    NewMustCount = MustCount + AddMustCount,
    NewMaps = Maps#{do_count => NewDoCount,
		    must_count => NewMustCount},
    NewInfo = Info#holiday_lucky_dog_info{lucky_dog =
					      lists:keystore({Period,
							      LuckyType},
							     1, LuckyDog,
							     {{Period,
							       LuckyType},
							      NewMaps})},
    ets:insert(holiday_lucky_dog_info, NewInfo).


