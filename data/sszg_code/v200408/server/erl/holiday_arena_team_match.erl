-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_match.erl",
      1).

-module(holiday_arena_team_match).

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

-file("src/mod/holiday_arena_team/holiday_arena_team"
      "_match.erl",
      13).

call_apply({M, F, A}) -> call({apply, M, F, A}).

apply({M, F, A}) -> info({apply, M, F, A}).

info(Info) -> holiday_arena_team_match ! Info.

cast(Info) ->
    gen_server:cast(holiday_arena_team_match, Info).

call(Info) ->
    case catch gen_server:call(holiday_arena_team_match,
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
	    {__Pidholiday_arena_team_match30, _,
	     {__Levelholiday_arena_team_match30,
	      __Tracesholiday_arena_team_match30}}
		when __Levelholiday_arena_team_match30 band 8 /= 0
		       orelse __Tracesholiday_arena_team_match30 /= [] ->
		lager:do_log(error,
			     [{module, holiday_arena_team_match},
			      {function, call}, {line, 30},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [holiday_arena_team_match, Info,
					    10000, erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelholiday_arena_team_match30,
			     __Tracesholiday_arena_team_match30, lager_event,
			     __Pidholiday_arena_team_match30);
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
    gen_server:start_link({local, holiday_arena_team_match},
			  holiday_arena_team_match, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_match36, _,
       {__Levelholiday_arena_team_match36,
	__Tracesholiday_arena_team_match36}}
	  when __Levelholiday_arena_team_match36 band 64 /= 0
		 orelse __Tracesholiday_arena_team_match36 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_arena_team_match}, {function, init},
			{line, 36}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...",
				     [holiday_arena_team_match]),
		       none, 4096, 64, __Levelholiday_arena_team_match36,
		       __Tracesholiday_arena_team_match36, lager_event,
		       __Pidholiday_arena_team_match36);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidholiday_arena_team_match39, _,
       {__Levelholiday_arena_team_match39,
	__Tracesholiday_arena_team_match39}}
	  when __Levelholiday_arena_team_match39 band 64 /= 0
		 orelse __Tracesholiday_arena_team_match39 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_arena_team_match}, {function, init},
			{line, 39}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [holiday_arena_team_match]),
		       none, 4096, 64, __Levelholiday_arena_team_match39,
		       __Tracesholiday_arena_team_match39, lager_event,
		       __Pidholiday_arena_team_match39);
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
	    {__Pidholiday_arena_team_match47, _,
	     {__Levelholiday_arena_team_match47,
	      __Tracesholiday_arena_team_match47}}
		when __Levelholiday_arena_team_match47 band 8 /= 0
		       orelse __Tracesholiday_arena_team_match47 /= [] ->
		lager:do_log(error,
			     [{module, holiday_arena_team_match},
			      {function, handle_call}, {line, 47},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Request, _Reason]),
			     none, 4096, 8, __Levelholiday_arena_team_match47,
			     __Tracesholiday_arena_team_match47, lager_event,
			     __Pidholiday_arena_team_match47);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Request]),
				    holiday_arena_team_match, 48, _Reason}),
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
	    {__Pidholiday_arena_team_match60, _,
	     {__Levelholiday_arena_team_match60,
	      __Tracesholiday_arena_team_match60}}
		when __Levelholiday_arena_team_match60 band 8 /= 0
		       orelse __Tracesholiday_arena_team_match60 /= [] ->
		lager:do_log(error,
			     [{module, holiday_arena_team_match},
			      {function, handle_info}, {line, 60},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("消息处理错误, 消息:~w, ~w",
					   [Info, _Reason]),
			     none, 4096, 8, __Levelholiday_arena_team_match60,
			     __Tracesholiday_arena_team_match60, lager_event,
			     __Pidholiday_arena_team_match60);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w]出现异常，需马上上线查看处理"/utf8>>,
					      [Info]),
				    holiday_arena_team_match, 61, _Reason}),
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
      {__Pidholiday_arena_team_match66, _,
       {__Levelholiday_arena_team_match66,
	__Tracesholiday_arena_team_match66}}
	  when __Levelholiday_arena_team_match66 band 64 /= 0
		 orelse __Tracesholiday_arena_team_match66 /= [] ->
	  lager:do_log(info,
		       [{module, holiday_arena_team_match},
			{function, terminate}, {line, 66},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64,
		       __Levelholiday_arena_team_match66,
		       __Tracesholiday_arena_team_match66, lager_event,
		       __Pidholiday_arena_team_match66);
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
	    {__Pidholiday_arena_team_match78, _,
	     {__Levelholiday_arena_team_match78,
	      __Tracesholiday_arena_team_match78}}
		when __Levelholiday_arena_team_match78 band 8 /= 0
		       orelse __Tracesholiday_arena_team_match78 /= [] ->
		lager:do_log(error,
			     [{module, holiday_arena_team_match},
			      {function, do_handle_call}, {line, 78},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_arena_team_match78,
			     __Tracesholiday_arena_team_match78, lager_event,
			     __Pidholiday_arena_team_match78);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_arena_team_match, 79, _Reason}),
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
	    {__Pidholiday_arena_team_match92, _,
	     {__Levelholiday_arena_team_match92,
	      __Tracesholiday_arena_team_match92}}
		when __Levelholiday_arena_team_match92 band 8 /= 0
		       orelse __Tracesholiday_arena_team_match92 /= [] ->
		lager:do_log(error,
			     [{module, holiday_arena_team_match},
			      {function, do_handle_info}, {line, 92},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("执行方法~w时，返回错误的格式~w",
					   [{M, F}, _Reason]),
			     none, 4096, 8, __Levelholiday_arena_team_match92,
			     __Tracesholiday_arena_team_match92, lager_event,
			     __Pidholiday_arena_team_match92);
	    _ -> ok
	  end,
	  server_monitor:error_log({2, <<"系统处理异常"/utf8>>,
				    util:fbin(<<"系统处理[~w:~w]出现异常，需马上上线查看处理"/utf8>>,
					      [M, F]),
				    holiday_arena_team_match, 93, _Reason}),
	  {noreply, State}
    end;
do_handle_info(_Info, State) -> {noreply, State}.


