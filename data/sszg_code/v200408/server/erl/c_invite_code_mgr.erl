-file("src/mod/invite_code/c_invite_code_mgr.erl", 1).

-module(c_invite_code_mgr).

-lager_records([{invite_code_bind,
		 [role_id, bind_id, account, name, sex, lev, vip, power,
		  face, avatar_bid, online, login_time, code, time,
		  reg_idfa, reg_ip, is_return, return_charge,
		  return_power, face_update_time, face_file]},
		{invite_code_role,
		 [role_id, code, time, num, list, return_num,
		  return_list]},
		{m_invite_code,
		 [ver, bind_code, bind_roleid, reward_list]},
		{state, []}]).

-behaviour(gen_server).

-export([lookup/1, lookup_acc/1, info/1, cast/1, call/1,
	 start_link/0]).

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

-file("src/mod/invite_code/c_invite_code_mgr.erl", 12).

-file("inc/invite_code.hrl", 1).

-record(m_invite_code,
	{ver = 1, bind_code = 0, bind_roleid = {0, <<>>},
	 reward_list = []}).

-record(invite_code_role,
	{role_id = {0, <<>>}, code = 0, time = 0, num = 0,
	 list = [], return_num = 0, return_list = []}).

-record(invite_code_bind,
	{role_id = {0, <<>>}, bind_id = {0, <<>>},
	 account = <<>>, name = <<>>, sex = 0, lev = 0, vip = 0,
	 power = 0, face = 0, avatar_bid = 0, online = 1,
	 login_time = 0, code = 0, time = 0, reg_idfa = <<>>,
	 reg_ip = <<>>, is_return = 0, return_charge = 0,
	 return_power = 0, face_update_time = 0,
	 face_file = <<>>}).

-file("src/mod/invite_code/c_invite_code_mgr.erl", 13).

lookup(Code) ->
    case ets:lookup(invite_code, Code) of
      [I] -> {ok, I};
      _ ->
	  case dets:lookup(invite_code, Code) of
	    [I] -> ets:insert(invite_code, I), {ok, I};
	    _ -> false
	  end
    end.

lookup_acc(Account) ->
    case ets:lookup(invite_code_acc, Account) of
      [I] -> {ok, I};
      _ ->
	  case dets:lookup(invite_code_acc, Account) of
	    [I] -> ets:insert(invite_code_acc, I), {ok, I};
	    _ -> false
	  end
    end.

info(Info) -> c_invite_code_mgr ! Info.

cast(Info) -> gen_server:cast(c_invite_code_mgr, Info).

call(Info) ->
    case catch gen_server:call(c_invite_code_mgr, Info,
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
	    {__Pidc_invite_code_mgr48, _,
	     {__Levelc_invite_code_mgr48,
	      __Tracesc_invite_code_mgr48}}
		when __Levelc_invite_code_mgr48 band 8 /= 0 orelse
		       __Tracesc_invite_code_mgr48 /= [] ->
		lager:do_log(error,
			     [{module, c_invite_code_mgr}, {function, call},
			      {line, 48}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [c_invite_code_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelc_invite_code_mgr48,
			     __Tracesc_invite_code_mgr48, lager_event,
			     __Pidc_invite_code_mgr48);
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
    gen_server:start_link({local, c_invite_code_mgr},
			  c_invite_code_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_invite_code_mgr54, _,
       {__Levelc_invite_code_mgr54,
	__Tracesc_invite_code_mgr54}}
	  when __Levelc_invite_code_mgr54 band 64 /= 0 orelse
		 __Tracesc_invite_code_mgr54 /= [] ->
	  lager:do_log(info,
		       [{module, c_invite_code_mgr}, {function, init},
			{line, 54}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [c_invite_code_mgr]),
		       none, 4096, 64, __Levelc_invite_code_mgr54,
		       __Tracesc_invite_code_mgr54, lager_event,
		       __Pidc_invite_code_mgr54);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(invite_code,
			"dets/invite_code.dets", 1, set),
    d_ets_lib:new_d_ets(invite_code_acc,
			"dets/invite_code_acc.dets", 1, set),
    [put({code, I},
	 sys_env:get({invite_code, I}, I * 10000))
     || I <- lists:seq(1, 9)],
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_invite_code_mgr62, _,
       {__Levelc_invite_code_mgr62,
	__Tracesc_invite_code_mgr62}}
	  when __Levelc_invite_code_mgr62 band 64 /= 0 orelse
		 __Tracesc_invite_code_mgr62 /= [] ->
	  lager:do_log(info,
		       [{module, c_invite_code_mgr}, {function, init},
			{line, 62}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [c_invite_code_mgr]), none,
		       4096, 64, __Levelc_invite_code_mgr62,
		       __Tracesc_invite_code_mgr62, lager_event,
		       __Pidc_invite_code_mgr62);
      _ -> ok
    end,
    {ok, State}.

handle_call({make_code, RoleId, Account}, _From,
	    State) ->
    Idx = util:rand(1, 9),
    NextCode = next_code(get({code, Idx})),
    put({code, Idx}, NextCode),
    sys_env:save({invite_code, Idx}, NextCode),
    d_ets_lib:save_d_ets(invite_code,
			 {NextCode, RoleId, Account, date:unixtime()}),
    {reply, {ok, NextCode}, State};
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
      {__Pidc_invite_code_mgr83, _,
       {__Levelc_invite_code_mgr83,
	__Tracesc_invite_code_mgr83}}
	  when __Levelc_invite_code_mgr83 band 64 /= 0 orelse
		 __Tracesc_invite_code_mgr83 /= [] ->
	  lager:do_log(info,
		       [{module, c_invite_code_mgr}, {function, terminate},
			{line, 83}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始关闭", none, 4096, 64, __Levelc_invite_code_mgr83,
		       __Tracesc_invite_code_mgr83, lager_event,
		       __Pidc_invite_code_mgr83);
      _ -> ok
    end,
    [sys_env:save({invite_code, I}, get({code, I}))
     || I <- lists:seq(1, 9)],
    d_ets_lib:save(invite_code),
    d_ets_lib:save(invite_code_acc),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidc_invite_code_mgr87, _,
       {__Levelc_invite_code_mgr87,
	__Tracesc_invite_code_mgr87}}
	  when __Levelc_invite_code_mgr87 band 64 /= 0 orelse
		 __Tracesc_invite_code_mgr87 /= [] ->
	  lager:do_log(info,
		       [{module, c_invite_code_mgr}, {function, terminate},
			{line, 87}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelc_invite_code_mgr87,
		       __Tracesc_invite_code_mgr87, lager_event,
		       __Pidc_invite_code_mgr87);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

next_code(19999) -> 100001;
next_code(199999) -> 1000001;
next_code(1999999) -> 10000001;
next_code(19999999) -> 100000001;
next_code(199999999) -> 1000000001;
next_code(1999999999) -> 10000000001;
next_code(19999999999) -> 100000000001;
next_code(29999) -> 200001;
next_code(299999) -> 2000001;
next_code(2999999) -> 20000001;
next_code(29999999) -> 200000001;
next_code(299999999) -> 2000000001;
next_code(2999999999) -> 20000000001;
next_code(29999999999) -> 200000000001;
next_code(39999) -> 300001;
next_code(399999) -> 3000001;
next_code(3999999) -> 30000001;
next_code(39999999) -> 300000001;
next_code(399999999) -> 3000000001;
next_code(3999999999) -> 30000000001;
next_code(39999999999) -> 300000000001;
next_code(49999) -> 400001;
next_code(499999) -> 4000001;
next_code(4999999) -> 40000001;
next_code(49999999) -> 400000001;
next_code(499999999) -> 4000000001;
next_code(4999999999) -> 40000000001;
next_code(49999999999) -> 400000000001;
next_code(59999) -> 500001;
next_code(599999) -> 5000001;
next_code(5999999) -> 50000001;
next_code(59999999) -> 500000001;
next_code(599999999) -> 5000000001;
next_code(5999999999) -> 50000000001;
next_code(59999999999) -> 500000000001;
next_code(69999) -> 600001;
next_code(699999) -> 6000001;
next_code(6999999) -> 60000001;
next_code(69999999) -> 600000001;
next_code(699999999) -> 6000000001;
next_code(6999999999) -> 60000000001;
next_code(69999999999) -> 600000000001;
next_code(79999) -> 700001;
next_code(799999) -> 7000001;
next_code(7999999) -> 70000001;
next_code(79999999) -> 700000001;
next_code(799999999) -> 7000000001;
next_code(7999999999) -> 70000000001;
next_code(79999999999) -> 700000000001;
next_code(89999) -> 800001;
next_code(899999) -> 8000001;
next_code(8999999) -> 80000001;
next_code(89999999) -> 800000001;
next_code(899999999) -> 8000000001;
next_code(8999999999) -> 80000000001;
next_code(89999999999) -> 800000000001;
next_code(99999) -> 900001;
next_code(999999) -> 9000001;
next_code(9999999) -> 90000001;
next_code(99999999) -> 900000001;
next_code(999999999) -> 9000000001;
next_code(9999999999) -> 90000000001;
next_code(99999999999) -> 900000000001;
next_code(N) -> N + 1.


