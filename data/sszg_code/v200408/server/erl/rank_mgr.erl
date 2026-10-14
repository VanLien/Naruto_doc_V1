-file("src/mod/rank/rank_mgr.erl", 1).

-module(rank_mgr).

-lager_records([{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{state, []}]).

-behaviour(gen_server).

-export([lookup/1, clear/1]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {}).

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

-file("src/mod/rank/rank_mgr.erl", 13).

-file("inc/rank.hrl", 1).

-record(rank,
	{type = 0  :: non_neg_integer(), list = []  :: list(),
	 last_val = 0  :: non_neg_integer(),
	 len = 0  :: non_neg_integer(), is_cross = 0  :: 0 | 1,
	 ctime = 0  :: non_neg_integer()}).

-record(rank_rc,
	{ver = 3  :: pos_integer(), id = {0, <<>>}  :: tuple(),
	 idx = 0  :: non_neg_integer(),
	 val1 = 0  :: non_neg_integer(),
	 val2 = 0  :: non_neg_integer(),
	 val3 = 0  :: non_neg_integer(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 look_id = 0  :: non_neg_integer(),
	 sex = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 face_id = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 guild_name = <<>>  :: bitstring(),
	 power = 0  :: non_neg_integer(),
	 all_power = 0  :: non_neg_integer(),
	 desc = <<>>  :: bitstring(), looks = []  :: list(),
	 ext = []  :: list(), time = 0  :: non_neg_integer(),
	 is_cross = false, avatar_bid = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(rank_cfg,
	{type = 0  :: non_neg_integer(),
	 num = 300  :: non_neg_integer(),
	 keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1],
	 min_val = 1  :: non_neg_integer(),
	 nologin = 0  :: non_neg_integer(),
	 zone = rank_zone_1  :: atom(), exit_rank = 0  :: 0..1}).

-file("src/mod/rank/rank_mgr.erl", 14).

-spec lookup(non_neg_integer()) -> #rank{}.

lookup(Type) ->
    case catch ets:lookup(sys_rank, Type) of
      [Rank = #rank{list = List}] when Type >= 1000 ->
	  Rank#rank{list = ver_list(List, [])};
      [Rank] -> Rank;
      _ -> #rank{type = Type}
    end.

-spec clear(all | pos_integer() |
	    [pos_integer()]) -> ok.

clear(Types) -> info({clear, Types}).

info(Info) -> rank_mgr ! Info.

cast(Info) -> gen_server:cast(rank_mgr, Info).

call(Info) ->
    case catch gen_server:call(rank_mgr, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrank_mgr37, _,
	     {__Levelrank_mgr37, __Tracesrank_mgr37}}
		when __Levelrank_mgr37 band 8 /= 0 orelse
		       __Tracesrank_mgr37 /= [] ->
		lager:do_log(error,
			     [{module, rank_mgr}, {function, call}, {line, 37},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [rank_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelrank_mgr37,
			     __Tracesrank_mgr37, lager_event, __Pidrank_mgr37);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end.

start_link() ->
    gen_server:start_link({local, rank_mgr}, rank_mgr, [],
			  []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrank_mgr43, _,
       {__Levelrank_mgr43, __Tracesrank_mgr43}}
	  when __Levelrank_mgr43 band 64 /= 0 orelse
		 __Tracesrank_mgr43 /= [] ->
	  lager:do_log(info,
		       [{module, rank_mgr}, {function, init}, {line, 43},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [rank_mgr]), none, 4096,
		       64, __Levelrank_mgr43, __Tracesrank_mgr43, lager_event,
		       __Pidrank_mgr43);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    dets:open_file(sys_rank,
		   [{file, "./dets/sys_rank.dets"}, {keypos, #rank.type},
		    {type, set}]),
    ets:new(sys_rank,
	    [set, named_table, public, {keypos, #rank.type}]),
    put(zone_pids,
	[begin {ok, Pid1} = rank_zone:start(I), {I, Pid1} end
	 || I <- [1, 2, 3, 4, 5, 1001, 1002, 1003, 1004, 1005]]),
    load_data(),
    util:set_timer(save_timer, 600, save),
    util:set_timer(zero_timer, {0, 0, 1}, zero),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrank_mgr52, _,
       {__Levelrank_mgr52, __Tracesrank_mgr52}}
	  when __Levelrank_mgr52 band 64 /= 0 orelse
		 __Tracesrank_mgr52 /= [] ->
	  lager:do_log(info,
		       [{module, rank_mgr}, {function, init}, {line, 52},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [rank_mgr]), none, 4096, 64,
		       __Levelrank_mgr52, __Tracesrank_mgr52, lager_event,
		       __Pidrank_mgr52);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({clear, Types}, State) ->
    do_clear(Types), {noreply, State};
handle_info(save, State) ->
    do_save(),
    util:set_timer(save_timer, util:rand(400, 600), save),
    {noreply, State};
handle_info(zero, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrank_mgr73, _,
       {__Levelrank_mgr73, __Tracesrank_mgr73}}
	  when __Levelrank_mgr73 band 64 /= 0 orelse
		 __Tracesrank_mgr73 /= [] ->
	  lager:do_log(info,
		       [{module, rank_mgr}, {function, handle_info},
			{line, 73}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "排行榜0点处理", none, 4096, 64, __Levelrank_mgr73,
		       __Tracesrank_mgr73, lager_event, __Pidrank_mgr73);
      _ -> ok
    end,
    util:set_timer(zero_timer, {0, 0, 1}, zero),
    do_zero([2, 3, 6, 18, 21, 22, 23, 24, 28, 31, 52, 53,
	     54, 55, 1004, 1006, 1033]),
    {noreply, State};
handle_info({sync_cluster_rank,
	     [_RankType, RankRecord]},
	    State)
    when is_record(RankRecord, rank) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrank_mgr79, _,
       {__Levelrank_mgr79, __Tracesrank_mgr79}}
	  when __Levelrank_mgr79 band 128 /= 0 orelse
		 __Tracesrank_mgr79 /= [] ->
	  lager:do_log(debug,
		       [{module, rank_mgr}, {function, handle_info},
			{line, 79}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("sync_cluster_rank ~w, ~w",
				     [_RankType, RankRecord]),
		       none, 4096, 128, __Levelrank_mgr79, __Tracesrank_mgr79,
		       lager_event, __Pidrank_mgr79);
      _ -> ok
    end,
    ets:insert(sys_rank, RankRecord),
    {noreply, State};
handle_info({all_info, Info}, State) ->
    [Pid ! Info || {_, Pid} <- get(zone_pids)],
    {noreply, State};
handle_info(_Info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrank_mgr88, _,
       {__Levelrank_mgr88, __Tracesrank_mgr88}}
	  when __Levelrank_mgr88 band 64 /= 0 orelse
		 __Tracesrank_mgr88 /= [] ->
	  lager:do_log(info,
		       [{module, rank_mgr}, {function, handle_info},
			{line, 88}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("other info ~w", [_Info]), none, 4096, 64,
		       __Levelrank_mgr88, __Tracesrank_mgr88, lager_event,
		       __Pidrank_mgr88);
      _ -> ok
    end,
    {noreply, State}.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrank_mgr92, _,
       {__Levelrank_mgr92, __Tracesrank_mgr92}}
	  when __Levelrank_mgr92 band 64 /= 0 orelse
		 __Tracesrank_mgr92 /= [] ->
	  lager:do_log(info,
		       [{module, rank_mgr}, {function, terminate}, {line, 92},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在关闭...", [rank_mgr]), none, 4096,
		       64, __Levelrank_mgr92, __Tracesrank_mgr92, lager_event,
		       __Pidrank_mgr92);
      _ -> ok
    end,
    do_save(),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrank_mgr94, _,
       {__Levelrank_mgr94, __Tracesrank_mgr94}}
	  when __Levelrank_mgr94 band 64 /= 0 orelse
		 __Tracesrank_mgr94 /= [] ->
	  lager:do_log(info,
		       [{module, rank_mgr}, {function, terminate}, {line, 94},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 关闭完成", [rank_mgr]), none, 4096, 64,
		       __Levelrank_mgr94, __Tracesrank_mgr94, lager_event,
		       __Pidrank_mgr94);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_zero([]) -> ok;
do_zero([Type | T]) ->
    log_rank:save(Type),
    case rank_zone:cfg(Type) of
      #rank_cfg{nologin = Nologin} when Nologin > 0 ->
	  rank_zone:cast(Type, {nologin, Type, 86400 * Nologin});
      _ -> skip
    end,
    do_zero(T).

do_clear(all) ->
    do_clear([2, 3, 6, 18, 21, 22, 23, 24, 28, 31, 52, 53,
	      54, 55, 1004, 1006, 1033]);
do_clear([Type | T]) -> do_clear(Type), do_clear(T);
do_clear(Type) ->
    dets:delete(sys_rank, Type),
    rank_zone:cast(Type, {clear, Type}).

do_save() ->
    L = ets:tab2list(sys_rank), dets:insert(sys_rank, L).

load_data() ->
    Fun = fun (Rank) ->
		  {ok, NewRank} = ver(Rank),
		  rank_zone:update_ets(NewRank),
		  continue
	  end,
    dets:traverse(sys_rank, Fun).

ver({rank, Type, List, LastVal, Len, IsCross}) ->
    ver({rank, Type, List, LastVal, Len, IsCross, 0});
ver(Rank = #rank{list = List}) ->
    NewList = ver_list(List, []),
    {ok, Rank#rank{list = NewList}}.

ver_list({rank_rc, Ver = 1, Id, Idx, Val1, Val2, Val3,
	  Rid, SrvId, Name, Career, Sex, Lev, FaceId, VipLev,
	  GuildName, Power, AllPower, Desc, Looks, Ext, Time,
	  IsCross}) ->
    NewVer = Ver + 1,
    AvatarBaseId = 0,
    Rc = {rank_rc, NewVer, Id, Idx, Val1, Val2, Val3, Rid,
	  SrvId, Name, Career, Sex, Lev, FaceId, VipLev,
	  GuildName, Power, AllPower, Desc, Looks, Ext, Time,
	  IsCross, AvatarBaseId},
    ver_list(Rc);
ver_list({rank_rc, Ver = 2, Id, Idx, Val1, Val2, Val3,
	  Rid, SrvId, Name, Career, Sex, Lev, FaceId, VipLev,
	  GuildName, Power, AllPower, Desc, Looks, Ext, Time,
	  IsCross, AvatarBaseId}) ->
    NewVer = Ver + 1,
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    Rc = {rank_rc, NewVer, Id, Idx, Val1, Val2, Val3, Rid,
	  SrvId, Name, Career, Sex, Lev, FaceId, VipLev,
	  GuildName, Power, AllPower, Desc, Looks, Ext, Time,
	  IsCross, AvatarBaseId, FaceUpdateTime, FaceFile},
    ver_list(Rc);
ver_list(Rc = #rank_rc{ver = 3}) -> {ok, Rc}.

ver_list([], Acc) -> lists:reverse(Acc);
ver_list([Rc | Rest], Acc) ->
    {ok, NewRc} = ver_list(Rc),
    ver_list(Rest, [NewRc | Acc]).


