-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_mgr.erl",
      1).

-module(holiday_practise_tower_mgr).

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
		{holiday_practise_tower_rank,
		 [ver, platform_zone, camp_id, rank_list, old_rank_list,
		  ext]},
		{practise_role_rank,
		 [ver, id, lev, face_id, avatar_bid, name, val, unixtime,
		  power, rank, video_id, face_update_time, face_file,
		  ext]},
		{m_holiday_practise_tower,
		 [ver, camp_id, id, times, last_buy_times,
		  last_anew_times, update_unixtime, hp_radio, is_combat,
		  is_recombat, save_list, ext]}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([update_practise_tower_rank/1,
	 get_practise_tower_rank/0, get_practise_tower/0]).

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

-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_mgr.erl",
      13).

-file("inc/holiday_practise_tower.hrl", 1).

-record(m_holiday_practise_tower,
	{ver = 1  :: pos_integer(),
	 camp_id = 0  :: pos_integer(), id = 0  :: pos_integer(),
	 times = 0  :: pos_integer(),
	 last_buy_times = 0  :: pos_integer(),
	 last_anew_times = 0  :: pos_integer(),
	 update_unixtime = 0  :: pos_integer(),
	 hp_radio = []  :: list(),
	 is_combat = {0, []}  :: tuple(),
	 is_recombat = 0  :: list(), save_list = []  :: list(),
	 ext = []  :: list()}).

-record(practise_role_rank,
	{ver = 1  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 lev = 0  :: pos_integer(),
	 face_id = 0  :: pos_integer(),
	 avatar_bid = 0  :: pos_integer(),
	 name = <<>>  :: string(), val = 0  :: pos_integer(),
	 unixtime = 0  :: pos_integer(),
	 power = 0  :: pos_integer(), rank = 0  :: pos_integer(),
	 video_id = 0  :: pos_integer(),
	 face_update_time = 0  :: pos_integer(),
	 face_file = <<>>  :: string(), ext = []  :: list()}).

-record(holiday_practise_tower_rank,
	{ver = 1  :: pos_integer(),
	 platform_zone = {<<>>, 0}  :: tuple(),
	 camp_id = 0  :: pos_integer(),
	 rank_list = []  :: list(),
	 old_rank_list = []  :: list(), ext = []  :: list()}).

-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_mgr.erl",
      14).

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

-file("src/mod/holiday_practise_tower/holiday_practi"
      "se_tower_mgr.erl",
      15).

-spec update_practise_tower_rank(pos_integer()) -> ok.

update_practise_tower_rank(Data) ->
    ets:insert(holiday_practise_tower_rank, Data),
    dets:insert(holiday_practise_tower_rank, Data).

-spec get_practise_tower_rank() -> list() | false.

get_practise_tower_rank() ->
    case catch ets:lookup(holiday_practise_tower_rank,
			  {sys_env:get(platform), sys_env:get(zone_id)})
	of
      [#holiday_practise_tower_rank{rank_list = RankList}] ->
	  RankList;
      _ -> false
    end.

-spec get_practise_tower() -> list() | false.

get_practise_tower() ->
    case catch ets:lookup(holiday_practise_tower_rank,
			  {sys_env:get(platform), sys_env:get(zone_id)})
	of
      [P = #holiday_practise_tower_rank{}] -> P;
      _ -> false
    end.

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> holiday_practise_tower_mgr ! Info.

cast(Info) ->
    gen_server:cast(holiday_practise_tower_mgr, Info).

call(Info) ->
    case catch gen_server:call(holiday_practise_tower_mgr,
			       Info, 10000)
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
	    {__Pidholiday_practise_tower_mgr58, _,
	     {__Levelholiday_practise_tower_mgr58,
	      __Tracesholiday_practise_tower_mgr58}}
		when __Levelholiday_practise_tower_mgr58 band 8 /= 0
		       orelse __Tracesholiday_practise_tower_mgr58 /= [] ->
		lager:do_log(error,
			     [{module, holiday_practise_tower_mgr},
			      {function, call}, {line, 58},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holiday_practise_tower_mgr, Info,
					    10000, erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_practise_tower_mgr58,
			     __Tracesholiday_practise_tower_mgr58, lager_event,
			     __Pidholiday_practise_tower_mgr58);
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
    gen_server:start_link({local,
			   holiday_practise_tower_mgr},
			  holiday_practise_tower_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_practise_tower_mgr64, _,
       {__Levelholiday_practise_tower_mgr64,
	__Tracesholiday_practise_tower_mgr64}}
	  when __Levelholiday_practise_tower_mgr64 band 64 /= 0
		 orelse __Tracesholiday_practise_tower_mgr64 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_practise_tower_mgr}, {function, init},
			{line, 64}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...",
				     [holiday_practise_tower_mgr]),
		       none, 4096, 64, __Levelholiday_practise_tower_mgr64,
		       __Tracesholiday_practise_tower_mgr64, lager_event,
		       __Pidholiday_practise_tower_mgr64);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(holiday_practise_tower_rank,
		   [{file, "./dets/holiday_practise_tower_rank.dets"},
		    {keypos, #holiday_practise_tower_rank.platform_zone}]),
    ets:new(holiday_practise_tower_rank,
	    [set, named_table, public,
	     {keypos, #holiday_practise_tower_rank.platform_zone}]),
    load_data(),
    State = case get_practise_tower() of
	      PractiseRank = #holiday_practise_tower_rank{} ->
		  PractiseRank;
	      _ ->
		  #holiday_practise_tower_rank{platform_zone =
						   {sys_env:get(platform),
						    sys_env:get(zone_id)}}
	    end,
    update_practise_tower_rank(State),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_practise_tower_mgr77, _,
       {__Levelholiday_practise_tower_mgr77,
	__Tracesholiday_practise_tower_mgr77}}
	  when __Levelholiday_practise_tower_mgr77 band 64 /= 0
		 orelse __Tracesholiday_practise_tower_mgr77 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_practise_tower_mgr}, {function, init},
			{line, 77}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成",
				     [holiday_practise_tower_mgr]),
		       none, 4096, 64, __Levelholiday_practise_tower_mgr77,
		       __Tracesholiday_practise_tower_mgr77, lager_event,
		       __Pidholiday_practise_tower_mgr77);
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
	    {__Pidholiday_practise_tower_mgr85, _,
	     {__Levelholiday_practise_tower_mgr85,
	      __Tracesholiday_practise_tower_mgr85}}
		when __Levelholiday_practise_tower_mgr85 band 8 /= 0
		       orelse __Tracesholiday_practise_tower_mgr85 /= [] ->
		lager:do_log(error,
			     [{module, holiday_practise_tower_mgr},
			      {function, handle_call}, {line, 85},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelholiday_practise_tower_mgr85,
			     __Tracesholiday_practise_tower_mgr85, lager_event,
			     __Pidholiday_practise_tower_mgr85);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    holiday_practise_tower_mgr, 86, _Reason}),
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
	    {__Pidholiday_practise_tower_mgr99, _,
	     {__Levelholiday_practise_tower_mgr99,
	      __Tracesholiday_practise_tower_mgr99}}
		when __Levelholiday_practise_tower_mgr99 band 8 /= 0
		       orelse __Tracesholiday_practise_tower_mgr99 /= [] ->
		lager:do_log(error,
			     [{module, holiday_practise_tower_mgr},
			      {function, handle_info}, {line, 99},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelholiday_practise_tower_mgr99,
			     __Tracesholiday_practise_tower_mgr99, lager_event,
			     __Pidholiday_practise_tower_mgr99);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    holiday_practise_tower_mgr, 100, _Reason}),
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
      {__Pidholiday_practise_tower_mgr105, _,
       {__Levelholiday_practise_tower_mgr105,
	__Tracesholiday_practise_tower_mgr105}}
	  when __Levelholiday_practise_tower_mgr105 band 64 /= 0
		 orelse __Tracesholiday_practise_tower_mgr105 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_practise_tower_mgr},
			{function, terminate}, {line, 105},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64,
		       __Levelholiday_practise_tower_mgr105,
		       __Tracesholiday_practise_tower_mgr105, lager_event,
		       __Pidholiday_practise_tower_mgr105);
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
	    {__Pidholiday_practise_tower_mgr117, _,
	     {__Levelholiday_practise_tower_mgr117,
	      __Tracesholiday_practise_tower_mgr117}}
		when __Levelholiday_practise_tower_mgr117 band 8 /= 0
		       orelse __Tracesholiday_practise_tower_mgr117 /= [] ->
		lager:do_log(error,
			     [{module, holiday_practise_tower_mgr},
			      {function, do_handle_call}, {line, 117},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8,
			     __Levelholiday_practise_tower_mgr117,
			     __Tracesholiday_practise_tower_mgr117, lager_event,
			     __Pidholiday_practise_tower_mgr117);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_practise_tower_mgr, 118, _Reason}),
	  {reply, {false, lang:get(<<"执行错误"/utf8>>)}, State}
    end;
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_info(check_status,
	       PractiseRank = #holiday_practise_tower_rank{camp_id =
							       CampId,
							   rank_list =
							       OldRankList}) ->
    NewPractiseRank = case
			holiday_lib:get_open_holiday([3053, 93053, 993053])
			  of
			#holiday{camp_id = CampId} -> PractiseRank;
			#holiday{camp_id = NewCampId} when CampId > 0 ->
			    do_rank_reward(OldRankList),
			    PractiseRank#holiday_practise_tower_rank{camp_id =
									 NewCampId,
								     rank_list =
									 [],
								     old_rank_list
									 =
									 OldRankList};
			#holiday{camp_id = NewCampId} ->
			    PractiseRank#holiday_practise_tower_rank{camp_id =
									 NewCampId,
								     rank_list =
									 []};
			_ when CampId > 0 ->
			    do_rank_reward(OldRankList),
			    PractiseRank#holiday_practise_tower_rank{camp_id =
									 0,
								     rank_list =
									 [],
								     old_rank_list
									 =
									 OldRankList};
			_ -> PractiseRank
		      end,
    update_practise_tower_rank(NewPractiseRank),
    {noreply, NewPractiseRank};
do_handle_info({in_rank,
		Rank = #practise_role_rank{id = RoleId}},
	       PractiseRank = #holiday_practise_tower_rank{camp_id =
							       CampId,
							   rank_list =
							       RankList}) ->
    NewPractiseRank = case
			holiday_lib:get_open_holiday([3053, 93053, 993053])
			  of
			#holiday{camp_id = CampId} ->
			    NewRankList = do_in_rank(Rank, RankList),
			    PractiseRank#holiday_practise_tower_rank{rank_list =
									 NewRankList};
			_ -> PractiseRank
		      end,
    update_practise_tower_rank(NewPractiseRank),
    role_lib:cast(by_id, RoleId,
		  {holiday_practise_tower_lib, push, [29100]}),
    {noreply, NewPractiseRank};
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
	    {__Pidholiday_practise_tower_mgr169, _,
	     {__Levelholiday_practise_tower_mgr169,
	      __Tracesholiday_practise_tower_mgr169}}
		when __Levelholiday_practise_tower_mgr169 band 8 /= 0
		       orelse __Tracesholiday_practise_tower_mgr169 /= [] ->
		lager:do_log(error,
			     [{module, holiday_practise_tower_mgr},
			      {function, do_handle_info}, {line, 169},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8,
			     __Levelholiday_practise_tower_mgr169,
			     __Tracesholiday_practise_tower_mgr169, lager_event,
			     __Pidholiday_practise_tower_mgr169);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_practise_tower_mgr, 170, _Reason}),
	  {noreply, State}
    end;
do_handle_info(_Info, State) -> {noreply, State}.

load_data() ->
    case dets:first(holiday_practise_tower_rank) of
      '$end_of_table' ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_practise_tower_mgr184, _,
	     {__Levelholiday_practise_tower_mgr184,
	      __Tracesholiday_practise_tower_mgr184}}
		when __Levelholiday_practise_tower_mgr184 band 64 /= 0
		       orelse __Tracesholiday_practise_tower_mgr184 /= [] ->
		lager:do_log(info,
			     [{module, holiday_practise_tower_mgr},
			      {function, load_data}, {line, 184},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "没有数据需要加载", none, 4096, 64,
			     __Levelholiday_practise_tower_mgr184,
			     __Tracesholiday_practise_tower_mgr184, lager_event,
			     __Pidholiday_practise_tower_mgr184);
	    _ -> ok
	  end,
	  [];
      _ ->
	  dets:traverse(holiday_practise_tower_rank,
			fun (C) ->
				case holiday_practise_tower_ver:do_rank(C) of
				  {false, Reason} ->
				      case {whereis(lager_event),
					    whereis(lager_event),
					    lager_config:get({lager_event,
							      loglevel},
							     {0, []})}
					  of
					{undefined, undefined, _} ->
					    fun () -> {error, lager_not_running}
					    end();
					{undefined, _, _} ->
					    fun () ->
						    {error,
						     {sink_not_configured,
						      lager_event}}
					    end();
					{__Pidholiday_practise_tower_mgr191, _,
					 {__Levelholiday_practise_tower_mgr191,
					  __Tracesholiday_practise_tower_mgr191}}
					    when
					      __Levelholiday_practise_tower_mgr191
						band 8
						/= 0
						orelse
						__Tracesholiday_practise_tower_mgr191
						  /= [] ->
					    lager:do_log(error,
							 [{module,
							   holiday_practise_tower_mgr},
							  {function, load_data},
							  {line, 191},
							  {pid,
							   pid_to_list(self())},
							  {node, node()}
							  | lager:md()],
							 io_lib:format("英灵武神殿排行榜数据转换失败:~w",
								       [Reason]),
							 none, 4096, 8,
							 __Levelholiday_practise_tower_mgr191,
							 __Tracesholiday_practise_tower_mgr191,
							 lager_event,
							 __Pidholiday_practise_tower_mgr191);
					_ -> ok
				      end,
				      {done, false};
				  {ok, NewC} ->
				      update_practise_tower_rank(NewC), continue
				end
			end)
    end.

do_rank_reward([]) -> ok;
do_rank_reward([#practise_role_rank{id = Id,
				    rank = Rank, video_id = OldVideoId}
		| Rest]) ->
    combat_replay_mgr:dec_replay_reference(OldVideoId),
    case holiday_practise_tower_data:get_reward_rank(Rank)
	of
      Items when is_list(Items) ->
	  {MailAssets, MailItems} =
	      format:split_assets_items(Items),
	  Content =
	      util:fbin(lang:get(<<"亲爱的冒险者大人：\n         恭喜您在武神殿活动中获得第~ts名，这是您的奖励，"
				   "请查收。"/utf8>>),
			[color:string(green, Rank)]),
	  mail:send(Id,
		    {lang:get(<<"武神殿活动排行结算通知"/utf8>>), Content, MailAssets,
		     MailItems, "武神殿"});
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidholiday_practise_tower_mgr212, _,
	     {__Levelholiday_practise_tower_mgr212,
	      __Tracesholiday_practise_tower_mgr212}}
		when __Levelholiday_practise_tower_mgr212 band 8 /= 0
		       orelse __Tracesholiday_practise_tower_mgr212 /= [] ->
		lager:do_log(error,
			     [{module, holiday_practise_tower_mgr},
			      {function, do_rank_reward}, {line, 212},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("英灵武神殿奖励失败玩家id:~ts 排名:~w",
					   [Id, Rank]),
			     none, 4096, 8,
			     __Levelholiday_practise_tower_mgr212,
			     __Tracesholiday_practise_tower_mgr212, lager_event,
			     __Pidholiday_practise_tower_mgr212);
	    _ -> ok
	  end,
	  ok
    end,
    do_rank_reward(Rest).

do_in_rank(Rank = #practise_role_rank{id = RoleId,
				      val = NowVal, video_id = VideoId},
	   RankList) ->
    NewRankList = case lists:keyfind(RoleId,
				     #practise_role_rank.id, RankList)
		      of
		    #practise_role_rank{val = OldVal, video_id = OldVideoId}
			when NowVal > OldVal ->
			combat_replay_mgr:dec_replay_reference(OldVideoId),
			combat_replay_mgr:acc_replay_reference(VideoId),
			RankList1 = lists:keyreplace(RoleId,
						     #practise_role_rank.id,
						     RankList, Rank),
			RankList2 = util:keys_sort([#practise_role_rank.power,
						    {asc,
						     #practise_role_rank.unixtime},
						    #practise_role_rank.val],
						   RankList1),
			MaxNum =
			    holiday_practise_tower_data:get_const(holiday_practise_tower_max_rank),
			RankList3 = reset_rank(RankList2, 1, MaxNum, []),
			RankList3;
		    #practise_role_rank{video_id = OldVideoId} ->
			combat_replay_mgr:dec_replay_reference(OldVideoId),
			combat_replay_mgr:acc_replay_reference(VideoId),
			RankList1 = lists:keyreplace(RoleId,
						     #practise_role_rank.id,
						     RankList, Rank),
			RankList2 = util:keys_sort([#practise_role_rank.power,
						    {asc,
						     #practise_role_rank.unixtime},
						    #practise_role_rank.val],
						   RankList1),
			MaxNum =
			    holiday_practise_tower_data:get_const(holiday_practise_tower_max_rank),
			RankList3 = reset_rank(RankList2, 1, MaxNum, []),
			case {whereis(lager_event), whereis(lager_event),
			      lager_config:get({lager_event, loglevel},
					       {0, []})}
			    of
			  {undefined, undefined, _} ->
			      fun () -> {error, lager_not_running} end();
			  {undefined, _, _} ->
			      fun () ->
				      {error,
				       {sink_not_configured, lager_event}}
			      end();
			  {__Pidholiday_practise_tower_mgr238, _,
			   {__Levelholiday_practise_tower_mgr238,
			    __Tracesholiday_practise_tower_mgr238}}
			      when __Levelholiday_practise_tower_mgr238 band 8
				     /= 0
				     orelse
				     __Tracesholiday_practise_tower_mgr238 /=
				       [] ->
			      lager:do_log(error,
					   [{module,
					     holiday_practise_tower_mgr},
					    {function, do_in_rank}, {line, 238},
					    {pid, pid_to_list(self())},
					    {node, node()}
					    | lager:md()],
					   io_lib:format("英灵武神殿排行榜上榜异常玩家:~ts id:~w 关卡:~w",
							 [Rank#practise_role_rank.name,
							  RoleId, NowVal]),
					   none, 4096, 8,
					   __Levelholiday_practise_tower_mgr238,
					   __Tracesholiday_practise_tower_mgr238,
					   lager_event,
					   __Pidholiday_practise_tower_mgr238);
			  _ -> ok
			end,
			RankList3;
		    _ when NowVal > 0 ->
			combat_replay_mgr:acc_replay_reference(VideoId),
			RankList1 = [Rank | RankList],
			RankList2 = util:keys_sort([#practise_role_rank.power,
						    {asc,
						     #practise_role_rank.unixtime},
						    #practise_role_rank.val],
						   RankList1),
			MaxNum =
			    holiday_practise_tower_data:get_const(holiday_practise_tower_max_rank),
			RankList3 = reset_rank(RankList2, 1, MaxNum, []),
			RankList3;
		    _ ->
			case {whereis(lager_event), whereis(lager_event),
			      lager_config:get({lager_event, loglevel},
					       {0, []})}
			    of
			  {undefined, undefined, _} ->
			      fun () -> {error, lager_not_running} end();
			  {undefined, _, _} ->
			      fun () ->
				      {error,
				       {sink_not_configured, lager_event}}
			      end();
			  {__Pidholiday_practise_tower_mgr250, _,
			   {__Levelholiday_practise_tower_mgr250,
			    __Tracesholiday_practise_tower_mgr250}}
			      when __Levelholiday_practise_tower_mgr250 band 8
				     /= 0
				     orelse
				     __Tracesholiday_practise_tower_mgr250 /=
				       [] ->
			      lager:do_log(error,
					   [{module,
					     holiday_practise_tower_mgr},
					    {function, do_in_rank}, {line, 250},
					    {pid, pid_to_list(self())},
					    {node, node()}
					    | lager:md()],
					   io_lib:format("英灵武神殿排行榜上榜异常玩家:~ts id:~w 关卡:~w",
							 [Rank#practise_role_rank.name,
							  RoleId, NowVal]),
					   none, 4096, 8,
					   __Levelholiday_practise_tower_mgr250,
					   __Tracesholiday_practise_tower_mgr250,
					   lager_event,
					   __Pidholiday_practise_tower_mgr250);
			  _ -> ok
			end,
			RankList
		  end,
    NewRankList.

reset_rank(_, Rank, MaxNum, RankList)
    when Rank > MaxNum ->
    RankList;
reset_rank([], _Rank, _MaxNum, RankList) -> RankList;
reset_rank([P = #practise_role_rank{} | Rest], Rank,
	   MaxNum, RankList) ->
    NewP = P#practise_role_rank{rank = Rank},
    reset_rank(Rest, Rank + 1, MaxNum, [NewP | RankList]).


