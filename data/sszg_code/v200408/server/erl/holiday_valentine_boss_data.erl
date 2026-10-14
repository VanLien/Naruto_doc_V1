-file("data/holiday_valentine_boss_data.erl", 1).

-file("data/holiday_valentine_boss_data.erl", 1).

-file("data/holiday_valentine_boss_data.erl", 1).

-module(holiday_valentine_boss_data).

-export([get_const/1, get_all_id_time/0, get_time/1,
	 get_boss_id/1, get_reward/1]).

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

-file("data/holiday_valentine_boss_data.erl", 14).

get_const(holiday_valentine_boss_buy_loss1) ->
    [{3, 10000000}];
get_const(holiday_valentine_boss_buy_loss2) ->
    [{3, 15000000}];
get_const(holiday_valentine_boss_buy_loss3) ->
    [{3, 700000}];
get_const(holiday_valentine_boss_buy_loss4) ->
    [{3, 800000}];
get_const(holiday_valentine_boss_buy_loss5) ->
    [{3, 900000}];
get_const(holiday_valentine_boss_buy_loss6) ->
    [{3, 1000000}];
get_const(holiday_valentine_boss_buy_loss7) ->
    [{3, 1100000}];
get_const(holiday_valentine_boss_buy_loss8) ->
    [{3, 1200000}];
get_const(holiday_valentine_boss_buy_loss9) ->
    [{3, 1300000}];
get_const(holiday_valentine_boss_buy_loss10) ->
    [{3, 1400000}];
get_const(holiday_valentine_boss_buy_loss11) ->
    [{3, 1500000}];
get_const(holiday_valentine_boss_buy_loss12) ->
    [{3, 1600000}];
get_const(holiday_valentine_boss_buy_loss13) ->
    [{3, 1700000}];
get_const(holiday_valentine_boss_buy_loss14) ->
    [{3, 1800000}];
get_const(holiday_valentine_boss_buy_loss15) ->
    [{3, 1900000}];
get_const(holiday_valentine_boss_buy_loss16) ->
    [{3, 2000000}];
get_const(_) -> undefined.

get_all_id_time() ->
    [{49971, {{2023, 8, 10}, {23, 59, 59}},
      {{2025, 11, 30}, {23, 59, 59}}, 1, 5}].

get_time(1) -> {5, 16};
get_time(2) -> {2, 10};
get_time(_Info) ->
    logger:data_error("get_time_data_not_exist===>~w",
		      [_Info], holiday_valentine_boss_data, 22),
    undefined.

get_boss_id(1) -> 88001;
get_boss_id(2) -> 49995;
get_boss_id(_Info) ->
    logger:data_error("get_boss_id_data_not_exist===>~w",
		      [_Info], holiday_valentine_boss_data, 25),
    undefined.

get_reward({1, Dps})
    when Dps >= 1 andalso Dps =< 3000000 ->
    {[], [{38099, 1}]};
get_reward({1, Dps})
    when Dps >= 3000001 andalso Dps =< 6000000 ->
    {[], [{38099, 2}]};
get_reward({1, Dps})
    when Dps >= 6000001 andalso Dps =< 9000000 ->
    {[], [{38099, 3}]};
get_reward({1, Dps})
    when Dps >= 9000001 andalso Dps =< 13000000 ->
    {[], [{38099, 4}]};
get_reward({1, Dps})
    when Dps >= 13000001 andalso Dps =< 19000000 ->
    {[], [{38099, 5}]};
get_reward({1, Dps})
    when Dps >= 19000001 andalso Dps =< 31000000 ->
    {[], [{38099, 6}]};
get_reward({1, Dps})
    when Dps >= 31000001 andalso Dps =< 56000000 ->
    {[], [{38099, 7}]};
get_reward({1, Dps})
    when Dps >= 56000001 andalso Dps =< 91000000 ->
    {[], [{38099, 8}]};
get_reward({1, Dps})
    when Dps >= 91000001 andalso Dps =< 141000000 ->
    {[], [{38099, 9}]};
get_reward({1, Dps})
    when Dps >= 141000001 andalso Dps =< 211000000 ->
    {[], [{38099, 10}]};
get_reward({1, Dps})
    when Dps >= 211000001 andalso Dps =< 311000000 ->
    {[], [{38099, 11}]};
get_reward({1, Dps})
    when Dps >= 311000001 andalso Dps =< 461000000 ->
    {[], [{38099, 12}]};
get_reward({1, Dps})
    when Dps >= 461000001 andalso Dps =< 661000000 ->
    {[], [{38099, 13}]};
get_reward({1, Dps})
    when Dps >= 661000001 andalso Dps =< 961000000 ->
    {[], [{38099, 14}]};
get_reward({1, Dps})
    when Dps >= 961000001 andalso Dps =< 1361000000 ->
    {[], [{38099, 15}]};
get_reward({1, Dps})
    when Dps >= 1361000001 andalso Dps =< 1861000000 ->
    {[], [{38099, 16}]};
get_reward({1, Dps})
    when Dps >= 1861000001 andalso Dps =< 2461000000 ->
    {[], [{38099, 17}]};
get_reward({1, Dps})
    when Dps >= 2461000001 andalso Dps =< 3161000000 ->
    {[], [{38099, 18}]};
get_reward({1, Dps})
    when Dps >= 3161000001 andalso Dps =< 4061000000 ->
    {[], [{38099, 19}]};
get_reward({1, Dps})
    when Dps >= 4061000001 andalso Dps =< 5061000000 ->
    {[], [{38099, 20}]};
get_reward({1, Dps})
    when Dps >= 5061000001 andalso Dps =< 6161000000 ->
    {[], [{38099, 21}]};
get_reward({1, Dps})
    when Dps >= 6161000001 andalso Dps =< 7500000000 ->
    {[], [{38099, 22}]};
get_reward({2, Dps})
    when Dps >= 1 andalso Dps =< 3000000 ->
    {[], [{38099, 1}, {38099, 1}]};
get_reward({2, Dps})
    when Dps >= 3000001 andalso Dps =< 6000000 ->
    {[], [{38099, 2}, {38099, 2}]};
get_reward({2, Dps})
    when Dps >= 6000001 andalso Dps =< 9000000 ->
    {[], [{38099, 3}, {38099, 3}]};
get_reward({2, Dps})
    when Dps >= 9000001 andalso Dps =< 13000000 ->
    {[], [{38099, 4}, {38099, 4}]};
get_reward({2, Dps})
    when Dps >= 13000001 andalso Dps =< 19000000 ->
    {[], [{38099, 5}, {38099, 5}]};
get_reward({2, Dps})
    when Dps >= 19000001 andalso Dps =< 31000000 ->
    {[], [{38099, 7}, {38099, 6}]};
get_reward({2, Dps})
    when Dps >= 31000001 andalso Dps =< 56000000 ->
    {[], [{38099, 9}, {38099, 7}]};
get_reward({2, Dps})
    when Dps >= 56000001 andalso Dps =< 91000000 ->
    {[], [{38099, 11}, {38099, 8}]};
get_reward({2, Dps})
    when Dps >= 91000001 andalso Dps =< 141000000 ->
    {[], [{38099, 13}, {38099, 9}]};
get_reward({2, Dps})
    when Dps >= 141000001 andalso Dps =< 211000000 ->
    {[], [{38099, 15}, {38099, 10}]};
get_reward({2, Dps})
    when Dps >= 211000001 andalso Dps =< 311000000 ->
    {[], [{38099, 17}, {38099, 11}]};
get_reward({2, Dps})
    when Dps >= 311000001 andalso Dps =< 461000000 ->
    {[], [{38099, 19}, {38099, 12}]};
get_reward({2, Dps})
    when Dps >= 461000001 andalso Dps =< 661000000 ->
    {[], [{38099, 21}, {38099, 13}]};
get_reward({2, Dps})
    when Dps >= 661000001 andalso Dps =< 961000000 ->
    {[], [{38099, 23}, {38099, 14}]};
get_reward({2, Dps})
    when Dps >= 961000001 andalso Dps =< 1361000000 ->
    {[], [{38099, 25}, {38099, 25}]};
get_reward({2, Dps})
    when Dps >= 1361000001 andalso Dps =< 1861000000 ->
    {[], [{38099, 27}, {38099, 27}]};
get_reward({2, Dps})
    when Dps >= 1861000001 andalso Dps =< 2461000000 ->
    {[], [{38099, 30}, {38099, 30}]};
get_reward({2, Dps})
    when Dps >= 2461000001 andalso Dps =< 3161000000 ->
    {[], [{38099, 33}, {38099, 33}]};
get_reward({2, Dps})
    when Dps >= 3161000001 andalso Dps =< 4061000000 ->
    {[], [{38099, 35}, {38099, 35}]};
get_reward({2, Dps})
    when Dps >= 4061000001 andalso Dps =< 5061000000 ->
    {[], [{38099, 38}, {38099, 38}]};
get_reward({2, Dps})
    when Dps >= 5061000001 andalso Dps =< 6161000000 ->
    {[], [{38099, 41}, {38099, 41}]};
get_reward({2, Dps})
    when Dps >= 6161000001 andalso Dps =< 7500000000 ->
    {[], [{38099, 45}, {38099, 45}]};
get_reward(_Info) ->
    logger:data_error("get_reward_data_not_exist===>~w",
		      [_Info], holiday_valentine_boss_data, 49),
    undefined.


