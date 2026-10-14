-file("src/mod/charge/charge_ver.erl", 1).

-module(charge_ver).

-lager_records([{triple_rebate_data,
		 [id, charge_sum, reward_times, mail_title,
		  mail_content]},
		{charge_data,
		 [id, name, val, gold, first_add, add, vip_exp, pic,
		  is_show, is_iosverify, type, items]},
		{m_charge,
		 [ver, charge_list, first_gift, triple_rebate_list,
		  merge_count, merge_charge_list, day_gift, week_refresh,
		  week_gift, month_refresh, month_gift, day_first_gift,
		  first_gift_ver, choose_first_gift_status,
		  reset_charge_list, warehouse_charge_list]}]).

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

-file("src/mod/charge/charge_ver.erl", 15).

-file("inc/charge.hrl", 1).

-record(m_charge,
	{ver = 9, charge_list = [], first_gift = [],
	 triple_rebate_list = [], merge_count = 0,
	 merge_charge_list = [], day_gift = [], week_refresh = 0,
	 week_gift = [], month_refresh = 0, month_gift = [],
	 day_first_gift = {0, 0}, first_gift_ver = 0,
	 choose_first_gift_status = 0, reset_charge_list = [],
	 warehouse_charge_list = []}).

-record(charge_data,
	{id = 0  :: non_neg_integer(),
	 name = <<>>  :: bitstring(), val = 0  :: float(),
	 gold = 0  :: non_neg_integer(),
	 first_add = 0  :: non_neg_integer(),
	 add = 0  :: non_neg_integer(),
	 vip_exp = 0  :: non_neg_integer(),
	 pic = 0  :: non_neg_integer(), is_show = 0  :: 0..1,
	 is_iosverify = 1  :: 0..1,
	 type = 0  :: non_neg_integer(), items = []  :: list()}).

-record(triple_rebate_data,
	{id = 0  :: non_neg_integer(),
	 charge_sum = 0  :: bitstring(),
	 reward_times = 0  :: non_neg_integer(),
	 mail_title = <<>>  :: bitstring(),
	 mail_content = <<>>  :: bitstring()}).

-file("src/mod/charge/charge_ver.erl", 16).

do({m_charge, Ver = 5, ChargeList, FirstGift,
    TripleRebateList, MergeCount, MergeChargeList, DayGift,
    WeekRefresh, WeekGift, MonthRefresh, MonthGift}) ->
    DayFirstGift = {0, 0},
    do({m_charge, Ver + 1, ChargeList, FirstGift,
	TripleRebateList, MergeCount, MergeChargeList, DayGift,
	WeekRefresh, WeekGift, MonthRefresh, MonthGift,
	DayFirstGift});
do({m_charge, Ver = 6, ChargeList, FirstGift,
    TripleRebateList, MergeCount, MergeChargeList, DayGift,
    WeekRefresh, WeekGift, MonthRefresh, MonthGift,
    DayFirstGift}) ->
    FirstGiftVer = 0,
    IsChooseFirstGift = 0,
    do({m_charge, Ver + 1, ChargeList, FirstGift,
	TripleRebateList, MergeCount, MergeChargeList, DayGift,
	WeekRefresh, WeekGift, MonthRefresh, MonthGift,
	DayFirstGift, FirstGiftVer, IsChooseFirstGift});
do({m_charge, Ver = 7, ChargeList, FirstGift,
    TripleRebateList, MergeCount, MergeChargeList, DayGift,
    WeekRefresh, WeekGift, MonthRefresh, MonthGift,
    DayFirstGift, FirstGiftVer, IsChooseFirstGift}) ->
    ResetChargeList = [],
    do({m_charge, Ver + 1, ChargeList, FirstGift,
	TripleRebateList, MergeCount, MergeChargeList, DayGift,
	WeekRefresh, WeekGift, MonthRefresh, MonthGift,
	DayFirstGift, FirstGiftVer, IsChooseFirstGift,
	ResetChargeList});
do({m_charge, Ver = 8, ChargeList, FirstGift,
    TripleRebateList, MergeCount, MergeChargeList, DayGift,
    WeekRefresh, WeekGift, MonthRefresh, MonthGift,
    DayFirstGift, FirstGiftVer, IsChooseFirstGift,
    ResetChargeList}) ->
    WareHouseChargeList = [],
    do({m_charge, Ver + 1, ChargeList, FirstGift,
	TripleRebateList, MergeCount, MergeChargeList, DayGift,
	WeekRefresh, WeekGift, MonthRefresh, MonthGift,
	DayFirstGift, FirstGiftVer, IsChooseFirstGift,
	ResetChargeList, WareHouseChargeList});
do(MCharge = #m_charge{ver = 9}) -> {ok, MCharge};
do(MCharge) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidcharge_ver33, _,
       {__Levelcharge_ver33, __Tracescharge_ver33}}
	  when __Levelcharge_ver33 band 8 /= 0 orelse
		 __Tracescharge_ver33 /= [] ->
	  lager:do_log(error,
		       [{module, charge_ver}, {function, do}, {line, 33},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的旧数据:~w", [MCharge]), none, 4096, 8,
		       __Levelcharge_ver33, __Tracescharge_ver33, lager_event,
		       __Pidcharge_ver33);
      _ -> ok
    end,
    {ok, MCharge}.


