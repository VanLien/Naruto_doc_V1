-file("src/mod/arena/arena_log.erl", 1).

-module(arena_log).

-lager_records([{arena_pk_log,
		 [id, rid, name, lev, sex, face, avatar_id, power, type,
		  ret, replay_id, score, time, face_update_time,
		  face_file]},
		{arena_role_log, [id, logs]},
		{arena_rank, [rank, id, score]},
		{arena_role,
		 [id, name, lev, sex, gid, gname, face, power, max_power,
		  lookid, score, rank, time, avatar_id, champion_power,
		  face_update_time, face_file]},
		{arena_f_pos,
		 [pos, id, bid, lev, quality, star, break_lev, power,
		  speed, atk, def, hp, attr_ratio, ext]},
		{arena_f,
		 [id, name, idx, lev, sex, face, power, status,
		  formation_type, formation_lev, pos_info, robot_id,
		  avatar_id, face_update_time, face_file, gid, gname]},
		{m_arena,
		 [ver, ref_time, ref_list, cont_win, buff_id,
		  season_ref_time, can_combat_num, had_combat_num,
		  buy_combat_num, acc_combat_num, season_reward]},
		{state, []}]).

-behaviour(gen_server).

-export([info/1, cast/1, call/1, start_link/0,
	 async_exec/3, save_log/0]).

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

-file("src/mod/arena/arena_log.erl", 12).

-file("inc/arena.hrl", 1).

-record(m_arena,
	{ver = 1, ref_time = 0, ref_list = [], cont_win = 0,
	 buff_id = 0, season_ref_time = 0, can_combat_num = 0,
	 had_combat_num = 0, buy_combat_num = 0,
	 acc_combat_num = 0, season_reward = []}).

-record(arena_f,
	{id = {0, <<>>}, name = <<>>, idx = 0, lev = 0, sex = 0,
	 face = 0, power = 0, status = 0, formation_type = 0,
	 formation_lev = 0, pos_info = [], robot_id = 0,
	 avatar_id = 0, face_update_time = 0, face_file = <<>>,
	 gid = {0, <<>>}, gname = <<>>}).

-record(arena_f_pos,
	{pos = 0, id = 0, bid = 0, lev = 0, quality = 0,
	 star = 0, break_lev = 0, power = 0, speed = 0, atk = 0,
	 def = 0, hp = 0, attr_ratio = 1000, ext}).

-record(arena_role,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 max_power = 0, lookid = 0, score = 0, rank = 0,
	 time = 0, avatar_id = 0, champion_power = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(arena_rank,
	{rank = 0, id = {0, <<>>}, score = 0}).

-record(arena_role_log, {id = {0, <<>>}, logs = []}).

-record(arena_pk_log,
	{id = 0, rid = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, avatar_id = 0, power = 0, type = 1, ret = 1,
	 replay_id = 0, score = 0, time = 0,
	 face_update_time = 0, face_file = <<>>}).

-file("src/mod/arena/arena_log.erl", 13).

info(Info) -> arena_log ! Info.

cast(Info) -> gen_server:cast(arena_log, Info).

call(Info) ->
    case catch gen_server:call(arena_log, Info, 10000) of
      {'EXIT', _Call_Err} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_log22, _,
	     {__Levelarena_log22, __Tracesarena_log22}}
		when __Levelarena_log22 band 8 /= 0 orelse
		       __Tracesarena_log22 /= [] ->
		lager:do_log(error,
			     [{module, arena_log}, {function, call}, {line, 22},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [arena_log, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelarena_log22,
			     __Tracesarena_log22, lager_event,
			     __Pidarena_log22);
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

-spec save_log() -> ok.

save_log() ->
    dets:insert(arena_role_log,
		[Log
		 || Log = #arena_role_log{logs = Logs}
			<- ets:tab2list(arena_role_log),
		    Logs =/= []]).

-spec async_exec(atom(), atom(), list) -> ok.

async_exec(Mod, Fun, Args) ->
    info({async, Mod, Fun, Args}).

start_link() ->
    gen_server:start_link({local, arena_log}, arena_log, [],
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
      {__Pidarena_log38, _,
       {__Levelarena_log38, __Tracesarena_log38}}
	  when __Levelarena_log38 band 64 /= 0 orelse
		 __Tracesarena_log38 /= [] ->
	  lager:do_log(info,
		       [{module, arena_log}, {function, init}, {line, 38},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [arena_log]), none, 4096,
		       64, __Levelarena_log38, __Tracesarena_log38,
		       lager_event, __Pidarena_log38);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    d_ets_lib:new_d_ets(arena_role_log,
			"dets/arena_role_log.dets", #arena_role_log.id, set),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_log42, _,
       {__Levelarena_log42, __Tracesarena_log42}}
	  when __Levelarena_log42 band 64 /= 0 orelse
		 __Tracesarena_log42 /= [] ->
	  lager:do_log(info,
		       [{module, arena_log}, {function, init}, {line, 42},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [arena_log]), none, 4096, 64,
		       __Levelarena_log42, __Tracesarena_log42, lager_event,
		       __Pidarena_log42);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info({async, Fun, Mod, Args}, State) ->
    try apply(Fun, Mod, Args) catch
      X:T ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_log56, _,
	     {__Levelarena_log56, __Tracesarena_log56}}
		when __Levelarena_log56 band 8 /= 0 orelse
		       __Tracesarena_log56 /= [] ->
		lager:do_log(error,
			     [{module, arena_log}, {function, handle_info},
			      {line, 56}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("exec_fun:~w,~w, error:~w,~w",
					   [Fun, Mod, X, T]),
			     none, 4096, 8, __Levelarena_log56,
			     __Tracesarena_log56, lager_event,
			     __Pidarena_log56);
	    _ -> ok
	  end
    end,
    {noreply, State};
handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) ->
    dets:insert(arena_role_log,
		[Log
		 || Log = #arena_role_log{logs = Logs}
			<- ets:tab2list(arena_role_log),
		    Logs =/= []]),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_log65, _,
       {__Levelarena_log65, __Tracesarena_log65}}
	  when __Levelarena_log65 band 64 /= 0 orelse
		 __Tracesarena_log65 /= [] ->
	  lager:do_log(info,
		       [{module, arena_log}, {function, terminate}, {line, 65},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelarena_log65,
		       __Tracesarena_log65, lager_event, __Pidarena_log65);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.


