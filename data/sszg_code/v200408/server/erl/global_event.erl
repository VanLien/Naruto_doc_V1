-file("src/mod/misc/global_event.erl", 1).

-module(global_event).

-lager_records([]).

-behaviour(gen_server).

-export([start_link/0, stop/0, init/1, handle_call/3,
	 handle_cast/2, handle_info/2, terminate/2,
	 code_change/3]).

-export([reset_timer/0]).

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

-file("src/mod/misc/global_event.erl", 11).

start_link() ->
    gen_server:start_link({local, global_event},
			  global_event, [], []).

reset_timer() -> global_event ! reset_timer.

stop() -> ok.

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidglobal_event21, _,
       {__Levelglobal_event21, __Tracesglobal_event21}}
	  when __Levelglobal_event21 band 64 /= 0 orelse
		 __Tracesglobal_event21 /= [] ->
	  lager:do_log(info,
		       [{module, global_event}, {function, init}, {line, 21},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动...", none, 4096, 64, __Levelglobal_event21,
		       __Tracesglobal_event21, lager_event,
		       __Pidglobal_event21);
      _ -> ok
    end,
    Sec = date:next_diff({0, 0, 1}) * 1000,
    Sec1 = Sec + util:rand(0, 100),
    util:set_ms_timer(loop_daily, Sec1, loop_daily),
    SecToFive = date:next_diff({5, 0, 0}) * 1000 +
		  util:rand(0, 100),
    util:set_ms_timer(loop_five, SecToFive, loop_five),
    util:set_timer(loop_per_hour_init, 10,
		   loop_per_hour_init),
    global_event_listener:app_start(sys_env:get(server_type)),
    util:set_timer(artifact_exchange_ret,
		   artifact_exchange_data:get_const(ref_time),
		   artifact_exchange_ref),
    {ok, undefined}.

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(loop_daily, State) ->
    Week = date:day_of_the_week(),
    case catch
	   global_event_listener:loop_daily_zero_hour(sys_env:get(server_type),
						      Week)
	of
      ok -> ignore;
      {'EXIT', Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidglobal_event44, _,
	     {__Levelglobal_event44, __Tracesglobal_event44}}
		when __Levelglobal_event44 band 8 /= 0 orelse
		       __Tracesglobal_event44 /= [] ->
		lager:do_log(error,
			     [{module, global_event}, {function, handle_info},
			      {line, 44}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("调用错误~w", [Reason]), none, 4096, 8,
			     __Levelglobal_event44, __Tracesglobal_event44,
			     lager_event, __Pidglobal_event44);
	    _ -> ok
	  end;
      _ -> ignore
    end,
    Sec = date:next_diff({0, 0, 1}) * 1000,
    Sec1 = Sec + util:rand(0, 100),
    util:set_ms_timer(loop_daily, Sec1, loop_daily),
    {noreply, State};
handle_info(loop_five, State) ->
    Week = date:day_of_the_week(),
    case catch
	   global_event_listener:loop_five(sys_env:get(server_type),
					   Week)
	of
      ok -> ignore;
      {'EXIT', Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidglobal_event56, _,
	     {__Levelglobal_event56, __Tracesglobal_event56}}
		when __Levelglobal_event56 band 8 /= 0 orelse
		       __Tracesglobal_event56 /= [] ->
		lager:do_log(error,
			     [{module, global_event}, {function, handle_info},
			      {line, 56}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("调用错误~w", [Reason]), none, 4096, 8,
			     __Levelglobal_event56, __Tracesglobal_event56,
			     lager_event, __Pidglobal_event56);
	    _ -> ok
	  end;
      _ -> ignore
    end,
    SecToFive = date:next_diff({5, 0, 0}) * 1000 +
		  util:rand(0, 100),
    util:set_ms_timer(loop_five, SecToFive, loop_five),
    {noreply, State};
handle_info(reset_timer, State) ->
    Sec = date:next_diff({0, 0, 1}) * 1000,
    Sec1 = Sec + util:rand(0, 100),
    util:set_ms_timer(loop_daily, Sec1, loop_daily),
    SecToFive = date:next_diff({5, 0, 0}) * 1000 +
		  util:rand(0, 100),
    util:set_ms_timer(loop_five, SecToFive, loop_five),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidglobal_event71, _,
       {__Levelglobal_event71, __Tracesglobal_event71}}
	  when __Levelglobal_event71 band 64 /= 0 orelse
		 __Tracesglobal_event71 /= [] ->
	  lager:do_log(info,
		       [{module, global_event}, {function, handle_info},
			{line, 71}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("重置全局定时器成功，0点刷新剩余ms:~w, 5点刷新剩余ms:~w",
				     [Sec1, SecToFive]),
		       none, 4096, 64, __Levelglobal_event71,
		       __Tracesglobal_event71, lager_event,
		       __Pidglobal_event71);
      _ -> ok
    end,
    {noreply, State};
handle_info(loop_per_hour_init, State) ->
    {_Date, {H, I, S}} = calendar:local_time(),
    Sec = 60 * (60 - I) - S,
    erlang:send_after(1000 * Sec, global_event,
		      {loop_per_hour, H + 1}),
    {noreply, State};
handle_info({loop_per_hour, Hour}, State) ->
    NextHour = (Hour + 1) rem 24,
    case catch
	   global_event_listener:loop_pm_per_hour(sys_env:get(server_type),
						  Hour)
	of
      ok -> ignore;
      {'EXIT', Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidglobal_event86, _,
	     {__Levelglobal_event86, __Tracesglobal_event86}}
		when __Levelglobal_event86 band 8 /= 0 orelse
		       __Tracesglobal_event86 /= [] ->
		lager:do_log(error,
			     [{module, global_event}, {function, handle_info},
			      {line, 86}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("调用错误~w", [Reason]), none, 4096, 8,
			     __Levelglobal_event86, __Tracesglobal_event86,
			     lager_event, __Pidglobal_event86);
	    _ -> ok
	  end;
      _ -> ignore
    end,
    util:set_timer(loop_pm_per_hour, 3600,
		   {loop_per_hour, NextHour}),
    {noreply, State};
handle_info(artifact_exchange_ref, State) ->
    exchange_artifact:notify_ref(),
    util:set_timer(artifact_exchange_ret,
		   artifact_exchange_data:get_const(ref_time),
		   artifact_exchange_ref),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(Reason, _State) ->
    util:unset_all_timer(),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidglobal_event103, _,
       {__Levelglobal_event103, __Tracesglobal_event103}}
	  when __Levelglobal_event103 band 8 /= 0 orelse
		 __Tracesglobal_event103 /= [] ->
	  lager:do_log(error,
		       [{module, global_event}, {function, terminate},
			{line, 103}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("关闭完成~w", [Reason]), none, 4096, 8,
		       __Levelglobal_event103, __Tracesglobal_event103,
		       lager_event, __Pidglobal_event103);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.


