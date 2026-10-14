-file("data/login_days_new_data.erl", 1).

-file("data/login_days_new_data.erl", 1).

-module(login_days_new_data).

-export([get/1, max_day/0, days/0]).

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

-file("data/login_days_new_data.erl", 12).

get(1) ->
    #{day => 1, name => lang:get(<<"第一天"/utf8>>),
      rewards =>
	  [{3, 1000000}, {1, 50000000}, {22, 50000000},
	   {10090, 30}, {10091, 30}, {10001, 100000}]};
get(2) ->
    #{day => 2, name => lang:get(<<"第二天"/utf8>>),
      rewards =>
	  [{3, 1000000}, {40429, 1}, {40329, 1}, {40229, 1},
	   {40129, 1}, {10001, 10000}]};
get(3) ->
    #{day => 3, name => lang:get(<<"第三天"/utf8>>),
      rewards =>
	  [{3, 1000000}, {40430, 1}, {40330, 1}, {40230, 1},
	   {40130, 1}, {10001, 10000}]};
get(4) ->
    #{day => 4, name => lang:get(<<"第四天"/utf8>>),
      rewards =>
	  [{3, 1000000}, {40431, 1}, {40331, 1}, {40231, 1},
	   {40131, 1}, {10001, 10000}]};
get(5) ->
    #{day => 5, name => lang:get(<<"第五天"/utf8>>),
      rewards =>
	  [{3, 1000000}, {39039, 20}, {10090, 30}, {10091, 30},
	   {10001, 100000}]};
get(6) ->
    #{day => 6, name => lang:get(<<"第六天"/utf8>>),
      rewards =>
	  [{3, 1000000}, {59040, 10}, {10090, 30}, {10091, 30},
	   {10001, 100000}]};
get(7) ->
    #{day => 7, name => lang:get(<<"第七天"/utf8>>),
      rewards =>
	  [{3, 1000000}, {59041, 5}, {10090, 30}, {10091, 30},
	   {10001, 100000}]};
get(8) ->
    #{day => 8, name => lang:get(<<"第八天"/utf8>>),
      rewards =>
	  [{3, 1000000}, {39052, 500}, {39053, 500}, {10090, 30},
	   {10091, 30}, {10001, 100000}]};
get(_Info) ->
    logger:data_error("get_data_not_exist===>~w", [_Info],
		      login_days_new_data, 61),
    undefined.

max_day() -> 8.

days() -> [8, 7, 6, 5, 4, 3, 2, 1].


