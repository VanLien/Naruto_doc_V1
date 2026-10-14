-file("src/merge/merge_dao_mergeall_accid.erl", 1).

-module(merge_dao_mergeall_accid).

-lager_records([{merge_role_name,
		 [key, role_id, name, lev, exp, power, data_source]},
		{merge_server,
		 [platform, zone_id, data_source, schema, target_schema,
		  realm, index, size]},
		{merge_table,
		 [name, table, dao, server, next_key, process, state,
		  new_srv_id, old_srv_id, columns, delete_expire]}]).

-export([do_init/1, do_convert/2, do_end/1,
	 delete_expire/1]).

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

-file("src/merge/merge_dao_mergeall_accid.erl", 18).

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

-file("src/merge/merge_dao_mergeall_accid.erl", 19).

do_init(Table = #merge_table{server =
				 #merge_server{index = 1}}) ->
    merge_util:batch_insert_offset(Table, undefined);
do_init(Table = #merge_table{table = TableName,
			     server =
				 #merge_server{schema = Schema,
					       target_schema =
						   TargetSchema}}) ->
    {ok, MaxId} = merge_db:get_one(merge_target,
				   list_to_binary(io_lib:format("select IFNULL(MAX(id), 0) from ~s",
								[TableName]))),
    {ok, AllColumns} = merge_db:get_columns(merge_target,
					    TableName),
    Cloumns = "`" ++
		string:join(AllColumns -- ["id"], "`,`") ++ "`",
    Sql =
	util:fbin(<<"replace into ~s.~s(id,~s) select id+~w "
		    "id,~s from ~s.~s">>,
		  [TargetSchema, TableName, Cloumns, MaxId, Cloumns,
		   Schema, TableName]),
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
	    {__Pidmerge_dao_mergeall_accid29, _,
	     {__Levelmerge_dao_mergeall_accid29,
	      __Tracesmerge_dao_mergeall_accid29}}
		when __Levelmerge_dao_mergeall_accid29 band 64 /= 0
		       orelse __Tracesmerge_dao_mergeall_accid29 /= [] ->
		lager:do_log(info,
			     [{module, merge_dao_mergeall_accid},
			      {function, do_init}, {line, 29},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("搬移数据表[~s][~s]数量:~w",
					   [Schema, TableName, Num]),
			     none, 4096, 64, __Levelmerge_dao_mergeall_accid29,
			     __Tracesmerge_dao_mergeall_accid29, lager_event,
			     __Pidmerge_dao_mergeall_accid29);
	    _ -> ok
	  end,
	  {ok, [], Table};
      {error, Reason} -> {error, Reason}
    end.

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

delete_expire(Table) ->
    merge_util:delete_expire(Table, undefined).


