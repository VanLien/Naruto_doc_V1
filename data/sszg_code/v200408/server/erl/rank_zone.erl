-file("src/mod/rank/rank_zone.erl", 1).

-module(rank_zone).

-lager_records([{cluster_dynamic_local_group,
		 [type, main, list]},
		{cluster_dynamic_srv,
		 [id, name, main_srv, list, mode, group_lev,
		  init_world_lev, world_lev, open_time, time]},
		{cluster_dynamic_group,
		 [id, min_world_lev, group_lev, mode, list, srv_num,
		  time]},
		{cross_group, [group_id, main, group_list]},
		{cloud_task, [id, pos]},
		{srv,
		 [id, full_id, pid, type, platform, name, node, cookie,
		  ver, is_main, group_id]},
		{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{state, [zone, type, type_list]}]).

-behaviour(gen_server).

-export([cfg/1, local_type_group_type/1,
	 group_type_local_type/1, update_ets/1, update_rank/3,
	 first_sort_key/1, in_cross_rank/4]).

-export([info/2, cast/2, call/2, start/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {zone, type, type_list = []}).

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

-file("src/mod/rank/rank_zone.erl", 21).

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

-file("src/mod/rank/rank_zone.erl", 22).

-file("inc/cluster.hrl", 1).

-record(srv,
	{id = <<>>, full_id = [], pid, type = normal, platform,
	 name = <<>>, node, cookie, ver, is_main = 0,
	 group_id = 0}).

-record(cloud_task, {id, pos = 0}).

-record(cross_group,
	{group_id = 0, main, group_list = []}).

-file("src/mod/rank/rank_zone.erl", 23).

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

-file("src/mod/rank/rank_zone.erl", 24).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("src/mod/rank/rank_zone.erl", 25).

local_type_group_type(6) -> 1006;
local_type_group_type(4) -> 1004;
local_type_group_type(33) -> 1033;
local_type_group_type(_) -> 0.

group_type_local_type(1006) -> 6;
group_type_local_type(1004) -> 4;
group_type_local_type(1033) -> 33;
group_type_local_type(_) -> 0.

-spec cfg(non_neg_integer()) -> #rank_cfg{}.

cfg({Type, _Group}) -> cfg(Type);
cfg(Type = 1) ->
    #rank_cfg{type = Type, zone = rank_zone_1,
	      keys = [{asc, #rank_rc.val2}, #rank_rc.val1],
	      min_val = 10};
cfg(Type = 2) ->
    #rank_cfg{type = Type, zone = rank_zone_1,
	      keys = [#rank_rc.val1]};
cfg(Type = 3) ->
    #rank_cfg{type = Type, zone = rank_zone_1,
	      keys = [{asc, #rank_rc.val2}, #rank_rc.val1]};
cfg(Type = 28) ->
    #rank_cfg{type = Type, zone = rank_zone_1,
	      keys = [#rank_rc.val1]};
cfg(Type = 48) ->
    #rank_cfg{type = Type, zone = rank_zone_1,
	      keys = [{asc, #rank_rc.val2}, #rank_rc.val1]};
cfg(Type = 52) ->
    #rank_cfg{type = Type, zone = rank_zone_1,
	      keys = [#rank_rc.val1]};
cfg(Type = 53) ->
    #rank_cfg{type = Type, zone = rank_zone_1,
	      keys = [#rank_rc.val1]};
cfg(Type = 54) ->
    #rank_cfg{type = Type, zone = rank_zone_1,
	      keys = [#rank_rc.val1]};
cfg(Type = 55) ->
    #rank_cfg{type = Type, zone = rank_zone_1,
	      keys = [#rank_rc.val1]};
cfg(Type = 15) ->
    #rank_cfg{type = Type, zone = rank_zone_2,
	      keys = [#rank_rc.val1], min_val = 5};
cfg(Type = 18) ->
    #rank_cfg{type = Type, zone = rank_zone_2,
	      keys = [#rank_rc.val1]};
cfg(Type = 24) ->
    #rank_cfg{type = Type, zone = rank_zone_2,
	      keys = [#rank_rc.val1]};
cfg(Type = 34) ->
    #rank_cfg{type = Type, zone = rank_zone_2,
	      keys = [{asc, #rank_rc.val2}, #rank_rc.val1]};
cfg(Type = 35) ->
    #rank_cfg{type = Type, zone = rank_zone_2,
	      keys = [{asc, #rank_rc.val2}, #rank_rc.val1]};
cfg(Type = 41) ->
    #rank_cfg{type = Type, zone = rank_zone_2,
	      keys = [#rank_rc.val2, #rank_rc.val1]};
cfg(Type = 42) ->
    #rank_cfg{type = Type, zone = rank_zone_2,
	      keys = [{asc, #rank_rc.val2}, #rank_rc.val1]};
cfg(Type = 21) ->
    #rank_cfg{type = Type, zone = rank_zone_3,
	      keys = [#rank_rc.val1], min_val = 30};
cfg(Type = 22) ->
    #rank_cfg{type = Type, zone = rank_zone_3,
	      keys = [#rank_rc.val1], min_val = 5};
cfg(Type = 23) ->
    #rank_cfg{type = Type, zone = rank_zone_3,
	      keys = [#rank_rc.val1], min_val = 100};
cfg(Type = 36) ->
    #rank_cfg{type = Type, zone = rank_zone_3,
	      keys = [{asc, #rank_rc.val2}, #rank_rc.val1]};
cfg(Type = 37) ->
    #rank_cfg{type = Type, zone = rank_zone_3,
	      keys = [{asc, #rank_rc.val2}, #rank_rc.val1]};
cfg(Type = 43) ->
    #rank_cfg{type = Type, zone = rank_zone_3,
	      keys = [{asc, #rank_rc.val2}, #rank_rc.val1]};
cfg(Type = 6) ->
    #rank_cfg{type = Type, zone = rank_zone_4,
	      keys = [#rank_rc.val2, #rank_rc.val1], min_val = 1000};
cfg(Type = 8) ->
    #rank_cfg{type = Type, zone = rank_zone_4,
	      keys = [#rank_rc.val1], min_val = 1};
cfg(Type = 14) ->
    #rank_cfg{type = Type, zone = rank_zone_4,
	      keys = [#rank_rc.val3, #rank_rc.val2, #rank_rc.val1]};
cfg(Type = 32) ->
    #rank_cfg{type = Type, zone = rank_zone_4,
	      keys = [#rank_rc.val1]};
cfg(Type = 40) ->
    #rank_cfg{type = Type, zone = rank_zone_4,
	      keys = [#rank_rc.val1]};
cfg(Type = 49) ->
    #rank_cfg{type = Type, zone = rank_zone_4,
	      keys = [{asc, #rank_rc.val2}, #rank_rc.val1]};
cfg(Type = 1004) ->
    #rank_cfg{type = Type, zone = rank_zone_1001,
	      keys = [#rank_rc.val2, #rank_rc.val1, #rank_rc.lev]};
cfg(Type = 1006) ->
    #rank_cfg{type = Type, zone = rank_zone_1004,
	      keys = [#rank_rc.val2, #rank_rc.val1], min_val = 1000};
cfg(Type) when Type > 1000 ->
    #rank_cfg{type = Type, zone = rank_zone_1005};
cfg(Type) -> #rank_cfg{type = Type}.

-spec update_ets(#rank{}) -> ok.

update_ets(Rank = #rank{type = Type, list = L}) ->
    {Len, NewL} = update_idx(L, 1, []),
    NRank = Rank#rank{len = Len, list = NewL,
		      ctime = date:unixtime()},
    ets:insert(sys_rank, NRank),
    put({rank, Type}, NRank).

first_sort_key(SortKeys) ->
    case lists:reverse(SortKeys) of
      [{_, Key} | _] -> Key;
      [Key | _] -> Key
    end.

-spec update_rank(Max :: pos_integer(), [pos_integer()],
		  [tuple()]) -> {[tuple()], non_neg_integer()}.

update_rank(Max, SortKeys, ToSortList) ->
    SortList = util:keys_sort(SortKeys, ToSortList),
    Len = length(SortList),
    if Max =:= 0 orelse Len < Max -> {SortList, 0};
       Len =:= Max ->
	   [LastPlayer | _] = lists:reverse(SortList),
	   FirstBasis = first_sort_key(SortKeys),
	   {SortList, element(FirstBasis, LastPlayer)};
       Len =:= Max + 1 ->
	   [_N | AscendRankedData] = lists:reverse(SortList),
	   [LastPlayer | _] = AscendRankedData,
	   FirstBasis = first_sort_key(SortKeys),
	   {lists:reverse(AscendRankedData),
	    element(FirstBasis, LastPlayer)};
       true -> {lists:sublist(SortList, Max), 0}
    end.

-spec update_rank_by_add(Max :: pos_integer(),
			 [pos_integer()], tuple(), [tuple()]) -> {[tuple()],
								  non_neg_integer()}.

update_rank_by_add(Max, SortKeys, AddE, SortList0) ->
    SortList = list_util:add_sort(SortList0, AddE,
				  lists:reverse(SortKeys), #rank_rc.id),
    Len = length(SortList),
    if Max =:= 0 orelse Len < Max -> {SortList, 0};
       Len =:= Max ->
	   [LastPlayer | _] = lists:reverse(SortList),
	   FirstBasis = first_sort_key(SortKeys),
	   {SortList, element(FirstBasis, LastPlayer)};
       Len =:= Max + 1 ->
	   [_N | AscendRankedData] = lists:reverse(SortList),
	   [LastPlayer | _] = AscendRankedData,
	   FirstBasis = first_sort_key(SortKeys),
	   {lists:reverse(AscendRankedData),
	    element(FirstBasis, LastPlayer)};
       true -> {lists:sublist(SortList, Max), 0}
    end.

info(Type, Info) ->
    element(#rank_cfg.zone, cfg(Type)) ! Info.

cast(Type, Info) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrank_zone175, _,
       {__Levelrank_zone175, __Tracesrank_zone175}}
	  when __Levelrank_zone175 band 128 /= 0 orelse
		 __Tracesrank_zone175 /= [] ->
	  lager:do_log(debug,
		       [{module, rank_zone}, {function, cast}, {line, 175},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("rank zone cast ~w, ~w",
				     [element(#rank_cfg.zone, cfg(Type)),
				      Info]),
		       none, 4096, 128, __Levelrank_zone175,
		       __Tracesrank_zone175, lager_event, __Pidrank_zone175);
      _ -> ok
    end,
    gen_server:cast(element(#rank_cfg.zone, cfg(Type)),
		    Info).

call(Type, Info) ->
    case catch gen_server:call(element(#rank_cfg.zone,
				       cfg(Type)),
			       Info, 10000)
	of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidrank_zone180, _,
	     {__Levelrank_zone180, __Tracesrank_zone180}}
		when __Levelrank_zone180 band 8 /= 0 orelse
		       __Tracesrank_zone180 /= [] ->
		lager:do_log(error,
			     [{module, rank_zone}, {function, call},
			      {line, 180}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [element(#rank_cfg.zone, cfg(Type)),
					    Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelrank_zone180,
			     __Tracesrank_zone180, lager_event,
			     __Pidrank_zone180);
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

start(Zone) -> gen_server:start(rank_zone, [Zone], []).

init([Zone]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrank_zone186, _,
       {__Levelrank_zone186, __Tracesrank_zone186}}
	  when __Levelrank_zone186 band 64 /= 0 orelse
		 __Tracesrank_zone186 /= [] ->
	  lager:do_log(info,
		       [{module, rank_zone}, {function, init}, {line, 186},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...~w", [rank_zone, Zone]),
		       none, 4096, 64, __Levelrank_zone186,
		       __Tracesrank_zone186, lager_event, __Pidrank_zone186);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    erlang:send_after(600000 + Zone * 20000, self(),
		      loop_gc),
    ZoneType = case sys_env:get(server_type) of
		 center -> 1;
		 _ when Zone > 1000 -> 2;
		 _ -> 0
	       end,
    State = #state{zone = Zone, type = ZoneType},
    Atom = list_to_atom(lists:concat(["rank_zone_", Zone])),
    put(zone_atom, Atom),
    erlang:register(Atom, self()),
    case ZoneType of
      1 ->
	  ets:new(ets_name(Zone),
		  [set, named_table, public, {keypos, 1}]),
	  erlang:send_after(60000 * 1, self(), interval_check);
      2 ->
	  ets:new(ets_name(Zone),
		  [set, named_table, public, {keypos, 1}]),
	  erlang:send_after(util:rand(60000, 90000), self(),
			    interval_check);
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
      {__Pidrank_zone208, _,
       {__Levelrank_zone208, __Tracesrank_zone208}}
	  when __Levelrank_zone208 band 64 /= 0 orelse
		 __Tracesrank_zone208 /= [] ->
	  lager:do_log(info,
		       [{module, rank_zone}, {function, init}, {line, 208},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成==>~w", [rank_zone, Zone]),
		       none, 4096, 64, __Levelrank_zone208,
		       __Tracesrank_zone208, lager_event, __Pidrank_zone208);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({in_rank, Type, Id, Value, NewData},
	    State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrank_zone216, _,
       {__Levelrank_zone216, __Tracesrank_zone216}}
	  when __Levelrank_zone216 band 128 /= 0 orelse
		 __Tracesrank_zone216 /= [] ->
	  lager:do_log(debug,
		       [{module, rank_zone}, {function, handle_cast},
			{line, 216}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("in rank ~w, ~w,~w", [Type, Id, Value]),
		       none, 4096, 128, __Levelrank_zone216,
		       __Tracesrank_zone216, lager_event, __Pidrank_zone216);
      _ -> ok
    end,
    Rank = #rank{list = RankList, len = Len,
		 last_val = LastValue} =
	       get_cache(Type),
    #rank_cfg{num = Max, keys = SortKeys} = cfg(Type),
    case lists:keyfind(Id, 3, RankList) of
      false ->
	  case lists:reverse(SortKeys) of
	    [{asc, _} | _]
		when Value > LastValue andalso Max =< Len ->
		{noreply, State};
	    _ when Value < LastValue andalso Max =< Len ->
		{noreply, State};
	    _ ->
		{NewRankList, NewLastValue} = update_rank_by_add(Max,
								 SortKeys,
								 NewData,
								 RankList),
		NewRank = Rank#rank{list = NewRankList,
				    last_val = NewLastValue},
		update_cache(NewRank),
		in_cross_rank(Type, Id, Value, NewData),
		{noreply, State}
	  end;
      _OldData ->
	  {NewRankList, NewLastValue} = update_rank_by_add(Max,
							   SortKeys, NewData,
							   RankList),
	  NewRank = Rank#rank{list = NewRankList,
			      last_val = NewLastValue},
	  update_cache(NewRank),
	  in_cross_rank(Type, Id, Value, NewData),
	  {noreply, State}
    end;
handle_cast({repair, Type}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrank_zone248, _,
       {__Levelrank_zone248, __Tracesrank_zone248}}
	  when __Levelrank_zone248 band 64 /= 0 orelse
		 __Tracesrank_zone248 /= [] ->
	  lager:do_log(info,
		       [{module, rank_zone}, {function, handle_cast},
			{line, 248}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("修正操作行:~w", [Type]), none, 4096, 64,
		       __Levelrank_zone248, __Tracesrank_zone248, lager_event,
		       __Pidrank_zone248);
      _ -> ok
    end,
    Rank = #rank{list = RankList} = get_cache(Type),
    NewRankList = repair(RankList, []),
    NewRank = Rank#rank{list = NewRankList},
    update_cache(NewRank),
    {noreply, State};
handle_cast({update_val, Type, Id, KVList}, State) ->
    Rank = #rank{list = RankList} = get_cache(Type),
    case lists:keyfind(Id, 3, RankList) of
      false -> {noreply, State};
      OldData ->
	  #rank_cfg{num = Max, keys = SortKeys} = cfg(Type),
	  NewData = update_kv(KVList, OldData),
	  NRandList = lists:keyreplace(Id, 3, RankList, NewData),
	  ToSortList = lists:reverse(NRandList),
	  {NewRankList, NewLastValue} = update_rank(Max, SortKeys,
						    ToSortList),
	  NewRank = Rank#rank{list = NewRankList,
			      last_val = NewLastValue},
	  update_cache(NewRank),
	  {noreply, State}
    end;
handle_cast({update_val, Type, Id, Pos, Val}, State) ->
    Rank = #rank{list = RankList} = get_cache(Type),
    case lists:keyfind(Id, 3, RankList) of
      false -> {noreply, State};
      OldData ->
	  #rank_cfg{num = Max, keys = SortKeys} = cfg(Type),
	  NewData = setelement(Pos, OldData, Val),
	  NRandList = lists:keyreplace(Id, 3, RankList, NewData),
	  ToSortList = lists:reverse(NRandList),
	  {NewRankList, NewLastValue} = update_rank(Max, SortKeys,
						    ToSortList),
	  NewRank = Rank#rank{list = NewRankList,
			      last_val = NewLastValue},
	  update_cache(NewRank),
	  {noreply, State}
    end;
handle_cast({exit_rank, Type, Id}, State) ->
    Rank = #rank{list = RankList} = get_cache(Type),
    case lists:keyfind(Id, 3, RankList) of
      false -> {noreply, State};
      _ ->
	  NewRankList = lists:keydelete(Id, 3, RankList),
	  update_cache(Rank#rank{list = NewRankList,
				 last_val = 0}),
	  {noreply, State}
    end;
handle_cast({nologin, Type, T}, State) ->
    case get_cache(Type) of
      Rank = #rank{list = RankList = [#rank_rc{} | _]} ->
	  OutTime = date:unixtime() - T,
	  NewRankList = [Rc
			 || Rc = #rank_rc{time = Time} <- RankList,
			    Time >= OutTime],
	  update_cache(Rank#rank{list = NewRankList});
      _ -> skip
    end,
    {noreply, State};
handle_cast({clear, Type}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrank_zone313, _,
       {__Levelrank_zone313, __Tracesrank_zone313}}
	  when __Levelrank_zone313 band 64 /= 0 orelse
		 __Tracesrank_zone313 /= [] ->
	  lager:do_log(info,
		       [{module, rank_zone}, {function, handle_cast},
			{line, 313}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("清空排行榜:~w", [Type]), none, 4096, 64,
		       __Levelrank_zone313, __Tracesrank_zone313, lager_event,
		       __Pidrank_zone313);
      _ -> ok
    end,
    Rank = get_cache(Type),
    NewRank = Rank#rank{list = []},
    update_cache(NewRank),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info(loop_gc, State) ->
    sys_gc:gc(self()),
    erlang:send_after(600000, self(), loop_gc),
    {noreply, State};
handle_info({save_to_ets, Type},
	    State = #state{type = ZoneType, zone = Zone}) ->
    erase({rank_timer, Type}),
    update_ets(get_cache(Type)),
    case ZoneType of
      1 ->
	  ets:insert_new(ets_name(Zone), {Type, date:unixtime()});
      2 ->
	  ets:insert_new(ets_name(Zone), {Type, date:unixtime()});
      _ -> ok
    end,
    {noreply, State};
handle_info(interval_check,
	    State = #state{type = 1, zone = Zone}) ->
    Now = date:unixtime(),
    IdList = ets:select(ets_name(Zone),
			[{{'$1', '$2'},
			  [{'>', {const, Now}, {'+', '$2', {'*', 60, 3}}}],
			  ['$1']}]),
    [begin
       RankRecord = get_cache(ClusterRankType),
       cluster_lib:cast({plat_group, RankType, PGroup},
			rank_mgr, info,
			[{sync_cluster_rank,
			  [RankType,
			   RankRecord#rank{type = RankType, ctime = Now}]}]),
       ets:delete(ets_name(Zone), ClusterRankType)
     end
     || {RankType, PGroup} = ClusterRankType <- IdList],
    erlang:send_after(60000 * 1, self(), interval_check),
    {noreply, State};
handle_info(interval_check,
	    State = #state{type = 2, zone = Zone}) ->
    Now = date:unixtime(),
    IdList = ets:select(ets_name(Zone),
			[{{'$1', '$2'},
			  [{'>', {const, Now}, {'+', '$2', {'*', 60, 1}}}],
			  ['$1']}]),
    [begin
       RankRecord = get_cache(RankType),
       cluster_dynamic_group:group_other_cast(1, rank_mgr,
					      info,
					      [{sync_cluster_rank,
						[RankType,
						 RankRecord#rank{type =
								     RankType,
								 ctime =
								     Now}]}]),
       ets:delete(ets_name(Zone), RankType)
     end
     || RankType <- IdList],
    erlang:send_after(60000 * 1, self(), interval_check),
    {noreply, State};
handle_info(sync_group_rank,
	    State = #state{type = 0}) ->
    case sys_env:get(cluster_dynamic_group_mode) of
      Mode when Mode =:= 1 orelse Mode =:= 2 ->
	  WorldLev = world_lev:get_world_lev(),
	  case cluster_dynamic_group:has_main(1) of
	    false -> ok;
	    _ when WorldLev < 80 -> ok;
	    _ ->
		RankTypes = [RankType
			     || RankType
				    <- [2, 3, 6, 18, 21, 22, 23, 24, 28, 31, 52,
					53, 54, 55, 1004, 1006, 1033],
				local_type_group_type(RankType) =/= 0,
				(cfg(RankType))#rank_cfg.zone =:=
				  get(zone_atom)],
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidrank_zone378, _,
		   {__Levelrank_zone378, __Tracesrank_zone378}}
		      when __Levelrank_zone378 band 128 /= 0 orelse
			     __Tracesrank_zone378 /= [] ->
		      lager:do_log(debug,
				   [{module, rank_zone},
				    {function, handle_info}, {line, 378},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("开始同步排行榜到小组跨服中:~w",
						 [RankTypes]),
				   none, 4096, 128, __Levelrank_zone378,
				   __Tracesrank_zone378, lager_event,
				   __Pidrank_zone378);
		  _ -> ok
		end,
		util:set_ms_timer(sync_group_rank,
				  util:rand(20000, 40000),
				  {sync_group_rank, RankTypes})
	  end;
      _ -> pass
    end,
    {noreply, State};
handle_info({sync_group_rank, [RankType | L]},
	    State = #state{type = 0}) ->
    #rank{list = List} = get_cache(RankType),
    [in_cross_rank(RankType, element(3, D),
		   element(#rank_rc.val1, D), D)
     || D <- List],
    util:set_timer(sync_group_rank, 10,
		   {sync_group_rank, L}),
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrank_zone395, _,
       {__Levelrank_zone395, __Tracesrank_zone395}}
	  when __Levelrank_zone395 band 64 /= 0 orelse
		 __Tracesrank_zone395 /= [] ->
	  lager:do_log(info,
		       [{module, rank_zone}, {function, terminate},
			{line, 395}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("关闭排行榜区:~w", [_State#state.zone]), none,
		       4096, 64, __Levelrank_zone395, __Tracesrank_zone395,
		       lager_event, __Pidrank_zone395);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

update_idx([], Idx, L) -> {Idx - 1, lists:reverse(L)};
update_idx([R = #rank_rc{} | T], Idx, L) ->
    update_idx(T, Idx + 1, [R#rank_rc{idx = Idx} | L]);
update_idx([I | T], Idx, L) ->
    update_idx(T, Idx + 1, [I | L]).

-spec update_cache(#rank{}) -> ok.

update_cache(Rank = #rank{type = Type, list = L}) ->
    Len = length(L),
    NewRank = Rank#rank{len = Len},
    put({rank, Type}, NewRank),
    case put({rank_timer, Type}, 1) of
      undefined ->
	  erlang:send_after(5000, self(), {save_to_ets, Type});
      _ -> skip
    end.

get_cache(Type) ->
    case get({rank, Type}) of
      undefined ->
	  Rank = rank_mgr:lookup(Type),
	  put({rank, Type}, Rank),
	  Rank;
      Rank -> Rank
    end.

ets_name(Zone) ->
    list_to_atom(lists:concat(["ets_rank_zone_", Zone])).

in_cross_rank(Type, Id, Value, Data) ->
    case local_type_group_type(Type) of
      0 -> pass;
      GroupType ->
	  #rank_cfg{min_val = MinVal} = cfg(GroupType),
	  WorldLev = world_lev:get_world_lev(),
	  case sys_env:get(cluster_dynamic_group_mode) of
	    1 when MinVal =< Value andalso WorldLev >= 80 ->
		cluster_dynamic_group:cast_main(1, rank_zone, cast,
						[GroupType,
						 {in_rank, GroupType, Id, Value,
						  Data}]);
	    2 when MinVal =< Value andalso WorldLev >= 80 ->
		cluster_dynamic_group:cast_main(1, rank_zone, cast,
						[GroupType,
						 {in_rank, GroupType, Id, Value,
						  Data}]);
	    _ -> pass
	  end
    end.

update_kv([], Data) -> Data;
update_kv([{Pos, Val} | T], Data) ->
    NewData = setelement(Pos, Data, Val),
    update_kv(T, NewData).

repair([], L) -> lists:reverse(L);
repair([I = #rank_rc{face_update_time = FaceUpdateTime,
		     face_file = FaceFile}
	| T],
       L)
    when is_integer(FaceFile) andalso
	   is_binary(FaceUpdateTime) ->
    repair(T,
	   [I#rank_rc{face_update_time = FaceFile,
		      face_file = FaceUpdateTime}
	    | L]);
repair([I | T], L) -> repair(T, [I | L]).


