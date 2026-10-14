-file("src/mod/log/log_mgr.erl", 1).

-module(log_mgr).

-lager_records([{state, [next_id, switch]}]).

-behaviour(gen_server).

-export([write/1, info/1, cast/1, call/1, print/0,
	 start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {next_id = 0, switch = open}).

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

-file("src/mod/log/log_mgr.erl", 12).

write(Log) -> log_mgr ! {write, Log}.

info(Info) -> log_mgr ! Info.

cast(Info) -> gen_server:cast(log_mgr, Info).

call(Info) ->
    case catch gen_server:call(log_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlog_mgr25, _,
	     {__Levellog_mgr25, __Traceslog_mgr25}}
		when __Levellog_mgr25 band 8 /= 0 orelse
		       __Traceslog_mgr25 /= [] ->
		lager:do_log(error,
			     [{module, log_mgr}, {function, call}, {line, 25},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [log_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levellog_mgr25, __Traceslog_mgr25,
			     lager_event, __Pidlog_mgr25);
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

print() -> log_mgr ! print.

start_link() ->
    gen_server:start_link({local, log_mgr}, log_mgr, [],
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
      {__Pidlog_mgr34, _,
       {__Levellog_mgr34, __Traceslog_mgr34}}
	  when __Levellog_mgr34 band 64 /= 0 orelse
		 __Traceslog_mgr34 /= [] ->
	  lager:do_log(info,
		       [{module, log_mgr}, {function, init}, {line, 34},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [log_mgr]), none, 4096,
		       64, __Levellog_mgr34, __Traceslog_mgr34, lager_event,
		       __Pidlog_mgr34);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    ets:new(log_pids,
	    [set, named_table, public, {keypos, 1}]),
    log_file:start_num(),
    start_proc(5),
    start_type_proc(),
    NextId = sys_env:get(log_next_id, 1),
    State = #state{next_id = NextId},
    erlang:send_after(50000, self(), loop),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlog_mgr43, _,
       {__Levellog_mgr43, __Traceslog_mgr43}}
	  when __Levellog_mgr43 band 64 /= 0 orelse
		 __Traceslog_mgr43 /= [] ->
	  lager:do_log(info,
		       [{module, log_mgr}, {function, init}, {line, 43},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成 log_next_id=~w",
				     [log_mgr, NextId]),
		       none, 4096, 64, __Levellog_mgr43, __Traceslog_mgr43,
		       lager_event, __Pidlog_mgr43);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({write, Content = #{"header_type" := Type}},
	    State = #state{next_id = Id, switch = open}) ->
    Pid = get_type_pid(Type),
    Pid ! {write, Id, Content},
    NextId = Id + 1,
    {noreply, State#state{next_id = NextId}};
handle_info({write, Content},
	    State = #state{next_id = Id, switch = open}) ->
    Pid = get(Id rem 5 + 1),
    Pid ! {write, Id, Content},
    NextId = Id + 1,
    {noreply, State#state{next_id = NextId}};
handle_info(loop, State = #state{next_id = NextId}) ->
    sys_env:save(log_next_id, NextId),
    erlang:send_after(5000, self(), loop),
    {noreply, State};
handle_info({switch, Switch}, State) ->
    {noreply, State#state{switch = Switch}};
handle_info({'EXIT', Pid, Reason}, State)
    when Reason =/= normal ->
    case erase(Pid) of
      {Type, N} ->
	  erase({Type, N}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlog_mgr77, _,
	     {__Levellog_mgr77, __Traceslog_mgr77}}
		when __Levellog_mgr77 band 8 /= 0 orelse
		       __Traceslog_mgr77 /= [] ->
		lager:do_log(error,
			     [{module, log_mgr}, {function, handle_info},
			      {line, 77}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("收到日志[~s_~w]异常退出信息:~w",
					   [Type, N, Reason]),
			     none, 4096, 8, __Levellog_mgr77, __Traceslog_mgr77,
			     lager_event, __Pidlog_mgr77);
	    _ -> ok
	  end;
      FileName when is_list(FileName) ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlog_mgr79, _,
	     {__Levellog_mgr79, __Traceslog_mgr79}}
		when __Levellog_mgr79 band 8 /= 0 orelse
		       __Traceslog_mgr79 /= [] ->
		lager:do_log(error,
			     [{module, log_mgr}, {function, handle_info},
			      {line, 79}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("收到日志[~s]异常退出信息:~w",
					   [FileName, Reason]),
			     none, 4096, 8, __Levellog_mgr79, __Traceslog_mgr79,
			     lager_event, __Pidlog_mgr79);
	    _ -> ok
	  end,
	  case log_proc:start_link(FileName, false) of
	    {ok, NPid} -> put(NPid, FileName), put(FileName, NPid);
	    _Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidlog_mgr84, _,
		   {__Levellog_mgr84, __Traceslog_mgr84}}
		      when __Levellog_mgr84 band 8 /= 0 orelse
			     __Traceslog_mgr84 /= [] ->
		      lager:do_log(error,
				   [{module, log_mgr}, {function, handle_info},
				    {line, 84}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   io_lib:format("重启日志[~s]失败:~w",
						 [FileName, _Err]),
				   none, 4096, 8, __Levellog_mgr84,
				   __Traceslog_mgr84, lager_event,
				   __Pidlog_mgr84);
		  _ -> ok
		end
	  end;
      _Err -> ok
    end,
    {noreply, State};
handle_info(print, State) ->
    [Pid ! print || {_, Pid} <- get(), is_pid(Pid)],
    {noreply, State};
handle_info(_Info, State = #state{switch = open}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlog_mgr96, _,
       {__Levellog_mgr96, __Traceslog_mgr96}}
	  when __Levellog_mgr96 band 8 /= 0 orelse
		 __Traceslog_mgr96 /= [] ->
	  lager:do_log(error,
		       [{module, log_mgr}, {function, handle_info}, {line, 96},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("接收到非法信息:~w", [_Info]), none, 4096, 8,
		       __Levellog_mgr96, __Traceslog_mgr96, lager_event,
		       __Pidlog_mgr96);
      _ -> ok
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, #state{next_id = NextId}) ->
    sys_env:save(log_next_id, NextId),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlog_mgr103, _,
       {__Levellog_mgr103, __Traceslog_mgr103}}
	  when __Levellog_mgr103 band 64 /= 0 orelse
		 __Traceslog_mgr103 /= [] ->
	  lager:do_log(info,
		       [{module, log_mgr}, {function, terminate}, {line, 103},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("关闭:~w", [_Reason]), none, 4096, 64,
		       __Levellog_mgr103, __Traceslog_mgr103, lager_event,
		       __Pidlog_mgr103);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

start_proc(0) -> ok;
start_proc(N) ->
    FileName = lists:concat(["log_", N]),
    {ok, Pid} = log_proc:start_link(FileName, N =:= 1),
    put(FileName, Pid),
    put(Pid, FileName),
    put(N, Pid),
    start_proc(N - 1).

get_type_pid(Type) ->
    Id = util:get({log_idx, Type}, 0),
    put({log_idx, Type}, Id + 1),
    MaxProc = type_proc_num(Type),
    N = Id rem MaxProc + 1,
    case get({Type, N}) of
      undefined -> start_type_proc(Type, N);
      Pid -> Pid
    end.

start_type_proc() ->
    [start_type_proc(Type) || Type <- type_list()].

start_type_proc(Type) ->
    [start_type_proc(Type, N)
     || N <- lists:seq(1, type_proc_num(Type))].

start_type_proc(Type, N) ->
    FileName = lists:concat(["log_", util:to_list(Type),
			     "_", N]),
    {ok, Pid} = log_proc:start_link(FileName, false),
    put({Type, N}, Pid),
    put(Pid, {Type, N}),
    Pid.

type_list() ->
    [<<"virtual-currencies">>, <<"virtual-items">>,
     <<"level-up">>, <<"task-log">>, <<"custom-event">>,
     <<"join-log">>, <<"payment">>, <<"experience">>,
     <<"login">>, <<"session">>, <<"rank-list">>].

type_proc_num(<<"virtual-currencies">>) -> 5;
type_proc_num(<<"virtual-items">>) -> 3;
type_proc_num(<<"task-log">>) -> 3;
type_proc_num(<<"experience">>) -> 3;
type_proc_num(<<"pet">>) -> 5;
type_proc_num(_) -> 2.


