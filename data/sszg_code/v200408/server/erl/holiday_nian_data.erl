-file("src/mod/data/holiday_nian_data.erl", 1).

-module(holiday_nian_data).

-lager_records([{player,
		 [ver, r_id, name, look_id, honor_id, face]},
		{role_monster_rank,
		 [ver, r_id, lev, face_id, avatar_bid, name, dps, power,
		  rank, unixtime]},
		{holiday_nian_item, [ver, id, base_id, num]},
		{holiday_nian_evt_data,
		 [id, type, ext, win_reward_list, main_id]},
		{holiday_nian,
		 [ver, platform_zone, camp_id, update_time, val,
		  timer_event_list, red_packet_update_time,
		  last_red_packet_num, red_packet_information,
		  timer_monster_time, timer_monster_end_unixtime,
		  timer_monster_rank, gold_monster_end_unixtime,
		  gold_monster_rank, red_packet_radio]},
		{nian_tile,
		 [ver, index, is_walk, evtid, group_id, res_id, is_born,
		  ext]},
		{m_holiday_nian,
		 [ver, camp_id, now, tile_list, update_time,
		  red_packet_update_time, timer_monster_update_time,
		  map_id, bag, bag_next_id, power, power_unixtime,
		  timer_monster_combat_time, gold_monster_combat_time,
		  collection, old_data, is_gold, face, player,
		  player_unixtime]}]).

-export([get_const/1, get_all_event_group/0,
	 get_event_id/1, get_event_limit/1, get_event_type/1,
	 get_event_walk/1, get_evt/1, get_reward/1,
	 get_all_val/0, get_tribute/0, get_monster_id/1,
	 get_monster_lev/1, get_monster_reward/1,
	 get_robot_ids/1, get_gold_monster_rank_reward/1,
	 get_collection_time/1, get_collection_loss_gain/1,
	 get_collection_list/0, get_small_monster_lev/1,
	 get_red_packet_radio/1, get_red_packet_radio2/1,
	 get_log_name/1, get_log_dps/1]).

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

-file("src/mod/data/holiday_nian_data.erl", 32).

-file("inc/holiday_nian.hrl", 1).

-record(m_holiday_nian,
	{ver = 2  :: pos_integer(),
	 camp_id = 0  :: pos_integer(),
	 now = 0  :: pos_integer(), tile_list = []  :: list(),
	 update_time = 0  :: pos_integer(),
	 red_packet_update_time = 0  :: pos_integer(),
	 timer_monster_update_time = 0  :: pos_integer(),
	 map_id = 0  :: pos_integer(), bag = []  :: list(),
	 bag_next_id = 1  :: list(), power = 0  :: pos_integer(),
	 power_unixtime = 0  :: pos_integer(),
	 timer_monster_combat_time = {0, 0}  :: pos_integer(),
	 gold_monster_combat_time = {0, 0}  :: pos_integer(),
	 collection = []  :: list(), old_data = []  :: list(),
	 is_gold = 0  :: boolean(), face = []  :: list(),
	 player = []  :: list(),
	 player_unixtime = 0  :: pos_integer()}).

-record(nian_tile,
	{ver = 1  :: pos_integer(), index = 0  :: pos_integer(),
	 is_walk = 0  :: pos_integer(),
	 evtid = 0  :: pos_integer(),
	 group_id = 0  :: pos_integer(),
	 res_id = 0  :: pos_integer(),
	 is_born = 0  :: pos_integer(), ext = []  :: list()}).

-record(holiday_nian,
	{ver = 2  :: pos_integer(),
	 platform_zone = {<<>>, 0}  :: tuple(),
	 camp_id = 0  :: pos_integer(),
	 update_time = 0  :: pos_integer(),
	 val = 0  :: pos_integer(),
	 timer_event_list = []  :: list(),
	 red_packet_update_time = 0  :: pos_integer(),
	 last_red_packet_num = 0  :: pos_integer(),
	 red_packet_information = []  :: list(),
	 timer_monster_time = 0  :: pos_integer(),
	 timer_monster_end_unixtime = 0  :: pos_integer(),
	 timer_monster_rank = []  :: pos_integer(),
	 gold_monster_end_unixtime = 0  :: pos_integer(),
	 gold_monster_rank = []  :: pos_integer(),
	 red_packet_radio = 0  :: pos_integer()}).

-record(holiday_nian_evt_data,
	{id = 0  :: pos_integer(), type = 0  :: pos_integer(),
	 ext = []  :: list(), win_reward_list = []  :: list(),
	 main_id = 0  :: pos_integer()}).

-record(holiday_nian_item,
	{ver = 1  :: pos_integer(), id = 1  :: pos_integer(),
	 base_id = 0  :: pos_integer(),
	 num = 0  :: pos_integer()}).

-record(role_monster_rank,
	{ver = 1  :: pos_integer(),
	 r_id = {0, <<>>}  :: tuple(), lev = 0  :: pos_integer(),
	 face_id = 0  :: pos_integer(),
	 avatar_bid = 0  :: pos_integer(),
	 name = <<>>  :: string(), dps = 0  :: pos_integer(),
	 power = 0  :: pos_integer(), rank = 0  :: pos_integer(),
	 unixtime = 0  :: pos_integer()}).

-record(player,
	{ver = 1  :: pos_integer(),
	 r_id = {0, <<>>}  :: tuple(), name = <<>>  :: string(),
	 look_id = 0  :: pos_integer(),
	 honor_id = 0  :: pos_integer(), face = []  :: list()}).

-file("src/mod/data/holiday_nian_data.erl", 33).

get_const(start_time) -> 0;
get_const(open_lev) -> 40;
get_const(holiday_nian_red_packet_day_limit) -> 5;
get_const(holiday_nian_red_packet_max_num) -> 50;
get_const(holiday_nian_red_packet_display_num) -> 20;
get_const(other_players_limit) -> 5;
get_const(other_players_time) -> 600;
get_const(holiday_nian_default_face) ->
    [{1, 1}, {2, 2}, {3, 6}];
get_const(package_item) ->
    {80301, 80302, 80303, 80304, 80305, 80306, 80307, 80308,
     80351, 80352};
get_const(firework_itemid) -> 80352;
get_const(firework_reward_drop) -> 82003;
get_const(holiday_nian_gold_nian_appears) ->
    {2021, 8, 14, 8, 59, 59};
get_const(holiday_nian_timer_monster_free_time) -> 2;
get_const(holiday_nian_timer_monster_buy_time) -> 3;
get_const(holiday_nian_timer_monster_buy_price) ->
    [{3, 100}];
get_const(holiday_nian_gold_monster_free_time) -> 4;
get_const(holiday_nian_gold_monster_buy_time) -> 6;
get_const(holiday_nian_gold_monster_buy_price) ->
    [{3, 100}];
get_const(holiday_nian_timer_monster_time) -> 86400;
get_const(holiday_nian_gold_monster_time) -> 172800;
get_const(holiday_nian_tribute_id) -> 80351;
get_const(holiday_nian_desc) -> 0;
get_const(holiday_nian_fight_desc) -> 0;
get_const(holiday_nian_tribute_desc) -> 0;
get_const(exchange_desc) -> 0;
get_const(holiday_nian_update_time) ->
    [{1, 5}, {2, 3600}, {3, 7200}, {4, 10800}, {5, 14400},
     {6, 18000}, {7, 21600}, {8, 25200}, {9, 28800},
     {10, 32400}, {11, 36000}, {12, 39600}, {13, 43200},
     {14, 46800}, {15, 50400}, {16, 54000}, {17, 57600},
     {18, 61200}, {19, 64800}, {20, 68400}, {21, 72000},
     {22, 75600}, {23, 79200}, {24, 82800}];
get_const(holiday_nian_power_time) -> 24;
get_const(holiday_nian_map_id) -> 100001;
get_const(map_bg) -> map_bg_100001;
get_const(make_progress_value) -> 50;
get_const(make_progress_cd) -> 48;
get_const(make_progress_check_cd) -> 3600;
get_const(_) -> undefined.

get_all_event_group() ->
    [{90231, [{90231, 1000}], 1, [1]},
     {90221, [{90221, 1000}], 1, [1]},
     {90211, [{90211, 1000}], 1, [1]},
     {90131, [{90131, 1000}], 1, [1]},
     {90121, [{90121, 1000}], 1, [1]},
     {90111, [{90111, 1000}], 1, [1]},
     {19052, [{19052, 1000}], 1, [1]},
     {19051, [{19051, 1000}], 1, [1]},
     {19002, [{19002, 1000}], 1, [1]},
     {19001, [{19001, 1000}], 1, [1]},
     {10801, [{10801, 1000}], 1, [1, 7, 13, 19]},
     {10701, [{10701, 1000}], 2, []},
     {10601, [{10601, 1000}], 1,
      [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23]},
     {10501, [{10501, 1000}], 1,
      [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23]},
     {10401, [{10401, 1000}], 1, [1, 9, 17]},
     {10300,
      [{10301, 70}, {10302, 70}, {10303, 15}, {10304, 10}], 1,
      [1, 5, 9, 13, 17, 21]},
     {10202, [{10202, 1000}], 1, [1]},
     {10201, [{10201, 1000}], 1, [1]},
     {10101, [{10101, 1000}], 1, [1]},
     {10001, [{10001, 1000}], 1, [1]}].

get_event_id(10001) -> [{10001, 1000}];
get_event_id(10101) -> [{10101, 1000}];
get_event_id(10201) -> [{10201, 1000}];
get_event_id(10202) -> [{10202, 1000}];
get_event_id(10300) ->
    [{10301, 70}, {10302, 70}, {10303, 15}, {10304, 10}];
get_event_id(10401) -> [{10401, 1000}];
get_event_id(10501) -> [{10501, 1000}];
get_event_id(10601) -> [{10601, 1000}];
get_event_id(10701) -> [{10701, 1000}];
get_event_id(10801) -> [{10801, 1000}];
get_event_id(19001) -> [{19001, 1000}];
get_event_id(19002) -> [{19002, 1000}];
get_event_id(19051) -> [{19051, 1000}];
get_event_id(19052) -> [{19052, 1000}];
get_event_id(90111) -> [{90111, 1000}];
get_event_id(90121) -> [{90121, 1000}];
get_event_id(90131) -> [{90131, 1000}];
get_event_id(90211) -> [{90211, 1000}];
get_event_id(90221) -> [{90221, 1000}];
get_event_id(90231) -> [{90231, 1000}];
get_event_id(_Info) ->
    logger:data_error("get_event_id_data_not_exist===>~w",
		      [_Info], holiday_nian_data, 90),
    undefined.

get_event_limit(0) -> 999;
get_event_limit(2) -> 1;
get_event_limit(3) -> 1;
get_event_limit(5) -> 2;
get_event_limit(8) -> 2;
get_event_limit(9) -> 2;
get_event_limit(10) -> 2;
get_event_limit(4) -> 2;
get_event_limit(11) -> 4;
get_event_limit(1) -> 3;
get_event_limit(12) -> 9;
get_event_limit(13) -> 9;
get_event_limit(7) -> 999;
get_event_limit(14) -> 9;
get_event_limit(15) -> 9;
get_event_limit(_) -> undefined.

get_event_type(0) -> 0;
get_event_type(10001) -> 2;
get_event_type(10101) -> 3;
get_event_type(10201) -> 5;
get_event_type(10202) -> 5;
get_event_type(10301) -> 8;
get_event_type(10302) -> 8;
get_event_type(10303) -> 8;
get_event_type(10304) -> 8;
get_event_type(10401) -> 4;
get_event_type(10501) -> 9;
get_event_type(10601) -> 10;
get_event_type(10701) -> 11;
get_event_type(10801) -> 1;
get_event_type(19001) -> 14;
get_event_type(19002) -> 14;
get_event_type(19003) -> 12;
get_event_type(19004) -> 12;
get_event_type(19051) -> 15;
get_event_type(19052) -> 15;
get_event_type(19053) -> 13;
get_event_type(19054) -> 13;
get_event_type(90111) -> 7;
get_event_type(90112) -> 7;
get_event_type(90121) -> 7;
get_event_type(90122) -> 7;
get_event_type(90131) -> 7;
get_event_type(90132) -> 7;
get_event_type(90211) -> 7;
get_event_type(90212) -> 7;
get_event_type(90221) -> 7;
get_event_type(90222) -> 7;
get_event_type(90231) -> 7;
get_event_type(90232) -> 7;
get_event_type(_) -> undefined.

get_event_walk(0) -> 1;
get_event_walk(10001) -> 1;
get_event_walk(10101) -> 0;
get_event_walk(10201) -> 0;
get_event_walk(10202) -> 0;
get_event_walk(10301) -> 0;
get_event_walk(10302) -> 0;
get_event_walk(10303) -> 0;
get_event_walk(10304) -> 0;
get_event_walk(10401) -> 0;
get_event_walk(10501) -> 0;
get_event_walk(10601) -> 0;
get_event_walk(10701) -> 0;
get_event_walk(10801) -> 0;
get_event_walk(19001) -> 0;
get_event_walk(19002) -> 0;
get_event_walk(19003) -> 0;
get_event_walk(19004) -> 0;
get_event_walk(19051) -> 0;
get_event_walk(19052) -> 0;
get_event_walk(19053) -> 0;
get_event_walk(19054) -> 0;
get_event_walk(90111) -> 0;
get_event_walk(90112) -> 0;
get_event_walk(90121) -> 0;
get_event_walk(90122) -> 0;
get_event_walk(90131) -> 0;
get_event_walk(90132) -> 0;
get_event_walk(90211) -> 0;
get_event_walk(90212) -> 0;
get_event_walk(90221) -> 0;
get_event_walk(90222) -> 0;
get_event_walk(90231) -> 0;
get_event_walk(90232) -> 0;
get_event_walk(_) -> undefined.

get_evt(0) -> #holiday_nian_evt_data{id = 0, type = 0};
get_evt(10001) ->
    #holiday_nian_evt_data{id = 10001, type = 2};
get_evt(10101) ->
    #holiday_nian_evt_data{id = 10101, type = 3,
			   ext = [10101]};
get_evt(10201) ->
    #holiday_nian_evt_data{id = 10201, type = 5,
			   ext = [{10201, 500}]};
get_evt(10202) ->
    #holiday_nian_evt_data{id = 10202, type = 5,
			   ext = [{10202, 500}]};
get_evt(10301) ->
    #holiday_nian_evt_data{id = 10301, type = 8,
			   win_reward_list = [10301]};
get_evt(10302) ->
    #holiday_nian_evt_data{id = 10302, type = 8,
			   win_reward_list = [10302]};
get_evt(10303) ->
    #holiday_nian_evt_data{id = 10303, type = 8,
			   win_reward_list = [10303]};
get_evt(10304) ->
    #holiday_nian_evt_data{id = 10304, type = 8,
			   win_reward_list = [10304]};
get_evt(10401) ->
    #holiday_nian_evt_data{id = 10401, type = 4,
			   win_reward_list = [10401]};
get_evt(10501) ->
    #holiday_nian_evt_data{id = 10501, type = 9,
			   win_reward_list = [10501]};
get_evt(10601) ->
    #holiday_nian_evt_data{id = 10601, type = 10,
			   win_reward_list = [10601]};
get_evt(10701) ->
    #holiday_nian_evt_data{id = 10701, type = 11,
			   win_reward_list = [10701]};
get_evt(10801) ->
    #holiday_nian_evt_data{id = 10801, type = 1,
			   ext = [97004], win_reward_list = [10801]};
get_evt(19001) ->
    #holiday_nian_evt_data{id = 19001, type = 14,
			   ext = [19003]};
get_evt(19002) ->
    #holiday_nian_evt_data{id = 19002, type = 14,
			   ext = [19004]};
get_evt(19003) ->
    #holiday_nian_evt_data{id = 19003, type = 12,
			   ext = [19001]};
get_evt(19004) ->
    #holiday_nian_evt_data{id = 19004, type = 12,
			   ext = [19002]};
get_evt(19051) ->
    #holiday_nian_evt_data{id = 19051, type = 15,
			   ext = [19053]};
get_evt(19052) ->
    #holiday_nian_evt_data{id = 19052, type = 15,
			   ext = [19054]};
get_evt(19053) ->
    #holiday_nian_evt_data{id = 19053, type = 13,
			   ext = [19051]};
get_evt(19054) ->
    #holiday_nian_evt_data{id = 19054, type = 13,
			   ext = [19052]};
get_evt(90111) ->
    #holiday_nian_evt_data{id = 90111, type = 7};
get_evt(90112) ->
    #holiday_nian_evt_data{id = 90112, type = 7};
get_evt(90121) ->
    #holiday_nian_evt_data{id = 90121, type = 7};
get_evt(90122) ->
    #holiday_nian_evt_data{id = 90122, type = 7};
get_evt(90131) ->
    #holiday_nian_evt_data{id = 90131, type = 7};
get_evt(90132) ->
    #holiday_nian_evt_data{id = 90132, type = 7};
get_evt(90211) ->
    #holiday_nian_evt_data{id = 90211, type = 7};
get_evt(90212) ->
    #holiday_nian_evt_data{id = 90212, type = 7};
get_evt(90221) ->
    #holiday_nian_evt_data{id = 90221, type = 7};
get_evt(90222) ->
    #holiday_nian_evt_data{id = 90222, type = 7};
get_evt(90231) ->
    #holiday_nian_evt_data{id = 90231, type = 7};
get_evt(90232) ->
    #holiday_nian_evt_data{id = 90232, type = 7};
get_evt(_) -> undefined.

get_reward(10301) -> {1, [{80301, 1}]};
get_reward(10302) -> {1, [{80302, 1}]};
get_reward(10303) -> {1, [{80303, 1}]};
get_reward(10304) -> {1, [{80304, 1}]};
get_reward(10401) -> {3, [82001]};
get_reward(10501) -> {1, [{80351, 1}]};
get_reward(10601) -> {1, [{80352, 1}]};
get_reward(10701) -> {3, [82002]};
get_reward(10801) ->
    {1, [{80351, 5}, {1, 25000}, {22, 10000}]};
get_reward(_Info) ->
    logger:data_error("get_reward_data_not_exist===>~w",
		      [_Info], holiday_nian_data, 383),
    undefined.

get_all_val() -> [1800, 1350, 450].

get_tribute() -> [{1800, 1}, {1350, 1}, {450, 1}].

get_monster_id({Time, 12})
    when Time >= 1 andalso Time =< 999 ->
    97001;
get_monster_id({Time, 13})
    when Time >= 1 andalso Time =< 999 ->
    97003;
get_monster_id(_Info) ->
    logger:data_error("get_monster_id_data_not_exist===>~w",
		      [_Info], holiday_nian_data, 391),
    undefined.

get_monster_lev({WorldLev, 12})
    when WorldLev >= 1 andalso WorldLev =< 999 ->
    188;
get_monster_lev({WorldLev, 13})
    when WorldLev >= 1 andalso WorldLev =< 999 ->
    188;
get_monster_lev(_Info) ->
    logger:data_error("get_monster_lev_data_not_exist===>~w",
		      [_Info], holiday_nian_data, 395),
    undefined.

get_monster_reward({Dps, 12})
    when Dps >= 0 andalso Dps =< 5000 ->
    [82004];
get_monster_reward({Dps, 12})
    when Dps >= 5000 andalso Dps =< 15000 ->
    [82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 15000 andalso Dps =< 30000 ->
    [82004, 82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 30000 andalso Dps =< 60000 ->
    [82004, 82004, 82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 60000 andalso Dps =< 110000 ->
    [82004, 82004, 82004, 82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 110000 andalso Dps =< 190000 ->
    [82004, 82004, 82004, 82004, 82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 190000 andalso Dps =< 310000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 310000 andalso Dps =< 560000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004];
get_monster_reward({Dps, 12})
    when Dps >= 560000 andalso Dps =< 910000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004];
get_monster_reward({Dps, 12})
    when Dps >= 910000 andalso Dps =< 1410000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 1410000 andalso Dps =< 2110000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 2110000 andalso Dps =< 3110000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 3110000 andalso Dps =< 4610000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004, 82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 4610000 andalso Dps =< 6610000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004, 82004, 82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 6610000 andalso Dps =< 9610000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004, 82004, 82004, 82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 9610000 andalso Dps =< 13610000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 13610000 andalso Dps =< 18610000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004];
get_monster_reward({Dps, 12})
    when Dps >= 18610000 andalso Dps =< 24610000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 24610000 andalso Dps =< 31610000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 31610000 andalso Dps =< 40610000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 40610000 andalso Dps =< 50610000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004, 82004];
get_monster_reward({Dps, 12})
    when Dps >= 50610000 andalso Dps =< 61610000 ->
    [82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004, 82004, 82004, 82004, 82004, 82004,
     82004, 82004, 82004, 82004];
get_monster_reward({Dps, 13})
    when Dps >= 0 andalso Dps =< 5000 ->
    [82006, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 5000 andalso Dps =< 15000 ->
    [82006, 82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 15000 andalso Dps =< 30000 ->
    [82006, 82005, 82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 30000 andalso Dps =< 60000 ->
    [82006, 82005, 82005, 82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 60000 andalso Dps =< 110000 ->
    [82006, 82005, 82005, 82005, 82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 110000 andalso Dps =< 190000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 190000 andalso Dps =< 310000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005,
     82005];
get_monster_reward({Dps, 13})
    when Dps >= 310000 andalso Dps =< 560000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005];
get_monster_reward({Dps, 13})
    when Dps >= 560000 andalso Dps =< 910000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 910000 andalso Dps =< 1410000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 1410000 andalso Dps =< 2110000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 2110000 andalso Dps =< 3110000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 3110000 andalso Dps =< 4610000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005, 82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 4610000 andalso Dps =< 6610000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005, 82005, 82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 6610000 andalso Dps =< 9610000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005, 82005, 82005, 82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 9610000 andalso Dps =< 13610000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005];
get_monster_reward({Dps, 13})
    when Dps >= 13610000 andalso Dps =< 18610000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 18610000 andalso Dps =< 24610000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 24610000 andalso Dps =< 31610000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 31610000 andalso Dps =< 40610000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 40610000 andalso Dps =< 50610000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005, 82005];
get_monster_reward({Dps, 13})
    when Dps >= 50610000 andalso Dps =< 61610000 ->
    [82006, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005, 82005, 82005, 82005, 82005,
     82005, 82005, 82005, 82005, 82005];
get_monster_reward(_Info) ->
    logger:data_error("get_monster_reward_data_not_exist===>~w",
		      [_Info], holiday_nian_data, 441),
    undefined.

get_robot_ids({10801, MaxPower})
    when MaxPower >= 0 andalso MaxPower =< 90000 ->
    [{67001, 100}, {67002, 100}, {67003, 100}, {67004, 100},
     {67005, 100}, {67006, 100}, {67007, 100}, {67008, 100},
     {67009, 100}, {67010, 100}];
get_robot_ids({10801, MaxPower})
    when MaxPower >= 90001 andalso MaxPower =< 160000 ->
    [{67011, 100}, {67012, 100}, {67013, 100}, {67014, 100},
     {67015, 100}, {67016, 100}, {67017, 100}, {67018, 100},
     {67019, 100}, {67020, 100}];
get_robot_ids({10801, MaxPower})
    when MaxPower >= 160001 andalso MaxPower =< 200000 ->
    [{67021, 100}, {67022, 100}, {67023, 100}, {67024, 100},
     {67025, 100}, {67026, 100}, {67027, 100}, {67028, 100},
     {67029, 100}, {67030, 100}];
get_robot_ids({10801, MaxPower})
    when MaxPower >= 200001 andalso MaxPower =< 250000 ->
    [{67031, 100}, {67032, 100}, {67033, 100}, {67034, 100},
     {67035, 100}, {67036, 100}, {67037, 100}, {67038, 100},
     {67039, 100}, {67040, 100}];
get_robot_ids({10801, MaxPower})
    when MaxPower >= 250001 andalso MaxPower =< 350000 ->
    [{67041, 100}, {67042, 100}, {67043, 100}, {67044, 100},
     {67045, 100}, {67046, 100}, {67047, 100}, {67048, 100},
     {67049, 100}, {67050, 100}];
get_robot_ids({10801, MaxPower})
    when MaxPower >= 350001 andalso MaxPower =< 500000 ->
    [{67051, 100}, {67052, 100}, {67053, 100}, {67054, 100},
     {67055, 100}, {67056, 100}, {67057, 100}, {67058, 100},
     {67059, 100}, {67060, 100}];
get_robot_ids({10801, MaxPower})
    when MaxPower >= 500001 andalso MaxPower =< 900000 ->
    [{67061, 100}, {67062, 100}, {67063, 100}, {67064, 100},
     {67065, 100}, {67066, 100}, {67067, 100}, {67068, 100},
     {67069, 100}, {67070, 100}];
get_robot_ids({10801, MaxPower})
    when MaxPower >= 900001 andalso MaxPower =< 1360000 ->
    [{67071, 100}, {67072, 100}, {67073, 100}, {67074, 100},
     {67075, 100}, {67076, 100}, {67077, 100}, {67078, 100},
     {67079, 100}, {67080, 100}];
get_robot_ids({10801, MaxPower})
    when MaxPower >= 1360001 andalso MaxPower =< 2500000 ->
    [{67081, 100}, {67082, 100}, {67083, 100}, {67084, 100},
     {67085, 100}, {67086, 100}, {67087, 100}, {67088, 100},
     {67089, 100}, {67090, 100}];
get_robot_ids({10801, MaxPower})
    when MaxPower >= 2500001 andalso MaxPower =< 3700000 ->
    [{67091, 100}, {67092, 100}, {67093, 100}, {67094, 100},
     {67095, 100}, {67096, 100}, {67097, 100}, {67098, 100},
     {67099, 100}, {67100, 100}];
get_robot_ids({10801, MaxPower})
    when MaxPower >= 3700001 andalso MaxPower =< 99999999 ->
    [{67101, 100}, {67102, 100}, {67103, 100}, {67104, 100},
     {67105, 100}, {67106, 100}, {67107, 100}, {67108, 100},
     {67109, 100}, {67110, 100}];
get_robot_ids(_Info) ->
    logger:data_error("get_robot_ids_data_not_exist===>~w",
		      [_Info], holiday_nian_data, 454),
    undefined.

get_gold_monster_rank_reward(Rank)
    when Rank >= 1 andalso Rank =< 1 ->
    [{10408, 10}, {60003, 1}];
get_gold_monster_rank_reward(Rank)
    when Rank >= 2 andalso Rank =< 2 ->
    [{10408, 8}, {60003, 1}];
get_gold_monster_rank_reward(Rank)
    when Rank >= 3 andalso Rank =< 3 ->
    [{10408, 6}, {60003, 1}];
get_gold_monster_rank_reward(Rank)
    when Rank >= 4 andalso Rank =< 10 ->
    [{10408, 5}, {60003, 1}];
get_gold_monster_rank_reward(Rank)
    when Rank >= 11 andalso Rank =< 20 ->
    [{10408, 4}, {60003, 1}];
get_gold_monster_rank_reward(Rank)
    when Rank >= 21 andalso Rank =< 50 ->
    [{10408, 3}];
get_gold_monster_rank_reward(Rank)
    when Rank >= 51 andalso Rank =< 100 ->
    [{10408, 2}];
get_gold_monster_rank_reward(Rank)
    when Rank >= 101 andalso Rank =< 200 ->
    [{10408, 1}];
get_gold_monster_rank_reward(_) -> undefined.

get_collection_time(1) -> {1, 1578644831, 1579708799};
get_collection_time(2) -> {1, 1578644831, 1579708799};
get_collection_time(3) -> {1, 1578644831, 1579708799};
get_collection_time(4) -> {5, 1578644831, 1579708799};
get_collection_time(5) -> {20, 1578644831, 1579708799};
get_collection_time(6) -> {99, 1578644831, 1579708799};
get_collection_time(7) -> {99, 1578644831, 1579708799};
get_collection_time(8) -> {20, 1578644831, 1579708799};
get_collection_time(9) -> {20, 1578644831, 1579708799};
get_collection_time(10) -> {1, 1579708800, 1580399999};
get_collection_time(11) -> {1, 1579708800, 1580399999};
get_collection_time(12) -> {1, 1579708800, 1580399999};
get_collection_time(13) -> {1, 1579708800, 1580399999};
get_collection_time(14) -> {10, 1579708800, 1580399999};
get_collection_time(15) -> {99, 1579708800, 1580399999};
get_collection_time(16) -> {99, 1579708800, 1580399999};
get_collection_time(17) -> {20, 1579708800, 1580399999};
get_collection_time(18) -> {20, 1579708800, 1580399999};
get_collection_time(_Info) ->
    logger:data_error("get_collection_time_data_not_exist===>~w",
		      [_Info], holiday_nian_data, 484),
    undefined.

get_collection_loss_gain(1) ->
    {[{80301, 1}, {80302, 1}, {80303, 1}, {80304, 1}],
     [{29905, 50}]};
get_collection_loss_gain(2) ->
    {[{80301, 1}, {80303, 1}, {80304, 1}], [{14001, 1}]};
get_collection_loss_gain(3) ->
    {[{80301, 1}, {80302, 1}, {80304, 1}], [{10603, 1}]};
get_collection_loss_gain(4) ->
    {[{80303, 1}, {80302, 1}], [{10403, 1}]};
get_collection_loss_gain(5) ->
    {[{80301, 1}, {80302, 1}], [{10040, 5}]};
get_collection_loss_gain(6) ->
    {[{80301, 1}], [{22, 10000}]};
get_collection_loss_gain(7) ->
    {[{80302, 1}], [{1, 50000}]};
get_collection_loss_gain(8) ->
    {[{80303, 1}], [{72001, 5}]};
get_collection_loss_gain(9) ->
    {[{80304, 1}], [{10450, 100}]};
get_collection_loss_gain(10) ->
    {[{80301, 1}, {80302, 1}, {80303, 1}, {80304, 1}],
     [{29905, 50}]};
get_collection_loss_gain(11) ->
    {[{80301, 1}, {80302, 1}, {80303, 1}, {80304, 1}],
     [{80401, 1}]};
get_collection_loss_gain(12) ->
    {[{80301, 1}, {80303, 1}, {80304, 1}], [{14001, 1}]};
get_collection_loss_gain(13) ->
    {[{80301, 1}, {80302, 1}, {80304, 1}], [{10603, 1}]};
get_collection_loss_gain(14) ->
    {[{80303, 1}, {80301, 1}, {80302, 1}], [{37010, 1}]};
get_collection_loss_gain(15) ->
    {[{80301, 1}], [{22, 10000}]};
get_collection_loss_gain(16) ->
    {[{80302, 1}], [{1, 50000}]};
get_collection_loss_gain(17) ->
    {[{80303, 1}], [{72001, 5}]};
get_collection_loss_gain(18) ->
    {[{80304, 1}], [{10450, 100}]};
get_collection_loss_gain(_Info) ->
    logger:data_error("get_collection_loss_gain_data_not_exist===>~w",
		      [_Info], holiday_nian_data, 504),
    undefined.

get_collection_list() ->
    [{18, 20}, {17, 20}, {16, 99}, {15, 99}, {14, 10},
     {13, 1}, {12, 1}, {11, 1}, {10, 1}, {9, 20}, {8, 20},
     {7, 99}, {6, 99}, {5, 20}, {4, 5}, {3, 1}, {2, 1},
     {1, 1}].

get_small_monster_lev(MaxPower)
    when MaxPower >= 0 andalso MaxPower =< 90000 ->
    40;
get_small_monster_lev(MaxPower)
    when MaxPower >= 90001 andalso MaxPower =< 160000 ->
    60;
get_small_monster_lev(MaxPower)
    when MaxPower >= 160001 andalso MaxPower =< 200000 ->
    80;
get_small_monster_lev(MaxPower)
    when MaxPower >= 200001 andalso MaxPower =< 250000 ->
    100;
get_small_monster_lev(MaxPower)
    when MaxPower >= 250001 andalso MaxPower =< 350000 ->
    145;
get_small_monster_lev(MaxPower)
    when MaxPower >= 350001 andalso MaxPower =< 500000 ->
    165;
get_small_monster_lev(MaxPower)
    when MaxPower >= 500001 andalso MaxPower =< 900000 ->
    185;
get_small_monster_lev(MaxPower)
    when MaxPower >= 900001 andalso MaxPower =< 1360000 ->
    205;
get_small_monster_lev(MaxPower)
    when MaxPower >= 1360001 andalso MaxPower =< 2500000 ->
    255;
get_small_monster_lev(MaxPower)
    when MaxPower >= 2500001 andalso MaxPower =< 3700000 ->
    280;
get_small_monster_lev(MaxPower)
    when MaxPower >= 3700001 andalso MaxPower =< 99999999 ->
    310;
get_small_monster_lev(_Info) ->
    logger:data_error("get_small_monster_lev_data_not_exist===>~w",
		      [_Info], holiday_nian_data, 519),
    undefined.

get_red_packet_radio(OpenDay)
    when OpenDay >= 1 andalso OpenDay =< 9 ->
    7000;
get_red_packet_radio(OpenDay)
    when OpenDay >= 10 andalso OpenDay =< 15 ->
    6000;
get_red_packet_radio(OpenDay)
    when OpenDay >= 16 andalso OpenDay =< 30 ->
    5000;
get_red_packet_radio(OpenDay)
    when OpenDay >= 31 andalso OpenDay =< 60 ->
    4000;
get_red_packet_radio(OpenDay)
    when OpenDay >= 61 andalso OpenDay =< 90 ->
    3000;
get_red_packet_radio(OpenDay)
    when OpenDay >= 91 andalso OpenDay =< 120 ->
    2000;
get_red_packet_radio(OpenDay)
    when OpenDay >= 121 andalso OpenDay =< 150 ->
    1500;
get_red_packet_radio(OpenDay)
    when OpenDay >= 151 andalso OpenDay =< 180 ->
    1000;
get_red_packet_radio(OpenDay)
    when OpenDay >= 181 andalso OpenDay =< 99999 ->
    1000;
get_red_packet_radio(_Info) ->
    logger:data_error("get_red_packet_radio_data_not_exist===>~w",
		      [_Info], holiday_nian_data, 530),
    undefined.

get_red_packet_radio2(Num)
    when Num >= 1 andalso Num =< 60 ->
    1000;
get_red_packet_radio2(Num)
    when Num >= 61 andalso Num =< 120 ->
    3000;
get_red_packet_radio2(Num)
    when Num >= 121 andalso Num =< 180 ->
    5000;
get_red_packet_radio2(Num)
    when Num >= 181 andalso Num =< 240 ->
    7000;
get_red_packet_radio2(Num)
    when Num >= 241 andalso Num =< 300 ->
    9000;
get_red_packet_radio2(Num)
    when Num >= 301 andalso Num =< 360 ->
    11000;
get_red_packet_radio2(Num)
    when Num >= 361 andalso Num =< 420 ->
    13000;
get_red_packet_radio2(Num)
    when Num >= 421 andalso Num =< 480 ->
    15000;
get_red_packet_radio2(Num)
    when Num >= 481 andalso Num =< 540 ->
    17000;
get_red_packet_radio2(Num)
    when Num >= 541 andalso Num =< 600 ->
    19000;
get_red_packet_radio2(Num)
    when Num >= 601 andalso Num =< 660 ->
    21000;
get_red_packet_radio2(Num)
    when Num >= 661 andalso Num =< 720 ->
    23000;
get_red_packet_radio2(Num)
    when Num >= 721 andalso Num =< 780 ->
    25000;
get_red_packet_radio2(Num)
    when Num >= 781 andalso Num =< 840 ->
    27000;
get_red_packet_radio2(Num)
    when Num >= 841 andalso Num =< 900 ->
    29000;
get_red_packet_radio2(Num)
    when Num >= 901 andalso Num =< 960 ->
    31000;
get_red_packet_radio2(Num)
    when Num >= 961 andalso Num =< 1020 ->
    33000;
get_red_packet_radio2(Num)
    when Num >= 1021 andalso Num =< 1080 ->
    35000;
get_red_packet_radio2(Num)
    when Num >= 1081 andalso Num =< 1140 ->
    37000;
get_red_packet_radio2(Num)
    when Num >= 1141 andalso Num =< 1200 ->
    39000;
get_red_packet_radio2(Num)
    when Num >= 1201 andalso Num =< 1260 ->
    41000;
get_red_packet_radio2(Num)
    when Num >= 1261 andalso Num =< 1320 ->
    43000;
get_red_packet_radio2(Num)
    when Num >= 1321 andalso Num =< 1380 ->
    45000;
get_red_packet_radio2(Num)
    when Num >= 1381 andalso Num =< 1440 ->
    47000;
get_red_packet_radio2(Num)
    when Num >= 1441 andalso Num =< 1500 ->
    49000;
get_red_packet_radio2(Num)
    when Num >= 1501 andalso Num =< 1560 ->
    51000;
get_red_packet_radio2(Num)
    when Num >= 1561 andalso Num =< 1620 ->
    53000;
get_red_packet_radio2(Num)
    when Num >= 1621 andalso Num =< 1680 ->
    55000;
get_red_packet_radio2(Num)
    when Num >= 1681 andalso Num =< 1740 ->
    57000;
get_red_packet_radio2(Num)
    when Num >= 1741 andalso Num =< 1800 ->
    59000;
get_red_packet_radio2(Num)
    when Num >= 1801 andalso Num =< 1860 ->
    61000;
get_red_packet_radio2(Num)
    when Num >= 1861 andalso Num =< 1920 ->
    63000;
get_red_packet_radio2(Num)
    when Num >= 1921 andalso Num =< 1980 ->
    65000;
get_red_packet_radio2(Num)
    when Num >= 1981 andalso Num =< 2040 ->
    67000;
get_red_packet_radio2(Num)
    when Num >= 2041 andalso Num =< 2100 ->
    69000;
get_red_packet_radio2(Num)
    when Num >= 2101 andalso Num =< 2160 ->
    71000;
get_red_packet_radio2(Num)
    when Num >= 2161 andalso Num =< 2220 ->
    73000;
get_red_packet_radio2(Num)
    when Num >= 2221 andalso Num =< 2280 ->
    75000;
get_red_packet_radio2(Num)
    when Num >= 2281 andalso Num =< 2340 ->
    77000;
get_red_packet_radio2(Num)
    when Num >= 2341 andalso Num =< 2400 ->
    79000;
get_red_packet_radio2(Num)
    when Num >= 2401 andalso Num =< 2460 ->
    81000;
get_red_packet_radio2(Num)
    when Num >= 2461 andalso Num =< 2520 ->
    83000;
get_red_packet_radio2(Num)
    when Num >= 2521 andalso Num =< 2580 ->
    85000;
get_red_packet_radio2(Num)
    when Num >= 2581 andalso Num =< 2640 ->
    87000;
get_red_packet_radio2(Num)
    when Num >= 2641 andalso Num =< 2700 ->
    89000;
get_red_packet_radio2(Num)
    when Num >= 2701 andalso Num =< 2760 ->
    91000;
get_red_packet_radio2(Num)
    when Num >= 2761 andalso Num =< 2820 ->
    93000;
get_red_packet_radio2(Num)
    when Num >= 2821 andalso Num =< 2880 ->
    95000;
get_red_packet_radio2(Num)
    when Num >= 2881 andalso Num =< 2940 ->
    97000;
get_red_packet_radio2(Num)
    when Num >= 2941 andalso Num =< 3000 ->
    99000;
get_red_packet_radio2(Num)
    when Num >= 3001 andalso Num =< 3060 ->
    101000;
get_red_packet_radio2(Num)
    when Num >= 3061 andalso Num =< 3120 ->
    103000;
get_red_packet_radio2(Num)
    when Num >= 3121 andalso Num =< 3180 ->
    105000;
get_red_packet_radio2(Num)
    when Num >= 3181 andalso Num =< 3240 ->
    107000;
get_red_packet_radio2(Num)
    when Num >= 3241 andalso Num =< 3300 ->
    109000;
get_red_packet_radio2(Num)
    when Num >= 3301 andalso Num =< 3360 ->
    111000;
get_red_packet_radio2(Num)
    when Num >= 3361 andalso Num =< 3420 ->
    113000;
get_red_packet_radio2(Num)
    when Num >= 3421 andalso Num =< 3480 ->
    115000;
get_red_packet_radio2(Num)
    when Num >= 3481 andalso Num =< 3540 ->
    117000;
get_red_packet_radio2(Num)
    when Num >= 3541 andalso Num =< 3600 ->
    119000;
get_red_packet_radio2(Num)
    when Num >= 3601 andalso Num =< 3660 ->
    121000;
get_red_packet_radio2(Num)
    when Num >= 3661 andalso Num =< 3720 ->
    123000;
get_red_packet_radio2(Num)
    when Num >= 3721 andalso Num =< 3780 ->
    125000;
get_red_packet_radio2(Num)
    when Num >= 3781 andalso Num =< 3840 ->
    127000;
get_red_packet_radio2(Num)
    when Num >= 3841 andalso Num =< 3900 ->
    129000;
get_red_packet_radio2(Num)
    when Num >= 3901 andalso Num =< 3960 ->
    131000;
get_red_packet_radio2(Num)
    when Num >= 3961 andalso Num =< 4020 ->
    133000;
get_red_packet_radio2(Num)
    when Num >= 4021 andalso Num =< 4080 ->
    135000;
get_red_packet_radio2(Num)
    when Num >= 4081 andalso Num =< 4140 ->
    137000;
get_red_packet_radio2(Num)
    when Num >= 4141 andalso Num =< 4200 ->
    139000;
get_red_packet_radio2(Num)
    when Num >= 4201 andalso Num =< 4260 ->
    141000;
get_red_packet_radio2(Num)
    when Num >= 4261 andalso Num =< 4320 ->
    143000;
get_red_packet_radio2(Num)
    when Num >= 4321 andalso Num =< 4380 ->
    145000;
get_red_packet_radio2(Num)
    when Num >= 4381 andalso Num =< 4440 ->
    147000;
get_red_packet_radio2(Num)
    when Num >= 4441 andalso Num =< 999999 ->
    149000;
get_red_packet_radio2(_Info) ->
    logger:data_error("get_red_packet_radio2_data_not_exist===>~w",
		      [_Info], holiday_nian_data, 607),
    undefined.

get_log_name(10001) -> lang:get(<<"出生点"/utf8>>);
get_log_name(10101) -> lang:get(<<"告示"/utf8>>);
get_log_name(10201) -> lang:get(<<"福神官"/utf8>>);
get_log_name(10202) -> lang:get(<<"福娃"/utf8>>);
get_log_name(10301) -> lang:get(<<"金"/utf8>>);
get_log_name(10302) -> lang:get(<<"鼠"/utf8>>);
get_log_name(10303) -> lang:get(<<"献"/utf8>>);
get_log_name(10304) -> lang:get(<<"瑞"/utf8>>);
get_log_name(10401) -> lang:get(<<"随机奖励"/utf8>>);
get_log_name(10501) -> lang:get(<<"贡品"/utf8>>);
get_log_name(10601) -> lang:get(<<"烟花"/utf8>>);
get_log_name(10701) -> lang:get(<<"红包"/utf8>>);
get_log_name(10801) -> lang:get(<<"小年兽"/utf8>>);
get_log_name(19001) -> lang:get(<<"沉睡的年兽"/utf8>>);
get_log_name(19002) -> lang:get(<<"沉睡的年兽"/utf8>>);
get_log_name(19003) -> lang:get(<<"凶狠的年兽"/utf8>>);
get_log_name(19004) -> lang:get(<<"凶狠的年兽"/utf8>>);
get_log_name(19051) -> lang:get(<<"沉睡的金色年兽"/utf8>>);
get_log_name(19052) -> lang:get(<<"沉睡的金色年兽"/utf8>>);
get_log_name(19053) -> lang:get(<<"新年瑞兽"/utf8>>);
get_log_name(19054) -> lang:get(<<"新年瑞兽"/utf8>>);
get_log_name(90111) -> lang:get(<<"1*1_酒坛子"/utf8>>);
get_log_name(90112) -> lang:get(<<"1*1_酒坛子（翻转）"/utf8>>);
get_log_name(90121) -> lang:get(<<"1*1_鞭炮串"/utf8>>);
get_log_name(90122) -> lang:get(<<"1*1_鞭炮串（翻转）"/utf8>>);
get_log_name(90131) -> lang:get(<<"1*1_小房"/utf8>>);
get_log_name(90132) -> lang:get(<<"1*1_小房（翻转）"/utf8>>);
get_log_name(90211) -> lang:get(<<"2*2_大房"/utf8>>);
get_log_name(90212) -> lang:get(<<"2*2_大房（翻转）"/utf8>>);
get_log_name(90221) -> lang:get(<<"2*2_桃树"/utf8>>);
get_log_name(90222) -> lang:get(<<"2*2_桃树（翻转）"/utf8>>);
get_log_name(90231) -> lang:get(<<"2*2_地砖"/utf8>>);
get_log_name(90232) -> lang:get(<<"2*2_地砖（翻转）"/utf8>>);
get_log_name(_Info) ->
    logger:data_error("get_log_name_data_not_exist===>~w",
		      [_Info], holiday_nian_data, 642),
    undefined.

get_log_dps({Dps, 12})
    when Dps >= 0 andalso Dps =< 5000 ->
    5000;
get_log_dps({Dps, 12})
    when Dps >= 5000 andalso Dps =< 15000 ->
    15000;
get_log_dps({Dps, 12})
    when Dps >= 15000 andalso Dps =< 30000 ->
    30000;
get_log_dps({Dps, 12})
    when Dps >= 30000 andalso Dps =< 60000 ->
    60000;
get_log_dps({Dps, 12})
    when Dps >= 60000 andalso Dps =< 110000 ->
    110000;
get_log_dps({Dps, 12})
    when Dps >= 110000 andalso Dps =< 190000 ->
    190000;
get_log_dps({Dps, 12})
    when Dps >= 190000 andalso Dps =< 310000 ->
    310000;
get_log_dps({Dps, 12})
    when Dps >= 310000 andalso Dps =< 560000 ->
    560000;
get_log_dps({Dps, 12})
    when Dps >= 560000 andalso Dps =< 910000 ->
    910000;
get_log_dps({Dps, 12})
    when Dps >= 910000 andalso Dps =< 1410000 ->
    1410000;
get_log_dps({Dps, 12})
    when Dps >= 1410000 andalso Dps =< 2110000 ->
    2110000;
get_log_dps({Dps, 12})
    when Dps >= 2110000 andalso Dps =< 3110000 ->
    3110000;
get_log_dps({Dps, 12})
    when Dps >= 3110000 andalso Dps =< 4610000 ->
    4610000;
get_log_dps({Dps, 12})
    when Dps >= 4610000 andalso Dps =< 6610000 ->
    6610000;
get_log_dps({Dps, 12})
    when Dps >= 6610000 andalso Dps =< 9610000 ->
    9610000;
get_log_dps({Dps, 12})
    when Dps >= 9610000 andalso Dps =< 13610000 ->
    13610000;
get_log_dps({Dps, 12})
    when Dps >= 13610000 andalso Dps =< 18610000 ->
    18610000;
get_log_dps({Dps, 12})
    when Dps >= 18610000 andalso Dps =< 24610000 ->
    24610000;
get_log_dps({Dps, 12})
    when Dps >= 24610000 andalso Dps =< 31610000 ->
    31610000;
get_log_dps({Dps, 12})
    when Dps >= 31610000 andalso Dps =< 40610000 ->
    40610000;
get_log_dps({Dps, 12})
    when Dps >= 40610000 andalso Dps =< 50610000 ->
    50610000;
get_log_dps({Dps, 12})
    when Dps >= 50610000 andalso Dps =< 61610000 ->
    61610000;
get_log_dps({Dps, 13})
    when Dps >= 0 andalso Dps =< 5000 ->
    5000;
get_log_dps({Dps, 13})
    when Dps >= 5000 andalso Dps =< 15000 ->
    15000;
get_log_dps({Dps, 13})
    when Dps >= 15000 andalso Dps =< 30000 ->
    30000;
get_log_dps({Dps, 13})
    when Dps >= 30000 andalso Dps =< 60000 ->
    60000;
get_log_dps({Dps, 13})
    when Dps >= 60000 andalso Dps =< 110000 ->
    110000;
get_log_dps({Dps, 13})
    when Dps >= 110000 andalso Dps =< 190000 ->
    190000;
get_log_dps({Dps, 13})
    when Dps >= 190000 andalso Dps =< 310000 ->
    310000;
get_log_dps({Dps, 13})
    when Dps >= 310000 andalso Dps =< 560000 ->
    560000;
get_log_dps({Dps, 13})
    when Dps >= 560000 andalso Dps =< 910000 ->
    910000;
get_log_dps({Dps, 13})
    when Dps >= 910000 andalso Dps =< 1410000 ->
    1410000;
get_log_dps({Dps, 13})
    when Dps >= 1410000 andalso Dps =< 2110000 ->
    2110000;
get_log_dps({Dps, 13})
    when Dps >= 2110000 andalso Dps =< 3110000 ->
    3110000;
get_log_dps({Dps, 13})
    when Dps >= 3110000 andalso Dps =< 4610000 ->
    4610000;
get_log_dps({Dps, 13})
    when Dps >= 4610000 andalso Dps =< 6610000 ->
    6610000;
get_log_dps({Dps, 13})
    when Dps >= 6610000 andalso Dps =< 9610000 ->
    9610000;
get_log_dps({Dps, 13})
    when Dps >= 9610000 andalso Dps =< 13610000 ->
    13610000;
get_log_dps({Dps, 13})
    when Dps >= 13610000 andalso Dps =< 18610000 ->
    18610000;
get_log_dps({Dps, 13})
    when Dps >= 18610000 andalso Dps =< 24610000 ->
    24610000;
get_log_dps({Dps, 13})
    when Dps >= 24610000 andalso Dps =< 31610000 ->
    31610000;
get_log_dps({Dps, 13})
    when Dps >= 31610000 andalso Dps =< 40610000 ->
    40610000;
get_log_dps({Dps, 13})
    when Dps >= 40610000 andalso Dps =< 50610000 ->
    50610000;
get_log_dps({Dps, 13})
    when Dps >= 50610000 andalso Dps =< 61610000 ->
    61610000;
get_log_dps(_Info) ->
    logger:data_error("get_log_dps_data_not_exist===>~w",
		      [_Info], holiday_nian_data, 688),
    undefined.


