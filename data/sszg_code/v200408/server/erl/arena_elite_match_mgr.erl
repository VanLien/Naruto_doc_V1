-file("arena_elite_match_mgr.erl", 1).

-module(arena_elite_match_mgr).

-lager_records([{m_arena_elite_war_order,
		 [ver, period, period_day, end_time, win_count,
		  rmb_status, card, lev_reward, start_time, ext]},
		{arena_replay_partner, [pos, bid, lev, star, ext]},
		{arena_replay_info,
		 [id, round, ret, time, a_id, a_power, a_formation_type,
		  a_order, a_end_hp, b_id, b_power, b_formation_type,
		  b_order, b_end_hp, a_plist, b_plist, ext]},
		{arena_elite_log,
		 [id, atk_id, atk_name, atk_face, atk_lev, atk_rank,
		  atk_elite_lev, def_id, def_name, def_face, def_lev,
		  def_rank, def_elite_lev, ret, win_count, lose_count,
		  combat_type, replay_list, time, atk_face_update_time,
		  atk_face_file, def_face_update_time, def_face_file]},
		{role_arena_elite_log, [id, list]},
		{arena_elite_rank,
		 [ver, rank, id, name, power, lev, face, look_id, score,
		  elite_lev, time, avatar_id, face_update_time,
		  face_file]},
		{arena_partners_info,
		 [pos, id, bid, lev, star, break_lev, power, dower_skill,
		  set_skill, attr, extra]},
		{arena_elite_rival_defense,
		 [order, formation_type, hallows_id, hallows_lev,
		  hallows_skill_lev, partner_infos, hallows_look_id,
		  hallows_lucky, hallows_seal, hallows_all_look_ids,
		  extra]},
		{c_e_role,
		 [ver, id, name, power, lev, face, look_id, score,
		  elite_lev, avatar_id, is_king, match_power, all_star,
		  win_rio, zid, face_update_time, face_file]},
		{arena_elite_role,
		 [ver, id, name, lev, sex, gid, gname, face, power,
		  look_id, score, elite_lev, time, avatar_id, is_king,
		  defense, manifesto, face_update_time, face_file,
		  break_groups]},
		{c_elite_srv_info,
		 [type, sid, num, world_lev, open_time, merge_srvs]},
		{m_arena_elite_defens, [type, formations]},
		{m_arena_elite_log,
		 [ver, period, max_lev, max_score, combat_win_count1,
		  combat_all_count1, combat_win_count2, combat_all_count2,
		  max_dps, mvp_info, winning_streak, winning_streak_now,
		  beast_rivl_info, extra, log_zone_id, log_rank]},
		{arena_elite_role_best,
		 [id, name, lev, sex, gid, gname, face, power, look_id,
		  score, elite_lev, time, avatar_id, is_king, extra,
		  face_update_time, face_file]},
		{m_arena_elite,
		 [ver, lev, init_lev, period, score, day_combat_count,
		  day_buy_count, frist_ref_time, ref_count, match_cd_time,
		  had_combat_num, acc_combat_num, lev_reward,
		  last_combat_id, promoted_info, rival_info, defens,
		  old_rank, day_point_count, log, extra, last_reset_time,
		  max_day_buy_count, is_skip]},
		{state, []}]).

-behaviour(gen_server).

-export([info/1, cast/2, call/1, start_link/1]).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([do_open_match_pro/0, tab/1, do_match/1]).

-record(state, {}).

-file("/sszg_code/server/inc/common.hrl", 1).

-file("/sszg_code/server/inc/lib_log.hrl", 1).

-file("/sszg_code/server/inc/common.hrl", 112).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("arena_elite_match_mgr.erl", 17).

-file("/sszg_code/server/inc/arena_elite.hrl", 1).

-record(m_arena_elite,
	{ver = 6, lev = 1, init_lev = 1, period = 0, score = 0,
	 day_combat_count = 0, day_buy_count = 0,
	 frist_ref_time = 0, ref_count = 0, match_cd_time = 0,
	 had_combat_num = 0, acc_combat_num = 0, lev_reward = [],
	 last_combat_id = {0, <<>>}, promoted_info = [],
	 rival_info = [], defens = [], old_rank = [],
	 day_point_count = [], log = [], extra = [],
	 last_reset_time = 0, max_day_buy_count = 0,
	 is_skip = 0}).

-record(arena_elite_role_best,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = [],
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, extra = [],
	 face_update_time = 0, face_file = <<>>}).

-record(m_arena_elite_log,
	{ver = 2, period = 0, max_lev = 1, max_score = 1000,
	 combat_win_count1 = 0, combat_all_count1 = 0,
	 combat_win_count2 = 0, combat_all_count2 = 0,
	 max_dps = 0, mvp_info = [], winning_streak = 0,
	 winning_streak_now = 0,
	 beast_rivl_info = #arena_elite_role_best{}, extra = [],
	 log_zone_id = 0, log_rank = 0}).

-record(m_arena_elite_defens,
	{type = 1, formations = []}).

-record(c_elite_srv_info,
	{type = 1, sid = <<>>, num = 0, world_lev = 0,
	 open_time = 0, merge_srvs = []}).

-record(arena_elite_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 gid = {0, <<>>}, gname = <<>>, face = 0, power = 0,
	 look_id = 0, score = 0, elite_lev = 0, time = 0,
	 avatar_id = 0, is_king = 0, defense = [],
	 manifesto = [], face_update_time = 0, face_file = <<>>,
	 break_groups = []}).

-record(c_e_role,
	{ver = 4, id = {0, <<>>}, name = <<>>, power = 0,
	 lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, avatar_id = 0, is_king = 0,
	 match_power = 1, all_star = 1, win_rio = 1, zid = 1,
	 face_update_time = 0, face_file = <<>>}).

-record(arena_elite_rival_defense,
	{order, formation_type, hallows_id, hallows_lev,
	 hallows_skill_lev, partner_infos, hallows_look_id,
	 hallows_lucky, hallows_seal, hallows_all_look_ids = [],
	 extra = []}).

-record(arena_partners_info,
	{pos = 0, id = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, dower_skill = [],
	 set_skill = [], attr, extra = []}).

-record(arena_elite_rank,
	{ver = 2, rank = 0, id = {0, <<>>}, name = <<>>,
	 power = 0, lev = 0, face = 0, look_id = 0, score = 0,
	 elite_lev = 0, time = 0, avatar_id = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(role_arena_elite_log,
	{id = {0, <<>>}, list = []}).

-record(arena_elite_log,
	{id = 0, atk_id = {0, <<>>}, atk_name = <<>>,
	 atk_face = 0, atk_lev = 0, atk_rank = 0,
	 atk_elite_lev = 0, def_id = {0, <<>>}, def_name = <<>>,
	 def_face = 0, def_lev = 0, def_rank = 0,
	 def_elite_lev = 0, ret = 1, win_count = 0,
	 lose_count = 0, combat_type = 0, replay_list = [],
	 time = 0, atk_face_update_time = 0,
	 atk_face_file = <<>>, def_face_update_time = 0,
	 def_face_file = <<>>}).

-record(arena_replay_info,
	{id = 0, round = 0, ret = 0, time = 0, a_id = {0, <<>>},
	 a_power = 0, a_formation_type = 0, a_order = 0,
	 a_end_hp = 0, b_id = {0, <<>>}, b_power = 0,
	 b_formation_type = 0, b_order = 0, b_end_hp = 0,
	 a_plist = [], b_plist = [], ext = []}).

-record(arena_replay_partner,
	{pos = 0, bid = 0, lev = 0, star = 0, ext = []}).

-record(m_arena_elite_war_order,
	{ver = 2, period = 0, period_day = 0, end_time = 0,
	 win_count = 0, rmb_status = 0, card = [],
	 lev_reward = [], start_time = 0, ext = []}).

-file("arena_elite_match_mgr.erl", 18).

-file("/usr/local/lib/erlang/lib/stdlib-3.3/include/"
      "ms_transform.hrl",
      1).

-file("arena_elite_match_mgr.erl", 19).

do_open_match_pro() -> do_open_match_pro(20).

do_open_match_pro(0) -> ok;
do_open_match_pro(N) ->
    arena_elite_match_mgr:start_link(N),
    do_open_match_pro(N - 1).

tab(1) -> arena_elite_match_1;
tab(2) -> arena_elite_match_2;
tab(3) -> arena_elite_match_3;
tab(4) -> arena_elite_match_4;
tab(5) -> arena_elite_match_5;
tab(6) -> arena_elite_match_6;
tab(7) -> arena_elite_match_7;
tab(8) -> arena_elite_match_8;
tab(9) -> arena_elite_match_9;
tab(10) -> arena_elite_match_10;
tab(11) -> arena_elite_match_11;
tab(12) -> arena_elite_match_12;
tab(13) -> arena_elite_match_13;
tab(14) -> arena_elite_match_14;
tab(15) -> arena_elite_match_15;
tab(16) -> arena_elite_match_16;
tab(17) -> arena_elite_match_17;
tab(18) -> arena_elite_match_18;
tab(19) -> arena_elite_match_19;
tab(20) -> arena_elite_match_20;
tab(N) when N > 20 -> tab(N rem 20 + 1).

info(Info) -> arena_elite_match_mgr ! Info.

cast(Rid, Info) ->
    LoaclName = tab(Rid),
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_match_mgr60, _,
       {__Levelarena_elite_match_mgr60,
	__Tracesarena_elite_match_mgr60}}
	  when __Levelarena_elite_match_mgr60 band 128 /= 0 orelse
		 __Tracesarena_elite_match_mgr60 /= [] ->
	  lager:do_log(debug,
		       [{module, arena_elite_match_mgr}, {function, cast},
			{line, 60}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("===进程~w=====信息:~w", [LoaclName, Info]),
		       none, 4096, 128, __Levelarena_elite_match_mgr60,
		       __Tracesarena_elite_match_mgr60, lager_event,
		       __Pidarena_elite_match_mgr60);
      _ -> ok
    end,
    gen_server:cast(LoaclName, Info).

call(Info) ->
    case catch gen_server:call(arena_elite_match_mgr, Info,
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
	    {__Pidarena_elite_match_mgr65, _,
	     {__Levelarena_elite_match_mgr65,
	      __Tracesarena_elite_match_mgr65}}
		when __Levelarena_elite_match_mgr65 band 8 /= 0 orelse
		       __Tracesarena_elite_match_mgr65 /= [] ->
		lager:do_log(error,
			     [{module, arena_elite_match_mgr}, {function, call},
			      {line, 65}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("call_pid:~w req:~w timeout:~w get_stacktrace:~w",
					   [arena_elite_match_mgr, Info, 10000,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelarena_elite_match_mgr65,
			     __Tracesarena_elite_match_mgr65, lager_event,
			     __Pidarena_elite_match_mgr65);
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

start_link(Num) ->
    LocalName =
	list_to_atom(lists:concat(["arena_elite_match_", Num])),
    gen_server:start_link({local, LocalName},
			  arena_elite_match_mgr, [], []).

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_match_mgr72, _,
       {__Levelarena_elite_match_mgr72,
	__Tracesarena_elite_match_mgr72}}
	  when __Levelarena_elite_match_mgr72 band 64 /= 0 orelse
		 __Tracesarena_elite_match_mgr72 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_match_mgr}, {function, init},
			{line, 72}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [arena_elite_match_mgr]),
		       none, 4096, 64, __Levelarena_elite_match_mgr72,
		       __Tracesarena_elite_match_mgr72, lager_event,
		       __Pidarena_elite_match_mgr72);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidarena_elite_match_mgr75, _,
       {__Levelarena_elite_match_mgr75,
	__Tracesarena_elite_match_mgr75}}
	  when __Levelarena_elite_match_mgr75 band 64 /= 0 orelse
		 __Tracesarena_elite_match_mgr75 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_match_mgr}, {function, init},
			{line, 75}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [arena_elite_match_mgr]),
		       none, 4096, 64, __Levelarena_elite_match_mgr75,
		       __Tracesarena_elite_match_mgr75, lager_event,
		       __Pidarena_elite_match_mgr75);
      _ -> ok
    end,
    {ok, State}.

handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast({arena_elite, RolePid, LimitPower, MLev,
	     LimitScore, RoleId, IsKing, Round, LastId},
	    State) ->
    try ScoreRios =
	    arena_elite_data:get_macth_limit_score(MLev),
	MaxRound = length(ScoreRios),
	{_, MinScoreRio, MaxScoreRio} = list_util:keyfind(Round,
							  1, ScoreRios,
							  {Round, -1000,
							   100000}),
	LimitMinScore = trunc((1000 + MinScoreRio) * LimitPower
				* 1.0e-3),
	LimitMaxScore = trunc((1000 + MaxScoreRio) *
				max(LimitPower, 1)
				* 1.0e-3),
	LimitLev =
	    arena_elite_data:get_constant(open_person_lev_limit),
	RoleZid = arena_elite_mgr:get_zid(RoleId),
	case {whereis(lager_event), whereis(lager_event),
	      lager_config:get({lager_event, loglevel}, {0, []})}
	    of
	  {undefined, undefined, _} ->
	      fun () -> {error, lager_not_running} end();
	  {undefined, _, _} ->
	      fun () -> {error, {sink_not_configured, lager_event}}
	      end();
	  {__Pidarena_elite_match_mgr90, _,
	   {__Levelarena_elite_match_mgr90,
	    __Tracesarena_elite_match_mgr90}}
	      when __Levelarena_elite_match_mgr90 band 128 /= 0 orelse
		     __Tracesarena_elite_match_mgr90 /= [] ->
	      lager:do_log(debug,
			   [{module, arena_elite_match_mgr},
			    {function, handle_cast}, {line, 90},
			    {pid, pid_to_list(self())}, {node, node()}
			    | lager:md()],
			   io_lib:format("RoleId=~w=对手战力== Round=~w power = ~w "
					 "score=~w min_score=~w max_score=~w IsKing=~w",
					 [RoleId, Round, LimitPower, LimitScore,
					  LimitMinScore, LimitMaxScore,
					  IsKing]),
			   none, 4096, 128, __Levelarena_elite_match_mgr90,
			   __Tracesarena_elite_match_mgr90, lager_event,
			   __Pidarena_elite_match_mgr90);
	  _ -> ok
	end,
	Fun = [{{c_e_role, '_', '$1', '_', '$3', '$2', '_',
		 '$4', '$5', '$7', '_', '_', '$6', '_', '_', '$8', '_',
		 '_'},
		[{'andalso', {'=<', '$6', {const, LimitMaxScore}},
		  {'andalso', {'>=', '$6', {const, LimitMinScore}},
		   {'andalso', {'=/=', '$1', {const, RoleId}},
		    {'andalso', {'=/=', '$1', {const, LastId}},
		     {'andalso', {'>=', '$2', {const, LimitLev}},
		      {'==', {const, RoleZid}, '$8'}}}}}}],
		[{{'$1', '$3', '$5', '$7', '$4'}}]}],
	case ets:select(arena_elite_role, Fun, 20) of
	  {SelList = [_ | _], _} ->
	      {TarRoleId, TarPower, TarScore, TarLev, TarAvatarId} =
		  do_match2(MLev, LimitScore, SelList, 1),
	      role:apply(async, RolePid,
			 {arena_elite_lib, match_over,
			  [{TarRoleId, TarPower, TarScore, TarLev,
			    TarAvatarId}]}),
	      ok;
	  _ when Round > MaxRound ->
	      role:apply(async, RolePid,
			 {arena_elite_lib, match_over, [false2]}),
	      ok;
	  _ ->
	      gen_server:cast(self(),
			      {arena_elite, RolePid, LimitPower, MLev,
			       LimitScore, RoleId, IsKing, Round + 1, LastId})
	end
    catch
      Type:Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_match_mgr113, _,
	     {__Levelarena_elite_match_mgr113,
	      __Tracesarena_elite_match_mgr113}}
		when __Levelarena_elite_match_mgr113 band 8 /= 0 orelse
		       __Tracesarena_elite_match_mgr113 /= [] ->
		lager:do_log(error,
			     [{module, arena_elite_match_mgr},
			      {function, handle_cast}, {line, 113},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("=====match error=type:~w====Err:~w===stacktra"
					   "ce:~w==",
					   [Type, Err,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelarena_elite_match_mgr113,
			     __Tracesarena_elite_match_mgr113, lager_event,
			     __Pidarena_elite_match_mgr113);
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
	    {__Pidarena_elite_match_mgr114, _,
	     {__Levelarena_elite_match_mgr114,
	      __Tracesarena_elite_match_mgr114}}
		when __Levelarena_elite_match_mgr114 band 8 /= 0 orelse
		       __Tracesarena_elite_match_mgr114 /= [] ->
		lager:do_log(error,
			     [{module, arena_elite_match_mgr},
			      {function, handle_cast}, {line, 114},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("=====match error==~w==",
					   [{LimitPower, MLev, LimitScore,
					     RoleId, IsKing, Round}]),
			     none, 4096, 8, __Levelarena_elite_match_mgr114,
			     __Tracesarena_elite_match_mgr114, lager_event,
			     __Pidarena_elite_match_mgr114);
	    _ -> ok
	  end,
	  role:apply(async, RolePid,
		     {arena_elite_lib, match_over, [false2]})
    end,
    {noreply, State};
handle_cast({RolePid, LimitPower, MLev, LimitScore,
	     RoleId, IsKing, Round, LastId},
	    State) ->
    erlang:send_after(util:rand(3000, 5000), self(),
		      {RolePid, LimitPower, MLev, LimitScore, RoleId, IsKing,
		       Round, LastId}),
    {noreply, State};
handle_cast(_Msg, State) -> {noreply, State}.

handle_info({RolePid, LimitPower, MLev, LimitScore,
	     RoleId, IsKing, Round, LastId},
	    State) ->
    try RoleZid = arena_elite_mgr:get_zid(RoleId),
	case big_world_lib:is_link() of
	  true ->
	      case big_world_lib:call(center, arena_elite_match_mgr,
				      do_match,
				      [{RoleId, LimitPower, MLev, LimitScore,
					[], IsKing, Round, LastId, RoleZid}])
		  of
		{TarRoleId, TarPower, TarScore, TarLev, TarAvatarId} ->
		    role:apply(async, RolePid,
			       {arena_elite_lib, match_over,
				[{TarRoleId, TarPower, TarScore, TarLev,
				  TarAvatarId}]}),
		    ok;
		_ ->
		    role:apply(async, RolePid,
			       {arena_elite_lib, match_over, [false]}),
		    ok
	      end;
	  _ ->
	      case cluster_lib:is_link() of
		true ->
		    case cluster_lib:call(center, arena_elite_match_mgr,
					  do_match,
					  [{RoleId, LimitPower, MLev,
					    LimitScore, [], IsKing, Round,
					    LastId, RoleZid}])
			of
		      {TarRoleId, TarPower, TarScore, TarLev, TarAvatarId} ->
			  role:apply(async, RolePid,
				     {arena_elite_lib, match_over,
				      [{TarRoleId, TarPower, TarScore, TarLev,
					TarAvatarId}]}),
			  ok;
		      _ ->
			  role:apply(async, RolePid,
				     {arena_elite_lib, match_over, [false]}),
			  ok
		    end;
		_ ->
		    case do_local_match({RoleId, LimitPower, MLev,
					 LimitScore, IsKing, Round, LastId, [],
					 RoleZid})
			of
		      {TarRoleId, TarPower, TarScore, TarLev, TarAvatarId} ->
			  role:apply(async, RolePid,
				     {arena_elite_lib, match_over,
				      [{TarRoleId, TarPower, TarScore, TarLev,
					TarAvatarId}]}),
			  ok;
		      _ ->
			  role:apply(async, RolePid,
				     {arena_elite_lib, match_over, [false]}),
			  ok
		    end
	      end
	end
    catch
      Type:Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_match_mgr162, _,
	     {__Levelarena_elite_match_mgr162,
	      __Tracesarena_elite_match_mgr162}}
		when __Levelarena_elite_match_mgr162 band 8 /= 0 orelse
		       __Tracesarena_elite_match_mgr162 /= [] ->
		lager:do_log(error,
			     [{module, arena_elite_match_mgr},
			      {function, handle_info}, {line, 162},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("=====match error=type:~w====Err:~w===stacktra"
					   "ce:~w==",
					   [Type, Err,
					    erlang:get_stacktrace()]),
			     none, 4096, 8, __Levelarena_elite_match_mgr162,
			     __Tracesarena_elite_match_mgr162, lager_event,
			     __Pidarena_elite_match_mgr162);
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
	    {__Pidarena_elite_match_mgr163, _,
	     {__Levelarena_elite_match_mgr163,
	      __Tracesarena_elite_match_mgr163}}
		when __Levelarena_elite_match_mgr163 band 8 /= 0 orelse
		       __Tracesarena_elite_match_mgr163 /= [] ->
		lager:do_log(error,
			     [{module, arena_elite_match_mgr},
			      {function, handle_info}, {line, 163},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("=====匹配参数==~w==",
					   [{LimitPower, MLev, LimitScore,
					     RoleId, IsKing, Round, LastId}]),
			     none, 4096, 8, __Levelarena_elite_match_mgr163,
			     __Tracesarena_elite_match_mgr163, lager_event,
			     __Pidarena_elite_match_mgr163);
	    _ -> ok
	  end,
	  role:apply(async, RolePid,
		     {arena_elite_lib, match_over, [false]})
    end,
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
      {__Pidarena_elite_match_mgr172, _,
       {__Levelarena_elite_match_mgr172,
	__Tracesarena_elite_match_mgr172}}
	  when __Levelarena_elite_match_mgr172 band 64 /= 0 orelse
		 __Tracesarena_elite_match_mgr172 /= [] ->
	  lager:do_log(info,
		       [{module, arena_elite_match_mgr}, {function, terminate},
			{line, 172}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       "关闭完成", none, 4096, 64, __Levelarena_elite_match_mgr172,
		       __Tracesarena_elite_match_mgr172, lager_event,
		       __Pidarena_elite_match_mgr172);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

do_local_match({RoleId, MatchPower, MLev, LimitScore,
		IsKing, Round, LastId, MatchList, RoleZid}) ->
    ScoreRios =
	arena_elite_data:get_macth_limit_score(MLev),
    case Round > length(ScoreRios) of
      true -> do_match2(MLev, LimitScore, MatchList, 1);
      _ ->
	  {_, MinScoreRio, MaxScoreRio} = list_util:keyfind(Round,
							    1, ScoreRios,
							    {Round, -1000,
							     100000}),
	  LimitMinScore = trunc((1000 + MinScoreRio) * MatchPower
				  * 1.0e-3),
	  LimitMaxScore = trunc((1000 + MaxScoreRio) *
				  max(MatchPower, 1)
				  * 1.0e-3),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_match_mgr189, _,
	     {__Levelarena_elite_match_mgr189,
	      __Tracesarena_elite_match_mgr189}}
		when __Levelarena_elite_match_mgr189 band 128 /= 0
		       orelse __Tracesarena_elite_match_mgr189 /= [] ->
		lager:do_log(debug,
			     [{module, arena_elite_match_mgr},
			      {function, do_local_match}, {line, 189},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("RoleId=~w=对手战力== Round=~w power = ~w "
					   "score=~w min_score=~w max_score=~w IsKing=~w, "
					   "zid=~w",
					   [RoleId, Round, MatchPower,
					    LimitScore, LimitMinScore,
					    LimitMaxScore, IsKing, RoleZid]),
			     none, 4096, 128, __Levelarena_elite_match_mgr189,
			     __Tracesarena_elite_match_mgr189, lager_event,
			     __Pidarena_elite_match_mgr189);
	    _ -> ok
	  end,
	  LimitLev =
	      arena_elite_data:get_constant(open_person_lev_limit),
	  Fun = [{{c_e_role, '_', '$1', '_', '$4', '$3', '_',
		   '$5', '$6', '$8', '_', '$9', '$7', '_', '_', '$2', '_',
		   '_'},
		  [{'andalso', {'=<', '$7', {const, LimitMaxScore}},
		    {'andalso', {'>=', '$7', {const, LimitMinScore}},
		     {'andalso', {'==', '$9', {const, IsKing}},
		      {'andalso', {'=/=', '$1', {const, RoleId}},
		       {'andalso', {'=/=', '$1', {const, LastId}},
			{'andalso', {'>=', '$3', {const, LimitLev}},
			 {'==', {const, RoleZid}, '$2'}}}}}}}],
		  [{{'$1', '$4', '$6', '$8', '$5'}}]}],
	  case ets:select(arena_elite_role, Fun, 20) of
	    {MatchL = [_ | _], _} ->
		NewMatchList = MatchList ++ MatchL,
		case length(NewMatchList) >= 20 of
		  true -> do_match2(MLev, LimitScore, NewMatchList, 1);
		  _ ->
		      do_local_match({RoleId, MatchPower, MLev, LimitScore,
				      IsKing, Round + 1, LastId, NewMatchList,
				      RoleZid})
		end;
	    _ ->
		do_local_match({RoleId, MatchPower, MLev, LimitScore,
				IsKing, Round + 1, LastId, MatchList, RoleZid})
	  end
    end.

do_match({RoleId, MatchPower, MLev, LimitScore,
	  MatchList, IsKing, Round, LastId, RoleZid}) ->
    PowerRios =
	arena_elite_data:get_macth_limit_match_power(MLev),
    case Round > length(PowerRios) of
      true -> do_match2(MLev, LimitScore, MatchList, 2);
      _ ->
	  case Round > 5 of
	    true ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_elite_match_mgr225, _,
		   {__Levelarena_elite_match_mgr225,
		    __Tracesarena_elite_match_mgr225}}
		      when __Levelarena_elite_match_mgr225 band 64 /= 0 orelse
			     __Tracesarena_elite_match_mgr225 /= [] ->
		      lager:do_log(info,
				   [{module, arena_elite_match_mgr},
				    {function, do_match}, {line, 225},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("玩家~w匹配5轮未匹配到对手，MatchPower = ~w，MLev "
						 "= ~w, score=~w, IsKing=~w, RoleZid =~w, "
						 "匹配对手长度~w",
						 [RoleId, MatchPower, MLev,
						  LimitScore, IsKing, RoleZid,
						  length(MatchList)]),
				   none, 4096, 64,
				   __Levelarena_elite_match_mgr225,
				   __Tracesarena_elite_match_mgr225,
				   lager_event, __Pidarena_elite_match_mgr225);
		  _ -> ok
		end;
	    _ -> ok
	  end,
	  LimitLev =
	      arena_elite_data:get_constant(open_person_lev_limit),
	  {_, MinPowerRio, MaxPowerRio} = list_util:keyfind(Round,
							    1, PowerRios,
							    {Round, -1000,
							     100000}),
	  LimitMinMatchPower = trunc((1000 + MinPowerRio) *
				       MatchPower
				       * 1.0e-3),
	  LimitMaxMatchPower = trunc((1000 + MaxPowerRio) * 1.0e-3
				       * max(MatchPower, 1)),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_match_mgr234, _,
	     {__Levelarena_elite_match_mgr234,
	      __Tracesarena_elite_match_mgr234}}
		when __Levelarena_elite_match_mgr234 band 128 /= 0
		       orelse __Tracesarena_elite_match_mgr234 /= [] ->
		lager:do_log(debug,
			     [{module, arena_elite_match_mgr},
			      {function, do_match}, {line, 234},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("RoleId=~w=对手战力== Round=~w MatchPower "
					   "= ~w score=~w LimitMinMatchPower=~w "
					   "LimitMaxMatchPower=~w IsKing=~w",
					   [RoleId, Round, MatchPower,
					    LimitScore, LimitMinMatchPower,
					    LimitMaxMatchPower, IsKing]),
			     none, 4096, 128, __Levelarena_elite_match_mgr234,
			     __Tracesarena_elite_match_mgr234, lager_event,
			     __Pidarena_elite_match_mgr234);
	    _ -> ok
	  end,
	  TabLists = [c_arena_elite_mgr:tab(TabId)
		      || TabId <- util:shuffle(lists:seq(1, 20))],
	  DoFun = [{{c_e_role, '_', '$1', '_', '$4', '$3', '_',
		     '$5', '$7', '$8', '_', '$9', '$6', '_', '_', '$2', '_',
		     '_'},
		    [{'andalso', {'=<', '$6', {const, LimitMaxMatchPower}},
		      {'andalso', {'>=', '$6', {const, LimitMinMatchPower}},
		       {'andalso', {'==', '$9', {const, IsKing}},
			{'andalso', {'=/=', '$1', {const, RoleId}},
			 {'andalso', {'=/=', '$1', {const, LastId}},
			  {'andalso', {'>=', '$3', {const, LimitLev}},
			   {'==', {const, RoleZid}, '$2'}}}}}}}],
		    [{{'$1', '$4', '$7', '$8', '$5'}}]}],
	  case get_match_roles(MLev, LimitScore, DoFun, TabLists,
			       MatchList)
	      of
	    {IdT, PowerT, ScoreT, LevT, AvatarIdT} ->
		{IdT, PowerT, ScoreT, LevT, AvatarIdT};
	    L ->
		case length(L) >= 50 of
		  true -> do_match2(MLev, LimitScore, L, 2);
		  _ ->
		      do_match({RoleId, MatchPower, MLev, LimitScore, L,
				IsKing, Round + 1, LastId, RoleZid})
		end
	  end
    end.

get_match_roles(_MLev, _LimitScore, _DoFun, [],
		MatchList) ->
    MatchList;
get_match_roles(_MLev, _LimitScore, _DoFun, _,
		MatchList)
    when length(MatchList) >= 50 ->
    MatchList;
get_match_roles(MLev, LimitScore, DoFun,
		[TabName | TabLists], MatchList) ->
    case ets:select(TabName, DoFun, 50 - length(MatchList))
	of
      {L, _} ->
	  NewMatchList = MatchList ++ L,
	  ScoreRios =
	      arena_elite_data:get_macth_limit_score(MLev),
	  {_, MinScoreRio, MaxScoreRio} = list_util:keyfind(1, 1,
							    ScoreRios,
							    {1, -1000, 100000}),
	  LimitMinScore = trunc((1000 + MinScoreRio) * LimitScore
				  * 1.0e-3),
	  LimitMaxScore = trunc((1000 + MaxScoreRio) * 1.0e-3 *
				  max(LimitScore, 1)),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_match_mgr279, _,
	     {__Levelarena_elite_match_mgr279,
	      __Tracesarena_elite_match_mgr279}}
		when __Levelarena_elite_match_mgr279 band 128 /= 0
		       orelse __Tracesarena_elite_match_mgr279 /= [] ->
		lager:do_log(debug,
			     [{module, arena_elite_match_mgr},
			      {function, get_match_roles}, {line, 279},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("轮次~w===LimitScore = ~w LimitMinScore=~w "
					   "LimitMaxScore=~w===匹配列表长度~w",
					   [1, LimitScore, LimitMinScore,
					    LimitMaxScore,
					    length(NewMatchList)]),
			     none, 4096, 128, __Levelarena_elite_match_mgr279,
			     __Tracesarena_elite_match_mgr279, lager_event,
			     __Pidarena_elite_match_mgr279);
	    _ -> ok
	  end,
	  case [{Id, Power, Score, Lev, AvatarId}
		|| {Id, Power, Score, Lev, AvatarId} <- NewMatchList,
		   Score >= LimitMinScore andalso Score =< LimitMaxScore]
	      of
	    Temp = [_ | _] ->
		{IdT, PowerT, ScoreT, LevT, AvatarIdT} =
		    list_util:rand(Temp),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_elite_match_mgr283, _,
		   {__Levelarena_elite_match_mgr283,
		    __Tracesarena_elite_match_mgr283}}
		      when __Levelarena_elite_match_mgr283 band 128 /= 0
			     orelse __Tracesarena_elite_match_mgr283 /= [] ->
		      lager:do_log(debug,
				   [{module, arena_elite_match_mgr},
				    {function, get_match_roles}, {line, 283},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("匹配结果~w",
						 [{IdT, PowerT, ScoreT, LevT,
						   AvatarIdT}]),
				   none, 4096, 128,
				   __Levelarena_elite_match_mgr283,
				   __Tracesarena_elite_match_mgr283,
				   lager_event, __Pidarena_elite_match_mgr283);
		  _ -> ok
		end,
		{IdT, PowerT, ScoreT, LevT, AvatarIdT};
	    _ ->
		get_match_roles(MLev, LimitScore, DoFun, TabLists,
				NewMatchList)
	  end;
      _ ->
	  get_match_roles(MLev, LimitScore, DoFun, TabLists,
			  MatchList)
    end.

do_match2(MLev, LimitScore, MatchList, Round) ->
    ScoreRios =
	arena_elite_data:get_macth_limit_score(MLev),
    case Round > length(ScoreRios) of
      true -> list_util:rand(MatchList);
      _ ->
	  {_, MinScoreRio, MaxScoreRio} = list_util:keyfind(Round,
							    1, ScoreRios,
							    {Round, -1000,
							     100000}),
	  LimitMinScore = trunc((1000 + MinScoreRio) * LimitScore
				  * 1.0e-3),
	  LimitMaxScore = trunc((1000 + MaxScoreRio) * 1.0e-3 *
				  max(LimitScore, 1)),
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidarena_elite_match_mgr302, _,
	     {__Levelarena_elite_match_mgr302,
	      __Tracesarena_elite_match_mgr302}}
		when __Levelarena_elite_match_mgr302 band 128 /= 0
		       orelse __Tracesarena_elite_match_mgr302 /= [] ->
		lager:do_log(debug,
			     [{module, arena_elite_match_mgr},
			      {function, do_match2}, {line, 302},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("轮次~w===LimitScore = ~w LimitMinScore=~w "
					   "LimitMaxScore=~w===匹配列表长度~w",
					   [Round, LimitScore, LimitMinScore,
					    LimitMaxScore, length(MatchList)]),
			     none, 4096, 128, __Levelarena_elite_match_mgr302,
			     __Tracesarena_elite_match_mgr302, lager_event,
			     __Pidarena_elite_match_mgr302);
	    _ -> ok
	  end,
	  case [{Id, Power, Score, Lev, AvatarId}
		|| {Id, Power, Score, Lev, AvatarId} <- MatchList,
		   Score >= LimitMinScore andalso Score =< LimitMaxScore]
	      of
	    L = [_ | _] ->
		{IdT, PowerT, ScoreT, LevT, AvatarIdT} =
		    list_util:rand(L),
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidarena_elite_match_mgr307, _,
		   {__Levelarena_elite_match_mgr307,
		    __Tracesarena_elite_match_mgr307}}
		      when __Levelarena_elite_match_mgr307 band 128 /= 0
			     orelse __Tracesarena_elite_match_mgr307 /= [] ->
		      lager:do_log(debug,
				   [{module, arena_elite_match_mgr},
				    {function, do_match2}, {line, 307},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("匹配结果~w",
						 [{IdT, PowerT, ScoreT, LevT,
						   AvatarIdT}]),
				   none, 4096, 128,
				   __Levelarena_elite_match_mgr307,
				   __Tracesarena_elite_match_mgr307,
				   lager_event, __Pidarena_elite_match_mgr307);
		  _ -> ok
		end,
		{IdT, PowerT, ScoreT, LevT, AvatarIdT};
	    _ -> do_match2(MLev, LimitScore, MatchList, Round + 1)
	  end
    end.


