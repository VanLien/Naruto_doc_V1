-file("src/mod/replay_hall/replay_hall_file.erl", 1).

-module(replay_hall_file).

-lager_records([{combat_replay,
		 [ver, combat_type, combat_plays, info]},
		{replay_partner,
		 [id, pos, bid, lev, star, break_lev, power, hp, hp_max,
		  atk, def, speed, crit_rate, crit_ratio, hit_magic,
		  dodge_magic, hurt, behurt, curt, skills, eqms,
		  artifacts, ext]},
		{replay_stat, [id, like, share, play, collect]},
		{replay_info,
		 [id, combat_type, round, sec_type, a_rid, a_name, a_lev,
		  a_face, a_power, a_formation_type, a_camp_type,
		  a_hallow, a_rank, b_rid, b_name, b_lev, b_face, b_power,
		  b_formation_type, b_camp_type, b_hallow, b_rank,
		  a_plist, b_plist, ret, time, like, share, play, collect,
		  ext]},
		{replay,
		 [id, type, combat_type, sec_type, a_rid, a_cond_val,
		  a_power, a_lev, b_rid, b_cond_val, b_power, b_lev,
		  time]},
		{replay_role, [key, list]}]).

-export([load_file_data/1, load_combat_replay/1,
	 load_replay_info/1, save_replay_info/1,
	 save_combat_replay/2, del_replay_info/1,
	 del_combat_replay/1, combat_replay_path/2,
	 replay_info_path/2]).

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

-file("src/mod/replay_hall/replay_hall_file.erl", 18).

-file("inc/replay_hall.hrl", 1).

-record(replay_role, {key = {{0, <<>>}, 0}, list = []}).

-record(replay,
	{id = 0, type = 0, combat_type = 0, sec_type = 0,
	 a_rid = 0, a_cond_val = 0, a_power = 0, a_lev = 0,
	 b_rid = 0, b_cond_val = 0, b_power = 0, b_lev = 0,
	 time = 0}).

-record(replay_info,
	{id = 0, combat_type = 0, round = 0, sec_type = 0,
	 a_rid = {0, <<>>}, a_name = <<>>, a_lev = 0, a_face = 0,
	 a_power = 0, a_formation_type = 0, a_camp_type = 0,
	 a_hallow, a_rank = 0, b_rid = {0, <<>>}, b_name = <<>>,
	 b_lev = 0, b_face = 0, b_power = 0,
	 b_formation_type = 0, b_camp_type = 0, b_hallow,
	 b_rank = 0, a_plist = [], b_plist = [], ret = 0,
	 time = 0, like = 0, share = 0, play = 0, collect = 0,
	 ext = []}).

-record(replay_stat,
	{id = 0, like = 0, share = 0, play = 0, collect = 0}).

-record(replay_partner,
	{id = 0, pos = 0, bid = 0, lev = 0, star = 0,
	 break_lev = 0, power = 0, hp = 0, hp_max = 0, atk = 0,
	 def = 0, speed = 0, crit_rate = 0, crit_ratio = 0,
	 hit_magic = 0, dodge_magic = 0, hurt = 0, behurt = 0,
	 curt = 0, skills = [], eqms = [], artifacts = [],
	 ext = []}).

-file("src/mod/replay_hall/replay_hall_file.erl", 19).

-file("inc/combat_replay.hrl", 1).

-record(combat_replay,
	{ver = 1, combat_type, combat_plays = [], info}).

-file("src/mod/replay_hall/replay_hall_file.erl", 20).

-spec load_combat_replay(pos_integer()) -> {error,
					    any()} |
					   {ok, pos_integer(), binary()}.

load_combat_replay(ReplayId) ->
    File = combat_replay_path(ReplayId, false),
    case load_file_data(File) of
      {ok, <<CombatType:32, PlayBin/binary>>} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidreplay_hall_file28, _,
	     {__Levelreplay_hall_file28, __Tracesreplay_hall_file28}}
		when __Levelreplay_hall_file28 band 128 /= 0 orelse
		       __Tracesreplay_hall_file28 /= [] ->
		lager:do_log(debug,
			     [{module, replay_hall_file},
			      {function, load_combat_replay}, {line, 28},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("加载录像成功:~w", [ReplayId]), none, 4096,
			     128, __Levelreplay_hall_file28,
			     __Tracesreplay_hall_file28, lager_event,
			     __Pidreplay_hall_file28);
	    _ -> ok
	  end,
	  {ok, CombatType, PlayBin};
      Err -> Err
    end.

-spec load_replay_info(pos_integer() |
		       {pos_integer(), binary()}) -> {error, any()} |
						     {ok, #replay_info{}}.

load_replay_info(ReplayId) ->
    File = replay_info_path(ReplayId, false),
    case load_file_data(File) of
      {error, Reason} -> {error, Reason};
      {ok, Bin} ->
	  NewBin = zlib:uncompress(Bin),
	  case util:string_to_term(NewBin) of
	    {ok, Info = #replay_info{}} ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidreplay_hall_file45, _,
		   {__Levelreplay_hall_file45, __Tracesreplay_hall_file45}}
		      when __Levelreplay_hall_file45 band 128 /= 0 orelse
			     __Tracesreplay_hall_file45 /= [] ->
		      lager:do_log(debug,
				   [{module, replay_hall_file},
				    {function, load_replay_info}, {line, 45},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("加载录像信息成功:~w", [ReplayId]),
				   none, 4096, 128, __Levelreplay_hall_file45,
				   __Tracesreplay_hall_file45, lager_event,
				   __Pidreplay_hall_file45);
		  _ -> ok
		end,
		{ok, Info};
	    {error, Err} -> {error, Err};
	    _Err -> {error, _Err}
	  end
    end.

-spec load_file_data(string()) -> {error, any()} |
				  {ok, binary()}.

load_file_data(File) ->
    case file:read_file(File) of
      {error, Reason} -> {error, Reason};
      {ok, Bin} -> {ok, Bin}
    end.

-spec save_replay_info(#replay_info{}) -> true | false.

save_replay_info(ReplayInfo = #replay_info{id =
					       ReplayId}) ->
    File = replay_info_path(ReplayId, true),
    case filelib:is_file(File) of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidreplay_hall_file70, _,
	     {__Levelreplay_hall_file70, __Tracesreplay_hall_file70}}
		when __Levelreplay_hall_file70 band 8 /= 0 orelse
		       __Tracesreplay_hall_file70 /= [] ->
		lager:do_log(error,
			     [{module, replay_hall_file},
			      {function, save_replay_info}, {line, 70},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("录像信息文件已存在:~s", [File]), none, 4096,
			     8, __Levelreplay_hall_file70,
			     __Tracesreplay_hall_file70, lager_event,
			     __Pidreplay_hall_file70);
	    _ -> ok
	  end,
	  false;
      _ ->
	  Bin = util:term_to_binary(ReplayInfo),
	  NewBin = zlib:compress(Bin),
	  case file:write_file(File, NewBin) of
	    ok ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidreplay_hall_file77, _,
		   {__Levelreplay_hall_file77, __Tracesreplay_hall_file77}}
		      when __Levelreplay_hall_file77 band 128 /= 0 orelse
			     __Tracesreplay_hall_file77 /= [] ->
		      lager:do_log(debug,
				   [{module, replay_hall_file},
				    {function, save_replay_info}, {line, 77},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("保存录像信息成功:~w", [ReplayId]),
				   none, 4096, 128, __Levelreplay_hall_file77,
				   __Tracesreplay_hall_file77, lager_event,
				   __Pidreplay_hall_file77);
		  _ -> ok
		end,
		true;
	    _Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidreplay_hall_file80, _,
		   {__Levelreplay_hall_file80, __Tracesreplay_hall_file80}}
		      when __Levelreplay_hall_file80 band 8 /= 0 orelse
			     __Tracesreplay_hall_file80 /= [] ->
		      lager:do_log(error,
				   [{module, replay_hall_file},
				    {function, save_replay_info}, {line, 80},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("录像信息文件写入失败:~w err:~w ",
						 [ReplayId, _Err]),
				   none, 4096, 8, __Levelreplay_hall_file80,
				   __Tracesreplay_hall_file80, lager_event,
				   __Pidreplay_hall_file80);
		  _ -> ok
		end,
		false
	  end
    end.

-spec save_combat_replay(pos_integer(),
			 #combat_replay{}) -> true | false.

save_combat_replay(ReplayId,
		   #combat_replay{combat_plays = PlayBin,
				  combat_type = CombatType}) ->
    File = combat_replay_path(ReplayId, true),
    case filelib:is_file(File) of
      true ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidreplay_hall_file91, _,
	     {__Levelreplay_hall_file91, __Tracesreplay_hall_file91}}
		when __Levelreplay_hall_file91 band 8 /= 0 orelse
		       __Tracesreplay_hall_file91 /= [] ->
		lager:do_log(error,
			     [{module, replay_hall_file},
			      {function, save_combat_replay}, {line, 91},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("录像数据文件已存在:~s", [File]), none, 4096,
			     8, __Levelreplay_hall_file91,
			     __Tracesreplay_hall_file91, lager_event,
			     __Pidreplay_hall_file91);
	    _ -> ok
	  end,
	  false;
      _ ->
	  Bin = <<CombatType:32, PlayBin/binary>>,
	  case file:write_file(File, Bin) of
	    ok ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidreplay_hall_file97, _,
		   {__Levelreplay_hall_file97, __Tracesreplay_hall_file97}}
		      when __Levelreplay_hall_file97 band 128 /= 0 orelse
			     __Tracesreplay_hall_file97 /= [] ->
		      lager:do_log(debug,
				   [{module, replay_hall_file},
				    {function, save_combat_replay}, {line, 97},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("保存录像成功:~w", [ReplayId]), none,
				   4096, 128, __Levelreplay_hall_file97,
				   __Tracesreplay_hall_file97, lager_event,
				   __Pidreplay_hall_file97);
		  _ -> ok
		end,
		true;
	    _Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidreplay_hall_file100, _,
		   {__Levelreplay_hall_file100,
		    __Tracesreplay_hall_file100}}
		      when __Levelreplay_hall_file100 band 8 /= 0 orelse
			     __Tracesreplay_hall_file100 /= [] ->
		      lager:do_log(error,
				   [{module, replay_hall_file},
				    {function, save_combat_replay}, {line, 100},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("录像数据写入失败:~w err:~w ",
						 [ReplayId, _Err]),
				   none, 4096, 8, __Levelreplay_hall_file100,
				   __Tracesreplay_hall_file100, lager_event,
				   __Pidreplay_hall_file100);
		  _ -> ok
		end,
		false
	  end
    end.

-spec del_replay_info(pos_integer() | tuple()) -> ok |
						  {error, any()}.

del_replay_info(ReplayId) ->
    File = replay_info_path(ReplayId, false),
    file:delete(File).

-spec del_combat_replay(pos_integer()) -> ok |
					  {error, any()}.

del_combat_replay(ReplayId) ->
    File = combat_replay_path(ReplayId, false),
    file:delete(File).

-spec replay_info_path(pos_integer(),
		       true | false) -> string().

replay_info_path({Id, SrvId}, MakeDir) ->
    SId = integer_to_list(Id),
    id_to_dir(Id, SId, MakeDir) ++
      "/replay_info_" ++
	SId ++ "_" ++ binary_to_list(SrvId) ++ ".log";
replay_info_path(Id, MakeDir) ->
    SId = integer_to_list(Id),
    id_to_dir(Id, SId, MakeDir) ++
      "/replay_info_" ++ SId ++ ".log".

-spec combat_replay_path(pos_integer(),
			 true | false) -> string().

combat_replay_path(Id, MakeDir) ->
    SId = integer_to_list(Id),
    id_to_dir(Id, SId, MakeDir) ++
      "/combat_replay_" ++ SId ++ ".log".

id_to_dir(Id, SId, MakeDir) ->
    make_dir(MakeDir, "./combat_replay"),
    case sys_env:get(replay_new_mode_id) of
      StartId
	  when is_integer(StartId) andalso Id >= StartId ->
	  NewId = Id div 10000,
	  NewSId = integer_to_list(NewId),
	  do_id_to_dir(lists:reverse("00000" ++ NewSId), 2,
		       MakeDir, "./combat_replay");
      _ ->
	  do_id_to_dir(lists:reverse("00000" ++ SId), 3, MakeDir,
		       "./combat_replay")
    end.

do_id_to_dir(_, 0, _MakeDir, Dir) -> Dir;
do_id_to_dir([S1, S2 | T], N, MakeDir, Dir) ->
    NewDir = Dir ++ ["/", S2, S1],
    make_dir(MakeDir, NewDir),
    do_id_to_dir(T, N - 1, MakeDir, NewDir).

make_dir(true, Dir) ->
    case filelib:is_dir(Dir) of
      false -> file:make_dir(Dir);
      _ -> skip
    end;
make_dir(_, Dir) -> Dir.


