-file("src/mod/home/home_tile.erl", 1).

-module(home_tile).

-lager_records([{map_data,
		 [bid, type, name, def_xy, min_lev, max_lev, condition,
		  relive, width, height, grid_x, grid_y, max_pre_layer,
		  start_type, is_single, unit_list, tile_res_list]},
		{map_grid, [map_pid, map_id, base_id, width, height]},
		{map,
		 [id, srv_id, base_id, res_id, pid, ctrl_pid, grid_info,
		  name, condition, num, max_pre_layer, width, height,
		  dynamic_block, layer_flag]},
		{home_unit_data,
		 [bid, name, type, dir, set_id, soft, tile_list_1,
		  tile_list_2, effect_count]},
		{home_role_rank, [id, rank]},
		{home_rank_rc,
		 [id, name, lev, face, avatar_bid, time, cache_time,
		  worship_num, visit_num, soft, score, rank,
		  face_update_time, face_file]},
		{home_unit_set, [set_id, reward, collect]},
		{home_rand_visit,
		 [id, name, lev, sex, face, power, last_login, soft,
		  face_update_time, face_file]},
		{home_log,
		 [id, name, face, lev, is_friend, type, time, int_args,
		  str_args, face_update_time, face_file]},
		{home_visitor, [id, name, look_id, time, is_leave]},
		{home_unit, [ver, bid, index, dir]},
		{home_ext, [id, visitors, log]},
		{home_floor,
		 [floor, wall_bid, land_bid, soft, home_unit]},
		{home,
		 [ver, id, name, look_id, bid, wall_bid, land_bid, soft,
		  home_unit, floor_list, log, open_floor, main_floor]},
		{m_home,
		 [ver, num, buy_num, list, day_visitors, soft, max_soft,
		  look_id, look_list, last_visitors, worship,
		  worship_list, rand_list, last_rand_time, set_list,
		  last_hook_time, acc_hook_time, acc_hook_items,
		  open_floor, floor_list, main_floor, max_sum_soft]}]).

-export([tile_max/1, indexTile/1, tileIndex/1,
	 indexPixel/2, to_pixel/2, to_pixel_left/2,
	 to_pixel_right/2, to_pixel_top/2, to_pixel_bottom/2,
	 to_tile/1, tile_offset/3, tiles_offset/2,
	 index_offset/2, get_offset/2, tile_distance/2,
	 index_distance/2, index_pixel_distance/3,
	 tile_range_pixel/4, tile_range/3, rhomb_tiles/2,
	 rhomb_indexs/2, rect_tiles/3, screen_points/1,
	 line_in_rect/3]).

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

-file("src/mod/home/home_tile.erl", 33).

-file("inc/home.hrl", 1).

-record(m_home,
	{ver = 3, num = 0, buy_num = 0, list = [],
	 day_visitors = [], soft = 0, max_soft = 0, look_id = 0,
	 look_list = [], last_visitors = {0, <<>>}, worship = 0,
	 worship_list = [], rand_list = [], last_rand_time = 0,
	 set_list = [], last_hook_time = 0, acc_hook_time = 0,
	 acc_hook_items = [], open_floor = [], floor_list = [],
	 main_floor = 0, max_sum_soft = 0}).

-record(home,
	{ver = 2, id = {0, <<>>}, name = <<>>, look_id = 0,
	 bid = 0, wall_bid = 0, land_bid = 0, soft = 0,
	 home_unit = [], floor_list = [], log = [],
	 open_floor = [1], main_floor = 1}).

-record(home_floor,
	{floor = 0, wall_bid = 0, land_bid = 0, soft = 0,
	 home_unit = []}).

-record(home_ext,
	{id = {0, <<>>}, visitors = [], log = []}).

-record(home_unit,
	{ver = 1, bid = 0  :: non_neg_integer(),
	 index = 0  :: non_neg_integer(), dir = 1  :: 1..2}).

-record(home_visitor,
	{id = {0, <<>>}, name = <<>>, look_id = 0, time = 0,
	 is_leave = 0}).

-record(home_log,
	{id = {0, <<>>}, name = <<>>, face = 0, lev = 0,
	 is_friend = 0, type = 0, time = 0, int_args = [],
	 str_args = [], face_update_time = 0, face_file = <<>>}).

-record(home_rand_visit,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, power = 0, last_login = 0, soft = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(home_unit_set,
	{set_id = 0, reward = [], collect = []}).

-record(home_rank_rc,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 avatar_bid = 0, time = 0, cache_time = 0,
	 worship_num = 0, visit_num = 0, soft = 0, score = 0,
	 rank = 0, face_update_time = 0, face_file = <<>>}).

-record(home_role_rank, {id = {0, <<>>}, rank = 0}).

-record(home_unit_data,
	{bid = 0, name = <<>>, type = 0, dir = 1, set_id = 0,
	 soft = 0, tile_list_1 = [], tile_list_2 = [],
	 effect_count = 1}).

-file("src/mod/home/home_tile.erl", 34).

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

-file("src/mod/home/home_tile.erl", 35).

-type tile_type() :: 20 | 21 | 22.

-spec tile_max(Bid :: pos_integer()) -> tuple().

tile_max(Bid) ->
    #map_data{width = W, height = H, grid_x = X,
	      grid_y = Y} =
	map_data:get(Bid),
    {W div (X * 2) + 1, H div Y + 1}.

-spec indexTile(pos_integer()) -> {pos_integer(),
				   pos_integer()}.

indexTile(Index) -> {Index div 1000, Index rem 1000}.

-spec tileIndex({pos_integer(),
		 pos_integer()}) -> pos_integer().

tileIndex({X, Y}) -> X * 1000 + Y.

-spec indexPixel(tile_type(),
		 Index :: pos_integer()) -> {pos_integer(),
					     pos_integer()}.

indexPixel(TileType, Index) ->
    to_pixel(TileType, indexTile(Index)).

-spec to_pixel(tile_type(),
	       {X :: pos_integer(), Y :: pos_integer()}) -> {Px ::
								 pos_integer(),
							     Py ::
								 pos_integer()}.

to_pixel(21, {X, Y}) ->
    {round((X - 1 + Y rem 2 / 2) * 30 * 2 + 30 * 5.0e-1),
     round((Y - 1) * 15 + 15 * 5.0e-1)};
to_pixel(22, {X, Y}) ->
    {round((X - 1 + Y rem 2 / 2) * 30 * 2 + 30 * 5.0e-1),
     round((Y - 1) * 15 - 15 * 5.0e-1)};
to_pixel(_, {X, Y}) ->
    {round((X - 1 + Y rem 2 / 2) * 30 * 2), (Y - 1) * 15}.

-spec to_pixel_left(tile_type(),
		    {X :: pos_integer(), Y :: pos_integer()}) -> {Px ::
								      pos_integer(),
								  Py ::
								      pos_integer()}.

to_pixel_left(21, {X, Y}) ->
    {round((X - 1 + Y rem 2 / 2) * 30 * 2), Y * 15};
to_pixel_left(22, {X, Y}) ->
    {round((X - 1 + Y rem 2 / 2) * 30 * 2), Y * 15};
to_pixel_left(_, {X, Y}) ->
    {round((X - 1.5 + Y rem 2 / 2) * 30 * 2), (Y - 1) * 15}.

-spec to_pixel_right(tile_type(),
		     {X :: pos_integer(), Y :: pos_integer()}) -> {Px ::
								       pos_integer(),
								   Py ::
								       pos_integer()}.

to_pixel_right(21, {X, Y}) ->
    {round((X - 5.0e-1 + Y rem 2 / 2) * 30 * 2),
     (Y - 1) * 15};
to_pixel_right(22, {X, Y}) ->
    {round((X - 5.0e-1 + Y rem 2 / 2) * 30 * 2),
     (Y - 3) * 15};
to_pixel_right(_, {X, Y}) ->
    {round((X - 5.0e-1 + Y rem 2 / 2) * 30 * 2),
     (Y - 1) * 15}.

-spec to_pixel_top(tile_type(),
		   {X :: pos_integer(), Y :: pos_integer()}) -> {Px ::
								     pos_integer(),
								 Py ::
								     pos_integer()}.

to_pixel_top(21, {X, Y}) ->
    {round((X - 1 + Y rem 2 / 2) * 30 * 2 + 30),
     Y * 15 + 15};
to_pixel_top(22, {X, Y}) ->
    {round((X - 5.0e-1 + Y rem 2 / 2) * 30 * 2),
     (Y - 1) * 15};
to_pixel_top(_, {X, Y}) ->
    {round((X - 1 + Y rem 2 / 2) * 30 * 2), Y * 15}.

-spec to_pixel_bottom(tile_type(),
		      {X :: pos_integer(), Y :: pos_integer()}) -> {Px ::
									pos_integer(),
								    Py ::
									pos_integer()}.

to_pixel_bottom(21, {X, Y}) ->
    {round((X - 1 + Y rem 2 / 2) * 30 * 2), (Y - 2) * 15};
to_pixel_bottom(22, {X, Y}) ->
    {round((X - 1 + Y rem 2 / 2) * 30 * 2), (Y - 2) * 15};
to_pixel_bottom(_, {X, Y}) ->
    {round((X - 1 + Y rem 2 / 2) * 30 * 2), (Y - 2) * 15}.

-spec to_tile({X :: pos_integer(),
	       Y :: pos_integer()}) -> {Px :: pos_integer(),
					Py :: pos_integer()}.

to_tile({X, Y}) ->
    Tx0 = util:ceil(X / 30),
    Ty0 = util:ceil(Y / 15),
    Tx1 = util:ceil((Tx0 + (Ty0 - 1) rem 2) / 2),
    Tx2 = util:ceil((Tx0 + Ty0 rem 2) / 2),
    Ty1 = Ty0,
    Ty2 = Ty0 + 1,
    {X1, Y1} = to_pixel(20, {Tx1, Ty1}),
    {X2, Y2} = to_pixel(20, {Tx2, Ty2}),
    case abs(X1 - X) + abs(Y1 - Y) <
	   abs(X2 - X) + abs(Y2 - Y)
	of
      true -> {Tx1, Ty1};
      false -> {Tx2, Ty2}
    end.

-spec tile_offset({X :: pos_integer(),
		   Y :: pos_integer()},
		  I :: pos_integer(), J :: pos_integer()) -> {Tx ::
								  pos_integer(),
							      Ty ::
								  pos_integer()}.

tile_offset({X, Y}, 0, 0) -> {X, Y};
tile_offset({X, Y}, I, J) ->
    A = I - J,
    case A rem 2 of
      0 -> {X + util:floor(A / 2), Y + I + J};
      _ -> {X + util:floor(A / 2) + Y rem 2, Y + I + J}
    end.

-spec tiles_offset({X :: pos_integer(),
		    Y :: pos_integer()},
		   list()) -> list().

tiles_offset({X, Y}, L) ->
    [tile_offset({X, Y}, I, J) || {I, J} <- L].

-spec index_offset(pos_integer(),
		   tuple() | list()) -> pos_integer() | list().

index_offset(Index, {0, 0}) -> Index;
index_offset(Index, {X, Y}) ->
    {X1, Y1} = indexTile(Index),
    {X2, Y2} = tile_offset({X1, Y1}, X, Y),
    tileIndex({X2, Y2});
index_offset(_Index, []) -> [];
index_offset(Index, L) ->
    [index_offset(Index, {X, Y}) || {X, Y} <- L].

-spec get_offset({X1 :: pos_integer(),
		  Y1 :: pos_integer()},
		 {X2 :: pos_integer(), Y2 :: pos_integer()}) -> {X ::
								     pos_integer(),
								 Y ::
								     pos_integer()}.

get_offset({X1, Y1}, {X1, Y1}) -> {0, 0};
get_offset({X1, Y1}, {X2, Y2}) ->
    X0 = X2 - X1,
    Y0 = Y2 - Y1,
    case Y0 rem 2 of
      0 -> {util:ceil(X0 + Y0 / 2), util:floor(Y0 / 2) - X0};
      _ ->
	  {util:ceil(X0 - Y1 rem 2 + Y0 / 2),
	   util:floor(Y0 / 2) - X0}
    end.

-spec tile_distance({X1 :: pos_integer(),
		     Y1 :: pos_integer()},
		    {X2 :: pos_integer(), Y2 :: pos_integer()}) -> S ::
								       pos_integer().

tile_distance({X1, Y1}, {X1, Y1}) -> 0;
tile_distance({X1, Y1}, {X2, Y2}) ->
    {X0, Y0} = get_offset({X1, Y1}, {X2, Y2}),
    max(abs(X0), abs(Y0)).

-spec index_distance(Index1 :: pos_integer(),
		     Index2 :: pos_integer()) -> S :: pos_integer().

index_distance(Index, Index) -> 0;
index_distance(Index1, Index2) ->
    tile_distance(indexTile(Index1), indexTile(Index2)).

-spec index_pixel_distance(tile_type(),
			   Index1 :: pos_integer(),
			   Index2 :: pos_integer()) -> S :: pos_integer().

index_pixel_distance(TileType, Index1, Index2) ->
    {Px1, Py1} = indexPixel(TileType, Index1),
    {Px2, Py2} = indexPixel(TileType, Index2),
    X = Px1 - Px2,
    Y = Py1 - Py2,
    round(math:sqrt(X * X + Y * Y)).

-spec tile_range_pixel(tile_type(),
		       {X :: pos_integer(), Y :: pos_integer()},
		       W :: pos_integer(), H :: pos_integer()) -> {Px ::
								       pos_integer(),
								   Py ::
								       pos_integer()}.

tile_range_pixel(TileType, {X, Y}, 1, 1) ->
    to_pixel(TileType, {X, Y});
tile_range_pixel(TileType, {X, Y}, W0, H0) ->
    W = max(1, W0),
    H = max(1, H0),
    case {W rem 2, H rem 2} of
      {0, 0} -> to_pixel_left(TileType, {X, Y});
      {1, 1} -> to_pixel(TileType, {X, Y});
      {0, 1} ->
	  {X1, Y1} = to_pixel_left(TileType, {X, Y}),
	  {X2, Y2} = to_pixel_bottom(TileType, {X, Y}),
	  {round((X1 + X2) / 2), round((Y1 + Y2) / 2)};
      {1, 0} ->
	  {X1, Y1} = to_pixel_right(TileType, {X, Y}),
	  {X2, Y2} = to_pixel_bottom(TileType, {X, Y}),
	  {round((X1 + X2) / 2), round((Y1 + Y2) / 2)}
    end.

-spec tile_range({X :: pos_integer(),
		  Y :: pos_integer()},
		 W :: pos_integer(), H :: pos_integer()) -> list().

tile_range({X, Y}, 1, 1) -> [{X, Y}];
tile_range({X, Y}, W0, H0) ->
    W = max(1, W0),
    H = max(1, H0),
    X1 = -W div 2,
    X2 = X1 + W - 1,
    Y1 = -H div 2,
    Y2 = Y1 + H - 1,
    Xl = lists:seq(X1, X2),
    Yl = lists:seq(Y1, Y2),
    [tile_offset({X, Y}, I, J) || J <- Yl, I <- Xl].

-spec rhomb_tiles({X :: pos_integer(),
		   Y :: pos_integer()},
		  R :: pos_integer()) -> list().

rhomb_tiles({X, Y}, R) ->
    L0 = lists:seq(-R, R),
    [tile_offset({X, Y}, I, J) || I <- L0, J <- L0].

-spec rhomb_indexs(Index :: pos_integer(),
		   R :: pos_integer()) -> list().

rhomb_indexs(Index, R) ->
    L0 = lists:seq(-R, R),
    [index_offset(Index, {I, J}) || I <- L0, J <- L0].

-spec rect_tiles({X :: pos_integer(),
		  Y :: pos_integer()},
		 W :: pos_integer(), H :: pos_integer()) -> list().

rect_tiles({X, Y}, 0, 0) -> [{X, Y}];
rect_tiles({X, Y}, W, H) ->
    [{X + I, Y + J}
     || I <- lists:seq(-W, W), J <- lists:seq(-H, H)].

-spec screen_points(pos_integer()) -> tuple().

screen_points(Index) ->
    {X, Y} = indexPixel(20, Index),
    PW = 4 * 30 * 2,
    PH = 8 * 15,
    {{X - PW, Y - PH}, {X + PW, Y - PH}, {X + PW, Y + PH},
     {X - PW, Y + PH}}.

-spec line_in_rect(pos_integer(), pos_integer(),
		   tuple()) -> true | false.

line_in_rect(StartIndex, EndIndex,
	     {{X1, Y1}, {X2, Y2}, {X3, Y3}, {X4, Y4}}) ->
    {SX, SY} = indexPixel(20, StartIndex),
    {EX, EY} = indexPixel(20, EndIndex),
    point:check_rectangle({SX, SY}, {X1, Y1}, {X3, Y3})
      orelse
      point:seg_in_rect({SX, SY}, {EX, EY}, {X1, Y1},
			{X2, Y2})
	orelse
	point:seg_in_rect({SX, SY}, {EX, EY}, {X2, Y2},
			  {X3, Y3})
	  orelse
	  point:seg_in_rect({SX, SY}, {EX, EY}, {X3, Y3},
			    {X4, Y4})
	    orelse
	    point:seg_in_rect({SX, SY}, {EX, EY}, {X1, Y1},
			      {X4, Y4}).


