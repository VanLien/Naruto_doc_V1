-file("src/mod/game/game_lib.erl", 1).

-module(game_lib).

-lager_records([{assets,
		 [ver, exp, coin, silver_coin, gold, red_gold, gold_acc,
		  vip_exp, energy, energy_max, energy_time, activity,
		  guild, arena_cent, hero_soul, feat_point, triple_rebate,
		  friend_point, boss_point, star_hun, star_point,
		  arena_guesscent, sky_coin, hero_exp, recruit_hero,
		  recruithigh_hero, expedition_medal, elite_coin,
		  holy_eqm_coin, skin_debris, cluster_coin, home_coin,
		  hallow_refine, cluster_guess_cent, feather_exchange,
		  brave_symbol, peak_guess_cent, hero_soul_coin,
		  acc_recruit_hero, predict_point]}]).

-export([server_open_time/0, server_open_time/1,
	 server_mrg_time/0, server_mrg_time/1, get_platform/0,
	 get_server_id/0, pz_to_srvid/2, get_sid/0, get_sid/1,
	 srv_id_to_platform/1, is_same_plat_group/2,
	 is_same_plat_group/3, is_sy_channel/1, is_test/0,
	 is_ios_verify/0, is_ios_verify/1, is_ios_platform/1,
	 call_local_php/2, to_url_body_str/1, register_host/0,
	 get_assets/2, oss_url/0]).

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

-file("src/mod/game/game_lib.erl", 29).

-file("inc/assets.hrl", 1).

-file("inc/game_assets.hrl", 1).

-file("inc/assets.hrl", 12).

-record(assets,
	{ver = -1, exp = 0, coin = 0, silver_coin = 0, gold = 0,
	 red_gold = 0, gold_acc = 0, vip_exp = 0, energy = 0,
	 energy_max = 0, energy_time = 0, activity = 0,
	 guild = 0, arena_cent = 0, hero_soul = 0,
	 feat_point = 0, triple_rebate = 0, friend_point = 0,
	 boss_point = 0, star_hun = 0, star_point = 0,
	 arena_guesscent = 0, sky_coin = 0, hero_exp = 0,
	 recruit_hero = 0, recruithigh_hero = 0,
	 expedition_medal = 0, elite_coin = 0, holy_eqm_coin = 0,
	 skin_debris = 0, cluster_coin = 0, home_coin = 0,
	 hallow_refine = 0, cluster_guess_cent = 0,
	 feather_exchange = 0, brave_symbol = 0,
	 peak_guess_cent = 0, hero_soul_coin = 0,
	 acc_recruit_hero = 0, predict_point = 0}).

-file("src/mod/game/game_lib.erl", 30).

server_open_time() -> server_open_time(ms).

server_open_time(ms) -> sys_env:get(open_timestamp);
server_open_time(zero) ->
    sys_env:get(open_timestamp_zero);
server_open_time(datetime) ->
    sys_env:get(open_datetime);
server_open_time(day) ->
    OpenTime = server_open_time(ms),
    max(1,
	(date:unixtime(zero) - date:unixtime({zero, OpenTime}))
	  div 86400
	  + 1);
server_open_time(merge_day) ->
    case sys_env:get(merge_timestamp) of
      MergeT when is_integer(MergeT) andalso MergeT > 0 ->
	  max(1,
	      (date:unixtime(zero) - date:unixtime({zero, MergeT}))
		div 86400
		+ 1);
      _ -> -1
    end;
server_open_time(week) ->
    OpenTime = server_open_time(ms),
    max(1,
	(date:unixtime(zero) - date:unixtime({zero, OpenTime}))
	  div 86400
	  div 7
	  + 1);
server_open_time(native_week) ->
    {OpenDate, _} = server_open_time(datetime),
    {Y1, W1} = calendar:iso_week_number(OpenDate),
    {Y2, W2} = calendar:iso_week_number(),
    max(1, (Y2 - Y1) * 52 + (W2 - W1) + 1);
server_open_time(_Other) -> undefined.

get_assets(coin, #assets{coin = Val}) -> Val;
get_assets(gold, #assets{gold = Val}) -> Val;
get_assets(red_gold, #assets{red_gold = Val}) -> Val;
get_assets(arena_cent, #assets{arena_cent = Val}) ->
    Val;
get_assets(guild, #assets{guild = Val}) -> Val;
get_assets(hero_soul, #assets{hero_soul = Val}) -> Val;
get_assets(feat_point, #assets{feat_point = Val}) ->
    Val;
get_assets(friend_point, #assets{friend_point = Val}) ->
    Val;
get_assets(star_point, #assets{star_point = Val}) ->
    Val;
get_assets(sky_coin, #assets{sky_coin = Val}) -> Val;
get_assets(recruithigh_hero,
	   #assets{recruithigh_hero = Val}) ->
    Val;
get_assets(expedition_medal,
	   #assets{expedition_medal = Val}) ->
    Val;
get_assets(elite_coin, #assets{elite_coin = Val}) ->
    Val;
get_assets(_, _) -> 0.

-spec is_sy_channel(bitstring()) -> true | false.

is_sy_channel(<<"demo">>) -> true;
is_sy_channel(<<"release">>) -> true;
is_sy_channel(<<"10000">>) -> true;
is_sy_channel(Channel) when byte_size(Channel) =:= 4 ->
    true;
is_sy_channel(_) -> false.

is_same_plat_group(SysFlag, SrvId) ->
    is_same_plat_group(SysFlag, sys_lib:srv_id(), SrvId).

is_same_plat_group(SysFlag, SrvId1, SrvId2) ->
    cluster_data:get_group(SysFlag, SrvId1) =:=
      cluster_data:get_group(SysFlag, SrvId2).

get_platform() -> sys_env:get(platform).

get_server_id() -> sys_env:get(server_id).

get_sid() ->
    L = string_util:explode(get_server_id(), "_"),
    list_to_integer(lists:last(L)).

register_host() -> register_host(get_platform()).

register_host("release2") ->
    "regset-sszg.shiyuegame.com";
register_host("sy") -> "regset-sszg.shiyuegame.com";
register_host("sygame") -> "regset-sszg.shiyuegame.com";
register_host("sygame2") ->
    "regset-sszg.shiyuegame.com";
register_host("symlf") -> "regset-sszg.shiyuegame.com";
register_host("iosmlf") -> "regset-sszg.shiyuegame.com";
register_host("mix") -> "regset-sszg.shiyuegame.com";
register_host("symix") -> "regset-sszg.shiyuegame.com";
register_host("symix2") -> "regset-sszg.shiyuegame.com";
register_host("9377") -> "regset-sszg.shiyuegame.com";
register_host("9377ios") ->
    "regset-sszg.shiyuegame.com";
register_host("tanwan") -> "regset-sszg.shiyuegame.com";
register_host("icebird") ->
    "regset-sszg.shiyuegame.com";
register_host(_) -> undefined.

oss_url() ->
    case sys_env:get(flume_host_group) of
      1 -> "oss.api.shiyuegame.com";
      2 -> "oss.api.shiyuegame.com";
      10 -> "192.168.1.110";
      _ ->
	  case sys_env:get(platform) of
	    "local" -> "192.168.1.110";
	    _ -> "local.oss.api.shiyuegame.com:23000"
	  end
    end.

get_sid(SrvId) ->
    L = string_util:explode(SrvId, "_"),
    list_to_integer(lists:last(L)).

srv_id_to_platform(SrvId) ->
    case string_util:explode(binary_to_list(SrvId), "_") of
      [Platform | _] -> Platform;
      _ -> SrvId
    end.

pz_to_srvid(Plat, ZoneId) ->
    util:fbin(<<"~s_~w">>, [Plat, ZoneId]).

server_mrg_time() ->
    case server_mrg_time(s) of
      0 -> undefined;
      MrgTime -> MrgTime
    end.

server_mrg_time(s) -> sys_env:get(merge_timestamp);
server_mrg_time(datetime) ->
    sys_env:get(merge_datetime);
server_mrg_time(day) ->
    case server_mrg_time(s) of
      0 -> undefined;
      MrgTime ->
	  (date:unixtime(zero) - date:unixtime({zero, MrgTime}))
	    div 86400
	    + 1
    end;
server_mrg_time(week) ->
    case server_mrg_time(s) of
      0 -> undefined;
      MrgTime ->
	  (date:unixtime(zero) - date:unixtime({zero, MrgTime}))
	    div 86400
	    div 7
	    + 1
    end;
server_mrg_time({today, s}) ->
    date:unixtime({zero, server_mrg_time(s)});
server_mrg_time(_Other) -> undefined.

is_test() ->
    case get_platform() of
      "uc" -> true;
      "test" -> true;
      _ -> false
    end.

is_ios_verify() -> is_ios_verify(get_platform()).

is_ios_verify("verifyios") -> true;
is_ios_verify(<<"verifyios">>) -> true;
is_ios_verify(_) -> false.

is_ios_platform(<<"ewanios">>) -> true;
is_ios_platform(_Platform) ->
    case sys_env:get(platform) of
      "ewanios" -> true;
      _ -> false
    end.

call_local_php(Path, Arg) when is_list(Arg) ->
    Body = to_url_body_str(Arg),
    call_local_php_1(Path, Body);
call_local_php(Path, Body) when is_binary(Body) ->
    call_local_php_1(Path, Body).

call_local_php_1(Path, Body) ->
    Host = sys_env:get(host),
    Url = binary_to_list(util:format("http://~s/~s",
				     [Host, Path])),
    case catch httpc:request(post,
			     {Url, [], "application/x-www-form-urlencoded",
			      Body},
			     [{timeout, 5000}], [])
	of
      {ok, {_StatusLine, _Headers, _RtnBody}} ->
	  {ok, {_StatusLine, _Headers, _RtnBody}};
      {error, _Reason} ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidgame_lib244, _,
	     {__Levelgame_lib244, __Tracesgame_lib244}}
		when __Levelgame_lib244 band 8 /= 0 orelse
		       __Tracesgame_lib244 /= [] ->
		lager:do_log(error,
			     [{module, game_lib}, {function, call_local_php_1},
			      {line, 244}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("登陆接口提交异常~w", [_Reason]), none, 4096,
			     8, __Levelgame_lib244, __Tracesgame_lib244,
			     lager_event, __Pidgame_lib244);
	    _ -> ok
	  end,
	  {error, _Reason};
      Any ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidgame_lib247, _,
	     {__Levelgame_lib247, __Tracesgame_lib247}}
		when __Levelgame_lib247 band 8 /= 0 orelse
		       __Tracesgame_lib247 /= [] ->
		lager:do_log(error,
			     [{module, game_lib}, {function, call_local_php_1},
			      {line, 247}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("登陆接口提交异常~w", [Any]), none, 4096, 8,
			     __Levelgame_lib247, __Tracesgame_lib247,
			     lager_event, __Pidgame_lib247);
	    _ -> ok
	  end,
	  {error, bad_call}
    end.

to_url_body_str(List) ->
    to_url_body_str(lists:keysort(1, List), []).

to_url_body_str([], List) ->
    unicode:characters_to_binary(lists:reverse(List));
to_url_body_str([{Key, Val} | T], []) ->
    to_url_body_str(T,
		    [[to_string(Key), "=", to_string(Val)]]);
to_url_body_str([{Key, Val} | T], L) ->
    to_url_body_str(T,
		    [["&", to_string(Key), "=", to_string(Val)] | L]).

to_string(Val) when is_float(Val) ->
    float_to_list(Val, [{decimals, 2}, compact]);
to_string(Val) -> string_util:to_string(Val).


