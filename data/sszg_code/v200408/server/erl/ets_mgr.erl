-file("src/ets_mgr.erl", 1).

-module(ets_mgr).

-lager_records([{state, [clear_ets_list]}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {clear_ets_list = []}).

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

-file("src/ets_mgr.erl", 13).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> ets_mgr ! Info.

cast(Info) -> gen_server:cast(ets_mgr, Info).

call(Info) ->
    case catch gen_server:call(ets_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidets_mgr33, _,
	     {__Levelets_mgr33, __Tracesets_mgr33}}
		when __Levelets_mgr33 band 8 /= 0 orelse
		       __Tracesets_mgr33 /= [] ->
		lager:do_log(error,
			     [{module, ets_mgr}, {function, call}, {line, 33},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [ets_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelets_mgr33, __Tracesets_mgr33,
			     lager_event, __Pidets_mgr33);
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
    gen_server:start_link({local, ets_mgr}, ets_mgr, [],
			  []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidets_mgr39, _,
       {__Levelets_mgr39, __Tracesets_mgr39}}
	  when __Levelets_mgr39 band 64 /= 0 orelse
		 __Tracesets_mgr39 /= [] ->
	  lager:do_log(info,
		       [{module, ets_mgr}, {function, init}, {line, 39},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [ets_mgr]), none, 4096,
		       64, __Levelets_mgr39, __Tracesets_mgr39, lager_event,
		       __Pidets_mgr39);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    State = #state{},
    util:set_timer(ets_clear, {23, 20, util:rand(0, 59)},
		   ets_clear),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidets_mgr43, _,
       {__Levelets_mgr43, __Tracesets_mgr43}}
	  when __Levelets_mgr43 band 64 /= 0 orelse
		 __Tracesets_mgr43 /= [] ->
	  lager:do_log(info,
		       [{module, ets_mgr}, {function, init}, {line, 43},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [ets_mgr]), none, 4096, 64,
		       __Levelets_mgr43, __Tracesets_mgr43, lager_event,
		       __Pidets_mgr43);
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
	    {__Pidets_mgr51, _,
	     {__Levelets_mgr51, __Tracesets_mgr51}}
		when __Levelets_mgr51 band 8 /= 0 orelse
		       __Tracesets_mgr51 /= [] ->
		lager:do_log(error,
			     [{module, ets_mgr}, {function, handle_call},
			      {line, 51}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelets_mgr51, __Tracesets_mgr51,
			     lager_event, __Pidets_mgr51);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    ets_mgr, 52, _Reason}),
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
	    {__Pidets_mgr64, _,
	     {__Levelets_mgr64, __Tracesets_mgr64}}
		when __Levelets_mgr64 band 8 /= 0 orelse
		       __Tracesets_mgr64 /= [] ->
		lager:do_log(error,
			     [{module, ets_mgr}, {function, handle_info},
			      {line, 64}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelets_mgr64, __Tracesets_mgr64,
			     lager_event, __Pidets_mgr64);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    ets_mgr, 65, _Reason}),
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
      {__Pidets_mgr70, _,
       {__Levelets_mgr70, __Tracesets_mgr70}}
	  when __Levelets_mgr70 band 64 /= 0 orelse
		 __Tracesets_mgr70 /= [] ->
	  lager:do_log(info,
		       [{module, ets_mgr}, {function, terminate}, {line, 70},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelets_mgr70,
		       __Tracesets_mgr70, lager_event, __Pidets_mgr70);
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
	    {__Pidets_mgr82, _,
	     {__Levelets_mgr82, __Tracesets_mgr82}}
		when __Levelets_mgr82 band 8 /= 0 orelse
		       __Tracesets_mgr82 /= [] ->
		lager:do_log(error,
			     [{module, ets_mgr}, {function, do_handle_call},
			      {line, 82}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelets_mgr82, __Tracesets_mgr82,
			     lager_event, __Pidets_mgr82);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    ets_mgr, 83, _Reason}),
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
	    {__Pidets_mgr96, _,
	     {__Levelets_mgr96, __Tracesets_mgr96}}
		when __Levelets_mgr96 band 8 /= 0 orelse
		       __Tracesets_mgr96 /= [] ->
		lager:do_log(error,
			     [{module, ets_mgr}, {function, do_handle_info},
			      {line, 96}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelets_mgr96, __Tracesets_mgr96,
			     lager_event, __Pidets_mgr96);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    ets_mgr, 97, _Reason}),
	  {noreply, State}
    end;
do_handle_info(ets_clear, State) ->
    util:set_timer(ets_clear, {23, 20, util:rand(0, 59)},
		   ets_clear),
    erlang:send_after(util:rand(1, 300000), self(),
		      ets_clear_next),
    {noreply, State};
do_handle_info(ets_clear_next,
	       State = #state{clear_ets_list =
				  [{EtsTab, ToDo} | T]}) ->
    case ets:info(EtsTab, size) of
      undefined -> pass;
      N ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidets_mgr109, _,
	     {__Levelets_mgr109, __Tracesets_mgr109}}
		when __Levelets_mgr109 band 64 /= 0 orelse
		       __Tracesets_mgr109 /= [] ->
		lager:do_log(info,
			     [{module, ets_mgr}, {function, do_handle_info},
			      {line, 109}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("清空ets数据:~w size=~w", [EtsTab, N]),
			     none, 4096, 64, __Levelets_mgr109,
			     __Tracesets_mgr109, lager_event, __Pidets_mgr109);
	    _ -> ok
	  end,
	  case ToDo of
	    true -> dets:insert(EtsTab, ets:tab2list(EtsTab));
	    {Mod, Fun} -> Mod:Fun();
	    _ -> pass
	  end,
	  ets:delete_all_objects(EtsTab)
    end,
    erlang:send_after(util:rand(1, 5000), self(),
		      ets_clear_next),
    {noreply, State#state{clear_ets_list = T}};
do_handle_info(_Info, State) -> {noreply, State}.


