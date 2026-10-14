-file("data/privilege_data.erl", 1).

-file("src/mod/data/privilege_data.erl", 1).

-module(privilege_data).

-lager_records([{privilege_data,
		 [id, name, pay_type, charge_id, loss, limit_type,
		  limit_day, reward, limit_lev]},
		{privilege_gift,
		 [ver, id, status, buy_time, expire_time]},
		{privilege, [ver, id, expire_time]},
		{m_privilege, [ver, list, gift]}]).

-export([get_const/1, get/1, get_privilege/1, charge/1,
	 fast_combat/1, fast_combat_max/0, gift_reward/1]).

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

-file("src/mod/data/privilege_data.erl", 16).

-file("inc/privilege.hrl", 1).

-record(m_privilege, {ver = 1, list = [], gift = []}).

-record(privilege, {ver = 1, id = 0, expire_time = 0}).

-record(privilege_gift,
	{ver = 1, id = 0, status = 0, buy_time = 0,
	 expire_time = 0}).

-record(privilege_data,
	{id = 0, name = <<>>, pay_type = 0, charge_id = 0,
	 loss = 0, limit_type = 0, limit_day = 0, reward = [],
	 limit_lev = 0}).

-file("src/mod/data/privilege_data.erl", 17).

get_const(_) -> undefined.

get(101) ->
    #privilege_data{id = 101,
		    name = lang:get(<<"先知水晶礼包"/utf8>>), pay_type = 2,
		    charge_id = 304, loss = 99991, limit_type = 1,
		    limit_day = 7};
get(102) ->
    #privilege_data{id = 102,
		    name = lang:get(<<"快速作战特权"/utf8>>), pay_type = 2,
		    charge_id = 305, loss = 99992, limit_type = 1,
		    limit_day = 30};
get(103) ->
    #privilege_data{id = 103,
		    name = lang:get(<<"远航高级特权"/utf8>>), pay_type = 2,
		    loss = 99993, limit_type = 0};
get(104) ->
    #privilege_data{id = 104,
		    name = lang:get(<<"远航豪华特权"/utf8>>), pay_type = 2,
		    loss = 99994, limit_type = 0};
get(105) ->
    #privilege_data{id = 105,
		    name = lang:get(<<"元素神殿特权"/utf8>>), pay_type = 2,
		    charge_id = 307, loss = 99995, limit_type = 1,
		    limit_day = 30, limit_lev = 90};
get(106) ->
    #privilege_data{id = 106,
		    name = lang:get(<<"精灵孵化特权"/utf8>>), pay_type = 2,
		    charge_id = 310, loss = 99996, limit_type = 1,
		    limit_day = 7, limit_lev = 80};
get(107) ->
    #privilege_data{id = 107,
		    name = lang:get(<<"精灵孵化特权"/utf8>>), pay_type = 2,
		    charge_id = 313, loss = 99997, limit_type = 1,
		    limit_day = 30, limit_lev = 0};
get(_Info) ->
    logger:data_error("get_data_not_exist===>~w", [_Info],
		      privilege_data, 90),
    undefined.

get_privilege(1) ->
    #{id => 1, name => lang:get(<<"快速作战特权"/utf8>>),
      expire_type => 1, expire_time => 30};
get_privilege(2) ->
    #{id => 2, name => lang:get(<<"远航高级特权"/utf8>>),
      expire_type => 0};
get_privilege(3) ->
    #{id => 3, name => lang:get(<<"远航豪华特权"/utf8>>),
      expire_type => 0};
get_privilege(4) ->
    #{id => 4, name => lang:get(<<"元素神殿特权"/utf8>>),
      expire_type => 1, expire_time => 30};
get_privilege(5) ->
    #{id => 5, name => lang:get(<<"精灵孵化特权"/utf8>>),
      expire_type => 1, expire_time => 7};
get_privilege(6) ->
    #{id => 6, name => lang:get(<<"精灵孵化特权"/utf8>>),
      expire_type => 1, expire_time => 30};
get_privilege(_Info) ->
    logger:data_error("get_privilege_data_not_exist===>~w",
		      [_Info], privilege_data, 132),
    undefined.

charge(304) -> 101;
charge(305) -> 102;
charge(307) -> 105;
charge(310) -> 106;
charge(313) -> 107;
charge(_) -> undefined.

fast_combat(1) -> 200;
fast_combat(2) -> 200;
fast_combat(3) -> 200;
fast_combat(4) -> 200;
fast_combat(5) -> 200;
fast_combat(6) -> 200;
fast_combat(7) -> 200;
fast_combat(8) -> 200;
fast_combat(_) -> undefined.

fast_combat_max() -> 8.

gift_reward({101, Lev})
    when Lev >= 1 andalso Lev =< 70 ->
    [{14001, 3}, {10001, 1000}, {1, 100000}];
gift_reward({101, Lev})
    when Lev >= 71 andalso Lev =< 300 ->
    [{14001, 3}, {10001, 1000}, {1, 100000}];
gift_reward({102, Lev})
    when Lev >= 1 andalso Lev =< 70 ->
    [{30053, 1}, {10403, 10}, {10001, 1000}];
gift_reward({102, Lev})
    when Lev >= 71 andalso Lev =< 300 ->
    [{30053, 1}, {10403, 10}, {10001, 1000}];
gift_reward({103, Lev})
    when Lev >= 1 andalso Lev =< 300 ->
    [{30054, 1}, {10403, 5}, {10001, 200}];
gift_reward({104, Lev})
    when Lev >= 1 andalso Lev =< 300 ->
    [{30055, 1}, {14001, 1}, {10403, 10}];
gift_reward({105, Lev})
    when Lev >= 1 andalso Lev =< 300 ->
    [{30056, 1}, {14001, 2}, {10001, 1000}];
gift_reward({106, Lev})
    when Lev >= 80 andalso Lev =< 300 ->
    [{30057, 1}, {10603, 3}, {10040, 10}];
gift_reward({107, Lev})
    when Lev >= 0 andalso Lev =< 300 ->
    [{30058, 1}, {10603, 3}, {10040, 10}];
gift_reward(_Info) ->
    logger:data_error("gift_reward_data_not_exist===>~w",
		      [_Info], privilege_data, 162),
    undefined.


