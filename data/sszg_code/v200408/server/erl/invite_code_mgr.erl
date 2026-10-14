-file("src/mod/invite_code/invite_code_mgr.erl", 1).

-module(invite_code_mgr).

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

-file("src/mod/invite_code/invite_code_mgr.erl", 12).

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

-file("src/mod/invite_code/invite_code_mgr.erl", 13).

info(Info) -> invite_code_mgr ! Info.

cast(Info) -> gen_server:cast(invite_code_mgr, Info).

call(Info) ->
    case catch gen_server:call(invite_code_mgr, Info, 10000)
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
	    {__Pidinvite_code_mgr22, _,
	     {__Levelinvite_code_mgr22, __Tracesinvite_code_mgr22}}
		when __Levelinvite_code_mgr22 band 8 /= 0 orelse
		       __Tracesinvite_code_mgr22 /= [] ->
		lager:do_log(error,
			     [{module, invite_code_mgr}, {function, call},
			      {line, 22}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [invite_code_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelinvite_code_mgr22,
			     __Tracesinvite_code_mgr22, lager_event,
			     __Pidinvite_code_mgr22);
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
    gen_server:start_link({local, invite_code_mgr},
			  invite_code_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidinvite_code_mgr28, _,
       {__Levelinvite_code_mgr28, __Tracesinvite_code_mgr28}}
	  when __Levelinvite_code_mgr28 band 64 /= 0 orelse
		 __Tracesinvite_code_mgr28 /= [] ->
	  lager:do_log(info,
		       [{module, invite_code_mgr}, {function, init},
			{line, 28}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [invite_code_mgr]), none,
		       4096, 64, __Levelinvite_code_mgr28,
		       __Tracesinvite_code_mgr28, lager_event,
		       __Pidinvite_code_mgr28);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(invite_code_role,
			"dets/invite_code_role.dets", #invite_code_role.role_id,
			set),
    d_ets_lib:new_d_ets(invite_code_bind,
			"dets/invite_code_bind.dets", #invite_code_bind.role_id,
			set),
    d_ets_lib:new_d_ets(invite_code_return_bind,
			"dets/invite_code_return_bind.dets",
			#invite_code_bind.role_id, set),
    d_ets_lib:load_dets_to_ets(invite_code_role,
			       fun (D) -> role_ver(D) end),
    d_ets_lib:load_dets_to_ets(invite_code_bind,
			       fun (D) -> bind_role_ver(D) end),
    d_ets_lib:load_dets_to_ets(invite_code_return_bind,
			       fun (D) -> bind_role_ver(D) end),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidinvite_code_mgr37, _,
       {__Levelinvite_code_mgr37, __Tracesinvite_code_mgr37}}
	  when __Levelinvite_code_mgr37 band 64 /= 0 orelse
		 __Tracesinvite_code_mgr37 /= [] ->
	  lager:do_log(info,
		       [{module, invite_code_mgr}, {function, init},
			{line, 37}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [invite_code_mgr]), none,
		       4096, 64, __Levelinvite_code_mgr37,
		       __Tracesinvite_code_mgr37, lager_event,
		       __Pidinvite_code_mgr37);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({bind,
	     BindRole = #invite_code_bind{bind_id = BindId,
					  role_id = RoleId}},
	    State) ->
    Max = invite_code_data:get_const(bind_num),
    case ets:lookup(invite_code_role, BindId) of
      [R = #invite_code_role{num = Num, list = List}]
	  when Num < Max ->
	  case lists:member(RoleId, List) of
	    true -> pass;
	    _ ->
		case sys_lib:is_local(BindId) of
		  true -> skip;
		  _ ->
		      case ets:lookup(invite_code_bind, BindId) of
			[BRole] ->
			    big_world_lib:cast(element(2, RoleId), ets, insert,
					       [invite_code_bind, BRole]);
			_ ->
			    case {whereis(lager_event), whereis(lager_event),
				  lager_config:get({lager_event, loglevel},
						   {0, []})}
				of
			      {undefined, undefined, _} ->
				  fun () -> {error, lager_not_running} end();
			      {undefined, _, _} ->
				  fun () ->
					  {error,
					   {sink_not_configured, lager_event}}
				  end();
			      {__Pidinvite_code_mgr57, _,
			       {__Levelinvite_code_mgr57,
				__Tracesinvite_code_mgr57}}
				  when __Levelinvite_code_mgr57 band 8 /= 0
					 orelse
					 __Tracesinvite_code_mgr57 /= [] ->
				  lager:do_log(error,
					       [{module, invite_code_mgr},
						{function, handle_cast},
						{line, 57},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("查找不到被绑定角色信息:~w",
							     [BindId]),
					       none, 4096, 8,
					       __Levelinvite_code_mgr57,
					       __Tracesinvite_code_mgr57,
					       lager_event,
					       __Pidinvite_code_mgr57);
			      _ -> ok
			    end
		      end
		end,
		role_lib:cast(by_id, BindId,
			      {invite_code, apply_add_bind_role, [BindRole]}),
		role_lib:cast(by_id, RoleId,
			      {invite_code, push_bind_role, []}),
		role:pack_send(RoleId, 19801, {1, <<>>}),
		NewR = R#invite_code_role{num = Num + 1,
					  list = [RoleId | List]},
		d_ets_lib:save_d_ets(invite_code_role, NewR),
		d_ets_lib:save_d_ets(invite_code_bind, BindRole)
	  end;
      _Info ->
	  _Ret = big_world_lib:cast(element(2, RoleId), d_ets_lib,
				    clear_d_ets, [invite_code_bind, RoleId]),
	  role_lib:cast(by_id, RoleId,
			{invite_code, apply_bind_fail, [BindId]}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidinvite_code_mgr70, _,
	     {__Levelinvite_code_mgr70, __Tracesinvite_code_mgr70}}
		when __Levelinvite_code_mgr70 band 8 /= 0 orelse
		       __Tracesinvite_code_mgr70 /= [] ->
		lager:do_log(error,
			     [{module, invite_code_mgr},
			      {function, handle_cast}, {line, 70},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("绑定失败:~w ret: ~w", [_Info, _Ret]),
			     none, 4096, 8, __Levelinvite_code_mgr70,
			     __Tracesinvite_code_mgr70, lager_event,
			     __Pidinvite_code_mgr70);
	    _ -> ok
	  end
    end,
    {noreply, State};
handle_cast({bind_return,
	     BindRole = #invite_code_bind{bind_id = BindId,
					  role_id = RoleId}},
	    State) ->
    Max = invite_code_data:get_const(bind_num),
    case ets:lookup(invite_code_role, BindId) of
      [R = #invite_code_role{return_num = Num,
			     return_list = List}]
	  when Num < Max ->
	  case lists:member(RoleId, List) of
	    true -> pass;
	    _ ->
		case sys_lib:is_local(BindId) of
		  true -> skip;
		  _ ->
		      case ets:lookup(invite_code_return_bind, BindId) of
			[BRole] ->
			    big_world_lib:cast(element(2, RoleId), ets, insert,
					       [invite_code_return_bind,
						BRole]);
			_ ->
			    case {whereis(lager_event), whereis(lager_event),
				  lager_config:get({lager_event, loglevel},
						   {0, []})}
				of
			      {undefined, undefined, _} ->
				  fun () -> {error, lager_not_running} end();
			      {undefined, _, _} ->
				  fun () ->
					  {error,
					   {sink_not_configured, lager_event}}
				  end();
			      {__Pidinvite_code_mgr88, _,
			       {__Levelinvite_code_mgr88,
				__Tracesinvite_code_mgr88}}
				  when __Levelinvite_code_mgr88 band 8 /= 0
					 orelse
					 __Tracesinvite_code_mgr88 /= [] ->
				  lager:do_log(error,
					       [{module, invite_code_mgr},
						{function, handle_cast},
						{line, 88},
						{pid, pid_to_list(self())},
						{node, node()}
						| lager:md()],
					       io_lib:format("查找不到被绑定角色信息:~w",
							     [BindId]),
					       none, 4096, 8,
					       __Levelinvite_code_mgr88,
					       __Tracesinvite_code_mgr88,
					       lager_event,
					       __Pidinvite_code_mgr88);
			      _ -> ok
			    end
		      end
		end,
		role_lib:cast(by_id, BindId,
			      {invite_code_return, apply_add_bind_role,
			       [BindRole]}),
		NewR = R#invite_code_role{return_num = Num + 1,
					  return_list = [RoleId | List]},
		d_ets_lib:save_d_ets(invite_code_role, NewR),
		d_ets_lib:save_d_ets(invite_code_return_bind, BindRole)
	  end;
      _Info ->
	  _Ret = big_world_lib:cast(element(2, RoleId), d_ets_lib,
				    clear_d_ets,
				    [invite_code_return_bind, RoleId]),
	  role_lib:cast(by_id, RoleId,
			{invite_code_return, apply_bind_fail, [BindId]}),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidinvite_code_mgr99, _,
	     {__Levelinvite_code_mgr99, __Tracesinvite_code_mgr99}}
		when __Levelinvite_code_mgr99 band 8 /= 0 orelse
		       __Tracesinvite_code_mgr99 /= [] ->
		lager:do_log(error,
			     [{module, invite_code_mgr},
			      {function, handle_cast}, {line, 99},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("绑定失败:~w ret: ~w", [_Info, _Ret]),
			     none, 4096, 8, __Levelinvite_code_mgr99,
			     __Tracesinvite_code_mgr99, lager_event,
			     __Pidinvite_code_mgr99);
	    _ -> ok
	  end
    end,
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    d_ets_lib:save(invite_code_role),
    d_ets_lib:save(invite_code_bind),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidinvite_code_mgr112, _,
       {__Levelinvite_code_mgr112, __Tracesinvite_code_mgr112}}
	  when __Levelinvite_code_mgr112 band 64 /= 0 orelse
		 __Tracesinvite_code_mgr112 /= [] ->
	  lager:do_log(info,
		       [{module, invite_code_mgr}, {function, terminate},
			{line, 112}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelinvite_code_mgr112,
		       __Tracesinvite_code_mgr112, lager_event,
		       __Pidinvite_code_mgr112);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

role_ver({invite_code_role, RoleId, Code, Time, Num,
	  List}) ->
    ReturnNum = 0,
    ReturnList = [],
    role_ver({invite_code_role, RoleId, Code, Time, Num,
	      List, ReturnNum, ReturnList});
role_ver(D) -> {ok, D}.

bind_role_ver({invite_code_bind, RoleId, BindId,
	       Account, Name, Sex, Lev, Vip, Power, Face, AvatarBid,
	       Online, LoginTIme, Code, Time}) ->
    RegIdfa = <<>>,
    bind_role_ver({invite_code_bind, RoleId, BindId,
		   Account, Name, Sex, Lev, Vip, Power, Face, AvatarBid,
		   Online, LoginTIme, Code, Time, RegIdfa});
bind_role_ver({invite_code_bind, RoleId, BindId,
	       Account, Name, Sex, Lev, Vip, Power, Face, AvatarBid,
	       Online, LoginTIme, Code, Time, RegIdfa}) ->
    RegIp = <<>>,
    bind_role_ver({invite_code_bind, RoleId, BindId,
		   Account, Name, Sex, Lev, Vip, Power, Face, AvatarBid,
		   Online, LoginTIme, Code, Time, RegIdfa, RegIp});
bind_role_ver({invite_code_bind, RoleId, BindId,
	       Account, Name, Sex, Lev, Vip, Power, Face, AvatarBid,
	       Online, LoginTIme, Code, Time, RegIdfa, RegIp}) ->
    IsReturn = 0,
    ReturnCharge = 0,
    ReturnPower = 0,
    bind_role_ver({invite_code_bind, RoleId, BindId,
		   Account, Name, Sex, Lev, Vip, Power, Face, AvatarBid,
		   Online, LoginTIme, Code, Time, RegIdfa, RegIp, IsReturn,
		   ReturnCharge, ReturnPower});
bind_role_ver({invite_code_bind, RoleId, BindId,
	       Account, Name, Sex, Lev, Vip, Power, Face, AvatarBid,
	       Online, LoginTIme, Code, Time, RegIdfa, RegIp, IsReturn,
	       ReturnCharge, ReturnPower}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    bind_role_ver({invite_code_bind, RoleId, BindId,
		   Account, Name, Sex, Lev, Vip, Power, Face, AvatarBid,
		   Online, LoginTIme, Code, Time, RegIdfa, RegIp, IsReturn,
		   ReturnCharge, ReturnPower, FaceUpdateTime, FaceFile});
bind_role_ver(D) ->
    {ok, D#invite_code_bind{online = 0}}.


