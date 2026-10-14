-file("src/merge/merge_context.erl", 1).

-module(merge_context).

-lager_records([{state,
		 [process_list, start_time, merge_type]},
		{merge_role_name,
		 [key, role_id, name, lev, exp, power, data_source]},
		{merge_server,
		 [platform, zone_id, data_source, schema, target_schema,
		  realm, index, size]},
		{merge_table,
		 [name, table, dao, server, next_key, process, state,
		  new_srv_id, old_srv_id, columns, delete_expire]}]).

-behaviour(gen_server).

-export([start_link/0, start/0, start/1, truncate/0,
	 truncate/1, update_srv_id/2, merge_finish/1,
	 all_finish/0, delete_expire/1]).

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

-file("src/merge/merge_context.erl", 26).

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

-file("src/merge/merge_context.erl", 27).

-record(state,
	{process_list = [], start_time = 0, merge_type = zone}).

start_link() ->
    gen_server:start_link({global, merge_context},
			  merge_context, [], []).

start() ->
    gen_server:cast({global, merge_context}, merge_begin).

start(TableName) ->
    gen_server:cast({global, merge_context},
		    {merge_begin, TableName}).

merge_finish(Process) ->
    gen_server:cast({global, merge_context},
		    {merge_finish, Process}).

truncate() ->
    gen_server:cast({global, merge_context}, truncate).

truncate(TableName) ->
    gen_server:cast({global, merge_context},
		    {truncate, TableName}).

update_srv_id(OldSrvId, NewSrvId) ->
    gen_server:cast({global, merge_context},
		    {update_srv_id, OldSrvId, NewSrvId}).

all_finish() ->
    gen_server:cast({global, merge_context}, all_finish).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_context70, _,
       {__Levelmerge_context70, __Tracesmerge_context70}}
	  when __Levelmerge_context70 band 64 /= 0 orelse
		 __Tracesmerge_context70 /= [] ->
	  lager:do_log(info,
		       [{module, merge_context}, {function, init}, {line, 70},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [merge_context]), none,
		       4096, 64, __Levelmerge_context70,
		       __Tracesmerge_context70, lager_event,
		       __Pidmerge_context70);
      _ -> ok
    end,
    erlang:register(merge_context, self()),
    MergeType = merge_util:get_merge_type(),
    {ok, List} = merge_data:tables(MergeType),
    ProList = [Process
	       || #merge_table{process = Process} <- List],
    NewProList = sets:to_list(sets:from_list(ProList)),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_context77, _,
       {__Levelmerge_context77, __Tracesmerge_context77}}
	  when __Levelmerge_context77 band 128 /= 0 orelse
		 __Tracesmerge_context77 /= [] ->
	  lager:do_log(debug,
		       [{module, merge_context}, {function, init}, {line, 77},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("ProList:~w", [NewProList]), none, 4096,
		       128, __Levelmerge_context77, __Tracesmerge_context77,
		       lager_event, __Pidmerge_context77);
      _ -> ok
    end,
    start_process(NewProList),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_context79, _,
       {__Levelmerge_context79, __Tracesmerge_context79}}
	  when __Levelmerge_context79 band 64 /= 0 orelse
		 __Tracesmerge_context79 /= [] ->
	  lager:do_log(info,
		       [{module, merge_context}, {function, init}, {line, 79},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [merge_context]), none, 4096,
		       64, __Levelmerge_context79, __Tracesmerge_context79,
		       lager_event, __Pidmerge_context79);
      _ -> ok
    end,
    case init:get_plain_arguments() of
      ["immediacy"] ->
	  gen_server:cast({global, merge_context}, merge_begin);
      _Other ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_context84, _,
	     {__Levelmerge_context84, __Tracesmerge_context84}}
		when __Levelmerge_context84 band 128 /= 0 orelse
		       __Tracesmerge_context84 /= [] ->
		lager:do_log(debug,
			     [{module, merge_context}, {function, init},
			      {line, 84}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("没有直接运行:~s", [_Other]), none, 4096,
			     128, __Levelmerge_context84,
			     __Tracesmerge_context84, lager_event,
			     __Pidmerge_context84);
	    _ -> ok
	  end
    end,
    {ok,
     #state{process_list = NewProList,
	    start_time = date:unixtime(), merge_type = MergeType}}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(merge_begin,
	    State = #state{process_list = ProList}) ->
    case merge_checker:check_all() of
      ok -> start_merge(ProList);
      {false, Reason} ->
	  catch case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmerge_context97, _,
		   {__Levelmerge_context97, __Tracesmerge_context97}}
		      when __Levelmerge_context97 band 64 /= 0 orelse
			     __Tracesmerge_context97 /= [] ->
		      lager:do_log(info,
				   [{module, merge_context},
				    {function, handle_cast}, {line, 97},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   "检查有误", none, 4096, 64,
				   __Levelmerge_context97,
				   __Tracesmerge_context97, lager_event,
				   __Pidmerge_context97);
		  _ -> ok
		end,
	  catch case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmerge_context98, _,
		   {__Levelmerge_context98, __Tracesmerge_context98}}
		      when __Levelmerge_context98 band 64 /= 0 orelse
			     __Tracesmerge_context98 /= [] ->
		      lager:do_log(info,
				   [{module, merge_context},
				    {function, handle_cast}, {line, 98},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("检查有误:~w", [Reason]), none,
				   4096, 64, __Levelmerge_context98,
				   __Tracesmerge_context98, lager_event,
				   __Pidmerge_context98);
		  _ -> ok
		end,
	  catch case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmerge_context99, _,
		   {__Levelmerge_context99, __Tracesmerge_context99}}
		      when __Levelmerge_context99 band 64 /= 0 orelse
			     __Tracesmerge_context99 /= [] ->
		      lager:do_log(info,
				   [{module, merge_context},
				    {function, handle_cast}, {line, 99},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("检查有误:~ts", [Reason]), none,
				   4096, 64, __Levelmerge_context99,
				   __Tracesmerge_context99, lager_event,
				   __Pidmerge_context99);
		  _ -> ok
		end
    end,
    {noreply, State};
handle_cast({merge_begin, TableName},
	    State = #state{merge_type = MergeType}) ->
    {ok, List} = merge_data:tables(MergeType),
    case lists:keyfind(util:term_to_bitstring(TableName),
		       #merge_table.table, List)
	of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_context106, _,
	     {__Levelmerge_context106, __Tracesmerge_context106}}
		when __Levelmerge_context106 band 64 /= 0 orelse
		       __Tracesmerge_context106 /= [] ->
		lager:do_log(info,
			     [{module, merge_context}, {function, handle_cast},
			      {line, 106}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "没找到该表信息", none, 4096, 64, __Levelmerge_context106,
			     __Tracesmerge_context106, lager_event,
			     __Pidmerge_context106);
	    _ -> ok
	  end;
      Table ->
	  Sql = util:fbin(<<"truncate ~w">>, [TableName]),
	  merge_db:exec(merge_target, Sql, []),
	  SrvList = merge_util:all_server(),
	  tables_merge_srv(Table, SrvList),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_context112, _,
	     {__Levelmerge_context112, __Tracesmerge_context112}}
		when __Levelmerge_context112 band 64 /= 0 orelse
		       __Tracesmerge_context112 /= [] ->
		lager:do_log(info,
			     [{module, merge_context}, {function, handle_cast},
			      {line, 112}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("转换完成:~w", [TableName]), none, 4096,
			     64, __Levelmerge_context112,
			     __Tracesmerge_context112, lager_event,
			     __Pidmerge_context112);
	    _ -> ok
	  end
    end,
    {noreply, State};
handle_cast({merge_finish, Process},
	    State = #state{process_list = ProList}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_context118, _,
       {__Levelmerge_context118, __Tracesmerge_context118}}
	  when __Levelmerge_context118 band 64 /= 0 orelse
		 __Tracesmerge_context118 /= [] ->
	  lager:do_log(info,
		       [{module, merge_context}, {function, handle_cast},
			{line, 118}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("进程~w完成处理", [Process]), none, 4096, 64,
		       __Levelmerge_context118, __Tracesmerge_context118,
		       lager_event, __Pidmerge_context118);
      _ -> ok
    end,
    case ProList -- [Process] of
      [] ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_context121, _,
	     {__Levelmerge_context121, __Tracesmerge_context121}}
		when __Levelmerge_context121 band 64 /= 0 orelse
		       __Tracesmerge_context121 /= [] ->
		lager:do_log(info,
			     [{module, merge_context}, {function, handle_cast},
			      {line, 121}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "全部进程已经处理完成", none, 4096, 64,
			     __Levelmerge_context121, __Tracesmerge_context121,
			     lager_event, __Pidmerge_context121);
	    _ -> ok
	  end,
	  all_finish(),
	  {noreply, State#state{process_list = []}};
      NewProList ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_context125, _,
	     {__Levelmerge_context125, __Tracesmerge_context125}}
		when __Levelmerge_context125 band 64 /= 0 orelse
		       __Tracesmerge_context125 /= [] ->
		lager:do_log(info,
			     [{module, merge_context}, {function, handle_cast},
			      {line, 125}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("还有进程还没处理完成:~w", [NewProList]), none,
			     4096, 64, __Levelmerge_context125,
			     __Tracesmerge_context125, lager_event,
			     __Pidmerge_context125);
	    _ -> ok
	  end,
	  {noreply, State#state{process_list = NewProList}}
    end;
handle_cast(truncate, State) ->
    do_truncate(), {noreply, State};
handle_cast({truncate, TableName}, State) ->
    Sql = util:fbin(<<"truncate ~w">>, [TableName]),
    merge_db:exec(merge_target, Sql, []),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_context136, _,
       {__Levelmerge_context136, __Tracesmerge_context136}}
	  when __Levelmerge_context136 band 64 /= 0 orelse
		 __Tracesmerge_context136 /= [] ->
	  lager:do_log(info,
		       [{module, merge_context}, {function, handle_cast},
			{line, 136}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("删除成功:~w", [TableName]), none, 4096, 64,
		       __Levelmerge_context136, __Tracesmerge_context136,
		       lager_event, __Pidmerge_context136);
      _ -> ok
    end,
    {noreply, State};
handle_cast({update_srv_id, OldSrvId, NewSrvId},
	    State) ->
    do_update_srv_id(OldSrvId, NewSrvId), {noreply, State};
handle_cast(all_finish,
	    State = #state{start_time = ST,
			   merge_type = MergeType}) ->
    case MergeType of
      center -> skip;
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_context149, _,
	     {__Levelmerge_context149, __Tracesmerge_context149}}
		when __Levelmerge_context149 band 64 /= 0 orelse
		       __Tracesmerge_context149 /= [] ->
		lager:do_log(info,
			     [{module, merge_context}, {function, handle_cast},
			      {line, 149}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "开始删除过期数据...", none, 4096, 64,
			     __Levelmerge_context149, __Tracesmerge_context149,
			     lager_event, __Pidmerge_context149);
	    _ -> ok
	  end,
	  {ok, List} = merge_data:tables(MergeType),
	  ok = delete_expire(List),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_context152, _,
	     {__Levelmerge_context152, __Tracesmerge_context152}}
		when __Levelmerge_context152 band 64 /= 0 orelse
		       __Tracesmerge_context152 /= [] ->
		lager:do_log(info,
			     [{module, merge_context}, {function, handle_cast},
			      {line, 152}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     "完成删除过期数据...", none, 4096, 64,
			     __Levelmerge_context152, __Tracesmerge_context152,
			     lager_event, __Pidmerge_context152);
	    _ -> ok
	  end
    end,
    ET = date:unixtime(),
    {H, M, SS} = calendar:seconds_to_time(ET - ST),
    Time = util:fbin(<<"~w:~w:~w">>, [H, M, SS]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_context157, _,
       {__Levelmerge_context157, __Tracesmerge_context157}}
	  when __Levelmerge_context157 band 64 /= 0 orelse
		 __Tracesmerge_context157 /= [] ->
	  lager:do_log(info,
		       [{module, merge_context}, {function, handle_cast},
			{line, 157}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "---------------------------------------------", none,
		       4096, 64, __Levelmerge_context157,
		       __Tracesmerge_context157, lager_event,
		       __Pidmerge_context157);
      _ -> ok
    end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_context158, _,
       {__Levelmerge_context158, __Tracesmerge_context158}}
	  when __Levelmerge_context158 band 64 /= 0 orelse
		 __Tracesmerge_context158 /= [] ->
	  lager:do_log(info,
		       [{module, merge_context}, {function, handle_cast},
			{line, 158}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "---------------------------------------------", none,
		       4096, 64, __Levelmerge_context158,
		       __Tracesmerge_context158, lager_event,
		       __Pidmerge_context158);
      _ -> ok
    end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_context159, _,
       {__Levelmerge_context159, __Tracesmerge_context159}}
	  when __Levelmerge_context159 band 64 /= 0 orelse
		 __Tracesmerge_context159 /= [] ->
	  lager:do_log(info,
		       [{module, merge_context}, {function, handle_cast},
			{line, 159}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("合服完成[~s], 请迁移生成后的DETS到主合服....", [Time]),
		       none, 4096, 64, __Levelmerge_context159,
		       __Tracesmerge_context159, lager_event,
		       __Pidmerge_context159);
      _ -> ok
    end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_context160, _,
       {__Levelmerge_context160, __Tracesmerge_context160}}
	  when __Levelmerge_context160 band 64 /= 0 orelse
		 __Tracesmerge_context160 /= [] ->
	  lager:do_log(info,
		       [{module, merge_context}, {function, handle_cast},
			{line, 160}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "---------------------------------------------", none,
		       4096, 64, __Levelmerge_context160,
		       __Tracesmerge_context160, lager_event,
		       __Pidmerge_context160);
      _ -> ok
    end,
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_context161, _,
       {__Levelmerge_context161, __Tracesmerge_context161}}
	  when __Levelmerge_context161 band 64 /= 0 orelse
		 __Tracesmerge_context161 /= [] ->
	  lager:do_log(info,
		       [{module, merge_context}, {function, handle_cast},
			{line, 161}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "---------------------------------------------", none,
		       4096, 64, __Levelmerge_context161,
		       __Tracesmerge_context161, lager_event,
		       __Pidmerge_context161);
      _ -> ok
    end,
    ok,
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_truncate() ->
    {ok, List} = merge_data:tables(), do_truncate(List).

do_truncate([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_context193, _,
       {__Levelmerge_context193, __Tracesmerge_context193}}
	  when __Levelmerge_context193 band 64 /= 0 orelse
		 __Tracesmerge_context193 /= [] ->
	  lager:do_log(info,
		       [{module, merge_context}, {function, do_truncate},
			{line, 193}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "清档完成", none, 4096, 64, __Levelmerge_context193,
		       __Tracesmerge_context193, lager_event,
		       __Pidmerge_context193);
      _ -> ok
    end,
    ok;
do_truncate([Table | T]) ->
    merge_dao_behaviour:truncate(Table), do_truncate(T).

start_process([]) -> ok;
start_process([Process | T]) ->
    merge_srv:start_link(Process), start_process(T).

start_merge([]) -> ok;
start_merge([Process | T]) ->
    merge_srv:start_merge(Process), start_merge(T).

do_update_srv_id(OldSrvId, NewSrvId) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_context211, _,
       {__Levelmerge_context211, __Tracesmerge_context211}}
	  when __Levelmerge_context211 band 64 /= 0 orelse
		 __Tracesmerge_context211 /= [] ->
	  lager:do_log(info,
		       [{module, merge_context}, {function, do_update_srv_id},
			{line, 211}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "正在修正数据...", none, 4096, 64, __Levelmerge_context211,
		       __Tracesmerge_context211, lager_event,
		       __Pidmerge_context211);
      _ -> ok
    end,
    {ok, List} = merge_data:tables(),
    do_update_srv_id(List, OldSrvId, NewSrvId).

do_update_srv_id([], _OldSrvId, _NewSrvId) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_context215, _,
       {__Levelmerge_context215, __Tracesmerge_context215}}
	  when __Levelmerge_context215 band 64 /= 0 orelse
		 __Tracesmerge_context215 /= [] ->
	  lager:do_log(info,
		       [{module, merge_context}, {function, do_update_srv_id},
			{line, 215}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "完成修正数据", none, 4096, 64, __Levelmerge_context215,
		       __Tracesmerge_context215, lager_event,
		       __Pidmerge_context215);
      _ -> ok
    end;
do_update_srv_id([Table = #merge_table{dao = DaoMod}
		  | T],
		 OldSrvId, NewSrvId) ->
    case lists:keyfind(exports, 1, DaoMod:module_info()) of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_context219, _,
	     {__Levelmerge_context219, __Tracesmerge_context219}}
		when __Levelmerge_context219 band 64 /= 0 orelse
		       __Tracesmerge_context219 /= [] ->
		lager:do_log(info,
			     [{module, merge_context},
			      {function, do_update_srv_id}, {line, 219},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("该模块没有方法[~w]", [DaoMod]), none, 4096,
			     64, __Levelmerge_context219,
			     __Tracesmerge_context219, lager_event,
			     __Pidmerge_context219);
	    _ -> ok
	  end,
	  do_update_srv_id(T, OldSrvId, NewSrvId);
      {exports, FunList} ->
	  case [Fun || Fun = {update_srv_id, 1} <- FunList] of
	    [{update_srv_id, 1}] ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmerge_context224, _,
		   {__Levelmerge_context224, __Tracesmerge_context224}}
		      when __Levelmerge_context224 band 64 /= 0 orelse
			     __Tracesmerge_context224 /= [] ->
		      lager:do_log(info,
				   [{module, merge_context},
				    {function, do_update_srv_id}, {line, 224},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("处理模块:~w", [DaoMod]), none,
				   4096, 64, __Levelmerge_context224,
				   __Tracesmerge_context224, lager_event,
				   __Pidmerge_context224);
		  _ -> ok
		end,
		merge_dao_behaviour:update_srv_id(Table#merge_table{old_srv_id
									=
									OldSrvId,
								    new_srv_id =
									NewSrvId,
								    server =
									#merge_server{data_source
											  =
											  merge_target}}),
		do_update_srv_id(T, OldSrvId, NewSrvId);
	    _ -> do_update_srv_id(T, OldSrvId, NewSrvId)
	  end
    end.

delete_expire([]) -> ok;
delete_expire([#merge_table{delete_expire = undefined}
	       | T]) ->
    delete_expire(T);
delete_expire([Table = #merge_table{table = _TableName,
				    dao = DaoMod}
	       | T]) ->
    case lists:keyfind(exports, 1, DaoMod:module_info()) of
      false ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_context240, _,
	     {__Levelmerge_context240, __Tracesmerge_context240}}
		when __Levelmerge_context240 band 64 /= 0 orelse
		       __Tracesmerge_context240 /= [] ->
		lager:do_log(info,
			     [{module, merge_context},
			      {function, delete_expire}, {line, 240},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("该模块没有方法[~w]", [DaoMod]), none, 4096,
			     64, __Levelmerge_context240,
			     __Tracesmerge_context240, lager_event,
			     __Pidmerge_context240);
	    _ -> ok
	  end,
	  delete_expire(T);
      {exports, FunList} ->
	  case [Fun || Fun = {delete_expire, 1} <- FunList] of
	    [{delete_expire, 1}] ->
		merge_dao_behaviour:delete_expire(Table),
		delete_expire(T);
	    _ -> delete_expire(T)
	  end
    end.

tables_merge_srv(_, []) -> ok;
tables_merge_srv(Table, [Server | T]) ->
    merge_dao_behaviour:merge(Table#merge_table{server =
						    Server}),
    tables_merge_srv(Table, T).


