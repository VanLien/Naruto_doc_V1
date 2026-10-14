-file("src/mod/guild_dun/guild_dun_ver.erl", 1).

-module(guild_dun_ver).

-lager_records([{m_guild_dun,
		 [var, formation_list, dps_list, first_list]},
		{guild_dun_rank_role,
		 [var, rank, r_id, name, boss_id, all_dps, avatar_bid,
		  lev, family_name, face_id, power, time, look_id,
		  face_update_time, face_file]},
		{guild_dun_rank_boss, [var, boss_id, list]},
		{guild_dun_rank_guild,
		 [var, rank, gid, name, r_name, max_id, time, day_dps,
		  leader_id]},
		{guild_dun_box, [var, boss_id, award_list]},
		{guild_dun,
		 [var, id, f_id, max_id, boss_list, box_award, rank_list,
		  unit_hp, buff_lev, buff_end_time, day_dps,
		  assemble_time]}]).

-export([do/1, dun_ver/1, do_boss/1]).

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

-file("src/mod/guild_dun/guild_dun_ver.erl", 13).

-file("inc/guild_dun.hrl", 1).

-record(guild_dun,
	{var = 2, id = {0, <<>>}, f_id = 0, max_id = 0,
	 boss_list = [], box_award = [], rank_list = [],
	 unit_hp = [], buff_lev = 0, buff_end_time = 0,
	 day_dps = 0, assemble_time = 0}).

-record(guild_dun_box,
	{var = 1, boss_id = 0, award_list = []}).

-record(guild_dun_rank_guild,
	{var = 1, rank = 0, gid = {0, <<>>}, name = <<>>,
	 r_name = <<>>, max_id = 0, time = 0, day_dps = 0,
	 leader_id = {0, <<>>}}).

-record(guild_dun_rank_boss, {var = 1, boss_id, list}).

-record(guild_dun_rank_role,
	{var = 3, rank = 0, r_id = {0, <<>>}, name = <<>>,
	 boss_id = 0, all_dps = 0, avatar_bid = 0,
	 lev = 0  :: non_neg_integer(),
	 family_name = <<>>  :: bitstring(),
	 face_id = 0  :: non_neg_integer(),
	 power = 0  :: non_neg_integer(), time = 0,
	 look_id = 0  :: pos_integer(), face_update_time = 0,
	 face_file = <<>>}).

-record(m_guild_dun,
	{var = 2, formation_list = [], dps_list = [],
	 first_list = []}).

-file("src/mod/guild_dun/guild_dun_ver.erl", 14).

do({m_guild_dun, Ver = 1, FormationList, DpsList}) ->
    NewVer = Ver + 1,
    FirstList = [],
    MGuildDun = {m_guild_dun, NewVer, FormationList,
		 DpsList, FirstList},
    do(MGuildDun);
do(MGuildDun = #m_guild_dun{var = 2}) ->
    {ok, MGuildDun};
do(MGuildDun) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_dun_ver26, _,
       {__Levelguild_dun_ver26, __Tracesguild_dun_ver26}}
	  when __Levelguild_dun_ver26 band 8 /= 0 orelse
		 __Tracesguild_dun_ver26 /= [] ->
	  lager:do_log(error,
		       [{module, guild_dun_ver}, {function, do}, {line, 26},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的旧数据:~w", [MGuildDun]), none, 4096, 8,
		       __Levelguild_dun_ver26, __Tracesguild_dun_ver26,
		       lager_event, __Pidguild_dun_ver26);
      _ -> ok
    end,
    {ok, MGuildDun}.

dun_ver({guild_dun, Var = 1, GId, FId, MaxId, BossList,
	 BoxAward, RankList, UnitHp, BuffLev, BuffEndTime,
	 DayDps}) ->
    NewVar = Var + 1,
    AssembleTime = 0,
    GuildDun = {guild_dun, NewVar, GId, FId, MaxId,
		BossList, BoxAward, RankList, UnitHp, BuffLev,
		BuffEndTime, DayDps, AssembleTime},
    dun_ver(GuildDun);
dun_ver(GuildDun = #guild_dun{var = 2}) ->
    {ok, GuildDun};
dun_ver(GuildDun) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_dun_ver37, _,
       {__Levelguild_dun_ver37, __Tracesguild_dun_ver37}}
	  when __Levelguild_dun_ver37 band 8 /= 0 orelse
		 __Tracesguild_dun_ver37 /= [] ->
	  lager:do_log(error,
		       [{module, guild_dun_ver}, {function, dun_ver},
			{line, 37}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的旧数据:~w", [GuildDun]), none, 4096, 8,
		       __Levelguild_dun_ver37, __Tracesguild_dun_ver37,
		       lager_event, __Pidguild_dun_ver37);
      _ -> ok
    end,
    {ok, GuildDun}.

do_boss(GuildDunRankBoss = #guild_dun_rank_boss{var = 1,
						list = List}) ->
    NewList = [do_rank_ver(RankRole) || RankRole <- List],
    {ok,
     GuildDunRankBoss#guild_dun_rank_boss{list = NewList}};
do_boss(GuildDunRankBoss) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidguild_dun_ver44, _,
       {__Levelguild_dun_ver44, __Tracesguild_dun_ver44}}
	  when __Levelguild_dun_ver44 band 8 /= 0 orelse
		 __Tracesguild_dun_ver44 /= [] ->
	  lager:do_log(error,
		       [{module, guild_dun_ver}, {function, do_boss},
			{line, 44}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的旧数据:~w", [GuildDunRankBoss]), none,
		       4096, 8, __Levelguild_dun_ver44,
		       __Tracesguild_dun_ver44, lager_event,
		       __Pidguild_dun_ver44);
      _ -> ok
    end,
    {ok, GuildDunRankBoss}.

do_rank_ver({guild_dun_rank_role, Var = 1, Rank, RId,
	     Name, BossId, AllDps, AvatarBid, Lev, FamilyName,
	     FaceId, Power, Time}) ->
    LookId = 0,
    do_rank_ver({guild_dun_rank_role, Var + 1, Rank, RId,
		 Name, BossId, AllDps, AvatarBid, Lev, FamilyName,
		 FaceId, Power, Time, LookId});
do_rank_ver({guild_dun_rank_role, Var = 2, Rank, RId,
	     Name, BossId, AllDps, AvatarBid, Lev, FamilyName,
	     FaceId, Power, Time, LookId}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    do_rank_ver({guild_dun_rank_role, Var + 1, Rank, RId,
		 Name, BossId, AllDps, AvatarBid, Lev, FamilyName,
		 FaceId, Power, Time, LookId, FaceUpdateTime, FaceFile});
do_rank_ver(GuildDunRankRole = #guild_dun_rank_role{var
							= 3}) ->
    GuildDunRankRole;
do_rank_ver(GuildDunRankRole) -> GuildDunRankRole.


