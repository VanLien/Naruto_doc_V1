-file("src/cluster/cluster_group.erl", 1).

-module(cluster_group).

-lager_records([{state, []},
		{cross_group, [group_id, main, group_list]},
		{cloud_task, [id, pos]},
		{srv,
		 [id, full_id, pid, type, platform, name, node, cookie,
		  ver, is_main, group_id]}]).

-behaviour(gen_server).

-export([sync/2, leave/1]).

-export([is_main/0, has_main/0, call_main/3,
	 cast_main/3, group_cast/3, group_other_cast/3, call/4,
	 cast/4, get_group/0, get_group_list/0,
	 get_other_group_list/0, info/1, is_local_group/1,
	 group_main_node/0, group_main_srvid/0,
	 handle_repair/0]).

-export([start_link/0, stop/0, init/1, handle_call/3,
	 handle_cast/2, handle_info/2, terminate/2,
	 code_change/3]).

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

-file("src/cluster/cluster_group.erl", 29).

-file("inc/cluster.hrl", 1).

-record(srv,
	{id = <<>>, full_id = [], pid, type = normal, platform,
	 name = <<>>, node, cookie, ver, is_main = 0,
	 group_id = 0}).

-record(cloud_task, {id, pos = 0}).

-record(cross_group,
	{group_id = 0, main, group_list = []}).

-file("src/cluster/cluster_group.erl", 30).

-record(state, {}).

handle_repair() ->
    P = sys_env:get(platform),
    case get_group() of
      {true,
       CrossGroup = #cross_group{group_list = GroupList}}
	  when P =:= "symix" orelse P =:= "symix2" ->
	  GroupList1 = [S
			|| S = #srv{platform = P1} <- GroupList, P =:= P1],
	  case lists:keyfind(1, #srv.is_main, GroupList1) of
	    MainSrv = #srv{} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcluster_group42, _,
		   {__Levelcluster_group42, __Tracescluster_group42}}
		      when __Levelcluster_group42 band 64 /= 0 orelse
			     __Tracescluster_group42 /= [] ->
		      lager:do_log(info,
				   [{module, cluster_group},
				    {function, handle_repair}, {line, 42},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("分组修正处理：~w==>~w",
						 [length(GroupList),
						  length(GroupList1)]),
				   none, 4096, 64, __Levelcluster_group42,
				   __Tracescluster_group42, lager_event,
				   __Pidcluster_group42);
		  _ -> ok
		end,
		NewCrossGroup = CrossGroup#cross_group{main = MainSrv,
						       group_list = GroupList1},
		ets:insert(ets_cluster_group, NewCrossGroup);
	    _ -> skip
	  end;
      _ -> skip
    end.

-spec group_update_fire() -> ok.

group_update_fire() ->
    catch days_rank_mgr:info(cluster_open),
    catch holiday_groupon:info(cluster_open),
    ok.

call_main(M, F, A) ->
    LocalNode = node(),
    case get_group() of
      {true, #cross_group{main = #srv{node = LocalNode}}} ->
	  catch apply(M, F, A);
      {true, #cross_group{main = #srv{node = NodeName}}} ->
	  case rpc:call(NodeName, M, F, A) of
	    {badrpc, Reason} -> {false, Reason};
	    Rtn -> Rtn
	  end;
      _ -> {false, "服务尚未准备好, 无法获得信息"}
    end.

cast_main(M, F, A) ->
    LocalNode = node(),
    case get_group() of
      {true, #cross_group{main = #srv{node = LocalNode}}} ->
	  catch apply(M, F, A);
      {true, #cross_group{main = #srv{node = NodeName}}} ->
	  case rpc:cast(NodeName, M, F, A) of
	    {badrpc, Reason} -> {false, Reason};
	    Rtn -> Rtn
	  end;
      _ -> {false, "服务尚未准备好, 无法获得信息"}
    end.

group_main_node() ->
    case get_group() of
      {true, #cross_group{main = #srv{node = MainNode}}} ->
	  case net_adm:ping(MainNode) of
	    pong -> MainNode;
	    pang -> undefined
	  end;
      _ -> undefined
    end.

group_main_srvid() ->
    case get_group() of
      {true, #cross_group{main = #srv{id = SrvId}}} -> SrvId;
      _ -> undefined
    end.

group_cast(M, F, A) ->
    apply(M, F, A), group_other_cast(M, F, A).

group_other_cast(M, F, A) ->
    case get_group() of
      {true, #cross_group{group_list = GroupList}} ->
	  LocalNode = node(),
	  Connect = [Mr
		     || Mr = #srv{node = NodeName} <- GroupList,
			NodeName =/= LocalNode],
	  lists:foreach(fun (#srv{node = Node}) ->
				rpc:cast(Node, M, F, A)
			end,
			Connect),
	  true;
      {false, Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcluster_group128, _,
	     {__Levelcluster_group128, __Tracescluster_group128}}
		when __Levelcluster_group128 band 8 /= 0 orelse
		       __Tracescluster_group128 /= [] ->
		lager:do_log(error,
			     [{module, cluster_group},
			      {function, group_other_cast}, {line, 128},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("组内广播[~w ~w]时,无法获取组服务:~w",
					   [M, F, Reason]),
			     none, 4096, 8, __Levelcluster_group128,
			     __Tracescluster_group128, lager_event,
			     __Pidcluster_group128);
	    _ -> ok
	  end,
	  false
    end.

call(SrvId, M, F, A) ->
    case get_group() of
      {true, #cross_group{group_list = GroupList}} ->
	  LocalNode = node(),
	  case find_node(SrvId, GroupList) of
	    {true, #srv{node = LocalNode}} -> catch apply(M, F, A);
	    {true, #srv{node = NodeName}} ->
		case rpc:call(NodeName, M, F, A) of
		  {badrpc, Reason} -> {false, Reason};
		  Rtn -> Rtn
		end;
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcluster_group146, _,
		   {__Levelcluster_group146, __Tracescluster_group146}}
		      when __Levelcluster_group146 band 8 /= 0 orelse
			     __Tracescluster_group146 /= [] ->
		      lager:do_log(error,
				   [{module, cluster_group}, {function, call},
				    {line, 146}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   "无法在组内找到目标服务器", none, 4096, 8,
				   __Levelcluster_group146,
				   __Tracescluster_group146, lager_event,
				   __Pidcluster_group146);
		  _ -> ok
		end,
		{false, "找不到目标服务器"}
	  end;
      {false, Reason} -> {false, Reason}
    end.

cast(SrvId, M, F, A) ->
    case get_group() of
      {true, #cross_group{group_list = GroupList}} ->
	  LocalNode = node(),
	  case find_node(SrvId, GroupList) of
	    {true, #srv{node = LocalNode}} -> apply(M, F, A);
	    {true, #srv{node = NodeName}} ->
		rpc:cast(NodeName, M, F, A);
	    _ ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcluster_group164, _,
		   {__Levelcluster_group164, __Tracescluster_group164}}
		      when __Levelcluster_group164 band 8 /= 0 orelse
			     __Tracescluster_group164 /= [] ->
		      lager:do_log(error,
				   [{module, cluster_group}, {function, cast},
				    {line, 164}, {pid, pid_to_list(self())},
				    {node, node()}
				    | lager:md()],
				   "无法在组内找到目标服务器", none, 4096, 8,
				   __Levelcluster_group164,
				   __Tracescluster_group164, lager_event,
				   __Pidcluster_group164);
		  _ -> ok
		end,
		ok
	  end;
      {false, _Reason} -> ok
    end.

is_main() ->
    LocalNode = node(),
    case get_group() of
      {true, #cross_group{main = #srv{node = LocalNode}}} ->
	  true;
      _ -> false
    end.

has_main() ->
    LocalNode = node(),
    case get_group() of
      {true, #cross_group{main = #srv{node = LocalNode}}} ->
	  true;
      {true, #cross_group{main = #srv{node = MainNode}}} ->
	  case net_adm:ping(MainNode) of
	    pong -> true;
	    pang -> false
	  end;
      _ -> false
    end.

is_local_group(Pid) when is_pid(Pid) ->
    is_local_group(node(Pid));
is_local_group(Node) when Node =:= node() -> true;
is_local_group({_, SrvId}) -> is_local_group(SrvId);
is_local_group(SrvId) when is_binary(SrvId) ->
    case sys_lib:is_local(SrvId) of
      true -> true;
      _ ->
	  case get_group() of
	    {true, #cross_group{group_list = GroupList}} ->
		[1
		 || #srv{full_id = FullId} <- GroupList,
		    lists:member(SrvId, FullId)]
		  =/= [];
	    _ -> false
	  end
    end;
is_local_group(Node) ->
    case get_group() of
      {true, #cross_group{group_list = GroupList}} ->
	  [1 || #srv{node = Node1} <- GroupList, Node =:= Node1]
	    =/= [];
      _ -> false
    end.

find_node(_SrvId, []) -> false;
find_node(SrvId, [M = #srv{id = SrvId} | _T]) ->
    {true, M};
find_node(SrvId, [M = #srv{full_id = FullId} | T]) ->
    case lists:member(SrvId, FullId) of
      true -> {true, M};
      false -> find_node(SrvId, T)
    end.

sync(Self, SrvList) ->
    [cluster_dynamic_group:srv_sync(Srv) || Srv <- SrvList],
    do_sync(Self, SrvList).

do_sync(#srv{group_id = 0}, _SrvList) -> ignore;
do_sync(Srv = #srv{group_id = GroupId, platform = P},
	SrvList) ->
    SrvList1 = [S
		|| S = #srv{group_id = Gid, platform = P1} <- SrvList,
		   Gid =:= GroupId, P =:= P1],
    case SrvList1 of
      [_ | _] -> cluster_group ! {sync, Srv, SrvList1};
      _ -> ok
    end.

leave(Srv = #srv{}) ->
    cluster_dynamic_group:srv_leave(Srv),
    cluster_group ! {leave, Srv},
    ok.

get_group() ->
    case catch ets:lookup(ets_cluster_group, cross_group) of
      [CrossGroup = #cross_group{}] -> {true, CrossGroup};
      [] -> {false, "暂未连接服务, 无法获取信息"};
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcluster_group261, _,
	     {__Levelcluster_group261, __Tracescluster_group261}}
		when __Levelcluster_group261 band 8 /= 0 orelse
		       __Tracescluster_group261 /= [] ->
		lager:do_log(error,
			     [{module, cluster_group}, {function, get_group},
			      {line, 261}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("无法获取组服务信息:~w", [_Err]), none, 4096,
			     8, __Levelcluster_group261,
			     __Tracescluster_group261, lager_event,
			     __Pidcluster_group261);
	    _ -> ok
	  end,
	  {false, "服务正忙, 无法获取信息"}
    end.

get_group_list() ->
    case get_group() of
      {true, #cross_group{group_list = GroupList}} ->
	  ServerIdList = [ServerId
			  || #srv{id = ServerId} <- GroupList],
	  {true, ServerIdList};
      {false, Err} -> {false, Err}
    end.

get_other_group_list() ->
    case get_group_list() of
      {true, ServerIdList} ->
	  ServerId = game_lib:get_server_id(),
	  ServerIdList1 = [ServerId1
			   || ServerId1 <- ServerIdList, ServerId1 /= ServerId],
	  {true, ServerIdList1};
      {false, Err} -> {false, Err}
    end.

info(Msg) -> cluster_group ! Msg.

start_link() ->
    gen_server:start_link({local, cluster_group},
			  cluster_group, [], []).

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
      {__Pidcluster_group293, _,
       {__Levelcluster_group293, __Tracescluster_group293}}
	  when __Levelcluster_group293 band 64 /= 0 orelse
		 __Tracescluster_group293 /= [] ->
	  lager:do_log(info,
		       [{module, cluster_group}, {function, init}, {line, 293},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动", none, 4096, 64, __Levelcluster_group293,
		       __Tracescluster_group293, lager_event,
		       __Pidcluster_group293);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    ets:new(ets_cluster_group,
	    [set, named_table, public, {keypos, 1}]),
    ets:new(zone_connect_node,
	    [set, named_table, public, {keypos, 1}]),
    erlang:send_after(3600000, self(), check_connect_node),
    {ok, #state{}}.

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(check_connect_node, State) ->
    [ets:insert(zone_connect_node, {Node, 0})
     || Node <- erlang:nodes(connected),
	not ets:member(zone_connect_node, Node)],
    erlang:send_after(3600000, self(), check_connect_node),
    {noreply, State};
handle_info({sync,
	     Srv = #srv{id = _Id, group_id = GroupId}, GroupSrv},
	    State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_group316, _,
       {__Levelcluster_group316, __Tracescluster_group316}}
	  when __Levelcluster_group316 band 128 /= 0 orelse
		 __Tracescluster_group316 /= [] ->
	  lager:do_log(debug,
		       [{module, cluster_group}, {function, handle_info},
			{line, 316}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("sync ! GroupId ~w, GroupSrv ~w",
				     [GroupId, GroupSrv]),
		       none, 4096, 128, __Levelcluster_group316,
		       __Tracescluster_group316, lager_event,
		       __Pidcluster_group316);
      _ -> ok
    end,
    GroupList = case get_group() of
		  {true,
		   #cross_group{group_list = GroupList1,
				group_id = GroupId}} ->
		      GroupList1;
		  _ -> []
		end,
    GroupSrv1 = merge_group_list(GroupSrv, [Srv]),
    NGroupSrv = merge_group_list(GroupList, GroupSrv1),
    case lists:keyfind(1, #srv.is_main, NGroupSrv) of
      MainSrv = #srv{} ->
	  CrossGroup = #cross_group{group_id = GroupId,
				    main = MainSrv, group_list = NGroupSrv},
	  ets:insert(ets_cluster_group, CrossGroup),
	  group_event(MainSrv, connect);
      _ ->
	  CrossGroup = #cross_group{group_id = GroupId,
				    main = undefined, group_list = NGroupSrv},
	  ets:insert(ets_cluster_group, CrossGroup)
    end,
    group_update_fire(),
    {noreply, State};
handle_info({leave, #srv{id = Sid, group_id = GroupId}},
	    State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_group342, _,
       {__Levelcluster_group342, __Tracescluster_group342}}
	  when __Levelcluster_group342 band 128 /= 0 orelse
		 __Tracescluster_group342 /= [] ->
	  lager:do_log(debug,
		       [{module, cluster_group}, {function, handle_info},
			{line, 342}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("leave ! GroupId ~w", [GroupId]), none,
		       4096, 128, __Levelcluster_group342,
		       __Tracescluster_group342, lager_event,
		       __Pidcluster_group342);
      _ -> ok
    end,
    case get_group() of
      {true,
       CrossGroup = #cross_group{group_id = GroupId,
				 main = Main, group_list = GroupList}} ->
	  NewGroupList = lists:keydelete(Sid, #srv.id, GroupList),
	  NewMain = case Main of
		      #srv{id = Sid} -> undefined;
		      _ -> Main
		    end,
	  NewCrossGroup = CrossGroup#cross_group{group_list =
						     NewGroupList,
						 main = NewMain},
	  ets:insert(ets_cluster_group, NewCrossGroup),
	  ok;
      {true, _} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcluster_group354, _,
	     {__Levelcluster_group354, __Tracescluster_group354}}
		when __Levelcluster_group354 band 8 /= 0 orelse
		       __Tracescluster_group354 /= [] ->
		lager:do_log(error,
			     [{module, cluster_group}, {function, handle_info},
			      {line, 354}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "组内信息不同步, 无法更新", none, 4096, 8,
			     __Levelcluster_group354, __Tracescluster_group354,
			     lager_event, __Pidcluster_group354);
	    _ -> ok
	  end,
	  ok;
      {false, Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcluster_group357, _,
	     {__Levelcluster_group357, __Tracescluster_group357}}
		when __Levelcluster_group357 band 8 /= 0 orelse
		       __Tracescluster_group357 /= [] ->
		lager:do_log(error,
			     [{module, cluster_group}, {function, handle_info},
			      {line, 357}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("更新组内节点信息时, 无法获取组服务:~w", [Reason]),
			     none, 4096, 8, __Levelcluster_group357,
			     __Tracescluster_group357, lager_event,
			     __Pidcluster_group357);
	    _ -> ok
	  end,
	  ok
    end,
    {noreply, State};
handle_info({update,
	     Srv = #srv{group_id = GroupId, node = NodeName,
			is_main = IsMain}},
	    State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_group364, _,
       {__Levelcluster_group364, __Tracescluster_group364}}
	  when __Levelcluster_group364 band 128 /= 0 orelse
		 __Tracescluster_group364 /= [] ->
	  lager:do_log(debug,
		       [{module, cluster_group}, {function, handle_info},
			{line, 364}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("update ! GroupId ~w", [GroupId]), none,
		       4096, 128, __Levelcluster_group364,
		       __Tracescluster_group364, lager_event,
		       __Pidcluster_group364);
      _ -> ok
    end,
    case get_group() of
      {true,
       CrossGroup = #cross_group{group_id = GroupId,
				 main = Main, group_list = GroupList}} ->
	  NewMain = case IsMain of
		      1 -> NodeName;
		      0 -> Main
		    end,
	  NewGroupList = lists:keystore(NodeName, #srv.node,
					GroupList, Srv),
	  NewCrossGroup = CrossGroup#cross_group{main = NewMain,
						 group_list = NewGroupList},
	  ets:insert(ets_cluster_group, NewCrossGroup),
	  {noreply, State};
      {true, _} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcluster_group380, _,
	     {__Levelcluster_group380, __Tracescluster_group380}}
		when __Levelcluster_group380 band 8 /= 0 orelse
		       __Tracescluster_group380 /= [] ->
		lager:do_log(error,
			     [{module, cluster_group}, {function, handle_info},
			      {line, 380}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "组内信息不同步, 无法更新", none, 4096, 8,
			     __Levelcluster_group380, __Tracescluster_group380,
			     lager_event, __Pidcluster_group380);
	    _ -> ok
	  end,
	  {noreply, State};
      {false, Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcluster_group383, _,
	     {__Levelcluster_group383, __Tracescluster_group383}}
		when __Levelcluster_group383 band 8 /= 0 orelse
		       __Tracescluster_group383 /= [] ->
		lager:do_log(error,
			     [{module, cluster_group}, {function, handle_info},
			      {line, 383}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("更新组内节点信息时, 无法获取组服务:~w", [Reason]),
			     none, 4096, 8, __Levelcluster_group383,
			     __Tracescluster_group383, lager_event,
			     __Pidcluster_group383);
	    _ -> ok
	  end,
	  {noreply, State}
    end;
handle_info(repair, State) ->
    GroupId = sys_env:get(group_id),
    case get_group() of
      {true,
       CrossGroup = #cross_group{group_list = GroupList,
				 group_id = GroupId}} ->
	  List = merge_group_list(GroupList, []),
	  NewCrossGroup = CrossGroup#cross_group{group_list =
						     List},
	  ets:insert(ets_cluster_group, NewCrossGroup);
      {true, _} -> ets:delete_all_objects(ets_cluster_group);
      _ -> skip
    end,
    {noreply, State};
handle_info(_Info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_group402, _,
       {__Levelcluster_group402, __Tracescluster_group402}}
	  when __Levelcluster_group402 band 8 /= 0 orelse
		 __Tracescluster_group402 /= [] ->
	  lager:do_log(error,
		       [{module, cluster_group}, {function, handle_info},
			{line, 402}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知消息~w", [_Info]), none, 4096, 8,
		       __Levelcluster_group402, __Tracescluster_group402,
		       lager_event, __Pidcluster_group402);
      _ -> ok
    end,
    {noreply, State}.

terminate(normal, _State) -> util:unset_all_timer(), ok;
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
      {__Pidcluster_group409, _,
       {__Levelcluster_group409, __Tracescluster_group409}}
	  when __Levelcluster_group409 band 8 /= 0 orelse
		 __Tracescluster_group409 /= [] ->
	  lager:do_log(error,
		       [{module, cluster_group}, {function, terminate},
			{line, 409}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("~w", [Reason]), none, 4096, 8,
		       __Levelcluster_group409, __Tracescluster_group409,
		       lager_event, __Pidcluster_group409);
      _ -> ok
    end.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

group_event(#srv{node = Node}, Flag) ->
    group_event(Node, Flag);
group_event(_Node, connect) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_group416, _,
       {__Levelcluster_group416, __Tracescluster_group416}}
	  when __Levelcluster_group416 band 128 /= 0 orelse
		 __Tracescluster_group416 /= [] ->
	  lager:do_log(debug,
		       [{module, cluster_group}, {function, group_event},
			{line, 416}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("与组服务器[~w]建立连接", [_Node]), none, 4096,
		       128, __Levelcluster_group416, __Tracescluster_group416,
		       lager_event, __Pidcluster_group416);
      _ -> ok
    end,
    ok;
group_event(_Node, disconnect) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_group419, _,
       {__Levelcluster_group419, __Tracescluster_group419}}
	  when __Levelcluster_group419 band 128 /= 0 orelse
		 __Tracescluster_group419 /= [] ->
	  lager:do_log(debug,
		       [{module, cluster_group}, {function, group_event},
			{line, 419}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("与组服务器[~w]断开连接", [_Node]), none, 4096,
		       128, __Levelcluster_group419, __Tracescluster_group419,
		       lager_event, __Pidcluster_group419);
      _ -> ok
    end,
    ok.

merge_group_list([], List) -> List;
merge_group_list([S = #srv{id = Id} | T], List) ->
    cluster_lib:sync_connect_zone_node(S),
    case lists:keyfind(Id, #srv.id, List) of
      false -> merge_group_list(T, [S | List]);
      _ -> merge_group_list(T, List)
    end.


