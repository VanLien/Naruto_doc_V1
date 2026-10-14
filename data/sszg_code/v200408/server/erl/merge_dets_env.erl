-file("src/merge/merge_dets_env.erl", 1).

-module(merge_dets_env).

-lager_records([{merge_role_name,
		 [key, role_id, name, lev, exp, power, data_source]},
		{merge_server,
		 [platform, zone_id, data_source, schema, target_schema,
		  realm, index, size]},
		{merge_table,
		 [name, table, dao, server, next_key, process, state,
		  new_srv_id, old_srv_id, columns, delete_expire]}]).

-export([do_init/1, do_convert/2, do_end/1]).

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

-file("src/merge/merge_dets_env.erl", 12).

-file("inc/merge.hrl", 1).

-record(merge_table,
	{name = <<>>, table = <<>>, dao, server, next_key = 0,
	 process = merge_main_proc, state, new_srv_id,
	 old_srv_id, columns = undefined,
	 delete_expire = undefined}).

-record(merge_server,
	{platform = "", zone_id = 1, data_source, schema,
	 target_schema, realm = 0, index = 0, size = 0}).

-record(merge_role_name,
	{key = "", role_id = {0, <<>>}, name = <<>>, lev = 0,
	 exp = 0, power = 0, data_source}).

-file("src/merge/merge_dets_env.erl", 13).

do_init(Table = #merge_table{server =
				 #merge_server{index = Size, size = Size}}) ->
    SrvList = merge_util:all_server(),
    List = [util:to_list(util:fbin(<<"~s_~w">>,
				   [Platform, ZoneId]))
	    || #merge_server{platform = Platform, zone_id = ZoneId}
		   <- SrvList],
    merge(List),
    {ok, [], Table};
do_init(Table) -> {ok, [], Table}.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

merge(L) ->
    dets:open_file(env_file,
		   [{file, "../dets/env.dets"}, {type, set}, {keypos, 1}]),
    dets:delete_all_objects(env_file),
    ets:new(env, [named_table, public, set, {keypos, 1}]),
    merge_other(L),
    dets:close(env_file),
    ok.

merge_other([]) -> ok;
merge_other([PlatformZone | T]) ->
    {ok, DetsFlag} = util:string_to_term("env_" ++
					   PlatformZone),
    dets:open_file(DetsFlag,
		   [{file, "../dets/" ++ PlatformZone ++ "/env.dets"},
		    {type, set}]),
    case dets:first(DetsFlag) of
      '$end_of_table' ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_dets_env46, _,
	     {__Levelmerge_dets_env46, __Tracesmerge_dets_env46}}
		when __Levelmerge_dets_env46 band 64 /= 0 orelse
		       __Tracesmerge_dets_env46 /= [] ->
		lager:do_log(info,
			     [{module, merge_dets_env}, {function, merge_other},
			      {line, 46}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~s 目录下没有需要合并的环境变量数据",
					   [PlatformZone]),
			     none, 4096, 64, __Levelmerge_dets_env46,
			     __Tracesmerge_dets_env46, lager_event,
			     __Pidmerge_dets_env46);
	    _ -> ok
	  end;
      _ ->
	  dets:traverse(DetsFlag,
			fun (Data = {_Key, _Val}) ->
				handle_compare(Data, PlatformZone), continue;
			    (_) -> continue
			end),
	  ok
    end,
    case ets:lookup(env, merge_index) of
      [] -> dets:insert(env_file, {merge_index, 1});
      [{_, Index}] ->
	  dets:insert(env_file, {merge_index, Index + 1});
      _ -> skip
    end,
    dets:close(DetsFlag),
    merge_other(T).

handle_compare(Data = {Key = combat_replay_max_id, Id1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, Id2}] ->
	  ets:insert(env, {Key, max(Id1, Id2)}),
	  dets:insert(env_file, {Key, max(Id1, Id2)});
      [] -> ets:insert(env, Data), dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = mail_sess_id, Id1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, Id2}] ->
	  ets:insert(env, {Key, max(Id1, Id2)}),
	  dets:insert(env_file, {Key, max(Id1, Id2)});
      [] -> ets:insert(env, Data), dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = merge_index, Id1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, Id2}] ->
	  ets:insert(env, {Key, max(Id1, Id2)}),
	  dets:insert(env_file, {Key, max(Id1, Id2)});
      [] -> ets:insert(env, Data), dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = role_max_rid, V1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, V2}] ->
	  ets:insert(env, {Key, max(V1, V2)}),
	  dets:insert(env_file, {Key, max(V1, V2)});
      [] -> ets:insert(env, Data), dets:insert(env_file, Data)
    end;
handle_compare(Data = {Key = room_bbs_mgr_next_id, V1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, V2}] ->
	  ets:insert(env, {Key, max(V1, V2)}),
	  dets:insert(env_file, {Key, max(V1, V2)});
      [] -> ets:insert(env, Data), dets:insert(env_file, Data)
    end;
handle_compare({Key = arena_cluster_info, Map1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, Map2}] ->
	  NewMap = Map2#{is_main => 1, server_type => merge},
	  ets:insert(env, {Key, NewMap}),
	  dets:insert(env_file, {Key, NewMap});
      [] ->
	  NewMap = Map1#{is_main => 1, server_type => merge},
	  ets:insert(env, {Key, NewMap}),
	  dets:insert(env_file, {Key, NewMap})
    end;
handle_compare({Key = arena_elite_open_state, V1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, V2}] -> ok;
      [] ->
	  ets:insert(env, {Key, V1}),
	  dets:insert(env_file, {Key, V1})
    end;
handle_compare(Data = {Key = arena_team_next_id, V1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, V2}] ->
	  ets:insert(env, {Key, max(V1, V2)}),
	  dets:insert(env_file, {Key, max(V1, V2)});
      [] -> ets:insert(env, Data), dets:insert(env_file, Data)
    end;
handle_compare({Key = arena_team_old_rank, V1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, V2}] -> ok;
      [] ->
	  ets:insert(env, {Key, V1}),
	  dets:insert(env_file, {Key, V1})
    end;
handle_compare({Key = arena_team_state,
		V1 = {Period1, _Ts1, _Timeout1, _StateName1}},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, V2 = {Period2, _Ts2, _Timeout2, _StateName2}}] ->
	  NewV = util:if_true(Period1 > Period2, V1, V2),
	  ets:insert(env, {Key, NewV}),
	  dets:insert(env_file, {Key, NewV});
      [] ->
	  ets:insert(env, {Key, V1}),
	  dets:insert(env_file, {Key, V1})
    end;
handle_compare({Key =
		    monopoly_dungeons_guild_rank_camp_id,
		V1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, V2}] -> ok;
      [] ->
	  ets:insert(env, {Key, V1}),
	  dets:insert(env_file, {Key, V1})
    end;
handle_compare({Key = sync_weekly_report_time, V1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, V2}] -> ok;
      [] ->
	  ets:insert(env, {Key, V1}),
	  dets:insert(env_file, {Key, V1})
    end;
handle_compare({Key = clear_weekly_data_time, V1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, V2}] -> ok;
      [] ->
	  ets:insert(env, {Key, V1}),
	  dets:insert(env_file, {Key, V1})
    end;
handle_compare({Key = role_weekly_award_info, V1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, V2}] ->
	  ets:insert(env, {Key, V1 ++ V2}),
	  dets:insert(env_file, {Key, V1 ++ V2});
      [] ->
	  ets:insert(env, {Key, V1}),
	  dets:insert(env_file, {Key, V1})
    end;
handle_compare({Key = weekly_this_week_time, V1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, V2}] -> ok;
      [] ->
	  ets:insert(env, {Key, V1}),
	  dets:insert(env_file, {Key, V1})
    end;
handle_compare({Key = weekly_last_week_time, V1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, V2}] -> ok;
      [] ->
	  ets:insert(env, {Key, V1}),
	  dets:insert(env_file, {Key, V1})
    end;
handle_compare({Key = return_red_packet_id, V1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, V2}] ->
	  ets:insert(env, {Key, max(V1, V2)}),
	  dets:insert(env_file, {Key, max(V1, V2)});
      [] ->
	  ets:insert(env, {Key, V1}),
	  dets:insert(env_file, {Key, V1})
    end;
handle_compare({Key = return_red_packet_broadcast, V1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, V2}] ->
	  ets:insert(env, {Key, V1 ++ V2}),
	  dets:insert(env_file, {Key, V1 ++ V2});
      [] ->
	  ets:insert(env, {Key, V1}),
	  dets:insert(env_file, {Key, V1})
    end;
handle_compare({Key = return_role_list, V1},
	       _PlatformZone) ->
    case ets:lookup(env, Key) of
      [{Key, V2}] ->
	  ets:insert(env, {Key, V1 ++ V2}),
	  dets:insert(env_file, {Key, V1 ++ V2});
      [] ->
	  ets:insert(env, {Key, V1}),
	  dets:insert(env_file, {Key, V1})
    end;
handle_compare(_, _) -> ok.


