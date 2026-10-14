-file("src/merge/merge_db.erl", 1).

-module(merge_db).

-lager_records([{result_packet,
		 [seq_num, field_list, rows, extra]},
		{eof_packet, [seq_num, status, warning_count]},
		{error_packet, [seq_num, code, status, msg]},
		{ok_packet,
		 [seq_num, affected_rows, insert_id, status,
		  warning_count, msg]},
		{packet, [size, seq_num, data]},
		{field,
		 [seq_num, catalog, db, table, org_table, name, org_name,
		  type, default, charset_nr, length, flags, decimals]},
		{greeting,
		 [protocol_version, server_version, thread_id, salt1,
		  salt2, caps, caps_high, language, status, seq_num,
		  plugin]},
		{emysql_connection,
		 [id, pool_id, encoding, socket, version, thread_id,
		  caps, language, prepared, locked_at, alive]},
		{pool,
		 [pool_id, user, password, host, port, database,
		  encoding, available, locked, waiting, max_conn_num,
		  min_conn_num, keep_min_conn_num]},
		{merge_role_name,
		 [key, role_id, name, lev, exp, power, data_source]},
		{merge_server,
		 [platform, zone_id, data_source, schema, target_schema,
		  realm, index, size]},
		{merge_table,
		 [name, table, dao, server, next_key, process, state,
		  new_srv_id, old_srv_id, columns, delete_expire]}]).

-export([init/0, exec/2, exec/3, select_limit/4,
	 select_limit/5, get_one/2, get_one/3, get_row/2,
	 get_row/3, get_all/2, get_all/3, get_all4page/4,
	 format_sql/2, insert_vals_sql/1, get_columns/2,
	 print_sql/1]).

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

-file("src/merge/merge_db.erl", 35).

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

-file("src/merge/merge_db.erl", 36).

-file("inc/emysql.hrl", 1).

-record(pool,
	{pool_id, user, password, host, port, database,
	 encoding, available = queue:new(),
	 locked = gb_trees:empty(), waiting = queue:new(),
	 max_conn_num = 0, min_conn_num = 0,
	 keep_min_conn_num = 0}).

-record(emysql_connection,
	{id, pool_id, encoding, socket, version, thread_id,
	 caps, language, prepared = gb_trees:empty(), locked_at,
	 alive = true}).

-record(greeting,
	{protocol_version, server_version, thread_id, salt1,
	 salt2, caps, caps_high, language, status, seq_num,
	 plugin}).

-record(field,
	{seq_num, catalog, db, table, org_table, name, org_name,
	 type, default, charset_nr, length, flags, decimals}).

-record(packet, {size, seq_num, data}).

-record(ok_packet,
	{seq_num, affected_rows, insert_id, status,
	 warning_count, msg}).

-record(error_packet, {seq_num, code, status, msg}).

-record(eof_packet, {seq_num, status, warning_count}).

-record(result_packet,
	{seq_num, field_list, rows, extra}).

-file("src/merge/merge_db.erl", 37).

init() ->
    {ok,
     [DbHost, DbPort, DbUser, DbPass, DbName, DbEncode,
      DbConnNumMin, DbConnNumMax]} =
	application:get_env(merge_target),
    emysql:add_pool(merge_target, DbConnNumMin,
		    DbConnNumMax, DbUser, DbPass, DbHost, DbPort, DbName,
		    DbEncode),
    {ok, SrvList} = application:get_env(merge_src_list),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_db46, _,
       {__Levelmerge_db46, __Tracesmerge_db46}}
	  when __Levelmerge_db46 band 128 /= 0 orelse
		 __Tracesmerge_db46 /= [] ->
	  lager:do_log(debug,
		       [{module, merge_db}, {function, init}, {line, 46},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "加载merge_target数据库连接", none, 4096, 128,
		       __Levelmerge_db46, __Tracesmerge_db46, lager_event,
		       __Pidmerge_db46);
      _ -> ok
    end,
    lists:foreach(fun ({Platform, ZoneId, DbHost1, DbPort1,
			DbUser1, DbPass1, DbName1, DbEncode1, DbConnNumMin1,
			DbConnNumMax1, _}) ->
			  DataSource = merge_util:dbsrc(Platform, ZoneId),
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
			    {__Pidmerge_db53, _,
			     {__Levelmerge_db53, __Tracesmerge_db53}}
				when __Levelmerge_db53 band 128 /= 0 orelse
				       __Tracesmerge_db53 /= [] ->
				lager:do_log(debug,
					     [{module, merge_db},
					      {function, init}, {line, 53},
					      {pid, pid_to_list(self())},
					      {node, node()}
					      | lager:md()],
					     io_lib:format("加载~w数据库连接",
							   [DataSource]),
					     none, 4096, 128, __Levelmerge_db53,
					     __Tracesmerge_db53, lager_event,
					     __Pidmerge_db53);
			    _ -> ok
			  end,
			  emysql:add_pool(DataSource, DbConnNumMin1,
					  DbConnNumMax1, DbUser1, DbPass1,
					  DbHost1, DbPort1, DbName1, DbEncode1)
		  end,
		  SrvList),
    ok.

exec(DataSource, Sql) -> exec(DataSource, Sql, []).

exec(DataSource, Sql, Args) ->
    Query = format_sql(Sql, Args),
    print_sql(Query),
    case catch emysql:execute(DataSource, Sql, Args,
			      86400000)
	of
      #ok_packet{affected_rows = Rows} -> {ok, Rows};
      #error_packet{msg = Msg} -> {error, Msg};
      Err -> {error, Err}
    end.

select_limit(DataSource, Sql, Offset, Num) ->
    select_limit(DataSource, Sql, [], Offset, Num).

select_limit(DataSource, Sql, Args, Offset, Num) ->
    S = list_to_binary([Sql, " limit ",
			integer_to_list(Offset), ", ", integer_to_list(Num)]),
    Query = format_sql(S, Args),
    print_sql(Query),
    case catch emysql:execute(DataSource, S, Args, 86400000)
	of
      #result_packet{rows = Rows} -> {ok, Rows};
      #error_packet{msg = Msg} -> {error, Msg};
      Err -> {error, Err}
    end.

get_one(DataSource, Sql) ->
    get_one(DataSource, Sql, []).

get_one(DataSource, Sql, Args) ->
    Query = format_sql(Sql, Args),
    print_sql(Query),
    case catch emysql:execute(DataSource, Sql, Args,
			      86400000)
	of
      #result_packet{rows = []} -> {ok, undefined};
      #result_packet{rows = [[R]]} -> {ok, R};
      #error_packet{msg = Msg} -> {error, Msg};
      Err -> {error, Err}
    end.

get_row(DataSource, Sql) ->
    get_row(DataSource, Sql, []).

get_row(DataSource, Sql, Args) ->
    Query = format_sql(Sql, Args),
    print_sql(Query),
    case catch emysql:execute(DataSource, Sql, Args,
			      86400000)
	of
      #result_packet{rows = [R]} -> {ok, R};
      #result_packet{rows = []} -> {ok, undefined};
      #error_packet{msg = Msg} -> {error, Msg};
      Err -> {error, Err}
    end.

get_all(DataSource, Sql) ->
    get_all(DataSource, Sql, []).

get_all(DataSource, Sql, Args) ->
    Query = format_sql(Sql, Args),
    print_sql(Query),
    case catch emysql:execute(DataSource, Sql, Args,
			      86400000)
	of
      #result_packet{rows = R} -> {ok, R};
      #error_packet{msg = Msg} -> {error, Msg};
      Err -> {error, Err}
    end.

get_columns(DataSource, TableName) ->
    Sql = lists:concat(["select * from ",
			binary_to_list(TableName), " where 1=2"]),
    case catch emysql:execute(DataSource, Sql, [], 86400000)
	of
      #result_packet{field_list = L} ->
	  {ok,
	   [binary_to_list(Name) || #field{name = Name} <- L]};
      #error_packet{msg = Msg} -> {error, Msg};
      Err -> {error, Err}
    end.

-spec insert_vals_sql(Fields :: list()) -> string().

insert_vals_sql(Fields) ->
    Sql = lists:concat(["(",
			string:join(lists:duplicate(length(Fields), "~s"), ","),
			")"]),
    binary_to_list(format_sql(Sql, Fields)).

get_all4page(DataSource, Sql, Args, PageSize) ->
    NewSql = list_to_binary([Sql, <<" limit ?, ?">>]),
    get_all4page(DataSource, NewSql, Args, 0, PageSize, []).

get_all4page(DataSource, NewSql, Args, PageIndex,
	     PageSize, AllData) ->
    case get_all(DataSource, NewSql,
		 Args ++ [PageIndex * PageSize, PageSize])
	of
      {ok, []} -> {ok, AllData};
      {ok, Rs} ->
	  get_all4page(DataSource, NewSql, Args, PageIndex + 1,
		       PageSize, Rs ++ AllData);
      {error, Reason} -> {error, Reason}
    end.

format_sql(Sql, Args) when is_list(Sql) ->
    S = re:replace(Sql, "\\?", "~s",
		   [global, {return, list}]),
    L = [emysql_util:encode(A) || A <- Args],
    list_to_bitstring(io_lib:format(S, L));
format_sql(Sql, Args) when is_bitstring(Sql) ->
    format_sql(bitstring_to_list(Sql), Args).

print_sql(_Sql) -> ok.


