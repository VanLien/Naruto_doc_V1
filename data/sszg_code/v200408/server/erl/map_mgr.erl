-file("src/mod/map/map_mgr.erl", 1).

-module(map_mgr).

-lager_records([{state, [next_id]},
		{map_data,
		 [bid, type, name, def_xy, min_lev, max_lev, condition,
		  relive, width, height, grid_x, grid_y, max_pre_layer,
		  start_type, is_single, unit_list, tile_res_list]},
		{map_grid, [map_pid, map_id, base_id, width, height]},
		{map,
		 [id, srv_id, base_id, res_id, pid, ctrl_pid, grid_info,
		  name, condition, num, max_pre_layer, width, height,
		  dynamic_block, layer_flag]}]).

-behaviour(gen_server).

-export([init/1, handle_call/3, handle_cast/2,
	 handle_info/2, terminate/2, code_change/3]).

-export([start_link/0, pid/1, pid/3, info/1, info/2,
	 path/4, paths/4, is_blocked/4, is_base_blocked/3,
	 is_base_blocked_xy/3, create/1, get_map_tile/1,
	 get_map_size/1, rand_point/2, rand_base_point/2,
	 clean_ets/0]).

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

-file("src/mod/map/map_mgr.erl", 30).

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

-file("src/mod/map/map_mgr.erl", 31).

-record(state, {next_id = 100000}).

clean_ets() -> map_mgr ! clean_ets.

-spec start_link() -> {ok, pid()} | ignore |
		      {error, term()}.

start_link() ->
    gen_server:start_link({local, map_mgr}, map_mgr, [],
			  []).

-spec create(pos_integer()) -> {ok, pid(),
				pos_integer()} |
			       {error, term()}.

create(BaseId) ->
    NormalMap = map_data:ids(start),
    case lists:member(BaseId, NormalMap) of
      true -> {error, map_type_error};
      false ->
	  case map_data:get(BaseId) of
	    undefined -> {error, map_data_not_found};
	    #map_data{condition = Cond, width = W, height = H,
		      name = Name, max_pre_layer = MaxPreLayer} ->
		Map = #map{srv_id = sys_env:get(server_id),
			   base_id = BaseId, name = Name, condition = Cond,
			   width = W, height = H, max_pre_layer = MaxPreLayer},
		do_create(0, Map)
	  end
    end.

do_create(N, Map) ->
    Id = gen_server:call(map_mgr, fetch_id),
    case catch map:start_link(Map#map{id = Id}) of
      {ok, MapPid} -> {ok, MapPid, Id};
      _Err when N < 3 -> do_create(N + 1, Map);
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap_mgr69, _,
	     {__Levelmap_mgr69, __Tracesmap_mgr69}}
		when __Levelmap_mgr69 band 8 /= 0 orelse
		       __Tracesmap_mgr69 /= [] ->
		lager:do_log(error,
			     [{module, map_mgr}, {function, do_create},
			      {line, 69}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("创建地图进程失败:~w", [_Err]), none, 4096,
			     8, __Levelmap_mgr69, __Tracesmap_mgr69,
			     lager_event, __Pidmap_mgr69);
	    _ -> ok
	  end,
	  {error, map_create_error}
    end.

-spec pid(MapId :: pos_integer()) -> {ok, pid()} |
				     {error, not_found}.

pid(MapId) ->
    case catch ets:lookup_element(map_info, MapId, #map.pid)
	of
      Pid when is_pid(Pid) -> {ok, Pid};
      _Err ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap_mgr79, _,
	     {__Levelmap_mgr79, __Tracesmap_mgr79}}
		when __Levelmap_mgr79 band 8 /= 0 orelse
		       __Tracesmap_mgr79 /= [] ->
		lager:do_log(error,
			     [{module, map_mgr}, {function, pid}, {line, 79},
			      {pid, pid_to_list(self())}, {node, node()}
			      | lager:md()],
			     io_lib:format("未发现地图进程[~w:~w]", [MapId, _Err]),
			     none, 4096, 8, __Levelmap_mgr79, __Tracesmap_mgr79,
			     lager_event, __Pidmap_mgr79);
	    _ -> ok
	  end,
	  {error, not_found}
    end.

-spec pid(Platform :: bitstring(),
	  ZoneId :: non_neg_integer(),
	  MapId :: pos_integer()) -> {ok, pid()} |
				     {error, not_found} | {error, term()}.

pid(Platform, ZoneId, MapId) ->
    cluster_lib:call(game_lib:pz_to_srvid(Platform, ZoneId),
		     map_mgr, pid, [MapId]).

-spec info(pos_integer()) -> {ok, #map{}} |
			     {error, not_found}.

info(MapId) ->
    case catch ets:lookup(map_info, MapId) of
      [Map] -> {ok, Map};
      _ -> {error, not_found}
    end.

-spec info(SrvId :: bitstring(),
	   MapId :: pos_integer()) -> {ok, #map{}} |
				      {error, term()}.

info(<<>>, MapId) ->
    cluster_lib:call(map_mgr, info, [MapId]);
info(SrvId, MapId) ->
    case sys_env:get(server_type) of
      center -> cluster_lib:call(map_mgr, info, [MapId]);
      _ -> cluster_lib:call(SrvId, map_mgr, info, [MapId])
    end.

-spec is_blocked(MapId :: pos_integer(),
		 BaseId :: pos_integer(), TileX :: pos_integer(),
		 TileY :: pos_integer()) -> boolean().

is_blocked(_MapId, BaseId, TileX, TileY) ->
    case catch ets:lookup(map_info_walkable,
			  {BaseId, TileX, TileY})
	of
      [] -> true;
      [{_, _Type}] -> true;
      _ -> true
    end.

-spec is_base_blocked(BaseId :: pos_integer(),
		      TileX :: pos_integer(),
		      TileY :: pos_integer()) -> boolean().

is_base_blocked(BaseId, TileX, TileY) ->
    case catch ets:lookup(map_base_walkable,
			  {BaseId, TileX, TileY})
	of
      [_] -> false;
      _ -> true
    end.

-spec is_base_blocked_xy(BaseId :: pos_integer(),
			 X :: pos_integer(), Y :: pos_integer()) -> boolean().

is_base_blocked_xy(BaseId, X, Y) ->
    #map_data{grid_x = GridX, grid_y = GridY} =
	map_data:get(BaseId),
    is_base_blocked(BaseId, X div GridX, Y div GridY).

-spec rand_point(MapId :: pos_integer(),
		 #map_data{} | pos_integer()) -> {MapId :: pos_integer(),
						  X :: pos_integer(),
						  Y :: pos_integer()}.

rand_point(0, 0) ->
    MapId = util:rand_list(map_data:startup()),
    rand_point(MapId, MapId);
rand_point(map, MapList) ->
    MapId = util:rand_list(MapList),
    rand_point(MapId, MapId);
rand_point(MapId, MapBaseId)
    when is_integer(MapBaseId) ->
    MapData = map_data:get(MapBaseId),
    rand_point(MapId, MapData);
rand_point(MapId,
	   MapData = #map_data{bid = MapBaseId, grid_x = GridX,
			       grid_y = GridY, width = W, height = H}) ->
    X = util:rand(30, W - 30),
    Y = util:rand(30, H - 30),
    case map_mgr:is_blocked(MapId, MapBaseId, X div GridX,
			    Y div GridY)
	of
      false -> {MapId, X, Y};
      _ -> rand_point(MapId, MapData)
    end.

-spec rand_base_point(MapId :: pos_integer(),
		      MapBaseId :: pos_integer()) -> {MapBaseId ::
							  pos_integer(),
						      X :: pos_integer(),
						      Y :: pos_integer()}.

rand_base_point(0, 0) ->
    MapId = util:rand_list(map_data:ids(start)),
    rand_base_point(MapId, MapId);
rand_base_point(map, MapList) ->
    MapId = util:rand_list(MapList),
    rand_base_point(MapId, MapId);
rand_base_point(MapId, MapBaseId) ->
    #map_data{grid_x = GridX, grid_y = GridY} =
	map_data:get(MapBaseId),
    Num = map_data_walkable:num(MapBaseId),
    N = util:rand(1, Num),
    case catch ets:lookup(map_base_walkable_n,
			  {MapBaseId, N})
	of
      [{_, {Gx, Gy}}] ->
	  {MapId, Gx * GridX + util:rand(1, GridX - 1),
	   Gy * GridY + util:rand(1, GridY - 1)};
      _ when Num > 0 -> rand_base_point(MapId, MapBaseId);
      _ -> {MapId, 0, 0}
    end.

-spec path(MapId :: pos_integer(),
	   BaseId :: pos_integer(),
	   Point1 :: {pos_integer(), pos_integer()},
	   Point2 :: {pos_integer(), pos_integer()}) -> blocked |
							{pos_integer(),
							 pos_integer()}.

path(MapId, BaseId, {X1, Y1}, {X2, Y2}) ->
    {TileWidth, TileHeight} = get_map_tile(BaseId),
    Fx = X1 div TileWidth,
    Fy = Y1 div TileHeight,
    Tx = X2 div TileWidth,
    Ty = Y2 div TileHeight,
    case path(MapId, BaseId, {Fx, Fy}, {Fx, Fy}, {Tx, Ty})
	of
      blocked -> blocked;
      {Tx, Ty} -> {X2, Y2};
      {X, Y} -> {X * TileWidth, Y * TileHeight}
    end.

path(MapId, BaseId, From, S = {X1, Y1}, D = {X2, Y2}) ->
    X = if X1 < X2 -> X1 + 1;
	   X1 > X2 -> X1 - 1;
	   true -> X1
	end,
    Y = if Y1 < Y2 -> Y1 + 1;
	   Y1 > Y2 -> Y1 - 1;
	   true -> Y1
	end,
    case is_blocked(MapId, BaseId, X, Y) of
      true when S =:= From -> blocked;
      true -> {X1, Y1};
      false when X =:= X2 andalso Y =:= Y2 -> {X, Y};
      false -> path(MapId, BaseId, From, {X, Y}, D)
    end.

-spec paths(pos_integer(), pos_integer(), tuple(),
	    tuple()) -> blocked | list().

paths(MapId, BaseId, {X1, Y1}, {X2, Y2}) ->
    {TileWidth, TileHeight} = get_map_tile(BaseId),
    Fx = X1 div TileWidth,
    Fy = Y1 div TileHeight,
    Tx = X2 div TileWidth,
    Ty = Y2 div TileHeight,
    case paths(MapId, BaseId, {Fx, Fy}, {Fx, Fy}, {Tx, Ty},
	       [])
	of
      {{Tx, Ty}, Path} ->
	  lists:reverse([{X2, Y2} | [{Xx * TileWidth,
				      Yy * TileHeight}
				     || {Xx, Yy} <- Path]]);
      {{Dx, Dy}, Path} ->
	  lists:reverse([{Xx * TileWidth, Yy * TileHeight}
			 || {Xx, Yy} <- [{Dx, Dy} | Path]]);
      blocked -> blocked
    end.

paths(MapId, BaseId, From, S = {X1, Y1}, D = {X2, Y2},
      Path) ->
    X = if X1 < X2 -> X1 + 1;
	   X1 > X2 -> X1 - 1;
	   true -> X1
	end,
    Y = if Y1 < Y2 -> Y1 + 1;
	   Y1 > Y2 -> Y1 - 1;
	   true -> Y1
	end,
    case is_blocked(MapId, BaseId, X, Y) of
      true when S =:= From -> blocked;
      true -> {{X1, Y1}, Path};
      false when X =:= X2 andalso Y =:= Y2 -> {{X, Y}, Path};
      false ->
	  paths(MapId, BaseId, From, {X, Y}, D, [{X, Y} | Path])
    end.

init([]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap_mgr240, _,
       {__Levelmap_mgr240, __Tracesmap_mgr240}}
	  when __Levelmap_mgr240 band 64 /= 0 orelse
		 __Tracesmap_mgr240 /= [] ->
	  lager:do_log(info,
		       [{module, map_mgr}, {function, init}, {line, 240},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在启动...", [map_mgr]), none, 4096,
		       64, __Levelmap_mgr240, __Tracesmap_mgr240, lager_event,
		       __Pidmap_mgr240);
      _ -> ok
    end,
    process_flag(trap_exit, true),
    sys_env:set(battle_id, 100),
    ets:new(map_info,
	    [set, named_table, public, {keypos, #map.id}]),
    ets:new(map_info_walkable,
	    [set, named_table, protected]),
    ets:new(map_dynamic_block, [set, named_table, public]),
    ets:new(map_base_walkable,
	    [set, named_table, protected]),
    ets:new(map_base_walkable_n,
	    [set, named_table, protected]),
    State = #state{},
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap_mgr251, _,
       {__Levelmap_mgr251, __Tracesmap_mgr251}}
	  when __Levelmap_mgr251 band 64 /= 0 orelse
		 __Tracesmap_mgr251 /= [] ->
	  lager:do_log(info,
		       [{module, map_mgr}, {function, init}, {line, 251},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 启动完成", [map_mgr]), none, 4096, 64,
		       __Levelmap_mgr251, __Tracesmap_mgr251, lager_event,
		       __Pidmap_mgr251);
      _ -> ok
    end,
    {ok, State}.

handle_call(fetch_id, _From,
	    State = #state{next_id = Id}) ->
    {reply, Id, State#state{next_id = Id + 1}};
handle_call(_Request, _From, State) -> {noreply, State}.

handle_cast(_Msg, State) -> {noreply, State}.

handle_info(clean_ets, State) ->
    ets:delete_all_objects(map_info_walkable),
    ets:delete_all_objects(map_dynamic_block),
    ets:delete_all_objects(map_base_walkable),
    ets:delete_all_objects(map_base_walkable_n),
    {noreply, State};
handle_info({'EXIT', _Pid, normal}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap_mgr273, _,
       {__Levelmap_mgr273, __Tracesmap_mgr273}}
	  when __Levelmap_mgr273 band 128 /= 0 orelse
		 __Tracesmap_mgr273 /= [] ->
	  lager:do_log(debug,
		       [{module, map_mgr}, {function, handle_info},
			{line, 273}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("连接的进程[~w]已经正常退出", [_Pid]), none, 4096,
		       128, __Levelmap_mgr273, __Tracesmap_mgr273, lager_event,
		       __Pidmap_mgr273);
      _ -> ok
    end,
    {noreply, State};
handle_info({'EXIT', Pid, Why}, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap_mgr278, _,
       {__Levelmap_mgr278, __Tracesmap_mgr278}}
	  when __Levelmap_mgr278 band 8 /= 0 orelse
		 __Tracesmap_mgr278 /= [] ->
	  lager:do_log(error,
		       [{module, map_mgr}, {function, handle_info},
			{line, 278}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("连接的进程[~w]异常退出: ~w", [Pid, Why]), none,
		       4096, 8, __Levelmap_mgr278, __Tracesmap_mgr278,
		       lager_event, __Pidmap_mgr278);
      _ -> ok
    end,
    {noreply, State};
handle_info(_Info, State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap_mgr282, _,
       {__Levelmap_mgr282, __Tracesmap_mgr282}}
	  when __Levelmap_mgr282 band 8 /= 0 orelse
		 __Tracesmap_mgr282 /= [] ->
	  lager:do_log(error,
		       [{module, map_mgr}, {function, handle_info},
			{line, 282}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("收到未知消息: ~w", [_Info]), none, 4096, 8,
		       __Levelmap_mgr282, __Tracesmap_mgr282, lager_event,
		       __Pidmap_mgr282);
      _ -> ok
    end,
    {noreply, State}.

terminate(_Reason, _State) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap_mgr286, _,
       {__Levelmap_mgr286, __Tracesmap_mgr286}}
	  when __Levelmap_mgr286 band 64 /= 0 orelse
		 __Tracesmap_mgr286 /= [] ->
	  lager:do_log(info,
		       [{module, map_mgr}, {function, terminate}, {line, 286},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 正在关闭...", [map_mgr]), none, 4096,
		       64, __Levelmap_mgr286, __Tracesmap_mgr286, lager_event,
		       __Pidmap_mgr286);
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
      {__Pidmap_mgr287, _,
       {__Levelmap_mgr287, __Tracesmap_mgr287}}
	  when __Levelmap_mgr287 band 64 /= 0 orelse
		 __Tracesmap_mgr287 /= [] ->
	  lager:do_log(info,
		       [{module, map_mgr}, {function, terminate}, {line, 287},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("[~w] 关闭完成", [map_mgr]), none, 4096, 64,
		       __Levelmap_mgr287, __Tracesmap_mgr287, lager_event,
		       __Pidmap_mgr287);
      _ -> ok
    end,
    ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

get_map_tile(BaseId) ->
    case map_data:get(BaseId) of
      #map_data{grid_x = GridX, grid_y = GridY} ->
	  {GridX, GridY};
      _ ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap_mgr302, _,
	     {__Levelmap_mgr302, __Tracesmap_mgr302}}
		when __Levelmap_mgr302 band 8 /= 0 orelse
		       __Tracesmap_mgr302 /= [] ->
		lager:do_log(error,
			     [{module, map_mgr}, {function, get_map_tile},
			      {line, 302}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("地图[~w]数据无法找到", [BaseId]), none,
			     4096, 8, __Levelmap_mgr302, __Tracesmap_mgr302,
			     lager_event, __Pidmap_mgr302);
	    _ -> ok
	  end,
	  {30, 30}
    end.

get_map_size(BaseId) ->
    W = case map_data:get(BaseId) of
	  #map_data{width = Width} -> Width;
	  _ -> 1500
	end,
    H = case map_data:get(BaseId) of
	  #map_data{height = Height} -> Height;
	  _ -> 720
	end,
    {W, H}.

create_startup([]) -> ok;
create_startup([BaseId | T]) when BaseId < 100000 ->
    case map_data:get(BaseId) of
      undefined ->
	  case {whereis(lager_event), whereis(lager_event),
		lager_config:get({lager_event, loglevel}, {0, []})}
	      of
	    {undefined, undefined, _} ->
		fun () -> {error, lager_not_running} end();
	    {undefined, _, _} ->
		fun () -> {error, {sink_not_configured, lager_event}}
		end();
	    {__Pidmap_mgr321, _,
	     {__Levelmap_mgr321, __Tracesmap_mgr321}}
		when __Levelmap_mgr321 band 8 /= 0 orelse
		       __Tracesmap_mgr321 /= [] ->
		lager:do_log(error,
			     [{module, map_mgr}, {function, create_startup},
			      {line, 321}, {pid, pid_to_list(self())},
			      {node, node()}
			      | lager:md()],
			     io_lib:format("创建地图失败:不存在的地图[~w]", [BaseId]), none,
			     4096, 8, __Levelmap_mgr321, __Tracesmap_mgr321,
			     lager_event, __Pidmap_mgr321);
	    _ -> ok
	  end;
      #map_data{bid = BaseId, name = Name, condition = Cond,
		width = W, height = H, max_pre_layer = MaxPreLayer} ->
	  Map = #map{id = BaseId, srv_id = sys_env:get(server_id),
		     name = Name, base_id = BaseId, condition = Cond,
		     width = W, height = H, max_pre_layer = MaxPreLayer},
	  case catch map:start_link(Map) of
	    {ok, _Pid} -> ok;
	    _Err ->
		case {whereis(lager_event), whereis(lager_event),
		      lager_config:get({lager_event, loglevel}, {0, []})}
		    of
		  {undefined, undefined, _} ->
		      fun () -> {error, lager_not_running} end();
		  {undefined, _, _} ->
		      fun () -> {error, {sink_not_configured, lager_event}}
		      end();
		  {__Pidmap_mgr326, _,
		   {__Levelmap_mgr326, __Tracesmap_mgr326}}
		      when __Levelmap_mgr326 band 8 /= 0 orelse
			     __Tracesmap_mgr326 /= [] ->
		      lager:do_log(error,
				   [{module, map_mgr},
				    {function, create_startup}, {line, 326},
				    {pid, pid_to_list(self())}, {node, node()}
				    | lager:md()],
				   io_lib:format("创建地图失败:~w", [_Err]), none,
				   4096, 8, __Levelmap_mgr326,
				   __Tracesmap_mgr326, lager_event,
				   __Pidmap_mgr326);
		  _ -> ok
		end
	  end
    end,
    create_startup(T);
create_startup([BaseId | T]) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidmap_mgr331, _,
       {__Levelmap_mgr331, __Tracesmap_mgr331}}
	  when __Levelmap_mgr331 band 8 /= 0 orelse
		 __Tracesmap_mgr331 /= [] ->
	  lager:do_log(error,
		       [{module, map_mgr}, {function, create_startup},
			{line, 331}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("创建地图失败:固定地图的ID[~w]不能大于100000", [BaseId]),
		       none, 4096, 8, __Levelmap_mgr331, __Tracesmap_mgr331,
		       lager_event, __Pidmap_mgr331);
      _ -> ok
    end,
    create_startup(T).

load_walkable([]) -> ok;
load_walkable([BaseId | T]) ->
    load_walkable(BaseId), load_walkable(T);
load_walkable(Bid) ->
    do_load_walkable_y(Bid, map_data_walkable:get(Bid), 1,
		       0).

do_load_walkable_y(_Bid, [], _Y, _N) -> ok;
do_load_walkable_y(Bid, [Xl | T], Y, N) ->
    NewN = do_load_walkable_x(Bid, Xl, 1, Y, N),
    do_load_walkable_y(Bid, T, Y + 1, NewN).

do_load_walkable_x(_Bid, [], _X, _Y, N) -> N;
do_load_walkable_x(Bid, [1 | T], X, Y, N) ->
    do_load_walkable_x(Bid, T, X + 1, Y, N);
do_load_walkable_x(Bid, [Type = 0 | T], X, Y, N) ->
    ets:insert(map_info_walkable, {{Bid, X, Y}, Type}),
    ets:insert(map_base_walkable, {{Bid, X, Y}, Type}),
    ets:insert(map_base_walkable_n, {{Bid, N}, {X, Y}}),
    do_load_walkable_x(Bid, T, X + 1, Y, N + 1);
do_load_walkable_x(Bid, [Type = 2 | T], X, Y, N) ->
    ets:insert(map_info_walkable, {{Bid, X, Y}, Type}),
    ets:insert(map_base_walkable, {{Bid, X, Y}, Type}),
    do_load_walkable_x(Bid, T, X + 1, Y, N + 1);
do_load_walkable_x(Bid, [Type = 3 | T], X, Y, N) ->
    ets:insert(map_info_walkable, {{Bid, X, Y}, Type}),
    ets:insert(map_base_walkable, {{Bid, X, Y}, Type}),
    do_load_walkable_x(Bid, T, X + 1, Y, N + 1);
do_load_walkable_x(Bid, [Type = 4 | T], X, Y, N) ->
    ets:insert(map_info_walkable, {{Bid, X, Y}, Type}),
    ets:insert(map_base_walkable, {{Bid, X, Y}, Type}),
    do_load_walkable_x(Bid, T, X + 1, Y, N + 1);
do_load_walkable_x(Bid, [Type = 5 | T], X, Y, N) ->
    ets:insert(map_info_walkable, {{Bid, X, Y}, Type}),
    ets:insert(map_base_walkable, {{Bid, X, Y}, Type}),
    do_load_walkable_x(Bid, T, X + 1, Y, N + 1);
do_load_walkable_x(Bid, [Type = 6 | T], X, Y, N) ->
    ets:insert(map_info_walkable, {{Bid, X, Y}, Type}),
    ets:insert(map_base_walkable, {{Bid, X, Y}, Type}),
    do_load_walkable_x(Bid, T, X + 1, Y, N + 1);
do_load_walkable_x(Bid, [Type | T], X, Y, N) ->
    ets:insert(map_base_walkable, {{Bid, X, Y}, Type}),
    do_load_walkable_x(Bid, T, X + 1, Y, N).


