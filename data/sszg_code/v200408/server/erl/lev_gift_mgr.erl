-file("src/mod/holiday_lev_gift/lev_gift_mgr.erl", 1).

-module(lev_gift_mgr).

-lager_records([{state, []}]).

-behaviour(gen_server).

-export([info/1, cast/1, call/1, start_link/0,
	 get_count/1]).

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

-file("src/mod/holiday_lev_gift/lev_gift_mgr.erl", 12).

-spec get_count(pos_integer()) -> pos_integer().

get_count(Id) ->
    case catch ets:lookup(lev_gift, Id) of
      [{Id, Count}] -> Count;
      _ -> 0
    end.

info(Info) -> lev_gift_mgr ! Info.

cast(Info) -> gen_server:cast(lev_gift_mgr, Info).

call(Info) ->
    case catch gen_server:call(lev_gift_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidlev_gift_mgr29, _,
	     {__Levellev_gift_mgr29, __Traceslev_gift_mgr29}}
		when __Levellev_gift_mgr29 band 8 /= 0 orelse
		       __Traceslev_gift_mgr29 /= [] ->
		lager:do_log(error,
			     [{module, lev_gift_mgr}, {function, call},
			      {line, 29}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [lev_gift_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levellev_gift_mgr29,
			     __Traceslev_gift_mgr29, lager_event,
			     __Pidlev_gift_mgr29);
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
    gen_server:start_link({local, lev_gift_mgr},
			  lev_gift_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlev_gift_mgr35, _,
       {__Levellev_gift_mgr35, __Traceslev_gift_mgr35}}
	  when __Levellev_gift_mgr35 band 64 /= 0 orelse
		 __Traceslev_gift_mgr35 /= [] ->
	  lager:do_log(info,
		       [{module, lev_gift_mgr}, {function, init}, {line, 35},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [lev_gift_mgr]), none,
		       4096, 64, __Levellev_gift_mgr35, __Traceslev_gift_mgr35,
		       lager_event, __Pidlev_gift_mgr35);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(lev_gift,
		   [{file, "./dets/lev_gift.dets"}, {keypos, 1}]),
    ets:new(lev_gift,
	    [set, named_table, public, {keypos, 1}]),
    ets:from_dets(lev_gift, lev_gift),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlev_gift_mgr42, _,
       {__Levellev_gift_mgr42, __Traceslev_gift_mgr42}}
	  when __Levellev_gift_mgr42 band 64 /= 0 orelse
		 __Traceslev_gift_mgr42 /= [] ->
	  lager:do_log(info,
		       [{module, lev_gift_mgr}, {function, init}, {line, 42},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [lev_gift_mgr]), none, 4096,
		       64, __Levellev_gift_mgr42, __Traceslev_gift_mgr42,
		       lager_event, __Pidlev_gift_mgr42);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidlev_gift_mgr55, _,
       {__Levellev_gift_mgr55, __Traceslev_gift_mgr55}}
	  when __Levellev_gift_mgr55 band 64 /= 0 orelse
		 __Traceslev_gift_mgr55 /= [] ->
	  lager:do_log(info,
		       [{module, lev_gift_mgr}, {function, terminate},
			{line, 55}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levellev_gift_mgr55,
		       __Traceslev_gift_mgr55, lager_event,
		       __Pidlev_gift_mgr55);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.


