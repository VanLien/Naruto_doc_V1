-file("src/merge/merge_dao_behaviour.erl", 1).

-module(merge_dao_behaviour).

-lager_records([{merge_role_name,
		 [key, role_id, name, lev, exp, power, data_source]},
		{merge_server,
		 [platform, zone_id, data_source, schema, target_schema,
		  realm, index, size]},
		{merge_table,
		 [name, table, dao, server, next_key, process, state,
		  new_srv_id, old_srv_id, columns, delete_expire]}]).

-export([merge/1, truncate/1, update_srv_id/1,
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

-file("src/merge/merge_dao_behaviour.erl", 18).

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

-file("src/merge/merge_dao_behaviour.erl", 19).

merge(Table = #merge_table{name = _Name,
			   dao = DaoMod}) ->
    {ok, Data, NewTable} = case DaoMod:do_init(Table) of
			     {ok, Rs, NT} -> {ok, Rs, NT};
			     {error, Msg} ->
				 case {whereis(lager_event),
				       whereis(lager_event),
				       lager_config:get({lager_event, loglevel},
							{0, []})}
				     of
				   {undefined, undefined, _} ->
				       fun () -> {error, lager_not_running}
				       end();
				   {undefined, _, _} ->
				       fun () ->
					       {error,
						{sink_not_configured,
						 lager_event}}
				       end();
				   {__Pidmerge_dao_behaviour29, _,
				    {__Levelmerge_dao_behaviour29,
				     __Tracesmerge_dao_behaviour29}}
				       when __Levelmerge_dao_behaviour29 band
					      128
					      /= 0
					      orelse
					      __Tracesmerge_dao_behaviour29 /=
						[] ->
				       lager:do_log(debug,
						    [{module,
						      merge_dao_behaviour},
						     {function, merge},
						     {line, 29},
						     {pid, pid_to_list(self())},
						     {node, node()}
						     | lager:md()],
						    io_lib:format("初始失败[~ts] [Reason:~w]",
								  [_Name, Msg]),
						    none, 4096, 128,
						    __Levelmerge_dao_behaviour29,
						    __Tracesmerge_dao_behaviour29,
						    lager_event,
						    __Pidmerge_dao_behaviour29);
				   _ -> ok
				 end,
				 throw({dao_init_error, DaoMod, Msg})
			   end,
    case DaoMod:do_convert(Data, NewTable) of
      {ok, NewTable2} -> DaoMod:do_end(NewTable2);
      {error, Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_dao_behaviour36, _,
	     {__Levelmerge_dao_behaviour36,
	      __Tracesmerge_dao_behaviour36}}
		when __Levelmerge_dao_behaviour36 band 64 /= 0 orelse
		       __Tracesmerge_dao_behaviour36 /= [] ->
		lager:do_log(info,
			     [{module, merge_dao_behaviour}, {function, merge},
			      {line, 36}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("~w处理do_convert出错:~ts",
					   [DaoMod, Reason]),
			     none, 4096, 64, __Levelmerge_dao_behaviour36,
			     __Tracesmerge_dao_behaviour36, lager_event,
			     __Pidmerge_dao_behaviour36);
	    _ -> ok
	  end,
	  throw({dao_do_convert_error, DaoMod, Reason})
    end.

truncate(#merge_table{table = TableName}) ->
    Sql = util:fbin(<<"truncate ~s">>, [TableName]),
    merge_db:exec(merge_target, Sql, []).

update_srv_id(Table = #merge_table{dao = DaoMod}) ->
    case DaoMod:update_srv_id(Table) of
      {error, Msg} ->
	  throw({dao_update_srv_id_error, DaoMod, Msg});
      _ -> ok
    end.

delete_expire(Table = #merge_table{table = TableName,
				   dao = DaoMod}) ->
    case DaoMod:delete_expire(Table) of
      {error, Msg} ->
	  catch case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmerge_dao_behaviour57, _,
		   {__Levelmerge_dao_behaviour57,
		    __Tracesmerge_dao_behaviour57}}
		      when __Levelmerge_dao_behaviour57 band 64 /= 0 orelse
			     __Tracesmerge_dao_behaviour57 /= [] ->
		      lager:do_log(info,
				   [{module, merge_dao_behaviour},
				    {function, delete_expire}, {line, 57},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("删除~s过期数据有误:~ts",
						 [TableName, Msg]),
				   none, 4096, 64, __Levelmerge_dao_behaviour57,
				   __Tracesmerge_dao_behaviour57, lager_event,
				   __Pidmerge_dao_behaviour57);
		  _ -> ok
		end,
	  throw({dao_delete_expire, DaoMod, Msg});
      _ -> ok
    end.


