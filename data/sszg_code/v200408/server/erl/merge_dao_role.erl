-file("src/merge/merge_dao_role.erl", 1).

-module(merge_dao_role).

-lager_records([{merge_role_name,
		 [key, role_id, name, lev, exp, power, data_source]},
		{merge_server,
		 [platform, zone_id, data_source, schema, target_schema,
		  realm, index, size]},
		{merge_table,
		 [name, table, dao, server, next_key, process, state,
		  new_srv_id, old_srv_id, columns, delete_expire]}]).

-export([do_init/1, do_convert/2, do_end/1,
	 update_srv_id/1, delete_expire/1]).

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

-file("src/merge/merge_dao_role.erl", 19).

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

-file("src/merge/merge_dao_role.erl", 20).

do_init(Table = #merge_table{server =
				 #merge_server{index = 1}}) ->
    ok = do_role_name(),
    merge_db:exec(merge_target,
		  <<"ALTER TABLE role DROP INDEX name">>),
    merge_util:batch_insert_offset(Table, undefined);
do_init(Table) ->
    merge_util:batch_insert_offset(Table, undefined).

do_convert([], Table) -> {ok, Table}.

do_end(_Table = #merge_table{server =
				 #merge_server{index = Index, size = Size}})
    when Index =:= Size ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_dao_role35, _,
       {__Levelmerge_dao_role35, __Tracesmerge_dao_role35}}
	  when __Levelmerge_dao_role35 band 64 /= 0 orelse
		 __Tracesmerge_dao_role35 /= [] ->
	  lager:do_log(info,
		       [{module, merge_dao_role}, {function, do_end},
			{line, 35}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "正在修改角色名称...", none, 4096, 64, __Levelmerge_dao_role35,
		       __Tracesmerge_dao_role35, lager_event,
		       __Pidmerge_dao_role35);
      _ -> ok
    end,
    update_role_name(ets:tab2list(ets_merge_role_name)),
    ok = update_repeat_role_name(),
    merge_db:exec(merge_target,
		  <<"ALTER TABLE role ADD UNIQUE `name`(`name`)">>),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_dao_role39, _,
       {__Levelmerge_dao_role39, __Tracesmerge_dao_role39}}
	  when __Levelmerge_dao_role39 band 64 /= 0 orelse
		 __Tracesmerge_dao_role39 /= [] ->
	  lager:do_log(info,
		       [{module, merge_dao_role}, {function, do_end},
			{line, 39}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "完成修改角色名称", none, 4096, 64, __Levelmerge_dao_role39,
		       __Tracesmerge_dao_role39, lager_event,
		       __Pidmerge_dao_role39);
      _ -> ok
    end,
    ignore;
do_end(_Table) -> ignore.

update_srv_id(_Table = #merge_table{old_srv_id =
					OldSrvId,
				    new_srv_id = NewSrvId}) ->
    Sql = <<"update role set srv_id = ? where srv_id "
	    "= ? ">>,
    case merge_db:exec(merge_target, Sql,
		       [NewSrvId, OldSrvId])
	of
      {ok, _} -> ok;
      {error, Msg} -> {error, Msg}
    end.

delete_expire(_Table) ->
    merge_util:delete_expire(role, undefined).

update_repeat_role_name() ->
    Sql = <<"select name from role group by name "
	    "having count(*) > 1">>,
    case merge_db:get_all(merge_target, Sql, []) of
      {ok, Data} -> update_repeat_role_name(Data);
      {error, Reason} -> {error, Reason}
    end.

update_repeat_role_name([]) -> ok;
update_repeat_role_name([RoleName | T]) ->
    Sql = <<"select name, rid, srv_id, lev, power "
	    "from role where name = ? order by lev "
	    "desc, power desc">>,
    case merge_db:get_all(merge_target, Sql, [RoleName]) of
      {ok, [_ | Data]} ->
	  ok = do_update_repeat_role_name(Data),
	  update_repeat_role_name(T);
      {error, Reason} -> {error, Reason}
    end.

do_update_repeat_role_name([]) -> ok;
do_update_repeat_role_name([[Name, Rid, SrvId, _Lev,
			     _Power]
			    | T]) ->
    {ok, NewName} = convert_role_name2(SrvId, Name),
    Sql1 = <<"update role set name = ? where rid = "
	     "? and srv_id = ?">>,
    case merge_db:exec(merge_target, Sql1,
		       [NewName, Rid, SrvId])
	of
      {ok, _} -> do_update_repeat_role_name(T);
      {error, Msg} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_dao_role85, _,
	     {__Levelmerge_dao_role85, __Tracesmerge_dao_role85}}
		when __Levelmerge_dao_role85 band 8 /= 0 orelse
		       __Tracesmerge_dao_role85 /= [] ->
		lager:do_log(error,
			     [{module, merge_dao_role},
			      {function, do_update_repeat_role_name},
			      {line, 85}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("error===~ts ~w ~s ~w",
					   [NewName, Rid, SrvId, Msg]),
			     none, 4096, 8, __Levelmerge_dao_role85,
			     __Tracesmerge_dao_role85, lager_event,
			     __Pidmerge_dao_role85);
	    _ -> ok
	  end,
	  {error, Msg}
    end.

convert_role_name2(SrvId, Name) ->
    [ZoneId | _T] =
	lists:reverse(re:split(bitstring_to_list(SrvId), "_",
			       [{return, list}])),
    NewName = util:fbin(<<"【S~s】~ts"/utf8>>,
			[ZoneId, Name]),
    case merge_db:get_one(merge_target,
			  <<"select count(*) from role where name "
			    "= ?">>,
			  [NewName])
	of
      {ok, 0} -> {ok, NewName};
      {ok, _} -> convert_role_name3(NewName, 1);
      Err -> Err
    end.

convert_role_name3(Name, Num) ->
    NewName = util:fbin("~ts~w", [Name, Num]),
    case merge_db:get_one(merge_target,
			  <<"select count(*) from role where name "
			    "= ?">>,
			  [NewName])
	of
      {ok, 0} -> {ok, NewName};
      {ok, _} -> convert_role_name3(NewName, Num + 1);
      Err -> Err
    end.

get_roles_name(DataSource) ->
    Sql = <<"select rid, srv_id, name, lev, power "
	    "from role">>,
    case merge_db:get_all4page(DataSource, Sql, [], 3000) of
      {ok, Data} -> {ok, Data};
      {error, Reason} -> {error, Reason}
    end.

update_role_name([]) -> ok;
update_role_name([#merge_role_name{role_id =
				       {RoleId, SrvId},
				   name = RoleName}
		  | T]) ->
    Sql = <<"update role set name = ? where rid = "
	    "? and srv_id = ?">>,
    case merge_db:exec(merge_target, Sql,
		       [RoleName, RoleId, SrvId])
	of
      {ok, _} -> update_role_name(T);
      {error, Msg} ->
	  throw({update_role_name, {RoleId, SrvId}, Msg})
    end.

do_role_name() ->
    ets:new(ets_merge_role_name_temp,
	    [set, named_table, public,
	     {keypos, #merge_role_name.key}]),
    ets:new(ets_merge_role_name,
	    [set, named_table, public,
	     {keypos, #merge_role_name.key}]),
    SrvList = merge_util:all_server(),
    deal_role_name_srv(SrvList, 1, length(SrvList)),
    ok.

deal_role_name([], _DataSource, _Index, _Size) -> ok;
deal_role_name([[RoleId, SrvId, Name, Lev, Power] | T],
	       DataSource, 1, Size) ->
    ets:insert(ets_merge_role_name_temp,
	       #merge_role_name{key =
				    string:to_lower(util:to_list(Name)),
				role_id = {RoleId, SrvId}, name = Name,
				lev = Lev, power = Power,
				data_source = DataSource}),
    deal_role_name(T, DataSource, 1, Size);
deal_role_name([[RoleId, SrvId, Name, Lev, Power] | T],
	       DataSource, Index, Size) ->
    case ets:lookup(ets_merge_role_name_temp,
		    string:to_lower(util:to_list(Name)))
	of
      [] ->
	  case Index =/= Size of
	    true ->
		ets:insert(ets_merge_role_name_temp,
			   #merge_role_name{key =
						string:to_lower(util:to_list(Name)),
					    role_id = {RoleId, SrvId},
					    name = Name, lev = Lev,
					    power = Power,
					    data_source = DataSource});
	    false -> ignore
	  end,
	  ignore;
      [#merge_role_name{role_id = {ORoleId, OSrvId},
			name = OName, lev = OLev, power = OPower,
			data_source = ODataSource}] ->
	  case compare_role({Lev, Power}, {OLev, OPower}) of
	    true ->
		NewName = convert_role_name2(RoleId, SrvId, Name, Lev,
					     DataSource),
		ets:insert(ets_merge_role_name,
			   #merge_role_name{key =
						string:to_lower(util:to_list(NewName)),
					    role_id = {RoleId, SrvId},
					    name = NewName});
	    false ->
		ets:insert(ets_merge_role_name_temp,
			   #merge_role_name{key =
						string:to_lower(util:to_list(Name)),
					    role_id = {RoleId, SrvId},
					    name = Name, lev = Lev,
					    data_source = DataSource}),
		NewOName = convert_role_name2(ORoleId, OSrvId, OName,
					      OLev, ODataSource),
		ets:insert(ets_merge_role_name,
			   #merge_role_name{key =
						string:to_lower(util:to_list(NewOName)),
					    role_id = {ORoleId, OSrvId},
					    name = NewOName})
	  end
    end,
    deal_role_name(T, DataSource, Index, Size).

compare_role({Lev, APower}, {Lev, BPower}) ->
    APower < BPower;
compare_role({ALev, _APower}, {BLev, _BPower}) ->
    ALev < BLev;
compare_role(_A, _B) -> false.

deal_role_name_srv([], _Index, _Size) -> ok;
deal_role_name_srv([#merge_server{data_source =
				      DataSource}
		    | T],
		   Index, Size) ->
    {ok, RoleNameList} = get_roles_name(DataSource),
    ok = deal_role_name(RoleNameList, DataSource, Index,
			Size),
    deal_role_name_srv(T, Index + 1, Size).

convert_role_name2(RoleId, SrvId, Name, Lev,
		   DataSource) ->
    [SrvSn | _T] =
	lists:reverse(re:split(bitstring_to_list(SrvId), "_",
			       [{return, list}])),
    RoleName = util:fbin(<<"【S~s】~ts"/utf8>>,
			 [SrvSn, Name]),
    case ets:lookup(ets_merge_role_name_temp,
		    string:to_lower(util:to_list(RoleName)))
	of
      [] ->
	  ets:insert(ets_merge_role_name_temp,
		     #merge_role_name{key =
					  string:to_lower(util:to_list(RoleName)),
				      role_id = {RoleId, SrvId},
				      name = RoleName, lev = Lev,
				      data_source = DataSource}),
	  RoleName;
      _ ->
	  convert_role_name3(RoleId, SrvId, Name, Lev, DataSource,
			     RoleName, 1)
    end.

convert_role_name3(RoleId, SrvId, Name, Lev, DataSource,
		   RoleName, Num) ->
    NewRoleName = util:fbin("~ts~w", [RoleName, Num]),
    case ets:lookup(ets_merge_role_name_temp,
		    string:to_lower(util:to_list(NewRoleName)))
	of
      [] ->
	  ets:insert(ets_merge_role_name_temp,
		     #merge_role_name{key =
					  string:to_lower(util:to_list(NewRoleName)),
				      role_id = {RoleId, SrvId},
				      name = NewRoleName, lev = Lev,
				      data_source = DataSource}),
	  NewRoleName;
      _ ->
	  convert_role_name3(RoleId, SrvId, Name, Lev, DataSource,
			     RoleName, Num + 1)
    end.


