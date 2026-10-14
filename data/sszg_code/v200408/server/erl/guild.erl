-file("src/mod/guild/guild.erl", 1).

-module(guild).

-lager_records([{violators_record, [id, name, lists]},
		{say_history, [id, clear_time, lists]},
		{say_frame_data,
		 [base_id, name, group, loss, is_panel, expire_type,
		  expire_time, overlap, attr]},
		{say_frame, [ver, base_id, expire_time]},
		{m_say, [ver, used, frames]},
		{say_subtitle_msg, [id, role_id, name, msg, time]},
		{say_subtitle_role, [pid, conn_pid, type]},
		{say_msg, [len, msg, tick]},
		{say_send,
		 [id, name, sex, career, lev, face_id, vip_lev, capacity,
		  head_bid, chat_bubble, msg_list, face_update_time,
		  face_file]},
		{say_mon,
		 [rid, srv_id, name, ctime, lev, vip_lev, msg, remark]},
		{map_data,
		 [bid, type, name, def_xy, min_lev, max_lev, condition,
		  relive, width, height, grid_x, grid_y, max_pre_layer,
		  start_type, is_single, unit_list, tile_res_list]},
		{map_grid, [map_pid, map_id, base_id, width, height]},
		{map,
		 [id, srv_id, base_id, res_id, pid, ctrl_pid, grid_info,
		  name, condition, num, max_pre_layer, width, height,
		  dynamic_block, layer_flag]},
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
		{guild_log, [key, list]}]).

-behaviour(gen_server).

-export([apply/3, sync_cache/2, update_element/2,
	 unset_timer/1, set_timer/5]).

-export([info/2, cast/2, call/2, start_link/2]).

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

-file("src/mod/guild/guild.erl", 18).

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

-file("src/mod/guild/guild.erl", 19).

-file("inc/map.hrl", 1).

-record(map,
	{id = 1  :: pos_integer(), srv_id = ""  :: bitstring(),
	 base_id = 1  :: pos_integer(),
	 res_id = 0  :: non_neg_integer(),
	 pid  :: undefined | pid(),
	 ctrl_pid  :: undefined | pid(),
	 grid_info = []  :: [{pid(), pos_integer()}],
	 name = ""  :: bitstring(), condition = []  :: list(),
	 num = 0  :: non_neg_integer(),
	 max_pre_layer = 20  :: pos_integer(),
	 width = 1  :: pos_integer(),
	 height = 1  :: pos_integer(),
	 dynamic_block = []  :: list(),
	 layer_flag = 0  :: non_neg_integer()}).

-record(map_grid,
	{map_pid  :: undefined | pid(),
	 map_id = 1  :: pos_integer(),
	 base_id = 1  :: pos_integer(),
	 width = 1  :: pos_integer(),
	 height = 1  :: pos_integer()}).

-record(map_data,
	{bid = 1  :: pos_integer(),
	 type = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(),
	 def_xy = {0, 0}  :: {pos_integer(), pos_integer()},
	 min_lev = 0  :: non_neg_integer(),
	 max_lev = 9999  :: non_neg_integer(),
	 condition = []  :: [tuple()], relive = []  :: [tuple()],
	 width = 1  :: pos_integer(),
	 height = 1  :: pos_integer(),
	 grid_x = 0  :: pos_integer(),
	 grid_y = 0  :: pos_integer(),
	 max_pre_layer = 60  :: pos_integer(),
	 start_type = 0  :: 0..1, is_single = 0  :: 0..1,
	 unit_list = []  :: [tuple()], tile_res_list = []}).

-file("src/mod/guild/guild.erl", 20).

-file("inc/say.hrl", 1).

-record(say_mon,
	{rid = 0  :: pos_integer(), srv_id = <<>>  :: binary(),
	 name = <<>>  :: bitstring(),
	 ctime = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(),
	 vip_lev = 0  :: non_neg_integer(),
	 msg = <<>>  :: binary(), remark = <<>>  :: binary()}).

-record(say_send,
	{id = {0, <<>>}, name = <<>>, sex = 0, career = 0,
	 lev = 0, face_id = 0, vip_lev = 0, capacity = 0,
	 head_bid = 0, chat_bubble = 0, msg_list = [],
	 face_update_time = 0, face_file = <<>>}).

-record(say_msg, {len = 0, msg = <<>>, tick = 0}).

-record(say_subtitle_role,
	{pid = 0  :: 0 | pid(), conn_pid = 0  :: 0 | pid(),
	 type = 0  :: integer()}).

-record(say_subtitle_msg,
	{id = 0  :: non_neg_integer(),
	 role_id = {0, <<>>}  ::
	     {non_neg_integer(), bitstring()},
	 name = <<>>  :: bitstring(), msg = <<>>  :: bitstring(),
	 time = 0  :: non_neg_integer()}).

-record(m_say, {ver = 1, used = 0, frames = []}).

-record(say_frame,
	{ver = 1, base_id = 0, expire_time = 0}).

-record(say_frame_data,
	{base_id = 0, name = <<>>, group = 0, loss = [],
	 is_panel = 0, expire_type = 0, expire_time = 0,
	 overlap = 0, attr = []}).

-record(say_history,
	{id = {0, <<>>}, clear_time = 0, lists = []}).

-record(violators_record,
	{id = {0, <<>>}, name = <<>>, lists = []}).

-file("src/mod/guild/guild.erl", 21).

-file("inc/log.hrl", 1).

-file("src/mod/guild/guild.erl", 22).

-spec sync_cache(#guild{}, true | false) -> ok.

sync_cache(G, true) when is_record(G, guild) ->
    guild_rank:in_rank(G), ets:insert(guild_list, G);
sync_cache(G, false) when is_record(G, guild) ->
    ets:insert(guild_list, G);
sync_cache(_G, _) -> skip.

-spec update_element(#guild{} | guild_id(),
		     list()) -> ok.

update_element(Guild = #guild{id = GuildId},
	       PosL = [Pos | _])
    when is_integer(Pos) ->
    update_element(GuildId,
		   [{P, element(P, Guild)} || P <- PosL]);
update_element(#guild{id = GuildId}, DataL) ->
    update_element(GuildId, DataL);
update_element(GuildId = {_, _},
	       DataL = [{_, _} | _]) ->
    ets:update_element(guild_list, GuildId, DataL);
update_element(_, _) -> ok.

-spec apply(T, Guild, Mfa) -> ok | {error, not_pid} |
			      {error, self_call} | Reply when T :: async | sync,
							      Guild :: pid() |
								       {non_neg_integer(),
									bitstring(),
									non_neg_integer()},
							      Mfa :: {F} |
								     {F, A} |
								     {M, F, A},
							      M :: atom(),
							      F :: function() |
								   atom(),
							      A :: list(),
							      Reply :: term().

apply(T, {GuildId, GSrvId}, Mfa) ->
    case guild_lib:pid({GuildId, GSrvId}) of
      {ok, GuildPid} -> guild:apply(T, GuildPid, Mfa);
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild57, _, {__Levelguild57, __Tracesguild57}}
		when __Levelguild57 band 8 /= 0 orelse
		       __Tracesguild57 /= [] ->
		lager:do_log(error,
			     [{module, guild}, {function, apply}, {line, 57},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("无法获取公会[~w,~s]的进程，无法执行[~w]",
					   [GuildId, GSrvId, Mfa]),
			     none, 4096, 8, __Levelguild57, __Tracesguild57,
			     lager_event, __Pidguild57);
	    _ -> ok
	  end,
	  {error, not_pid}
    end;
apply(async, all, Mfa) ->
    [guild:apply(async, GPid, Mfa)
     || {_, GPid} <- ets:tab2list(guild_pids)];
apply(async, GuildPid, _Mfa)
    when not is_pid(GuildPid) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild63, _, {__Levelguild63, __Tracesguild63}}
	  when __Levelguild63 band 8 /= 0 orelse
		 __Tracesguild63 /= [] ->
	  lager:do_log(error,
		       [{module, guild}, {function, apply}, {line, 63},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("公会回调使用非PID:~w，无法调用[~w]",
				     [GuildPid, _Mfa]),
		       none, 4096, 8, __Levelguild63, __Tracesguild63,
		       lager_event, __Pidguild63);
      _ -> ok
    end,
    ok;
apply(async, GuildPid, {F}) ->
    GuildPid ! {apply_async, {F}}, ok;
apply(async, GuildPid, {F, A}) ->
    GuildPid ! {apply_async, {F, A}}, ok;
apply(async, GuildPid, {M, F, A}) ->
    GuildPid ! {apply_async, {M, F, A}}, ok;
apply(sync, GuildPid, _Mfa) when not is_pid(GuildPid) ->
    {error, not_pid};
apply(sync, GuildPid, Mfa) when self() =:= GuildPid ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild77, _, {__Levelguild77, __Tracesguild77}}
	  when __Levelguild77 band 8 /= 0 orelse
		 __Tracesguild77 /= [] ->
	  lager:do_log(error,
		       [{module, guild}, {function, apply}, {line, 77},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("调用者[~w]执行apply[~w]时发生错误：调用了自身",
				     [util:get_stacktrace(), Mfa]),
		       none, 4096, 8, __Levelguild77, __Tracesguild77,
		       lager_event, __Pidguild77);
      _ -> ok
    end,
    {error, self_call};
apply(sync, GuildPid, {F}) ->
    case catch gen_server:call(GuildPid, {apply_sync, F},
			       10000)
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
	    {__Pidguild80, _, {__Levelguild80, __Tracesguild80}}
		when __Levelguild80 band 8 /= 0 orelse
		       __Tracesguild80 /= [] ->
		lager:do_log(error,
			     [{module, guild}, {function, apply}, {line, 80},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [GuildPid, {apply_sync, F}, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelguild80, __Tracesguild80,
			     lager_event, __Pidguild80);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end;
apply(sync, GuildPid, {F, A}) ->
    case catch gen_server:call(GuildPid,
			       {apply_sync, {F, A}}, 10000)
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
	    {__Pidguild82, _, {__Levelguild82, __Tracesguild82}}
		when __Levelguild82 band 8 /= 0 orelse
		       __Tracesguild82 /= [] ->
		lager:do_log(error,
			     [{module, guild}, {function, apply}, {line, 82},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [GuildPid, {apply_sync, {F, A}},
					    10000, erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelguild82, __Tracesguild82,
			     lager_event, __Pidguild82);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end;
apply(sync, GuildPid, {M, F, A}) ->
    case catch gen_server:call(GuildPid,
			       {apply_sync, {M, F, A}}, 10000)
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
	    {__Pidguild84, _, {__Levelguild84, __Tracesguild84}}
		when __Levelguild84 band 8 /= 0 orelse
		       __Tracesguild84 /= [] ->
		lager:do_log(error,
			     [{module, guild}, {function, apply}, {line, 84},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [GuildPid, {apply_sync, {M, F, A}},
					    10000, erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelguild84, __Tracesguild84,
			     lager_event, __Pidguild84);
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

info(Pid, Info) when is_pid(Pid) -> Pid ! Info;
info(_Pid, _Info) -> not_pid.

cast(Pid, Info) when is_pid(Pid) ->
    gen_server:cast(Pid, Info);
cast(_Pid, _Info) -> not_pid.

call(Pid, Info) when is_pid(Pid) ->
    case catch gen_server:call(Pid, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidguild95, _, {__Levelguild95, __Tracesguild95}}
		when __Levelguild95 band 8 /= 0 orelse
		       __Tracesguild95 /= [] ->
		lager:do_log(error,
			     [{module, guild}, {function, call}, {line, 95},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [Pid, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelguild95, __Tracesguild95,
			     lager_event, __Pidguild95);
	    _ -> ok
	  end,
	  case _Call_Err of
	    {timeout, _} -> {error, timeout};
	    {noproc, _} -> {error, noproc};
	    {normal, _} -> {error, exit};
	    _ -> {error, _Call_Err}
	  end;
      _Call_Return -> _Call_Return
    end;
call(_Pid, _Info) -> not_pid.

start_link(G = #guild{id = {Gid, GSrvId}}, Mode) ->
    LocalName = list_to_atom(lists:concat(["guild_", Gid,
					   "_", bitstring_to_list(GSrvId)])),
    gen_server:start_link({local, LocalName}, guild,
			  [G, Mode], []).

init([G = #guild{id = Gid, name = Gname, members = Mems,
		 leader_id = LeaderId, vice_leader_mail = Flag1,
		 normal_mail = Flag2},
      Mode]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild103, _, {__Levelguild103, __Tracesguild103}}
	  when __Levelguild103 band 64 /= 0 orelse
		 __Tracesguild103 /= [] ->
	  lager:do_log(info,
		       [{module, guild}, {function, init}, {line, 103},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 公会[~ts]正在启动:~w...",
				     [guild, Gname, Mode]),
		       none, 4096, 64, __Levelguild103, __Tracesguild103,
		       lager_event, __Pidguild103);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    [guild_member:add(RoleId, Gid)
     || #guild_member{id = RoleId} <- Mems],
    ets:insert(guild_pids, {Gid, self()}),
    Power = lists:sum([Power
		       || #guild_member{power = Power} <- Mems]),
    NewG = G#guild{pid = self(), cache = #guild_cache{},
		   sync = 0, power = Power},
    put(guild_loop_idx, 0),
    util:set_timer(loop_timer, util:rand(50, 100), loop),
    case lists:keyfind(LeaderId, #guild_member.id, Mems) of
      #guild_member{login_time = LoginTime, name = Name,
		    id = Id} ->
	  case Flag1 =:= 0 of
	    true ->
		set_timer(vice_leader_mail, LoginTime, Name, Id, 1, 0);
	    _ -> set_timer(vice_leader_mail, LoginTime, Name, Id, 1)
	  end,
	  case Flag2 =:= 0 of
	    true ->
		set_timer(normal_mail, LoginTime, Name, Id, 2, 0);
	    _ -> set_timer(normal_mail, LoginTime, Name, Id, 2)
	  end;
      _ -> skip
    end,
    sync_cache(NewG, true),
    case Mode of
      create -> log_http:guild_sync(NewG);
      _ -> skip
    end,
    guild:apply(async, self(),
		{guild_mem_red_packet, load, []}),
    guild:apply(async, self(), {guild_merge, load, []}),
    guild_marketplace:init_marketplace(Gid),
    erlang:send_after(10000, self(),
		      init_monopoly_dungeons),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild139, _, {__Levelguild139, __Tracesguild139}}
	  when __Levelguild139 band 64 /= 0 orelse
		 __Tracesguild139 /= [] ->
	  lager:do_log(info,
		       [{module, guild}, {function, init}, {line, 139},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 公会[~ts]启动完成", [guild, Gname]), none,
		       4096, 64, __Levelguild139, __Tracesguild139,
		       lager_event, __Pidguild139);
      _ -> ok
    end,
    {ok, NewG}.

unset_timer(Name) -> util:unset_timer(Name).

set_timer(Name, LoginTime, LeadName, LeadId, Type, 0) ->
    Now = date:unixtime(),
    case Type of
      1 ->
	  Time = LoginTime +
		   86400 * guild_data:get_const(impeach_offline_day1)
		   - Now,
	  case Time > 0 of
	    false ->
		util:set_timer(Name, 10, {Name, LeadName, LeadId});
	    _ ->
		util:set_timer(Name, Time, {Name, LeadName, LeadId})
	  end;
      _ ->
	  Time = LoginTime +
		   86400 * guild_data:get_const(impeach_offline_day2)
		   - Now,
	  case Time > 0 of
	    false ->
		util:set_timer(Name, 10, {Name, LeadName, LeadId});
	    _ ->
		util:set_timer(Name, Time, {Name, LeadName, LeadId})
	  end
    end.

set_timer(Name, LoginTime, LeadName, LeadId, Type) ->
    Now = date:unixtime(),
    case Type of
      1 ->
	  Time = LoginTime +
		   86400 * guild_data:get_const(impeach_offline_day1)
		   - Now,
	  case Time > 0 of
	    false -> skip;
	    _ ->
		util:set_timer(Name, Time, {Name, LeadName, LeadId})
	  end;
      _ ->
	  Time = LoginTime +
		   86400 * guild_data:get_const(impeach_offline_day2)
		   - Now,
	  case Time > 0 of
	    false -> skip;
	    _ ->
		util:set_timer(Name, Time, {Name, LeadName, LeadId})
	  end
    end.

handle_call({apply_sync, {F}}, _From, State) ->
    handle_apply_sync_return(catch erlang:apply(F, [State]),
			     {undefined, F, []}, State);
handle_call({apply_sync, {F, A}}, _From, State) ->
    handle_apply_sync_return(catch erlang:apply(F,
						[State | A]),
			     {undefined, F, A}, State);
handle_call({apply_sync, {M, F, A}}, _From, State) ->
    handle_apply_sync_return(catch erlang:apply(M, F,
						[State | A]),
			     {M, F, A}, State);
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({apply_async, {T, F}}, State)
    when is_integer(T) andalso is_tuple(F) ->
    erlang:send_after(T, self(), {apply_async, F}),
    {noreply, State};
handle_info({apply_async, {Min, Max, F}}, State)
    when is_integer(Min) andalso
	   is_integer(Max) andalso is_tuple(F) ->
    erlang:send_after(util:rand(Min, Max), self(),
		      {apply_async, F}),
    {noreply, State};
handle_info({apply_async, {Key, T, F}}, State)
    when is_integer(T) andalso is_tuple(F) ->
    util:set_ms_timer(Key, T, self(), {apply_async, F}),
    {noreply, State};
handle_info({apply_async, {F}}, State) ->
    handle_apply_async_return(catch erlang:apply(F,
						 [State]),
			      {undefined, F, []}, State);
handle_info({apply_async, {F, A}}, State) ->
    handle_apply_async_return(catch erlang:apply(F,
						 [State | A]),
			      {undefined, F, A}, State);
handle_info({apply_async, {M, F, A}}, State) ->
    handle_apply_async_return(catch erlang:apply(M, F,
						 [State | A]),
			      {M, F, A}, State);
handle_info({vice_leader_mail, LeadName, LeadId},
	    State = #guild{name = Name, members = Members,
			   vice_leader_mail = Flag1}) ->
    MembersId = [MId
		 || #guild_member{id = MId, post = Post} <- Members,
		    Post =:= 2],
    Msg1 =
	color:msg(lang:get(<<"亲爱的冒险者大人，您是~ts公会的副会长，您的会长~ts已经超过三天没有登录游戏了，您可以"
			     "发起对会长的弹劾，弹劾成功您将继任会长。"/utf8>>),
		  [{green, Name}, {name, LeadId, LeadName}]),
    Msg2 =
	lang:get(<<"<div fontsize=24 fontcolor=#289b14 href='mail"
		   "'> 点我前往</div>"/utf8>>),
    Content = <<Msg1/binary, Msg2/binary>>,
    mail:send(MembersId,
	      {lang:get(<<"可弹劾会长通知"/utf8>>), Content, [], [],
	       <<"可弹劾会长通知"/utf8>>, 86400 + date:unixtime()}),
    NewState = case Flag1 =:= 0 of
		 true -> State#guild{vice_leader_mail = 1};
		 _ -> State
	       end,
    {noreply, NewState};
handle_info({normal_mail, LeadName, LeadId},
	    State = #guild{name = Name, members = Members,
			   normal_mail = Flag2}) ->
    MembersId = [MId
		 || #guild_member{id = MId, post = Post} <- Members,
		    Post =:= 3],
    Msg1 =
	color:msg(lang:get(<<"亲爱的冒险者大人，您是~ts公会的成员，您的会长~ts已经超过七天没有登录游戏了，您可以发"
			     "起对会长的弹劾，弹劾成功您将继任会长。"/utf8>>),
		  [{green, Name}, {name, LeadId, LeadName}]),
    Msg2 =
	lang:get(<<"<div fontsize=24 fontcolor=#289b14 href='mail"
		   "'> 点我前往</div>"/utf8>>),
    Content = <<Msg1/binary, Msg2/binary>>,
    mail:send(MembersId,
	      {lang:get(<<"可弹劾会长通知"/utf8>>), Content, [], [],
	       <<"可弹劾会长通知"/utf8>>, 86400 + date:unixtime()}),
    NewState = case Flag2 =:= 0 of
		 true -> State#guild{normal_mail = 1};
		 _ -> State
	       end,
    {noreply, NewState};
handle_info({say, Msg, IsSave}, State) ->
    case IsSave of
      true ->
	  NewL = case util:get(guild_say_list, []) of
		   [_I1, I2, I3, I4, I5, I6, I7, I8, I9, I10] ->
		       [I2, I3, I4, I5, I6, I7, I8, I9, I10,
			{date:unixtime(), Msg}];
		   L -> L ++ [{date:unixtime(), Msg}]
		 end,
	  put(guild_say_list, NewL);
      _ -> skip
    end,
    guild_member:pack_send(State, all, 12761, Msg),
    {noreply, State};
handle_info({say_push, ConnPid}, State) ->
    To = date:unixtime() - 3600 * 6,
    case [{RInfo, Channel, Len, Msg, Time}
	  || {Time, {RInfo, Channel, Len, Msg, _}}
		 <- util:get(guild_say_list, []),
	     Time > To]
	of
      L = [_ | _] -> role:pack_send(ConnPid, 12766, {4, L});
      _ -> skip
    end,
    {noreply, State};
handle_info({del_say, {Rid, SrvId}}, State) ->
    NewL = [I
	    || I = {_XTime, {[R], _XChannel, _XLen, _XMsg}}
		   <- util:get(guild_say_list, []),
	       element(1, R) =/= Rid orelse element(2, R) =/= SrvId],
    put(guild_say_list, NewL),
    {noreply, State};
handle_info(loop, State = #guild{sync = Sync}) ->
    Idx = put(guild_loop_idx, get(guild_loop_idx) + 1),
    NewState = if Idx rem 3 =:= 2 -> update_power(State);
		  true -> State
	       end,
    NewSync = case Sync >= 2 of
		true ->
		    spawn(fun () -> guild_mgr:save(State) end),
		    sys_gc:gc(self()),
		    0;
		_ -> Sync
	      end,
    util:set_timer(loop_timer, 30, loop),
    {noreply, NewState#guild{sync = NewSync}};
handle_info({add_vitality, AddVal},
	    State = #guild{vitality = OldVal}) ->
    NewState = State#guild{vitality = OldVal + AddVal},
    sync_cache(NewState, false),
    {noreply, NewState};
handle_info(init_monopoly_dungeons,
	    State = #guild{id = Gid}) ->
    monopoly_dungeons:init_dungeons(Gid), {noreply, State};
handle_info({stop, Reason}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild308, _, {__Levelguild308, __Tracesguild308}}
	  when __Levelguild308 band 64 /= 0 orelse
		 __Tracesguild308 /= [] ->
	  lager:do_log(info,
		       [{module, guild}, {function, handle_info}, {line, 308},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("公会[~ts]接收到关闭信息:~w",
				     [State#guild.name, Reason]),
		       none, 4096, 64, __Levelguild308, __Tracesguild308,
		       lager_event, __Pidguild308);
      _ -> ok
    end,
    {stop, Reason, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State = #guild{}) ->
    catch ets:delete(guild_pids, _State#guild.id),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild316, _, {__Levelguild316, __Tracesguild316}}
	  when __Levelguild316 band 64 /= 0 orelse
		 __Tracesguild316 /= [] ->
	  lager:do_log(info,
		       [{module, guild}, {function, terminate}, {line, 316},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("公会[~ts]关闭:~w",
				     [_State#guild.name, _Reason]),
		       none, 4096, 64, __Levelguild316, __Tracesguild316,
		       lager_event, __Pidguild316);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

handle_apply_async_return({nosync, NewState}, _Mfa,
			  _State)
    when is_record(NewState, guild) ->
    {noreply, NewState};
handle_apply_async_return({ok, NewState}, _Mfa, _State)
    when is_record(NewState, guild) ->
    sync_cache(NewState, true), {noreply, NewState};
handle_apply_async_return({sync,
			   NewState = #guild{sync = Sync}},
			  _Mfa, _State) ->
    sync_cache(NewState, true),
    {noreply, NewState#guild{sync = Sync + 1}};
handle_apply_async_return(ok, _Mfa, State) ->
    {noreply, State};
handle_apply_async_return({stop, Reason, NewState},
			  _Mfa, _State)
    when is_record(NewState, guild) ->
    {stop, Reason, NewState};
handle_apply_async_return(Else, {M, F, A}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild336, _, {__Levelguild336, __Tracesguild336}}
	  when __Levelguild336 band 8 /= 0 orelse
		 __Tracesguild336 /= [] ->
	  lager:do_log(error,
		       [{module, guild}, {function, handle_apply_async_return},
			{line, 336}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("公会[~ts]执行{~w, ~w, ~w}时得到错误的返回值格式:~w",
				     [State#guild.name, M, F, A, Else]),
		       none, 4096, 8, __Levelguild336, __Tracesguild336,
		       lager_event, __Pidguild336);
      _ -> ok
    end,
    {noreply, State}.

handle_apply_sync_return({ok, Reply, NewState}, _Mfa,
			 _State)
    when is_record(NewState, guild) ->
    sync_cache(NewState, true), {reply, Reply, NewState};
handle_apply_sync_return({sync, Reply,
			  NewState = #guild{sync = Sync}},
			 _Mfa, _State) ->
    sync_cache(NewState, true),
    {reply, Reply, NewState#guild{sync = Sync + 1}};
handle_apply_sync_return({ok, Reply}, _Mfa, State) ->
    {reply, Reply, State};
handle_apply_sync_return({stop, Reason, Reply}, _Mfa,
			 State) ->
    {stop, Reason, Reply, State};
handle_apply_sync_return({stop, Reason, Reply,
			  NewState},
			 _Mfa, _State)
    when is_record(NewState, guild) ->
    {stop, Reason, Reply, NewState};
handle_apply_sync_return(Else, {M, F, A}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild353, _, {__Levelguild353, __Tracesguild353}}
	  when __Levelguild353 band 8 /= 0 orelse
		 __Tracesguild353 /= [] ->
	  lager:do_log(error,
		       [{module, guild}, {function, handle_apply_sync_return},
			{line, 353}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("公会[~ts]同步执行{~w, ~w, ~w}时得到错误的返回值格式:~w",
				     [State#guild.name, M, F, A, Else]),
		       none, 4096, 8, __Levelguild353, __Tracesguild353,
		       lager_event, __Pidguild353);
      _ -> ok
    end,
    {reply, Else, State}.

update_power(Guild = #guild{members = Members,
			    power = OldPower}) ->
    case erase(guild_member_update) of
      1 ->
	  case lists:sum([Power
			  || #guild_member{power = Power} <- Members])
	      of
	    OldPower -> Guild;
	    NewPower ->
		NewGuild = Guild#guild{power = NewPower},
		guild_rank:in_rank(NewGuild),
		update_element(NewGuild, [#guild.power]),
		NewGuild
	  end;
      _ -> Guild
    end.


