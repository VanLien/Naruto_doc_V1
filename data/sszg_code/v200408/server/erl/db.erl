-file("src/db/db.erl", 1).

-module(db).

-lager_records([{map_role,
		 [pid, rid, srv_id, name, conn_pid, map, grid_pid, speed,
		  x, y, dir, gx, gy, status, event, label, lev, sex,
		  career, face, fc, avatar, looks]},
		{role_robot,
		 [id, account, platform, zone_id, channel, name, gid,
		  gname, lev, power, sex, career, face_id, face_file,
		  face_update_time, avatar_bid, avatar_frames, say_frames,
		  vip_lev, pos_info, partners, m_formation, sign, city,
		  max_dun_id, m_star, auto_pk, m_hallows, max_star_tower,
		  elite_lev, is_show_vip, arena_elite_defens, m_halidom,
		  m_guild_skill, arena_elite_manifesto,
		  arena_cluster_formation, city_id, honor, honor_badges,
		  honor_point, use_badges, fanse_list, grow_info,
		  room_bbs_set, backdrop_id, is_open_home, soft,
		  max_power, m_resonate_lev, m_sprite_tree,
		  m_arena_peak_champion, look_id, holiday_nian_face]},
		{role,
		 [ver, id, need_sync, loop_counter, type, pid, link,
		  reg_ip, reg_time, trigger, status, s_event, s_event_pid,
		  combat_pid, combat_replay_pid, combat_type_list,
		  ui_combat_type, play_speed, is_in_backstage, is_auto,
		  is_gain, is_ready, is_online, device_type, getui_cid,
		  channel, reg_channel, idfa, reg_idfa, device_id,
		  reg_device_id, os_name, reg_os_name, app_name,
		  reg_app_name, package_name, reg_package_name,
		  package_ver, reg_package_ver, os_ver, carrier_name,
		  net_type, resolution, platform, zone_id, account, name,
		  s_name, career, lev, uplev_time, sex, face_id,
		  face_list, hp, mspd, power, max_power, max_power_time,
		  arena_power, arena_max_power, arena_max_power_time,
		  banned_time, interdict_time, capacity, identity,
		  data_lock, timer, item_next_id, signature, city, assets,
		  pos, game_set, s_looks, login, misc, guild_bag,
		  surface_bag, partner_bag, m_look, m_charge, m_vip,
		  m_var, m_quest, m_drama, m_friend, m_mail, m_formation,
		  m_arena, m_feat, m_checkin, m_exchange, m_buff,
		  m_avatar, m_say, m_dungeon, m_boss, m_recruit, m_honor,
		  m_adventure, m_lev_gift, m_power_gift, m_star,
		  m_star_tower, m_market_silver, m_wish, m_login_days,
		  m_month_card, m_guild_dun, m_star_divination,
		  m_guild_skill, m_media_card_type, m_endless, m_dial,
		  m_days_ranks, m_escort, m_dun_stone, m_hallows,
		  m_day_goals, m_guild_quest, m_recruit_award,
		  m_sky_ladder, m_convert, m_shipping, m_expedition,
		  m_star_gift, holiday_assets, m_privilege, m_month_fund,
		  m_lanterm_festival, m_lanterm_adventure, m_invite_code,
		  misc_ext, m_arena_elite, arena_elite_power,
		  arena_elite_power_time, m_element_temple, m_halidom,
		  m_holiday_dial, arena_elite_max_star, m_break_egg,
		  m_welfare, m_dun_heaven, m_holiday_boss, m_war_order,
		  m_holiday_holy, m_week_card, m_holy_eqm_set,
		  m_arena_cluster, m_holiday_snatch, m_holiday_accumulate,
		  m_room, m_room_feat, m_holiday_boss_new,
		  m_holiday_return_feat, m_holiday_return_sign,
		  m_holiday_return, m_room_grow, m_lanterm_adventure1,
		  m_lanterm_adventure2, m_lanterm_adventure3, m_home,
		  m_home_pet, pet_bag, backdrop_id, backdrop_list,
		  m_holiday_predict, m_holiday_personal_gift, m_resonate,
		  m_resonate_extract, m_sprite_hatch, m_sprite_tree,
		  m_holiday_term_begins, m_holiday_petard, m_encounter,
		  m_holiday_merge_goal, m_arena_team, m_monopoly_maps,
		  m_training_camp, m_weekly, m_arena_peak_champion,
		  m_arena_elite_war_order, m_holiday_fire_gift,
		  m_holiday_personal_fire_gift, m_secret_dun,
		  m_holiday_return_new, m_holiday_charge_rebate,
		  m_holiday_charge_reset, m_holiday_optional_lottery,
		  m_holiday_lucky_dog, m_holiday_nian,
		  m_holiday_time_award, m_holiday_valentines, m_planes,
		  m_planes_war_order, m_new_war_order, m_face,
		  m_subscriber, m_holiday_dime, m_holiday_valentine_boss,
		  m_personal_push, m_holiday_new_week_card,
		  m_holiday_arena_team, m_holiday_practise_tower, p_bag,
		  p_eqm, p_home]},
		{result_packet, [seq_num, field_list, rows, extra]},
		{eof_packet, [seq_num, status, warning_count]},
		{error_packet, [seq_num, code, status, msg]},
		{ok_packet,
		 [seq_num, affected_rows, insert_id, status,
		  warning_count, msg]},
		{packet, [size, seq_num, data]},
		{field,
		 [seq_num, catalog, db, table, org_table, name, org_name,
		  type, default, charset_nr, length, flags, decimals]},
		{greeting,
		 [protocol_version, server_version, thread_id, salt1,
		  salt2, caps, caps_high, language, status, seq_num,
		  plugin]},
		{emysql_connection,
		 [id, pool_id, encoding, socket, version, thread_id,
		  caps, language, prepared, locked_at, alive]},
		{pool,
		 [pool_id, user, password, host, port, database,
		  encoding, available, locked, waiting, max_conn_num,
		  min_conn_num, keep_min_conn_num]}]).

-export([init/0, execute/1, execute/2, execute/3,
	 insert/1, insert/2, insert/3, select_limit/3,
	 select_limit/4, get_one/1, get_one/2, get_one/3,
	 get_row/1, get_row/2, get_row/3, get_all/1, get_all/2,
	 get_all/3, get_all4page/4, format_sql/2, replace/2,
	 update/3, insert_vals_sql/1, batch_insert/3,
	 batch_replace/3, get_insert_sql/3, get_replace_sql/3,
	 c/0, t/1, prepare/2]).

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

-file("src/db/db.erl", 49).

-file("inc/emysql.hrl", 1).

-record(pool,
	{pool_id, user, password, host, port, database,
	 encoding, available = queue:new(),
	 locked = gb_trees:empty(), waiting = queue:new(),
	 max_conn_num = 0, min_conn_num = 0,
	 keep_min_conn_num = 0}).

-record(emysql_connection,
	{id, pool_id, encoding, socket, version, thread_id,
	 caps, language, prepared = gb_trees:empty(), locked_at,
	 alive = true}).

-record(greeting,
	{protocol_version, server_version, thread_id, salt1,
	 salt2, caps, caps_high, language, status, seq_num,
	 plugin}).

-record(field,
	{seq_num, catalog, db, table, org_table, name, org_name,
	 type, default, charset_nr, length, flags, decimals}).

-record(packet, {size, seq_num, data}).

-record(ok_packet,
	{seq_num, affected_rows, insert_id, status,
	 warning_count, msg}).

-record(error_packet, {seq_num, code, status, msg}).

-record(eof_packet, {seq_num, status, warning_count}).

-record(result_packet,
	{seq_num, field_list, rows, extra}).

-file("src/db/db.erl", 50).

-file("inc/role.hrl", 1).

-record(role,
	{ver = 78, id = {0, <<>>}, need_sync = 0,
	 loop_counter = 0, type = robot, pid, link, reg_ip,
	 reg_time = 0,
	 trigger = {1, []}  :: {pos_integer(), [tuple()]},
	 status = 0, s_event = 0, s_event_pid, combat_pid = 0,
	 combat_replay_pid = 0, combat_type_list = [],
	 ui_combat_type = 0, play_speed = 1,
	 is_in_backstage = false, is_auto = 0, is_gain = 0,
	 is_ready, is_online = 0, device_type = <<>>,
	 getui_cid = <<>>, channel = <<>>, reg_channel = <<>>,
	 idfa = <<>>, reg_idfa = <<>>, device_id = <<>>,
	 reg_device_id = <<>>, os_name = <<>>,
	 reg_os_name = <<>>, app_name = <<>>,
	 reg_app_name = <<>>, package_name = <<>>,
	 reg_package_name = <<>>, package_ver = <<>>,
	 reg_package_ver = <<>>, os_ver = <<>>,
	 carrier_name = <<>>, net_type = <<>>, resolution = <<>>,
	 platform = <<>>, zone_id = 0  :: non_neg_integer(),
	 account = <<>>, name = <<>>, s_name = 0, career = 0,
	 lev = 1, uplev_time = 0, sex = 0, face_id = 0,
	 face_list = [], hp = 0, mspd = 25, power = 0,
	 max_power = 0, max_power_time = 0, arena_power = 0,
	 arena_max_power = 0, arena_max_power_time = 0,
	 banned_time = 0, interdict_time = 0, capacity = 0,
	 identity = <<>>, data_lock = 0, timer, item_next_id = 1,
	 signature = <<>>, city = 0, assets, pos, game_set,
	 s_looks = []  ::
	     [{non_neg_integer(), non_neg_integer(),
	       non_neg_integer(), bitstring()}],
	 login, misc, guild_bag, surface_bag, partner_bag,
	 m_look, m_charge, m_vip, m_var, m_quest, m_drama,
	 m_friend, m_mail = [], m_formation, m_arena, m_feat,
	 m_checkin, m_exchange, m_buff, m_avatar, m_say,
	 m_dungeon, m_boss, m_recruit, m_honor, m_adventure,
	 m_lev_gift, m_power_gift, m_star, m_star_tower,
	 m_market_silver, m_wish, m_login_days, m_month_card,
	 m_guild_dun, m_star_divination, m_guild_skill,
	 m_media_card_type = [], m_endless, m_dial, m_days_ranks,
	 m_escort, m_dun_stone, m_hallows, m_day_goals,
	 m_guild_quest, m_recruit_award, m_sky_ladder, m_convert,
	 m_shipping, m_expedition, m_star_gift,
	 holiday_assets = [], m_privilege, m_month_fund,
	 m_lanterm_festival, m_lanterm_adventure, m_invite_code,
	 misc_ext, m_arena_elite, arena_elite_power = 0,
	 arena_elite_power_time = 0, m_element_temple, m_halidom,
	 m_holiday_dial, arena_elite_max_star = 0, m_break_egg,
	 m_welfare, m_dun_heaven, m_holiday_boss, m_war_order,
	 m_holiday_holy, m_week_card, m_holy_eqm_set,
	 m_arena_cluster, m_holiday_snatch, m_holiday_accumulate,
	 m_room, m_room_feat, m_holiday_boss_new,
	 m_holiday_return_feat, m_holiday_return_sign,
	 m_holiday_return, m_room_grow, m_lanterm_adventure1,
	 m_lanterm_adventure2, m_lanterm_adventure3, m_home,
	 m_home_pet, pet_bag, backdrop_id = 0,
	 backdrop_list = [], m_holiday_predict,
	 m_holiday_personal_gift, m_resonate, m_resonate_extract,
	 m_sprite_hatch, m_sprite_tree, m_holiday_term_begins,
	 m_holiday_petard, m_encounter, m_holiday_merge_goal,
	 m_arena_team, m_monopoly_maps, m_training_camp,
	 m_weekly, m_arena_peak_champion,
	 m_arena_elite_war_order, m_holiday_fire_gift,
	 m_holiday_personal_fire_gift, m_secret_dun,
	 m_holiday_return_new, m_holiday_charge_rebate,
	 m_holiday_charge_reset, m_holiday_optional_lottery,
	 m_holiday_lucky_dog, m_holiday_nian,
	 m_holiday_time_award, m_holiday_valentines, m_planes,
	 m_planes_war_order, m_new_war_order, m_face,
	 m_subscriber, m_holiday_dime, m_holiday_valentine_boss,
	 m_personal_push, m_holiday_new_week_card,
	 m_holiday_arena_team, m_holiday_practise_tower, p_bag,
	 p_eqm, p_home}).

-record(role_robot,
	{id = {0, <<>>}, account = <<>>, platform = <<>>,
	 zone_id = 0, channel = <<>>, name = <<>>,
	 gid = {0, <<>>}, gname = <<>>, lev = 0, power = 0,
	 sex = 0, career = 0, face_id = 0, face_file = <<>>,
	 face_update_time = 0, avatar_bid = 0,
	 avatar_frames = [], say_frames = [], vip_lev = 0,
	 pos_info = [], partners = [], m_formation = [],
	 sign = <<>>, city = 0, max_dun_id = 0, m_star,
	 auto_pk = 0, m_hallows, max_star_tower = 0,
	 elite_lev = 0, is_show_vip = 0, arena_elite_defens = [],
	 m_halidom, m_guild_skill, arena_elite_manifesto = [],
	 arena_cluster_formation = [], city_id = 0, honor = 0,
	 honor_badges = [], honor_point = 0, use_badges = [],
	 fanse_list = [], grow_info = [], room_bbs_set = 1,
	 backdrop_id = 0, is_open_home = 0, soft = 0,
	 max_power = 0, m_resonate_lev = 0, m_sprite_tree,
	 m_arena_peak_champion, look_id = 0,
	 holiday_nian_face = []}).

-record(map_role,
	{pid  :: undefined | pid(),
	 rid = 0  :: non_neg_integer(),
	 srv_id = <<>>  :: bitstring(),
	 name = <<>>  :: bitstring(),
	 conn_pid  :: undefined | pid(),
	 map = 0  :: non_neg_integer(), grid_pid  :: pid(),
	 speed = 1  :: pos_integer(),
	 x = 0  :: non_neg_integer(),
	 y = 0  :: non_neg_integer(),
	 dir = 0  :: non_neg_integer(),
	 gx = 0  :: non_neg_integer(),
	 gy = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 event = 0  :: non_neg_integer(), label = 0  :: 0..2,
	 lev = 1  :: pos_integer(), sex = 0  :: 0..2,
	 career = 0  :: non_neg_integer(),
	 face = 1  :: pos_integer(),
	 fc = 0  :: non_neg_integer(),
	 avatar = 0  :: non_neg_integer(),
	 looks = []  :: list()}).

-file("src/db/db.erl", 51).

-spec init() -> ok.

init() ->
    [DbHost, DbPort, DbUser, DbPass, DbName, DbEncode,
     DbConnNumMin, DbConnNumMax] =
	sys_env:get(db_cfg),
    emysql:add_pool(mysql_conn_pool, DbConnNumMin,
		    DbConnNumMax, DbUser, DbPass, DbHost, DbPort, DbName,
		    DbEncode).

-spec execute(bitstring() | string()) -> {ok,
					  non_neg_integer()} |
					 {error, any()}.

execute(Sql) -> execute(Sql, []).

-spec execute(bitstring() | string(), [any()]) -> {ok,
						   non_neg_integer()} |
						  {error, any()}.

execute(Sql, Args) ->
    execute(Sql, Args, emysql_app:default_timeout()).

-spec execute(bitstring() | string(), [any()],
	      integer()) -> {ok, non_neg_integer()} | {error, any()}.

execute(Sql, Args, Timeout) ->
    case catch emysql:execute(mysql_conn_pool, Sql, Args,
			      Timeout)
	of
      #ok_packet{affected_rows = Rows} -> {ok, Rows};
      Err -> format_error(Sql, Args, Err)
    end.

-spec insert(bitstring() | string()) -> {ok,
					 non_neg_integer()} |
					{error, any()}.

insert(Sql) -> insert(Sql, []).

-spec insert(bitstring() | string(), list()) -> {ok,
						 non_neg_integer()} |
						{error, any()}.

insert(Sql, Args) ->
    insert(Sql, Args, emysql_app:default_timeout()).

-spec insert(bitstring() | string(), [any()],
	     integer()) -> {ok, non_neg_integer()} | {error, any()}.

insert(Sql, Args, Timeout) ->
    case catch emysql:execute(mysql_conn_pool, Sql, Args,
			      Timeout)
	of
      #ok_packet{insert_id = Id} -> {ok, Id};
      Err -> format_error(Sql, Args, Err)
    end.

-spec select_limit(bitstring() | string(),
		   non_neg_integer(), pos_integer()) -> {ok, [any()]} |
							{error, any()}.

select_limit(Sql, Offset, Num) ->
    select_limit(Sql, [], Offset, Num).

-spec select_limit(bitstring() | string(), [any()],
		   non_neg_integer(), pos_integer()) -> {ok, [any()]} |
							{error, any()}.

select_limit(Sql, Args, Offset, Num) ->
    S = list_to_binary([Sql, " limit ",
			integer_to_list(Offset), ", ", integer_to_list(Num)]),
    case catch emysql:execute(mysql_conn_pool, S, Args) of
      #result_packet{rows = Rows} -> {ok, Rows};
      Err -> format_error(Sql, Args, Err)
    end.

-spec get_one(bitstring() | string()) -> {ok, any()} |
					 {error, any()}.

get_one(Sql) -> get_one(Sql, []).

-spec get_one(bitstring() | string(), [any()]) -> {ok,
						   any()} |
						  {error, any()}.

get_one(Sql, Args) ->
    get_one(Sql, Args, emysql_app:default_timeout()).

-spec get_one(bitstring() | string(), [any()],
	      integer()) -> {ok, any()} | {error, any()}.

get_one(Sql, Args, Timeout) ->
    case catch emysql:execute(mysql_conn_pool, Sql, Args,
			      Timeout)
	of
      #result_packet{rows = [[R]]} -> {ok, R};
      #result_packet{rows = []} -> {error, undefined};
      Err -> format_error(Sql, Args, Err)
    end.

-spec get_row(bitstring() | string()) -> {ok, [any()]} |
					 {error, any()}.

get_row(Sql) -> get_row(Sql, []).

-spec get_row(bitstring() | string(), [any()]) -> {ok,
						   [any()]} |
						  {error, any()}.

get_row(Sql, Args) ->
    get_row(Sql, Args, emysql_app:default_timeout()).

-spec get_row(bitstring() | string(), [any()],
	      integer()) -> {ok, [any()]} | {error, any()}.

get_row(Sql, Args, Timeout) ->
    case catch emysql:execute(mysql_conn_pool, Sql, Args,
			      Timeout)
	of
      #result_packet{rows = [R]} -> {ok, R};
      #result_packet{rows = []} -> {error, undefined};
      Err -> format_error(Sql, Args, Err)
    end.

-spec get_all(bitstring() | string()) -> {ok, any()} |
					 {error, any()}.

get_all(Sql) -> get_all(Sql, []).

-spec get_all(bitstring() | string(), [any()]) -> {ok,
						   any()} |
						  {error, any()}.

get_all(Sql, Args) ->
    get_all(Sql, Args, emysql_app:default_timeout()).

-spec get_all(bitstring() | string(), [any()],
	      integer()) -> {ok, any()} | {error, any()}.

get_all(Sql, Args, Timeout) ->
    case catch emysql:execute(mysql_conn_pool, Sql, Args,
			      Timeout)
	of
      #result_packet{rows = R} -> {ok, R};
      Err -> format_error(Sql, Args, Err)
    end.

-spec get_all4page(bitstring(), list(), pos_integer(),
		   pos_integer()) -> {ok, list()} | {error, any()}.

get_all4page(Sql, Args, Timeout, PageSize) ->
    NewSql = list_to_binary([Sql, <<" limit ?, ?">>]),
    do_get_all4page(NewSql, Args, Timeout, 0, PageSize, []).

do_get_all4page(NewSql, Args, Timeout, PageIndex,
		PageSize, AllData) ->
    case get_all(NewSql,
		 Args ++ [PageIndex * PageSize, PageSize], Timeout)
	of
      {ok, []} -> {ok, AllData};
      {ok, Rs} ->
	  do_get_all4page(NewSql, Args, Timeout, PageIndex + 1,
			  PageSize, Rs ++ AllData);
      {error, Reason} -> {error, Reason}
    end.

-spec format_sql(Sql :: bitstring(),
		 Args :: list()) -> bitstring().

format_sql(Sql, Args) ->
    NewArgs = [emysql_util:encode(A) || A <- Args],
    unicode:characters_to_binary(io_lib:format(Sql,
					       NewArgs)).

batch_insert(_Table, _Keys, []) -> 0;
batch_insert(Table, Keys, Data = [_ | _])
    when length(Data) > 10000 ->
    {L1, L2} = lists:split(10000, Data),
    batch_insert(Table, Keys, L1),
    batch_insert(Table, Keys, L2);
batch_insert(Table, Keys, Data) ->
    insert(get_insert_sql(Table, Keys, Data)).

batch_replace(_Table, _Keys, []) -> 0;
batch_replace(Table, Keys, Data = [_ | _])
    when length(Data) > 10000 ->
    {L1, L2} = lists:split(10000, Data),
    batch_replace(Table, Keys, L1),
    batch_replace(Table, Keys, L2);
batch_replace(Table, Keys, Data) ->
    execute(get_replace_sql(Table, Keys, Data)).

replace(Table, KVList) ->
    <<_:1/binary, KeysBin/binary>> = list_to_binary([[",`",
						      atom_to_list(Key), "`"]
						     || {Key, _Val} <- KVList]),
    Args = [Val || {_key, Val} <- KVList],
    VALSBin = list_to_binary(["(?",
			      lists:duplicate(length(KVList) - 1, ",?"), ");"]),
    Sql = list_to_binary(["REPLACE INTO `",
			  atom_to_list(Table), "`(", KeysBin, ") VALUES",
			  VALSBin]),
    execute(Sql, Args).

update(Table, SetKVList, KeyKVList) ->
    <<_:1/binary, SetsBin/binary>> = list_to_binary([[",`",
						      atom_to_list(Key), "`=?"]
						     || {Key, _Val}
							    <- SetKVList]),
    Args = [Val || {_key, Val} <- SetKVList],
    Sql = list_to_binary(["UPDATE `", atom_to_list(Table),
			  "` SET ", SetsBin]),
    case KeyKVList of
      [] -> execute(<<Sql/binary, ";">>, Args);
      _ ->
	  <<_:4/binary, KeysBin/binary>> =
	      list_to_binary([[" AND `", atom_to_list(Key), "`=?"]
			      || {Key, _Val} <- KeyKVList]),
	  Sql2 = <<Sql/binary, " WHERE ", KeysBin/binary>>,
	  Args2 = Args ++ [Val || {_key, Val} <- KeyKVList],
	  execute(<<Sql2/binary, ";">>, Args2)
    end.

get_insert_sql(Table, Keys, Data) ->
    <<_:1/binary, KeysBin/binary>> = list_to_binary([[",`",
						      atom_to_list(Key), "`"]
						     || Key <- Keys]),
    SqlHead = list_to_binary(["INSERT INTO `",
			      atom_to_list(Table), "`(", KeysBin, ") VALUES"]),
    SqlBody = get_insert_sql_f1(Data, []),
    <<SqlHead/binary, SqlBody/binary>>.

get_insert_sql_f1([], Res) ->
    list_to_binary(lists:reverse(Res));
get_insert_sql_f1([Row], Res) ->
    SqlBody = list_to_binary(["(~ts",
			      lists:duplicate(length(Row) - 1, ",~ts"), ");"]),
    get_insert_sql_f1([], [format_sql(SqlBody, Row) | Res]);
get_insert_sql_f1([Row | T], Res) ->
    SqlBody = list_to_binary(["(~ts",
			      lists:duplicate(length(Row) - 1, ",~ts"), "),"]),
    get_insert_sql_f1(T, [format_sql(SqlBody, Row) | Res]).

get_replace_sql(Table, Keys, Data) ->
    <<_:1/binary, KeysBin/binary>> = list_to_binary([[",`",
						      atom_to_list(Key), "`"]
						     || Key <- Keys]),
    SqlHead = list_to_binary(["REPLACE INTO `",
			      atom_to_list(Table), "`(", KeysBin, ") VALUES"]),
    SqlBody = get_insert_sql_f1(Data, []),
    <<SqlHead/binary, SqlBody/binary>>.

prepare(StmtName, Statement) ->
    emysql:prepare(StmtName, Statement).

-spec insert_vals_sql(Fields :: list()) -> bitstring().

insert_vals_sql(Fields) ->
    Sql = lists:concat(["(",
			string:join(lists:duplicate(length(Fields), "~ts"),
				    ","),
			")"]),
    format_sql(Sql, Fields).

format_error(Sql, _Args,
	     Err = #error_packet{msg = Msg}) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddb304, _, {__Leveldb304, __Tracesdb304}}
	  when __Leveldb304 band 8 /= 0 orelse
		 __Tracesdb304 /= [] ->
	  lager:do_log(error,
		       [{module, db}, {function, format_error}, {line, 304},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[Database Error]: Sql=~s Error:~w",
				     [Sql, Err]),
		       none, 4096, 8, __Leveldb304, __Tracesdb304, lager_event,
		       __Piddb304);
      _ -> ok
    end,
    {error, Msg};
format_error(Sql, _Args, Err) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddb307, _, {__Leveldb307, __Tracesdb307}}
	  when __Leveldb307 band 8 /= 0 orelse
		 __Tracesdb307 /= [] ->
	  lager:do_log(error,
		       [{module, db}, {function, format_error}, {line, 307},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[Database Error]: Sql=~s Error:~w",
				     [Sql, Err]),
		       none, 4096, 8, __Leveldb307, __Tracesdb307, lager_event,
		       __Piddb307);
      _ -> ok
    end,
    {error, Err}.

c() ->
    R = emysql:execute(mysql_conn_pool,
		       <<"create table role (\n        id int(11) "
			 "not null auto_increment,\n        platform "
			 "varchar(20) not null,\n        zone_id "
			 "int(8) not null,\n        account varchar(80) "
			 "not null,\n        name varchar(20) "
			 "not null,\n        data blob not null,\n "
			 "       primary key (id, platform, zone_id),\n "
			 "       key name (name),\n        key "
			 "account (account)\n    );">>),
    io:format("~ts", [io_lib:format("create: ~p~n", [R])]).

t(Times) ->
    F1 = fun (I) ->
		 S = integer_to_list(I),
		 A = "account_" ++ S,
		 N = "name_" ++ S,
		 R = #role{id = I, platform = <<"4399">>, zone_id = 0,
			   account = A, name = N},
		 Sql = "insert into role values(?, ?, ?, ?, "
		       "?, ?)",
		 emysql:execute(mysql_conn_pool, Sql,
				[I, <<"4399">>, 0, A, N,
				 util:term_to_string(R)])
	 end,
    F2 = fun (I) ->
		 S = integer_to_list(I),
		 A = "account_" ++ S,
		 Sql = "select * from role where account = ?",
		 db:get_row(Sql, [A])
	 end,
    ptester:run(Times, [{"insert", F1}, {"select", F2}]).


