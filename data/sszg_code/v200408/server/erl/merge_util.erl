-file("src/merge/merge_util.erl", 1).

-module(merge_util).

-lager_records([{merge_role_name,
		 [key, role_id, name, lev, exp, power, data_source]},
		{merge_server,
		 [platform, zone_id, data_source, schema, target_schema,
		  realm, index, size]},
		{merge_table,
		 [name, table, dao, server, next_key, process, state,
		  new_srv_id, old_srv_id, columns, delete_expire]}]).

-export([dbsrc/2, all_server/0, batch_insert_offset/2,
	 batch_insert_offset/3, batch_replace_offset/2,
	 batch_replace_offset/3, delete_expire/2,
	 dao_exec_each_row/3, dets_merge/5, dets_merge_first/5,
	 get_merge_type/0]).

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

-file("src/merge/merge_util.erl", 25).

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

-file("src/merge/merge_util.erl", 26).

get_merge_type() ->
    case application:get_env(merge_type) of
      {ok, center} -> center;
      _ -> zone
    end.

dbsrc(Platform, ZoneId) ->
    {ok, DataSource} = util:string_to_term("data_source_" ++
					     util:to_list(Platform) ++
					       util:to_list(ZoneId)),
    DataSource.

all_server() ->
    {ok, SrcList} = application:get_env(merge_src_list),
    {ok,
     [_DbHost, _DbPort, _DbUser, _DbPass, DbName, _DbEncode,
      _DbConnMinNum, _DbConnMaxNum]} =
	application:get_env(merge_target),
    Size = length(SrcList),
    all_server(SrcList, Size, 1, DbName).

all_server([], _, _, _) -> [];
all_server([{Platform, ZoneId, _DbHost, _DbPort,
	     _DbUser, _DbPass, DbName, _DbEncode, _DbConnMinNum,
	     _DbConnMaxNum, Realm}
	    | T],
	   Size, Index, TargetSchema) ->
    [#merge_server{platform = Platform, zone_id = ZoneId,
		   data_source = dbsrc(Platform, ZoneId),
		   schema = list_to_bitstring(DbName), realm = Realm,
		   size = Size, index = Index,
		   target_schema = TargetSchema}
     | all_server(T, Size, Index + 1, TargetSchema)].

batch_insert_offset(Table = #merge_table{table =
					     TableName,
					 server =
					     #merge_server{schema = Schema,
							   target_schema =
							       TargetSchema}},
		    undefined) ->
    Sql =
	util:fbin(<<"insert into ~s.~s select * from ~s.~s">>,
		  [TargetSchema, TableName, Schema, TableName]),
    case merge_db:exec(merge_target, Sql, []) of
      {ok, Num} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_util52, _,
	     {__Levelmerge_util52, __Tracesmerge_util52}}
		when __Levelmerge_util52 band 64 /= 0 orelse
		       __Tracesmerge_util52 /= [] ->
		lager:do_log(info,
			     [{module, merge_util},
			      {function, batch_insert_offset}, {line, 52},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("搬移数据表[~s][~s]数量:~w",
					   [Schema, TableName, Num]),
			     none, 4096, 64, __Levelmerge_util52,
			     __Tracesmerge_util52, lager_event,
			     __Pidmerge_util52);
	    _ -> ok
	  end,
	  {ok, [], Table};
      {error, Reason} -> {error, Reason}
    end;
batch_insert_offset(Table = #merge_table{table =
					     TableName,
					 server =
					     #merge_server{schema = Schema,
							   target_schema =
							       TargetSchema}},
		    Cloumns) ->
    Sql =
	util:fbin(<<"insert into ~s.~s(~s) select ~s from "
		    "~s.~s">>,
		  [TargetSchema, TableName, Cloumns, Cloumns, Schema,
		   TableName]),
    case merge_db:exec(merge_target, Sql, []) of
      {ok, Num} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_util61, _,
	     {__Levelmerge_util61, __Tracesmerge_util61}}
		when __Levelmerge_util61 band 64 /= 0 orelse
		       __Tracesmerge_util61 /= [] ->
		lager:do_log(info,
			     [{module, merge_util},
			      {function, batch_insert_offset}, {line, 61},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("搬移数据表[~s][~s]数量:~w",
					   [Schema, TableName, Num]),
			     none, 4096, 64, __Levelmerge_util61,
			     __Tracesmerge_util61, lager_event,
			     __Pidmerge_util61);
	    _ -> ok
	  end,
	  {ok, [], Table};
      {error, Reason} -> {error, Reason}
    end.

batch_insert_offset(Table = #merge_table{table =
					     TableName,
					 server =
					     #merge_server{schema = Schema,
							   target_schema =
							       TargetSchema}},
		    Cloumns, Where) ->
    Sql =
	util:fbin(<<"insert into ~s.~s(~s) select ~s from "
		    "~s.~s ~s">>,
		  [TargetSchema, TableName, Cloumns, Cloumns, Schema,
		   TableName, Where]),
    case merge_db:exec(merge_target, Sql, []) of
      {ok, Num} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_util70, _,
	     {__Levelmerge_util70, __Tracesmerge_util70}}
		when __Levelmerge_util70 band 64 /= 0 orelse
		       __Tracesmerge_util70 /= [] ->
		lager:do_log(info,
			     [{module, merge_util},
			      {function, batch_insert_offset}, {line, 70},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("搬移数据表[~s][~s]数量:~w",
					   [Schema, TableName, Num]),
			     none, 4096, 64, __Levelmerge_util70,
			     __Tracesmerge_util70, lager_event,
			     __Pidmerge_util70);
	    _ -> ok
	  end,
	  {ok, [], Table};
      {error, Reason} -> {error, Reason}
    end.

batch_replace_offset(Table = #merge_table{table =
					      TableName,
					  server =
					      #merge_server{schema = Schema,
							    target_schema =
								TargetSchema}},
		     undefined) ->
    Sql =
	util:fbin(<<"replace into ~s.~s select * from ~s.~s">>,
		  [TargetSchema, TableName, Schema, TableName]),
    case merge_db:exec(merge_target, Sql, []) of
      {ok, Num} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_util79, _,
	     {__Levelmerge_util79, __Tracesmerge_util79}}
		when __Levelmerge_util79 band 64 /= 0 orelse
		       __Tracesmerge_util79 /= [] ->
		lager:do_log(info,
			     [{module, merge_util},
			      {function, batch_replace_offset}, {line, 79},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("搬移数据表[~s][~s]数量:~w",
					   [Schema, TableName, Num]),
			     none, 4096, 64, __Levelmerge_util79,
			     __Tracesmerge_util79, lager_event,
			     __Pidmerge_util79);
	    _ -> ok
	  end,
	  {ok, [], Table};
      {error, Reason} -> {error, Reason}
    end;
batch_replace_offset(Table = #merge_table{table =
					      TableName,
					  server =
					      #merge_server{schema = Schema,
							    target_schema =
								TargetSchema}},
		     Cloumns) ->
    Sql =
	util:fbin(<<"replace into ~s.~s(~s) select ~s from "
		    "~s.~s">>,
		  [TargetSchema, TableName, Cloumns, Cloumns, Schema,
		   TableName]),
    case merge_db:exec(merge_target, Sql, []) of
      {ok, Num} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_util88, _,
	     {__Levelmerge_util88, __Tracesmerge_util88}}
		when __Levelmerge_util88 band 64 /= 0 orelse
		       __Tracesmerge_util88 /= [] ->
		lager:do_log(info,
			     [{module, merge_util},
			      {function, batch_replace_offset}, {line, 88},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("搬移数据表[~s][~s]数量:~w",
					   [Schema, TableName, Num]),
			     none, 4096, 64, __Levelmerge_util88,
			     __Tracesmerge_util88, lager_event,
			     __Pidmerge_util88);
	    _ -> ok
	  end,
	  {ok, [], Table};
      {error, Reason} -> {error, Reason}
    end.

batch_replace_offset(Table = #merge_table{table =
					      TableName,
					  server =
					      #merge_server{schema = Schema,
							    target_schema =
								TargetSchema}},
		     Cloumns, Where) ->
    Sql =
	util:fbin(<<"replace into ~s.~s(~s) select ~s from "
		    "~s.~s ~s">>,
		  [TargetSchema, TableName, Cloumns, Cloumns, Schema,
		   TableName, Where]),
    case merge_db:exec(merge_target, Sql, []) of
      {ok, Num} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_util97, _,
	     {__Levelmerge_util97, __Tracesmerge_util97}}
		when __Levelmerge_util97 band 64 /= 0 orelse
		       __Tracesmerge_util97 /= [] ->
		lager:do_log(info,
			     [{module, merge_util},
			      {function, batch_replace_offset}, {line, 97},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("搬移数据表[~s][~s]数量:~w",
					   [Schema, TableName, Num]),
			     none, 4096, 64, __Levelmerge_util97,
			     __Tracesmerge_util97, lager_event,
			     __Pidmerge_util97);
	    _ -> ok
	  end,
	  {ok, [], Table};
      {error, Reason} -> {error, Reason}
    end.

dao_exec_each_row(Table = #merge_table{table =
					   TableName},
		  undefined, MFA) ->
    dao_exec_each_row(Table,
		      util:fbin(<<"select * from ~s">>, [TableName]), MFA);
dao_exec_each_row(Table = #merge_table{server =
					   #merge_server{data_source =
							     DataSource}},
		  Sql, MFA) ->
    case merge_db:get_all4page(DataSource, Sql, [], 3000) of
      {ok, Data} -> do_dao_exec_each_row(Data, Table, MFA);
      {error, Reason} -> {error, Reason}
    end.

do_dao_exec_each_row([], Table, _MFA) ->
    {ok, [], Table};
do_dao_exec_each_row([Row | T], Table, MFA) ->
    case MFA of
      {Fun} -> ok = Fun(Table, Row);
      {Mod, Fun} -> ok = Mod:Fun(Table, Row)
    end,
    do_dao_exec_each_row(T, Table, MFA).

delete_expire(_Table = #merge_table{table = TableName,
				    delete_expire = role},
	      _Cloumns) ->
    Sql =
	util:fbin(<<"delete from ~s where (rid, srv_id) not "
		    "in (select rid, srv_id from role_ext)">>,
		  [TableName]),
    case merge_db:exec(merge_target, Sql, []) of
      {ok, Num} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_util124, _,
	     {__Levelmerge_util124, __Tracesmerge_util124}}
		when __Levelmerge_util124 band 64 /= 0 orelse
		       __Tracesmerge_util124 /= [] ->
		lager:do_log(info,
			     [{module, merge_util}, {function, delete_expire},
			      {line, 124}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("删除数据表[~s]数量:~w", [TableName, Num]),
			     none, 4096, 64, __Levelmerge_util124,
			     __Tracesmerge_util124, lager_event,
			     __Pidmerge_util124);
	    _ -> ok
	  end,
	  ok;
      {error, Reason} -> {error, Reason}
    end;
delete_expire(role, undefined) ->
    Time = date:unixtime(zero) - 86400 * 20,
    Sql =
	util:fbin(<<"delete from role_ext where (rid, srv_id) "
		    "in (select rid, srv_id from role where "
		    "vip_lev < 1 and lev < 15 and gold_acc "
		    "= 0 and login_time < ~w)">>,
		  [Time]),
    case merge_db:exec(merge_target, Sql, []) of
      {ok, Num} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_util134, _,
	     {__Levelmerge_util134, __Tracesmerge_util134}}
		when __Levelmerge_util134 band 64 /= 0 orelse
		       __Tracesmerge_util134 /= [] ->
		lager:do_log(info,
			     [{module, merge_util}, {function, delete_expire},
			      {line, 134}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("删除数据表[role]数量:~w", [Num]), none,
			     4096, 64, __Levelmerge_util134,
			     __Tracesmerge_util134, lager_event,
			     __Pidmerge_util134);
	    _ -> ok
	  end,
	  ok;
      {error, Reason} -> {error, Reason}
    end;
delete_expire(#merge_table{delete_expire = Expire},
	      _) ->
    {error, Expire}.

dets_merge(DetsName, DetsFileName, DetsType, DetsKeyPos,
	   ConvertFun) ->
    SrvList = merge_util:all_server(),
    do_dets_merge(DetsName, DetsFileName, DetsType,
		  DetsKeyPos, ConvertFun, SrvList).

dets_merge_first(DetsName, DetsFileName, DetsType,
		 DetsKeyPos, ConvertFun) ->
    [Srv | _] = merge_util:all_server(),
    do_dets_merge(DetsName, DetsFileName, DetsType,
		  DetsKeyPos, ConvertFun, [Srv]).

do_dets_merge(DetsName, DetsFileName, DetsType,
	      DetsKeyPos, ConvertFun0,
	      [Server = #merge_server{platform = Platform,
				      zone_id = ZoneId}
	       | T]) ->
    First = util:to_list(util:fbin(<<"~ts_~w">>,
				   [Platform, ZoneId])),
    dets:open_file(DetsName,
		   [{file, "../dets/" ++ DetsFileName}, {type, DetsType},
		    {keypos, DetsKeyPos}]),
    ets:new(DetsName,
	    [DetsType, named_table, public, {keypos, DetsKeyPos}]),
    dets:delete_all_objects(DetsName),
    ets:delete_all_objects(DetsName),
    DetsStrName = util:term_to_string(DetsName),
    {ok, DetsFstName} = util:string_to_term(DetsStrName ++
					      "_first"),
    dets:open_file(DetsFstName,
		   [{file, "../dets/" ++ First ++ "/" ++ DetsFileName},
		    {type, DetsType}, {keypos, DetsKeyPos}]),
    {InitFun, ConvertFun, EndFun} =
	handle_convert_fun(ConvertFun0),
    handle_fun(InitFun),
    Return = case dets:first(DetsFstName) of
	       '$end_of_table' ->
		   case {whereis(lager_event), whereis(lager_event),
			 lager_config:get({lager_event, loglevel}, {0, []})}
		       of
		     {undefined, undefined, _} ->
			 fun () -> {error, lager_not_running} end();
		     {undefined, _, _} ->
			 fun () -> {error, {sink_not_configured, lager_event}}
			 end();
		     {__Pidmerge_util166, _,
		      {__Levelmerge_util166, __Tracesmerge_util166}}
			 when __Levelmerge_util166 band 64 /= 0 orelse
				__Tracesmerge_util166 /= [] ->
			 lager:do_log(info,
				      [{module, merge_util},
				       {function, do_dets_merge}, {line, 166},
				       {pid, pid_to_list(self())},
				       {node, node()}
				       | lager:md()],
				      io_lib:format("~s 目录下没有需要合并的数据 [~w]",
						    [First, DetsName]),
				      none, 4096, 64, __Levelmerge_util166,
				      __Tracesmerge_util166, lager_event,
				      __Pidmerge_util166);
		     _ -> ok
		   end,
		   [];
	       _ ->
		   dets:traverse(DetsFstName,
				 traverse_fun(ConvertFun, Server, DetsName))
	     end,
    case Return of
      [] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_util173, _,
	     {__Levelmerge_util173, __Tracesmerge_util173}}
		when __Levelmerge_util173 band 64 /= 0 orelse
		       __Tracesmerge_util173 /= [] ->
		lager:do_log(info,
			     [{module, merge_util}, {function, do_dets_merge},
			      {line, 173}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("合并[~w]结果，数据量:~w",
					   [DetsFstName,
					    dets:info(DetsFstName, size)]),
			     none, 4096, 64, __Levelmerge_util173,
			     __Tracesmerge_util173, lager_event,
			     __Pidmerge_util173);
	    _ -> ok
	  end,
	  Back = do_dets_merge_other(T, DetsName, DetsStrName,
				     DetsFileName, DetsType, DetsKeyPos,
				     ConvertFun),
	  handle_fun(EndFun),
	  ets:delete(DetsName),
	  dets:close(DetsName),
	  dets:close(DetsFstName),
	  Back;
      _ -> throw({error, util:fbin(<<"合并~w失败">>, [DetsName])})
    end.

do_dets_merge_other([], _, _, _, _, _, _) -> ok;
do_dets_merge_other([Server = #merge_server{platform =
						Platform,
					    zone_id = ZoneId}
		     | T],
		    DetsName, DetsStrName, DetsFileName, DetsType,
		    DetsKeyPos, ConvertFun) ->
    PlatformZone = util:to_list(util:fbin(<<"~ts_~w">>,
					  [Platform, ZoneId])),
    {ok, DetsFlag} = util:string_to_term(DetsStrName ++
					   PlatformZone),
    dets:open_file(DetsFlag,
		   [{file,
		     "../dets/" ++ PlatformZone ++ "/" ++ DetsFileName},
		    {type, DetsType}, {keypos, DetsKeyPos}]),
    Return = case dets:first(DetsFlag) of
	       '$end_of_table' ->
		   case {whereis(lager_event), whereis(lager_event),
			 lager_config:get({lager_event, loglevel}, {0, []})}
		       of
		     {undefined, undefined, _} ->
			 fun () -> {error, lager_not_running} end();
		     {undefined, _, _} ->
			 fun () -> {error, {sink_not_configured, lager_event}}
			 end();
		     {__Pidmerge_util191, _,
		      {__Levelmerge_util191, __Tracesmerge_util191}}
			 when __Levelmerge_util191 band 64 /= 0 orelse
				__Tracesmerge_util191 /= [] ->
			 lager:do_log(info,
				      [{module, merge_util},
				       {function, do_dets_merge_other},
				       {line, 191}, {pid, pid_to_list(self())},
				       {node, node()}
				       | lager:md()],
				      io_lib:format("~s 目录下没有需要合并的数据 [~w]",
						    [PlatformZone, DetsName]),
				      none, 4096, 64, __Levelmerge_util191,
				      __Tracesmerge_util191, lager_event,
				      __Pidmerge_util191);
		     _ -> ok
		   end,
		   [];
	       _ ->
		   dets:traverse(DetsFlag,
				 traverse_fun(ConvertFun, Server, DetsName))
	     end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_util196, _,
       {__Levelmerge_util196, __Tracesmerge_util196}}
	  when __Levelmerge_util196 band 64 /= 0 orelse
		 __Tracesmerge_util196 /= [] ->
	  lager:do_log(info,
		       [{module, merge_util}, {function, do_dets_merge_other},
			{line, 196}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("合并[~w]结果，数据量:~w",
				     [DetsName, dets:info(DetsFlag, size)]),
		       none, 4096, 64, __Levelmerge_util196,
		       __Tracesmerge_util196, lager_event, __Pidmerge_util196);
      _ -> ok
    end,
    dets:close(DetsFlag),
    case Return of
      [] ->
	  do_dets_merge_other(T, DetsName, DetsStrName,
			      DetsFileName, DetsType, DetsKeyPos, ConvertFun);
      _ ->
	  throw({error, PlatformZone,
		 util:fbin(<<"合并~w失败">>, [DetsName])})
    end.

traverse_fun(ConvertFun, Server, DetsName) ->
    fun (Data) ->
	    case is_function(ConvertFun) of
	      true ->
		  case convert_fun(ConvertFun, Data, Server,
				   #{dets_name => DetsName})
		      of
		    {ok, NewData} ->
			ets:insert(DetsName, NewData),
			dets:insert(DetsName, NewData),
			continue;
		    continue -> continue;
		    _Err ->
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
			  {__Pidmerge_util219, _,
			   {__Levelmerge_util219, __Tracesmerge_util219}}
			      when __Levelmerge_util219 band 8 /= 0 orelse
				     __Tracesmerge_util219 /= [] ->
			      lager:do_log(error,
					   [{module, merge_util},
					    {function, traverse_fun},
					    {line, 219},
					    {pid, pid_to_list(self())},
					    {node, node()}
					    | lager:md()],
					   io_lib:format("合并~w时失败:~w",
							 [DetsName, _Err]),
					   none, 4096, 8, __Levelmerge_util219,
					   __Tracesmerge_util219, lager_event,
					   __Pidmerge_util219);
			  _ -> ok
			end,
			{done, false}
		  end;
	      false ->
		  ets:insert(DetsName, Data),
		  dets:insert(DetsName, Data),
		  continue
	    end
    end.

handle_convert_fun(undefined) ->
    {undefined, undefined, undefined};
handle_convert_fun(Convert) when is_function(Convert) ->
    {undefined, Convert, undefined};
handle_convert_fun({InitFun, ConvertFun, EndFun}) ->
    {InitFun, ConvertFun, EndFun}.

convert_fun(Fun, Data, MergeServer, Opts) ->
    case erlang:is_function(Fun, 1) of
      true -> handle_fun({Fun, [Data]});
      false -> handle_fun({Fun, [Data, MergeServer, Opts]})
    end.

handle_fun(undefined) ->
    handle_fun_rtn(skip, undefined);
handle_fun(Fun) when is_function(Fun) ->
    handle_fun_rtn(catch Fun(), Fun);
handle_fun(Fun = {F, A})
    when is_function(F) andalso is_list(A) ->
    case catch erlang:is_function(F, length(A)) of
      true -> handle_fun_rtn(catch erlang:apply(F, A), Fun);
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_util256, _,
	     {__Levelmerge_util256, __Tracesmerge_util256}}
		when __Levelmerge_util256 band 8 /= 0 orelse
		       __Tracesmerge_util256 /= [] ->
		lager:do_log(error,
			     [{module, merge_util}, {function, handle_fun},
			      {line, 256}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("未知的函数调用:~w, Err:~w", [Fun, Err]),
			     none, 4096, 8, __Levelmerge_util256,
			     __Tracesmerge_util256, lager_event,
			     __Pidmerge_util256);
	    _ -> ok
	  end,
	  {false, "未知的函数调用"}
    end;
handle_fun(Fun = {Mod, F, A}) when is_list(A) ->
    case catch erlang:function_exported(Mod, F, length(A))
	of
      true ->
	  handle_fun_rtn(catch erlang:apply(Mod, F, A), Fun);
      Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_util264, _,
	     {__Levelmerge_util264, __Tracesmerge_util264}}
		when __Levelmerge_util264 band 8 /= 0 orelse
		       __Tracesmerge_util264 /= [] ->
		lager:do_log(error,
			     [{module, merge_util}, {function, handle_fun},
			      {line, 264}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("未知的函数调用:~w, Err:~w", [Fun, Err]),
			     none, 4096, 8, __Levelmerge_util264,
			     __Tracesmerge_util264, lager_event,
			     __Pidmerge_util264);
	    _ -> ok
	  end,
	  {false, "未知的函数调用"}
    end;
handle_fun(Unknow) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_util268, _,
       {__Levelmerge_util268, __Tracesmerge_util268}}
	  when __Levelmerge_util268 band 8 /= 0 orelse
		 __Tracesmerge_util268 /= [] ->
	  lager:do_log(error,
		       [{module, merge_util}, {function, handle_fun},
			{line, 268}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的函数调用:~w", [Unknow]), none, 4096, 8,
		       __Levelmerge_util268, __Tracesmerge_util268,
		       lager_event, __Pidmerge_util268);
      _ -> ok
    end,
    {false, "未知的函数调用"}.

handle_fun_rtn(skip, _Fun) -> continue;
handle_fun_rtn(continue, _Fun) -> continue;
handle_fun_rtn({ok, Rtn}, _Fun) -> {ok, Rtn};
handle_fun_rtn(Unknow, Fun) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_util278, _,
       {__Levelmerge_util278, __Tracesmerge_util278}}
	  when __Levelmerge_util278 band 8 /= 0 orelse
		 __Tracesmerge_util278 /= [] ->
	  lager:do_log(error,
		       [{module, merge_util}, {function, handle_fun_rtn},
			{line, 278}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("执行~w时得到错误的返回:~w", [Fun, Unknow]), none,
		       4096, 8, __Levelmerge_util278, __Tracesmerge_util278,
		       lager_event, __Pidmerge_util278);
      _ -> ok
    end,
    {false, "错误的返回"}.


