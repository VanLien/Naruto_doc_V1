-file("src/merge/merge_main.erl", 1).

-module(merge_main).

-lager_records([{merge_role_name,
		 [key, role_id, name, lev, exp, power, data_source]},
		{merge_server,
		 [platform, zone_id, data_source, schema, target_schema,
		  realm, index, size]},
		{merge_table,
		 [name, table, dao, server, next_key, process, state,
		  new_srv_id, old_srv_id, columns, delete_expire]}]).

-behaviour(application).

-export([start/0, start/2, stop/0, stop/1]).

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

-file("src/merge/merge_main.erl", 20).

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

-file("src/merge/merge_main.erl", 21).

start() ->
    lager:start(),
    start_applications([crypto, emysql, merge_main]).

start(_Type, _Args) ->
    error_logger:logfile({open,
			  lists:concat(["error_merge", node(), ".log"])}),
    merge_db:init(),
    merge_sup:start_link().

stop() ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_main41, _,
       {__Levelmerge_main41, __Tracesmerge_main41}}
	  when __Levelmerge_main41 band 64 /= 0 orelse
		 __Tracesmerge_main41 /= [] ->
	  lager:do_log(info,
		       [{module, merge_main}, {function, stop}, {line, 41},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("节点[~s]正在关闭...", [node()]), none, 4096,
		       64, __Levelmerge_main41, __Tracesmerge_main41,
		       lager_event, __Pidmerge_main41);
      _ -> ok
    end,
    try stop_applications([crypto, emysql, merge_main]),
	case {whereis(lager_event), whereis(lager_event),
	      lager_config:get({lager_event, loglevel}, {0, []})}
	    of
	  {undefined, undefined, _} ->
	      fun () -> {error, lager_not_running} end();
	  {undefined, _, _} ->
	      fun () -> {error, {sink_not_configured, lager_event}}
	      end();
	  {__Pidmerge_main44, _,
	   {__Levelmerge_main44, __Tracesmerge_main44}}
	      when __Levelmerge_main44 band 64 /= 0 orelse
		     __Tracesmerge_main44 /= [] ->
	      lager:do_log(info,
			   [{module, merge_main}, {function, stop}, {line, 44},
			    {pid, pid_to_list(self())}, {node, node()}
			    | lager:md()],
			   io_lib:format("节点[~s]已经关闭.", [node()]), none, 4096,
			   64, __Levelmerge_main44, __Tracesmerge_main44,
			   lager_event, __Pidmerge_main44);
	  _ -> ok
	end
    catch
      T:X ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_main47, _,
	     {__Levelmerge_main47, __Tracesmerge_main47}}
		when __Levelmerge_main47 band 8 /= 0 orelse
		       __Tracesmerge_main47 /= [] ->
		lager:do_log(error,
			     [{module, merge_main}, {function, stop},
			      {line, 47}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("节点[~s]关闭时发生异常[~w]: ~w",
					   [node(), T, X]),
			     none, 4096, 8, __Levelmerge_main47,
			     __Tracesmerge_main47, lager_event,
			     __Pidmerge_main47);
	    _ -> ok
	  end,
	  {error, X}
    end,
    init:stop().

stop(_State) -> ok.

start_applications(Apps) ->
    manage_applications(fun lists:foldl/3,
			fun application:start/1, fun application:stop/1,
			already_started, cannot_start_application, Apps).

stop_applications(Apps) ->
    manage_applications(fun lists:foldr/3,
			fun application:stop/1, fun application:start/1,
			not_started, cannot_stop_application, Apps).

manage_applications(Iterate, Do, Undo, SkipError,
		    ErrorTag, Apps) ->
    F = fun (App, Acc) ->
		case Do(App) of
		  ok -> [App | Acc];
		  {error, {SkipError, _}} -> Acc;
		  {error, Reason} ->
		      lists:foreach(Undo, Acc),
		      throw({error, {ErrorTag, App, Reason}})
		end
	end,
    Iterate(F, [], Apps),
    ok.


