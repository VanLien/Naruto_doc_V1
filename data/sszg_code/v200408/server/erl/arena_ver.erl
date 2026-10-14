-file("src/mod/arena/arena_ver.erl", 1).

-module(arena_ver).

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
		  buy_combat_num, acc_combat_num, season_reward]}]).

-export([do/1]).

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

-file("src/mod/arena/arena_ver.erl", 10).

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

-file("src/mod/arena/arena_ver.erl", 11).

do(MArena = #m_arena{ref_list = RefList}) ->
    NewRefList = [do_arena_f_ver(I) || I <- RefList],
    {ok, MArena#m_arena{ref_list = NewRefList}}.

do_arena_f_ver({arena_f, Id, Name, Idx, Lev, Sex, Face,
		Power, Status, FormationType, FormationLev, PosInof,
		RobotId, AvatarId}) ->
    FaceUpdateTime = 0,
    FaceFile = <<>>,
    do_arena_f_ver({arena_f, Id, Name, Idx, Lev, Sex, Face,
		    Power, Status, FormationType, FormationLev, PosInof,
		    RobotId, AvatarId, FaceUpdateTime, FaceFile});
do_arena_f_ver({arena_f, Id, Name, Idx, Lev, Sex, Face,
		Power, Status, FormationType, FormationLev, PosInof,
		RobotId, AvatarId, FaceUpdateTime, FaceFile}) ->
    Gid = {0, <<>>},
    GName = <<>>,
    do_arena_f_ver({arena_f, Id, Name, Idx, Lev, Sex, Face,
		    Power, Status, FormationType, FormationLev, PosInof,
		    RobotId, AvatarId, FaceUpdateTime, FaceFile, Gid,
		    GName});
do_arena_f_ver(ArenaF = #arena_f{}) -> ArenaF.


