-file("src/merge/merge_before_stat.erl", 1).

-module(merge_before_stat).

-lager_records([{cluster_dynamic_local_group,
		 [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]}]).

-export([do/0, switch_main_srv/3, cluster_clear/0]).

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

-file("src/merge/merge_before_stat.erl", 12).

-file("inc/cluster_dynamic_group.hrl", 1).

-record(cluster_dynamic_group,
	{id = {1, <<>>}, min_world_lev = 0, group_lev = 0,
	 mode = 1, list = [], srv_num = 0, time = 0}).

-record(cluster_dynamic_srv,
	{id = {1, <<>>}, name = <<>>, main_srv = <<>>,
	 list = [], mode = 1, group_lev = 0, init_world_lev = 0,
	 world_lev = 0, open_time = 0, time = 0}).

-record(cluster_dynamic_local_group,
	{type = 0, main, list = []}).

-file("src/merge/merge_before_stat.erl", 13).

-spec do() -> ok.

do() ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_before_stat17, _,
       {__Levelmerge_before_stat17,
	__Tracesmerge_before_stat17}}
	  when __Levelmerge_before_stat17 band 64 /= 0 orelse
		 __Tracesmerge_before_stat17 /= [] ->
	  lager:do_log(info,
		       [{module, merge_before_stat}, {function, do},
			{line, 17}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "开始合服结算处理", none, 4096, 64, __Levelmerge_before_stat17,
		       __Tracesmerge_before_stat17, lager_event,
		       __Pidmerge_before_stat17);
      _ -> ok
    end,
    L = [{holiday_mgr, merge_do_rank_award},
	 {holiday_mgr, merge_do_calc_holiday},
	 {arena_cluster_mgr, merge_main_role_move_back},
	 {arena_mgr, notice_merge_reward},
	 {endless_mgr, notice_merge_reward}],
    sys_env:set(srv_merge_flag, 1),
    sys_env:set(is_maintain, 1),
    Bin = proto_lib:pack(10310,
			 {1, lang:get(<<"服务器正在进行合服操作，确认后将重启游戏"/utf8>>)}),
    role_group:send(world, Bin),
    do_do(L, #{}),
    cluster_dynamic_group:info(srv_merge),
    cluster_lib:cast(center, c_arena_peak_champion_mgr,
		     info, [{merge_srv_id, sys_env:get(server_id)}]),
    ok.

-spec switch_main_srv(old_main | new_main | center |
		      zone,
		      OldMainSrv :: #cluster_dynamic_srv{},
		      NewMainSrv :: #cluster_dynamic_srv{}) -> ok.

switch_main_srv(old_main, OldMainSrv, NewMainSrv) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_before_stat43, _,
       {__Levelmerge_before_stat43,
	__Tracesmerge_before_stat43}}
	  when __Levelmerge_before_stat43 band 64 /= 0 orelse
		 __Tracesmerge_before_stat43 /= [] ->
	  lager:do_log(info,
		       [{module, merge_before_stat},
			{function, switch_main_srv}, {line, 43},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("合服时 主服变化 旧主服处理：~w  =>  ~w",
				     [OldMainSrv, NewMainSrv]),
		       none, 4096, 64, __Levelmerge_before_stat43,
		       __Tracesmerge_before_stat43, lager_event,
		       __Pidmerge_before_stat43);
      _ -> ok
    end,
    L = [{arena_cluster_mgr, move_to_new_main}],
    do_do(L,
	  #{old_main => OldMainSrv, new_main => NewMainSrv});
switch_main_srv(new_main, OldMainSrv, NewMainSrv) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_before_stat50, _,
       {__Levelmerge_before_stat50,
	__Tracesmerge_before_stat50}}
	  when __Levelmerge_before_stat50 band 64 /= 0 orelse
		 __Tracesmerge_before_stat50 /= [] ->
	  lager:do_log(info,
		       [{module, merge_before_stat},
			{function, switch_main_srv}, {line, 50},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("合服时 主服变化 新主服处理：~w  =>  ~w",
				     [OldMainSrv, NewMainSrv]),
		       none, 4096, 64, __Levelmerge_before_stat50,
		       __Tracesmerge_before_stat50, lager_event,
		       __Pidmerge_before_stat50);
      _ -> ok
    end,
    L = [{sky_ladder_mgr, notice_new_main}],
    do_do(L,
	  #{old_main => OldMainSrv, new_main => NewMainSrv});
switch_main_srv(center, OldMainSrv, NewMainSrv) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_before_stat56, _,
       {__Levelmerge_before_stat56,
	__Tracesmerge_before_stat56}}
	  when __Levelmerge_before_stat56 band 64 /= 0 orelse
		 __Tracesmerge_before_stat56 /= [] ->
	  lager:do_log(info,
		       [{module, merge_before_stat},
			{function, switch_main_srv}, {line, 56},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("合服时 主服变化 中央服处理：~w  =>  ~w",
				     [OldMainSrv, NewMainSrv]),
		       none, 4096, 64, __Levelmerge_before_stat56,
		       __Tracesmerge_before_stat56, lager_event,
		       __Pidmerge_before_stat56);
      _ -> ok
    end,
    L = [],
    do_do(L,
	  #{old_main => OldMainSrv, new_main => NewMainSrv});
switch_main_srv(zone, OldMainSrv, NewMainSrv) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_before_stat61, _,
       {__Levelmerge_before_stat61,
	__Tracesmerge_before_stat61}}
	  when __Levelmerge_before_stat61 band 64 /= 0 orelse
		 __Tracesmerge_before_stat61 /= [] ->
	  lager:do_log(info,
		       [{module, merge_before_stat},
			{function, switch_main_srv}, {line, 61},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("合服时 主服变化 其它子服处理：~w  =>  ~w",
				     [OldMainSrv, NewMainSrv]),
		       none, 4096, 64, __Levelmerge_before_stat61,
		       __Tracesmerge_before_stat61, lager_event,
		       __Pidmerge_before_stat61);
      _ -> ok
    end,
    L = [],
    do_do(L,
	  #{old_main => OldMainSrv, new_main => NewMainSrv}).

-spec cluster_clear() -> ok.

cluster_clear() ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmerge_before_stat69, _,
       {__Levelmerge_before_stat69,
	__Tracesmerge_before_stat69}}
	  when __Levelmerge_before_stat69 band 64 /= 0 orelse
		 __Tracesmerge_before_stat69 /= [] ->
	  lager:do_log(info,
		       [{module, merge_before_stat}, {function, cluster_clear},
			{line, 69}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("合服时 被合服跨服信息清空处理", []), none, 4096, 64,
		       __Levelmerge_before_stat69, __Tracesmerge_before_stat69,
		       lager_event, __Pidmerge_before_stat69);
      _ -> ok
    end,
    L = [],
    do_do(L, #{}).

do_do([], _Args) -> ok;
do_do([{Mod, Fun} | T], Args) ->
    case catch Mod:Fun(Args) of
      ok -> ok;
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmerge_before_stat81, _,
	     {__Levelmerge_before_stat81,
	      __Tracesmerge_before_stat81}}
		when __Levelmerge_before_stat81 band 8 /= 0 orelse
		       __Tracesmerge_before_stat81 /= [] ->
		lager:do_log(error,
			     [{module, merge_before_stat}, {function, do_do},
			      {line, 81}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("合服预处理失败：~w:~w err:~w",
					   [Mod, Fun, _Err]),
			     none, 4096, 8, __Levelmerge_before_stat81,
			     __Tracesmerge_before_stat81, lager_event,
			     __Pidmerge_before_stat81);
	    _ -> ok
	  end
    end,
    do_do(T, Args).


