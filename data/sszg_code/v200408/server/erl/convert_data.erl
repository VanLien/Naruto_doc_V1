-file("src/mod/data/convert_data.erl", 1).

-module(convert_data).

-lager_records([]).

-export([get_const/1, convert_coin/1,
	 convert_silver_coin/1, wish_reward/1, ext_reward/1,
	 ext_list/1, coin_list/1, get_coin/1, coin_vip/1]).

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

-file("src/mod/data/convert_data.erl", 18).

get_const(reward_num) -> 10;
get_const(times_reward) -> [{11, 500}];
get_const(pray_rules) -> 0;
get_const(point_gold_refresh) ->
    [{0, 0, 0}, {9, 0, 0}, {19, 0, 0}];
get_const(red_lev_min) -> 6;
get_const(_) -> undefined.

convert_coin(1) -> {60, 6000};
convert_coin(2) -> {300, 30000};
convert_coin(3) -> {1280, 128000};
convert_coin(4) -> {1980, 198000};
convert_coin(5) -> {3280, 328000};
convert_coin(6) -> {6480, 648000};
convert_coin(_) -> undefined.

convert_silver_coin(1) -> {60, 600000};
convert_silver_coin(2) -> {300, 3000000};
convert_silver_coin(3) -> {1280, 12800000};
convert_silver_coin(4) -> {1980, 19800000};
convert_silver_coin(5) -> {3280, 32800000};
convert_silver_coin(6) -> {6480, 64800000};
convert_silver_coin(_) -> undefined.

wish_reward(Count) when Count >= 1 andalso Count =< 1 ->
    {[{4, 0}], [{11, 400}], 50, 0};
wish_reward(Count) when Count >= 2 andalso Count =< 2 ->
    {[{4, 20}], [{11, 400}], 50, 2};
wish_reward(Count) when Count >= 3 andalso Count =< 3 ->
    {[{4, 30}], [{11, 400}], 50, 2};
wish_reward(Count) when Count >= 4 andalso Count =< 4 ->
    {[{4, 40}], [{11, 400}], 55, 2};
wish_reward(Count) when Count >= 5 andalso Count =< 6 ->
    {[{4, 40}], [{11, 400}], 60, 4};
wish_reward(Count) when Count >= 7 andalso Count =< 8 ->
    {[{4, 50}], [{11, 400}], 65, 6};
wish_reward(Count)
    when Count >= 9 andalso Count =< 10 ->
    {[{4, 50}], [{11, 400}], 70, 8};
wish_reward(Count)
    when Count >= 11 andalso Count =< 12 ->
    {[{4, 60}], [{11, 400}], 75, 10};
wish_reward(Count)
    when Count >= 13 andalso Count =< 14 ->
    {[{4, 60}], [{11, 400}], 80, 12};
wish_reward(Count)
    when Count >= 15 andalso Count =< 16 ->
    {[{4, 60}], [{11, 400}], 90, 14};
wish_reward(_Info) ->
    logger:data_error("wish_reward_data_not_exist===>~w",
		      [_Info], convert_data, 52),
    undefined.

ext_reward({1, 10010}) -> 200;
ext_reward({1, 10300}) -> 220;
ext_reward({1, 20080}) -> 240;
ext_reward({1, 30160}) -> 260;
ext_reward({1, 40240}) -> 280;
ext_reward({1, 50320}) -> 300;
ext_reward({1, 60400}) -> 320;
ext_reward({2, 10010}) -> 200;
ext_reward({2, 10300}) -> 230;
ext_reward({2, 20080}) -> 260;
ext_reward({2, 30160}) -> 290;
ext_reward({2, 40240}) -> 320;
ext_reward({2, 50320}) -> 350;
ext_reward({2, 60400}) -> 380;
ext_reward(_) -> 0.

ext_list(2) ->
    [10010, 10300, 20080, 30160, 40240, 50320, 60400];
ext_list(1) ->
    [10010, 10300, 20080, 30160, 40240, 50320, 60400];
ext_list(_) -> [].

coin_list(1) -> [1, 2, 3];
coin_list(0) -> [1, 2, 3];
coin_list(_) -> [].

get_coin({0, 1}) ->
    #{type => 0, id => 1, price => 0, time => 60,
      coin => 10000, num => 1};
get_coin({0, 2}) ->
    #{type => 0, id => 2, price => 20, time => 120,
      coin => 20000, num => 1};
get_coin({0, 3}) ->
    #{type => 0, id => 3, price => 50, time => 300,
      coin => 50000, num => 1};
get_coin({1, 1}) ->
    #{type => 1, id => 1, price => 0, time => 60,
      coin => 10000, num => 3};
get_coin({1, 2}) ->
    #{type => 1, id => 2, price => 20, time => 120,
      coin => 20000, num => 10};
get_coin({1, 3}) ->
    #{type => 1, id => 3, price => 50, time => 300,
      coin => 50000, num => 10};
get_coin(_Info) ->
    logger:data_error("get_coin_data_not_exist===>~w",
		      [_Info], convert_data, 132),
    undefined.

coin_vip(0) -> 0;
coin_vip(1) -> 200;
coin_vip(2) -> 300;
coin_vip(3) -> 400;
coin_vip(4) -> 600;
coin_vip(5) -> 800;
coin_vip(6) -> 1000;
coin_vip(7) -> 1200;
coin_vip(8) -> 1400;
coin_vip(9) -> 1600;
coin_vip(10) -> 1800;
coin_vip(11) -> 2000;
coin_vip(12) -> 2200;
coin_vip(13) -> 2400;
coin_vip(14) -> 2600;
coin_vip(15) -> 2800;
coin_vip(16) -> 3000;
coin_vip(17) -> 3200;
coin_vip(18) -> 3400;
coin_vip(19) -> 3600;
coin_vip(20) -> 3800;
coin_vip(21) -> 4000;
coin_vip(22) -> 4200;
coin_vip(23) -> 4400;
coin_vip(24) -> 4600;
coin_vip(25) -> 4800;
coin_vip(26) -> 5000;
coin_vip(27) -> 5200;
coin_vip(28) -> 5400;
coin_vip(29) -> 5600;
coin_vip(30) -> 5800;
coin_vip(_Info) ->
    logger:data_error("coin_vip_data_not_exist===>~w",
		      [_Info], convert_data, 165),
    undefined.


