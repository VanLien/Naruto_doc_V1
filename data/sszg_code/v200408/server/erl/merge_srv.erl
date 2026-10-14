-file("src/merge/merge_srv.erl", 1).

-module(merge_srv).

-lager_records([{state, [process]},
		{merge_role_name,
		 [key, role_id, name, lev, exp, power, data_source]},
		{merge_server,
		 [platform, zone_id, data_source, schema, target_schema,
		  realm, index, size]},
		{merge_table,
		 [name, table, dao, server, next_key, process, state,
		  new_srv_id, old_srv_id, columns, delete_expire]}]).

-behaviour(gen_server).

-export([start_link/1, start_merge/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

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

-file("src/merge/merge_srv.erl", 19).

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

-file("src/merge/merge_srv.erl", 20).

-record(state, {process = <<>>}).

start_link(SrvName) ->
    gen_server:start_link({global, SrvName}, merge_srv,
			  [SrvName], []).

start_merge(SrvName) ->
    gen_server:cast({global, SrvName}, start_merge).

init([SrvName]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_srv41, _,
       {__Levelmerge_srv41, __Tracesmerge_srv41}}
	  when __Levelmerge_srv41 band 64 /= 0 orelse
		 __Tracesmerge_srv41 /= [] ->
	  lager:do_log(info,
		       [{module, merge_srv}, {function, init}, {line, 41},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [SrvName]), none, 4096,
		       64, __Levelmerge_srv41, __Tracesmerge_srv41,
		       lager_event, __Pidmerge_srv41);
      _ -> ok
    end,
    State = #state{process = SrvName},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_srv43, _,
       {__Levelmerge_srv43, __Tracesmerge_srv43}}
	  when __Levelmerge_srv43 band 64 /= 0 orelse
		 __Tracesmerge_srv43 /= [] ->
	  lager:do_log(info,
		       [{module, merge_srv}, {function, init}, {line, 43},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [SrvName]), none, 4096, 64,
		       __Levelmerge_srv43, __Tracesmerge_srv43, lager_event,
		       __Pidmerge_srv43);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(start_merge,
	    State = #state{process = Process}) ->
    tables_merge(Process),
    merge_context:merge_finish(Process),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

tables_merge(Process) ->
    {ok, List} = merge_data:tables(),
    TabList = [Table
	       || Table = #merge_table{process = TProcess} <- List,
		  TProcess =:= Process],
    SrvList = merge_util:all_server(),
    tables_merge_srv(TabList, SrvList),
    ok.

tables_merge_srv(_, []) -> ok;
tables_merge_srv(TabList, [Server | T]) ->
    tables_merge(TabList, Server, 1),
    tables_merge_srv(TabList, T).

tables_merge([], _, _Idx) -> ok;
tables_merge([Table = #merge_table{table = TableName}
	      | T],
	     Server = #merge_server{platform = Platform,
				    zone_id = ZoneId},
	     Idx) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_srv84, _,
       {__Levelmerge_srv84, __Tracesmerge_srv84}}
	  when __Levelmerge_srv84 band 64 /= 0 orelse
		 __Tracesmerge_srv84 /= [] ->
	  lager:do_log(info,
		       [{module, merge_srv}, {function, tables_merge},
			{line, 84}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("正在处理[~s:~w]库表~w:~-20s",
				     [Platform, ZoneId, Idx, TableName]),
		       none, 4096, 64, __Levelmerge_srv84, __Tracesmerge_srv84,
		       lager_event, __Pidmerge_srv84);
      _ -> ok
    end,
    S = date:unixtime(),
    merge_dao_behaviour:merge(Table#merge_table{server =
						    Server}),
    E = date:unixtime(),
    {H, M, SS} = calendar:seconds_to_time(E - S),
    Time = util:fbin(<<"~w:~w:~w">>, [H, M, SS]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_srv90, _,
       {__Levelmerge_srv90, __Tracesmerge_srv90}}
	  when __Levelmerge_srv90 band 64 /= 0 orelse
		 __Tracesmerge_srv90 /= [] ->
	  lager:do_log(info,
		       [{module, merge_srv}, {function, tables_merge},
			{line, 90}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("完成处理[~s:~w]库表~w:~-20s [~s]",
				     [Platform, ZoneId, Idx, TableName, Time]),
		       none, 4096, 64, __Levelmerge_srv90, __Tracesmerge_srv90,
		       lager_event, __Pidmerge_srv90);
      _ -> ok
    end,
    tables_merge(T, Server, Idx + 1).


