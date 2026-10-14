-file("src/mod/formation_role/formation_role_mgr.erl",
      1).

-module(formation_role_mgr).

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

-file("src/mod/formation_role/formation_role_mgr.erl",
      13).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> formation_role_mgr ! Info.

cast(Info) -> gen_server:cast(formation_role_mgr, Info).

call(Info) ->
    case catch gen_server:call(formation_role_mgr, Info,
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
	    {__Pidformation_role_mgr30, _,
	     {__Levelformation_role_mgr30,
	      __Tracesformation_role_mgr30}}
		when __Levelformation_role_mgr30 band 8 /= 0 orelse
		       __Tracesformation_role_mgr30 /= [] ->
		lager:do_log(error,
			     [{module, formation_role_mgr}, {function, call},
			      {line, 30}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [formation_role_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelformation_role_mgr30,
			     __Tracesformation_role_mgr30, lager_event,
			     __Pidformation_role_mgr30);
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
    gen_server:start_link({local, formation_role_mgr},
			  formation_role_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidformation_role_mgr36, _,
       {__Levelformation_role_mgr36,
	__Tracesformation_role_mgr36}}
	  when __Levelformation_role_mgr36 band 64 /= 0 orelse
		 __Tracesformation_role_mgr36 /= [] ->
	  lager:do_log(info,
		       [{module, formation_role_mgr}, {function, init},
			{line, 36}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [formation_role_mgr]),
		       none, 4096, 64, __Levelformation_role_mgr36,
		       __Tracesformation_role_mgr36, lager_event,
		       __Pidformation_role_mgr36);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    formation_role_match_mgr:start_match_pro(),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidformation_role_mgr40, _,
       {__Levelformation_role_mgr40,
	__Tracesformation_role_mgr40}}
	  when __Levelformation_role_mgr40 band 64 /= 0 orelse
		 __Tracesformation_role_mgr40 /= [] ->
	  lager:do_log(info,
		       [{module, formation_role_mgr}, {function, init},
			{line, 40}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [formation_role_mgr]), none,
		       4096, 64, __Levelformation_role_mgr40,
		       __Tracesformation_role_mgr40, lager_event,
		       __Pidformation_role_mgr40);
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
	    {__Pidformation_role_mgr48, _,
	     {__Levelformation_role_mgr48,
	      __Tracesformation_role_mgr48}}
		when __Levelformation_role_mgr48 band 8 /= 0 orelse
		       __Tracesformation_role_mgr48 /= [] ->
		lager:do_log(error,
			     [{module, formation_role_mgr},
			      {function, handle_call}, {line, 48},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelformation_role_mgr48,
			     __Tracesformation_role_mgr48, lager_event,
			     __Pidformation_role_mgr48);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    formation_role_mgr, 49, _Reason}),
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
	    {__Pidformation_role_mgr61, _,
	     {__Levelformation_role_mgr61,
	      __Tracesformation_role_mgr61}}
		when __Levelformation_role_mgr61 band 8 /= 0 orelse
		       __Tracesformation_role_mgr61 /= [] ->
		lager:do_log(error,
			     [{module, formation_role_mgr},
			      {function, handle_info}, {line, 61},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelformation_role_mgr61,
			     __Tracesformation_role_mgr61, lager_event,
			     __Pidformation_role_mgr61);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    formation_role_mgr, 62, _Reason}),
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
      {__Pidformation_role_mgr67, _,
       {__Levelformation_role_mgr67,
	__Tracesformation_role_mgr67}}
	  when __Levelformation_role_mgr67 band 64 /= 0 orelse
		 __Tracesformation_role_mgr67 /= [] ->
	  lager:do_log(info,
		       [{module, formation_role_mgr}, {function, terminate},
			{line, 67}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelformation_role_mgr67,
		       __Tracesformation_role_mgr67, lager_event,
		       __Pidformation_role_mgr67);
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
	    {__Pidformation_role_mgr79, _,
	     {__Levelformation_role_mgr79,
	      __Tracesformation_role_mgr79}}
		when __Levelformation_role_mgr79 band 8 /= 0 orelse
		       __Tracesformation_role_mgr79 /= [] ->
		lager:do_log(error,
			     [{module, formation_role_mgr},
			      {function, do_handle_call}, {line, 79},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelformation_role_mgr79,
			     __Tracesformation_role_mgr79, lager_event,
			     __Pidformation_role_mgr79);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    formation_role_mgr, 80, _Reason}),
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
	    {__Pidformation_role_mgr93, _,
	     {__Levelformation_role_mgr93,
	      __Tracesformation_role_mgr93}}
		when __Levelformation_role_mgr93 band 8 /= 0 orelse
		       __Tracesformation_role_mgr93 /= [] ->
		lager:do_log(error,
			     [{module, formation_role_mgr},
			      {function, do_handle_info}, {line, 93},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelformation_role_mgr93,
			     __Tracesformation_role_mgr93, lager_event,
			     __Pidformation_role_mgr93);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    formation_role_mgr, 94, _Reason}),
	  {noreply, State}
    end;
do_handle_info(_Info, State) -> {noreply, State}.


