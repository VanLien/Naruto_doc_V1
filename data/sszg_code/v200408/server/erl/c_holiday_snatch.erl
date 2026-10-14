-file("data/c_holiday_snatch.erl", 1).

-file("src/mod/holiday_snatch/c_holiday_snatch.erl", 1).

-module(c_holiday_snatch).

-lager_records([{holiday_snatch_log,
		 [log_id, win_num, win_role_info, join_num, max_num,
		  time, award, award_name, ext]},
		{holiday_snatch_role_info,
		 [sid, num, open_srv_time, merge_srvs, ext]},
		{holiday_snatch_info,
		 [pos, round, id, num, num_list, win_num, state,
		  state_time, rand_list, win_role_info, ext]},
		{holiday_snatch, [zone_id, info, ext]},
		{m_holiday_snatch,
		 [ver, camp_id, buy_log, old_data, ext]}]).

-behaviour(gen_server).

-export([info/1, cast/1, call/1, start_link/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([gm_send_mail/0]).

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

-file("src/mod/holiday_snatch/c_holiday_snatch.erl",
      14).

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

-file("src/mod/holiday_snatch/c_holiday_snatch.erl",
      15).

gm_send_mail() ->
    List = holiday_snatch_mail_ids:get(),
    Fun = fun ({Id = {_, Sid}, Award}, Acc) ->
		  {Assets, Items} = format:split_assets_items(Award),
		  Mail =
		      {lang:get(<<"Phát hành lại phần thưởng tại Trung "
				  "tâm săn tìm kho báu"/utf8>>),
		       lang:get(<<"Kính gửi quý nhẫn giả: Vì bạn đã mua "
				  "đạo cụ trong Trung tâm săn tìm kho báu "
				  "trước khi điều chỉnh sự kiện, nên do "
				  "điều chỉnh phần thưởng nên những vật "
				  "phẩm bạn chưa nhận được giờ đây sẽ đượcĐạo "
				  "cụ sẽ được cấp lại cho bạn, vui lòng "
				  "kiểm tra cẩn thận."/utf8>>),
		       Assets, Items,
		       lang:get(<<"Phát hành lại phần thưởng tại Trung "
				  "tâm săn tìm kho báu"/utf8>>)},
		  big_world_lib:cast({big_world, Sid}, mail, local_send,
				     [Id, Mail]),
		  [Id | Acc]
	  end,
    lists:foldl(Fun, [], List).

info(Info) -> c_holiday_snatch ! Info.

cast(Info) -> gen_server:cast(c_holiday_snatch, Info).

call(Info) ->
    case catch gen_server:call(c_holiday_snatch, Info,
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
	    {__Pidc_holiday_snatch36, _,
	     {__Levelc_holiday_snatch36, __Tracesc_holiday_snatch36}}
		when __Levelc_holiday_snatch36 band 8 /= 0 orelse
		       __Tracesc_holiday_snatch36 /= [] ->
		lager:do_log(error,
			     [{module, c_holiday_snatch}, {function, call},
			      {line, 36}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [c_holiday_snatch, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelc_holiday_snatch36,
			     __Tracesc_holiday_snatch36, lager_event,
			     __Pidc_holiday_snatch36);
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

start_link(ZoneId) when is_integer(ZoneId) ->
    case c_holiday_snatch_mgr:get_holiday_snatch(ZoneId) of
      D = #holiday_snatch{} -> start_link(D);
      _ -> ok
    end;
start_link(Data = #holiday_snatch{zone_id = ZId}) ->
    LocalName =
	list_to_atom(lists:concat(["c_holiday_snatch_", ZId])),
    gen_server:start_link({local, LocalName},
			  c_holiday_snatch, [Data], []).

init([State = #holiday_snatch{zone_id = ZId}]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_snatch50, _,
       {__Levelc_holiday_snatch50, __Tracesc_holiday_snatch50}}
	  when __Levelc_holiday_snatch50 band 64 /= 0 orelse
		 __Tracesc_holiday_snatch50 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_snatch}, {function, init},
			{line, 50}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [c_holiday_snatch]), none,
		       4096, 64, __Levelc_holiday_snatch50,
		       __Tracesc_holiday_snatch50, lager_event,
		       __Pidc_holiday_snatch50);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    ets:insert(c_holiday_snatch_pids, {self(), ZId}),
    SList = c_holiday_snatch_lib:get_srvs(ZId),
    self() ! sync_data,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_snatch62, _,
       {__Levelc_holiday_snatch62, __Tracesc_holiday_snatch62}}
	  when __Levelc_holiday_snatch62 band 64 /= 0 orelse
		 __Tracesc_holiday_snatch62 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_snatch}, {function, init},
			{line, 62}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [c_holiday_snatch]), none,
		       4096, 64, __Levelc_holiday_snatch62,
		       __Tracesc_holiday_snatch62, lager_event,
		       __Pidc_holiday_snatch62);
      _ -> ok
    end,
    {ok, State}.

do_set_timer(Info = #holiday_snatch_info{num = Num,
					 pos = Pos, id = Id}) ->
    case holiday_snatch_data:get_limit_num(Id) of
      LimitOpenMin
	  when is_integer(LimitOpenMin) andalso
		 Num >= LimitOpenMin ->
	  case erase({award_timer, Pos}) of
	    undefined -> ok;
	    Timer -> erlang:cancel_timer(Timer)
	  end,
	  put({award_timer, Pos},
	      erlang:send_after(30000, self(), {do_award, Pos})),
	  Info#holiday_snatch_info{state = 1,
				   state_time = date:unixtime() + 30};
      _ -> Info
    end.

handle_call({sync_role_buy,
	     RoleInfo = #{role_id := RoleId, pos := Pos,
			  num := BuyNum}},
	    _From, State = #holiday_snatch{info = Info}) ->
    case sys_env:get(c_holiday_snatch_state) of
      {_, _, _, open, _} ->
	  case sys_lib:srv_id() == <<"center_7">> of
	    false ->
		case lists:keyfind(Pos, #holiday_snatch_info.pos, Info)
		    of
		  HInfo = #holiday_snatch_info{num = Num,
					       num_list = NumList,
					       rand_list = RandList, id = Id,
					       state = 0} ->
		      LimitNum = holiday_snatch_data:get_limit_num(Id),
		      NewNum = BuyNum + Num,
		      if NewNum > LimitNum ->
			     {reply,
			      {false,
			       lang:get(<<"Đã vượt quá số lượng mua hàng"/utf8>>)},
			      State};
			 true ->
			     LimitRoleNum =
				 holiday_snatch_data:get_role_limit(Id),
			     OldNumList = case lists:keyfind(RoleId, 1, NumList)
					      of
					    {_, _, OldNumListT} -> OldNumListT;
					    _ -> []
					  end,
			     RoleNum = length(OldNumList),
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
			       {__Pidc_holiday_snatch99, _,
				{__Levelc_holiday_snatch99,
				 __Tracesc_holiday_snatch99}}
				   when __Levelc_holiday_snatch99 band 128 /= 0
					  orelse
					  __Tracesc_holiday_snatch99 /= [] ->
				   lager:do_log(debug,
						[{module, c_holiday_snatch},
						 {function, handle_call},
						 {line, 99},
						 {pid, pid_to_list(self())},
						 {node, node()}
						 | lager:md()],
						io_lib:format("===~w",
							      [{RoleNum, BuyNum,
								LimitRoleNum}]),
						none, 4096, 128,
						__Levelc_holiday_snatch99,
						__Tracesc_holiday_snatch99,
						lager_event,
						__Pidc_holiday_snatch99);
			       _ -> ok
			     end,
			     case RoleNum + BuyNum > LimitRoleNum of
			       true ->
				   {reply,
				    {false,
				     lang:get(<<"Đã vượt quá giới hạn mua hàng cá nhân"/utf8>>)},
				    State};
			       _ ->
				   {RandNums, Others} = list_util:split(BuyNum,
									RandList),
				   NNumList = lists:keystore(RoleId, 1, NumList,
							     {RoleId, RoleInfo,
							      RandNums ++
								OldNumList}),
				   NewHInfo =
				       do_set_timer(HInfo#holiday_snatch_info{num
										  =
										  NewNum,
									      num_list
										  =
										  NNumList,
									      rand_list
										  =
										  Others}),
				   NInfo = lists:keystore(Pos,
							  #holiday_snatch_info.pos,
							  Info, NewHInfo),
				   NewState = State#holiday_snatch{info =
								       NInfo},
				   self() !
				     {sync_status_to_zone_by_zone_one, 0,
				      NewHInfo#holiday_snatch_info{num_list =
								       [],
								   rand_list =
								       []}},
				   {reply, {true, RandNums}, NewState}
			     end
		      end;
		  #holiday_snatch_info{} ->
		      {reply,
		       {false,
			lang:get(<<"Tổng giải thưởng đã bước vào thời gian "
				   "thanh toán"/utf8>>)},
		       State};
		  _ ->
		      {reply, {false, lang:get(<<"Lỗi tham số 3"/utf8>>)},
		       State}
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
		  {__Pidc_holiday_snatch118, _,
		   {__Levelc_holiday_snatch118,
		    __Tracesc_holiday_snatch118}}
		      when __Levelc_holiday_snatch118 band 8 /= 0 orelse
			     __Tracesc_holiday_snatch118 /= [] ->
		      lager:do_log(error,
				   [{module, c_holiday_snatch},
				    {function, handle_call}, {line, 118},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("严重bug, 夺宝活动有游戏服与非大世界服建立了请求 ~w",
						 [RoleId]),
				   none, 4096, 8, __Levelc_holiday_snatch118,
				   __Tracesc_holiday_snatch118, lager_event,
				   __Pidc_holiday_snatch118);
		  _ -> ok
		end,
		{reply,
		 {false,
		  lang:get(<<"Kết nối máy chủ chéo không thành công"/utf8>>)},
		 State}
	  end;
      _ ->
	  {reply,
	   {false,
	    lang:get(<<"Thời gian bắt đầu sự kiện vẫn chưa đến"/utf8>>)},
	   State}
    end;
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({update_log, FromPid},
	    State = #holiday_snatch{zone_id = Zid}) ->
    Logs = c_holiday_snatch_lib:get_log(Zid),
    FromPid ! {update_log, Logs},
    {noreply, State};
handle_info({add_new_log, Log},
	    State = #holiday_snatch{zone_id = Zid}) ->
    SList = c_holiday_snatch_lib:get_srvs(Zid),
    case sys_lib:srv_id() == <<"center_7">> of
      false ->
	  [big_world_lib:cast(Sid, holiday_snatch_mgr, info,
			      [{add_new_log, Log}])
	   || Sid <- SList];
      _ -> ok
    end,
    {noreply, State};
handle_info({sync_data, FromPid},
	    State = #holiday_snatch{info = Info}) ->
    PushInfo = [HS#holiday_snatch_info{num_list = []}
		|| HS = #holiday_snatch_info{} <- Info],
    Type = case sys_lib:srv_id() == <<"center_7">> of
	     true -> cluster;
	     _ -> big_world
	   end,
    FromPid !
      {sync_status_to_zone_by_zone, 0, PushInfo, Type,
       self()},
    {noreply, State};
handle_info(sync_data,
	    State = #holiday_snatch{zone_id = Zid, info = Info}) ->
    PushInfo = [HS#holiday_snatch_info{num_list = [],
				       rand_list = []}
		|| HS = #holiday_snatch_info{} <- Info],
    SList = c_holiday_snatch_lib:get_srvs(Zid),
    case sys_lib:srv_id() == <<"center_7">> of
      false ->
	  [big_world_lib:cast(Sid, holiday_snatch_mgr, info,
			      [{sync_status_to_zone_by_zone, 0, PushInfo,
				big_world, self()}])
	   || Sid <- SList];
      _ ->
	  [cluster_lib:cast(Sid, holiday_snatch_mgr, info,
			    [{sync_status_to_zone_by_zone, 0, PushInfo, cluster,
			      self()}])
	   || Sid <- SList]
    end,
    {noreply, State};
handle_info(sync_data2,
	    State = #holiday_snatch{zone_id = Zid, info = Info}) ->
    PushInfo = [HS#holiday_snatch_info{num_list = [],
				       rand_list = []}
		|| HS = #holiday_snatch_info{} <- Info],
    SList = c_holiday_snatch_lib:get_srvs(Zid),
    case sys_lib:srv_id() == <<"center_7">> of
      false ->
	  [big_world_lib:cast(Sid, holiday_snatch_mgr, info,
			      [{sync_status_to_zone_by_zone, 1, PushInfo,
				big_world, self()}])
	   || Sid <- SList];
      _ ->
	  [cluster_lib:cast(Sid, holiday_snatch_mgr, info,
			    [{sync_status_to_zone_by_zone, 1, PushInfo, cluster,
			      self()}])
	   || Sid <- SList]
    end,
    {noreply, State};
handle_info({sync_status_to_zone_by_zone_one, Flag,
	     Info},
	    State = #holiday_snatch{zone_id = Zid}) ->
    SList = c_holiday_snatch_lib:get_srvs(Zid),
    case sys_lib:srv_id() == <<"center_7">> of
      false ->
	  [big_world_lib:cast(Sid, holiday_snatch_mgr, info,
			      [{sync_status_to_zone_by_zone_one, Flag, Info,
				big_world, self()}])
	   || Sid <- SList];
      _ ->
	  [cluster_lib:cast(Sid, holiday_snatch_mgr, info,
			    [{sync_status_to_zone_by_zone_one, Flag, Info,
			      cluster, self()}])
	   || Sid <- SList]
    end,
    {noreply, State};
handle_info({do_award, Pos},
	    State = #holiday_snatch{zone_id = Zid, info = Info}) ->
    case erase({award_timer, Pos}) of
      undefined -> ok;
      Timer -> erlang:cancel_timer(Timer)
    end,
    case lists:keyfind(Pos, #holiday_snatch_info.pos, Info)
	of
      HInfo = #holiday_snatch_info{id = Id, round = Round,
				   num_list = NumList, state = 1} ->
	  RandList = lists:flatten([Nums
				    || {_, _, Nums} <- NumList]),
	  WinNum = list_util:rand(RandList),
	  [{RoleId, RoleInfo, JoinNum} | _] = [{RoleIdT,
						RoleInfoT, length(Nums)}
					       || {RoleIdT, RoleInfoT, Nums}
						      <- NumList,
						  lists:member(WinNum, Nums)],
	  Award = holiday_snatch_data:get_award(Id),
	  do_win_mail(RoleId, Award, JoinNum),
	  do_loss_mail(RoleId, NumList),
	  Log = #holiday_snatch_log{log_id = {Pos, Round},
				    win_num = WinNum, win_role_info = RoleInfo,
				    join_num = JoinNum,
				    max_num =
					holiday_snatch_data:get_limit_num(Id),
				    time = date:unixtime(), award = Award,
				    award_name =
					holiday_snatch_data:get_award_name(Id)},
	  add_log(Zid, Log),
	  put({open_new_timer, Pos},
	      erlang:send_after(180000, self(), {open_new, Pos})),
	  NewHInfo = HInfo#holiday_snatch_info{state = 2,
					       state_time =
						   date:unixtime() + 180,
					       win_num = WinNum,
					       win_role_info = RoleInfo},
	  NInfo = lists:keystore(Pos, #holiday_snatch_info.pos,
				 Info, NewHInfo),
	  NewState = State#holiday_snatch{info = NInfo},
	  self() !
	    {sync_status_to_zone_by_zone_one, 0,
	     NewHInfo#holiday_snatch_info{num_list = [],
					  rand_list = []}},
	  self() ! {add_new_log, Log},
	  {noreply, NewState};
      _ -> {noreply, State}
    end;
handle_info({open_new, Pos},
	    State = #holiday_snatch{info = Info}) ->
    case erase({open_new_timer, Pos}) of
      undefined -> ok;
      Timer -> erlang:cancel_timer(Timer)
    end,
    case lists:keyfind(Pos, #holiday_snatch_info.pos, Info)
	of
      InfoT = #holiday_snatch_info{state = 2,
				   round = Round} ->
	  case sys_env:get(c_holiday_snatch_state) of
	    {_, _, _, open, _} ->
		NewHInfoT = c_holiday_snatch_mgr:init_info(Pos),
		NewHInfo = NewHInfoT#holiday_snatch_info{round =
							     Round + 1},
		NInfo = lists:keystore(Pos, #holiday_snatch_info.pos,
				       Info, NewHInfo),
		NewState = State#holiday_snatch{info = NInfo},
		self() !
		  {sync_status_to_zone_by_zone_one, 1,
		   NewHInfo#holiday_snatch_info{num_list = [],
						rand_list = []}},
		{noreply, NewState};
	    _ ->
		NewHInfoT = InfoT#holiday_snatch_info{state = 3,
						      state_time = 0},
		NInfo = lists:keystore(Pos, #holiday_snatch_info.pos,
				       Info, NewHInfoT),
		NewState = State#holiday_snatch{info = NInfo},
		self() !
		  {sync_status_to_zone_by_zone_one, 1,
		   NewHInfoT#holiday_snatch_info{num_list = [],
						 rand_list = []}},
		{noreply, NewState}
	  end;
      _ -> {noreply, State}
    end;
handle_info(close,
	    State = #holiday_snatch{info = Infos}) ->
    Fun = fun (Info = #holiday_snatch_info{id = Id,
					   num = Num, state = StateT},
	       Acc) ->
		  if StateT == 1 -> [Info | Acc];
		     StateT == 2 -> [Info | Acc];
		     true ->
			 case holiday_snatch_data:get_limit_min(Id) of
			   LimitNum
			       when is_integer(LimitNum) andalso
				      Num >= LimitNum ->
			       NInfo = do_set_timer(Info), [NInfo | Acc];
			   _ ->
			       do_close_mail(Info),
			       NInfo = Info#holiday_snatch_info{state = 4,
								state_time = 0},
			       [NInfo | Acc]
			 end
		  end
	  end,
    NInfos = lists:foldl(Fun, [], Infos),
    NewState = State#holiday_snatch{info = NInfos},
    self() ! sync_data,
    {noreply, NewState};
handle_info(open,
	    State = #holiday_snatch{info = Infos}) ->
    Fun = fun (Info = #holiday_snatch_info{pos = Pos,
					   round = Round, state = StateT},
	       Acc) ->
		  if StateT == 1 -> [Info | Acc];
		     StateT == 2 -> [Info | Acc];
		     StateT == 0 -> [Info | Acc];
		     true ->
			 NInfo = c_holiday_snatch_mgr:init_info(Pos),
			 [NInfo#holiday_snatch_info{round = Round + 1} | Acc]
		  end
	  end,
    NInfos = lists:foldl(Fun, [], Infos),
    NewState = State#holiday_snatch{info = NInfos},
    self() ! sync_data2,
    {noreply, NewState};
handle_info({stop, Reason}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_snatch298, _,
       {__Levelc_holiday_snatch298,
	__Tracesc_holiday_snatch298}}
	  when __Levelc_holiday_snatch298 band 64 /= 0 orelse
		 __Tracesc_holiday_snatch298 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_snatch}, {function, handle_info},
			{line, 298}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("勇者夺宝组管理进程收到退出消息:~w", [Reason]), none,
		       4096, 64, __Levelc_holiday_snatch298,
		       __Tracesc_holiday_snatch298, lager_event,
		       __Pidc_holiday_snatch298);
      _ -> ok
    end,
    {stop, Reason, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, State) ->
    ets:insert(c_holiday_snatch_list, State),
    dets:insert(c_holiday_snatch_list, State),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_holiday_snatch307, _,
       {__Levelc_holiday_snatch307,
	__Tracesc_holiday_snatch307}}
	  when __Levelc_holiday_snatch307 band 64 /= 0 orelse
		 __Tracesc_holiday_snatch307 /= [] ->
	  lager:do_log(info,
		       [{module, c_holiday_snatch}, {function, terminate},
			{line, 307}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelc_holiday_snatch307,
		       __Tracesc_holiday_snatch307, lager_event,
		       __Pidc_holiday_snatch307);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

add_log(Zid, Log) ->
    OlgLog = c_holiday_snatch_lib:get_log(Zid),
    c_holiday_snatch_mgr:update_ets(c_holiday_snatch_zone_log,
				    {Zid, lists:sublist([Log | OlgLog], 300)},
				    all).

do_close_mail(#holiday_snatch_info{id = Id,
				   num_list = L}) ->
    Expend = holiday_snatch_data:get_expend(Id),
    do_close_mail(L, Expend).

do_close_mail([], _Expend) -> ok;
do_close_mail([{RoleId = {_, Sid}, _, BuyNums}
	       | NumList],
	      Expend) ->
    Num = length(BuyNums),
    {Assets, Items} = format:split_assets_items([{Id,
						  NumT * Num}
						 || {Id, NumT} <- Expend]),
    Mail =
	{lang:get(<<"Sự trở lại của đồng xu kho báu dũng "
		    "cảm"/utf8>>),
	 lang:get(<<"Kính gửi quý nhẫn giả, đây là những "
		    "đồng xu kho báu sẽ được hoàn lại nếu "
		    "sản phẩm không đạt được số lần rút tối "
		    "thiểu trong sự kiện săn tìm kho báu. "
		    ""/utf8>>),
	 Assets, Items,
	 lang:get(<<"Sự trở lại của đồng xu kho báu dũng "
		    "cảm"/utf8>>)},
    big_world_lib:cast({big_world, Sid}, mail, local_send,
		       [RoleId, Mail]),
    do_close_mail(NumList, Expend).

do_win_mail(RoleId = {_, Sid}, Award, _Num) ->
    {Assets, Items} = format:split_assets_items(Award),
    Mail =
	{lang:get(<<"Phần thưởng sự kiện săn tìm kho báu "
		    "dũng cảm"/utf8>>),
	 lang:get(<<"Kính gửi quý nhẫn giả, đây là phần thưởng "
		    "bạn giành được trong sự kiện truy tìm "
		    "kho báu, vui lòng kiểm tra."/utf8>>),
	 Assets, Items,
	 lang:get(<<"Phần thưởng sự kiện săn tìm kho báu "
		    "dũng cảm"/utf8>>)},
    big_world_lib:cast({big_world, Sid}, mail, local_send,
		       [RoleId, Mail]).

do_loss_mail(_RoleId, []) -> ok;
do_loss_mail(RoleId, [{RoleId, _, _} | NumList]) ->
    do_loss_mail(RoleId, NumList);
do_loss_mail(RoleId,
	     [{RoleIdT = {_, Sid}, _, BuyNums} | NumList]) ->
    Num = length(BuyNums),
    {Id, Rio} =
	holiday_snatch_data:get_constant(item_score),
    {Assets, Items} = format:split_assets_items([{Id,
						  Num * Rio}]),
    Mail =
	{lang:get(<<"Hoàn trả điểm cho Sự kiện Truy tìm Kho "
		    "báu Dũng cảm"/utf8>>),
	 lang:get(<<"Quý nhẫn giả thân mến, bạn đã không "
		    "giành được bất kỳ giải thưởng nào trong "
		    "hoạt động truy tìm kho báu, đây là phần "
		    "thưởng điểm của bạn! Vui lòng kiểm tra"/utf8>>),
	 Assets, Items,
	 lang:get(<<"Hoàn trả điểm cho Sự kiện Truy tìm Kho "
		    "báu Dũng cảm"/utf8>>)},
    big_world_lib:cast({big_world, Sid}, mail, local_send,
		       [RoleIdT, Mail]),
    do_loss_mail(RoleId, NumList).


