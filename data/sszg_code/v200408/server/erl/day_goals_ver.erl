-file("src/mod/holiday_day_goals/day_goals_ver.erl", 1).

-module(day_goals_ver).

-lager_records([{grow_data,
		 [ver, day, goal_id, status, condition, lev, progress,
		  target_type]},
		{m_day_goals,
		 [ver, end_time, num, welfare_list, grow_list,
		  price_list, finish_list, period, charge, old_data,
		  period_day, new_grow_list, lev_reward, old_data2]}]).

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

-file("src/mod/holiday_day_goals/day_goals_ver.erl",
      11).

-file("inc/day_goals.hrl", 1).

-record(m_day_goals,
	{ver = 3, end_time = 0  :: non_neg_integer(),
	 num = 0  :: non_neg_integer(),
	 welfare_list = []  :: list(), grow_list = []  :: list(),
	 price_list = []  :: list(), finish_list = []  :: list(),
	 period = 1  :: list(), charge = 0  :: list(),
	 old_data = [], period_day = 0, new_grow_list = [],
	 lev_reward = [], old_data2 = []}).

-record(grow_data,
	{ver = 2, day = 0  :: non_neg_integer(),
	 goal_id = 0  :: non_neg_integer(),
	 status = 0  :: non_neg_integer(),
	 condition = 0  :: non_neg_integer(),
	 lev = 0  :: non_neg_integer(), progress = []  :: list(),
	 target_type = 1  :: non_neg_integer()}).

-file("src/mod/holiday_day_goals/day_goals_ver.erl",
      12).

do({m_day_goals, Ver = 1, EndTime, Num, WelfareList,
    GrowList, PriceList, FinishList}) ->
    Period = 1,
    Charge = 0,
    OldData = [],
    do({m_day_goals, Ver + 1, EndTime, Num, WelfareList,
	GrowList, PriceList, FinishList, Period, Charge,
	OldData});
do({m_day_goals, Ver = 2, EndTime, Num, WelfareList,
    GrowList, PriceList, FinishList, Period, Charge,
    OldData}) ->
    PeriodDay = 0,
    NewGrowList = [],
    LevReward = [],
    OldData2 = [],
    do({m_day_goals, Ver + 1, EndTime, Num, WelfareList,
	GrowList, PriceList, FinishList, Period, Charge,
	OldData, PeriodDay, NewGrowList, LevReward, OldData2});
do(MDayGoals = #m_day_goals{period = Period,
			    grow_list = GrowList, old_data = OldData})
    when GrowList =/= [] andalso
	   (Period == 2 orelse Period == 3) ->
    {ok,
     MDayGoals#m_day_goals{grow_list = [],
			   old_data = [MDayGoals | OldData]}};
do(MDayGoals = #m_day_goals{grow_list = GrowList}) ->
    NGrowList = [do_grow_data_ver(GrowDataT)
		 || GrowDataT <- GrowList],
    {ok, MDayGoals#m_day_goals{grow_list = NGrowList}};
do(MDayGoals) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidday_goals_ver30, _,
       {__Levelday_goals_ver30, __Tracesday_goals_ver30}}
	  when __Levelday_goals_ver30 band 8 /= 0 orelse
		 __Tracesday_goals_ver30 /= [] ->
	  lager:do_log(error,
		       [{module, day_goals_ver}, {function, do}, {line, 30},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的旧数据:~w", [MDayGoals]), none, 4096, 8,
		       __Levelday_goals_ver30, __Tracesday_goals_ver30,
		       lager_event, __Pidday_goals_ver30);
      _ -> ok
    end,
    {ok, MDayGoals}.

do_grow_data_ver({grow_data, Ver = 1, Day, GoalId,
		  Status, Condition, Lev, Progress}) ->
    do_grow_data_ver({grow_data, Ver + 1, Day, GoalId,
		      Status, Condition, Lev, Progress, 1});
do_grow_data_ver(GrowData = #grow_data{ver = 2}) ->
    GrowData;
do_grow_data_ver(GrowData) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidday_goals_ver38, _,
       {__Levelday_goals_ver38, __Tracesday_goals_ver38}}
	  when __Levelday_goals_ver38 band 8 /= 0 orelse
		 __Tracesday_goals_ver38 /= [] ->
	  lager:do_log(error,
		       [{module, day_goals_ver}, {function, do_grow_data_ver},
			{line, 38}, {pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("错误的七日任务数据:~w", [GrowData]), none, 4096,
		       8, __Levelday_goals_ver38, __Tracesday_goals_ver38,
		       lager_event, __Pidday_goals_ver38);
      _ -> ok
    end,
    GrowData.


