-file("src/mod/honor/honor_mgr.erl", 1).

-module(honor_mgr).

-lager_records([{honor_info, [key, list, end_time]},
		{honor_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr, add_exp, dynamic]},
		{honor, [ver, base_id, expire_time]},
		{m_honor, [ver, used, list]}, {state, []}]).

-behaviour(gen_server).

-export([clear/1, del/2, replace/3, add/3, add/4,
	 lookup/1, role_honors/1]).

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

-file("src/mod/honor/honor_mgr.erl", 21).

-file("inc/honor.hrl", 1).

-record(m_honor, {ver = 1, used = 0, list = []}).

-record(honor, {ver = 1, base_id = 0, expire_time = 0}).

-record(honor_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = [], add_exp = 0, dynamic = 0}).

-record(honor_info,
	{key  :: atom(), list = []  :: list(),
	 end_time = 0  :: non_neg_integer()}).

-file("src/mod/honor/honor_mgr.erl", 22).

lookup(Key) ->
    case catch ets:lookup(honor_info, Key) of
      [H = #honor_info{}] -> H;
      _ -> #honor_info{key = Key}
    end.

-spec role_honors(role_id()) -> list().

role_honors(RoleId) ->
    L = ets:tab2list(honor_info),
    do_role_honors(L, RoleId, []).

do_role_honors([], _RoleId, L) -> L;
do_role_honors([#honor_info{list = List} | T], RoleId,
	       L) ->
    case lists:keyfind(RoleId, 1, List) of
      {RoleId, HonorId} ->
	  do_role_honors(T, RoleId, [HonorId | L]);
      _ -> do_role_honors(T, RoleId, L)
    end.

-spec clear(Key :: atom()) -> any().

clear(Key) -> gen_server:cast(honor_mgr, {clear, Key}).

-spec del(Key :: atom() | [atom()], role_id()) -> ok.

del([], _RoleId) -> ok;
del([Key | T], RoleId) ->
    del(Key, RoleId), del(T, RoleId);
del(Key, RoleId) ->
    gen_server:cast(honor_mgr, {del, Key, RoleId}).

-spec replace(Key :: atom(), Gainers :: list(),
	      Time :: non_neg_integer()) -> any().

replace(Key, [], _Time) ->
    gen_server:cast(honor_mgr, {clear, Key});
replace(Key, Gainers = [_ | _], Time) ->
    gen_server:cast(honor_mgr,
		    {replace, Key, Gainers, Time});
replace(_Key, _Gainers, _Time) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhonor_mgr66, _,
       {__Levelhonor_mgr66, __Traceshonor_mgr66}}
	  when __Levelhonor_mgr66 band 8 /= 0 orelse
		 __Traceshonor_mgr66 /= [] ->
	  lager:do_log(error,
		       [{module, honor_mgr}, {function, replace}, {line, 66},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("非法请求：key:~w Gainers:~w Time:~w",
				     [_Key, _Gainers, _Time]),
		       none, 4096, 8, __Levelhonor_mgr66, __Traceshonor_mgr66,
		       lager_event, __Pidhonor_mgr66);
      _ -> ok
    end.

-spec add(Key :: atom(), RoleInfo :: tuple() | list(),
	  Time :: non_neg_integer()) -> any().

add(Key, RoleInfo, Time) ->
    gen_server:cast(honor_mgr, {add, Key, RoleInfo, Time}).

add({_, SrvId}, Key, RoleInfo, Time) ->
    cross:cast(SrvId, honor_mgr, add,
	       [Key, RoleInfo, Time]).

info(Info) -> honor_mgr ! Info.

cast(Info) -> gen_server:cast(honor_mgr, Info).

call(Info) ->
    case catch gen_server:call(honor_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidhonor_mgr87, _,
	     {__Levelhonor_mgr87, __Traceshonor_mgr87}}
		when __Levelhonor_mgr87 band 8 /= 0 orelse
		       __Traceshonor_mgr87 /= [] ->
		lager:do_log(error,
			     [{module, honor_mgr}, {function, call}, {line, 87},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [honor_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelhonor_mgr87,
			     __Traceshonor_mgr87, lager_event,
			     __Pidhonor_mgr87);
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
    gen_server:start_link({local, honor_mgr}, honor_mgr, [],
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
      {__Pidhonor_mgr93, _,
       {__Levelhonor_mgr93, __Traceshonor_mgr93}}
	  when __Levelhonor_mgr93 band 64 /= 0 orelse
		 __Traceshonor_mgr93 /= [] ->
	  lager:do_log(info,
		       [{module, honor_mgr}, {function, init}, {line, 93},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [honor_mgr]), none, 4096,
		       64, __Levelhonor_mgr93, __Traceshonor_mgr93,
		       lager_event, __Pidhonor_mgr93);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(honor_info, "dets/honor_info.dets",
			#honor_info.key, set),
    d_ets_lib:load_dets_to_ets(honor_info, undefined),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhonor_mgr98, _,
       {__Levelhonor_mgr98, __Traceshonor_mgr98}}
	  when __Levelhonor_mgr98 band 64 /= 0 orelse
		 __Traceshonor_mgr98 /= [] ->
	  lager:do_log(info,
		       [{module, honor_mgr}, {function, init}, {line, 98},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [honor_mgr]), none, 4096, 64,
		       __Levelhonor_mgr98, __Traceshonor_mgr98, lager_event,
		       __Pidhonor_mgr98);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({clear, Key}, State) ->
    #honor_info{list = List} = lookup(Key),
    [honor:apply_del(Rid, HonorId)
     || {Rid, HonorId} <- List],
    d_ets_lib:clear_d_ets(honor_info, Key),
    {noreply, State};
handle_cast({del, Key, RoleId}, State) ->
    HonorInfo = #honor_info{list = List} = lookup(Key),
    NewList = [{Rid, HonorId}
	       || {Rid, HonorId} <- List, Rid =/= RoleId],
    d_ets_lib:save_d_ets(honor_info,
			 HonorInfo#honor_info{list = NewList}),
    [honor:apply_del(Rid, HonorId)
     || {Rid, HonorId} <- List, Rid =:= RoleId],
    {noreply, State};
handle_cast({replace, Key, NewGainers, NewTime},
	    State) ->
    #honor_info{list = OldGainers, end_time = OldTime} =
	lookup(Key),
    d_ets_lib:save_d_ets(honor_info,
			 #honor_info{key = Key, list = NewGainers,
				     end_time = NewTime}),
    do_replace(OldGainers, NewGainers, OldTime, NewTime),
    {noreply, State};
handle_cast({add, Key, AddRoles = [_ | _], Time},
	    State) ->
    HonorInfo = #honor_info{list = List} = lookup(Key),
    d_ets_lib:save_d_ets(honor_info,
			 HonorInfo#honor_info{list = List ++ AddRoles,
					      end_time = Time}),
    [honor:apply_add(Rid, HonorId)
     || {Rid, HonorId} <- AddRoles],
    {noreply, State};
handle_cast({add, Key, RoleInfo = {Rid, HonorId}, Time},
	    State) ->
    HonorInfo = #honor_info{list = List} = lookup(Key),
    case lists:keyfind(Rid, 1, List) of
      false ->
	  d_ets_lib:save_d_ets(honor_info,
			       HonorInfo#honor_info{list = [RoleInfo | List],
						    end_time = Time});
      _ ->
	  NewList = lists:keyreplace(Rid, 1, List, RoleInfo),
	  d_ets_lib:save_d_ets(honor_info,
			       HonorInfo#honor_info{list = NewList,
						    end_time = Time})
    end,
    honor:apply_add(Rid, HonorId),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    d_ets_lib:save(honor_info),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhonor_mgr152, _,
       {__Levelhonor_mgr152, __Traceshonor_mgr152}}
	  when __Levelhonor_mgr152 band 64 /= 0 orelse
		 __Traceshonor_mgr152 /= [] ->
	  lager:do_log(info,
		       [{module, honor_mgr}, {function, terminate},
			{line, 152}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelhonor_mgr152,
		       __Traceshonor_mgr152, lager_event, __Pidhonor_mgr152);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_replace(OldGainers, NewGainers, Time, Time) ->
    AddGainers = NewGainers -- OldGainers,
    DelGainers = OldGainers -- NewGainers,
    [honor:apply_del(Rid, HonorId)
     || {Rid, HonorId} <- DelGainers],
    [honor:apply_add(Rid, HonorId)
     || {Rid, HonorId} <- AddGainers];
do_replace(OldGainers, NewGainers, _OldTime,
	   _NewTime) ->
    [honor:apply_del(Rid, HonorId)
     || {Rid, HonorId} <- OldGainers],
    [honor:apply_add(Rid, HonorId)
     || {Rid, HonorId} <- NewGainers].


