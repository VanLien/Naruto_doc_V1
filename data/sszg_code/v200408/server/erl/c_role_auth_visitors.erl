-file("data/c_role_auth_visitors.erl", 1).

-file("src/mod/role/c_role_auth_visitors.erl", 1).

-module(c_role_auth_visitors).

-lager_records([{state, []}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

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

-file("src/mod/role/c_role_auth_visitors.erl", 13).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> c_role_auth_visitors ! Info.

cast(Info) ->
    gen_server:cast(c_role_auth_visitors, Info).

call(Info) ->
    case catch gen_server:call(c_role_auth_visitors, Info,
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
	    {__Pidc_role_auth_visitors30, _,
	     {__Levelc_role_auth_visitors30,
	      __Tracesc_role_auth_visitors30}}
		when __Levelc_role_auth_visitors30 band 8 /= 0 orelse
		       __Tracesc_role_auth_visitors30 /= [] ->
		lager:do_log(error,
			     [{module, c_role_auth_visitors}, {function, call},
			      {line, 30}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [c_role_auth_visitors, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelc_role_auth_visitors30,
			     __Tracesc_role_auth_visitors30, lager_event,
			     __Pidc_role_auth_visitors30);
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
    gen_server:start_link({local, c_role_auth_visitors},
			  c_role_auth_visitors, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_role_auth_visitors36, _,
       {__Levelc_role_auth_visitors36,
	__Tracesc_role_auth_visitors36}}
	  when __Levelc_role_auth_visitors36 band 64 /= 0 orelse
		 __Tracesc_role_auth_visitors36 /= [] ->
	  lager:do_log(info,
		       [{module, c_role_auth_visitors}, {function, init},
			{line, 36}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [c_role_auth_visitors]),
		       none, 4096, 64, __Levelc_role_auth_visitors36,
		       __Tracesc_role_auth_visitors36, lager_event,
		       __Pidc_role_auth_visitors36);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(c_role_auth_visitors_info,
			"dets/c_role_auth_visitors_info.dets", 1, set),
    dets:to_ets(c_role_auth_visitors_info,
		c_role_auth_visitors_info),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_role_auth_visitors41, _,
       {__Levelc_role_auth_visitors41,
	__Tracesc_role_auth_visitors41}}
	  when __Levelc_role_auth_visitors41 band 64 /= 0 orelse
		 __Tracesc_role_auth_visitors41 /= [] ->
	  lager:do_log(info,
		       [{module, c_role_auth_visitors}, {function, init},
			{line, 41}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [c_role_auth_visitors]),
		       none, 4096, 64, __Levelc_role_auth_visitors41,
		       __Tracesc_role_auth_visitors41, lager_event,
		       __Pidc_role_auth_visitors41);
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
	    {__Pidc_role_auth_visitors49, _,
	     {__Levelc_role_auth_visitors49,
	      __Tracesc_role_auth_visitors49}}
		when __Levelc_role_auth_visitors49 band 8 /= 0 orelse
		       __Tracesc_role_auth_visitors49 /= [] ->
		lager:do_log(error,
			     [{module, c_role_auth_visitors},
			      {function, handle_call}, {line, 49},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelc_role_auth_visitors49,
			     __Tracesc_role_auth_visitors49, lager_event,
			     __Pidc_role_auth_visitors49);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    c_role_auth_visitors, 50, _Reason}),
	  {reply, {false, lang:get(<<"Lỗi thực thi"/utf8>>)},
	   State}
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
	    {__Pidc_role_auth_visitors62, _,
	     {__Levelc_role_auth_visitors62,
	      __Tracesc_role_auth_visitors62}}
		when __Levelc_role_auth_visitors62 band 8 /= 0 orelse
		       __Tracesc_role_auth_visitors62 /= [] ->
		lager:do_log(error,
			     [{module, c_role_auth_visitors},
			      {function, handle_info}, {line, 62},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelc_role_auth_visitors62,
			     __Tracesc_role_auth_visitors62, lager_event,
			     __Pidc_role_auth_visitors62);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    c_role_auth_visitors, 63, _Reason}),
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
      {__Pidc_role_auth_visitors68, _,
       {__Levelc_role_auth_visitors68,
	__Tracesc_role_auth_visitors68}}
	  when __Levelc_role_auth_visitors68 band 64 /= 0 orelse
		 __Tracesc_role_auth_visitors68 /= [] ->
	  lager:do_log(info,
		       [{module, c_role_auth_visitors}, {function, terminate},
			{line, 68}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelc_role_auth_visitors68,
		       __Tracesc_role_auth_visitors68, lager_event,
		       __Pidc_role_auth_visitors68);
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
	    {__Pidc_role_auth_visitors80, _,
	     {__Levelc_role_auth_visitors80,
	      __Tracesc_role_auth_visitors80}}
		when __Levelc_role_auth_visitors80 band 8 /= 0 orelse
		       __Tracesc_role_auth_visitors80 /= [] ->
		lager:do_log(error,
			     [{module, c_role_auth_visitors},
			      {function, do_handle_call}, {line, 80},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelc_role_auth_visitors80,
			     __Tracesc_role_auth_visitors80, lager_event,
			     __Pidc_role_auth_visitors80);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    c_role_auth_visitors, 81, _Reason}),
	  {reply, {false, lang:get(<<"Lỗi thực thi"/utf8>>)},
	   State}
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
	    {__Pidc_role_auth_visitors94, _,
	     {__Levelc_role_auth_visitors94,
	      __Tracesc_role_auth_visitors94}}
		when __Levelc_role_auth_visitors94 band 8 /= 0 orelse
		       __Tracesc_role_auth_visitors94 /= [] ->
		lager:do_log(error,
			     [{module, c_role_auth_visitors},
			      {function, do_handle_info}, {line, 94},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelc_role_auth_visitors94,
			     __Tracesc_role_auth_visitors94, lager_event,
			     __Pidc_role_auth_visitors94);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    c_role_auth_visitors, 95, _Reason}),
	  {noreply, State}
    end;
do_handle_info({update_time, Account, Pid}, State) ->
    Now = date:unixtime(),
    case ets:lookup(c_role_auth_visitors_info, Account) of
      [{Account, ResetTime, AccTime} | _]
	  when ResetTime > Now ->
	  role:apply(async, Pid,
		     {role_auth_visitors, apply_visitors_time,
		      [{ResetTime, AccTime}]}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_role_auth_visitors104, _,
	     {__Levelc_role_auth_visitors104,
	      __Tracesc_role_auth_visitors104}}
		when __Levelc_role_auth_visitors104 band 128 /= 0 orelse
		       __Tracesc_role_auth_visitors104 /= [] ->
		lager:do_log(debug,
			     [{module, c_role_auth_visitors},
			      {function, do_handle_info}, {line, 104},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("同步累计时间:~w", [{ResetTime, AccTime}]),
			     none, 4096, 128, __Levelc_role_auth_visitors104,
			     __Tracesc_role_auth_visitors104, lager_event,
			     __Pidc_role_auth_visitors104);
	    _ -> ok
	  end,
	  ok;
      _ ->
	  ResetTime = Now + 86400 * 15,
	  AccTime = 0,
	  ets:insert(c_role_auth_visitors_info,
		     {Account, ResetTime, AccTime}),
	  dets:insert(c_role_auth_visitors_info,
		      {Account, ResetTime, AccTime}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_role_auth_visitors111, _,
	     {__Levelc_role_auth_visitors111,
	      __Tracesc_role_auth_visitors111}}
		when __Levelc_role_auth_visitors111 band 128 /= 0 orelse
		       __Tracesc_role_auth_visitors111 /= [] ->
		lager:do_log(debug,
			     [{module, c_role_auth_visitors},
			      {function, do_handle_info}, {line, 111},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("同步累计时间:~w", [{ResetTime, AccTime}]),
			     none, 4096, 128, __Levelc_role_auth_visitors111,
			     __Tracesc_role_auth_visitors111, lager_event,
			     __Pidc_role_auth_visitors111);
	    _ -> ok
	  end,
	  role:apply(async, Pid,
		     {role_auth_visitors, apply_visitors_time,
		      [{ResetTime, AccTime}]}),
	  ok
    end,
    {noreply, State};
do_handle_info({reset_time, Account, Pid}, State) ->
    Now = date:unixtime(),
    case ets:lookup(c_role_auth_visitors_info, Account) of
      [{Account, ResetTime, AccTime} | _]
	  when ResetTime > Now ->
	  ok;
      _ ->
	  ResetTime = Now + 86400 * 15,
	  AccTime = 0,
	  ets:insert(c_role_auth_visitors_info,
		     {Account, ResetTime, AccTime}),
	  dets:insert(c_role_auth_visitors_info,
		      {Account, ResetTime, AccTime}),
	  role:apply(async, Pid,
		     {role_auth_visitors, apply_visitors_time,
		      [{ResetTime, AccTime}]}),
	  ok
    end,
    {noreply, State};
do_handle_info({add_login_time, Account, AddTime},
	       State) ->
    Now = date:unixtime(),
    case ets:lookup(c_role_auth_visitors_info, Account) of
      [{Account, ResetTime, AccTime} | _]
	  when ResetTime > Now ->
	  ets:insert(c_role_auth_visitors_info,
		     {Account, ResetTime, AccTime + AddTime}),
	  dets:insert(c_role_auth_visitors_info,
		      {Account, ResetTime, AccTime + AddTime});
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_role_auth_visitors139, _,
	     {__Levelc_role_auth_visitors139,
	      __Tracesc_role_auth_visitors139}}
		when __Levelc_role_auth_visitors139 band 8 /= 0 orelse
		       __Tracesc_role_auth_visitors139 /= [] ->
		lager:do_log(error,
			     [{module, c_role_auth_visitors},
			      {function, do_handle_info}, {line, 139},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("游客模式累加时间时异常，找不到数据:~w",
					   [{Account, _Err}]),
			     none, 4096, 8, __Levelc_role_auth_visitors139,
			     __Tracesc_role_auth_visitors139, lager_event,
			     __Pidc_role_auth_visitors139);
	    _ -> ok
	  end,
	  ok
    end,
    {noreply, State};
do_handle_info({time_out, Account}, State) ->
    Now = date:unixtime(),
    case ets:lookup(c_role_auth_visitors_info, Account) of
      [{Account, ResetTime, _AccTime} | _]
	  when ResetTime > Now ->
	  ets:insert(c_role_auth_visitors_info,
		     {Account, ResetTime, 3600}),
	  dets:insert(c_role_auth_visitors_info,
		      {Account, ResetTime, 3600});
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidc_role_auth_visitors151, _,
	     {__Levelc_role_auth_visitors151,
	      __Tracesc_role_auth_visitors151}}
		when __Levelc_role_auth_visitors151 band 8 /= 0 orelse
		       __Tracesc_role_auth_visitors151 /= [] ->
		lager:do_log(error,
			     [{module, c_role_auth_visitors},
			      {function, do_handle_info}, {line, 151},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("游客模式累加时间时异常，找不到数据:~w",
					   [{Account, _Err}]),
			     none, 4096, 8, __Levelc_role_auth_visitors151,
			     __Tracesc_role_auth_visitors151, lager_event,
			     __Pidc_role_auth_visitors151);
	    _ -> ok
	  end,
	  ok
    end,
    {noreply, State};
do_handle_info(_Info, State) -> {noreply, State}.


