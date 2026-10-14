-file("src/mod/misc/var_ver.erl", 1).

-module(var_ver).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]}]).

-export([do/1]).

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

-file("src/mod/misc/var_ver.erl", 8).

-file("inc/var.hrl", 1).

-record(m_var,
	{ver = -1, last_reset_time = 0  :: non_neg_integer(),
	 last_reset_day = {0, 0, 0}  ::
	     {non_neg_integer(), non_neg_integer(),
	      non_neg_integer()},
	 last_reset_five = 0  :: non_neg_integer(),
	 last_reset_week = {0, 0}  ::
	     {non_neg_integer(), non_neg_integer()},
	 last_acc_time = 0  :: non_neg_integer(),
	 acc_time = 0  :: non_neg_integer(),
	 login_charge_count = 0  :: non_neg_integer(),
	 acc_charge_count = 0  :: non_neg_integer(),
	 login_charge_num = 0  :: non_neg_integer(),
	 day_login = 0  :: non_neg_integer(),
	 acc_login_count = 0  :: non_neg_integer(),
	 total_acc_time = 0  :: non_neg_integer(),
	 acc_days = 1  :: non_neg_integer(),
	 best_days = 1  :: non_neg_integer(),
	 now_days = 1  :: non_neg_integer(),
	 month_days = 1  :: non_neg_integer(),
	 day_vars = []  :: [tuple()],
	 five_vars = []  :: [tuple()],
	 week_vars = []  :: [tuple()],
	 month_vars = []  :: [tuple()],
	 timeout_vars = []  :: [tuple()],
	 acc_vars = []  :: [tuple()],
	 other_vars = []  :: [tuple()],
	 week_five_vars = []  :: [tuple()],
	 week_five_time = 0  :: non_neg_integer()}).

-record(role_var,
	{id = {0, "", 0}  :: tuple(), vars = []  :: [tuple()]}).

-file("src/mod/misc/var_ver.erl", 9).

do({m_var, Ver = 1, LastResetTime, LastResetDay,
    LastResetFive, LastResetWeek, LastAccTime, AccTime,
    DayLogin, TotalAccTime, AccDays, BestDays, NowDays,
    MonthDays, DayVars, FiveVars, WeekVars, MonthVars,
    TimeoutVars, AccVars, OtherVars}) ->
    WeekFiveVars = [],
    WeekFiveTime = date:unixtime(),
    do({m_var, Ver + 1, LastResetTime, LastResetDay,
	LastResetFive, LastResetWeek, LastAccTime, AccTime,
	DayLogin, TotalAccTime, AccDays, BestDays, NowDays,
	MonthDays, DayVars, FiveVars, WeekVars, MonthVars,
	TimeoutVars, AccVars, OtherVars, WeekFiveVars,
	WeekFiveTime});
do({m_var, Ver = 2, LastResetTime, LastResetDay,
    LastResetFive, LastResetWeek, LastAccTime, AccTime,
    DayLogin, TotalAccTime, AccDays, BestDays, NowDays,
    MonthDays, DayVars, FiveVars, WeekVars, MonthVars,
    TimeoutVars, AccVars, OtherVars, WeekFiveVars,
    WeekFiveTime}) ->
    AccLoginCount = DayLogin,
    LoginChargeCount = 0,
    LoginChargeNum = 0,
    AccChargeCount = 0,
    do({m_var, Ver + 1, LastResetTime, LastResetDay,
	LastResetFive, LastResetWeek, LastAccTime, AccTime,
	LoginChargeCount, AccChargeCount, LoginChargeNum,
	DayLogin, AccLoginCount, TotalAccTime, AccDays,
	BestDays, NowDays, MonthDays, DayVars, FiveVars,
	WeekVars, MonthVars, TimeoutVars, AccVars, OtherVars,
	WeekFiveVars, WeekFiveTime});
do(MVar = #m_var{ver = 3}) -> {ok, MVar};
do(_) -> {false, lang:get(<<"版本转换失败"/utf8>>)}.


