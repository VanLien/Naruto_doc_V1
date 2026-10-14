-file("src/mod/guild/guild_rank.erl", 1).

-module(guild_rank).

-lager_records([{rank_cfg,
		 [type, num, keys, min_val, nologin, zone, exit_rank]},
		{rank_rc,
		 [ver, id, idx, val1, val2, val3, rid, srv_id, name,
		  look_id, sex, lev, face_id, vip_lev, guild_name, power,
		  all_power, desc, looks, ext, time, is_cross, avatar_bid,
		  face_update_time, face_file]},
		{rank, [type, list, last_val, len, is_cross, ctime]},
		{g_mem_red_packet,
		 [id, rid, name, face_id, avatar_bid, post, type, num,
		  max_num, val, max_val, list, mems, start_time, end_time,
		  msg_id, face_update_time, face_file]},
		{guild_data, [lev, exp, num, maintain]},
		{guild_position, [id, name, limit]},
		{g_merge,
		 [gid, gname, gid2, gname2, role_id, rname, end_time,
		  gold]},
		{guild_rank,
		 [id, name, lev, exp, leader_name, leader_id,
		  leader_face, leader_lev, members_num, members_max,
		  apply_lev, apply_type, create_time, power, index,
		  leader_avatar_bid, leader_look_id,
		  leader_face_update_time, leader_face_file,
		  apply_power]},
		{guild_apply,
		 [gid, id, pid, name, face, lev, power, post, vip_lev,
		  online, apply_time, face_update_time, face_file]},
		{guild_member,
		 [ver, id, pid, name, face, lev, sex, power, post,
		  vip_lev, online, join_time, login_time, donate,
		  day_donate, avatar_bid, red_packet_num,
		  red_packet_price, red_packet_time, red_packet_recv_num,
		  red_packet_recv_time, active_lev, day_donate_type,
		  day_donate_time, day_dun_time, day_war_time, look_id,
		  face_update_time, face_file]},
		{guild_war_box,
		 [order, rid, sid, name, item_id, item_num]},
		{guild_cache, []},
		{guild,
		 [ver, id, name, lev, exp, day_exp, pid, leader_name,
		  leader_id, members, members_num, members_max, next_id,
		  sign, apply_lev, apply_type, recruit_num, cache, sync,
		  create_time, power, rename_time, lock_time, donate_exp,
		  red_packet, guild_war_box_end_time, guild_war_relust,
		  guild_war_box, guild_war_sign, day_var,
		  vice_leader_mail, normal_mail, vitality, apply_power]},
		{guild_bag,
		 [ver, id, pid, name, post, lev, join_time, quit_time,
		  send_time, send_num, recv_num, true_quit_time,
		  quit_post]},
		{guild_log_info,
		 [id, guild_id, type, time, role_id, role_name, msg]},
		{guild_log, [key, list]},
		{state, [last_time, rank_list]}]).

-behaviour(gen_server).

-export([get_rank_idx/1, get_rank_list_last_time/0,
	 get_rank_list/0, in_rank/1, exit_rank/1, exit_guild/2]).

-export([info/1, cast/1, call/1, start_link/0]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-record(state, {last_time = 0, rank_list = []}).

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

-file("src/mod/guild/guild_rank.erl", 20).

-file("inc/guild.hrl", 1).

-record(guild_log, {key = {0, <<>>}, list = []}).

-record(guild_log_info,
	{id = 0, guild_id = {0, <<>>}, type = 0, time = 0,
	 role_id = {0, <<>>}, role_name = 0, msg = <<>>}).

-record(guild_bag,
	{ver = 2, id = {0, <<>>}, pid, name = <<>>, post = 0,
	 lev = 0, join_time = 0, quit_time = 0, send_time = 0,
	 send_num = 0, recv_num = 0, true_quit_time = 0,
	 quit_post = 0}).

-record(guild,
	{ver = 7, id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 day_exp = 0, pid = 0, leader_name = <<>>,
	 leader_id = {0, <<>>}, members = [], members_num = 1,
	 members_max = 50, next_id = 1, sign = <<>>,
	 apply_lev = guild_data:get_const(guild_min_lev),
	 apply_type = 1, recruit_num = 0, cache, sync = 0,
	 create_time = 0, power = 0, rename_time = 0,
	 lock_time = 0, donate_exp = 0, red_packet = [],
	 guild_war_box_end_time = 0, guild_war_relust = 0,
	 guild_war_box = [], guild_war_sign = [], day_var = [],
	 vice_leader_mail = 0, normal_mail = 0, vitality = 0,
	 apply_power = 0}).

-record(guild_cache, {}).

-record(guild_war_box,
	{order = 0, rid = 0, sid = <<>>, name = <<>>,
	 item_id = 0, item_num = 0}).

-record(guild_member,
	{ver = 6, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, sex = 1, power = 0, post = 0,
	 vip_lev = 0, online = 1, join_time = 0, login_time = 0,
	 donate = 0, day_donate = 0, avatar_bid = 0,
	 red_packet_num = 0, red_packet_price = 0,
	 red_packet_time = 0, red_packet_recv_num = 0,
	 red_packet_recv_time = 0, active_lev = 0,
	 day_donate_type = 0, day_donate_time = 0,
	 day_dun_time = 0, day_war_time = 0, look_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(guild_apply,
	{gid = {0, <<>>}, id = {0, <<>>}, pid = 0, name = <<>>,
	 face = 0, lev = 0, power = 0, post = 0, vip_lev = 0,
	 online = 1, apply_time = 0, face_update_time = 0,
	 face_file = <<>>}).

-record(guild_rank,
	{id = {0, <<>>}, name = <<>>, lev = 1, exp = 0,
	 leader_name = <<>>, leader_id = {0, <<>>},
	 leader_face = 0, leader_lev = 0, members_num = 1,
	 members_max = 50, apply_lev = 0, apply_type = 1,
	 create_time = 0, power = 0, index = 0,
	 leader_avatar_bid = 0, leader_look_id = 0,
	 leader_face_update_time = 0, leader_face_file = <<>>,
	 apply_power = 0}).

-record(g_merge,
	{gid = {0, <<>>}, gname = <<>>, gid2 = {0, <<>>},
	 gname2 = <<>>, role_id = {0, <<>>}, rname = <<>>,
	 end_time = 0, gold = 0}).

-record(guild_position,
	{id = 0, name = <<>>, limit = []}).

-record(guild_data,
	{lev = 0, exp = 0, num = 0, maintain = 0}).

-record(g_mem_red_packet,
	{id = {{0, <<>>}, 0}, rid = {0, <<>>}, name = <<>>,
	 face_id = 0, avatar_bid = 0, post = <<>>, type = 0,
	 num = 0, max_num = 0, val = 0, max_val = 0, list = [],
	 mems = [], start_time = 0, end_time = 0, msg_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/mod/guild/guild_rank.erl", 21).

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

-file("src/mod/guild/guild_rank.erl", 22).

-spec get_rank_idx(guild_id()) -> non_neg_integer().

get_rank_idx(Gid) ->
    case ets:lookup(guild_rank, Gid) of
      [{_, Idx}] -> Idx;
      _ -> 0
    end.

get_rank_list_last_time() ->
    case call(get_rank_list_last_time) of
      {ok, T} -> T;
      _ -> 0
    end.

-spec get_rank_list() -> list().

get_rank_list() ->
    case call(get_rank_list) of
      {ok, _, RankList} -> RankList;
      _ -> []
    end.

-spec in_rank(#guild{}) -> ok.

in_rank(#guild{id = Gid, name = Gname, lev = Lev,
	       exp = Exp, leader_name = LeaderName,
	       leader_id = LeaderId, members_max = MembersMax,
	       members_num = MembersNum, create_time = CreateTime,
	       apply_lev = ApplyLev, apply_type = ApplyType,
	       power = Power, members = Members,
	       apply_power = ApplyPower}) ->
    M = #guild_member{face = Face, lev = RLev,
		      avatar_bid = AvatarId, look_id = LookId,
		      face_update_time = FaceUpdateTime,
		      face_file = FaceFile} =
	    lists:keyfind(LeaderId, #guild_member.id, Members),
    ets:insert(guild_leader,
	       {Gid,
		#{name => Gname, lev => Lev, power => Power,
		  leader => M}}),
    info({in_rank,
	  #guild_rank{id = Gid, name = Gname, lev = Lev,
		      exp = Exp, leader_name = LeaderName,
		      leader_id = LeaderId, members_max = MembersMax,
		      members_num = MembersNum, create_time = CreateTime,
		      apply_lev = ApplyLev, apply_type = ApplyType,
		      power = Power, leader_face = Face, leader_lev = RLev,
		      leader_avatar_bid = AvatarId, leader_look_id = LookId,
		      leader_face_update_time = FaceUpdateTime,
		      leader_face_file = FaceFile,
		      apply_power = ApplyPower}}).

-spec exit_rank(guild_id()) -> ok.

exit_rank(GuildId) -> info({exit_rank, GuildId}), ok.

-spec exit_guild(guild_id(), role_id()) -> ok.

exit_guild(_GuildId, _RoleId) -> ok.

info(Info) -> guild_rank ! Info.

cast(Info) -> gen_server:cast(guild_rank, Info).

call(Info) ->
    case catch gen_server:call(guild_rank, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild_rank72, _,
	     {__Levelguild_rank72, __Tracesguild_rank72}}
		when __Levelguild_rank72 band 8 /= 0 orelse
		       __Tracesguild_rank72 /= [] ->
		lager:do_log(error,
			     [{module, guild_rank}, {function, call},
			      {line, 72}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [guild_rank, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelguild_rank72,
			     __Tracesguild_rank72, lager_event,
			     __Pidguild_rank72);
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
    gen_server:start_link({local, guild_rank}, guild_rank,
			  [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_rank78, _,
       {__Levelguild_rank78, __Tracesguild_rank78}}
	  when __Levelguild_rank78 band 64 /= 0 orelse
		 __Tracesguild_rank78 /= [] ->
	  lager:do_log(info,
		       [{module, guild_rank}, {function, init}, {line, 78},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [guild_rank]), none, 4096,
		       64, __Levelguild_rank78, __Tracesguild_rank78,
		       lager_event, __Pidguild_rank78);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    State = #state{},
    ets:new(guild_rank,
	    [set, named_table, public, {keypos, 1}]),
    util:set_timer(zero, {0, 0, 0}, zero),
    util:set_timer(five, {5, 0, 0}, five),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_rank84, _,
       {__Levelguild_rank84, __Tracesguild_rank84}}
	  when __Levelguild_rank84 band 64 /= 0 orelse
		 __Tracesguild_rank84 /= [] ->
	  lager:do_log(info,
		       [{module, guild_rank}, {function, init}, {line, 84},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [guild_rank]), none, 4096,
		       64, __Levelguild_rank84, __Tracesguild_rank84,
		       lager_event, __Pidguild_rank84);
      _ -> ok
    end,
    {ok, State}.

handle_call(get_rank_list_last_time, _From,
	    State = #state{last_time = LastTime}) ->
    {reply, {ok, LastTime}, State};
handle_call(get_rank_list, _From,
	    State = #state{last_time = LastTime,
			   rank_list = RankList}) ->
    {reply, {ok, LastTime, RankList}, State};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(sync_group_rank, State) ->
    util:set_ms_timer(sync_group_rank,
		      util:rand(20000, 40000), do_sync_group_rank),
    {noreply, State};
handle_info(do_sync_group_rank,
	    State = #state{rank_list = RankList}) ->
    [in_cross_rank(G) || G <- RankList], {noreply, State};
handle_info({in_rank, G},
	    State = #state{rank_list = RankList}) ->
    NewRankList = add_to_rank(RankList, G, []),
    in_cross_rank(G),
    {noreply,
     State#state{rank_list = NewRankList,
		 last_time = date:unixtime()}};
handle_info({exit_rank, GuildId},
	    State = #state{rank_list = RankList}) ->
    NewRankList = set_rank_index(lists:keydelete(GuildId,
						 #guild_rank.id, RankList),
				 1, []),
    {noreply,
     State#state{rank_list = NewRankList,
		 last_time = date:unixtime()}};
handle_info(zero,
	    State = #state{rank_list = RankList}) ->
    Fun = fun ({_Gid, GPid}) ->
		  guild:apply(async, GPid,
			      {guild_handle, zero_update, [null]})
	  end,
    log_rank:save(RankList, 4),
    [Fun(I) || I <- ets:tab2list(guild_pids)],
    util:set_timer(zero, {0, 0, 0}, zero),
    {noreply, State};
handle_info(five, State) ->
    guild:apply(async, all,
		{guild_handle, five_update, []}),
    util:set_timer(five, {5, 0, 0}, five),
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
      {__Pidguild_rank141, _,
       {__Levelguild_rank141, __Tracesguild_rank141}}
	  when __Levelguild_rank141 band 64 /= 0 orelse
		 __Tracesguild_rank141 /= [] ->
	  lager:do_log(info,
		       [{module, guild_rank}, {function, terminate},
			{line, 141}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("关闭:~w", [_Reason]), none, 4096, 64,
		       __Levelguild_rank141, __Tracesguild_rank141,
		       lager_event, __Pidguild_rank141);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

add_to_rank([], G, L) ->
    NewL = lists:reverse([G | L]),
    set_rank_index(NewL, 1, []);
add_to_rank([#guild_rank{id = Gid} | T],
	    G = #guild_rank{id = Gid}, L) ->
    add_to_rank(T, G, L);
add_to_rank([G1 = #guild_rank{create_time = CreateTime1,
			      members_num = Num1, lev = Lev1, exp = Exp1,
			      power = Power1}
	     | T],
	    G = #guild_rank{id = Gid, create_time = CreateTime,
			    members_num = Num, lev = Lev, exp = Exp,
			    power = Power},
	    L) ->
    case {Lev1, Power1, Exp1, Num1, -CreateTime1} >=
	   {Lev, Power, Exp, Num, -CreateTime}
	of
      true -> add_to_rank(T, G, [G1 | L]);
      _ ->
	  NewL = [lists:reverse(L), G, G1 | lists:keydelete(Gid,
							    #guild_rank.id, T)],
	  set_rank_index(NewL, 1, [])
    end.

set_rank_index([], _Idx, L) -> lists:reverse(L);
set_rank_index([[] | T], Idx, L) ->
    set_rank_index(T, Idx, L);
set_rank_index([[G | T1] | T], Idx, L) ->
    ets:insert(guild_rank, {G#guild_rank.id, Idx}),
    set_rank_index([T1 | T], Idx + 1,
		   [G#guild_rank{index = Idx} | L]);
set_rank_index([G | T], Idx, L) ->
    ets:insert(guild_rank, {G#guild_rank.id, Idx}),
    set_rank_index(T, Idx + 1,
		   [G#guild_rank{index = Idx} | L]).

in_cross_rank(#guild_rank{id = Gid, name = Gname,
			  lev = Lev, leader_name = LeaderName,
			  leader_id = LeaderId, members_max = MembersMax,
			  members_num = MembersNum, create_time = CreateTime,
			  power = Power, leader_face = Face, leader_lev = RLev,
			  leader_avatar_bid = AvatarId,
			  leader_look_id = LookId}) ->
    RC = #rank_rc{id = Gid, guild_name = Gname, lev = Lev,
		  power = Power, val1 = Power, val2 = MembersNum,
		  val3 = MembersMax, time = CreateTime, face_id = Face,
		  avatar_bid = AvatarId, all_power = Power,
		  is_cross = true, rid = element(1, LeaderId),
		  srv_id = element(2, LeaderId), name = LeaderName,
		  ext = [#{rlev => RLev}], look_id = LookId},
    rank_zone:in_cross_rank(4, Gid, Lev, RC).


