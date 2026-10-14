-file("src/merge/merge_sup.erl", 1).

-module(merge_sup).

-lager_records([{merge_role_name,
		 [key, role_id, name, lev, exp, power, data_source]},
		{merge_server,
		 [platform, zone_id, data_source, schema, target_schema,
		  realm, index, size]},
		{merge_table,
		 [name, table, dao, server, next_key, process, state,
		  new_srv_id, old_srv_id, columns, delete_expire]}]).

-behaviour(supervisor).

-export([start_link/0, init/1]).

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

-file("src/merge/merge_sup.erl", 18).

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

-file("src/merge/merge_sup.erl", 19).

start_link() ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_sup21, _,
       {__Levelmerge_sup21, __Tracesmerge_sup21}}
	  when __Levelmerge_sup21 band 64 /= 0 orelse
		 __Tracesmerge_sup21 /= [] ->
	  lager:do_log(info,
		       [{module, merge_sup}, {function, start_link},
			{line, 21}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动监控树...", [merge_sup]), none,
		       4096, 64, __Levelmerge_sup21, __Tracesmerge_sup21,
		       lager_event, __Pidmerge_sup21);
      _ -> ok
    end,
    supervisor:start_link({local, merge_sup}, merge_sup,
			  []).

init([]) ->
    List = [{merge_context, {merge_context, start_link, []},
	     transient, 10000, worker, [merge_context]}],
    {ok, {{one_for_one, 50, 1}, List}}.


