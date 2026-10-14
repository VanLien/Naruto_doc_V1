-file("src/merge/merge_dao_mergeall.erl", 1).

-module(merge_dao_mergeall).

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

-file("src/merge/merge_dao_mergeall.erl", 18).

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

-file("src/merge/merge_dao_mergeall.erl", 19).

do_init(Table = #merge_table{server =
				 #merge_server{index = 1},
			     columns = Columns}) ->
    merge_util:batch_insert_offset(Table, Columns);
do_init(Table = #merge_table{columns = Columns}) ->
    merge_util:batch_replace_offset(Table, Columns).

do_convert([], Table) -> {ok, Table}.

do_end(_Table) -> ignore.

delete_expire(Table) ->
    merge_util:delete_expire(Table, undefined).


