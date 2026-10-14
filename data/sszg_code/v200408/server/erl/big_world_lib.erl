-file("big_world_lib.erl", 1).

-module(big_world_lib).

-lager_records([{cross_group,
		 [group_id, main, group_list]},
		{cloud_task, [id, pos]},
		{srv,
		 [id, full_id, pid, type, platform, name, node, cookie,
		  ver, is_main, group_id]}]).

-export([type/0, ids/1, srvs/1, srv_ids/0, platforms/1,
	 main_srv_id/1, is_local/1, split_srv_exec/3,
	 split_by_srv/2, split_pid_exec/3, split_by_pid/2,
	 split_plat_group_exec/4, split_by_plat_group/3, call/3,
	 call/4, cast/4, send/3, is_normal_srv/0, is_link/0,
	 link/0, center_connect_callback/0, is_same_center_ver/0,
	 center_node/0, rpc_call/4, rpc_cast/4]).

-file("/ym/server/inc/common.hrl", 1).

-file("/ym/server/inc/lib_log.hrl", 1).

-file("/ym/server/inc/common.hrl", 109).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("big_world_lib.erl", 20).

-file("/ym/server/inc/cluster.hrl", 1).

-record(srv,
	{id = <<>>, full_id = [], pid, type = normal, platform,
	 name = <<>>, node, cookie, ver, is_main = 0,
	 group_id = 0}).

-record(cloud_task, {id, pos = 0}).

-record(cross_group,
	{group_id = 0, main, group_list = []}).

-file("big_world_lib.erl", 21).

type() -> sys_env:get(server_type).

is_local(SrvId) -> sys_lib:is_local(SrvId).

is_normal_srv() ->
    case get('@is_normal_srv') of
      undefined ->
	  B = sys_env:get(server_type) == zone,
	  put('@is_normal_srv', B),
	  B;
      Bool -> Bool
    end.

is_same_center_ver() ->
    sys_env:get(version) =:= sys_env:get(b_center_version).

is_link() ->
    sys_env:get(is_link_big_world) == true andalso
      is_same_center_ver().

link() ->
    IsLink = is_link(),
    case sys_env:get(server_type) of
      center -> ignore;
      _ when IsLink == false -> big_world_cli ! link;
      _ -> ignore
    end.

ids(Mix) ->
    case sys_env:get(server_type) of
      center -> loop_ids(Mix);
      _ -> call(center, big_world_lib, ids, [Mix])
    end.

loop_ids(Type) ->
    [SrvId || #srv{id = SrvId} <- loop_srvs(Type)].

srvs(Mix) ->
    case sys_env:get(server_type) of
      center -> loop_srvs(Mix);
      _ -> call(center, big_world_lib, srvs, [Mix])
    end.

platforms(Mix) ->
    list_util:group_by(#srv.platform, srvs(Mix)).

loop_srvs({type, normal}) -> loop_srvs({type, zone});
loop_srvs({type, Type}) ->
    ets:match_object(b_srv, #srv{type = Type, _ = '_'});
loop_srvs({platform, Platform}) ->
    ets:match_object(b_srv,
		     #srv{platform = Platform, _ = '_'});
loop_srvs({plat_group, SysFlag, PGroup}) ->
    [S
     || S <- ets:tab2list(b_srv),
	cluster_data:get_group(SysFlag, S#srv.platform) =:=
	  PGroup];
loop_srvs(all) -> ets:tab2list(b_srv).

srv_ids() ->
    case sys_env:get(server_type) of
      center -> ets:tab2list(b_srv_id);
      _ -> call(center, big_world_lib, srv_ids, [])
    end.

split_pid_exec(List, Pos, Fun) ->
    ZoneL = split_by_pid(List, Pos), [Fun(Z) || Z <- ZoneL].

split_by_pid(List, Pos) ->
    do_split_by_pid(List, Pos, []).

do_split_by_pid([], _Pos, List) ->
    [{Node, lists:reverse(L)} || {Node, L} <- List];
do_split_by_pid([R | T], Pos, List) ->
    Pid = element(Pos, R),
    case catch node(Pid) of
      Node when is_atom(Node) ->
	  NewList = case lists:keyfind(Node, 1, List) of
		      false -> [{Node, [R]} | List];
		      {Node, L1} ->
			  lists:keyreplace(Node, 1, List, {Node, [R | L1]})
		    end,
	  do_split_by_pid(T, Pos, NewList);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidbig_world_lib117, _,
	     {__Levelbig_world_lib117, __Tracesbig_world_lib117}}
		when __Levelbig_world_lib117 band 8 /= 0 orelse
		       __Tracesbig_world_lib117 /= [] ->
		lager:do_log(error,
			     [{module, big_world_lib},
			      {function, do_split_by_pid}, {line, 117},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("位置POS:~w 非法PId:~w", [Pos, Pid]),
			     none, 4096, 8, __Levelbig_world_lib117,
			     __Tracesbig_world_lib117, lager_event,
			     __Pidbig_world_lib117);
	    _ -> ok
	  end,
	  do_split_by_pid(T, Pos, List)
    end.

-spec split_srv_exec([tuple()], Pos :: pos_integer(),
		     function()) -> ok.

split_srv_exec(List, Pos, Fun) ->
    ZoneL = split_by_srv(List, Pos), [Fun(Z) || Z <- ZoneL].

split_by_srv(List, Pos) -> split_by_srv(List, Pos, []).

split_by_srv([], _Pos, List) ->
    [{Dest, lists:reverse(L)} || {Dest, L} <- List];
split_by_srv([R | T], Pos, List) ->
    SrvId1 = case is_function(Pos) of
	       true -> Pos(R);
	       _ ->
		   case element(Pos, R) of
		     {_, SrvId} -> SrvId;
		     SrvId when is_binary(SrvId) -> SrvId
		   end
	     end,
    MainSrvId = case main_srv_id(SrvId1) of
		  {ok, SrvId2} -> SrvId2;
		  _ -> SrvId1
		end,
    NewList = case lists:keyfind(MainSrvId, 1, List) of
		false -> [{MainSrvId, [R]} | List];
		{MainSrvId, L1} ->
		    lists:keyreplace(MainSrvId, 1, List,
				     {MainSrvId, [R | L1]})
	      end,
    split_by_srv(T, Pos, NewList).

split_plat_group_exec(List, SysFlag, Pos, Fun) ->
    ZoneL = split_by_plat_group(List, SysFlag, Pos),
    [Fun(Z) || Z <- ZoneL].

split_by_plat_group(List, SysFlag, Pos) ->
    do_split_by_plat_group(List, SysFlag, Pos, []).

do_split_by_plat_group([], _SysFlag, _Pos, List) ->
    [{Group, lists:reverse(L)} || {Group, L} <- List];
do_split_by_plat_group([R | T], SysFlag, Pos, List) ->
    Group = case element(Pos, R) of
	      PGroup when is_integer(PGroup) -> PGroup;
	      {_, SrvId} -> cluster_data:get_group(SysFlag, SrvId);
	      SrvId when is_binary(SrvId) ->
		  cluster_data:get_group(SysFlag, SrvId)
	    end,
    NewList = case lists:keyfind(Group, 1, List) of
		false -> [{Group, [R]} | List];
		{Group, L1} ->
		    lists:keyreplace(Group, 1, List, {Group, [R | L1]})
	      end,
    do_split_by_plat_group(T, SysFlag, Pos, NewList).

main_srv_id(SrvId) ->
    case ets:lookup(b_srv_id, SrvId) of
      [{_, MainSrvId, _Node}] -> {ok, MainSrvId};
      _ ->
	  case sys_lib:is_local(SrvId) of
	    true -> {ok, sys_lib:srv_id()};
	    _ -> {error, badsrv}
	  end
    end.

call(M, F, A) ->
    case sys_env:get(server_type) of
      center -> apply(M, F, A);
      _ -> call(center, M, F, A)
    end.

call(undefined, _M, _F, _A) -> {error, badsrv};
call(<<"center">>, M, F, A) -> call(center, M, F, A);
call(<<"center_", _/binary>>, M, F, A) ->
    call(center, M, F, A);
call(center, M, F, A) ->
    case is_same_center_ver() of
      true ->
	  case center_node() of
	    undefined -> {error, not_ready};
	    CenterNode -> rpc:call(CenterNode, M, F, A, 20000)
	  end;
      _ -> {error, not_ready}
    end;
call(center_all, M, F, A) ->
    case center_node() of
      undefined -> {error, not_ready};
      CenterNode -> rpc:call(CenterNode, M, F, A, 20000)
    end;
call(all_big_world, M, F, A) ->
    case all_big_world_node() of
      undefined -> {error, not_ready};
      CenterNode -> rpc:call(CenterNode, M, F, A, 20000)
    end;
call(#srv{node = Node}, M, F, A) ->
    rpc_call(Node, M, F, A);
call({big_world, SrvId}, M, F, A)
    when is_binary(SrvId) ->
    case sys_lib:is_local(SrvId) of
      true -> apply(M, F, A);
      false ->
	  case ets:lookup(b_srv_id, SrvId) of
	    [{_, _MainSrvId, Node}] -> call({node, Node}, M, F, A);
	    _ ->
		case ets:lookup(b_srv_id_ver, SrvId) of
		  [{_, _MainSrvId, Node}] -> call({node, Node}, M, F, A);
		  _ -> {error, badsrv}
		end
	  end
    end;
call(SrvId, M, F, A) when is_binary(SrvId) ->
    case sys_lib:is_local(SrvId) of
      true -> apply(M, F, A);
      false ->
	  case ets:lookup(b_srv_id, SrvId) of
	    [{_, _MainSrvId, Node}] -> call({node, Node}, M, F, A);
	    _ -> {error, badsrv}
	  end
    end;
call({node, Node}, M, F, A) -> rpc_call(Node, M, F, A);
call({pid, Pid}, M, F, A) ->
    rpc_call(node(Pid), M, F, A);
call(Mix, M, F, A) ->
    case sys_env:get(server_type) of
      center -> loop_call(loop_srvs(Mix), M, F, A, []);
      _ -> call(center, big_world_lib, call, [Mix, M, F, A])
    end.

loop_call([], _M, _F, _A, Res) -> lists:reverse(Res);
loop_call([S | T], M, F, A, Res) ->
    loop_call(T, M, F, A, [call(S, M, F, A) | Res]).

rpc_call(Node, M, F, A) when node() =:= Node ->
    apply(M, F, A);
rpc_call(Node, M, F, A) ->
    case sys_env:get(server_type) =:= center orelse
	   not is_link() orelse
	     cluster_lib:is_connect_zone_node(Node)
	of
      true -> rpc:call(Node, M, F, A, 20000);
      _ ->
	  call(center, big_world_lib, rpc_call, [Node, M, F, A])
    end.

cast(<<"center">>, M, F, A) -> cast(center, M, F, A);
cast(<<"center_", _/binary>>, M, F, A) ->
    cast(center, M, F, A);
cast(center, M, F, A) ->
    case is_same_center_ver() of
      true ->
	  case center_node() of
	    undefined -> {error, not_ready};
	    CenterNode -> rpc:cast(CenterNode, M, F, A)
	  end;
      _ -> {error, not_ready}
    end;
cast(center_all, M, F, A) ->
    case center_node() of
      undefined -> {error, not_ready};
      CenterNode -> rpc:cast(CenterNode, M, F, A)
    end;
cast(all_big_world, M, F, A) ->
    case all_big_world_node() of
      undefined -> {error, not_ready};
      CenterNode -> rpc:cast(CenterNode, M, F, A)
    end;
cast(#srv{node = Node}, M, F, A) ->
    rpc_cast(Node, M, F, A);
cast({big_world, SrvId}, M, F, A)
    when is_binary(SrvId) ->
    case sys_lib:is_local(SrvId) of
      true -> apply(M, F, A);
      false ->
	  case ets:lookup(b_srv_id, SrvId) of
	    [{_, _MainSrvId, Node}] -> cast({node, Node}, M, F, A);
	    _ ->
		case ets:lookup(b_srv_id_ver, SrvId) of
		  [{_, _MainSrvId, Node}] -> cast({node, Node}, M, F, A);
		  _ -> {error, badsrv}
		end
	  end
    end;
cast(SrvId, M, F, A) when is_binary(SrvId) ->
    case sys_lib:is_local(SrvId) of
      true -> apply(M, F, A);
      false ->
	  case ets:lookup(b_srv_id, SrvId) of
	    [{_, _MainSrvId, Node}] -> cast({node, Node}, M, F, A);
	    _ -> {error, badsrv}
	  end
    end;
cast({node, Node}, M, F, A) -> rpc_cast(Node, M, F, A);
cast({pid, Pid}, M, F, A) when node() =:= node(Pid) ->
    apply(M, F, A);
cast({pid, Pid}, M, F, A) ->
    rpc_cast(node(Pid), M, F, A);
cast(Mix, M, F, A) ->
    case sys_env:get(server_type) of
      center -> loop_cast(loop_srvs(Mix), M, F, A);
      _ -> cast(center, big_world_lib, cast, [Mix, M, F, A])
    end.

loop_cast([], _M, _F, _A) -> ok;
loop_cast([S | T], M, F, A) ->
    cast(S, M, F, A), loop_cast(T, M, F, A).

rpc_cast(Node, M, F, A) when Node =:= node() ->
    apply(M, F, A);
rpc_cast(Node, M, F, A) ->
    case sys_env:get(server_type) =:= center orelse
	   not is_link() orelse
	     cluster_lib:is_connect_zone_node(Node)
	of
      true -> rpc:cast(Node, M, F, A);
      _ ->
	  cast(center, big_world_lib, rpc_cast, [Node, M, F, A])
    end.

send(Mix, Dest, Msg) ->
    cast(Mix, erlang, send, [Dest, Msg]).

center_node() -> center_node(sys_env:get(platform)).

center_node("local") -> 'sszg_center_0@127.0.0.1';
center_node("lab") -> 'sszg_center_0@127.0.0.1';
center_node("dev") -> 'sszg_center_0@127.0.0.1';
center_node("release2") ->
    'sszg_center_5@s5-center-sszg.shiyuegame.com';
center_node("symlf") -> 'sszg_center_6@127.0.0.1';
center_node("iosmlf") -> 'sszg_center_6@127.0.0.1';
center_node("symix") -> 'sszg_center_6@127.0.0.1';
center_node("symix2") -> 'sszg_center_6@127.0.0.1';
center_node("9377") ->
    'sszg_center_12@s12-center-sszg.shiyuegame.com';
center_node("tanwan") ->
    'sszg_center_13@s13-center-sszg.shiyuegame.com';
center_node("icebird") ->
    'sszg_center_14@s14-center-sszg.shiyuegame.com';
center_node("9377ios") ->
    'sszg_center_15@s15-center-sszg.shiyuegame.com';
center_node(_) -> sys_env:get(center_node).

all_big_world_node() ->
    all_big_world_node(sys_env:get(platform)).

all_big_world_node("local") ->
    'sszg_center_0@127.0.0.1';
all_big_world_node("dev") -> 'sszg_center_0@127.0.0.1';
all_big_world_node("lab") -> 'sszg_center_0@127.0.0.1';
all_big_world_node("release2") ->
    'sszg_center_5@s5-center-sszg.shiyuegame.com';
all_big_world_node("symlf") ->
    'sszg_center_6@127.0.0.1';
all_big_world_node("iosmlf") ->
    'sszg_center_6@127.0.0.1';
all_big_world_node("symix") ->
    'sszg_center_6@127.0.0.1';
all_big_world_node("symix2") ->
    'sszg_center_6@127.0.0.1';
all_big_world_node("9377") ->
    'sszg_center_12@s12-center-sszg.shiyuegame.com';
all_big_world_node("tanwan") ->
    'sszg_center_13@s13-center-sszg.shiyuegame.com';
all_big_world_node("icebird") ->
    'sszg_center_14@s14-center-sszg.shiyuegame.com';
all_big_world_node("9377ios") ->
    'sszg_center_15@s15-center-sszg.shiyuegame.com';
all_big_world_node(_) -> sys_env:get(center_node).

center_connect_callback() ->
    case is_same_center_ver() of
      true ->
	  catch big_world_lib:cast(center, partner_comment_mgr,
				   info,
				   [{sync_sys_ban_rename,
				     sys_env:get(server_id)}]),
	  catch partner_rand_mgr:info(sync_data);
      _ -> skip
    end,
    ok.


