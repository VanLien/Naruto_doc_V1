-file("src/merge/merge_checker.erl", 1).

-module(merge_checker).

-lager_records([{merge_role_name,
		 [key, role_id, name, lev, exp, power, data_source]},
		{merge_server,
		 [platform, zone_id, data_source, schema, target_schema,
		  realm, index, size]},
		{merge_table,
		 [name, table, dao, server, next_key, process, state,
		  new_srv_id, old_srv_id, columns, delete_expire]}]).

-export([check_all/0]).

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

-file("src/merge/merge_checker.erl", 15).

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

-file("src/merge/merge_checker.erl", 16).

check_all() ->
    List = [target_db],
    case check_all(List) of
      ok -> ok;
      {false, Reason} -> {false, Reason}
    end.

check_all([]) -> ok;
check_all([H | T]) ->
    case check(H) of
      ok -> check_all(T);
      {false, Reason} -> {false, Reason}
    end.

check(target_db) ->
    Sql = "select count(*) from role",
    case merge_db:get_one(merge_target, Sql) of
      {ok, undefined} -> ok;
      {ok, 0} -> ok;
      {ok, _R} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_checker40, _,
	     {__Levelmerge_checker40, __Tracesmerge_checker40}}
		when __Levelmerge_checker40 band 64 /= 0 orelse
		       __Tracesmerge_checker40 /= [] ->
		lager:do_log(info,
			     [{module, merge_checker}, {function, check},
			      {line, 40}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("==========~w", [_R]), none, 4096,
			     64, __Levelmerge_checker40,
			     __Tracesmerge_checker40, lager_event,
			     __Pidmerge_checker40);
	    _ -> ok
	  end,
	  {false, lang:get(<<"目标库非空库，请清档后继续"/utf8>>)};
      {error, Reason} -> {false, Reason};
      _ErrMsg -> {false, _ErrMsg}
    end.


