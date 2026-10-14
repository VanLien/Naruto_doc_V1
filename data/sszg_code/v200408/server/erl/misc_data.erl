-file("data/misc_data.erl", 1).

-file("data/misc_data.erl", 1).

-module(misc_data).

-export([get_const/1, list_time/0, get_time_items/1,
	 list_ids/0, gift_info/0, loop_gift/1,
	 loop_gift_reward/1]).

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

-file("data/misc_data.erl", 16).

get_const(cross_level) -> 50;
get_const(province_level) -> 35;
get_const(touch_gold_tips) -> 1;
get_const(auth_award) ->
    [{3, 100}, {10403, 1}, {10001, 100}];
get_const(hero_store_sign_time) -> 1581562800;
get_const(world_level) -> 5;
get_const(_) -> undefined.

list_time() ->
    [60, 150, 210, 530, 840, 1680, 2400, 3600, 5400, 7200,
     10800, 14400].

get_time_items(1) -> {60, [{22, 1000000}]};
get_time_items(2) -> {150, [{1, 1000000}]};
get_time_items(3) -> {210, [{22, 1000000}]};
get_time_items(4) -> {530, [{1, 1000000}]};
get_time_items(5) -> {840, [{22, 1000000}]};
get_time_items(6) -> {1680, [{1, 1000000}]};
get_time_items(7) -> {2400, [{22, 1000000}]};
get_time_items(8) -> {3600, [{1, 1000000}]};
get_time_items(9) -> {5400, [{22, 1000000}]};
get_time_items(10) -> {7200, [{1, 1000000}]};
get_time_items(11) -> {10800, [{22, 1000000}]};
get_time_items(12) -> {14400, [{10001, 20000}]};
get_time_items(_Info) ->
    logger:data_error("get_time_items_data_not_exist===>~w",
		      [_Info], misc_data, 39),
    undefined.

list_ids() -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].

gift_info() ->
    [{416, 500000}, {415, 200000}, {414, 100000},
     {413, 50000}, {412, 20000}, {411, 10000}, {406, 500000},
     {405, 200000}, {404, 100000}, {403, 50000},
     {402, 20000}, {401, 10000}].

loop_gift(401) -> {1, 5};
loop_gift(402) -> {1, 5};
loop_gift(403) -> {1, 5};
loop_gift(404) -> {1, 10};
loop_gift(405) -> {1, 10};
loop_gift(406) -> {1, 10};
loop_gift(411) -> {2, 5};
loop_gift(412) -> {2, 5};
loop_gift(413) -> {2, 5};
loop_gift(414) -> {2, 10};
loop_gift(415) -> {2, 15};
loop_gift(416) -> {2, 30};
loop_gift(_) -> undefined.

loop_gift_reward({401, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 3000000}, {10001, 200000}, {10090, 50},
     {10091, 25}, {39052, 3999}, {39053, 3999}, {17009, 50},
     {17011, 3}, {35, 20}, {37004, 3}];
loop_gift_reward({401, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 3000000}, {10001, 200000}, {10090, 50},
     {10091, 25}, {39052, 3999}, {39053, 3999}, {17009, 50},
     {17011, 3}, {35, 20}, {37004, 3}];
loop_gift_reward({401, OpenDay, RegTime})
    when OpenDay >= 8 andalso
	   OpenDay =< 28 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 3000000}, {10001, 200000}, {10090, 50},
     {10091, 25}, {39052, 3999}, {39053, 3999}, {17009, 50},
     {17011, 3}, {35, 20}, {37004, 3}];
loop_gift_reward({401, OpenDay, RegTime})
    when OpenDay >= 29 andalso
	   OpenDay =< 56 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 3000000}, {10001, 200000}, {10090, 50},
     {10091, 25}, {39052, 3999}, {39053, 3999}, {17009, 50},
     {17011, 3}, {35, 20}, {37004, 3}];
loop_gift_reward({401, OpenDay, RegTime})
    when OpenDay >= 57 andalso
	   OpenDay =< 84 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 3000000}, {10001, 200000}, {10090, 50},
     {10091, 25}, {39052, 3999}, {39053, 3999}, {17009, 50},
     {17011, 3}, {35, 20}, {37004, 3}];
loop_gift_reward({401, OpenDay, RegTime})
    when OpenDay >= 85 andalso
	   OpenDay =< 112 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 3000000}, {10001, 200000}, {10090, 50},
     {10091, 25}, {39052, 3999}, {39053, 3999}, {17009, 50},
     {17011, 3}, {35, 20}, {37004, 3}];
loop_gift_reward({401, OpenDay, RegTime})
    when OpenDay >= 113 andalso
	   OpenDay =< 9999 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 3000000}, {10001, 200000}, {10090, 50},
     {10091, 25}, {39052, 3999}, {39053, 3999}, {17009, 50},
     {17011, 3}, {35, 20}, {37004, 3}];
loop_gift_reward({402, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 8000000}, {10001, 400000}, {10090, 99},
     {10091, 49}, {39052, 5999}, {39053, 5999}, {17009, 100},
     {17011, 6}, {39047, 1}, {35, 49}, {37004, 5}];
loop_gift_reward({402, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 8000000}, {10001, 400000}, {10090, 99},
     {10091, 49}, {39052, 5999}, {39053, 5999}, {17009, 100},
     {17011, 6}, {39047, 1}, {35, 49}, {37004, 5}];
loop_gift_reward({402, OpenDay, RegTime})
    when OpenDay >= 8 andalso
	   OpenDay =< 28 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 8000000}, {10001, 400000}, {10090, 99},
     {10091, 49}, {39052, 5999}, {39053, 5999}, {17009, 100},
     {17011, 6}, {39047, 1}, {35, 49}, {37004, 5}];
loop_gift_reward({402, OpenDay, RegTime})
    when OpenDay >= 29 andalso
	   OpenDay =< 56 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 8000000}, {10001, 400000}, {10090, 99},
     {10091, 49}, {39052, 5999}, {39053, 5999}, {17009, 100},
     {17011, 6}, {39047, 1}, {35, 49}, {37004, 5}];
loop_gift_reward({402, OpenDay, RegTime})
    when OpenDay >= 57 andalso
	   OpenDay =< 84 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 8000000}, {10001, 400000}, {10090, 99},
     {10091, 49}, {39052, 5999}, {39053, 5999}, {17009, 100},
     {17011, 6}, {39047, 1}, {35, 49}, {37004, 5}];
loop_gift_reward({402, OpenDay, RegTime})
    when OpenDay >= 85 andalso
	   OpenDay =< 112 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 8000000}, {10001, 400000}, {10090, 99},
     {10091, 49}, {39052, 5999}, {39053, 5999}, {17009, 100},
     {17011, 6}, {39047, 1}, {35, 49}, {37004, 5}];
loop_gift_reward({402, OpenDay, RegTime})
    when OpenDay >= 113 andalso
	   OpenDay =< 9999 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 8000000}, {10001, 400000}, {10090, 99},
     {10091, 49}, {39052, 5999}, {39053, 5999}, {17009, 100},
     {17011, 6}, {39047, 1}, {35, 49}, {37004, 5}];
loop_gift_reward({403, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 15000000}, {10001, 600000}, {10090, 199},
     {10091, 99}, {39052, 9999}, {39053, 9999}, {17009, 250},
     {17011, 15}, {39047, 3}, {35, 99}, {37004, 15}];
loop_gift_reward({403, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 15000000}, {10001, 600000}, {10090, 199},
     {10091, 99}, {39052, 9999}, {39053, 9999}, {17009, 250},
     {17011, 15}, {39047, 3}, {35, 99}, {37004, 15}];
loop_gift_reward({403, OpenDay, RegTime})
    when OpenDay >= 8 andalso
	   OpenDay =< 28 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 15000000}, {10001, 600000}, {10090, 199},
     {10091, 99}, {39052, 9999}, {39053, 9999}, {17009, 250},
     {17011, 15}, {39047, 3}, {35, 99}, {37004, 15}];
loop_gift_reward({403, OpenDay, RegTime})
    when OpenDay >= 29 andalso
	   OpenDay =< 56 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 15000000}, {10001, 600000}, {10090, 199},
     {10091, 99}, {39052, 9999}, {39053, 9999}, {17009, 250},
     {17011, 15}, {39047, 3}, {35, 99}, {37004, 15}];
loop_gift_reward({403, OpenDay, RegTime})
    when OpenDay >= 57 andalso
	   OpenDay =< 84 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 15000000}, {10001, 600000}, {10090, 199},
     {10091, 99}, {39052, 9999}, {39053, 9999}, {17009, 250},
     {17011, 15}, {39047, 3}, {35, 99}, {37004, 15}];
loop_gift_reward({403, OpenDay, RegTime})
    when OpenDay >= 85 andalso
	   OpenDay =< 112 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 15000000}, {10001, 600000}, {10090, 199},
     {10091, 99}, {39052, 9999}, {39053, 9999}, {17009, 250},
     {17011, 15}, {39047, 3}, {35, 99}, {37004, 15}];
loop_gift_reward({403, OpenDay, RegTime})
    when OpenDay >= 113 andalso
	   OpenDay =< 9999 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 15000000}, {10001, 600000}, {10090, 199},
     {10091, 99}, {39052, 9999}, {39053, 9999}, {17009, 250},
     {17011, 15}, {39047, 3}, {35, 99}, {37004, 15}];
loop_gift_reward({404, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 30000000}, {10001, 800000}, {10090, 399},
     {10091, 199}, {39052, 19999}, {39053, 19999},
     {17009, 500}, {17011, 30}, {39047, 6}, {35, 199},
     {37004, 25}];
loop_gift_reward({404, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 30000000}, {10001, 800000}, {10090, 399},
     {10091, 199}, {39052, 19999}, {39053, 19999},
     {17009, 500}, {17011, 30}, {39047, 6}, {35, 199},
     {37004, 25}];
loop_gift_reward({404, OpenDay, RegTime})
    when OpenDay >= 8 andalso
	   OpenDay =< 28 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 30000000}, {10001, 800000}, {10090, 399},
     {10091, 199}, {39052, 19999}, {39053, 19999},
     {17009, 500}, {17011, 30}, {39047, 6}, {35, 199},
     {37004, 25}];
loop_gift_reward({404, OpenDay, RegTime})
    when OpenDay >= 29 andalso
	   OpenDay =< 56 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 30000000}, {10001, 800000}, {10090, 399},
     {10091, 199}, {39052, 19999}, {39053, 19999},
     {17009, 500}, {17011, 30}, {39047, 6}, {35, 199},
     {37004, 25}];
loop_gift_reward({404, OpenDay, RegTime})
    when OpenDay >= 57 andalso
	   OpenDay =< 84 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 30000000}, {10001, 800000}, {10090, 399},
     {10091, 199}, {39052, 19999}, {39053, 19999},
     {17009, 500}, {17011, 30}, {39047, 6}, {35, 199},
     {37004, 25}];
loop_gift_reward({404, OpenDay, RegTime})
    when OpenDay >= 85 andalso
	   OpenDay =< 112 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 30000000}, {10001, 800000}, {10090, 399},
     {10091, 199}, {39052, 19999}, {39053, 19999},
     {17009, 500}, {17011, 30}, {39047, 6}, {35, 199},
     {37004, 25}];
loop_gift_reward({404, OpenDay, RegTime})
    when OpenDay >= 113 andalso
	   OpenDay =< 9999 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 30000000}, {10001, 800000}, {10090, 399},
     {10091, 199}, {39052, 19999}, {39053, 19999},
     {17009, 500}, {17011, 30}, {39047, 6}, {35, 199},
     {37004, 25}];
loop_gift_reward({405, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 40000000}, {10001, 1000000}, {10090, 599},
     {10091, 299}, {39052, 29999}, {39053, 29999},
     {17009, 1000}, {17011, 60}, {39047, 12}, {35, 499},
     {37004, 50}];
loop_gift_reward({405, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 40000000}, {10001, 1000000}, {10090, 599},
     {10091, 299}, {39052, 29999}, {39053, 29999},
     {17009, 1000}, {17011, 60}, {39047, 12}, {35, 499},
     {37004, 50}];
loop_gift_reward({405, OpenDay, RegTime})
    when OpenDay >= 8 andalso
	   OpenDay =< 28 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 40000000}, {10001, 1000000}, {10090, 599},
     {10091, 299}, {39052, 29999}, {39053, 29999},
     {17009, 1000}, {17011, 60}, {39047, 12}, {35, 499},
     {37004, 50}];
loop_gift_reward({405, OpenDay, RegTime})
    when OpenDay >= 29 andalso
	   OpenDay =< 56 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 40000000}, {10001, 1000000}, {10090, 599},
     {10091, 299}, {39052, 29999}, {39053, 29999},
     {17009, 1000}, {17011, 60}, {39047, 12}, {35, 499},
     {37004, 50}];
loop_gift_reward({405, OpenDay, RegTime})
    when OpenDay >= 57 andalso
	   OpenDay =< 84 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 40000000}, {10001, 1000000}, {10090, 599},
     {10091, 299}, {39052, 29999}, {39053, 29999},
     {17009, 1000}, {17011, 60}, {39047, 12}, {35, 499},
     {37004, 50}];
loop_gift_reward({405, OpenDay, RegTime})
    when OpenDay >= 85 andalso
	   OpenDay =< 112 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 40000000}, {10001, 1000000}, {10090, 599},
     {10091, 299}, {39052, 29999}, {39053, 29999},
     {17009, 1000}, {17011, 60}, {39047, 12}, {35, 499},
     {37004, 50}];
loop_gift_reward({405, OpenDay, RegTime})
    when OpenDay >= 113 andalso
	   OpenDay =< 9999 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 40000000}, {10001, 1000000}, {10090, 599},
     {10091, 299}, {39052, 29999}, {39053, 29999},
     {17009, 1000}, {17011, 60}, {39047, 12}, {35, 499},
     {37004, 50}];
loop_gift_reward({406, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 50000000}, {10001, 1500000}, {10090, 999},
     {10091, 499}, {39052, 49999}, {39053, 49999},
     {17009, 2500}, {17011, 150}, {39047, 30}, {35, 999},
     {37004, 100}];
loop_gift_reward({406, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 50000000}, {10001, 1500000}, {10090, 999},
     {10091, 499}, {39052, 49999}, {39053, 49999},
     {17009, 2500}, {17011, 150}, {39047, 30}, {35, 999},
     {37004, 100}];
loop_gift_reward({406, OpenDay, RegTime})
    when OpenDay >= 8 andalso
	   OpenDay =< 28 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 50000000}, {10001, 1500000}, {10090, 999},
     {10091, 499}, {39052, 49999}, {39053, 49999},
     {17009, 2500}, {17011, 150}, {39047, 30}, {35, 999},
     {37004, 100}];
loop_gift_reward({406, OpenDay, RegTime})
    when OpenDay >= 29 andalso
	   OpenDay =< 56 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 50000000}, {10001, 1500000}, {10090, 999},
     {10091, 499}, {39052, 49999}, {39053, 49999},
     {17009, 2500}, {17011, 150}, {39047, 30}, {35, 999},
     {37004, 100}];
loop_gift_reward({406, OpenDay, RegTime})
    when OpenDay >= 57 andalso
	   OpenDay =< 84 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 50000000}, {10001, 1500000}, {10090, 999},
     {10091, 499}, {39052, 49999}, {39053, 49999},
     {17009, 2500}, {17011, 150}, {39047, 30}, {35, 999},
     {37004, 100}];
loop_gift_reward({406, OpenDay, RegTime})
    when OpenDay >= 85 andalso
	   OpenDay =< 112 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 50000000}, {10001, 1500000}, {10090, 999},
     {10091, 499}, {39052, 49999}, {39053, 49999},
     {17009, 2500}, {17011, 150}, {39047, 30}, {35, 999},
     {37004, 100}];
loop_gift_reward({406, OpenDay, RegTime})
    when OpenDay >= 113 andalso
	   OpenDay =< 9999 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 50000000}, {10001, 1500000}, {10090, 999},
     {10091, 499}, {39052, 49999}, {39053, 49999},
     {17009, 2500}, {17011, 150}, {39047, 30}, {35, 999},
     {37004, 100}];
loop_gift_reward({411, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 2000000}, {10001, 200000}, {10090, 50},
     {59040, 10}, {59041, 5}, {39097, 2}, {10450, 10000},
     {10470, 2}, {35, 10}, {37003, 3}];
loop_gift_reward({411, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 2000000}, {10001, 200000}, {10090, 50},
     {59040, 10}, {59041, 5}, {39097, 2}, {10450, 10000},
     {10470, 2}, {35, 10}, {37003, 3}];
loop_gift_reward({411, OpenDay, RegTime})
    when OpenDay >= 8 andalso
	   OpenDay =< 28 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 2000000}, {10001, 200000}, {10090, 50},
     {59040, 10}, {59041, 5}, {39097, 2}, {10450, 10000},
     {10470, 2}, {35, 10}, {37003, 3}];
loop_gift_reward({411, OpenDay, RegTime})
    when OpenDay >= 29 andalso
	   OpenDay =< 56 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 2000000}, {10001, 200000}, {10090, 50},
     {59040, 10}, {59041, 5}, {39097, 2}, {10450, 10000},
     {10470, 2}, {35, 10}, {37003, 3}];
loop_gift_reward({411, OpenDay, RegTime})
    when OpenDay >= 57 andalso
	   OpenDay =< 84 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 2000000}, {10001, 200000}, {10090, 50},
     {59040, 10}, {59041, 5}, {39097, 2}, {10450, 10000},
     {10470, 2}, {35, 10}, {37003, 3}];
loop_gift_reward({411, OpenDay, RegTime})
    when OpenDay >= 85 andalso
	   OpenDay =< 112 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 2000000}, {10001, 200000}, {10090, 50},
     {59040, 10}, {59041, 5}, {39097, 2}, {10450, 10000},
     {10470, 2}, {35, 10}, {37003, 3}];
loop_gift_reward({411, OpenDay, RegTime})
    when OpenDay >= 113 andalso
	   OpenDay =< 9999 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 2000000}, {10001, 200000}, {10090, 50},
     {59040, 10}, {59041, 5}, {39097, 2}, {10450, 10000},
     {10470, 2}, {35, 10}, {37003, 3}];
loop_gift_reward({412, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 5000000}, {10001, 400000}, {10090, 99},
     {59040, 10}, {59041, 5}, {39097, 5}, {10450, 20000},
     {10470, 4}, {35, 20}, {37003, 5}];
loop_gift_reward({412, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 5000000}, {10001, 400000}, {10090, 99},
     {59040, 10}, {59041, 5}, {39097, 5}, {10450, 20000},
     {10470, 4}, {35, 20}, {37003, 5}];
loop_gift_reward({412, OpenDay, RegTime})
    when OpenDay >= 8 andalso
	   OpenDay =< 28 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 5000000}, {10001, 400000}, {10090, 99},
     {59040, 10}, {59041, 5}, {39097, 5}, {10450, 20000},
     {10470, 4}, {35, 20}, {37003, 5}];
loop_gift_reward({412, OpenDay, RegTime})
    when OpenDay >= 29 andalso
	   OpenDay =< 56 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 5000000}, {10001, 400000}, {10090, 99},
     {59040, 10}, {59041, 5}, {39097, 5}, {10450, 20000},
     {10470, 4}, {35, 20}, {37003, 5}];
loop_gift_reward({412, OpenDay, RegTime})
    when OpenDay >= 57 andalso
	   OpenDay =< 84 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 5000000}, {10001, 400000}, {10090, 99},
     {59040, 10}, {59041, 5}, {39097, 5}, {10450, 20000},
     {10470, 4}, {35, 20}, {37003, 5}];
loop_gift_reward({412, OpenDay, RegTime})
    when OpenDay >= 85 andalso
	   OpenDay =< 112 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 5000000}, {10001, 400000}, {10090, 99},
     {59040, 10}, {59041, 5}, {39097, 5}, {10450, 20000},
     {10470, 4}, {35, 20}, {37003, 5}];
loop_gift_reward({412, OpenDay, RegTime})
    when OpenDay >= 113 andalso
	   OpenDay =< 9999 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 5000000}, {10001, 400000}, {10090, 99},
     {59040, 10}, {59041, 5}, {39097, 5}, {10450, 20000},
     {10470, 4}, {35, 20}, {37003, 5}];
loop_gift_reward({413, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 10000000}, {10001, 600000}, {10090, 199},
     {59040, 10}, {59041, 5}, {39097, 10}, {10450, 50000},
     {10470, 10}, {35, 50}, {37003, 15}];
loop_gift_reward({413, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 10000000}, {10001, 600000}, {10090, 199},
     {59040, 10}, {59041, 5}, {39097, 10}, {10450, 50000},
     {10470, 10}, {35, 50}, {37003, 15}];
loop_gift_reward({413, OpenDay, RegTime})
    when OpenDay >= 8 andalso
	   OpenDay =< 28 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 10000000}, {10001, 600000}, {10090, 199},
     {59040, 10}, {59041, 5}, {39097, 10}, {10450, 50000},
     {10470, 10}, {35, 50}, {37003, 15}];
loop_gift_reward({413, OpenDay, RegTime})
    when OpenDay >= 29 andalso
	   OpenDay =< 56 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 10000000}, {10001, 600000}, {10090, 199},
     {59040, 10}, {59041, 5}, {39097, 10}, {10450, 50000},
     {10470, 10}, {35, 50}, {37003, 15}];
loop_gift_reward({413, OpenDay, RegTime})
    when OpenDay >= 57 andalso
	   OpenDay =< 84 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 10000000}, {10001, 600000}, {10090, 199},
     {59040, 10}, {59041, 5}, {39097, 10}, {10450, 50000},
     {10470, 10}, {35, 50}, {37003, 15}];
loop_gift_reward({413, OpenDay, RegTime})
    when OpenDay >= 85 andalso
	   OpenDay =< 112 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 10000000}, {10001, 600000}, {10090, 199},
     {59040, 10}, {59041, 5}, {39097, 10}, {10450, 50000},
     {10470, 10}, {35, 50}, {37003, 15}];
loop_gift_reward({413, OpenDay, RegTime})
    when OpenDay >= 113 andalso
	   OpenDay =< 9999 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 10000000}, {10001, 600000}, {10090, 199},
     {59040, 10}, {59041, 5}, {39097, 10}, {10450, 50000},
     {10470, 10}, {35, 50}, {37003, 15}];
loop_gift_reward({414, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 20000000}, {10001, 800000}, {10090, 399},
     {59040, 10}, {59041, 5}, {39097, 20}, {10450, 100000},
     {10470, 20}, {35, 100}, {37003, 25}];
loop_gift_reward({414, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 20000000}, {10001, 800000}, {10090, 399},
     {59040, 10}, {59041, 5}, {39097, 20}, {10450, 100000},
     {10470, 20}, {35, 100}, {37003, 25}];
loop_gift_reward({414, OpenDay, RegTime})
    when OpenDay >= 8 andalso
	   OpenDay =< 28 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 20000000}, {10001, 800000}, {10090, 399},
     {59040, 10}, {59041, 5}, {39097, 20}, {10450, 100000},
     {10470, 20}, {35, 100}, {37003, 25}];
loop_gift_reward({414, OpenDay, RegTime})
    when OpenDay >= 29 andalso
	   OpenDay =< 56 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 20000000}, {10001, 800000}, {10090, 399},
     {59040, 10}, {59041, 5}, {39097, 20}, {10450, 100000},
     {10470, 20}, {35, 100}, {37003, 25}];
loop_gift_reward({414, OpenDay, RegTime})
    when OpenDay >= 57 andalso
	   OpenDay =< 84 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 20000000}, {10001, 800000}, {10090, 399},
     {59040, 10}, {59041, 5}, {39097, 20}, {10450, 100000},
     {10470, 20}, {35, 100}, {37003, 25}];
loop_gift_reward({414, OpenDay, RegTime})
    when OpenDay >= 85 andalso
	   OpenDay =< 112 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 20000000}, {10001, 800000}, {10090, 399},
     {59040, 10}, {59041, 5}, {39097, 20}, {10450, 100000},
     {10470, 20}, {35, 100}, {37003, 25}];
loop_gift_reward({414, OpenDay, RegTime})
    when OpenDay >= 113 andalso
	   OpenDay =< 9999 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 20000000}, {10001, 800000}, {10090, 399},
     {59040, 10}, {59041, 5}, {39097, 20}, {10450, 100000},
     {10470, 20}, {35, 100}, {37003, 25}];
loop_gift_reward({415, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 35000000}, {10001, 1000000}, {10090, 599},
     {59040, 10}, {59041, 5}, {39097, 40}, {10450, 200000},
     {10470, 40}, {35, 200}, {37003, 50}];
loop_gift_reward({415, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 35000000}, {10001, 1000000}, {10090, 599},
     {59040, 10}, {59041, 5}, {39097, 40}, {10450, 200000},
     {10470, 40}, {35, 200}, {37003, 50}];
loop_gift_reward({415, OpenDay, RegTime})
    when OpenDay >= 8 andalso
	   OpenDay =< 28 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 35000000}, {10001, 1000000}, {10090, 599},
     {59040, 10}, {59041, 5}, {39097, 40}, {10450, 200000},
     {10470, 40}, {35, 200}, {37003, 50}];
loop_gift_reward({415, OpenDay, RegTime})
    when OpenDay >= 29 andalso
	   OpenDay =< 56 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 35000000}, {10001, 1000000}, {10090, 599},
     {59040, 10}, {59041, 5}, {39097, 40}, {10450, 200000},
     {10470, 40}, {35, 200}, {37003, 50}];
loop_gift_reward({415, OpenDay, RegTime})
    when OpenDay >= 57 andalso
	   OpenDay =< 84 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 35000000}, {10001, 1000000}, {10090, 599},
     {59040, 10}, {59041, 5}, {39097, 40}, {10450, 200000},
     {10470, 40}, {35, 200}, {37003, 50}];
loop_gift_reward({415, OpenDay, RegTime})
    when OpenDay >= 85 andalso
	   OpenDay =< 112 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 35000000}, {10001, 1000000}, {10090, 599},
     {59040, 10}, {59041, 5}, {39097, 40}, {10450, 200000},
     {10470, 40}, {35, 200}, {37003, 50}];
loop_gift_reward({415, OpenDay, RegTime})
    when OpenDay >= 113 andalso
	   OpenDay =< 9999 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 35000000}, {10001, 1000000}, {10090, 599},
     {59040, 10}, {59041, 5}, {39097, 40}, {10450, 200000},
     {10470, 40}, {35, 200}, {37003, 50}];
loop_gift_reward({416, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 50000000}, {10001, 1500000}, {10090, 999},
     {59040, 10}, {59041, 5}, {39097, 80}, {10450, 500000},
     {10470, 100}, {35, 500}, {37003, 100}];
loop_gift_reward({416, OpenDay, RegTime})
    when OpenDay >= 1 andalso
	   OpenDay =< 7 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 50000000}, {10001, 1500000}, {10090, 999},
     {59040, 10}, {59041, 5}, {39097, 80}, {10450, 500000},
     {10470, 100}, {35, 500}, {37003, 100}];
loop_gift_reward({416, OpenDay, RegTime})
    when OpenDay >= 8 andalso
	   OpenDay =< 28 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 50000000}, {10001, 1500000}, {10090, 999},
     {59040, 10}, {59041, 5}, {39097, 80}, {10450, 500000},
     {10470, 100}, {35, 500}, {37003, 100}];
loop_gift_reward({416, OpenDay, RegTime})
    when OpenDay >= 29 andalso
	   OpenDay =< 56 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 50000000}, {10001, 1500000}, {10090, 999},
     {59040, 10}, {59041, 5}, {39097, 80}, {10450, 500000},
     {10470, 100}, {35, 500}, {37003, 100}];
loop_gift_reward({416, OpenDay, RegTime})
    when OpenDay >= 57 andalso
	   OpenDay =< 84 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 50000000}, {10001, 1500000}, {10090, 999},
     {59040, 10}, {59041, 5}, {39097, 80}, {10450, 500000},
     {10470, 100}, {35, 500}, {37003, 100}];
loop_gift_reward({416, OpenDay, RegTime})
    when OpenDay >= 85 andalso
	   OpenDay =< 112 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 50000000}, {10001, 1500000}, {10090, 999},
     {59040, 10}, {59041, 5}, {39097, 80}, {10450, 500000},
     {10470, 100}, {35, 500}, {37003, 100}];
loop_gift_reward({416, OpenDay, RegTime})
    when OpenDay >= 113 andalso
	   OpenDay =< 9999 andalso
	     RegTime >= 0 andalso RegTime =< 2000000000 ->
    [{3, 50000000}, {10001, 1500000}, {10090, 999},
     {59040, 10}, {59041, 5}, {39097, 80}, {10450, 500000},
     {10470, 100}, {35, 500}, {37003, 100}];
loop_gift_reward(_) -> [].


