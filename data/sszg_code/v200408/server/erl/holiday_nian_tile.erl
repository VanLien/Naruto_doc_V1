-file("src/mod/holiday_nian/holiday_nian_tile.erl", 1).

-module(holiday_nian_tile).

-lager_records([{map_data,
		 [bid, type, name, def_xy, min_lev, max_lev, condition,
		  relive, width, height, grid_x, grid_y, max_pre_layer,
		  start_type, is_single, unit_list, tile_res_list]},
		{map_grid, [map_pid, map_id, base_id, width, height]},
		{map,
		 [id, srv_id, base_id, res_id, pid, ctrl_pid, grid_info,
		  name, condition, num, max_pre_layer, width, height,
		  dynamic_block, layer_flag]},
		{map_role,
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
		  p_eqm, p_home]}]).

-export([tile_max/1, indexTile/1, tileIndex/1,
	 indexPixel/1, to_pixel/1, to_pixel_left/1,
	 to_pixel_right/1, to_pixel_top/1, to_pixel_bottom/1,
	 to_tile/1, tile_offset/3, tiles_offset/2,
	 index_offset/2, get_offset/2, tile_distance/2,
	 index_distance/2, index_pixel_distance/2,
	 tile_range_pixel/3, tile_range/3, rhomb_tiles/2,
	 rhomb_indexs/2, rect_tiles/3, screen_points/1,
	 line_in_rect/3, check_moveto/2, check_click/2]).

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

-file("src/mod/holiday_nian/holiday_nian_tile.erl", 36).

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

-file("src/mod/holiday_nian/holiday_nian_tile.erl", 37).

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

-file("src/mod/holiday_nian/holiday_nian_tile.erl", 38).

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

-spec indexPixel(Index ::
		     pos_integer()) -> {pos_integer(), pos_integer()}.

indexPixel(Index) -> to_pixel(indexTile(Index)).

to_pixel({X, Y}) ->
    {round((X - 1 + Y rem 2 / 2) * 192 * 2), (Y - 1) * 96}.

-spec to_pixel_left({X :: pos_integer(),
		     Y :: pos_integer()}) -> {Px :: pos_integer(),
					      Py :: pos_integer()}.

to_pixel_left({X, Y}) ->
    {round((X - 1.5 + Y rem 2 / 2) * 192 * 2),
     (Y - 1) * 96}.

-spec to_pixel_right({X :: pos_integer(),
		      Y :: pos_integer()}) -> {Px :: pos_integer(),
					       Py :: pos_integer()}.

to_pixel_right({X, Y}) ->
    {round((X - 5.0e-1 + Y rem 2 / 2) * 192 * 2),
     (Y - 1) * 96}.

-spec to_pixel_top({X :: pos_integer(),
		    Y :: pos_integer()}) -> {Px :: pos_integer(),
					     Py :: pos_integer()}.

to_pixel_top({X, Y}) ->
    {round((X - 1 + Y rem 2 / 2) * 192 * 2), Y * 96}.

-spec to_pixel_bottom({X :: pos_integer(),
		       Y :: pos_integer()}) -> {Px :: pos_integer(),
						Py :: pos_integer()}.

to_pixel_bottom({X, Y}) ->
    {round((X - 1 + Y rem 2 / 2) * 192 * 2), (Y - 2) * 96}.

-spec to_tile({X :: pos_integer(),
	       Y :: pos_integer()}) -> {Px :: pos_integer(),
					Py :: pos_integer()}.

to_tile({X, Y}) ->
    Tx0 = util:ceil(X / 192),
    Ty0 = util:ceil(Y / 96),
    Tx1 = util:ceil((Tx0 + (Ty0 - 1) rem 2) / 2),
    Tx2 = util:ceil((Tx0 + Ty0 rem 2) / 2),
    Ty1 = Ty0,
    Ty2 = Ty0 + 1,
    {X1, Y1} = to_pixel({Tx1, Ty1}),
    {X2, Y2} = to_pixel({Tx2, Ty2}),
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
    OffX = case Y0 rem 2 of
	     0 -> util:ceil(X0 + Y0 / 2);
	     _ -> util:ceil(X0 - Y1 rem 2 + Y0 / 2)
	   end,
    {OffX, OffX - Y0};
get_offset(Index1, Index2) ->
    get_offset(indexTile(Index1), indexTile(Index2)).

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

-spec index_pixel_distance(Index1 :: pos_integer(),
			   Index2 :: pos_integer()) -> S :: pos_integer().

index_pixel_distance(Index1, Index2) ->
    {Px1, Py1} = indexPixel(Index1),
    {Px2, Py2} = indexPixel(Index2),
    X = Px1 - Px2,
    Y = Py1 - Py2,
    round(math:sqrt(X * X + Y * Y)).

-spec tile_range_pixel({X :: pos_integer(),
			Y :: pos_integer()},
		       W :: pos_integer(), H :: pos_integer()) -> {Px ::
								       pos_integer(),
								   Py ::
								       pos_integer()}.

tile_range_pixel({X, Y}, 1, 1) -> to_pixel({X, Y});
tile_range_pixel({X, Y}, W0, H0) ->
    W = max(1, W0),
    H = max(1, H0),
    case {W rem 2, H rem 2} of
      {0, 0} -> to_pixel_left({X, Y});
      {1, 1} -> to_pixel({X, Y});
      {0, 1} ->
	  {X1, Y1} = to_pixel_left({X, Y}),
	  {X2, Y2} = to_pixel_bottom({X, Y}),
	  {round((X1 + X2) / 2), round((Y1 + Y2) / 2)};
      {1, 0} ->
	  {X1, Y1} = to_pixel_right({X, Y}),
	  {X2, Y2} = to_pixel_bottom({X, Y}),
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
    {X, Y} = indexPixel(Index),
    PW = 4 * 192 * 2,
    PH = 8 * 96,
    {{X - PW, Y - PH}, {X + PW, Y - PH}, {X + PW, Y + PH},
     {X - PW, Y + PH}}.

-spec line_in_rect(pos_integer(), pos_integer(),
		   tuple()) -> true | false.

line_in_rect(StartIndex, EndIndex,
	     {{X1, Y1}, {X2, Y2}, {X3, Y3}, {X4, Y4}}) ->
    {SX, SY} = indexPixel(StartIndex),
    {EX, EY} = indexPixel(EndIndex),
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

-spec check_moveto(pos_integer(),
		   pos_integer()) -> true | false.

check_moveto(Index, Index) -> false;
check_moveto(NowIndex, ToIndex) ->
    case get_offset(NowIndex, ToIndex) of
      {-1, 0} -> true;
      {1, 0} -> true;
      {0, -1} -> true;
      {0, 1} -> true;
      _ -> false
    end.

-spec check_click(pos_integer(),
		  pos_integer()) -> true | false.

check_click(Index, Index) -> true;
check_click(NowIndex, ToIndex) ->
    case get_offset(NowIndex, ToIndex) of
      {-1, 0} -> true;
      {1, 0} -> true;
      {0, -1} -> true;
      {0, 1} -> true;
      _ -> false
    end.


