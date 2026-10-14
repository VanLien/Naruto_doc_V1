-file("data/break_egg_data.erl", 1).

-module(break_egg_data).

-export([get_const/1, perfect_rand_list/0,
	 ordinary_rand_list/0, perfect_rate/1]).

-file("../server/inc/common.hrl", 1).

-file("../server/inc/lib_log.hrl", 1).

-file("../server/inc/common.hrl", 112).

-type p() :: string().

-type z() :: non_neg_integer().

-type srv_id() :: bitstring().

-type role_id() :: {pos_integer(), srv_id()}.

-type guild_id() :: {pos_integer(), srv_id()}.

-type unit_id() :: {pos_integer(), pos_integer()}.

-type pos() :: {pos_integer(), non_neg_integer(),
		non_neg_integer()}.

-file("data/break_egg_data.erl", 13).

-file("../server/inc/break_egg.hrl", 1).

-record(m_break_egg,
	{ver = 1, camp_id = 0, lucky = 0, refresh_time = 0,
	 break_time = 0, egg_type = [], last_list = [],
	 each_list = [], logs = []}).

-record(break_egg_data,
	{id = 0, rewards = [], rate = 0, lev_min = 0,
	 lev_max = 0, time_min = 0, time_max = 0, is_record = 0,
	 is_notice = 0, is_effect = 0, role_max = 0, srv_max = 0,
	 hit_must_not_after_m_times = 0,
	 not_hit_must_after_n_times = 0}).

-file("data/break_egg_data.erl", 14).

get_const(holiday_rule) -> 1;
get_const(lev_limit) -> 10;
get_const(item_bid) -> 37004;
get_const(item_price) -> 200;
get_const(give_exp) -> 5000;
get_const(gold_once) -> 200;
get_const(free_time) -> 1;
get_const(best_egg_max) -> 1;
get_const(lucky_min) -> 0;
get_const(refresh_gold) -> 2000000;
get_const(add_lucky) -> 1;
get_const(egg_num) -> 6;
get_const(lucky_max) -> 8;
get_const(record_len) -> 30;
get_const(open_lev) -> 10;
get_const(_) -> undefined.

perfect_rand_list() ->
    [#break_egg_data{id = 2007, rewards = [{3, 10000000}],
		     rate = 250, lev_min = 0, lev_max = 999, time_min = 1,
		     time_max = 0, hit_must_not_after_m_times = 1,
		     is_record = 1, is_notice = 1, role_max = 999999,
		     srv_max = 9999999},
     #break_egg_data{id = 2006, rewards = [{40431, 1}],
		     rate = 150, lev_min = 0, lev_max = 999, time_min = 1,
		     time_max = 0, hit_must_not_after_m_times = 1,
		     is_record = 1, is_notice = 1, role_max = 999999,
		     srv_max = 9999999},
     #break_egg_data{id = 2005, rewards = [{40331, 1}],
		     rate = 150, lev_min = 0, lev_max = 999, time_min = 1,
		     time_max = 0, hit_must_not_after_m_times = 1,
		     is_record = 1, is_notice = 1, role_max = 999999,
		     srv_max = 9999999},
     #break_egg_data{id = 2004, rewards = [{40231, 1}],
		     rate = 150, lev_min = 0, lev_max = 999, time_min = 1,
		     time_max = 0, hit_must_not_after_m_times = 1,
		     is_record = 1, is_notice = 1, role_max = 999999,
		     srv_max = 9999999},
     #break_egg_data{id = 2003, rewards = [{40131, 1}],
		     rate = 150, lev_min = 0, lev_max = 999, time_min = 0,
		     time_max = 0, is_record = 1, is_notice = 1,
		     role_max = 999999, srv_max = 9999999},
     #break_egg_data{id = 2002, rewards = [{10458, 1}],
		     rate = 50, lev_min = 0, lev_max = 999, time_min = 0,
		     time_max = 0, is_record = 1, is_notice = 1,
		     role_max = 999999, srv_max = 999999},
     #break_egg_data{id = 2001, rewards = [{59041, 5}],
		     rate = 100, lev_min = 0, lev_max = 999, time_min = 1,
		     time_max = 0, is_record = 1, is_notice = 1,
		     role_max = 999999, srv_max = 999999}].

ordinary_rand_list() ->
    [#break_egg_data{id = 1007, rewards = [{39053, 5}],
		     rate = 200, lev_min = 0, lev_max = 999, time_min = 0,
		     time_max = 0, role_max = 999999, srv_max = 9999999},
     #break_egg_data{id = 1006, rewards = [{39052, 5}],
		     rate = 200, lev_min = 0, lev_max = 999, time_min = 0,
		     time_max = 0, role_max = 999999, srv_max = 9999999},
     #break_egg_data{id = 1005, rewards = [{35, 9}],
		     rate = 120, lev_min = 0, lev_max = 999, time_min = 0,
		     time_max = 0, role_max = 999999, srv_max = 9999999},
     #break_egg_data{id = 1004, rewards = [{39039, 1}],
		     rate = 100, lev_min = 0, lev_max = 999, time_min = 0,
		     time_max = 0, role_max = 999999, srv_max = 9999999},
     #break_egg_data{id = 1003, rewards = [{10090, 3}],
		     rate = 100, lev_min = 0, lev_max = 999, time_min = 0,
		     time_max = 0, role_max = 999999, srv_max = 9999999},
     #break_egg_data{id = 1002, rewards = [{14001, 5}],
		     rate = 120, lev_min = 0, lev_max = 999, time_min = 0,
		     time_max = 0, role_max = 999999, srv_max = 9999999},
     #break_egg_data{id = 1001, rewards = [{10450, 5000}],
		     rate = 160, lev_min = 0, lev_max = 999, time_min = 0,
		     time_max = 0, role_max = 999999, srv_max = 9999999}].

perfect_rate(Lucky)
    when Lucky >= 0 andalso Lucky =< 0 ->
    15;
perfect_rate(Lucky)
    when Lucky >= 1 andalso Lucky =< 1 ->
    16;
perfect_rate(Lucky)
    when Lucky >= 2 andalso Lucky =< 2 ->
    17;
perfect_rate(Lucky)
    when Lucky >= 3 andalso Lucky =< 3 ->
    18;
perfect_rate(Lucky)
    when Lucky >= 4 andalso Lucky =< 4 ->
    19;
perfect_rate(Lucky)
    when Lucky >= 5 andalso Lucky =< 5 ->
    20;
perfect_rate(Lucky)
    when Lucky >= 6 andalso Lucky =< 6 ->
    21;
perfect_rate(Lucky)
    when Lucky >= 7 andalso Lucky =< 7 ->
    22;
perfect_rate(Lucky)
    when Lucky >= 8 andalso Lucky =< 999 ->
    1000;
perfect_rate(_Info) ->
    lager:error(io_lib:format("perfect_rate_data_not_exist===>~w",
			      [_Info])),
    undefined.


