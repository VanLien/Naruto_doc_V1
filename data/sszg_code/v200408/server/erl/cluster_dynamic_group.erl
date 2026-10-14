-file("data/cluster_dynamic_group.erl", 1).

-file("src/cluster/cluster_dynamic_group.erl", 1).

-module(cluster_dynamic_group).

-lager_records([{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{role_feedback_info,
		 [role_id, id, state, status2, start_time, end_msg_time,
		  finish_time, score_time, title, content,
		  questions_lists, answer_lists, score]},
		{feedback,
		 [sess, rid, feedback_id, status, score, send_time,
		  time_out]},
		{gmail,
		 [id, type, mail_type, subject, content, assets, items,
		  start_time, end_time, conds, source, can_del]},
		{mail,
		 [sess, to, to_name, from, from_name, type, group_id,
		  status, subject, content, assets, items, source, rev_ts,
		  read_time, send_time, time_out, can_del]},
		{cluster_dynamic_local_group, [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
		{cross_group, [group_id, main, group_list]},
		{cloud_task, [id, pos]},
		{srv,
		 [id, full_id, pid, type, platform, name, node, cookie,
		  ver, is_main, group_id]},
		{state, []}]).

-behaviour(gen_server).

-export([push/0, is_main/1, has_main/1, call_main/4,
	 cast_main/4, group_main_node/1, group_main_srvid/1,
	 group_cast/4, group_other_cast/4, get_group/1]).

-export([sync_data/0, sync_data/1, sync_world_lev/0]).

-export([srv_leave/1, srv_sync/1]).

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

-file("src/cluster/cluster_dynamic_group.erl", 26).

-file("inc/cluster.hrl", 1).

-record(srv,
	{id = <<>>, full_id = [], pid, type = normal, platform,
	 name = <<>>, node, cookie, ver, is_main = 0,
	 group_id = 0}).

-record(cloud_task, {id, pos = 0}).

-record(cross_group,
	{group_id = 0, main, group_list = []}).

-file("src/cluster/cluster_dynamic_group.erl", 27).

-file("inc/cluster_dynamic_group.hrl", 1).

-record(cluster_dynamic_group,
	{id = {1, <<>>}, min_world_lev = 0, group_lev = 0,
	 mode = 1, list = [], srv_num = 0, time = 0}).

-record(cluster_dynamic_srv,
	{id = {1, <<>>}, name = <<>>, main_srv = <<>>,
	 list = [], mode = 1, group_lev = 0, init_world_lev = 0,
	 world_lev = 0, open_time = 0, time = 0}).

-record(cluster_dynamic_local_group,
	{type = 0, main, list = []}).

-file("src/cluster/cluster_dynamic_group.erl", 28).

-file("inc/mail.hrl", 1).

-record(mail,
	{sess  :: {pos_integer(), bitstring()},
	 to  :: {pos_integer(), bitstring()},
	 to_name = <<>>  :: bitstring(),
	 from  :: {non_neg_integer(), bitstring()},
	 from_name = <<>>  :: bitstring(), type = 1  :: 0..1,
	 group_id = 0  :: non_neg_integer(), status = 0  :: 0..1,
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 source = <<>>  :: pos_integer(),
	 rev_ts = 0  :: pos_integer(),
	 read_time = 0  :: pos_integer(),
	 send_time = 0  :: pos_integer(),
	 time_out = 0  :: pos_integer(), can_del = 1  :: 0..1}).

-record(gmail,
	{id = 0, type = 0  :: non_neg_integer(),
	 mail_type = 1  :: non_neg_integer(),
	 subject = <<>>  :: bitstring(),
	 content = <<>>  :: bitstring(),
	 assets = []  :: [tuple()], items = []  :: [tuple()],
	 start_time = 0  :: non_neg_integer(),
	 end_time = 0  :: non_neg_integer(),
	 conds = []  :: list(), source = <<>>  :: pos_integer(),
	 can_del = 1  :: 0..1}).

-record(feedback,
	{sess, rid, feedback_id = 0, status = 0, score = 0,
	 send_time = 0, time_out = 0}).

-record(role_feedback_info,
	{role_id, id = 0, state = 0, status2 = 0,
	 start_time = 0, end_msg_time = 0, finish_time = 0,
	 score_time = 0, title = <<>>, content = <<>>,
	 questions_lists = [], answer_lists = [], score = 0}).

-file("src/cluster/cluster_dynamic_group.erl", 29).

-file("inc/rank.hrl", 1).

-record(rank,
	{type = 0  :: non_neg_integer(), list = []  :: list(),
	 last_val = 0  :: non_neg_integer(),
	 len = 0  :: non_neg_integer(), is_cross = 0  :: 0 | 1,
	 ctime = 0  :: non_neg_integer()}).

-record(rank_rc,
	{ver = 3  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 idx = 0  :: non_neg_integer(),
	 val1 = 0  :: non_neg_integer(),
	 val2 = 0  :: non_neg_integer(),
	 val3 = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 look_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 guild_name = <<>>  :: bitstring(),
	 power = 0  :: non_neg_integer(),
	 all_power = 0  :: non_neg_integer(),
	 desc = <<>>  :: bitstring(), looks = []  :: list(),
	 ext = []  :: list(), time = 0  :: non_neg_integer(),
	 is_cross = false, avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(rank_cfg,
	{type = 0  :: non_neg_integer(),
	 num = 300  :: non_neg_integer(),
	 keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
	 min_val = 1  :: non_neg_integer(),
	 nologin = 0  :: non_neg_integer(),
	 zone = rank_zone_1  :: atom(), exit_rank = 0  :: 0..1}).

-file("src/cluster/cluster_dynamic_group.erl", 30).

-spec push() -> ok.

push() ->
    {StartTime, EndTime} = case
			     sys_env:get(cluster_dynamic_group_state)
			       of
			     #{start_time := StartTime1, end_time := EndTime1}
				 when EndTime1 > 0 ->
				 {StartTime1, EndTime1};
			     _ ->
				 Now = date:unixtime(),
				 {Week, Hour, Minu, Sec} =
				     cluster_dynamic_group_data:get_const(reset_time),
				 EndTime1 = Now +
					      date:week_next_diff([Week],
								  {Hour, Minu,
								   Sec}),
				 {Now, EndTime1}
			   end,
    SrvId = sys_env:get(server_id),
    SrvList = case ets:lookup(cluster_dynamic_srv,
			      {1, SrvId})
		  of
		[#cluster_dynamic_srv{list = List, mode = 1}] ->
		    to_cli(List, 1, []);
		_ -> []
	      end,
    sys_conn:pack_send(22150,
		       {StartTime, EndTime, SrvList}),
    ok.

to_cli([], _Type, L) -> lists:reverse(L);
to_cli([SrvId | T], Type, L) ->
    case ets:lookup(cluster_dynamic_srv, {Type, SrvId}) of
      [#cluster_dynamic_srv{name = Name, world_lev = WorldLev,
			    open_time = OpenTime}] ->
	  Data = {SrvId, Name, WorldLev, OpenTime},
	  to_cli(T, Type, [Data | L]);
      _ ->
	  case cluster_lib:call(center, ets, lookup,
				[cluster_dynamic_srv, {Type, SrvId}])
	      of
	    [#cluster_dynamic_srv{name = Name, world_lev = WorldLev,
				  open_time = OpenTime}] ->
		Data = {SrvId, Name, WorldLev, OpenTime},
		to_cli(T, Type, [Data | L]);
	    _Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcluster_dynamic_group67, _,
		   {__Levelcluster_dynamic_group67,
		    __Tracescluster_dynamic_group67}}
		      when __Levelcluster_dynamic_group67 band 8 /= 0 orelse
			     __Tracescluster_dynamic_group67 /= [] ->
		      lager:do_log(error,
				   [{module, cluster_dynamic_group},
				    {function, to_cli}, {line, 67},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("请求服务器[~s]信息失败:~w",
						 [SrvId, _Err]),
				   none, 4096, 8,
				   __Levelcluster_dynamic_group67,
				   __Tracescluster_dynamic_group67, lager_event,
				   __Pidcluster_dynamic_group67);
		  _ -> ok
		end,
		Data = {SrvId, <<>>, 0, 0},
		to_cli(T, Type, [Data | L])
	  end
    end.

-spec group_update_fire(Type :: non_neg_integer(),
			true | false) -> ok.

group_update_fire(_, true) ->
    catch sky_ladder_mgr:info(cluster_open),
    catch guild_rank:info(sync_group_rank),
    catch arena_cluster_mgr:info(cluster_open),
    catch arena_team_mgr:info(cluster_main),
    catch rank_mgr:info({all_info, sync_group_rank});
group_update_fire(_, _IsMain) ->
    catch sky_ladder_mgr:info(cluster_open),
    catch arena_cluster_mgr:info(cluster_open),
    ok.

-spec group_reset_fire(#cluster_dynamic_srv{},
		       [#cluster_dynamic_srv{}], IsMain :: boolean()) -> ok.

group_reset_fire(_NewSrv, [], _IsMain) ->
    catch sky_ladder_mgr:info(cluster_open),
    catch guild_rank:info(sync_group_rank),
    catch rank_mgr:info({all_info, sync_group_rank}),
    catch arena_cluster_mgr:info(cluster_open),
    catch
      arena_cluster_mgr:info(re_sync_robot_to_main_zone),
    catch home_mgr:info(re_sync_rand_to_main_zone),
    catch arena_cluster_champion_mgr:info(cluster_change),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_dynamic_group99, _,
       {__Levelcluster_dynamic_group99,
	__Tracescluster_dynamic_group99}}
	  when __Levelcluster_dynamic_group99 band 64 /= 0 orelse
		 __Tracescluster_dynamic_group99 /= [] ->
	  lager:do_log(info,
		       [{module, cluster_dynamic_group},
			{function, group_reset_fire}, {line, 99},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "首次开通跨服", none, 4096, 64,
		       __Levelcluster_dynamic_group99,
		       __Tracescluster_dynamic_group99, lager_event,
		       __Pidcluster_dynamic_group99);
      _ -> ok
    end;
group_reset_fire(#cluster_dynamic_srv{list = SrvList,
				      time = Time, mode = Mode},
		 [#cluster_dynamic_srv{list = SrvList1, time = Time1}],
		 IsMain)
    when Time =/= Time1 ->
    case Mode of
      1 ->
	  mail:global_send(#gmail{id = {cluster, 1},
				  end_time = date:unixtime() + 86400 * 2,
				  subject =
				      lang:get(<<"Thiết lập lại thời gian và không gian "
						 "trên nhiều máy chủ"/utf8>>),
				  content =
				      lang:get(<<"Kính gửi Quý Nhẫn Giả, nhóm máy chủ "
						 "chéo lần này đã được tổ chức lại. Các "
						 "bậc thang máy chủ chéo và các trận chiến "
						 "bang hội sẽ được kết hợp theo nhóm mới. "
						 "Để biết chi tiết, vui lòng truy cập "
						 "trang chính.City-View xuyên thời gian "
						 "và không gian trên các máy chủ"/utf8>>),
				  conds = [{minlev, 30}]});
      _ -> pass
    end,
    catch sky_ladder_mgr:info(clear_data),
    catch sky_ladder_mgr:info(cluster_open),
    rank_mgr:clear([1004, 1006, 1033]),
    catch guild_rank:info(sync_group_rank),
    catch rank_mgr:info({all_info, sync_group_rank}),
    catch arena_cluster_mgr:info(clear_data),
    catch arena_cluster_mgr:info(cluster_open),
    catch
      arena_cluster_mgr:info(re_sync_robot_to_main_zone),
    catch home_mgr:info(clear_data),
    catch home_mgr:info(re_sync_rand_to_main_zone),
    catch arena_cluster_champion_mgr:info(cluster_change),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_dynamic_group119, _,
       {__Levelcluster_dynamic_group119,
	__Tracescluster_dynamic_group119}}
	  when __Levelcluster_dynamic_group119 band 64 /= 0 orelse
		 __Tracescluster_dynamic_group119 /= [] ->
	  lager:do_log(info,
		       [{module, cluster_dynamic_group},
			{function, group_reset_fire}, {line, 119},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("动态跨服信息重新分配~w => ~w",
				     [SrvList, SrvList1]),
		       none, 4096, 64, __Levelcluster_dynamic_group119,
		       __Tracescluster_dynamic_group119, lager_event,
		       __Pidcluster_dynamic_group119);
      _ -> ok
    end;
group_reset_fire(_NewSrv, _OldSrv, _IsMain) -> ok.

-spec is_main(pos_integer()) -> true | false.

is_main(Type) ->
    SrvId = sys_env:get(server_id),
    case get_group(Type) of
      {true, #cluster_dynamic_local_group{main = SrvId}} ->
	  true;
      _ -> false
    end.

-spec has_main(pos_integer()) -> true | false.

has_main(Type) ->
    SrvId = sys_env:get(server_id),
    case get_group(Type) of
      {true, #cluster_dynamic_local_group{main = SrvId}} ->
	  true;
      {true, #cluster_dynamic_local_group{main = MainSrvId}}
	  when MainSrvId =/= undefined ->
	  case ets:lookup(srv_id, MainSrvId) of
	    [{_, _MainSrvId, MainNode}] ->
		case net_adm:ping(MainNode) of
		  pong -> true;
		  pang -> false
		end;
	    _ -> false
	  end;
      _ -> false
    end.

call_main(Type, M, F, A) ->
    SrvId = sys_env:get(server_id),
    case get_group(Type) of
      {true, #cluster_dynamic_local_group{main = SrvId}} ->
	  catch apply(M, F, A);
      {true, #cluster_dynamic_local_group{main = MainSrvId}}
	  when MainSrvId =/= undefined ->
	  cluster_lib:call(MainSrvId, M, F, A);
      _ -> {false, "服务尚未准备好, 无法获得信息"}
    end.

cast_main(Type, M, F, A) ->
    SrvId = sys_env:get(server_id),
    case get_group(Type) of
      {true, #cluster_dynamic_local_group{main = SrvId}} ->
	  catch apply(M, F, A);
      {true, #cluster_dynamic_local_group{main = MainSrvId}}
	  when MainSrvId =/= undefined ->
	  cluster_lib:cast(MainSrvId, M, F, A);
      _ -> {false, "服务尚未准备好, 无法获得信息"}
    end.

group_main_node(Type) ->
    case get_group(Type) of
      {true, #cluster_dynamic_local_group{main = MainSrvId}}
	  when MainSrvId =/= undefined ->
	  case ets:lookup(srv_id, MainSrvId) of
	    [{_, _MainSrvId, MainNode}] ->
		case net_adm:ping(MainNode) of
		  pong -> MainNode;
		  pang -> undefined
		end;
	    _ -> undefined
	  end;
      _ -> undefined
    end.

group_main_srvid(Type) ->
    case get_group(Type) of
      {true,
       #cluster_dynamic_local_group{main = MainSrvId}} ->
	  MainSrvId;
      _ -> undefined
    end.

group_cast(Type, M, F, A) ->
    apply(M, F, A), group_other_cast(Type, M, F, A).

group_other_cast(Type, M, F, A) ->
    case get_group(Type) of
      {true, #cluster_dynamic_local_group{list = List}} ->
	  SrvId = sys_env:get(server_id),
	  [cluster_lib:cast(SrvId1, M, F, A)
	   || SrvId1 <- List, SrvId1 =/= SrvId],
	  true;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcluster_dynamic_group214, _,
	     {__Levelcluster_dynamic_group214,
	      __Tracescluster_dynamic_group214}}
		when __Levelcluster_dynamic_group214 band 8 /= 0 orelse
		       __Tracescluster_dynamic_group214 /= [] ->
		lager:do_log(error,
			     [{module, cluster_dynamic_group},
			      {function, group_other_cast}, {line, 214},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w 组内广播[~w ~w]时,无法获取组服务",
					   [Type, M, F]),
			     none, 4096, 8, __Levelcluster_dynamic_group214,
			     __Tracescluster_dynamic_group214, lager_event,
			     __Pidcluster_dynamic_group214);
	    _ -> ok
	  end,
	  false
    end.

get_group(Type) ->
    case ets:lookup(cluster_dynamic_local_group, Type) of
      [G] -> {true, G};
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
	    {__Pidcluster_dynamic_group224, _,
	     {__Levelcluster_dynamic_group224,
	      __Tracescluster_dynamic_group224}}
		when __Levelcluster_dynamic_group224 band 8 /= 0 orelse
		       __Tracescluster_dynamic_group224 /= [] ->
		lager:do_log(error,
			     [{module, cluster_dynamic_group},
			      {function, get_group}, {line, 224},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("~w无法获取组服务信息:~w", [Type, _Err]),
			     none, 4096, 8, __Levelcluster_dynamic_group224,
			     __Tracescluster_dynamic_group224, lager_event,
			     __Pidcluster_dynamic_group224);
	    _ -> ok
	  end,
	  {false, "服务正忙, 无法获取信息"}
    end.

sync_data() -> [sync_data(Type) || Type <- [1]].

sync_data(Type) -> info({sync_data, Type}).

srv_leave(Srv) ->
    [info({srv_leave, Type, Srv}) || Type <- [1]], ok.

srv_sync(Srv = #srv{}) ->
    [info({srv_sync, Type, Srv}) || Type <- [1]], ok.

sync_world_lev() ->
    [info({sync_world_lev, Type}) || Type <- [1]], ok.

info(Info) -> cluster_dynamic_group ! Info.

cast(Info) ->
    gen_server:cast(cluster_dynamic_group, Info).

call(Info) ->
    case catch gen_server:call(cluster_dynamic_group, Info,
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
	    {__Pidcluster_dynamic_group258, _,
	     {__Levelcluster_dynamic_group258,
	      __Tracescluster_dynamic_group258}}
		when __Levelcluster_dynamic_group258 band 8 /= 0 orelse
		       __Tracescluster_dynamic_group258 /= [] ->
		lager:do_log(error,
			     [{module, cluster_dynamic_group}, {function, call},
			      {line, 258}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [cluster_dynamic_group, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelcluster_dynamic_group258,
			     __Tracescluster_dynamic_group258, lager_event,
			     __Pidcluster_dynamic_group258);
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
    gen_server:start_link({local, cluster_dynamic_group},
			  cluster_dynamic_group, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_dynamic_group264, _,
       {__Levelcluster_dynamic_group264,
	__Tracescluster_dynamic_group264}}
	  when __Levelcluster_dynamic_group264 band 64 /= 0 orelse
		 __Tracescluster_dynamic_group264 /= [] ->
	  lager:do_log(info,
		       [{module, cluster_dynamic_group}, {function, init},
			{line, 264}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [cluster_dynamic_group]),
		       none, 4096, 64, __Levelcluster_dynamic_group264,
		       __Tracescluster_dynamic_group264, lager_event,
		       __Pidcluster_dynamic_group264);
      _ -> ok
    end,
    d_ets_lib:new_d_ets(cluster_dynamic_srv,
			"dets/cluster_dynamic_srv_new.dets",
			#cluster_dynamic_srv.id, set),
    ets:new(cluster_dynamic_local_group,
	    [set, named_table, public,
	     {keypos, #cluster_dynamic_local_group.type}]),
    ets:new(cluster_dynamic_srv_id,
	    [set, named_table, public, {keypos, 1}]),
    case sys_env:get(platform) of
      "verifyios" ->
	  SelfSrvId = sys_env:get(server_id),
	  dets:insert(cluster_dynamic_srv,
		      #cluster_dynamic_srv{id = {1, SelfSrvId},
					   main_srv = SelfSrvId,
					   list = [SelfSrvId]});
      _ -> skip
    end,
    d_ets_lib:load_dets_to_ets(cluster_dynamic_srv,
			       fun (Srv = #cluster_dynamic_srv{id = {Type, _},
							       main_srv =
								   MainSrvId,
							       list = List}) ->
				       [ets:insert(cluster_dynamic_srv_id,
						   {{Type, SrvId}, MainSrvId})
					|| SrvId <- List],
				       load_group_srv_info(List, MainSrvId,
							   #cluster_dynamic_local_group{type
											    =
											    Type}),
				       {ok, Srv}
			       end),
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
      {__Pidcluster_dynamic_group281, _,
       {__Levelcluster_dynamic_group281,
	__Tracescluster_dynamic_group281}}
	  when __Levelcluster_dynamic_group281 band 64 /= 0 orelse
		 __Tracescluster_dynamic_group281 /= [] ->
	  lager:do_log(info,
		       [{module, cluster_dynamic_group}, {function, init},
			{line, 281}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [cluster_dynamic_group]),
		       none, 4096, 64, __Levelcluster_dynamic_group281,
		       __Tracescluster_dynamic_group281, lager_event,
		       __Pidcluster_dynamic_group281);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(srv_merge, State) ->
    SrvId = sys_env:get(server_id),
    Type = 1,
    cluster_lib:cast(center, ets, insert,
		     [merge_srv_id, {SrvId, date:unixtime()}]),
    case ets:lookup(cluster_dynamic_srv, {Type, SrvId}) of
      [] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcluster_dynamic_group297, _,
	     {__Levelcluster_dynamic_group297,
	      __Tracescluster_dynamic_group297}}
		when __Levelcluster_dynamic_group297 band 64 /= 0 orelse
		       __Tracescluster_dynamic_group297 /= [] ->
		lager:do_log(info,
			     [{module, cluster_dynamic_group},
			      {function, handle_info}, {line, 297},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("当前没有跨服信息", []), none, 4096, 64,
			     __Levelcluster_dynamic_group297,
			     __Tracescluster_dynamic_group297, lager_event,
			     __Pidcluster_dynamic_group297);
	    _ -> ok
	  end;
      [_] ->
	  erlang:send_after(60000, self(), notify_srv_merge),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcluster_dynamic_group300, _,
	     {__Levelcluster_dynamic_group300,
	      __Tracescluster_dynamic_group300}}
		when __Levelcluster_dynamic_group300 band 64 /= 0 orelse
		       __Tracescluster_dynamic_group300 /= [] ->
		lager:do_log(info,
			     [{module, cluster_dynamic_group},
			      {function, handle_info}, {line, 300},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "存在跨服信息", none, 4096, 64,
			     __Levelcluster_dynamic_group300,
			     __Tracescluster_dynamic_group300, lager_event,
			     __Pidcluster_dynamic_group300);
	    _ -> ok
	  end;
      _ ->
	  erlang:send_after(60000, self(), notify_srv_merge),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcluster_dynamic_group303, _,
	     {__Levelcluster_dynamic_group303,
	      __Tracescluster_dynamic_group303}}
		when __Levelcluster_dynamic_group303 band 64 /= 0 orelse
		       __Tracescluster_dynamic_group303 /= [] ->
		lager:do_log(info,
			     [{module, cluster_dynamic_group},
			      {function, handle_info}, {line, 303},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     "获取跨服信息失败", none, 4096, 64,
			     __Levelcluster_dynamic_group303,
			     __Tracescluster_dynamic_group303, lager_event,
			     __Pidcluster_dynamic_group303);
	    _ -> ok
	  end
    end,
    {noreply, State};
handle_info(notify_srv_merge, State) ->
    SrvId = sys_env:get(server_id),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_dynamic_group310, _,
       {__Levelcluster_dynamic_group310,
	__Tracescluster_dynamic_group310}}
	  when __Levelcluster_dynamic_group310 band 64 /= 0 orelse
		 __Tracescluster_dynamic_group310 /= [] ->
	  lager:do_log(info,
		       [{module, cluster_dynamic_group},
			{function, handle_info}, {line, 310},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("通知中央服，服务器即将做合服处理:~s", [SrvId]), none,
		       4096, 64, __Levelcluster_dynamic_group310,
		       __Tracescluster_dynamic_group310, lager_event,
		       __Pidcluster_dynamic_group310);
      _ -> ok
    end,
    cluster_lib:cast(center, c_cluster_dynamic_group, info,
		     [{srv_merge, SrvId}]),
    {noreply, State};
handle_info(merge_clear, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_dynamic_group316, _,
       {__Levelcluster_dynamic_group316,
	__Tracescluster_dynamic_group316}}
	  when __Levelcluster_dynamic_group316 band 64 /= 0 orelse
		 __Tracescluster_dynamic_group316 /= [] ->
	  lager:do_log(info,
		       [{module, cluster_dynamic_group},
			{function, handle_info}, {line, 316},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "接收到跨服消息清理", none, 4096, 64,
		       __Levelcluster_dynamic_group316,
		       __Tracescluster_dynamic_group316, lager_event,
		       __Pidcluster_dynamic_group316);
      _ -> ok
    end,
    merge_before_stat:cluster_clear(),
    d_ets_lib:clear_d_ets(cluster_dynamic_srv),
    ets:delete_all_objects(cluster_dynamic_local_group),
    ets:delete_all_objects(cluster_dynamic_srv_id),
    {noreply, State};
handle_info({merge_clear, SrvList}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_dynamic_group325, _,
       {__Levelcluster_dynamic_group325,
	__Tracescluster_dynamic_group325}}
	  when __Levelcluster_dynamic_group325 band 64 /= 0 orelse
		 __Tracescluster_dynamic_group325 /= [] ->
	  lager:do_log(info,
		       [{module, cluster_dynamic_group},
			{function, handle_info}, {line, 325},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("接收到跨服消息清理:~w", [SrvList]), none, 4096,
		       64, __Levelcluster_dynamic_group325,
		       __Tracescluster_dynamic_group325, lager_event,
		       __Pidcluster_dynamic_group325);
      _ -> ok
    end,
    SrvId = sys_env:get(server_id),
    Type = 1,
    case ets:lookup(cluster_dynamic_srv, {Type, SrvId}) of
      [Srv] when SrvList =/= [] ->
	  [NewMainSrvId | _] = SrvList,
	  merge_before_stat:switch_main_srv(old_main, Srv,
					    Srv#cluster_dynamic_srv{main_srv =
									NewMainSrvId,
								    list =
									SrvList});
      _ -> pass
    end,
    merge_before_stat:cluster_clear(),
    d_ets_lib:clear_d_ets(cluster_dynamic_srv),
    ets:delete_all_objects(cluster_dynamic_local_group),
    ets:delete_all_objects(cluster_dynamic_srv_id),
    {noreply, State};
handle_info({merge_update,
	     Srv = #cluster_dynamic_srv{id = {Type, _},
					main_srv = MainSrvId, list = List}},
	    State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_dynamic_group342, _,
       {__Levelcluster_dynamic_group342,
	__Tracescluster_dynamic_group342}}
	  when __Levelcluster_dynamic_group342 band 64 /= 0 orelse
		 __Tracescluster_dynamic_group342 /= [] ->
	  lager:do_log(info,
		       [{module, cluster_dynamic_group},
			{function, handle_info}, {line, 342},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("接收到跨服信息变化:~w", [Srv]), none, 4096, 64,
		       __Levelcluster_dynamic_group342,
		       __Tracescluster_dynamic_group342, lager_event,
		       __Pidcluster_dynamic_group342);
      _ -> ok
    end,
    d_ets_lib:save_d_ets(cluster_dynamic_srv, Srv),
    ets:match_delete(cluster_dynamic_srv_id,
		     {{Type, '_'}, '_'}),
    [ets:insert(cluster_dynamic_srv_id,
		{{Type, SrvId1}, MainSrvId})
     || SrvId1 <- List],
    load_group_srv_info(List, MainSrvId,
			#cluster_dynamic_local_group{type = Type}),
    {noreply, State};
handle_info({merge_main_switch,
	     Srv = #cluster_dynamic_srv{id = {Type, SrvId},
					main_srv = MainSrvId, list = List}},
	    State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_dynamic_group351, _,
       {__Levelcluster_dynamic_group351,
	__Tracescluster_dynamic_group351}}
	  when __Levelcluster_dynamic_group351 band 64 /= 0 orelse
		 __Tracescluster_dynamic_group351 /= [] ->
	  lager:do_log(info,
		       [{module, cluster_dynamic_group},
			{function, handle_info}, {line, 351},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("接收到跨服主服信息变化:~w", [Srv]), none, 4096, 64,
		       __Levelcluster_dynamic_group351,
		       __Tracescluster_dynamic_group351, lager_event,
		       __Pidcluster_dynamic_group351);
      _ -> ok
    end,
    case ets:lookup(cluster_dynamic_srv, {Type, SrvId}) of
      [OldSrv] when SrvId =:= MainSrvId ->
	  merge_before_stat:switch_main_srv(new_main, OldSrv,
					    Srv);
      [OldSrv] ->
	  merge_before_stat:switch_main_srv(zone, OldSrv, Srv);
      _ -> pass
    end,
    d_ets_lib:save_d_ets(cluster_dynamic_srv, Srv),
    ets:match_delete(cluster_dynamic_srv_id,
		     {{Type, '_'}, '_'}),
    [ets:insert(cluster_dynamic_srv_id,
		{{Type, SrvId1}, MainSrvId})
     || SrvId1 <- List],
    load_group_srv_info(List, MainSrvId,
			#cluster_dynamic_local_group{type = Type}),
    {noreply, State};
handle_info(gm_clear, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_dynamic_group367, _,
       {__Levelcluster_dynamic_group367,
	__Tracescluster_dynamic_group367}}
	  when __Levelcluster_dynamic_group367 band 64 /= 0 orelse
		 __Tracescluster_dynamic_group367 /= [] ->
	  lager:do_log(info,
		       [{module, cluster_dynamic_group},
			{function, handle_info}, {line, 367},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "GM清空数据", none, 4096, 64,
		       __Levelcluster_dynamic_group367,
		       __Tracescluster_dynamic_group367, lager_event,
		       __Pidcluster_dynamic_group367);
      _ -> ok
    end,
    d_ets_lib:clear_d_ets(cluster_dynamic_srv),
    ets:delete_all_objects(cluster_dynamic_local_group),
    ets:delete_all_objects(cluster_dynamic_srv_id),
    {noreply, State};
handle_info({sync_data, Type}, State) ->
    case sys_env:get(srv_merge_flag) of
      1 -> pass;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcluster_dynamic_group378, _,
	     {__Levelcluster_dynamic_group378,
	      __Tracescluster_dynamic_group378}}
		when __Levelcluster_dynamic_group378 band 64 /= 0 orelse
		       __Tracescluster_dynamic_group378 /= [] ->
		lager:do_log(info,
			     [{module, cluster_dynamic_group},
			      {function, handle_info}, {line, 378},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("开始同步分组信息:~w", [Type]), none, 4096,
			     64, __Levelcluster_dynamic_group378,
			     __Tracescluster_dynamic_group378, lager_event,
			     __Pidcluster_dynamic_group378);
	    _ -> ok
	  end,
	  case cluster_lib:call(center, sys_env, get,
				[cluster_dynamic_group_state])
	      of
	    StateInfo = #{} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcluster_dynamic_group381, _,
		   {__Levelcluster_dynamic_group381,
		    __Tracescluster_dynamic_group381}}
		      when __Levelcluster_dynamic_group381 band 64 /= 0 orelse
			     __Tracescluster_dynamic_group381 /= [] ->
		      lager:do_log(info,
				   [{module, cluster_dynamic_group},
				    {function, handle_info}, {line, 381},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("同步状态信息成功:~w", [StateInfo]),
				   none, 4096, 64,
				   __Levelcluster_dynamic_group381,
				   __Tracescluster_dynamic_group381,
				   lager_event, __Pidcluster_dynamic_group381);
		  _ -> ok
		end,
		sys_env:save(cluster_dynamic_group_state, StateInfo);
	    _ -> pass
	  end,
	  SrvId = sys_env:get(server_id),
	  case cluster_lib:call(center, ets, lookup,
				[cluster_dynamic_srv, {Type, SrvId}])
	      of
	    [Srv = #cluster_dynamic_srv{list = List,
					main_srv = MainSrvId, mode = Mode}] ->
		sys_env:save(cluster_dynamic_group_mode, Mode),
		case ets:lookup(cluster_dynamic_srv, {Type, SrvId}) of
		  [Srv] ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidcluster_dynamic_group391, _,
			 {__Levelcluster_dynamic_group391,
			  __Tracescluster_dynamic_group391}}
			    when __Levelcluster_dynamic_group391 band 64 /= 0
				   orelse
				   __Tracescluster_dynamic_group391 /= [] ->
			    lager:do_log(info,
					 [{module, cluster_dynamic_group},
					  {function, handle_info}, {line, 391},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("分组信息没有变化type=~w",
						       [Type]),
					 none, 4096, 64,
					 __Levelcluster_dynamic_group391,
					 __Tracescluster_dynamic_group391,
					 lager_event,
					 __Pidcluster_dynamic_group391);
			_ -> ok
		      end;
		  OldInfo ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidcluster_dynamic_group393, _,
			 {__Levelcluster_dynamic_group393,
			  __Tracescluster_dynamic_group393}}
			    when __Levelcluster_dynamic_group393 band 64 /= 0
				   orelse
				   __Tracescluster_dynamic_group393 /= [] ->
			    lager:do_log(info,
					 [{module, cluster_dynamic_group},
					  {function, handle_info}, {line, 393},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("分组信息变化，同步完成type=~w",
						       [Type]),
					 none, 4096, 64,
					 __Levelcluster_dynamic_group393,
					 __Tracescluster_dynamic_group393,
					 lager_event,
					 __Pidcluster_dynamic_group393);
			_ -> ok
		      end,
		      d_ets_lib:save_d_ets(cluster_dynamic_srv, Srv),
		      ets:match_delete(cluster_dynamic_srv_id,
				       {{Type, '_'}, '_'}),
		      [ets:insert(cluster_dynamic_srv_id,
				  {{Type, SrvId1}, MainSrvId})
		       || SrvId1 <- List],
		      load_group_srv_info(List, MainSrvId,
					  #cluster_dynamic_local_group{type =
									   Type}),
		      group_reset_fire(Srv, OldInfo, SrvId =:= MainSrvId)
		end;
	    [] ->
		case ets:member(cluster_dynamic_srv, {Type, SrvId}) of
		  true ->
		      case {whereis(lager_event), whereis(lager_event),
			    lager_config:get({lager_event, loglevel}, {0, []})}
			  of
			{undefined, undefined, _} ->
			    fun () -> {error, lager_not_running} end();
			{undefined, _, _} ->
			    fun () ->
				    {error, {sink_not_configured, lager_event}}
			    end();
			{__Pidcluster_dynamic_group403, _,
			 {__Levelcluster_dynamic_group403,
			  __Tracescluster_dynamic_group403}}
			    when __Levelcluster_dynamic_group403 band 64 /= 0
				   orelse
				   __Tracescluster_dynamic_group403 /= [] ->
			    lager:do_log(info,
					 [{module, cluster_dynamic_group},
					  {function, handle_info}, {line, 403},
					  {pid, pid_to_list(self())},
					  {node, node()}
					  | lager:md()],
					 io_lib:format("分组信息被清空:~w", [Type]),
					 none, 4096, 64,
					 __Levelcluster_dynamic_group403,
					 __Tracescluster_dynamic_group403,
					 lager_event,
					 __Pidcluster_dynamic_group403);
			_ -> ok
		      end,
		      d_ets_lib:clear_d_ets(cluster_dynamic_srv,
					    {Type, SrvId}),
		      ets:delete(cluster_dynamic_local_group, Type),
		      ets:match_delete(cluster_dynamic_srv_id,
				       {{Type, '_'}, '_'});
		  _ -> ok
		end;
	    _Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcluster_dynamic_group411, _,
		   {__Levelcluster_dynamic_group411,
		    __Tracescluster_dynamic_group411}}
		      when __Levelcluster_dynamic_group411 band 8 /= 0 orelse
			     __Tracescluster_dynamic_group411 /= [] ->
		      lager:do_log(error,
				   [{module, cluster_dynamic_group},
				    {function, handle_info}, {line, 411},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("同步分组信息失败,type=~w, err=~w",
						 [Type, _Err]),
				   none, 4096, 8,
				   __Levelcluster_dynamic_group411,
				   __Tracescluster_dynamic_group411,
				   lager_event, __Pidcluster_dynamic_group411);
		  _ -> ok
		end
	  end,
	  info({sync_world_lev, Type})
    end,
    {noreply, State};
handle_info({sync_world_lev, Type}, State) ->
    WorldLev = world_lev:get_world_lev(),
    SrvId = sys_env:get(server_id),
    case ets:lookup(cluster_dynamic_srv, {Type, SrvId}) of
      [Srv = #cluster_dynamic_srv{world_lev = WorldLev1}]
	  when WorldLev1 =/= WorldLev ->
	  cluster_lib:cast(center, ets, update_element,
			   [cluster_dynamic_srv, {Type, SrvId},
			    {#cluster_dynamic_srv.world_lev, WorldLev}]),
	  NewSrv = Srv#cluster_dynamic_srv{world_lev = WorldLev},
	  d_ets_lib:save_d_ets(cluster_dynamic_srv, NewSrv),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidcluster_dynamic_group426, _,
	     {__Levelcluster_dynamic_group426,
	      __Tracescluster_dynamic_group426}}
		when __Levelcluster_dynamic_group426 band 64 /= 0 orelse
		       __Tracescluster_dynamic_group426 /= [] ->
		lager:do_log(info,
			     [{module, cluster_dynamic_group},
			      {function, handle_info}, {line, 426},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("世界等级变化，type=~w world_lev=~w>~w",
					   [Type, WorldLev1, WorldLev]),
			     none, 4096, 64, __Levelcluster_dynamic_group426,
			     __Tracescluster_dynamic_group426, lager_event,
			     __Pidcluster_dynamic_group426);
	    _ -> ok
	  end;
      _ -> pass
    end,
    {noreply, State};
handle_info({srv_leave, Type, #srv{id = SrvId}},
	    State) ->
    case ets:member(cluster_dynamic_srv_id, {Type, SrvId})
	of
      true ->
	  case get_group(Type) of
	    {true,
	     G = #cluster_dynamic_local_group{main = SrvId,
					      list = List}} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcluster_dynamic_group437, _,
		   {__Levelcluster_dynamic_group437,
		    __Tracescluster_dynamic_group437}}
		      when __Levelcluster_dynamic_group437 band 64 /= 0 orelse
			     __Tracescluster_dynamic_group437 /= [] ->
		      lager:do_log(info,
				   [{module, cluster_dynamic_group},
				    {function, handle_info}, {line, 437},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("主服退出type=~w, srv_id=~s",
						 [Type, SrvId]),
				   none, 4096, 64,
				   __Levelcluster_dynamic_group437,
				   __Tracescluster_dynamic_group437,
				   lager_event, __Pidcluster_dynamic_group437);
		  _ -> ok
		end,
		NewG = G#cluster_dynamic_local_group{main = undefined,
						     list = List -- [SrvId]},
		ets:insert(cluster_dynamic_local_group, NewG);
	    {true, G = #cluster_dynamic_local_group{list = List}} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcluster_dynamic_group441, _,
		   {__Levelcluster_dynamic_group441,
		    __Tracescluster_dynamic_group441}}
		      when __Levelcluster_dynamic_group441 band 64 /= 0 orelse
			     __Tracescluster_dynamic_group441 /= [] ->
		      lager:do_log(info,
				   [{module, cluster_dynamic_group},
				    {function, handle_info}, {line, 441},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("普通服退出type=~w, srv_id=~s",
						 [Type, SrvId]),
				   none, 4096, 64,
				   __Levelcluster_dynamic_group441,
				   __Tracescluster_dynamic_group441,
				   lager_event, __Pidcluster_dynamic_group441);
		  _ -> ok
		end,
		NewG = G#cluster_dynamic_local_group{list =
							 List -- [SrvId]},
		ets:insert(cluster_dynamic_local_group, NewG);
	    _ -> ok
	  end;
      _ -> ok
    end,
    {noreply, State};
handle_info({srv_sync, Type, Srv = #srv{id = SrvId}},
	    State) ->
    case ets:lookup(cluster_dynamic_srv_id, {Type, SrvId})
	of
      [{_, MainSrvId}] ->
	  cluster_lib:sync_connect_zone_node(Srv),
	  case get_group(Type) of
	    {true, G = #cluster_dynamic_local_group{list = List}}
		when MainSrvId =:= SrvId ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcluster_dynamic_group459, _,
		   {__Levelcluster_dynamic_group459,
		    __Tracescluster_dynamic_group459}}
		      when __Levelcluster_dynamic_group459 band 64 /= 0 orelse
			     __Tracescluster_dynamic_group459 /= [] ->
		      lager:do_log(info,
				   [{module, cluster_dynamic_group},
				    {function, handle_info}, {line, 459},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("主服进入type=~w, srv_id=~s",
						 [Type, SrvId]),
				   none, 4096, 64,
				   __Levelcluster_dynamic_group459,
				   __Tracescluster_dynamic_group459,
				   lager_event, __Pidcluster_dynamic_group459);
		  _ -> ok
		end,
		List1 = lists:delete(SrvId, List),
		NewG = G#cluster_dynamic_local_group{main = SrvId,
						     list = [SrvId | List1]},
		ets:insert(cluster_dynamic_local_group, NewG),
		group_update_fire(Type, true);
	    {true, G = #cluster_dynamic_local_group{list = List}} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidcluster_dynamic_group465, _,
		   {__Levelcluster_dynamic_group465,
		    __Tracescluster_dynamic_group465}}
		      when __Levelcluster_dynamic_group465 band 64 /= 0 orelse
			     __Tracescluster_dynamic_group465 /= [] ->
		      lager:do_log(info,
				   [{module, cluster_dynamic_group},
				    {function, handle_info}, {line, 465},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("普通服进入type=~w, srv_id=~s",
						 [Type, SrvId]),
				   none, 4096, 64,
				   __Levelcluster_dynamic_group465,
				   __Tracescluster_dynamic_group465,
				   lager_event, __Pidcluster_dynamic_group465);
		  _ -> ok
		end,
		List1 = lists:delete(SrvId, List),
		NewG = G#cluster_dynamic_local_group{list =
							 List1 ++ [SrvId]},
		ets:insert(cluster_dynamic_local_group, NewG),
		group_update_fire(Type, false);
	    _ -> ok
	  end;
      _ -> ok
    end,
    {noreply, State};
handle_info(center_get_srv_info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcluster_dynamic_group479, _,
       {__Levelcluster_dynamic_group479,
	__Tracescluster_dynamic_group479}}
	  when __Levelcluster_dynamic_group479 band 64 /= 0 orelse
		 __Tracescluster_dynamic_group479 /= [] ->
	  lager:do_log(info,
		       [{module, cluster_dynamic_group},
			{function, handle_info}, {line, 479},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("接收到中央服取", []), none, 4096, 64,
		       __Levelcluster_dynamic_group479,
		       __Tracescluster_dynamic_group479, lager_event,
		       __Pidcluster_dynamic_group479);
      _ -> ok
    end,
    cluster_lib:cast(center, c_cluster_dynamic_group, info,
		     [{push_srv_info, sys_env:get(server_id),
		       {sys_env:get(zone_name), world_lev:get_world_lev(),
			sys_env:get(open_timestamp)}}]),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

load_group_srv_info([], _MainSrvId, CrossGroup) ->
    ets:insert(cluster_dynamic_local_group, CrossGroup);
load_group_srv_info([SrvId | T], MainSrvId,
		    CrossGroup = #cluster_dynamic_local_group{list =
								  List}) ->
    cluster_lib:sync_connect_zone_node(SrvId),
    case cluster_lib:main_srv_id(SrvId) of
      {ok, MainSrvId} ->
	  List1 = lists:delete(MainSrvId, List),
	  load_group_srv_info(T, MainSrvId,
			      CrossGroup#cluster_dynamic_local_group{main =
									 MainSrvId,
								     list =
									 [MainSrvId
									  | List1]});
      {ok, SrvId1} ->
	  List1 = lists:delete(SrvId1, List),
	  load_group_srv_info(T, MainSrvId,
			      CrossGroup#cluster_dynamic_local_group{list =
									 List1
									   ++
									   [SrvId1]});
      _ -> load_group_srv_info(T, MainSrvId, CrossGroup)
    end.


