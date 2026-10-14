-file("src/mod/home/home_ver.erl", 1).

-module(home_ver).

-lager_records([{home_unit_data,
		 [bid, name, type, dir, set_id, soft, tile_list_1,
		  tile_list_2, effect_count]},
		{home_role_rank, [id, rank]},
		{home_rank_rc,
		 [id, name, lev, face, avatar_bid, time, cache_time,
		  worship_num, visit_num, soft, score, rank,
		  face_update_time, face_file]},
		{home_unit_set, [set_id, reward, collect]},
		{home_rand_visit,
		 [id, name, lev, sex, face, power, last_login, soft,
		  face_update_time, face_file]},
		{home_log,
		 [id, name, face, lev, is_friend, type, time, int_args,
		  str_args, face_update_time, face_file]},
		{home_visitor, [id, name, look_id, time, is_leave]},
		{home_unit, [ver, bid, index, dir]},
		{home_ext, [id, visitors, log]},
		{home_floor,
		 [floor, wall_bid, land_bid, soft, home_unit]},
		{home,
		 [ver, id, name, look_id, bid, wall_bid, land_bid, soft,
		  home_unit, floor_list, log, open_floor, main_floor]},
		{m_home,
		 [ver, num, buy_num, list, day_visitors, soft, max_soft,
		  look_id, look_list, last_visitors, worship,
		  worship_list, rand_list, last_rand_time, set_list,
		  last_hook_time, acc_hook_time, acc_hook_items,
		  open_floor, floor_list, main_floor, max_sum_soft]}]).

-export([do/1, do_home/1]).

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

-file("src/mod/home/home_ver.erl", 12).

-file("inc/home.hrl", 1).

-record(m_home,
	{ver = 3, num = 0, buy_num = 0, list = [],
	 day_visitors = [], soft = 0, max_soft = 0, look_id = 0,
	 look_list = [], last_visitors = {0, <<>>}, worship = 0,
	 worship_list = [], rand_list = [], last_rand_time = 0,
	 set_list = [], last_hook_time = 0, acc_hook_time = 0,
	 acc_hook_items = [], open_floor = [], floor_list = [],
	 main_floor = 0, max_sum_soft = 0}).

-record(home,
	{ver = 2, id = {0, <<>>}, name = <<>>, look_id = 0,
	 bid = 0, wall_bid = 0, land_bid = 0, soft = 0,
	 home_unit = [], floor_list = [], log = [],
	 open_floor = [1], main_floor = 1}).

-record(home_floor,
	{floor = 0, wall_bid = 0, land_bid = 0, soft = 0,
	 home_unit = []}).

-record(home_ext,
	{id = {0, <<>>}, visitors = [], log = []}).

-record(home_unit,
	{ver = 1, bid = 0  :: non_neg_integer(),
	 index = 0  :: non_neg_integer(), dir = 1  :: 1..2}).

-record(home_visitor,
	{id = {0, <<>>}, name = <<>>, look_id = 0, time = 0,
	 is_leave = 0}).

-record(home_log,
	{id = {0, <<>>}, name = <<>>, face = 0, lev = 0,
	 is_friend = 0, type = 0, time = 0, int_args = [],
	 str_args = [], face_update_time = 0, face_file = <<>>}).

-record(home_rand_visit,
	{id = {0, <<>>}, name = <<>>, lev = 0, sex = 0,
	 face = 0, power = 0, last_login = 0, soft = 0,
	 face_update_time = 0, face_file = <<>>}).

-record(home_unit_set,
	{set_id = 0, reward = [], collect = []}).

-record(home_rank_rc,
	{id = {0, <<>>}, name = <<>>, lev = 0, face = 0,
	 avatar_bid = 0, time = 0, cache_time = 0,
	 worship_num = 0, visit_num = 0, soft = 0, score = 0,
	 rank = 0, face_update_time = 0, face_file = <<>>}).

-record(home_role_rank, {id = {0, <<>>}, rank = 0}).

-record(home_unit_data,
	{bid = 0, name = <<>>, type = 0, dir = 1, set_id = 0,
	 soft = 0, tile_list_1 = [], tile_list_2 = [],
	 effect_count = 1}).

-file("src/mod/home/home_ver.erl", 13).

do({m_home, Ver = 1, Num, BuyNum, List, Programme, Soft,
    MaxSoft, LookId, LookList, LastVisitors, Worship,
    WorshipList, RandList, LastRandTime, SetList,
    LastHookTime, AccHookTime}) ->
    AccHookItems = [],
    MHome = {m_home, Ver + 1, Num, BuyNum, List, Programme,
	     Soft, MaxSoft, LookId, LookList, LastVisitors, Worship,
	     WorshipList, RandList, LastRandTime, SetList,
	     LastHookTime, AccHookTime, AccHookItems},
    do(MHome);
do({m_home, Ver = 2, Num, BuyNum, List, Programme, Soft,
    MaxSoft, LookId, LookList, LastVisitors, Worship,
    WorshipList, RandList, LastRandTime, SetList,
    LastHookTime, AccHookTime, AccHookItems}) ->
    OpenFloor = util:if_true(LookId =/= 0 andalso
			       List =/= [],
			     [1], []),
    FloorList = [],
    MainFloor = util:if_true(LookId =/= 0 andalso
			       List =/= [],
			     1, 0),
    MaxSumSoft = MaxSoft,
    MHome = {m_home, Ver + 1, Num, BuyNum, List, Programme,
	     Soft, MaxSoft, LookId, LookList, LastVisitors, Worship,
	     WorshipList, RandList, LastRandTime, SetList,
	     LastHookTime, AccHookTime, AccHookItems, OpenFloor,
	     FloorList, MainFloor, MaxSumSoft},
    do(MHome);
do(MHome = #m_home{ver = 3}) -> {ok, MHome};
do(MHome) ->
    case {whereis(lager_event), whereis(lager_event),
	  lager_config:get({lager_event, loglevel}, {0, []})}
	of
      {undefined, undefined, _} ->
	  fun () -> {error, lager_not_running} end();
      {undefined, _, _} ->
	  fun () -> {error, {sink_not_configured, lager_event}}
	  end();
      {__Pidhome_ver34, _,
       {__Levelhome_ver34, __Traceshome_ver34}}
	  when __Levelhome_ver34 band 8 /= 0 orelse
		 __Traceshome_ver34 /= [] ->
	  lager:do_log(error,
		       [{module, home_ver}, {function, do}, {line, 34},
			{pid, pid_to_list(self())}, {node, node()}
			| lager:md()],
		       io_lib:format("未知的旧数据:~w", [MHome]), none, 4096, 8,
		       __Levelhome_ver34, __Traceshome_ver34, lager_event,
		       __Pidhome_ver34);
      _ -> ok
    end,
    {false, lang:get(<<"家园数据转换失败"/utf8>>)}.

do_home({home, Ver = 1, Id, Name, LookId, Bid, WallBid,
	 LandBid, Soft, HomeUnit, OtherFloor, Log}) ->
    OpenFloor = [1],
    NowFloor = 1,
    Home = {home, Ver + 1, Id, Name, LookId, Bid, WallBid,
	    LandBid, Soft, HomeUnit, OtherFloor, Log, OpenFloor,
	    NowFloor},
    do_home(Home);
do_home(Home = #home{ver = 2}) -> {ok, Home}.


