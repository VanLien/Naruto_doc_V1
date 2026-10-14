-file("src/mod/recruit/recruit_ver.erl", 1).

-module(recruit_ver).

-lager_records([{recruit_limit, [key, info]},
		{holiday_info, [camp_id, stats, ext]},
		{recruit_info, [group_id, stats, ext]},
		{m_recruit_award, [ver, list]},
		{m_recruit,
		 [ver, free_cd_end, list, convert_list, convert_state,
		  holiday_list, holy_eqm_lottery, logs,
		  holiday_sprite_lottery_list, lucky_sprites,
		  lucky_holy_eqm, all_score]}]).

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

-file("src/mod/recruit/recruit_ver.erl", 11).

-file("inc/recruit.hrl", 1).

-record(m_recruit,
	{ver = 7, free_cd_end = 0, list = [], convert_list = [],
	 convert_state = [], holiday_list = [],
	 holy_eqm_lottery = [], logs = [],
	 holiday_sprite_lottery_list = [], lucky_sprites = [],
	 lucky_holy_eqm = [], all_score = 0}).

-record(m_recruit_award, {ver = 1, list = []}).

-record(recruit_info,
	{group_id = 0, stats = #{}, ext = #{}}).

-record(holiday_info,
	{camp_id = 0, stats = #{}, ext = #{}}).

-record(recruit_limit, {key, info = #{}}).

-file("src/mod/recruit/recruit_ver.erl", 12).

do({m_recruit, Ver = 1, FreeCdEnd, List, ConvertList,
    ConvertState}) ->
    NewVer = Ver + 1,
    MRecruit = {m_recruit, NewVer, FreeCdEnd, List,
		ConvertList, ConvertState, []},
    do(MRecruit);
do({m_recruit, Ver = 2, FreeCdEnd, List, ConvertList,
    ConvertState, HolidayList}) ->
    NewVer = Ver + 1,
    HolyEqmLottery = [],
    Logs = [],
    MRecruit = {m_recruit, NewVer, FreeCdEnd, List,
		ConvertList, ConvertState, HolidayList, HolyEqmLottery,
		Logs},
    do(MRecruit);
do({m_recruit, Ver = 3, FreeCdEnd, List, ConvertList,
    ConvertState, HolidayList, HolyEqmLottery, Logs}) ->
    NewVer = Ver + 1,
    HolidaySpriteLotteryList = [],
    MRecruit = {m_recruit, NewVer, FreeCdEnd, List,
		ConvertList, ConvertState, HolidayList, HolyEqmLottery,
		Logs, HolidaySpriteLotteryList},
    do(MRecruit);
do({m_recruit, Ver = 4, FreeCdEnd, List, ConvertList,
    ConvertState, HolidayList, HolyEqmLottery, Logs,
    HolidaySpriteLotteryList}) ->
    NewVer = Ver + 1,
    SpriteLuckyIds = [],
    MRecruit = {m_recruit, NewVer, FreeCdEnd, List,
		ConvertList, ConvertState, HolidayList, HolyEqmLottery,
		Logs, HolidaySpriteLotteryList, SpriteLuckyIds},
    do(MRecruit);
do({m_recruit, Ver = 5, FreeCdEnd, List, ConvertList,
    ConvertState, HolidayList, HolyEqmLottery, Logs,
    HolidaySpriteLotteryList, SpriteLuckyIds}) ->
    NewVer = Ver + 1,
    HolyEqmLuckyIds = [],
    MRecruit = {m_recruit, NewVer, FreeCdEnd, List,
		ConvertList, ConvertState, HolidayList, HolyEqmLottery,
		Logs, HolidaySpriteLotteryList, SpriteLuckyIds,
		HolyEqmLuckyIds},
    do(MRecruit);
do({m_recruit, Ver = 6, FreeCdEnd, List, ConvertList,
    ConvertState, HolidayList, HolyEqmLottery, Logs,
    HolidaySpriteLotteryList, SpriteLuckyIds,
    HolyEqmLuckyIds}) ->
    NewVer = Ver + 1,
    AllScore = 0,
    MRecruit = {m_recruit, NewVer, FreeCdEnd, List,
		ConvertList, ConvertState, HolidayList, HolyEqmLottery,
		Logs, HolidaySpriteLotteryList, SpriteLuckyIds,
		HolyEqmLuckyIds, AllScore},
    do(MRecruit);
do(MRecruit = #m_recruit{ver = 7}) -> {ok, MRecruit};
do(MRecruit) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidrecruit_ver52, _,
       {__Levelrecruit_ver52, __Tracesrecruit_ver52}}
	  when __Levelrecruit_ver52 band 8 /= 0 orelse
		 __Tracesrecruit_ver52 /= [] ->
	  lager:do_log(error,
		       [{module, recruit_ver}, {function, do}, {line, 52},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的旧数据:~w", [MRecruit]), none, 4096, 8,
		       __Levelrecruit_ver52, __Tracesrecruit_ver52,
		       lager_event, __Pidrecruit_ver52);
      _ -> ok
    end,
    {false, lang:get(<<"召唤数据转换失败"/utf8>>)}.


