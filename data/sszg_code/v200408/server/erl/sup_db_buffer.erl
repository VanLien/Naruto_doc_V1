-file("src/db/sup_db_buffer.erl", 1).

-module(sup_db_buffer).

-lager_records([]).

-behaviour(supervisor).

-export([start_link/1, init/1, stop_srv/0,
	 db_buffer_list/1]).

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

-file("src/db/sup_db_buffer.erl", 10).

-file("inc/log.hrl", 1).

-file("src/db/sup_db_buffer.erl", 11).

start_link(SrvType) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidsup_db_buffer13, _,
       {__Levelsup_db_buffer13, __Tracessup_db_buffer13}}
	  when __Levelsup_db_buffer13 band 64 /= 0 orelse
		 __Tracessup_db_buffer13 /= [] ->
	  lager:do_log(info,
		       [{module, sup_db_buffer}, {function, start_link},
			{line, 13}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始启动...", none, 4096, 64, __Levelsup_db_buffer13,
		       __Tracessup_db_buffer13, lager_event,
		       __Pidsup_db_buffer13);
      _ -> ok
    end,
    Res = supervisor:start_link({local, sup_db_buffer},
				sup_db_buffer, []),
    start_srv(db_buffer_list(SrvType)),
    Res.

init([]) -> {ok, {{one_for_one, 50, 1}, []}}.

start_srv([]) -> ok;
start_srv([{Name, Opt} | T]) ->
    ChileSpec = {Name,
		 {db_buffer_server, start_link, [Name, Opt]}, permanent,
		 10000, worker, [db_buffer_server]},
    case supervisor:start_child(sup_db_buffer, ChileSpec) of
      {ok, _} -> start_srv(T);
      {error, Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidsup_db_buffer28, _,
	     {__Levelsup_db_buffer28, __Tracessup_db_buffer28}}
		when __Levelsup_db_buffer28 band 8 /= 0 orelse
		       __Tracessup_db_buffer28 /= [] ->
		lager:do_log(error,
			     [{module, sup_db_buffer}, {function, start_srv},
			      {line, 28}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("缓冲服务~w启动失败原因：~w", [Name, Reason]),
			     none, 4096, 8, __Levelsup_db_buffer28,
			     __Tracessup_db_buffer28, lager_event,
			     __Pidsup_db_buffer28);
	    _ -> ok
	  end,
	  exit({error, {Name, Reason}})
    end.

stop_srv() ->
    case is_pid(whereis(sup_db_buffer)) of
      true ->
	  stop_srv(supervisor:which_children(sup_db_buffer));
      false -> ok
    end.

stop_srv([]) -> ok;
stop_srv([SrvChildSpec | T]) ->
    catch supervisor:terminate_child(sup_db_buffer,
				     element(1, SrvChildSpec)),
    stop_srv(T).

db_buffer_list(zone) ->
    [{log_error,
      [{interval, 1000 * 10}, {number, 1000}, {mode, batch},
       {sql, {batch_insert, log_error, [msg]}}]},
     {log_cli_error,
      [{interval, 1000 * 10}, {number, 1000}, {mode, batch},
       {sql,
	{batch_insert, log_cli_error,
	 [rid, srv_id, channel, msg]}}]},
     {log_mail,
      [{interval, 60000 * 5}, {number, 1000}, {mode, batch},
       {sql,
	{batch_insert, log_mail,
	 [mail_id, group_id, type, from_name, to_rid, to_srv_id,
	  channel, gold, coin, subject, content, assets, items,
	  ctime, remark]}}]}];
db_buffer_list(center) -> [];
db_buffer_list(_SrvType) -> [].


