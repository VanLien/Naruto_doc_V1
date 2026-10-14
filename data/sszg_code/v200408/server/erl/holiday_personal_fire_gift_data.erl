-file("src/mod/data/holiday_personal_fire_gift_data.erl",
      1).

-module(holiday_personal_fire_gift_data).

-lager_records([]).

-export([get_const/1, gift_list/0, get_gift_info/1,
	 get_award/1]).

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

-file("src/mod/data/holiday_personal_fire_gift_data.erl",
      13).

get_const(limit_gift_count) -> 5;
get_const(_) -> undefined.

gift_list() ->
    [{801, [{guild_break_skill, 5}],
      [{charge_sum, 0, 999999}]},
     {701, [{guild_break_skill, 4}],
      [{charge_sum, 0, 999999}]},
     {601, [{guild_break_skill, 3}],
      [{charge_sum, 0, 999999}]},
     {501, [{guild_break_skill, 2}],
      [{charge_sum, 0, 999999}]},
     {406, [{lev_equal, 120}], [{charge_sum, 301, 999999}]},
     {405, [{lev_equal, 120}], [{charge_sum, 100, 300}]},
     {404, [{lev_equal, 120}], [{charge_sum, 0, 100}]},
     {403, [{lev_equal, 105}],
      [{charge_sum, 301, 999999}, {have_enter_dungeon, 1}]},
     {402, [{lev_equal, 105}],
      [{charge_sum, 100, 300}, {have_enter_dungeon, 1}]},
     {401, [{lev_equal, 105}],
      [{charge_sum, 0, 100}, {have_enter_dungeon, 1}]},
     {303, [{lev_equal, 90}], [{charge_sum, 101, 999999}]},
     {302, [{lev_equal, 90}], [{charge_sum, 6, 100}]},
     {301, [{lev_equal, 90}], [{charge_sum, 0, 5}]},
     {203, [{lev_equal, 80}], [{charge_sum, 101, 999999}]},
     {202, [{lev_equal, 80}], [{charge_sum, 6, 100}]},
     {201, [{lev_equal, 80}], [{charge_sum, 0, 5}]},
     {117, [{max_tower_equal, 156}], [{charge_sum, 6, 100}]},
     {116, [{max_tower_equal, 156}], [{charge_sum, 0, 5}]},
     {114, [{max_tower_equal, 97}], [{charge_sum, 6, 100}]},
     {113, [{max_tower_equal, 97}], [{charge_sum, 0, 5}]},
     {111, [{max_tower_equal, 77}], [{charge_sum, 6, 100}]},
     {110, [{max_tower_equal, 77}], [{charge_sum, 0, 5}]},
     {108, [{max_tower_equal, 65}], [{charge_sum, 6, 100}]},
     {107, [{max_tower_equal, 65}], [{charge_sum, 0, 5}]},
     {106, [{max_tower_equal, 30}],
      [{charge_sum, 101, 999999}]},
     {105, [{max_tower_equal, 30}], [{charge_sum, 6, 100}]},
     {104, [{max_tower_equal, 30}], [{charge_sum, 0, 5}]},
     {103, [{lev_equal, 35}], [{charge_sum, 101, 999999}]},
     {102, [{lev_equal, 35}], [{charge_sum, 6, 100}]},
     {101, [{lev_equal, 35}], [{charge_sum, 0, 5}]}].

get_gift_info(101) -> {1, 1561, 7200, 5};
get_gift_info(102) -> {1, 1562, 7200, 5};
get_gift_info(103) -> {1, 1563, 7200, 5};
get_gift_info(104) -> {1, 1561, 7200, 5};
get_gift_info(105) -> {1, 1562, 7200, 5};
get_gift_info(106) -> {1, 1563, 7200, 5};
get_gift_info(107) -> {1, 1561, 7200, 5};
get_gift_info(108) -> {1, 1562, 7200, 5};
get_gift_info(110) -> {1, 1561, 7200, 5};
get_gift_info(111) -> {1, 1562, 7200, 5};
get_gift_info(113) -> {1, 1561, 7200, 5};
get_gift_info(114) -> {1, 1562, 7200, 5};
get_gift_info(116) -> {1, 1561, 7200, 5};
get_gift_info(117) -> {1, 1562, 7200, 5};
get_gift_info(201) -> {2, 1571, 7200, 5};
get_gift_info(202) -> {2, 1572, 7200, 5};
get_gift_info(203) -> {2, 1573, 7200, 5};
get_gift_info(301) -> {3, 1581, 7200, 5};
get_gift_info(302) -> {3, 1582, 7200, 5};
get_gift_info(303) -> {3, 1583, 7200, 5};
get_gift_info(401) -> {4, 1591, 7200, 5};
get_gift_info(402) -> {4, 1592, 7200, 5};
get_gift_info(403) -> {4, 1593, 7200, 5};
get_gift_info(404) -> {4, 1591, 7200, 5};
get_gift_info(405) -> {4, 1592, 7200, 5};
get_gift_info(406) -> {4, 1593, 7200, 5};
get_gift_info(501) -> {5, 1594, 7200, 5};
get_gift_info(601) -> {6, 1595, 7200, 5};
get_gift_info(701) -> {7, 1596, 7200, 5};
get_gift_info(801) -> {8, 1597, 7200, 5};
get_gift_info(_Info) ->
    logger:data_error("get_gift_info_data_not_exist===>~w",
		      [_Info], holiday_personal_fire_gift_data, 49),
    undefined.

get_award(101) ->
    [{3, 1200}, {14001, 1}, {1, 500000}, {22, 500000}];
get_award(102) ->
    [{3, 6800}, {14001, 3}, {10403, 5}, {22, 800000}];
get_award(103) ->
    [{3, 19800}, {14001, 5}, {10403, 10}, {22, 1000000}];
get_award(104) ->
    [{3, 1200}, {14001, 1}, {1, 500000}, {22, 500000}];
get_award(105) ->
    [{3, 6800}, {14001, 3}, {10403, 5}, {22, 800000}];
get_award(106) ->
    [{3, 19800}, {14001, 5}, {10403, 10}, {22, 1000000}];
get_award(107) ->
    [{3, 1200}, {14001, 1}, {10001, 200}, {22, 500000}];
get_award(108) ->
    [{3, 6800}, {14001, 3}, {10403, 5}, {22, 800000}];
get_award(110) ->
    [{3, 1200}, {14001, 1}, {10001, 200}, {22, 500000}];
get_award(111) ->
    [{3, 6800}, {14001, 3}, {10403, 5}, {22, 800000}];
get_award(113) -> [{3, 1200}, {29905, 50}];
get_award(114) -> [{3, 6800}, {29905, 50}, {10403, 10}];
get_award(116) -> [{3, 1200}, {29905, 50}];
get_award(117) -> [{3, 6800}, {29905, 50}, {10403, 10}];
get_award(201) -> [{3, 1200}, {10603, 1}, {10040, 10}];
get_award(202) -> [{3, 6800}, {10603, 2}, {10040, 30}];
get_award(203) ->
    [{3, 19800}, {10603, 3}, {10040, 100}];
get_award(301) -> [{3, 600}, {17009, 100}, {17011, 1}];
get_award(302) ->
    [{3, 6800}, {17009, 200}, {17011, 10}];
get_award(303) ->
    [{3, 32800}, {17009, 800}, {17011, 25}];
get_award(401) ->
    [{3, 3000}, {39493, 1}, {17210, 2}, {28, 10}];
get_award(402) ->
    [{3, 6800}, {39497, 1}, {17210, 5}, {28, 50}];
get_award(403) ->
    [{3, 19800}, {39501, 1}, {17210, 16}, {28, 160}];
get_award(404) ->
    [{3, 3000}, {39493, 1}, {17210, 2}, {28, 10}];
get_award(405) ->
    [{3, 6800}, {39497, 1}, {17210, 5}, {28, 50}];
get_award(406) ->
    [{3, 19800}, {39501, 1}, {17210, 16}, {28, 160}];
get_award(501) ->
    [{3, 32800}, {14001, 4}, {10006, 30}, {10, 8000}];
get_award(601) ->
    [{3, 32800}, {14001, 4}, {10006, 30}, {10, 8000}];
get_award(701) ->
    [{3, 32800}, {14001, 4}, {10006, 30}, {10, 8000}];
get_award(801) ->
    [{3, 32800}, {14001, 4}, {10006, 30}, {10, 8000}];
get_award(_) -> [].


