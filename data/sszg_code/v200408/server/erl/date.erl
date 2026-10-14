-file("src/lib/date.erl", 1).

-module(date).

-lager_records([{role_var, [id, vars]},
		{m_var,
		 [ver, last_reset_time, last_reset_day, last_reset_five,
		  last_reset_week, last_acc_time, acc_time,
		  login_charge_count, acc_charge_count, login_charge_num,
		  day_login, acc_login_count, total_acc_time, acc_days,
		  best_days, now_days, month_days, day_vars, five_vars,
		  week_vars, month_vars, timeout_vars, acc_vars,
		  other_vars, week_five_vars, week_five_time]}]).

-export([now/0, unixtime/0, unixtime/1, time_sec/1,
	 next_hour/0, is_valid/2, is_same_day/2, now_diff/2,
	 next_diff/3, next_diff/2, next_diff/1, week_next_diff/2,
	 week_next_diff/3, diff/2, diff/3, day_diff/2,
	 time_left/2, datetime_to_seconds/1,
	 seconds_to_datetime/1, is_today/1, is_today_five/1,
	 is_same_week/2, is_same_week/3, is_same_month/2,
	 is_same_month/3, day_of_the_week/0, day_of_the_week/1,
	 day_of_the_week/3, open_srv_day/0, parse_time/1,
	 parse_time/2, local_stamp/0, parse_str_date/1,
	 parse_str_time/1, next_time_correction/1,
	 next_time_correction/2, unixtime_utc/0,
	 datetime_to_seconds_utc/1, seconds_to_datetime_utc/1]).

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

-file("src/lib/date.erl", 54).

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

-file("src/lib/date.erl", 55).

-spec now() -> {non_neg_integer(), non_neg_integer(),
		non_neg_integer()}.

now() -> os:timestamp().

-spec unixtime() -> pos_integer().

unixtime() -> {M, S, _} = date:now(), M * 1000000 + S.

-spec unixtime(X) -> pos_integer() when X :: ms | zero |
					     {zero, pos_integer()} |
					     {next_day, pos_integer()}.

unixtime(ms) ->
    {S1, S2, S3} = date:now(),
    trunc(S1 * 1000000000 + S2 * 1000 + S3 / 1000);
unixtime(zero) -> var:date_var(zero);
unixtime({zero, Ts}) ->
    Base = unixtime(zero),
    case Ts > Base of
      false -> Base - util:ceil((Base - Ts) / 86400) * 86400;
      true -> (Ts - Base) div 86400 * 86400 + Base
    end;
unixtime({five, Ts}) -> unixtime({zero, Ts}) + 3600 * 5;
unixtime({next_day, Ts}) ->
    unixtime({zero, Ts}) + 86400;
unixtime({next_time, DayTs}) ->
    Now = unixtime(), NextT = next_diff(DayTs), Now + NextT;
unixtime({month, {D, H, M, S}}) ->
    var:date_var(month_start) + 86400 * (D - 1) + 3600 * H +
      60 * M
      + S;
unixtime({next_month, {D, H, M, S}}) ->
    var:date_var(next_month_start) + 86400 * (D - 1) +
      3600 * H
      + 60 * M
      + S;
unixtime({month_time, {D, H, M, S}}) ->
    Now = unixtime(),
    Month = unixtime({month, {D, H, M, S}}),
    case Month > Now of
      true -> Month;
      _ -> unixtime({next_month, {D, H, M, S}})
    end.

-spec time_sec(tuple()) -> pos_integer().

time_sec({Day, Hour, Minu, Sec}) ->
    86400 * Day + 3600 * Hour + 60 * Minu + Sec;
time_sec({Hour, Minu, Sec}) ->
    3600 * Hour + 60 * Minu + Sec.

-spec next_hour() -> pos_integer().

next_hour() ->
    {_, Min, Sec} = time(), 3600 - Min * 60 - Sec.

-spec open_srv_day() -> non_neg_integer().

open_srv_day() ->
    day_diff(sys_env:get(open_timestamp_zero), unixtime()) +
      1.

-spec diff(atom(), pos_integer()) -> pos_integer().

diff(T, Ts) -> diff(T, Ts, unixtime(ms)).

-spec diff(atom(), pos_integer(),
	   pos_integer()) -> pos_integer().

diff(second, Ts1, Ts2) -> Ts1 - Ts2;
diff(minute, Ts1, Ts2) -> trunc((Ts1 - Ts2) / 60);
diff(hour, Ts1, Ts2) -> trunc((Ts1 - Ts2) / 3600);
diff(day, Ts1, Ts2) -> trunc((Ts1 - Ts2) / 86400).

day_diff(FromTime, ToTime) when ToTime > FromTime ->
    FromDate = unixtime({zero, FromTime}),
    ToDate = unixtime({zero, ToTime}),
    case (ToDate - FromDate) / (3600 * 24) of
      Diff when Diff < 0 -> 0;
      Diff -> round(Diff)
    end;
day_diff(FromTime, ToTime) when ToTime =:= FromTime ->
    0;
day_diff(FromTime, ToTime) ->
    day_diff(ToTime, FromTime).

-spec next_diff(H, M, S) -> Seconds when H :: 0..23,
					 M :: 0..59, S :: 0..59,
					 Seconds :: pos_integer().

next_diff(H, M, S) ->
    Sec = H * 3600 + M * 60 + S, next_diff(Sec).

-spec next_diff(0..86400 | [0..86400]) -> Seconds ::
					      pos_integer().

next_diff(L = [_ | _]) ->
    lists:min([next_diff(Sec) || Sec <- L]);
next_diff({H, M, S}) -> next_diff(H, M, S);
next_diff(Sec) ->
    DaySec = calendar:time_to_seconds(time()),
    case Sec > DaySec of
      true -> Sec - DaySec;
      false -> Sec + 86400 - DaySec
    end.

next_diff(Sec, T) ->
    Zero = unixtime({zero, T}),
    Base = Zero + Sec,
    case Base > T of
      true -> Base - T;
      false -> Base + 86400 - T
    end.

-spec week_next_diff([1..7],
		     0..86400 | [0..86400]) -> Seconds :: pos_integer().

week_next_diff([1, 2, 3, 4, 5, 6, 7], SecL) ->
    next_diff(SecL);
week_next_diff(WeekDays, SecL = [_ | _]) ->
    Now = unixtime(),
    lists:min([week_next_diff(WeekDays, Now, Sec)
	       || Sec <- SecL]);
week_next_diff(WeekDays = [_ | _], 86400) ->
    week_next_diff(WeekDays, 86399) + 1;
week_next_diff(WeekDays = [_ | _], Sec) ->
    Now = unixtime(), week_next_diff(WeekDays, Now, Sec).

week_next_diff([1, 2, 3, 4, 5, 6, 7], _T, SecL) ->
    next_diff(SecL);
week_next_diff(WeekDays = [_ | _], T, Sec) ->
    NextT = next_diff(Sec),
    WeekDay = day_of_the_week(T + NextT),
    do_week_next_diff(WeekDay, WeekDays, NextT, 0).

do_week_next_diff(_WeekDay, _WeekDays, _NextT, N)
    when N > 7 ->
    io:format("[~w:~w]error:WeekDays:~w",
	      [date, 223, _WeekDays]),
    0;
do_week_next_diff(WeekDay, WeekDays, NextT, N) ->
    case lists:member(WeekDay, WeekDays) of
      true -> NextT;
      false when WeekDay >= 7 ->
	  do_week_next_diff(1, WeekDays, NextT + 86400, N + 1);
      false ->
	  do_week_next_diff(WeekDay + 1, WeekDays, NextT + 86400,
			    N + 1)
    end.

-spec now_diff(N, {H, I, S}) -> integer() when N ::
						   today | tomorrow |
						   non_neg_integer(),
					       H :: 0..23, I :: 0..59,
					       S :: 0..59.

now_diff(today, {H, I, S}) -> now_diff(0, {H, I, S});
now_diff(tomorrow, {H, I, S}) -> now_diff(1, {H, I, S});
now_diff(N, {H, I, S}) when is_integer(N), N >= 0 ->
    {_, Time} = calendar:local_time(),
    N * 86400 + calendar:time_to_seconds({H, I, S}) -
      calendar:time_to_seconds(Time).

-spec is_valid(T, Datetime) -> boolean() when T ::
						  date | time | datetime,
					      Datetime :: {Y, M, D} |
							  {H, I, S} |
							  {{Y, M, D},
							   {H, I, S}},
					      Y :: pos_integer(),
					      M :: pos_integer(),
					      D :: pos_integer(),
					      H :: non_neg_integer(),
					      I :: non_neg_integer(),
					      S :: non_neg_integer().

is_valid(date, Date) -> calendar:valid_date(Date);
is_valid(time, {H, I, S}) ->
    H >= 0 andalso
      H < 24 andalso
	I >= 0 andalso I < 60 andalso S >= 0 andalso S < 60;
is_valid(datetime, {Date, Time}) ->
    calendar:valid_date(Date) andalso is_valid(time, Time);
is_valid(_, _) -> false.

time_left(TimeMax, Begin) ->
    TL = util:floor(TimeMax -
		      timer:now_diff(erlang:timestamp(), Begin) / 1000),
    case TL > 0 of
      true -> TL;
      false -> 0
    end.

-spec is_same_day(Ts1, Ts2) -> boolean() when Ts1 ::
						  pos_integer(),
					      Ts2 :: pos_integer().

is_same_day(Ts1, Ts2) when Ts2 > Ts1 ->
    is_same_day(Ts2, Ts1);
is_same_day(Ts1, Ts2) when Ts1 - Ts2 > 86400 -> false;
is_same_day(Ts1, Ts2) ->
    unixtime({zero, Ts1}) =:= unixtime({zero, Ts2}).

-spec is_today(pos_integer()) -> boolean().

is_today(0) -> false;
is_today(Unixtime) ->
    unixtime(zero) =:= unixtime({zero, Unixtime}).

-spec is_today_five(pos_integer()) -> boolean().

is_today_five(0) -> false;
is_today_five(Unixtime) ->
    unixtime({zero, unixtime() - 3600 * 5}) =:=
      unixtime({zero, Unixtime - 3600 * 5}).

is_same_week(Ts1, Ts2) -> is_same_week(Ts1, Ts2, 0).

is_same_week(Ts1, Ts2, OffSet) when Ts1 > Ts2 ->
    is_same_week(Ts2, Ts1, OffSet);
is_same_week(Ts1, Ts2, _OffSet)
    when Ts2 - Ts1 >= 604800 ->
    false;
is_same_week(Ts1, Ts2, OffSet) ->
    BaseT = 1388937600 + OffSet,
    WeekS = 604800,
    W1 = (Ts1 - BaseT) div WeekS,
    W2 = (Ts2 - BaseT) div WeekS,
    W1 =:= W2.

is_same_month(Ts1, Ts2) -> is_same_month(Ts1, Ts2, 0).

is_same_month({{Y, M, _}, _}, {{Y, M, _}, _}, 0) ->
    true;
is_same_month({_, _}, {_, _}, 0) -> false;
is_same_month({{Y, M, D1}, {Hour1, Min1, Sec1}},
	      {{Y, M, D2}, {Hour2, Min2, Sec2}}, OffSet) ->
    T1 = D1 * 86400 + 3600 * Hour1 + Min1 * 60 + Sec1,
    T2 = D2 * 86400 + 3600 * Hour2 + Min2 * 60 + Sec2,
    T1 =< OffSet andalso T2 =< OffSet orelse
      T1 >= OffSet andalso T2 >= OffSet;
is_same_month(Dt1 = {{Y1, M1, _}, _},
	      Dt2 = {{Y2, M2, _}, _}, OffSet)
    when Y1 > Y2 orelse Y1 =:= Y2 andalso M1 > M2 ->
    is_same_month(Dt2, Dt1, OffSet);
is_same_month({{Y1, M1, D1}, {Hour1, Min1, Sec1}},
	      {{Y2, M2, D2}, {Hour2, Min2, Sec2}}, OffSet)
    when Y1 =:= Y2 andalso M1 + 1 =:= M2 orelse
	   Y1 + 1 =:= Y2 andalso M1 =:= 12 andalso M2 =:= 1 ->
    T1 = D1 * 86400 + 3600 * Hour1 + Min1 * 60 + Sec1,
    T2 = D2 * 86400 + 3600 * Hour2 + Min2 * 60 + Sec2,
    T1 > OffSet andalso T2 =< OffSet;
is_same_month(Ts1, Ts2, OffSet)
    when is_integer(Ts1) andalso is_integer(Ts2) ->
    Dt1 = date:seconds_to_datetime(Ts1),
    Dt2 = date:seconds_to_datetime(Ts2),
    is_same_month(Dt1, Dt2, OffSet);
is_same_month(_Dt1, _Dt2, _OffSet) -> false.

-spec datetime_to_seconds(DateTime) -> false |
				       Seconds when DateTime :: {{Y, M, D},
								 {H, M, S}},
						    Y :: pos_integer(),
						    M :: 1..12, D :: 1..31,
						    H :: 0..23, M :: 0..59,
						    S :: 0..59,
						    Seconds :: pos_integer().

datetime_to_seconds({Year, Month, Day, Hour, Minute,
		     Second}) ->
    datetime_to_seconds({{Year, Month, Day},
			 {Hour, Minute, Second}});
datetime_to_seconds(DateTime) ->
    case catch ets:lookup(date_parse, DateTime) of
      [{_, T}] when is_integer(T) -> T;
      _ ->
	  T =
	      calendar:datetime_to_gregorian_seconds(erlang:localtime_to_universaltime(DateTime))
		- 62167219200,
	  catch ets:insert(date_parse, {DateTime, T}),
	  T
    end.

-spec seconds_to_datetime(Unixtime) -> {{Y ::
					     non_neg_integer(),
					 M :: non_neg_integer(),
					 D :: non_neg_integer()},
					{HH :: non_neg_integer(),
					 MM :: non_neg_integer,
					 SS ::
					     non_neg_integer()}} when Unixtime ::
									  non_neg_integer().

seconds_to_datetime(Unixtime) ->
    erlang:universaltime_to_localtime(calendar:gregorian_seconds_to_datetime(Unixtime
									       +
									       62167219200)).

local_stamp() ->
    case get(local_stamp) of
      T when is_integer(T) -> T;
      _ ->
	  Local = erlang:universaltime_to_localtime({{1970, 1, 1},
						     {0, 0, 0}}),
	  T = calendar:datetime_to_gregorian_seconds(Local),
	  put(local_stamp, T),
	  T
    end.

next_time_correction(Sec) -> Sec.

next_time_correction(_, Sec) -> Sec.

unixtime_utc() ->
    datetime_to_seconds_utc(calendar:universal_time()).

datetime_to_seconds_utc(DateTime) ->
    calendar:datetime_to_gregorian_seconds(DateTime) -
      62167219200.

seconds_to_datetime_utc(Timestamp) ->
    calendar:gregorian_seconds_to_datetime(Timestamp +
					     62167219200).

-spec day_of_the_week() -> 1..7.

day_of_the_week() -> day_of_the_week(date()).

-spec day_of_the_week(Unixtime :: non_neg_integer() |
				  {Y :: pos_integer(), M :: pos_integer(),
				   D :: pos_integer()}) -> 1..7.

day_of_the_week({Y, M, D}) -> day_of_the_week(Y, M, D);
day_of_the_week(Unixtime) ->
    {{Y, M, D}, _} = seconds_to_datetime(Unixtime),
    day_of_the_week(Y, M, D).

-spec day_of_the_week(Year :: non_neg_integer(),
		      Month :: non_neg_integer(),
		      Day :: non_neg_integer()) -> 1..7.

day_of_the_week(Year, Month, Day) ->
    (date_to_gregorian_days(Year, Month, Day) + 5) rem 7 +
      1.

date_to_gregorian_days(Year, Month, Day)
    when is_integer(Day), Day > 0 ->
    Last = last_day_of_the_month(Year, Month),
    if Day =< Last ->
	   dy(Year) + dm(Month) + df(Year, Month) + Day - 1
    end.

last_day_of_the_month(Year, Month)
    when is_integer(Year), Year >= 0 ->
    do_last_day_of_the_month(Year, Month).

do_last_day_of_the_month(_, 4) -> 30;
do_last_day_of_the_month(_, 6) -> 30;
do_last_day_of_the_month(_, 9) -> 30;
do_last_day_of_the_month(_, 11) -> 30;
do_last_day_of_the_month(Y, 2) ->
    case is_leap_year(Y) of
      true -> 29;
      false -> 28
    end;
do_last_day_of_the_month(_, M)
    when is_integer(M), M > 0, M < 13 ->
    31.

is_leap_year(Year)
    when Year rem 4 =:= 0, Year rem 100 > 0 ->
    true;
is_leap_year(Year) when Year rem 400 =:= 0 -> true;
is_leap_year(_) -> false.

dy(Year) when Year =< 0 -> 0;
dy(Year) ->
    X = Year - 1,
    X div 4 - X div 100 + X div 400 + X * 365 + 366.

dm(1) -> 0;
dm(2) -> 31;
dm(3) -> 59;
dm(4) -> 90;
dm(5) -> 120;
dm(6) -> 151;
dm(7) -> 181;
dm(8) -> 212;
dm(9) -> 243;
dm(10) -> 273;
dm(11) -> 304;
dm(12) -> 334.

df(_, Month) when Month < 3 -> 0;
df(Year, _) ->
    case is_leap_year(Year) of
      true -> 1;
      false -> 0
    end.

-spec parse_time(term()) -> non_neg_integer().

parse_time({day, OffSet}) ->
    var:date_var(zero) + OffSet;
parse_time({open_day, T}) ->
    sys_env:get(open_timestamp_zero) + (T - 1) * 86400;
parse_time({open_day, T, OffSet}) ->
    sys_env:get(open_timestamp_zero) + (T - 1) * 86400 +
      OffSet;
parse_time({merge_day, T}) ->
    sys_env:get(merge_timestamp_zero) + (T - 1) * 86400;
parse_time({merge_day, T, OffSet}) ->
    sys_env:get(merge_timestamp_zero) + (T - 1) * 86400 +
      OffSet;
parse_time(T) when is_integer(T) -> T;
parse_time({Year, Month, Day, Hour, Minute, Second}) ->
    datetime_to_seconds({{Year, Month, Day},
			 {Hour, Minute, Second}});
parse_time({{Year, Month, Day},
	    {Hour, Minute, Second}}) ->
    datetime_to_seconds({{Year, Month, Day},
			 {Hour, Minute, Second}});
parse_time(T) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Piddate513, _, {__Leveldate513, __Tracesdate513}}
	  when __Leveldate513 band 8 /= 0 orelse
		 __Tracesdate513 /= [] ->
	  lager:do_log(error,
		       [{module, date}, {function, parse_time}, {line, 513},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("错误的时间格式：~w", [T]), none, 4096, 8,
		       __Leveldate513, __Tracesdate513, lager_event,
		       __Piddate513);
      _ -> ok
    end,
    -0.

-spec parse_time(any(), any()) -> {non_neg_integer(),
				   non_neg_integer()}.

parse_time({week, Sday, SOffSet},
	   {week, Eday, EOffSet}) ->
    Week = var:date_var(week_day),
    ZeroT = date:unixtime(zero),
    if Sday =< Eday andalso
	 Week >= Sday andalso Week =< Eday ->
	   {ZeroT - (Week - Sday) * 86400 + SOffSet,
	    ZeroT + (Eday - Week) * 86400 + EOffSet};
       Sday =< Eday andalso Week < Sday ->
	   {ZeroT + (Sday - Week) * 86400 + SOffSet,
	    ZeroT + (Eday - Week) * 86400 + EOffSet};
       Sday =< Eday ->
	   {ZeroT + (Sday + 7 - Week) * 86400 + SOffSet,
	    ZeroT + (Eday + 7 - Week) * 86400 + EOffSet};
       Week =< Sday andalso Week > Eday ->
	   {ZeroT + (Sday - Week) * 86400 + SOffSet,
	    ZeroT + (Eday + 7 - Week) * 86400 + EOffSet};
       Week >= Sday andalso Week > Eday ->
	   {ZeroT - (Week - Sday) * 86400 + SOffSet,
	    ZeroT + (Eday + 7 - Week) * 86400 + EOffSet};
       true ->
	   {ZeroT - (Week + 7 - Sday) * 86400 + SOffSet,
	    ZeroT + (Eday - Week) * 86400 + EOffSet}
    end;
parse_time(StartT, EndT) ->
    {parse_time(StartT), parse_time(EndT)}.

parse_str_date(Date) when is_list(Date) ->
    Date1 = string_util:trim(Date, "$ "),
    [Y, M, D] = string:tokens(Date, "-"),
    Date2 = {list_to_integer(Y), list_to_integer(M),
	     list_to_integer(D)},
    case calendar:valid_date(Date1) of
      true -> Date2;
      _ -> false
    end.

parse_str_time(Time) when is_list(Time) ->
    Time1 = string_util:trim(Time, "$ "),
    [H, M, S] = string:tokens(Time1, ":"),
    case check_list([{H, 24}, {M, 60}, {S, 60}]) of
      {_, false} -> false;
      {[H1, M1, S1], true} -> {H1, M1, S1}
    end.

check_list(List) ->
    lists:mapfoldl(fun ({L, N}, B) ->
			   V = list_to_integer(L),
			   if (V >= 0) and (V =< N) -> {V, B};
			      true -> {false, false}
			   end
		   end,
		   true, List).


