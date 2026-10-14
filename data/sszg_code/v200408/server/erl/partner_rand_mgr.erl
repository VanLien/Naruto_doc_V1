-file("src/mod/partner_rand/partner_rand_mgr.erl", 1).

-module(partner_rand_mgr).

-lager_records([{state, []}]).

-behaviour(gen_server).

-export([call_apply/1, apply/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([get_num/1]).

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

-file("src/mod/partner_rand/partner_rand_mgr.erl", 16).

-spec get_num({pos_integer(), pos_integer(),
	       pos_integer()}) -> pos_integer().

get_num(Key) ->
    case ets:lookup(partner_rand_max_num, Key) of
      [{_, NumT} | _] -> NumT;
      _ -> 0
    end.

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> partner_rand_mgr ! Info.

cast(Info) -> gen_server:cast(partner_rand_mgr, Info).

call(Info) ->
    case catch gen_server:call(partner_rand_mgr, Info,
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
	    {__Pidpartner_rand_mgr42, _,
	     {__Levelpartner_rand_mgr42, __Tracespartner_rand_mgr42}}
		when __Levelpartner_rand_mgr42 band 8 /= 0 orelse
		       __Tracespartner_rand_mgr42 /= [] ->
		lager:do_log(error,
			     [{module, partner_rand_mgr}, {function, call},
			      {line, 42}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [partner_rand_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelpartner_rand_mgr42,
			     __Tracespartner_rand_mgr42, lager_event,
			     __Pidpartner_rand_mgr42);
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
    gen_server:start_link({local, partner_rand_mgr},
			  partner_rand_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_rand_mgr48, _,
       {__Levelpartner_rand_mgr48, __Tracespartner_rand_mgr48}}
	  when __Levelpartner_rand_mgr48 band 64 /= 0 orelse
		 __Tracespartner_rand_mgr48 /= [] ->
	  lager:do_log(info,
		       [{module, partner_rand_mgr}, {function, init},
			{line, 48}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [partner_rand_mgr]), none,
		       4096, 64, __Levelpartner_rand_mgr48,
		       __Tracespartner_rand_mgr48, lager_event,
		       __Pidpartner_rand_mgr48);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    partner_rand_match_mgr:do_open_match_pro(),
    d_ets_lib:new_ets(partner_rand_max_num, 1, set),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_rand_mgr53, _,
       {__Levelpartner_rand_mgr53, __Tracespartner_rand_mgr53}}
	  when __Levelpartner_rand_mgr53 band 64 /= 0 orelse
		 __Tracespartner_rand_mgr53 /= [] ->
	  lager:do_log(info,
		       [{module, partner_rand_mgr}, {function, init},
			{line, 53}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [partner_rand_mgr]), none,
		       4096, 64, __Levelpartner_rand_mgr53,
		       __Tracespartner_rand_mgr53, lager_event,
		       __Pidpartner_rand_mgr53);
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
	    {__Pidpartner_rand_mgr61, _,
	     {__Levelpartner_rand_mgr61, __Tracespartner_rand_mgr61}}
		when __Levelpartner_rand_mgr61 band 8 /= 0 orelse
		       __Tracespartner_rand_mgr61 /= [] ->
		lager:do_log(error,
			     [{module, partner_rand_mgr},
			      {function, handle_call}, {line, 61},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelpartner_rand_mgr61,
			     __Tracespartner_rand_mgr61, lager_event,
			     __Pidpartner_rand_mgr61);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    partner_rand_mgr, 62, _Reason}),
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
	    {__Pidpartner_rand_mgr74, _,
	     {__Levelpartner_rand_mgr74, __Tracespartner_rand_mgr74}}
		when __Levelpartner_rand_mgr74 band 8 /= 0 orelse
		       __Tracespartner_rand_mgr74 /= [] ->
		lager:do_log(error,
			     [{module, partner_rand_mgr},
			      {function, handle_info}, {line, 74},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelpartner_rand_mgr74,
			     __Tracespartner_rand_mgr74, lager_event,
			     __Pidpartner_rand_mgr74);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    partner_rand_mgr, 75, _Reason}),
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
      {__Pidpartner_rand_mgr80, _,
       {__Levelpartner_rand_mgr80, __Tracespartner_rand_mgr80}}
	  when __Levelpartner_rand_mgr80 band 64 /= 0 orelse
		 __Tracespartner_rand_mgr80 /= [] ->
	  lager:do_log(info,
		       [{module, partner_rand_mgr}, {function, terminate},
			{line, 80}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelpartner_rand_mgr80,
		       __Tracespartner_rand_mgr80, lager_event,
		       __Pidpartner_rand_mgr80);
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
	    {__Pidpartner_rand_mgr92, _,
	     {__Levelpartner_rand_mgr92, __Tracespartner_rand_mgr92}}
		when __Levelpartner_rand_mgr92 band 8 /= 0 orelse
		       __Tracespartner_rand_mgr92 /= [] ->
		lager:do_log(error,
			     [{module, partner_rand_mgr},
			      {function, do_handle_call}, {line, 92},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelpartner_rand_mgr92,
			     __Tracespartner_rand_mgr92, lager_event,
			     __Pidpartner_rand_mgr92);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    partner_rand_mgr, 93, _Reason}),
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
	    {__Pidpartner_rand_mgr106, _,
	     {__Levelpartner_rand_mgr106,
	      __Tracespartner_rand_mgr106}}
		when __Levelpartner_rand_mgr106 band 8 /= 0 orelse
		       __Tracespartner_rand_mgr106 /= [] ->
		lager:do_log(error,
			     [{module, partner_rand_mgr},
			      {function, do_handle_info}, {line, 106},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelpartner_rand_mgr106,
			     __Tracespartner_rand_mgr106, lager_event,
			     __Pidpartner_rand_mgr106);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    partner_rand_mgr, 107, _Reason}),
	  {noreply, State}
    end;
do_handle_info(sync_data, State) ->
    erlang:send_after(util:rand(1, 300000), self(),
		      do_sync_data),
    {noreply, State};
do_handle_info(do_sync_data, State) ->
    big_world_lib:cast(center, c_partner_rand_mgr, info,
		       [{sync_data, self()}]),
    {noreply, State};
do_handle_info({update_max_num,
		{Bid, Star, PowerType, MaxNum}},
	       State) ->
    ets:insert(partner_rand_max_num,
	       {{Bid, Star, PowerType}, MaxNum}),
    {noreply, State};
do_handle_info({sync_status_to_zone, L}, State) ->
    ets:insert(partner_rand_max_num, L), {noreply, State};
do_handle_info(c_partner_rand_do_rester, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidpartner_rand_mgr128, _,
       {__Levelpartner_rand_mgr128,
	__Tracespartner_rand_mgr128}}
	  when __Levelpartner_rand_mgr128 band 64 /= 0 orelse
		 __Tracespartner_rand_mgr128 /= [] ->
	  lager:do_log(info,
		       [{module, partner_rand_mgr}, {function, do_handle_info},
			{line, 128}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "中央服重置了英雄池数据", none, 4096, 64,
		       __Levelpartner_rand_mgr128, __Tracespartner_rand_mgr128,
		       lager_event, __Pidpartner_rand_mgr128);
      _ -> ok
    end,
    ets:delete_all_objects(partner_rand_max_num),
    {noreply, State};
do_handle_info(_Info, State) -> {noreply, State}.


