-file("data/dungeon_stone_data.erl", 1).

-file("data/dungeon_stone_data.erl", 1).

-file("src/mod/data/dungeon_stone_data.erl", 1).

-module(dungeon_stone_data).

-lager_records([]).

-export([get_const/1, list_id/0, get/1, buy_num/1,
	 type_open/1]).

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

-file("src/mod/data/dungeon_stone_data.erl", 14).

get_const(hook_cost) -> 30;
get_const(free_num) -> 2;
get_const(desc_rule) -> 1;
get_const(dungeon_type) -> [1, 4, 2, 3, 5];
get_const(_) -> undefined.

list_id() ->
    [101, 102, 103, 104, 105, 106, 107, 108, 109, 201, 202,
     203, 204, 205, 206, 207, 208, 209, 301, 302, 303, 304,
     305, 306, 307, 308, 309, 401, 402, 403, 404, 405, 406,
     407, 408, 409, 501, 502, 503, 504, 505, 506, 507, 508,
     509].

get(101) ->
    #{id => 101, name => lang:get(<<"Vàng phó bản"/utf8>>),
      dun_type => 1, difficulty => 1, lev_limit => 1,
      power => 1000, unit_id => 86001,
      base_items =>
	  [{39052, 50}, {3, 10000}, {1, 1000000}, {10091, 3},
	   {10090, 3}]};
get(102) ->
    #{id => 102, name => lang:get(<<"Vàng phó bản"/utf8>>),
      dun_type => 1, difficulty => 2, pre_id => 101,
      lev_limit => 1, power => 400000, unit_id => 86002,
      base_items =>
	  [{39052, 60}, {3, 12000}, {1, 2000000}, {10091, 3},
	   {10090, 3}]};
get(103) ->
    #{id => 103, name => lang:get(<<"Vàng phó bản"/utf8>>),
      dun_type => 1, difficulty => 3, pre_id => 102,
      lev_limit => 1, power => 800000, unit_id => 86003,
      base_items =>
	  [{39052, 70}, {3, 14000}, {1, 3000000}, {10091, 3},
	   {10090, 3}]};
get(104) ->
    #{id => 104, name => lang:get(<<"Vàng phó bản"/utf8>>),
      dun_type => 1, difficulty => 4, pre_id => 103,
      lev_limit => 1, power => 1600000, unit_id => 86004,
      base_items =>
	  [{39052, 80}, {3, 16000}, {1, 4000000}, {10091, 3},
	   {10090, 3}]};
get(105) ->
    #{id => 105, name => lang:get(<<"Vàng phó bản"/utf8>>),
      dun_type => 1, difficulty => 5, pre_id => 104,
      lev_limit => 1, power => 2200000, unit_id => 86005,
      base_items =>
	  [{39052, 90}, {3, 18000}, {1, 5000000}, {10091, 3},
	   {10090, 3}]};
get(106) ->
    #{id => 106, name => lang:get(<<"Vàng phó bản"/utf8>>),
      dun_type => 1, difficulty => 6, pre_id => 105,
      lev_limit => 1, power => 2900000, unit_id => 86006,
      base_items =>
	  [{39052, 100}, {3, 14000}, {1, 6000000}, {10091, 3},
	   {10090, 3}]};
get(107) ->
    #{id => 107, name => lang:get(<<"Vàng phó bản"/utf8>>),
      dun_type => 1, difficulty => 7, pre_id => 106,
      lev_limit => 1, power => 3400000, unit_id => 86007,
      base_items =>
	  [{39052, 110}, {3, 22000}, {1, 7000000}, {10091, 3},
	   {10090, 3}]};
get(108) ->
    #{id => 108, name => lang:get(<<"Vàng phó bản"/utf8>>),
      dun_type => 1, difficulty => 8, pre_id => 107,
      lev_limit => 1, power => 3650000, unit_id => 86008,
      base_items =>
	  [{39052, 120}, {3, 24000}, {1, 8000000}, {10091, 3},
	   {10090, 3}]};
get(109) ->
    #{id => 109, name => lang:get(<<"Vàng phó bản"/utf8>>),
      dun_type => 1, difficulty => 9, pre_id => 108,
      lev_limit => 1, power => 4350000, unit_id => 86009,
      base_items =>
	  [{39052, 130}, {3, 26000}, {1, 9000000}, {10091, 3},
	   {10090, 3}]};
get(201) ->
    #{id => 201,
      name => lang:get(<<"Kinh nghiệm phó bản"/utf8>>),
      dun_type => 4, difficulty => 1, lev_limit => 1,
      power => 1000, unit_id => 86101,
      base_items =>
	  [{39053, 50}, {3, 10000}, {22, 1000000}, {10091, 3},
	   {10090, 3}]};
get(202) ->
    #{id => 202,
      name => lang:get(<<"Kinh nghiệm phó bản"/utf8>>),
      dun_type => 4, difficulty => 2, pre_id => 201,
      lev_limit => 1, power => 400000, unit_id => 86102,
      base_items =>
	  [{39053, 60}, {3, 12000}, {22, 2000000}, {10091, 3},
	   {10090, 3}]};
get(203) ->
    #{id => 203,
      name => lang:get(<<"Kinh nghiệm phó bản"/utf8>>),
      dun_type => 4, difficulty => 3, pre_id => 202,
      lev_limit => 1, power => 800000, unit_id => 86103,
      base_items =>
	  [{39053, 70}, {3, 14000}, {22, 3000000}, {10091, 3},
	   {10090, 3}]};
get(204) ->
    #{id => 204,
      name => lang:get(<<"Kinh nghiệm phó bản"/utf8>>),
      dun_type => 4, difficulty => 4, pre_id => 203,
      lev_limit => 1, power => 1600000, unit_id => 86104,
      base_items =>
	  [{39053, 80}, {3, 16000}, {22, 4000000}, {10091, 3},
	   {10090, 3}]};
get(205) ->
    #{id => 205,
      name => lang:get(<<"Kinh nghiệm phó bản"/utf8>>),
      dun_type => 4, difficulty => 5, pre_id => 204,
      lev_limit => 1, power => 2200000, unit_id => 86105,
      base_items =>
	  [{39053, 90}, {3, 18000}, {22, 5000000}, {10091, 3},
	   {10090, 3}]};
get(206) ->
    #{id => 206,
      name => lang:get(<<"Kinh nghiệm phó bản"/utf8>>),
      dun_type => 4, difficulty => 6, pre_id => 205,
      lev_limit => 1, power => 2900000, unit_id => 86106,
      base_items =>
	  [{39053, 100}, {3, 14000}, {22, 6000000}, {10091, 3},
	   {10090, 3}]};
get(207) ->
    #{id => 207,
      name => lang:get(<<"Kinh nghiệm phó bản"/utf8>>),
      dun_type => 4, difficulty => 7, pre_id => 206,
      lev_limit => 1, power => 3400000, unit_id => 86107,
      base_items =>
	  [{39053, 110}, {3, 22000}, {22, 7000000}, {10091, 3},
	   {10090, 3}]};
get(208) ->
    #{id => 208,
      name => lang:get(<<"Kinh nghiệm phó bản"/utf8>>),
      dun_type => 4, difficulty => 8, pre_id => 207,
      lev_limit => 1, power => 3650000, unit_id => 86108,
      base_items =>
	  [{39053, 120}, {3, 24000}, {22, 8000000}, {10091, 3},
	   {10090, 3}]};
get(209) ->
    #{id => 209,
      name => lang:get(<<"Kinh nghiệm phó bản"/utf8>>),
      dun_type => 4, difficulty => 9, pre_id => 208,
      lev_limit => 1, power => 4350000, unit_id => 86109,
      base_items =>
	  [{39053, 130}, {3, 26000}, {22, 9000000}, {10091, 3},
	   {10090, 3}]};
get(301) ->
    #{id => 301,
      name => lang:get(<<"Vật liệu phó bản"/utf8>>),
      dun_type => 2, difficulty => 1, lev_limit => 1,
      power => 1000, unit_id => 86201,
      base_items =>
	  [{39081, 2}, {3, 10000}, {22, 1000000}, {10091, 3},
	   {10090, 3}]};
get(302) ->
    #{id => 302,
      name => lang:get(<<"Vật liệu phó bản"/utf8>>),
      dun_type => 2, difficulty => 2, pre_id => 301,
      lev_limit => 1, power => 400000, unit_id => 86202,
      base_items =>
	  [{39081, 2}, {3, 12000}, {22, 2000000}, {10091, 3},
	   {10090, 3}]};
get(303) ->
    #{id => 303,
      name => lang:get(<<"Vật liệu phó bản"/utf8>>),
      dun_type => 2, difficulty => 3, pre_id => 302,
      lev_limit => 1, power => 800000, unit_id => 86203,
      base_items =>
	  [{39081, 2}, {3, 14000}, {22, 3000000}, {10091, 3},
	   {10090, 3}]};
get(304) ->
    #{id => 304,
      name => lang:get(<<"Vật liệu phó bản"/utf8>>),
      dun_type => 2, difficulty => 4, pre_id => 303,
      lev_limit => 1, power => 1600000, unit_id => 86204,
      base_items =>
	  [{39081, 2}, {3, 16000}, {22, 4000000}, {10091, 3},
	   {10090, 3}]};
get(305) ->
    #{id => 305,
      name => lang:get(<<"Vật liệu phó bản"/utf8>>),
      dun_type => 2, difficulty => 5, pre_id => 304,
      lev_limit => 1, power => 2200000, unit_id => 86205,
      base_items =>
	  [{39081, 2}, {3, 18000}, {22, 5000000}, {10091, 3},
	   {10090, 3}]};
get(306) ->
    #{id => 306,
      name => lang:get(<<"Vật liệu phó bản"/utf8>>),
      dun_type => 2, difficulty => 6, pre_id => 305,
      lev_limit => 1, power => 2900000, unit_id => 86206,
      base_items =>
	  [{39081, 2}, {3, 14000}, {22, 6000000}, {10091, 3},
	   {10090, 3}]};
get(307) ->
    #{id => 307,
      name => lang:get(<<"Vật liệu phó bản"/utf8>>),
      dun_type => 2, difficulty => 7, pre_id => 306,
      lev_limit => 1, power => 3400000, unit_id => 86207,
      base_items =>
	  [{39081, 2}, {3, 22000}, {22, 7000000}, {10091, 3},
	   {10090, 3}]};
get(308) ->
    #{id => 308,
      name => lang:get(<<"Vật liệu phó bản"/utf8>>),
      dun_type => 2, difficulty => 8, pre_id => 307,
      lev_limit => 1, power => 3650000, unit_id => 86208,
      base_items =>
	  [{39081, 2}, {3, 24000}, {22, 8000000}, {10091, 3},
	   {10090, 3}]};
get(309) ->
    #{id => 309,
      name => lang:get(<<"Vật liệu phó bản"/utf8>>),
      dun_type => 2, difficulty => 9, pre_id => 308,
      lev_limit => 1, power => 4350000, unit_id => 86209,
      base_items =>
	  [{39081, 2}, {3, 26000}, {22, 9000000}, {10091, 3},
	   {10090, 3}]};
get(401) ->
    #{id => 401,
      name => lang:get(<<"Thần khí phó bản"/utf8>>),
      dun_type => 3, difficulty => 1, lev_limit => 1,
      power => 1000, unit_id => 86301,
      base_items =>
	  [{39081, 2}, {3, 10000}, {10030, 100}, {10091, 3},
	   {10090, 3}]};
get(402) ->
    #{id => 402,
      name => lang:get(<<"Thần khí phó bản"/utf8>>),
      dun_type => 3, difficulty => 2, pre_id => 401,
      lev_limit => 1, power => 400000, unit_id => 86302,
      base_items =>
	  [{39081, 2}, {3, 12000}, {10030, 120}, {10091, 3},
	   {10090, 3}]};
get(403) ->
    #{id => 403,
      name => lang:get(<<"Thần khí phó bản"/utf8>>),
      dun_type => 3, difficulty => 3, pre_id => 402,
      lev_limit => 1, power => 800000, unit_id => 86303,
      base_items =>
	  [{39081, 2}, {3, 14000}, {10030, 140}, {10091, 3},
	   {10090, 3}]};
get(404) ->
    #{id => 404,
      name => lang:get(<<"Thần khí phó bản"/utf8>>),
      dun_type => 3, difficulty => 4, pre_id => 403,
      lev_limit => 1, power => 1600000, unit_id => 86304,
      base_items =>
	  [{39081, 2}, {3, 16000}, {10030, 160}, {10091, 3},
	   {10090, 3}]};
get(405) ->
    #{id => 405,
      name => lang:get(<<"Thần khí phó bản"/utf8>>),
      dun_type => 3, difficulty => 5, pre_id => 404,
      lev_limit => 1, power => 2200000, unit_id => 86305,
      base_items =>
	  [{39081, 2}, {3, 18000}, {10030, 180}, {10091, 3},
	   {10090, 3}]};
get(406) ->
    #{id => 406,
      name => lang:get(<<"Thần khí phó bản"/utf8>>),
      dun_type => 3, difficulty => 6, pre_id => 405,
      lev_limit => 1, power => 2900000, unit_id => 86306,
      base_items =>
	  [{39081, 2}, {3, 14000}, {10030, 200}, {10091, 3},
	   {10090, 3}]};
get(407) ->
    #{id => 407,
      name => lang:get(<<"Thần khí phó bản"/utf8>>),
      dun_type => 3, difficulty => 7, pre_id => 406,
      lev_limit => 1, power => 3400000, unit_id => 86307,
      base_items =>
	  [{39081, 2}, {3, 22000}, {10030, 220}, {10091, 3},
	   {10090, 3}]};
get(408) ->
    #{id => 408,
      name => lang:get(<<"Thần khí phó bản"/utf8>>),
      dun_type => 3, difficulty => 8, pre_id => 407,
      lev_limit => 1, power => 3650000, unit_id => 86308,
      base_items =>
	  [{39081, 2}, {3, 24000}, {10030, 240}, {10091, 3},
	   {10090, 3}]};
get(409) ->
    #{id => 409,
      name => lang:get(<<"Thần khí phó bản"/utf8>>),
      dun_type => 3, difficulty => 9, pre_id => 408,
      lev_limit => 1, power => 4350000, unit_id => 86309,
      base_items =>
	  [{39081, 2}, {3, 26000}, {10030, 260}, {10091, 3},
	   {10090, 3}]};
get(501) ->
    #{id => 501,
      name => lang:get(<<"Phù văn phó bản"/utf8>>),
      dun_type => 5, difficulty => 1, lev_limit => 70,
      power => 600000, unit_id => 86401,
      base_items =>
	  [{39081, 2}, {3, 10000}, {10450, 1200}, {10091, 3},
	   {10090, 3}]};
get(502) ->
    #{id => 502,
      name => lang:get(<<"Phù văn phó bản"/utf8>>),
      dun_type => 5, difficulty => 2, pre_id => 501,
      lev_limit => 75, power => 900000, unit_id => 86402,
      base_items =>
	  [{39081, 2}, {3, 12000}, {10450, 1400}, {10091, 3},
	   {10090, 3}]};
get(503) ->
    #{id => 503,
      name => lang:get(<<"Phù văn phó bản"/utf8>>),
      dun_type => 5, difficulty => 3, pre_id => 502,
      lev_limit => 80, power => 1200000, unit_id => 86403,
      base_items =>
	  [{39081, 2}, {3, 14000}, {10450, 1600}, {10091, 3},
	   {10090, 3}]};
get(504) ->
    #{id => 504,
      name => lang:get(<<"Phù văn phó bản"/utf8>>),
      dun_type => 5, difficulty => 4, pre_id => 503,
      lev_limit => 85, power => 1600000, unit_id => 86404,
      base_items =>
	  [{39081, 2}, {3, 16000}, {10450, 1800}, {10091, 3},
	   {10090, 3}]};
get(505) ->
    #{id => 505,
      name => lang:get(<<"Phù văn phó bản"/utf8>>),
      dun_type => 5, difficulty => 5, pre_id => 504,
      lev_limit => 90, power => 2200000, unit_id => 86405,
      base_items =>
	  [{39081, 2}, {3, 18000}, {10450, 2000}, {10091, 3},
	   {10090, 3}]};
get(506) ->
    #{id => 506,
      name => lang:get(<<"Phù văn phó bản"/utf8>>),
      dun_type => 5, difficulty => 6, pre_id => 505,
      lev_limit => 95, power => 2900000, unit_id => 86406,
      base_items =>
	  [{39081, 2}, {3, 14000}, {10450, 2200}, {10091, 3},
	   {10090, 3}]};
get(507) ->
    #{id => 507,
      name => lang:get(<<"Phù văn phó bản"/utf8>>),
      dun_type => 5, difficulty => 7, pre_id => 506,
      lev_limit => 100, power => 3400000, unit_id => 86407,
      base_items =>
	  [{39081, 2}, {3, 22000}, {10450, 2400}, {10091, 3},
	   {10090, 3}]};
get(508) ->
    #{id => 508,
      name => lang:get(<<"Phù văn phó bản"/utf8>>),
      dun_type => 5, difficulty => 8, pre_id => 507,
      lev_limit => 105, power => 3650000, unit_id => 86408,
      base_items =>
	  [{39081, 2}, {3, 24000}, {10450, 2600}, {10091, 3},
	   {10090, 3}]};
get(509) ->
    #{id => 509,
      name => lang:get(<<"Phù văn phó bản"/utf8>>),
      dun_type => 5, difficulty => 9, pre_id => 508,
      lev_limit => 110, power => 4350000, unit_id => 86409,
      base_items =>
	  [{39081, 2}, {3, 26000}, {10450, 3000}, {10091, 3},
	   {10090, 3}]};
get(_Info) ->
    logger:data_error("get_data_not_exist===>~w", [_Info],
		      dungeon_stone_data, 558),
    undefined.

buy_num({1, 1}) ->
    #{id => 1, num => 1, vip => 0, cost => 0};
buy_num({1, 2}) ->
    #{id => 1, num => 2, vip => 0, cost => 0};
buy_num({1, 3}) ->
    #{id => 1, num => 3, vip => 1, cost => 50};
buy_num({1, 4}) ->
    #{id => 1, num => 4, vip => 3, cost => 50};
buy_num({1, 5}) ->
    #{id => 1, num => 5, vip => 5, cost => 50};
buy_num({1, 6}) ->
    #{id => 1, num => 6, vip => 7, cost => 50};
buy_num({1, 7}) ->
    #{id => 1, num => 7, vip => 9, cost => 50};
buy_num({1, 8}) ->
    #{id => 1, num => 8, vip => 11, cost => 50};
buy_num({1, 9}) ->
    #{id => 1, num => 9, vip => 13, cost => 50};
buy_num({2, 1}) ->
    #{id => 2, num => 1, vip => 0, cost => 0};
buy_num({2, 2}) ->
    #{id => 2, num => 2, vip => 0, cost => 0};
buy_num({2, 3}) ->
    #{id => 2, num => 3, vip => 1, cost => 50};
buy_num({2, 4}) ->
    #{id => 2, num => 4, vip => 3, cost => 50};
buy_num({2, 5}) ->
    #{id => 2, num => 5, vip => 5, cost => 50};
buy_num({2, 6}) ->
    #{id => 2, num => 6, vip => 7, cost => 50};
buy_num({2, 7}) ->
    #{id => 2, num => 7, vip => 9, cost => 50};
buy_num({2, 8}) ->
    #{id => 2, num => 8, vip => 11, cost => 50};
buy_num({2, 9}) ->
    #{id => 2, num => 9, vip => 13, cost => 50};
buy_num({3, 1}) ->
    #{id => 3, num => 1, vip => 0, cost => 0};
buy_num({3, 2}) ->
    #{id => 3, num => 2, vip => 0, cost => 0};
buy_num({3, 3}) ->
    #{id => 3, num => 3, vip => 1, cost => 50};
buy_num({3, 4}) ->
    #{id => 3, num => 4, vip => 3, cost => 50};
buy_num({3, 5}) ->
    #{id => 3, num => 5, vip => 5, cost => 50};
buy_num({3, 6}) ->
    #{id => 3, num => 6, vip => 7, cost => 50};
buy_num({3, 7}) ->
    #{id => 3, num => 7, vip => 9, cost => 50};
buy_num({3, 8}) ->
    #{id => 3, num => 8, vip => 11, cost => 50};
buy_num({3, 9}) ->
    #{id => 3, num => 9, vip => 13, cost => 50};
buy_num({4, 1}) ->
    #{id => 4, num => 1, vip => 0, cost => 0};
buy_num({4, 2}) ->
    #{id => 4, num => 2, vip => 0, cost => 0};
buy_num({4, 3}) ->
    #{id => 4, num => 3, vip => 1, cost => 50};
buy_num({4, 4}) ->
    #{id => 4, num => 4, vip => 3, cost => 50};
buy_num({4, 5}) ->
    #{id => 4, num => 5, vip => 5, cost => 50};
buy_num({4, 6}) ->
    #{id => 4, num => 6, vip => 7, cost => 50};
buy_num({4, 7}) ->
    #{id => 4, num => 7, vip => 9, cost => 50};
buy_num({4, 8}) ->
    #{id => 4, num => 8, vip => 11, cost => 50};
buy_num({4, 9}) ->
    #{id => 4, num => 9, vip => 13, cost => 50};
buy_num({5, 1}) ->
    #{id => 5, num => 1, vip => 0, cost => 0};
buy_num({5, 2}) ->
    #{id => 5, num => 2, vip => 0, cost => 0};
buy_num({5, 3}) ->
    #{id => 5, num => 3, vip => 1, cost => 100};
buy_num({5, 4}) ->
    #{id => 5, num => 4, vip => 3, cost => 100};
buy_num({5, 5}) ->
    #{id => 5, num => 5, vip => 5, cost => 100};
buy_num({5, 6}) ->
    #{id => 5, num => 6, vip => 7, cost => 100};
buy_num({5, 7}) ->
    #{id => 5, num => 7, vip => 9, cost => 100};
buy_num({5, 8}) ->
    #{id => 5, num => 8, vip => 11, cost => 100};
buy_num({5, 9}) ->
    #{id => 5, num => 9, vip => 13, cost => 100};
buy_num(_Info) ->
    logger:data_error("buy_num_data_not_exist===>~w",
		      [_Info], dungeon_stone_data, 875),
    undefined.

type_open(1) -> [{lev, 15}];
type_open(4) -> [{lev, 17}];
type_open(2) -> [{lev, 18}];
type_open(3) -> [{lev, 20}];
type_open(5) -> [{lev, 70}];
type_open(_Info) ->
    logger:data_error("type_open_data_not_exist===>~w",
		      [_Info], dungeon_stone_data, 882),
    undefined.


